//
//  RPVector3.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/1/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"

extern const RPVector3 RP_GRAVITY;

static __inline__ RPVector3 *RPVector3SetWithArray(RPVector3 *me,
                                                   RPReal values[3])
{
    me->x = values[0]; me->y = values[1]; me->z = values[2];
    return me;
}

static __inline__ RPVector3 *RPVector3Clear(RPVector3 *me) {
    me->x = me->y = me->z = 0;
    return me;
}

static __inline__ RPVector3 *RPVector3Negate(RPVector3 *me, RPVector3 *vector)
{
    me->x = -vector->x; me->y = -vector->y; me->z = -vector->z;
    return me;
}

static __inline__ RPVector3 *RPVector3Add(RPVector3 *me, RPVector3 *right)
{
    me->x += right->x; me->y += right->y; me->z += right->z;
    return me;
}

static __inline__ RPVector3 *RPVector3AddScaledVector(RPVector3 *me,
                                                      RPVector3 *vector,
                                                      RPReal scalar)
{
    me->x += vector->x * scalar;
    me->y += vector->y * scalar;
    me->z += vector->z * scalar;
    return me;
}

static __inline__ RPVector3 *RPVector3Subtract(RPVector3 *me,
                                               RPVector3 *right)
{
    me->x -= right->x; me->y -= right->y; me->z -= right->z;
    return me;
}

static __inline__ RPVector3 *RPVector3Multiply(RPVector3 *me,
                                               RPVector3 *right)
{
    me->x *= right->x; me->y *= right->y; me->z *= right->z;
    return me;
}

static __inline__ RPVector3 *RPVector3Divide(RPVector3 *me,
                                             RPVector3 *right)
{
    me->x /= right->x; me->y /= right->y; me->z /= right->z;
    return me;
}

static __inline__ RPVector3* RPVector3AddScalar(RPVector3 *me, RPReal value)
{
    me->x += value; me->y += value; me->z += value;
    return me;
}

static __inline__ RPVector3 *RPVector3SubtractScalar(RPVector3 *me,
                                                     RPReal value)
{
    me->x -= value; me->y -= value; me->z -= value;
    return me;
}

static __inline__ RPVector3 *RPVector3MultiplyScalar(RPVector3 *me,
                                                     RPReal value)
{
    me->x *= value; me->y *= value; me->z *= value;
    return me;
}

static __inline__ RPVector3 *RPVector3DivideScalar(RPVector3 *me,
                                                   RPReal value)
{
    me->x /= value; me->y /= value; me->z /= value;
    return me;
}

static __inline__ RPVector3 *RPVector3Maximum(RPVector3 *me,
                                              RPVector3 *left,
                                              RPVector3 *right)
{
    me->x = (left->x > right->x) ? left->x : right->x;
    me->y = (left->y > right->y) ? left->y : right->y;
    me->z = (left->z > right->z) ? left->z : right->z;
    return me;
}

static __inline__ RPVector3 *RPVector3Minimum(RPVector3 *me,
                                              RPVector3 *left,
                                              RPVector3 *right)
{
    me->x = (left->x < right->x) ? left->x : right->x;
    me->y = (left->y < right->y) ? left->y : right->y;
    me->z = (left->z < right->z) ? left->z : right->z;
    return me;
}

static __inline__ BOOL RPVector3AllEqualTo(RPVector3 *left,
                                           RPVector3 *right)
{
    return (left->x == right->x && left->y == right->y && left->z == right->z);
}

static __inline__ BOOL RPVector3AllEqualToScalar(RPVector3 *a, RPReal value)
{
    return (a->x == value && a->y == value && a->z == value);
}

static __inline__ BOOL RPVector3AllGreaterThan(RPVector3 *left,
                                               RPVector3 *right)
{
    return (left->x > right->x && left->y > right->y && left->z > right->z);
}

static __inline__ BOOL RPVector3AllGreaterThanScalar(RPVector3 *a, RPReal value)
{
    return (a->x > value && a->y > value && a->z > value);
}

static __inline__ BOOL RPVector3AllGreaterThanOrEqualTo(RPVector3 *left,
                                                        RPVector3 *right)
{
    return (left->x >= right->x && left->y >= right->y && left->z >= right->z);
}

static __inline__ BOOL RPVector3AllGreaterThanOrEqualToScalar(RPVector3 *a,
                                                              RPReal value)
{
    return (a->x >= value && a->y >= value && a->z >= value);
}

static __inline__ RPReal RPVector3DotProduct(RPVector3 *left, RPVector3 *right)
{
    return left->x * right->x + left->y * right->y + left->z * right->z;
}

static __inline__ RPVector3 *RPVector3CrossProduct(RPVector3 *me,
                                                   RPVector3 *left,
                                                   RPVector3 *right)
{
    RPVector3 a = {
        left->y * right->z - left->z * right->y,
        left->z * right->x - left->x * right->z,
        left->x * right->y - left->y * right->x
    };
    *me = a;
    return me;
}

static __inline__ RPReal RPVector3LengthSquared(RPVector3 *a)
{
    return a->x * a->x + a->y * a->y + a->z * a->z;
}

static __inline__ RPReal RPVector3Length(RPVector3 *w)
{
    return RPReal_SQRT(w->x * w->x + w->y * w->y + w->z * w->z);
}

static __inline__ RPVector3 *RPVector3Normalize(RPVector3 *me, RPVector3 *w)
{
    RPReal scale = 1.0f / RPVector3Length(w);
    me->x = w->x * scale; me->y = w->y * scale; me->z = w->z * scale;
    return me;
}

static __inline__ RPVector3 *RPVector3TrimTo(RPVector3 *me, RPReal size)
{
    if (RPVector3LengthSquared(me) > size * size) {
        RPVector3MultiplyScalar(RPVector3Normalize(me, me), size);
    }
    return me;
}

static __inline__ NSString *RPVector3Description(RPVector3 *me) {
    return [NSString stringWithFormat:@"{%f, %f, %f}", me->x, me->y, me->z];
}
