//
//  RPParticleContactGenerator.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/7/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RPParticleContact.h>

@protocol RPParticleContactGenerator <NSObject>

- (void)addContact:(NSMutableArray *)contacts;

@end
