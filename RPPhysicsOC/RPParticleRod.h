//
//  RPParticleRod.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleLink.h"

@interface RPParticleRod : RPParticleLink

@property (nonatomic) RPReal length;

- (RPParticleRod *)initWithParticle:(RPParticle *)particleA
                           particle:(RPParticle *)particleB
                             length:(RPReal)length;

@end
