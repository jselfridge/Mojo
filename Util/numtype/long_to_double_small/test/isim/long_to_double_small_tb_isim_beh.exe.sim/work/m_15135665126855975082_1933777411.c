/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/jselfridge/Documents/FPGA/Util/numtype/long_to_double_small/long_to_double_small.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {0, 0, 0, 0};
static int ng4[] = {0, 0};
static int ng5[] = {1023, 0};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {2U, 0U};
static int ng8[] = {63, 0};
static unsigned int ng9[] = {3U, 0U};
static int ng10[] = {1, 0};
static unsigned int ng11[] = {4U, 0U};
static int ng12[] = {1, 0, 0, 0};
static unsigned int ng13[] = {4294967295U, 0U, 2097151U, 0U};
static int ng14[] = {51, 0};
static int ng15[] = {62, 0};
static int ng16[] = {52, 0};
static unsigned int ng17[] = {6U, 0U};
static unsigned int ng18[] = {0U, 0U, 0U, 0U};



static void Cont_26_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 6512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7704);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t4, 0, 64);
    xsi_driver_vfirst_trans(t5, 0, 63);
    t10 = (t0 + 7576);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_27_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7768);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7592);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_28_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7832);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7608);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_50_3(char *t0)
{
    char t11[8];
    char t21[8];
    char t28[8];
    char t67[16];
    char t68[16];
    char t70[8];
    char t77[8];
    char t93[8];
    char t102[8];
    char t110[8];
    char t138[8];
    char t146[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t69;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    int t76;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    char *t92;
    char *t94;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t150;
    char *t151;
    char *t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    char *t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    int t170;
    int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;
    int t189;
    int t190;

LAB0:    t1 = (t0 + 7256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 7624);
    *((int *)t2) = 1;
    t3 = (t0 + 7288);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 4000);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 3);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB19;

LAB20:
LAB21:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 2160U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng10)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t19 | t22);
    t24 = (~(t23));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB157;

LAB154:    if (t23 != 0)
        goto LAB156;

LAB155:    *((unsigned int *)t11) = 1;

LAB157:    t9 = (t11 + 4);
    t26 = *((unsigned int *)t9);
    t29 = (~(t26));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t35 = (t31 != 0);
    if (t35 > 0)
        goto LAB158;

LAB159:
LAB160:    goto LAB2;

LAB7:    xsi_set_current_line(56, ng0);

LAB22:    xsi_set_current_line(57, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t5) != 0)
        goto LAB25;

LAB26:    t9 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t9);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB27;

LAB28:    memcpy(t28, t11, 8);

LAB29:    t59 = (t28 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t28);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB21;

LAB9:    xsi_set_current_line(66, ng0);

LAB41:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 4160);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    xsi_vlog_unsigned_equal(t67, 64, t5, 64, t7, 32);
    t9 = (t67 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (~(t12));
    t14 = *((unsigned int *)t67);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(72, ng0);

LAB46:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 4160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t21, 0, 8);
    t5 = (t21 + 4);
    t7 = (t4 + 8);
    t9 = (t4 + 12);
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t21) = t14;
    t15 = *((unsigned int *)t9);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    memset(t11, 0, 8);
    t10 = (t21 + 4);
    t18 = *((unsigned int *)t10);
    t19 = (~(t18));
    t22 = *((unsigned int *)t21);
    t23 = (t22 & t19);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t10) != 0)
        goto LAB49;

LAB50:    t27 = (t11 + 4);
    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t27);
    t29 = (t25 || t26);
    if (t29 > 0)
        goto LAB51;

LAB52:    t30 = *((unsigned int *)t11);
    t31 = (~(t30));
    t35 = *((unsigned int *)t27);
    t36 = (t31 || t35);
    if (t36 > 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t27) > 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t11) > 0)
        goto LAB57;

LAB58:    memcpy(t67, t59, 16);

