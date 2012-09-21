//
//  RPMatrix3x4.h
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/12/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPTypes.h"
#import "RPQuaternion.h"

extern const RPMatrix3x4 RPMatrix3x4Identity;

NSString *RPMatrix3x4Describe(RPMatrix3x4 *m);

static __inline__ RPMatrix3x4 *
RPMatrix3x4FromQuaternionAndVector3(RPMatrix3x4 *me,
                                    RPQuaternion *quaternion,
                                    RPVector3 *vector)
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

    *me = (RPMatrix3x4){
        1.0 - y2 * y - z2 * z,
        x2 * y + w2 * z,
        x2 * z - w2 * y,

        x2 * y - w2 * z,
        1.0 - x2 * x - z2 * z,
        y2 * z + w2 * x,

        x2 * z + w2 * y,
        y2 * z - w2 * x,
        1.0 - x2 * x - y2 * y,

        vector->x,
        vector->y,
        vector->z
    };
    
    return me;
}

static __inline__ RPMatrix3x4 *
RPMatrix3x4FromMatrix3(RPMatrix3x4 *me, RPMatrix3 *m)
{
    *me = (RPMatrix3x4) {
        m->m00, m->m01, m->m02,
        m->m10, m->m11, m->m12,
        m->m20, m->m21, m->m22,
        0, 0, 0
    };
    return me;
}

static __inline__ RPMatrix3x4 *
RPMatrix3x4FromMatrix3AndVector3(RPMatrix3x4 *me, RPMatrix3 *m, RPVector3 *v)
{
    *me = (RPMatrix3x4) {
        m->m00, m->m01, m->m02,
        m->m10, m->m11, m->m12,
        m->m20, m->m21, m->m22,
        v->x, v->y, v->z
    };
    return me;
}

static __inline__ RPMatrix3x4 *
RPMatrix3x4Multiply(RPMatrix3x4 *me,
                    RPMatrix3x4 *matrixLeft, RPMatrix3x4 *matrixRight)
{
    *me = (RPMatrix3x4) {
        // Output column 0
        matrixLeft->m00 * matrixRight->m00 +
        matrixLeft->m10 * matrixRight->m01 +
        matrixLeft->m20 * matrixRight->m02,

        matrixLeft->m01 * matrixRight->m00 +
        matrixLeft->m11 * matrixRight->m01 +
        matrixLeft->m21 * matrixRight->m02,

        matrixLeft->m02 * matrixRight->m00 +
        matrixLeft->m12 * matrixRight->m01 +
        matrixLeft->m22 * matrixRight->m02,

        // Output column 1
        matrixLeft->m00 * matrixRight->m10 +
        matrixLeft->m10 * matrixRight->m11 +
        matrixLeft->m20 * matrixRight->m12,

        matrixLeft->m01 * matrixRight->m10 +
        matrixLeft->m11 * matrixRight->m11 +
        matrixLeft->m21 * matrixRight->m12,

        matrixLeft->m02 * matrixRight->m10 +
        matrixLeft->m12 * matrixRight->m11 +
        matrixLeft->m22 * matrixRight->m12,

        // Output column 2
        matrixLeft->m00 * matrixRight->m20 +
        matrixLeft->m10 * matrixRight->m21 +
        matrixLeft->m20 * matrixRight->m22,

        matrixLeft->m01 * matrixRight->m20 +
        matrixLeft->m11 * matrixRight->m21 +
        matrixLeft->m21 * matrixRight->m22,

        matrixLeft->m02 * matrixRight->m20 +
        matrixLeft->m12 * matrixRight->m21 +
        matrixLeft->m22 * matrixRight->m22,

        // Output column 3
        matrixLeft->m00 * matrixRight->m30 +
        matrixLeft->m10 * matrixRight->m31 +
        matrixLeft->m20 * matrixRight->m32,

        matrixLeft->m01 * matrixRight->m30 +
        matrixLeft->m11 * matrixRight->m31 +
        matrixLeft->m21 * matrixRight->m32,

        matrixLeft->m02 * matrixRight->m30 +
        matrixLeft->m12 * matrixRight->m31 +
        matrixLeft->m22 * matrixRight->m32
    };
    
    return me;
}

static __inline__ RPVector3 *
RPMatrix3x4MultiplyVector3(RPVector3 *vout, RPMatrix3x4 *m, RPVector3 *vin)
{
    *vout = (RPVector3) {
        m->m00 * vin->x + m->m10 * vin->y + m->m20 * vin->z + m->m30,
        m->m01 * vin->x + m->m11 * vin->y + m->m21 * vin->z + m->m31,
        m->m02 * vin->x + m->m12 * vin->y + m->m22 * vin->z + m->m32
    };
    return vout;
}

