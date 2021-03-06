//
//  RPQuaternion.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"
#import "RPVector3.h"

extern const RPQuaternion RPQuaternionIdentity;

static __inline__ RPQuaternion *
RPQuaternionFromAngleAndAxis(RPQuaternion *me,
                             RPReal radians, RPVector3 *axis)
{
    RPReal halfAngle = radians * (RPReal)0.5;
    RPReal scale = RPReal_SIN(halfAngle);
    *me = (RPQuaternion){
        scale * axis->x,
        scale * axis->y,
        scale * axis->z,
        RPReal_COS(halfAngle) };
    return me;
}

static __inline__ RPQuaternion *
RPQuaternionFromAngleAndXYZ(RPQuaternion *me,
                            RPReal radians, RPReal x, RPReal y, RPReal z)
{
    RPVector3 v = { x, y, z };
    RPVector3Normalize(&v, &v);

    RPReal halfAngle = radians * (RPReal)0.5;
    RPReal scale = RPReal_SIN(halfAngle);
    *me = (RPQuaternion){
        scale * v.x,
        scale * v.y,
        scale * v.z,
        RPReal_COS(halfAngle) };
    return me;
}

static __inline__ RPReal
RPQuaternionLength(RPQuaternion *quaternion)
{
    return sqrt(quaternion->x * quaternion->x +
                quaternion->y * quaternion->y +
                quaternion->z * quaternion->z +
                quaternion->w * quaternion->w);
}

static __inline__ RPQuaternion *
RPQuaternionNormalize(RPQuaternion *me, RPQuaternion *quaternion)
{
    RPReal scale = 1.0f / RPQuaternionLength(quaternion);
    *me = (RPQuaternion){
        quaternion->x * scale,
        quaternion->y * scale,
        quaternion->z * scale,
        quaternion->w * scale };
    return me;
}

static __inline__ RPQuaternion *
RPQuaternionMultiply(RPQuaternion *me,
                     RPQuaternion *quaternionLeft,
                     RPQuaternion *quaternionRight)
{
    *me = (RPQuaternion){
        quaternionLeft->w * quaternionRight->x +
        quaternionLeft->x * quaternionRight->w +
        quaternionLeft->y * quaternionRight->z -
        quaternionLeft->z * quaternionRight->y,

        quaternionLeft->w * quaternionRight->y +
        quaternionLeft->y * quaternionRight->w +
        quaternionLeft->z * quaternionRight->x -
        quaternionLeft->x * quaternionRight->z,

        quaternionLeft->w * quaternionRight->z +
        quaternionLeft->z * quaternionRight->w +
        quaternionLeft->x * quaternionRight->y -
        quaternionLeft->y * quaternionRight->x,

        quaternionLeft->w * quaternionRight->w -
        quaternionLeft->x * quaternionRight->x -
        quaternionLeft->y * quaternionRight->y -
        quaternionLeft->z * quaternionRight->z };
    return me;
}

static __inline__ RPQuaternion *
RPQuaternionConjugate(RPQuaternion *me, RPQuaternion *quaternion)
{
    *me = (RPQuaternion){
        -quaternion->x, -quaternion->y, -quaternion->z, quaternion->w };
    return me;
}

static __inline__ RPQuaternion *
RPQuaternionInvert(RPQuaternion *me, RPQuaternion *quaternion)
{
    RPReal scale = (RPReal)1.0 / (quaternion->x * quaternion->x +
                                  quaternion->y * quaternion->y +
                                  quaternion->z * quaternion->z +
                                  quaternion->w * quaternion->w);
    *me = (RPQuaternion){
        -quaternion->x * scale,
        -quaternion->y * scale,
        -quaternion->z * scale,
         quaternion->w * scale };
    return me;
}

static __inline__ RPVector3 *
RPQuaternionRotateVector3(RPVector3 *me,
                          RPQuaternion *quaternion, RPVector3 *vector)
{
    RPQuaternion rotatedQuaternion =  { vector->x, vector->y, vector->z, 0 };

    RPQuaternion tmp1;
    RPQuaternionMultiply(&tmp1, quaternion, &rotatedQuaternion);

    RPQuaternion tmp2;
    RPQuaternionInvert(&tmp2, quaternion);

    RPQuaternionMultiply(&rotatedQuaternion, &tmp1, &tmp2);

    *me = (RPVector3) {
        rotatedQuaternion.x, rotatedQuaternion.y, rotatedQuaternion.z
    };

    return me;
}

static __inline__ RPQuaternion *
RPQuaternionFromVector3(RPQuaternion *me, RPVector3 *v)
{
    *me = (RPQuaternion) { v->x, v->y, v->z, 0 };
    return me;
}

static __inline__ RPQuaternion *
RPQuaternionAddScaledVector3(RPQuaternion *me, RPVector3 *v, RPReal scale)
{
    RPQuaternion q = { v->x * scale, v->y * scale, v->z * scale, 0};
    RPQuaternionMultiply(&q, &q, me);
    me->x += q.x * (RPReal)0.5;
    me->y += q.y * (RPReal)0.5;
    me->z += q.z * (RPReal)0.5;
    me->w += q.w * (RPReal)0.5;
    return me;
}
