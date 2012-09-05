//
//  RPParticleContactTests.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/5/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <RPPhysicsOC/RPVector3.h>
#import <RPPhysicsOC/RPParticleContact.h>

@interface RPParticleContactTests : SenTestCase {
    RPVector3 positionA;
    RPVector3 velocityA;
    RPVector3 positionB;
    RPVector3 velocityB;
    RPVector3 contactNormal;
    RPParticle *particleA;
    RPParticle *particleB;
}

@end
