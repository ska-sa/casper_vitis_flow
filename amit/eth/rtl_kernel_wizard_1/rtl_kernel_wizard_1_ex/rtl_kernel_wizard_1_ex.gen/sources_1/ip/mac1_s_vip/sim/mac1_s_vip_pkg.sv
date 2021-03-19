


///////////////////////////////////////////////////////////////////////////
//NOTE: This file has been automatically generated by Vivado.
///////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps
package mac1_s_vip_pkg;
import axi4stream_vip_pkg::*;
///////////////////////////////////////////////////////////////////////////
// These parameters are named after the component for use in your verification 
// environment.
///////////////////////////////////////////////////////////////////////////
      parameter mac1_s_vip_VIP_INTERFACE_MODE     = 0;
      parameter mac1_s_vip_VIP_SIGNAL_SET         = 8'b00011011;
      parameter mac1_s_vip_VIP_DATA_WIDTH         = 512;
      parameter mac1_s_vip_VIP_ID_WIDTH           = 0;
      parameter mac1_s_vip_VIP_DEST_WIDTH         = 0;
      parameter mac1_s_vip_VIP_USER_WIDTH         = 0;
      parameter mac1_s_vip_VIP_USER_BITS_PER_BYTE = 0;
      parameter mac1_s_vip_VIP_HAS_TREADY         = 1;
      parameter mac1_s_vip_VIP_HAS_TSTRB          = 0;
      parameter mac1_s_vip_VIP_HAS_TKEEP          = 1;
      parameter mac1_s_vip_VIP_HAS_TLAST          = 1;
      parameter mac1_s_vip_VIP_HAS_ACLKEN         = 0;
      parameter mac1_s_vip_VIP_HAS_ARESETN        = 1;
///////////////////////////////////////////////////////////////////////////
typedef axi4stream_mst_agent #(mac1_s_vip_VIP_SIGNAL_SET, 
                        mac1_s_vip_VIP_DEST_WIDTH,
                        mac1_s_vip_VIP_DATA_WIDTH,
                        mac1_s_vip_VIP_ID_WIDTH,
                        mac1_s_vip_VIP_USER_WIDTH, 
                        mac1_s_vip_VIP_USER_BITS_PER_BYTE,
                        mac1_s_vip_VIP_HAS_ARESETN) mac1_s_vip_mst_t;
      
///////////////////////////////////////////////////////////////////////////
// How to start the verification component
///////////////////////////////////////////////////////////////////////////
//      mac1_s_vip_mst_t  mac1_s_vip_mst;
//      initial begin : START_mac1_s_vip_MASTER
//        mac1_s_vip_mst = new("mac1_s_vip_mst", `mac1_s_vip_PATH_TO_INTERFACE);
//        mac1_s_vip_mst.start_master();
//      end



endpackage : mac1_s_vip_pkg
