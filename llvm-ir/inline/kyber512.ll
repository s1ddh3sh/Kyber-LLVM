; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [2 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #5, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #4, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !77
  ret i32 0, !dbg !78
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !79 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !82, !DIExpression(), !83)
    #dbg_value(ptr %sk, !84, !DIExpression(), !83)
    #dbg_declare(ptr %coins, !85, !DIExpression(), !89)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #5, !dbg !90
    #dbg_value(ptr %pk, !67, !DIExpression(), !91)
    #dbg_value(ptr %sk, !69, !DIExpression(), !91)
    #dbg_value(ptr %coins, !70, !DIExpression(), !91)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !93
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !94
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 800) #5, !dbg !95
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !96
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 800) #4, !dbg !96
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !97
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !98
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !99
  ret i32 0, !dbg !100
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !101 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !104, !DIExpression(), !105)
    #dbg_value(ptr %ss, !106, !DIExpression(), !105)
    #dbg_value(ptr %pk, !107, !DIExpression(), !105)
    #dbg_value(ptr %coins, !108, !DIExpression(), !105)
    #dbg_declare(ptr %buf, !109, !DIExpression(), !110)
    #dbg_declare(ptr %kr, !111, !DIExpression(), !112)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !113
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !114
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #4, !dbg !114
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !115
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !116
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !117
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !120 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !121, !DIExpression(), !122)
    #dbg_value(ptr %ss, !123, !DIExpression(), !122)
    #dbg_value(ptr %pk, !124, !DIExpression(), !122)
    #dbg_declare(ptr %coins, !125, !DIExpression(), !129)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #5, !dbg !130
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !133 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !136, !DIExpression(), !137)
    #dbg_value(ptr %ct, !138, !DIExpression(), !137)
    #dbg_value(ptr %sk, !139, !DIExpression(), !137)
    #dbg_declare(ptr %buf, !140, !DIExpression(), !141)
    #dbg_declare(ptr %kr, !142, !DIExpression(), !143)
    #dbg_declare(ptr %cmp, !144, !DIExpression(), !148)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !149
    #dbg_value(ptr %add.ptr, !150, !DIExpression(), !137)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !151
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !152
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !153
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !154
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !155
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !156
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !157
    #dbg_value(ptr %ct, !158, !DIExpression(), !165)
    #dbg_value(ptr %cmp, !167, !DIExpression(), !165)
    #dbg_value(i32 768, !168, !DIExpression(), !165)
    #dbg_value(i8 0, !169, !DIExpression(), !165)
    #dbg_value(i32 0, !170, !DIExpression(), !165)
  br label %for.cond.i, !dbg !171

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !173
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !165
    #dbg_value(i8 %r.0.i, !169, !DIExpression(), !165)
    #dbg_value(i32 %i.0.i, !170, !DIExpression(), !165)
  %exitcond = icmp ne i32 %i.0.i, 768, !dbg !174
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber512_ref_verify.exit, !dbg !176

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !165)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %ct, i32 %i.0.i, !dbg !177
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !177
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %cmp, i32 %i.0.i, !dbg !178
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !178
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %0, i8 %1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !165)
  %xor1.i = xor i8 %0, %1, !dbg !179
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %xor1.i), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !165)
  %or2.i = or i8 %r.0.i, %xor1.i, !dbg !180
    #dbg_value(i8 %or2.i, !169, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !165)
    #dbg_value(i8 %or2.i, !169, !DIExpression(), !165)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !181
    #dbg_value(i32 %inc.i, !170, !DIExpression(), !165)
  br label %for.cond.i, !dbg !182, !llvm.loop !183

pqcrystals_kyber512_ref_verify.exit:              ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !165
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !186
    #dbg_value(i1 %.not, !187, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !137)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !188
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !188
  %conv = zext i1 %.not to i8, !dbg !189
    #dbg_value(ptr %ss, !190, !DIExpression(), !194)
    #dbg_value(ptr %kr, !196, !DIExpression(), !194)
    #dbg_value(i32 32, !197, !DIExpression(), !194)
    #dbg_value(i8 %conv, !198, !DIExpression(), !194)
  %2 = call i8 asm "", "=r,0"(i8 %conv) #6, !dbg !199, !srcloc !200
    #dbg_value(i8 %2, !198, !DIExpression(), !194)
  %sub.i = sub i8 0, %2, !dbg !201
    #dbg_value(i8 %sub.i, !198, !DIExpression(), !194)
    #dbg_value(i32 0, !202, !DIExpression(), !194)
  br label %for.cond.i1, !dbg !203

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber512_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber512_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !205
    #dbg_value(i32 %i.0.i2, !202, !DIExpression(), !194)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !206
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber512_ref_cmov.exit, !dbg !208

for.body.i:                                       ; preds = %for.cond.i1
  %arrayidx.i4 = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !209
  %3 = load i8, ptr %arrayidx.i4, align 1, !dbg !209
  %arrayidx5.i = getelementptr inbounds nuw i8, ptr %kr, i32 %i.0.i2, !dbg !210
  %4 = load i8, ptr %arrayidx5.i, align 1, !dbg !210
  %xor1.i5 = xor i8 %3, %4, !dbg !211
  %and2.i = and i8 %xor1.i5, %sub.i, !dbg !212
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !213
  %xor93.i = xor i8 %3, %and2.i, !dbg !214
  store i8 %xor93.i, ptr %arrayidx7.i, align 1, !dbg !214
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !215
    #dbg_value(i32 %inc.i6, !202, !DIExpression(), !194)
  br label %for.cond.i1, !dbg !216, !llvm.loop !217

pqcrystals_kyber512_ref_cmov.exit:                ; preds = %for.cond.i1
  ret i32 0, !dbg !219
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !220 {
entry:
  %extseed.i1 = alloca [34 x i8], align 1
  %extseed.i = alloca [34 x i8], align 1
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !241, !DIExpression(), !242)
    #dbg_value(ptr %seed, !243, !DIExpression(), !242)
    #dbg_value(i32 %transposed, !244, !DIExpression(), !242)
    #dbg_declare(ptr %buf, !245, !DIExpression(), !249)
    #dbg_declare(ptr %state, !250, !DIExpression(), !262)
    #dbg_value(i32 0, !263, !DIExpression(), !242)
  br label %for.cond, !dbg !264

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !266
    #dbg_value(i32 %i.0, !263, !DIExpression(), !242)
  %exitcond39 = icmp ne i32 %i.0, 2, !dbg !267
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !269

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !270

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !273
    #dbg_value(i32 %j.0, !274, !DIExpression(), !242)
  %exitcond38 = icmp ne i32 %j.0, 2, !dbg !275
  br i1 %exitcond38, label %for.body3, label %for.inc20, !dbg !270

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !277
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !277

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !280
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !280
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i1), !dbg !281
    #dbg_value(ptr %state, !293, !DIExpression(), !294)
    #dbg_value(ptr %seed, !295, !DIExpression(), !294)
    #dbg_value(i8 %conv, !296, !DIExpression(), !294)
    #dbg_value(i8 %conv4, !297, !DIExpression(), !294)
    #dbg_declare(ptr %extseed.i1, !298, !DIExpression(), !302)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extseed.i1, ptr noundef %seed, i32 noundef 32) #5, !dbg !281
  %arrayidx.i3 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 32, !dbg !303
  store i8 %conv, ptr %arrayidx.i3, align 1, !dbg !304
  %arrayidx1.i4 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 33, !dbg !305
  store i8 %conv4, ptr %arrayidx1.i4, align 1, !dbg !306
    #dbg_value(ptr %state, !307, !DIExpression(), !317)
    #dbg_value(ptr %extseed.i1, !319, !DIExpression(), !317)
    #dbg_value(i32 34, !320, !DIExpression(), !317)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i1, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !321
  %pos.i.i5 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !322
  store i32 168, ptr %pos.i.i5, align 8, !dbg !323
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i1), !dbg !324
  br label %if.end, !dbg !280

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !325
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !325
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i), !dbg !326
    #dbg_value(ptr %state, !293, !DIExpression(), !328)
    #dbg_value(ptr %seed, !295, !DIExpression(), !328)
    #dbg_value(i8 %conv5, !296, !DIExpression(), !328)
    #dbg_value(i8 %conv6, !297, !DIExpression(), !328)
    #dbg_declare(ptr %extseed.i, !298, !DIExpression(), !329)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extseed.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !326
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 32, !dbg !330
  store i8 %conv5, ptr %arrayidx.i, align 1, !dbg !331
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 33, !dbg !332
  store i8 %conv6, ptr %arrayidx1.i, align 1, !dbg !333
    #dbg_value(ptr %state, !307, !DIExpression(), !334)
    #dbg_value(ptr %extseed.i, !319, !DIExpression(), !334)
    #dbg_value(i32 34, !320, !DIExpression(), !334)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !336
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !337
  store i32 168, ptr %pos.i.i, align 8, !dbg !338
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i), !dbg !339
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
    #dbg_value(ptr %buf, !340, !DIExpression(), !344)
    #dbg_value(i32 3, !346, !DIExpression(), !344)
    #dbg_value(ptr %state, !347, !DIExpression(), !344)
    #dbg_value(ptr %buf, !348, !DIExpression(), !353)
    #dbg_value(i32 3, !355, !DIExpression(), !353)
    #dbg_value(ptr %state, !356, !DIExpression(), !353)
    #dbg_value(i32 168, !357, !DIExpression(), !353)
  br label %while.cond.i7, !dbg !358

while.cond.i7:                                    ; preds = %for.end.i15, %if.end
  %nblocks.addr.0.i8 = phi i32 [ 3, %if.end ], [ %sub.i17, %for.end.i15 ]
  %out.addr.0.i9 = phi ptr [ %buf, %if.end ], [ %add.ptr1.i16, %for.end.i15 ]
    #dbg_value(ptr %out.addr.0.i9, !348, !DIExpression(), !353)
    #dbg_value(i32 %nblocks.addr.0.i8, !355, !DIExpression(), !353)
  %tobool.not.i10 = icmp eq i32 %nblocks.addr.0.i8, 0, !dbg !358
  br i1 %tobool.not.i10, label %keccak_squeezeblocks.exit34, label %while.body.i11, !dbg !358

while.body.i11:                                   ; preds = %while.cond.i7
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !359
    #dbg_value(i32 0, !361, !DIExpression(), !353)
  br label %for.cond.i12, !dbg !362

for.cond.i12:                                     ; preds = %store64.exit.i25, %while.body.i11
  %i.0.i13 = phi i32 [ 0, %while.body.i11 ], [ %inc.i26, %store64.exit.i25 ], !dbg !364
    #dbg_value(i32 %i.0.i13, !361, !DIExpression(), !353)
  %exitcond35 = icmp ne i32 %i.0.i13, 21, !dbg !365
  br i1 %exitcond35, label %for.body.i18, label %for.end.i15, !dbg !367

for.body.i18:                                     ; preds = %for.cond.i12
  %mul.i19 = shl nuw nsw i32 %i.0.i13, 3, !dbg !368
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 %mul.i19, !dbg !369
  %arrayidx.i21 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i13, !dbg !370
  %0 = load i64, ptr %arrayidx.i21, align 8, !dbg !370
    #dbg_value(ptr %add.ptr.i20, !371, !DIExpression(), !375)
    #dbg_value(i64 %0, !377, !DIExpression(), !375)
    #dbg_value(i32 0, !378, !DIExpression(), !375)
  br label %for.cond.i.i22, !dbg !379

for.cond.i.i22:                                   ; preds = %for.body.i.i27, %for.body.i18
  %i.0.i.i23 = phi i32 [ 0, %for.body.i18 ], [ %inc.i.i33, %for.body.i.i27 ], !dbg !381
    #dbg_value(i32 %i.0.i.i23, !378, !DIExpression(), !375)
  %exitcond = icmp ne i32 %i.0.i.i23, 8, !dbg !382
  br i1 %exitcond, label %for.body.i.i27, label %store64.exit.i25, !dbg !384

for.body.i.i27:                                   ; preds = %for.cond.i.i22
  %mul.i.i28 = shl nuw nsw i32 %i.0.i.i23, 3, !dbg !385
  %sh_prom.i.i29 = zext nneg i32 %mul.i.i28 to i64, !dbg !386
  %shr.i.i30 = lshr i64 %0, %sh_prom.i.i29, !dbg !386
  %conv.i.i31 = trunc i64 %shr.i.i30 to i8, !dbg !387
  %arrayidx.i.i32 = getelementptr inbounds nuw i8, ptr %add.ptr.i20, i32 %i.0.i.i23, !dbg !388
  store i8 %conv.i.i31, ptr %arrayidx.i.i32, align 1, !dbg !389
  %inc.i.i33 = add nuw nsw i32 %i.0.i.i23, 1, !dbg !390
    #dbg_value(i32 %inc.i.i33, !378, !DIExpression(), !375)
  br label %for.cond.i.i22, !dbg !391, !llvm.loop !392

store64.exit.i25:                                 ; preds = %for.cond.i.i22
  %inc.i26 = add nuw nsw i32 %i.0.i13, 1, !dbg !394
    #dbg_value(i32 %inc.i26, !361, !DIExpression(), !353)
  br label %for.cond.i12, !dbg !395, !llvm.loop !396

for.end.i15:                                      ; preds = %for.cond.i12
  %add.ptr1.i16 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 168, !dbg !398
    #dbg_value(ptr %add.ptr1.i16, !348, !DIExpression(), !353)
  %sub.i17 = add nsw i32 %nblocks.addr.0.i8, -1, !dbg !399
    #dbg_value(i32 %sub.i17, !355, !DIExpression(), !353)
  br label %while.cond.i7, !dbg !358, !llvm.loop !400

keccak_squeezeblocks.exit34:                      ; preds = %while.cond.i7
    #dbg_value(i32 504, !402, !DIExpression(), !242)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !403
  %arrayidx7 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !403
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #4, !dbg !404
    #dbg_value(i32 %call, !405, !DIExpression(), !242)
  br label %while.cond, !dbg !406

while.cond:                                       ; preds = %keccak_squeezeblocks.exit, %keccak_squeezeblocks.exit34
  %ctr.0 = phi i32 [ %call, %keccak_squeezeblocks.exit34 ], [ %add, %keccak_squeezeblocks.exit ], !dbg !407
    #dbg_value(i32 %ctr.0, !405, !DIExpression(), !242)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !408
  br i1 %cmp10, label %while.cond.i.preheader, label %for.inc, !dbg !406

while.cond.i.preheader:                           ; preds = %while.cond
  br label %while.cond.i, !dbg !409

while.cond.i:                                     ; preds = %while.cond.i.preheader, %for.end.i
  %nblocks.addr.0.i = phi i32 [ %sub.i, %for.end.i ], [ 1, %while.cond.i.preheader ]
  %out.addr.0.i = phi ptr [ %add.ptr1.i, %for.end.i ], [ %buf, %while.cond.i.preheader ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !413)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !413)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !409
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !409

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !414
    #dbg_value(i32 0, !361, !DIExpression(), !413)
  br label %for.cond.i, !dbg !415

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !416
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !413)
  %exitcond37 = icmp ne i32 %i.0.i, 21, !dbg !417
  br i1 %exitcond37, label %for.body.i, label %for.end.i, !dbg !418

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !419
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !420
  %arrayidx.i6 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !421
  %1 = load i64, ptr %arrayidx.i6, align 8, !dbg !421
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !422)
    #dbg_value(i64 %1, !377, !DIExpression(), !422)
    #dbg_value(i32 0, !378, !DIExpression(), !422)
  br label %for.cond.i.i, !dbg !424

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !425
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !422)
  %exitcond36 = icmp ne i32 %i.0.i.i, 8, !dbg !426
  br i1 %exitcond36, label %for.body.i.i, label %store64.exit.i, !dbg !427

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !428
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !429
  %shr.i.i = lshr i64 %1, %sh_prom.i.i, !dbg !429
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !430
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !431
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !432
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !433
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !422)
  br label %for.cond.i.i, !dbg !434, !llvm.loop !435

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !437
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !413)
  br label %for.cond.i, !dbg !438, !llvm.loop !439

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !441
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !413)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !442
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !413)
  br label %while.cond.i, !dbg !409, !llvm.loop !443

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 168, !402, !DIExpression(), !242)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !445
  %arrayidx15 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !445
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !446
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !447
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #4, !dbg !448
  %add = add i32 %ctr.0, %call19, !dbg !449
    #dbg_value(i32 %add, !405, !DIExpression(), !242)
  br label %while.cond, !dbg !406, !llvm.loop !450

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !452
    #dbg_value(i32 %inc, !274, !DIExpression(), !242)
  br label %for.cond1, !dbg !453, !llvm.loop !454

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !456
    #dbg_value(i32 %inc21, !263, !DIExpression(), !242)
  br label %for.cond, !dbg !457, !llvm.loop !458

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !460
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !461 {
entry:
    #dbg_value(ptr %r, !465, !DIExpression(), !466)
    #dbg_value(i32 %len, !467, !DIExpression(), !466)
    #dbg_value(ptr %buf, !468, !DIExpression(), !466)
    #dbg_value(i32 %buflen, !469, !DIExpression(), !466)
    #dbg_value(i32 0, !470, !DIExpression(), !466)
    #dbg_value(i32 0, !471, !DIExpression(), !466)
  br label %while.cond, !dbg !472

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !466
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !466
    #dbg_value(i32 %pos.0, !470, !DIExpression(), !466)
    #dbg_value(i32 %ctr.0, !471, !DIExpression(), !466)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !473
  %add = add i32 %pos.0, 3, !dbg !474
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !474
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !474
  br i1 %0, label %while.body, label %while.end, !dbg !472

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !475
  %1 = load i8, ptr %arrayidx, align 1, !dbg !475
  %conv = zext i8 %1 to i16, !dbg !475
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !477
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !477
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !477
  %conv6 = zext i8 %3 to i16, !dbg !478
  %shl = shl nuw i16 %conv6, 8, !dbg !479
  %shl.masked = and i16 %shl, 3840, !dbg !480
  %and = or disjoint i16 %shl.masked, %conv, !dbg !480
    #dbg_value(i16 %and, !481, !DIExpression(), !466)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !482
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !482
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !482
  %6 = lshr i8 %5, 4, !dbg !483
  %shr11 = zext nneg i8 %6 to i16, !dbg !483
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !484
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !484
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !484
  %conv15 = zext i8 %8 to i16, !dbg !485
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !486
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !487
    #dbg_value(i16 %or17, !488, !DIExpression(), !466)
  %add20 = add i32 %pos.0, 3, !dbg !489
    #dbg_value(i32 %add20, !470, !DIExpression(), !466)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !490
  br i1 %cmp22, label %if.then, label %if.end, !dbg !490

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !492
    #dbg_value(i32 %inc, !471, !DIExpression(), !466)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !493
  store i16 %and, ptr %arrayidx24, align 2, !dbg !494
  br label %if.end, !dbg !493

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !466
    #dbg_value(i32 %ctr.1, !471, !DIExpression(), !466)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !495
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !497
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !497

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !498
    #dbg_value(i32 %inc31, !471, !DIExpression(), !466)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !499
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !500
  br label %if.end33, !dbg !499

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !501
    #dbg_value(i32 %ctr.2, !471, !DIExpression(), !466)
  br label %while.cond, !dbg !472, !llvm.loop !502

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !466
  ret i32 %ctr.0.lcssa, !dbg !504
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !505 {
entry:
  %state.i50 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i3 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i1 = alloca [192 x i8], align 1
  %buf.i = alloca [192 x i8], align 1
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !508, !DIExpression(), !509)
    #dbg_value(ptr %sk, !510, !DIExpression(), !509)
    #dbg_value(ptr %coins, !511, !DIExpression(), !509)
    #dbg_declare(ptr %buf, !512, !DIExpression(), !513)
    #dbg_value(ptr %buf, !514, !DIExpression(), !509)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !515
    #dbg_value(ptr %add.ptr, !516, !DIExpression(), !509)
    #dbg_value(i8 0, !517, !DIExpression(), !509)
    #dbg_declare(ptr %a, !518, !DIExpression(), !520)
    #dbg_declare(ptr %e, !521, !DIExpression(), !522)
    #dbg_declare(ptr %pkpv, !523, !DIExpression(), !524)
    #dbg_declare(ptr %skpv, !525, !DIExpression(), !526)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !527
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !528
  store i8 2, ptr %arrayidx, align 1, !dbg !529
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !530
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !531
    #dbg_value(i32 0, !532, !DIExpression(), !509)
  br label %for.cond, !dbg !533

for.cond:                                         ; preds = %keccak_squeeze.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit ], !dbg !535
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit ], !dbg !509
    #dbg_value(i8 %nonce.0, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.0, !532, !DIExpression(), !509)
  %exitcond182 = icmp ne i32 %i.0, 2, !dbg !536
  br i1 %exitcond182, label %for.body, label %for.cond8.preheader, !dbg !538

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !539

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !517, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !509)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i1), !dbg !541
    #dbg_value(ptr %arrayidx6, !552, !DIExpression(), !553)
    #dbg_value(ptr %add.ptr, !554, !DIExpression(), !553)
    #dbg_value(i8 %nonce.0, !555, !DIExpression(), !553)
    #dbg_declare(ptr %buf.i1, !556, !DIExpression(), !560)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i3), !dbg !561
    #dbg_value(ptr %buf.i1, !566, !DIExpression(), !567)
    #dbg_value(i32 192, !568, !DIExpression(), !567)
    #dbg_value(ptr %add.ptr, !569, !DIExpression(), !567)
    #dbg_value(i8 %nonce.0, !570, !DIExpression(), !567)
    #dbg_declare(ptr %extkey.i3, !571, !DIExpression(), !575)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i3, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !561
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %extkey.i3, i32 32, !dbg !576
  store i8 %nonce.0, ptr %arrayidx.i5, align 1, !dbg !577
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i50), !dbg !578
    #dbg_value(ptr %buf.i1, !585, !DIExpression(), !586)
    #dbg_value(i32 192, !587, !DIExpression(), !586)
    #dbg_value(ptr %extkey.i3, !588, !DIExpression(), !586)
    #dbg_value(i32 33, !589, !DIExpression(), !586)
    #dbg_declare(ptr %state.i50, !590, !DIExpression(), !591)
    #dbg_value(ptr %state.i50, !592, !DIExpression(), !593)
    #dbg_value(ptr %extkey.i3, !594, !DIExpression(), !593)
    #dbg_value(i32 33, !595, !DIExpression(), !593)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i50, i32 noundef 136, ptr noundef nonnull %extkey.i3, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !578
  %pos.i.i51 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !596
  store i32 136, ptr %pos.i.i51, align 8, !dbg !597
    #dbg_value(i32 1, !598, !DIExpression(), !586)
    #dbg_value(ptr %buf.i1, !599, !DIExpression(), !601)
    #dbg_value(i32 1, !603, !DIExpression(), !601)
    #dbg_value(ptr %state.i50, !604, !DIExpression(), !601)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !605)
    #dbg_value(i32 1, !355, !DIExpression(), !605)
    #dbg_value(ptr %state.i50, !356, !DIExpression(), !605)
    #dbg_value(i32 136, !357, !DIExpression(), !605)
  br label %while.cond.i, !dbg !607

while.cond.i:                                     ; preds = %for.end.i, %for.body
  %nblocks.addr.0.i = phi i32 [ 1, %for.body ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf.i1, %for.body ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !605)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !605)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !607
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !607

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !608
    #dbg_value(i32 0, !361, !DIExpression(), !605)
  br label %for.cond.i98, !dbg !609

for.cond.i98:                                     ; preds = %store64.exit.i, %while.body.i
  %i.0.i99 = phi i32 [ 0, %while.body.i ], [ %inc.i105, %store64.exit.i ], !dbg !610
    #dbg_value(i32 %i.0.i99, !361, !DIExpression(), !605)
  %exitcond181 = icmp ne i32 %i.0.i99, 17, !dbg !611
  br i1 %exitcond181, label %for.body.i101, label %for.end.i, !dbg !612

for.body.i101:                                    ; preds = %for.cond.i98
  %mul.i102 = shl nuw nsw i32 %i.0.i99, 3, !dbg !613
  %add.ptr.i103 = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i102, !dbg !614
  %arrayidx.i104 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %i.0.i99, !dbg !615
  %0 = load i64, ptr %arrayidx.i104, align 8, !dbg !615
    #dbg_value(ptr %add.ptr.i103, !371, !DIExpression(), !616)
    #dbg_value(i64 %0, !377, !DIExpression(), !616)
    #dbg_value(i32 0, !378, !DIExpression(), !616)
  br label %for.cond.i.i, !dbg !618

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i101
  %i.0.i.i = phi i32 [ 0, %for.body.i101 ], [ %inc.i.i, %for.body.i.i ], !dbg !619
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !616)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !620
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !621

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i106 = shl nuw nsw i32 %i.0.i.i, 3, !dbg !622
  %sh_prom.i.i = zext nneg i32 %mul.i.i106 to i64, !dbg !623
  %shr.i.i107 = lshr i64 %0, %sh_prom.i.i, !dbg !623
  %conv.i.i108 = trunc i64 %shr.i.i107 to i8, !dbg !624
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i103, i32 %i.0.i.i, !dbg !625
  store i8 %conv.i.i108, ptr %arrayidx.i.i, align 1, !dbg !626
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !627
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !616)
  br label %for.cond.i.i, !dbg !628, !llvm.loop !629

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i105 = add nuw nsw i32 %i.0.i99, 1, !dbg !631
    #dbg_value(i32 %inc.i105, !361, !DIExpression(), !605)
  br label %for.cond.i98, !dbg !632, !llvm.loop !633

for.end.i:                                        ; preds = %for.cond.i98
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !635
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !605)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !636
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !605)
  br label %while.cond.i, !dbg !607, !llvm.loop !637

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 56, !587, !DIExpression(), !586)
  %add.ptr.i52 = getelementptr inbounds nuw i8, ptr %buf.i1, i32 136, !dbg !639
    #dbg_value(ptr %add.ptr.i52, !585, !DIExpression(), !586)
    #dbg_value(ptr %add.ptr.i52, !640, !DIExpression(), !642)
    #dbg_value(i32 56, !644, !DIExpression(), !642)
    #dbg_value(ptr %state.i50, !645, !DIExpression(), !642)
  %pos.i1.i53 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !646
  %1 = load i32, ptr %pos.i1.i53, align 8, !dbg !646
    #dbg_value(ptr %add.ptr.i52, !647, !DIExpression(), !651)
    #dbg_value(i32 56, !653, !DIExpression(), !651)
    #dbg_value(ptr %state.i50, !654, !DIExpression(), !651)
    #dbg_value(i32 %1, !655, !DIExpression(), !651)
    #dbg_value(i32 136, !656, !DIExpression(), !651)
  br label %while.cond.i137, !dbg !657

while.cond.i137:                                  ; preds = %for.end.i145, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i143.lcssa, %for.end.i145 ]
  %outlen.addr.0.i = phi i32 [ 56, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i145 ]
  %out.addr.0.i138 = phi ptr [ %add.ptr.i52, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i145 ]
    #dbg_value(ptr %out.addr.0.i138, !647, !DIExpression(), !651)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !651)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !651)
  %tobool.not.i139 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !657
  br i1 %tobool.not.i139, label %keccak_squeeze.exit, label %while.body.i140, !dbg !657

while.body.i140:                                  ; preds = %while.cond.i137
  %cmp.i141 = icmp eq i32 %pos.addr.0.i, 136, !dbg !658
  br i1 %cmp.i141, label %if.then.i, label %if.end.i, !dbg !658

if.then.i:                                        ; preds = %while.body.i140
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !661
    #dbg_value(i32 0, !655, !DIExpression(), !651)
  br label %if.end.i, !dbg !663

if.end.i:                                         ; preds = %if.then.i, %while.body.i140
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i140 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !651)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !651)
  br label %for.cond.i142, !dbg !665

for.cond.i142:                                    ; preds = %for.body.i146, %if.end.i
  %i.0.i143 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i150, %for.body.i146 ], !dbg !667
  %out.addr.1.i = phi ptr [ %out.addr.0.i138, %if.end.i ], [ %incdec.ptr.i, %for.body.i146 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !651)
    #dbg_value(i32 %i.0.i143, !664, !DIExpression(), !651)
  %cmp1.i = icmp ult i32 %i.0.i143, 136, !dbg !668
  %add.i144 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !670
  %cmp2.i = icmp ult i32 %i.0.i143, %add.i144, !dbg !670
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !670
  br i1 %2, label %for.body.i146, label %for.end.i145, !dbg !671

for.body.i146:                                    ; preds = %for.cond.i142
  %div1.i = lshr i32 %i.0.i143, 3, !dbg !672
  %arrayidx.i147 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %div1.i, !dbg !673
  %3 = load i64, ptr %arrayidx.i147, align 8, !dbg !673
  %rem.i = shl nuw nsw i32 %i.0.i143, 3, !dbg !674
  %mul.i148 = and i32 %rem.i, 56, !dbg !674
  %sh_prom.i = zext nneg i32 %mul.i148 to i64, !dbg !675
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !675
  %conv.i149 = trunc i64 %shr.i to i8, !dbg !673
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !651)
  store i8 %conv.i149, ptr %out.addr.1.i, align 1, !dbg !676
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !677
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !651)
  %inc.i150 = add nuw nsw i32 %i.0.i143, 1, !dbg !678
    #dbg_value(i32 %inc.i150, !664, !DIExpression(), !651)
  br label %for.cond.i142, !dbg !679, !llvm.loop !680

for.end.i145:                                     ; preds = %for.cond.i142
  %i.0.i143.lcssa = phi i32 [ %i.0.i143, %for.cond.i142 ], !dbg !667
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i142 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i143.lcssa, !dbg !682
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !683
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !651)
    #dbg_value(i32 %i.0.i143.lcssa, !655, !DIExpression(), !651)
  br label %while.cond.i137, !dbg !657, !llvm.loop !684

keccak_squeeze.exit:                              ; preds = %while.cond.i137
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i137 ]
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !686
  %pos1.i.i55 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !687
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i55, align 8, !dbg !688
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i50), !dbg !689
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i3), !dbg !690
    #dbg_value(ptr %arrayidx6, !691, !DIExpression(), !701)
    #dbg_value(ptr %buf.i1, !703, !DIExpression(), !701)
  call fastcc void @cbd3(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %buf.i1) #4, !dbg !704
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i1), !dbg !705
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !706
    #dbg_value(i8 %inc, !517, !DIExpression(), !509)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !707
    #dbg_value(i32 %inc7, !532, !DIExpression(), !509)
  br label %for.cond, !dbg !708, !llvm.loop !709

for.cond8:                                        ; preds = %for.cond8.preheader, %keccak_squeeze.exit180
  %i.1 = phi i32 [ %inc15, %keccak_squeeze.exit180 ], [ 0, %for.cond8.preheader ], !dbg !711
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit180 ], [ 2, %for.cond8.preheader ], !dbg !509
    #dbg_value(i8 %nonce.1, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.1, !532, !DIExpression(), !509)
  %exitcond185 = icmp ne i32 %i.1, 2, !dbg !712
  br i1 %exitcond185, label %for.body10, label %for.cond.i7.preheader, !dbg !539

for.cond.i7.preheader:                            ; preds = %for.cond8
  br label %for.cond.i7, !dbg !714

for.body10:                                       ; preds = %for.cond8
    #dbg_value(i8 %nonce.1, !517, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !509)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i), !dbg !731
    #dbg_value(ptr %arrayidx12, !552, !DIExpression(), !733)
    #dbg_value(ptr %add.ptr, !554, !DIExpression(), !733)
    #dbg_value(i8 %nonce.1, !555, !DIExpression(), !733)
    #dbg_declare(ptr %buf.i, !556, !DIExpression(), !734)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !735
    #dbg_value(ptr %buf.i, !566, !DIExpression(), !737)
    #dbg_value(i32 192, !568, !DIExpression(), !737)
    #dbg_value(ptr %add.ptr, !569, !DIExpression(), !737)
    #dbg_value(i8 %nonce.1, !570, !DIExpression(), !737)
    #dbg_declare(ptr %extkey.i, !571, !DIExpression(), !738)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !735
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !739
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !740
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !741
    #dbg_value(ptr %buf.i, !585, !DIExpression(), !744)
    #dbg_value(i32 192, !587, !DIExpression(), !744)
    #dbg_value(ptr %extkey.i, !588, !DIExpression(), !744)
    #dbg_value(i32 33, !589, !DIExpression(), !744)
    #dbg_declare(ptr %state.i, !590, !DIExpression(), !745)
    #dbg_value(ptr %state.i, !592, !DIExpression(), !746)
    #dbg_value(ptr %extkey.i, !594, !DIExpression(), !746)
    #dbg_value(i32 33, !595, !DIExpression(), !746)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !741
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !747
  store i32 136, ptr %pos.i.i, align 8, !dbg !748
    #dbg_value(i32 1, !598, !DIExpression(), !744)
    #dbg_value(ptr %buf.i, !599, !DIExpression(), !749)
    #dbg_value(i32 1, !603, !DIExpression(), !749)
    #dbg_value(ptr %state.i, !604, !DIExpression(), !749)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !751)
    #dbg_value(i32 1, !355, !DIExpression(), !751)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !751)
    #dbg_value(i32 136, !357, !DIExpression(), !751)
  br label %while.cond.i109, !dbg !753

while.cond.i109:                                  ; preds = %for.end.i117, %for.body10
  %nblocks.addr.0.i110 = phi i32 [ 1, %for.body10 ], [ %sub.i119, %for.end.i117 ]
  %out.addr.0.i111 = phi ptr [ %buf.i, %for.body10 ], [ %add.ptr1.i118, %for.end.i117 ]
    #dbg_value(ptr %out.addr.0.i111, !348, !DIExpression(), !751)
    #dbg_value(i32 %nblocks.addr.0.i110, !355, !DIExpression(), !751)
  %tobool.not.i112 = icmp eq i32 %nblocks.addr.0.i110, 0, !dbg !753
  br i1 %tobool.not.i112, label %keccak_squeezeblocks.exit136, label %while.body.i113, !dbg !753

while.body.i113:                                  ; preds = %while.cond.i109
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !754
    #dbg_value(i32 0, !361, !DIExpression(), !751)
  br label %for.cond.i114, !dbg !755

for.cond.i114:                                    ; preds = %store64.exit.i127, %while.body.i113
  %i.0.i115 = phi i32 [ 0, %while.body.i113 ], [ %inc.i128, %store64.exit.i127 ], !dbg !756
    #dbg_value(i32 %i.0.i115, !361, !DIExpression(), !751)
  %exitcond184 = icmp ne i32 %i.0.i115, 17, !dbg !757
  br i1 %exitcond184, label %for.body.i120, label %for.end.i117, !dbg !758

for.body.i120:                                    ; preds = %for.cond.i114
  %mul.i121 = shl nuw nsw i32 %i.0.i115, 3, !dbg !759
  %add.ptr.i122 = getelementptr inbounds nuw i8, ptr %out.addr.0.i111, i32 %mul.i121, !dbg !760
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %state.i, i32 %i.0.i115, !dbg !761
  %4 = load i64, ptr %arrayidx.i123, align 8, !dbg !761
    #dbg_value(ptr %add.ptr.i122, !371, !DIExpression(), !762)
    #dbg_value(i64 %4, !377, !DIExpression(), !762)
    #dbg_value(i32 0, !378, !DIExpression(), !762)
  br label %for.cond.i.i124, !dbg !764

for.cond.i.i124:                                  ; preds = %for.body.i.i129, %for.body.i120
  %i.0.i.i125 = phi i32 [ 0, %for.body.i120 ], [ %inc.i.i135, %for.body.i.i129 ], !dbg !765
    #dbg_value(i32 %i.0.i.i125, !378, !DIExpression(), !762)
  %exitcond183 = icmp ne i32 %i.0.i.i125, 8, !dbg !766
  br i1 %exitcond183, label %for.body.i.i129, label %store64.exit.i127, !dbg !767

for.body.i.i129:                                  ; preds = %for.cond.i.i124
  %mul.i.i130 = shl nuw nsw i32 %i.0.i.i125, 3, !dbg !768
  %sh_prom.i.i131 = zext nneg i32 %mul.i.i130 to i64, !dbg !769
  %shr.i.i132 = lshr i64 %4, %sh_prom.i.i131, !dbg !769
  %conv.i.i133 = trunc i64 %shr.i.i132 to i8, !dbg !770
  %arrayidx.i.i134 = getelementptr inbounds nuw i8, ptr %add.ptr.i122, i32 %i.0.i.i125, !dbg !771
  store i8 %conv.i.i133, ptr %arrayidx.i.i134, align 1, !dbg !772
  %inc.i.i135 = add nuw nsw i32 %i.0.i.i125, 1, !dbg !773
    #dbg_value(i32 %inc.i.i135, !378, !DIExpression(), !762)
  br label %for.cond.i.i124, !dbg !774, !llvm.loop !775

store64.exit.i127:                                ; preds = %for.cond.i.i124
  %inc.i128 = add nuw nsw i32 %i.0.i115, 1, !dbg !777
    #dbg_value(i32 %inc.i128, !361, !DIExpression(), !751)
  br label %for.cond.i114, !dbg !778, !llvm.loop !779

for.end.i117:                                     ; preds = %for.cond.i114
  %add.ptr1.i118 = getelementptr inbounds nuw i8, ptr %out.addr.0.i111, i32 136, !dbg !781
    #dbg_value(ptr %add.ptr1.i118, !348, !DIExpression(), !751)
  %sub.i119 = add nsw i32 %nblocks.addr.0.i110, -1, !dbg !782
    #dbg_value(i32 %sub.i119, !355, !DIExpression(), !751)
  br label %while.cond.i109, !dbg !753, !llvm.loop !783

keccak_squeezeblocks.exit136:                     ; preds = %while.cond.i109
    #dbg_value(i32 56, !587, !DIExpression(), !744)
  %add.ptr.i49 = getelementptr inbounds nuw i8, ptr %buf.i, i32 136, !dbg !785
    #dbg_value(ptr %add.ptr.i49, !585, !DIExpression(), !744)
    #dbg_value(ptr %add.ptr.i49, !640, !DIExpression(), !786)
    #dbg_value(i32 56, !644, !DIExpression(), !786)
    #dbg_value(ptr %state.i, !645, !DIExpression(), !786)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !788
  %5 = load i32, ptr %pos.i1.i, align 8, !dbg !788
    #dbg_value(ptr %add.ptr.i49, !647, !DIExpression(), !789)
    #dbg_value(i32 56, !653, !DIExpression(), !789)
    #dbg_value(ptr %state.i, !654, !DIExpression(), !789)
    #dbg_value(i32 %5, !655, !DIExpression(), !789)
    #dbg_value(i32 136, !656, !DIExpression(), !789)
  br label %while.cond.i151, !dbg !791

while.cond.i151:                                  ; preds = %for.end.i166, %keccak_squeezeblocks.exit136
  %pos.addr.0.i152 = phi i32 [ %5, %keccak_squeezeblocks.exit136 ], [ %i.0.i161.lcssa, %for.end.i166 ]
  %outlen.addr.0.i153 = phi i32 [ 56, %keccak_squeezeblocks.exit136 ], [ %sub3.i168, %for.end.i166 ]
  %out.addr.0.i154 = phi ptr [ %add.ptr.i49, %keccak_squeezeblocks.exit136 ], [ %out.addr.1.i162.lcssa, %for.end.i166 ]
    #dbg_value(ptr %out.addr.0.i154, !647, !DIExpression(), !789)
    #dbg_value(i32 %outlen.addr.0.i153, !653, !DIExpression(), !789)
    #dbg_value(i32 %pos.addr.0.i152, !655, !DIExpression(), !789)
  %tobool.not.i155 = icmp eq i32 %outlen.addr.0.i153, 0, !dbg !791
  br i1 %tobool.not.i155, label %keccak_squeeze.exit180, label %while.body.i156, !dbg !791

while.body.i156:                                  ; preds = %while.cond.i151
  %cmp.i157 = icmp eq i32 %pos.addr.0.i152, 136, !dbg !792
  br i1 %cmp.i157, label %if.then.i179, label %if.end.i158, !dbg !792

if.then.i179:                                     ; preds = %while.body.i156
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !793
    #dbg_value(i32 0, !655, !DIExpression(), !789)
  br label %if.end.i158, !dbg !794

if.end.i158:                                      ; preds = %if.then.i179, %while.body.i156
  %pos.addr.1.i159 = phi i32 [ 0, %if.then.i179 ], [ %pos.addr.0.i152, %while.body.i156 ]
    #dbg_value(i32 %pos.addr.1.i159, !655, !DIExpression(), !789)
    #dbg_value(i32 %pos.addr.1.i159, !664, !DIExpression(), !789)
  br label %for.cond.i160, !dbg !795

for.cond.i160:                                    ; preds = %for.body.i169, %if.end.i158
  %i.0.i161 = phi i32 [ %pos.addr.1.i159, %if.end.i158 ], [ %inc.i178, %for.body.i169 ], !dbg !796
  %out.addr.1.i162 = phi ptr [ %out.addr.0.i154, %if.end.i158 ], [ %incdec.ptr.i177, %for.body.i169 ]
    #dbg_value(ptr %out.addr.1.i162, !647, !DIExpression(), !789)
    #dbg_value(i32 %i.0.i161, !664, !DIExpression(), !789)
  %cmp1.i163 = icmp ult i32 %i.0.i161, 136, !dbg !797
  %add.i164 = add i32 %pos.addr.1.i159, %outlen.addr.0.i153, !dbg !798
  %cmp2.i165 = icmp ult i32 %i.0.i161, %add.i164, !dbg !798
  %6 = select i1 %cmp1.i163, i1 %cmp2.i165, i1 false, !dbg !798
  br i1 %6, label %for.body.i169, label %for.end.i166, !dbg !799

for.body.i169:                                    ; preds = %for.cond.i160
  %div1.i170 = lshr i32 %i.0.i161, 3, !dbg !800
  %arrayidx.i171 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i170, !dbg !801
  %7 = load i64, ptr %arrayidx.i171, align 8, !dbg !801
  %rem.i172 = shl nuw nsw i32 %i.0.i161, 3, !dbg !802
  %mul.i173 = and i32 %rem.i172, 56, !dbg !802
  %sh_prom.i174 = zext nneg i32 %mul.i173 to i64, !dbg !803
  %shr.i175 = lshr i64 %7, %sh_prom.i174, !dbg !803
  %conv.i176 = trunc i64 %shr.i175 to i8, !dbg !801
    #dbg_value(ptr %out.addr.1.i162, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !789)
  store i8 %conv.i176, ptr %out.addr.1.i162, align 1, !dbg !804
  %incdec.ptr.i177 = getelementptr inbounds nuw i8, ptr %out.addr.1.i162, i32 1, !dbg !805
    #dbg_value(ptr %incdec.ptr.i177, !647, !DIExpression(), !789)
  %inc.i178 = add nuw nsw i32 %i.0.i161, 1, !dbg !806
    #dbg_value(i32 %inc.i178, !664, !DIExpression(), !789)
  br label %for.cond.i160, !dbg !807, !llvm.loop !808

for.end.i166:                                     ; preds = %for.cond.i160
  %i.0.i161.lcssa = phi i32 [ %i.0.i161, %for.cond.i160 ], !dbg !796
  %out.addr.1.i162.lcssa = phi ptr [ %out.addr.1.i162, %for.cond.i160 ]
  %sub.neg.i167 = sub i32 %pos.addr.1.i159, %i.0.i161.lcssa, !dbg !810
  %sub3.i168 = add i32 %sub.neg.i167, %outlen.addr.0.i153, !dbg !811
    #dbg_value(i32 %sub3.i168, !653, !DIExpression(), !789)
    #dbg_value(i32 %i.0.i161.lcssa, !655, !DIExpression(), !789)
  br label %while.cond.i151, !dbg !791, !llvm.loop !812

keccak_squeeze.exit180:                           ; preds = %while.cond.i151
  %pos.addr.0.i152.lcssa = phi i32 [ %pos.addr.0.i152, %while.cond.i151 ]
  %arrayidx12 = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !814
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !815
  store i32 %pos.addr.0.i152.lcssa, ptr %pos1.i.i, align 8, !dbg !816
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !817
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !818
    #dbg_value(ptr %arrayidx12, !691, !DIExpression(), !819)
    #dbg_value(ptr %buf.i, !703, !DIExpression(), !819)
  call fastcc void @cbd3(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %buf.i) #4, !dbg !821
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i), !dbg !822
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !823
    #dbg_value(i8 %inc13, !517, !DIExpression(), !509)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !824
    #dbg_value(i32 %inc15, !532, !DIExpression(), !509)
  br label %for.cond8, !dbg !825, !llvm.loop !826

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber512_ref_poly_reduce.exit ], [ 0, %for.cond.i7.preheader ], !dbg !828
    #dbg_value(i32 %i.0.i8, !829, !DIExpression(), !830)
  %exitcond187 = icmp ne i32 %i.0.i8, 2, !dbg !831
  br i1 %exitcond187, label %for.body.i10, label %for.cond.i13.preheader, !dbg !714

for.cond.i13.preheader:                           ; preds = %for.cond.i7
  br label %for.cond.i13, !dbg !833

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i8, !dbg !835
    #dbg_value(ptr %arrayidx.i11, !836, !DIExpression(), !840)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !842
    #dbg_value(ptr %arrayidx.i11, !843, !DIExpression(), !845)
    #dbg_value(i32 0, !847, !DIExpression(), !845)
  br label %for.cond.i56, !dbg !848

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i10
  %i.0.i57 = phi i32 [ 0, %for.body.i10 ], [ %inc.i62, %for.body.i59 ], !dbg !850
    #dbg_value(i32 %i.0.i57, !847, !DIExpression(), !845)
  %exitcond186 = icmp ne i32 %i.0.i57, 256, !dbg !851
  br i1 %exitcond186, label %for.body.i59, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !853

for.body.i59:                                     ; preds = %for.cond.i56
  %arrayidx.i60 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i57, !dbg !854
  %8 = load i16, ptr %arrayidx.i60, align 2, !dbg !854
    #dbg_value(i16 %8, !855, !DIExpression(), !860)
    #dbg_value(i16 20159, !862, !DIExpression(), !860)
  %conv.i.i = sext i16 %8 to i32, !dbg !863
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !864
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !865
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !866
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !860)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !860)
  %9 = trunc nsw i32 %shr.i.i to i16, !dbg !868
  %10 = mul i16 %9, -3329, !dbg !868
  %conv7.i.i = add i16 %10, %8, !dbg !868
  %arrayidx2.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i57, !dbg !869
  store i16 %conv7.i.i, ptr %arrayidx2.i61, align 2, !dbg !870
  %inc.i62 = add nuw nsw i32 %i.0.i57, 1, !dbg !871
    #dbg_value(i32 %inc.i62, !847, !DIExpression(), !845)
  br label %for.cond.i56, !dbg !872, !llvm.loop !873

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i56
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !875
    #dbg_value(i32 %inc.i12, !829, !DIExpression(), !830)
  br label %for.cond.i7, !dbg !876, !llvm.loop !877

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit88
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber512_ref_poly_reduce.exit88 ], [ 0, %for.cond.i13.preheader ], !dbg !879
    #dbg_value(i32 %i.0.i14, !829, !DIExpression(), !880)
  %exitcond189 = icmp ne i32 %i.0.i14, 2, !dbg !881
  br i1 %exitcond189, label %for.body.i16, label %for.cond17.preheader, !dbg !833

for.cond17.preheader:                             ; preds = %for.cond.i13
  br label %for.cond17, !dbg !882

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.0.i14, !dbg !884
    #dbg_value(ptr %arrayidx.i17, !836, !DIExpression(), !885)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !887
    #dbg_value(ptr %arrayidx.i17, !843, !DIExpression(), !888)
    #dbg_value(i32 0, !847, !DIExpression(), !888)
  br label %for.cond.i76, !dbg !890

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i16
  %i.0.i77 = phi i32 [ 0, %for.body.i16 ], [ %inc.i87, %for.body.i79 ], !dbg !891
    #dbg_value(i32 %i.0.i77, !847, !DIExpression(), !888)
  %exitcond188 = icmp ne i32 %i.0.i77, 256, !dbg !892
  br i1 %exitcond188, label %for.body.i79, label %pqcrystals_kyber512_ref_poly_reduce.exit88, !dbg !893

for.body.i79:                                     ; preds = %for.cond.i76
  %arrayidx.i80 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !894
  %11 = load i16, ptr %arrayidx.i80, align 2, !dbg !894
    #dbg_value(i16 %11, !855, !DIExpression(), !895)
    #dbg_value(i16 20159, !862, !DIExpression(), !895)
  %conv.i.i81 = sext i16 %11 to i32, !dbg !897
  %mul.i.i82 = mul nsw i32 %conv.i.i81, 20159, !dbg !898
  %add.i.i83 = add nsw i32 %mul.i.i82, 33554432, !dbg !899
  %shr.i.i84 = ashr i32 %add.i.i83, 26, !dbg !900
    #dbg_value(i32 %shr.i.i84, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !895)
    #dbg_value(i32 %shr.i.i84, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !895)
  %12 = trunc nsw i32 %shr.i.i84 to i16, !dbg !901
  %13 = mul i16 %12, -3329, !dbg !901
  %conv7.i.i85 = add i16 %13, %11, !dbg !901
  %arrayidx2.i86 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !902
  store i16 %conv7.i.i85, ptr %arrayidx2.i86, align 2, !dbg !903
  %inc.i87 = add nuw nsw i32 %i.0.i77, 1, !dbg !904
    #dbg_value(i32 %inc.i87, !847, !DIExpression(), !888)
  br label %for.cond.i76, !dbg !905, !llvm.loop !906

pqcrystals_kyber512_ref_poly_reduce.exit88:       ; preds = %for.cond.i76
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !908
    #dbg_value(i32 %inc.i18, !829, !DIExpression(), !880)
  br label %for.cond.i13, !dbg !909, !llvm.loop !910

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber512_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber512_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !912
    #dbg_value(i32 %i.2, !532, !DIExpression(), !509)
  %exitcond191 = icmp ne i32 %i.2, 2, !dbg !913
  br i1 %exitcond191, label %for.body19, label %for.cond.i20.preheader, !dbg !882

for.cond.i20.preheader:                           ; preds = %for.cond17
  br label %for.cond.i20, !dbg !915

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !923
  %arrayidx22 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !925
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !926
  %arrayidx24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !927
    #dbg_value(ptr %arrayidx24, !928, !DIExpression(), !930)
    #dbg_value(i16 1353, !932, !DIExpression(), !930)
    #dbg_value(i32 0, !933, !DIExpression(), !930)
  br label %for.cond.i89, !dbg !934

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !936
    #dbg_value(i32 %i.0.i90, !933, !DIExpression(), !930)
  %exitcond190 = icmp ne i32 %i.0.i90, 256, !dbg !937
  br i1 %exitcond190, label %for.body.i92, label %pqcrystals_kyber512_ref_poly_tomont.exit, !dbg !939

for.body.i92:                                     ; preds = %for.cond.i89
  %arrayidx.i93 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !940
  %14 = load i16, ptr %arrayidx.i93, align 2, !dbg !940
  %conv.i = sext i16 %14 to i32, !dbg !941
  %mul.i94 = mul nsw i32 %conv.i, 1353, !dbg !942
    #dbg_value(i32 %mul.i94, !943, !DIExpression(), !946)
    #dbg_value(i32 %mul.i94, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !946)
  %sext.i.i = mul i32 %conv.i, 1346961408, !dbg !949
  %conv3.i.i = ashr exact i32 %sext.i.i, 16, !dbg !949
  %mul4.neg.i.i = mul nsw i32 %conv3.i.i, -3329, !dbg !950
  %sub.i.i = add nsw i32 %mul4.neg.i.i, %mul.i94, !dbg !951
  %shr.i.i95 = lshr i32 %sub.i.i, 16, !dbg !952
  %conv5.i.i = trunc nuw i32 %shr.i.i95 to i16, !dbg !953
    #dbg_value(i16 %conv5.i.i, !948, !DIExpression(), !946)
  %arrayidx2.i96 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !954
  store i16 %conv5.i.i, ptr %arrayidx2.i96, align 2, !dbg !955
  %inc.i97 = add nuw nsw i32 %i.0.i90, 1, !dbg !956
    #dbg_value(i32 %inc.i97, !933, !DIExpression(), !930)
  br label %for.cond.i89, !dbg !957, !llvm.loop !958

pqcrystals_kyber512_ref_poly_tomont.exit:         ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !960
    #dbg_value(i32 %inc26, !532, !DIExpression(), !509)
  br label %for.cond17, !dbg !961, !llvm.loop !962

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %pqcrystals_kyber512_ref_poly_add.exit
  %i.0.i21 = phi i32 [ %inc.i25, %pqcrystals_kyber512_ref_poly_add.exit ], [ 0, %for.cond.i20.preheader ], !dbg !964
    #dbg_value(i32 %i.0.i21, !965, !DIExpression(), !966)
  %exitcond193 = icmp ne i32 %i.0.i21, 2, !dbg !967
  br i1 %exitcond193, label %for.body.i23, label %for.cond.i.preheader, !dbg !915

for.cond.i.preheader:                             ; preds = %for.cond.i20
  br label %for.cond.i, !dbg !969

for.body.i23:                                     ; preds = %for.cond.i20
  %arrayidx.i24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i21, !dbg !973
  %arrayidx2.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i21, !dbg !974
  %arrayidx4.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.0.i21, !dbg !975
    #dbg_value(ptr %arrayidx.i24, !976, !DIExpression(), !982)
    #dbg_value(ptr %arrayidx2.i, !984, !DIExpression(), !982)
    #dbg_value(ptr %arrayidx4.i, !985, !DIExpression(), !982)
    #dbg_value(i32 0, !986, !DIExpression(), !982)
  br label %for.cond.i42, !dbg !987

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i23
  %i.0.i43 = phi i32 [ 0, %for.body.i23 ], [ %inc.i48, %for.body.i45 ], !dbg !989
    #dbg_value(i32 %i.0.i43, !986, !DIExpression(), !982)
  %exitcond192 = icmp ne i32 %i.0.i43, 256, !dbg !990
  br i1 %exitcond192, label %for.body.i45, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !992

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i43, !dbg !993
  %15 = load i16, ptr %arrayidx.i46, align 2, !dbg !993
  %arrayidx2.i47 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i43, !dbg !994
  %16 = load i16, ptr %arrayidx2.i47, align 2, !dbg !994
  %add.i = add i16 %15, %16, !dbg !995
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i24, i32 0, i32 %i.0.i43, !dbg !996
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !997
  %inc.i48 = add nuw nsw i32 %i.0.i43, 1, !dbg !998
    #dbg_value(i32 %inc.i48, !986, !DIExpression(), !982)
  br label %for.cond.i42, !dbg !999, !llvm.loop !1000

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i42
  %inc.i25 = add nuw nsw i32 %i.0.i21, 1, !dbg !1002
    #dbg_value(i32 %inc.i25, !965, !DIExpression(), !966)
  br label %for.cond.i20, !dbg !1003, !llvm.loop !1004

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit75
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit75 ], [ 0, %for.cond.i.preheader ], !dbg !1006
    #dbg_value(i32 %i.0.i, !1007, !DIExpression(), !1008)
  %exitcond195 = icmp ne i32 %i.0.i, 2, !dbg !1009
  br i1 %exitcond195, label %for.body.i, label %for.cond.i26.preheader, !dbg !969

for.cond.i26.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i26, !dbg !1011

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !1021
    #dbg_value(ptr %arrayidx.i6, !843, !DIExpression(), !1022)
    #dbg_value(i32 0, !847, !DIExpression(), !1022)
  br label %for.cond.i63, !dbg !1024

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i
  %i.0.i64 = phi i32 [ 0, %for.body.i ], [ %inc.i74, %for.body.i66 ], !dbg !1025
    #dbg_value(i32 %i.0.i64, !847, !DIExpression(), !1022)
  %exitcond194 = icmp ne i32 %i.0.i64, 256, !dbg !1026
  br i1 %exitcond194, label %for.body.i66, label %pqcrystals_kyber512_ref_poly_reduce.exit75, !dbg !1027

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i64, !dbg !1028
  %17 = load i16, ptr %arrayidx.i67, align 2, !dbg !1028
    #dbg_value(i16 %17, !855, !DIExpression(), !1029)
    #dbg_value(i16 20159, !862, !DIExpression(), !1029)
  %conv.i.i68 = sext i16 %17 to i32, !dbg !1031
  %mul.i.i69 = mul nsw i32 %conv.i.i68, 20159, !dbg !1032
  %add.i.i70 = add nsw i32 %mul.i.i69, 33554432, !dbg !1033
  %shr.i.i71 = ashr i32 %add.i.i70, 26, !dbg !1034
    #dbg_value(i32 %shr.i.i71, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1029)
    #dbg_value(i32 %shr.i.i71, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1029)
  %18 = trunc nsw i32 %shr.i.i71 to i16, !dbg !1035
  %19 = mul i16 %18, -3329, !dbg !1035
  %conv7.i.i72 = add i16 %19, %17, !dbg !1035
  %arrayidx2.i73 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i64, !dbg !1036
  store i16 %conv7.i.i72, ptr %arrayidx2.i73, align 2, !dbg !1037
  %inc.i74 = add nuw nsw i32 %i.0.i64, 1, !dbg !1038
    #dbg_value(i32 %inc.i74, !847, !DIExpression(), !1022)
  br label %for.cond.i63, !dbg !1039, !llvm.loop !1040

pqcrystals_kyber512_ref_poly_reduce.exit75:       ; preds = %for.cond.i63
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1042
    #dbg_value(i32 %inc.i, !1007, !DIExpression(), !1008)
  br label %for.cond.i, !dbg !1043, !llvm.loop !1044

for.cond.i26:                                     ; preds = %for.cond.i26.preheader, %for.body.i29
  %i.0.i27 = phi i32 [ %inc.i32, %for.body.i29 ], [ 0, %for.cond.i26.preheader ], !dbg !1046
    #dbg_value(i32 %i.0.i27, !1047, !DIExpression(), !1048)
  %exitcond196 = icmp ne i32 %i.0.i27, 2, !dbg !1049
  br i1 %exitcond196, label %for.body.i29, label %for.cond.i33.preheader, !dbg !1011

for.cond.i33.preheader:                           ; preds = %for.cond.i26
  br label %for.cond.i33, !dbg !1051

for.body.i29:                                     ; preds = %for.cond.i26
  %mul.i = mul nuw nsw i32 %i.0.i27, 384, !dbg !1057
  %add.ptr.i30 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1058
  %arrayidx.i31 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i27, !dbg !1059
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr.i30, ptr noundef nonnull %arrayidx.i31) #4, !dbg !1060
  %inc.i32 = add nuw nsw i32 %i.0.i27, 1, !dbg !1061
    #dbg_value(i32 %inc.i32, !1047, !DIExpression(), !1048)
  br label %for.cond.i26, !dbg !1062, !llvm.loop !1063

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !1065
    #dbg_value(i32 %i.0.i34, !1047, !DIExpression(), !1066)
  %exitcond197 = icmp ne i32 %i.0.i34, 2, !dbg !1067
  br i1 %exitcond197, label %for.body.i36, label %pqcrystals_kyber512_ref_polyvec_tobytes.exit41, !dbg !1051

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1068
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i37, !dbg !1069
  %arrayidx.i39 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i34, !dbg !1070
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1071
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1072
    #dbg_value(i32 %inc.i40, !1047, !DIExpression(), !1066)
  br label %for.cond.i33, !dbg !1073, !llvm.loop !1074

pqcrystals_kyber512_ref_polyvec_tobytes.exit41:   ; preds = %for.cond.i33
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 768, !dbg !1076
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1077
  ret void, !dbg !1078
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1079 {
entry:
  %state.i71 = alloca %struct.keccak_state, align 8
  %state.i65 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i8 = alloca [33 x i8], align 1
  %extkey.i5 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i2 = alloca [128 x i8], align 1
  %buf.i1 = alloca [192 x i8], align 1
  %buf.i = alloca [128 x i8], align 1
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [2 x %struct.polyvec], align 2
  %b = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %k = alloca %struct.poly, align 2
  %epp = alloca %struct.poly, align 2
    #dbg_value(ptr %c, !1082, !DIExpression(), !1083)
    #dbg_value(ptr %m, !1084, !DIExpression(), !1083)
    #dbg_value(ptr %pk, !1085, !DIExpression(), !1083)
    #dbg_value(ptr %coins, !1086, !DIExpression(), !1083)
    #dbg_declare(ptr %seed, !1087, !DIExpression(), !1088)
    #dbg_value(i8 0, !1089, !DIExpression(), !1083)
    #dbg_declare(ptr %sp, !1090, !DIExpression(), !1091)
    #dbg_declare(ptr %pkpv, !1092, !DIExpression(), !1093)
    #dbg_declare(ptr %ep, !1094, !DIExpression(), !1095)
    #dbg_declare(ptr %at, !1096, !DIExpression(), !1097)
    #dbg_declare(ptr %b, !1098, !DIExpression(), !1099)
    #dbg_declare(ptr %v, !1100, !DIExpression(), !1101)
    #dbg_declare(ptr %k, !1102, !DIExpression(), !1103)
    #dbg_declare(ptr %epp, !1104, !DIExpression(), !1105)
    #dbg_value(ptr %pkpv, !1106, !DIExpression(), !1110)
    #dbg_value(ptr %seed, !1112, !DIExpression(), !1110)
    #dbg_value(ptr %pk, !1113, !DIExpression(), !1110)
    #dbg_value(ptr %pkpv, !1114, !DIExpression(), !1118)
    #dbg_value(ptr %pk, !1120, !DIExpression(), !1118)
    #dbg_value(i32 0, !1121, !DIExpression(), !1118)
  br label %for.cond.i30, !dbg !1122

for.cond.i30:                                     ; preds = %for.body.i33, %entry
  %i.0.i31 = phi i32 [ 0, %entry ], [ %inc.i36, %for.body.i33 ], !dbg !1124
    #dbg_value(i32 %i.0.i31, !1121, !DIExpression(), !1118)
  %exitcond = icmp ne i32 %i.0.i31, 2, !dbg !1125
  br i1 %exitcond, label %for.body.i33, label %pqcrystals_kyber512_ref_polyvec_frombytes.exit, !dbg !1127

for.body.i33:                                     ; preds = %for.cond.i30
  %arrayidx.i34 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i31, !dbg !1128
  %mul.i = mul nuw nsw i32 %i.0.i31, 384, !dbg !1129
  %add.ptr.i35 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1130
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i34, ptr noundef %add.ptr.i35) #4, !dbg !1131
  %inc.i36 = add nuw nsw i32 %i.0.i31, 1, !dbg !1132
    #dbg_value(i32 %inc.i36, !1121, !DIExpression(), !1118)
  br label %for.cond.i30, !dbg !1133, !llvm.loop !1134

pqcrystals_kyber512_ref_polyvec_frombytes.exit:   ; preds = %for.cond.i30
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %pk, i32 768, !dbg !1136
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i3, i32 noundef 32) #5, !dbg !1137
    #dbg_value(ptr %k, !1138, !DIExpression(), !1142)
    #dbg_value(ptr %m, !1144, !DIExpression(), !1142)
    #dbg_value(i32 0, !1145, !DIExpression(), !1142)
  br label %for.cond.i110, !dbg !1146

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber512_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1148
    #dbg_value(i32 %i.0.i111, !1145, !DIExpression(), !1142)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1149
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber512_ref_poly_frommsg.exit, !dbg !1151

for.cond1.i.preheader:                            ; preds = %for.cond.i110
  br label %for.cond1.i, !dbg !1152

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ %inc.i117, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1155
    #dbg_value(i32 %j.0.i, !1156, !DIExpression(), !1142)
  %exitcond262 = icmp ne i32 %j.0.i, 8, !dbg !1157
  br i1 %exitcond262, label %for.body3.i, label %for.inc9.i, !dbg !1152

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i113 = shl nuw nsw i32 %i.0.i111, 3, !dbg !1159
  %add.i114 = or disjoint i32 %mul.i113, %j.0.i, !dbg !1161
  %arrayidx.i115 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %add.i114, !dbg !1162
  store i16 0, ptr %arrayidx.i115, align 2, !dbg !1163
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i111, 4, !dbg !1164
  %add.ptr.i116 = getelementptr inbounds nuw i8, ptr %k, i32 %add.ptr.idx.i, !dbg !1164
  %add.ptr6.i = getelementptr inbounds nuw i16, ptr %add.ptr.i116, i32 %j.0.i, !dbg !1165
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i111, !dbg !1166
  %0 = load i8, ptr %arrayidx7.i, align 1, !dbg !1166
  %conv.i = zext i8 %0 to i32, !dbg !1166
    #dbg_value(ptr %add.ptr6.i, !1167, !DIExpression(), !1171)
    #dbg_value(i16 1665, !1173, !DIExpression(), !1171)
    #dbg_value(!DIArgList(i32 %conv.i, i32 %j.0.i), !1174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !1171)
    #dbg_value(!DIArgList(i16 0, i32 %conv.i, i32 %j.0.i), !1174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !1171)
  %1 = load i16, ptr %add.ptr6.i, align 2, !dbg !1175
  %2 = shl nuw nsw i32 1, %j.0.i, !dbg !1176
  %3 = and i32 %2, %conv.i, !dbg !1176
  %4 = icmp eq i32 %3, 0, !dbg !1176
  %xor6.i.i = select i1 %4, i16 %1, i16 1665, !dbg !1177
  store i16 %xor6.i.i, ptr %add.ptr6.i, align 2, !dbg !1177
  %inc.i117 = add nuw nsw i32 %j.0.i, 1, !dbg !1178
    #dbg_value(i32 %inc.i117, !1156, !DIExpression(), !1142)
  br label %for.cond1.i, !dbg !1179, !llvm.loop !1180

for.inc9.i:                                       ; preds = %for.cond1.i
  %inc10.i = add nuw nsw i32 %i.0.i111, 1, !dbg !1182
    #dbg_value(i32 %inc10.i, !1145, !DIExpression(), !1142)
  br label %for.cond.i110, !dbg !1183, !llvm.loop !1184

pqcrystals_kyber512_ref_poly_frommsg.exit:        ; preds = %for.cond.i110
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1186
    #dbg_value(i32 0, !1187, !DIExpression(), !1083)
  br label %for.cond, !dbg !1188

for.cond:                                         ; preds = %keccak_squeeze.exit260, %pqcrystals_kyber512_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber512_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit260 ], !dbg !1190
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber512_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit260 ], !dbg !1083
    #dbg_value(i8 %nonce.0, !1089, !DIExpression(), !1083)
    #dbg_value(i32 %i.0, !1187, !DIExpression(), !1083)
  %exitcond266 = icmp ne i32 %i.0, 2, !dbg !1191
  br i1 %exitcond266, label %for.body, label %for.cond5.preheader, !dbg !1193

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !1194

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !1089, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1083)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i1), !dbg !1196
    #dbg_value(ptr %add.ptr, !552, !DIExpression(), !1198)
    #dbg_value(ptr %coins, !554, !DIExpression(), !1198)
    #dbg_value(i8 %nonce.0, !555, !DIExpression(), !1198)
    #dbg_declare(ptr %buf.i1, !556, !DIExpression(), !1199)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !1200
    #dbg_value(ptr %buf.i1, !566, !DIExpression(), !1202)
    #dbg_value(i32 192, !568, !DIExpression(), !1202)
    #dbg_value(ptr %coins, !569, !DIExpression(), !1202)
    #dbg_value(i8 %nonce.0, !570, !DIExpression(), !1202)
    #dbg_declare(ptr %extkey.i, !571, !DIExpression(), !1203)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %coins, i32 noundef 32) #5, !dbg !1200
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !1204
  store i8 %nonce.0, ptr %arrayidx.i, align 1, !dbg !1205
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i65), !dbg !1206
    #dbg_value(ptr %buf.i1, !585, !DIExpression(), !1209)
    #dbg_value(i32 192, !587, !DIExpression(), !1209)
    #dbg_value(ptr %extkey.i, !588, !DIExpression(), !1209)
    #dbg_value(i32 33, !589, !DIExpression(), !1209)
    #dbg_declare(ptr %state.i65, !590, !DIExpression(), !1210)
    #dbg_value(ptr %state.i65, !592, !DIExpression(), !1211)
    #dbg_value(ptr %extkey.i, !594, !DIExpression(), !1211)
    #dbg_value(i32 33, !595, !DIExpression(), !1211)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i65, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1206
  %pos.i.i66 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1212
  store i32 136, ptr %pos.i.i66, align 8, !dbg !1213
    #dbg_value(i32 1, !598, !DIExpression(), !1209)
    #dbg_value(ptr %buf.i1, !599, !DIExpression(), !1214)
    #dbg_value(i32 1, !603, !DIExpression(), !1214)
    #dbg_value(ptr %state.i65, !604, !DIExpression(), !1214)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !1216)
    #dbg_value(i32 1, !355, !DIExpression(), !1216)
    #dbg_value(ptr %state.i65, !356, !DIExpression(), !1216)
    #dbg_value(i32 136, !357, !DIExpression(), !1216)
  br label %while.cond.i129, !dbg !1218

while.cond.i129:                                  ; preds = %for.end.i137, %for.body
  %nblocks.addr.0.i130 = phi i32 [ 1, %for.body ], [ %sub.i139, %for.end.i137 ]
  %out.addr.0.i131 = phi ptr [ %buf.i1, %for.body ], [ %add.ptr1.i138, %for.end.i137 ]
    #dbg_value(ptr %out.addr.0.i131, !348, !DIExpression(), !1216)
    #dbg_value(i32 %nblocks.addr.0.i130, !355, !DIExpression(), !1216)
  %tobool.not.i132 = icmp eq i32 %nblocks.addr.0.i130, 0, !dbg !1218
  br i1 %tobool.not.i132, label %keccak_squeezeblocks.exit156, label %while.body.i133, !dbg !1218

while.body.i133:                                  ; preds = %while.cond.i129
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1219
    #dbg_value(i32 0, !361, !DIExpression(), !1216)
  br label %for.cond.i134, !dbg !1220

for.cond.i134:                                    ; preds = %store64.exit.i147, %while.body.i133
  %i.0.i135 = phi i32 [ 0, %while.body.i133 ], [ %inc.i148, %store64.exit.i147 ], !dbg !1221
    #dbg_value(i32 %i.0.i135, !361, !DIExpression(), !1216)
  %exitcond265 = icmp ne i32 %i.0.i135, 17, !dbg !1222
  br i1 %exitcond265, label %for.body.i140, label %for.end.i137, !dbg !1223

for.body.i140:                                    ; preds = %for.cond.i134
  %mul.i141 = shl nuw nsw i32 %i.0.i135, 3, !dbg !1224
  %add.ptr.i142 = getelementptr inbounds nuw i8, ptr %out.addr.0.i131, i32 %mul.i141, !dbg !1225
  %arrayidx.i143 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %i.0.i135, !dbg !1226
  %5 = load i64, ptr %arrayidx.i143, align 8, !dbg !1226
    #dbg_value(ptr %add.ptr.i142, !371, !DIExpression(), !1227)
    #dbg_value(i64 %5, !377, !DIExpression(), !1227)
    #dbg_value(i32 0, !378, !DIExpression(), !1227)
  br label %for.cond.i.i144, !dbg !1229

for.cond.i.i144:                                  ; preds = %for.body.i.i149, %for.body.i140
  %i.0.i.i145 = phi i32 [ 0, %for.body.i140 ], [ %inc.i.i155, %for.body.i.i149 ], !dbg !1230
    #dbg_value(i32 %i.0.i.i145, !378, !DIExpression(), !1227)
  %exitcond264 = icmp ne i32 %i.0.i.i145, 8, !dbg !1231
  br i1 %exitcond264, label %for.body.i.i149, label %store64.exit.i147, !dbg !1232

for.body.i.i149:                                  ; preds = %for.cond.i.i144
  %mul.i.i150 = shl nuw nsw i32 %i.0.i.i145, 3, !dbg !1233
  %sh_prom.i.i151 = zext nneg i32 %mul.i.i150 to i64, !dbg !1234
  %shr.i.i152 = lshr i64 %5, %sh_prom.i.i151, !dbg !1234
  %conv.i.i153 = trunc i64 %shr.i.i152 to i8, !dbg !1235
  %arrayidx.i.i154 = getelementptr inbounds nuw i8, ptr %add.ptr.i142, i32 %i.0.i.i145, !dbg !1236
  store i8 %conv.i.i153, ptr %arrayidx.i.i154, align 1, !dbg !1237
  %inc.i.i155 = add nuw nsw i32 %i.0.i.i145, 1, !dbg !1238
    #dbg_value(i32 %inc.i.i155, !378, !DIExpression(), !1227)
  br label %for.cond.i.i144, !dbg !1239, !llvm.loop !1240

store64.exit.i147:                                ; preds = %for.cond.i.i144
  %inc.i148 = add nuw nsw i32 %i.0.i135, 1, !dbg !1242
    #dbg_value(i32 %inc.i148, !361, !DIExpression(), !1216)
  br label %for.cond.i134, !dbg !1243, !llvm.loop !1244

for.end.i137:                                     ; preds = %for.cond.i134
  %add.ptr1.i138 = getelementptr inbounds nuw i8, ptr %out.addr.0.i131, i32 136, !dbg !1246
    #dbg_value(ptr %add.ptr1.i138, !348, !DIExpression(), !1216)
  %sub.i139 = add nsw i32 %nblocks.addr.0.i130, -1, !dbg !1247
    #dbg_value(i32 %sub.i139, !355, !DIExpression(), !1216)
  br label %while.cond.i129, !dbg !1218, !llvm.loop !1248

keccak_squeezeblocks.exit156:                     ; preds = %while.cond.i129
    #dbg_value(i32 56, !587, !DIExpression(), !1209)
  %add.ptr.i67 = getelementptr inbounds nuw i8, ptr %buf.i1, i32 136, !dbg !1250
    #dbg_value(ptr %add.ptr.i67, !585, !DIExpression(), !1209)
    #dbg_value(ptr %add.ptr.i67, !640, !DIExpression(), !1251)
    #dbg_value(i32 56, !644, !DIExpression(), !1251)
    #dbg_value(ptr %state.i65, !645, !DIExpression(), !1251)
  %pos.i1.i68 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1253
  %6 = load i32, ptr %pos.i1.i68, align 8, !dbg !1253
    #dbg_value(ptr %add.ptr.i67, !647, !DIExpression(), !1254)
    #dbg_value(i32 56, !653, !DIExpression(), !1254)
    #dbg_value(ptr %state.i65, !654, !DIExpression(), !1254)
    #dbg_value(i32 %6, !655, !DIExpression(), !1254)
    #dbg_value(i32 136, !656, !DIExpression(), !1254)
  br label %while.cond.i231, !dbg !1256

while.cond.i231:                                  ; preds = %for.end.i246, %keccak_squeezeblocks.exit156
  %pos.addr.0.i232 = phi i32 [ %6, %keccak_squeezeblocks.exit156 ], [ %i.0.i241.lcssa, %for.end.i246 ]
  %outlen.addr.0.i233 = phi i32 [ 56, %keccak_squeezeblocks.exit156 ], [ %sub3.i248, %for.end.i246 ]
  %out.addr.0.i234 = phi ptr [ %add.ptr.i67, %keccak_squeezeblocks.exit156 ], [ %out.addr.1.i242.lcssa, %for.end.i246 ]
    #dbg_value(ptr %out.addr.0.i234, !647, !DIExpression(), !1254)
    #dbg_value(i32 %outlen.addr.0.i233, !653, !DIExpression(), !1254)
    #dbg_value(i32 %pos.addr.0.i232, !655, !DIExpression(), !1254)
  %tobool.not.i235 = icmp eq i32 %outlen.addr.0.i233, 0, !dbg !1256
  br i1 %tobool.not.i235, label %keccak_squeeze.exit260, label %while.body.i236, !dbg !1256

while.body.i236:                                  ; preds = %while.cond.i231
  %cmp.i237 = icmp eq i32 %pos.addr.0.i232, 136, !dbg !1257
  br i1 %cmp.i237, label %if.then.i259, label %if.end.i238, !dbg !1257

if.then.i259:                                     ; preds = %while.body.i236
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1258
    #dbg_value(i32 0, !655, !DIExpression(), !1254)
  br label %if.end.i238, !dbg !1259

if.end.i238:                                      ; preds = %if.then.i259, %while.body.i236
  %pos.addr.1.i239 = phi i32 [ 0, %if.then.i259 ], [ %pos.addr.0.i232, %while.body.i236 ]
    #dbg_value(i32 %pos.addr.1.i239, !655, !DIExpression(), !1254)
    #dbg_value(i32 %pos.addr.1.i239, !664, !DIExpression(), !1254)
  br label %for.cond.i240, !dbg !1260

for.cond.i240:                                    ; preds = %for.body.i249, %if.end.i238
  %i.0.i241 = phi i32 [ %pos.addr.1.i239, %if.end.i238 ], [ %inc.i258, %for.body.i249 ], !dbg !1261
  %out.addr.1.i242 = phi ptr [ %out.addr.0.i234, %if.end.i238 ], [ %incdec.ptr.i257, %for.body.i249 ]
    #dbg_value(ptr %out.addr.1.i242, !647, !DIExpression(), !1254)
    #dbg_value(i32 %i.0.i241, !664, !DIExpression(), !1254)
  %cmp1.i243 = icmp ult i32 %i.0.i241, 136, !dbg !1262
  %add.i244 = add i32 %pos.addr.1.i239, %outlen.addr.0.i233, !dbg !1263
  %cmp2.i245 = icmp ult i32 %i.0.i241, %add.i244, !dbg !1263
  %7 = select i1 %cmp1.i243, i1 %cmp2.i245, i1 false, !dbg !1263
  br i1 %7, label %for.body.i249, label %for.end.i246, !dbg !1264

for.body.i249:                                    ; preds = %for.cond.i240
  %div1.i250 = lshr i32 %i.0.i241, 3, !dbg !1265
  %arrayidx.i251 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %div1.i250, !dbg !1266
  %8 = load i64, ptr %arrayidx.i251, align 8, !dbg !1266
  %rem.i252 = shl nuw nsw i32 %i.0.i241, 3, !dbg !1267
  %mul.i253 = and i32 %rem.i252, 56, !dbg !1267
  %sh_prom.i254 = zext nneg i32 %mul.i253 to i64, !dbg !1268
  %shr.i255 = lshr i64 %8, %sh_prom.i254, !dbg !1268
  %conv.i256 = trunc i64 %shr.i255 to i8, !dbg !1266
    #dbg_value(ptr %out.addr.1.i242, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1254)
  store i8 %conv.i256, ptr %out.addr.1.i242, align 1, !dbg !1269
  %incdec.ptr.i257 = getelementptr inbounds nuw i8, ptr %out.addr.1.i242, i32 1, !dbg !1270
    #dbg_value(ptr %incdec.ptr.i257, !647, !DIExpression(), !1254)
  %inc.i258 = add nuw nsw i32 %i.0.i241, 1, !dbg !1271
    #dbg_value(i32 %inc.i258, !664, !DIExpression(), !1254)
  br label %for.cond.i240, !dbg !1272, !llvm.loop !1273

for.end.i246:                                     ; preds = %for.cond.i240
  %i.0.i241.lcssa = phi i32 [ %i.0.i241, %for.cond.i240 ], !dbg !1261
  %out.addr.1.i242.lcssa = phi ptr [ %out.addr.1.i242, %for.cond.i240 ]
  %sub.neg.i247 = sub i32 %pos.addr.1.i239, %i.0.i241.lcssa, !dbg !1275
  %sub3.i248 = add i32 %sub.neg.i247, %outlen.addr.0.i233, !dbg !1276
    #dbg_value(i32 %sub3.i248, !653, !DIExpression(), !1254)
    #dbg_value(i32 %i.0.i241.lcssa, !655, !DIExpression(), !1254)
  br label %while.cond.i231, !dbg !1256, !llvm.loop !1277

keccak_squeeze.exit260:                           ; preds = %while.cond.i231
  %pos.addr.0.i232.lcssa = phi i32 [ %pos.addr.0.i232, %while.cond.i231 ]
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !1279
  %pos1.i.i70 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1280
  store i32 %pos.addr.0.i232.lcssa, ptr %pos1.i.i70, align 8, !dbg !1281
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i65), !dbg !1282
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1283
    #dbg_value(ptr %add.ptr, !691, !DIExpression(), !1284)
    #dbg_value(ptr %buf.i1, !703, !DIExpression(), !1284)
  call fastcc void @cbd3(ptr noundef nonnull %add.ptr, ptr noundef nonnull %buf.i1) #4, !dbg !1286
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i1), !dbg !1287
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !1288
    #dbg_value(i8 %inc, !1089, !DIExpression(), !1083)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !1289
    #dbg_value(i32 %inc4, !1187, !DIExpression(), !1083)
  br label %for.cond, !dbg !1290, !llvm.loop !1291

for.cond5:                                        ; preds = %for.cond5.preheader, %keccak_squeeze.exit
  %i.1 = phi i32 [ %inc13, %keccak_squeeze.exit ], [ 0, %for.cond5.preheader ], !dbg !1293
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit ], [ 2, %for.cond5.preheader ], !dbg !1083
    #dbg_value(i8 %nonce.1, !1089, !DIExpression(), !1083)
    #dbg_value(i32 %i.1, !1187, !DIExpression(), !1083)
  %exitcond267 = icmp ne i32 %i.1, 2, !dbg !1294
  br i1 %exitcond267, label %for.body7, label %for.end14, !dbg !1194

for.body7:                                        ; preds = %for.cond5
    #dbg_value(i8 %nonce.1, !1089, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1083)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !1296
    #dbg_value(ptr %add.ptr10, !1299, !DIExpression(), !1300)
    #dbg_value(ptr %coins, !1301, !DIExpression(), !1300)
    #dbg_value(i8 %nonce.1, !1302, !DIExpression(), !1300)
    #dbg_declare(ptr %buf.i, !1303, !DIExpression(), !1305)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1306
    #dbg_value(ptr %buf.i, !566, !DIExpression(), !1308)
    #dbg_value(i32 128, !568, !DIExpression(), !1308)
    #dbg_value(ptr %coins, !569, !DIExpression(), !1308)
    #dbg_value(i8 %nonce.1, !570, !DIExpression(), !1308)
    #dbg_declare(ptr %extkey.i8, !571, !DIExpression(), !1309)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1306
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1310
  store i8 %nonce.1, ptr %arrayidx.i10, align 1, !dbg !1311
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !1312
    #dbg_value(ptr %buf.i, !585, !DIExpression(), !1315)
    #dbg_value(i32 128, !587, !DIExpression(), !1315)
    #dbg_value(ptr %extkey.i8, !588, !DIExpression(), !1315)
    #dbg_value(i32 33, !589, !DIExpression(), !1315)
    #dbg_declare(ptr %state.i, !590, !DIExpression(), !1316)
    #dbg_value(ptr %state.i, !592, !DIExpression(), !1317)
    #dbg_value(ptr %extkey.i8, !594, !DIExpression(), !1317)
    #dbg_value(i32 33, !595, !DIExpression(), !1317)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i8, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1312
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1318
  store i32 136, ptr %pos.i.i, align 8, !dbg !1319
    #dbg_value(i32 0, !598, !DIExpression(), !1315)
    #dbg_value(ptr %buf.i, !599, !DIExpression(), !1320)
    #dbg_value(i32 0, !603, !DIExpression(), !1320)
    #dbg_value(ptr %state.i, !604, !DIExpression(), !1320)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !1322)
    #dbg_value(i32 0, !355, !DIExpression(), !1322)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !1322)
    #dbg_value(i32 136, !357, !DIExpression(), !1322)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !1322)
    #dbg_value(i32 0, !355, !DIExpression(), !1322)
    #dbg_value(i32 128, !587, !DIExpression(), !1315)
    #dbg_value(ptr %buf.i, !585, !DIExpression(), !1315)
    #dbg_value(ptr %buf.i, !640, !DIExpression(), !1324)
    #dbg_value(i32 128, !644, !DIExpression(), !1324)
    #dbg_value(ptr %state.i, !645, !DIExpression(), !1324)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1326
  %9 = load i32, ptr %pos.i1.i, align 8, !dbg !1326
    #dbg_value(ptr %buf.i, !647, !DIExpression(), !1327)
    #dbg_value(i32 128, !653, !DIExpression(), !1327)
    #dbg_value(ptr %state.i, !654, !DIExpression(), !1327)
    #dbg_value(i32 %9, !655, !DIExpression(), !1327)
    #dbg_value(i32 136, !656, !DIExpression(), !1327)
  br label %while.cond.i185, !dbg !1329

while.cond.i185:                                  ; preds = %for.end.i194, %for.body7
  %pos.addr.0.i = phi i32 [ %9, %for.body7 ], [ %i.0.i191.lcssa, %for.end.i194 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.body7 ], [ %sub3.i, %for.end.i194 ]
  %out.addr.0.i186 = phi ptr [ %buf.i, %for.body7 ], [ %out.addr.1.i.lcssa, %for.end.i194 ]
    #dbg_value(ptr %out.addr.0.i186, !647, !DIExpression(), !1327)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !1327)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !1327)
  %tobool.not.i187 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1329
  br i1 %tobool.not.i187, label %keccak_squeeze.exit, label %while.body.i188, !dbg !1329

while.body.i188:                                  ; preds = %while.cond.i185
  %cmp.i189 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1330
  br i1 %cmp.i189, label %if.then.i, label %if.end.i, !dbg !1330

if.then.i:                                        ; preds = %while.body.i188
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !1331
    #dbg_value(i32 0, !655, !DIExpression(), !1327)
  br label %if.end.i, !dbg !1332

if.end.i:                                         ; preds = %if.then.i, %while.body.i188
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i188 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !1327)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !1327)
  br label %for.cond.i190, !dbg !1333

for.cond.i190:                                    ; preds = %for.body.i195, %if.end.i
  %i.0.i191 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i200, %for.body.i195 ], !dbg !1334
  %out.addr.1.i = phi ptr [ %out.addr.0.i186, %if.end.i ], [ %incdec.ptr.i, %for.body.i195 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !1327)
    #dbg_value(i32 %i.0.i191, !664, !DIExpression(), !1327)
  %cmp1.i = icmp ult i32 %i.0.i191, 136, !dbg !1335
  %add.i192 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1336
  %cmp2.i193 = icmp ult i32 %i.0.i191, %add.i192, !dbg !1336
  %10 = select i1 %cmp1.i, i1 %cmp2.i193, i1 false, !dbg !1336
  br i1 %10, label %for.body.i195, label %for.end.i194, !dbg !1337

for.body.i195:                                    ; preds = %for.cond.i190
  %div1.i = lshr i32 %i.0.i191, 3, !dbg !1338
  %arrayidx.i196 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !1339
  %11 = load i64, ptr %arrayidx.i196, align 8, !dbg !1339
  %rem.i = shl nuw nsw i32 %i.0.i191, 3, !dbg !1340
  %mul.i197 = and i32 %rem.i, 56, !dbg !1340
  %sh_prom.i = zext nneg i32 %mul.i197 to i64, !dbg !1341
  %shr.i198 = lshr i64 %11, %sh_prom.i, !dbg !1341
  %conv.i199 = trunc i64 %shr.i198 to i8, !dbg !1339
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1327)
  store i8 %conv.i199, ptr %out.addr.1.i, align 1, !dbg !1342
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1343
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !1327)
  %inc.i200 = add nuw nsw i32 %i.0.i191, 1, !dbg !1344
    #dbg_value(i32 %inc.i200, !664, !DIExpression(), !1327)
  br label %for.cond.i190, !dbg !1345, !llvm.loop !1346

for.end.i194:                                     ; preds = %for.cond.i190
  %i.0.i191.lcssa = phi i32 [ %i.0.i191, %for.cond.i190 ], !dbg !1334
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i190 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i191.lcssa, !dbg !1348
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1349
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !1327)
    #dbg_value(i32 %i.0.i191.lcssa, !655, !DIExpression(), !1327)
  br label %while.cond.i185, !dbg !1329, !llvm.loop !1350

keccak_squeeze.exit:                              ; preds = %while.cond.i185
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i185 ]
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !1352
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1353
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !1354
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1355
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1356
    #dbg_value(ptr %add.ptr10, !1357, !DIExpression(), !1359)
    #dbg_value(ptr %buf.i, !1361, !DIExpression(), !1359)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr10, ptr noundef nonnull %buf.i) #4, !dbg !1362
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !1363
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !1364
    #dbg_value(i8 %inc11, !1089, !DIExpression(), !1083)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !1365
    #dbg_value(i32 %inc13, !1187, !DIExpression(), !1083)
  br label %for.cond5, !dbg !1366, !llvm.loop !1367

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !1089, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1083)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i2), !dbg !1369
    #dbg_value(ptr %epp, !1299, !DIExpression(), !1371)
    #dbg_value(ptr %coins, !1301, !DIExpression(), !1371)
    #dbg_value(i8 4, !1302, !DIExpression(), !1371)
    #dbg_declare(ptr %buf.i2, !1303, !DIExpression(), !1372)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1373
    #dbg_value(ptr %buf.i2, !566, !DIExpression(), !1375)
    #dbg_value(i32 128, !568, !DIExpression(), !1375)
    #dbg_value(ptr %coins, !569, !DIExpression(), !1375)
    #dbg_value(i8 4, !570, !DIExpression(), !1375)
    #dbg_declare(ptr %extkey.i5, !571, !DIExpression(), !1376)
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %extkey.i5, ptr noundef %coins, i32 noundef 32) #5, !dbg !1373
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %extkey.i5, i32 32, !dbg !1377
  store i8 4, ptr %arrayidx.i7, align 1, !dbg !1378
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i71), !dbg !1379
    #dbg_value(ptr %buf.i2, !585, !DIExpression(), !1382)
    #dbg_value(i32 128, !587, !DIExpression(), !1382)
    #dbg_value(ptr %extkey.i5, !588, !DIExpression(), !1382)
    #dbg_value(i32 33, !589, !DIExpression(), !1382)
    #dbg_declare(ptr %state.i71, !590, !DIExpression(), !1383)
    #dbg_value(ptr %state.i71, !592, !DIExpression(), !1384)
    #dbg_value(ptr %extkey.i5, !594, !DIExpression(), !1384)
    #dbg_value(i32 33, !595, !DIExpression(), !1384)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i71, i32 noundef 136, ptr noundef nonnull %extkey.i5, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1379
  %pos.i.i72 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1385
  store i32 136, ptr %pos.i.i72, align 8, !dbg !1386
    #dbg_value(i32 0, !598, !DIExpression(), !1382)
    #dbg_value(ptr %buf.i2, !599, !DIExpression(), !1387)
    #dbg_value(i32 0, !603, !DIExpression(), !1387)
    #dbg_value(ptr %state.i71, !604, !DIExpression(), !1387)
    #dbg_value(ptr %buf.i2, !348, !DIExpression(), !1389)
    #dbg_value(i32 0, !355, !DIExpression(), !1389)
    #dbg_value(ptr %state.i71, !356, !DIExpression(), !1389)
    #dbg_value(i32 136, !357, !DIExpression(), !1389)
    #dbg_value(ptr %buf.i2, !348, !DIExpression(), !1389)
    #dbg_value(i32 0, !355, !DIExpression(), !1389)
    #dbg_value(i32 128, !587, !DIExpression(), !1382)
    #dbg_value(ptr %buf.i2, !585, !DIExpression(), !1382)
    #dbg_value(ptr %buf.i2, !640, !DIExpression(), !1391)
    #dbg_value(i32 128, !644, !DIExpression(), !1391)
    #dbg_value(ptr %state.i71, !645, !DIExpression(), !1391)
  %pos.i1.i74 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1393
  %12 = load i32, ptr %pos.i1.i74, align 8, !dbg !1393
    #dbg_value(ptr %buf.i2, !647, !DIExpression(), !1394)
    #dbg_value(i32 128, !653, !DIExpression(), !1394)
    #dbg_value(ptr %state.i71, !654, !DIExpression(), !1394)
    #dbg_value(i32 %12, !655, !DIExpression(), !1394)
    #dbg_value(i32 136, !656, !DIExpression(), !1394)
  br label %while.cond.i201, !dbg !1396

while.cond.i201:                                  ; preds = %for.end.i216, %for.end14
  %pos.addr.0.i202 = phi i32 [ %12, %for.end14 ], [ %i.0.i211.lcssa, %for.end.i216 ]
  %outlen.addr.0.i203 = phi i32 [ 128, %for.end14 ], [ %sub3.i218, %for.end.i216 ]
  %out.addr.0.i204 = phi ptr [ %buf.i2, %for.end14 ], [ %out.addr.1.i212.lcssa, %for.end.i216 ]
    #dbg_value(ptr %out.addr.0.i204, !647, !DIExpression(), !1394)
    #dbg_value(i32 %outlen.addr.0.i203, !653, !DIExpression(), !1394)
    #dbg_value(i32 %pos.addr.0.i202, !655, !DIExpression(), !1394)
  %tobool.not.i205 = icmp eq i32 %outlen.addr.0.i203, 0, !dbg !1396
  br i1 %tobool.not.i205, label %keccak_squeeze.exit230, label %while.body.i206, !dbg !1396

while.body.i206:                                  ; preds = %while.cond.i201
  %cmp.i207 = icmp eq i32 %pos.addr.0.i202, 136, !dbg !1397
  br i1 %cmp.i207, label %if.then.i229, label %if.end.i208, !dbg !1397

if.then.i229:                                     ; preds = %while.body.i206
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i71) #4, !dbg !1398
    #dbg_value(i32 0, !655, !DIExpression(), !1394)
  br label %if.end.i208, !dbg !1399

if.end.i208:                                      ; preds = %if.then.i229, %while.body.i206
  %pos.addr.1.i209 = phi i32 [ 0, %if.then.i229 ], [ %pos.addr.0.i202, %while.body.i206 ]
    #dbg_value(i32 %pos.addr.1.i209, !655, !DIExpression(), !1394)
    #dbg_value(i32 %pos.addr.1.i209, !664, !DIExpression(), !1394)
  br label %for.cond.i210, !dbg !1400

for.cond.i210:                                    ; preds = %for.body.i219, %if.end.i208
  %i.0.i211 = phi i32 [ %pos.addr.1.i209, %if.end.i208 ], [ %inc.i228, %for.body.i219 ], !dbg !1401
  %out.addr.1.i212 = phi ptr [ %out.addr.0.i204, %if.end.i208 ], [ %incdec.ptr.i227, %for.body.i219 ]
    #dbg_value(ptr %out.addr.1.i212, !647, !DIExpression(), !1394)
    #dbg_value(i32 %i.0.i211, !664, !DIExpression(), !1394)
  %cmp1.i213 = icmp ult i32 %i.0.i211, 136, !dbg !1402
  %add.i214 = add i32 %pos.addr.1.i209, %outlen.addr.0.i203, !dbg !1403
  %cmp2.i215 = icmp ult i32 %i.0.i211, %add.i214, !dbg !1403
  %13 = select i1 %cmp1.i213, i1 %cmp2.i215, i1 false, !dbg !1403
  br i1 %13, label %for.body.i219, label %for.end.i216, !dbg !1404

for.body.i219:                                    ; preds = %for.cond.i210
  %div1.i220 = lshr i32 %i.0.i211, 3, !dbg !1405
  %arrayidx.i221 = getelementptr inbounds nuw i64, ptr %state.i71, i32 %div1.i220, !dbg !1406
  %14 = load i64, ptr %arrayidx.i221, align 8, !dbg !1406
  %rem.i222 = shl nuw nsw i32 %i.0.i211, 3, !dbg !1407
  %mul.i223 = and i32 %rem.i222, 56, !dbg !1407
  %sh_prom.i224 = zext nneg i32 %mul.i223 to i64, !dbg !1408
  %shr.i225 = lshr i64 %14, %sh_prom.i224, !dbg !1408
  %conv.i226 = trunc i64 %shr.i225 to i8, !dbg !1406
    #dbg_value(ptr %out.addr.1.i212, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1394)
  store i8 %conv.i226, ptr %out.addr.1.i212, align 1, !dbg !1409
  %incdec.ptr.i227 = getelementptr inbounds nuw i8, ptr %out.addr.1.i212, i32 1, !dbg !1410
    #dbg_value(ptr %incdec.ptr.i227, !647, !DIExpression(), !1394)
  %inc.i228 = add nuw nsw i32 %i.0.i211, 1, !dbg !1411
    #dbg_value(i32 %inc.i228, !664, !DIExpression(), !1394)
  br label %for.cond.i210, !dbg !1412, !llvm.loop !1413

for.end.i216:                                     ; preds = %for.cond.i210
  %i.0.i211.lcssa = phi i32 [ %i.0.i211, %for.cond.i210 ], !dbg !1401
  %out.addr.1.i212.lcssa = phi ptr [ %out.addr.1.i212, %for.cond.i210 ]
  %sub.neg.i217 = sub i32 %pos.addr.1.i209, %i.0.i211.lcssa, !dbg !1415
  %sub3.i218 = add i32 %sub.neg.i217, %outlen.addr.0.i203, !dbg !1416
    #dbg_value(i32 %sub3.i218, !653, !DIExpression(), !1394)
    #dbg_value(i32 %i.0.i211.lcssa, !655, !DIExpression(), !1394)
  br label %while.cond.i201, !dbg !1396, !llvm.loop !1417

keccak_squeeze.exit230:                           ; preds = %while.cond.i201
  %pos.addr.0.i202.lcssa = phi i32 [ %pos.addr.0.i202, %while.cond.i201 ]
  %pos1.i.i76 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1419
  store i32 %pos.addr.0.i202.lcssa, ptr %pos1.i.i76, align 8, !dbg !1420
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i71), !dbg !1421
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1422
    #dbg_value(ptr %epp, !1357, !DIExpression(), !1423)
    #dbg_value(ptr %buf.i2, !1361, !DIExpression(), !1423)
  call fastcc void @cbd2(ptr noundef nonnull %epp, ptr noundef nonnull %buf.i2) #4, !dbg !1425
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i2), !dbg !1426
    #dbg_value(ptr %sp, !1427, !DIExpression(), !1428)
    #dbg_value(i32 0, !829, !DIExpression(), !1428)
  br label %for.cond.i18, !dbg !1430

for.cond.i18:                                     ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit109, %keccak_squeeze.exit230
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit230 ], [ %inc.i23, %pqcrystals_kyber512_ref_poly_reduce.exit109 ], !dbg !1431
    #dbg_value(i32 %i.0.i19, !829, !DIExpression(), !1428)
  %exitcond269 = icmp ne i32 %i.0.i19, 2, !dbg !1432
  br i1 %exitcond269, label %for.body.i21, label %for.cond16.preheader, !dbg !1433

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1434

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [2 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1436
    #dbg_value(ptr %arrayidx.i22, !836, !DIExpression(), !1437)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1439
    #dbg_value(ptr %arrayidx.i22, !843, !DIExpression(), !1440)
    #dbg_value(i32 0, !847, !DIExpression(), !1440)
  br label %for.cond.i97, !dbg !1442

for.cond.i97:                                     ; preds = %for.body.i100, %for.body.i21
  %i.0.i98 = phi i32 [ 0, %for.body.i21 ], [ %inc.i108, %for.body.i100 ], !dbg !1443
    #dbg_value(i32 %i.0.i98, !847, !DIExpression(), !1440)
  %exitcond268 = icmp ne i32 %i.0.i98, 256, !dbg !1444
  br i1 %exitcond268, label %for.body.i100, label %pqcrystals_kyber512_ref_poly_reduce.exit109, !dbg !1445

for.body.i100:                                    ; preds = %for.cond.i97
  %arrayidx.i101 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1446
  %15 = load i16, ptr %arrayidx.i101, align 2, !dbg !1446
    #dbg_value(i16 %15, !855, !DIExpression(), !1447)
    #dbg_value(i16 20159, !862, !DIExpression(), !1447)
  %conv.i.i102 = sext i16 %15 to i32, !dbg !1449
  %mul.i.i103 = mul nsw i32 %conv.i.i102, 20159, !dbg !1450
  %add.i.i104 = add nsw i32 %mul.i.i103, 33554432, !dbg !1451
  %shr.i.i105 = ashr i32 %add.i.i104, 26, !dbg !1452
    #dbg_value(i32 %shr.i.i105, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1447)
    #dbg_value(i32 %shr.i.i105, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1447)
  %16 = trunc nsw i32 %shr.i.i105 to i16, !dbg !1453
  %17 = mul i16 %16, -3329, !dbg !1453
  %conv7.i.i106 = add i16 %17, %15, !dbg !1453
  %arrayidx2.i107 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1454
  store i16 %conv7.i.i106, ptr %arrayidx2.i107, align 2, !dbg !1455
  %inc.i108 = add nuw nsw i32 %i.0.i98, 1, !dbg !1456
    #dbg_value(i32 %inc.i108, !847, !DIExpression(), !1440)
  br label %for.cond.i97, !dbg !1457, !llvm.loop !1458

pqcrystals_kyber512_ref_poly_reduce.exit109:      ; preds = %for.cond.i97
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1460
    #dbg_value(i32 %inc.i23, !829, !DIExpression(), !1428)
  br label %for.cond.i18, !dbg !1461, !llvm.loop !1462

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1464
    #dbg_value(i32 %i.2, !1187, !DIExpression(), !1083)
  %exitcond270 = icmp ne i32 %i.2, 2, !dbg !1465
  br i1 %exitcond270, label %for.body18, label %for.end23, !dbg !1434

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1467
  %arrayidx20 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1468
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1469
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1470
    #dbg_value(i32 %inc22, !1187, !DIExpression(), !1083)
  br label %for.cond16, !dbg !1471, !llvm.loop !1472

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1474
    #dbg_value(ptr %b, !1475, !DIExpression(), !1477)
    #dbg_value(i32 0, !1479, !DIExpression(), !1477)
  br label %for.cond.i12, !dbg !1480

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1482
    #dbg_value(i32 %i.0.i13, !1479, !DIExpression(), !1477)
  %exitcond271 = icmp ne i32 %i.0.i13, 2, !dbg !1483
  br i1 %exitcond271, label %for.body.i15, label %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit, !dbg !1485

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1486
    #dbg_value(ptr %arrayidx.i16, !1487, !DIExpression(), !1489)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1491
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1492
    #dbg_value(i32 %inc.i17, !1479, !DIExpression(), !1477)
  br label %for.cond.i12, !dbg !1493, !llvm.loop !1494

pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1487, !DIExpression(), !1496)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1498
    #dbg_value(ptr %b, !1499, !DIExpression(), !1500)
    #dbg_value(ptr %b, !1502, !DIExpression(), !1500)
    #dbg_value(ptr %ep, !1503, !DIExpression(), !1500)
    #dbg_value(i32 0, !965, !DIExpression(), !1500)
  br label %for.cond.i24, !dbg !1504

for.cond.i24:                                     ; preds = %pqcrystals_kyber512_ref_poly_add.exit, %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit
  %i.0.i25 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit ], [ %inc.i29, %pqcrystals_kyber512_ref_poly_add.exit ], !dbg !1505
    #dbg_value(i32 %i.0.i25, !965, !DIExpression(), !1500)
  %exitcond273 = icmp ne i32 %i.0.i25, 2, !dbg !1506
  br i1 %exitcond273, label %for.body.i27, label %for.cond.i54.preheader, !dbg !1507

for.cond.i54.preheader:                           ; preds = %for.cond.i24
  br label %for.cond.i54, !dbg !1508

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1510
  %arrayidx2.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1511
  %arrayidx4.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i25, !dbg !1512
    #dbg_value(ptr %arrayidx.i28, !976, !DIExpression(), !1513)
    #dbg_value(ptr %arrayidx2.i, !984, !DIExpression(), !1513)
    #dbg_value(ptr %arrayidx4.i, !985, !DIExpression(), !1513)
    #dbg_value(i32 0, !986, !DIExpression(), !1513)
  br label %for.cond.i37, !dbg !1515

for.cond.i37:                                     ; preds = %for.body.i40, %for.body.i27
  %i.0.i38 = phi i32 [ 0, %for.body.i27 ], [ %inc.i43, %for.body.i40 ], !dbg !1516
    #dbg_value(i32 %i.0.i38, !986, !DIExpression(), !1513)
  %exitcond272 = icmp ne i32 %i.0.i38, 256, !dbg !1517
  br i1 %exitcond272, label %for.body.i40, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !1518

for.body.i40:                                     ; preds = %for.cond.i37
  %arrayidx.i41 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i38, !dbg !1519
  %18 = load i16, ptr %arrayidx.i41, align 2, !dbg !1519
  %arrayidx2.i42 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i38, !dbg !1520
  %19 = load i16, ptr %arrayidx2.i42, align 2, !dbg !1520
  %add.i = add i16 %18, %19, !dbg !1521
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i28, i32 0, i32 %i.0.i38, !dbg !1522
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1523
  %inc.i43 = add nuw nsw i32 %i.0.i38, 1, !dbg !1524
    #dbg_value(i32 %inc.i43, !986, !DIExpression(), !1513)
  br label %for.cond.i37, !dbg !1525, !llvm.loop !1526

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i37
  %inc.i29 = add nuw nsw i32 %i.0.i25, 1, !dbg !1528
    #dbg_value(i32 %inc.i29, !965, !DIExpression(), !1500)
  br label %for.cond.i24, !dbg !1529, !llvm.loop !1530

for.cond.i54:                                     ; preds = %for.cond.i54.preheader, %for.body.i57
  %i.0.i55 = phi i32 [ %inc.i62, %for.body.i57 ], [ 0, %for.cond.i54.preheader ], !dbg !1532
    #dbg_value(i32 %i.0.i55, !986, !DIExpression(), !1533)
  %exitcond274 = icmp ne i32 %i.0.i55, 256, !dbg !1534
  br i1 %exitcond274, label %for.body.i57, label %for.cond.i44.preheader, !dbg !1508

for.cond.i44.preheader:                           ; preds = %for.cond.i54
  br label %for.cond.i44, !dbg !1535

for.body.i57:                                     ; preds = %for.cond.i54
  %arrayidx.i58 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i55, !dbg !1537
  %20 = load i16, ptr %arrayidx.i58, align 2, !dbg !1537
  %arrayidx2.i59 = getelementptr inbounds nuw [256 x i16], ptr %epp, i32 0, i32 %i.0.i55, !dbg !1538
  %21 = load i16, ptr %arrayidx2.i59, align 2, !dbg !1538
  %add.i60 = add i16 %20, %21, !dbg !1539
  %arrayidx6.i61 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i55, !dbg !1540
  store i16 %add.i60, ptr %arrayidx6.i61, align 2, !dbg !1541
  %inc.i62 = add nuw nsw i32 %i.0.i55, 1, !dbg !1542
    #dbg_value(i32 %inc.i62, !986, !DIExpression(), !1533)
  br label %for.cond.i54, !dbg !1543, !llvm.loop !1544

for.cond.i44:                                     ; preds = %for.cond.i44.preheader, %for.body.i47
  %i.0.i45 = phi i32 [ %inc.i52, %for.body.i47 ], [ 0, %for.cond.i44.preheader ], !dbg !1546
    #dbg_value(i32 %i.0.i45, !986, !DIExpression(), !1547)
  %exitcond275 = icmp ne i32 %i.0.i45, 256, !dbg !1548
  br i1 %exitcond275, label %for.body.i47, label %for.cond.i.preheader, !dbg !1535

for.cond.i.preheader:                             ; preds = %for.cond.i44
  br label %for.cond.i, !dbg !1549

for.body.i47:                                     ; preds = %for.cond.i44
  %arrayidx.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1551
  %22 = load i16, ptr %arrayidx.i48, align 2, !dbg !1551
  %arrayidx2.i49 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %i.0.i45, !dbg !1552
  %23 = load i16, ptr %arrayidx2.i49, align 2, !dbg !1552
  %add.i50 = add i16 %22, %23, !dbg !1553
  %arrayidx6.i51 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1554
  store i16 %add.i50, ptr %arrayidx6.i51, align 2, !dbg !1555
  %inc.i52 = add nuw nsw i32 %i.0.i45, 1, !dbg !1556
    #dbg_value(i32 %inc.i52, !986, !DIExpression(), !1547)
  br label %for.cond.i44, !dbg !1557, !llvm.loop !1558

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1560
    #dbg_value(i32 %i.0.i, !1007, !DIExpression(), !1561)
  %exitcond277 = icmp ne i32 %i.0.i, 2, !dbg !1562
  br i1 %exitcond277, label %for.body.i, label %for.cond.i84.preheader, !dbg !1549

for.cond.i84.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i84, !dbg !1563

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1565
    #dbg_value(ptr %arrayidx.i11, !843, !DIExpression(), !1566)
    #dbg_value(i32 0, !847, !DIExpression(), !1566)
  br label %for.cond.i77, !dbg !1568

for.cond.i77:                                     ; preds = %for.body.i80, %for.body.i
  %i.0.i78 = phi i32 [ 0, %for.body.i ], [ %inc.i83, %for.body.i80 ], !dbg !1569
    #dbg_value(i32 %i.0.i78, !847, !DIExpression(), !1566)
  %exitcond276 = icmp ne i32 %i.0.i78, 256, !dbg !1570
  br i1 %exitcond276, label %for.body.i80, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !1571

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i78, !dbg !1572
  %24 = load i16, ptr %arrayidx.i81, align 2, !dbg !1572
    #dbg_value(i16 %24, !855, !DIExpression(), !1573)
    #dbg_value(i16 20159, !862, !DIExpression(), !1573)
  %conv.i.i = sext i16 %24 to i32, !dbg !1575
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1576
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1577
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1578
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1573)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1573)
  %25 = trunc nsw i32 %shr.i.i to i16, !dbg !1579
  %26 = mul i16 %25, -3329, !dbg !1579
  %conv7.i.i = add i16 %26, %24, !dbg !1579
  %arrayidx2.i82 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i78, !dbg !1580
  store i16 %conv7.i.i, ptr %arrayidx2.i82, align 2, !dbg !1581
  %inc.i83 = add nuw nsw i32 %i.0.i78, 1, !dbg !1582
    #dbg_value(i32 %inc.i83, !847, !DIExpression(), !1566)
  br label %for.cond.i77, !dbg !1583, !llvm.loop !1584

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i77
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1586
    #dbg_value(i32 %inc.i, !1007, !DIExpression(), !1561)
  br label %for.cond.i, !dbg !1587, !llvm.loop !1588

for.cond.i84:                                     ; preds = %for.cond.i84.preheader, %for.body.i87
  %i.0.i85 = phi i32 [ %inc.i95, %for.body.i87 ], [ 0, %for.cond.i84.preheader ], !dbg !1590
    #dbg_value(i32 %i.0.i85, !847, !DIExpression(), !1591)
  %exitcond278 = icmp ne i32 %i.0.i85, 256, !dbg !1592
  br i1 %exitcond278, label %for.body.i87, label %pqcrystals_kyber512_ref_poly_reduce.exit96, !dbg !1563

for.body.i87:                                     ; preds = %for.cond.i84
  %arrayidx.i88 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i85, !dbg !1593
  %27 = load i16, ptr %arrayidx.i88, align 2, !dbg !1593
    #dbg_value(i16 %27, !855, !DIExpression(), !1594)
    #dbg_value(i16 20159, !862, !DIExpression(), !1594)
  %conv.i.i89 = sext i16 %27 to i32, !dbg !1596
  %mul.i.i90 = mul nsw i32 %conv.i.i89, 20159, !dbg !1597
  %add.i.i91 = add nsw i32 %mul.i.i90, 33554432, !dbg !1598
  %shr.i.i92 = ashr i32 %add.i.i91, 26, !dbg !1599
    #dbg_value(i32 %shr.i.i92, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1594)
    #dbg_value(i32 %shr.i.i92, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1594)
  %28 = trunc nsw i32 %shr.i.i92 to i16, !dbg !1600
  %29 = mul i16 %28, -3329, !dbg !1600
  %conv7.i.i93 = add i16 %29, %27, !dbg !1600
  %arrayidx2.i94 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i85, !dbg !1601
  store i16 %conv7.i.i93, ptr %arrayidx2.i94, align 2, !dbg !1602
  %inc.i95 = add nuw nsw i32 %i.0.i85, 1, !dbg !1603
    #dbg_value(i32 %inc.i95, !847, !DIExpression(), !1591)
  br label %for.cond.i84, !dbg !1604, !llvm.loop !1605

pqcrystals_kyber512_ref_poly_reduce.exit96:       ; preds = %for.cond.i84
    #dbg_value(ptr %c, !1607, !DIExpression(), !1612)
    #dbg_value(ptr %b, !1614, !DIExpression(), !1612)
    #dbg_value(ptr %v, !1615, !DIExpression(), !1612)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1616
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !1617
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %v) #4, !dbg !1618
  ret void, !dbg !1619
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1620 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !1623, !DIExpression(), !1624)
    #dbg_value(ptr %c, !1625, !DIExpression(), !1624)
    #dbg_value(ptr %sk, !1626, !DIExpression(), !1624)
    #dbg_declare(ptr %b, !1627, !DIExpression(), !1628)
    #dbg_declare(ptr %skpv, !1629, !DIExpression(), !1630)
    #dbg_declare(ptr %v, !1631, !DIExpression(), !1632)
    #dbg_declare(ptr %mp, !1633, !DIExpression(), !1634)
    #dbg_value(ptr %b, !1635, !DIExpression(), !1639)
    #dbg_value(ptr %v, !1641, !DIExpression(), !1639)
    #dbg_value(ptr %c, !1642, !DIExpression(), !1639)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1643
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !1644
    #dbg_value(ptr %v, !1645, !DIExpression(), !1647)
    #dbg_value(ptr %add.ptr.i, !1649, !DIExpression(), !1647)
    #dbg_value(i32 0, !1650, !DIExpression(), !1647)
  br label %for.cond.i41, !dbg !1651

for.cond.i41:                                     ; preds = %for.body.i44, %entry
  %a.addr.0.i = phi ptr [ %add.ptr.i, %entry ], [ %add.ptr.i49, %for.body.i44 ]
  %i.0.i42 = phi i32 [ 0, %entry ], [ %inc.i50, %for.body.i44 ], !dbg !1653
    #dbg_value(i32 %i.0.i42, !1650, !DIExpression(), !1647)
    #dbg_value(ptr %a.addr.0.i, !1649, !DIExpression(), !1647)
  %exitcond = icmp ne i32 %i.0.i42, 128, !dbg !1654
  br i1 %exitcond, label %for.body.i44, label %for.cond.i1.preheader, !dbg !1656

for.cond.i1.preheader:                            ; preds = %for.cond.i41
  br label %for.cond.i1, !dbg !1657

for.body.i44:                                     ; preds = %for.cond.i41
  %0 = load i8, ptr %a.addr.0.i, align 1, !dbg !1663
  %1 = and i8 %0, 15, !dbg !1665
  %conv2.i = zext nneg i8 %1 to i32, !dbg !1666
  %mul.i45 = mul nuw nsw i32 %conv2.i, 3329, !dbg !1667
  %add.i46 = add nuw nsw i32 %mul.i45, 8, !dbg !1668
  %shr.i47 = lshr i32 %add.i46, 4, !dbg !1669
  %conv3.i = trunc nuw nsw i32 %shr.i47 to i16, !dbg !1670
  %mul4.i = shl nuw nsw i32 %i.0.i42, 1, !dbg !1671
  %arrayidx6.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %mul4.i, !dbg !1672
  store i16 %conv3.i, ptr %arrayidx6.i48, align 2, !dbg !1673
  %2 = load i8, ptr %a.addr.0.i, align 1, !dbg !1674
  %3 = lshr i8 %2, 4, !dbg !1675
  %conv11.i = zext nneg i8 %3 to i32, !dbg !1676
  %mul12.i = mul nuw nsw i32 %conv11.i, 3329, !dbg !1677
  %add13.i = add nuw nsw i32 %mul12.i, 8, !dbg !1678
  %shr14.i = lshr i32 %add13.i, 4, !dbg !1679
  %conv15.i = trunc nuw nsw i32 %shr14.i to i16, !dbg !1680
  %mul17.i = shl nuw nsw i32 %i.0.i42, 1, !dbg !1681
  %add18.i = or disjoint i32 %mul17.i, 1, !dbg !1682
  %arrayidx19.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %add18.i, !dbg !1683
  store i16 %conv15.i, ptr %arrayidx19.i, align 2, !dbg !1684
    #dbg_value(ptr %a.addr.0.i, !1649, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1647)
  %add.ptr.i49 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 1, !dbg !1685
    #dbg_value(ptr %add.ptr.i49, !1649, !DIExpression(), !1647)
  %inc.i50 = add nuw nsw i32 %i.0.i42, 1, !dbg !1686
    #dbg_value(i32 %inc.i50, !1650, !DIExpression(), !1647)
  br label %for.cond.i41, !dbg !1687, !llvm.loop !1688

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !1690
    #dbg_value(i32 %i.0.i2, !1121, !DIExpression(), !1691)
  %exitcond51 = icmp ne i32 %i.0.i2, 2, !dbg !1692
  br i1 %exitcond51, label %for.body.i4, label %for.cond.i.preheader, !dbg !1657

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1693

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1695
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1696
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1697
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1698
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1699
    #dbg_value(i32 %inc.i7, !1121, !DIExpression(), !1691)
  br label %for.cond.i1, !dbg !1700, !llvm.loop !1701

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1703
    #dbg_value(i32 %i.0.i, !829, !DIExpression(), !1704)
  %exitcond53 = icmp ne i32 %i.0.i, 2, !dbg !1705
  br i1 %exitcond53, label %for.body.i, label %pqcrystals_kyber512_ref_polyvec_ntt.exit, !dbg !1693

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1706
    #dbg_value(ptr %arrayidx.i, !836, !DIExpression(), !1707)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1709
    #dbg_value(ptr %arrayidx.i, !843, !DIExpression(), !1710)
    #dbg_value(i32 0, !847, !DIExpression(), !1710)
  br label %for.cond.i14, !dbg !1712

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1713
    #dbg_value(i32 %i.0.i15, !847, !DIExpression(), !1710)
  %exitcond52 = icmp ne i32 %i.0.i15, 256, !dbg !1714
  br i1 %exitcond52, label %for.body.i17, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !1715

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1716
  %4 = load i16, ptr %arrayidx.i18, align 2, !dbg !1716
    #dbg_value(i16 %4, !855, !DIExpression(), !1717)
    #dbg_value(i16 20159, !862, !DIExpression(), !1717)
  %conv.i.i = sext i16 %4 to i32, !dbg !1719
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1720
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1721
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1722
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1717)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1717)
  %5 = trunc nsw i32 %shr.i.i to i16, !dbg !1723
  %6 = mul i16 %5, -3329, !dbg !1723
  %conv7.i.i = add i16 %6, %4, !dbg !1723
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1724
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1725
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1726
    #dbg_value(i32 %inc.i20, !847, !DIExpression(), !1710)
  br label %for.cond.i14, !dbg !1727, !llvm.loop !1728

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1730
    #dbg_value(i32 %inc.i, !829, !DIExpression(), !1704)
  br label %for.cond.i, !dbg !1731, !llvm.loop !1732

pqcrystals_kyber512_ref_polyvec_ntt.exit:         ; preds = %for.cond.i
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1734
    #dbg_value(ptr %mp, !1487, !DIExpression(), !1735)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1737
    #dbg_value(ptr %mp, !1738, !DIExpression(), !1740)
    #dbg_value(ptr %v, !1742, !DIExpression(), !1740)
    #dbg_value(ptr %mp, !1743, !DIExpression(), !1740)
    #dbg_value(i32 0, !1744, !DIExpression(), !1740)
  br label %for.cond.i8, !dbg !1745

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber512_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !1747
    #dbg_value(i32 %i.0.i9, !1744, !DIExpression(), !1740)
  %exitcond54 = icmp ne i32 %i.0.i9, 256, !dbg !1748
  br i1 %exitcond54, label %for.body.i11, label %for.cond.i21.preheader, !dbg !1750

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !1751

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !1753
  %7 = load i16, ptr %arrayidx.i12, align 2, !dbg !1753
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1754
  %8 = load i16, ptr %arrayidx2.i, align 2, !dbg !1754
  %sub.i = sub i16 %7, %8, !dbg !1755
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1756
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !1757
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !1758
    #dbg_value(i32 %inc.i13, !1744, !DIExpression(), !1740)
  br label %for.cond.i8, !dbg !1759, !llvm.loop !1760

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !1762
    #dbg_value(i32 %i.0.i22, !847, !DIExpression(), !1763)
  %exitcond55 = icmp ne i32 %i.0.i22, 256, !dbg !1764
  br i1 %exitcond55, label %for.body.i24, label %for.cond.i34.preheader, !dbg !1751

for.cond.i34.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i34, !dbg !1765

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1771
  %9 = load i16, ptr %arrayidx.i25, align 2, !dbg !1771
    #dbg_value(i16 %9, !855, !DIExpression(), !1772)
    #dbg_value(i16 20159, !862, !DIExpression(), !1772)
  %conv.i.i26 = sext i16 %9 to i32, !dbg !1774
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !1775
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !1776
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !1777
    #dbg_value(i32 %shr.i.i29, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1772)
    #dbg_value(i32 %shr.i.i29, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1772)
  %10 = trunc nsw i32 %shr.i.i29 to i16, !dbg !1778
  %11 = mul i16 %10, -3329, !dbg !1778
  %conv7.i.i30 = add i16 %11, %9, !dbg !1778
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1779
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !1780
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !1781
    #dbg_value(i32 %inc.i32, !847, !DIExpression(), !1763)
  br label %for.cond.i21, !dbg !1782, !llvm.loop !1783

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc11.i
  %i.0.i35 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i34.preheader ], !dbg !1785
    #dbg_value(i32 %i.0.i35, !1786, !DIExpression(), !1787)
  %exitcond57 = icmp ne i32 %i.0.i35, 32, !dbg !1788
  br i1 %exitcond57, label %for.body.i37, label %pqcrystals_kyber512_ref_poly_tomsg.exit, !dbg !1765

for.body.i37:                                     ; preds = %for.cond.i34
  %arrayidx.i38 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1790
  store i8 0, ptr %arrayidx.i38, align 1, !dbg !1792
    #dbg_value(i32 0, !1793, !DIExpression(), !1787)
  br label %for.cond1.i, !dbg !1794

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i37
  %j.0.i = phi i32 [ 0, %for.body.i37 ], [ %inc.i40, %for.body3.i ], !dbg !1796
    #dbg_value(i32 %j.0.i, !1793, !DIExpression(), !1787)
  %exitcond56 = icmp ne i32 %j.0.i, 8, !dbg !1797
  br i1 %exitcond56, label %for.body3.i, label %for.inc11.i, !dbg !1799

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i39 = shl nuw nsw i32 %i.0.i35, 3, !dbg !1800
  %add.i = or disjoint i32 %mul.i39, %j.0.i, !dbg !1802
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i, !dbg !1803
  %12 = load i16, ptr %arrayidx4.i, align 2, !dbg !1803
  %conv.i = sext i16 %12 to i32, !dbg !1803
    #dbg_value(i32 %conv.i, !1804, !DIExpression(), !1787)
    #dbg_value(i32 %conv.i, !1804, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1787)
    #dbg_value(i32 %conv.i, !1804, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1787)
  %13 = mul i32 %conv.i, 161270, !dbg !1805
  %mul6.i = add i32 %13, 134257275, !dbg !1805
    #dbg_value(i32 %mul6.i, !1804, !DIExpression(), !1787)
  %shr.i = lshr i32 %mul6.i, 28, !dbg !1806
    #dbg_value(i32 %shr.i, !1804, !DIExpression(), !1787)
  %and.i = and i32 %shr.i, 1, !dbg !1807
    #dbg_value(i32 %and.i, !1804, !DIExpression(), !1787)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !1808
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1809
  %14 = load i8, ptr %arrayidx8.i, align 1, !dbg !1810
  %15 = trunc nuw i32 %shl7.i to i8, !dbg !1810
  %conv10.i = or i8 %14, %15, !dbg !1810
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !1810
  %inc.i40 = add nuw nsw i32 %j.0.i, 1, !dbg !1811
    #dbg_value(i32 %inc.i40, !1793, !DIExpression(), !1787)
  br label %for.cond1.i, !dbg !1812, !llvm.loop !1813

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i35, 1, !dbg !1815
    #dbg_value(i32 %inc12.i, !1786, !DIExpression(), !1787)
  br label %for.cond.i34, !dbg !1816, !llvm.loop !1817

pqcrystals_kyber512_ref_poly_tomsg.exit:          ; preds = %for.cond.i34
  ret void, !dbg !1819
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1820 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !1821, !DIExpression(), !1822)
    #dbg_value(ptr %a, !1823, !DIExpression(), !1822)
    #dbg_declare(ptr %t, !1824, !DIExpression(), !1828)
    #dbg_value(i32 0, !1829, !DIExpression(), !1822)
  br label %for.cond, !dbg !1830

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !1832
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !1821, !DIExpression(), !1822)
    #dbg_value(i32 %i.0, !1829, !DIExpression(), !1822)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !1833
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !1835

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1836

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !1839
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !1821, !DIExpression(), !1822)
    #dbg_value(i32 %j.0, !1840, !DIExpression(), !1822)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !1841
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !1836

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1843

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1846
    #dbg_value(i32 %k.0, !1847, !DIExpression(), !1822)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !1848
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !1843

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1850
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !1852
  %add = or disjoint i32 %mul, %k.0, !dbg !1853
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !1850
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1850
  %isneg = icmp slt i16 %0, 0, !dbg !1854
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1854
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1855
  %add12 = add i16 %and, %0, !dbg !1856
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !1856
  %conv15 = zext i16 %add12 to i64, !dbg !1857
    #dbg_value(i64 %conv15, !1858, !DIExpression(), !1822)
    #dbg_value(i64 %conv15, !1858, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !1822)
    #dbg_value(i64 %conv15, !1858, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1822)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !1859
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !1859
    #dbg_value(i64 %mul17, !1858, !DIExpression(), !1822)
  %shr18 = lshr i64 %mul17, 32, !dbg !1860
    #dbg_value(i64 %shr18, !1858, !DIExpression(), !1822)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !1861
  %conv20 = and i16 %2, 1023, !dbg !1861
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1862
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !1863
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1864
    #dbg_value(i32 %inc, !1847, !DIExpression(), !1822)
  br label %for.cond4, !dbg !1865, !llvm.loop !1866

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !1868
  %conv25 = trunc i16 %3 to i8, !dbg !1869
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !1870
  %4 = load i16, ptr %t, align 2, !dbg !1871
  %5 = lshr i16 %4, 8, !dbg !1872
  %shr29 = trunc nuw i16 %5 to i8, !dbg !1872
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1873
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !1873
  %conv31 = trunc i16 %6 to i8, !dbg !1873
  %shl32 = shl i8 %conv31, 2, !dbg !1874
  %or = or i8 %shl32, %shr29, !dbg !1875
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !1876
  store i8 %or, ptr %arrayidx34, align 1, !dbg !1877
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1878
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !1878
  %8 = lshr i16 %7, 6, !dbg !1879
  %shr37 = trunc i16 %8 to i8, !dbg !1879
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1880
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !1880
  %conv39 = trunc i16 %9 to i8, !dbg !1880
  %shl40 = shl i8 %conv39, 4, !dbg !1881
  %or41 = or i8 %shl40, %shr37, !dbg !1882
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !1883
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1884
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1885
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !1885
  %11 = lshr i16 %10, 4, !dbg !1886
  %shr46 = trunc i16 %11 to i8, !dbg !1886
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1887
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !1887
  %conv48 = trunc i16 %12 to i8, !dbg !1887
  %shl49 = shl i8 %conv48, 6, !dbg !1888
  %or50 = or i8 %shl49, %shr46, !dbg !1889
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !1890
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !1891
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1892
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !1892
  %14 = lshr i16 %13, 2, !dbg !1893
  %conv56 = trunc i16 %14 to i8, !dbg !1894
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !1895
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !1896
    #dbg_value(ptr %r.addr.1, !1821, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1822)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !1897
    #dbg_value(ptr %add.ptr, !1821, !DIExpression(), !1822)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !1898
    #dbg_value(i32 %inc59, !1840, !DIExpression(), !1822)
  br label %for.cond1, !dbg !1899, !llvm.loop !1900

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !1902
    #dbg_value(i32 %inc62, !1829, !DIExpression(), !1822)
  br label %for.cond, !dbg !1903, !llvm.loop !1904

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !1906
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1907 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !1908, !DIExpression(), !1909)
    #dbg_value(ptr %a, !1910, !DIExpression(), !1909)
    #dbg_declare(ptr %t, !1911, !DIExpression(), !1912)
    #dbg_value(i32 0, !1913, !DIExpression(), !1909)
  br label %for.cond, !dbg !1914

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !1916
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !1910, !DIExpression(), !1909)
    #dbg_value(i32 %i.0, !1913, !DIExpression(), !1909)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !1917
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !1919

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1920

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !1923
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !1910, !DIExpression(), !1909)
    #dbg_value(i32 %j.0, !1924, !DIExpression(), !1909)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !1925
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !1920

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !1927
  %conv = zext i8 %0 to i16, !dbg !1927
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1929
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !1929
  %conv6 = zext i8 %1 to i16, !dbg !1930
  %shl = shl nuw i16 %conv6, 8, !dbg !1931
  %or = or disjoint i16 %shl, %conv, !dbg !1932
  store i16 %or, ptr %t, align 2, !dbg !1933
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1934
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !1934
  %3 = lshr i8 %2, 2, !dbg !1935
  %shr11 = zext nneg i8 %3 to i16, !dbg !1935
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1936
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !1936
  %conv14 = zext i8 %4 to i16, !dbg !1937
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !1938
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !1939
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1940
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !1941
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1942
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !1942
  %6 = lshr i8 %5, 4, !dbg !1943
  %shr21 = zext nneg i8 %6 to i16, !dbg !1943
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !1944
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !1944
  %conv24 = zext i8 %7 to i16, !dbg !1945
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !1946
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !1947
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1948
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !1949
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !1950
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !1950
  %9 = lshr i8 %8, 6, !dbg !1951
  %shr31 = zext nneg i8 %9 to i16, !dbg !1951
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !1952
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !1952
  %conv34 = zext i8 %10 to i16, !dbg !1953
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !1954
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !1955
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1956
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !1957
    #dbg_value(ptr %add.ptr, !1910, !DIExpression(), !1909)
    #dbg_value(i32 0, !1958, !DIExpression(), !1909)
  br label %for.cond39, !dbg !1959

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !1961
    #dbg_value(i32 %k.0, !1958, !DIExpression(), !1909)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !1962
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !1964

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1965
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !1965
  %12 = and i16 %11, 1023, !dbg !1966
  %and = zext nneg i16 %12 to i32, !dbg !1966
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1967
  %add = add nuw nsw i32 %mul, 512, !dbg !1968
  %shr45 = lshr i32 %add, 10, !dbg !1969
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !1970
  %arrayidx47 = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1971
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !1972
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !1973
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !1971
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !1974
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1975
    #dbg_value(i32 %inc, !1958, !DIExpression(), !1909)
  br label %for.cond39, !dbg !1976, !llvm.loop !1977

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !1979
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !1980
    #dbg_value(i32 %inc52, !1924, !DIExpression(), !1909)
  br label %for.cond1, !dbg !1981, !llvm.loop !1982

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !1984
    #dbg_value(i32 %inc55, !1913, !DIExpression(), !1909)
  br label %for.cond, !dbg !1985, !llvm.loop !1986

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !1988
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1013 {
entry:
    #dbg_value(ptr %r, !1989, !DIExpression(), !1990)
    #dbg_value(ptr %a, !1991, !DIExpression(), !1990)
    #dbg_value(i32 0, !1047, !DIExpression(), !1990)
  br label %for.cond, !dbg !1992

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1993
    #dbg_value(i32 %i.0, !1047, !DIExpression(), !1990)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !1994
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1995

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1996
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1997
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1998
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !1999
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2000
    #dbg_value(i32 %inc, !1047, !DIExpression(), !1990)
  br label %for.cond, !dbg !2001, !llvm.loop !2002

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2004
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1115 {
entry:
    #dbg_value(ptr %r, !1114, !DIExpression(), !2005)
    #dbg_value(ptr %a, !1120, !DIExpression(), !2005)
    #dbg_value(i32 0, !1121, !DIExpression(), !2005)
  br label %for.cond, !dbg !2006

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2007
    #dbg_value(i32 %i.0, !1121, !DIExpression(), !2005)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !2008
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2009

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2010
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2011
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2012
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !2013
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2014
    #dbg_value(i32 %inc, !1121, !DIExpression(), !2005)
  br label %for.cond, !dbg !2015, !llvm.loop !2016

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2018
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !717 {
entry:
    #dbg_value(ptr %r, !1427, !DIExpression(), !2019)
    #dbg_value(i32 0, !829, !DIExpression(), !2019)
  br label %for.cond, !dbg !2020

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_reduce.exit ], !dbg !2021
    #dbg_value(i32 %i.0, !829, !DIExpression(), !2019)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2022
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2023

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2024
    #dbg_value(ptr %arrayidx, !836, !DIExpression(), !2025)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %arrayidx) #4, !dbg !2027
    #dbg_value(ptr %arrayidx, !843, !DIExpression(), !2028)
    #dbg_value(i32 0, !847, !DIExpression(), !2028)
  br label %for.cond.i, !dbg !2030

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2031
    #dbg_value(i32 %i.0.i, !847, !DIExpression(), !2028)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2032
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2033

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2034
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2034
    #dbg_value(i16 %0, !855, !DIExpression(), !2035)
    #dbg_value(i16 20159, !862, !DIExpression(), !2035)
  %conv.i.i = sext i16 %0 to i32, !dbg !2037
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2038
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2039
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2040
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2035)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2035)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2041
  %2 = mul i16 %1, -3329, !dbg !2041
  %conv7.i.i = add i16 %2, %0, !dbg !2041
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2042
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2043
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2044
    #dbg_value(i32 %inc.i, !847, !DIExpression(), !2028)
  br label %for.cond.i, !dbg !2045, !llvm.loop !2046

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2048
    #dbg_value(i32 %inc, !829, !DIExpression(), !2019)
  br label %for.cond, !dbg !2049, !llvm.loop !2050

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2052
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1476 {
entry:
    #dbg_value(ptr %r, !1475, !DIExpression(), !2053)
    #dbg_value(i32 0, !1479, !DIExpression(), !2053)
  br label %for.cond, !dbg !2054

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2055
    #dbg_value(i32 %i.0, !1479, !DIExpression(), !2053)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !2056
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2057

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2058
    #dbg_value(ptr %arrayidx, !1487, !DIExpression(), !2059)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %arrayidx) #4, !dbg !2061
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2062
    #dbg_value(i32 %inc, !1479, !DIExpression(), !2053)
  br label %for.cond, !dbg !2063, !llvm.loop !2064

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2066
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2067 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !2071, !DIExpression(), !2072)
    #dbg_value(ptr %a, !2073, !DIExpression(), !2072)
    #dbg_value(ptr %b, !2074, !DIExpression(), !2072)
    #dbg_declare(ptr %t, !2075, !DIExpression(), !2076)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !2077
    #dbg_value(i32 1, !2078, !DIExpression(), !2072)
  br label %for.cond, !dbg !2079

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_add.exit ], !dbg !2081
    #dbg_value(i32 %i.0, !2078, !DIExpression(), !2072)
  %exitcond8 = icmp ne i32 %i.0, 2, !dbg !2082
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !2084

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !2085

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2087
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2089
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !2090
    #dbg_value(ptr %r, !976, !DIExpression(), !2091)
    #dbg_value(ptr %r, !984, !DIExpression(), !2091)
    #dbg_value(ptr %t, !985, !DIExpression(), !2091)
    #dbg_value(i32 0, !986, !DIExpression(), !2091)
  br label %for.cond.i, !dbg !2093

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2094
    #dbg_value(i32 %i.0.i, !986, !DIExpression(), !2091)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2095
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !2096

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2097
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2097
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !2098
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2098
  %add.i = add i16 %0, %1, !dbg !2099
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2100
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2101
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2102
    #dbg_value(i32 %inc.i, !986, !DIExpression(), !2091)
  br label %for.cond.i, !dbg !2103, !llvm.loop !2104

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2106
    #dbg_value(i32 %inc, !2078, !DIExpression(), !2072)
  br label %for.cond, !dbg !2107, !llvm.loop !2108

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2110
    #dbg_value(i32 %i.0.i2, !847, !DIExpression(), !2111)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2112
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2085

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2113
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2113
    #dbg_value(i16 %2, !855, !DIExpression(), !2114)
    #dbg_value(i16 20159, !862, !DIExpression(), !2114)
  %conv.i.i = sext i16 %2 to i32, !dbg !2116
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2117
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2118
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2119
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2114)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2114)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2120
  %4 = mul i16 %3, -3329, !dbg !2120
  %conv7.i.i = add i16 %4, %2, !dbg !2120
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2121
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2122
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2123
    #dbg_value(i32 %inc.i7, !847, !DIExpression(), !2111)
  br label %for.cond.i1, !dbg !2124, !llvm.loop !2125

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i1
  ret void, !dbg !2127
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !971 {
entry:
    #dbg_value(ptr %r, !2128, !DIExpression(), !2129)
    #dbg_value(i32 0, !1007, !DIExpression(), !2129)
  br label %for.cond, !dbg !2130

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_reduce.exit ], !dbg !2131
    #dbg_value(i32 %i.0, !1007, !DIExpression(), !2129)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2132
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2133

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2134
    #dbg_value(ptr %arrayidx, !843, !DIExpression(), !2135)
    #dbg_value(i32 0, !847, !DIExpression(), !2135)
  br label %for.cond.i, !dbg !2137

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2138
    #dbg_value(i32 %i.0.i, !847, !DIExpression(), !2135)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2139
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2140

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2141
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2141
    #dbg_value(i16 %0, !855, !DIExpression(), !2142)
    #dbg_value(i16 20159, !862, !DIExpression(), !2142)
  %conv.i.i = sext i16 %0 to i32, !dbg !2144
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2145
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2146
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2147
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2142)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2142)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2148
  %2 = mul i16 %1, -3329, !dbg !2148
  %conv7.i.i = add i16 %2, %0, !dbg !2148
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2149
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2150
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2151
    #dbg_value(i32 %inc.i, !847, !DIExpression(), !2135)
  br label %for.cond.i, !dbg !2152, !llvm.loop !2153

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2155
    #dbg_value(i32 %inc, !1007, !DIExpression(), !2129)
  br label %for.cond, !dbg !2156, !llvm.loop !2157

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2159
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !917 {
entry:
    #dbg_value(ptr %r, !1499, !DIExpression(), !2160)
    #dbg_value(ptr %a, !1502, !DIExpression(), !2160)
    #dbg_value(ptr %b, !1503, !DIExpression(), !2160)
    #dbg_value(i32 0, !965, !DIExpression(), !2160)
  br label %for.cond, !dbg !2161

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_add.exit ], !dbg !2162
    #dbg_value(i32 %i.0, !965, !DIExpression(), !2160)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2163
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2164

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2165
  %arrayidx2 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2166
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2167
    #dbg_value(ptr %arrayidx, !976, !DIExpression(), !2168)
    #dbg_value(ptr %arrayidx2, !984, !DIExpression(), !2168)
    #dbg_value(ptr %arrayidx4, !985, !DIExpression(), !2168)
    #dbg_value(i32 0, !986, !DIExpression(), !2168)
  br label %for.cond.i, !dbg !2170

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2171
    #dbg_value(i32 %i.0.i, !986, !DIExpression(), !2168)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2172
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !2173

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2174
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2174
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2175
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2175
  %add.i = add i16 %0, %1, !dbg !2176
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2177
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2178
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2179
    #dbg_value(i32 %inc.i, !986, !DIExpression(), !2168)
  br label %for.cond.i, !dbg !2180, !llvm.loop !2181

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2183
    #dbg_value(i32 %inc, !965, !DIExpression(), !2160)
  br label %for.cond, !dbg !2184, !llvm.loop !2185

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2187
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2188 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2189, !DIExpression(), !2190)
    #dbg_value(ptr %a, !2191, !DIExpression(), !2190)
    #dbg_declare(ptr %t, !2192, !DIExpression(), !2196)
    #dbg_value(i32 0, !2197, !DIExpression(), !2190)
  br label %for.cond, !dbg !2198

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !2200
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2189, !DIExpression(), !2190)
    #dbg_value(i32 %i.0, !2197, !DIExpression(), !2190)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2201
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !2203

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2204

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2207
    #dbg_value(i32 %j.0, !2208, !DIExpression(), !2190)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2209
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2204

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2211
  %add = or disjoint i32 %mul, %j.0, !dbg !2213
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2214
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2214
    #dbg_value(i16 %0, !2215, !DIExpression(), !2190)
  %isneg = icmp slt i16 %0, 0, !dbg !2216
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2216
  %add5 = add i16 %and, %0, !dbg !2217
    #dbg_value(i16 %add5, !2215, !DIExpression(), !2190)
  %conv7 = sext i16 %add5 to i32, !dbg !2218
    #dbg_value(i32 %conv7, !2219, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !2190)
    #dbg_value(i32 %conv7, !2219, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2190)
  %1 = mul i32 %conv7, 1290160, !dbg !2220
  %mul9 = add i32 %1, 134257275, !dbg !2220
    #dbg_value(i32 %mul9, !2219, !DIExpression(), !2190)
  %shr10 = lshr i32 %mul9, 28, !dbg !2221
    #dbg_value(i32 %shr10, !2219, !DIExpression(), !2190)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2222
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2223
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2224
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2225
    #dbg_value(i32 %inc, !2208, !DIExpression(), !2190)
  br label %for.cond1, !dbg !2226, !llvm.loop !2227

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2229
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2230
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !2230
  %shl18 = shl i8 %3, 4, !dbg !2231
  %or = or i8 %shl18, %2, !dbg !2232
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2233
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2234
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2234
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2235
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !2235
  %shl25 = shl i8 %5, 4, !dbg !2236
  %or26 = or i8 %shl25, %4, !dbg !2237
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2238
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !2239
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2240
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2240
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2241
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2241
  %shl33 = shl i8 %7, 4, !dbg !2242
  %or34 = or i8 %shl33, %6, !dbg !2243
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2244
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !2245
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2246
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !2246
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2247
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !2247
  %shl41 = shl i8 %9, 4, !dbg !2248
  %or42 = or i8 %shl41, %8, !dbg !2249
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2250
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !2251
    #dbg_value(ptr %r.addr.0, !2189, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !2190)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2252
    #dbg_value(ptr %add.ptr, !2189, !DIExpression(), !2190)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !2253
    #dbg_value(i32 %inc46, !2197, !DIExpression(), !2190)
  br label %for.cond, !dbg !2254, !llvm.loop !2255

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !2257
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1646 {
entry:
    #dbg_value(ptr %r, !1645, !DIExpression(), !2258)
    #dbg_value(ptr %a, !1649, !DIExpression(), !2258)
    #dbg_value(i32 0, !1650, !DIExpression(), !2258)
  br label %for.cond, !dbg !2259

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2260
    #dbg_value(i32 %i.0, !1650, !DIExpression(), !2258)
    #dbg_value(ptr %a.addr.0, !1649, !DIExpression(), !2258)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2261
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2262

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2263
  %1 = and i8 %0, 15, !dbg !2264
  %conv2 = zext nneg i8 %1 to i32, !dbg !2265
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !2266
  %add = add nuw nsw i32 %mul, 8, !dbg !2267
  %shr = lshr i32 %add, 4, !dbg !2268
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !2269
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2270
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !2271
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !2272
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !2273
  %3 = lshr i8 %2, 4, !dbg !2274
  %conv11 = zext nneg i8 %3 to i32, !dbg !2275
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !2276
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !2277
  %shr14 = lshr i32 %add13, 4, !dbg !2278
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !2279
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !2280
  %add18 = or disjoint i32 %mul17, 1, !dbg !2281
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2282
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !2283
    #dbg_value(ptr %a.addr.0, !1649, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2258)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2284
    #dbg_value(ptr %add.ptr, !1649, !DIExpression(), !2258)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2285
    #dbg_value(i32 %inc, !1650, !DIExpression(), !2258)
  br label %for.cond, !dbg !2286, !llvm.loop !2287

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2289
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2290 {
entry:
    #dbg_value(ptr %r, !2291, !DIExpression(), !2292)
    #dbg_value(ptr %a, !2293, !DIExpression(), !2292)
    #dbg_value(i32 0, !2294, !DIExpression(), !2292)
  br label %for.cond, !dbg !2295

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2297
    #dbg_value(i32 %i.0, !2294, !DIExpression(), !2292)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2298
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2300

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2301
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2303
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2303
    #dbg_value(i16 %0, !2304, !DIExpression(), !2292)
  %isneg = icmp slt i16 %0, 0, !dbg !2305
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2305
  %add = add i16 %and, %0, !dbg !2306
    #dbg_value(i16 %add, !2304, !DIExpression(), !2292)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2307
  %add5 = or disjoint i32 %mul4, 1, !dbg !2308
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2309
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2309
    #dbg_value(i16 %1, !2310, !DIExpression(), !2292)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2311
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2311
  %add11 = add i16 %and9, %1, !dbg !2312
    #dbg_value(i16 %add11, !2310, !DIExpression(), !2292)
  %conv15 = trunc i16 %add to i8, !dbg !2313
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2314
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2315
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2316
  %2 = lshr i16 %add, 8, !dbg !2317
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2317
  %conv21 = trunc i16 %add11 to i8, !dbg !2318
  %shl = shl i8 %conv21, 4, !dbg !2319
  %or = or i8 %shl, %shr20, !dbg !2320
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2321
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2322
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2322
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2323
  %4 = lshr i16 %add11, 4, !dbg !2324
  %conv28 = trunc i16 %4 to i8, !dbg !2325
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2326
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2327
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2327
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2328
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2329
    #dbg_value(i32 %inc, !2294, !DIExpression(), !2292)
  br label %for.cond, !dbg !2330, !llvm.loop !2331

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2333
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2334 {
entry:
    #dbg_value(ptr %r, !2335, !DIExpression(), !2336)
    #dbg_value(ptr %a, !2337, !DIExpression(), !2336)
    #dbg_value(i32 0, !2338, !DIExpression(), !2336)
  br label %for.cond, !dbg !2339

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2341
    #dbg_value(i32 %i.0, !2338, !DIExpression(), !2336)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2342
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2344

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2345
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2347
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2347
  %conv = zext i8 %0 to i16, !dbg !2347
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2348
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2349
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2349
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2349
  %conv5 = zext i8 %2 to i16, !dbg !2350
  %shl = shl nuw i16 %conv5, 8, !dbg !2351
  %shl.masked = and i16 %shl, 3840, !dbg !2352
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2352
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2353
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2354
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2355
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2356
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2357
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2357
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2357
  %5 = lshr i8 %4, 4, !dbg !2358
  %shr13 = zext nneg i8 %5 to i16, !dbg !2358
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2359
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2360
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2360
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2360
  %conv18 = zext i8 %7 to i16, !dbg !2361
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2362
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2363
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2364
  %add25 = or disjoint i32 %mul24, 1, !dbg !2365
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2366
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2367
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2368
    #dbg_value(i32 %inc, !2338, !DIExpression(), !2336)
  br label %for.cond, !dbg !2369, !llvm.loop !2370

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2372
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1139 {
entry:
    #dbg_value(ptr %r, !1138, !DIExpression(), !2373)
    #dbg_value(ptr %msg, !1144, !DIExpression(), !2373)
    #dbg_value(i32 0, !1145, !DIExpression(), !2373)
  br label %for.cond, !dbg !2374

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2375
    #dbg_value(i32 %i.0, !1145, !DIExpression(), !2373)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2376
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2377

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2378

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2379
    #dbg_value(i32 %j.0, !1156, !DIExpression(), !2373)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2380
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2378

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2381
  %add = or disjoint i32 %mul, %j.0, !dbg !2382
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2383
  store i16 0, ptr %arrayidx, align 2, !dbg !2384
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2385
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2385
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2386
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2387
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2387
  %conv = zext i8 %0 to i32, !dbg !2387
    #dbg_value(ptr %add.ptr6, !1167, !DIExpression(), !2388)
    #dbg_value(i16 1665, !1173, !DIExpression(), !2388)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2388)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2388)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2390
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2391
  %3 = and i32 %2, %conv, !dbg !2391
  %4 = icmp eq i32 %3, 0, !dbg !2391
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2392
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2392
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2393
    #dbg_value(i32 %inc, !1156, !DIExpression(), !2373)
  br label %for.cond1, !dbg !2394, !llvm.loop !2395

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2397
    #dbg_value(i32 %inc10, !1145, !DIExpression(), !2373)
  br label %for.cond, !dbg !2398, !llvm.loop !2399

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2401
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1767 {
entry:
    #dbg_value(ptr %msg, !2402, !DIExpression(), !2403)
    #dbg_value(ptr %a, !2404, !DIExpression(), !2403)
    #dbg_value(i32 0, !1786, !DIExpression(), !2403)
  br label %for.cond, !dbg !2405

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2406
    #dbg_value(i32 %i.0, !1786, !DIExpression(), !2403)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2407
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2408

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2409
  store i8 0, ptr %arrayidx, align 1, !dbg !2410
    #dbg_value(i32 0, !1793, !DIExpression(), !2403)
  br label %for.cond1, !dbg !2411

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2412
    #dbg_value(i32 %j.0, !1793, !DIExpression(), !2403)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2413
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2414

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2415
  %add = or disjoint i32 %mul, %j.0, !dbg !2416
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2417
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2417
  %conv = sext i16 %0 to i32, !dbg !2417
    #dbg_value(i32 %conv, !1804, !DIExpression(), !2403)
    #dbg_value(i32 %conv, !1804, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2403)
    #dbg_value(i32 %conv, !1804, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2403)
  %1 = mul i32 %conv, 161270, !dbg !2418
  %mul6 = add i32 %1, 134257275, !dbg !2418
    #dbg_value(i32 %mul6, !1804, !DIExpression(), !2403)
  %shr = lshr i32 %mul6, 28, !dbg !2419
    #dbg_value(i32 %shr, !1804, !DIExpression(), !2403)
  %and = and i32 %shr, 1, !dbg !2420
    #dbg_value(i32 %and, !1804, !DIExpression(), !2403)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2421
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2422
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2423
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2423
  %conv10 = or i8 %2, %3, !dbg !2423
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2423
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2424
    #dbg_value(i32 %inc, !1793, !DIExpression(), !2403)
  br label %for.cond1, !dbg !2425, !llvm.loop !2426

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2428
    #dbg_value(i32 %inc12, !1786, !DIExpression(), !2403)
  br label %for.cond, !dbg !2429, !llvm.loop !2430

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2432
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !542 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !552, !DIExpression(), !2433)
    #dbg_value(ptr %seed, !554, !DIExpression(), !2433)
    #dbg_value(i8 %nonce, !555, !DIExpression(), !2433)
    #dbg_declare(ptr %buf, !556, !DIExpression(), !2434)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2435
    #dbg_value(ptr %buf, !566, !DIExpression(), !2437)
    #dbg_value(i32 192, !568, !DIExpression(), !2437)
    #dbg_value(ptr %seed, !569, !DIExpression(), !2437)
    #dbg_value(i8 %nonce, !570, !DIExpression(), !2437)
    #dbg_declare(ptr %extkey.i, !571, !DIExpression(), !2438)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2435
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2439
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2440
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2441
    #dbg_value(ptr %buf, !585, !DIExpression(), !2444)
    #dbg_value(i32 192, !587, !DIExpression(), !2444)
    #dbg_value(ptr %extkey.i, !588, !DIExpression(), !2444)
    #dbg_value(i32 33, !589, !DIExpression(), !2444)
    #dbg_declare(ptr %state.i, !590, !DIExpression(), !2445)
    #dbg_value(ptr %state.i, !592, !DIExpression(), !2446)
    #dbg_value(ptr %extkey.i, !594, !DIExpression(), !2446)
    #dbg_value(i32 33, !595, !DIExpression(), !2446)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2441
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2447
  store i32 136, ptr %pos.i.i, align 8, !dbg !2448
    #dbg_value(i32 1, !598, !DIExpression(), !2444)
    #dbg_value(ptr %buf, !599, !DIExpression(), !2449)
    #dbg_value(i32 1, !603, !DIExpression(), !2449)
    #dbg_value(ptr %state.i, !604, !DIExpression(), !2449)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2451)
    #dbg_value(i32 1, !355, !DIExpression(), !2451)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2451)
    #dbg_value(i32 136, !357, !DIExpression(), !2451)
  br label %while.cond.i, !dbg !2453

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ 1, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !2451)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !2451)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !2453
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !2453

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2454
    #dbg_value(i32 0, !361, !DIExpression(), !2451)
  br label %for.cond.i, !dbg !2455

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !2456
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !2451)
  %exitcond15 = icmp ne i32 %i.0.i, 17, !dbg !2457
  br i1 %exitcond15, label %for.body.i, label %for.end.i, !dbg !2458

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !2459
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !2460
  %arrayidx.i2 = getelementptr inbounds nuw i64, ptr %state.i, i32 %i.0.i, !dbg !2461
  %0 = load i64, ptr %arrayidx.i2, align 8, !dbg !2461
    #dbg_value(ptr %add.ptr.i1, !371, !DIExpression(), !2462)
    #dbg_value(i64 %0, !377, !DIExpression(), !2462)
    #dbg_value(i32 0, !378, !DIExpression(), !2462)
  br label %for.cond.i.i, !dbg !2464

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2465
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !2462)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !2466
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !2467

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !2468
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !2469
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !2469
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !2470
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i1, i32 %i.0.i.i, !dbg !2471
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !2472
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2473
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !2462)
  br label %for.cond.i.i, !dbg !2474, !llvm.loop !2475

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2477
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !2451)
  br label %for.cond.i, !dbg !2478, !llvm.loop !2479

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !2481
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !2451)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !2482
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !2451)
  br label %while.cond.i, !dbg !2453, !llvm.loop !2483

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 56, !587, !DIExpression(), !2444)
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %buf, i32 136, !dbg !2485
    #dbg_value(ptr %add.ptr.i, !585, !DIExpression(), !2444)
    #dbg_value(ptr %add.ptr.i, !640, !DIExpression(), !2486)
    #dbg_value(i32 56, !644, !DIExpression(), !2486)
    #dbg_value(ptr %state.i, !645, !DIExpression(), !2486)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2488
  %1 = load i32, ptr %pos.i1.i, align 8, !dbg !2488
    #dbg_value(ptr %add.ptr.i, !647, !DIExpression(), !2489)
    #dbg_value(i32 56, !653, !DIExpression(), !2489)
    #dbg_value(ptr %state.i, !654, !DIExpression(), !2489)
    #dbg_value(i32 %1, !655, !DIExpression(), !2489)
    #dbg_value(i32 136, !656, !DIExpression(), !2489)
  br label %while.cond.i3, !dbg !2491

while.cond.i3:                                    ; preds = %for.end.i10, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i9.lcssa, %for.end.i10 ]
  %outlen.addr.0.i = phi i32 [ 56, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i10 ]
  %out.addr.0.i4 = phi ptr [ %add.ptr.i, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i10 ]
    #dbg_value(ptr %out.addr.0.i4, !647, !DIExpression(), !2489)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !2489)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !2489)
  %tobool.not.i5 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2491
  br i1 %tobool.not.i5, label %keccak_squeeze.exit, label %while.body.i6, !dbg !2491

while.body.i6:                                    ; preds = %while.cond.i3
  %cmp.i7 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2492
  br i1 %cmp.i7, label %if.then.i, label %if.end.i, !dbg !2492

if.then.i:                                        ; preds = %while.body.i6
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2493
    #dbg_value(i32 0, !655, !DIExpression(), !2489)
  br label %if.end.i, !dbg !2494

if.end.i:                                         ; preds = %if.then.i, %while.body.i6
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i6 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !2489)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !2489)
  br label %for.cond.i8, !dbg !2495

for.cond.i8:                                      ; preds = %for.body.i11, %if.end.i
  %i.0.i9 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i14, %for.body.i11 ], !dbg !2496
  %out.addr.1.i = phi ptr [ %out.addr.0.i4, %if.end.i ], [ %incdec.ptr.i, %for.body.i11 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !2489)
    #dbg_value(i32 %i.0.i9, !664, !DIExpression(), !2489)
  %cmp1.i = icmp ult i32 %i.0.i9, 136, !dbg !2497
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2498
  %cmp2.i = icmp ult i32 %i.0.i9, %add.i, !dbg !2498
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2498
  br i1 %2, label %for.body.i11, label %for.end.i10, !dbg !2499

for.body.i11:                                     ; preds = %for.cond.i8
  %div1.i = lshr i32 %i.0.i9, 3, !dbg !2500
  %arrayidx.i12 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2501
  %3 = load i64, ptr %arrayidx.i12, align 8, !dbg !2501
  %rem.i = shl nuw nsw i32 %i.0.i9, 3, !dbg !2502
  %mul.i13 = and i32 %rem.i, 56, !dbg !2502
  %sh_prom.i = zext nneg i32 %mul.i13 to i64, !dbg !2503
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !2503
  %conv.i = trunc i64 %shr.i to i8, !dbg !2501
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2489)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2504
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2505
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !2489)
  %inc.i14 = add nuw nsw i32 %i.0.i9, 1, !dbg !2506
    #dbg_value(i32 %inc.i14, !664, !DIExpression(), !2489)
  br label %for.cond.i8, !dbg !2507, !llvm.loop !2508

for.end.i10:                                      ; preds = %for.cond.i8
  %i.0.i9.lcssa = phi i32 [ %i.0.i9, %for.cond.i8 ], !dbg !2496
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i8 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i9.lcssa, !dbg !2510
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2511
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !2489)
    #dbg_value(i32 %i.0.i9.lcssa, !655, !DIExpression(), !2489)
  br label %while.cond.i3, !dbg !2491, !llvm.loop !2512

keccak_squeeze.exit:                              ; preds = %while.cond.i3
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i3 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2514
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2515
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2516
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2517
    #dbg_value(ptr %r, !691, !DIExpression(), !2518)
    #dbg_value(ptr %buf, !703, !DIExpression(), !2518)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2520
  ret void, !dbg !2521
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1297 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1299, !DIExpression(), !2522)
    #dbg_value(ptr %seed, !1301, !DIExpression(), !2522)
    #dbg_value(i8 %nonce, !1302, !DIExpression(), !2522)
    #dbg_declare(ptr %buf, !1303, !DIExpression(), !2523)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2524
    #dbg_value(ptr %buf, !566, !DIExpression(), !2526)
    #dbg_value(i32 128, !568, !DIExpression(), !2526)
    #dbg_value(ptr %seed, !569, !DIExpression(), !2526)
    #dbg_value(i8 %nonce, !570, !DIExpression(), !2526)
    #dbg_declare(ptr %extkey.i, !571, !DIExpression(), !2527)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2524
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2528
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2529
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2530
    #dbg_value(ptr %buf, !585, !DIExpression(), !2533)
    #dbg_value(i32 128, !587, !DIExpression(), !2533)
    #dbg_value(ptr %extkey.i, !588, !DIExpression(), !2533)
    #dbg_value(i32 33, !589, !DIExpression(), !2533)
    #dbg_declare(ptr %state.i, !590, !DIExpression(), !2534)
    #dbg_value(ptr %state.i, !592, !DIExpression(), !2535)
    #dbg_value(ptr %extkey.i, !594, !DIExpression(), !2535)
    #dbg_value(i32 33, !595, !DIExpression(), !2535)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2530
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2536
  store i32 136, ptr %pos.i.i, align 8, !dbg !2537
    #dbg_value(i32 0, !598, !DIExpression(), !2533)
    #dbg_value(ptr %buf, !599, !DIExpression(), !2538)
    #dbg_value(i32 0, !603, !DIExpression(), !2538)
    #dbg_value(ptr %state.i, !604, !DIExpression(), !2538)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2540)
    #dbg_value(i32 0, !355, !DIExpression(), !2540)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2540)
    #dbg_value(i32 136, !357, !DIExpression(), !2540)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2540)
    #dbg_value(i32 0, !355, !DIExpression(), !2540)
    #dbg_value(i32 128, !587, !DIExpression(), !2533)
    #dbg_value(ptr %buf, !585, !DIExpression(), !2533)
    #dbg_value(ptr %buf, !640, !DIExpression(), !2542)
    #dbg_value(i32 128, !644, !DIExpression(), !2542)
    #dbg_value(ptr %state.i, !645, !DIExpression(), !2542)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2544
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2544
    #dbg_value(ptr %buf, !647, !DIExpression(), !2545)
    #dbg_value(i32 128, !653, !DIExpression(), !2545)
    #dbg_value(ptr %state.i, !654, !DIExpression(), !2545)
    #dbg_value(i32 %0, !655, !DIExpression(), !2545)
    #dbg_value(i32 136, !656, !DIExpression(), !2545)
  br label %while.cond.i2, !dbg !2547

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !647, !DIExpression(), !2545)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !2545)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !2545)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2547
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2547

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2548
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2548

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2549
    #dbg_value(i32 0, !655, !DIExpression(), !2545)
  br label %if.end.i, !dbg !2550

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !2545)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !2545)
  br label %for.cond.i7, !dbg !2551

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2552
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !2545)
    #dbg_value(i32 %i.0.i8, !664, !DIExpression(), !2545)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2553
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2554
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2554
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2554
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2555

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2556
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2557
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2557
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2558
  %mul.i12 = and i32 %rem.i, 56, !dbg !2558
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2559
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2559
  %conv.i = trunc i64 %shr.i to i8, !dbg !2557
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2545)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2560
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2561
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !2545)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2562
    #dbg_value(i32 %inc.i13, !664, !DIExpression(), !2545)
  br label %for.cond.i7, !dbg !2563, !llvm.loop !2564

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2552
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2566
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2567
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !2545)
    #dbg_value(i32 %i.0.i8.lcssa, !655, !DIExpression(), !2545)
  br label %while.cond.i2, !dbg !2547, !llvm.loop !2568

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2570
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2571
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2572
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2573
    #dbg_value(ptr %r, !1357, !DIExpression(), !2574)
    #dbg_value(ptr %buf, !1361, !DIExpression(), !2574)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2576
  ret void, !dbg !2577
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !837 {
entry:
    #dbg_value(ptr %r, !836, !DIExpression(), !2578)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #4, !dbg !2579
    #dbg_value(ptr %r, !843, !DIExpression(), !2580)
    #dbg_value(i32 0, !847, !DIExpression(), !2580)
  br label %for.cond.i, !dbg !2582

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2583
    #dbg_value(i32 %i.0.i, !847, !DIExpression(), !2580)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2584
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2585

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2586
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2586
    #dbg_value(i16 %0, !855, !DIExpression(), !2587)
    #dbg_value(i16 20159, !862, !DIExpression(), !2587)
  %conv.i.i = sext i16 %0 to i32, !dbg !2589
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2590
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2591
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2592
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2587)
    #dbg_value(i32 %shr.i.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2587)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2593
  %2 = mul i16 %1, -3329, !dbg !2593
  %conv7.i.i = add i16 %2, %0, !dbg !2593
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2594
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2595
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2596
    #dbg_value(i32 %inc.i, !847, !DIExpression(), !2580)
  br label %for.cond.i, !dbg !2597, !llvm.loop !2598

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  ret void, !dbg !2600
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !844 {
entry:
    #dbg_value(ptr %r, !843, !DIExpression(), !2601)
    #dbg_value(i32 0, !847, !DIExpression(), !2601)
  br label %for.cond, !dbg !2602

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2603
    #dbg_value(i32 %i.0, !847, !DIExpression(), !2601)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2604
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2605

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2606
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2606
    #dbg_value(i16 %0, !855, !DIExpression(), !2607)
    #dbg_value(i16 20159, !862, !DIExpression(), !2607)
  %conv.i = sext i16 %0 to i32, !dbg !2609
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2610
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2611
  %shr.i = ashr i32 %add.i, 26, !dbg !2612
    #dbg_value(i32 %shr.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2607)
    #dbg_value(i32 %shr.i, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2607)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2613
  %2 = mul i16 %1, -3329, !dbg !2613
  %conv7.i = add i16 %2, %0, !dbg !2613
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2614
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2615
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2616
    #dbg_value(i32 %inc, !847, !DIExpression(), !2601)
  br label %for.cond, !dbg !2617, !llvm.loop !2618

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2620
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1488 {
entry:
    #dbg_value(ptr %r, !1487, !DIExpression(), !2621)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #4, !dbg !2622
  ret void, !dbg !2623
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2624 {
entry:
    #dbg_value(ptr %r, !2625, !DIExpression(), !2626)
    #dbg_value(ptr %a, !2627, !DIExpression(), !2626)
    #dbg_value(ptr %b, !2628, !DIExpression(), !2626)
    #dbg_value(i32 0, !2629, !DIExpression(), !2626)
  br label %for.cond, !dbg !2630

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2632
    #dbg_value(i32 %i.0, !2629, !DIExpression(), !2626)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2633
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2635

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2636
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2638
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2639
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2640
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2641
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2642
  %add = or disjoint i32 %i.0, 64, !dbg !2643
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !2644
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2644
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2645
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2646
  %add10 = or disjoint i32 %mul9, 2, !dbg !2647
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2648
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2649
  %add14 = or disjoint i32 %mul13, 2, !dbg !2650
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2651
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2652
  %add18 = or disjoint i32 %mul17, 2, !dbg !2653
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2654
  %add20 = or disjoint i32 %i.0, 64, !dbg !2655
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add20, !dbg !2656
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2656
  %sub = sub i16 0, %1, !dbg !2657
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2658
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2659
    #dbg_value(i32 %inc, !2629, !DIExpression(), !2626)
  br label %for.cond, !dbg !2660, !llvm.loop !2661

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2663
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !929 {
entry:
    #dbg_value(ptr %r, !928, !DIExpression(), !2664)
    #dbg_value(i16 1353, !932, !DIExpression(), !2664)
    #dbg_value(i32 0, !933, !DIExpression(), !2664)
  br label %for.cond, !dbg !2665

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2666
    #dbg_value(i32 %i.0, !933, !DIExpression(), !2664)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2667
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2668

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2669
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2669
  %conv = sext i16 %0 to i32, !dbg !2670
  %mul = mul nsw i32 %conv, 1353, !dbg !2671
    #dbg_value(i32 %mul, !943, !DIExpression(), !2672)
    #dbg_value(i32 %mul, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2672)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2674
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2674
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2675
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2676
  %shr.i = lshr i32 %sub.i, 16, !dbg !2677
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2678
    #dbg_value(i16 %conv5.i, !948, !DIExpression(), !2672)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2679
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2680
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2681
    #dbg_value(i32 %inc, !933, !DIExpression(), !2664)
  br label %for.cond, !dbg !2682, !llvm.loop !2683

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2685
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !977 {
entry:
    #dbg_value(ptr %r, !976, !DIExpression(), !2686)
    #dbg_value(ptr %a, !984, !DIExpression(), !2686)
    #dbg_value(ptr %b, !985, !DIExpression(), !2686)
    #dbg_value(i32 0, !986, !DIExpression(), !2686)
  br label %for.cond, !dbg !2687

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2688
    #dbg_value(i32 %i.0, !986, !DIExpression(), !2686)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2689
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2690

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2691
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2691
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2692
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2692
  %add = add i16 %0, %1, !dbg !2693
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2694
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2695
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2696
    #dbg_value(i32 %inc, !986, !DIExpression(), !2686)
  br label %for.cond, !dbg !2697, !llvm.loop !2698

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2700
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1739 {
entry:
    #dbg_value(ptr %r, !1738, !DIExpression(), !2701)
    #dbg_value(ptr %a, !1742, !DIExpression(), !2701)
    #dbg_value(ptr %b, !1743, !DIExpression(), !2701)
    #dbg_value(i32 0, !1744, !DIExpression(), !2701)
  br label %for.cond, !dbg !2702

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2703
    #dbg_value(i32 %i.0, !1744, !DIExpression(), !2701)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2704
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2705

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2706
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2706
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2707
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2707
  %sub = sub i16 %0, %1, !dbg !2708
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2709
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2710
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2711
    #dbg_value(i32 %inc, !1744, !DIExpression(), !2701)
  br label %for.cond, !dbg !2712, !llvm.loop !2713

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2715
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2716 {
entry:
    #dbg_value(ptr %r, !2719, !DIExpression(), !2720)
    #dbg_value(i32 1, !2721, !DIExpression(), !2720)
    #dbg_value(i32 128, !2722, !DIExpression(), !2720)
  br label %for.cond, !dbg !2723

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2725
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2726
    #dbg_value(i32 %k.0, !2721, !DIExpression(), !2720)
    #dbg_value(i32 %len.0, !2722, !DIExpression(), !2720)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2727
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2729

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2730

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2733
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2720
    #dbg_value(i32 %k.1, !2721, !DIExpression(), !2720)
    #dbg_value(i32 %start.0, !2734, !DIExpression(), !2720)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2735
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2730

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2721, !DIExpression(), !2720)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !2737
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2737
    #dbg_value(i16 %0, !2739, !DIExpression(), !2720)
    #dbg_value(i32 %start.0, !2740, !DIExpression(), !2720)
  br label %for.cond4, !dbg !2741

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2743
    #dbg_value(i32 %j.0, !2740, !DIExpression(), !2720)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2744
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2746
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !2747

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2748
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !2748
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !2748
    #dbg_value(i16 %0, !2750, !DIExpression(), !2754)
    #dbg_value(i16 %2, !2756, !DIExpression(), !2754)
  %conv.i = sext i16 %0 to i32, !dbg !2757
  %conv1.i = sext i16 %2 to i32, !dbg !2758
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2759
    #dbg_value(i32 %mul.i, !943, !DIExpression(), !2760)
    #dbg_value(i32 %mul.i, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2760)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2762
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2762
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2763
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2764
  %shr.i = lshr i32 %sub.i, 16, !dbg !2765
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2766
    #dbg_value(i16 %conv5.i, !948, !DIExpression(), !2760)
    #dbg_value(i16 %conv5.i, !2767, !DIExpression(), !2720)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2768
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2768
  %sub = sub i16 %3, %conv5.i, !dbg !2769
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2770
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !2770
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !2771
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2772
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !2772
  %add17 = add i16 %5, %conv5.i, !dbg !2773
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2774
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !2775
  %inc20 = add nuw i32 %j.0, 1, !dbg !2776
    #dbg_value(i32 %inc20, !2740, !DIExpression(), !2720)
  br label %for.cond4, !dbg !2777, !llvm.loop !2778

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2743
  %inc = add i32 %k.1, 1, !dbg !2780
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !2781
    #dbg_value(i32 %add22, !2734, !DIExpression(), !2720)
  br label %for.cond1, !dbg !2782, !llvm.loop !2783

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2720
  %shr = lshr i32 %len.0, 1, !dbg !2785
    #dbg_value(i32 %shr, !2722, !DIExpression(), !2720)
  br label %for.cond, !dbg !2786, !llvm.loop !2787

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !2789
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2790 {
entry:
    #dbg_value(ptr %r, !2791, !DIExpression(), !2792)
    #dbg_value(i16 1441, !2793, !DIExpression(), !2792)
    #dbg_value(i32 127, !2794, !DIExpression(), !2792)
    #dbg_value(i32 2, !2795, !DIExpression(), !2792)
  br label %for.cond, !dbg !2796

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !2798
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !2799
    #dbg_value(i32 %k.0, !2794, !DIExpression(), !2792)
    #dbg_value(i32 %len.0, !2795, !DIExpression(), !2792)
  %cmp = icmp ult i32 %len.0, 129, !dbg !2800
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !2802

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2803

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !2806

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !2808
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !2792
    #dbg_value(i32 %k.1, !2794, !DIExpression(), !2792)
    #dbg_value(i32 %start.0, !2809, !DIExpression(), !2792)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2810
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !2803

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !2794, !DIExpression(), !2792)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !2812
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2812
    #dbg_value(i16 %0, !2814, !DIExpression(), !2792)
    #dbg_value(i32 %start.0, !2815, !DIExpression(), !2792)
  br label %for.cond4, !dbg !2816

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !2818
    #dbg_value(i32 %j.0, !2815, !DIExpression(), !2792)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2819
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2821
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !2822

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2823
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !2823
    #dbg_value(i16 %1, !2825, !DIExpression(), !2792)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2826
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !2826
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2826
  %add11 = add i16 %1, %3, !dbg !2827
    #dbg_value(i16 %add11, !855, !DIExpression(), !2828)
    #dbg_value(i16 20159, !862, !DIExpression(), !2828)
  %conv.i10 = sext i16 %add11 to i32, !dbg !2830
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !2831
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !2832
  %shr.i12 = ashr i32 %add.i, 26, !dbg !2833
    #dbg_value(i32 %shr.i12, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2828)
    #dbg_value(i32 %shr.i12, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2828)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !2834
  %5 = mul i16 %4, -3329, !dbg !2834
  %conv7.i = add i16 %5, %add11, !dbg !2834
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2835
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !2836
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2837
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !2837
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !2837
  %sub = sub i16 %7, %1, !dbg !2838
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2839
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !2839
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !2840
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2841
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !2841
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !2841
    #dbg_value(i16 %0, !2750, !DIExpression(), !2842)
    #dbg_value(i16 %10, !2756, !DIExpression(), !2842)
  %conv.i = sext i16 %0 to i32, !dbg !2844
  %conv1.i = sext i16 %10 to i32, !dbg !2845
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2846
    #dbg_value(i32 %mul.i, !943, !DIExpression(), !2847)
    #dbg_value(i32 %mul.i, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2847)
  %sext.i4 = mul i32 %mul.i, -218038272, !dbg !2849
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !2849
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !2850
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i, !dbg !2851
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !2852
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !2853
    #dbg_value(i16 %conv5.i9, !948, !DIExpression(), !2847)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2854
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !2854
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !2855
  %inc = add nuw i32 %j.0, 1, !dbg !2856
    #dbg_value(i32 %inc, !2815, !DIExpression(), !2792)
  br label %for.cond4, !dbg !2857, !llvm.loop !2858

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2818
  %dec = add i32 %k.1, -1, !dbg !2860
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !2861
    #dbg_value(i32 %add27, !2809, !DIExpression(), !2792)
  br label %for.cond1, !dbg !2862, !llvm.loop !2863

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2792
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !2865
    #dbg_value(i32 %shl, !2795, !DIExpression(), !2792)
  br label %for.cond, !dbg !2866, !llvm.loop !2867

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !2869
    #dbg_value(i32 %j.1, !2815, !DIExpression(), !2792)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !2870
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !2806

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2872
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !2872
    #dbg_value(i16 %12, !2750, !DIExpression(), !2873)
    #dbg_value(i16 1441, !2756, !DIExpression(), !2873)
  %conv.i1 = sext i16 %12 to i32, !dbg !2875
  %mul.i2 = mul nsw i32 %conv.i1, 1441, !dbg !2876
    #dbg_value(i32 %mul.i2, !943, !DIExpression(), !2877)
    #dbg_value(i32 %mul.i2, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2877)
  %sext.i = mul i32 %conv.i1, -660537344, !dbg !2879
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2879
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2880
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i2, !dbg !2881
  %shr.i = lshr i32 %sub.i, 16, !dbg !2882
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2883
    #dbg_value(i16 %conv5.i, !948, !DIExpression(), !2877)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2884
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !2885
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !2886
    #dbg_value(i32 %inc39, !2815, !DIExpression(), !2792)
  br label %for.cond31, !dbg !2887, !llvm.loop !2888

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !2890
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !2891 {
entry:
    #dbg_value(ptr %r, !2895, !DIExpression(), !2896)
    #dbg_value(ptr %a, !2897, !DIExpression(), !2896)
    #dbg_value(ptr %b, !2898, !DIExpression(), !2896)
    #dbg_value(i16 %zeta, !2899, !DIExpression(), !2896)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2900
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2900
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2901
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !2901
    #dbg_value(i16 %0, !2750, !DIExpression(), !2902)
    #dbg_value(i16 %1, !2756, !DIExpression(), !2902)
  %conv.i5 = sext i16 %0 to i32, !dbg !2904
  %conv1.i6 = sext i16 %1 to i32, !dbg !2905
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !2906
    #dbg_value(i32 %mul.i7, !943, !DIExpression(), !2907)
    #dbg_value(i32 %mul.i7, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2907)
  %sext.i23 = mul i32 %mul.i7, -218038272, !dbg !2909
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !2909
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !2910
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i7, !dbg !2911
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !2912
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !2913
    #dbg_value(i16 %conv5.i28, !948, !DIExpression(), !2907)
  store i16 %conv5.i28, ptr %r, align 2, !dbg !2914
    #dbg_value(i16 %conv5.i28, !2750, !DIExpression(), !2915)
    #dbg_value(i16 %zeta, !2756, !DIExpression(), !2915)
  %conv.i9 = ashr i32 %sub.i26, 16, !dbg !2917
  %conv1.i10 = sext i16 %zeta to i32, !dbg !2918
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !2919
    #dbg_value(i32 %mul.i11, !943, !DIExpression(), !2920)
    #dbg_value(i32 %mul.i11, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2920)
  %sext.i = mul i32 %mul.i11, -218038272, !dbg !2922
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2922
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2923
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i11, !dbg !2924
  %shr.i = lshr i32 %sub.i, 16, !dbg !2925
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2926
    #dbg_value(i16 %conv5.i, !948, !DIExpression(), !2920)
  store i16 %conv5.i, ptr %r, align 2, !dbg !2927
  %2 = load i16, ptr %a, align 2, !dbg !2928
  %3 = load i16, ptr %b, align 2, !dbg !2929
    #dbg_value(i16 %2, !2750, !DIExpression(), !2930)
    #dbg_value(i16 %3, !2756, !DIExpression(), !2930)
  %conv.i = sext i16 %2 to i32, !dbg !2932
  %conv1.i = sext i16 %3 to i32, !dbg !2933
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2934
    #dbg_value(i32 %mul.i, !943, !DIExpression(), !2935)
    #dbg_value(i32 %mul.i, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2935)
  %sext.i35 = mul i32 %mul.i, -218038272, !dbg !2937
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !2937
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !2938
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i, !dbg !2939
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !2940
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !2941
    #dbg_value(i16 %conv5.i40, !948, !DIExpression(), !2935)
  %4 = load i16, ptr %r, align 2, !dbg !2942
  %add = add i16 %4, %conv5.i40, !dbg !2942
  store i16 %add, ptr %r, align 2, !dbg !2942
  %5 = load i16, ptr %a, align 2, !dbg !2943
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2944
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !2944
    #dbg_value(i16 %5, !2750, !DIExpression(), !2945)
    #dbg_value(i16 %6, !2756, !DIExpression(), !2945)
  %conv.i1 = sext i16 %5 to i32, !dbg !2947
  %conv1.i2 = sext i16 %6 to i32, !dbg !2948
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !2949
    #dbg_value(i32 %mul.i3, !943, !DIExpression(), !2950)
    #dbg_value(i32 %mul.i3, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2950)
  %sext.i29 = mul i32 %mul.i3, -218038272, !dbg !2952
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !2952
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !2953
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i3, !dbg !2954
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !2955
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !2956
    #dbg_value(i16 %conv5.i34, !948, !DIExpression(), !2950)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2957
  store i16 %conv5.i34, ptr %arrayidx15, align 2, !dbg !2958
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2959
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !2959
  %8 = load i16, ptr %b, align 2, !dbg !2960
    #dbg_value(i16 %7, !2750, !DIExpression(), !2961)
    #dbg_value(i16 %8, !2756, !DIExpression(), !2961)
  %conv.i13 = sext i16 %7 to i32, !dbg !2963
  %conv1.i14 = sext i16 %8 to i32, !dbg !2964
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !2965
    #dbg_value(i32 %mul.i15, !943, !DIExpression(), !2966)
    #dbg_value(i32 %mul.i15, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2966)
  %sext.i17 = mul i32 %mul.i15, -218038272, !dbg !2968
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !2968
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !2969
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i15, !dbg !2970
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !2971
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !2972
    #dbg_value(i16 %conv5.i22, !948, !DIExpression(), !2966)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2973
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !2974
  %add22 = add i16 %9, %conv5.i22, !dbg !2974
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !2974
  ret void, !dbg !2975
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !692 {
entry:
    #dbg_value(ptr %r, !691, !DIExpression(), !2976)
    #dbg_value(ptr %buf, !703, !DIExpression(), !2976)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #4, !dbg !2977
  ret void, !dbg !2978
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !2979 {
entry:
    #dbg_value(ptr %r, !2980, !DIExpression(), !2981)
    #dbg_value(ptr %buf, !2982, !DIExpression(), !2981)
    #dbg_value(i32 0, !2983, !DIExpression(), !2981)
  br label %for.cond, !dbg !2984

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !2986
    #dbg_value(i32 %i.0, !2983, !DIExpression(), !2981)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !2987
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !2989

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2990
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !2992
    #dbg_value(ptr %add.ptr, !2993, !DIExpression(), !2997)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !2999
  %conv.i = zext i8 %0 to i32, !dbg !3000
    #dbg_value(i32 %conv.i, !3001, !DIExpression(), !2997)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3002
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3002
  %conv2.i = zext i8 %1 to i32, !dbg !3003
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3004
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3005
    #dbg_value(i32 %or.i, !3001, !DIExpression(), !2997)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3006
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3006
  %conv4.i = zext i8 %2 to i32, !dbg !3007
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3008
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3009
    #dbg_value(i32 %or6.i, !3001, !DIExpression(), !2997)
    #dbg_value(i32 %or6.i, !3010, !DIExpression(), !2981)
  %and = and i32 %or6.i, 2396745, !dbg !3011
    #dbg_value(i32 %and, !3012, !DIExpression(), !2981)
  %shr = lshr i32 %or6.i, 1, !dbg !3013
  %and1 = and i32 %shr, 2396745, !dbg !3014
  %add = add nuw nsw i32 %and, %and1, !dbg !3015
    #dbg_value(i32 %add, !3012, !DIExpression(), !2981)
  %shr2 = lshr i32 %or6.i, 2, !dbg !3016
  %and3 = and i32 %shr2, 2396745, !dbg !3017
  %add4 = add nuw nsw i32 %add, %and3, !dbg !3018
    #dbg_value(i32 %add4, !3012, !DIExpression(), !2981)
    #dbg_value(i32 0, !3019, !DIExpression(), !2981)
  br label %for.cond5, !dbg !3020

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !3022
    #dbg_value(i32 %j.0, !3019, !DIExpression(), !2981)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !3023
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !3025

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !3026
  %shr10 = lshr i32 %add4, %mul8, !dbg !3028
  %conv = and i32 %shr10, 7, !dbg !3029
    #dbg_value(i32 %shr10, !3030, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !2981)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !3031
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !3032
  %shr14 = lshr i32 %add4, %add13, !dbg !3033
  %conv16 = and i32 %shr14, 7, !dbg !3034
    #dbg_value(i32 %conv16, !3035, !DIExpression(), !2981)
  %sub = sub nsw i32 %conv, %conv16, !dbg !3036
  %conv19 = trunc nsw i32 %sub to i16, !dbg !3037
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !3038
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !3039
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !3040
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !3041
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3042
    #dbg_value(i32 %inc, !3019, !DIExpression(), !2981)
  br label %for.cond5, !dbg !3043, !llvm.loop !3044

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !3046
    #dbg_value(i32 %inc23, !2983, !DIExpression(), !2981)
  br label %for.cond, !dbg !3047, !llvm.loop !3048

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !3050
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1358 {
entry:
    #dbg_value(ptr %r, !1357, !DIExpression(), !3051)
    #dbg_value(ptr %buf, !1361, !DIExpression(), !3051)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3052
  ret void, !dbg !3053
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !3054 {
entry:
    #dbg_value(ptr %r, !3055, !DIExpression(), !3056)
    #dbg_value(ptr %buf, !3057, !DIExpression(), !3056)
    #dbg_value(i32 0, !3058, !DIExpression(), !3056)
  br label %for.cond, !dbg !3059

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !3061
    #dbg_value(i32 %i.0, !3058, !DIExpression(), !3056)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !3062
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !3064

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !3065
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !3067
    #dbg_value(ptr %add.ptr, !3068, !DIExpression(), !3070)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !3072
  %conv.i = zext i8 %0 to i32, !dbg !3073
    #dbg_value(i32 %conv.i, !3074, !DIExpression(), !3070)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3075
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3075
  %conv2.i = zext i8 %1 to i32, !dbg !3076
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3077
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3078
    #dbg_value(i32 %or.i, !3074, !DIExpression(), !3070)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3079
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3079
  %conv4.i = zext i8 %2 to i32, !dbg !3080
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3081
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3082
    #dbg_value(i32 %or6.i, !3074, !DIExpression(), !3070)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !3083
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !3083
  %conv8.i = zext i8 %3 to i32, !dbg !3084
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !3085
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !3086
    #dbg_value(i32 %or10.i, !3074, !DIExpression(), !3070)
    #dbg_value(i32 %or10.i, !3087, !DIExpression(), !3056)
  %and = and i32 %or10.i, 1431655765, !dbg !3088
    #dbg_value(i32 %and, !3089, !DIExpression(), !3056)
  %shr = lshr i32 %or10.i, 1, !dbg !3090
  %and1 = and i32 %shr, 1431655765, !dbg !3091
  %add = add nuw i32 %and, %and1, !dbg !3092
    #dbg_value(i32 %add, !3089, !DIExpression(), !3056)
    #dbg_value(i32 0, !3093, !DIExpression(), !3056)
  br label %for.cond2, !dbg !3094

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !3096
    #dbg_value(i32 %j.0, !3093, !DIExpression(), !3056)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !3097
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !3099

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !3100
  %shr7 = lshr i32 %add, %mul5, !dbg !3102
  %conv = and i32 %shr7, 3, !dbg !3103
    #dbg_value(i32 %shr7, !3104, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !3056)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !3105
  %add10 = or disjoint i32 %mul9, 2, !dbg !3106
  %shr11 = lshr i32 %add, %add10, !dbg !3107
  %conv13 = and i32 %shr11, 3, !dbg !3108
    #dbg_value(i32 %conv13, !3109, !DIExpression(), !3056)
  %sub = sub nsw i32 %conv, %conv13, !dbg !3110
  %conv16 = trunc nsw i32 %sub to i16, !dbg !3111
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !3112
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !3113
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !3114
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !3115
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3116
    #dbg_value(i32 %inc, !3093, !DIExpression(), !3056)
  br label %for.cond2, !dbg !3117, !llvm.loop !3118

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !3120
    #dbg_value(i32 %inc20, !3058, !DIExpression(), !3056)
  br label %for.cond, !dbg !3121, !llvm.loop !3122

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !3124
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !944 {
entry:
    #dbg_value(i32 %a, !943, !DIExpression(), !3125)
    #dbg_value(i32 %a, !948, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3125)
  %sext = mul i32 %a, -218038272, !dbg !3126
  %conv3 = ashr exact i32 %sext, 16, !dbg !3126
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !3127
  %sub = add i32 %mul4.neg, %a, !dbg !3128
  %shr = lshr i32 %sub, 16, !dbg !3129
  %conv5 = trunc nuw i32 %shr to i16, !dbg !3130
    #dbg_value(i16 %conv5, !948, !DIExpression(), !3125)
  ret i16 %conv5, !dbg !3131
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !856 {
entry:
    #dbg_value(i16 %a, !855, !DIExpression(), !3132)
    #dbg_value(i16 20159, !862, !DIExpression(), !3132)
  %conv = sext i16 %a to i32, !dbg !3133
  %mul = mul nsw i32 %conv, 20159, !dbg !3134
  %add = add nsw i32 %mul, 33554432, !dbg !3135
  %shr = ashr i32 %add, 26, !dbg !3136
    #dbg_value(i32 %shr, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3132)
    #dbg_value(i32 %shr, !867, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3132)
  %0 = trunc nsw i32 %shr to i16, !dbg !3137
  %1 = mul i16 %0, -3329, !dbg !3137
  %conv7 = add i16 %1, %a, !dbg !3137
  ret i16 %conv7, !dbg !3138
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !159 {
entry:
    #dbg_value(ptr %a, !158, !DIExpression(), !3139)
    #dbg_value(ptr %b, !167, !DIExpression(), !3139)
    #dbg_value(i32 %len, !168, !DIExpression(), !3139)
    #dbg_value(i8 0, !169, !DIExpression(), !3139)
    #dbg_value(i32 0, !170, !DIExpression(), !3139)
  br label %for.cond, !dbg !3140

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3141
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !3139
    #dbg_value(i8 %r.0, !169, !DIExpression(), !3139)
    #dbg_value(i32 %i.0, !170, !DIExpression(), !3139)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3142
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !3143

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3139)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3144
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3144
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !3145
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !3145
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3139)
  %xor1 = xor i8 %0, %1, !dbg !3146
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3139)
  %or2 = or i8 %r.0, %xor1, !dbg !3147
    #dbg_value(i8 %or2, !169, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3139)
    #dbg_value(i8 %or2, !169, !DIExpression(), !3139)
  %inc = add i32 %i.0, 1, !dbg !3148
    #dbg_value(i32 %inc, !170, !DIExpression(), !3139)
  br label %for.cond, !dbg !3149, !llvm.loop !3150

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !3139
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !3152
  %conv6 = zext i1 %2 to i32, !dbg !3153
  ret i32 %conv6, !dbg !3154
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !191 {
entry:
    #dbg_value(ptr %r, !190, !DIExpression(), !3155)
    #dbg_value(ptr %x, !196, !DIExpression(), !3155)
    #dbg_value(i32 %len, !197, !DIExpression(), !3155)
    #dbg_value(i8 %b, !198, !DIExpression(), !3155)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !3156, !srcloc !200
    #dbg_value(i8 %0, !198, !DIExpression(), !3155)
  %sub = sub i8 0, %0, !dbg !3157
    #dbg_value(i8 %sub, !198, !DIExpression(), !3155)
    #dbg_value(i32 0, !202, !DIExpression(), !3155)
  br label %for.cond, !dbg !3158

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3159
    #dbg_value(i32 %i.0, !202, !DIExpression(), !3155)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3160
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3161

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3162
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3162
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3163
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !3163
  %xor1 = xor i8 %1, %2, !dbg !3164
  %and2 = and i8 %xor1, %sub, !dbg !3165
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3166
  %xor93 = xor i8 %1, %and2, !dbg !3167
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !3167
  %inc = add i32 %i.0, 1, !dbg !3168
    #dbg_value(i32 %inc, !202, !DIExpression(), !3155)
  br label %for.cond, !dbg !3169, !llvm.loop !3170

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3172
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1168 {
entry:
    #dbg_value(ptr %r, !1167, !DIExpression(), !3173)
    #dbg_value(i16 %v, !1173, !DIExpression(), !3173)
    #dbg_value(i16 %b, !1174, !DIExpression(), !3173)
  %sub = sub i16 0, %b, !dbg !3174
    #dbg_value(i16 %sub, !1174, !DIExpression(), !3173)
  %0 = load i16, ptr %r, align 2, !dbg !3175
  %xor1 = xor i16 %0, %v, !dbg !3176
  %and = and i16 %xor1, %sub, !dbg !3177
  %xor6 = xor i16 %and, %0, !dbg !3178
  store i16 %xor6, ptr %r, align 2, !dbg !3178
  ret void, !dbg !3179
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3180 {
entry:
    #dbg_value(ptr %state, !3183, !DIExpression(), !3184)
    #dbg_value(ptr %state, !3185, !DIExpression(), !3189)
    #dbg_value(i32 0, !3191, !DIExpression(), !3189)
  br label %for.cond.i, !dbg !3192

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3194
    #dbg_value(i32 %i.0.i, !3191, !DIExpression(), !3189)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3195
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3197

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3198
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3199
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3200
    #dbg_value(i32 %inc.i, !3191, !DIExpression(), !3189)
  br label %for.cond.i, !dbg !3201, !llvm.loop !3202

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3204
  store i32 0, ptr %pos, align 8, !dbg !3205
  ret void, !dbg !3206
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3207 {
entry:
    #dbg_value(ptr %state, !3208, !DIExpression(), !3209)
    #dbg_value(ptr %in, !3210, !DIExpression(), !3209)
    #dbg_value(i32 %inlen, !3211, !DIExpression(), !3209)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3212
  %0 = load i32, ptr %pos, align 8, !dbg !3212
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3213
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3214
  store i32 %call, ptr %pos1, align 8, !dbg !3215
  ret void, !dbg !3216
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3217 {
entry:
    #dbg_value(ptr %s, !3220, !DIExpression(), !3221)
    #dbg_value(i32 %pos, !3222, !DIExpression(), !3221)
    #dbg_value(i32 %r, !3223, !DIExpression(), !3221)
    #dbg_value(ptr %in, !3224, !DIExpression(), !3221)
    #dbg_value(i32 %inlen, !3225, !DIExpression(), !3221)
  br label %while.cond, !dbg !3226

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3222, !DIExpression(), !3221)
    #dbg_value(i32 %inlen.addr.0, !3225, !DIExpression(), !3221)
    #dbg_value(ptr %in.addr.0, !3224, !DIExpression(), !3221)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3227
  %cmp.not = icmp ult i32 %add, %r, !dbg !3228
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3226

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3229
  br label %for.cond, !dbg !3229

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3232

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3234
    #dbg_value(i32 %i.0, !3235, !DIExpression(), !3221)
    #dbg_value(ptr %in.addr.1, !3224, !DIExpression(), !3221)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3236
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3229

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3224, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3221)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3238
  %conv = zext i8 %0 to i64, !dbg !3239
  %rem = shl i32 %i.0, 3, !dbg !3240
  %mul = and i32 %rem, 56, !dbg !3240
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3241
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3241
  %div2 = lshr i32 %i.0, 3, !dbg !3242
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3243
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3244
  %xor = xor i64 %1, %shl, !dbg !3244
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3244
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3245
    #dbg_value(ptr %incdec.ptr, !3224, !DIExpression(), !3221)
  %inc = add i32 %i.0, 1, !dbg !3246
    #dbg_value(i32 %inc, !3235, !DIExpression(), !3221)
  br label %for.cond, !dbg !3247, !llvm.loop !3248

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3250
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3251
    #dbg_value(i32 %sub2, !3225, !DIExpression(), !3221)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3252
    #dbg_value(i32 0, !3222, !DIExpression(), !3221)
  br label %while.cond, !dbg !3226, !llvm.loop !3253

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3255
    #dbg_value(i32 %i.1, !3235, !DIExpression(), !3221)
    #dbg_value(ptr %in.addr.2, !3224, !DIExpression(), !3221)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3256
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3258
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3232

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3224, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3221)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3259
  %conv9 = zext i8 %2 to i64, !dbg !3260
  %rem10 = shl i32 %i.1, 3, !dbg !3261
  %mul11 = and i32 %rem10, 56, !dbg !3261
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3262
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3262
  %div141 = lshr i32 %i.1, 3, !dbg !3263
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3264
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3265
  %xor16 = xor i64 %3, %shl13, !dbg !3265
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3265
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3266
    #dbg_value(ptr %incdec.ptr8, !3224, !DIExpression(), !3221)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3267
    #dbg_value(i32 %inc18, !3235, !DIExpression(), !3221)
  br label %for.cond3, !dbg !3268, !llvm.loop !3269

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3255
  ret i32 %i.1.lcssa, !dbg !3271
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3272 {
entry:
    #dbg_value(ptr %state, !3273, !DIExpression(), !3274)
  %0 = load i64, ptr %state, align 8, !dbg !3275
    #dbg_value(i64 %0, !3276, !DIExpression(), !3274)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3277
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3277
    #dbg_value(i64 %1, !3278, !DIExpression(), !3274)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3279
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3279
    #dbg_value(i64 %2, !3280, !DIExpression(), !3274)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3281
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3281
    #dbg_value(i64 %3, !3282, !DIExpression(), !3274)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3283
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3283
    #dbg_value(i64 %4, !3284, !DIExpression(), !3274)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3285
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3285
    #dbg_value(i64 %5, !3286, !DIExpression(), !3274)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3287
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3287
    #dbg_value(i64 %6, !3288, !DIExpression(), !3274)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3289
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3289
    #dbg_value(i64 %7, !3290, !DIExpression(), !3274)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3291
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3291
    #dbg_value(i64 %8, !3292, !DIExpression(), !3274)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3293
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3293
    #dbg_value(i64 %9, !3294, !DIExpression(), !3274)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3295
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3295
    #dbg_value(i64 %10, !3296, !DIExpression(), !3274)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3297
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3297
    #dbg_value(i64 %11, !3298, !DIExpression(), !3274)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3299
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3299
    #dbg_value(i64 %12, !3300, !DIExpression(), !3274)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3301
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3301
    #dbg_value(i64 %13, !3302, !DIExpression(), !3274)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3303
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3303
    #dbg_value(i64 %14, !3304, !DIExpression(), !3274)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3305
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3305
    #dbg_value(i64 %15, !3306, !DIExpression(), !3274)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3307
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3307
    #dbg_value(i64 %16, !3308, !DIExpression(), !3274)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3309
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3309
    #dbg_value(i64 %17, !3310, !DIExpression(), !3274)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3311
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3311
    #dbg_value(i64 %18, !3312, !DIExpression(), !3274)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3313
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3313
    #dbg_value(i64 %19, !3314, !DIExpression(), !3274)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3315
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3315
    #dbg_value(i64 %20, !3316, !DIExpression(), !3274)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3317
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3317
    #dbg_value(i64 %21, !3318, !DIExpression(), !3274)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3319
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3319
    #dbg_value(i64 %22, !3320, !DIExpression(), !3274)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3321
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3321
    #dbg_value(i64 %23, !3322, !DIExpression(), !3274)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3323
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3323
    #dbg_value(i64 %24, !3324, !DIExpression(), !3274)
    #dbg_value(i32 0, !3325, !DIExpression(), !3274)
  br label %for.cond, !dbg !3326

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3274
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3274
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3274
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3274
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3274
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3274
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3274
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3274
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3274
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3274
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3274
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3274
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3274
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3274
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3274
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3274
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3274
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3274
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3274
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3274
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3274
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3274
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3274
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3274
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3328
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3274
    #dbg_value(i64 %Asu.0, !3324, !DIExpression(), !3274)
    #dbg_value(i32 %round.0, !3325, !DIExpression(), !3274)
    #dbg_value(i64 %Aba.0, !3276, !DIExpression(), !3274)
    #dbg_value(i64 %Abe.0, !3278, !DIExpression(), !3274)
    #dbg_value(i64 %Abi.0, !3280, !DIExpression(), !3274)
    #dbg_value(i64 %Abo.0, !3282, !DIExpression(), !3274)
    #dbg_value(i64 %Abu.0, !3284, !DIExpression(), !3274)
    #dbg_value(i64 %Aga.0, !3286, !DIExpression(), !3274)
    #dbg_value(i64 %Age.0, !3288, !DIExpression(), !3274)
    #dbg_value(i64 %Agi.0, !3290, !DIExpression(), !3274)
    #dbg_value(i64 %Ago.0, !3292, !DIExpression(), !3274)
    #dbg_value(i64 %Agu.0, !3294, !DIExpression(), !3274)
    #dbg_value(i64 %Aka.0, !3296, !DIExpression(), !3274)
    #dbg_value(i64 %Ake.0, !3298, !DIExpression(), !3274)
    #dbg_value(i64 %Aki.0, !3300, !DIExpression(), !3274)
    #dbg_value(i64 %Ako.0, !3302, !DIExpression(), !3274)
    #dbg_value(i64 %Aku.0, !3304, !DIExpression(), !3274)
    #dbg_value(i64 %Ama.0, !3306, !DIExpression(), !3274)
    #dbg_value(i64 %Ame.0, !3308, !DIExpression(), !3274)
    #dbg_value(i64 %Ami.0, !3310, !DIExpression(), !3274)
    #dbg_value(i64 %Amo.0, !3312, !DIExpression(), !3274)
    #dbg_value(i64 %Amu.0, !3314, !DIExpression(), !3274)
    #dbg_value(i64 %Asa.0, !3316, !DIExpression(), !3274)
    #dbg_value(i64 %Ase.0, !3318, !DIExpression(), !3274)
    #dbg_value(i64 %Asi.0, !3320, !DIExpression(), !3274)
    #dbg_value(i64 %Aso.0, !3322, !DIExpression(), !3274)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3329
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3331

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3337, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3339, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3341, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3337, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3339, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3341, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 poison, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3367
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3369
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3370
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3371
    #dbg_value(i64 %xor35, !3334, !DIExpression(), !3274)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3372
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3373
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3374
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3375
    #dbg_value(i64 %xor43, !3336, !DIExpression(), !3274)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3376
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3377
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 %xor57, !3340, !DIExpression(), !3274)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3378
    #dbg_value(i64 %xor203, !3292, !DIExpression(), !3274)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3379
    #dbg_value(i64 %xor206, !3333, !DIExpression(), !3274)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3380
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3381
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3382
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3383
    #dbg_value(i64 %xor31, !3333, !DIExpression(), !3274)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3384
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3337, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3385
    #dbg_value(i64 %xor45, !3337, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3386
    #dbg_value(i64 %xor211, !3306, !DIExpression(), !3274)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3387
    #dbg_value(i64 %xor214, !3335, !DIExpression(), !3274)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3388
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3389
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3390
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3391
    #dbg_value(i64 %xor39, !3335, !DIExpression(), !3274)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3392
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3393
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3394
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3395
    #dbg_value(i64 %xor27, !3332, !DIExpression(), !3274)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3396
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3341, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3397
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 %xor61, !3341, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3398
    #dbg_value(i64 %xor207, !3304, !DIExpression(), !3274)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3399
    #dbg_value(i64 %xor210, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not222 = xor i64 %xor210, -1, !dbg !3400
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and223 = and i64 %xor214, %not222, !dbg !3401
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor224 = xor i64 %xor206, %and223, !dbg !3402
    #dbg_value(i64 %xor224, !3363, !DIExpression(), !3274)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3403
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3339, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3404
    #dbg_value(i64 %xor53, !3339, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3405
    #dbg_value(i64 %xor67, !3300, !DIExpression(), !3274)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3406
    #dbg_value(i64 %xor70, !3334, !DIExpression(), !3274)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3407
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3408
    #dbg_value(i64 %xor49, !3338, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3409
    #dbg_value(i64 %xor63, !3288, !DIExpression(), !3274)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3410
    #dbg_value(i64 %xor66, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not = xor i64 %xor66, -1, !dbg !3411
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and = and i64 %xor70, %not, !dbg !3412
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3413
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3413
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %26 = xor i64 %and, %25, !dbg !3414
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3415
    #dbg_value(i64 %xor62, !3276, !DIExpression(), !3274)
    #dbg_value(i64 %xor62, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor81 = xor i64 %26, %xor62, !dbg !3414
    #dbg_value(i64 %xor81, !3342, !DIExpression(), !3274)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3416
    #dbg_value(i64 %xor94, !3282, !DIExpression(), !3274)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3417
    #dbg_value(i64 %xor97, !3332, !DIExpression(), !3274)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3418
    #dbg_value(i64 %xor102, !3296, !DIExpression(), !3274)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3419
    #dbg_value(i64 %xor105, !3334, !DIExpression(), !3274)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3420
    #dbg_value(i64 %xor98, !3294, !DIExpression(), !3274)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3421
    #dbg_value(i64 %xor101, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not114 = xor i64 %xor101, -1, !dbg !3422
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and115 = and i64 %xor105, %not114, !dbg !3423
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor116 = xor i64 %xor97, %and115, !dbg !3424
    #dbg_value(i64 %xor116, !3347, !DIExpression(), !3274)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3425
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3426
    #dbg_value(i64 %xor129, !3278, !DIExpression(), !3274)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3427
    #dbg_value(i64 %xor132, !3332, !DIExpression(), !3274)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3428
    #dbg_value(i64 %xor137, !3302, !DIExpression(), !3274)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3429
    #dbg_value(i64 %xor140, !3334, !DIExpression(), !3274)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3430
    #dbg_value(i64 %xor133, !3290, !DIExpression(), !3274)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3431
    #dbg_value(i64 %xor136, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not149 = xor i64 %xor136, -1, !dbg !3432
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and150 = and i64 %xor140, %not149, !dbg !3433
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor151 = xor i64 %xor132, %and150, !dbg !3434
    #dbg_value(i64 %xor151, !3352, !DIExpression(), !3274)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3435
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3436
    #dbg_value(i64 %xor164, !3284, !DIExpression(), !3274)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3437
    #dbg_value(i64 %xor167, !3332, !DIExpression(), !3274)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3438
    #dbg_value(i64 %xor172, !3298, !DIExpression(), !3274)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3439
    #dbg_value(i64 %xor175, !3334, !DIExpression(), !3274)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3440
    #dbg_value(i64 %xor168, !3286, !DIExpression(), !3274)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3441
    #dbg_value(i64 %xor171, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not184 = xor i64 %xor171, -1, !dbg !3442
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and185 = and i64 %xor175, %not184, !dbg !3443
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor186 = xor i64 %xor167, %and185, !dbg !3444
    #dbg_value(i64 %xor186, !3357, !DIExpression(), !3274)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3445
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3446
    #dbg_value(i64 %xor199, !3280, !DIExpression(), !3274)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3447
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not219 = xor i64 %xor206, -1, !dbg !3448
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and220 = and i64 %xor210, %not219, !dbg !3449
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor221 = xor i64 %xor202, %and220, !dbg !3450
    #dbg_value(i64 %xor221, !3362, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3451
    #dbg_value(i64 %xor237, !3332, !DIExpression(), !3274)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3452
    #dbg_value(i64 %xor75, !3324, !DIExpression(), !3274)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3453
    #dbg_value(i64 %xor78, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3454
    #dbg_value(i64 %xor71, !3312, !DIExpression(), !3274)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3455
    #dbg_value(i64 %xor74, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not85 = xor i64 %xor74, -1, !dbg !3456
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and86 = and i64 %xor78, %not85, !dbg !3457
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor87 = xor i64 %xor70, %and86, !dbg !3458
    #dbg_value(i64 %xor87, !3344, !DIExpression(), !3274)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3459
    #dbg_value(i64 %xor110, !3320, !DIExpression(), !3274)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3460
    #dbg_value(i64 %xor113, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3461
    #dbg_value(i64 %xor106, !3308, !DIExpression(), !3274)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3462
    #dbg_value(i64 %xor109, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not120 = xor i64 %xor109, -1, !dbg !3463
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and121 = and i64 %xor113, %not120, !dbg !3464
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor122 = xor i64 %xor105, %and121, !dbg !3465
    #dbg_value(i64 %xor122, !3349, !DIExpression(), !3274)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3466
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3467
    #dbg_value(i64 %xor145, !3316, !DIExpression(), !3274)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3468
    #dbg_value(i64 %xor148, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3469
    #dbg_value(i64 %xor141, !3314, !DIExpression(), !3274)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3470
    #dbg_value(i64 %xor144, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not155 = xor i64 %xor144, -1, !dbg !3471
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and156 = and i64 %xor148, %not155, !dbg !3472
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor157 = xor i64 %xor140, %and156, !dbg !3473
    #dbg_value(i64 %xor157, !3354, !DIExpression(), !3274)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3474
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3475
    #dbg_value(i64 %xor180, !3322, !DIExpression(), !3274)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3476
    #dbg_value(i64 %xor183, !3336, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3477
    #dbg_value(i64 %xor176, !3310, !DIExpression(), !3274)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3478
    #dbg_value(i64 %xor179, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %not190 = xor i64 %xor179, -1, !dbg !3479
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and191 = and i64 %xor183, %not190, !dbg !3480
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor192 = xor i64 %xor175, %and191, !dbg !3481
    #dbg_value(i64 %xor192, !3359, !DIExpression(), !3274)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3482
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3483
    #dbg_value(i64 %xor215, !3318, !DIExpression(), !3274)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3484
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not225 = xor i64 %xor214, -1, !dbg !3485
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and226 = and i64 %xor218, %not225, !dbg !3486
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor227 = xor i64 %xor210, %and226, !dbg !3487
    #dbg_value(i64 %xor227, !3364, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3488
    #dbg_value(i64 %xor245, !3334, !DIExpression(), !3274)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3489
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3490
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3363, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 %xor261, !3338, !DIExpression(), !3274)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3491
    #dbg_value(i64 %xor429, !3363, !DIExpression(), !3274)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3492
    #dbg_value(i64 %xor432, !3336, !DIExpression(), !3274)
  %not123 = xor i64 %xor113, -1, !dbg !3493
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and124 = and i64 %xor97, %not123, !dbg !3494
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor125 = xor i64 %xor109, %and124, !dbg !3495
    #dbg_value(i64 %xor125, !3350, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not91 = xor i64 %xor62, -1, !dbg !3496
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and92 = and i64 %xor66, %not91, !dbg !3497
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor93 = xor i64 %xor78, %and92, !dbg !3498
    #dbg_value(i64 %xor93, !3346, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not126 = xor i64 %xor97, -1, !dbg !3499
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and127 = and i64 %xor101, %not126, !dbg !3500
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor128 = xor i64 %xor113, %and127, !dbg !3501
    #dbg_value(i64 %xor128, !3351, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3502
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not161 = xor i64 %xor132, -1, !dbg !3503
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and162 = and i64 %xor136, %not161, !dbg !3504
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor163 = xor i64 %xor148, %and162, !dbg !3505
    #dbg_value(i64 %xor163, !3356, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3506
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not196 = xor i64 %xor167, -1, !dbg !3507
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and197 = and i64 %xor171, %not196, !dbg !3508
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor198 = xor i64 %xor183, %and197, !dbg !3509
    #dbg_value(i64 %xor198, !3361, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3510
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not231 = xor i64 %xor202, -1, !dbg !3511
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %and232 = and i64 %xor206, %not231, !dbg !3512
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor233 = xor i64 %xor218, %and232, !dbg !3513
    #dbg_value(i64 %xor233, !3366, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3514
    #dbg_value(i64 %xor253, !3336, !DIExpression(), !3274)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3515
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3516
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 %xor269, !3340, !DIExpression(), !3274)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3517
    #dbg_value(i64 %xor417, !3350, !DIExpression(), !3274)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3518
    #dbg_value(i64 %xor420, !3333, !DIExpression(), !3274)
  %not82 = xor i64 %xor70, -1, !dbg !3519
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and83 = and i64 %xor74, %not82, !dbg !3520
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor84 = xor i64 %xor66, %and83, !dbg !3521
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3343, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %not117 = xor i64 %xor105, -1, !dbg !3522
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and118 = and i64 %xor109, %not117, !dbg !3523
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor119 = xor i64 %xor101, %and118, !dbg !3524
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3525
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %not152 = xor i64 %xor140, -1, !dbg !3526
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and153 = and i64 %xor144, %not152, !dbg !3527
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor154 = xor i64 %xor136, %and153, !dbg !3528
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3353, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3529
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %not187 = xor i64 %xor175, -1, !dbg !3530
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and188 = and i64 %xor179, %not187, !dbg !3531
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor189 = xor i64 %xor171, %and188, !dbg !3532
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3533
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3333, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3534
    #dbg_value(i64 %xor241, !3333, !DIExpression(), !3274)
  %not88 = xor i64 %xor78, -1, !dbg !3535
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and89 = and i64 %xor62, %not88, !dbg !3536
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor90 = xor i64 %xor74, %and89, !dbg !3537
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3345, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3538
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not158 = xor i64 %xor148, -1, !dbg !3539
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and159 = and i64 %xor132, %not158, !dbg !3540
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor160 = xor i64 %xor144, %and159, !dbg !3541
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3355, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3542
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not193 = xor i64 %xor183, -1, !dbg !3543
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and194 = and i64 %xor167, %not193, !dbg !3544
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor195 = xor i64 %xor179, %and194, !dbg !3545
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3546
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %not228 = xor i64 %xor218, -1, !dbg !3547
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and229 = and i64 %xor202, %not228, !dbg !3548
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor230 = xor i64 %xor214, %and229, !dbg !3549
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3335, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3365, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3550
    #dbg_value(i64 %xor249, !3335, !DIExpression(), !3274)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3551
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3339, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3552
    #dbg_value(i64 %xor265, !3339, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3359, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3349, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3553
    #dbg_value(i64 %xor413, !3344, !DIExpression(), !3274)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3554
    #dbg_value(i64 %xor416, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not445 = xor i64 %xor416, -1, !dbg !3555
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and446 = and i64 %xor420, %not445, !dbg !3556
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3324, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor447 = xor i64 %xor432, %and446, !dbg !3557
    #dbg_value(i64 %xor447, !3324, !DIExpression(), !3274)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3558
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3337, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3559
    #dbg_value(i64 %xor257, !3337, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3347, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3357, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3560
    #dbg_value(i64 %xor425, !3357, !DIExpression(), !3274)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3561
    #dbg_value(i64 %xor428, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not442 = xor i64 %xor432, -1, !dbg !3562
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and443 = and i64 %xor416, %not442, !dbg !3563
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3322, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor444 = xor i64 %xor428, %and443, !dbg !3564
    #dbg_value(i64 %xor444, !3322, !DIExpression(), !3274)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3565
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3341, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3566
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3351, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(i64 %xor273, !3341, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3567
    #dbg_value(i64 %xor421, !3356, !DIExpression(), !3274)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3568
    #dbg_value(i64 %xor424, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not439 = xor i64 %xor428, -1, !dbg !3569
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and440 = and i64 %xor432, %not439, !dbg !3570
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3320, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor441 = xor i64 %xor424, %and440, !dbg !3571
    #dbg_value(i64 %xor441, !3320, !DIExpression(), !3274)
  %not436 = xor i64 %xor424, -1, !dbg !3572
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and437 = and i64 %xor428, %not436, !dbg !3573
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3318, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor438 = xor i64 %xor420, %and437, !dbg !3574
    #dbg_value(i64 %xor438, !3318, !DIExpression(), !3274)
  %not433 = xor i64 %xor420, -1, !dbg !3575
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and434 = and i64 %xor424, %not433, !dbg !3576
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3316, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor435 = xor i64 %xor416, %and434, !dbg !3577
    #dbg_value(i64 %xor435, !3316, !DIExpression(), !3274)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3578
    #dbg_value(i64 %xor394, !3365, !DIExpression(), !3274)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3579
    #dbg_value(i64 %xor397, !3336, !DIExpression(), !3274)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3580
    #dbg_value(i64 %xor382, !3347, !DIExpression(), !3274)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3581
    #dbg_value(i64 %xor385, !3333, !DIExpression(), !3274)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3582
    #dbg_value(i64 %xor378, !3346, !DIExpression(), !3274)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3583
    #dbg_value(i64 %xor381, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not410 = xor i64 %xor381, -1, !dbg !3584
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and411 = and i64 %xor385, %not410, !dbg !3585
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3314, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor412 = xor i64 %xor397, %and411, !dbg !3586
    #dbg_value(i64 %xor412, !3314, !DIExpression(), !3274)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3587
    #dbg_value(i64 %xor390, !3359, !DIExpression(), !3274)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3588
    #dbg_value(i64 %xor393, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not407 = xor i64 %xor397, -1, !dbg !3589
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and408 = and i64 %xor381, %not407, !dbg !3590
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3312, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor409 = xor i64 %xor393, %and408, !dbg !3591
    #dbg_value(i64 %xor409, !3312, !DIExpression(), !3274)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3592
    #dbg_value(i64 %xor386, !3353, !DIExpression(), !3274)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3593
    #dbg_value(i64 %xor389, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not404 = xor i64 %xor393, -1, !dbg !3594
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and405 = and i64 %xor397, %not404, !dbg !3595
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3310, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor406 = xor i64 %xor389, %and405, !dbg !3596
    #dbg_value(i64 %xor406, !3310, !DIExpression(), !3274)
  %not401 = xor i64 %xor389, -1, !dbg !3597
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and402 = and i64 %xor393, %not401, !dbg !3598
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3308, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor403 = xor i64 %xor385, %and402, !dbg !3599
    #dbg_value(i64 %xor403, !3308, !DIExpression(), !3274)
  %not398 = xor i64 %xor385, -1, !dbg !3600
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and399 = and i64 %xor389, %not398, !dbg !3601
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3306, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor400 = xor i64 %xor381, %and399, !dbg !3602
    #dbg_value(i64 %xor400, !3306, !DIExpression(), !3274)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3603
    #dbg_value(i64 %xor359, !3362, !DIExpression(), !3274)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3604
    #dbg_value(i64 %xor362, !3336, !DIExpression(), !3274)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3605
    #dbg_value(i64 %xor347, !3349, !DIExpression(), !3274)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3606
    #dbg_value(i64 %xor350, !3333, !DIExpression(), !3274)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3607
    #dbg_value(i64 %xor343, !3343, !DIExpression(), !3274)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3608
    #dbg_value(i64 %xor346, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not375 = xor i64 %xor346, -1, !dbg !3609
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and376 = and i64 %xor350, %not375, !dbg !3610
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3304, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor377 = xor i64 %xor362, %and376, !dbg !3611
    #dbg_value(i64 %xor377, !3304, !DIExpression(), !3274)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3612
    #dbg_value(i64 %xor355, !3361, !DIExpression(), !3274)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3613
    #dbg_value(i64 %xor358, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not372 = xor i64 %xor362, -1, !dbg !3614
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and373 = and i64 %xor346, %not372, !dbg !3615
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3302, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor374 = xor i64 %xor358, %and373, !dbg !3616
    #dbg_value(i64 %xor374, !3302, !DIExpression(), !3274)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3617
    #dbg_value(i64 %xor351, !3355, !DIExpression(), !3274)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3618
    #dbg_value(i64 %xor354, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not369 = xor i64 %xor358, -1, !dbg !3619
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and370 = and i64 %xor362, %not369, !dbg !3620
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3300, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor371 = xor i64 %xor354, %and370, !dbg !3621
    #dbg_value(i64 %xor371, !3300, !DIExpression(), !3274)
  %not366 = xor i64 %xor354, -1, !dbg !3622
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and367 = and i64 %xor358, %not366, !dbg !3623
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3298, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor368 = xor i64 %xor350, %and367, !dbg !3624
    #dbg_value(i64 %xor368, !3298, !DIExpression(), !3274)
  %not363 = xor i64 %xor350, -1, !dbg !3625
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and364 = and i64 %xor354, %not363, !dbg !3626
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3296, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor365 = xor i64 %xor346, %and364, !dbg !3627
    #dbg_value(i64 %xor365, !3296, !DIExpression(), !3274)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3628
    #dbg_value(i64 %xor324, !3364, !DIExpression(), !3274)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3629
    #dbg_value(i64 %xor327, !3336, !DIExpression(), !3274)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3630
    #dbg_value(i64 %xor312, !3351, !DIExpression(), !3274)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3631
    #dbg_value(i64 %xor315, !3333, !DIExpression(), !3274)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3632
    #dbg_value(i64 %xor308, !3345, !DIExpression(), !3274)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3633
    #dbg_value(i64 %xor311, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not340 = xor i64 %xor311, -1, !dbg !3634
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and341 = and i64 %xor315, %not340, !dbg !3635
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3294, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor342 = xor i64 %xor327, %and341, !dbg !3636
    #dbg_value(i64 %xor342, !3294, !DIExpression(), !3274)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3637
    #dbg_value(i64 %xor320, !3358, !DIExpression(), !3274)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3638
    #dbg_value(i64 %xor323, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not337 = xor i64 %xor327, -1, !dbg !3639
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and338 = and i64 %xor311, %not337, !dbg !3640
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3292, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor339 = xor i64 %xor323, %and338, !dbg !3641
    #dbg_value(i64 %xor339, !3292, !DIExpression(), !3274)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3642
    #dbg_value(i64 %xor316, !3352, !DIExpression(), !3274)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3643
    #dbg_value(i64 %xor319, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not334 = xor i64 %xor323, -1, !dbg !3644
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and335 = and i64 %xor327, %not334, !dbg !3645
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3290, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor336 = xor i64 %xor319, %and335, !dbg !3646
    #dbg_value(i64 %xor336, !3290, !DIExpression(), !3274)
  %not331 = xor i64 %xor319, -1, !dbg !3647
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and332 = and i64 %xor323, %not331, !dbg !3648
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3288, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor333 = xor i64 %xor315, %and332, !dbg !3649
    #dbg_value(i64 %xor333, !3288, !DIExpression(), !3274)
  %not328 = xor i64 %xor315, -1, !dbg !3650
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and329 = and i64 %xor319, %not328, !dbg !3651
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3286, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor330 = xor i64 %xor311, %and329, !dbg !3652
    #dbg_value(i64 %xor330, !3286, !DIExpression(), !3274)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3653
    #dbg_value(i64 %xor287, !3366, !DIExpression(), !3274)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3654
    #dbg_value(i64 %xor290, !3336, !DIExpression(), !3274)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3655
    #dbg_value(i64 %xor275, !3348, !DIExpression(), !3274)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3656
    #dbg_value(i64 %xor278, !3333, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3657
    #dbg_value(i64 %xor274, !3342, !DIExpression(), !3274)
    #dbg_value(i64 %xor274, !3332, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not305 = xor i64 %xor274, -1, !dbg !3658
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and306 = and i64 %xor278, %not305, !dbg !3659
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3284, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor307 = xor i64 %xor290, %and306, !dbg !3660
    #dbg_value(i64 %xor307, !3284, !DIExpression(), !3274)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3661
    #dbg_value(i64 %xor283, !3360, !DIExpression(), !3274)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3662
    #dbg_value(i64 %xor286, !3335, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not302 = xor i64 %xor290, -1, !dbg !3663
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and303 = and i64 %xor274, %not302, !dbg !3664
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor304 = xor i64 %xor286, %and303, !dbg !3665
    #dbg_value(i64 %xor304, !3282, !DIExpression(), !3274)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3666
    #dbg_value(i64 %xor279, !3354, !DIExpression(), !3274)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3667
    #dbg_value(i64 %xor282, !3334, !DIExpression(), !3274)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %not299 = xor i64 %xor286, -1, !dbg !3668
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and300 = and i64 %xor290, %not299, !dbg !3669
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor301 = xor i64 %xor282, %and300, !dbg !3670
    #dbg_value(i64 %xor301, !3280, !DIExpression(), !3274)
  %not296 = xor i64 %xor282, -1, !dbg !3671
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3274)
  %and297 = and i64 %xor286, %not296, !dbg !3672
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3278, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %xor298 = xor i64 %xor278, %and297, !dbg !3673
    #dbg_value(i64 %xor298, !3278, !DIExpression(), !3274)
  %add = or disjoint i32 %round.0, 1, !dbg !3674
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3675
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3675
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %not291 = xor i64 %xor278, -1, !dbg !3676
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %and292 = and i64 %xor282, %not291, !dbg !3677
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3274)
  %28 = xor i64 %and292, %27, !dbg !3678
  %xor295 = xor i64 %28, %xor274, !dbg !3678
    #dbg_value(i64 %xor295, !3276, !DIExpression(), !3274)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3679
    #dbg_value(i32 %add448, !3325, !DIExpression(), !3274)
  br label %for.cond, !dbg !3680, !llvm.loop !3681

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3274
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3274
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3274
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3274
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3274
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3274
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3274
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3274
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3274
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3274
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3274
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3274
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3274
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3274
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3274
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3274
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3274
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3274
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3274
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3274
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3274
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3274
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3274
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3274
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3274
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3683
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3684
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3685
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3686
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3687
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3688
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3689
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3690
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3691
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3692
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3693
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3694
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3695
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3696
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3697
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3698
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3699
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3700
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3701
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3702
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3703
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3704
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3705
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3706
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3707
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3708
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3709
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3710
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3711
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3712
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3713
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3714
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3715
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3716
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3717
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3718
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3719
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3720
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3721
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3722
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3723
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3724
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3725
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3726
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3727
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3728
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3729
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3730
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3731
  ret void, !dbg !3732
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3733 {
entry:
    #dbg_value(ptr %state, !3734, !DIExpression(), !3735)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3736
  %0 = load i32, ptr %pos, align 8, !dbg !3736
    #dbg_value(ptr %state, !3737, !DIExpression(), !3741)
    #dbg_value(i32 %0, !3743, !DIExpression(), !3741)
    #dbg_value(i32 168, !3744, !DIExpression(), !3741)
    #dbg_value(i8 31, !3745, !DIExpression(), !3741)
  %rem.i = shl i32 %0, 3, !dbg !3746
  %mul.i = and i32 %rem.i, 56, !dbg !3746
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3747
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3747
  %div2.i = lshr i32 %0, 3, !dbg !3748
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3749
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3750
  %xor.i = xor i64 %1, %shl.i, !dbg !3750
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3750
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !3751
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3752
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3752
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3752
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3753
  store i32 168, ptr %pos1, align 8, !dbg !3754
  ret void, !dbg !3755
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !3756 {
entry:
    #dbg_value(ptr %out, !3757, !DIExpression(), !3758)
    #dbg_value(i32 %outlen, !3759, !DIExpression(), !3758)
    #dbg_value(ptr %state, !3760, !DIExpression(), !3758)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3761
  %0 = load i32, ptr %pos, align 8, !dbg !3761
    #dbg_value(ptr %out, !647, !DIExpression(), !3762)
    #dbg_value(i32 %outlen, !653, !DIExpression(), !3762)
    #dbg_value(ptr %state, !654, !DIExpression(), !3762)
    #dbg_value(i32 %0, !655, !DIExpression(), !3762)
    #dbg_value(i32 168, !656, !DIExpression(), !3762)
  br label %while.cond.i, !dbg !3764

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !647, !DIExpression(), !3762)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !3762)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !3762)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3764
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3764

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !3765
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3765

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3766
    #dbg_value(i32 0, !655, !DIExpression(), !3762)
  br label %if.end.i, !dbg !3767

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !3762)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !3762)
  br label %for.cond.i, !dbg !3768

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3769
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !3762)
    #dbg_value(i32 %i.0.i, !664, !DIExpression(), !3762)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !3770
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3771
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3771
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3771
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3772

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3773
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3774
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3774
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3775
  %mul.i = and i32 %rem.i, 56, !dbg !3775
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3776
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3776
  %conv.i = trunc i64 %shr.i to i8, !dbg !3774
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3762)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3777
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3778
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !3762)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3779
    #dbg_value(i32 %inc.i, !664, !DIExpression(), !3762)
  br label %for.cond.i, !dbg !3780, !llvm.loop !3781

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3769
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3783
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3784
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !3762)
    #dbg_value(i32 %i.0.i.lcssa, !655, !DIExpression(), !3762)
  br label %while.cond.i, !dbg !3764, !llvm.loop !3785

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3787
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3788
  ret void, !dbg !3789
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !308 {
entry:
    #dbg_value(ptr %state, !307, !DIExpression(), !3790)
    #dbg_value(ptr %in, !319, !DIExpression(), !3790)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !3790)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3791
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3792
  store i32 168, ptr %pos, align 8, !dbg !3793
  ret void, !dbg !3794
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !3795 {
entry:
    #dbg_value(ptr %s, !3798, !DIExpression(), !3799)
    #dbg_value(i32 %r, !3800, !DIExpression(), !3799)
    #dbg_value(ptr %in, !3801, !DIExpression(), !3799)
    #dbg_value(i32 %inlen, !3802, !DIExpression(), !3799)
    #dbg_value(i8 %p, !3803, !DIExpression(), !3799)
    #dbg_value(i32 0, !3804, !DIExpression(), !3799)
  br label %for.cond, !dbg !3805

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3807
    #dbg_value(i32 %i.0, !3804, !DIExpression(), !3799)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3808
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !3810

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !3811
  br label %while.cond, !dbg !3811

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3812
  store i64 0, ptr %arrayidx, align 8, !dbg !3813
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3814
    #dbg_value(i32 %inc, !3804, !DIExpression(), !3799)
  br label %for.cond, !dbg !3815, !llvm.loop !3816

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !3802, !DIExpression(), !3799)
    #dbg_value(ptr %in.addr.0, !3801, !DIExpression(), !3799)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !3818
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !3811

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !3819

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !3822

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !3824
    #dbg_value(i32 %i.1, !3804, !DIExpression(), !3799)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !3825
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !3819

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !3827
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3828
    #dbg_value(ptr %add.ptr, !3829, !DIExpression(), !3833)
    #dbg_value(i64 0, !3835, !DIExpression(), !3833)
    #dbg_value(i32 0, !3836, !DIExpression(), !3833)
  br label %for.cond.i, !dbg !3837

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !3839
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !3833
    #dbg_value(i64 %r.0.i, !3835, !DIExpression(), !3833)
    #dbg_value(i32 %i.0.i, !3836, !DIExpression(), !3833)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !3840
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !3842

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3833)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !3843
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !3843
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3833)
  %conv.i = zext i8 %1 to i64, !dbg !3844
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3833)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3845
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3833)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3846
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3833)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !3846
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !3833)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !3847
    #dbg_value(i64 %or.i, !3835, !DIExpression(), !3833)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3848
    #dbg_value(i32 %inc.i, !3836, !DIExpression(), !3833)
  br label %for.cond.i, !dbg !3849, !llvm.loop !3850

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !3833
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3852
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !3853
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !3853
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3853
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !3854
    #dbg_value(i32 %inc7, !3804, !DIExpression(), !3799)
  br label %for.cond2, !dbg !3855, !llvm.loop !3856

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3858
    #dbg_value(ptr %add.ptr9, !3801, !DIExpression(), !3799)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3859
    #dbg_value(i32 %sub, !3802, !DIExpression(), !3799)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3860
  br label %while.cond, !dbg !3811, !llvm.loop !3861

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !3863
    #dbg_value(i32 %i.2, !3804, !DIExpression(), !3799)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !3864
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !3822

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !3866
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !3866
  %conv = zext i8 %3 to i64, !dbg !3867
  %rem = shl i32 %i.2, 3, !dbg !3868
  %mul14 = and i32 %rem, 56, !dbg !3868
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !3869
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3869
  %div153 = lshr i32 %i.2, 3, !dbg !3870
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !3871
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !3872
  %xor17 = xor i64 %4, %shl, !dbg !3872
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !3872
  %inc19 = add i32 %i.2, 1, !dbg !3873
    #dbg_value(i32 %inc19, !3804, !DIExpression(), !3799)
  br label %for.cond10, !dbg !3874, !llvm.loop !3875

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !3863
  %conv21 = zext i8 %p to i64, !dbg !3877
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !3878
  %mul23 = and i32 %rem22, 56, !dbg !3878
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !3879
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !3879
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !3880
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !3881
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !3882
  %xor28 = xor i64 %5, %shl25, !dbg !3882
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !3882
  %sub29 = add i32 %r, -1, !dbg !3883
  %div302 = lshr i32 %sub29, 3, !dbg !3884
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !3885
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !3886
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !3886
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !3886
  ret void, !dbg !3887
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !341 {
entry:
    #dbg_value(ptr %out, !340, !DIExpression(), !3888)
    #dbg_value(i32 %nblocks, !346, !DIExpression(), !3888)
    #dbg_value(ptr %state, !347, !DIExpression(), !3888)
    #dbg_value(ptr %out, !348, !DIExpression(), !3889)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !3889)
    #dbg_value(ptr %state, !356, !DIExpression(), !3889)
    #dbg_value(i32 168, !357, !DIExpression(), !3889)
  br label %while.cond.i, !dbg !3891

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3889)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3889)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3891
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3891

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3892
    #dbg_value(i32 0, !361, !DIExpression(), !3889)
  br label %for.cond.i, !dbg !3893

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3894
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3889)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !3895
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3896

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3897
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3898
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3899
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3899
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3900)
    #dbg_value(i64 %0, !377, !DIExpression(), !3900)
    #dbg_value(i32 0, !378, !DIExpression(), !3900)
  br label %for.cond.i.i, !dbg !3902

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3903
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3900)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3904
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3905

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3906
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3907
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3907
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3908
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3909
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3910
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3911
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3900)
  br label %for.cond.i.i, !dbg !3912, !llvm.loop !3913

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3915
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3889)
  br label %for.cond.i, !dbg !3916, !llvm.loop !3917

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3919
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3889)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3920
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3889)
  br label %while.cond.i, !dbg !3891, !llvm.loop !3921

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3923
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3924 {
entry:
    #dbg_value(ptr %state, !3925, !DIExpression(), !3926)
    #dbg_value(ptr %state, !3185, !DIExpression(), !3927)
    #dbg_value(i32 0, !3191, !DIExpression(), !3927)
  br label %for.cond.i, !dbg !3929

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3930
    #dbg_value(i32 %i.0.i, !3191, !DIExpression(), !3927)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3931
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3932

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3933
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3934
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3935
    #dbg_value(i32 %inc.i, !3191, !DIExpression(), !3927)
  br label %for.cond.i, !dbg !3936, !llvm.loop !3937

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3939
  store i32 0, ptr %pos, align 8, !dbg !3940
  ret void, !dbg !3941
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3942 {
entry:
    #dbg_value(ptr %state, !3943, !DIExpression(), !3944)
    #dbg_value(ptr %in, !3945, !DIExpression(), !3944)
    #dbg_value(i32 %inlen, !3946, !DIExpression(), !3944)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3947
  %0 = load i32, ptr %pos, align 8, !dbg !3947
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3948
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3949
  store i32 %call, ptr %pos1, align 8, !dbg !3950
  ret void, !dbg !3951
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3952 {
entry:
    #dbg_value(ptr %state, !3953, !DIExpression(), !3954)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3955
  %0 = load i32, ptr %pos, align 8, !dbg !3955
    #dbg_value(ptr %state, !3737, !DIExpression(), !3956)
    #dbg_value(i32 %0, !3743, !DIExpression(), !3956)
    #dbg_value(i32 136, !3744, !DIExpression(), !3956)
    #dbg_value(i8 31, !3745, !DIExpression(), !3956)
  %rem.i = shl i32 %0, 3, !dbg !3958
  %mul.i = and i32 %rem.i, 56, !dbg !3958
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3959
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3959
  %div2.i = lshr i32 %0, 3, !dbg !3960
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3961
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3962
  %xor.i = xor i64 %1, %shl.i, !dbg !3962
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3962
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !3963
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3964
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3964
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3964
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3965
  store i32 136, ptr %pos1, align 8, !dbg !3966
  ret void, !dbg !3967
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !641 {
entry:
    #dbg_value(ptr %out, !640, !DIExpression(), !3968)
    #dbg_value(i32 %outlen, !644, !DIExpression(), !3968)
    #dbg_value(ptr %state, !645, !DIExpression(), !3968)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3969
  %0 = load i32, ptr %pos, align 8, !dbg !3969
    #dbg_value(ptr %out, !647, !DIExpression(), !3970)
    #dbg_value(i32 %outlen, !653, !DIExpression(), !3970)
    #dbg_value(ptr %state, !654, !DIExpression(), !3970)
    #dbg_value(i32 %0, !655, !DIExpression(), !3970)
    #dbg_value(i32 136, !656, !DIExpression(), !3970)
  br label %while.cond.i, !dbg !3972

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !647, !DIExpression(), !3970)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !3970)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !3970)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3972
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3972

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !3973
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3973

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3974
    #dbg_value(i32 0, !655, !DIExpression(), !3970)
  br label %if.end.i, !dbg !3975

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !3970)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !3970)
  br label %for.cond.i, !dbg !3976

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3977
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !3970)
    #dbg_value(i32 %i.0.i, !664, !DIExpression(), !3970)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !3978
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3979
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3979
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3979
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3980

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3981
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3982
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3982
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3983
  %mul.i = and i32 %rem.i, 56, !dbg !3983
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3984
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3984
  %conv.i = trunc i64 %shr.i to i8, !dbg !3982
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3970)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3985
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3986
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !3970)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3987
    #dbg_value(i32 %inc.i, !664, !DIExpression(), !3970)
  br label %for.cond.i, !dbg !3988, !llvm.loop !3989

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3977
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3991
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3992
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !3970)
    #dbg_value(i32 %i.0.i.lcssa, !655, !DIExpression(), !3970)
  br label %while.cond.i, !dbg !3972, !llvm.loop !3993

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3995
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3996
  ret void, !dbg !3997
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !579 {
entry:
    #dbg_value(ptr %state, !592, !DIExpression(), !3998)
    #dbg_value(ptr %in, !594, !DIExpression(), !3998)
    #dbg_value(i32 %inlen, !595, !DIExpression(), !3998)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3999
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4000
  store i32 136, ptr %pos, align 8, !dbg !4001
  ret void, !dbg !4002
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !600 {
entry:
    #dbg_value(ptr %out, !599, !DIExpression(), !4003)
    #dbg_value(i32 %nblocks, !603, !DIExpression(), !4003)
    #dbg_value(ptr %state, !604, !DIExpression(), !4003)
    #dbg_value(ptr %out, !348, !DIExpression(), !4004)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !4004)
    #dbg_value(ptr %state, !356, !DIExpression(), !4004)
    #dbg_value(i32 136, !357, !DIExpression(), !4004)
  br label %while.cond.i, !dbg !4006

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !4004)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !4004)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4006
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4006

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4007
    #dbg_value(i32 0, !361, !DIExpression(), !4004)
  br label %for.cond.i, !dbg !4008

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4009
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !4004)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !4010
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4011

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4012
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4013
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4014
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4014
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !4015)
    #dbg_value(i64 %0, !377, !DIExpression(), !4015)
    #dbg_value(i32 0, !378, !DIExpression(), !4015)
  br label %for.cond.i.i, !dbg !4017

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4018
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !4015)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4019
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4020

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4021
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4022
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4022
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4023
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4024
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4025
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4026
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !4015)
  br label %for.cond.i.i, !dbg !4027, !llvm.loop !4028

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4030
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !4004)
  br label %for.cond.i, !dbg !4031, !llvm.loop !4032

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4034
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !4004)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4035
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !4004)
  br label %while.cond.i, !dbg !4006, !llvm.loop !4036

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4038
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4039 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4040, !DIExpression(), !4041)
    #dbg_value(i32 %outlen, !4042, !DIExpression(), !4041)
    #dbg_value(ptr %in, !4043, !DIExpression(), !4041)
    #dbg_value(i32 %inlen, !4044, !DIExpression(), !4041)
    #dbg_declare(ptr %state, !4045, !DIExpression(), !4046)
    #dbg_value(ptr %state, !307, !DIExpression(), !4047)
    #dbg_value(ptr %in, !319, !DIExpression(), !4047)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !4047)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4049
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4050
  store i32 168, ptr %pos.i, align 8, !dbg !4051
  %div = udiv i32 %outlen, 168, !dbg !4052
    #dbg_value(i32 %div, !4053, !DIExpression(), !4041)
    #dbg_value(ptr %out, !340, !DIExpression(), !4054)
    #dbg_value(i32 %div, !346, !DIExpression(), !4054)
    #dbg_value(ptr %state, !347, !DIExpression(), !4054)
    #dbg_value(ptr %out, !348, !DIExpression(), !4056)
    #dbg_value(i32 %div, !355, !DIExpression(), !4056)
    #dbg_value(ptr %state, !356, !DIExpression(), !4056)
    #dbg_value(i32 168, !357, !DIExpression(), !4056)
  br label %while.cond.i, !dbg !4058

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !4056)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !4056)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4058
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4058

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4059
    #dbg_value(i32 0, !361, !DIExpression(), !4056)
  br label %for.cond.i, !dbg !4060

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4061
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !4056)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !4062
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4063

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4064
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4065
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4066
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4066
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !4067)
    #dbg_value(i64 %0, !377, !DIExpression(), !4067)
    #dbg_value(i32 0, !378, !DIExpression(), !4067)
  br label %for.cond.i.i, !dbg !4069

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4070
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !4067)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4071
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4072

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4073
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4074
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4074
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4075
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4076
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4077
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4078
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !4067)
  br label %for.cond.i.i, !dbg !4079, !llvm.loop !4080

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4082
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !4056)
  br label %for.cond.i, !dbg !4083, !llvm.loop !4084

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4086
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !4056)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4087
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !4056)
  br label %while.cond.i, !dbg !4058, !llvm.loop !4088

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !4090
  %sub = add i32 %mul.neg, %outlen, !dbg !4091
    #dbg_value(i32 %sub, !4042, !DIExpression(), !4041)
  %mul1 = mul nuw i32 %div, 168, !dbg !4092
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4093
    #dbg_value(ptr %add.ptr, !4040, !DIExpression(), !4041)
    #dbg_value(ptr %add.ptr, !3757, !DIExpression(), !4094)
    #dbg_value(i32 %sub, !3759, !DIExpression(), !4094)
    #dbg_value(ptr %state, !3760, !DIExpression(), !4094)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4096
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4096
    #dbg_value(ptr %add.ptr, !647, !DIExpression(), !4097)
    #dbg_value(i32 %sub, !653, !DIExpression(), !4097)
    #dbg_value(ptr %state, !654, !DIExpression(), !4097)
    #dbg_value(i32 %1, !655, !DIExpression(), !4097)
    #dbg_value(i32 168, !656, !DIExpression(), !4097)
  br label %while.cond.i2, !dbg !4099

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !647, !DIExpression(), !4097)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !4097)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !4097)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4099
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4099

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !4100
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4100

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4101
    #dbg_value(i32 0, !655, !DIExpression(), !4097)
  br label %if.end.i, !dbg !4102

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !4097)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !4097)
  br label %for.cond.i7, !dbg !4103

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4104
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !4097)
    #dbg_value(i32 %i.0.i8, !664, !DIExpression(), !4097)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !4105
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4106
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4106
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4106
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4107

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4108
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4109
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4109
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4110
  %mul.i12 = and i32 %rem.i, 56, !dbg !4110
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4111
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4111
  %conv.i = trunc i64 %shr.i to i8, !dbg !4109
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4097)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4112
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4113
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !4097)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4114
    #dbg_value(i32 %inc.i13, !664, !DIExpression(), !4097)
  br label %for.cond.i7, !dbg !4115, !llvm.loop !4116

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4104
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4118
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4119
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !4097)
    #dbg_value(i32 %i.0.i8.lcssa, !655, !DIExpression(), !4097)
  br label %while.cond.i2, !dbg !4099, !llvm.loop !4120

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4122
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4123
  ret void, !dbg !4124
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !581 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !585, !DIExpression(), !4125)
    #dbg_value(i32 %outlen, !587, !DIExpression(), !4125)
    #dbg_value(ptr %in, !588, !DIExpression(), !4125)
    #dbg_value(i32 %inlen, !589, !DIExpression(), !4125)
    #dbg_declare(ptr %state, !590, !DIExpression(), !4126)
    #dbg_value(ptr %state, !592, !DIExpression(), !4127)
    #dbg_value(ptr %in, !594, !DIExpression(), !4127)
    #dbg_value(i32 %inlen, !595, !DIExpression(), !4127)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4129
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4130
  store i32 136, ptr %pos.i, align 8, !dbg !4131
  %div = udiv i32 %outlen, 136, !dbg !4132
    #dbg_value(i32 %div, !598, !DIExpression(), !4125)
    #dbg_value(ptr %out, !599, !DIExpression(), !4133)
    #dbg_value(i32 %div, !603, !DIExpression(), !4133)
    #dbg_value(ptr %state, !604, !DIExpression(), !4133)
    #dbg_value(ptr %out, !348, !DIExpression(), !4135)
    #dbg_value(i32 %div, !355, !DIExpression(), !4135)
    #dbg_value(ptr %state, !356, !DIExpression(), !4135)
    #dbg_value(i32 136, !357, !DIExpression(), !4135)
  br label %while.cond.i, !dbg !4137

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !4135)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !4135)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4137
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4137

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4138
    #dbg_value(i32 0, !361, !DIExpression(), !4135)
  br label %for.cond.i, !dbg !4139

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4140
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !4135)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !4141
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4142

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4143
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4144
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4145
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4145
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !4146)
    #dbg_value(i64 %0, !377, !DIExpression(), !4146)
    #dbg_value(i32 0, !378, !DIExpression(), !4146)
  br label %for.cond.i.i, !dbg !4148

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4149
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !4146)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4150
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4151

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4152
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4153
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4153
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4154
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4155
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4156
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4157
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !4146)
  br label %for.cond.i.i, !dbg !4158, !llvm.loop !4159

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4161
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !4135)
  br label %for.cond.i, !dbg !4162, !llvm.loop !4163

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4165
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !4135)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4166
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !4135)
  br label %while.cond.i, !dbg !4137, !llvm.loop !4167

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !4169
  %sub = add i32 %mul.neg, %outlen, !dbg !4170
    #dbg_value(i32 %sub, !587, !DIExpression(), !4125)
  %mul1 = mul nuw i32 %div, 136, !dbg !4171
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4172
    #dbg_value(ptr %add.ptr, !585, !DIExpression(), !4125)
    #dbg_value(ptr %add.ptr, !640, !DIExpression(), !4173)
    #dbg_value(i32 %sub, !644, !DIExpression(), !4173)
    #dbg_value(ptr %state, !645, !DIExpression(), !4173)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4175
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4175
    #dbg_value(ptr %add.ptr, !647, !DIExpression(), !4176)
    #dbg_value(i32 %sub, !653, !DIExpression(), !4176)
    #dbg_value(ptr %state, !654, !DIExpression(), !4176)
    #dbg_value(i32 %1, !655, !DIExpression(), !4176)
    #dbg_value(i32 136, !656, !DIExpression(), !4176)
  br label %while.cond.i2, !dbg !4178

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !647, !DIExpression(), !4176)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !4176)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !4176)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4178
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4178

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4179
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4179

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4180
    #dbg_value(i32 0, !655, !DIExpression(), !4176)
  br label %if.end.i, !dbg !4181

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !4176)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !4176)
  br label %for.cond.i7, !dbg !4182

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4183
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !4176)
    #dbg_value(i32 %i.0.i8, !664, !DIExpression(), !4176)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !4184
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4185
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4185
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4185
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4186

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4187
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4188
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4188
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4189
  %mul.i12 = and i32 %rem.i, 56, !dbg !4189
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4190
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4190
  %conv.i = trunc i64 %shr.i to i8, !dbg !4188
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4176)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4191
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4192
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !4176)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4193
    #dbg_value(i32 %inc.i13, !664, !DIExpression(), !4176)
  br label %for.cond.i7, !dbg !4194, !llvm.loop !4195

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4183
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4197
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4198
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !4176)
    #dbg_value(i32 %i.0.i8.lcssa, !655, !DIExpression(), !4176)
  br label %while.cond.i2, !dbg !4178, !llvm.loop !4199

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4201
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4202
  ret void, !dbg !4203
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4204 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4207, !DIExpression(), !4208)
    #dbg_value(ptr %in, !4209, !DIExpression(), !4208)
    #dbg_value(i32 %inlen, !4210, !DIExpression(), !4208)
    #dbg_declare(ptr %s, !4211, !DIExpression(), !4212)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4213
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4214
    #dbg_value(i32 0, !4215, !DIExpression(), !4208)
  br label %for.cond, !dbg !4216

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4218
    #dbg_value(i32 %i.0, !4215, !DIExpression(), !4208)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4219
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4221

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4222
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4223
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4224
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4224
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4225)
    #dbg_value(i64 %0, !377, !DIExpression(), !4225)
    #dbg_value(i32 0, !378, !DIExpression(), !4225)
  br label %for.cond.i, !dbg !4227

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4228
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4225)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4229
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4230

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4231
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4232
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4232
  %conv.i = trunc i64 %shr.i to i8, !dbg !4233
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4234
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4235
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4236
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4225)
  br label %for.cond.i, !dbg !4237, !llvm.loop !4238

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4240
    #dbg_value(i32 %inc, !4215, !DIExpression(), !4208)
  br label %for.cond, !dbg !4241, !llvm.loop !4242

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4244
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4245 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4246, !DIExpression(), !4247)
    #dbg_value(ptr %in, !4248, !DIExpression(), !4247)
    #dbg_value(i32 %inlen, !4249, !DIExpression(), !4247)
    #dbg_declare(ptr %s, !4250, !DIExpression(), !4251)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4252
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4253
    #dbg_value(i32 0, !4254, !DIExpression(), !4247)
  br label %for.cond, !dbg !4255

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4257
    #dbg_value(i32 %i.0, !4254, !DIExpression(), !4247)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4258
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4260

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4261
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4262
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4263
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4263
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4264)
    #dbg_value(i64 %0, !377, !DIExpression(), !4264)
    #dbg_value(i32 0, !378, !DIExpression(), !4264)
  br label %for.cond.i, !dbg !4266

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4267
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4264)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4268
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4269

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4270
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4271
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4271
  %conv.i = trunc i64 %shr.i to i8, !dbg !4272
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4273
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4274
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4275
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4264)
  br label %for.cond.i, !dbg !4276, !llvm.loop !4277

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4279
    #dbg_value(i32 %inc, !4254, !DIExpression(), !4247)
  br label %for.cond, !dbg !4280, !llvm.loop !4281

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4283
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !282 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !293, !DIExpression(), !4284)
    #dbg_value(ptr %seed, !295, !DIExpression(), !4284)
    #dbg_value(i8 %x, !296, !DIExpression(), !4284)
    #dbg_value(i8 %y, !297, !DIExpression(), !4284)
    #dbg_declare(ptr %extseed, !298, !DIExpression(), !4285)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4286
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4287
  store i8 %x, ptr %arrayidx, align 1, !dbg !4288
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4289
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4290
    #dbg_value(ptr %state, !307, !DIExpression(), !4291)
    #dbg_value(ptr %extseed, !319, !DIExpression(), !4291)
    #dbg_value(i32 34, !320, !DIExpression(), !4291)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4293
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4294
  store i32 168, ptr %pos.i, align 8, !dbg !4295
  ret void, !dbg !4296
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !562 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !566, !DIExpression(), !4297)
    #dbg_value(i32 %outlen, !568, !DIExpression(), !4297)
    #dbg_value(ptr %key, !569, !DIExpression(), !4297)
    #dbg_value(i8 %nonce, !570, !DIExpression(), !4297)
    #dbg_declare(ptr %extkey, !571, !DIExpression(), !4298)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4299
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4300
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4301
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4302
  ret void, !dbg !4303
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4304 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4305, !DIExpression(), !4306)
    #dbg_value(ptr %key, !4307, !DIExpression(), !4306)
    #dbg_value(ptr %input, !4308, !DIExpression(), !4306)
    #dbg_declare(ptr %s, !4309, !DIExpression(), !4310)
    #dbg_value(ptr %s, !3925, !DIExpression(), !4311)
    #dbg_value(ptr %s, !3185, !DIExpression(), !4313)
    #dbg_value(i32 0, !3191, !DIExpression(), !4313)
  br label %for.cond.i, !dbg !4315

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4316
    #dbg_value(i32 %i.0.i, !3191, !DIExpression(), !4313)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4317
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4318

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4319
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4320
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4321
    #dbg_value(i32 %inc.i, !3191, !DIExpression(), !4313)
  br label %for.cond.i, !dbg !4322, !llvm.loop !4323

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4325
  store i32 0, ptr %pos.i, align 8, !dbg !4326
    #dbg_value(ptr %s, !3943, !DIExpression(), !4327)
    #dbg_value(ptr %key, !3945, !DIExpression(), !4327)
    #dbg_value(i32 32, !3946, !DIExpression(), !4327)
  %call.i6 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4329
  %pos1.i7 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4330
  store i32 %call.i6, ptr %pos1.i7, align 8, !dbg !4331
    #dbg_value(ptr %s, !3943, !DIExpression(), !4332)
    #dbg_value(ptr %input, !3945, !DIExpression(), !4332)
    #dbg_value(i32 768, !3946, !DIExpression(), !4332)
  %call.i3 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i6, i32 noundef 136, ptr noundef %input, i32 noundef 768) #4, !dbg !4334
  %pos1.i4 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4335
  store i32 %call.i3, ptr %pos1.i4, align 8, !dbg !4336
    #dbg_value(ptr %s, !3953, !DIExpression(), !4337)
    #dbg_value(ptr %s, !3737, !DIExpression(), !4339)
    #dbg_value(i32 %call.i3, !3743, !DIExpression(), !4339)
    #dbg_value(i32 136, !3744, !DIExpression(), !4339)
    #dbg_value(i8 31, !3745, !DIExpression(), !4339)
  %rem.i = shl i32 %call.i3, 3, !dbg !4341
  %mul.i = and i32 %rem.i, 56, !dbg !4341
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4342
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4342
  %div2.i = lshr i32 %call.i3, 3, !dbg !4343
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4344
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4345
  %xor.i = xor i64 %0, %shl.i, !dbg !4345
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4345
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4346
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4347
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4347
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4347
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4348
  store i32 136, ptr %pos1.i9, align 8, !dbg !4349
    #dbg_value(ptr %out, !640, !DIExpression(), !4350)
    #dbg_value(i32 32, !644, !DIExpression(), !4350)
    #dbg_value(ptr %s, !645, !DIExpression(), !4350)
    #dbg_value(ptr %out, !647, !DIExpression(), !4352)
    #dbg_value(i32 32, !653, !DIExpression(), !4352)
    #dbg_value(ptr %s, !654, !DIExpression(), !4352)
    #dbg_value(i32 136, !655, !DIExpression(), !4352)
    #dbg_value(i32 136, !656, !DIExpression(), !4352)
  br label %while.cond.i, !dbg !4354

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !647, !DIExpression(), !4352)
    #dbg_value(i32 %outlen.addr.0.i, !653, !DIExpression(), !4352)
    #dbg_value(i32 %pos.addr.0.i, !655, !DIExpression(), !4352)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4354
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4354

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4355
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4355

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4356
    #dbg_value(i32 0, !655, !DIExpression(), !4352)
  br label %if.end.i, !dbg !4357

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !655, !DIExpression(), !4352)
    #dbg_value(i32 %pos.addr.1.i, !664, !DIExpression(), !4352)
  br label %for.cond.i12, !dbg !4358

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4359
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(), !4352)
    #dbg_value(i32 %i.0.i13, !664, !DIExpression(), !4352)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4360
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4361
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4361
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4361
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4362

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4363
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4364
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4364
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4365
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4365
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4366
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4366
  %conv.i = trunc i64 %shr.i to i8, !dbg !4364
    #dbg_value(ptr %out.addr.1.i, !647, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4352)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4367
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4368
    #dbg_value(ptr %incdec.ptr.i, !647, !DIExpression(), !4352)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4369
    #dbg_value(i32 %inc.i19, !664, !DIExpression(), !4352)
  br label %for.cond.i12, !dbg !4370, !llvm.loop !4371

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4359
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4373
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4374
    #dbg_value(i32 %sub3.i, !653, !DIExpression(), !4352)
    #dbg_value(i32 %i.0.i13.lcssa, !655, !DIExpression(), !4352)
  br label %while.cond.i, !dbg !4354, !llvm.loop !4375

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4377
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4378
  ret void, !dbg !4379
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nobuiltin "no-builtins" }
attributes #5 = { nobuiltin nounwind "no-builtins" }
attributes #6 = { nounwind memory(none) }

!llvm.dbg.cu = !{!32, !33, !38, !43, !2, !45, !47, !49, !21, !50}
!llvm.ident = !{!51, !51, !51, !51, !51, !51, !51, !51, !51, !51}
!llvm.module.flags = !{!52, !53, !54, !55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!0}
!11 = !DIFile(filename: "../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !17)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !6, line: 32, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !8, line: 55, baseType: !16)
!16 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DISubrange(count: 128)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !21, file: !27, line: 48, type: !28, isLocal: true, isDefinition: true)
!21 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !22, globals: !26, splitDebugInlining: false, nameTableKind: None)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 60, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !8, line: 105, baseType: !25)
!25 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!26 = !{!19}
!27 = !DIFile(filename: "../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1536, elements: !30)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!30 = !{!31}
!31 = !DISubrange(count: 24)
!32 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!33 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !34, splitDebugInlining: false, nameTableKind: None)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !6, line: 36, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !8, line: 57, baseType: !37)
!37 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!38 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !39, splitDebugInlining: false, nameTableKind: None)
!39 = !{!14, !35, !40}
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !6, line: 48, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !8, line: 79, baseType: !42)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, splitDebugInlining: false, nameTableKind: None)
!44 = !{!35, !14, !5}
!45 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !46, splitDebugInlining: false, nameTableKind: None)
!46 = !{!40}
!47 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !48, splitDebugInlining: false, nameTableKind: None)
!48 = !{!14, !5}
!49 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !22, splitDebugInlining: false, nameTableKind: None)
!50 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!51 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!52 = !{i32 2, !"Debug Info Version", i32 3}
!53 = !{i32 1, !"wchar_size", i32 4}
!54 = !{i32 1, !"min_enum_size", i32 4}
!55 = !{i32 1, !"Code Model", i32 1}
!56 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !57, file: !57, line: 25, type: !58, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!57 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !60, !60, !64}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !63)
!63 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!66 = !{}
!67 = !DILocalVariable(name: "pk", arg: 1, scope: !56, file: !57, line: 25, type: !60)
!68 = !DILocation(line: 0, scope: !56)
!69 = !DILocalVariable(name: "sk", arg: 2, scope: !56, file: !57, line: 26, type: !60)
!70 = !DILocalVariable(name: "coins", arg: 3, scope: !56, file: !57, line: 27, type: !64)
!71 = !DILocation(line: 29, column: 3, scope: !56)
!72 = !DILocation(line: 30, column: 12, scope: !56)
!73 = !DILocation(line: 30, column: 3, scope: !56)
!74 = !DILocation(line: 31, column: 3, scope: !56)
!75 = !DILocation(line: 33, column: 33, scope: !56)
!76 = !DILocation(line: 33, column: 55, scope: !56)
!77 = !DILocation(line: 33, column: 3, scope: !56)
!78 = !DILocation(line: 34, column: 3, scope: !56)
!79 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !57, file: !57, line: 50, type: !80, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!80 = !DISubroutineType(types: !81)
!81 = !{!9, !60, !60}
!82 = !DILocalVariable(name: "pk", arg: 1, scope: !79, file: !57, line: 50, type: !60)
!83 = !DILocation(line: 0, scope: !79)
!84 = !DILocalVariable(name: "sk", arg: 2, scope: !79, file: !57, line: 51, type: !60)
!85 = !DILocalVariable(name: "coins", scope: !79, file: !57, line: 53, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 512, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 64)
!89 = !DILocation(line: 53, column: 11, scope: !79)
!90 = !DILocation(line: 54, column: 3, scope: !79)
!91 = !DILocation(line: 0, scope: !56, inlinedAt: !92)
!92 = distinct !DILocation(line: 55, column: 3, scope: !79)
!93 = !DILocation(line: 29, column: 3, scope: !56, inlinedAt: !92)
!94 = !DILocation(line: 30, column: 12, scope: !56, inlinedAt: !92)
!95 = !DILocation(line: 30, column: 3, scope: !56, inlinedAt: !92)
!96 = !DILocation(line: 31, column: 3, scope: !56, inlinedAt: !92)
!97 = !DILocation(line: 33, column: 33, scope: !56, inlinedAt: !92)
!98 = !DILocation(line: 33, column: 55, scope: !56, inlinedAt: !92)
!99 = !DILocation(line: 33, column: 3, scope: !56, inlinedAt: !92)
!100 = !DILocation(line: 56, column: 3, scope: !79)
!101 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !57, file: !57, line: 76, type: !102, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!102 = !DISubroutineType(types: !103)
!103 = !{!9, !60, !60, !64, !64}
!104 = !DILocalVariable(name: "ct", arg: 1, scope: !101, file: !57, line: 76, type: !60)
!105 = !DILocation(line: 0, scope: !101)
!106 = !DILocalVariable(name: "ss", arg: 2, scope: !101, file: !57, line: 77, type: !60)
!107 = !DILocalVariable(name: "pk", arg: 3, scope: !101, file: !57, line: 78, type: !64)
!108 = !DILocalVariable(name: "coins", arg: 4, scope: !101, file: !57, line: 79, type: !64)
!109 = !DILocalVariable(name: "buf", scope: !101, file: !57, line: 81, type: !86)
!110 = !DILocation(line: 81, column: 11, scope: !101)
!111 = !DILocalVariable(name: "kr", scope: !101, file: !57, line: 83, type: !86)
!112 = !DILocation(line: 83, column: 11, scope: !101)
!113 = !DILocation(line: 85, column: 3, scope: !101)
!114 = !DILocation(line: 88, column: 3, scope: !101)
!115 = !DILocation(line: 89, column: 3, scope: !101)
!116 = !DILocation(line: 92, column: 29, scope: !101)
!117 = !DILocation(line: 92, column: 3, scope: !101)
!118 = !DILocation(line: 94, column: 3, scope: !101)
!119 = !DILocation(line: 95, column: 3, scope: !101)
!120 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!121 = !DILocalVariable(name: "ct", arg: 1, scope: !120, file: !57, line: 113, type: !60)
!122 = !DILocation(line: 0, scope: !120)
!123 = !DILocalVariable(name: "ss", arg: 2, scope: !120, file: !57, line: 114, type: !60)
!124 = !DILocalVariable(name: "pk", arg: 3, scope: !120, file: !57, line: 115, type: !64)
!125 = !DILocalVariable(name: "coins", scope: !120, file: !57, line: 117, type: !126)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 256, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 32)
!129 = !DILocation(line: 117, column: 11, scope: !120)
!130 = !DILocation(line: 118, column: 3, scope: !120)
!131 = !DILocation(line: 119, column: 3, scope: !120)
!132 = !DILocation(line: 120, column: 3, scope: !120)
!133 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !57, file: !57, line: 140, type: !134, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!134 = !DISubroutineType(types: !135)
!135 = !{!9, !60, !64, !64}
!136 = !DILocalVariable(name: "ss", arg: 1, scope: !133, file: !57, line: 140, type: !60)
!137 = !DILocation(line: 0, scope: !133)
!138 = !DILocalVariable(name: "ct", arg: 2, scope: !133, file: !57, line: 141, type: !64)
!139 = !DILocalVariable(name: "sk", arg: 3, scope: !133, file: !57, line: 142, type: !64)
!140 = !DILocalVariable(name: "buf", scope: !133, file: !57, line: 145, type: !86)
!141 = !DILocation(line: 145, column: 11, scope: !133)
!142 = !DILocalVariable(name: "kr", scope: !133, file: !57, line: 147, type: !86)
!143 = !DILocation(line: 147, column: 11, scope: !133)
!144 = !DILocalVariable(name: "cmp", scope: !133, file: !57, line: 149, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 6144, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 768)
!148 = !DILocation(line: 149, column: 11, scope: !133)
!149 = !DILocation(line: 150, column: 25, scope: !133)
!150 = !DILocalVariable(name: "pk", scope: !133, file: !57, line: 150, type: !64)
!151 = !DILocation(line: 152, column: 3, scope: !133)
!152 = !DILocation(line: 155, column: 13, scope: !133)
!153 = !DILocation(line: 155, column: 53, scope: !133)
!154 = !DILocation(line: 155, column: 3, scope: !133)
!155 = !DILocation(line: 156, column: 3, scope: !133)
!156 = !DILocation(line: 159, column: 30, scope: !133)
!157 = !DILocation(line: 159, column: 3, scope: !133)
!158 = !DILocalVariable(name: "a", arg: 1, scope: !159, file: !160, line: 16, type: !64)
!159 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !160, file: !160, line: 16, type: !161, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!160 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!161 = !DISubroutineType(types: !162)
!162 = !{!9, !64, !64, !163}
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !164, line: 214, baseType: !42)
!164 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!165 = !DILocation(line: 0, scope: !159, inlinedAt: !166)
!166 = distinct !DILocation(line: 161, column: 10, scope: !133)
!167 = !DILocalVariable(name: "b", arg: 2, scope: !159, file: !160, line: 16, type: !64)
!168 = !DILocalVariable(name: "len", arg: 3, scope: !159, file: !160, line: 16, type: !163)
!169 = !DILocalVariable(name: "r", scope: !159, file: !160, line: 19, type: !61)
!170 = !DILocalVariable(name: "i", scope: !159, file: !160, line: 18, type: !163)
!171 = !DILocation(line: 21, column: 7, scope: !172, inlinedAt: !166)
!172 = distinct !DILexicalBlock(scope: !159, file: !160, line: 21, column: 3)
!173 = !DILocation(line: 21, scope: !172, inlinedAt: !166)
!174 = !DILocation(line: 21, column: 12, scope: !175, inlinedAt: !166)
!175 = distinct !DILexicalBlock(scope: !172, file: !160, line: 21, column: 3)
!176 = !DILocation(line: 21, column: 3, scope: !172, inlinedAt: !166)
!177 = !DILocation(line: 22, column: 10, scope: !175, inlinedAt: !166)
!178 = !DILocation(line: 22, column: 17, scope: !175, inlinedAt: !166)
!179 = !DILocation(line: 22, column: 15, scope: !175, inlinedAt: !166)
!180 = !DILocation(line: 22, column: 7, scope: !175, inlinedAt: !166)
!181 = !DILocation(line: 21, column: 18, scope: !175, inlinedAt: !166)
!182 = !DILocation(line: 21, column: 3, scope: !175, inlinedAt: !166)
!183 = distinct !{!183, !176, !184, !185}
!184 = !DILocation(line: 22, column: 20, scope: !172, inlinedAt: !166)
!185 = !{!"llvm.loop.mustprogress"}
!186 = !DILocation(line: 24, column: 25, scope: !159, inlinedAt: !166)
!187 = !DILocalVariable(name: "fail", scope: !133, file: !57, line: 144, type: !9)
!188 = !DILocation(line: 164, column: 3, scope: !133)
!189 = !DILocation(line: 167, column: 29, scope: !133)
!190 = !DILocalVariable(name: "r", arg: 1, scope: !191, file: !160, line: 40, type: !60)
!191 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !160, file: !160, line: 40, type: !192, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!192 = !DISubroutineType(types: !193)
!193 = !{null, !60, !64, !163, !61}
!194 = !DILocation(line: 0, scope: !191, inlinedAt: !195)
!195 = distinct !DILocation(line: 167, column: 3, scope: !133)
!196 = !DILocalVariable(name: "x", arg: 2, scope: !191, file: !160, line: 40, type: !64)
!197 = !DILocalVariable(name: "len", arg: 3, scope: !191, file: !160, line: 40, type: !163)
!198 = !DILocalVariable(name: "b", arg: 4, scope: !191, file: !160, line: 40, type: !61)
!199 = !DILocation(line: 51, column: 3, scope: !191, inlinedAt: !195)
!200 = !{i64 1722}
!201 = !DILocation(line: 54, column: 7, scope: !191, inlinedAt: !195)
!202 = !DILocalVariable(name: "i", scope: !191, file: !160, line: 42, type: !163)
!203 = !DILocation(line: 55, column: 7, scope: !204, inlinedAt: !195)
!204 = distinct !DILexicalBlock(scope: !191, file: !160, line: 55, column: 3)
!205 = !DILocation(line: 55, scope: !204, inlinedAt: !195)
!206 = !DILocation(line: 55, column: 12, scope: !207, inlinedAt: !195)
!207 = distinct !DILexicalBlock(scope: !204, file: !160, line: 55, column: 3)
!208 = !DILocation(line: 55, column: 3, scope: !204, inlinedAt: !195)
!209 = !DILocation(line: 56, column: 18, scope: !207, inlinedAt: !195)
!210 = !DILocation(line: 56, column: 25, scope: !207, inlinedAt: !195)
!211 = !DILocation(line: 56, column: 23, scope: !207, inlinedAt: !195)
!212 = !DILocation(line: 56, column: 15, scope: !207, inlinedAt: !195)
!213 = !DILocation(line: 56, column: 5, scope: !207, inlinedAt: !195)
!214 = !DILocation(line: 56, column: 10, scope: !207, inlinedAt: !195)
!215 = !DILocation(line: 55, column: 18, scope: !207, inlinedAt: !195)
!216 = !DILocation(line: 55, column: 3, scope: !207, inlinedAt: !195)
!217 = distinct !{!217, !208, !218, !185}
!218 = !DILocation(line: 56, column: 29, scope: !204, inlinedAt: !195)
!219 = !DILocation(line: 169, column: 3, scope: !133)
!220 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !221, file: !221, line: 165, type: !222, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!221 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!222 = !DISubroutineType(types: !223)
!223 = !{null, !224, !64, !9}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !227)
!226 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 8192, elements: !228)
!228 = !{!229}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !227, file: !226, line: 9, baseType: !230, size: 8192)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !231, size: 8192, elements: !239)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !233)
!232 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !234)
!234 = !{!235}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !233, file: !232, line: 12, baseType: !236, size: 4096)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 256)
!239 = !{!240}
!240 = !DISubrange(count: 2)
!241 = !DILocalVariable(name: "a", arg: 1, scope: !220, file: !221, line: 165, type: !224)
!242 = !DILocation(line: 0, scope: !220)
!243 = !DILocalVariable(name: "seed", arg: 2, scope: !220, file: !221, line: 165, type: !64)
!244 = !DILocalVariable(name: "transposed", arg: 3, scope: !220, file: !221, line: 165, type: !9)
!245 = !DILocalVariable(name: "buf", scope: !220, file: !221, line: 169, type: !246)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4032, elements: !247)
!247 = !{!248}
!248 = !DISubrange(count: 504)
!249 = !DILocation(line: 169, column: 11, scope: !220)
!250 = !DILocalVariable(name: "state", scope: !220, file: !221, line: 170, type: !251)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !252, line: 10, baseType: !253)
!252 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !254, line: 17, baseType: !255)
!254 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!255 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !254, line: 14, size: 1664, elements: !256)
!256 = !{!257, !261}
!257 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !255, file: !254, line: 15, baseType: !258, size: 1600)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 25)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !255, file: !254, line: 16, baseType: !42, size: 32, offset: 1600)
!262 = !DILocation(line: 170, column: 13, scope: !220)
!263 = !DILocalVariable(name: "i", scope: !220, file: !221, line: 167, type: !42)
!264 = !DILocation(line: 172, column: 7, scope: !265)
!265 = distinct !DILexicalBlock(scope: !220, file: !221, line: 172, column: 3)
!266 = !DILocation(line: 172, scope: !265)
!267 = !DILocation(line: 172, column: 12, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !221, line: 172, column: 3)
!269 = !DILocation(line: 172, column: 3, scope: !265)
!270 = !DILocation(line: 173, column: 5, scope: !271)
!271 = distinct !DILexicalBlock(scope: !272, file: !221, line: 173, column: 5)
!272 = distinct !DILexicalBlock(scope: !268, file: !221, line: 172, column: 26)
!273 = !DILocation(line: 173, scope: !271)
!274 = !DILocalVariable(name: "j", scope: !220, file: !221, line: 167, type: !42)
!275 = !DILocation(line: 173, column: 14, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !221, line: 173, column: 5)
!277 = !DILocation(line: 174, column: 10, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !221, line: 174, column: 10)
!279 = distinct !DILexicalBlock(scope: !276, file: !221, line: 173, column: 28)
!280 = !DILocation(line: 175, column: 9, scope: !278)
!281 = !DILocation(line: 25, column: 3, scope: !282, inlinedAt: !292)
!282 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !283, file: !283, line: 18, type: !284, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!283 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!284 = !DISubroutineType(types: !285)
!285 = !{null, !286, !64, !61, !61}
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 32)
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !254, line: 17, baseType: !288)
!288 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !254, line: 14, size: 1664, elements: !289)
!289 = !{!290, !291}
!290 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !288, file: !254, line: 15, baseType: !258, size: 1600)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !288, file: !254, line: 16, baseType: !42, size: 32, offset: 1600)
!292 = distinct !DILocation(line: 175, column: 9, scope: !278)
!293 = !DILocalVariable(name: "state", arg: 1, scope: !282, file: !283, line: 18, type: !286)
!294 = !DILocation(line: 0, scope: !282, inlinedAt: !292)
!295 = !DILocalVariable(name: "seed", arg: 2, scope: !282, file: !283, line: 19, type: !64)
!296 = !DILocalVariable(name: "x", arg: 3, scope: !282, file: !283, line: 20, type: !61)
!297 = !DILocalVariable(name: "y", arg: 4, scope: !282, file: !283, line: 21, type: !61)
!298 = !DILocalVariable(name: "extseed", scope: !282, file: !283, line: 23, type: !299)
!299 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !300)
!300 = !{!301}
!301 = !DISubrange(count: 34)
!302 = !DILocation(line: 23, column: 11, scope: !282, inlinedAt: !292)
!303 = !DILocation(line: 26, column: 3, scope: !282, inlinedAt: !292)
!304 = !DILocation(line: 26, column: 29, scope: !282, inlinedAt: !292)
!305 = !DILocation(line: 27, column: 3, scope: !282, inlinedAt: !292)
!306 = !DILocation(line: 27, column: 29, scope: !282, inlinedAt: !292)
!307 = !DILocalVariable(name: "state", arg: 1, scope: !308, file: !27, line: 580, type: !311)
!308 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !309, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !311, !64, !163}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 32)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !254, line: 17, baseType: !313)
!313 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !254, line: 14, size: 1664, elements: !314)
!314 = !{!315, !316}
!315 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !313, file: !254, line: 15, baseType: !258, size: 1600)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !313, file: !254, line: 16, baseType: !42, size: 32, offset: 1600)
!317 = !DILocation(line: 0, scope: !308, inlinedAt: !318)
!318 = distinct !DILocation(line: 29, column: 3, scope: !282, inlinedAt: !292)
!319 = !DILocalVariable(name: "in", arg: 2, scope: !308, file: !27, line: 580, type: !64)
!320 = !DILocalVariable(name: "inlen", arg: 3, scope: !308, file: !27, line: 580, type: !163)
!321 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !318)
!322 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !318)
!323 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !318)
!324 = !DILocation(line: 30, column: 1, scope: !282, inlinedAt: !292)
!325 = !DILocation(line: 177, column: 9, scope: !278)
!326 = !DILocation(line: 25, column: 3, scope: !282, inlinedAt: !327)
!327 = distinct !DILocation(line: 177, column: 9, scope: !278)
!328 = !DILocation(line: 0, scope: !282, inlinedAt: !327)
!329 = !DILocation(line: 23, column: 11, scope: !282, inlinedAt: !327)
!330 = !DILocation(line: 26, column: 3, scope: !282, inlinedAt: !327)
!331 = !DILocation(line: 26, column: 29, scope: !282, inlinedAt: !327)
!332 = !DILocation(line: 27, column: 3, scope: !282, inlinedAt: !327)
!333 = !DILocation(line: 27, column: 29, scope: !282, inlinedAt: !327)
!334 = !DILocation(line: 0, scope: !308, inlinedAt: !335)
!335 = distinct !DILocation(line: 29, column: 3, scope: !282, inlinedAt: !327)
!336 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !335)
!337 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !335)
!338 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !335)
!339 = !DILocation(line: 30, column: 1, scope: !282, inlinedAt: !327)
!340 = !DILocalVariable(name: "out", arg: 1, scope: !341, file: !27, line: 598, type: !60)
!341 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !342, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!342 = !DISubroutineType(types: !343)
!343 = !{null, !60, !163, !311}
!344 = !DILocation(line: 0, scope: !341, inlinedAt: !345)
!345 = distinct !DILocation(line: 179, column: 7, scope: !279)
!346 = !DILocalVariable(name: "nblocks", arg: 2, scope: !341, file: !27, line: 598, type: !163)
!347 = !DILocalVariable(name: "state", arg: 3, scope: !341, file: !27, line: 598, type: !311)
!348 = !DILocalVariable(name: "out", arg: 1, scope: !349, file: !27, line: 500, type: !60)
!349 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !350, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!350 = !DISubroutineType(types: !351)
!351 = !{null, !60, !163, !352, !42}
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!353 = !DILocation(line: 0, scope: !349, inlinedAt: !354)
!354 = distinct !DILocation(line: 600, column: 3, scope: !341, inlinedAt: !345)
!355 = !DILocalVariable(name: "nblocks", arg: 2, scope: !349, file: !27, line: 501, type: !163)
!356 = !DILocalVariable(name: "s", arg: 3, scope: !349, file: !27, line: 502, type: !352)
!357 = !DILocalVariable(name: "r", arg: 4, scope: !349, file: !27, line: 503, type: !42)
!358 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !354)
!359 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !354)
!360 = distinct !DILexicalBlock(scope: !349, file: !27, line: 507, column: 18)
!361 = !DILocalVariable(name: "i", scope: !349, file: !27, line: 505, type: !42)
!362 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !354)
!363 = distinct !DILexicalBlock(scope: !360, file: !27, line: 509, column: 5)
!364 = !DILocation(line: 509, scope: !363, inlinedAt: !354)
!365 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !354)
!366 = distinct !DILexicalBlock(scope: !363, file: !27, line: 509, column: 5)
!367 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !354)
!368 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !354)
!369 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !354)
!370 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !354)
!371 = !DILocalVariable(name: "x", arg: 1, scope: !372, file: !27, line: 40, type: !60)
!372 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !373, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !60, !23}
!375 = !DILocation(line: 0, scope: !372, inlinedAt: !376)
!376 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !354)
!377 = !DILocalVariable(name: "u", arg: 2, scope: !372, file: !27, line: 40, type: !23)
!378 = !DILocalVariable(name: "i", scope: !372, file: !27, line: 41, type: !42)
!379 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !376)
!380 = distinct !DILexicalBlock(scope: !372, file: !27, line: 43, column: 3)
!381 = !DILocation(line: 43, scope: !380, inlinedAt: !376)
!382 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !376)
!383 = distinct !DILexicalBlock(scope: !380, file: !27, line: 43, column: 3)
!384 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !376)
!385 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !376)
!386 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !376)
!387 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !376)
!388 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !376)
!389 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !376)
!390 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !376)
!391 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !376)
!392 = distinct !{!392, !384, !393, !185}
!393 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !376)
!394 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !354)
!395 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !354)
!396 = distinct !{!396, !367, !397, !185}
!397 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !354)
!398 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !354)
!399 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !354)
!400 = distinct !{!400, !358, !401, !185}
!401 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !354)
!402 = !DILocalVariable(name: "buflen", scope: !220, file: !221, line: 168, type: !42)
!403 = !DILocation(line: 181, column: 25, scope: !279)
!404 = !DILocation(line: 181, column: 13, scope: !279)
!405 = !DILocalVariable(name: "ctr", scope: !220, file: !221, line: 167, type: !42)
!406 = !DILocation(line: 183, column: 7, scope: !279)
!407 = !DILocation(line: 0, scope: !279)
!408 = !DILocation(line: 183, column: 17, scope: !279)
!409 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !410)
!410 = distinct !DILocation(line: 600, column: 3, scope: !341, inlinedAt: !411)
!411 = distinct !DILocation(line: 184, column: 9, scope: !412)
!412 = distinct !DILexicalBlock(scope: !279, file: !221, line: 183, column: 28)
!413 = !DILocation(line: 0, scope: !349, inlinedAt: !410)
!414 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !410)
!415 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !410)
!416 = !DILocation(line: 509, scope: !363, inlinedAt: !410)
!417 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !410)
!418 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !410)
!419 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !410)
!420 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !410)
!421 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !410)
!422 = !DILocation(line: 0, scope: !372, inlinedAt: !423)
!423 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !410)
!424 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !423)
!425 = !DILocation(line: 43, scope: !380, inlinedAt: !423)
!426 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !423)
!427 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !423)
!428 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !423)
!429 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !423)
!430 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !423)
!431 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !423)
!432 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !423)
!433 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !423)
!434 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !423)
!435 = distinct !{!435, !427, !436, !185}
!436 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !423)
!437 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !410)
!438 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !410)
!439 = distinct !{!439, !418, !440, !185}
!440 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !410)
!441 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !410)
!442 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !410)
!443 = distinct !{!443, !409, !444, !185}
!444 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !410)
!445 = !DILocation(line: 186, column: 28, scope: !412)
!446 = !DILocation(line: 186, column: 47, scope: !412)
!447 = !DILocation(line: 186, column: 62, scope: !412)
!448 = !DILocation(line: 186, column: 16, scope: !412)
!449 = !DILocation(line: 186, column: 13, scope: !412)
!450 = distinct !{!450, !406, !451, !185}
!451 = !DILocation(line: 187, column: 7, scope: !279)
!452 = !DILocation(line: 173, column: 24, scope: !276)
!453 = !DILocation(line: 173, column: 5, scope: !276)
!454 = distinct !{!454, !270, !455, !185}
!455 = !DILocation(line: 188, column: 5, scope: !271)
!456 = !DILocation(line: 172, column: 22, scope: !268)
!457 = !DILocation(line: 172, column: 3, scope: !268)
!458 = distinct !{!458, !269, !459, !185}
!459 = !DILocation(line: 189, column: 3, scope: !265)
!460 = !DILocation(line: 190, column: 1, scope: !220)
!461 = distinct !DISubprogram(name: "rej_uniform", scope: !221, file: !221, line: 121, type: !462, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!462 = !DISubroutineType(types: !463)
!463 = !{!42, !464, !42, !64, !42}
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!465 = !DILocalVariable(name: "r", arg: 1, scope: !461, file: !221, line: 121, type: !464)
!466 = !DILocation(line: 0, scope: !461)
!467 = !DILocalVariable(name: "len", arg: 2, scope: !461, file: !221, line: 122, type: !42)
!468 = !DILocalVariable(name: "buf", arg: 3, scope: !461, file: !221, line: 123, type: !64)
!469 = !DILocalVariable(name: "buflen", arg: 4, scope: !461, file: !221, line: 124, type: !42)
!470 = !DILocalVariable(name: "pos", scope: !461, file: !221, line: 126, type: !42)
!471 = !DILocalVariable(name: "ctr", scope: !461, file: !221, line: 126, type: !42)
!472 = !DILocation(line: 130, column: 3, scope: !461)
!473 = !DILocation(line: 130, column: 13, scope: !461)
!474 = !DILocation(line: 130, column: 19, scope: !461)
!475 = !DILocation(line: 131, column: 14, scope: !476)
!476 = distinct !DILexicalBlock(scope: !461, file: !221, line: 130, column: 41)
!477 = !DILocation(line: 131, column: 44, scope: !476)
!478 = !DILocation(line: 131, column: 34, scope: !476)
!479 = !DILocation(line: 131, column: 55, scope: !476)
!480 = !DILocation(line: 131, column: 62, scope: !476)
!481 = !DILocalVariable(name: "val0", scope: !461, file: !221, line: 127, type: !35)
!482 = !DILocation(line: 132, column: 14, scope: !476)
!483 = !DILocation(line: 132, column: 25, scope: !476)
!484 = !DILocation(line: 132, column: 44, scope: !476)
!485 = !DILocation(line: 132, column: 34, scope: !476)
!486 = !DILocation(line: 132, column: 55, scope: !476)
!487 = !DILocation(line: 132, column: 31, scope: !476)
!488 = !DILocalVariable(name: "val1", scope: !461, file: !221, line: 127, type: !35)
!489 = !DILocation(line: 133, column: 9, scope: !476)
!490 = !DILocation(line: 135, column: 13, scope: !491)
!491 = distinct !DILexicalBlock(scope: !476, file: !221, line: 135, column: 8)
!492 = !DILocation(line: 136, column: 12, scope: !491)
!493 = !DILocation(line: 136, column: 7, scope: !491)
!494 = !DILocation(line: 136, column: 16, scope: !491)
!495 = !DILocation(line: 137, column: 12, scope: !496)
!496 = distinct !DILexicalBlock(scope: !476, file: !221, line: 137, column: 8)
!497 = !DILocation(line: 137, column: 18, scope: !496)
!498 = !DILocation(line: 138, column: 12, scope: !496)
!499 = !DILocation(line: 138, column: 7, scope: !496)
!500 = !DILocation(line: 138, column: 16, scope: !496)
!501 = !DILocation(line: 0, scope: !476)
!502 = distinct !{!502, !472, !503, !185}
!503 = !DILocation(line: 139, column: 3, scope: !461)
!504 = !DILocation(line: 141, column: 3, scope: !461)
!505 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !221, file: !221, line: 205, type: !506, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!506 = !DISubroutineType(types: !507)
!507 = !{null, !60, !60, !64}
!508 = !DILocalVariable(name: "pk", arg: 1, scope: !505, file: !221, line: 205, type: !60)
!509 = !DILocation(line: 0, scope: !505)
!510 = !DILocalVariable(name: "sk", arg: 2, scope: !505, file: !221, line: 206, type: !60)
!511 = !DILocalVariable(name: "coins", arg: 3, scope: !505, file: !221, line: 207, type: !64)
!512 = !DILocalVariable(name: "buf", scope: !505, file: !221, line: 210, type: !86)
!513 = !DILocation(line: 210, column: 11, scope: !505)
!514 = !DILocalVariable(name: "publicseed", scope: !505, file: !221, line: 211, type: !64)
!515 = !DILocation(line: 212, column: 33, scope: !505)
!516 = !DILocalVariable(name: "noiseseed", scope: !505, file: !221, line: 212, type: !64)
!517 = !DILocalVariable(name: "nonce", scope: !505, file: !221, line: 213, type: !61)
!518 = !DILocalVariable(name: "a", scope: !505, file: !221, line: 214, type: !519)
!519 = !DICompositeType(tag: DW_TAG_array_type, baseType: !225, size: 16384, elements: !239)
!520 = !DILocation(line: 214, column: 11, scope: !505)
!521 = !DILocalVariable(name: "e", scope: !505, file: !221, line: 214, type: !225)
!522 = !DILocation(line: 214, column: 23, scope: !505)
!523 = !DILocalVariable(name: "pkpv", scope: !505, file: !221, line: 214, type: !225)
!524 = !DILocation(line: 214, column: 26, scope: !505)
!525 = !DILocalVariable(name: "skpv", scope: !505, file: !221, line: 214, type: !225)
!526 = !DILocation(line: 214, column: 32, scope: !505)
!527 = !DILocation(line: 216, column: 3, scope: !505)
!528 = !DILocation(line: 217, column: 3, scope: !505)
!529 = !DILocation(line: 217, column: 23, scope: !505)
!530 = !DILocation(line: 218, column: 3, scope: !505)
!531 = !DILocation(line: 220, column: 3, scope: !505)
!532 = !DILocalVariable(name: "i", scope: !505, file: !221, line: 209, type: !42)
!533 = !DILocation(line: 222, column: 7, scope: !534)
!534 = distinct !DILexicalBlock(scope: !505, file: !221, line: 222, column: 3)
!535 = !DILocation(line: 222, scope: !534)
!536 = !DILocation(line: 222, column: 12, scope: !537)
!537 = distinct !DILexicalBlock(scope: !534, file: !221, line: 222, column: 3)
!538 = !DILocation(line: 222, column: 3, scope: !534)
!539 = !DILocation(line: 224, column: 3, scope: !540)
!540 = distinct !DILexicalBlock(scope: !505, file: !221, line: 224, column: 3)
!541 = !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !551)
!542 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !543, file: !543, line: 225, type: !544, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!543 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!544 = !DISubroutineType(types: !545)
!545 = !{null, !546, !64, !61}
!546 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !547, size: 32)
!547 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !548)
!548 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !549)
!549 = !{!550}
!550 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !548, file: !232, line: 12, baseType: !236, size: 4096)
!551 = distinct !DILocation(line: 223, column: 5, scope: !537)
!552 = !DILocalVariable(name: "r", arg: 1, scope: !542, file: !543, line: 225, type: !546)
!553 = !DILocation(line: 0, scope: !542, inlinedAt: !551)
!554 = !DILocalVariable(name: "seed", arg: 2, scope: !542, file: !543, line: 225, type: !64)
!555 = !DILocalVariable(name: "nonce", arg: 3, scope: !542, file: !543, line: 225, type: !61)
!556 = !DILocalVariable(name: "buf", scope: !542, file: !543, line: 227, type: !557)
!557 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1536, elements: !558)
!558 = !{!559}
!559 = !DISubrange(count: 192)
!560 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !551)
!561 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !565)
!562 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !283, file: !283, line: 43, type: !563, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!563 = !DISubroutineType(types: !564)
!564 = !{null, !60, !163, !64, !61}
!565 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !551)
!566 = !DILocalVariable(name: "out", arg: 1, scope: !562, file: !283, line: 43, type: !60)
!567 = !DILocation(line: 0, scope: !562, inlinedAt: !565)
!568 = !DILocalVariable(name: "outlen", arg: 2, scope: !562, file: !283, line: 43, type: !163)
!569 = !DILocalVariable(name: "key", arg: 3, scope: !562, file: !283, line: 43, type: !64)
!570 = !DILocalVariable(name: "nonce", arg: 4, scope: !562, file: !283, line: 43, type: !61)
!571 = !DILocalVariable(name: "extkey", scope: !562, file: !283, line: 45, type: !572)
!572 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !573)
!573 = !{!574}
!574 = !DISubrange(count: 33)
!575 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !565)
!576 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !565)
!577 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !565)
!578 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !580)
!579 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !309, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!580 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !584)
!581 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !582, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!582 = !DISubroutineType(types: !583)
!583 = !{null, !60, !163, !64, !163}
!584 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !565)
!585 = !DILocalVariable(name: "out", arg: 1, scope: !581, file: !27, line: 723, type: !60)
!586 = !DILocation(line: 0, scope: !581, inlinedAt: !584)
!587 = !DILocalVariable(name: "outlen", arg: 2, scope: !581, file: !27, line: 723, type: !163)
!588 = !DILocalVariable(name: "in", arg: 3, scope: !581, file: !27, line: 723, type: !64)
!589 = !DILocalVariable(name: "inlen", arg: 4, scope: !581, file: !27, line: 723, type: !163)
!590 = !DILocalVariable(name: "state", scope: !581, file: !27, line: 726, type: !312)
!591 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !584)
!592 = !DILocalVariable(name: "state", arg: 1, scope: !579, file: !27, line: 667, type: !311)
!593 = !DILocation(line: 0, scope: !579, inlinedAt: !580)
!594 = !DILocalVariable(name: "in", arg: 2, scope: !579, file: !27, line: 667, type: !64)
!595 = !DILocalVariable(name: "inlen", arg: 3, scope: !579, file: !27, line: 667, type: !163)
!596 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !580)
!597 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !580)
!598 = !DILocalVariable(name: "nblocks", scope: !581, file: !27, line: 725, type: !163)
!599 = !DILocalVariable(name: "out", arg: 1, scope: !600, file: !27, line: 685, type: !60)
!600 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !342, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!601 = !DILocation(line: 0, scope: !600, inlinedAt: !602)
!602 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !584)
!603 = !DILocalVariable(name: "nblocks", arg: 2, scope: !600, file: !27, line: 685, type: !163)
!604 = !DILocalVariable(name: "state", arg: 3, scope: !600, file: !27, line: 685, type: !311)
!605 = !DILocation(line: 0, scope: !349, inlinedAt: !606)
!606 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !602)
!607 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !606)
!608 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !606)
!609 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !606)
!610 = !DILocation(line: 509, scope: !363, inlinedAt: !606)
!611 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !606)
!612 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !606)
!613 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !606)
!614 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !606)
!615 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !606)
!616 = !DILocation(line: 0, scope: !372, inlinedAt: !617)
!617 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !606)
!618 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !617)
!619 = !DILocation(line: 43, scope: !380, inlinedAt: !617)
!620 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !617)
!621 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !617)
!622 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !617)
!623 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !617)
!624 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !617)
!625 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !617)
!626 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !617)
!627 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !617)
!628 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !617)
!629 = distinct !{!629, !621, !630, !185}
!630 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !617)
!631 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !606)
!632 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !606)
!633 = distinct !{!633, !612, !634, !185}
!634 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !606)
!635 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !606)
!636 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !606)
!637 = distinct !{!637, !607, !638, !185}
!638 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !606)
!639 = !DILocation(line: 732, column: 7, scope: !581, inlinedAt: !584)
!640 = !DILocalVariable(name: "out", arg: 1, scope: !641, file: !27, line: 653, type: !60)
!641 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !342, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!642 = !DILocation(line: 0, scope: !641, inlinedAt: !643)
!643 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !584)
!644 = !DILocalVariable(name: "outlen", arg: 2, scope: !641, file: !27, line: 653, type: !163)
!645 = !DILocalVariable(name: "state", arg: 3, scope: !641, file: !27, line: 653, type: !311)
!646 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !643)
!647 = !DILocalVariable(name: "out", arg: 1, scope: !648, file: !27, line: 426, type: !60)
!648 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !649, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!649 = !DISubroutineType(types: !650)
!650 = !{!42, !60, !163, !352, !42, !42}
!651 = !DILocation(line: 0, scope: !648, inlinedAt: !652)
!652 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !643)
!653 = !DILocalVariable(name: "outlen", arg: 2, scope: !648, file: !27, line: 427, type: !163)
!654 = !DILocalVariable(name: "s", arg: 3, scope: !648, file: !27, line: 428, type: !352)
!655 = !DILocalVariable(name: "pos", arg: 4, scope: !648, file: !27, line: 429, type: !42)
!656 = !DILocalVariable(name: "r", arg: 5, scope: !648, file: !27, line: 430, type: !42)
!657 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !652)
!658 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !652)
!659 = distinct !DILexicalBlock(scope: !660, file: !27, line: 435, column: 8)
!660 = distinct !DILexicalBlock(scope: !648, file: !27, line: 434, column: 17)
!661 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !652)
!662 = distinct !DILexicalBlock(scope: !659, file: !27, line: 435, column: 18)
!663 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !652)
!664 = !DILocalVariable(name: "i", scope: !648, file: !27, line: 432, type: !42)
!665 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !652)
!666 = distinct !DILexicalBlock(scope: !660, file: !27, line: 439, column: 5)
!667 = !DILocation(line: 439, scope: !666, inlinedAt: !652)
!668 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !652)
!669 = distinct !DILexicalBlock(scope: !666, file: !27, line: 439, column: 5)
!670 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !652)
!671 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !652)
!672 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !652)
!673 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !652)
!674 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !652)
!675 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !652)
!676 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !652)
!677 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !652)
!678 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !652)
!679 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !652)
!680 = distinct !{!680, !671, !681, !185}
!681 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !652)
!682 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !652)
!683 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !652)
!684 = distinct !{!684, !657, !685, !185}
!685 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !652)
!686 = !DILocation(line: 223, column: 25, scope: !537)
!687 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !643)
!688 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !643)
!689 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !584)
!690 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !565)
!691 = !DILocalVariable(name: "r", arg: 1, scope: !692, file: !693, line: 110, type: !696)
!692 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !693, file: !693, line: 110, type: !694, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!693 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!694 = !DISubroutineType(types: !695)
!695 = !{null, !696, !64}
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !697, size: 32)
!697 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !698)
!698 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !699)
!699 = !{!700}
!700 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !698, file: !232, line: 12, baseType: !236, size: 4096)
!701 = !DILocation(line: 0, scope: !692, inlinedAt: !702)
!702 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !551)
!703 = !DILocalVariable(name: "buf", arg: 2, scope: !692, file: !693, line: 110, type: !64)
!704 = !DILocation(line: 115, column: 3, scope: !692, inlinedAt: !702)
!705 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !551)
!706 = !DILocation(line: 223, column: 54, scope: !537)
!707 = !DILocation(line: 222, column: 22, scope: !537)
!708 = !DILocation(line: 222, column: 3, scope: !537)
!709 = distinct !{!709, !538, !710, !185}
!710 = !DILocation(line: 223, column: 56, scope: !534)
!711 = !DILocation(line: 224, scope: !540)
!712 = !DILocation(line: 224, column: 12, scope: !713)
!713 = distinct !DILexicalBlock(scope: !540, file: !221, line: 224, column: 3)
!714 = !DILocation(line: 173, column: 3, scope: !715, inlinedAt: !730)
!715 = distinct !DILexicalBlock(scope: !717, file: !716, line: 173, column: 3)
!716 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!717 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !716, file: !716, line: 170, type: !718, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!718 = !DISubroutineType(types: !719)
!719 = !{null, !720}
!720 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !721, size: 32)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !722)
!722 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 8192, elements: !723)
!723 = !{!724}
!724 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !722, file: !226, line: 9, baseType: !725, size: 8192)
!725 = !DICompositeType(tag: DW_TAG_array_type, baseType: !726, size: 8192, elements: !239)
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !727)
!727 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !728)
!728 = !{!729}
!729 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !727, file: !232, line: 12, baseType: !236, size: 4096)
!730 = distinct !DILocation(line: 227, column: 3, scope: !505)
!731 = !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !732)
!732 = distinct !DILocation(line: 225, column: 5, scope: !713)
!733 = !DILocation(line: 0, scope: !542, inlinedAt: !732)
!734 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !732)
!735 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !736)
!736 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !732)
!737 = !DILocation(line: 0, scope: !562, inlinedAt: !736)
!738 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !736)
!739 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !736)
!740 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !736)
!741 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !742)
!742 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !743)
!743 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !736)
!744 = !DILocation(line: 0, scope: !581, inlinedAt: !743)
!745 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !743)
!746 = !DILocation(line: 0, scope: !579, inlinedAt: !742)
!747 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !742)
!748 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !742)
!749 = !DILocation(line: 0, scope: !600, inlinedAt: !750)
!750 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !743)
!751 = !DILocation(line: 0, scope: !349, inlinedAt: !752)
!752 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !750)
!753 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !752)
!754 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !752)
!755 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !752)
!756 = !DILocation(line: 509, scope: !363, inlinedAt: !752)
!757 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !752)
!758 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !752)
!759 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !752)
!760 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !752)
!761 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !752)
!762 = !DILocation(line: 0, scope: !372, inlinedAt: !763)
!763 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !752)
!764 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !763)
!765 = !DILocation(line: 43, scope: !380, inlinedAt: !763)
!766 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !763)
!767 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !763)
!768 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !763)
!769 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !763)
!770 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !763)
!771 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !763)
!772 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !763)
!773 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !763)
!774 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !763)
!775 = distinct !{!775, !767, !776, !185}
!776 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !763)
!777 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !752)
!778 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !752)
!779 = distinct !{!779, !758, !780, !185}
!780 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !752)
!781 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !752)
!782 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !752)
!783 = distinct !{!783, !753, !784, !185}
!784 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !752)
!785 = !DILocation(line: 732, column: 7, scope: !581, inlinedAt: !743)
!786 = !DILocation(line: 0, scope: !641, inlinedAt: !787)
!787 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !743)
!788 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !787)
!789 = !DILocation(line: 0, scope: !648, inlinedAt: !790)
!790 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !787)
!791 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !790)
!792 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !790)
!793 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !790)
!794 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !790)
!795 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !790)
!796 = !DILocation(line: 439, scope: !666, inlinedAt: !790)
!797 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !790)
!798 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !790)
!799 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !790)
!800 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !790)
!801 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !790)
!802 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !790)
!803 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !790)
!804 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !790)
!805 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !790)
!806 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !790)
!807 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !790)
!808 = distinct !{!808, !799, !809, !185}
!809 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !790)
!810 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !790)
!811 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !790)
!812 = distinct !{!812, !791, !813, !185}
!813 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !790)
!814 = !DILocation(line: 225, column: 25, scope: !713)
!815 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !787)
!816 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !787)
!817 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !743)
!818 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !736)
!819 = !DILocation(line: 0, scope: !692, inlinedAt: !820)
!820 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !732)
!821 = !DILocation(line: 115, column: 3, scope: !692, inlinedAt: !820)
!822 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !732)
!823 = !DILocation(line: 225, column: 51, scope: !713)
!824 = !DILocation(line: 224, column: 22, scope: !713)
!825 = !DILocation(line: 224, column: 3, scope: !713)
!826 = distinct !{!826, !539, !827, !185}
!827 = !DILocation(line: 225, column: 53, scope: !540)
!828 = !DILocation(line: 173, scope: !715, inlinedAt: !730)
!829 = !DILocalVariable(name: "i", scope: !717, file: !716, line: 172, type: !42)
!830 = !DILocation(line: 0, scope: !717, inlinedAt: !730)
!831 = !DILocation(line: 173, column: 12, scope: !832, inlinedAt: !730)
!832 = distinct !DILexicalBlock(scope: !715, file: !716, line: 173, column: 3)
!833 = !DILocation(line: 173, column: 3, scope: !715, inlinedAt: !834)
!834 = distinct !DILocation(line: 228, column: 3, scope: !505)
!835 = !DILocation(line: 174, column: 15, scope: !832, inlinedAt: !730)
!836 = !DILocalVariable(name: "r", arg: 1, scope: !837, file: !543, line: 261, type: !546)
!837 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !543, file: !543, line: 261, type: !838, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!838 = !DISubroutineType(types: !839)
!839 = !{null, !546}
!840 = !DILocation(line: 0, scope: !837, inlinedAt: !841)
!841 = distinct !DILocation(line: 174, column: 5, scope: !832, inlinedAt: !730)
!842 = !DILocation(line: 263, column: 3, scope: !837, inlinedAt: !841)
!843 = !DILocalVariable(name: "r", arg: 1, scope: !844, file: !543, line: 323, type: !546)
!844 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !543, file: !543, line: 323, type: !838, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!845 = !DILocation(line: 0, scope: !844, inlinedAt: !846)
!846 = distinct !DILocation(line: 264, column: 3, scope: !837, inlinedAt: !841)
!847 = !DILocalVariable(name: "i", scope: !844, file: !543, line: 325, type: !42)
!848 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !846)
!849 = distinct !DILexicalBlock(scope: !844, file: !543, line: 326, column: 3)
!850 = !DILocation(line: 326, scope: !849, inlinedAt: !846)
!851 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !846)
!852 = distinct !DILexicalBlock(scope: !849, file: !543, line: 326, column: 3)
!853 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !846)
!854 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !846)
!855 = !DILocalVariable(name: "a", arg: 1, scope: !856, file: !857, line: 35, type: !14)
!856 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !857, file: !857, line: 35, type: !858, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!857 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!858 = !DISubroutineType(types: !859)
!859 = !{!14, !14}
!860 = !DILocation(line: 0, scope: !856, inlinedAt: !861)
!861 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !846)
!862 = !DILocalVariable(name: "v", scope: !856, file: !857, line: 37, type: !13)
!863 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !861)
!864 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !861)
!865 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !861)
!866 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !861)
!867 = !DILocalVariable(name: "t", scope: !856, file: !857, line: 36, type: !14)
!868 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !861)
!869 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !846)
!870 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !846)
!871 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !846)
!872 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !846)
!873 = distinct !{!873, !853, !874, !185}
!874 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !846)
!875 = !DILocation(line: 173, column: 22, scope: !832, inlinedAt: !730)
!876 = !DILocation(line: 173, column: 3, scope: !832, inlinedAt: !730)
!877 = distinct !{!877, !714, !878, !185}
!878 = !DILocation(line: 174, column: 24, scope: !715, inlinedAt: !730)
!879 = !DILocation(line: 173, scope: !715, inlinedAt: !834)
!880 = !DILocation(line: 0, scope: !717, inlinedAt: !834)
!881 = !DILocation(line: 173, column: 12, scope: !832, inlinedAt: !834)
!882 = !DILocation(line: 231, column: 3, scope: !883)
!883 = distinct !DILexicalBlock(scope: !505, file: !221, line: 231, column: 3)
!884 = !DILocation(line: 174, column: 15, scope: !832, inlinedAt: !834)
!885 = !DILocation(line: 0, scope: !837, inlinedAt: !886)
!886 = distinct !DILocation(line: 174, column: 5, scope: !832, inlinedAt: !834)
!887 = !DILocation(line: 263, column: 3, scope: !837, inlinedAt: !886)
!888 = !DILocation(line: 0, scope: !844, inlinedAt: !889)
!889 = distinct !DILocation(line: 264, column: 3, scope: !837, inlinedAt: !886)
!890 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !889)
!891 = !DILocation(line: 326, scope: !849, inlinedAt: !889)
!892 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !889)
!893 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !889)
!894 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !889)
!895 = !DILocation(line: 0, scope: !856, inlinedAt: !896)
!896 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !889)
!897 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !896)
!898 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !896)
!899 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !896)
!900 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !896)
!901 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !896)
!902 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !889)
!903 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !889)
!904 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !889)
!905 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !889)
!906 = distinct !{!906, !893, !907, !185}
!907 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !889)
!908 = !DILocation(line: 173, column: 22, scope: !832, inlinedAt: !834)
!909 = !DILocation(line: 173, column: 3, scope: !832, inlinedAt: !834)
!910 = distinct !{!910, !833, !911, !185}
!911 = !DILocation(line: 174, column: 24, scope: !715, inlinedAt: !834)
!912 = !DILocation(line: 231, scope: !883)
!913 = !DILocation(line: 231, column: 12, scope: !914)
!914 = distinct !DILexicalBlock(scope: !883, file: !221, line: 231, column: 3)
!915 = !DILocation(line: 244, column: 3, scope: !916, inlinedAt: !922)
!916 = distinct !DILexicalBlock(scope: !917, file: !716, line: 244, column: 3)
!917 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !716, file: !716, line: 241, type: !918, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!918 = !DISubroutineType(types: !919)
!919 = !{null, !720, !920, !920}
!920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !921, size: 32)
!921 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !721)
!922 = distinct !DILocation(line: 236, column: 3, scope: !505)
!923 = !DILocation(line: 232, column: 37, scope: !924)
!924 = distinct !DILexicalBlock(scope: !914, file: !221, line: 231, column: 26)
!925 = !DILocation(line: 232, column: 51, scope: !924)
!926 = !DILocation(line: 232, column: 5, scope: !924)
!927 = !DILocation(line: 233, column: 18, scope: !924)
!928 = !DILocalVariable(name: "r", arg: 1, scope: !929, file: !543, line: 307, type: !546)
!929 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !543, file: !543, line: 307, type: !838, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!930 = !DILocation(line: 0, scope: !929, inlinedAt: !931)
!931 = distinct !DILocation(line: 233, column: 5, scope: !924)
!932 = !DILocalVariable(name: "f", scope: !929, file: !543, line: 310, type: !13)
!933 = !DILocalVariable(name: "i", scope: !929, file: !543, line: 309, type: !42)
!934 = !DILocation(line: 311, column: 7, scope: !935, inlinedAt: !931)
!935 = distinct !DILexicalBlock(scope: !929, file: !543, line: 311, column: 3)
!936 = !DILocation(line: 311, scope: !935, inlinedAt: !931)
!937 = !DILocation(line: 311, column: 12, scope: !938, inlinedAt: !931)
!938 = distinct !DILexicalBlock(scope: !935, file: !543, line: 311, column: 3)
!939 = !DILocation(line: 311, column: 3, scope: !935, inlinedAt: !931)
!940 = !DILocation(line: 312, column: 47, scope: !938, inlinedAt: !931)
!941 = !DILocation(line: 312, column: 38, scope: !938, inlinedAt: !931)
!942 = !DILocation(line: 312, column: 59, scope: !938, inlinedAt: !931)
!943 = !DILocalVariable(name: "a", arg: 1, scope: !944, file: !857, line: 16, type: !5)
!944 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !857, file: !857, line: 16, type: !945, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!945 = !DISubroutineType(types: !48)
!946 = !DILocation(line: 0, scope: !944, inlinedAt: !947)
!947 = distinct !DILocation(line: 312, column: 20, scope: !938, inlinedAt: !931)
!948 = !DILocalVariable(name: "t", scope: !944, file: !857, line: 18, type: !14)
!949 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !947)
!950 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !947)
!951 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !947)
!952 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !947)
!953 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !947)
!954 = !DILocation(line: 312, column: 5, scope: !938, inlinedAt: !931)
!955 = !DILocation(line: 312, column: 18, scope: !938, inlinedAt: !931)
!956 = !DILocation(line: 311, column: 22, scope: !938, inlinedAt: !931)
!957 = !DILocation(line: 311, column: 3, scope: !938, inlinedAt: !931)
!958 = distinct !{!958, !939, !959, !185}
!959 = !DILocation(line: 312, column: 61, scope: !935, inlinedAt: !931)
!960 = !DILocation(line: 231, column: 22, scope: !914)
!961 = !DILocation(line: 231, column: 3, scope: !914)
!962 = distinct !{!962, !882, !963, !185}
!963 = !DILocation(line: 234, column: 3, scope: !883)
!964 = !DILocation(line: 244, scope: !916, inlinedAt: !922)
!965 = !DILocalVariable(name: "i", scope: !917, file: !716, line: 243, type: !42)
!966 = !DILocation(line: 0, scope: !917, inlinedAt: !922)
!967 = !DILocation(line: 244, column: 12, scope: !968, inlinedAt: !922)
!968 = distinct !DILexicalBlock(scope: !916, file: !716, line: 244, column: 3)
!969 = !DILocation(line: 228, column: 3, scope: !970, inlinedAt: !972)
!970 = distinct !DILexicalBlock(scope: !971, file: !716, line: 228, column: 3)
!971 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !716, file: !716, line: 225, type: !718, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!972 = distinct !DILocation(line: 237, column: 3, scope: !505)
!973 = !DILocation(line: 245, column: 15, scope: !968, inlinedAt: !922)
!974 = !DILocation(line: 245, column: 27, scope: !968, inlinedAt: !922)
!975 = !DILocation(line: 245, column: 39, scope: !968, inlinedAt: !922)
!976 = !DILocalVariable(name: "r", arg: 1, scope: !977, file: !543, line: 339, type: !546)
!977 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !543, file: !543, line: 339, type: !978, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!978 = !DISubroutineType(types: !979)
!979 = !{null, !546, !980, !980}
!980 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !981, size: 32)
!981 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !547)
!982 = !DILocation(line: 0, scope: !977, inlinedAt: !983)
!983 = distinct !DILocation(line: 245, column: 5, scope: !968, inlinedAt: !922)
!984 = !DILocalVariable(name: "a", arg: 2, scope: !977, file: !543, line: 339, type: !980)
!985 = !DILocalVariable(name: "b", arg: 3, scope: !977, file: !543, line: 339, type: !980)
!986 = !DILocalVariable(name: "i", scope: !977, file: !543, line: 341, type: !42)
!987 = !DILocation(line: 342, column: 7, scope: !988, inlinedAt: !983)
!988 = distinct !DILexicalBlock(scope: !977, file: !543, line: 342, column: 3)
!989 = !DILocation(line: 342, scope: !988, inlinedAt: !983)
!990 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !983)
!991 = distinct !DILexicalBlock(scope: !988, file: !543, line: 342, column: 3)
!992 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !983)
!993 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !983)
!994 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !983)
!995 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !983)
!996 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !983)
!997 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !983)
!998 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !983)
!999 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !983)
!1000 = distinct !{!1000, !992, !1001, !185}
!1001 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !983)
!1002 = !DILocation(line: 244, column: 22, scope: !968, inlinedAt: !922)
!1003 = !DILocation(line: 244, column: 3, scope: !968, inlinedAt: !922)
!1004 = distinct !{!1004, !915, !1005, !185}
!1005 = !DILocation(line: 245, column: 48, scope: !916, inlinedAt: !922)
!1006 = !DILocation(line: 228, scope: !970, inlinedAt: !972)
!1007 = !DILocalVariable(name: "i", scope: !971, file: !716, line: 227, type: !42)
!1008 = !DILocation(line: 0, scope: !971, inlinedAt: !972)
!1009 = !DILocation(line: 228, column: 12, scope: !1010, inlinedAt: !972)
!1010 = distinct !DILexicalBlock(scope: !970, file: !716, line: 228, column: 3)
!1011 = !DILocation(line: 142, column: 3, scope: !1012, inlinedAt: !1016)
!1012 = distinct !DILexicalBlock(scope: !1013, file: !716, line: 142, column: 3)
!1013 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !716, file: !716, line: 139, type: !1014, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{null, !60, !920}
!1016 = distinct !DILocation(line: 59, column: 3, scope: !1017, inlinedAt: !1020)
!1017 = distinct !DISubprogram(name: "pack_sk", scope: !221, file: !221, line: 57, type: !1018, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{null, !60, !224}
!1020 = distinct !DILocation(line: 239, column: 3, scope: !505)
!1021 = !DILocation(line: 229, column: 18, scope: !1010, inlinedAt: !972)
!1022 = !DILocation(line: 0, scope: !844, inlinedAt: !1023)
!1023 = distinct !DILocation(line: 229, column: 5, scope: !1010, inlinedAt: !972)
!1024 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !1023)
!1025 = !DILocation(line: 326, scope: !849, inlinedAt: !1023)
!1026 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1023)
!1027 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1023)
!1028 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1023)
!1029 = !DILocation(line: 0, scope: !856, inlinedAt: !1030)
!1030 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1023)
!1031 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1030)
!1032 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1030)
!1033 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1030)
!1034 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1030)
!1035 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1030)
!1036 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1023)
!1037 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1023)
!1038 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1023)
!1039 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1023)
!1040 = distinct !{!1040, !1027, !1041, !185}
!1041 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1023)
!1042 = !DILocation(line: 228, column: 22, scope: !1010, inlinedAt: !972)
!1043 = !DILocation(line: 228, column: 3, scope: !1010, inlinedAt: !972)
!1044 = distinct !{!1044, !969, !1045, !185}
!1045 = !DILocation(line: 229, column: 27, scope: !970, inlinedAt: !972)
!1046 = !DILocation(line: 142, scope: !1012, inlinedAt: !1016)
!1047 = !DILocalVariable(name: "i", scope: !1013, file: !716, line: 141, type: !42)
!1048 = !DILocation(line: 0, scope: !1013, inlinedAt: !1016)
!1049 = !DILocation(line: 142, column: 12, scope: !1050, inlinedAt: !1016)
!1050 = distinct !DILexicalBlock(scope: !1012, file: !716, line: 142, column: 3)
!1051 = !DILocation(line: 142, column: 3, scope: !1012, inlinedAt: !1052)
!1052 = distinct !DILocation(line: 27, column: 3, scope: !1053, inlinedAt: !1056)
!1053 = distinct !DISubprogram(name: "pack_pk", scope: !221, file: !221, line: 23, type: !1054, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{null, !60, !224, !64}
!1056 = distinct !DILocation(line: 240, column: 3, scope: !505)
!1057 = !DILocation(line: 143, column: 21, scope: !1050, inlinedAt: !1016)
!1058 = !DILocation(line: 143, column: 19, scope: !1050, inlinedAt: !1016)
!1059 = !DILocation(line: 143, column: 40, scope: !1050, inlinedAt: !1016)
!1060 = !DILocation(line: 143, column: 5, scope: !1050, inlinedAt: !1016)
!1061 = !DILocation(line: 142, column: 22, scope: !1050, inlinedAt: !1016)
!1062 = !DILocation(line: 142, column: 3, scope: !1050, inlinedAt: !1016)
!1063 = distinct !{!1063, !1011, !1064, !185}
!1064 = !DILocation(line: 143, column: 49, scope: !1012, inlinedAt: !1016)
!1065 = !DILocation(line: 142, scope: !1012, inlinedAt: !1052)
!1066 = !DILocation(line: 0, scope: !1013, inlinedAt: !1052)
!1067 = !DILocation(line: 142, column: 12, scope: !1050, inlinedAt: !1052)
!1068 = !DILocation(line: 143, column: 21, scope: !1050, inlinedAt: !1052)
!1069 = !DILocation(line: 143, column: 19, scope: !1050, inlinedAt: !1052)
!1070 = !DILocation(line: 143, column: 40, scope: !1050, inlinedAt: !1052)
!1071 = !DILocation(line: 143, column: 5, scope: !1050, inlinedAt: !1052)
!1072 = !DILocation(line: 142, column: 22, scope: !1050, inlinedAt: !1052)
!1073 = !DILocation(line: 142, column: 3, scope: !1050, inlinedAt: !1052)
!1074 = distinct !{!1074, !1051, !1075, !185}
!1075 = !DILocation(line: 143, column: 49, scope: !1012, inlinedAt: !1052)
!1076 = !DILocation(line: 28, column: 11, scope: !1053, inlinedAt: !1056)
!1077 = !DILocation(line: 28, column: 3, scope: !1053, inlinedAt: !1056)
!1078 = !DILocation(line: 241, column: 1, scope: !505)
!1079 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !221, file: !221, line: 260, type: !1080, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{null, !60, !64, !64, !64}
!1082 = !DILocalVariable(name: "c", arg: 1, scope: !1079, file: !221, line: 260, type: !60)
!1083 = !DILocation(line: 0, scope: !1079)
!1084 = !DILocalVariable(name: "m", arg: 2, scope: !1079, file: !221, line: 261, type: !64)
!1085 = !DILocalVariable(name: "pk", arg: 3, scope: !1079, file: !221, line: 262, type: !64)
!1086 = !DILocalVariable(name: "coins", arg: 4, scope: !1079, file: !221, line: 263, type: !64)
!1087 = !DILocalVariable(name: "seed", scope: !1079, file: !221, line: 266, type: !126)
!1088 = !DILocation(line: 266, column: 11, scope: !1079)
!1089 = !DILocalVariable(name: "nonce", scope: !1079, file: !221, line: 267, type: !61)
!1090 = !DILocalVariable(name: "sp", scope: !1079, file: !221, line: 268, type: !225)
!1091 = !DILocation(line: 268, column: 11, scope: !1079)
!1092 = !DILocalVariable(name: "pkpv", scope: !1079, file: !221, line: 268, type: !225)
!1093 = !DILocation(line: 268, column: 15, scope: !1079)
!1094 = !DILocalVariable(name: "ep", scope: !1079, file: !221, line: 268, type: !225)
!1095 = !DILocation(line: 268, column: 21, scope: !1079)
!1096 = !DILocalVariable(name: "at", scope: !1079, file: !221, line: 268, type: !519)
!1097 = !DILocation(line: 268, column: 25, scope: !1079)
!1098 = !DILocalVariable(name: "b", scope: !1079, file: !221, line: 268, type: !225)
!1099 = !DILocation(line: 268, column: 38, scope: !1079)
!1100 = !DILocalVariable(name: "v", scope: !1079, file: !221, line: 269, type: !231)
!1101 = !DILocation(line: 269, column: 8, scope: !1079)
!1102 = !DILocalVariable(name: "k", scope: !1079, file: !221, line: 269, type: !231)
!1103 = !DILocation(line: 269, column: 11, scope: !1079)
!1104 = !DILocalVariable(name: "epp", scope: !1079, file: !221, line: 269, type: !231)
!1105 = !DILocation(line: 269, column: 14, scope: !1079)
!1106 = !DILocalVariable(name: "pk", arg: 1, scope: !1107, file: !221, line: 41, type: !224)
!1107 = distinct !DISubprogram(name: "unpack_pk", scope: !221, file: !221, line: 41, type: !1108, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{null, !224, !60, !64}
!1110 = !DILocation(line: 0, scope: !1107, inlinedAt: !1111)
!1111 = distinct !DILocation(line: 271, column: 3, scope: !1079)
!1112 = !DILocalVariable(name: "seed", arg: 2, scope: !1107, file: !221, line: 42, type: !60)
!1113 = !DILocalVariable(name: "packedpk", arg: 3, scope: !1107, file: !221, line: 43, type: !64)
!1114 = !DILocalVariable(name: "r", arg: 1, scope: !1115, file: !716, line: 156, type: !720)
!1115 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !716, file: !716, line: 156, type: !1116, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{null, !720, !64}
!1118 = !DILocation(line: 0, scope: !1115, inlinedAt: !1119)
!1119 = distinct !DILocation(line: 45, column: 3, scope: !1107, inlinedAt: !1111)
!1120 = !DILocalVariable(name: "a", arg: 2, scope: !1115, file: !716, line: 156, type: !64)
!1121 = !DILocalVariable(name: "i", scope: !1115, file: !716, line: 158, type: !42)
!1122 = !DILocation(line: 159, column: 7, scope: !1123, inlinedAt: !1119)
!1123 = distinct !DILexicalBlock(scope: !1115, file: !716, line: 159, column: 3)
!1124 = !DILocation(line: 159, scope: !1123, inlinedAt: !1119)
!1125 = !DILocation(line: 159, column: 12, scope: !1126, inlinedAt: !1119)
!1126 = distinct !DILexicalBlock(scope: !1123, file: !716, line: 159, column: 3)
!1127 = !DILocation(line: 159, column: 3, scope: !1123, inlinedAt: !1119)
!1128 = !DILocation(line: 160, column: 21, scope: !1126, inlinedAt: !1119)
!1129 = !DILocation(line: 160, column: 35, scope: !1126, inlinedAt: !1119)
!1130 = !DILocation(line: 160, column: 33, scope: !1126, inlinedAt: !1119)
!1131 = !DILocation(line: 160, column: 5, scope: !1126, inlinedAt: !1119)
!1132 = !DILocation(line: 159, column: 22, scope: !1126, inlinedAt: !1119)
!1133 = !DILocation(line: 159, column: 3, scope: !1126, inlinedAt: !1119)
!1134 = distinct !{!1134, !1127, !1135, !185}
!1135 = !DILocation(line: 160, column: 51, scope: !1123, inlinedAt: !1119)
!1136 = !DILocation(line: 46, column: 24, scope: !1107, inlinedAt: !1111)
!1137 = !DILocation(line: 46, column: 3, scope: !1107, inlinedAt: !1111)
!1138 = !DILocalVariable(name: "r", arg: 1, scope: !1139, file: !543, line: 168, type: !546)
!1139 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !543, file: !543, line: 168, type: !1140, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{null, !546, !64}
!1142 = !DILocation(line: 0, scope: !1139, inlinedAt: !1143)
!1143 = distinct !DILocation(line: 272, column: 3, scope: !1079)
!1144 = !DILocalVariable(name: "msg", arg: 2, scope: !1139, file: !543, line: 168, type: !64)
!1145 = !DILocalVariable(name: "i", scope: !1139, file: !543, line: 170, type: !42)
!1146 = !DILocation(line: 176, column: 7, scope: !1147, inlinedAt: !1143)
!1147 = distinct !DILexicalBlock(scope: !1139, file: !543, line: 176, column: 3)
!1148 = !DILocation(line: 176, scope: !1147, inlinedAt: !1143)
!1149 = !DILocation(line: 176, column: 12, scope: !1150, inlinedAt: !1143)
!1150 = distinct !DILexicalBlock(scope: !1147, file: !543, line: 176, column: 3)
!1151 = !DILocation(line: 176, column: 3, scope: !1147, inlinedAt: !1143)
!1152 = !DILocation(line: 177, column: 5, scope: !1153, inlinedAt: !1143)
!1153 = distinct !DILexicalBlock(scope: !1154, file: !543, line: 177, column: 5)
!1154 = distinct !DILexicalBlock(scope: !1150, file: !543, line: 176, column: 28)
!1155 = !DILocation(line: 177, scope: !1153, inlinedAt: !1143)
!1156 = !DILocalVariable(name: "j", scope: !1139, file: !543, line: 170, type: !42)
!1157 = !DILocation(line: 177, column: 14, scope: !1158, inlinedAt: !1143)
!1158 = distinct !DILexicalBlock(scope: !1153, file: !543, line: 177, column: 5)
!1159 = !DILocation(line: 178, column: 18, scope: !1160, inlinedAt: !1143)
!1160 = distinct !DILexicalBlock(scope: !1158, file: !543, line: 177, column: 22)
!1161 = !DILocation(line: 178, column: 20, scope: !1160, inlinedAt: !1143)
!1162 = !DILocation(line: 178, column: 7, scope: !1160, inlinedAt: !1143)
!1163 = !DILocation(line: 178, column: 24, scope: !1160, inlinedAt: !1143)
!1164 = !DILocation(line: 179, column: 27, scope: !1160, inlinedAt: !1143)
!1165 = !DILocation(line: 179, column: 31, scope: !1160, inlinedAt: !1143)
!1166 = !DILocation(line: 179, column: 53, scope: !1160, inlinedAt: !1143)
!1167 = !DILocalVariable(name: "r", arg: 1, scope: !1168, file: !160, line: 71, type: !464)
!1168 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !160, file: !160, line: 71, type: !1169, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{null, !464, !14, !35}
!1171 = !DILocation(line: 0, scope: !1168, inlinedAt: !1172)
!1172 = distinct !DILocation(line: 179, column: 7, scope: !1160, inlinedAt: !1143)
!1173 = !DILocalVariable(name: "v", arg: 2, scope: !1168, file: !160, line: 71, type: !14)
!1174 = !DILocalVariable(name: "b", arg: 3, scope: !1168, file: !160, line: 71, type: !35)
!1175 = !DILocation(line: 74, column: 15, scope: !1168, inlinedAt: !1172)
!1176 = !DILocation(line: 74, column: 11, scope: !1168, inlinedAt: !1172)
!1177 = !DILocation(line: 74, column: 6, scope: !1168, inlinedAt: !1172)
!1178 = !DILocation(line: 177, column: 18, scope: !1158, inlinedAt: !1143)
!1179 = !DILocation(line: 177, column: 5, scope: !1158, inlinedAt: !1143)
!1180 = distinct !{!1180, !1152, !1181, !185}
!1181 = !DILocation(line: 180, column: 5, scope: !1153, inlinedAt: !1143)
!1182 = !DILocation(line: 176, column: 24, scope: !1150, inlinedAt: !1143)
!1183 = !DILocation(line: 176, column: 3, scope: !1150, inlinedAt: !1143)
!1184 = distinct !{!1184, !1151, !1185, !185}
!1185 = !DILocation(line: 181, column: 3, scope: !1147, inlinedAt: !1143)
!1186 = !DILocation(line: 273, column: 3, scope: !1079)
!1187 = !DILocalVariable(name: "i", scope: !1079, file: !221, line: 265, type: !42)
!1188 = !DILocation(line: 275, column: 7, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1079, file: !221, line: 275, column: 3)
!1190 = !DILocation(line: 275, scope: !1189)
!1191 = !DILocation(line: 275, column: 12, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1189, file: !221, line: 275, column: 3)
!1193 = !DILocation(line: 275, column: 3, scope: !1189)
!1194 = !DILocation(line: 277, column: 3, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1079, file: !221, line: 277, column: 3)
!1196 = !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !1197)
!1197 = distinct !DILocation(line: 276, column: 5, scope: !1192)
!1198 = !DILocation(line: 0, scope: !542, inlinedAt: !1197)
!1199 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !1197)
!1200 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !1201)
!1201 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !1197)
!1202 = !DILocation(line: 0, scope: !562, inlinedAt: !1201)
!1203 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !1201)
!1204 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !1201)
!1205 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !1201)
!1206 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !1207)
!1207 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !1208)
!1208 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !1201)
!1209 = !DILocation(line: 0, scope: !581, inlinedAt: !1208)
!1210 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !1208)
!1211 = !DILocation(line: 0, scope: !579, inlinedAt: !1207)
!1212 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !1207)
!1213 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !1207)
!1214 = !DILocation(line: 0, scope: !600, inlinedAt: !1215)
!1215 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !1208)
!1216 = !DILocation(line: 0, scope: !349, inlinedAt: !1217)
!1217 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !1215)
!1218 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !1217)
!1219 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !1217)
!1220 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !1217)
!1221 = !DILocation(line: 509, scope: !363, inlinedAt: !1217)
!1222 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !1217)
!1223 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !1217)
!1224 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !1217)
!1225 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !1217)
!1226 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !1217)
!1227 = !DILocation(line: 0, scope: !372, inlinedAt: !1228)
!1228 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !1217)
!1229 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !1228)
!1230 = !DILocation(line: 43, scope: !380, inlinedAt: !1228)
!1231 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !1228)
!1232 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !1228)
!1233 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !1228)
!1234 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !1228)
!1235 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !1228)
!1236 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !1228)
!1237 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !1228)
!1238 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !1228)
!1239 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !1228)
!1240 = distinct !{!1240, !1232, !1241, !185}
!1241 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !1228)
!1242 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !1217)
!1243 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !1217)
!1244 = distinct !{!1244, !1223, !1245, !185}
!1245 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !1217)
!1246 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !1217)
!1247 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !1217)
!1248 = distinct !{!1248, !1218, !1249, !185}
!1249 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !1217)
!1250 = !DILocation(line: 732, column: 7, scope: !581, inlinedAt: !1208)
!1251 = !DILocation(line: 0, scope: !641, inlinedAt: !1252)
!1252 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !1208)
!1253 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !1252)
!1254 = !DILocation(line: 0, scope: !648, inlinedAt: !1255)
!1255 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !1252)
!1256 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !1255)
!1257 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !1255)
!1258 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !1255)
!1259 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !1255)
!1260 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !1255)
!1261 = !DILocation(line: 439, scope: !666, inlinedAt: !1255)
!1262 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !1255)
!1263 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !1255)
!1264 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !1255)
!1265 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !1255)
!1266 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !1255)
!1267 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !1255)
!1268 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !1255)
!1269 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !1255)
!1270 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !1255)
!1271 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !1255)
!1272 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !1255)
!1273 = distinct !{!1273, !1264, !1274, !185}
!1274 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !1255)
!1275 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !1255)
!1276 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !1255)
!1277 = distinct !{!1277, !1256, !1278, !185}
!1278 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !1255)
!1279 = !DILocation(line: 276, column: 30, scope: !1192)
!1280 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !1252)
!1281 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !1252)
!1282 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !1208)
!1283 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !1201)
!1284 = !DILocation(line: 0, scope: !692, inlinedAt: !1285)
!1285 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !1197)
!1286 = !DILocation(line: 115, column: 3, scope: !692, inlinedAt: !1285)
!1287 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !1197)
!1288 = !DILocation(line: 276, column: 46, scope: !1192)
!1289 = !DILocation(line: 275, column: 22, scope: !1192)
!1290 = !DILocation(line: 275, column: 3, scope: !1192)
!1291 = distinct !{!1291, !1193, !1292, !185}
!1292 = !DILocation(line: 276, column: 48, scope: !1189)
!1293 = !DILocation(line: 277, scope: !1195)
!1294 = !DILocation(line: 277, column: 12, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1195, file: !221, line: 277, column: 3)
!1296 = !DILocation(line: 247, column: 3, scope: !1297, inlinedAt: !1298)
!1297 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !543, file: !543, line: 244, type: !544, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1298 = distinct !DILocation(line: 278, column: 5, scope: !1295)
!1299 = !DILocalVariable(name: "r", arg: 1, scope: !1297, file: !543, line: 244, type: !546)
!1300 = !DILocation(line: 0, scope: !1297, inlinedAt: !1298)
!1301 = !DILocalVariable(name: "seed", arg: 2, scope: !1297, file: !543, line: 244, type: !64)
!1302 = !DILocalVariable(name: "nonce", arg: 3, scope: !1297, file: !543, line: 244, type: !61)
!1303 = !DILocalVariable(name: "buf", scope: !1297, file: !543, line: 246, type: !1304)
!1304 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1305 = !DILocation(line: 246, column: 11, scope: !1297, inlinedAt: !1298)
!1306 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !1307)
!1307 = distinct !DILocation(line: 247, column: 3, scope: !1297, inlinedAt: !1298)
!1308 = !DILocation(line: 0, scope: !562, inlinedAt: !1307)
!1309 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !1307)
!1310 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !1307)
!1311 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !1307)
!1312 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !1313)
!1313 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !1314)
!1314 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !1307)
!1315 = !DILocation(line: 0, scope: !581, inlinedAt: !1314)
!1316 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !1314)
!1317 = !DILocation(line: 0, scope: !579, inlinedAt: !1313)
!1318 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !1313)
!1319 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !1313)
!1320 = !DILocation(line: 0, scope: !600, inlinedAt: !1321)
!1321 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !1314)
!1322 = !DILocation(line: 0, scope: !349, inlinedAt: !1323)
!1323 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !1321)
!1324 = !DILocation(line: 0, scope: !641, inlinedAt: !1325)
!1325 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !1314)
!1326 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !1325)
!1327 = !DILocation(line: 0, scope: !648, inlinedAt: !1328)
!1328 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !1325)
!1329 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !1328)
!1330 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !1328)
!1331 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !1328)
!1332 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !1328)
!1333 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !1328)
!1334 = !DILocation(line: 439, scope: !666, inlinedAt: !1328)
!1335 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !1328)
!1336 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !1328)
!1337 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !1328)
!1338 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !1328)
!1339 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !1328)
!1340 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !1328)
!1341 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !1328)
!1342 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !1328)
!1343 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !1328)
!1344 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !1328)
!1345 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !1328)
!1346 = distinct !{!1346, !1337, !1347, !185}
!1347 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !1328)
!1348 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !1328)
!1349 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !1328)
!1350 = distinct !{!1350, !1329, !1351, !185}
!1351 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !1328)
!1352 = !DILocation(line: 278, column: 30, scope: !1295)
!1353 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !1325)
!1354 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !1325)
!1355 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !1314)
!1356 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !1307)
!1357 = !DILocalVariable(name: "r", arg: 1, scope: !1358, file: !693, line: 121, type: !696)
!1358 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !693, file: !693, line: 121, type: !694, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1359 = !DILocation(line: 0, scope: !1358, inlinedAt: !1360)
!1360 = distinct !DILocation(line: 248, column: 3, scope: !1297, inlinedAt: !1298)
!1361 = !DILocalVariable(name: "buf", arg: 2, scope: !1358, file: !693, line: 121, type: !64)
!1362 = !DILocation(line: 124, column: 3, scope: !1358, inlinedAt: !1360)
!1363 = !DILocation(line: 249, column: 1, scope: !1297, inlinedAt: !1298)
!1364 = !DILocation(line: 278, column: 46, scope: !1295)
!1365 = !DILocation(line: 277, column: 22, scope: !1295)
!1366 = !DILocation(line: 277, column: 3, scope: !1295)
!1367 = distinct !{!1367, !1194, !1368, !185}
!1368 = !DILocation(line: 278, column: 48, scope: !1195)
!1369 = !DILocation(line: 247, column: 3, scope: !1297, inlinedAt: !1370)
!1370 = distinct !DILocation(line: 279, column: 3, scope: !1079)
!1371 = !DILocation(line: 0, scope: !1297, inlinedAt: !1370)
!1372 = !DILocation(line: 246, column: 11, scope: !1297, inlinedAt: !1370)
!1373 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !1374)
!1374 = distinct !DILocation(line: 247, column: 3, scope: !1297, inlinedAt: !1370)
!1375 = !DILocation(line: 0, scope: !562, inlinedAt: !1374)
!1376 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !1374)
!1377 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !1374)
!1378 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !1374)
!1379 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !1380)
!1380 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !1381)
!1381 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !1374)
!1382 = !DILocation(line: 0, scope: !581, inlinedAt: !1381)
!1383 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !1381)
!1384 = !DILocation(line: 0, scope: !579, inlinedAt: !1380)
!1385 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !1380)
!1386 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !1380)
!1387 = !DILocation(line: 0, scope: !600, inlinedAt: !1388)
!1388 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !1381)
!1389 = !DILocation(line: 0, scope: !349, inlinedAt: !1390)
!1390 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !1388)
!1391 = !DILocation(line: 0, scope: !641, inlinedAt: !1392)
!1392 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !1381)
!1393 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !1392)
!1394 = !DILocation(line: 0, scope: !648, inlinedAt: !1395)
!1395 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !1392)
!1396 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !1395)
!1397 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !1395)
!1398 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !1395)
!1399 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !1395)
!1400 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !1395)
!1401 = !DILocation(line: 439, scope: !666, inlinedAt: !1395)
!1402 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !1395)
!1403 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !1395)
!1404 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !1395)
!1405 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !1395)
!1406 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !1395)
!1407 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !1395)
!1408 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !1395)
!1409 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !1395)
!1410 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !1395)
!1411 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !1395)
!1412 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !1395)
!1413 = distinct !{!1413, !1404, !1414, !185}
!1414 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !1395)
!1415 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !1395)
!1416 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !1395)
!1417 = distinct !{!1417, !1396, !1418, !185}
!1418 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !1395)
!1419 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !1392)
!1420 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !1392)
!1421 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !1381)
!1422 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !1374)
!1423 = !DILocation(line: 0, scope: !1358, inlinedAt: !1424)
!1424 = distinct !DILocation(line: 248, column: 3, scope: !1297, inlinedAt: !1370)
!1425 = !DILocation(line: 124, column: 3, scope: !1358, inlinedAt: !1424)
!1426 = !DILocation(line: 249, column: 1, scope: !1297, inlinedAt: !1370)
!1427 = !DILocalVariable(name: "r", arg: 1, scope: !717, file: !716, line: 170, type: !720)
!1428 = !DILocation(line: 0, scope: !717, inlinedAt: !1429)
!1429 = distinct !DILocation(line: 281, column: 3, scope: !1079)
!1430 = !DILocation(line: 173, column: 7, scope: !715, inlinedAt: !1429)
!1431 = !DILocation(line: 173, scope: !715, inlinedAt: !1429)
!1432 = !DILocation(line: 173, column: 12, scope: !832, inlinedAt: !1429)
!1433 = !DILocation(line: 173, column: 3, scope: !715, inlinedAt: !1429)
!1434 = !DILocation(line: 284, column: 3, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1079, file: !221, line: 284, column: 3)
!1436 = !DILocation(line: 174, column: 15, scope: !832, inlinedAt: !1429)
!1437 = !DILocation(line: 0, scope: !837, inlinedAt: !1438)
!1438 = distinct !DILocation(line: 174, column: 5, scope: !832, inlinedAt: !1429)
!1439 = !DILocation(line: 263, column: 3, scope: !837, inlinedAt: !1438)
!1440 = !DILocation(line: 0, scope: !844, inlinedAt: !1441)
!1441 = distinct !DILocation(line: 264, column: 3, scope: !837, inlinedAt: !1438)
!1442 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !1441)
!1443 = !DILocation(line: 326, scope: !849, inlinedAt: !1441)
!1444 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1441)
!1445 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1441)
!1446 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1441)
!1447 = !DILocation(line: 0, scope: !856, inlinedAt: !1448)
!1448 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1441)
!1449 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1448)
!1450 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1448)
!1451 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1448)
!1452 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1448)
!1453 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1448)
!1454 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1441)
!1455 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1441)
!1456 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1441)
!1457 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1441)
!1458 = distinct !{!1458, !1445, !1459, !185}
!1459 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1441)
!1460 = !DILocation(line: 173, column: 22, scope: !832, inlinedAt: !1429)
!1461 = !DILocation(line: 173, column: 3, scope: !832, inlinedAt: !1429)
!1462 = distinct !{!1462, !1433, !1463, !185}
!1463 = !DILocation(line: 174, column: 24, scope: !715, inlinedAt: !1429)
!1464 = !DILocation(line: 284, scope: !1435)
!1465 = !DILocation(line: 284, column: 12, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1435, file: !221, line: 284, column: 3)
!1467 = !DILocation(line: 285, column: 37, scope: !1466)
!1468 = !DILocation(line: 285, column: 48, scope: !1466)
!1469 = !DILocation(line: 285, column: 5, scope: !1466)
!1470 = !DILocation(line: 284, column: 22, scope: !1466)
!1471 = !DILocation(line: 284, column: 3, scope: !1466)
!1472 = distinct !{!1472, !1434, !1473, !185}
!1473 = !DILocation(line: 285, column: 58, scope: !1435)
!1474 = !DILocation(line: 287, column: 3, scope: !1079)
!1475 = !DILocalVariable(name: "r", arg: 1, scope: !1476, file: !716, line: 185, type: !720)
!1476 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !716, file: !716, line: 185, type: !718, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1477 = !DILocation(line: 0, scope: !1476, inlinedAt: !1478)
!1478 = distinct !DILocation(line: 289, column: 3, scope: !1079)
!1479 = !DILocalVariable(name: "i", scope: !1476, file: !716, line: 187, type: !42)
!1480 = !DILocation(line: 188, column: 7, scope: !1481, inlinedAt: !1478)
!1481 = distinct !DILexicalBlock(scope: !1476, file: !716, line: 188, column: 3)
!1482 = !DILocation(line: 188, scope: !1481, inlinedAt: !1478)
!1483 = !DILocation(line: 188, column: 12, scope: !1484, inlinedAt: !1478)
!1484 = distinct !DILexicalBlock(scope: !1481, file: !716, line: 188, column: 3)
!1485 = !DILocation(line: 188, column: 3, scope: !1481, inlinedAt: !1478)
!1486 = !DILocation(line: 189, column: 25, scope: !1484, inlinedAt: !1478)
!1487 = !DILocalVariable(name: "r", arg: 1, scope: !1488, file: !543, line: 276, type: !546)
!1488 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !543, file: !543, line: 276, type: !838, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1489 = !DILocation(line: 0, scope: !1488, inlinedAt: !1490)
!1490 = distinct !DILocation(line: 189, column: 5, scope: !1484, inlinedAt: !1478)
!1491 = !DILocation(line: 278, column: 3, scope: !1488, inlinedAt: !1490)
!1492 = !DILocation(line: 188, column: 22, scope: !1484, inlinedAt: !1478)
!1493 = !DILocation(line: 188, column: 3, scope: !1484, inlinedAt: !1478)
!1494 = distinct !{!1494, !1485, !1495, !185}
!1495 = !DILocation(line: 189, column: 34, scope: !1481, inlinedAt: !1478)
!1496 = !DILocation(line: 0, scope: !1488, inlinedAt: !1497)
!1497 = distinct !DILocation(line: 290, column: 3, scope: !1079)
!1498 = !DILocation(line: 278, column: 3, scope: !1488, inlinedAt: !1497)
!1499 = !DILocalVariable(name: "r", arg: 1, scope: !917, file: !716, line: 241, type: !720)
!1500 = !DILocation(line: 0, scope: !917, inlinedAt: !1501)
!1501 = distinct !DILocation(line: 292, column: 3, scope: !1079)
!1502 = !DILocalVariable(name: "a", arg: 2, scope: !917, file: !716, line: 241, type: !920)
!1503 = !DILocalVariable(name: "b", arg: 3, scope: !917, file: !716, line: 241, type: !920)
!1504 = !DILocation(line: 244, column: 7, scope: !916, inlinedAt: !1501)
!1505 = !DILocation(line: 244, scope: !916, inlinedAt: !1501)
!1506 = !DILocation(line: 244, column: 12, scope: !968, inlinedAt: !1501)
!1507 = !DILocation(line: 244, column: 3, scope: !916, inlinedAt: !1501)
!1508 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !1509)
!1509 = distinct !DILocation(line: 293, column: 3, scope: !1079)
!1510 = !DILocation(line: 245, column: 15, scope: !968, inlinedAt: !1501)
!1511 = !DILocation(line: 245, column: 27, scope: !968, inlinedAt: !1501)
!1512 = !DILocation(line: 245, column: 39, scope: !968, inlinedAt: !1501)
!1513 = !DILocation(line: 0, scope: !977, inlinedAt: !1514)
!1514 = distinct !DILocation(line: 245, column: 5, scope: !968, inlinedAt: !1501)
!1515 = !DILocation(line: 342, column: 7, scope: !988, inlinedAt: !1514)
!1516 = !DILocation(line: 342, scope: !988, inlinedAt: !1514)
!1517 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !1514)
!1518 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !1514)
!1519 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !1514)
!1520 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !1514)
!1521 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !1514)
!1522 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !1514)
!1523 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !1514)
!1524 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !1514)
!1525 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !1514)
!1526 = distinct !{!1526, !1518, !1527, !185}
!1527 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !1514)
!1528 = !DILocation(line: 244, column: 22, scope: !968, inlinedAt: !1501)
!1529 = !DILocation(line: 244, column: 3, scope: !968, inlinedAt: !1501)
!1530 = distinct !{!1530, !1507, !1531, !185}
!1531 = !DILocation(line: 245, column: 48, scope: !916, inlinedAt: !1501)
!1532 = !DILocation(line: 342, scope: !988, inlinedAt: !1509)
!1533 = !DILocation(line: 0, scope: !977, inlinedAt: !1509)
!1534 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !1509)
!1535 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !1536)
!1536 = distinct !DILocation(line: 294, column: 3, scope: !1079)
!1537 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !1509)
!1538 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !1509)
!1539 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !1509)
!1540 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !1509)
!1541 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !1509)
!1542 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !1509)
!1543 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !1509)
!1544 = distinct !{!1544, !1508, !1545, !185}
!1545 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !1509)
!1546 = !DILocation(line: 342, scope: !988, inlinedAt: !1536)
!1547 = !DILocation(line: 0, scope: !977, inlinedAt: !1536)
!1548 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !1536)
!1549 = !DILocation(line: 228, column: 3, scope: !970, inlinedAt: !1550)
!1550 = distinct !DILocation(line: 295, column: 3, scope: !1079)
!1551 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !1536)
!1552 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !1536)
!1553 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !1536)
!1554 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !1536)
!1555 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !1536)
!1556 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !1536)
!1557 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !1536)
!1558 = distinct !{!1558, !1535, !1559, !185}
!1559 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !1536)
!1560 = !DILocation(line: 228, scope: !970, inlinedAt: !1550)
!1561 = !DILocation(line: 0, scope: !971, inlinedAt: !1550)
!1562 = !DILocation(line: 228, column: 12, scope: !1010, inlinedAt: !1550)
!1563 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1564)
!1564 = distinct !DILocation(line: 296, column: 3, scope: !1079)
!1565 = !DILocation(line: 229, column: 18, scope: !1010, inlinedAt: !1550)
!1566 = !DILocation(line: 0, scope: !844, inlinedAt: !1567)
!1567 = distinct !DILocation(line: 229, column: 5, scope: !1010, inlinedAt: !1550)
!1568 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !1567)
!1569 = !DILocation(line: 326, scope: !849, inlinedAt: !1567)
!1570 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1567)
!1571 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1567)
!1572 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1567)
!1573 = !DILocation(line: 0, scope: !856, inlinedAt: !1574)
!1574 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1567)
!1575 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1574)
!1576 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1574)
!1577 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1574)
!1578 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1574)
!1579 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1574)
!1580 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1567)
!1581 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1567)
!1582 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1567)
!1583 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1567)
!1584 = distinct !{!1584, !1571, !1585, !185}
!1585 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1567)
!1586 = !DILocation(line: 228, column: 22, scope: !1010, inlinedAt: !1550)
!1587 = !DILocation(line: 228, column: 3, scope: !1010, inlinedAt: !1550)
!1588 = distinct !{!1588, !1549, !1589, !185}
!1589 = !DILocation(line: 229, column: 27, scope: !970, inlinedAt: !1550)
!1590 = !DILocation(line: 326, scope: !849, inlinedAt: !1564)
!1591 = !DILocation(line: 0, scope: !844, inlinedAt: !1564)
!1592 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1564)
!1593 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1564)
!1594 = !DILocation(line: 0, scope: !856, inlinedAt: !1595)
!1595 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1564)
!1596 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1595)
!1597 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1595)
!1598 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1595)
!1599 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1595)
!1600 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1595)
!1601 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1564)
!1602 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1564)
!1603 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1564)
!1604 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1564)
!1605 = distinct !{!1605, !1563, !1606, !185}
!1606 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1564)
!1607 = !DILocalVariable(name: "r", arg: 1, scope: !1608, file: !221, line: 86, type: !60)
!1608 = distinct !DISubprogram(name: "pack_ciphertext", scope: !221, file: !221, line: 86, type: !1609, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1609 = !DISubroutineType(types: !1610)
!1610 = !{null, !60, !224, !1611}
!1611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 32)
!1612 = !DILocation(line: 0, scope: !1608, inlinedAt: !1613)
!1613 = distinct !DILocation(line: 298, column: 3, scope: !1079)
!1614 = !DILocalVariable(name: "b", arg: 2, scope: !1608, file: !221, line: 86, type: !224)
!1615 = !DILocalVariable(name: "v", arg: 3, scope: !1608, file: !221, line: 86, type: !1611)
!1616 = !DILocation(line: 88, column: 3, scope: !1608, inlinedAt: !1613)
!1617 = !DILocation(line: 89, column: 18, scope: !1608, inlinedAt: !1613)
!1618 = !DILocation(line: 89, column: 3, scope: !1608, inlinedAt: !1613)
!1619 = !DILocation(line: 299, column: 1, scope: !1079)
!1620 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !221, file: !221, line: 314, type: !1621, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1621 = !DISubroutineType(types: !1622)
!1622 = !{null, !60, !64, !64}
!1623 = !DILocalVariable(name: "m", arg: 1, scope: !1620, file: !221, line: 314, type: !60)
!1624 = !DILocation(line: 0, scope: !1620)
!1625 = !DILocalVariable(name: "c", arg: 2, scope: !1620, file: !221, line: 315, type: !64)
!1626 = !DILocalVariable(name: "sk", arg: 3, scope: !1620, file: !221, line: 316, type: !64)
!1627 = !DILocalVariable(name: "b", scope: !1620, file: !221, line: 318, type: !225)
!1628 = !DILocation(line: 318, column: 11, scope: !1620)
!1629 = !DILocalVariable(name: "skpv", scope: !1620, file: !221, line: 318, type: !225)
!1630 = !DILocation(line: 318, column: 14, scope: !1620)
!1631 = !DILocalVariable(name: "v", scope: !1620, file: !221, line: 319, type: !231)
!1632 = !DILocation(line: 319, column: 8, scope: !1620)
!1633 = !DILocalVariable(name: "mp", scope: !1620, file: !221, line: 319, type: !231)
!1634 = !DILocation(line: 319, column: 11, scope: !1620)
!1635 = !DILocalVariable(name: "b", arg: 1, scope: !1636, file: !221, line: 102, type: !224)
!1636 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !221, file: !221, line: 102, type: !1637, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1637 = !DISubroutineType(types: !1638)
!1638 = !{null, !224, !1611, !64}
!1639 = !DILocation(line: 0, scope: !1636, inlinedAt: !1640)
!1640 = distinct !DILocation(line: 321, column: 3, scope: !1620)
!1641 = !DILocalVariable(name: "v", arg: 2, scope: !1636, file: !221, line: 102, type: !1611)
!1642 = !DILocalVariable(name: "c", arg: 3, scope: !1636, file: !221, line: 102, type: !64)
!1643 = !DILocation(line: 104, column: 3, scope: !1636, inlinedAt: !1640)
!1644 = !DILocation(line: 105, column: 23, scope: !1636, inlinedAt: !1640)
!1645 = !DILocalVariable(name: "r", arg: 1, scope: !1646, file: !543, line: 83, type: !546)
!1646 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !543, file: !543, line: 83, type: !1140, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1647 = !DILocation(line: 0, scope: !1646, inlinedAt: !1648)
!1648 = distinct !DILocation(line: 105, column: 3, scope: !1636, inlinedAt: !1640)
!1649 = !DILocalVariable(name: "a", arg: 2, scope: !1646, file: !543, line: 83, type: !64)
!1650 = !DILocalVariable(name: "i", scope: !1646, file: !543, line: 85, type: !42)
!1651 = !DILocation(line: 88, column: 7, scope: !1652, inlinedAt: !1648)
!1652 = distinct !DILexicalBlock(scope: !1646, file: !543, line: 88, column: 3)
!1653 = !DILocation(line: 88, scope: !1652, inlinedAt: !1648)
!1654 = !DILocation(line: 88, column: 12, scope: !1655, inlinedAt: !1648)
!1655 = distinct !DILexicalBlock(scope: !1652, file: !543, line: 88, column: 3)
!1656 = !DILocation(line: 88, column: 3, scope: !1652, inlinedAt: !1648)
!1657 = !DILocation(line: 159, column: 3, scope: !1123, inlinedAt: !1658)
!1658 = distinct !DILocation(line: 72, column: 3, scope: !1659, inlinedAt: !1662)
!1659 = distinct !DISubprogram(name: "unpack_sk", scope: !221, file: !221, line: 70, type: !1660, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1660 = !DISubroutineType(types: !1661)
!1661 = !{null, !224, !64}
!1662 = distinct !DILocation(line: 322, column: 3, scope: !1620)
!1663 = !DILocation(line: 89, column: 37, scope: !1664, inlinedAt: !1648)
!1664 = distinct !DILexicalBlock(scope: !1655, file: !543, line: 88, column: 28)
!1665 = !DILocation(line: 89, column: 42, scope: !1664, inlinedAt: !1648)
!1666 = !DILocation(line: 89, column: 26, scope: !1664, inlinedAt: !1648)
!1667 = !DILocation(line: 89, column: 47, scope: !1664, inlinedAt: !1648)
!1668 = !DILocation(line: 89, column: 57, scope: !1664, inlinedAt: !1648)
!1669 = !DILocation(line: 89, column: 62, scope: !1664, inlinedAt: !1648)
!1670 = !DILocation(line: 89, column: 24, scope: !1664, inlinedAt: !1648)
!1671 = !DILocation(line: 89, column: 16, scope: !1664, inlinedAt: !1648)
!1672 = !DILocation(line: 89, column: 5, scope: !1664, inlinedAt: !1648)
!1673 = !DILocation(line: 89, column: 22, scope: !1664, inlinedAt: !1648)
!1674 = !DILocation(line: 90, column: 37, scope: !1664, inlinedAt: !1648)
!1675 = !DILocation(line: 90, column: 42, scope: !1664, inlinedAt: !1648)
!1676 = !DILocation(line: 90, column: 26, scope: !1664, inlinedAt: !1648)
!1677 = !DILocation(line: 90, column: 47, scope: !1664, inlinedAt: !1648)
!1678 = !DILocation(line: 90, column: 57, scope: !1664, inlinedAt: !1648)
!1679 = !DILocation(line: 90, column: 62, scope: !1664, inlinedAt: !1648)
!1680 = !DILocation(line: 90, column: 24, scope: !1664, inlinedAt: !1648)
!1681 = !DILocation(line: 90, column: 16, scope: !1664, inlinedAt: !1648)
!1682 = !DILocation(line: 90, column: 18, scope: !1664, inlinedAt: !1648)
!1683 = !DILocation(line: 90, column: 5, scope: !1664, inlinedAt: !1648)
!1684 = !DILocation(line: 90, column: 22, scope: !1664, inlinedAt: !1648)
!1685 = !DILocation(line: 91, column: 7, scope: !1664, inlinedAt: !1648)
!1686 = !DILocation(line: 88, column: 24, scope: !1655, inlinedAt: !1648)
!1687 = !DILocation(line: 88, column: 3, scope: !1655, inlinedAt: !1648)
!1688 = distinct !{!1688, !1656, !1689, !185}
!1689 = !DILocation(line: 92, column: 3, scope: !1652, inlinedAt: !1648)
!1690 = !DILocation(line: 159, scope: !1123, inlinedAt: !1658)
!1691 = !DILocation(line: 0, scope: !1115, inlinedAt: !1658)
!1692 = !DILocation(line: 159, column: 12, scope: !1126, inlinedAt: !1658)
!1693 = !DILocation(line: 173, column: 3, scope: !715, inlinedAt: !1694)
!1694 = distinct !DILocation(line: 324, column: 3, scope: !1620)
!1695 = !DILocation(line: 160, column: 21, scope: !1126, inlinedAt: !1658)
!1696 = !DILocation(line: 160, column: 35, scope: !1126, inlinedAt: !1658)
!1697 = !DILocation(line: 160, column: 33, scope: !1126, inlinedAt: !1658)
!1698 = !DILocation(line: 160, column: 5, scope: !1126, inlinedAt: !1658)
!1699 = !DILocation(line: 159, column: 22, scope: !1126, inlinedAt: !1658)
!1700 = !DILocation(line: 159, column: 3, scope: !1126, inlinedAt: !1658)
!1701 = distinct !{!1701, !1657, !1702, !185}
!1702 = !DILocation(line: 160, column: 51, scope: !1123, inlinedAt: !1658)
!1703 = !DILocation(line: 173, scope: !715, inlinedAt: !1694)
!1704 = !DILocation(line: 0, scope: !717, inlinedAt: !1694)
!1705 = !DILocation(line: 173, column: 12, scope: !832, inlinedAt: !1694)
!1706 = !DILocation(line: 174, column: 15, scope: !832, inlinedAt: !1694)
!1707 = !DILocation(line: 0, scope: !837, inlinedAt: !1708)
!1708 = distinct !DILocation(line: 174, column: 5, scope: !832, inlinedAt: !1694)
!1709 = !DILocation(line: 263, column: 3, scope: !837, inlinedAt: !1708)
!1710 = !DILocation(line: 0, scope: !844, inlinedAt: !1711)
!1711 = distinct !DILocation(line: 264, column: 3, scope: !837, inlinedAt: !1708)
!1712 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !1711)
!1713 = !DILocation(line: 326, scope: !849, inlinedAt: !1711)
!1714 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1711)
!1715 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1711)
!1716 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1711)
!1717 = !DILocation(line: 0, scope: !856, inlinedAt: !1718)
!1718 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1711)
!1719 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1718)
!1720 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1718)
!1721 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1718)
!1722 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1718)
!1723 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1718)
!1724 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1711)
!1725 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1711)
!1726 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1711)
!1727 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1711)
!1728 = distinct !{!1728, !1715, !1729, !185}
!1729 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1711)
!1730 = !DILocation(line: 173, column: 22, scope: !832, inlinedAt: !1694)
!1731 = !DILocation(line: 173, column: 3, scope: !832, inlinedAt: !1694)
!1732 = distinct !{!1732, !1693, !1733, !185}
!1733 = !DILocation(line: 174, column: 24, scope: !715, inlinedAt: !1694)
!1734 = !DILocation(line: 325, column: 3, scope: !1620)
!1735 = !DILocation(line: 0, scope: !1488, inlinedAt: !1736)
!1736 = distinct !DILocation(line: 326, column: 3, scope: !1620)
!1737 = !DILocation(line: 278, column: 3, scope: !1488, inlinedAt: !1736)
!1738 = !DILocalVariable(name: "r", arg: 1, scope: !1739, file: !543, line: 355, type: !546)
!1739 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !543, file: !543, line: 355, type: !978, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1740 = !DILocation(line: 0, scope: !1739, inlinedAt: !1741)
!1741 = distinct !DILocation(line: 328, column: 3, scope: !1620)
!1742 = !DILocalVariable(name: "a", arg: 2, scope: !1739, file: !543, line: 355, type: !980)
!1743 = !DILocalVariable(name: "b", arg: 3, scope: !1739, file: !543, line: 355, type: !980)
!1744 = !DILocalVariable(name: "i", scope: !1739, file: !543, line: 357, type: !42)
!1745 = !DILocation(line: 358, column: 7, scope: !1746, inlinedAt: !1741)
!1746 = distinct !DILexicalBlock(scope: !1739, file: !543, line: 358, column: 3)
!1747 = !DILocation(line: 358, scope: !1746, inlinedAt: !1741)
!1748 = !DILocation(line: 358, column: 12, scope: !1749, inlinedAt: !1741)
!1749 = distinct !DILexicalBlock(scope: !1746, file: !543, line: 358, column: 3)
!1750 = !DILocation(line: 358, column: 3, scope: !1746, inlinedAt: !1741)
!1751 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !1752)
!1752 = distinct !DILocation(line: 329, column: 3, scope: !1620)
!1753 = !DILocation(line: 359, column: 20, scope: !1749, inlinedAt: !1741)
!1754 = !DILocation(line: 359, column: 35, scope: !1749, inlinedAt: !1741)
!1755 = !DILocation(line: 359, column: 33, scope: !1749, inlinedAt: !1741)
!1756 = !DILocation(line: 359, column: 5, scope: !1749, inlinedAt: !1741)
!1757 = !DILocation(line: 359, column: 18, scope: !1749, inlinedAt: !1741)
!1758 = !DILocation(line: 358, column: 22, scope: !1749, inlinedAt: !1741)
!1759 = !DILocation(line: 358, column: 3, scope: !1749, inlinedAt: !1741)
!1760 = distinct !{!1760, !1750, !1761, !185}
!1761 = !DILocation(line: 359, column: 46, scope: !1746, inlinedAt: !1741)
!1762 = !DILocation(line: 326, scope: !849, inlinedAt: !1752)
!1763 = !DILocation(line: 0, scope: !844, inlinedAt: !1752)
!1764 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !1752)
!1765 = !DILocation(line: 197, column: 3, scope: !1766, inlinedAt: !1770)
!1766 = distinct !DILexicalBlock(scope: !1767, file: !543, line: 197, column: 3)
!1767 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !543, file: !543, line: 192, type: !1768, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1768 = !DISubroutineType(types: !1769)
!1769 = !{null, !60, !980}
!1770 = distinct !DILocation(line: 331, column: 3, scope: !1620)
!1771 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !1752)
!1772 = !DILocation(line: 0, scope: !856, inlinedAt: !1773)
!1773 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !1752)
!1774 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !1773)
!1775 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !1773)
!1776 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !1773)
!1777 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !1773)
!1778 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !1773)
!1779 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !1752)
!1780 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !1752)
!1781 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !1752)
!1782 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !1752)
!1783 = distinct !{!1783, !1751, !1784, !185}
!1784 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !1752)
!1785 = !DILocation(line: 197, scope: !1766, inlinedAt: !1770)
!1786 = !DILocalVariable(name: "i", scope: !1767, file: !543, line: 194, type: !42)
!1787 = !DILocation(line: 0, scope: !1767, inlinedAt: !1770)
!1788 = !DILocation(line: 197, column: 12, scope: !1789, inlinedAt: !1770)
!1789 = distinct !DILexicalBlock(scope: !1766, file: !543, line: 197, column: 3)
!1790 = !DILocation(line: 198, column: 5, scope: !1791, inlinedAt: !1770)
!1791 = distinct !DILexicalBlock(scope: !1789, file: !543, line: 197, column: 28)
!1792 = !DILocation(line: 198, column: 12, scope: !1791, inlinedAt: !1770)
!1793 = !DILocalVariable(name: "j", scope: !1767, file: !543, line: 194, type: !42)
!1794 = !DILocation(line: 199, column: 9, scope: !1795, inlinedAt: !1770)
!1795 = distinct !DILexicalBlock(scope: !1791, file: !543, line: 199, column: 5)
!1796 = !DILocation(line: 199, scope: !1795, inlinedAt: !1770)
!1797 = !DILocation(line: 199, column: 14, scope: !1798, inlinedAt: !1770)
!1798 = distinct !DILexicalBlock(scope: !1795, file: !543, line: 199, column: 5)
!1799 = !DILocation(line: 199, column: 5, scope: !1795, inlinedAt: !1770)
!1800 = !DILocation(line: 200, column: 23, scope: !1801, inlinedAt: !1770)
!1801 = distinct !DILexicalBlock(scope: !1798, file: !543, line: 199, column: 22)
!1802 = !DILocation(line: 200, column: 25, scope: !1801, inlinedAt: !1770)
!1803 = !DILocation(line: 200, column: 12, scope: !1801, inlinedAt: !1770)
!1804 = !DILocalVariable(name: "t", scope: !1767, file: !543, line: 195, type: !40)
!1805 = !DILocation(line: 205, column: 9, scope: !1801, inlinedAt: !1770)
!1806 = !DILocation(line: 206, column: 9, scope: !1801, inlinedAt: !1770)
!1807 = !DILocation(line: 207, column: 9, scope: !1801, inlinedAt: !1770)
!1808 = !DILocation(line: 208, column: 19, scope: !1801, inlinedAt: !1770)
!1809 = !DILocation(line: 208, column: 7, scope: !1801, inlinedAt: !1770)
!1810 = !DILocation(line: 208, column: 14, scope: !1801, inlinedAt: !1770)
!1811 = !DILocation(line: 199, column: 18, scope: !1798, inlinedAt: !1770)
!1812 = !DILocation(line: 199, column: 5, scope: !1798, inlinedAt: !1770)
!1813 = distinct !{!1813, !1799, !1814, !185}
!1814 = !DILocation(line: 209, column: 5, scope: !1795, inlinedAt: !1770)
!1815 = !DILocation(line: 197, column: 24, scope: !1789, inlinedAt: !1770)
!1816 = !DILocation(line: 197, column: 3, scope: !1789, inlinedAt: !1770)
!1817 = distinct !{!1817, !1765, !1818, !185}
!1818 = !DILocation(line: 210, column: 3, scope: !1766, inlinedAt: !1770)
!1819 = !DILocation(line: 332, column: 1, scope: !1620)
!1820 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !716, file: !716, line: 15, type: !1014, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1821 = !DILocalVariable(name: "r", arg: 1, scope: !1820, file: !716, line: 15, type: !60)
!1822 = !DILocation(line: 0, scope: !1820)
!1823 = !DILocalVariable(name: "a", arg: 2, scope: !1820, file: !716, line: 15, type: !920)
!1824 = !DILocalVariable(name: "t", scope: !1820, file: !716, line: 51, type: !1825)
!1825 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 64, elements: !1826)
!1826 = !{!1827}
!1827 = !DISubrange(count: 4)
!1828 = !DILocation(line: 51, column: 12, scope: !1820)
!1829 = !DILocalVariable(name: "i", scope: !1820, file: !716, line: 17, type: !42)
!1830 = !DILocation(line: 52, column: 7, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1820, file: !716, line: 52, column: 3)
!1832 = !DILocation(line: 52, scope: !1831)
!1833 = !DILocation(line: 52, column: 12, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1831, file: !716, line: 52, column: 3)
!1835 = !DILocation(line: 52, column: 3, scope: !1831)
!1836 = !DILocation(line: 53, column: 5, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1838, file: !716, line: 53, column: 5)
!1838 = distinct !DILexicalBlock(scope: !1834, file: !716, line: 52, column: 26)
!1839 = !DILocation(line: 53, scope: !1837)
!1840 = !DILocalVariable(name: "j", scope: !1820, file: !716, line: 17, type: !42)
!1841 = !DILocation(line: 53, column: 14, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1837, file: !716, line: 53, column: 5)
!1843 = !DILocation(line: 54, column: 7, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1845, file: !716, line: 54, column: 7)
!1845 = distinct !DILexicalBlock(scope: !1842, file: !716, line: 53, column: 30)
!1846 = !DILocation(line: 54, scope: !1844)
!1847 = !DILocalVariable(name: "k", scope: !1820, file: !716, line: 17, type: !42)
!1848 = !DILocation(line: 54, column: 16, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1844, file: !716, line: 54, column: 7)
!1850 = !DILocation(line: 55, column: 17, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1849, file: !716, line: 54, column: 24)
!1852 = !DILocation(line: 55, column: 35, scope: !1851)
!1853 = !DILocation(line: 55, column: 37, scope: !1851)
!1854 = !DILocation(line: 56, column: 39, scope: !1851)
!1855 = !DILocation(line: 56, column: 9, scope: !1851)
!1856 = !DILocation(line: 56, column: 14, scope: !1851)
!1857 = !DILocation(line: 58, column: 14, scope: !1851)
!1858 = !DILocalVariable(name: "d0", scope: !1820, file: !716, line: 18, type: !23)
!1859 = !DILocation(line: 61, column: 12, scope: !1851)
!1860 = !DILocation(line: 62, column: 12, scope: !1851)
!1861 = !DILocation(line: 63, column: 16, scope: !1851)
!1862 = !DILocation(line: 63, column: 9, scope: !1851)
!1863 = !DILocation(line: 63, column: 14, scope: !1851)
!1864 = !DILocation(line: 54, column: 20, scope: !1849)
!1865 = !DILocation(line: 54, column: 7, scope: !1849)
!1866 = distinct !{!1866, !1843, !1867, !185}
!1867 = !DILocation(line: 64, column: 7, scope: !1844)
!1868 = !DILocation(line: 66, column: 15, scope: !1845)
!1869 = !DILocation(line: 66, column: 14, scope: !1845)
!1870 = !DILocation(line: 66, column: 12, scope: !1845)
!1871 = !DILocation(line: 67, column: 15, scope: !1845)
!1872 = !DILocation(line: 67, column: 20, scope: !1845)
!1873 = !DILocation(line: 67, column: 29, scope: !1845)
!1874 = !DILocation(line: 67, column: 34, scope: !1845)
!1875 = !DILocation(line: 67, column: 26, scope: !1845)
!1876 = !DILocation(line: 67, column: 7, scope: !1845)
!1877 = !DILocation(line: 67, column: 12, scope: !1845)
!1878 = !DILocation(line: 68, column: 15, scope: !1845)
!1879 = !DILocation(line: 68, column: 20, scope: !1845)
!1880 = !DILocation(line: 68, column: 29, scope: !1845)
!1881 = !DILocation(line: 68, column: 34, scope: !1845)
!1882 = !DILocation(line: 68, column: 26, scope: !1845)
!1883 = !DILocation(line: 68, column: 7, scope: !1845)
!1884 = !DILocation(line: 68, column: 12, scope: !1845)
!1885 = !DILocation(line: 69, column: 15, scope: !1845)
!1886 = !DILocation(line: 69, column: 20, scope: !1845)
!1887 = !DILocation(line: 69, column: 29, scope: !1845)
!1888 = !DILocation(line: 69, column: 34, scope: !1845)
!1889 = !DILocation(line: 69, column: 26, scope: !1845)
!1890 = !DILocation(line: 69, column: 7, scope: !1845)
!1891 = !DILocation(line: 69, column: 12, scope: !1845)
!1892 = !DILocation(line: 70, column: 15, scope: !1845)
!1893 = !DILocation(line: 70, column: 20, scope: !1845)
!1894 = !DILocation(line: 70, column: 14, scope: !1845)
!1895 = !DILocation(line: 70, column: 7, scope: !1845)
!1896 = !DILocation(line: 70, column: 12, scope: !1845)
!1897 = !DILocation(line: 71, column: 9, scope: !1845)
!1898 = !DILocation(line: 53, column: 26, scope: !1842)
!1899 = !DILocation(line: 53, column: 5, scope: !1842)
!1900 = distinct !{!1900, !1836, !1901, !185}
!1901 = !DILocation(line: 72, column: 5, scope: !1837)
!1902 = !DILocation(line: 52, column: 22, scope: !1834)
!1903 = !DILocation(line: 52, column: 3, scope: !1834)
!1904 = distinct !{!1904, !1835, !1905, !185}
!1905 = !DILocation(line: 73, column: 3, scope: !1831)
!1906 = !DILocation(line: 77, column: 1, scope: !1820)
!1907 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !716, file: !716, line: 89, type: !1116, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1908 = !DILocalVariable(name: "r", arg: 1, scope: !1907, file: !716, line: 89, type: !720)
!1909 = !DILocation(line: 0, scope: !1907)
!1910 = !DILocalVariable(name: "a", arg: 2, scope: !1907, file: !716, line: 89, type: !64)
!1911 = !DILocalVariable(name: "t", scope: !1907, file: !716, line: 112, type: !1825)
!1912 = !DILocation(line: 112, column: 12, scope: !1907)
!1913 = !DILocalVariable(name: "i", scope: !1907, file: !716, line: 91, type: !42)
!1914 = !DILocation(line: 113, column: 7, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1907, file: !716, line: 113, column: 3)
!1916 = !DILocation(line: 113, scope: !1915)
!1917 = !DILocation(line: 113, column: 12, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1915, file: !716, line: 113, column: 3)
!1919 = !DILocation(line: 113, column: 3, scope: !1915)
!1920 = !DILocation(line: 114, column: 5, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1922, file: !716, line: 114, column: 5)
!1922 = distinct !DILexicalBlock(scope: !1918, file: !716, line: 113, column: 26)
!1923 = !DILocation(line: 114, scope: !1921)
!1924 = !DILocalVariable(name: "j", scope: !1907, file: !716, line: 91, type: !42)
!1925 = !DILocation(line: 114, column: 14, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1921, file: !716, line: 114, column: 5)
!1927 = !DILocation(line: 115, column: 15, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1926, file: !716, line: 114, column: 30)
!1929 = !DILocation(line: 115, column: 39, scope: !1928)
!1930 = !DILocation(line: 115, column: 29, scope: !1928)
!1931 = !DILocation(line: 115, column: 44, scope: !1928)
!1932 = !DILocation(line: 115, column: 26, scope: !1928)
!1933 = !DILocation(line: 115, column: 12, scope: !1928)
!1934 = !DILocation(line: 116, column: 15, scope: !1928)
!1935 = !DILocation(line: 116, column: 20, scope: !1928)
!1936 = !DILocation(line: 116, column: 39, scope: !1928)
!1937 = !DILocation(line: 116, column: 29, scope: !1928)
!1938 = !DILocation(line: 116, column: 44, scope: !1928)
!1939 = !DILocation(line: 116, column: 26, scope: !1928)
!1940 = !DILocation(line: 116, column: 7, scope: !1928)
!1941 = !DILocation(line: 116, column: 12, scope: !1928)
!1942 = !DILocation(line: 117, column: 15, scope: !1928)
!1943 = !DILocation(line: 117, column: 20, scope: !1928)
!1944 = !DILocation(line: 117, column: 39, scope: !1928)
!1945 = !DILocation(line: 117, column: 29, scope: !1928)
!1946 = !DILocation(line: 117, column: 44, scope: !1928)
!1947 = !DILocation(line: 117, column: 26, scope: !1928)
!1948 = !DILocation(line: 117, column: 7, scope: !1928)
!1949 = !DILocation(line: 117, column: 12, scope: !1928)
!1950 = !DILocation(line: 118, column: 15, scope: !1928)
!1951 = !DILocation(line: 118, column: 20, scope: !1928)
!1952 = !DILocation(line: 118, column: 39, scope: !1928)
!1953 = !DILocation(line: 118, column: 29, scope: !1928)
!1954 = !DILocation(line: 118, column: 44, scope: !1928)
!1955 = !DILocation(line: 118, column: 26, scope: !1928)
!1956 = !DILocation(line: 118, column: 7, scope: !1928)
!1957 = !DILocation(line: 118, column: 12, scope: !1928)
!1958 = !DILocalVariable(name: "k", scope: !1907, file: !716, line: 91, type: !42)
!1959 = !DILocation(line: 121, column: 11, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1928, file: !716, line: 121, column: 7)
!1961 = !DILocation(line: 121, scope: !1960)
!1962 = !DILocation(line: 121, column: 16, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1960, file: !716, line: 121, column: 7)
!1964 = !DILocation(line: 121, column: 7, scope: !1960)
!1965 = !DILocation(line: 122, column: 47, scope: !1963)
!1966 = !DILocation(line: 122, column: 52, scope: !1963)
!1967 = !DILocation(line: 122, column: 60, scope: !1963)
!1968 = !DILocation(line: 122, column: 69, scope: !1963)
!1969 = !DILocation(line: 122, column: 76, scope: !1963)
!1970 = !DILocation(line: 122, column: 35, scope: !1963)
!1971 = !DILocation(line: 122, column: 9, scope: !1963)
!1972 = !DILocation(line: 122, column: 27, scope: !1963)
!1973 = !DILocation(line: 122, column: 29, scope: !1963)
!1974 = !DILocation(line: 122, column: 33, scope: !1963)
!1975 = !DILocation(line: 121, column: 20, scope: !1963)
!1976 = !DILocation(line: 121, column: 7, scope: !1963)
!1977 = distinct !{!1977, !1964, !1978, !185}
!1978 = !DILocation(line: 122, column: 79, scope: !1960)
!1979 = !DILocation(line: 119, column: 9, scope: !1928)
!1980 = !DILocation(line: 114, column: 26, scope: !1926)
!1981 = !DILocation(line: 114, column: 5, scope: !1926)
!1982 = distinct !{!1982, !1920, !1983, !185}
!1983 = !DILocation(line: 123, column: 5, scope: !1921)
!1984 = !DILocation(line: 113, column: 22, scope: !1918)
!1985 = !DILocation(line: 113, column: 3, scope: !1918)
!1986 = distinct !{!1986, !1919, !1987, !185}
!1987 = !DILocation(line: 124, column: 3, scope: !1915)
!1988 = !DILocation(line: 128, column: 1, scope: !1907)
!1989 = !DILocalVariable(name: "r", arg: 1, scope: !1013, file: !716, line: 139, type: !60)
!1990 = !DILocation(line: 0, scope: !1013)
!1991 = !DILocalVariable(name: "a", arg: 2, scope: !1013, file: !716, line: 139, type: !920)
!1992 = !DILocation(line: 142, column: 7, scope: !1012)
!1993 = !DILocation(line: 142, scope: !1012)
!1994 = !DILocation(line: 142, column: 12, scope: !1050)
!1995 = !DILocation(line: 142, column: 3, scope: !1012)
!1996 = !DILocation(line: 143, column: 21, scope: !1050)
!1997 = !DILocation(line: 143, column: 19, scope: !1050)
!1998 = !DILocation(line: 143, column: 40, scope: !1050)
!1999 = !DILocation(line: 143, column: 5, scope: !1050)
!2000 = !DILocation(line: 142, column: 22, scope: !1050)
!2001 = !DILocation(line: 142, column: 3, scope: !1050)
!2002 = distinct !{!2002, !1995, !2003, !185}
!2003 = !DILocation(line: 143, column: 49, scope: !1012)
!2004 = !DILocation(line: 144, column: 1, scope: !1013)
!2005 = !DILocation(line: 0, scope: !1115)
!2006 = !DILocation(line: 159, column: 7, scope: !1123)
!2007 = !DILocation(line: 159, scope: !1123)
!2008 = !DILocation(line: 159, column: 12, scope: !1126)
!2009 = !DILocation(line: 159, column: 3, scope: !1123)
!2010 = !DILocation(line: 160, column: 21, scope: !1126)
!2011 = !DILocation(line: 160, column: 35, scope: !1126)
!2012 = !DILocation(line: 160, column: 33, scope: !1126)
!2013 = !DILocation(line: 160, column: 5, scope: !1126)
!2014 = !DILocation(line: 159, column: 22, scope: !1126)
!2015 = !DILocation(line: 159, column: 3, scope: !1126)
!2016 = distinct !{!2016, !2009, !2017, !185}
!2017 = !DILocation(line: 160, column: 51, scope: !1123)
!2018 = !DILocation(line: 161, column: 1, scope: !1115)
!2019 = !DILocation(line: 0, scope: !717)
!2020 = !DILocation(line: 173, column: 7, scope: !715)
!2021 = !DILocation(line: 173, scope: !715)
!2022 = !DILocation(line: 173, column: 12, scope: !832)
!2023 = !DILocation(line: 173, column: 3, scope: !715)
!2024 = !DILocation(line: 174, column: 15, scope: !832)
!2025 = !DILocation(line: 0, scope: !837, inlinedAt: !2026)
!2026 = distinct !DILocation(line: 174, column: 5, scope: !832)
!2027 = !DILocation(line: 263, column: 3, scope: !837, inlinedAt: !2026)
!2028 = !DILocation(line: 0, scope: !844, inlinedAt: !2029)
!2029 = distinct !DILocation(line: 264, column: 3, scope: !837, inlinedAt: !2026)
!2030 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !2029)
!2031 = !DILocation(line: 326, scope: !849, inlinedAt: !2029)
!2032 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !2029)
!2033 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !2029)
!2034 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !2029)
!2035 = !DILocation(line: 0, scope: !856, inlinedAt: !2036)
!2036 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !2029)
!2037 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2036)
!2038 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2036)
!2039 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2036)
!2040 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2036)
!2041 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2036)
!2042 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !2029)
!2043 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !2029)
!2044 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !2029)
!2045 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !2029)
!2046 = distinct !{!2046, !2033, !2047, !185}
!2047 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !2029)
!2048 = !DILocation(line: 173, column: 22, scope: !832)
!2049 = !DILocation(line: 173, column: 3, scope: !832)
!2050 = distinct !{!2050, !2023, !2051, !185}
!2051 = !DILocation(line: 174, column: 24, scope: !715)
!2052 = !DILocation(line: 175, column: 1, scope: !717)
!2053 = !DILocation(line: 0, scope: !1476)
!2054 = !DILocation(line: 188, column: 7, scope: !1481)
!2055 = !DILocation(line: 188, scope: !1481)
!2056 = !DILocation(line: 188, column: 12, scope: !1484)
!2057 = !DILocation(line: 188, column: 3, scope: !1481)
!2058 = !DILocation(line: 189, column: 25, scope: !1484)
!2059 = !DILocation(line: 0, scope: !1488, inlinedAt: !2060)
!2060 = distinct !DILocation(line: 189, column: 5, scope: !1484)
!2061 = !DILocation(line: 278, column: 3, scope: !1488, inlinedAt: !2060)
!2062 = !DILocation(line: 188, column: 22, scope: !1484)
!2063 = !DILocation(line: 188, column: 3, scope: !1484)
!2064 = distinct !{!2064, !2057, !2065, !185}
!2065 = !DILocation(line: 189, column: 34, scope: !1481)
!2066 = !DILocation(line: 190, column: 1, scope: !1476)
!2067 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !716, file: !716, line: 202, type: !2068, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!2068 = !DISubroutineType(types: !2069)
!2069 = !{null, !2070, !920, !920}
!2070 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 32)
!2071 = !DILocalVariable(name: "r", arg: 1, scope: !2067, file: !716, line: 202, type: !2070)
!2072 = !DILocation(line: 0, scope: !2067)
!2073 = !DILocalVariable(name: "a", arg: 2, scope: !2067, file: !716, line: 202, type: !920)
!2074 = !DILocalVariable(name: "b", arg: 3, scope: !2067, file: !716, line: 202, type: !920)
!2075 = !DILocalVariable(name: "t", scope: !2067, file: !716, line: 205, type: !726)
!2076 = !DILocation(line: 205, column: 8, scope: !2067)
!2077 = !DILocation(line: 207, column: 3, scope: !2067)
!2078 = !DILocalVariable(name: "i", scope: !2067, file: !716, line: 204, type: !42)
!2079 = !DILocation(line: 208, column: 7, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2067, file: !716, line: 208, column: 3)
!2081 = !DILocation(line: 208, scope: !2080)
!2082 = !DILocation(line: 208, column: 12, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2080, file: !716, line: 208, column: 3)
!2084 = !DILocation(line: 208, column: 3, scope: !2080)
!2085 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !2086)
!2086 = distinct !DILocation(line: 213, column: 3, scope: !2067)
!2087 = !DILocation(line: 209, column: 34, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2083, file: !716, line: 208, column: 26)
!2089 = !DILocation(line: 209, column: 46, scope: !2088)
!2090 = !DILocation(line: 209, column: 5, scope: !2088)
!2091 = !DILocation(line: 0, scope: !977, inlinedAt: !2092)
!2092 = distinct !DILocation(line: 210, column: 5, scope: !2088)
!2093 = !DILocation(line: 342, column: 7, scope: !988, inlinedAt: !2092)
!2094 = !DILocation(line: 342, scope: !988, inlinedAt: !2092)
!2095 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !2092)
!2096 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !2092)
!2097 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !2092)
!2098 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !2092)
!2099 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !2092)
!2100 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !2092)
!2101 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !2092)
!2102 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !2092)
!2103 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !2092)
!2104 = distinct !{!2104, !2096, !2105, !185}
!2105 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !2092)
!2106 = !DILocation(line: 208, column: 22, scope: !2083)
!2107 = !DILocation(line: 208, column: 3, scope: !2083)
!2108 = distinct !{!2108, !2084, !2109, !185}
!2109 = !DILocation(line: 211, column: 3, scope: !2080)
!2110 = !DILocation(line: 326, scope: !849, inlinedAt: !2086)
!2111 = !DILocation(line: 0, scope: !844, inlinedAt: !2086)
!2112 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !2086)
!2113 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !2086)
!2114 = !DILocation(line: 0, scope: !856, inlinedAt: !2115)
!2115 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !2086)
!2116 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2115)
!2117 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2115)
!2118 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2115)
!2119 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2115)
!2120 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2115)
!2121 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !2086)
!2122 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !2086)
!2123 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !2086)
!2124 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !2086)
!2125 = distinct !{!2125, !2085, !2126, !185}
!2126 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !2086)
!2127 = !DILocation(line: 214, column: 1, scope: !2067)
!2128 = !DILocalVariable(name: "r", arg: 1, scope: !971, file: !716, line: 225, type: !720)
!2129 = !DILocation(line: 0, scope: !971)
!2130 = !DILocation(line: 228, column: 7, scope: !970)
!2131 = !DILocation(line: 228, scope: !970)
!2132 = !DILocation(line: 228, column: 12, scope: !1010)
!2133 = !DILocation(line: 228, column: 3, scope: !970)
!2134 = !DILocation(line: 229, column: 18, scope: !1010)
!2135 = !DILocation(line: 0, scope: !844, inlinedAt: !2136)
!2136 = distinct !DILocation(line: 229, column: 5, scope: !1010)
!2137 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !2136)
!2138 = !DILocation(line: 326, scope: !849, inlinedAt: !2136)
!2139 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !2136)
!2140 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !2136)
!2141 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !2136)
!2142 = !DILocation(line: 0, scope: !856, inlinedAt: !2143)
!2143 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !2136)
!2144 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2143)
!2145 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2143)
!2146 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2143)
!2147 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2143)
!2148 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2143)
!2149 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !2136)
!2150 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !2136)
!2151 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !2136)
!2152 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !2136)
!2153 = distinct !{!2153, !2140, !2154, !185}
!2154 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !2136)
!2155 = !DILocation(line: 228, column: 22, scope: !1010)
!2156 = !DILocation(line: 228, column: 3, scope: !1010)
!2157 = distinct !{!2157, !2133, !2158, !185}
!2158 = !DILocation(line: 229, column: 27, scope: !970)
!2159 = !DILocation(line: 230, column: 1, scope: !971)
!2160 = !DILocation(line: 0, scope: !917)
!2161 = !DILocation(line: 244, column: 7, scope: !916)
!2162 = !DILocation(line: 244, scope: !916)
!2163 = !DILocation(line: 244, column: 12, scope: !968)
!2164 = !DILocation(line: 244, column: 3, scope: !916)
!2165 = !DILocation(line: 245, column: 15, scope: !968)
!2166 = !DILocation(line: 245, column: 27, scope: !968)
!2167 = !DILocation(line: 245, column: 39, scope: !968)
!2168 = !DILocation(line: 0, scope: !977, inlinedAt: !2169)
!2169 = distinct !DILocation(line: 245, column: 5, scope: !968)
!2170 = !DILocation(line: 342, column: 7, scope: !988, inlinedAt: !2169)
!2171 = !DILocation(line: 342, scope: !988, inlinedAt: !2169)
!2172 = !DILocation(line: 342, column: 12, scope: !991, inlinedAt: !2169)
!2173 = !DILocation(line: 342, column: 3, scope: !988, inlinedAt: !2169)
!2174 = !DILocation(line: 343, column: 20, scope: !991, inlinedAt: !2169)
!2175 = !DILocation(line: 343, column: 35, scope: !991, inlinedAt: !2169)
!2176 = !DILocation(line: 343, column: 33, scope: !991, inlinedAt: !2169)
!2177 = !DILocation(line: 343, column: 5, scope: !991, inlinedAt: !2169)
!2178 = !DILocation(line: 343, column: 18, scope: !991, inlinedAt: !2169)
!2179 = !DILocation(line: 342, column: 22, scope: !991, inlinedAt: !2169)
!2180 = !DILocation(line: 342, column: 3, scope: !991, inlinedAt: !2169)
!2181 = distinct !{!2181, !2173, !2182, !185}
!2182 = !DILocation(line: 343, column: 46, scope: !988, inlinedAt: !2169)
!2183 = !DILocation(line: 244, column: 22, scope: !968)
!2184 = !DILocation(line: 244, column: 3, scope: !968)
!2185 = distinct !{!2185, !2164, !2186, !185}
!2186 = !DILocation(line: 245, column: 48, scope: !916)
!2187 = !DILocation(line: 246, column: 1, scope: !917)
!2188 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !543, file: !543, line: 19, type: !1768, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2189 = !DILocalVariable(name: "r", arg: 1, scope: !2188, file: !543, line: 19, type: !60)
!2190 = !DILocation(line: 0, scope: !2188)
!2191 = !DILocalVariable(name: "a", arg: 2, scope: !2188, file: !543, line: 19, type: !980)
!2192 = !DILocalVariable(name: "t", scope: !2188, file: !543, line: 24, type: !2193)
!2193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !2194)
!2194 = !{!2195}
!2195 = !DISubrange(count: 8)
!2196 = !DILocation(line: 24, column: 11, scope: !2188)
!2197 = !DILocalVariable(name: "i", scope: !2188, file: !543, line: 21, type: !42)
!2198 = !DILocation(line: 28, column: 7, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2188, file: !543, line: 28, column: 3)
!2200 = !DILocation(line: 28, scope: !2199)
!2201 = !DILocation(line: 28, column: 12, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2199, file: !543, line: 28, column: 3)
!2203 = !DILocation(line: 28, column: 3, scope: !2199)
!2204 = !DILocation(line: 29, column: 5, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2206, file: !543, line: 29, column: 5)
!2206 = distinct !DILexicalBlock(scope: !2202, file: !543, line: 28, column: 28)
!2207 = !DILocation(line: 29, scope: !2205)
!2208 = !DILocalVariable(name: "j", scope: !2188, file: !543, line: 21, type: !42)
!2209 = !DILocation(line: 29, column: 14, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2205, file: !543, line: 29, column: 5)
!2211 = !DILocation(line: 31, column: 23, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2210, file: !543, line: 29, column: 22)
!2213 = !DILocation(line: 31, column: 25, scope: !2212)
!2214 = !DILocation(line: 31, column: 12, scope: !2212)
!2215 = !DILocalVariable(name: "u", scope: !2188, file: !543, line: 22, type: !14)
!2216 = !DILocation(line: 32, column: 22, scope: !2212)
!2217 = !DILocation(line: 32, column: 9, scope: !2212)
!2218 = !DILocation(line: 34, column: 12, scope: !2212)
!2219 = !DILocalVariable(name: "d0", scope: !2188, file: !543, line: 23, type: !40)
!2220 = !DILocation(line: 36, column: 10, scope: !2212)
!2221 = !DILocation(line: 37, column: 10, scope: !2212)
!2222 = !DILocation(line: 38, column: 14, scope: !2212)
!2223 = !DILocation(line: 38, column: 7, scope: !2212)
!2224 = !DILocation(line: 38, column: 12, scope: !2212)
!2225 = !DILocation(line: 29, column: 18, scope: !2210)
!2226 = !DILocation(line: 29, column: 5, scope: !2210)
!2227 = distinct !{!2227, !2204, !2228, !185}
!2228 = !DILocation(line: 39, column: 5, scope: !2205)
!2229 = !DILocation(line: 41, column: 12, scope: !2206)
!2230 = !DILocation(line: 41, column: 20, scope: !2206)
!2231 = !DILocation(line: 41, column: 25, scope: !2206)
!2232 = !DILocation(line: 41, column: 17, scope: !2206)
!2233 = !DILocation(line: 41, column: 10, scope: !2206)
!2234 = !DILocation(line: 42, column: 12, scope: !2206)
!2235 = !DILocation(line: 42, column: 20, scope: !2206)
!2236 = !DILocation(line: 42, column: 25, scope: !2206)
!2237 = !DILocation(line: 42, column: 17, scope: !2206)
!2238 = !DILocation(line: 42, column: 5, scope: !2206)
!2239 = !DILocation(line: 42, column: 10, scope: !2206)
!2240 = !DILocation(line: 43, column: 12, scope: !2206)
!2241 = !DILocation(line: 43, column: 20, scope: !2206)
!2242 = !DILocation(line: 43, column: 25, scope: !2206)
!2243 = !DILocation(line: 43, column: 17, scope: !2206)
!2244 = !DILocation(line: 43, column: 5, scope: !2206)
!2245 = !DILocation(line: 43, column: 10, scope: !2206)
!2246 = !DILocation(line: 44, column: 12, scope: !2206)
!2247 = !DILocation(line: 44, column: 20, scope: !2206)
!2248 = !DILocation(line: 44, column: 25, scope: !2206)
!2249 = !DILocation(line: 44, column: 17, scope: !2206)
!2250 = !DILocation(line: 44, column: 5, scope: !2206)
!2251 = !DILocation(line: 44, column: 10, scope: !2206)
!2252 = !DILocation(line: 45, column: 7, scope: !2206)
!2253 = !DILocation(line: 28, column: 24, scope: !2202)
!2254 = !DILocation(line: 28, column: 3, scope: !2202)
!2255 = distinct !{!2255, !2203, !2256, !185}
!2256 = !DILocation(line: 46, column: 3, scope: !2199)
!2257 = !DILocation(line: 71, column: 1, scope: !2188)
!2258 = !DILocation(line: 0, scope: !1646)
!2259 = !DILocation(line: 88, column: 7, scope: !1652)
!2260 = !DILocation(line: 88, scope: !1652)
!2261 = !DILocation(line: 88, column: 12, scope: !1655)
!2262 = !DILocation(line: 88, column: 3, scope: !1652)
!2263 = !DILocation(line: 89, column: 37, scope: !1664)
!2264 = !DILocation(line: 89, column: 42, scope: !1664)
!2265 = !DILocation(line: 89, column: 26, scope: !1664)
!2266 = !DILocation(line: 89, column: 47, scope: !1664)
!2267 = !DILocation(line: 89, column: 57, scope: !1664)
!2268 = !DILocation(line: 89, column: 62, scope: !1664)
!2269 = !DILocation(line: 89, column: 24, scope: !1664)
!2270 = !DILocation(line: 89, column: 16, scope: !1664)
!2271 = !DILocation(line: 89, column: 5, scope: !1664)
!2272 = !DILocation(line: 89, column: 22, scope: !1664)
!2273 = !DILocation(line: 90, column: 37, scope: !1664)
!2274 = !DILocation(line: 90, column: 42, scope: !1664)
!2275 = !DILocation(line: 90, column: 26, scope: !1664)
!2276 = !DILocation(line: 90, column: 47, scope: !1664)
!2277 = !DILocation(line: 90, column: 57, scope: !1664)
!2278 = !DILocation(line: 90, column: 62, scope: !1664)
!2279 = !DILocation(line: 90, column: 24, scope: !1664)
!2280 = !DILocation(line: 90, column: 16, scope: !1664)
!2281 = !DILocation(line: 90, column: 18, scope: !1664)
!2282 = !DILocation(line: 90, column: 5, scope: !1664)
!2283 = !DILocation(line: 90, column: 22, scope: !1664)
!2284 = !DILocation(line: 91, column: 7, scope: !1664)
!2285 = !DILocation(line: 88, column: 24, scope: !1655)
!2286 = !DILocation(line: 88, column: 3, scope: !1655)
!2287 = distinct !{!2287, !2262, !2288, !185}
!2288 = !DILocation(line: 92, column: 3, scope: !1652)
!2289 = !DILocation(line: 113, column: 1, scope: !1646)
!2290 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !543, file: !543, line: 124, type: !1768, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2291 = !DILocalVariable(name: "r", arg: 1, scope: !2290, file: !543, line: 124, type: !60)
!2292 = !DILocation(line: 0, scope: !2290)
!2293 = !DILocalVariable(name: "a", arg: 2, scope: !2290, file: !543, line: 124, type: !980)
!2294 = !DILocalVariable(name: "i", scope: !2290, file: !543, line: 126, type: !42)
!2295 = !DILocation(line: 129, column: 7, scope: !2296)
!2296 = distinct !DILexicalBlock(scope: !2290, file: !543, line: 129, column: 3)
!2297 = !DILocation(line: 129, scope: !2296)
!2298 = !DILocation(line: 129, column: 12, scope: !2299)
!2299 = distinct !DILexicalBlock(scope: !2296, file: !543, line: 129, column: 3)
!2300 = !DILocation(line: 129, column: 3, scope: !2296)
!2301 = !DILocation(line: 131, column: 22, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2299, file: !543, line: 129, column: 28)
!2303 = !DILocation(line: 131, column: 11, scope: !2302)
!2304 = !DILocalVariable(name: "t0", scope: !2290, file: !543, line: 127, type: !35)
!2305 = !DILocation(line: 132, column: 31, scope: !2302)
!2306 = !DILocation(line: 132, column: 8, scope: !2302)
!2307 = !DILocation(line: 133, column: 21, scope: !2302)
!2308 = !DILocation(line: 133, column: 23, scope: !2302)
!2309 = !DILocation(line: 133, column: 10, scope: !2302)
!2310 = !DILocalVariable(name: "t1", scope: !2290, file: !543, line: 127, type: !35)
!2311 = !DILocation(line: 134, column: 31, scope: !2302)
!2312 = !DILocation(line: 134, column: 8, scope: !2302)
!2313 = !DILocation(line: 135, column: 16, scope: !2302)
!2314 = !DILocation(line: 135, column: 8, scope: !2302)
!2315 = !DILocation(line: 135, column: 5, scope: !2302)
!2316 = !DILocation(line: 135, column: 14, scope: !2302)
!2317 = !DILocation(line: 136, column: 20, scope: !2302)
!2318 = !DILocation(line: 136, column: 29, scope: !2302)
!2319 = !DILocation(line: 136, column: 32, scope: !2302)
!2320 = !DILocation(line: 136, column: 26, scope: !2302)
!2321 = !DILocation(line: 136, column: 8, scope: !2302)
!2322 = !DILocation(line: 136, column: 5, scope: !2302)
!2323 = !DILocation(line: 136, column: 14, scope: !2302)
!2324 = !DILocation(line: 137, column: 20, scope: !2302)
!2325 = !DILocation(line: 137, column: 16, scope: !2302)
!2326 = !DILocation(line: 137, column: 8, scope: !2302)
!2327 = !DILocation(line: 137, column: 5, scope: !2302)
!2328 = !DILocation(line: 137, column: 14, scope: !2302)
!2329 = !DILocation(line: 129, column: 24, scope: !2299)
!2330 = !DILocation(line: 129, column: 3, scope: !2299)
!2331 = distinct !{!2331, !2300, !2332, !185}
!2332 = !DILocation(line: 138, column: 3, scope: !2296)
!2333 = !DILocation(line: 139, column: 1, scope: !2290)
!2334 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !543, file: !543, line: 151, type: !1140, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2335 = !DILocalVariable(name: "r", arg: 1, scope: !2334, file: !543, line: 151, type: !546)
!2336 = !DILocation(line: 0, scope: !2334)
!2337 = !DILocalVariable(name: "a", arg: 2, scope: !2334, file: !543, line: 151, type: !64)
!2338 = !DILocalVariable(name: "i", scope: !2334, file: !543, line: 153, type: !42)
!2339 = !DILocation(line: 154, column: 7, scope: !2340)
!2340 = distinct !DILexicalBlock(scope: !2334, file: !543, line: 154, column: 3)
!2341 = !DILocation(line: 154, scope: !2340)
!2342 = !DILocation(line: 154, column: 12, scope: !2343)
!2343 = distinct !DILexicalBlock(scope: !2340, file: !543, line: 154, column: 3)
!2344 = !DILocation(line: 154, column: 3, scope: !2340)
!2345 = !DILocation(line: 155, column: 29, scope: !2346)
!2346 = distinct !DILexicalBlock(scope: !2343, file: !543, line: 154, column: 28)
!2347 = !DILocation(line: 155, column: 26, scope: !2346)
!2348 = !DILocation(line: 155, column: 57, scope: !2346)
!2349 = !DILocation(line: 155, column: 54, scope: !2346)
!2350 = !DILocation(line: 155, column: 44, scope: !2346)
!2351 = !DILocation(line: 155, column: 63, scope: !2346)
!2352 = !DILocation(line: 155, column: 70, scope: !2346)
!2353 = !DILocation(line: 155, column: 16, scope: !2346)
!2354 = !DILocation(line: 155, column: 5, scope: !2346)
!2355 = !DILocation(line: 155, column: 22, scope: !2346)
!2356 = !DILocation(line: 156, column: 29, scope: !2346)
!2357 = !DILocation(line: 156, column: 26, scope: !2346)
!2358 = !DILocation(line: 156, column: 35, scope: !2346)
!2359 = !DILocation(line: 156, column: 57, scope: !2346)
!2360 = !DILocation(line: 156, column: 54, scope: !2346)
!2361 = !DILocation(line: 156, column: 44, scope: !2346)
!2362 = !DILocation(line: 156, column: 63, scope: !2346)
!2363 = !DILocation(line: 156, column: 41, scope: !2346)
!2364 = !DILocation(line: 156, column: 16, scope: !2346)
!2365 = !DILocation(line: 156, column: 18, scope: !2346)
!2366 = !DILocation(line: 156, column: 5, scope: !2346)
!2367 = !DILocation(line: 156, column: 22, scope: !2346)
!2368 = !DILocation(line: 154, column: 24, scope: !2343)
!2369 = !DILocation(line: 154, column: 3, scope: !2343)
!2370 = distinct !{!2370, !2344, !2371, !185}
!2371 = !DILocation(line: 157, column: 3, scope: !2340)
!2372 = !DILocation(line: 158, column: 1, scope: !2334)
!2373 = !DILocation(line: 0, scope: !1139)
!2374 = !DILocation(line: 176, column: 7, scope: !1147)
!2375 = !DILocation(line: 176, scope: !1147)
!2376 = !DILocation(line: 176, column: 12, scope: !1150)
!2377 = !DILocation(line: 176, column: 3, scope: !1147)
!2378 = !DILocation(line: 177, column: 5, scope: !1153)
!2379 = !DILocation(line: 177, scope: !1153)
!2380 = !DILocation(line: 177, column: 14, scope: !1158)
!2381 = !DILocation(line: 178, column: 18, scope: !1160)
!2382 = !DILocation(line: 178, column: 20, scope: !1160)
!2383 = !DILocation(line: 178, column: 7, scope: !1160)
!2384 = !DILocation(line: 178, column: 24, scope: !1160)
!2385 = !DILocation(line: 179, column: 27, scope: !1160)
!2386 = !DILocation(line: 179, column: 31, scope: !1160)
!2387 = !DILocation(line: 179, column: 53, scope: !1160)
!2388 = !DILocation(line: 0, scope: !1168, inlinedAt: !2389)
!2389 = distinct !DILocation(line: 179, column: 7, scope: !1160)
!2390 = !DILocation(line: 74, column: 15, scope: !1168, inlinedAt: !2389)
!2391 = !DILocation(line: 74, column: 11, scope: !1168, inlinedAt: !2389)
!2392 = !DILocation(line: 74, column: 6, scope: !1168, inlinedAt: !2389)
!2393 = !DILocation(line: 177, column: 18, scope: !1158)
!2394 = !DILocation(line: 177, column: 5, scope: !1158)
!2395 = distinct !{!2395, !2378, !2396, !185}
!2396 = !DILocation(line: 180, column: 5, scope: !1153)
!2397 = !DILocation(line: 176, column: 24, scope: !1150)
!2398 = !DILocation(line: 176, column: 3, scope: !1150)
!2399 = distinct !{!2399, !2377, !2400, !185}
!2400 = !DILocation(line: 181, column: 3, scope: !1147)
!2401 = !DILocation(line: 182, column: 1, scope: !1139)
!2402 = !DILocalVariable(name: "msg", arg: 1, scope: !1767, file: !543, line: 192, type: !60)
!2403 = !DILocation(line: 0, scope: !1767)
!2404 = !DILocalVariable(name: "a", arg: 2, scope: !1767, file: !543, line: 192, type: !980)
!2405 = !DILocation(line: 197, column: 7, scope: !1766)
!2406 = !DILocation(line: 197, scope: !1766)
!2407 = !DILocation(line: 197, column: 12, scope: !1789)
!2408 = !DILocation(line: 197, column: 3, scope: !1766)
!2409 = !DILocation(line: 198, column: 5, scope: !1791)
!2410 = !DILocation(line: 198, column: 12, scope: !1791)
!2411 = !DILocation(line: 199, column: 9, scope: !1795)
!2412 = !DILocation(line: 199, scope: !1795)
!2413 = !DILocation(line: 199, column: 14, scope: !1798)
!2414 = !DILocation(line: 199, column: 5, scope: !1795)
!2415 = !DILocation(line: 200, column: 23, scope: !1801)
!2416 = !DILocation(line: 200, column: 25, scope: !1801)
!2417 = !DILocation(line: 200, column: 12, scope: !1801)
!2418 = !DILocation(line: 205, column: 9, scope: !1801)
!2419 = !DILocation(line: 206, column: 9, scope: !1801)
!2420 = !DILocation(line: 207, column: 9, scope: !1801)
!2421 = !DILocation(line: 208, column: 19, scope: !1801)
!2422 = !DILocation(line: 208, column: 7, scope: !1801)
!2423 = !DILocation(line: 208, column: 14, scope: !1801)
!2424 = !DILocation(line: 199, column: 18, scope: !1798)
!2425 = !DILocation(line: 199, column: 5, scope: !1798)
!2426 = distinct !{!2426, !2414, !2427, !185}
!2427 = !DILocation(line: 209, column: 5, scope: !1795)
!2428 = !DILocation(line: 197, column: 24, scope: !1789)
!2429 = !DILocation(line: 197, column: 3, scope: !1789)
!2430 = distinct !{!2430, !2408, !2431, !185}
!2431 = !DILocation(line: 210, column: 3, scope: !1766)
!2432 = !DILocation(line: 211, column: 1, scope: !1767)
!2433 = !DILocation(line: 0, scope: !542)
!2434 = !DILocation(line: 227, column: 11, scope: !542)
!2435 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !2436)
!2436 = distinct !DILocation(line: 228, column: 3, scope: !542)
!2437 = !DILocation(line: 0, scope: !562, inlinedAt: !2436)
!2438 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !2436)
!2439 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !2436)
!2440 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !2436)
!2441 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !2442)
!2442 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !2443)
!2443 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !2436)
!2444 = !DILocation(line: 0, scope: !581, inlinedAt: !2443)
!2445 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !2443)
!2446 = !DILocation(line: 0, scope: !579, inlinedAt: !2442)
!2447 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !2442)
!2448 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !2442)
!2449 = !DILocation(line: 0, scope: !600, inlinedAt: !2450)
!2450 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !2443)
!2451 = !DILocation(line: 0, scope: !349, inlinedAt: !2452)
!2452 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !2450)
!2453 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !2452)
!2454 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !2452)
!2455 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !2452)
!2456 = !DILocation(line: 509, scope: !363, inlinedAt: !2452)
!2457 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !2452)
!2458 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !2452)
!2459 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !2452)
!2460 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !2452)
!2461 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !2452)
!2462 = !DILocation(line: 0, scope: !372, inlinedAt: !2463)
!2463 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !2452)
!2464 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !2463)
!2465 = !DILocation(line: 43, scope: !380, inlinedAt: !2463)
!2466 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !2463)
!2467 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !2463)
!2468 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !2463)
!2469 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !2463)
!2470 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !2463)
!2471 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !2463)
!2472 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !2463)
!2473 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !2463)
!2474 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !2463)
!2475 = distinct !{!2475, !2467, !2476, !185}
!2476 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !2463)
!2477 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !2452)
!2478 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !2452)
!2479 = distinct !{!2479, !2458, !2480, !185}
!2480 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !2452)
!2481 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !2452)
!2482 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !2452)
!2483 = distinct !{!2483, !2453, !2484, !185}
!2484 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !2452)
!2485 = !DILocation(line: 732, column: 7, scope: !581, inlinedAt: !2443)
!2486 = !DILocation(line: 0, scope: !641, inlinedAt: !2487)
!2487 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !2443)
!2488 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !2487)
!2489 = !DILocation(line: 0, scope: !648, inlinedAt: !2490)
!2490 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !2487)
!2491 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !2490)
!2492 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !2490)
!2493 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !2490)
!2494 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !2490)
!2495 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !2490)
!2496 = !DILocation(line: 439, scope: !666, inlinedAt: !2490)
!2497 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !2490)
!2498 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !2490)
!2499 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !2490)
!2500 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !2490)
!2501 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !2490)
!2502 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !2490)
!2503 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !2490)
!2504 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !2490)
!2505 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !2490)
!2506 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !2490)
!2507 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !2490)
!2508 = distinct !{!2508, !2499, !2509, !185}
!2509 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !2490)
!2510 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !2490)
!2511 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !2490)
!2512 = distinct !{!2512, !2491, !2513, !185}
!2513 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !2490)
!2514 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !2487)
!2515 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !2487)
!2516 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !2443)
!2517 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !2436)
!2518 = !DILocation(line: 0, scope: !692, inlinedAt: !2519)
!2519 = distinct !DILocation(line: 229, column: 3, scope: !542)
!2520 = !DILocation(line: 115, column: 3, scope: !692, inlinedAt: !2519)
!2521 = !DILocation(line: 230, column: 1, scope: !542)
!2522 = !DILocation(line: 0, scope: !1297)
!2523 = !DILocation(line: 246, column: 11, scope: !1297)
!2524 = !DILocation(line: 47, column: 3, scope: !562, inlinedAt: !2525)
!2525 = distinct !DILocation(line: 247, column: 3, scope: !1297)
!2526 = !DILocation(line: 0, scope: !562, inlinedAt: !2525)
!2527 = !DILocation(line: 45, column: 11, scope: !562, inlinedAt: !2525)
!2528 = !DILocation(line: 48, column: 3, scope: !562, inlinedAt: !2525)
!2529 = !DILocation(line: 48, column: 26, scope: !562, inlinedAt: !2525)
!2530 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !2531)
!2531 = distinct !DILocation(line: 728, column: 3, scope: !581, inlinedAt: !2532)
!2532 = distinct !DILocation(line: 50, column: 3, scope: !562, inlinedAt: !2525)
!2533 = !DILocation(line: 0, scope: !581, inlinedAt: !2532)
!2534 = !DILocation(line: 726, column: 16, scope: !581, inlinedAt: !2532)
!2535 = !DILocation(line: 0, scope: !579, inlinedAt: !2531)
!2536 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !2531)
!2537 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !2531)
!2538 = !DILocation(line: 0, scope: !600, inlinedAt: !2539)
!2539 = distinct !DILocation(line: 730, column: 3, scope: !581, inlinedAt: !2532)
!2540 = !DILocation(line: 0, scope: !349, inlinedAt: !2541)
!2541 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !2539)
!2542 = !DILocation(line: 0, scope: !641, inlinedAt: !2543)
!2543 = distinct !DILocation(line: 733, column: 3, scope: !581, inlinedAt: !2532)
!2544 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !2543)
!2545 = !DILocation(line: 0, scope: !648, inlinedAt: !2546)
!2546 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !2543)
!2547 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !2546)
!2548 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !2546)
!2549 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !2546)
!2550 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !2546)
!2551 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !2546)
!2552 = !DILocation(line: 439, scope: !666, inlinedAt: !2546)
!2553 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !2546)
!2554 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !2546)
!2555 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !2546)
!2556 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !2546)
!2557 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !2546)
!2558 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !2546)
!2559 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !2546)
!2560 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !2546)
!2561 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !2546)
!2562 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !2546)
!2563 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !2546)
!2564 = distinct !{!2564, !2555, !2565, !185}
!2565 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !2546)
!2566 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !2546)
!2567 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !2546)
!2568 = distinct !{!2568, !2547, !2569, !185}
!2569 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !2546)
!2570 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !2543)
!2571 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !2543)
!2572 = !DILocation(line: 734, column: 1, scope: !581, inlinedAt: !2532)
!2573 = !DILocation(line: 51, column: 1, scope: !562, inlinedAt: !2525)
!2574 = !DILocation(line: 0, scope: !1358, inlinedAt: !2575)
!2575 = distinct !DILocation(line: 248, column: 3, scope: !1297)
!2576 = !DILocation(line: 124, column: 3, scope: !1358, inlinedAt: !2575)
!2577 = !DILocation(line: 249, column: 1, scope: !1297)
!2578 = !DILocation(line: 0, scope: !837)
!2579 = !DILocation(line: 263, column: 3, scope: !837)
!2580 = !DILocation(line: 0, scope: !844, inlinedAt: !2581)
!2581 = distinct !DILocation(line: 264, column: 3, scope: !837)
!2582 = !DILocation(line: 326, column: 7, scope: !849, inlinedAt: !2581)
!2583 = !DILocation(line: 326, scope: !849, inlinedAt: !2581)
!2584 = !DILocation(line: 326, column: 12, scope: !852, inlinedAt: !2581)
!2585 = !DILocation(line: 326, column: 3, scope: !849, inlinedAt: !2581)
!2586 = !DILocation(line: 327, column: 35, scope: !852, inlinedAt: !2581)
!2587 = !DILocation(line: 0, scope: !856, inlinedAt: !2588)
!2588 = distinct !DILocation(line: 327, column: 20, scope: !852, inlinedAt: !2581)
!2589 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2588)
!2590 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2588)
!2591 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2588)
!2592 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2588)
!2593 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2588)
!2594 = !DILocation(line: 327, column: 5, scope: !852, inlinedAt: !2581)
!2595 = !DILocation(line: 327, column: 18, scope: !852, inlinedAt: !2581)
!2596 = !DILocation(line: 326, column: 22, scope: !852, inlinedAt: !2581)
!2597 = !DILocation(line: 326, column: 3, scope: !852, inlinedAt: !2581)
!2598 = distinct !{!2598, !2585, !2599, !185}
!2599 = !DILocation(line: 327, column: 47, scope: !849, inlinedAt: !2581)
!2600 = !DILocation(line: 265, column: 1, scope: !837)
!2601 = !DILocation(line: 0, scope: !844)
!2602 = !DILocation(line: 326, column: 7, scope: !849)
!2603 = !DILocation(line: 326, scope: !849)
!2604 = !DILocation(line: 326, column: 12, scope: !852)
!2605 = !DILocation(line: 326, column: 3, scope: !849)
!2606 = !DILocation(line: 327, column: 35, scope: !852)
!2607 = !DILocation(line: 0, scope: !856, inlinedAt: !2608)
!2608 = distinct !DILocation(line: 327, column: 20, scope: !852)
!2609 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2608)
!2610 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2608)
!2611 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2608)
!2612 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2608)
!2613 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2608)
!2614 = !DILocation(line: 327, column: 5, scope: !852)
!2615 = !DILocation(line: 327, column: 18, scope: !852)
!2616 = !DILocation(line: 326, column: 22, scope: !852)
!2617 = !DILocation(line: 326, column: 3, scope: !852)
!2618 = distinct !{!2618, !2605, !2619, !185}
!2619 = !DILocation(line: 327, column: 47, scope: !849)
!2620 = !DILocation(line: 328, column: 1, scope: !844)
!2621 = !DILocation(line: 0, scope: !1488)
!2622 = !DILocation(line: 278, column: 3, scope: !1488)
!2623 = !DILocation(line: 279, column: 1, scope: !1488)
!2624 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !543, file: !543, line: 290, type: !978, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2625 = !DILocalVariable(name: "r", arg: 1, scope: !2624, file: !543, line: 290, type: !546)
!2626 = !DILocation(line: 0, scope: !2624)
!2627 = !DILocalVariable(name: "a", arg: 2, scope: !2624, file: !543, line: 290, type: !980)
!2628 = !DILocalVariable(name: "b", arg: 3, scope: !2624, file: !543, line: 290, type: !980)
!2629 = !DILocalVariable(name: "i", scope: !2624, file: !543, line: 292, type: !42)
!2630 = !DILocation(line: 293, column: 7, scope: !2631)
!2631 = distinct !DILexicalBlock(scope: !2624, file: !543, line: 293, column: 3)
!2632 = !DILocation(line: 293, scope: !2631)
!2633 = !DILocation(line: 293, column: 12, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2631, file: !543, line: 293, column: 3)
!2635 = !DILocation(line: 293, column: 3, scope: !2631)
!2636 = !DILocation(line: 294, column: 25, scope: !2637)
!2637 = distinct !DILexicalBlock(scope: !2634, file: !543, line: 293, column: 28)
!2638 = !DILocation(line: 294, column: 14, scope: !2637)
!2639 = !DILocation(line: 294, column: 42, scope: !2637)
!2640 = !DILocation(line: 294, column: 31, scope: !2637)
!2641 = !DILocation(line: 294, column: 59, scope: !2637)
!2642 = !DILocation(line: 294, column: 48, scope: !2637)
!2643 = !DILocation(line: 294, column: 72, scope: !2637)
!2644 = !DILocation(line: 294, column: 64, scope: !2637)
!2645 = !DILocation(line: 294, column: 5, scope: !2637)
!2646 = !DILocation(line: 295, column: 25, scope: !2637)
!2647 = !DILocation(line: 295, column: 27, scope: !2637)
!2648 = !DILocation(line: 295, column: 14, scope: !2637)
!2649 = !DILocation(line: 295, column: 44, scope: !2637)
!2650 = !DILocation(line: 295, column: 46, scope: !2637)
!2651 = !DILocation(line: 295, column: 33, scope: !2637)
!2652 = !DILocation(line: 295, column: 63, scope: !2637)
!2653 = !DILocation(line: 295, column: 65, scope: !2637)
!2654 = !DILocation(line: 295, column: 52, scope: !2637)
!2655 = !DILocation(line: 295, column: 79, scope: !2637)
!2656 = !DILocation(line: 295, column: 71, scope: !2637)
!2657 = !DILocation(line: 295, column: 70, scope: !2637)
!2658 = !DILocation(line: 295, column: 5, scope: !2637)
!2659 = !DILocation(line: 293, column: 24, scope: !2634)
!2660 = !DILocation(line: 293, column: 3, scope: !2634)
!2661 = distinct !{!2661, !2635, !2662, !185}
!2662 = !DILocation(line: 296, column: 3, scope: !2631)
!2663 = !DILocation(line: 297, column: 1, scope: !2624)
!2664 = !DILocation(line: 0, scope: !929)
!2665 = !DILocation(line: 311, column: 7, scope: !935)
!2666 = !DILocation(line: 311, scope: !935)
!2667 = !DILocation(line: 311, column: 12, scope: !938)
!2668 = !DILocation(line: 311, column: 3, scope: !935)
!2669 = !DILocation(line: 312, column: 47, scope: !938)
!2670 = !DILocation(line: 312, column: 38, scope: !938)
!2671 = !DILocation(line: 312, column: 59, scope: !938)
!2672 = !DILocation(line: 0, scope: !944, inlinedAt: !2673)
!2673 = distinct !DILocation(line: 312, column: 20, scope: !938)
!2674 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2673)
!2675 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2673)
!2676 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2673)
!2677 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2673)
!2678 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2673)
!2679 = !DILocation(line: 312, column: 5, scope: !938)
!2680 = !DILocation(line: 312, column: 18, scope: !938)
!2681 = !DILocation(line: 311, column: 22, scope: !938)
!2682 = !DILocation(line: 311, column: 3, scope: !938)
!2683 = distinct !{!2683, !2668, !2684, !185}
!2684 = !DILocation(line: 312, column: 61, scope: !935)
!2685 = !DILocation(line: 313, column: 1, scope: !929)
!2686 = !DILocation(line: 0, scope: !977)
!2687 = !DILocation(line: 342, column: 7, scope: !988)
!2688 = !DILocation(line: 342, scope: !988)
!2689 = !DILocation(line: 342, column: 12, scope: !991)
!2690 = !DILocation(line: 342, column: 3, scope: !988)
!2691 = !DILocation(line: 343, column: 20, scope: !991)
!2692 = !DILocation(line: 343, column: 35, scope: !991)
!2693 = !DILocation(line: 343, column: 33, scope: !991)
!2694 = !DILocation(line: 343, column: 5, scope: !991)
!2695 = !DILocation(line: 343, column: 18, scope: !991)
!2696 = !DILocation(line: 342, column: 22, scope: !991)
!2697 = !DILocation(line: 342, column: 3, scope: !991)
!2698 = distinct !{!2698, !2690, !2699, !185}
!2699 = !DILocation(line: 343, column: 46, scope: !988)
!2700 = !DILocation(line: 344, column: 1, scope: !977)
!2701 = !DILocation(line: 0, scope: !1739)
!2702 = !DILocation(line: 358, column: 7, scope: !1746)
!2703 = !DILocation(line: 358, scope: !1746)
!2704 = !DILocation(line: 358, column: 12, scope: !1749)
!2705 = !DILocation(line: 358, column: 3, scope: !1746)
!2706 = !DILocation(line: 359, column: 20, scope: !1749)
!2707 = !DILocation(line: 359, column: 35, scope: !1749)
!2708 = !DILocation(line: 359, column: 33, scope: !1749)
!2709 = !DILocation(line: 359, column: 5, scope: !1749)
!2710 = !DILocation(line: 359, column: 18, scope: !1749)
!2711 = !DILocation(line: 358, column: 22, scope: !1749)
!2712 = !DILocation(line: 358, column: 3, scope: !1749)
!2713 = distinct !{!2713, !2705, !2714, !185}
!2714 = !DILocation(line: 359, column: 46, scope: !1746)
!2715 = !DILocation(line: 360, column: 1, scope: !1739)
!2716 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !11, file: !11, line: 80, type: !2717, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2717 = !DISubroutineType(types: !2718)
!2718 = !{null, !464}
!2719 = !DILocalVariable(name: "r", arg: 1, scope: !2716, file: !11, line: 80, type: !464)
!2720 = !DILocation(line: 0, scope: !2716)
!2721 = !DILocalVariable(name: "k", scope: !2716, file: !11, line: 81, type: !42)
!2722 = !DILocalVariable(name: "len", scope: !2716, file: !11, line: 81, type: !42)
!2723 = !DILocation(line: 85, column: 7, scope: !2724)
!2724 = distinct !DILexicalBlock(scope: !2716, file: !11, line: 85, column: 3)
!2725 = !DILocation(line: 85, scope: !2724)
!2726 = !DILocation(line: 84, column: 5, scope: !2716)
!2727 = !DILocation(line: 85, column: 22, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2724, file: !11, line: 85, column: 3)
!2729 = !DILocation(line: 85, column: 3, scope: !2724)
!2730 = !DILocation(line: 86, column: 5, scope: !2731)
!2731 = distinct !DILexicalBlock(scope: !2732, file: !11, line: 86, column: 5)
!2732 = distinct !DILexicalBlock(scope: !2728, file: !11, line: 85, column: 39)
!2733 = !DILocation(line: 86, scope: !2731)
!2734 = !DILocalVariable(name: "start", scope: !2716, file: !11, line: 81, type: !42)
!2735 = !DILocation(line: 86, column: 26, scope: !2736)
!2736 = distinct !DILexicalBlock(scope: !2731, file: !11, line: 86, column: 5)
!2737 = !DILocation(line: 87, column: 14, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2736, file: !11, line: 86, column: 50)
!2739 = !DILocalVariable(name: "zeta", scope: !2716, file: !11, line: 82, type: !14)
!2740 = !DILocalVariable(name: "j", scope: !2716, file: !11, line: 81, type: !42)
!2741 = !DILocation(line: 88, column: 11, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2738, file: !11, line: 88, column: 7)
!2743 = !DILocation(line: 88, scope: !2742)
!2744 = !DILocation(line: 88, column: 32, scope: !2745)
!2745 = distinct !DILexicalBlock(scope: !2742, file: !11, line: 88, column: 7)
!2746 = !DILocation(line: 88, column: 24, scope: !2745)
!2747 = !DILocation(line: 88, column: 7, scope: !2742)
!2748 = !DILocation(line: 89, column: 25, scope: !2749)
!2749 = distinct !DILexicalBlock(scope: !2745, file: !11, line: 88, column: 44)
!2750 = !DILocalVariable(name: "a", arg: 1, scope: !2751, file: !11, line: 68, type: !14)
!2751 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !2752, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2752 = !DISubroutineType(types: !2753)
!2753 = !{!14, !14, !14}
!2754 = !DILocation(line: 0, scope: !2751, inlinedAt: !2755)
!2755 = distinct !DILocation(line: 89, column: 13, scope: !2749)
!2756 = !DILocalVariable(name: "b", arg: 2, scope: !2751, file: !11, line: 68, type: !14)
!2757 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2755)
!2758 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2755)
!2759 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2755)
!2760 = !DILocation(line: 0, scope: !944, inlinedAt: !2761)
!2761 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2755)
!2762 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2761)
!2763 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2761)
!2764 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2761)
!2765 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2761)
!2766 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2761)
!2767 = !DILocalVariable(name: "t", scope: !2716, file: !11, line: 82, type: !14)
!2768 = !DILocation(line: 90, column: 22, scope: !2749)
!2769 = !DILocation(line: 90, column: 27, scope: !2749)
!2770 = !DILocation(line: 90, column: 9, scope: !2749)
!2771 = !DILocation(line: 90, column: 20, scope: !2749)
!2772 = !DILocation(line: 91, column: 16, scope: !2749)
!2773 = !DILocation(line: 91, column: 21, scope: !2749)
!2774 = !DILocation(line: 91, column: 9, scope: !2749)
!2775 = !DILocation(line: 91, column: 14, scope: !2749)
!2776 = !DILocation(line: 88, column: 40, scope: !2745)
!2777 = !DILocation(line: 88, column: 7, scope: !2745)
!2778 = distinct !{!2778, !2747, !2779, !185}
!2779 = !DILocation(line: 92, column: 7, scope: !2742)
!2780 = !DILocation(line: 87, column: 21, scope: !2738)
!2781 = !DILocation(line: 86, column: 43, scope: !2736)
!2782 = !DILocation(line: 86, column: 5, scope: !2736)
!2783 = distinct !{!2783, !2730, !2784, !185}
!2784 = !DILocation(line: 93, column: 5, scope: !2731)
!2785 = !DILocation(line: 85, column: 32, scope: !2728)
!2786 = !DILocation(line: 85, column: 3, scope: !2728)
!2787 = distinct !{!2787, !2729, !2788, !185}
!2788 = !DILocation(line: 94, column: 3, scope: !2724)
!2789 = !DILocation(line: 95, column: 1, scope: !2716)
!2790 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !11, file: !11, line: 106, type: !2717, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2791 = !DILocalVariable(name: "r", arg: 1, scope: !2790, file: !11, line: 106, type: !464)
!2792 = !DILocation(line: 0, scope: !2790)
!2793 = !DILocalVariable(name: "f", scope: !2790, file: !11, line: 109, type: !13)
!2794 = !DILocalVariable(name: "k", scope: !2790, file: !11, line: 107, type: !42)
!2795 = !DILocalVariable(name: "len", scope: !2790, file: !11, line: 107, type: !42)
!2796 = !DILocation(line: 112, column: 7, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2790, file: !11, line: 112, column: 3)
!2798 = !DILocation(line: 112, scope: !2797)
!2799 = !DILocation(line: 111, column: 5, scope: !2790)
!2800 = !DILocation(line: 112, column: 20, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2797, file: !11, line: 112, column: 3)
!2802 = !DILocation(line: 112, column: 3, scope: !2797)
!2803 = !DILocation(line: 113, column: 5, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2805, file: !11, line: 113, column: 5)
!2805 = distinct !DILexicalBlock(scope: !2801, file: !11, line: 112, column: 39)
!2806 = !DILocation(line: 124, column: 3, scope: !2807)
!2807 = distinct !DILexicalBlock(scope: !2790, file: !11, line: 124, column: 3)
!2808 = !DILocation(line: 113, scope: !2804)
!2809 = !DILocalVariable(name: "start", scope: !2790, file: !11, line: 107, type: !42)
!2810 = !DILocation(line: 113, column: 26, scope: !2811)
!2811 = distinct !DILexicalBlock(scope: !2804, file: !11, line: 113, column: 5)
!2812 = !DILocation(line: 114, column: 14, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2811, file: !11, line: 113, column: 50)
!2814 = !DILocalVariable(name: "zeta", scope: !2790, file: !11, line: 108, type: !14)
!2815 = !DILocalVariable(name: "j", scope: !2790, file: !11, line: 107, type: !42)
!2816 = !DILocation(line: 115, column: 11, scope: !2817)
!2817 = distinct !DILexicalBlock(scope: !2813, file: !11, line: 115, column: 7)
!2818 = !DILocation(line: 115, scope: !2817)
!2819 = !DILocation(line: 115, column: 32, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2817, file: !11, line: 115, column: 7)
!2821 = !DILocation(line: 115, column: 24, scope: !2820)
!2822 = !DILocation(line: 115, column: 7, scope: !2817)
!2823 = !DILocation(line: 116, column: 13, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2820, file: !11, line: 115, column: 44)
!2825 = !DILocalVariable(name: "t", scope: !2790, file: !11, line: 108, type: !14)
!2826 = !DILocation(line: 117, column: 35, scope: !2824)
!2827 = !DILocation(line: 117, column: 33, scope: !2824)
!2828 = !DILocation(line: 0, scope: !856, inlinedAt: !2829)
!2829 = distinct !DILocation(line: 117, column: 16, scope: !2824)
!2830 = !DILocation(line: 39, column: 20, scope: !856, inlinedAt: !2829)
!2831 = !DILocation(line: 39, column: 19, scope: !856, inlinedAt: !2829)
!2832 = !DILocation(line: 39, column: 22, scope: !856, inlinedAt: !2829)
!2833 = !DILocation(line: 39, column: 33, scope: !856, inlinedAt: !2829)
!2834 = !DILocation(line: 41, column: 10, scope: !856, inlinedAt: !2829)
!2835 = !DILocation(line: 117, column: 9, scope: !2824)
!2836 = !DILocation(line: 117, column: 14, scope: !2824)
!2837 = !DILocation(line: 118, column: 22, scope: !2824)
!2838 = !DILocation(line: 118, column: 33, scope: !2824)
!2839 = !DILocation(line: 118, column: 9, scope: !2824)
!2840 = !DILocation(line: 118, column: 20, scope: !2824)
!2841 = !DILocation(line: 119, column: 34, scope: !2824)
!2842 = !DILocation(line: 0, scope: !2751, inlinedAt: !2843)
!2843 = distinct !DILocation(line: 119, column: 22, scope: !2824)
!2844 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2843)
!2845 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2843)
!2846 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2843)
!2847 = !DILocation(line: 0, scope: !944, inlinedAt: !2848)
!2848 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2843)
!2849 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2848)
!2850 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2848)
!2851 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2848)
!2852 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2848)
!2853 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2848)
!2854 = !DILocation(line: 119, column: 9, scope: !2824)
!2855 = !DILocation(line: 119, column: 20, scope: !2824)
!2856 = !DILocation(line: 115, column: 40, scope: !2820)
!2857 = !DILocation(line: 115, column: 7, scope: !2820)
!2858 = distinct !{!2858, !2822, !2859, !185}
!2859 = !DILocation(line: 120, column: 7, scope: !2817)
!2860 = !DILocation(line: 114, column: 21, scope: !2813)
!2861 = !DILocation(line: 113, column: 43, scope: !2811)
!2862 = !DILocation(line: 113, column: 5, scope: !2811)
!2863 = distinct !{!2863, !2803, !2864, !185}
!2864 = !DILocation(line: 121, column: 5, scope: !2804)
!2865 = !DILocation(line: 112, column: 32, scope: !2801)
!2866 = !DILocation(line: 112, column: 3, scope: !2801)
!2867 = distinct !{!2867, !2802, !2868, !185}
!2868 = !DILocation(line: 122, column: 3, scope: !2797)
!2869 = !DILocation(line: 124, scope: !2807)
!2870 = !DILocation(line: 124, column: 16, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2807, file: !11, line: 124, column: 3)
!2872 = !DILocation(line: 125, column: 18, scope: !2871)
!2873 = !DILocation(line: 0, scope: !2751, inlinedAt: !2874)
!2874 = distinct !DILocation(line: 125, column: 12, scope: !2871)
!2875 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2874)
!2876 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2874)
!2877 = !DILocation(line: 0, scope: !944, inlinedAt: !2878)
!2878 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2874)
!2879 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2878)
!2880 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2878)
!2881 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2878)
!2882 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2878)
!2883 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2878)
!2884 = !DILocation(line: 125, column: 5, scope: !2871)
!2885 = !DILocation(line: 125, column: 10, scope: !2871)
!2886 = !DILocation(line: 124, column: 24, scope: !2871)
!2887 = !DILocation(line: 124, column: 3, scope: !2871)
!2888 = distinct !{!2888, !2806, !2889, !185}
!2889 = !DILocation(line: 125, column: 25, scope: !2807)
!2890 = !DILocation(line: 126, column: 1, scope: !2790)
!2891 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !11, file: !11, line: 139, type: !2892, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2892 = !DISubroutineType(types: !2893)
!2893 = !{null, !464, !2894, !2894, !14}
!2894 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!2895 = !DILocalVariable(name: "r", arg: 1, scope: !2891, file: !11, line: 139, type: !464)
!2896 = !DILocation(line: 0, scope: !2891)
!2897 = !DILocalVariable(name: "a", arg: 2, scope: !2891, file: !11, line: 139, type: !2894)
!2898 = !DILocalVariable(name: "b", arg: 3, scope: !2891, file: !11, line: 139, type: !2894)
!2899 = !DILocalVariable(name: "zeta", arg: 4, scope: !2891, file: !11, line: 139, type: !14)
!2900 = !DILocation(line: 141, column: 17, scope: !2891)
!2901 = !DILocation(line: 141, column: 23, scope: !2891)
!2902 = !DILocation(line: 0, scope: !2751, inlinedAt: !2903)
!2903 = distinct !DILocation(line: 141, column: 11, scope: !2891)
!2904 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2903)
!2905 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2903)
!2906 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2903)
!2907 = !DILocation(line: 0, scope: !944, inlinedAt: !2908)
!2908 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2903)
!2909 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2908)
!2910 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2908)
!2911 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2908)
!2912 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2908)
!2913 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2908)
!2914 = !DILocation(line: 141, column: 9, scope: !2891)
!2915 = !DILocation(line: 0, scope: !2751, inlinedAt: !2916)
!2916 = distinct !DILocation(line: 142, column: 11, scope: !2891)
!2917 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2916)
!2918 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2916)
!2919 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2916)
!2920 = !DILocation(line: 0, scope: !944, inlinedAt: !2921)
!2921 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2916)
!2922 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2921)
!2923 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2921)
!2924 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2921)
!2925 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2921)
!2926 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2921)
!2927 = !DILocation(line: 142, column: 9, scope: !2891)
!2928 = !DILocation(line: 143, column: 17, scope: !2891)
!2929 = !DILocation(line: 143, column: 23, scope: !2891)
!2930 = !DILocation(line: 0, scope: !2751, inlinedAt: !2931)
!2931 = distinct !DILocation(line: 143, column: 11, scope: !2891)
!2932 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2931)
!2933 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2931)
!2934 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2931)
!2935 = !DILocation(line: 0, scope: !944, inlinedAt: !2936)
!2936 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2931)
!2937 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2936)
!2938 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2936)
!2939 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2936)
!2940 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2936)
!2941 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2936)
!2942 = !DILocation(line: 143, column: 8, scope: !2891)
!2943 = !DILocation(line: 144, column: 17, scope: !2891)
!2944 = !DILocation(line: 144, column: 23, scope: !2891)
!2945 = !DILocation(line: 0, scope: !2751, inlinedAt: !2946)
!2946 = distinct !DILocation(line: 144, column: 11, scope: !2891)
!2947 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2946)
!2948 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2946)
!2949 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2946)
!2950 = !DILocation(line: 0, scope: !944, inlinedAt: !2951)
!2951 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2946)
!2952 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2951)
!2953 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2951)
!2954 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2951)
!2955 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2951)
!2956 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2951)
!2957 = !DILocation(line: 144, column: 3, scope: !2891)
!2958 = !DILocation(line: 144, column: 9, scope: !2891)
!2959 = !DILocation(line: 145, column: 17, scope: !2891)
!2960 = !DILocation(line: 145, column: 23, scope: !2891)
!2961 = !DILocation(line: 0, scope: !2751, inlinedAt: !2962)
!2962 = distinct !DILocation(line: 145, column: 11, scope: !2891)
!2963 = !DILocation(line: 69, column: 28, scope: !2751, inlinedAt: !2962)
!2964 = !DILocation(line: 69, column: 39, scope: !2751, inlinedAt: !2962)
!2965 = !DILocation(line: 69, column: 38, scope: !2751, inlinedAt: !2962)
!2966 = !DILocation(line: 0, scope: !944, inlinedAt: !2967)
!2967 = distinct !DILocation(line: 69, column: 10, scope: !2751, inlinedAt: !2962)
!2968 = !DILocation(line: 21, column: 12, scope: !944, inlinedAt: !2967)
!2969 = !DILocation(line: 21, column: 22, scope: !944, inlinedAt: !2967)
!2970 = !DILocation(line: 21, column: 10, scope: !944, inlinedAt: !2967)
!2971 = !DILocation(line: 21, column: 32, scope: !944, inlinedAt: !2967)
!2972 = !DILocation(line: 21, column: 7, scope: !944, inlinedAt: !2967)
!2973 = !DILocation(line: 145, column: 3, scope: !2891)
!2974 = !DILocation(line: 145, column: 8, scope: !2891)
!2975 = !DILocation(line: 146, column: 1, scope: !2891)
!2976 = !DILocation(line: 0, scope: !692)
!2977 = !DILocation(line: 115, column: 3, scope: !692)
!2978 = !DILocation(line: 119, column: 1, scope: !692)
!2979 = distinct !DISubprogram(name: "cbd3", scope: !693, file: !693, line: 89, type: !694, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2980 = !DILocalVariable(name: "r", arg: 1, scope: !2979, file: !693, line: 89, type: !696)
!2981 = !DILocation(line: 0, scope: !2979)
!2982 = !DILocalVariable(name: "buf", arg: 2, scope: !2979, file: !693, line: 89, type: !64)
!2983 = !DILocalVariable(name: "i", scope: !2979, file: !693, line: 91, type: !42)
!2984 = !DILocation(line: 95, column: 7, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2979, file: !693, line: 95, column: 3)
!2986 = !DILocation(line: 95, scope: !2985)
!2987 = !DILocation(line: 95, column: 12, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2985, file: !693, line: 95, column: 3)
!2989 = !DILocation(line: 95, column: 3, scope: !2985)
!2990 = !DILocation(line: 96, column: 35, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2988, file: !693, line: 95, column: 28)
!2992 = !DILocation(line: 96, column: 33, scope: !2991)
!2993 = !DILocalVariable(name: "x", arg: 1, scope: !2994, file: !693, line: 37, type: !64)
!2994 = distinct !DISubprogram(name: "load24_littleendian", scope: !693, file: !693, line: 37, type: !2995, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2995 = !DISubroutineType(types: !2996)
!2996 = !{!40, !64}
!2997 = !DILocation(line: 0, scope: !2994, inlinedAt: !2998)
!2998 = distinct !DILocation(line: 96, column: 10, scope: !2991)
!2999 = !DILocation(line: 40, column: 18, scope: !2994, inlinedAt: !2998)
!3000 = !DILocation(line: 40, column: 8, scope: !2994, inlinedAt: !2998)
!3001 = !DILocalVariable(name: "r", scope: !2994, file: !693, line: 39, type: !40)
!3002 = !DILocation(line: 41, column: 18, scope: !2994, inlinedAt: !2998)
!3003 = !DILocation(line: 41, column: 8, scope: !2994, inlinedAt: !2998)
!3004 = !DILocation(line: 41, column: 23, scope: !2994, inlinedAt: !2998)
!3005 = !DILocation(line: 41, column: 5, scope: !2994, inlinedAt: !2998)
!3006 = !DILocation(line: 42, column: 18, scope: !2994, inlinedAt: !2998)
!3007 = !DILocation(line: 42, column: 8, scope: !2994, inlinedAt: !2998)
!3008 = !DILocation(line: 42, column: 23, scope: !2994, inlinedAt: !2998)
!3009 = !DILocation(line: 42, column: 5, scope: !2994, inlinedAt: !2998)
!3010 = !DILocalVariable(name: "t", scope: !2979, file: !693, line: 92, type: !40)
!3011 = !DILocation(line: 97, column: 12, scope: !2991)
!3012 = !DILocalVariable(name: "d", scope: !2979, file: !693, line: 92, type: !40)
!3013 = !DILocation(line: 98, column: 12, scope: !2991)
!3014 = !DILocation(line: 98, column: 17, scope: !2991)
!3015 = !DILocation(line: 98, column: 7, scope: !2991)
!3016 = !DILocation(line: 99, column: 12, scope: !2991)
!3017 = !DILocation(line: 99, column: 17, scope: !2991)
!3018 = !DILocation(line: 99, column: 7, scope: !2991)
!3019 = !DILocalVariable(name: "j", scope: !2979, file: !693, line: 91, type: !42)
!3020 = !DILocation(line: 101, column: 9, scope: !3021)
!3021 = distinct !DILexicalBlock(scope: !2991, file: !693, line: 101, column: 5)
!3022 = !DILocation(line: 101, scope: !3021)
!3023 = !DILocation(line: 101, column: 14, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3021, file: !693, line: 101, column: 5)
!3025 = !DILocation(line: 101, column: 5, scope: !3021)
!3026 = !DILocation(line: 102, column: 19, scope: !3027)
!3027 = distinct !DILexicalBlock(scope: !3024, file: !693, line: 101, column: 22)
!3028 = !DILocation(line: 102, column: 14, scope: !3027)
!3029 = !DILocation(line: 102, column: 11, scope: !3027)
!3030 = !DILocalVariable(name: "a", scope: !2979, file: !693, line: 93, type: !14)
!3031 = !DILocation(line: 103, column: 19, scope: !3027)
!3032 = !DILocation(line: 103, column: 21, scope: !3027)
!3033 = !DILocation(line: 103, column: 14, scope: !3027)
!3034 = !DILocation(line: 103, column: 11, scope: !3027)
!3035 = !DILocalVariable(name: "b", scope: !2979, file: !693, line: 93, type: !14)
!3036 = !DILocation(line: 104, column: 28, scope: !3027)
!3037 = !DILocation(line: 104, column: 26, scope: !3027)
!3038 = !DILocation(line: 104, column: 18, scope: !3027)
!3039 = !DILocation(line: 104, column: 20, scope: !3027)
!3040 = !DILocation(line: 104, column: 7, scope: !3027)
!3041 = !DILocation(line: 104, column: 24, scope: !3027)
!3042 = !DILocation(line: 101, column: 18, scope: !3024)
!3043 = !DILocation(line: 101, column: 5, scope: !3024)
!3044 = distinct !{!3044, !3025, !3045, !185}
!3045 = !DILocation(line: 105, column: 5, scope: !3021)
!3046 = !DILocation(line: 95, column: 24, scope: !2988)
!3047 = !DILocation(line: 95, column: 3, scope: !2988)
!3048 = distinct !{!3048, !2989, !3049, !185}
!3049 = !DILocation(line: 106, column: 3, scope: !2985)
!3050 = !DILocation(line: 107, column: 1, scope: !2979)
!3051 = !DILocation(line: 0, scope: !1358)
!3052 = !DILocation(line: 124, column: 3, scope: !1358)
!3053 = !DILocation(line: 128, column: 1, scope: !1358)
!3054 = distinct !DISubprogram(name: "cbd2", scope: !693, file: !693, line: 58, type: !694, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!3055 = !DILocalVariable(name: "r", arg: 1, scope: !3054, file: !693, line: 58, type: !696)
!3056 = !DILocation(line: 0, scope: !3054)
!3057 = !DILocalVariable(name: "buf", arg: 2, scope: !3054, file: !693, line: 58, type: !64)
!3058 = !DILocalVariable(name: "i", scope: !3054, file: !693, line: 60, type: !42)
!3059 = !DILocation(line: 64, column: 7, scope: !3060)
!3060 = distinct !DILexicalBlock(scope: !3054, file: !693, line: 64, column: 3)
!3061 = !DILocation(line: 64, scope: !3060)
!3062 = !DILocation(line: 64, column: 12, scope: !3063)
!3063 = distinct !DILexicalBlock(scope: !3060, file: !693, line: 64, column: 3)
!3064 = !DILocation(line: 64, column: 3, scope: !3060)
!3065 = !DILocation(line: 65, column: 35, scope: !3066)
!3066 = distinct !DILexicalBlock(scope: !3063, file: !693, line: 64, column: 28)
!3067 = !DILocation(line: 65, column: 33, scope: !3066)
!3068 = !DILocalVariable(name: "x", arg: 1, scope: !3069, file: !693, line: 15, type: !64)
!3069 = distinct !DISubprogram(name: "load32_littleendian", scope: !693, file: !693, line: 15, type: !2995, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!3070 = !DILocation(line: 0, scope: !3069, inlinedAt: !3071)
!3071 = distinct !DILocation(line: 65, column: 10, scope: !3066)
!3072 = !DILocation(line: 18, column: 18, scope: !3069, inlinedAt: !3071)
!3073 = !DILocation(line: 18, column: 8, scope: !3069, inlinedAt: !3071)
!3074 = !DILocalVariable(name: "r", scope: !3069, file: !693, line: 17, type: !40)
!3075 = !DILocation(line: 19, column: 18, scope: !3069, inlinedAt: !3071)
!3076 = !DILocation(line: 19, column: 8, scope: !3069, inlinedAt: !3071)
!3077 = !DILocation(line: 19, column: 23, scope: !3069, inlinedAt: !3071)
!3078 = !DILocation(line: 19, column: 5, scope: !3069, inlinedAt: !3071)
!3079 = !DILocation(line: 20, column: 18, scope: !3069, inlinedAt: !3071)
!3080 = !DILocation(line: 20, column: 8, scope: !3069, inlinedAt: !3071)
!3081 = !DILocation(line: 20, column: 23, scope: !3069, inlinedAt: !3071)
!3082 = !DILocation(line: 20, column: 5, scope: !3069, inlinedAt: !3071)
!3083 = !DILocation(line: 21, column: 18, scope: !3069, inlinedAt: !3071)
!3084 = !DILocation(line: 21, column: 8, scope: !3069, inlinedAt: !3071)
!3085 = !DILocation(line: 21, column: 23, scope: !3069, inlinedAt: !3071)
!3086 = !DILocation(line: 21, column: 5, scope: !3069, inlinedAt: !3071)
!3087 = !DILocalVariable(name: "t", scope: !3054, file: !693, line: 61, type: !40)
!3088 = !DILocation(line: 66, column: 12, scope: !3066)
!3089 = !DILocalVariable(name: "d", scope: !3054, file: !693, line: 61, type: !40)
!3090 = !DILocation(line: 67, column: 12, scope: !3066)
!3091 = !DILocation(line: 67, column: 17, scope: !3066)
!3092 = !DILocation(line: 67, column: 7, scope: !3066)
!3093 = !DILocalVariable(name: "j", scope: !3054, file: !693, line: 60, type: !42)
!3094 = !DILocation(line: 69, column: 9, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3066, file: !693, line: 69, column: 5)
!3096 = !DILocation(line: 69, scope: !3095)
!3097 = !DILocation(line: 69, column: 14, scope: !3098)
!3098 = distinct !DILexicalBlock(scope: !3095, file: !693, line: 69, column: 5)
!3099 = !DILocation(line: 69, column: 5, scope: !3095)
!3100 = !DILocation(line: 70, column: 19, scope: !3101)
!3101 = distinct !DILexicalBlock(scope: !3098, file: !693, line: 69, column: 22)
!3102 = !DILocation(line: 70, column: 14, scope: !3101)
!3103 = !DILocation(line: 70, column: 11, scope: !3101)
!3104 = !DILocalVariable(name: "a", scope: !3054, file: !693, line: 62, type: !14)
!3105 = !DILocation(line: 71, column: 19, scope: !3101)
!3106 = !DILocation(line: 71, column: 21, scope: !3101)
!3107 = !DILocation(line: 71, column: 14, scope: !3101)
!3108 = !DILocation(line: 71, column: 11, scope: !3101)
!3109 = !DILocalVariable(name: "b", scope: !3054, file: !693, line: 62, type: !14)
!3110 = !DILocation(line: 72, column: 28, scope: !3101)
!3111 = !DILocation(line: 72, column: 26, scope: !3101)
!3112 = !DILocation(line: 72, column: 18, scope: !3101)
!3113 = !DILocation(line: 72, column: 20, scope: !3101)
!3114 = !DILocation(line: 72, column: 7, scope: !3101)
!3115 = !DILocation(line: 72, column: 24, scope: !3101)
!3116 = !DILocation(line: 69, column: 18, scope: !3098)
!3117 = !DILocation(line: 69, column: 5, scope: !3098)
!3118 = distinct !{!3118, !3099, !3119, !185}
!3119 = !DILocation(line: 73, column: 5, scope: !3095)
!3120 = !DILocation(line: 64, column: 24, scope: !3063)
!3121 = !DILocation(line: 64, column: 3, scope: !3063)
!3122 = distinct !{!3122, !3064, !3123, !185}
!3123 = !DILocation(line: 74, column: 3, scope: !3060)
!3124 = !DILocation(line: 75, column: 1, scope: !3054)
!3125 = !DILocation(line: 0, scope: !944)
!3126 = !DILocation(line: 21, column: 12, scope: !944)
!3127 = !DILocation(line: 21, column: 22, scope: !944)
!3128 = !DILocation(line: 21, column: 10, scope: !944)
!3129 = !DILocation(line: 21, column: 32, scope: !944)
!3130 = !DILocation(line: 21, column: 7, scope: !944)
!3131 = !DILocation(line: 22, column: 3, scope: !944)
!3132 = !DILocation(line: 0, scope: !856)
!3133 = !DILocation(line: 39, column: 20, scope: !856)
!3134 = !DILocation(line: 39, column: 19, scope: !856)
!3135 = !DILocation(line: 39, column: 22, scope: !856)
!3136 = !DILocation(line: 39, column: 33, scope: !856)
!3137 = !DILocation(line: 41, column: 10, scope: !856)
!3138 = !DILocation(line: 41, column: 3, scope: !856)
!3139 = !DILocation(line: 0, scope: !159)
!3140 = !DILocation(line: 21, column: 7, scope: !172)
!3141 = !DILocation(line: 21, scope: !172)
!3142 = !DILocation(line: 21, column: 12, scope: !175)
!3143 = !DILocation(line: 21, column: 3, scope: !172)
!3144 = !DILocation(line: 22, column: 10, scope: !175)
!3145 = !DILocation(line: 22, column: 17, scope: !175)
!3146 = !DILocation(line: 22, column: 15, scope: !175)
!3147 = !DILocation(line: 22, column: 7, scope: !175)
!3148 = !DILocation(line: 21, column: 18, scope: !175)
!3149 = !DILocation(line: 21, column: 3, scope: !175)
!3150 = distinct !{!3150, !3143, !3151, !185}
!3151 = !DILocation(line: 22, column: 20, scope: !172)
!3152 = !DILocation(line: 24, column: 25, scope: !159)
!3153 = !DILocation(line: 24, column: 10, scope: !159)
!3154 = !DILocation(line: 24, column: 3, scope: !159)
!3155 = !DILocation(line: 0, scope: !191)
!3156 = !DILocation(line: 51, column: 3, scope: !191)
!3157 = !DILocation(line: 54, column: 7, scope: !191)
!3158 = !DILocation(line: 55, column: 7, scope: !204)
!3159 = !DILocation(line: 55, scope: !204)
!3160 = !DILocation(line: 55, column: 12, scope: !207)
!3161 = !DILocation(line: 55, column: 3, scope: !204)
!3162 = !DILocation(line: 56, column: 18, scope: !207)
!3163 = !DILocation(line: 56, column: 25, scope: !207)
!3164 = !DILocation(line: 56, column: 23, scope: !207)
!3165 = !DILocation(line: 56, column: 15, scope: !207)
!3166 = !DILocation(line: 56, column: 5, scope: !207)
!3167 = !DILocation(line: 56, column: 10, scope: !207)
!3168 = !DILocation(line: 55, column: 18, scope: !207)
!3169 = !DILocation(line: 55, column: 3, scope: !207)
!3170 = distinct !{!3170, !3161, !3171, !185}
!3171 = !DILocation(line: 56, column: 29, scope: !204)
!3172 = !DILocation(line: 57, column: 1, scope: !191)
!3173 = !DILocation(line: 0, scope: !1168)
!3174 = !DILocation(line: 73, column: 7, scope: !1168)
!3175 = !DILocation(line: 74, column: 15, scope: !1168)
!3176 = !DILocation(line: 74, column: 19, scope: !1168)
!3177 = !DILocation(line: 74, column: 11, scope: !1168)
!3178 = !DILocation(line: 74, column: 6, scope: !1168)
!3179 = !DILocation(line: 75, column: 1, scope: !1168)
!3180 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !3181, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3181 = !DISubroutineType(types: !3182)
!3182 = !{null, !311}
!3183 = !DILocalVariable(name: "state", arg: 1, scope: !3180, file: !27, line: 523, type: !311)
!3184 = !DILocation(line: 0, scope: !3180)
!3185 = !DILocalVariable(name: "s", arg: 1, scope: !3186, file: !27, line: 353, type: !352)
!3186 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !3187, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3187 = !DISubroutineType(types: !3188)
!3188 = !{null, !352}
!3189 = !DILocation(line: 0, scope: !3186, inlinedAt: !3190)
!3190 = distinct !DILocation(line: 525, column: 3, scope: !3180)
!3191 = !DILocalVariable(name: "i", scope: !3186, file: !27, line: 355, type: !42)
!3192 = !DILocation(line: 356, column: 7, scope: !3193, inlinedAt: !3190)
!3193 = distinct !DILexicalBlock(scope: !3186, file: !27, line: 356, column: 3)
!3194 = !DILocation(line: 356, scope: !3193, inlinedAt: !3190)
!3195 = !DILocation(line: 356, column: 12, scope: !3196, inlinedAt: !3190)
!3196 = distinct !DILexicalBlock(scope: !3193, file: !27, line: 356, column: 3)
!3197 = !DILocation(line: 356, column: 3, scope: !3193, inlinedAt: !3190)
!3198 = !DILocation(line: 357, column: 5, scope: !3196, inlinedAt: !3190)
!3199 = !DILocation(line: 357, column: 10, scope: !3196, inlinedAt: !3190)
!3200 = !DILocation(line: 356, column: 17, scope: !3196, inlinedAt: !3190)
!3201 = !DILocation(line: 356, column: 3, scope: !3196, inlinedAt: !3190)
!3202 = distinct !{!3202, !3197, !3203, !185}
!3203 = !DILocation(line: 357, column: 12, scope: !3193, inlinedAt: !3190)
!3204 = !DILocation(line: 526, column: 10, scope: !3180)
!3205 = !DILocation(line: 526, column: 14, scope: !3180)
!3206 = !DILocation(line: 527, column: 1, scope: !3180)
!3207 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !309, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3208 = !DILocalVariable(name: "state", arg: 1, scope: !3207, file: !27, line: 538, type: !311)
!3209 = !DILocation(line: 0, scope: !3207)
!3210 = !DILocalVariable(name: "in", arg: 2, scope: !3207, file: !27, line: 538, type: !64)
!3211 = !DILocalVariable(name: "inlen", arg: 3, scope: !3207, file: !27, line: 538, type: !163)
!3212 = !DILocation(line: 540, column: 47, scope: !3207)
!3213 = !DILocation(line: 540, column: 16, scope: !3207)
!3214 = !DILocation(line: 540, column: 10, scope: !3207)
!3215 = !DILocation(line: 540, column: 14, scope: !3207)
!3216 = !DILocation(line: 541, column: 1, scope: !3207)
!3217 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !3218, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3218 = !DISubroutineType(types: !3219)
!3219 = !{!42, !352, !42, !42, !64, !163}
!3220 = !DILocalVariable(name: "s", arg: 1, scope: !3217, file: !27, line: 373, type: !352)
!3221 = !DILocation(line: 0, scope: !3217)
!3222 = !DILocalVariable(name: "pos", arg: 2, scope: !3217, file: !27, line: 374, type: !42)
!3223 = !DILocalVariable(name: "r", arg: 3, scope: !3217, file: !27, line: 375, type: !42)
!3224 = !DILocalVariable(name: "in", arg: 4, scope: !3217, file: !27, line: 376, type: !64)
!3225 = !DILocalVariable(name: "inlen", arg: 5, scope: !3217, file: !27, line: 377, type: !163)
!3226 = !DILocation(line: 381, column: 3, scope: !3217)
!3227 = !DILocation(line: 381, column: 12, scope: !3217)
!3228 = !DILocation(line: 381, column: 19, scope: !3217)
!3229 = !DILocation(line: 382, column: 5, scope: !3230)
!3230 = distinct !DILexicalBlock(scope: !3231, file: !27, line: 382, column: 5)
!3231 = distinct !DILexicalBlock(scope: !3217, file: !27, line: 381, column: 25)
!3232 = !DILocation(line: 389, column: 3, scope: !3233)
!3233 = distinct !DILexicalBlock(scope: !3217, file: !27, line: 389, column: 3)
!3234 = !DILocation(line: 382, scope: !3230)
!3235 = !DILocalVariable(name: "i", scope: !3217, file: !27, line: 379, type: !42)
!3236 = !DILocation(line: 382, column: 16, scope: !3237)
!3237 = distinct !DILexicalBlock(scope: !3230, file: !27, line: 382, column: 5)
!3238 = !DILocation(line: 383, column: 27, scope: !3237)
!3239 = !DILocation(line: 383, column: 17, scope: !3237)
!3240 = !DILocation(line: 383, column: 37, scope: !3237)
!3241 = !DILocation(line: 383, column: 33, scope: !3237)
!3242 = !DILocation(line: 383, column: 10, scope: !3237)
!3243 = !DILocation(line: 383, column: 7, scope: !3237)
!3244 = !DILocation(line: 383, column: 14, scope: !3237)
!3245 = !DILocation(line: 383, column: 30, scope: !3237)
!3246 = !DILocation(line: 382, column: 20, scope: !3237)
!3247 = !DILocation(line: 382, column: 5, scope: !3237)
!3248 = distinct !{!3248, !3229, !3249, !185}
!3249 = !DILocation(line: 383, column: 42, scope: !3230)
!3250 = !DILocation(line: 384, column: 15, scope: !3231)
!3251 = !DILocation(line: 384, column: 11, scope: !3231)
!3252 = !DILocation(line: 385, column: 5, scope: !3231)
!3253 = distinct !{!3253, !3226, !3254, !185}
!3254 = !DILocation(line: 387, column: 3, scope: !3217)
!3255 = !DILocation(line: 389, scope: !3233)
!3256 = !DILocation(line: 389, column: 18, scope: !3257)
!3257 = distinct !DILexicalBlock(scope: !3233, file: !27, line: 389, column: 3)
!3258 = !DILocation(line: 389, column: 14, scope: !3257)
!3259 = !DILocation(line: 390, column: 25, scope: !3257)
!3260 = !DILocation(line: 390, column: 15, scope: !3257)
!3261 = !DILocation(line: 390, column: 35, scope: !3257)
!3262 = !DILocation(line: 390, column: 31, scope: !3257)
!3263 = !DILocation(line: 390, column: 8, scope: !3257)
!3264 = !DILocation(line: 390, column: 5, scope: !3257)
!3265 = !DILocation(line: 390, column: 12, scope: !3257)
!3266 = !DILocation(line: 390, column: 28, scope: !3257)
!3267 = !DILocation(line: 389, column: 26, scope: !3257)
!3268 = !DILocation(line: 389, column: 3, scope: !3257)
!3269 = distinct !{!3269, !3232, !3270, !185}
!3270 = !DILocation(line: 390, column: 40, scope: !3233)
!3271 = !DILocation(line: 392, column: 3, scope: !3217)
!3272 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !3187, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3273 = !DILocalVariable(name: "state", arg: 1, scope: !3272, file: !27, line: 82, type: !352)
!3274 = !DILocation(line: 0, scope: !3272)
!3275 = !DILocation(line: 100, column: 15, scope: !3272)
!3276 = !DILocalVariable(name: "Aba", scope: !3272, file: !27, line: 86, type: !23)
!3277 = !DILocation(line: 101, column: 15, scope: !3272)
!3278 = !DILocalVariable(name: "Abe", scope: !3272, file: !27, line: 86, type: !23)
!3279 = !DILocation(line: 102, column: 15, scope: !3272)
!3280 = !DILocalVariable(name: "Abi", scope: !3272, file: !27, line: 86, type: !23)
!3281 = !DILocation(line: 103, column: 15, scope: !3272)
!3282 = !DILocalVariable(name: "Abo", scope: !3272, file: !27, line: 86, type: !23)
!3283 = !DILocation(line: 104, column: 15, scope: !3272)
!3284 = !DILocalVariable(name: "Abu", scope: !3272, file: !27, line: 86, type: !23)
!3285 = !DILocation(line: 105, column: 15, scope: !3272)
!3286 = !DILocalVariable(name: "Aga", scope: !3272, file: !27, line: 87, type: !23)
!3287 = !DILocation(line: 106, column: 15, scope: !3272)
!3288 = !DILocalVariable(name: "Age", scope: !3272, file: !27, line: 87, type: !23)
!3289 = !DILocation(line: 107, column: 15, scope: !3272)
!3290 = !DILocalVariable(name: "Agi", scope: !3272, file: !27, line: 87, type: !23)
!3291 = !DILocation(line: 108, column: 15, scope: !3272)
!3292 = !DILocalVariable(name: "Ago", scope: !3272, file: !27, line: 87, type: !23)
!3293 = !DILocation(line: 109, column: 15, scope: !3272)
!3294 = !DILocalVariable(name: "Agu", scope: !3272, file: !27, line: 87, type: !23)
!3295 = !DILocation(line: 110, column: 15, scope: !3272)
!3296 = !DILocalVariable(name: "Aka", scope: !3272, file: !27, line: 88, type: !23)
!3297 = !DILocation(line: 111, column: 15, scope: !3272)
!3298 = !DILocalVariable(name: "Ake", scope: !3272, file: !27, line: 88, type: !23)
!3299 = !DILocation(line: 112, column: 15, scope: !3272)
!3300 = !DILocalVariable(name: "Aki", scope: !3272, file: !27, line: 88, type: !23)
!3301 = !DILocation(line: 113, column: 15, scope: !3272)
!3302 = !DILocalVariable(name: "Ako", scope: !3272, file: !27, line: 88, type: !23)
!3303 = !DILocation(line: 114, column: 15, scope: !3272)
!3304 = !DILocalVariable(name: "Aku", scope: !3272, file: !27, line: 88, type: !23)
!3305 = !DILocation(line: 115, column: 15, scope: !3272)
!3306 = !DILocalVariable(name: "Ama", scope: !3272, file: !27, line: 89, type: !23)
!3307 = !DILocation(line: 116, column: 15, scope: !3272)
!3308 = !DILocalVariable(name: "Ame", scope: !3272, file: !27, line: 89, type: !23)
!3309 = !DILocation(line: 117, column: 15, scope: !3272)
!3310 = !DILocalVariable(name: "Ami", scope: !3272, file: !27, line: 89, type: !23)
!3311 = !DILocation(line: 118, column: 15, scope: !3272)
!3312 = !DILocalVariable(name: "Amo", scope: !3272, file: !27, line: 89, type: !23)
!3313 = !DILocation(line: 119, column: 15, scope: !3272)
!3314 = !DILocalVariable(name: "Amu", scope: !3272, file: !27, line: 89, type: !23)
!3315 = !DILocation(line: 120, column: 15, scope: !3272)
!3316 = !DILocalVariable(name: "Asa", scope: !3272, file: !27, line: 90, type: !23)
!3317 = !DILocation(line: 121, column: 15, scope: !3272)
!3318 = !DILocalVariable(name: "Ase", scope: !3272, file: !27, line: 90, type: !23)
!3319 = !DILocation(line: 122, column: 15, scope: !3272)
!3320 = !DILocalVariable(name: "Asi", scope: !3272, file: !27, line: 90, type: !23)
!3321 = !DILocation(line: 123, column: 15, scope: !3272)
!3322 = !DILocalVariable(name: "Aso", scope: !3272, file: !27, line: 90, type: !23)
!3323 = !DILocation(line: 124, column: 15, scope: !3272)
!3324 = !DILocalVariable(name: "Asu", scope: !3272, file: !27, line: 90, type: !23)
!3325 = !DILocalVariable(name: "round", scope: !3272, file: !27, line: 84, type: !9)
!3326 = !DILocation(line: 126, column: 13, scope: !3327)
!3327 = distinct !DILexicalBlock(scope: !3272, file: !27, line: 126, column: 9)
!3328 = !DILocation(line: 126, scope: !3327)
!3329 = !DILocation(line: 126, column: 30, scope: !3330)
!3330 = distinct !DILexicalBlock(scope: !3327, file: !27, line: 126, column: 9)
!3331 = !DILocation(line: 126, column: 9, scope: !3327)
!3332 = !DILocalVariable(name: "BCa", scope: !3272, file: !27, line: 91, type: !23)
!3333 = !DILocalVariable(name: "BCe", scope: !3272, file: !27, line: 91, type: !23)
!3334 = !DILocalVariable(name: "BCi", scope: !3272, file: !27, line: 91, type: !23)
!3335 = !DILocalVariable(name: "BCo", scope: !3272, file: !27, line: 91, type: !23)
!3336 = !DILocalVariable(name: "BCu", scope: !3272, file: !27, line: 91, type: !23)
!3337 = !DILocalVariable(name: "Da", scope: !3272, file: !27, line: 92, type: !23)
!3338 = !DILocalVariable(name: "De", scope: !3272, file: !27, line: 92, type: !23)
!3339 = !DILocalVariable(name: "Di", scope: !3272, file: !27, line: 92, type: !23)
!3340 = !DILocalVariable(name: "Do", scope: !3272, file: !27, line: 92, type: !23)
!3341 = !DILocalVariable(name: "Du", scope: !3272, file: !27, line: 92, type: !23)
!3342 = !DILocalVariable(name: "Eba", scope: !3272, file: !27, line: 93, type: !23)
!3343 = !DILocalVariable(name: "Ebe", scope: !3272, file: !27, line: 93, type: !23)
!3344 = !DILocalVariable(name: "Ebi", scope: !3272, file: !27, line: 93, type: !23)
!3345 = !DILocalVariable(name: "Ebo", scope: !3272, file: !27, line: 93, type: !23)
!3346 = !DILocalVariable(name: "Ebu", scope: !3272, file: !27, line: 93, type: !23)
!3347 = !DILocalVariable(name: "Ega", scope: !3272, file: !27, line: 94, type: !23)
!3348 = !DILocalVariable(name: "Ege", scope: !3272, file: !27, line: 94, type: !23)
!3349 = !DILocalVariable(name: "Egi", scope: !3272, file: !27, line: 94, type: !23)
!3350 = !DILocalVariable(name: "Ego", scope: !3272, file: !27, line: 94, type: !23)
!3351 = !DILocalVariable(name: "Egu", scope: !3272, file: !27, line: 94, type: !23)
!3352 = !DILocalVariable(name: "Eka", scope: !3272, file: !27, line: 95, type: !23)
!3353 = !DILocalVariable(name: "Eke", scope: !3272, file: !27, line: 95, type: !23)
!3354 = !DILocalVariable(name: "Eki", scope: !3272, file: !27, line: 95, type: !23)
!3355 = !DILocalVariable(name: "Eko", scope: !3272, file: !27, line: 95, type: !23)
!3356 = !DILocalVariable(name: "Eku", scope: !3272, file: !27, line: 95, type: !23)
!3357 = !DILocalVariable(name: "Ema", scope: !3272, file: !27, line: 96, type: !23)
!3358 = !DILocalVariable(name: "Eme", scope: !3272, file: !27, line: 96, type: !23)
!3359 = !DILocalVariable(name: "Emi", scope: !3272, file: !27, line: 96, type: !23)
!3360 = !DILocalVariable(name: "Emo", scope: !3272, file: !27, line: 96, type: !23)
!3361 = !DILocalVariable(name: "Emu", scope: !3272, file: !27, line: 96, type: !23)
!3362 = !DILocalVariable(name: "Esa", scope: !3272, file: !27, line: 97, type: !23)
!3363 = !DILocalVariable(name: "Ese", scope: !3272, file: !27, line: 97, type: !23)
!3364 = !DILocalVariable(name: "Esi", scope: !3272, file: !27, line: 97, type: !23)
!3365 = !DILocalVariable(name: "Eso", scope: !3272, file: !27, line: 97, type: !23)
!3366 = !DILocalVariable(name: "Esu", scope: !3272, file: !27, line: 97, type: !23)
!3367 = !DILocation(line: 130, column: 22, scope: !3368)
!3368 = distinct !DILexicalBlock(scope: !3330, file: !27, line: 126, column: 53)
!3369 = !DILocation(line: 130, column: 26, scope: !3368)
!3370 = !DILocation(line: 130, column: 30, scope: !3368)
!3371 = !DILocation(line: 130, column: 34, scope: !3368)
!3372 = !DILocation(line: 132, column: 22, scope: !3368)
!3373 = !DILocation(line: 132, column: 26, scope: !3368)
!3374 = !DILocation(line: 132, column: 30, scope: !3368)
!3375 = !DILocation(line: 132, column: 34, scope: !3368)
!3376 = !DILocation(line: 138, column: 22, scope: !3368)
!3377 = !DILocation(line: 138, column: 21, scope: !3368)
!3378 = !DILocation(line: 208, column: 17, scope: !3368)
!3379 = !DILocation(line: 209, column: 19, scope: !3368)
!3380 = !DILocation(line: 129, column: 22, scope: !3368)
!3381 = !DILocation(line: 129, column: 26, scope: !3368)
!3382 = !DILocation(line: 129, column: 30, scope: !3368)
!3383 = !DILocation(line: 129, column: 34, scope: !3368)
!3384 = !DILocation(line: 135, column: 22, scope: !3368)
!3385 = !DILocation(line: 135, column: 21, scope: !3368)
!3386 = !DILocation(line: 212, column: 17, scope: !3368)
!3387 = !DILocation(line: 213, column: 19, scope: !3368)
!3388 = !DILocation(line: 131, column: 22, scope: !3368)
!3389 = !DILocation(line: 131, column: 26, scope: !3368)
!3390 = !DILocation(line: 131, column: 30, scope: !3368)
!3391 = !DILocation(line: 131, column: 34, scope: !3368)
!3392 = !DILocation(line: 128, column: 22, scope: !3368)
!3393 = !DILocation(line: 128, column: 26, scope: !3368)
!3394 = !DILocation(line: 128, column: 30, scope: !3368)
!3395 = !DILocation(line: 128, column: 34, scope: !3368)
!3396 = !DILocation(line: 139, column: 22, scope: !3368)
!3397 = !DILocation(line: 139, column: 21, scope: !3368)
!3398 = !DILocation(line: 210, column: 17, scope: !3368)
!3399 = !DILocation(line: 211, column: 19, scope: !3368)
!3400 = !DILocation(line: 217, column: 28, scope: !3368)
!3401 = !DILocation(line: 217, column: 33, scope: !3368)
!3402 = !DILocation(line: 217, column: 25, scope: !3368)
!3403 = !DILocation(line: 137, column: 22, scope: !3368)
!3404 = !DILocation(line: 137, column: 21, scope: !3368)
!3405 = !DILocation(line: 145, column: 17, scope: !3368)
!3406 = !DILocation(line: 146, column: 19, scope: !3368)
!3407 = !DILocation(line: 136, column: 22, scope: !3368)
!3408 = !DILocation(line: 136, column: 21, scope: !3368)
!3409 = !DILocation(line: 143, column: 17, scope: !3368)
!3410 = !DILocation(line: 144, column: 19, scope: !3368)
!3411 = !DILocation(line: 151, column: 28, scope: !3368)
!3412 = !DILocation(line: 151, column: 33, scope: !3368)
!3413 = !DILocation(line: 152, column: 30, scope: !3368)
!3414 = !DILocation(line: 152, column: 17, scope: !3368)
!3415 = !DILocation(line: 141, column: 17, scope: !3368)
!3416 = !DILocation(line: 158, column: 17, scope: !3368)
!3417 = !DILocation(line: 159, column: 19, scope: !3368)
!3418 = !DILocation(line: 162, column: 17, scope: !3368)
!3419 = !DILocation(line: 163, column: 19, scope: !3368)
!3420 = !DILocation(line: 160, column: 17, scope: !3368)
!3421 = !DILocation(line: 161, column: 19, scope: !3368)
!3422 = !DILocation(line: 168, column: 28, scope: !3368)
!3423 = !DILocation(line: 168, column: 33, scope: !3368)
!3424 = !DILocation(line: 168, column: 25, scope: !3368)
!3425 = !DILocation(line: 223, column: 22, scope: !3368)
!3426 = !DILocation(line: 174, column: 17, scope: !3368)
!3427 = !DILocation(line: 175, column: 19, scope: !3368)
!3428 = !DILocation(line: 178, column: 17, scope: !3368)
!3429 = !DILocation(line: 179, column: 19, scope: !3368)
!3430 = !DILocation(line: 176, column: 17, scope: !3368)
!3431 = !DILocation(line: 177, column: 19, scope: !3368)
!3432 = !DILocation(line: 184, column: 28, scope: !3368)
!3433 = !DILocation(line: 184, column: 33, scope: !3368)
!3434 = !DILocation(line: 184, column: 25, scope: !3368)
!3435 = !DILocation(line: 223, column: 26, scope: !3368)
!3436 = !DILocation(line: 190, column: 17, scope: !3368)
!3437 = !DILocation(line: 191, column: 19, scope: !3368)
!3438 = !DILocation(line: 194, column: 17, scope: !3368)
!3439 = !DILocation(line: 195, column: 19, scope: !3368)
!3440 = !DILocation(line: 192, column: 17, scope: !3368)
!3441 = !DILocation(line: 193, column: 19, scope: !3368)
!3442 = !DILocation(line: 200, column: 28, scope: !3368)
!3443 = !DILocation(line: 200, column: 33, scope: !3368)
!3444 = !DILocation(line: 200, column: 25, scope: !3368)
!3445 = !DILocation(line: 223, column: 30, scope: !3368)
!3446 = !DILocation(line: 206, column: 17, scope: !3368)
!3447 = !DILocation(line: 207, column: 19, scope: !3368)
!3448 = !DILocation(line: 216, column: 28, scope: !3368)
!3449 = !DILocation(line: 216, column: 33, scope: !3368)
!3450 = !DILocation(line: 216, column: 25, scope: !3368)
!3451 = !DILocation(line: 223, column: 34, scope: !3368)
!3452 = !DILocation(line: 149, column: 17, scope: !3368)
!3453 = !DILocation(line: 150, column: 19, scope: !3368)
!3454 = !DILocation(line: 147, column: 17, scope: !3368)
!3455 = !DILocation(line: 148, column: 19, scope: !3368)
!3456 = !DILocation(line: 154, column: 28, scope: !3368)
!3457 = !DILocation(line: 154, column: 33, scope: !3368)
!3458 = !DILocation(line: 154, column: 25, scope: !3368)
!3459 = !DILocation(line: 166, column: 17, scope: !3368)
!3460 = !DILocation(line: 167, column: 19, scope: !3368)
!3461 = !DILocation(line: 164, column: 17, scope: !3368)
!3462 = !DILocation(line: 165, column: 19, scope: !3368)
!3463 = !DILocation(line: 170, column: 28, scope: !3368)
!3464 = !DILocation(line: 170, column: 33, scope: !3368)
!3465 = !DILocation(line: 170, column: 25, scope: !3368)
!3466 = !DILocation(line: 225, column: 22, scope: !3368)
!3467 = !DILocation(line: 182, column: 17, scope: !3368)
!3468 = !DILocation(line: 183, column: 19, scope: !3368)
!3469 = !DILocation(line: 180, column: 17, scope: !3368)
!3470 = !DILocation(line: 181, column: 19, scope: !3368)
!3471 = !DILocation(line: 186, column: 28, scope: !3368)
!3472 = !DILocation(line: 186, column: 33, scope: !3368)
!3473 = !DILocation(line: 186, column: 25, scope: !3368)
!3474 = !DILocation(line: 225, column: 26, scope: !3368)
!3475 = !DILocation(line: 198, column: 17, scope: !3368)
!3476 = !DILocation(line: 199, column: 19, scope: !3368)
!3477 = !DILocation(line: 196, column: 17, scope: !3368)
!3478 = !DILocation(line: 197, column: 19, scope: !3368)
!3479 = !DILocation(line: 202, column: 28, scope: !3368)
!3480 = !DILocation(line: 202, column: 33, scope: !3368)
!3481 = !DILocation(line: 202, column: 25, scope: !3368)
!3482 = !DILocation(line: 225, column: 30, scope: !3368)
!3483 = !DILocation(line: 214, column: 17, scope: !3368)
!3484 = !DILocation(line: 215, column: 19, scope: !3368)
!3485 = !DILocation(line: 218, column: 28, scope: !3368)
!3486 = !DILocation(line: 218, column: 33, scope: !3368)
!3487 = !DILocation(line: 218, column: 25, scope: !3368)
!3488 = !DILocation(line: 225, column: 34, scope: !3368)
!3489 = !DILocation(line: 231, column: 22, scope: !3368)
!3490 = !DILocation(line: 231, column: 21, scope: !3368)
!3491 = !DILocation(line: 309, column: 17, scope: !3368)
!3492 = !DILocation(line: 310, column: 19, scope: !3368)
!3493 = !DILocation(line: 171, column: 28, scope: !3368)
!3494 = !DILocation(line: 171, column: 33, scope: !3368)
!3495 = !DILocation(line: 171, column: 25, scope: !3368)
!3496 = !DILocation(line: 156, column: 28, scope: !3368)
!3497 = !DILocation(line: 156, column: 33, scope: !3368)
!3498 = !DILocation(line: 156, column: 25, scope: !3368)
!3499 = !DILocation(line: 172, column: 28, scope: !3368)
!3500 = !DILocation(line: 172, column: 33, scope: !3368)
!3501 = !DILocation(line: 172, column: 25, scope: !3368)
!3502 = !DILocation(line: 227, column: 22, scope: !3368)
!3503 = !DILocation(line: 188, column: 28, scope: !3368)
!3504 = !DILocation(line: 188, column: 33, scope: !3368)
!3505 = !DILocation(line: 188, column: 25, scope: !3368)
!3506 = !DILocation(line: 227, column: 26, scope: !3368)
!3507 = !DILocation(line: 204, column: 28, scope: !3368)
!3508 = !DILocation(line: 204, column: 33, scope: !3368)
!3509 = !DILocation(line: 204, column: 25, scope: !3368)
!3510 = !DILocation(line: 227, column: 30, scope: !3368)
!3511 = !DILocation(line: 220, column: 28, scope: !3368)
!3512 = !DILocation(line: 220, column: 33, scope: !3368)
!3513 = !DILocation(line: 220, column: 25, scope: !3368)
!3514 = !DILocation(line: 227, column: 34, scope: !3368)
!3515 = !DILocation(line: 233, column: 22, scope: !3368)
!3516 = !DILocation(line: 233, column: 21, scope: !3368)
!3517 = !DILocation(line: 303, column: 17, scope: !3368)
!3518 = !DILocation(line: 304, column: 19, scope: !3368)
!3519 = !DILocation(line: 153, column: 28, scope: !3368)
!3520 = !DILocation(line: 153, column: 33, scope: !3368)
!3521 = !DILocation(line: 153, column: 25, scope: !3368)
!3522 = !DILocation(line: 169, column: 28, scope: !3368)
!3523 = !DILocation(line: 169, column: 33, scope: !3368)
!3524 = !DILocation(line: 169, column: 25, scope: !3368)
!3525 = !DILocation(line: 224, column: 22, scope: !3368)
!3526 = !DILocation(line: 185, column: 28, scope: !3368)
!3527 = !DILocation(line: 185, column: 33, scope: !3368)
!3528 = !DILocation(line: 185, column: 25, scope: !3368)
!3529 = !DILocation(line: 224, column: 26, scope: !3368)
!3530 = !DILocation(line: 201, column: 28, scope: !3368)
!3531 = !DILocation(line: 201, column: 33, scope: !3368)
!3532 = !DILocation(line: 201, column: 25, scope: !3368)
!3533 = !DILocation(line: 224, column: 30, scope: !3368)
!3534 = !DILocation(line: 224, column: 34, scope: !3368)
!3535 = !DILocation(line: 155, column: 28, scope: !3368)
!3536 = !DILocation(line: 155, column: 33, scope: !3368)
!3537 = !DILocation(line: 155, column: 25, scope: !3368)
!3538 = !DILocation(line: 226, column: 22, scope: !3368)
!3539 = !DILocation(line: 187, column: 28, scope: !3368)
!3540 = !DILocation(line: 187, column: 33, scope: !3368)
!3541 = !DILocation(line: 187, column: 25, scope: !3368)
!3542 = !DILocation(line: 226, column: 26, scope: !3368)
!3543 = !DILocation(line: 203, column: 28, scope: !3368)
!3544 = !DILocation(line: 203, column: 33, scope: !3368)
!3545 = !DILocation(line: 203, column: 25, scope: !3368)
!3546 = !DILocation(line: 226, column: 30, scope: !3368)
!3547 = !DILocation(line: 219, column: 28, scope: !3368)
!3548 = !DILocation(line: 219, column: 33, scope: !3368)
!3549 = !DILocation(line: 219, column: 25, scope: !3368)
!3550 = !DILocation(line: 226, column: 34, scope: !3368)
!3551 = !DILocation(line: 232, column: 22, scope: !3368)
!3552 = !DILocation(line: 232, column: 21, scope: !3368)
!3553 = !DILocation(line: 301, column: 17, scope: !3368)
!3554 = !DILocation(line: 302, column: 19, scope: !3368)
!3555 = !DILocation(line: 315, column: 28, scope: !3368)
!3556 = !DILocation(line: 315, column: 33, scope: !3368)
!3557 = !DILocation(line: 315, column: 25, scope: !3368)
!3558 = !DILocation(line: 230, column: 22, scope: !3368)
!3559 = !DILocation(line: 230, column: 21, scope: !3368)
!3560 = !DILocation(line: 307, column: 17, scope: !3368)
!3561 = !DILocation(line: 308, column: 19, scope: !3368)
!3562 = !DILocation(line: 314, column: 28, scope: !3368)
!3563 = !DILocation(line: 314, column: 33, scope: !3368)
!3564 = !DILocation(line: 314, column: 25, scope: !3368)
!3565 = !DILocation(line: 234, column: 22, scope: !3368)
!3566 = !DILocation(line: 234, column: 21, scope: !3368)
!3567 = !DILocation(line: 305, column: 17, scope: !3368)
!3568 = !DILocation(line: 306, column: 19, scope: !3368)
!3569 = !DILocation(line: 313, column: 28, scope: !3368)
!3570 = !DILocation(line: 313, column: 33, scope: !3368)
!3571 = !DILocation(line: 313, column: 25, scope: !3368)
!3572 = !DILocation(line: 312, column: 28, scope: !3368)
!3573 = !DILocation(line: 312, column: 33, scope: !3368)
!3574 = !DILocation(line: 312, column: 25, scope: !3368)
!3575 = !DILocation(line: 311, column: 28, scope: !3368)
!3576 = !DILocation(line: 311, column: 33, scope: !3368)
!3577 = !DILocation(line: 311, column: 25, scope: !3368)
!3578 = !DILocation(line: 293, column: 17, scope: !3368)
!3579 = !DILocation(line: 294, column: 19, scope: !3368)
!3580 = !DILocation(line: 287, column: 17, scope: !3368)
!3581 = !DILocation(line: 288, column: 19, scope: !3368)
!3582 = !DILocation(line: 285, column: 17, scope: !3368)
!3583 = !DILocation(line: 286, column: 19, scope: !3368)
!3584 = !DILocation(line: 299, column: 28, scope: !3368)
!3585 = !DILocation(line: 299, column: 33, scope: !3368)
!3586 = !DILocation(line: 299, column: 25, scope: !3368)
!3587 = !DILocation(line: 291, column: 17, scope: !3368)
!3588 = !DILocation(line: 292, column: 19, scope: !3368)
!3589 = !DILocation(line: 298, column: 28, scope: !3368)
!3590 = !DILocation(line: 298, column: 33, scope: !3368)
!3591 = !DILocation(line: 298, column: 25, scope: !3368)
!3592 = !DILocation(line: 289, column: 17, scope: !3368)
!3593 = !DILocation(line: 290, column: 19, scope: !3368)
!3594 = !DILocation(line: 297, column: 28, scope: !3368)
!3595 = !DILocation(line: 297, column: 33, scope: !3368)
!3596 = !DILocation(line: 297, column: 25, scope: !3368)
!3597 = !DILocation(line: 296, column: 28, scope: !3368)
!3598 = !DILocation(line: 296, column: 33, scope: !3368)
!3599 = !DILocation(line: 296, column: 25, scope: !3368)
!3600 = !DILocation(line: 295, column: 28, scope: !3368)
!3601 = !DILocation(line: 295, column: 33, scope: !3368)
!3602 = !DILocation(line: 295, column: 25, scope: !3368)
!3603 = !DILocation(line: 277, column: 17, scope: !3368)
!3604 = !DILocation(line: 278, column: 19, scope: !3368)
!3605 = !DILocation(line: 271, column: 17, scope: !3368)
!3606 = !DILocation(line: 272, column: 19, scope: !3368)
!3607 = !DILocation(line: 269, column: 17, scope: !3368)
!3608 = !DILocation(line: 270, column: 19, scope: !3368)
!3609 = !DILocation(line: 283, column: 28, scope: !3368)
!3610 = !DILocation(line: 283, column: 33, scope: !3368)
!3611 = !DILocation(line: 283, column: 25, scope: !3368)
!3612 = !DILocation(line: 275, column: 17, scope: !3368)
!3613 = !DILocation(line: 276, column: 19, scope: !3368)
!3614 = !DILocation(line: 282, column: 28, scope: !3368)
!3615 = !DILocation(line: 282, column: 33, scope: !3368)
!3616 = !DILocation(line: 282, column: 25, scope: !3368)
!3617 = !DILocation(line: 273, column: 17, scope: !3368)
!3618 = !DILocation(line: 274, column: 19, scope: !3368)
!3619 = !DILocation(line: 281, column: 28, scope: !3368)
!3620 = !DILocation(line: 281, column: 33, scope: !3368)
!3621 = !DILocation(line: 281, column: 25, scope: !3368)
!3622 = !DILocation(line: 280, column: 28, scope: !3368)
!3623 = !DILocation(line: 280, column: 33, scope: !3368)
!3624 = !DILocation(line: 280, column: 25, scope: !3368)
!3625 = !DILocation(line: 279, column: 28, scope: !3368)
!3626 = !DILocation(line: 279, column: 33, scope: !3368)
!3627 = !DILocation(line: 279, column: 25, scope: !3368)
!3628 = !DILocation(line: 261, column: 17, scope: !3368)
!3629 = !DILocation(line: 262, column: 19, scope: !3368)
!3630 = !DILocation(line: 255, column: 17, scope: !3368)
!3631 = !DILocation(line: 256, column: 19, scope: !3368)
!3632 = !DILocation(line: 253, column: 17, scope: !3368)
!3633 = !DILocation(line: 254, column: 19, scope: !3368)
!3634 = !DILocation(line: 267, column: 28, scope: !3368)
!3635 = !DILocation(line: 267, column: 33, scope: !3368)
!3636 = !DILocation(line: 267, column: 25, scope: !3368)
!3637 = !DILocation(line: 259, column: 17, scope: !3368)
!3638 = !DILocation(line: 260, column: 19, scope: !3368)
!3639 = !DILocation(line: 266, column: 28, scope: !3368)
!3640 = !DILocation(line: 266, column: 33, scope: !3368)
!3641 = !DILocation(line: 266, column: 25, scope: !3368)
!3642 = !DILocation(line: 257, column: 17, scope: !3368)
!3643 = !DILocation(line: 258, column: 19, scope: !3368)
!3644 = !DILocation(line: 265, column: 28, scope: !3368)
!3645 = !DILocation(line: 265, column: 33, scope: !3368)
!3646 = !DILocation(line: 265, column: 25, scope: !3368)
!3647 = !DILocation(line: 264, column: 28, scope: !3368)
!3648 = !DILocation(line: 264, column: 33, scope: !3368)
!3649 = !DILocation(line: 264, column: 25, scope: !3368)
!3650 = !DILocation(line: 263, column: 28, scope: !3368)
!3651 = !DILocation(line: 263, column: 33, scope: !3368)
!3652 = !DILocation(line: 263, column: 25, scope: !3368)
!3653 = !DILocation(line: 244, column: 17, scope: !3368)
!3654 = !DILocation(line: 245, column: 19, scope: !3368)
!3655 = !DILocation(line: 238, column: 17, scope: !3368)
!3656 = !DILocation(line: 239, column: 19, scope: !3368)
!3657 = !DILocation(line: 236, column: 17, scope: !3368)
!3658 = !DILocation(line: 251, column: 28, scope: !3368)
!3659 = !DILocation(line: 251, column: 33, scope: !3368)
!3660 = !DILocation(line: 251, column: 25, scope: !3368)
!3661 = !DILocation(line: 242, column: 17, scope: !3368)
!3662 = !DILocation(line: 243, column: 19, scope: !3368)
!3663 = !DILocation(line: 250, column: 28, scope: !3368)
!3664 = !DILocation(line: 250, column: 33, scope: !3368)
!3665 = !DILocation(line: 250, column: 25, scope: !3368)
!3666 = !DILocation(line: 240, column: 17, scope: !3368)
!3667 = !DILocation(line: 241, column: 19, scope: !3368)
!3668 = !DILocation(line: 249, column: 28, scope: !3368)
!3669 = !DILocation(line: 249, column: 33, scope: !3368)
!3670 = !DILocation(line: 249, column: 25, scope: !3368)
!3671 = !DILocation(line: 248, column: 28, scope: !3368)
!3672 = !DILocation(line: 248, column: 33, scope: !3368)
!3673 = !DILocation(line: 248, column: 25, scope: !3368)
!3674 = !DILocation(line: 247, column: 58, scope: !3368)
!3675 = !DILocation(line: 247, column: 30, scope: !3368)
!3676 = !DILocation(line: 246, column: 28, scope: !3368)
!3677 = !DILocation(line: 246, column: 33, scope: !3368)
!3678 = !DILocation(line: 247, column: 17, scope: !3368)
!3679 = !DILocation(line: 126, column: 47, scope: !3330)
!3680 = !DILocation(line: 126, column: 9, scope: !3330)
!3681 = distinct !{!3681, !3331, !3682, !185}
!3682 = !DILocation(line: 316, column: 9, scope: !3327)
!3683 = !DILocation(line: 319, column: 19, scope: !3272)
!3684 = !DILocation(line: 320, column: 9, scope: !3272)
!3685 = !DILocation(line: 320, column: 19, scope: !3272)
!3686 = !DILocation(line: 321, column: 9, scope: !3272)
!3687 = !DILocation(line: 321, column: 19, scope: !3272)
!3688 = !DILocation(line: 322, column: 9, scope: !3272)
!3689 = !DILocation(line: 322, column: 19, scope: !3272)
!3690 = !DILocation(line: 323, column: 9, scope: !3272)
!3691 = !DILocation(line: 323, column: 19, scope: !3272)
!3692 = !DILocation(line: 324, column: 9, scope: !3272)
!3693 = !DILocation(line: 324, column: 19, scope: !3272)
!3694 = !DILocation(line: 325, column: 9, scope: !3272)
!3695 = !DILocation(line: 325, column: 19, scope: !3272)
!3696 = !DILocation(line: 326, column: 9, scope: !3272)
!3697 = !DILocation(line: 326, column: 19, scope: !3272)
!3698 = !DILocation(line: 327, column: 9, scope: !3272)
!3699 = !DILocation(line: 327, column: 19, scope: !3272)
!3700 = !DILocation(line: 328, column: 9, scope: !3272)
!3701 = !DILocation(line: 328, column: 19, scope: !3272)
!3702 = !DILocation(line: 329, column: 9, scope: !3272)
!3703 = !DILocation(line: 329, column: 19, scope: !3272)
!3704 = !DILocation(line: 330, column: 9, scope: !3272)
!3705 = !DILocation(line: 330, column: 19, scope: !3272)
!3706 = !DILocation(line: 331, column: 9, scope: !3272)
!3707 = !DILocation(line: 331, column: 19, scope: !3272)
!3708 = !DILocation(line: 332, column: 9, scope: !3272)
!3709 = !DILocation(line: 332, column: 19, scope: !3272)
!3710 = !DILocation(line: 333, column: 9, scope: !3272)
!3711 = !DILocation(line: 333, column: 19, scope: !3272)
!3712 = !DILocation(line: 334, column: 9, scope: !3272)
!3713 = !DILocation(line: 334, column: 19, scope: !3272)
!3714 = !DILocation(line: 335, column: 9, scope: !3272)
!3715 = !DILocation(line: 335, column: 19, scope: !3272)
!3716 = !DILocation(line: 336, column: 9, scope: !3272)
!3717 = !DILocation(line: 336, column: 19, scope: !3272)
!3718 = !DILocation(line: 337, column: 9, scope: !3272)
!3719 = !DILocation(line: 337, column: 19, scope: !3272)
!3720 = !DILocation(line: 338, column: 9, scope: !3272)
!3721 = !DILocation(line: 338, column: 19, scope: !3272)
!3722 = !DILocation(line: 339, column: 9, scope: !3272)
!3723 = !DILocation(line: 339, column: 19, scope: !3272)
!3724 = !DILocation(line: 340, column: 9, scope: !3272)
!3725 = !DILocation(line: 340, column: 19, scope: !3272)
!3726 = !DILocation(line: 341, column: 9, scope: !3272)
!3727 = !DILocation(line: 341, column: 19, scope: !3272)
!3728 = !DILocation(line: 342, column: 9, scope: !3272)
!3729 = !DILocation(line: 342, column: 19, scope: !3272)
!3730 = !DILocation(line: 343, column: 9, scope: !3272)
!3731 = !DILocation(line: 343, column: 19, scope: !3272)
!3732 = !DILocation(line: 344, column: 1, scope: !3272)
!3733 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !3181, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3734 = !DILocalVariable(name: "state", arg: 1, scope: !3733, file: !27, line: 550, type: !311)
!3735 = !DILocation(line: 0, scope: !3733)
!3736 = !DILocation(line: 552, column: 36, scope: !3733)
!3737 = !DILocalVariable(name: "s", arg: 1, scope: !3738, file: !27, line: 405, type: !352)
!3738 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !3739, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3739 = !DISubroutineType(types: !3740)
!3740 = !{null, !352, !42, !42, !61}
!3741 = !DILocation(line: 0, scope: !3738, inlinedAt: !3742)
!3742 = distinct !DILocation(line: 552, column: 3, scope: !3733)
!3743 = !DILocalVariable(name: "pos", arg: 2, scope: !3738, file: !27, line: 405, type: !42)
!3744 = !DILocalVariable(name: "r", arg: 3, scope: !3738, file: !27, line: 405, type: !42)
!3745 = !DILocalVariable(name: "p", arg: 4, scope: !3738, file: !27, line: 405, type: !61)
!3746 = !DILocation(line: 407, column: 31, scope: !3738, inlinedAt: !3742)
!3747 = !DILocation(line: 407, column: 27, scope: !3738, inlinedAt: !3742)
!3748 = !DILocation(line: 407, column: 8, scope: !3738, inlinedAt: !3742)
!3749 = !DILocation(line: 407, column: 3, scope: !3738, inlinedAt: !3742)
!3750 = !DILocation(line: 407, column: 12, scope: !3738, inlinedAt: !3742)
!3751 = !DILocation(line: 408, column: 3, scope: !3738, inlinedAt: !3742)
!3752 = !DILocation(line: 408, column: 12, scope: !3738, inlinedAt: !3742)
!3753 = !DILocation(line: 553, column: 10, scope: !3733)
!3754 = !DILocation(line: 553, column: 14, scope: !3733)
!3755 = !DILocation(line: 554, column: 1, scope: !3733)
!3756 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !342, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3757 = !DILocalVariable(name: "out", arg: 1, scope: !3756, file: !27, line: 566, type: !60)
!3758 = !DILocation(line: 0, scope: !3756)
!3759 = !DILocalVariable(name: "outlen", arg: 2, scope: !3756, file: !27, line: 566, type: !163)
!3760 = !DILocalVariable(name: "state", arg: 3, scope: !3756, file: !27, line: 566, type: !311)
!3761 = !DILocation(line: 568, column: 61, scope: !3756)
!3762 = !DILocation(line: 0, scope: !648, inlinedAt: !3763)
!3763 = distinct !DILocation(line: 568, column: 16, scope: !3756)
!3764 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !3763)
!3765 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !3763)
!3766 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !3763)
!3767 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !3763)
!3768 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !3763)
!3769 = !DILocation(line: 439, scope: !666, inlinedAt: !3763)
!3770 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !3763)
!3771 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !3763)
!3772 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !3763)
!3773 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !3763)
!3774 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !3763)
!3775 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !3763)
!3776 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !3763)
!3777 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !3763)
!3778 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !3763)
!3779 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !3763)
!3780 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !3763)
!3781 = distinct !{!3781, !3772, !3782, !185}
!3782 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !3763)
!3783 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !3763)
!3784 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !3763)
!3785 = distinct !{!3785, !3764, !3786, !185}
!3786 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !3763)
!3787 = !DILocation(line: 568, column: 10, scope: !3756)
!3788 = !DILocation(line: 568, column: 14, scope: !3756)
!3789 = !DILocation(line: 569, column: 1, scope: !3756)
!3790 = !DILocation(line: 0, scope: !308)
!3791 = !DILocation(line: 582, column: 3, scope: !308)
!3792 = !DILocation(line: 583, column: 10, scope: !308)
!3793 = !DILocation(line: 583, column: 14, scope: !308)
!3794 = !DILocation(line: 584, column: 1, scope: !308)
!3795 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !3796, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3796 = !DISubroutineType(types: !3797)
!3797 = !{null, !352, !42, !64, !163, !61}
!3798 = !DILocalVariable(name: "s", arg: 1, scope: !3795, file: !27, line: 461, type: !352)
!3799 = !DILocation(line: 0, scope: !3795)
!3800 = !DILocalVariable(name: "r", arg: 2, scope: !3795, file: !27, line: 462, type: !42)
!3801 = !DILocalVariable(name: "in", arg: 3, scope: !3795, file: !27, line: 463, type: !64)
!3802 = !DILocalVariable(name: "inlen", arg: 4, scope: !3795, file: !27, line: 464, type: !163)
!3803 = !DILocalVariable(name: "p", arg: 5, scope: !3795, file: !27, line: 465, type: !61)
!3804 = !DILocalVariable(name: "i", scope: !3795, file: !27, line: 467, type: !42)
!3805 = !DILocation(line: 469, column: 7, scope: !3806)
!3806 = distinct !DILexicalBlock(scope: !3795, file: !27, line: 469, column: 3)
!3807 = !DILocation(line: 469, scope: !3806)
!3808 = !DILocation(line: 469, column: 12, scope: !3809)
!3809 = distinct !DILexicalBlock(scope: !3806, file: !27, line: 469, column: 3)
!3810 = !DILocation(line: 469, column: 3, scope: !3806)
!3811 = !DILocation(line: 472, column: 3, scope: !3795)
!3812 = !DILocation(line: 470, column: 5, scope: !3809)
!3813 = !DILocation(line: 470, column: 10, scope: !3809)
!3814 = !DILocation(line: 469, column: 17, scope: !3809)
!3815 = !DILocation(line: 469, column: 3, scope: !3809)
!3816 = distinct !{!3816, !3810, !3817, !185}
!3817 = !DILocation(line: 470, column: 12, scope: !3806)
!3818 = !DILocation(line: 472, column: 15, scope: !3795)
!3819 = !DILocation(line: 473, column: 5, scope: !3820)
!3820 = distinct !DILexicalBlock(scope: !3821, file: !27, line: 473, column: 5)
!3821 = distinct !DILexicalBlock(scope: !3795, file: !27, line: 472, column: 21)
!3822 = !DILocation(line: 480, column: 3, scope: !3823)
!3823 = distinct !DILexicalBlock(scope: !3795, file: !27, line: 480, column: 3)
!3824 = !DILocation(line: 473, scope: !3820)
!3825 = !DILocation(line: 473, column: 14, scope: !3826)
!3826 = distinct !DILexicalBlock(scope: !3820, file: !27, line: 473, column: 5)
!3827 = !DILocation(line: 474, column: 26, scope: !3826)
!3828 = !DILocation(line: 474, column: 24, scope: !3826)
!3829 = !DILocalVariable(name: "x", arg: 1, scope: !3830, file: !27, line: 22, type: !64)
!3830 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !3831, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3831 = !DISubroutineType(types: !3832)
!3832 = !{!23, !64}
!3833 = !DILocation(line: 0, scope: !3830, inlinedAt: !3834)
!3834 = distinct !DILocation(line: 474, column: 15, scope: !3826)
!3835 = !DILocalVariable(name: "r", scope: !3830, file: !27, line: 24, type: !23)
!3836 = !DILocalVariable(name: "i", scope: !3830, file: !27, line: 23, type: !42)
!3837 = !DILocation(line: 26, column: 7, scope: !3838, inlinedAt: !3834)
!3838 = distinct !DILexicalBlock(scope: !3830, file: !27, line: 26, column: 3)
!3839 = !DILocation(line: 26, scope: !3838, inlinedAt: !3834)
!3840 = !DILocation(line: 26, column: 12, scope: !3841, inlinedAt: !3834)
!3841 = distinct !DILexicalBlock(scope: !3838, file: !27, line: 26, column: 3)
!3842 = !DILocation(line: 26, column: 3, scope: !3838, inlinedAt: !3834)
!3843 = !DILocation(line: 27, column: 20, scope: !3841, inlinedAt: !3834)
!3844 = !DILocation(line: 27, column: 10, scope: !3841, inlinedAt: !3834)
!3845 = !DILocation(line: 27, column: 29, scope: !3841, inlinedAt: !3834)
!3846 = !DILocation(line: 27, column: 25, scope: !3841, inlinedAt: !3834)
!3847 = !DILocation(line: 27, column: 7, scope: !3841, inlinedAt: !3834)
!3848 = !DILocation(line: 26, column: 16, scope: !3841, inlinedAt: !3834)
!3849 = !DILocation(line: 26, column: 3, scope: !3841, inlinedAt: !3834)
!3850 = distinct !{!3850, !3842, !3851, !185}
!3851 = !DILocation(line: 27, column: 30, scope: !3838, inlinedAt: !3834)
!3852 = !DILocation(line: 474, column: 7, scope: !3826)
!3853 = !DILocation(line: 474, column: 12, scope: !3826)
!3854 = !DILocation(line: 473, column: 20, scope: !3826)
!3855 = !DILocation(line: 473, column: 5, scope: !3826)
!3856 = distinct !{!3856, !3819, !3857, !185}
!3857 = !DILocation(line: 474, column: 28, scope: !3820)
!3858 = !DILocation(line: 475, column: 8, scope: !3821)
!3859 = !DILocation(line: 476, column: 11, scope: !3821)
!3860 = !DILocation(line: 477, column: 5, scope: !3821)
!3861 = distinct !{!3861, !3811, !3862, !185}
!3862 = !DILocation(line: 478, column: 3, scope: !3795)
!3863 = !DILocation(line: 480, scope: !3823)
!3864 = !DILocation(line: 480, column: 12, scope: !3865)
!3865 = distinct !DILexicalBlock(scope: !3823, file: !27, line: 480, column: 3)
!3866 = !DILocation(line: 481, column: 25, scope: !3865)
!3867 = !DILocation(line: 481, column: 15, scope: !3865)
!3868 = !DILocation(line: 481, column: 35, scope: !3865)
!3869 = !DILocation(line: 481, column: 31, scope: !3865)
!3870 = !DILocation(line: 481, column: 8, scope: !3865)
!3871 = !DILocation(line: 481, column: 5, scope: !3865)
!3872 = !DILocation(line: 481, column: 12, scope: !3865)
!3873 = !DILocation(line: 480, column: 20, scope: !3865)
!3874 = !DILocation(line: 480, column: 3, scope: !3865)
!3875 = distinct !{!3875, !3822, !3876, !185}
!3876 = !DILocation(line: 481, column: 40, scope: !3823)
!3877 = !DILocation(line: 483, column: 13, scope: !3795)
!3878 = !DILocation(line: 483, column: 29, scope: !3795)
!3879 = !DILocation(line: 483, column: 25, scope: !3795)
!3880 = !DILocation(line: 483, column: 6, scope: !3795)
!3881 = !DILocation(line: 483, column: 3, scope: !3795)
!3882 = !DILocation(line: 483, column: 10, scope: !3795)
!3883 = !DILocation(line: 484, column: 7, scope: !3795)
!3884 = !DILocation(line: 484, column: 10, scope: !3795)
!3885 = !DILocation(line: 484, column: 3, scope: !3795)
!3886 = !DILocation(line: 484, column: 14, scope: !3795)
!3887 = !DILocation(line: 485, column: 1, scope: !3795)
!3888 = !DILocation(line: 0, scope: !341)
!3889 = !DILocation(line: 0, scope: !349, inlinedAt: !3890)
!3890 = distinct !DILocation(line: 600, column: 3, scope: !341)
!3891 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3890)
!3892 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3890)
!3893 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3890)
!3894 = !DILocation(line: 509, scope: !363, inlinedAt: !3890)
!3895 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3890)
!3896 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3890)
!3897 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3890)
!3898 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3890)
!3899 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3890)
!3900 = !DILocation(line: 0, scope: !372, inlinedAt: !3901)
!3901 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3890)
!3902 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3901)
!3903 = !DILocation(line: 43, scope: !380, inlinedAt: !3901)
!3904 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3901)
!3905 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3901)
!3906 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3901)
!3907 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3901)
!3908 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3901)
!3909 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3901)
!3910 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3901)
!3911 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3901)
!3912 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3901)
!3913 = distinct !{!3913, !3905, !3914, !185}
!3914 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3901)
!3915 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3890)
!3916 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3890)
!3917 = distinct !{!3917, !3896, !3918, !185}
!3918 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3890)
!3919 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3890)
!3920 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3890)
!3921 = distinct !{!3921, !3891, !3922, !185}
!3922 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3890)
!3923 = !DILocation(line: 601, column: 1, scope: !341)
!3924 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !3181, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3925 = !DILocalVariable(name: "state", arg: 1, scope: !3924, file: !27, line: 610, type: !311)
!3926 = !DILocation(line: 0, scope: !3924)
!3927 = !DILocation(line: 0, scope: !3186, inlinedAt: !3928)
!3928 = distinct !DILocation(line: 612, column: 3, scope: !3924)
!3929 = !DILocation(line: 356, column: 7, scope: !3193, inlinedAt: !3928)
!3930 = !DILocation(line: 356, scope: !3193, inlinedAt: !3928)
!3931 = !DILocation(line: 356, column: 12, scope: !3196, inlinedAt: !3928)
!3932 = !DILocation(line: 356, column: 3, scope: !3193, inlinedAt: !3928)
!3933 = !DILocation(line: 357, column: 5, scope: !3196, inlinedAt: !3928)
!3934 = !DILocation(line: 357, column: 10, scope: !3196, inlinedAt: !3928)
!3935 = !DILocation(line: 356, column: 17, scope: !3196, inlinedAt: !3928)
!3936 = !DILocation(line: 356, column: 3, scope: !3196, inlinedAt: !3928)
!3937 = distinct !{!3937, !3932, !3938, !185}
!3938 = !DILocation(line: 357, column: 12, scope: !3193, inlinedAt: !3928)
!3939 = !DILocation(line: 613, column: 10, scope: !3924)
!3940 = !DILocation(line: 613, column: 14, scope: !3924)
!3941 = !DILocation(line: 614, column: 1, scope: !3924)
!3942 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !309, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3943 = !DILocalVariable(name: "state", arg: 1, scope: !3942, file: !27, line: 625, type: !311)
!3944 = !DILocation(line: 0, scope: !3942)
!3945 = !DILocalVariable(name: "in", arg: 2, scope: !3942, file: !27, line: 625, type: !64)
!3946 = !DILocalVariable(name: "inlen", arg: 3, scope: !3942, file: !27, line: 625, type: !163)
!3947 = !DILocation(line: 627, column: 47, scope: !3942)
!3948 = !DILocation(line: 627, column: 16, scope: !3942)
!3949 = !DILocation(line: 627, column: 10, scope: !3942)
!3950 = !DILocation(line: 627, column: 14, scope: !3942)
!3951 = !DILocation(line: 628, column: 1, scope: !3942)
!3952 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !3181, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3953 = !DILocalVariable(name: "state", arg: 1, scope: !3952, file: !27, line: 637, type: !311)
!3954 = !DILocation(line: 0, scope: !3952)
!3955 = !DILocation(line: 639, column: 36, scope: !3952)
!3956 = !DILocation(line: 0, scope: !3738, inlinedAt: !3957)
!3957 = distinct !DILocation(line: 639, column: 3, scope: !3952)
!3958 = !DILocation(line: 407, column: 31, scope: !3738, inlinedAt: !3957)
!3959 = !DILocation(line: 407, column: 27, scope: !3738, inlinedAt: !3957)
!3960 = !DILocation(line: 407, column: 8, scope: !3738, inlinedAt: !3957)
!3961 = !DILocation(line: 407, column: 3, scope: !3738, inlinedAt: !3957)
!3962 = !DILocation(line: 407, column: 12, scope: !3738, inlinedAt: !3957)
!3963 = !DILocation(line: 408, column: 3, scope: !3738, inlinedAt: !3957)
!3964 = !DILocation(line: 408, column: 12, scope: !3738, inlinedAt: !3957)
!3965 = !DILocation(line: 640, column: 10, scope: !3952)
!3966 = !DILocation(line: 640, column: 14, scope: !3952)
!3967 = !DILocation(line: 641, column: 1, scope: !3952)
!3968 = !DILocation(line: 0, scope: !641)
!3969 = !DILocation(line: 655, column: 61, scope: !641)
!3970 = !DILocation(line: 0, scope: !648, inlinedAt: !3971)
!3971 = distinct !DILocation(line: 655, column: 16, scope: !641)
!3972 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !3971)
!3973 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !3971)
!3974 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !3971)
!3975 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !3971)
!3976 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !3971)
!3977 = !DILocation(line: 439, scope: !666, inlinedAt: !3971)
!3978 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !3971)
!3979 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !3971)
!3980 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !3971)
!3981 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !3971)
!3982 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !3971)
!3983 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !3971)
!3984 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !3971)
!3985 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !3971)
!3986 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !3971)
!3987 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !3971)
!3988 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !3971)
!3989 = distinct !{!3989, !3980, !3990, !185}
!3990 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !3971)
!3991 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !3971)
!3992 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !3971)
!3993 = distinct !{!3993, !3972, !3994, !185}
!3994 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !3971)
!3995 = !DILocation(line: 655, column: 10, scope: !641)
!3996 = !DILocation(line: 655, column: 14, scope: !641)
!3997 = !DILocation(line: 656, column: 1, scope: !641)
!3998 = !DILocation(line: 0, scope: !579)
!3999 = !DILocation(line: 669, column: 3, scope: !579)
!4000 = !DILocation(line: 670, column: 10, scope: !579)
!4001 = !DILocation(line: 670, column: 14, scope: !579)
!4002 = !DILocation(line: 671, column: 1, scope: !579)
!4003 = !DILocation(line: 0, scope: !600)
!4004 = !DILocation(line: 0, scope: !349, inlinedAt: !4005)
!4005 = distinct !DILocation(line: 687, column: 3, scope: !600)
!4006 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !4005)
!4007 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !4005)
!4008 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !4005)
!4009 = !DILocation(line: 509, scope: !363, inlinedAt: !4005)
!4010 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !4005)
!4011 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !4005)
!4012 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !4005)
!4013 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !4005)
!4014 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !4005)
!4015 = !DILocation(line: 0, scope: !372, inlinedAt: !4016)
!4016 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !4005)
!4017 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4016)
!4018 = !DILocation(line: 43, scope: !380, inlinedAt: !4016)
!4019 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4016)
!4020 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4016)
!4021 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4016)
!4022 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4016)
!4023 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4016)
!4024 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4016)
!4025 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4016)
!4026 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4016)
!4027 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4016)
!4028 = distinct !{!4028, !4020, !4029, !185}
!4029 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4016)
!4030 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !4005)
!4031 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !4005)
!4032 = distinct !{!4032, !4011, !4033, !185}
!4033 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !4005)
!4034 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !4005)
!4035 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !4005)
!4036 = distinct !{!4036, !4006, !4037, !185}
!4037 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !4005)
!4038 = !DILocation(line: 688, column: 1, scope: !600)
!4039 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !582, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4040 = !DILocalVariable(name: "out", arg: 1, scope: !4039, file: !27, line: 700, type: !60)
!4041 = !DILocation(line: 0, scope: !4039)
!4042 = !DILocalVariable(name: "outlen", arg: 2, scope: !4039, file: !27, line: 700, type: !163)
!4043 = !DILocalVariable(name: "in", arg: 3, scope: !4039, file: !27, line: 700, type: !64)
!4044 = !DILocalVariable(name: "inlen", arg: 4, scope: !4039, file: !27, line: 700, type: !163)
!4045 = !DILocalVariable(name: "state", scope: !4039, file: !27, line: 703, type: !312)
!4046 = !DILocation(line: 703, column: 16, scope: !4039)
!4047 = !DILocation(line: 0, scope: !308, inlinedAt: !4048)
!4048 = distinct !DILocation(line: 705, column: 3, scope: !4039)
!4049 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !4048)
!4050 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !4048)
!4051 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !4048)
!4052 = !DILocation(line: 706, column: 19, scope: !4039)
!4053 = !DILocalVariable(name: "nblocks", scope: !4039, file: !27, line: 702, type: !163)
!4054 = !DILocation(line: 0, scope: !341, inlinedAt: !4055)
!4055 = distinct !DILocation(line: 707, column: 3, scope: !4039)
!4056 = !DILocation(line: 0, scope: !349, inlinedAt: !4057)
!4057 = distinct !DILocation(line: 600, column: 3, scope: !341, inlinedAt: !4055)
!4058 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !4057)
!4059 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !4057)
!4060 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !4057)
!4061 = !DILocation(line: 509, scope: !363, inlinedAt: !4057)
!4062 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !4057)
!4063 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !4057)
!4064 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !4057)
!4065 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !4057)
!4066 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !4057)
!4067 = !DILocation(line: 0, scope: !372, inlinedAt: !4068)
!4068 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !4057)
!4069 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4068)
!4070 = !DILocation(line: 43, scope: !380, inlinedAt: !4068)
!4071 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4068)
!4072 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4068)
!4073 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4068)
!4074 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4068)
!4075 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4068)
!4076 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4068)
!4077 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4068)
!4078 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4068)
!4079 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4068)
!4080 = distinct !{!4080, !4072, !4081, !185}
!4081 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4068)
!4082 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !4057)
!4083 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !4057)
!4084 = distinct !{!4084, !4063, !4085, !185}
!4085 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !4057)
!4086 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !4057)
!4087 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !4057)
!4088 = distinct !{!4088, !4058, !4089, !185}
!4089 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !4057)
!4090 = !DILocation(line: 708, column: 20, scope: !4039)
!4091 = !DILocation(line: 708, column: 10, scope: !4039)
!4092 = !DILocation(line: 709, column: 17, scope: !4039)
!4093 = !DILocation(line: 709, column: 7, scope: !4039)
!4094 = !DILocation(line: 0, scope: !3756, inlinedAt: !4095)
!4095 = distinct !DILocation(line: 710, column: 3, scope: !4039)
!4096 = !DILocation(line: 568, column: 61, scope: !3756, inlinedAt: !4095)
!4097 = !DILocation(line: 0, scope: !648, inlinedAt: !4098)
!4098 = distinct !DILocation(line: 568, column: 16, scope: !3756, inlinedAt: !4095)
!4099 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !4098)
!4100 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !4098)
!4101 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !4098)
!4102 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !4098)
!4103 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !4098)
!4104 = !DILocation(line: 439, scope: !666, inlinedAt: !4098)
!4105 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !4098)
!4106 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !4098)
!4107 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !4098)
!4108 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !4098)
!4109 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !4098)
!4110 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !4098)
!4111 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !4098)
!4112 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !4098)
!4113 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !4098)
!4114 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !4098)
!4115 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !4098)
!4116 = distinct !{!4116, !4107, !4117, !185}
!4117 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !4098)
!4118 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !4098)
!4119 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !4098)
!4120 = distinct !{!4120, !4099, !4121, !185}
!4121 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !4098)
!4122 = !DILocation(line: 568, column: 10, scope: !3756, inlinedAt: !4095)
!4123 = !DILocation(line: 568, column: 14, scope: !3756, inlinedAt: !4095)
!4124 = !DILocation(line: 711, column: 1, scope: !4039)
!4125 = !DILocation(line: 0, scope: !581)
!4126 = !DILocation(line: 726, column: 16, scope: !581)
!4127 = !DILocation(line: 0, scope: !579, inlinedAt: !4128)
!4128 = distinct !DILocation(line: 728, column: 3, scope: !581)
!4129 = !DILocation(line: 669, column: 3, scope: !579, inlinedAt: !4128)
!4130 = !DILocation(line: 670, column: 10, scope: !579, inlinedAt: !4128)
!4131 = !DILocation(line: 670, column: 14, scope: !579, inlinedAt: !4128)
!4132 = !DILocation(line: 729, column: 19, scope: !581)
!4133 = !DILocation(line: 0, scope: !600, inlinedAt: !4134)
!4134 = distinct !DILocation(line: 730, column: 3, scope: !581)
!4135 = !DILocation(line: 0, scope: !349, inlinedAt: !4136)
!4136 = distinct !DILocation(line: 687, column: 3, scope: !600, inlinedAt: !4134)
!4137 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !4136)
!4138 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !4136)
!4139 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !4136)
!4140 = !DILocation(line: 509, scope: !363, inlinedAt: !4136)
!4141 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !4136)
!4142 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !4136)
!4143 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !4136)
!4144 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !4136)
!4145 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !4136)
!4146 = !DILocation(line: 0, scope: !372, inlinedAt: !4147)
!4147 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !4136)
!4148 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4147)
!4149 = !DILocation(line: 43, scope: !380, inlinedAt: !4147)
!4150 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4147)
!4151 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4147)
!4152 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4147)
!4153 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4147)
!4154 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4147)
!4155 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4147)
!4156 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4147)
!4157 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4147)
!4158 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4147)
!4159 = distinct !{!4159, !4151, !4160, !185}
!4160 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4147)
!4161 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !4136)
!4162 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !4136)
!4163 = distinct !{!4163, !4142, !4164, !185}
!4164 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !4136)
!4165 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !4136)
!4166 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !4136)
!4167 = distinct !{!4167, !4137, !4168, !185}
!4168 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !4136)
!4169 = !DILocation(line: 731, column: 20, scope: !581)
!4170 = !DILocation(line: 731, column: 10, scope: !581)
!4171 = !DILocation(line: 732, column: 17, scope: !581)
!4172 = !DILocation(line: 732, column: 7, scope: !581)
!4173 = !DILocation(line: 0, scope: !641, inlinedAt: !4174)
!4174 = distinct !DILocation(line: 733, column: 3, scope: !581)
!4175 = !DILocation(line: 655, column: 61, scope: !641, inlinedAt: !4174)
!4176 = !DILocation(line: 0, scope: !648, inlinedAt: !4177)
!4177 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !4174)
!4178 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !4177)
!4179 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !4177)
!4180 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !4177)
!4181 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !4177)
!4182 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !4177)
!4183 = !DILocation(line: 439, scope: !666, inlinedAt: !4177)
!4184 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !4177)
!4185 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !4177)
!4186 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !4177)
!4187 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !4177)
!4188 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !4177)
!4189 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !4177)
!4190 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !4177)
!4191 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !4177)
!4192 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !4177)
!4193 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !4177)
!4194 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !4177)
!4195 = distinct !{!4195, !4186, !4196, !185}
!4196 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !4177)
!4197 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !4177)
!4198 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !4177)
!4199 = distinct !{!4199, !4178, !4200, !185}
!4200 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !4177)
!4201 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !4174)
!4202 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !4174)
!4203 = !DILocation(line: 734, column: 1, scope: !581)
!4204 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !4205, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4205 = !DISubroutineType(types: !4206)
!4206 = !{null, !60, !64, !163}
!4207 = !DILocalVariable(name: "h", arg: 1, scope: !4204, file: !27, line: 745, type: !60)
!4208 = !DILocation(line: 0, scope: !4204)
!4209 = !DILocalVariable(name: "in", arg: 2, scope: !4204, file: !27, line: 745, type: !64)
!4210 = !DILocalVariable(name: "inlen", arg: 3, scope: !4204, file: !27, line: 745, type: !163)
!4211 = !DILocalVariable(name: "s", scope: !4204, file: !27, line: 748, type: !258)
!4212 = !DILocation(line: 748, column: 12, scope: !4204)
!4213 = !DILocation(line: 750, column: 3, scope: !4204)
!4214 = !DILocation(line: 751, column: 3, scope: !4204)
!4215 = !DILocalVariable(name: "i", scope: !4204, file: !27, line: 747, type: !42)
!4216 = !DILocation(line: 752, column: 7, scope: !4217)
!4217 = distinct !DILexicalBlock(scope: !4204, file: !27, line: 752, column: 3)
!4218 = !DILocation(line: 752, scope: !4217)
!4219 = !DILocation(line: 752, column: 12, scope: !4220)
!4220 = distinct !DILexicalBlock(scope: !4217, file: !27, line: 752, column: 3)
!4221 = !DILocation(line: 752, column: 3, scope: !4217)
!4222 = !DILocation(line: 753, column: 16, scope: !4220)
!4223 = !DILocation(line: 753, column: 14, scope: !4220)
!4224 = !DILocation(line: 753, column: 19, scope: !4220)
!4225 = !DILocation(line: 0, scope: !372, inlinedAt: !4226)
!4226 = distinct !DILocation(line: 753, column: 5, scope: !4220)
!4227 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4226)
!4228 = !DILocation(line: 43, scope: !380, inlinedAt: !4226)
!4229 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4226)
!4230 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4226)
!4231 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4226)
!4232 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4226)
!4233 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4226)
!4234 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4226)
!4235 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4226)
!4236 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4226)
!4237 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4226)
!4238 = distinct !{!4238, !4230, !4239, !185}
!4239 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4226)
!4240 = !DILocation(line: 752, column: 16, scope: !4220)
!4241 = !DILocation(line: 752, column: 3, scope: !4220)
!4242 = distinct !{!4242, !4221, !4243, !185}
!4243 = !DILocation(line: 753, column: 23, scope: !4217)
!4244 = !DILocation(line: 754, column: 1, scope: !4204)
!4245 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !4205, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4246 = !DILocalVariable(name: "h", arg: 1, scope: !4245, file: !27, line: 765, type: !60)
!4247 = !DILocation(line: 0, scope: !4245)
!4248 = !DILocalVariable(name: "in", arg: 2, scope: !4245, file: !27, line: 765, type: !64)
!4249 = !DILocalVariable(name: "inlen", arg: 3, scope: !4245, file: !27, line: 765, type: !163)
!4250 = !DILocalVariable(name: "s", scope: !4245, file: !27, line: 768, type: !258)
!4251 = !DILocation(line: 768, column: 12, scope: !4245)
!4252 = !DILocation(line: 770, column: 3, scope: !4245)
!4253 = !DILocation(line: 771, column: 3, scope: !4245)
!4254 = !DILocalVariable(name: "i", scope: !4245, file: !27, line: 767, type: !42)
!4255 = !DILocation(line: 772, column: 7, scope: !4256)
!4256 = distinct !DILexicalBlock(scope: !4245, file: !27, line: 772, column: 3)
!4257 = !DILocation(line: 772, scope: !4256)
!4258 = !DILocation(line: 772, column: 12, scope: !4259)
!4259 = distinct !DILexicalBlock(scope: !4256, file: !27, line: 772, column: 3)
!4260 = !DILocation(line: 772, column: 3, scope: !4256)
!4261 = !DILocation(line: 773, column: 16, scope: !4259)
!4262 = !DILocation(line: 773, column: 14, scope: !4259)
!4263 = !DILocation(line: 773, column: 19, scope: !4259)
!4264 = !DILocation(line: 0, scope: !372, inlinedAt: !4265)
!4265 = distinct !DILocation(line: 773, column: 5, scope: !4259)
!4266 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4265)
!4267 = !DILocation(line: 43, scope: !380, inlinedAt: !4265)
!4268 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4265)
!4269 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4265)
!4270 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4265)
!4271 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4265)
!4272 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4265)
!4273 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4265)
!4274 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4265)
!4275 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4265)
!4276 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4265)
!4277 = distinct !{!4277, !4269, !4278, !185}
!4278 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4265)
!4279 = !DILocation(line: 772, column: 16, scope: !4259)
!4280 = !DILocation(line: 772, column: 3, scope: !4259)
!4281 = distinct !{!4281, !4260, !4282, !185}
!4282 = !DILocation(line: 773, column: 23, scope: !4256)
!4283 = !DILocation(line: 774, column: 1, scope: !4245)
!4284 = !DILocation(line: 0, scope: !282)
!4285 = !DILocation(line: 23, column: 11, scope: !282)
!4286 = !DILocation(line: 25, column: 3, scope: !282)
!4287 = !DILocation(line: 26, column: 3, scope: !282)
!4288 = !DILocation(line: 26, column: 29, scope: !282)
!4289 = !DILocation(line: 27, column: 3, scope: !282)
!4290 = !DILocation(line: 27, column: 29, scope: !282)
!4291 = !DILocation(line: 0, scope: !308, inlinedAt: !4292)
!4292 = distinct !DILocation(line: 29, column: 3, scope: !282)
!4293 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !4292)
!4294 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !4292)
!4295 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !4292)
!4296 = !DILocation(line: 30, column: 1, scope: !282)
!4297 = !DILocation(line: 0, scope: !562)
!4298 = !DILocation(line: 45, column: 11, scope: !562)
!4299 = !DILocation(line: 47, column: 3, scope: !562)
!4300 = !DILocation(line: 48, column: 3, scope: !562)
!4301 = !DILocation(line: 48, column: 26, scope: !562)
!4302 = !DILocation(line: 50, column: 3, scope: !562)
!4303 = !DILocation(line: 51, column: 1, scope: !562)
!4304 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !283, file: !283, line: 64, type: !1621, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!4305 = !DILocalVariable(name: "out", arg: 1, scope: !4304, file: !283, line: 64, type: !60)
!4306 = !DILocation(line: 0, scope: !4304)
!4307 = !DILocalVariable(name: "key", arg: 2, scope: !4304, file: !283, line: 64, type: !64)
!4308 = !DILocalVariable(name: "input", arg: 3, scope: !4304, file: !283, line: 64, type: !64)
!4309 = !DILocalVariable(name: "s", scope: !4304, file: !283, line: 66, type: !287)
!4310 = !DILocation(line: 66, column: 16, scope: !4304)
!4311 = !DILocation(line: 0, scope: !3924, inlinedAt: !4312)
!4312 = distinct !DILocation(line: 68, column: 3, scope: !4304)
!4313 = !DILocation(line: 0, scope: !3186, inlinedAt: !4314)
!4314 = distinct !DILocation(line: 612, column: 3, scope: !3924, inlinedAt: !4312)
!4315 = !DILocation(line: 356, column: 7, scope: !3193, inlinedAt: !4314)
!4316 = !DILocation(line: 356, scope: !3193, inlinedAt: !4314)
!4317 = !DILocation(line: 356, column: 12, scope: !3196, inlinedAt: !4314)
!4318 = !DILocation(line: 356, column: 3, scope: !3193, inlinedAt: !4314)
!4319 = !DILocation(line: 357, column: 5, scope: !3196, inlinedAt: !4314)
!4320 = !DILocation(line: 357, column: 10, scope: !3196, inlinedAt: !4314)
!4321 = !DILocation(line: 356, column: 17, scope: !3196, inlinedAt: !4314)
!4322 = !DILocation(line: 356, column: 3, scope: !3196, inlinedAt: !4314)
!4323 = distinct !{!4323, !4318, !4324, !185}
!4324 = !DILocation(line: 357, column: 12, scope: !3193, inlinedAt: !4314)
!4325 = !DILocation(line: 613, column: 10, scope: !3924, inlinedAt: !4312)
!4326 = !DILocation(line: 613, column: 14, scope: !3924, inlinedAt: !4312)
!4327 = !DILocation(line: 0, scope: !3942, inlinedAt: !4328)
!4328 = distinct !DILocation(line: 69, column: 3, scope: !4304)
!4329 = !DILocation(line: 627, column: 16, scope: !3942, inlinedAt: !4328)
!4330 = !DILocation(line: 627, column: 10, scope: !3942, inlinedAt: !4328)
!4331 = !DILocation(line: 627, column: 14, scope: !3942, inlinedAt: !4328)
!4332 = !DILocation(line: 0, scope: !3942, inlinedAt: !4333)
!4333 = distinct !DILocation(line: 70, column: 3, scope: !4304)
!4334 = !DILocation(line: 627, column: 16, scope: !3942, inlinedAt: !4333)
!4335 = !DILocation(line: 627, column: 10, scope: !3942, inlinedAt: !4333)
!4336 = !DILocation(line: 627, column: 14, scope: !3942, inlinedAt: !4333)
!4337 = !DILocation(line: 0, scope: !3952, inlinedAt: !4338)
!4338 = distinct !DILocation(line: 71, column: 3, scope: !4304)
!4339 = !DILocation(line: 0, scope: !3738, inlinedAt: !4340)
!4340 = distinct !DILocation(line: 639, column: 3, scope: !3952, inlinedAt: !4338)
!4341 = !DILocation(line: 407, column: 31, scope: !3738, inlinedAt: !4340)
!4342 = !DILocation(line: 407, column: 27, scope: !3738, inlinedAt: !4340)
!4343 = !DILocation(line: 407, column: 8, scope: !3738, inlinedAt: !4340)
!4344 = !DILocation(line: 407, column: 3, scope: !3738, inlinedAt: !4340)
!4345 = !DILocation(line: 407, column: 12, scope: !3738, inlinedAt: !4340)
!4346 = !DILocation(line: 408, column: 3, scope: !3738, inlinedAt: !4340)
!4347 = !DILocation(line: 408, column: 12, scope: !3738, inlinedAt: !4340)
!4348 = !DILocation(line: 640, column: 10, scope: !3952, inlinedAt: !4338)
!4349 = !DILocation(line: 640, column: 14, scope: !3952, inlinedAt: !4338)
!4350 = !DILocation(line: 0, scope: !641, inlinedAt: !4351)
!4351 = distinct !DILocation(line: 72, column: 3, scope: !4304)
!4352 = !DILocation(line: 0, scope: !648, inlinedAt: !4353)
!4353 = distinct !DILocation(line: 655, column: 16, scope: !641, inlinedAt: !4351)
!4354 = !DILocation(line: 434, column: 3, scope: !648, inlinedAt: !4353)
!4355 = !DILocation(line: 435, column: 12, scope: !659, inlinedAt: !4353)
!4356 = !DILocation(line: 436, column: 7, scope: !662, inlinedAt: !4353)
!4357 = !DILocation(line: 438, column: 5, scope: !662, inlinedAt: !4353)
!4358 = !DILocation(line: 439, column: 9, scope: !666, inlinedAt: !4353)
!4359 = !DILocation(line: 439, scope: !666, inlinedAt: !4353)
!4360 = !DILocation(line: 439, column: 17, scope: !669, inlinedAt: !4353)
!4361 = !DILocation(line: 439, column: 21, scope: !669, inlinedAt: !4353)
!4362 = !DILocation(line: 439, column: 5, scope: !666, inlinedAt: !4353)
!4363 = !DILocation(line: 440, column: 19, scope: !669, inlinedAt: !4353)
!4364 = !DILocation(line: 440, column: 16, scope: !669, inlinedAt: !4353)
!4365 = !DILocation(line: 440, column: 27, scope: !669, inlinedAt: !4353)
!4366 = !DILocation(line: 440, column: 23, scope: !669, inlinedAt: !4353)
!4367 = !DILocation(line: 440, column: 14, scope: !669, inlinedAt: !4353)
!4368 = !DILocation(line: 440, column: 11, scope: !669, inlinedAt: !4353)
!4369 = !DILocation(line: 439, column: 41, scope: !669, inlinedAt: !4353)
!4370 = !DILocation(line: 439, column: 5, scope: !669, inlinedAt: !4353)
!4371 = distinct !{!4371, !4362, !4372, !185}
!4372 = !DILocation(line: 440, column: 32, scope: !666, inlinedAt: !4353)
!4373 = !DILocation(line: 441, column: 16, scope: !660, inlinedAt: !4353)
!4374 = !DILocation(line: 441, column: 12, scope: !660, inlinedAt: !4353)
!4375 = distinct !{!4375, !4354, !4376, !185}
!4376 = !DILocation(line: 443, column: 3, scope: !648, inlinedAt: !4353)
!4377 = !DILocation(line: 655, column: 10, scope: !641, inlinedAt: !4351)
!4378 = !DILocation(line: 655, column: 14, scope: !641, inlinedAt: !4351)
!4379 = !DILocation(line: 73, column: 1, scope: !4304)
