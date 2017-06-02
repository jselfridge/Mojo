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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    simprims_ver_m_06621322055533463077_1080494567_init();
    simprims_ver_m_06621322055533463077_0818475687_init();
    simprims_ver_u_13519506037983333588_2366604397_init();
    simprims_ver_m_08244894845248834502_0076253249_init();
    simprims_ver_u_13644963114211519797_1323274903_init();
    simprims_ver_m_09053309457855292502_0897309690_init();
    simprims_ver_m_14027964860692184265_3118641787_init();
    simprims_ver_u_09260761047239827718_3351940313_init();
    simprims_ver_m_03252886117992735132_1529224445_init();
    simprims_ver_m_03252886117992735132_3740946984_init();
    simprims_ver_m_00358400182994406296_2021654676_init();
    simprims_ver_m_00358400182994406296_3226743947_init();
    simprims_ver_m_02253721222203995675_2662658903_init();
    simprims_ver_m_12318166303807365835_3151998091_init();
    simprims_ver_m_00358400182994406296_1349438147_init();
    simprims_ver_m_04567189716726560339_1692233196_init();
    work_m_14170504021899430827_4001009457_init();
    work_m_11675242216084833247_1066344677_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_11675242216084833247_1066344677");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
