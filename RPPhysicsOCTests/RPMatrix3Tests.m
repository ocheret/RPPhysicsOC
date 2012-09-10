//
//  RPMatrix3Tests.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/10/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPMatrix3Tests.h"
#import <GLKit/GLKit.h>

@implementation RPMatrix3Tests

- (void)testSetTranspose
{
    RPMatrix3 m;
    RPMatrix3SetTranspose(&m,
                          1, 2, 3,
                          4, 5, 6,
                          7, 8, 9);
    NSString *msg = @"RPMatrix3SetTranspose failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)4, msg);
    STAssertEquals(m.m[2], (RPReal)7, msg);
    STAssertEquals(m.m[3], (RPReal)2, msg);
    STAssertEquals(m.m[4], (RPReal)5, msg);
    STAssertEquals(m.m[5], (RPReal)8, msg);
    STAssertEquals(m.m[6], (RPReal)3, msg);
    STAssertEquals(m.m[7], (RPReal)6, msg);
    STAssertEquals(m.m[8], (RPReal)9, msg);
    msg = @"RPMatrix3SetTranspose elements don't correspond as expected";
    STAssertEquals(m.m[0], m.m00, msg);
    STAssertEquals(m.m[1], m.m01, msg);
    STAssertEquals(m.m[2], m.m02, msg);
    STAssertEquals(m.m[3], m.m10, msg);
    STAssertEquals(m.m[4], m.m11, msg);
    STAssertEquals(m.m[5], m.m12, msg);
    STAssertEquals(m.m[6], m.m20, msg);
    STAssertEquals(m.m[7], m.m21, msg);
    STAssertEquals(m.m[8], m.m22, msg);
}

- (void)testFromArray
{
    RPReal values[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    RPMatrix3 m;
    RPMatrix3FromArray(&m, values);
    NSString *msg = @"RPMatrix3FromArray failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)2, msg);
    STAssertEquals(m.m[2], (RPReal)3, msg);
    STAssertEquals(m.m[3], (RPReal)4, msg);
    STAssertEquals(m.m[4], (RPReal)5, msg);
    STAssertEquals(m.m[5], (RPReal)6, msg);
    STAssertEquals(m.m[6], (RPReal)7, msg);
    STAssertEquals(m.m[7], (RPReal)8, msg);
    STAssertEquals(m.m[8], (RPReal)9, msg);
}

- (void)testFromArrayAndTranspose
{
    RPReal values[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    RPMatrix3 m;
    RPMatrix3FromArrayAndTranspose(&m, values);
    NSString *msg = @"RPMatrix3FromArrayAndTranspose failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)4, msg);
    STAssertEquals(m.m[2], (RPReal)7, msg);
    STAssertEquals(m.m[3], (RPReal)2, msg);
    STAssertEquals(m.m[4], (RPReal)5, msg);
    STAssertEquals(m.m[5], (RPReal)8, msg);
    STAssertEquals(m.m[6], (RPReal)3, msg);
    STAssertEquals(m.m[7], (RPReal)6, msg);
    STAssertEquals(m.m[8], (RPReal)9, msg);
}

- (void)testFromRows
{
    RPVector3 row0 = { 1, 2, 3 };
    RPVector3 row1 = { 4, 5, 6 };
    RPVector3 row2 = { 7, 8, 9 };
    RPMatrix3 m;
    RPMatrix3FromRows(&m, &row0, &row1, &row2);
    NSString *msg = @"RPMatrix3FromRows failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)4, msg);
    STAssertEquals(m.m[2], (RPReal)7, msg);
    STAssertEquals(m.m[3], (RPReal)2, msg);
    STAssertEquals(m.m[4], (RPReal)5, msg);
    STAssertEquals(m.m[5], (RPReal)8, msg);
    STAssertEquals(m.m[6], (RPReal)3, msg);
    STAssertEquals(m.m[7], (RPReal)6, msg);
    STAssertEquals(m.m[8], (RPReal)9, msg);
}

- (void)testFromColumns
{
    RPVector3 col0 = { 1, 2, 3 };
    RPVector3 col1 = { 4, 5, 6 };
    RPVector3 col2 = { 7, 8, 9 };
    RPMatrix3 m;
    RPMatrix3FromColumns(&m, &col0, &col1, &col2);
    NSString *msg = @"RPMatrix3FromColumns failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)2, msg);
    STAssertEquals(m.m[2], (RPReal)3, msg);
    STAssertEquals(m.m[3], (RPReal)4, msg);
    STAssertEquals(m.m[4], (RPReal)5, msg);
    STAssertEquals(m.m[5], (RPReal)6, msg);
    STAssertEquals(m.m[6], (RPReal)7, msg);
    STAssertEquals(m.m[7], (RPReal)8, msg);
    STAssertEquals(m.m[8], (RPReal)9, msg);
}

- (void)testFromQuaternionA
{
    RPQuaternion q = RPQuaternionIdentity;
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Identity failed";
    STAssertEquals(m.m[0], (RPReal)1, msg);
    STAssertEquals(m.m[1], (RPReal)0, msg);
    STAssertEquals(m.m[2], (RPReal)0, msg);
    STAssertEquals(m.m[3], (RPReal)0, msg);
    STAssertEquals(m.m[4], (RPReal)1, msg);
    STAssertEquals(m.m[5], (RPReal)0, msg);
    STAssertEquals(m.m[6], (RPReal)0, msg);
    STAssertEquals(m.m[7], (RPReal)0, msg);
    STAssertEquals(m.m[8], (RPReal)1, msg);
}

- (void)testFromQuaternionB
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI, 0, 0, 1);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot Z 180 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)1, 0.00001, msg);
}

