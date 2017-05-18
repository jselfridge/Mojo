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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/radio/radio_tb.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {10, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {978, 0};
static int ng5[] = {3000, 0};
static int ng6[] = {988, 0};
static int ng7[] = {0, 0};
static int ng8[] = {12, 0};
static int ng9[] = {512, 0};
static int ng10[] = {1012, 0};
static int ng11[] = {1023, 0};
static int ng12[] = {2021, 0};



static void Initial_26_0(char *t0)
{
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;

LAB0:    t1 = (t0 + 2680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);

LAB4:    xsi_set_current_line(27, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(28, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(29, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5768);
    *((int *)t8) = t7;

LAB5:    t9 = (t0 + 5768);
    if (*((int *)t9) > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(31, ng0);

LAB15:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 2488);
    xsi_process_wait(t2, 500000LL);
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB6:    xsi_set_current_line(29, ng0);
    t10 = (t0 + 2488);
    xsi_process_wait(t10, 500000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(29, ng0);
    t12 = (t0 + 1448);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memset(t11, 0, 8);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB12;

LAB10:    if (*((unsigned int *)t15) == 0)
        goto LAB9;

LAB11:    t21 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t21) = 1;

LAB12:    t22 = (t11 + 4);
    t23 = (t14 + 4);
    t24 = *((unsigned int *)t14);
    t25 = (~(t24));
    *((unsigned int *)t11) = t25;
    *((unsigned int *)t22) = 0;
    if (*((unsigned int *)t23) != 0)
        goto LAB14;

LAB13:    t30 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t30 & 1U);
    t31 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t31 & 1U);
    t32 = (t0 + 1448);
    xsi_vlogvar_assign_value(t32, t11, 0, 0, 1);
    t2 = (t0 + 5768);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB5;

LAB9:    *((unsigned int *)t11) = 1;
    goto LAB12;

LAB14:    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t23);
    *((unsigned int *)t11) = (t26 | t27);
    t28 = *((unsigned int *)t22);
    t29 = *((unsigned int *)t23);
    *((unsigned int *)t22) = (t28 | t29);
    goto LAB13;

LAB16:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1448);
    t8 = (t3 + 56U);
    t9 = *((char **)t8);
    memset(t11, 0, 8);
    t10 = (t9 + 4);
    t4 = *((unsigned int *)t10);
    t5 = (~(t4));
    t6 = *((unsigned int *)t9);
    t16 = (t6 & t5);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB20;

LAB18:    if (*((unsigned int *)t10) == 0)
        goto LAB17;

LAB19:    t12 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t12) = 1;

LAB20:    t13 = (t11 + 4);
    t14 = (t9 + 4);
    t18 = *((unsigned int *)t9);
    t19 = (~(t18));
    *((unsigned int *)t11) = t19;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB22;

LAB21:    t27 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t27 & 1U);
    t28 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t28 & 1U);
    t15 = (t0 + 1448);
    xsi_vlogvar_assign_value(t15, t11, 0, 0, 1);
    goto LAB15;

LAB17:    *((unsigned int *)t11) = 1;
    goto LAB20;

LAB22:    t20 = *((unsigned int *)t11);
    t24 = *((unsigned int *)t14);
    *((unsigned int *)t11) = (t20 | t24);
    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t25 | t26);
    goto LAB21;

LAB23:    goto LAB1;

}

static void Initial_35_1(char *t0)
{
    char t12[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t15;

LAB0:    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);

LAB4:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3248);
    *((int *)t2) = 1;
    t3 = (t0 + 2960);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5772);
    *((int *)t8) = t7;

LAB6:    t9 = (t0 + 5772);
    if (*((int *)t9) > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng4)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5776);
    *((int *)t9) = t7;

LAB10:    t10 = (t0 + 5776);
    if (*((int *)t10) > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5780);
    *((int *)t8) = t7;