LAB59:    t65 = (t0 + 4480);
    xsi_vlogvar_wait_assign_value(t65, t67, 0, 0, 64, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 4160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 8);
    t9 = (t4 + 12);
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t9);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t10 = (t0 + 5120);
    xsi_vlogvar_wait_assign_value(t10, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB44:    goto LAB21;

LAB11:    xsi_set_current_line(80, ng0);

LAB60:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 4960);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 11, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlog_get_part_select_value(t67, 53, t4, 63, 11);
    t5 = (t0 + 4640);
    xsi_vlogvar_wait_assign_value(t5, t67, 0, 0, 53, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t11) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 0);
    *((unsigned int *)t5) = t15;
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 2047U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 2047U);
    t9 = (t0 + 4800);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 11, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB21;

LAB13:    xsi_set_current_line(88, ng0);

LAB61:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 4640);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t21, 0, 8);
    t7 = (t21 + 4);
    t9 = (t5 + 8);
    t10 = (t5 + 12);
    t12 = *((unsigned int *)t9);
    t13 = (t12 >> 20);
    t14 = (t13 & 1);
    *((unsigned int *)t21) = t14;
    t15 = *((unsigned int *)t10);
    t16 = (t15 >> 20);
    t17 = (t16 & 1);
    *((unsigned int *)t7) = t17;
    memset(t11, 0, 8);
    t20 = (t21 + 4);
    t18 = *((unsigned int *)t20);
    t19 = (~(t18));
    t22 = *((unsigned int *)t21);
    t23 = (t22 & t19);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB65;

LAB63:    if (*((unsigned int *)t20) == 0)
        goto LAB62;

LAB64:    t27 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t27) = 1;

LAB65:    t32 = (t11 + 4);
    t25 = *((unsigned int *)t32);
    t26 = (~(t25));
    t29 = *((unsigned int *)t11);
    t30 = (t29 & t26);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(94, ng0);

LAB72:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 10);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 10);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t9 = (t0 + 5280);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 9);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 9);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t9 = (t0 + 5440);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t11) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 0);
    *((unsigned int *)t5) = t15;
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 511U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 511U);
    t9 = ((char*)((ng4)));
    memset(t21, 0, 8);
    t10 = (t11 + 4);
    t20 = (t9 + 4);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t9);
    t22 = (t18 ^ t19);
    t23 = *((unsigned int *)t10);
    t24 = *((unsigned int *)t20);
    t25 = (t23 ^ t24);
    t26 = (t22 | t25);
    t29 = *((unsigned int *)t10);
    t30 = *((unsigned int *)t20);
    t31 = (t29 | t30);
    t35 = (~(t31));
    t36 = (t26 & t35);
    if (t36 != 0)
        goto LAB74;

LAB73:    if (t31 != 0)
        goto LAB75;

LAB76:    t32 = (t0 + 5600);
    xsi_vlogvar_wait_assign_value(t32, t21, 0, 0, 1, 0LL);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB68:    goto LAB21;

LAB15:    xsi_set_current_line(103, ng0);

LAB77:    xsi_set_current_line(104, ng0);
    t3 = (t0 + 5280);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t11, 0, 8);
    t7 = (t5 + 4);
    t12 = *((unsigned int *)t7);
    t13 = (~(t12));
    t14 = *((unsigned int *)t5);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t7) != 0)
        goto LAB80;

LAB81:    t10 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t10);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB82;

LAB83:    memcpy(t146, t11, 8);

LAB84:    t178 = (t146 + 4);
    t179 = *((unsigned int *)t178);
    t180 = (~(t179));
    t181 = *((unsigned int *)t146);
    t182 = (t181 & t180);
    t183 = (t182 != 0);
    if (t183 > 0)
        goto LAB120;

LAB121:
LAB122:    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB21;

LAB17:    xsi_set_current_line(114, ng0);

