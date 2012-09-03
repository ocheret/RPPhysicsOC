//
//  RPParticleForceGenerator.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticle.h"

@protocol RPParticleForceGenerator <NSObject>

- (void)updateForceOn:(RPParticle *)particle duration:(RPReal)duration;

@end
