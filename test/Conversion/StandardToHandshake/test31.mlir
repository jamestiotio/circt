// NOTE: Assertions have been autogenerated by utils/update_mlir_test_checks.py
// RUN: circt-opt -lower-std-to-handshake %s | FileCheck %s
  func @affine_load(%arg0: index) {
// CHECK:       module {

// CHECK-LABEL:   handshake.func @affine_load(
// CHECK-SAME:                                %[[VAL_0:.*]]: index, %[[VAL_1:.*]]: none, ...) -> none attributes {argNames = ["in0", "inCtrl"], resNames = ["outCtrl"]} {
// CHECK:           %[[VAL_2:.*]]:3 = "handshake.memory"(%[[VAL_3:.*]]#0, %[[VAL_3]]#1, %[[VAL_4:.*]]) {id = 1 : i32, ld_count = 1 : i32, lsq = false, st_count = 1 : i32, type = memref<10xf32>} : (f32, index, index) -> (f32, none, none)
// CHECK:           %[[VAL_5:.*]]:2 = "handshake.fork"(%[[VAL_2]]#2) {control = true} : (none) -> (none, none)
// CHECK:           %[[VAL_6:.*]]:4 = "handshake.memory"(%[[VAL_7:.*]], %[[VAL_8:.*]]) {id = 0 : i32, ld_count = 2 : i32, lsq = false, st_count = 0 : i32, type = memref<10xf32>} : (index, index) -> (f32, f32, none, none)
// CHECK:           %[[VAL_9:.*]] = "handshake.merge"(%[[VAL_0]]) : (index) -> index
// CHECK:           %[[VAL_10:.*]]:2 = "handshake.fork"(%[[VAL_1]]) {control = true} : (none) -> (none, none)
// CHECK:           %[[VAL_11:.*]]:4 = "handshake.fork"(%[[VAL_10]]#1) {control = true} : (none) -> (none, none, none, none)
// CHECK:           %[[VAL_12:.*]] = "handshake.join"(%[[VAL_11]]#3, %[[VAL_6]]#2) {control = true} : (none, none) -> none
// CHECK:           %[[VAL_13:.*]] = "handshake.constant"(%[[VAL_11]]#2) {value = 0 : index} : (none) -> index
// CHECK:           %[[VAL_14:.*]]:2 = "handshake.fork"(%[[VAL_13]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_15:.*]] = "handshake.constant"(%[[VAL_11]]#1) {value = 10 : index} : (none) -> index
// CHECK:           %[[VAL_16:.*]], %[[VAL_7]] = "handshake.load"(%[[VAL_14]]#0, %[[VAL_6]]#0, %[[VAL_10]]#0) : (index, f32, none) -> (f32, index)
// CHECK:           %[[VAL_17:.*]] = "handshake.constant"(%[[VAL_11]]#0) {value = 1 : index} : (none) -> index
// CHECK:           %[[VAL_18:.*]] = "handshake.branch"(%[[VAL_9]]) {control = false} : (index) -> index
// CHECK:           %[[VAL_19:.*]] = "handshake.branch"(%[[VAL_12]]) {control = true} : (none) -> none
// CHECK:           %[[VAL_20:.*]] = "handshake.branch"(%[[VAL_14]]#1) {control = false} : (index) -> index
// CHECK:           %[[VAL_21:.*]] = "handshake.branch"(%[[VAL_15]]) {control = false} : (index) -> index
// CHECK:           %[[VAL_22:.*]] = "handshake.branch"(%[[VAL_16]]) {control = false} : (f32) -> f32
// CHECK:           %[[VAL_23:.*]] = "handshake.branch"(%[[VAL_17]]) {control = false} : (index) -> index
// CHECK:           %[[VAL_24:.*]] = "handshake.mux"(%[[VAL_25:.*]]#4, %[[VAL_26:.*]], %[[VAL_21]]) : (index, index, index) -> index
// CHECK:           %[[VAL_27:.*]]:2 = "handshake.fork"(%[[VAL_24]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_28:.*]] = "handshake.mux"(%[[VAL_25]]#3, %[[VAL_29:.*]], %[[VAL_18]]) : (index, index, index) -> index
// CHECK:           %[[VAL_30:.*]] = "handshake.mux"(%[[VAL_25]]#2, %[[VAL_31:.*]], %[[VAL_23]]) : (index, index, index) -> index
// CHECK:           %[[VAL_32:.*]] = "handshake.mux"(%[[VAL_25]]#1, %[[VAL_33:.*]], %[[VAL_22]]) : (index, f32, f32) -> f32
// CHECK:           %[[VAL_34:.*]]:2 = "handshake.control_merge"(%[[VAL_35:.*]], %[[VAL_19]]) {control = true} : (none, none) -> (none, index)
// CHECK:           %[[VAL_25]]:5 = "handshake.fork"(%[[VAL_34]]#1) {control = false} : (index) -> (index, index, index, index, index)
// CHECK:           %[[VAL_36:.*]] = "handshake.mux"(%[[VAL_25]]#0, %[[VAL_37:.*]], %[[VAL_20]]) : (index, index, index) -> index
// CHECK:           %[[VAL_38:.*]]:2 = "handshake.fork"(%[[VAL_36]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_39:.*]] = arith.cmpi slt, %[[VAL_38]]#1, %[[VAL_27]]#1 : index
// CHECK:           %[[VAL_40:.*]]:6 = "handshake.fork"(%[[VAL_39]]) {control = false} : (i1) -> (i1, i1, i1, i1, i1, i1)
// CHECK:           %[[VAL_41:.*]], %[[VAL_42:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#5, %[[VAL_27]]#0) {control = false} : (i1, index) -> (index, index)
// CHECK:           "handshake.sink"(%[[VAL_42]]) : (index) -> ()
// CHECK:           %[[VAL_43:.*]], %[[VAL_44:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#4, %[[VAL_28]]) {control = false} : (i1, index) -> (index, index)
// CHECK:           "handshake.sink"(%[[VAL_44]]) : (index) -> ()
// CHECK:           %[[VAL_45:.*]], %[[VAL_46:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#3, %[[VAL_30]]) {control = false} : (i1, index) -> (index, index)
// CHECK:           "handshake.sink"(%[[VAL_46]]) : (index) -> ()
// CHECK:           %[[VAL_47:.*]], %[[VAL_48:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#2, %[[VAL_32]]) {control = false} : (i1, f32) -> (f32, f32)
// CHECK:           "handshake.sink"(%[[VAL_48]]) : (f32) -> ()
// CHECK:           %[[VAL_49:.*]], %[[VAL_50:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#1, %[[VAL_34]]#0) {control = true} : (i1, none) -> (none, none)
// CHECK:           %[[VAL_51:.*]], %[[VAL_52:.*]] = "handshake.conditional_branch"(%[[VAL_40]]#0, %[[VAL_38]]#0) {control = false} : (i1, index) -> (index, index)
// CHECK:           "handshake.sink"(%[[VAL_52]]) : (index) -> ()
// CHECK:           %[[VAL_53:.*]] = "handshake.merge"(%[[VAL_51]]) : (index) -> index
// CHECK:           %[[VAL_54:.*]]:2 = "handshake.fork"(%[[VAL_53]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_55:.*]] = "handshake.merge"(%[[VAL_43]]) : (index) -> index
// CHECK:           %[[VAL_56:.*]]:2 = "handshake.fork"(%[[VAL_55]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_57:.*]] = "handshake.merge"(%[[VAL_45]]) : (index) -> index
// CHECK:           %[[VAL_58:.*]]:2 = "handshake.fork"(%[[VAL_57]]) {control = false} : (index) -> (index, index)
// CHECK:           %[[VAL_59:.*]] = "handshake.merge"(%[[VAL_47]]) : (f32) -> f32
// CHECK:           %[[VAL_60:.*]]:3 = "handshake.fork"(%[[VAL_59]]) {control = false} : (f32) -> (f32, f32, f32)
// CHECK:           %[[VAL_61:.*]] = "handshake.merge"(%[[VAL_41]]) : (index) -> index
// CHECK:           %[[VAL_62:.*]]:2 = "handshake.control_merge"(%[[VAL_49]]) {control = true} : (none) -> (none, index)
// CHECK:           %[[VAL_63:.*]]:4 = "handshake.fork"(%[[VAL_62]]#0) {control = true} : (none) -> (none, none, none, none)
// CHECK:           %[[VAL_64:.*]]:2 = "handshake.fork"(%[[VAL_63]]#3) {control = true} : (none) -> (none, none)
// CHECK:           %[[VAL_65:.*]] = "handshake.join"(%[[VAL_64]]#1, %[[VAL_6]]#3, %[[VAL_5]]#1, %[[VAL_2]]#1) {control = true} : (none, none, none, none) -> none
// CHECK:           "handshake.sink"(%[[VAL_62]]#1) : (index) -> ()
// CHECK:           %[[VAL_66:.*]] = arith.addi %[[VAL_54]]#1, %[[VAL_56]]#1 : index
// CHECK:           %[[VAL_67:.*]] = "handshake.constant"(%[[VAL_64]]#0) {value = 7 : index} : (none) -> index
// CHECK:           %[[VAL_68:.*]] = arith.addi %[[VAL_66]], %[[VAL_67]] : index
// CHECK:           %[[VAL_69:.*]]:3 = "handshake.fork"(%[[VAL_68]]) {control = false} : (index) -> (index, index, index)
// CHECK:           %[[VAL_70:.*]], %[[VAL_8]] = "handshake.load"(%[[VAL_69]]#2, %[[VAL_6]]#1, %[[VAL_63]]#2) : (index, f32, none) -> (f32, index)
// CHECK:           %[[VAL_71:.*]] = arith.addi %[[VAL_54]]#0, %[[VAL_58]]#1 : index
// CHECK:           %[[VAL_72:.*]], %[[VAL_4]] = "handshake.load"(%[[VAL_69]]#1, %[[VAL_2]]#0, %[[VAL_63]]#1) : (index, f32, none) -> (f32, index)
// CHECK:           %[[VAL_73:.*]] = arith.addf %[[VAL_70]], %[[VAL_72]] : f32
// CHECK:           %[[VAL_74:.*]] = arith.addf %[[VAL_60]]#1, %[[VAL_60]]#2 : f32
// CHECK:           "handshake.sink"(%[[VAL_74]]) : (f32) -> ()
// CHECK:           %[[VAL_75:.*]] = "handshake.join"(%[[VAL_63]]#0, %[[VAL_5]]#0) {control = true} : (none, none) -> none
// CHECK:           %[[VAL_3]]:2 = "handshake.store"(%[[VAL_73]], %[[VAL_69]]#0, %[[VAL_75]]) : (f32, index, none) -> (f32, index)
// CHECK:           %[[VAL_29]] = "handshake.branch"(%[[VAL_56]]#0) {control = false} : (index) -> index
// CHECK:           %[[VAL_31]] = "handshake.branch"(%[[VAL_58]]#0) {control = false} : (index) -> index
// CHECK:           %[[VAL_33]] = "handshake.branch"(%[[VAL_60]]#0) {control = false} : (f32) -> f32
// CHECK:           %[[VAL_26]] = "handshake.branch"(%[[VAL_61]]) {control = false} : (index) -> index
// CHECK:           %[[VAL_35]] = "handshake.branch"(%[[VAL_65]]) {control = true} : (none) -> none
// CHECK:           %[[VAL_37]] = "handshake.branch"(%[[VAL_71]]) {control = false} : (index) -> index
// CHECK:           %[[VAL_76:.*]]:2 = "handshake.control_merge"(%[[VAL_50]]) {control = true} : (none) -> (none, index)
// CHECK:           "handshake.sink"(%[[VAL_76]]#1) : (index) -> ()
// CHECK:           return %[[VAL_76]]#0 : none
// CHECK:         }
// CHECK:       }

    %0 = memref.alloc() : memref<10xf32>
    %10 = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %9 = memref.load %0[%c0] : memref<10xf32>
    %c1 = arith.constant 1 : index
    br ^bb1(%c0 : index)
  ^bb1(%1: index):      // 2 preds: ^bb0, ^bb2
    %2 = arith.cmpi slt, %1, %c10 : index
    cond_br %2, ^bb2, ^bb3
  ^bb2: // pred: ^bb1
    %3 = arith.addi %1, %arg0 : index
    %c7 = arith.constant 7 : index
    %4 = arith.addi %3, %c7 : index
    %5 = memref.load %0[%4] : memref<10xf32>
    %6 = arith.addi %1, %c1 : index
    %7 = memref.load %10[%4] : memref<10xf32>
    %8 = arith.addf %5, %7 : f32
    %11 = arith.addf %9, %9 : f32
    memref.store %8, %10[%4] : memref<10xf32>
    br ^bb1(%6 : index)
  ^bb3: // pred: ^bb1
    return
  }
