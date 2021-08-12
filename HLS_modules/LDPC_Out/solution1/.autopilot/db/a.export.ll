; ModuleID = 'C:/Users/dougo/LDPC_Out/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@zero = internal unnamed_addr global i1 false, align 1
@trig = internal unnamed_addr global i16 127, align 2
@read_cnt_start = internal unnamed_addr global i16 -1, align 2
@read_cnt = internal unnamed_addr global i16 0, align 2
@pos_r = internal unnamed_addr global i16 0, align 2
@mux = internal unnamed_addr global i1 true, align 1
@mem = internal unnamed_addr global i16 0, align 2
@max = internal unnamed_addr global i16 1024, align 2
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@LDPC_Out_str = internal unnamed_addr constant [9 x i8] c"LDPC_Out\00"
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

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

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

declare i13 @_ssdm_op_PartSelect.i13.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16
  %empty_2 = shl i16 1, %empty
  %empty_3 = and i16 %0, %empty_2
  %empty_4 = icmp ne i16 %empty_3, 0
  ret i1 %empty_4
}

declare void @_GLOBAL__I_a() nounwind

define void @LDPC_Out(i1* %data_out, i1 zeroext %reset, i16* %cur_read_pos_V, i16 %numbits_V, i1 zeroext %rd_clk_in, i1* %rd_mux, [2048 x i1]* %mem_out0, [2048 x i1]* %mem_out1, [1024 x i1]* %mem_out2, [1024 x i1]* %mem_out3, [1024 x i1]* %mem_out4, [1024 x i1]* %mem_out5, [1024 x i1]* %mem_out6, [1024 x i1]* %mem_out7) {
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %data_out), !map !40
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset), !map !44
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %cur_read_pos_V), !map !50
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %numbits_V), !map !54
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %rd_clk_in), !map !58
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %rd_mux), !map !62
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i1]* %mem_out0), !map !66
  call void (...)* @_ssdm_op_SpecBitsMap([2048 x i1]* %mem_out1), !map !72
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out2), !map !76
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out3), !map !82
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out4), !map !86
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out5), !map !90
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out6), !map !94
  call void (...)* @_ssdm_op_SpecBitsMap([1024 x i1]* %mem_out7), !map !98
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @LDPC_Out_str) nounwind
  %rd_clk_in_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %rd_clk_in)
  %numbits_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %numbits_V)
  %reset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %reset)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %zero_load = load i1* @zero, align 1
  %max_load = load i16* @max, align 2
  %tmp_8 = trunc i16 %max_load to i13
  %read_cnt_load = load i16* @read_cnt, align 2
  %pos_load = load i16* @pos_r, align 2
  br i1 %reset_read, label %1, label %.critedge

; <label>:1                                       ; preds = %0
  br i1 %zero_load, label %_ifconv, label %.critedge._crit_edge

_ifconv:                                          ; preds = %1
  store i1 false, i1* @zero, align 1
  %tmp = icmp eq i16 %numbits_V_read, 1280
  %tmp_2 = icmp eq i16 %numbits_V_read, 5120
  %tmp_4 = icmp eq i16 %numbits_V_read, 1536
  %tmp_5 = icmp eq i16 %numbits_V_read, 6144
  %tmp_6 = icmp eq i16 %numbits_V_read, 8192
  %storemerge1 = select i1 %tmp_6, i13 -4096, i13 1024
  %sel_tmp1 = xor i1 %tmp, true
  %sel_tmp2 = and i1 %tmp_2, %sel_tmp1
  %sel_tmp = select i1 %sel_tmp2, i13 -4096, i13 1024
  %tmp_9 = or i1 %sel_tmp2, %tmp
  %sel_tmp3 = select i1 %tmp_9, i13 %sel_tmp, i13 %storemerge1
  %sel_tmp6_demorgan = or i1 %tmp, %tmp_2
  %sel_tmp6 = xor i1 %sel_tmp6_demorgan, true
  %sel_tmp7 = and i1 %tmp_4, %sel_tmp6
  %sel_tmp13_demorgan = or i1 %sel_tmp6_demorgan, %tmp_4
  %sel_tmp4 = xor i1 %sel_tmp13_demorgan, true
  %sel_tmp5 = and i1 %tmp_5, %sel_tmp4
  %sel_tmp8 = select i1 %sel_tmp5, i13 -4096, i13 1024
  %tmp_11 = or i1 %sel_tmp5, %sel_tmp7
  %storemerge3 = select i1 %tmp_11, i13 %sel_tmp8, i13 %sel_tmp3
  %storemerge3_cast = zext i13 %storemerge3 to i16
  %newSel_cast_cast = select i1 %sel_tmp5, i10 -1, i10 255
  %newSel49_cast_cast = select i1 %sel_tmp2, i10 511, i10 127
  %newSel51_cast_cast = select i1 %tmp_6, i11 -1, i11 511
  %newSel = select i1 %tmp_11, i10 %newSel_cast_cast, i10 %newSel49_cast_cast
  %newSel53_cast = zext i10 %newSel to i11
  %or_cond2 = or i1 %tmp_11, %tmp_9
  %newSel1 = select i1 %or_cond2, i11 %newSel53_cast, i11 %newSel51_cast_cast
  %newSel55_cast = zext i11 %newSel1 to i16
  store i16 %storemerge3_cast, i16* @max, align 2
  store i16 %newSel55_cast, i16* @trig, align 2
  br label %.critedge._crit_edge

