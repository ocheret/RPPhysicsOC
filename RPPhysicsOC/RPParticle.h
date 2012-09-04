//
//  RPParticle.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"
#import "RPVector3.h"

@interface RPParticle : NSObject {
@protected
    RPVector3 _position;
    RPVector3 _velocity;
    RPVector3 _acceleration;
    RPVector3 _forceAccumulator;
}

@property (nonatomic, readonly) RPVector3 *positionRef;

@property (nonatomic, readonly) RPVector3 *velocityRef;

@property (nonatomic, readonly) RPVector3 *accelerationRef;

@property (nonatomic) RPReal damping;

@property (nonatomic) RPReal inverseMass;

@property (nonatomic) RPReal mass;

- (void)integrateForDuration:(RPReal)duration;
- (void)clearAccumulatedForces;
- (void)addForce:(RPVector3 *)force;
- (BOOL)hasFiniteMass;

@end
