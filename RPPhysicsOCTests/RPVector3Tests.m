//
//  RPVector3Tests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/2/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPVector3Tests.h"

@implementation RPVector3Tests

#define TESTX 123.456f
#define TESTY 234.567f
#define TESTZ 345.678f

- (void)testMake
{
    RPVector3 a = RPVector3Make(TESTX, TESTY, TESTZ);
    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
                 @"RPVector3Make failed");
}
//
//static __inline__ RPVector3 RPVector3Make(RPReal x, RPReal y, RPReal z)
//{
//    RPVector3 a = { x, y, z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3Set(RPVector3 *me,
//                                          RPReal x, RPReal y, RPReal z)
//{
//    me->x = x; me->y = y; me->z = z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3MakeWithArray(RPReal values[3])
//{
//    RPVector3 a = { values[0], values[1], values[2] };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3SetWithArray(RPVector3 *me,
//                                                   RPReal values[3])
//{
//    me->x = values[0]; me->y = values[1]; me->z = values[2];
//    return me;
//}
//
//static __inline__ RPVector3 *RPVector3Clear(RPVector3 *me) {
//    me->x = me->y = me->z = 0;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Negate(RPVector3 *vector)
//{
//    RPVector3 a = { -vector->x, -vector->y, -vector->z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3NegateOf(RPVector3 *me)
//{
//    me->x = -me->x; me->y = -me->y; me->z = -me->z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Add(RPVector3 *left, RPVector3 *right)
//{
//    RPVector3 a = {
//        left->x + right->x, left->y + right->y, left->z + right->z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3AddTo(RPVector3 *me, RPVector3 *right)
//{
//    me->x += right->x; me->y += right->y; me->z += right->z;
//    return me;
//}
//
//static __inline__ RPVector3 *RPVector3AddScaledVectorTo(RPVector3 *me,
//                                                        RPVector3 *vector,
//                                                        RPReal scalar)
//{
//    me->x += vector->x * scalar;
//    me->y += vector->x * scalar;
//    me->z += vector->z * scalar;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Subtract(RPVector3 *left, RPVector3 *right)
//{
//    RPVector3 a = {
//        left->x - right->x, left->y - right->y, left->z - right->z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3SubtractFrom(RPVector3 *me,
//                                                   RPVector3 *right)
//{
//    me->x -= right->x; me->y -= right->y; me->z -= right->z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Multiply(RPVector3 *left,
//                                              RPVector3 *right)
//{
//    RPVector3 a = {
//        left->x * right->x, left->y * right->y, left->z * right->z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3MultiplyBy(RPVector3 *me,
//                                                 RPVector3 *right)
//{
//    me->x *= right->x; me->y *= right->y; me->z *= right->z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Divide(RPVector3 *left,
//                                            RPVector3 *right)
//{
//    RPVector3 a = {
//        left->x / right->x, left->y / right->y, left->z / right->z };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3DivideBy(RPVector3 *me,
//                                               RPVector3 *right)
//{
//    me->x /= right->x; me->y /= right->y; me->z /= right->z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3AddScalar(RPVector3 *w, RPReal value)
//{
//    RPVector3 a = { w->x + value, w->y + value, w->z + value };
//    return a;
//}
//
//static __inline__ RPVector3* RPVector3AddScalarTo(RPVector3 *me, RPReal value)
//{
//    me->x += value; me->y += value; me->z += value;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3SubtractScalar(RPVector3 *w, RPReal value)
//{
//    RPVector3 a = { w->x - value, w->y - value, w->z - value };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3SubtractScalarFrom(RPVector3 *me,
//                                                         RPReal value)
//{
//    me->x -= value; me->y -= value; me->z -= value;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3MultiplyScalar(RPVector3 *w, RPReal value)
//{
//    RPVector3 a = { w->x * value, w->y * value, w->z * value };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3MultiplyScalarBy(RPVector3 *me,
//                                                       RPReal value)
//{
//    me->x *= value; me->y *= value; me->z *= value;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3DivideScalar(RPVector3 *w, RPReal value)
//{
//    RPVector3 a = { w->x / value, w->y / value, w->z / value };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3DivideScalarBy(RPVector3 *me,
//                                                     RPReal value)
//{
//    me->x /= value; me->y /= value; me->z /= value;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Maximum(RPVector3 *left, RPVector3 *right)
//{
//    RPVector3 max;
//    max.x = (left->x > right->x) ? left->x : right->x;
//    max.y = (left->y > right->y) ? left->y : right->y;
//    max.z = (left->z > right->z) ? left->z : right->z;
//    return max;
//}
//
//static __inline__ RPVector3 *RPVector3MaximumTo(RPVector3 *me,
//                                                RPVector3 *left,
//                                                RPVector3 *right)
//{
//    me->x = (left->x > right->x) ? left->x : right->x;
//    me->y = (left->y > right->y) ? left->y : right->y;
//    me->z = (left->z > right->z) ? left->z : right->z;
//    return me;
//}
//
//static __inline__ RPVector3 RPVector3Minimum(RPVector3 *left,
//                                             RPVector3 *right)
//{
//    RPVector3 min;
//    min.x = (left->x < right->x) ? left->x : right->x;
//    min.y = (left->y < right->y) ? left->y : right->y;
//    min.z = (left->z < right->z) ? left->z : right->z;
//    return min;
//}
//
//static __inline__ RPVector3 *RPVector3MinimumTo(RPVector3 *me,
//                                                RPVector3 *left,
//                                                RPVector3 *right)
//{
//    me->x = (left->x < right->x) ? left->x : right->x;
//    me->y = (left->y < right->y) ? left->y : right->y;
//    me->z = (left->z < right->z) ? left->z : right->z;
//    return me;
//}
//
//
//static __inline__ BOOL RPVector3AllEqualToVector3(RPVector3 *left,
//                                                  RPVector3 *right)
//{
//    return (left->x == right->x && left->y == right->y && left->z == right->z);
//}
//
//static __inline__ BOOL RPVector3AllEqualToScalar(RPVector3 *a, RPReal value)
//{
//    return (a->x == value && a->y == value && a->z == value);
//}
//
//static __inline__ BOOL RPVector3AllGreaterThanVector3(RPVector3 *left,
//                                                      RPVector3 *right)
//{
//    return (left->x > right->x && left->y > right->y && left->z > right->z);
//}
//
//static __inline__ BOOL RPVector3AllGreaterThanScalar(RPVector3 *a, RPReal value)
//{
//    return (a->x > value && a->y > value && a->z > value);
//}
//
//static __inline__ BOOL RPVector3AllGreaterThanOrEqualToVector3(RPVector3 *left,
//                                                               RPVector3 *right)
//{
//    return (left->x >= right->x && left->y >= right->y && left->z >= right->z);
//}
//
//static __inline__ BOOL RPVector3AllGreaterThanOrEqualToScalar(RPVector3 *a,
//                                                              RPReal value)
//{
//    return (a->x >= value && a->y >= value && a->z >= value);
//}
//
//static __inline__ RPReal RPVector3DotProduct(RPVector3 *left, RPVector3 *right)
//{
//    return left->x * right->x + left->y * right->y + left->z * right->z;
//}
//
//static __inline__ RPVector3 RPVector3CrossProduct(RPVector3 *left,
//                                                  RPVector3 *right)
//{
//    RPVector3 a = {
//        left->y * right->z - left->z * right->y,
//        left->z * right->x - left->x * right->z,
//        left->x * right->y - left->y * right->x
//    };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3CrossProductTo(RPVector3 *me,
//                                                     RPVector3 *left,
//                                                     RPVector3 *right)
//{
//    me->x = left->y * right->z - left->z * right->y;
//    me->y = left->z * right->x - left->x * right->z;
//    me->z = left->x * right->y - left->y * right->x;
//    return me;
//}
//
//static __inline__ RPReal RPVector3LengthSquared(RPVector3 *a)
//{
//    return a->x * a->x + a->y * a->y + a->z * a->z;
//}
//
//static __inline__ RPReal RPVector3Length(RPVector3 *w)
//{
//    return RPReal_SQRT(w->x * w->x + w->y * w->y + w->z * w->z);
//}
//
//static __inline__ RPVector3 RPVector3Normalize(RPVector3 *w)
//{
//    RPReal scale = 1.0 / RPVector3Length(w);
//    RPVector3 a = { w->x * scale, w->y * scale, w->z * scale };
//    return a;
//}
//
//static __inline__ RPVector3 *RPVector3NormalizeTo(RPVector3 *me, RPVector3 *w)
//{
//    RPReal scale = 1.0 / RPVector3Length(w);
//    me->x = w->x * scale; me->y = w->y * scale; me->z = w->z * scale;
//    return me;
//}
//
//static __inline__ RPVector3 *RPVector3TrimTo(RPVector3 *me, RPReal size)
//{
//    if (RPVector3LengthSquared(me) > size * size) {
//        RPVector3MultiplyScalarBy(RPVector3NormalizeTo(me, me), size);
//    }
//    return me;
//}


@end
