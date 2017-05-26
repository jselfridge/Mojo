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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/bin2bcd/bin2bcd_tb.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {256, 0};
static unsigned int ng3[] = {1U, 0U};



static void Initial_28_0(char *t0)
{
    char t15[8];
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
    char *t12;
    char *t13;
    char *t14;
    char *t16;

LAB0:    t1 = (t0 + 2496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);

LAB4:    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(31, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 4296);
    *((int *)t8) = t7;

LAB5:    t9 = (t0 + 4296);
    if (*((int *)t9) > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB9;

LAB1:    return;
LAB6:    xsi_set_current_line(31, ng0);
    t10 = (t0 + 2304);
    xsi_process_wait(t10, 10000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(31, ng0);
    t11 = (t0 + 1584);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 8, t13, 8, t14, 8);
    t16 = (t0 + 1584);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 8);
    t2 = (t0 + 4296);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB5;

LAB9:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(35, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_05891604372428063597_1753768730_init()
{
	static char *pe[] = {(void *)Initial_28_0};
	xsi_register_didat("work_m_05891604372428063597_1753768730", "isim/bin2bcd_tb_isim_beh.exe.sim/work/m_05891604372428063597_1753768730.didat");
	xsi_register_executes(pe);
}
