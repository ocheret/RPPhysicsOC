//
//  RPFireworkRule.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/3/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//
// Very simple approach to fireworks inspired by Ian Millington's "Game Physics
// Engine Development."
//

#import <Foundation/Foundation.h>
#import "RPFirework.h"
#import "RPRandom.h"

struct _RPFireworkPayload {
    unsigned type;
    unsigned count;
};
typedef struct _RPFireworkPayload RPFireworkPayload;

@interface RPFireworkRule : NSObject {
    @protected
    RPVector3 _minVelocity;
    RPVector3 _maxVelocity;
}

// The type of firework managed by this rule
@property (nonatomic) unsigned type;

// The minimum time for this firework to live
@property (nonatomic) RPReal minLifespan;

// The maximum time for this firework to live
@property (nonatomic) RPReal maxLifespan;

// The minimum relative velocity of this firework
@property (nonatomic, readonly) RPVector3 *minVelocityRef;

// The maxiumum relative velocity of this firework
@property (nonatomic, readonly) RPVector3 *maxVelocityRef;

// The damping of this firework type
@property (nonatomic) RPReal damping;

// The number of payloads for this firework type
@property (nonatomic) unsigned payloadCount;

// The set of payloads
@property (nonatomic) RPFireworkPayload *payloads;

- (void)createFireWork:(RPFirework *)firework withParent:(RPFirework *)parent;

@end
