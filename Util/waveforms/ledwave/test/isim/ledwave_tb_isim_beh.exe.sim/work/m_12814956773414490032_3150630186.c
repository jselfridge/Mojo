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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/ledwave/ledwave.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {8, 0};
static unsigned int ng4[] = {64U, 0U};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {0U, 0U};



static void Always_24_0(char *t0)
{
    char t8[8];
    char t16[8];
    char t32[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    int t50;

LAB0:    t1 = (t0 + 3456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 4024);
    *((int *)t2) = 1;
    t3 = (t0 + 3488);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(24, ng0);

LAB5:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 2064);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 12, t6, 12, t7, 12);
    t9 = (t0 + 1904);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 12);
    xsi_set_current_line(30, ng0);
    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2224);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB6:    t2 = (t0 + 2224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB8;

LAB7:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB8;

LAB11:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB9;

LAB10:    t10 = (t8 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t8);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB12;

LAB13:    goto LAB2;

LAB8:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB10;

LAB9:    *((unsigned int *)t8) = 1;
    goto LAB10;

LAB12:    xsi_set_current_line(30, ng0);

LAB14:    xsi_set_current_line(33, ng0);
    t17 = (t0 + 2064);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t16, 0, 8);
    t20 = (t16 + 4);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 3);
    *((unsigned int *)t16) = t23;
    t24 = *((unsigned int *)t21);
    t25 = (t24 >> 3);
    *((unsigned int *)t20) = t25;
    t26 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t26 & 511U);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t27 & 511U);
    t28 = (t0 + 2224);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng4)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_multiply(t32, 9, t30, 4, t31, 9);
    memset(t33, 0, 8);
    xsi_vlog_unsigned_add(t33, 9, t16, 9, t32, 9);
    t34 = (t0 + 2544);
    xsi_vlogvar_assign_value(t34, t33, 0, 0, 9);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 8);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 8);
    t22 = (t15 & 1);
    *((unsigned int *)t5) = t22;
    t7 = (t8 + 4);
    t23 = *((unsigned int *)t7);
    t24 = (~(t23));
    t25 = *((unsigned int *)t8);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 0);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 255U);
    t22 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t22 & 255U);
    t7 = (t0 + 2384);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 8);

LAB17:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2064);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 0);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 255U);
    t22 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t22 & 255U);
    memset(t16, 0, 8);
    t17 = (t4 + 4);
    if (*((unsigned int *)t17) != 0)
        goto LAB21;

LAB20:    t18 = (t8 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB21;

LAB24:    if (*((unsigned int *)t4) > *((unsigned int *)t8))
        goto LAB22;

LAB23:    t20 = (t0 + 1744);
    t21 = (t0 + 1744);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t30 = (t0 + 2224);
    t31 = (t30 + 56U);
    t34 = *((char **)t31);
    xsi_vlog_generic_convert_bit_index(t32, t29, 2, t34, 4, 2);
    t49 = (t32 + 4);
    t23 = *((unsigned int *)t49);
    t50 = (!(t23));
    if (t50 == 1)
        goto LAB25;

LAB26:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 4, t5, 32);
    t6 = (t0 + 2224);
    xsi_vlogvar_assign_value(t6, t8, 0, 0, 4);
    goto LAB6;

LAB15:    xsi_set_current_line(37, ng0);
    t9 = (t0 + 2544);
    t10 = (t9 + 56U);
    t17 = *((char **)t10);
    memset(t32, 0, 8);
    t18 = (t32 + 4);
    t19 = (t17 + 4);
    t35 = *((unsigned int *)t17);
    t36 = (t35 >> 0);
    *((unsigned int *)t32) = t36;
    t37 = *((unsigned int *)t19);
    t38 = (t37 >> 0);
    *((unsigned int *)t18) = t38;
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t39 & 255U);
    t40 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t40 & 255U);
    memset(t16, 0, 8);
    t20 = (t16 + 4);
    t21 = (t32 + 4);
    t41 = *((unsigned int *)t32);
    t42 = (~(t41));
    *((unsigned int *)t16) = t42;
    *((unsigned int *)t20) = 0;
    if (*((unsigned int *)t21) != 0)
        goto LAB19;

LAB18:    t47 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t47 & 255U);
    t48 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t48 & 255U);
    t28 = (t0 + 2384);
    xsi_vlogvar_assign_value(t28, t16, 0, 0, 8);
    goto LAB17;

LAB19:    t43 = *((unsigned int *)t16);
    t44 = *((unsigned int *)t21);
    *((unsigned int *)t16) = (t43 | t44);
    t45 = *((unsigned int *)t20);
    t46 = *((unsigned int *)t21);
    *((unsigned int *)t20) = (t45 | t46);
    goto LAB18;

LAB21:    t19 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB23;

LAB22:    *((unsigned int *)t16) = 1;
    goto LAB23;

LAB25:    xsi_vlogvar_assign_value(t20, t16, 0, *((unsigned int *)t32), 1);
    goto LAB26;

}

static void Always_49_1(char *t0)
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

LAB0:    t1 = (t0 + 3704U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 4040);
    *((int *)t2) = 1;
    t3 = (t0 + 3736);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(49, ng0);

LAB5:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 1344U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(53, ng0);

LAB10:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 12, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(51, ng0);

LAB9:    xsi_set_current_line(52, ng0);
    t11 = ((char*)((ng6)));
    t12 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 12, 0LL);
    goto LAB8;

}


extern void work_m_12814956773414490032_3150630186_init()
{
	static char *pe[] = {(void *)Always_24_0,(void *)Always_49_1};
	xsi_register_didat("work_m_12814956773414490032_3150630186", "isim/ledwave_tb_isim_beh.exe.sim/work/m_12814956773414490032_3150630186.didat");
	xsi_register_executes(pe);
}
