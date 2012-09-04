//
//  RPParticleForceRegistry.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleForceRegistry.h"

@implementation RPParticleForceRegistry

- (RPParticleForceRegistry *)init
{
    self = [super init];
    _registry = [[NSMutableArray alloc] init];
    return self;
}

- (void)connectParticle:(RPParticle *)particle
         forceGenerator:(id<RPParticleForceGenerator>)generator
{
    NSArray *pair = [[NSArray alloc] initWithObjects:particle, generator, nil];
    [_registry addObject:pair];
}

- (void)disconnectParticle:(RPParticle *)particle
            forceGenerator:(id<RPParticleForceGenerator>)generator
{
    NSArray *pair = [[NSArray alloc] initWithObjects:particle, generator, nil];
    [_registry removeObject:pair];
}

- (void)clear
{
    [_registry removeAllObjects];
}

- (void)updateForcesForDuration:(RPReal)duration
{
    for (NSArray *pair in _registry) {
        RPParticle *particle = [pair objectAtIndex:0];
        id<RPParticleForceGenerator> generator = [pair objectAtIndex:1];
        [generator updateForceOn:particle duration:duration];
    }
}

@end
