//
//  RPTypes.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <float.h>

// In theory we can put preprocessor directives to change types for any
// particular platform
typedef short           RPInt16;
typedef unsigned short  RPUInt16;
typedef int             RPint32;
typedef unsigned int    RPUint32;
typedef long            RPInt64;
typedef unsigned long   RPUint64;
typedef float           RPReal32;
typedef double          RPReal64;

// We can use the preprocessor to change precision at some point
typedef float               RPReal;
#define RPReal_SQRT(x)      sqrtf(x)
#define RPReal_ABS(x)       fabsf(x)
#define RPSReal_SIN(x)      sinf(x)
#define RPReal_COS(x)       cosf(x)
#define RPReal_EXP(x)       expf(x)
#define RPReal_POW(x, y)    powf(x, y)
#define RPReal_MOD(x, y)    fmodf(x)

#define RP_PI 3.14159f
#define RPReal_MAX FLT_MAX
#define RPReal_MIN FLT_MIN
