//
//  RPParticleDrag.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPParticleForceGenerator.h"

@interface RPParticleDrag : NSObject <RPParticleForceGenerator>

@property (nonatomic) RPReal k1;
@property (nonatomic) RPReal k2;

- (RPParticleDrag *)initWithFirstOrderDrag:(RPReal)k1
                           secondOrderDrag:(RPReal)k2;

@end
