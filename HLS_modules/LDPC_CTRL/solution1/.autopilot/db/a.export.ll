; ModuleID = 'C:/Users/dougo/LDPC_CTRL/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@state = internal unnamed_addr global i16 10, align 2
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@LDPC_CTRL_str = internal unnamed_addr constant [10 x i8] c"LDPC_CTRL\00"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_auto.i2P(i2*, i2) {
entry:
  store i2 %1, i2* %0
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

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i2 @_ssdm_op_Read.ap_auto.i2(i2) {
entry:
  ret i2 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

declare void @_GLOBAL__I_a() nounwind

define void @LDPC_CTRL(i2 %block_V, i2 %code_V, i1 zeroext %run, i1* %init_start, i1 zeroext %init_done, i1 zeroext %init_ready, i1* %buff_start, i2* %status_V, i16* %err_code, i2* %size_V, i2* %rate_V, i1* %buff_reset) {
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %block_V), !map !39
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %code_V), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %run), !map !49
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %init_start), !map !53
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %init_done), !map !57
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %init_ready), !map !61
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %buff_start), !map !65
  call void (...)* @_ssdm_op_SpecBitsMap(i2* %status_V), !map !69
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %err_code), !map !73
  call void (...)* @_ssdm_op_SpecBitsMap(i2* %size_V), !map !77
  call void (...)* @_ssdm_op_SpecBitsMap(i2* %rate_V), !map !81
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %buff_reset), !map !85
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @LDPC_CTRL_str) nounwind
  %init_ready_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %init_ready)
  %init_done_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %init_done)
  %run_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %run)
  %code_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %code_V)
  %block_V_read = call i2 @_ssdm_op_Read.ap_auto.i2(i2 %block_V)
  %state_load = load i16* @state, align 2
  switch i16 %state_load, label %._crit_edge66 [
    i16 0, label %1
    i16 1, label %3
    i16 2, label %6
    i16 3, label %8
  ]

; <label>:1                                       ; preds = %0
  %notlhs = icmp ne i2 %block_V_read, 1
  %notrhs = icmp ne i2 %block_V_read, -2
  %or_cond_not = and i1 %notrhs, %notlhs
  %tmp_3 = icmp eq i2 %code_V_read, 0
  %or_cond1 = or i1 %or_cond_not, %tmp_3
  br i1 %or_cond1, label %._crit_edge60, label %2

; <label>:2                                       ; preds = %1
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %size_V, i2 %block_V_read)
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %rate_V, i2 %code_V_read)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_reset, i1 false)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %init_start, i1 true)
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %status_V, i2 1)
  br label %._crit_edge62

._crit_edge60:                                    ; preds = %1
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %err_code, i16 3)
  br label %._crit_edge62

; <label>:3                                       ; preds = %0
  br i1 %init_ready_read, label %4, label %._crit_edge62

; <label>:4                                       ; preds = %3
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %init_start, i1 false)
  br i1 %init_done_read, label %5, label %._crit_edge62

; <label>:5                                       ; preds = %4
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_start, i1 true)
  br label %._crit_edge62

; <label>:6                                       ; preds = %0
  br i1 %init_done_read, label %7, label %._crit_edge62

; <label>:7                                       ; preds = %6
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_start, i1 true)
  br label %._crit_edge62

; <label>:8                                       ; preds = %0
  br i1 %run_read, label %._crit_edge62, label %9

; <label>:9                                       ; preds = %8
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_start, i1 false)
  br label %._crit_edge62

