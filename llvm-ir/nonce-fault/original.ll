; ModuleID = '../no_struct/kyber512.ll'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #1 !dbg !106 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !123, !DIExpression(), !124)
    #dbg_value(ptr %seed, !125, !DIExpression(), !124)
    #dbg_value(i32 %transposed, !126, !DIExpression(), !124)
    #dbg_declare(ptr %buf, !127, !DIExpression(), !131)
    #dbg_declare(ptr %state, !132, !DIExpression(), !138)
    #dbg_value(i32 0, !139, !DIExpression(), !124)
  br label %for.cond1.preheader, !dbg !140

for.cond1.preheader:                              ; preds = %entry, %for.inc18
  %i.04 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ]
    #dbg_value(i32 %i.04, !139, !DIExpression(), !124)
    #dbg_value(i32 0, !142, !DIExpression(), !124)
  br label %for.body3, !dbg !143

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.03 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.inc ]
    #dbg_value(i32 %j.03, !142, !DIExpression(), !124)
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !147
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !147

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.04 to i8, !dbg !151
  %conv4 = trunc nuw nsw i32 %j.03 to i8, !dbg !151
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !151
  br label %if.end, !dbg !151

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.03 to i8, !dbg !152
  %conv6 = trunc nuw i32 %i.04 to i8, !dbg !152
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !152
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !153
    #dbg_value(i32 504, !154, !DIExpression(), !124)
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.04, i32 %j.03, !dbg !155
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !156
    #dbg_value(i32 %call, !157, !DIExpression(), !124)
  %cmp101 = icmp ult i32 %call, 256, !dbg !158
  br i1 %cmp101, label %while.body.lr.ph, label %for.inc, !dbg !159

while.body.lr.ph:                                 ; preds = %if.end
  br label %while.body, !dbg !159

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %ctr.02 = phi i32 [ %call, %while.body.lr.ph ], [ %add, %while.body ]
    #dbg_value(i32 %ctr.02, !157, !DIExpression(), !124)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !160
    #dbg_value(i32 168, !154, !DIExpression(), !124)
  %arrayidx14 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.04, i32 %j.03, !dbg !162
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.02, !dbg !163
  %sub = sub nuw nsw i32 256, %ctr.02, !dbg !164
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !165
  %add = add i32 %ctr.02, %call17, !dbg !166
    #dbg_value(i32 %add, !157, !DIExpression(), !124)
  %cmp10 = icmp ult i32 %add, 256, !dbg !158
  br i1 %cmp10, label %while.body, label %while.cond.for.inc_crit_edge, !dbg !159, !llvm.loop !167

while.cond.for.inc_crit_edge:                     ; preds = %while.body
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %while.cond.for.inc_crit_edge, %if.end
  %inc = add nuw nsw i32 %j.03, 1, !dbg !170
    #dbg_value(i32 %inc, !142, !DIExpression(), !124)
  %exitcond.not = icmp eq i32 %inc, 2, !dbg !171
  br i1 %exitcond.not, label %for.inc18, label %for.body3, !dbg !143, !llvm.loop !172

for.inc18:                                        ; preds = %for.inc
  %inc19 = add nuw nsw i32 %i.04, 1, !dbg !174
    #dbg_value(i32 %inc19, !139, !DIExpression(), !124)
  %exitcond1.not = icmp eq i32 %inc19, 2, !dbg !175
  br i1 %exitcond1.not, label %for.end20, label %for.cond1.preheader, !dbg !140, !llvm.loop !176

for.end20:                                        ; preds = %for.inc18
  ret void, !dbg !178
}

; Function Attrs: inlinehint nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #1 !dbg !179 {
entry:
    #dbg_value(ptr %r, !183, !DIExpression(), !184)
    #dbg_value(i32 %len, !185, !DIExpression(), !184)
    #dbg_value(ptr %buf, !186, !DIExpression(), !184)
    #dbg_value(i32 %buflen, !187, !DIExpression(), !184)
    #dbg_value(i32 0, !188, !DIExpression(), !184)
    #dbg_value(i32 0, !189, !DIExpression(), !184)
  br label %while.body, !dbg !190

while.body:                                       ; preds = %entry, %if.end33
  %pos.02 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ]
  %ctr.01 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ]
    #dbg_value(i32 %pos.02, !188, !DIExpression(), !184)
    #dbg_value(i32 %ctr.01, !189, !DIExpression(), !184)
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.02, !dbg !191
  %0 = load i8, ptr %arrayidx, align 1, !dbg !191
  %conv = zext i8 %0 to i16, !dbg !191
  %1 = getelementptr i8, ptr %buf, i32 %pos.02, !dbg !193
  %arrayidx4 = getelementptr i8, ptr %1, i32 1, !dbg !193
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !193
  %conv6 = zext i8 %2 to i16, !dbg !194
  %shl = shl nuw i16 %conv6, 8, !dbg !195
  %shl.masked = and i16 %shl, 3840, !dbg !196
  %and = or disjoint i16 %shl.masked, %conv, !dbg !196
    #dbg_value(i16 %and, !197, !DIExpression(), !184)
  %3 = getelementptr i8, ptr %buf, i32 %pos.02, !dbg !198
  %arrayidx9 = getelementptr i8, ptr %3, i32 1, !dbg !198
  %4 = load i8, ptr %arrayidx9, align 1, !dbg !198
  %5 = lshr i8 %4, 4, !dbg !199
  %shr11 = zext nneg i8 %5 to i16, !dbg !199
  %6 = getelementptr i8, ptr %buf, i32 %pos.02, !dbg !200
  %arrayidx13 = getelementptr i8, ptr %6, i32 2, !dbg !200
  %7 = load i8, ptr %arrayidx13, align 1, !dbg !200
  %conv15 = zext i8 %7 to i16, !dbg !201
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !202
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !203
    #dbg_value(i16 %or17, !204, !DIExpression(), !184)
  %add20 = add nuw nsw i32 %pos.02, 3, !dbg !205
    #dbg_value(i32 %add20, !188, !DIExpression(), !184)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !206
  br i1 %cmp22, label %if.then, label %if.end, !dbg !206

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.01, 1, !dbg !208
    #dbg_value(i32 %inc, !189, !DIExpression(), !184)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.01, !dbg !209
  store i16 %and, ptr %arrayidx24, align 2, !dbg !210
  br label %if.end, !dbg !209

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.01, %while.body ], !dbg !184
    #dbg_value(i32 %ctr.1, !189, !DIExpression(), !184)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !211
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !213
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !213

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !214
    #dbg_value(i32 %inc31, !189, !DIExpression(), !184)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !215
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !216
  br label %if.end33, !dbg !215

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !217
    #dbg_value(i32 %add20, !188, !DIExpression(), !184)
    #dbg_value(i32 %ctr.2, !189, !DIExpression(), !184)
  %cmp = icmp ult i32 %ctr.2, %len, !dbg !218
  %add = add nuw nsw i32 %add20, 3, !dbg !219
  %cmp1 = icmp samesign ule i32 %add, %buflen, !dbg !219
  %8 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !219
  br i1 %8, label %while.body, label %while.end, !dbg !190, !llvm.loop !220

while.end:                                        ; preds = %if.end33
  %ctr.0.lcssa = phi i32 [ %ctr.2, %if.end33 ], !dbg !184
  ret i32 %ctr.0.lcssa, !dbg !222
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #1 !dbg !223 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x [2 x [256 x i16]]], align 2
  %e = alloca [2 x [256 x i16]], align 2
  %pkpv = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !226, !DIExpression(), !227)
    #dbg_value(ptr %sk, !228, !DIExpression(), !227)
    #dbg_value(ptr %coins, !229, !DIExpression(), !227)
    #dbg_declare(ptr %buf, !230, !DIExpression(), !234)
    #dbg_value(ptr %buf, !235, !DIExpression(), !227)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !236
    #dbg_value(ptr %add.ptr, !237, !DIExpression(), !227)
    #dbg_value(i8 0, !238, !DIExpression(), !227)
    #dbg_declare(ptr %a, !239, !DIExpression(), !241)
    #dbg_declare(ptr %e, !242, !DIExpression(), !243)
    #dbg_declare(ptr %pkpv, !244, !DIExpression(), !245)
    #dbg_declare(ptr %skpv, !246, !DIExpression(), !247)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !248
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !249
  store i8 2, ptr %arrayidx, align 1, !dbg !250
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !251
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !252
    #dbg_value(i32 0, !253, !DIExpression(), !227)
    #dbg_value(i8 0, !238, !DIExpression(), !227)
  br label %for.body, !dbg !254

for.cond8.preheader:                              ; preds = %for.body
    #dbg_value(i8 2, !238, !DIExpression(), !227)
    #dbg_value(i32 0, !253, !DIExpression(), !227)
  br label %for.body10, !dbg !256

for.body:                                         ; preds = %entry, %for.body
  %nonce.02 = phi i8 [ 0, %entry ], [ %inc, %for.body ]
  %i.01 = phi i32 [ 0, %entry ], [ %inc7, %for.body ]
    #dbg_value(i8 %nonce.02, !238, !DIExpression(), !227)
    #dbg_value(i32 %i.01, !253, !DIExpression(), !227)
  %arrayidx6 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %skpv, i32 0, i32 %i.01, !dbg !258
    #dbg_value(i8 %nonce.02, !238, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !227)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.02) #3, !dbg !260
  %inc = add nuw nsw i8 %nonce.02, 1, !dbg !261
    #dbg_value(i8 %inc, !238, !DIExpression(), !227)
  %inc7 = add nuw nsw i32 %i.01, 1, !dbg !262
    #dbg_value(i32 %inc7, !253, !DIExpression(), !227)
  %exitcond.not = icmp eq i32 %inc7, 2, !dbg !263
  br i1 %exitcond.not, label %for.cond8.preheader, label %for.body, !dbg !254, !llvm.loop !264

for.body10:                                       ; preds = %for.cond8.preheader, %for.body10
  %nonce.14 = phi i8 [ 2, %for.cond8.preheader ], [ %inc12, %for.body10 ]
  %i.13 = phi i32 [ 0, %for.cond8.preheader ], [ %inc14, %for.body10 ]
    #dbg_value(i8 %nonce.14, !238, !DIExpression(), !227)
    #dbg_value(i32 %i.13, !253, !DIExpression(), !227)
  %arrayidx11 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %e, i32 0, i32 %i.13, !dbg !266
    #dbg_value(i8 %nonce.14, !238, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !227)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.14) #3, !dbg !268
  %inc12 = add nuw nsw i8 %nonce.14, 1, !dbg !269
    #dbg_value(i8 %inc12, !238, !DIExpression(), !227)
  %inc14 = add nuw nsw i32 %i.13, 1, !dbg !270
    #dbg_value(i32 %inc14, !253, !DIExpression(), !227)
  %exitcond1.not = icmp eq i32 %inc14, 2, !dbg !271
  br i1 %exitcond1.not, label %for.end15, label %for.body10, !dbg !256, !llvm.loop !272

for.end15:                                        ; preds = %for.body10
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !274
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !275
    #dbg_value(i32 0, !253, !DIExpression(), !227)
  br label %for.body18, !dbg !276

for.body18:                                       ; preds = %for.end15, %for.body18
  %i.25 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ]
    #dbg_value(i32 %i.25, !253, !DIExpression(), !227)
  %arrayidx19 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.25, !dbg !278
  %arrayidx20 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %a, i32 0, i32 %i.25, !dbg !281
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !282
  %arrayidx21 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.25, !dbg !283
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !284
  %inc23 = add nuw nsw i32 %i.25, 1, !dbg !285
    #dbg_value(i32 %inc23, !253, !DIExpression(), !227)
  %exitcond2.not = icmp eq i32 %inc23, 2, !dbg !286
  br i1 %exitcond2.not, label %for.end24, label %for.body18, !dbg !276, !llvm.loop !287

for.end24:                                        ; preds = %for.body18
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !289
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !290
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !291
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !292
  ret void, !dbg !293
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #1 !dbg !294 {
entry:
    #dbg_value(ptr %r, !297, !DIExpression(), !298)
    #dbg_value(ptr %sk, !299, !DIExpression(), !298)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !300
  ret void, !dbg !301
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #1 !dbg !302 {
entry:
    #dbg_value(ptr %r, !305, !DIExpression(), !306)
    #dbg_value(ptr %pk, !307, !DIExpression(), !306)
    #dbg_value(ptr %seed, !308, !DIExpression(), !306)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !309
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 768, !dbg !310
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !311
  ret void, !dbg !312
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #1 !dbg !313 {
entry:
    #dbg_value(ptr %r, !319, !DIExpression(), !320)
    #dbg_value(ptr %a, !321, !DIExpression(), !320)
    #dbg_value(i32 0, !322, !DIExpression(), !320)
  br label %for.body, !dbg !323

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !322, !DIExpression(), !320)
  %mul = mul nuw nsw i32 %i.01, 384, !dbg !325
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !327
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.01, !dbg !328
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !329
  %inc = add nuw nsw i32 %i.01, 1, !dbg !330
    #dbg_value(i32 %inc, !322, !DIExpression(), !320)
  %exitcond.not = icmp eq i32 %inc, 2, !dbg !331
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !323, !llvm.loop !332

for.end:                                          ; preds = %for.body
  ret void, !dbg !334
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #1 !dbg !335 {
entry:
    #dbg_value(ptr %r, !338, !DIExpression(), !339)
    #dbg_value(i32 0, !340, !DIExpression(), !339)
  br label %for.body, !dbg !341

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !340, !DIExpression(), !339)
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.01, !dbg !343
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !345
  %inc = add nuw nsw i32 %i.01, 1, !dbg !346
    #dbg_value(i32 %inc, !340, !DIExpression(), !339)
  %exitcond.not = icmp eq i32 %inc, 2, !dbg !347
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !341, !llvm.loop !348

for.end:                                          ; preds = %for.body
  ret void, !dbg !350
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #1 !dbg !351 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !355, !DIExpression(), !356)
    #dbg_value(ptr %a, !357, !DIExpression(), !356)
    #dbg_value(ptr %b, !358, !DIExpression(), !356)
    #dbg_declare(ptr %t, !359, !DIExpression(), !360)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !361
    #dbg_value(i32 1, !362, !DIExpression(), !356)
    #dbg_value(i32 poison, !362, !DIExpression(), !356)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %a, i32 512, !dbg !363
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %b, i32 512, !dbg !367
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !368
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !369
    #dbg_value(i32 2, !362, !DIExpression(), !356)
    #dbg_value(i32 poison, !362, !DIExpression(), !356)
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !370
  ret void, !dbg !371
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #1 !dbg !372 {
entry:
    #dbg_value(ptr %r, !373, !DIExpression(), !374)
    #dbg_value(i32 0, !375, !DIExpression(), !374)
  br label %for.body, !dbg !376

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !375, !DIExpression(), !374)
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.01, !dbg !378
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !380
  %inc = add nuw nsw i32 %i.01, 1, !dbg !381
    #dbg_value(i32 %inc, !375, !DIExpression(), !374)
  %exitcond.not = icmp eq i32 %inc, 2, !dbg !382
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !376, !llvm.loop !383

for.end:                                          ; preds = %for.body
  ret void, !dbg !385
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #1 !dbg !386 {
entry:
    #dbg_value(ptr %r, !389, !DIExpression(), !390)
    #dbg_value(ptr %a, !391, !DIExpression(), !390)
    #dbg_value(ptr %b, !392, !DIExpression(), !390)
    #dbg_value(i32 0, !393, !DIExpression(), !390)
  br label %for.body, !dbg !394

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !393, !DIExpression(), !390)
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.01, !dbg !396
  %arrayidx1 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.01, !dbg !398
  %arrayidx2 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.01, !dbg !399
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !400
  %inc = add nuw nsw i32 %i.01, 1, !dbg !401
    #dbg_value(i32 %inc, !393, !DIExpression(), !390)
  %exitcond.not = icmp eq i32 %inc, 2, !dbg !402
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !394, !llvm.loop !403

for.end:                                          ; preds = %for.body
  ret void, !dbg !405
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #1 !dbg !406 {
entry:
    #dbg_value(ptr %r, !412, !DIExpression(), !413)
    #dbg_value(ptr %a, !414, !DIExpression(), !413)
    #dbg_value(i32 0, !415, !DIExpression(), !413)
  br label %for.body, !dbg !416

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !415, !DIExpression(), !413)
  %mul = shl nuw nsw i32 %i.01, 1, !dbg !418
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !421
  %0 = load i16, ptr %arrayidx, align 2, !dbg !421
    #dbg_value(i16 %0, !422, !DIExpression(), !413)
  %isneg = icmp slt i16 %0, 0, !dbg !423
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !423
  %add = add i16 %and, %0, !dbg !424
    #dbg_value(i16 %add, !422, !DIExpression(), !413)
  %mul3 = shl nuw nsw i32 %i.01, 1, !dbg !425
  %add4 = or disjoint i32 %mul3, 1, !dbg !426
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !427
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !427
    #dbg_value(i16 %1, !428, !DIExpression(), !413)
  %isneg1 = icmp slt i16 %1, 0, !dbg !429
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !429
  %add10 = add i16 %and8, %1, !dbg !430
    #dbg_value(i16 %add10, !428, !DIExpression(), !413)
  %conv14 = trunc i16 %add to i8, !dbg !431
  %mul15 = mul nuw nsw i32 %i.01, 3, !dbg !432
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !433
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !434
  %2 = lshr i16 %add, 8, !dbg !435
  %shr19 = trunc nuw i16 %2 to i8, !dbg !435
  %conv20 = trunc i16 %add10 to i8, !dbg !436
  %shl = shl i8 %conv20, 4, !dbg !437
  %or = or i8 %shl, %shr19, !dbg !438
  %mul22 = mul nuw nsw i32 %i.01, 3, !dbg !439
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !440
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !440
  store i8 %or, ptr %arrayidx24, align 1, !dbg !441
  %4 = lshr i16 %add10, 4, !dbg !442
  %conv27 = trunc i16 %4 to i8, !dbg !443
  %mul28 = mul nuw nsw i32 %i.01, 3, !dbg !444
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !445
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !445
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !446
  %inc = add nuw nsw i32 %i.01, 1, !dbg !447
    #dbg_value(i32 %inc, !415, !DIExpression(), !413)
  %exitcond.not = icmp eq i32 %inc, 128, !dbg !448
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !416, !llvm.loop !449

for.end:                                          ; preds = %for.body
  ret void, !dbg !451
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #1 !dbg !452 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !455, !DIExpression(), !456)
    #dbg_value(ptr %seed, !457, !DIExpression(), !456)
    #dbg_value(i8 %nonce, !458, !DIExpression(), !456)
    #dbg_declare(ptr %buf, !459, !DIExpression(), !463)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !464
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !465
  ret void, !dbg !466
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #1 !dbg !467 {
entry:
    #dbg_value(ptr %r, !470, !DIExpression(), !471)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #3, !dbg !472
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !473
  ret void, !dbg !474
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #1 !dbg !475 {
entry:
    #dbg_value(ptr %r, !476, !DIExpression(), !477)
    #dbg_value(i32 0, !478, !DIExpression(), !477)
  br label %for.body, !dbg !479

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !478, !DIExpression(), !477)
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.01, !dbg !481
  %0 = load i16, ptr %arrayidx, align 2, !dbg !481
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !483
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.01, !dbg !484
  store i16 %call, ptr %arrayidx1, align 2, !dbg !485
  %inc = add nuw nsw i32 %i.01, 1, !dbg !486
    #dbg_value(i32 %inc, !478, !DIExpression(), !477)
  %exitcond.not = icmp eq i32 %inc, 256, !dbg !487
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !479, !llvm.loop !488

for.end:                                          ; preds = %for.body
  ret void, !dbg !490
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #1 !dbg !491 {
entry:
    #dbg_value(ptr %r, !494, !DIExpression(), !495)
    #dbg_value(ptr %a, !496, !DIExpression(), !495)
    #dbg_value(ptr %b, !497, !DIExpression(), !495)
    #dbg_value(i32 0, !498, !DIExpression(), !495)
  br label %for.body, !dbg !499

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !498, !DIExpression(), !495)
  %mul = shl nuw nsw i32 %i.01, 2, !dbg !501
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !504
  %mul1 = shl nuw nsw i32 %i.01, 2, !dbg !505
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !506
  %mul3 = shl nuw nsw i32 %i.01, 2, !dbg !507
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !508
  %add = or disjoint i32 %i.01, 64, !dbg !509
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !510
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !510
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !511
  %mul6 = shl nuw nsw i32 %i.01, 2, !dbg !512
  %add7 = or disjoint i32 %mul6, 2, !dbg !513
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !514
  %mul9 = shl nuw nsw i32 %i.01, 2, !dbg !515
  %add10 = or disjoint i32 %mul9, 2, !dbg !516
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !517
  %mul12 = shl nuw nsw i32 %i.01, 2, !dbg !518
  %add13 = or disjoint i32 %mul12, 2, !dbg !519
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !520
  %add15 = or disjoint i32 %i.01, 64, !dbg !521
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add15, !dbg !522
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !522
  %sub = sub i16 0, %1, !dbg !523
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !524
  %inc = add nuw nsw i32 %i.01, 1, !dbg !525
    #dbg_value(i32 %inc, !498, !DIExpression(), !495)
  %exitcond.not = icmp eq i32 %inc, 64, !dbg !526
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !499, !llvm.loop !527

for.end:                                          ; preds = %for.body
  ret void, !dbg !529
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #1 !dbg !530 {
entry:
    #dbg_value(ptr %r, !531, !DIExpression(), !532)
    #dbg_value(i16 1353, !533, !DIExpression(), !532)
    #dbg_value(i32 0, !534, !DIExpression(), !532)
  br label %for.body, !dbg !535

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !534, !DIExpression(), !532)
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.01, !dbg !537
  %0 = load i16, ptr %arrayidx, align 2, !dbg !537
  %conv = sext i16 %0 to i32, !dbg !539
  %mul = mul nsw i32 %conv, 1353, !dbg !540
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !541
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.01, !dbg !542
  store i16 %call, ptr %arrayidx1, align 2, !dbg !543
  %inc = add nuw nsw i32 %i.01, 1, !dbg !544
    #dbg_value(i32 %inc, !534, !DIExpression(), !532)
  %exitcond.not = icmp eq i32 %inc, 256, !dbg !545
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !535, !llvm.loop !546

for.end:                                          ; preds = %for.body
  ret void, !dbg !548
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #1 !dbg !549 {
entry:
    #dbg_value(ptr %r, !550, !DIExpression(), !551)
    #dbg_value(ptr %a, !552, !DIExpression(), !551)
    #dbg_value(ptr %b, !553, !DIExpression(), !551)
    #dbg_value(i32 0, !554, !DIExpression(), !551)
  br label %for.body, !dbg !555

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !554, !DIExpression(), !551)
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.01, !dbg !557
  %0 = load i16, ptr %arrayidx, align 2, !dbg !557
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.01, !dbg !559
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !559
  %add = add i16 %0, %1, !dbg !560
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.01, !dbg !561
  store i16 %add, ptr %arrayidx4, align 2, !dbg !562
  %inc = add nuw nsw i32 %i.01, 1, !dbg !563
    #dbg_value(i32 %inc, !554, !DIExpression(), !551)
  %exitcond.not = icmp eq i32 %inc, 256, !dbg !564
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !555, !llvm.loop !565

for.end:                                          ; preds = %for.body
  ret void, !dbg !567
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #1 !dbg !568 {
entry:
    #dbg_value(ptr %r, !571, !DIExpression(), !572)
    #dbg_value(i32 1, !573, !DIExpression(), !572)
    #dbg_value(i32 128, !574, !DIExpression(), !572)
  br label %for.cond1.preheader, !dbg !575

for.cond1.preheader:                              ; preds = %entry, %for.inc24
  %k.05 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ]
  %len.04 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ]
    #dbg_value(i32 %k.05, !573, !DIExpression(), !572)
    #dbg_value(i32 %len.04, !574, !DIExpression(), !572)
    #dbg_value(i32 %k.05, !573, !DIExpression(), !572)
    #dbg_value(i32 0, !577, !DIExpression(), !572)
  br label %for.body3, !dbg !578

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc21
  %k.13 = phi i32 [ %k.05, %for.cond1.preheader ], [ %inc, %for.inc21 ]
  %start.02 = phi i32 [ 0, %for.cond1.preheader ], [ %add22, %for.inc21 ]
    #dbg_value(i32 %k.13, !573, !DIExpression(), !572)
    #dbg_value(i32 %start.02, !577, !DIExpression(), !572)
    #dbg_value(i32 %inc, !573, !DIExpression(), !572)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.13, !dbg !582
  %0 = load i16, ptr %arrayidx, align 2, !dbg !582
    #dbg_value(i16 %0, !585, !DIExpression(), !572)
    #dbg_value(i32 %start.02, !586, !DIExpression(), !572)
  %add = add nuw nsw i32 %start.02, %len.04, !dbg !587
  br label %for.body6, !dbg !590

