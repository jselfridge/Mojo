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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/serial_debug/serial_debug.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {1, 0};
static int ng4[] = {8, 0};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {7, 0};
static unsigned int ng7[] = {3U, 0U};



static void Cont_46_0(char *t0)
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

LAB0:    t1 = (t0 + 6944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 4112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8136);
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
    t18 = (t0 + 8008);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_47_1(char *t0)
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

LAB0:    t1 = (t0 + 7192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 4432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8200);
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
    t18 = (t0 + 8024);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_50_2(char *t0)
{
    char t17[8];
    char t19[8];
    char t21[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t20;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    t1 = (t0 + 7440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 8040);
    *((int *)t2) = 1;
    t3 = (t0 + 7472);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 4752);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 4592);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 8);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4912);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5232);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 9);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 5712);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5552);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 3);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 6032);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5872);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 4112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3952);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(119, ng0);

LAB72:    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4912);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(63, ng0);

LAB18:    xsi_set_current_line(64, ng0);
    t6 = (t0 + 2592U);
    t7 = *((char **)t6);
    t6 = (t7 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(67, ng0);

LAB23:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5232);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 9);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5552);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2752U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB24;

LAB25:
LAB26:
LAB21:    goto LAB17;

LAB9:    xsi_set_current_line(81, ng0);

LAB28:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 3792);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 608);
    t14 = *((char **)t7);
    t7 = (t0 + 6032);
    t15 = (t7 + 56U);
    t16 = *((char **)t15);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t14, 32, t16, 2);
    t18 = ((char*)((ng3)));
    memset(t19, 0, 8);
    xsi_vlog_unsigned_minus(t19, 32, t17, 32, t18, 32);
    t20 = ((char*)((ng4)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_multiply(t21, 32, t19, 32, t20, 32);
    memset(t22, 0, 8);
    xsi_vlog_unsigned_rshift(t22, 32, t6, 32, t21, 32);
    t23 = (t0 + 4592);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 8);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 9, t5, 9, t6, 9);
    t7 = (t0 + 5232);
    xsi_vlogvar_assign_value(t7, t17, 0, 0, 9);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 472);
    t7 = *((char **)t6);
    t6 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t7, 32, t6, 32);
    memset(t19, 0, 8);
    t14 = (t5 + 4);
    t15 = (t17 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t17);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t14);
    t13 = *((unsigned int *)t15);
    t24 = (t12 ^ t13);
    t25 = (t11 | t24);
    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t15);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB32;

LAB29:    if (t28 != 0)
        goto LAB31;

LAB30:    *((unsigned int *)t19) = 1;

LAB32:    t18 = (t19 + 4);
    t31 = *((unsigned int *)t18);
    t32 = (~(t31));
    t33 = *((unsigned int *)t19);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB33;

LAB34:
LAB35:    goto LAB17;

LAB11:    xsi_set_current_line(92, ng0);

LAB37:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 3952);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 4752);
    t7 = (t6 + 72U);
    t14 = *((char **)t7);
    t15 = (t0 + 5712);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    xsi_vlog_generic_get_index_select_value(t17, 1, t5, t14, 2, t18, 3, 2);
    t20 = (t0 + 4272);
    xsi_vlogvar_assign_value(t20, t17, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 9, t5, 9, t6, 9);
    t7 = (t0 + 5232);
    xsi_vlogvar_assign_value(t7, t17, 0, 0, 9);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 472);
    t7 = *((char **)t6);
    t6 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t7, 32, t6, 32);
    memset(t19, 0, 8);
    t14 = (t5 + 4);
    t15 = (t17 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t17);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t14);
    t13 = *((unsigned int *)t15);
    t24 = (t12 ^ t13);
    t25 = (t11 | t24);
    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t15);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB41;

LAB38:    if (t28 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t19) = 1;

LAB41:    t18 = (t19 + 4);
    t31 = *((unsigned int *)t18);
    t32 = (~(t31));
    t33 = *((unsigned int *)t19);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB42;

LAB43:
LAB44:    goto LAB17;

LAB13:    xsi_set_current_line(105, ng0);

LAB54:    xsi_set_current_line(106, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 3952);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 9, t5, 9, t6, 9);
    t7 = (t0 + 5232);
    xsi_vlogvar_assign_value(t7, t17, 0, 0, 9);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 472);
    t7 = *((char **)t6);
    t6 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t7, 32, t6, 32);
    memset(t19, 0, 8);
    t14 = (t5 + 4);
    t15 = (t17 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t17);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t14);
    t13 = *((unsigned int *)t15);
    t24 = (t12 ^ t13);
    t25 = (t11 | t24);
    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t15);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB58;

LAB55:    if (t28 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t19) = 1;

LAB58:    t18 = (t19 + 4);
    t31 = *((unsigned int *)t18);
    t32 = (~(t31));
    t33 = *((unsigned int *)t19);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB59;

