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
static const char *ng0 = "/home/justin/Documents/FPGA/Util/conversions/bcd2ascii/bcd2ascii.v";
static int ng1[] = {0, 0};
static int ng2[] = {8, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {1, 0};
static int ng5[] = {4, 0};
static int ng6[] = {3, 0};
static unsigned int ng7[] = {48U, 0U};
static int ng8[] = {7, 0};



static void Always_19_0(char *t0)
{
    char t8[8];
    char t9[8];
    char t17[8];
    char t27[8];
    char t28[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    int t26;
    char *t30;
    char *t31;
    int t32;
    int t33;
    int t34;
    int t35;
    int t36;
    int t37;
    int t38;

LAB0:    t1 = (t0 + 2816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 3136);
    *((int *)t2) = 1;
    t3 = (t0 + 2848);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(19, ng0);

LAB5:    xsi_set_current_line(21, ng0);
    xsi_set_current_line(21, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1904);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB6:    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    t6 = (t0 + 472);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    xsi_vlog_signed_multiply(t8, 32, t5, 32, t7, 32);
    memset(t9, 0, 8);
    xsi_vlog_signed_less(t9, 32, t4, 32, t8, 32);
    t6 = (t9 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(23, ng0);
    xsi_set_current_line(23, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB11:    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 472);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    xsi_vlog_signed_less(t8, 32, t4, 32, t6, 32);
    t5 = (t8 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB12;

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(21, ng0);
    t15 = ((char*)((ng3)));
    t16 = (t0 + 1584);
    t18 = (t0 + 1584);
    t19 = (t18 + 72U);
    t20 = *((char **)t19);
    t21 = (t0 + 1904);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    xsi_vlog_generic_convert_bit_index(t17, t20, 2, t23, 32, 1);
    t24 = (t17 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (!(t25));
    if (t26 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    xsi_vlog_signed_add(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 1904);
    xsi_vlogvar_assign_value(t6, t8, 0, 0, 32);
    goto LAB6;

LAB9:    xsi_vlogvar_assign_value(t16, t15, 0, *((unsigned int *)t17), 1);
    goto LAB10;

LAB12:    xsi_set_current_line(23, ng0);

LAB14:    xsi_set_current_line(25, ng0);
    t7 = (t0 + 1184U);
    t15 = *((char **)t7);
    t7 = (t0 + 1144U);
    t16 = (t7 + 72U);
    t18 = *((char **)t16);
    t19 = ((char*)((ng5)));
    t20 = (t0 + 1904);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t28, 0, 8);
    xsi_vlog_signed_multiply(t28, 32, t19, 32, t22, 32);
    t23 = ((char*)((ng6)));
    memset(t29, 0, 8);
    xsi_vlog_signed_add(t29, 32, t28, 32, t23, 32);
    t24 = ((char*)((ng5)));
    xsi_vlog_get_indexed_partselect(t27, 4, t15, ((int*)(t18)), 2, t29, 32, 1, t24, 32, 1, 0);
    xsi_vlogtype_concat(t17, 4, 4, 1U, t27, 4);
    t30 = ((char*)((ng3)));
    xsi_vlogtype_concat(t9, 8, 8, 2U, t30, 4, t17, 4);
    t31 = (t0 + 1744);
    xsi_vlogvar_assign_value(t31, t9, 0, 0, 8);
    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 8, t4, 8, t5, 8);
    t6 = (t0 + 1584);
    t7 = (t0 + 1584);
    t15 = (t7 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng2)));
    t19 = (t0 + 1904);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t28, 0, 8);
    xsi_vlog_signed_multiply(t28, 32, t18, 32, t21, 32);
    t22 = ((char*)((ng8)));
    memset(t29, 0, 8);
    xsi_vlog_signed_add(t29, 32, t28, 32, t22, 32);
    t23 = ((char*)((ng2)));
    xsi_vlog_convert_indexed_partindices(t9, t17, t27, ((int*)(t16)), 2, t29, 32, 1, t23, 32, 1, 0);
    t24 = (t9 + 4);
    t10 = *((unsigned int *)t24);
    t26 = (!(t10));
    t30 = (t17 + 4);
    t11 = *((unsigned int *)t30);
    t32 = (!(t11));
    t33 = (t26 && t32);
    t31 = (t27 + 4);
    t12 = *((unsigned int *)t31);
    t34 = (!(t12));
    t35 = (t33 && t34);
    if (t35 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    xsi_vlog_signed_add(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 1904);
    xsi_vlogvar_assign_value(t6, t8, 0, 0, 32);
    goto LAB11;

LAB15:    t13 = *((unsigned int *)t27);
    t36 = (t13 + 0);
    t14 = *((unsigned int *)t9);
    t25 = *((unsigned int *)t17);
    t37 = (t14 - t25);
    t38 = (t37 + 1);
    xsi_vlogvar_assign_value(t6, t8, t36, *((unsigned int *)t17), t38);
    goto LAB16;

}


extern void work_m_11897102449297144393_2701220757_init()
{
	static char *pe[] = {(void *)Always_19_0};
	xsi_register_didat("work_m_11897102449297144393_2701220757", "isim/bcd2ascii_tb_isim_beh.exe.sim/work/m_11897102449297144393_2701220757.didat");
	xsi_register_executes(pe);
}
