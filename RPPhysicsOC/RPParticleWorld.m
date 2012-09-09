//
//  RPParticleWorld.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleWorld.h"
#import "RPParticleContactGenerator.h"

@implementation RPParticleWorld

- (RPParticleWorld *)init
{
    self = [super init];
    self.particles = [[NSMutableArray alloc] init];
    self.contactGenerators = [[NSMutableArray alloc] init];
    self.contacts = [[NSMutableArray alloc] init];
    self.forceRegistry = [[RPParticleForceRegistry alloc] init];
    self.contactResolver = [[RPParticleContactResolver alloc]
                            initWithMaxIterations:0];
    return self;
}

- (void)startFrame
{
    for (RPParticle *particle in self.particles) {
        [particle clearAccumulatedForces];
    }
}

- (void)generateContacts
{
    [self.contacts removeAllObjects];

    for (id <RPParticleContactGenerator> generator in self.contactGenerators) {
        [generator addContact:self.contacts];
    }
}

- (void)integrateForDuration:(RPReal)duration
{
    for (RPParticle *particle in self.particles) {
        [particle integrateForDuration:duration];
    }
}

- (void)runPhysicsForDuration:(RPReal)duration
{
    // First apply the force generators
    [self.forceRegistry updateForcesForDuration:duration];

    // Then integrate the objects
    [self integrateForDuration:duration];

    // Generate contacts
    [self generateContacts];

    // Resolve contacts
    if ([self.contacts count] > 0) {
        self.contactResolver.maxIterations = 2 * [self.contacts count];
        [self.contactResolver resolveContacts:self.contacts
                                  forDuration:duration];
    }
}

- (void)sampleGameLoop
{
    // Setup code might go here

    // Loop forever
    while (YES) {
        // Prepare objects for this frame
        [self startFrame];

        // Calls to other parts of the game code
        // [self runGraphicsUpdate];
        // [self updateCharacters];

        [self runPhysicsForDuration:1.0]; // use a real duration

        // if ([self gameIsOver]) break;
    }
}

@end