static __inline__ RPVector3 *
RPMatrix3x4InverseMultiplyVector3(RPVector3 *vout,
                                  RPMatrix3x4 *m,
                                  RPVector3 *vin)
{
    RPVector3 tmp;
    tmp.x = vin->x - m->m30;
    tmp.y = vin->y - m->m31;
    tmp.z = vin->z - m->m32;
    *vout = (RPVector3){
        m->m00 * tmp.x + m->m01 * tmp.y + m->m02 * tmp.z,
        m->m10 * tmp.x + m->m11 * tmp.y + m->m12 * tmp.z,
        m->m20 * tmp.x + m->m21 * tmp.y + m->m22 * tmp.z
    };
    return vout;
}

static __inline__ RPVector3 *
RPMatrix3x4XFormDirection(RPVector3 *vout, RPMatrix3x4 *m, RPVector3 *vin)
{
    *vout = (RPVector3) {
        m->m00 * vin->x + m->m10 * vin->y + m->m20 * vin->z,
        m->m01 * vin->x + m->m11 * vin->y + m->m21 * vin->z,
        m->m02 * vin->x + m->m12 * vin->y + m->m22 * vin->z
    };
    return vout;
}

static __inline__ RPVector3 *
RPMatrix3x4InverseXFormDirection(RPVector3 *vout,
                                 RPMatrix3x4 *m,
                                 RPVector3 *vin)
{
    *vout = (RPVector3){
        m->m00 * vin->x + m->m01 * vin->y + m->m02 * vin->z,
        m->m10 * vin->x + m->m11 * vin->y + m->m12 * vin->z,
        m->m20 * vin->x + m->m21 * vin->y + m->m22 * vin->z
    };
    return vout;
}

/**
 * Changes the basis of a tensor using the rotational part of a transformation
 * matrix, ignoring any translational components.  The change of basis is done
 * using:
 *                             -1                     T
 * xformed = xfm * tensor * xfm   - xfm * tensor * xfm
 *
 * since the transpose of the rotation only xfm is the same as the inverse.
 */
static __inline__ RPMatrix3 *
RPMatrix3x4XFormTensor(RPMatrix3 *xformed, RPMatrix3 *tensor, RPMatrix3x4 *xfm)
{
    // Calcualte m = tensor * transpose(xfm) using only rotation
    RPMatrix3 m = {
        tensor->m00 * xfm->m00 +
        tensor->m10 * xfm->m10 +
        tensor->m20 * xfm->m20,
        tensor->m01 * xfm->m00 +
        tensor->m11 * xfm->m10 +
        tensor->m21 * xfm->m20,
        tensor->m02 * xfm->m00 +
        tensor->m12 * xfm->m10 +
        tensor->m22 * xfm->m20,

        tensor->m00 * xfm->m01 +
        tensor->m10 * xfm->m11 +
        tensor->m20 * xfm->m21,
        tensor->m01 * xfm->m01 +
        tensor->m11 * xfm->m11 +
        tensor->m21 * xfm->m21,
        tensor->m02 * xfm->m01 +
        tensor->m12 * xfm->m11 +
        tensor->m22 * xfm->m21,

        tensor->m00 * xfm->m02 +
        tensor->m10 * xfm->m12 +
        tensor->m20 * xfm->m22,
        tensor->m01 * xfm->m02 +
        tensor->m11 * xfm->m12 +
        tensor->m21 * xfm->m22,
        tensor->m02 * xfm->m02 +
        tensor->m12 * xfm->m12 +
        tensor->m22 * xfm->m22
    };

    // Calculate xformed = xfm * m
    *xformed = (RPMatrix3){
        xfm->m00 * m.m00 +
        xfm->m10 * m.m01 +
        xfm->m20 * m.m02,
        xfm->m01 * m.m00 +
        xfm->m11 * m.m01 +
        xfm->m21 * m.m02,
        xfm->m02 * m.m00 +
        xfm->m12 * m.m01 +
        xfm->m22 * m.m02,

        xfm->m00 * m.m10 +
        xfm->m10 * m.m11 +
        xfm->m20 * m.m12,
        xfm->m01 * m.m10 +
        xfm->m11 * m.m11 +
        xfm->m21 * m.m12,
        xfm->m02 * m.m10 +
        xfm->m12 * m.m11 +
        xfm->m22 * m.m12,

        xfm->m00 * m.m20 +
        xfm->m10 * m.m21 +
        xfm->m20 * m.m22,
        xfm->m01 * m.m20 +
        xfm->m11 * m.m21 +
        xfm->m21 * m.m22,
        xfm->m02 * m.m20 +
        xfm->m12 * m.m21 +
        xfm->m22 * m.m22
    };

    return xformed;
}

static __inline__ RPReal
RPMatrix3x4Determinant(RPMatrix3x4 *me)
{
    return (me->m00 * (me->m11 * me->m22 - me->m12 * me->m21) -
            me->m10 * (me->m01 * me->m22 - me->m02 * me->m21) +
            me->m20 * (me->m01 * me->m12 - me->m02 * me->m11));
}

RPMatrix3x4 *
RPMatrix3x4Invert(RPMatrix3x4 *me, RPMatrix3x4 *m);
