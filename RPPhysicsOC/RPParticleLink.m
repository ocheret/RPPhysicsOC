//
//  RPParticleLink.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/7/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleLink.h"

@implementation RPParticleLink

- (RPReal)currentLength
{
    RPVector3 diff = *self.particleA.positionRef;
    RPVector3Subtract(&diff, self.particleB.positionRef);
    return RPVector3Length(&diff);
}

- (RPParticleLink *)initWithParticle:(RPParticle *)particleA
                            particle:(RPParticle *)particleB
{
    if (self = [super init]) {
        _particleA = particleA;
        _particleB = particleB;
    }
    return self;
}

- (void)addContact:(NSMutableArray *)contacts
{
    assert(nil == @"Subclasses must override this method");
}

@end
