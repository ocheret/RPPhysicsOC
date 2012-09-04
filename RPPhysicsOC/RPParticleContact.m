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
    if (nil != self.particleB) {
        RPVector3SubtractFrom(&relativeVelocity,
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

    // Compute total mass of movable particles (ignore missing or infinite mass
    // particles)
    RPReal massA = (self.particleA.inverseMass > 0) ? self.particleA.mass : 0;
    RPReal massB = (nil != self.particleB && self.particleB.inverseMass > 0) ?
    self.particleB.mass : 0;
    RPReal totalMass = massA + massB;
    if (totalMass == 0) {
        // There are no movable objects to receive an impulse
        return;
    }

    // Calculate the impulse magnitude to apply
    RPReal impulse = deltaSpeed * totalMass;

    // Calculate the impulse along the contact normal
    RPVector3 impulseVector = *self.normalRef;
    RPVector3MultiplyScalarBy(&impulseVector, impulse);

    // Apply impulses
    RPVector3AddScaledVectorTo(self.particleA.velocityRef, &impulseVector,
                               self.particleA.inverseMass);
    if (self.particleB) {
        RPVector3AddScaledVectorTo(self.particleB.velocityRef,
                                   &impulseVector, -self.particleB.inverseMass);
    }
}

- (void)resolveInterpenetrationForDuration:(RPReal)duration
{
    // XXX
}

- (void)resolveForDuration:(RPReal)duration
{
    [self resolveVelocityForDuration:duration];
    [self resolveInterpenetrationForDuration:duration];
}

@end
