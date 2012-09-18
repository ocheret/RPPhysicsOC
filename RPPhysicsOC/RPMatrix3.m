//
//  RPMatrix3.m
//  RPPhysicsOC
//
//  Created by Charles Ocheret on 9/9/12.
//  Copyright (c) 2012 Charles Ocheret. All rights reserved.
//

#import "RPMatrix3.h"

const RPMatrix3 RPMatrix3Identity = {
    1, 0, 0,
    0, 1, 0,
    0, 0, 1
};

NSString *
RPMatrix3Describe(RPMatrix3x4 *m)
{
    return [NSString
            stringWithFormat:@"%f, %f, %f\n%f, %f, %f\n%f, %f, %f",
            m->m[0], m->m[3], m->m[6],
            m->m[1], m->m[4], m->m[7],
            m->m[2], m->m[5], m->m[8]];
}

RPMatrix3 *
RPMatrix3Invert(RPMatrix3 *me, RPMatrix3 *m) {
    RPReal t1 = m->m00 * m->m11;
    RPReal t2 = m->m00 * m->m12;
    RPReal t3 = m->m01 * m->m10;
    RPReal t4 = m->m02 * m->m10;
    RPReal t5 = m->m01 * m->m20;
    RPReal t6 = m->m02 * m->m20;

    RPReal determinant =
        t1 * m->m22 -
        t2 * m->m21 -
        t3 * m->m22 +
        t4 * m->m21 +
        t5 * m->m12 -
        t6 * m->m11;

    if (determinant == (RPReal)0.0) {
        return NULL;
    }

    RPReal invDeterminant = (RPReal)1.0 / determinant;

    *me = (RPMatrix3){
        (m->m11 * m->m22 - m->m12 * m->m21) * invDeterminant,   // 0
        (m->m02 * m->m21 - m->m01 * m->m22) * invDeterminant,   // 1
        (m->m01 * m->m12 - m->m02 * m->m11) * invDeterminant,   // 2
        (m->m12 * m->m20 - m->m10 * m->m22) * invDeterminant,   // 3
        (m->m00 * m->m22 - t6) * invDeterminant,                // 4
        (t4 - t2) * invDeterminant,                             // 5
        (m->m10 * m->m21 - m->m11 * m->m20) * invDeterminant,   // 6
        (t5 - m->m00 * m->m21) * invDeterminant,                // 7
        (t1 - t3) * invDeterminant,                             // 8
    };
    return me;
}
