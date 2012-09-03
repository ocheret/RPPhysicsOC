//
//  RPFirework.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/2/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//
// Very simple approach to fireworks inspired by Ian Millington's "Game Physics
// Engine Development."
//

#import "RPParticle.h"

@interface RPFirework : RPParticle

@property (nonatomic) unsigned type;
@property (nonatomic) RPReal lifespan;

- (BOOL)updateForDuration:(RPReal)duration;

@end
