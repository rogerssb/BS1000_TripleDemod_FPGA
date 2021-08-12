; ModuleID = 'C:/Users/dougo/LDCP_data_buffer_mult/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@write_pos = internal unnamed_addr global i16 0, align 2
@trig = internal global i12 0
@test = global i8 0, align 1
@pos_r = internal unnamed_addr global i16 0, align 2
@mux_pos = internal unnamed_addr global i1 false, align 1
@mem = internal unnamed_addr global i16 0, align 2
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@irig = internal unnamed_addr global i32 3, align 4
@ccsds_V = internal unnamed_addr global i16 0
@LDPC_buff_str = internal unnamed_addr constant [10 x i8] c"LDPC_buff\00"
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1

define internal fastcc void @write_raw_data(i8 signext %dat, [2048 x i8]* nocapture %r_dat0, [2048 x i8]* nocapture %r_dat1, [2048 x i8]* nocapture %r_dat2, [2048 x i8]* nocapture %r_dat3, [1024 x i8]* nocapture %r_dat4, [1024 x i8]* nocapture %r_dat5, [1024 x i8]* nocapture %r_dat6, [1024 x i8]* nocapture %r_dat7, [1024 x i8]* nocapture %r_dat8, [1024 x i8]* nocapture %r_dat9, [1024 x i8]* nocapture %r_dat10) {
  %dat_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %dat)
  %mem_load = load i16* @mem, align 2
  %pos_load = load i16* @pos_r, align 2
  switch i16 %mem_load, label %._crit_edge [
    i16 0, label %1
    i16 1, label %2
    i16 2, label %3
    i16 3, label %4
    i16 4, label %5
    i16 5, label %6
    i16 6, label %7
    i16 7, label %8
    i16 8, label %9
    i16 9, label %10
    i16 10, label %11
  ]

; <label>:1                                       ; preds = %0
  %tmp_1 = sext i16 %pos_load to i32
  %r_dat0_addr = getelementptr [2048 x i8]* %r_dat0, i32 0, i32 %tmp_1
  store i8 %dat_read, i8* %r_dat0_addr, align 1
  br label %._crit_edge

; <label>:2                                       ; preds = %0
  %tmp_2 = sext i16 %pos_load to i32
  %r_dat1_addr = getelementptr [2048 x i8]* %r_dat1, i32 0, i32 %tmp_2
  store i8 %dat_read, i8* %r_dat1_addr, align 1
  br label %._crit_edge

; <label>:3                                       ; preds = %0
  %tmp_3 = sext i16 %pos_load to i32
  %r_dat2_addr = getelementptr [2048 x i8]* %r_dat2, i32 0, i32 %tmp_3
  store i8 %dat_read, i8* %r_dat2_addr, align 1
  br label %._crit_edge

; <label>:4                                       ; preds = %0
  %tmp_4 = sext i16 %pos_load to i32
  %r_dat3_addr = getelementptr [2048 x i8]* %r_dat3, i32 0, i32 %tmp_4
  store i8 %dat_read, i8* %r_dat3_addr, align 1
  br label %._crit_edge

; <label>:5                                       ; preds = %0
  %tmp_5 = sext i16 %pos_load to i32
  %r_dat4_addr = getelementptr [1024 x i8]* %r_dat4, i32 0, i32 %tmp_5
  store i8 %dat_read, i8* %r_dat4_addr, align 1
  br label %._crit_edge

; <label>:6                                       ; preds = %0
  %tmp_6 = sext i16 %pos_load to i32
  %r_dat5_addr = getelementptr [1024 x i8]* %r_dat5, i32 0, i32 %tmp_6
  store i8 %dat_read, i8* %r_dat5_addr, align 1
  br label %._crit_edge

; <label>:7                                       ; preds = %0
  %tmp_7 = sext i16 %pos_load to i32
  %r_dat6_addr = getelementptr [1024 x i8]* %r_dat6, i32 0, i32 %tmp_7
  store i8 %dat_read, i8* %r_dat6_addr, align 1
  br label %._crit_edge

; <label>:8                                       ; preds = %0
  %tmp_8 = sext i16 %pos_load to i32
  %r_dat7_addr = getelementptr [1024 x i8]* %r_dat7, i32 0, i32 %tmp_8
  store i8 %dat_read, i8* %r_dat7_addr, align 1
  br label %._crit_edge

; <label>:9                                       ; preds = %0
  %tmp_9 = sext i16 %pos_load to i32
  %r_dat8_addr = getelementptr [1024 x i8]* %r_dat8, i32 0, i32 %tmp_9
  store i8 %dat_read, i8* %r_dat8_addr, align 1
  br label %._crit_edge