LAB14:    t9 = (t0 + 5780);
    if (*((int *)t9) > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng4)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5784);
    *((int *)t9) = t7;

LAB18:    t10 = (t0 + 5784);
    if (*((int *)t10) > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5788);
    *((int *)t8) = t7;

LAB22:    t9 = (t0 + 5788);
    if (*((int *)t9) > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng4)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5792);
    *((int *)t9) = t7;

LAB26:    t10 = (t0 + 5792);
    if (*((int *)t10) > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng7)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5796);
    *((int *)t9) = t7;

LAB30:    t10 = (t0 + 5796);
    if (*((int *)t10) > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5800);
    *((int *)t10) = t7;

LAB34:    t11 = (t0 + 5800);
    if (*((int *)t11) > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng7)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5804);
    *((int *)t9) = t7;

LAB38:    t10 = (t0 + 5804);
    if (*((int *)t10) > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5808);
    *((int *)t10) = t7;

LAB42:    t11 = (t0 + 5808);
    if (*((int *)t11) > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng7)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5812);
    *((int *)t9) = t7;

LAB46:    t10 = (t0 + 5812);
    if (*((int *)t10) > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5816);
    *((int *)t10) = t7;

LAB50:    t11 = (t0 + 5816);
    if (*((int *)t11) > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng8)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5820);
    *((int *)t9) = t7;

LAB54:    t10 = (t0 + 5820);
    if (*((int *)t10) > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng8)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5824);
    *((int *)t10) = t7;

LAB58:    t11 = (t0 + 5824);
    if (*((int *)t11) > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng8)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5828);
    *((int *)t9) = t7;

LAB62:    t10 = (t0 + 5828);
    if (*((int *)t10) > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng8)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5832);
    *((int *)t10) = t7;

LAB66:    t11 = (t0 + 5832);
    if (*((int *)t11) > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng8)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5836);
    *((int *)t9) = t7;

LAB70:    t10 = (t0 + 5836);
    if (*((int *)t10) > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng8)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5840);
    *((int *)t10) = t7;

LAB74:    t11 = (t0 + 5840);
    if (*((int *)t11) > 0)
        goto LAB75;

LAB76:    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng9)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5844);
    *((int *)t9) = t7;

LAB78:    t10 = (t0 + 5844);
    if (*((int *)t10) > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng9)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5848);
    *((int *)t10) = t7;

LAB82:    t11 = (t0 + 5848);
    if (*((int *)t11) > 0)
        goto LAB83;

LAB84:    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng9)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5852);
    *((int *)t9) = t7;

LAB86:    t10 = (t0 + 5852);
    if (*((int *)t10) > 0)
        goto LAB87;

LAB88:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng9)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5856);
    *((int *)t10) = t7;

LAB90:    t11 = (t0 + 5856);
    if (*((int *)t11) > 0)
        goto LAB91;

LAB92:    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng9)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5860);
    *((int *)t9) = t7;

LAB94:    t10 = (t0 + 5860);
    if (*((int *)t10) > 0)
        goto LAB95;

LAB96:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng9)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5864);
    *((int *)t10) = t7;

LAB98:    t11 = (t0 + 5864);
    if (*((int *)t11) > 0)
        goto LAB99;

LAB100:    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng10)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5868);
    *((int *)t9) = t7;

LAB102:    t10 = (t0 + 5868);
    if (*((int *)t10) > 0)
        goto LAB103;

LAB104:    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng10)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5872);
    *((int *)t10) = t7;

LAB106:    t11 = (t0 + 5872);
    if (*((int *)t11) > 0)
        goto LAB107;

LAB108:    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng10)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5876);
    *((int *)t9) = t7;

LAB110:    t10 = (t0 + 5876);
    if (*((int *)t10) > 0)
        goto LAB111;

LAB112:    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng10)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5880);
    *((int *)t10) = t7;

