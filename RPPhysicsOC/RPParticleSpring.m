//
//  RPParticleSpring.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleSpring.h"

@implementation RPParticleSpring

- (RPParticleSpring *)initWithParticle:(RPParticle *)other
                        springConstant:(RPReal)springConstant
                         restingLength:(RPReal)restingLength
{
    self.other = other;
    self.springConstant = springConstant;
    self.restingLength = restingLength;
    return self;
}

- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration
{
    // Calculate the vector of the spring
    RPVector3 vector = *particle.positionRef;
    RPVector3SubtractFrom(&vector, self.other.positionRef);

    // Calculate the magnitude of the vector
    RPReal magnitude = RPVector3Length(&vector);

    // Calculate how far stretched or compressed the spring is
    RPReal extension = magnitude - self.restingLength;

    // Calculate the final force and apply it
    RPVector3MultiplyScalarBy(&vector,
                              -extension * self.springConstant / magnitude);
    [particle addForce:&vector];
}

@end
