//
//  RPParticleSpring.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceGenerator.h"

@interface RPParticleSpring : NSObject <RPParticleForceGenerator>

@property (nonatomic, weak) RPParticle *other;
@property (nonatomic) RPReal springConstant;
@property (nonatomic) RPReal restingLength;

- (RPParticleSpring *)initWithParticle:(RPParticle *)other
                        springConstant:(RPReal)springConstant
                         restingLength:(RPReal)restingLength;

@end
