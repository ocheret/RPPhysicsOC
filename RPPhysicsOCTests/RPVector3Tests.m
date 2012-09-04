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

//- (void)testMake
//{
//    RPVector3 a = RPVector3Make(TESTX, TESTY, TESTZ);
//    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
//                 @"RPVector3Make failed");
//}

//- (void)testSet
//{
//    RPVector3 a = { 0.0f, 0.0f, 0.0f };
//    RPVector3 *b = RPVector3Set(&a, TESTX, TESTY, TESTZ);
//    STAssertEquals(&a, b, @"RPVector3Set didn't return its argument");
//    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
//                 @"RPVector3Set failed");
//}

//- (void)testMakeWithArray
//{
//    RPReal values[] = { TESTX, TESTY, TESTZ };
//    RPVector3 a = RPVector3MakeWithArray(values);
//    STAssertTrue((a.x == TESTX && a.y == TESTY && a.z == TESTZ),
//                 @"RPVector3MakeWithArray failed");
//}

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

//- (void)testNegate
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    a = RPVector3Negate(&a);
//    STAssertTrue(a.x == -TESTX && a.y == -TESTY && a.z == -TESTZ,
//                 @"RPVector3Negate failed");
//}

- (void)testNegateOf
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3NegateOf(&a);
    STAssertEquals(&a, b, @"RPVector3NegateOf didn't return its argument");
    STAssertTrue(a.x == -TESTX && a.y == -TESTY && a.z == -TESTZ,
                 @"RPVector3NegateOf failed");

}

//- (void)testAdd
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    RPVector3 b = a;
//    a = RPVector3Add(&a, &b);
//    STAssertTrue(a.x == 2*TESTX && a.y == 2*TESTY && a.z == 2*TESTZ,
//                 @"RPVector3Add failed");
//}

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
    STAssertEquals(&a, b,
                   @"RPVector3AddScaledVectorTo didn't return its argument");
    STAssertTrue(a.x == 3*TESTX && a.y == 3*TESTY && a.z == 3*TESTZ,
                 @"RPVector3AddScaledVectorTo failed");

}

//- (void)testSubtract
//{
//    RPVector3 a = { 2*TESTX, 2*TESTY, 2*TESTZ };
//    RPVector3 b = { TESTX, TESTY, TESTZ };
//    a = RPVector3Subtract(&a, &b);
//    STAssertTrue(a.x == TESTX && a.y == TESTY && a.z == TESTZ,
//                 @"RPVector3Subtract failed");
//}

- (void)testSubtractFrom
{
    RPVector3 a = { 2*TESTX, 2*TESTY, 2*TESTZ };
    RPVector3 c = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3SubtractFrom(&a, &c);
    STAssertEquals(&a, b, @"RPVector3SubtractFrom didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY && a.z == TESTZ,
                 @"RPVector3SubtractFrom failed");
}

//- (void)testMultiply
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    RPVector3 b = { 1.0f, 2.0f, 3.0f };
//    a = RPVector3Multiply(&a, &b);
//    STAssertTrue(a.x == TESTX && a.y == 2*TESTY && a.z == 3*TESTZ,
//                 @"RPVector3Multiply failed");
//}

- (void)testMultiplyBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3MultiplyBy(&a, &c);
    STAssertEquals(&a, b, @"RPVector3MultiplyBy didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == 2*TESTY && a.z == 3*TESTZ,
                 @"RPVector3MultiplyBy failed");
}

//- (void)testDivide
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    RPVector3 b = { 1.0f, 2.0f, 3.0f };
//    a = RPVector3Divide(&a, &b);
//    STAssertTrue(a.x == TESTX && a.y == TESTY / 2.0f && a.z == TESTZ / 3.0f,
//                 @"RPVector3Divide failed");
//}

- (void)testDivideBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 c = { 1.0f, 2.0f, 3.0f };
    RPVector3 *b = RPVector3DivideBy(&a, &c);
    STAssertEquals(&a, b, @"RPVector3DivideBy didn't return its argument");
    STAssertTrue(a.x == TESTX && a.y == TESTY / 2.0f && a.z == TESTZ / 3.0f,
                 @"RPVector3DivideBy failed");
}

//- (void)testAddScalar
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    a = RPVector3AddScalar(&a, 1.0f);
//    STAssertTrue(a.x == 1.0f + TESTX &&
//                 a.y == 1.0f + TESTY &&
//                 a.z == 1.0f + TESTZ,
//                 @"RPVector3AddScalar failed");
//}

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

