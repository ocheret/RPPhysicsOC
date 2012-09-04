//
//  RPParticleBungee.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleBungee.h"

@implementation RPParticleBungee

- (RPParticleBungee *)initWithParticle:(RPParticle *)other
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
    RPVector3Subtract(&vector, self.other.positionRef);

    // Calculate the magnitude of the vector
    RPReal magnitude = RPVector3Length(&vector);

    // Calculate how far stretched or compressed the spring is
    RPReal extension = self.restingLength - magnitude;

    // Only exert a force if the spring is streched
    if (extension < 0) {
        // Calculate the final force and apply it
        RPVector3MultiplyScalar(&vector,
                                extension * self.springConstant / magnitude);
        [particle addForce:&vector];
    }
}


@end
