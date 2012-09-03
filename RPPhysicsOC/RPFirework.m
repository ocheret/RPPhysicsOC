//
//  RPFirework.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/2/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//
// Very simple approach to fireworks inspired by Ian Millington's "Game Physics
// Engine Development."
//

#import "RPFirework.h"

@implementation RPFirework

- (BOOL)updateForDuration:(RPReal)duration
{
    // Update our particle state
    [self integrateForDuration:duration];

    // Chip away at our lifespan
    self.lifespan += duration;

    // If our life is over or if we have moved underground we should expire
    return (self.lifespan < 0) || (self.position.y < 0);
}

@end