; <label>:10                                      ; preds = %0
  %tmp_s = sext i16 %pos_load to i32
  %r_dat9_addr = getelementptr [1024 x i8]* %r_dat9, i32 0, i32 %tmp_s
  store i8 %dat_read, i8* %r_dat9_addr, align 1
  br label %._crit_edge

; <label>:11                                      ; preds = %0
  %tmp_10 = sext i16 %pos_load to i32
  %r_dat10_addr = getelementptr [1024 x i8]* %r_dat10, i32 0, i32 %tmp_10
  store i8 %dat_read, i8* %r_dat10_addr, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %10, %9, %8, %7, %6, %5, %4, %3, %2, %1, %0
  %tmp_11 = add i16 %pos_load, 1
  %trig_load = load i12* @trig, align 2
  %extLd = zext i12 %trig_load to i16
  %tmp_12 = icmp eq i16 %tmp_11, %extLd
  br i1 %tmp_12, label %12, label %mergeST

; <label>:12                                      ; preds = %._crit_edge
  %tmp_13 = add i16 %mem_load, 1
  store i16 %tmp_13, i16* @mem, align 2
  br label %mergeST

mergeST:                                          ; preds = %12, %._crit_edge
  %pos_new = phi i16 [ 0, %12 ], [ %tmp_11, %._crit_edge ]
  store i16 %pos_new, i16* @pos_r, align 2
  ret void
}

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_none.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i8P(i8*, i8) {
entry:
  store i8 %1, i8* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i8 @_ssdm_op_Read.ap_auto.i8(i8) {
entry:
  ret i8 %0
}

define weak i2 @_ssdm_op_Read.ap_auto.i2(i2) {
entry:
  ret i2 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_6 = trunc i16 %empty to i15
  ret i15 %empty_6
}

define weak i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_7 = trunc i32 %empty to i14
  ret i14 %empty_7
}

declare i1 @_ssdm_op_PartSelect.i1.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i8.i32(i8, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i8
  %empty_8 = shl i8 1, %empty
  %empty_9 = and i8 %0, %empty_8
  %empty_10 = icmp ne i8 %empty_9, 0
  ret i1 %empty_10
}

define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16
  %empty_11 = shl i16 1, %empty
  %empty_12 = and i16 %0, %empty_11
  %empty_13 = icmp ne i16 %empty_12, 0
  ret i1 %empty_13
}

define weak i1 @_ssdm_op_BitSelect.i1.i14.i32(i14, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i14
  %empty_14 = shl i14 1, %empty
  %empty_15 = and i14 %0, %empty_14
  %empty_16 = icmp ne i14 %empty_15, 0
  ret i1 %empty_16
}

declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

declare void @_GLOBAL__I_a() nounwind