//- (void)testSubtractScalar
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    a = RPVector3SubtractScalar(&a, 1.0f);
//    STAssertTrue(a.x == TESTX - 1.0f &&
//                 a.y == TESTY - 1.0f &&
//                 a.z == TESTZ - 1.0f,
//                 @"RPVector3SubtractScalar failed");
//}

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

//- (void)testMultiplyScalar
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    a = RPVector3MultiplyScalar(&a, 3.0f);
//    STAssertTrue(a.x == 3 * TESTX &&
//                 a.y == 3 * TESTY &&
//                 a.z == 3 * TESTZ,
//                 @"RPVector3MultiplyScalar failed");
//}

- (void)testMultiplyScalarBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3MultiplyScalarBy(&a, 3.0f);
    STAssertEquals(&a, b,
                   @"RPVector3MultiplyScalarBy didn't return its argument");
    STAssertTrue(a.x == 3 * TESTX &&
                 a.y == 3 * TESTY &&
                 a.z == 3 * TESTZ,
                 @"RPVector3MultiplyScalarBy failed");
}

//- (void)testDivideScalar
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    a = RPVector3DivideScalar(&a, 2.0f);
//    STAssertTrue(a.x == TESTX / 2.0f &&
//                 a.y == TESTY / 2.0f &&
//                 a.z == TESTZ / 2.0f,
//                 @"RPVector3DivideScalar failed");
//}

- (void)testDivideScalarBy
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3DivideScalarBy(&a, 2.0f);
    STAssertEquals(&a, b,
                   @"RPVector3DivideScalarBy didn't return its argument");
    STAssertTrue(a.x == TESTX / 2.0f &&
                 a.y == TESTY / 2.0f &&
                 a.z == TESTZ / 2.0f,
                 @"RPVector3DivideScalarBy failed");
}

//- (void)testMaximum
//{
//    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
//    RPVector3 b = { TESTX, TESTY, TESTZ };
//    RPVector3 c;
//
//    c = RPVector3Maximum(&a, &b);
//    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
//                 @"RPVector3Maximum a,b failed");
//    c = RPVector3Maximum(&b, &a);
//    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
//                 @"RPVector3Maximum b,a failed");
//}

- (void)testMaximumTo
{
    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
    RPVector3 b = { TESTX, TESTY, TESTZ };
    RPVector3 c;

    RPVector3 *d = RPVector3MaximumTo(&c, &a, &b);
    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
                 @"RPVector3MaximumTo a,b failed");
    d = RPVector3MaximumTo(&c, &b, &a);
    STAssertTrue(c.x == TESTX && c.y == TESTY && c.z == TESTZ,
                 @"RPVector3MaximumTo b,a failed");
    STAssertEquals(&c, d, @"RPVector3MaximumTo didn't return its argument");
}

//- (void)testMinimum
//{
//    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
//    RPVector3 b = { TESTX, TESTY, TESTZ };
//    RPVector3 c;
//
//    c = RPVector3Minimum(&a, &b);
//    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
//                 @"RPVector3Minimum a,b failed");
//    c = RPVector3Minimum(&b, &a);
//    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
//                 @"RPVector3Minimum b,a failed");
//}

- (void)testMinimumTo
{
    RPVector3 a = { -TESTX, -TESTY, -TESTZ };
    RPVector3 b = { TESTX, TESTY, TESTZ };
    RPVector3 c;

    RPVector3 *d = RPVector3MinimumTo(&c, &a, &b);
    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
                 @"RPVector3MinimumTo a,b failed");
    d = RPVector3MinimumTo(&c, &b, &a);
    STAssertTrue(c.x == -TESTX && c.y == -TESTY && c.z == -TESTZ,
                 @"RPVector3MaximumTo b,a failed");
    STAssertEquals(&c, d, @"RPVector3MinimumTo didn't return its argument");
}

