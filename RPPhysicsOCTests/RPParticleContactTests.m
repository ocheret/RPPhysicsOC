//
//  RPParticleContactTests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/5/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticleContactTests.h"

@implementation RPParticleContactTests

- (void)setUp
{
    [super setUp];

    // Setup some default values.
    positionA = (RPVector3){ 1, 1, 0 };
    velocityA = (RPVector3){ -1, -1, 0 };
    positionB = (RPVector3){ -1, -1, 0 };
    velocityB = (RPVector3){ 1, 1, 0 };
    contactNormal = (RPVector3){ 1, 0, 0 };
    particleA = [[RPParticle alloc] initWithPosition:&positionA
                                            velocity:&velocityA
                                        acceleration:nil
                                         inverseMass:1
                                             damping:1];
    particleB = [[RPParticle alloc] initWithPosition:&positionB
                                            velocity:&velocityB
                                        acceleration:nil
                                         inverseMass:1
                                             damping:1];
}

- (void)tearDown
{
    // Tear-down code here.
    // Nothing to do for now.

    [super tearDown];
}


- (void)testCalculateSeparatingSpeed
{

    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:particleB
                                    restitution:1
                                         normal:&contactNormal
                                    penetration:0];

    RPReal speed = [contact calculateSeparatingSpeed];
    STAssertEquals(speed, -2.0f, @"Separating speed incorrect");
}

- (void)testResolveVelocityForDurationA
{
    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:particleB
                                    restitution:1
                                         normal:&contactNormal
                                    penetration:0];
    [contact resolveVelocityForDuration:1];
    STAssertTrue(RPVector3AllEqualTo(particleA.velocityRef,
                                     &(RPVector3){ 1, -1, 0 }),
                 @"Velocity A wrong");
    STAssertTrue(RPVector3AllEqualTo(particleB.velocityRef,
                                     &(RPVector3){ -1, 1, 0 }),
                 @"Velocity B wrong");
}

- (void)testResolveVelocityForDurationB
{
    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:particleB
                                    restitution:.5
                                         normal:&contactNormal
                                    penetration:0];
    [contact resolveVelocityForDuration:1];
    STAssertTrue(RPVector3AllEqualTo(particleA.velocityRef,
                                     &(RPVector3){ .5, -1, 0 }),
                 @"Velocity A wrong");
    STAssertTrue(RPVector3AllEqualTo(particleB.velocityRef,
                                     &(RPVector3){ -.5, 1, 0 }),
                 @"Velocity B wrong");
}

- (void)testResolveVelocityForDurationC
{
    particleA.inverseMass = .5;
    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:particleB
                                    restitution:1
                                         normal:&contactNormal
                                    penetration:0];
    [contact resolveVelocityForDuration:1];
    STAssertEqualsWithAccuracy(particleA.velocityRef->x, (RPReal)(1.0/3.0),
                               .000001f, @"Velocity A wrong");
    STAssertEqualsWithAccuracy(particleB.velocityRef->x, (RPReal)(-5.0f/3.0f),
                               .000001f, @"Velocity B wrong");
}

- (void)testResolveVelocityForDurationD
{
    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:nil
                                    restitution:1
                                         normal:&contactNormal
                                    penetration:0];
    [contact resolveVelocityForDuration:1];
    STAssertTrue(RPVector3AllEqualTo(particleA.velocityRef,
                                     &(RPVector3){ 1, -1, 0 }),
                 @"Velocity A wrong");
}

- (void)testResolveInterpenetrationForDuration
{
    RPParticleContact *contact =
    [[RPParticleContact alloc] initWithParticle:particleA
                                       particle:particleB
                                    restitution:1
                                         normal:&contactNormal
                                    penetration:0];
    contact.penetration = 1;
    [contact resolveInterpenetrationForDuration:1];
    STAssertEqualsWithAccuracy(particleA.positionRef->x, (RPReal)(1.5),
                               .000001f, @"Position A wrong");
    STAssertEqualsWithAccuracy(particleB.positionRef->x, (RPReal)(-1.5),
                               .000001f, @"Position B wrong");
}

@end