for.body6:                                        ; preds = %for.body3, %for.body6
  %j.01 = phi i32 [ %start.02, %for.body3 ], [ %inc20, %for.body6 ]
    #dbg_value(i32 %j.01, !586, !DIExpression(), !572)
  %1 = getelementptr i16, ptr %r, i32 %j.01, !dbg !591
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.04, !dbg !591
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !591
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !593
    #dbg_value(i16 %call, !594, !DIExpression(), !572)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.01, !dbg !595
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !595
  %sub = sub i16 %3, %call, !dbg !596
  %4 = getelementptr i16, ptr %r, i32 %j.01, !dbg !597
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.04, !dbg !597
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !598
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.01, !dbg !599
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !599
  %add17 = add i16 %5, %call, !dbg !600
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.01, !dbg !601
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !602
  %inc20 = add nuw nsw i32 %j.01, 1, !dbg !603
    #dbg_value(i32 %inc20, !586, !DIExpression(), !572)
  %cmp5 = icmp ult i32 %inc20, %add, !dbg !604
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !590, !llvm.loop !605

for.inc21:                                        ; preds = %for.body6
  %j.0.lcssa = phi i32 [ %inc20, %for.body6 ], !dbg !607
  %inc = add i32 %k.13, 1, !dbg !608
  %add22 = add i32 %j.0.lcssa, %len.04, !dbg !609
    #dbg_value(i32 %inc, !573, !DIExpression(), !572)
    #dbg_value(i32 %add22, !577, !DIExpression(), !572)
  %cmp2 = icmp ult i32 %add22, 256, !dbg !610
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !578, !llvm.loop !611

for.inc24:                                        ; preds = %for.inc21
  %k.1.lcssa = phi i32 [ %inc, %for.inc21 ], !dbg !572
  %shr = lshr i32 %len.04, 1, !dbg !613
    #dbg_value(i32 %k.1.lcssa, !573, !DIExpression(), !572)
    #dbg_value(i32 %shr, !574, !DIExpression(), !572)
  %cmp = icmp samesign ugt i32 %shr, 1, !dbg !614
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !575, !llvm.loop !615

for.end25:                                        ; preds = %for.inc24
  ret void, !dbg !617
}

; Function Attrs: inlinehint nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #1 !dbg !618 {
entry:
    #dbg_value(i16 %a, !621, !DIExpression(), !622)
    #dbg_value(i16 %b, !623, !DIExpression(), !622)
  %conv = sext i16 %a to i32, !dbg !624
  %conv1 = sext i16 %b to i32, !dbg !625
  %mul = mul nsw i32 %conv, %conv1, !dbg !626
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !627
  ret i16 %call, !dbg !628
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #1 !dbg !629 {
entry:
    #dbg_value(ptr %r, !633, !DIExpression(), !634)
    #dbg_value(ptr %a, !635, !DIExpression(), !634)
    #dbg_value(ptr %b, !636, !DIExpression(), !634)
    #dbg_value(i16 %zeta, !637, !DIExpression(), !634)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !638
  %0 = load i16, ptr %arrayidx, align 2, !dbg !638
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !639
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !639
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !640
  store i16 %call, ptr %r, align 2, !dbg !641
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !642
  store i16 %call4, ptr %r, align 2, !dbg !643
  %2 = load i16, ptr %a, align 2, !dbg !644
  %3 = load i16, ptr %b, align 2, !dbg !645
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !646
  %4 = load i16, ptr %r, align 2, !dbg !647
  %add = add i16 %4, %call8, !dbg !647
  store i16 %add, ptr %r, align 2, !dbg !647
  %5 = load i16, ptr %a, align 2, !dbg !648
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !649
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !649
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !650
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !651
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !652
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !653
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !653
  %8 = load i16, ptr %b, align 2, !dbg !654
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !655
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !656
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !657
  %add22 = add i16 %9, %call18, !dbg !657
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !657
  ret void, !dbg !658
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #1 !dbg !659 {
entry:
    #dbg_value(ptr %r, !663, !DIExpression(), !664)
    #dbg_value(ptr %buf, !665, !DIExpression(), !664)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #3, !dbg !666
  ret void, !dbg !667
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #1 !dbg !668 {
entry:
    #dbg_value(ptr %r, !669, !DIExpression(), !670)
    #dbg_value(ptr %buf, !671, !DIExpression(), !670)
    #dbg_value(i32 0, !672, !DIExpression(), !670)
  br label %for.body, !dbg !673

for.body:                                         ; preds = %entry, %for.inc22
  %i.02 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ]
    #dbg_value(i32 %i.02, !672, !DIExpression(), !670)
  %mul = mul nuw nsw i32 %i.02, 3, !dbg !675
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !678
  %call = call fastcc i32 @load24_littleendian(ptr noundef %add.ptr) #3, !dbg !679
    #dbg_value(i32 %call, !680, !DIExpression(), !670)
  %and = and i32 %call, 2396745, !dbg !681
    #dbg_value(i32 %and, !682, !DIExpression(), !670)
  %shr = lshr i32 %call, 1, !dbg !683
  %and1 = and i32 %shr, 2396745, !dbg !684
  %add = add nuw nsw i32 %and, %and1, !dbg !685
    #dbg_value(i32 %add, !682, !DIExpression(), !670)
  %shr2 = lshr i32 %call, 2, !dbg !686
  %and3 = and i32 %shr2, 2396745, !dbg !687
  %add4 = add nuw nsw i32 %add, %and3, !dbg !688
    #dbg_value(i32 %add4, !682, !DIExpression(), !670)
    #dbg_value(i32 0, !689, !DIExpression(), !670)
  br label %for.body7, !dbg !690

for.body7:                                        ; preds = %for.body, %for.body7
  %j.01 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ]
    #dbg_value(i32 %j.01, !689, !DIExpression(), !670)
  %mul8 = mul nuw nsw i32 %j.01, 6, !dbg !692
  %shr10 = lshr i32 %add4, %mul8, !dbg !695
  %conv = and i32 %shr10, 7, !dbg !696
    #dbg_value(i32 %shr10, !697, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !670)
  %mul12 = mul nuw nsw i32 %j.01, 6, !dbg !698
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !699
  %shr14 = lshr i32 %add4, %add13, !dbg !700
  %conv16 = and i32 %shr14, 7, !dbg !701
    #dbg_value(i32 %conv16, !702, !DIExpression(), !670)
  %sub = sub nsw i32 %conv, %conv16, !dbg !703
  %conv19 = trunc nsw i32 %sub to i16, !dbg !704
  %mul20 = shl nuw nsw i32 %i.02, 2, !dbg !705
  %add21 = or disjoint i32 %mul20, %j.01, !dbg !706
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !707
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !708
  %inc = add nuw nsw i32 %j.01, 1, !dbg !709
    #dbg_value(i32 %inc, !689, !DIExpression(), !670)
  %exitcond.not = icmp eq i32 %inc, 4, !dbg !710
  br i1 %exitcond.not, label %for.inc22, label %for.body7, !dbg !690, !llvm.loop !711

for.inc22:                                        ; preds = %for.body7
  %inc23 = add nuw nsw i32 %i.02, 1, !dbg !713
    #dbg_value(i32 %inc23, !672, !DIExpression(), !670)
  %exitcond1.not = icmp eq i32 %inc23, 64, !dbg !714
  br i1 %exitcond1.not, label %for.end24, label %for.body, !dbg !673, !llvm.loop !715

for.end24:                                        ; preds = %for.inc22
  ret void, !dbg !717
}

; Function Attrs: inlinehint nounwind
define internal fastcc range(i32 0, 16777216) i32 @load24_littleendian(ptr noundef %x) unnamed_addr #1 !dbg !718 {
entry:
    #dbg_value(ptr %x, !721, !DIExpression(), !722)
  %0 = load i8, ptr %x, align 1, !dbg !723
  %conv = zext i8 %0 to i32, !dbg !724
    #dbg_value(i32 %conv, !725, !DIExpression(), !722)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !726
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !726
  %conv2 = zext i8 %1 to i32, !dbg !727
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !728
  %or = or disjoint i32 %shl, %conv, !dbg !729
    #dbg_value(i32 %or, !725, !DIExpression(), !722)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !730
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !730
  %conv4 = zext i8 %2 to i32, !dbg !731
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !732
  %or6 = or disjoint i32 %or, %shl5, !dbg !733
    #dbg_value(i32 %or6, !725, !DIExpression(), !722)
  ret i32 %or6, !dbg !734
}

; Function Attrs: inlinehint nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #1 !dbg !735 {
entry:
    #dbg_value(i32 %a, !738, !DIExpression(), !739)
    #dbg_value(i32 %a, !740, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !739)
  %sext = mul i32 %a, -218038272, !dbg !741
  %conv3 = ashr exact i32 %sext, 16, !dbg !741
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !742
  %sub = add i32 %mul4.neg, %a, !dbg !743
  %shr = lshr i32 %sub, 16, !dbg !744
  %conv5 = trunc nuw i32 %shr to i16, !dbg !745
    #dbg_value(i16 %conv5, !740, !DIExpression(), !739)
  ret i16 %conv5, !dbg !746
}

; Function Attrs: inlinehint nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #1 !dbg !747 {
entry:
    #dbg_value(i16 %a, !750, !DIExpression(), !751)
    #dbg_value(i16 20159, !752, !DIExpression(), !751)
  %conv = sext i16 %a to i32, !dbg !753
  %mul = mul nsw i32 %conv, 20159, !dbg !754
  %add = add nsw i32 %mul, 33554432, !dbg !755
  %shr = ashr i32 %add, 26, !dbg !756
    #dbg_value(i32 %shr, !757, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !751)
    #dbg_value(i32 %shr, !757, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !751)
  %0 = trunc nsw i32 %shr to i16, !dbg !758
  %1 = mul i16 %0, -3329, !dbg !758
  %conv7 = add i16 %1, %a, !dbg !758
  ret i16 %conv7, !dbg !759
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #1 !dbg !760 {
entry:
    #dbg_value(ptr %state, !764, !DIExpression(), !765)
  %0 = load i64, ptr %state, align 8, !dbg !766
    #dbg_value(i64 %0, !767, !DIExpression(), !765)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !768
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !768
    #dbg_value(i64 %1, !769, !DIExpression(), !765)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !770
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !770
    #dbg_value(i64 %2, !771, !DIExpression(), !765)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !772
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !772
    #dbg_value(i64 %3, !773, !DIExpression(), !765)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !774
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !774
    #dbg_value(i64 %4, !775, !DIExpression(), !765)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !776
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !776
    #dbg_value(i64 %5, !777, !DIExpression(), !765)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !778
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !778
    #dbg_value(i64 %6, !779, !DIExpression(), !765)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !780
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !780
    #dbg_value(i64 %7, !781, !DIExpression(), !765)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !782
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !782
    #dbg_value(i64 %8, !783, !DIExpression(), !765)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !784
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !784
    #dbg_value(i64 %9, !785, !DIExpression(), !765)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !786
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !786
    #dbg_value(i64 %10, !787, !DIExpression(), !765)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !788
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !788
    #dbg_value(i64 %11, !789, !DIExpression(), !765)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !790
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !790
    #dbg_value(i64 %12, !791, !DIExpression(), !765)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !792
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !792
    #dbg_value(i64 %13, !793, !DIExpression(), !765)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !794
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !794
    #dbg_value(i64 %14, !795, !DIExpression(), !765)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !796
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !796
    #dbg_value(i64 %15, !797, !DIExpression(), !765)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !798
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !798
    #dbg_value(i64 %16, !799, !DIExpression(), !765)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !800
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !800
    #dbg_value(i64 %17, !801, !DIExpression(), !765)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !802
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !802
    #dbg_value(i64 %18, !803, !DIExpression(), !765)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !804
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !804
    #dbg_value(i64 %19, !805, !DIExpression(), !765)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !806
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !806
    #dbg_value(i64 %20, !807, !DIExpression(), !765)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !808
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !808
    #dbg_value(i64 %21, !809, !DIExpression(), !765)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !810
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !810
    #dbg_value(i64 %22, !811, !DIExpression(), !765)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !812
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !812
    #dbg_value(i64 %23, !813, !DIExpression(), !765)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !814
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !814
    #dbg_value(i64 %24, !815, !DIExpression(), !765)
    #dbg_value(i32 0, !816, !DIExpression(), !765)
    #dbg_value(i64 %0, !767, !DIExpression(), !765)
    #dbg_value(i64 %1, !769, !DIExpression(), !765)
    #dbg_value(i64 %2, !771, !DIExpression(), !765)
    #dbg_value(i64 %3, !773, !DIExpression(), !765)
    #dbg_value(i64 %4, !775, !DIExpression(), !765)
    #dbg_value(i64 %5, !777, !DIExpression(), !765)
    #dbg_value(i64 %6, !779, !DIExpression(), !765)
    #dbg_value(i64 %7, !781, !DIExpression(), !765)
    #dbg_value(i64 %8, !783, !DIExpression(), !765)
    #dbg_value(i64 %9, !785, !DIExpression(), !765)
    #dbg_value(i64 %10, !787, !DIExpression(), !765)
    #dbg_value(i64 %11, !789, !DIExpression(), !765)
    #dbg_value(i64 %12, !791, !DIExpression(), !765)
    #dbg_value(i64 %13, !793, !DIExpression(), !765)
    #dbg_value(i64 %14, !795, !DIExpression(), !765)
    #dbg_value(i64 %15, !797, !DIExpression(), !765)
    #dbg_value(i64 %16, !799, !DIExpression(), !765)
    #dbg_value(i64 %17, !801, !DIExpression(), !765)
    #dbg_value(i64 %18, !803, !DIExpression(), !765)
    #dbg_value(i64 %19, !805, !DIExpression(), !765)
    #dbg_value(i64 %20, !807, !DIExpression(), !765)
    #dbg_value(i64 %21, !809, !DIExpression(), !765)
    #dbg_value(i64 %22, !811, !DIExpression(), !765)
    #dbg_value(i64 %23, !813, !DIExpression(), !765)
  br label %for.inc, !dbg !817

