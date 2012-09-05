//
//  Random.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPRandom.h"
#include <stdlib.h>

@implementation RPRandom

#define LARGEST_UNSIGNED_PRIME 4294967291

static RPRandom *_defaultInstance = nil;
static RPRandom *_repeatableInstance = nil;;

+ (RPRandom *)getDefaultInstance
{
    if (!_defaultInstance) {
        _defaultInstance = [[RPRandom alloc] init];
    }
    return _defaultInstance;
}

+ (RPRandom *)getRepeatableInstance
{
    if (!_repeatableInstance) {
        _repeatableInstance = [[RPRandom alloc]
                               initWithSeed:LARGEST_UNSIGNED_PRIME];
    }
    return _repeatableInstance;
}

- (void)setup:(unsigned)seed
{
    initstate(seed, _state, sizeof(_state));
}

- (RPRandom *)init
{
    self = [super init];
    unsigned seed = (unsigned)arc4random();
    [self setup:seed];
    return self;
}

- (RPRandom *)initWithSeed:(unsigned int)seed
{
    self = [super init];
    [self setup:seed];
    return self;
}

- (long)nextLong
{
    char *oldState = setstate(_state);
    long result = random();
    setstate(oldState);
    return result;
}

- (long)nextLongUnder:(long)max
{
    char *oldState = setstate(_state);
    long result = random() % max;
    setstate(oldState);
    return result;
}

- (RPReal)nextRealBetweenMin:(RPReal)min max:(RPReal)max
{
    return (max - min) * [self nextLong] + min;
}

- (RPVector3)nextVector3BetweenMin:(RPVector3 *)min max:(RPVector3 *)max
{
    RPVector3 r = {
        (max->x - min->x) * [self nextLong] + min->x,
        (max->x - min->x) * [self nextLong] + min->x,
        (max->x - min->x) * [self nextLong] + min->x
    };
    return r;
}

@end
