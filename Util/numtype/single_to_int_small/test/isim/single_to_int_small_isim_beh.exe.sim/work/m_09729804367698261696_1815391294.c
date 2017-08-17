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
static const char *ng0 = "/home/jselfridge/Documents/FPGA/Sandbox/dawsonjon_fpu/single_to_int_small/single_to_int_small.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {31, 0};
static int ng5[] = {8, 0};
static int ng6[] = {0, 0};
static int ng7[] = {7, 0};
static int ng8[] = {127, 0};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {2147483648U, 0U};
static unsigned int ng11[] = {3U, 0U};
static int ng12[] = {1, 0};



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

LAB0:    t1 = (t0 + 5440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6632);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6504);
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

LAB0:    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6696);
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
    t18 = (t0 + 6520);
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

LAB0:    t1 = (t0 + 5936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6760);
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
    t18 = (t0 + 6536);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_45_3(char *t0)
{
    char t11[8];
    char t21[8];
    char t28[8];
    char t67[8];
    char t68[8];
    char t82[8];
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
    int t69;
    int t70;
    int t71;
    int t72;
    int t73;
    int t74;
    int t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t83;

LAB0:    t1 = (t0 + 6184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 6552);
    *((int *)t2) = 1;
    t3 = (t0 + 6216);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(45, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 3728);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 3);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB15;

LAB16:
LAB17:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1888U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng12)));
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
        goto LAB112;

LAB109:    if (t23 != 0)
        goto LAB111;

LAB110:    *((unsigned int *)t11) = 1;

LAB112:    t9 = (t11 + 4);
    t26 = *((unsigned int *)t9);
    t29 = (~(t26));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t35 = (t31 != 0);
    if (t35 > 0)
        goto LAB113;

LAB114:
LAB115:    goto LAB2;

LAB7:    xsi_set_current_line(51, ng0);

LAB18:    xsi_set_current_line(52, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 3408);
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
        goto LAB19;

LAB20:    if (*((unsigned int *)t5) != 0)
        goto LAB21;

LAB22:    t9 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t9);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB23;

LAB24:    memcpy(t28, t11, 8);

LAB25:    t59 = (t28 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t28);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB33;

LAB34:
LAB35:    goto LAB17;

LAB9:    xsi_set_current_line(61, ng0);

LAB37:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 4048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t21, 0, 8);
    t7 = (t21 + 4);
    t9 = (t5 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (t12 >> 0);
    *((unsigned int *)t21) = t13;
    t14 = *((unsigned int *)t9);
    t15 = (t14 >> 0);
    *((unsigned int *)t7) = t15;
    t16 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t16 & 8388607U);
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t17 & 8388607U);
    t10 = ((char*)((ng2)));
    xsi_vlogtype_concat(t11, 24, 24, 2U, t10, 1, t21, 23);
    t20 = (t0 + 3888);
    t27 = (t0 + 3888);
    t32 = (t27 + 72U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng4)));
    t42 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t28, t67, t68, ((int*)(t33)), 2, t34, 32, 1, t42, 32, 1);
    t43 = (t28 + 4);
    t18 = *((unsigned int *)t43);
    t52 = (!(t18));
    t59 = (t67 + 4);
    t19 = *((unsigned int *)t59);
    t69 = (!(t19));
    t70 = (t52 && t69);
    t65 = (t68 + 4);
    t22 = *((unsigned int *)t65);
    t71 = (!(t22));
    t72 = (t70 && t71);
    if (t72 == 1)
        goto LAB38;

LAB39:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3888);
    t4 = (t0 + 3888);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t9 = ((char*)((ng7)));
    t10 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t11, t21, t28, ((int*)(t7)), 2, t9, 32, 1, t10, 32, 1);
    t20 = (t11 + 4);
    t12 = *((unsigned int *)t20);
    t8 = (!(t12));
    t27 = (t21 + 4);
    t13 = *((unsigned int *)t27);
    t52 = (!(t13));
    t69 = (t8 && t52);
    t32 = (t28 + 4);
    t14 = *((unsigned int *)t32);
    t70 = (!(t14));
    t71 = (t69 && t70);
    if (t71 == 1)
        goto LAB40;

