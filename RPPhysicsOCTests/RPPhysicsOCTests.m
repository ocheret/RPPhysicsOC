//
//  RPPhysicsOCTests.m
//  RPPhysicsOCTests
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPPhysicsOCTests.h"

@implementation RPPhysicsOCTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.particle = [[RPParticle alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMemberAndPropertyEquivalence
{
    STAssertTrue([self.particle verifyMemberAndPropertyEquivalence],
                 @"Member and Property are not equivalent");
}

- (void)testPrimitiveSizes
{

    STAssertEquals(sizeof(RPInt16), (size_t)2, @"RPInt16 isn't 16 bits");
    STAssertEquals(sizeof(RPint32), (size_t)4, @"RPInt32 isn't 32 bits");
    STAssertEquals(sizeof(RPInt64), (size_t)8, @"RPInt64 isn't 64 bits");
    STAssertEquals(sizeof(RPReal32), (size_t)4, @"RPReal32 isn't 32 bits");
    STAssertEquals(sizeof(RPReal64), (size_t)8, @"RPReal64 isn't 64 bits");
}

@end
