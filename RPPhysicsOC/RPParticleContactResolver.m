//
//  RPParticleContactResolver.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/6/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleContactResolver.h"

@implementation RPParticleContactResolver

- (RPParticleContactResolver *)initWithMaxIterations:(unsigned int)maxIterations
{
    self = [super init];
    self.maxIterations = maxIterations;
    return self;
}

// XXX - N**2 hack should be redone more intelligently
- (void)resolveContacts:(NSArray *)contacts forDuration:(RPReal)duration
{
    self.usedIterations = 0;
    while (self.usedIterations < self.maxIterations) {
        RPReal max = RPReal_MAX;
        unsigned maxIndex = [contacts count];
        for (int i = [contacts count] - 1; i >= 0; i--) {
            RPParticleContact *contact = [contacts objectAtIndex:i];
            RPReal separationSpeed = [contact calculateSeparatingSpeed];
            if (separationSpeed < max &&
                (separationSpeed < 0 || contact.penetration > 0))
            {
                max = separationSpeed;
                maxIndex = i;
            }
        }

        // Do we have anything worth resolving?
        if (maxIndex == [contacts count]) {
            break;
        }

        [[contacts objectAtIndex:maxIndex] resolveForDuration:duration];

        self.usedIterations++;
    }
}

@end
