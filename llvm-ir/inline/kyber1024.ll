; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [4 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber1024_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #5, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #4, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !77
  ret i32 0, !dbg !78
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !79 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !82, !DIExpression(), !83)
    #dbg_value(ptr %sk, !84, !DIExpression(), !83)
    #dbg_declare(ptr %coins, !85, !DIExpression(), !89)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #5, !dbg !90
    #dbg_value(ptr %pk, !67, !DIExpression(), !91)
    #dbg_value(ptr %sk, !69, !DIExpression(), !91)
    #dbg_value(ptr %coins, !70, !DIExpression(), !91)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !93
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !94
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 1568) #5, !dbg !95
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !96
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 1568) #4, !dbg !96
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !97
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !98
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !99
  ret i32 0, !dbg !100
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !101 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !114
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !115
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !116
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !117
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !120 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !121, !DIExpression(), !122)
    #dbg_value(ptr %ss, !123, !DIExpression(), !122)
    #dbg_value(ptr %pk, !124, !DIExpression(), !122)
    #dbg_declare(ptr %coins, !125, !DIExpression(), !129)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #5, !dbg !130
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !133 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !136, !DIExpression(), !137)
    #dbg_value(ptr %ct, !138, !DIExpression(), !137)
    #dbg_value(ptr %sk, !139, !DIExpression(), !137)
    #dbg_declare(ptr %buf, !140, !DIExpression(), !141)
    #dbg_declare(ptr %kr, !142, !DIExpression(), !143)
    #dbg_declare(ptr %cmp, !144, !DIExpression(), !148)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !149
    #dbg_value(ptr %add.ptr, !150, !DIExpression(), !137)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !151
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !152
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !153
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !154
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !155
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !156
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !157
    #dbg_value(ptr %ct, !158, !DIExpression(), !165)
    #dbg_value(ptr %cmp, !167, !DIExpression(), !165)
    #dbg_value(i32 1568, !168, !DIExpression(), !165)
    #dbg_value(i8 0, !169, !DIExpression(), !165)
    #dbg_value(i32 0, !170, !DIExpression(), !165)
  br label %for.cond.i, !dbg !171

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !173
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !165
    #dbg_value(i8 %r.0.i, !169, !DIExpression(), !165)
    #dbg_value(i32 %i.0.i, !170, !DIExpression(), !165)
  %exitcond = icmp ne i32 %i.0.i, 1568, !dbg !174
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber1024_ref_verify.exit, !dbg !176

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

pqcrystals_kyber1024_ref_verify.exit:             ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !165
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !186
    #dbg_value(i1 %.not, !187, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !137)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !188
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !188
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

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber1024_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber1024_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !205
    #dbg_value(i32 %i.0.i2, !202, !DIExpression(), !194)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !206
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber1024_ref_cmov.exit, !dbg !208

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

pqcrystals_kyber1024_ref_cmov.exit:               ; preds = %for.cond.i1
  ret i32 0, !dbg !219
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !220 {
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
  %exitcond39 = icmp ne i32 %i.0, 4, !dbg !267
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !269

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !270

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !273
    #dbg_value(i32 %j.0, !274, !DIExpression(), !242)
  %exitcond38 = icmp ne i32 %j.0, 4, !dbg !275
  br i1 %exitcond38, label %for.body3, label %for.inc20, !dbg !270

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !277
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !277

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !280
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !280
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i), !dbg !281
    #dbg_value(ptr %state, !293, !DIExpression(), !294)
    #dbg_value(ptr %seed, !295, !DIExpression(), !294)
    #dbg_value(i8 %conv, !296, !DIExpression(), !294)
    #dbg_value(i8 %conv4, !297, !DIExpression(), !294)
    #dbg_declare(ptr %extseed.i, !298, !DIExpression(), !302)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extseed.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !281
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 32, !dbg !303
  store i8 %conv, ptr %arrayidx.i, align 1, !dbg !304
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 33, !dbg !305
  store i8 %conv4, ptr %arrayidx1.i, align 1, !dbg !306
    #dbg_value(ptr %state, !307, !DIExpression(), !317)
    #dbg_value(ptr %extseed.i, !319, !DIExpression(), !317)
    #dbg_value(i32 34, !320, !DIExpression(), !317)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !321
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !322
  store i32 168, ptr %pos.i.i, align 8, !dbg !323
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i), !dbg !324
  br label %if.end, !dbg !280

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !325
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !325
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i1), !dbg !326
    #dbg_value(ptr %state, !293, !DIExpression(), !328)
    #dbg_value(ptr %seed, !295, !DIExpression(), !328)
    #dbg_value(i8 %conv5, !296, !DIExpression(), !328)
    #dbg_value(i8 %conv6, !297, !DIExpression(), !328)
    #dbg_declare(ptr %extseed.i1, !298, !DIExpression(), !329)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extseed.i1, ptr noundef %seed, i32 noundef 32) #5, !dbg !326
  %arrayidx.i3 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 32, !dbg !330
  store i8 %conv5, ptr %arrayidx.i3, align 1, !dbg !331
  %arrayidx1.i4 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 33, !dbg !332
  store i8 %conv6, ptr %arrayidx1.i4, align 1, !dbg !333
    #dbg_value(ptr %state, !307, !DIExpression(), !334)
    #dbg_value(ptr %extseed.i1, !319, !DIExpression(), !334)
    #dbg_value(i32 34, !320, !DIExpression(), !334)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i1, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !336
  %pos.i.i5 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !337
  store i32 168, ptr %pos.i.i5, align 8, !dbg !338
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i1), !dbg !339
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
    #dbg_value(ptr %buf, !340, !DIExpression(), !344)
    #dbg_value(i32 3, !346, !DIExpression(), !344)
    #dbg_value(ptr %state, !347, !DIExpression(), !344)
    #dbg_value(ptr %buf, !348, !DIExpression(), !353)
    #dbg_value(i32 3, !355, !DIExpression(), !353)
    #dbg_value(ptr %state, !356, !DIExpression(), !353)
    #dbg_value(i32 168, !357, !DIExpression(), !353)
  br label %while.cond.i, !dbg !358

while.cond.i:                                     ; preds = %for.end.i, %if.end
  %nblocks.addr.0.i = phi i32 [ 3, %if.end ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf, %if.end ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !353)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !353)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !358
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !358

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !359
    #dbg_value(i32 0, !361, !DIExpression(), !353)
  br label %for.cond.i, !dbg !362

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !364
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !353)
  %exitcond35 = icmp ne i32 %i.0.i, 21, !dbg !365
  br i1 %exitcond35, label %for.body.i, label %for.end.i, !dbg !367

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !368
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !369
  %arrayidx.i6 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !370
  %0 = load i64, ptr %arrayidx.i6, align 8, !dbg !370
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !375)
    #dbg_value(i64 %0, !377, !DIExpression(), !375)
    #dbg_value(i32 0, !378, !DIExpression(), !375)
  br label %for.cond.i.i, !dbg !379

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !381
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !375)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !382
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !384

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !385
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !386
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !386
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !387
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !388
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !389
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !390
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !375)
  br label %for.cond.i.i, !dbg !391, !llvm.loop !392

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !394
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !353)
  br label %for.cond.i, !dbg !395, !llvm.loop !396

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !398
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !353)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !399
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !353)
  br label %while.cond.i, !dbg !358, !llvm.loop !400

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 504, !402, !DIExpression(), !242)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !403
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !403
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #4, !dbg !404
    #dbg_value(i32 %call, !405, !DIExpression(), !242)
  br label %while.cond, !dbg !406

while.cond:                                       ; preds = %keccak_squeezeblocks.exit34, %keccak_squeezeblocks.exit
  %ctr.0 = phi i32 [ %call, %keccak_squeezeblocks.exit ], [ %add, %keccak_squeezeblocks.exit34 ], !dbg !407
    #dbg_value(i32 %ctr.0, !405, !DIExpression(), !242)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !408
  br i1 %cmp10, label %while.cond.i7.preheader, label %for.inc, !dbg !406

while.cond.i7.preheader:                          ; preds = %while.cond
  br label %while.cond.i7, !dbg !409

while.cond.i7:                                    ; preds = %while.cond.i7.preheader, %for.end.i15
  %nblocks.addr.0.i8 = phi i32 [ %sub.i17, %for.end.i15 ], [ 1, %while.cond.i7.preheader ]
  %out.addr.0.i9 = phi ptr [ %add.ptr1.i16, %for.end.i15 ], [ %buf, %while.cond.i7.preheader ]
    #dbg_value(ptr %out.addr.0.i9, !348, !DIExpression(), !413)
    #dbg_value(i32 %nblocks.addr.0.i8, !355, !DIExpression(), !413)
  %tobool.not.i10 = icmp eq i32 %nblocks.addr.0.i8, 0, !dbg !409
  br i1 %tobool.not.i10, label %keccak_squeezeblocks.exit34, label %while.body.i11, !dbg !409

while.body.i11:                                   ; preds = %while.cond.i7
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !414
    #dbg_value(i32 0, !361, !DIExpression(), !413)
  br label %for.cond.i12, !dbg !415

for.cond.i12:                                     ; preds = %store64.exit.i25, %while.body.i11
  %i.0.i13 = phi i32 [ 0, %while.body.i11 ], [ %inc.i26, %store64.exit.i25 ], !dbg !416
    #dbg_value(i32 %i.0.i13, !361, !DIExpression(), !413)
  %exitcond37 = icmp ne i32 %i.0.i13, 21, !dbg !417
  br i1 %exitcond37, label %for.body.i18, label %for.end.i15, !dbg !418

for.body.i18:                                     ; preds = %for.cond.i12
  %mul.i19 = shl nuw nsw i32 %i.0.i13, 3, !dbg !419
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 %mul.i19, !dbg !420
  %arrayidx.i21 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i13, !dbg !421
  %1 = load i64, ptr %arrayidx.i21, align 8, !dbg !421
    #dbg_value(ptr %add.ptr.i20, !371, !DIExpression(), !422)
    #dbg_value(i64 %1, !377, !DIExpression(), !422)
    #dbg_value(i32 0, !378, !DIExpression(), !422)
  br label %for.cond.i.i22, !dbg !424

for.cond.i.i22:                                   ; preds = %for.body.i.i27, %for.body.i18
  %i.0.i.i23 = phi i32 [ 0, %for.body.i18 ], [ %inc.i.i33, %for.body.i.i27 ], !dbg !425
    #dbg_value(i32 %i.0.i.i23, !378, !DIExpression(), !422)
  %exitcond36 = icmp ne i32 %i.0.i.i23, 8, !dbg !426
  br i1 %exitcond36, label %for.body.i.i27, label %store64.exit.i25, !dbg !427

for.body.i.i27:                                   ; preds = %for.cond.i.i22
  %mul.i.i28 = shl nuw nsw i32 %i.0.i.i23, 3, !dbg !428
  %sh_prom.i.i29 = zext nneg i32 %mul.i.i28 to i64, !dbg !429
  %shr.i.i30 = lshr i64 %1, %sh_prom.i.i29, !dbg !429
  %conv.i.i31 = trunc i64 %shr.i.i30 to i8, !dbg !430
  %arrayidx.i.i32 = getelementptr inbounds nuw i8, ptr %add.ptr.i20, i32 %i.0.i.i23, !dbg !431
  store i8 %conv.i.i31, ptr %arrayidx.i.i32, align 1, !dbg !432
  %inc.i.i33 = add nuw nsw i32 %i.0.i.i23, 1, !dbg !433
    #dbg_value(i32 %inc.i.i33, !378, !DIExpression(), !422)
  br label %for.cond.i.i22, !dbg !434, !llvm.loop !435

store64.exit.i25:                                 ; preds = %for.cond.i.i22
  %inc.i26 = add nuw nsw i32 %i.0.i13, 1, !dbg !437
    #dbg_value(i32 %inc.i26, !361, !DIExpression(), !413)
  br label %for.cond.i12, !dbg !438, !llvm.loop !439

for.end.i15:                                      ; preds = %for.cond.i12
  %add.ptr1.i16 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 168, !dbg !441
    #dbg_value(ptr %add.ptr1.i16, !348, !DIExpression(), !413)
  %sub.i17 = add nsw i32 %nblocks.addr.0.i8, -1, !dbg !442
    #dbg_value(i32 %sub.i17, !355, !DIExpression(), !413)
  br label %while.cond.i7, !dbg !409, !llvm.loop !443

keccak_squeezeblocks.exit34:                      ; preds = %while.cond.i7
    #dbg_value(i32 168, !402, !DIExpression(), !242)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !445
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !445
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
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !505 {
entry:
  %state.i50 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i3 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i1 = alloca [128 x i8], align 1
  %buf.i = alloca [128 x i8], align 1
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
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
  store i8 4, ptr %arrayidx, align 1, !dbg !529
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !530
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !531
    #dbg_value(i32 0, !532, !DIExpression(), !509)
  br label %for.cond, !dbg !533

for.cond:                                         ; preds = %keccak_squeeze.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit ], !dbg !535
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit ], !dbg !509
    #dbg_value(i8 %nonce.0, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.0, !532, !DIExpression(), !509)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !536
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !538

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !539

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !517, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !509)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !541
    #dbg_value(ptr %arrayidx6, !552, !DIExpression(), !553)
    #dbg_value(ptr %add.ptr, !554, !DIExpression(), !553)
    #dbg_value(i8 %nonce.0, !555, !DIExpression(), !553)
    #dbg_declare(ptr %buf.i1, !556, !DIExpression(), !558)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !559
    #dbg_value(ptr %buf.i1, !564, !DIExpression(), !565)
    #dbg_value(i32 128, !566, !DIExpression(), !565)
    #dbg_value(ptr %add.ptr, !567, !DIExpression(), !565)
    #dbg_value(i8 %nonce.0, !568, !DIExpression(), !565)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !573)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !559
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !574
  store i8 %nonce.0, ptr %arrayidx.i, align 1, !dbg !575
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i50), !dbg !576
    #dbg_value(ptr %buf.i1, !583, !DIExpression(), !584)
    #dbg_value(i32 128, !585, !DIExpression(), !584)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !584)
    #dbg_value(i32 33, !587, !DIExpression(), !584)
    #dbg_declare(ptr %state.i50, !588, !DIExpression(), !589)
    #dbg_value(ptr %state.i50, !590, !DIExpression(), !591)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !591)
    #dbg_value(i32 33, !593, !DIExpression(), !591)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i50, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !576
  %pos.i.i51 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !594
  store i32 136, ptr %pos.i.i51, align 8, !dbg !595
    #dbg_value(i32 0, !596, !DIExpression(), !584)
    #dbg_value(ptr %buf.i1, !597, !DIExpression(), !599)
    #dbg_value(i32 0, !601, !DIExpression(), !599)
    #dbg_value(ptr %state.i50, !602, !DIExpression(), !599)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !603)
    #dbg_value(i32 0, !355, !DIExpression(), !603)
    #dbg_value(ptr %state.i50, !356, !DIExpression(), !603)
    #dbg_value(i32 136, !357, !DIExpression(), !603)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !603)
    #dbg_value(i32 0, !355, !DIExpression(), !603)
    #dbg_value(i32 128, !585, !DIExpression(), !584)
    #dbg_value(ptr %buf.i1, !583, !DIExpression(), !584)
    #dbg_value(ptr %buf.i1, !605, !DIExpression(), !607)
    #dbg_value(i32 128, !609, !DIExpression(), !607)
    #dbg_value(ptr %state.i50, !610, !DIExpression(), !607)
  %pos.i1.i53 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !611
  %0 = load i32, ptr %pos.i1.i53, align 8, !dbg !611
    #dbg_value(ptr %buf.i1, !612, !DIExpression(), !616)
    #dbg_value(i32 128, !618, !DIExpression(), !616)
    #dbg_value(ptr %state.i50, !619, !DIExpression(), !616)
    #dbg_value(i32 %0, !620, !DIExpression(), !616)
    #dbg_value(i32 136, !621, !DIExpression(), !616)
  br label %while.cond.i137, !dbg !622

while.cond.i137:                                  ; preds = %for.end.i145, %for.body
  %pos.addr.0.i = phi i32 [ %0, %for.body ], [ %i.0.i143.lcssa, %for.end.i145 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.body ], [ %sub3.i, %for.end.i145 ]
  %out.addr.0.i138 = phi ptr [ %buf.i1, %for.body ], [ %out.addr.1.i.lcssa, %for.end.i145 ]
    #dbg_value(ptr %out.addr.0.i138, !612, !DIExpression(), !616)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !616)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !616)
  %tobool.not.i139 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !622
  br i1 %tobool.not.i139, label %keccak_squeeze.exit, label %while.body.i140, !dbg !622

while.body.i140:                                  ; preds = %while.cond.i137
  %cmp.i141 = icmp eq i32 %pos.addr.0.i, 136, !dbg !623
  br i1 %cmp.i141, label %if.then.i, label %if.end.i, !dbg !623

if.then.i:                                        ; preds = %while.body.i140
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !626
    #dbg_value(i32 0, !620, !DIExpression(), !616)
  br label %if.end.i, !dbg !628

if.end.i:                                         ; preds = %if.then.i, %while.body.i140
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i140 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !616)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !616)
  br label %for.cond.i142, !dbg !630

for.cond.i142:                                    ; preds = %for.body.i146, %if.end.i
  %i.0.i143 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i150, %for.body.i146 ], !dbg !632
  %out.addr.1.i = phi ptr [ %out.addr.0.i138, %if.end.i ], [ %incdec.ptr.i, %for.body.i146 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !616)
    #dbg_value(i32 %i.0.i143, !629, !DIExpression(), !616)
  %cmp1.i = icmp ult i32 %i.0.i143, 136, !dbg !633
  %add.i144 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !635
  %cmp2.i = icmp ult i32 %i.0.i143, %add.i144, !dbg !635
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !635
  br i1 %1, label %for.body.i146, label %for.end.i145, !dbg !636

for.body.i146:                                    ; preds = %for.cond.i142
  %div1.i = lshr i32 %i.0.i143, 3, !dbg !637
  %arrayidx.i147 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %div1.i, !dbg !638
  %2 = load i64, ptr %arrayidx.i147, align 8, !dbg !638
  %rem.i = shl nuw nsw i32 %i.0.i143, 3, !dbg !639
  %mul.i148 = and i32 %rem.i, 56, !dbg !639
  %sh_prom.i = zext nneg i32 %mul.i148 to i64, !dbg !640
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !640
  %conv.i149 = trunc i64 %shr.i to i8, !dbg !638
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !616)
  store i8 %conv.i149, ptr %out.addr.1.i, align 1, !dbg !641
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !642
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !616)
  %inc.i150 = add nuw nsw i32 %i.0.i143, 1, !dbg !643
    #dbg_value(i32 %inc.i150, !629, !DIExpression(), !616)
  br label %for.cond.i142, !dbg !644, !llvm.loop !645

for.end.i145:                                     ; preds = %for.cond.i142
  %i.0.i143.lcssa = phi i32 [ %i.0.i143, %for.cond.i142 ], !dbg !632
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i142 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i143.lcssa, !dbg !647
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !648
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !616)
    #dbg_value(i32 %i.0.i143.lcssa, !620, !DIExpression(), !616)
  br label %while.cond.i137, !dbg !622, !llvm.loop !649

keccak_squeeze.exit:                              ; preds = %while.cond.i137
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i137 ]
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !651
  %pos1.i.i55 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !652
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i55, align 8, !dbg !653
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i50), !dbg !654
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !655
    #dbg_value(ptr %arrayidx6, !656, !DIExpression(), !666)
    #dbg_value(ptr %buf.i1, !668, !DIExpression(), !666)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %buf.i1) #4, !dbg !669
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !670
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !671
    #dbg_value(i8 %inc, !517, !DIExpression(), !509)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !672
    #dbg_value(i32 %inc7, !532, !DIExpression(), !509)
  br label %for.cond, !dbg !673, !llvm.loop !674

for.cond8:                                        ; preds = %for.cond8.preheader, %keccak_squeeze.exit180
  %i.1 = phi i32 [ %inc15, %keccak_squeeze.exit180 ], [ 0, %for.cond8.preheader ], !dbg !676
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit180 ], [ 4, %for.cond8.preheader ], !dbg !509
    #dbg_value(i8 %nonce.1, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.1, !532, !DIExpression(), !509)
  %exitcond181 = icmp ne i32 %i.1, 4, !dbg !677
  br i1 %exitcond181, label %for.body10, label %for.cond.i7.preheader, !dbg !539

for.cond.i7.preheader:                            ; preds = %for.cond8
  br label %for.cond.i7, !dbg !679

for.body10:                                       ; preds = %for.cond8
    #dbg_value(i8 %nonce.1, !517, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !509)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !696
    #dbg_value(ptr %arrayidx12, !552, !DIExpression(), !698)
    #dbg_value(ptr %add.ptr, !554, !DIExpression(), !698)
    #dbg_value(i8 %nonce.1, !555, !DIExpression(), !698)
    #dbg_declare(ptr %buf.i, !556, !DIExpression(), !699)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i3), !dbg !700
    #dbg_value(ptr %buf.i, !564, !DIExpression(), !702)
    #dbg_value(i32 128, !566, !DIExpression(), !702)
    #dbg_value(ptr %add.ptr, !567, !DIExpression(), !702)
    #dbg_value(i8 %nonce.1, !568, !DIExpression(), !702)
    #dbg_declare(ptr %extkey.i3, !569, !DIExpression(), !703)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i3, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !700
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %extkey.i3, i32 32, !dbg !704
  store i8 %nonce.1, ptr %arrayidx.i5, align 1, !dbg !705
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !706
    #dbg_value(ptr %buf.i, !583, !DIExpression(), !709)
    #dbg_value(i32 128, !585, !DIExpression(), !709)
    #dbg_value(ptr %extkey.i3, !586, !DIExpression(), !709)
    #dbg_value(i32 33, !587, !DIExpression(), !709)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !710)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !711)
    #dbg_value(ptr %extkey.i3, !592, !DIExpression(), !711)
    #dbg_value(i32 33, !593, !DIExpression(), !711)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i3, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !706
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !712
  store i32 136, ptr %pos.i.i, align 8, !dbg !713
    #dbg_value(i32 0, !596, !DIExpression(), !709)
    #dbg_value(ptr %buf.i, !597, !DIExpression(), !714)
    #dbg_value(i32 0, !601, !DIExpression(), !714)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !714)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !716)
    #dbg_value(i32 0, !355, !DIExpression(), !716)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !716)
    #dbg_value(i32 136, !357, !DIExpression(), !716)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !716)
    #dbg_value(i32 0, !355, !DIExpression(), !716)
    #dbg_value(i32 128, !585, !DIExpression(), !709)
    #dbg_value(ptr %buf.i, !583, !DIExpression(), !709)
    #dbg_value(ptr %buf.i, !605, !DIExpression(), !718)
    #dbg_value(i32 128, !609, !DIExpression(), !718)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !718)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !720
  %3 = load i32, ptr %pos.i1.i, align 8, !dbg !720
    #dbg_value(ptr %buf.i, !612, !DIExpression(), !721)
    #dbg_value(i32 128, !618, !DIExpression(), !721)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !721)
    #dbg_value(i32 %3, !620, !DIExpression(), !721)
    #dbg_value(i32 136, !621, !DIExpression(), !721)
  br label %while.cond.i151, !dbg !723

while.cond.i151:                                  ; preds = %for.end.i166, %for.body10
  %pos.addr.0.i152 = phi i32 [ %3, %for.body10 ], [ %i.0.i161.lcssa, %for.end.i166 ]
  %outlen.addr.0.i153 = phi i32 [ 128, %for.body10 ], [ %sub3.i168, %for.end.i166 ]
  %out.addr.0.i154 = phi ptr [ %buf.i, %for.body10 ], [ %out.addr.1.i162.lcssa, %for.end.i166 ]
    #dbg_value(ptr %out.addr.0.i154, !612, !DIExpression(), !721)
    #dbg_value(i32 %outlen.addr.0.i153, !618, !DIExpression(), !721)
    #dbg_value(i32 %pos.addr.0.i152, !620, !DIExpression(), !721)
  %tobool.not.i155 = icmp eq i32 %outlen.addr.0.i153, 0, !dbg !723
  br i1 %tobool.not.i155, label %keccak_squeeze.exit180, label %while.body.i156, !dbg !723

while.body.i156:                                  ; preds = %while.cond.i151
  %cmp.i157 = icmp eq i32 %pos.addr.0.i152, 136, !dbg !724
  br i1 %cmp.i157, label %if.then.i179, label %if.end.i158, !dbg !724

if.then.i179:                                     ; preds = %while.body.i156
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !725
    #dbg_value(i32 0, !620, !DIExpression(), !721)
  br label %if.end.i158, !dbg !726

if.end.i158:                                      ; preds = %if.then.i179, %while.body.i156
  %pos.addr.1.i159 = phi i32 [ 0, %if.then.i179 ], [ %pos.addr.0.i152, %while.body.i156 ]
    #dbg_value(i32 %pos.addr.1.i159, !620, !DIExpression(), !721)
    #dbg_value(i32 %pos.addr.1.i159, !629, !DIExpression(), !721)
  br label %for.cond.i160, !dbg !727

for.cond.i160:                                    ; preds = %for.body.i169, %if.end.i158
  %i.0.i161 = phi i32 [ %pos.addr.1.i159, %if.end.i158 ], [ %inc.i178, %for.body.i169 ], !dbg !728
  %out.addr.1.i162 = phi ptr [ %out.addr.0.i154, %if.end.i158 ], [ %incdec.ptr.i177, %for.body.i169 ]
    #dbg_value(ptr %out.addr.1.i162, !612, !DIExpression(), !721)
    #dbg_value(i32 %i.0.i161, !629, !DIExpression(), !721)
  %cmp1.i163 = icmp ult i32 %i.0.i161, 136, !dbg !729
  %add.i164 = add i32 %pos.addr.1.i159, %outlen.addr.0.i153, !dbg !730
  %cmp2.i165 = icmp ult i32 %i.0.i161, %add.i164, !dbg !730
  %4 = select i1 %cmp1.i163, i1 %cmp2.i165, i1 false, !dbg !730
  br i1 %4, label %for.body.i169, label %for.end.i166, !dbg !731

for.body.i169:                                    ; preds = %for.cond.i160
  %div1.i170 = lshr i32 %i.0.i161, 3, !dbg !732
  %arrayidx.i171 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i170, !dbg !733
  %5 = load i64, ptr %arrayidx.i171, align 8, !dbg !733
  %rem.i172 = shl nuw nsw i32 %i.0.i161, 3, !dbg !734
  %mul.i173 = and i32 %rem.i172, 56, !dbg !734
  %sh_prom.i174 = zext nneg i32 %mul.i173 to i64, !dbg !735
  %shr.i175 = lshr i64 %5, %sh_prom.i174, !dbg !735
  %conv.i176 = trunc i64 %shr.i175 to i8, !dbg !733
    #dbg_value(ptr %out.addr.1.i162, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !721)
  store i8 %conv.i176, ptr %out.addr.1.i162, align 1, !dbg !736
  %incdec.ptr.i177 = getelementptr inbounds nuw i8, ptr %out.addr.1.i162, i32 1, !dbg !737
    #dbg_value(ptr %incdec.ptr.i177, !612, !DIExpression(), !721)
  %inc.i178 = add nuw nsw i32 %i.0.i161, 1, !dbg !738
    #dbg_value(i32 %inc.i178, !629, !DIExpression(), !721)
  br label %for.cond.i160, !dbg !739, !llvm.loop !740

for.end.i166:                                     ; preds = %for.cond.i160
  %i.0.i161.lcssa = phi i32 [ %i.0.i161, %for.cond.i160 ], !dbg !728
  %out.addr.1.i162.lcssa = phi ptr [ %out.addr.1.i162, %for.cond.i160 ]
  %sub.neg.i167 = sub i32 %pos.addr.1.i159, %i.0.i161.lcssa, !dbg !742
  %sub3.i168 = add i32 %sub.neg.i167, %outlen.addr.0.i153, !dbg !743
    #dbg_value(i32 %sub3.i168, !618, !DIExpression(), !721)
    #dbg_value(i32 %i.0.i161.lcssa, !620, !DIExpression(), !721)
  br label %while.cond.i151, !dbg !723, !llvm.loop !744

keccak_squeeze.exit180:                           ; preds = %while.cond.i151
  %pos.addr.0.i152.lcssa = phi i32 [ %pos.addr.0.i152, %while.cond.i151 ]
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !746
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !747
  store i32 %pos.addr.0.i152.lcssa, ptr %pos1.i.i, align 8, !dbg !748
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !749
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i3), !dbg !750
    #dbg_value(ptr %arrayidx12, !656, !DIExpression(), !751)
    #dbg_value(ptr %buf.i, !668, !DIExpression(), !751)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %buf.i) #4, !dbg !753
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !754
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !755
    #dbg_value(i8 %inc13, !517, !DIExpression(), !509)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !756
    #dbg_value(i32 %inc15, !532, !DIExpression(), !509)
  br label %for.cond8, !dbg !757, !llvm.loop !758

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber1024_ref_poly_reduce.exit ], [ 0, %for.cond.i7.preheader ], !dbg !760
    #dbg_value(i32 %i.0.i8, !761, !DIExpression(), !762)
  %exitcond183 = icmp ne i32 %i.0.i8, 4, !dbg !763
  br i1 %exitcond183, label %for.body.i10, label %for.cond.i13.preheader, !dbg !679

for.cond.i13.preheader:                           ; preds = %for.cond.i7
  br label %for.cond.i13, !dbg !765

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i8, !dbg !767
    #dbg_value(ptr %arrayidx.i11, !768, !DIExpression(), !772)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !774
    #dbg_value(ptr %arrayidx.i11, !775, !DIExpression(), !777)
    #dbg_value(i32 0, !779, !DIExpression(), !777)
  br label %for.cond.i56, !dbg !780

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i10
  %i.0.i57 = phi i32 [ 0, %for.body.i10 ], [ %inc.i62, %for.body.i59 ], !dbg !782
    #dbg_value(i32 %i.0.i57, !779, !DIExpression(), !777)
  %exitcond182 = icmp ne i32 %i.0.i57, 256, !dbg !783
  br i1 %exitcond182, label %for.body.i59, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !785

for.body.i59:                                     ; preds = %for.cond.i56
  %arrayidx.i60 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i57, !dbg !786
  %6 = load i16, ptr %arrayidx.i60, align 2, !dbg !786
    #dbg_value(i16 %6, !787, !DIExpression(), !792)
    #dbg_value(i16 20159, !794, !DIExpression(), !792)
  %conv.i.i = sext i16 %6 to i32, !dbg !795
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !796
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !797
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !798
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !792)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !792)
  %7 = trunc nsw i32 %shr.i.i to i16, !dbg !800
  %8 = mul i16 %7, -3329, !dbg !800
  %conv7.i.i = add i16 %8, %6, !dbg !800
  %arrayidx2.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i57, !dbg !801
  store i16 %conv7.i.i, ptr %arrayidx2.i61, align 2, !dbg !802
  %inc.i62 = add nuw nsw i32 %i.0.i57, 1, !dbg !803
    #dbg_value(i32 %inc.i62, !779, !DIExpression(), !777)
  br label %for.cond.i56, !dbg !804, !llvm.loop !805

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i56
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !807
    #dbg_value(i32 %inc.i12, !761, !DIExpression(), !762)
  br label %for.cond.i7, !dbg !808, !llvm.loop !809

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit75
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber1024_ref_poly_reduce.exit75 ], [ 0, %for.cond.i13.preheader ], !dbg !811
    #dbg_value(i32 %i.0.i14, !761, !DIExpression(), !812)
  %exitcond185 = icmp ne i32 %i.0.i14, 4, !dbg !813
  br i1 %exitcond185, label %for.body.i16, label %for.cond17.preheader, !dbg !765

for.cond17.preheader:                             ; preds = %for.cond.i13
  br label %for.cond17, !dbg !814

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.0.i14, !dbg !816
    #dbg_value(ptr %arrayidx.i17, !768, !DIExpression(), !817)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !819
    #dbg_value(ptr %arrayidx.i17, !775, !DIExpression(), !820)
    #dbg_value(i32 0, !779, !DIExpression(), !820)
  br label %for.cond.i63, !dbg !822

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i16
  %i.0.i64 = phi i32 [ 0, %for.body.i16 ], [ %inc.i74, %for.body.i66 ], !dbg !823
    #dbg_value(i32 %i.0.i64, !779, !DIExpression(), !820)
  %exitcond184 = icmp ne i32 %i.0.i64, 256, !dbg !824
  br i1 %exitcond184, label %for.body.i66, label %pqcrystals_kyber1024_ref_poly_reduce.exit75, !dbg !825

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i64, !dbg !826
  %9 = load i16, ptr %arrayidx.i67, align 2, !dbg !826
    #dbg_value(i16 %9, !787, !DIExpression(), !827)
    #dbg_value(i16 20159, !794, !DIExpression(), !827)
  %conv.i.i68 = sext i16 %9 to i32, !dbg !829
  %mul.i.i69 = mul nsw i32 %conv.i.i68, 20159, !dbg !830
  %add.i.i70 = add nsw i32 %mul.i.i69, 33554432, !dbg !831
  %shr.i.i71 = ashr i32 %add.i.i70, 26, !dbg !832
    #dbg_value(i32 %shr.i.i71, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !827)
    #dbg_value(i32 %shr.i.i71, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !827)
  %10 = trunc nsw i32 %shr.i.i71 to i16, !dbg !833
  %11 = mul i16 %10, -3329, !dbg !833
  %conv7.i.i72 = add i16 %11, %9, !dbg !833
  %arrayidx2.i73 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i64, !dbg !834
  store i16 %conv7.i.i72, ptr %arrayidx2.i73, align 2, !dbg !835
  %inc.i74 = add nuw nsw i32 %i.0.i64, 1, !dbg !836
    #dbg_value(i32 %inc.i74, !779, !DIExpression(), !820)
  br label %for.cond.i63, !dbg !837, !llvm.loop !838

pqcrystals_kyber1024_ref_poly_reduce.exit75:      ; preds = %for.cond.i63
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !840
    #dbg_value(i32 %inc.i18, !761, !DIExpression(), !812)
  br label %for.cond.i13, !dbg !841, !llvm.loop !842

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber1024_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber1024_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !844
    #dbg_value(i32 %i.2, !532, !DIExpression(), !509)
  %exitcond187 = icmp ne i32 %i.2, 4, !dbg !845
  br i1 %exitcond187, label %for.body19, label %for.cond.i27.preheader, !dbg !814

for.cond.i27.preheader:                           ; preds = %for.cond17
  br label %for.cond.i27, !dbg !847

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !855
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !857
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !858
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !859
    #dbg_value(ptr %arrayidx24, !860, !DIExpression(), !862)
    #dbg_value(i16 1353, !864, !DIExpression(), !862)
    #dbg_value(i32 0, !865, !DIExpression(), !862)
  br label %for.cond.i89, !dbg !866

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !868
    #dbg_value(i32 %i.0.i90, !865, !DIExpression(), !862)
  %exitcond186 = icmp ne i32 %i.0.i90, 256, !dbg !869
  br i1 %exitcond186, label %for.body.i92, label %pqcrystals_kyber1024_ref_poly_tomont.exit, !dbg !871

for.body.i92:                                     ; preds = %for.cond.i89
  %arrayidx.i93 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !872
  %12 = load i16, ptr %arrayidx.i93, align 2, !dbg !872
  %conv.i = sext i16 %12 to i32, !dbg !873
  %mul.i94 = mul nsw i32 %conv.i, 1353, !dbg !874
    #dbg_value(i32 %mul.i94, !875, !DIExpression(), !878)
    #dbg_value(i32 %mul.i94, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !878)
  %sext.i.i = mul i32 %conv.i, 1346961408, !dbg !881
  %conv3.i.i = ashr exact i32 %sext.i.i, 16, !dbg !881
  %mul4.neg.i.i = mul nsw i32 %conv3.i.i, -3329, !dbg !882
  %sub.i.i = add nsw i32 %mul4.neg.i.i, %mul.i94, !dbg !883
  %shr.i.i95 = lshr i32 %sub.i.i, 16, !dbg !884
  %conv5.i.i = trunc nuw i32 %shr.i.i95 to i16, !dbg !885
    #dbg_value(i16 %conv5.i.i, !880, !DIExpression(), !878)
  %arrayidx2.i96 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !886
  store i16 %conv5.i.i, ptr %arrayidx2.i96, align 2, !dbg !887
  %inc.i97 = add nuw nsw i32 %i.0.i90, 1, !dbg !888
    #dbg_value(i32 %inc.i97, !865, !DIExpression(), !862)
  br label %for.cond.i89, !dbg !889, !llvm.loop !890

pqcrystals_kyber1024_ref_poly_tomont.exit:        ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !892
    #dbg_value(i32 %inc26, !532, !DIExpression(), !509)
  br label %for.cond17, !dbg !893, !llvm.loop !894

for.cond.i27:                                     ; preds = %for.cond.i27.preheader, %pqcrystals_kyber1024_ref_poly_add.exit
  %i.0.i28 = phi i32 [ %inc.i32, %pqcrystals_kyber1024_ref_poly_add.exit ], [ 0, %for.cond.i27.preheader ], !dbg !896
    #dbg_value(i32 %i.0.i28, !897, !DIExpression(), !898)
  %exitcond189 = icmp ne i32 %i.0.i28, 4, !dbg !899
  br i1 %exitcond189, label %for.body.i30, label %for.cond.i.preheader, !dbg !847

for.cond.i.preheader:                             ; preds = %for.cond.i27
  br label %for.cond.i, !dbg !901

for.body.i30:                                     ; preds = %for.cond.i27
  %arrayidx.i31 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !905
  %arrayidx2.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !906
  %arrayidx4.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.0.i28, !dbg !907
    #dbg_value(ptr %arrayidx.i31, !908, !DIExpression(), !914)
    #dbg_value(ptr %arrayidx2.i, !916, !DIExpression(), !914)
    #dbg_value(ptr %arrayidx4.i, !917, !DIExpression(), !914)
    #dbg_value(i32 0, !918, !DIExpression(), !914)
  br label %for.cond.i42, !dbg !919

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i30
  %i.0.i43 = phi i32 [ 0, %for.body.i30 ], [ %inc.i48, %for.body.i45 ], !dbg !921
    #dbg_value(i32 %i.0.i43, !918, !DIExpression(), !914)
  %exitcond188 = icmp ne i32 %i.0.i43, 256, !dbg !922
  br i1 %exitcond188, label %for.body.i45, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !924

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i43, !dbg !925
  %13 = load i16, ptr %arrayidx.i46, align 2, !dbg !925
  %arrayidx2.i47 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i43, !dbg !926
  %14 = load i16, ptr %arrayidx2.i47, align 2, !dbg !926
  %add.i = add i16 %13, %14, !dbg !927
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i31, i32 0, i32 %i.0.i43, !dbg !928
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !929
  %inc.i48 = add nuw nsw i32 %i.0.i43, 1, !dbg !930
    #dbg_value(i32 %inc.i48, !918, !DIExpression(), !914)
  br label %for.cond.i42, !dbg !931, !llvm.loop !932

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i42
  %inc.i32 = add nuw nsw i32 %i.0.i28, 1, !dbg !934
    #dbg_value(i32 %inc.i32, !897, !DIExpression(), !898)
  br label %for.cond.i27, !dbg !935, !llvm.loop !936

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit88
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit88 ], [ 0, %for.cond.i.preheader ], !dbg !938
    #dbg_value(i32 %i.0.i, !939, !DIExpression(), !940)
  %exitcond191 = icmp ne i32 %i.0.i, 4, !dbg !941
  br i1 %exitcond191, label %for.body.i, label %for.cond.i20.preheader, !dbg !901

for.cond.i20.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i20, !dbg !943

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !953
    #dbg_value(ptr %arrayidx.i6, !775, !DIExpression(), !954)
    #dbg_value(i32 0, !779, !DIExpression(), !954)
  br label %for.cond.i76, !dbg !956

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i
  %i.0.i77 = phi i32 [ 0, %for.body.i ], [ %inc.i87, %for.body.i79 ], !dbg !957
    #dbg_value(i32 %i.0.i77, !779, !DIExpression(), !954)
  %exitcond190 = icmp ne i32 %i.0.i77, 256, !dbg !958
  br i1 %exitcond190, label %for.body.i79, label %pqcrystals_kyber1024_ref_poly_reduce.exit88, !dbg !959

for.body.i79:                                     ; preds = %for.cond.i76
  %arrayidx.i80 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i77, !dbg !960
  %15 = load i16, ptr %arrayidx.i80, align 2, !dbg !960
    #dbg_value(i16 %15, !787, !DIExpression(), !961)
    #dbg_value(i16 20159, !794, !DIExpression(), !961)
  %conv.i.i81 = sext i16 %15 to i32, !dbg !963
  %mul.i.i82 = mul nsw i32 %conv.i.i81, 20159, !dbg !964
  %add.i.i83 = add nsw i32 %mul.i.i82, 33554432, !dbg !965
  %shr.i.i84 = ashr i32 %add.i.i83, 26, !dbg !966
    #dbg_value(i32 %shr.i.i84, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !961)
    #dbg_value(i32 %shr.i.i84, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !961)
  %16 = trunc nsw i32 %shr.i.i84 to i16, !dbg !967
  %17 = mul i16 %16, -3329, !dbg !967
  %conv7.i.i85 = add i16 %17, %15, !dbg !967
  %arrayidx2.i86 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i77, !dbg !968
  store i16 %conv7.i.i85, ptr %arrayidx2.i86, align 2, !dbg !969
  %inc.i87 = add nuw nsw i32 %i.0.i77, 1, !dbg !970
    #dbg_value(i32 %inc.i87, !779, !DIExpression(), !954)
  br label %for.cond.i76, !dbg !971, !llvm.loop !972

pqcrystals_kyber1024_ref_poly_reduce.exit88:      ; preds = %for.cond.i76
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !974
    #dbg_value(i32 %inc.i, !939, !DIExpression(), !940)
  br label %for.cond.i, !dbg !975, !llvm.loop !976

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %for.body.i23
  %i.0.i21 = phi i32 [ %inc.i26, %for.body.i23 ], [ 0, %for.cond.i20.preheader ], !dbg !978
    #dbg_value(i32 %i.0.i21, !979, !DIExpression(), !980)
  %exitcond192 = icmp ne i32 %i.0.i21, 4, !dbg !981
  br i1 %exitcond192, label %for.body.i23, label %for.cond.i33.preheader, !dbg !943

for.cond.i33.preheader:                           ; preds = %for.cond.i20
  br label %for.cond.i33, !dbg !983

for.body.i23:                                     ; preds = %for.cond.i20
  %mul.i = mul nuw nsw i32 %i.0.i21, 384, !dbg !989
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !990
  %arrayidx.i25 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i21, !dbg !991
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr.i24, ptr noundef nonnull %arrayidx.i25) #4, !dbg !992
  %inc.i26 = add nuw nsw i32 %i.0.i21, 1, !dbg !993
    #dbg_value(i32 %inc.i26, !979, !DIExpression(), !980)
  br label %for.cond.i20, !dbg !994, !llvm.loop !995

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !997
    #dbg_value(i32 %i.0.i34, !979, !DIExpression(), !998)
  %exitcond193 = icmp ne i32 %i.0.i34, 4, !dbg !999
  br i1 %exitcond193, label %for.body.i36, label %pqcrystals_kyber1024_ref_polyvec_tobytes.exit41, !dbg !983

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1000
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i37, !dbg !1001
  %arrayidx.i39 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i34, !dbg !1002
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1003
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1004
    #dbg_value(i32 %inc.i40, !979, !DIExpression(), !998)
  br label %for.cond.i33, !dbg !1005, !llvm.loop !1006

pqcrystals_kyber1024_ref_polyvec_tobytes.exit41:  ; preds = %for.cond.i33
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1536, !dbg !1008
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1009
  ret void, !dbg !1010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1011 {
entry:
  %state.i71 = alloca %struct.keccak_state, align 8
  %state.i65 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i8 = alloca [33 x i8], align 1
  %extkey.i5 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i2 = alloca [128 x i8], align 1
  %buf.i1 = alloca [128 x i8], align 1
  %buf.i = alloca [128 x i8], align 1
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [4 x %struct.polyvec], align 2
  %b = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %k = alloca %struct.poly, align 2
  %epp = alloca %struct.poly, align 2
    #dbg_value(ptr %c, !1014, !DIExpression(), !1015)
    #dbg_value(ptr %m, !1016, !DIExpression(), !1015)
    #dbg_value(ptr %pk, !1017, !DIExpression(), !1015)
    #dbg_value(ptr %coins, !1018, !DIExpression(), !1015)
    #dbg_declare(ptr %seed, !1019, !DIExpression(), !1020)
    #dbg_value(i8 0, !1021, !DIExpression(), !1015)
    #dbg_declare(ptr %sp, !1022, !DIExpression(), !1023)
    #dbg_declare(ptr %pkpv, !1024, !DIExpression(), !1025)
    #dbg_declare(ptr %ep, !1026, !DIExpression(), !1027)
    #dbg_declare(ptr %at, !1028, !DIExpression(), !1029)
    #dbg_declare(ptr %b, !1030, !DIExpression(), !1031)
    #dbg_declare(ptr %v, !1032, !DIExpression(), !1033)
    #dbg_declare(ptr %k, !1034, !DIExpression(), !1035)
    #dbg_declare(ptr %epp, !1036, !DIExpression(), !1037)
    #dbg_value(ptr %pkpv, !1038, !DIExpression(), !1042)
    #dbg_value(ptr %seed, !1044, !DIExpression(), !1042)
    #dbg_value(ptr %pk, !1045, !DIExpression(), !1042)
    #dbg_value(ptr %pkpv, !1046, !DIExpression(), !1050)
    #dbg_value(ptr %pk, !1052, !DIExpression(), !1050)
    #dbg_value(i32 0, !1053, !DIExpression(), !1050)
  br label %for.cond.i24, !dbg !1054

for.cond.i24:                                     ; preds = %for.body.i27, %entry
  %i.0.i25 = phi i32 [ 0, %entry ], [ %inc.i30, %for.body.i27 ], !dbg !1056
    #dbg_value(i32 %i.0.i25, !1053, !DIExpression(), !1050)
  %exitcond = icmp ne i32 %i.0.i25, 4, !dbg !1057
  br i1 %exitcond, label %for.body.i27, label %pqcrystals_kyber1024_ref_polyvec_frombytes.exit, !dbg !1059

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i25, !dbg !1060
  %mul.i = mul nuw nsw i32 %i.0.i25, 384, !dbg !1061
  %add.ptr.i29 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1062
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i28, ptr noundef %add.ptr.i29) #4, !dbg !1063
  %inc.i30 = add nuw nsw i32 %i.0.i25, 1, !dbg !1064
    #dbg_value(i32 %inc.i30, !1053, !DIExpression(), !1050)
  br label %for.cond.i24, !dbg !1065, !llvm.loop !1066

pqcrystals_kyber1024_ref_polyvec_frombytes.exit:  ; preds = %for.cond.i24
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %pk, i32 1536, !dbg !1068
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i3, i32 noundef 32) #5, !dbg !1069
    #dbg_value(ptr %k, !1070, !DIExpression(), !1074)
    #dbg_value(ptr %m, !1076, !DIExpression(), !1074)
    #dbg_value(i32 0, !1077, !DIExpression(), !1074)
  br label %for.cond.i110, !dbg !1078

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber1024_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1080
    #dbg_value(i32 %i.0.i111, !1077, !DIExpression(), !1074)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1081
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber1024_ref_poly_frommsg.exit, !dbg !1083

for.cond1.i.preheader:                            ; preds = %for.cond.i110
  br label %for.cond1.i, !dbg !1084

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ %inc.i117, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1087
    #dbg_value(i32 %j.0.i, !1088, !DIExpression(), !1074)
  %exitcond262 = icmp ne i32 %j.0.i, 8, !dbg !1089
  br i1 %exitcond262, label %for.body3.i, label %for.inc9.i, !dbg !1084

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i113 = shl nuw nsw i32 %i.0.i111, 3, !dbg !1091
  %add.i114 = or disjoint i32 %mul.i113, %j.0.i, !dbg !1093
  %arrayidx.i115 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %add.i114, !dbg !1094
  store i16 0, ptr %arrayidx.i115, align 2, !dbg !1095
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i111, 4, !dbg !1096
  %add.ptr.i116 = getelementptr inbounds nuw i8, ptr %k, i32 %add.ptr.idx.i, !dbg !1096
  %add.ptr6.i = getelementptr inbounds nuw i16, ptr %add.ptr.i116, i32 %j.0.i, !dbg !1097
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i111, !dbg !1098
  %0 = load i8, ptr %arrayidx7.i, align 1, !dbg !1098
  %conv.i = zext i8 %0 to i32, !dbg !1098
    #dbg_value(ptr %add.ptr6.i, !1099, !DIExpression(), !1103)
    #dbg_value(i16 1665, !1105, !DIExpression(), !1103)
    #dbg_value(!DIArgList(i32 %conv.i, i32 %j.0.i), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !1103)
    #dbg_value(!DIArgList(i16 0, i32 %conv.i, i32 %j.0.i), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !1103)
  %1 = load i16, ptr %add.ptr6.i, align 2, !dbg !1107
  %2 = shl nuw nsw i32 1, %j.0.i, !dbg !1108
  %3 = and i32 %2, %conv.i, !dbg !1108
  %4 = icmp eq i32 %3, 0, !dbg !1108
  %xor6.i.i = select i1 %4, i16 %1, i16 1665, !dbg !1109
  store i16 %xor6.i.i, ptr %add.ptr6.i, align 2, !dbg !1109
  %inc.i117 = add nuw nsw i32 %j.0.i, 1, !dbg !1110
    #dbg_value(i32 %inc.i117, !1088, !DIExpression(), !1074)
  br label %for.cond1.i, !dbg !1111, !llvm.loop !1112

for.inc9.i:                                       ; preds = %for.cond1.i
  %inc10.i = add nuw nsw i32 %i.0.i111, 1, !dbg !1114
    #dbg_value(i32 %inc10.i, !1077, !DIExpression(), !1074)
  br label %for.cond.i110, !dbg !1115, !llvm.loop !1116

pqcrystals_kyber1024_ref_poly_frommsg.exit:       ; preds = %for.cond.i110
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1118
    #dbg_value(i32 0, !1119, !DIExpression(), !1015)
  br label %for.cond, !dbg !1120

for.cond:                                         ; preds = %keccak_squeeze.exit, %pqcrystals_kyber1024_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber1024_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit ], !dbg !1122
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber1024_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit ], !dbg !1015
    #dbg_value(i8 %nonce.0, !1021, !DIExpression(), !1015)
    #dbg_value(i32 %i.0, !1119, !DIExpression(), !1015)
  %exitcond264 = icmp ne i32 %i.0, 4, !dbg !1123
  br i1 %exitcond264, label %for.body, label %for.cond5.preheader, !dbg !1125

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !1126

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !1021, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1015)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i2), !dbg !1128
    #dbg_value(ptr %add.ptr, !552, !DIExpression(), !1130)
    #dbg_value(ptr %coins, !554, !DIExpression(), !1130)
    #dbg_value(i8 %nonce.0, !555, !DIExpression(), !1130)
    #dbg_declare(ptr %buf.i2, !556, !DIExpression(), !1131)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1132
    #dbg_value(ptr %buf.i2, !564, !DIExpression(), !1134)
    #dbg_value(i32 128, !566, !DIExpression(), !1134)
    #dbg_value(ptr %coins, !567, !DIExpression(), !1134)
    #dbg_value(i8 %nonce.0, !568, !DIExpression(), !1134)
    #dbg_declare(ptr %extkey.i5, !569, !DIExpression(), !1135)
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %extkey.i5, ptr noundef %coins, i32 noundef 32) #5, !dbg !1132
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %extkey.i5, i32 32, !dbg !1136
  store i8 %nonce.0, ptr %arrayidx.i7, align 1, !dbg !1137
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i65), !dbg !1138
    #dbg_value(ptr %buf.i2, !583, !DIExpression(), !1141)
    #dbg_value(i32 128, !585, !DIExpression(), !1141)
    #dbg_value(ptr %extkey.i5, !586, !DIExpression(), !1141)
    #dbg_value(i32 33, !587, !DIExpression(), !1141)
    #dbg_declare(ptr %state.i65, !588, !DIExpression(), !1142)
    #dbg_value(ptr %state.i65, !590, !DIExpression(), !1143)
    #dbg_value(ptr %extkey.i5, !592, !DIExpression(), !1143)
    #dbg_value(i32 33, !593, !DIExpression(), !1143)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i65, i32 noundef 136, ptr noundef nonnull %extkey.i5, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1138
  %pos.i.i66 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1144
  store i32 136, ptr %pos.i.i66, align 8, !dbg !1145
    #dbg_value(i32 0, !596, !DIExpression(), !1141)
    #dbg_value(ptr %buf.i2, !597, !DIExpression(), !1146)
    #dbg_value(i32 0, !601, !DIExpression(), !1146)
    #dbg_value(ptr %state.i65, !602, !DIExpression(), !1146)
    #dbg_value(ptr %buf.i2, !348, !DIExpression(), !1148)
    #dbg_value(i32 0, !355, !DIExpression(), !1148)
    #dbg_value(ptr %state.i65, !356, !DIExpression(), !1148)
    #dbg_value(i32 136, !357, !DIExpression(), !1148)
    #dbg_value(ptr %buf.i2, !348, !DIExpression(), !1148)
    #dbg_value(i32 0, !355, !DIExpression(), !1148)
    #dbg_value(i32 128, !585, !DIExpression(), !1141)
    #dbg_value(ptr %buf.i2, !583, !DIExpression(), !1141)
    #dbg_value(ptr %buf.i2, !605, !DIExpression(), !1150)
    #dbg_value(i32 128, !609, !DIExpression(), !1150)
    #dbg_value(ptr %state.i65, !610, !DIExpression(), !1150)
  %pos.i1.i68 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1152
  %5 = load i32, ptr %pos.i1.i68, align 8, !dbg !1152
    #dbg_value(ptr %buf.i2, !612, !DIExpression(), !1153)
    #dbg_value(i32 128, !618, !DIExpression(), !1153)
    #dbg_value(ptr %state.i65, !619, !DIExpression(), !1153)
    #dbg_value(i32 %5, !620, !DIExpression(), !1153)
    #dbg_value(i32 136, !621, !DIExpression(), !1153)
  br label %while.cond.i185, !dbg !1155

while.cond.i185:                                  ; preds = %for.end.i194, %for.body
  %pos.addr.0.i = phi i32 [ %5, %for.body ], [ %i.0.i191.lcssa, %for.end.i194 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.body ], [ %sub3.i, %for.end.i194 ]
  %out.addr.0.i186 = phi ptr [ %buf.i2, %for.body ], [ %out.addr.1.i.lcssa, %for.end.i194 ]
    #dbg_value(ptr %out.addr.0.i186, !612, !DIExpression(), !1153)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !1153)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !1153)
  %tobool.not.i187 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1155
  br i1 %tobool.not.i187, label %keccak_squeeze.exit, label %while.body.i188, !dbg !1155

while.body.i188:                                  ; preds = %while.cond.i185
  %cmp.i189 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1156
  br i1 %cmp.i189, label %if.then.i, label %if.end.i, !dbg !1156

if.then.i:                                        ; preds = %while.body.i188
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1157
    #dbg_value(i32 0, !620, !DIExpression(), !1153)
  br label %if.end.i, !dbg !1158

if.end.i:                                         ; preds = %if.then.i, %while.body.i188
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i188 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !1153)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !1153)
  br label %for.cond.i190, !dbg !1159

for.cond.i190:                                    ; preds = %for.body.i195, %if.end.i
  %i.0.i191 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i200, %for.body.i195 ], !dbg !1160
  %out.addr.1.i = phi ptr [ %out.addr.0.i186, %if.end.i ], [ %incdec.ptr.i, %for.body.i195 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !1153)
    #dbg_value(i32 %i.0.i191, !629, !DIExpression(), !1153)
  %cmp1.i = icmp ult i32 %i.0.i191, 136, !dbg !1161
  %add.i192 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1162
  %cmp2.i193 = icmp ult i32 %i.0.i191, %add.i192, !dbg !1162
  %6 = select i1 %cmp1.i, i1 %cmp2.i193, i1 false, !dbg !1162
  br i1 %6, label %for.body.i195, label %for.end.i194, !dbg !1163

for.body.i195:                                    ; preds = %for.cond.i190
  %div1.i = lshr i32 %i.0.i191, 3, !dbg !1164
  %arrayidx.i196 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %div1.i, !dbg !1165
  %7 = load i64, ptr %arrayidx.i196, align 8, !dbg !1165
  %rem.i = shl nuw nsw i32 %i.0.i191, 3, !dbg !1166
  %mul.i197 = and i32 %rem.i, 56, !dbg !1166
  %sh_prom.i = zext nneg i32 %mul.i197 to i64, !dbg !1167
  %shr.i198 = lshr i64 %7, %sh_prom.i, !dbg !1167
  %conv.i199 = trunc i64 %shr.i198 to i8, !dbg !1165
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1153)
  store i8 %conv.i199, ptr %out.addr.1.i, align 1, !dbg !1168
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1169
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !1153)
  %inc.i200 = add nuw nsw i32 %i.0.i191, 1, !dbg !1170
    #dbg_value(i32 %inc.i200, !629, !DIExpression(), !1153)
  br label %for.cond.i190, !dbg !1171, !llvm.loop !1172

for.end.i194:                                     ; preds = %for.cond.i190
  %i.0.i191.lcssa = phi i32 [ %i.0.i191, %for.cond.i190 ], !dbg !1160
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i190 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i191.lcssa, !dbg !1174
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1175
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !1153)
    #dbg_value(i32 %i.0.i191.lcssa, !620, !DIExpression(), !1153)
  br label %while.cond.i185, !dbg !1155, !llvm.loop !1176

keccak_squeeze.exit:                              ; preds = %while.cond.i185
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i185 ]
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !1178
  %pos1.i.i70 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1179
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i70, align 8, !dbg !1180
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i65), !dbg !1181
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1182
    #dbg_value(ptr %add.ptr, !656, !DIExpression(), !1183)
    #dbg_value(ptr %buf.i2, !668, !DIExpression(), !1183)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr, ptr noundef nonnull %buf.i2) #4, !dbg !1185
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i2), !dbg !1186
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !1187
    #dbg_value(i8 %inc, !1021, !DIExpression(), !1015)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !1188
    #dbg_value(i32 %inc4, !1119, !DIExpression(), !1015)
  br label %for.cond, !dbg !1189, !llvm.loop !1190

for.cond5:                                        ; preds = %for.cond5.preheader, %keccak_squeeze.exit230
  %i.1 = phi i32 [ %inc13, %keccak_squeeze.exit230 ], [ 0, %for.cond5.preheader ], !dbg !1192
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit230 ], [ 4, %for.cond5.preheader ], !dbg !1015
    #dbg_value(i8 %nonce.1, !1021, !DIExpression(), !1015)
    #dbg_value(i32 %i.1, !1119, !DIExpression(), !1015)
  %exitcond265 = icmp ne i32 %i.1, 4, !dbg !1193
  br i1 %exitcond265, label %for.body7, label %for.end14, !dbg !1126

for.body7:                                        ; preds = %for.cond5
    #dbg_value(i8 %nonce.1, !1021, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1015)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !1195
    #dbg_value(ptr %add.ptr10, !1198, !DIExpression(), !1199)
    #dbg_value(ptr %coins, !1200, !DIExpression(), !1199)
    #dbg_value(i8 %nonce.1, !1201, !DIExpression(), !1199)
    #dbg_declare(ptr %buf.i, !1202, !DIExpression(), !1203)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !1204
    #dbg_value(ptr %buf.i, !564, !DIExpression(), !1206)
    #dbg_value(i32 128, !566, !DIExpression(), !1206)
    #dbg_value(ptr %coins, !567, !DIExpression(), !1206)
    #dbg_value(i8 %nonce.1, !568, !DIExpression(), !1206)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !1207)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %coins, i32 noundef 32) #5, !dbg !1204
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !1208
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !1209
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i71), !dbg !1210
    #dbg_value(ptr %buf.i, !583, !DIExpression(), !1213)
    #dbg_value(i32 128, !585, !DIExpression(), !1213)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !1213)
    #dbg_value(i32 33, !587, !DIExpression(), !1213)
    #dbg_declare(ptr %state.i71, !588, !DIExpression(), !1214)
    #dbg_value(ptr %state.i71, !590, !DIExpression(), !1215)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !1215)
    #dbg_value(i32 33, !593, !DIExpression(), !1215)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i71, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1210
  %pos.i.i72 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1216
  store i32 136, ptr %pos.i.i72, align 8, !dbg !1217
    #dbg_value(i32 0, !596, !DIExpression(), !1213)
    #dbg_value(ptr %buf.i, !597, !DIExpression(), !1218)
    #dbg_value(i32 0, !601, !DIExpression(), !1218)
    #dbg_value(ptr %state.i71, !602, !DIExpression(), !1218)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !1220)
    #dbg_value(i32 0, !355, !DIExpression(), !1220)
    #dbg_value(ptr %state.i71, !356, !DIExpression(), !1220)
    #dbg_value(i32 136, !357, !DIExpression(), !1220)
    #dbg_value(ptr %buf.i, !348, !DIExpression(), !1220)
    #dbg_value(i32 0, !355, !DIExpression(), !1220)
    #dbg_value(i32 128, !585, !DIExpression(), !1213)
    #dbg_value(ptr %buf.i, !583, !DIExpression(), !1213)
    #dbg_value(ptr %buf.i, !605, !DIExpression(), !1222)
    #dbg_value(i32 128, !609, !DIExpression(), !1222)
    #dbg_value(ptr %state.i71, !610, !DIExpression(), !1222)
  %pos.i1.i74 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1224
  %8 = load i32, ptr %pos.i1.i74, align 8, !dbg !1224
    #dbg_value(ptr %buf.i, !612, !DIExpression(), !1225)
    #dbg_value(i32 128, !618, !DIExpression(), !1225)
    #dbg_value(ptr %state.i71, !619, !DIExpression(), !1225)
    #dbg_value(i32 %8, !620, !DIExpression(), !1225)
    #dbg_value(i32 136, !621, !DIExpression(), !1225)
  br label %while.cond.i201, !dbg !1227

while.cond.i201:                                  ; preds = %for.end.i216, %for.body7
  %pos.addr.0.i202 = phi i32 [ %8, %for.body7 ], [ %i.0.i211.lcssa, %for.end.i216 ]
  %outlen.addr.0.i203 = phi i32 [ 128, %for.body7 ], [ %sub3.i218, %for.end.i216 ]
  %out.addr.0.i204 = phi ptr [ %buf.i, %for.body7 ], [ %out.addr.1.i212.lcssa, %for.end.i216 ]
    #dbg_value(ptr %out.addr.0.i204, !612, !DIExpression(), !1225)
    #dbg_value(i32 %outlen.addr.0.i203, !618, !DIExpression(), !1225)
    #dbg_value(i32 %pos.addr.0.i202, !620, !DIExpression(), !1225)
  %tobool.not.i205 = icmp eq i32 %outlen.addr.0.i203, 0, !dbg !1227
  br i1 %tobool.not.i205, label %keccak_squeeze.exit230, label %while.body.i206, !dbg !1227

while.body.i206:                                  ; preds = %while.cond.i201
  %cmp.i207 = icmp eq i32 %pos.addr.0.i202, 136, !dbg !1228
  br i1 %cmp.i207, label %if.then.i229, label %if.end.i208, !dbg !1228

if.then.i229:                                     ; preds = %while.body.i206
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i71) #4, !dbg !1229
    #dbg_value(i32 0, !620, !DIExpression(), !1225)
  br label %if.end.i208, !dbg !1230

if.end.i208:                                      ; preds = %if.then.i229, %while.body.i206
  %pos.addr.1.i209 = phi i32 [ 0, %if.then.i229 ], [ %pos.addr.0.i202, %while.body.i206 ]
    #dbg_value(i32 %pos.addr.1.i209, !620, !DIExpression(), !1225)
    #dbg_value(i32 %pos.addr.1.i209, !629, !DIExpression(), !1225)
  br label %for.cond.i210, !dbg !1231

for.cond.i210:                                    ; preds = %for.body.i219, %if.end.i208
  %i.0.i211 = phi i32 [ %pos.addr.1.i209, %if.end.i208 ], [ %inc.i228, %for.body.i219 ], !dbg !1232
  %out.addr.1.i212 = phi ptr [ %out.addr.0.i204, %if.end.i208 ], [ %incdec.ptr.i227, %for.body.i219 ]
    #dbg_value(ptr %out.addr.1.i212, !612, !DIExpression(), !1225)
    #dbg_value(i32 %i.0.i211, !629, !DIExpression(), !1225)
  %cmp1.i213 = icmp ult i32 %i.0.i211, 136, !dbg !1233
  %add.i214 = add i32 %pos.addr.1.i209, %outlen.addr.0.i203, !dbg !1234
  %cmp2.i215 = icmp ult i32 %i.0.i211, %add.i214, !dbg !1234
  %9 = select i1 %cmp1.i213, i1 %cmp2.i215, i1 false, !dbg !1234
  br i1 %9, label %for.body.i219, label %for.end.i216, !dbg !1235

for.body.i219:                                    ; preds = %for.cond.i210
  %div1.i220 = lshr i32 %i.0.i211, 3, !dbg !1236
  %arrayidx.i221 = getelementptr inbounds nuw i64, ptr %state.i71, i32 %div1.i220, !dbg !1237
  %10 = load i64, ptr %arrayidx.i221, align 8, !dbg !1237
  %rem.i222 = shl nuw nsw i32 %i.0.i211, 3, !dbg !1238
  %mul.i223 = and i32 %rem.i222, 56, !dbg !1238
  %sh_prom.i224 = zext nneg i32 %mul.i223 to i64, !dbg !1239
  %shr.i225 = lshr i64 %10, %sh_prom.i224, !dbg !1239
  %conv.i226 = trunc i64 %shr.i225 to i8, !dbg !1237
    #dbg_value(ptr %out.addr.1.i212, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1225)
  store i8 %conv.i226, ptr %out.addr.1.i212, align 1, !dbg !1240
  %incdec.ptr.i227 = getelementptr inbounds nuw i8, ptr %out.addr.1.i212, i32 1, !dbg !1241
    #dbg_value(ptr %incdec.ptr.i227, !612, !DIExpression(), !1225)
  %inc.i228 = add nuw nsw i32 %i.0.i211, 1, !dbg !1242
    #dbg_value(i32 %inc.i228, !629, !DIExpression(), !1225)
  br label %for.cond.i210, !dbg !1243, !llvm.loop !1244

for.end.i216:                                     ; preds = %for.cond.i210
  %i.0.i211.lcssa = phi i32 [ %i.0.i211, %for.cond.i210 ], !dbg !1232
  %out.addr.1.i212.lcssa = phi ptr [ %out.addr.1.i212, %for.cond.i210 ]
  %sub.neg.i217 = sub i32 %pos.addr.1.i209, %i.0.i211.lcssa, !dbg !1246
  %sub3.i218 = add i32 %sub.neg.i217, %outlen.addr.0.i203, !dbg !1247
    #dbg_value(i32 %sub3.i218, !618, !DIExpression(), !1225)
    #dbg_value(i32 %i.0.i211.lcssa, !620, !DIExpression(), !1225)
  br label %while.cond.i201, !dbg !1227, !llvm.loop !1248

keccak_squeeze.exit230:                           ; preds = %while.cond.i201
  %pos.addr.0.i202.lcssa = phi i32 [ %pos.addr.0.i202, %while.cond.i201 ]
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !1250
  %pos1.i.i76 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1251
  store i32 %pos.addr.0.i202.lcssa, ptr %pos1.i.i76, align 8, !dbg !1252
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i71), !dbg !1253
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1254
    #dbg_value(ptr %add.ptr10, !1255, !DIExpression(), !1257)
    #dbg_value(ptr %buf.i, !1259, !DIExpression(), !1257)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr10, ptr noundef nonnull %buf.i) #4, !dbg !1260
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !1261
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !1262
    #dbg_value(i8 %inc11, !1021, !DIExpression(), !1015)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !1263
    #dbg_value(i32 %inc13, !1119, !DIExpression(), !1015)
  br label %for.cond5, !dbg !1264, !llvm.loop !1265

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !1021, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1015)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !1267
    #dbg_value(ptr %epp, !1198, !DIExpression(), !1269)
    #dbg_value(ptr %coins, !1200, !DIExpression(), !1269)
    #dbg_value(i8 8, !1201, !DIExpression(), !1269)
    #dbg_declare(ptr %buf.i1, !1202, !DIExpression(), !1270)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1271
    #dbg_value(ptr %buf.i1, !564, !DIExpression(), !1273)
    #dbg_value(i32 128, !566, !DIExpression(), !1273)
    #dbg_value(ptr %coins, !567, !DIExpression(), !1273)
    #dbg_value(i8 8, !568, !DIExpression(), !1273)
    #dbg_declare(ptr %extkey.i8, !569, !DIExpression(), !1274)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1271
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1275
  store i8 8, ptr %arrayidx.i10, align 1, !dbg !1276
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !1277
    #dbg_value(ptr %buf.i1, !583, !DIExpression(), !1280)
    #dbg_value(i32 128, !585, !DIExpression(), !1280)
    #dbg_value(ptr %extkey.i8, !586, !DIExpression(), !1280)
    #dbg_value(i32 33, !587, !DIExpression(), !1280)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !1281)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !1282)
    #dbg_value(ptr %extkey.i8, !592, !DIExpression(), !1282)
    #dbg_value(i32 33, !593, !DIExpression(), !1282)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i8, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1277
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1283
  store i32 136, ptr %pos.i.i, align 8, !dbg !1284
    #dbg_value(i32 0, !596, !DIExpression(), !1280)
    #dbg_value(ptr %buf.i1, !597, !DIExpression(), !1285)
    #dbg_value(i32 0, !601, !DIExpression(), !1285)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !1285)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !1287)
    #dbg_value(i32 0, !355, !DIExpression(), !1287)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !1287)
    #dbg_value(i32 136, !357, !DIExpression(), !1287)
    #dbg_value(ptr %buf.i1, !348, !DIExpression(), !1287)
    #dbg_value(i32 0, !355, !DIExpression(), !1287)
    #dbg_value(i32 128, !585, !DIExpression(), !1280)
    #dbg_value(ptr %buf.i1, !583, !DIExpression(), !1280)
    #dbg_value(ptr %buf.i1, !605, !DIExpression(), !1289)
    #dbg_value(i32 128, !609, !DIExpression(), !1289)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !1289)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1291
  %11 = load i32, ptr %pos.i1.i, align 8, !dbg !1291
    #dbg_value(ptr %buf.i1, !612, !DIExpression(), !1292)
    #dbg_value(i32 128, !618, !DIExpression(), !1292)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !1292)
    #dbg_value(i32 %11, !620, !DIExpression(), !1292)
    #dbg_value(i32 136, !621, !DIExpression(), !1292)
  br label %while.cond.i231, !dbg !1294

while.cond.i231:                                  ; preds = %for.end.i246, %for.end14
  %pos.addr.0.i232 = phi i32 [ %11, %for.end14 ], [ %i.0.i241.lcssa, %for.end.i246 ]
  %outlen.addr.0.i233 = phi i32 [ 128, %for.end14 ], [ %sub3.i248, %for.end.i246 ]
  %out.addr.0.i234 = phi ptr [ %buf.i1, %for.end14 ], [ %out.addr.1.i242.lcssa, %for.end.i246 ]
    #dbg_value(ptr %out.addr.0.i234, !612, !DIExpression(), !1292)
    #dbg_value(i32 %outlen.addr.0.i233, !618, !DIExpression(), !1292)
    #dbg_value(i32 %pos.addr.0.i232, !620, !DIExpression(), !1292)
  %tobool.not.i235 = icmp eq i32 %outlen.addr.0.i233, 0, !dbg !1294
  br i1 %tobool.not.i235, label %keccak_squeeze.exit260, label %while.body.i236, !dbg !1294

while.body.i236:                                  ; preds = %while.cond.i231
  %cmp.i237 = icmp eq i32 %pos.addr.0.i232, 136, !dbg !1295
  br i1 %cmp.i237, label %if.then.i259, label %if.end.i238, !dbg !1295

if.then.i259:                                     ; preds = %while.body.i236
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !1296
    #dbg_value(i32 0, !620, !DIExpression(), !1292)
  br label %if.end.i238, !dbg !1297

if.end.i238:                                      ; preds = %if.then.i259, %while.body.i236
  %pos.addr.1.i239 = phi i32 [ 0, %if.then.i259 ], [ %pos.addr.0.i232, %while.body.i236 ]
    #dbg_value(i32 %pos.addr.1.i239, !620, !DIExpression(), !1292)
    #dbg_value(i32 %pos.addr.1.i239, !629, !DIExpression(), !1292)
  br label %for.cond.i240, !dbg !1298

for.cond.i240:                                    ; preds = %for.body.i249, %if.end.i238
  %i.0.i241 = phi i32 [ %pos.addr.1.i239, %if.end.i238 ], [ %inc.i258, %for.body.i249 ], !dbg !1299
  %out.addr.1.i242 = phi ptr [ %out.addr.0.i234, %if.end.i238 ], [ %incdec.ptr.i257, %for.body.i249 ]
    #dbg_value(ptr %out.addr.1.i242, !612, !DIExpression(), !1292)
    #dbg_value(i32 %i.0.i241, !629, !DIExpression(), !1292)
  %cmp1.i243 = icmp ult i32 %i.0.i241, 136, !dbg !1300
  %add.i244 = add i32 %pos.addr.1.i239, %outlen.addr.0.i233, !dbg !1301
  %cmp2.i245 = icmp ult i32 %i.0.i241, %add.i244, !dbg !1301
  %12 = select i1 %cmp1.i243, i1 %cmp2.i245, i1 false, !dbg !1301
  br i1 %12, label %for.body.i249, label %for.end.i246, !dbg !1302

for.body.i249:                                    ; preds = %for.cond.i240
  %div1.i250 = lshr i32 %i.0.i241, 3, !dbg !1303
  %arrayidx.i251 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i250, !dbg !1304
  %13 = load i64, ptr %arrayidx.i251, align 8, !dbg !1304
  %rem.i252 = shl nuw nsw i32 %i.0.i241, 3, !dbg !1305
  %mul.i253 = and i32 %rem.i252, 56, !dbg !1305
  %sh_prom.i254 = zext nneg i32 %mul.i253 to i64, !dbg !1306
  %shr.i255 = lshr i64 %13, %sh_prom.i254, !dbg !1306
  %conv.i256 = trunc i64 %shr.i255 to i8, !dbg !1304
    #dbg_value(ptr %out.addr.1.i242, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1292)
  store i8 %conv.i256, ptr %out.addr.1.i242, align 1, !dbg !1307
  %incdec.ptr.i257 = getelementptr inbounds nuw i8, ptr %out.addr.1.i242, i32 1, !dbg !1308
    #dbg_value(ptr %incdec.ptr.i257, !612, !DIExpression(), !1292)
  %inc.i258 = add nuw nsw i32 %i.0.i241, 1, !dbg !1309
    #dbg_value(i32 %inc.i258, !629, !DIExpression(), !1292)
  br label %for.cond.i240, !dbg !1310, !llvm.loop !1311

for.end.i246:                                     ; preds = %for.cond.i240
  %i.0.i241.lcssa = phi i32 [ %i.0.i241, %for.cond.i240 ], !dbg !1299
  %out.addr.1.i242.lcssa = phi ptr [ %out.addr.1.i242, %for.cond.i240 ]
  %sub.neg.i247 = sub i32 %pos.addr.1.i239, %i.0.i241.lcssa, !dbg !1313
  %sub3.i248 = add i32 %sub.neg.i247, %outlen.addr.0.i233, !dbg !1314
    #dbg_value(i32 %sub3.i248, !618, !DIExpression(), !1292)
    #dbg_value(i32 %i.0.i241.lcssa, !620, !DIExpression(), !1292)
  br label %while.cond.i231, !dbg !1294, !llvm.loop !1315

keccak_squeeze.exit260:                           ; preds = %while.cond.i231
  %pos.addr.0.i232.lcssa = phi i32 [ %pos.addr.0.i232, %while.cond.i231 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1317
  store i32 %pos.addr.0.i232.lcssa, ptr %pos1.i.i, align 8, !dbg !1318
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1319
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1320
    #dbg_value(ptr %epp, !1255, !DIExpression(), !1321)
    #dbg_value(ptr %buf.i1, !1259, !DIExpression(), !1321)
  call fastcc void @cbd2(ptr noundef nonnull %epp, ptr noundef nonnull %buf.i1) #4, !dbg !1323
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !1324
    #dbg_value(ptr %sp, !1325, !DIExpression(), !1326)
    #dbg_value(i32 0, !761, !DIExpression(), !1326)
  br label %for.cond.i18, !dbg !1328

for.cond.i18:                                     ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit, %keccak_squeeze.exit260
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit260 ], [ %inc.i23, %pqcrystals_kyber1024_ref_poly_reduce.exit ], !dbg !1329
    #dbg_value(i32 %i.0.i19, !761, !DIExpression(), !1326)
  %exitcond267 = icmp ne i32 %i.0.i19, 4, !dbg !1330
  br i1 %exitcond267, label %for.body.i21, label %for.cond16.preheader, !dbg !1331

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1332

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [4 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1334
    #dbg_value(ptr %arrayidx.i22, !768, !DIExpression(), !1335)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1337
    #dbg_value(ptr %arrayidx.i22, !775, !DIExpression(), !1338)
    #dbg_value(i32 0, !779, !DIExpression(), !1338)
  br label %for.cond.i77, !dbg !1340

for.cond.i77:                                     ; preds = %for.body.i80, %for.body.i21
  %i.0.i78 = phi i32 [ 0, %for.body.i21 ], [ %inc.i83, %for.body.i80 ], !dbg !1341
    #dbg_value(i32 %i.0.i78, !779, !DIExpression(), !1338)
  %exitcond266 = icmp ne i32 %i.0.i78, 256, !dbg !1342
  br i1 %exitcond266, label %for.body.i80, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1343

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i78, !dbg !1344
  %14 = load i16, ptr %arrayidx.i81, align 2, !dbg !1344
    #dbg_value(i16 %14, !787, !DIExpression(), !1345)
    #dbg_value(i16 20159, !794, !DIExpression(), !1345)
  %conv.i.i = sext i16 %14 to i32, !dbg !1347
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1348
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1349
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1350
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1345)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1345)
  %15 = trunc nsw i32 %shr.i.i to i16, !dbg !1351
  %16 = mul i16 %15, -3329, !dbg !1351
  %conv7.i.i = add i16 %16, %14, !dbg !1351
  %arrayidx2.i82 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i78, !dbg !1352
  store i16 %conv7.i.i, ptr %arrayidx2.i82, align 2, !dbg !1353
  %inc.i83 = add nuw nsw i32 %i.0.i78, 1, !dbg !1354
    #dbg_value(i32 %inc.i83, !779, !DIExpression(), !1338)
  br label %for.cond.i77, !dbg !1355, !llvm.loop !1356

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i77
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1358
    #dbg_value(i32 %inc.i23, !761, !DIExpression(), !1326)
  br label %for.cond.i18, !dbg !1359, !llvm.loop !1360

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1362
    #dbg_value(i32 %i.2, !1119, !DIExpression(), !1015)
  %exitcond268 = icmp ne i32 %i.2, 4, !dbg !1363
  br i1 %exitcond268, label %for.body18, label %for.end23, !dbg !1332

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1365
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1366
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1367
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1368
    #dbg_value(i32 %inc22, !1119, !DIExpression(), !1015)
  br label %for.cond16, !dbg !1369, !llvm.loop !1370

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1372
    #dbg_value(ptr %b, !1373, !DIExpression(), !1375)
    #dbg_value(i32 0, !1377, !DIExpression(), !1375)
  br label %for.cond.i12, !dbg !1378

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1380
    #dbg_value(i32 %i.0.i13, !1377, !DIExpression(), !1375)
  %exitcond269 = icmp ne i32 %i.0.i13, 4, !dbg !1381
  br i1 %exitcond269, label %for.body.i15, label %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit, !dbg !1383

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1384
    #dbg_value(ptr %arrayidx.i16, !1385, !DIExpression(), !1387)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1389
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1390
    #dbg_value(i32 %inc.i17, !1377, !DIExpression(), !1375)
  br label %for.cond.i12, !dbg !1391, !llvm.loop !1392

pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1385, !DIExpression(), !1394)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1396
    #dbg_value(ptr %b, !1397, !DIExpression(), !1398)
    #dbg_value(ptr %b, !1400, !DIExpression(), !1398)
    #dbg_value(ptr %ep, !1401, !DIExpression(), !1398)
    #dbg_value(i32 0, !897, !DIExpression(), !1398)
  br label %for.cond.i31, !dbg !1402

for.cond.i31:                                     ; preds = %pqcrystals_kyber1024_ref_poly_add.exit, %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit
  %i.0.i32 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit ], [ %inc.i36, %pqcrystals_kyber1024_ref_poly_add.exit ], !dbg !1403
    #dbg_value(i32 %i.0.i32, !897, !DIExpression(), !1398)
  %exitcond271 = icmp ne i32 %i.0.i32, 4, !dbg !1404
  br i1 %exitcond271, label %for.body.i34, label %for.cond.i54.preheader, !dbg !1405

for.cond.i54.preheader:                           ; preds = %for.cond.i31
  br label %for.cond.i54, !dbg !1406

for.body.i34:                                     ; preds = %for.cond.i31
  %arrayidx.i35 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i32, !dbg !1408
  %arrayidx2.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i32, !dbg !1409
  %arrayidx4.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i32, !dbg !1410
    #dbg_value(ptr %arrayidx.i35, !908, !DIExpression(), !1411)
    #dbg_value(ptr %arrayidx2.i, !916, !DIExpression(), !1411)
    #dbg_value(ptr %arrayidx4.i, !917, !DIExpression(), !1411)
    #dbg_value(i32 0, !918, !DIExpression(), !1411)
  br label %for.cond.i37, !dbg !1413

for.cond.i37:                                     ; preds = %for.body.i40, %for.body.i34
  %i.0.i38 = phi i32 [ 0, %for.body.i34 ], [ %inc.i43, %for.body.i40 ], !dbg !1414
    #dbg_value(i32 %i.0.i38, !918, !DIExpression(), !1411)
  %exitcond270 = icmp ne i32 %i.0.i38, 256, !dbg !1415
  br i1 %exitcond270, label %for.body.i40, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !1416

for.body.i40:                                     ; preds = %for.cond.i37
  %arrayidx.i41 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i38, !dbg !1417
  %17 = load i16, ptr %arrayidx.i41, align 2, !dbg !1417
  %arrayidx2.i42 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i38, !dbg !1418
  %18 = load i16, ptr %arrayidx2.i42, align 2, !dbg !1418
  %add.i = add i16 %17, %18, !dbg !1419
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i35, i32 0, i32 %i.0.i38, !dbg !1420
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1421
  %inc.i43 = add nuw nsw i32 %i.0.i38, 1, !dbg !1422
    #dbg_value(i32 %inc.i43, !918, !DIExpression(), !1411)
  br label %for.cond.i37, !dbg !1423, !llvm.loop !1424

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i37
  %inc.i36 = add nuw nsw i32 %i.0.i32, 1, !dbg !1426
    #dbg_value(i32 %inc.i36, !897, !DIExpression(), !1398)
  br label %for.cond.i31, !dbg !1427, !llvm.loop !1428

for.cond.i54:                                     ; preds = %for.cond.i54.preheader, %for.body.i57
  %i.0.i55 = phi i32 [ %inc.i62, %for.body.i57 ], [ 0, %for.cond.i54.preheader ], !dbg !1430
    #dbg_value(i32 %i.0.i55, !918, !DIExpression(), !1431)
  %exitcond272 = icmp ne i32 %i.0.i55, 256, !dbg !1432
  br i1 %exitcond272, label %for.body.i57, label %for.cond.i44.preheader, !dbg !1406

for.cond.i44.preheader:                           ; preds = %for.cond.i54
  br label %for.cond.i44, !dbg !1433

for.body.i57:                                     ; preds = %for.cond.i54
  %arrayidx.i58 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i55, !dbg !1435
  %19 = load i16, ptr %arrayidx.i58, align 2, !dbg !1435
  %arrayidx2.i59 = getelementptr inbounds nuw [256 x i16], ptr %epp, i32 0, i32 %i.0.i55, !dbg !1436
  %20 = load i16, ptr %arrayidx2.i59, align 2, !dbg !1436
  %add.i60 = add i16 %19, %20, !dbg !1437
  %arrayidx6.i61 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i55, !dbg !1438
  store i16 %add.i60, ptr %arrayidx6.i61, align 2, !dbg !1439
  %inc.i62 = add nuw nsw i32 %i.0.i55, 1, !dbg !1440
    #dbg_value(i32 %inc.i62, !918, !DIExpression(), !1431)
  br label %for.cond.i54, !dbg !1441, !llvm.loop !1442

for.cond.i44:                                     ; preds = %for.cond.i44.preheader, %for.body.i47
  %i.0.i45 = phi i32 [ %inc.i52, %for.body.i47 ], [ 0, %for.cond.i44.preheader ], !dbg !1444
    #dbg_value(i32 %i.0.i45, !918, !DIExpression(), !1445)
  %exitcond273 = icmp ne i32 %i.0.i45, 256, !dbg !1446
  br i1 %exitcond273, label %for.body.i47, label %for.cond.i.preheader, !dbg !1433

for.cond.i.preheader:                             ; preds = %for.cond.i44
  br label %for.cond.i, !dbg !1447

for.body.i47:                                     ; preds = %for.cond.i44
  %arrayidx.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1449
  %21 = load i16, ptr %arrayidx.i48, align 2, !dbg !1449
  %arrayidx2.i49 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %i.0.i45, !dbg !1450
  %22 = load i16, ptr %arrayidx2.i49, align 2, !dbg !1450
  %add.i50 = add i16 %21, %22, !dbg !1451
  %arrayidx6.i51 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1452
  store i16 %add.i50, ptr %arrayidx6.i51, align 2, !dbg !1453
  %inc.i52 = add nuw nsw i32 %i.0.i45, 1, !dbg !1454
    #dbg_value(i32 %inc.i52, !918, !DIExpression(), !1445)
  br label %for.cond.i44, !dbg !1455, !llvm.loop !1456

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit96
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit96 ], [ 0, %for.cond.i.preheader ], !dbg !1458
    #dbg_value(i32 %i.0.i, !939, !DIExpression(), !1459)
  %exitcond275 = icmp ne i32 %i.0.i, 4, !dbg !1460
  br i1 %exitcond275, label %for.body.i, label %for.cond.i97.preheader, !dbg !1447

for.cond.i97.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i97, !dbg !1461

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1463
    #dbg_value(ptr %arrayidx.i11, !775, !DIExpression(), !1464)
    #dbg_value(i32 0, !779, !DIExpression(), !1464)
  br label %for.cond.i84, !dbg !1466

for.cond.i84:                                     ; preds = %for.body.i87, %for.body.i
  %i.0.i85 = phi i32 [ 0, %for.body.i ], [ %inc.i95, %for.body.i87 ], !dbg !1467
    #dbg_value(i32 %i.0.i85, !779, !DIExpression(), !1464)
  %exitcond274 = icmp ne i32 %i.0.i85, 256, !dbg !1468
  br i1 %exitcond274, label %for.body.i87, label %pqcrystals_kyber1024_ref_poly_reduce.exit96, !dbg !1469

for.body.i87:                                     ; preds = %for.cond.i84
  %arrayidx.i88 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1470
  %23 = load i16, ptr %arrayidx.i88, align 2, !dbg !1470
    #dbg_value(i16 %23, !787, !DIExpression(), !1471)
    #dbg_value(i16 20159, !794, !DIExpression(), !1471)
  %conv.i.i89 = sext i16 %23 to i32, !dbg !1473
  %mul.i.i90 = mul nsw i32 %conv.i.i89, 20159, !dbg !1474
  %add.i.i91 = add nsw i32 %mul.i.i90, 33554432, !dbg !1475
  %shr.i.i92 = ashr i32 %add.i.i91, 26, !dbg !1476
    #dbg_value(i32 %shr.i.i92, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1471)
    #dbg_value(i32 %shr.i.i92, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1471)
  %24 = trunc nsw i32 %shr.i.i92 to i16, !dbg !1477
  %25 = mul i16 %24, -3329, !dbg !1477
  %conv7.i.i93 = add i16 %25, %23, !dbg !1477
  %arrayidx2.i94 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1478
  store i16 %conv7.i.i93, ptr %arrayidx2.i94, align 2, !dbg !1479
  %inc.i95 = add nuw nsw i32 %i.0.i85, 1, !dbg !1480
    #dbg_value(i32 %inc.i95, !779, !DIExpression(), !1464)
  br label %for.cond.i84, !dbg !1481, !llvm.loop !1482

pqcrystals_kyber1024_ref_poly_reduce.exit96:      ; preds = %for.cond.i84
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1484
    #dbg_value(i32 %inc.i, !939, !DIExpression(), !1459)
  br label %for.cond.i, !dbg !1485, !llvm.loop !1486

for.cond.i97:                                     ; preds = %for.cond.i97.preheader, %for.body.i100
  %i.0.i98 = phi i32 [ %inc.i108, %for.body.i100 ], [ 0, %for.cond.i97.preheader ], !dbg !1488
    #dbg_value(i32 %i.0.i98, !779, !DIExpression(), !1489)
  %exitcond276 = icmp ne i32 %i.0.i98, 256, !dbg !1490
  br i1 %exitcond276, label %for.body.i100, label %pqcrystals_kyber1024_ref_poly_reduce.exit109, !dbg !1461

for.body.i100:                                    ; preds = %for.cond.i97
  %arrayidx.i101 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i98, !dbg !1491
  %26 = load i16, ptr %arrayidx.i101, align 2, !dbg !1491
    #dbg_value(i16 %26, !787, !DIExpression(), !1492)
    #dbg_value(i16 20159, !794, !DIExpression(), !1492)
  %conv.i.i102 = sext i16 %26 to i32, !dbg !1494
  %mul.i.i103 = mul nsw i32 %conv.i.i102, 20159, !dbg !1495
  %add.i.i104 = add nsw i32 %mul.i.i103, 33554432, !dbg !1496
  %shr.i.i105 = ashr i32 %add.i.i104, 26, !dbg !1497
    #dbg_value(i32 %shr.i.i105, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1492)
    #dbg_value(i32 %shr.i.i105, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1492)
  %27 = trunc nsw i32 %shr.i.i105 to i16, !dbg !1498
  %28 = mul i16 %27, -3329, !dbg !1498
  %conv7.i.i106 = add i16 %28, %26, !dbg !1498
  %arrayidx2.i107 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i98, !dbg !1499
  store i16 %conv7.i.i106, ptr %arrayidx2.i107, align 2, !dbg !1500
  %inc.i108 = add nuw nsw i32 %i.0.i98, 1, !dbg !1501
    #dbg_value(i32 %inc.i108, !779, !DIExpression(), !1489)
  br label %for.cond.i97, !dbg !1502, !llvm.loop !1503

pqcrystals_kyber1024_ref_poly_reduce.exit109:     ; preds = %for.cond.i97
    #dbg_value(ptr %c, !1505, !DIExpression(), !1510)
    #dbg_value(ptr %b, !1512, !DIExpression(), !1510)
    #dbg_value(ptr %v, !1513, !DIExpression(), !1510)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1514
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !1515
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %v) #4, !dbg !1516
  ret void, !dbg !1517
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1518 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !1521, !DIExpression(), !1522)
    #dbg_value(ptr %c, !1523, !DIExpression(), !1522)
    #dbg_value(ptr %sk, !1524, !DIExpression(), !1522)
    #dbg_declare(ptr %b, !1525, !DIExpression(), !1526)
    #dbg_declare(ptr %skpv, !1527, !DIExpression(), !1528)
    #dbg_declare(ptr %v, !1529, !DIExpression(), !1530)
    #dbg_declare(ptr %mp, !1531, !DIExpression(), !1532)
    #dbg_value(ptr %b, !1533, !DIExpression(), !1537)
    #dbg_value(ptr %v, !1539, !DIExpression(), !1537)
    #dbg_value(ptr %c, !1540, !DIExpression(), !1537)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1541
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !1542
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr.i) #4, !dbg !1543
    #dbg_value(ptr %skpv, !1544, !DIExpression(), !1548)
    #dbg_value(ptr %sk, !1550, !DIExpression(), !1548)
    #dbg_value(ptr %skpv, !1046, !DIExpression(), !1551)
    #dbg_value(ptr %sk, !1052, !DIExpression(), !1551)
    #dbg_value(i32 0, !1053, !DIExpression(), !1551)
  br label %for.cond.i1, !dbg !1553

for.cond.i1:                                      ; preds = %for.body.i4, %entry
  %i.0.i2 = phi i32 [ 0, %entry ], [ %inc.i7, %for.body.i4 ], !dbg !1554
    #dbg_value(i32 %i.0.i2, !1053, !DIExpression(), !1551)
  %exitcond = icmp ne i32 %i.0.i2, 4, !dbg !1555
  br i1 %exitcond, label %for.body.i4, label %for.cond.i.preheader, !dbg !1556

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1557

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1559
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1560
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1561
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1562
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1563
    #dbg_value(i32 %inc.i7, !1053, !DIExpression(), !1551)
  br label %for.cond.i1, !dbg !1564, !llvm.loop !1565

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1567
    #dbg_value(i32 %i.0.i, !761, !DIExpression(), !1568)
  %exitcond42 = icmp ne i32 %i.0.i, 4, !dbg !1569
  br i1 %exitcond42, label %for.body.i, label %pqcrystals_kyber1024_ref_polyvec_ntt.exit, !dbg !1557

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1570
    #dbg_value(ptr %arrayidx.i, !768, !DIExpression(), !1571)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1573
    #dbg_value(ptr %arrayidx.i, !775, !DIExpression(), !1574)
    #dbg_value(i32 0, !779, !DIExpression(), !1574)
  br label %for.cond.i14, !dbg !1576

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1577
    #dbg_value(i32 %i.0.i15, !779, !DIExpression(), !1574)
  %exitcond41 = icmp ne i32 %i.0.i15, 256, !dbg !1578
  br i1 %exitcond41, label %for.body.i17, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1579

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1580
  %0 = load i16, ptr %arrayidx.i18, align 2, !dbg !1580
    #dbg_value(i16 %0, !787, !DIExpression(), !1581)
    #dbg_value(i16 20159, !794, !DIExpression(), !1581)
  %conv.i.i = sext i16 %0 to i32, !dbg !1583
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1584
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1585
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1586
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1581)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1581)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !1587
  %2 = mul i16 %1, -3329, !dbg !1587
  %conv7.i.i = add i16 %2, %0, !dbg !1587
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1588
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1589
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1590
    #dbg_value(i32 %inc.i20, !779, !DIExpression(), !1574)
  br label %for.cond.i14, !dbg !1591, !llvm.loop !1592

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1594
    #dbg_value(i32 %inc.i, !761, !DIExpression(), !1568)
  br label %for.cond.i, !dbg !1595, !llvm.loop !1596

pqcrystals_kyber1024_ref_polyvec_ntt.exit:        ; preds = %for.cond.i
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1598
    #dbg_value(ptr %mp, !1385, !DIExpression(), !1599)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1601
    #dbg_value(ptr %mp, !1602, !DIExpression(), !1604)
    #dbg_value(ptr %v, !1606, !DIExpression(), !1604)
    #dbg_value(ptr %mp, !1607, !DIExpression(), !1604)
    #dbg_value(i32 0, !1608, !DIExpression(), !1604)
  br label %for.cond.i8, !dbg !1609

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber1024_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !1611
    #dbg_value(i32 %i.0.i9, !1608, !DIExpression(), !1604)
  %exitcond43 = icmp ne i32 %i.0.i9, 256, !dbg !1612
  br i1 %exitcond43, label %for.body.i11, label %for.cond.i21.preheader, !dbg !1614

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !1615

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !1617
  %3 = load i16, ptr %arrayidx.i12, align 2, !dbg !1617
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1618
  %4 = load i16, ptr %arrayidx2.i, align 2, !dbg !1618
  %sub.i = sub i16 %3, %4, !dbg !1619
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1620
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !1621
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !1622
    #dbg_value(i32 %inc.i13, !1608, !DIExpression(), !1604)
  br label %for.cond.i8, !dbg !1623, !llvm.loop !1624

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !1626
    #dbg_value(i32 %i.0.i22, !779, !DIExpression(), !1627)
  %exitcond44 = icmp ne i32 %i.0.i22, 256, !dbg !1628
  br i1 %exitcond44, label %for.body.i24, label %for.cond.i34.preheader, !dbg !1615

for.cond.i34.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i34, !dbg !1629

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1635
  %5 = load i16, ptr %arrayidx.i25, align 2, !dbg !1635
    #dbg_value(i16 %5, !787, !DIExpression(), !1636)
    #dbg_value(i16 20159, !794, !DIExpression(), !1636)
  %conv.i.i26 = sext i16 %5 to i32, !dbg !1638
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !1639
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !1640
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !1641
    #dbg_value(i32 %shr.i.i29, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1636)
    #dbg_value(i32 %shr.i.i29, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1636)
  %6 = trunc nsw i32 %shr.i.i29 to i16, !dbg !1642
  %7 = mul i16 %6, -3329, !dbg !1642
  %conv7.i.i30 = add i16 %7, %5, !dbg !1642
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1643
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !1644
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !1645
    #dbg_value(i32 %inc.i32, !779, !DIExpression(), !1627)
  br label %for.cond.i21, !dbg !1646, !llvm.loop !1647

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc11.i
  %i.0.i35 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i34.preheader ], !dbg !1649
    #dbg_value(i32 %i.0.i35, !1650, !DIExpression(), !1651)
  %exitcond46 = icmp ne i32 %i.0.i35, 32, !dbg !1652
  br i1 %exitcond46, label %for.body.i37, label %pqcrystals_kyber1024_ref_poly_tomsg.exit, !dbg !1629

for.body.i37:                                     ; preds = %for.cond.i34
  %arrayidx.i38 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1654
  store i8 0, ptr %arrayidx.i38, align 1, !dbg !1656
    #dbg_value(i32 0, !1657, !DIExpression(), !1651)
  br label %for.cond1.i, !dbg !1658

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i37
  %j.0.i = phi i32 [ 0, %for.body.i37 ], [ %inc.i40, %for.body3.i ], !dbg !1660
    #dbg_value(i32 %j.0.i, !1657, !DIExpression(), !1651)
  %exitcond45 = icmp ne i32 %j.0.i, 8, !dbg !1661
  br i1 %exitcond45, label %for.body3.i, label %for.inc11.i, !dbg !1663

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i39 = shl nuw nsw i32 %i.0.i35, 3, !dbg !1664
  %add.i = or disjoint i32 %mul.i39, %j.0.i, !dbg !1666
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i, !dbg !1667
  %8 = load i16, ptr %arrayidx4.i, align 2, !dbg !1667
  %conv.i = sext i16 %8 to i32, !dbg !1667
    #dbg_value(i32 %conv.i, !1668, !DIExpression(), !1651)
    #dbg_value(i32 %conv.i, !1668, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1651)
    #dbg_value(i32 %conv.i, !1668, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1651)
  %9 = mul i32 %conv.i, 161270, !dbg !1669
  %mul6.i = add i32 %9, 134257275, !dbg !1669
    #dbg_value(i32 %mul6.i, !1668, !DIExpression(), !1651)
  %shr.i = lshr i32 %mul6.i, 28, !dbg !1670
    #dbg_value(i32 %shr.i, !1668, !DIExpression(), !1651)
  %and.i = and i32 %shr.i, 1, !dbg !1671
    #dbg_value(i32 %and.i, !1668, !DIExpression(), !1651)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !1672
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1673
  %10 = load i8, ptr %arrayidx8.i, align 1, !dbg !1674
  %11 = trunc nuw i32 %shl7.i to i8, !dbg !1674
  %conv10.i = or i8 %10, %11, !dbg !1674
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !1674
  %inc.i40 = add nuw nsw i32 %j.0.i, 1, !dbg !1675
    #dbg_value(i32 %inc.i40, !1657, !DIExpression(), !1651)
  br label %for.cond1.i, !dbg !1676, !llvm.loop !1677

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i35, 1, !dbg !1679
    #dbg_value(i32 %inc12.i, !1650, !DIExpression(), !1651)
  br label %for.cond.i34, !dbg !1680, !llvm.loop !1681

pqcrystals_kyber1024_ref_poly_tomsg.exit:         ; preds = %for.cond.i34
  ret void, !dbg !1683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1684 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !1685, !DIExpression(), !1686)
    #dbg_value(ptr %a, !1687, !DIExpression(), !1686)
    #dbg_declare(ptr %t, !1688, !DIExpression(), !1692)
    #dbg_value(i32 0, !1693, !DIExpression(), !1686)
  br label %for.cond, !dbg !1694

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !1696
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !1685, !DIExpression(), !1686)
    #dbg_value(i32 %i.0, !1693, !DIExpression(), !1686)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !1697
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !1699

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1700

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !1703
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !1685, !DIExpression(), !1686)
    #dbg_value(i32 %j.0, !1704, !DIExpression(), !1686)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !1705
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !1700

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1707

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1710
    #dbg_value(i32 %k.0, !1711, !DIExpression(), !1686)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !1712
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !1707

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1714
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !1716
  %add = or disjoint i32 %mul, %k.0, !dbg !1717
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !1714
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1714
  %isneg = icmp slt i16 %0, 0, !dbg !1718
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1718
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1719
  %add12 = add i16 %and, %0, !dbg !1720
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !1720
  %conv15 = zext i16 %add12 to i64, !dbg !1721
    #dbg_value(i64 %conv15, !1722, !DIExpression(), !1686)
    #dbg_value(i64 %conv15, !1722, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !1686)
    #dbg_value(i64 %conv15, !1722, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !1686)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !1723
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !1723
    #dbg_value(i64 %mul17, !1722, !DIExpression(), !1686)
  %shr18 = lshr i64 %mul17, 31, !dbg !1724
    #dbg_value(i64 %shr18, !1722, !DIExpression(), !1686)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !1725
  %conv20 = and i16 %2, 2047, !dbg !1725
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1726
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !1727
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1728
    #dbg_value(i32 %inc, !1711, !DIExpression(), !1686)
  br label %for.cond4, !dbg !1729, !llvm.loop !1730

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !1732
  %conv25 = trunc i16 %3 to i8, !dbg !1733
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !1734
  %4 = load i16, ptr %t, align 2, !dbg !1735
  %5 = lshr i16 %4, 8, !dbg !1736
  %shr29 = trunc nuw i16 %5 to i8, !dbg !1736
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1737
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !1737
  %conv31 = trunc i16 %6 to i8, !dbg !1737
  %shl32 = shl i8 %conv31, 3, !dbg !1738
  %or = or i8 %shl32, %shr29, !dbg !1739
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !1740
  store i8 %or, ptr %arrayidx34, align 1, !dbg !1741
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1742
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !1742
  %8 = lshr i16 %7, 5, !dbg !1743
  %shr37 = trunc i16 %8 to i8, !dbg !1743
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1744
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !1744
  %conv39 = trunc i16 %9 to i8, !dbg !1744
  %shl40 = shl i8 %conv39, 6, !dbg !1745
  %or41 = or i8 %shl40, %shr37, !dbg !1746
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !1747
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1748
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1749
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !1749
  %11 = lshr i16 %10, 2, !dbg !1750
  %conv47 = trunc i16 %11 to i8, !dbg !1751
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !1752
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !1753
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1754
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !1754
  %13 = lshr i16 %12, 10, !dbg !1755
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !1755
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1756
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !1756
  %conv53 = trunc i16 %14 to i8, !dbg !1756
  %shl54 = shl i8 %conv53, 1, !dbg !1757
  %or55 = or i8 %shl54, %shr51, !dbg !1758
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !1759
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !1760
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1761
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !1761
  %16 = lshr i16 %15, 7, !dbg !1762
  %shr60 = trunc i16 %16 to i8, !dbg !1762
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !1763
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !1763
  %conv62 = trunc i16 %17 to i8, !dbg !1763
  %shl63 = shl i8 %conv62, 4, !dbg !1764
  %or64 = or i8 %shl63, %shr60, !dbg !1765
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !1766
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !1767
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !1768
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !1768
  %19 = lshr i16 %18, 4, !dbg !1769
  %shr69 = trunc i16 %19 to i8, !dbg !1769
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !1770
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !1770
  %conv71 = trunc i16 %20 to i8, !dbg !1770
  %shl72 = shl i8 %conv71, 7, !dbg !1771
  %or73 = or i8 %shl72, %shr69, !dbg !1772
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !1773
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !1774
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !1775
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !1775
  %22 = lshr i16 %21, 1, !dbg !1776
  %conv79 = trunc i16 %22 to i8, !dbg !1777
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !1778
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !1779
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !1780
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !1780
  %24 = lshr i16 %23, 9, !dbg !1781
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !1781
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !1782
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !1782
  %conv85 = trunc i16 %25 to i8, !dbg !1782
  %shl86 = shl i8 %conv85, 2, !dbg !1783
  %or87 = or i8 %shl86, %shr83, !dbg !1784
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !1785
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !1786
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !1787
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !1787
  %27 = lshr i16 %26, 6, !dbg !1788
  %shr92 = trunc i16 %27 to i8, !dbg !1788
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !1789
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !1789
  %conv94 = trunc i16 %28 to i8, !dbg !1789
  %shl95 = shl i8 %conv94, 5, !dbg !1790
  %or96 = or i8 %shl95, %shr92, !dbg !1791
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !1792
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !1793
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !1794
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !1794
  %30 = lshr i16 %29, 3, !dbg !1795
  %conv102 = trunc i16 %30 to i8, !dbg !1796
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !1797
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !1798
    #dbg_value(ptr %r.addr.1, !1685, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !1686)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !1799
    #dbg_value(ptr %add.ptr, !1685, !DIExpression(), !1686)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !1800
    #dbg_value(i32 %inc105, !1704, !DIExpression(), !1686)
  br label %for.cond1, !dbg !1801, !llvm.loop !1802

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !1804
    #dbg_value(i32 %inc108, !1693, !DIExpression(), !1686)
  br label %for.cond, !dbg !1805, !llvm.loop !1806

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !1808
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1809 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !1810, !DIExpression(), !1811)
    #dbg_value(ptr %a, !1812, !DIExpression(), !1811)
    #dbg_declare(ptr %t, !1813, !DIExpression(), !1814)
    #dbg_value(i32 0, !1815, !DIExpression(), !1811)
  br label %for.cond, !dbg !1816

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !1818
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !1812, !DIExpression(), !1811)
    #dbg_value(i32 %i.0, !1815, !DIExpression(), !1811)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !1819
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !1821

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1822

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !1825
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !1812, !DIExpression(), !1811)
    #dbg_value(i32 %j.0, !1826, !DIExpression(), !1811)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !1827
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !1822

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !1829
  %conv = zext i8 %0 to i16, !dbg !1829
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1831
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !1831
  %conv6 = zext i8 %1 to i16, !dbg !1832
  %shl = shl nuw i16 %conv6, 8, !dbg !1833
  %or = or disjoint i16 %shl, %conv, !dbg !1834
  store i16 %or, ptr %t, align 2, !dbg !1835
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1836
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !1836
  %3 = lshr i8 %2, 3, !dbg !1837
  %shr11 = zext nneg i8 %3 to i16, !dbg !1837
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1838
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !1838
  %conv14 = zext i8 %4 to i16, !dbg !1839
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !1840
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !1841
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1842
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !1843
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1844
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !1844
  %6 = lshr i8 %5, 6, !dbg !1845
  %shr21 = zext nneg i8 %6 to i16, !dbg !1845
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !1846
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !1846
  %conv24 = zext i8 %7 to i16, !dbg !1847
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !1848
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !1849
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !1850
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !1850
  %conv29 = zext i8 %8 to i16, !dbg !1851
  %shl30 = shl i16 %conv29, 10, !dbg !1852
  %or31 = or disjoint i16 %or26, %shl30, !dbg !1853
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1854
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !1855
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !1856
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !1856
  %10 = lshr i8 %9, 1, !dbg !1857
  %shr36 = zext nneg i8 %10 to i16, !dbg !1857
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !1858
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !1858
  %conv39 = zext i8 %11 to i16, !dbg !1859
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !1860
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !1861
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1862
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !1863
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !1864
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !1864
  %13 = lshr i8 %12, 4, !dbg !1865
  %shr46 = zext nneg i8 %13 to i16, !dbg !1865
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !1866
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !1866
  %conv49 = zext i8 %14 to i16, !dbg !1867
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !1868
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !1869
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !1870
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !1871
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !1872
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !1872
  %16 = lshr i8 %15, 7, !dbg !1873
  %shr56 = zext nneg i8 %16 to i16, !dbg !1873
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !1874
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !1874
  %conv59 = zext i8 %17 to i16, !dbg !1875
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !1876
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !1877
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !1878
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !1878
  %conv64 = zext i8 %18 to i16, !dbg !1879
  %shl65 = shl i16 %conv64, 9, !dbg !1880
  %or66 = or disjoint i16 %or61, %shl65, !dbg !1881
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !1882
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !1883
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !1884
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !1884
  %20 = lshr i8 %19, 2, !dbg !1885
  %shr71 = zext nneg i8 %20 to i16, !dbg !1885
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !1886
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !1886
  %conv74 = zext i8 %21 to i16, !dbg !1887
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !1888
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !1889
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !1890
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !1891
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !1892
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !1892
  %23 = lshr i8 %22, 5, !dbg !1893
  %shr81 = zext nneg i8 %23 to i16, !dbg !1893
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !1894
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !1894
  %conv84 = zext i8 %24 to i16, !dbg !1895
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !1896
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !1897
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !1898
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !1899
    #dbg_value(ptr %add.ptr, !1812, !DIExpression(), !1811)
    #dbg_value(i32 0, !1900, !DIExpression(), !1811)
  br label %for.cond89, !dbg !1901

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !1903
    #dbg_value(i32 %k.0, !1900, !DIExpression(), !1811)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !1904
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !1906

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1907
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !1907
  %26 = and i16 %25, 2047, !dbg !1908
  %and = zext nneg i16 %26 to i32, !dbg !1908
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1909
  %add = add nuw nsw i32 %mul, 1024, !dbg !1910
  %shr95 = lshr i32 %add, 11, !dbg !1911
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !1912
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1913
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !1914
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !1915
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx97, i32 0, i32 %add99, !dbg !1913
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !1916
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1917
    #dbg_value(i32 %inc, !1900, !DIExpression(), !1811)
  br label %for.cond89, !dbg !1918, !llvm.loop !1919

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !1921
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !1922
    #dbg_value(i32 %inc102, !1826, !DIExpression(), !1811)
  br label %for.cond1, !dbg !1923, !llvm.loop !1924

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !1926
    #dbg_value(i32 %inc105, !1815, !DIExpression(), !1811)
  br label %for.cond, !dbg !1927, !llvm.loop !1928

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !1930
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !945 {
entry:
    #dbg_value(ptr %r, !1931, !DIExpression(), !1932)
    #dbg_value(ptr %a, !1933, !DIExpression(), !1932)
    #dbg_value(i32 0, !979, !DIExpression(), !1932)
  br label %for.cond, !dbg !1934

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1935
    #dbg_value(i32 %i.0, !979, !DIExpression(), !1932)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1936
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1937

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1938
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1939
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1940
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !1941
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1942
    #dbg_value(i32 %inc, !979, !DIExpression(), !1932)
  br label %for.cond, !dbg !1943, !llvm.loop !1944

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1946
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1047 {
entry:
    #dbg_value(ptr %r, !1046, !DIExpression(), !1947)
    #dbg_value(ptr %a, !1052, !DIExpression(), !1947)
    #dbg_value(i32 0, !1053, !DIExpression(), !1947)
  br label %for.cond, !dbg !1948

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1949
    #dbg_value(i32 %i.0, !1053, !DIExpression(), !1947)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1950
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1951

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1952
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1953
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1954
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !1955
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1956
    #dbg_value(i32 %inc, !1053, !DIExpression(), !1947)
  br label %for.cond, !dbg !1957, !llvm.loop !1958

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1960
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !682 {
entry:
    #dbg_value(ptr %r, !1325, !DIExpression(), !1961)
    #dbg_value(i32 0, !761, !DIExpression(), !1961)
  br label %for.cond, !dbg !1962

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_reduce.exit ], !dbg !1963
    #dbg_value(i32 %i.0, !761, !DIExpression(), !1961)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !1964
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !1965

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1966
    #dbg_value(ptr %arrayidx, !768, !DIExpression(), !1967)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %arrayidx) #4, !dbg !1969
    #dbg_value(ptr %arrayidx, !775, !DIExpression(), !1970)
    #dbg_value(i32 0, !779, !DIExpression(), !1970)
  br label %for.cond.i, !dbg !1972

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !1973
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !1970)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !1974
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1975

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !1976
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !1976
    #dbg_value(i16 %0, !787, !DIExpression(), !1977)
    #dbg_value(i16 20159, !794, !DIExpression(), !1977)
  %conv.i.i = sext i16 %0 to i32, !dbg !1979
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1980
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1981
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1982
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1977)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1977)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !1983
  %2 = mul i16 %1, -3329, !dbg !1983
  %conv7.i.i = add i16 %2, %0, !dbg !1983
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !1984
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !1985
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1986
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !1970)
  br label %for.cond.i, !dbg !1987, !llvm.loop !1988

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1990
    #dbg_value(i32 %inc, !761, !DIExpression(), !1961)
  br label %for.cond, !dbg !1991, !llvm.loop !1992

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1994
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1374 {
entry:
    #dbg_value(ptr %r, !1373, !DIExpression(), !1995)
    #dbg_value(i32 0, !1377, !DIExpression(), !1995)
  br label %for.cond, !dbg !1996

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1997
    #dbg_value(i32 %i.0, !1377, !DIExpression(), !1995)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1998
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1999

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2000
    #dbg_value(ptr %arrayidx, !1385, !DIExpression(), !2001)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %arrayidx) #4, !dbg !2003
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2004
    #dbg_value(i32 %inc, !1377, !DIExpression(), !1995)
  br label %for.cond, !dbg !2005, !llvm.loop !2006

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2008
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2009 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !2013, !DIExpression(), !2014)
    #dbg_value(ptr %a, !2015, !DIExpression(), !2014)
    #dbg_value(ptr %b, !2016, !DIExpression(), !2014)
    #dbg_declare(ptr %t, !2017, !DIExpression(), !2018)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !2019
    #dbg_value(i32 1, !2020, !DIExpression(), !2014)
  br label %for.cond, !dbg !2021

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_add.exit ], !dbg !2023
    #dbg_value(i32 %i.0, !2020, !DIExpression(), !2014)
  %exitcond8 = icmp ne i32 %i.0, 4, !dbg !2024
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !2026

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !2027

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2029
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2031
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !2032
    #dbg_value(ptr %r, !908, !DIExpression(), !2033)
    #dbg_value(ptr %r, !916, !DIExpression(), !2033)
    #dbg_value(ptr %t, !917, !DIExpression(), !2033)
    #dbg_value(i32 0, !918, !DIExpression(), !2033)
  br label %for.cond.i, !dbg !2035

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2036
    #dbg_value(i32 %i.0.i, !918, !DIExpression(), !2033)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2037
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !2038

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2039
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2039
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !2040
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2040
  %add.i = add i16 %0, %1, !dbg !2041
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2042
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2043
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2044
    #dbg_value(i32 %inc.i, !918, !DIExpression(), !2033)
  br label %for.cond.i, !dbg !2045, !llvm.loop !2046

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2048
    #dbg_value(i32 %inc, !2020, !DIExpression(), !2014)
  br label %for.cond, !dbg !2049, !llvm.loop !2050

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2052
    #dbg_value(i32 %i.0.i2, !779, !DIExpression(), !2053)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2054
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2027

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2055
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2055
    #dbg_value(i16 %2, !787, !DIExpression(), !2056)
    #dbg_value(i16 20159, !794, !DIExpression(), !2056)
  %conv.i.i = sext i16 %2 to i32, !dbg !2058
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2059
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2060
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2061
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2056)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2056)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2062
  %4 = mul i16 %3, -3329, !dbg !2062
  %conv7.i.i = add i16 %4, %2, !dbg !2062
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2063
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2064
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2065
    #dbg_value(i32 %inc.i7, !779, !DIExpression(), !2053)
  br label %for.cond.i1, !dbg !2066, !llvm.loop !2067

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i1
  ret void, !dbg !2069
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !903 {
entry:
    #dbg_value(ptr %r, !2070, !DIExpression(), !2071)
    #dbg_value(i32 0, !939, !DIExpression(), !2071)
  br label %for.cond, !dbg !2072

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_reduce.exit ], !dbg !2073
    #dbg_value(i32 %i.0, !939, !DIExpression(), !2071)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !2074
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2075

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2076
    #dbg_value(ptr %arrayidx, !775, !DIExpression(), !2077)
    #dbg_value(i32 0, !779, !DIExpression(), !2077)
  br label %for.cond.i, !dbg !2079

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2080
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !2077)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2081
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2082

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2083
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2083
    #dbg_value(i16 %0, !787, !DIExpression(), !2084)
    #dbg_value(i16 20159, !794, !DIExpression(), !2084)
  %conv.i.i = sext i16 %0 to i32, !dbg !2086
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2087
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2088
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2089
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2084)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2084)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2090
  %2 = mul i16 %1, -3329, !dbg !2090
  %conv7.i.i = add i16 %2, %0, !dbg !2090
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2091
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2092
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2093
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !2077)
  br label %for.cond.i, !dbg !2094, !llvm.loop !2095

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2097
    #dbg_value(i32 %inc, !939, !DIExpression(), !2071)
  br label %for.cond, !dbg !2098, !llvm.loop !2099

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2101
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !849 {
entry:
    #dbg_value(ptr %r, !1397, !DIExpression(), !2102)
    #dbg_value(ptr %a, !1400, !DIExpression(), !2102)
    #dbg_value(ptr %b, !1401, !DIExpression(), !2102)
    #dbg_value(i32 0, !897, !DIExpression(), !2102)
  br label %for.cond, !dbg !2103

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_add.exit ], !dbg !2104
    #dbg_value(i32 %i.0, !897, !DIExpression(), !2102)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !2105
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2106

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2107
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2108
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2109
    #dbg_value(ptr %arrayidx, !908, !DIExpression(), !2110)
    #dbg_value(ptr %arrayidx2, !916, !DIExpression(), !2110)
    #dbg_value(ptr %arrayidx4, !917, !DIExpression(), !2110)
    #dbg_value(i32 0, !918, !DIExpression(), !2110)
  br label %for.cond.i, !dbg !2112

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2113
    #dbg_value(i32 %i.0.i, !918, !DIExpression(), !2110)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2114
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !2115

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2116
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2116
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2117
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2117
  %add.i = add i16 %0, %1, !dbg !2118
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2119
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2120
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2121
    #dbg_value(i32 %inc.i, !918, !DIExpression(), !2110)
  br label %for.cond.i, !dbg !2122, !llvm.loop !2123

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2125
    #dbg_value(i32 %inc, !897, !DIExpression(), !2102)
  br label %for.cond, !dbg !2126, !llvm.loop !2127

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2129
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2130 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2131, !DIExpression(), !2132)
    #dbg_value(ptr %a, !2133, !DIExpression(), !2132)
    #dbg_declare(ptr %t, !2134, !DIExpression(), !2136)
    #dbg_value(i32 0, !2137, !DIExpression(), !2132)
  br label %for.cond, !dbg !2138

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !2140
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2131, !DIExpression(), !2132)
    #dbg_value(i32 %i.0, !2137, !DIExpression(), !2132)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2141
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !2143

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2144

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2147
    #dbg_value(i32 %j.0, !2148, !DIExpression(), !2132)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2149
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2144

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2151
  %add = or disjoint i32 %mul, %j.0, !dbg !2153
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2154
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2154
    #dbg_value(i16 %0, !2155, !DIExpression(), !2132)
  %isneg = icmp slt i16 %0, 0, !dbg !2156
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2156
  %add5 = add i16 %and, %0, !dbg !2157
    #dbg_value(i16 %add5, !2155, !DIExpression(), !2132)
  %conv7 = sext i16 %add5 to i32, !dbg !2158
    #dbg_value(i32 %conv7, !2159, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !2132)
    #dbg_value(i32 %conv7, !2159, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !2132)
  %1 = mul i32 %conv7, 1290176, !dbg !2160
  %mul9 = add i32 %1, 67089152, !dbg !2160
    #dbg_value(i32 %mul9, !2159, !DIExpression(), !2132)
  %shr10 = lshr i32 %mul9, 27, !dbg !2161
    #dbg_value(i32 %shr10, !2159, !DIExpression(), !2132)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2162
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2163
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2164
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2165
    #dbg_value(i32 %inc, !2148, !DIExpression(), !2132)
  br label %for.cond1, !dbg !2166, !llvm.loop !2167

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2169
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2170
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !2170
  %shl19 = shl i8 %3, 5, !dbg !2171
  %or = or i8 %shl19, %2, !dbg !2172
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2173
  %4 = lshr i8 %3, 3, !dbg !2174
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2175
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !2175
  %shl27 = shl i8 %5, 2, !dbg !2176
  %or28 = or i8 %shl27, %4, !dbg !2177
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2178
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2178
  %shl31 = shl i8 %6, 7, !dbg !2179
  %or32 = or i8 %or28, %shl31, !dbg !2180
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2181
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !2182
  %7 = lshr i8 %6, 1, !dbg !2183
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2184
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !2184
  %shl40 = shl i8 %8, 4, !dbg !2185
  %or41 = or i8 %shl40, %7, !dbg !2186
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2187
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !2188
  %9 = lshr i8 %8, 4, !dbg !2189
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2190
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !2190
  %shl49 = shl i8 %10, 1, !dbg !2191
  %or50 = or i8 %shl49, %9, !dbg !2192
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2193
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !2193
  %shl53 = shl i8 %11, 6, !dbg !2194
  %or54 = or i8 %or50, %shl53, !dbg !2195
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2196
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !2197
  %12 = lshr i8 %11, 2, !dbg !2198
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2199
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !2199
  %shl62 = shl i8 %13, 3, !dbg !2200
  %or63 = or i8 %shl62, %12, !dbg !2201
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2202
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !2203
    #dbg_value(ptr %r.addr.0, !2131, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !2132)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !2204
    #dbg_value(ptr %add.ptr, !2131, !DIExpression(), !2132)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !2205
    #dbg_value(i32 %inc67, !2137, !DIExpression(), !2132)
  br label %for.cond, !dbg !2206, !llvm.loop !2207

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !2209
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2210 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2211, !DIExpression(), !2212)
    #dbg_value(ptr %a, !2213, !DIExpression(), !2212)
    #dbg_declare(ptr %t, !2214, !DIExpression(), !2215)
    #dbg_value(i32 0, !2216, !DIExpression(), !2212)
  br label %for.cond, !dbg !2217

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !2219
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !2213, !DIExpression(), !2212)
    #dbg_value(i32 %i.0, !2216, !DIExpression(), !2212)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2220
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !2222

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2223
  store i8 %0, ptr %t, align 1, !dbg !2225
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2226
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !2226
  %or = call i8 @llvm.fshl.i8(i8 %1, i8 %0, i8 3), !dbg !2227
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2228
  store i8 %or, ptr %arrayidx9, align 1, !dbg !2229
  %2 = lshr i8 %1, 2, !dbg !2230
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2231
  store i8 %2, ptr %arrayidx14, align 1, !dbg !2232
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2233
  %3 = load i8, ptr %arrayidx15, align 1, !dbg !2233
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !2234
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !2234
  %or21 = call i8 @llvm.fshl.i8(i8 %4, i8 %3, i8 1), !dbg !2235
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2236
  store i8 %or21, ptr %arrayidx23, align 1, !dbg !2237
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !2238
  %5 = load i8, ptr %arrayidx27, align 1, !dbg !2238
  %or30 = call i8 @llvm.fshl.i8(i8 %5, i8 %4, i8 4), !dbg !2239
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2240
  store i8 %or30, ptr %arrayidx32, align 1, !dbg !2241
  %6 = lshr i8 %5, 1, !dbg !2242
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2243
  store i8 %6, ptr %arrayidx37, align 1, !dbg !2244
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !2245
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !2245
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !2246
  %8 = load i8, ptr %arrayidx41, align 1, !dbg !2246
  %or44 = call i8 @llvm.fshl.i8(i8 %8, i8 %7, i8 2), !dbg !2247
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2248
  store i8 %or44, ptr %arrayidx46, align 1, !dbg !2249
  %9 = lshr i8 %8, 3, !dbg !2250
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2251
  store i8 %9, ptr %arrayidx51, align 1, !dbg !2252
    #dbg_value(ptr %add.ptr, !2213, !DIExpression(), !2212)
    #dbg_value(i32 0, !2253, !DIExpression(), !2212)
  br label %for.cond52, !dbg !2254

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !2256
    #dbg_value(i32 %j.0, !2253, !DIExpression(), !2212)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2257
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !2259

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2260
  %10 = load i8, ptr %arrayidx56, align 1, !dbg !2260
  %11 = and i8 %10, 31, !dbg !2261
  %and = zext nneg i8 %11 to i32, !dbg !2261
  %mul = mul nuw nsw i32 %and, 3329, !dbg !2262
  %add = add nuw nsw i32 %mul, 16, !dbg !2263
  %shr58 = lshr i32 %add, 5, !dbg !2264
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !2265
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !2266
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !2267
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !2268
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !2269
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2270
    #dbg_value(i32 %inc, !2253, !DIExpression(), !2212)
  br label %for.cond52, !dbg !2271, !llvm.loop !2272

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !2274
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !2275
    #dbg_value(i32 %inc64, !2216, !DIExpression(), !2212)
  br label %for.cond, !dbg !2276, !llvm.loop !2277

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !2279
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2280 {
entry:
    #dbg_value(ptr %r, !2281, !DIExpression(), !2282)
    #dbg_value(ptr %a, !2283, !DIExpression(), !2282)
    #dbg_value(i32 0, !2284, !DIExpression(), !2282)
  br label %for.cond, !dbg !2285

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2287
    #dbg_value(i32 %i.0, !2284, !DIExpression(), !2282)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2288
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2290

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2291
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2293
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2293
    #dbg_value(i16 %0, !2294, !DIExpression(), !2282)
  %isneg = icmp slt i16 %0, 0, !dbg !2295
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2295
  %add = add i16 %and, %0, !dbg !2296
    #dbg_value(i16 %add, !2294, !DIExpression(), !2282)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2297
  %add5 = or disjoint i32 %mul4, 1, !dbg !2298
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2299
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2299
    #dbg_value(i16 %1, !2300, !DIExpression(), !2282)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2301
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2301
  %add11 = add i16 %and9, %1, !dbg !2302
    #dbg_value(i16 %add11, !2300, !DIExpression(), !2282)
  %conv15 = trunc i16 %add to i8, !dbg !2303
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2304
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2305
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2306
  %2 = lshr i16 %add, 8, !dbg !2307
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2307
  %conv21 = trunc i16 %add11 to i8, !dbg !2308
  %shl = shl i8 %conv21, 4, !dbg !2309
  %or = or i8 %shl, %shr20, !dbg !2310
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2311
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2312
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2312
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2313
  %4 = lshr i16 %add11, 4, !dbg !2314
  %conv28 = trunc i16 %4 to i8, !dbg !2315
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2316
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2317
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2317
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2318
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2319
    #dbg_value(i32 %inc, !2284, !DIExpression(), !2282)
  br label %for.cond, !dbg !2320, !llvm.loop !2321

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2323
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2324 {
entry:
    #dbg_value(ptr %r, !2325, !DIExpression(), !2326)
    #dbg_value(ptr %a, !2327, !DIExpression(), !2326)
    #dbg_value(i32 0, !2328, !DIExpression(), !2326)
  br label %for.cond, !dbg !2329

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2331
    #dbg_value(i32 %i.0, !2328, !DIExpression(), !2326)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2332
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2334

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2335
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2337
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2337
  %conv = zext i8 %0 to i16, !dbg !2337
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2338
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2339
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2339
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2339
  %conv5 = zext i8 %2 to i16, !dbg !2340
  %shl = shl nuw i16 %conv5, 8, !dbg !2341
  %shl.masked = and i16 %shl, 3840, !dbg !2342
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2342
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2343
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2344
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2345
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2346
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2347
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2347
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2347
  %5 = lshr i8 %4, 4, !dbg !2348
  %shr13 = zext nneg i8 %5 to i16, !dbg !2348
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2349
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2350
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2350
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2350
  %conv18 = zext i8 %7 to i16, !dbg !2351
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2352
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2353
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2354
  %add25 = or disjoint i32 %mul24, 1, !dbg !2355
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2356
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2357
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2358
    #dbg_value(i32 %inc, !2328, !DIExpression(), !2326)
  br label %for.cond, !dbg !2359, !llvm.loop !2360

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2362
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1071 {
entry:
    #dbg_value(ptr %r, !1070, !DIExpression(), !2363)
    #dbg_value(ptr %msg, !1076, !DIExpression(), !2363)
    #dbg_value(i32 0, !1077, !DIExpression(), !2363)
  br label %for.cond, !dbg !2364

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2365
    #dbg_value(i32 %i.0, !1077, !DIExpression(), !2363)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2366
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2367

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2368

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2369
    #dbg_value(i32 %j.0, !1088, !DIExpression(), !2363)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2370
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2368

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2371
  %add = or disjoint i32 %mul, %j.0, !dbg !2372
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2373
  store i16 0, ptr %arrayidx, align 2, !dbg !2374
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2375
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2375
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2376
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2377
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2377
  %conv = zext i8 %0 to i32, !dbg !2377
    #dbg_value(ptr %add.ptr6, !1099, !DIExpression(), !2378)
    #dbg_value(i16 1665, !1105, !DIExpression(), !2378)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2378)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2378)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2380
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2381
  %3 = and i32 %2, %conv, !dbg !2381
  %4 = icmp eq i32 %3, 0, !dbg !2381
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2382
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2382
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2383
    #dbg_value(i32 %inc, !1088, !DIExpression(), !2363)
  br label %for.cond1, !dbg !2384, !llvm.loop !2385

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2387
    #dbg_value(i32 %inc10, !1077, !DIExpression(), !2363)
  br label %for.cond, !dbg !2388, !llvm.loop !2389

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2391
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1631 {
entry:
    #dbg_value(ptr %msg, !2392, !DIExpression(), !2393)
    #dbg_value(ptr %a, !2394, !DIExpression(), !2393)
    #dbg_value(i32 0, !1650, !DIExpression(), !2393)
  br label %for.cond, !dbg !2395

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2396
    #dbg_value(i32 %i.0, !1650, !DIExpression(), !2393)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2397
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2398

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2399
  store i8 0, ptr %arrayidx, align 1, !dbg !2400
    #dbg_value(i32 0, !1657, !DIExpression(), !2393)
  br label %for.cond1, !dbg !2401

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2402
    #dbg_value(i32 %j.0, !1657, !DIExpression(), !2393)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2403
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2404

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2405
  %add = or disjoint i32 %mul, %j.0, !dbg !2406
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2407
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2407
  %conv = sext i16 %0 to i32, !dbg !2407
    #dbg_value(i32 %conv, !1668, !DIExpression(), !2393)
    #dbg_value(i32 %conv, !1668, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2393)
    #dbg_value(i32 %conv, !1668, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2393)
  %1 = mul i32 %conv, 161270, !dbg !2408
  %mul6 = add i32 %1, 134257275, !dbg !2408
    #dbg_value(i32 %mul6, !1668, !DIExpression(), !2393)
  %shr = lshr i32 %mul6, 28, !dbg !2409
    #dbg_value(i32 %shr, !1668, !DIExpression(), !2393)
  %and = and i32 %shr, 1, !dbg !2410
    #dbg_value(i32 %and, !1668, !DIExpression(), !2393)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2411
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2412
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2413
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2413
  %conv10 = or i8 %2, %3, !dbg !2413
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2413
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2414
    #dbg_value(i32 %inc, !1657, !DIExpression(), !2393)
  br label %for.cond1, !dbg !2415, !llvm.loop !2416

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2418
    #dbg_value(i32 %inc12, !1650, !DIExpression(), !2393)
  br label %for.cond, !dbg !2419, !llvm.loop !2420

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2422
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !542 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !552, !DIExpression(), !2423)
    #dbg_value(ptr %seed, !554, !DIExpression(), !2423)
    #dbg_value(i8 %nonce, !555, !DIExpression(), !2423)
    #dbg_declare(ptr %buf, !556, !DIExpression(), !2424)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2425
    #dbg_value(ptr %buf, !564, !DIExpression(), !2427)
    #dbg_value(i32 128, !566, !DIExpression(), !2427)
    #dbg_value(ptr %seed, !567, !DIExpression(), !2427)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !2427)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !2428)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2425
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2429
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2430
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2431
    #dbg_value(ptr %buf, !583, !DIExpression(), !2434)
    #dbg_value(i32 128, !585, !DIExpression(), !2434)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !2434)
    #dbg_value(i32 33, !587, !DIExpression(), !2434)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !2435)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !2436)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !2436)
    #dbg_value(i32 33, !593, !DIExpression(), !2436)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2431
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2437
  store i32 136, ptr %pos.i.i, align 8, !dbg !2438
    #dbg_value(i32 0, !596, !DIExpression(), !2434)
    #dbg_value(ptr %buf, !597, !DIExpression(), !2439)
    #dbg_value(i32 0, !601, !DIExpression(), !2439)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !2439)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2441)
    #dbg_value(i32 0, !355, !DIExpression(), !2441)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2441)
    #dbg_value(i32 136, !357, !DIExpression(), !2441)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2441)
    #dbg_value(i32 0, !355, !DIExpression(), !2441)
    #dbg_value(i32 128, !585, !DIExpression(), !2434)
    #dbg_value(ptr %buf, !583, !DIExpression(), !2434)
    #dbg_value(ptr %buf, !605, !DIExpression(), !2443)
    #dbg_value(i32 128, !609, !DIExpression(), !2443)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !2443)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2445
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2445
    #dbg_value(ptr %buf, !612, !DIExpression(), !2446)
    #dbg_value(i32 128, !618, !DIExpression(), !2446)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !2446)
    #dbg_value(i32 %0, !620, !DIExpression(), !2446)
    #dbg_value(i32 136, !621, !DIExpression(), !2446)
  br label %while.cond.i2, !dbg !2448

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !2446)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !2446)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !2446)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2448
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2448

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2449
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2449

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2450
    #dbg_value(i32 0, !620, !DIExpression(), !2446)
  br label %if.end.i, !dbg !2451

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !2446)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !2446)
  br label %for.cond.i7, !dbg !2452

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2453
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !2446)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !2446)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2454
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2455
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2455
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2455
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2456

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2457
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2458
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2458
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2459
  %mul.i12 = and i32 %rem.i, 56, !dbg !2459
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2460
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2460
  %conv.i = trunc i64 %shr.i to i8, !dbg !2458
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2446)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2461
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2462
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !2446)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2463
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !2446)
  br label %for.cond.i7, !dbg !2464, !llvm.loop !2465

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2453
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2467
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2468
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !2446)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !2446)
  br label %while.cond.i2, !dbg !2448, !llvm.loop !2469

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2471
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2472
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2473
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2474
    #dbg_value(ptr %r, !656, !DIExpression(), !2475)
    #dbg_value(ptr %buf, !668, !DIExpression(), !2475)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2477
  ret void, !dbg !2478
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1196 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1198, !DIExpression(), !2479)
    #dbg_value(ptr %seed, !1200, !DIExpression(), !2479)
    #dbg_value(i8 %nonce, !1201, !DIExpression(), !2479)
    #dbg_declare(ptr %buf, !1202, !DIExpression(), !2480)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2481
    #dbg_value(ptr %buf, !564, !DIExpression(), !2483)
    #dbg_value(i32 128, !566, !DIExpression(), !2483)
    #dbg_value(ptr %seed, !567, !DIExpression(), !2483)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !2483)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !2484)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2481
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2485
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2486
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2487
    #dbg_value(ptr %buf, !583, !DIExpression(), !2490)
    #dbg_value(i32 128, !585, !DIExpression(), !2490)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !2490)
    #dbg_value(i32 33, !587, !DIExpression(), !2490)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !2491)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !2492)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !2492)
    #dbg_value(i32 33, !593, !DIExpression(), !2492)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2487
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2493
  store i32 136, ptr %pos.i.i, align 8, !dbg !2494
    #dbg_value(i32 0, !596, !DIExpression(), !2490)
    #dbg_value(ptr %buf, !597, !DIExpression(), !2495)
    #dbg_value(i32 0, !601, !DIExpression(), !2495)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !2495)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2497)
    #dbg_value(i32 0, !355, !DIExpression(), !2497)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2497)
    #dbg_value(i32 136, !357, !DIExpression(), !2497)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2497)
    #dbg_value(i32 0, !355, !DIExpression(), !2497)
    #dbg_value(i32 128, !585, !DIExpression(), !2490)
    #dbg_value(ptr %buf, !583, !DIExpression(), !2490)
    #dbg_value(ptr %buf, !605, !DIExpression(), !2499)
    #dbg_value(i32 128, !609, !DIExpression(), !2499)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !2499)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2501
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2501
    #dbg_value(ptr %buf, !612, !DIExpression(), !2502)
    #dbg_value(i32 128, !618, !DIExpression(), !2502)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !2502)
    #dbg_value(i32 %0, !620, !DIExpression(), !2502)
    #dbg_value(i32 136, !621, !DIExpression(), !2502)
  br label %while.cond.i2, !dbg !2504

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !2502)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !2502)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !2502)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2504
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2504

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2505
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2505

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2506
    #dbg_value(i32 0, !620, !DIExpression(), !2502)
  br label %if.end.i, !dbg !2507

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !2502)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !2502)
  br label %for.cond.i7, !dbg !2508

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2509
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !2502)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !2502)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2510
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2511
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2511
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2511
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2512

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2513
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2514
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2514
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2515
  %mul.i12 = and i32 %rem.i, 56, !dbg !2515
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2516
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2516
  %conv.i = trunc i64 %shr.i to i8, !dbg !2514
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2502)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2517
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2518
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !2502)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2519
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !2502)
  br label %for.cond.i7, !dbg !2520, !llvm.loop !2521

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2509
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2523
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2524
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !2502)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !2502)
  br label %while.cond.i2, !dbg !2504, !llvm.loop !2525

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2527
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2528
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2529
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2530
    #dbg_value(ptr %r, !1255, !DIExpression(), !2531)
    #dbg_value(ptr %buf, !1259, !DIExpression(), !2531)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2533
  ret void, !dbg !2534
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !769 {
entry:
    #dbg_value(ptr %r, !768, !DIExpression(), !2535)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #4, !dbg !2536
    #dbg_value(ptr %r, !775, !DIExpression(), !2537)
    #dbg_value(i32 0, !779, !DIExpression(), !2537)
  br label %for.cond.i, !dbg !2539

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2540
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !2537)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2541
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2542

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2543
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2543
    #dbg_value(i16 %0, !787, !DIExpression(), !2544)
    #dbg_value(i16 20159, !794, !DIExpression(), !2544)
  %conv.i.i = sext i16 %0 to i32, !dbg !2546
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2547
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2548
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2549
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2544)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2544)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2550
  %2 = mul i16 %1, -3329, !dbg !2550
  %conv7.i.i = add i16 %2, %0, !dbg !2550
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2551
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2552
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2553
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !2537)
  br label %for.cond.i, !dbg !2554, !llvm.loop !2555

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  ret void, !dbg !2557
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !776 {
entry:
    #dbg_value(ptr %r, !775, !DIExpression(), !2558)
    #dbg_value(i32 0, !779, !DIExpression(), !2558)
  br label %for.cond, !dbg !2559

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2560
    #dbg_value(i32 %i.0, !779, !DIExpression(), !2558)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2561
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2562

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2563
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2563
    #dbg_value(i16 %0, !787, !DIExpression(), !2564)
    #dbg_value(i16 20159, !794, !DIExpression(), !2564)
  %conv.i = sext i16 %0 to i32, !dbg !2566
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2567
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2568
  %shr.i = ashr i32 %add.i, 26, !dbg !2569
    #dbg_value(i32 %shr.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2564)
    #dbg_value(i32 %shr.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2564)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2570
  %2 = mul i16 %1, -3329, !dbg !2570
  %conv7.i = add i16 %2, %0, !dbg !2570
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2571
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2572
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2573
    #dbg_value(i32 %inc, !779, !DIExpression(), !2558)
  br label %for.cond, !dbg !2574, !llvm.loop !2575

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2577
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1386 {
entry:
    #dbg_value(ptr %r, !1385, !DIExpression(), !2578)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #4, !dbg !2579
  ret void, !dbg !2580
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2581 {
entry:
    #dbg_value(ptr %r, !2582, !DIExpression(), !2583)
    #dbg_value(ptr %a, !2584, !DIExpression(), !2583)
    #dbg_value(ptr %b, !2585, !DIExpression(), !2583)
    #dbg_value(i32 0, !2586, !DIExpression(), !2583)
  br label %for.cond, !dbg !2587

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2589
    #dbg_value(i32 %i.0, !2586, !DIExpression(), !2583)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2590
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2592

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2593
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2595
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2596
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2597
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2598
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2599
  %add = or disjoint i32 %i.0, 64, !dbg !2600
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !2601
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2601
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2602
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2603
  %add10 = or disjoint i32 %mul9, 2, !dbg !2604
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2605
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2606
  %add14 = or disjoint i32 %mul13, 2, !dbg !2607
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2608
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2609
  %add18 = or disjoint i32 %mul17, 2, !dbg !2610
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2611
  %add20 = or disjoint i32 %i.0, 64, !dbg !2612
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !2613
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2613
  %sub = sub i16 0, %1, !dbg !2614
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2615
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2616
    #dbg_value(i32 %inc, !2586, !DIExpression(), !2583)
  br label %for.cond, !dbg !2617, !llvm.loop !2618

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2620
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !861 {
entry:
    #dbg_value(ptr %r, !860, !DIExpression(), !2621)
    #dbg_value(i16 1353, !864, !DIExpression(), !2621)
    #dbg_value(i32 0, !865, !DIExpression(), !2621)
  br label %for.cond, !dbg !2622

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2623
    #dbg_value(i32 %i.0, !865, !DIExpression(), !2621)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2624
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2625

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2626
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2626
  %conv = sext i16 %0 to i32, !dbg !2627
  %mul = mul nsw i32 %conv, 1353, !dbg !2628
    #dbg_value(i32 %mul, !875, !DIExpression(), !2629)
    #dbg_value(i32 %mul, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2629)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2631
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2631
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2632
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2633
  %shr.i = lshr i32 %sub.i, 16, !dbg !2634
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2635
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2629)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2636
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2637
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2638
    #dbg_value(i32 %inc, !865, !DIExpression(), !2621)
  br label %for.cond, !dbg !2639, !llvm.loop !2640

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2642
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !909 {
entry:
    #dbg_value(ptr %r, !908, !DIExpression(), !2643)
    #dbg_value(ptr %a, !916, !DIExpression(), !2643)
    #dbg_value(ptr %b, !917, !DIExpression(), !2643)
    #dbg_value(i32 0, !918, !DIExpression(), !2643)
  br label %for.cond, !dbg !2644

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2645
    #dbg_value(i32 %i.0, !918, !DIExpression(), !2643)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2646
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2647

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2648
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2648
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2649
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2649
  %add = add i16 %0, %1, !dbg !2650
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2651
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2652
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2653
    #dbg_value(i32 %inc, !918, !DIExpression(), !2643)
  br label %for.cond, !dbg !2654, !llvm.loop !2655

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2657
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1603 {
entry:
    #dbg_value(ptr %r, !1602, !DIExpression(), !2658)
    #dbg_value(ptr %a, !1606, !DIExpression(), !2658)
    #dbg_value(ptr %b, !1607, !DIExpression(), !2658)
    #dbg_value(i32 0, !1608, !DIExpression(), !2658)
  br label %for.cond, !dbg !2659

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2660
    #dbg_value(i32 %i.0, !1608, !DIExpression(), !2658)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2661
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2662

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2663
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2663
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2664
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2664
  %sub = sub i16 %0, %1, !dbg !2665
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2666
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2667
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2668
    #dbg_value(i32 %inc, !1608, !DIExpression(), !2658)
  br label %for.cond, !dbg !2669, !llvm.loop !2670

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2672
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2673 {
entry:
    #dbg_value(ptr %r, !2676, !DIExpression(), !2677)
    #dbg_value(i32 1, !2678, !DIExpression(), !2677)
    #dbg_value(i32 128, !2679, !DIExpression(), !2677)
  br label %for.cond, !dbg !2680

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2682
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2683
    #dbg_value(i32 %k.0, !2678, !DIExpression(), !2677)
    #dbg_value(i32 %len.0, !2679, !DIExpression(), !2677)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2684
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2686

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2687

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2690
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2677
    #dbg_value(i32 %k.1, !2678, !DIExpression(), !2677)
    #dbg_value(i32 %start.0, !2691, !DIExpression(), !2677)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2692
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2687

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2678, !DIExpression(), !2677)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !2694
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2694
    #dbg_value(i16 %0, !2696, !DIExpression(), !2677)
    #dbg_value(i32 %start.0, !2697, !DIExpression(), !2677)
  br label %for.cond4, !dbg !2698

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2700
    #dbg_value(i32 %j.0, !2697, !DIExpression(), !2677)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2701
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2703
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !2704

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2705
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !2705
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !2705
    #dbg_value(i16 %0, !2707, !DIExpression(), !2711)
    #dbg_value(i16 %2, !2713, !DIExpression(), !2711)
  %conv.i = sext i16 %0 to i32, !dbg !2714
  %conv1.i = sext i16 %2 to i32, !dbg !2715
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2716
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2717)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2717)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2719
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2719
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2720
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2721
  %shr.i = lshr i32 %sub.i, 16, !dbg !2722
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2723
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2717)
    #dbg_value(i16 %conv5.i, !2724, !DIExpression(), !2677)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2725
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2725
  %sub = sub i16 %3, %conv5.i, !dbg !2726
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2727
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !2727
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !2728
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2729
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !2729
  %add17 = add i16 %5, %conv5.i, !dbg !2730
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2731
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !2732
  %inc20 = add nuw i32 %j.0, 1, !dbg !2733
    #dbg_value(i32 %inc20, !2697, !DIExpression(), !2677)
  br label %for.cond4, !dbg !2734, !llvm.loop !2735

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2700
  %inc = add i32 %k.1, 1, !dbg !2737
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !2738
    #dbg_value(i32 %add22, !2691, !DIExpression(), !2677)
  br label %for.cond1, !dbg !2739, !llvm.loop !2740

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2677
  %shr = lshr i32 %len.0, 1, !dbg !2742
    #dbg_value(i32 %shr, !2679, !DIExpression(), !2677)
  br label %for.cond, !dbg !2743, !llvm.loop !2744

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !2746
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2747 {
entry:
    #dbg_value(ptr %r, !2748, !DIExpression(), !2749)
    #dbg_value(i16 1441, !2750, !DIExpression(), !2749)
    #dbg_value(i32 127, !2751, !DIExpression(), !2749)
    #dbg_value(i32 2, !2752, !DIExpression(), !2749)
  br label %for.cond, !dbg !2753

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !2755
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !2756
    #dbg_value(i32 %k.0, !2751, !DIExpression(), !2749)
    #dbg_value(i32 %len.0, !2752, !DIExpression(), !2749)
  %cmp = icmp ult i32 %len.0, 129, !dbg !2757
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !2759

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2760

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !2763

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !2765
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !2749
    #dbg_value(i32 %k.1, !2751, !DIExpression(), !2749)
    #dbg_value(i32 %start.0, !2766, !DIExpression(), !2749)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2767
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !2760

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !2751, !DIExpression(), !2749)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !2769
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2769
    #dbg_value(i16 %0, !2771, !DIExpression(), !2749)
    #dbg_value(i32 %start.0, !2772, !DIExpression(), !2749)
  br label %for.cond4, !dbg !2773

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !2775
    #dbg_value(i32 %j.0, !2772, !DIExpression(), !2749)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2776
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2778
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !2779

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2780
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !2780
    #dbg_value(i16 %1, !2782, !DIExpression(), !2749)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2783
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !2783
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2783
  %add11 = add i16 %1, %3, !dbg !2784
    #dbg_value(i16 %add11, !787, !DIExpression(), !2785)
    #dbg_value(i16 20159, !794, !DIExpression(), !2785)
  %conv.i10 = sext i16 %add11 to i32, !dbg !2787
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !2788
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !2789
  %shr.i12 = ashr i32 %add.i, 26, !dbg !2790
    #dbg_value(i32 %shr.i12, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2785)
    #dbg_value(i32 %shr.i12, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2785)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !2791
  %5 = mul i16 %4, -3329, !dbg !2791
  %conv7.i = add i16 %5, %add11, !dbg !2791
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2792
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !2793
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2794
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !2794
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !2794
  %sub = sub i16 %7, %1, !dbg !2795
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2796
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !2796
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !2797
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2798
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !2798
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !2798
    #dbg_value(i16 %0, !2707, !DIExpression(), !2799)
    #dbg_value(i16 %10, !2713, !DIExpression(), !2799)
  %conv.i = sext i16 %0 to i32, !dbg !2801
  %conv1.i = sext i16 %10 to i32, !dbg !2802
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2803
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2804)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2804)
  %sext.i4 = mul i32 %mul.i, -218038272, !dbg !2806
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !2806
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !2807
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i, !dbg !2808
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !2809
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !2810
    #dbg_value(i16 %conv5.i9, !880, !DIExpression(), !2804)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2811
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !2811
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !2812
  %inc = add nuw i32 %j.0, 1, !dbg !2813
    #dbg_value(i32 %inc, !2772, !DIExpression(), !2749)
  br label %for.cond4, !dbg !2814, !llvm.loop !2815

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2775
  %dec = add i32 %k.1, -1, !dbg !2817
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !2818
    #dbg_value(i32 %add27, !2766, !DIExpression(), !2749)
  br label %for.cond1, !dbg !2819, !llvm.loop !2820

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2749
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !2822
    #dbg_value(i32 %shl, !2752, !DIExpression(), !2749)
  br label %for.cond, !dbg !2823, !llvm.loop !2824

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !2826
    #dbg_value(i32 %j.1, !2772, !DIExpression(), !2749)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !2827
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !2763

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2829
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !2829
    #dbg_value(i16 %12, !2707, !DIExpression(), !2830)
    #dbg_value(i16 1441, !2713, !DIExpression(), !2830)
  %conv.i1 = sext i16 %12 to i32, !dbg !2832
  %mul.i2 = mul nsw i32 %conv.i1, 1441, !dbg !2833
    #dbg_value(i32 %mul.i2, !875, !DIExpression(), !2834)
    #dbg_value(i32 %mul.i2, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2834)
  %sext.i = mul i32 %conv.i1, -660537344, !dbg !2836
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2836
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2837
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i2, !dbg !2838
  %shr.i = lshr i32 %sub.i, 16, !dbg !2839
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2840
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2834)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2841
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !2842
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !2843
    #dbg_value(i32 %inc39, !2772, !DIExpression(), !2749)
  br label %for.cond31, !dbg !2844, !llvm.loop !2845

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !2847
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !2848 {
entry:
    #dbg_value(ptr %r, !2852, !DIExpression(), !2853)
    #dbg_value(ptr %a, !2854, !DIExpression(), !2853)
    #dbg_value(ptr %b, !2855, !DIExpression(), !2853)
    #dbg_value(i16 %zeta, !2856, !DIExpression(), !2853)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2857
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2857
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2858
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !2858
    #dbg_value(i16 %0, !2707, !DIExpression(), !2859)
    #dbg_value(i16 %1, !2713, !DIExpression(), !2859)
  %conv.i = sext i16 %0 to i32, !dbg !2861
  %conv1.i = sext i16 %1 to i32, !dbg !2862
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2863
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2864)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2864)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2866
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2866
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2867
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2868
  %shr.i = lshr i32 %sub.i, 16, !dbg !2869
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2870
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2864)
  store i16 %conv5.i, ptr %r, align 2, !dbg !2871
    #dbg_value(i16 %conv5.i, !2707, !DIExpression(), !2872)
    #dbg_value(i16 %zeta, !2713, !DIExpression(), !2872)
  %conv.i9 = ashr i32 %sub.i, 16, !dbg !2874
  %conv1.i10 = sext i16 %zeta to i32, !dbg !2875
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !2876
    #dbg_value(i32 %mul.i11, !875, !DIExpression(), !2877)
    #dbg_value(i32 %mul.i11, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2877)
  %sext.i17 = mul i32 %mul.i11, -218038272, !dbg !2879
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !2879
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !2880
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i11, !dbg !2881
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !2882
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !2883
    #dbg_value(i16 %conv5.i22, !880, !DIExpression(), !2877)
  store i16 %conv5.i22, ptr %r, align 2, !dbg !2884
  %2 = load i16, ptr %a, align 2, !dbg !2885
  %3 = load i16, ptr %b, align 2, !dbg !2886
    #dbg_value(i16 %2, !2707, !DIExpression(), !2887)
    #dbg_value(i16 %3, !2713, !DIExpression(), !2887)
  %conv.i1 = sext i16 %2 to i32, !dbg !2889
  %conv1.i2 = sext i16 %3 to i32, !dbg !2890
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !2891
    #dbg_value(i32 %mul.i3, !875, !DIExpression(), !2892)
    #dbg_value(i32 %mul.i3, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2892)
  %sext.i35 = mul i32 %mul.i3, -218038272, !dbg !2894
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !2894
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !2895
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i3, !dbg !2896
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !2897
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !2898
    #dbg_value(i16 %conv5.i40, !880, !DIExpression(), !2892)
  %4 = load i16, ptr %r, align 2, !dbg !2899
  %add = add i16 %4, %conv5.i40, !dbg !2899
  store i16 %add, ptr %r, align 2, !dbg !2899
  %5 = load i16, ptr %a, align 2, !dbg !2900
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2901
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !2901
    #dbg_value(i16 %5, !2707, !DIExpression(), !2902)
    #dbg_value(i16 %6, !2713, !DIExpression(), !2902)
  %conv.i5 = sext i16 %5 to i32, !dbg !2904
  %conv1.i6 = sext i16 %6 to i32, !dbg !2905
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !2906
    #dbg_value(i32 %mul.i7, !875, !DIExpression(), !2907)
    #dbg_value(i32 %mul.i7, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2907)
  %sext.i29 = mul i32 %mul.i7, -218038272, !dbg !2909
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !2909
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !2910
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i7, !dbg !2911
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !2912
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !2913
    #dbg_value(i16 %conv5.i34, !880, !DIExpression(), !2907)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2914
  store i16 %conv5.i34, ptr %arrayidx15, align 2, !dbg !2915
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2916
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !2916
  %8 = load i16, ptr %b, align 2, !dbg !2917
    #dbg_value(i16 %7, !2707, !DIExpression(), !2918)
    #dbg_value(i16 %8, !2713, !DIExpression(), !2918)
  %conv.i13 = sext i16 %7 to i32, !dbg !2920
  %conv1.i14 = sext i16 %8 to i32, !dbg !2921
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !2922
    #dbg_value(i32 %mul.i15, !875, !DIExpression(), !2923)
    #dbg_value(i32 %mul.i15, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2923)
  %sext.i23 = mul i32 %mul.i15, -218038272, !dbg !2925
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !2925
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !2926
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i15, !dbg !2927
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !2928
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !2929
    #dbg_value(i16 %conv5.i28, !880, !DIExpression(), !2923)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2930
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !2931
  %add22 = add i16 %9, %conv5.i28, !dbg !2931
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !2931
  ret void, !dbg !2932
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !657 {
entry:
    #dbg_value(ptr %r, !656, !DIExpression(), !2933)
    #dbg_value(ptr %buf, !668, !DIExpression(), !2933)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !2934
  ret void, !dbg !2935
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !2936 {
entry:
    #dbg_value(ptr %r, !2937, !DIExpression(), !2938)
    #dbg_value(ptr %buf, !2939, !DIExpression(), !2938)
    #dbg_value(i32 0, !2940, !DIExpression(), !2938)
  br label %for.cond, !dbg !2941

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !2943
    #dbg_value(i32 %i.0, !2940, !DIExpression(), !2938)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2944
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !2946

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2947
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !2949
    #dbg_value(ptr %add.ptr, !2950, !DIExpression(), !2954)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !2956
  %conv.i = zext i8 %0 to i32, !dbg !2957
    #dbg_value(i32 %conv.i, !2958, !DIExpression(), !2954)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !2959
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !2959
  %conv2.i = zext i8 %1 to i32, !dbg !2960
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !2961
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !2962
    #dbg_value(i32 %or.i, !2958, !DIExpression(), !2954)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !2963
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !2963
  %conv4.i = zext i8 %2 to i32, !dbg !2964
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !2965
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !2966
    #dbg_value(i32 %or6.i, !2958, !DIExpression(), !2954)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !2967
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !2967
  %conv8.i = zext i8 %3 to i32, !dbg !2968
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !2969
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !2970
    #dbg_value(i32 %or10.i, !2958, !DIExpression(), !2954)
    #dbg_value(i32 %or10.i, !2971, !DIExpression(), !2938)
  %and = and i32 %or10.i, 1431655765, !dbg !2972
    #dbg_value(i32 %and, !2973, !DIExpression(), !2938)
  %shr = lshr i32 %or10.i, 1, !dbg !2974
  %and1 = and i32 %shr, 1431655765, !dbg !2975
  %add = add nuw i32 %and, %and1, !dbg !2976
    #dbg_value(i32 %add, !2973, !DIExpression(), !2938)
    #dbg_value(i32 0, !2977, !DIExpression(), !2938)
  br label %for.cond2, !dbg !2978

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !2980
    #dbg_value(i32 %j.0, !2977, !DIExpression(), !2938)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2981
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !2983

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !2984
  %shr7 = lshr i32 %add, %mul5, !dbg !2986
  %conv = and i32 %shr7, 3, !dbg !2987
    #dbg_value(i32 %shr7, !2988, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !2938)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !2989
  %add10 = or disjoint i32 %mul9, 2, !dbg !2990
  %shr11 = lshr i32 %add, %add10, !dbg !2991
  %conv13 = and i32 %shr11, 3, !dbg !2992
    #dbg_value(i32 %conv13, !2993, !DIExpression(), !2938)
  %sub = sub nsw i32 %conv, %conv13, !dbg !2994
  %conv16 = trunc nsw i32 %sub to i16, !dbg !2995
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !2996
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !2997
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2998
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !2999
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3000
    #dbg_value(i32 %inc, !2977, !DIExpression(), !2938)
  br label %for.cond2, !dbg !3001, !llvm.loop !3002

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !3004
    #dbg_value(i32 %inc20, !2940, !DIExpression(), !2938)
  br label %for.cond, !dbg !3005, !llvm.loop !3006

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !3008
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1256 {
entry:
    #dbg_value(ptr %r, !1255, !DIExpression(), !3009)
    #dbg_value(ptr %buf, !1259, !DIExpression(), !3009)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3010
  ret void, !dbg !3011
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !876 {
entry:
    #dbg_value(i32 %a, !875, !DIExpression(), !3012)
    #dbg_value(i32 %a, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3012)
  %sext = mul i32 %a, -218038272, !dbg !3013
  %conv3 = ashr exact i32 %sext, 16, !dbg !3013
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !3014
  %sub = add i32 %mul4.neg, %a, !dbg !3015
  %shr = lshr i32 %sub, 16, !dbg !3016
  %conv5 = trunc nuw i32 %shr to i16, !dbg !3017
    #dbg_value(i16 %conv5, !880, !DIExpression(), !3012)
  ret i16 %conv5, !dbg !3018
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !788 {
entry:
    #dbg_value(i16 %a, !787, !DIExpression(), !3019)
    #dbg_value(i16 20159, !794, !DIExpression(), !3019)
  %conv = sext i16 %a to i32, !dbg !3020
  %mul = mul nsw i32 %conv, 20159, !dbg !3021
  %add = add nsw i32 %mul, 33554432, !dbg !3022
  %shr = ashr i32 %add, 26, !dbg !3023
    #dbg_value(i32 %shr, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3019)
    #dbg_value(i32 %shr, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3019)
  %0 = trunc nsw i32 %shr to i16, !dbg !3024
  %1 = mul i16 %0, -3329, !dbg !3024
  %conv7 = add i16 %1, %a, !dbg !3024
  ret i16 %conv7, !dbg !3025
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !159 {
entry:
    #dbg_value(ptr %a, !158, !DIExpression(), !3026)
    #dbg_value(ptr %b, !167, !DIExpression(), !3026)
    #dbg_value(i32 %len, !168, !DIExpression(), !3026)
    #dbg_value(i8 0, !169, !DIExpression(), !3026)
    #dbg_value(i32 0, !170, !DIExpression(), !3026)
  br label %for.cond, !dbg !3027

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3028
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !3026
    #dbg_value(i8 %r.0, !169, !DIExpression(), !3026)
    #dbg_value(i32 %i.0, !170, !DIExpression(), !3026)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3029
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !3030

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3026)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3031
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3031
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !3032
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !3032
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3026)
  %xor1 = xor i8 %0, %1, !dbg !3033
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3026)
  %or2 = or i8 %r.0, %xor1, !dbg !3034
    #dbg_value(i8 %or2, !169, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3026)
    #dbg_value(i8 %or2, !169, !DIExpression(), !3026)
  %inc = add i32 %i.0, 1, !dbg !3035
    #dbg_value(i32 %inc, !170, !DIExpression(), !3026)
  br label %for.cond, !dbg !3036, !llvm.loop !3037

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !3026
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !3039
  %conv6 = zext i1 %2 to i32, !dbg !3040
  ret i32 %conv6, !dbg !3041
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !191 {
entry:
    #dbg_value(ptr %r, !190, !DIExpression(), !3042)
    #dbg_value(ptr %x, !196, !DIExpression(), !3042)
    #dbg_value(i32 %len, !197, !DIExpression(), !3042)
    #dbg_value(i8 %b, !198, !DIExpression(), !3042)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !3043, !srcloc !200
    #dbg_value(i8 %0, !198, !DIExpression(), !3042)
  %sub = sub i8 0, %0, !dbg !3044
    #dbg_value(i8 %sub, !198, !DIExpression(), !3042)
    #dbg_value(i32 0, !202, !DIExpression(), !3042)
  br label %for.cond, !dbg !3045

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3046
    #dbg_value(i32 %i.0, !202, !DIExpression(), !3042)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3047
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3048

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3049
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3049
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3050
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !3050
  %xor1 = xor i8 %1, %2, !dbg !3051
  %and2 = and i8 %xor1, %sub, !dbg !3052
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3053
  %xor93 = xor i8 %1, %and2, !dbg !3054
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !3054
  %inc = add i32 %i.0, 1, !dbg !3055
    #dbg_value(i32 %inc, !202, !DIExpression(), !3042)
  br label %for.cond, !dbg !3056, !llvm.loop !3057

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3059
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1100 {
entry:
    #dbg_value(ptr %r, !1099, !DIExpression(), !3060)
    #dbg_value(i16 %v, !1105, !DIExpression(), !3060)
    #dbg_value(i16 %b, !1106, !DIExpression(), !3060)
  %sub = sub i16 0, %b, !dbg !3061
    #dbg_value(i16 %sub, !1106, !DIExpression(), !3060)
  %0 = load i16, ptr %r, align 2, !dbg !3062
  %xor1 = xor i16 %0, %v, !dbg !3063
  %and = and i16 %xor1, %sub, !dbg !3064
  %xor6 = xor i16 %and, %0, !dbg !3065
  store i16 %xor6, ptr %r, align 2, !dbg !3065
  ret void, !dbg !3066
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3067 {
entry:
    #dbg_value(ptr %state, !3070, !DIExpression(), !3071)
    #dbg_value(ptr %state, !3072, !DIExpression(), !3076)
    #dbg_value(i32 0, !3078, !DIExpression(), !3076)
  br label %for.cond.i, !dbg !3079

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3081
    #dbg_value(i32 %i.0.i, !3078, !DIExpression(), !3076)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3082
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3084

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3085
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3086
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3087
    #dbg_value(i32 %inc.i, !3078, !DIExpression(), !3076)
  br label %for.cond.i, !dbg !3088, !llvm.loop !3089

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3091
  store i32 0, ptr %pos, align 8, !dbg !3092
  ret void, !dbg !3093
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3094 {
entry:
    #dbg_value(ptr %state, !3095, !DIExpression(), !3096)
    #dbg_value(ptr %in, !3097, !DIExpression(), !3096)
    #dbg_value(i32 %inlen, !3098, !DIExpression(), !3096)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3099
  %0 = load i32, ptr %pos, align 8, !dbg !3099
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3100
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3101
  store i32 %call, ptr %pos1, align 8, !dbg !3102
  ret void, !dbg !3103
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3104 {
entry:
    #dbg_value(ptr %s, !3107, !DIExpression(), !3108)
    #dbg_value(i32 %pos, !3109, !DIExpression(), !3108)
    #dbg_value(i32 %r, !3110, !DIExpression(), !3108)
    #dbg_value(ptr %in, !3111, !DIExpression(), !3108)
    #dbg_value(i32 %inlen, !3112, !DIExpression(), !3108)
  br label %while.cond, !dbg !3113

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3109, !DIExpression(), !3108)
    #dbg_value(i32 %inlen.addr.0, !3112, !DIExpression(), !3108)
    #dbg_value(ptr %in.addr.0, !3111, !DIExpression(), !3108)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3114
  %cmp.not = icmp ult i32 %add, %r, !dbg !3115
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3113

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3116
  br label %for.cond, !dbg !3116

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3119

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3121
    #dbg_value(i32 %i.0, !3122, !DIExpression(), !3108)
    #dbg_value(ptr %in.addr.1, !3111, !DIExpression(), !3108)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3123
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3116

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3111, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3108)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3125
  %conv = zext i8 %0 to i64, !dbg !3126
  %rem = shl i32 %i.0, 3, !dbg !3127
  %mul = and i32 %rem, 56, !dbg !3127
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3128
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3128
  %div2 = lshr i32 %i.0, 3, !dbg !3129
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3130
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3131
  %xor = xor i64 %1, %shl, !dbg !3131
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3131
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3132
    #dbg_value(ptr %incdec.ptr, !3111, !DIExpression(), !3108)
  %inc = add i32 %i.0, 1, !dbg !3133
    #dbg_value(i32 %inc, !3122, !DIExpression(), !3108)
  br label %for.cond, !dbg !3134, !llvm.loop !3135

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3137
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3138
    #dbg_value(i32 %sub2, !3112, !DIExpression(), !3108)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3139
    #dbg_value(i32 0, !3109, !DIExpression(), !3108)
  br label %while.cond, !dbg !3113, !llvm.loop !3140

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3142
    #dbg_value(i32 %i.1, !3122, !DIExpression(), !3108)
    #dbg_value(ptr %in.addr.2, !3111, !DIExpression(), !3108)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3143
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3145
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3119

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3111, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3108)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3146
  %conv9 = zext i8 %2 to i64, !dbg !3147
  %rem10 = shl i32 %i.1, 3, !dbg !3148
  %mul11 = and i32 %rem10, 56, !dbg !3148
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3149
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3149
  %div141 = lshr i32 %i.1, 3, !dbg !3150
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3151
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3152
  %xor16 = xor i64 %3, %shl13, !dbg !3152
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3152
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3153
    #dbg_value(ptr %incdec.ptr8, !3111, !DIExpression(), !3108)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3154
    #dbg_value(i32 %inc18, !3122, !DIExpression(), !3108)
  br label %for.cond3, !dbg !3155, !llvm.loop !3156

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3142
  ret i32 %i.1.lcssa, !dbg !3158
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3159 {
entry:
    #dbg_value(ptr %state, !3160, !DIExpression(), !3161)
  %0 = load i64, ptr %state, align 8, !dbg !3162
    #dbg_value(i64 %0, !3163, !DIExpression(), !3161)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3164
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3164
    #dbg_value(i64 %1, !3165, !DIExpression(), !3161)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3166
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3166
    #dbg_value(i64 %2, !3167, !DIExpression(), !3161)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3168
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3168
    #dbg_value(i64 %3, !3169, !DIExpression(), !3161)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3170
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3170
    #dbg_value(i64 %4, !3171, !DIExpression(), !3161)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3172
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3172
    #dbg_value(i64 %5, !3173, !DIExpression(), !3161)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3174
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3174
    #dbg_value(i64 %6, !3175, !DIExpression(), !3161)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3176
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3176
    #dbg_value(i64 %7, !3177, !DIExpression(), !3161)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3178
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3178
    #dbg_value(i64 %8, !3179, !DIExpression(), !3161)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3180
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3180
    #dbg_value(i64 %9, !3181, !DIExpression(), !3161)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3182
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3182
    #dbg_value(i64 %10, !3183, !DIExpression(), !3161)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3184
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3184
    #dbg_value(i64 %11, !3185, !DIExpression(), !3161)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3186
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3186
    #dbg_value(i64 %12, !3187, !DIExpression(), !3161)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3188
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3188
    #dbg_value(i64 %13, !3189, !DIExpression(), !3161)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3190
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3190
    #dbg_value(i64 %14, !3191, !DIExpression(), !3161)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3192
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3192
    #dbg_value(i64 %15, !3193, !DIExpression(), !3161)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3194
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3194
    #dbg_value(i64 %16, !3195, !DIExpression(), !3161)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3196
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3196
    #dbg_value(i64 %17, !3197, !DIExpression(), !3161)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3198
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3198
    #dbg_value(i64 %18, !3199, !DIExpression(), !3161)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3200
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3200
    #dbg_value(i64 %19, !3201, !DIExpression(), !3161)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3202
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3202
    #dbg_value(i64 %20, !3203, !DIExpression(), !3161)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3204
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3204
    #dbg_value(i64 %21, !3205, !DIExpression(), !3161)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3206
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3206
    #dbg_value(i64 %22, !3207, !DIExpression(), !3161)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3208
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3208
    #dbg_value(i64 %23, !3209, !DIExpression(), !3161)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3210
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3210
    #dbg_value(i64 %24, !3211, !DIExpression(), !3161)
    #dbg_value(i32 0, !3212, !DIExpression(), !3161)
  br label %for.cond, !dbg !3213

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3161
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3161
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3161
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3161
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3161
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3161
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3161
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3161
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3161
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3161
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3161
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3161
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3161
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3161
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3161
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3161
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3161
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3161
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3161
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3161
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3161
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3161
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3161
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3161
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3215
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3161
    #dbg_value(i64 %Asu.0, !3211, !DIExpression(), !3161)
    #dbg_value(i32 %round.0, !3212, !DIExpression(), !3161)
    #dbg_value(i64 %Aba.0, !3163, !DIExpression(), !3161)
    #dbg_value(i64 %Abe.0, !3165, !DIExpression(), !3161)
    #dbg_value(i64 %Abi.0, !3167, !DIExpression(), !3161)
    #dbg_value(i64 %Abo.0, !3169, !DIExpression(), !3161)
    #dbg_value(i64 %Abu.0, !3171, !DIExpression(), !3161)
    #dbg_value(i64 %Aga.0, !3173, !DIExpression(), !3161)
    #dbg_value(i64 %Age.0, !3175, !DIExpression(), !3161)
    #dbg_value(i64 %Agi.0, !3177, !DIExpression(), !3161)
    #dbg_value(i64 %Ago.0, !3179, !DIExpression(), !3161)
    #dbg_value(i64 %Agu.0, !3181, !DIExpression(), !3161)
    #dbg_value(i64 %Aka.0, !3183, !DIExpression(), !3161)
    #dbg_value(i64 %Ake.0, !3185, !DIExpression(), !3161)
    #dbg_value(i64 %Aki.0, !3187, !DIExpression(), !3161)
    #dbg_value(i64 %Ako.0, !3189, !DIExpression(), !3161)
    #dbg_value(i64 %Aku.0, !3191, !DIExpression(), !3161)
    #dbg_value(i64 %Ama.0, !3193, !DIExpression(), !3161)
    #dbg_value(i64 %Ame.0, !3195, !DIExpression(), !3161)
    #dbg_value(i64 %Ami.0, !3197, !DIExpression(), !3161)
    #dbg_value(i64 %Amo.0, !3199, !DIExpression(), !3161)
    #dbg_value(i64 %Amu.0, !3201, !DIExpression(), !3161)
    #dbg_value(i64 %Asa.0, !3203, !DIExpression(), !3161)
    #dbg_value(i64 %Ase.0, !3205, !DIExpression(), !3161)
    #dbg_value(i64 %Asi.0, !3207, !DIExpression(), !3161)
    #dbg_value(i64 %Aso.0, !3209, !DIExpression(), !3161)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3216
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3218

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3224, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3225, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3226, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3227, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3228, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3224, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3225, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3226, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3227, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3228, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 poison, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3254
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3256
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3257
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3258
    #dbg_value(i64 %xor35, !3221, !DIExpression(), !3161)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3259
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3260
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3261
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3262
    #dbg_value(i64 %xor43, !3223, !DIExpression(), !3161)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3263
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3227, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3264
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 %xor57, !3227, !DIExpression(), !3161)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3265
    #dbg_value(i64 %xor203, !3179, !DIExpression(), !3161)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3266
    #dbg_value(i64 %xor206, !3220, !DIExpression(), !3161)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3267
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3268
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3269
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3270
    #dbg_value(i64 %xor31, !3220, !DIExpression(), !3161)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3271
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3224, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3272
    #dbg_value(i64 %xor45, !3224, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3273
    #dbg_value(i64 %xor211, !3193, !DIExpression(), !3161)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3274
    #dbg_value(i64 %xor214, !3222, !DIExpression(), !3161)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3275
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3276
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3277
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3278
    #dbg_value(i64 %xor39, !3222, !DIExpression(), !3161)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3279
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3280
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3281
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3282
    #dbg_value(i64 %xor27, !3219, !DIExpression(), !3161)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3283
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3228, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3284
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 %xor61, !3228, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3285
    #dbg_value(i64 %xor207, !3191, !DIExpression(), !3161)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3286
    #dbg_value(i64 %xor210, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not222 = xor i64 %xor210, -1, !dbg !3287
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and223 = and i64 %xor214, %not222, !dbg !3288
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor224 = xor i64 %xor206, %and223, !dbg !3289
    #dbg_value(i64 %xor224, !3250, !DIExpression(), !3161)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3290
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3226, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3291
    #dbg_value(i64 %xor53, !3226, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3292
    #dbg_value(i64 %xor67, !3187, !DIExpression(), !3161)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3293
    #dbg_value(i64 %xor70, !3221, !DIExpression(), !3161)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3294
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3225, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3295
    #dbg_value(i64 %xor49, !3225, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3296
    #dbg_value(i64 %xor63, !3175, !DIExpression(), !3161)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3297
    #dbg_value(i64 %xor66, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not = xor i64 %xor66, -1, !dbg !3298
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and = and i64 %xor70, %not, !dbg !3299
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3300
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3300
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %26 = xor i64 %and, %25, !dbg !3301
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3302
    #dbg_value(i64 %xor62, !3163, !DIExpression(), !3161)
    #dbg_value(i64 %xor62, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor81 = xor i64 %26, %xor62, !dbg !3301
    #dbg_value(i64 %xor81, !3229, !DIExpression(), !3161)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3303
    #dbg_value(i64 %xor94, !3169, !DIExpression(), !3161)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3304
    #dbg_value(i64 %xor97, !3219, !DIExpression(), !3161)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3305
    #dbg_value(i64 %xor102, !3183, !DIExpression(), !3161)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3306
    #dbg_value(i64 %xor105, !3221, !DIExpression(), !3161)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3307
    #dbg_value(i64 %xor98, !3181, !DIExpression(), !3161)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3308
    #dbg_value(i64 %xor101, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not114 = xor i64 %xor101, -1, !dbg !3309
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and115 = and i64 %xor105, %not114, !dbg !3310
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor116 = xor i64 %xor97, %and115, !dbg !3311
    #dbg_value(i64 %xor116, !3234, !DIExpression(), !3161)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3312
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3313
    #dbg_value(i64 %xor129, !3165, !DIExpression(), !3161)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3314
    #dbg_value(i64 %xor132, !3219, !DIExpression(), !3161)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3315
    #dbg_value(i64 %xor137, !3189, !DIExpression(), !3161)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3316
    #dbg_value(i64 %xor140, !3221, !DIExpression(), !3161)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3317
    #dbg_value(i64 %xor133, !3177, !DIExpression(), !3161)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3318
    #dbg_value(i64 %xor136, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not149 = xor i64 %xor136, -1, !dbg !3319
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and150 = and i64 %xor140, %not149, !dbg !3320
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor151 = xor i64 %xor132, %and150, !dbg !3321
    #dbg_value(i64 %xor151, !3239, !DIExpression(), !3161)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3322
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3323
    #dbg_value(i64 %xor164, !3171, !DIExpression(), !3161)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3324
    #dbg_value(i64 %xor167, !3219, !DIExpression(), !3161)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3325
    #dbg_value(i64 %xor172, !3185, !DIExpression(), !3161)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3326
    #dbg_value(i64 %xor175, !3221, !DIExpression(), !3161)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3327
    #dbg_value(i64 %xor168, !3173, !DIExpression(), !3161)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3328
    #dbg_value(i64 %xor171, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not184 = xor i64 %xor171, -1, !dbg !3329
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and185 = and i64 %xor175, %not184, !dbg !3330
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor186 = xor i64 %xor167, %and185, !dbg !3331
    #dbg_value(i64 %xor186, !3244, !DIExpression(), !3161)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3332
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3333
    #dbg_value(i64 %xor199, !3167, !DIExpression(), !3161)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3334
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not219 = xor i64 %xor206, -1, !dbg !3335
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and220 = and i64 %xor210, %not219, !dbg !3336
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor221 = xor i64 %xor202, %and220, !dbg !3337
    #dbg_value(i64 %xor221, !3249, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3338
    #dbg_value(i64 %xor237, !3219, !DIExpression(), !3161)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3339
    #dbg_value(i64 %xor75, !3211, !DIExpression(), !3161)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3340
    #dbg_value(i64 %xor78, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3341
    #dbg_value(i64 %xor71, !3199, !DIExpression(), !3161)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3342
    #dbg_value(i64 %xor74, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not85 = xor i64 %xor74, -1, !dbg !3343
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and86 = and i64 %xor78, %not85, !dbg !3344
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor87 = xor i64 %xor70, %and86, !dbg !3345
    #dbg_value(i64 %xor87, !3231, !DIExpression(), !3161)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3346
    #dbg_value(i64 %xor110, !3207, !DIExpression(), !3161)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3347
    #dbg_value(i64 %xor113, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3348
    #dbg_value(i64 %xor106, !3195, !DIExpression(), !3161)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3349
    #dbg_value(i64 %xor109, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not120 = xor i64 %xor109, -1, !dbg !3350
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and121 = and i64 %xor113, %not120, !dbg !3351
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor122 = xor i64 %xor105, %and121, !dbg !3352
    #dbg_value(i64 %xor122, !3236, !DIExpression(), !3161)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3353
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3354
    #dbg_value(i64 %xor145, !3203, !DIExpression(), !3161)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3355
    #dbg_value(i64 %xor148, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3356
    #dbg_value(i64 %xor141, !3201, !DIExpression(), !3161)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3357
    #dbg_value(i64 %xor144, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not155 = xor i64 %xor144, -1, !dbg !3358
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and156 = and i64 %xor148, %not155, !dbg !3359
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor157 = xor i64 %xor140, %and156, !dbg !3360
    #dbg_value(i64 %xor157, !3241, !DIExpression(), !3161)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3361
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3362
    #dbg_value(i64 %xor180, !3209, !DIExpression(), !3161)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3363
    #dbg_value(i64 %xor183, !3223, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3364
    #dbg_value(i64 %xor176, !3197, !DIExpression(), !3161)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3365
    #dbg_value(i64 %xor179, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %not190 = xor i64 %xor179, -1, !dbg !3366
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and191 = and i64 %xor183, %not190, !dbg !3367
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor192 = xor i64 %xor175, %and191, !dbg !3368
    #dbg_value(i64 %xor192, !3246, !DIExpression(), !3161)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3369
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3370
    #dbg_value(i64 %xor215, !3205, !DIExpression(), !3161)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3371
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not225 = xor i64 %xor214, -1, !dbg !3372
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and226 = and i64 %xor218, %not225, !dbg !3373
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor227 = xor i64 %xor210, %and226, !dbg !3374
    #dbg_value(i64 %xor227, !3251, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3221, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3375
    #dbg_value(i64 %xor245, !3221, !DIExpression(), !3161)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3376
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3225, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3377
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3250, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 %xor261, !3225, !DIExpression(), !3161)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3378
    #dbg_value(i64 %xor429, !3250, !DIExpression(), !3161)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3379
    #dbg_value(i64 %xor432, !3223, !DIExpression(), !3161)
  %not123 = xor i64 %xor113, -1, !dbg !3380
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and124 = and i64 %xor97, %not123, !dbg !3381
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor125 = xor i64 %xor109, %and124, !dbg !3382
    #dbg_value(i64 %xor125, !3237, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not91 = xor i64 %xor62, -1, !dbg !3383
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and92 = and i64 %xor66, %not91, !dbg !3384
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor93 = xor i64 %xor78, %and92, !dbg !3385
    #dbg_value(i64 %xor93, !3233, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not126 = xor i64 %xor97, -1, !dbg !3386
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and127 = and i64 %xor101, %not126, !dbg !3387
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor128 = xor i64 %xor113, %and127, !dbg !3388
    #dbg_value(i64 %xor128, !3238, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3389
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not161 = xor i64 %xor132, -1, !dbg !3390
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and162 = and i64 %xor136, %not161, !dbg !3391
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor163 = xor i64 %xor148, %and162, !dbg !3392
    #dbg_value(i64 %xor163, !3243, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3393
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not196 = xor i64 %xor167, -1, !dbg !3394
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and197 = and i64 %xor171, %not196, !dbg !3395
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor198 = xor i64 %xor183, %and197, !dbg !3396
    #dbg_value(i64 %xor198, !3248, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3397
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not231 = xor i64 %xor202, -1, !dbg !3398
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %and232 = and i64 %xor206, %not231, !dbg !3399
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor233 = xor i64 %xor218, %and232, !dbg !3400
    #dbg_value(i64 %xor233, !3253, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3223, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3401
    #dbg_value(i64 %xor253, !3223, !DIExpression(), !3161)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3402
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3227, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3403
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3237, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 %xor269, !3227, !DIExpression(), !3161)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3404
    #dbg_value(i64 %xor417, !3237, !DIExpression(), !3161)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3405
    #dbg_value(i64 %xor420, !3220, !DIExpression(), !3161)
  %not82 = xor i64 %xor70, -1, !dbg !3406
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and83 = and i64 %xor74, %not82, !dbg !3407
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor84 = xor i64 %xor66, %and83, !dbg !3408
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3230, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %not117 = xor i64 %xor105, -1, !dbg !3409
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and118 = and i64 %xor109, %not117, !dbg !3410
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor119 = xor i64 %xor101, %and118, !dbg !3411
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3235, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3412
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %not152 = xor i64 %xor140, -1, !dbg !3413
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and153 = and i64 %xor144, %not152, !dbg !3414
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor154 = xor i64 %xor136, %and153, !dbg !3415
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3240, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3416
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %not187 = xor i64 %xor175, -1, !dbg !3417
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and188 = and i64 %xor179, %not187, !dbg !3418
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor189 = xor i64 %xor171, %and188, !dbg !3419
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3245, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3420
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3220, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3421
    #dbg_value(i64 %xor241, !3220, !DIExpression(), !3161)
  %not88 = xor i64 %xor78, -1, !dbg !3422
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and89 = and i64 %xor62, %not88, !dbg !3423
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor90 = xor i64 %xor74, %and89, !dbg !3424
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3232, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3425
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not158 = xor i64 %xor148, -1, !dbg !3426
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and159 = and i64 %xor132, %not158, !dbg !3427
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor160 = xor i64 %xor144, %and159, !dbg !3428
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3242, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3429
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not193 = xor i64 %xor183, -1, !dbg !3430
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and194 = and i64 %xor167, %not193, !dbg !3431
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor195 = xor i64 %xor179, %and194, !dbg !3432
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3247, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3433
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %not228 = xor i64 %xor218, -1, !dbg !3434
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and229 = and i64 %xor202, %not228, !dbg !3435
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor230 = xor i64 %xor214, %and229, !dbg !3436
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3222, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3252, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3437
    #dbg_value(i64 %xor249, !3222, !DIExpression(), !3161)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3438
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3226, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3439
    #dbg_value(i64 %xor265, !3226, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3231, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3246, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3236, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3251, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3241, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3440
    #dbg_value(i64 %xor413, !3231, !DIExpression(), !3161)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3441
    #dbg_value(i64 %xor416, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not445 = xor i64 %xor416, -1, !dbg !3442
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and446 = and i64 %xor420, %not445, !dbg !3443
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3211, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor447 = xor i64 %xor432, %and446, !dbg !3444
    #dbg_value(i64 %xor447, !3211, !DIExpression(), !3161)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3445
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3224, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3446
    #dbg_value(i64 %xor257, !3224, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3234, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3249, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3239, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3219, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3229, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3244, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3447
    #dbg_value(i64 %xor425, !3244, !DIExpression(), !3161)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3448
    #dbg_value(i64 %xor428, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not442 = xor i64 %xor432, -1, !dbg !3449
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and443 = and i64 %xor416, %not442, !dbg !3450
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3209, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor444 = xor i64 %xor428, %and443, !dbg !3451
    #dbg_value(i64 %xor444, !3209, !DIExpression(), !3161)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3452
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3228, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3453
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3233, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3248, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3238, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3253, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(i64 %xor273, !3228, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3243, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3454
    #dbg_value(i64 %xor421, !3243, !DIExpression(), !3161)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3455
    #dbg_value(i64 %xor424, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not439 = xor i64 %xor428, -1, !dbg !3456
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and440 = and i64 %xor432, %not439, !dbg !3457
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3207, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor441 = xor i64 %xor424, %and440, !dbg !3458
    #dbg_value(i64 %xor441, !3207, !DIExpression(), !3161)
  %not436 = xor i64 %xor424, -1, !dbg !3459
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and437 = and i64 %xor428, %not436, !dbg !3460
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3205, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor438 = xor i64 %xor420, %and437, !dbg !3461
    #dbg_value(i64 %xor438, !3205, !DIExpression(), !3161)
  %not433 = xor i64 %xor420, -1, !dbg !3462
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and434 = and i64 %xor424, %not433, !dbg !3463
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3203, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor435 = xor i64 %xor416, %and434, !dbg !3464
    #dbg_value(i64 %xor435, !3203, !DIExpression(), !3161)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3465
    #dbg_value(i64 %xor394, !3252, !DIExpression(), !3161)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3466
    #dbg_value(i64 %xor397, !3223, !DIExpression(), !3161)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3467
    #dbg_value(i64 %xor382, !3234, !DIExpression(), !3161)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3468
    #dbg_value(i64 %xor385, !3220, !DIExpression(), !3161)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3469
    #dbg_value(i64 %xor378, !3233, !DIExpression(), !3161)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3470
    #dbg_value(i64 %xor381, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not410 = xor i64 %xor381, -1, !dbg !3471
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and411 = and i64 %xor385, %not410, !dbg !3472
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3201, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor412 = xor i64 %xor397, %and411, !dbg !3473
    #dbg_value(i64 %xor412, !3201, !DIExpression(), !3161)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3474
    #dbg_value(i64 %xor390, !3246, !DIExpression(), !3161)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3475
    #dbg_value(i64 %xor393, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not407 = xor i64 %xor397, -1, !dbg !3476
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and408 = and i64 %xor381, %not407, !dbg !3477
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3199, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor409 = xor i64 %xor393, %and408, !dbg !3478
    #dbg_value(i64 %xor409, !3199, !DIExpression(), !3161)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3479
    #dbg_value(i64 %xor386, !3240, !DIExpression(), !3161)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3480
    #dbg_value(i64 %xor389, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not404 = xor i64 %xor393, -1, !dbg !3481
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and405 = and i64 %xor397, %not404, !dbg !3482
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3197, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor406 = xor i64 %xor389, %and405, !dbg !3483
    #dbg_value(i64 %xor406, !3197, !DIExpression(), !3161)
  %not401 = xor i64 %xor389, -1, !dbg !3484
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and402 = and i64 %xor393, %not401, !dbg !3485
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3195, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor403 = xor i64 %xor385, %and402, !dbg !3486
    #dbg_value(i64 %xor403, !3195, !DIExpression(), !3161)
  %not398 = xor i64 %xor385, -1, !dbg !3487
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and399 = and i64 %xor389, %not398, !dbg !3488
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3193, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor400 = xor i64 %xor381, %and399, !dbg !3489
    #dbg_value(i64 %xor400, !3193, !DIExpression(), !3161)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3490
    #dbg_value(i64 %xor359, !3249, !DIExpression(), !3161)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3491
    #dbg_value(i64 %xor362, !3223, !DIExpression(), !3161)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3492
    #dbg_value(i64 %xor347, !3236, !DIExpression(), !3161)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3493
    #dbg_value(i64 %xor350, !3220, !DIExpression(), !3161)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3494
    #dbg_value(i64 %xor343, !3230, !DIExpression(), !3161)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3495
    #dbg_value(i64 %xor346, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not375 = xor i64 %xor346, -1, !dbg !3496
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and376 = and i64 %xor350, %not375, !dbg !3497
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3191, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor377 = xor i64 %xor362, %and376, !dbg !3498
    #dbg_value(i64 %xor377, !3191, !DIExpression(), !3161)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3499
    #dbg_value(i64 %xor355, !3248, !DIExpression(), !3161)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3500
    #dbg_value(i64 %xor358, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not372 = xor i64 %xor362, -1, !dbg !3501
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and373 = and i64 %xor346, %not372, !dbg !3502
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3189, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor374 = xor i64 %xor358, %and373, !dbg !3503
    #dbg_value(i64 %xor374, !3189, !DIExpression(), !3161)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3504
    #dbg_value(i64 %xor351, !3242, !DIExpression(), !3161)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3505
    #dbg_value(i64 %xor354, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not369 = xor i64 %xor358, -1, !dbg !3506
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and370 = and i64 %xor362, %not369, !dbg !3507
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3187, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor371 = xor i64 %xor354, %and370, !dbg !3508
    #dbg_value(i64 %xor371, !3187, !DIExpression(), !3161)
  %not366 = xor i64 %xor354, -1, !dbg !3509
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and367 = and i64 %xor358, %not366, !dbg !3510
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3185, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor368 = xor i64 %xor350, %and367, !dbg !3511
    #dbg_value(i64 %xor368, !3185, !DIExpression(), !3161)
  %not363 = xor i64 %xor350, -1, !dbg !3512
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and364 = and i64 %xor354, %not363, !dbg !3513
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor365 = xor i64 %xor346, %and364, !dbg !3514
    #dbg_value(i64 %xor365, !3183, !DIExpression(), !3161)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3515
    #dbg_value(i64 %xor324, !3251, !DIExpression(), !3161)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3516
    #dbg_value(i64 %xor327, !3223, !DIExpression(), !3161)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3517
    #dbg_value(i64 %xor312, !3238, !DIExpression(), !3161)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3518
    #dbg_value(i64 %xor315, !3220, !DIExpression(), !3161)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3519
    #dbg_value(i64 %xor308, !3232, !DIExpression(), !3161)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3520
    #dbg_value(i64 %xor311, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not340 = xor i64 %xor311, -1, !dbg !3521
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and341 = and i64 %xor315, %not340, !dbg !3522
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor342 = xor i64 %xor327, %and341, !dbg !3523
    #dbg_value(i64 %xor342, !3181, !DIExpression(), !3161)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3524
    #dbg_value(i64 %xor320, !3245, !DIExpression(), !3161)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3525
    #dbg_value(i64 %xor323, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not337 = xor i64 %xor327, -1, !dbg !3526
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and338 = and i64 %xor311, %not337, !dbg !3527
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor339 = xor i64 %xor323, %and338, !dbg !3528
    #dbg_value(i64 %xor339, !3179, !DIExpression(), !3161)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3529
    #dbg_value(i64 %xor316, !3239, !DIExpression(), !3161)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3530
    #dbg_value(i64 %xor319, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not334 = xor i64 %xor323, -1, !dbg !3531
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and335 = and i64 %xor327, %not334, !dbg !3532
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor336 = xor i64 %xor319, %and335, !dbg !3533
    #dbg_value(i64 %xor336, !3177, !DIExpression(), !3161)
  %not331 = xor i64 %xor319, -1, !dbg !3534
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and332 = and i64 %xor323, %not331, !dbg !3535
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor333 = xor i64 %xor315, %and332, !dbg !3536
    #dbg_value(i64 %xor333, !3175, !DIExpression(), !3161)
  %not328 = xor i64 %xor315, -1, !dbg !3537
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and329 = and i64 %xor319, %not328, !dbg !3538
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor330 = xor i64 %xor311, %and329, !dbg !3539
    #dbg_value(i64 %xor330, !3173, !DIExpression(), !3161)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3540
    #dbg_value(i64 %xor287, !3253, !DIExpression(), !3161)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3541
    #dbg_value(i64 %xor290, !3223, !DIExpression(), !3161)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3542
    #dbg_value(i64 %xor275, !3235, !DIExpression(), !3161)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3543
    #dbg_value(i64 %xor278, !3220, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3544
    #dbg_value(i64 %xor274, !3229, !DIExpression(), !3161)
    #dbg_value(i64 %xor274, !3219, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not305 = xor i64 %xor274, -1, !dbg !3545
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and306 = and i64 %xor278, %not305, !dbg !3546
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor307 = xor i64 %xor290, %and306, !dbg !3547
    #dbg_value(i64 %xor307, !3171, !DIExpression(), !3161)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3548
    #dbg_value(i64 %xor283, !3247, !DIExpression(), !3161)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3549
    #dbg_value(i64 %xor286, !3222, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not302 = xor i64 %xor290, -1, !dbg !3550
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and303 = and i64 %xor274, %not302, !dbg !3551
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor304 = xor i64 %xor286, %and303, !dbg !3552
    #dbg_value(i64 %xor304, !3169, !DIExpression(), !3161)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3553
    #dbg_value(i64 %xor279, !3241, !DIExpression(), !3161)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3554
    #dbg_value(i64 %xor282, !3221, !DIExpression(), !3161)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %not299 = xor i64 %xor286, -1, !dbg !3555
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and300 = and i64 %xor290, %not299, !dbg !3556
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor301 = xor i64 %xor282, %and300, !dbg !3557
    #dbg_value(i64 %xor301, !3167, !DIExpression(), !3161)
  %not296 = xor i64 %xor282, -1, !dbg !3558
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3161)
  %and297 = and i64 %xor286, %not296, !dbg !3559
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %xor298 = xor i64 %xor278, %and297, !dbg !3560
    #dbg_value(i64 %xor298, !3165, !DIExpression(), !3161)
  %add = or disjoint i32 %round.0, 1, !dbg !3561
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3562
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3562
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %not291 = xor i64 %xor278, -1, !dbg !3563
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %and292 = and i64 %xor282, %not291, !dbg !3564
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3161)
  %28 = xor i64 %and292, %27, !dbg !3565
  %xor295 = xor i64 %28, %xor274, !dbg !3565
    #dbg_value(i64 %xor295, !3163, !DIExpression(), !3161)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3566
    #dbg_value(i32 %add448, !3212, !DIExpression(), !3161)
  br label %for.cond, !dbg !3567, !llvm.loop !3568

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3161
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3161
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3161
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3161
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3161
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3161
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3161
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3161
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3161
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3161
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3161
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3161
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3161
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3161
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3161
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3161
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3161
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3161
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3161
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3161
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3161
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3161
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3161
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3161
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3161
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3570
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3571
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3572
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3573
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3574
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3575
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3576
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3577
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3578
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3579
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3580
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3581
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3582
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3583
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3584
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3585
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3586
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3587
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3588
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3589
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3590
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3591
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3592
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3593
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3594
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3595
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3596
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3597
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3598
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3599
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3600
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3601
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3602
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3603
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3604
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3605
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3606
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3607
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3608
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3609
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3610
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3611
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3612
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3613
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3614
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3615
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3616
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3617
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3618
  ret void, !dbg !3619
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3620 {
entry:
    #dbg_value(ptr %state, !3621, !DIExpression(), !3622)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3623
  %0 = load i32, ptr %pos, align 8, !dbg !3623
    #dbg_value(ptr %state, !3624, !DIExpression(), !3628)
    #dbg_value(i32 %0, !3630, !DIExpression(), !3628)
    #dbg_value(i32 168, !3631, !DIExpression(), !3628)
    #dbg_value(i8 31, !3632, !DIExpression(), !3628)
  %rem.i = shl i32 %0, 3, !dbg !3633
  %mul.i = and i32 %rem.i, 56, !dbg !3633
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3634
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3634
  %div2.i = lshr i32 %0, 3, !dbg !3635
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3636
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3637
  %xor.i = xor i64 %1, %shl.i, !dbg !3637
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3637
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !3638
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3639
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3639
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3639
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3640
  store i32 168, ptr %pos1, align 8, !dbg !3641
  ret void, !dbg !3642
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !3643 {
entry:
    #dbg_value(ptr %out, !3644, !DIExpression(), !3645)
    #dbg_value(i32 %outlen, !3646, !DIExpression(), !3645)
    #dbg_value(ptr %state, !3647, !DIExpression(), !3645)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3648
  %0 = load i32, ptr %pos, align 8, !dbg !3648
    #dbg_value(ptr %out, !612, !DIExpression(), !3649)
    #dbg_value(i32 %outlen, !618, !DIExpression(), !3649)
    #dbg_value(ptr %state, !619, !DIExpression(), !3649)
    #dbg_value(i32 %0, !620, !DIExpression(), !3649)
    #dbg_value(i32 168, !621, !DIExpression(), !3649)
  br label %while.cond.i, !dbg !3651

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !3649)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3649)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3649)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3651
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3651

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !3652
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3652

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3653
    #dbg_value(i32 0, !620, !DIExpression(), !3649)
  br label %if.end.i, !dbg !3654

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3649)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3649)
  br label %for.cond.i, !dbg !3655

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3656
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3649)
    #dbg_value(i32 %i.0.i, !629, !DIExpression(), !3649)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !3657
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3658
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3658
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3658
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3659

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3660
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3661
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3661
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3662
  %mul.i = and i32 %rem.i, 56, !dbg !3662
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3663
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3663
  %conv.i = trunc i64 %shr.i to i8, !dbg !3661
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3649)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3664
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3665
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3649)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3666
    #dbg_value(i32 %inc.i, !629, !DIExpression(), !3649)
  br label %for.cond.i, !dbg !3667, !llvm.loop !3668

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3656
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3670
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3671
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3649)
    #dbg_value(i32 %i.0.i.lcssa, !620, !DIExpression(), !3649)
  br label %while.cond.i, !dbg !3651, !llvm.loop !3672

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3674
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3675
  ret void, !dbg !3676
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !308 {
entry:
    #dbg_value(ptr %state, !307, !DIExpression(), !3677)
    #dbg_value(ptr %in, !319, !DIExpression(), !3677)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !3677)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3678
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3679
  store i32 168, ptr %pos, align 8, !dbg !3680
  ret void, !dbg !3681
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !3682 {
entry:
    #dbg_value(ptr %s, !3685, !DIExpression(), !3686)
    #dbg_value(i32 %r, !3687, !DIExpression(), !3686)
    #dbg_value(ptr %in, !3688, !DIExpression(), !3686)
    #dbg_value(i32 %inlen, !3689, !DIExpression(), !3686)
    #dbg_value(i8 %p, !3690, !DIExpression(), !3686)
    #dbg_value(i32 0, !3691, !DIExpression(), !3686)
  br label %for.cond, !dbg !3692

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3694
    #dbg_value(i32 %i.0, !3691, !DIExpression(), !3686)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3695
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !3697

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !3698
  br label %while.cond, !dbg !3698

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3699
  store i64 0, ptr %arrayidx, align 8, !dbg !3700
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3701
    #dbg_value(i32 %inc, !3691, !DIExpression(), !3686)
  br label %for.cond, !dbg !3702, !llvm.loop !3703

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !3689, !DIExpression(), !3686)
    #dbg_value(ptr %in.addr.0, !3688, !DIExpression(), !3686)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !3705
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !3698

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !3706

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !3709

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !3711
    #dbg_value(i32 %i.1, !3691, !DIExpression(), !3686)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !3712
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !3706

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !3714
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3715
    #dbg_value(ptr %add.ptr, !3716, !DIExpression(), !3720)
    #dbg_value(i64 0, !3722, !DIExpression(), !3720)
    #dbg_value(i32 0, !3723, !DIExpression(), !3720)
  br label %for.cond.i, !dbg !3724

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !3726
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !3720
    #dbg_value(i64 %r.0.i, !3722, !DIExpression(), !3720)
    #dbg_value(i32 %i.0.i, !3723, !DIExpression(), !3720)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !3727
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !3729

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3720)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !3730
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !3730
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3720)
  %conv.i = zext i8 %1 to i64, !dbg !3731
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3720)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3732
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3720)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3733
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3720)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !3733
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !3722, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !3720)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !3734
    #dbg_value(i64 %or.i, !3722, !DIExpression(), !3720)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3735
    #dbg_value(i32 %inc.i, !3723, !DIExpression(), !3720)
  br label %for.cond.i, !dbg !3736, !llvm.loop !3737

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !3720
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3739
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !3740
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !3740
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3740
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !3741
    #dbg_value(i32 %inc7, !3691, !DIExpression(), !3686)
  br label %for.cond2, !dbg !3742, !llvm.loop !3743

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3745
    #dbg_value(ptr %add.ptr9, !3688, !DIExpression(), !3686)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3746
    #dbg_value(i32 %sub, !3689, !DIExpression(), !3686)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3747
  br label %while.cond, !dbg !3698, !llvm.loop !3748

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !3750
    #dbg_value(i32 %i.2, !3691, !DIExpression(), !3686)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !3751
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !3709

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !3753
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !3753
  %conv = zext i8 %3 to i64, !dbg !3754
  %rem = shl i32 %i.2, 3, !dbg !3755
  %mul14 = and i32 %rem, 56, !dbg !3755
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !3756
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3756
  %div153 = lshr i32 %i.2, 3, !dbg !3757
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !3758
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !3759
  %xor17 = xor i64 %4, %shl, !dbg !3759
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !3759
  %inc19 = add i32 %i.2, 1, !dbg !3760
    #dbg_value(i32 %inc19, !3691, !DIExpression(), !3686)
  br label %for.cond10, !dbg !3761, !llvm.loop !3762

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !3750
  %conv21 = zext i8 %p to i64, !dbg !3764
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !3765
  %mul23 = and i32 %rem22, 56, !dbg !3765
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !3766
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !3766
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !3767
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !3768
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !3769
  %xor28 = xor i64 %5, %shl25, !dbg !3769
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !3769
  %sub29 = add i32 %r, -1, !dbg !3770
  %div302 = lshr i32 %sub29, 3, !dbg !3771
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !3772
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !3773
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !3773
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !3773
  ret void, !dbg !3774
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !341 {
entry:
    #dbg_value(ptr %out, !340, !DIExpression(), !3775)
    #dbg_value(i32 %nblocks, !346, !DIExpression(), !3775)
    #dbg_value(ptr %state, !347, !DIExpression(), !3775)
    #dbg_value(ptr %out, !348, !DIExpression(), !3776)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !3776)
    #dbg_value(ptr %state, !356, !DIExpression(), !3776)
    #dbg_value(i32 168, !357, !DIExpression(), !3776)
  br label %while.cond.i, !dbg !3778

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3776)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3776)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3778
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3778

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3779
    #dbg_value(i32 0, !361, !DIExpression(), !3776)
  br label %for.cond.i, !dbg !3780

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3781
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3776)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !3782
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3783

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3784
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3785
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3786
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3786
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3787)
    #dbg_value(i64 %0, !377, !DIExpression(), !3787)
    #dbg_value(i32 0, !378, !DIExpression(), !3787)
  br label %for.cond.i.i, !dbg !3789

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3790
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3787)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3791
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3792

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3793
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3794
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3794
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3795
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3796
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3797
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3798
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3787)
  br label %for.cond.i.i, !dbg !3799, !llvm.loop !3800

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3802
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3776)
  br label %for.cond.i, !dbg !3803, !llvm.loop !3804

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3806
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3776)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3807
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3776)
  br label %while.cond.i, !dbg !3778, !llvm.loop !3808

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3810
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3811 {
entry:
    #dbg_value(ptr %state, !3812, !DIExpression(), !3813)
    #dbg_value(ptr %state, !3072, !DIExpression(), !3814)
    #dbg_value(i32 0, !3078, !DIExpression(), !3814)
  br label %for.cond.i, !dbg !3816

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3817
    #dbg_value(i32 %i.0.i, !3078, !DIExpression(), !3814)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3818
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3819

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3820
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3821
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3822
    #dbg_value(i32 %inc.i, !3078, !DIExpression(), !3814)
  br label %for.cond.i, !dbg !3823, !llvm.loop !3824

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3826
  store i32 0, ptr %pos, align 8, !dbg !3827
  ret void, !dbg !3828
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3829 {
entry:
    #dbg_value(ptr %state, !3830, !DIExpression(), !3831)
    #dbg_value(ptr %in, !3832, !DIExpression(), !3831)
    #dbg_value(i32 %inlen, !3833, !DIExpression(), !3831)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3834
  %0 = load i32, ptr %pos, align 8, !dbg !3834
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3835
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3836
  store i32 %call, ptr %pos1, align 8, !dbg !3837
  ret void, !dbg !3838
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3839 {
entry:
    #dbg_value(ptr %state, !3840, !DIExpression(), !3841)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3842
  %0 = load i32, ptr %pos, align 8, !dbg !3842
    #dbg_value(ptr %state, !3624, !DIExpression(), !3843)
    #dbg_value(i32 %0, !3630, !DIExpression(), !3843)
    #dbg_value(i32 136, !3631, !DIExpression(), !3843)
    #dbg_value(i8 31, !3632, !DIExpression(), !3843)
  %rem.i = shl i32 %0, 3, !dbg !3845
  %mul.i = and i32 %rem.i, 56, !dbg !3845
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3846
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3846
  %div2.i = lshr i32 %0, 3, !dbg !3847
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3848
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3849
  %xor.i = xor i64 %1, %shl.i, !dbg !3849
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3849
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !3850
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3851
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3851
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3851
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3852
  store i32 136, ptr %pos1, align 8, !dbg !3853
  ret void, !dbg !3854
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !606 {
entry:
    #dbg_value(ptr %out, !605, !DIExpression(), !3855)
    #dbg_value(i32 %outlen, !609, !DIExpression(), !3855)
    #dbg_value(ptr %state, !610, !DIExpression(), !3855)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3856
  %0 = load i32, ptr %pos, align 8, !dbg !3856
    #dbg_value(ptr %out, !612, !DIExpression(), !3857)
    #dbg_value(i32 %outlen, !618, !DIExpression(), !3857)
    #dbg_value(ptr %state, !619, !DIExpression(), !3857)
    #dbg_value(i32 %0, !620, !DIExpression(), !3857)
    #dbg_value(i32 136, !621, !DIExpression(), !3857)
  br label %while.cond.i, !dbg !3859

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !3857)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3857)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3857)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3859
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3859

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !3860
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3860

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3861
    #dbg_value(i32 0, !620, !DIExpression(), !3857)
  br label %if.end.i, !dbg !3862

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3857)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3857)
  br label %for.cond.i, !dbg !3863

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3864
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3857)
    #dbg_value(i32 %i.0.i, !629, !DIExpression(), !3857)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !3865
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3866
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3866
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3866
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3867

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3868
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3869
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3869
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3870
  %mul.i = and i32 %rem.i, 56, !dbg !3870
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3871
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3871
  %conv.i = trunc i64 %shr.i to i8, !dbg !3869
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3857)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3872
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3873
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3857)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3874
    #dbg_value(i32 %inc.i, !629, !DIExpression(), !3857)
  br label %for.cond.i, !dbg !3875, !llvm.loop !3876

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3864
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3878
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3879
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3857)
    #dbg_value(i32 %i.0.i.lcssa, !620, !DIExpression(), !3857)
  br label %while.cond.i, !dbg !3859, !llvm.loop !3880

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3882
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3883
  ret void, !dbg !3884
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !577 {
entry:
    #dbg_value(ptr %state, !590, !DIExpression(), !3885)
    #dbg_value(ptr %in, !592, !DIExpression(), !3885)
    #dbg_value(i32 %inlen, !593, !DIExpression(), !3885)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3886
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3887
  store i32 136, ptr %pos, align 8, !dbg !3888
  ret void, !dbg !3889
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !598 {
entry:
    #dbg_value(ptr %out, !597, !DIExpression(), !3890)
    #dbg_value(i32 %nblocks, !601, !DIExpression(), !3890)
    #dbg_value(ptr %state, !602, !DIExpression(), !3890)
    #dbg_value(ptr %out, !348, !DIExpression(), !3891)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !3891)
    #dbg_value(ptr %state, !356, !DIExpression(), !3891)
    #dbg_value(i32 136, !357, !DIExpression(), !3891)
  br label %while.cond.i, !dbg !3893

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3891)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3891)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3893
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3893

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3894
    #dbg_value(i32 0, !361, !DIExpression(), !3891)
  br label %for.cond.i, !dbg !3895

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3896
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3891)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !3897
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3898

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3899
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3900
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3901
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3901
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3902)
    #dbg_value(i64 %0, !377, !DIExpression(), !3902)
    #dbg_value(i32 0, !378, !DIExpression(), !3902)
  br label %for.cond.i.i, !dbg !3904

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3905
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3902)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3906
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3907

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3908
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3909
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3909
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3910
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3911
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3912
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3913
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3902)
  br label %for.cond.i.i, !dbg !3914, !llvm.loop !3915

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3917
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3891)
  br label %for.cond.i, !dbg !3918, !llvm.loop !3919

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !3921
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3891)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3922
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3891)
  br label %while.cond.i, !dbg !3893, !llvm.loop !3923

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3925
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3926 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3927, !DIExpression(), !3928)
    #dbg_value(i32 %outlen, !3929, !DIExpression(), !3928)
    #dbg_value(ptr %in, !3930, !DIExpression(), !3928)
    #dbg_value(i32 %inlen, !3931, !DIExpression(), !3928)
    #dbg_declare(ptr %state, !3932, !DIExpression(), !3933)
    #dbg_value(ptr %state, !307, !DIExpression(), !3934)
    #dbg_value(ptr %in, !319, !DIExpression(), !3934)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !3934)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3936
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3937
  store i32 168, ptr %pos.i, align 8, !dbg !3938
  %div = udiv i32 %outlen, 168, !dbg !3939
    #dbg_value(i32 %div, !3940, !DIExpression(), !3928)
    #dbg_value(ptr %out, !340, !DIExpression(), !3941)
    #dbg_value(i32 %div, !346, !DIExpression(), !3941)
    #dbg_value(ptr %state, !347, !DIExpression(), !3941)
    #dbg_value(ptr %out, !348, !DIExpression(), !3943)
    #dbg_value(i32 %div, !355, !DIExpression(), !3943)
    #dbg_value(ptr %state, !356, !DIExpression(), !3943)
    #dbg_value(i32 168, !357, !DIExpression(), !3943)
  br label %while.cond.i, !dbg !3945

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3943)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3943)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3945
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3945

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3946
    #dbg_value(i32 0, !361, !DIExpression(), !3943)
  br label %for.cond.i, !dbg !3947

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3948
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3943)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !3949
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !3950

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3951
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3952
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3953
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3953
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3954)
    #dbg_value(i64 %0, !377, !DIExpression(), !3954)
    #dbg_value(i32 0, !378, !DIExpression(), !3954)
  br label %for.cond.i.i, !dbg !3956

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3957
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3954)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3958
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3959

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3960
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3961
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3961
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3962
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3963
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3964
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3965
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3954)
  br label %for.cond.i.i, !dbg !3966, !llvm.loop !3967

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3969
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3943)
  br label %for.cond.i, !dbg !3970, !llvm.loop !3971

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3973
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3943)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !3974
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3943)
  br label %while.cond.i, !dbg !3945, !llvm.loop !3975

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !3977
  %sub = add i32 %mul.neg, %outlen, !dbg !3978
    #dbg_value(i32 %sub, !3929, !DIExpression(), !3928)
  %mul1 = mul nuw i32 %div, 168, !dbg !3979
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3980
    #dbg_value(ptr %add.ptr, !3927, !DIExpression(), !3928)
    #dbg_value(ptr %add.ptr, !3644, !DIExpression(), !3981)
    #dbg_value(i32 %sub, !3646, !DIExpression(), !3981)
    #dbg_value(ptr %state, !3647, !DIExpression(), !3981)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3983
  %1 = load i32, ptr %pos.i1, align 8, !dbg !3983
    #dbg_value(ptr %add.ptr, !612, !DIExpression(), !3984)
    #dbg_value(i32 %sub, !618, !DIExpression(), !3984)
    #dbg_value(ptr %state, !619, !DIExpression(), !3984)
    #dbg_value(i32 %1, !620, !DIExpression(), !3984)
    #dbg_value(i32 168, !621, !DIExpression(), !3984)
  br label %while.cond.i2, !dbg !3986

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !3984)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3984)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3984)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3986
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !3986

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !3987
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !3987

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3988
    #dbg_value(i32 0, !620, !DIExpression(), !3984)
  br label %if.end.i, !dbg !3989

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3984)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3984)
  br label %for.cond.i7, !dbg !3990

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !3991
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3984)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !3984)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !3992
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3993
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !3993
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3993
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !3994

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !3995
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3996
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !3996
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !3997
  %mul.i12 = and i32 %rem.i, 56, !dbg !3997
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !3998
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !3998
  %conv.i = trunc i64 %shr.i to i8, !dbg !3996
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3984)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3999
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4000
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3984)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4001
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !3984)
  br label %for.cond.i7, !dbg !4002, !llvm.loop !4003

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !3991
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4005
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4006
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3984)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !3984)
  br label %while.cond.i2, !dbg !3986, !llvm.loop !4007

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4009
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4010
  ret void, !dbg !4011
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !579 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !583, !DIExpression(), !4012)
    #dbg_value(i32 %outlen, !585, !DIExpression(), !4012)
    #dbg_value(ptr %in, !586, !DIExpression(), !4012)
    #dbg_value(i32 %inlen, !587, !DIExpression(), !4012)
    #dbg_declare(ptr %state, !588, !DIExpression(), !4013)
    #dbg_value(ptr %state, !590, !DIExpression(), !4014)
    #dbg_value(ptr %in, !592, !DIExpression(), !4014)
    #dbg_value(i32 %inlen, !593, !DIExpression(), !4014)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4016
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4017
  store i32 136, ptr %pos.i, align 8, !dbg !4018
  %div = udiv i32 %outlen, 136, !dbg !4019
    #dbg_value(i32 %div, !596, !DIExpression(), !4012)
    #dbg_value(ptr %out, !597, !DIExpression(), !4020)
    #dbg_value(i32 %div, !601, !DIExpression(), !4020)
    #dbg_value(ptr %state, !602, !DIExpression(), !4020)
    #dbg_value(ptr %out, !348, !DIExpression(), !4022)
    #dbg_value(i32 %div, !355, !DIExpression(), !4022)
    #dbg_value(ptr %state, !356, !DIExpression(), !4022)
    #dbg_value(i32 136, !357, !DIExpression(), !4022)
  br label %while.cond.i, !dbg !4024

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !4022)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !4022)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4024
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4024

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4025
    #dbg_value(i32 0, !361, !DIExpression(), !4022)
  br label %for.cond.i, !dbg !4026

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4027
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !4022)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !4028
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4029

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4030
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4031
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4032
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4032
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !4033)
    #dbg_value(i64 %0, !377, !DIExpression(), !4033)
    #dbg_value(i32 0, !378, !DIExpression(), !4033)
  br label %for.cond.i.i, !dbg !4035

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4036
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !4033)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4037
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4038

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4039
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4040
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4040
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4041
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4042
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4043
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4044
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !4033)
  br label %for.cond.i.i, !dbg !4045, !llvm.loop !4046

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4048
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !4022)
  br label %for.cond.i, !dbg !4049, !llvm.loop !4050

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4052
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !4022)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4053
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !4022)
  br label %while.cond.i, !dbg !4024, !llvm.loop !4054

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !4056
  %sub = add i32 %mul.neg, %outlen, !dbg !4057
    #dbg_value(i32 %sub, !585, !DIExpression(), !4012)
  %mul1 = mul nuw i32 %div, 136, !dbg !4058
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4059
    #dbg_value(ptr %add.ptr, !583, !DIExpression(), !4012)
    #dbg_value(ptr %add.ptr, !605, !DIExpression(), !4060)
    #dbg_value(i32 %sub, !609, !DIExpression(), !4060)
    #dbg_value(ptr %state, !610, !DIExpression(), !4060)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4062
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4062
    #dbg_value(ptr %add.ptr, !612, !DIExpression(), !4063)
    #dbg_value(i32 %sub, !618, !DIExpression(), !4063)
    #dbg_value(ptr %state, !619, !DIExpression(), !4063)
    #dbg_value(i32 %1, !620, !DIExpression(), !4063)
    #dbg_value(i32 136, !621, !DIExpression(), !4063)
  br label %while.cond.i2, !dbg !4065

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !4063)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !4063)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !4063)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4065
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4065

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4066
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4066

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4067
    #dbg_value(i32 0, !620, !DIExpression(), !4063)
  br label %if.end.i, !dbg !4068

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !4063)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !4063)
  br label %for.cond.i7, !dbg !4069

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4070
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !4063)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !4063)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !4071
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4072
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4072
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4072
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4073

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4074
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4075
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4075
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4076
  %mul.i12 = and i32 %rem.i, 56, !dbg !4076
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4077
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4077
  %conv.i = trunc i64 %shr.i to i8, !dbg !4075
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4063)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4078
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4079
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !4063)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4080
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !4063)
  br label %for.cond.i7, !dbg !4081, !llvm.loop !4082

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4070
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4084
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4085
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !4063)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !4063)
  br label %while.cond.i2, !dbg !4065, !llvm.loop !4086

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4088
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4089
  ret void, !dbg !4090
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4091 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4094, !DIExpression(), !4095)
    #dbg_value(ptr %in, !4096, !DIExpression(), !4095)
    #dbg_value(i32 %inlen, !4097, !DIExpression(), !4095)
    #dbg_declare(ptr %s, !4098, !DIExpression(), !4099)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4100
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4101
    #dbg_value(i32 0, !4102, !DIExpression(), !4095)
  br label %for.cond, !dbg !4103

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4105
    #dbg_value(i32 %i.0, !4102, !DIExpression(), !4095)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4106
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4108

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4109
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4110
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4111
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4111
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4112)
    #dbg_value(i64 %0, !377, !DIExpression(), !4112)
    #dbg_value(i32 0, !378, !DIExpression(), !4112)
  br label %for.cond.i, !dbg !4114

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4115
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4112)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4116
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4117

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4118
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4119
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4119
  %conv.i = trunc i64 %shr.i to i8, !dbg !4120
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4121
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4122
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4123
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4112)
  br label %for.cond.i, !dbg !4124, !llvm.loop !4125

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4127
    #dbg_value(i32 %inc, !4102, !DIExpression(), !4095)
  br label %for.cond, !dbg !4128, !llvm.loop !4129

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4131
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4132 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4133, !DIExpression(), !4134)
    #dbg_value(ptr %in, !4135, !DIExpression(), !4134)
    #dbg_value(i32 %inlen, !4136, !DIExpression(), !4134)
    #dbg_declare(ptr %s, !4137, !DIExpression(), !4138)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4139
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4140
    #dbg_value(i32 0, !4141, !DIExpression(), !4134)
  br label %for.cond, !dbg !4142

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4144
    #dbg_value(i32 %i.0, !4141, !DIExpression(), !4134)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4145
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4147

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4148
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4149
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4150
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4150
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4151)
    #dbg_value(i64 %0, !377, !DIExpression(), !4151)
    #dbg_value(i32 0, !378, !DIExpression(), !4151)
  br label %for.cond.i, !dbg !4153

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4154
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4151)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4155
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4156

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4157
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4158
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4158
  %conv.i = trunc i64 %shr.i to i8, !dbg !4159
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4160
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4161
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4162
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4151)
  br label %for.cond.i, !dbg !4163, !llvm.loop !4164

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4166
    #dbg_value(i32 %inc, !4141, !DIExpression(), !4134)
  br label %for.cond, !dbg !4167, !llvm.loop !4168

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4170
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !282 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !293, !DIExpression(), !4171)
    #dbg_value(ptr %seed, !295, !DIExpression(), !4171)
    #dbg_value(i8 %x, !296, !DIExpression(), !4171)
    #dbg_value(i8 %y, !297, !DIExpression(), !4171)
    #dbg_declare(ptr %extseed, !298, !DIExpression(), !4172)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4173
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4174
  store i8 %x, ptr %arrayidx, align 1, !dbg !4175
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4176
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4177
    #dbg_value(ptr %state, !307, !DIExpression(), !4178)
    #dbg_value(ptr %extseed, !319, !DIExpression(), !4178)
    #dbg_value(i32 34, !320, !DIExpression(), !4178)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4180
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4181
  store i32 168, ptr %pos.i, align 8, !dbg !4182
  ret void, !dbg !4183
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !560 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !564, !DIExpression(), !4184)
    #dbg_value(i32 %outlen, !566, !DIExpression(), !4184)
    #dbg_value(ptr %key, !567, !DIExpression(), !4184)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !4184)
    #dbg_declare(ptr %extkey, !569, !DIExpression(), !4185)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4186
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4187
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4188
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4189
  ret void, !dbg !4190
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4191 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4192, !DIExpression(), !4193)
    #dbg_value(ptr %key, !4194, !DIExpression(), !4193)
    #dbg_value(ptr %input, !4195, !DIExpression(), !4193)
    #dbg_declare(ptr %s, !4196, !DIExpression(), !4197)
    #dbg_value(ptr %s, !3812, !DIExpression(), !4198)
    #dbg_value(ptr %s, !3072, !DIExpression(), !4200)
    #dbg_value(i32 0, !3078, !DIExpression(), !4200)
  br label %for.cond.i, !dbg !4202

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4203
    #dbg_value(i32 %i.0.i, !3078, !DIExpression(), !4200)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4204
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4205

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4206
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4207
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4208
    #dbg_value(i32 %inc.i, !3078, !DIExpression(), !4200)
  br label %for.cond.i, !dbg !4209, !llvm.loop !4210

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4212
  store i32 0, ptr %pos.i, align 8, !dbg !4213
    #dbg_value(ptr %s, !3830, !DIExpression(), !4214)
    #dbg_value(ptr %key, !3832, !DIExpression(), !4214)
    #dbg_value(i32 32, !3833, !DIExpression(), !4214)
  %call.i5 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4216
  %pos1.i6 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4217
  store i32 %call.i5, ptr %pos1.i6, align 8, !dbg !4218
    #dbg_value(ptr %s, !3830, !DIExpression(), !4219)
    #dbg_value(ptr %input, !3832, !DIExpression(), !4219)
    #dbg_value(i32 1568, !3833, !DIExpression(), !4219)
  %call.i = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i5, i32 noundef 136, ptr noundef %input, i32 noundef 1568) #4, !dbg !4221
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4222
  store i32 %call.i, ptr %pos1.i, align 8, !dbg !4223
    #dbg_value(ptr %s, !3840, !DIExpression(), !4224)
    #dbg_value(ptr %s, !3624, !DIExpression(), !4226)
    #dbg_value(i32 %call.i, !3630, !DIExpression(), !4226)
    #dbg_value(i32 136, !3631, !DIExpression(), !4226)
    #dbg_value(i8 31, !3632, !DIExpression(), !4226)
  %rem.i = shl i32 %call.i, 3, !dbg !4228
  %mul.i = and i32 %rem.i, 56, !dbg !4228
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4229
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4229
  %div2.i = lshr i32 %call.i, 3, !dbg !4230
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4231
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4232
  %xor.i = xor i64 %0, %shl.i, !dbg !4232
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4232
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4233
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4234
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4234
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4234
  %pos1.i3 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4235
  store i32 136, ptr %pos1.i3, align 8, !dbg !4236
    #dbg_value(ptr %out, !605, !DIExpression(), !4237)
    #dbg_value(i32 32, !609, !DIExpression(), !4237)
    #dbg_value(ptr %s, !610, !DIExpression(), !4237)
    #dbg_value(ptr %out, !612, !DIExpression(), !4239)
    #dbg_value(i32 32, !618, !DIExpression(), !4239)
    #dbg_value(ptr %s, !619, !DIExpression(), !4239)
    #dbg_value(i32 136, !620, !DIExpression(), !4239)
    #dbg_value(i32 136, !621, !DIExpression(), !4239)
  br label %while.cond.i, !dbg !4241

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !4239)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !4239)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !4239)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4241
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4241

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4242
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4242

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4243
    #dbg_value(i32 0, !620, !DIExpression(), !4239)
  br label %if.end.i, !dbg !4244

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !4239)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !4239)
  br label %for.cond.i12, !dbg !4245

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4246
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !4239)
    #dbg_value(i32 %i.0.i13, !629, !DIExpression(), !4239)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4247
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4248
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4248
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4248
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4249

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4250
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4251
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4251
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4252
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4252
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4253
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4253
  %conv.i = trunc i64 %shr.i to i8, !dbg !4251
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4239)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4254
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4255
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !4239)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4256
    #dbg_value(i32 %inc.i19, !629, !DIExpression(), !4239)
  br label %for.cond.i12, !dbg !4257, !llvm.loop !4258

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4246
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4260
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4261
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !4239)
    #dbg_value(i32 %i.0.i13.lcssa, !620, !DIExpression(), !4239)
  br label %while.cond.i, !dbg !4241, !llvm.loop !4262

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4264
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i9, align 8, !dbg !4265
  ret void, !dbg !4266
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshl.i8(i8, i8, i8) #2

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
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
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
!44 = !{!40, !14, !35, !5}
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
!56 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !57, file: !57, line: 25, type: !58, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!79 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !57, file: !57, line: 50, type: !80, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!101 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !57, file: !57, line: 76, type: !102, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!120 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!133 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !57, file: !57, line: 140, type: !134, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 12544, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 1568)
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
!159 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !160, file: !160, line: 16, type: !161, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
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
!191 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !160, file: !160, line: 40, type: !192, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
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
!220 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !221, file: !221, line: 165, type: !222, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!221 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!222 = !DISubroutineType(types: !223)
!223 = !{null, !224, !64, !9}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !227)
!226 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 16384, elements: !228)
!228 = !{!229}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !227, file: !226, line: 9, baseType: !230, size: 16384)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !231, size: 16384, elements: !239)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !233)
!232 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !234)
!234 = !{!235}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !233, file: !232, line: 12, baseType: !236, size: 4096)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 256)
!239 = !{!240}
!240 = !DISubrange(count: 4)
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
!282 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !283, file: !283, line: 18, type: !284, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
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
!505 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !221, file: !221, line: 205, type: !506, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!519 = !DICompositeType(tag: DW_TAG_array_type, baseType: !225, size: 65536, elements: !239)
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
!542 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !543, file: !543, line: 225, type: !544, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!557 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!558 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !551)
!559 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !563)
!560 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !283, file: !283, line: 43, type: !561, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!561 = !DISubroutineType(types: !562)
!562 = !{null, !60, !163, !64, !61}
!563 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !551)
!564 = !DILocalVariable(name: "out", arg: 1, scope: !560, file: !283, line: 43, type: !60)
!565 = !DILocation(line: 0, scope: !560, inlinedAt: !563)
!566 = !DILocalVariable(name: "outlen", arg: 2, scope: !560, file: !283, line: 43, type: !163)
!567 = !DILocalVariable(name: "key", arg: 3, scope: !560, file: !283, line: 43, type: !64)
!568 = !DILocalVariable(name: "nonce", arg: 4, scope: !560, file: !283, line: 43, type: !61)
!569 = !DILocalVariable(name: "extkey", scope: !560, file: !283, line: 45, type: !570)
!570 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !571)
!571 = !{!572}
!572 = !DISubrange(count: 33)
!573 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !563)
!574 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !563)
!575 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !563)
!576 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !578)
!577 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !309, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!578 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !582)
!579 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !580, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!580 = !DISubroutineType(types: !581)
!581 = !{null, !60, !163, !64, !163}
!582 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !563)
!583 = !DILocalVariable(name: "out", arg: 1, scope: !579, file: !27, line: 723, type: !60)
!584 = !DILocation(line: 0, scope: !579, inlinedAt: !582)
!585 = !DILocalVariable(name: "outlen", arg: 2, scope: !579, file: !27, line: 723, type: !163)
!586 = !DILocalVariable(name: "in", arg: 3, scope: !579, file: !27, line: 723, type: !64)
!587 = !DILocalVariable(name: "inlen", arg: 4, scope: !579, file: !27, line: 723, type: !163)
!588 = !DILocalVariable(name: "state", scope: !579, file: !27, line: 726, type: !312)
!589 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !582)
!590 = !DILocalVariable(name: "state", arg: 1, scope: !577, file: !27, line: 667, type: !311)
!591 = !DILocation(line: 0, scope: !577, inlinedAt: !578)
!592 = !DILocalVariable(name: "in", arg: 2, scope: !577, file: !27, line: 667, type: !64)
!593 = !DILocalVariable(name: "inlen", arg: 3, scope: !577, file: !27, line: 667, type: !163)
!594 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !578)
!595 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !578)
!596 = !DILocalVariable(name: "nblocks", scope: !579, file: !27, line: 725, type: !163)
!597 = !DILocalVariable(name: "out", arg: 1, scope: !598, file: !27, line: 685, type: !60)
!598 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !342, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!599 = !DILocation(line: 0, scope: !598, inlinedAt: !600)
!600 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !582)
!601 = !DILocalVariable(name: "nblocks", arg: 2, scope: !598, file: !27, line: 685, type: !163)
!602 = !DILocalVariable(name: "state", arg: 3, scope: !598, file: !27, line: 685, type: !311)
!603 = !DILocation(line: 0, scope: !349, inlinedAt: !604)
!604 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !600)
!605 = !DILocalVariable(name: "out", arg: 1, scope: !606, file: !27, line: 653, type: !60)
!606 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !342, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!607 = !DILocation(line: 0, scope: !606, inlinedAt: !608)
!608 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !582)
!609 = !DILocalVariable(name: "outlen", arg: 2, scope: !606, file: !27, line: 653, type: !163)
!610 = !DILocalVariable(name: "state", arg: 3, scope: !606, file: !27, line: 653, type: !311)
!611 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !608)
!612 = !DILocalVariable(name: "out", arg: 1, scope: !613, file: !27, line: 426, type: !60)
!613 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !614, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!614 = !DISubroutineType(types: !615)
!615 = !{!42, !60, !163, !352, !42, !42}
!616 = !DILocation(line: 0, scope: !613, inlinedAt: !617)
!617 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !608)
!618 = !DILocalVariable(name: "outlen", arg: 2, scope: !613, file: !27, line: 427, type: !163)
!619 = !DILocalVariable(name: "s", arg: 3, scope: !613, file: !27, line: 428, type: !352)
!620 = !DILocalVariable(name: "pos", arg: 4, scope: !613, file: !27, line: 429, type: !42)
!621 = !DILocalVariable(name: "r", arg: 5, scope: !613, file: !27, line: 430, type: !42)
!622 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !617)
!623 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !617)
!624 = distinct !DILexicalBlock(scope: !625, file: !27, line: 435, column: 8)
!625 = distinct !DILexicalBlock(scope: !613, file: !27, line: 434, column: 17)
!626 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !617)
!627 = distinct !DILexicalBlock(scope: !624, file: !27, line: 435, column: 18)
!628 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !617)
!629 = !DILocalVariable(name: "i", scope: !613, file: !27, line: 432, type: !42)
!630 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !617)
!631 = distinct !DILexicalBlock(scope: !625, file: !27, line: 439, column: 5)
!632 = !DILocation(line: 439, scope: !631, inlinedAt: !617)
!633 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !617)
!634 = distinct !DILexicalBlock(scope: !631, file: !27, line: 439, column: 5)
!635 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !617)
!636 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !617)
!637 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !617)
!638 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !617)
!639 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !617)
!640 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !617)
!641 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !617)
!642 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !617)
!643 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !617)
!644 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !617)
!645 = distinct !{!645, !636, !646, !185}
!646 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !617)
!647 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !617)
!648 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !617)
!649 = distinct !{!649, !622, !650, !185}
!650 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !617)
!651 = !DILocation(line: 223, column: 25, scope: !537)
!652 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !608)
!653 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !608)
!654 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !582)
!655 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !563)
!656 = !DILocalVariable(name: "r", arg: 1, scope: !657, file: !658, line: 110, type: !661)
!657 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !658, file: !658, line: 110, type: !659, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!658 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!659 = !DISubroutineType(types: !660)
!660 = !{null, !661, !64}
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 32)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !663)
!663 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !664)
!664 = !{!665}
!665 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !663, file: !232, line: 12, baseType: !236, size: 4096)
!666 = !DILocation(line: 0, scope: !657, inlinedAt: !667)
!667 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !551)
!668 = !DILocalVariable(name: "buf", arg: 2, scope: !657, file: !658, line: 110, type: !64)
!669 = !DILocation(line: 113, column: 3, scope: !657, inlinedAt: !667)
!670 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !551)
!671 = !DILocation(line: 223, column: 54, scope: !537)
!672 = !DILocation(line: 222, column: 22, scope: !537)
!673 = !DILocation(line: 222, column: 3, scope: !537)
!674 = distinct !{!674, !538, !675, !185}
!675 = !DILocation(line: 223, column: 56, scope: !534)
!676 = !DILocation(line: 224, scope: !540)
!677 = !DILocation(line: 224, column: 12, scope: !678)
!678 = distinct !DILexicalBlock(scope: !540, file: !221, line: 224, column: 3)
!679 = !DILocation(line: 173, column: 3, scope: !680, inlinedAt: !695)
!680 = distinct !DILexicalBlock(scope: !682, file: !681, line: 173, column: 3)
!681 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!682 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !681, file: !681, line: 170, type: !683, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!683 = !DISubroutineType(types: !684)
!684 = !{null, !685}
!685 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 32)
!686 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !687)
!687 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 16384, elements: !688)
!688 = !{!689}
!689 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !687, file: !226, line: 9, baseType: !690, size: 16384)
!690 = !DICompositeType(tag: DW_TAG_array_type, baseType: !691, size: 16384, elements: !239)
!691 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !692)
!692 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !693)
!693 = !{!694}
!694 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !692, file: !232, line: 12, baseType: !236, size: 4096)
!695 = distinct !DILocation(line: 227, column: 3, scope: !505)
!696 = !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !697)
!697 = distinct !DILocation(line: 225, column: 5, scope: !678)
!698 = !DILocation(line: 0, scope: !542, inlinedAt: !697)
!699 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !697)
!700 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !701)
!701 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !697)
!702 = !DILocation(line: 0, scope: !560, inlinedAt: !701)
!703 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !701)
!704 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !701)
!705 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !701)
!706 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !707)
!707 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !708)
!708 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !701)
!709 = !DILocation(line: 0, scope: !579, inlinedAt: !708)
!710 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !708)
!711 = !DILocation(line: 0, scope: !577, inlinedAt: !707)
!712 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !707)
!713 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !707)
!714 = !DILocation(line: 0, scope: !598, inlinedAt: !715)
!715 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !708)
!716 = !DILocation(line: 0, scope: !349, inlinedAt: !717)
!717 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !715)
!718 = !DILocation(line: 0, scope: !606, inlinedAt: !719)
!719 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !708)
!720 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !719)
!721 = !DILocation(line: 0, scope: !613, inlinedAt: !722)
!722 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !719)
!723 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !722)
!724 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !722)
!725 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !722)
!726 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !722)
!727 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !722)
!728 = !DILocation(line: 439, scope: !631, inlinedAt: !722)
!729 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !722)
!730 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !722)
!731 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !722)
!732 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !722)
!733 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !722)
!734 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !722)
!735 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !722)
!736 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !722)
!737 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !722)
!738 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !722)
!739 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !722)
!740 = distinct !{!740, !731, !741, !185}
!741 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !722)
!742 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !722)
!743 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !722)
!744 = distinct !{!744, !723, !745, !185}
!745 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !722)
!746 = !DILocation(line: 225, column: 25, scope: !678)
!747 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !719)
!748 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !719)
!749 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !708)
!750 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !701)
!751 = !DILocation(line: 0, scope: !657, inlinedAt: !752)
!752 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !697)
!753 = !DILocation(line: 113, column: 3, scope: !657, inlinedAt: !752)
!754 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !697)
!755 = !DILocation(line: 225, column: 51, scope: !678)
!756 = !DILocation(line: 224, column: 22, scope: !678)
!757 = !DILocation(line: 224, column: 3, scope: !678)
!758 = distinct !{!758, !539, !759, !185}
!759 = !DILocation(line: 225, column: 53, scope: !540)
!760 = !DILocation(line: 173, scope: !680, inlinedAt: !695)
!761 = !DILocalVariable(name: "i", scope: !682, file: !681, line: 172, type: !42)
!762 = !DILocation(line: 0, scope: !682, inlinedAt: !695)
!763 = !DILocation(line: 173, column: 12, scope: !764, inlinedAt: !695)
!764 = distinct !DILexicalBlock(scope: !680, file: !681, line: 173, column: 3)
!765 = !DILocation(line: 173, column: 3, scope: !680, inlinedAt: !766)
!766 = distinct !DILocation(line: 228, column: 3, scope: !505)
!767 = !DILocation(line: 174, column: 15, scope: !764, inlinedAt: !695)
!768 = !DILocalVariable(name: "r", arg: 1, scope: !769, file: !543, line: 261, type: !546)
!769 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !543, file: !543, line: 261, type: !770, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!770 = !DISubroutineType(types: !771)
!771 = !{null, !546}
!772 = !DILocation(line: 0, scope: !769, inlinedAt: !773)
!773 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !695)
!774 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !773)
!775 = !DILocalVariable(name: "r", arg: 1, scope: !776, file: !543, line: 323, type: !546)
!776 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !543, file: !543, line: 323, type: !770, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!777 = !DILocation(line: 0, scope: !776, inlinedAt: !778)
!778 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !773)
!779 = !DILocalVariable(name: "i", scope: !776, file: !543, line: 325, type: !42)
!780 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !778)
!781 = distinct !DILexicalBlock(scope: !776, file: !543, line: 326, column: 3)
!782 = !DILocation(line: 326, scope: !781, inlinedAt: !778)
!783 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !778)
!784 = distinct !DILexicalBlock(scope: !781, file: !543, line: 326, column: 3)
!785 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !778)
!786 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !778)
!787 = !DILocalVariable(name: "a", arg: 1, scope: !788, file: !789, line: 35, type: !14)
!788 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !789, file: !789, line: 35, type: !790, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!789 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!790 = !DISubroutineType(types: !791)
!791 = !{!14, !14}
!792 = !DILocation(line: 0, scope: !788, inlinedAt: !793)
!793 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !778)
!794 = !DILocalVariable(name: "v", scope: !788, file: !789, line: 37, type: !13)
!795 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !793)
!796 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !793)
!797 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !793)
!798 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !793)
!799 = !DILocalVariable(name: "t", scope: !788, file: !789, line: 36, type: !14)
!800 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !793)
!801 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !778)
!802 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !778)
!803 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !778)
!804 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !778)
!805 = distinct !{!805, !785, !806, !185}
!806 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !778)
!807 = !DILocation(line: 173, column: 22, scope: !764, inlinedAt: !695)
!808 = !DILocation(line: 173, column: 3, scope: !764, inlinedAt: !695)
!809 = distinct !{!809, !679, !810, !185}
!810 = !DILocation(line: 174, column: 24, scope: !680, inlinedAt: !695)
!811 = !DILocation(line: 173, scope: !680, inlinedAt: !766)
!812 = !DILocation(line: 0, scope: !682, inlinedAt: !766)
!813 = !DILocation(line: 173, column: 12, scope: !764, inlinedAt: !766)
!814 = !DILocation(line: 231, column: 3, scope: !815)
!815 = distinct !DILexicalBlock(scope: !505, file: !221, line: 231, column: 3)
!816 = !DILocation(line: 174, column: 15, scope: !764, inlinedAt: !766)
!817 = !DILocation(line: 0, scope: !769, inlinedAt: !818)
!818 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !766)
!819 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !818)
!820 = !DILocation(line: 0, scope: !776, inlinedAt: !821)
!821 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !818)
!822 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !821)
!823 = !DILocation(line: 326, scope: !781, inlinedAt: !821)
!824 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !821)
!825 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !821)
!826 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !821)
!827 = !DILocation(line: 0, scope: !788, inlinedAt: !828)
!828 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !821)
!829 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !828)
!830 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !828)
!831 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !828)
!832 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !828)
!833 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !828)
!834 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !821)
!835 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !821)
!836 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !821)
!837 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !821)
!838 = distinct !{!838, !825, !839, !185}
!839 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !821)
!840 = !DILocation(line: 173, column: 22, scope: !764, inlinedAt: !766)
!841 = !DILocation(line: 173, column: 3, scope: !764, inlinedAt: !766)
!842 = distinct !{!842, !765, !843, !185}
!843 = !DILocation(line: 174, column: 24, scope: !680, inlinedAt: !766)
!844 = !DILocation(line: 231, scope: !815)
!845 = !DILocation(line: 231, column: 12, scope: !846)
!846 = distinct !DILexicalBlock(scope: !815, file: !221, line: 231, column: 3)
!847 = !DILocation(line: 244, column: 3, scope: !848, inlinedAt: !854)
!848 = distinct !DILexicalBlock(scope: !849, file: !681, line: 244, column: 3)
!849 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !681, file: !681, line: 241, type: !850, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!850 = !DISubroutineType(types: !851)
!851 = !{null, !685, !852, !852}
!852 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !853, size: 32)
!853 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !686)
!854 = distinct !DILocation(line: 236, column: 3, scope: !505)
!855 = !DILocation(line: 232, column: 37, scope: !856)
!856 = distinct !DILexicalBlock(scope: !846, file: !221, line: 231, column: 26)
!857 = !DILocation(line: 232, column: 51, scope: !856)
!858 = !DILocation(line: 232, column: 5, scope: !856)
!859 = !DILocation(line: 233, column: 18, scope: !856)
!860 = !DILocalVariable(name: "r", arg: 1, scope: !861, file: !543, line: 307, type: !546)
!861 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !543, file: !543, line: 307, type: !770, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!862 = !DILocation(line: 0, scope: !861, inlinedAt: !863)
!863 = distinct !DILocation(line: 233, column: 5, scope: !856)
!864 = !DILocalVariable(name: "f", scope: !861, file: !543, line: 310, type: !13)
!865 = !DILocalVariable(name: "i", scope: !861, file: !543, line: 309, type: !42)
!866 = !DILocation(line: 311, column: 7, scope: !867, inlinedAt: !863)
!867 = distinct !DILexicalBlock(scope: !861, file: !543, line: 311, column: 3)
!868 = !DILocation(line: 311, scope: !867, inlinedAt: !863)
!869 = !DILocation(line: 311, column: 12, scope: !870, inlinedAt: !863)
!870 = distinct !DILexicalBlock(scope: !867, file: !543, line: 311, column: 3)
!871 = !DILocation(line: 311, column: 3, scope: !867, inlinedAt: !863)
!872 = !DILocation(line: 312, column: 47, scope: !870, inlinedAt: !863)
!873 = !DILocation(line: 312, column: 38, scope: !870, inlinedAt: !863)
!874 = !DILocation(line: 312, column: 59, scope: !870, inlinedAt: !863)
!875 = !DILocalVariable(name: "a", arg: 1, scope: !876, file: !789, line: 16, type: !5)
!876 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !789, file: !789, line: 16, type: !877, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!877 = !DISubroutineType(types: !48)
!878 = !DILocation(line: 0, scope: !876, inlinedAt: !879)
!879 = distinct !DILocation(line: 312, column: 20, scope: !870, inlinedAt: !863)
!880 = !DILocalVariable(name: "t", scope: !876, file: !789, line: 18, type: !14)
!881 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !879)
!882 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !879)
!883 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !879)
!884 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !879)
!885 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !879)
!886 = !DILocation(line: 312, column: 5, scope: !870, inlinedAt: !863)
!887 = !DILocation(line: 312, column: 18, scope: !870, inlinedAt: !863)
!888 = !DILocation(line: 311, column: 22, scope: !870, inlinedAt: !863)
!889 = !DILocation(line: 311, column: 3, scope: !870, inlinedAt: !863)
!890 = distinct !{!890, !871, !891, !185}
!891 = !DILocation(line: 312, column: 61, scope: !867, inlinedAt: !863)
!892 = !DILocation(line: 231, column: 22, scope: !846)
!893 = !DILocation(line: 231, column: 3, scope: !846)
!894 = distinct !{!894, !814, !895, !185}
!895 = !DILocation(line: 234, column: 3, scope: !815)
!896 = !DILocation(line: 244, scope: !848, inlinedAt: !854)
!897 = !DILocalVariable(name: "i", scope: !849, file: !681, line: 243, type: !42)
!898 = !DILocation(line: 0, scope: !849, inlinedAt: !854)
!899 = !DILocation(line: 244, column: 12, scope: !900, inlinedAt: !854)
!900 = distinct !DILexicalBlock(scope: !848, file: !681, line: 244, column: 3)
!901 = !DILocation(line: 228, column: 3, scope: !902, inlinedAt: !904)
!902 = distinct !DILexicalBlock(scope: !903, file: !681, line: 228, column: 3)
!903 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !681, file: !681, line: 225, type: !683, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!904 = distinct !DILocation(line: 237, column: 3, scope: !505)
!905 = !DILocation(line: 245, column: 15, scope: !900, inlinedAt: !854)
!906 = !DILocation(line: 245, column: 27, scope: !900, inlinedAt: !854)
!907 = !DILocation(line: 245, column: 39, scope: !900, inlinedAt: !854)
!908 = !DILocalVariable(name: "r", arg: 1, scope: !909, file: !543, line: 339, type: !546)
!909 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !543, file: !543, line: 339, type: !910, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!910 = !DISubroutineType(types: !911)
!911 = !{null, !546, !912, !912}
!912 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !913, size: 32)
!913 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !547)
!914 = !DILocation(line: 0, scope: !909, inlinedAt: !915)
!915 = distinct !DILocation(line: 245, column: 5, scope: !900, inlinedAt: !854)
!916 = !DILocalVariable(name: "a", arg: 2, scope: !909, file: !543, line: 339, type: !912)
!917 = !DILocalVariable(name: "b", arg: 3, scope: !909, file: !543, line: 339, type: !912)
!918 = !DILocalVariable(name: "i", scope: !909, file: !543, line: 341, type: !42)
!919 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !915)
!920 = distinct !DILexicalBlock(scope: !909, file: !543, line: 342, column: 3)
!921 = !DILocation(line: 342, scope: !920, inlinedAt: !915)
!922 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !915)
!923 = distinct !DILexicalBlock(scope: !920, file: !543, line: 342, column: 3)
!924 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !915)
!925 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !915)
!926 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !915)
!927 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !915)
!928 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !915)
!929 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !915)
!930 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !915)
!931 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !915)
!932 = distinct !{!932, !924, !933, !185}
!933 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !915)
!934 = !DILocation(line: 244, column: 22, scope: !900, inlinedAt: !854)
!935 = !DILocation(line: 244, column: 3, scope: !900, inlinedAt: !854)
!936 = distinct !{!936, !847, !937, !185}
!937 = !DILocation(line: 245, column: 48, scope: !848, inlinedAt: !854)
!938 = !DILocation(line: 228, scope: !902, inlinedAt: !904)
!939 = !DILocalVariable(name: "i", scope: !903, file: !681, line: 227, type: !42)
!940 = !DILocation(line: 0, scope: !903, inlinedAt: !904)
!941 = !DILocation(line: 228, column: 12, scope: !942, inlinedAt: !904)
!942 = distinct !DILexicalBlock(scope: !902, file: !681, line: 228, column: 3)
!943 = !DILocation(line: 142, column: 3, scope: !944, inlinedAt: !948)
!944 = distinct !DILexicalBlock(scope: !945, file: !681, line: 142, column: 3)
!945 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !681, file: !681, line: 139, type: !946, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!946 = !DISubroutineType(types: !947)
!947 = !{null, !60, !852}
!948 = distinct !DILocation(line: 59, column: 3, scope: !949, inlinedAt: !952)
!949 = distinct !DISubprogram(name: "pack_sk", scope: !221, file: !221, line: 57, type: !950, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!950 = !DISubroutineType(types: !951)
!951 = !{null, !60, !224}
!952 = distinct !DILocation(line: 239, column: 3, scope: !505)
!953 = !DILocation(line: 229, column: 18, scope: !942, inlinedAt: !904)
!954 = !DILocation(line: 0, scope: !776, inlinedAt: !955)
!955 = distinct !DILocation(line: 229, column: 5, scope: !942, inlinedAt: !904)
!956 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !955)
!957 = !DILocation(line: 326, scope: !781, inlinedAt: !955)
!958 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !955)
!959 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !955)
!960 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !955)
!961 = !DILocation(line: 0, scope: !788, inlinedAt: !962)
!962 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !955)
!963 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !962)
!964 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !962)
!965 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !962)
!966 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !962)
!967 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !962)
!968 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !955)
!969 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !955)
!970 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !955)
!971 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !955)
!972 = distinct !{!972, !959, !973, !185}
!973 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !955)
!974 = !DILocation(line: 228, column: 22, scope: !942, inlinedAt: !904)
!975 = !DILocation(line: 228, column: 3, scope: !942, inlinedAt: !904)
!976 = distinct !{!976, !901, !977, !185}
!977 = !DILocation(line: 229, column: 27, scope: !902, inlinedAt: !904)
!978 = !DILocation(line: 142, scope: !944, inlinedAt: !948)
!979 = !DILocalVariable(name: "i", scope: !945, file: !681, line: 141, type: !42)
!980 = !DILocation(line: 0, scope: !945, inlinedAt: !948)
!981 = !DILocation(line: 142, column: 12, scope: !982, inlinedAt: !948)
!982 = distinct !DILexicalBlock(scope: !944, file: !681, line: 142, column: 3)
!983 = !DILocation(line: 142, column: 3, scope: !944, inlinedAt: !984)
!984 = distinct !DILocation(line: 27, column: 3, scope: !985, inlinedAt: !988)
!985 = distinct !DISubprogram(name: "pack_pk", scope: !221, file: !221, line: 23, type: !986, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!986 = !DISubroutineType(types: !987)
!987 = !{null, !60, !224, !64}
!988 = distinct !DILocation(line: 240, column: 3, scope: !505)
!989 = !DILocation(line: 143, column: 21, scope: !982, inlinedAt: !948)
!990 = !DILocation(line: 143, column: 19, scope: !982, inlinedAt: !948)
!991 = !DILocation(line: 143, column: 40, scope: !982, inlinedAt: !948)
!992 = !DILocation(line: 143, column: 5, scope: !982, inlinedAt: !948)
!993 = !DILocation(line: 142, column: 22, scope: !982, inlinedAt: !948)
!994 = !DILocation(line: 142, column: 3, scope: !982, inlinedAt: !948)
!995 = distinct !{!995, !943, !996, !185}
!996 = !DILocation(line: 143, column: 49, scope: !944, inlinedAt: !948)
!997 = !DILocation(line: 142, scope: !944, inlinedAt: !984)
!998 = !DILocation(line: 0, scope: !945, inlinedAt: !984)
!999 = !DILocation(line: 142, column: 12, scope: !982, inlinedAt: !984)
!1000 = !DILocation(line: 143, column: 21, scope: !982, inlinedAt: !984)
!1001 = !DILocation(line: 143, column: 19, scope: !982, inlinedAt: !984)
!1002 = !DILocation(line: 143, column: 40, scope: !982, inlinedAt: !984)
!1003 = !DILocation(line: 143, column: 5, scope: !982, inlinedAt: !984)
!1004 = !DILocation(line: 142, column: 22, scope: !982, inlinedAt: !984)
!1005 = !DILocation(line: 142, column: 3, scope: !982, inlinedAt: !984)
!1006 = distinct !{!1006, !983, !1007, !185}
!1007 = !DILocation(line: 143, column: 49, scope: !944, inlinedAt: !984)
!1008 = !DILocation(line: 28, column: 11, scope: !985, inlinedAt: !988)
!1009 = !DILocation(line: 28, column: 3, scope: !985, inlinedAt: !988)
!1010 = !DILocation(line: 241, column: 1, scope: !505)
!1011 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !221, file: !221, line: 260, type: !1012, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !60, !64, !64, !64}
!1014 = !DILocalVariable(name: "c", arg: 1, scope: !1011, file: !221, line: 260, type: !60)
!1015 = !DILocation(line: 0, scope: !1011)
!1016 = !DILocalVariable(name: "m", arg: 2, scope: !1011, file: !221, line: 261, type: !64)
!1017 = !DILocalVariable(name: "pk", arg: 3, scope: !1011, file: !221, line: 262, type: !64)
!1018 = !DILocalVariable(name: "coins", arg: 4, scope: !1011, file: !221, line: 263, type: !64)
!1019 = !DILocalVariable(name: "seed", scope: !1011, file: !221, line: 266, type: !126)
!1020 = !DILocation(line: 266, column: 11, scope: !1011)
!1021 = !DILocalVariable(name: "nonce", scope: !1011, file: !221, line: 267, type: !61)
!1022 = !DILocalVariable(name: "sp", scope: !1011, file: !221, line: 268, type: !225)
!1023 = !DILocation(line: 268, column: 11, scope: !1011)
!1024 = !DILocalVariable(name: "pkpv", scope: !1011, file: !221, line: 268, type: !225)
!1025 = !DILocation(line: 268, column: 15, scope: !1011)
!1026 = !DILocalVariable(name: "ep", scope: !1011, file: !221, line: 268, type: !225)
!1027 = !DILocation(line: 268, column: 21, scope: !1011)
!1028 = !DILocalVariable(name: "at", scope: !1011, file: !221, line: 268, type: !519)
!1029 = !DILocation(line: 268, column: 25, scope: !1011)
!1030 = !DILocalVariable(name: "b", scope: !1011, file: !221, line: 268, type: !225)
!1031 = !DILocation(line: 268, column: 38, scope: !1011)
!1032 = !DILocalVariable(name: "v", scope: !1011, file: !221, line: 269, type: !231)
!1033 = !DILocation(line: 269, column: 8, scope: !1011)
!1034 = !DILocalVariable(name: "k", scope: !1011, file: !221, line: 269, type: !231)
!1035 = !DILocation(line: 269, column: 11, scope: !1011)
!1036 = !DILocalVariable(name: "epp", scope: !1011, file: !221, line: 269, type: !231)
!1037 = !DILocation(line: 269, column: 14, scope: !1011)
!1038 = !DILocalVariable(name: "pk", arg: 1, scope: !1039, file: !221, line: 41, type: !224)
!1039 = distinct !DISubprogram(name: "unpack_pk", scope: !221, file: !221, line: 41, type: !1040, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{null, !224, !60, !64}
!1042 = !DILocation(line: 0, scope: !1039, inlinedAt: !1043)
!1043 = distinct !DILocation(line: 271, column: 3, scope: !1011)
!1044 = !DILocalVariable(name: "seed", arg: 2, scope: !1039, file: !221, line: 42, type: !60)
!1045 = !DILocalVariable(name: "packedpk", arg: 3, scope: !1039, file: !221, line: 43, type: !64)
!1046 = !DILocalVariable(name: "r", arg: 1, scope: !1047, file: !681, line: 156, type: !685)
!1047 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !681, file: !681, line: 156, type: !1048, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{null, !685, !64}
!1050 = !DILocation(line: 0, scope: !1047, inlinedAt: !1051)
!1051 = distinct !DILocation(line: 45, column: 3, scope: !1039, inlinedAt: !1043)
!1052 = !DILocalVariable(name: "a", arg: 2, scope: !1047, file: !681, line: 156, type: !64)
!1053 = !DILocalVariable(name: "i", scope: !1047, file: !681, line: 158, type: !42)
!1054 = !DILocation(line: 159, column: 7, scope: !1055, inlinedAt: !1051)
!1055 = distinct !DILexicalBlock(scope: !1047, file: !681, line: 159, column: 3)
!1056 = !DILocation(line: 159, scope: !1055, inlinedAt: !1051)
!1057 = !DILocation(line: 159, column: 12, scope: !1058, inlinedAt: !1051)
!1058 = distinct !DILexicalBlock(scope: !1055, file: !681, line: 159, column: 3)
!1059 = !DILocation(line: 159, column: 3, scope: !1055, inlinedAt: !1051)
!1060 = !DILocation(line: 160, column: 21, scope: !1058, inlinedAt: !1051)
!1061 = !DILocation(line: 160, column: 35, scope: !1058, inlinedAt: !1051)
!1062 = !DILocation(line: 160, column: 33, scope: !1058, inlinedAt: !1051)
!1063 = !DILocation(line: 160, column: 5, scope: !1058, inlinedAt: !1051)
!1064 = !DILocation(line: 159, column: 22, scope: !1058, inlinedAt: !1051)
!1065 = !DILocation(line: 159, column: 3, scope: !1058, inlinedAt: !1051)
!1066 = distinct !{!1066, !1059, !1067, !185}
!1067 = !DILocation(line: 160, column: 51, scope: !1055, inlinedAt: !1051)
!1068 = !DILocation(line: 46, column: 24, scope: !1039, inlinedAt: !1043)
!1069 = !DILocation(line: 46, column: 3, scope: !1039, inlinedAt: !1043)
!1070 = !DILocalVariable(name: "r", arg: 1, scope: !1071, file: !543, line: 168, type: !546)
!1071 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !543, file: !543, line: 168, type: !1072, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{null, !546, !64}
!1074 = !DILocation(line: 0, scope: !1071, inlinedAt: !1075)
!1075 = distinct !DILocation(line: 272, column: 3, scope: !1011)
!1076 = !DILocalVariable(name: "msg", arg: 2, scope: !1071, file: !543, line: 168, type: !64)
!1077 = !DILocalVariable(name: "i", scope: !1071, file: !543, line: 170, type: !42)
!1078 = !DILocation(line: 176, column: 7, scope: !1079, inlinedAt: !1075)
!1079 = distinct !DILexicalBlock(scope: !1071, file: !543, line: 176, column: 3)
!1080 = !DILocation(line: 176, scope: !1079, inlinedAt: !1075)
!1081 = !DILocation(line: 176, column: 12, scope: !1082, inlinedAt: !1075)
!1082 = distinct !DILexicalBlock(scope: !1079, file: !543, line: 176, column: 3)
!1083 = !DILocation(line: 176, column: 3, scope: !1079, inlinedAt: !1075)
!1084 = !DILocation(line: 177, column: 5, scope: !1085, inlinedAt: !1075)
!1085 = distinct !DILexicalBlock(scope: !1086, file: !543, line: 177, column: 5)
!1086 = distinct !DILexicalBlock(scope: !1082, file: !543, line: 176, column: 28)
!1087 = !DILocation(line: 177, scope: !1085, inlinedAt: !1075)
!1088 = !DILocalVariable(name: "j", scope: !1071, file: !543, line: 170, type: !42)
!1089 = !DILocation(line: 177, column: 14, scope: !1090, inlinedAt: !1075)
!1090 = distinct !DILexicalBlock(scope: !1085, file: !543, line: 177, column: 5)
!1091 = !DILocation(line: 178, column: 18, scope: !1092, inlinedAt: !1075)
!1092 = distinct !DILexicalBlock(scope: !1090, file: !543, line: 177, column: 22)
!1093 = !DILocation(line: 178, column: 20, scope: !1092, inlinedAt: !1075)
!1094 = !DILocation(line: 178, column: 7, scope: !1092, inlinedAt: !1075)
!1095 = !DILocation(line: 178, column: 24, scope: !1092, inlinedAt: !1075)
!1096 = !DILocation(line: 179, column: 27, scope: !1092, inlinedAt: !1075)
!1097 = !DILocation(line: 179, column: 31, scope: !1092, inlinedAt: !1075)
!1098 = !DILocation(line: 179, column: 53, scope: !1092, inlinedAt: !1075)
!1099 = !DILocalVariable(name: "r", arg: 1, scope: !1100, file: !160, line: 71, type: !464)
!1100 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !160, file: !160, line: 71, type: !1101, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{null, !464, !14, !35}
!1103 = !DILocation(line: 0, scope: !1100, inlinedAt: !1104)
!1104 = distinct !DILocation(line: 179, column: 7, scope: !1092, inlinedAt: !1075)
!1105 = !DILocalVariable(name: "v", arg: 2, scope: !1100, file: !160, line: 71, type: !14)
!1106 = !DILocalVariable(name: "b", arg: 3, scope: !1100, file: !160, line: 71, type: !35)
!1107 = !DILocation(line: 74, column: 15, scope: !1100, inlinedAt: !1104)
!1108 = !DILocation(line: 74, column: 11, scope: !1100, inlinedAt: !1104)
!1109 = !DILocation(line: 74, column: 6, scope: !1100, inlinedAt: !1104)
!1110 = !DILocation(line: 177, column: 18, scope: !1090, inlinedAt: !1075)
!1111 = !DILocation(line: 177, column: 5, scope: !1090, inlinedAt: !1075)
!1112 = distinct !{!1112, !1084, !1113, !185}
!1113 = !DILocation(line: 180, column: 5, scope: !1085, inlinedAt: !1075)
!1114 = !DILocation(line: 176, column: 24, scope: !1082, inlinedAt: !1075)
!1115 = !DILocation(line: 176, column: 3, scope: !1082, inlinedAt: !1075)
!1116 = distinct !{!1116, !1083, !1117, !185}
!1117 = !DILocation(line: 181, column: 3, scope: !1079, inlinedAt: !1075)
!1118 = !DILocation(line: 273, column: 3, scope: !1011)
!1119 = !DILocalVariable(name: "i", scope: !1011, file: !221, line: 265, type: !42)
!1120 = !DILocation(line: 275, column: 7, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1011, file: !221, line: 275, column: 3)
!1122 = !DILocation(line: 275, scope: !1121)
!1123 = !DILocation(line: 275, column: 12, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1121, file: !221, line: 275, column: 3)
!1125 = !DILocation(line: 275, column: 3, scope: !1121)
!1126 = !DILocation(line: 277, column: 3, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1011, file: !221, line: 277, column: 3)
!1128 = !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !1129)
!1129 = distinct !DILocation(line: 276, column: 5, scope: !1124)
!1130 = !DILocation(line: 0, scope: !542, inlinedAt: !1129)
!1131 = !DILocation(line: 227, column: 11, scope: !542, inlinedAt: !1129)
!1132 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !1133)
!1133 = distinct !DILocation(line: 228, column: 3, scope: !542, inlinedAt: !1129)
!1134 = !DILocation(line: 0, scope: !560, inlinedAt: !1133)
!1135 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !1133)
!1136 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !1133)
!1137 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !1133)
!1138 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !1139)
!1139 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !1140)
!1140 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !1133)
!1141 = !DILocation(line: 0, scope: !579, inlinedAt: !1140)
!1142 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !1140)
!1143 = !DILocation(line: 0, scope: !577, inlinedAt: !1139)
!1144 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !1139)
!1145 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !1139)
!1146 = !DILocation(line: 0, scope: !598, inlinedAt: !1147)
!1147 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !1140)
!1148 = !DILocation(line: 0, scope: !349, inlinedAt: !1149)
!1149 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !1147)
!1150 = !DILocation(line: 0, scope: !606, inlinedAt: !1151)
!1151 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !1140)
!1152 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !1151)
!1153 = !DILocation(line: 0, scope: !613, inlinedAt: !1154)
!1154 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !1151)
!1155 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !1154)
!1156 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !1154)
!1157 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !1154)
!1158 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !1154)
!1159 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !1154)
!1160 = !DILocation(line: 439, scope: !631, inlinedAt: !1154)
!1161 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !1154)
!1162 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !1154)
!1163 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !1154)
!1164 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !1154)
!1165 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !1154)
!1166 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !1154)
!1167 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !1154)
!1168 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !1154)
!1169 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !1154)
!1170 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !1154)
!1171 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !1154)
!1172 = distinct !{!1172, !1163, !1173, !185}
!1173 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !1154)
!1174 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !1154)
!1175 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !1154)
!1176 = distinct !{!1176, !1155, !1177, !185}
!1177 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !1154)
!1178 = !DILocation(line: 276, column: 30, scope: !1124)
!1179 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !1151)
!1180 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !1151)
!1181 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !1140)
!1182 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !1133)
!1183 = !DILocation(line: 0, scope: !657, inlinedAt: !1184)
!1184 = distinct !DILocation(line: 229, column: 3, scope: !542, inlinedAt: !1129)
!1185 = !DILocation(line: 113, column: 3, scope: !657, inlinedAt: !1184)
!1186 = !DILocation(line: 230, column: 1, scope: !542, inlinedAt: !1129)
!1187 = !DILocation(line: 276, column: 46, scope: !1124)
!1188 = !DILocation(line: 275, column: 22, scope: !1124)
!1189 = !DILocation(line: 275, column: 3, scope: !1124)
!1190 = distinct !{!1190, !1125, !1191, !185}
!1191 = !DILocation(line: 276, column: 48, scope: !1121)
!1192 = !DILocation(line: 277, scope: !1127)
!1193 = !DILocation(line: 277, column: 12, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1127, file: !221, line: 277, column: 3)
!1195 = !DILocation(line: 247, column: 3, scope: !1196, inlinedAt: !1197)
!1196 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !543, file: !543, line: 244, type: !544, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1197 = distinct !DILocation(line: 278, column: 5, scope: !1194)
!1198 = !DILocalVariable(name: "r", arg: 1, scope: !1196, file: !543, line: 244, type: !546)
!1199 = !DILocation(line: 0, scope: !1196, inlinedAt: !1197)
!1200 = !DILocalVariable(name: "seed", arg: 2, scope: !1196, file: !543, line: 244, type: !64)
!1201 = !DILocalVariable(name: "nonce", arg: 3, scope: !1196, file: !543, line: 244, type: !61)
!1202 = !DILocalVariable(name: "buf", scope: !1196, file: !543, line: 246, type: !557)
!1203 = !DILocation(line: 246, column: 11, scope: !1196, inlinedAt: !1197)
!1204 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !1205)
!1205 = distinct !DILocation(line: 247, column: 3, scope: !1196, inlinedAt: !1197)
!1206 = !DILocation(line: 0, scope: !560, inlinedAt: !1205)
!1207 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !1205)
!1208 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !1205)
!1209 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !1205)
!1210 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !1211)
!1211 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !1212)
!1212 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !1205)
!1213 = !DILocation(line: 0, scope: !579, inlinedAt: !1212)
!1214 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !1212)
!1215 = !DILocation(line: 0, scope: !577, inlinedAt: !1211)
!1216 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !1211)
!1217 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !1211)
!1218 = !DILocation(line: 0, scope: !598, inlinedAt: !1219)
!1219 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !1212)
!1220 = !DILocation(line: 0, scope: !349, inlinedAt: !1221)
!1221 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !1219)
!1222 = !DILocation(line: 0, scope: !606, inlinedAt: !1223)
!1223 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !1212)
!1224 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !1223)
!1225 = !DILocation(line: 0, scope: !613, inlinedAt: !1226)
!1226 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !1223)
!1227 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !1226)
!1228 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !1226)
!1229 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !1226)
!1230 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !1226)
!1231 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !1226)
!1232 = !DILocation(line: 439, scope: !631, inlinedAt: !1226)
!1233 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !1226)
!1234 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !1226)
!1235 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !1226)
!1236 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !1226)
!1237 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !1226)
!1238 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !1226)
!1239 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !1226)
!1240 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !1226)
!1241 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !1226)
!1242 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !1226)
!1243 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !1226)
!1244 = distinct !{!1244, !1235, !1245, !185}
!1245 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !1226)
!1246 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !1226)
!1247 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !1226)
!1248 = distinct !{!1248, !1227, !1249, !185}
!1249 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !1226)
!1250 = !DILocation(line: 278, column: 30, scope: !1194)
!1251 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !1223)
!1252 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !1223)
!1253 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !1212)
!1254 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !1205)
!1255 = !DILocalVariable(name: "r", arg: 1, scope: !1256, file: !658, line: 121, type: !661)
!1256 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !658, file: !658, line: 121, type: !659, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1257 = !DILocation(line: 0, scope: !1256, inlinedAt: !1258)
!1258 = distinct !DILocation(line: 248, column: 3, scope: !1196, inlinedAt: !1197)
!1259 = !DILocalVariable(name: "buf", arg: 2, scope: !1256, file: !658, line: 121, type: !64)
!1260 = !DILocation(line: 124, column: 3, scope: !1256, inlinedAt: !1258)
!1261 = !DILocation(line: 249, column: 1, scope: !1196, inlinedAt: !1197)
!1262 = !DILocation(line: 278, column: 46, scope: !1194)
!1263 = !DILocation(line: 277, column: 22, scope: !1194)
!1264 = !DILocation(line: 277, column: 3, scope: !1194)
!1265 = distinct !{!1265, !1126, !1266, !185}
!1266 = !DILocation(line: 278, column: 48, scope: !1127)
!1267 = !DILocation(line: 247, column: 3, scope: !1196, inlinedAt: !1268)
!1268 = distinct !DILocation(line: 279, column: 3, scope: !1011)
!1269 = !DILocation(line: 0, scope: !1196, inlinedAt: !1268)
!1270 = !DILocation(line: 246, column: 11, scope: !1196, inlinedAt: !1268)
!1271 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !1272)
!1272 = distinct !DILocation(line: 247, column: 3, scope: !1196, inlinedAt: !1268)
!1273 = !DILocation(line: 0, scope: !560, inlinedAt: !1272)
!1274 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !1272)
!1275 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !1272)
!1276 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !1272)
!1277 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !1278)
!1278 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !1279)
!1279 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !1272)
!1280 = !DILocation(line: 0, scope: !579, inlinedAt: !1279)
!1281 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !1279)
!1282 = !DILocation(line: 0, scope: !577, inlinedAt: !1278)
!1283 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !1278)
!1284 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !1278)
!1285 = !DILocation(line: 0, scope: !598, inlinedAt: !1286)
!1286 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !1279)
!1287 = !DILocation(line: 0, scope: !349, inlinedAt: !1288)
!1288 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !1286)
!1289 = !DILocation(line: 0, scope: !606, inlinedAt: !1290)
!1290 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !1279)
!1291 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !1290)
!1292 = !DILocation(line: 0, scope: !613, inlinedAt: !1293)
!1293 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !1290)
!1294 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !1293)
!1295 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !1293)
!1296 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !1293)
!1297 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !1293)
!1298 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !1293)
!1299 = !DILocation(line: 439, scope: !631, inlinedAt: !1293)
!1300 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !1293)
!1301 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !1293)
!1302 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !1293)
!1303 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !1293)
!1304 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !1293)
!1305 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !1293)
!1306 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !1293)
!1307 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !1293)
!1308 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !1293)
!1309 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !1293)
!1310 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !1293)
!1311 = distinct !{!1311, !1302, !1312, !185}
!1312 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !1293)
!1313 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !1293)
!1314 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !1293)
!1315 = distinct !{!1315, !1294, !1316, !185}
!1316 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !1293)
!1317 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !1290)
!1318 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !1290)
!1319 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !1279)
!1320 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !1272)
!1321 = !DILocation(line: 0, scope: !1256, inlinedAt: !1322)
!1322 = distinct !DILocation(line: 248, column: 3, scope: !1196, inlinedAt: !1268)
!1323 = !DILocation(line: 124, column: 3, scope: !1256, inlinedAt: !1322)
!1324 = !DILocation(line: 249, column: 1, scope: !1196, inlinedAt: !1268)
!1325 = !DILocalVariable(name: "r", arg: 1, scope: !682, file: !681, line: 170, type: !685)
!1326 = !DILocation(line: 0, scope: !682, inlinedAt: !1327)
!1327 = distinct !DILocation(line: 281, column: 3, scope: !1011)
!1328 = !DILocation(line: 173, column: 7, scope: !680, inlinedAt: !1327)
!1329 = !DILocation(line: 173, scope: !680, inlinedAt: !1327)
!1330 = !DILocation(line: 173, column: 12, scope: !764, inlinedAt: !1327)
!1331 = !DILocation(line: 173, column: 3, scope: !680, inlinedAt: !1327)
!1332 = !DILocation(line: 284, column: 3, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1011, file: !221, line: 284, column: 3)
!1334 = !DILocation(line: 174, column: 15, scope: !764, inlinedAt: !1327)
!1335 = !DILocation(line: 0, scope: !769, inlinedAt: !1336)
!1336 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !1327)
!1337 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !1336)
!1338 = !DILocation(line: 0, scope: !776, inlinedAt: !1339)
!1339 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !1336)
!1340 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1339)
!1341 = !DILocation(line: 326, scope: !781, inlinedAt: !1339)
!1342 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1339)
!1343 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1339)
!1344 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1339)
!1345 = !DILocation(line: 0, scope: !788, inlinedAt: !1346)
!1346 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1339)
!1347 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1346)
!1348 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1346)
!1349 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1346)
!1350 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1346)
!1351 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1346)
!1352 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1339)
!1353 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1339)
!1354 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1339)
!1355 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1339)
!1356 = distinct !{!1356, !1343, !1357, !185}
!1357 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1339)
!1358 = !DILocation(line: 173, column: 22, scope: !764, inlinedAt: !1327)
!1359 = !DILocation(line: 173, column: 3, scope: !764, inlinedAt: !1327)
!1360 = distinct !{!1360, !1331, !1361, !185}
!1361 = !DILocation(line: 174, column: 24, scope: !680, inlinedAt: !1327)
!1362 = !DILocation(line: 284, scope: !1333)
!1363 = !DILocation(line: 284, column: 12, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1333, file: !221, line: 284, column: 3)
!1365 = !DILocation(line: 285, column: 37, scope: !1364)
!1366 = !DILocation(line: 285, column: 48, scope: !1364)
!1367 = !DILocation(line: 285, column: 5, scope: !1364)
!1368 = !DILocation(line: 284, column: 22, scope: !1364)
!1369 = !DILocation(line: 284, column: 3, scope: !1364)
!1370 = distinct !{!1370, !1332, !1371, !185}
!1371 = !DILocation(line: 285, column: 58, scope: !1333)
!1372 = !DILocation(line: 287, column: 3, scope: !1011)
!1373 = !DILocalVariable(name: "r", arg: 1, scope: !1374, file: !681, line: 185, type: !685)
!1374 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !681, file: !681, line: 185, type: !683, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1375 = !DILocation(line: 0, scope: !1374, inlinedAt: !1376)
!1376 = distinct !DILocation(line: 289, column: 3, scope: !1011)
!1377 = !DILocalVariable(name: "i", scope: !1374, file: !681, line: 187, type: !42)
!1378 = !DILocation(line: 188, column: 7, scope: !1379, inlinedAt: !1376)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !681, line: 188, column: 3)
!1380 = !DILocation(line: 188, scope: !1379, inlinedAt: !1376)
!1381 = !DILocation(line: 188, column: 12, scope: !1382, inlinedAt: !1376)
!1382 = distinct !DILexicalBlock(scope: !1379, file: !681, line: 188, column: 3)
!1383 = !DILocation(line: 188, column: 3, scope: !1379, inlinedAt: !1376)
!1384 = !DILocation(line: 189, column: 25, scope: !1382, inlinedAt: !1376)
!1385 = !DILocalVariable(name: "r", arg: 1, scope: !1386, file: !543, line: 276, type: !546)
!1386 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !543, file: !543, line: 276, type: !770, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1387 = !DILocation(line: 0, scope: !1386, inlinedAt: !1388)
!1388 = distinct !DILocation(line: 189, column: 5, scope: !1382, inlinedAt: !1376)
!1389 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !1388)
!1390 = !DILocation(line: 188, column: 22, scope: !1382, inlinedAt: !1376)
!1391 = !DILocation(line: 188, column: 3, scope: !1382, inlinedAt: !1376)
!1392 = distinct !{!1392, !1383, !1393, !185}
!1393 = !DILocation(line: 189, column: 34, scope: !1379, inlinedAt: !1376)
!1394 = !DILocation(line: 0, scope: !1386, inlinedAt: !1395)
!1395 = distinct !DILocation(line: 290, column: 3, scope: !1011)
!1396 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !1395)
!1397 = !DILocalVariable(name: "r", arg: 1, scope: !849, file: !681, line: 241, type: !685)
!1398 = !DILocation(line: 0, scope: !849, inlinedAt: !1399)
!1399 = distinct !DILocation(line: 292, column: 3, scope: !1011)
!1400 = !DILocalVariable(name: "a", arg: 2, scope: !849, file: !681, line: 241, type: !852)
!1401 = !DILocalVariable(name: "b", arg: 3, scope: !849, file: !681, line: 241, type: !852)
!1402 = !DILocation(line: 244, column: 7, scope: !848, inlinedAt: !1399)
!1403 = !DILocation(line: 244, scope: !848, inlinedAt: !1399)
!1404 = !DILocation(line: 244, column: 12, scope: !900, inlinedAt: !1399)
!1405 = !DILocation(line: 244, column: 3, scope: !848, inlinedAt: !1399)
!1406 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !1407)
!1407 = distinct !DILocation(line: 293, column: 3, scope: !1011)
!1408 = !DILocation(line: 245, column: 15, scope: !900, inlinedAt: !1399)
!1409 = !DILocation(line: 245, column: 27, scope: !900, inlinedAt: !1399)
!1410 = !DILocation(line: 245, column: 39, scope: !900, inlinedAt: !1399)
!1411 = !DILocation(line: 0, scope: !909, inlinedAt: !1412)
!1412 = distinct !DILocation(line: 245, column: 5, scope: !900, inlinedAt: !1399)
!1413 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !1412)
!1414 = !DILocation(line: 342, scope: !920, inlinedAt: !1412)
!1415 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !1412)
!1416 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !1412)
!1417 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !1412)
!1418 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !1412)
!1419 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !1412)
!1420 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !1412)
!1421 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !1412)
!1422 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !1412)
!1423 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !1412)
!1424 = distinct !{!1424, !1416, !1425, !185}
!1425 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !1412)
!1426 = !DILocation(line: 244, column: 22, scope: !900, inlinedAt: !1399)
!1427 = !DILocation(line: 244, column: 3, scope: !900, inlinedAt: !1399)
!1428 = distinct !{!1428, !1405, !1429, !185}
!1429 = !DILocation(line: 245, column: 48, scope: !848, inlinedAt: !1399)
!1430 = !DILocation(line: 342, scope: !920, inlinedAt: !1407)
!1431 = !DILocation(line: 0, scope: !909, inlinedAt: !1407)
!1432 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !1407)
!1433 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !1434)
!1434 = distinct !DILocation(line: 294, column: 3, scope: !1011)
!1435 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !1407)
!1436 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !1407)
!1437 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !1407)
!1438 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !1407)
!1439 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !1407)
!1440 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !1407)
!1441 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !1407)
!1442 = distinct !{!1442, !1406, !1443, !185}
!1443 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !1407)
!1444 = !DILocation(line: 342, scope: !920, inlinedAt: !1434)
!1445 = !DILocation(line: 0, scope: !909, inlinedAt: !1434)
!1446 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !1434)
!1447 = !DILocation(line: 228, column: 3, scope: !902, inlinedAt: !1448)
!1448 = distinct !DILocation(line: 295, column: 3, scope: !1011)
!1449 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !1434)
!1450 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !1434)
!1451 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !1434)
!1452 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !1434)
!1453 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !1434)
!1454 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !1434)
!1455 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !1434)
!1456 = distinct !{!1456, !1433, !1457, !185}
!1457 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !1434)
!1458 = !DILocation(line: 228, scope: !902, inlinedAt: !1448)
!1459 = !DILocation(line: 0, scope: !903, inlinedAt: !1448)
!1460 = !DILocation(line: 228, column: 12, scope: !942, inlinedAt: !1448)
!1461 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1462)
!1462 = distinct !DILocation(line: 296, column: 3, scope: !1011)
!1463 = !DILocation(line: 229, column: 18, scope: !942, inlinedAt: !1448)
!1464 = !DILocation(line: 0, scope: !776, inlinedAt: !1465)
!1465 = distinct !DILocation(line: 229, column: 5, scope: !942, inlinedAt: !1448)
!1466 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1465)
!1467 = !DILocation(line: 326, scope: !781, inlinedAt: !1465)
!1468 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1465)
!1469 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1465)
!1470 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1465)
!1471 = !DILocation(line: 0, scope: !788, inlinedAt: !1472)
!1472 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1465)
!1473 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1472)
!1474 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1472)
!1475 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1472)
!1476 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1472)
!1477 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1472)
!1478 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1465)
!1479 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1465)
!1480 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1465)
!1481 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1465)
!1482 = distinct !{!1482, !1469, !1483, !185}
!1483 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1465)
!1484 = !DILocation(line: 228, column: 22, scope: !942, inlinedAt: !1448)
!1485 = !DILocation(line: 228, column: 3, scope: !942, inlinedAt: !1448)
!1486 = distinct !{!1486, !1447, !1487, !185}
!1487 = !DILocation(line: 229, column: 27, scope: !902, inlinedAt: !1448)
!1488 = !DILocation(line: 326, scope: !781, inlinedAt: !1462)
!1489 = !DILocation(line: 0, scope: !776, inlinedAt: !1462)
!1490 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1462)
!1491 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1462)
!1492 = !DILocation(line: 0, scope: !788, inlinedAt: !1493)
!1493 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1462)
!1494 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1493)
!1495 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1493)
!1496 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1493)
!1497 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1493)
!1498 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1493)
!1499 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1462)
!1500 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1462)
!1501 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1462)
!1502 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1462)
!1503 = distinct !{!1503, !1461, !1504, !185}
!1504 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1462)
!1505 = !DILocalVariable(name: "r", arg: 1, scope: !1506, file: !221, line: 86, type: !60)
!1506 = distinct !DISubprogram(name: "pack_ciphertext", scope: !221, file: !221, line: 86, type: !1507, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{null, !60, !224, !1509}
!1509 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 32)
!1510 = !DILocation(line: 0, scope: !1506, inlinedAt: !1511)
!1511 = distinct !DILocation(line: 298, column: 3, scope: !1011)
!1512 = !DILocalVariable(name: "b", arg: 2, scope: !1506, file: !221, line: 86, type: !224)
!1513 = !DILocalVariable(name: "v", arg: 3, scope: !1506, file: !221, line: 86, type: !1509)
!1514 = !DILocation(line: 88, column: 3, scope: !1506, inlinedAt: !1511)
!1515 = !DILocation(line: 89, column: 18, scope: !1506, inlinedAt: !1511)
!1516 = !DILocation(line: 89, column: 3, scope: !1506, inlinedAt: !1511)
!1517 = !DILocation(line: 299, column: 1, scope: !1011)
!1518 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !221, file: !221, line: 314, type: !1519, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1519 = !DISubroutineType(types: !1520)
!1520 = !{null, !60, !64, !64}
!1521 = !DILocalVariable(name: "m", arg: 1, scope: !1518, file: !221, line: 314, type: !60)
!1522 = !DILocation(line: 0, scope: !1518)
!1523 = !DILocalVariable(name: "c", arg: 2, scope: !1518, file: !221, line: 315, type: !64)
!1524 = !DILocalVariable(name: "sk", arg: 3, scope: !1518, file: !221, line: 316, type: !64)
!1525 = !DILocalVariable(name: "b", scope: !1518, file: !221, line: 318, type: !225)
!1526 = !DILocation(line: 318, column: 11, scope: !1518)
!1527 = !DILocalVariable(name: "skpv", scope: !1518, file: !221, line: 318, type: !225)
!1528 = !DILocation(line: 318, column: 14, scope: !1518)
!1529 = !DILocalVariable(name: "v", scope: !1518, file: !221, line: 319, type: !231)
!1530 = !DILocation(line: 319, column: 8, scope: !1518)
!1531 = !DILocalVariable(name: "mp", scope: !1518, file: !221, line: 319, type: !231)
!1532 = !DILocation(line: 319, column: 11, scope: !1518)
!1533 = !DILocalVariable(name: "b", arg: 1, scope: !1534, file: !221, line: 102, type: !224)
!1534 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !221, file: !221, line: 102, type: !1535, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{null, !224, !1509, !64}
!1537 = !DILocation(line: 0, scope: !1534, inlinedAt: !1538)
!1538 = distinct !DILocation(line: 321, column: 3, scope: !1518)
!1539 = !DILocalVariable(name: "v", arg: 2, scope: !1534, file: !221, line: 102, type: !1509)
!1540 = !DILocalVariable(name: "c", arg: 3, scope: !1534, file: !221, line: 102, type: !64)
!1541 = !DILocation(line: 104, column: 3, scope: !1534, inlinedAt: !1538)
!1542 = !DILocation(line: 105, column: 23, scope: !1534, inlinedAt: !1538)
!1543 = !DILocation(line: 105, column: 3, scope: !1534, inlinedAt: !1538)
!1544 = !DILocalVariable(name: "sk", arg: 1, scope: !1545, file: !221, line: 70, type: !224)
!1545 = distinct !DISubprogram(name: "unpack_sk", scope: !221, file: !221, line: 70, type: !1546, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{null, !224, !64}
!1548 = !DILocation(line: 0, scope: !1545, inlinedAt: !1549)
!1549 = distinct !DILocation(line: 322, column: 3, scope: !1518)
!1550 = !DILocalVariable(name: "packedsk", arg: 2, scope: !1545, file: !221, line: 70, type: !64)
!1551 = !DILocation(line: 0, scope: !1047, inlinedAt: !1552)
!1552 = distinct !DILocation(line: 72, column: 3, scope: !1545, inlinedAt: !1549)
!1553 = !DILocation(line: 159, column: 7, scope: !1055, inlinedAt: !1552)
!1554 = !DILocation(line: 159, scope: !1055, inlinedAt: !1552)
!1555 = !DILocation(line: 159, column: 12, scope: !1058, inlinedAt: !1552)
!1556 = !DILocation(line: 159, column: 3, scope: !1055, inlinedAt: !1552)
!1557 = !DILocation(line: 173, column: 3, scope: !680, inlinedAt: !1558)
!1558 = distinct !DILocation(line: 324, column: 3, scope: !1518)
!1559 = !DILocation(line: 160, column: 21, scope: !1058, inlinedAt: !1552)
!1560 = !DILocation(line: 160, column: 35, scope: !1058, inlinedAt: !1552)
!1561 = !DILocation(line: 160, column: 33, scope: !1058, inlinedAt: !1552)
!1562 = !DILocation(line: 160, column: 5, scope: !1058, inlinedAt: !1552)
!1563 = !DILocation(line: 159, column: 22, scope: !1058, inlinedAt: !1552)
!1564 = !DILocation(line: 159, column: 3, scope: !1058, inlinedAt: !1552)
!1565 = distinct !{!1565, !1556, !1566, !185}
!1566 = !DILocation(line: 160, column: 51, scope: !1055, inlinedAt: !1552)
!1567 = !DILocation(line: 173, scope: !680, inlinedAt: !1558)
!1568 = !DILocation(line: 0, scope: !682, inlinedAt: !1558)
!1569 = !DILocation(line: 173, column: 12, scope: !764, inlinedAt: !1558)
!1570 = !DILocation(line: 174, column: 15, scope: !764, inlinedAt: !1558)
!1571 = !DILocation(line: 0, scope: !769, inlinedAt: !1572)
!1572 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !1558)
!1573 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !1572)
!1574 = !DILocation(line: 0, scope: !776, inlinedAt: !1575)
!1575 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !1572)
!1576 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1575)
!1577 = !DILocation(line: 326, scope: !781, inlinedAt: !1575)
!1578 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1575)
!1579 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1575)
!1580 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1575)
!1581 = !DILocation(line: 0, scope: !788, inlinedAt: !1582)
!1582 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1575)
!1583 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1582)
!1584 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1582)
!1585 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1582)
!1586 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1582)
!1587 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1582)
!1588 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1575)
!1589 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1575)
!1590 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1575)
!1591 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1575)
!1592 = distinct !{!1592, !1579, !1593, !185}
!1593 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1575)
!1594 = !DILocation(line: 173, column: 22, scope: !764, inlinedAt: !1558)
!1595 = !DILocation(line: 173, column: 3, scope: !764, inlinedAt: !1558)
!1596 = distinct !{!1596, !1557, !1597, !185}
!1597 = !DILocation(line: 174, column: 24, scope: !680, inlinedAt: !1558)
!1598 = !DILocation(line: 325, column: 3, scope: !1518)
!1599 = !DILocation(line: 0, scope: !1386, inlinedAt: !1600)
!1600 = distinct !DILocation(line: 326, column: 3, scope: !1518)
!1601 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !1600)
!1602 = !DILocalVariable(name: "r", arg: 1, scope: !1603, file: !543, line: 355, type: !546)
!1603 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !543, file: !543, line: 355, type: !910, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1604 = !DILocation(line: 0, scope: !1603, inlinedAt: !1605)
!1605 = distinct !DILocation(line: 328, column: 3, scope: !1518)
!1606 = !DILocalVariable(name: "a", arg: 2, scope: !1603, file: !543, line: 355, type: !912)
!1607 = !DILocalVariable(name: "b", arg: 3, scope: !1603, file: !543, line: 355, type: !912)
!1608 = !DILocalVariable(name: "i", scope: !1603, file: !543, line: 357, type: !42)
!1609 = !DILocation(line: 358, column: 7, scope: !1610, inlinedAt: !1605)
!1610 = distinct !DILexicalBlock(scope: !1603, file: !543, line: 358, column: 3)
!1611 = !DILocation(line: 358, scope: !1610, inlinedAt: !1605)
!1612 = !DILocation(line: 358, column: 12, scope: !1613, inlinedAt: !1605)
!1613 = distinct !DILexicalBlock(scope: !1610, file: !543, line: 358, column: 3)
!1614 = !DILocation(line: 358, column: 3, scope: !1610, inlinedAt: !1605)
!1615 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1616)
!1616 = distinct !DILocation(line: 329, column: 3, scope: !1518)
!1617 = !DILocation(line: 359, column: 20, scope: !1613, inlinedAt: !1605)
!1618 = !DILocation(line: 359, column: 35, scope: !1613, inlinedAt: !1605)
!1619 = !DILocation(line: 359, column: 33, scope: !1613, inlinedAt: !1605)
!1620 = !DILocation(line: 359, column: 5, scope: !1613, inlinedAt: !1605)
!1621 = !DILocation(line: 359, column: 18, scope: !1613, inlinedAt: !1605)
!1622 = !DILocation(line: 358, column: 22, scope: !1613, inlinedAt: !1605)
!1623 = !DILocation(line: 358, column: 3, scope: !1613, inlinedAt: !1605)
!1624 = distinct !{!1624, !1614, !1625, !185}
!1625 = !DILocation(line: 359, column: 46, scope: !1610, inlinedAt: !1605)
!1626 = !DILocation(line: 326, scope: !781, inlinedAt: !1616)
!1627 = !DILocation(line: 0, scope: !776, inlinedAt: !1616)
!1628 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1616)
!1629 = !DILocation(line: 197, column: 3, scope: !1630, inlinedAt: !1634)
!1630 = distinct !DILexicalBlock(scope: !1631, file: !543, line: 197, column: 3)
!1631 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !543, file: !543, line: 192, type: !1632, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1632 = !DISubroutineType(types: !1633)
!1633 = !{null, !60, !912}
!1634 = distinct !DILocation(line: 331, column: 3, scope: !1518)
!1635 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1616)
!1636 = !DILocation(line: 0, scope: !788, inlinedAt: !1637)
!1637 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1616)
!1638 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1637)
!1639 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1637)
!1640 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1637)
!1641 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1637)
!1642 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1637)
!1643 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1616)
!1644 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1616)
!1645 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1616)
!1646 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1616)
!1647 = distinct !{!1647, !1615, !1648, !185}
!1648 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1616)
!1649 = !DILocation(line: 197, scope: !1630, inlinedAt: !1634)
!1650 = !DILocalVariable(name: "i", scope: !1631, file: !543, line: 194, type: !42)
!1651 = !DILocation(line: 0, scope: !1631, inlinedAt: !1634)
!1652 = !DILocation(line: 197, column: 12, scope: !1653, inlinedAt: !1634)
!1653 = distinct !DILexicalBlock(scope: !1630, file: !543, line: 197, column: 3)
!1654 = !DILocation(line: 198, column: 5, scope: !1655, inlinedAt: !1634)
!1655 = distinct !DILexicalBlock(scope: !1653, file: !543, line: 197, column: 28)
!1656 = !DILocation(line: 198, column: 12, scope: !1655, inlinedAt: !1634)
!1657 = !DILocalVariable(name: "j", scope: !1631, file: !543, line: 194, type: !42)
!1658 = !DILocation(line: 199, column: 9, scope: !1659, inlinedAt: !1634)
!1659 = distinct !DILexicalBlock(scope: !1655, file: !543, line: 199, column: 5)
!1660 = !DILocation(line: 199, scope: !1659, inlinedAt: !1634)
!1661 = !DILocation(line: 199, column: 14, scope: !1662, inlinedAt: !1634)
!1662 = distinct !DILexicalBlock(scope: !1659, file: !543, line: 199, column: 5)
!1663 = !DILocation(line: 199, column: 5, scope: !1659, inlinedAt: !1634)
!1664 = !DILocation(line: 200, column: 23, scope: !1665, inlinedAt: !1634)
!1665 = distinct !DILexicalBlock(scope: !1662, file: !543, line: 199, column: 22)
!1666 = !DILocation(line: 200, column: 25, scope: !1665, inlinedAt: !1634)
!1667 = !DILocation(line: 200, column: 12, scope: !1665, inlinedAt: !1634)
!1668 = !DILocalVariable(name: "t", scope: !1631, file: !543, line: 195, type: !40)
!1669 = !DILocation(line: 205, column: 9, scope: !1665, inlinedAt: !1634)
!1670 = !DILocation(line: 206, column: 9, scope: !1665, inlinedAt: !1634)
!1671 = !DILocation(line: 207, column: 9, scope: !1665, inlinedAt: !1634)
!1672 = !DILocation(line: 208, column: 19, scope: !1665, inlinedAt: !1634)
!1673 = !DILocation(line: 208, column: 7, scope: !1665, inlinedAt: !1634)
!1674 = !DILocation(line: 208, column: 14, scope: !1665, inlinedAt: !1634)
!1675 = !DILocation(line: 199, column: 18, scope: !1662, inlinedAt: !1634)
!1676 = !DILocation(line: 199, column: 5, scope: !1662, inlinedAt: !1634)
!1677 = distinct !{!1677, !1663, !1678, !185}
!1678 = !DILocation(line: 209, column: 5, scope: !1659, inlinedAt: !1634)
!1679 = !DILocation(line: 197, column: 24, scope: !1653, inlinedAt: !1634)
!1680 = !DILocation(line: 197, column: 3, scope: !1653, inlinedAt: !1634)
!1681 = distinct !{!1681, !1629, !1682, !185}
!1682 = !DILocation(line: 210, column: 3, scope: !1630, inlinedAt: !1634)
!1683 = !DILocation(line: 332, column: 1, scope: !1518)
!1684 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !681, file: !681, line: 15, type: !946, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1685 = !DILocalVariable(name: "r", arg: 1, scope: !1684, file: !681, line: 15, type: !60)
!1686 = !DILocation(line: 0, scope: !1684)
!1687 = !DILocalVariable(name: "a", arg: 2, scope: !1684, file: !681, line: 15, type: !852)
!1688 = !DILocalVariable(name: "t", scope: !1684, file: !681, line: 21, type: !1689)
!1689 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !1690)
!1690 = !{!1691}
!1691 = !DISubrange(count: 8)
!1692 = !DILocation(line: 21, column: 12, scope: !1684)
!1693 = !DILocalVariable(name: "i", scope: !1684, file: !681, line: 17, type: !42)
!1694 = !DILocation(line: 22, column: 7, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1684, file: !681, line: 22, column: 3)
!1696 = !DILocation(line: 22, scope: !1695)
!1697 = !DILocation(line: 22, column: 12, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1695, file: !681, line: 22, column: 3)
!1699 = !DILocation(line: 22, column: 3, scope: !1695)
!1700 = !DILocation(line: 23, column: 5, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1702, file: !681, line: 23, column: 5)
!1702 = distinct !DILexicalBlock(scope: !1698, file: !681, line: 22, column: 26)
!1703 = !DILocation(line: 23, scope: !1701)
!1704 = !DILocalVariable(name: "j", scope: !1684, file: !681, line: 17, type: !42)
!1705 = !DILocation(line: 23, column: 14, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1701, file: !681, line: 23, column: 5)
!1707 = !DILocation(line: 24, column: 7, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1709, file: !681, line: 24, column: 7)
!1709 = distinct !DILexicalBlock(scope: !1706, file: !681, line: 23, column: 30)
!1710 = !DILocation(line: 24, scope: !1708)
!1711 = !DILocalVariable(name: "k", scope: !1684, file: !681, line: 17, type: !42)
!1712 = !DILocation(line: 24, column: 16, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1708, file: !681, line: 24, column: 7)
!1714 = !DILocation(line: 25, column: 17, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1713, file: !681, line: 24, column: 24)
!1716 = !DILocation(line: 25, column: 35, scope: !1715)
!1717 = !DILocation(line: 25, column: 37, scope: !1715)
!1718 = !DILocation(line: 26, column: 39, scope: !1715)
!1719 = !DILocation(line: 26, column: 9, scope: !1715)
!1720 = !DILocation(line: 26, column: 14, scope: !1715)
!1721 = !DILocation(line: 28, column: 14, scope: !1715)
!1722 = !DILocalVariable(name: "d0", scope: !1684, file: !681, line: 18, type: !23)
!1723 = !DILocation(line: 31, column: 12, scope: !1715)
!1724 = !DILocation(line: 32, column: 12, scope: !1715)
!1725 = !DILocation(line: 33, column: 16, scope: !1715)
!1726 = !DILocation(line: 33, column: 9, scope: !1715)
!1727 = !DILocation(line: 33, column: 14, scope: !1715)
!1728 = !DILocation(line: 24, column: 20, scope: !1713)
!1729 = !DILocation(line: 24, column: 7, scope: !1713)
!1730 = distinct !{!1730, !1707, !1731, !185}
!1731 = !DILocation(line: 34, column: 7, scope: !1708)
!1732 = !DILocation(line: 36, column: 16, scope: !1709)
!1733 = !DILocation(line: 36, column: 15, scope: !1709)
!1734 = !DILocation(line: 36, column: 13, scope: !1709)
!1735 = !DILocation(line: 37, column: 16, scope: !1709)
!1736 = !DILocation(line: 37, column: 21, scope: !1709)
!1737 = !DILocation(line: 37, column: 31, scope: !1709)
!1738 = !DILocation(line: 37, column: 36, scope: !1709)
!1739 = !DILocation(line: 37, column: 28, scope: !1709)
!1740 = !DILocation(line: 37, column: 7, scope: !1709)
!1741 = !DILocation(line: 37, column: 13, scope: !1709)
!1742 = !DILocation(line: 38, column: 16, scope: !1709)
!1743 = !DILocation(line: 38, column: 21, scope: !1709)
!1744 = !DILocation(line: 38, column: 31, scope: !1709)
!1745 = !DILocation(line: 38, column: 36, scope: !1709)
!1746 = !DILocation(line: 38, column: 28, scope: !1709)
!1747 = !DILocation(line: 38, column: 7, scope: !1709)
!1748 = !DILocation(line: 38, column: 13, scope: !1709)
!1749 = !DILocation(line: 39, column: 16, scope: !1709)
!1750 = !DILocation(line: 39, column: 21, scope: !1709)
!1751 = !DILocation(line: 39, column: 15, scope: !1709)
!1752 = !DILocation(line: 39, column: 7, scope: !1709)
!1753 = !DILocation(line: 39, column: 13, scope: !1709)
!1754 = !DILocation(line: 40, column: 16, scope: !1709)
!1755 = !DILocation(line: 40, column: 21, scope: !1709)
!1756 = !DILocation(line: 40, column: 31, scope: !1709)
!1757 = !DILocation(line: 40, column: 36, scope: !1709)
!1758 = !DILocation(line: 40, column: 28, scope: !1709)
!1759 = !DILocation(line: 40, column: 7, scope: !1709)
!1760 = !DILocation(line: 40, column: 13, scope: !1709)
!1761 = !DILocation(line: 41, column: 16, scope: !1709)
!1762 = !DILocation(line: 41, column: 21, scope: !1709)
!1763 = !DILocation(line: 41, column: 31, scope: !1709)
!1764 = !DILocation(line: 41, column: 36, scope: !1709)
!1765 = !DILocation(line: 41, column: 28, scope: !1709)
!1766 = !DILocation(line: 41, column: 7, scope: !1709)
!1767 = !DILocation(line: 41, column: 13, scope: !1709)
!1768 = !DILocation(line: 42, column: 16, scope: !1709)
!1769 = !DILocation(line: 42, column: 21, scope: !1709)
!1770 = !DILocation(line: 42, column: 31, scope: !1709)
!1771 = !DILocation(line: 42, column: 36, scope: !1709)
!1772 = !DILocation(line: 42, column: 28, scope: !1709)
!1773 = !DILocation(line: 42, column: 7, scope: !1709)
!1774 = !DILocation(line: 42, column: 13, scope: !1709)
!1775 = !DILocation(line: 43, column: 16, scope: !1709)
!1776 = !DILocation(line: 43, column: 21, scope: !1709)
!1777 = !DILocation(line: 43, column: 15, scope: !1709)
!1778 = !DILocation(line: 43, column: 7, scope: !1709)
!1779 = !DILocation(line: 43, column: 13, scope: !1709)
!1780 = !DILocation(line: 44, column: 16, scope: !1709)
!1781 = !DILocation(line: 44, column: 21, scope: !1709)
!1782 = !DILocation(line: 44, column: 31, scope: !1709)
!1783 = !DILocation(line: 44, column: 36, scope: !1709)
!1784 = !DILocation(line: 44, column: 28, scope: !1709)
!1785 = !DILocation(line: 44, column: 7, scope: !1709)
!1786 = !DILocation(line: 44, column: 13, scope: !1709)
!1787 = !DILocation(line: 45, column: 16, scope: !1709)
!1788 = !DILocation(line: 45, column: 21, scope: !1709)
!1789 = !DILocation(line: 45, column: 31, scope: !1709)
!1790 = !DILocation(line: 45, column: 36, scope: !1709)
!1791 = !DILocation(line: 45, column: 28, scope: !1709)
!1792 = !DILocation(line: 45, column: 7, scope: !1709)
!1793 = !DILocation(line: 45, column: 13, scope: !1709)
!1794 = !DILocation(line: 46, column: 16, scope: !1709)
!1795 = !DILocation(line: 46, column: 21, scope: !1709)
!1796 = !DILocation(line: 46, column: 15, scope: !1709)
!1797 = !DILocation(line: 46, column: 7, scope: !1709)
!1798 = !DILocation(line: 46, column: 13, scope: !1709)
!1799 = !DILocation(line: 47, column: 9, scope: !1709)
!1800 = !DILocation(line: 23, column: 26, scope: !1706)
!1801 = !DILocation(line: 23, column: 5, scope: !1706)
!1802 = distinct !{!1802, !1700, !1803, !185}
!1803 = !DILocation(line: 48, column: 5, scope: !1701)
!1804 = !DILocation(line: 22, column: 22, scope: !1698)
!1805 = !DILocation(line: 22, column: 3, scope: !1698)
!1806 = distinct !{!1806, !1699, !1807, !185}
!1807 = !DILocation(line: 49, column: 3, scope: !1695)
!1808 = !DILocation(line: 77, column: 1, scope: !1684)
!1809 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !681, file: !681, line: 89, type: !1048, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1810 = !DILocalVariable(name: "r", arg: 1, scope: !1809, file: !681, line: 89, type: !685)
!1811 = !DILocation(line: 0, scope: !1809)
!1812 = !DILocalVariable(name: "a", arg: 2, scope: !1809, file: !681, line: 89, type: !64)
!1813 = !DILocalVariable(name: "t", scope: !1809, file: !681, line: 94, type: !1689)
!1814 = !DILocation(line: 94, column: 12, scope: !1809)
!1815 = !DILocalVariable(name: "i", scope: !1809, file: !681, line: 91, type: !42)
!1816 = !DILocation(line: 95, column: 7, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1809, file: !681, line: 95, column: 3)
!1818 = !DILocation(line: 95, scope: !1817)
!1819 = !DILocation(line: 95, column: 12, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1817, file: !681, line: 95, column: 3)
!1821 = !DILocation(line: 95, column: 3, scope: !1817)
!1822 = !DILocation(line: 96, column: 5, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1824, file: !681, line: 96, column: 5)
!1824 = distinct !DILexicalBlock(scope: !1820, file: !681, line: 95, column: 26)
!1825 = !DILocation(line: 96, scope: !1823)
!1826 = !DILocalVariable(name: "j", scope: !1809, file: !681, line: 91, type: !42)
!1827 = !DILocation(line: 96, column: 14, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1823, file: !681, line: 96, column: 5)
!1829 = !DILocation(line: 97, column: 15, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1828, file: !681, line: 96, column: 30)
!1831 = !DILocation(line: 97, column: 39, scope: !1830)
!1832 = !DILocation(line: 97, column: 29, scope: !1830)
!1833 = !DILocation(line: 97, column: 45, scope: !1830)
!1834 = !DILocation(line: 97, column: 26, scope: !1830)
!1835 = !DILocation(line: 97, column: 12, scope: !1830)
!1836 = !DILocation(line: 98, column: 15, scope: !1830)
!1837 = !DILocation(line: 98, column: 20, scope: !1830)
!1838 = !DILocation(line: 98, column: 39, scope: !1830)
!1839 = !DILocation(line: 98, column: 29, scope: !1830)
!1840 = !DILocation(line: 98, column: 45, scope: !1830)
!1841 = !DILocation(line: 98, column: 26, scope: !1830)
!1842 = !DILocation(line: 98, column: 7, scope: !1830)
!1843 = !DILocation(line: 98, column: 12, scope: !1830)
!1844 = !DILocation(line: 99, column: 15, scope: !1830)
!1845 = !DILocation(line: 99, column: 20, scope: !1830)
!1846 = !DILocation(line: 99, column: 39, scope: !1830)
!1847 = !DILocation(line: 99, column: 29, scope: !1830)
!1848 = !DILocation(line: 99, column: 45, scope: !1830)
!1849 = !DILocation(line: 99, column: 26, scope: !1830)
!1850 = !DILocation(line: 99, column: 64, scope: !1830)
!1851 = !DILocation(line: 99, column: 54, scope: !1830)
!1852 = !DILocation(line: 99, column: 69, scope: !1830)
!1853 = !DILocation(line: 99, column: 51, scope: !1830)
!1854 = !DILocation(line: 99, column: 7, scope: !1830)
!1855 = !DILocation(line: 99, column: 12, scope: !1830)
!1856 = !DILocation(line: 100, column: 15, scope: !1830)
!1857 = !DILocation(line: 100, column: 20, scope: !1830)
!1858 = !DILocation(line: 100, column: 39, scope: !1830)
!1859 = !DILocation(line: 100, column: 29, scope: !1830)
!1860 = !DILocation(line: 100, column: 45, scope: !1830)
!1861 = !DILocation(line: 100, column: 26, scope: !1830)
!1862 = !DILocation(line: 100, column: 7, scope: !1830)
!1863 = !DILocation(line: 100, column: 12, scope: !1830)
!1864 = !DILocation(line: 101, column: 15, scope: !1830)
!1865 = !DILocation(line: 101, column: 20, scope: !1830)
!1866 = !DILocation(line: 101, column: 39, scope: !1830)
!1867 = !DILocation(line: 101, column: 29, scope: !1830)
!1868 = !DILocation(line: 101, column: 45, scope: !1830)
!1869 = !DILocation(line: 101, column: 26, scope: !1830)
!1870 = !DILocation(line: 101, column: 7, scope: !1830)
!1871 = !DILocation(line: 101, column: 12, scope: !1830)
!1872 = !DILocation(line: 102, column: 15, scope: !1830)
!1873 = !DILocation(line: 102, column: 20, scope: !1830)
!1874 = !DILocation(line: 102, column: 39, scope: !1830)
!1875 = !DILocation(line: 102, column: 29, scope: !1830)
!1876 = !DILocation(line: 102, column: 45, scope: !1830)
!1877 = !DILocation(line: 102, column: 26, scope: !1830)
!1878 = !DILocation(line: 102, column: 64, scope: !1830)
!1879 = !DILocation(line: 102, column: 54, scope: !1830)
!1880 = !DILocation(line: 102, column: 69, scope: !1830)
!1881 = !DILocation(line: 102, column: 51, scope: !1830)
!1882 = !DILocation(line: 102, column: 7, scope: !1830)
!1883 = !DILocation(line: 102, column: 12, scope: !1830)
!1884 = !DILocation(line: 103, column: 15, scope: !1830)
!1885 = !DILocation(line: 103, column: 20, scope: !1830)
!1886 = !DILocation(line: 103, column: 39, scope: !1830)
!1887 = !DILocation(line: 103, column: 29, scope: !1830)
!1888 = !DILocation(line: 103, column: 45, scope: !1830)
!1889 = !DILocation(line: 103, column: 26, scope: !1830)
!1890 = !DILocation(line: 103, column: 7, scope: !1830)
!1891 = !DILocation(line: 103, column: 12, scope: !1830)
!1892 = !DILocation(line: 104, column: 15, scope: !1830)
!1893 = !DILocation(line: 104, column: 20, scope: !1830)
!1894 = !DILocation(line: 104, column: 39, scope: !1830)
!1895 = !DILocation(line: 104, column: 29, scope: !1830)
!1896 = !DILocation(line: 104, column: 45, scope: !1830)
!1897 = !DILocation(line: 104, column: 26, scope: !1830)
!1898 = !DILocation(line: 104, column: 7, scope: !1830)
!1899 = !DILocation(line: 104, column: 12, scope: !1830)
!1900 = !DILocalVariable(name: "k", scope: !1809, file: !681, line: 91, type: !42)
!1901 = !DILocation(line: 107, column: 11, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1830, file: !681, line: 107, column: 7)
!1903 = !DILocation(line: 107, scope: !1902)
!1904 = !DILocation(line: 107, column: 16, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1902, file: !681, line: 107, column: 7)
!1906 = !DILocation(line: 107, column: 7, scope: !1902)
!1907 = !DILocation(line: 108, column: 47, scope: !1905)
!1908 = !DILocation(line: 108, column: 52, scope: !1905)
!1909 = !DILocation(line: 108, column: 60, scope: !1905)
!1910 = !DILocation(line: 108, column: 69, scope: !1905)
!1911 = !DILocation(line: 108, column: 77, scope: !1905)
!1912 = !DILocation(line: 108, column: 35, scope: !1905)
!1913 = !DILocation(line: 108, column: 9, scope: !1905)
!1914 = !DILocation(line: 108, column: 27, scope: !1905)
!1915 = !DILocation(line: 108, column: 29, scope: !1905)
!1916 = !DILocation(line: 108, column: 33, scope: !1905)
!1917 = !DILocation(line: 107, column: 20, scope: !1905)
!1918 = !DILocation(line: 107, column: 7, scope: !1905)
!1919 = distinct !{!1919, !1906, !1920, !185}
!1920 = !DILocation(line: 108, column: 80, scope: !1902)
!1921 = !DILocation(line: 105, column: 9, scope: !1830)
!1922 = !DILocation(line: 96, column: 26, scope: !1828)
!1923 = !DILocation(line: 96, column: 5, scope: !1828)
!1924 = distinct !{!1924, !1822, !1925, !185}
!1925 = !DILocation(line: 109, column: 5, scope: !1823)
!1926 = !DILocation(line: 95, column: 22, scope: !1820)
!1927 = !DILocation(line: 95, column: 3, scope: !1820)
!1928 = distinct !{!1928, !1821, !1929, !185}
!1929 = !DILocation(line: 110, column: 3, scope: !1817)
!1930 = !DILocation(line: 128, column: 1, scope: !1809)
!1931 = !DILocalVariable(name: "r", arg: 1, scope: !945, file: !681, line: 139, type: !60)
!1932 = !DILocation(line: 0, scope: !945)
!1933 = !DILocalVariable(name: "a", arg: 2, scope: !945, file: !681, line: 139, type: !852)
!1934 = !DILocation(line: 142, column: 7, scope: !944)
!1935 = !DILocation(line: 142, scope: !944)
!1936 = !DILocation(line: 142, column: 12, scope: !982)
!1937 = !DILocation(line: 142, column: 3, scope: !944)
!1938 = !DILocation(line: 143, column: 21, scope: !982)
!1939 = !DILocation(line: 143, column: 19, scope: !982)
!1940 = !DILocation(line: 143, column: 40, scope: !982)
!1941 = !DILocation(line: 143, column: 5, scope: !982)
!1942 = !DILocation(line: 142, column: 22, scope: !982)
!1943 = !DILocation(line: 142, column: 3, scope: !982)
!1944 = distinct !{!1944, !1937, !1945, !185}
!1945 = !DILocation(line: 143, column: 49, scope: !944)
!1946 = !DILocation(line: 144, column: 1, scope: !945)
!1947 = !DILocation(line: 0, scope: !1047)
!1948 = !DILocation(line: 159, column: 7, scope: !1055)
!1949 = !DILocation(line: 159, scope: !1055)
!1950 = !DILocation(line: 159, column: 12, scope: !1058)
!1951 = !DILocation(line: 159, column: 3, scope: !1055)
!1952 = !DILocation(line: 160, column: 21, scope: !1058)
!1953 = !DILocation(line: 160, column: 35, scope: !1058)
!1954 = !DILocation(line: 160, column: 33, scope: !1058)
!1955 = !DILocation(line: 160, column: 5, scope: !1058)
!1956 = !DILocation(line: 159, column: 22, scope: !1058)
!1957 = !DILocation(line: 159, column: 3, scope: !1058)
!1958 = distinct !{!1958, !1951, !1959, !185}
!1959 = !DILocation(line: 160, column: 51, scope: !1055)
!1960 = !DILocation(line: 161, column: 1, scope: !1047)
!1961 = !DILocation(line: 0, scope: !682)
!1962 = !DILocation(line: 173, column: 7, scope: !680)
!1963 = !DILocation(line: 173, scope: !680)
!1964 = !DILocation(line: 173, column: 12, scope: !764)
!1965 = !DILocation(line: 173, column: 3, scope: !680)
!1966 = !DILocation(line: 174, column: 15, scope: !764)
!1967 = !DILocation(line: 0, scope: !769, inlinedAt: !1968)
!1968 = distinct !DILocation(line: 174, column: 5, scope: !764)
!1969 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !1968)
!1970 = !DILocation(line: 0, scope: !776, inlinedAt: !1971)
!1971 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !1968)
!1972 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1971)
!1973 = !DILocation(line: 326, scope: !781, inlinedAt: !1971)
!1974 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1971)
!1975 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1971)
!1976 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1971)
!1977 = !DILocation(line: 0, scope: !788, inlinedAt: !1978)
!1978 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1971)
!1979 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1978)
!1980 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1978)
!1981 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1978)
!1982 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1978)
!1983 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1978)
!1984 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1971)
!1985 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1971)
!1986 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1971)
!1987 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1971)
!1988 = distinct !{!1988, !1975, !1989, !185}
!1989 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1971)
!1990 = !DILocation(line: 173, column: 22, scope: !764)
!1991 = !DILocation(line: 173, column: 3, scope: !764)
!1992 = distinct !{!1992, !1965, !1993, !185}
!1993 = !DILocation(line: 174, column: 24, scope: !680)
!1994 = !DILocation(line: 175, column: 1, scope: !682)
!1995 = !DILocation(line: 0, scope: !1374)
!1996 = !DILocation(line: 188, column: 7, scope: !1379)
!1997 = !DILocation(line: 188, scope: !1379)
!1998 = !DILocation(line: 188, column: 12, scope: !1382)
!1999 = !DILocation(line: 188, column: 3, scope: !1379)
!2000 = !DILocation(line: 189, column: 25, scope: !1382)
!2001 = !DILocation(line: 0, scope: !1386, inlinedAt: !2002)
!2002 = distinct !DILocation(line: 189, column: 5, scope: !1382)
!2003 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !2002)
!2004 = !DILocation(line: 188, column: 22, scope: !1382)
!2005 = !DILocation(line: 188, column: 3, scope: !1382)
!2006 = distinct !{!2006, !1999, !2007, !185}
!2007 = !DILocation(line: 189, column: 34, scope: !1379)
!2008 = !DILocation(line: 190, column: 1, scope: !1374)
!2009 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !681, file: !681, line: 202, type: !2010, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!2010 = !DISubroutineType(types: !2011)
!2011 = !{null, !2012, !852, !852}
!2012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 32)
!2013 = !DILocalVariable(name: "r", arg: 1, scope: !2009, file: !681, line: 202, type: !2012)
!2014 = !DILocation(line: 0, scope: !2009)
!2015 = !DILocalVariable(name: "a", arg: 2, scope: !2009, file: !681, line: 202, type: !852)
!2016 = !DILocalVariable(name: "b", arg: 3, scope: !2009, file: !681, line: 202, type: !852)
!2017 = !DILocalVariable(name: "t", scope: !2009, file: !681, line: 205, type: !691)
!2018 = !DILocation(line: 205, column: 8, scope: !2009)
!2019 = !DILocation(line: 207, column: 3, scope: !2009)
!2020 = !DILocalVariable(name: "i", scope: !2009, file: !681, line: 204, type: !42)
!2021 = !DILocation(line: 208, column: 7, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2009, file: !681, line: 208, column: 3)
!2023 = !DILocation(line: 208, scope: !2022)
!2024 = !DILocation(line: 208, column: 12, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2022, file: !681, line: 208, column: 3)
!2026 = !DILocation(line: 208, column: 3, scope: !2022)
!2027 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !2028)
!2028 = distinct !DILocation(line: 213, column: 3, scope: !2009)
!2029 = !DILocation(line: 209, column: 34, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2025, file: !681, line: 208, column: 26)
!2031 = !DILocation(line: 209, column: 46, scope: !2030)
!2032 = !DILocation(line: 209, column: 5, scope: !2030)
!2033 = !DILocation(line: 0, scope: !909, inlinedAt: !2034)
!2034 = distinct !DILocation(line: 210, column: 5, scope: !2030)
!2035 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !2034)
!2036 = !DILocation(line: 342, scope: !920, inlinedAt: !2034)
!2037 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !2034)
!2038 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !2034)
!2039 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !2034)
!2040 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !2034)
!2041 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !2034)
!2042 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !2034)
!2043 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !2034)
!2044 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !2034)
!2045 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !2034)
!2046 = distinct !{!2046, !2038, !2047, !185}
!2047 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !2034)
!2048 = !DILocation(line: 208, column: 22, scope: !2025)
!2049 = !DILocation(line: 208, column: 3, scope: !2025)
!2050 = distinct !{!2050, !2026, !2051, !185}
!2051 = !DILocation(line: 211, column: 3, scope: !2022)
!2052 = !DILocation(line: 326, scope: !781, inlinedAt: !2028)
!2053 = !DILocation(line: 0, scope: !776, inlinedAt: !2028)
!2054 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !2028)
!2055 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !2028)
!2056 = !DILocation(line: 0, scope: !788, inlinedAt: !2057)
!2057 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !2028)
!2058 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2057)
!2059 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2057)
!2060 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2057)
!2061 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2057)
!2062 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2057)
!2063 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !2028)
!2064 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !2028)
!2065 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !2028)
!2066 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !2028)
!2067 = distinct !{!2067, !2027, !2068, !185}
!2068 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !2028)
!2069 = !DILocation(line: 214, column: 1, scope: !2009)
!2070 = !DILocalVariable(name: "r", arg: 1, scope: !903, file: !681, line: 225, type: !685)
!2071 = !DILocation(line: 0, scope: !903)
!2072 = !DILocation(line: 228, column: 7, scope: !902)
!2073 = !DILocation(line: 228, scope: !902)
!2074 = !DILocation(line: 228, column: 12, scope: !942)
!2075 = !DILocation(line: 228, column: 3, scope: !902)
!2076 = !DILocation(line: 229, column: 18, scope: !942)
!2077 = !DILocation(line: 0, scope: !776, inlinedAt: !2078)
!2078 = distinct !DILocation(line: 229, column: 5, scope: !942)
!2079 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !2078)
!2080 = !DILocation(line: 326, scope: !781, inlinedAt: !2078)
!2081 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !2078)
!2082 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !2078)
!2083 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !2078)
!2084 = !DILocation(line: 0, scope: !788, inlinedAt: !2085)
!2085 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !2078)
!2086 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2085)
!2087 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2085)
!2088 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2085)
!2089 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2085)
!2090 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2085)
!2091 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !2078)
!2092 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !2078)
!2093 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !2078)
!2094 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !2078)
!2095 = distinct !{!2095, !2082, !2096, !185}
!2096 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !2078)
!2097 = !DILocation(line: 228, column: 22, scope: !942)
!2098 = !DILocation(line: 228, column: 3, scope: !942)
!2099 = distinct !{!2099, !2075, !2100, !185}
!2100 = !DILocation(line: 229, column: 27, scope: !902)
!2101 = !DILocation(line: 230, column: 1, scope: !903)
!2102 = !DILocation(line: 0, scope: !849)
!2103 = !DILocation(line: 244, column: 7, scope: !848)
!2104 = !DILocation(line: 244, scope: !848)
!2105 = !DILocation(line: 244, column: 12, scope: !900)
!2106 = !DILocation(line: 244, column: 3, scope: !848)
!2107 = !DILocation(line: 245, column: 15, scope: !900)
!2108 = !DILocation(line: 245, column: 27, scope: !900)
!2109 = !DILocation(line: 245, column: 39, scope: !900)
!2110 = !DILocation(line: 0, scope: !909, inlinedAt: !2111)
!2111 = distinct !DILocation(line: 245, column: 5, scope: !900)
!2112 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !2111)
!2113 = !DILocation(line: 342, scope: !920, inlinedAt: !2111)
!2114 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !2111)
!2115 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !2111)
!2116 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !2111)
!2117 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !2111)
!2118 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !2111)
!2119 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !2111)
!2120 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !2111)
!2121 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !2111)
!2122 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !2111)
!2123 = distinct !{!2123, !2115, !2124, !185}
!2124 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !2111)
!2125 = !DILocation(line: 244, column: 22, scope: !900)
!2126 = !DILocation(line: 244, column: 3, scope: !900)
!2127 = distinct !{!2127, !2106, !2128, !185}
!2128 = !DILocation(line: 245, column: 48, scope: !848)
!2129 = !DILocation(line: 246, column: 1, scope: !849)
!2130 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !543, file: !543, line: 19, type: !1632, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2131 = !DILocalVariable(name: "r", arg: 1, scope: !2130, file: !543, line: 19, type: !60)
!2132 = !DILocation(line: 0, scope: !2130)
!2133 = !DILocalVariable(name: "a", arg: 2, scope: !2130, file: !543, line: 19, type: !912)
!2134 = !DILocalVariable(name: "t", scope: !2130, file: !543, line: 24, type: !2135)
!2135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !1690)
!2136 = !DILocation(line: 24, column: 11, scope: !2130)
!2137 = !DILocalVariable(name: "i", scope: !2130, file: !543, line: 21, type: !42)
!2138 = !DILocation(line: 48, column: 7, scope: !2139)
!2139 = distinct !DILexicalBlock(scope: !2130, file: !543, line: 48, column: 3)
!2140 = !DILocation(line: 48, scope: !2139)
!2141 = !DILocation(line: 48, column: 12, scope: !2142)
!2142 = distinct !DILexicalBlock(scope: !2139, file: !543, line: 48, column: 3)
!2143 = !DILocation(line: 48, column: 3, scope: !2139)
!2144 = !DILocation(line: 49, column: 5, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2146, file: !543, line: 49, column: 5)
!2146 = distinct !DILexicalBlock(scope: !2142, file: !543, line: 48, column: 28)
!2147 = !DILocation(line: 49, scope: !2145)
!2148 = !DILocalVariable(name: "j", scope: !2130, file: !543, line: 21, type: !42)
!2149 = !DILocation(line: 49, column: 14, scope: !2150)
!2150 = distinct !DILexicalBlock(scope: !2145, file: !543, line: 49, column: 5)
!2151 = !DILocation(line: 51, column: 23, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2150, file: !543, line: 49, column: 22)
!2153 = !DILocation(line: 51, column: 25, scope: !2152)
!2154 = !DILocation(line: 51, column: 12, scope: !2152)
!2155 = !DILocalVariable(name: "u", scope: !2130, file: !543, line: 22, type: !14)
!2156 = !DILocation(line: 52, column: 22, scope: !2152)
!2157 = !DILocation(line: 52, column: 9, scope: !2152)
!2158 = !DILocation(line: 54, column: 12, scope: !2152)
!2159 = !DILocalVariable(name: "d0", scope: !2130, file: !543, line: 23, type: !40)
!2160 = !DILocation(line: 56, column: 10, scope: !2152)
!2161 = !DILocation(line: 57, column: 10, scope: !2152)
!2162 = !DILocation(line: 58, column: 14, scope: !2152)
!2163 = !DILocation(line: 58, column: 7, scope: !2152)
!2164 = !DILocation(line: 58, column: 12, scope: !2152)
!2165 = !DILocation(line: 49, column: 18, scope: !2150)
!2166 = !DILocation(line: 49, column: 5, scope: !2150)
!2167 = distinct !{!2167, !2144, !2168, !185}
!2168 = !DILocation(line: 59, column: 5, scope: !2145)
!2169 = !DILocation(line: 61, column: 13, scope: !2146)
!2170 = !DILocation(line: 61, column: 27, scope: !2146)
!2171 = !DILocation(line: 61, column: 32, scope: !2146)
!2172 = !DILocation(line: 61, column: 24, scope: !2146)
!2173 = !DILocation(line: 61, column: 10, scope: !2146)
!2174 = !DILocation(line: 62, column: 18, scope: !2146)
!2175 = !DILocation(line: 62, column: 27, scope: !2146)
!2176 = !DILocation(line: 62, column: 32, scope: !2146)
!2177 = !DILocation(line: 62, column: 24, scope: !2146)
!2178 = !DILocation(line: 62, column: 41, scope: !2146)
!2179 = !DILocation(line: 62, column: 46, scope: !2146)
!2180 = !DILocation(line: 62, column: 38, scope: !2146)
!2181 = !DILocation(line: 62, column: 5, scope: !2146)
!2182 = !DILocation(line: 62, column: 10, scope: !2146)
!2183 = !DILocation(line: 63, column: 18, scope: !2146)
!2184 = !DILocation(line: 63, column: 27, scope: !2146)
!2185 = !DILocation(line: 63, column: 32, scope: !2146)
!2186 = !DILocation(line: 63, column: 24, scope: !2146)
!2187 = !DILocation(line: 63, column: 5, scope: !2146)
!2188 = !DILocation(line: 63, column: 10, scope: !2146)
!2189 = !DILocation(line: 64, column: 18, scope: !2146)
!2190 = !DILocation(line: 64, column: 27, scope: !2146)
!2191 = !DILocation(line: 64, column: 32, scope: !2146)
!2192 = !DILocation(line: 64, column: 24, scope: !2146)
!2193 = !DILocation(line: 64, column: 41, scope: !2146)
!2194 = !DILocation(line: 64, column: 46, scope: !2146)
!2195 = !DILocation(line: 64, column: 38, scope: !2146)
!2196 = !DILocation(line: 64, column: 5, scope: !2146)
!2197 = !DILocation(line: 64, column: 10, scope: !2146)
!2198 = !DILocation(line: 65, column: 18, scope: !2146)
!2199 = !DILocation(line: 65, column: 27, scope: !2146)
!2200 = !DILocation(line: 65, column: 32, scope: !2146)
!2201 = !DILocation(line: 65, column: 24, scope: !2146)
!2202 = !DILocation(line: 65, column: 5, scope: !2146)
!2203 = !DILocation(line: 65, column: 10, scope: !2146)
!2204 = !DILocation(line: 66, column: 7, scope: !2146)
!2205 = !DILocation(line: 48, column: 24, scope: !2142)
!2206 = !DILocation(line: 48, column: 3, scope: !2142)
!2207 = distinct !{!2207, !2143, !2208, !185}
!2208 = !DILocation(line: 67, column: 3, scope: !2139)
!2209 = !DILocation(line: 71, column: 1, scope: !2130)
!2210 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !543, file: !543, line: 83, type: !1072, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2211 = !DILocalVariable(name: "r", arg: 1, scope: !2210, file: !543, line: 83, type: !546)
!2212 = !DILocation(line: 0, scope: !2210)
!2213 = !DILocalVariable(name: "a", arg: 2, scope: !2210, file: !543, line: 83, type: !64)
!2214 = !DILocalVariable(name: "t", scope: !2210, file: !543, line: 95, type: !2135)
!2215 = !DILocation(line: 95, column: 11, scope: !2210)
!2216 = !DILocalVariable(name: "i", scope: !2210, file: !543, line: 85, type: !42)
!2217 = !DILocation(line: 96, column: 7, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2210, file: !543, line: 96, column: 3)
!2219 = !DILocation(line: 96, scope: !2218)
!2220 = !DILocation(line: 96, column: 12, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2218, file: !543, line: 96, column: 3)
!2222 = !DILocation(line: 96, column: 3, scope: !2218)
!2223 = !DILocation(line: 97, column: 13, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2221, file: !543, line: 96, column: 28)
!2225 = !DILocation(line: 97, column: 10, scope: !2224)
!2226 = !DILocation(line: 98, column: 27, scope: !2224)
!2227 = !DILocation(line: 98, column: 24, scope: !2224)
!2228 = !DILocation(line: 98, column: 5, scope: !2224)
!2229 = !DILocation(line: 98, column: 10, scope: !2224)
!2230 = !DILocation(line: 99, column: 18, scope: !2224)
!2231 = !DILocation(line: 99, column: 5, scope: !2224)
!2232 = !DILocation(line: 99, column: 10, scope: !2224)
!2233 = !DILocation(line: 100, column: 13, scope: !2224)
!2234 = !DILocation(line: 100, column: 27, scope: !2224)
!2235 = !DILocation(line: 100, column: 24, scope: !2224)
!2236 = !DILocation(line: 100, column: 5, scope: !2224)
!2237 = !DILocation(line: 100, column: 10, scope: !2224)
!2238 = !DILocation(line: 101, column: 27, scope: !2224)
!2239 = !DILocation(line: 101, column: 24, scope: !2224)
!2240 = !DILocation(line: 101, column: 5, scope: !2224)
!2241 = !DILocation(line: 101, column: 10, scope: !2224)
!2242 = !DILocation(line: 102, column: 18, scope: !2224)
!2243 = !DILocation(line: 102, column: 5, scope: !2224)
!2244 = !DILocation(line: 102, column: 10, scope: !2224)
!2245 = !DILocation(line: 103, column: 13, scope: !2224)
!2246 = !DILocation(line: 103, column: 27, scope: !2224)
!2247 = !DILocation(line: 103, column: 24, scope: !2224)
!2248 = !DILocation(line: 103, column: 5, scope: !2224)
!2249 = !DILocation(line: 103, column: 10, scope: !2224)
!2250 = !DILocation(line: 104, column: 18, scope: !2224)
!2251 = !DILocation(line: 104, column: 5, scope: !2224)
!2252 = !DILocation(line: 104, column: 10, scope: !2224)
!2253 = !DILocalVariable(name: "j", scope: !2210, file: !543, line: 94, type: !42)
!2254 = !DILocation(line: 107, column: 9, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2224, file: !543, line: 107, column: 5)
!2256 = !DILocation(line: 107, scope: !2255)
!2257 = !DILocation(line: 107, column: 14, scope: !2258)
!2258 = distinct !DILexicalBlock(scope: !2255, file: !543, line: 107, column: 5)
!2259 = !DILocation(line: 107, column: 5, scope: !2255)
!2260 = !DILocation(line: 108, column: 38, scope: !2258)
!2261 = !DILocation(line: 108, column: 43, scope: !2258)
!2262 = !DILocation(line: 108, column: 48, scope: !2258)
!2263 = !DILocation(line: 108, column: 57, scope: !2258)
!2264 = !DILocation(line: 108, column: 63, scope: !2258)
!2265 = !DILocation(line: 108, column: 26, scope: !2258)
!2266 = !DILocation(line: 108, column: 18, scope: !2258)
!2267 = !DILocation(line: 108, column: 20, scope: !2258)
!2268 = !DILocation(line: 108, column: 7, scope: !2258)
!2269 = !DILocation(line: 108, column: 24, scope: !2258)
!2270 = !DILocation(line: 107, column: 18, scope: !2258)
!2271 = !DILocation(line: 107, column: 5, scope: !2258)
!2272 = distinct !{!2272, !2259, !2273, !185}
!2273 = !DILocation(line: 108, column: 66, scope: !2255)
!2274 = !DILocation(line: 105, column: 7, scope: !2224)
!2275 = !DILocation(line: 96, column: 24, scope: !2221)
!2276 = !DILocation(line: 96, column: 3, scope: !2221)
!2277 = distinct !{!2277, !2222, !2278, !185}
!2278 = !DILocation(line: 109, column: 3, scope: !2218)
!2279 = !DILocation(line: 113, column: 1, scope: !2210)
!2280 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !543, file: !543, line: 124, type: !1632, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2281 = !DILocalVariable(name: "r", arg: 1, scope: !2280, file: !543, line: 124, type: !60)
!2282 = !DILocation(line: 0, scope: !2280)
!2283 = !DILocalVariable(name: "a", arg: 2, scope: !2280, file: !543, line: 124, type: !912)
!2284 = !DILocalVariable(name: "i", scope: !2280, file: !543, line: 126, type: !42)
!2285 = !DILocation(line: 129, column: 7, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2280, file: !543, line: 129, column: 3)
!2287 = !DILocation(line: 129, scope: !2286)
!2288 = !DILocation(line: 129, column: 12, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2286, file: !543, line: 129, column: 3)
!2290 = !DILocation(line: 129, column: 3, scope: !2286)
!2291 = !DILocation(line: 131, column: 22, scope: !2292)
!2292 = distinct !DILexicalBlock(scope: !2289, file: !543, line: 129, column: 28)
!2293 = !DILocation(line: 131, column: 11, scope: !2292)
!2294 = !DILocalVariable(name: "t0", scope: !2280, file: !543, line: 127, type: !35)
!2295 = !DILocation(line: 132, column: 31, scope: !2292)
!2296 = !DILocation(line: 132, column: 8, scope: !2292)
!2297 = !DILocation(line: 133, column: 21, scope: !2292)
!2298 = !DILocation(line: 133, column: 23, scope: !2292)
!2299 = !DILocation(line: 133, column: 10, scope: !2292)
!2300 = !DILocalVariable(name: "t1", scope: !2280, file: !543, line: 127, type: !35)
!2301 = !DILocation(line: 134, column: 31, scope: !2292)
!2302 = !DILocation(line: 134, column: 8, scope: !2292)
!2303 = !DILocation(line: 135, column: 16, scope: !2292)
!2304 = !DILocation(line: 135, column: 8, scope: !2292)
!2305 = !DILocation(line: 135, column: 5, scope: !2292)
!2306 = !DILocation(line: 135, column: 14, scope: !2292)
!2307 = !DILocation(line: 136, column: 20, scope: !2292)
!2308 = !DILocation(line: 136, column: 29, scope: !2292)
!2309 = !DILocation(line: 136, column: 32, scope: !2292)
!2310 = !DILocation(line: 136, column: 26, scope: !2292)
!2311 = !DILocation(line: 136, column: 8, scope: !2292)
!2312 = !DILocation(line: 136, column: 5, scope: !2292)
!2313 = !DILocation(line: 136, column: 14, scope: !2292)
!2314 = !DILocation(line: 137, column: 20, scope: !2292)
!2315 = !DILocation(line: 137, column: 16, scope: !2292)
!2316 = !DILocation(line: 137, column: 8, scope: !2292)
!2317 = !DILocation(line: 137, column: 5, scope: !2292)
!2318 = !DILocation(line: 137, column: 14, scope: !2292)
!2319 = !DILocation(line: 129, column: 24, scope: !2289)
!2320 = !DILocation(line: 129, column: 3, scope: !2289)
!2321 = distinct !{!2321, !2290, !2322, !185}
!2322 = !DILocation(line: 138, column: 3, scope: !2286)
!2323 = !DILocation(line: 139, column: 1, scope: !2280)
!2324 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !543, file: !543, line: 151, type: !1072, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2325 = !DILocalVariable(name: "r", arg: 1, scope: !2324, file: !543, line: 151, type: !546)
!2326 = !DILocation(line: 0, scope: !2324)
!2327 = !DILocalVariable(name: "a", arg: 2, scope: !2324, file: !543, line: 151, type: !64)
!2328 = !DILocalVariable(name: "i", scope: !2324, file: !543, line: 153, type: !42)
!2329 = !DILocation(line: 154, column: 7, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2324, file: !543, line: 154, column: 3)
!2331 = !DILocation(line: 154, scope: !2330)
!2332 = !DILocation(line: 154, column: 12, scope: !2333)
!2333 = distinct !DILexicalBlock(scope: !2330, file: !543, line: 154, column: 3)
!2334 = !DILocation(line: 154, column: 3, scope: !2330)
!2335 = !DILocation(line: 155, column: 29, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2333, file: !543, line: 154, column: 28)
!2337 = !DILocation(line: 155, column: 26, scope: !2336)
!2338 = !DILocation(line: 155, column: 57, scope: !2336)
!2339 = !DILocation(line: 155, column: 54, scope: !2336)
!2340 = !DILocation(line: 155, column: 44, scope: !2336)
!2341 = !DILocation(line: 155, column: 63, scope: !2336)
!2342 = !DILocation(line: 155, column: 70, scope: !2336)
!2343 = !DILocation(line: 155, column: 16, scope: !2336)
!2344 = !DILocation(line: 155, column: 5, scope: !2336)
!2345 = !DILocation(line: 155, column: 22, scope: !2336)
!2346 = !DILocation(line: 156, column: 29, scope: !2336)
!2347 = !DILocation(line: 156, column: 26, scope: !2336)
!2348 = !DILocation(line: 156, column: 35, scope: !2336)
!2349 = !DILocation(line: 156, column: 57, scope: !2336)
!2350 = !DILocation(line: 156, column: 54, scope: !2336)
!2351 = !DILocation(line: 156, column: 44, scope: !2336)
!2352 = !DILocation(line: 156, column: 63, scope: !2336)
!2353 = !DILocation(line: 156, column: 41, scope: !2336)
!2354 = !DILocation(line: 156, column: 16, scope: !2336)
!2355 = !DILocation(line: 156, column: 18, scope: !2336)
!2356 = !DILocation(line: 156, column: 5, scope: !2336)
!2357 = !DILocation(line: 156, column: 22, scope: !2336)
!2358 = !DILocation(line: 154, column: 24, scope: !2333)
!2359 = !DILocation(line: 154, column: 3, scope: !2333)
!2360 = distinct !{!2360, !2334, !2361, !185}
!2361 = !DILocation(line: 157, column: 3, scope: !2330)
!2362 = !DILocation(line: 158, column: 1, scope: !2324)
!2363 = !DILocation(line: 0, scope: !1071)
!2364 = !DILocation(line: 176, column: 7, scope: !1079)
!2365 = !DILocation(line: 176, scope: !1079)
!2366 = !DILocation(line: 176, column: 12, scope: !1082)
!2367 = !DILocation(line: 176, column: 3, scope: !1079)
!2368 = !DILocation(line: 177, column: 5, scope: !1085)
!2369 = !DILocation(line: 177, scope: !1085)
!2370 = !DILocation(line: 177, column: 14, scope: !1090)
!2371 = !DILocation(line: 178, column: 18, scope: !1092)
!2372 = !DILocation(line: 178, column: 20, scope: !1092)
!2373 = !DILocation(line: 178, column: 7, scope: !1092)
!2374 = !DILocation(line: 178, column: 24, scope: !1092)
!2375 = !DILocation(line: 179, column: 27, scope: !1092)
!2376 = !DILocation(line: 179, column: 31, scope: !1092)
!2377 = !DILocation(line: 179, column: 53, scope: !1092)
!2378 = !DILocation(line: 0, scope: !1100, inlinedAt: !2379)
!2379 = distinct !DILocation(line: 179, column: 7, scope: !1092)
!2380 = !DILocation(line: 74, column: 15, scope: !1100, inlinedAt: !2379)
!2381 = !DILocation(line: 74, column: 11, scope: !1100, inlinedAt: !2379)
!2382 = !DILocation(line: 74, column: 6, scope: !1100, inlinedAt: !2379)
!2383 = !DILocation(line: 177, column: 18, scope: !1090)
!2384 = !DILocation(line: 177, column: 5, scope: !1090)
!2385 = distinct !{!2385, !2368, !2386, !185}
!2386 = !DILocation(line: 180, column: 5, scope: !1085)
!2387 = !DILocation(line: 176, column: 24, scope: !1082)
!2388 = !DILocation(line: 176, column: 3, scope: !1082)
!2389 = distinct !{!2389, !2367, !2390, !185}
!2390 = !DILocation(line: 181, column: 3, scope: !1079)
!2391 = !DILocation(line: 182, column: 1, scope: !1071)
!2392 = !DILocalVariable(name: "msg", arg: 1, scope: !1631, file: !543, line: 192, type: !60)
!2393 = !DILocation(line: 0, scope: !1631)
!2394 = !DILocalVariable(name: "a", arg: 2, scope: !1631, file: !543, line: 192, type: !912)
!2395 = !DILocation(line: 197, column: 7, scope: !1630)
!2396 = !DILocation(line: 197, scope: !1630)
!2397 = !DILocation(line: 197, column: 12, scope: !1653)
!2398 = !DILocation(line: 197, column: 3, scope: !1630)
!2399 = !DILocation(line: 198, column: 5, scope: !1655)
!2400 = !DILocation(line: 198, column: 12, scope: !1655)
!2401 = !DILocation(line: 199, column: 9, scope: !1659)
!2402 = !DILocation(line: 199, scope: !1659)
!2403 = !DILocation(line: 199, column: 14, scope: !1662)
!2404 = !DILocation(line: 199, column: 5, scope: !1659)
!2405 = !DILocation(line: 200, column: 23, scope: !1665)
!2406 = !DILocation(line: 200, column: 25, scope: !1665)
!2407 = !DILocation(line: 200, column: 12, scope: !1665)
!2408 = !DILocation(line: 205, column: 9, scope: !1665)
!2409 = !DILocation(line: 206, column: 9, scope: !1665)
!2410 = !DILocation(line: 207, column: 9, scope: !1665)
!2411 = !DILocation(line: 208, column: 19, scope: !1665)
!2412 = !DILocation(line: 208, column: 7, scope: !1665)
!2413 = !DILocation(line: 208, column: 14, scope: !1665)
!2414 = !DILocation(line: 199, column: 18, scope: !1662)
!2415 = !DILocation(line: 199, column: 5, scope: !1662)
!2416 = distinct !{!2416, !2404, !2417, !185}
!2417 = !DILocation(line: 209, column: 5, scope: !1659)
!2418 = !DILocation(line: 197, column: 24, scope: !1653)
!2419 = !DILocation(line: 197, column: 3, scope: !1653)
!2420 = distinct !{!2420, !2398, !2421, !185}
!2421 = !DILocation(line: 210, column: 3, scope: !1630)
!2422 = !DILocation(line: 211, column: 1, scope: !1631)
!2423 = !DILocation(line: 0, scope: !542)
!2424 = !DILocation(line: 227, column: 11, scope: !542)
!2425 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !2426)
!2426 = distinct !DILocation(line: 228, column: 3, scope: !542)
!2427 = !DILocation(line: 0, scope: !560, inlinedAt: !2426)
!2428 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !2426)
!2429 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !2426)
!2430 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !2426)
!2431 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !2432)
!2432 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !2433)
!2433 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !2426)
!2434 = !DILocation(line: 0, scope: !579, inlinedAt: !2433)
!2435 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !2433)
!2436 = !DILocation(line: 0, scope: !577, inlinedAt: !2432)
!2437 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !2432)
!2438 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !2432)
!2439 = !DILocation(line: 0, scope: !598, inlinedAt: !2440)
!2440 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !2433)
!2441 = !DILocation(line: 0, scope: !349, inlinedAt: !2442)
!2442 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !2440)
!2443 = !DILocation(line: 0, scope: !606, inlinedAt: !2444)
!2444 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !2433)
!2445 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !2444)
!2446 = !DILocation(line: 0, scope: !613, inlinedAt: !2447)
!2447 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !2444)
!2448 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !2447)
!2449 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !2447)
!2450 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !2447)
!2451 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !2447)
!2452 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !2447)
!2453 = !DILocation(line: 439, scope: !631, inlinedAt: !2447)
!2454 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !2447)
!2455 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !2447)
!2456 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !2447)
!2457 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !2447)
!2458 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !2447)
!2459 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !2447)
!2460 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !2447)
!2461 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !2447)
!2462 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !2447)
!2463 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !2447)
!2464 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !2447)
!2465 = distinct !{!2465, !2456, !2466, !185}
!2466 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !2447)
!2467 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !2447)
!2468 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !2447)
!2469 = distinct !{!2469, !2448, !2470, !185}
!2470 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !2447)
!2471 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !2444)
!2472 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !2444)
!2473 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !2433)
!2474 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !2426)
!2475 = !DILocation(line: 0, scope: !657, inlinedAt: !2476)
!2476 = distinct !DILocation(line: 229, column: 3, scope: !542)
!2477 = !DILocation(line: 113, column: 3, scope: !657, inlinedAt: !2476)
!2478 = !DILocation(line: 230, column: 1, scope: !542)
!2479 = !DILocation(line: 0, scope: !1196)
!2480 = !DILocation(line: 246, column: 11, scope: !1196)
!2481 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !2482)
!2482 = distinct !DILocation(line: 247, column: 3, scope: !1196)
!2483 = !DILocation(line: 0, scope: !560, inlinedAt: !2482)
!2484 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !2482)
!2485 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !2482)
!2486 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !2482)
!2487 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !2488)
!2488 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !2489)
!2489 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !2482)
!2490 = !DILocation(line: 0, scope: !579, inlinedAt: !2489)
!2491 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !2489)
!2492 = !DILocation(line: 0, scope: !577, inlinedAt: !2488)
!2493 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !2488)
!2494 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !2488)
!2495 = !DILocation(line: 0, scope: !598, inlinedAt: !2496)
!2496 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !2489)
!2497 = !DILocation(line: 0, scope: !349, inlinedAt: !2498)
!2498 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !2496)
!2499 = !DILocation(line: 0, scope: !606, inlinedAt: !2500)
!2500 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !2489)
!2501 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !2500)
!2502 = !DILocation(line: 0, scope: !613, inlinedAt: !2503)
!2503 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !2500)
!2504 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !2503)
!2505 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !2503)
!2506 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !2503)
!2507 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !2503)
!2508 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !2503)
!2509 = !DILocation(line: 439, scope: !631, inlinedAt: !2503)
!2510 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !2503)
!2511 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !2503)
!2512 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !2503)
!2513 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !2503)
!2514 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !2503)
!2515 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !2503)
!2516 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !2503)
!2517 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !2503)
!2518 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !2503)
!2519 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !2503)
!2520 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !2503)
!2521 = distinct !{!2521, !2512, !2522, !185}
!2522 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !2503)
!2523 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !2503)
!2524 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !2503)
!2525 = distinct !{!2525, !2504, !2526, !185}
!2526 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !2503)
!2527 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !2500)
!2528 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !2500)
!2529 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !2489)
!2530 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !2482)
!2531 = !DILocation(line: 0, scope: !1256, inlinedAt: !2532)
!2532 = distinct !DILocation(line: 248, column: 3, scope: !1196)
!2533 = !DILocation(line: 124, column: 3, scope: !1256, inlinedAt: !2532)
!2534 = !DILocation(line: 249, column: 1, scope: !1196)
!2535 = !DILocation(line: 0, scope: !769)
!2536 = !DILocation(line: 263, column: 3, scope: !769)
!2537 = !DILocation(line: 0, scope: !776, inlinedAt: !2538)
!2538 = distinct !DILocation(line: 264, column: 3, scope: !769)
!2539 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !2538)
!2540 = !DILocation(line: 326, scope: !781, inlinedAt: !2538)
!2541 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !2538)
!2542 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !2538)
!2543 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !2538)
!2544 = !DILocation(line: 0, scope: !788, inlinedAt: !2545)
!2545 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !2538)
!2546 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2545)
!2547 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2545)
!2548 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2545)
!2549 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2545)
!2550 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2545)
!2551 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !2538)
!2552 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !2538)
!2553 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !2538)
!2554 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !2538)
!2555 = distinct !{!2555, !2542, !2556, !185}
!2556 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !2538)
!2557 = !DILocation(line: 265, column: 1, scope: !769)
!2558 = !DILocation(line: 0, scope: !776)
!2559 = !DILocation(line: 326, column: 7, scope: !781)
!2560 = !DILocation(line: 326, scope: !781)
!2561 = !DILocation(line: 326, column: 12, scope: !784)
!2562 = !DILocation(line: 326, column: 3, scope: !781)
!2563 = !DILocation(line: 327, column: 35, scope: !784)
!2564 = !DILocation(line: 0, scope: !788, inlinedAt: !2565)
!2565 = distinct !DILocation(line: 327, column: 20, scope: !784)
!2566 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2565)
!2567 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2565)
!2568 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2565)
!2569 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2565)
!2570 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2565)
!2571 = !DILocation(line: 327, column: 5, scope: !784)
!2572 = !DILocation(line: 327, column: 18, scope: !784)
!2573 = !DILocation(line: 326, column: 22, scope: !784)
!2574 = !DILocation(line: 326, column: 3, scope: !784)
!2575 = distinct !{!2575, !2562, !2576, !185}
!2576 = !DILocation(line: 327, column: 47, scope: !781)
!2577 = !DILocation(line: 328, column: 1, scope: !776)
!2578 = !DILocation(line: 0, scope: !1386)
!2579 = !DILocation(line: 278, column: 3, scope: !1386)
!2580 = !DILocation(line: 279, column: 1, scope: !1386)
!2581 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !543, file: !543, line: 290, type: !910, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2582 = !DILocalVariable(name: "r", arg: 1, scope: !2581, file: !543, line: 290, type: !546)
!2583 = !DILocation(line: 0, scope: !2581)
!2584 = !DILocalVariable(name: "a", arg: 2, scope: !2581, file: !543, line: 290, type: !912)
!2585 = !DILocalVariable(name: "b", arg: 3, scope: !2581, file: !543, line: 290, type: !912)
!2586 = !DILocalVariable(name: "i", scope: !2581, file: !543, line: 292, type: !42)
!2587 = !DILocation(line: 293, column: 7, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2581, file: !543, line: 293, column: 3)
!2589 = !DILocation(line: 293, scope: !2588)
!2590 = !DILocation(line: 293, column: 12, scope: !2591)
!2591 = distinct !DILexicalBlock(scope: !2588, file: !543, line: 293, column: 3)
!2592 = !DILocation(line: 293, column: 3, scope: !2588)
!2593 = !DILocation(line: 294, column: 25, scope: !2594)
!2594 = distinct !DILexicalBlock(scope: !2591, file: !543, line: 293, column: 28)
!2595 = !DILocation(line: 294, column: 14, scope: !2594)
!2596 = !DILocation(line: 294, column: 42, scope: !2594)
!2597 = !DILocation(line: 294, column: 31, scope: !2594)
!2598 = !DILocation(line: 294, column: 59, scope: !2594)
!2599 = !DILocation(line: 294, column: 48, scope: !2594)
!2600 = !DILocation(line: 294, column: 72, scope: !2594)
!2601 = !DILocation(line: 294, column: 64, scope: !2594)
!2602 = !DILocation(line: 294, column: 5, scope: !2594)
!2603 = !DILocation(line: 295, column: 25, scope: !2594)
!2604 = !DILocation(line: 295, column: 27, scope: !2594)
!2605 = !DILocation(line: 295, column: 14, scope: !2594)
!2606 = !DILocation(line: 295, column: 44, scope: !2594)
!2607 = !DILocation(line: 295, column: 46, scope: !2594)
!2608 = !DILocation(line: 295, column: 33, scope: !2594)
!2609 = !DILocation(line: 295, column: 63, scope: !2594)
!2610 = !DILocation(line: 295, column: 65, scope: !2594)
!2611 = !DILocation(line: 295, column: 52, scope: !2594)
!2612 = !DILocation(line: 295, column: 79, scope: !2594)
!2613 = !DILocation(line: 295, column: 71, scope: !2594)
!2614 = !DILocation(line: 295, column: 70, scope: !2594)
!2615 = !DILocation(line: 295, column: 5, scope: !2594)
!2616 = !DILocation(line: 293, column: 24, scope: !2591)
!2617 = !DILocation(line: 293, column: 3, scope: !2591)
!2618 = distinct !{!2618, !2592, !2619, !185}
!2619 = !DILocation(line: 296, column: 3, scope: !2588)
!2620 = !DILocation(line: 297, column: 1, scope: !2581)
!2621 = !DILocation(line: 0, scope: !861)
!2622 = !DILocation(line: 311, column: 7, scope: !867)
!2623 = !DILocation(line: 311, scope: !867)
!2624 = !DILocation(line: 311, column: 12, scope: !870)
!2625 = !DILocation(line: 311, column: 3, scope: !867)
!2626 = !DILocation(line: 312, column: 47, scope: !870)
!2627 = !DILocation(line: 312, column: 38, scope: !870)
!2628 = !DILocation(line: 312, column: 59, scope: !870)
!2629 = !DILocation(line: 0, scope: !876, inlinedAt: !2630)
!2630 = distinct !DILocation(line: 312, column: 20, scope: !870)
!2631 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2630)
!2632 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2630)
!2633 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2630)
!2634 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2630)
!2635 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2630)
!2636 = !DILocation(line: 312, column: 5, scope: !870)
!2637 = !DILocation(line: 312, column: 18, scope: !870)
!2638 = !DILocation(line: 311, column: 22, scope: !870)
!2639 = !DILocation(line: 311, column: 3, scope: !870)
!2640 = distinct !{!2640, !2625, !2641, !185}
!2641 = !DILocation(line: 312, column: 61, scope: !867)
!2642 = !DILocation(line: 313, column: 1, scope: !861)
!2643 = !DILocation(line: 0, scope: !909)
!2644 = !DILocation(line: 342, column: 7, scope: !920)
!2645 = !DILocation(line: 342, scope: !920)
!2646 = !DILocation(line: 342, column: 12, scope: !923)
!2647 = !DILocation(line: 342, column: 3, scope: !920)
!2648 = !DILocation(line: 343, column: 20, scope: !923)
!2649 = !DILocation(line: 343, column: 35, scope: !923)
!2650 = !DILocation(line: 343, column: 33, scope: !923)
!2651 = !DILocation(line: 343, column: 5, scope: !923)
!2652 = !DILocation(line: 343, column: 18, scope: !923)
!2653 = !DILocation(line: 342, column: 22, scope: !923)
!2654 = !DILocation(line: 342, column: 3, scope: !923)
!2655 = distinct !{!2655, !2647, !2656, !185}
!2656 = !DILocation(line: 343, column: 46, scope: !920)
!2657 = !DILocation(line: 344, column: 1, scope: !909)
!2658 = !DILocation(line: 0, scope: !1603)
!2659 = !DILocation(line: 358, column: 7, scope: !1610)
!2660 = !DILocation(line: 358, scope: !1610)
!2661 = !DILocation(line: 358, column: 12, scope: !1613)
!2662 = !DILocation(line: 358, column: 3, scope: !1610)
!2663 = !DILocation(line: 359, column: 20, scope: !1613)
!2664 = !DILocation(line: 359, column: 35, scope: !1613)
!2665 = !DILocation(line: 359, column: 33, scope: !1613)
!2666 = !DILocation(line: 359, column: 5, scope: !1613)
!2667 = !DILocation(line: 359, column: 18, scope: !1613)
!2668 = !DILocation(line: 358, column: 22, scope: !1613)
!2669 = !DILocation(line: 358, column: 3, scope: !1613)
!2670 = distinct !{!2670, !2662, !2671, !185}
!2671 = !DILocation(line: 359, column: 46, scope: !1610)
!2672 = !DILocation(line: 360, column: 1, scope: !1603)
!2673 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !11, file: !11, line: 80, type: !2674, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2674 = !DISubroutineType(types: !2675)
!2675 = !{null, !464}
!2676 = !DILocalVariable(name: "r", arg: 1, scope: !2673, file: !11, line: 80, type: !464)
!2677 = !DILocation(line: 0, scope: !2673)
!2678 = !DILocalVariable(name: "k", scope: !2673, file: !11, line: 81, type: !42)
!2679 = !DILocalVariable(name: "len", scope: !2673, file: !11, line: 81, type: !42)
!2680 = !DILocation(line: 85, column: 7, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2673, file: !11, line: 85, column: 3)
!2682 = !DILocation(line: 85, scope: !2681)
!2683 = !DILocation(line: 84, column: 5, scope: !2673)
!2684 = !DILocation(line: 85, column: 22, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2681, file: !11, line: 85, column: 3)
!2686 = !DILocation(line: 85, column: 3, scope: !2681)
!2687 = !DILocation(line: 86, column: 5, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2689, file: !11, line: 86, column: 5)
!2689 = distinct !DILexicalBlock(scope: !2685, file: !11, line: 85, column: 39)
!2690 = !DILocation(line: 86, scope: !2688)
!2691 = !DILocalVariable(name: "start", scope: !2673, file: !11, line: 81, type: !42)
!2692 = !DILocation(line: 86, column: 26, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2688, file: !11, line: 86, column: 5)
!2694 = !DILocation(line: 87, column: 14, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2693, file: !11, line: 86, column: 50)
!2696 = !DILocalVariable(name: "zeta", scope: !2673, file: !11, line: 82, type: !14)
!2697 = !DILocalVariable(name: "j", scope: !2673, file: !11, line: 81, type: !42)
!2698 = !DILocation(line: 88, column: 11, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2695, file: !11, line: 88, column: 7)
!2700 = !DILocation(line: 88, scope: !2699)
!2701 = !DILocation(line: 88, column: 32, scope: !2702)
!2702 = distinct !DILexicalBlock(scope: !2699, file: !11, line: 88, column: 7)
!2703 = !DILocation(line: 88, column: 24, scope: !2702)
!2704 = !DILocation(line: 88, column: 7, scope: !2699)
!2705 = !DILocation(line: 89, column: 25, scope: !2706)
!2706 = distinct !DILexicalBlock(scope: !2702, file: !11, line: 88, column: 44)
!2707 = !DILocalVariable(name: "a", arg: 1, scope: !2708, file: !11, line: 68, type: !14)
!2708 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !2709, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2709 = !DISubroutineType(types: !2710)
!2710 = !{!14, !14, !14}
!2711 = !DILocation(line: 0, scope: !2708, inlinedAt: !2712)
!2712 = distinct !DILocation(line: 89, column: 13, scope: !2706)
!2713 = !DILocalVariable(name: "b", arg: 2, scope: !2708, file: !11, line: 68, type: !14)
!2714 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2712)
!2715 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2712)
!2716 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2712)
!2717 = !DILocation(line: 0, scope: !876, inlinedAt: !2718)
!2718 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2712)
!2719 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2718)
!2720 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2718)
!2721 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2718)
!2722 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2718)
!2723 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2718)
!2724 = !DILocalVariable(name: "t", scope: !2673, file: !11, line: 82, type: !14)
!2725 = !DILocation(line: 90, column: 22, scope: !2706)
!2726 = !DILocation(line: 90, column: 27, scope: !2706)
!2727 = !DILocation(line: 90, column: 9, scope: !2706)
!2728 = !DILocation(line: 90, column: 20, scope: !2706)
!2729 = !DILocation(line: 91, column: 16, scope: !2706)
!2730 = !DILocation(line: 91, column: 21, scope: !2706)
!2731 = !DILocation(line: 91, column: 9, scope: !2706)
!2732 = !DILocation(line: 91, column: 14, scope: !2706)
!2733 = !DILocation(line: 88, column: 40, scope: !2702)
!2734 = !DILocation(line: 88, column: 7, scope: !2702)
!2735 = distinct !{!2735, !2704, !2736, !185}
!2736 = !DILocation(line: 92, column: 7, scope: !2699)
!2737 = !DILocation(line: 87, column: 21, scope: !2695)
!2738 = !DILocation(line: 86, column: 43, scope: !2693)
!2739 = !DILocation(line: 86, column: 5, scope: !2693)
!2740 = distinct !{!2740, !2687, !2741, !185}
!2741 = !DILocation(line: 93, column: 5, scope: !2688)
!2742 = !DILocation(line: 85, column: 32, scope: !2685)
!2743 = !DILocation(line: 85, column: 3, scope: !2685)
!2744 = distinct !{!2744, !2686, !2745, !185}
!2745 = !DILocation(line: 94, column: 3, scope: !2681)
!2746 = !DILocation(line: 95, column: 1, scope: !2673)
!2747 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !11, file: !11, line: 106, type: !2674, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2748 = !DILocalVariable(name: "r", arg: 1, scope: !2747, file: !11, line: 106, type: !464)
!2749 = !DILocation(line: 0, scope: !2747)
!2750 = !DILocalVariable(name: "f", scope: !2747, file: !11, line: 109, type: !13)
!2751 = !DILocalVariable(name: "k", scope: !2747, file: !11, line: 107, type: !42)
!2752 = !DILocalVariable(name: "len", scope: !2747, file: !11, line: 107, type: !42)
!2753 = !DILocation(line: 112, column: 7, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2747, file: !11, line: 112, column: 3)
!2755 = !DILocation(line: 112, scope: !2754)
!2756 = !DILocation(line: 111, column: 5, scope: !2747)
!2757 = !DILocation(line: 112, column: 20, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2754, file: !11, line: 112, column: 3)
!2759 = !DILocation(line: 112, column: 3, scope: !2754)
!2760 = !DILocation(line: 113, column: 5, scope: !2761)
!2761 = distinct !DILexicalBlock(scope: !2762, file: !11, line: 113, column: 5)
!2762 = distinct !DILexicalBlock(scope: !2758, file: !11, line: 112, column: 39)
!2763 = !DILocation(line: 124, column: 3, scope: !2764)
!2764 = distinct !DILexicalBlock(scope: !2747, file: !11, line: 124, column: 3)
!2765 = !DILocation(line: 113, scope: !2761)
!2766 = !DILocalVariable(name: "start", scope: !2747, file: !11, line: 107, type: !42)
!2767 = !DILocation(line: 113, column: 26, scope: !2768)
!2768 = distinct !DILexicalBlock(scope: !2761, file: !11, line: 113, column: 5)
!2769 = !DILocation(line: 114, column: 14, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2768, file: !11, line: 113, column: 50)
!2771 = !DILocalVariable(name: "zeta", scope: !2747, file: !11, line: 108, type: !14)
!2772 = !DILocalVariable(name: "j", scope: !2747, file: !11, line: 107, type: !42)
!2773 = !DILocation(line: 115, column: 11, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2770, file: !11, line: 115, column: 7)
!2775 = !DILocation(line: 115, scope: !2774)
!2776 = !DILocation(line: 115, column: 32, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2774, file: !11, line: 115, column: 7)
!2778 = !DILocation(line: 115, column: 24, scope: !2777)
!2779 = !DILocation(line: 115, column: 7, scope: !2774)
!2780 = !DILocation(line: 116, column: 13, scope: !2781)
!2781 = distinct !DILexicalBlock(scope: !2777, file: !11, line: 115, column: 44)
!2782 = !DILocalVariable(name: "t", scope: !2747, file: !11, line: 108, type: !14)
!2783 = !DILocation(line: 117, column: 35, scope: !2781)
!2784 = !DILocation(line: 117, column: 33, scope: !2781)
!2785 = !DILocation(line: 0, scope: !788, inlinedAt: !2786)
!2786 = distinct !DILocation(line: 117, column: 16, scope: !2781)
!2787 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2786)
!2788 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2786)
!2789 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2786)
!2790 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2786)
!2791 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2786)
!2792 = !DILocation(line: 117, column: 9, scope: !2781)
!2793 = !DILocation(line: 117, column: 14, scope: !2781)
!2794 = !DILocation(line: 118, column: 22, scope: !2781)
!2795 = !DILocation(line: 118, column: 33, scope: !2781)
!2796 = !DILocation(line: 118, column: 9, scope: !2781)
!2797 = !DILocation(line: 118, column: 20, scope: !2781)
!2798 = !DILocation(line: 119, column: 34, scope: !2781)
!2799 = !DILocation(line: 0, scope: !2708, inlinedAt: !2800)
!2800 = distinct !DILocation(line: 119, column: 22, scope: !2781)
!2801 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2800)
!2802 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2800)
!2803 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2800)
!2804 = !DILocation(line: 0, scope: !876, inlinedAt: !2805)
!2805 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2800)
!2806 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2805)
!2807 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2805)
!2808 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2805)
!2809 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2805)
!2810 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2805)
!2811 = !DILocation(line: 119, column: 9, scope: !2781)
!2812 = !DILocation(line: 119, column: 20, scope: !2781)
!2813 = !DILocation(line: 115, column: 40, scope: !2777)
!2814 = !DILocation(line: 115, column: 7, scope: !2777)
!2815 = distinct !{!2815, !2779, !2816, !185}
!2816 = !DILocation(line: 120, column: 7, scope: !2774)
!2817 = !DILocation(line: 114, column: 21, scope: !2770)
!2818 = !DILocation(line: 113, column: 43, scope: !2768)
!2819 = !DILocation(line: 113, column: 5, scope: !2768)
!2820 = distinct !{!2820, !2760, !2821, !185}
!2821 = !DILocation(line: 121, column: 5, scope: !2761)
!2822 = !DILocation(line: 112, column: 32, scope: !2758)
!2823 = !DILocation(line: 112, column: 3, scope: !2758)
!2824 = distinct !{!2824, !2759, !2825, !185}
!2825 = !DILocation(line: 122, column: 3, scope: !2754)
!2826 = !DILocation(line: 124, scope: !2764)
!2827 = !DILocation(line: 124, column: 16, scope: !2828)
!2828 = distinct !DILexicalBlock(scope: !2764, file: !11, line: 124, column: 3)
!2829 = !DILocation(line: 125, column: 18, scope: !2828)
!2830 = !DILocation(line: 0, scope: !2708, inlinedAt: !2831)
!2831 = distinct !DILocation(line: 125, column: 12, scope: !2828)
!2832 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2831)
!2833 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2831)
!2834 = !DILocation(line: 0, scope: !876, inlinedAt: !2835)
!2835 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2831)
!2836 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2835)
!2837 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2835)
!2838 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2835)
!2839 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2835)
!2840 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2835)
!2841 = !DILocation(line: 125, column: 5, scope: !2828)
!2842 = !DILocation(line: 125, column: 10, scope: !2828)
!2843 = !DILocation(line: 124, column: 24, scope: !2828)
!2844 = !DILocation(line: 124, column: 3, scope: !2828)
!2845 = distinct !{!2845, !2763, !2846, !185}
!2846 = !DILocation(line: 125, column: 25, scope: !2764)
!2847 = !DILocation(line: 126, column: 1, scope: !2747)
!2848 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !11, file: !11, line: 139, type: !2849, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2849 = !DISubroutineType(types: !2850)
!2850 = !{null, !464, !2851, !2851, !14}
!2851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!2852 = !DILocalVariable(name: "r", arg: 1, scope: !2848, file: !11, line: 139, type: !464)
!2853 = !DILocation(line: 0, scope: !2848)
!2854 = !DILocalVariable(name: "a", arg: 2, scope: !2848, file: !11, line: 139, type: !2851)
!2855 = !DILocalVariable(name: "b", arg: 3, scope: !2848, file: !11, line: 139, type: !2851)
!2856 = !DILocalVariable(name: "zeta", arg: 4, scope: !2848, file: !11, line: 139, type: !14)
!2857 = !DILocation(line: 141, column: 17, scope: !2848)
!2858 = !DILocation(line: 141, column: 23, scope: !2848)
!2859 = !DILocation(line: 0, scope: !2708, inlinedAt: !2860)
!2860 = distinct !DILocation(line: 141, column: 11, scope: !2848)
!2861 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2860)
!2862 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2860)
!2863 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2860)
!2864 = !DILocation(line: 0, scope: !876, inlinedAt: !2865)
!2865 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2860)
!2866 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2865)
!2867 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2865)
!2868 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2865)
!2869 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2865)
!2870 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2865)
!2871 = !DILocation(line: 141, column: 9, scope: !2848)
!2872 = !DILocation(line: 0, scope: !2708, inlinedAt: !2873)
!2873 = distinct !DILocation(line: 142, column: 11, scope: !2848)
!2874 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2873)
!2875 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2873)
!2876 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2873)
!2877 = !DILocation(line: 0, scope: !876, inlinedAt: !2878)
!2878 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2873)
!2879 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2878)
!2880 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2878)
!2881 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2878)
!2882 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2878)
!2883 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2878)
!2884 = !DILocation(line: 142, column: 9, scope: !2848)
!2885 = !DILocation(line: 143, column: 17, scope: !2848)
!2886 = !DILocation(line: 143, column: 23, scope: !2848)
!2887 = !DILocation(line: 0, scope: !2708, inlinedAt: !2888)
!2888 = distinct !DILocation(line: 143, column: 11, scope: !2848)
!2889 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2888)
!2890 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2888)
!2891 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2888)
!2892 = !DILocation(line: 0, scope: !876, inlinedAt: !2893)
!2893 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2888)
!2894 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2893)
!2895 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2893)
!2896 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2893)
!2897 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2893)
!2898 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2893)
!2899 = !DILocation(line: 143, column: 8, scope: !2848)
!2900 = !DILocation(line: 144, column: 17, scope: !2848)
!2901 = !DILocation(line: 144, column: 23, scope: !2848)
!2902 = !DILocation(line: 0, scope: !2708, inlinedAt: !2903)
!2903 = distinct !DILocation(line: 144, column: 11, scope: !2848)
!2904 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2903)
!2905 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2903)
!2906 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2903)
!2907 = !DILocation(line: 0, scope: !876, inlinedAt: !2908)
!2908 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2903)
!2909 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2908)
!2910 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2908)
!2911 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2908)
!2912 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2908)
!2913 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2908)
!2914 = !DILocation(line: 144, column: 3, scope: !2848)
!2915 = !DILocation(line: 144, column: 9, scope: !2848)
!2916 = !DILocation(line: 145, column: 17, scope: !2848)
!2917 = !DILocation(line: 145, column: 23, scope: !2848)
!2918 = !DILocation(line: 0, scope: !2708, inlinedAt: !2919)
!2919 = distinct !DILocation(line: 145, column: 11, scope: !2848)
!2920 = !DILocation(line: 69, column: 28, scope: !2708, inlinedAt: !2919)
!2921 = !DILocation(line: 69, column: 39, scope: !2708, inlinedAt: !2919)
!2922 = !DILocation(line: 69, column: 38, scope: !2708, inlinedAt: !2919)
!2923 = !DILocation(line: 0, scope: !876, inlinedAt: !2924)
!2924 = distinct !DILocation(line: 69, column: 10, scope: !2708, inlinedAt: !2919)
!2925 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2924)
!2926 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2924)
!2927 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2924)
!2928 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2924)
!2929 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2924)
!2930 = !DILocation(line: 145, column: 3, scope: !2848)
!2931 = !DILocation(line: 145, column: 8, scope: !2848)
!2932 = !DILocation(line: 146, column: 1, scope: !2848)
!2933 = !DILocation(line: 0, scope: !657)
!2934 = !DILocation(line: 113, column: 3, scope: !657)
!2935 = !DILocation(line: 119, column: 1, scope: !657)
!2936 = distinct !DISubprogram(name: "cbd2", scope: !658, file: !658, line: 58, type: !659, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2937 = !DILocalVariable(name: "r", arg: 1, scope: !2936, file: !658, line: 58, type: !661)
!2938 = !DILocation(line: 0, scope: !2936)
!2939 = !DILocalVariable(name: "buf", arg: 2, scope: !2936, file: !658, line: 58, type: !64)
!2940 = !DILocalVariable(name: "i", scope: !2936, file: !658, line: 60, type: !42)
!2941 = !DILocation(line: 64, column: 7, scope: !2942)
!2942 = distinct !DILexicalBlock(scope: !2936, file: !658, line: 64, column: 3)
!2943 = !DILocation(line: 64, scope: !2942)
!2944 = !DILocation(line: 64, column: 12, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2942, file: !658, line: 64, column: 3)
!2946 = !DILocation(line: 64, column: 3, scope: !2942)
!2947 = !DILocation(line: 65, column: 35, scope: !2948)
!2948 = distinct !DILexicalBlock(scope: !2945, file: !658, line: 64, column: 28)
!2949 = !DILocation(line: 65, column: 33, scope: !2948)
!2950 = !DILocalVariable(name: "x", arg: 1, scope: !2951, file: !658, line: 15, type: !64)
!2951 = distinct !DISubprogram(name: "load32_littleendian", scope: !658, file: !658, line: 15, type: !2952, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2952 = !DISubroutineType(types: !2953)
!2953 = !{!40, !64}
!2954 = !DILocation(line: 0, scope: !2951, inlinedAt: !2955)
!2955 = distinct !DILocation(line: 65, column: 10, scope: !2948)
!2956 = !DILocation(line: 18, column: 18, scope: !2951, inlinedAt: !2955)
!2957 = !DILocation(line: 18, column: 8, scope: !2951, inlinedAt: !2955)
!2958 = !DILocalVariable(name: "r", scope: !2951, file: !658, line: 17, type: !40)
!2959 = !DILocation(line: 19, column: 18, scope: !2951, inlinedAt: !2955)
!2960 = !DILocation(line: 19, column: 8, scope: !2951, inlinedAt: !2955)
!2961 = !DILocation(line: 19, column: 23, scope: !2951, inlinedAt: !2955)
!2962 = !DILocation(line: 19, column: 5, scope: !2951, inlinedAt: !2955)
!2963 = !DILocation(line: 20, column: 18, scope: !2951, inlinedAt: !2955)
!2964 = !DILocation(line: 20, column: 8, scope: !2951, inlinedAt: !2955)
!2965 = !DILocation(line: 20, column: 23, scope: !2951, inlinedAt: !2955)
!2966 = !DILocation(line: 20, column: 5, scope: !2951, inlinedAt: !2955)
!2967 = !DILocation(line: 21, column: 18, scope: !2951, inlinedAt: !2955)
!2968 = !DILocation(line: 21, column: 8, scope: !2951, inlinedAt: !2955)
!2969 = !DILocation(line: 21, column: 23, scope: !2951, inlinedAt: !2955)
!2970 = !DILocation(line: 21, column: 5, scope: !2951, inlinedAt: !2955)
!2971 = !DILocalVariable(name: "t", scope: !2936, file: !658, line: 61, type: !40)
!2972 = !DILocation(line: 66, column: 12, scope: !2948)
!2973 = !DILocalVariable(name: "d", scope: !2936, file: !658, line: 61, type: !40)
!2974 = !DILocation(line: 67, column: 12, scope: !2948)
!2975 = !DILocation(line: 67, column: 17, scope: !2948)
!2976 = !DILocation(line: 67, column: 7, scope: !2948)
!2977 = !DILocalVariable(name: "j", scope: !2936, file: !658, line: 60, type: !42)
!2978 = !DILocation(line: 69, column: 9, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2948, file: !658, line: 69, column: 5)
!2980 = !DILocation(line: 69, scope: !2979)
!2981 = !DILocation(line: 69, column: 14, scope: !2982)
!2982 = distinct !DILexicalBlock(scope: !2979, file: !658, line: 69, column: 5)
!2983 = !DILocation(line: 69, column: 5, scope: !2979)
!2984 = !DILocation(line: 70, column: 19, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2982, file: !658, line: 69, column: 22)
!2986 = !DILocation(line: 70, column: 14, scope: !2985)
!2987 = !DILocation(line: 70, column: 11, scope: !2985)
!2988 = !DILocalVariable(name: "a", scope: !2936, file: !658, line: 62, type: !14)
!2989 = !DILocation(line: 71, column: 19, scope: !2985)
!2990 = !DILocation(line: 71, column: 21, scope: !2985)
!2991 = !DILocation(line: 71, column: 14, scope: !2985)
!2992 = !DILocation(line: 71, column: 11, scope: !2985)
!2993 = !DILocalVariable(name: "b", scope: !2936, file: !658, line: 62, type: !14)
!2994 = !DILocation(line: 72, column: 28, scope: !2985)
!2995 = !DILocation(line: 72, column: 26, scope: !2985)
!2996 = !DILocation(line: 72, column: 18, scope: !2985)
!2997 = !DILocation(line: 72, column: 20, scope: !2985)
!2998 = !DILocation(line: 72, column: 7, scope: !2985)
!2999 = !DILocation(line: 72, column: 24, scope: !2985)
!3000 = !DILocation(line: 69, column: 18, scope: !2982)
!3001 = !DILocation(line: 69, column: 5, scope: !2982)
!3002 = distinct !{!3002, !2983, !3003, !185}
!3003 = !DILocation(line: 73, column: 5, scope: !2979)
!3004 = !DILocation(line: 64, column: 24, scope: !2945)
!3005 = !DILocation(line: 64, column: 3, scope: !2945)
!3006 = distinct !{!3006, !2946, !3007, !185}
!3007 = !DILocation(line: 74, column: 3, scope: !2942)
!3008 = !DILocation(line: 75, column: 1, scope: !2936)
!3009 = !DILocation(line: 0, scope: !1256)
!3010 = !DILocation(line: 124, column: 3, scope: !1256)
!3011 = !DILocation(line: 128, column: 1, scope: !1256)
!3012 = !DILocation(line: 0, scope: !876)
!3013 = !DILocation(line: 21, column: 12, scope: !876)
!3014 = !DILocation(line: 21, column: 22, scope: !876)
!3015 = !DILocation(line: 21, column: 10, scope: !876)
!3016 = !DILocation(line: 21, column: 32, scope: !876)
!3017 = !DILocation(line: 21, column: 7, scope: !876)
!3018 = !DILocation(line: 22, column: 3, scope: !876)
!3019 = !DILocation(line: 0, scope: !788)
!3020 = !DILocation(line: 39, column: 20, scope: !788)
!3021 = !DILocation(line: 39, column: 19, scope: !788)
!3022 = !DILocation(line: 39, column: 22, scope: !788)
!3023 = !DILocation(line: 39, column: 33, scope: !788)
!3024 = !DILocation(line: 41, column: 10, scope: !788)
!3025 = !DILocation(line: 41, column: 3, scope: !788)
!3026 = !DILocation(line: 0, scope: !159)
!3027 = !DILocation(line: 21, column: 7, scope: !172)
!3028 = !DILocation(line: 21, scope: !172)
!3029 = !DILocation(line: 21, column: 12, scope: !175)
!3030 = !DILocation(line: 21, column: 3, scope: !172)
!3031 = !DILocation(line: 22, column: 10, scope: !175)
!3032 = !DILocation(line: 22, column: 17, scope: !175)
!3033 = !DILocation(line: 22, column: 15, scope: !175)
!3034 = !DILocation(line: 22, column: 7, scope: !175)
!3035 = !DILocation(line: 21, column: 18, scope: !175)
!3036 = !DILocation(line: 21, column: 3, scope: !175)
!3037 = distinct !{!3037, !3030, !3038, !185}
!3038 = !DILocation(line: 22, column: 20, scope: !172)
!3039 = !DILocation(line: 24, column: 25, scope: !159)
!3040 = !DILocation(line: 24, column: 10, scope: !159)
!3041 = !DILocation(line: 24, column: 3, scope: !159)
!3042 = !DILocation(line: 0, scope: !191)
!3043 = !DILocation(line: 51, column: 3, scope: !191)
!3044 = !DILocation(line: 54, column: 7, scope: !191)
!3045 = !DILocation(line: 55, column: 7, scope: !204)
!3046 = !DILocation(line: 55, scope: !204)
!3047 = !DILocation(line: 55, column: 12, scope: !207)
!3048 = !DILocation(line: 55, column: 3, scope: !204)
!3049 = !DILocation(line: 56, column: 18, scope: !207)
!3050 = !DILocation(line: 56, column: 25, scope: !207)
!3051 = !DILocation(line: 56, column: 23, scope: !207)
!3052 = !DILocation(line: 56, column: 15, scope: !207)
!3053 = !DILocation(line: 56, column: 5, scope: !207)
!3054 = !DILocation(line: 56, column: 10, scope: !207)
!3055 = !DILocation(line: 55, column: 18, scope: !207)
!3056 = !DILocation(line: 55, column: 3, scope: !207)
!3057 = distinct !{!3057, !3048, !3058, !185}
!3058 = !DILocation(line: 56, column: 29, scope: !204)
!3059 = !DILocation(line: 57, column: 1, scope: !191)
!3060 = !DILocation(line: 0, scope: !1100)
!3061 = !DILocation(line: 73, column: 7, scope: !1100)
!3062 = !DILocation(line: 74, column: 15, scope: !1100)
!3063 = !DILocation(line: 74, column: 19, scope: !1100)
!3064 = !DILocation(line: 74, column: 11, scope: !1100)
!3065 = !DILocation(line: 74, column: 6, scope: !1100)
!3066 = !DILocation(line: 75, column: 1, scope: !1100)
!3067 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !3068, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3068 = !DISubroutineType(types: !3069)
!3069 = !{null, !311}
!3070 = !DILocalVariable(name: "state", arg: 1, scope: !3067, file: !27, line: 523, type: !311)
!3071 = !DILocation(line: 0, scope: !3067)
!3072 = !DILocalVariable(name: "s", arg: 1, scope: !3073, file: !27, line: 353, type: !352)
!3073 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !3074, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3074 = !DISubroutineType(types: !3075)
!3075 = !{null, !352}
!3076 = !DILocation(line: 0, scope: !3073, inlinedAt: !3077)
!3077 = distinct !DILocation(line: 525, column: 3, scope: !3067)
!3078 = !DILocalVariable(name: "i", scope: !3073, file: !27, line: 355, type: !42)
!3079 = !DILocation(line: 356, column: 7, scope: !3080, inlinedAt: !3077)
!3080 = distinct !DILexicalBlock(scope: !3073, file: !27, line: 356, column: 3)
!3081 = !DILocation(line: 356, scope: !3080, inlinedAt: !3077)
!3082 = !DILocation(line: 356, column: 12, scope: !3083, inlinedAt: !3077)
!3083 = distinct !DILexicalBlock(scope: !3080, file: !27, line: 356, column: 3)
!3084 = !DILocation(line: 356, column: 3, scope: !3080, inlinedAt: !3077)
!3085 = !DILocation(line: 357, column: 5, scope: !3083, inlinedAt: !3077)
!3086 = !DILocation(line: 357, column: 10, scope: !3083, inlinedAt: !3077)
!3087 = !DILocation(line: 356, column: 17, scope: !3083, inlinedAt: !3077)
!3088 = !DILocation(line: 356, column: 3, scope: !3083, inlinedAt: !3077)
!3089 = distinct !{!3089, !3084, !3090, !185}
!3090 = !DILocation(line: 357, column: 12, scope: !3080, inlinedAt: !3077)
!3091 = !DILocation(line: 526, column: 10, scope: !3067)
!3092 = !DILocation(line: 526, column: 14, scope: !3067)
!3093 = !DILocation(line: 527, column: 1, scope: !3067)
!3094 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !309, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3095 = !DILocalVariable(name: "state", arg: 1, scope: !3094, file: !27, line: 538, type: !311)
!3096 = !DILocation(line: 0, scope: !3094)
!3097 = !DILocalVariable(name: "in", arg: 2, scope: !3094, file: !27, line: 538, type: !64)
!3098 = !DILocalVariable(name: "inlen", arg: 3, scope: !3094, file: !27, line: 538, type: !163)
!3099 = !DILocation(line: 540, column: 47, scope: !3094)
!3100 = !DILocation(line: 540, column: 16, scope: !3094)
!3101 = !DILocation(line: 540, column: 10, scope: !3094)
!3102 = !DILocation(line: 540, column: 14, scope: !3094)
!3103 = !DILocation(line: 541, column: 1, scope: !3094)
!3104 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !3105, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3105 = !DISubroutineType(types: !3106)
!3106 = !{!42, !352, !42, !42, !64, !163}
!3107 = !DILocalVariable(name: "s", arg: 1, scope: !3104, file: !27, line: 373, type: !352)
!3108 = !DILocation(line: 0, scope: !3104)
!3109 = !DILocalVariable(name: "pos", arg: 2, scope: !3104, file: !27, line: 374, type: !42)
!3110 = !DILocalVariable(name: "r", arg: 3, scope: !3104, file: !27, line: 375, type: !42)
!3111 = !DILocalVariable(name: "in", arg: 4, scope: !3104, file: !27, line: 376, type: !64)
!3112 = !DILocalVariable(name: "inlen", arg: 5, scope: !3104, file: !27, line: 377, type: !163)
!3113 = !DILocation(line: 381, column: 3, scope: !3104)
!3114 = !DILocation(line: 381, column: 12, scope: !3104)
!3115 = !DILocation(line: 381, column: 19, scope: !3104)
!3116 = !DILocation(line: 382, column: 5, scope: !3117)
!3117 = distinct !DILexicalBlock(scope: !3118, file: !27, line: 382, column: 5)
!3118 = distinct !DILexicalBlock(scope: !3104, file: !27, line: 381, column: 25)
!3119 = !DILocation(line: 389, column: 3, scope: !3120)
!3120 = distinct !DILexicalBlock(scope: !3104, file: !27, line: 389, column: 3)
!3121 = !DILocation(line: 382, scope: !3117)
!3122 = !DILocalVariable(name: "i", scope: !3104, file: !27, line: 379, type: !42)
!3123 = !DILocation(line: 382, column: 16, scope: !3124)
!3124 = distinct !DILexicalBlock(scope: !3117, file: !27, line: 382, column: 5)
!3125 = !DILocation(line: 383, column: 27, scope: !3124)
!3126 = !DILocation(line: 383, column: 17, scope: !3124)
!3127 = !DILocation(line: 383, column: 37, scope: !3124)
!3128 = !DILocation(line: 383, column: 33, scope: !3124)
!3129 = !DILocation(line: 383, column: 10, scope: !3124)
!3130 = !DILocation(line: 383, column: 7, scope: !3124)
!3131 = !DILocation(line: 383, column: 14, scope: !3124)
!3132 = !DILocation(line: 383, column: 30, scope: !3124)
!3133 = !DILocation(line: 382, column: 20, scope: !3124)
!3134 = !DILocation(line: 382, column: 5, scope: !3124)
!3135 = distinct !{!3135, !3116, !3136, !185}
!3136 = !DILocation(line: 383, column: 42, scope: !3117)
!3137 = !DILocation(line: 384, column: 15, scope: !3118)
!3138 = !DILocation(line: 384, column: 11, scope: !3118)
!3139 = !DILocation(line: 385, column: 5, scope: !3118)
!3140 = distinct !{!3140, !3113, !3141, !185}
!3141 = !DILocation(line: 387, column: 3, scope: !3104)
!3142 = !DILocation(line: 389, scope: !3120)
!3143 = !DILocation(line: 389, column: 18, scope: !3144)
!3144 = distinct !DILexicalBlock(scope: !3120, file: !27, line: 389, column: 3)
!3145 = !DILocation(line: 389, column: 14, scope: !3144)
!3146 = !DILocation(line: 390, column: 25, scope: !3144)
!3147 = !DILocation(line: 390, column: 15, scope: !3144)
!3148 = !DILocation(line: 390, column: 35, scope: !3144)
!3149 = !DILocation(line: 390, column: 31, scope: !3144)
!3150 = !DILocation(line: 390, column: 8, scope: !3144)
!3151 = !DILocation(line: 390, column: 5, scope: !3144)
!3152 = !DILocation(line: 390, column: 12, scope: !3144)
!3153 = !DILocation(line: 390, column: 28, scope: !3144)
!3154 = !DILocation(line: 389, column: 26, scope: !3144)
!3155 = !DILocation(line: 389, column: 3, scope: !3144)
!3156 = distinct !{!3156, !3119, !3157, !185}
!3157 = !DILocation(line: 390, column: 40, scope: !3120)
!3158 = !DILocation(line: 392, column: 3, scope: !3104)
!3159 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !3074, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3160 = !DILocalVariable(name: "state", arg: 1, scope: !3159, file: !27, line: 82, type: !352)
!3161 = !DILocation(line: 0, scope: !3159)
!3162 = !DILocation(line: 100, column: 15, scope: !3159)
!3163 = !DILocalVariable(name: "Aba", scope: !3159, file: !27, line: 86, type: !23)
!3164 = !DILocation(line: 101, column: 15, scope: !3159)
!3165 = !DILocalVariable(name: "Abe", scope: !3159, file: !27, line: 86, type: !23)
!3166 = !DILocation(line: 102, column: 15, scope: !3159)
!3167 = !DILocalVariable(name: "Abi", scope: !3159, file: !27, line: 86, type: !23)
!3168 = !DILocation(line: 103, column: 15, scope: !3159)
!3169 = !DILocalVariable(name: "Abo", scope: !3159, file: !27, line: 86, type: !23)
!3170 = !DILocation(line: 104, column: 15, scope: !3159)
!3171 = !DILocalVariable(name: "Abu", scope: !3159, file: !27, line: 86, type: !23)
!3172 = !DILocation(line: 105, column: 15, scope: !3159)
!3173 = !DILocalVariable(name: "Aga", scope: !3159, file: !27, line: 87, type: !23)
!3174 = !DILocation(line: 106, column: 15, scope: !3159)
!3175 = !DILocalVariable(name: "Age", scope: !3159, file: !27, line: 87, type: !23)
!3176 = !DILocation(line: 107, column: 15, scope: !3159)
!3177 = !DILocalVariable(name: "Agi", scope: !3159, file: !27, line: 87, type: !23)
!3178 = !DILocation(line: 108, column: 15, scope: !3159)
!3179 = !DILocalVariable(name: "Ago", scope: !3159, file: !27, line: 87, type: !23)
!3180 = !DILocation(line: 109, column: 15, scope: !3159)
!3181 = !DILocalVariable(name: "Agu", scope: !3159, file: !27, line: 87, type: !23)
!3182 = !DILocation(line: 110, column: 15, scope: !3159)
!3183 = !DILocalVariable(name: "Aka", scope: !3159, file: !27, line: 88, type: !23)
!3184 = !DILocation(line: 111, column: 15, scope: !3159)
!3185 = !DILocalVariable(name: "Ake", scope: !3159, file: !27, line: 88, type: !23)
!3186 = !DILocation(line: 112, column: 15, scope: !3159)
!3187 = !DILocalVariable(name: "Aki", scope: !3159, file: !27, line: 88, type: !23)
!3188 = !DILocation(line: 113, column: 15, scope: !3159)
!3189 = !DILocalVariable(name: "Ako", scope: !3159, file: !27, line: 88, type: !23)
!3190 = !DILocation(line: 114, column: 15, scope: !3159)
!3191 = !DILocalVariable(name: "Aku", scope: !3159, file: !27, line: 88, type: !23)
!3192 = !DILocation(line: 115, column: 15, scope: !3159)
!3193 = !DILocalVariable(name: "Ama", scope: !3159, file: !27, line: 89, type: !23)
!3194 = !DILocation(line: 116, column: 15, scope: !3159)
!3195 = !DILocalVariable(name: "Ame", scope: !3159, file: !27, line: 89, type: !23)
!3196 = !DILocation(line: 117, column: 15, scope: !3159)
!3197 = !DILocalVariable(name: "Ami", scope: !3159, file: !27, line: 89, type: !23)
!3198 = !DILocation(line: 118, column: 15, scope: !3159)
!3199 = !DILocalVariable(name: "Amo", scope: !3159, file: !27, line: 89, type: !23)
!3200 = !DILocation(line: 119, column: 15, scope: !3159)
!3201 = !DILocalVariable(name: "Amu", scope: !3159, file: !27, line: 89, type: !23)
!3202 = !DILocation(line: 120, column: 15, scope: !3159)
!3203 = !DILocalVariable(name: "Asa", scope: !3159, file: !27, line: 90, type: !23)
!3204 = !DILocation(line: 121, column: 15, scope: !3159)
!3205 = !DILocalVariable(name: "Ase", scope: !3159, file: !27, line: 90, type: !23)
!3206 = !DILocation(line: 122, column: 15, scope: !3159)
!3207 = !DILocalVariable(name: "Asi", scope: !3159, file: !27, line: 90, type: !23)
!3208 = !DILocation(line: 123, column: 15, scope: !3159)
!3209 = !DILocalVariable(name: "Aso", scope: !3159, file: !27, line: 90, type: !23)
!3210 = !DILocation(line: 124, column: 15, scope: !3159)
!3211 = !DILocalVariable(name: "Asu", scope: !3159, file: !27, line: 90, type: !23)
!3212 = !DILocalVariable(name: "round", scope: !3159, file: !27, line: 84, type: !9)
!3213 = !DILocation(line: 126, column: 13, scope: !3214)
!3214 = distinct !DILexicalBlock(scope: !3159, file: !27, line: 126, column: 9)
!3215 = !DILocation(line: 126, scope: !3214)
!3216 = !DILocation(line: 126, column: 30, scope: !3217)
!3217 = distinct !DILexicalBlock(scope: !3214, file: !27, line: 126, column: 9)
!3218 = !DILocation(line: 126, column: 9, scope: !3214)
!3219 = !DILocalVariable(name: "BCa", scope: !3159, file: !27, line: 91, type: !23)
!3220 = !DILocalVariable(name: "BCe", scope: !3159, file: !27, line: 91, type: !23)
!3221 = !DILocalVariable(name: "BCi", scope: !3159, file: !27, line: 91, type: !23)
!3222 = !DILocalVariable(name: "BCo", scope: !3159, file: !27, line: 91, type: !23)
!3223 = !DILocalVariable(name: "BCu", scope: !3159, file: !27, line: 91, type: !23)
!3224 = !DILocalVariable(name: "Da", scope: !3159, file: !27, line: 92, type: !23)
!3225 = !DILocalVariable(name: "De", scope: !3159, file: !27, line: 92, type: !23)
!3226 = !DILocalVariable(name: "Di", scope: !3159, file: !27, line: 92, type: !23)
!3227 = !DILocalVariable(name: "Do", scope: !3159, file: !27, line: 92, type: !23)
!3228 = !DILocalVariable(name: "Du", scope: !3159, file: !27, line: 92, type: !23)
!3229 = !DILocalVariable(name: "Eba", scope: !3159, file: !27, line: 93, type: !23)
!3230 = !DILocalVariable(name: "Ebe", scope: !3159, file: !27, line: 93, type: !23)
!3231 = !DILocalVariable(name: "Ebi", scope: !3159, file: !27, line: 93, type: !23)
!3232 = !DILocalVariable(name: "Ebo", scope: !3159, file: !27, line: 93, type: !23)
!3233 = !DILocalVariable(name: "Ebu", scope: !3159, file: !27, line: 93, type: !23)
!3234 = !DILocalVariable(name: "Ega", scope: !3159, file: !27, line: 94, type: !23)
!3235 = !DILocalVariable(name: "Ege", scope: !3159, file: !27, line: 94, type: !23)
!3236 = !DILocalVariable(name: "Egi", scope: !3159, file: !27, line: 94, type: !23)
!3237 = !DILocalVariable(name: "Ego", scope: !3159, file: !27, line: 94, type: !23)
!3238 = !DILocalVariable(name: "Egu", scope: !3159, file: !27, line: 94, type: !23)
!3239 = !DILocalVariable(name: "Eka", scope: !3159, file: !27, line: 95, type: !23)
!3240 = !DILocalVariable(name: "Eke", scope: !3159, file: !27, line: 95, type: !23)
!3241 = !DILocalVariable(name: "Eki", scope: !3159, file: !27, line: 95, type: !23)
!3242 = !DILocalVariable(name: "Eko", scope: !3159, file: !27, line: 95, type: !23)
!3243 = !DILocalVariable(name: "Eku", scope: !3159, file: !27, line: 95, type: !23)
!3244 = !DILocalVariable(name: "Ema", scope: !3159, file: !27, line: 96, type: !23)
!3245 = !DILocalVariable(name: "Eme", scope: !3159, file: !27, line: 96, type: !23)
!3246 = !DILocalVariable(name: "Emi", scope: !3159, file: !27, line: 96, type: !23)
!3247 = !DILocalVariable(name: "Emo", scope: !3159, file: !27, line: 96, type: !23)
!3248 = !DILocalVariable(name: "Emu", scope: !3159, file: !27, line: 96, type: !23)
!3249 = !DILocalVariable(name: "Esa", scope: !3159, file: !27, line: 97, type: !23)
!3250 = !DILocalVariable(name: "Ese", scope: !3159, file: !27, line: 97, type: !23)
!3251 = !DILocalVariable(name: "Esi", scope: !3159, file: !27, line: 97, type: !23)
!3252 = !DILocalVariable(name: "Eso", scope: !3159, file: !27, line: 97, type: !23)
!3253 = !DILocalVariable(name: "Esu", scope: !3159, file: !27, line: 97, type: !23)
!3254 = !DILocation(line: 130, column: 22, scope: !3255)
!3255 = distinct !DILexicalBlock(scope: !3217, file: !27, line: 126, column: 53)
!3256 = !DILocation(line: 130, column: 26, scope: !3255)
!3257 = !DILocation(line: 130, column: 30, scope: !3255)
!3258 = !DILocation(line: 130, column: 34, scope: !3255)
!3259 = !DILocation(line: 132, column: 22, scope: !3255)
!3260 = !DILocation(line: 132, column: 26, scope: !3255)
!3261 = !DILocation(line: 132, column: 30, scope: !3255)
!3262 = !DILocation(line: 132, column: 34, scope: !3255)
!3263 = !DILocation(line: 138, column: 22, scope: !3255)
!3264 = !DILocation(line: 138, column: 21, scope: !3255)
!3265 = !DILocation(line: 208, column: 17, scope: !3255)
!3266 = !DILocation(line: 209, column: 19, scope: !3255)
!3267 = !DILocation(line: 129, column: 22, scope: !3255)
!3268 = !DILocation(line: 129, column: 26, scope: !3255)
!3269 = !DILocation(line: 129, column: 30, scope: !3255)
!3270 = !DILocation(line: 129, column: 34, scope: !3255)
!3271 = !DILocation(line: 135, column: 22, scope: !3255)
!3272 = !DILocation(line: 135, column: 21, scope: !3255)
!3273 = !DILocation(line: 212, column: 17, scope: !3255)
!3274 = !DILocation(line: 213, column: 19, scope: !3255)
!3275 = !DILocation(line: 131, column: 22, scope: !3255)
!3276 = !DILocation(line: 131, column: 26, scope: !3255)
!3277 = !DILocation(line: 131, column: 30, scope: !3255)
!3278 = !DILocation(line: 131, column: 34, scope: !3255)
!3279 = !DILocation(line: 128, column: 22, scope: !3255)
!3280 = !DILocation(line: 128, column: 26, scope: !3255)
!3281 = !DILocation(line: 128, column: 30, scope: !3255)
!3282 = !DILocation(line: 128, column: 34, scope: !3255)
!3283 = !DILocation(line: 139, column: 22, scope: !3255)
!3284 = !DILocation(line: 139, column: 21, scope: !3255)
!3285 = !DILocation(line: 210, column: 17, scope: !3255)
!3286 = !DILocation(line: 211, column: 19, scope: !3255)
!3287 = !DILocation(line: 217, column: 28, scope: !3255)
!3288 = !DILocation(line: 217, column: 33, scope: !3255)
!3289 = !DILocation(line: 217, column: 25, scope: !3255)
!3290 = !DILocation(line: 137, column: 22, scope: !3255)
!3291 = !DILocation(line: 137, column: 21, scope: !3255)
!3292 = !DILocation(line: 145, column: 17, scope: !3255)
!3293 = !DILocation(line: 146, column: 19, scope: !3255)
!3294 = !DILocation(line: 136, column: 22, scope: !3255)
!3295 = !DILocation(line: 136, column: 21, scope: !3255)
!3296 = !DILocation(line: 143, column: 17, scope: !3255)
!3297 = !DILocation(line: 144, column: 19, scope: !3255)
!3298 = !DILocation(line: 151, column: 28, scope: !3255)
!3299 = !DILocation(line: 151, column: 33, scope: !3255)
!3300 = !DILocation(line: 152, column: 30, scope: !3255)
!3301 = !DILocation(line: 152, column: 17, scope: !3255)
!3302 = !DILocation(line: 141, column: 17, scope: !3255)
!3303 = !DILocation(line: 158, column: 17, scope: !3255)
!3304 = !DILocation(line: 159, column: 19, scope: !3255)
!3305 = !DILocation(line: 162, column: 17, scope: !3255)
!3306 = !DILocation(line: 163, column: 19, scope: !3255)
!3307 = !DILocation(line: 160, column: 17, scope: !3255)
!3308 = !DILocation(line: 161, column: 19, scope: !3255)
!3309 = !DILocation(line: 168, column: 28, scope: !3255)
!3310 = !DILocation(line: 168, column: 33, scope: !3255)
!3311 = !DILocation(line: 168, column: 25, scope: !3255)
!3312 = !DILocation(line: 223, column: 22, scope: !3255)
!3313 = !DILocation(line: 174, column: 17, scope: !3255)
!3314 = !DILocation(line: 175, column: 19, scope: !3255)
!3315 = !DILocation(line: 178, column: 17, scope: !3255)
!3316 = !DILocation(line: 179, column: 19, scope: !3255)
!3317 = !DILocation(line: 176, column: 17, scope: !3255)
!3318 = !DILocation(line: 177, column: 19, scope: !3255)
!3319 = !DILocation(line: 184, column: 28, scope: !3255)
!3320 = !DILocation(line: 184, column: 33, scope: !3255)
!3321 = !DILocation(line: 184, column: 25, scope: !3255)
!3322 = !DILocation(line: 223, column: 26, scope: !3255)
!3323 = !DILocation(line: 190, column: 17, scope: !3255)
!3324 = !DILocation(line: 191, column: 19, scope: !3255)
!3325 = !DILocation(line: 194, column: 17, scope: !3255)
!3326 = !DILocation(line: 195, column: 19, scope: !3255)
!3327 = !DILocation(line: 192, column: 17, scope: !3255)
!3328 = !DILocation(line: 193, column: 19, scope: !3255)
!3329 = !DILocation(line: 200, column: 28, scope: !3255)
!3330 = !DILocation(line: 200, column: 33, scope: !3255)
!3331 = !DILocation(line: 200, column: 25, scope: !3255)
!3332 = !DILocation(line: 223, column: 30, scope: !3255)
!3333 = !DILocation(line: 206, column: 17, scope: !3255)
!3334 = !DILocation(line: 207, column: 19, scope: !3255)
!3335 = !DILocation(line: 216, column: 28, scope: !3255)
!3336 = !DILocation(line: 216, column: 33, scope: !3255)
!3337 = !DILocation(line: 216, column: 25, scope: !3255)
!3338 = !DILocation(line: 223, column: 34, scope: !3255)
!3339 = !DILocation(line: 149, column: 17, scope: !3255)
!3340 = !DILocation(line: 150, column: 19, scope: !3255)
!3341 = !DILocation(line: 147, column: 17, scope: !3255)
!3342 = !DILocation(line: 148, column: 19, scope: !3255)
!3343 = !DILocation(line: 154, column: 28, scope: !3255)
!3344 = !DILocation(line: 154, column: 33, scope: !3255)
!3345 = !DILocation(line: 154, column: 25, scope: !3255)
!3346 = !DILocation(line: 166, column: 17, scope: !3255)
!3347 = !DILocation(line: 167, column: 19, scope: !3255)
!3348 = !DILocation(line: 164, column: 17, scope: !3255)
!3349 = !DILocation(line: 165, column: 19, scope: !3255)
!3350 = !DILocation(line: 170, column: 28, scope: !3255)
!3351 = !DILocation(line: 170, column: 33, scope: !3255)
!3352 = !DILocation(line: 170, column: 25, scope: !3255)
!3353 = !DILocation(line: 225, column: 22, scope: !3255)
!3354 = !DILocation(line: 182, column: 17, scope: !3255)
!3355 = !DILocation(line: 183, column: 19, scope: !3255)
!3356 = !DILocation(line: 180, column: 17, scope: !3255)
!3357 = !DILocation(line: 181, column: 19, scope: !3255)
!3358 = !DILocation(line: 186, column: 28, scope: !3255)
!3359 = !DILocation(line: 186, column: 33, scope: !3255)
!3360 = !DILocation(line: 186, column: 25, scope: !3255)
!3361 = !DILocation(line: 225, column: 26, scope: !3255)
!3362 = !DILocation(line: 198, column: 17, scope: !3255)
!3363 = !DILocation(line: 199, column: 19, scope: !3255)
!3364 = !DILocation(line: 196, column: 17, scope: !3255)
!3365 = !DILocation(line: 197, column: 19, scope: !3255)
!3366 = !DILocation(line: 202, column: 28, scope: !3255)
!3367 = !DILocation(line: 202, column: 33, scope: !3255)
!3368 = !DILocation(line: 202, column: 25, scope: !3255)
!3369 = !DILocation(line: 225, column: 30, scope: !3255)
!3370 = !DILocation(line: 214, column: 17, scope: !3255)
!3371 = !DILocation(line: 215, column: 19, scope: !3255)
!3372 = !DILocation(line: 218, column: 28, scope: !3255)
!3373 = !DILocation(line: 218, column: 33, scope: !3255)
!3374 = !DILocation(line: 218, column: 25, scope: !3255)
!3375 = !DILocation(line: 225, column: 34, scope: !3255)
!3376 = !DILocation(line: 231, column: 22, scope: !3255)
!3377 = !DILocation(line: 231, column: 21, scope: !3255)
!3378 = !DILocation(line: 309, column: 17, scope: !3255)
!3379 = !DILocation(line: 310, column: 19, scope: !3255)
!3380 = !DILocation(line: 171, column: 28, scope: !3255)
!3381 = !DILocation(line: 171, column: 33, scope: !3255)
!3382 = !DILocation(line: 171, column: 25, scope: !3255)
!3383 = !DILocation(line: 156, column: 28, scope: !3255)
!3384 = !DILocation(line: 156, column: 33, scope: !3255)
!3385 = !DILocation(line: 156, column: 25, scope: !3255)
!3386 = !DILocation(line: 172, column: 28, scope: !3255)
!3387 = !DILocation(line: 172, column: 33, scope: !3255)
!3388 = !DILocation(line: 172, column: 25, scope: !3255)
!3389 = !DILocation(line: 227, column: 22, scope: !3255)
!3390 = !DILocation(line: 188, column: 28, scope: !3255)
!3391 = !DILocation(line: 188, column: 33, scope: !3255)
!3392 = !DILocation(line: 188, column: 25, scope: !3255)
!3393 = !DILocation(line: 227, column: 26, scope: !3255)
!3394 = !DILocation(line: 204, column: 28, scope: !3255)
!3395 = !DILocation(line: 204, column: 33, scope: !3255)
!3396 = !DILocation(line: 204, column: 25, scope: !3255)
!3397 = !DILocation(line: 227, column: 30, scope: !3255)
!3398 = !DILocation(line: 220, column: 28, scope: !3255)
!3399 = !DILocation(line: 220, column: 33, scope: !3255)
!3400 = !DILocation(line: 220, column: 25, scope: !3255)
!3401 = !DILocation(line: 227, column: 34, scope: !3255)
!3402 = !DILocation(line: 233, column: 22, scope: !3255)
!3403 = !DILocation(line: 233, column: 21, scope: !3255)
!3404 = !DILocation(line: 303, column: 17, scope: !3255)
!3405 = !DILocation(line: 304, column: 19, scope: !3255)
!3406 = !DILocation(line: 153, column: 28, scope: !3255)
!3407 = !DILocation(line: 153, column: 33, scope: !3255)
!3408 = !DILocation(line: 153, column: 25, scope: !3255)
!3409 = !DILocation(line: 169, column: 28, scope: !3255)
!3410 = !DILocation(line: 169, column: 33, scope: !3255)
!3411 = !DILocation(line: 169, column: 25, scope: !3255)
!3412 = !DILocation(line: 224, column: 22, scope: !3255)
!3413 = !DILocation(line: 185, column: 28, scope: !3255)
!3414 = !DILocation(line: 185, column: 33, scope: !3255)
!3415 = !DILocation(line: 185, column: 25, scope: !3255)
!3416 = !DILocation(line: 224, column: 26, scope: !3255)
!3417 = !DILocation(line: 201, column: 28, scope: !3255)
!3418 = !DILocation(line: 201, column: 33, scope: !3255)
!3419 = !DILocation(line: 201, column: 25, scope: !3255)
!3420 = !DILocation(line: 224, column: 30, scope: !3255)
!3421 = !DILocation(line: 224, column: 34, scope: !3255)
!3422 = !DILocation(line: 155, column: 28, scope: !3255)
!3423 = !DILocation(line: 155, column: 33, scope: !3255)
!3424 = !DILocation(line: 155, column: 25, scope: !3255)
!3425 = !DILocation(line: 226, column: 22, scope: !3255)
!3426 = !DILocation(line: 187, column: 28, scope: !3255)
!3427 = !DILocation(line: 187, column: 33, scope: !3255)
!3428 = !DILocation(line: 187, column: 25, scope: !3255)
!3429 = !DILocation(line: 226, column: 26, scope: !3255)
!3430 = !DILocation(line: 203, column: 28, scope: !3255)
!3431 = !DILocation(line: 203, column: 33, scope: !3255)
!3432 = !DILocation(line: 203, column: 25, scope: !3255)
!3433 = !DILocation(line: 226, column: 30, scope: !3255)
!3434 = !DILocation(line: 219, column: 28, scope: !3255)
!3435 = !DILocation(line: 219, column: 33, scope: !3255)
!3436 = !DILocation(line: 219, column: 25, scope: !3255)
!3437 = !DILocation(line: 226, column: 34, scope: !3255)
!3438 = !DILocation(line: 232, column: 22, scope: !3255)
!3439 = !DILocation(line: 232, column: 21, scope: !3255)
!3440 = !DILocation(line: 301, column: 17, scope: !3255)
!3441 = !DILocation(line: 302, column: 19, scope: !3255)
!3442 = !DILocation(line: 315, column: 28, scope: !3255)
!3443 = !DILocation(line: 315, column: 33, scope: !3255)
!3444 = !DILocation(line: 315, column: 25, scope: !3255)
!3445 = !DILocation(line: 230, column: 22, scope: !3255)
!3446 = !DILocation(line: 230, column: 21, scope: !3255)
!3447 = !DILocation(line: 307, column: 17, scope: !3255)
!3448 = !DILocation(line: 308, column: 19, scope: !3255)
!3449 = !DILocation(line: 314, column: 28, scope: !3255)
!3450 = !DILocation(line: 314, column: 33, scope: !3255)
!3451 = !DILocation(line: 314, column: 25, scope: !3255)
!3452 = !DILocation(line: 234, column: 22, scope: !3255)
!3453 = !DILocation(line: 234, column: 21, scope: !3255)
!3454 = !DILocation(line: 305, column: 17, scope: !3255)
!3455 = !DILocation(line: 306, column: 19, scope: !3255)
!3456 = !DILocation(line: 313, column: 28, scope: !3255)
!3457 = !DILocation(line: 313, column: 33, scope: !3255)
!3458 = !DILocation(line: 313, column: 25, scope: !3255)
!3459 = !DILocation(line: 312, column: 28, scope: !3255)
!3460 = !DILocation(line: 312, column: 33, scope: !3255)
!3461 = !DILocation(line: 312, column: 25, scope: !3255)
!3462 = !DILocation(line: 311, column: 28, scope: !3255)
!3463 = !DILocation(line: 311, column: 33, scope: !3255)
!3464 = !DILocation(line: 311, column: 25, scope: !3255)
!3465 = !DILocation(line: 293, column: 17, scope: !3255)
!3466 = !DILocation(line: 294, column: 19, scope: !3255)
!3467 = !DILocation(line: 287, column: 17, scope: !3255)
!3468 = !DILocation(line: 288, column: 19, scope: !3255)
!3469 = !DILocation(line: 285, column: 17, scope: !3255)
!3470 = !DILocation(line: 286, column: 19, scope: !3255)
!3471 = !DILocation(line: 299, column: 28, scope: !3255)
!3472 = !DILocation(line: 299, column: 33, scope: !3255)
!3473 = !DILocation(line: 299, column: 25, scope: !3255)
!3474 = !DILocation(line: 291, column: 17, scope: !3255)
!3475 = !DILocation(line: 292, column: 19, scope: !3255)
!3476 = !DILocation(line: 298, column: 28, scope: !3255)
!3477 = !DILocation(line: 298, column: 33, scope: !3255)
!3478 = !DILocation(line: 298, column: 25, scope: !3255)
!3479 = !DILocation(line: 289, column: 17, scope: !3255)
!3480 = !DILocation(line: 290, column: 19, scope: !3255)
!3481 = !DILocation(line: 297, column: 28, scope: !3255)
!3482 = !DILocation(line: 297, column: 33, scope: !3255)
!3483 = !DILocation(line: 297, column: 25, scope: !3255)
!3484 = !DILocation(line: 296, column: 28, scope: !3255)
!3485 = !DILocation(line: 296, column: 33, scope: !3255)
!3486 = !DILocation(line: 296, column: 25, scope: !3255)
!3487 = !DILocation(line: 295, column: 28, scope: !3255)
!3488 = !DILocation(line: 295, column: 33, scope: !3255)
!3489 = !DILocation(line: 295, column: 25, scope: !3255)
!3490 = !DILocation(line: 277, column: 17, scope: !3255)
!3491 = !DILocation(line: 278, column: 19, scope: !3255)
!3492 = !DILocation(line: 271, column: 17, scope: !3255)
!3493 = !DILocation(line: 272, column: 19, scope: !3255)
!3494 = !DILocation(line: 269, column: 17, scope: !3255)
!3495 = !DILocation(line: 270, column: 19, scope: !3255)
!3496 = !DILocation(line: 283, column: 28, scope: !3255)
!3497 = !DILocation(line: 283, column: 33, scope: !3255)
!3498 = !DILocation(line: 283, column: 25, scope: !3255)
!3499 = !DILocation(line: 275, column: 17, scope: !3255)
!3500 = !DILocation(line: 276, column: 19, scope: !3255)
!3501 = !DILocation(line: 282, column: 28, scope: !3255)
!3502 = !DILocation(line: 282, column: 33, scope: !3255)
!3503 = !DILocation(line: 282, column: 25, scope: !3255)
!3504 = !DILocation(line: 273, column: 17, scope: !3255)
!3505 = !DILocation(line: 274, column: 19, scope: !3255)
!3506 = !DILocation(line: 281, column: 28, scope: !3255)
!3507 = !DILocation(line: 281, column: 33, scope: !3255)
!3508 = !DILocation(line: 281, column: 25, scope: !3255)
!3509 = !DILocation(line: 280, column: 28, scope: !3255)
!3510 = !DILocation(line: 280, column: 33, scope: !3255)
!3511 = !DILocation(line: 280, column: 25, scope: !3255)
!3512 = !DILocation(line: 279, column: 28, scope: !3255)
!3513 = !DILocation(line: 279, column: 33, scope: !3255)
!3514 = !DILocation(line: 279, column: 25, scope: !3255)
!3515 = !DILocation(line: 261, column: 17, scope: !3255)
!3516 = !DILocation(line: 262, column: 19, scope: !3255)
!3517 = !DILocation(line: 255, column: 17, scope: !3255)
!3518 = !DILocation(line: 256, column: 19, scope: !3255)
!3519 = !DILocation(line: 253, column: 17, scope: !3255)
!3520 = !DILocation(line: 254, column: 19, scope: !3255)
!3521 = !DILocation(line: 267, column: 28, scope: !3255)
!3522 = !DILocation(line: 267, column: 33, scope: !3255)
!3523 = !DILocation(line: 267, column: 25, scope: !3255)
!3524 = !DILocation(line: 259, column: 17, scope: !3255)
!3525 = !DILocation(line: 260, column: 19, scope: !3255)
!3526 = !DILocation(line: 266, column: 28, scope: !3255)
!3527 = !DILocation(line: 266, column: 33, scope: !3255)
!3528 = !DILocation(line: 266, column: 25, scope: !3255)
!3529 = !DILocation(line: 257, column: 17, scope: !3255)
!3530 = !DILocation(line: 258, column: 19, scope: !3255)
!3531 = !DILocation(line: 265, column: 28, scope: !3255)
!3532 = !DILocation(line: 265, column: 33, scope: !3255)
!3533 = !DILocation(line: 265, column: 25, scope: !3255)
!3534 = !DILocation(line: 264, column: 28, scope: !3255)
!3535 = !DILocation(line: 264, column: 33, scope: !3255)
!3536 = !DILocation(line: 264, column: 25, scope: !3255)
!3537 = !DILocation(line: 263, column: 28, scope: !3255)
!3538 = !DILocation(line: 263, column: 33, scope: !3255)
!3539 = !DILocation(line: 263, column: 25, scope: !3255)
!3540 = !DILocation(line: 244, column: 17, scope: !3255)
!3541 = !DILocation(line: 245, column: 19, scope: !3255)
!3542 = !DILocation(line: 238, column: 17, scope: !3255)
!3543 = !DILocation(line: 239, column: 19, scope: !3255)
!3544 = !DILocation(line: 236, column: 17, scope: !3255)
!3545 = !DILocation(line: 251, column: 28, scope: !3255)
!3546 = !DILocation(line: 251, column: 33, scope: !3255)
!3547 = !DILocation(line: 251, column: 25, scope: !3255)
!3548 = !DILocation(line: 242, column: 17, scope: !3255)
!3549 = !DILocation(line: 243, column: 19, scope: !3255)
!3550 = !DILocation(line: 250, column: 28, scope: !3255)
!3551 = !DILocation(line: 250, column: 33, scope: !3255)
!3552 = !DILocation(line: 250, column: 25, scope: !3255)
!3553 = !DILocation(line: 240, column: 17, scope: !3255)
!3554 = !DILocation(line: 241, column: 19, scope: !3255)
!3555 = !DILocation(line: 249, column: 28, scope: !3255)
!3556 = !DILocation(line: 249, column: 33, scope: !3255)
!3557 = !DILocation(line: 249, column: 25, scope: !3255)
!3558 = !DILocation(line: 248, column: 28, scope: !3255)
!3559 = !DILocation(line: 248, column: 33, scope: !3255)
!3560 = !DILocation(line: 248, column: 25, scope: !3255)
!3561 = !DILocation(line: 247, column: 58, scope: !3255)
!3562 = !DILocation(line: 247, column: 30, scope: !3255)
!3563 = !DILocation(line: 246, column: 28, scope: !3255)
!3564 = !DILocation(line: 246, column: 33, scope: !3255)
!3565 = !DILocation(line: 247, column: 17, scope: !3255)
!3566 = !DILocation(line: 126, column: 47, scope: !3217)
!3567 = !DILocation(line: 126, column: 9, scope: !3217)
!3568 = distinct !{!3568, !3218, !3569, !185}
!3569 = !DILocation(line: 316, column: 9, scope: !3214)
!3570 = !DILocation(line: 319, column: 19, scope: !3159)
!3571 = !DILocation(line: 320, column: 9, scope: !3159)
!3572 = !DILocation(line: 320, column: 19, scope: !3159)
!3573 = !DILocation(line: 321, column: 9, scope: !3159)
!3574 = !DILocation(line: 321, column: 19, scope: !3159)
!3575 = !DILocation(line: 322, column: 9, scope: !3159)
!3576 = !DILocation(line: 322, column: 19, scope: !3159)
!3577 = !DILocation(line: 323, column: 9, scope: !3159)
!3578 = !DILocation(line: 323, column: 19, scope: !3159)
!3579 = !DILocation(line: 324, column: 9, scope: !3159)
!3580 = !DILocation(line: 324, column: 19, scope: !3159)
!3581 = !DILocation(line: 325, column: 9, scope: !3159)
!3582 = !DILocation(line: 325, column: 19, scope: !3159)
!3583 = !DILocation(line: 326, column: 9, scope: !3159)
!3584 = !DILocation(line: 326, column: 19, scope: !3159)
!3585 = !DILocation(line: 327, column: 9, scope: !3159)
!3586 = !DILocation(line: 327, column: 19, scope: !3159)
!3587 = !DILocation(line: 328, column: 9, scope: !3159)
!3588 = !DILocation(line: 328, column: 19, scope: !3159)
!3589 = !DILocation(line: 329, column: 9, scope: !3159)
!3590 = !DILocation(line: 329, column: 19, scope: !3159)
!3591 = !DILocation(line: 330, column: 9, scope: !3159)
!3592 = !DILocation(line: 330, column: 19, scope: !3159)
!3593 = !DILocation(line: 331, column: 9, scope: !3159)
!3594 = !DILocation(line: 331, column: 19, scope: !3159)
!3595 = !DILocation(line: 332, column: 9, scope: !3159)
!3596 = !DILocation(line: 332, column: 19, scope: !3159)
!3597 = !DILocation(line: 333, column: 9, scope: !3159)
!3598 = !DILocation(line: 333, column: 19, scope: !3159)
!3599 = !DILocation(line: 334, column: 9, scope: !3159)
!3600 = !DILocation(line: 334, column: 19, scope: !3159)
!3601 = !DILocation(line: 335, column: 9, scope: !3159)
!3602 = !DILocation(line: 335, column: 19, scope: !3159)
!3603 = !DILocation(line: 336, column: 9, scope: !3159)
!3604 = !DILocation(line: 336, column: 19, scope: !3159)
!3605 = !DILocation(line: 337, column: 9, scope: !3159)
!3606 = !DILocation(line: 337, column: 19, scope: !3159)
!3607 = !DILocation(line: 338, column: 9, scope: !3159)
!3608 = !DILocation(line: 338, column: 19, scope: !3159)
!3609 = !DILocation(line: 339, column: 9, scope: !3159)
!3610 = !DILocation(line: 339, column: 19, scope: !3159)
!3611 = !DILocation(line: 340, column: 9, scope: !3159)
!3612 = !DILocation(line: 340, column: 19, scope: !3159)
!3613 = !DILocation(line: 341, column: 9, scope: !3159)
!3614 = !DILocation(line: 341, column: 19, scope: !3159)
!3615 = !DILocation(line: 342, column: 9, scope: !3159)
!3616 = !DILocation(line: 342, column: 19, scope: !3159)
!3617 = !DILocation(line: 343, column: 9, scope: !3159)
!3618 = !DILocation(line: 343, column: 19, scope: !3159)
!3619 = !DILocation(line: 344, column: 1, scope: !3159)
!3620 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !3068, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3621 = !DILocalVariable(name: "state", arg: 1, scope: !3620, file: !27, line: 550, type: !311)
!3622 = !DILocation(line: 0, scope: !3620)
!3623 = !DILocation(line: 552, column: 36, scope: !3620)
!3624 = !DILocalVariable(name: "s", arg: 1, scope: !3625, file: !27, line: 405, type: !352)
!3625 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !3626, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3626 = !DISubroutineType(types: !3627)
!3627 = !{null, !352, !42, !42, !61}
!3628 = !DILocation(line: 0, scope: !3625, inlinedAt: !3629)
!3629 = distinct !DILocation(line: 552, column: 3, scope: !3620)
!3630 = !DILocalVariable(name: "pos", arg: 2, scope: !3625, file: !27, line: 405, type: !42)
!3631 = !DILocalVariable(name: "r", arg: 3, scope: !3625, file: !27, line: 405, type: !42)
!3632 = !DILocalVariable(name: "p", arg: 4, scope: !3625, file: !27, line: 405, type: !61)
!3633 = !DILocation(line: 407, column: 31, scope: !3625, inlinedAt: !3629)
!3634 = !DILocation(line: 407, column: 27, scope: !3625, inlinedAt: !3629)
!3635 = !DILocation(line: 407, column: 8, scope: !3625, inlinedAt: !3629)
!3636 = !DILocation(line: 407, column: 3, scope: !3625, inlinedAt: !3629)
!3637 = !DILocation(line: 407, column: 12, scope: !3625, inlinedAt: !3629)
!3638 = !DILocation(line: 408, column: 3, scope: !3625, inlinedAt: !3629)
!3639 = !DILocation(line: 408, column: 12, scope: !3625, inlinedAt: !3629)
!3640 = !DILocation(line: 553, column: 10, scope: !3620)
!3641 = !DILocation(line: 553, column: 14, scope: !3620)
!3642 = !DILocation(line: 554, column: 1, scope: !3620)
!3643 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !342, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3644 = !DILocalVariable(name: "out", arg: 1, scope: !3643, file: !27, line: 566, type: !60)
!3645 = !DILocation(line: 0, scope: !3643)
!3646 = !DILocalVariable(name: "outlen", arg: 2, scope: !3643, file: !27, line: 566, type: !163)
!3647 = !DILocalVariable(name: "state", arg: 3, scope: !3643, file: !27, line: 566, type: !311)
!3648 = !DILocation(line: 568, column: 61, scope: !3643)
!3649 = !DILocation(line: 0, scope: !613, inlinedAt: !3650)
!3650 = distinct !DILocation(line: 568, column: 16, scope: !3643)
!3651 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3650)
!3652 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3650)
!3653 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3650)
!3654 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3650)
!3655 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3650)
!3656 = !DILocation(line: 439, scope: !631, inlinedAt: !3650)
!3657 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3650)
!3658 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3650)
!3659 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3650)
!3660 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3650)
!3661 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3650)
!3662 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3650)
!3663 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3650)
!3664 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3650)
!3665 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3650)
!3666 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3650)
!3667 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3650)
!3668 = distinct !{!3668, !3659, !3669, !185}
!3669 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3650)
!3670 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3650)
!3671 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3650)
!3672 = distinct !{!3672, !3651, !3673, !185}
!3673 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3650)
!3674 = !DILocation(line: 568, column: 10, scope: !3643)
!3675 = !DILocation(line: 568, column: 14, scope: !3643)
!3676 = !DILocation(line: 569, column: 1, scope: !3643)
!3677 = !DILocation(line: 0, scope: !308)
!3678 = !DILocation(line: 582, column: 3, scope: !308)
!3679 = !DILocation(line: 583, column: 10, scope: !308)
!3680 = !DILocation(line: 583, column: 14, scope: !308)
!3681 = !DILocation(line: 584, column: 1, scope: !308)
!3682 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !3683, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3683 = !DISubroutineType(types: !3684)
!3684 = !{null, !352, !42, !64, !163, !61}
!3685 = !DILocalVariable(name: "s", arg: 1, scope: !3682, file: !27, line: 461, type: !352)
!3686 = !DILocation(line: 0, scope: !3682)
!3687 = !DILocalVariable(name: "r", arg: 2, scope: !3682, file: !27, line: 462, type: !42)
!3688 = !DILocalVariable(name: "in", arg: 3, scope: !3682, file: !27, line: 463, type: !64)
!3689 = !DILocalVariable(name: "inlen", arg: 4, scope: !3682, file: !27, line: 464, type: !163)
!3690 = !DILocalVariable(name: "p", arg: 5, scope: !3682, file: !27, line: 465, type: !61)
!3691 = !DILocalVariable(name: "i", scope: !3682, file: !27, line: 467, type: !42)
!3692 = !DILocation(line: 469, column: 7, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3682, file: !27, line: 469, column: 3)
!3694 = !DILocation(line: 469, scope: !3693)
!3695 = !DILocation(line: 469, column: 12, scope: !3696)
!3696 = distinct !DILexicalBlock(scope: !3693, file: !27, line: 469, column: 3)
!3697 = !DILocation(line: 469, column: 3, scope: !3693)
!3698 = !DILocation(line: 472, column: 3, scope: !3682)
!3699 = !DILocation(line: 470, column: 5, scope: !3696)
!3700 = !DILocation(line: 470, column: 10, scope: !3696)
!3701 = !DILocation(line: 469, column: 17, scope: !3696)
!3702 = !DILocation(line: 469, column: 3, scope: !3696)
!3703 = distinct !{!3703, !3697, !3704, !185}
!3704 = !DILocation(line: 470, column: 12, scope: !3693)
!3705 = !DILocation(line: 472, column: 15, scope: !3682)
!3706 = !DILocation(line: 473, column: 5, scope: !3707)
!3707 = distinct !DILexicalBlock(scope: !3708, file: !27, line: 473, column: 5)
!3708 = distinct !DILexicalBlock(scope: !3682, file: !27, line: 472, column: 21)
!3709 = !DILocation(line: 480, column: 3, scope: !3710)
!3710 = distinct !DILexicalBlock(scope: !3682, file: !27, line: 480, column: 3)
!3711 = !DILocation(line: 473, scope: !3707)
!3712 = !DILocation(line: 473, column: 14, scope: !3713)
!3713 = distinct !DILexicalBlock(scope: !3707, file: !27, line: 473, column: 5)
!3714 = !DILocation(line: 474, column: 26, scope: !3713)
!3715 = !DILocation(line: 474, column: 24, scope: !3713)
!3716 = !DILocalVariable(name: "x", arg: 1, scope: !3717, file: !27, line: 22, type: !64)
!3717 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !3718, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3718 = !DISubroutineType(types: !3719)
!3719 = !{!23, !64}
!3720 = !DILocation(line: 0, scope: !3717, inlinedAt: !3721)
!3721 = distinct !DILocation(line: 474, column: 15, scope: !3713)
!3722 = !DILocalVariable(name: "r", scope: !3717, file: !27, line: 24, type: !23)
!3723 = !DILocalVariable(name: "i", scope: !3717, file: !27, line: 23, type: !42)
!3724 = !DILocation(line: 26, column: 7, scope: !3725, inlinedAt: !3721)
!3725 = distinct !DILexicalBlock(scope: !3717, file: !27, line: 26, column: 3)
!3726 = !DILocation(line: 26, scope: !3725, inlinedAt: !3721)
!3727 = !DILocation(line: 26, column: 12, scope: !3728, inlinedAt: !3721)
!3728 = distinct !DILexicalBlock(scope: !3725, file: !27, line: 26, column: 3)
!3729 = !DILocation(line: 26, column: 3, scope: !3725, inlinedAt: !3721)
!3730 = !DILocation(line: 27, column: 20, scope: !3728, inlinedAt: !3721)
!3731 = !DILocation(line: 27, column: 10, scope: !3728, inlinedAt: !3721)
!3732 = !DILocation(line: 27, column: 29, scope: !3728, inlinedAt: !3721)
!3733 = !DILocation(line: 27, column: 25, scope: !3728, inlinedAt: !3721)
!3734 = !DILocation(line: 27, column: 7, scope: !3728, inlinedAt: !3721)
!3735 = !DILocation(line: 26, column: 16, scope: !3728, inlinedAt: !3721)
!3736 = !DILocation(line: 26, column: 3, scope: !3728, inlinedAt: !3721)
!3737 = distinct !{!3737, !3729, !3738, !185}
!3738 = !DILocation(line: 27, column: 30, scope: !3725, inlinedAt: !3721)
!3739 = !DILocation(line: 474, column: 7, scope: !3713)
!3740 = !DILocation(line: 474, column: 12, scope: !3713)
!3741 = !DILocation(line: 473, column: 20, scope: !3713)
!3742 = !DILocation(line: 473, column: 5, scope: !3713)
!3743 = distinct !{!3743, !3706, !3744, !185}
!3744 = !DILocation(line: 474, column: 28, scope: !3707)
!3745 = !DILocation(line: 475, column: 8, scope: !3708)
!3746 = !DILocation(line: 476, column: 11, scope: !3708)
!3747 = !DILocation(line: 477, column: 5, scope: !3708)
!3748 = distinct !{!3748, !3698, !3749, !185}
!3749 = !DILocation(line: 478, column: 3, scope: !3682)
!3750 = !DILocation(line: 480, scope: !3710)
!3751 = !DILocation(line: 480, column: 12, scope: !3752)
!3752 = distinct !DILexicalBlock(scope: !3710, file: !27, line: 480, column: 3)
!3753 = !DILocation(line: 481, column: 25, scope: !3752)
!3754 = !DILocation(line: 481, column: 15, scope: !3752)
!3755 = !DILocation(line: 481, column: 35, scope: !3752)
!3756 = !DILocation(line: 481, column: 31, scope: !3752)
!3757 = !DILocation(line: 481, column: 8, scope: !3752)
!3758 = !DILocation(line: 481, column: 5, scope: !3752)
!3759 = !DILocation(line: 481, column: 12, scope: !3752)
!3760 = !DILocation(line: 480, column: 20, scope: !3752)
!3761 = !DILocation(line: 480, column: 3, scope: !3752)
!3762 = distinct !{!3762, !3709, !3763, !185}
!3763 = !DILocation(line: 481, column: 40, scope: !3710)
!3764 = !DILocation(line: 483, column: 13, scope: !3682)
!3765 = !DILocation(line: 483, column: 29, scope: !3682)
!3766 = !DILocation(line: 483, column: 25, scope: !3682)
!3767 = !DILocation(line: 483, column: 6, scope: !3682)
!3768 = !DILocation(line: 483, column: 3, scope: !3682)
!3769 = !DILocation(line: 483, column: 10, scope: !3682)
!3770 = !DILocation(line: 484, column: 7, scope: !3682)
!3771 = !DILocation(line: 484, column: 10, scope: !3682)
!3772 = !DILocation(line: 484, column: 3, scope: !3682)
!3773 = !DILocation(line: 484, column: 14, scope: !3682)
!3774 = !DILocation(line: 485, column: 1, scope: !3682)
!3775 = !DILocation(line: 0, scope: !341)
!3776 = !DILocation(line: 0, scope: !349, inlinedAt: !3777)
!3777 = distinct !DILocation(line: 600, column: 3, scope: !341)
!3778 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3777)
!3779 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3777)
!3780 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3777)
!3781 = !DILocation(line: 509, scope: !363, inlinedAt: !3777)
!3782 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3777)
!3783 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3777)
!3784 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3777)
!3785 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3777)
!3786 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3777)
!3787 = !DILocation(line: 0, scope: !372, inlinedAt: !3788)
!3788 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3777)
!3789 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3788)
!3790 = !DILocation(line: 43, scope: !380, inlinedAt: !3788)
!3791 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3788)
!3792 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3788)
!3793 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3788)
!3794 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3788)
!3795 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3788)
!3796 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3788)
!3797 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3788)
!3798 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3788)
!3799 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3788)
!3800 = distinct !{!3800, !3792, !3801, !185}
!3801 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3788)
!3802 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3777)
!3803 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3777)
!3804 = distinct !{!3804, !3783, !3805, !185}
!3805 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3777)
!3806 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3777)
!3807 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3777)
!3808 = distinct !{!3808, !3778, !3809, !185}
!3809 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3777)
!3810 = !DILocation(line: 601, column: 1, scope: !341)
!3811 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !3068, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3812 = !DILocalVariable(name: "state", arg: 1, scope: !3811, file: !27, line: 610, type: !311)
!3813 = !DILocation(line: 0, scope: !3811)
!3814 = !DILocation(line: 0, scope: !3073, inlinedAt: !3815)
!3815 = distinct !DILocation(line: 612, column: 3, scope: !3811)
!3816 = !DILocation(line: 356, column: 7, scope: !3080, inlinedAt: !3815)
!3817 = !DILocation(line: 356, scope: !3080, inlinedAt: !3815)
!3818 = !DILocation(line: 356, column: 12, scope: !3083, inlinedAt: !3815)
!3819 = !DILocation(line: 356, column: 3, scope: !3080, inlinedAt: !3815)
!3820 = !DILocation(line: 357, column: 5, scope: !3083, inlinedAt: !3815)
!3821 = !DILocation(line: 357, column: 10, scope: !3083, inlinedAt: !3815)
!3822 = !DILocation(line: 356, column: 17, scope: !3083, inlinedAt: !3815)
!3823 = !DILocation(line: 356, column: 3, scope: !3083, inlinedAt: !3815)
!3824 = distinct !{!3824, !3819, !3825, !185}
!3825 = !DILocation(line: 357, column: 12, scope: !3080, inlinedAt: !3815)
!3826 = !DILocation(line: 613, column: 10, scope: !3811)
!3827 = !DILocation(line: 613, column: 14, scope: !3811)
!3828 = !DILocation(line: 614, column: 1, scope: !3811)
!3829 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !309, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3830 = !DILocalVariable(name: "state", arg: 1, scope: !3829, file: !27, line: 625, type: !311)
!3831 = !DILocation(line: 0, scope: !3829)
!3832 = !DILocalVariable(name: "in", arg: 2, scope: !3829, file: !27, line: 625, type: !64)
!3833 = !DILocalVariable(name: "inlen", arg: 3, scope: !3829, file: !27, line: 625, type: !163)
!3834 = !DILocation(line: 627, column: 47, scope: !3829)
!3835 = !DILocation(line: 627, column: 16, scope: !3829)
!3836 = !DILocation(line: 627, column: 10, scope: !3829)
!3837 = !DILocation(line: 627, column: 14, scope: !3829)
!3838 = !DILocation(line: 628, column: 1, scope: !3829)
!3839 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !3068, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3840 = !DILocalVariable(name: "state", arg: 1, scope: !3839, file: !27, line: 637, type: !311)
!3841 = !DILocation(line: 0, scope: !3839)
!3842 = !DILocation(line: 639, column: 36, scope: !3839)
!3843 = !DILocation(line: 0, scope: !3625, inlinedAt: !3844)
!3844 = distinct !DILocation(line: 639, column: 3, scope: !3839)
!3845 = !DILocation(line: 407, column: 31, scope: !3625, inlinedAt: !3844)
!3846 = !DILocation(line: 407, column: 27, scope: !3625, inlinedAt: !3844)
!3847 = !DILocation(line: 407, column: 8, scope: !3625, inlinedAt: !3844)
!3848 = !DILocation(line: 407, column: 3, scope: !3625, inlinedAt: !3844)
!3849 = !DILocation(line: 407, column: 12, scope: !3625, inlinedAt: !3844)
!3850 = !DILocation(line: 408, column: 3, scope: !3625, inlinedAt: !3844)
!3851 = !DILocation(line: 408, column: 12, scope: !3625, inlinedAt: !3844)
!3852 = !DILocation(line: 640, column: 10, scope: !3839)
!3853 = !DILocation(line: 640, column: 14, scope: !3839)
!3854 = !DILocation(line: 641, column: 1, scope: !3839)
!3855 = !DILocation(line: 0, scope: !606)
!3856 = !DILocation(line: 655, column: 61, scope: !606)
!3857 = !DILocation(line: 0, scope: !613, inlinedAt: !3858)
!3858 = distinct !DILocation(line: 655, column: 16, scope: !606)
!3859 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3858)
!3860 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3858)
!3861 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3858)
!3862 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3858)
!3863 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3858)
!3864 = !DILocation(line: 439, scope: !631, inlinedAt: !3858)
!3865 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3858)
!3866 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3858)
!3867 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3858)
!3868 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3858)
!3869 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3858)
!3870 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3858)
!3871 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3858)
!3872 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3858)
!3873 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3858)
!3874 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3858)
!3875 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3858)
!3876 = distinct !{!3876, !3867, !3877, !185}
!3877 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3858)
!3878 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3858)
!3879 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3858)
!3880 = distinct !{!3880, !3859, !3881, !185}
!3881 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3858)
!3882 = !DILocation(line: 655, column: 10, scope: !606)
!3883 = !DILocation(line: 655, column: 14, scope: !606)
!3884 = !DILocation(line: 656, column: 1, scope: !606)
!3885 = !DILocation(line: 0, scope: !577)
!3886 = !DILocation(line: 669, column: 3, scope: !577)
!3887 = !DILocation(line: 670, column: 10, scope: !577)
!3888 = !DILocation(line: 670, column: 14, scope: !577)
!3889 = !DILocation(line: 671, column: 1, scope: !577)
!3890 = !DILocation(line: 0, scope: !598)
!3891 = !DILocation(line: 0, scope: !349, inlinedAt: !3892)
!3892 = distinct !DILocation(line: 687, column: 3, scope: !598)
!3893 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3892)
!3894 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3892)
!3895 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3892)
!3896 = !DILocation(line: 509, scope: !363, inlinedAt: !3892)
!3897 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3892)
!3898 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3892)
!3899 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3892)
!3900 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3892)
!3901 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3892)
!3902 = !DILocation(line: 0, scope: !372, inlinedAt: !3903)
!3903 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3892)
!3904 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3903)
!3905 = !DILocation(line: 43, scope: !380, inlinedAt: !3903)
!3906 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3903)
!3907 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3903)
!3908 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3903)
!3909 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3903)
!3910 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3903)
!3911 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3903)
!3912 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3903)
!3913 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3903)
!3914 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3903)
!3915 = distinct !{!3915, !3907, !3916, !185}
!3916 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3903)
!3917 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3892)
!3918 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3892)
!3919 = distinct !{!3919, !3898, !3920, !185}
!3920 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3892)
!3921 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3892)
!3922 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3892)
!3923 = distinct !{!3923, !3893, !3924, !185}
!3924 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3892)
!3925 = !DILocation(line: 688, column: 1, scope: !598)
!3926 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !580, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3927 = !DILocalVariable(name: "out", arg: 1, scope: !3926, file: !27, line: 700, type: !60)
!3928 = !DILocation(line: 0, scope: !3926)
!3929 = !DILocalVariable(name: "outlen", arg: 2, scope: !3926, file: !27, line: 700, type: !163)
!3930 = !DILocalVariable(name: "in", arg: 3, scope: !3926, file: !27, line: 700, type: !64)
!3931 = !DILocalVariable(name: "inlen", arg: 4, scope: !3926, file: !27, line: 700, type: !163)
!3932 = !DILocalVariable(name: "state", scope: !3926, file: !27, line: 703, type: !312)
!3933 = !DILocation(line: 703, column: 16, scope: !3926)
!3934 = !DILocation(line: 0, scope: !308, inlinedAt: !3935)
!3935 = distinct !DILocation(line: 705, column: 3, scope: !3926)
!3936 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !3935)
!3937 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !3935)
!3938 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !3935)
!3939 = !DILocation(line: 706, column: 19, scope: !3926)
!3940 = !DILocalVariable(name: "nblocks", scope: !3926, file: !27, line: 702, type: !163)
!3941 = !DILocation(line: 0, scope: !341, inlinedAt: !3942)
!3942 = distinct !DILocation(line: 707, column: 3, scope: !3926)
!3943 = !DILocation(line: 0, scope: !349, inlinedAt: !3944)
!3944 = distinct !DILocation(line: 600, column: 3, scope: !341, inlinedAt: !3942)
!3945 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3944)
!3946 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3944)
!3947 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3944)
!3948 = !DILocation(line: 509, scope: !363, inlinedAt: !3944)
!3949 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3944)
!3950 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3944)
!3951 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3944)
!3952 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3944)
!3953 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3944)
!3954 = !DILocation(line: 0, scope: !372, inlinedAt: !3955)
!3955 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3944)
!3956 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3955)
!3957 = !DILocation(line: 43, scope: !380, inlinedAt: !3955)
!3958 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3955)
!3959 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3955)
!3960 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3955)
!3961 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3955)
!3962 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3955)
!3963 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3955)
!3964 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3955)
!3965 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3955)
!3966 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3955)
!3967 = distinct !{!3967, !3959, !3968, !185}
!3968 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3955)
!3969 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3944)
!3970 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3944)
!3971 = distinct !{!3971, !3950, !3972, !185}
!3972 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3944)
!3973 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3944)
!3974 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3944)
!3975 = distinct !{!3975, !3945, !3976, !185}
!3976 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3944)
!3977 = !DILocation(line: 708, column: 20, scope: !3926)
!3978 = !DILocation(line: 708, column: 10, scope: !3926)
!3979 = !DILocation(line: 709, column: 17, scope: !3926)
!3980 = !DILocation(line: 709, column: 7, scope: !3926)
!3981 = !DILocation(line: 0, scope: !3643, inlinedAt: !3982)
!3982 = distinct !DILocation(line: 710, column: 3, scope: !3926)
!3983 = !DILocation(line: 568, column: 61, scope: !3643, inlinedAt: !3982)
!3984 = !DILocation(line: 0, scope: !613, inlinedAt: !3985)
!3985 = distinct !DILocation(line: 568, column: 16, scope: !3643, inlinedAt: !3982)
!3986 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3985)
!3987 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3985)
!3988 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3985)
!3989 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3985)
!3990 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3985)
!3991 = !DILocation(line: 439, scope: !631, inlinedAt: !3985)
!3992 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3985)
!3993 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3985)
!3994 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3985)
!3995 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3985)
!3996 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3985)
!3997 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3985)
!3998 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3985)
!3999 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3985)
!4000 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3985)
!4001 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3985)
!4002 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3985)
!4003 = distinct !{!4003, !3994, !4004, !185}
!4004 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3985)
!4005 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3985)
!4006 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3985)
!4007 = distinct !{!4007, !3986, !4008, !185}
!4008 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3985)
!4009 = !DILocation(line: 568, column: 10, scope: !3643, inlinedAt: !3982)
!4010 = !DILocation(line: 568, column: 14, scope: !3643, inlinedAt: !3982)
!4011 = !DILocation(line: 711, column: 1, scope: !3926)
!4012 = !DILocation(line: 0, scope: !579)
!4013 = !DILocation(line: 726, column: 16, scope: !579)
!4014 = !DILocation(line: 0, scope: !577, inlinedAt: !4015)
!4015 = distinct !DILocation(line: 728, column: 3, scope: !579)
!4016 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !4015)
!4017 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !4015)
!4018 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !4015)
!4019 = !DILocation(line: 729, column: 19, scope: !579)
!4020 = !DILocation(line: 0, scope: !598, inlinedAt: !4021)
!4021 = distinct !DILocation(line: 730, column: 3, scope: !579)
!4022 = !DILocation(line: 0, scope: !349, inlinedAt: !4023)
!4023 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !4021)
!4024 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !4023)
!4025 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !4023)
!4026 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !4023)
!4027 = !DILocation(line: 509, scope: !363, inlinedAt: !4023)
!4028 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !4023)
!4029 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !4023)
!4030 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !4023)
!4031 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !4023)
!4032 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !4023)
!4033 = !DILocation(line: 0, scope: !372, inlinedAt: !4034)
!4034 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !4023)
!4035 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4034)
!4036 = !DILocation(line: 43, scope: !380, inlinedAt: !4034)
!4037 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4034)
!4038 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4034)
!4039 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4034)
!4040 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4034)
!4041 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4034)
!4042 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4034)
!4043 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4034)
!4044 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4034)
!4045 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4034)
!4046 = distinct !{!4046, !4038, !4047, !185}
!4047 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4034)
!4048 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !4023)
!4049 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !4023)
!4050 = distinct !{!4050, !4029, !4051, !185}
!4051 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !4023)
!4052 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !4023)
!4053 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !4023)
!4054 = distinct !{!4054, !4024, !4055, !185}
!4055 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !4023)
!4056 = !DILocation(line: 731, column: 20, scope: !579)
!4057 = !DILocation(line: 731, column: 10, scope: !579)
!4058 = !DILocation(line: 732, column: 17, scope: !579)
!4059 = !DILocation(line: 732, column: 7, scope: !579)
!4060 = !DILocation(line: 0, scope: !606, inlinedAt: !4061)
!4061 = distinct !DILocation(line: 733, column: 3, scope: !579)
!4062 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !4061)
!4063 = !DILocation(line: 0, scope: !613, inlinedAt: !4064)
!4064 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !4061)
!4065 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !4064)
!4066 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !4064)
!4067 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !4064)
!4068 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !4064)
!4069 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !4064)
!4070 = !DILocation(line: 439, scope: !631, inlinedAt: !4064)
!4071 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !4064)
!4072 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !4064)
!4073 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !4064)
!4074 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !4064)
!4075 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !4064)
!4076 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !4064)
!4077 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !4064)
!4078 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !4064)
!4079 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !4064)
!4080 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !4064)
!4081 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !4064)
!4082 = distinct !{!4082, !4073, !4083, !185}
!4083 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !4064)
!4084 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !4064)
!4085 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !4064)
!4086 = distinct !{!4086, !4065, !4087, !185}
!4087 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !4064)
!4088 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !4061)
!4089 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !4061)
!4090 = !DILocation(line: 734, column: 1, scope: !579)
!4091 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !4092, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4092 = !DISubroutineType(types: !4093)
!4093 = !{null, !60, !64, !163}
!4094 = !DILocalVariable(name: "h", arg: 1, scope: !4091, file: !27, line: 745, type: !60)
!4095 = !DILocation(line: 0, scope: !4091)
!4096 = !DILocalVariable(name: "in", arg: 2, scope: !4091, file: !27, line: 745, type: !64)
!4097 = !DILocalVariable(name: "inlen", arg: 3, scope: !4091, file: !27, line: 745, type: !163)
!4098 = !DILocalVariable(name: "s", scope: !4091, file: !27, line: 748, type: !258)
!4099 = !DILocation(line: 748, column: 12, scope: !4091)
!4100 = !DILocation(line: 750, column: 3, scope: !4091)
!4101 = !DILocation(line: 751, column: 3, scope: !4091)
!4102 = !DILocalVariable(name: "i", scope: !4091, file: !27, line: 747, type: !42)
!4103 = !DILocation(line: 752, column: 7, scope: !4104)
!4104 = distinct !DILexicalBlock(scope: !4091, file: !27, line: 752, column: 3)
!4105 = !DILocation(line: 752, scope: !4104)
!4106 = !DILocation(line: 752, column: 12, scope: !4107)
!4107 = distinct !DILexicalBlock(scope: !4104, file: !27, line: 752, column: 3)
!4108 = !DILocation(line: 752, column: 3, scope: !4104)
!4109 = !DILocation(line: 753, column: 16, scope: !4107)
!4110 = !DILocation(line: 753, column: 14, scope: !4107)
!4111 = !DILocation(line: 753, column: 19, scope: !4107)
!4112 = !DILocation(line: 0, scope: !372, inlinedAt: !4113)
!4113 = distinct !DILocation(line: 753, column: 5, scope: !4107)
!4114 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4113)
!4115 = !DILocation(line: 43, scope: !380, inlinedAt: !4113)
!4116 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4113)
!4117 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4113)
!4118 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4113)
!4119 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4113)
!4120 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4113)
!4121 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4113)
!4122 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4113)
!4123 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4113)
!4124 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4113)
!4125 = distinct !{!4125, !4117, !4126, !185}
!4126 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4113)
!4127 = !DILocation(line: 752, column: 16, scope: !4107)
!4128 = !DILocation(line: 752, column: 3, scope: !4107)
!4129 = distinct !{!4129, !4108, !4130, !185}
!4130 = !DILocation(line: 753, column: 23, scope: !4104)
!4131 = !DILocation(line: 754, column: 1, scope: !4091)
!4132 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !4092, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4133 = !DILocalVariable(name: "h", arg: 1, scope: !4132, file: !27, line: 765, type: !60)
!4134 = !DILocation(line: 0, scope: !4132)
!4135 = !DILocalVariable(name: "in", arg: 2, scope: !4132, file: !27, line: 765, type: !64)
!4136 = !DILocalVariable(name: "inlen", arg: 3, scope: !4132, file: !27, line: 765, type: !163)
!4137 = !DILocalVariable(name: "s", scope: !4132, file: !27, line: 768, type: !258)
!4138 = !DILocation(line: 768, column: 12, scope: !4132)
!4139 = !DILocation(line: 770, column: 3, scope: !4132)
!4140 = !DILocation(line: 771, column: 3, scope: !4132)
!4141 = !DILocalVariable(name: "i", scope: !4132, file: !27, line: 767, type: !42)
!4142 = !DILocation(line: 772, column: 7, scope: !4143)
!4143 = distinct !DILexicalBlock(scope: !4132, file: !27, line: 772, column: 3)
!4144 = !DILocation(line: 772, scope: !4143)
!4145 = !DILocation(line: 772, column: 12, scope: !4146)
!4146 = distinct !DILexicalBlock(scope: !4143, file: !27, line: 772, column: 3)
!4147 = !DILocation(line: 772, column: 3, scope: !4143)
!4148 = !DILocation(line: 773, column: 16, scope: !4146)
!4149 = !DILocation(line: 773, column: 14, scope: !4146)
!4150 = !DILocation(line: 773, column: 19, scope: !4146)
!4151 = !DILocation(line: 0, scope: !372, inlinedAt: !4152)
!4152 = distinct !DILocation(line: 773, column: 5, scope: !4146)
!4153 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4152)
!4154 = !DILocation(line: 43, scope: !380, inlinedAt: !4152)
!4155 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4152)
!4156 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4152)
!4157 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4152)
!4158 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4152)
!4159 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4152)
!4160 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4152)
!4161 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4152)
!4162 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4152)
!4163 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4152)
!4164 = distinct !{!4164, !4156, !4165, !185}
!4165 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4152)
!4166 = !DILocation(line: 772, column: 16, scope: !4146)
!4167 = !DILocation(line: 772, column: 3, scope: !4146)
!4168 = distinct !{!4168, !4147, !4169, !185}
!4169 = !DILocation(line: 773, column: 23, scope: !4143)
!4170 = !DILocation(line: 774, column: 1, scope: !4132)
!4171 = !DILocation(line: 0, scope: !282)
!4172 = !DILocation(line: 23, column: 11, scope: !282)
!4173 = !DILocation(line: 25, column: 3, scope: !282)
!4174 = !DILocation(line: 26, column: 3, scope: !282)
!4175 = !DILocation(line: 26, column: 29, scope: !282)
!4176 = !DILocation(line: 27, column: 3, scope: !282)
!4177 = !DILocation(line: 27, column: 29, scope: !282)
!4178 = !DILocation(line: 0, scope: !308, inlinedAt: !4179)
!4179 = distinct !DILocation(line: 29, column: 3, scope: !282)
!4180 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !4179)
!4181 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !4179)
!4182 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !4179)
!4183 = !DILocation(line: 30, column: 1, scope: !282)
!4184 = !DILocation(line: 0, scope: !560)
!4185 = !DILocation(line: 45, column: 11, scope: !560)
!4186 = !DILocation(line: 47, column: 3, scope: !560)
!4187 = !DILocation(line: 48, column: 3, scope: !560)
!4188 = !DILocation(line: 48, column: 26, scope: !560)
!4189 = !DILocation(line: 50, column: 3, scope: !560)
!4190 = !DILocation(line: 51, column: 1, scope: !560)
!4191 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !283, file: !283, line: 64, type: !1519, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!4192 = !DILocalVariable(name: "out", arg: 1, scope: !4191, file: !283, line: 64, type: !60)
!4193 = !DILocation(line: 0, scope: !4191)
!4194 = !DILocalVariable(name: "key", arg: 2, scope: !4191, file: !283, line: 64, type: !64)
!4195 = !DILocalVariable(name: "input", arg: 3, scope: !4191, file: !283, line: 64, type: !64)
!4196 = !DILocalVariable(name: "s", scope: !4191, file: !283, line: 66, type: !287)
!4197 = !DILocation(line: 66, column: 16, scope: !4191)
!4198 = !DILocation(line: 0, scope: !3811, inlinedAt: !4199)
!4199 = distinct !DILocation(line: 68, column: 3, scope: !4191)
!4200 = !DILocation(line: 0, scope: !3073, inlinedAt: !4201)
!4201 = distinct !DILocation(line: 612, column: 3, scope: !3811, inlinedAt: !4199)
!4202 = !DILocation(line: 356, column: 7, scope: !3080, inlinedAt: !4201)
!4203 = !DILocation(line: 356, scope: !3080, inlinedAt: !4201)
!4204 = !DILocation(line: 356, column: 12, scope: !3083, inlinedAt: !4201)
!4205 = !DILocation(line: 356, column: 3, scope: !3080, inlinedAt: !4201)
!4206 = !DILocation(line: 357, column: 5, scope: !3083, inlinedAt: !4201)
!4207 = !DILocation(line: 357, column: 10, scope: !3083, inlinedAt: !4201)
!4208 = !DILocation(line: 356, column: 17, scope: !3083, inlinedAt: !4201)
!4209 = !DILocation(line: 356, column: 3, scope: !3083, inlinedAt: !4201)
!4210 = distinct !{!4210, !4205, !4211, !185}
!4211 = !DILocation(line: 357, column: 12, scope: !3080, inlinedAt: !4201)
!4212 = !DILocation(line: 613, column: 10, scope: !3811, inlinedAt: !4199)
!4213 = !DILocation(line: 613, column: 14, scope: !3811, inlinedAt: !4199)
!4214 = !DILocation(line: 0, scope: !3829, inlinedAt: !4215)
!4215 = distinct !DILocation(line: 69, column: 3, scope: !4191)
!4216 = !DILocation(line: 627, column: 16, scope: !3829, inlinedAt: !4215)
!4217 = !DILocation(line: 627, column: 10, scope: !3829, inlinedAt: !4215)
!4218 = !DILocation(line: 627, column: 14, scope: !3829, inlinedAt: !4215)
!4219 = !DILocation(line: 0, scope: !3829, inlinedAt: !4220)
!4220 = distinct !DILocation(line: 70, column: 3, scope: !4191)
!4221 = !DILocation(line: 627, column: 16, scope: !3829, inlinedAt: !4220)
!4222 = !DILocation(line: 627, column: 10, scope: !3829, inlinedAt: !4220)
!4223 = !DILocation(line: 627, column: 14, scope: !3829, inlinedAt: !4220)
!4224 = !DILocation(line: 0, scope: !3839, inlinedAt: !4225)
!4225 = distinct !DILocation(line: 71, column: 3, scope: !4191)
!4226 = !DILocation(line: 0, scope: !3625, inlinedAt: !4227)
!4227 = distinct !DILocation(line: 639, column: 3, scope: !3839, inlinedAt: !4225)
!4228 = !DILocation(line: 407, column: 31, scope: !3625, inlinedAt: !4227)
!4229 = !DILocation(line: 407, column: 27, scope: !3625, inlinedAt: !4227)
!4230 = !DILocation(line: 407, column: 8, scope: !3625, inlinedAt: !4227)
!4231 = !DILocation(line: 407, column: 3, scope: !3625, inlinedAt: !4227)
!4232 = !DILocation(line: 407, column: 12, scope: !3625, inlinedAt: !4227)
!4233 = !DILocation(line: 408, column: 3, scope: !3625, inlinedAt: !4227)
!4234 = !DILocation(line: 408, column: 12, scope: !3625, inlinedAt: !4227)
!4235 = !DILocation(line: 640, column: 10, scope: !3839, inlinedAt: !4225)
!4236 = !DILocation(line: 640, column: 14, scope: !3839, inlinedAt: !4225)
!4237 = !DILocation(line: 0, scope: !606, inlinedAt: !4238)
!4238 = distinct !DILocation(line: 72, column: 3, scope: !4191)
!4239 = !DILocation(line: 0, scope: !613, inlinedAt: !4240)
!4240 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !4238)
!4241 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !4240)
!4242 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !4240)
!4243 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !4240)
!4244 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !4240)
!4245 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !4240)
!4246 = !DILocation(line: 439, scope: !631, inlinedAt: !4240)
!4247 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !4240)
!4248 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !4240)
!4249 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !4240)
!4250 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !4240)
!4251 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !4240)
!4252 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !4240)
!4253 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !4240)
!4254 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !4240)
!4255 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !4240)
!4256 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !4240)
!4257 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !4240)
!4258 = distinct !{!4258, !4249, !4259, !185}
!4259 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !4240)
!4260 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !4240)
!4261 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !4240)
!4262 = distinct !{!4262, !4241, !4263, !185}
!4263 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !4240)
!4264 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !4238)
!4265 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !4238)
!4266 = !DILocation(line: 73, column: 1, scope: !4191)
