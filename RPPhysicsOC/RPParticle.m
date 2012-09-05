//
//  RPParticle.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticle.h"

@implementation RPParticle

- (RPVector3 *)positionRef
{
    return &_position;
}

- (RPVector3 *)velocityRef
{
    return &_velocity;
}

- (RPVector3 *)accelerationRef
{
    return &_acceleration;
}

- (void)setMass:(RPReal)mass
{
    assert(mass != 0);
    self.inverseMass = (RPReal)1.0 / mass;
}

- (RPReal)mass
{
    return (self.inverseMass == 0) ?
        RPReal_MAX : ((RPReal)1.0 / self.inverseMass);
}

- (RPParticle *)initWithPosition:(RPVector3 *)position
                        velocity:(RPVector3 *)velocity
                    acceleration:(RPVector3 *)acceleration
                     inverseMass:(RPReal)inverseMass
                         damping:(RPReal)damping
{
    self = [super init];
    if (position) *self.positionRef = *position;
    if (velocity) *self.velocityRef = *velocity;
    if (acceleration) *self.accelerationRef = *acceleration;
    self.inverseMass = inverseMass;
    self.damping = damping;
    return self;
}

- (void)integrateForDuration:(RPReal)duration
{
    // If mass is infinite then we have an immovable object and we're done
    if (self.inverseMass <= 0.0f) {
        return;
    }

    assert(duration > 0.0f); // XXX - we need to handle errors better

    // Update position based on velocity and duration
    RPVector3AddScaledVector(&_position, &_velocity, duration);

    // Damp the current velocity
    RPVector3MultiplyScalar(&_velocity, RPReal_POW(self.damping, duration));

    // Compute acceleration due to accumulated resultant force
    RPVector3 resultantAcceleration = _acceleration;
    RPVector3AddScaledVector(&resultantAcceleration, &_forceAccumulator,
                             self.inverseMass);

    // Update velocity based on acceleration and duration
    RPVector3AddScaledVector(&_velocity, &resultantAcceleration, duration);

    [self clearAccumulatedForces];
}

- (void)clearAccumulatedForces
{
    RPVector3Clear(&_forceAccumulator);
}

- (void)addForce:(RPVector3 *)force
{
    RPVector3Add(&_forceAccumulator, force);
}

- (BOOL)hasFiniteMass
{
    return self.inverseMass > 0.0f;
}

@end
