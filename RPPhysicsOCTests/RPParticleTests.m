//
//  RPParticleTests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/2/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleTests.h"

@implementation RPParticleTests

- (void)testDamping
{
    RPParticle *p = [[RPParticle alloc] init];
    RPVector3 v = { 10, 10, 10 };
    p.velocity = v;
    p.inverseMass = 1.0f;
    p.damping = 1.0f;
    [p integrateForDuration:1.0];
    RPVector3 a = p.velocity;
    STAssertTrue(RPVector3AllEqualToVector3(&a, &v),
                 @"Damping of 1 reduced velocity");

    p.damping = 0.9f;
    RPReal originalMagnitude = RPVector3Length(&a);
    [p integrateForDuration:1.0];
    a = p.velocity;
    RPReal newMangitude = RPVector3Length(&a);
    STAssertEqualsWithAccuracy(0.9f * originalMagnitude, newMangitude, 0.00001,
                               @"Damping did not reduce velocity as expected");
}

@end
