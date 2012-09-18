//
//  RPMatrix3x4Tests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/17/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPMatrix3x4Tests.h"

@implementation RPMatrix3x4Tests

- (void)testFromQuaternionAndVector
{
    RPQuaternion quaternion;
    RPQuaternionFromAngleAndXYZ(&quaternion, M_PI_2, 0, 0, 1);

    RPVector3 vector = { 100, 200, 300 };

    RPMatrix3x4 m;
    RPMatrix3x4FromQuaternionAndVector3(&m, &quaternion, &vector);

    NSString *msg = @"RPMatrix3x4FromQuaternionAndVector failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[9], (RPReal)100, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[10], (RPReal)200, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[11], (RPReal)300, 0.00001, msg);
}

- (void)testMultiply
{
    RPMatrix3x4 a = {
        1, 5,  9,
        2, 6,  10,
        3, 7,  11,
        4, 8,  12
    };
    RPMatrix3x4 b = {
        1, 10, 100,
        2, 20, 200,
        3, 30, 300,
        4, 40, 400
    };
    RPMatrix3x4 c;
    RPMatrix3x4Multiply(&c, &a, &b);
    NSString *msg = @"RPMatrix3x4Multiply failed";
    STAssertEquals(c.m[0], (RPReal)321, msg);
    STAssertEquals(c.m[1], (RPReal)765, msg);
    STAssertEquals(c.m[2], (RPReal)1209, msg);
    STAssertEquals(c.m[3], (RPReal)642, msg);
    STAssertEquals(c.m[4], (RPReal)1530, msg);
    STAssertEquals(c.m[5], (RPReal)2418, msg);
    STAssertEquals(c.m[6], (RPReal)963, msg);
    STAssertEquals(c.m[7], (RPReal)2295, msg);
    STAssertEquals(c.m[8], (RPReal)3627, msg);
    STAssertEquals(c.m[9], (RPReal)1284, msg);
    STAssertEquals(c.m[10], (RPReal)3060, msg);
    STAssertEquals(c.m[11], (RPReal)4836, msg);

}

- (void)testMulitplyVector3A
{
    RPMatrix3 a;
    RPVector3 v = { 1, 2, 3 };
    RPMatrix3MakeZRotation(&a, M_PI_2);
    RPMatrix3x4 b;
    RPVector3 t = { 100, 200, 300 };
    RPMatrix3x4FromMatrix3AndVector3(&b, &a, &t);
    RPMatrix3x4MultiplyVector3(&v, &b, &v);
    NSString *msg = @"RPMatrix3x4MultiplyVector3 failed";
    STAssertEqualsWithAccuracy(v.x, (RPReal)98.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.y, (RPReal)201.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.z, (RPReal)303.0, 0.00001, msg);
}

- (void)testMulitplyVector3B
{
    RPMatrix3 a;
    RPVector3 v = { 1, 2, 3 };
    RPMatrix3MakeYRotation(&a, M_PI_2);
    RPMatrix3x4 b;
    RPVector3 t = { 100, 200, 300 };
    RPMatrix3x4FromMatrix3AndVector3(&b, &a, &t);
    RPMatrix3x4MultiplyVector3(&v, &b, &v);
    NSString *msg = @"RPMatrix3x4MultiplyVector3 failed";
    STAssertEqualsWithAccuracy(v.x, (RPReal)103.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.y, (RPReal)202.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.z, (RPReal)299.0, 0.00001, msg);
}

- (void)testMulitplyVector3C
{
    RPMatrix3 a;
    RPVector3 v = { 1, 2, 3 };
    RPMatrix3MakeXRotation(&a, M_PI_2);
    RPMatrix3x4 b;
    RPVector3 t = { 100, 200, 300 };
    RPMatrix3x4FromMatrix3AndVector3(&b, &a, &t);
    RPMatrix3x4MultiplyVector3(&v, &b, &v);
    NSString *msg = @"RPMatrix3x4MultiplyVector3 failed";
    STAssertEqualsWithAccuracy(v.x, (RPReal)101.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.y, (RPReal)197.0, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.z, (RPReal)302.0, 0.00001, msg);
}

