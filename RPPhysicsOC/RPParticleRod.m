//
//  RPParticleRod.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleRod.h"

@implementation RPParticleRod

- (RPParticleRod *)initWithParticle:(RPParticle *)particleA
                           particle:(RPParticle *)particleB
                             length:(RPReal)length
{
    self = [super initWithParticle:particleA particle:particleB];
    self.length = length;
    return self;
}

- (void)addContact:(NSMutableArray *)contacts
{
    // Find the current length of the rod
    RPReal currentLength = [self currentLength];

    // Check if we are extended or compressed
    if (currentLength == self.length) {
        return;
    }

    // Determin normal and penetration according to whether we are extended or
    // compressed.
    RPVector3 normal;
    RPReal penetration;
    if (currentLength > self.length) {
        normal = *self.particleB.positionRef;
        RPVector3Subtract(&normal, self.particleA.positionRef);
        penetration = currentLength - self.length;
    } else {
        normal = *self.particleA.positionRef;
        RPVector3Subtract(&normal, self.particleB.positionRef);
        penetration = self.length - currentLength;
    }
    RPVector3Normalize(&normal, &normal);

    RPParticleContact *contact =
        [[RPParticleContact alloc] initWithParticle:self.particleA
                                           particle:self.particleB
                                        restitution:0
                                             normal:&normal
                                        penetration:penetration];

    [contacts addObject:contact];
}

@end
