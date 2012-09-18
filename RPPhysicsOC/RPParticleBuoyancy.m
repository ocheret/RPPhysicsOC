//
//  RPParticleBuoyancy.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/4/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleBuoyancy.h"

@implementation RPParticleBuoyancy

- (RPParticleBuoyancy *)initWithMaxDepth:(RPReal)maxDepth
                                  volume:(RPReal)volume
                           surfaceHeight:(RPReal)surfaceHeight
                                 density:(RPReal)density
{
    if (self = [super init]) {
        _maxDepth = maxDepth;
        _volume = volume;
        _surfaceHeight = surfaceHeight;
        _density = density;
    }
    return self;
}

- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration
{
    // Get the particle's vertical position
    RPReal depth = particle.positionRef->y;

    // See if the particle is completely out of the water
    if (depth >= self.surfaceHeight + self.maxDepth) {
        return;
    }

    RPVector3 force = { 0, 0, 0 };

    // Check if we're at maximum depth
    if (depth <= self.surfaceHeight - self.maxDepth) {
        // We are fully submerged;
        force.y = self.density * self.volume;
    } else {
        // We are partially submerged
        force.y = self.density * self.volume *
            (depth - self.maxDepth - self.surfaceHeight) / (2 * self.maxDepth);
    }
    [particle addForce:&force];
}

@end
