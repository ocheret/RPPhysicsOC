//
//  RPParticleGravity.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleGravity.h"

@implementation RPParticleGravity

- (RPVector3 *)gravityRef
{
    return &_gravity;
}

- (RPParticleGravity *)initWithGravity:(RPVector3 *)gravityRef
{
    _gravity = *gravityRef;
    return self;
}

- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration
{
    if ([particle hasFiniteMass]) {
        RPVector3 force = _gravity;
        [particle addForce:RPVector3MultiplyScalar(&force, particle.mass)];
    }
}

@end