- (void)testAllEqualToVector3
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = a;
    STAssertTrue(RPVector3AllEqualToVector3(&a, &b),
                 @"RPvector3AllEqualToVector3 x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = -1000;
        STAssertFalse(RPVector3AllEqualToVector3(&a, &b),
                      @"RPVector3AllEqualToVector3 %d failed", i);
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
    STAssertTrue(RPVector3AllGreaterThanVector3(&a, &b),
                 @"RPvector3AllGreaterThanVector3 x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = b.v[i];
        STAssertFalse(RPVector3AllGreaterThanVector3(&a, &b),
                      @"RPVector3AllGreaterThanVector3 %d failed on ==", i);
        a.v[i] = 2 * b.v[i];
        STAssertFalse(RPVector3AllGreaterThanVector3(&a, &b),
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

- (void)testAllGreaterThanOrEqualToVector3
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 b = { -TESTX, -TESTY, -TESTZ };
    STAssertTrue(RPVector3AllGreaterThanOrEqualToVector3(&a, &b),
                 @"RPvector3AllGreaterThanOrEqualToVector3 x,y,z failed");
    for (int i = 0; i < 3; i++) {
        RPReal tmp = a.v[i];
        a.v[i] = b.v[i];
        STAssertTrue(RPVector3AllGreaterThanOrEqualToVector3(&a, &b),
                     @"RPVector3AllGreaterThanOrEqualToVector3 %d failed ==",
                     i);
        a.v[i] = 2 * b.v[i];
        STAssertFalse(RPVector3AllGreaterThanOrEqualToVector3(&a, &b),
                      @"RPVector3AllGreaterThanOrEqualToVector3 %d failed <",
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

//- (void)testCrossProduct
//{
//    RPVector3 x = { 1, 0, 0 };
//    RPVector3 y = { 0, 1, 0 };
//    RPVector3 z = { 0, 0, 1 };
//
//    RPVector3 a;
//
//    a = RPVector3CrossProduct(&x, &y);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &z),
//                 @"RPVector3CrossProduct x X y != z");
//
//    a = RPVector3CrossProduct(&y, &z);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &x),
//                 @"RPVector3CrossProduct y X z != x");
//
//    a = RPVector3CrossProduct(&z, &x);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &y),
//                 @"RPVector3CrossProduct z X x != y");
//
//    a = RPVector3CrossProduct(&y, &x);
//    RPVector3MultiplyScalarBy(&a, -1);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &z),
//                 @"RPVector3CrossProduct y X x != -z");
//
//    a = RPVector3CrossProduct(&z, &y);
//    RPVector3MultiplyScalarBy(&a, -1);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &x),
//                 @"RPVector3CrossProduct z X y != -x");
//
//    a = RPVector3CrossProduct(&x, &z);
//    RPVector3MultiplyScalarBy(&a, -1);
//    STAssertTrue(RPVector3AllEqualToVector3(&a, &y),
//                 @"RPVector3CrossProduct x X z != -y");
//}


- (void)testCrossProductTo
{
    RPVector3 x = { 1, 0, 0 };
    RPVector3 y = { 0, 1, 0 };
    RPVector3 z = { 0, 0, 1 };

    RPVector3 a;
    RPVector3 *b;

    a = x;
    b = RPVector3CrossProductTo(&a, &a, &y);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &z),
                 @"RPVector3CrossProductTo x X y != z");

    a = y;
    b = RPVector3CrossProductTo(&a, &a, &z);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &x),
                 @"RPVector3CrossProductTo y X z != x");

    a = z;
    b = RPVector3CrossProductTo(&a, &a, &x);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &y),
                 @"RPVector3CrossProductTo z X x != y");

    a = y;
    b = RPVector3CrossProductTo(&a, &a, &x);
    RPVector3MultiplyScalarBy(&a, -1);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &z),
                 @"RPVector3CrossProductTo y X x != -z");

    a = z;
    b = RPVector3CrossProductTo(&a, &a, &y);
    RPVector3MultiplyScalarBy(&a, -1);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &x),
                 @"RPVector3CrossProductTo z X y != -x");

    a = x;
    b = RPVector3CrossProductTo(&a, &a, &z);
    RPVector3MultiplyScalarBy(&a, -1);
    STAssertTrue(RPVector3AllEqualToVector3(&a, &y),
                 @"RPVector3CrossProductTo x X z != -y");

    STAssertEquals(&a, b,
                   @"RPVector3CrossProductTo didn't return its argument");
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

//- (void)testNormalize
//{
//    RPVector3 a = { TESTX, TESTY, TESTZ };
//    RPVector3 b = RPVector3Normalize(&a);
//    RPReal l2 = RPVector3LengthSquared(&b);
//    STAssertEqualsWithAccuracy(l2, 1.0f, 0.000001f,
//                               @"RPVector3Normalize failed l2 = %f", l2);
//}

- (void)testNormalizeTo
{
    RPVector3 a = { TESTX, TESTY, TESTZ };
    RPVector3 *b = RPVector3NormalizeTo(&a, &a);
    STAssertEquals(&a, b,
                   @"RPVector3NormalizeTo didn't return its argument");
    RPReal l2 = RPVector3LengthSquared(b);
    STAssertEqualsWithAccuracy(l2, 1.0f, 0.000001f,
                               @"RPVector3NormalizeTo failed l2 = %f", l2);
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

@end