define void @LDPC_buff(i8 signext %data_in, i1 zeroext %reset, [2048 x i8]* %raw_dat0, [2048 x i8]* %raw_dat1, [2048 x i8]* %raw_dat2, [2048 x i8]* %raw_dat3, [1024 x i8]* %raw_dat4, [1024 x i8]* %raw_dat5, [1024 x i8]* %raw_dat6, [1024 x i8]* %raw_dat7, [1024 x i8]* %raw_dat8, [1024 x i8]* %raw_dat9, [1024 x i8]* %raw_dat10, i16 %numbits_V, i1* %overrun, i1* %full, i1 zeroext %write_r, i2 %deran_V, i1* %mux, i1 zeroext %decode_done, i1* %decode_start, i1 zeroext %decode_ready, i1 zeroext %decode_done_b, i1* %decode_start_b, i1 zeroext %decode_ready_b, i8* %deran_data, i16* %cur_write_pos_V, i1 zeroext %out_mux) {
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %data_in), !map !61
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset), !map !67
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i8]* %raw_dat0), !map !71
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i8]* %raw_dat1), !map !77
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i8]* %raw_dat2), !map !81
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i8]* %raw_dat3), !map !85
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat4), !map !89
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat5), !map !95
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat6), !map !99
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat7), !map !103
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat8), !map !107
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat9), !map !111
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i8]* %raw_dat10), !map !115
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %numbits_V), !map !119
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %overrun), !map !123
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %full), !map !127
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %write_r), !map !131
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %deran_V), !map !135
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %mux), !map !139
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %decode_done), !map !143
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %decode_start), !map !147
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %decode_ready), !map !151
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %decode_done_b), !map !155
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %decode_start_b), !map !159
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %decode_ready_b), !map !163
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %deran_data), !map !167
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %cur_write_pos_V), !map !171
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %out_mux), !map !175
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @LDPC_buff_str) nounwind
  %out_mux_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %out_mux)
  %decode_ready_b_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %decode_ready_b)
  %decode_done_b_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %decode_done_b)
  %decode_ready_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %decode_ready)
  %decode_done_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %decode_done)
  %deran_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %deran_V)
  %write_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %write_r)
  %numbits_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %numbits_V)
  %reset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %reset)
  %data_in_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %data_in)
  call void (...)* @_ssdm_op_SpecInterface(i1* %mux, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %write_pos_load = load i16* @write_pos, align 2
  %ccsds_V_load = load i16* @ccsds_V, align 2
  %mux_pos_load = load i1* @mux_pos, align 1
  br i1 %reset_read, label %1, label %_ifconv

_ifconv:                                          ; preds = %0
  store i16 -1, i16* @write_pos, align 2
  store i16 0, i16* @pos_r, align 2
  store i16 0, i16* @mem, align 2
  %tmp_14 = icmp eq i16 %numbits_V_read, 1536
  %tmp_15 = icmp eq i16 %numbits_V_read, 6144
  %tmp_16 = icmp eq i16 %numbits_V_read, 8192
  %sel_tmp2 = icmp ne i16 %numbits_V_read, 5120
  %sel_tmp3 = icmp ne i16 %numbits_V_read, 2048
  %sel_tmp4 = and i1 %sel_tmp2, %sel_tmp3
  %sel_tmp5 = and i1 %sel_tmp4, %tmp_14
  %sel_tmp = xor i1 %tmp_14, true
  %tmp = and i1 %tmp_15, %sel_tmp
  %sel_tmp1 = and i1 %tmp, %sel_tmp4
  %sel_tmp6 = icmp eq i16 %numbits_V_read, 5120
  %sel_tmp7 = icmp eq i16 %numbits_V_read, 2048
  %sel_tmp8 = or i1 %sel_tmp6, %sel_tmp7
  %newSel_cast_cast = select i1 %sel_tmp8, i12 512, i12 1024
  %or_cond = or i1 %sel_tmp8, %sel_tmp1
  %newSel = select i1 %sel_tmp5, i12 256, i12 -2048
  %or_cond1 = or i1 %sel_tmp5, %tmp_16
  %newSel1 = select i1 %or_cond, i12 %newSel_cast_cast, i12 %newSel
  %or_cond2 = or i1 %or_cond, %or_cond1
  %newSel2 = select i1 %or_cond2, i12 %newSel1, i12 128
  store i12 %newSel2, i12* @trig, align 2
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 false)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %full, i1 false)
  store i1 %out_mux_read, i1* @mux_pos, align 1
  call void @_ssdm_op_Write.ap_none.i1P(i1* %mux, i1 %out_mux_read)
  br label %._crit_edge341

; <label>:1                                       ; preds = %0
  br i1 %write_read, label %2, label %._crit_edge341

; <label>:2                                       ; preds = %1
  %tmp_s = add i16 %write_pos_load, 1
  store i16 %tmp_s, i16* @write_pos, align 2
  %irig_load = load i32* @irig, align 4
  switch i2 %deran_V_read, label %20 [
    i2 1, label %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14
    i2 -2, label %8
    i2 -1, label %14
  ]

_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14: ; preds = %2
  %r_V_6 = trunc i16 %ccsds_V_load to i1
  %tmp_4 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ccsds_V_load, i32 3)
  %tmp_8 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ccsds_V_load, i32 5)
  %r_V_7 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ccsds_V_load, i32 7)
  %tmp1 = xor i1 %r_V_7, %r_V_6
  %r_V_s = xor i1 %tmp_8, %tmp_4
  %new_bit = xor i1 %r_V_s, %tmp1
  %data_in_assign = sub i8 0, %data_in_read
  %irig_data = select i1 %r_V_6, i8 %data_in_assign, i8 %data_in_read
  call fastcc void @write_raw_data(i8 signext %irig_data, [2048 x i8]* %raw_dat0, [2048 x i8]* %raw_dat1, [2048 x i8]* %raw_dat2, [2048 x i8]* %raw_dat3, [1024 x i8]* %raw_dat4, [1024 x i8]* %raw_dat5, [1024 x i8]* %raw_dat6, [1024 x i8]* %raw_dat7, [1024 x i8]* %raw_dat8, [1024 x i8]* %raw_dat9, [1024 x i8]* %raw_dat10)
  %tmp_21_cast = sext i16 %tmp_s to i17
  %lhs_V_2_cast = zext i16 %numbits_V_read to i17
  %r_V_3 = add i17 -1, %lhs_V_2_cast
  %tmp_18 = icmp eq i17 %tmp_21_cast, %r_V_3
  br i1 %tmp_18, label %3, label %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge

