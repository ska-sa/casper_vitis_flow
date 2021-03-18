-- dsp_buf.vhd  13. August 2018 by cc

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.DSP_COMPONENTS.ALL;

ENTITY dsp_buf IS
PORT ( 
  clk                           : IN STD_LOGIC;
  rst                           : IN STD_LOGIC;
  
  port1_clk                     : IN STD_LOGIC;
  port1_data_in                 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  port1_data_in_wr              : IN STD_LOGIC;
  port1_addr                    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  port1_data_out                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

  port2_data_in                 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  port2_data_in_wr              : IN STD_LOGIC;
  port2_addr                    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  port2_data_out                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

  data_size                     : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
  mode_edd                      : OUT STD_LOGIC_VECTOR( 1 DOWNTO 0);

  -- signal processing
  flip_signal_spec              : OUT STD_LOGIC;
  mode_wave_data_gen            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  ampl_wave_data_gen            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  pre_decimation_fac            : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  deskew_val                    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

  mcast_size                    : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
  heap_size                     : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

  status_in                     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

  use_1pps                      : OUT STD_LOGIC;
  data_enable1                  : OUT STD_LOGIC;
  data_enable2                  : OUT STD_LOGIC;
  sync_request                  : OUT STD_LOGIC;
  filter_select                 : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
  sync_timestamp                : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  test_value                    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

  time_at_1pps                  : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  eddy_status                   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

  --
  
  clr_err                       : OUT STD_LOGIC;

  -- IF0
  IF0_enable                    : OUT STD_LOGIC;
  IF0_arpbeat_enable            : OUT STD_LOGIC;
  IF0_status                    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

  IF0_dst_sel                   : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);

  IF0_dst_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
  IF0_dst_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  IF0_dst_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  IF0_src_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

  IF0_src_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
  IF0_src_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

  -- message send
  IF0_word_from_buf             : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
  IF0_msg_first_addr            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  IF0_msg_last_addr             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  IF0_msg_send_trig             : OUT STD_LOGIC;
  IF0_dhcpdiscover_trig         : OUT STD_LOGIC;
  IF0_arp_req_trig              : OUT STD_LOGIC;

  -- SPEAD item pointers
  IF0_item_pointer_01           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_02           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_03           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_04           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_05           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_06           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_07           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_08           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

  IF0_item_pointer_09           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_10           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF0_item_pointer_11           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

  -- IF1
  IF1_enable                    : OUT STD_LOGIC;
  IF1_arpbeat_enable            : OUT STD_LOGIC;
  IF1_status                    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

  IF1_dst_sel                   : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);

  IF1_dst_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
  IF1_dst_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  IF1_src_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
  IF1_src_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  IF1_dst_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  IF1_src_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

  -- message send
  IF1_word_from_buf             : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
  IF1_msg_first_addr            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  IF1_msg_last_addr             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  IF1_msg_send_trig             : OUT STD_LOGIC;
  IF1_dhcpdiscover_trig         : OUT STD_LOGIC;
  IF1_arp_req_trig              : OUT STD_LOGIC;

  -- SPEAD item pointers
  IF1_item_pointer_01           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_02           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_03           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_04           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_05           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_06           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_07           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_08           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

  IF1_item_pointer_09           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_10           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  IF1_item_pointer_11           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END dsp_buf;