LAB60:
LAB61:    goto LAB17;

LAB19:    xsi_set_current_line(64, ng0);

LAB22:    xsi_set_current_line(65, ng0);
    t14 = ((char*)((ng2)));
    t15 = (t0 + 3952);
    xsi_vlogvar_assign_value(t15, t14, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB21;

LAB24:    xsi_set_current_line(73, ng0);

LAB27:    xsi_set_current_line(74, ng0);
    t5 = (t0 + 2912U);
    t6 = *((char **)t5);
    t5 = (t0 + 3632);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4912);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB26;

LAB31:    t16 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB32;

LAB33:    xsi_set_current_line(86, ng0);

LAB36:    xsi_set_current_line(87, ng0);
    t20 = ((char*)((ng1)));
    t23 = (t0 + 5232);
    xsi_vlogvar_assign_value(t23, t20, 0, 0, 9);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4912);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB35;

LAB40:    t16 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB41;

LAB42:    xsi_set_current_line(96, ng0);

LAB45:    xsi_set_current_line(97, ng0);
    t20 = ((char*)((ng1)));
    t23 = (t0 + 5232);
    xsi_vlogvar_assign_value(t23, t20, 0, 0, 9);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5712);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 3, t5, 3, t6, 3);
    t7 = (t0 + 5552);
    xsi_vlogvar_assign_value(t7, t17, 0, 0, 3);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 5712);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng6)));
    memset(t17, 0, 8);
    t7 = (t5 + 4);
    t14 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t14);
    t24 = (t12 ^ t13);
    t25 = (t11 | t24);
    t26 = *((unsigned int *)t7);
    t27 = *((unsigned int *)t14);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB49;

LAB46:    if (t28 != 0)
        goto LAB48;

LAB47:    *((unsigned int *)t17) = 1;

LAB49:    t16 = (t17 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t17);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB50;

LAB51:
LAB52:    goto LAB44;

LAB48:    t15 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB49;

LAB50:    xsi_set_current_line(99, ng0);

LAB53:    xsi_set_current_line(100, ng0);
    t18 = ((char*)((ng7)));
    t20 = (t0 + 4912);
    xsi_vlogvar_assign_value(t20, t18, 0, 0, 2);
    goto LAB52;

LAB57:    t16 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB58;

LAB59:    xsi_set_current_line(109, ng0);

LAB62:    xsi_set_current_line(110, ng0);
    t20 = (t0 + 6032);
    t23 = (t20 + 56U);
    t36 = *((char **)t23);
    t37 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 2, t36, 2, t37, 2);
    t38 = (t0 + 5872);
    xsi_vlogvar_assign_value(t38, t21, 0, 0, 2);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 6032);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 608);
    t7 = *((char **)t6);
    t6 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t7, 32, t6, 32);
    memset(t19, 0, 8);
    t14 = (t5 + 4);
    t15 = (t17 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t17);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t14);
    t13 = *((unsigned int *)t15);
    t24 = (t12 ^ t13);
    t25 = (t11 | t24);
    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t15);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB66;

LAB63:    if (t28 != 0)
        goto LAB65;

LAB64:    *((unsigned int *)t19) = 1;

LAB66:    t18 = (t19 + 4);
    t31 = *((unsigned int *)t18);
    t32 = (~(t31));
    t33 = *((unsigned int *)t19);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(113, ng0);

LAB71:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4912);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB69:    goto LAB61;

LAB65:    t16 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB66;

LAB67:    xsi_set_current_line(111, ng0);

LAB70:    xsi_set_current_line(112, ng0);
    t20 = ((char*)((ng1)));
    t23 = (t0 + 4912);
    xsi_vlogvar_assign_value(t23, t20, 0, 0, 2);
    goto LAB69;

}

static void Always_128_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 7688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 8056);
    *((int *)t2) = 1;
    t3 = (t0 + 7720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(128, ng0);

LAB5:    xsi_set_current_line(131, ng0);
    t4 = (t0 + 2432U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(136, ng0);

LAB10:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3792);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 4912);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5072);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5872);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6032);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 4272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4432);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB8:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4592);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4752);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 5232);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5392);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 5552);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5712);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 3952);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4112);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    xsi_set_current_line(131, ng0);

LAB9:    xsi_set_current_line(132, ng0);
    t11 = (t0 + 2912U);
    t12 = *((char **)t11);
    t11 = (t0 + 3792);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 32, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5072);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6032);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4432);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}


extern void work_m_05856272921324014942_1089879211_init()
{
	static char *pe[] = {(void *)Cont_46_0,(void *)Cont_47_1,(void *)Always_50_2,(void *)Always_128_3};
	xsi_register_didat("work_m_05856272921324014942_1089879211", "isim/serial_debug_tb_isim_beh.exe.sim/work/m_05856272921324014942_1089879211.didat");
	xsi_register_executes(pe);
}
