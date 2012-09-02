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

@end
