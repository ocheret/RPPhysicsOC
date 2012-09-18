//
//  RPParticleAnchoredSpring.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleAnchoredSpring.h"

@implementation RPParticleAnchoredSpring

- (RPVector3 *)anchorRef
{
    return &_anchor;
}

- (RPParticleAnchoredSpring *)initWithAnchor:(RPVector3 *)anchor
                               springConstat:(RPReal)springConstant
                               restingLength:(RPReal)restingLength
{
    if (self = [super init]) {
        _anchor = *anchor;
        _springConstant = springConstant;
        _restingLength = restingLength;
    }
    return self;
}


- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration
{
    // Calculate the vector of the spring
    RPVector3 vector = *particle.positionRef;
    RPVector3Subtract(&vector, self.anchorRef);

    // Calculate the magnitude of the vector
    RPReal magnitude = RPVector3Length(&vector);

    // Calculate how far stretched or compressed the spring is
    RPReal extension = self.restingLength - magnitude;

    // Calculate the final force and apply it
    RPVector3MultiplyScalar(&vector,
                            extension * self.springConstant / magnitude);
    [particle addForce:&vector];
}

@end
