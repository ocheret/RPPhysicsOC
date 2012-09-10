//
//  RPParticleCable.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/7/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleLink.h"

@interface RPParticleCable : RPParticleLink

@property (nonatomic) RPReal maxLength;
@property (nonatomic) RPReal restitution;

- (RPParticleCable *)initWithParticle:(RPParticle *)particleA
                             particle:(RPParticle *)particleB
                            maxLength:(RPReal)maxLength
                          restitution:(RPReal)restitution;

@end
