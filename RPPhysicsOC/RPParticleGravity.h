//
//  RPParticleGravity.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceGenerator.h"

@interface RPParticleGravity : NSObject <RPParticleForceGenerator> {
    RPVector3 _gravity;
}

@property (nonatomic, readonly) RPVector3 *gravityRef;

- (RPParticleGravity *)initWithGravity:(RPVector3 *)gravityRef;

@end
