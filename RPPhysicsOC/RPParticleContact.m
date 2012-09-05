//
//  RPParticleContact.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/4/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleContact.h"

@implementation RPParticleContact

- (RPVector3 *)normalRef {
    return &_normal;
}

- (RPVector3 *)movementARef {
    return &_movementA;
}

- (RPVector3 *)movementBRef {
    return &_movementB;
}

- (RPParticleContact *)initWithParticle:(RPParticle *)particleA
                               particle:(RPParticle *)particleB
                            restitution:(RPReal)restitution
                                 normal:(RPVector3 *)normal
{
    self = [super init];
    self.particleA = particleA;
    self.particleB = particleB;
    self.restitution = restitution;
    *self.normalRef = *normal;
    return self;
}

- (RPReal)calculateSeparatingSpeed
{
    // Compute relative velocity
    RPVector3 relativeVelocity = *self.particleA.velocityRef;
    if (self.particleB) {
        RPVector3Subtract(&relativeVelocity,
                          self.particleB.velocityRef);
    }

    // Compute the speed along the contact normal
    return RPVector3DotProduct(&relativeVelocity, self.normalRef);
}

- (void)resolveVelocityForDuration:(RPReal)duration
{
    // Find the speed in the direction of the contact normal
    RPReal separatingSpeed = [self calculateSeparatingSpeed];

    // Check if resolution is necessary
    if (separatingSpeed > 0) {
        // The particles are separating or stationary so no impulse is needed
        return;
    }

    // Apply restitution to determine the new separating speed
    RPReal newSeparatingSpeed = -separatingSpeed * self.restitution;

    // What is the change in velocity caused by this contact
    RPReal deltaSpeed = newSeparatingSpeed - separatingSpeed;

    // Compute sum of inverse masses of movable particles (ignore missing or
    // infinite mass particles)
    RPReal totalInverseMass = self.particleA.inverseMass;
    if (self.particleB) {
        totalInverseMass += self.particleB.inverseMass;
    }
    if (totalInverseMass <= 0) {
        // There are no movable objects to receive an impulse
        return;
    }

    // Calculate the impulse magnitude to apply
    RPReal impulse = deltaSpeed / totalInverseMass;

    // Calculate the impulse along the contact normal
    RPVector3 impulseVector = *self.normalRef;
    RPVector3MultiplyScalar(&impulseVector, impulse);

    // Apply impulses
    RPVector3AddScaledVector(self.particleA.velocityRef, &impulseVector,
                             self.particleA.inverseMass);
    if (self.particleB) {
        RPVector3AddScaledVector(self.particleB.velocityRef,
                                 &impulseVector, -self.particleB.inverseMass);
    }
}

- (void)resolveInterpenetrationForDuration:(RPReal)duration
{
    // If there is no penetration then we can skip this step
    if (self.penetration <= 0) {
        return;
    }

    // Compute sum of inverse masses of movable particles (ignore missing or
    // infinite mass particles)
    RPReal totalInverseMass = self.particleA.inverseMass;
    if (self.particleB) {
        totalInverseMass += self.particleB.inverseMass;
    }
    if (totalInverseMass <= 0) {
        // There are no movable objects to adjust
        return;
    }

    // Compute amount of penetration resolution per unit inverse mass
    RPVector3 penetrationDirection = *self.normalRef;
    RPVector3MultiplyScalar(&penetrationDirection,
                            self.penetration / totalInverseMass);

    // Calculate the movement amounts
    RPVector3Clear(self.movementARef);
    RPVector3AddScaledVector(self.movementARef, &penetrationDirection,
                             self.particleA.inverseMass);
    if (self.particleB) {
        RPVector3AddScaledVector(self.movementBRef, &penetrationDirection,
                                 -self.particleB.inverseMass);
    } else {
        RPVector3Clear(self.movementBRef);
    }

    // Apply the pentration resolution
    RPVector3Add(self.particleA.positionRef, self.movementARef);
    if (self.particleB) {
        RPVector3Add(self.particleB.positionRef, self.movementBRef);
    }
}

- (void)resolveForDuration:(RPReal)duration
{
    [self resolveVelocityForDuration:duration];
    [self resolveInterpenetrationForDuration:duration];
}

@end
