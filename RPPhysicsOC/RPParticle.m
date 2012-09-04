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

- (void)integrateForDuration:(RPReal)duration
{
    // If mass is infinite then we have an immovable object and we're done
    if (self.inverseMass <= 0.0f) {
        return;
    }

    assert(duration > 0.0f); // XXX - we need to handle errors better

    // Update position based on velocity and duration
    RPVector3AddScaledVectorTo(&_position, &_velocity, duration);

    // Damp the current velocity
    RPVector3MultiplyScalarBy(&_velocity, RPReal_POW(self.damping, duration));

    // Compute acceleration due to accumulated resultant force
    RPVector3 resultantAcceleration = _acceleration;
    RPVector3AddScaledVectorTo(&resultantAcceleration, &_forceAccumulator,
                               self.inverseMass);

    // Update linear velocity from acceleration
    RPVector3AddScaledVectorTo(&_velocity, &resultantAcceleration, duration);

    // Update velocity based on acceleration and duration
    RPVector3AddScaledVectorTo(&_velocity, &resultantAcceleration, duration);

    [self clearAccumulatedForces];
}

- (void)clearAccumulatedForces
{
    RPVector3Clear(&_forceAccumulator);
}

- (void)addForce:(RPVector3 *)force
{
    RPVector3AddTo(&_forceAccumulator, force);
}

- (BOOL)hasFiniteMass
{
    return self.inverseMass > 0.0f;
}

@end
