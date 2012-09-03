//
//  RPParticleForceRegistry.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceGenerator.h"

@interface RPParticleForceRegistry : NSObject {
    @private
    NSMutableArray *_registry;  // XXX - total hack for now
}

- (RPParticleForceRegistry *)init;
- (void)connectParticle:(RPParticle *)particle
         forceGenerator:(id<RPParticleForceGenerator>)generator;
- (void)disconnectParticle:(RPParticle *)particle
            forceGenerator:(id<RPParticleForceGenerator>)generator;
- (void)clear;
- (void)updateForcesForDuration:(RPReal)duration;

@end