- (void)testFromQuaternionC
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI/2, 0, 0, 1);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot Z 90 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)1, 0.00001, msg);
}
- (void)testFromQuaternionD
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI, 0, 1, 0);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot Y 180 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)-1, 0.00001, msg);
}

- (void)testFromQuaternionE
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI/2, 0, 1, 0);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot Y 90 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)0, 0.00001, msg);
}

- (void)testFromQuaternionF
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI, 1, 0, 0);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot X 180 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)-1, 0.00001, msg);
}

- (void)testFromQuaternionG
{
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI/2, 1, 0, 0);
    RPMatrix3 m;
    RPMatrix3FromQuaternion(&m, &q);
    NSString *msg = @"RPMatrix3FromQuaternion Rot X 90 failed";
    STAssertEqualsWithAccuracy(m.m[0], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[1], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[2], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[3], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[4], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[5], (RPReal)1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[6], (RPReal)0, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[7], (RPReal)-1, 0.00001, msg);
    STAssertEqualsWithAccuracy(m.m[8], (RPReal)0, 0.00001, msg);
}

- (void)testMakeScale
{
    RPMatrix3 m;
    RPMatrix3MakeScale(&m, 2, 3, 4);
    NSString *msg = @"RPMatrix3Makescale failed";
    STAssertEquals(m.m[0], (RPReal)2, msg);
    STAssertEquals(m.m[1], (RPReal)0, msg);
    STAssertEquals(m.m[2], (RPReal)0, msg);
    STAssertEquals(m.m[3], (RPReal)0, msg);
    STAssertEquals(m.m[4], (RPReal)3, msg);
    STAssertEquals(m.m[5], (RPReal)0, msg);
    STAssertEquals(m.m[6], (RPReal)0, msg);
    STAssertEquals(m.m[7], (RPReal)0, msg);
    STAssertEquals(m.m[8], (RPReal)4, msg);
}

- (void)testMakeRotation
{
    RPMatrix3 a, b;
    RPQuaternion q;
    RPQuaternionFromAngleAndXYZ(&q, M_PI / 2, 1, 1, 0);
    RPMatrix3FromQuaternion(&a, &q);
    RPMatrix3MakeRotation(&b, M_PI / 2, 1, 1, 0);
    NSString *msg = @"RPMatrix3MakeRotation failed";
    STAssertEqualsWithAccuracy(a.m[0], b.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[1], b.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[2], b.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[3], b.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[4], b.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[5], b.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[6], b.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[7], b.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[8], b.m[8], 0.00001, msg);
}

- (void)testMakeRotationGLK
{
    RPReal angle = M_PI / 2;
    RPReal x = 2;
    RPReal y = 3;
    RPReal z = 4;
    RPReal scale = 1.0 / RPReal_SQRT(x*x + y*y + z*z);
    RPReal sx = x * scale;
    RPReal sy = y * scale;
    RPReal sz = z * scale;
    // GLKQuaternionMakeWithAngleAndAxis doesn't normalize the axis!
    GLKQuaternion q = GLKQuaternionMakeWithAngleAndAxis(angle, sx, sy, sz);
    GLKMatrix3 a = GLKMatrix3MakeWithQuaternion(q);
    GLKMatrix3 b = GLKMatrix3MakeRotation(angle, x, y, z);
    NSString *msg = @"RPMatrix3MakeRotation failed";
    STAssertEqualsWithAccuracy(a.m[0], b.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[1], b.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[2], b.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[3], b.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[4], b.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[5], b.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[6], b.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[7], b.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[8], b.m[8], 0.00001, msg);
}