LAB114:    t11 = (t0 + 5880);
    if (*((int *)t11) > 0)
        goto LAB115;

LAB116:    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng10)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5884);
    *((int *)t9) = t7;

LAB118:    t10 = (t0 + 5884);
    if (*((int *)t10) > 0)
        goto LAB119;

LAB120:    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng10)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5888);
    *((int *)t10) = t7;

LAB122:    t11 = (t0 + 5888);
    if (*((int *)t11) > 0)
        goto LAB123;

LAB124:    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng11)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5892);
    *((int *)t9) = t7;

LAB126:    t10 = (t0 + 5892);
    if (*((int *)t10) > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng11)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5896);
    *((int *)t10) = t7;

LAB130:    t11 = (t0 + 5896);
    if (*((int *)t11) > 0)
        goto LAB131;

LAB132:    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng11)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5900);
    *((int *)t9) = t7;

LAB134:    t10 = (t0 + 5900);
    if (*((int *)t10) > 0)
        goto LAB135;

LAB136:    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng11)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5904);
    *((int *)t10) = t7;

LAB138:    t11 = (t0 + 5904);
    if (*((int *)t11) > 0)
        goto LAB139;

LAB140:    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng11)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5908);
    *((int *)t9) = t7;

LAB142:    t10 = (t0 + 5908);
    if (*((int *)t10) > 0)
        goto LAB143;

LAB144:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng6)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = ((char*)((ng11)));
    memset(t14, 0, 8);
    xsi_vlog_signed_minus(t14, 32, t12, 32, t8, 32);
    t9 = (t14 + 4);
    t4 = *((unsigned int *)t9);
    t5 = (~(t4));
    t6 = *((unsigned int *)t14);
    t7 = (t6 & t5);
    t10 = (t0 + 5912);
    *((int *)t10) = t7;

LAB146:    t11 = (t0 + 5912);
    if (*((int *)t11) > 0)
        goto LAB147;

LAB148:    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5916);
    *((int *)t8) = t7;

LAB150:    t9 = (t0 + 5916);
    if (*((int *)t9) > 0)
        goto LAB151;

LAB152:    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng12)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5920);
    *((int *)t9) = t7;

LAB154:    t10 = (t0 + 5920);
    if (*((int *)t10) > 0)
        goto LAB155;

LAB156:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5924);
    *((int *)t8) = t7;

LAB158:    t9 = (t0 + 5924);
    if (*((int *)t9) > 0)
        goto LAB159;

LAB160:    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng12)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5928);
    *((int *)t9) = t7;

LAB162:    t10 = (t0 + 5928);
    if (*((int *)t10) > 0)
        goto LAB163;

LAB164:    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5932);
    *((int *)t8) = t7;

LAB166:    t9 = (t0 + 5932);
    if (*((int *)t9) > 0)
        goto LAB167;

LAB168:    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng5)));
    t3 = ((char*)((ng12)));
    memset(t12, 0, 8);
    xsi_vlog_signed_minus(t12, 32, t2, 32, t3, 32);
    t8 = (t12 + 4);
    t4 = *((unsigned int *)t8);
    t5 = (~(t4));
    t6 = *((unsigned int *)t12);
    t7 = (t6 & t5);
    t9 = (t0 + 5936);
    *((int *)t9) = t7;

LAB170:    t10 = (t0 + 5936);
    if (*((int *)t10) > 0)
        goto LAB171;

LAB172:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 2736);
    xsi_process_wait(t2, 50000000LL);
    *((char **)t1) = &&LAB174;
    goto LAB1;

LAB7:    xsi_set_current_line(42, ng0);
    t10 = (t0 + 3264);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    t2 = (t0 + 5772);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB6;

LAB11:    xsi_set_current_line(44, ng0);
    t11 = (t0 + 3280);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    t2 = (t0 + 5776);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB10;

LAB15:    xsi_set_current_line(46, ng0);
    t10 = (t0 + 3296);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    t2 = (t0 + 5780);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB14;