; <label>:3                                       ; preds = %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %full, i1 true)
  br i1 %mux_pos_load, label %6, label %4

; <label>:4                                       ; preds = %3
  br i1 %decode_done_b_read, label %._crit_edge342, label %5

; <label>:5                                       ; preds = %4
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge342

._crit_edge342:                                   ; preds = %5, %4
  br label %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge

; <label>:6                                       ; preds = %3
  br i1 %decode_done_read, label %._crit_edge343, label %7

; <label>:7                                       ; preds = %6
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge343

._crit_edge343:                                   ; preds = %7, %6
  br label %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge

_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge: ; preds = %._crit_edge343, %._crit_edge342, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14
  %decode_start_flag_1 = phi i1 [ false, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14 ], [ false, %._crit_edge343 ], [ true, %._crit_edge342 ]
  %decode_start_b_flag_1 = phi i1 [ false, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14 ], [ true, %._crit_edge343 ], [ false, %._crit_edge342 ]
  %p_4 = or i16 %ccsds_V_load, 256
  %tmp_1 = call i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16 %p_4, i32 1, i32 15)
  %tmp_6 = call i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16 %ccsds_V_load, i32 1, i32 15)
  %tmp_7 = select i1 %new_bit, i15 %tmp_1, i15 %tmp_6
  br label %._crit_edge352

; <label>:8                                       ; preds = %2
  %tmp_10 = trunc i32 %irig_load to i14
  %tmp_3 = call i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32 %irig_load, i32 1, i32 14)
  %tmp_25_cast = xor i14 %tmp_10, %tmp_3
  %tmp_11 = call i1 @_ssdm_op_BitSelect.i1.i14.i32(i14 %tmp_25_cast, i32 13)
  %data_in_assign_1 = sub i8 0, %data_in_read
  %data_in_s = select i1 %tmp_11, i8 %data_in_assign_1, i8 %data_in_read
  call fastcc void @write_raw_data(i8 signext %data_in_s, [2048 x i8]* %raw_dat0, [2048 x i8]* %raw_dat1, [2048 x i8]* %raw_dat2, [2048 x i8]* %raw_dat3, [1024 x i8]* %raw_dat4, [1024 x i8]* %raw_dat5, [1024 x i8]* %raw_dat6, [1024 x i8]* %raw_dat7, [1024 x i8]* %raw_dat8, [1024 x i8]* %raw_dat9, [1024 x i8]* %raw_dat10)
  %tmp_27_cast = sext i16 %tmp_s to i17
  %lhs_V_3_cast = zext i16 %numbits_V_read to i17
  %r_V_4 = add i17 -1, %lhs_V_3_cast
  %tmp_19 = icmp eq i17 %tmp_27_cast, %r_V_4
  br i1 %tmp_19, label %9, label %._crit_edge344

; <label>:9                                       ; preds = %8
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %full, i1 true)
  br i1 %mux_pos_load, label %12, label %10

; <label>:10                                      ; preds = %9
  br i1 %decode_done_b_read, label %._crit_edge345, label %11

; <label>:11                                      ; preds = %10
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge345

._crit_edge345:                                   ; preds = %11, %10
  br label %._crit_edge344

; <label>:12                                      ; preds = %9
  br i1 %decode_done_read, label %._crit_edge346, label %13

; <label>:13                                      ; preds = %12
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge346

._crit_edge346:                                   ; preds = %13, %12
  br label %._crit_edge344

._crit_edge344:                                   ; preds = %._crit_edge346, %._crit_edge345, %8
  %decode_start_flag_3 = phi i1 [ false, %8 ], [ false, %._crit_edge346 ], [ true, %._crit_edge345 ]
  %decode_start_b_flag_3 = phi i1 [ false, %8 ], [ true, %._crit_edge346 ], [ false, %._crit_edge345 ]
  %tmp_21 = shl i32 %irig_load, 1
  %tmp_22 = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %data_in_read, i32 7)
  %tmp_23 = or i32 %tmp_21, 1
  %storemerge2 = select i1 %tmp_22, i32 %tmp_23, i32 %tmp_21
  store i32 %storemerge2, i32* @irig, align 4
  br label %._crit_edge352

