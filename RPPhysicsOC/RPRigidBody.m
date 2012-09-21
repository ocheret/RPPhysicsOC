//
//  RPRigidBody.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/18/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPRigidBody.h"
#import "RPQuaternion.h"
#import "RPVector3.h"
#import "RPMatrix3.h"
#import "RPMatrix3x4.h"

@implementation RPRigidBody

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

- (RPVector3 *)lastFrameAccelerationRef
{
    return &_lastFrameAcceleration;
}

- (RPQuaternion *)orientationRef
{
    return &_orientation;
}

- (RPVector3 *)rotationRef
{
    return &_rotation;
}

- (RPMatrix3x4 *)localToWorldRef
{
    return &_localToWorld;
}

- (RPMatrix3 *)inverseInertiaTensorRef
{
    return &_inverseInertiaTensor;
}

- (RPMatrix3 *)inverseInertiaTensorWorldRef
{
    return &_inverseInertiaTensorWorld;
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

- (void)setInertiaTensor:(RPMatrix3 *)inertiaTensor
{
    _inverseInertiaTensor = *inertiaTensor;
    RPMatrix3Invert(&_inverseInertiaTensor, &_inverseInertiaTensor);
}

- (RPMatrix3 *)getInertiaTensor:(RPMatrix3 *)inertiaTensor
{
    *inertiaTensor = _inverseInertiaTensor;
    RPMatrix3Invert(inertiaTensor, inertiaTensor);
    return inertiaTensor;
}

- (RPRigidBody *)initWithPosition:(RPVector3 *)position
                         velocity:(RPVector3 *)velocity
                     acceleration:(RPVector3 *)acceleration
                      orientation:(RPQuaternion *)orientation
                         rotation:(RPVector3 *)rotation
                      inverseMass:(RPReal)inverseMass
                    linearDamping:(RPReal)linearDamping
{
    if (self = [super init]) {
        if (position) _position = *position;
        if (velocity) _velocity = *velocity;
        if (acceleration) _acceleration = *acceleration;
        if (orientation) _orientation = *orientation;
        if (rotation) _rotation = *rotation;
        _inverseMass = inverseMass;
        _linearDamping = linearDamping;
    }
    return self;
}

- (void)calculateLocalToWorld
{
    RPMatrix3x4FromQuaternionAndVector3(&_localToWorld,
                                        &_orientation,
                                        &_position);
}

- (void)transformInverseInertiaTensor
{
    RPMatrix3x4XFormTensor(&_inverseInertiaTensorWorld,
                           &_inverseInertiaTensor, &_localToWorld);
}

- (void)calculateDerivedData
{
    // XXX - do we need this?  calculateLocalToWorld will also normalize
    RPQuaternionNormalize(&_orientation, &_orientation);

    [self calculateLocalToWorld];

    [self transformInverseInertiaTensor];
}

- (void)integrateForDuration:(RPReal)duration
{
    assert(duration > 0.0f); // XXX - we need to handle errors better

    if (!self.isAwake) {
        return;
    }

    // Calculate linar acceleration from force inputs
    _lastFrameAcceleration = _acceleration;
    RPVector3AddScaledVector(&_lastFrameAcceleration,
                             &_forceAccumulator, self.inverseMass);

    // Calculate angular acceleration from torque inputs
    RPVector3 angularAcceleration;
    RPMatrix3MultiplyVector(&angularAcceleration,
                            &_inverseInertiaTensorWorld, &_torqueAccumulator);

    // Damp the current velocity and angular velocity (artificial drag)
    RPVector3MultiplyScalar(&_velocity,
                            RPReal_POW(self.linearDamping, duration));
    RPVector3MultiplyScalar(&_rotation,
                            RPReal_POW(self.angularDamping, duration));

    // Adjust velocities

    // Update linear velocity
    RPVector3AddScaledVector(&_velocity, &_lastFrameAcceleration, duration);

    // Update angular velocity
    RPVector3AddScaledVector(&_rotation, &angularAcceleration, duration);

    // Adjust positions

    // Update linear position based on velocity and duration
    RPVector3AddScaledVector(&_position, &_velocity, duration);

    // Update angular position (orientation)
    RPQuaternionAddScaledVector3(&_orientation, &_rotation, duration);

    // Normalise the orientation, and update the matrices with the new
    // position and orientation
    [self calculateDerivedData];


//
//    // Update the kinetic energy store, and possibly put the body to
//    // sleep.
//    if (canSleep) {
//        real currentMotion = velocity.scalarProduct(velocity) +
//        rotation.scalarProduct(rotation);
//        
//        real bias = real_pow(0.5, duration);
//        motion = bias*motion + (1-bias)*currentMotion;
//
//        if (motion < sleepEpsilon) setAwake(false);
//        else if (motion > 10 * sleepEpsilon) motion = 10 * sleepEpsilon;
//    }


    // Clear accumulators.
    [self clearAccumulators];
}

- (void)clearAccumulators
{
    RPVector3Clear(&_forceAccumulator);
    RPVector3Clear(&_torqueAccumulator);
}

- (void)addForce:(RPVector3 *)force
{
    RPVector3Add(&_forceAccumulator, force);
    self.isAwake = YES;
}

- (void)addFOrce:(RPVector3 *)force atPoint:(RPVector3 *)point
{
    // Translate coordinates relative to center of mass
    RPVector3 relativePoint = *point;
    RPVector3Subtract(&relativePoint, &_position);

    // Add the force
    [self addForce:force];

    // Add the torque
    RPVector3 torque;
    RPVector3CrossProduct(&torque, &relativePoint, force);
    RPVector3Add(&_torqueAccumulator, &torque);
}

- (void)addFOrce:(RPVector3 *)force atBodyPoint:(RPVector3 *)point
{
    RPVector3 worldPoint;
    RPMatrix3x4MultiplyVector3(&worldPoint, &_localToWorld, point);
    [self addFOrce:force atPoint:&worldPoint];
}

- (BOOL)hasFiniteMass
{
    return self.inverseMass > 0.0f;
}

@end