LAB128:    xsi_set_current_line(115, ng0);
    t3 = (t0 + 4640);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    xsi_vlog_get_part_select_value(t67, 52, t5, 51, 0);
    t7 = (t0 + 4320);
    t9 = (t0 + 4320);
    t10 = (t9 + 72U);
    t20 = *((char **)t10);
    t27 = ((char*)((ng14)));
    t32 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t11, t21, t28, ((int*)(t20)), 2, t27, 32, 1, t32, 32, 1);
    t33 = (t11 + 4);
    t12 = *((unsigned int *)t33);
    t52 = (!(t12));
    t34 = (t21 + 4);
    t13 = *((unsigned int *)t34);
    t76 = (!(t13));
    t129 = (t52 && t76);
    t42 = (t28 + 4);
    t14 = *((unsigned int *)t42);
    t133 = (!(t14));
    t170 = (t129 && t133);
    if (t170 == 1)
        goto LAB129;

LAB130:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 4960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t4, 11, t5, 32);
    t7 = (t0 + 4320);
    t9 = (t0 + 4320);
    t10 = (t9 + 72U);
    t20 = *((char **)t10);
    t27 = ((char*)((ng15)));
    t32 = ((char*)((ng16)));
    xsi_vlog_convert_partindices(t21, t28, t70, ((int*)(t20)), 2, t27, 32, 1, t32, 32, 1);
    t33 = (t21 + 4);
    t12 = *((unsigned int *)t33);
    t8 = (!(t12));
    t34 = (t28 + 4);
    t13 = *((unsigned int *)t34);
    t52 = (!(t13));
    t76 = (t8 && t52);
    t42 = (t70 + 4);
    t14 = *((unsigned int *)t42);
    t129 = (!(t14));
    t133 = (t76 && t129);
    if (t133 == 1)
        goto LAB131;

LAB132:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 5120);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4320);
    t7 = (t0 + 4320);
    t9 = (t7 + 72U);
    t10 = *((char **)t9);
    t20 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t11, t10, 2, t20, 32, 1);
    t27 = (t11 + 4);
    t12 = *((unsigned int *)t27);
    t8 = (!(t12));
    if (t8 == 1)
        goto LAB133;

LAB134:    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB21;

LAB19:    xsi_set_current_line(122, ng0);

LAB135:    xsi_set_current_line(123, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 64, 0LL);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB136;

LAB137:    if (*((unsigned int *)t5) != 0)
        goto LAB138;

LAB139:    t9 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t9);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB140;

LAB141:    memcpy(t28, t11, 8);

LAB142:    t59 = (t28 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t28);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB150;

LAB151:
LAB152:    goto LAB21;

LAB23:    *((unsigned int *)t11) = 1;
    goto LAB26;

LAB25:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB26;

LAB27:    t10 = (t0 + 2480U);
    t20 = *((char **)t10);
    memset(t21, 0, 8);
    t10 = (t20 + 4);
    t22 = *((unsigned int *)t10);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t10) != 0)
        goto LAB32;

LAB33:    t29 = *((unsigned int *)t11);
    t30 = *((unsigned int *)t21);
    t31 = (t29 & t30);
    *((unsigned int *)t28) = t31;
    t32 = (t11 + 4);
    t33 = (t21 + 4);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t32);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t38 = *((unsigned int *)t34);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB34;

LAB35:
LAB36:    goto LAB29;

LAB30:    *((unsigned int *)t21) = 1;
    goto LAB33;

LAB32:    t27 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB33;

LAB34:    t40 = *((unsigned int *)t28);
    t41 = *((unsigned int *)t34);
    *((unsigned int *)t28) = (t40 | t41);
    t42 = (t11 + 4);
    t43 = (t21 + 4);
    t44 = *((unsigned int *)t11);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (~(t46));
    t48 = *((unsigned int *)t21);
    t49 = (~(t48));
    t50 = *((unsigned int *)t43);
    t51 = (~(t50));
    t8 = (t45 & t47);
    t52 = (t49 & t51);
    t53 = (~(t8));
    t54 = (~(t52));
    t55 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t55 & t53);
    t56 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t56 & t54);
    t57 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t57 & t53);
    t58 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t58 & t54);
    goto LAB36;