._crit_edge66:                                    ; preds = %0
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %size_V, i2 0)
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %rate_V, i2 0)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %init_start, i1 false)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_reset, i1 true)
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %buff_start, i1 false)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %err_code, i16 0)
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %status_V, i2 0)
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge66, %9, %8, %7, %6, %5, %4, %3, %._crit_edge60, %2
  %state_flag_6 = phi i1 [ %run_read, %._crit_edge66 ], [ true, %._crit_edge60 ], [ true, %2 ], [ false, %3 ], [ true, %5 ], [ true, %4 ], [ true, %7 ], [ false, %6 ], [ false, %8 ], [ true, %9 ]
  %state_new_6 = phi i6 [ 0, %._crit_edge66 ], [ 10, %._crit_edge60 ], [ 1, %2 ], [ undef, %3 ], [ 3, %5 ], [ 2, %4 ], [ 3, %7 ], [ 3, %6 ], [ 10, %8 ], [ 10, %9 ]
  %state_new_6_cast = sext i6 %state_new_6 to i16
  br i1 %state_flag_6, label %mergeST, label %.new

mergeST:                                          ; preds = %._crit_edge62
  store i16 %state_new_6_cast, i16* @state, align 2
  br label %.new

.new:                                             ; preds = %mergeST, %._crit_edge62
  ret void
}

!opencl.kernels = !{!0, !7, !7, !13, !13, !19, !22, !28, !28, !13, !30, !22, !30, !22, !30}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!32}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"tab_2_int", metadata !"tab_2_int", metadata !"_Bool", metadata !"_Bool*", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool*", metadata !"tab_2_int*", metadata !"short*", metadata !"tab_2_int*", metadata !"tab_2_int*", metadata !"_Bool*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"block", metadata !"code", metadata !"run", metadata !"init_start", metadata !"init_done", metadata !"init_ready", metadata !"buff_start", metadata !"status", metadata !"err_code", metadata !"size", metadata !"rate", metadata !"buff_reset"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{null, metadata !8, metadata !9, metadata !20, metadata !11, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!24 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!26 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!28 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !29, metadata !6}
!29 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!30 = metadata !{null, metadata !8, metadata !9, metadata !31, metadata !11, metadata !21, metadata !6}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!32 = metadata !{metadata !33, [1 x i32]* @llvm_global_ctors_0}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 31, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"llvm.global_ctors.0", metadata !37, metadata !"", i32 0, i32 31}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 0, i32 1}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 1, metadata !41}
!41 = metadata !{metadata !42}
!42 = metadata !{metadata !"block.V", metadata !43, metadata !"uint2", i32 0, i32 1}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 0, i32 0}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 1, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"code.V", metadata !43, metadata !"uint2", i32 0, i32 1}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 0, metadata !51}
!51 = metadata !{metadata !52}
!52 = metadata !{metadata !"run", metadata !43, metadata !"bool", i32 0, i32 0}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 0, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"init_start", metadata !37, metadata !"bool", i32 0, i32 0}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 0, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"init_done", metadata !43, metadata !"bool", i32 0, i32 0}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 0, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"init_ready", metadata !43, metadata !"bool", i32 0, i32 0}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 0, i32 0, metadata !67}
!67 = metadata !{metadata !68}
!68 = metadata !{metadata !"buff_start", metadata !37, metadata !"bool", i32 0, i32 0}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 0, i32 1, metadata !71}
!71 = metadata !{metadata !72}
!72 = metadata !{metadata !"status.V", metadata !37, metadata !"uint2", i32 0, i32 1}
!73 = metadata !{metadata !74}
!74 = metadata !{i32 0, i32 15, metadata !75}
!75 = metadata !{metadata !76}
!76 = metadata !{metadata !"err_code", metadata !37, metadata !"short", i32 0, i32 15}
!77 = metadata !{metadata !78}
!78 = metadata !{i32 0, i32 1, metadata !79}
!79 = metadata !{metadata !80}
!80 = metadata !{metadata !"size.V", metadata !37, metadata !"uint2", i32 0, i32 1}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 0, i32 1, metadata !83}
!83 = metadata !{metadata !84}
!84 = metadata !{metadata !"rate.V", metadata !37, metadata !"uint2", i32 0, i32 1}
!85 = metadata !{metadata !86}
!86 = metadata !{i32 0, i32 0, metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !"buff_reset", metadata !37, metadata !"bool", i32 0, i32 0}