- (void)testDeterminantA
{
    RPMatrix3x4 ident = RPMatrix3x4Identity;
    RPReal determinant = RPMatrix3x4Determinant(&ident);
    STAssertEqualsWithAccuracy(determinant, (RPReal)1, 0.00001,
                               @"RPMatrix3x4Determinant identity failed");
}

- (void)testDeterminantB
{
    RPMatrix3x4 m = {
        0.500,   0.400,   1.000,
        0.500,   1.000,   0.300,
        1.000,   0.200,   0.500,
        100.000, 200.000, 300.000 };
    RPReal determinant = RPMatrix3x4Determinant(&m);
    STAssertEqualsWithAccuracy(determinant, (RPReal)-.66, 0.00001,
                               @"RPMatrix3x4Determinant failed");
}

- (void)testInvertA
{
    RPMatrix3x4 m = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    RPMatrix3x4 *inv = RPMatrix3x4Invert(&m, &m);
    STAssertTrue(NULL == inv, @"Singular matrix inverted?");
}

- (void)testInvertB
{
    RPMatrix3 r, t;
    RPMatrix3MakeRotation(&r, M_PI_2, 1.0, 2.0, 3.0);
    RPMatrix3Transpose(&t, &r);
    RPVector3 v = { 100, 200, 300 };
    RPMatrix3x4 m, i;
    RPMatrix3x4FromMatrix3AndVector3(&m, &r, &v);

    RPMatrix3x4Invert(&i, &m);
    NSString *msg = @"RPMatrix3x4Invert failed";
    STAssertEqualsWithAccuracy(i.m[0], t.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[1], t.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[2], t.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[3], t.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[4], t.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[5], t.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[6], t.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[7], t.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[8], t.m[8], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[9], (RPReal)-100, 0.0001, msg);
    STAssertEqualsWithAccuracy(i.m[10], (RPReal)-200, 0.0001, msg);
    STAssertEqualsWithAccuracy(i.m[11], (RPReal)-300, 0.0001, msg);
}

- (void)testInvertC
{
    RPMatrix3 r, t;
    RPMatrix3MakeRotation(&r, M_PI_2, 1.0, 2.0, 3.0);
    RPMatrix3Transpose(&t, &r);
    RPVector3 v = { 0, 0, 0 };
    RPMatrix3x4 m, i;
    RPMatrix3x4FromMatrix3AndVector3(&m, &r, &v);

    RPMatrix3x4Invert(&i, &m);
    NSString *msg = @"RPMatrix3x4Invert failed";
    STAssertEqualsWithAccuracy(i.m[0], t.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[1], t.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[2], t.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[3], t.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[4], t.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[5], t.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[6], t.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[7], t.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[8], t.m[8], 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[9], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[10], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(i.m[11], (RPReal)0, 0.00001, msg);
}

- (void)testInverseMultiplyVector3
{
    RPMatrix3 a;
    RPVector3 v = { 1, 2, 3 };
    RPMatrix3MakeXRotation(&a, M_PI_2);
    RPMatrix3x4 b;
    RPVector3 t = { 100, 200, 300 };
    RPMatrix3x4FromMatrix3AndVector3(&b, &a, &t);
    RPMatrix3x4MultiplyVector3(&v, &b, &v);
    RPMatrix3x4InverseMultiplyVector3(&v, &b, &v);
    NSString *msg = @"RPMatrix3x4InverseMultiplyVector3 failed";
    STAssertEqualsWithAccuracy(v.x, (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.y, (RPReal)2, 0.00001, msg);
    STAssertEqualsWithAccuracy(v.z, (RPReal)3, 0.00001, msg);
}

@end
