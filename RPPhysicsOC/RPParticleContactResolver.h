//
//  RPParticleContactResolver.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/6/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleContact.h"

@interface RPParticleContactResolver : NSObject

@property (nonatomic) unsigned maxIterations;
@property (nonatomic) unsigned usedIterations;

- (RPParticleContactResolver *)initWithMaxIterations:(unsigned)maxIterations;

- (void)resolveContacts:(NSArray *)contacts forDuration:(RPReal)duration;

@end