LAB41:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 23);
    *((unsigned int *)t11) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 23);
    *((unsigned int *)t5) = t15;
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 255U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 255U);
    t9 = ((char*)((ng8)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_minus(t21, 32, t11, 32, t9, 32);
    t10 = (t0 + 4368);
    xsi_vlogvar_wait_assign_value(t10, t21, 0, 0, 9, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t9 = (t0 + 4528);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB17;

LAB11:    xsi_set_current_line(70, ng0);

LAB42:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 4368);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    xsi_vlogtype_sign_extend(t11, 32, t5, 9);
    t7 = ((char*)((ng8)));
    memset(t21, 0, 8);
    xsi_vlog_signed_unary_minus(t21, 32, t7, 32);
    memset(t28, 0, 8);
    xsi_vlog_signed_equal(t28, 32, t11, 32, t21, 32);
    t9 = (t28 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (~(t12));
    t14 = *((unsigned int *)t28);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 4368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlogtype_sign_extend(t11, 32, t4, 9);
    t5 = ((char*)((ng4)));
    memset(t21, 0, 8);
    xsi_vlog_signed_greater(t21, 32, t11, 32, t5, 32);
    t7 = (t21 + 4);
    t12 = *((unsigned int *)t7);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(77, ng0);

LAB51:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB49:
LAB45:    goto LAB17;

LAB13:    xsi_set_current_line(83, ng0);

LAB52:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 4368);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    xsi_vlogtype_sign_extend(t11, 32, t5, 9);
    t7 = ((char*)((ng4)));
    memset(t21, 0, 8);
    xsi_vlog_signed_less(t21, 32, t11, 32, t7, 32);
    memset(t28, 0, 8);
    t9 = (t21 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t9) != 0)
        goto LAB55;

LAB56:    t20 = (t28 + 4);
    t17 = *((unsigned int *)t28);
    t18 = *((unsigned int *)t20);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB57;

LAB58:    memcpy(t68, t28, 8);

LAB59:    t77 = (t68 + 4);
    t60 = *((unsigned int *)t77);
    t61 = (~(t60));
    t62 = *((unsigned int *)t68);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(87, ng0);

LAB71:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t5) = t17;
    t9 = (t11 + 4);
    t18 = *((unsigned int *)t9);
    t19 = (~(t18));
    t22 = *((unsigned int *)t11);
    t23 = (t22 & t19);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(90, ng0);

LAB76:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t21, 0, 8);
    t5 = (t4 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t5) != 0)
        goto LAB79;

LAB80:    t9 = (t21 + 4);
    t17 = *((unsigned int *)t21);
    t18 = *((unsigned int *)t9);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB81;

LAB82:    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t9);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t9) > 0)
        goto LAB85;

LAB86:    if (*((unsigned int *)t21) > 0)
        goto LAB87;

LAB88:    memcpy(t11, t34, 8);

LAB89:    t42 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t42, t11, 0, 0, 32, 0LL);

LAB74:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB69:    goto LAB17;

LAB15:    xsi_set_current_line(98, ng0);

LAB90:    xsi_set_current_line(99, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 4208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3568);
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
        goto LAB91;

LAB92:    if (*((unsigned int *)t5) != 0)
        goto LAB93;

LAB94:    t9 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t9);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB95;

LAB96:    memcpy(t28, t11, 8);

LAB97:    t59 = (t28 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t28);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB105;

LAB106:
LAB107:    goto LAB17;

LAB19:    *((unsigned int *)t11) = 1;
    goto LAB22;

LAB21:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB22;

LAB23:    t10 = (t0 + 2208U);
    t20 = *((char **)t10);
    memset(t21, 0, 8);
    t10 = (t20 + 4);
    t22 = *((unsigned int *)t10);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t10) != 0)
        goto LAB28;

LAB29:    t29 = *((unsigned int *)t11);
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
        goto LAB30;

LAB31:
LAB32:    goto LAB25;

LAB26:    *((unsigned int *)t21) = 1;
    goto LAB29;

LAB28:    t27 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB29;

LAB30:    t40 = *((unsigned int *)t28);
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
    goto LAB32;

LAB33:    xsi_set_current_line(53, ng0);

LAB36:    xsi_set_current_line(54, ng0);
    t65 = (t0 + 2048U);
    t66 = *((char **)t65);
    t65 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t65, t66, 0, 0, 32, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB35;

LAB38:    t23 = *((unsigned int *)t68);
    t73 = (t23 + 0);
    t24 = *((unsigned int *)t28);
    t25 = *((unsigned int *)t67);
    t74 = (t24 - t25);
    t75 = (t74 + 1);
    xsi_vlogvar_wait_assign_value(t20, t11, t73, *((unsigned int *)t67), t75, 0LL);
    goto LAB39;

LAB40:    t15 = *((unsigned int *)t28);
    t72 = (t15 + 0);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t21);
    t73 = (t16 - t17);
    t74 = (t73 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t72, *((unsigned int *)t21), t74, 0LL);
    goto LAB41;

LAB43:    xsi_set_current_line(71, ng0);

LAB46:    xsi_set_current_line(72, ng0);
    t10 = ((char*)((ng6)));
    t20 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t20, t10, 0, 0, 32, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB45;

LAB47:    xsi_set_current_line(74, ng0);

LAB50:    xsi_set_current_line(75, ng0);
    t9 = ((char*)((ng10)));
    t10 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 32, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB49;

LAB53:    *((unsigned int *)t28) = 1;
    goto LAB56;

LAB55:    t10 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB56;