; <label>:14                                      ; preds = %2
  %tmp_12 = trunc i32 %irig_load to i14
  %tmp_5 = call i14 @_ssdm_op_PartSelect.i14.i32.i32.i32(i32 %irig_load, i32 1, i32 14)
  %tmp_31_cast = xor i14 %tmp_12, %tmp_5
  %tmp_13 = call i1 @_ssdm_op_BitSelect.i1.i14.i32(i14 %tmp_31_cast, i32 13)
  %data_in_assign_2 = sub i8 0, %data_in_read
  %data_in_1 = select i1 %tmp_13, i8 %data_in_assign_2, i8 %data_in_read
  call fastcc void @write_raw_data(i8 signext %data_in_1, [2048 x i8]* %raw_dat0, [2048 x i8]* %raw_dat1, [2048 x i8]* %raw_dat2, [2048 x i8]* %raw_dat3, [1024 x i8]* %raw_dat4, [1024 x i8]* %raw_dat5, [1024 x i8]* %raw_dat6, [1024 x i8]* %raw_dat7, [1024 x i8]* %raw_dat8, [1024 x i8]* %raw_dat9, [1024 x i8]* %raw_dat10)
  %tmp_33_cast = sext i16 %tmp_s to i17
  %lhs_V_4_cast = zext i16 %numbits_V_read to i17
  %r_V_5 = add i17 -1, %lhs_V_4_cast
  %tmp_20 = icmp eq i17 %tmp_33_cast, %r_V_5
  br i1 %tmp_20, label %15, label %._crit_edge348

; <label>:15                                      ; preds = %14
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %full, i1 true)
  br i1 %mux_pos_load, label %18, label %16

; <label>:16                                      ; preds = %15
  br i1 %decode_done_b_read, label %._crit_edge349, label %17

; <label>:17                                      ; preds = %16
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge349

._crit_edge349:                                   ; preds = %17, %16
  br label %._crit_edge348

; <label>:18                                      ; preds = %15
  br i1 %decode_done_read, label %._crit_edge350, label %19

; <label>:19                                      ; preds = %18
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge350

._crit_edge350:                                   ; preds = %19, %18
  br label %._crit_edge348

._crit_edge348:                                   ; preds = %._crit_edge350, %._crit_edge349, %14
  %decode_start_flag_5 = phi i1 [ false, %14 ], [ false, %._crit_edge350 ], [ true, %._crit_edge349 ]
  %decode_start_b_flag_5 = phi i1 [ false, %14 ], [ true, %._crit_edge350 ], [ false, %._crit_edge349 ]
  %tmp_24 = shl i32 %irig_load, 1
  %tmp_25 = icmp sgt i8 %data_in_read, 0
  %tmp_26 = or i32 %tmp_24, 1
  %storemerge3 = select i1 %tmp_25, i32 %tmp_26, i32 %tmp_24
  store i32 %storemerge3, i32* @irig, align 4
  br label %._crit_edge352

; <label>:20                                      ; preds = %2
  call fastcc void @write_raw_data(i8 signext %data_in_read, [2048 x i8]* %raw_dat0, [2048 x i8]* %raw_dat1, [2048 x i8]* %raw_dat2, [2048 x i8]* %raw_dat3, [1024 x i8]* %raw_dat4, [1024 x i8]* %raw_dat5, [1024 x i8]* %raw_dat6, [1024 x i8]* %raw_dat7, [1024 x i8]* %raw_dat8, [1024 x i8]* %raw_dat9, [1024 x i8]* %raw_dat10)
  %tmp_15_cast = sext i16 %tmp_s to i17
  %lhs_V_cast = zext i16 %numbits_V_read to i17
  %r_V = add i17 %lhs_V_cast, -1
  %tmp_17 = icmp eq i17 %tmp_15_cast, %r_V
  br i1 %tmp_17, label %21, label %._crit_edge352

; <label>:21                                      ; preds = %20
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %full, i1 true)
  br i1 %mux_pos_load, label %24, label %22

; <label>:22                                      ; preds = %21
  br i1 %decode_done_b_read, label %._crit_edge353, label %23

; <label>:23                                      ; preds = %22
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge353

._crit_edge353:                                   ; preds = %23, %22
  br label %._crit_edge352

; <label>:24                                      ; preds = %21
  br i1 %decode_done_read, label %._crit_edge354, label %25

; <label>:25                                      ; preds = %24
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %overrun, i1 true)
  br label %._crit_edge354

