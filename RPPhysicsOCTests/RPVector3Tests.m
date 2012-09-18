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
    RPVector3 *b = RPVector3Negate(&a, &a);
    STAssertEquals(&a, b, @"RPVector3Negate didn't return its argument");
    STAssertTrue(a.x == -TESTX && a.y == -TESTY && a.z == -TESTZ,
                 @"RPVector3Negate failed");

}

- (void)testAdd
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3Add(&a, &a);
    STAssertEquals(&a, b, @"RPVector3Add didn't return its argument");
    STAssertTrue(a.x == 2*TESTX && a.y == 2*TESTY && a.z == 2*TESTZ,
                 @"RPVector3Add failed");
}

- (void)testAddScaledVector
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3AddScaledVector(&a, &a, 2.0f);
    STAssertEquals(&a, b,
                   @"RPVector3AddScaledVector didn't return its argument");
    STAssertTrue(a.x == 3*TESTX && a.y == 3*TESTY && a.z == 3*TESTZ,
                 @"RPVector3AddScaledVector failed");

}

- (void)testSubtract
{
    RPVector3 a = { 2*TESTX, 2*TESTY, 2*TESTZ };
    RPVector3 c = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3Subtract(&a, &c);
    STAssertEquals(&a, b, @"RPVector3Subtract didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY && a.z == TESTZ,
                 @"RPVector3Subtract failed");
}

- (void)testMultiply
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3Multiply(&a, &c);
    STAssertEquals(&a, b, @"RPVector3Multiply didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == 2*TESTY && a.z == 3*TESTZ,
                 @"RPVector3Multiply failed");
}

- (void)testDivide
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3Divide(&a, &c);
    STAssertEquals(&a, b, @"RPVector3Divide didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY / 2.0f && a.z == TESTZ / 3.0f,
                 @"RPVector3Divide failed");
}

- (void)testAddScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3AddScalar(&a, 1.0f);
    STAssertEquals(&a, b, @"RPVector3AddScalar didn't return its argument");
    STAssertTrue(a.x == 1.0f + TESTX &&
                 a.y == 1.0f + TESTY &&
                 a.z == 1.0f + TESTZ,
                 @"RPVector3AddScalar failed");
}

- (void)testSubtractScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3SubtractScalar(&a, 1.0f);
    STAssertEquals(&a, b,
                   @"RPVector3SubtractScalar didn't return its argument");
    STAssertTrue(a.x == TESTX - 1.0f &&
                 a.y == TESTY - 1.0f &&
                 a.z == TESTZ - 1.0f,
                 @"RPVector3SubtractScalar failed");
}

- (void)testMultiplyScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3MultiplyScalar(&a, 3.0f);
    STAssertEquals(&a, b,
                   @"RPVector3MultiplyScalar didn't return its argument");
    STAssertTrue(a.x == 3 * TESTX &&
                 a.y == 3 * TESTY &&
                 a.z == 3 * TESTZ,
                 @"RPVector3MultiplyScalar failed");
}

- (void)testDivideScalar
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3DivideScalar(&a, 2.0f);
    STAssertEquals(&a, b,
                   @"RPVector3DivideScalar didn't return its argument");
    STAssertTrue(a.x == TESTX / 2.0f &&
                 a.y == TESTY / 2.0f &&
                 a.z == TESTZ / 2.0f,
                 @"RPVector3DivideScalar failed");
}

- (void)testMaximum
{
    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
    RPVector3 b = { TESTX, TESTY, TESTZ };
    RPVector3 c;

    RPVector3 *d = RPVector3Maximum(&c, &a, &b);
    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
                 @"RPVector3Maximum a,b failed");
    d = RPVector3Maximum(&c, &b, &a);
    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
                 @"RPVector3MaximumTo b,a failed");
    STAssertEquals(&c, d, @"RPVector3Maximum didn't return its argument");
}

- (void)testMinimum
{
    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
    RPVector3 b = { TESTX, TESTY, TESTZ };
    RPVector3 c;

    RPVector3 *d = RPVector3Minimum(&c, &a, &b);
    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
                 @"RPVector3Minimum a,b failed");
    d = RPVector3Minimum(&c, &b, &a);
    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
                 @"RPVector3MaximumTo b,a failed");
    STAssertEquals(&c, d, @"RPVector3Minimum didn't return its argument");
}