LAB37:    xsi_set_current_line(58, ng0);

LAB40:    xsi_set_current_line(59, ng0);
    t65 = (t0 + 2320U);
    t66 = *((char **)t65);
    t65 = (t0 + 4160);
    xsi_vlogvar_wait_assign_value(t65, t66, 0, 0, 64, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB39;

LAB42:    xsi_set_current_line(67, ng0);

LAB45:    xsi_set_current_line(68, ng0);
    t10 = ((char*)((ng4)));
    t20 = (t0 + 5120);
    xsi_vlogvar_wait_assign_value(t20, t10, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 53, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng5)));
    memset(t11, 0, 8);
    xsi_vlog_signed_unary_minus(t11, 32, t2, 32);
    t3 = (t0 + 4960);
    xsi_vlogvar_wait_assign_value(t3, t11, 0, 0, 11, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB44;

LAB47:    *((unsigned int *)t11) = 1;
    goto LAB50;

LAB49:    t20 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB50;

LAB51:    t32 = (t0 + 4160);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    xsi_vlog_unsigned_unary_minus(t68, 64, t34, 64);
    goto LAB52;

LAB53:    t42 = (t0 + 4160);
    t43 = (t42 + 56U);
    t59 = *((char **)t43);
    goto LAB54;

LAB55:    xsi_vlog_unsigned_bit_combine(t67, 64, t68, 64, t59, 64);
    goto LAB59;

LAB57:    memcpy(t67, t68, 16);
    goto LAB59;

LAB62:    *((unsigned int *)t11) = 1;
    goto LAB65;

LAB66:    xsi_set_current_line(89, ng0);

LAB69:    xsi_set_current_line(90, ng0);
    t33 = (t0 + 4960);
    t34 = (t33 + 56U);
    t42 = *((char **)t34);
    t43 = ((char*)((ng10)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 32, t42, 11, t43, 32);
    t59 = (t0 + 4960);
    xsi_vlogvar_wait_assign_value(t59, t28, 0, 0, 11, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng10)));
    xsi_vlog_unsigned_lshift(t67, 53, t4, 53, t5, 32);
    t7 = (t0 + 4640);
    xsi_vlogvar_wait_assign_value(t7, t67, 0, 0, 53, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 10);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 10);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t9 = (t0 + 4640);
    t10 = (t0 + 4640);
    t20 = (t10 + 72U);
    t27 = *((char **)t20);
    t32 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t21, t27, 2, t32, 32, 1);
    t33 = (t21 + 4);
    t18 = *((unsigned int *)t33);
    t8 = (!(t18));
    if (t8 == 1)
        goto LAB70;

LAB71:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng10)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_lshift(t11, 11, t4, 11, t5, 32);
    t7 = (t0 + 4800);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 11, 0LL);
    goto LAB68;

LAB70:    xsi_vlogvar_wait_assign_value(t9, t11, 0, *((unsigned int *)t21), 1, 0LL);
    goto LAB71;

LAB74:    *((unsigned int *)t21) = 1;
    goto LAB76;

LAB75:    t27 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB76;

LAB78:    *((unsigned int *)t11) = 1;
    goto LAB81;

LAB80:    t9 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB81;

LAB82:    t20 = (t0 + 5440);
    t27 = (t20 + 56U);
    t32 = *((char **)t27);
    memset(t21, 0, 8);
    t33 = (t32 + 4);
    t22 = *((unsigned int *)t33);
    t23 = (~(t22));
    t24 = *((unsigned int *)t32);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB85;

LAB86:    if (*((unsigned int *)t33) != 0)
        goto LAB87;