for.inc:                                          ; preds = %entry, %for.inc
  %Asu.026 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ]
  %round.025 = phi i32 [ 0, %entry ], [ %add448, %for.inc ]
  %Aba.024 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ]
  %Abe.023 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ]
  %Abi.022 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ]
  %Abo.021 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ]
  %Abu.020 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ]
  %Aga.019 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ]
  %Age.018 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ]
  %Agi.017 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ]
  %Ago.016 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ]
  %Agu.015 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ]
  %Aka.014 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ]
  %Ake.013 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ]
  %Aki.012 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ]
  %Ako.011 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ]
  %Aku.010 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ]
  %Ama.09 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ]
  %Ame.08 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ]
  %Ami.07 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ]
  %Amo.06 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ]
  %Amu.05 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ]
  %Asa.04 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ]
  %Ase.03 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ]
  %Asi.02 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ]
  %Aso.01 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ]
    #dbg_value(i32 %round.025, !816, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !820, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !822, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 poison, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 poison, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 poison, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 poison, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 poison, !853, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor32 = xor i64 %Abi.022, %Agi.017, !dbg !854
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.02, i64 %Ami.07, i64 %Aki.012), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor33 = xor i64 %xor32, %Aki.012, !dbg !857
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.02, i64 %Ami.07), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor34 = xor i64 %xor33, %Ami.07, !dbg !858
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.02), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor35 = xor i64 %xor34, %Asi.02, !dbg !859
    #dbg_value(i64 %xor35, !849, !DIExpression(), !765)
  %xor40 = xor i64 %Abu.020, %Agu.015, !dbg !860
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.026, i64 %Amu.05, i64 %Aku.010), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor41 = xor i64 %xor40, %Aku.010, !dbg !861
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.026, i64 %Amu.05), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor42 = xor i64 %xor41, %Amu.05, !dbg !862
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.026), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor43 = xor i64 %xor42, %Asu.026, !dbg !863
    #dbg_value(i64 %xor43, !853, !DIExpression(), !765)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !864
    #dbg_value(!DIArgList(i64 %Ago.016, i64 %xor35, i64 %xor56), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abo.021, i64 %xor35, i64 %xor56), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ako.011, i64 %xor35, i64 %xor56), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Amo.06, i64 %xor35, i64 %xor56), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aso.01, i64 %xor35, i64 %xor56), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !822, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor57 = xor i64 %xor35, %xor56, !dbg !865
    #dbg_value(!DIArgList(i64 %Ago.016, i64 %xor57), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abo.021, i64 %xor57), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ako.011, i64 %xor57), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Amo.06, i64 %xor57), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aso.01, i64 %xor57), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 %xor57, !822, !DIExpression(), !765)
  %xor203 = xor i64 %Ago.016, %xor57, !dbg !866
    #dbg_value(i64 %xor203, !783, !DIExpression(), !765)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !867
    #dbg_value(i64 %xor206, !847, !DIExpression(), !765)
  %xor28 = xor i64 %Abe.023, %Age.018, !dbg !868
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.03, i64 %Ame.08, i64 %Ake.013), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor29 = xor i64 %xor28, %Ake.013, !dbg !869
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.03, i64 %Ame.08), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor30 = xor i64 %xor29, %Ame.08, !dbg !870
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.03), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor31 = xor i64 %xor30, %Ase.03, !dbg !871
    #dbg_value(i64 %xor31, !847, !DIExpression(), !765)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !872
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor43, i64 %xor44), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor43, i64 %xor44), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aka.014, i64 %xor43, i64 %xor44), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aga.019, i64 %xor43, i64 %xor44), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asa.04, i64 %xor43, i64 %xor44), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ama.09, i64 %xor43, i64 %xor44), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor45 = xor i64 %xor43, %xor44, !dbg !873
    #dbg_value(i64 %xor45, !819, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor45), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor45), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aka.014, i64 %xor45), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aga.019, i64 %xor45), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asa.04, i64 %xor45), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ama.09, i64 %xor45), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor211 = xor i64 %Ama.09, %xor45, !dbg !874
    #dbg_value(i64 %xor211, !797, !DIExpression(), !765)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !875
    #dbg_value(i64 %xor214, !851, !DIExpression(), !765)
  %xor36 = xor i64 %Abo.021, %Ago.016, !dbg !876
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.01, i64 %Amo.06, i64 %Ako.011), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor37 = xor i64 %xor36, %Ako.011, !dbg !877
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.01, i64 %Amo.06), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor38 = xor i64 %xor37, %Amo.06, !dbg !878
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.01), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor39 = xor i64 %xor38, %Aso.01, !dbg !879
    #dbg_value(i64 %xor39, !851, !DIExpression(), !765)
  %xor = xor i64 %Aba.024, %Aga.019, !dbg !880
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.04, i64 %Ama.09, i64 %Aka.014), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor25 = xor i64 %xor, %Aka.014, !dbg !881
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.04, i64 %Ama.09), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor26 = xor i64 %xor25, %Ama.09, !dbg !882
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.04), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor27 = xor i64 %xor26, %Asa.04, !dbg !883
    #dbg_value(i64 %xor27, !845, !DIExpression(), !765)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !884
    #dbg_value(!DIArgList(i64 %Agu.015, i64 %xor39, i64 %xor60), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abu.020, i64 %xor39, i64 %xor60), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asu.026, i64 %xor39, i64 %xor60), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Amu.05, i64 %xor39, i64 %xor60), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aku.010, i64 %xor39, i64 %xor60), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor61 = xor i64 %xor39, %xor60, !dbg !885
    #dbg_value(!DIArgList(i64 %Agu.015, i64 %xor61), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abu.020, i64 %xor61), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asu.026, i64 %xor61), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Amu.05, i64 %xor61), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 %xor61, !823, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %Aku.010, i64 %xor61), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor207 = xor i64 %Aku.010, %xor61, !dbg !886
    #dbg_value(i64 %xor207, !795, !DIExpression(), !765)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !887
    #dbg_value(i64 %xor210, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not222 = xor i64 %xor210, -1, !dbg !888
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and223 = and i64 %xor214, %not222, !dbg !889
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor224 = xor i64 %xor206, %and223, !dbg !890
    #dbg_value(i64 %xor224, !852, !DIExpression(), !765)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !891
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Aki.012, i64 %xor31, i64 %xor52), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Agi.017, i64 %xor31, i64 %xor52), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abi.022, i64 %xor31, i64 %xor52), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asi.02, i64 %xor31, i64 %xor52), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ami.07, i64 %xor31, i64 %xor52), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor53 = xor i64 %xor31, %xor52, !dbg !892
    #dbg_value(i64 %xor53, !821, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %Aki.012, i64 %xor53), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Agi.017, i64 %xor53), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abi.022, i64 %xor53), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Asi.02, i64 %xor53), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ami.07, i64 %xor53), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor67 = xor i64 %Aki.012, %xor53, !dbg !893
    #dbg_value(i64 %xor67, !791, !DIExpression(), !765)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !894
    #dbg_value(i64 %xor70, !849, !DIExpression(), !765)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !895
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !820, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Age.018, i64 %xor27, i64 %xor48), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abe.023, i64 %xor27, i64 %xor48), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ake.013, i64 %xor27, i64 %xor48), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ame.08, i64 %xor27, i64 %xor48), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ase.03, i64 %xor27, i64 %xor48), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor49 = xor i64 %xor27, %xor48, !dbg !896
    #dbg_value(i64 %xor49, !820, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %Age.018, i64 %xor49), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Abe.023, i64 %xor49), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ake.013, i64 %xor49), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ame.08, i64 %xor49), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %Ase.03, i64 %xor49), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor63 = xor i64 %Age.018, %xor49, !dbg !897
    #dbg_value(i64 %xor63, !779, !DIExpression(), !765)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !898
    #dbg_value(i64 %xor66, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor70, i64 %xor45, i64 %xor66), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not = xor i64 %xor66, -1, !dbg !899
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %xor70, i64 %xor45, i64 %not), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and = and i64 %xor70, %not, !dbg !900
    #dbg_value(!DIArgList(i64 %Aba.024, i64 %and, i64 %xor45), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.025, !dbg !901
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !901
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.024, i64 %xor45, i64 %25), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %26 = xor i64 %and, %25, !dbg !902
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.024, i64 %xor45), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor62 = xor i64 %Aba.024, %xor45, !dbg !903
    #dbg_value(i64 %xor62, !767, !DIExpression(), !765)
    #dbg_value(i64 %xor62, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor81 = xor i64 %26, %xor62, !dbg !902
    #dbg_value(i64 %xor81, !824, !DIExpression(), !765)
  %xor94 = xor i64 %Abo.021, %xor57, !dbg !904
    #dbg_value(i64 %xor94, !773, !DIExpression(), !765)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !905
    #dbg_value(i64 %xor97, !845, !DIExpression(), !765)
  %xor102 = xor i64 %Aka.014, %xor45, !dbg !906
    #dbg_value(i64 %xor102, !787, !DIExpression(), !765)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !907
    #dbg_value(i64 %xor105, !849, !DIExpression(), !765)
  %xor98 = xor i64 %Agu.015, %xor61, !dbg !908
    #dbg_value(i64 %xor98, !785, !DIExpression(), !765)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !909
    #dbg_value(i64 %xor101, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not114 = xor i64 %xor101, -1, !dbg !910
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and115 = and i64 %xor105, %not114, !dbg !911
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor116 = xor i64 %xor97, %and115, !dbg !912
    #dbg_value(i64 %xor116, !840, !DIExpression(), !765)
  %xor234 = xor i64 %xor81, %xor116, !dbg !913
  %xor129 = xor i64 %Abe.023, %xor49, !dbg !914
    #dbg_value(i64 %xor129, !769, !DIExpression(), !765)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !915
    #dbg_value(i64 %xor132, !845, !DIExpression(), !765)
  %xor137 = xor i64 %Ako.011, %xor57, !dbg !916
    #dbg_value(i64 %xor137, !793, !DIExpression(), !765)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !917
    #dbg_value(i64 %xor140, !849, !DIExpression(), !765)
  %xor133 = xor i64 %Agi.017, %xor53, !dbg !918
    #dbg_value(i64 %xor133, !781, !DIExpression(), !765)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !919
    #dbg_value(i64 %xor136, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not149 = xor i64 %xor136, -1, !dbg !920
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and150 = and i64 %xor140, %not149, !dbg !921
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor151 = xor i64 %xor132, %and150, !dbg !922
    #dbg_value(i64 %xor151, !831, !DIExpression(), !765)
  %xor235 = xor i64 %xor234, %xor151, !dbg !923
  %xor164 = xor i64 %Abu.020, %xor61, !dbg !924
    #dbg_value(i64 %xor164, !775, !DIExpression(), !765)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !925
    #dbg_value(i64 %xor167, !845, !DIExpression(), !765)
  %xor172 = xor i64 %Ake.013, %xor49, !dbg !926
    #dbg_value(i64 %xor172, !789, !DIExpression(), !765)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !927
    #dbg_value(i64 %xor175, !849, !DIExpression(), !765)
  %xor168 = xor i64 %Aga.019, %xor45, !dbg !928
    #dbg_value(i64 %xor168, !777, !DIExpression(), !765)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !929
    #dbg_value(i64 %xor171, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not184 = xor i64 %xor171, -1, !dbg !930
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and185 = and i64 %xor175, %not184, !dbg !931
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor186 = xor i64 %xor167, %and185, !dbg !932
    #dbg_value(i64 %xor186, !850, !DIExpression(), !765)
  %xor236 = xor i64 %xor235, %xor186, !dbg !933
  %xor199 = xor i64 %Abi.022, %xor53, !dbg !934
    #dbg_value(i64 %xor199, !771, !DIExpression(), !765)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !935
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not219 = xor i64 %xor206, -1, !dbg !936
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and220 = and i64 %xor210, %not219, !dbg !937
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor221 = xor i64 %xor202, %and220, !dbg !938
    #dbg_value(i64 %xor221, !838, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor237 = xor i64 %xor236, %xor221, !dbg !939
    #dbg_value(i64 %xor237, !845, !DIExpression(), !765)
  %xor75 = xor i64 %Asu.026, %xor61, !dbg !940
    #dbg_value(i64 %xor75, !815, !DIExpression(), !765)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !941
    #dbg_value(i64 %xor78, !853, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor71 = xor i64 %Amo.06, %xor57, !dbg !942
    #dbg_value(i64 %xor71, !803, !DIExpression(), !765)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !943
    #dbg_value(i64 %xor74, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not85 = xor i64 %xor74, -1, !dbg !944
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and86 = and i64 %xor78, %not85, !dbg !945
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor87 = xor i64 %xor70, %and86, !dbg !946
    #dbg_value(i64 %xor87, !844, !DIExpression(), !765)
  %xor110 = xor i64 %Asi.02, %xor53, !dbg !947
    #dbg_value(i64 %xor110, !811, !DIExpression(), !765)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !948
    #dbg_value(i64 %xor113, !853, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor106 = xor i64 %Ame.08, %xor49, !dbg !949
    #dbg_value(i64 %xor106, !799, !DIExpression(), !765)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !950
    #dbg_value(i64 %xor109, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not120 = xor i64 %xor109, -1, !dbg !951
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and121 = and i64 %xor113, %not120, !dbg !952
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor122 = xor i64 %xor105, %and121, !dbg !953
    #dbg_value(i64 %xor122, !835, !DIExpression(), !765)
  %xor242 = xor i64 %xor87, %xor122, !dbg !954
  %xor145 = xor i64 %Asa.04, %xor45, !dbg !955
    #dbg_value(i64 %xor145, !807, !DIExpression(), !765)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !956
    #dbg_value(i64 %xor148, !853, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor141 = xor i64 %Amu.05, %xor61, !dbg !957
    #dbg_value(i64 %xor141, !805, !DIExpression(), !765)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !958
    #dbg_value(i64 %xor144, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not155 = xor i64 %xor144, -1, !dbg !959
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and156 = and i64 %xor148, %not155, !dbg !960
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor157 = xor i64 %xor140, %and156, !dbg !961
    #dbg_value(i64 %xor157, !826, !DIExpression(), !765)
  %xor243 = xor i64 %xor242, %xor157, !dbg !962
  %xor180 = xor i64 %Aso.01, %xor57, !dbg !963
    #dbg_value(i64 %xor180, !813, !DIExpression(), !765)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !964
    #dbg_value(i64 %xor183, !853, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor176 = xor i64 %Ami.07, %xor53, !dbg !965
    #dbg_value(i64 %xor176, !801, !DIExpression(), !765)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !966
    #dbg_value(i64 %xor179, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %not190 = xor i64 %xor179, -1, !dbg !967
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and191 = and i64 %xor183, %not190, !dbg !968
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor192 = xor i64 %xor175, %and191, !dbg !969
    #dbg_value(i64 %xor192, !842, !DIExpression(), !765)
  %xor244 = xor i64 %xor243, %xor192, !dbg !970
  %xor215 = xor i64 %Ase.03, %xor49, !dbg !971
    #dbg_value(i64 %xor215, !809, !DIExpression(), !765)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !972
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not225 = xor i64 %xor214, -1, !dbg !973
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and226 = and i64 %xor218, %not225, !dbg !974
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor227 = xor i64 %xor210, %and226, !dbg !975
    #dbg_value(i64 %xor227, !833, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor245 = xor i64 %xor244, %xor227, !dbg !976
    #dbg_value(i64 %xor245, !849, !DIExpression(), !765)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !977
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !820, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor261 = xor i64 %xor237, %xor260, !dbg !978
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 %xor261, !820, !DIExpression(), !765)
  %xor429 = xor i64 %xor224, %xor261, !dbg !979
    #dbg_value(i64 %xor429, !852, !DIExpression(), !765)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !980
    #dbg_value(i64 %xor432, !853, !DIExpression(), !765)
  %not123 = xor i64 %xor113, -1, !dbg !981
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and124 = and i64 %xor97, %not123, !dbg !982
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor125 = xor i64 %xor109, %and124, !dbg !983
    #dbg_value(i64 %xor125, !846, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not91 = xor i64 %xor62, -1, !dbg !984
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and92 = and i64 %xor66, %not91, !dbg !985
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor93 = xor i64 %xor78, %and92, !dbg !986
    #dbg_value(i64 %xor93, !839, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not126 = xor i64 %xor97, -1, !dbg !987
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and127 = and i64 %xor101, %not126, !dbg !988
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor128 = xor i64 %xor113, %and127, !dbg !989
    #dbg_value(i64 %xor128, !830, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor250 = xor i64 %xor93, %xor128, !dbg !990
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not161 = xor i64 %xor132, -1, !dbg !991
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and162 = and i64 %xor136, %not161, !dbg !992
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor163 = xor i64 %xor148, %and162, !dbg !993
    #dbg_value(i64 %xor163, !848, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor251 = xor i64 %xor250, %xor163, !dbg !994
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not196 = xor i64 %xor167, -1, !dbg !995
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and197 = and i64 %xor171, %not196, !dbg !996
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor198 = xor i64 %xor183, %and197, !dbg !997
    #dbg_value(i64 %xor198, !837, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor252 = xor i64 %xor251, %xor198, !dbg !998
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not231 = xor i64 %xor202, -1, !dbg !999
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %and232 = and i64 %xor206, %not231, !dbg !1000
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor233 = xor i64 %xor218, %and232, !dbg !1001
    #dbg_value(i64 %xor233, !828, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor253 = xor i64 %xor252, %xor233, !dbg !1002
    #dbg_value(i64 %xor253, !853, !DIExpression(), !765)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !1003
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !822, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor269 = xor i64 %xor245, %xor268, !dbg !1004
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 %xor269, !822, !DIExpression(), !765)
  %xor417 = xor i64 %xor125, %xor269, !dbg !1005
    #dbg_value(i64 %xor417, !846, !DIExpression(), !765)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !1006
    #dbg_value(i64 %xor420, !847, !DIExpression(), !765)
  %not82 = xor i64 %xor70, -1, !dbg !1007
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and83 = and i64 %xor74, %not82, !dbg !1008
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor84 = xor i64 %xor66, %and83, !dbg !1009
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %not117 = xor i64 %xor105, -1, !dbg !1010
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and118 = and i64 %xor109, %not117, !dbg !1011
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor119 = xor i64 %xor101, %and118, !dbg !1012
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor238 = xor i64 %xor84, %xor119, !dbg !1013
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %not152 = xor i64 %xor140, -1, !dbg !1014
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and153 = and i64 %xor144, %not152, !dbg !1015
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor154 = xor i64 %xor136, %and153, !dbg !1016
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor239 = xor i64 %xor238, %xor154, !dbg !1017
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %not187 = xor i64 %xor175, -1, !dbg !1018
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and188 = and i64 %xor179, %not187, !dbg !1019
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor189 = xor i64 %xor171, %and188, !dbg !1020
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor240 = xor i64 %xor239, %xor189, !dbg !1021
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor241 = xor i64 %xor240, %xor224, !dbg !1022
    #dbg_value(i64 %xor241, !847, !DIExpression(), !765)
  %not88 = xor i64 %xor78, -1, !dbg !1023
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and89 = and i64 %xor62, %not88, !dbg !1024
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor90 = xor i64 %xor74, %and89, !dbg !1025
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !829, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor246 = xor i64 %xor90, %xor125, !dbg !1026
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not158 = xor i64 %xor148, -1, !dbg !1027
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and159 = and i64 %xor132, %not158, !dbg !1028
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor160 = xor i64 %xor144, %and159, !dbg !1029
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor247 = xor i64 %xor246, %xor160, !dbg !1030
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not193 = xor i64 %xor183, -1, !dbg !1031
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and194 = and i64 %xor167, %not193, !dbg !1032
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor195 = xor i64 %xor179, %and194, !dbg !1033
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !827, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor248 = xor i64 %xor247, %xor195, !dbg !1034
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %not228 = xor i64 %xor218, -1, !dbg !1035
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and229 = and i64 %xor202, %not228, !dbg !1036
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor230 = xor i64 %xor214, %and229, !dbg !1037
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor249 = xor i64 %xor248, %xor230, !dbg !1038
    #dbg_value(i64 %xor249, !851, !DIExpression(), !765)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !1039
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor265 = xor i64 %xor241, %xor264, !dbg !1040
    #dbg_value(i64 %xor265, !821, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !826, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor413 = xor i64 %xor87, %xor265, !dbg !1041
    #dbg_value(i64 %xor413, !844, !DIExpression(), !765)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !1042
    #dbg_value(i64 %xor416, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not445 = xor i64 %xor416, -1, !dbg !1043
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and446 = and i64 %xor420, %not445, !dbg !1044
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor447 = xor i64 %xor432, %and446, !dbg !1045
    #dbg_value(i64 %xor447, !815, !DIExpression(), !765)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !1046
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor257 = xor i64 %xor253, %xor256, !dbg !1047
    #dbg_value(i64 %xor257, !819, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !831, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !824, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor425 = xor i64 %xor186, %xor257, !dbg !1048
    #dbg_value(i64 %xor425, !850, !DIExpression(), !765)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !1049
    #dbg_value(i64 %xor428, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not442 = xor i64 %xor432, -1, !dbg !1050
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and443 = and i64 %xor416, %not442, !dbg !1051
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor444 = xor i64 %xor428, %and443, !dbg !1052
    #dbg_value(i64 %xor444, !813, !DIExpression(), !765)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !1053
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !765)
  %xor273 = xor i64 %xor249, %xor272, !dbg !1054
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !830, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(i64 %xor273, !823, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor421 = xor i64 %xor163, %xor273, !dbg !1055
    #dbg_value(i64 %xor421, !848, !DIExpression(), !765)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !1056
    #dbg_value(i64 %xor424, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not439 = xor i64 %xor428, -1, !dbg !1057
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and440 = and i64 %xor432, %not439, !dbg !1058
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor441 = xor i64 %xor424, %and440, !dbg !1059
    #dbg_value(i64 %xor441, !811, !DIExpression(), !765)
  %not436 = xor i64 %xor424, -1, !dbg !1060
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and437 = and i64 %xor428, %not436, !dbg !1061
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor438 = xor i64 %xor420, %and437, !dbg !1062
    #dbg_value(i64 %xor438, !809, !DIExpression(), !765)
  %not433 = xor i64 %xor420, -1, !dbg !1063
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and434 = and i64 %xor424, %not433, !dbg !1064
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor435 = xor i64 %xor416, %and434, !dbg !1065
    #dbg_value(i64 %xor435, !807, !DIExpression(), !765)
  %xor394 = xor i64 %xor230, %xor269, !dbg !1066
    #dbg_value(i64 %xor394, !843, !DIExpression(), !765)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !1067
    #dbg_value(i64 %xor397, !853, !DIExpression(), !765)
  %xor382 = xor i64 %xor116, %xor257, !dbg !1068
    #dbg_value(i64 %xor382, !840, !DIExpression(), !765)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !1069
    #dbg_value(i64 %xor385, !847, !DIExpression(), !765)
  %xor378 = xor i64 %xor93, %xor273, !dbg !1070
    #dbg_value(i64 %xor378, !839, !DIExpression(), !765)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !1071
    #dbg_value(i64 %xor381, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not410 = xor i64 %xor381, -1, !dbg !1072
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and411 = and i64 %xor385, %not410, !dbg !1073
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor412 = xor i64 %xor397, %and411, !dbg !1074
    #dbg_value(i64 %xor412, !805, !DIExpression(), !765)
  %xor390 = xor i64 %xor192, %xor265, !dbg !1075
    #dbg_value(i64 %xor390, !842, !DIExpression(), !765)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !1076
    #dbg_value(i64 %xor393, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not407 = xor i64 %xor397, -1, !dbg !1077
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and408 = and i64 %xor381, %not407, !dbg !1078
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor409 = xor i64 %xor393, %and408, !dbg !1079
    #dbg_value(i64 %xor409, !803, !DIExpression(), !765)
  %xor386 = xor i64 %xor154, %xor261, !dbg !1080
    #dbg_value(i64 %xor386, !841, !DIExpression(), !765)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !1081
    #dbg_value(i64 %xor389, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not404 = xor i64 %xor393, -1, !dbg !1082
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and405 = and i64 %xor397, %not404, !dbg !1083
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor406 = xor i64 %xor389, %and405, !dbg !1084
    #dbg_value(i64 %xor406, !801, !DIExpression(), !765)
  %not401 = xor i64 %xor389, -1, !dbg !1085
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and402 = and i64 %xor393, %not401, !dbg !1086
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor403 = xor i64 %xor385, %and402, !dbg !1087
    #dbg_value(i64 %xor403, !799, !DIExpression(), !765)
  %not398 = xor i64 %xor385, -1, !dbg !1088
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and399 = and i64 %xor389, %not398, !dbg !1089
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor400 = xor i64 %xor381, %and399, !dbg !1090
    #dbg_value(i64 %xor400, !797, !DIExpression(), !765)
  %xor359 = xor i64 %xor221, %xor257, !dbg !1091
    #dbg_value(i64 %xor359, !838, !DIExpression(), !765)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !1092
    #dbg_value(i64 %xor362, !853, !DIExpression(), !765)
  %xor347 = xor i64 %xor122, %xor265, !dbg !1093
    #dbg_value(i64 %xor347, !835, !DIExpression(), !765)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !1094
    #dbg_value(i64 %xor350, !847, !DIExpression(), !765)
  %xor343 = xor i64 %xor84, %xor261, !dbg !1095
    #dbg_value(i64 %xor343, !834, !DIExpression(), !765)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !1096
    #dbg_value(i64 %xor346, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not375 = xor i64 %xor346, -1, !dbg !1097
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and376 = and i64 %xor350, %not375, !dbg !1098
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor377 = xor i64 %xor362, %and376, !dbg !1099
    #dbg_value(i64 %xor377, !795, !DIExpression(), !765)
  %xor355 = xor i64 %xor198, %xor273, !dbg !1100
    #dbg_value(i64 %xor355, !837, !DIExpression(), !765)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !1101
    #dbg_value(i64 %xor358, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not372 = xor i64 %xor362, -1, !dbg !1102
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and373 = and i64 %xor346, %not372, !dbg !1103
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor374 = xor i64 %xor358, %and373, !dbg !1104
    #dbg_value(i64 %xor374, !793, !DIExpression(), !765)
  %xor351 = xor i64 %xor160, %xor269, !dbg !1105
    #dbg_value(i64 %xor351, !836, !DIExpression(), !765)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !1106
    #dbg_value(i64 %xor354, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not369 = xor i64 %xor358, -1, !dbg !1107
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and370 = and i64 %xor362, %not369, !dbg !1108
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor371 = xor i64 %xor354, %and370, !dbg !1109
    #dbg_value(i64 %xor371, !791, !DIExpression(), !765)
  %not366 = xor i64 %xor354, -1, !dbg !1110
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and367 = and i64 %xor358, %not366, !dbg !1111
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor368 = xor i64 %xor350, %and367, !dbg !1112
    #dbg_value(i64 %xor368, !789, !DIExpression(), !765)
  %not363 = xor i64 %xor350, -1, !dbg !1113
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and364 = and i64 %xor354, %not363, !dbg !1114
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor365 = xor i64 %xor346, %and364, !dbg !1115
    #dbg_value(i64 %xor365, !787, !DIExpression(), !765)
  %xor324 = xor i64 %xor227, %xor265, !dbg !1116
    #dbg_value(i64 %xor324, !833, !DIExpression(), !765)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !1117
    #dbg_value(i64 %xor327, !853, !DIExpression(), !765)
  %xor312 = xor i64 %xor128, %xor273, !dbg !1118
    #dbg_value(i64 %xor312, !830, !DIExpression(), !765)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !1119
    #dbg_value(i64 %xor315, !847, !DIExpression(), !765)
  %xor308 = xor i64 %xor90, %xor269, !dbg !1120
    #dbg_value(i64 %xor308, !829, !DIExpression(), !765)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !1121
    #dbg_value(i64 %xor311, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not340 = xor i64 %xor311, -1, !dbg !1122
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and341 = and i64 %xor315, %not340, !dbg !1123
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor342 = xor i64 %xor327, %and341, !dbg !1124
    #dbg_value(i64 %xor342, !785, !DIExpression(), !765)
  %xor320 = xor i64 %xor189, %xor261, !dbg !1125
    #dbg_value(i64 %xor320, !832, !DIExpression(), !765)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !1126
    #dbg_value(i64 %xor323, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not337 = xor i64 %xor327, -1, !dbg !1127
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and338 = and i64 %xor311, %not337, !dbg !1128
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor339 = xor i64 %xor323, %and338, !dbg !1129
    #dbg_value(i64 %xor339, !783, !DIExpression(), !765)
  %xor316 = xor i64 %xor151, %xor257, !dbg !1130
    #dbg_value(i64 %xor316, !831, !DIExpression(), !765)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !1131
    #dbg_value(i64 %xor319, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not334 = xor i64 %xor323, -1, !dbg !1132
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and335 = and i64 %xor327, %not334, !dbg !1133
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor336 = xor i64 %xor319, %and335, !dbg !1134
    #dbg_value(i64 %xor336, !781, !DIExpression(), !765)
  %not331 = xor i64 %xor319, -1, !dbg !1135
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and332 = and i64 %xor323, %not331, !dbg !1136
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor333 = xor i64 %xor315, %and332, !dbg !1137
    #dbg_value(i64 %xor333, !779, !DIExpression(), !765)
  %not328 = xor i64 %xor315, -1, !dbg !1138
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and329 = and i64 %xor319, %not328, !dbg !1139
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor330 = xor i64 %xor311, %and329, !dbg !1140
    #dbg_value(i64 %xor330, !777, !DIExpression(), !765)
  %xor287 = xor i64 %xor233, %xor273, !dbg !1141
    #dbg_value(i64 %xor287, !828, !DIExpression(), !765)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !1142
    #dbg_value(i64 %xor290, !853, !DIExpression(), !765)
  %xor275 = xor i64 %xor119, %xor261, !dbg !1143
    #dbg_value(i64 %xor275, !825, !DIExpression(), !765)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !1144
    #dbg_value(i64 %xor278, !847, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %xor274 = xor i64 %xor81, %xor257, !dbg !1145
    #dbg_value(i64 %xor274, !824, !DIExpression(), !765)
    #dbg_value(i64 %xor274, !845, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not305 = xor i64 %xor274, -1, !dbg !1146
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and306 = and i64 %xor278, %not305, !dbg !1147
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !775, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor307 = xor i64 %xor290, %and306, !dbg !1148
    #dbg_value(i64 %xor307, !775, !DIExpression(), !765)
  %xor283 = xor i64 %xor195, %xor269, !dbg !1149
    #dbg_value(i64 %xor283, !827, !DIExpression(), !765)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !1150
    #dbg_value(i64 %xor286, !851, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not302 = xor i64 %xor290, -1, !dbg !1151
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and303 = and i64 %xor274, %not302, !dbg !1152
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !773, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor304 = xor i64 %xor286, %and303, !dbg !1153
    #dbg_value(i64 %xor304, !773, !DIExpression(), !765)
  %xor279 = xor i64 %xor157, %xor265, !dbg !1154
    #dbg_value(i64 %xor279, !826, !DIExpression(), !765)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !1155
    #dbg_value(i64 %xor282, !849, !DIExpression(), !765)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %not299 = xor i64 %xor286, -1, !dbg !1156
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and300 = and i64 %xor290, %not299, !dbg !1157
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !771, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor301 = xor i64 %xor282, %and300, !dbg !1158
    #dbg_value(i64 %xor301, !771, !DIExpression(), !765)
  %not296 = xor i64 %xor282, -1, !dbg !1159
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !765)
  %and297 = and i64 %xor286, %not296, !dbg !1160
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !769, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %xor298 = xor i64 %xor278, %and297, !dbg !1161
    #dbg_value(i64 %xor298, !769, !DIExpression(), !765)
  %add = or disjoint i32 %round.025, 1, !dbg !1162
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !1163
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !1163
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %not291 = xor i64 %xor278, -1, !dbg !1164
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %and292 = and i64 %xor282, %not291, !dbg !1165
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !767, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !765)
  %28 = xor i64 %and292, %27, !dbg !1166
  %xor295 = xor i64 %28, %xor274, !dbg !1166
    #dbg_value(i64 %xor295, !767, !DIExpression(), !765)
  %add448 = add nuw nsw i32 %round.025, 2, !dbg !1167
    #dbg_value(i32 %add448, !816, !DIExpression(), !765)
  %cmp = icmp samesign ult i32 %add448, 24, !dbg !1168
  br i1 %cmp, label %for.inc, label %for.end, !dbg !817, !llvm.loop !1169

for.end:                                          ; preds = %for.inc
  %Aso.0.lcssa = phi i64 [ %xor444, %for.inc ], !dbg !765
  %Asi.0.lcssa = phi i64 [ %xor441, %for.inc ], !dbg !765
  %Ase.0.lcssa = phi i64 [ %xor438, %for.inc ], !dbg !765
  %Asa.0.lcssa = phi i64 [ %xor435, %for.inc ], !dbg !765
  %Amu.0.lcssa = phi i64 [ %xor412, %for.inc ], !dbg !765
  %Amo.0.lcssa = phi i64 [ %xor409, %for.inc ], !dbg !765
  %Ami.0.lcssa = phi i64 [ %xor406, %for.inc ], !dbg !765
  %Ame.0.lcssa = phi i64 [ %xor403, %for.inc ], !dbg !765
  %Ama.0.lcssa = phi i64 [ %xor400, %for.inc ], !dbg !765
  %Aku.0.lcssa = phi i64 [ %xor377, %for.inc ], !dbg !765
  %Ako.0.lcssa = phi i64 [ %xor374, %for.inc ], !dbg !765
  %Aki.0.lcssa = phi i64 [ %xor371, %for.inc ], !dbg !765
  %Ake.0.lcssa = phi i64 [ %xor368, %for.inc ], !dbg !765
  %Aka.0.lcssa = phi i64 [ %xor365, %for.inc ], !dbg !765
  %Agu.0.lcssa = phi i64 [ %xor342, %for.inc ], !dbg !765
  %Ago.0.lcssa = phi i64 [ %xor339, %for.inc ], !dbg !765
  %Agi.0.lcssa = phi i64 [ %xor336, %for.inc ], !dbg !765
  %Age.0.lcssa = phi i64 [ %xor333, %for.inc ], !dbg !765
  %Aga.0.lcssa = phi i64 [ %xor330, %for.inc ], !dbg !765
  %Abu.0.lcssa = phi i64 [ %xor307, %for.inc ], !dbg !765
  %Abo.0.lcssa = phi i64 [ %xor304, %for.inc ], !dbg !765
  %Abi.0.lcssa = phi i64 [ %xor301, %for.inc ], !dbg !765
  %Abe.0.lcssa = phi i64 [ %xor298, %for.inc ], !dbg !765
  %Aba.0.lcssa = phi i64 [ %xor295, %for.inc ], !dbg !765
  %Asu.0.lcssa = phi i64 [ %xor447, %for.inc ], !dbg !765
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !1171
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1172
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !1173
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1174
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !1175
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1176
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !1177
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1178
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !1179
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1180
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !1181
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1182
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !1183
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1184
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !1185
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1186
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !1187
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1188
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !1189
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1190
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !1191
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1192
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !1193
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1194
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !1195
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1196
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !1197
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1198
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !1199
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1200
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !1201
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1202
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !1203
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1204
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !1205
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1206
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !1207
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1208
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !1209
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1210
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !1211
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1212
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !1213
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1214
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !1215
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1216
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !1217
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1218
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !1219
  ret void, !dbg !1220
}

; Function Attrs: inlinehint nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #1 !dbg !1221 {
entry:
    #dbg_value(ptr %out, !1224, !DIExpression(), !1225)
    #dbg_value(i32 %outlen, !1226, !DIExpression(), !1225)
    #dbg_value(ptr %s, !1227, !DIExpression(), !1225)
    #dbg_value(i32 %pos, !1228, !DIExpression(), !1225)
    #dbg_value(i32 %r, !1229, !DIExpression(), !1225)
  %tobool.not6 = icmp eq i32 %outlen, 0, !dbg !1230
  br i1 %tobool.not6, label %while.end, label %while.body.lr.ph, !dbg !1230

