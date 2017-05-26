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
static const char *ng0 = "/home/justin/Documents/FPGA/Sandbox/bcd2ascii/bcd2ascii_tb.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {4U, 0U};
static unsigned int ng4[] = {7U, 0U};
static unsigned int ng5[] = {9U, 0U};
static unsigned int ng6[] = {32U, 0U};
static unsigned int ng7[] = {33U, 0U};
static unsigned int ng8[] = {36U, 0U};
static unsigned int ng9[] = {39U, 0U};
static unsigned int ng10[] = {41U, 0U};
static unsigned int ng11[] = {144U, 0U};
static unsigned int ng12[] = {145U, 0U};
static unsigned int ng13[] = {148U, 0U};
static unsigned int ng14[] = {151U, 0U};
static unsigned int ng15[] = {153U, 0U};
static unsigned int ng16[] = {768U, 0U};
static unsigned int ng17[] = {769U, 0U};
static unsigned int ng18[] = {772U, 0U};
static unsigned int ng19[] = {775U, 0U};
static unsigned int ng20[] = {777U, 0U};
static unsigned int ng21[] = {2304U, 0U};
static unsigned int ng22[] = {2305U, 0U};
static unsigned int ng23[] = {2308U, 0U};
static unsigned int ng24[] = {2311U, 0U};
static unsigned int ng25[] = {2313U, 0U};
static unsigned int ng26[] = {1616U, 0U};
static unsigned int ng27[] = {1617U, 0U};
static unsigned int ng28[] = {1620U, 0U};
static unsigned int ng29[] = {1623U, 0U};
static unsigned int ng30[] = {1625U, 0U};



static void Initial_28_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 2496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);

LAB4:    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(31, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(31, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(38, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB20:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB22:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB24:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB25:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng22)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB26:    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng23)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng24)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB28:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng25)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB29:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng26)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB30:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng27)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB31:    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng28)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB32;
    goto LAB1;

LAB32:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng29)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB33:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng30)));
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2304);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB34;
    goto LAB1;

LAB34:    xsi_set_current_line(66, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_15027912198050516444_3258739880_init()
{
	static char *pe[] = {(void *)Initial_28_0};
	xsi_register_didat("work_m_15027912198050516444_3258739880", "isim/bcd2ascii_tb_isim_beh.exe.sim/work/m_15027912198050516444_3258739880.didat");
	xsi_register_executes(pe);
}