LAB88:    t42 = (t21 + 4);
    t29 = *((unsigned int *)t21);
    t30 = (!(t29));
    t31 = *((unsigned int *)t42);
    t35 = (t30 || t31);
    if (t35 > 0)
        goto LAB89;

LAB90:    memcpy(t70, t21, 8);

LAB91:    memset(t77, 0, 8);
    t78 = (t70 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t70);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB99;

LAB100:    if (*((unsigned int *)t78) != 0)
        goto LAB101;

LAB102:    t85 = (t77 + 4);
    t86 = *((unsigned int *)t77);
    t87 = (!(t86));
    t88 = *((unsigned int *)t85);
    t89 = (t87 || t88);
    if (t89 > 0)
        goto LAB103;

LAB104:    memcpy(t110, t77, 8);

LAB105:    memset(t138, 0, 8);
    t139 = (t110 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t110);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB113;

LAB114:    if (*((unsigned int *)t139) != 0)
        goto LAB115;

LAB116:    t147 = *((unsigned int *)t11);
    t148 = *((unsigned int *)t138);
    t149 = (t147 & t148);
    *((unsigned int *)t146) = t149;
    t150 = (t11 + 4);
    t151 = (t138 + 4);
    t152 = (t146 + 4);
    t153 = *((unsigned int *)t150);
    t154 = *((unsigned int *)t151);
    t155 = (t153 | t154);
    *((unsigned int *)t152) = t155;
    t156 = *((unsigned int *)t152);
    t157 = (t156 != 0);
    if (t157 == 1)
        goto LAB117;

LAB118:
LAB119:    goto LAB84;

LAB85:    *((unsigned int *)t21) = 1;
    goto LAB88;

LAB87:    t34 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB88;

LAB89:    t43 = (t0 + 5600);
    t59 = (t43 + 56U);
    t65 = *((char **)t59);
    memset(t28, 0, 8);
    t66 = (t65 + 4);
    t36 = *((unsigned int *)t66);
    t37 = (~(t36));
    t38 = *((unsigned int *)t65);
    t39 = (t38 & t37);
    t40 = (t39 & 1U);
    if (t40 != 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t66) != 0)
        goto LAB94;

LAB95:    t41 = *((unsigned int *)t21);
    t44 = *((unsigned int *)t28);
    t45 = (t41 | t44);
    *((unsigned int *)t70) = t45;
    t71 = (t21 + 4);
    t72 = (t28 + 4);
    t73 = (t70 + 4);
    t46 = *((unsigned int *)t71);
    t47 = *((unsigned int *)t72);
    t48 = (t46 | t47);
    *((unsigned int *)t73) = t48;
    t49 = *((unsigned int *)t73);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB96;

LAB97:
LAB98:    goto LAB91;

LAB92:    *((unsigned int *)t28) = 1;
    goto LAB95;

LAB94:    t69 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t69) = 1;
    goto LAB95;

LAB96:    t51 = *((unsigned int *)t70);
    t53 = *((unsigned int *)t73);
    *((unsigned int *)t70) = (t51 | t53);
    t74 = (t21 + 4);
    t75 = (t28 + 4);
    t54 = *((unsigned int *)t74);
    t55 = (~(t54));
    t56 = *((unsigned int *)t21);
    t52 = (t56 & t55);
    t57 = *((unsigned int *)t75);
    t58 = (~(t57));
    t60 = *((unsigned int *)t28);
    t76 = (t60 & t58);
    t61 = (~(t52));
    t62 = (~(t76));
    t63 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t63 & t61);
    t64 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t64 & t62);
    goto LAB98;

LAB99:    *((unsigned int *)t77) = 1;
    goto LAB102;

LAB101:    t84 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB102;

