//
//  RPParticleContact.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/4/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticle.h"

@interface RPParticleContact : NSObject {
    @protected
    RPVector3 _normal;
    RPVector3 _movementA;
    RPVector3 _movementB;
}

@property (nonatomic, weak) RPParticle *particleA;
@property (nonatomic, weak) RPParticle *particleB;
@property (nonatomic, readonly) RPVector3 *movementARef;
@property (nonatomic, readonly) RPVector3 *movementBRef;
@property (nonatomic) RPReal restitution;
@property (nonatomic) RPVector3 normal;
@property (nonatomic) RPReal penetration;
@property (nonatomic, readonly) RPVector3 *normalRef;

- (RPParticleContact *)initWithParticle:(RPParticle *)particleA
                               particle:(RPParticle *)particleB
                            restitution:(RPReal)restitution
                                 normal:(RPVector3 *)normal;

- (void)resolveForDuration:(RPReal)duration;

- (RPReal)calculateSeparatingSpeed;

- (void)resolveVelocityForDuration:(RPReal)duration;

- (void)resolveInterpenetrationForDuration:(RPReal)duration;

@end
