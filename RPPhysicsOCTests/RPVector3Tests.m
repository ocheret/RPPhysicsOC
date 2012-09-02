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

- (void)testSet
{
    RPVector3 a = { 0.0f, 0.0f, 0.0f };
    RPVector3 *b = RPVector3Set(&a, TESTX, TESTY, TESTZ);
    STAssertEquals(&a, b, @"RPVector3Set didn't return its argument");
    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
                 @"RPVector3Set failed");
}

- (void)testMakeWithArray
{
    RPReal values[] = { TESTX, TESTY, TESTZ };
    RPVector3 a = RPVector3MakeWithArray(values);
    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
                 @"RPVector3MakeWithArray failed");
}

- (void)testSetWithArray
{
    RPReal values[] = { TESTX, TESTY, TESTZ };
    RPVector3 a = { 0.0f, 0.0f, 0.0f };
    RPVector3 *b = RPVector3SetWithArray(&a, values);
    STAssertEquals(&a, b, @"RPVector3SetWithArray didn't return its argument");
    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
                 @"RPVector3SetWithArray failed");
}

- (void)testClear
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3Clear(&a);
    STAssertEquals(&a, b, @"RPVector3SetClear didn't return its argument");
    STAssertTrue(a.x == 0.0f && a.y == 0.0f && a.z == 0.0f,
                 @"RPVector3Clear failed");
}

- (void)testNegate
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    a = RPVector3Negate(&a);
    STAssertTrue(a.x == -TESTX && a.y == -TESTY && a.z == -TESTZ,
                 @"RPVector3Negate failed");
}

- (void)testNegateOf
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3NegateOf(&a);
    STAssertEquals(&a, b, @"RPVector3NegateOf didn't return its argument");
    STAssertTrue(a.x == -TESTX && a.y == -TESTY && a.z == -TESTZ,
                 @"RPVector3NegateOf failed");

}

- (void)testAdd
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = a;
    a = RPVector3Add(&a, &b);
    STAssertTrue(a.x == 2*TESTX && a.y == 2*TESTY && a.z == 2*TESTZ,
                 @"RPVector3Add failed");
}

- (void)testAddTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3AddTo(&a, &a);
    STAssertEquals(&a, b, @"RPVector3AddTo didn't return its argument");
    STAssertTrue(a.x == 2*TESTX && a.y == 2*TESTY && a.z == 2*TESTZ,
                 @"RPVector3AddTo failed");
}

- (void)testAddScaledVectorTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3AddScaledVectorTo(&a, &a, 2.0f);
    STAssertEquals(&a, b, @"RPVector3AddScaledVectorTo didn't return its argument");
    STAssertTrue(a.x == 3*TESTX && a.y == 3*TESTY && a.z == 3*TESTZ,
                 @"RPVector3AddScaledVectorTo failed");

}

- (void)testSubtract
{
    RPVector3 a = { 2*TESTX, 2*TESTY, 2*TESTZ };
    RPVector3 b = { TESTX, TESTY, TESTZ };
    a = RPVector3Subtract(&a, &b);
    STAssertTrue(a.x == TESTX && a.y == TESTY && a.z == TESTZ,
                 @"RPVector3Subtract failed");
}

- (void)testSubtractFrom
{
    RPVector3 a = { 2*TESTX, 2*TESTY, 2*TESTZ };
    RPVector3 c = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3SubtractFrom(&a, &c);
    STAssertEquals(&a, b, @"RPVector3SubtractFrom didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY && a.z == TESTZ,
                 @"RPVector3SubtractFrom failed");
}

- (void)testMultiply
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = { 1.0f, 2.0f, 3.0f };
    a = RPVector3Multiply(&a, &b);
    STAssertTrue(a.x == TESTX && a.y == 2*TESTY && a.z == 3*TESTZ,
                 @"RPVector3Multiply failed");
}

- (void)testMultiplyBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3MultiplyBy(&a, &c);
    STAssertEquals(&a, b, @"RPVector3MultiplyBy didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == 2*TESTY && a.z == 3*TESTZ,
                 @"RPVector3MultiplyBy failed");
}

- (void)testDivide
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = { 1.0f, 2.0f, 3.0f };
    a = RPVector3Divide(&a, &b);
    STAssertTrue(a.x == TESTX && a.y == TESTY / 2.0f && a.z == TESTZ / 3.0f,
                 @"RPVector3Divide failed");
}

- (void)testDivideBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3DivideBy(&a, &c);
    STAssertEquals(&a, b, @"RPVector3DivideBy didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY / 2.0f && a.z == TESTZ / 3.0f,
                 @"RPVector3DivideBy failed");
}

- (void)testAddScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    a = RPVector3AddScalar(&a, 1.0f);
    STAssertTrue(a.x == 1.0f + TESTX &&
                 a.y == 1.0f + TESTY &&
                 a.z == 1.0f + TESTZ,
                 @"RPVector3AddScalar failed");
}

- (void)testAddScalarTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3AddScalarTo(&a, 1.0f);
    STAssertEquals(&a, b, @"RPVector3AddScalarTo didn't return its argument");
    STAssertTrue(a.x == 1.0f + TESTX &&
                 a.y == 1.0f + TESTY &&
                 a.z == 1.0f + TESTZ,
                 @"RPVector3AddScalarTo failed");
}

- (void)testSubtractScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    a = RPVector3SubtractScalar(&a, 1.0f);
    STAssertTrue(a.x == TESTX - 1.0f &&
                 a.y == TESTY - 1.0f &&
                 a.z == TESTZ - 1.0f,
                 @"RPVector3SubtractScalar failed");
}

- (void)testSubtractScalarFrom
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3SubtractScalarFrom(&a, 1.0f);
    STAssertEquals(&a, b,
                   @"RPVector3SubtractScalarFrom didn't return its argument");
    STAssertTrue(a.x == TESTX - 1.0f &&
                 a.y == TESTY - 1.0f &&
                 a.z == TESTZ - 1.0f,
                 @"RPVector3SubtractScalarFrom failed");
}

- (void)testMultiplyScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    a = RPVector3MultiplyScalar(&a, 3.0f);
    STAssertTrue(a.x == 3 * TESTX &&
                 a.y == 3 * TESTY &&
                 a.z == 3 * TESTZ,
                 @"RPVector3MultiplyScalar failed");
}

- (void)testMultiplyScalarBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3MultiplyScalarBy(&a, 3.0f);
    STAssertEquals(&a, b, @"RPVector3MultiplyScalarBy didn't return its argument");
    STAssertTrue(a.x == 3 * TESTX &&
                 a.y == 3 * TESTY &&
                 a.z == 3 * TESTZ,
                 @"RPVector3MultiplyScalarBy failed");
}

- (void)testDivideScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    a = RPVector3DivideScalar(&a, 2.0f);
    STAssertTrue(a.x == TESTX / 2.0f &&
                 a.y == TESTY / 2.0f &&
                 a.z == TESTZ / 2.0f,
                 @"RPVector3DivideScalar failed");
}

- (void)testDivideScalarBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3DivideScalarBy(&a, 2.0f);
    STAssertEquals(&a, b, @"RPVector3DivideScalarBy didn't return its argument");
    STAssertTrue(a.x == TESTX / 2.0f &&
                 a.y == TESTY / 2.0f &&
                 a.z == TESTZ / 2.0f,
                 @"RPVector3DivideScalarBy failed");
}

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
