//
//  RPParticleBuoyancy.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/4/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RPParticleForceGenerator.h>

@interface RPParticleBuoyancy : NSObject <RPParticleForceGenerator>

@property (nonatomic) RPReal maxDepth;
@property (nonatomic) RPReal volume;
@property (nonatomic) RPReal surfaceHeight;
@property (nonatomic) RPReal density;

- (RPParticleBuoyancy *)initWithMaxDepth:(RPReal)maxDepth
                                  volume:(RPReal)volume
                           surfaceHeight:(RPReal)surfaceHeight
                                 density:(RPReal)density;

@end
