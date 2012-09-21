//
//  RPRigidBody.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/18/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"

@interface RPRigidBody : NSObject {
@protected
    RPVector3 _position;
    RPVector3 _velocity;
    RPVector3 _acceleration;
    RPVector3 _lastFrameAcceleration;
    RPVector3 _forceAccumulator;
    RPVector3 _torqueAccumulator;
    RPVector3 _rotation;
    RPQuaternion _orientation;
    RPMatrix3x4 _localToWorld;
    RPMatrix3 _inverseInertiaTensor;
    RPMatrix3 _inverseInertiaTensorWorld;
}

@property (nonatomic, readonly) RPVector3 *positionRef;

@property (nonatomic, readonly) RPVector3 *velocityRef;

@property (nonatomic, readonly) RPVector3 *accelerationRef;

@property (nonatomic, readonly) RPVector3 *lastFrameAccelerationRef;

@property (nonatomic, readonly) RPQuaternion *orientationRef;

@property (nonatomic, readonly) RPVector3 *rotationRef;

@property (nonatomic, readonly) RPMatrix3x4 *localToWorldRef;

@property (nonatomic, readonly) RPMatrix3 *inverseInertiaTensorRef;

@property (nonatomic, readonly) RPMatrix3 *inverseInertiaTensorWorldRef;

@property (nonatomic) RPReal linearDamping;

@property (nonatomic) RPReal angularDamping;

@property (nonatomic) RPReal inverseMass;

@property (nonatomic) RPReal mass;

@property (nonatomic) BOOL isAwake;

@property (nonatomic) BOOL canSleep;

- (RPRigidBody *)initWithPosition:(RPVector3 *)position
                         velocity:(RPVector3 *)velocity
                     acceleration:(RPVector3 *)acceleration
                      orientation:(RPQuaternion *)orientation
                         rotation:(RPVector3 *)rotation
                      inverseMass:(RPReal)inverseMass
                    linearDamping:(RPReal)linearDamping;

- (void)setInertiaTensor:(RPMatrix3 *)inertiaTensor;

- (RPMatrix3 *)getInertiaTensor:(RPMatrix3 *)inertiaTensor;

- (void)calculateDerivedData;

- (void)integrateForDuration:(RPReal)duration;

- (void)clearAccumulators;

- (void)addForce:(RPVector3 *)force;

- (void)addFOrce:(RPVector3 *)force atPoint:(RPVector3 *)point;

- (void)addFOrce:(RPVector3 *)force atBodyPoint:(RPVector3 *)point;

- (BOOL)hasFiniteMass;

@end
