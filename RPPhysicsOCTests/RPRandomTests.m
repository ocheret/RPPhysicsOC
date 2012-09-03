//
//  RPRandomTests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPRandomTests.h"

@implementation RPRandomTests

- (void)testGetDefaultInstance
{
    RPRandom *a = [RPRandom getDefaultInstance];
    RPRandom *b = [RPRandom getDefaultInstance];
    STAssertEquals(a, b, @"Returned different instances");
}

- (void)testGetRepeatableInstance
{
    RPRandom *a = [RPRandom getRepeatableInstance];
    RPRandom *b = [RPRandom getRepeatableInstance];
    STAssertEquals(a, b, @"Returned different instances");
}

- (void)testInitWithSeed
{
    RPRandom *a = [[RPRandom alloc] initWithSeed:1234];
    long randomSequence[10];
    for (int i = 0; i < 10; i++) {
        randomSequence[i] = [a nextLong];
    }
    RPRandom *b = [[RPRandom alloc] initWithSeed:1234];
    for (int i = 0; i < 10; i++) {
        STAssertEquals(randomSequence[i], [b nextLong],
                       @"Random sequences from same see don't match");
    }
}

@end
