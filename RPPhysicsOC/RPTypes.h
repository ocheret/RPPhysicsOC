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
typedef short                RPInt16;
typedef unsigned short       RPUInt16;
typedef int                  RPint32;
typedef unsigned int         RPUint32;
typedef long long            RPInt64;
typedef unsigned long long   RPUint64;
typedef float                RPReal32;
typedef double               RPReal64;

// We can use the preprocessor to change precision at some point
typedef float               RPReal;
#define RPReal_SQRT(x)      sqrtf(x)
#define RPReal_ABS(x)       fabsf(x)
#define RPReal_SIN(x)       sinf(x)
#define RPReal_COS(x)       cosf(x)
#define RPReal_EXP(x)       expf(x)
#define RPReal_POW(x, y)    powf(x, y)
#define RPReal_MOD(x, y)    fmodf(x)

#define RP_PI 3.14159f
#define RPReal_MAX FLT_MAX
#define RPReal_MIN FLT_MIN

union _RPVector3 {
    struct { RPReal x, y, z; };
    struct { RPReal r, g, b; };
    struct { RPReal s, t, p; };
    RPReal v[3];
};
typedef union _RPVector3 RPVector3;

union _RPMatrix3 {
    struct {
        RPReal m00, m01, m02;
        RPReal m10, m11, m12;
        RPReal m20, m21, m22;
    };
    RPReal m[9];
};
typedef union _RPMatrix3 RPMatrix3;

union _RPMatrix3x4 {
    struct {
        RPReal m00, m01, m02; // m03 assumed 0
        RPReal m10, m11, m12; // m13 assumed 0
        RPReal m20, m21, m22; // m23 assumed 0
        RPReal m30, m31, m32; // m33 assumed 1
    };
    RPReal v[12];
};
typedef union _RPMatrix3x4 RPMatrix3x4;

union _RPQuaternion {
    struct { RPVector3 v; RPReal s; };
    struct { RPReal x, y, z, w; };
    RPReal q[4];
};
typedef union _RPQuaternion RPQuaternion;
