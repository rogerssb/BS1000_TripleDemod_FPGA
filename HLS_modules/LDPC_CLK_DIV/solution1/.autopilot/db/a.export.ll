; ModuleID = 'C:/Users/dougo/LDPC_CLK_DIV/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@out_count = internal unnamed_addr global i16 0, align 2
@max = internal unnamed_addr global i16 5000, align 2
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@count = internal unnamed_addr global i16 0, align 2
@LDPC_Div_str = internal unnamed_addr constant [9 x i8] c"LDPC_Div\00"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_auto.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
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

declare void @_GLOBAL__I_a() nounwind

define void @LDPC_Div(i1 zeroext %reset, i1* %rd_clk_out, i16 signext %clk_div, i2 %block_V) {
._crit_edge:
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset), !map !35
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %rd_clk_out), !map !41
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %clk_div), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %block_V), !map !49
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @LDPC_Div_str) nounwind
  %block_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %block_V)
  %clk_div_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %clk_div)
  %reset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %reset)
  %out_count_load = load i16* @out_count, align 2
  %count_load = load i16* @count, align 2
  %max_load = load i16* @max, align 2
  %tmp = icmp slt i16 %out_count_load, %max_load
  %or_cond3 = or i1 %tmp, %reset_read
  %not_or_cond3 = xor i1 %or_cond3, true
  %out_count_load_s = select i1 %or_cond3, i16 %out_count_load, i16 0
  %tmp_1 = icmp eq i2 %block_V_read, 1
  %storemerge_cast_cast = select i1 %tmp_1, i16 1024, i16 4096
  store i16 %storemerge_cast_cast, i16* @max, align 2
  %count_load_op = add i16 %count_load, 1
  %tmp_2 = select i1 %or_cond3, i16 %count_load_op, i16 1
  %tmp_3 = icmp eq i16 %tmp_2, %clk_div_read
  %tmp_4 = icmp slt i16 %out_count_load_s, %storemerge_cast_cast
  %or_cond = and i1 %tmp_3, %tmp_4
  br i1 %or_cond, label %0, label %._crit_edge5

; <label>:0                                       ; preds = %._crit_edge
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %rd_clk_out, i1 true)
  %tmp_5 = add i16 %out_count_load_s, 1
  br label %mergeST1

._crit_edge5:                                     ; preds = %._crit_edge
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %rd_clk_out, i1 false)
  br label %mergeST1

mergeST:                                          ; preds = %mergeST1
  store i16 %out_count_new_1, i16* @out_count, align 2
  br label %.new

.new:                                             ; preds = %mergeST1, %mergeST
  ret void

mergeST1:                                         ; preds = %._crit_edge5, %0
  %out_count_flag_1 = phi i1 [ true, %0 ], [ %not_or_cond3, %._crit_edge5 ]
  %out_count_new_1 = phi i16 [ %tmp_5, %0 ], [ 0, %._crit_edge5 ]
  %count_new = phi i16 [ 0, %0 ], [ %tmp_2, %._crit_edge5 ]
  store i16 %count_new, i16* @count, align 2
  br i1 %out_count_flag_1, label %mergeST, label %.new
}

!opencl.kernels = !{!0, !7, !13, !13, !19, !25}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!28}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool*", metadata !"short", metadata !"tab_2_int"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"reset", metadata !"rd_clk_out", metadata !"clk_div", metadata !"block"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space"}
!21 = metadata !{metadata !"kernel_arg_access_qual"}
!22 = metadata !{metadata !"kernel_arg_type"}
!23 = metadata !{metadata !"kernel_arg_type_qual"}
!24 = metadata !{metadata !"kernel_arg_name"}
!25 = metadata !{null, metadata !14, metadata !15, metadata !26, metadata !17, metadata !27, metadata !6}
!26 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!28 = metadata !{metadata !29, [1 x i32]* @llvm_global_ctors_0}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 31, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"llvm.global_ctors.0", metadata !33, metadata !"", i32 0, i32 31}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 0, i32 1}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 0, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"reset", metadata !39, metadata !"bool", i32 0, i32 0}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 0, i32 0}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 0, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"rd_clk_out", metadata !33, metadata !"bool", i32 0, i32 0}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 15, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"clk_div", metadata !39, metadata !"short", i32 0, i32 15}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 1, metadata !51}
!51 = metadata !{metadata !52}
!52 = metadata !{metadata !"block.V", metadata !39, metadata !"uint2", i32 0, i32 1}