LAB103:    t90 = (t0 + 4640);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    memset(t93, 0, 8);
    t94 = (t93 + 4);
    t95 = (t92 + 4);
    t96 = *((unsigned int *)t92);
    t97 = (t96 >> 0);
    t98 = (t97 & 1);
    *((unsigned int *)t93) = t98;
    t99 = *((unsigned int *)t95);
    t100 = (t99 >> 0);
    t101 = (t100 & 1);
    *((unsigned int *)t94) = t101;
    memset(t102, 0, 8);
    t103 = (t93 + 4);
    t104 = *((unsigned int *)t103);
    t105 = (~(t104));
    t106 = *((unsigned int *)t93);
    t107 = (t106 & t105);
    t108 = (t107 & 1U);
    if (t108 != 0)
        goto LAB106;

LAB107:    if (*((unsigned int *)t103) != 0)
        goto LAB108;

LAB109:    t111 = *((unsigned int *)t77);
    t112 = *((unsigned int *)t102);
    t113 = (t111 | t112);
    *((unsigned int *)t110) = t113;
    t114 = (t77 + 4);
    t115 = (t102 + 4);
    t116 = (t110 + 4);
    t117 = *((unsigned int *)t114);
    t118 = *((unsigned int *)t115);
    t119 = (t117 | t118);
    *((unsigned int *)t116) = t119;
    t120 = *((unsigned int *)t116);
    t121 = (t120 != 0);
    if (t121 == 1)
        goto LAB110;

LAB111:
LAB112:    goto LAB105;

LAB106:    *((unsigned int *)t102) = 1;
    goto LAB109;

LAB108:    t109 = (t102 + 4);
    *((unsigned int *)t102) = 1;
    *((unsigned int *)t109) = 1;
    goto LAB109;

LAB110:    t122 = *((unsigned int *)t110);
    t123 = *((unsigned int *)t116);
    *((unsigned int *)t110) = (t122 | t123);
    t124 = (t77 + 4);
    t125 = (t102 + 4);
    t126 = *((unsigned int *)t124);
    t127 = (~(t126));
    t128 = *((unsigned int *)t77);
    t129 = (t128 & t127);
    t130 = *((unsigned int *)t125);
    t131 = (~(t130));
    t132 = *((unsigned int *)t102);
    t133 = (t132 & t131);
    t134 = (~(t129));
    t135 = (~(t133));
    t136 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t136 & t134);
    t137 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t137 & t135);
    goto LAB112;

LAB113:    *((unsigned int *)t138) = 1;
    goto LAB116;

LAB115:    t145 = (t138 + 4);
    *((unsigned int *)t138) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB116;

LAB117:    t158 = *((unsigned int *)t146);
    t159 = *((unsigned int *)t152);
    *((unsigned int *)t146) = (t158 | t159);
    t160 = (t11 + 4);
    t161 = (t138 + 4);
    t162 = *((unsigned int *)t11);
    t163 = (~(t162));
    t164 = *((unsigned int *)t160);
    t165 = (~(t164));
    t166 = *((unsigned int *)t138);
    t167 = (~(t166));
    t168 = *((unsigned int *)t161);
    t169 = (~(t168));
    t170 = (t163 & t165);
    t171 = (t167 & t169);
    t172 = (~(t170));
    t173 = (~(t171));
    t174 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t174 & t172);
    t175 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t175 & t173);
    t176 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t176 & t172);
    t177 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t177 & t173);
    goto LAB119;

LAB120:    xsi_set_current_line(104, ng0);

LAB123:    xsi_set_current_line(105, ng0);
    t184 = (t0 + 4640);
    t185 = (t184 + 56U);
    t186 = *((char **)t185);
    t187 = ((char*)((ng12)));
    xsi_vlog_unsigned_add(t67, 53, t186, 53, t187, 32);
    t188 = (t0 + 4640);
    xsi_vlogvar_wait_assign_value(t188, t67, 0, 0, 53, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 4640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng13)));
    xsi_vlog_unsigned_equal(t67, 53, t4, 53, t5, 53);
    t7 = (t67 + 4);
    t12 = *((unsigned int *)t7);
    t13 = (~(t12));
    t14 = *((unsigned int *)t67);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB124;