ARCHITECTURE arch OF dsp_buf IS

  CONSTANT words                        : INTEGER RANGE 0 TO 65000:=16;
  --CONSTANT words                      : INTEGER RANGE 0 TO 65000:=20;

  SIGNAL IF0_dst_sel_l                  : STD_LOGIC_VECTOR(1 DOWNTO 0);

  SIGNAL data_in_valid_l                : STD_LOGIC;
  SIGNAL data_in_valid_l2               : STD_LOGIC;

  SIGNAL port1_data_out_int             : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL port1_data_in_sync             : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL port1_addr_sync                : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL port1_data_in_wr_sync          : STD_LOGIC;
  SIGNAL port1_data_in_wr_sync_l        : STD_LOGIC;

  SIGNAL count                          : INTEGER := 0;
  SIGNAL do_count                       : STD_LOGIC;
  SIGNAL timeout                        : STD_LOGIC;

  SIGNAL command                        : STD_LOGIC_VECTOR(7 DOWNTO 0);

  SIGNAL port1_buf_idx_rd               : INTEGER := 0;
  SIGNAL port1_buf_idx_wr               : INTEGER := 0;
  SIGNAL port2_buf_idx                  : INTEGER := 0;
  SIGNAL cc_fifo_rd_en                  : STD_LOGIC;
  SIGNAL cc_fifo_empty                  : STD_LOGIC;
  SIGNAL cc_fifo_dout                   : STD_LOGIC_VECTOR(48 DOWNTO 0);

  SIGNAL IF0_my_IP_sel                  : STD_LOGIC;
  SIGNAL IF1_my_IP_sel                  : STD_LOGIC;


  SIGNAL status_in_sync                 : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL time_at_1pps_sync              : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL eddy_status_sync               : STD_LOGIC_VECTOR(31 DOWNTO 0);


  TYPE ram IS ARRAY (0 TO words-1) OF STD_LOGIC_VECTOR(511 DOWNTO 0);

  TYPE statetype IS (
    A0, A1, A2, A3, A4, A5, A6, B0, B1, B2, B3, C0, C1, C2, C3, D0, D1, E0, E1, E2, E3
    );

  SIGNAL state          : statetype;


  -------------------------------------------------------------------------------
  -- REGISTER MAP
  -------------------------------------------------------------------------------

  -- BASE: 0x0500

  --------------------------------------------------
  -- CONTROLLING
  --------------------------------------------------
  -- REG  0x0500:
  --              31 ... 24    data size
  --              23 ... 20    filter select
  --                     19    use 1PPS: 1=use 0=not
  --                     18    data enable 1
  --                     17    data enable 2
  --                     16    sync request
  --              15 ...  3    --
  --                      3    flip signal spectrum, 1=flip 0=don't flip
  --                      2    clear error
  --               1 ...  0    mode edd 00=8bit 01=unused 10=10bit 11=12bit
  
  -- REG  0x0501: 31 ...  0    sync_timestamp MSW
  -- REG  0x0502: 31 ...  0    sync_timestamp LSW

  --------------------------------------------------
  -- IF0
  --------------------------------------------------
  -- REG  0x0503:
  --              31 ... 24    --
  --              23 ... 16    msg first address
  --              15 ...  8    msg last address
  --                      7    --
  --                      6    --
  --                      5    arp request trigger
  --                      4    arpbeat enable
  --                      3    message send trigger
  --                      2    DHCP discover trigger
  --                      1    my IP address select: 0=DHCP 1=STATIC
  --                      0    1=enable 0=not enable
  --------------------------------------------------
  -- IF1
  --------------------------------------------------
  -- REG  0x0504:
  --              31 ... 24    --
  --              23 ... 16    msg first address
  --              15 ...  8    msg last address
  --                      7    --
  --                      6    --
  --                      5    arp request trigger
  --                      4    arpbeat enable
  --                      3    message send trigger
  --                      2    DHCP discover trigger
  --                      1    my IP address select: 0=DHCP 1=STATIC
  --                      0    1=enable 0=not enable

  --------------------------------------------------
  -- STATUS IF0
  --------------------------------------------------
  -- REG  0x0505:       
  --                      2    tx overflow
  --                      1    stat rx aligned
  --                      0    gt power good

  --------------------------------------------------
  -- STATUS IF1
  --------------------------------------------------
  -- REG  0x0506:       
  --                      2    tx overflow
  --                      1    stat rx aligned
  --                      0    gt power good
  
  --------------------------------------------------
  -- REG  0x0507: OBSOLETE!!!
  -- STATUS
  --              31 ... 16    --
  --                     15    IF1 start packet ERROR
  --                     14    IF1 fifo error
  --                     13    IF0 start packet ERROR
  --                     12    IF0 fifo ERROR
  --              11 ...  8    --
  --               7 ...  4    IF1 am lock
  --               3 ...  0    IF0 am lock

  --------------------------------------------------

  -- REG  0x0508:      test value signal processing
  -- REG  0x0509:      time at 1PPS MSW
  -- REG  0x050A:      time at 1PPS LSW
  -- REG  0x050B:      signal processing status
  
  --------------------------------------------------
  -- REG  0x050C:
  --              31 ... 28    mode wave data gen channel 2
  --              27 ... 24    mode wave data gen channel 1
  --              23 ... 20    ampl wave data gen channel 2
  --              19 ... 16    ampl wave data gen channel 1
  --              15 ... 12    --
  --              11 ...  8    pre decimation factor
  --               7 ...  4    deskew value channel 2 (-8 ... +7)
  --               3 ...  0    deskew value channel 1 (-8 ... +7)
  
  --------------------------------------------------
  -- CHARACTERISATION ?????
  --------------------------------------------------
  -- REG  0x050D:
  --             31 ...  8     --
  --              7 ...  4     decimation factor
  --              3 ...  0     operating mode 0=reserved 1=MKT 2=EDD 3=NRT

  --------------------------------------------------

  -- REG  0x050E:
  --             31 ...  24    mcast size
  --             23 ...   0    --

  -- REG  0x050F:      --
  
  -----------------------------------------------------------------------------
  -- IF0 and IF1 configuration
  -----------------------------------------------------------------------------
  ---------
  -- IF0 --
  ---------
  -- REG  0x0510:      src IP static configuration
  -- REG  0x0511:      src IP DHCP
  -- REG  0x0512:      destination 1 IP address
  -- REG  0x0513:      destination 2 IP address
  -- REG  0x0514:      destination 3 IP address
  -- REG  0x0515:      destination 4 IP address

  -- REG  0x0516:      destination 1 MAC address MSW -> (15 ... 0)
  -- REG  0x0517:      destination 1 MAC address

  -- REG  0x0518:      destination 2 MAC address MSW -> (15 ... 0)
  -- REG  0x0519:      destination 2 MAC address

  -- REG  0x051A:      destination 3 MAC address MSW -> (15 ... 0)
  -- REG  0x051B:      destination 3 MAC address

  -- REG  0x051C:      destination 4 MAC address MSW -> (15 ... 0)
  -- REG  0x051D:      destination 4 MAC address


  -- REG  0x051E:      31 ... 16 destination port 1 | 15 ... 0 src port 1
  -- REG  0x051F:      31 ... 16 destination port 2 | 15 ... 0 src port 2
  -- REG  0x0520:      31 ... 16 destination port 3 | 15 ... 0 src port 3
  -- REG  0x0521:      31 ... 16 destination port 4 | 15 ... 0 src port 4

  -- REG  0x0522       --
  -- REG  0x0523       --
  -- REG  0x0524       DHCP server IP
  -- REG  0x0525       lease time
  
  -- REG  0x0526:      src MAC address MSW (15 ... 0)
  -- REG  0x0527:      src MAC address

  
  ---------
  -- IF1 --
  ---------
  -- REG  0x0528:      src IP static configuration
  -- REG  0x0529:      src IP DHCP
  -- REG  0x052A:      destination 1 IP address
  -- REG  0x052B:      destination 2 IP address
  -- REG  0x052C:      destination 3 IP address
  -- REG  0x052D:      destination 4 IP address
  
  -- REG  0x052E:      destination 1 MAC address MSW -> (15 ... 0)
  -- REG  0x052F:      destination 1 MAC address
  
  -- REG  0x0530:      destination 2 MAC address MSW -> (15 ... 0)
  -- REG  0x0531:      destination 2 MAC address
  
  -- REG  0x0532:      destination 3 MAC address MSW -> (15 ... 0)
  -- REG  0x0533:      destination 3 MAC address
  
  -- REG  0x0534:      destination 4 MAC address MSW -> (15 ... 0)
  -- REG  0x0535:      destination 4 MAC address
  
  -- REG  0x0536:      31 ... 16 destination port 1 | 15 ... 0 src port 1
  -- REG  0x0537:      31 ... 16 destination port 2 | 15 ... 0 src port 2
  -- REG  0x0538:      31 ... 16 destination port 3 | 15 ... 0 src port 3
  -- REG  0x0539:      31 ... 16 destination port 4 | 15 ... 0 src port 4

  -- REG  0x053A:      --
  -- REG  0x053B:      --
  -- REG  0x053C:      DHCP server IP
  -- REG  0x053D:      lease time

  -- REG  0x053E:      src MAC address MSW (15 ... 0)
  -- REG  0x053F:      src MAC address


  -----------------------------------------------------------------------------
  -- IF0 SPEAD item pointers
  -----------------------------------------------------------------------------
  -- REG  0x0540:      item pointer  1 MSW
  -- REG  0x0541:      item pointer  1 LSW
  
  -- REG  0x0542:      item pointer  2 MSW
  -- REG  0x0543:      item pointer  2 LSW
  
  -- REG  0x0544:      item pointer  3 MSW
  -- REG  0x0545:      item pointer  3 LSW
  
  -- REG  0x0546:      item pointer  4 MSW
  -- REG  0x0547:      item pointer  4 LSW
  
  -- REG  0x0548:      item pointer  5 MSW
  -- REG  0x0549:      item pointer  5 LSW
  
  -- REG  0x054A:      item pointer  6 MSW
  -- REG  0x054B:      item pointer  6 LSW
  
  -- REG  0x054C:      item pointer  7 MSW
  -- REG  0x054D:      item pointer  7 LSW
  
  -- REG  0x054E:      item pointer  8 MSW
  -- REG  0x054F:      item pointer  8 LSW

  -- REG  0x0550:      item pointer  9 MSW
  -- REG  0x0551:      item pointer  9 LSW
  -- REG  0x0552:      item pointer 10 MSW
  -- REG  0x0553:      item pointer 10 LSW
  -- REG  0x0554:      item pointer 11 MSW
  -- REG  0x0555:      item pointer 11 LSW
  -- REG  0x0556:      --
  -- REG  0x0557:      31 ... 12 --
  -- REG  0x0557:      11 ... 0 heap size, number of packets per heap


  -- REG  0x0558:      --
  -- REG  0x0559:      --
  -- REG  0x055A:      --
  -- REG  0x055B:      --
  -- REG  0x055C:      --
  -- REG  0x055D:      --
  -- REG  0x055E:      --
  -- REG  0x055F:      --

  -- REG  0x0560:      --
  -- REG  0x0561:      --
  -- REG  0x0562:      --
  -- REG  0x0563:      --
  -- REG  0x0564:      --
  -- REG  0x0565:      --
  -- REG  0x0566:      --
  -- REG  0x0567:      --
  -- REG  0x0568:      --
  -- REG  0x0569:      --
  -- REG  0x056A:      --
  -- REG  0x056B:      --
  -- REG  0x056C:      --
  -- REG  0x056D:      --
  -- REG  0x056E:      --
  -- REG  0x056F:      --

  -----------------------------------------------------------------------------
  -- IF1 SPEAD item pointers
  -----------------------------------------------------------------------------
  -- REG  0x0570:      item pointer  1 MSW
  -- REG  0x0571:      item pointer  1 LSW
  
  -- REG  0x0572:      item pointer  2 MSW
  -- REG  0x0573:      item pointer  2 LSW
  
  -- REG  0x0574:      item pointer  3 MSW
  -- REG  0x0575:      item pointer  3 LSW
  
  -- REG  0x0576:      item pointer  4 MSW
  -- REG  0x0577:      item pointer  4 LSW
  
  -- REG  0x0578:      item pointer  5 MSW
  -- REG  0x0579:      item pointer  5 LSW
  
  -- REG  0x057A:      item pointer  6 MSW
  -- REG  0x057B:      item pointer  6 LSW
  
  -- REG  0x057C:      item pointer  7 MSW
  -- REG  0x057D:      item pointer  7 LSW
  
  -- REG  0x057E:      item pointer  8 MSW
  -- REG  0x057F:      item pointer  8 LSW

  -- REG  0x0580:      item pointer  9 MSW
  -- REG  0x0581:      item pointer  9 LSW
  -- REG  0x0582:      item pointer 10 MSW
  -- REG  0x0583:      item pointer 10 LSW
  -- REG  0x0584:      item pointer 11 MSW
  -- REG  0x0585:      item pointer 11 LSW
  -- REG  0x0586:      --
  -- REG  0x0587:      number of packets per heap


  
  ---------------------------------------------------------------------------------------------------------
  -- item pointer #     item pointer     MSB(1b)     (15b)                       LSB (48b)
  ---------------------------------------------------------------------------------------------------------
  --              1     heap_id          1           000 0000 0000 0001          SPEADTIME
  --              2     heap_size        1           000 0000 0000 0010          5120
  --              3     heap_offset      1           000 0000 0000 0011          0
  --              4     packet_length    1           000 0000 0000 0100          5120
  --              5     0x1600           1           001 0110 0000 0000          SPEADTIME
  --              6     0x3101           1           011 0001 0000 0001          digitiser_serial(24)
  --                                                                             digitiser_type(8b)
  --                                                                             receptor_id(14b)
  --                                                                             pol_id(2b)
  --              7     0x3102           1           011 0001 0000 0010          adc_count(16)
  --                                                                             zeros(30b)
  --                                                                             adc_saturation_flag(1b)
  --                                                                             ndiode_flag(1b)
  --              8     0x3300           0           011 0011 0000 0000          ADC data offset

  
  SIGNAL din_fifo : STD_LOGIC_VECTOR(48 DOWNTO 0);
  
  SIGNAL buf     : ram := (

   -- 511__480 479__448 447__416 415__384 383__352 351__320 319__288 287__256 255__224 223__192 191__160 159__128 127___96 95____64 63____32 31_____0

    --    0        1        2       3         4        5        6        7        8        9        A        B        C        D        E        F
    X"80060000_00000000_00000000_00000002_00000002_FFFF0088_00684ED0_00000000_EDD1EDD1_00000000_00000000_00000000_00000000_00000021_10000000_00000000", -- AB : data_size=128, TODO mcast_size change to 16 from 4 for alveo design (freq multiplexing)
--    X"A0000000_00000000_00000000_00000002_00000002_FFFF0088_00684ED0_00000000_EDD1EDD1_00000000_00000000_00000000_00000000_00000021_02000000_00000000",
    --   10       11       12      13        14       15       16       17       18       19       1A       1B       1C       1D       1E       1F
    X"C0A80264_00000000_E1000064_E1000065_E1000066_E1000067_00000100_5E000064_00000100_5E000065_00000100_5E000066_00000100_5E000067_1BEC1BEC_1BEC1BEC",
    --   20       21       22      23        24       25       26       27       28       29       2A       2B       2C       2D       2E       2F
    X"1BEC1BEC_1BEC1BEC_00000000_00000000_00000000_00000000_00000050_C2525064_C0A80265_00000000_E10000C8_E10000C9_E10000CA_E10000CB_00000100_5E0000C8",
    --   30       31       32      33        34       35       36       37       38       39       3A       3B       3C       3D       3E       3F
    X"00000100_5E0000C9_00000100_5E0000CA_00000100_5E0000CB_1BED1BED_1BED1BED_1BED1BED_1BED1BED_00000000_00000000_00000000_00000000_00000050_C2525065",

    --   40       41       42      43        44       45       46       47       48       49       4A       4B       4C       4D       4E       4F
    X"80011234_56789ABC_80020000_00002000_80030000_00000000_80040000_00002000_96001234_56789ABC_B101AAAA_AA00CCCC_B1020000_00000000_33100000_00000000", --AB, heap size => 8192, packet size=8192
    --   50       51       52      53        54       55       56       57       58       59       5A       5B       5C       5D       5E       5F
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   60       61       62      63        64       65       66       67       68       69       6A       6B       6C       6D       6E       6F
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   70       71       72      73        74       75       76       77       78       79       7A       7B       7C       7D       7E       7F
    X"80011234_56789ABC_80020000_00001000_80030000_00000000_80040000_00001000_96001234_56789ABC_B101BBBB_BB00CCCC_B1020000_00000000_33100000_00000000",

    --   80       81       82      83        84       85       86       87       88       89       8A       8B       8C       8D       8E       8F
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   90       91       92      93        94       95       96       97       98       99       9A       9B       9C       9D       9E       9F
    X"5E000067_E1000067_1BEC1BEC_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   A0       A1       A2      A3        A4       A5       A6       A7       A8       A9       AA       AB       AC       AD       AE       AF
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   B0       B1       B2      B3        B4       B5       B6       B7       B8       B9       BA       BB       BC       BD       BE       BF
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",

    --   C0       C1       C2      C3        C4       C5       C6       C7       C8       C9       CA       CB       CC       CD       CE       CF
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   D0       D1       D2      D3        D4       D5       D6       D7       D8       D9       DA       DB       DC       DD       DE       DF
    X"5E000067_E1000067_1BEC1BEC_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   E0       E1       E2      E3        E4       E5       E6       E7       E8       E9       EA       EB       EC       ED       EE       EF
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000",
    --   F0       F1       F2      F3        F4       F5       F6       F7       F8       F9       FA       FB       FC       FD       FE       FF
    X"00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000"
    );



