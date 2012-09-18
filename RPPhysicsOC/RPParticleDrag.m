//
//  RPParticleDrag.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleDrag.h"

@implementation RPParticleDrag

- (RPParticleDrag *)initWithFirstOrderDrag:(RPReal)k1
                           secondOrderDrag:(RPReal)k2
{
    _k1 = k1;
    _k2 = k2;
    return self;
}

- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration
{
    RPVector3 force = *particle.velocityRef;

    // Calculate the total drag coefficient
    RPReal magnitude = RPVector3Length(&force);
    RPReal dragCoefficient = (self.k1 + self.k2 * magnitude) * magnitude;

    // Calculate and apply the drag force
    RPVector3MultiplyScalar(&force, -dragCoefficient / magnitude);
    [particle addForce:&force];
}

@end
