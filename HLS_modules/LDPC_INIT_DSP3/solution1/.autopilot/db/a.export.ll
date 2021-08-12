; ModuleID = 'C:/Users/dougo/LDPC_INIT_DSP3/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@etaIndexM_1024_45_V = constant i24 1193046
@lambdaIndexM_1024_45_V = constant i24 1193046
@etaIndexN_1024_45_V = constant i24 1193046
@etaIndexM_1024_23_V = constant i24 1193046
@lambdaIndexM_1024_23_V = constant i24 1193046
@etaIndexN_1024_23_V = constant i24 1193046
@etaIndexM_1024_12_V = constant i24 1193046
@lambdaIndexM_1024_12_V = constant i24 1193046
@etaIndexN_1024_12_V = constant i24 1193046
@etaIndexM_4096_45_V = constant i24 1193046
@lambdaIndexM_4096_45_V = constant i24 1193046
@etaIndexN_4096_45_V = constant i24 1193046
@etaIndexM_4096_23_V = constant i24 1193046
@lambdaIndexM_4096_23_V = constant i24 1193046
@etaIndexN_4096_23_V = constant i24 1193046
@etaIndexM_4096_12_V = constant i24 1193046
@lambdaIndexM_4096_12_V = constant i24 1193046
@etaIndexN_4096_12_V = constant i24 1193046
@p_str = private unnamed_addr constant [8 x i8] c"ap_ovld\00", align 1
@p_str19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@clk = external global i1
@cs = external global i1
@dout = external global i1
@din = external global i1
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@setupLDPC_str = internal unnamed_addr constant [10 x i8] c"setupLDPC\00"

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

declare void @_GLOBAL__I_a() nounwind

define void @setupLDPC(i2 %size_V, i2 %rate_V, i16* %nR_M_V, i16* %etaIndexM_M_V, i16* %etaIndexN_M_V, i16* %pCodeM_V, i16* %pMaxIterations_V, [36864 x i16]* %etaIndexM_V, [40960 x i16]* %etaIndexN_V, [36864 x i16]* %lambdaIndexM_V) {
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %size_V), !map !27
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %rate_V), !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %nR_M_V), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %etaIndexM_M_V), !map !41
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %etaIndexN_M_V), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %pCodeM_V), !map !49
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %pMaxIterations_V), !map !53
  call void (...)* @_ssdm_op_SpecBitsMap([36864 x i16]* %etaIndexM_V), !map !57
  call void (...)* @_ssdm_op_SpecBitsMap([40960 x i16]* %etaIndexN_V), !map !63
  call void (...)* @_ssdm_op_SpecBitsMap([36864 x i16]* %lambdaIndexM_V), !map !69
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @setupLDPC_str) nounwind
  %rate_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %rate_V)
  %size_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %size_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* %nR_M_V, [8 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str19, [1 x i8]* @p_str19, [1 x i8]* @p_str19) nounwind
  %tmp_cast2 = zext i2 %size_V_read to i5
  %p_shl = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %size_V_read, i2 0)
  %p_shl_cast = zext i4 %p_shl to i5
  %tmp_1 = sub i5 %p_shl_cast, %tmp_cast2
  %tmp_2_cast = zext i2 %rate_V_read to i3
  %tmp1 = add i3 %tmp_2_cast, -3
  %tmp1_cast = sext i3 %tmp1 to i5
  %mode = add i5 %tmp_1, %tmp1_cast
  switch i5 %mode, label %._crit_edge [
    i5 3, label %1
    i5 2, label %2
    i5 1, label %3
    i5 6, label %4
    i5 5, label %5
    i5 4, label %6
  ]

; <label>:1                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 5376, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 5376, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 6400, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 1408)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 5376)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 6400)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 384)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 50)
  br label %._crit_edge

; <label>:2                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 6656, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 6656, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 7680, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 1792)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 6656)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 7680)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 768)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 50)
  br label %._crit_edge

; <label>:3                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 9216, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 9216, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 10240, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 2560)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 9216)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 10240)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 1536)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 50)
  br label %._crit_edge

; <label>:4                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 21504, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 21504, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 25600, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 5632)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 21504)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 25600)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 1536)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 100)
  br label %._crit_edge

; <label>:5                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 26624, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 26624, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 30720, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 7168)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 26624)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 30720)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 3072)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 50)
  br label %._crit_edge

