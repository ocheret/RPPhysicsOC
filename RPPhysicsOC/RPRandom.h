//
//  Random.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPVector3.h"

@interface RPRandom : NSObject {
    @private
    char _state[256];
}

+ (RPRandom *)getDefaultInstance;
+ (RPRandom *)getRepeatableInstance;
- (RPRandom *)init;
- (RPRandom *)initWithSeed:(unsigned)seed;
- (int)nextInt;
- (int)nextIntUnder:(int)max;
- (long)nextLong;
- (long)nextLongUnder:(long)max;
- (RPReal)nextRealBetweenMin:(RPReal)min max:(RPReal)max;
- (RPVector3)nextVector3BetweenMin:(RPVector3 *)min max:(RPVector3 *)max;

@end
