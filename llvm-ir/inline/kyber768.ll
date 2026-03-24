; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [3 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber768_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #5, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #4, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !77
  ret i32 0, !dbg !78
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !79 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !82, !DIExpression(), !83)
    #dbg_value(ptr %sk, !84, !DIExpression(), !83)
    #dbg_declare(ptr %coins, !85, !DIExpression(), !89)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #5, !dbg !90
    #dbg_value(ptr %pk, !67, !DIExpression(), !91)
    #dbg_value(ptr %sk, !69, !DIExpression(), !91)
    #dbg_value(ptr %coins, !70, !DIExpression(), !91)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !93
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !94
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 1184) #5, !dbg !95
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !96
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 1184) #4, !dbg !96
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !97
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !98
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !99
  ret i32 0, !dbg !100
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !101 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !114
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !115
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !116
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !117
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !120 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !121, !DIExpression(), !122)
    #dbg_value(ptr %ss, !123, !DIExpression(), !122)
    #dbg_value(ptr %pk, !124, !DIExpression(), !122)
    #dbg_declare(ptr %coins, !125, !DIExpression(), !129)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #5, !dbg !130
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !133 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !136, !DIExpression(), !137)
    #dbg_value(ptr %ct, !138, !DIExpression(), !137)
    #dbg_value(ptr %sk, !139, !DIExpression(), !137)
    #dbg_declare(ptr %buf, !140, !DIExpression(), !141)
    #dbg_declare(ptr %kr, !142, !DIExpression(), !143)
    #dbg_declare(ptr %cmp, !144, !DIExpression(), !148)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !149
    #dbg_value(ptr %add.ptr, !150, !DIExpression(), !137)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !151
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !152
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !153
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !154
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !155
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !156
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !157
    #dbg_value(ptr %ct, !158, !DIExpression(), !165)
    #dbg_value(ptr %cmp, !167, !DIExpression(), !165)
    #dbg_value(i32 1088, !168, !DIExpression(), !165)
    #dbg_value(i8 0, !169, !DIExpression(), !165)
    #dbg_value(i32 0, !170, !DIExpression(), !165)
  br label %for.cond.i, !dbg !171

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !173
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !165
    #dbg_value(i8 %r.0.i, !169, !DIExpression(), !165)
    #dbg_value(i32 %i.0.i, !170, !DIExpression(), !165)
  %exitcond = icmp ne i32 %i.0.i, 1088, !dbg !174
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber768_ref_verify.exit, !dbg !176

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

pqcrystals_kyber768_ref_verify.exit:              ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !165
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !186
    #dbg_value(i1 %.not, !187, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !137)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !188
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !188
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

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber768_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber768_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !205
    #dbg_value(i32 %i.0.i2, !202, !DIExpression(), !194)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !206
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber768_ref_cmov.exit, !dbg !208

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

pqcrystals_kyber768_ref_cmov.exit:                ; preds = %for.cond.i1
  ret i32 0, !dbg !219
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !220 {
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
  %exitcond39 = icmp ne i32 %i.0, 3, !dbg !267
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !269

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !270

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !273
    #dbg_value(i32 %j.0, !274, !DIExpression(), !242)
  %exitcond38 = icmp ne i32 %j.0, 3, !dbg !275
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
  %arrayidx7 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !403
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
  %arrayidx15 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !445
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
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !505 {
entry:
  %state.i50 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i3 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i1 = alloca [128 x i8], align 1
  %buf.i = alloca [128 x i8], align 1
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x %struct.polyvec], align 2
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
  store i8 3, ptr %arrayidx, align 1, !dbg !529
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !530
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !531
    #dbg_value(i32 0, !532, !DIExpression(), !509)
  br label %for.cond, !dbg !533

for.cond:                                         ; preds = %keccak_squeeze.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit ], !dbg !535
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit ], !dbg !509
    #dbg_value(i8 %nonce.0, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.0, !532, !DIExpression(), !509)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !536
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
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !651
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
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit180 ], [ 3, %for.cond8.preheader ], !dbg !509
    #dbg_value(i8 %nonce.1, !517, !DIExpression(), !509)
    #dbg_value(i32 %i.1, !532, !DIExpression(), !509)
  %exitcond181 = icmp ne i32 %i.1, 3, !dbg !677
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
  %arrayidx12 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !746
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

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber768_ref_poly_reduce.exit ], [ 0, %for.cond.i7.preheader ], !dbg !760
    #dbg_value(i32 %i.0.i8, !761, !DIExpression(), !762)
  %exitcond183 = icmp ne i32 %i.0.i8, 3, !dbg !763
  br i1 %exitcond183, label %for.body.i10, label %for.cond.i13.preheader, !dbg !679

for.cond.i13.preheader:                           ; preds = %for.cond.i7
  br label %for.cond.i13, !dbg !765

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i8, !dbg !767
    #dbg_value(ptr %arrayidx.i11, !768, !DIExpression(), !772)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !774
    #dbg_value(ptr %arrayidx.i11, !775, !DIExpression(), !777)
    #dbg_value(i32 0, !779, !DIExpression(), !777)
  br label %for.cond.i56, !dbg !780

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i10
  %i.0.i57 = phi i32 [ 0, %for.body.i10 ], [ %inc.i62, %for.body.i59 ], !dbg !782
    #dbg_value(i32 %i.0.i57, !779, !DIExpression(), !777)
  %exitcond182 = icmp ne i32 %i.0.i57, 256, !dbg !783
  br i1 %exitcond182, label %for.body.i59, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !785

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

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i56
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !807
    #dbg_value(i32 %inc.i12, !761, !DIExpression(), !762)
  br label %for.cond.i7, !dbg !808, !llvm.loop !809

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit75
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber768_ref_poly_reduce.exit75 ], [ 0, %for.cond.i13.preheader ], !dbg !811
    #dbg_value(i32 %i.0.i14, !761, !DIExpression(), !812)
  %exitcond185 = icmp ne i32 %i.0.i14, 3, !dbg !813
  br i1 %exitcond185, label %for.body.i16, label %for.cond17.preheader, !dbg !765

for.cond17.preheader:                             ; preds = %for.cond.i13
  br label %for.cond17, !dbg !814

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.0.i14, !dbg !816
    #dbg_value(ptr %arrayidx.i17, !768, !DIExpression(), !817)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !819
    #dbg_value(ptr %arrayidx.i17, !775, !DIExpression(), !820)
    #dbg_value(i32 0, !779, !DIExpression(), !820)
  br label %for.cond.i63, !dbg !822

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i16
  %i.0.i64 = phi i32 [ 0, %for.body.i16 ], [ %inc.i74, %for.body.i66 ], !dbg !823
    #dbg_value(i32 %i.0.i64, !779, !DIExpression(), !820)
  %exitcond184 = icmp ne i32 %i.0.i64, 256, !dbg !824
  br i1 %exitcond184, label %for.body.i66, label %pqcrystals_kyber768_ref_poly_reduce.exit75, !dbg !825

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

pqcrystals_kyber768_ref_poly_reduce.exit75:       ; preds = %for.cond.i63
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !840
    #dbg_value(i32 %inc.i18, !761, !DIExpression(), !812)
  br label %for.cond.i13, !dbg !841, !llvm.loop !842

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber768_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber768_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !844
    #dbg_value(i32 %i.2, !532, !DIExpression(), !509)
  %exitcond187 = icmp ne i32 %i.2, 3, !dbg !845
  br i1 %exitcond187, label %for.body19, label %for.cond.i27.preheader, !dbg !814

for.cond.i27.preheader:                           ; preds = %for.cond17
  br label %for.cond.i27, !dbg !847

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !855
  %arrayidx22 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !857
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !858
  %arrayidx24 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !859
    #dbg_value(ptr %arrayidx24, !860, !DIExpression(), !862)
    #dbg_value(i16 1353, !864, !DIExpression(), !862)
    #dbg_value(i32 0, !865, !DIExpression(), !862)
  br label %for.cond.i89, !dbg !866

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !868
    #dbg_value(i32 %i.0.i90, !865, !DIExpression(), !862)
  %exitcond186 = icmp ne i32 %i.0.i90, 256, !dbg !869
  br i1 %exitcond186, label %for.body.i92, label %pqcrystals_kyber768_ref_poly_tomont.exit, !dbg !871

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

pqcrystals_kyber768_ref_poly_tomont.exit:         ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !892
    #dbg_value(i32 %inc26, !532, !DIExpression(), !509)
  br label %for.cond17, !dbg !893, !llvm.loop !894

for.cond.i27:                                     ; preds = %for.cond.i27.preheader, %pqcrystals_kyber768_ref_poly_add.exit
  %i.0.i28 = phi i32 [ %inc.i32, %pqcrystals_kyber768_ref_poly_add.exit ], [ 0, %for.cond.i27.preheader ], !dbg !896
    #dbg_value(i32 %i.0.i28, !897, !DIExpression(), !898)
  %exitcond189 = icmp ne i32 %i.0.i28, 3, !dbg !899
  br i1 %exitcond189, label %for.body.i30, label %for.cond.i.preheader, !dbg !847

for.cond.i.preheader:                             ; preds = %for.cond.i27
  br label %for.cond.i, !dbg !901

for.body.i30:                                     ; preds = %for.cond.i27
  %arrayidx.i31 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !905
  %arrayidx2.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !906
  %arrayidx4.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.0.i28, !dbg !907
    #dbg_value(ptr %arrayidx.i31, !908, !DIExpression(), !914)
    #dbg_value(ptr %arrayidx2.i, !916, !DIExpression(), !914)
    #dbg_value(ptr %arrayidx4.i, !917, !DIExpression(), !914)
    #dbg_value(i32 0, !918, !DIExpression(), !914)
  br label %for.cond.i42, !dbg !919

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i30
  %i.0.i43 = phi i32 [ 0, %for.body.i30 ], [ %inc.i48, %for.body.i45 ], !dbg !921
    #dbg_value(i32 %i.0.i43, !918, !DIExpression(), !914)
  %exitcond188 = icmp ne i32 %i.0.i43, 256, !dbg !922
  br i1 %exitcond188, label %for.body.i45, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !924

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

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i42
  %inc.i32 = add nuw nsw i32 %i.0.i28, 1, !dbg !934
    #dbg_value(i32 %inc.i32, !897, !DIExpression(), !898)
  br label %for.cond.i27, !dbg !935, !llvm.loop !936

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit88
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit88 ], [ 0, %for.cond.i.preheader ], !dbg !938
    #dbg_value(i32 %i.0.i, !939, !DIExpression(), !940)
  %exitcond191 = icmp ne i32 %i.0.i, 3, !dbg !941
  br i1 %exitcond191, label %for.body.i, label %for.cond.i20.preheader, !dbg !901

for.cond.i20.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i20, !dbg !943

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !953
    #dbg_value(ptr %arrayidx.i6, !775, !DIExpression(), !954)
    #dbg_value(i32 0, !779, !DIExpression(), !954)
  br label %for.cond.i76, !dbg !956

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i
  %i.0.i77 = phi i32 [ 0, %for.body.i ], [ %inc.i87, %for.body.i79 ], !dbg !957
    #dbg_value(i32 %i.0.i77, !779, !DIExpression(), !954)
  %exitcond190 = icmp ne i32 %i.0.i77, 256, !dbg !958
  br i1 %exitcond190, label %for.body.i79, label %pqcrystals_kyber768_ref_poly_reduce.exit88, !dbg !959

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

pqcrystals_kyber768_ref_poly_reduce.exit88:       ; preds = %for.cond.i76
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !974
    #dbg_value(i32 %inc.i, !939, !DIExpression(), !940)
  br label %for.cond.i, !dbg !975, !llvm.loop !976

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %for.body.i23
  %i.0.i21 = phi i32 [ %inc.i26, %for.body.i23 ], [ 0, %for.cond.i20.preheader ], !dbg !978
    #dbg_value(i32 %i.0.i21, !979, !DIExpression(), !980)
  %exitcond192 = icmp ne i32 %i.0.i21, 3, !dbg !981
  br i1 %exitcond192, label %for.body.i23, label %for.cond.i33.preheader, !dbg !943

for.cond.i33.preheader:                           ; preds = %for.cond.i20
  br label %for.cond.i33, !dbg !983

for.body.i23:                                     ; preds = %for.cond.i20
  %mul.i = mul nuw nsw i32 %i.0.i21, 384, !dbg !989
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !990
  %arrayidx.i25 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i21, !dbg !991
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr.i24, ptr noundef nonnull %arrayidx.i25) #4, !dbg !992
  %inc.i26 = add nuw nsw i32 %i.0.i21, 1, !dbg !993
    #dbg_value(i32 %inc.i26, !979, !DIExpression(), !980)
  br label %for.cond.i20, !dbg !994, !llvm.loop !995

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !997
    #dbg_value(i32 %i.0.i34, !979, !DIExpression(), !998)
  %exitcond193 = icmp ne i32 %i.0.i34, 3, !dbg !999
  br i1 %exitcond193, label %for.body.i36, label %pqcrystals_kyber768_ref_polyvec_tobytes.exit41, !dbg !983

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1000
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i37, !dbg !1001
  %arrayidx.i39 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i34, !dbg !1002
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1003
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1004
    #dbg_value(i32 %inc.i40, !979, !DIExpression(), !998)
  br label %for.cond.i33, !dbg !1005, !llvm.loop !1006

pqcrystals_kyber768_ref_polyvec_tobytes.exit41:   ; preds = %for.cond.i33
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1152, !dbg !1008
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1009
  ret void, !dbg !1010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1011 {
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
  %at = alloca [3 x %struct.polyvec], align 2
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
  %exitcond = icmp ne i32 %i.0.i25, 3, !dbg !1057
  br i1 %exitcond, label %for.body.i27, label %pqcrystals_kyber768_ref_polyvec_frombytes.exit, !dbg !1059

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i25, !dbg !1060
  %mul.i = mul nuw nsw i32 %i.0.i25, 384, !dbg !1061
  %add.ptr.i29 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1062
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i28, ptr noundef %add.ptr.i29) #4, !dbg !1063
  %inc.i30 = add nuw nsw i32 %i.0.i25, 1, !dbg !1064
    #dbg_value(i32 %inc.i30, !1053, !DIExpression(), !1050)
  br label %for.cond.i24, !dbg !1065, !llvm.loop !1066

pqcrystals_kyber768_ref_polyvec_frombytes.exit:   ; preds = %for.cond.i24
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %pk, i32 1152, !dbg !1068
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i3, i32 noundef 32) #5, !dbg !1069
    #dbg_value(ptr %k, !1070, !DIExpression(), !1074)
    #dbg_value(ptr %m, !1076, !DIExpression(), !1074)
    #dbg_value(i32 0, !1077, !DIExpression(), !1074)
  br label %for.cond.i110, !dbg !1078

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber768_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1080
    #dbg_value(i32 %i.0.i111, !1077, !DIExpression(), !1074)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1081
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber768_ref_poly_frommsg.exit, !dbg !1083

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

pqcrystals_kyber768_ref_poly_frommsg.exit:        ; preds = %for.cond.i110
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1118
    #dbg_value(i32 0, !1119, !DIExpression(), !1015)
  br label %for.cond, !dbg !1120

for.cond:                                         ; preds = %keccak_squeeze.exit, %pqcrystals_kyber768_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber768_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit ], !dbg !1122
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber768_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit ], !dbg !1015
    #dbg_value(i8 %nonce.0, !1021, !DIExpression(), !1015)
    #dbg_value(i32 %i.0, !1119, !DIExpression(), !1015)
  %exitcond264 = icmp ne i32 %i.0, 3, !dbg !1123
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
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit230 ], [ 3, %for.cond5.preheader ], !dbg !1015
    #dbg_value(i8 %nonce.1, !1021, !DIExpression(), !1015)
    #dbg_value(i32 %i.1, !1119, !DIExpression(), !1015)
  %exitcond265 = icmp ne i32 %i.1, 3, !dbg !1193
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
    #dbg_value(i8 6, !1021, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1015)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !1267
    #dbg_value(ptr %epp, !1198, !DIExpression(), !1269)
    #dbg_value(ptr %coins, !1200, !DIExpression(), !1269)
    #dbg_value(i8 6, !1201, !DIExpression(), !1269)
    #dbg_declare(ptr %buf.i1, !1202, !DIExpression(), !1270)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1271
    #dbg_value(ptr %buf.i1, !564, !DIExpression(), !1273)
    #dbg_value(i32 128, !566, !DIExpression(), !1273)
    #dbg_value(ptr %coins, !567, !DIExpression(), !1273)
    #dbg_value(i8 6, !568, !DIExpression(), !1273)
    #dbg_declare(ptr %extkey.i8, !569, !DIExpression(), !1274)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1271
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1275
  store i8 6, ptr %arrayidx.i10, align 1, !dbg !1276
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

for.cond.i18:                                     ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit, %keccak_squeeze.exit260
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit260 ], [ %inc.i23, %pqcrystals_kyber768_ref_poly_reduce.exit ], !dbg !1329
    #dbg_value(i32 %i.0.i19, !761, !DIExpression(), !1326)
  %exitcond267 = icmp ne i32 %i.0.i19, 3, !dbg !1330
  br i1 %exitcond267, label %for.body.i21, label %for.cond16.preheader, !dbg !1331

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1332

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [3 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1334
    #dbg_value(ptr %arrayidx.i22, !768, !DIExpression(), !1335)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1337
    #dbg_value(ptr %arrayidx.i22, !775, !DIExpression(), !1338)
    #dbg_value(i32 0, !779, !DIExpression(), !1338)
  br label %for.cond.i77, !dbg !1340

for.cond.i77:                                     ; preds = %for.body.i80, %for.body.i21
  %i.0.i78 = phi i32 [ 0, %for.body.i21 ], [ %inc.i83, %for.body.i80 ], !dbg !1341
    #dbg_value(i32 %i.0.i78, !779, !DIExpression(), !1338)
  %exitcond266 = icmp ne i32 %i.0.i78, 256, !dbg !1342
  br i1 %exitcond266, label %for.body.i80, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1343

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

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i77
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1358
    #dbg_value(i32 %inc.i23, !761, !DIExpression(), !1326)
  br label %for.cond.i18, !dbg !1359, !llvm.loop !1360

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1362
    #dbg_value(i32 %i.2, !1119, !DIExpression(), !1015)
  %exitcond268 = icmp ne i32 %i.2, 3, !dbg !1363
  br i1 %exitcond268, label %for.body18, label %for.end23, !dbg !1332

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1365
  %arrayidx20 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1366
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1367
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1368
    #dbg_value(i32 %inc22, !1119, !DIExpression(), !1015)
  br label %for.cond16, !dbg !1369, !llvm.loop !1370

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1372
    #dbg_value(ptr %b, !1373, !DIExpression(), !1375)
    #dbg_value(i32 0, !1377, !DIExpression(), !1375)
  br label %for.cond.i12, !dbg !1378

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1380
    #dbg_value(i32 %i.0.i13, !1377, !DIExpression(), !1375)
  %exitcond269 = icmp ne i32 %i.0.i13, 3, !dbg !1381
  br i1 %exitcond269, label %for.body.i15, label %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit, !dbg !1383

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1384
    #dbg_value(ptr %arrayidx.i16, !1385, !DIExpression(), !1387)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1389
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1390
    #dbg_value(i32 %inc.i17, !1377, !DIExpression(), !1375)
  br label %for.cond.i12, !dbg !1391, !llvm.loop !1392

pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1385, !DIExpression(), !1394)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1396
    #dbg_value(ptr %b, !1397, !DIExpression(), !1398)
    #dbg_value(ptr %b, !1400, !DIExpression(), !1398)
    #dbg_value(ptr %ep, !1401, !DIExpression(), !1398)
    #dbg_value(i32 0, !897, !DIExpression(), !1398)
  br label %for.cond.i31, !dbg !1402

for.cond.i31:                                     ; preds = %pqcrystals_kyber768_ref_poly_add.exit, %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit
  %i.0.i32 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit ], [ %inc.i36, %pqcrystals_kyber768_ref_poly_add.exit ], !dbg !1403
    #dbg_value(i32 %i.0.i32, !897, !DIExpression(), !1398)
  %exitcond271 = icmp ne i32 %i.0.i32, 3, !dbg !1404
  br i1 %exitcond271, label %for.body.i34, label %for.cond.i54.preheader, !dbg !1405

for.cond.i54.preheader:                           ; preds = %for.cond.i31
  br label %for.cond.i54, !dbg !1406

for.body.i34:                                     ; preds = %for.cond.i31
  %arrayidx.i35 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i32, !dbg !1408
  %arrayidx2.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i32, !dbg !1409
  %arrayidx4.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i32, !dbg !1410
    #dbg_value(ptr %arrayidx.i35, !908, !DIExpression(), !1411)
    #dbg_value(ptr %arrayidx2.i, !916, !DIExpression(), !1411)
    #dbg_value(ptr %arrayidx4.i, !917, !DIExpression(), !1411)
    #dbg_value(i32 0, !918, !DIExpression(), !1411)
  br label %for.cond.i37, !dbg !1413

for.cond.i37:                                     ; preds = %for.body.i40, %for.body.i34
  %i.0.i38 = phi i32 [ 0, %for.body.i34 ], [ %inc.i43, %for.body.i40 ], !dbg !1414
    #dbg_value(i32 %i.0.i38, !918, !DIExpression(), !1411)
  %exitcond270 = icmp ne i32 %i.0.i38, 256, !dbg !1415
  br i1 %exitcond270, label %for.body.i40, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !1416

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

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i37
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

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit96
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit96 ], [ 0, %for.cond.i.preheader ], !dbg !1458
    #dbg_value(i32 %i.0.i, !939, !DIExpression(), !1459)
  %exitcond275 = icmp ne i32 %i.0.i, 3, !dbg !1460
  br i1 %exitcond275, label %for.body.i, label %for.cond.i97.preheader, !dbg !1447

for.cond.i97.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i97, !dbg !1461

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1463
    #dbg_value(ptr %arrayidx.i11, !775, !DIExpression(), !1464)
    #dbg_value(i32 0, !779, !DIExpression(), !1464)
  br label %for.cond.i84, !dbg !1466

for.cond.i84:                                     ; preds = %for.body.i87, %for.body.i
  %i.0.i85 = phi i32 [ 0, %for.body.i ], [ %inc.i95, %for.body.i87 ], !dbg !1467
    #dbg_value(i32 %i.0.i85, !779, !DIExpression(), !1464)
  %exitcond274 = icmp ne i32 %i.0.i85, 256, !dbg !1468
  br i1 %exitcond274, label %for.body.i87, label %pqcrystals_kyber768_ref_poly_reduce.exit96, !dbg !1469

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

pqcrystals_kyber768_ref_poly_reduce.exit96:       ; preds = %for.cond.i84
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1484
    #dbg_value(i32 %inc.i, !939, !DIExpression(), !1459)
  br label %for.cond.i, !dbg !1485, !llvm.loop !1486

for.cond.i97:                                     ; preds = %for.cond.i97.preheader, %for.body.i100
  %i.0.i98 = phi i32 [ %inc.i108, %for.body.i100 ], [ 0, %for.cond.i97.preheader ], !dbg !1488
    #dbg_value(i32 %i.0.i98, !779, !DIExpression(), !1489)
  %exitcond276 = icmp ne i32 %i.0.i98, 256, !dbg !1490
  br i1 %exitcond276, label %for.body.i100, label %pqcrystals_kyber768_ref_poly_reduce.exit109, !dbg !1461

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

pqcrystals_kyber768_ref_poly_reduce.exit109:      ; preds = %for.cond.i97
    #dbg_value(ptr %c, !1505, !DIExpression(), !1510)
    #dbg_value(ptr %b, !1512, !DIExpression(), !1510)
    #dbg_value(ptr %v, !1513, !DIExpression(), !1510)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1514
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !1515
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %v) #4, !dbg !1516
  ret void, !dbg !1517
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1518 {
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
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1541
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !1542
    #dbg_value(ptr %v, !1543, !DIExpression(), !1545)
    #dbg_value(ptr %add.ptr.i, !1547, !DIExpression(), !1545)
    #dbg_value(i32 0, !1548, !DIExpression(), !1545)
  br label %for.cond.i41, !dbg !1549

for.cond.i41:                                     ; preds = %for.body.i44, %entry
  %a.addr.0.i = phi ptr [ %add.ptr.i, %entry ], [ %add.ptr.i49, %for.body.i44 ]
  %i.0.i42 = phi i32 [ 0, %entry ], [ %inc.i50, %for.body.i44 ], !dbg !1551
    #dbg_value(i32 %i.0.i42, !1548, !DIExpression(), !1545)
    #dbg_value(ptr %a.addr.0.i, !1547, !DIExpression(), !1545)
  %exitcond = icmp ne i32 %i.0.i42, 128, !dbg !1552
  br i1 %exitcond, label %for.body.i44, label %for.cond.i1.preheader, !dbg !1554

for.cond.i1.preheader:                            ; preds = %for.cond.i41
  br label %for.cond.i1, !dbg !1555

for.body.i44:                                     ; preds = %for.cond.i41
  %0 = load i8, ptr %a.addr.0.i, align 1, !dbg !1561
  %1 = and i8 %0, 15, !dbg !1563
  %conv2.i = zext nneg i8 %1 to i32, !dbg !1564
  %mul.i45 = mul nuw nsw i32 %conv2.i, 3329, !dbg !1565
  %add.i46 = add nuw nsw i32 %mul.i45, 8, !dbg !1566
  %shr.i47 = lshr i32 %add.i46, 4, !dbg !1567
  %conv3.i = trunc nuw nsw i32 %shr.i47 to i16, !dbg !1568
  %mul4.i = shl nuw nsw i32 %i.0.i42, 1, !dbg !1569
  %arrayidx6.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %mul4.i, !dbg !1570
  store i16 %conv3.i, ptr %arrayidx6.i48, align 2, !dbg !1571
  %2 = load i8, ptr %a.addr.0.i, align 1, !dbg !1572
  %3 = lshr i8 %2, 4, !dbg !1573
  %conv11.i = zext nneg i8 %3 to i32, !dbg !1574
  %mul12.i = mul nuw nsw i32 %conv11.i, 3329, !dbg !1575
  %add13.i = add nuw nsw i32 %mul12.i, 8, !dbg !1576
  %shr14.i = lshr i32 %add13.i, 4, !dbg !1577
  %conv15.i = trunc nuw nsw i32 %shr14.i to i16, !dbg !1578
  %mul17.i = shl nuw nsw i32 %i.0.i42, 1, !dbg !1579
  %add18.i = or disjoint i32 %mul17.i, 1, !dbg !1580
  %arrayidx19.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %add18.i, !dbg !1581
  store i16 %conv15.i, ptr %arrayidx19.i, align 2, !dbg !1582
    #dbg_value(ptr %a.addr.0.i, !1547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1545)
  %add.ptr.i49 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 1, !dbg !1583
    #dbg_value(ptr %add.ptr.i49, !1547, !DIExpression(), !1545)
  %inc.i50 = add nuw nsw i32 %i.0.i42, 1, !dbg !1584
    #dbg_value(i32 %inc.i50, !1548, !DIExpression(), !1545)
  br label %for.cond.i41, !dbg !1585, !llvm.loop !1586

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !1588
    #dbg_value(i32 %i.0.i2, !1053, !DIExpression(), !1589)
  %exitcond51 = icmp ne i32 %i.0.i2, 3, !dbg !1590
  br i1 %exitcond51, label %for.body.i4, label %for.cond.i.preheader, !dbg !1555

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1591

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1593
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1594
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1595
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1596
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1597
    #dbg_value(i32 %inc.i7, !1053, !DIExpression(), !1589)
  br label %for.cond.i1, !dbg !1598, !llvm.loop !1599

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1601
    #dbg_value(i32 %i.0.i, !761, !DIExpression(), !1602)
  %exitcond53 = icmp ne i32 %i.0.i, 3, !dbg !1603
  br i1 %exitcond53, label %for.body.i, label %pqcrystals_kyber768_ref_polyvec_ntt.exit, !dbg !1591

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1604
    #dbg_value(ptr %arrayidx.i, !768, !DIExpression(), !1605)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1607
    #dbg_value(ptr %arrayidx.i, !775, !DIExpression(), !1608)
    #dbg_value(i32 0, !779, !DIExpression(), !1608)
  br label %for.cond.i14, !dbg !1610

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1611
    #dbg_value(i32 %i.0.i15, !779, !DIExpression(), !1608)
  %exitcond52 = icmp ne i32 %i.0.i15, 256, !dbg !1612
  br i1 %exitcond52, label %for.body.i17, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1613

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1614
  %4 = load i16, ptr %arrayidx.i18, align 2, !dbg !1614
    #dbg_value(i16 %4, !787, !DIExpression(), !1615)
    #dbg_value(i16 20159, !794, !DIExpression(), !1615)
  %conv.i.i = sext i16 %4 to i32, !dbg !1617
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1618
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1619
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1620
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1615)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1615)
  %5 = trunc nsw i32 %shr.i.i to i16, !dbg !1621
  %6 = mul i16 %5, -3329, !dbg !1621
  %conv7.i.i = add i16 %6, %4, !dbg !1621
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1622
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1623
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1624
    #dbg_value(i32 %inc.i20, !779, !DIExpression(), !1608)
  br label %for.cond.i14, !dbg !1625, !llvm.loop !1626

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1628
    #dbg_value(i32 %inc.i, !761, !DIExpression(), !1602)
  br label %for.cond.i, !dbg !1629, !llvm.loop !1630

pqcrystals_kyber768_ref_polyvec_ntt.exit:         ; preds = %for.cond.i
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1632
    #dbg_value(ptr %mp, !1385, !DIExpression(), !1633)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1635
    #dbg_value(ptr %mp, !1636, !DIExpression(), !1638)
    #dbg_value(ptr %v, !1640, !DIExpression(), !1638)
    #dbg_value(ptr %mp, !1641, !DIExpression(), !1638)
    #dbg_value(i32 0, !1642, !DIExpression(), !1638)
  br label %for.cond.i8, !dbg !1643

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber768_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !1645
    #dbg_value(i32 %i.0.i9, !1642, !DIExpression(), !1638)
  %exitcond54 = icmp ne i32 %i.0.i9, 256, !dbg !1646
  br i1 %exitcond54, label %for.body.i11, label %for.cond.i21.preheader, !dbg !1648

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !1649

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !1651
  %7 = load i16, ptr %arrayidx.i12, align 2, !dbg !1651
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1652
  %8 = load i16, ptr %arrayidx2.i, align 2, !dbg !1652
  %sub.i = sub i16 %7, %8, !dbg !1653
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1654
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !1655
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !1656
    #dbg_value(i32 %inc.i13, !1642, !DIExpression(), !1638)
  br label %for.cond.i8, !dbg !1657, !llvm.loop !1658

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !1660
    #dbg_value(i32 %i.0.i22, !779, !DIExpression(), !1661)
  %exitcond55 = icmp ne i32 %i.0.i22, 256, !dbg !1662
  br i1 %exitcond55, label %for.body.i24, label %for.cond.i34.preheader, !dbg !1649

for.cond.i34.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i34, !dbg !1663

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1669
  %9 = load i16, ptr %arrayidx.i25, align 2, !dbg !1669
    #dbg_value(i16 %9, !787, !DIExpression(), !1670)
    #dbg_value(i16 20159, !794, !DIExpression(), !1670)
  %conv.i.i26 = sext i16 %9 to i32, !dbg !1672
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !1673
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !1674
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !1675
    #dbg_value(i32 %shr.i.i29, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1670)
    #dbg_value(i32 %shr.i.i29, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1670)
  %10 = trunc nsw i32 %shr.i.i29 to i16, !dbg !1676
  %11 = mul i16 %10, -3329, !dbg !1676
  %conv7.i.i30 = add i16 %11, %9, !dbg !1676
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1677
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !1678
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !1679
    #dbg_value(i32 %inc.i32, !779, !DIExpression(), !1661)
  br label %for.cond.i21, !dbg !1680, !llvm.loop !1681

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc11.i
  %i.0.i35 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i34.preheader ], !dbg !1683
    #dbg_value(i32 %i.0.i35, !1684, !DIExpression(), !1685)
  %exitcond57 = icmp ne i32 %i.0.i35, 32, !dbg !1686
  br i1 %exitcond57, label %for.body.i37, label %pqcrystals_kyber768_ref_poly_tomsg.exit, !dbg !1663

for.body.i37:                                     ; preds = %for.cond.i34
  %arrayidx.i38 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1688
  store i8 0, ptr %arrayidx.i38, align 1, !dbg !1690
    #dbg_value(i32 0, !1691, !DIExpression(), !1685)
  br label %for.cond1.i, !dbg !1692

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i37
  %j.0.i = phi i32 [ 0, %for.body.i37 ], [ %inc.i40, %for.body3.i ], !dbg !1694
    #dbg_value(i32 %j.0.i, !1691, !DIExpression(), !1685)
  %exitcond56 = icmp ne i32 %j.0.i, 8, !dbg !1695
  br i1 %exitcond56, label %for.body3.i, label %for.inc11.i, !dbg !1697

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i39 = shl nuw nsw i32 %i.0.i35, 3, !dbg !1698
  %add.i = or disjoint i32 %mul.i39, %j.0.i, !dbg !1700
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i, !dbg !1701
  %12 = load i16, ptr %arrayidx4.i, align 2, !dbg !1701
  %conv.i = sext i16 %12 to i32, !dbg !1701
    #dbg_value(i32 %conv.i, !1702, !DIExpression(), !1685)
    #dbg_value(i32 %conv.i, !1702, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1685)
    #dbg_value(i32 %conv.i, !1702, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1685)
  %13 = mul i32 %conv.i, 161270, !dbg !1703
  %mul6.i = add i32 %13, 134257275, !dbg !1703
    #dbg_value(i32 %mul6.i, !1702, !DIExpression(), !1685)
  %shr.i = lshr i32 %mul6.i, 28, !dbg !1704
    #dbg_value(i32 %shr.i, !1702, !DIExpression(), !1685)
  %and.i = and i32 %shr.i, 1, !dbg !1705
    #dbg_value(i32 %and.i, !1702, !DIExpression(), !1685)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !1706
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1707
  %14 = load i8, ptr %arrayidx8.i, align 1, !dbg !1708
  %15 = trunc nuw i32 %shl7.i to i8, !dbg !1708
  %conv10.i = or i8 %14, %15, !dbg !1708
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !1708
  %inc.i40 = add nuw nsw i32 %j.0.i, 1, !dbg !1709
    #dbg_value(i32 %inc.i40, !1691, !DIExpression(), !1685)
  br label %for.cond1.i, !dbg !1710, !llvm.loop !1711

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i35, 1, !dbg !1713
    #dbg_value(i32 %inc12.i, !1684, !DIExpression(), !1685)
  br label %for.cond.i34, !dbg !1714, !llvm.loop !1715

pqcrystals_kyber768_ref_poly_tomsg.exit:          ; preds = %for.cond.i34
  ret void, !dbg !1717
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1718 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !1719, !DIExpression(), !1720)
    #dbg_value(ptr %a, !1721, !DIExpression(), !1720)
    #dbg_declare(ptr %t, !1722, !DIExpression(), !1726)
    #dbg_value(i32 0, !1727, !DIExpression(), !1720)
  br label %for.cond, !dbg !1728

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !1730
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !1719, !DIExpression(), !1720)
    #dbg_value(i32 %i.0, !1727, !DIExpression(), !1720)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !1731
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !1733

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1734

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !1737
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !1719, !DIExpression(), !1720)
    #dbg_value(i32 %j.0, !1738, !DIExpression(), !1720)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !1739
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !1734

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1741

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1744
    #dbg_value(i32 %k.0, !1745, !DIExpression(), !1720)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !1746
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !1741

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1748
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !1750
  %add = or disjoint i32 %mul, %k.0, !dbg !1751
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !1748
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1748
  %isneg = icmp slt i16 %0, 0, !dbg !1752
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1752
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1753
  %add12 = add i16 %and, %0, !dbg !1754
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !1754
  %conv15 = zext i16 %add12 to i64, !dbg !1755
    #dbg_value(i64 %conv15, !1756, !DIExpression(), !1720)
    #dbg_value(i64 %conv15, !1756, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !1720)
    #dbg_value(i64 %conv15, !1756, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1720)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !1757
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !1757
    #dbg_value(i64 %mul17, !1756, !DIExpression(), !1720)
  %shr18 = lshr i64 %mul17, 32, !dbg !1758
    #dbg_value(i64 %shr18, !1756, !DIExpression(), !1720)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !1759
  %conv20 = and i16 %2, 1023, !dbg !1759
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1760
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !1761
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1762
    #dbg_value(i32 %inc, !1745, !DIExpression(), !1720)
  br label %for.cond4, !dbg !1763, !llvm.loop !1764

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !1766
  %conv25 = trunc i16 %3 to i8, !dbg !1767
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !1768
  %4 = load i16, ptr %t, align 2, !dbg !1769
  %5 = lshr i16 %4, 8, !dbg !1770
  %shr29 = trunc nuw i16 %5 to i8, !dbg !1770
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1771
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !1771
  %conv31 = trunc i16 %6 to i8, !dbg !1771
  %shl32 = shl i8 %conv31, 2, !dbg !1772
  %or = or i8 %shl32, %shr29, !dbg !1773
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !1774
  store i8 %or, ptr %arrayidx34, align 1, !dbg !1775
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1776
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !1776
  %8 = lshr i16 %7, 6, !dbg !1777
  %shr37 = trunc i16 %8 to i8, !dbg !1777
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1778
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !1778
  %conv39 = trunc i16 %9 to i8, !dbg !1778
  %shl40 = shl i8 %conv39, 4, !dbg !1779
  %or41 = or i8 %shl40, %shr37, !dbg !1780
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !1781
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1782
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1783
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !1783
  %11 = lshr i16 %10, 4, !dbg !1784
  %shr46 = trunc i16 %11 to i8, !dbg !1784
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1785
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !1785
  %conv48 = trunc i16 %12 to i8, !dbg !1785
  %shl49 = shl i8 %conv48, 6, !dbg !1786
  %or50 = or i8 %shl49, %shr46, !dbg !1787
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !1788
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !1789
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1790
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !1790
  %14 = lshr i16 %13, 2, !dbg !1791
  %conv56 = trunc i16 %14 to i8, !dbg !1792
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !1793
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !1794
    #dbg_value(ptr %r.addr.1, !1719, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1720)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !1795
    #dbg_value(ptr %add.ptr, !1719, !DIExpression(), !1720)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !1796
    #dbg_value(i32 %inc59, !1738, !DIExpression(), !1720)
  br label %for.cond1, !dbg !1797, !llvm.loop !1798

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !1800
    #dbg_value(i32 %inc62, !1727, !DIExpression(), !1720)
  br label %for.cond, !dbg !1801, !llvm.loop !1802

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !1804
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1805 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !1806, !DIExpression(), !1807)
    #dbg_value(ptr %a, !1808, !DIExpression(), !1807)
    #dbg_declare(ptr %t, !1809, !DIExpression(), !1810)
    #dbg_value(i32 0, !1811, !DIExpression(), !1807)
  br label %for.cond, !dbg !1812

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !1814
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !1808, !DIExpression(), !1807)
    #dbg_value(i32 %i.0, !1811, !DIExpression(), !1807)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !1815
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !1817

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1818

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !1821
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !1808, !DIExpression(), !1807)
    #dbg_value(i32 %j.0, !1822, !DIExpression(), !1807)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !1823
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !1818

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !1825
  %conv = zext i8 %0 to i16, !dbg !1825
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1827
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !1827
  %conv6 = zext i8 %1 to i16, !dbg !1828
  %shl = shl nuw i16 %conv6, 8, !dbg !1829
  %or = or disjoint i16 %shl, %conv, !dbg !1830
  store i16 %or, ptr %t, align 2, !dbg !1831
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !1832
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !1832
  %3 = lshr i8 %2, 2, !dbg !1833
  %shr11 = zext nneg i8 %3 to i16, !dbg !1833
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1834
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !1834
  %conv14 = zext i8 %4 to i16, !dbg !1835
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !1836
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !1837
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1838
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !1839
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !1840
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !1840
  %6 = lshr i8 %5, 4, !dbg !1841
  %shr21 = zext nneg i8 %6 to i16, !dbg !1841
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !1842
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !1842
  %conv24 = zext i8 %7 to i16, !dbg !1843
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !1844
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !1845
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1846
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !1847
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !1848
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !1848
  %9 = lshr i8 %8, 6, !dbg !1849
  %shr31 = zext nneg i8 %9 to i16, !dbg !1849
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !1850
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !1850
  %conv34 = zext i8 %10 to i16, !dbg !1851
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !1852
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !1853
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1854
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !1855
    #dbg_value(ptr %add.ptr, !1808, !DIExpression(), !1807)
    #dbg_value(i32 0, !1856, !DIExpression(), !1807)
  br label %for.cond39, !dbg !1857

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !1859
    #dbg_value(i32 %k.0, !1856, !DIExpression(), !1807)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !1860
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !1862

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1863
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !1863
  %12 = and i16 %11, 1023, !dbg !1864
  %and = zext nneg i16 %12 to i32, !dbg !1864
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1865
  %add = add nuw nsw i32 %mul, 512, !dbg !1866
  %shr45 = lshr i32 %add, 10, !dbg !1867
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !1868
  %arrayidx47 = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1869
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !1870
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !1871
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !1869
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !1872
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1873
    #dbg_value(i32 %inc, !1856, !DIExpression(), !1807)
  br label %for.cond39, !dbg !1874, !llvm.loop !1875

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !1877
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !1878
    #dbg_value(i32 %inc52, !1822, !DIExpression(), !1807)
  br label %for.cond1, !dbg !1879, !llvm.loop !1880

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !1882
    #dbg_value(i32 %inc55, !1811, !DIExpression(), !1807)
  br label %for.cond, !dbg !1883, !llvm.loop !1884

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !1886
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !945 {
entry:
    #dbg_value(ptr %r, !1887, !DIExpression(), !1888)
    #dbg_value(ptr %a, !1889, !DIExpression(), !1888)
    #dbg_value(i32 0, !979, !DIExpression(), !1888)
  br label %for.cond, !dbg !1890

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1891
    #dbg_value(i32 %i.0, !979, !DIExpression(), !1888)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1892
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1893

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1894
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1895
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1896
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !1897
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1898
    #dbg_value(i32 %inc, !979, !DIExpression(), !1888)
  br label %for.cond, !dbg !1899, !llvm.loop !1900

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1902
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1047 {
entry:
    #dbg_value(ptr %r, !1046, !DIExpression(), !1903)
    #dbg_value(ptr %a, !1052, !DIExpression(), !1903)
    #dbg_value(i32 0, !1053, !DIExpression(), !1903)
  br label %for.cond, !dbg !1904

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1905
    #dbg_value(i32 %i.0, !1053, !DIExpression(), !1903)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1906
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1907

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1908
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1909
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1910
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !1911
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1912
    #dbg_value(i32 %inc, !1053, !DIExpression(), !1903)
  br label %for.cond, !dbg !1913, !llvm.loop !1914

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1916
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !682 {
entry:
    #dbg_value(ptr %r, !1325, !DIExpression(), !1917)
    #dbg_value(i32 0, !761, !DIExpression(), !1917)
  br label %for.cond, !dbg !1918

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_reduce.exit ], !dbg !1919
    #dbg_value(i32 %i.0, !761, !DIExpression(), !1917)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !1920
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !1921

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1922
    #dbg_value(ptr %arrayidx, !768, !DIExpression(), !1923)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %arrayidx) #4, !dbg !1925
    #dbg_value(ptr %arrayidx, !775, !DIExpression(), !1926)
    #dbg_value(i32 0, !779, !DIExpression(), !1926)
  br label %for.cond.i, !dbg !1928

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !1929
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !1926)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !1930
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1931

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !1932
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !1932
    #dbg_value(i16 %0, !787, !DIExpression(), !1933)
    #dbg_value(i16 20159, !794, !DIExpression(), !1933)
  %conv.i.i = sext i16 %0 to i32, !dbg !1935
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1936
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1937
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1938
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1933)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1933)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !1939
  %2 = mul i16 %1, -3329, !dbg !1939
  %conv7.i.i = add i16 %2, %0, !dbg !1939
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !1940
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !1941
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1942
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !1926)
  br label %for.cond.i, !dbg !1943, !llvm.loop !1944

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1946
    #dbg_value(i32 %inc, !761, !DIExpression(), !1917)
  br label %for.cond, !dbg !1947, !llvm.loop !1948

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1950
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1374 {
entry:
    #dbg_value(ptr %r, !1373, !DIExpression(), !1951)
    #dbg_value(i32 0, !1377, !DIExpression(), !1951)
  br label %for.cond, !dbg !1952

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1953
    #dbg_value(i32 %i.0, !1377, !DIExpression(), !1951)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1954
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1955

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1956
    #dbg_value(ptr %arrayidx, !1385, !DIExpression(), !1957)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %arrayidx) #4, !dbg !1959
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1960
    #dbg_value(i32 %inc, !1377, !DIExpression(), !1951)
  br label %for.cond, !dbg !1961, !llvm.loop !1962

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1964
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1965 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !1969, !DIExpression(), !1970)
    #dbg_value(ptr %a, !1971, !DIExpression(), !1970)
    #dbg_value(ptr %b, !1972, !DIExpression(), !1970)
    #dbg_declare(ptr %t, !1973, !DIExpression(), !1974)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !1975
    #dbg_value(i32 1, !1976, !DIExpression(), !1970)
  br label %for.cond, !dbg !1977

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_add.exit ], !dbg !1979
    #dbg_value(i32 %i.0, !1976, !DIExpression(), !1970)
  %exitcond8 = icmp ne i32 %i.0, 3, !dbg !1980
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !1982

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !1983

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1985
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !1987
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !1988
    #dbg_value(ptr %r, !908, !DIExpression(), !1989)
    #dbg_value(ptr %r, !916, !DIExpression(), !1989)
    #dbg_value(ptr %t, !917, !DIExpression(), !1989)
    #dbg_value(i32 0, !918, !DIExpression(), !1989)
  br label %for.cond.i, !dbg !1991

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !1992
    #dbg_value(i32 %i.0.i, !918, !DIExpression(), !1989)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !1993
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !1994

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !1995
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !1995
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !1996
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !1996
  %add.i = add i16 %0, %1, !dbg !1997
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !1998
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1999
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2000
    #dbg_value(i32 %inc.i, !918, !DIExpression(), !1989)
  br label %for.cond.i, !dbg !2001, !llvm.loop !2002

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2004
    #dbg_value(i32 %inc, !1976, !DIExpression(), !1970)
  br label %for.cond, !dbg !2005, !llvm.loop !2006

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2008
    #dbg_value(i32 %i.0.i2, !779, !DIExpression(), !2009)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2010
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1983

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2011
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2011
    #dbg_value(i16 %2, !787, !DIExpression(), !2012)
    #dbg_value(i16 20159, !794, !DIExpression(), !2012)
  %conv.i.i = sext i16 %2 to i32, !dbg !2014
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2015
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2016
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2017
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2012)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2012)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2018
  %4 = mul i16 %3, -3329, !dbg !2018
  %conv7.i.i = add i16 %4, %2, !dbg !2018
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2019
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2020
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2021
    #dbg_value(i32 %inc.i7, !779, !DIExpression(), !2009)
  br label %for.cond.i1, !dbg !2022, !llvm.loop !2023

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i1
  ret void, !dbg !2025
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !903 {
entry:
    #dbg_value(ptr %r, !2026, !DIExpression(), !2027)
    #dbg_value(i32 0, !939, !DIExpression(), !2027)
  br label %for.cond, !dbg !2028

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_reduce.exit ], !dbg !2029
    #dbg_value(i32 %i.0, !939, !DIExpression(), !2027)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !2030
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2031

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2032
    #dbg_value(ptr %arrayidx, !775, !DIExpression(), !2033)
    #dbg_value(i32 0, !779, !DIExpression(), !2033)
  br label %for.cond.i, !dbg !2035

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2036
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !2033)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2037
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2038

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2039
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2039
    #dbg_value(i16 %0, !787, !DIExpression(), !2040)
    #dbg_value(i16 20159, !794, !DIExpression(), !2040)
  %conv.i.i = sext i16 %0 to i32, !dbg !2042
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2043
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2044
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2045
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2040)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2040)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2046
  %2 = mul i16 %1, -3329, !dbg !2046
  %conv7.i.i = add i16 %2, %0, !dbg !2046
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2047
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2048
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2049
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !2033)
  br label %for.cond.i, !dbg !2050, !llvm.loop !2051

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2053
    #dbg_value(i32 %inc, !939, !DIExpression(), !2027)
  br label %for.cond, !dbg !2054, !llvm.loop !2055

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2057
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !849 {
entry:
    #dbg_value(ptr %r, !1397, !DIExpression(), !2058)
    #dbg_value(ptr %a, !1400, !DIExpression(), !2058)
    #dbg_value(ptr %b, !1401, !DIExpression(), !2058)
    #dbg_value(i32 0, !897, !DIExpression(), !2058)
  br label %for.cond, !dbg !2059

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_add.exit ], !dbg !2060
    #dbg_value(i32 %i.0, !897, !DIExpression(), !2058)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !2061
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2062

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2063
  %arrayidx2 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2064
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2065
    #dbg_value(ptr %arrayidx, !908, !DIExpression(), !2066)
    #dbg_value(ptr %arrayidx2, !916, !DIExpression(), !2066)
    #dbg_value(ptr %arrayidx4, !917, !DIExpression(), !2066)
    #dbg_value(i32 0, !918, !DIExpression(), !2066)
  br label %for.cond.i, !dbg !2068

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2069
    #dbg_value(i32 %i.0.i, !918, !DIExpression(), !2066)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2070
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !2071

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2072
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2072
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2073
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2073
  %add.i = add i16 %0, %1, !dbg !2074
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2075
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2076
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2077
    #dbg_value(i32 %inc.i, !918, !DIExpression(), !2066)
  br label %for.cond.i, !dbg !2078, !llvm.loop !2079

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2081
    #dbg_value(i32 %inc, !897, !DIExpression(), !2058)
  br label %for.cond, !dbg !2082, !llvm.loop !2083

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2085
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2086 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2087, !DIExpression(), !2088)
    #dbg_value(ptr %a, !2089, !DIExpression(), !2088)
    #dbg_declare(ptr %t, !2090, !DIExpression(), !2094)
    #dbg_value(i32 0, !2095, !DIExpression(), !2088)
  br label %for.cond, !dbg !2096

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !2098
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2087, !DIExpression(), !2088)
    #dbg_value(i32 %i.0, !2095, !DIExpression(), !2088)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2099
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !2101

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2102

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2105
    #dbg_value(i32 %j.0, !2106, !DIExpression(), !2088)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2107
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2102

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2109
  %add = or disjoint i32 %mul, %j.0, !dbg !2111
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2112
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2112
    #dbg_value(i16 %0, !2113, !DIExpression(), !2088)
  %isneg = icmp slt i16 %0, 0, !dbg !2114
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2114
  %add5 = add i16 %and, %0, !dbg !2115
    #dbg_value(i16 %add5, !2113, !DIExpression(), !2088)
  %conv7 = sext i16 %add5 to i32, !dbg !2116
    #dbg_value(i32 %conv7, !2117, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !2088)
    #dbg_value(i32 %conv7, !2117, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2088)
  %1 = mul i32 %conv7, 1290160, !dbg !2118
  %mul9 = add i32 %1, 134257275, !dbg !2118
    #dbg_value(i32 %mul9, !2117, !DIExpression(), !2088)
  %shr10 = lshr i32 %mul9, 28, !dbg !2119
    #dbg_value(i32 %shr10, !2117, !DIExpression(), !2088)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2120
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2121
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2122
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2123
    #dbg_value(i32 %inc, !2106, !DIExpression(), !2088)
  br label %for.cond1, !dbg !2124, !llvm.loop !2125

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2127
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2128
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !2128
  %shl18 = shl i8 %3, 4, !dbg !2129
  %or = or i8 %shl18, %2, !dbg !2130
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2131
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2132
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2132
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2133
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !2133
  %shl25 = shl i8 %5, 4, !dbg !2134
  %or26 = or i8 %shl25, %4, !dbg !2135
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2136
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !2137
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2138
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2138
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2139
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2139
  %shl33 = shl i8 %7, 4, !dbg !2140
  %or34 = or i8 %shl33, %6, !dbg !2141
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2142
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !2143
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2144
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !2144
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2145
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !2145
  %shl41 = shl i8 %9, 4, !dbg !2146
  %or42 = or i8 %shl41, %8, !dbg !2147
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2148
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !2149
    #dbg_value(ptr %r.addr.0, !2087, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !2088)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2150
    #dbg_value(ptr %add.ptr, !2087, !DIExpression(), !2088)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !2151
    #dbg_value(i32 %inc46, !2095, !DIExpression(), !2088)
  br label %for.cond, !dbg !2152, !llvm.loop !2153

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !2155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1544 {
entry:
    #dbg_value(ptr %r, !1543, !DIExpression(), !2156)
    #dbg_value(ptr %a, !1547, !DIExpression(), !2156)
    #dbg_value(i32 0, !1548, !DIExpression(), !2156)
  br label %for.cond, !dbg !2157

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2158
    #dbg_value(i32 %i.0, !1548, !DIExpression(), !2156)
    #dbg_value(ptr %a.addr.0, !1547, !DIExpression(), !2156)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2159
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2160

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2161
  %1 = and i8 %0, 15, !dbg !2162
  %conv2 = zext nneg i8 %1 to i32, !dbg !2163
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !2164
  %add = add nuw nsw i32 %mul, 8, !dbg !2165
  %shr = lshr i32 %add, 4, !dbg !2166
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !2167
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2168
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !2169
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !2170
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !2171
  %3 = lshr i8 %2, 4, !dbg !2172
  %conv11 = zext nneg i8 %3 to i32, !dbg !2173
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !2174
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !2175
  %shr14 = lshr i32 %add13, 4, !dbg !2176
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !2177
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !2178
  %add18 = or disjoint i32 %mul17, 1, !dbg !2179
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2180
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !2181
    #dbg_value(ptr %a.addr.0, !1547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2156)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2182
    #dbg_value(ptr %add.ptr, !1547, !DIExpression(), !2156)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2183
    #dbg_value(i32 %inc, !1548, !DIExpression(), !2156)
  br label %for.cond, !dbg !2184, !llvm.loop !2185

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2187
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2188 {
entry:
    #dbg_value(ptr %r, !2189, !DIExpression(), !2190)
    #dbg_value(ptr %a, !2191, !DIExpression(), !2190)
    #dbg_value(i32 0, !2192, !DIExpression(), !2190)
  br label %for.cond, !dbg !2193

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2195
    #dbg_value(i32 %i.0, !2192, !DIExpression(), !2190)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2196
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2198

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2199
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2201
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2201
    #dbg_value(i16 %0, !2202, !DIExpression(), !2190)
  %isneg = icmp slt i16 %0, 0, !dbg !2203
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2203
  %add = add i16 %and, %0, !dbg !2204
    #dbg_value(i16 %add, !2202, !DIExpression(), !2190)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2205
  %add5 = or disjoint i32 %mul4, 1, !dbg !2206
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2207
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2207
    #dbg_value(i16 %1, !2208, !DIExpression(), !2190)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2209
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2209
  %add11 = add i16 %and9, %1, !dbg !2210
    #dbg_value(i16 %add11, !2208, !DIExpression(), !2190)
  %conv15 = trunc i16 %add to i8, !dbg !2211
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2212
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2213
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2214
  %2 = lshr i16 %add, 8, !dbg !2215
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2215
  %conv21 = trunc i16 %add11 to i8, !dbg !2216
  %shl = shl i8 %conv21, 4, !dbg !2217
  %or = or i8 %shl, %shr20, !dbg !2218
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2219
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2220
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2220
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2221
  %4 = lshr i16 %add11, 4, !dbg !2222
  %conv28 = trunc i16 %4 to i8, !dbg !2223
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2224
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2225
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2225
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2226
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2227
    #dbg_value(i32 %inc, !2192, !DIExpression(), !2190)
  br label %for.cond, !dbg !2228, !llvm.loop !2229

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2231
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2232 {
entry:
    #dbg_value(ptr %r, !2233, !DIExpression(), !2234)
    #dbg_value(ptr %a, !2235, !DIExpression(), !2234)
    #dbg_value(i32 0, !2236, !DIExpression(), !2234)
  br label %for.cond, !dbg !2237

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2239
    #dbg_value(i32 %i.0, !2236, !DIExpression(), !2234)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2240
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2242

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2243
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2245
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2245
  %conv = zext i8 %0 to i16, !dbg !2245
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2246
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2247
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2247
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2247
  %conv5 = zext i8 %2 to i16, !dbg !2248
  %shl = shl nuw i16 %conv5, 8, !dbg !2249
  %shl.masked = and i16 %shl, 3840, !dbg !2250
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2250
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2251
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2252
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2253
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2254
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2255
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2255
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2255
  %5 = lshr i8 %4, 4, !dbg !2256
  %shr13 = zext nneg i8 %5 to i16, !dbg !2256
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2257
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2258
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2258
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2258
  %conv18 = zext i8 %7 to i16, !dbg !2259
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2260
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2261
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2262
  %add25 = or disjoint i32 %mul24, 1, !dbg !2263
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2264
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2265
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2266
    #dbg_value(i32 %inc, !2236, !DIExpression(), !2234)
  br label %for.cond, !dbg !2267, !llvm.loop !2268

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2270
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1071 {
entry:
    #dbg_value(ptr %r, !1070, !DIExpression(), !2271)
    #dbg_value(ptr %msg, !1076, !DIExpression(), !2271)
    #dbg_value(i32 0, !1077, !DIExpression(), !2271)
  br label %for.cond, !dbg !2272

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2273
    #dbg_value(i32 %i.0, !1077, !DIExpression(), !2271)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2274
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2275

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2276

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2277
    #dbg_value(i32 %j.0, !1088, !DIExpression(), !2271)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2278
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2276

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2279
  %add = or disjoint i32 %mul, %j.0, !dbg !2280
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2281
  store i16 0, ptr %arrayidx, align 2, !dbg !2282
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2283
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2283
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2284
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2285
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2285
  %conv = zext i8 %0 to i32, !dbg !2285
    #dbg_value(ptr %add.ptr6, !1099, !DIExpression(), !2286)
    #dbg_value(i16 1665, !1105, !DIExpression(), !2286)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2286)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2286)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2288
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2289
  %3 = and i32 %2, %conv, !dbg !2289
  %4 = icmp eq i32 %3, 0, !dbg !2289
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2290
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2290
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2291
    #dbg_value(i32 %inc, !1088, !DIExpression(), !2271)
  br label %for.cond1, !dbg !2292, !llvm.loop !2293

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2295
    #dbg_value(i32 %inc10, !1077, !DIExpression(), !2271)
  br label %for.cond, !dbg !2296, !llvm.loop !2297

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2299
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1665 {
entry:
    #dbg_value(ptr %msg, !2300, !DIExpression(), !2301)
    #dbg_value(ptr %a, !2302, !DIExpression(), !2301)
    #dbg_value(i32 0, !1684, !DIExpression(), !2301)
  br label %for.cond, !dbg !2303

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2304
    #dbg_value(i32 %i.0, !1684, !DIExpression(), !2301)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2305
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2306

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2307
  store i8 0, ptr %arrayidx, align 1, !dbg !2308
    #dbg_value(i32 0, !1691, !DIExpression(), !2301)
  br label %for.cond1, !dbg !2309

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2310
    #dbg_value(i32 %j.0, !1691, !DIExpression(), !2301)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2311
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2312

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2313
  %add = or disjoint i32 %mul, %j.0, !dbg !2314
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2315
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2315
  %conv = sext i16 %0 to i32, !dbg !2315
    #dbg_value(i32 %conv, !1702, !DIExpression(), !2301)
    #dbg_value(i32 %conv, !1702, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2301)
    #dbg_value(i32 %conv, !1702, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2301)
  %1 = mul i32 %conv, 161270, !dbg !2316
  %mul6 = add i32 %1, 134257275, !dbg !2316
    #dbg_value(i32 %mul6, !1702, !DIExpression(), !2301)
  %shr = lshr i32 %mul6, 28, !dbg !2317
    #dbg_value(i32 %shr, !1702, !DIExpression(), !2301)
  %and = and i32 %shr, 1, !dbg !2318
    #dbg_value(i32 %and, !1702, !DIExpression(), !2301)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2319
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2320
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2321
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2321
  %conv10 = or i8 %2, %3, !dbg !2321
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2321
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2322
    #dbg_value(i32 %inc, !1691, !DIExpression(), !2301)
  br label %for.cond1, !dbg !2323, !llvm.loop !2324

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2326
    #dbg_value(i32 %inc12, !1684, !DIExpression(), !2301)
  br label %for.cond, !dbg !2327, !llvm.loop !2328

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2330
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !542 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !552, !DIExpression(), !2331)
    #dbg_value(ptr %seed, !554, !DIExpression(), !2331)
    #dbg_value(i8 %nonce, !555, !DIExpression(), !2331)
    #dbg_declare(ptr %buf, !556, !DIExpression(), !2332)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2333
    #dbg_value(ptr %buf, !564, !DIExpression(), !2335)
    #dbg_value(i32 128, !566, !DIExpression(), !2335)
    #dbg_value(ptr %seed, !567, !DIExpression(), !2335)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !2335)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !2336)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2333
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2337
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2338
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2339
    #dbg_value(ptr %buf, !583, !DIExpression(), !2342)
    #dbg_value(i32 128, !585, !DIExpression(), !2342)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !2342)
    #dbg_value(i32 33, !587, !DIExpression(), !2342)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !2343)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !2344)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !2344)
    #dbg_value(i32 33, !593, !DIExpression(), !2344)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2339
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2345
  store i32 136, ptr %pos.i.i, align 8, !dbg !2346
    #dbg_value(i32 0, !596, !DIExpression(), !2342)
    #dbg_value(ptr %buf, !597, !DIExpression(), !2347)
    #dbg_value(i32 0, !601, !DIExpression(), !2347)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !2347)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2349)
    #dbg_value(i32 0, !355, !DIExpression(), !2349)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2349)
    #dbg_value(i32 136, !357, !DIExpression(), !2349)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2349)
    #dbg_value(i32 0, !355, !DIExpression(), !2349)
    #dbg_value(i32 128, !585, !DIExpression(), !2342)
    #dbg_value(ptr %buf, !583, !DIExpression(), !2342)
    #dbg_value(ptr %buf, !605, !DIExpression(), !2351)
    #dbg_value(i32 128, !609, !DIExpression(), !2351)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !2351)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2353
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2353
    #dbg_value(ptr %buf, !612, !DIExpression(), !2354)
    #dbg_value(i32 128, !618, !DIExpression(), !2354)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !2354)
    #dbg_value(i32 %0, !620, !DIExpression(), !2354)
    #dbg_value(i32 136, !621, !DIExpression(), !2354)
  br label %while.cond.i2, !dbg !2356

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !2354)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !2354)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !2354)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2356
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2356

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2357
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2357

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2358
    #dbg_value(i32 0, !620, !DIExpression(), !2354)
  br label %if.end.i, !dbg !2359

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !2354)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !2354)
  br label %for.cond.i7, !dbg !2360

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2361
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !2354)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !2354)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2362
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2363
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2363
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2363
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2364

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2365
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2366
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2366
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2367
  %mul.i12 = and i32 %rem.i, 56, !dbg !2367
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2368
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2368
  %conv.i = trunc i64 %shr.i to i8, !dbg !2366
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2354)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2369
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2370
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !2354)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2371
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !2354)
  br label %for.cond.i7, !dbg !2372, !llvm.loop !2373

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2361
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2375
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2376
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !2354)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !2354)
  br label %while.cond.i2, !dbg !2356, !llvm.loop !2377

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2379
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2380
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2381
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2382
    #dbg_value(ptr %r, !656, !DIExpression(), !2383)
    #dbg_value(ptr %buf, !668, !DIExpression(), !2383)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2385
  ret void, !dbg !2386
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1196 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1198, !DIExpression(), !2387)
    #dbg_value(ptr %seed, !1200, !DIExpression(), !2387)
    #dbg_value(i8 %nonce, !1201, !DIExpression(), !2387)
    #dbg_declare(ptr %buf, !1202, !DIExpression(), !2388)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2389
    #dbg_value(ptr %buf, !564, !DIExpression(), !2391)
    #dbg_value(i32 128, !566, !DIExpression(), !2391)
    #dbg_value(ptr %seed, !567, !DIExpression(), !2391)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !2391)
    #dbg_declare(ptr %extkey.i, !569, !DIExpression(), !2392)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2389
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2393
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2394
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2395
    #dbg_value(ptr %buf, !583, !DIExpression(), !2398)
    #dbg_value(i32 128, !585, !DIExpression(), !2398)
    #dbg_value(ptr %extkey.i, !586, !DIExpression(), !2398)
    #dbg_value(i32 33, !587, !DIExpression(), !2398)
    #dbg_declare(ptr %state.i, !588, !DIExpression(), !2399)
    #dbg_value(ptr %state.i, !590, !DIExpression(), !2400)
    #dbg_value(ptr %extkey.i, !592, !DIExpression(), !2400)
    #dbg_value(i32 33, !593, !DIExpression(), !2400)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2395
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2401
  store i32 136, ptr %pos.i.i, align 8, !dbg !2402
    #dbg_value(i32 0, !596, !DIExpression(), !2398)
    #dbg_value(ptr %buf, !597, !DIExpression(), !2403)
    #dbg_value(i32 0, !601, !DIExpression(), !2403)
    #dbg_value(ptr %state.i, !602, !DIExpression(), !2403)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2405)
    #dbg_value(i32 0, !355, !DIExpression(), !2405)
    #dbg_value(ptr %state.i, !356, !DIExpression(), !2405)
    #dbg_value(i32 136, !357, !DIExpression(), !2405)
    #dbg_value(ptr %buf, !348, !DIExpression(), !2405)
    #dbg_value(i32 0, !355, !DIExpression(), !2405)
    #dbg_value(i32 128, !585, !DIExpression(), !2398)
    #dbg_value(ptr %buf, !583, !DIExpression(), !2398)
    #dbg_value(ptr %buf, !605, !DIExpression(), !2407)
    #dbg_value(i32 128, !609, !DIExpression(), !2407)
    #dbg_value(ptr %state.i, !610, !DIExpression(), !2407)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2409
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2409
    #dbg_value(ptr %buf, !612, !DIExpression(), !2410)
    #dbg_value(i32 128, !618, !DIExpression(), !2410)
    #dbg_value(ptr %state.i, !619, !DIExpression(), !2410)
    #dbg_value(i32 %0, !620, !DIExpression(), !2410)
    #dbg_value(i32 136, !621, !DIExpression(), !2410)
  br label %while.cond.i2, !dbg !2412

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !2410)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !2410)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !2410)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2412
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2412

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2413
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2413

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2414
    #dbg_value(i32 0, !620, !DIExpression(), !2410)
  br label %if.end.i, !dbg !2415

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !2410)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !2410)
  br label %for.cond.i7, !dbg !2416

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2417
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !2410)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !2410)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2418
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2419
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2419
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2419
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2420

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2421
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2422
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2422
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2423
  %mul.i12 = and i32 %rem.i, 56, !dbg !2423
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2424
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2424
  %conv.i = trunc i64 %shr.i to i8, !dbg !2422
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2410)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2425
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2426
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !2410)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2427
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !2410)
  br label %for.cond.i7, !dbg !2428, !llvm.loop !2429

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2417
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2431
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2432
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !2410)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !2410)
  br label %while.cond.i2, !dbg !2412, !llvm.loop !2433

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2435
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2436
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2437
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2438
    #dbg_value(ptr %r, !1255, !DIExpression(), !2439)
    #dbg_value(ptr %buf, !1259, !DIExpression(), !2439)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2441
  ret void, !dbg !2442
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !769 {
entry:
    #dbg_value(ptr %r, !768, !DIExpression(), !2443)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #4, !dbg !2444
    #dbg_value(ptr %r, !775, !DIExpression(), !2445)
    #dbg_value(i32 0, !779, !DIExpression(), !2445)
  br label %for.cond.i, !dbg !2447

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2448
    #dbg_value(i32 %i.0.i, !779, !DIExpression(), !2445)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2449
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2450

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2451
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2451
    #dbg_value(i16 %0, !787, !DIExpression(), !2452)
    #dbg_value(i16 20159, !794, !DIExpression(), !2452)
  %conv.i.i = sext i16 %0 to i32, !dbg !2454
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2455
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2456
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2457
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2452)
    #dbg_value(i32 %shr.i.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2452)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2458
  %2 = mul i16 %1, -3329, !dbg !2458
  %conv7.i.i = add i16 %2, %0, !dbg !2458
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2459
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2460
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2461
    #dbg_value(i32 %inc.i, !779, !DIExpression(), !2445)
  br label %for.cond.i, !dbg !2462, !llvm.loop !2463

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  ret void, !dbg !2465
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !776 {
entry:
    #dbg_value(ptr %r, !775, !DIExpression(), !2466)
    #dbg_value(i32 0, !779, !DIExpression(), !2466)
  br label %for.cond, !dbg !2467

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2468
    #dbg_value(i32 %i.0, !779, !DIExpression(), !2466)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2469
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2470

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2471
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2471
    #dbg_value(i16 %0, !787, !DIExpression(), !2472)
    #dbg_value(i16 20159, !794, !DIExpression(), !2472)
  %conv.i = sext i16 %0 to i32, !dbg !2474
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2475
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2476
  %shr.i = ashr i32 %add.i, 26, !dbg !2477
    #dbg_value(i32 %shr.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2472)
    #dbg_value(i32 %shr.i, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2472)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2478
  %2 = mul i16 %1, -3329, !dbg !2478
  %conv7.i = add i16 %2, %0, !dbg !2478
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2479
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2480
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2481
    #dbg_value(i32 %inc, !779, !DIExpression(), !2466)
  br label %for.cond, !dbg !2482, !llvm.loop !2483

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2485
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1386 {
entry:
    #dbg_value(ptr %r, !1385, !DIExpression(), !2486)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #4, !dbg !2487
  ret void, !dbg !2488
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2489 {
entry:
    #dbg_value(ptr %r, !2490, !DIExpression(), !2491)
    #dbg_value(ptr %a, !2492, !DIExpression(), !2491)
    #dbg_value(ptr %b, !2493, !DIExpression(), !2491)
    #dbg_value(i32 0, !2494, !DIExpression(), !2491)
  br label %for.cond, !dbg !2495

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2497
    #dbg_value(i32 %i.0, !2494, !DIExpression(), !2491)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2498
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2500

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2501
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2503
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2504
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2505
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2506
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2507
  %add = or disjoint i32 %i.0, 64, !dbg !2508
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !2509
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2509
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2510
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2511
  %add10 = or disjoint i32 %mul9, 2, !dbg !2512
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2513
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2514
  %add14 = or disjoint i32 %mul13, 2, !dbg !2515
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2516
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2517
  %add18 = or disjoint i32 %mul17, 2, !dbg !2518
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2519
  %add20 = or disjoint i32 %i.0, 64, !dbg !2520
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add20, !dbg !2521
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2521
  %sub = sub i16 0, %1, !dbg !2522
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2523
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2524
    #dbg_value(i32 %inc, !2494, !DIExpression(), !2491)
  br label %for.cond, !dbg !2525, !llvm.loop !2526

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2528
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !861 {
entry:
    #dbg_value(ptr %r, !860, !DIExpression(), !2529)
    #dbg_value(i16 1353, !864, !DIExpression(), !2529)
    #dbg_value(i32 0, !865, !DIExpression(), !2529)
  br label %for.cond, !dbg !2530

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2531
    #dbg_value(i32 %i.0, !865, !DIExpression(), !2529)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2532
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2533

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2534
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2534
  %conv = sext i16 %0 to i32, !dbg !2535
  %mul = mul nsw i32 %conv, 1353, !dbg !2536
    #dbg_value(i32 %mul, !875, !DIExpression(), !2537)
    #dbg_value(i32 %mul, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2537)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2539
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2539
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2540
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2541
  %shr.i = lshr i32 %sub.i, 16, !dbg !2542
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2543
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2537)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2544
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2545
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2546
    #dbg_value(i32 %inc, !865, !DIExpression(), !2529)
  br label %for.cond, !dbg !2547, !llvm.loop !2548

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2550
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !909 {
entry:
    #dbg_value(ptr %r, !908, !DIExpression(), !2551)
    #dbg_value(ptr %a, !916, !DIExpression(), !2551)
    #dbg_value(ptr %b, !917, !DIExpression(), !2551)
    #dbg_value(i32 0, !918, !DIExpression(), !2551)
  br label %for.cond, !dbg !2552

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2553
    #dbg_value(i32 %i.0, !918, !DIExpression(), !2551)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2554
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2555

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2556
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2556
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2557
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2557
  %add = add i16 %0, %1, !dbg !2558
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2559
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2560
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2561
    #dbg_value(i32 %inc, !918, !DIExpression(), !2551)
  br label %for.cond, !dbg !2562, !llvm.loop !2563

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2565
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1637 {
entry:
    #dbg_value(ptr %r, !1636, !DIExpression(), !2566)
    #dbg_value(ptr %a, !1640, !DIExpression(), !2566)
    #dbg_value(ptr %b, !1641, !DIExpression(), !2566)
    #dbg_value(i32 0, !1642, !DIExpression(), !2566)
  br label %for.cond, !dbg !2567

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2568
    #dbg_value(i32 %i.0, !1642, !DIExpression(), !2566)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2569
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2570

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2571
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2571
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2572
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2572
  %sub = sub i16 %0, %1, !dbg !2573
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2574
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2575
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2576
    #dbg_value(i32 %inc, !1642, !DIExpression(), !2566)
  br label %for.cond, !dbg !2577, !llvm.loop !2578

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2580
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2581 {
entry:
    #dbg_value(ptr %r, !2584, !DIExpression(), !2585)
    #dbg_value(i32 1, !2586, !DIExpression(), !2585)
    #dbg_value(i32 128, !2587, !DIExpression(), !2585)
  br label %for.cond, !dbg !2588

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2590
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2591
    #dbg_value(i32 %k.0, !2586, !DIExpression(), !2585)
    #dbg_value(i32 %len.0, !2587, !DIExpression(), !2585)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2592
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2594

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2595

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2598
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2585
    #dbg_value(i32 %k.1, !2586, !DIExpression(), !2585)
    #dbg_value(i32 %start.0, !2599, !DIExpression(), !2585)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2600
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2595

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2586, !DIExpression(), !2585)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !2602
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2602
    #dbg_value(i16 %0, !2604, !DIExpression(), !2585)
    #dbg_value(i32 %start.0, !2605, !DIExpression(), !2585)
  br label %for.cond4, !dbg !2606

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2608
    #dbg_value(i32 %j.0, !2605, !DIExpression(), !2585)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2609
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2611
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !2612

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2613
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !2613
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !2613
    #dbg_value(i16 %0, !2615, !DIExpression(), !2619)
    #dbg_value(i16 %2, !2621, !DIExpression(), !2619)
  %conv.i = sext i16 %0 to i32, !dbg !2622
  %conv1.i = sext i16 %2 to i32, !dbg !2623
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2624
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2625)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2625)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2627
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2627
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2628
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2629
  %shr.i = lshr i32 %sub.i, 16, !dbg !2630
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2631
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2625)
    #dbg_value(i16 %conv5.i, !2632, !DIExpression(), !2585)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2633
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2633
  %sub = sub i16 %3, %conv5.i, !dbg !2634
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2635
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !2635
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !2636
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2637
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !2637
  %add17 = add i16 %5, %conv5.i, !dbg !2638
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2639
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !2640
  %inc20 = add nuw i32 %j.0, 1, !dbg !2641
    #dbg_value(i32 %inc20, !2605, !DIExpression(), !2585)
  br label %for.cond4, !dbg !2642, !llvm.loop !2643

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2608
  %inc = add i32 %k.1, 1, !dbg !2645
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !2646
    #dbg_value(i32 %add22, !2599, !DIExpression(), !2585)
  br label %for.cond1, !dbg !2647, !llvm.loop !2648

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2585
  %shr = lshr i32 %len.0, 1, !dbg !2650
    #dbg_value(i32 %shr, !2587, !DIExpression(), !2585)
  br label %for.cond, !dbg !2651, !llvm.loop !2652

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !2654
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2655 {
entry:
    #dbg_value(ptr %r, !2656, !DIExpression(), !2657)
    #dbg_value(i16 1441, !2658, !DIExpression(), !2657)
    #dbg_value(i32 127, !2659, !DIExpression(), !2657)
    #dbg_value(i32 2, !2660, !DIExpression(), !2657)
  br label %for.cond, !dbg !2661

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !2663
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !2664
    #dbg_value(i32 %k.0, !2659, !DIExpression(), !2657)
    #dbg_value(i32 %len.0, !2660, !DIExpression(), !2657)
  %cmp = icmp ult i32 %len.0, 129, !dbg !2665
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !2667

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2668

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !2671

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !2673
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !2657
    #dbg_value(i32 %k.1, !2659, !DIExpression(), !2657)
    #dbg_value(i32 %start.0, !2674, !DIExpression(), !2657)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2675
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !2668

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !2659, !DIExpression(), !2657)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !2677
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2677
    #dbg_value(i16 %0, !2679, !DIExpression(), !2657)
    #dbg_value(i32 %start.0, !2680, !DIExpression(), !2657)
  br label %for.cond4, !dbg !2681

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !2683
    #dbg_value(i32 %j.0, !2680, !DIExpression(), !2657)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2684
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2686
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !2687

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2688
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !2688
    #dbg_value(i16 %1, !2690, !DIExpression(), !2657)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2691
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !2691
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2691
  %add11 = add i16 %1, %3, !dbg !2692
    #dbg_value(i16 %add11, !787, !DIExpression(), !2693)
    #dbg_value(i16 20159, !794, !DIExpression(), !2693)
  %conv.i10 = sext i16 %add11 to i32, !dbg !2695
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !2696
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !2697
  %shr.i12 = ashr i32 %add.i, 26, !dbg !2698
    #dbg_value(i32 %shr.i12, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2693)
    #dbg_value(i32 %shr.i12, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2693)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !2699
  %5 = mul i16 %4, -3329, !dbg !2699
  %conv7.i = add i16 %5, %add11, !dbg !2699
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2700
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !2701
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2702
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !2702
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !2702
  %sub = sub i16 %7, %1, !dbg !2703
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2704
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !2704
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !2705
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2706
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !2706
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !2706
    #dbg_value(i16 %0, !2615, !DIExpression(), !2707)
    #dbg_value(i16 %10, !2621, !DIExpression(), !2707)
  %conv.i = sext i16 %0 to i32, !dbg !2709
  %conv1.i = sext i16 %10 to i32, !dbg !2710
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2711
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2712)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2712)
  %sext.i4 = mul i32 %mul.i, -218038272, !dbg !2714
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !2714
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !2715
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i, !dbg !2716
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !2717
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !2718
    #dbg_value(i16 %conv5.i9, !880, !DIExpression(), !2712)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2719
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !2719
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !2720
  %inc = add nuw i32 %j.0, 1, !dbg !2721
    #dbg_value(i32 %inc, !2680, !DIExpression(), !2657)
  br label %for.cond4, !dbg !2722, !llvm.loop !2723

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2683
  %dec = add i32 %k.1, -1, !dbg !2725
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !2726
    #dbg_value(i32 %add27, !2674, !DIExpression(), !2657)
  br label %for.cond1, !dbg !2727, !llvm.loop !2728

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2657
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !2730
    #dbg_value(i32 %shl, !2660, !DIExpression(), !2657)
  br label %for.cond, !dbg !2731, !llvm.loop !2732

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !2734
    #dbg_value(i32 %j.1, !2680, !DIExpression(), !2657)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !2735
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !2671

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2737
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !2737
    #dbg_value(i16 %12, !2615, !DIExpression(), !2738)
    #dbg_value(i16 1441, !2621, !DIExpression(), !2738)
  %conv.i1 = sext i16 %12 to i32, !dbg !2740
  %mul.i2 = mul nsw i32 %conv.i1, 1441, !dbg !2741
    #dbg_value(i32 %mul.i2, !875, !DIExpression(), !2742)
    #dbg_value(i32 %mul.i2, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2742)
  %sext.i = mul i32 %conv.i1, -660537344, !dbg !2744
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2744
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2745
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i2, !dbg !2746
  %shr.i = lshr i32 %sub.i, 16, !dbg !2747
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2748
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2742)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2749
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !2750
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !2751
    #dbg_value(i32 %inc39, !2680, !DIExpression(), !2657)
  br label %for.cond31, !dbg !2752, !llvm.loop !2753

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !2755
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !2756 {
entry:
    #dbg_value(ptr %r, !2760, !DIExpression(), !2761)
    #dbg_value(ptr %a, !2762, !DIExpression(), !2761)
    #dbg_value(ptr %b, !2763, !DIExpression(), !2761)
    #dbg_value(i16 %zeta, !2764, !DIExpression(), !2761)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2765
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2765
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2766
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !2766
    #dbg_value(i16 %0, !2615, !DIExpression(), !2767)
    #dbg_value(i16 %1, !2621, !DIExpression(), !2767)
  %conv.i = sext i16 %0 to i32, !dbg !2769
  %conv1.i = sext i16 %1 to i32, !dbg !2770
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2771
    #dbg_value(i32 %mul.i, !875, !DIExpression(), !2772)
    #dbg_value(i32 %mul.i, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2772)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2774
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2774
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2775
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2776
  %shr.i = lshr i32 %sub.i, 16, !dbg !2777
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2778
    #dbg_value(i16 %conv5.i, !880, !DIExpression(), !2772)
  store i16 %conv5.i, ptr %r, align 2, !dbg !2779
    #dbg_value(i16 %conv5.i, !2615, !DIExpression(), !2780)
    #dbg_value(i16 %zeta, !2621, !DIExpression(), !2780)
  %conv.i9 = ashr i32 %sub.i, 16, !dbg !2782
  %conv1.i10 = sext i16 %zeta to i32, !dbg !2783
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !2784
    #dbg_value(i32 %mul.i11, !875, !DIExpression(), !2785)
    #dbg_value(i32 %mul.i11, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2785)
  %sext.i17 = mul i32 %mul.i11, -218038272, !dbg !2787
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !2787
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !2788
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i11, !dbg !2789
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !2790
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !2791
    #dbg_value(i16 %conv5.i22, !880, !DIExpression(), !2785)
  store i16 %conv5.i22, ptr %r, align 2, !dbg !2792
  %2 = load i16, ptr %a, align 2, !dbg !2793
  %3 = load i16, ptr %b, align 2, !dbg !2794
    #dbg_value(i16 %2, !2615, !DIExpression(), !2795)
    #dbg_value(i16 %3, !2621, !DIExpression(), !2795)
  %conv.i1 = sext i16 %2 to i32, !dbg !2797
  %conv1.i2 = sext i16 %3 to i32, !dbg !2798
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !2799
    #dbg_value(i32 %mul.i3, !875, !DIExpression(), !2800)
    #dbg_value(i32 %mul.i3, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2800)
  %sext.i35 = mul i32 %mul.i3, -218038272, !dbg !2802
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !2802
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !2803
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i3, !dbg !2804
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !2805
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !2806
    #dbg_value(i16 %conv5.i40, !880, !DIExpression(), !2800)
  %4 = load i16, ptr %r, align 2, !dbg !2807
  %add = add i16 %4, %conv5.i40, !dbg !2807
  store i16 %add, ptr %r, align 2, !dbg !2807
  %5 = load i16, ptr %a, align 2, !dbg !2808
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !2809
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !2809
    #dbg_value(i16 %5, !2615, !DIExpression(), !2810)
    #dbg_value(i16 %6, !2621, !DIExpression(), !2810)
  %conv.i5 = sext i16 %5 to i32, !dbg !2812
  %conv1.i6 = sext i16 %6 to i32, !dbg !2813
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !2814
    #dbg_value(i32 %mul.i7, !875, !DIExpression(), !2815)
    #dbg_value(i32 %mul.i7, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2815)
  %sext.i29 = mul i32 %mul.i7, -218038272, !dbg !2817
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !2817
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !2818
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i7, !dbg !2819
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !2820
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !2821
    #dbg_value(i16 %conv5.i34, !880, !DIExpression(), !2815)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2822
  store i16 %conv5.i34, ptr %arrayidx15, align 2, !dbg !2823
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !2824
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !2824
  %8 = load i16, ptr %b, align 2, !dbg !2825
    #dbg_value(i16 %7, !2615, !DIExpression(), !2826)
    #dbg_value(i16 %8, !2621, !DIExpression(), !2826)
  %conv.i13 = sext i16 %7 to i32, !dbg !2828
  %conv1.i14 = sext i16 %8 to i32, !dbg !2829
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !2830
    #dbg_value(i32 %mul.i15, !875, !DIExpression(), !2831)
    #dbg_value(i32 %mul.i15, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2831)
  %sext.i23 = mul i32 %mul.i15, -218038272, !dbg !2833
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !2833
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !2834
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i15, !dbg !2835
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !2836
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !2837
    #dbg_value(i16 %conv5.i28, !880, !DIExpression(), !2831)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !2838
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !2839
  %add22 = add i16 %9, %conv5.i28, !dbg !2839
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !2839
  ret void, !dbg !2840
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !657 {
entry:
    #dbg_value(ptr %r, !656, !DIExpression(), !2841)
    #dbg_value(ptr %buf, !668, !DIExpression(), !2841)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !2842
  ret void, !dbg !2843
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !2844 {
entry:
    #dbg_value(ptr %r, !2845, !DIExpression(), !2846)
    #dbg_value(ptr %buf, !2847, !DIExpression(), !2846)
    #dbg_value(i32 0, !2848, !DIExpression(), !2846)
  br label %for.cond, !dbg !2849

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !2851
    #dbg_value(i32 %i.0, !2848, !DIExpression(), !2846)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2852
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !2854

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2855
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !2857
    #dbg_value(ptr %add.ptr, !2858, !DIExpression(), !2862)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !2864
  %conv.i = zext i8 %0 to i32, !dbg !2865
    #dbg_value(i32 %conv.i, !2866, !DIExpression(), !2862)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !2867
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !2867
  %conv2.i = zext i8 %1 to i32, !dbg !2868
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !2869
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !2870
    #dbg_value(i32 %or.i, !2866, !DIExpression(), !2862)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !2871
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !2871
  %conv4.i = zext i8 %2 to i32, !dbg !2872
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !2873
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !2874
    #dbg_value(i32 %or6.i, !2866, !DIExpression(), !2862)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !2875
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !2875
  %conv8.i = zext i8 %3 to i32, !dbg !2876
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !2877
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !2878
    #dbg_value(i32 %or10.i, !2866, !DIExpression(), !2862)
    #dbg_value(i32 %or10.i, !2879, !DIExpression(), !2846)
  %and = and i32 %or10.i, 1431655765, !dbg !2880
    #dbg_value(i32 %and, !2881, !DIExpression(), !2846)
  %shr = lshr i32 %or10.i, 1, !dbg !2882
  %and1 = and i32 %shr, 1431655765, !dbg !2883
  %add = add nuw i32 %and, %and1, !dbg !2884
    #dbg_value(i32 %add, !2881, !DIExpression(), !2846)
    #dbg_value(i32 0, !2885, !DIExpression(), !2846)
  br label %for.cond2, !dbg !2886

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !2888
    #dbg_value(i32 %j.0, !2885, !DIExpression(), !2846)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2889
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !2891

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !2892
  %shr7 = lshr i32 %add, %mul5, !dbg !2894
  %conv = and i32 %shr7, 3, !dbg !2895
    #dbg_value(i32 %shr7, !2896, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !2846)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !2897
  %add10 = or disjoint i32 %mul9, 2, !dbg !2898
  %shr11 = lshr i32 %add, %add10, !dbg !2899
  %conv13 = and i32 %shr11, 3, !dbg !2900
    #dbg_value(i32 %conv13, !2901, !DIExpression(), !2846)
  %sub = sub nsw i32 %conv, %conv13, !dbg !2902
  %conv16 = trunc nsw i32 %sub to i16, !dbg !2903
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !2904
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !2905
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2906
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !2907
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2908
    #dbg_value(i32 %inc, !2885, !DIExpression(), !2846)
  br label %for.cond2, !dbg !2909, !llvm.loop !2910

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !2912
    #dbg_value(i32 %inc20, !2848, !DIExpression(), !2846)
  br label %for.cond, !dbg !2913, !llvm.loop !2914

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !2916
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1256 {
entry:
    #dbg_value(ptr %r, !1255, !DIExpression(), !2917)
    #dbg_value(ptr %buf, !1259, !DIExpression(), !2917)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !2918
  ret void, !dbg !2919
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !876 {
entry:
    #dbg_value(i32 %a, !875, !DIExpression(), !2920)
    #dbg_value(i32 %a, !880, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2920)
  %sext = mul i32 %a, -218038272, !dbg !2921
  %conv3 = ashr exact i32 %sext, 16, !dbg !2921
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !2922
  %sub = add i32 %mul4.neg, %a, !dbg !2923
  %shr = lshr i32 %sub, 16, !dbg !2924
  %conv5 = trunc nuw i32 %shr to i16, !dbg !2925
    #dbg_value(i16 %conv5, !880, !DIExpression(), !2920)
  ret i16 %conv5, !dbg !2926
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !788 {
entry:
    #dbg_value(i16 %a, !787, !DIExpression(), !2927)
    #dbg_value(i16 20159, !794, !DIExpression(), !2927)
  %conv = sext i16 %a to i32, !dbg !2928
  %mul = mul nsw i32 %conv, 20159, !dbg !2929
  %add = add nsw i32 %mul, 33554432, !dbg !2930
  %shr = ashr i32 %add, 26, !dbg !2931
    #dbg_value(i32 %shr, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2927)
    #dbg_value(i32 %shr, !799, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2927)
  %0 = trunc nsw i32 %shr to i16, !dbg !2932
  %1 = mul i16 %0, -3329, !dbg !2932
  %conv7 = add i16 %1, %a, !dbg !2932
  ret i16 %conv7, !dbg !2933
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !159 {
entry:
    #dbg_value(ptr %a, !158, !DIExpression(), !2934)
    #dbg_value(ptr %b, !167, !DIExpression(), !2934)
    #dbg_value(i32 %len, !168, !DIExpression(), !2934)
    #dbg_value(i8 0, !169, !DIExpression(), !2934)
    #dbg_value(i32 0, !170, !DIExpression(), !2934)
  br label %for.cond, !dbg !2935

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2936
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !2934
    #dbg_value(i8 %r.0, !169, !DIExpression(), !2934)
    #dbg_value(i32 %i.0, !170, !DIExpression(), !2934)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2937
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2938

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2934)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !2939
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2939
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !2940
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2940
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2934)
  %xor1 = xor i8 %0, %1, !dbg !2941
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2934)
  %or2 = or i8 %r.0, %xor1, !dbg !2942
    #dbg_value(i8 %or2, !169, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2934)
    #dbg_value(i8 %or2, !169, !DIExpression(), !2934)
  %inc = add i32 %i.0, 1, !dbg !2943
    #dbg_value(i32 %inc, !170, !DIExpression(), !2934)
  br label %for.cond, !dbg !2944, !llvm.loop !2945

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !2934
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !2947
  %conv6 = zext i1 %2 to i32, !dbg !2948
  ret i32 %conv6, !dbg !2949
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !191 {
entry:
    #dbg_value(ptr %r, !190, !DIExpression(), !2950)
    #dbg_value(ptr %x, !196, !DIExpression(), !2950)
    #dbg_value(i32 %len, !197, !DIExpression(), !2950)
    #dbg_value(i8 %b, !198, !DIExpression(), !2950)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !2951, !srcloc !200
    #dbg_value(i8 %0, !198, !DIExpression(), !2950)
  %sub = sub i8 0, %0, !dbg !2952
    #dbg_value(i8 %sub, !198, !DIExpression(), !2950)
    #dbg_value(i32 0, !202, !DIExpression(), !2950)
  br label %for.cond, !dbg !2953

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2954
    #dbg_value(i32 %i.0, !202, !DIExpression(), !2950)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2955
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2956

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2957
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2957
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2958
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !2958
  %xor1 = xor i8 %1, %2, !dbg !2959
  %and2 = and i8 %xor1, %sub, !dbg !2960
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2961
  %xor93 = xor i8 %1, %and2, !dbg !2962
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !2962
  %inc = add i32 %i.0, 1, !dbg !2963
    #dbg_value(i32 %inc, !202, !DIExpression(), !2950)
  br label %for.cond, !dbg !2964, !llvm.loop !2965

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2967
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1100 {
entry:
    #dbg_value(ptr %r, !1099, !DIExpression(), !2968)
    #dbg_value(i16 %v, !1105, !DIExpression(), !2968)
    #dbg_value(i16 %b, !1106, !DIExpression(), !2968)
  %sub = sub i16 0, %b, !dbg !2969
    #dbg_value(i16 %sub, !1106, !DIExpression(), !2968)
  %0 = load i16, ptr %r, align 2, !dbg !2970
  %xor1 = xor i16 %0, %v, !dbg !2971
  %and = and i16 %xor1, %sub, !dbg !2972
  %xor6 = xor i16 %and, %0, !dbg !2973
  store i16 %xor6, ptr %r, align 2, !dbg !2973
  ret void, !dbg !2974
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2975 {
entry:
    #dbg_value(ptr %state, !2978, !DIExpression(), !2979)
    #dbg_value(ptr %state, !2980, !DIExpression(), !2984)
    #dbg_value(i32 0, !2986, !DIExpression(), !2984)
  br label %for.cond.i, !dbg !2987

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2989
    #dbg_value(i32 %i.0.i, !2986, !DIExpression(), !2984)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !2990
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !2992

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !2993
  store i64 0, ptr %arrayidx.i, align 8, !dbg !2994
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2995
    #dbg_value(i32 %inc.i, !2986, !DIExpression(), !2984)
  br label %for.cond.i, !dbg !2996, !llvm.loop !2997

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2999
  store i32 0, ptr %pos, align 8, !dbg !3000
  ret void, !dbg !3001
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3002 {
entry:
    #dbg_value(ptr %state, !3003, !DIExpression(), !3004)
    #dbg_value(ptr %in, !3005, !DIExpression(), !3004)
    #dbg_value(i32 %inlen, !3006, !DIExpression(), !3004)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3007
  %0 = load i32, ptr %pos, align 8, !dbg !3007
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3008
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3009
  store i32 %call, ptr %pos1, align 8, !dbg !3010
  ret void, !dbg !3011
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3012 {
entry:
    #dbg_value(ptr %s, !3015, !DIExpression(), !3016)
    #dbg_value(i32 %pos, !3017, !DIExpression(), !3016)
    #dbg_value(i32 %r, !3018, !DIExpression(), !3016)
    #dbg_value(ptr %in, !3019, !DIExpression(), !3016)
    #dbg_value(i32 %inlen, !3020, !DIExpression(), !3016)
  br label %while.cond, !dbg !3021

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3017, !DIExpression(), !3016)
    #dbg_value(i32 %inlen.addr.0, !3020, !DIExpression(), !3016)
    #dbg_value(ptr %in.addr.0, !3019, !DIExpression(), !3016)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3022
  %cmp.not = icmp ult i32 %add, %r, !dbg !3023
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3021

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3024
  br label %for.cond, !dbg !3024

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3027

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3029
    #dbg_value(i32 %i.0, !3030, !DIExpression(), !3016)
    #dbg_value(ptr %in.addr.1, !3019, !DIExpression(), !3016)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3031
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3024

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3019, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3016)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3033
  %conv = zext i8 %0 to i64, !dbg !3034
  %rem = shl i32 %i.0, 3, !dbg !3035
  %mul = and i32 %rem, 56, !dbg !3035
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3036
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3036
  %div2 = lshr i32 %i.0, 3, !dbg !3037
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3038
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3039
  %xor = xor i64 %1, %shl, !dbg !3039
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3039
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3040
    #dbg_value(ptr %incdec.ptr, !3019, !DIExpression(), !3016)
  %inc = add i32 %i.0, 1, !dbg !3041
    #dbg_value(i32 %inc, !3030, !DIExpression(), !3016)
  br label %for.cond, !dbg !3042, !llvm.loop !3043

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3045
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3046
    #dbg_value(i32 %sub2, !3020, !DIExpression(), !3016)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3047
    #dbg_value(i32 0, !3017, !DIExpression(), !3016)
  br label %while.cond, !dbg !3021, !llvm.loop !3048

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3050
    #dbg_value(i32 %i.1, !3030, !DIExpression(), !3016)
    #dbg_value(ptr %in.addr.2, !3019, !DIExpression(), !3016)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3051
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3053
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3027

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3019, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3016)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3054
  %conv9 = zext i8 %2 to i64, !dbg !3055
  %rem10 = shl i32 %i.1, 3, !dbg !3056
  %mul11 = and i32 %rem10, 56, !dbg !3056
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3057
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3057
  %div141 = lshr i32 %i.1, 3, !dbg !3058
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3059
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3060
  %xor16 = xor i64 %3, %shl13, !dbg !3060
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3060
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3061
    #dbg_value(ptr %incdec.ptr8, !3019, !DIExpression(), !3016)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3062
    #dbg_value(i32 %inc18, !3030, !DIExpression(), !3016)
  br label %for.cond3, !dbg !3063, !llvm.loop !3064

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3050
  ret i32 %i.1.lcssa, !dbg !3066
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3067 {
entry:
    #dbg_value(ptr %state, !3068, !DIExpression(), !3069)
  %0 = load i64, ptr %state, align 8, !dbg !3070
    #dbg_value(i64 %0, !3071, !DIExpression(), !3069)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3072
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3072
    #dbg_value(i64 %1, !3073, !DIExpression(), !3069)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3074
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3074
    #dbg_value(i64 %2, !3075, !DIExpression(), !3069)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3076
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3076
    #dbg_value(i64 %3, !3077, !DIExpression(), !3069)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3078
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3078
    #dbg_value(i64 %4, !3079, !DIExpression(), !3069)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3080
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3080
    #dbg_value(i64 %5, !3081, !DIExpression(), !3069)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3082
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3082
    #dbg_value(i64 %6, !3083, !DIExpression(), !3069)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3084
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3084
    #dbg_value(i64 %7, !3085, !DIExpression(), !3069)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3086
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3086
    #dbg_value(i64 %8, !3087, !DIExpression(), !3069)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3088
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3088
    #dbg_value(i64 %9, !3089, !DIExpression(), !3069)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3090
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3090
    #dbg_value(i64 %10, !3091, !DIExpression(), !3069)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3092
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3092
    #dbg_value(i64 %11, !3093, !DIExpression(), !3069)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3094
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3094
    #dbg_value(i64 %12, !3095, !DIExpression(), !3069)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3096
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3096
    #dbg_value(i64 %13, !3097, !DIExpression(), !3069)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3098
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3098
    #dbg_value(i64 %14, !3099, !DIExpression(), !3069)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3100
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3100
    #dbg_value(i64 %15, !3101, !DIExpression(), !3069)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3102
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3102
    #dbg_value(i64 %16, !3103, !DIExpression(), !3069)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3104
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3104
    #dbg_value(i64 %17, !3105, !DIExpression(), !3069)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3106
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3106
    #dbg_value(i64 %18, !3107, !DIExpression(), !3069)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3108
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3108
    #dbg_value(i64 %19, !3109, !DIExpression(), !3069)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3110
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3110
    #dbg_value(i64 %20, !3111, !DIExpression(), !3069)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3112
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3112
    #dbg_value(i64 %21, !3113, !DIExpression(), !3069)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3114
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3114
    #dbg_value(i64 %22, !3115, !DIExpression(), !3069)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3116
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3116
    #dbg_value(i64 %23, !3117, !DIExpression(), !3069)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3118
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3118
    #dbg_value(i64 %24, !3119, !DIExpression(), !3069)
    #dbg_value(i32 0, !3120, !DIExpression(), !3069)
  br label %for.cond, !dbg !3121

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3069
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3069
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3069
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3069
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3069
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3069
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3069
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3069
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3069
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3069
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3069
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3069
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3069
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3069
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3069
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3069
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3069
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3069
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3069
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3069
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3069
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3069
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3069
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3069
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3123
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3069
    #dbg_value(i64 %Asu.0, !3119, !DIExpression(), !3069)
    #dbg_value(i32 %round.0, !3120, !DIExpression(), !3069)
    #dbg_value(i64 %Aba.0, !3071, !DIExpression(), !3069)
    #dbg_value(i64 %Abe.0, !3073, !DIExpression(), !3069)
    #dbg_value(i64 %Abi.0, !3075, !DIExpression(), !3069)
    #dbg_value(i64 %Abo.0, !3077, !DIExpression(), !3069)
    #dbg_value(i64 %Abu.0, !3079, !DIExpression(), !3069)
    #dbg_value(i64 %Aga.0, !3081, !DIExpression(), !3069)
    #dbg_value(i64 %Age.0, !3083, !DIExpression(), !3069)
    #dbg_value(i64 %Agi.0, !3085, !DIExpression(), !3069)
    #dbg_value(i64 %Ago.0, !3087, !DIExpression(), !3069)
    #dbg_value(i64 %Agu.0, !3089, !DIExpression(), !3069)
    #dbg_value(i64 %Aka.0, !3091, !DIExpression(), !3069)
    #dbg_value(i64 %Ake.0, !3093, !DIExpression(), !3069)
    #dbg_value(i64 %Aki.0, !3095, !DIExpression(), !3069)
    #dbg_value(i64 %Ako.0, !3097, !DIExpression(), !3069)
    #dbg_value(i64 %Aku.0, !3099, !DIExpression(), !3069)
    #dbg_value(i64 %Ama.0, !3101, !DIExpression(), !3069)
    #dbg_value(i64 %Ame.0, !3103, !DIExpression(), !3069)
    #dbg_value(i64 %Ami.0, !3105, !DIExpression(), !3069)
    #dbg_value(i64 %Amo.0, !3107, !DIExpression(), !3069)
    #dbg_value(i64 %Amu.0, !3109, !DIExpression(), !3069)
    #dbg_value(i64 %Asa.0, !3111, !DIExpression(), !3069)
    #dbg_value(i64 %Ase.0, !3113, !DIExpression(), !3069)
    #dbg_value(i64 %Asi.0, !3115, !DIExpression(), !3069)
    #dbg_value(i64 %Aso.0, !3117, !DIExpression(), !3069)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3124
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3126

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 poison, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3162
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3164
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3165
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3166
    #dbg_value(i64 %xor35, !3129, !DIExpression(), !3069)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3167
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3168
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3169
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3170
    #dbg_value(i64 %xor43, !3131, !DIExpression(), !3069)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3171
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3172
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 %xor57, !3135, !DIExpression(), !3069)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3173
    #dbg_value(i64 %xor203, !3087, !DIExpression(), !3069)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3174
    #dbg_value(i64 %xor206, !3128, !DIExpression(), !3069)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3175
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3176
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3177
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3178
    #dbg_value(i64 %xor31, !3128, !DIExpression(), !3069)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3179
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3180
    #dbg_value(i64 %xor45, !3132, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3181
    #dbg_value(i64 %xor211, !3101, !DIExpression(), !3069)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3182
    #dbg_value(i64 %xor214, !3130, !DIExpression(), !3069)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3183
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3184
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3185
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3186
    #dbg_value(i64 %xor39, !3130, !DIExpression(), !3069)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3187
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3188
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3189
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3190
    #dbg_value(i64 %xor27, !3127, !DIExpression(), !3069)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3191
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3192
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 %xor61, !3136, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3193
    #dbg_value(i64 %xor207, !3099, !DIExpression(), !3069)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3194
    #dbg_value(i64 %xor210, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not222 = xor i64 %xor210, -1, !dbg !3195
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and223 = and i64 %xor214, %not222, !dbg !3196
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor224 = xor i64 %xor206, %and223, !dbg !3197
    #dbg_value(i64 %xor224, !3158, !DIExpression(), !3069)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3198
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3199
    #dbg_value(i64 %xor53, !3134, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3200
    #dbg_value(i64 %xor67, !3095, !DIExpression(), !3069)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3201
    #dbg_value(i64 %xor70, !3129, !DIExpression(), !3069)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3202
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3203
    #dbg_value(i64 %xor49, !3133, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3204
    #dbg_value(i64 %xor63, !3083, !DIExpression(), !3069)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3205
    #dbg_value(i64 %xor66, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not = xor i64 %xor66, -1, !dbg !3206
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and = and i64 %xor70, %not, !dbg !3207
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3208
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3208
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %26 = xor i64 %and, %25, !dbg !3209
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3210
    #dbg_value(i64 %xor62, !3071, !DIExpression(), !3069)
    #dbg_value(i64 %xor62, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor81 = xor i64 %26, %xor62, !dbg !3209
    #dbg_value(i64 %xor81, !3137, !DIExpression(), !3069)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3211
    #dbg_value(i64 %xor94, !3077, !DIExpression(), !3069)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3212
    #dbg_value(i64 %xor97, !3127, !DIExpression(), !3069)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3213
    #dbg_value(i64 %xor102, !3091, !DIExpression(), !3069)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3214
    #dbg_value(i64 %xor105, !3129, !DIExpression(), !3069)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3215
    #dbg_value(i64 %xor98, !3089, !DIExpression(), !3069)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3216
    #dbg_value(i64 %xor101, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not114 = xor i64 %xor101, -1, !dbg !3217
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and115 = and i64 %xor105, %not114, !dbg !3218
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor116 = xor i64 %xor97, %and115, !dbg !3219
    #dbg_value(i64 %xor116, !3142, !DIExpression(), !3069)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3220
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3221
    #dbg_value(i64 %xor129, !3073, !DIExpression(), !3069)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3222
    #dbg_value(i64 %xor132, !3127, !DIExpression(), !3069)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3223
    #dbg_value(i64 %xor137, !3097, !DIExpression(), !3069)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3224
    #dbg_value(i64 %xor140, !3129, !DIExpression(), !3069)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3225
    #dbg_value(i64 %xor133, !3085, !DIExpression(), !3069)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3226
    #dbg_value(i64 %xor136, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not149 = xor i64 %xor136, -1, !dbg !3227
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and150 = and i64 %xor140, %not149, !dbg !3228
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor151 = xor i64 %xor132, %and150, !dbg !3229
    #dbg_value(i64 %xor151, !3147, !DIExpression(), !3069)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3230
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3231
    #dbg_value(i64 %xor164, !3079, !DIExpression(), !3069)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3232
    #dbg_value(i64 %xor167, !3127, !DIExpression(), !3069)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3233
    #dbg_value(i64 %xor172, !3093, !DIExpression(), !3069)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3234
    #dbg_value(i64 %xor175, !3129, !DIExpression(), !3069)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3235
    #dbg_value(i64 %xor168, !3081, !DIExpression(), !3069)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3236
    #dbg_value(i64 %xor171, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not184 = xor i64 %xor171, -1, !dbg !3237
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and185 = and i64 %xor175, %not184, !dbg !3238
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor186 = xor i64 %xor167, %and185, !dbg !3239
    #dbg_value(i64 %xor186, !3152, !DIExpression(), !3069)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3240
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3241
    #dbg_value(i64 %xor199, !3075, !DIExpression(), !3069)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3242
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not219 = xor i64 %xor206, -1, !dbg !3243
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and220 = and i64 %xor210, %not219, !dbg !3244
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor221 = xor i64 %xor202, %and220, !dbg !3245
    #dbg_value(i64 %xor221, !3157, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3246
    #dbg_value(i64 %xor237, !3127, !DIExpression(), !3069)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3247
    #dbg_value(i64 %xor75, !3119, !DIExpression(), !3069)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3248
    #dbg_value(i64 %xor78, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3249
    #dbg_value(i64 %xor71, !3107, !DIExpression(), !3069)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3250
    #dbg_value(i64 %xor74, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not85 = xor i64 %xor74, -1, !dbg !3251
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and86 = and i64 %xor78, %not85, !dbg !3252
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor87 = xor i64 %xor70, %and86, !dbg !3253
    #dbg_value(i64 %xor87, !3139, !DIExpression(), !3069)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3254
    #dbg_value(i64 %xor110, !3115, !DIExpression(), !3069)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3255
    #dbg_value(i64 %xor113, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3256
    #dbg_value(i64 %xor106, !3103, !DIExpression(), !3069)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3257
    #dbg_value(i64 %xor109, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not120 = xor i64 %xor109, -1, !dbg !3258
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and121 = and i64 %xor113, %not120, !dbg !3259
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor122 = xor i64 %xor105, %and121, !dbg !3260
    #dbg_value(i64 %xor122, !3144, !DIExpression(), !3069)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3261
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3262
    #dbg_value(i64 %xor145, !3111, !DIExpression(), !3069)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3263
    #dbg_value(i64 %xor148, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3264
    #dbg_value(i64 %xor141, !3109, !DIExpression(), !3069)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3265
    #dbg_value(i64 %xor144, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not155 = xor i64 %xor144, -1, !dbg !3266
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and156 = and i64 %xor148, %not155, !dbg !3267
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor157 = xor i64 %xor140, %and156, !dbg !3268
    #dbg_value(i64 %xor157, !3149, !DIExpression(), !3069)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3269
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3270
    #dbg_value(i64 %xor180, !3117, !DIExpression(), !3069)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3271
    #dbg_value(i64 %xor183, !3131, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3272
    #dbg_value(i64 %xor176, !3105, !DIExpression(), !3069)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3273
    #dbg_value(i64 %xor179, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %not190 = xor i64 %xor179, -1, !dbg !3274
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and191 = and i64 %xor183, %not190, !dbg !3275
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor192 = xor i64 %xor175, %and191, !dbg !3276
    #dbg_value(i64 %xor192, !3154, !DIExpression(), !3069)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3277
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3278
    #dbg_value(i64 %xor215, !3113, !DIExpression(), !3069)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3279
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not225 = xor i64 %xor214, -1, !dbg !3280
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and226 = and i64 %xor218, %not225, !dbg !3281
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor227 = xor i64 %xor210, %and226, !dbg !3282
    #dbg_value(i64 %xor227, !3159, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3283
    #dbg_value(i64 %xor245, !3129, !DIExpression(), !3069)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3284
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3285
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 %xor261, !3133, !DIExpression(), !3069)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3286
    #dbg_value(i64 %xor429, !3158, !DIExpression(), !3069)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3287
    #dbg_value(i64 %xor432, !3131, !DIExpression(), !3069)
  %not123 = xor i64 %xor113, -1, !dbg !3288
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and124 = and i64 %xor97, %not123, !dbg !3289
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor125 = xor i64 %xor109, %and124, !dbg !3290
    #dbg_value(i64 %xor125, !3145, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not91 = xor i64 %xor62, -1, !dbg !3291
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and92 = and i64 %xor66, %not91, !dbg !3292
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor93 = xor i64 %xor78, %and92, !dbg !3293
    #dbg_value(i64 %xor93, !3141, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not126 = xor i64 %xor97, -1, !dbg !3294
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and127 = and i64 %xor101, %not126, !dbg !3295
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor128 = xor i64 %xor113, %and127, !dbg !3296
    #dbg_value(i64 %xor128, !3146, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3297
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not161 = xor i64 %xor132, -1, !dbg !3298
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and162 = and i64 %xor136, %not161, !dbg !3299
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor163 = xor i64 %xor148, %and162, !dbg !3300
    #dbg_value(i64 %xor163, !3151, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3301
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not196 = xor i64 %xor167, -1, !dbg !3302
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and197 = and i64 %xor171, %not196, !dbg !3303
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor198 = xor i64 %xor183, %and197, !dbg !3304
    #dbg_value(i64 %xor198, !3156, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3305
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not231 = xor i64 %xor202, -1, !dbg !3306
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %and232 = and i64 %xor206, %not231, !dbg !3307
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor233 = xor i64 %xor218, %and232, !dbg !3308
    #dbg_value(i64 %xor233, !3161, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3309
    #dbg_value(i64 %xor253, !3131, !DIExpression(), !3069)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3310
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3311
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3145, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 %xor269, !3135, !DIExpression(), !3069)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3312
    #dbg_value(i64 %xor417, !3145, !DIExpression(), !3069)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3313
    #dbg_value(i64 %xor420, !3128, !DIExpression(), !3069)
  %not82 = xor i64 %xor70, -1, !dbg !3314
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and83 = and i64 %xor74, %not82, !dbg !3315
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor84 = xor i64 %xor66, %and83, !dbg !3316
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %not117 = xor i64 %xor105, -1, !dbg !3317
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and118 = and i64 %xor109, %not117, !dbg !3318
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor119 = xor i64 %xor101, %and118, !dbg !3319
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3143, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3320
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %not152 = xor i64 %xor140, -1, !dbg !3321
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and153 = and i64 %xor144, %not152, !dbg !3322
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor154 = xor i64 %xor136, %and153, !dbg !3323
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3148, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3324
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %not187 = xor i64 %xor175, -1, !dbg !3325
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and188 = and i64 %xor179, %not187, !dbg !3326
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor189 = xor i64 %xor171, %and188, !dbg !3327
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3328
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3329
    #dbg_value(i64 %xor241, !3128, !DIExpression(), !3069)
  %not88 = xor i64 %xor78, -1, !dbg !3330
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and89 = and i64 %xor62, %not88, !dbg !3331
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor90 = xor i64 %xor74, %and89, !dbg !3332
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3333
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not158 = xor i64 %xor148, -1, !dbg !3334
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and159 = and i64 %xor132, %not158, !dbg !3335
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor160 = xor i64 %xor144, %and159, !dbg !3336
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3337
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not193 = xor i64 %xor183, -1, !dbg !3338
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and194 = and i64 %xor167, %not193, !dbg !3339
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor195 = xor i64 %xor179, %and194, !dbg !3340
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3341
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %not228 = xor i64 %xor218, -1, !dbg !3342
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and229 = and i64 %xor202, %not228, !dbg !3343
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor230 = xor i64 %xor214, %and229, !dbg !3344
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3345
    #dbg_value(i64 %xor249, !3130, !DIExpression(), !3069)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3346
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3347
    #dbg_value(i64 %xor265, !3134, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3144, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3149, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3348
    #dbg_value(i64 %xor413, !3139, !DIExpression(), !3069)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3349
    #dbg_value(i64 %xor416, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not445 = xor i64 %xor416, -1, !dbg !3350
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and446 = and i64 %xor420, %not445, !dbg !3351
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor447 = xor i64 %xor432, %and446, !dbg !3352
    #dbg_value(i64 %xor447, !3119, !DIExpression(), !3069)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3353
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3354
    #dbg_value(i64 %xor257, !3132, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3147, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3355
    #dbg_value(i64 %xor425, !3152, !DIExpression(), !3069)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3356
    #dbg_value(i64 %xor428, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not442 = xor i64 %xor432, -1, !dbg !3357
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and443 = and i64 %xor416, %not442, !dbg !3358
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor444 = xor i64 %xor428, %and443, !dbg !3359
    #dbg_value(i64 %xor444, !3117, !DIExpression(), !3069)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3360
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3361
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3146, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(i64 %xor273, !3136, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3362
    #dbg_value(i64 %xor421, !3151, !DIExpression(), !3069)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3363
    #dbg_value(i64 %xor424, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not439 = xor i64 %xor428, -1, !dbg !3364
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and440 = and i64 %xor432, %not439, !dbg !3365
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor441 = xor i64 %xor424, %and440, !dbg !3366
    #dbg_value(i64 %xor441, !3115, !DIExpression(), !3069)
  %not436 = xor i64 %xor424, -1, !dbg !3367
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and437 = and i64 %xor428, %not436, !dbg !3368
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor438 = xor i64 %xor420, %and437, !dbg !3369
    #dbg_value(i64 %xor438, !3113, !DIExpression(), !3069)
  %not433 = xor i64 %xor420, -1, !dbg !3370
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and434 = and i64 %xor424, %not433, !dbg !3371
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor435 = xor i64 %xor416, %and434, !dbg !3372
    #dbg_value(i64 %xor435, !3111, !DIExpression(), !3069)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3373
    #dbg_value(i64 %xor394, !3160, !DIExpression(), !3069)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3374
    #dbg_value(i64 %xor397, !3131, !DIExpression(), !3069)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3375
    #dbg_value(i64 %xor382, !3142, !DIExpression(), !3069)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3376
    #dbg_value(i64 %xor385, !3128, !DIExpression(), !3069)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3377
    #dbg_value(i64 %xor378, !3141, !DIExpression(), !3069)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3378
    #dbg_value(i64 %xor381, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not410 = xor i64 %xor381, -1, !dbg !3379
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and411 = and i64 %xor385, %not410, !dbg !3380
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor412 = xor i64 %xor397, %and411, !dbg !3381
    #dbg_value(i64 %xor412, !3109, !DIExpression(), !3069)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3382
    #dbg_value(i64 %xor390, !3154, !DIExpression(), !3069)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3383
    #dbg_value(i64 %xor393, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not407 = xor i64 %xor397, -1, !dbg !3384
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and408 = and i64 %xor381, %not407, !dbg !3385
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor409 = xor i64 %xor393, %and408, !dbg !3386
    #dbg_value(i64 %xor409, !3107, !DIExpression(), !3069)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3387
    #dbg_value(i64 %xor386, !3148, !DIExpression(), !3069)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3388
    #dbg_value(i64 %xor389, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not404 = xor i64 %xor393, -1, !dbg !3389
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and405 = and i64 %xor397, %not404, !dbg !3390
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor406 = xor i64 %xor389, %and405, !dbg !3391
    #dbg_value(i64 %xor406, !3105, !DIExpression(), !3069)
  %not401 = xor i64 %xor389, -1, !dbg !3392
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and402 = and i64 %xor393, %not401, !dbg !3393
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor403 = xor i64 %xor385, %and402, !dbg !3394
    #dbg_value(i64 %xor403, !3103, !DIExpression(), !3069)
  %not398 = xor i64 %xor385, -1, !dbg !3395
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and399 = and i64 %xor389, %not398, !dbg !3396
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor400 = xor i64 %xor381, %and399, !dbg !3397
    #dbg_value(i64 %xor400, !3101, !DIExpression(), !3069)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3398
    #dbg_value(i64 %xor359, !3157, !DIExpression(), !3069)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3399
    #dbg_value(i64 %xor362, !3131, !DIExpression(), !3069)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3400
    #dbg_value(i64 %xor347, !3144, !DIExpression(), !3069)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3401
    #dbg_value(i64 %xor350, !3128, !DIExpression(), !3069)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3402
    #dbg_value(i64 %xor343, !3138, !DIExpression(), !3069)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3403
    #dbg_value(i64 %xor346, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not375 = xor i64 %xor346, -1, !dbg !3404
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and376 = and i64 %xor350, %not375, !dbg !3405
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor377 = xor i64 %xor362, %and376, !dbg !3406
    #dbg_value(i64 %xor377, !3099, !DIExpression(), !3069)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3407
    #dbg_value(i64 %xor355, !3156, !DIExpression(), !3069)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3408
    #dbg_value(i64 %xor358, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not372 = xor i64 %xor362, -1, !dbg !3409
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and373 = and i64 %xor346, %not372, !dbg !3410
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor374 = xor i64 %xor358, %and373, !dbg !3411
    #dbg_value(i64 %xor374, !3097, !DIExpression(), !3069)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3412
    #dbg_value(i64 %xor351, !3150, !DIExpression(), !3069)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3413
    #dbg_value(i64 %xor354, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not369 = xor i64 %xor358, -1, !dbg !3414
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and370 = and i64 %xor362, %not369, !dbg !3415
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor371 = xor i64 %xor354, %and370, !dbg !3416
    #dbg_value(i64 %xor371, !3095, !DIExpression(), !3069)
  %not366 = xor i64 %xor354, -1, !dbg !3417
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and367 = and i64 %xor358, %not366, !dbg !3418
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor368 = xor i64 %xor350, %and367, !dbg !3419
    #dbg_value(i64 %xor368, !3093, !DIExpression(), !3069)
  %not363 = xor i64 %xor350, -1, !dbg !3420
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and364 = and i64 %xor354, %not363, !dbg !3421
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor365 = xor i64 %xor346, %and364, !dbg !3422
    #dbg_value(i64 %xor365, !3091, !DIExpression(), !3069)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3423
    #dbg_value(i64 %xor324, !3159, !DIExpression(), !3069)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3424
    #dbg_value(i64 %xor327, !3131, !DIExpression(), !3069)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3425
    #dbg_value(i64 %xor312, !3146, !DIExpression(), !3069)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3426
    #dbg_value(i64 %xor315, !3128, !DIExpression(), !3069)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3427
    #dbg_value(i64 %xor308, !3140, !DIExpression(), !3069)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3428
    #dbg_value(i64 %xor311, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not340 = xor i64 %xor311, -1, !dbg !3429
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and341 = and i64 %xor315, %not340, !dbg !3430
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor342 = xor i64 %xor327, %and341, !dbg !3431
    #dbg_value(i64 %xor342, !3089, !DIExpression(), !3069)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3432
    #dbg_value(i64 %xor320, !3153, !DIExpression(), !3069)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3433
    #dbg_value(i64 %xor323, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not337 = xor i64 %xor327, -1, !dbg !3434
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and338 = and i64 %xor311, %not337, !dbg !3435
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor339 = xor i64 %xor323, %and338, !dbg !3436
    #dbg_value(i64 %xor339, !3087, !DIExpression(), !3069)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3437
    #dbg_value(i64 %xor316, !3147, !DIExpression(), !3069)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3438
    #dbg_value(i64 %xor319, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not334 = xor i64 %xor323, -1, !dbg !3439
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and335 = and i64 %xor327, %not334, !dbg !3440
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor336 = xor i64 %xor319, %and335, !dbg !3441
    #dbg_value(i64 %xor336, !3085, !DIExpression(), !3069)
  %not331 = xor i64 %xor319, -1, !dbg !3442
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and332 = and i64 %xor323, %not331, !dbg !3443
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor333 = xor i64 %xor315, %and332, !dbg !3444
    #dbg_value(i64 %xor333, !3083, !DIExpression(), !3069)
  %not328 = xor i64 %xor315, -1, !dbg !3445
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and329 = and i64 %xor319, %not328, !dbg !3446
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor330 = xor i64 %xor311, %and329, !dbg !3447
    #dbg_value(i64 %xor330, !3081, !DIExpression(), !3069)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3448
    #dbg_value(i64 %xor287, !3161, !DIExpression(), !3069)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3449
    #dbg_value(i64 %xor290, !3131, !DIExpression(), !3069)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3450
    #dbg_value(i64 %xor275, !3143, !DIExpression(), !3069)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3451
    #dbg_value(i64 %xor278, !3128, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3452
    #dbg_value(i64 %xor274, !3137, !DIExpression(), !3069)
    #dbg_value(i64 %xor274, !3127, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not305 = xor i64 %xor274, -1, !dbg !3453
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and306 = and i64 %xor278, %not305, !dbg !3454
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor307 = xor i64 %xor290, %and306, !dbg !3455
    #dbg_value(i64 %xor307, !3079, !DIExpression(), !3069)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3456
    #dbg_value(i64 %xor283, !3155, !DIExpression(), !3069)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3457
    #dbg_value(i64 %xor286, !3130, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not302 = xor i64 %xor290, -1, !dbg !3458
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and303 = and i64 %xor274, %not302, !dbg !3459
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor304 = xor i64 %xor286, %and303, !dbg !3460
    #dbg_value(i64 %xor304, !3077, !DIExpression(), !3069)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3461
    #dbg_value(i64 %xor279, !3149, !DIExpression(), !3069)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3462
    #dbg_value(i64 %xor282, !3129, !DIExpression(), !3069)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %not299 = xor i64 %xor286, -1, !dbg !3463
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and300 = and i64 %xor290, %not299, !dbg !3464
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor301 = xor i64 %xor282, %and300, !dbg !3465
    #dbg_value(i64 %xor301, !3075, !DIExpression(), !3069)
  %not296 = xor i64 %xor282, -1, !dbg !3466
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3069)
  %and297 = and i64 %xor286, %not296, !dbg !3467
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %xor298 = xor i64 %xor278, %and297, !dbg !3468
    #dbg_value(i64 %xor298, !3073, !DIExpression(), !3069)
  %add = or disjoint i32 %round.0, 1, !dbg !3469
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3470
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3470
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %not291 = xor i64 %xor278, -1, !dbg !3471
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %and292 = and i64 %xor282, %not291, !dbg !3472
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3069)
  %28 = xor i64 %and292, %27, !dbg !3473
  %xor295 = xor i64 %28, %xor274, !dbg !3473
    #dbg_value(i64 %xor295, !3071, !DIExpression(), !3069)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3474
    #dbg_value(i32 %add448, !3120, !DIExpression(), !3069)
  br label %for.cond, !dbg !3475, !llvm.loop !3476

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3069
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3069
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3069
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3069
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3069
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3069
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3069
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3069
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3069
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3069
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3069
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3069
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3069
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3069
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3069
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3069
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3069
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3069
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3069
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3069
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3069
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3069
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3069
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3069
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3069
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3478
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3479
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3480
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3481
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3482
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3483
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3484
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3485
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3486
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3487
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3488
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3489
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3490
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3491
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3492
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3493
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3494
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3495
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3496
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3497
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3498
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3499
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3500
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3501
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3502
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3503
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3504
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3505
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3506
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3507
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3508
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3509
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3510
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3511
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3512
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3513
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3514
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3515
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3516
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3517
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3518
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3519
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3520
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3521
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3522
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3523
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3524
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3525
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3526
  ret void, !dbg !3527
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3528 {
entry:
    #dbg_value(ptr %state, !3529, !DIExpression(), !3530)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3531
  %0 = load i32, ptr %pos, align 8, !dbg !3531
    #dbg_value(ptr %state, !3532, !DIExpression(), !3536)
    #dbg_value(i32 %0, !3538, !DIExpression(), !3536)
    #dbg_value(i32 168, !3539, !DIExpression(), !3536)
    #dbg_value(i8 31, !3540, !DIExpression(), !3536)
  %rem.i = shl i32 %0, 3, !dbg !3541
  %mul.i = and i32 %rem.i, 56, !dbg !3541
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3542
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3542
  %div2.i = lshr i32 %0, 3, !dbg !3543
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3544
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3545
  %xor.i = xor i64 %1, %shl.i, !dbg !3545
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3545
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !3546
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3547
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3547
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3547
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3548
  store i32 168, ptr %pos1, align 8, !dbg !3549
  ret void, !dbg !3550
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !3551 {
entry:
    #dbg_value(ptr %out, !3552, !DIExpression(), !3553)
    #dbg_value(i32 %outlen, !3554, !DIExpression(), !3553)
    #dbg_value(ptr %state, !3555, !DIExpression(), !3553)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3556
  %0 = load i32, ptr %pos, align 8, !dbg !3556
    #dbg_value(ptr %out, !612, !DIExpression(), !3557)
    #dbg_value(i32 %outlen, !618, !DIExpression(), !3557)
    #dbg_value(ptr %state, !619, !DIExpression(), !3557)
    #dbg_value(i32 %0, !620, !DIExpression(), !3557)
    #dbg_value(i32 168, !621, !DIExpression(), !3557)
  br label %while.cond.i, !dbg !3559

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !3557)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3557)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3557)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3559
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3559

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !3560
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3560

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3561
    #dbg_value(i32 0, !620, !DIExpression(), !3557)
  br label %if.end.i, !dbg !3562

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3557)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3557)
  br label %for.cond.i, !dbg !3563

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3564
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3557)
    #dbg_value(i32 %i.0.i, !629, !DIExpression(), !3557)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !3565
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3566
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3566
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3566
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3567

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3568
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3569
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3569
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3570
  %mul.i = and i32 %rem.i, 56, !dbg !3570
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3571
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3571
  %conv.i = trunc i64 %shr.i to i8, !dbg !3569
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3557)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3572
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3573
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3557)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3574
    #dbg_value(i32 %inc.i, !629, !DIExpression(), !3557)
  br label %for.cond.i, !dbg !3575, !llvm.loop !3576

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3564
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3578
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3579
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3557)
    #dbg_value(i32 %i.0.i.lcssa, !620, !DIExpression(), !3557)
  br label %while.cond.i, !dbg !3559, !llvm.loop !3580

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3582
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3583
  ret void, !dbg !3584
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !308 {
entry:
    #dbg_value(ptr %state, !307, !DIExpression(), !3585)
    #dbg_value(ptr %in, !319, !DIExpression(), !3585)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !3585)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3586
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3587
  store i32 168, ptr %pos, align 8, !dbg !3588
  ret void, !dbg !3589
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !3590 {
entry:
    #dbg_value(ptr %s, !3593, !DIExpression(), !3594)
    #dbg_value(i32 %r, !3595, !DIExpression(), !3594)
    #dbg_value(ptr %in, !3596, !DIExpression(), !3594)
    #dbg_value(i32 %inlen, !3597, !DIExpression(), !3594)
    #dbg_value(i8 %p, !3598, !DIExpression(), !3594)
    #dbg_value(i32 0, !3599, !DIExpression(), !3594)
  br label %for.cond, !dbg !3600

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3602
    #dbg_value(i32 %i.0, !3599, !DIExpression(), !3594)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3603
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !3605

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !3606
  br label %while.cond, !dbg !3606

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3607
  store i64 0, ptr %arrayidx, align 8, !dbg !3608
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3609
    #dbg_value(i32 %inc, !3599, !DIExpression(), !3594)
  br label %for.cond, !dbg !3610, !llvm.loop !3611

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !3597, !DIExpression(), !3594)
    #dbg_value(ptr %in.addr.0, !3596, !DIExpression(), !3594)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !3613
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !3606

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !3614

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !3617

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !3619
    #dbg_value(i32 %i.1, !3599, !DIExpression(), !3594)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !3620
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !3614

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !3622
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3623
    #dbg_value(ptr %add.ptr, !3624, !DIExpression(), !3628)
    #dbg_value(i64 0, !3630, !DIExpression(), !3628)
    #dbg_value(i32 0, !3631, !DIExpression(), !3628)
  br label %for.cond.i, !dbg !3632

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !3634
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !3628
    #dbg_value(i64 %r.0.i, !3630, !DIExpression(), !3628)
    #dbg_value(i32 %i.0.i, !3631, !DIExpression(), !3628)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !3635
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !3637

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3628)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !3638
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !3638
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3628)
  %conv.i = zext i8 %1 to i64, !dbg !3639
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3628)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3640
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3628)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3641
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3628)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !3641
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !3630, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !3628)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !3642
    #dbg_value(i64 %or.i, !3630, !DIExpression(), !3628)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3643
    #dbg_value(i32 %inc.i, !3631, !DIExpression(), !3628)
  br label %for.cond.i, !dbg !3644, !llvm.loop !3645

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !3628
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3647
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !3648
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !3648
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3648
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !3649
    #dbg_value(i32 %inc7, !3599, !DIExpression(), !3594)
  br label %for.cond2, !dbg !3650, !llvm.loop !3651

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3653
    #dbg_value(ptr %add.ptr9, !3596, !DIExpression(), !3594)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3654
    #dbg_value(i32 %sub, !3597, !DIExpression(), !3594)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3655
  br label %while.cond, !dbg !3606, !llvm.loop !3656

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !3658
    #dbg_value(i32 %i.2, !3599, !DIExpression(), !3594)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !3659
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !3617

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !3661
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !3661
  %conv = zext i8 %3 to i64, !dbg !3662
  %rem = shl i32 %i.2, 3, !dbg !3663
  %mul14 = and i32 %rem, 56, !dbg !3663
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !3664
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3664
  %div153 = lshr i32 %i.2, 3, !dbg !3665
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !3666
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !3667
  %xor17 = xor i64 %4, %shl, !dbg !3667
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !3667
  %inc19 = add i32 %i.2, 1, !dbg !3668
    #dbg_value(i32 %inc19, !3599, !DIExpression(), !3594)
  br label %for.cond10, !dbg !3669, !llvm.loop !3670

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !3658
  %conv21 = zext i8 %p to i64, !dbg !3672
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !3673
  %mul23 = and i32 %rem22, 56, !dbg !3673
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !3674
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !3674
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !3675
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !3676
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !3677
  %xor28 = xor i64 %5, %shl25, !dbg !3677
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !3677
  %sub29 = add i32 %r, -1, !dbg !3678
  %div302 = lshr i32 %sub29, 3, !dbg !3679
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !3680
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !3681
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !3681
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !3681
  ret void, !dbg !3682
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !341 {
entry:
    #dbg_value(ptr %out, !340, !DIExpression(), !3683)
    #dbg_value(i32 %nblocks, !346, !DIExpression(), !3683)
    #dbg_value(ptr %state, !347, !DIExpression(), !3683)
    #dbg_value(ptr %out, !348, !DIExpression(), !3684)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !3684)
    #dbg_value(ptr %state, !356, !DIExpression(), !3684)
    #dbg_value(i32 168, !357, !DIExpression(), !3684)
  br label %while.cond.i, !dbg !3686

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3684)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3684)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3686
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3686

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3687
    #dbg_value(i32 0, !361, !DIExpression(), !3684)
  br label %for.cond.i, !dbg !3688

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3689
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3684)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !3690
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3691

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3692
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3693
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3694
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3694
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3695)
    #dbg_value(i64 %0, !377, !DIExpression(), !3695)
    #dbg_value(i32 0, !378, !DIExpression(), !3695)
  br label %for.cond.i.i, !dbg !3697

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3698
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3695)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3699
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3700

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3701
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3702
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3702
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3703
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3704
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3705
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3706
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3695)
  br label %for.cond.i.i, !dbg !3707, !llvm.loop !3708

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3710
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3684)
  br label %for.cond.i, !dbg !3711, !llvm.loop !3712

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3714
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3684)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3715
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3684)
  br label %while.cond.i, !dbg !3686, !llvm.loop !3716

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3718
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3719 {
entry:
    #dbg_value(ptr %state, !3720, !DIExpression(), !3721)
    #dbg_value(ptr %state, !2980, !DIExpression(), !3722)
    #dbg_value(i32 0, !2986, !DIExpression(), !3722)
  br label %for.cond.i, !dbg !3724

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3725
    #dbg_value(i32 %i.0.i, !2986, !DIExpression(), !3722)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3726
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3727

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3728
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3729
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3730
    #dbg_value(i32 %inc.i, !2986, !DIExpression(), !3722)
  br label %for.cond.i, !dbg !3731, !llvm.loop !3732

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3734
  store i32 0, ptr %pos, align 8, !dbg !3735
  ret void, !dbg !3736
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3737 {
entry:
    #dbg_value(ptr %state, !3738, !DIExpression(), !3739)
    #dbg_value(ptr %in, !3740, !DIExpression(), !3739)
    #dbg_value(i32 %inlen, !3741, !DIExpression(), !3739)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3742
  %0 = load i32, ptr %pos, align 8, !dbg !3742
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3743
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3744
  store i32 %call, ptr %pos1, align 8, !dbg !3745
  ret void, !dbg !3746
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3747 {
entry:
    #dbg_value(ptr %state, !3748, !DIExpression(), !3749)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3750
  %0 = load i32, ptr %pos, align 8, !dbg !3750
    #dbg_value(ptr %state, !3532, !DIExpression(), !3751)
    #dbg_value(i32 %0, !3538, !DIExpression(), !3751)
    #dbg_value(i32 136, !3539, !DIExpression(), !3751)
    #dbg_value(i8 31, !3540, !DIExpression(), !3751)
  %rem.i = shl i32 %0, 3, !dbg !3753
  %mul.i = and i32 %rem.i, 56, !dbg !3753
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3754
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3754
  %div2.i = lshr i32 %0, 3, !dbg !3755
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3756
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3757
  %xor.i = xor i64 %1, %shl.i, !dbg !3757
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3757
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !3758
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3759
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3759
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3759
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3760
  store i32 136, ptr %pos1, align 8, !dbg !3761
  ret void, !dbg !3762
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !606 {
entry:
    #dbg_value(ptr %out, !605, !DIExpression(), !3763)
    #dbg_value(i32 %outlen, !609, !DIExpression(), !3763)
    #dbg_value(ptr %state, !610, !DIExpression(), !3763)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3764
  %0 = load i32, ptr %pos, align 8, !dbg !3764
    #dbg_value(ptr %out, !612, !DIExpression(), !3765)
    #dbg_value(i32 %outlen, !618, !DIExpression(), !3765)
    #dbg_value(ptr %state, !619, !DIExpression(), !3765)
    #dbg_value(i32 %0, !620, !DIExpression(), !3765)
    #dbg_value(i32 136, !621, !DIExpression(), !3765)
  br label %while.cond.i, !dbg !3767

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !3765)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3765)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3765)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3767
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3767

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !3768
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3768

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3769
    #dbg_value(i32 0, !620, !DIExpression(), !3765)
  br label %if.end.i, !dbg !3770

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3765)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3765)
  br label %for.cond.i, !dbg !3771

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3772
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3765)
    #dbg_value(i32 %i.0.i, !629, !DIExpression(), !3765)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !3773
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3774
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3774
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3774
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3775

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3776
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3777
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3777
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3778
  %mul.i = and i32 %rem.i, 56, !dbg !3778
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3779
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3779
  %conv.i = trunc i64 %shr.i to i8, !dbg !3777
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3765)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3780
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3781
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3765)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3782
    #dbg_value(i32 %inc.i, !629, !DIExpression(), !3765)
  br label %for.cond.i, !dbg !3783, !llvm.loop !3784

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3772
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3786
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3787
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3765)
    #dbg_value(i32 %i.0.i.lcssa, !620, !DIExpression(), !3765)
  br label %while.cond.i, !dbg !3767, !llvm.loop !3788

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3790
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3791
  ret void, !dbg !3792
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !577 {
entry:
    #dbg_value(ptr %state, !590, !DIExpression(), !3793)
    #dbg_value(ptr %in, !592, !DIExpression(), !3793)
    #dbg_value(i32 %inlen, !593, !DIExpression(), !3793)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3794
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3795
  store i32 136, ptr %pos, align 8, !dbg !3796
  ret void, !dbg !3797
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !598 {
entry:
    #dbg_value(ptr %out, !597, !DIExpression(), !3798)
    #dbg_value(i32 %nblocks, !601, !DIExpression(), !3798)
    #dbg_value(ptr %state, !602, !DIExpression(), !3798)
    #dbg_value(ptr %out, !348, !DIExpression(), !3799)
    #dbg_value(i32 %nblocks, !355, !DIExpression(), !3799)
    #dbg_value(ptr %state, !356, !DIExpression(), !3799)
    #dbg_value(i32 136, !357, !DIExpression(), !3799)
  br label %while.cond.i, !dbg !3801

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3799)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3799)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3801
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3801

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3802
    #dbg_value(i32 0, !361, !DIExpression(), !3799)
  br label %for.cond.i, !dbg !3803

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3804
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3799)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !3805
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3806

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3807
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3808
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3809
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3809
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3810)
    #dbg_value(i64 %0, !377, !DIExpression(), !3810)
    #dbg_value(i32 0, !378, !DIExpression(), !3810)
  br label %for.cond.i.i, !dbg !3812

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3813
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3810)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3814
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3815

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3816
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3817
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3817
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3818
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3819
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3820
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3821
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3810)
  br label %for.cond.i.i, !dbg !3822, !llvm.loop !3823

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3825
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3799)
  br label %for.cond.i, !dbg !3826, !llvm.loop !3827

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !3829
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3799)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3830
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3799)
  br label %while.cond.i, !dbg !3801, !llvm.loop !3831

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3833
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3834 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3835, !DIExpression(), !3836)
    #dbg_value(i32 %outlen, !3837, !DIExpression(), !3836)
    #dbg_value(ptr %in, !3838, !DIExpression(), !3836)
    #dbg_value(i32 %inlen, !3839, !DIExpression(), !3836)
    #dbg_declare(ptr %state, !3840, !DIExpression(), !3841)
    #dbg_value(ptr %state, !307, !DIExpression(), !3842)
    #dbg_value(ptr %in, !319, !DIExpression(), !3842)
    #dbg_value(i32 %inlen, !320, !DIExpression(), !3842)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3844
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3845
  store i32 168, ptr %pos.i, align 8, !dbg !3846
  %div = udiv i32 %outlen, 168, !dbg !3847
    #dbg_value(i32 %div, !3848, !DIExpression(), !3836)
    #dbg_value(ptr %out, !340, !DIExpression(), !3849)
    #dbg_value(i32 %div, !346, !DIExpression(), !3849)
    #dbg_value(ptr %state, !347, !DIExpression(), !3849)
    #dbg_value(ptr %out, !348, !DIExpression(), !3851)
    #dbg_value(i32 %div, !355, !DIExpression(), !3851)
    #dbg_value(ptr %state, !356, !DIExpression(), !3851)
    #dbg_value(i32 168, !357, !DIExpression(), !3851)
  br label %while.cond.i, !dbg !3853

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3851)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3851)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3853
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3853

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3854
    #dbg_value(i32 0, !361, !DIExpression(), !3851)
  br label %for.cond.i, !dbg !3855

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3856
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3851)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !3857
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !3858

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3859
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3860
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3861
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3861
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3862)
    #dbg_value(i64 %0, !377, !DIExpression(), !3862)
    #dbg_value(i32 0, !378, !DIExpression(), !3862)
  br label %for.cond.i.i, !dbg !3864

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3865
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3862)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3866
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3867

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3868
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3869
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3869
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3870
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3871
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3872
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3873
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3862)
  br label %for.cond.i.i, !dbg !3874, !llvm.loop !3875

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3877
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3851)
  br label %for.cond.i, !dbg !3878, !llvm.loop !3879

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3881
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3851)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !3882
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3851)
  br label %while.cond.i, !dbg !3853, !llvm.loop !3883

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !3885
  %sub = add i32 %mul.neg, %outlen, !dbg !3886
    #dbg_value(i32 %sub, !3837, !DIExpression(), !3836)
  %mul1 = mul nuw i32 %div, 168, !dbg !3887
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3888
    #dbg_value(ptr %add.ptr, !3835, !DIExpression(), !3836)
    #dbg_value(ptr %add.ptr, !3552, !DIExpression(), !3889)
    #dbg_value(i32 %sub, !3554, !DIExpression(), !3889)
    #dbg_value(ptr %state, !3555, !DIExpression(), !3889)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3891
  %1 = load i32, ptr %pos.i1, align 8, !dbg !3891
    #dbg_value(ptr %add.ptr, !612, !DIExpression(), !3892)
    #dbg_value(i32 %sub, !618, !DIExpression(), !3892)
    #dbg_value(ptr %state, !619, !DIExpression(), !3892)
    #dbg_value(i32 %1, !620, !DIExpression(), !3892)
    #dbg_value(i32 168, !621, !DIExpression(), !3892)
  br label %while.cond.i2, !dbg !3894

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !3892)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3892)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3892)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3894
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !3894

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !3895
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !3895

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3896
    #dbg_value(i32 0, !620, !DIExpression(), !3892)
  br label %if.end.i, !dbg !3897

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3892)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3892)
  br label %for.cond.i7, !dbg !3898

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !3899
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3892)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !3892)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !3900
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3901
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !3901
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3901
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !3902

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !3903
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3904
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !3904
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !3905
  %mul.i12 = and i32 %rem.i, 56, !dbg !3905
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !3906
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !3906
  %conv.i = trunc i64 %shr.i to i8, !dbg !3904
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3892)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3907
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3908
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3892)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !3909
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !3892)
  br label %for.cond.i7, !dbg !3910, !llvm.loop !3911

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !3899
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !3913
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3914
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3892)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !3892)
  br label %while.cond.i2, !dbg !3894, !llvm.loop !3915

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3917
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !3918
  ret void, !dbg !3919
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !579 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !583, !DIExpression(), !3920)
    #dbg_value(i32 %outlen, !585, !DIExpression(), !3920)
    #dbg_value(ptr %in, !586, !DIExpression(), !3920)
    #dbg_value(i32 %inlen, !587, !DIExpression(), !3920)
    #dbg_declare(ptr %state, !588, !DIExpression(), !3921)
    #dbg_value(ptr %state, !590, !DIExpression(), !3922)
    #dbg_value(ptr %in, !592, !DIExpression(), !3922)
    #dbg_value(i32 %inlen, !593, !DIExpression(), !3922)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3924
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3925
  store i32 136, ptr %pos.i, align 8, !dbg !3926
  %div = udiv i32 %outlen, 136, !dbg !3927
    #dbg_value(i32 %div, !596, !DIExpression(), !3920)
    #dbg_value(ptr %out, !597, !DIExpression(), !3928)
    #dbg_value(i32 %div, !601, !DIExpression(), !3928)
    #dbg_value(ptr %state, !602, !DIExpression(), !3928)
    #dbg_value(ptr %out, !348, !DIExpression(), !3930)
    #dbg_value(i32 %div, !355, !DIExpression(), !3930)
    #dbg_value(ptr %state, !356, !DIExpression(), !3930)
    #dbg_value(i32 136, !357, !DIExpression(), !3930)
  br label %while.cond.i, !dbg !3932

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !348, !DIExpression(), !3930)
    #dbg_value(i32 %nblocks.addr.0.i, !355, !DIExpression(), !3930)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3932
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3932

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3933
    #dbg_value(i32 0, !361, !DIExpression(), !3930)
  br label %for.cond.i, !dbg !3934

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3935
    #dbg_value(i32 %i.0.i, !361, !DIExpression(), !3930)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !3936
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !3937

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3938
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3939
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3940
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3940
    #dbg_value(ptr %add.ptr.i, !371, !DIExpression(), !3941)
    #dbg_value(i64 %0, !377, !DIExpression(), !3941)
    #dbg_value(i32 0, !378, !DIExpression(), !3941)
  br label %for.cond.i.i, !dbg !3943

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3944
    #dbg_value(i32 %i.0.i.i, !378, !DIExpression(), !3941)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3945
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3946

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3947
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3948
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3948
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3949
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3950
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3951
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3952
    #dbg_value(i32 %inc.i.i, !378, !DIExpression(), !3941)
  br label %for.cond.i.i, !dbg !3953, !llvm.loop !3954

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3956
    #dbg_value(i32 %inc.i, !361, !DIExpression(), !3930)
  br label %for.cond.i, !dbg !3957, !llvm.loop !3958

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !3960
    #dbg_value(ptr %add.ptr1.i, !348, !DIExpression(), !3930)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !3961
    #dbg_value(i32 %sub.i, !355, !DIExpression(), !3930)
  br label %while.cond.i, !dbg !3932, !llvm.loop !3962

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !3964
  %sub = add i32 %mul.neg, %outlen, !dbg !3965
    #dbg_value(i32 %sub, !585, !DIExpression(), !3920)
  %mul1 = mul nuw i32 %div, 136, !dbg !3966
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3967
    #dbg_value(ptr %add.ptr, !583, !DIExpression(), !3920)
    #dbg_value(ptr %add.ptr, !605, !DIExpression(), !3968)
    #dbg_value(i32 %sub, !609, !DIExpression(), !3968)
    #dbg_value(ptr %state, !610, !DIExpression(), !3968)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3970
  %1 = load i32, ptr %pos.i1, align 8, !dbg !3970
    #dbg_value(ptr %add.ptr, !612, !DIExpression(), !3971)
    #dbg_value(i32 %sub, !618, !DIExpression(), !3971)
    #dbg_value(ptr %state, !619, !DIExpression(), !3971)
    #dbg_value(i32 %1, !620, !DIExpression(), !3971)
    #dbg_value(i32 136, !621, !DIExpression(), !3971)
  br label %while.cond.i2, !dbg !3973

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !612, !DIExpression(), !3971)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !3971)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !3971)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3973
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !3973

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !3974
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !3974

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !3975
    #dbg_value(i32 0, !620, !DIExpression(), !3971)
  br label %if.end.i, !dbg !3976

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !3971)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !3971)
  br label %for.cond.i7, !dbg !3977

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !3978
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !3971)
    #dbg_value(i32 %i.0.i8, !629, !DIExpression(), !3971)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !3979
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3980
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !3980
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3980
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !3981

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !3982
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3983
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !3983
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !3984
  %mul.i12 = and i32 %rem.i, 56, !dbg !3984
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !3985
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !3985
  %conv.i = trunc i64 %shr.i to i8, !dbg !3983
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3971)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3986
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3987
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !3971)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !3988
    #dbg_value(i32 %inc.i13, !629, !DIExpression(), !3971)
  br label %for.cond.i7, !dbg !3989, !llvm.loop !3990

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !3978
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !3992
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3993
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !3971)
    #dbg_value(i32 %i.0.i8.lcssa, !620, !DIExpression(), !3971)
  br label %while.cond.i2, !dbg !3973, !llvm.loop !3994

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3996
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !3997
  ret void, !dbg !3998
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3999 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4002, !DIExpression(), !4003)
    #dbg_value(ptr %in, !4004, !DIExpression(), !4003)
    #dbg_value(i32 %inlen, !4005, !DIExpression(), !4003)
    #dbg_declare(ptr %s, !4006, !DIExpression(), !4007)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4008
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4009
    #dbg_value(i32 0, !4010, !DIExpression(), !4003)
  br label %for.cond, !dbg !4011

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4013
    #dbg_value(i32 %i.0, !4010, !DIExpression(), !4003)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4014
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4016

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4017
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4018
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4019
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4019
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4020)
    #dbg_value(i64 %0, !377, !DIExpression(), !4020)
    #dbg_value(i32 0, !378, !DIExpression(), !4020)
  br label %for.cond.i, !dbg !4022

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4023
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4020)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4024
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4025

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4026
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4027
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4027
  %conv.i = trunc i64 %shr.i to i8, !dbg !4028
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4029
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4030
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4031
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4020)
  br label %for.cond.i, !dbg !4032, !llvm.loop !4033

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4035
    #dbg_value(i32 %inc, !4010, !DIExpression(), !4003)
  br label %for.cond, !dbg !4036, !llvm.loop !4037

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4039
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4040 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4041, !DIExpression(), !4042)
    #dbg_value(ptr %in, !4043, !DIExpression(), !4042)
    #dbg_value(i32 %inlen, !4044, !DIExpression(), !4042)
    #dbg_declare(ptr %s, !4045, !DIExpression(), !4046)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4047
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4048
    #dbg_value(i32 0, !4049, !DIExpression(), !4042)
  br label %for.cond, !dbg !4050

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4052
    #dbg_value(i32 %i.0, !4049, !DIExpression(), !4042)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4053
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4055

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4056
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4057
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4058
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4058
    #dbg_value(ptr %add.ptr, !371, !DIExpression(), !4059)
    #dbg_value(i64 %0, !377, !DIExpression(), !4059)
    #dbg_value(i32 0, !378, !DIExpression(), !4059)
  br label %for.cond.i, !dbg !4061

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4062
    #dbg_value(i32 %i.0.i, !378, !DIExpression(), !4059)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4063
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4064

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4065
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4066
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4066
  %conv.i = trunc i64 %shr.i to i8, !dbg !4067
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4068
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4069
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4070
    #dbg_value(i32 %inc.i, !378, !DIExpression(), !4059)
  br label %for.cond.i, !dbg !4071, !llvm.loop !4072

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4074
    #dbg_value(i32 %inc, !4049, !DIExpression(), !4042)
  br label %for.cond, !dbg !4075, !llvm.loop !4076

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4078
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !282 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !293, !DIExpression(), !4079)
    #dbg_value(ptr %seed, !295, !DIExpression(), !4079)
    #dbg_value(i8 %x, !296, !DIExpression(), !4079)
    #dbg_value(i8 %y, !297, !DIExpression(), !4079)
    #dbg_declare(ptr %extseed, !298, !DIExpression(), !4080)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4081
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4082
  store i8 %x, ptr %arrayidx, align 1, !dbg !4083
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4084
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4085
    #dbg_value(ptr %state, !307, !DIExpression(), !4086)
    #dbg_value(ptr %extseed, !319, !DIExpression(), !4086)
    #dbg_value(i32 34, !320, !DIExpression(), !4086)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4088
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4089
  store i32 168, ptr %pos.i, align 8, !dbg !4090
  ret void, !dbg !4091
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !560 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !564, !DIExpression(), !4092)
    #dbg_value(i32 %outlen, !566, !DIExpression(), !4092)
    #dbg_value(ptr %key, !567, !DIExpression(), !4092)
    #dbg_value(i8 %nonce, !568, !DIExpression(), !4092)
    #dbg_declare(ptr %extkey, !569, !DIExpression(), !4093)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4094
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4095
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4096
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4097
  ret void, !dbg !4098
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4099 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4100, !DIExpression(), !4101)
    #dbg_value(ptr %key, !4102, !DIExpression(), !4101)
    #dbg_value(ptr %input, !4103, !DIExpression(), !4101)
    #dbg_declare(ptr %s, !4104, !DIExpression(), !4105)
    #dbg_value(ptr %s, !3720, !DIExpression(), !4106)
    #dbg_value(ptr %s, !2980, !DIExpression(), !4108)
    #dbg_value(i32 0, !2986, !DIExpression(), !4108)
  br label %for.cond.i, !dbg !4110

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4111
    #dbg_value(i32 %i.0.i, !2986, !DIExpression(), !4108)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4112
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4113

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4114
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4115
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4116
    #dbg_value(i32 %inc.i, !2986, !DIExpression(), !4108)
  br label %for.cond.i, !dbg !4117, !llvm.loop !4118

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4120
  store i32 0, ptr %pos.i, align 8, !dbg !4121
    #dbg_value(ptr %s, !3738, !DIExpression(), !4122)
    #dbg_value(ptr %key, !3740, !DIExpression(), !4122)
    #dbg_value(i32 32, !3741, !DIExpression(), !4122)
  %call.i5 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4124
  %pos1.i6 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4125
  store i32 %call.i5, ptr %pos1.i6, align 8, !dbg !4126
    #dbg_value(ptr %s, !3738, !DIExpression(), !4127)
    #dbg_value(ptr %input, !3740, !DIExpression(), !4127)
    #dbg_value(i32 1088, !3741, !DIExpression(), !4127)
  %call.i = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i5, i32 noundef 136, ptr noundef %input, i32 noundef 1088) #4, !dbg !4129
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4130
  store i32 %call.i, ptr %pos1.i, align 8, !dbg !4131
    #dbg_value(ptr %s, !3748, !DIExpression(), !4132)
    #dbg_value(ptr %s, !3532, !DIExpression(), !4134)
    #dbg_value(i32 %call.i, !3538, !DIExpression(), !4134)
    #dbg_value(i32 136, !3539, !DIExpression(), !4134)
    #dbg_value(i8 31, !3540, !DIExpression(), !4134)
  %rem.i = shl i32 %call.i, 3, !dbg !4136
  %mul.i = and i32 %rem.i, 56, !dbg !4136
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4137
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4137
  %div2.i = lshr i32 %call.i, 3, !dbg !4138
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4139
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4140
  %xor.i = xor i64 %0, %shl.i, !dbg !4140
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4140
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4141
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4142
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4142
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4142
  %pos1.i3 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4143
  store i32 136, ptr %pos1.i3, align 8, !dbg !4144
    #dbg_value(ptr %out, !605, !DIExpression(), !4145)
    #dbg_value(i32 32, !609, !DIExpression(), !4145)
    #dbg_value(ptr %s, !610, !DIExpression(), !4145)
    #dbg_value(ptr %out, !612, !DIExpression(), !4147)
    #dbg_value(i32 32, !618, !DIExpression(), !4147)
    #dbg_value(ptr %s, !619, !DIExpression(), !4147)
    #dbg_value(i32 136, !620, !DIExpression(), !4147)
    #dbg_value(i32 136, !621, !DIExpression(), !4147)
  br label %while.cond.i, !dbg !4149

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !612, !DIExpression(), !4147)
    #dbg_value(i32 %outlen.addr.0.i, !618, !DIExpression(), !4147)
    #dbg_value(i32 %pos.addr.0.i, !620, !DIExpression(), !4147)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4149
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4149

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4150
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4150

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4151
    #dbg_value(i32 0, !620, !DIExpression(), !4147)
  br label %if.end.i, !dbg !4152

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !620, !DIExpression(), !4147)
    #dbg_value(i32 %pos.addr.1.i, !629, !DIExpression(), !4147)
  br label %for.cond.i12, !dbg !4153

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4154
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(), !4147)
    #dbg_value(i32 %i.0.i13, !629, !DIExpression(), !4147)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4155
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4156
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4156
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4156
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4157

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4158
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4159
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4159
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4160
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4160
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4161
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4161
  %conv.i = trunc i64 %shr.i to i8, !dbg !4159
    #dbg_value(ptr %out.addr.1.i, !612, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4147)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4162
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4163
    #dbg_value(ptr %incdec.ptr.i, !612, !DIExpression(), !4147)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4164
    #dbg_value(i32 %inc.i19, !629, !DIExpression(), !4147)
  br label %for.cond.i12, !dbg !4165, !llvm.loop !4166

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4154
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4168
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4169
    #dbg_value(i32 %sub3.i, !618, !DIExpression(), !4147)
    #dbg_value(i32 %i.0.i13.lcssa, !620, !DIExpression(), !4147)
  br label %while.cond.i, !dbg !4149, !llvm.loop !4170

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4172
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i9, align 8, !dbg !4173
  ret void, !dbg !4174
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
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber768_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
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
!56 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair_derand", scope: !57, file: !57, line: 25, type: !58, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!79 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !57, file: !57, line: 50, type: !80, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!101 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !57, file: !57, line: 76, type: !102, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!120 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!133 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !57, file: !57, line: 140, type: !134, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 8704, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 1088)
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
!159 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !160, file: !160, line: 16, type: !161, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
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
!191 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !160, file: !160, line: 40, type: !192, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
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
!220 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !221, file: !221, line: 165, type: !222, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!221 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!222 = !DISubroutineType(types: !223)
!223 = !{null, !224, !64, !9}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !227)
!226 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 12288, elements: !228)
!228 = !{!229}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !227, file: !226, line: 9, baseType: !230, size: 12288)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !231, size: 12288, elements: !239)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !232, line: 13, baseType: !233)
!232 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !232, line: 11, size: 4096, elements: !234)
!234 = !{!235}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !233, file: !232, line: 12, baseType: !236, size: 4096)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 256)
!239 = !{!240}
!240 = !DISubrange(count: 3)
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
!282 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !283, file: !283, line: 18, type: !284, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
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
!505 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !221, file: !221, line: 205, type: !506, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!519 = !DICompositeType(tag: DW_TAG_array_type, baseType: !225, size: 36864, elements: !239)
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
!542 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !543, file: !543, line: 225, type: !544, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!560 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !283, file: !283, line: 43, type: !561, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
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
!657 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !658, file: !658, line: 110, type: !659, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
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
!682 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !681, file: !681, line: 170, type: !683, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!683 = !DISubroutineType(types: !684)
!684 = !{null, !685}
!685 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 32)
!686 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !226, line: 10, baseType: !687)
!687 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !226, line: 8, size: 12288, elements: !688)
!688 = !{!689}
!689 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !687, file: !226, line: 9, baseType: !690, size: 12288)
!690 = !DICompositeType(tag: DW_TAG_array_type, baseType: !691, size: 12288, elements: !239)
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
!769 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !543, file: !543, line: 261, type: !770, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!770 = !DISubroutineType(types: !771)
!771 = !{null, !546}
!772 = !DILocation(line: 0, scope: !769, inlinedAt: !773)
!773 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !695)
!774 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !773)
!775 = !DILocalVariable(name: "r", arg: 1, scope: !776, file: !543, line: 323, type: !546)
!776 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !543, file: !543, line: 323, type: !770, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!788 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !789, file: !789, line: 35, type: !790, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
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
!849 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !681, file: !681, line: 241, type: !850, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!861 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !543, file: !543, line: 307, type: !770, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!876 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !789, file: !789, line: 16, type: !877, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
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
!903 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !681, file: !681, line: 225, type: !683, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!904 = distinct !DILocation(line: 237, column: 3, scope: !505)
!905 = !DILocation(line: 245, column: 15, scope: !900, inlinedAt: !854)
!906 = !DILocation(line: 245, column: 27, scope: !900, inlinedAt: !854)
!907 = !DILocation(line: 245, column: 39, scope: !900, inlinedAt: !854)
!908 = !DILocalVariable(name: "r", arg: 1, scope: !909, file: !543, line: 339, type: !546)
!909 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !543, file: !543, line: 339, type: !910, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!945 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !681, file: !681, line: 139, type: !946, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!1011 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !221, file: !221, line: 260, type: !1012, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!1047 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !681, file: !681, line: 156, type: !1048, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!1071 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !543, file: !543, line: 168, type: !1072, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1100 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !160, file: !160, line: 71, type: !1101, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
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
!1196 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !543, file: !543, line: 244, type: !544, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1256 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !658, file: !658, line: 121, type: !659, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
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
!1374 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !681, file: !681, line: 185, type: !683, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!1386 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !543, file: !543, line: 276, type: !770, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1518 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !221, file: !221, line: 314, type: !1519, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!1543 = !DILocalVariable(name: "r", arg: 1, scope: !1544, file: !543, line: 83, type: !546)
!1544 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !543, file: !543, line: 83, type: !1072, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1545 = !DILocation(line: 0, scope: !1544, inlinedAt: !1546)
!1546 = distinct !DILocation(line: 105, column: 3, scope: !1534, inlinedAt: !1538)
!1547 = !DILocalVariable(name: "a", arg: 2, scope: !1544, file: !543, line: 83, type: !64)
!1548 = !DILocalVariable(name: "i", scope: !1544, file: !543, line: 85, type: !42)
!1549 = !DILocation(line: 88, column: 7, scope: !1550, inlinedAt: !1546)
!1550 = distinct !DILexicalBlock(scope: !1544, file: !543, line: 88, column: 3)
!1551 = !DILocation(line: 88, scope: !1550, inlinedAt: !1546)
!1552 = !DILocation(line: 88, column: 12, scope: !1553, inlinedAt: !1546)
!1553 = distinct !DILexicalBlock(scope: !1550, file: !543, line: 88, column: 3)
!1554 = !DILocation(line: 88, column: 3, scope: !1550, inlinedAt: !1546)
!1555 = !DILocation(line: 159, column: 3, scope: !1055, inlinedAt: !1556)
!1556 = distinct !DILocation(line: 72, column: 3, scope: !1557, inlinedAt: !1560)
!1557 = distinct !DISubprogram(name: "unpack_sk", scope: !221, file: !221, line: 70, type: !1558, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{null, !224, !64}
!1560 = distinct !DILocation(line: 322, column: 3, scope: !1518)
!1561 = !DILocation(line: 89, column: 37, scope: !1562, inlinedAt: !1546)
!1562 = distinct !DILexicalBlock(scope: !1553, file: !543, line: 88, column: 28)
!1563 = !DILocation(line: 89, column: 42, scope: !1562, inlinedAt: !1546)
!1564 = !DILocation(line: 89, column: 26, scope: !1562, inlinedAt: !1546)
!1565 = !DILocation(line: 89, column: 47, scope: !1562, inlinedAt: !1546)
!1566 = !DILocation(line: 89, column: 57, scope: !1562, inlinedAt: !1546)
!1567 = !DILocation(line: 89, column: 62, scope: !1562, inlinedAt: !1546)
!1568 = !DILocation(line: 89, column: 24, scope: !1562, inlinedAt: !1546)
!1569 = !DILocation(line: 89, column: 16, scope: !1562, inlinedAt: !1546)
!1570 = !DILocation(line: 89, column: 5, scope: !1562, inlinedAt: !1546)
!1571 = !DILocation(line: 89, column: 22, scope: !1562, inlinedAt: !1546)
!1572 = !DILocation(line: 90, column: 37, scope: !1562, inlinedAt: !1546)
!1573 = !DILocation(line: 90, column: 42, scope: !1562, inlinedAt: !1546)
!1574 = !DILocation(line: 90, column: 26, scope: !1562, inlinedAt: !1546)
!1575 = !DILocation(line: 90, column: 47, scope: !1562, inlinedAt: !1546)
!1576 = !DILocation(line: 90, column: 57, scope: !1562, inlinedAt: !1546)
!1577 = !DILocation(line: 90, column: 62, scope: !1562, inlinedAt: !1546)
!1578 = !DILocation(line: 90, column: 24, scope: !1562, inlinedAt: !1546)
!1579 = !DILocation(line: 90, column: 16, scope: !1562, inlinedAt: !1546)
!1580 = !DILocation(line: 90, column: 18, scope: !1562, inlinedAt: !1546)
!1581 = !DILocation(line: 90, column: 5, scope: !1562, inlinedAt: !1546)
!1582 = !DILocation(line: 90, column: 22, scope: !1562, inlinedAt: !1546)
!1583 = !DILocation(line: 91, column: 7, scope: !1562, inlinedAt: !1546)
!1584 = !DILocation(line: 88, column: 24, scope: !1553, inlinedAt: !1546)
!1585 = !DILocation(line: 88, column: 3, scope: !1553, inlinedAt: !1546)
!1586 = distinct !{!1586, !1554, !1587, !185}
!1587 = !DILocation(line: 92, column: 3, scope: !1550, inlinedAt: !1546)
!1588 = !DILocation(line: 159, scope: !1055, inlinedAt: !1556)
!1589 = !DILocation(line: 0, scope: !1047, inlinedAt: !1556)
!1590 = !DILocation(line: 159, column: 12, scope: !1058, inlinedAt: !1556)
!1591 = !DILocation(line: 173, column: 3, scope: !680, inlinedAt: !1592)
!1592 = distinct !DILocation(line: 324, column: 3, scope: !1518)
!1593 = !DILocation(line: 160, column: 21, scope: !1058, inlinedAt: !1556)
!1594 = !DILocation(line: 160, column: 35, scope: !1058, inlinedAt: !1556)
!1595 = !DILocation(line: 160, column: 33, scope: !1058, inlinedAt: !1556)
!1596 = !DILocation(line: 160, column: 5, scope: !1058, inlinedAt: !1556)
!1597 = !DILocation(line: 159, column: 22, scope: !1058, inlinedAt: !1556)
!1598 = !DILocation(line: 159, column: 3, scope: !1058, inlinedAt: !1556)
!1599 = distinct !{!1599, !1555, !1600, !185}
!1600 = !DILocation(line: 160, column: 51, scope: !1055, inlinedAt: !1556)
!1601 = !DILocation(line: 173, scope: !680, inlinedAt: !1592)
!1602 = !DILocation(line: 0, scope: !682, inlinedAt: !1592)
!1603 = !DILocation(line: 173, column: 12, scope: !764, inlinedAt: !1592)
!1604 = !DILocation(line: 174, column: 15, scope: !764, inlinedAt: !1592)
!1605 = !DILocation(line: 0, scope: !769, inlinedAt: !1606)
!1606 = distinct !DILocation(line: 174, column: 5, scope: !764, inlinedAt: !1592)
!1607 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !1606)
!1608 = !DILocation(line: 0, scope: !776, inlinedAt: !1609)
!1609 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !1606)
!1610 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1609)
!1611 = !DILocation(line: 326, scope: !781, inlinedAt: !1609)
!1612 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1609)
!1613 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1609)
!1614 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1609)
!1615 = !DILocation(line: 0, scope: !788, inlinedAt: !1616)
!1616 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1609)
!1617 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1616)
!1618 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1616)
!1619 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1616)
!1620 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1616)
!1621 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1616)
!1622 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1609)
!1623 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1609)
!1624 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1609)
!1625 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1609)
!1626 = distinct !{!1626, !1613, !1627, !185}
!1627 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1609)
!1628 = !DILocation(line: 173, column: 22, scope: !764, inlinedAt: !1592)
!1629 = !DILocation(line: 173, column: 3, scope: !764, inlinedAt: !1592)
!1630 = distinct !{!1630, !1591, !1631, !185}
!1631 = !DILocation(line: 174, column: 24, scope: !680, inlinedAt: !1592)
!1632 = !DILocation(line: 325, column: 3, scope: !1518)
!1633 = !DILocation(line: 0, scope: !1386, inlinedAt: !1634)
!1634 = distinct !DILocation(line: 326, column: 3, scope: !1518)
!1635 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !1634)
!1636 = !DILocalVariable(name: "r", arg: 1, scope: !1637, file: !543, line: 355, type: !546)
!1637 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !543, file: !543, line: 355, type: !910, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1638 = !DILocation(line: 0, scope: !1637, inlinedAt: !1639)
!1639 = distinct !DILocation(line: 328, column: 3, scope: !1518)
!1640 = !DILocalVariable(name: "a", arg: 2, scope: !1637, file: !543, line: 355, type: !912)
!1641 = !DILocalVariable(name: "b", arg: 3, scope: !1637, file: !543, line: 355, type: !912)
!1642 = !DILocalVariable(name: "i", scope: !1637, file: !543, line: 357, type: !42)
!1643 = !DILocation(line: 358, column: 7, scope: !1644, inlinedAt: !1639)
!1644 = distinct !DILexicalBlock(scope: !1637, file: !543, line: 358, column: 3)
!1645 = !DILocation(line: 358, scope: !1644, inlinedAt: !1639)
!1646 = !DILocation(line: 358, column: 12, scope: !1647, inlinedAt: !1639)
!1647 = distinct !DILexicalBlock(scope: !1644, file: !543, line: 358, column: 3)
!1648 = !DILocation(line: 358, column: 3, scope: !1644, inlinedAt: !1639)
!1649 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1650)
!1650 = distinct !DILocation(line: 329, column: 3, scope: !1518)
!1651 = !DILocation(line: 359, column: 20, scope: !1647, inlinedAt: !1639)
!1652 = !DILocation(line: 359, column: 35, scope: !1647, inlinedAt: !1639)
!1653 = !DILocation(line: 359, column: 33, scope: !1647, inlinedAt: !1639)
!1654 = !DILocation(line: 359, column: 5, scope: !1647, inlinedAt: !1639)
!1655 = !DILocation(line: 359, column: 18, scope: !1647, inlinedAt: !1639)
!1656 = !DILocation(line: 358, column: 22, scope: !1647, inlinedAt: !1639)
!1657 = !DILocation(line: 358, column: 3, scope: !1647, inlinedAt: !1639)
!1658 = distinct !{!1658, !1648, !1659, !185}
!1659 = !DILocation(line: 359, column: 46, scope: !1644, inlinedAt: !1639)
!1660 = !DILocation(line: 326, scope: !781, inlinedAt: !1650)
!1661 = !DILocation(line: 0, scope: !776, inlinedAt: !1650)
!1662 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1650)
!1663 = !DILocation(line: 197, column: 3, scope: !1664, inlinedAt: !1668)
!1664 = distinct !DILexicalBlock(scope: !1665, file: !543, line: 197, column: 3)
!1665 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !543, file: !543, line: 192, type: !1666, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1666 = !DISubroutineType(types: !1667)
!1667 = !{null, !60, !912}
!1668 = distinct !DILocation(line: 331, column: 3, scope: !1518)
!1669 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1650)
!1670 = !DILocation(line: 0, scope: !788, inlinedAt: !1671)
!1671 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1650)
!1672 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1671)
!1673 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1671)
!1674 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1671)
!1675 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1671)
!1676 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1671)
!1677 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1650)
!1678 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1650)
!1679 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1650)
!1680 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1650)
!1681 = distinct !{!1681, !1649, !1682, !185}
!1682 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1650)
!1683 = !DILocation(line: 197, scope: !1664, inlinedAt: !1668)
!1684 = !DILocalVariable(name: "i", scope: !1665, file: !543, line: 194, type: !42)
!1685 = !DILocation(line: 0, scope: !1665, inlinedAt: !1668)
!1686 = !DILocation(line: 197, column: 12, scope: !1687, inlinedAt: !1668)
!1687 = distinct !DILexicalBlock(scope: !1664, file: !543, line: 197, column: 3)
!1688 = !DILocation(line: 198, column: 5, scope: !1689, inlinedAt: !1668)
!1689 = distinct !DILexicalBlock(scope: !1687, file: !543, line: 197, column: 28)
!1690 = !DILocation(line: 198, column: 12, scope: !1689, inlinedAt: !1668)
!1691 = !DILocalVariable(name: "j", scope: !1665, file: !543, line: 194, type: !42)
!1692 = !DILocation(line: 199, column: 9, scope: !1693, inlinedAt: !1668)
!1693 = distinct !DILexicalBlock(scope: !1689, file: !543, line: 199, column: 5)
!1694 = !DILocation(line: 199, scope: !1693, inlinedAt: !1668)
!1695 = !DILocation(line: 199, column: 14, scope: !1696, inlinedAt: !1668)
!1696 = distinct !DILexicalBlock(scope: !1693, file: !543, line: 199, column: 5)
!1697 = !DILocation(line: 199, column: 5, scope: !1693, inlinedAt: !1668)
!1698 = !DILocation(line: 200, column: 23, scope: !1699, inlinedAt: !1668)
!1699 = distinct !DILexicalBlock(scope: !1696, file: !543, line: 199, column: 22)
!1700 = !DILocation(line: 200, column: 25, scope: !1699, inlinedAt: !1668)
!1701 = !DILocation(line: 200, column: 12, scope: !1699, inlinedAt: !1668)
!1702 = !DILocalVariable(name: "t", scope: !1665, file: !543, line: 195, type: !40)
!1703 = !DILocation(line: 205, column: 9, scope: !1699, inlinedAt: !1668)
!1704 = !DILocation(line: 206, column: 9, scope: !1699, inlinedAt: !1668)
!1705 = !DILocation(line: 207, column: 9, scope: !1699, inlinedAt: !1668)
!1706 = !DILocation(line: 208, column: 19, scope: !1699, inlinedAt: !1668)
!1707 = !DILocation(line: 208, column: 7, scope: !1699, inlinedAt: !1668)
!1708 = !DILocation(line: 208, column: 14, scope: !1699, inlinedAt: !1668)
!1709 = !DILocation(line: 199, column: 18, scope: !1696, inlinedAt: !1668)
!1710 = !DILocation(line: 199, column: 5, scope: !1696, inlinedAt: !1668)
!1711 = distinct !{!1711, !1697, !1712, !185}
!1712 = !DILocation(line: 209, column: 5, scope: !1693, inlinedAt: !1668)
!1713 = !DILocation(line: 197, column: 24, scope: !1687, inlinedAt: !1668)
!1714 = !DILocation(line: 197, column: 3, scope: !1687, inlinedAt: !1668)
!1715 = distinct !{!1715, !1663, !1716, !185}
!1716 = !DILocation(line: 210, column: 3, scope: !1664, inlinedAt: !1668)
!1717 = !DILocation(line: 332, column: 1, scope: !1518)
!1718 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !681, file: !681, line: 15, type: !946, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1719 = !DILocalVariable(name: "r", arg: 1, scope: !1718, file: !681, line: 15, type: !60)
!1720 = !DILocation(line: 0, scope: !1718)
!1721 = !DILocalVariable(name: "a", arg: 2, scope: !1718, file: !681, line: 15, type: !852)
!1722 = !DILocalVariable(name: "t", scope: !1718, file: !681, line: 51, type: !1723)
!1723 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 64, elements: !1724)
!1724 = !{!1725}
!1725 = !DISubrange(count: 4)
!1726 = !DILocation(line: 51, column: 12, scope: !1718)
!1727 = !DILocalVariable(name: "i", scope: !1718, file: !681, line: 17, type: !42)
!1728 = !DILocation(line: 52, column: 7, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1718, file: !681, line: 52, column: 3)
!1730 = !DILocation(line: 52, scope: !1729)
!1731 = !DILocation(line: 52, column: 12, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1729, file: !681, line: 52, column: 3)
!1733 = !DILocation(line: 52, column: 3, scope: !1729)
!1734 = !DILocation(line: 53, column: 5, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1736, file: !681, line: 53, column: 5)
!1736 = distinct !DILexicalBlock(scope: !1732, file: !681, line: 52, column: 26)
!1737 = !DILocation(line: 53, scope: !1735)
!1738 = !DILocalVariable(name: "j", scope: !1718, file: !681, line: 17, type: !42)
!1739 = !DILocation(line: 53, column: 14, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1735, file: !681, line: 53, column: 5)
!1741 = !DILocation(line: 54, column: 7, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !681, line: 54, column: 7)
!1743 = distinct !DILexicalBlock(scope: !1740, file: !681, line: 53, column: 30)
!1744 = !DILocation(line: 54, scope: !1742)
!1745 = !DILocalVariable(name: "k", scope: !1718, file: !681, line: 17, type: !42)
!1746 = !DILocation(line: 54, column: 16, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1742, file: !681, line: 54, column: 7)
!1748 = !DILocation(line: 55, column: 17, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1747, file: !681, line: 54, column: 24)
!1750 = !DILocation(line: 55, column: 35, scope: !1749)
!1751 = !DILocation(line: 55, column: 37, scope: !1749)
!1752 = !DILocation(line: 56, column: 39, scope: !1749)
!1753 = !DILocation(line: 56, column: 9, scope: !1749)
!1754 = !DILocation(line: 56, column: 14, scope: !1749)
!1755 = !DILocation(line: 58, column: 14, scope: !1749)
!1756 = !DILocalVariable(name: "d0", scope: !1718, file: !681, line: 18, type: !23)
!1757 = !DILocation(line: 61, column: 12, scope: !1749)
!1758 = !DILocation(line: 62, column: 12, scope: !1749)
!1759 = !DILocation(line: 63, column: 16, scope: !1749)
!1760 = !DILocation(line: 63, column: 9, scope: !1749)
!1761 = !DILocation(line: 63, column: 14, scope: !1749)
!1762 = !DILocation(line: 54, column: 20, scope: !1747)
!1763 = !DILocation(line: 54, column: 7, scope: !1747)
!1764 = distinct !{!1764, !1741, !1765, !185}
!1765 = !DILocation(line: 64, column: 7, scope: !1742)
!1766 = !DILocation(line: 66, column: 15, scope: !1743)
!1767 = !DILocation(line: 66, column: 14, scope: !1743)
!1768 = !DILocation(line: 66, column: 12, scope: !1743)
!1769 = !DILocation(line: 67, column: 15, scope: !1743)
!1770 = !DILocation(line: 67, column: 20, scope: !1743)
!1771 = !DILocation(line: 67, column: 29, scope: !1743)
!1772 = !DILocation(line: 67, column: 34, scope: !1743)
!1773 = !DILocation(line: 67, column: 26, scope: !1743)
!1774 = !DILocation(line: 67, column: 7, scope: !1743)
!1775 = !DILocation(line: 67, column: 12, scope: !1743)
!1776 = !DILocation(line: 68, column: 15, scope: !1743)
!1777 = !DILocation(line: 68, column: 20, scope: !1743)
!1778 = !DILocation(line: 68, column: 29, scope: !1743)
!1779 = !DILocation(line: 68, column: 34, scope: !1743)
!1780 = !DILocation(line: 68, column: 26, scope: !1743)
!1781 = !DILocation(line: 68, column: 7, scope: !1743)
!1782 = !DILocation(line: 68, column: 12, scope: !1743)
!1783 = !DILocation(line: 69, column: 15, scope: !1743)
!1784 = !DILocation(line: 69, column: 20, scope: !1743)
!1785 = !DILocation(line: 69, column: 29, scope: !1743)
!1786 = !DILocation(line: 69, column: 34, scope: !1743)
!1787 = !DILocation(line: 69, column: 26, scope: !1743)
!1788 = !DILocation(line: 69, column: 7, scope: !1743)
!1789 = !DILocation(line: 69, column: 12, scope: !1743)
!1790 = !DILocation(line: 70, column: 15, scope: !1743)
!1791 = !DILocation(line: 70, column: 20, scope: !1743)
!1792 = !DILocation(line: 70, column: 14, scope: !1743)
!1793 = !DILocation(line: 70, column: 7, scope: !1743)
!1794 = !DILocation(line: 70, column: 12, scope: !1743)
!1795 = !DILocation(line: 71, column: 9, scope: !1743)
!1796 = !DILocation(line: 53, column: 26, scope: !1740)
!1797 = !DILocation(line: 53, column: 5, scope: !1740)
!1798 = distinct !{!1798, !1734, !1799, !185}
!1799 = !DILocation(line: 72, column: 5, scope: !1735)
!1800 = !DILocation(line: 52, column: 22, scope: !1732)
!1801 = !DILocation(line: 52, column: 3, scope: !1732)
!1802 = distinct !{!1802, !1733, !1803, !185}
!1803 = !DILocation(line: 73, column: 3, scope: !1729)
!1804 = !DILocation(line: 77, column: 1, scope: !1718)
!1805 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !681, file: !681, line: 89, type: !1048, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1806 = !DILocalVariable(name: "r", arg: 1, scope: !1805, file: !681, line: 89, type: !685)
!1807 = !DILocation(line: 0, scope: !1805)
!1808 = !DILocalVariable(name: "a", arg: 2, scope: !1805, file: !681, line: 89, type: !64)
!1809 = !DILocalVariable(name: "t", scope: !1805, file: !681, line: 112, type: !1723)
!1810 = !DILocation(line: 112, column: 12, scope: !1805)
!1811 = !DILocalVariable(name: "i", scope: !1805, file: !681, line: 91, type: !42)
!1812 = !DILocation(line: 113, column: 7, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1805, file: !681, line: 113, column: 3)
!1814 = !DILocation(line: 113, scope: !1813)
!1815 = !DILocation(line: 113, column: 12, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1813, file: !681, line: 113, column: 3)
!1817 = !DILocation(line: 113, column: 3, scope: !1813)
!1818 = !DILocation(line: 114, column: 5, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1820, file: !681, line: 114, column: 5)
!1820 = distinct !DILexicalBlock(scope: !1816, file: !681, line: 113, column: 26)
!1821 = !DILocation(line: 114, scope: !1819)
!1822 = !DILocalVariable(name: "j", scope: !1805, file: !681, line: 91, type: !42)
!1823 = !DILocation(line: 114, column: 14, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1819, file: !681, line: 114, column: 5)
!1825 = !DILocation(line: 115, column: 15, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1824, file: !681, line: 114, column: 30)
!1827 = !DILocation(line: 115, column: 39, scope: !1826)
!1828 = !DILocation(line: 115, column: 29, scope: !1826)
!1829 = !DILocation(line: 115, column: 44, scope: !1826)
!1830 = !DILocation(line: 115, column: 26, scope: !1826)
!1831 = !DILocation(line: 115, column: 12, scope: !1826)
!1832 = !DILocation(line: 116, column: 15, scope: !1826)
!1833 = !DILocation(line: 116, column: 20, scope: !1826)
!1834 = !DILocation(line: 116, column: 39, scope: !1826)
!1835 = !DILocation(line: 116, column: 29, scope: !1826)
!1836 = !DILocation(line: 116, column: 44, scope: !1826)
!1837 = !DILocation(line: 116, column: 26, scope: !1826)
!1838 = !DILocation(line: 116, column: 7, scope: !1826)
!1839 = !DILocation(line: 116, column: 12, scope: !1826)
!1840 = !DILocation(line: 117, column: 15, scope: !1826)
!1841 = !DILocation(line: 117, column: 20, scope: !1826)
!1842 = !DILocation(line: 117, column: 39, scope: !1826)
!1843 = !DILocation(line: 117, column: 29, scope: !1826)
!1844 = !DILocation(line: 117, column: 44, scope: !1826)
!1845 = !DILocation(line: 117, column: 26, scope: !1826)
!1846 = !DILocation(line: 117, column: 7, scope: !1826)
!1847 = !DILocation(line: 117, column: 12, scope: !1826)
!1848 = !DILocation(line: 118, column: 15, scope: !1826)
!1849 = !DILocation(line: 118, column: 20, scope: !1826)
!1850 = !DILocation(line: 118, column: 39, scope: !1826)
!1851 = !DILocation(line: 118, column: 29, scope: !1826)
!1852 = !DILocation(line: 118, column: 44, scope: !1826)
!1853 = !DILocation(line: 118, column: 26, scope: !1826)
!1854 = !DILocation(line: 118, column: 7, scope: !1826)
!1855 = !DILocation(line: 118, column: 12, scope: !1826)
!1856 = !DILocalVariable(name: "k", scope: !1805, file: !681, line: 91, type: !42)
!1857 = !DILocation(line: 121, column: 11, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1826, file: !681, line: 121, column: 7)
!1859 = !DILocation(line: 121, scope: !1858)
!1860 = !DILocation(line: 121, column: 16, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1858, file: !681, line: 121, column: 7)
!1862 = !DILocation(line: 121, column: 7, scope: !1858)
!1863 = !DILocation(line: 122, column: 47, scope: !1861)
!1864 = !DILocation(line: 122, column: 52, scope: !1861)
!1865 = !DILocation(line: 122, column: 60, scope: !1861)
!1866 = !DILocation(line: 122, column: 69, scope: !1861)
!1867 = !DILocation(line: 122, column: 76, scope: !1861)
!1868 = !DILocation(line: 122, column: 35, scope: !1861)
!1869 = !DILocation(line: 122, column: 9, scope: !1861)
!1870 = !DILocation(line: 122, column: 27, scope: !1861)
!1871 = !DILocation(line: 122, column: 29, scope: !1861)
!1872 = !DILocation(line: 122, column: 33, scope: !1861)
!1873 = !DILocation(line: 121, column: 20, scope: !1861)
!1874 = !DILocation(line: 121, column: 7, scope: !1861)
!1875 = distinct !{!1875, !1862, !1876, !185}
!1876 = !DILocation(line: 122, column: 79, scope: !1858)
!1877 = !DILocation(line: 119, column: 9, scope: !1826)
!1878 = !DILocation(line: 114, column: 26, scope: !1824)
!1879 = !DILocation(line: 114, column: 5, scope: !1824)
!1880 = distinct !{!1880, !1818, !1881, !185}
!1881 = !DILocation(line: 123, column: 5, scope: !1819)
!1882 = !DILocation(line: 113, column: 22, scope: !1816)
!1883 = !DILocation(line: 113, column: 3, scope: !1816)
!1884 = distinct !{!1884, !1817, !1885, !185}
!1885 = !DILocation(line: 124, column: 3, scope: !1813)
!1886 = !DILocation(line: 128, column: 1, scope: !1805)
!1887 = !DILocalVariable(name: "r", arg: 1, scope: !945, file: !681, line: 139, type: !60)
!1888 = !DILocation(line: 0, scope: !945)
!1889 = !DILocalVariable(name: "a", arg: 2, scope: !945, file: !681, line: 139, type: !852)
!1890 = !DILocation(line: 142, column: 7, scope: !944)
!1891 = !DILocation(line: 142, scope: !944)
!1892 = !DILocation(line: 142, column: 12, scope: !982)
!1893 = !DILocation(line: 142, column: 3, scope: !944)
!1894 = !DILocation(line: 143, column: 21, scope: !982)
!1895 = !DILocation(line: 143, column: 19, scope: !982)
!1896 = !DILocation(line: 143, column: 40, scope: !982)
!1897 = !DILocation(line: 143, column: 5, scope: !982)
!1898 = !DILocation(line: 142, column: 22, scope: !982)
!1899 = !DILocation(line: 142, column: 3, scope: !982)
!1900 = distinct !{!1900, !1893, !1901, !185}
!1901 = !DILocation(line: 143, column: 49, scope: !944)
!1902 = !DILocation(line: 144, column: 1, scope: !945)
!1903 = !DILocation(line: 0, scope: !1047)
!1904 = !DILocation(line: 159, column: 7, scope: !1055)
!1905 = !DILocation(line: 159, scope: !1055)
!1906 = !DILocation(line: 159, column: 12, scope: !1058)
!1907 = !DILocation(line: 159, column: 3, scope: !1055)
!1908 = !DILocation(line: 160, column: 21, scope: !1058)
!1909 = !DILocation(line: 160, column: 35, scope: !1058)
!1910 = !DILocation(line: 160, column: 33, scope: !1058)
!1911 = !DILocation(line: 160, column: 5, scope: !1058)
!1912 = !DILocation(line: 159, column: 22, scope: !1058)
!1913 = !DILocation(line: 159, column: 3, scope: !1058)
!1914 = distinct !{!1914, !1907, !1915, !185}
!1915 = !DILocation(line: 160, column: 51, scope: !1055)
!1916 = !DILocation(line: 161, column: 1, scope: !1047)
!1917 = !DILocation(line: 0, scope: !682)
!1918 = !DILocation(line: 173, column: 7, scope: !680)
!1919 = !DILocation(line: 173, scope: !680)
!1920 = !DILocation(line: 173, column: 12, scope: !764)
!1921 = !DILocation(line: 173, column: 3, scope: !680)
!1922 = !DILocation(line: 174, column: 15, scope: !764)
!1923 = !DILocation(line: 0, scope: !769, inlinedAt: !1924)
!1924 = distinct !DILocation(line: 174, column: 5, scope: !764)
!1925 = !DILocation(line: 263, column: 3, scope: !769, inlinedAt: !1924)
!1926 = !DILocation(line: 0, scope: !776, inlinedAt: !1927)
!1927 = distinct !DILocation(line: 264, column: 3, scope: !769, inlinedAt: !1924)
!1928 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !1927)
!1929 = !DILocation(line: 326, scope: !781, inlinedAt: !1927)
!1930 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1927)
!1931 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1927)
!1932 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1927)
!1933 = !DILocation(line: 0, scope: !788, inlinedAt: !1934)
!1934 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1927)
!1935 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !1934)
!1936 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !1934)
!1937 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !1934)
!1938 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !1934)
!1939 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !1934)
!1940 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1927)
!1941 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1927)
!1942 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1927)
!1943 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1927)
!1944 = distinct !{!1944, !1931, !1945, !185}
!1945 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1927)
!1946 = !DILocation(line: 173, column: 22, scope: !764)
!1947 = !DILocation(line: 173, column: 3, scope: !764)
!1948 = distinct !{!1948, !1921, !1949, !185}
!1949 = !DILocation(line: 174, column: 24, scope: !680)
!1950 = !DILocation(line: 175, column: 1, scope: !682)
!1951 = !DILocation(line: 0, scope: !1374)
!1952 = !DILocation(line: 188, column: 7, scope: !1379)
!1953 = !DILocation(line: 188, scope: !1379)
!1954 = !DILocation(line: 188, column: 12, scope: !1382)
!1955 = !DILocation(line: 188, column: 3, scope: !1379)
!1956 = !DILocation(line: 189, column: 25, scope: !1382)
!1957 = !DILocation(line: 0, scope: !1386, inlinedAt: !1958)
!1958 = distinct !DILocation(line: 189, column: 5, scope: !1382)
!1959 = !DILocation(line: 278, column: 3, scope: !1386, inlinedAt: !1958)
!1960 = !DILocation(line: 188, column: 22, scope: !1382)
!1961 = !DILocation(line: 188, column: 3, scope: !1382)
!1962 = distinct !{!1962, !1955, !1963, !185}
!1963 = !DILocation(line: 189, column: 34, scope: !1379)
!1964 = !DILocation(line: 190, column: 1, scope: !1374)
!1965 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !681, file: !681, line: 202, type: !1966, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1966 = !DISubroutineType(types: !1967)
!1967 = !{null, !1968, !852, !852}
!1968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 32)
!1969 = !DILocalVariable(name: "r", arg: 1, scope: !1965, file: !681, line: 202, type: !1968)
!1970 = !DILocation(line: 0, scope: !1965)
!1971 = !DILocalVariable(name: "a", arg: 2, scope: !1965, file: !681, line: 202, type: !852)
!1972 = !DILocalVariable(name: "b", arg: 3, scope: !1965, file: !681, line: 202, type: !852)
!1973 = !DILocalVariable(name: "t", scope: !1965, file: !681, line: 205, type: !691)
!1974 = !DILocation(line: 205, column: 8, scope: !1965)
!1975 = !DILocation(line: 207, column: 3, scope: !1965)
!1976 = !DILocalVariable(name: "i", scope: !1965, file: !681, line: 204, type: !42)
!1977 = !DILocation(line: 208, column: 7, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1965, file: !681, line: 208, column: 3)
!1979 = !DILocation(line: 208, scope: !1978)
!1980 = !DILocation(line: 208, column: 12, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1978, file: !681, line: 208, column: 3)
!1982 = !DILocation(line: 208, column: 3, scope: !1978)
!1983 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !1984)
!1984 = distinct !DILocation(line: 213, column: 3, scope: !1965)
!1985 = !DILocation(line: 209, column: 34, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1981, file: !681, line: 208, column: 26)
!1987 = !DILocation(line: 209, column: 46, scope: !1986)
!1988 = !DILocation(line: 209, column: 5, scope: !1986)
!1989 = !DILocation(line: 0, scope: !909, inlinedAt: !1990)
!1990 = distinct !DILocation(line: 210, column: 5, scope: !1986)
!1991 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !1990)
!1992 = !DILocation(line: 342, scope: !920, inlinedAt: !1990)
!1993 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !1990)
!1994 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !1990)
!1995 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !1990)
!1996 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !1990)
!1997 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !1990)
!1998 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !1990)
!1999 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !1990)
!2000 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !1990)
!2001 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !1990)
!2002 = distinct !{!2002, !1994, !2003, !185}
!2003 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !1990)
!2004 = !DILocation(line: 208, column: 22, scope: !1981)
!2005 = !DILocation(line: 208, column: 3, scope: !1981)
!2006 = distinct !{!2006, !1982, !2007, !185}
!2007 = !DILocation(line: 211, column: 3, scope: !1978)
!2008 = !DILocation(line: 326, scope: !781, inlinedAt: !1984)
!2009 = !DILocation(line: 0, scope: !776, inlinedAt: !1984)
!2010 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !1984)
!2011 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !1984)
!2012 = !DILocation(line: 0, scope: !788, inlinedAt: !2013)
!2013 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !1984)
!2014 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2013)
!2015 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2013)
!2016 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2013)
!2017 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2013)
!2018 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2013)
!2019 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !1984)
!2020 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !1984)
!2021 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !1984)
!2022 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !1984)
!2023 = distinct !{!2023, !1983, !2024, !185}
!2024 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !1984)
!2025 = !DILocation(line: 214, column: 1, scope: !1965)
!2026 = !DILocalVariable(name: "r", arg: 1, scope: !903, file: !681, line: 225, type: !685)
!2027 = !DILocation(line: 0, scope: !903)
!2028 = !DILocation(line: 228, column: 7, scope: !902)
!2029 = !DILocation(line: 228, scope: !902)
!2030 = !DILocation(line: 228, column: 12, scope: !942)
!2031 = !DILocation(line: 228, column: 3, scope: !902)
!2032 = !DILocation(line: 229, column: 18, scope: !942)
!2033 = !DILocation(line: 0, scope: !776, inlinedAt: !2034)
!2034 = distinct !DILocation(line: 229, column: 5, scope: !942)
!2035 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !2034)
!2036 = !DILocation(line: 326, scope: !781, inlinedAt: !2034)
!2037 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !2034)
!2038 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !2034)
!2039 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !2034)
!2040 = !DILocation(line: 0, scope: !788, inlinedAt: !2041)
!2041 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !2034)
!2042 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2041)
!2043 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2041)
!2044 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2041)
!2045 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2041)
!2046 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2041)
!2047 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !2034)
!2048 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !2034)
!2049 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !2034)
!2050 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !2034)
!2051 = distinct !{!2051, !2038, !2052, !185}
!2052 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !2034)
!2053 = !DILocation(line: 228, column: 22, scope: !942)
!2054 = !DILocation(line: 228, column: 3, scope: !942)
!2055 = distinct !{!2055, !2031, !2056, !185}
!2056 = !DILocation(line: 229, column: 27, scope: !902)
!2057 = !DILocation(line: 230, column: 1, scope: !903)
!2058 = !DILocation(line: 0, scope: !849)
!2059 = !DILocation(line: 244, column: 7, scope: !848)
!2060 = !DILocation(line: 244, scope: !848)
!2061 = !DILocation(line: 244, column: 12, scope: !900)
!2062 = !DILocation(line: 244, column: 3, scope: !848)
!2063 = !DILocation(line: 245, column: 15, scope: !900)
!2064 = !DILocation(line: 245, column: 27, scope: !900)
!2065 = !DILocation(line: 245, column: 39, scope: !900)
!2066 = !DILocation(line: 0, scope: !909, inlinedAt: !2067)
!2067 = distinct !DILocation(line: 245, column: 5, scope: !900)
!2068 = !DILocation(line: 342, column: 7, scope: !920, inlinedAt: !2067)
!2069 = !DILocation(line: 342, scope: !920, inlinedAt: !2067)
!2070 = !DILocation(line: 342, column: 12, scope: !923, inlinedAt: !2067)
!2071 = !DILocation(line: 342, column: 3, scope: !920, inlinedAt: !2067)
!2072 = !DILocation(line: 343, column: 20, scope: !923, inlinedAt: !2067)
!2073 = !DILocation(line: 343, column: 35, scope: !923, inlinedAt: !2067)
!2074 = !DILocation(line: 343, column: 33, scope: !923, inlinedAt: !2067)
!2075 = !DILocation(line: 343, column: 5, scope: !923, inlinedAt: !2067)
!2076 = !DILocation(line: 343, column: 18, scope: !923, inlinedAt: !2067)
!2077 = !DILocation(line: 342, column: 22, scope: !923, inlinedAt: !2067)
!2078 = !DILocation(line: 342, column: 3, scope: !923, inlinedAt: !2067)
!2079 = distinct !{!2079, !2071, !2080, !185}
!2080 = !DILocation(line: 343, column: 46, scope: !920, inlinedAt: !2067)
!2081 = !DILocation(line: 244, column: 22, scope: !900)
!2082 = !DILocation(line: 244, column: 3, scope: !900)
!2083 = distinct !{!2083, !2062, !2084, !185}
!2084 = !DILocation(line: 245, column: 48, scope: !848)
!2085 = !DILocation(line: 246, column: 1, scope: !849)
!2086 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !543, file: !543, line: 19, type: !1666, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2087 = !DILocalVariable(name: "r", arg: 1, scope: !2086, file: !543, line: 19, type: !60)
!2088 = !DILocation(line: 0, scope: !2086)
!2089 = !DILocalVariable(name: "a", arg: 2, scope: !2086, file: !543, line: 19, type: !912)
!2090 = !DILocalVariable(name: "t", scope: !2086, file: !543, line: 24, type: !2091)
!2091 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !2092)
!2092 = !{!2093}
!2093 = !DISubrange(count: 8)
!2094 = !DILocation(line: 24, column: 11, scope: !2086)
!2095 = !DILocalVariable(name: "i", scope: !2086, file: !543, line: 21, type: !42)
!2096 = !DILocation(line: 28, column: 7, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2086, file: !543, line: 28, column: 3)
!2098 = !DILocation(line: 28, scope: !2097)
!2099 = !DILocation(line: 28, column: 12, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2097, file: !543, line: 28, column: 3)
!2101 = !DILocation(line: 28, column: 3, scope: !2097)
!2102 = !DILocation(line: 29, column: 5, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2104, file: !543, line: 29, column: 5)
!2104 = distinct !DILexicalBlock(scope: !2100, file: !543, line: 28, column: 28)
!2105 = !DILocation(line: 29, scope: !2103)
!2106 = !DILocalVariable(name: "j", scope: !2086, file: !543, line: 21, type: !42)
!2107 = !DILocation(line: 29, column: 14, scope: !2108)
!2108 = distinct !DILexicalBlock(scope: !2103, file: !543, line: 29, column: 5)
!2109 = !DILocation(line: 31, column: 23, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2108, file: !543, line: 29, column: 22)
!2111 = !DILocation(line: 31, column: 25, scope: !2110)
!2112 = !DILocation(line: 31, column: 12, scope: !2110)
!2113 = !DILocalVariable(name: "u", scope: !2086, file: !543, line: 22, type: !14)
!2114 = !DILocation(line: 32, column: 22, scope: !2110)
!2115 = !DILocation(line: 32, column: 9, scope: !2110)
!2116 = !DILocation(line: 34, column: 12, scope: !2110)
!2117 = !DILocalVariable(name: "d0", scope: !2086, file: !543, line: 23, type: !40)
!2118 = !DILocation(line: 36, column: 10, scope: !2110)
!2119 = !DILocation(line: 37, column: 10, scope: !2110)
!2120 = !DILocation(line: 38, column: 14, scope: !2110)
!2121 = !DILocation(line: 38, column: 7, scope: !2110)
!2122 = !DILocation(line: 38, column: 12, scope: !2110)
!2123 = !DILocation(line: 29, column: 18, scope: !2108)
!2124 = !DILocation(line: 29, column: 5, scope: !2108)
!2125 = distinct !{!2125, !2102, !2126, !185}
!2126 = !DILocation(line: 39, column: 5, scope: !2103)
!2127 = !DILocation(line: 41, column: 12, scope: !2104)
!2128 = !DILocation(line: 41, column: 20, scope: !2104)
!2129 = !DILocation(line: 41, column: 25, scope: !2104)
!2130 = !DILocation(line: 41, column: 17, scope: !2104)
!2131 = !DILocation(line: 41, column: 10, scope: !2104)
!2132 = !DILocation(line: 42, column: 12, scope: !2104)
!2133 = !DILocation(line: 42, column: 20, scope: !2104)
!2134 = !DILocation(line: 42, column: 25, scope: !2104)
!2135 = !DILocation(line: 42, column: 17, scope: !2104)
!2136 = !DILocation(line: 42, column: 5, scope: !2104)
!2137 = !DILocation(line: 42, column: 10, scope: !2104)
!2138 = !DILocation(line: 43, column: 12, scope: !2104)
!2139 = !DILocation(line: 43, column: 20, scope: !2104)
!2140 = !DILocation(line: 43, column: 25, scope: !2104)
!2141 = !DILocation(line: 43, column: 17, scope: !2104)
!2142 = !DILocation(line: 43, column: 5, scope: !2104)
!2143 = !DILocation(line: 43, column: 10, scope: !2104)
!2144 = !DILocation(line: 44, column: 12, scope: !2104)
!2145 = !DILocation(line: 44, column: 20, scope: !2104)
!2146 = !DILocation(line: 44, column: 25, scope: !2104)
!2147 = !DILocation(line: 44, column: 17, scope: !2104)
!2148 = !DILocation(line: 44, column: 5, scope: !2104)
!2149 = !DILocation(line: 44, column: 10, scope: !2104)
!2150 = !DILocation(line: 45, column: 7, scope: !2104)
!2151 = !DILocation(line: 28, column: 24, scope: !2100)
!2152 = !DILocation(line: 28, column: 3, scope: !2100)
!2153 = distinct !{!2153, !2101, !2154, !185}
!2154 = !DILocation(line: 46, column: 3, scope: !2097)
!2155 = !DILocation(line: 71, column: 1, scope: !2086)
!2156 = !DILocation(line: 0, scope: !1544)
!2157 = !DILocation(line: 88, column: 7, scope: !1550)
!2158 = !DILocation(line: 88, scope: !1550)
!2159 = !DILocation(line: 88, column: 12, scope: !1553)
!2160 = !DILocation(line: 88, column: 3, scope: !1550)
!2161 = !DILocation(line: 89, column: 37, scope: !1562)
!2162 = !DILocation(line: 89, column: 42, scope: !1562)
!2163 = !DILocation(line: 89, column: 26, scope: !1562)
!2164 = !DILocation(line: 89, column: 47, scope: !1562)
!2165 = !DILocation(line: 89, column: 57, scope: !1562)
!2166 = !DILocation(line: 89, column: 62, scope: !1562)
!2167 = !DILocation(line: 89, column: 24, scope: !1562)
!2168 = !DILocation(line: 89, column: 16, scope: !1562)
!2169 = !DILocation(line: 89, column: 5, scope: !1562)
!2170 = !DILocation(line: 89, column: 22, scope: !1562)
!2171 = !DILocation(line: 90, column: 37, scope: !1562)
!2172 = !DILocation(line: 90, column: 42, scope: !1562)
!2173 = !DILocation(line: 90, column: 26, scope: !1562)
!2174 = !DILocation(line: 90, column: 47, scope: !1562)
!2175 = !DILocation(line: 90, column: 57, scope: !1562)
!2176 = !DILocation(line: 90, column: 62, scope: !1562)
!2177 = !DILocation(line: 90, column: 24, scope: !1562)
!2178 = !DILocation(line: 90, column: 16, scope: !1562)
!2179 = !DILocation(line: 90, column: 18, scope: !1562)
!2180 = !DILocation(line: 90, column: 5, scope: !1562)
!2181 = !DILocation(line: 90, column: 22, scope: !1562)
!2182 = !DILocation(line: 91, column: 7, scope: !1562)
!2183 = !DILocation(line: 88, column: 24, scope: !1553)
!2184 = !DILocation(line: 88, column: 3, scope: !1553)
!2185 = distinct !{!2185, !2160, !2186, !185}
!2186 = !DILocation(line: 92, column: 3, scope: !1550)
!2187 = !DILocation(line: 113, column: 1, scope: !1544)
!2188 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !543, file: !543, line: 124, type: !1666, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2189 = !DILocalVariable(name: "r", arg: 1, scope: !2188, file: !543, line: 124, type: !60)
!2190 = !DILocation(line: 0, scope: !2188)
!2191 = !DILocalVariable(name: "a", arg: 2, scope: !2188, file: !543, line: 124, type: !912)
!2192 = !DILocalVariable(name: "i", scope: !2188, file: !543, line: 126, type: !42)
!2193 = !DILocation(line: 129, column: 7, scope: !2194)
!2194 = distinct !DILexicalBlock(scope: !2188, file: !543, line: 129, column: 3)
!2195 = !DILocation(line: 129, scope: !2194)
!2196 = !DILocation(line: 129, column: 12, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2194, file: !543, line: 129, column: 3)
!2198 = !DILocation(line: 129, column: 3, scope: !2194)
!2199 = !DILocation(line: 131, column: 22, scope: !2200)
!2200 = distinct !DILexicalBlock(scope: !2197, file: !543, line: 129, column: 28)
!2201 = !DILocation(line: 131, column: 11, scope: !2200)
!2202 = !DILocalVariable(name: "t0", scope: !2188, file: !543, line: 127, type: !35)
!2203 = !DILocation(line: 132, column: 31, scope: !2200)
!2204 = !DILocation(line: 132, column: 8, scope: !2200)
!2205 = !DILocation(line: 133, column: 21, scope: !2200)
!2206 = !DILocation(line: 133, column: 23, scope: !2200)
!2207 = !DILocation(line: 133, column: 10, scope: !2200)
!2208 = !DILocalVariable(name: "t1", scope: !2188, file: !543, line: 127, type: !35)
!2209 = !DILocation(line: 134, column: 31, scope: !2200)
!2210 = !DILocation(line: 134, column: 8, scope: !2200)
!2211 = !DILocation(line: 135, column: 16, scope: !2200)
!2212 = !DILocation(line: 135, column: 8, scope: !2200)
!2213 = !DILocation(line: 135, column: 5, scope: !2200)
!2214 = !DILocation(line: 135, column: 14, scope: !2200)
!2215 = !DILocation(line: 136, column: 20, scope: !2200)
!2216 = !DILocation(line: 136, column: 29, scope: !2200)
!2217 = !DILocation(line: 136, column: 32, scope: !2200)
!2218 = !DILocation(line: 136, column: 26, scope: !2200)
!2219 = !DILocation(line: 136, column: 8, scope: !2200)
!2220 = !DILocation(line: 136, column: 5, scope: !2200)
!2221 = !DILocation(line: 136, column: 14, scope: !2200)
!2222 = !DILocation(line: 137, column: 20, scope: !2200)
!2223 = !DILocation(line: 137, column: 16, scope: !2200)
!2224 = !DILocation(line: 137, column: 8, scope: !2200)
!2225 = !DILocation(line: 137, column: 5, scope: !2200)
!2226 = !DILocation(line: 137, column: 14, scope: !2200)
!2227 = !DILocation(line: 129, column: 24, scope: !2197)
!2228 = !DILocation(line: 129, column: 3, scope: !2197)
!2229 = distinct !{!2229, !2198, !2230, !185}
!2230 = !DILocation(line: 138, column: 3, scope: !2194)
!2231 = !DILocation(line: 139, column: 1, scope: !2188)
!2232 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !543, file: !543, line: 151, type: !1072, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2233 = !DILocalVariable(name: "r", arg: 1, scope: !2232, file: !543, line: 151, type: !546)
!2234 = !DILocation(line: 0, scope: !2232)
!2235 = !DILocalVariable(name: "a", arg: 2, scope: !2232, file: !543, line: 151, type: !64)
!2236 = !DILocalVariable(name: "i", scope: !2232, file: !543, line: 153, type: !42)
!2237 = !DILocation(line: 154, column: 7, scope: !2238)
!2238 = distinct !DILexicalBlock(scope: !2232, file: !543, line: 154, column: 3)
!2239 = !DILocation(line: 154, scope: !2238)
!2240 = !DILocation(line: 154, column: 12, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2238, file: !543, line: 154, column: 3)
!2242 = !DILocation(line: 154, column: 3, scope: !2238)
!2243 = !DILocation(line: 155, column: 29, scope: !2244)
!2244 = distinct !DILexicalBlock(scope: !2241, file: !543, line: 154, column: 28)
!2245 = !DILocation(line: 155, column: 26, scope: !2244)
!2246 = !DILocation(line: 155, column: 57, scope: !2244)
!2247 = !DILocation(line: 155, column: 54, scope: !2244)
!2248 = !DILocation(line: 155, column: 44, scope: !2244)
!2249 = !DILocation(line: 155, column: 63, scope: !2244)
!2250 = !DILocation(line: 155, column: 70, scope: !2244)
!2251 = !DILocation(line: 155, column: 16, scope: !2244)
!2252 = !DILocation(line: 155, column: 5, scope: !2244)
!2253 = !DILocation(line: 155, column: 22, scope: !2244)
!2254 = !DILocation(line: 156, column: 29, scope: !2244)
!2255 = !DILocation(line: 156, column: 26, scope: !2244)
!2256 = !DILocation(line: 156, column: 35, scope: !2244)
!2257 = !DILocation(line: 156, column: 57, scope: !2244)
!2258 = !DILocation(line: 156, column: 54, scope: !2244)
!2259 = !DILocation(line: 156, column: 44, scope: !2244)
!2260 = !DILocation(line: 156, column: 63, scope: !2244)
!2261 = !DILocation(line: 156, column: 41, scope: !2244)
!2262 = !DILocation(line: 156, column: 16, scope: !2244)
!2263 = !DILocation(line: 156, column: 18, scope: !2244)
!2264 = !DILocation(line: 156, column: 5, scope: !2244)
!2265 = !DILocation(line: 156, column: 22, scope: !2244)
!2266 = !DILocation(line: 154, column: 24, scope: !2241)
!2267 = !DILocation(line: 154, column: 3, scope: !2241)
!2268 = distinct !{!2268, !2242, !2269, !185}
!2269 = !DILocation(line: 157, column: 3, scope: !2238)
!2270 = !DILocation(line: 158, column: 1, scope: !2232)
!2271 = !DILocation(line: 0, scope: !1071)
!2272 = !DILocation(line: 176, column: 7, scope: !1079)
!2273 = !DILocation(line: 176, scope: !1079)
!2274 = !DILocation(line: 176, column: 12, scope: !1082)
!2275 = !DILocation(line: 176, column: 3, scope: !1079)
!2276 = !DILocation(line: 177, column: 5, scope: !1085)
!2277 = !DILocation(line: 177, scope: !1085)
!2278 = !DILocation(line: 177, column: 14, scope: !1090)
!2279 = !DILocation(line: 178, column: 18, scope: !1092)
!2280 = !DILocation(line: 178, column: 20, scope: !1092)
!2281 = !DILocation(line: 178, column: 7, scope: !1092)
!2282 = !DILocation(line: 178, column: 24, scope: !1092)
!2283 = !DILocation(line: 179, column: 27, scope: !1092)
!2284 = !DILocation(line: 179, column: 31, scope: !1092)
!2285 = !DILocation(line: 179, column: 53, scope: !1092)
!2286 = !DILocation(line: 0, scope: !1100, inlinedAt: !2287)
!2287 = distinct !DILocation(line: 179, column: 7, scope: !1092)
!2288 = !DILocation(line: 74, column: 15, scope: !1100, inlinedAt: !2287)
!2289 = !DILocation(line: 74, column: 11, scope: !1100, inlinedAt: !2287)
!2290 = !DILocation(line: 74, column: 6, scope: !1100, inlinedAt: !2287)
!2291 = !DILocation(line: 177, column: 18, scope: !1090)
!2292 = !DILocation(line: 177, column: 5, scope: !1090)
!2293 = distinct !{!2293, !2276, !2294, !185}
!2294 = !DILocation(line: 180, column: 5, scope: !1085)
!2295 = !DILocation(line: 176, column: 24, scope: !1082)
!2296 = !DILocation(line: 176, column: 3, scope: !1082)
!2297 = distinct !{!2297, !2275, !2298, !185}
!2298 = !DILocation(line: 181, column: 3, scope: !1079)
!2299 = !DILocation(line: 182, column: 1, scope: !1071)
!2300 = !DILocalVariable(name: "msg", arg: 1, scope: !1665, file: !543, line: 192, type: !60)
!2301 = !DILocation(line: 0, scope: !1665)
!2302 = !DILocalVariable(name: "a", arg: 2, scope: !1665, file: !543, line: 192, type: !912)
!2303 = !DILocation(line: 197, column: 7, scope: !1664)
!2304 = !DILocation(line: 197, scope: !1664)
!2305 = !DILocation(line: 197, column: 12, scope: !1687)
!2306 = !DILocation(line: 197, column: 3, scope: !1664)
!2307 = !DILocation(line: 198, column: 5, scope: !1689)
!2308 = !DILocation(line: 198, column: 12, scope: !1689)
!2309 = !DILocation(line: 199, column: 9, scope: !1693)
!2310 = !DILocation(line: 199, scope: !1693)
!2311 = !DILocation(line: 199, column: 14, scope: !1696)
!2312 = !DILocation(line: 199, column: 5, scope: !1693)
!2313 = !DILocation(line: 200, column: 23, scope: !1699)
!2314 = !DILocation(line: 200, column: 25, scope: !1699)
!2315 = !DILocation(line: 200, column: 12, scope: !1699)
!2316 = !DILocation(line: 205, column: 9, scope: !1699)
!2317 = !DILocation(line: 206, column: 9, scope: !1699)
!2318 = !DILocation(line: 207, column: 9, scope: !1699)
!2319 = !DILocation(line: 208, column: 19, scope: !1699)
!2320 = !DILocation(line: 208, column: 7, scope: !1699)
!2321 = !DILocation(line: 208, column: 14, scope: !1699)
!2322 = !DILocation(line: 199, column: 18, scope: !1696)
!2323 = !DILocation(line: 199, column: 5, scope: !1696)
!2324 = distinct !{!2324, !2312, !2325, !185}
!2325 = !DILocation(line: 209, column: 5, scope: !1693)
!2326 = !DILocation(line: 197, column: 24, scope: !1687)
!2327 = !DILocation(line: 197, column: 3, scope: !1687)
!2328 = distinct !{!2328, !2306, !2329, !185}
!2329 = !DILocation(line: 210, column: 3, scope: !1664)
!2330 = !DILocation(line: 211, column: 1, scope: !1665)
!2331 = !DILocation(line: 0, scope: !542)
!2332 = !DILocation(line: 227, column: 11, scope: !542)
!2333 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !2334)
!2334 = distinct !DILocation(line: 228, column: 3, scope: !542)
!2335 = !DILocation(line: 0, scope: !560, inlinedAt: !2334)
!2336 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !2334)
!2337 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !2334)
!2338 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !2334)
!2339 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !2340)
!2340 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !2341)
!2341 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !2334)
!2342 = !DILocation(line: 0, scope: !579, inlinedAt: !2341)
!2343 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !2341)
!2344 = !DILocation(line: 0, scope: !577, inlinedAt: !2340)
!2345 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !2340)
!2346 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !2340)
!2347 = !DILocation(line: 0, scope: !598, inlinedAt: !2348)
!2348 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !2341)
!2349 = !DILocation(line: 0, scope: !349, inlinedAt: !2350)
!2350 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !2348)
!2351 = !DILocation(line: 0, scope: !606, inlinedAt: !2352)
!2352 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !2341)
!2353 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !2352)
!2354 = !DILocation(line: 0, scope: !613, inlinedAt: !2355)
!2355 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !2352)
!2356 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !2355)
!2357 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !2355)
!2358 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !2355)
!2359 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !2355)
!2360 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !2355)
!2361 = !DILocation(line: 439, scope: !631, inlinedAt: !2355)
!2362 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !2355)
!2363 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !2355)
!2364 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !2355)
!2365 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !2355)
!2366 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !2355)
!2367 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !2355)
!2368 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !2355)
!2369 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !2355)
!2370 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !2355)
!2371 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !2355)
!2372 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !2355)
!2373 = distinct !{!2373, !2364, !2374, !185}
!2374 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !2355)
!2375 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !2355)
!2376 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !2355)
!2377 = distinct !{!2377, !2356, !2378, !185}
!2378 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !2355)
!2379 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !2352)
!2380 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !2352)
!2381 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !2341)
!2382 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !2334)
!2383 = !DILocation(line: 0, scope: !657, inlinedAt: !2384)
!2384 = distinct !DILocation(line: 229, column: 3, scope: !542)
!2385 = !DILocation(line: 113, column: 3, scope: !657, inlinedAt: !2384)
!2386 = !DILocation(line: 230, column: 1, scope: !542)
!2387 = !DILocation(line: 0, scope: !1196)
!2388 = !DILocation(line: 246, column: 11, scope: !1196)
!2389 = !DILocation(line: 47, column: 3, scope: !560, inlinedAt: !2390)
!2390 = distinct !DILocation(line: 247, column: 3, scope: !1196)
!2391 = !DILocation(line: 0, scope: !560, inlinedAt: !2390)
!2392 = !DILocation(line: 45, column: 11, scope: !560, inlinedAt: !2390)
!2393 = !DILocation(line: 48, column: 3, scope: !560, inlinedAt: !2390)
!2394 = !DILocation(line: 48, column: 26, scope: !560, inlinedAt: !2390)
!2395 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !2396)
!2396 = distinct !DILocation(line: 728, column: 3, scope: !579, inlinedAt: !2397)
!2397 = distinct !DILocation(line: 50, column: 3, scope: !560, inlinedAt: !2390)
!2398 = !DILocation(line: 0, scope: !579, inlinedAt: !2397)
!2399 = !DILocation(line: 726, column: 16, scope: !579, inlinedAt: !2397)
!2400 = !DILocation(line: 0, scope: !577, inlinedAt: !2396)
!2401 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !2396)
!2402 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !2396)
!2403 = !DILocation(line: 0, scope: !598, inlinedAt: !2404)
!2404 = distinct !DILocation(line: 730, column: 3, scope: !579, inlinedAt: !2397)
!2405 = !DILocation(line: 0, scope: !349, inlinedAt: !2406)
!2406 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !2404)
!2407 = !DILocation(line: 0, scope: !606, inlinedAt: !2408)
!2408 = distinct !DILocation(line: 733, column: 3, scope: !579, inlinedAt: !2397)
!2409 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !2408)
!2410 = !DILocation(line: 0, scope: !613, inlinedAt: !2411)
!2411 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !2408)
!2412 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !2411)
!2413 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !2411)
!2414 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !2411)
!2415 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !2411)
!2416 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !2411)
!2417 = !DILocation(line: 439, scope: !631, inlinedAt: !2411)
!2418 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !2411)
!2419 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !2411)
!2420 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !2411)
!2421 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !2411)
!2422 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !2411)
!2423 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !2411)
!2424 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !2411)
!2425 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !2411)
!2426 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !2411)
!2427 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !2411)
!2428 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !2411)
!2429 = distinct !{!2429, !2420, !2430, !185}
!2430 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !2411)
!2431 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !2411)
!2432 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !2411)
!2433 = distinct !{!2433, !2412, !2434, !185}
!2434 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !2411)
!2435 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !2408)
!2436 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !2408)
!2437 = !DILocation(line: 734, column: 1, scope: !579, inlinedAt: !2397)
!2438 = !DILocation(line: 51, column: 1, scope: !560, inlinedAt: !2390)
!2439 = !DILocation(line: 0, scope: !1256, inlinedAt: !2440)
!2440 = distinct !DILocation(line: 248, column: 3, scope: !1196)
!2441 = !DILocation(line: 124, column: 3, scope: !1256, inlinedAt: !2440)
!2442 = !DILocation(line: 249, column: 1, scope: !1196)
!2443 = !DILocation(line: 0, scope: !769)
!2444 = !DILocation(line: 263, column: 3, scope: !769)
!2445 = !DILocation(line: 0, scope: !776, inlinedAt: !2446)
!2446 = distinct !DILocation(line: 264, column: 3, scope: !769)
!2447 = !DILocation(line: 326, column: 7, scope: !781, inlinedAt: !2446)
!2448 = !DILocation(line: 326, scope: !781, inlinedAt: !2446)
!2449 = !DILocation(line: 326, column: 12, scope: !784, inlinedAt: !2446)
!2450 = !DILocation(line: 326, column: 3, scope: !781, inlinedAt: !2446)
!2451 = !DILocation(line: 327, column: 35, scope: !784, inlinedAt: !2446)
!2452 = !DILocation(line: 0, scope: !788, inlinedAt: !2453)
!2453 = distinct !DILocation(line: 327, column: 20, scope: !784, inlinedAt: !2446)
!2454 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2453)
!2455 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2453)
!2456 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2453)
!2457 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2453)
!2458 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2453)
!2459 = !DILocation(line: 327, column: 5, scope: !784, inlinedAt: !2446)
!2460 = !DILocation(line: 327, column: 18, scope: !784, inlinedAt: !2446)
!2461 = !DILocation(line: 326, column: 22, scope: !784, inlinedAt: !2446)
!2462 = !DILocation(line: 326, column: 3, scope: !784, inlinedAt: !2446)
!2463 = distinct !{!2463, !2450, !2464, !185}
!2464 = !DILocation(line: 327, column: 47, scope: !781, inlinedAt: !2446)
!2465 = !DILocation(line: 265, column: 1, scope: !769)
!2466 = !DILocation(line: 0, scope: !776)
!2467 = !DILocation(line: 326, column: 7, scope: !781)
!2468 = !DILocation(line: 326, scope: !781)
!2469 = !DILocation(line: 326, column: 12, scope: !784)
!2470 = !DILocation(line: 326, column: 3, scope: !781)
!2471 = !DILocation(line: 327, column: 35, scope: !784)
!2472 = !DILocation(line: 0, scope: !788, inlinedAt: !2473)
!2473 = distinct !DILocation(line: 327, column: 20, scope: !784)
!2474 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2473)
!2475 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2473)
!2476 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2473)
!2477 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2473)
!2478 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2473)
!2479 = !DILocation(line: 327, column: 5, scope: !784)
!2480 = !DILocation(line: 327, column: 18, scope: !784)
!2481 = !DILocation(line: 326, column: 22, scope: !784)
!2482 = !DILocation(line: 326, column: 3, scope: !784)
!2483 = distinct !{!2483, !2470, !2484, !185}
!2484 = !DILocation(line: 327, column: 47, scope: !781)
!2485 = !DILocation(line: 328, column: 1, scope: !776)
!2486 = !DILocation(line: 0, scope: !1386)
!2487 = !DILocation(line: 278, column: 3, scope: !1386)
!2488 = !DILocation(line: 279, column: 1, scope: !1386)
!2489 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !543, file: !543, line: 290, type: !910, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!2490 = !DILocalVariable(name: "r", arg: 1, scope: !2489, file: !543, line: 290, type: !546)
!2491 = !DILocation(line: 0, scope: !2489)
!2492 = !DILocalVariable(name: "a", arg: 2, scope: !2489, file: !543, line: 290, type: !912)
!2493 = !DILocalVariable(name: "b", arg: 3, scope: !2489, file: !543, line: 290, type: !912)
!2494 = !DILocalVariable(name: "i", scope: !2489, file: !543, line: 292, type: !42)
!2495 = !DILocation(line: 293, column: 7, scope: !2496)
!2496 = distinct !DILexicalBlock(scope: !2489, file: !543, line: 293, column: 3)
!2497 = !DILocation(line: 293, scope: !2496)
!2498 = !DILocation(line: 293, column: 12, scope: !2499)
!2499 = distinct !DILexicalBlock(scope: !2496, file: !543, line: 293, column: 3)
!2500 = !DILocation(line: 293, column: 3, scope: !2496)
!2501 = !DILocation(line: 294, column: 25, scope: !2502)
!2502 = distinct !DILexicalBlock(scope: !2499, file: !543, line: 293, column: 28)
!2503 = !DILocation(line: 294, column: 14, scope: !2502)
!2504 = !DILocation(line: 294, column: 42, scope: !2502)
!2505 = !DILocation(line: 294, column: 31, scope: !2502)
!2506 = !DILocation(line: 294, column: 59, scope: !2502)
!2507 = !DILocation(line: 294, column: 48, scope: !2502)
!2508 = !DILocation(line: 294, column: 72, scope: !2502)
!2509 = !DILocation(line: 294, column: 64, scope: !2502)
!2510 = !DILocation(line: 294, column: 5, scope: !2502)
!2511 = !DILocation(line: 295, column: 25, scope: !2502)
!2512 = !DILocation(line: 295, column: 27, scope: !2502)
!2513 = !DILocation(line: 295, column: 14, scope: !2502)
!2514 = !DILocation(line: 295, column: 44, scope: !2502)
!2515 = !DILocation(line: 295, column: 46, scope: !2502)
!2516 = !DILocation(line: 295, column: 33, scope: !2502)
!2517 = !DILocation(line: 295, column: 63, scope: !2502)
!2518 = !DILocation(line: 295, column: 65, scope: !2502)
!2519 = !DILocation(line: 295, column: 52, scope: !2502)
!2520 = !DILocation(line: 295, column: 79, scope: !2502)
!2521 = !DILocation(line: 295, column: 71, scope: !2502)
!2522 = !DILocation(line: 295, column: 70, scope: !2502)
!2523 = !DILocation(line: 295, column: 5, scope: !2502)
!2524 = !DILocation(line: 293, column: 24, scope: !2499)
!2525 = !DILocation(line: 293, column: 3, scope: !2499)
!2526 = distinct !{!2526, !2500, !2527, !185}
!2527 = !DILocation(line: 296, column: 3, scope: !2496)
!2528 = !DILocation(line: 297, column: 1, scope: !2489)
!2529 = !DILocation(line: 0, scope: !861)
!2530 = !DILocation(line: 311, column: 7, scope: !867)
!2531 = !DILocation(line: 311, scope: !867)
!2532 = !DILocation(line: 311, column: 12, scope: !870)
!2533 = !DILocation(line: 311, column: 3, scope: !867)
!2534 = !DILocation(line: 312, column: 47, scope: !870)
!2535 = !DILocation(line: 312, column: 38, scope: !870)
!2536 = !DILocation(line: 312, column: 59, scope: !870)
!2537 = !DILocation(line: 0, scope: !876, inlinedAt: !2538)
!2538 = distinct !DILocation(line: 312, column: 20, scope: !870)
!2539 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2538)
!2540 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2538)
!2541 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2538)
!2542 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2538)
!2543 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2538)
!2544 = !DILocation(line: 312, column: 5, scope: !870)
!2545 = !DILocation(line: 312, column: 18, scope: !870)
!2546 = !DILocation(line: 311, column: 22, scope: !870)
!2547 = !DILocation(line: 311, column: 3, scope: !870)
!2548 = distinct !{!2548, !2533, !2549, !185}
!2549 = !DILocation(line: 312, column: 61, scope: !867)
!2550 = !DILocation(line: 313, column: 1, scope: !861)
!2551 = !DILocation(line: 0, scope: !909)
!2552 = !DILocation(line: 342, column: 7, scope: !920)
!2553 = !DILocation(line: 342, scope: !920)
!2554 = !DILocation(line: 342, column: 12, scope: !923)
!2555 = !DILocation(line: 342, column: 3, scope: !920)
!2556 = !DILocation(line: 343, column: 20, scope: !923)
!2557 = !DILocation(line: 343, column: 35, scope: !923)
!2558 = !DILocation(line: 343, column: 33, scope: !923)
!2559 = !DILocation(line: 343, column: 5, scope: !923)
!2560 = !DILocation(line: 343, column: 18, scope: !923)
!2561 = !DILocation(line: 342, column: 22, scope: !923)
!2562 = !DILocation(line: 342, column: 3, scope: !923)
!2563 = distinct !{!2563, !2555, !2564, !185}
!2564 = !DILocation(line: 343, column: 46, scope: !920)
!2565 = !DILocation(line: 344, column: 1, scope: !909)
!2566 = !DILocation(line: 0, scope: !1637)
!2567 = !DILocation(line: 358, column: 7, scope: !1644)
!2568 = !DILocation(line: 358, scope: !1644)
!2569 = !DILocation(line: 358, column: 12, scope: !1647)
!2570 = !DILocation(line: 358, column: 3, scope: !1644)
!2571 = !DILocation(line: 359, column: 20, scope: !1647)
!2572 = !DILocation(line: 359, column: 35, scope: !1647)
!2573 = !DILocation(line: 359, column: 33, scope: !1647)
!2574 = !DILocation(line: 359, column: 5, scope: !1647)
!2575 = !DILocation(line: 359, column: 18, scope: !1647)
!2576 = !DILocation(line: 358, column: 22, scope: !1647)
!2577 = !DILocation(line: 358, column: 3, scope: !1647)
!2578 = distinct !{!2578, !2570, !2579, !185}
!2579 = !DILocation(line: 359, column: 46, scope: !1644)
!2580 = !DILocation(line: 360, column: 1, scope: !1637)
!2581 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !11, file: !11, line: 80, type: !2582, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2582 = !DISubroutineType(types: !2583)
!2583 = !{null, !464}
!2584 = !DILocalVariable(name: "r", arg: 1, scope: !2581, file: !11, line: 80, type: !464)
!2585 = !DILocation(line: 0, scope: !2581)
!2586 = !DILocalVariable(name: "k", scope: !2581, file: !11, line: 81, type: !42)
!2587 = !DILocalVariable(name: "len", scope: !2581, file: !11, line: 81, type: !42)
!2588 = !DILocation(line: 85, column: 7, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2581, file: !11, line: 85, column: 3)
!2590 = !DILocation(line: 85, scope: !2589)
!2591 = !DILocation(line: 84, column: 5, scope: !2581)
!2592 = !DILocation(line: 85, column: 22, scope: !2593)
!2593 = distinct !DILexicalBlock(scope: !2589, file: !11, line: 85, column: 3)
!2594 = !DILocation(line: 85, column: 3, scope: !2589)
!2595 = !DILocation(line: 86, column: 5, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2597, file: !11, line: 86, column: 5)
!2597 = distinct !DILexicalBlock(scope: !2593, file: !11, line: 85, column: 39)
!2598 = !DILocation(line: 86, scope: !2596)
!2599 = !DILocalVariable(name: "start", scope: !2581, file: !11, line: 81, type: !42)
!2600 = !DILocation(line: 86, column: 26, scope: !2601)
!2601 = distinct !DILexicalBlock(scope: !2596, file: !11, line: 86, column: 5)
!2602 = !DILocation(line: 87, column: 14, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2601, file: !11, line: 86, column: 50)
!2604 = !DILocalVariable(name: "zeta", scope: !2581, file: !11, line: 82, type: !14)
!2605 = !DILocalVariable(name: "j", scope: !2581, file: !11, line: 81, type: !42)
!2606 = !DILocation(line: 88, column: 11, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2603, file: !11, line: 88, column: 7)
!2608 = !DILocation(line: 88, scope: !2607)
!2609 = !DILocation(line: 88, column: 32, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2607, file: !11, line: 88, column: 7)
!2611 = !DILocation(line: 88, column: 24, scope: !2610)
!2612 = !DILocation(line: 88, column: 7, scope: !2607)
!2613 = !DILocation(line: 89, column: 25, scope: !2614)
!2614 = distinct !DILexicalBlock(scope: !2610, file: !11, line: 88, column: 44)
!2615 = !DILocalVariable(name: "a", arg: 1, scope: !2616, file: !11, line: 68, type: !14)
!2616 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !2617, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2617 = !DISubroutineType(types: !2618)
!2618 = !{!14, !14, !14}
!2619 = !DILocation(line: 0, scope: !2616, inlinedAt: !2620)
!2620 = distinct !DILocation(line: 89, column: 13, scope: !2614)
!2621 = !DILocalVariable(name: "b", arg: 2, scope: !2616, file: !11, line: 68, type: !14)
!2622 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2620)
!2623 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2620)
!2624 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2620)
!2625 = !DILocation(line: 0, scope: !876, inlinedAt: !2626)
!2626 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2620)
!2627 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2626)
!2628 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2626)
!2629 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2626)
!2630 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2626)
!2631 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2626)
!2632 = !DILocalVariable(name: "t", scope: !2581, file: !11, line: 82, type: !14)
!2633 = !DILocation(line: 90, column: 22, scope: !2614)
!2634 = !DILocation(line: 90, column: 27, scope: !2614)
!2635 = !DILocation(line: 90, column: 9, scope: !2614)
!2636 = !DILocation(line: 90, column: 20, scope: !2614)
!2637 = !DILocation(line: 91, column: 16, scope: !2614)
!2638 = !DILocation(line: 91, column: 21, scope: !2614)
!2639 = !DILocation(line: 91, column: 9, scope: !2614)
!2640 = !DILocation(line: 91, column: 14, scope: !2614)
!2641 = !DILocation(line: 88, column: 40, scope: !2610)
!2642 = !DILocation(line: 88, column: 7, scope: !2610)
!2643 = distinct !{!2643, !2612, !2644, !185}
!2644 = !DILocation(line: 92, column: 7, scope: !2607)
!2645 = !DILocation(line: 87, column: 21, scope: !2603)
!2646 = !DILocation(line: 86, column: 43, scope: !2601)
!2647 = !DILocation(line: 86, column: 5, scope: !2601)
!2648 = distinct !{!2648, !2595, !2649, !185}
!2649 = !DILocation(line: 93, column: 5, scope: !2596)
!2650 = !DILocation(line: 85, column: 32, scope: !2593)
!2651 = !DILocation(line: 85, column: 3, scope: !2593)
!2652 = distinct !{!2652, !2594, !2653, !185}
!2653 = !DILocation(line: 94, column: 3, scope: !2589)
!2654 = !DILocation(line: 95, column: 1, scope: !2581)
!2655 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !11, file: !11, line: 106, type: !2582, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2656 = !DILocalVariable(name: "r", arg: 1, scope: !2655, file: !11, line: 106, type: !464)
!2657 = !DILocation(line: 0, scope: !2655)
!2658 = !DILocalVariable(name: "f", scope: !2655, file: !11, line: 109, type: !13)
!2659 = !DILocalVariable(name: "k", scope: !2655, file: !11, line: 107, type: !42)
!2660 = !DILocalVariable(name: "len", scope: !2655, file: !11, line: 107, type: !42)
!2661 = !DILocation(line: 112, column: 7, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2655, file: !11, line: 112, column: 3)
!2663 = !DILocation(line: 112, scope: !2662)
!2664 = !DILocation(line: 111, column: 5, scope: !2655)
!2665 = !DILocation(line: 112, column: 20, scope: !2666)
!2666 = distinct !DILexicalBlock(scope: !2662, file: !11, line: 112, column: 3)
!2667 = !DILocation(line: 112, column: 3, scope: !2662)
!2668 = !DILocation(line: 113, column: 5, scope: !2669)
!2669 = distinct !DILexicalBlock(scope: !2670, file: !11, line: 113, column: 5)
!2670 = distinct !DILexicalBlock(scope: !2666, file: !11, line: 112, column: 39)
!2671 = !DILocation(line: 124, column: 3, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2655, file: !11, line: 124, column: 3)
!2673 = !DILocation(line: 113, scope: !2669)
!2674 = !DILocalVariable(name: "start", scope: !2655, file: !11, line: 107, type: !42)
!2675 = !DILocation(line: 113, column: 26, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2669, file: !11, line: 113, column: 5)
!2677 = !DILocation(line: 114, column: 14, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2676, file: !11, line: 113, column: 50)
!2679 = !DILocalVariable(name: "zeta", scope: !2655, file: !11, line: 108, type: !14)
!2680 = !DILocalVariable(name: "j", scope: !2655, file: !11, line: 107, type: !42)
!2681 = !DILocation(line: 115, column: 11, scope: !2682)
!2682 = distinct !DILexicalBlock(scope: !2678, file: !11, line: 115, column: 7)
!2683 = !DILocation(line: 115, scope: !2682)
!2684 = !DILocation(line: 115, column: 32, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2682, file: !11, line: 115, column: 7)
!2686 = !DILocation(line: 115, column: 24, scope: !2685)
!2687 = !DILocation(line: 115, column: 7, scope: !2682)
!2688 = !DILocation(line: 116, column: 13, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2685, file: !11, line: 115, column: 44)
!2690 = !DILocalVariable(name: "t", scope: !2655, file: !11, line: 108, type: !14)
!2691 = !DILocation(line: 117, column: 35, scope: !2689)
!2692 = !DILocation(line: 117, column: 33, scope: !2689)
!2693 = !DILocation(line: 0, scope: !788, inlinedAt: !2694)
!2694 = distinct !DILocation(line: 117, column: 16, scope: !2689)
!2695 = !DILocation(line: 39, column: 20, scope: !788, inlinedAt: !2694)
!2696 = !DILocation(line: 39, column: 19, scope: !788, inlinedAt: !2694)
!2697 = !DILocation(line: 39, column: 22, scope: !788, inlinedAt: !2694)
!2698 = !DILocation(line: 39, column: 33, scope: !788, inlinedAt: !2694)
!2699 = !DILocation(line: 41, column: 10, scope: !788, inlinedAt: !2694)
!2700 = !DILocation(line: 117, column: 9, scope: !2689)
!2701 = !DILocation(line: 117, column: 14, scope: !2689)
!2702 = !DILocation(line: 118, column: 22, scope: !2689)
!2703 = !DILocation(line: 118, column: 33, scope: !2689)
!2704 = !DILocation(line: 118, column: 9, scope: !2689)
!2705 = !DILocation(line: 118, column: 20, scope: !2689)
!2706 = !DILocation(line: 119, column: 34, scope: !2689)
!2707 = !DILocation(line: 0, scope: !2616, inlinedAt: !2708)
!2708 = distinct !DILocation(line: 119, column: 22, scope: !2689)
!2709 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2708)
!2710 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2708)
!2711 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2708)
!2712 = !DILocation(line: 0, scope: !876, inlinedAt: !2713)
!2713 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2708)
!2714 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2713)
!2715 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2713)
!2716 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2713)
!2717 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2713)
!2718 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2713)
!2719 = !DILocation(line: 119, column: 9, scope: !2689)
!2720 = !DILocation(line: 119, column: 20, scope: !2689)
!2721 = !DILocation(line: 115, column: 40, scope: !2685)
!2722 = !DILocation(line: 115, column: 7, scope: !2685)
!2723 = distinct !{!2723, !2687, !2724, !185}
!2724 = !DILocation(line: 120, column: 7, scope: !2682)
!2725 = !DILocation(line: 114, column: 21, scope: !2678)
!2726 = !DILocation(line: 113, column: 43, scope: !2676)
!2727 = !DILocation(line: 113, column: 5, scope: !2676)
!2728 = distinct !{!2728, !2668, !2729, !185}
!2729 = !DILocation(line: 121, column: 5, scope: !2669)
!2730 = !DILocation(line: 112, column: 32, scope: !2666)
!2731 = !DILocation(line: 112, column: 3, scope: !2666)
!2732 = distinct !{!2732, !2667, !2733, !185}
!2733 = !DILocation(line: 122, column: 3, scope: !2662)
!2734 = !DILocation(line: 124, scope: !2672)
!2735 = !DILocation(line: 124, column: 16, scope: !2736)
!2736 = distinct !DILexicalBlock(scope: !2672, file: !11, line: 124, column: 3)
!2737 = !DILocation(line: 125, column: 18, scope: !2736)
!2738 = !DILocation(line: 0, scope: !2616, inlinedAt: !2739)
!2739 = distinct !DILocation(line: 125, column: 12, scope: !2736)
!2740 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2739)
!2741 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2739)
!2742 = !DILocation(line: 0, scope: !876, inlinedAt: !2743)
!2743 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2739)
!2744 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2743)
!2745 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2743)
!2746 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2743)
!2747 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2743)
!2748 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2743)
!2749 = !DILocation(line: 125, column: 5, scope: !2736)
!2750 = !DILocation(line: 125, column: 10, scope: !2736)
!2751 = !DILocation(line: 124, column: 24, scope: !2736)
!2752 = !DILocation(line: 124, column: 3, scope: !2736)
!2753 = distinct !{!2753, !2671, !2754, !185}
!2754 = !DILocation(line: 125, column: 25, scope: !2672)
!2755 = !DILocation(line: 126, column: 1, scope: !2655)
!2756 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !11, file: !11, line: 139, type: !2757, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!2757 = !DISubroutineType(types: !2758)
!2758 = !{null, !464, !2759, !2759, !14}
!2759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!2760 = !DILocalVariable(name: "r", arg: 1, scope: !2756, file: !11, line: 139, type: !464)
!2761 = !DILocation(line: 0, scope: !2756)
!2762 = !DILocalVariable(name: "a", arg: 2, scope: !2756, file: !11, line: 139, type: !2759)
!2763 = !DILocalVariable(name: "b", arg: 3, scope: !2756, file: !11, line: 139, type: !2759)
!2764 = !DILocalVariable(name: "zeta", arg: 4, scope: !2756, file: !11, line: 139, type: !14)
!2765 = !DILocation(line: 141, column: 17, scope: !2756)
!2766 = !DILocation(line: 141, column: 23, scope: !2756)
!2767 = !DILocation(line: 0, scope: !2616, inlinedAt: !2768)
!2768 = distinct !DILocation(line: 141, column: 11, scope: !2756)
!2769 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2768)
!2770 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2768)
!2771 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2768)
!2772 = !DILocation(line: 0, scope: !876, inlinedAt: !2773)
!2773 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2768)
!2774 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2773)
!2775 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2773)
!2776 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2773)
!2777 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2773)
!2778 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2773)
!2779 = !DILocation(line: 141, column: 9, scope: !2756)
!2780 = !DILocation(line: 0, scope: !2616, inlinedAt: !2781)
!2781 = distinct !DILocation(line: 142, column: 11, scope: !2756)
!2782 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2781)
!2783 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2781)
!2784 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2781)
!2785 = !DILocation(line: 0, scope: !876, inlinedAt: !2786)
!2786 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2781)
!2787 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2786)
!2788 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2786)
!2789 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2786)
!2790 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2786)
!2791 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2786)
!2792 = !DILocation(line: 142, column: 9, scope: !2756)
!2793 = !DILocation(line: 143, column: 17, scope: !2756)
!2794 = !DILocation(line: 143, column: 23, scope: !2756)
!2795 = !DILocation(line: 0, scope: !2616, inlinedAt: !2796)
!2796 = distinct !DILocation(line: 143, column: 11, scope: !2756)
!2797 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2796)
!2798 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2796)
!2799 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2796)
!2800 = !DILocation(line: 0, scope: !876, inlinedAt: !2801)
!2801 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2796)
!2802 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2801)
!2803 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2801)
!2804 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2801)
!2805 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2801)
!2806 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2801)
!2807 = !DILocation(line: 143, column: 8, scope: !2756)
!2808 = !DILocation(line: 144, column: 17, scope: !2756)
!2809 = !DILocation(line: 144, column: 23, scope: !2756)
!2810 = !DILocation(line: 0, scope: !2616, inlinedAt: !2811)
!2811 = distinct !DILocation(line: 144, column: 11, scope: !2756)
!2812 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2811)
!2813 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2811)
!2814 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2811)
!2815 = !DILocation(line: 0, scope: !876, inlinedAt: !2816)
!2816 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2811)
!2817 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2816)
!2818 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2816)
!2819 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2816)
!2820 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2816)
!2821 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2816)
!2822 = !DILocation(line: 144, column: 3, scope: !2756)
!2823 = !DILocation(line: 144, column: 9, scope: !2756)
!2824 = !DILocation(line: 145, column: 17, scope: !2756)
!2825 = !DILocation(line: 145, column: 23, scope: !2756)
!2826 = !DILocation(line: 0, scope: !2616, inlinedAt: !2827)
!2827 = distinct !DILocation(line: 145, column: 11, scope: !2756)
!2828 = !DILocation(line: 69, column: 28, scope: !2616, inlinedAt: !2827)
!2829 = !DILocation(line: 69, column: 39, scope: !2616, inlinedAt: !2827)
!2830 = !DILocation(line: 69, column: 38, scope: !2616, inlinedAt: !2827)
!2831 = !DILocation(line: 0, scope: !876, inlinedAt: !2832)
!2832 = distinct !DILocation(line: 69, column: 10, scope: !2616, inlinedAt: !2827)
!2833 = !DILocation(line: 21, column: 12, scope: !876, inlinedAt: !2832)
!2834 = !DILocation(line: 21, column: 22, scope: !876, inlinedAt: !2832)
!2835 = !DILocation(line: 21, column: 10, scope: !876, inlinedAt: !2832)
!2836 = !DILocation(line: 21, column: 32, scope: !876, inlinedAt: !2832)
!2837 = !DILocation(line: 21, column: 7, scope: !876, inlinedAt: !2832)
!2838 = !DILocation(line: 145, column: 3, scope: !2756)
!2839 = !DILocation(line: 145, column: 8, scope: !2756)
!2840 = !DILocation(line: 146, column: 1, scope: !2756)
!2841 = !DILocation(line: 0, scope: !657)
!2842 = !DILocation(line: 113, column: 3, scope: !657)
!2843 = !DILocation(line: 119, column: 1, scope: !657)
!2844 = distinct !DISubprogram(name: "cbd2", scope: !658, file: !658, line: 58, type: !659, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2845 = !DILocalVariable(name: "r", arg: 1, scope: !2844, file: !658, line: 58, type: !661)
!2846 = !DILocation(line: 0, scope: !2844)
!2847 = !DILocalVariable(name: "buf", arg: 2, scope: !2844, file: !658, line: 58, type: !64)
!2848 = !DILocalVariable(name: "i", scope: !2844, file: !658, line: 60, type: !42)
!2849 = !DILocation(line: 64, column: 7, scope: !2850)
!2850 = distinct !DILexicalBlock(scope: !2844, file: !658, line: 64, column: 3)
!2851 = !DILocation(line: 64, scope: !2850)
!2852 = !DILocation(line: 64, column: 12, scope: !2853)
!2853 = distinct !DILexicalBlock(scope: !2850, file: !658, line: 64, column: 3)
!2854 = !DILocation(line: 64, column: 3, scope: !2850)
!2855 = !DILocation(line: 65, column: 35, scope: !2856)
!2856 = distinct !DILexicalBlock(scope: !2853, file: !658, line: 64, column: 28)
!2857 = !DILocation(line: 65, column: 33, scope: !2856)
!2858 = !DILocalVariable(name: "x", arg: 1, scope: !2859, file: !658, line: 15, type: !64)
!2859 = distinct !DISubprogram(name: "load32_littleendian", scope: !658, file: !658, line: 15, type: !2860, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!2860 = !DISubroutineType(types: !2861)
!2861 = !{!40, !64}
!2862 = !DILocation(line: 0, scope: !2859, inlinedAt: !2863)
!2863 = distinct !DILocation(line: 65, column: 10, scope: !2856)
!2864 = !DILocation(line: 18, column: 18, scope: !2859, inlinedAt: !2863)
!2865 = !DILocation(line: 18, column: 8, scope: !2859, inlinedAt: !2863)
!2866 = !DILocalVariable(name: "r", scope: !2859, file: !658, line: 17, type: !40)
!2867 = !DILocation(line: 19, column: 18, scope: !2859, inlinedAt: !2863)
!2868 = !DILocation(line: 19, column: 8, scope: !2859, inlinedAt: !2863)
!2869 = !DILocation(line: 19, column: 23, scope: !2859, inlinedAt: !2863)
!2870 = !DILocation(line: 19, column: 5, scope: !2859, inlinedAt: !2863)
!2871 = !DILocation(line: 20, column: 18, scope: !2859, inlinedAt: !2863)
!2872 = !DILocation(line: 20, column: 8, scope: !2859, inlinedAt: !2863)
!2873 = !DILocation(line: 20, column: 23, scope: !2859, inlinedAt: !2863)
!2874 = !DILocation(line: 20, column: 5, scope: !2859, inlinedAt: !2863)
!2875 = !DILocation(line: 21, column: 18, scope: !2859, inlinedAt: !2863)
!2876 = !DILocation(line: 21, column: 8, scope: !2859, inlinedAt: !2863)
!2877 = !DILocation(line: 21, column: 23, scope: !2859, inlinedAt: !2863)
!2878 = !DILocation(line: 21, column: 5, scope: !2859, inlinedAt: !2863)
!2879 = !DILocalVariable(name: "t", scope: !2844, file: !658, line: 61, type: !40)
!2880 = !DILocation(line: 66, column: 12, scope: !2856)
!2881 = !DILocalVariable(name: "d", scope: !2844, file: !658, line: 61, type: !40)
!2882 = !DILocation(line: 67, column: 12, scope: !2856)
!2883 = !DILocation(line: 67, column: 17, scope: !2856)
!2884 = !DILocation(line: 67, column: 7, scope: !2856)
!2885 = !DILocalVariable(name: "j", scope: !2844, file: !658, line: 60, type: !42)
!2886 = !DILocation(line: 69, column: 9, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2856, file: !658, line: 69, column: 5)
!2888 = !DILocation(line: 69, scope: !2887)
!2889 = !DILocation(line: 69, column: 14, scope: !2890)
!2890 = distinct !DILexicalBlock(scope: !2887, file: !658, line: 69, column: 5)
!2891 = !DILocation(line: 69, column: 5, scope: !2887)
!2892 = !DILocation(line: 70, column: 19, scope: !2893)
!2893 = distinct !DILexicalBlock(scope: !2890, file: !658, line: 69, column: 22)
!2894 = !DILocation(line: 70, column: 14, scope: !2893)
!2895 = !DILocation(line: 70, column: 11, scope: !2893)
!2896 = !DILocalVariable(name: "a", scope: !2844, file: !658, line: 62, type: !14)
!2897 = !DILocation(line: 71, column: 19, scope: !2893)
!2898 = !DILocation(line: 71, column: 21, scope: !2893)
!2899 = !DILocation(line: 71, column: 14, scope: !2893)
!2900 = !DILocation(line: 71, column: 11, scope: !2893)
!2901 = !DILocalVariable(name: "b", scope: !2844, file: !658, line: 62, type: !14)
!2902 = !DILocation(line: 72, column: 28, scope: !2893)
!2903 = !DILocation(line: 72, column: 26, scope: !2893)
!2904 = !DILocation(line: 72, column: 18, scope: !2893)
!2905 = !DILocation(line: 72, column: 20, scope: !2893)
!2906 = !DILocation(line: 72, column: 7, scope: !2893)
!2907 = !DILocation(line: 72, column: 24, scope: !2893)
!2908 = !DILocation(line: 69, column: 18, scope: !2890)
!2909 = !DILocation(line: 69, column: 5, scope: !2890)
!2910 = distinct !{!2910, !2891, !2911, !185}
!2911 = !DILocation(line: 73, column: 5, scope: !2887)
!2912 = !DILocation(line: 64, column: 24, scope: !2853)
!2913 = !DILocation(line: 64, column: 3, scope: !2853)
!2914 = distinct !{!2914, !2854, !2915, !185}
!2915 = !DILocation(line: 74, column: 3, scope: !2850)
!2916 = !DILocation(line: 75, column: 1, scope: !2844)
!2917 = !DILocation(line: 0, scope: !1256)
!2918 = !DILocation(line: 124, column: 3, scope: !1256)
!2919 = !DILocation(line: 128, column: 1, scope: !1256)
!2920 = !DILocation(line: 0, scope: !876)
!2921 = !DILocation(line: 21, column: 12, scope: !876)
!2922 = !DILocation(line: 21, column: 22, scope: !876)
!2923 = !DILocation(line: 21, column: 10, scope: !876)
!2924 = !DILocation(line: 21, column: 32, scope: !876)
!2925 = !DILocation(line: 21, column: 7, scope: !876)
!2926 = !DILocation(line: 22, column: 3, scope: !876)
!2927 = !DILocation(line: 0, scope: !788)
!2928 = !DILocation(line: 39, column: 20, scope: !788)
!2929 = !DILocation(line: 39, column: 19, scope: !788)
!2930 = !DILocation(line: 39, column: 22, scope: !788)
!2931 = !DILocation(line: 39, column: 33, scope: !788)
!2932 = !DILocation(line: 41, column: 10, scope: !788)
!2933 = !DILocation(line: 41, column: 3, scope: !788)
!2934 = !DILocation(line: 0, scope: !159)
!2935 = !DILocation(line: 21, column: 7, scope: !172)
!2936 = !DILocation(line: 21, scope: !172)
!2937 = !DILocation(line: 21, column: 12, scope: !175)
!2938 = !DILocation(line: 21, column: 3, scope: !172)
!2939 = !DILocation(line: 22, column: 10, scope: !175)
!2940 = !DILocation(line: 22, column: 17, scope: !175)
!2941 = !DILocation(line: 22, column: 15, scope: !175)
!2942 = !DILocation(line: 22, column: 7, scope: !175)
!2943 = !DILocation(line: 21, column: 18, scope: !175)
!2944 = !DILocation(line: 21, column: 3, scope: !175)
!2945 = distinct !{!2945, !2938, !2946, !185}
!2946 = !DILocation(line: 22, column: 20, scope: !172)
!2947 = !DILocation(line: 24, column: 25, scope: !159)
!2948 = !DILocation(line: 24, column: 10, scope: !159)
!2949 = !DILocation(line: 24, column: 3, scope: !159)
!2950 = !DILocation(line: 0, scope: !191)
!2951 = !DILocation(line: 51, column: 3, scope: !191)
!2952 = !DILocation(line: 54, column: 7, scope: !191)
!2953 = !DILocation(line: 55, column: 7, scope: !204)
!2954 = !DILocation(line: 55, scope: !204)
!2955 = !DILocation(line: 55, column: 12, scope: !207)
!2956 = !DILocation(line: 55, column: 3, scope: !204)
!2957 = !DILocation(line: 56, column: 18, scope: !207)
!2958 = !DILocation(line: 56, column: 25, scope: !207)
!2959 = !DILocation(line: 56, column: 23, scope: !207)
!2960 = !DILocation(line: 56, column: 15, scope: !207)
!2961 = !DILocation(line: 56, column: 5, scope: !207)
!2962 = !DILocation(line: 56, column: 10, scope: !207)
!2963 = !DILocation(line: 55, column: 18, scope: !207)
!2964 = !DILocation(line: 55, column: 3, scope: !207)
!2965 = distinct !{!2965, !2956, !2966, !185}
!2966 = !DILocation(line: 56, column: 29, scope: !204)
!2967 = !DILocation(line: 57, column: 1, scope: !191)
!2968 = !DILocation(line: 0, scope: !1100)
!2969 = !DILocation(line: 73, column: 7, scope: !1100)
!2970 = !DILocation(line: 74, column: 15, scope: !1100)
!2971 = !DILocation(line: 74, column: 19, scope: !1100)
!2972 = !DILocation(line: 74, column: 11, scope: !1100)
!2973 = !DILocation(line: 74, column: 6, scope: !1100)
!2974 = !DILocation(line: 75, column: 1, scope: !1100)
!2975 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !2976, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2976 = !DISubroutineType(types: !2977)
!2977 = !{null, !311}
!2978 = !DILocalVariable(name: "state", arg: 1, scope: !2975, file: !27, line: 523, type: !311)
!2979 = !DILocation(line: 0, scope: !2975)
!2980 = !DILocalVariable(name: "s", arg: 1, scope: !2981, file: !27, line: 353, type: !352)
!2981 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !2982, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2982 = !DISubroutineType(types: !2983)
!2983 = !{null, !352}
!2984 = !DILocation(line: 0, scope: !2981, inlinedAt: !2985)
!2985 = distinct !DILocation(line: 525, column: 3, scope: !2975)
!2986 = !DILocalVariable(name: "i", scope: !2981, file: !27, line: 355, type: !42)
!2987 = !DILocation(line: 356, column: 7, scope: !2988, inlinedAt: !2985)
!2988 = distinct !DILexicalBlock(scope: !2981, file: !27, line: 356, column: 3)
!2989 = !DILocation(line: 356, scope: !2988, inlinedAt: !2985)
!2990 = !DILocation(line: 356, column: 12, scope: !2991, inlinedAt: !2985)
!2991 = distinct !DILexicalBlock(scope: !2988, file: !27, line: 356, column: 3)
!2992 = !DILocation(line: 356, column: 3, scope: !2988, inlinedAt: !2985)
!2993 = !DILocation(line: 357, column: 5, scope: !2991, inlinedAt: !2985)
!2994 = !DILocation(line: 357, column: 10, scope: !2991, inlinedAt: !2985)
!2995 = !DILocation(line: 356, column: 17, scope: !2991, inlinedAt: !2985)
!2996 = !DILocation(line: 356, column: 3, scope: !2991, inlinedAt: !2985)
!2997 = distinct !{!2997, !2992, !2998, !185}
!2998 = !DILocation(line: 357, column: 12, scope: !2988, inlinedAt: !2985)
!2999 = !DILocation(line: 526, column: 10, scope: !2975)
!3000 = !DILocation(line: 526, column: 14, scope: !2975)
!3001 = !DILocation(line: 527, column: 1, scope: !2975)
!3002 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !309, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3003 = !DILocalVariable(name: "state", arg: 1, scope: !3002, file: !27, line: 538, type: !311)
!3004 = !DILocation(line: 0, scope: !3002)
!3005 = !DILocalVariable(name: "in", arg: 2, scope: !3002, file: !27, line: 538, type: !64)
!3006 = !DILocalVariable(name: "inlen", arg: 3, scope: !3002, file: !27, line: 538, type: !163)
!3007 = !DILocation(line: 540, column: 47, scope: !3002)
!3008 = !DILocation(line: 540, column: 16, scope: !3002)
!3009 = !DILocation(line: 540, column: 10, scope: !3002)
!3010 = !DILocation(line: 540, column: 14, scope: !3002)
!3011 = !DILocation(line: 541, column: 1, scope: !3002)
!3012 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !3013, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3013 = !DISubroutineType(types: !3014)
!3014 = !{!42, !352, !42, !42, !64, !163}
!3015 = !DILocalVariable(name: "s", arg: 1, scope: !3012, file: !27, line: 373, type: !352)
!3016 = !DILocation(line: 0, scope: !3012)
!3017 = !DILocalVariable(name: "pos", arg: 2, scope: !3012, file: !27, line: 374, type: !42)
!3018 = !DILocalVariable(name: "r", arg: 3, scope: !3012, file: !27, line: 375, type: !42)
!3019 = !DILocalVariable(name: "in", arg: 4, scope: !3012, file: !27, line: 376, type: !64)
!3020 = !DILocalVariable(name: "inlen", arg: 5, scope: !3012, file: !27, line: 377, type: !163)
!3021 = !DILocation(line: 381, column: 3, scope: !3012)
!3022 = !DILocation(line: 381, column: 12, scope: !3012)
!3023 = !DILocation(line: 381, column: 19, scope: !3012)
!3024 = !DILocation(line: 382, column: 5, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !3026, file: !27, line: 382, column: 5)
!3026 = distinct !DILexicalBlock(scope: !3012, file: !27, line: 381, column: 25)
!3027 = !DILocation(line: 389, column: 3, scope: !3028)
!3028 = distinct !DILexicalBlock(scope: !3012, file: !27, line: 389, column: 3)
!3029 = !DILocation(line: 382, scope: !3025)
!3030 = !DILocalVariable(name: "i", scope: !3012, file: !27, line: 379, type: !42)
!3031 = !DILocation(line: 382, column: 16, scope: !3032)
!3032 = distinct !DILexicalBlock(scope: !3025, file: !27, line: 382, column: 5)
!3033 = !DILocation(line: 383, column: 27, scope: !3032)
!3034 = !DILocation(line: 383, column: 17, scope: !3032)
!3035 = !DILocation(line: 383, column: 37, scope: !3032)
!3036 = !DILocation(line: 383, column: 33, scope: !3032)
!3037 = !DILocation(line: 383, column: 10, scope: !3032)
!3038 = !DILocation(line: 383, column: 7, scope: !3032)
!3039 = !DILocation(line: 383, column: 14, scope: !3032)
!3040 = !DILocation(line: 383, column: 30, scope: !3032)
!3041 = !DILocation(line: 382, column: 20, scope: !3032)
!3042 = !DILocation(line: 382, column: 5, scope: !3032)
!3043 = distinct !{!3043, !3024, !3044, !185}
!3044 = !DILocation(line: 383, column: 42, scope: !3025)
!3045 = !DILocation(line: 384, column: 15, scope: !3026)
!3046 = !DILocation(line: 384, column: 11, scope: !3026)
!3047 = !DILocation(line: 385, column: 5, scope: !3026)
!3048 = distinct !{!3048, !3021, !3049, !185}
!3049 = !DILocation(line: 387, column: 3, scope: !3012)
!3050 = !DILocation(line: 389, scope: !3028)
!3051 = !DILocation(line: 389, column: 18, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3028, file: !27, line: 389, column: 3)
!3053 = !DILocation(line: 389, column: 14, scope: !3052)
!3054 = !DILocation(line: 390, column: 25, scope: !3052)
!3055 = !DILocation(line: 390, column: 15, scope: !3052)
!3056 = !DILocation(line: 390, column: 35, scope: !3052)
!3057 = !DILocation(line: 390, column: 31, scope: !3052)
!3058 = !DILocation(line: 390, column: 8, scope: !3052)
!3059 = !DILocation(line: 390, column: 5, scope: !3052)
!3060 = !DILocation(line: 390, column: 12, scope: !3052)
!3061 = !DILocation(line: 390, column: 28, scope: !3052)
!3062 = !DILocation(line: 389, column: 26, scope: !3052)
!3063 = !DILocation(line: 389, column: 3, scope: !3052)
!3064 = distinct !{!3064, !3027, !3065, !185}
!3065 = !DILocation(line: 390, column: 40, scope: !3028)
!3066 = !DILocation(line: 392, column: 3, scope: !3012)
!3067 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !2982, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3068 = !DILocalVariable(name: "state", arg: 1, scope: !3067, file: !27, line: 82, type: !352)
!3069 = !DILocation(line: 0, scope: !3067)
!3070 = !DILocation(line: 100, column: 15, scope: !3067)
!3071 = !DILocalVariable(name: "Aba", scope: !3067, file: !27, line: 86, type: !23)
!3072 = !DILocation(line: 101, column: 15, scope: !3067)
!3073 = !DILocalVariable(name: "Abe", scope: !3067, file: !27, line: 86, type: !23)
!3074 = !DILocation(line: 102, column: 15, scope: !3067)
!3075 = !DILocalVariable(name: "Abi", scope: !3067, file: !27, line: 86, type: !23)
!3076 = !DILocation(line: 103, column: 15, scope: !3067)
!3077 = !DILocalVariable(name: "Abo", scope: !3067, file: !27, line: 86, type: !23)
!3078 = !DILocation(line: 104, column: 15, scope: !3067)
!3079 = !DILocalVariable(name: "Abu", scope: !3067, file: !27, line: 86, type: !23)
!3080 = !DILocation(line: 105, column: 15, scope: !3067)
!3081 = !DILocalVariable(name: "Aga", scope: !3067, file: !27, line: 87, type: !23)
!3082 = !DILocation(line: 106, column: 15, scope: !3067)
!3083 = !DILocalVariable(name: "Age", scope: !3067, file: !27, line: 87, type: !23)
!3084 = !DILocation(line: 107, column: 15, scope: !3067)
!3085 = !DILocalVariable(name: "Agi", scope: !3067, file: !27, line: 87, type: !23)
!3086 = !DILocation(line: 108, column: 15, scope: !3067)
!3087 = !DILocalVariable(name: "Ago", scope: !3067, file: !27, line: 87, type: !23)
!3088 = !DILocation(line: 109, column: 15, scope: !3067)
!3089 = !DILocalVariable(name: "Agu", scope: !3067, file: !27, line: 87, type: !23)
!3090 = !DILocation(line: 110, column: 15, scope: !3067)
!3091 = !DILocalVariable(name: "Aka", scope: !3067, file: !27, line: 88, type: !23)
!3092 = !DILocation(line: 111, column: 15, scope: !3067)
!3093 = !DILocalVariable(name: "Ake", scope: !3067, file: !27, line: 88, type: !23)
!3094 = !DILocation(line: 112, column: 15, scope: !3067)
!3095 = !DILocalVariable(name: "Aki", scope: !3067, file: !27, line: 88, type: !23)
!3096 = !DILocation(line: 113, column: 15, scope: !3067)
!3097 = !DILocalVariable(name: "Ako", scope: !3067, file: !27, line: 88, type: !23)
!3098 = !DILocation(line: 114, column: 15, scope: !3067)
!3099 = !DILocalVariable(name: "Aku", scope: !3067, file: !27, line: 88, type: !23)
!3100 = !DILocation(line: 115, column: 15, scope: !3067)
!3101 = !DILocalVariable(name: "Ama", scope: !3067, file: !27, line: 89, type: !23)
!3102 = !DILocation(line: 116, column: 15, scope: !3067)
!3103 = !DILocalVariable(name: "Ame", scope: !3067, file: !27, line: 89, type: !23)
!3104 = !DILocation(line: 117, column: 15, scope: !3067)
!3105 = !DILocalVariable(name: "Ami", scope: !3067, file: !27, line: 89, type: !23)
!3106 = !DILocation(line: 118, column: 15, scope: !3067)
!3107 = !DILocalVariable(name: "Amo", scope: !3067, file: !27, line: 89, type: !23)
!3108 = !DILocation(line: 119, column: 15, scope: !3067)
!3109 = !DILocalVariable(name: "Amu", scope: !3067, file: !27, line: 89, type: !23)
!3110 = !DILocation(line: 120, column: 15, scope: !3067)
!3111 = !DILocalVariable(name: "Asa", scope: !3067, file: !27, line: 90, type: !23)
!3112 = !DILocation(line: 121, column: 15, scope: !3067)
!3113 = !DILocalVariable(name: "Ase", scope: !3067, file: !27, line: 90, type: !23)
!3114 = !DILocation(line: 122, column: 15, scope: !3067)
!3115 = !DILocalVariable(name: "Asi", scope: !3067, file: !27, line: 90, type: !23)
!3116 = !DILocation(line: 123, column: 15, scope: !3067)
!3117 = !DILocalVariable(name: "Aso", scope: !3067, file: !27, line: 90, type: !23)
!3118 = !DILocation(line: 124, column: 15, scope: !3067)
!3119 = !DILocalVariable(name: "Asu", scope: !3067, file: !27, line: 90, type: !23)
!3120 = !DILocalVariable(name: "round", scope: !3067, file: !27, line: 84, type: !9)
!3121 = !DILocation(line: 126, column: 13, scope: !3122)
!3122 = distinct !DILexicalBlock(scope: !3067, file: !27, line: 126, column: 9)
!3123 = !DILocation(line: 126, scope: !3122)
!3124 = !DILocation(line: 126, column: 30, scope: !3125)
!3125 = distinct !DILexicalBlock(scope: !3122, file: !27, line: 126, column: 9)
!3126 = !DILocation(line: 126, column: 9, scope: !3122)
!3127 = !DILocalVariable(name: "BCa", scope: !3067, file: !27, line: 91, type: !23)
!3128 = !DILocalVariable(name: "BCe", scope: !3067, file: !27, line: 91, type: !23)
!3129 = !DILocalVariable(name: "BCi", scope: !3067, file: !27, line: 91, type: !23)
!3130 = !DILocalVariable(name: "BCo", scope: !3067, file: !27, line: 91, type: !23)
!3131 = !DILocalVariable(name: "BCu", scope: !3067, file: !27, line: 91, type: !23)
!3132 = !DILocalVariable(name: "Da", scope: !3067, file: !27, line: 92, type: !23)
!3133 = !DILocalVariable(name: "De", scope: !3067, file: !27, line: 92, type: !23)
!3134 = !DILocalVariable(name: "Di", scope: !3067, file: !27, line: 92, type: !23)
!3135 = !DILocalVariable(name: "Do", scope: !3067, file: !27, line: 92, type: !23)
!3136 = !DILocalVariable(name: "Du", scope: !3067, file: !27, line: 92, type: !23)
!3137 = !DILocalVariable(name: "Eba", scope: !3067, file: !27, line: 93, type: !23)
!3138 = !DILocalVariable(name: "Ebe", scope: !3067, file: !27, line: 93, type: !23)
!3139 = !DILocalVariable(name: "Ebi", scope: !3067, file: !27, line: 93, type: !23)
!3140 = !DILocalVariable(name: "Ebo", scope: !3067, file: !27, line: 93, type: !23)
!3141 = !DILocalVariable(name: "Ebu", scope: !3067, file: !27, line: 93, type: !23)
!3142 = !DILocalVariable(name: "Ega", scope: !3067, file: !27, line: 94, type: !23)
!3143 = !DILocalVariable(name: "Ege", scope: !3067, file: !27, line: 94, type: !23)
!3144 = !DILocalVariable(name: "Egi", scope: !3067, file: !27, line: 94, type: !23)
!3145 = !DILocalVariable(name: "Ego", scope: !3067, file: !27, line: 94, type: !23)
!3146 = !DILocalVariable(name: "Egu", scope: !3067, file: !27, line: 94, type: !23)
!3147 = !DILocalVariable(name: "Eka", scope: !3067, file: !27, line: 95, type: !23)
!3148 = !DILocalVariable(name: "Eke", scope: !3067, file: !27, line: 95, type: !23)
!3149 = !DILocalVariable(name: "Eki", scope: !3067, file: !27, line: 95, type: !23)
!3150 = !DILocalVariable(name: "Eko", scope: !3067, file: !27, line: 95, type: !23)
!3151 = !DILocalVariable(name: "Eku", scope: !3067, file: !27, line: 95, type: !23)
!3152 = !DILocalVariable(name: "Ema", scope: !3067, file: !27, line: 96, type: !23)
!3153 = !DILocalVariable(name: "Eme", scope: !3067, file: !27, line: 96, type: !23)
!3154 = !DILocalVariable(name: "Emi", scope: !3067, file: !27, line: 96, type: !23)
!3155 = !DILocalVariable(name: "Emo", scope: !3067, file: !27, line: 96, type: !23)
!3156 = !DILocalVariable(name: "Emu", scope: !3067, file: !27, line: 96, type: !23)
!3157 = !DILocalVariable(name: "Esa", scope: !3067, file: !27, line: 97, type: !23)
!3158 = !DILocalVariable(name: "Ese", scope: !3067, file: !27, line: 97, type: !23)
!3159 = !DILocalVariable(name: "Esi", scope: !3067, file: !27, line: 97, type: !23)
!3160 = !DILocalVariable(name: "Eso", scope: !3067, file: !27, line: 97, type: !23)
!3161 = !DILocalVariable(name: "Esu", scope: !3067, file: !27, line: 97, type: !23)
!3162 = !DILocation(line: 130, column: 22, scope: !3163)
!3163 = distinct !DILexicalBlock(scope: !3125, file: !27, line: 126, column: 53)
!3164 = !DILocation(line: 130, column: 26, scope: !3163)
!3165 = !DILocation(line: 130, column: 30, scope: !3163)
!3166 = !DILocation(line: 130, column: 34, scope: !3163)
!3167 = !DILocation(line: 132, column: 22, scope: !3163)
!3168 = !DILocation(line: 132, column: 26, scope: !3163)
!3169 = !DILocation(line: 132, column: 30, scope: !3163)
!3170 = !DILocation(line: 132, column: 34, scope: !3163)
!3171 = !DILocation(line: 138, column: 22, scope: !3163)
!3172 = !DILocation(line: 138, column: 21, scope: !3163)
!3173 = !DILocation(line: 208, column: 17, scope: !3163)
!3174 = !DILocation(line: 209, column: 19, scope: !3163)
!3175 = !DILocation(line: 129, column: 22, scope: !3163)
!3176 = !DILocation(line: 129, column: 26, scope: !3163)
!3177 = !DILocation(line: 129, column: 30, scope: !3163)
!3178 = !DILocation(line: 129, column: 34, scope: !3163)
!3179 = !DILocation(line: 135, column: 22, scope: !3163)
!3180 = !DILocation(line: 135, column: 21, scope: !3163)
!3181 = !DILocation(line: 212, column: 17, scope: !3163)
!3182 = !DILocation(line: 213, column: 19, scope: !3163)
!3183 = !DILocation(line: 131, column: 22, scope: !3163)
!3184 = !DILocation(line: 131, column: 26, scope: !3163)
!3185 = !DILocation(line: 131, column: 30, scope: !3163)
!3186 = !DILocation(line: 131, column: 34, scope: !3163)
!3187 = !DILocation(line: 128, column: 22, scope: !3163)
!3188 = !DILocation(line: 128, column: 26, scope: !3163)
!3189 = !DILocation(line: 128, column: 30, scope: !3163)
!3190 = !DILocation(line: 128, column: 34, scope: !3163)
!3191 = !DILocation(line: 139, column: 22, scope: !3163)
!3192 = !DILocation(line: 139, column: 21, scope: !3163)
!3193 = !DILocation(line: 210, column: 17, scope: !3163)
!3194 = !DILocation(line: 211, column: 19, scope: !3163)
!3195 = !DILocation(line: 217, column: 28, scope: !3163)
!3196 = !DILocation(line: 217, column: 33, scope: !3163)
!3197 = !DILocation(line: 217, column: 25, scope: !3163)
!3198 = !DILocation(line: 137, column: 22, scope: !3163)
!3199 = !DILocation(line: 137, column: 21, scope: !3163)
!3200 = !DILocation(line: 145, column: 17, scope: !3163)
!3201 = !DILocation(line: 146, column: 19, scope: !3163)
!3202 = !DILocation(line: 136, column: 22, scope: !3163)
!3203 = !DILocation(line: 136, column: 21, scope: !3163)
!3204 = !DILocation(line: 143, column: 17, scope: !3163)
!3205 = !DILocation(line: 144, column: 19, scope: !3163)
!3206 = !DILocation(line: 151, column: 28, scope: !3163)
!3207 = !DILocation(line: 151, column: 33, scope: !3163)
!3208 = !DILocation(line: 152, column: 30, scope: !3163)
!3209 = !DILocation(line: 152, column: 17, scope: !3163)
!3210 = !DILocation(line: 141, column: 17, scope: !3163)
!3211 = !DILocation(line: 158, column: 17, scope: !3163)
!3212 = !DILocation(line: 159, column: 19, scope: !3163)
!3213 = !DILocation(line: 162, column: 17, scope: !3163)
!3214 = !DILocation(line: 163, column: 19, scope: !3163)
!3215 = !DILocation(line: 160, column: 17, scope: !3163)
!3216 = !DILocation(line: 161, column: 19, scope: !3163)
!3217 = !DILocation(line: 168, column: 28, scope: !3163)
!3218 = !DILocation(line: 168, column: 33, scope: !3163)
!3219 = !DILocation(line: 168, column: 25, scope: !3163)
!3220 = !DILocation(line: 223, column: 22, scope: !3163)
!3221 = !DILocation(line: 174, column: 17, scope: !3163)
!3222 = !DILocation(line: 175, column: 19, scope: !3163)
!3223 = !DILocation(line: 178, column: 17, scope: !3163)
!3224 = !DILocation(line: 179, column: 19, scope: !3163)
!3225 = !DILocation(line: 176, column: 17, scope: !3163)
!3226 = !DILocation(line: 177, column: 19, scope: !3163)
!3227 = !DILocation(line: 184, column: 28, scope: !3163)
!3228 = !DILocation(line: 184, column: 33, scope: !3163)
!3229 = !DILocation(line: 184, column: 25, scope: !3163)
!3230 = !DILocation(line: 223, column: 26, scope: !3163)
!3231 = !DILocation(line: 190, column: 17, scope: !3163)
!3232 = !DILocation(line: 191, column: 19, scope: !3163)
!3233 = !DILocation(line: 194, column: 17, scope: !3163)
!3234 = !DILocation(line: 195, column: 19, scope: !3163)
!3235 = !DILocation(line: 192, column: 17, scope: !3163)
!3236 = !DILocation(line: 193, column: 19, scope: !3163)
!3237 = !DILocation(line: 200, column: 28, scope: !3163)
!3238 = !DILocation(line: 200, column: 33, scope: !3163)
!3239 = !DILocation(line: 200, column: 25, scope: !3163)
!3240 = !DILocation(line: 223, column: 30, scope: !3163)
!3241 = !DILocation(line: 206, column: 17, scope: !3163)
!3242 = !DILocation(line: 207, column: 19, scope: !3163)
!3243 = !DILocation(line: 216, column: 28, scope: !3163)
!3244 = !DILocation(line: 216, column: 33, scope: !3163)
!3245 = !DILocation(line: 216, column: 25, scope: !3163)
!3246 = !DILocation(line: 223, column: 34, scope: !3163)
!3247 = !DILocation(line: 149, column: 17, scope: !3163)
!3248 = !DILocation(line: 150, column: 19, scope: !3163)
!3249 = !DILocation(line: 147, column: 17, scope: !3163)
!3250 = !DILocation(line: 148, column: 19, scope: !3163)
!3251 = !DILocation(line: 154, column: 28, scope: !3163)
!3252 = !DILocation(line: 154, column: 33, scope: !3163)
!3253 = !DILocation(line: 154, column: 25, scope: !3163)
!3254 = !DILocation(line: 166, column: 17, scope: !3163)
!3255 = !DILocation(line: 167, column: 19, scope: !3163)
!3256 = !DILocation(line: 164, column: 17, scope: !3163)
!3257 = !DILocation(line: 165, column: 19, scope: !3163)
!3258 = !DILocation(line: 170, column: 28, scope: !3163)
!3259 = !DILocation(line: 170, column: 33, scope: !3163)
!3260 = !DILocation(line: 170, column: 25, scope: !3163)
!3261 = !DILocation(line: 225, column: 22, scope: !3163)
!3262 = !DILocation(line: 182, column: 17, scope: !3163)
!3263 = !DILocation(line: 183, column: 19, scope: !3163)
!3264 = !DILocation(line: 180, column: 17, scope: !3163)
!3265 = !DILocation(line: 181, column: 19, scope: !3163)
!3266 = !DILocation(line: 186, column: 28, scope: !3163)
!3267 = !DILocation(line: 186, column: 33, scope: !3163)
!3268 = !DILocation(line: 186, column: 25, scope: !3163)
!3269 = !DILocation(line: 225, column: 26, scope: !3163)
!3270 = !DILocation(line: 198, column: 17, scope: !3163)
!3271 = !DILocation(line: 199, column: 19, scope: !3163)
!3272 = !DILocation(line: 196, column: 17, scope: !3163)
!3273 = !DILocation(line: 197, column: 19, scope: !3163)
!3274 = !DILocation(line: 202, column: 28, scope: !3163)
!3275 = !DILocation(line: 202, column: 33, scope: !3163)
!3276 = !DILocation(line: 202, column: 25, scope: !3163)
!3277 = !DILocation(line: 225, column: 30, scope: !3163)
!3278 = !DILocation(line: 214, column: 17, scope: !3163)
!3279 = !DILocation(line: 215, column: 19, scope: !3163)
!3280 = !DILocation(line: 218, column: 28, scope: !3163)
!3281 = !DILocation(line: 218, column: 33, scope: !3163)
!3282 = !DILocation(line: 218, column: 25, scope: !3163)
!3283 = !DILocation(line: 225, column: 34, scope: !3163)
!3284 = !DILocation(line: 231, column: 22, scope: !3163)
!3285 = !DILocation(line: 231, column: 21, scope: !3163)
!3286 = !DILocation(line: 309, column: 17, scope: !3163)
!3287 = !DILocation(line: 310, column: 19, scope: !3163)
!3288 = !DILocation(line: 171, column: 28, scope: !3163)
!3289 = !DILocation(line: 171, column: 33, scope: !3163)
!3290 = !DILocation(line: 171, column: 25, scope: !3163)
!3291 = !DILocation(line: 156, column: 28, scope: !3163)
!3292 = !DILocation(line: 156, column: 33, scope: !3163)
!3293 = !DILocation(line: 156, column: 25, scope: !3163)
!3294 = !DILocation(line: 172, column: 28, scope: !3163)
!3295 = !DILocation(line: 172, column: 33, scope: !3163)
!3296 = !DILocation(line: 172, column: 25, scope: !3163)
!3297 = !DILocation(line: 227, column: 22, scope: !3163)
!3298 = !DILocation(line: 188, column: 28, scope: !3163)
!3299 = !DILocation(line: 188, column: 33, scope: !3163)
!3300 = !DILocation(line: 188, column: 25, scope: !3163)
!3301 = !DILocation(line: 227, column: 26, scope: !3163)
!3302 = !DILocation(line: 204, column: 28, scope: !3163)
!3303 = !DILocation(line: 204, column: 33, scope: !3163)
!3304 = !DILocation(line: 204, column: 25, scope: !3163)
!3305 = !DILocation(line: 227, column: 30, scope: !3163)
!3306 = !DILocation(line: 220, column: 28, scope: !3163)
!3307 = !DILocation(line: 220, column: 33, scope: !3163)
!3308 = !DILocation(line: 220, column: 25, scope: !3163)
!3309 = !DILocation(line: 227, column: 34, scope: !3163)
!3310 = !DILocation(line: 233, column: 22, scope: !3163)
!3311 = !DILocation(line: 233, column: 21, scope: !3163)
!3312 = !DILocation(line: 303, column: 17, scope: !3163)
!3313 = !DILocation(line: 304, column: 19, scope: !3163)
!3314 = !DILocation(line: 153, column: 28, scope: !3163)
!3315 = !DILocation(line: 153, column: 33, scope: !3163)
!3316 = !DILocation(line: 153, column: 25, scope: !3163)
!3317 = !DILocation(line: 169, column: 28, scope: !3163)
!3318 = !DILocation(line: 169, column: 33, scope: !3163)
!3319 = !DILocation(line: 169, column: 25, scope: !3163)
!3320 = !DILocation(line: 224, column: 22, scope: !3163)
!3321 = !DILocation(line: 185, column: 28, scope: !3163)
!3322 = !DILocation(line: 185, column: 33, scope: !3163)
!3323 = !DILocation(line: 185, column: 25, scope: !3163)
!3324 = !DILocation(line: 224, column: 26, scope: !3163)
!3325 = !DILocation(line: 201, column: 28, scope: !3163)
!3326 = !DILocation(line: 201, column: 33, scope: !3163)
!3327 = !DILocation(line: 201, column: 25, scope: !3163)
!3328 = !DILocation(line: 224, column: 30, scope: !3163)
!3329 = !DILocation(line: 224, column: 34, scope: !3163)
!3330 = !DILocation(line: 155, column: 28, scope: !3163)
!3331 = !DILocation(line: 155, column: 33, scope: !3163)
!3332 = !DILocation(line: 155, column: 25, scope: !3163)
!3333 = !DILocation(line: 226, column: 22, scope: !3163)
!3334 = !DILocation(line: 187, column: 28, scope: !3163)
!3335 = !DILocation(line: 187, column: 33, scope: !3163)
!3336 = !DILocation(line: 187, column: 25, scope: !3163)
!3337 = !DILocation(line: 226, column: 26, scope: !3163)
!3338 = !DILocation(line: 203, column: 28, scope: !3163)
!3339 = !DILocation(line: 203, column: 33, scope: !3163)
!3340 = !DILocation(line: 203, column: 25, scope: !3163)
!3341 = !DILocation(line: 226, column: 30, scope: !3163)
!3342 = !DILocation(line: 219, column: 28, scope: !3163)
!3343 = !DILocation(line: 219, column: 33, scope: !3163)
!3344 = !DILocation(line: 219, column: 25, scope: !3163)
!3345 = !DILocation(line: 226, column: 34, scope: !3163)
!3346 = !DILocation(line: 232, column: 22, scope: !3163)
!3347 = !DILocation(line: 232, column: 21, scope: !3163)
!3348 = !DILocation(line: 301, column: 17, scope: !3163)
!3349 = !DILocation(line: 302, column: 19, scope: !3163)
!3350 = !DILocation(line: 315, column: 28, scope: !3163)
!3351 = !DILocation(line: 315, column: 33, scope: !3163)
!3352 = !DILocation(line: 315, column: 25, scope: !3163)
!3353 = !DILocation(line: 230, column: 22, scope: !3163)
!3354 = !DILocation(line: 230, column: 21, scope: !3163)
!3355 = !DILocation(line: 307, column: 17, scope: !3163)
!3356 = !DILocation(line: 308, column: 19, scope: !3163)
!3357 = !DILocation(line: 314, column: 28, scope: !3163)
!3358 = !DILocation(line: 314, column: 33, scope: !3163)
!3359 = !DILocation(line: 314, column: 25, scope: !3163)
!3360 = !DILocation(line: 234, column: 22, scope: !3163)
!3361 = !DILocation(line: 234, column: 21, scope: !3163)
!3362 = !DILocation(line: 305, column: 17, scope: !3163)
!3363 = !DILocation(line: 306, column: 19, scope: !3163)
!3364 = !DILocation(line: 313, column: 28, scope: !3163)
!3365 = !DILocation(line: 313, column: 33, scope: !3163)
!3366 = !DILocation(line: 313, column: 25, scope: !3163)
!3367 = !DILocation(line: 312, column: 28, scope: !3163)
!3368 = !DILocation(line: 312, column: 33, scope: !3163)
!3369 = !DILocation(line: 312, column: 25, scope: !3163)
!3370 = !DILocation(line: 311, column: 28, scope: !3163)
!3371 = !DILocation(line: 311, column: 33, scope: !3163)
!3372 = !DILocation(line: 311, column: 25, scope: !3163)
!3373 = !DILocation(line: 293, column: 17, scope: !3163)
!3374 = !DILocation(line: 294, column: 19, scope: !3163)
!3375 = !DILocation(line: 287, column: 17, scope: !3163)
!3376 = !DILocation(line: 288, column: 19, scope: !3163)
!3377 = !DILocation(line: 285, column: 17, scope: !3163)
!3378 = !DILocation(line: 286, column: 19, scope: !3163)
!3379 = !DILocation(line: 299, column: 28, scope: !3163)
!3380 = !DILocation(line: 299, column: 33, scope: !3163)
!3381 = !DILocation(line: 299, column: 25, scope: !3163)
!3382 = !DILocation(line: 291, column: 17, scope: !3163)
!3383 = !DILocation(line: 292, column: 19, scope: !3163)
!3384 = !DILocation(line: 298, column: 28, scope: !3163)
!3385 = !DILocation(line: 298, column: 33, scope: !3163)
!3386 = !DILocation(line: 298, column: 25, scope: !3163)
!3387 = !DILocation(line: 289, column: 17, scope: !3163)
!3388 = !DILocation(line: 290, column: 19, scope: !3163)
!3389 = !DILocation(line: 297, column: 28, scope: !3163)
!3390 = !DILocation(line: 297, column: 33, scope: !3163)
!3391 = !DILocation(line: 297, column: 25, scope: !3163)
!3392 = !DILocation(line: 296, column: 28, scope: !3163)
!3393 = !DILocation(line: 296, column: 33, scope: !3163)
!3394 = !DILocation(line: 296, column: 25, scope: !3163)
!3395 = !DILocation(line: 295, column: 28, scope: !3163)
!3396 = !DILocation(line: 295, column: 33, scope: !3163)
!3397 = !DILocation(line: 295, column: 25, scope: !3163)
!3398 = !DILocation(line: 277, column: 17, scope: !3163)
!3399 = !DILocation(line: 278, column: 19, scope: !3163)
!3400 = !DILocation(line: 271, column: 17, scope: !3163)
!3401 = !DILocation(line: 272, column: 19, scope: !3163)
!3402 = !DILocation(line: 269, column: 17, scope: !3163)
!3403 = !DILocation(line: 270, column: 19, scope: !3163)
!3404 = !DILocation(line: 283, column: 28, scope: !3163)
!3405 = !DILocation(line: 283, column: 33, scope: !3163)
!3406 = !DILocation(line: 283, column: 25, scope: !3163)
!3407 = !DILocation(line: 275, column: 17, scope: !3163)
!3408 = !DILocation(line: 276, column: 19, scope: !3163)
!3409 = !DILocation(line: 282, column: 28, scope: !3163)
!3410 = !DILocation(line: 282, column: 33, scope: !3163)
!3411 = !DILocation(line: 282, column: 25, scope: !3163)
!3412 = !DILocation(line: 273, column: 17, scope: !3163)
!3413 = !DILocation(line: 274, column: 19, scope: !3163)
!3414 = !DILocation(line: 281, column: 28, scope: !3163)
!3415 = !DILocation(line: 281, column: 33, scope: !3163)
!3416 = !DILocation(line: 281, column: 25, scope: !3163)
!3417 = !DILocation(line: 280, column: 28, scope: !3163)
!3418 = !DILocation(line: 280, column: 33, scope: !3163)
!3419 = !DILocation(line: 280, column: 25, scope: !3163)
!3420 = !DILocation(line: 279, column: 28, scope: !3163)
!3421 = !DILocation(line: 279, column: 33, scope: !3163)
!3422 = !DILocation(line: 279, column: 25, scope: !3163)
!3423 = !DILocation(line: 261, column: 17, scope: !3163)
!3424 = !DILocation(line: 262, column: 19, scope: !3163)
!3425 = !DILocation(line: 255, column: 17, scope: !3163)
!3426 = !DILocation(line: 256, column: 19, scope: !3163)
!3427 = !DILocation(line: 253, column: 17, scope: !3163)
!3428 = !DILocation(line: 254, column: 19, scope: !3163)
!3429 = !DILocation(line: 267, column: 28, scope: !3163)
!3430 = !DILocation(line: 267, column: 33, scope: !3163)
!3431 = !DILocation(line: 267, column: 25, scope: !3163)
!3432 = !DILocation(line: 259, column: 17, scope: !3163)
!3433 = !DILocation(line: 260, column: 19, scope: !3163)
!3434 = !DILocation(line: 266, column: 28, scope: !3163)
!3435 = !DILocation(line: 266, column: 33, scope: !3163)
!3436 = !DILocation(line: 266, column: 25, scope: !3163)
!3437 = !DILocation(line: 257, column: 17, scope: !3163)
!3438 = !DILocation(line: 258, column: 19, scope: !3163)
!3439 = !DILocation(line: 265, column: 28, scope: !3163)
!3440 = !DILocation(line: 265, column: 33, scope: !3163)
!3441 = !DILocation(line: 265, column: 25, scope: !3163)
!3442 = !DILocation(line: 264, column: 28, scope: !3163)
!3443 = !DILocation(line: 264, column: 33, scope: !3163)
!3444 = !DILocation(line: 264, column: 25, scope: !3163)
!3445 = !DILocation(line: 263, column: 28, scope: !3163)
!3446 = !DILocation(line: 263, column: 33, scope: !3163)
!3447 = !DILocation(line: 263, column: 25, scope: !3163)
!3448 = !DILocation(line: 244, column: 17, scope: !3163)
!3449 = !DILocation(line: 245, column: 19, scope: !3163)
!3450 = !DILocation(line: 238, column: 17, scope: !3163)
!3451 = !DILocation(line: 239, column: 19, scope: !3163)
!3452 = !DILocation(line: 236, column: 17, scope: !3163)
!3453 = !DILocation(line: 251, column: 28, scope: !3163)
!3454 = !DILocation(line: 251, column: 33, scope: !3163)
!3455 = !DILocation(line: 251, column: 25, scope: !3163)
!3456 = !DILocation(line: 242, column: 17, scope: !3163)
!3457 = !DILocation(line: 243, column: 19, scope: !3163)
!3458 = !DILocation(line: 250, column: 28, scope: !3163)
!3459 = !DILocation(line: 250, column: 33, scope: !3163)
!3460 = !DILocation(line: 250, column: 25, scope: !3163)
!3461 = !DILocation(line: 240, column: 17, scope: !3163)
!3462 = !DILocation(line: 241, column: 19, scope: !3163)
!3463 = !DILocation(line: 249, column: 28, scope: !3163)
!3464 = !DILocation(line: 249, column: 33, scope: !3163)
!3465 = !DILocation(line: 249, column: 25, scope: !3163)
!3466 = !DILocation(line: 248, column: 28, scope: !3163)
!3467 = !DILocation(line: 248, column: 33, scope: !3163)
!3468 = !DILocation(line: 248, column: 25, scope: !3163)
!3469 = !DILocation(line: 247, column: 58, scope: !3163)
!3470 = !DILocation(line: 247, column: 30, scope: !3163)
!3471 = !DILocation(line: 246, column: 28, scope: !3163)
!3472 = !DILocation(line: 246, column: 33, scope: !3163)
!3473 = !DILocation(line: 247, column: 17, scope: !3163)
!3474 = !DILocation(line: 126, column: 47, scope: !3125)
!3475 = !DILocation(line: 126, column: 9, scope: !3125)
!3476 = distinct !{!3476, !3126, !3477, !185}
!3477 = !DILocation(line: 316, column: 9, scope: !3122)
!3478 = !DILocation(line: 319, column: 19, scope: !3067)
!3479 = !DILocation(line: 320, column: 9, scope: !3067)
!3480 = !DILocation(line: 320, column: 19, scope: !3067)
!3481 = !DILocation(line: 321, column: 9, scope: !3067)
!3482 = !DILocation(line: 321, column: 19, scope: !3067)
!3483 = !DILocation(line: 322, column: 9, scope: !3067)
!3484 = !DILocation(line: 322, column: 19, scope: !3067)
!3485 = !DILocation(line: 323, column: 9, scope: !3067)
!3486 = !DILocation(line: 323, column: 19, scope: !3067)
!3487 = !DILocation(line: 324, column: 9, scope: !3067)
!3488 = !DILocation(line: 324, column: 19, scope: !3067)
!3489 = !DILocation(line: 325, column: 9, scope: !3067)
!3490 = !DILocation(line: 325, column: 19, scope: !3067)
!3491 = !DILocation(line: 326, column: 9, scope: !3067)
!3492 = !DILocation(line: 326, column: 19, scope: !3067)
!3493 = !DILocation(line: 327, column: 9, scope: !3067)
!3494 = !DILocation(line: 327, column: 19, scope: !3067)
!3495 = !DILocation(line: 328, column: 9, scope: !3067)
!3496 = !DILocation(line: 328, column: 19, scope: !3067)
!3497 = !DILocation(line: 329, column: 9, scope: !3067)
!3498 = !DILocation(line: 329, column: 19, scope: !3067)
!3499 = !DILocation(line: 330, column: 9, scope: !3067)
!3500 = !DILocation(line: 330, column: 19, scope: !3067)
!3501 = !DILocation(line: 331, column: 9, scope: !3067)
!3502 = !DILocation(line: 331, column: 19, scope: !3067)
!3503 = !DILocation(line: 332, column: 9, scope: !3067)
!3504 = !DILocation(line: 332, column: 19, scope: !3067)
!3505 = !DILocation(line: 333, column: 9, scope: !3067)
!3506 = !DILocation(line: 333, column: 19, scope: !3067)
!3507 = !DILocation(line: 334, column: 9, scope: !3067)
!3508 = !DILocation(line: 334, column: 19, scope: !3067)
!3509 = !DILocation(line: 335, column: 9, scope: !3067)
!3510 = !DILocation(line: 335, column: 19, scope: !3067)
!3511 = !DILocation(line: 336, column: 9, scope: !3067)
!3512 = !DILocation(line: 336, column: 19, scope: !3067)
!3513 = !DILocation(line: 337, column: 9, scope: !3067)
!3514 = !DILocation(line: 337, column: 19, scope: !3067)
!3515 = !DILocation(line: 338, column: 9, scope: !3067)
!3516 = !DILocation(line: 338, column: 19, scope: !3067)
!3517 = !DILocation(line: 339, column: 9, scope: !3067)
!3518 = !DILocation(line: 339, column: 19, scope: !3067)
!3519 = !DILocation(line: 340, column: 9, scope: !3067)
!3520 = !DILocation(line: 340, column: 19, scope: !3067)
!3521 = !DILocation(line: 341, column: 9, scope: !3067)
!3522 = !DILocation(line: 341, column: 19, scope: !3067)
!3523 = !DILocation(line: 342, column: 9, scope: !3067)
!3524 = !DILocation(line: 342, column: 19, scope: !3067)
!3525 = !DILocation(line: 343, column: 9, scope: !3067)
!3526 = !DILocation(line: 343, column: 19, scope: !3067)
!3527 = !DILocation(line: 344, column: 1, scope: !3067)
!3528 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !2976, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3529 = !DILocalVariable(name: "state", arg: 1, scope: !3528, file: !27, line: 550, type: !311)
!3530 = !DILocation(line: 0, scope: !3528)
!3531 = !DILocation(line: 552, column: 36, scope: !3528)
!3532 = !DILocalVariable(name: "s", arg: 1, scope: !3533, file: !27, line: 405, type: !352)
!3533 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !3534, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3534 = !DISubroutineType(types: !3535)
!3535 = !{null, !352, !42, !42, !61}
!3536 = !DILocation(line: 0, scope: !3533, inlinedAt: !3537)
!3537 = distinct !DILocation(line: 552, column: 3, scope: !3528)
!3538 = !DILocalVariable(name: "pos", arg: 2, scope: !3533, file: !27, line: 405, type: !42)
!3539 = !DILocalVariable(name: "r", arg: 3, scope: !3533, file: !27, line: 405, type: !42)
!3540 = !DILocalVariable(name: "p", arg: 4, scope: !3533, file: !27, line: 405, type: !61)
!3541 = !DILocation(line: 407, column: 31, scope: !3533, inlinedAt: !3537)
!3542 = !DILocation(line: 407, column: 27, scope: !3533, inlinedAt: !3537)
!3543 = !DILocation(line: 407, column: 8, scope: !3533, inlinedAt: !3537)
!3544 = !DILocation(line: 407, column: 3, scope: !3533, inlinedAt: !3537)
!3545 = !DILocation(line: 407, column: 12, scope: !3533, inlinedAt: !3537)
!3546 = !DILocation(line: 408, column: 3, scope: !3533, inlinedAt: !3537)
!3547 = !DILocation(line: 408, column: 12, scope: !3533, inlinedAt: !3537)
!3548 = !DILocation(line: 553, column: 10, scope: !3528)
!3549 = !DILocation(line: 553, column: 14, scope: !3528)
!3550 = !DILocation(line: 554, column: 1, scope: !3528)
!3551 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !342, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3552 = !DILocalVariable(name: "out", arg: 1, scope: !3551, file: !27, line: 566, type: !60)
!3553 = !DILocation(line: 0, scope: !3551)
!3554 = !DILocalVariable(name: "outlen", arg: 2, scope: !3551, file: !27, line: 566, type: !163)
!3555 = !DILocalVariable(name: "state", arg: 3, scope: !3551, file: !27, line: 566, type: !311)
!3556 = !DILocation(line: 568, column: 61, scope: !3551)
!3557 = !DILocation(line: 0, scope: !613, inlinedAt: !3558)
!3558 = distinct !DILocation(line: 568, column: 16, scope: !3551)
!3559 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3558)
!3560 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3558)
!3561 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3558)
!3562 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3558)
!3563 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3558)
!3564 = !DILocation(line: 439, scope: !631, inlinedAt: !3558)
!3565 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3558)
!3566 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3558)
!3567 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3558)
!3568 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3558)
!3569 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3558)
!3570 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3558)
!3571 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3558)
!3572 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3558)
!3573 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3558)
!3574 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3558)
!3575 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3558)
!3576 = distinct !{!3576, !3567, !3577, !185}
!3577 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3558)
!3578 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3558)
!3579 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3558)
!3580 = distinct !{!3580, !3559, !3581, !185}
!3581 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3558)
!3582 = !DILocation(line: 568, column: 10, scope: !3551)
!3583 = !DILocation(line: 568, column: 14, scope: !3551)
!3584 = !DILocation(line: 569, column: 1, scope: !3551)
!3585 = !DILocation(line: 0, scope: !308)
!3586 = !DILocation(line: 582, column: 3, scope: !308)
!3587 = !DILocation(line: 583, column: 10, scope: !308)
!3588 = !DILocation(line: 583, column: 14, scope: !308)
!3589 = !DILocation(line: 584, column: 1, scope: !308)
!3590 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !3591, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3591 = !DISubroutineType(types: !3592)
!3592 = !{null, !352, !42, !64, !163, !61}
!3593 = !DILocalVariable(name: "s", arg: 1, scope: !3590, file: !27, line: 461, type: !352)
!3594 = !DILocation(line: 0, scope: !3590)
!3595 = !DILocalVariable(name: "r", arg: 2, scope: !3590, file: !27, line: 462, type: !42)
!3596 = !DILocalVariable(name: "in", arg: 3, scope: !3590, file: !27, line: 463, type: !64)
!3597 = !DILocalVariable(name: "inlen", arg: 4, scope: !3590, file: !27, line: 464, type: !163)
!3598 = !DILocalVariable(name: "p", arg: 5, scope: !3590, file: !27, line: 465, type: !61)
!3599 = !DILocalVariable(name: "i", scope: !3590, file: !27, line: 467, type: !42)
!3600 = !DILocation(line: 469, column: 7, scope: !3601)
!3601 = distinct !DILexicalBlock(scope: !3590, file: !27, line: 469, column: 3)
!3602 = !DILocation(line: 469, scope: !3601)
!3603 = !DILocation(line: 469, column: 12, scope: !3604)
!3604 = distinct !DILexicalBlock(scope: !3601, file: !27, line: 469, column: 3)
!3605 = !DILocation(line: 469, column: 3, scope: !3601)
!3606 = !DILocation(line: 472, column: 3, scope: !3590)
!3607 = !DILocation(line: 470, column: 5, scope: !3604)
!3608 = !DILocation(line: 470, column: 10, scope: !3604)
!3609 = !DILocation(line: 469, column: 17, scope: !3604)
!3610 = !DILocation(line: 469, column: 3, scope: !3604)
!3611 = distinct !{!3611, !3605, !3612, !185}
!3612 = !DILocation(line: 470, column: 12, scope: !3601)
!3613 = !DILocation(line: 472, column: 15, scope: !3590)
!3614 = !DILocation(line: 473, column: 5, scope: !3615)
!3615 = distinct !DILexicalBlock(scope: !3616, file: !27, line: 473, column: 5)
!3616 = distinct !DILexicalBlock(scope: !3590, file: !27, line: 472, column: 21)
!3617 = !DILocation(line: 480, column: 3, scope: !3618)
!3618 = distinct !DILexicalBlock(scope: !3590, file: !27, line: 480, column: 3)
!3619 = !DILocation(line: 473, scope: !3615)
!3620 = !DILocation(line: 473, column: 14, scope: !3621)
!3621 = distinct !DILexicalBlock(scope: !3615, file: !27, line: 473, column: 5)
!3622 = !DILocation(line: 474, column: 26, scope: !3621)
!3623 = !DILocation(line: 474, column: 24, scope: !3621)
!3624 = !DILocalVariable(name: "x", arg: 1, scope: !3625, file: !27, line: 22, type: !64)
!3625 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !3626, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3626 = !DISubroutineType(types: !3627)
!3627 = !{!23, !64}
!3628 = !DILocation(line: 0, scope: !3625, inlinedAt: !3629)
!3629 = distinct !DILocation(line: 474, column: 15, scope: !3621)
!3630 = !DILocalVariable(name: "r", scope: !3625, file: !27, line: 24, type: !23)
!3631 = !DILocalVariable(name: "i", scope: !3625, file: !27, line: 23, type: !42)
!3632 = !DILocation(line: 26, column: 7, scope: !3633, inlinedAt: !3629)
!3633 = distinct !DILexicalBlock(scope: !3625, file: !27, line: 26, column: 3)
!3634 = !DILocation(line: 26, scope: !3633, inlinedAt: !3629)
!3635 = !DILocation(line: 26, column: 12, scope: !3636, inlinedAt: !3629)
!3636 = distinct !DILexicalBlock(scope: !3633, file: !27, line: 26, column: 3)
!3637 = !DILocation(line: 26, column: 3, scope: !3633, inlinedAt: !3629)
!3638 = !DILocation(line: 27, column: 20, scope: !3636, inlinedAt: !3629)
!3639 = !DILocation(line: 27, column: 10, scope: !3636, inlinedAt: !3629)
!3640 = !DILocation(line: 27, column: 29, scope: !3636, inlinedAt: !3629)
!3641 = !DILocation(line: 27, column: 25, scope: !3636, inlinedAt: !3629)
!3642 = !DILocation(line: 27, column: 7, scope: !3636, inlinedAt: !3629)
!3643 = !DILocation(line: 26, column: 16, scope: !3636, inlinedAt: !3629)
!3644 = !DILocation(line: 26, column: 3, scope: !3636, inlinedAt: !3629)
!3645 = distinct !{!3645, !3637, !3646, !185}
!3646 = !DILocation(line: 27, column: 30, scope: !3633, inlinedAt: !3629)
!3647 = !DILocation(line: 474, column: 7, scope: !3621)
!3648 = !DILocation(line: 474, column: 12, scope: !3621)
!3649 = !DILocation(line: 473, column: 20, scope: !3621)
!3650 = !DILocation(line: 473, column: 5, scope: !3621)
!3651 = distinct !{!3651, !3614, !3652, !185}
!3652 = !DILocation(line: 474, column: 28, scope: !3615)
!3653 = !DILocation(line: 475, column: 8, scope: !3616)
!3654 = !DILocation(line: 476, column: 11, scope: !3616)
!3655 = !DILocation(line: 477, column: 5, scope: !3616)
!3656 = distinct !{!3656, !3606, !3657, !185}
!3657 = !DILocation(line: 478, column: 3, scope: !3590)
!3658 = !DILocation(line: 480, scope: !3618)
!3659 = !DILocation(line: 480, column: 12, scope: !3660)
!3660 = distinct !DILexicalBlock(scope: !3618, file: !27, line: 480, column: 3)
!3661 = !DILocation(line: 481, column: 25, scope: !3660)
!3662 = !DILocation(line: 481, column: 15, scope: !3660)
!3663 = !DILocation(line: 481, column: 35, scope: !3660)
!3664 = !DILocation(line: 481, column: 31, scope: !3660)
!3665 = !DILocation(line: 481, column: 8, scope: !3660)
!3666 = !DILocation(line: 481, column: 5, scope: !3660)
!3667 = !DILocation(line: 481, column: 12, scope: !3660)
!3668 = !DILocation(line: 480, column: 20, scope: !3660)
!3669 = !DILocation(line: 480, column: 3, scope: !3660)
!3670 = distinct !{!3670, !3617, !3671, !185}
!3671 = !DILocation(line: 481, column: 40, scope: !3618)
!3672 = !DILocation(line: 483, column: 13, scope: !3590)
!3673 = !DILocation(line: 483, column: 29, scope: !3590)
!3674 = !DILocation(line: 483, column: 25, scope: !3590)
!3675 = !DILocation(line: 483, column: 6, scope: !3590)
!3676 = !DILocation(line: 483, column: 3, scope: !3590)
!3677 = !DILocation(line: 483, column: 10, scope: !3590)
!3678 = !DILocation(line: 484, column: 7, scope: !3590)
!3679 = !DILocation(line: 484, column: 10, scope: !3590)
!3680 = !DILocation(line: 484, column: 3, scope: !3590)
!3681 = !DILocation(line: 484, column: 14, scope: !3590)
!3682 = !DILocation(line: 485, column: 1, scope: !3590)
!3683 = !DILocation(line: 0, scope: !341)
!3684 = !DILocation(line: 0, scope: !349, inlinedAt: !3685)
!3685 = distinct !DILocation(line: 600, column: 3, scope: !341)
!3686 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3685)
!3687 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3685)
!3688 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3685)
!3689 = !DILocation(line: 509, scope: !363, inlinedAt: !3685)
!3690 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3685)
!3691 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3685)
!3692 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3685)
!3693 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3685)
!3694 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3685)
!3695 = !DILocation(line: 0, scope: !372, inlinedAt: !3696)
!3696 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3685)
!3697 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3696)
!3698 = !DILocation(line: 43, scope: !380, inlinedAt: !3696)
!3699 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3696)
!3700 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3696)
!3701 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3696)
!3702 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3696)
!3703 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3696)
!3704 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3696)
!3705 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3696)
!3706 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3696)
!3707 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3696)
!3708 = distinct !{!3708, !3700, !3709, !185}
!3709 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3696)
!3710 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3685)
!3711 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3685)
!3712 = distinct !{!3712, !3691, !3713, !185}
!3713 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3685)
!3714 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3685)
!3715 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3685)
!3716 = distinct !{!3716, !3686, !3717, !185}
!3717 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3685)
!3718 = !DILocation(line: 601, column: 1, scope: !341)
!3719 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !2976, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3720 = !DILocalVariable(name: "state", arg: 1, scope: !3719, file: !27, line: 610, type: !311)
!3721 = !DILocation(line: 0, scope: !3719)
!3722 = !DILocation(line: 0, scope: !2981, inlinedAt: !3723)
!3723 = distinct !DILocation(line: 612, column: 3, scope: !3719)
!3724 = !DILocation(line: 356, column: 7, scope: !2988, inlinedAt: !3723)
!3725 = !DILocation(line: 356, scope: !2988, inlinedAt: !3723)
!3726 = !DILocation(line: 356, column: 12, scope: !2991, inlinedAt: !3723)
!3727 = !DILocation(line: 356, column: 3, scope: !2988, inlinedAt: !3723)
!3728 = !DILocation(line: 357, column: 5, scope: !2991, inlinedAt: !3723)
!3729 = !DILocation(line: 357, column: 10, scope: !2991, inlinedAt: !3723)
!3730 = !DILocation(line: 356, column: 17, scope: !2991, inlinedAt: !3723)
!3731 = !DILocation(line: 356, column: 3, scope: !2991, inlinedAt: !3723)
!3732 = distinct !{!3732, !3727, !3733, !185}
!3733 = !DILocation(line: 357, column: 12, scope: !2988, inlinedAt: !3723)
!3734 = !DILocation(line: 613, column: 10, scope: !3719)
!3735 = !DILocation(line: 613, column: 14, scope: !3719)
!3736 = !DILocation(line: 614, column: 1, scope: !3719)
!3737 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !309, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3738 = !DILocalVariable(name: "state", arg: 1, scope: !3737, file: !27, line: 625, type: !311)
!3739 = !DILocation(line: 0, scope: !3737)
!3740 = !DILocalVariable(name: "in", arg: 2, scope: !3737, file: !27, line: 625, type: !64)
!3741 = !DILocalVariable(name: "inlen", arg: 3, scope: !3737, file: !27, line: 625, type: !163)
!3742 = !DILocation(line: 627, column: 47, scope: !3737)
!3743 = !DILocation(line: 627, column: 16, scope: !3737)
!3744 = !DILocation(line: 627, column: 10, scope: !3737)
!3745 = !DILocation(line: 627, column: 14, scope: !3737)
!3746 = !DILocation(line: 628, column: 1, scope: !3737)
!3747 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !2976, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3748 = !DILocalVariable(name: "state", arg: 1, scope: !3747, file: !27, line: 637, type: !311)
!3749 = !DILocation(line: 0, scope: !3747)
!3750 = !DILocation(line: 639, column: 36, scope: !3747)
!3751 = !DILocation(line: 0, scope: !3533, inlinedAt: !3752)
!3752 = distinct !DILocation(line: 639, column: 3, scope: !3747)
!3753 = !DILocation(line: 407, column: 31, scope: !3533, inlinedAt: !3752)
!3754 = !DILocation(line: 407, column: 27, scope: !3533, inlinedAt: !3752)
!3755 = !DILocation(line: 407, column: 8, scope: !3533, inlinedAt: !3752)
!3756 = !DILocation(line: 407, column: 3, scope: !3533, inlinedAt: !3752)
!3757 = !DILocation(line: 407, column: 12, scope: !3533, inlinedAt: !3752)
!3758 = !DILocation(line: 408, column: 3, scope: !3533, inlinedAt: !3752)
!3759 = !DILocation(line: 408, column: 12, scope: !3533, inlinedAt: !3752)
!3760 = !DILocation(line: 640, column: 10, scope: !3747)
!3761 = !DILocation(line: 640, column: 14, scope: !3747)
!3762 = !DILocation(line: 641, column: 1, scope: !3747)
!3763 = !DILocation(line: 0, scope: !606)
!3764 = !DILocation(line: 655, column: 61, scope: !606)
!3765 = !DILocation(line: 0, scope: !613, inlinedAt: !3766)
!3766 = distinct !DILocation(line: 655, column: 16, scope: !606)
!3767 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3766)
!3768 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3766)
!3769 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3766)
!3770 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3766)
!3771 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3766)
!3772 = !DILocation(line: 439, scope: !631, inlinedAt: !3766)
!3773 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3766)
!3774 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3766)
!3775 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3766)
!3776 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3766)
!3777 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3766)
!3778 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3766)
!3779 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3766)
!3780 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3766)
!3781 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3766)
!3782 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3766)
!3783 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3766)
!3784 = distinct !{!3784, !3775, !3785, !185}
!3785 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3766)
!3786 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3766)
!3787 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3766)
!3788 = distinct !{!3788, !3767, !3789, !185}
!3789 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3766)
!3790 = !DILocation(line: 655, column: 10, scope: !606)
!3791 = !DILocation(line: 655, column: 14, scope: !606)
!3792 = !DILocation(line: 656, column: 1, scope: !606)
!3793 = !DILocation(line: 0, scope: !577)
!3794 = !DILocation(line: 669, column: 3, scope: !577)
!3795 = !DILocation(line: 670, column: 10, scope: !577)
!3796 = !DILocation(line: 670, column: 14, scope: !577)
!3797 = !DILocation(line: 671, column: 1, scope: !577)
!3798 = !DILocation(line: 0, scope: !598)
!3799 = !DILocation(line: 0, scope: !349, inlinedAt: !3800)
!3800 = distinct !DILocation(line: 687, column: 3, scope: !598)
!3801 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3800)
!3802 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3800)
!3803 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3800)
!3804 = !DILocation(line: 509, scope: !363, inlinedAt: !3800)
!3805 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3800)
!3806 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3800)
!3807 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3800)
!3808 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3800)
!3809 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3800)
!3810 = !DILocation(line: 0, scope: !372, inlinedAt: !3811)
!3811 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3800)
!3812 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3811)
!3813 = !DILocation(line: 43, scope: !380, inlinedAt: !3811)
!3814 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3811)
!3815 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3811)
!3816 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3811)
!3817 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3811)
!3818 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3811)
!3819 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3811)
!3820 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3811)
!3821 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3811)
!3822 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3811)
!3823 = distinct !{!3823, !3815, !3824, !185}
!3824 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3811)
!3825 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3800)
!3826 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3800)
!3827 = distinct !{!3827, !3806, !3828, !185}
!3828 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3800)
!3829 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3800)
!3830 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3800)
!3831 = distinct !{!3831, !3801, !3832, !185}
!3832 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3800)
!3833 = !DILocation(line: 688, column: 1, scope: !598)
!3834 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !580, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3835 = !DILocalVariable(name: "out", arg: 1, scope: !3834, file: !27, line: 700, type: !60)
!3836 = !DILocation(line: 0, scope: !3834)
!3837 = !DILocalVariable(name: "outlen", arg: 2, scope: !3834, file: !27, line: 700, type: !163)
!3838 = !DILocalVariable(name: "in", arg: 3, scope: !3834, file: !27, line: 700, type: !64)
!3839 = !DILocalVariable(name: "inlen", arg: 4, scope: !3834, file: !27, line: 700, type: !163)
!3840 = !DILocalVariable(name: "state", scope: !3834, file: !27, line: 703, type: !312)
!3841 = !DILocation(line: 703, column: 16, scope: !3834)
!3842 = !DILocation(line: 0, scope: !308, inlinedAt: !3843)
!3843 = distinct !DILocation(line: 705, column: 3, scope: !3834)
!3844 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !3843)
!3845 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !3843)
!3846 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !3843)
!3847 = !DILocation(line: 706, column: 19, scope: !3834)
!3848 = !DILocalVariable(name: "nblocks", scope: !3834, file: !27, line: 702, type: !163)
!3849 = !DILocation(line: 0, scope: !341, inlinedAt: !3850)
!3850 = distinct !DILocation(line: 707, column: 3, scope: !3834)
!3851 = !DILocation(line: 0, scope: !349, inlinedAt: !3852)
!3852 = distinct !DILocation(line: 600, column: 3, scope: !341, inlinedAt: !3850)
!3853 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3852)
!3854 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3852)
!3855 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3852)
!3856 = !DILocation(line: 509, scope: !363, inlinedAt: !3852)
!3857 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3852)
!3858 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3852)
!3859 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3852)
!3860 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3852)
!3861 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3852)
!3862 = !DILocation(line: 0, scope: !372, inlinedAt: !3863)
!3863 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3852)
!3864 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3863)
!3865 = !DILocation(line: 43, scope: !380, inlinedAt: !3863)
!3866 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3863)
!3867 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3863)
!3868 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3863)
!3869 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3863)
!3870 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3863)
!3871 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3863)
!3872 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3863)
!3873 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3863)
!3874 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3863)
!3875 = distinct !{!3875, !3867, !3876, !185}
!3876 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3863)
!3877 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3852)
!3878 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3852)
!3879 = distinct !{!3879, !3858, !3880, !185}
!3880 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3852)
!3881 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3852)
!3882 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3852)
!3883 = distinct !{!3883, !3853, !3884, !185}
!3884 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3852)
!3885 = !DILocation(line: 708, column: 20, scope: !3834)
!3886 = !DILocation(line: 708, column: 10, scope: !3834)
!3887 = !DILocation(line: 709, column: 17, scope: !3834)
!3888 = !DILocation(line: 709, column: 7, scope: !3834)
!3889 = !DILocation(line: 0, scope: !3551, inlinedAt: !3890)
!3890 = distinct !DILocation(line: 710, column: 3, scope: !3834)
!3891 = !DILocation(line: 568, column: 61, scope: !3551, inlinedAt: !3890)
!3892 = !DILocation(line: 0, scope: !613, inlinedAt: !3893)
!3893 = distinct !DILocation(line: 568, column: 16, scope: !3551, inlinedAt: !3890)
!3894 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3893)
!3895 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3893)
!3896 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3893)
!3897 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3893)
!3898 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3893)
!3899 = !DILocation(line: 439, scope: !631, inlinedAt: !3893)
!3900 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3893)
!3901 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3893)
!3902 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3893)
!3903 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3893)
!3904 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3893)
!3905 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3893)
!3906 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3893)
!3907 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3893)
!3908 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3893)
!3909 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3893)
!3910 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3893)
!3911 = distinct !{!3911, !3902, !3912, !185}
!3912 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3893)
!3913 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3893)
!3914 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3893)
!3915 = distinct !{!3915, !3894, !3916, !185}
!3916 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3893)
!3917 = !DILocation(line: 568, column: 10, scope: !3551, inlinedAt: !3890)
!3918 = !DILocation(line: 568, column: 14, scope: !3551, inlinedAt: !3890)
!3919 = !DILocation(line: 711, column: 1, scope: !3834)
!3920 = !DILocation(line: 0, scope: !579)
!3921 = !DILocation(line: 726, column: 16, scope: !579)
!3922 = !DILocation(line: 0, scope: !577, inlinedAt: !3923)
!3923 = distinct !DILocation(line: 728, column: 3, scope: !579)
!3924 = !DILocation(line: 669, column: 3, scope: !577, inlinedAt: !3923)
!3925 = !DILocation(line: 670, column: 10, scope: !577, inlinedAt: !3923)
!3926 = !DILocation(line: 670, column: 14, scope: !577, inlinedAt: !3923)
!3927 = !DILocation(line: 729, column: 19, scope: !579)
!3928 = !DILocation(line: 0, scope: !598, inlinedAt: !3929)
!3929 = distinct !DILocation(line: 730, column: 3, scope: !579)
!3930 = !DILocation(line: 0, scope: !349, inlinedAt: !3931)
!3931 = distinct !DILocation(line: 687, column: 3, scope: !598, inlinedAt: !3929)
!3932 = !DILocation(line: 507, column: 3, scope: !349, inlinedAt: !3931)
!3933 = !DILocation(line: 508, column: 5, scope: !360, inlinedAt: !3931)
!3934 = !DILocation(line: 509, column: 9, scope: !363, inlinedAt: !3931)
!3935 = !DILocation(line: 509, scope: !363, inlinedAt: !3931)
!3936 = !DILocation(line: 509, column: 14, scope: !366, inlinedAt: !3931)
!3937 = !DILocation(line: 509, column: 5, scope: !363, inlinedAt: !3931)
!3938 = !DILocation(line: 510, column: 20, scope: !366, inlinedAt: !3931)
!3939 = !DILocation(line: 510, column: 18, scope: !366, inlinedAt: !3931)
!3940 = !DILocation(line: 510, column: 24, scope: !366, inlinedAt: !3931)
!3941 = !DILocation(line: 0, scope: !372, inlinedAt: !3942)
!3942 = distinct !DILocation(line: 510, column: 7, scope: !366, inlinedAt: !3931)
!3943 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !3942)
!3944 = !DILocation(line: 43, scope: !380, inlinedAt: !3942)
!3945 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !3942)
!3946 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !3942)
!3947 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !3942)
!3948 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !3942)
!3949 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !3942)
!3950 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !3942)
!3951 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !3942)
!3952 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !3942)
!3953 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !3942)
!3954 = distinct !{!3954, !3946, !3955, !185}
!3955 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !3942)
!3956 = !DILocation(line: 509, column: 20, scope: !366, inlinedAt: !3931)
!3957 = !DILocation(line: 509, column: 5, scope: !366, inlinedAt: !3931)
!3958 = distinct !{!3958, !3937, !3959, !185}
!3959 = !DILocation(line: 510, column: 28, scope: !363, inlinedAt: !3931)
!3960 = !DILocation(line: 511, column: 9, scope: !360, inlinedAt: !3931)
!3961 = !DILocation(line: 512, column: 13, scope: !360, inlinedAt: !3931)
!3962 = distinct !{!3962, !3932, !3963, !185}
!3963 = !DILocation(line: 513, column: 3, scope: !349, inlinedAt: !3931)
!3964 = !DILocation(line: 731, column: 20, scope: !579)
!3965 = !DILocation(line: 731, column: 10, scope: !579)
!3966 = !DILocation(line: 732, column: 17, scope: !579)
!3967 = !DILocation(line: 732, column: 7, scope: !579)
!3968 = !DILocation(line: 0, scope: !606, inlinedAt: !3969)
!3969 = distinct !DILocation(line: 733, column: 3, scope: !579)
!3970 = !DILocation(line: 655, column: 61, scope: !606, inlinedAt: !3969)
!3971 = !DILocation(line: 0, scope: !613, inlinedAt: !3972)
!3972 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !3969)
!3973 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !3972)
!3974 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !3972)
!3975 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !3972)
!3976 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !3972)
!3977 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !3972)
!3978 = !DILocation(line: 439, scope: !631, inlinedAt: !3972)
!3979 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !3972)
!3980 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !3972)
!3981 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !3972)
!3982 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !3972)
!3983 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !3972)
!3984 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !3972)
!3985 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !3972)
!3986 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !3972)
!3987 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !3972)
!3988 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !3972)
!3989 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !3972)
!3990 = distinct !{!3990, !3981, !3991, !185}
!3991 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !3972)
!3992 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !3972)
!3993 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !3972)
!3994 = distinct !{!3994, !3973, !3995, !185}
!3995 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !3972)
!3996 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !3969)
!3997 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !3969)
!3998 = !DILocation(line: 734, column: 1, scope: !579)
!3999 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !4000, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4000 = !DISubroutineType(types: !4001)
!4001 = !{null, !60, !64, !163}
!4002 = !DILocalVariable(name: "h", arg: 1, scope: !3999, file: !27, line: 745, type: !60)
!4003 = !DILocation(line: 0, scope: !3999)
!4004 = !DILocalVariable(name: "in", arg: 2, scope: !3999, file: !27, line: 745, type: !64)
!4005 = !DILocalVariable(name: "inlen", arg: 3, scope: !3999, file: !27, line: 745, type: !163)
!4006 = !DILocalVariable(name: "s", scope: !3999, file: !27, line: 748, type: !258)
!4007 = !DILocation(line: 748, column: 12, scope: !3999)
!4008 = !DILocation(line: 750, column: 3, scope: !3999)
!4009 = !DILocation(line: 751, column: 3, scope: !3999)
!4010 = !DILocalVariable(name: "i", scope: !3999, file: !27, line: 747, type: !42)
!4011 = !DILocation(line: 752, column: 7, scope: !4012)
!4012 = distinct !DILexicalBlock(scope: !3999, file: !27, line: 752, column: 3)
!4013 = !DILocation(line: 752, scope: !4012)
!4014 = !DILocation(line: 752, column: 12, scope: !4015)
!4015 = distinct !DILexicalBlock(scope: !4012, file: !27, line: 752, column: 3)
!4016 = !DILocation(line: 752, column: 3, scope: !4012)
!4017 = !DILocation(line: 753, column: 16, scope: !4015)
!4018 = !DILocation(line: 753, column: 14, scope: !4015)
!4019 = !DILocation(line: 753, column: 19, scope: !4015)
!4020 = !DILocation(line: 0, scope: !372, inlinedAt: !4021)
!4021 = distinct !DILocation(line: 753, column: 5, scope: !4015)
!4022 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4021)
!4023 = !DILocation(line: 43, scope: !380, inlinedAt: !4021)
!4024 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4021)
!4025 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4021)
!4026 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4021)
!4027 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4021)
!4028 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4021)
!4029 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4021)
!4030 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4021)
!4031 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4021)
!4032 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4021)
!4033 = distinct !{!4033, !4025, !4034, !185}
!4034 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4021)
!4035 = !DILocation(line: 752, column: 16, scope: !4015)
!4036 = !DILocation(line: 752, column: 3, scope: !4015)
!4037 = distinct !{!4037, !4016, !4038, !185}
!4038 = !DILocation(line: 753, column: 23, scope: !4012)
!4039 = !DILocation(line: 754, column: 1, scope: !3999)
!4040 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !4000, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!4041 = !DILocalVariable(name: "h", arg: 1, scope: !4040, file: !27, line: 765, type: !60)
!4042 = !DILocation(line: 0, scope: !4040)
!4043 = !DILocalVariable(name: "in", arg: 2, scope: !4040, file: !27, line: 765, type: !64)
!4044 = !DILocalVariable(name: "inlen", arg: 3, scope: !4040, file: !27, line: 765, type: !163)
!4045 = !DILocalVariable(name: "s", scope: !4040, file: !27, line: 768, type: !258)
!4046 = !DILocation(line: 768, column: 12, scope: !4040)
!4047 = !DILocation(line: 770, column: 3, scope: !4040)
!4048 = !DILocation(line: 771, column: 3, scope: !4040)
!4049 = !DILocalVariable(name: "i", scope: !4040, file: !27, line: 767, type: !42)
!4050 = !DILocation(line: 772, column: 7, scope: !4051)
!4051 = distinct !DILexicalBlock(scope: !4040, file: !27, line: 772, column: 3)
!4052 = !DILocation(line: 772, scope: !4051)
!4053 = !DILocation(line: 772, column: 12, scope: !4054)
!4054 = distinct !DILexicalBlock(scope: !4051, file: !27, line: 772, column: 3)
!4055 = !DILocation(line: 772, column: 3, scope: !4051)
!4056 = !DILocation(line: 773, column: 16, scope: !4054)
!4057 = !DILocation(line: 773, column: 14, scope: !4054)
!4058 = !DILocation(line: 773, column: 19, scope: !4054)
!4059 = !DILocation(line: 0, scope: !372, inlinedAt: !4060)
!4060 = distinct !DILocation(line: 773, column: 5, scope: !4054)
!4061 = !DILocation(line: 43, column: 7, scope: !380, inlinedAt: !4060)
!4062 = !DILocation(line: 43, scope: !380, inlinedAt: !4060)
!4063 = !DILocation(line: 43, column: 12, scope: !383, inlinedAt: !4060)
!4064 = !DILocation(line: 43, column: 3, scope: !380, inlinedAt: !4060)
!4065 = !DILocation(line: 44, column: 18, scope: !383, inlinedAt: !4060)
!4066 = !DILocation(line: 44, column: 14, scope: !383, inlinedAt: !4060)
!4067 = !DILocation(line: 44, column: 12, scope: !383, inlinedAt: !4060)
!4068 = !DILocation(line: 44, column: 5, scope: !383, inlinedAt: !4060)
!4069 = !DILocation(line: 44, column: 10, scope: !383, inlinedAt: !4060)
!4070 = !DILocation(line: 43, column: 16, scope: !383, inlinedAt: !4060)
!4071 = !DILocation(line: 43, column: 3, scope: !383, inlinedAt: !4060)
!4072 = distinct !{!4072, !4064, !4073, !185}
!4073 = !DILocation(line: 44, column: 19, scope: !380, inlinedAt: !4060)
!4074 = !DILocation(line: 772, column: 16, scope: !4054)
!4075 = !DILocation(line: 772, column: 3, scope: !4054)
!4076 = distinct !{!4076, !4055, !4077, !185}
!4077 = !DILocation(line: 773, column: 23, scope: !4051)
!4078 = !DILocation(line: 774, column: 1, scope: !4040)
!4079 = !DILocation(line: 0, scope: !282)
!4080 = !DILocation(line: 23, column: 11, scope: !282)
!4081 = !DILocation(line: 25, column: 3, scope: !282)
!4082 = !DILocation(line: 26, column: 3, scope: !282)
!4083 = !DILocation(line: 26, column: 29, scope: !282)
!4084 = !DILocation(line: 27, column: 3, scope: !282)
!4085 = !DILocation(line: 27, column: 29, scope: !282)
!4086 = !DILocation(line: 0, scope: !308, inlinedAt: !4087)
!4087 = distinct !DILocation(line: 29, column: 3, scope: !282)
!4088 = !DILocation(line: 582, column: 3, scope: !308, inlinedAt: !4087)
!4089 = !DILocation(line: 583, column: 10, scope: !308, inlinedAt: !4087)
!4090 = !DILocation(line: 583, column: 14, scope: !308, inlinedAt: !4087)
!4091 = !DILocation(line: 30, column: 1, scope: !282)
!4092 = !DILocation(line: 0, scope: !560)
!4093 = !DILocation(line: 45, column: 11, scope: !560)
!4094 = !DILocation(line: 47, column: 3, scope: !560)
!4095 = !DILocation(line: 48, column: 3, scope: !560)
!4096 = !DILocation(line: 48, column: 26, scope: !560)
!4097 = !DILocation(line: 50, column: 3, scope: !560)
!4098 = !DILocation(line: 51, column: 1, scope: !560)
!4099 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !283, file: !283, line: 64, type: !1519, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!4100 = !DILocalVariable(name: "out", arg: 1, scope: !4099, file: !283, line: 64, type: !60)
!4101 = !DILocation(line: 0, scope: !4099)
!4102 = !DILocalVariable(name: "key", arg: 2, scope: !4099, file: !283, line: 64, type: !64)
!4103 = !DILocalVariable(name: "input", arg: 3, scope: !4099, file: !283, line: 64, type: !64)
!4104 = !DILocalVariable(name: "s", scope: !4099, file: !283, line: 66, type: !287)
!4105 = !DILocation(line: 66, column: 16, scope: !4099)
!4106 = !DILocation(line: 0, scope: !3719, inlinedAt: !4107)
!4107 = distinct !DILocation(line: 68, column: 3, scope: !4099)
!4108 = !DILocation(line: 0, scope: !2981, inlinedAt: !4109)
!4109 = distinct !DILocation(line: 612, column: 3, scope: !3719, inlinedAt: !4107)
!4110 = !DILocation(line: 356, column: 7, scope: !2988, inlinedAt: !4109)
!4111 = !DILocation(line: 356, scope: !2988, inlinedAt: !4109)
!4112 = !DILocation(line: 356, column: 12, scope: !2991, inlinedAt: !4109)
!4113 = !DILocation(line: 356, column: 3, scope: !2988, inlinedAt: !4109)
!4114 = !DILocation(line: 357, column: 5, scope: !2991, inlinedAt: !4109)
!4115 = !DILocation(line: 357, column: 10, scope: !2991, inlinedAt: !4109)
!4116 = !DILocation(line: 356, column: 17, scope: !2991, inlinedAt: !4109)
!4117 = !DILocation(line: 356, column: 3, scope: !2991, inlinedAt: !4109)
!4118 = distinct !{!4118, !4113, !4119, !185}
!4119 = !DILocation(line: 357, column: 12, scope: !2988, inlinedAt: !4109)
!4120 = !DILocation(line: 613, column: 10, scope: !3719, inlinedAt: !4107)
!4121 = !DILocation(line: 613, column: 14, scope: !3719, inlinedAt: !4107)
!4122 = !DILocation(line: 0, scope: !3737, inlinedAt: !4123)
!4123 = distinct !DILocation(line: 69, column: 3, scope: !4099)
!4124 = !DILocation(line: 627, column: 16, scope: !3737, inlinedAt: !4123)
!4125 = !DILocation(line: 627, column: 10, scope: !3737, inlinedAt: !4123)
!4126 = !DILocation(line: 627, column: 14, scope: !3737, inlinedAt: !4123)
!4127 = !DILocation(line: 0, scope: !3737, inlinedAt: !4128)
!4128 = distinct !DILocation(line: 70, column: 3, scope: !4099)
!4129 = !DILocation(line: 627, column: 16, scope: !3737, inlinedAt: !4128)
!4130 = !DILocation(line: 627, column: 10, scope: !3737, inlinedAt: !4128)
!4131 = !DILocation(line: 627, column: 14, scope: !3737, inlinedAt: !4128)
!4132 = !DILocation(line: 0, scope: !3747, inlinedAt: !4133)
!4133 = distinct !DILocation(line: 71, column: 3, scope: !4099)
!4134 = !DILocation(line: 0, scope: !3533, inlinedAt: !4135)
!4135 = distinct !DILocation(line: 639, column: 3, scope: !3747, inlinedAt: !4133)
!4136 = !DILocation(line: 407, column: 31, scope: !3533, inlinedAt: !4135)
!4137 = !DILocation(line: 407, column: 27, scope: !3533, inlinedAt: !4135)
!4138 = !DILocation(line: 407, column: 8, scope: !3533, inlinedAt: !4135)
!4139 = !DILocation(line: 407, column: 3, scope: !3533, inlinedAt: !4135)
!4140 = !DILocation(line: 407, column: 12, scope: !3533, inlinedAt: !4135)
!4141 = !DILocation(line: 408, column: 3, scope: !3533, inlinedAt: !4135)
!4142 = !DILocation(line: 408, column: 12, scope: !3533, inlinedAt: !4135)
!4143 = !DILocation(line: 640, column: 10, scope: !3747, inlinedAt: !4133)
!4144 = !DILocation(line: 640, column: 14, scope: !3747, inlinedAt: !4133)
!4145 = !DILocation(line: 0, scope: !606, inlinedAt: !4146)
!4146 = distinct !DILocation(line: 72, column: 3, scope: !4099)
!4147 = !DILocation(line: 0, scope: !613, inlinedAt: !4148)
!4148 = distinct !DILocation(line: 655, column: 16, scope: !606, inlinedAt: !4146)
!4149 = !DILocation(line: 434, column: 3, scope: !613, inlinedAt: !4148)
!4150 = !DILocation(line: 435, column: 12, scope: !624, inlinedAt: !4148)
!4151 = !DILocation(line: 436, column: 7, scope: !627, inlinedAt: !4148)
!4152 = !DILocation(line: 438, column: 5, scope: !627, inlinedAt: !4148)
!4153 = !DILocation(line: 439, column: 9, scope: !631, inlinedAt: !4148)
!4154 = !DILocation(line: 439, scope: !631, inlinedAt: !4148)
!4155 = !DILocation(line: 439, column: 17, scope: !634, inlinedAt: !4148)
!4156 = !DILocation(line: 439, column: 21, scope: !634, inlinedAt: !4148)
!4157 = !DILocation(line: 439, column: 5, scope: !631, inlinedAt: !4148)
!4158 = !DILocation(line: 440, column: 19, scope: !634, inlinedAt: !4148)
!4159 = !DILocation(line: 440, column: 16, scope: !634, inlinedAt: !4148)
!4160 = !DILocation(line: 440, column: 27, scope: !634, inlinedAt: !4148)
!4161 = !DILocation(line: 440, column: 23, scope: !634, inlinedAt: !4148)
!4162 = !DILocation(line: 440, column: 14, scope: !634, inlinedAt: !4148)
!4163 = !DILocation(line: 440, column: 11, scope: !634, inlinedAt: !4148)
!4164 = !DILocation(line: 439, column: 41, scope: !634, inlinedAt: !4148)
!4165 = !DILocation(line: 439, column: 5, scope: !634, inlinedAt: !4148)
!4166 = distinct !{!4166, !4157, !4167, !185}
!4167 = !DILocation(line: 440, column: 32, scope: !631, inlinedAt: !4148)
!4168 = !DILocation(line: 441, column: 16, scope: !625, inlinedAt: !4148)
!4169 = !DILocation(line: 441, column: 12, scope: !625, inlinedAt: !4148)
!4170 = distinct !{!4170, !4149, !4171, !185}
!4171 = !DILocation(line: 443, column: 3, scope: !613, inlinedAt: !4148)
!4172 = !DILocation(line: 655, column: 10, scope: !606, inlinedAt: !4146)
!4173 = !DILocation(line: 655, column: 14, scope: !606, inlinedAt: !4146)
!4174 = !DILocation(line: 73, column: 1, scope: !4099)