LAB125:
LAB126:    goto LAB122;

LAB124:    xsi_set_current_line(106, ng0);

LAB127:    xsi_set_current_line(107, ng0);
    t9 = (t0 + 4960);
    t10 = (t9 + 56U);
    t20 = *((char **)t10);
    t27 = ((char*)((ng10)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t20, 11, t27, 32);
    t32 = (t0 + 4960);
    xsi_vlogvar_wait_assign_value(t32, t11, 0, 0, 11, 0LL);
    goto LAB126;

LAB129:    t15 = *((unsigned int *)t28);
    t171 = (t15 + 0);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t21);
    t189 = (t16 - t17);
    t190 = (t189 + 1);
    xsi_vlogvar_wait_assign_value(t7, t67, t171, *((unsigned int *)t21), t190, 0LL);
    goto LAB130;

LAB131:    t15 = *((unsigned int *)t70);
    t170 = (t15 + 0);
    t16 = *((unsigned int *)t21);
    t17 = *((unsigned int *)t28);
    t171 = (t16 - t17);
    t189 = (t171 + 1);
    xsi_vlogvar_wait_assign_value(t7, t11, t170, *((unsigned int *)t28), t189, 0LL);
    goto LAB132;

LAB133:    xsi_vlogvar_wait_assign_value(t5, t4, 0, *((unsigned int *)t11), 1, 0LL);
    goto LAB134;

LAB136:    *((unsigned int *)t11) = 1;
    goto LAB139;

LAB138:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB139;

LAB140:    t10 = (t0 + 2640U);
    t20 = *((char **)t10);
    memset(t21, 0, 8);
    t10 = (t20 + 4);
    t22 = *((unsigned int *)t10);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB143;

LAB144:    if (*((unsigned int *)t10) != 0)
        goto LAB145;

LAB146:    t29 = *((unsigned int *)t11);
    t30 = *((unsigned int *)t21);
    t31 = (t29 & t30);
    *((unsigned int *)t28) = t31;
    t32 = (t11 + 4);
    t33 = (t21 + 4);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t32);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t38 = *((unsigned int *)t34);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB147;

LAB148:
LAB149:    goto LAB142;

LAB143:    *((unsigned int *)t21) = 1;
    goto LAB146;

LAB145:    t27 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB146;

LAB147:    t40 = *((unsigned int *)t28);
    t41 = *((unsigned int *)t34);
    *((unsigned int *)t28) = (t40 | t41);
    t42 = (t11 + 4);
    t43 = (t21 + 4);
    t44 = *((unsigned int *)t11);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (~(t46));
    t48 = *((unsigned int *)t21);
    t49 = (~(t48));
    t50 = *((unsigned int *)t43);
    t51 = (~(t50));
    t8 = (t45 & t47);
    t52 = (t49 & t51);
    t53 = (~(t8));
    t54 = (~(t52));
    t55 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t55 & t53);
    t56 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t56 & t54);
    t57 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t57 & t53);
    t58 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t58 & t54);
    goto LAB149;

LAB150:    xsi_set_current_line(125, ng0);

LAB153:    xsi_set_current_line(126, ng0);
    t65 = ((char*)((ng1)));
    t66 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t66, t65, 0, 0, 1, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB152;

LAB156:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB157;

LAB158:    xsi_set_current_line(135, ng0);

LAB161:    xsi_set_current_line(136, ng0);
    t10 = ((char*)((ng1)));
    t20 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t20, t10, 0, 0, 3, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 64, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB160;

}


extern void work_m_15135665126855975082_1933777411_init()
{
	static char *pe[] = {(void *)Cont_26_0,(void *)Cont_27_1,(void *)Cont_28_2,(void *)Always_50_3};
	xsi_register_didat("work_m_15135665126855975082_1933777411", "isim/long_to_double_small_tb_isim_beh.exe.sim/work/m_15135665126855975082_1933777411.didat");
	xsi_register_executes(pe);
}