.critedge:                                        ; preds = %0
  %tmp_1 = icmp slt i16 %read_cnt_load, %max_load
  %or_cond = or i1 %zero_load, %tmp_1
  br i1 %or_cond, label %.critedge._crit_edge, label %2

; <label>:2                                       ; preds = %.critedge
  store i16 0, i16* @pos_r, align 2
  store i16 0, i16* @read_cnt, align 2
  store i16 -1, i16* @read_cnt_start, align 2
  store i16 0, i16* @mem, align 2
  store i1 true, i1* @zero, align 1
  %mux_load = load i1* @mux, align 1
  %tmp_3 = xor i1 %mux_load, true
  store i1 %tmp_3, i1* @mux, align 1
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %rd_mux, i1 %tmp_3)
  br label %._crit_edge63

.critedge._crit_edge:                             ; preds = %.critedge, %_ifconv, %1
  %max_loc_1 = phi i13 [ %tmp_8, %.critedge ], [ %storemerge3, %_ifconv ], [ %tmp_8, %1 ]
  %max_loc_1_cast = zext i13 %max_loc_1 to i16
  %tmp_7 = icmp slt i16 %read_cnt_load, %max_loc_1_cast
  %or_cond1 = and i1 %tmp_7, %rd_clk_in_read
  br i1 %or_cond1, label %3, label %._crit_edge63

; <label>:3                                       ; preds = %.critedge._crit_edge
  %read_cnt_start_load = load i16* @read_cnt_start, align 2
  %tmp_16 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %read_cnt_start_load, i32 15)
  br i1 %tmp_16, label %7, label %_ifconv32

_ifconv32:                                        ; preds = %3
  %mem_load = load i16* @mem, align 2
  %tmp_10 = sext i16 %pos_load to i32
  %mem_out0_addr = getelementptr [2048 x i1]* %mem_out0, i32 0, i32 %tmp_10
  %data = load i1* %mem_out0_addr, align 1
  %mem_out1_addr = getelementptr [2048 x i1]* %mem_out1, i32 0, i32 %tmp_10
  %data_1 = load i1* %mem_out1_addr, align 1
  %mem_out2_addr = getelementptr [1024 x i1]* %mem_out2, i32 0, i32 %tmp_10
  %data_2 = load i1* %mem_out2_addr, align 1
  %mem_out3_addr = getelementptr [1024 x i1]* %mem_out3, i32 0, i32 %tmp_10
  %data_3 = load i1* %mem_out3_addr, align 1
  %mem_out4_addr = getelementptr [1024 x i1]* %mem_out4, i32 0, i32 %tmp_10
  %data_4 = load i1* %mem_out4_addr, align 1
  %mem_out5_addr = getelementptr [1024 x i1]* %mem_out5, i32 0, i32 %tmp_10
  %data_5 = load i1* %mem_out5_addr, align 1
  %mem_out6_addr = getelementptr [1024 x i1]* %mem_out6, i32 0, i32 %tmp_10
  %data_6 = load i1* %mem_out6_addr, align 1
  %mem_out7_addr = getelementptr [1024 x i1]* %mem_out7, i32 0, i32 %tmp_10
  %data_7 = load i1* %mem_out7_addr, align 1
  %sel_tmp9 = icmp eq i16 %mem_load, 6
  %sel_tmp10 = icmp eq i16 %mem_load, 5
  %sel_tmp11 = icmp eq i16 %mem_load, 4
  %sel_tmp12 = icmp eq i16 %mem_load, 3
  %sel_tmp13 = icmp eq i16 %mem_load, 2
  %sel_tmp14 = icmp eq i16 %mem_load, 1
  %sel_tmp15 = icmp eq i16 %mem_load, 0
  %newSel2 = select i1 %sel_tmp15, i1 %data, i1 %data_1
  %or_cond3 = or i1 %sel_tmp15, %sel_tmp14
  %newSel3 = select i1 %sel_tmp13, i1 %data_2, i1 %data_3
  %or_cond4 = or i1 %sel_tmp13, %sel_tmp12
  %newSel4 = select i1 %sel_tmp11, i1 %data_4, i1 %data_5
  %or_cond5 = or i1 %sel_tmp11, %sel_tmp10
  %newSel5 = select i1 %sel_tmp9, i1 %data_6, i1 %data_7
  %newSel6 = select i1 %or_cond3, i1 %newSel2, i1 %newSel3
  %or_cond6 = or i1 %or_cond3, %or_cond4
  %newSel7 = select i1 %or_cond5, i1 %newSel4, i1 %newSel5
  %data_8 = select i1 %or_cond6, i1 %newSel6, i1 %newSel7
  %trig_load = load i16* @trig, align 2
  %tmp_12 = icmp eq i16 %pos_load, %trig_load
  br i1 %tmp_12, label %4, label %5

