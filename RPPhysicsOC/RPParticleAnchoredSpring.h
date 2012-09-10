//
//  RPParticleAnchoredSpring.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceGenerator.h"

@interface RPParticleAnchoredSpring : NSObject <RPParticleForceGenerator> {
    @protected
    RPVector3 _anchor;
}

@property (nonatomic, readonly) RPVector3 *anchorRef;
@property (nonatomic) RPReal springConstant;
@property (nonatomic) RPReal restingLength;

- (RPParticleAnchoredSpring *)initWithAnchor:(RPVector3 *)anchor
                               springConstat:(RPReal)springConstant
                               restingLength:(RPReal)restingLength;

@end
