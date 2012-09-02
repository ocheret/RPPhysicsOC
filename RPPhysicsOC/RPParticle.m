//
//  RPParticle.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPParticle.h"

@implementation RPParticle

- (void)junk
{
    RPVector3 a = RPVector3Make(1.0, 2.0, 3.0);
    NSLog(@"%f, %f, %f", a.x, a.y, a.z);
}

@end