- (void)testAllEqualTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = a;
    STAssertTrue(RPVector3AllEqualTo(&a, &b),
                 @"RPvector3AllEqualTo x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = -1000;
        STAssertFalse(RPVector3AllEqualTo(&a, &b),
                      @"RPVector3AllEqualTo %d failed", i);
        a.v[i] = tmp;
    }
}

- (void)testAllEqualToScalar
{
    RPVector3 a = { 100, 100, 100 };
    STAssertTrue(RPVector3AllEqualToScalar(&a, 100),
                 @"RPVector3AllEqualToScalar failed");
    for (int i = 0; i < 3; i++) {
        a.v[i] = 123;
        STAssertFalse(RPVector3AllEqualToScalar(&a, 100),
                      @"RPVector3AllEqualToScalar %d failed", i);
        a.v[i] = 100;
    }
}

- (void)testAllGreaterThanVector3
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = { -TESTX, -TESTY, -TESTZ };
    STAssertTrue(RPVector3AllGreaterThan(&a, &b),
                 @"RPvector3AllGreaterThanVector3 x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = b.v[i];
        STAssertFalse(RPVector3AllGreaterThan(&a, &b),
                      @"RPVector3AllGreaterThanVector3 %d failed on ==", i);
        a.v[i] = 2 * b.v[i];
        STAssertFalse(RPVector3AllGreaterThan(&a, &b),
                      @"RPVector3AllGreaterThanVector3 %d failed on <", i);
        a.v[i] = tmp;
    }
}

- (void)testAllGreaterThanScalar
{
    RPVector3 a = { 100, 200, 300 };
    STAssertTrue(RPVector3AllGreaterThanScalar(&a, 50),
                 @"RPVector3AllGreaterThanScalar failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = 50;
        STAssertFalse(RPVector3AllGreaterThanScalar(&a, 50),
                      @"RPVector3AllGreaterThanScalar %d failed on ==", i);
        a.v[i] = 10;
        STAssertFalse(RPVector3AllGreaterThanScalar(&a, 50),
                      @"RPVector3AllGreaterThanScalar %d failed on <", i);
        a.v[i] = tmp;
    }
}

- (void)testAllGreaterThanOrEqualTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = { -TESTX, -TESTY, -TESTZ };
    STAssertTrue(RPVector3AllGreaterThanOrEqualTo(&a, &b),
                 @"RPvector3AllGreaterThanOrEqualTo x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = b.v[i];
        STAssertTrue(RPVector3AllGreaterThanOrEqualTo(&a, &b),
                     @"RPVector3AllGreaterThanOrEqualTo %d failed ==",
                     i);
        a.v[i] = 2 * b.v[i];
        STAssertFalse(RPVector3AllGreaterThanOrEqualTo(&a, &b),
                      @"RPVector3AllGreaterThanOrEqualTo %d failed <",
                      i);
        a.v[i] = tmp;
    }
}

- (void)testAllGreaterThanOrEqualToScalar
{
    RPVector3 a = { 100, 200, 300 };
    STAssertTrue(RPVector3AllGreaterThanOrEqualToScalar(&a, 50),
                 @"RPVector3AllGreaterThanOrEqualToScalar failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = 50;
        STAssertTrue(RPVector3AllGreaterThanOrEqualToScalar(&a, 50),
                     @"RPVector3AllGreaterThanOrEqualToScalar %d failed on ==",
                     i);
        a.v[i] = 10;
        STAssertFalse(RPVector3AllGreaterThanOrEqualToScalar(&a, 50),
                      @"RPVector3AllGreaterThanOrEqualToScalar %d failed on <",
                      i);
        a.v[i] = tmp;
    }
}

- (void)testDotProduct
{
    RPVector3 a = { 1, 2, 3 };
    RPVector3 b = { 100, 10, 1 };
    RPReal dp = RPVector3DotProduct(&a, &b);
    STAssertEquals(dp, 123.0f, @"RPVector3DotProduct failed %f vs 123.0", dp);
}