._crit_edge354:                                   ; preds = %25, %24
  br label %._crit_edge352

._crit_edge352:                                   ; preds = %._crit_edge354, %._crit_edge353, %20, %._crit_edge348, %._crit_edge344, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge
  %ccsds_V_flag = phi i1 [ false, %._crit_edge348 ], [ false, %._crit_edge344 ], [ true, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge ], [ false, %._crit_edge353 ], [ false, %._crit_edge354 ], [ false, %20 ]
  %ccsds_V_new = phi i15 [ undef, %._crit_edge348 ], [ undef, %._crit_edge344 ], [ %tmp_7, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge ], [ undef, %._crit_edge353 ], [ undef, %._crit_edge354 ], [ undef, %20 ]
  %decode_start_flag_8 = phi i1 [ %decode_start_flag_5, %._crit_edge348 ], [ %decode_start_flag_3, %._crit_edge344 ], [ %decode_start_flag_1, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge ], [ true, %._crit_edge353 ], [ false, %._crit_edge354 ], [ false, %20 ]
  %decode_start_b_flag_8 = phi i1 [ %decode_start_b_flag_5, %._crit_edge348 ], [ %decode_start_b_flag_3, %._crit_edge344 ], [ %decode_start_b_flag_1, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge ], [ false, %._crit_edge353 ], [ true, %._crit_edge354 ], [ false, %20 ]
  %p_3 = phi i8 [ %data_in_1, %._crit_edge348 ], [ %data_in_s, %._crit_edge344 ], [ %irig_data, %_ZrsILi32ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit14._crit_edge ], [ %data_in_read, %._crit_edge353 ], [ %data_in_read, %._crit_edge354 ], [ %data_in_read, %20 ]
  %ccsds_V_new_cast = zext i15 %ccsds_V_new to i16
  call void @_ssdm_op_Write.ap_auto.i8P(i8* %deran_data, i8 %p_3)
  br label %._crit_edge341

._crit_edge341:                                   ; preds = %._crit_edge352, %1, %_ifconv
  %val_assign = phi i16 [ -1, %_ifconv ], [ %tmp_s, %._crit_edge352 ], [ %write_pos_load, %1 ]
  %ccsds_V_flag_2 = phi i1 [ true, %_ifconv ], [ %ccsds_V_flag, %._crit_edge352 ], [ false, %1 ]
  %ccsds_V_new_2 = phi i16 [ 255, %_ifconv ], [ %ccsds_V_new_cast, %._crit_edge352 ], [ undef, %1 ]
  %decode_start_flag_s = phi i1 [ false, %_ifconv ], [ %decode_start_flag_8, %._crit_edge352 ], [ false, %1 ]
  %decode_start_b_flag_s = phi i1 [ false, %_ifconv ], [ %decode_start_b_flag_8, %._crit_edge352 ], [ false, %1 ]
  br i1 %ccsds_V_flag_2, label %mergeST, label %.new

mergeST:                                          ; preds = %._crit_edge341
  store i16 %ccsds_V_new_2, i16* @ccsds_V, align 2
  br label %.new

.new:                                             ; preds = %mergeST, %._crit_edge341
  %decode_start_flag_2 = or i1 %decode_start_flag_s, %decode_ready_read
  %not_decode_ready = xor i1 %decode_ready_read, true
  br i1 %decode_start_flag_2, label %mergeST1, label %._crit_edge355.new

mergeST1:                                         ; preds = %.new
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %decode_start, i1 %not_decode_ready)
  br label %._crit_edge355.new

._crit_edge355.new:                               ; preds = %mergeST1, %.new
  %decode_start_b_flag_2 = or i1 %decode_start_b_flag_s, %decode_ready_b_read
  %not_decode_ready_b = xor i1 %decode_ready_b_read, true
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %cur_write_pos_V, i16 %val_assign)
  br i1 %decode_start_b_flag_2, label %mergeST2, label %._crit_edge356.new

mergeST2:                                         ; preds = %._crit_edge355.new
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %decode_start_b, i1 %not_decode_ready_b)
  br label %._crit_edge356.new

._crit_edge356.new:                               ; preds = %mergeST2, %._crit_edge355.new
  ret void
}

