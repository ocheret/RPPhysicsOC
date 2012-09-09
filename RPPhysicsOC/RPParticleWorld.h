//
//  RPParticleWorld.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceRegistry.h"
#import "RPParticleContactResolver.h"

@interface RPParticleWorld : NSObject

@property (nonatomic, strong) NSMutableArray *particles;
@property (nonatomic, strong) NSMutableArray *contactGenerators;
@property (nonatomic, strong) NSMutableArray *contacts;
@property (nonatomic, strong) RPParticleForceRegistry *forceRegistry;
@property (nonatomic, strong) RPParticleContactResolver *contactResolver;

- (RPParticleWorld *)init;

- (void)startFrame;

- (void)generateContacts;

- (void)integrateForDuration:(RPReal)duration;

- (void)runPhysicsForDuration:(RPReal)duration;

@end
