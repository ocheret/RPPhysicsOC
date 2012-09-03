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

- (BOOL)verifyMemberAndPropertyEquivalence
{
    RPVector3Set(&_position, 0.0f, 0.0f, 0.0f);
    self.position = RPVector3Make(1.0f, 2.0f, 3.0f);
    RPVector3Set(&_position, 100.0f, 200.0f, 300.0f);
    return (self.position.x == 100.0f &&
            self.position.y == 200.0f &&
            self.position.z == 300.0f);
}

@end