!opencl.kernels = !{!0, !7, !13, !13, !19, !19, !25, !25, !28, !19, !34, !34, !36, !38, !38, !19, !40, !19, !19, !25, !25, !19, !36, !40, !19, !19, !19, !34, !34, !25, !25, !42, !19, !36, !40, !19, !44, !44, !45, !28, !48, !19, !19}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!49, !56}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 1, i32 0, i32 0, i32 1, i32 0, i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int8_t", metadata !"_Bool", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"tab_int", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool", metadata !"tab_2_int", metadata !"_Bool*", metadata !"_Bool", metadata !"_Bool*", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool*", metadata !"_Bool", metadata !"int8_t*", metadata !"tab_int*", metadata !"_Bool"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"data_in", metadata !"reset", metadata !"raw_dat0", metadata !"raw_dat1", metadata !"raw_dat2", metadata !"raw_dat3", metadata !"raw_dat4", metadata !"raw_dat5", metadata !"raw_dat6", metadata !"raw_dat7", metadata !"raw_dat8", metadata !"raw_dat9", metadata !"raw_dat10", metadata !"numbits", metadata !"overrun", metadata !"full", metadata !"write", metadata !"deran", metadata !"mux", metadata !"decode_done", metadata !"decode_start", metadata !"decode_ready", metadata !"decode_done_b", metadata !"decode_start_b", metadata !"decode_ready_b", metadata !"deran_data", metadata !"cur_write_pos", metadata !"out_mux"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int8_t", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*", metadata !"int8_t*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"dat", metadata !"r_dat0", metadata !"r_dat1", metadata !"r_dat2", metadata !"r_dat3", metadata !"r_dat4", metadata !"r_dat5", metadata !"r_dat6", metadata !"r_dat7", metadata !"r_dat8", metadata !"r_dat9", metadata !"r_dat10"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"short"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space"}
!21 = metadata !{metadata !"kernel_arg_access_qual"}
!22 = metadata !{metadata !"kernel_arg_type"}
!23 = metadata !{metadata !"kernel_arg_type_qual"}
!24 = metadata !{metadata !"kernel_arg_name"}
!25 = metadata !{null, metadata !14, metadata !15, metadata !26, metadata !17, metadata !27, metadata !6}
!26 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!28 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !6}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"int"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!34 = metadata !{null, metadata !14, metadata !15, metadata !35, metadata !17, metadata !27, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!36 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !37, metadata !6}
!37 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!38 = metadata !{null, metadata !14, metadata !15, metadata !39, metadata !17, metadata !27, metadata !6}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!40 = metadata !{null, metadata !29, metadata !30, metadata !41, metadata !32, metadata !33, metadata !6}
!41 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"const ap_int_base<32, true> &"}
!42 = metadata !{null, metadata !29, metadata !30, metadata !43, metadata !32, metadata !33, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"int"}
!44 = metadata !{null, metadata !14, metadata !15, metadata !39, metadata !17, metadata !18, metadata !6}
!45 = metadata !{null, metadata !14, metadata !15, metadata !46, metadata !17, metadata !47, metadata !6}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<16> &"}
!47 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!48 = metadata !{null, metadata !14, metadata !15, metadata !35, metadata !17, metadata !47, metadata !6}
!49 = metadata !{metadata !50, i8* @test}
!50 = metadata !{metadata !51}
!51 = metadata !{i32 0, i32 7, metadata !52}
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !"test", metadata !54, metadata !"signed char", i32 0, i32 7}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 0, i32 0, i32 1}
!56 = metadata !{metadata !57, [1 x i32]* @llvm_global_ctors_0}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 31, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"llvm.global_ctors.0", metadata !54, metadata !"", i32 0, i32 31}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 7, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"data_in", metadata !65, metadata !"signed char", i32 0, i32 7}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 0, i32 0, i32 0}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 0, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"reset", metadata !65, metadata !"bool", i32 0, i32 0}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 0, i32 7, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"raw_dat0", metadata !75, metadata !"signed char", i32 0, i32 7}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 0, i32 2047, i32 1}
!77 = metadata !{metadata !78}
!78 = metadata !{i32 0, i32 7, metadata !79}
!79 = metadata !{metadata !80}
!80 = metadata !{metadata !"raw_dat1", metadata !75, metadata !"signed char", i32 0, i32 7}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 0, i32 7, metadata !83}
!83 = metadata !{metadata !84}
!84 = metadata !{metadata !"raw_dat2", metadata !75, metadata !"signed char", i32 0, i32 7}
!85 = metadata !{metadata !86}
!86 = metadata !{i32 0, i32 7, metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !"raw_dat3", metadata !75, metadata !"signed char", i32 0, i32 7}
!89 = metadata !{metadata !90}
!90 = metadata !{i32 0, i32 7, metadata !91}
!91 = metadata !{metadata !92}
!92 = metadata !{metadata !"raw_dat4", metadata !93, metadata !"signed char", i32 0, i32 7}
!93 = metadata !{metadata !94}
!94 = metadata !{i32 0, i32 1023, i32 1}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 0, i32 7, metadata !97}
!97 = metadata !{metadata !98}
!98 = metadata !{metadata !"raw_dat5", metadata !93, metadata !"signed char", i32 0, i32 7}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 0, i32 7, metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !"raw_dat6", metadata !93, metadata !"signed char", i32 0, i32 7}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 0, i32 7, metadata !105}
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !"raw_dat7", metadata !93, metadata !"signed char", i32 0, i32 7}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 0, i32 7, metadata !109}
!109 = metadata !{metadata !110}
!110 = metadata !{metadata !"raw_dat8", metadata !93, metadata !"signed char", i32 0, i32 7}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 0, i32 7, metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{metadata !"raw_dat9", metadata !93, metadata !"signed char", i32 0, i32 7}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 0, i32 7, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"raw_dat10", metadata !93, metadata !"signed char", i32 0, i32 7}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 0, i32 15, metadata !121}
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !"numbits.V", metadata !65, metadata !"uint16", i32 0, i32 15}
!123 = metadata !{metadata !124}
!124 = metadata !{i32 0, i32 0, metadata !125}
!125 = metadata !{metadata !126}
!126 = metadata !{metadata !"overrun", metadata !54, metadata !"bool", i32 0, i32 0}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 0, i32 0, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"full", metadata !54, metadata !"bool", i32 0, i32 0}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 0, i32 0, metadata !133}
!133 = metadata !{metadata !134}
!134 = metadata !{metadata !"write", metadata !65, metadata !"bool", i32 0, i32 0}
!135 = metadata !{metadata !136}
!136 = metadata !{i32 0, i32 1, metadata !137}
!137 = metadata !{metadata !138}
!138 = metadata !{metadata !"deran.V", metadata !65, metadata !"uint2", i32 0, i32 1}
!139 = metadata !{metadata !140}
!140 = metadata !{i32 0, i32 0, metadata !141}
!141 = metadata !{metadata !142}
!142 = metadata !{metadata !"mux", metadata !54, metadata !"bool", i32 0, i32 0}
!143 = metadata !{metadata !144}
!144 = metadata !{i32 0, i32 0, metadata !145}
!145 = metadata !{metadata !146}
!146 = metadata !{metadata !"decode_done", metadata !65, metadata !"bool", i32 0, i32 0}
!147 = metadata !{metadata !148}
!148 = metadata !{i32 0, i32 0, metadata !149}
!149 = metadata !{metadata !150}
!150 = metadata !{metadata !"decode_start", metadata !54, metadata !"bool", i32 0, i32 0}
!151 = metadata !{metadata !152}
!152 = metadata !{i32 0, i32 0, metadata !153}
!153 = metadata !{metadata !154}
!154 = metadata !{metadata !"decode_ready", metadata !65, metadata !"bool", i32 0, i32 0}
!155 = metadata !{metadata !156}
!156 = metadata !{i32 0, i32 0, metadata !157}
!157 = metadata !{metadata !158}
!158 = metadata !{metadata !"decode_done_b", metadata !65, metadata !"bool", i32 0, i32 0}
!159 = metadata !{metadata !160}
!160 = metadata !{i32 0, i32 0, metadata !161}
!161 = metadata !{metadata !162}
!162 = metadata !{metadata !"decode_start_b", metadata !54, metadata !"bool", i32 0, i32 0}
!163 = metadata !{metadata !164}
!164 = metadata !{i32 0, i32 0, metadata !165}
!165 = metadata !{metadata !166}
!166 = metadata !{metadata !"decode_ready_b", metadata !65, metadata !"bool", i32 0, i32 0}
!167 = metadata !{metadata !168}
!168 = metadata !{i32 0, i32 7, metadata !169}
!169 = metadata !{metadata !170}
!170 = metadata !{metadata !"deran_data", metadata !54, metadata !"signed char", i32 0, i32 7}
!171 = metadata !{metadata !172}
!172 = metadata !{i32 0, i32 15, metadata !173}
!173 = metadata !{metadata !174}
!174 = metadata !{metadata !"cur_write_pos.V", metadata !54, metadata !"uint16", i32 0, i32 15}
!175 = metadata !{metadata !176}
!176 = metadata !{i32 0, i32 0, metadata !177}
!177 = metadata !{metadata !178}
!178 = metadata !{metadata !"out_mux", metadata !65, metadata !"bool", i32 0, i32 0}
