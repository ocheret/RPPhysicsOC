//
//  RPParticleLink.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/7/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleContactGenerator.h"

@interface RPParticleLink : NSObject <RPParticleContactGenerator>

@property (nonatomic, weak) RPParticle *particleA;
@property (nonatomic, weak) RPParticle *particleB;
@property (nonatomic, readonly) RPReal currentLength;

- (RPParticleLink *)initWithParticle:(RPParticle *)particleA
                            particle:(RPParticle *)particleB;

@end