; <label>:6                                       ; preds = %0
  call fastcc void @setupLDPC_load_etaIndexM(i17 36864, [36864 x i16]* %etaIndexM_V)
  call fastcc void @setupLDPC_load_lambdaIndexM(i17 36864, [40960 x i16]* %etaIndexN_V)
  call fastcc void @setupLDPC_load_etaIndexN(i17 40960, [36864 x i16]* %lambdaIndexM_V)
  call void @_ssdm_op_Write.ap_ovld.i16P(i16* %nR_M_V, i16 10240)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexM_M_V, i16 -28672)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %etaIndexN_M_V, i16 -24576)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pCodeM_V, i16 6144)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %pMaxIterations_V, i16 50)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %5, %4, %3, %2, %1, %0
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define internal fastcc void @setupLDPC_load_etaIndexN(i17 %num, [36864 x i16]* nocapture %etaIndexN_V) {
  %num_read = call i17 @_ssdm_op_Read.ap_auto.i17(i17 %num)
  br label %1

; <label>:1                                       ; preds = %2, %0
  %loop = phi i4 [ 0, %0 ], [ %loop_3, %2 ]
  %read = phi i8 [ 3, %0 ], [ %read_1, %2 ]
  %exitcond5 = icmp eq i4 %loop, -8
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8)
  %loop_3 = add i4 %loop, 1
  br i1 %exitcond5, label %.preheader110, label %2

; <label>:2                                       ; preds = %1
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %read, i32 7)
  store i1 %tmp, i1* @dout, align 1
  %read_1 = shl i8 %read, 1
  br label %1

.preheader110:                                    ; preds = %1, %3
  %loop_1 = phi i5 [ %loop_4, %3 ], [ 0, %1 ]
  %exitcond6 = icmp eq i5 %loop_1, -8
  %empty_2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24)
  %loop_4 = add i5 %loop_1, 1
  br i1 %exitcond6, label %.preheader109, label %3

; <label>:3                                       ; preds = %.preheader110
  store i1 false, i1* @dout, align 1
  br label %.preheader110

.preheader109:                                    ; preds = %.preheader110, %4
  %pos = phi i16 [ %pos_1, %4 ], [ 0, %.preheader110 ]
  %pos_cast = zext i16 %pos to i17
  %tmp_3 = icmp slt i17 %pos_cast, %num_read
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 6400, i64 40960, i64 0)
  %pos_1 = add i16 %pos, 1
  br i1 %tmp_3, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %.preheader109
  %din_load = load i1* @din, align 1
  br label %.preheader

.preheader:                                       ; preds = %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit, %.preheader.preheader
  %p_s = phi i16 [ %data_V_2, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %loop_2 = phi i5 [ %loop_5, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %exitcond = icmp eq i5 %loop_2, -16
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16)
  %loop_5 = add i5 %loop_2, 1
  br i1 %exitcond, label %4, label %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit

_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit: ; preds = %.preheader
  %r_V = shl i16 %p_s, 1
  %data_V_1 = or i16 %r_V, 1
  %data_V_2 = select i1 %din_load, i16 %data_V_1, i16 %r_V
  br label %.preheader

; <label>:4                                       ; preds = %.preheader
  %tmp_4 = zext i16 %pos to i64
  %etaIndexN_V_addr = getelementptr [36864 x i16]* %etaIndexN_V, i64 0, i64 %tmp_4
  store i16 %p_s, i16* %etaIndexN_V_addr, align 2
  br label %.preheader109

; <label>:5                                       ; preds = %.preheader109
  store i1 true, i1* @cs, align 1
  store i1 false, i1* @clk, align 1
  ret void
}

define internal fastcc void @setupLDPC_load_lambdaIndexM(i17 %num, [40960 x i16]* nocapture %lambdaIndexM_V) {
  %num_read = call i17 @_ssdm_op_Read.ap_auto.i17(i17 %num)
  br label %1

; <label>:1                                       ; preds = %2, %0
  %loop = phi i4 [ 0, %0 ], [ %loop_6, %2 ]
  %read = phi i8 [ 3, %0 ], [ %read_2, %2 ]
  %exitcond3 = icmp eq i4 %loop, -8
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8)
  %loop_6 = add i4 %loop, 1
  br i1 %exitcond3, label %.preheader110, label %2