BEGIN

  -- FIFO for writing to buf
  -----------------------------------------------------------------------------
  DSP_BUF_CLOCK_CROSSING_FIFO_inst : dsp_buf_clock_crossing_fifo
  PORT MAP (
    rst         => rst,
    wr_clk      => port1_clk,
    rd_clk      => clk,
    din         => din_fifo,
    wr_en       => '1',
    rd_en       => cc_fifo_rd_en,
    dout        => cc_fifo_dout,
    full        => open,
    empty       => cc_fifo_empty
    );
  din_fifo <= port1_data_in_wr & port1_addr & port1_data_in;
  port1_data_in_sync    <= cc_fifo_dout(31 DOWNTO 0);
  port1_addr_sync       <= cc_fifo_dout(47 DOWNTO 32);
  port1_data_in_wr_sync <= cc_fifo_dout(48);

  port1_buf_idx_wr      <= TO_INTEGER(UNSIGNED(port1_addr_sync(7 DOWNTO 4)));
  port1_buf_idx_rd      <= TO_INTEGER(UNSIGNED(port1_addr(7 DOWNTO 4)));

  port2_buf_idx         <= TO_INTEGER(UNSIGNED(port2_addr(7 DOWNTO 4)));


  READ_FIFO_WHEN_NOT_EMPTY : PROCESS (clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF (cc_fifo_empty = '0') THEN
        cc_fifo_rd_en <= '1';
      ELSE
        cc_fifo_rd_en <= '0';
      END IF;
    END IF;
  END PROCESS;

  
  PORT1_DATA_IN_WR_SYNC_REG : PROCESS (clk, rst) IS
  BEGIN
    IF (rst = '1') THEN
      port1_data_in_wr_sync_l <= '0';
    ELSIF rising_edge(clk) THEN
      port1_data_in_wr_sync_l <= port1_data_in_wr_sync;
    END IF;
  END PROCESS;


  IF0_DEST_SEL_REG : PROCESS (clk, rst) IS
  BEGIN
    IF (rst = '1') THEN
      IF0_dst_sel_l <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF0_dst_sel_l <= IF0_dst_sel;
    END IF;
  END PROCESS;
  
  
  data_size                     <= buf(0)(511 DOWNTO 504);
  filter_select                 <= buf(0)(503 DOWNTO 500);
  use_1pps                      <= buf(0)(499);
  data_enable1                  <= buf(0)(498);
  data_enable2                  <= buf(0)(497);
  sync_request                  <= buf(0)(496);
  flip_signal_spec              <= buf(0)(483);
  clr_err                       <= buf(0)(482);
  mode_edd                      <= buf(0)(481 DOWNTO 480);

  sync_timestamp                <= buf(0)(479 DOWNTO 416);

  IF0_msg_first_addr            <= buf(0)(407 DOWNTO 400);
  IF0_msg_last_addr             <= buf(0)(399 DOWNTO 392);
  IF0_arp_req_trig              <= buf(0)(389);
  IF0_arpbeat_enable            <= buf(0)(388);
  IF0_msg_send_trig             <= buf(0)(387);
  IF0_dhcpdiscover_trig         <= buf(0)(386);
  IF0_my_IP_sel                 <= buf(0)(385);
  IF0_enable                    <= buf(0)(384);

  IF1_msg_first_addr            <= buf(0)(375 DOWNTO 368);
  IF1_msg_last_addr             <= buf(0)(367 DOWNTO 360);
  IF1_arp_req_trig              <= buf(0)(357);
  IF1_arpbeat_enable            <= buf(0)(356);
  IF1_msg_send_trig             <= buf(0)(355);
  IF1_dhcpdiscover_trig         <= buf(0)(354);
  IF1_my_IP_sel                 <= buf(0)(353);
  IF1_enable                    <= buf(0)(352);

  test_value                    <= buf(0)(255 DOWNTO 224);

  mode_wave_data_gen            <= buf(0)(127 DOWNTO 120);
  ampl_wave_data_gen            <= buf(0)(119 DOWNTO 112);
  pre_decimation_fac            <= buf(0)(107 DOWNTO 104);  
  deskew_val                    <= buf(0)(103 DOWNTO  96);

  mcast_size                    <= buf(0)( 63 DOWNTO  56);
  heap_size                     <= buf(5)(267 DOWNTO 256);

  -- IF0
  -----------------------------------------------------------------------------
  IF0_src_mac_addr              <= buf(2)(303 DOWNTO 288) & buf(2)(287 DOWNTO 256);
  
  IF0_item_pointer_01           <= buf(4)(511 DOWNTO 448);
  IF0_item_pointer_02           <= buf(4)(447 DOWNTO 384);
  IF0_item_pointer_03           <= buf(4)(383 DOWNTO 320);
  IF0_item_pointer_04           <= buf(4)(319 DOWNTO 256);
  IF0_item_pointer_05           <= buf(4)(255 DOWNTO 192);
  IF0_item_pointer_06           <= buf(4)(191 DOWNTO 128);
  IF0_item_pointer_07           <= buf(4)(127 DOWNTO  64);
  IF0_item_pointer_08           <= buf(4)( 63 DOWNTO   0);

  IF0_item_pointer_09           <= buf(5)(511 DOWNTO 448);
  IF0_item_pointer_10           <= buf(5)(447 DOWNTO 384);
  IF0_item_pointer_11           <= buf(5)(383 DOWNTO 320);

  
  LATCH_ASYNC_inst2 : dsp_latch_async
  GENERIC MAP (
    data_in     => 64
    )
  PORT MAP (
    clk         => clk,
    din         => time_at_1pps,
    dout        => time_at_1pps_sync
    );

  LATCH_ASYNC_inst3 : dsp_latch_async
  GENERIC MAP (
    data_in     => 32
    )
  PORT MAP (
    clk         => clk,
    din         => eddy_status,
    dout        => eddy_status_sync
    );

  LATCH_ASYNC_inst4 : dsp_latch_async
  GENERIC MAP (
    data_in     => 24
    )
  PORT MAP (
    clk         => clk,
    din         => status_in(31 DOWNTO 8),
    dout        => status_in_sync(31 DOWNTO 8)
    );

  
  IF0_DHCP_OR_STATIC_IP : PROCESS (IF0_my_IP_sel,buf) IS
  BEGIN
    -- STATIC
    IF (IF0_my_IP_sel = '1') THEN
      IF0_src_ip_addr <= buf(1)(511 DOWNTO 480);
    -- DHCP
    ELSE
      IF0_src_ip_addr <= buf(1)(479 DOWNTO 448);
    END IF;
  END PROCESS;

  
  IF0_SELECT_DESTINATION : PROCESS (IF0_dst_sel_l,buf) IS
  BEGIN
    -- DEST 1
    IF (IF0_dst_sel_l = "00") THEN
      IF0_dst_mac_addr      <= buf(1)(303 DOWNTO 256);
      IF0_dst_ip_addr       <= buf(1)(447 DOWNTO 416);
      IF0_dst_udp_port      <= buf(1)( 63 DOWNTO  48);
      IF0_src_udp_port      <= buf(1)( 47 DOWNTO  32);

    -- DEST 2
    ELSIF (IF0_dst_sel_l = "01") THEN
      IF0_dst_mac_addr      <= buf(1)(239 DOWNTO 192);
      IF0_dst_ip_addr       <= buf(1)(415 DOWNTO 384);
      IF0_dst_udp_port      <= buf(1)( 31 DOWNTO  16);
      IF0_src_udp_port      <= buf(1)( 15 DOWNTO   0);

    -- DEST 3
    ELSIF (IF0_dst_sel_l = "10") THEN
      IF0_dst_mac_addr      <= buf(1)(175 DOWNTO 128);
      IF0_dst_ip_addr       <= buf(1)(383 DOWNTO 352);
      IF0_dst_udp_port      <= buf(2)(511 DOWNTO 496);
      IF0_src_udp_port      <= buf(2)(495 DOWNTO 480);

    -- DEST 4
    ELSIF (IF0_dst_sel_l = "11") THEN
      IF0_dst_mac_addr      <= buf(1)(111 DOWNTO  64);
      IF0_dst_ip_addr       <= buf(1)(351 DOWNTO 320);
      IF0_dst_udp_port      <= buf(2)(479 DOWNTO 464);
      IF0_src_udp_port      <= buf(2)(463 DOWNTO 448);

    -- DEFAULT
    ELSE
      IF0_dst_mac_addr      <= buf(1)(303 DOWNTO 256);
      IF0_dst_ip_addr       <= buf(1)(447 DOWNTO 416);
      IF0_dst_udp_port      <= buf(1)( 63 DOWNTO  48);
      IF0_src_udp_port      <= buf(1)( 47 DOWNTO  32);

    END IF;
  END PROCESS;


  -- IF1
  -----------------------------------------------------------------------------
  IF1_src_mac_addr           <= buf(3)( 47 DOWNTO  0);
  
  IF1_item_pointer_01        <= buf(7)(511 DOWNTO 448);
  IF1_item_pointer_02        <= buf(7)(447 DOWNTO 384);
  IF1_item_pointer_03        <= buf(7)(383 DOWNTO 320);
  IF1_item_pointer_04        <= buf(7)(319 DOWNTO 256);
  IF1_item_pointer_05        <= buf(7)(255 DOWNTO 192);
  IF1_item_pointer_06        <= buf(7)(191 DOWNTO 128);
  IF1_item_pointer_07        <= buf(7)(127 DOWNTO  64);
  IF1_item_pointer_08        <= buf(7)( 63 DOWNTO   0);

  IF1_item_pointer_09        <= buf(8)(511 DOWNTO 448);
  IF1_item_pointer_10        <= buf(8)(447 DOWNTO 384);
  IF1_item_pointer_11        <= buf(8)(383 DOWNTO 320);

  
  IF1_DHCP_OR_STATIC_IP : PROCESS (IF1_my_IP_sel) IS
  BEGIN
    -- STATIC
    IF (IF1_my_IP_sel = '1') THEN
      IF1_src_ip_addr <= buf(2)(255 DOWNTO 224);
    -- DHCP
    ELSE
      IF1_src_ip_addr <= buf(1)(223 DOWNTO 192);
    END IF;
  END PROCESS;

  
  IF1_SELECT_DESTINATION : PROCESS (IF1_dst_sel,buf) IS
  BEGIN
    -- DEST 1
    IF (IF1_dst_sel = "00") THEN
      IF1_dst_mac_addr      <= buf(2)( 47 DOWNTO   0);
      IF1_dst_ip_addr       <= buf(2)(191 DOWNTO 160);
      IF1_dst_udp_port      <= buf(3)(319 DOWNTO 304);
      IF1_src_udp_port      <= buf(3)(303 DOWNTO 288);

    -- DEST 2
    ELSIF (IF1_dst_sel = "01") THEN
      IF1_dst_mac_addr      <= buf(3)(495 DOWNTO 448);
      IF1_dst_ip_addr       <= buf(2)(159 DOWNTO 128);
      IF1_dst_udp_port      <= buf(3)(287 DOWNTO 272);
      IF1_src_udp_port      <= buf(3)(271 DOWNTO 256);

    -- DEST 3
    ELSIF (IF1_dst_sel = "10") THEN
      IF1_dst_mac_addr      <= buf(3)(431 DOWNTO 384);
      IF1_dst_ip_addr       <= buf(2)(127 DOWNTO  96);
      IF1_dst_udp_port      <= buf(3)(255 DOWNTO 240);
      IF1_src_udp_port      <= buf(3)(239 DOWNTO 224);

    -- DEST 4
    ELSIF (IF1_dst_sel = "11") THEN
      IF1_dst_mac_addr      <= buf(3)(367 DOWNTO 320);
      IF1_dst_ip_addr       <= buf(2)( 95 DOWNTO  64);
      IF1_dst_udp_port      <= buf(3)(223 DOWNTO 208);
      IF1_src_udp_port      <= buf(3)(207 DOWNTO 192);

    -- DEFAULT
    ELSE
      IF1_dst_mac_addr      <= buf(2)( 47 DOWNTO   0);
      IF1_dst_ip_addr       <= buf(2)(191 DOWNTO 160);
      IF1_dst_udp_port      <= buf(3)(319 DOWNTO 304);
      IF1_src_udp_port      <= buf(3)(303 DOWNTO 288);

    END IF;
  END PROCESS;


  -- data OUT port1
  -----------------------------------------------------------------------------
  PROCESS (port1_addr,buf,port1_buf_idx_rd) IS
  BEGIN

    CASE port1_addr(3 DOWNTO 0) IS
        
      WHEN X"0" => 
        port1_data_out <= buf(port1_buf_idx_rd)(511 DOWNTO 480);
      WHEN X"1" => 
        port1_data_out <= buf(port1_buf_idx_rd)(479 DOWNTO 448);
      WHEN X"2" => 
        port1_data_out <= buf(port1_buf_idx_rd)(447 DOWNTO 416);
      WHEN X"3" => 
        port1_data_out <= buf(port1_buf_idx_rd)(415 DOWNTO 384);
      WHEN X"4" => 
        port1_data_out <= buf(port1_buf_idx_rd)(383 DOWNTO 352);
      WHEN X"5" => 
        port1_data_out <= buf(port1_buf_idx_rd)(351 DOWNTO 320);
      WHEN X"6" => 
        port1_data_out <= buf(port1_buf_idx_rd)(319 DOWNTO 288);
      WHEN X"7" => 
        port1_data_out <= buf(port1_buf_idx_rd)(287 DOWNTO 256);

      WHEN X"8" => 
        port1_data_out <= buf(port1_buf_idx_rd)(255 DOWNTO 224);
      WHEN X"9" => 
        port1_data_out <= buf(port1_buf_idx_rd)(223 DOWNTO 192);
      WHEN X"A" => 
        port1_data_out <= buf(port1_buf_idx_rd)(191 DOWNTO 160);
      WHEN X"B" => 
        port1_data_out <= buf(port1_buf_idx_rd)(159 DOWNTO 128);
      WHEN X"C" => 
        port1_data_out <= buf(port1_buf_idx_rd)(127 DOWNTO  96);
      WHEN X"D" => 
        port1_data_out <= buf(port1_buf_idx_rd)( 95 DOWNTO  64);
      WHEN X"E" => 
        port1_data_out <= buf(port1_buf_idx_rd)( 63 DOWNTO  32);
      WHEN X"F" => 
        port1_data_out <= buf(port1_buf_idx_rd)( 31 DOWNTO   0);

      WHEN OTHERS => NULL;
    END CASE;
    
  END PROCESS;

  
  -- data OUT port2
  -----------------------------------------------------------------------------
  PROCESS (port2_addr,buf,port2_buf_idx) IS
  BEGIN

    CASE port2_addr(3 DOWNTO 0) IS
        
      WHEN X"0" => 
        port2_data_out <= buf(port2_buf_idx)(511 DOWNTO 480);
      WHEN X"1" => 
        port2_data_out <= buf(port2_buf_idx)(479 DOWNTO 448);
      WHEN X"2" => 
        port2_data_out <= buf(port2_buf_idx)(447 DOWNTO 416);
      WHEN X"3" => 
        port2_data_out <= buf(port2_buf_idx)(415 DOWNTO 384);
      WHEN X"4" => 
        port2_data_out <= buf(port2_buf_idx)(383 DOWNTO 352);
      WHEN X"5" => 
        port2_data_out <= buf(port2_buf_idx)(351 DOWNTO 320);
      WHEN X"6" => 
        port2_data_out <= buf(port2_buf_idx)(319 DOWNTO 288);
      WHEN X"7" => 
        port2_data_out <= buf(port2_buf_idx)(287 DOWNTO 256);

      WHEN X"8" => 
        port2_data_out <= buf(port2_buf_idx)(255 DOWNTO 224);
      WHEN X"9" => 
        port2_data_out <= buf(port2_buf_idx)(223 DOWNTO 192);
      WHEN X"A" => 
        port2_data_out <= buf(port2_buf_idx)(191 DOWNTO 160);
      WHEN X"B" => 
        port2_data_out <= buf(port2_buf_idx)(159 DOWNTO 128);
      WHEN X"C" => 
        port2_data_out <= buf(port2_buf_idx)(127 DOWNTO  96);
      WHEN X"D" => 
        port2_data_out <= buf(port2_buf_idx)( 95 DOWNTO  64);
      WHEN X"E" => 
        port2_data_out <= buf(port2_buf_idx)( 63 DOWNTO  32);
      WHEN X"F" => 
        port2_data_out <= buf(port2_buf_idx)( 31 DOWNTO   0);

      WHEN OTHERS => NULL;
    END CASE;
    
  END PROCESS;

  
  -- data IN
  -----------------------------------------------------------------------------
  PROCESS (clk) IS
  BEGIN
    
    IF rising_edge(clk) THEN

      buf(0)(287 DOWNTO 256)    <= status_in_sync;
      buf(0)(223 DOWNTO 160)    <= time_at_1pps_sync;
      buf(0)(159 DOWNTO 128)    <= eddy_status_sync;

      buf(0)(351 DOWNTO 320)    <= IF0_status;
      buf(0)(319 DOWNTO 288)    <= IF1_status;
      
      IF ((port1_data_in_wr_sync = '1' AND port1_data_in_wr_sync_l = '0')) THEN

        CASE port1_addr_sync(3 DOWNTO 0) IS

          WHEN X"0" => 
            buf(port1_buf_idx_wr)(511 DOWNTO 480) <= port1_data_in_sync;
          WHEN X"1" => 
            buf(port1_buf_idx_wr)(479 DOWNTO 448) <= port1_data_in_sync;
          WHEN X"2" => 
            buf(port1_buf_idx_wr)(447 DOWNTO 416) <= port1_data_in_sync;
          WHEN X"3" => 
            buf(port1_buf_idx_wr)(415 DOWNTO 384) <= port1_data_in_sync;
          WHEN X"4" => 
            buf(port1_buf_idx_wr)(383 DOWNTO 352) <= port1_data_in_sync;
          WHEN X"5" => 
            buf(port1_buf_idx_wr)(351 DOWNTO 320) <= port1_data_in_sync;
          WHEN X"6" => 
            buf(port1_buf_idx_wr)(319 DOWNTO 288) <= port1_data_in_sync;
          WHEN X"7" => 
            buf(port1_buf_idx_wr)(287 DOWNTO 256) <= port1_data_in_sync;

          WHEN X"8" => 
            buf(port1_buf_idx_wr)(255 DOWNTO 224) <= port1_data_in_sync;
          WHEN X"9" => 
            buf(port1_buf_idx_wr)(223 DOWNTO 192) <= port1_data_in_sync;
          WHEN X"A" => 
            buf(port1_buf_idx_wr)(191 DOWNTO 160) <= port1_data_in_sync;
          WHEN X"B" => 
            buf(port1_buf_idx_wr)(159 DOWNTO 128) <= port1_data_in_sync;
          WHEN X"C" => 
            buf(port1_buf_idx_wr)(127 DOWNTO  96) <= port1_data_in_sync;
          WHEN X"D" => 
            buf(port1_buf_idx_wr)( 95 DOWNTO  64) <= port1_data_in_sync;
          WHEN X"E" => 
            buf(port1_buf_idx_wr)( 63 DOWNTO  32) <= port1_data_in_sync;
          WHEN X"F" => 
            buf(port1_buf_idx_wr)( 31 DOWNTO   0) <= port1_data_in_sync;

          WHEN OTHERS => NULL;

        END CASE;

      ELSIF (port2_data_in_wr = '1') THEN

        CASE port2_addr(3 DOWNTO 0) IS

          WHEN X"0" => 
            buf(port2_buf_idx)(511 DOWNTO 480) <= port2_data_in;
          WHEN X"1" => 
            buf(port2_buf_idx)(479 DOWNTO 448) <= port2_data_in;
          WHEN X"2" => 
            buf(port2_buf_idx)(447 DOWNTO 416) <= port2_data_in;
          WHEN X"3" => 
            buf(port2_buf_idx)(415 DOWNTO 384) <= port2_data_in;
          WHEN X"4" => 
            buf(port2_buf_idx)(383 DOWNTO 352) <= port2_data_in;
          WHEN X"5" => 
            buf(port2_buf_idx)(351 DOWNTO 320) <= port2_data_in;
          WHEN X"6" => 
            buf(port2_buf_idx)(319 DOWNTO 288) <= port2_data_in;
          WHEN X"7" => 
            buf(port2_buf_idx)(287 DOWNTO 256) <= port2_data_in;

          WHEN X"8" => 
            buf(port2_buf_idx)(255 DOWNTO 224) <= port2_data_in;
          WHEN X"9" => 
            buf(port2_buf_idx)(223 DOWNTO 192) <= port2_data_in;
          WHEN X"A" => 
            buf(port2_buf_idx)(191 DOWNTO 160) <= port2_data_in;
          WHEN X"B" => 
            buf(port2_buf_idx)(159 DOWNTO 128) <= port2_data_in;
          WHEN X"C" => 
            buf(port2_buf_idx)(127 DOWNTO  96) <= port2_data_in;
          WHEN X"D" => 
            buf(port2_buf_idx)( 95 DOWNTO  64) <= port2_data_in;
          WHEN X"E" => 
            buf(port2_buf_idx)( 63 DOWNTO  32) <= port2_data_in;
          WHEN X"F" => 
            buf(port2_buf_idx)( 31 DOWNTO   0) <= port2_data_in;

          WHEN OTHERS => NULL;

        END CASE;
        
      END IF;
      
    END IF;

  END PROCESS;

  
--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                   => port1_clk,
--    probe0(511 DOWNTO 48) => (OTHERS => '0'),
--    probe0( 47 DOWNTO  0) => port1_addr & port1_data_in,
--    probe1(  5 DOWNTO  0) => (OTHERS => '0'),
--    probe2(0)             => port1_data_in_wr,
--    probe3(0)             => '0',
--    probe4(0)             => '0',
--    probe5(0)             => '0',
--    probe6(0)             => '0',
--    probe7(0)             => '0'
--    );

  
--  ILA_2_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                   => clk,
--    probe0(511 DOWNTO 48) => (OTHERS => '0'),
--    probe0( 47 DOWNTO  0) => port1_addr_sync & port1_data_in_sync,
--    probe1(  5 DOWNTO  0) => (OTHERS => '0'),
--    probe2(0)             => port1_data_in_wr_sync,
--    probe3(0)             => '0',
--    probe4(0)             => '0',
--    probe5(0)             => '0',
--    probe6(0)             => '0',
--    probe7(0)             => '0'
--    );
  

END arch;




