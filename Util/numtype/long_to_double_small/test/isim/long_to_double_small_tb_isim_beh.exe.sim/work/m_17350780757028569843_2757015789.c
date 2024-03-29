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
static const char *ng0 = "/home/jselfridge/Documents/FPGA/Util/numtype/long_to_double_small/long_to_double_small_tb.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U, 2147483648U, 0U};
static unsigned int ng4[] = {0U, 0U, 3221225472U, 0U};
static unsigned int ng5[] = {0U, 0U, 4026531840U, 0U};
static unsigned int ng6[] = {0U, 0U, 4294963200U, 0U};
static unsigned int ng7[] = {4026531840U, 0U, 4294967295U, 0U};
static unsigned int ng8[] = {4294967280U, 0U, 4294967295U, 0U};
static unsigned int ng9[] = {4294967294U, 0U, 4294967295U, 0U};
static unsigned int ng10[] = {4294967295U, 0U, 4294967295U, 0U};
static unsigned int ng11[] = {0U, 0U, 0U, 0U};
static unsigned int ng12[] = {1U, 0U, 0U, 0U};
static unsigned int ng13[] = {15U, 0U, 0U, 0U};
static unsigned int ng14[] = {5242880U, 0U, 0U, 0U};
static unsigned int ng15[] = {0U, 0U, 11U, 0U};
static unsigned int ng16[] = {0U, 0U, 9437184U, 0U};
static unsigned int ng17[] = {0U, 0U, 268435456U, 0U};
static unsigned int ng18[] = {0U, 0U, 1073741824U, 0U};
static unsigned int ng19[] = {0U, 0U, 2130706432U, 0U};
static unsigned int ng20[] = {4294967295U, 0U, 2147483647U, 0U};



static void Initial_35_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);

LAB4:    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3128);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1768);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t7) == 0)
        goto LAB7;

LAB9:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t4 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t4) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB12;

LAB11:    t22 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t4, 0, 0, 1);
    goto LAB5;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB12:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t4) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB11;

LAB13:    goto LAB1;

}

static void Initial_41_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 3568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);

LAB4:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3376);
    xsi_process_wait(t2, 50000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(45, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB1;

}

static void Initial_49_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 3816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);

LAB4:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 3624);
    xsi_process_wait(t2, 60000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(50, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}

static void Initial_54_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 4064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);

LAB4:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(57, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(58, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(59, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(60, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(61, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(63, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(66, ng0);
    t3 = ((char*)((ng12)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(67, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(68, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(70, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(71, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB20:    xsi_set_current_line(72, ng0);
    t3 = ((char*)((ng18)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, 3000000LL);
    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB22:    xsi_set_current_line(74, ng0);
    t3 = ((char*)((ng20)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 64);
    goto LAB1;

}


extern void work_m_17350780757028569843_2757015789_init()
{
	static char *pe[] = {(void *)Initial_35_0,(void *)Initial_41_1,(void *)Initial_49_2,(void *)Initial_54_3};
	xsi_register_didat("work_m_17350780757028569843_2757015789", "isim/long_to_double_small_tb_isim_beh.exe.sim/work/m_17350780757028569843_2757015789.didat");
	xsi_register_executes(pe);
}
