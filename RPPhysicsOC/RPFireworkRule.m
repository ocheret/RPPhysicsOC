//
//  RPFireworkRule.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//
// Very simple approach to fireworks inspired by Ian Millington's "Game Physics
// Engine Development."
//

#import "RPFireworkRule.h"

@implementation RPFireworkRule

- (RPVector3 *)minVelocityRef
{
    return &_minVelocity;
}

- (RPVector3 *)maxVelocityRef
{
    return &_maxVelocity;
}

- (void)createFireWork:(RPFirework *)firework withParent:(RPFirework *)parent
{
    RPRandom *random = [RPRandom getDefaultInstance];
    firework.type = self.type;
    firework.lifespan = [random nextRealBetweenMin:self.minLifespan max:self.maxLifespan];

    RPVector3 velocity;
    if (parent) {
        // Position and velocity are based on the parent
        *firework.positionRef = *parent.positionRef;
        RPVector3Add(&velocity, parent.velocityRef);
    } else {
        RPVector3 start;
        start.x = 5 * ([random nextLongUnder:3] - 1);
        *firework.positionRef = start;
    }

    RPVector3 tmp = [random nextVector3BetweenMin:&_minVelocity
                                              max:&_maxVelocity];
    RPVector3Add(&velocity, &tmp);
    *firework.velocityRef = velocity;

    // Only gravity is involved so just set all masses to 1
    firework.inverseMass = 1;
    firework.damping = self.damping;
    *firework.accelerationRef = RP_GRAVITY;
    [firework clearAccumulatedForces];
}

@end