; <label>:2                                       ; preds = %1
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %read, i32 7)
  store i1 %tmp, i1* @dout, align 1
  %read_2 = shl i8 %read, 1
  br label %1

.preheader110:                                    ; preds = %1, %3
  %loop_1 = phi i5 [ %loop_7, %3 ], [ 0, %1 ]
  %exitcond4 = icmp eq i5 %loop_1, -8
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24)
  %loop_7 = add i5 %loop_1, 1
  br i1 %exitcond4, label %.preheader109, label %3

; <label>:3                                       ; preds = %.preheader110
  store i1 false, i1* @dout, align 1
  br label %.preheader110

.preheader109:                                    ; preds = %.preheader110, %4
  %pos = phi i16 [ %pos_2, %4 ], [ 0, %.preheader110 ]
  %pos_cast = zext i16 %pos to i17
  %tmp_1 = icmp slt i17 %pos_cast, %num_read
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5376, i64 36864, i64 0)
  %pos_2 = add i16 %pos, 1
  br i1 %tmp_1, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %.preheader109
  %din_load = load i1* @din, align 1
  br label %.preheader

.preheader:                                       ; preds = %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit, %.preheader.preheader
  %p_s = phi i16 [ %data_V_4, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %loop_2 = phi i5 [ %loop_8, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %exitcond = icmp eq i5 %loop_2, -16
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16)
  %loop_8 = add i5 %loop_2, 1
  br i1 %exitcond, label %4, label %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit

_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit: ; preds = %.preheader
  %r_V = shl i16 %p_s, 1
  %data_V_3 = or i16 %r_V, 1
  %data_V_4 = select i1 %din_load, i16 %data_V_3, i16 %r_V
  br label %.preheader

; <label>:4                                       ; preds = %.preheader
  %tmp_2 = zext i16 %pos to i64
  %lambdaIndexM_V_addr = getelementptr [40960 x i16]* %lambdaIndexM_V, i64 0, i64 %tmp_2
  store i16 %p_s, i16* %lambdaIndexM_V_addr, align 2
  br label %.preheader109

; <label>:5                                       ; preds = %.preheader109
  store i1 true, i1* @cs, align 1
  store i1 false, i1* @clk, align 1
  ret void
}

define internal fastcc void @setupLDPC_load_etaIndexM(i17 %num, [36864 x i16]* nocapture %etaIndexM_V) {
  %num_read = call i17 @_ssdm_op_Read.ap_auto.i17(i17 %num)
  br label %1

; <label>:1                                       ; preds = %2, %0
  %loop = phi i4 [ 0, %0 ], [ %loop_3, %2 ]
  %read = phi i8 [ 3, %0 ], [ %read_3, %2 ]
  %exitcond1 = icmp eq i4 %loop, -8
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8)
  %loop_3 = add i4 %loop, 1
  br i1 %exitcond1, label %.preheader110, label %2

; <label>:2                                       ; preds = %1
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %read, i32 7)
  store i1 %tmp, i1* @dout, align 1
  %read_3 = shl i8 %read, 1
  br label %1

.preheader110:                                    ; preds = %1, %3
  %loop_1 = phi i5 [ %loop_4, %3 ], [ 0, %1 ]
  %exitcond2 = icmp eq i5 %loop_1, -8
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24)
  %loop_4 = add i5 %loop_1, 1
  br i1 %exitcond2, label %.preheader109, label %3

; <label>:3                                       ; preds = %.preheader110
  store i1 false, i1* @dout, align 1
  br label %.preheader110

.preheader109:                                    ; preds = %.preheader110, %4
  %pos = phi i16 [ %pos_1, %4 ], [ 0, %.preheader110 ]
  %pos_cast = zext i16 %pos to i17
  %tmp_9 = icmp slt i17 %pos_cast, %num_read
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5376, i64 36864, i64 0)
  %pos_1 = add i16 %pos, 1
  br i1 %tmp_9, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %.preheader109
  %din_load = load i1* @din, align 1
  br label %.preheader

.preheader:                                       ; preds = %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit, %.preheader.preheader
  %p_s = phi i16 [ %data_V_2, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %loop_2 = phi i5 [ %loop_5, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ 0, %.preheader.preheader ]
  %exitcond = icmp eq i5 %loop_2, -16
  %empty_10 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16)
  %loop_5 = add i5 %loop_2, 1
  br i1 %exitcond, label %4, label %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit

