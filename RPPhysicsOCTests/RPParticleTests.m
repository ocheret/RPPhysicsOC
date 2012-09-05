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
    *p.velocityRef = v;
    p.inverseMass = 1.0f;
    p.damping = 1.0f;
    [p integrateForDuration:1.0];
    RPVector3 a = *p.velocityRef;
    STAssertTrue(RPVector3AllEqualTo(&a, &v),
                 @"Damping of 1 reduced velocity");

    p.damping = 0.9f;
    RPReal originalMagnitude = RPVector3Length(&a);
    [p integrateForDuration:1.0];
    a = *p.velocityRef;
    RPReal newMangitude = RPVector3Length(&a);
    STAssertEqualsWithAccuracy(0.9f * originalMagnitude, newMangitude, 0.00001,
                               @"Damping did not reduce velocity as expected");
}

- (void)testAddForce
{
    RPParticle *p =
    [[RPParticle alloc] initWithPosition:&(RPVector3){ 100, 100, 100 }
                                velocity:&(RPVector3){ 10, 10, 10 }
                            acceleration:&(RPVector3){ 0, 0, 0 }
                             inverseMass:2
                                 damping:1];
    [p addForce:&(RPVector3){ 1, 1, 1 }];
    [p integrateForDuration:1];
    for (int i = 0; i < 3; i++) {
        STAssertEqualsWithAccuracy(p.positionRef->v[i], (RPReal)110, 0.000001,
                                   @"Position is wrong");
        STAssertEqualsWithAccuracy(p.velocityRef->v[i], (RPReal)12, 0.000001,
                                   @"Velocity is wrong");
    }
}

@end
