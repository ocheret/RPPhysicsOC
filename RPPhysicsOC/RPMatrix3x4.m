//
//  RPMatrix3x4.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/12/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPMatrix3x4.h"

const RPMatrix3x4 RPMatrix3x4Identity = {
    1, 0, 0,
    0, 1, 0,
    0, 0, 1,
    0, 0, 0
};

NSString *
RPMatrix3x4Describe(RPMatrix3x4 *m)
{
    return [NSString
            stringWithFormat:@"%f, %f, %f, %f\n%f, %f, %f, %f\n%f, %f, %f, %f",
            m->m[0], m->m[3], m->m[6], m->m[9],
            m->m[1], m->m[4], m->m[7], m->m[10],
            m->m[2], m->m[5], m->m[8], m->m[11]];
}

RPMatrix3x4 *
RPMatrix3x4Invert(RPMatrix3x4 *me, RPMatrix3x4 *m)
{
    RPReal determinant = RPMatrix3x4Determinant(m);
    if (determinant == (RPReal)0.0) {
        return NULL;
    }

    RPReal invDeterminant = (RPReal)1.0 / determinant;

    *me = (RPMatrix3x4){
        (m->m11 * m->m22 - m->m12 * m->m21) * invDeterminant,
        (m->m02 * m->m21 - m->m01 * m->m22) * invDeterminant,
        (m->m01 * m->m12 - m->m02 * m->m11) * invDeterminant,
        (m->m12 * m->m20 - m->m10 * m->m22) * invDeterminant,
        (m->m00 * m->m22 - m->m02 * m->m20) * invDeterminant,
        (m->m02 * m->m10 - m->m00 * m->m12) * invDeterminant,
        (m->m10 * m->m21 - m->m11 * m->m20) * invDeterminant,
        (m->m01 * m->m20 - m->m00 * m->m21) * invDeterminant,
        (m->m00 * m->m11 - m->m01 * m->m10) * invDeterminant,
        (m->m10 * (m->m22 * m->m31 - m->m21 * m->m32) -
         m->m20 * (m->m12 * m->m31 - m->m11 * m->m32) +
         m->m30 * (m->m12 * m->m21 - m->m11 * m->m22)) * invDeterminant,
        (m->m00 * (m->m21 * m->m32 - m->m22 * m->m31) -
         m->m20 * (m->m01 * m->m32 - m->m02 * m->m31) +
         m->m30 * (m->m01 * m->m22 - m->m02 * m->m21)) * invDeterminant,
        (m->m00 * (m->m12 * m->m31 - m->m11 * m->m32) -
         m->m10 * (m->m02 * m->m31 - m->m01 * m->m32) +
         m->m30 * (m->m02 * m->m11 - m->m01 * m->m12)) * invDeterminant
    };
    return me;
}