- (void)testMakeXRotation
{
    RPMatrix3 a, b;
    RPQuaternion q;
    RPReal angle = M_PI / 6;
    RPQuaternionFromAngleAndXYZ(&q, angle, 1, 0, 0);
    RPMatrix3FromQuaternion(&a, &q);
    RPMatrix3MakeXRotation(&b, angle);
    NSString *msg = @"RPMatrix3MakeXRotation failed";
    STAssertEqualsWithAccuracy(a.m[0], b.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[1], b.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[2], b.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[3], b.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[4], b.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[5], b.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[6], b.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[7], b.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[8], b.m[8], 0.00001, msg);
}

- (void)testMakeYRotation
{
    RPMatrix3 a, b;
    RPQuaternion q;
    RPReal angle = M_PI / 6;
    RPQuaternionFromAngleAndXYZ(&q, angle, 0, 1, 0);
    RPMatrix3FromQuaternion(&a, &q);
    RPMatrix3MakeYRotation(&b, angle);
    NSString *msg = @"RPMatrix3MakeYRotation failed";
    STAssertEqualsWithAccuracy(a.m[0], b.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[1], b.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[2], b.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[3], b.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[4], b.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[5], b.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[6], b.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[7], b.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[8], b.m[8], 0.00001, msg);
}

- (void)testMakeZRotation
{
    RPMatrix3 a, b;
    RPQuaternion q;
    RPReal angle = M_PI / 6;
    RPQuaternionFromAngleAndXYZ(&q, angle, 0, 0, 1);
    RPMatrix3FromQuaternion(&a, &q);
    RPMatrix3MakeZRotation(&b, angle);
    NSString *msg = @"RPMatrix3MakeZRotation failed";
    STAssertEqualsWithAccuracy(a.m[0], b.m[0], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[1], b.m[1], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[2], b.m[2], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[3], b.m[3], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[4], b.m[4], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[5], b.m[5], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[6], b.m[6], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[7], b.m[7], 0.00001, msg);
    STAssertEqualsWithAccuracy(a.m[8], b.m[8], 0.00001, msg);
}


- (void)testTranspose
{
    RPMatrix3 a = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    RPMatrix3 b;
    RPMatrix3Transpose(&b, &a);
    NSString *msg = @"RPMatrix3Transpose failed";
    STAssertEquals(a.m[0], b.m[0], msg);
    STAssertEquals(a.m[1], b.m[3], msg);
    STAssertEquals(a.m[2], b.m[6], msg);
    STAssertEquals(a.m[3], b.m[1], msg);
    STAssertEquals(a.m[4], b.m[4], msg);
    STAssertEquals(a.m[5], b.m[7], msg);
    STAssertEquals(a.m[6], b.m[2], msg);
    STAssertEquals(a.m[7], b.m[5], msg);
    STAssertEquals(a.m[8], b.m[8], msg);
}

- (void)testMultiply
{
    RPMatrix3 a = {
        1, 4, 7,
        2, 5, 8,
        3, 6, 9
    };
    RPMatrix3 b = {
        1, 10, 100,
        2, 20, 200,
        3, 30, 300
    };
    RPMatrix3 c;
    RPMatrix3Multiply(&c, &a, &b);
    NSString *msg = @"RPMatrix3Multiply failed";
    STAssertEquals(c.m[0], (RPReal)321, msg);
    STAssertEquals(c.m[1], (RPReal)654, msg);
    STAssertEquals(c.m[2], (RPReal)987, msg);
    STAssertEquals(c.m[3], (RPReal)642, msg);
    STAssertEquals(c.m[4], (RPReal)1308, msg);
    STAssertEquals(c.m[5], (RPReal)1974, msg);
    STAssertEquals(c.m[6], (RPReal)963, msg);
    STAssertEquals(c.m[7], (RPReal)1962, msg);
    STAssertEquals(c.m[8], (RPReal)2961, msg);
}

@end