LAB19:    xsi_set_current_line(48, ng0);
    t11 = (t0 + 3312);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    t2 = (t0 + 5784);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB18;

LAB23:    xsi_set_current_line(50, ng0);
    t10 = (t0 + 3328);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB25:    t2 = (t0 + 5788);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB22;

LAB27:    xsi_set_current_line(52, ng0);
    t11 = (t0 + 3344);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB29:    t2 = (t0 + 5792);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB26;

LAB31:    xsi_set_current_line(56, ng0);
    t11 = (t0 + 3360);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB33:    t2 = (t0 + 5796);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB30;

LAB35:    xsi_set_current_line(58, ng0);
    t13 = (t0 + 3376);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB37:    t2 = (t0 + 5800);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB34;

LAB39:    xsi_set_current_line(60, ng0);
    t11 = (t0 + 3392);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB41:    t2 = (t0 + 5804);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB38;

LAB43:    xsi_set_current_line(62, ng0);
    t13 = (t0 + 3408);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB45:    t2 = (t0 + 5808);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB42;

LAB47:    xsi_set_current_line(64, ng0);
    t11 = (t0 + 3424);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB49:    t2 = (t0 + 5812);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB46;

LAB51:    xsi_set_current_line(66, ng0);
    t13 = (t0 + 3440);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB53;
    goto LAB1;

LAB53:    t2 = (t0 + 5816);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB50;

LAB55:    xsi_set_current_line(70, ng0);
    t11 = (t0 + 3456);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB57;
    goto LAB1;

LAB57:    t2 = (t0 + 5820);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB54;

LAB59:    xsi_set_current_line(72, ng0);
    t13 = (t0 + 3472);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB61:    t2 = (t0 + 5824);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB58;

LAB63:    xsi_set_current_line(74, ng0);
    t11 = (t0 + 3488);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB65:    t2 = (t0 + 5828);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB62;

LAB67:    xsi_set_current_line(76, ng0);
    t13 = (t0 + 3504);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB69;
    goto LAB1;

LAB69:    t2 = (t0 + 5832);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB66;

LAB71:    xsi_set_current_line(78, ng0);
    t11 = (t0 + 3520);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB73;
    goto LAB1;

LAB73:    t2 = (t0 + 5836);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB70;

LAB75:    xsi_set_current_line(80, ng0);
    t13 = (t0 + 3536);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB77;
    goto LAB1;

LAB77:    t2 = (t0 + 5840);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB74;

LAB79:    xsi_set_current_line(84, ng0);
    t11 = (t0 + 3552);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB81;
    goto LAB1;

LAB81:    t2 = (t0 + 5844);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB78;

LAB83:    xsi_set_current_line(86, ng0);
    t13 = (t0 + 3568);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB85;
    goto LAB1;

LAB85:    t2 = (t0 + 5848);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB82;

LAB87:    xsi_set_current_line(88, ng0);
    t11 = (t0 + 3584);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB89;
    goto LAB1;

LAB89:    t2 = (t0 + 5852);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB86;

LAB91:    xsi_set_current_line(90, ng0);
    t13 = (t0 + 3600);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB93;
    goto LAB1;

LAB93:    t2 = (t0 + 5856);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB90;

LAB95:    xsi_set_current_line(92, ng0);
    t11 = (t0 + 3616);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB97;
    goto LAB1;

LAB97:    t2 = (t0 + 5860);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB94;

LAB99:    xsi_set_current_line(94, ng0);
    t13 = (t0 + 3632);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB101;
    goto LAB1;

LAB101:    t2 = (t0 + 5864);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB98;

LAB103:    xsi_set_current_line(98, ng0);
    t11 = (t0 + 3648);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB105;
    goto LAB1;

LAB105:    t2 = (t0 + 5868);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB102;

LAB107:    xsi_set_current_line(100, ng0);
    t13 = (t0 + 3664);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB109;
    goto LAB1;

