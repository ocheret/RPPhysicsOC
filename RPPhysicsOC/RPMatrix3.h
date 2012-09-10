//
//  RPMatrix3.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"
#import "RPVector3.h"
#import "RPQuaternion.h"

static __inline__ RPMatrix3 *
RPMatrix3SetTranspose(RPMatrix3 *me,
                      RPReal m00, RPReal m01, RPReal m02,
                      RPReal m10, RPReal m11, RPReal m12,
                      RPReal m20, RPReal m21, RPReal m22)
{
    *me = (RPMatrix3){
        m00, m10, m20,
        m01, m11, m21,
        m02, m12, m22 };
    return me;
}

extern const RPMatrix3 RPMatrix3Identity;

static __inline__ RPMatrix3 *
RPMatrix3FromArray(RPMatrix3 *me, RPReal values[9])
{
    *me = (RPMatrix3){
        values[0], values[1], values[2],
        values[3], values[4], values[5],
        values[6], values[7], values[8] };
    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3FromArrayAndTranspose(RPMatrix3 *me, RPReal values[9])
{
    *me = (RPMatrix3){
        values[0], values[3], values[6],
        values[1], values[4], values[7],
        values[2], values[5], values[8] };
    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3FromRows(RPMatrix3 *me,
                  RPVector3 row0, RPVector3 row1, RPVector3 row2)
{
    *me = (RPMatrix3){
        row0.x, row1.x, row2.x,
        row0.y, row1.y, row2.y,
        row0.z, row1.z, row2.z };
    return me;
}


static __inline__ RPMatrix3 *
RPMatrix3FromColumns(RPMatrix3 *me,
                     RPVector3 column0, RPVector3 column1, RPVector3 column2)
{
    *me = (RPMatrix3){
        column0.x, column0.y, column0.z,
        column1.x, column1.y, column1.z,
        column2.x, column2.y, column2.z };
    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3FromQuaternion(RPMatrix3 *me, RPQuaternion *quaternion)
{
    RPQuaternionNormalize(quaternion, quaternion);

    RPReal x = quaternion->x;
    RPReal y = quaternion->y;
    RPReal z = quaternion->z;
    RPReal w = quaternion->w;

    RPReal x2 = x + x;
    RPReal y2 = y + y;
    RPReal z2 = z + z;
    RPReal w2 = w + w;

    *me = (RPMatrix3){
        1.0 - y2 * y - z2 * z,
        x2 * y + w2 * z,
        x2 * z - w2 * y,

        x2 * y - w2 * z,
        1.0 - x2 * x - z2 * z,
        y2 * z + w2 * x,

        x2 * z + w2 * y,
        y2 * z - w2 * x,
        1.0 - x2 * x - y2 * y };

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3MakeScale(RPMatrix3 *me, RPReal sx, RPReal sy, RPReal sz)
{
    *me = (RPMatrix3) {
        sx, 0, 0,
        0, sy, 0,
        0, 0, sz };
    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3MakeRotation(RPMatrix3 *me,
                      RPReal radians, RPReal x, RPReal y, RPReal z)
{
    RPVector3 v = { x, y, z };
    RPVector3Normalize(&v, &v);

    RPReal cos = RPReal_COS(radians);
    RPReal cosp = (RPReal)1.0 - cos;
    RPReal sin = RPReal_SIN(radians);

    *me = (RPMatrix3){
        cos + cosp * v.x * v.x,
        cosp * v.x * v.y + v.z * sin,
        cosp * v.x * v.z - v.y * sin,

        cosp * v.x * v.y - v.z * sin,
        cos + cosp * v.y * v.y,
        cosp * v.y * v.z + v.x * sin,

        cosp * v.x * v.z + v.y * sin,
        cosp * v.y * v.z - v.x * sin,
        cos + cosp * v.z * v.z };

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3MakeXRotation(RPMatrix3 *me, RPReal radians)
{
    RPReal cos = RPReal_COS(radians);
    RPReal sin = RPReal_SIN(radians);

    *me = (RPMatrix3){
        1.0, 0.0, 0.0,
        0.0, cos, sin,
        0.0, -sin, cos };

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3MakeYRotation(RPMatrix3 *me, RPReal radians)
{
    RPReal cos = RPReal_COS(radians);
    RPReal sin = RPReal_SIN(radians);

    *me = (RPMatrix3){
        cos, 0.0, -sin,
        0.0, 1.0, 0.0,
        sin, 0.0, cos };

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3MakeZRotation(RPMatrix3 *me, RPReal radians)
{
    RPReal cos = RPReal_COS(radians);
    RPReal sin = RPReal_SIN(radians);

    *me = (RPMatrix3){
        cos, sin, 0.0,
        -sin, cos, 0.0,
        0.0, 0.0, 1.0 };

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3Transpose(RPMatrix3 *me, RPMatrix3 *matrix)
{
    return RPMatrix3FromArrayAndTranspose(me, matrix->m);
}

static __inline__ RPMatrix3 *
RPMatrix3Multiply(RPMatrix3 *me, RPMatrix3 *matrixLeft, RPMatrix3 *matrixRight)
{
    *me = (RPMatrix3) {
        matrixLeft->m[0] * matrixRight->m[0] +
        matrixLeft->m[3] * matrixRight->m[1] +
        matrixLeft->m[6] * matrixRight->m[2],

        matrixLeft->m[1] * matrixRight->m[0] +
        matrixLeft->m[4] * matrixRight->m[1] +
        matrixLeft->m[7] * matrixRight->m[2],

        matrixLeft->m[2] * matrixRight->m[0] +
        matrixLeft->m[5] * matrixRight->m[1] +
        matrixLeft->m[8] * matrixRight->m[2],

        matrixLeft->m[0] * matrixRight->m[3] +
        matrixLeft->m[3] * matrixRight->m[4] +
        matrixLeft->m[6] * matrixRight->m[5],

        matrixLeft->m[1] * matrixRight->m[3] +
        matrixLeft->m[4] * matrixRight->m[4] +
        matrixLeft->m[7] * matrixRight->m[5],

        matrixLeft->m[2] * matrixRight->m[3] +
        matrixLeft->m[5] * matrixRight->m[4] +
        matrixLeft->m[8] * matrixRight->m[5],

        matrixLeft->m[0] * matrixRight->m[6] +
        matrixLeft->m[3] * matrixRight->m[7] +
        matrixLeft->m[6] * matrixRight->m[8],

        matrixLeft->m[1] * matrixRight->m[6] +
        matrixLeft->m[4] * matrixRight->m[7] +
        matrixLeft->m[7] * matrixRight->m[8],

        matrixLeft->m[2] * matrixRight->m[6] +
        matrixLeft->m[5] * matrixRight->m[7] +
        matrixLeft->m[8] * matrixRight->m[8] };
    
    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3Add(RPMatrix3 *me, RPMatrix3 *matrixLeft, RPMatrix3 *matrixRight)
{
    me->m00 = matrixLeft->m00 + matrixRight->m00;
    me->m01 = matrixLeft->m01 + matrixRight->m01;
    me->m02 = matrixLeft->m02 + matrixRight->m02;
    me->m10 = matrixLeft->m10 + matrixRight->m10;
    me->m11 = matrixLeft->m11 + matrixRight->m11;
    me->m12 = matrixLeft->m12 + matrixRight->m12;
    me->m20 = matrixLeft->m20 + matrixRight->m20;
    me->m21 = matrixLeft->m21 + matrixRight->m21;
    me->m22 = matrixLeft->m22 + matrixRight->m22;

    return me;
}

static __inline__ RPMatrix3 *
RPMatrix3Subtract(RPMatrix3 *me, RPMatrix3 *matrixLeft, RPMatrix3 *matrixRight)
{
    me->m00 = matrixLeft->m00 - matrixRight->m00;
    me->m01 = matrixLeft->m01 - matrixRight->m01;
    me->m02 = matrixLeft->m02 - matrixRight->m02;
    me->m10 = matrixLeft->m10 - matrixRight->m10;
    me->m11 = matrixLeft->m11 - matrixRight->m11;
    me->m12 = matrixLeft->m12 - matrixRight->m12;
    me->m20 = matrixLeft->m20 - matrixRight->m20;
    me->m21 = matrixLeft->m21 - matrixRight->m21;
    me->m22 = matrixLeft->m22 - matrixRight->m22;

    return me;
}