while.body.lr.ph:                                 ; preds = %entry
  br label %while.body, !dbg !1230

while.body:                                       ; preds = %while.body.lr.ph, %for.end
  %out.addr.09 = phi ptr [ %out, %while.body.lr.ph ], [ %out.addr.1.lcssa, %for.end ]
  %outlen.addr.08 = phi i32 [ %outlen, %while.body.lr.ph ], [ %sub3, %for.end ]
  %pos.addr.07 = phi i32 [ %pos, %while.body.lr.ph ], [ %i.0.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.09, !1224, !DIExpression(), !1225)
    #dbg_value(i32 %outlen.addr.08, !1226, !DIExpression(), !1225)
    #dbg_value(i32 %pos.addr.07, !1228, !DIExpression(), !1225)
  %cmp = icmp eq i32 %pos.addr.07, %r, !dbg !1231
  br i1 %cmp, label %if.then, label %if.end, !dbg !1231

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1234
    #dbg_value(i32 0, !1228, !DIExpression(), !1225)
  br label %if.end, !dbg !1236

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.07, %while.body ]
    #dbg_value(i32 %pos.addr.1, !1228, !DIExpression(), !1225)
    #dbg_value(i32 %pos.addr.1, !1237, !DIExpression(), !1225)
    #dbg_value(ptr %out.addr.09, !1224, !DIExpression(), !1225)
  %cmp11 = icmp ult i32 %pos.addr.1, %r, !dbg !1238
  %add = add i32 %pos.addr.1, %outlen.addr.08, !dbg !1241
  %cmp22 = icmp ult i32 %pos.addr.1, %add, !dbg !1241
  %0 = and i1 %cmp11, %cmp22, !dbg !1241
  br i1 %0, label %for.body.lr.ph, label %for.end, !dbg !1242

for.body.lr.ph:                                   ; preds = %if.end
  br label %for.body, !dbg !1242

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %out.addr.14 = phi ptr [ %out.addr.09, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %i.03 = phi i32 [ %pos.addr.1, %for.body.lr.ph ], [ %inc, %for.body ]
    #dbg_value(ptr %out.addr.14, !1224, !DIExpression(), !1225)
    #dbg_value(i32 %i.03, !1237, !DIExpression(), !1225)
  %div1 = lshr i32 %i.03, 3, !dbg !1243
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !1244
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1244
  %rem = shl nuw nsw i32 %i.03, 3, !dbg !1245
  %mul = and i32 %rem, 56, !dbg !1245
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1246
  %shr = lshr i64 %1, %sh_prom, !dbg !1246
  %conv = trunc i64 %shr to i8, !dbg !1244
    #dbg_value(ptr %out.addr.14, !1224, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1225)
  store i8 %conv, ptr %out.addr.14, align 1, !dbg !1247
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.14, i32 1, !dbg !1248
    #dbg_value(ptr %incdec.ptr, !1224, !DIExpression(), !1225)
  %inc = add nuw nsw i32 %i.03, 1, !dbg !1249
    #dbg_value(i32 %inc, !1237, !DIExpression(), !1225)
  %cmp1 = icmp ult i32 %inc, %r, !dbg !1238
  %cmp2 = icmp ult i32 %inc, %add, !dbg !1241
  %2 = and i1 %cmp1, %cmp2, !dbg !1241
  br i1 %2, label %for.body, label %for.cond.for.end_crit_edge, !dbg !1242, !llvm.loop !1250

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %split = phi i32 [ %inc, %for.body ]
  %split5 = phi ptr [ %incdec.ptr, %for.body ]
  br label %for.end, !dbg !1242

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %if.end
  %i.0.lcssa = phi i32 [ %split, %for.cond.for.end_crit_edge ], [ %pos.addr.1, %if.end ], !dbg !1252
  %out.addr.1.lcssa = phi ptr [ %split5, %for.cond.for.end_crit_edge ], [ %out.addr.09, %if.end ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !1253
  %sub3 = add i32 %sub.neg, %outlen.addr.08, !dbg !1254
    #dbg_value(ptr %out.addr.1.lcssa, !1224, !DIExpression(), !1225)
    #dbg_value(i32 %sub3, !1226, !DIExpression(), !1225)
    #dbg_value(i32 %i.0.lcssa, !1228, !DIExpression(), !1225)
  %tobool.not = icmp eq i32 %sub3, 0, !dbg !1230
  br i1 %tobool.not, label %while.cond.while.end_crit_edge, label %while.body, !dbg !1230, !llvm.loop !1255

while.cond.while.end_crit_edge:                   ; preds = %for.end
  %split10 = phi i32 [ %i.0.lcssa, %for.end ]
  br label %while.end, !dbg !1230

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %pos.addr.0.lcssa = phi i32 [ %split10, %while.cond.while.end_crit_edge ], [ %pos, %entry ]
  ret i32 %pos.addr.0.lcssa, !dbg !1257
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #1 !dbg !1258 {
entry:
    #dbg_value(ptr %state, !1262, !DIExpression(), !1263)
    #dbg_value(ptr %in, !1264, !DIExpression(), !1263)
    #dbg_value(i32 %inlen, !1265, !DIExpression(), !1263)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !1266
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1267
  store i64 168, ptr %arrayidx, align 8, !dbg !1268
  ret void, !dbg !1269
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #1 !dbg !1270 {
entry:
    #dbg_value(ptr %s, !1273, !DIExpression(), !1274)
    #dbg_value(i32 %r, !1275, !DIExpression(), !1274)
    #dbg_value(ptr %in, !1276, !DIExpression(), !1274)
    #dbg_value(i32 %inlen, !1277, !DIExpression(), !1274)
    #dbg_value(i8 %p, !1278, !DIExpression(), !1274)
    #dbg_value(i32 0, !1279, !DIExpression(), !1274)
  br label %for.body, !dbg !1280

while.cond.preheader:                             ; preds = %for.body
  %0 = lshr i32 %r, 3, !dbg !1282
    #dbg_value(i32 %inlen, !1277, !DIExpression(), !1274)
    #dbg_value(ptr %in, !1276, !DIExpression(), !1274)
  %cmp1.not4 = icmp ult i32 %inlen, %r, !dbg !1283
  br i1 %cmp1.not4, label %for.cond10.preheader, label %for.cond2.preheader.lr.ph, !dbg !1282

for.cond2.preheader.lr.ph:                        ; preds = %while.cond.preheader
  br label %for.cond2.preheader, !dbg !1282

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !1279, !DIExpression(), !1274)
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.01, !dbg !1284
  store i64 0, ptr %arrayidx, align 8, !dbg !1286
  %inc = add nuw nsw i32 %i.01, 1, !dbg !1287
    #dbg_value(i32 %inc, !1279, !DIExpression(), !1274)
  %exitcond.not = icmp eq i32 %inc, 25, !dbg !1288
  br i1 %exitcond.not, label %while.cond.preheader, label %for.body, !dbg !1280, !llvm.loop !1289

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph, %for.end8
  %inlen.addr.06 = phi i32 [ %inlen, %for.cond2.preheader.lr.ph ], [ %sub, %for.end8 ]
  %in.addr.05 = phi ptr [ %in, %for.cond2.preheader.lr.ph ], [ %add.ptr9, %for.end8 ]
    #dbg_value(i32 %inlen.addr.06, !1277, !DIExpression(), !1274)
    #dbg_value(ptr %in.addr.05, !1276, !DIExpression(), !1274)
    #dbg_value(i32 0, !1279, !DIExpression(), !1274)
  br label %for.body4.lr.ph, !dbg !1291

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader
  br label %for.body4, !dbg !1291

while.cond.for.cond10.preheader_crit_edge:        ; preds = %for.end8
  %split = phi ptr [ %add.ptr9, %for.end8 ]
  %split7 = phi i32 [ %sub, %for.end8 ]
  br label %for.cond10.preheader, !dbg !1282

for.cond10.preheader:                             ; preds = %while.cond.for.cond10.preheader_crit_edge, %while.cond.preheader
  %in.addr.0.lcssa = phi ptr [ %split, %while.cond.for.cond10.preheader_crit_edge ], [ %in, %while.cond.preheader ]
  %inlen.addr.0.lcssa = phi i32 [ %split7, %while.cond.for.cond10.preheader_crit_edge ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 0, !1279, !DIExpression(), !1274)
  %exitcond7.not8 = icmp eq i32 0, %inlen.addr.0.lcssa, !dbg !1294
  br i1 %exitcond7.not8, label %for.end20, label %for.body12.lr.ph, !dbg !1297

for.body12.lr.ph:                                 ; preds = %for.cond10.preheader
  br label %for.body12, !dbg !1297

for.body4:                                        ; preds = %for.body4.lr.ph, %for.body4
  %i.13 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc7, %for.body4 ]
    #dbg_value(i32 %i.13, !1279, !DIExpression(), !1274)
  %mul = shl nuw nsw i32 %i.13, 3, !dbg !1298
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.05, i32 %mul, !dbg !1300
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !1301
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.13, !dbg !1302
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !1303
  %xor = xor i64 %1, %call, !dbg !1303
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !1303
  %inc7 = add nuw nsw i32 %i.13, 1, !dbg !1304
    #dbg_value(i32 %inc7, !1279, !DIExpression(), !1274)
  %exitcond5.not = icmp eq i32 %inc7, %0, !dbg !1305
  br i1 %exitcond5.not, label %for.cond2.for.end8_crit_edge, label %for.body4, !dbg !1291, !llvm.loop !1306

for.cond2.for.end8_crit_edge:                     ; preds = %for.body4
  br label %for.end8, !dbg !1291

for.end8:                                         ; preds = %for.cond2.for.end8_crit_edge
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.05, i32 %r, !dbg !1308
    #dbg_value(ptr %add.ptr9, !1276, !DIExpression(), !1274)
  %sub = sub i32 %inlen.addr.06, %r, !dbg !1309
    #dbg_value(i32 %sub, !1277, !DIExpression(), !1274)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1310
  %cmp1.not = icmp ult i32 %sub, %r, !dbg !1283
  br i1 %cmp1.not, label %while.cond.for.cond10.preheader_crit_edge, label %for.cond2.preheader, !dbg !1282, !llvm.loop !1311

for.body12:                                       ; preds = %for.body12.lr.ph, %for.body12
  %i.29 = phi i32 [ 0, %for.body12.lr.ph ], [ %inc19, %for.body12 ]
    #dbg_value(i32 %i.29, !1279, !DIExpression(), !1274)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.29, !dbg !1313
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !1313
  %conv = zext i8 %2 to i64, !dbg !1314
  %rem = shl i32 %i.29, 3, !dbg !1315
  %mul14 = and i32 %rem, 56, !dbg !1315
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !1316
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1316
  %div153 = lshr i32 %i.29, 3, !dbg !1317
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !1318
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !1319
  %xor17 = xor i64 %3, %shl, !dbg !1319
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !1319
  %inc19 = add nuw i32 %i.29, 1, !dbg !1320
    #dbg_value(i32 %inc19, !1279, !DIExpression(), !1274)
  %exitcond7.not = icmp eq i32 %inc19, %inlen.addr.0.lcssa, !dbg !1294
  br i1 %exitcond7.not, label %for.cond10.for.end20_crit_edge, label %for.body12, !dbg !1297, !llvm.loop !1321

for.cond10.for.end20_crit_edge:                   ; preds = %for.body12
  br label %for.end20, !dbg !1297

for.end20:                                        ; preds = %for.cond10.for.end20_crit_edge, %for.cond10.preheader
  %i.2.lcssa = phi i32 [ %inlen.addr.0.lcssa, %for.cond10.for.end20_crit_edge ], [ 0, %for.cond10.preheader ], !dbg !1323
  %conv21 = zext nneg i8 %p to i64, !dbg !1324
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !1325
  %mul23 = and i32 %rem22, 56, !dbg !1325
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !1326
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !1326
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !1327
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !1328
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !1329
  %xor28 = xor i64 %4, %shl25, !dbg !1329
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !1329
  %sub29 = add nsw i32 %r, -1, !dbg !1330
  %div302 = lshr i32 %sub29, 3, !dbg !1331
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !1332
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !1333
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !1333
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !1333
  ret void, !dbg !1334
}

; Function Attrs: inlinehint nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #1 !dbg !1335 {
entry:
    #dbg_value(ptr %x, !1338, !DIExpression(), !1339)
    #dbg_value(i64 0, !1340, !DIExpression(), !1339)
    #dbg_value(i32 0, !1341, !DIExpression(), !1339)
  br label %for.inc, !dbg !1342

for.inc:                                          ; preds = %entry, %for.inc
  %r.02 = phi i64 [ 0, %entry ], [ %or, %for.inc ]
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
    #dbg_value(i32 %i.01, !1341, !DIExpression(), !1339)
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !1339)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.01, !dbg !1344
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1344
    #dbg_value(!DIArgList(i64 %r.02, i8 %0, i32 %i.01), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !1339)
  %conv = zext i8 %0 to i64, !dbg !1346
    #dbg_value(!DIArgList(i64 %r.02, i64 %conv, i32 %i.01), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !1339)
  %mul = shl nuw nsw i32 %i.01, 3, !dbg !1347
    #dbg_value(!DIArgList(i64 %r.02, i64 %conv, i32 %mul), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !1339)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1348
    #dbg_value(!DIArgList(i64 %r.02, i64 %conv, i64 %sh_prom), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !1339)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1348
    #dbg_value(!DIArgList(i64 %r.02, i64 %shl), !1340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1339)
  %or = or i64 %r.02, %shl, !dbg !1349
    #dbg_value(i64 %or, !1340, !DIExpression(), !1339)
  %inc = add nuw nsw i32 %i.01, 1, !dbg !1350
    #dbg_value(i32 %inc, !1341, !DIExpression(), !1339)
  %exitcond.not = icmp eq i32 %inc, 8, !dbg !1351
  br i1 %exitcond.not, label %for.end, label %for.inc, !dbg !1342, !llvm.loop !1352

for.end:                                          ; preds = %for.inc
  %r.0.lcssa = phi i64 [ %or, %for.inc ], !dbg !1339
  ret i64 %r.0.lcssa, !dbg !1354
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #1 !dbg !1355 {
entry:
    #dbg_value(ptr %out, !1358, !DIExpression(), !1359)
    #dbg_value(i32 %nblocks, !1360, !DIExpression(), !1359)
    #dbg_value(ptr %state, !1361, !DIExpression(), !1359)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !1362
  ret void, !dbg !1363
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #1 !dbg !1364 {
entry:
    #dbg_value(ptr %out, !1367, !DIExpression(), !1368)
    #dbg_value(i32 %nblocks, !1369, !DIExpression(), !1368)
    #dbg_value(ptr %s, !1370, !DIExpression(), !1368)
    #dbg_value(i32 %r, !1371, !DIExpression(), !1368)
  %0 = lshr i32 %r, 3, !dbg !1372
    #dbg_value(ptr %out, !1367, !DIExpression(), !1368)
    #dbg_value(i32 %nblocks, !1369, !DIExpression(), !1368)
  %tobool.not2 = icmp eq i32 %nblocks, 0, !dbg !1372
  br i1 %tobool.not2, label %while.end, label %while.body.lr.ph, !dbg !1372

while.body.lr.ph:                                 ; preds = %entry
  br label %while.body, !dbg !1372

while.body:                                       ; preds = %while.body.lr.ph, %for.end
  %out.addr.04 = phi ptr [ %out, %while.body.lr.ph ], [ %add.ptr1, %for.end ]
  %nblocks.addr.03 = phi i32 [ %nblocks, %while.body.lr.ph ], [ %sub, %for.end ]
    #dbg_value(ptr %out.addr.04, !1367, !DIExpression(), !1368)
    #dbg_value(i32 %nblocks.addr.03, !1369, !DIExpression(), !1368)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1373
    #dbg_value(i32 0, !1375, !DIExpression(), !1368)
  br label %for.body, !dbg !1376

for.body:                                         ; preds = %while.body, %for.body
  %i.01 = phi i32 [ 0, %while.body ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !1375, !DIExpression(), !1368)
  %mul = shl nuw nsw i32 %i.01, 3, !dbg !1378
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.04, i32 %mul, !dbg !1380
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.01, !dbg !1381
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1381
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !1382
  %inc = add nuw nsw i32 %i.01, 1, !dbg !1383
    #dbg_value(i32 %inc, !1375, !DIExpression(), !1368)
  %exitcond.not = icmp eq i32 %inc, %0, !dbg !1384
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1376, !llvm.loop !1385

for.end:                                          ; preds = %for.body
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.04, i32 %r, !dbg !1387
    #dbg_value(ptr %add.ptr1, !1367, !DIExpression(), !1368)
  %sub = add i32 %nblocks.addr.03, -1, !dbg !1388
    #dbg_value(i32 %sub, !1369, !DIExpression(), !1368)
  %tobool.not = icmp eq i32 %sub, 0, !dbg !1372
  br i1 %tobool.not, label %while.cond.while.end_crit_edge, label %while.body, !dbg !1372, !llvm.loop !1389

while.cond.while.end_crit_edge:                   ; preds = %for.end
  br label %while.end, !dbg !1372

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  ret void, !dbg !1391
}

; Function Attrs: inlinehint nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #1 !dbg !1392 {
entry:
    #dbg_value(ptr %x, !1395, !DIExpression(), !1396)
    #dbg_value(i64 %u, !1397, !DIExpression(), !1396)
    #dbg_value(i32 0, !1398, !DIExpression(), !1396)
  br label %for.body, !dbg !1399

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !1398, !DIExpression(), !1396)
  %mul = shl nuw nsw i32 %i.01, 3, !dbg !1401
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1403
  %shr = lshr i64 %u, %sh_prom, !dbg !1403
  %conv = trunc i64 %shr to i8, !dbg !1404
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.01, !dbg !1405
  store i8 %conv, ptr %arrayidx, align 1, !dbg !1406
  %inc = add nuw nsw i32 %i.01, 1, !dbg !1407
    #dbg_value(i32 %inc, !1398, !DIExpression(), !1396)
  %exitcond.not = icmp eq i32 %inc, 8, !dbg !1408
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1399, !llvm.loop !1409

for.end:                                          ; preds = %for.body
  ret void, !dbg !1411
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #1 !dbg !1412 {
entry:
    #dbg_value(ptr %out, !1413, !DIExpression(), !1414)
    #dbg_value(i32 %outlen, !1415, !DIExpression(), !1414)
    #dbg_value(ptr %state, !1416, !DIExpression(), !1414)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1417
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1417
  %conv = trunc i64 %0 to i32, !dbg !1417
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !1418
  %conv1 = zext i32 %call to i64, !dbg !1418
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1419
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1420
  ret void, !dbg !1421
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #1 !dbg !1422 {
entry:
    #dbg_value(ptr %state, !1423, !DIExpression(), !1424)
    #dbg_value(ptr %in, !1425, !DIExpression(), !1424)
    #dbg_value(i32 %inlen, !1426, !DIExpression(), !1424)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !1427
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1428
  store i64 136, ptr %arrayidx, align 8, !dbg !1429
  ret void, !dbg !1430
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #1 !dbg !1431 {
entry:
    #dbg_value(ptr %out, !1432, !DIExpression(), !1433)
    #dbg_value(i32 %nblocks, !1434, !DIExpression(), !1433)
    #dbg_value(ptr %state, !1435, !DIExpression(), !1433)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !1436
  ret void, !dbg !1437
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #1 !dbg !1438 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !1441, !DIExpression(), !1442)
    #dbg_value(i32 %outlen, !1443, !DIExpression(), !1442)
    #dbg_value(ptr %in, !1444, !DIExpression(), !1442)
    #dbg_value(i32 %inlen, !1445, !DIExpression(), !1442)
    #dbg_declare(ptr %state, !1446, !DIExpression(), !1447)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1448
  %div = udiv i32 %outlen, 136, !dbg !1449
    #dbg_value(i32 %div, !1450, !DIExpression(), !1442)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !1451
  %mul.neg = mul i32 %div, -136, !dbg !1452
  %sub = add i32 %mul.neg, %outlen, !dbg !1453
    #dbg_value(i32 %sub, !1443, !DIExpression(), !1442)
  %mul1 = mul nuw i32 %div, 136, !dbg !1454
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !1455
    #dbg_value(ptr %add.ptr, !1441, !DIExpression(), !1442)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !1456
  ret void, !dbg !1457
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #1 !dbg !1458 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !1461, !DIExpression(), !1462)
    #dbg_value(ptr %in, !1463, !DIExpression(), !1462)
    #dbg_value(i32 %inlen, !1464, !DIExpression(), !1462)
    #dbg_declare(ptr %s, !1465, !DIExpression(), !1469)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !1470
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !1471
    #dbg_value(i32 0, !1472, !DIExpression(), !1462)
  br label %for.body, !dbg !1473

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
    #dbg_value(i32 %i.01, !1472, !DIExpression(), !1462)
  %mul = shl nuw nsw i32 %i.01, 3, !dbg !1475
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !1477
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.01, !dbg !1478
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1478
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !1479
  %inc = add nuw nsw i32 %i.01, 1, !dbg !1480
    #dbg_value(i32 %inc, !1472, !DIExpression(), !1462)
  %exitcond.not = icmp eq i32 %inc, 8, !dbg !1481
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1473, !llvm.loop !1482

for.end:                                          ; preds = %for.body
  ret void, !dbg !1484
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #1 !dbg !1485 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !1489, !DIExpression(), !1490)
    #dbg_value(ptr %seed, !1491, !DIExpression(), !1490)
    #dbg_value(i8 %x, !1492, !DIExpression(), !1490)
    #dbg_value(i8 %y, !1493, !DIExpression(), !1490)
    #dbg_declare(ptr %extseed, !1494, !DIExpression(), !1498)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !1499
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !1500
  store i8 %x, ptr %arrayidx, align 1, !dbg !1501
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !1502
  store i8 %y, ptr %arrayidx1, align 1, !dbg !1503
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !1504
  ret void, !dbg !1505
}

; Function Attrs: inlinehint nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #1 !dbg !1506 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !1509, !DIExpression(), !1510)
    #dbg_value(i32 %outlen, !1511, !DIExpression(), !1510)
    #dbg_value(ptr %key, !1512, !DIExpression(), !1510)
    #dbg_value(i8 %nonce, !1513, !DIExpression(), !1510)
    #dbg_declare(ptr %extkey, !1514, !DIExpression(), !1518)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !1519
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !1520
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !1521
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !1522
  ret void, !dbg !1523
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #2