- (void)testCrossProduct
{
    RPVector3 x = { 1, 0, 0 };
    RPVector3 y = { 0, 1, 0 };
    RPVector3 z = { 0, 0, 1 };

    RPVector3 a;
    RPVector3 *b;

    a = x;
    b = RPVector3CrossProduct(&a, &a, &y);
    STAssertTrue(RPVector3AllEqualTo(&a, &z),
                 @"RPVector3CrossProduct x X y != z");

    a = y;
    b = RPVector3CrossProduct(&a, &a, &z);
    STAssertTrue(RPVector3AllEqualTo(&a, &x),
                 @"RPVector3CrossProduct y X z != x");

    a = z;
    b = RPVector3CrossProduct(&a, &a, &x);
    STAssertTrue(RPVector3AllEqualTo(&a, &y),
                 @"RPVector3CrossProduct z X x != y");

    a = y;
    b = RPVector3CrossProduct(&a, &a, &x);
    RPVector3MultiplyScalar(&a, -1);
    STAssertTrue(RPVector3AllEqualTo(&a, &z),
                 @"RPVector3CrossProduct y X x != -z");

    a = z;
    b = RPVector3CrossProduct(&a, &a, &y);
    RPVector3MultiplyScalar(&a, -1);
    STAssertTrue(RPVector3AllEqualTo(&a, &x),
                 @"RPVector3CrossProduct z X y != -x");

    a = x;
    b = RPVector3CrossProduct(&a, &a, &z);
    RPVector3MultiplyScalar(&a, -1);
    STAssertTrue(RPVector3AllEqualTo(&a, &y),
                 @"RPVector3CrossProduct x X z != -y");

    STAssertEquals(&a, b,
                   @"RPVector3CrossProduct didn't return its argument");
}

- (void)testLengthSquared
{
    RPVector3 a = { 1, 2, 3 };
    RPReal l2 = RPVector3LengthSquared(&a);
    STAssertEquals(l2, 14.0f, @"RPVector3LengthSquared failed %lf != 14.0", l2);
}

- (void)testLength
{
    RPVector3 a = { 1, 2, 3 };
    RPReal l2 = RPVector3LengthSquared(&a);
    RPReal l = RPVector3Length(&a);
    STAssertEquals(l, RPReal_SQRT(l2), @"RPVector3Length failed");
}

- (void)testNormalize
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3Normalize(&a, &a);
    STAssertEquals(&a, b,
                   @"RPVector3Normalize didn't return its argument");
    RPReal l2 = RPVector3LengthSquared(b);
    STAssertEqualsWithAccuracy(l2, 1.0f, 0.000001f,
                               @"RPVector3Normalize failed l2 = %f", l2);
}

- (void)testTrimTo
{
    RPVector3 a = { 1, 2, 3 };
    RPVector3 *b = RPVector3TrimTo(&a, 100);
    STAssertEquals(&a, b,
                   @"RPVector3TrimTo didn't return its argument");
    STAssertTrue(a.x == 1 && a.y == 2 && a.z == 3,
                 @"RPVector3TrimTo trimmed when it shouldn't have");


    b = RPVector3TrimTo(&a, 1);
    RPReal l = RPVector3Length(b);
    STAssertEqualsWithAccuracy(l, 1.0f, 0.000001f,
                 @"RPVector3TrimTo wrong length %f", l);

}

//- (void)testStructPerformance
//{
//    GLKVector3 xglk = { 123, 456, 789 };
//    GLKVector3 vglk;
//
//#define ITERATIONS 100000
//    NSDate *start = [NSDate date];
//    for (int i = 0; i < ITERATIONS; i++) {
//        vglk = GLKVector3Negate(xglk);
//    }
//    NSTimeInterval tiglk = [start timeIntervalSinceNow];
//
//    RPVector3 xrp = { 123, 456, 789 };
//    RPVector3 vrp;
//
//    start = [NSDate date];
//    for (int i = 0; i < ITERATIONS; i++) {
//        RPVector3Negate(&vrp, &xrp);
//    }
//    NSTimeInterval tirp = [start timeIntervalSinceNow];
//
//    STAssertTrue(tirp < tiglk,
//        @"Passing struct by value seems to be faster than by reference!");
//}

@end
