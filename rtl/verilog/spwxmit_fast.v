/*
 * Fast SpaceWire Transmitter.
 *
 * Verilog 2001 synthesized translation of rtl/vhdl/spwxmit_fast.vhd from
 * SpaceWire Light, generated with GHDL and normalized to flattened ports.
 */

`timescale 1ns / 1ps

module spwxmit_fast
  (input  clk,
   input  txclk,
   input  rst,
   input  [7:0] divcnt,
   input  xmiti_txen,
   input  xmiti_stnull,
   input  xmiti_stfct,
   input  xmiti_fct_in,
   input  xmiti_tick_in,
   input  [1:0] xmiti_ctrl_in,
   input  [5:0] xmiti_time_in,
   input  xmiti_txwrite,
   input  xmiti_txflag,
   input  [7:0] xmiti_txdata,
   output xmito_fctack,
   output xmito_txack,
   output spw_do,
   output spw_so);
  wire [22:0] n0;
  wire n2;
  wire n3;
  wire [89:0] rtx;
  wire [89:0] rtxin;
  reg [62:0] r;
  wire [62:0] rin;
  wire [4:0] synctx;
  wire [1:0] syncsys;
  wire s_spwdo;
  wire s_spwso;
  localparam n7 = 1'b1;
  wire synctx_rst_n8;
  wire n11;
  wire synctx_sysflip0_n12;
  wire n15;
  wire synctx_sysflip1_n16;
  wire n19;
  wire synctx_txen_n20;
  wire n23;
  wire synctx_txdivsafe_n24;
  wire n27;
  wire syncsys_txflip0_n28;
  wire n31;
  wire syncsys_txflip1_n32;
  wire n42;
  wire n43;
  wire n44;
  wire n45;
  wire n46;
  wire n47;
  wire [1:0] n49;
  wire n50;
  wire n51;
  wire n52;
  wire n53;
  wire n54;
  wire n56;
  wire n57;
  wire n58;
  wire n59;
  wire n60;
  wire n61;
  wire n62;
  wire [11:0] n63;
  wire n64;
  wire n65;
  wire n66;
  wire n67;
  wire n68;
  wire n69;
  wire n70;
  wire n71;
  wire [11:0] n72;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire [1:0] n79;
  wire [12:0] n80;
  wire [1:0] n81;
  wire [12:0] n82;
  wire [1:0] n83;
  wire n84;
  wire [12:0] n85;
  wire [1:0] n86;
  wire n87;
  wire [12:0] n88;
  wire [12:0] n89;
  wire n91;
  wire n92;
  wire n93;
  wire n95;
  wire n97;
  wire n98;
  wire n99;
  wire n100;
  wire n101;
  wire n102;
  wire n103;
  wire n105;
  wire n106;
  wire n107;
  wire n108;
  wire n109;
  wire n110;
  wire n111;
  wire n113;
  wire n114;
  wire n115;
  wire n116;
  wire n118;
  wire n119;
  wire n120;
  wire n121;
  wire n122;
  wire n124;
  wire n125;
  wire n126;
  wire [8:0] n129;
  wire [7:0] n131;
  wire [8:0] n133;
  wire [8:0] n134;
  wire [11:0] n135;
  wire [11:0] n136;
  wire [11:0] n137;
  wire n139;
  wire n143;
  wire [8:0] n147;
  wire n148;
  wire n149;
  wire n150;
  wire [10:0] n151;
  wire [10:0] n152;
  wire [10:0] n153;
  wire [10:0] n154;
  wire [10:0] n155;
  wire n157;
  wire n158;
  wire [8:0] n160;
  wire n161;
  wire n162;
  wire n163;
  wire n164;
  wire n165;
  wire [5:0] n167;
  wire n168;
  wire [6:0] n169;
  wire [9:0] n171;
  wire n172;
  wire [8:0] n173;
  wire [9:0] n175;
  wire [8:0] n176;
  wire [9:0] n178;
  wire n179;
  wire n180;
  wire n181;
  wire [20:0] n182;
  wire [21:0] n183;
  wire n184;
  wire n185;
  wire n186;
  wire [20:0] n187;
  wire [20:0] n188;
  wire [21:0] n189;
  wire [21:0] n190;
  wire [21:0] n191;
  wire n193;
  wire n194;
  wire n195;
  wire n196;
  wire n197;
  wire n198;
  wire n199;
  wire n200;
  wire n201;
  wire n202;
  wire n203;
  wire n204;
  wire [1:0] n206;
  wire [1:0] n207;
  wire [1:0] n208;
  wire [1:0] n209;
  wire [1:0] n210;
  wire [1:0] n212;
  wire [1:0] n214;
  wire [1:0] n217;
  wire n218;
  wire [1:0] n219;
  wire [1:0] n220;
  wire [1:0] n222;
  wire n223;
  wire [1:0] n224;
  wire [1:0] n225;
  wire [1:0] n227;
  wire n228;
  wire [1:0] n229;
  wire [1:0] n230;
  wire [1:0] n232;
  wire n234;
  wire n241;
  wire [1:0] n242;
  wire n244;
  wire n250;
  wire n252;
  wire [1:0] n253;
  wire n255;
  wire n261;
  wire [3:0] n263;
  wire n265;
  wire [3:0] n272;
  wire n274;
  wire [8:0] n280;
  wire n281;
  wire n282;
  wire n283;
  wire n284;
  wire n285;
  wire n287;
  wire n288;
  wire n289;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire [7:0] n296;
  wire [12:0] n299;
  wire [12:0] n300;
  wire [12:0] n301;
  wire n302;
  wire [7:0] n303;
  wire n304;
  wire [8:0] n305;
  wire [8:0] n306;
  wire n307;
  wire n308;
  wire [3:0] n324;
  wire [3:0] n325;
  wire [11:0] n326;
  wire [10:0] n327;
  wire [3:0] n328;
  wire [3:0] n329;
  wire n330;
  wire n331;
  wire [2:0] n332;
  wire [3:0] n333;
  wire [3:0] n334;
  wire n335;
  wire [11:0] n336;
  wire [11:0] n337;
  wire [10:0] n338;
  wire [10:0] n339;
  wire [11:0] n340;
  wire [8:0] n341;
  wire [9:0] n343;
  wire n344;
  wire n345;
  wire [11:0] n353;
  wire [8:0] n354;
  wire [7:0] n355;
  wire [11:0] n356;
  wire [11:0] n357;
  wire [8:0] n358;
  wire [4:0] n359;
  wire [1:0] n360;
  wire [1:0] n362;
  wire [9:0] n364;
  wire [1:0] n365;
  wire n367;
  wire n368;
  wire n369;
  wire [6:0] n372;
  wire n374;
  wire n377;
  wire n378;
  wire [12:0] n380;
  wire [11:0] n381;
  wire [11:0] n382;
  wire [11:0] n383;
  wire n384;
  wire n385;
  wire [12:0] n386;
  wire n387;
  wire [12:0] n388;
  wire [12:0] n389;
  wire n391;
  wire n392;
  wire n394;
  wire n395;
  wire [11:0] n396;
  wire n397;
  wire n398;
  wire n399;
  wire n401;
  wire n402;
  wire [26:0] n404;
  wire n405;
  wire n406;
  wire n416;
  wire n417;
  wire n418;
  wire n419;
  wire n420;
  wire n423;
  wire n424;
  wire n425;
  wire n426;
  wire n429;
  wire n430;
  wire n431;
  wire n432;
  wire n433;
  wire [7:0] n438;
  wire n440;
  wire n441;
  wire n442;
  wire n443;
  wire n444;
  wire n445;
  wire n446;
  wire n450;
  wire n451;
  wire n452;
  wire n453;
  wire n455;
  wire n458;
  wire n460;
  wire n461;
  wire n462;
  wire n463;
  wire [11:0] n466;
  wire n467;
  wire n468;
  wire [7:0] n469;
  wire n471;
  wire n472;
  wire n474;
  wire n476;
  wire [9:0] n477;
  wire [9:0] n479;
  wire [1:0] n480;
  wire n481;
  wire [1:0] n482;
  wire [1:0] n483;
  wire n485;
  wire n486;
  wire n487;
  wire n489;
  wire [10:0] n490;
  wire [11:0] n491;
  wire n492;
  wire n494;
  wire [10:0] n495;
  wire [10:0] n496;
  wire n497;
  wire n498;
  wire n499;
  wire n500;
  wire n501;
  wire n502;
  wire n503;
  wire [11:0] n504;
  wire n506;
  wire n507;
  wire [11:0] n508;
  wire [11:0] n509;
  wire n510;
  wire n511;
  wire n512;
  wire n513;
  wire n514;
  wire n515;
  wire n516;
  wire [11:0] n517;
  wire [12:0] n519;
  wire n520;
  wire n521;
  wire [12:0] n522;
  wire [12:0] n523;
  wire n525;
  wire n526;
  wire n527;
  wire n529;
  wire [11:0] n530;
  wire [11:0] n531;
  wire [11:0] n532;
  wire n533;
  wire n534;
  wire [26:0] n535;
  wire [26:0] n536;
  wire n537;
  wire n538;
  wire n539;
  wire n540;
  wire n541;
  wire n542;
  wire n543;
  wire n544;
  wire n545;
  wire n546;
  wire n547;
  wire n548;
  wire n549;
  wire n550;
  wire n551;
  wire n553;
  wire [7:0] n554;
  wire [8:0] n555;
  wire [9:0] n556;
  wire n557;
  wire [8:0] n558;
  wire [9:0] n559;
  wire [9:0] n560;
  wire n561;
  wire n562;
  wire [1:0] n564;
  wire [5:0] n565;
  wire [7:0] n566;
  wire [8:0] n567;
  wire [7:0] n568;
  wire [8:0] n569;
  wire [8:0] n570;
  wire [49:0] n571;
  wire [1:0] n572;
  wire [2:0] n573;
  wire [2:0] n574;
  wire [1:0] n575;
  wire [1:0] n576;
  wire [23:0] n577;
  wire [23:0] n578;
  wire [23:0] n579;
  wire [2:0] n580;
  wire [2:0] n581;
  wire [8:0] n582;
  wire [8:0] n583;
  wire [8:0] n584;
  wire n585;
  wire n586;
  wire [7:0] n587;
  wire [7:0] n588;
  wire [7:0] n589;
  wire [2:0] n590;
  wire [2:0] n591;
  wire [62:0] n609;
  wire [62:0] n610;
  wire n611;
  wire n612;
  wire n613;
  wire n614;
  wire n615;
  wire n616;
  wire n617;
  wire n618;
  wire n619;
  wire n620;
  wire n621;
  wire n622;
  wire n623;
  wire n624;
  wire n625;
  wire n626;
  wire [89:0] n627;
  wire n634;
  wire n635;
  reg [89:0] n645;
  reg [62:0] n646;
  wire [4:0] n647;
  wire [1:0] n648;
  reg n649;
  reg n650;
  wire [1:0] n651;
  wire n654; // mem_rd
  wire n657; // mem_rd
  wire n660; // mem_rd
  wire n663; // mem_rd
  wire n666; // mem_rd
  assign xmito_fctack = n2; //(module output)
  assign xmito_txack = n3; //(module output)
  assign spw_do = s_spwdo; //(module output)
  assign spw_so = s_spwso; //(module output)
  assign n0 = {xmiti_txdata, xmiti_txflag, xmiti_txwrite, xmiti_time_in, xmiti_ctrl_in, xmiti_tick_in, xmiti_fct_in, xmiti_stfct, xmiti_stnull, xmiti_txen};
  assign n2 = n651[0]; // extract
  assign n3 = n651[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:310:12  */
  assign rtx = n645; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:311:12  */
  assign rtxin = n627; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:312:12  */
  always @*
    r = n646; // (isignal)
  initial
    r = 63'b000000000000000000000000000000000000000000000000000000000000000;
  /* rtl\vhdl\spwxmit_fast.vhd:313:12  */
  assign rin = n610; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:316:12  */
  assign synctx = n647; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:317:12  */
  assign syncsys = n648; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:320:12  */
  assign s_spwdo = n649; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:321:12  */
  assign s_spwso = n650; // (signal)
  /* rtl\vhdl\spwxmit_fast.vhd:331:5  */
  syncdff synctx_rst (
    .clk(txclk),
    .rst(rst),
    .di(n7),
    .do(synctx_rst_n8));
  /* rtl\vhdl\spwxmit_fast.vhd:336:54  */
  assign n11 = r[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:335:5  */
  syncdff synctx_sysflip0 (
    .clk(txclk),
    .rst(rst),
    .di(n11),
    .do(synctx_sysflip0_n12));
  /* rtl\vhdl\spwxmit_fast.vhd:338:54  */
  assign n15 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:337:5  */
  syncdff synctx_sysflip1 (
    .clk(txclk),
    .rst(rst),
    .di(n15),
    .do(synctx_sysflip1_n16));
  /* rtl\vhdl\spwxmit_fast.vhd:340:54  */
  assign n19 = r[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:339:5  */
  syncdff synctx_txen (
    .clk(txclk),
    .rst(rst),
    .di(n19),
    .do(synctx_txen_n20));
  /* rtl\vhdl\spwxmit_fast.vhd:342:54  */
  assign n23 = r[12]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:341:5  */
  syncdff synctx_txdivsafe (
    .clk(txclk),
    .rst(rst),
    .di(n23),
    .do(synctx_txdivsafe_n24));
  /* rtl\vhdl\spwxmit_fast.vhd:346:56  */
  assign n27 = rtx[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:345:5  */
  syncdff syncsys_txflip0 (
    .clk(clk),
    .rst(rst),
    .di(n27),
    .do(syncsys_txflip0_n28));
  /* rtl\vhdl\spwxmit_fast.vhd:348:56  */
  assign n31 = rtx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:347:5  */
  syncdff syncsys_txflip1 (
    .clk(clk),
    .rst(rst),
    .di(n31),
    .do(syncsys_txflip1_n32));
  /* rtl\vhdl\spwxmit_fast.vhd:375:29  */
  assign n42 = rtx[66]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:375:52  */
  assign n43 = rtx[53]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:375:37  */
  assign n44 = n42 & n43;
  /* rtl\vhdl\spwxmit_fast.vhd:375:69  */
  assign n45 = rtx[19]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:375:61  */
  assign n46 = ~n45;
  /* rtl\vhdl\spwxmit_fast.vhd:375:56  */
  assign n47 = n44 & n46;
  assign n49 = rtx[1:0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:376:16  */
  assign n50 = rtx[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:376:22  */
  assign n51 = ~n50;
  /* rtl\vhdl\spwxmit_fast.vhd:377:33  */
  assign n52 = rtx[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:379:33  */
  assign n53 = rtx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:376:9  */
  assign n54 = n51 ? n52 : n53;
  assign n56 = rtx[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:381:16  */
  assign n57 = rtx[2]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:382:20  */
  assign n58 = rtx[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:382:26  */
  assign n59 = ~n58;
  /* rtl\vhdl\spwxmit_fast.vhd:384:39  */
  assign n60 = synctx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:384:56  */
  assign n61 = rtx[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:384:48  */
  assign n62 = n60 ^ n61;
  /* rtl\vhdl\spwxmit_fast.vhd:385:34  */
  assign n63 = r[26:15]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:387:39  */
  assign n64 = synctx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:387:56  */
  assign n65 = rtx[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:387:48  */
  assign n66 = n64 ^ n65;
  /* rtl\vhdl\spwxmit_fast.vhd:388:39  */
  assign n67 = synctx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:389:36  */
  assign n68 = rtx[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:392:39  */
  assign n69 = synctx[2]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:392:56  */
  assign n70 = rtx[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:392:48  */
  assign n71 = n69 ^ n70;
  /* rtl\vhdl\spwxmit_fast.vhd:393:34  */
  assign n72 = r[38:27]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:395:44  */
  assign n73 = synctx[2]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:395:61  */
  assign n74 = rtx[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:395:53  */
  assign n75 = n73 ^ n74;
  /* rtl\vhdl\spwxmit_fast.vhd:395:32  */
  assign n76 = ~n75;
  /* rtl\vhdl\spwxmit_fast.vhd:396:36  */
  assign n77 = rtx[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:397:39  */
  assign n78 = synctx[2]; // extract
  assign n79 = {n78, n77};
  assign n80 = {n72, n71};
  assign n81 = {n68, n67};
  assign n82 = {n63, n62};
  /* rtl\vhdl\spwxmit_fast.vhd:382:13  */
  assign n83 = n59 ? n81 : n79;
  /* rtl\vhdl\spwxmit_fast.vhd:382:13  */
  assign n84 = n59 ? n66 : n76;
  /* rtl\vhdl\spwxmit_fast.vhd:382:13  */
  assign n85 = n59 ? n82 : n80;
  /* rtl\vhdl\spwxmit_fast.vhd:381:9  */
  assign n86 = n57 ? n83 : n49;
  /* rtl\vhdl\spwxmit_fast.vhd:381:9  */
  assign n87 = n57 ? n84 : n56;
  assign n88 = rtx[17:5]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:381:9  */
  assign n89 = n57 ? n85 : n88;
  /* rtl\vhdl\spwxmit_fast.vhd:402:29  */
  assign n91 = rtx[66]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:402:52  */
  assign n92 = rtx[56]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:402:37  */
  assign n93 = n91 & n92;
  /* rtl\vhdl\spwxmit_fast.vhd:403:16  */
  assign n95 = rtx[18]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:409:41  */
  assign n97 = rtx[6]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:409:58  */
  assign n98 = rtx[5]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:409:50  */
  assign n99 = ~n98;
  /* rtl\vhdl\spwxmit_fast.vhd:409:46  */
  assign n100 = n97 | n99;
  /* rtl\vhdl\spwxmit_fast.vhd:410:37  */
  assign n101 = rtx[20]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:410:29  */
  assign n102 = ~n101;
  /* rtl\vhdl\spwxmit_fast.vhd:409:68  */
  assign n103 = n100 & n102;
  /* rtl\vhdl\spwxmit_fast.vhd:415:41  */
  assign n105 = rtx[7]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:415:58  */
  assign n106 = rtx[19]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:415:50  */
  assign n107 = ~n106;
  /* rtl\vhdl\spwxmit_fast.vhd:415:45  */
  assign n108 = n105 & n107;
  /* rtl\vhdl\spwxmit_fast.vhd:416:37  */
  assign n109 = rtx[5]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:416:29  */
  assign n110 = ~n109;
  /* rtl\vhdl\spwxmit_fast.vhd:415:67  */
  assign n111 = n108 | n110;
  /* rtl\vhdl\spwxmit_fast.vhd:421:41  */
  assign n113 = rtx[6]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:421:58  */
  assign n114 = rtx[5]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:421:50  */
  assign n115 = ~n114;
  /* rtl\vhdl\spwxmit_fast.vhd:421:46  */
  assign n116 = n113 | n115;
  /* rtl\vhdl\spwxmit_fast.vhd:422:41  */
  assign n118 = rtx[8]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:421:67  */
  assign n119 = n116 | n118;
  /* rtl\vhdl\spwxmit_fast.vhd:422:64  */
  assign n120 = rtx[19]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:422:56  */
  assign n121 = ~n120;
  /* rtl\vhdl\spwxmit_fast.vhd:422:51  */
  assign n122 = n119 & n121;
  /* rtl\vhdl\spwxmit_fast.vhd:424:28  */
  assign n124 = rtx[9]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:425:36  */
  assign n125 = rtx[10]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:425:40  */
  assign n126 = ~n125;
  /* rtl\vhdl\spwxmit_fast.vhd:425:17  */
  assign n129 = n126 ? 9'b000000101 : 9'b000000011;
  /* rtl\vhdl\spwxmit_fast.vhd:434:44  */
  assign n131 = rtx[17:10]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:434:49  */
  assign n133 = {n131, 1'b0};
  /* rtl\vhdl\spwxmit_fast.vhd:424:13  */
  assign n134 = n124 ? n129 : n133;
  assign n135 = {n134, n111, n103, n122};
  assign n136 = rtx[30:19]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:403:9  */
  assign n137 = n95 ? n135 : n136;
  /* rtl\vhdl\spwxmit_fast.vhd:439:16  */
  assign n139 = rtx[20]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:444:19  */
  assign n143 = rtx[21]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:451:32  */
  assign n147 = rtx[30:22]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:452:38  */
  assign n148 = rtx[22]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:453:42  */
  assign n149 = rtx[22]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:453:28  */
  assign n150 = ~n149;
  assign n151 = {n150, n148, n147};
  assign n152 = {1'b0, 1'b1, 9'b000000001};
  /* rtl\vhdl\spwxmit_fast.vhd:444:9  */
  assign n153 = n143 ? n152 : n151;
  assign n154 = {1'b0, 1'b1, 9'b000000111};
  /* rtl\vhdl\spwxmit_fast.vhd:439:9  */
  assign n155 = n139 ? n154 : n153;
  /* rtl\vhdl\spwxmit_fast.vhd:457:16  */
  assign n157 = rtx[66]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:458:27  */
  assign n158 = rtx[53]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:461:63  */
  assign n160 = rtx[39:31]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:462:44  */
  assign n161 = rtx[63]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:462:67  */
  assign n162 = rtx[31]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:462:53  */
  assign n163 = n161 ^ n162;
  /* rtl\vhdl\spwxmit_fast.vhd:462:35  */
  assign n164 = ~n163;
  /* rtl\vhdl\spwxmit_fast.vhd:463:37  */
  assign n165 = rtx[41]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:463:45  */
  assign n167 = {n165, 5'b00000};
  /* rtl\vhdl\spwxmit_fast.vhd:463:61  */
  assign n168 = rtx[40]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:463:55  */
  assign n169 = {n167, n168};
  /* rtl\vhdl\spwxmit_fast.vhd:463:68  */
  assign n171 = {n169, 3'b000};
  /* rtl\vhdl\spwxmit_fast.vhd:464:43  */
  assign n172 = rtx[31]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:467:50  */
  assign n173 = rtx[52:44]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:467:37  */
  assign n175 = {1'b0, n173};
  /* rtl\vhdl\spwxmit_fast.vhd:468:50  */
  assign n176 = rtx[62:54]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:468:37  */
  assign n178 = {1'b0, n176};
  /* rtl\vhdl\spwxmit_fast.vhd:469:37  */
  assign n179 = rtx[63]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:469:61  */
  assign n180 = rtx[44]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:469:46  */
  assign n181 = n179 ^ n180;
  assign n182 = {n181, n178, n175};
  assign n183 = {n172, n171, n160, n164, 1'b1};
  assign n184 = n183[0]; // extract
  assign n185 = rtx[42]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:458:13  */
  assign n186 = n158 ? n184 : n185;
  assign n187 = n183[21:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:458:13  */
  assign n188 = n158 ? n187 : n182;
  assign n189 = {n188, n186};
  assign n190 = rtx[63:42]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:457:9  */
  assign n191 = n157 ? n189 : n190;
  /* rtl\vhdl\spwxmit_fast.vhd:474:16  */
  assign n193 = rtx[66]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:475:20  */
  assign n194 = rtx[42]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:477:43  */
  assign n195 = rtx[43]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:478:48  */
  assign n196 = rtx[43]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:478:60  */
  assign n197 = rtx[64]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:478:52  */
  assign n198 = n196 ^ n197;
  /* rtl\vhdl\spwxmit_fast.vhd:478:76  */
  assign n199 = rtx[65]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:478:68  */
  assign n200 = n198 ^ n199;
  /* rtl\vhdl\spwxmit_fast.vhd:478:32  */
  assign n201 = ~n200;
  /* rtl\vhdl\spwxmit_fast.vhd:481:36  */
  assign n202 = rtx[64]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:481:52  */
  assign n203 = rtx[65]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:481:44  */
  assign n204 = n202 & n203;
  assign n206 = {1'b0, n204};
  assign n207 = {n201, n195};
  /* rtl\vhdl\spwxmit_fast.vhd:475:13  */
  assign n208 = n194 ? n207 : n206;
  assign n209 = rtx[65:64]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:474:9  */
  assign n210 = n193 ? n208 : n209;
  /* rtl\vhdl\spwxmit_fast.vhd:491:75  */
  assign n212 = rtx[69:68]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:491:89  */
  assign n214 = n212 - 2'b01;
  /* rtl\vhdl\spwxmit_fast.vhd:492:75  */
  assign n217 = rtx[71:70]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:492:111  */
  assign n218 = rtx[76]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:492:89  */
  assign n219 = {1'b0, n218};  //  uext
  /* rtl\vhdl\spwxmit_fast.vhd:492:89  */
  assign n220 = n217 - n219;
  /* rtl\vhdl\spwxmit_fast.vhd:493:75  */
  assign n222 = rtx[73:72]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:493:111  */
  assign n223 = rtx[77]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:493:89  */
  assign n224 = {1'b0, n223};  //  uext
  /* rtl\vhdl\spwxmit_fast.vhd:493:89  */
  assign n225 = n222 - n224;
  /* rtl\vhdl\spwxmit_fast.vhd:494:75  */
  assign n227 = rtx[75:74]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:494:111  */
  assign n228 = rtx[78]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:494:89  */
  assign n229 = {1'b0, n228};  //  uext
  /* rtl\vhdl\spwxmit_fast.vhd:494:89  */
  assign n230 = n227 - n229;
  /* rtl\vhdl\spwxmit_fast.vhd:496:53  */
  assign n232 = rtx[69:68]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:496:66  */
  assign n234 = n232 == 2'b00;
  /* rtl\vhdl\spwxmit_fast.vhd:497:38  */
  assign n241 = rtx[76]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:497:72  */
  assign n242 = rtx[71:70]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:497:85  */
  assign n244 = n242 == 2'b00;
  /* rtl\vhdl\spwxmit_fast.vhd:497:42  */
  assign n250 = n241 & n657;
  /* rtl\vhdl\spwxmit_fast.vhd:498:38  */
  assign n252 = rtx[77]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:498:72  */
  assign n253 = rtx[73:72]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:498:85  */
  assign n255 = n253 == 2'b00;
  /* rtl\vhdl\spwxmit_fast.vhd:498:42  */
  assign n261 = n252 & n660;
  /* rtl\vhdl\spwxmit_fast.vhd:500:55  */
  assign n263 = rtx[71:68]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:500:68  */
  assign n265 = n263 == 4'b0010;
  /* rtl\vhdl\spwxmit_fast.vhd:501:55  */
  assign n272 = rtx[75:72]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:501:68  */
  assign n274 = n272 == 4'b0000;
  assign n280 = rtx[89:81]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:503:39  */
  assign n281 = rtx[79]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:503:60  */
  assign n282 = rtx[80]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:503:43  */
  assign n283 = n281 & n282;
  /* rtl\vhdl\spwxmit_fast.vhd:503:72  */
  assign n284 = rtx[67]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:503:65  */
  assign n285 = n283 | n284;
  /* rtl\vhdl\spwxmit_fast.vhd:504:34  */
  assign n287 = rtx[89]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:504:26  */
  assign n288 = ~n287;
  /* rtl\vhdl\spwxmit_fast.vhd:504:59  */
  assign n289 = rtx[67]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:504:51  */
  assign n290 = ~n289;
  /* rtl\vhdl\spwxmit_fast.vhd:504:89  */
  assign n291 = rtx[81]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:504:73  */
  assign n292 = ~n291;
  /* rtl\vhdl\spwxmit_fast.vhd:504:69  */
  assign n293 = n290 | n292;
  /* rtl\vhdl\spwxmit_fast.vhd:504:45  */
  assign n294 = n288 & n293;
  /* rtl\vhdl\spwxmit_fast.vhd:506:16  */
  assign n295 = rtx[66]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:507:34  */
  assign n296 = rtx[88:81]; // extract
  assign n299 = {2'b00, 3'b000, n296};
  assign n300 = {n666, n663, n261, n250, n654, n230, n225, n220, n214};
  /* rtl\vhdl\spwxmit_fast.vhd:506:9  */
  assign n301 = n295 ? n299 : n300;
  /* rtl\vhdl\spwxmit_fast.vhd:513:19  */
  assign n302 = synctx[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:514:32  */
  assign n303 = r[8:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:515:32  */
  assign n304 = r[9]; // extract
  assign n305 = {n304, n303};
  /* rtl\vhdl\spwxmit_fast.vhd:513:9  */
  assign n306 = n302 ? n305 : n280;
  /* rtl\vhdl\spwxmit_fast.vhd:519:19  */
  assign n307 = synctx[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:519:24  */
  assign n308 = ~n307;
  assign n324 = {1'b0, 1'b0, 1'b0, 1'b0};
  assign n325 = {1'b1, 1'b1, 1'b1, 1'b0};
  assign n326 = {1'b0, 1'b0, 1'b1, 9'b000000111};
  assign n327 = {1'b0, 10'b0000000001};
  assign n328 = {n87, n47, n86};
  /* rtl\vhdl\spwxmit_fast.vhd:519:9  */
  assign n329 = n308 ? n324 : n328;
  assign n330 = n89[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:519:9  */
  assign n331 = n308 ? 1'b0 : n330;
  assign n332 = n137[2:0]; // extract
  assign n333 = {n332, n93};
  /* rtl\vhdl\spwxmit_fast.vhd:519:9  */
  assign n334 = n308 ? n325 : n333;
  assign n335 = n191[0]; // extract
  assign n336 = {n335, n155};
  /* rtl\vhdl\spwxmit_fast.vhd:519:9  */
  assign n337 = n308 ? n326 : n336;
  assign n338 = n191[21:11]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:519:9  */
  assign n339 = n308 ? n327 : n338;
  assign n340 = n89[12:1]; // extract
  assign n341 = n137[11:3]; // extract
  assign n343 = n191[10:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:538:19  */
  assign n344 = synctx[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:538:24  */
  assign n345 = ~n344;
  assign n353 = {8'b00000000, 1'b1, 1'b0, 1'b0, 1'b0};
  assign n354 = {1'b0, 8'b00000000};
  assign n355 = n301[7:0]; // extract
  assign n356 = {n355, n294, n285, n210};
  /* rtl\vhdl\spwxmit_fast.vhd:538:9  */
  assign n357 = n345 ? n353 : n356;
  /* rtl\vhdl\spwxmit_fast.vhd:538:9  */
  assign n358 = n345 ? n354 : n306;
  assign n359 = n301[12:8]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:551:52  */
  assign n360 = r[11:10]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:551:62  */
  assign n362 = n360 - 2'b01;
  assign n364 = r[9:0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:552:14  */
  assign n365 = r[11:10]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:552:23  */
  assign n367 = n365 == 2'b00;
  /* rtl\vhdl\spwxmit_fast.vhd:553:18  */
  assign n368 = r[12]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:553:28  */
  assign n369 = ~n368;
  /* rtl\vhdl\spwxmit_fast.vhd:558:35  */
  assign n372 = divcnt[7:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:558:59  */
  assign n374 = n372 == 7'b0000000;
  /* rtl\vhdl\spwxmit_fast.vhd:558:17  */
  assign n377 = n374 ? 1'b0 : 1'b1;
  /* rtl\vhdl\spwxmit_fast.vhd:563:38  */
  assign n378 = n0[0]; // extract
  assign n380 = {1'b1, 2'b01, n377, divcnt, n378};
  assign n381 = n380[11:0]; // extract
  assign n382 = {n362, n364};
  /* rtl\vhdl\spwxmit_fast.vhd:553:13  */
  assign n383 = n369 ? n381 : n382;
  assign n384 = n380[12]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:553:13  */
  assign n385 = n369 ? n384 : 1'b0;
  assign n386 = {n385, n383};
  assign n387 = r[12]; // extract
  assign n388 = {n387, n362, n364};
  /* rtl\vhdl\spwxmit_fast.vhd:552:9  */
  assign n389 = n367 ? n386 : n388;
  /* rtl\vhdl\spwxmit_fast.vhd:571:18  */
  assign n391 = n0[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:571:23  */
  assign n392 = ~n391;
  assign n394 = n389[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:571:9  */
  assign n395 = n392 ? 1'b0 : n394;
  assign n396 = n389[12:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:576:18  */
  assign n397 = n0[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:576:37  */
  assign n398 = r[60]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:576:31  */
  assign n399 = n398 & n397;
  assign n401 = r[40]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:576:9  */
  assign n402 = n399 ? 1'b1 : n401;
  assign n404 = r[39:13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:18  */
  assign n405 = n0[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:23  */
  assign n406 = ~n405;
  /* rtl\vhdl\spwxmit_fast.vhd:596:18  */
  assign n416 = r[39]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:596:25  */
  assign n417 = ~n416;
  /* rtl\vhdl\spwxmit_fast.vhd:597:22  */
  assign n418 = r[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:597:41  */
  assign n419 = syncsys[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:597:31  */
  assign n420 = n418 == n419;
  /* rtl\vhdl\spwxmit_fast.vhd:597:17  */
  assign n423 = n420 ? 1'b1 : 1'b0;
  /* rtl\vhdl\spwxmit_fast.vhd:601:22  */
  assign n424 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:601:41  */
  assign n425 = syncsys[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:601:31  */
  assign n426 = n424 == n425;
  /* rtl\vhdl\spwxmit_fast.vhd:601:17  */
  assign n429 = n426 ? 1'b1 : 1'b0;
  /* rtl\vhdl\spwxmit_fast.vhd:596:13  */
  assign n430 = n417 ? n423 : n429;
  /* rtl\vhdl\spwxmit_fast.vhd:607:18  */
  assign n431 = r[61]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:41  */
  assign n432 = r[51]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:35  */
  assign n433 = n432 & n431;
  /* rtl\vhdl\spwxmit_fast.vhd:613:36  */
  assign n438 = r[59:52]; // extract
  assign n440 = r[51]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n441 = n485 ? 1'b0 : n440;
  /* rtl\vhdl\spwxmit_fast.vhd:619:22  */
  assign n442 = r[60]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:619:49  */
  assign n443 = n0[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:619:67  */
  assign n444 = r[40]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:619:62  */
  assign n445 = n443 | n444;
  /* rtl\vhdl\spwxmit_fast.vhd:619:38  */
  assign n446 = n445 & n442;
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n450 = n453 ? 1'b0 : n402;
  assign n451 = r[62]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n452 = n455 ? 1'b1 : n451;
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n453 = n430 & n446;
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n455 = n430 & n446;
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n458 = n446 ? 1'b1 : 1'b0;
  /* rtl\vhdl\spwxmit_fast.vhd:619:17  */
  assign n460 = n446 ? 1'b1 : 1'b0;
  /* rtl\vhdl\spwxmit_fast.vhd:628:22  */
  assign n461 = r[61]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:628:45  */
  assign n462 = r[41]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:628:39  */
  assign n463 = n462 & n461;
  assign n466 = {10'b0000000000, n460, 1'b0};
  /* rtl\vhdl\spwxmit_fast.vhd:632:49  */
  assign n467 = n466[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:633:49  */
  assign n468 = r[50]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:634:49  */
  assign n469 = r[49:42]; // extract
  assign n471 = r[41]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:628:17  */
  assign n472 = n474 ? 1'b0 : n471;
  /* rtl\vhdl\spwxmit_fast.vhd:628:17  */
  assign n474 = n430 & n463;
  /* rtl\vhdl\spwxmit_fast.vhd:628:17  */
  assign n476 = n463 ? 1'b1 : n458;
  assign n477 = {n469, n468, n467};
  /* rtl\vhdl\spwxmit_fast.vhd:628:17  */
  assign n479 = n463 ? n477 : 10'b0000000000;
  assign n480 = {n472, n450};
  assign n481 = r[41]; // extract
  assign n482 = {n481, n402};
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n483 = n433 ? n482 : n480;
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n485 = n430 & n433;
  assign n486 = r[62]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n487 = n433 ? n486 : n452;
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n489 = n433 ? 1'b1 : n476;
  assign n490 = {n479, n460};
  assign n491 = {n438, 1'b0, 1'b0, 1'b0, 1'b1};
  assign n492 = n491[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n494 = n433 ? n492 : 1'b0;
  assign n495 = n491[11:1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:607:13  */
  assign n496 = n433 ? n495 : n490;
  /* rtl\vhdl\spwxmit_fast.vhd:644:22  */
  assign n497 = r[39]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:29  */
  assign n498 = ~n497;
  /* rtl\vhdl\spwxmit_fast.vhd:645:26  */
  assign n499 = r[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:645:45  */
  assign n500 = syncsys[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:645:35  */
  assign n501 = n499 == n500;
  /* rtl\vhdl\spwxmit_fast.vhd:646:46  */
  assign n502 = r[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:646:40  */
  assign n503 = ~n502;
  assign n504 = {n496, n494};
  assign n506 = r[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n507 = n525 ? n503 : n506;
  assign n508 = r[26:15]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n509 = n529 ? n504 : n508;
  assign n510 = r[39]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:645:21  */
  assign n511 = n501 ? 1'b1 : n510;
  /* rtl\vhdl\spwxmit_fast.vhd:651:26  */
  assign n512 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:651:45  */
  assign n513 = syncsys[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:651:35  */
  assign n514 = n512 == n513;
  /* rtl\vhdl\spwxmit_fast.vhd:652:46  */
  assign n515 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:652:40  */
  assign n516 = ~n515;
  assign n517 = {n496, n494};
  assign n519 = {1'b0, n517};
  assign n520 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:651:21  */
  assign n521 = n514 ? n516 : n520;
  assign n522 = r[39:27]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:651:21  */
  assign n523 = n514 ? n519 : n522;
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n525 = n501 & n498;
  assign n526 = r[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n527 = n498 ? n526 : n521;
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n529 = n501 & n498;
  assign n530 = n523[11:0]; // extract
  assign n531 = r[38:27]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n532 = n498 ? n531 : n530;
  assign n533 = n523[12]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:644:17  */
  assign n534 = n498 ? n511 : n533;
  assign n535 = {n534, n532, n509, n527, n507};
  /* rtl\vhdl\spwxmit_fast.vhd:643:13  */
  assign n536 = n489 ? n535 : n404;
  /* rtl\vhdl\spwxmit_fast.vhd:660:39  */
  assign n537 = n0[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:660:29  */
  assign n538 = ~n537;
  /* rtl\vhdl\spwxmit_fast.vhd:661:40  */
  assign n539 = n0[1]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:661:30  */
  assign n540 = ~n539;
  /* rtl\vhdl\spwxmit_fast.vhd:661:63  */
  assign n541 = n0[2]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:661:53  */
  assign n542 = ~n541;
  /* rtl\vhdl\spwxmit_fast.vhd:661:48  */
  assign n543 = n540 & n542;
  /* rtl\vhdl\spwxmit_fast.vhd:661:76  */
  assign n544 = r[62]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:661:70  */
  assign n545 = n543 & n544;
  /* rtl\vhdl\spwxmit_fast.vhd:664:22  */
  assign n546 = n0[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:664:42  */
  assign n547 = r[61]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:664:36  */
  assign n548 = n547 & n546;
  /* rtl\vhdl\spwxmit_fast.vhd:664:65  */
  assign n549 = r[41]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:664:75  */
  assign n550 = ~n549;
  /* rtl\vhdl\spwxmit_fast.vhd:664:59  */
  assign n551 = n550 & n548;
  /* rtl\vhdl\spwxmit_fast.vhd:666:39  */
  assign n553 = n0[14]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:666:54  */
  assign n554 = n0[22:15]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:666:46  */
  assign n555 = {n553, n554};
  assign n556 = {n555, 1'b1};
  assign n557 = n483[1]; // extract
  assign n558 = r[50:42]; // extract
  assign n559 = {n558, n557};
  /* rtl\vhdl\spwxmit_fast.vhd:664:13  */
  assign n560 = n551 ? n556 : n559;
  assign n561 = n483[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:670:22  */
  assign n562 = n0[4]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:672:38  */
  assign n564 = n0[6:5]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:672:54  */
  assign n565 = n0[12:7]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:672:46  */
  assign n566 = {n564, n565};
  assign n567 = {n566, 1'b1};
  assign n568 = r[59:52]; // extract
  assign n569 = {n568, n441};
  /* rtl\vhdl\spwxmit_fast.vhd:670:13  */
  assign n570 = n562 ? n567 : n569;
  assign n571 = {n487, n545, n538, n570, n560, n561, n536};
  assign n572 = {1'b0, 1'b0};
  assign n573 = {1'b0, 1'b0, 1'b0};
  assign n574 = {1'b0, 1'b0, 1'b0};
  assign n575 = n571[1:0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n576 = n406 ? n572 : n575;
  assign n577 = n571[25:2]; // extract
  assign n578 = r[38:15]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n579 = n406 ? n578 : n577;
  assign n580 = n571[28:26]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n581 = n406 ? n573 : n580;
  assign n582 = n571[37:29]; // extract
  assign n583 = r[50:42]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n584 = n406 ? n583 : n582;
  assign n585 = n571[38]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n586 = n406 ? 1'b0 : n585;
  assign n587 = n571[46:39]; // extract
  assign n588 = r[59:52]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n589 = n406 ? n588 : n587;
  assign n590 = n571[49:47]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:580:9  */
  assign n591 = n406 ? n574 : n590;
  assign n609 = {n591, n589, n586, n584, n581, n579, n576, n396, n395};
  /* rtl\vhdl\spwxmit_fast.vhd:678:9  */
  assign n610 = rst ? 63'b000000000000000000000000000000000000000000000000000000000000000 : n609;
  /* rtl\vhdl\spwxmit_fast.vhd:687:31  */
  assign n611 = n0[3]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:687:48  */
  assign n612 = n0[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:687:38  */
  assign n613 = n611 & n612;
  /* rtl\vhdl\spwxmit_fast.vhd:687:59  */
  assign n614 = r[60]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:687:53  */
  assign n615 = n613 & n614;
  /* rtl\vhdl\spwxmit_fast.vhd:688:32  */
  assign n616 = r[40]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:688:26  */
  assign n617 = ~n616;
  /* rtl\vhdl\spwxmit_fast.vhd:687:69  */
  assign n618 = n615 & n617;
  /* rtl\vhdl\spwxmit_fast.vhd:692:30  */
  assign n619 = n0[13]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:692:48  */
  assign n620 = n0[0]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:692:38  */
  assign n621 = n619 & n620;
  /* rtl\vhdl\spwxmit_fast.vhd:692:59  */
  assign n622 = r[61]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:692:53  */
  assign n623 = n621 & n622;
  /* rtl\vhdl\spwxmit_fast.vhd:693:31  */
  assign n624 = r[41]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:693:25  */
  assign n625 = ~n624;
  /* rtl\vhdl\spwxmit_fast.vhd:692:70  */
  assign n626 = n623 & n625;
  assign n627 = {n358, n359, n357, n339, n343, n337, n341, n334, n340, n331, n54, n329};
  /* rtl\vhdl\spwxmit_fast.vhd:705:28  */
  assign n634 = rtx[64]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:706:28  */
  assign n635 = rtx[65]; // extract
  /* rtl\vhdl\spwxmit_fast.vhd:703:9  */
  always @(posedge txclk)
    n645 <= rtxin;
  /* rtl\vhdl\spwxmit_fast.vhd:715:9  */
  always @(posedge clk)
    n646 <= rin;
  initial
    n646 = 63'b000000000000000000000000000000000000000000000000000000000000000;
  /* rtl\vhdl\spwxmit_fast.vhd:715:9  */
  assign n647 = {synctx_txdivsafe_n24, synctx_txen_n20, synctx_sysflip1_n16, synctx_sysflip0_n12, synctx_rst_n8};
  assign n648 = {syncsys_txflip1_n32, syncsys_txflip0_n28};
  /* rtl\vhdl\spwxmit_fast.vhd:703:9  */
  always @(posedge txclk)
    n649 <= n634;
  /* rtl\vhdl\spwxmit_fast.vhd:703:9  */
  always @(posedge txclk)
    n650 <= n635;
  /* rtl\vhdl\spwxmit_fast.vhd:703:9  */
  assign n651 = {n626, n618};
  /* rtl\vhdl\spwxmit_fast.vhd:496:66  */
  reg n652[1:0] ; // memory
  initial begin
    n652[1] = 1'b1;
    n652[0] = 1'b0;
    end
  assign n654 = n652[n234];
  /* rtl\vhdl\spwxmit_fast.vhd:496:66  */
  /* rtl\vhdl\spwxmit_fast.vhd:497:85  */
  reg n655[1:0] ; // memory
  initial begin
    n655[1] = 1'b1;
    n655[0] = 1'b0;
    end
  assign n657 = n655[n244];
  /* rtl\vhdl\spwxmit_fast.vhd:497:85  */
  /* rtl\vhdl\spwxmit_fast.vhd:498:85  */
  reg n658[1:0] ; // memory
  initial begin
    n658[1] = 1'b1;
    n658[0] = 1'b0;
    end
  assign n660 = n658[n255];
  /* rtl\vhdl\spwxmit_fast.vhd:498:85  */
  /* rtl\vhdl\spwxmit_fast.vhd:500:68  */
  reg n661[1:0] ; // memory
  initial begin
    n661[1] = 1'b1;
    n661[0] = 1'b0;
    end
  assign n663 = n661[n265];
  /* rtl\vhdl\spwxmit_fast.vhd:500:68  */
  /* rtl\vhdl\spwxmit_fast.vhd:501:68  */
  reg n664[1:0] ; // memory
  initial begin
    n664[1] = 1'b1;
    n664[0] = 1'b0;
    end
  assign n666 = n664[n274];
  /* rtl\vhdl\spwxmit_fast.vhd:501:68  */
endmodule