attributes #0 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!32, !66, !83, !84, !89, !93, !2, !95, !97, !99, !21, !100}
!llvm.ident = !{!101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101}
!llvm.module.flags = !{!102, !103, !104, !105}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!0}
!11 = !DIFile(filename: "../../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !17)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !6, line: 32, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !8, line: 55, baseType: !16)
!16 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DISubrange(count: 128)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !21, file: !27, line: 49, type: !28, isLocal: true, isDefinition: true)
!21 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !22, globals: !26, splitDebugInlining: false, nameTableKind: None)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 60, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !8, line: 105, baseType: !25)
!25 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!26 = !{!19}
!27 = !DIFile(filename: "../../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1536, elements: !30)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!30 = !{!31}
!31 = !DISubrange(count: 24)
!32 = distinct !DICompileUnit(language: DW_LANG_C11, file: !33, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !34, globals: !39, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "../../../ref/test/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !38)
!38 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!39 = !{!40, !47, !49, !51, !56, !61}
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !42, line: 110, type: !43, isLocal: true, isDefinition: true)
!42 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 224, elements: !45)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !{!46}
!46 = !DISubrange(count: 28)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !42, line: 111, type: !43, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(scope: null, file: !42, line: 112, type: !43, isLocal: true, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !42, line: 27, type: !53, isLocal: true, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 96, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 12)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !42, line: 55, type: !58, isLocal: true, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 144, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 18)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !42, line: 90, type: !63, isLocal: true, isDefinition: true)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 208, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 26)
!66 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !67, splitDebugInlining: false, nameTableKind: None)
!67 = !{!68, !78}
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "fd", scope: !70, file: !71, line: 75, type: !9, isLocal: true, isDefinition: true)
!70 = distinct !DISubprogram(name: "randombytes", scope: !71, file: !71, line: 74, type: !72, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !66, retainedNodes: !77)
!71 = !DIFile(filename: "../../../ref/randombytes.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!72 = !DISubroutineType(types: !73)
!73 = !{null, !35, !74}
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 214, baseType: !76)
!75 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!76 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!77 = !{}
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !71, line: 79, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 104, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 13)
!83 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!84 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !85, splitDebugInlining: false, nameTableKind: None)
!85 = !{!86}
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !6, line: 36, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !8, line: 57, baseType: !88)
!88 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!89 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !90, splitDebugInlining: false, nameTableKind: None)
!90 = !{!14, !86, !91}
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !6, line: 48, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !8, line: 79, baseType: !76)
!93 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !94, splitDebugInlining: false, nameTableKind: None)
!94 = !{!86, !14, !5}
!95 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !96, splitDebugInlining: false, nameTableKind: None)
!96 = !{!91}
!97 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !98, splitDebugInlining: false, nameTableKind: None)
!98 = !{!14, !5}
!99 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !22, splitDebugInlining: false, nameTableKind: None)
!100 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!101 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!102 = !{i32 2, !"Debug Info Version", i32 3}
!103 = !{i32 1, !"wchar_size", i32 4}
!104 = !{i32 1, !"min_enum_size", i32 4}
!105 = !{i32 1, !"Code Model", i32 1}
!106 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !107, file: !107, line: 165, type: !108, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !77)
!107 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!108 = !DISubroutineType(types: !109)
!109 = !{null, !110, !121, !9}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 32)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !112, line: 8, baseType: !113)
!112 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 8192, elements: !119)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !115, line: 11, baseType: !116)
!115 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 256)
!119 = !{!120}
!120 = !DISubrange(count: 2)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!123 = !DILocalVariable(name: "a", arg: 1, scope: !106, file: !107, line: 165, type: !110)
!124 = !DILocation(line: 0, scope: !106)
!125 = !DILocalVariable(name: "seed", arg: 2, scope: !106, file: !107, line: 165, type: !121)
!126 = !DILocalVariable(name: "transposed", arg: 3, scope: !106, file: !107, line: 166, type: !9)
!127 = !DILocalVariable(name: "buf", scope: !106, file: !107, line: 169, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4032, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 504)
!131 = !DILocation(line: 169, column: 11, scope: !106)
!132 = !DILocalVariable(name: "state", scope: !106, file: !107, line: 170, type: !133)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !134, line: 10, baseType: !135)
!134 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !136, line: 14, baseType: !137)
!136 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1664, elements: !64)
!138 = !DILocation(line: 170, column: 13, scope: !106)
!139 = !DILocalVariable(name: "i", scope: !106, file: !107, line: 167, type: !76)
!140 = !DILocation(line: 172, column: 3, scope: !141)
!141 = distinct !DILexicalBlock(scope: !106, file: !107, line: 172, column: 3)
!142 = !DILocalVariable(name: "j", scope: !106, file: !107, line: 167, type: !76)
!143 = !DILocation(line: 173, column: 5, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !107, line: 173, column: 5)
!145 = distinct !DILexicalBlock(scope: !146, file: !107, line: 172, column: 33)
!146 = distinct !DILexicalBlock(scope: !141, file: !107, line: 172, column: 3)
!147 = !DILocation(line: 174, column: 11, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !107, line: 174, column: 11)
!149 = distinct !DILexicalBlock(scope: !150, file: !107, line: 173, column: 35)
!150 = distinct !DILexicalBlock(scope: !144, file: !107, line: 173, column: 5)
!151 = !DILocation(line: 175, column: 9, scope: !148)
!152 = !DILocation(line: 177, column: 9, scope: !148)
!153 = !DILocation(line: 179, column: 7, scope: !149)
!154 = !DILocalVariable(name: "buflen", scope: !106, file: !107, line: 168, type: !76)
!155 = !DILocation(line: 181, column: 25, scope: !149)
!156 = !DILocation(line: 181, column: 13, scope: !149)
!157 = !DILocalVariable(name: "ctr", scope: !106, file: !107, line: 167, type: !76)
!158 = !DILocation(line: 183, column: 18, scope: !149)
!159 = !DILocation(line: 183, column: 7, scope: !149)
!160 = !DILocation(line: 184, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !149, file: !107, line: 183, column: 29)
!162 = !DILocation(line: 186, column: 28, scope: !161)
!163 = !DILocation(line: 186, column: 36, scope: !161)
!164 = !DILocation(line: 186, column: 51, scope: !161)
!165 = !DILocation(line: 186, column: 16, scope: !161)
!166 = !DILocation(line: 186, column: 13, scope: !161)
!167 = distinct !{!167, !159, !168, !169}
!168 = !DILocation(line: 187, column: 7, scope: !149)
!169 = !{!"llvm.loop.mustprogress"}
!170 = !DILocation(line: 173, column: 31, scope: !150)
!171 = !DILocation(line: 173, column: 19, scope: !150)
!172 = distinct !{!172, !143, !173, !169}
!173 = !DILocation(line: 188, column: 5, scope: !144)
!174 = !DILocation(line: 172, column: 29, scope: !146)
!175 = !DILocation(line: 172, column: 17, scope: !146)
!176 = distinct !{!176, !140, !177, !169}
!177 = !DILocation(line: 189, column: 3, scope: !141)
!178 = !DILocation(line: 190, column: 1, scope: !106)
!179 = distinct !DISubprogram(name: "rej_uniform", scope: !107, file: !107, line: 122, type: !180, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !77)
!180 = !DISubroutineType(types: !181)
!181 = !{!76, !182, !76, !121, !76}
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!183 = !DILocalVariable(name: "r", arg: 1, scope: !179, file: !107, line: 122, type: !182)
!184 = !DILocation(line: 0, scope: !179)
!185 = !DILocalVariable(name: "len", arg: 2, scope: !179, file: !107, line: 122, type: !76)
!186 = !DILocalVariable(name: "buf", arg: 3, scope: !179, file: !107, line: 123, type: !121)
!187 = !DILocalVariable(name: "buflen", arg: 4, scope: !179, file: !107, line: 123, type: !76)
!188 = !DILocalVariable(name: "pos", scope: !179, file: !107, line: 124, type: !76)
!189 = !DILocalVariable(name: "ctr", scope: !179, file: !107, line: 124, type: !76)
!190 = !DILocation(line: 128, column: 3, scope: !179)
!191 = !DILocation(line: 129, column: 14, scope: !192)
!192 = distinct !DILexicalBlock(scope: !179, file: !107, line: 128, column: 42)
!193 = !DILocation(line: 129, column: 46, scope: !192)
!194 = !DILocation(line: 129, column: 36, scope: !192)
!195 = !DILocation(line: 129, column: 59, scope: !192)
!196 = !DILocation(line: 129, column: 66, scope: !192)
!197 = !DILocalVariable(name: "val0", scope: !179, file: !107, line: 125, type: !86)
!198 = !DILocation(line: 130, column: 14, scope: !192)
!199 = !DILocation(line: 130, column: 27, scope: !192)
!200 = !DILocation(line: 130, column: 46, scope: !192)
!201 = !DILocation(line: 130, column: 36, scope: !192)
!202 = !DILocation(line: 130, column: 59, scope: !192)
!203 = !DILocation(line: 130, column: 33, scope: !192)
!204 = !DILocalVariable(name: "val1", scope: !179, file: !107, line: 125, type: !86)
!205 = !DILocation(line: 131, column: 9, scope: !192)
!206 = !DILocation(line: 133, column: 14, scope: !207)
!207 = distinct !DILexicalBlock(scope: !192, file: !107, line: 133, column: 9)
!208 = !DILocation(line: 134, column: 12, scope: !207)
!209 = !DILocation(line: 134, column: 7, scope: !207)
!210 = !DILocation(line: 134, column: 16, scope: !207)
!211 = !DILocation(line: 135, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !192, file: !107, line: 135, column: 9)
!213 = !DILocation(line: 135, column: 19, scope: !212)
!214 = !DILocation(line: 136, column: 12, scope: !212)
!215 = !DILocation(line: 136, column: 7, scope: !212)
!216 = !DILocation(line: 136, column: 16, scope: !212)
!217 = !DILocation(line: 0, scope: !192)
!218 = !DILocation(line: 128, column: 14, scope: !179)
!219 = !DILocation(line: 128, column: 20, scope: !179)
!220 = distinct !{!220, !190, !221, !169}
!221 = !DILocation(line: 137, column: 3, scope: !179)
!222 = !DILocation(line: 139, column: 3, scope: !179)
!223 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !107, file: !107, line: 205, type: !224, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !77)
!224 = !DISubroutineType(types: !225)
!225 = !{null, !35, !35, !121}
!226 = !DILocalVariable(name: "pk", arg: 1, scope: !223, file: !107, line: 205, type: !35)
!227 = !DILocation(line: 0, scope: !223)
!228 = !DILocalVariable(name: "sk", arg: 2, scope: !223, file: !107, line: 206, type: !35)
!229 = !DILocalVariable(name: "coins", arg: 3, scope: !223, file: !107, line: 207, type: !121)
!230 = !DILocalVariable(name: "buf", scope: !223, file: !107, line: 209, type: !231)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 512, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 64)
!234 = !DILocation(line: 209, column: 11, scope: !223)
!235 = !DILocalVariable(name: "publicseed", scope: !223, file: !107, line: 210, type: !121)
!236 = !DILocation(line: 211, column: 34, scope: !223)
!237 = !DILocalVariable(name: "noiseseed", scope: !223, file: !107, line: 211, type: !121)
!238 = !DILocalVariable(name: "nonce", scope: !223, file: !107, line: 212, type: !36)
!239 = !DILocalVariable(name: "a", scope: !223, file: !107, line: 213, type: !240)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !111, size: 16384, elements: !119)
!241 = !DILocation(line: 213, column: 11, scope: !223)
!242 = !DILocalVariable(name: "e", scope: !223, file: !107, line: 213, type: !111)
!243 = !DILocation(line: 213, column: 23, scope: !223)
!244 = !DILocalVariable(name: "pkpv", scope: !223, file: !107, line: 213, type: !111)
!245 = !DILocation(line: 213, column: 26, scope: !223)
!246 = !DILocalVariable(name: "skpv", scope: !223, file: !107, line: 213, type: !111)
!247 = !DILocation(line: 213, column: 32, scope: !223)
!248 = !DILocation(line: 215, column: 3, scope: !223)
!249 = !DILocation(line: 216, column: 3, scope: !223)
!250 = !DILocation(line: 216, column: 23, scope: !223)
!251 = !DILocation(line: 217, column: 3, scope: !223)
!252 = !DILocation(line: 219, column: 3, scope: !223)
!253 = !DILocalVariable(name: "i", scope: !223, file: !107, line: 208, type: !76)
!254 = !DILocation(line: 221, column: 3, scope: !255)
!255 = distinct !DILexicalBlock(scope: !223, file: !107, line: 221, column: 3)
!256 = !DILocation(line: 223, column: 3, scope: !257)
!257 = distinct !DILexicalBlock(scope: !223, file: !107, line: 223, column: 3)
!258 = !DILocation(line: 222, column: 25, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !107, line: 221, column: 3)
!260 = !DILocation(line: 222, column: 5, scope: !259)
!261 = !DILocation(line: 222, column: 50, scope: !259)
!262 = !DILocation(line: 221, column: 29, scope: !259)
!263 = !DILocation(line: 221, column: 17, scope: !259)
!264 = distinct !{!264, !254, !265, !169}
!265 = !DILocation(line: 222, column: 52, scope: !255)
!266 = !DILocation(line: 224, column: 25, scope: !267)
!267 = distinct !DILexicalBlock(scope: !257, file: !107, line: 223, column: 3)
!268 = !DILocation(line: 224, column: 5, scope: !267)
!269 = !DILocation(line: 224, column: 47, scope: !267)
!270 = !DILocation(line: 223, column: 29, scope: !267)
!271 = !DILocation(line: 223, column: 17, scope: !267)
!272 = distinct !{!272, !256, !273, !169}
!273 = !DILocation(line: 224, column: 49, scope: !257)
!274 = !DILocation(line: 226, column: 3, scope: !223)
!275 = !DILocation(line: 227, column: 3, scope: !223)
!276 = !DILocation(line: 230, column: 3, scope: !277)
!277 = distinct !DILexicalBlock(scope: !223, file: !107, line: 230, column: 3)
!278 = !DILocation(line: 231, column: 37, scope: !279)
!279 = distinct !DILexicalBlock(scope: !280, file: !107, line: 230, column: 33)
!280 = distinct !DILexicalBlock(scope: !277, file: !107, line: 230, column: 3)
!281 = !DILocation(line: 231, column: 47, scope: !279)
!282 = !DILocation(line: 231, column: 5, scope: !279)
!283 = !DILocation(line: 232, column: 18, scope: !279)
!284 = !DILocation(line: 232, column: 5, scope: !279)
!285 = !DILocation(line: 230, column: 29, scope: !280)
!286 = !DILocation(line: 230, column: 17, scope: !280)
!287 = distinct !{!287, !276, !288, !169}
!288 = !DILocation(line: 233, column: 3, scope: !277)
!289 = !DILocation(line: 235, column: 3, scope: !223)
!290 = !DILocation(line: 236, column: 3, scope: !223)
!291 = !DILocation(line: 238, column: 3, scope: !223)
!292 = !DILocation(line: 239, column: 3, scope: !223)
!293 = !DILocation(line: 240, column: 1, scope: !223)
!294 = distinct !DISubprogram(name: "pack_sk", scope: !107, file: !107, line: 55, type: !295, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !77)
!295 = !DISubroutineType(types: !296)
!296 = !{null, !35, !110}
!297 = !DILocalVariable(name: "r", arg: 1, scope: !294, file: !107, line: 55, type: !35)
!298 = !DILocation(line: 0, scope: !294)
!299 = !DILocalVariable(name: "sk", arg: 2, scope: !294, file: !107, line: 55, type: !110)
!300 = !DILocation(line: 56, column: 3, scope: !294)
!301 = !DILocation(line: 57, column: 1, scope: !294)
!302 = distinct !DISubprogram(name: "pack_pk", scope: !107, file: !107, line: 23, type: !303, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !77)
!303 = !DISubroutineType(types: !304)
!304 = !{null, !35, !110, !121}
!305 = !DILocalVariable(name: "r", arg: 1, scope: !302, file: !107, line: 23, type: !35)
!306 = !DILocation(line: 0, scope: !302)
!307 = !DILocalVariable(name: "pk", arg: 2, scope: !302, file: !107, line: 23, type: !110)
!308 = !DILocalVariable(name: "seed", arg: 3, scope: !302, file: !107, line: 24, type: !121)
!309 = !DILocation(line: 25, column: 3, scope: !302)
!310 = !DILocation(line: 26, column: 12, scope: !302)
!311 = !DILocation(line: 26, column: 3, scope: !302)
!312 = !DILocation(line: 27, column: 1, scope: !302)
!313 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !314, file: !314, line: 141, type: !315, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !77)
!314 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!315 = !DISubroutineType(types: !316)
!316 = !{null, !35, !317}
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 32)
!318 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !111)
!319 = !DILocalVariable(name: "r", arg: 1, scope: !313, file: !314, line: 141, type: !35)
!320 = !DILocation(line: 0, scope: !313)
!321 = !DILocalVariable(name: "a", arg: 2, scope: !313, file: !314, line: 141, type: !317)
!322 = !DILocalVariable(name: "i", scope: !313, file: !314, line: 142, type: !76)
!323 = !DILocation(line: 143, column: 3, scope: !324)
!324 = distinct !DILexicalBlock(scope: !313, file: !314, line: 143, column: 3)
!325 = !DILocation(line: 144, column: 24, scope: !326)
!326 = distinct !DILexicalBlock(scope: !324, file: !314, line: 143, column: 3)
!327 = !DILocation(line: 144, column: 20, scope: !326)
!328 = !DILocation(line: 144, column: 44, scope: !326)
!329 = !DILocation(line: 144, column: 5, scope: !326)
!330 = !DILocation(line: 143, column: 29, scope: !326)
!331 = !DILocation(line: 143, column: 17, scope: !326)
!332 = distinct !{!332, !323, !333, !169}
!333 = !DILocation(line: 144, column: 51, scope: !324)
!334 = !DILocation(line: 145, column: 1, scope: !313)
!335 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !314, file: !314, line: 170, type: !336, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !77)
!336 = !DISubroutineType(types: !337)
!337 = !{null, !110}
!338 = !DILocalVariable(name: "r", arg: 1, scope: !335, file: !314, line: 170, type: !110)
!339 = !DILocation(line: 0, scope: !335)
!340 = !DILocalVariable(name: "i", scope: !335, file: !314, line: 171, type: !76)
!341 = !DILocation(line: 172, column: 3, scope: !342)
!342 = distinct !DILexicalBlock(scope: !335, file: !314, line: 172, column: 3)
!343 = !DILocation(line: 173, column: 15, scope: !344)
!344 = distinct !DILexicalBlock(scope: !342, file: !314, line: 172, column: 3)
!345 = !DILocation(line: 173, column: 5, scope: !344)
!346 = !DILocation(line: 172, column: 29, scope: !344)
!347 = !DILocation(line: 172, column: 17, scope: !344)
!348 = distinct !{!348, !341, !349, !169}
!349 = !DILocation(line: 173, column: 22, scope: !342)
!350 = !DILocation(line: 174, column: 1, scope: !335)
!351 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !314, file: !314, line: 200, type: !352, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !77)
!352 = !DISubroutineType(types: !353)
!353 = !{null, !354, !317, !317}
!354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 32)
!355 = !DILocalVariable(name: "r", arg: 1, scope: !351, file: !314, line: 200, type: !354)
!356 = !DILocation(line: 0, scope: !351)
!357 = !DILocalVariable(name: "a", arg: 2, scope: !351, file: !314, line: 200, type: !317)
!358 = !DILocalVariable(name: "b", arg: 3, scope: !351, file: !314, line: 201, type: !317)
!359 = !DILocalVariable(name: "t", scope: !351, file: !314, line: 203, type: !114)
!360 = !DILocation(line: 203, column: 8, scope: !351)
!361 = !DILocation(line: 205, column: 3, scope: !351)
!362 = !DILocalVariable(name: "i", scope: !351, file: !314, line: 202, type: !76)
!363 = !DILocation(line: 207, column: 34, scope: !364)
!364 = distinct !DILexicalBlock(scope: !365, file: !314, line: 206, column: 33)
!365 = distinct !DILexicalBlock(scope: !366, file: !314, line: 206, column: 3)
!366 = distinct !DILexicalBlock(scope: !351, file: !314, line: 206, column: 3)
!367 = !DILocation(line: 207, column: 44, scope: !364)
!368 = !DILocation(line: 207, column: 5, scope: !364)
!369 = !DILocation(line: 208, column: 5, scope: !364)
!370 = !DILocation(line: 211, column: 3, scope: !351)
!371 = !DILocation(line: 212, column: 1, scope: !351)
!372 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !314, file: !314, line: 223, type: !336, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !77)
!373 = !DILocalVariable(name: "r", arg: 1, scope: !372, file: !314, line: 223, type: !110)
!374 = !DILocation(line: 0, scope: !372)
!375 = !DILocalVariable(name: "i", scope: !372, file: !314, line: 224, type: !76)
!376 = !DILocation(line: 225, column: 3, scope: !377)
!377 = distinct !DILexicalBlock(scope: !372, file: !314, line: 225, column: 3)
!378 = !DILocation(line: 226, column: 18, scope: !379)
!379 = distinct !DILexicalBlock(scope: !377, file: !314, line: 225, column: 3)
!380 = !DILocation(line: 226, column: 5, scope: !379)
!381 = !DILocation(line: 225, column: 29, scope: !379)
!382 = !DILocation(line: 225, column: 17, scope: !379)
!383 = distinct !{!383, !376, !384, !169}
!384 = !DILocation(line: 226, column: 25, scope: !377)
!385 = !DILocation(line: 227, column: 1, scope: !372)
!386 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !314, file: !314, line: 238, type: !387, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !77)
!387 = !DISubroutineType(types: !388)
!388 = !{null, !110, !317, !317}
!389 = !DILocalVariable(name: "r", arg: 1, scope: !386, file: !314, line: 238, type: !110)
!390 = !DILocation(line: 0, scope: !386)
!391 = !DILocalVariable(name: "a", arg: 2, scope: !386, file: !314, line: 238, type: !317)
!392 = !DILocalVariable(name: "b", arg: 3, scope: !386, file: !314, line: 238, type: !317)
!393 = !DILocalVariable(name: "i", scope: !386, file: !314, line: 239, type: !76)
!394 = !DILocation(line: 240, column: 3, scope: !395)
!395 = distinct !DILexicalBlock(scope: !386, file: !314, line: 240, column: 3)
!396 = !DILocation(line: 241, column: 15, scope: !397)
!397 = distinct !DILexicalBlock(scope: !395, file: !314, line: 240, column: 3)
!398 = !DILocation(line: 241, column: 25, scope: !397)
!399 = !DILocation(line: 241, column: 35, scope: !397)
!400 = !DILocation(line: 241, column: 5, scope: !397)
!401 = !DILocation(line: 240, column: 29, scope: !397)
!402 = !DILocation(line: 240, column: 17, scope: !397)
!403 = distinct !{!403, !394, !404, !169}
!404 = !DILocation(line: 241, column: 42, scope: !395)
!405 = !DILocation(line: 242, column: 1, scope: !386)
!406 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !407, file: !407, line: 122, type: !408, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!407 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!408 = !DISubroutineType(types: !409)
!409 = !{null, !35, !410}
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !411, size: 32)
!411 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !114)
!412 = !DILocalVariable(name: "r", arg: 1, scope: !406, file: !407, line: 122, type: !35)
!413 = !DILocation(line: 0, scope: !406)
!414 = !DILocalVariable(name: "a", arg: 2, scope: !406, file: !407, line: 122, type: !410)
!415 = !DILocalVariable(name: "i", scope: !406, file: !407, line: 123, type: !76)
!416 = !DILocation(line: 126, column: 3, scope: !417)
!417 = distinct !DILexicalBlock(scope: !406, file: !407, line: 126, column: 3)
!418 = !DILocation(line: 128, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !420, file: !407, line: 126, column: 37)
!420 = distinct !DILexicalBlock(scope: !417, file: !407, line: 126, column: 3)
!421 = !DILocation(line: 128, column: 10, scope: !419)
!422 = !DILocalVariable(name: "t0", scope: !406, file: !407, line: 124, type: !86)
!423 = !DILocation(line: 129, column: 31, scope: !419)
!424 = !DILocation(line: 129, column: 8, scope: !419)
!425 = !DILocation(line: 130, column: 17, scope: !419)
!426 = !DILocation(line: 130, column: 21, scope: !419)
!427 = !DILocation(line: 130, column: 10, scope: !419)
!428 = !DILocalVariable(name: "t1", scope: !406, file: !407, line: 124, type: !86)
!429 = !DILocation(line: 131, column: 31, scope: !419)
!430 = !DILocation(line: 131, column: 8, scope: !419)
!431 = !DILocation(line: 132, column: 20, scope: !419)
!432 = !DILocation(line: 132, column: 9, scope: !419)
!433 = !DILocation(line: 132, column: 5, scope: !419)
!434 = !DILocation(line: 132, column: 18, scope: !419)
!435 = !DILocation(line: 133, column: 24, scope: !419)
!436 = !DILocation(line: 133, column: 33, scope: !419)
!437 = !DILocation(line: 133, column: 36, scope: !419)
!438 = !DILocation(line: 133, column: 30, scope: !419)
!439 = !DILocation(line: 133, column: 9, scope: !419)
!440 = !DILocation(line: 133, column: 5, scope: !419)
!441 = !DILocation(line: 133, column: 18, scope: !419)
!442 = !DILocation(line: 134, column: 24, scope: !419)
!443 = !DILocation(line: 134, column: 20, scope: !419)
!444 = !DILocation(line: 134, column: 9, scope: !419)
!445 = !DILocation(line: 134, column: 5, scope: !419)
!446 = !DILocation(line: 134, column: 18, scope: !419)
!447 = !DILocation(line: 126, column: 33, scope: !420)
!448 = !DILocation(line: 126, column: 17, scope: !420)
!449 = distinct !{!449, !416, !450, !169}
!450 = !DILocation(line: 135, column: 3, scope: !417)
!451 = !DILocation(line: 136, column: 1, scope: !406)
!452 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !407, file: !407, line: 220, type: !453, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !354, !121, !36}
!455 = !DILocalVariable(name: "r", arg: 1, scope: !452, file: !407, line: 220, type: !354)
!456 = !DILocation(line: 0, scope: !452)
!457 = !DILocalVariable(name: "seed", arg: 2, scope: !452, file: !407, line: 220, type: !121)
!458 = !DILocalVariable(name: "nonce", arg: 3, scope: !452, file: !407, line: 221, type: !36)
!459 = !DILocalVariable(name: "buf", scope: !452, file: !407, line: 222, type: !460)
!460 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 1536, elements: !461)
!461 = !{!462}
!462 = !DISubrange(count: 192)
!463 = !DILocation(line: 222, column: 11, scope: !452)
!464 = !DILocation(line: 223, column: 3, scope: !452)
!465 = !DILocation(line: 224, column: 3, scope: !452)
!466 = !DILocation(line: 225, column: 1, scope: !452)
!467 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !407, file: !407, line: 256, type: !468, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !354}
!470 = !DILocalVariable(name: "r", arg: 1, scope: !467, file: !407, line: 256, type: !354)
!471 = !DILocation(line: 0, scope: !467)
!472 = !DILocation(line: 257, column: 3, scope: !467)
!473 = !DILocation(line: 258, column: 3, scope: !467)
!474 = !DILocation(line: 259, column: 1, scope: !467)
!475 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !407, file: !407, line: 314, type: !468, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!476 = !DILocalVariable(name: "r", arg: 1, scope: !475, file: !407, line: 314, type: !354)
!477 = !DILocation(line: 0, scope: !475)
!478 = !DILocalVariable(name: "i", scope: !475, file: !407, line: 315, type: !76)
!479 = !DILocation(line: 316, column: 3, scope: !480)
!480 = distinct !DILexicalBlock(scope: !475, file: !407, line: 316, column: 3)
!481 = !DILocation(line: 317, column: 30, scope: !482)
!482 = distinct !DILexicalBlock(scope: !480, file: !407, line: 316, column: 3)
!483 = !DILocation(line: 317, column: 15, scope: !482)
!484 = !DILocation(line: 317, column: 5, scope: !482)
!485 = !DILocation(line: 317, column: 13, scope: !482)
!486 = !DILocation(line: 316, column: 29, scope: !482)
!487 = !DILocation(line: 316, column: 17, scope: !482)
!488 = distinct !{!488, !479, !489, !169}
!489 = !DILocation(line: 317, column: 37, scope: !480)
!490 = !DILocation(line: 318, column: 1, scope: !475)
!491 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !407, file: !407, line: 282, type: !492, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!492 = !DISubroutineType(types: !493)
!493 = !{null, !354, !410, !410}
!494 = !DILocalVariable(name: "r", arg: 1, scope: !491, file: !407, line: 282, type: !354)
!495 = !DILocation(line: 0, scope: !491)
!496 = !DILocalVariable(name: "a", arg: 2, scope: !491, file: !407, line: 282, type: !410)
!497 = !DILocalVariable(name: "b", arg: 3, scope: !491, file: !407, line: 282, type: !410)
!498 = !DILocalVariable(name: "i", scope: !491, file: !407, line: 283, type: !76)
!499 = !DILocation(line: 284, column: 3, scope: !500)
!500 = distinct !DILexicalBlock(scope: !491, file: !407, line: 284, column: 3)
!501 = !DILocation(line: 285, column: 21, scope: !502)
!502 = distinct !DILexicalBlock(scope: !503, file: !407, line: 284, column: 37)
!503 = distinct !DILexicalBlock(scope: !500, file: !407, line: 284, column: 3)
!504 = !DILocation(line: 285, column: 14, scope: !502)
!505 = !DILocation(line: 285, column: 35, scope: !502)
!506 = !DILocation(line: 285, column: 28, scope: !502)
!507 = !DILocation(line: 285, column: 49, scope: !502)
!508 = !DILocation(line: 285, column: 42, scope: !502)
!509 = !DILocation(line: 285, column: 64, scope: !502)
!510 = !DILocation(line: 285, column: 55, scope: !502)
!511 = !DILocation(line: 285, column: 5, scope: !502)
!512 = !DILocation(line: 286, column: 21, scope: !502)
!513 = !DILocation(line: 286, column: 25, scope: !502)
!514 = !DILocation(line: 286, column: 14, scope: !502)
!515 = !DILocation(line: 286, column: 39, scope: !502)
!516 = !DILocation(line: 286, column: 43, scope: !502)
!517 = !DILocation(line: 286, column: 32, scope: !502)
!518 = !DILocation(line: 286, column: 57, scope: !502)
!519 = !DILocation(line: 286, column: 61, scope: !502)
!520 = !DILocation(line: 286, column: 50, scope: !502)
!521 = !DILocation(line: 287, column: 23, scope: !502)
!522 = !DILocation(line: 287, column: 14, scope: !502)
!523 = !DILocation(line: 287, column: 13, scope: !502)
!524 = !DILocation(line: 286, column: 5, scope: !502)
!525 = !DILocation(line: 284, column: 33, scope: !503)
!526 = !DILocation(line: 284, column: 17, scope: !503)
!527 = distinct !{!527, !499, !528, !169}
!528 = !DILocation(line: 288, column: 3, scope: !500)
!529 = !DILocation(line: 289, column: 1, scope: !491)
!530 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !407, file: !407, line: 299, type: !468, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!531 = !DILocalVariable(name: "r", arg: 1, scope: !530, file: !407, line: 299, type: !354)
!532 = !DILocation(line: 0, scope: !530)
!533 = !DILocalVariable(name: "f", scope: !530, file: !407, line: 301, type: !13)
!534 = !DILocalVariable(name: "i", scope: !530, file: !407, line: 300, type: !76)
!535 = !DILocation(line: 302, column: 3, scope: !536)
!536 = distinct !DILexicalBlock(scope: !530, file: !407, line: 302, column: 3)
!537 = !DILocation(line: 303, column: 42, scope: !538)
!538 = distinct !DILexicalBlock(scope: !536, file: !407, line: 302, column: 3)
!539 = !DILocation(line: 303, column: 33, scope: !538)
!540 = !DILocation(line: 303, column: 50, scope: !538)
!541 = !DILocation(line: 303, column: 15, scope: !538)
!542 = !DILocation(line: 303, column: 5, scope: !538)
!543 = !DILocation(line: 303, column: 13, scope: !538)
!544 = !DILocation(line: 302, column: 29, scope: !538)
!545 = !DILocation(line: 302, column: 17, scope: !538)
!546 = distinct !{!546, !535, !547, !169}
!547 = !DILocation(line: 303, column: 53, scope: !536)
!548 = !DILocation(line: 304, column: 1, scope: !530)
!549 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !407, file: !407, line: 329, type: !492, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !77)
!550 = !DILocalVariable(name: "r", arg: 1, scope: !549, file: !407, line: 329, type: !354)
!551 = !DILocation(line: 0, scope: !549)
!552 = !DILocalVariable(name: "a", arg: 2, scope: !549, file: !407, line: 329, type: !410)
!553 = !DILocalVariable(name: "b", arg: 3, scope: !549, file: !407, line: 329, type: !410)
!554 = !DILocalVariable(name: "i", scope: !549, file: !407, line: 330, type: !76)
!555 = !DILocation(line: 331, column: 3, scope: !556)
!556 = distinct !DILexicalBlock(scope: !549, file: !407, line: 331, column: 3)
!557 = !DILocation(line: 332, column: 15, scope: !558)
!558 = distinct !DILexicalBlock(scope: !556, file: !407, line: 331, column: 3)
!559 = !DILocation(line: 332, column: 25, scope: !558)
!560 = !DILocation(line: 332, column: 23, scope: !558)
!561 = !DILocation(line: 332, column: 5, scope: !558)
!562 = !DILocation(line: 332, column: 13, scope: !558)
!563 = !DILocation(line: 331, column: 29, scope: !558)
!564 = !DILocation(line: 331, column: 17, scope: !558)
!565 = distinct !{!565, !555, !566, !169}
!566 = !DILocation(line: 332, column: 31, scope: !556)
!567 = !DILocation(line: 333, column: 1, scope: !549)
!568 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !11, file: !11, line: 80, type: !569, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !182}
!571 = !DILocalVariable(name: "r", arg: 1, scope: !568, file: !11, line: 80, type: !182)
!572 = !DILocation(line: 0, scope: !568)
!573 = !DILocalVariable(name: "k", scope: !568, file: !11, line: 81, type: !76)
!574 = !DILocalVariable(name: "len", scope: !568, file: !11, line: 81, type: !76)
!575 = !DILocation(line: 85, column: 3, scope: !576)
!576 = distinct !DILexicalBlock(scope: !568, file: !11, line: 85, column: 3)
!577 = !DILocalVariable(name: "start", scope: !568, file: !11, line: 81, type: !76)
!578 = !DILocation(line: 86, column: 5, scope: !579)
!579 = distinct !DILexicalBlock(scope: !580, file: !11, line: 86, column: 5)
!580 = distinct !DILexicalBlock(scope: !581, file: !11, line: 85, column: 39)
!581 = distinct !DILexicalBlock(scope: !576, file: !11, line: 85, column: 3)
!582 = !DILocation(line: 87, column: 14, scope: !583)
!583 = distinct !DILexicalBlock(scope: !584, file: !11, line: 86, column: 50)
!584 = distinct !DILexicalBlock(scope: !579, file: !11, line: 86, column: 5)
!585 = !DILocalVariable(name: "zeta", scope: !568, file: !11, line: 82, type: !14)
!586 = !DILocalVariable(name: "j", scope: !568, file: !11, line: 81, type: !76)
!587 = !DILocation(line: 88, column: 32, scope: !588)
!588 = distinct !DILexicalBlock(scope: !589, file: !11, line: 88, column: 7)
!589 = distinct !DILexicalBlock(scope: !583, file: !11, line: 88, column: 7)
!590 = !DILocation(line: 88, column: 7, scope: !589)
!591 = !DILocation(line: 89, column: 25, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !11, line: 88, column: 44)
!593 = !DILocation(line: 89, column: 13, scope: !592)
!594 = !DILocalVariable(name: "t", scope: !568, file: !11, line: 82, type: !14)
!595 = !DILocation(line: 90, column: 22, scope: !592)
!596 = !DILocation(line: 90, column: 27, scope: !592)
!597 = !DILocation(line: 90, column: 9, scope: !592)
!598 = !DILocation(line: 90, column: 20, scope: !592)
!599 = !DILocation(line: 91, column: 16, scope: !592)
!600 = !DILocation(line: 91, column: 21, scope: !592)
!601 = !DILocation(line: 91, column: 9, scope: !592)
!602 = !DILocation(line: 91, column: 14, scope: !592)
!603 = !DILocation(line: 88, column: 40, scope: !588)
!604 = !DILocation(line: 88, column: 24, scope: !588)
!605 = distinct !{!605, !590, !606, !169}
!606 = !DILocation(line: 92, column: 7, scope: !589)
!607 = !DILocation(line: 88, scope: !589)
!608 = !DILocation(line: 87, column: 21, scope: !583)
!609 = !DILocation(line: 86, column: 43, scope: !584)
!610 = !DILocation(line: 86, column: 26, scope: !584)
!611 = distinct !{!611, !578, !612, !169}
!612 = !DILocation(line: 93, column: 5, scope: !579)
!613 = !DILocation(line: 85, column: 32, scope: !581)
!614 = !DILocation(line: 85, column: 22, scope: !581)
!615 = distinct !{!615, !575, !616, !169}
!616 = !DILocation(line: 94, column: 3, scope: !576)
!617 = !DILocation(line: 95, column: 1, scope: !568)
!618 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !619, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!619 = !DISubroutineType(types: !620)
!620 = !{!14, !14, !14}
!621 = !DILocalVariable(name: "a", arg: 1, scope: !618, file: !11, line: 68, type: !14)
!622 = !DILocation(line: 0, scope: !618)
!623 = !DILocalVariable(name: "b", arg: 2, scope: !618, file: !11, line: 68, type: !14)
!624 = !DILocation(line: 69, column: 28, scope: !618)
!625 = !DILocation(line: 69, column: 39, scope: !618)
!626 = !DILocation(line: 69, column: 38, scope: !618)
!627 = !DILocation(line: 69, column: 10, scope: !618)
!628 = !DILocation(line: 69, column: 3, scope: !618)
!629 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !11, file: !11, line: 139, type: !630, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!630 = !DISubroutineType(types: !631)
!631 = !{null, !182, !632, !632, !14}
!632 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!633 = !DILocalVariable(name: "r", arg: 1, scope: !629, file: !11, line: 139, type: !182)
!634 = !DILocation(line: 0, scope: !629)
!635 = !DILocalVariable(name: "a", arg: 2, scope: !629, file: !11, line: 139, type: !632)
!636 = !DILocalVariable(name: "b", arg: 3, scope: !629, file: !11, line: 139, type: !632)
!637 = !DILocalVariable(name: "zeta", arg: 4, scope: !629, file: !11, line: 139, type: !14)
!638 = !DILocation(line: 141, column: 17, scope: !629)
!639 = !DILocation(line: 141, column: 23, scope: !629)
!640 = !DILocation(line: 141, column: 11, scope: !629)
!641 = !DILocation(line: 141, column: 9, scope: !629)
!642 = !DILocation(line: 142, column: 11, scope: !629)
!643 = !DILocation(line: 142, column: 9, scope: !629)
!644 = !DILocation(line: 143, column: 17, scope: !629)
!645 = !DILocation(line: 143, column: 23, scope: !629)
!646 = !DILocation(line: 143, column: 11, scope: !629)
!647 = !DILocation(line: 143, column: 8, scope: !629)
!648 = !DILocation(line: 144, column: 17, scope: !629)
!649 = !DILocation(line: 144, column: 23, scope: !629)
!650 = !DILocation(line: 144, column: 11, scope: !629)
!651 = !DILocation(line: 144, column: 3, scope: !629)
!652 = !DILocation(line: 144, column: 9, scope: !629)
!653 = !DILocation(line: 145, column: 17, scope: !629)
!654 = !DILocation(line: 145, column: 23, scope: !629)
!655 = !DILocation(line: 145, column: 11, scope: !629)
!656 = !DILocation(line: 145, column: 3, scope: !629)
!657 = !DILocation(line: 145, column: 8, scope: !629)
!658 = !DILocation(line: 146, column: 1, scope: !629)
!659 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !660, file: !660, line: 105, type: !661, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !77)
!660 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!661 = !DISubroutineType(types: !662)
!662 = !{null, !354, !121}
!663 = !DILocalVariable(name: "r", arg: 1, scope: !659, file: !660, line: 105, type: !354)
!664 = !DILocation(line: 0, scope: !659)
!665 = !DILocalVariable(name: "buf", arg: 2, scope: !659, file: !660, line: 105, type: !121)
!666 = !DILocation(line: 109, column: 3, scope: !659)
!667 = !DILocation(line: 113, column: 1, scope: !659)
!668 = distinct !DISubprogram(name: "cbd3", scope: !660, file: !660, line: 85, type: !661, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !77)
!669 = !DILocalVariable(name: "r", arg: 1, scope: !668, file: !660, line: 85, type: !354)
!670 = !DILocation(line: 0, scope: !668)
!671 = !DILocalVariable(name: "buf", arg: 2, scope: !668, file: !660, line: 85, type: !121)
!672 = !DILocalVariable(name: "i", scope: !668, file: !660, line: 86, type: !76)
!673 = !DILocation(line: 90, column: 3, scope: !674)
!674 = distinct !DILexicalBlock(scope: !668, file: !660, line: 90, column: 3)
!675 = !DILocation(line: 91, column: 37, scope: !676)
!676 = distinct !DILexicalBlock(scope: !677, file: !660, line: 90, column: 37)
!677 = distinct !DILexicalBlock(scope: !674, file: !660, line: 90, column: 3)
!678 = !DILocation(line: 91, column: 33, scope: !676)
!679 = !DILocation(line: 91, column: 9, scope: !676)
!680 = !DILocalVariable(name: "t", scope: !668, file: !660, line: 87, type: !91)
!681 = !DILocation(line: 92, column: 11, scope: !676)
!682 = !DILocalVariable(name: "d", scope: !668, file: !660, line: 87, type: !91)
!683 = !DILocation(line: 93, column: 13, scope: !676)
!684 = !DILocation(line: 93, column: 19, scope: !676)
!685 = !DILocation(line: 93, column: 7, scope: !676)
!686 = !DILocation(line: 94, column: 13, scope: !676)
!687 = !DILocation(line: 94, column: 19, scope: !676)
!688 = !DILocation(line: 94, column: 7, scope: !676)
!689 = !DILocalVariable(name: "j", scope: !668, file: !660, line: 86, type: !76)
!690 = !DILocation(line: 96, column: 5, scope: !691)
!691 = distinct !DILexicalBlock(scope: !676, file: !660, line: 96, column: 5)
!692 = !DILocation(line: 97, column: 20, scope: !693)
!693 = distinct !DILexicalBlock(scope: !694, file: !660, line: 96, column: 29)
!694 = distinct !DILexicalBlock(scope: !691, file: !660, line: 96, column: 5)
!695 = !DILocation(line: 97, column: 14, scope: !693)
!696 = !DILocation(line: 97, column: 11, scope: !693)
!697 = !DILocalVariable(name: "a", scope: !668, file: !660, line: 88, type: !14)
!698 = !DILocation(line: 98, column: 20, scope: !693)
!699 = !DILocation(line: 98, column: 24, scope: !693)
!700 = !DILocation(line: 98, column: 14, scope: !693)
!701 = !DILocation(line: 98, column: 11, scope: !693)
!702 = !DILocalVariable(name: "b", scope: !668, file: !660, line: 88, type: !14)
!703 = !DILocation(line: 99, column: 27, scope: !693)
!704 = !DILocation(line: 99, column: 25, scope: !693)
!705 = !DILocation(line: 99, column: 14, scope: !693)
!706 = !DILocation(line: 99, column: 18, scope: !693)
!707 = !DILocation(line: 99, column: 7, scope: !693)
!708 = !DILocation(line: 99, column: 23, scope: !693)
!709 = !DILocation(line: 96, column: 25, scope: !694)
!710 = !DILocation(line: 96, column: 19, scope: !694)
!711 = distinct !{!711, !690, !712, !169}
!712 = !DILocation(line: 100, column: 5, scope: !691)
!713 = !DILocation(line: 90, column: 33, scope: !677)
!714 = !DILocation(line: 90, column: 17, scope: !677)
!715 = distinct !{!715, !673, !716, !169}
!716 = !DILocation(line: 101, column: 3, scope: !674)
!717 = !DILocation(line: 102, column: 1, scope: !668)
!718 = distinct !DISubprogram(name: "load24_littleendian", scope: !660, file: !660, line: 36, type: !719, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !77)
!719 = !DISubroutineType(types: !720)
!720 = !{!91, !121}
!721 = !DILocalVariable(name: "x", arg: 1, scope: !718, file: !660, line: 36, type: !121)
!722 = !DILocation(line: 0, scope: !718)
!723 = !DILocation(line: 38, column: 17, scope: !718)
!724 = !DILocation(line: 38, column: 7, scope: !718)
!725 = !DILocalVariable(name: "r", scope: !718, file: !660, line: 37, type: !91)
!726 = !DILocation(line: 39, column: 18, scope: !718)
!727 = !DILocation(line: 39, column: 8, scope: !718)
!728 = !DILocation(line: 39, column: 23, scope: !718)
!729 = !DILocation(line: 39, column: 5, scope: !718)
!730 = !DILocation(line: 40, column: 18, scope: !718)
!731 = !DILocation(line: 40, column: 8, scope: !718)
!732 = !DILocation(line: 40, column: 23, scope: !718)
!733 = !DILocation(line: 40, column: 5, scope: !718)
!734 = !DILocation(line: 41, column: 3, scope: !718)
!735 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !736, file: !736, line: 16, type: !737, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !77)
!736 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!737 = !DISubroutineType(types: !98)
!738 = !DILocalVariable(name: "a", arg: 1, scope: !735, file: !736, line: 16, type: !5)
!739 = !DILocation(line: 0, scope: !735)
!740 = !DILocalVariable(name: "t", scope: !735, file: !736, line: 18, type: !14)
!741 = !DILocation(line: 21, column: 12, scope: !735)
!742 = !DILocation(line: 21, column: 22, scope: !735)
!743 = !DILocation(line: 21, column: 10, scope: !735)
!744 = !DILocation(line: 21, column: 32, scope: !735)
!745 = !DILocation(line: 21, column: 7, scope: !735)
!746 = !DILocation(line: 22, column: 3, scope: !735)
!747 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !736, file: !736, line: 35, type: !748, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !77)
!748 = !DISubroutineType(types: !749)
!749 = !{!14, !14}
!750 = !DILocalVariable(name: "a", arg: 1, scope: !747, file: !736, line: 35, type: !14)
!751 = !DILocation(line: 0, scope: !747)
!752 = !DILocalVariable(name: "v", scope: !747, file: !736, line: 37, type: !13)
!753 = !DILocation(line: 39, column: 20, scope: !747)
!754 = !DILocation(line: 39, column: 19, scope: !747)
!755 = !DILocation(line: 39, column: 22, scope: !747)
!756 = !DILocation(line: 39, column: 33, scope: !747)
!757 = !DILocalVariable(name: "t", scope: !747, file: !736, line: 36, type: !14)
!758 = !DILocation(line: 41, column: 10, scope: !747)
!759 = !DILocation(line: 41, column: 3, scope: !747)
!760 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 70, type: !761, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!761 = !DISubroutineType(types: !762)
!762 = !{null, !763}
!763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!764 = !DILocalVariable(name: "state", arg: 1, scope: !760, file: !27, line: 70, type: !763)
!765 = !DILocation(line: 0, scope: !760)
!766 = !DILocation(line: 87, column: 9, scope: !760)
!767 = !DILocalVariable(name: "Aba", scope: !760, file: !27, line: 73, type: !23)
!768 = !DILocation(line: 88, column: 9, scope: !760)
!769 = !DILocalVariable(name: "Abe", scope: !760, file: !27, line: 73, type: !23)
!770 = !DILocation(line: 89, column: 9, scope: !760)
!771 = !DILocalVariable(name: "Abi", scope: !760, file: !27, line: 73, type: !23)
!772 = !DILocation(line: 90, column: 9, scope: !760)
!773 = !DILocalVariable(name: "Abo", scope: !760, file: !27, line: 73, type: !23)
!774 = !DILocation(line: 91, column: 9, scope: !760)
!775 = !DILocalVariable(name: "Abu", scope: !760, file: !27, line: 73, type: !23)
!776 = !DILocation(line: 92, column: 9, scope: !760)
!777 = !DILocalVariable(name: "Aga", scope: !760, file: !27, line: 74, type: !23)
!778 = !DILocation(line: 93, column: 9, scope: !760)
!779 = !DILocalVariable(name: "Age", scope: !760, file: !27, line: 74, type: !23)
!780 = !DILocation(line: 94, column: 9, scope: !760)
!781 = !DILocalVariable(name: "Agi", scope: !760, file: !27, line: 74, type: !23)
!782 = !DILocation(line: 95, column: 9, scope: !760)
!783 = !DILocalVariable(name: "Ago", scope: !760, file: !27, line: 74, type: !23)
!784 = !DILocation(line: 96, column: 9, scope: !760)
!785 = !DILocalVariable(name: "Agu", scope: !760, file: !27, line: 74, type: !23)
!786 = !DILocation(line: 97, column: 9, scope: !760)
!787 = !DILocalVariable(name: "Aka", scope: !760, file: !27, line: 75, type: !23)
!788 = !DILocation(line: 98, column: 9, scope: !760)
!789 = !DILocalVariable(name: "Ake", scope: !760, file: !27, line: 75, type: !23)
!790 = !DILocation(line: 99, column: 9, scope: !760)
!791 = !DILocalVariable(name: "Aki", scope: !760, file: !27, line: 75, type: !23)
!792 = !DILocation(line: 100, column: 9, scope: !760)
!793 = !DILocalVariable(name: "Ako", scope: !760, file: !27, line: 75, type: !23)
!794 = !DILocation(line: 101, column: 9, scope: !760)
!795 = !DILocalVariable(name: "Aku", scope: !760, file: !27, line: 75, type: !23)
!796 = !DILocation(line: 102, column: 9, scope: !760)
!797 = !DILocalVariable(name: "Ama", scope: !760, file: !27, line: 76, type: !23)
!798 = !DILocation(line: 103, column: 9, scope: !760)
!799 = !DILocalVariable(name: "Ame", scope: !760, file: !27, line: 76, type: !23)
!800 = !DILocation(line: 104, column: 9, scope: !760)
!801 = !DILocalVariable(name: "Ami", scope: !760, file: !27, line: 76, type: !23)
!802 = !DILocation(line: 105, column: 9, scope: !760)
!803 = !DILocalVariable(name: "Amo", scope: !760, file: !27, line: 76, type: !23)
!804 = !DILocation(line: 106, column: 9, scope: !760)
!805 = !DILocalVariable(name: "Amu", scope: !760, file: !27, line: 76, type: !23)
!806 = !DILocation(line: 107, column: 9, scope: !760)
!807 = !DILocalVariable(name: "Asa", scope: !760, file: !27, line: 77, type: !23)
!808 = !DILocation(line: 108, column: 9, scope: !760)
!809 = !DILocalVariable(name: "Ase", scope: !760, file: !27, line: 77, type: !23)
!810 = !DILocation(line: 109, column: 9, scope: !760)
!811 = !DILocalVariable(name: "Asi", scope: !760, file: !27, line: 77, type: !23)
!812 = !DILocation(line: 110, column: 9, scope: !760)
!813 = !DILocalVariable(name: "Aso", scope: !760, file: !27, line: 77, type: !23)
!814 = !DILocation(line: 111, column: 9, scope: !760)
!815 = !DILocalVariable(name: "Asu", scope: !760, file: !27, line: 77, type: !23)
!816 = !DILocalVariable(name: "round", scope: !760, file: !27, line: 71, type: !9)
!817 = !DILocation(line: 113, column: 3, scope: !818)
!818 = distinct !DILexicalBlock(scope: !760, file: !27, line: 113, column: 3)
!819 = !DILocalVariable(name: "Da", scope: !760, file: !27, line: 79, type: !23)
!820 = !DILocalVariable(name: "De", scope: !760, file: !27, line: 79, type: !23)
!821 = !DILocalVariable(name: "Di", scope: !760, file: !27, line: 79, type: !23)
!822 = !DILocalVariable(name: "Do", scope: !760, file: !27, line: 79, type: !23)
!823 = !DILocalVariable(name: "Du", scope: !760, file: !27, line: 79, type: !23)
!824 = !DILocalVariable(name: "Eba", scope: !760, file: !27, line: 80, type: !23)
!825 = !DILocalVariable(name: "Ege", scope: !760, file: !27, line: 81, type: !23)
!826 = !DILocalVariable(name: "Eki", scope: !760, file: !27, line: 82, type: !23)
!827 = !DILocalVariable(name: "Emo", scope: !760, file: !27, line: 83, type: !23)
!828 = !DILocalVariable(name: "Esu", scope: !760, file: !27, line: 84, type: !23)
!829 = !DILocalVariable(name: "Ebo", scope: !760, file: !27, line: 80, type: !23)
!830 = !DILocalVariable(name: "Egu", scope: !760, file: !27, line: 81, type: !23)
!831 = !DILocalVariable(name: "Eka", scope: !760, file: !27, line: 82, type: !23)
!832 = !DILocalVariable(name: "Eme", scope: !760, file: !27, line: 83, type: !23)
!833 = !DILocalVariable(name: "Esi", scope: !760, file: !27, line: 84, type: !23)
!834 = !DILocalVariable(name: "Ebe", scope: !760, file: !27, line: 80, type: !23)
!835 = !DILocalVariable(name: "Egi", scope: !760, file: !27, line: 81, type: !23)
!836 = !DILocalVariable(name: "Eko", scope: !760, file: !27, line: 82, type: !23)
!837 = !DILocalVariable(name: "Emu", scope: !760, file: !27, line: 83, type: !23)
!838 = !DILocalVariable(name: "Esa", scope: !760, file: !27, line: 84, type: !23)
!839 = !DILocalVariable(name: "Ebu", scope: !760, file: !27, line: 80, type: !23)
!840 = !DILocalVariable(name: "Ega", scope: !760, file: !27, line: 81, type: !23)
!841 = !DILocalVariable(name: "Eke", scope: !760, file: !27, line: 82, type: !23)
!842 = !DILocalVariable(name: "Emi", scope: !760, file: !27, line: 83, type: !23)
!843 = !DILocalVariable(name: "Eso", scope: !760, file: !27, line: 84, type: !23)
!844 = !DILocalVariable(name: "Ebi", scope: !760, file: !27, line: 80, type: !23)
!845 = !DILocalVariable(name: "BCa", scope: !760, file: !27, line: 78, type: !23)
!846 = !DILocalVariable(name: "Ego", scope: !760, file: !27, line: 81, type: !23)
!847 = !DILocalVariable(name: "BCe", scope: !760, file: !27, line: 78, type: !23)
!848 = !DILocalVariable(name: "Eku", scope: !760, file: !27, line: 82, type: !23)
!849 = !DILocalVariable(name: "BCi", scope: !760, file: !27, line: 78, type: !23)
!850 = !DILocalVariable(name: "Ema", scope: !760, file: !27, line: 83, type: !23)
!851 = !DILocalVariable(name: "BCo", scope: !760, file: !27, line: 78, type: !23)
!852 = !DILocalVariable(name: "Ese", scope: !760, file: !27, line: 84, type: !23)
!853 = !DILocalVariable(name: "BCu", scope: !760, file: !27, line: 78, type: !23)
!854 = !DILocation(line: 117, column: 15, scope: !855)
!855 = distinct !DILexicalBlock(scope: !856, file: !27, line: 113, column: 48)
!856 = distinct !DILexicalBlock(scope: !818, file: !27, line: 113, column: 3)
!857 = !DILocation(line: 117, column: 21, scope: !855)
!858 = !DILocation(line: 117, column: 27, scope: !855)
!859 = !DILocation(line: 117, column: 33, scope: !855)
!860 = !DILocation(line: 119, column: 15, scope: !855)
!861 = !DILocation(line: 119, column: 21, scope: !855)
!862 = !DILocation(line: 119, column: 27, scope: !855)
!863 = !DILocation(line: 119, column: 33, scope: !855)
!864 = !DILocation(line: 125, column: 16, scope: !855)
!865 = !DILocation(line: 125, column: 14, scope: !855)
!866 = !DILocation(line: 195, column: 9, scope: !855)
!867 = !DILocation(line: 196, column: 11, scope: !855)
!868 = !DILocation(line: 116, column: 15, scope: !855)
!869 = !DILocation(line: 116, column: 21, scope: !855)
!870 = !DILocation(line: 116, column: 27, scope: !855)
!871 = !DILocation(line: 116, column: 33, scope: !855)
!872 = !DILocation(line: 122, column: 16, scope: !855)
!873 = !DILocation(line: 122, column: 14, scope: !855)
!874 = !DILocation(line: 199, column: 9, scope: !855)
!875 = !DILocation(line: 200, column: 11, scope: !855)
!876 = !DILocation(line: 118, column: 15, scope: !855)
!877 = !DILocation(line: 118, column: 21, scope: !855)
!878 = !DILocation(line: 118, column: 27, scope: !855)
!879 = !DILocation(line: 118, column: 33, scope: !855)
!880 = !DILocation(line: 115, column: 15, scope: !855)
!881 = !DILocation(line: 115, column: 21, scope: !855)
!882 = !DILocation(line: 115, column: 27, scope: !855)
!883 = !DILocation(line: 115, column: 33, scope: !855)
!884 = !DILocation(line: 126, column: 16, scope: !855)
!885 = !DILocation(line: 126, column: 14, scope: !855)
!886 = !DILocation(line: 197, column: 9, scope: !855)
!887 = !DILocation(line: 198, column: 11, scope: !855)
!888 = !DILocation(line: 204, column: 19, scope: !855)
!889 = !DILocation(line: 204, column: 25, scope: !855)
!890 = !DILocation(line: 204, column: 15, scope: !855)
!891 = !DILocation(line: 124, column: 16, scope: !855)
!892 = !DILocation(line: 124, column: 14, scope: !855)
!893 = !DILocation(line: 132, column: 9, scope: !855)
!894 = !DILocation(line: 133, column: 11, scope: !855)
!895 = !DILocation(line: 123, column: 16, scope: !855)
!896 = !DILocation(line: 123, column: 14, scope: !855)
!897 = !DILocation(line: 130, column: 9, scope: !855)
!898 = !DILocation(line: 131, column: 11, scope: !855)
!899 = !DILocation(line: 138, column: 19, scope: !855)
!900 = !DILocation(line: 138, column: 25, scope: !855)
!901 = !DILocation(line: 139, column: 22, scope: !855)
!902 = !DILocation(line: 139, column: 9, scope: !855)
!903 = !DILocation(line: 128, column: 9, scope: !855)
!904 = !DILocation(line: 145, column: 9, scope: !855)
!905 = !DILocation(line: 146, column: 11, scope: !855)
!906 = !DILocation(line: 149, column: 9, scope: !855)
!907 = !DILocation(line: 150, column: 11, scope: !855)
!908 = !DILocation(line: 147, column: 9, scope: !855)
!909 = !DILocation(line: 148, column: 11, scope: !855)
!910 = !DILocation(line: 155, column: 19, scope: !855)
!911 = !DILocation(line: 155, column: 25, scope: !855)
!912 = !DILocation(line: 155, column: 15, scope: !855)
!913 = !DILocation(line: 210, column: 15, scope: !855)
!914 = !DILocation(line: 161, column: 9, scope: !855)
!915 = !DILocation(line: 162, column: 11, scope: !855)
!916 = !DILocation(line: 165, column: 9, scope: !855)
!917 = !DILocation(line: 166, column: 11, scope: !855)
!918 = !DILocation(line: 163, column: 9, scope: !855)
!919 = !DILocation(line: 164, column: 11, scope: !855)
!920 = !DILocation(line: 171, column: 19, scope: !855)
!921 = !DILocation(line: 171, column: 25, scope: !855)
!922 = !DILocation(line: 171, column: 15, scope: !855)
!923 = !DILocation(line: 210, column: 21, scope: !855)
!924 = !DILocation(line: 177, column: 9, scope: !855)
!925 = !DILocation(line: 178, column: 11, scope: !855)
!926 = !DILocation(line: 181, column: 9, scope: !855)
!927 = !DILocation(line: 182, column: 11, scope: !855)
!928 = !DILocation(line: 179, column: 9, scope: !855)
!929 = !DILocation(line: 180, column: 11, scope: !855)
!930 = !DILocation(line: 187, column: 19, scope: !855)
!931 = !DILocation(line: 187, column: 25, scope: !855)
!932 = !DILocation(line: 187, column: 15, scope: !855)
!933 = !DILocation(line: 210, column: 27, scope: !855)
!934 = !DILocation(line: 193, column: 9, scope: !855)
!935 = !DILocation(line: 194, column: 11, scope: !855)
!936 = !DILocation(line: 203, column: 19, scope: !855)
!937 = !DILocation(line: 203, column: 25, scope: !855)
!938 = !DILocation(line: 203, column: 15, scope: !855)
!939 = !DILocation(line: 210, column: 33, scope: !855)
!940 = !DILocation(line: 136, column: 9, scope: !855)
!941 = !DILocation(line: 137, column: 11, scope: !855)
!942 = !DILocation(line: 134, column: 9, scope: !855)
!943 = !DILocation(line: 135, column: 11, scope: !855)
!944 = !DILocation(line: 141, column: 19, scope: !855)
!945 = !DILocation(line: 141, column: 25, scope: !855)
!946 = !DILocation(line: 141, column: 15, scope: !855)
!947 = !DILocation(line: 153, column: 9, scope: !855)
!948 = !DILocation(line: 154, column: 11, scope: !855)
!949 = !DILocation(line: 151, column: 9, scope: !855)
!950 = !DILocation(line: 152, column: 11, scope: !855)
!951 = !DILocation(line: 157, column: 19, scope: !855)
!952 = !DILocation(line: 157, column: 25, scope: !855)
!953 = !DILocation(line: 157, column: 15, scope: !855)
!954 = !DILocation(line: 212, column: 15, scope: !855)
!955 = !DILocation(line: 169, column: 9, scope: !855)
!956 = !DILocation(line: 170, column: 11, scope: !855)
!957 = !DILocation(line: 167, column: 9, scope: !855)
!958 = !DILocation(line: 168, column: 11, scope: !855)
!959 = !DILocation(line: 173, column: 19, scope: !855)
!960 = !DILocation(line: 173, column: 25, scope: !855)
!961 = !DILocation(line: 173, column: 15, scope: !855)
!962 = !DILocation(line: 212, column: 21, scope: !855)
!963 = !DILocation(line: 185, column: 9, scope: !855)
!964 = !DILocation(line: 186, column: 11, scope: !855)
!965 = !DILocation(line: 183, column: 9, scope: !855)
!966 = !DILocation(line: 184, column: 11, scope: !855)
!967 = !DILocation(line: 189, column: 19, scope: !855)
!968 = !DILocation(line: 189, column: 25, scope: !855)
!969 = !DILocation(line: 189, column: 15, scope: !855)
!970 = !DILocation(line: 212, column: 27, scope: !855)
!971 = !DILocation(line: 201, column: 9, scope: !855)
!972 = !DILocation(line: 202, column: 11, scope: !855)
!973 = !DILocation(line: 205, column: 19, scope: !855)
!974 = !DILocation(line: 205, column: 25, scope: !855)
!975 = !DILocation(line: 205, column: 15, scope: !855)
!976 = !DILocation(line: 212, column: 33, scope: !855)
!977 = !DILocation(line: 218, column: 16, scope: !855)
!978 = !DILocation(line: 218, column: 14, scope: !855)
!979 = !DILocation(line: 296, column: 9, scope: !855)
!980 = !DILocation(line: 297, column: 11, scope: !855)
!981 = !DILocation(line: 158, column: 19, scope: !855)
!982 = !DILocation(line: 158, column: 25, scope: !855)
!983 = !DILocation(line: 158, column: 15, scope: !855)
!984 = !DILocation(line: 143, column: 19, scope: !855)
!985 = !DILocation(line: 143, column: 25, scope: !855)
!986 = !DILocation(line: 143, column: 15, scope: !855)
!987 = !DILocation(line: 159, column: 19, scope: !855)
!988 = !DILocation(line: 159, column: 25, scope: !855)
!989 = !DILocation(line: 159, column: 15, scope: !855)
!990 = !DILocation(line: 214, column: 15, scope: !855)
!991 = !DILocation(line: 175, column: 19, scope: !855)
!992 = !DILocation(line: 175, column: 25, scope: !855)
!993 = !DILocation(line: 175, column: 15, scope: !855)
!994 = !DILocation(line: 214, column: 21, scope: !855)
!995 = !DILocation(line: 191, column: 19, scope: !855)
!996 = !DILocation(line: 191, column: 25, scope: !855)
!997 = !DILocation(line: 191, column: 15, scope: !855)
!998 = !DILocation(line: 214, column: 27, scope: !855)
!999 = !DILocation(line: 207, column: 19, scope: !855)
!1000 = !DILocation(line: 207, column: 25, scope: !855)
!1001 = !DILocation(line: 207, column: 15, scope: !855)
!1002 = !DILocation(line: 214, column: 33, scope: !855)
!1003 = !DILocation(line: 220, column: 16, scope: !855)
!1004 = !DILocation(line: 220, column: 14, scope: !855)
!1005 = !DILocation(line: 290, column: 9, scope: !855)
!1006 = !DILocation(line: 291, column: 11, scope: !855)
!1007 = !DILocation(line: 140, column: 19, scope: !855)
!1008 = !DILocation(line: 140, column: 25, scope: !855)
!1009 = !DILocation(line: 140, column: 15, scope: !855)
!1010 = !DILocation(line: 156, column: 19, scope: !855)
!1011 = !DILocation(line: 156, column: 25, scope: !855)
!1012 = !DILocation(line: 156, column: 15, scope: !855)
!1013 = !DILocation(line: 211, column: 15, scope: !855)
!1014 = !DILocation(line: 172, column: 19, scope: !855)
!1015 = !DILocation(line: 172, column: 25, scope: !855)
!1016 = !DILocation(line: 172, column: 15, scope: !855)
!1017 = !DILocation(line: 211, column: 21, scope: !855)
!1018 = !DILocation(line: 188, column: 19, scope: !855)
!1019 = !DILocation(line: 188, column: 25, scope: !855)
!1020 = !DILocation(line: 188, column: 15, scope: !855)
!1021 = !DILocation(line: 211, column: 27, scope: !855)
!1022 = !DILocation(line: 211, column: 33, scope: !855)
!1023 = !DILocation(line: 142, column: 19, scope: !855)
!1024 = !DILocation(line: 142, column: 25, scope: !855)
!1025 = !DILocation(line: 142, column: 15, scope: !855)
!1026 = !DILocation(line: 213, column: 15, scope: !855)
!1027 = !DILocation(line: 174, column: 19, scope: !855)
!1028 = !DILocation(line: 174, column: 25, scope: !855)
!1029 = !DILocation(line: 174, column: 15, scope: !855)
!1030 = !DILocation(line: 213, column: 21, scope: !855)
!1031 = !DILocation(line: 190, column: 19, scope: !855)
!1032 = !DILocation(line: 190, column: 25, scope: !855)
!1033 = !DILocation(line: 190, column: 15, scope: !855)
!1034 = !DILocation(line: 213, column: 27, scope: !855)
!1035 = !DILocation(line: 206, column: 19, scope: !855)
!1036 = !DILocation(line: 206, column: 25, scope: !855)
!1037 = !DILocation(line: 206, column: 15, scope: !855)
!1038 = !DILocation(line: 213, column: 33, scope: !855)
!1039 = !DILocation(line: 219, column: 16, scope: !855)
!1040 = !DILocation(line: 219, column: 14, scope: !855)
!1041 = !DILocation(line: 288, column: 9, scope: !855)
!1042 = !DILocation(line: 289, column: 11, scope: !855)
!1043 = !DILocation(line: 302, column: 19, scope: !855)
!1044 = !DILocation(line: 302, column: 25, scope: !855)
!1045 = !DILocation(line: 302, column: 15, scope: !855)
!1046 = !DILocation(line: 217, column: 16, scope: !855)
!1047 = !DILocation(line: 217, column: 14, scope: !855)
!1048 = !DILocation(line: 294, column: 9, scope: !855)
!1049 = !DILocation(line: 295, column: 11, scope: !855)
!1050 = !DILocation(line: 301, column: 19, scope: !855)
!1051 = !DILocation(line: 301, column: 25, scope: !855)
!1052 = !DILocation(line: 301, column: 15, scope: !855)
!1053 = !DILocation(line: 221, column: 16, scope: !855)
!1054 = !DILocation(line: 221, column: 14, scope: !855)
!1055 = !DILocation(line: 292, column: 9, scope: !855)
!1056 = !DILocation(line: 293, column: 11, scope: !855)
!1057 = !DILocation(line: 300, column: 19, scope: !855)
!1058 = !DILocation(line: 300, column: 25, scope: !855)
!1059 = !DILocation(line: 300, column: 15, scope: !855)
!1060 = !DILocation(line: 299, column: 19, scope: !855)
!1061 = !DILocation(line: 299, column: 25, scope: !855)
!1062 = !DILocation(line: 299, column: 15, scope: !855)
!1063 = !DILocation(line: 298, column: 19, scope: !855)
!1064 = !DILocation(line: 298, column: 25, scope: !855)
!1065 = !DILocation(line: 298, column: 15, scope: !855)
!1066 = !DILocation(line: 280, column: 9, scope: !855)
!1067 = !DILocation(line: 281, column: 11, scope: !855)
!1068 = !DILocation(line: 274, column: 9, scope: !855)
!1069 = !DILocation(line: 275, column: 11, scope: !855)
!1070 = !DILocation(line: 272, column: 9, scope: !855)
!1071 = !DILocation(line: 273, column: 11, scope: !855)
!1072 = !DILocation(line: 286, column: 19, scope: !855)
!1073 = !DILocation(line: 286, column: 25, scope: !855)
!1074 = !DILocation(line: 286, column: 15, scope: !855)
!1075 = !DILocation(line: 278, column: 9, scope: !855)
!1076 = !DILocation(line: 279, column: 11, scope: !855)
!1077 = !DILocation(line: 285, column: 19, scope: !855)
!1078 = !DILocation(line: 285, column: 25, scope: !855)
!1079 = !DILocation(line: 285, column: 15, scope: !855)
!1080 = !DILocation(line: 276, column: 9, scope: !855)
!1081 = !DILocation(line: 277, column: 11, scope: !855)
!1082 = !DILocation(line: 284, column: 19, scope: !855)
!1083 = !DILocation(line: 284, column: 25, scope: !855)
!1084 = !DILocation(line: 284, column: 15, scope: !855)
!1085 = !DILocation(line: 283, column: 19, scope: !855)
!1086 = !DILocation(line: 283, column: 25, scope: !855)
!1087 = !DILocation(line: 283, column: 15, scope: !855)
!1088 = !DILocation(line: 282, column: 19, scope: !855)
!1089 = !DILocation(line: 282, column: 25, scope: !855)
!1090 = !DILocation(line: 282, column: 15, scope: !855)
!1091 = !DILocation(line: 264, column: 9, scope: !855)
!1092 = !DILocation(line: 265, column: 11, scope: !855)
!1093 = !DILocation(line: 258, column: 9, scope: !855)
!1094 = !DILocation(line: 259, column: 11, scope: !855)
!1095 = !DILocation(line: 256, column: 9, scope: !855)
!1096 = !DILocation(line: 257, column: 11, scope: !855)
!1097 = !DILocation(line: 270, column: 19, scope: !855)
!1098 = !DILocation(line: 270, column: 25, scope: !855)
!1099 = !DILocation(line: 270, column: 15, scope: !855)
!1100 = !DILocation(line: 262, column: 9, scope: !855)
!1101 = !DILocation(line: 263, column: 11, scope: !855)
!1102 = !DILocation(line: 269, column: 19, scope: !855)
!1103 = !DILocation(line: 269, column: 25, scope: !855)
!1104 = !DILocation(line: 269, column: 15, scope: !855)
!1105 = !DILocation(line: 260, column: 9, scope: !855)
!1106 = !DILocation(line: 261, column: 11, scope: !855)
!1107 = !DILocation(line: 268, column: 19, scope: !855)
!1108 = !DILocation(line: 268, column: 25, scope: !855)
!1109 = !DILocation(line: 268, column: 15, scope: !855)
!1110 = !DILocation(line: 267, column: 19, scope: !855)
!1111 = !DILocation(line: 267, column: 25, scope: !855)
!1112 = !DILocation(line: 267, column: 15, scope: !855)
!1113 = !DILocation(line: 266, column: 19, scope: !855)
!1114 = !DILocation(line: 266, column: 25, scope: !855)
!1115 = !DILocation(line: 266, column: 15, scope: !855)
!1116 = !DILocation(line: 248, column: 9, scope: !855)
!1117 = !DILocation(line: 249, column: 11, scope: !855)
!1118 = !DILocation(line: 242, column: 9, scope: !855)
!1119 = !DILocation(line: 243, column: 11, scope: !855)
!1120 = !DILocation(line: 240, column: 9, scope: !855)
!1121 = !DILocation(line: 241, column: 11, scope: !855)
!1122 = !DILocation(line: 254, column: 19, scope: !855)
!1123 = !DILocation(line: 254, column: 25, scope: !855)
!1124 = !DILocation(line: 254, column: 15, scope: !855)
!1125 = !DILocation(line: 246, column: 9, scope: !855)
!1126 = !DILocation(line: 247, column: 11, scope: !855)
!1127 = !DILocation(line: 253, column: 19, scope: !855)
!1128 = !DILocation(line: 253, column: 25, scope: !855)
!1129 = !DILocation(line: 253, column: 15, scope: !855)
!1130 = !DILocation(line: 244, column: 9, scope: !855)
!1131 = !DILocation(line: 245, column: 11, scope: !855)
!1132 = !DILocation(line: 252, column: 19, scope: !855)
!1133 = !DILocation(line: 252, column: 25, scope: !855)
!1134 = !DILocation(line: 252, column: 15, scope: !855)
!1135 = !DILocation(line: 251, column: 19, scope: !855)
!1136 = !DILocation(line: 251, column: 25, scope: !855)
!1137 = !DILocation(line: 251, column: 15, scope: !855)
!1138 = !DILocation(line: 250, column: 19, scope: !855)
!1139 = !DILocation(line: 250, column: 25, scope: !855)
!1140 = !DILocation(line: 250, column: 15, scope: !855)
!1141 = !DILocation(line: 231, column: 9, scope: !855)
!1142 = !DILocation(line: 232, column: 11, scope: !855)
!1143 = !DILocation(line: 225, column: 9, scope: !855)
!1144 = !DILocation(line: 226, column: 11, scope: !855)
!1145 = !DILocation(line: 223, column: 9, scope: !855)
!1146 = !DILocation(line: 238, column: 19, scope: !855)
!1147 = !DILocation(line: 238, column: 25, scope: !855)
!1148 = !DILocation(line: 238, column: 15, scope: !855)
!1149 = !DILocation(line: 229, column: 9, scope: !855)
!1150 = !DILocation(line: 230, column: 11, scope: !855)
!1151 = !DILocation(line: 237, column: 19, scope: !855)
!1152 = !DILocation(line: 237, column: 25, scope: !855)
!1153 = !DILocation(line: 237, column: 15, scope: !855)
!1154 = !DILocation(line: 227, column: 9, scope: !855)
!1155 = !DILocation(line: 228, column: 11, scope: !855)
!1156 = !DILocation(line: 236, column: 19, scope: !855)
!1157 = !DILocation(line: 236, column: 25, scope: !855)
!1158 = !DILocation(line: 236, column: 15, scope: !855)
!1159 = !DILocation(line: 235, column: 19, scope: !855)
!1160 = !DILocation(line: 235, column: 25, scope: !855)
!1161 = !DILocation(line: 235, column: 15, scope: !855)
!1162 = !DILocation(line: 234, column: 51, scope: !855)
!1163 = !DILocation(line: 234, column: 22, scope: !855)
!1164 = !DILocation(line: 233, column: 19, scope: !855)
!1165 = !DILocation(line: 233, column: 25, scope: !855)
!1166 = !DILocation(line: 234, column: 9, scope: !855)
!1167 = !DILocation(line: 113, column: 42, scope: !856)
!1168 = !DILocation(line: 113, column: 25, scope: !856)
!1169 = distinct !{!1169, !817, !1170, !169}
!1170 = !DILocation(line: 303, column: 3, scope: !818)
!1171 = !DILocation(line: 306, column: 12, scope: !760)
!1172 = !DILocation(line: 307, column: 3, scope: !760)
!1173 = !DILocation(line: 307, column: 12, scope: !760)
!1174 = !DILocation(line: 308, column: 3, scope: !760)
!1175 = !DILocation(line: 308, column: 12, scope: !760)
!1176 = !DILocation(line: 309, column: 3, scope: !760)
!1177 = !DILocation(line: 309, column: 12, scope: !760)
!1178 = !DILocation(line: 310, column: 3, scope: !760)
!1179 = !DILocation(line: 310, column: 12, scope: !760)
!1180 = !DILocation(line: 311, column: 3, scope: !760)
!1181 = !DILocation(line: 311, column: 12, scope: !760)
!1182 = !DILocation(line: 312, column: 3, scope: !760)
!1183 = !DILocation(line: 312, column: 12, scope: !760)
!1184 = !DILocation(line: 313, column: 3, scope: !760)
!1185 = !DILocation(line: 313, column: 12, scope: !760)
!1186 = !DILocation(line: 314, column: 3, scope: !760)
!1187 = !DILocation(line: 314, column: 12, scope: !760)
!1188 = !DILocation(line: 315, column: 3, scope: !760)
!1189 = !DILocation(line: 315, column: 12, scope: !760)
!1190 = !DILocation(line: 316, column: 3, scope: !760)
!1191 = !DILocation(line: 316, column: 13, scope: !760)
!1192 = !DILocation(line: 317, column: 3, scope: !760)
!1193 = !DILocation(line: 317, column: 13, scope: !760)
!1194 = !DILocation(line: 318, column: 3, scope: !760)
!1195 = !DILocation(line: 318, column: 13, scope: !760)
!1196 = !DILocation(line: 319, column: 3, scope: !760)
!1197 = !DILocation(line: 319, column: 13, scope: !760)
!1198 = !DILocation(line: 320, column: 3, scope: !760)
!1199 = !DILocation(line: 320, column: 13, scope: !760)
!1200 = !DILocation(line: 321, column: 3, scope: !760)
!1201 = !DILocation(line: 321, column: 13, scope: !760)
!1202 = !DILocation(line: 322, column: 3, scope: !760)
!1203 = !DILocation(line: 322, column: 13, scope: !760)
!1204 = !DILocation(line: 323, column: 3, scope: !760)
!1205 = !DILocation(line: 323, column: 13, scope: !760)
!1206 = !DILocation(line: 324, column: 3, scope: !760)
!1207 = !DILocation(line: 324, column: 13, scope: !760)
!1208 = !DILocation(line: 325, column: 3, scope: !760)
!1209 = !DILocation(line: 325, column: 13, scope: !760)
!1210 = !DILocation(line: 326, column: 3, scope: !760)
!1211 = !DILocation(line: 326, column: 13, scope: !760)
!1212 = !DILocation(line: 327, column: 3, scope: !760)
!1213 = !DILocation(line: 327, column: 13, scope: !760)
!1214 = !DILocation(line: 328, column: 3, scope: !760)
!1215 = !DILocation(line: 328, column: 13, scope: !760)
!1216 = !DILocation(line: 329, column: 3, scope: !760)
!1217 = !DILocation(line: 329, column: 13, scope: !760)
!1218 = !DILocation(line: 330, column: 3, scope: !760)
!1219 = !DILocation(line: 330, column: 13, scope: !760)
!1220 = !DILocation(line: 331, column: 1, scope: !760)
!1221 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 410, type: !1222, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{!76, !35, !74, !763, !76, !76}
!1224 = !DILocalVariable(name: "out", arg: 1, scope: !1221, file: !27, line: 410, type: !35)
!1225 = !DILocation(line: 0, scope: !1221)
!1226 = !DILocalVariable(name: "outlen", arg: 2, scope: !1221, file: !27, line: 410, type: !74)
!1227 = !DILocalVariable(name: "s", arg: 3, scope: !1221, file: !27, line: 410, type: !763)
!1228 = !DILocalVariable(name: "pos", arg: 4, scope: !1221, file: !27, line: 411, type: !76)
!1229 = !DILocalVariable(name: "r", arg: 5, scope: !1221, file: !27, line: 411, type: !76)
!1230 = !DILocation(line: 414, column: 3, scope: !1221)
!1231 = !DILocation(line: 415, column: 13, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1233, file: !27, line: 415, column: 9)
!1233 = distinct !DILexicalBlock(scope: !1221, file: !27, line: 414, column: 18)
!1234 = !DILocation(line: 416, column: 7, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1232, file: !27, line: 415, column: 19)
!1236 = !DILocation(line: 418, column: 5, scope: !1235)
!1237 = !DILocalVariable(name: "i", scope: !1221, file: !27, line: 412, type: !76)
!1238 = !DILocation(line: 419, column: 21, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1240, file: !27, line: 419, column: 5)
!1240 = distinct !DILexicalBlock(scope: !1233, file: !27, line: 419, column: 5)
!1241 = !DILocation(line: 419, column: 25, scope: !1239)
!1242 = !DILocation(line: 419, column: 5, scope: !1240)
!1243 = !DILocation(line: 420, column: 20, scope: !1239)
!1244 = !DILocation(line: 420, column: 16, scope: !1239)
!1245 = !DILocation(line: 420, column: 30, scope: !1239)
!1246 = !DILocation(line: 420, column: 25, scope: !1239)
!1247 = !DILocation(line: 420, column: 14, scope: !1239)
!1248 = !DILocation(line: 420, column: 11, scope: !1239)
!1249 = !DILocation(line: 419, column: 47, scope: !1239)
!1250 = distinct !{!1250, !1242, !1251, !169}
!1251 = !DILocation(line: 420, column: 38, scope: !1240)
!1252 = !DILocation(line: 419, scope: !1240)
!1253 = !DILocation(line: 421, column: 17, scope: !1233)
!1254 = !DILocation(line: 421, column: 12, scope: !1233)
!1255 = distinct !{!1255, !1230, !1256, !169}
!1256 = !DILocation(line: 423, column: 3, scope: !1221)
!1257 = !DILocation(line: 425, column: 3, scope: !1221)
!1258 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 556, type: !1259, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{null, !1261, !121, !74}
!1261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 32)
!1262 = !DILocalVariable(name: "state", arg: 1, scope: !1258, file: !27, line: 556, type: !1261)
!1263 = !DILocation(line: 0, scope: !1258)
!1264 = !DILocalVariable(name: "in", arg: 2, scope: !1258, file: !27, line: 556, type: !121)
!1265 = !DILocalVariable(name: "inlen", arg: 3, scope: !1258, file: !27, line: 557, type: !74)
!1266 = !DILocation(line: 558, column: 3, scope: !1258)
!1267 = !DILocation(line: 559, column: 3, scope: !1258)
!1268 = !DILocation(line: 559, column: 29, scope: !1258)
!1269 = !DILocation(line: 560, column: 1, scope: !1258)
!1270 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 441, type: !1271, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1271 = !DISubroutineType(types: !1272)
!1272 = !{null, !763, !76, !121, !74, !36}
!1273 = !DILocalVariable(name: "s", arg: 1, scope: !1270, file: !27, line: 441, type: !763)
!1274 = !DILocation(line: 0, scope: !1270)
!1275 = !DILocalVariable(name: "r", arg: 2, scope: !1270, file: !27, line: 441, type: !76)
!1276 = !DILocalVariable(name: "in", arg: 3, scope: !1270, file: !27, line: 442, type: !121)
!1277 = !DILocalVariable(name: "inlen", arg: 4, scope: !1270, file: !27, line: 442, type: !74)
!1278 = !DILocalVariable(name: "p", arg: 5, scope: !1270, file: !27, line: 442, type: !36)
!1279 = !DILocalVariable(name: "i", scope: !1270, file: !27, line: 443, type: !76)
!1280 = !DILocation(line: 445, column: 3, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1270, file: !27, line: 445, column: 3)
!1282 = !DILocation(line: 448, column: 3, scope: !1270)
!1283 = !DILocation(line: 448, column: 16, scope: !1270)
!1284 = !DILocation(line: 446, column: 5, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1281, file: !27, line: 445, column: 3)
!1286 = !DILocation(line: 446, column: 10, scope: !1285)
!1287 = !DILocation(line: 445, column: 24, scope: !1285)
!1288 = !DILocation(line: 445, column: 17, scope: !1285)
!1289 = distinct !{!1289, !1280, !1290, !169}
!1290 = !DILocation(line: 446, column: 12, scope: !1281)
!1291 = !DILocation(line: 449, column: 5, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1293, file: !27, line: 449, column: 5)
!1293 = distinct !DILexicalBlock(scope: !1270, file: !27, line: 448, column: 22)
!1294 = !DILocation(line: 456, column: 17, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1296, file: !27, line: 456, column: 3)
!1296 = distinct !DILexicalBlock(scope: !1270, file: !27, line: 456, column: 3)
!1297 = !DILocation(line: 456, column: 3, scope: !1296)
!1298 = !DILocation(line: 450, column: 29, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1292, file: !27, line: 449, column: 5)
!1300 = !DILocation(line: 450, column: 25, scope: !1299)
!1301 = !DILocation(line: 450, column: 15, scope: !1299)
!1302 = !DILocation(line: 450, column: 7, scope: !1299)
!1303 = !DILocation(line: 450, column: 12, scope: !1299)
!1304 = !DILocation(line: 449, column: 29, scope: !1299)
!1305 = !DILocation(line: 449, column: 19, scope: !1299)
!1306 = distinct !{!1306, !1291, !1307, !169}
!1307 = !DILocation(line: 450, column: 32, scope: !1292)
!1308 = !DILocation(line: 451, column: 8, scope: !1293)
!1309 = !DILocation(line: 452, column: 11, scope: !1293)
!1310 = !DILocation(line: 453, column: 5, scope: !1293)
!1311 = distinct !{!1311, !1282, !1312, !169}
!1312 = !DILocation(line: 454, column: 3, scope: !1270)
!1313 = !DILocation(line: 457, column: 27, scope: !1295)
!1314 = !DILocation(line: 457, column: 17, scope: !1295)
!1315 = !DILocation(line: 457, column: 38, scope: !1295)
!1316 = !DILocation(line: 457, column: 33, scope: !1295)
!1317 = !DILocation(line: 457, column: 9, scope: !1295)
!1318 = !DILocation(line: 457, column: 5, scope: !1295)
!1319 = !DILocation(line: 457, column: 14, scope: !1295)
!1320 = !DILocation(line: 456, column: 27, scope: !1295)
!1321 = distinct !{!1321, !1297, !1322, !169}
!1322 = !DILocation(line: 457, column: 46, scope: !1296)
!1323 = !DILocation(line: 456, scope: !1296)
!1324 = !DILocation(line: 459, column: 15, scope: !1270)
!1325 = !DILocation(line: 459, column: 32, scope: !1270)
!1326 = !DILocation(line: 459, column: 27, scope: !1270)
!1327 = !DILocation(line: 459, column: 7, scope: !1270)
!1328 = !DILocation(line: 459, column: 3, scope: !1270)
!1329 = !DILocation(line: 459, column: 12, scope: !1270)
!1330 = !DILocation(line: 460, column: 8, scope: !1270)
!1331 = !DILocation(line: 460, column: 13, scope: !1270)
!1332 = !DILocation(line: 460, column: 3, scope: !1270)
!1333 = !DILocation(line: 460, column: 18, scope: !1270)
!1334 = !DILocation(line: 461, column: 1, scope: !1270)
!1335 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !1336, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!23, !121}
!1338 = !DILocalVariable(name: "x", arg: 1, scope: !1335, file: !27, line: 22, type: !121)
!1339 = !DILocation(line: 0, scope: !1335)
!1340 = !DILocalVariable(name: "r", scope: !1335, file: !27, line: 24, type: !23)
!1341 = !DILocalVariable(name: "i", scope: !1335, file: !27, line: 23, type: !76)
!1342 = !DILocation(line: 26, column: 3, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1335, file: !27, line: 26, column: 3)
!1344 = !DILocation(line: 27, column: 20, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1343, file: !27, line: 26, column: 3)
!1346 = !DILocation(line: 27, column: 10, scope: !1345)
!1347 = !DILocation(line: 27, column: 30, scope: !1345)
!1348 = !DILocation(line: 27, column: 25, scope: !1345)
!1349 = !DILocation(line: 27, column: 7, scope: !1345)
!1350 = !DILocation(line: 26, column: 23, scope: !1345)
!1351 = !DILocation(line: 26, column: 17, scope: !1345)
!1352 = distinct !{!1352, !1342, !1353, !169}
!1353 = !DILocation(line: 27, column: 32, scope: !1343)
!1354 = !DILocation(line: 29, column: 3, scope: !1335)
!1355 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 575, type: !1356, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{null, !35, !74, !1261}
!1358 = !DILocalVariable(name: "out", arg: 1, scope: !1355, file: !27, line: 575, type: !35)
!1359 = !DILocation(line: 0, scope: !1355)
!1360 = !DILocalVariable(name: "nblocks", arg: 2, scope: !1355, file: !27, line: 575, type: !74)
!1361 = !DILocalVariable(name: "state", arg: 3, scope: !1355, file: !27, line: 575, type: !1261)
!1362 = !DILocation(line: 576, column: 3, scope: !1355)
!1363 = !DILocation(line: 577, column: 1, scope: !1355)
!1364 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 477, type: !1365, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{null, !35, !74, !763, !76}
!1367 = !DILocalVariable(name: "out", arg: 1, scope: !1364, file: !27, line: 477, type: !35)
!1368 = !DILocation(line: 0, scope: !1364)
!1369 = !DILocalVariable(name: "nblocks", arg: 2, scope: !1364, file: !27, line: 477, type: !74)
!1370 = !DILocalVariable(name: "s", arg: 3, scope: !1364, file: !27, line: 477, type: !763)
!1371 = !DILocalVariable(name: "r", arg: 4, scope: !1364, file: !27, line: 478, type: !76)
!1372 = !DILocation(line: 481, column: 3, scope: !1364)
!1373 = !DILocation(line: 482, column: 5, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1364, file: !27, line: 481, column: 19)
!1375 = !DILocalVariable(name: "i", scope: !1364, file: !27, line: 479, type: !76)
!1376 = !DILocation(line: 483, column: 5, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1374, file: !27, line: 483, column: 5)
!1378 = !DILocation(line: 484, column: 23, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1377, file: !27, line: 483, column: 5)
!1380 = !DILocation(line: 484, column: 19, scope: !1379)
!1381 = !DILocation(line: 484, column: 28, scope: !1379)
!1382 = !DILocation(line: 484, column: 7, scope: !1379)
!1383 = !DILocation(line: 483, column: 29, scope: !1379)
!1384 = !DILocation(line: 483, column: 19, scope: !1379)
!1385 = distinct !{!1385, !1376, !1386, !169}
!1386 = !DILocation(line: 484, column: 32, scope: !1377)
!1387 = !DILocation(line: 485, column: 9, scope: !1374)
!1388 = !DILocation(line: 486, column: 13, scope: !1374)
!1389 = distinct !{!1389, !1372, !1390, !169}
!1390 = !DILocation(line: 487, column: 3, scope: !1364)
!1391 = !DILocation(line: 488, column: 1, scope: !1364)
!1392 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 41, type: !1393, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{null, !35, !23}
!1395 = !DILocalVariable(name: "x", arg: 1, scope: !1392, file: !27, line: 41, type: !35)
!1396 = !DILocation(line: 0, scope: !1392)
!1397 = !DILocalVariable(name: "u", arg: 2, scope: !1392, file: !27, line: 41, type: !23)
!1398 = !DILocalVariable(name: "i", scope: !1392, file: !27, line: 42, type: !76)
!1399 = !DILocation(line: 44, column: 3, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1392, file: !27, line: 44, column: 3)
!1401 = !DILocation(line: 45, column: 19, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1400, file: !27, line: 44, column: 3)
!1403 = !DILocation(line: 45, column: 14, scope: !1402)
!1404 = !DILocation(line: 45, column: 12, scope: !1402)
!1405 = !DILocation(line: 45, column: 5, scope: !1402)
!1406 = !DILocation(line: 45, column: 10, scope: !1402)
!1407 = !DILocation(line: 44, column: 23, scope: !1402)
!1408 = !DILocation(line: 44, column: 17, scope: !1402)
!1409 = distinct !{!1409, !1399, !1410, !169}
!1410 = !DILocation(line: 45, column: 21, scope: !1400)
!1411 = !DILocation(line: 46, column: 1, scope: !1392)
!1412 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 629, type: !1356, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1413 = !DILocalVariable(name: "out", arg: 1, scope: !1412, file: !27, line: 629, type: !35)
!1414 = !DILocation(line: 0, scope: !1412)
!1415 = !DILocalVariable(name: "outlen", arg: 2, scope: !1412, file: !27, line: 629, type: !74)
!1416 = !DILocalVariable(name: "state", arg: 3, scope: !1412, file: !27, line: 629, type: !1261)
!1417 = !DILocation(line: 631, column: 28, scope: !1412)
!1418 = !DILocation(line: 630, column: 31, scope: !1412)
!1419 = !DILocation(line: 630, column: 3, scope: !1412)
!1420 = !DILocation(line: 630, column: 29, scope: !1412)
!1421 = !DILocation(line: 632, column: 1, scope: !1412)
!1422 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 645, type: !1259, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1423 = !DILocalVariable(name: "state", arg: 1, scope: !1422, file: !27, line: 645, type: !1261)
!1424 = !DILocation(line: 0, scope: !1422)
!1425 = !DILocalVariable(name: "in", arg: 2, scope: !1422, file: !27, line: 645, type: !121)
!1426 = !DILocalVariable(name: "inlen", arg: 3, scope: !1422, file: !27, line: 646, type: !74)
!1427 = !DILocation(line: 647, column: 3, scope: !1422)
!1428 = !DILocation(line: 648, column: 3, scope: !1422)
!1429 = !DILocation(line: 648, column: 29, scope: !1422)
!1430 = !DILocation(line: 649, column: 1, scope: !1422)
!1431 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 664, type: !1356, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1432 = !DILocalVariable(name: "out", arg: 1, scope: !1431, file: !27, line: 664, type: !35)
!1433 = !DILocation(line: 0, scope: !1431)
!1434 = !DILocalVariable(name: "nblocks", arg: 2, scope: !1431, file: !27, line: 664, type: !74)
!1435 = !DILocalVariable(name: "state", arg: 3, scope: !1431, file: !27, line: 664, type: !1261)
!1436 = !DILocation(line: 665, column: 3, scope: !1431)
!1437 = !DILocation(line: 666, column: 1, scope: !1431)
!1438 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 700, type: !1439, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1439 = !DISubroutineType(types: !1440)
!1440 = !{null, !35, !74, !121, !74}
!1441 = !DILocalVariable(name: "out", arg: 1, scope: !1438, file: !27, line: 700, type: !35)
!1442 = !DILocation(line: 0, scope: !1438)
!1443 = !DILocalVariable(name: "outlen", arg: 2, scope: !1438, file: !27, line: 700, type: !74)
!1444 = !DILocalVariable(name: "in", arg: 3, scope: !1438, file: !27, line: 700, type: !121)
!1445 = !DILocalVariable(name: "inlen", arg: 4, scope: !1438, file: !27, line: 700, type: !74)
!1446 = !DILocalVariable(name: "state", scope: !1438, file: !27, line: 702, type: !135)
!1447 = !DILocation(line: 702, column: 16, scope: !1438)
!1448 = !DILocation(line: 704, column: 3, scope: !1438)
!1449 = !DILocation(line: 705, column: 20, scope: !1438)
!1450 = !DILocalVariable(name: "nblocks", scope: !1438, file: !27, line: 701, type: !74)
!1451 = !DILocation(line: 706, column: 3, scope: !1438)
!1452 = !DILocation(line: 707, column: 21, scope: !1438)
!1453 = !DILocation(line: 707, column: 10, scope: !1438)
!1454 = !DILocation(line: 708, column: 18, scope: !1438)
!1455 = !DILocation(line: 708, column: 7, scope: !1438)
!1456 = !DILocation(line: 709, column: 3, scope: !1438)
!1457 = !DILocation(line: 710, column: 1, scope: !1438)
!1458 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 740, type: !1459, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !77)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{null, !35, !121, !74}
!1461 = !DILocalVariable(name: "h", arg: 1, scope: !1458, file: !27, line: 740, type: !35)
!1462 = !DILocation(line: 0, scope: !1458)
!1463 = !DILocalVariable(name: "in", arg: 2, scope: !1458, file: !27, line: 740, type: !121)
!1464 = !DILocalVariable(name: "inlen", arg: 3, scope: !1458, file: !27, line: 740, type: !74)
!1465 = !DILocalVariable(name: "s", scope: !1458, file: !27, line: 742, type: !1466)
!1466 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !1467)
!1467 = !{!1468}
!1468 = !DISubrange(count: 25)
!1469 = !DILocation(line: 742, column: 12, scope: !1458)
!1470 = !DILocation(line: 744, column: 3, scope: !1458)
!1471 = !DILocation(line: 745, column: 3, scope: !1458)
!1472 = !DILocalVariable(name: "i", scope: !1458, file: !27, line: 741, type: !76)
!1473 = !DILocation(line: 746, column: 3, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1458, file: !27, line: 746, column: 3)
!1475 = !DILocation(line: 747, column: 19, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1474, file: !27, line: 746, column: 3)
!1477 = !DILocation(line: 747, column: 15, scope: !1476)
!1478 = !DILocation(line: 747, column: 24, scope: !1476)
!1479 = !DILocation(line: 747, column: 5, scope: !1476)
!1480 = !DILocation(line: 746, column: 23, scope: !1476)
!1481 = !DILocation(line: 746, column: 17, scope: !1476)
!1482 = distinct !{!1482, !1473, !1483, !169}
!1483 = !DILocation(line: 747, column: 28, scope: !1474)
!1484 = !DILocation(line: 748, column: 1, scope: !1458)
!1485 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !1486, file: !1486, line: 18, type: !1487, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !77)
!1486 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1487 = !DISubroutineType(types: !1488)
!1488 = !{null, !1261, !121, !36, !36}
!1489 = !DILocalVariable(name: "state", arg: 1, scope: !1485, file: !1486, line: 18, type: !1261)
!1490 = !DILocation(line: 0, scope: !1485)
!1491 = !DILocalVariable(name: "seed", arg: 2, scope: !1485, file: !1486, line: 19, type: !121)
!1492 = !DILocalVariable(name: "x", arg: 3, scope: !1485, file: !1486, line: 20, type: !36)
!1493 = !DILocalVariable(name: "y", arg: 4, scope: !1485, file: !1486, line: 21, type: !36)
!1494 = !DILocalVariable(name: "extseed", scope: !1485, file: !1486, line: 23, type: !1495)
!1495 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 272, elements: !1496)
!1496 = !{!1497}
!1497 = !DISubrange(count: 34)
!1498 = !DILocation(line: 23, column: 11, scope: !1485)
!1499 = !DILocation(line: 25, column: 3, scope: !1485)
!1500 = !DILocation(line: 26, column: 3, scope: !1485)
!1501 = !DILocation(line: 26, column: 29, scope: !1485)
!1502 = !DILocation(line: 27, column: 3, scope: !1485)
!1503 = !DILocation(line: 27, column: 29, scope: !1485)
!1504 = !DILocation(line: 29, column: 3, scope: !1485)
!1505 = !DILocation(line: 30, column: 1, scope: !1485)
!1506 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !1486, file: !1486, line: 43, type: !1507, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !77)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{null, !35, !74, !121, !36}
!1509 = !DILocalVariable(name: "out", arg: 1, scope: !1506, file: !1486, line: 43, type: !35)
!1510 = !DILocation(line: 0, scope: !1506)
!1511 = !DILocalVariable(name: "outlen", arg: 2, scope: !1506, file: !1486, line: 43, type: !74)
!1512 = !DILocalVariable(name: "key", arg: 3, scope: !1506, file: !1486, line: 43, type: !121)
!1513 = !DILocalVariable(name: "nonce", arg: 4, scope: !1506, file: !1486, line: 43, type: !36)
!1514 = !DILocalVariable(name: "extkey", scope: !1506, file: !1486, line: 45, type: !1515)
!1515 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 264, elements: !1516)
!1516 = !{!1517}
!1517 = !DISubrange(count: 33)
!1518 = !DILocation(line: 45, column: 11, scope: !1506)
!1519 = !DILocation(line: 47, column: 3, scope: !1506)
!1520 = !DILocation(line: 48, column: 3, scope: !1506)
!1521 = !DILocation(line: 48, column: 26, scope: !1506)
!1522 = !DILocation(line: 50, column: 3, scope: !1506)
!1523 = !DILocation(line: 51, column: 1, scope: !1506)
