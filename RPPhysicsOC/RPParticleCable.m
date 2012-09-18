//
//  RPParticleCable.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/7/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleCable.h"

@implementation RPParticleCable

- (RPParticleCable *)initWithParticle:(RPParticle *)particleA particle:(RPParticle *)particleB maxLength:(RPReal)maxLength restitution:(RPReal)restitution
{
    if (self = [super initWithParticle:particleA particle:particleB]) {
        _maxLength = maxLength;
        _restitution = restitution;
    }
    return self;
}

- (void)addContact:(NSMutableArray *)contacts
{
    // Find the length of the cable
    RPReal length = self.currentLength;

    // Check if we're overextended
    if (length < self.maxLength) {
        return;
    }

    // Calculate the normal
    RPVector3 normal = *self.particleB.positionRef;
    RPVector3Subtract(&normal, self.particleA.positionRef);
    RPVector3Normalize(&normal, &normal);

    RPParticleContact *contact =
        [[RPParticleContact alloc] initWithParticle:self.particleA
                                           particle:self.particleB
                                        restitution:self.restitution
                                             normal:&normal
                                        penetration:length - self.maxLength];

    [contacts addObject:contact];
}

@end