LAB109:    t2 = (t0 + 5872);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB106;

LAB111:    xsi_set_current_line(102, ng0);
    t11 = (t0 + 3680);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB113;
    goto LAB1;

LAB113:    t2 = (t0 + 5876);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB110;

LAB115:    xsi_set_current_line(104, ng0);
    t13 = (t0 + 3696);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB117;
    goto LAB1;

LAB117:    t2 = (t0 + 5880);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB114;

LAB119:    xsi_set_current_line(106, ng0);
    t11 = (t0 + 3712);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB121;
    goto LAB1;

LAB121:    t2 = (t0 + 5884);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB118;

LAB123:    xsi_set_current_line(108, ng0);
    t13 = (t0 + 3728);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB125;
    goto LAB1;

LAB125:    t2 = (t0 + 5888);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB122;

LAB127:    xsi_set_current_line(112, ng0);
    t11 = (t0 + 3744);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB129;
    goto LAB1;

LAB129:    t2 = (t0 + 5892);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB126;

LAB131:    xsi_set_current_line(114, ng0);
    t13 = (t0 + 3760);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB133;
    goto LAB1;

LAB133:    t2 = (t0 + 5896);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB130;

LAB135:    xsi_set_current_line(116, ng0);
    t11 = (t0 + 3776);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB137;
    goto LAB1;

LAB137:    t2 = (t0 + 5900);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB134;

LAB139:    xsi_set_current_line(118, ng0);
    t13 = (t0 + 3792);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB141;
    goto LAB1;

LAB141:    t2 = (t0 + 5904);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB138;

LAB143:    xsi_set_current_line(120, ng0);
    t11 = (t0 + 3808);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB145;
    goto LAB1;

LAB145:    t2 = (t0 + 5908);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB142;

LAB147:    xsi_set_current_line(122, ng0);
    t13 = (t0 + 3824);
    *((int *)t13) = 1;
    t15 = (t0 + 2960);
    *((char **)t15) = t13;
    *((char **)t1) = &&LAB149;
    goto LAB1;

LAB149:    t2 = (t0 + 5912);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB146;

LAB151:    xsi_set_current_line(126, ng0);
    t10 = (t0 + 3840);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB153;
    goto LAB1;

LAB153:    t2 = (t0 + 5916);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB150;

LAB155:    xsi_set_current_line(128, ng0);
    t11 = (t0 + 3856);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB157;
    goto LAB1;

LAB157:    t2 = (t0 + 5920);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB154;

LAB159:    xsi_set_current_line(130, ng0);
    t10 = (t0 + 3872);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB161;
    goto LAB1;

LAB161:    t2 = (t0 + 5924);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB158;

LAB163:    xsi_set_current_line(132, ng0);
    t11 = (t0 + 3888);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB165;
    goto LAB1;

LAB165:    t2 = (t0 + 5928);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB162;

LAB167:    xsi_set_current_line(134, ng0);
    t10 = (t0 + 3904);
    *((int *)t10) = 1;
    t11 = (t0 + 2960);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB169;
    goto LAB1;

LAB169:    t2 = (t0 + 5932);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB166;

LAB171:    xsi_set_current_line(136, ng0);
    t11 = (t0 + 3920);
    *((int *)t11) = 1;
    t13 = (t0 + 2960);
    *((char **)t13) = t11;
    *((char **)t1) = &&LAB173;
    goto LAB1;

LAB173:    t2 = (t0 + 5936);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB170;

LAB174:    xsi_set_current_line(139, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_00939848189753345512_4217151527_init()
{
	static char *pe[] = {(void *)Initial_26_0,(void *)Initial_35_1};
	xsi_register_didat("work_m_00939848189753345512_4217151527", "isim/radio_tb_isim_beh.exe.sim/work/m_00939848189753345512_4217151527.didat");
	xsi_register_executes(pe);
}