LAB57:    t27 = (t0 + 3888);
    t32 = (t27 + 56U);
    t33 = *((char **)t32);
    memset(t67, 0, 8);
    t34 = (t33 + 4);
    t22 = *((unsigned int *)t34);
    t23 = (~(t22));
    t24 = *((unsigned int *)t33);
    t25 = (t24 & t23);
    t26 = (t25 & 4294967295U);
    if (t26 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t34) != 0)
        goto LAB62;

LAB63:    t29 = *((unsigned int *)t28);
    t30 = *((unsigned int *)t67);
    t31 = (t29 & t30);
    *((unsigned int *)t68) = t31;
    t43 = (t28 + 4);
    t59 = (t67 + 4);
    t65 = (t68 + 4);
    t35 = *((unsigned int *)t43);
    t36 = *((unsigned int *)t59);
    t37 = (t35 | t36);
    *((unsigned int *)t65) = t37;
    t38 = *((unsigned int *)t65);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB64;

LAB65:
LAB66:    goto LAB59;

LAB60:    *((unsigned int *)t67) = 1;
    goto LAB63;

LAB62:    t42 = (t67 + 4);
    *((unsigned int *)t67) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB63;

LAB64:    t40 = *((unsigned int *)t68);
    t41 = *((unsigned int *)t65);
    *((unsigned int *)t68) = (t40 | t41);
    t66 = (t28 + 4);
    t76 = (t67 + 4);
    t44 = *((unsigned int *)t28);
    t45 = (~(t44));
    t46 = *((unsigned int *)t66);
    t47 = (~(t46));
    t48 = *((unsigned int *)t67);
    t49 = (~(t48));
    t50 = *((unsigned int *)t76);
    t51 = (~(t50));
    t52 = (t45 & t47);
    t69 = (t49 & t51);
    t53 = (~(t52));
    t54 = (~(t69));
    t55 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t55 & t53);
    t56 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t56 & t54);
    t57 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t57 & t53);
    t58 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t58 & t54);
    goto LAB66;

LAB67:    xsi_set_current_line(84, ng0);

LAB70:    xsi_set_current_line(85, ng0);
    t78 = (t0 + 4368);
    t79 = (t78 + 56U);
    t80 = *((char **)t79);
    t81 = ((char*)((ng12)));
    memset(t82, 0, 8);
    xsi_vlog_unsigned_add(t82, 32, t80, 9, t81, 32);
    t83 = (t0 + 4368);
    xsi_vlogvar_wait_assign_value(t83, t82, 0, 0, 9, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng12)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_rshift(t11, 32, t4, 32, t5, 32);
    t7 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 32, 0LL);
    goto LAB69;

LAB72:    xsi_set_current_line(88, ng0);

LAB75:    xsi_set_current_line(89, ng0);
    t10 = ((char*)((ng10)));
    t20 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t20, t10, 0, 0, 32, 0LL);
    goto LAB74;

LAB77:    *((unsigned int *)t21) = 1;
    goto LAB80;

LAB79:    t7 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB80;

LAB81:    t10 = (t0 + 3888);
    t20 = (t10 + 56U);
    t27 = *((char **)t20);
    memset(t28, 0, 8);
    xsi_vlog_unsigned_unary_minus(t28, 32, t27, 32);
    goto LAB82;

LAB83:    t32 = (t0 + 3888);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    goto LAB84;

LAB85:    xsi_vlog_unsigned_bit_combine(t11, 32, t28, 32, t34, 32);
    goto LAB89;

LAB87:    memcpy(t11, t28, 8);
    goto LAB89;

LAB91:    *((unsigned int *)t11) = 1;
    goto LAB94;

LAB93:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB94;

LAB95:    t10 = (t0 + 2368U);
    t20 = *((char **)t10);
    memset(t21, 0, 8);
    t10 = (t20 + 4);
    t22 = *((unsigned int *)t10);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB98;

LAB99:    if (*((unsigned int *)t10) != 0)
        goto LAB100;

LAB101:    t29 = *((unsigned int *)t11);
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
        goto LAB102;

LAB103:
LAB104:    goto LAB97;

LAB98:    *((unsigned int *)t21) = 1;
    goto LAB101;

LAB100:    t27 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB101;

LAB102:    t40 = *((unsigned int *)t28);
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
    goto LAB104;

LAB105:    xsi_set_current_line(101, ng0);

LAB108:    xsi_set_current_line(102, ng0);
    t65 = ((char*)((ng1)));
    t66 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t66, t65, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB107;

LAB111:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB112;

LAB113:    xsi_set_current_line(111, ng0);

LAB116:    xsi_set_current_line(112, ng0);
    t10 = ((char*)((ng1)));
    t20 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t20, t10, 0, 0, 3, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB115;

}


extern void work_m_09729804367698261696_1815391294_init()
{
	static char *pe[] = {(void *)Cont_26_0,(void *)Cont_27_1,(void *)Cont_28_2,(void *)Always_45_3};
	xsi_register_didat("work_m_09729804367698261696_1815391294", "isim/single_to_int_small_isim_beh.exe.sim/work/m_09729804367698261696_1815391294.didat");
	xsi_register_executes(pe);
}
