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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/sawtooth/sawtooth.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};



static void Always_19_0(char *t0)
{
    char t8[8];
    char t21[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;

LAB0:    t1 = (t0 + 2976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 3544);
    *((int *)t2) = 1;
    t3 = (t0 + 3008);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(19, ng0);

LAB5:    xsi_set_current_line(21, ng0);
    t4 = (t0 + 2064);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 20, t6, 20, t7, 20);
    t9 = (t0 + 1904);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 20);
    xsi_set_current_line(23, ng0);
    t2 = (t0 + 2064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 19);
    t12 = (t11 & 1);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 19);
    t15 = (t14 & 1);
    *((unsigned int *)t5) = t15;
    t7 = (t8 + 4);
    t16 = *((unsigned int *)t7);
    t17 = (~(t16));
    t18 = *((unsigned int *)t8);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 2064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 11);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 11);
    *((unsigned int *)t5) = t13;
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 255U);
    t15 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t15 & 255U);
    t7 = (t0 + 1744);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 8);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(24, ng0);
    t9 = (t0 + 2064);
    t23 = (t9 + 56U);
    t24 = *((char **)t23);
    memset(t22, 0, 8);
    t25 = (t22 + 4);
    t26 = (t24 + 4);
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 11);
    *((unsigned int *)t22) = t28;
    t29 = *((unsigned int *)t26);
    t30 = (t29 >> 11);
    *((unsigned int *)t25) = t30;
    t31 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t31 & 255U);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t32 & 255U);
    memset(t21, 0, 8);
    t33 = (t21 + 4);
    t34 = (t22 + 4);
    t35 = *((unsigned int *)t22);
    t36 = (~(t35));
    *((unsigned int *)t21) = t36;
    *((unsigned int *)t33) = 0;
    if (*((unsigned int *)t34) != 0)
        goto LAB10;

LAB9:    t41 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t41 & 255U);
    t42 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t42 & 255U);
    t43 = (t0 + 1744);
    xsi_vlogvar_assign_value(t43, t21, 0, 0, 8);
    goto LAB8;

LAB10:    t37 = *((unsigned int *)t21);
    t38 = *((unsigned int *)t34);
    *((unsigned int *)t21) = (t37 | t38);
    t39 = *((unsigned int *)t33);
    t40 = *((unsigned int *)t34);
    *((unsigned int *)t33) = (t39 | t40);
    goto LAB9;

}

static void Always_30_1(char *t0)
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

LAB0:    t1 = (t0 + 3224U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3560);
    *((int *)t2) = 1;
    t3 = (t0 + 3256);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(32, ng0);
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

LAB7:    xsi_set_current_line(34, ng0);

LAB10:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 20, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(32, ng0);

LAB9:    xsi_set_current_line(33, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 20, 0LL);
    goto LAB8;

}


extern void work_m_12280335124652821582_0912562996_init()
{
	static char *pe[] = {(void *)Always_19_0,(void *)Always_30_1};
	xsi_register_didat("work_m_12280335124652821582_0912562996", "isim/sawtooth_tb_isim_beh.exe.sim/work/m_12280335124652821582_0912562996.didat");
	xsi_register_executes(pe);
}
