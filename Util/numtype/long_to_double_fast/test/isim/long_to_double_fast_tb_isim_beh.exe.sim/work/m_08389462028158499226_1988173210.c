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
static const char *ng0 = "/home/jselfridge/Documents/FPGA/Util/numtype/long_to_double_fast/long_to_double_fast.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_17_0(char *t0)
{
    char t6[8];
    char t7[8];
    char t27[16];
    char t34[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    int t17;
    char *t18;
    unsigned int t19;
    int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    int t24;
    int t25;
    unsigned int t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 3680);
    *((int *)t2) = 1;
    t3 = (t0 + 3144);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(17, ng0);

LAB5:    xsi_set_current_line(18, ng0);
    t4 = (t0 + 1480U);
    t5 = *((char **)t4);
    t4 = (t0 + 2200);
    t8 = (t0 + 2200);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 2200);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng1)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t10, t13, 2, 1, t14, 32, 1);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t7 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (!(t19));
    t21 = (t17 && t20);
    if (t21 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(19, ng0);
    xsi_set_current_line(19, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2040);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB8:    t2 = (t0 + 2040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 608);
    t8 = *((char **)t5);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t8, 32);
    t5 = (t6 + 4);
    t16 = *((unsigned int *)t5);
    t19 = (~(t16));
    t22 = *((unsigned int *)t6);
    t23 = (t22 & t19);
    t26 = (t23 != 0);
    if (t26 > 0)
        goto LAB9;

LAB10:    goto LAB2;

LAB6:    t22 = *((unsigned int *)t6);
    t23 = *((unsigned int *)t7);
    t24 = (t22 - t23);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t7), t25, 0LL);
    goto LAB7;

LAB9:    xsi_set_current_line(19, ng0);

LAB11:    xsi_set_current_line(20, ng0);
    t9 = (t0 + 2200);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t0 + 2200);
    t13 = (t12 + 72U);
    t14 = *((char **)t13);
    t15 = (t0 + 2200);
    t18 = (t15 + 64U);
    t28 = *((char **)t18);
    t29 = (t0 + 2040);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = ((char*)((ng2)));
    memset(t7, 0, 8);
    xsi_vlog_signed_minus(t7, 32, t31, 32, t32, 32);
    xsi_vlog_generic_get_array_select_value(t27, 64, t11, t14, t28, 2, 1, t7, 32, 1);
    t33 = (t0 + 2200);
    t36 = (t0 + 2200);
    t37 = (t36 + 72U);
    t38 = *((char **)t37);
    t39 = (t0 + 2200);
    t40 = (t39 + 64U);
    t41 = *((char **)t40);
    t42 = (t0 + 2040);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    xsi_vlog_generic_convert_array_indices(t34, t35, t38, t41, 2, 1, t44, 32, 1);
    t45 = (t34 + 4);
    t46 = *((unsigned int *)t45);
    t17 = (!(t46));
    t47 = (t35 + 4);
    t48 = *((unsigned int *)t47);
    t20 = (!(t48));
    t21 = (t17 && t20);
    if (t21 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 2040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t8 = (t0 + 2040);
    xsi_vlogvar_assign_value(t8, t6, 0, 0, 32);
    goto LAB8;

LAB12:    t49 = *((unsigned int *)t34);
    t50 = *((unsigned int *)t35);
    t24 = (t49 - t50);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t33, t27, 0, *((unsigned int *)t35), t25, 0LL);
    goto LAB13;

}

static void Cont_23_1(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 3360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 2200);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2200);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2200);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t5, 64, t4, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t0 + 3776);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_bit_copy(t17, 0, t5, 0, 64);
    xsi_driver_vfirst_trans(t13, 0, 63);
    t18 = (t0 + 3696);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_08389462028158499226_1988173210_init()
{
	static char *pe[] = {(void *)Always_17_0,(void *)Cont_23_1};
	xsi_register_didat("work_m_08389462028158499226_1988173210", "isim/long_to_double_fast_tb_isim_beh.exe.sim/work/m_08389462028158499226_1988173210.didat");
	xsi_register_executes(pe);
}