; <label>:4                                       ; preds = %_ifconv32
  %tmp_13 = add i16 %mem_load, 1
  store i16 %tmp_13, i16* @mem, align 2
  br label %6

; <label>:5                                       ; preds = %_ifconv32
  %tmp_14 = add i16 %pos_load, 1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %storemerge = phi i16 [ %tmp_14, %5 ], [ 0, %4 ]
  store i16 %storemerge, i16* @pos_r, align 2
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %data_out, i1 %data_8)
  %tmp_15 = add i16 %read_cnt_load, 1
  store i16 %tmp_15, i16* @read_cnt, align 2
  br label %._crit_edge63

; <label>:7                                       ; preds = %3
  %tmp_s = add i16 %read_cnt_start_load, 1
  store i16 %tmp_s, i16* @read_cnt_start, align 2
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %7, %6, %.critedge._crit_edge, %2
  %val_assign = phi i16 [ 0, %2 ], [ %read_cnt_load, %.critedge._crit_edge ], [ %tmp_15, %6 ], [ %read_cnt_load, %7 ]
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %cur_read_pos_V, i16 %val_assign)
  ret void
}

!opencl.kernels = !{!0, !7, !7, !13, !13, !19, !22, !28, !28, !13, !31}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!33}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool*", metadata !"_Bool", metadata !"tab_int*", metadata !"tab_int", metadata !"_Bool", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*", metadata !"_Bool*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"data_out", metadata !"reset", metadata !"cur_read_pos", metadata !"numbits", metadata !"rd_clk_in", metadata !"rd_mux", metadata !"mem_out0", metadata !"mem_out1", metadata !"mem_out2", metadata !"mem_out3", metadata !"mem_out4", metadata !"mem_out5", metadata !"mem_out6", metadata !"mem_out7"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"short"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{null, metadata !8, metadata !9, metadata !20, metadata !11, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<16> &"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!24 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"int"}
!26 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!28 = metadata !{null, metadata !8, metadata !9, metadata !29, metadata !11, metadata !30, metadata !6}
!29 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!30 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!31 = metadata !{null, metadata !8, metadata !9, metadata !32, metadata !11, metadata !21, metadata !6}
!32 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!33 = metadata !{metadata !34, [1 x i32]* @llvm_global_ctors_0}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 31, metadata !36}
!36 = metadata !{metadata !37}
!37 = metadata !{metadata !"llvm.global_ctors.0", metadata !38, metadata !"", i32 0, i32 31}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 0, i32 0, i32 1}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 0, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"data_out", metadata !38, metadata !"bool", i32 0, i32 0}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 0, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"reset", metadata !48, metadata !"bool", i32 0, i32 0}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 0, i32 0, i32 0}
!50 = metadata !{metadata !51}
!51 = metadata !{i32 0, i32 15, metadata !52}
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !"cur_read_pos.V", metadata !38, metadata !"uint16", i32 0, i32 15}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 0, i32 15, metadata !56}
!56 = metadata !{metadata !57}
!57 = metadata !{metadata !"numbits.V", metadata !48, metadata !"uint16", i32 0, i32 15}
!58 = metadata !{metadata !59}
!59 = metadata !{i32 0, i32 0, metadata !60}
!60 = metadata !{metadata !61}
!61 = metadata !{metadata !"rd_clk_in", metadata !48, metadata !"bool", i32 0, i32 0}
!62 = metadata !{metadata !63}
!63 = metadata !{i32 0, i32 0, metadata !64}
!64 = metadata !{metadata !65}
!65 = metadata !{metadata !"rd_mux", metadata !38, metadata !"bool", i32 0, i32 0}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 0, i32 0, metadata !68}
!68 = metadata !{metadata !69}
!69 = metadata !{metadata !"mem_out0", metadata !70, metadata !"bool", i32 0, i32 0}
!70 = metadata !{metadata !71}
!71 = metadata !{i32 0, i32 2047, i32 1}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 0, i32 0, metadata !74}
!74 = metadata !{metadata !75}
!75 = metadata !{metadata !"mem_out1", metadata !70, metadata !"bool", i32 0, i32 0}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 0, i32 0, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"mem_out2", metadata !80, metadata !"bool", i32 0, i32 0}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 0, i32 1023, i32 1}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 0, i32 0, metadata !84}
!84 = metadata !{metadata !85}
!85 = metadata !{metadata !"mem_out3", metadata !80, metadata !"bool", i32 0, i32 0}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 0, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"mem_out4", metadata !80, metadata !"bool", i32 0, i32 0}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 0, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"mem_out5", metadata !80, metadata !"bool", i32 0, i32 0}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 0, metadata !96}
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !"mem_out6", metadata !80, metadata !"bool", i32 0, i32 0}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 0, i32 0, metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !"mem_out7", metadata !80, metadata !"bool", i32 0, i32 0}