_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit: ; preds = %.preheader
  %r_V = shl i16 %p_s, 1
  %data_V_1 = or i16 %r_V, 1
  %data_V_2 = select i1 %din_load, i16 %data_V_1, i16 %r_V
  br label %.preheader

; <label>:4                                       ; preds = %.preheader
  %tmp_s = zext i16 %pos to i64
  %etaIndexM_V_addr = getelementptr [36864 x i16]* %etaIndexM_V, i64 0, i64 %tmp_s
  store i16 %p_s, i16* %etaIndexM_V_addr, align 2
  br label %.preheader109

; <label>:5                                       ; preds = %.preheader109
  store i1 true, i1* @cs, align 1
  store i1 false, i1* @clk, align 1
  ret void
}

define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2, i2) nounwind readnone {
entry:
  %empty = zext i2 %0 to i4
  %empty_11 = zext i2 %1 to i4
  %empty_12 = shl i4 %empty, 2
  %empty_13 = or i4 %empty_12, %empty_11
  ret i4 %empty_13
}

define weak i2 @_ssdm_op_Read.ap_auto.i2(i2) {
entry:
  ret i2 %0
}

define weak void @_ssdm_op_Write.ap_ovld.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak i17 @_ssdm_op_Read.ap_auto.i17(i17) {
entry:
  ret i17 %0
}

define weak i1 @_ssdm_op_BitSelect.i1.i8.i32(i8, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i8
  %empty_14 = shl i8 1, %empty
  %empty_15 = and i8 %0, %empty_14
  %empty_16 = icmp ne i8 %empty_15, 0
  ret i1 %empty_16
}

declare i7 @_ssdm_op_PartSelect.i7.i8.i32.i32(i8, i32, i32) nounwind readnone

declare i8 @_ssdm_op_BitConcatenate.i8.i7.i1(i7, i1) nounwind readnone

declare i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone

declare i16 @_ssdm_op_BitConcatenate.i16.i15.i1(i15, i1) nounwind readnone

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0, !7, !12, !17, !22}

!0 = metadata !{metadata !1, i1* @clk}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 0, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"clk", metadata !5, metadata !"bool", i32 0, i32 0}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8, i1* @cs}
!8 = metadata !{metadata !9}
!9 = metadata !{i32 0, i32 0, metadata !10}
!10 = metadata !{metadata !11}
!11 = metadata !{metadata !"cs", metadata !5, metadata !"bool", i32 0, i32 0}
!12 = metadata !{metadata !13, i1* @dout}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 0, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"dout", metadata !5, metadata !"bool", i32 0, i32 0}
!17 = metadata !{metadata !18, i1* @din}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 0, i32 0, metadata !20}
!20 = metadata !{metadata !21}
!21 = metadata !{metadata !"din", metadata !5, metadata !"bool", i32 0, i32 0}
!22 = metadata !{metadata !23, [1 x i32]* @llvm_global_ctors_0}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 1, metadata !29}
!29 = metadata !{metadata !30}
!30 = metadata !{metadata !"size.V", metadata !31, metadata !"uint2", i32 0, i32 1}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 0, i32 0, i32 0}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 1, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"rate.V", metadata !31, metadata !"uint2", i32 0, i32 1}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 15, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"nR_M.V", metadata !5, metadata !"uint16", i32 0, i32 15}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 15, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"etaIndexM_M.V", metadata !5, metadata !"uint16", i32 0, i32 15}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 15, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"etaIndexN_M.V", metadata !5, metadata !"uint16", i32 0, i32 15}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 15, metadata !51}
!51 = metadata !{metadata !52}
!52 = metadata !{metadata !"pCodeM.V", metadata !5, metadata !"uint16", i32 0, i32 15}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 15, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"pMaxIterations.V", metadata !5, metadata !"uint16", i32 0, i32 15}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 15, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"etaIndexM.V", metadata !61, metadata !"uint16", i32 0, i32 15}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 36863, i32 1}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 15, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"etaIndexN.V", metadata !67, metadata !"uint16", i32 0, i32 15}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 40959, i32 1}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 0, i32 15, metadata !71}
!71 = metadata !{metadata !72}
!72 = metadata !{metadata !"lambdaIndexM.V", metadata !61, metadata !"uint16", i32 0, i32 15}
