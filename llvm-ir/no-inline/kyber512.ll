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
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #4, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #3, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !77
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
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !90
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !91
  ret i32 0, !dbg !92
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !93 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !96, !DIExpression(), !97)
    #dbg_value(ptr %ss, !98, !DIExpression(), !97)
    #dbg_value(ptr %pk, !99, !DIExpression(), !97)
    #dbg_value(ptr %coins, !100, !DIExpression(), !97)
    #dbg_declare(ptr %buf, !101, !DIExpression(), !102)
    #dbg_declare(ptr %kr, !103, !DIExpression(), !104)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !105
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !106
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #3, !dbg !106
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !107
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !108
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !109
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !112 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !113, !DIExpression(), !114)
    #dbg_value(ptr %ss, !115, !DIExpression(), !114)
    #dbg_value(ptr %pk, !116, !DIExpression(), !114)
    #dbg_declare(ptr %coins, !117, !DIExpression(), !121)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !122
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !125 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !128, !DIExpression(), !129)
    #dbg_value(ptr %ct, !130, !DIExpression(), !129)
    #dbg_value(ptr %sk, !131, !DIExpression(), !129)
    #dbg_declare(ptr %buf, !132, !DIExpression(), !133)
    #dbg_declare(ptr %kr, !134, !DIExpression(), !135)
    #dbg_declare(ptr %cmp, !136, !DIExpression(), !140)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !141
    #dbg_value(ptr %add.ptr, !142, !DIExpression(), !129)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !143
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !144
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !145
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !146
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !147
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !148
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !149
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 768) #3, !dbg !150
    #dbg_value(i32 %call12, !151, !DIExpression(), !129)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !152
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !152
  %tobool.not = icmp eq i32 %call12, 0, !dbg !153
  %conv = zext i1 %tobool.not to i8, !dbg !153
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !156 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !177, !DIExpression(), !178)
    #dbg_value(ptr %seed, !179, !DIExpression(), !178)
    #dbg_value(i32 %transposed, !180, !DIExpression(), !178)
    #dbg_declare(ptr %buf, !181, !DIExpression(), !185)
    #dbg_declare(ptr %state, !186, !DIExpression(), !198)
    #dbg_value(i32 0, !199, !DIExpression(), !178)
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !202
    #dbg_value(i32 %i.0, !199, !DIExpression(), !178)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !203
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end22, !dbg !205

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !206

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !209
    #dbg_value(i32 %j.0, !210, !DIExpression(), !178)
  %exitcond = icmp ne i32 %j.0, 2, !dbg !211
  br i1 %exitcond, label %for.body3, label %for.inc20, !dbg !206

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !213
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !213

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !216
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !216
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !216
  br label %if.end, !dbg !216

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !217
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !217
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !218
    #dbg_value(i32 504, !219, !DIExpression(), !178)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !220
  %arrayidx7 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !220
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !221
    #dbg_value(i32 %call, !222, !DIExpression(), !178)
  br label %while.cond, !dbg !223

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !224
    #dbg_value(i32 %ctr.0, !222, !DIExpression(), !178)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !225
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !223

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !226
    #dbg_value(i32 168, !219, !DIExpression(), !178)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !228
  %arrayidx15 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !228
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !229
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !230
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !231
  %add = add i32 %ctr.0, %call19, !dbg !232
    #dbg_value(i32 %add, !222, !DIExpression(), !178)
  br label %while.cond, !dbg !223, !llvm.loop !233

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !236
    #dbg_value(i32 %inc, !210, !DIExpression(), !178)
  br label %for.cond1, !dbg !237, !llvm.loop !238

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !240
    #dbg_value(i32 %inc21, !199, !DIExpression(), !178)
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !244
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !245 {
entry:
    #dbg_value(ptr %r, !249, !DIExpression(), !250)
    #dbg_value(i32 %len, !251, !DIExpression(), !250)
    #dbg_value(ptr %buf, !252, !DIExpression(), !250)
    #dbg_value(i32 %buflen, !253, !DIExpression(), !250)
    #dbg_value(i32 0, !254, !DIExpression(), !250)
    #dbg_value(i32 0, !255, !DIExpression(), !250)
  br label %while.cond, !dbg !256

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !250
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !250
    #dbg_value(i32 %pos.0, !254, !DIExpression(), !250)
    #dbg_value(i32 %ctr.0, !255, !DIExpression(), !250)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !257
  %add = add i32 %pos.0, 3, !dbg !258
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !258
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !258
  br i1 %0, label %while.body, label %while.end, !dbg !256

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !259
  %1 = load i8, ptr %arrayidx, align 1, !dbg !259
  %conv = zext i8 %1 to i16, !dbg !259
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !261
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !261
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !261
  %conv6 = zext i8 %3 to i16, !dbg !262
  %shl = shl nuw i16 %conv6, 8, !dbg !263
  %shl.masked = and i16 %shl, 3840, !dbg !264
  %and = or disjoint i16 %shl.masked, %conv, !dbg !264
    #dbg_value(i16 %and, !265, !DIExpression(), !250)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !266
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !266
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !266
  %6 = lshr i8 %5, 4, !dbg !267
  %shr11 = zext nneg i8 %6 to i16, !dbg !267
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !268
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !268
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !268
  %conv15 = zext i8 %8 to i16, !dbg !269
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !270
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !271
    #dbg_value(i16 %or17, !272, !DIExpression(), !250)
  %add20 = add i32 %pos.0, 3, !dbg !273
    #dbg_value(i32 %add20, !254, !DIExpression(), !250)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !274
  br i1 %cmp22, label %if.then, label %if.end, !dbg !274

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !276
    #dbg_value(i32 %inc, !255, !DIExpression(), !250)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !277
  store i16 %and, ptr %arrayidx24, align 2, !dbg !278
  br label %if.end, !dbg !277

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !250
    #dbg_value(i32 %ctr.1, !255, !DIExpression(), !250)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !279
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !281
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !281

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !282
    #dbg_value(i32 %inc31, !255, !DIExpression(), !250)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !283
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !284
  br label %if.end33, !dbg !283

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !285
    #dbg_value(i32 %ctr.2, !255, !DIExpression(), !250)
  br label %while.cond, !dbg !256, !llvm.loop !286

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !250
  ret i32 %ctr.0.lcssa, !dbg !288
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !289 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !292, !DIExpression(), !293)
    #dbg_value(ptr %sk, !294, !DIExpression(), !293)
    #dbg_value(ptr %coins, !295, !DIExpression(), !293)
    #dbg_declare(ptr %buf, !296, !DIExpression(), !297)
    #dbg_value(ptr %buf, !298, !DIExpression(), !293)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !299
    #dbg_value(ptr %add.ptr, !300, !DIExpression(), !293)
    #dbg_value(i8 0, !301, !DIExpression(), !293)
    #dbg_declare(ptr %a, !302, !DIExpression(), !304)
    #dbg_declare(ptr %e, !305, !DIExpression(), !306)
    #dbg_declare(ptr %pkpv, !307, !DIExpression(), !308)
    #dbg_declare(ptr %skpv, !309, !DIExpression(), !310)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !311
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !312
  store i8 2, ptr %arrayidx, align 1, !dbg !313
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !314
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !315
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !319
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !293
    #dbg_value(i8 %nonce.0, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.0, !316, !DIExpression(), !293)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !320
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !322

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !323

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !325
    #dbg_value(i8 %nonce.0, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !326
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !327
    #dbg_value(i8 %inc, !301, !DIExpression(), !293)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !328
    #dbg_value(i32 %inc7, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !329, !llvm.loop !330

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc15, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !332
  %nonce.1 = phi i8 [ %inc13, %for.body10 ], [ 2, %for.cond8.preheader ], !dbg !293
    #dbg_value(i8 %nonce.1, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.1, !316, !DIExpression(), !293)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !333
  br i1 %exitcond1, label %for.body10, label %for.end16, !dbg !323

for.body10:                                       ; preds = %for.cond8
  %arrayidx12 = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !335
    #dbg_value(i8 %nonce.1, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !336
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !337
    #dbg_value(i8 %inc13, !301, !DIExpression(), !293)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !338
    #dbg_value(i32 %inc15, !316, !DIExpression(), !293)
  br label %for.cond8, !dbg !339, !llvm.loop !340

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !342
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !343
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !344

for.cond17:                                       ; preds = %for.body19, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.body19 ], !dbg !346
    #dbg_value(i32 %i.2, !316, !DIExpression(), !293)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !347
  br i1 %exitcond2, label %for.body19, label %for.end27, !dbg !349

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !350
  %arrayidx22 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !352
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #3, !dbg !353
  %arrayidx24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !354
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef nonnull %arrayidx24) #3, !dbg !355
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !356
    #dbg_value(i32 %inc26, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !357, !llvm.loop !358

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !360
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !361
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !362
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !363
  ret void, !dbg !364
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef %sk) unnamed_addr #0 !dbg !365 {
entry:
    #dbg_value(ptr %r, !368, !DIExpression(), !369)
    #dbg_value(ptr %sk, !370, !DIExpression(), !369)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #3, !dbg !371
  ret void, !dbg !372
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) unnamed_addr #0 !dbg !373 {
entry:
    #dbg_value(ptr %r, !376, !DIExpression(), !377)
    #dbg_value(ptr %pk, !378, !DIExpression(), !377)
    #dbg_value(ptr %seed, !379, !DIExpression(), !377)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #3, !dbg !380
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 768, !dbg !381
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %seed, i32 noundef 32) #4, !dbg !382
  ret void, !dbg !383
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !384 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [2 x %struct.polyvec], align 2
  %b = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %k = alloca %struct.poly, align 2
  %epp = alloca %struct.poly, align 2
    #dbg_value(ptr %c, !387, !DIExpression(), !388)
    #dbg_value(ptr %m, !389, !DIExpression(), !388)
    #dbg_value(ptr %pk, !390, !DIExpression(), !388)
    #dbg_value(ptr %coins, !391, !DIExpression(), !388)
    #dbg_declare(ptr %seed, !392, !DIExpression(), !393)
    #dbg_value(i8 0, !394, !DIExpression(), !388)
    #dbg_declare(ptr %sp, !395, !DIExpression(), !396)
    #dbg_declare(ptr %pkpv, !397, !DIExpression(), !398)
    #dbg_declare(ptr %ep, !399, !DIExpression(), !400)
    #dbg_declare(ptr %at, !401, !DIExpression(), !402)
    #dbg_declare(ptr %b, !403, !DIExpression(), !404)
    #dbg_declare(ptr %v, !405, !DIExpression(), !406)
    #dbg_declare(ptr %k, !407, !DIExpression(), !408)
    #dbg_declare(ptr %epp, !409, !DIExpression(), !410)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !411
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !412
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !413
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !417
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !388
    #dbg_value(i8 %nonce.0, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.0, !414, !DIExpression(), !388)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !418
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !420

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !421

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !423
    #dbg_value(i8 %nonce.0, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !424
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !425
    #dbg_value(i8 %inc, !394, !DIExpression(), !388)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !426
    #dbg_value(i32 %inc4, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !427, !llvm.loop !428

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc13, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !430
  %nonce.1 = phi i8 [ %inc11, %for.body7 ], [ 2, %for.cond5.preheader ], !dbg !388
    #dbg_value(i8 %nonce.1, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.1, !414, !DIExpression(), !388)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !431
  br i1 %exitcond1, label %for.body7, label %for.end14, !dbg !421

for.body7:                                        ; preds = %for.cond5
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !433
    #dbg_value(i8 %nonce.1, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !434
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !435
    #dbg_value(i8 %inc11, !394, !DIExpression(), !388)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !436
    #dbg_value(i32 %inc13, !414, !DIExpression(), !388)
  br label %for.cond5, !dbg !437, !llvm.loop !438

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 4) #3, !dbg !440
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !441
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !442

for.cond16:                                       ; preds = %for.body18, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.body18 ], !dbg !444
    #dbg_value(i32 %i.2, !414, !DIExpression(), !388)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !445
  br i1 %exitcond2, label %for.body18, label %for.end23, !dbg !447

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !448
  %arrayidx20 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !449
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #3, !dbg !450
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !451
    #dbg_value(i32 %inc22, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !452, !llvm.loop !453

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !455
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !456
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !457
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !458
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !459
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !460
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !461
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !462
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !463
  ret void, !dbg !464
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !465 {
entry:
    #dbg_value(ptr %pk, !468, !DIExpression(), !469)
    #dbg_value(ptr %seed, !470, !DIExpression(), !469)
    #dbg_value(ptr %packedpk, !471, !DIExpression(), !469)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #3, !dbg !472
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 768, !dbg !473
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !474
  ret void, !dbg !475
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) unnamed_addr #0 !dbg !476 {
entry:
    #dbg_value(ptr %r, !480, !DIExpression(), !481)
    #dbg_value(ptr %b, !482, !DIExpression(), !481)
    #dbg_value(ptr %v, !483, !DIExpression(), !481)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #3, !dbg !484
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 640, !dbg !485
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef %v) #3, !dbg !486
  ret void, !dbg !487
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !488 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !491, !DIExpression(), !492)
    #dbg_value(ptr %c, !493, !DIExpression(), !492)
    #dbg_value(ptr %sk, !494, !DIExpression(), !492)
    #dbg_declare(ptr %b, !495, !DIExpression(), !496)
    #dbg_declare(ptr %skpv, !497, !DIExpression(), !498)
    #dbg_declare(ptr %v, !499, !DIExpression(), !500)
    #dbg_declare(ptr %mp, !501, !DIExpression(), !502)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !503
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !504
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !505
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !506
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !507
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !508
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !509
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !510
  ret void, !dbg !511
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) unnamed_addr #0 !dbg !512 {
entry:
    #dbg_value(ptr %b, !515, !DIExpression(), !516)
    #dbg_value(ptr %v, !517, !DIExpression(), !516)
    #dbg_value(ptr %c, !518, !DIExpression(), !516)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #3, !dbg !519
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !520
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %v, ptr noundef nonnull %add.ptr) #3, !dbg !521
  ret void, !dbg !522
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !523 {
entry:
    #dbg_value(ptr %sk, !526, !DIExpression(), !527)
    #dbg_value(ptr %packedsk, !528, !DIExpression(), !527)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #3, !dbg !529
  ret void, !dbg !530
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !531 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !546, !DIExpression(), !547)
    #dbg_value(ptr %a, !548, !DIExpression(), !547)
    #dbg_declare(ptr %t, !549, !DIExpression(), !553)
    #dbg_value(i32 0, !554, !DIExpression(), !547)
  br label %for.cond, !dbg !555

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !557
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !546, !DIExpression(), !547)
    #dbg_value(i32 %i.0, !554, !DIExpression(), !547)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !558
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !560

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !561

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !564
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !546, !DIExpression(), !547)
    #dbg_value(i32 %j.0, !565, !DIExpression(), !547)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !566
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !561

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !568

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !571
    #dbg_value(i32 %k.0, !572, !DIExpression(), !547)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !573
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !568

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !575
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !577
  %add = or disjoint i32 %mul, %k.0, !dbg !578
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !575
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !575
  %isneg = icmp slt i16 %0, 0, !dbg !579
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !579
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !580
  %add12 = add i16 %and, %0, !dbg !581
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !581
  %conv15 = zext i16 %add12 to i64, !dbg !582
    #dbg_value(i64 %conv15, !583, !DIExpression(), !547)
    #dbg_value(i64 %conv15, !583, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !547)
    #dbg_value(i64 %conv15, !583, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !547)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !584
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !584
    #dbg_value(i64 %mul17, !583, !DIExpression(), !547)
  %shr18 = lshr i64 %mul17, 32, !dbg !585
    #dbg_value(i64 %shr18, !583, !DIExpression(), !547)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !586
  %conv20 = and i16 %2, 1023, !dbg !586
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !587
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !588
  %inc = add nuw nsw i32 %k.0, 1, !dbg !589
    #dbg_value(i32 %inc, !572, !DIExpression(), !547)
  br label %for.cond4, !dbg !590, !llvm.loop !591

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !593
  %conv25 = trunc i16 %3 to i8, !dbg !594
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !595
  %4 = load i16, ptr %t, align 2, !dbg !596
  %5 = lshr i16 %4, 8, !dbg !597
  %shr29 = trunc nuw i16 %5 to i8, !dbg !597
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !598
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !598
  %conv31 = trunc i16 %6 to i8, !dbg !598
  %shl32 = shl i8 %conv31, 2, !dbg !599
  %or = or i8 %shl32, %shr29, !dbg !600
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !601
  store i8 %or, ptr %arrayidx34, align 1, !dbg !602
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !603
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !603
  %8 = lshr i16 %7, 6, !dbg !604
  %shr37 = trunc i16 %8 to i8, !dbg !604
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !605
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !605
  %conv39 = trunc i16 %9 to i8, !dbg !605
  %shl40 = shl i8 %conv39, 4, !dbg !606
  %or41 = or i8 %shl40, %shr37, !dbg !607
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !608
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !609
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !610
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !610
  %11 = lshr i16 %10, 4, !dbg !611
  %shr46 = trunc i16 %11 to i8, !dbg !611
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !612
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !612
  %conv48 = trunc i16 %12 to i8, !dbg !612
  %shl49 = shl i8 %conv48, 6, !dbg !613
  %or50 = or i8 %shl49, %shr46, !dbg !614
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !615
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !616
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !617
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !617
  %14 = lshr i16 %13, 2, !dbg !618
  %conv56 = trunc i16 %14 to i8, !dbg !619
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !620
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !621
    #dbg_value(ptr %r.addr.1, !546, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !547)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !622
    #dbg_value(ptr %add.ptr, !546, !DIExpression(), !547)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !623
    #dbg_value(i32 %inc59, !565, !DIExpression(), !547)
  br label %for.cond1, !dbg !624, !llvm.loop !625

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !627
    #dbg_value(i32 %inc62, !554, !DIExpression(), !547)
  br label %for.cond, !dbg !628, !llvm.loop !629

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !631
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !632 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !636, !DIExpression(), !637)
    #dbg_value(ptr %a, !638, !DIExpression(), !637)
    #dbg_declare(ptr %t, !639, !DIExpression(), !640)
    #dbg_value(i32 0, !641, !DIExpression(), !637)
  br label %for.cond, !dbg !642

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !644
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !638, !DIExpression(), !637)
    #dbg_value(i32 %i.0, !641, !DIExpression(), !637)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !645
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !647

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !648

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !651
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !638, !DIExpression(), !637)
    #dbg_value(i32 %j.0, !652, !DIExpression(), !637)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !653
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !648

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !655
  %conv = zext i8 %0 to i16, !dbg !655
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !657
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !657
  %conv6 = zext i8 %1 to i16, !dbg !658
  %shl = shl nuw i16 %conv6, 8, !dbg !659
  %or = or disjoint i16 %shl, %conv, !dbg !660
  store i16 %or, ptr %t, align 2, !dbg !661
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !662
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !662
  %3 = lshr i8 %2, 2, !dbg !663
  %shr11 = zext nneg i8 %3 to i16, !dbg !663
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !664
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !664
  %conv14 = zext i8 %4 to i16, !dbg !665
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !666
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !667
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !668
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !669
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !670
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !670
  %6 = lshr i8 %5, 4, !dbg !671
  %shr21 = zext nneg i8 %6 to i16, !dbg !671
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !672
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !672
  %conv24 = zext i8 %7 to i16, !dbg !673
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !674
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !675
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !676
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !677
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !678
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !678
  %9 = lshr i8 %8, 6, !dbg !679
  %shr31 = zext nneg i8 %9 to i16, !dbg !679
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !680
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !680
  %conv34 = zext i8 %10 to i16, !dbg !681
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !682
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !683
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !684
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !685
    #dbg_value(ptr %add.ptr, !638, !DIExpression(), !637)
    #dbg_value(i32 0, !686, !DIExpression(), !637)
  br label %for.cond39, !dbg !687

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !689
    #dbg_value(i32 %k.0, !686, !DIExpression(), !637)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !690
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !692

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !693
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !693
  %12 = and i16 %11, 1023, !dbg !694
  %and = zext nneg i16 %12 to i32, !dbg !694
  %mul = mul nuw nsw i32 %and, 3329, !dbg !695
  %add = add nuw nsw i32 %mul, 512, !dbg !696
  %shr45 = lshr i32 %add, 10, !dbg !697
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !698
  %arrayidx47 = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !699
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !700
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !701
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !699
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !702
  %inc = add nuw nsw i32 %k.0, 1, !dbg !703
    #dbg_value(i32 %inc, !686, !DIExpression(), !637)
  br label %for.cond39, !dbg !704, !llvm.loop !705

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !707
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !708
    #dbg_value(i32 %inc52, !652, !DIExpression(), !637)
  br label %for.cond1, !dbg !709, !llvm.loop !710

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !712
    #dbg_value(i32 %inc55, !641, !DIExpression(), !637)
  br label %for.cond, !dbg !713, !llvm.loop !714

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !716
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !717 {
entry:
    #dbg_value(ptr %r, !718, !DIExpression(), !719)
    #dbg_value(ptr %a, !720, !DIExpression(), !719)
    #dbg_value(i32 0, !721, !DIExpression(), !719)
  br label %for.cond, !dbg !722

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !724
    #dbg_value(i32 %i.0, !721, !DIExpression(), !719)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !725
  br i1 %exitcond, label %for.body, label %for.end, !dbg !727

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !728
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !729
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !730
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !731
  %inc = add nuw nsw i32 %i.0, 1, !dbg !732
    #dbg_value(i32 %inc, !721, !DIExpression(), !719)
  br label %for.cond, !dbg !733, !llvm.loop !734

for.end:                                          ; preds = %for.cond
  ret void, !dbg !736
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !737 {
entry:
    #dbg_value(ptr %r, !738, !DIExpression(), !739)
    #dbg_value(ptr %a, !740, !DIExpression(), !739)
    #dbg_value(i32 0, !741, !DIExpression(), !739)
  br label %for.cond, !dbg !742

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !744
    #dbg_value(i32 %i.0, !741, !DIExpression(), !739)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !745
  br i1 %exitcond, label %for.body, label %for.end, !dbg !747

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !748
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !749
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !750
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !751
  %inc = add nuw nsw i32 %i.0, 1, !dbg !752
    #dbg_value(i32 %inc, !741, !DIExpression(), !739)
  br label %for.cond, !dbg !753, !llvm.loop !754

for.end:                                          ; preds = %for.cond
  ret void, !dbg !756
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !757 {
entry:
    #dbg_value(ptr %r, !760, !DIExpression(), !761)
    #dbg_value(i32 0, !762, !DIExpression(), !761)
  br label %for.cond, !dbg !763

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !765
    #dbg_value(i32 %i.0, !762, !DIExpression(), !761)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !766
  br i1 %exitcond, label %for.body, label %for.end, !dbg !768

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !769
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !770
  %inc = add nuw nsw i32 %i.0, 1, !dbg !771
    #dbg_value(i32 %inc, !762, !DIExpression(), !761)
  br label %for.cond, !dbg !772, !llvm.loop !773

for.end:                                          ; preds = %for.cond
  ret void, !dbg !775
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !776 {
entry:
    #dbg_value(ptr %r, !777, !DIExpression(), !778)
    #dbg_value(i32 0, !779, !DIExpression(), !778)
  br label %for.cond, !dbg !780

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !782
    #dbg_value(i32 %i.0, !779, !DIExpression(), !778)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !783
  br i1 %exitcond, label %for.body, label %for.end, !dbg !785

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !786
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !787
  %inc = add nuw nsw i32 %i.0, 1, !dbg !788
    #dbg_value(i32 %inc, !779, !DIExpression(), !778)
  br label %for.cond, !dbg !789, !llvm.loop !790

for.end:                                          ; preds = %for.cond
  ret void, !dbg !792
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !793 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !797, !DIExpression(), !798)
    #dbg_value(ptr %a, !799, !DIExpression(), !798)
    #dbg_value(ptr %b, !800, !DIExpression(), !798)
    #dbg_declare(ptr %t, !801, !DIExpression(), !802)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !803
    #dbg_value(i32 1, !804, !DIExpression(), !798)
  br label %for.cond, !dbg !805

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !807
    #dbg_value(i32 %i.0, !804, !DIExpression(), !798)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !808
  br i1 %exitcond, label %for.body, label %for.end, !dbg !810

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !811
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !813
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #3, !dbg !814
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !815
  %inc = add nuw nsw i32 %i.0, 1, !dbg !816
    #dbg_value(i32 %inc, !804, !DIExpression(), !798)
  br label %for.cond, !dbg !817, !llvm.loop !818

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !820
  ret void, !dbg !821
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !822 {
entry:
    #dbg_value(ptr %r, !823, !DIExpression(), !824)
    #dbg_value(i32 0, !825, !DIExpression(), !824)
  br label %for.cond, !dbg !826

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !828
    #dbg_value(i32 %i.0, !825, !DIExpression(), !824)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !829
  br i1 %exitcond, label %for.body, label %for.end, !dbg !831

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !832
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !833
  %inc = add nuw nsw i32 %i.0, 1, !dbg !834
    #dbg_value(i32 %inc, !825, !DIExpression(), !824)
  br label %for.cond, !dbg !835, !llvm.loop !836

for.end:                                          ; preds = %for.cond
  ret void, !dbg !838
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !839 {
entry:
    #dbg_value(ptr %r, !842, !DIExpression(), !843)
    #dbg_value(ptr %a, !844, !DIExpression(), !843)
    #dbg_value(ptr %b, !845, !DIExpression(), !843)
    #dbg_value(i32 0, !846, !DIExpression(), !843)
  br label %for.cond, !dbg !847

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !849
    #dbg_value(i32 %i.0, !846, !DIExpression(), !843)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !850
  br i1 %exitcond, label %for.body, label %for.end, !dbg !852

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !853
  %arrayidx2 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !854
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !855
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #3, !dbg !856
  %inc = add nuw nsw i32 %i.0, 1, !dbg !857
    #dbg_value(i32 %inc, !846, !DIExpression(), !843)
  br label %for.cond, !dbg !858, !llvm.loop !859

for.end:                                          ; preds = %for.cond
  ret void, !dbg !861
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !862 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !872, !DIExpression(), !873)
    #dbg_value(ptr %a, !874, !DIExpression(), !873)
    #dbg_declare(ptr %t, !875, !DIExpression(), !879)
    #dbg_value(i32 0, !880, !DIExpression(), !873)
  br label %for.cond, !dbg !881

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !883
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !872, !DIExpression(), !873)
    #dbg_value(i32 %i.0, !880, !DIExpression(), !873)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !884
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !886

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !887

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !890
    #dbg_value(i32 %j.0, !891, !DIExpression(), !873)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !892
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !887

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !894
  %add = or disjoint i32 %mul, %j.0, !dbg !896
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !897
  %0 = load i16, ptr %arrayidx, align 2, !dbg !897
    #dbg_value(i16 %0, !898, !DIExpression(), !873)
  %isneg = icmp slt i16 %0, 0, !dbg !899
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !899
  %add5 = add i16 %and, %0, !dbg !900
    #dbg_value(i16 %add5, !898, !DIExpression(), !873)
  %conv7 = sext i16 %add5 to i32, !dbg !901
    #dbg_value(i32 %conv7, !902, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !873)
    #dbg_value(i32 %conv7, !902, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !873)
  %1 = mul i32 %conv7, 1290160, !dbg !903
  %mul9 = add i32 %1, 134257275, !dbg !903
    #dbg_value(i32 %mul9, !902, !DIExpression(), !873)
  %shr10 = lshr i32 %mul9, 28, !dbg !904
    #dbg_value(i32 %shr10, !902, !DIExpression(), !873)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !905
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !906
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !907
  %inc = add nuw nsw i32 %j.0, 1, !dbg !908
    #dbg_value(i32 %inc, !891, !DIExpression(), !873)
  br label %for.cond1, !dbg !909, !llvm.loop !910

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !912
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !913
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !913
  %shl18 = shl i8 %3, 4, !dbg !914
  %or = or i8 %shl18, %2, !dbg !915
  store i8 %or, ptr %r.addr.0, align 1, !dbg !916
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !917
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !917
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !918
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !918
  %shl25 = shl i8 %5, 4, !dbg !919
  %or26 = or i8 %shl25, %4, !dbg !920
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !921
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !922
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !923
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !923
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !924
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !924
  %shl33 = shl i8 %7, 4, !dbg !925
  %or34 = or i8 %shl33, %6, !dbg !926
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !927
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !928
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !929
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !929
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !930
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !930
  %shl41 = shl i8 %9, 4, !dbg !931
  %or42 = or i8 %shl41, %8, !dbg !932
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !933
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !934
    #dbg_value(ptr %r.addr.0, !872, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !873)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !935
    #dbg_value(ptr %add.ptr, !872, !DIExpression(), !873)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !936
    #dbg_value(i32 %inc46, !880, !DIExpression(), !873)
  br label %for.cond, !dbg !937, !llvm.loop !938

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !940
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !941 {
entry:
    #dbg_value(ptr %r, !945, !DIExpression(), !946)
    #dbg_value(ptr %a, !947, !DIExpression(), !946)
    #dbg_value(i32 0, !948, !DIExpression(), !946)
  br label %for.cond, !dbg !949

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !951
    #dbg_value(i32 %i.0, !948, !DIExpression(), !946)
    #dbg_value(ptr %a.addr.0, !947, !DIExpression(), !946)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !952
  br i1 %exitcond, label %for.body, label %for.end, !dbg !954

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !955
  %1 = and i8 %0, 15, !dbg !957
  %conv2 = zext nneg i8 %1 to i32, !dbg !958
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !959
  %add = add nuw nsw i32 %mul, 8, !dbg !960
  %shr = lshr i32 %add, 4, !dbg !961
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !962
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !963
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !964
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !965
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !966
  %3 = lshr i8 %2, 4, !dbg !967
  %conv11 = zext nneg i8 %3 to i32, !dbg !968
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !969
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !970
  %shr14 = lshr i32 %add13, 4, !dbg !971
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !972
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !973
  %add18 = or disjoint i32 %mul17, 1, !dbg !974
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !975
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !976
    #dbg_value(ptr %a.addr.0, !947, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !946)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !977
    #dbg_value(ptr %add.ptr, !947, !DIExpression(), !946)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !978
    #dbg_value(i32 %inc, !948, !DIExpression(), !946)
  br label %for.cond, !dbg !979, !llvm.loop !980

for.end:                                          ; preds = %for.cond
  ret void, !dbg !982
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !983 {
entry:
    #dbg_value(ptr %r, !984, !DIExpression(), !985)
    #dbg_value(ptr %a, !986, !DIExpression(), !985)
    #dbg_value(i32 0, !987, !DIExpression(), !985)
  br label %for.cond, !dbg !988

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !990
    #dbg_value(i32 %i.0, !987, !DIExpression(), !985)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !991
  br i1 %exitcond, label %for.body, label %for.end, !dbg !993

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !994
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !996
  %0 = load i16, ptr %arrayidx, align 2, !dbg !996
    #dbg_value(i16 %0, !997, !DIExpression(), !985)
  %isneg = icmp slt i16 %0, 0, !dbg !998
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !998
  %add = add i16 %and, %0, !dbg !999
    #dbg_value(i16 %add, !997, !DIExpression(), !985)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1000
  %add5 = or disjoint i32 %mul4, 1, !dbg !1001
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !1002
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1002
    #dbg_value(i16 %1, !1003, !DIExpression(), !985)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1004
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !1004
  %add11 = add i16 %and9, %1, !dbg !1005
    #dbg_value(i16 %add11, !1003, !DIExpression(), !985)
  %conv15 = trunc i16 %add to i8, !dbg !1006
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !1007
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !1008
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1009
  %2 = lshr i16 %add, 8, !dbg !1010
  %shr20 = trunc nuw i16 %2 to i8, !dbg !1010
  %conv21 = trunc i16 %add11 to i8, !dbg !1011
  %shl = shl i8 %conv21, 4, !dbg !1012
  %or = or i8 %shl, %shr20, !dbg !1013
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !1014
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !1015
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1015
  store i8 %or, ptr %arrayidx25, align 1, !dbg !1016
  %4 = lshr i16 %add11, 4, !dbg !1017
  %conv28 = trunc i16 %4 to i8, !dbg !1018
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !1019
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !1020
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1020
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1021
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1022
    #dbg_value(i32 %inc, !987, !DIExpression(), !985)
  br label %for.cond, !dbg !1023, !llvm.loop !1024

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1026
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1027 {
entry:
    #dbg_value(ptr %r, !1028, !DIExpression(), !1029)
    #dbg_value(ptr %a, !1030, !DIExpression(), !1029)
    #dbg_value(i32 0, !1031, !DIExpression(), !1029)
  br label %for.cond, !dbg !1032

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1034
    #dbg_value(i32 %i.0, !1031, !DIExpression(), !1029)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1035
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1037

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1038
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1040
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1040
  %conv = zext i8 %0 to i16, !dbg !1040
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1041
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1042
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1042
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1042
  %conv5 = zext i8 %2 to i16, !dbg !1043
  %shl = shl nuw i16 %conv5, 8, !dbg !1044
  %shl.masked = and i16 %shl, 3840, !dbg !1045
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1045
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1046
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1047
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1048
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1049
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1050
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1050
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1050
  %5 = lshr i8 %4, 4, !dbg !1051
  %shr13 = zext nneg i8 %5 to i16, !dbg !1051
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1052
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1053
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1053
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1053
  %conv18 = zext i8 %7 to i16, !dbg !1054
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1055
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1056
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !1057
  %add25 = or disjoint i32 %mul24, 1, !dbg !1058
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !1059
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !1060
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1061
    #dbg_value(i32 %inc, !1031, !DIExpression(), !1029)
  br label %for.cond, !dbg !1062, !llvm.loop !1063

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1065
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1066 {
entry:
    #dbg_value(ptr %r, !1067, !DIExpression(), !1068)
    #dbg_value(ptr %msg, !1069, !DIExpression(), !1068)
    #dbg_value(i32 0, !1070, !DIExpression(), !1068)
  br label %for.cond, !dbg !1071

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1073
    #dbg_value(i32 %i.0, !1070, !DIExpression(), !1068)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1074
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end11, !dbg !1076

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1077

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1080
    #dbg_value(i32 %j.0, !1081, !DIExpression(), !1068)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1082
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !1077

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1084
  %add = or disjoint i32 %mul, %j.0, !dbg !1086
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1087
  store i16 0, ptr %arrayidx, align 2, !dbg !1088
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1089
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1089
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1090
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1091
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1091
  %conv = zext i8 %0 to i32, !dbg !1091
  %shr = lshr i32 %conv, %j.0, !dbg !1092
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1093
  %conv8 = and i16 %1, 1, !dbg !1093
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #3, !dbg !1094
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1095
    #dbg_value(i32 %inc, !1081, !DIExpression(), !1068)
  br label %for.cond1, !dbg !1096, !llvm.loop !1097

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !1099
    #dbg_value(i32 %inc10, !1070, !DIExpression(), !1068)
  br label %for.cond, !dbg !1100, !llvm.loop !1101

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1103
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1104 {
entry:
    #dbg_value(ptr %msg, !1105, !DIExpression(), !1106)
    #dbg_value(ptr %a, !1107, !DIExpression(), !1106)
    #dbg_value(i32 0, !1108, !DIExpression(), !1106)
  br label %for.cond, !dbg !1109

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1111
    #dbg_value(i32 %i.0, !1108, !DIExpression(), !1106)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1112
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1114

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1115
  store i8 0, ptr %arrayidx, align 1, !dbg !1117
    #dbg_value(i32 0, !1118, !DIExpression(), !1106)
  br label %for.cond1, !dbg !1119

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1121
    #dbg_value(i32 %j.0, !1118, !DIExpression(), !1106)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1122
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1124

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1125
  %add = or disjoint i32 %mul, %j.0, !dbg !1127
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1128
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1128
  %conv = sext i16 %0 to i32, !dbg !1128
    #dbg_value(i32 %conv, !1129, !DIExpression(), !1106)
    #dbg_value(i32 %conv, !1129, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1106)
    #dbg_value(i32 %conv, !1129, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1106)
  %1 = mul i32 %conv, 161270, !dbg !1130
  %mul6 = add i32 %1, 134257275, !dbg !1130
    #dbg_value(i32 %mul6, !1129, !DIExpression(), !1106)
  %shr = lshr i32 %mul6, 28, !dbg !1131
    #dbg_value(i32 %shr, !1129, !DIExpression(), !1106)
  %and = and i32 %shr, 1, !dbg !1132
    #dbg_value(i32 %and, !1129, !DIExpression(), !1106)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1133
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1134
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1135
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1135
  %conv10 = or i8 %2, %3, !dbg !1135
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1135
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1136
    #dbg_value(i32 %inc, !1118, !DIExpression(), !1106)
  br label %for.cond1, !dbg !1137, !llvm.loop !1138

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1140
    #dbg_value(i32 %inc12, !1108, !DIExpression(), !1106)
  br label %for.cond, !dbg !1141, !llvm.loop !1142

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1144
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1145 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1148, !DIExpression(), !1149)
    #dbg_value(ptr %seed, !1150, !DIExpression(), !1149)
    #dbg_value(i8 %nonce, !1151, !DIExpression(), !1149)
    #dbg_declare(ptr %buf, !1152, !DIExpression(), !1156)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1157
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1158
  ret void, !dbg !1159
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1160 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1161, !DIExpression(), !1162)
    #dbg_value(ptr %seed, !1163, !DIExpression(), !1162)
    #dbg_value(i8 %nonce, !1164, !DIExpression(), !1162)
    #dbg_declare(ptr %buf, !1165, !DIExpression(), !1167)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1168
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1169
  ret void, !dbg !1170
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1171 {
entry:
    #dbg_value(ptr %r, !1174, !DIExpression(), !1175)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #3, !dbg !1176
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !1177
  ret void, !dbg !1178
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1179 {
entry:
    #dbg_value(ptr %r, !1180, !DIExpression(), !1181)
    #dbg_value(i32 0, !1182, !DIExpression(), !1181)
  br label %for.cond, !dbg !1183

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1185
    #dbg_value(i32 %i.0, !1182, !DIExpression(), !1181)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1186
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1188

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1189
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1189
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1190
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1191
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1192
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1193
    #dbg_value(i32 %inc, !1182, !DIExpression(), !1181)
  br label %for.cond, !dbg !1194, !llvm.loop !1195

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1197
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1198 {
entry:
    #dbg_value(ptr %r, !1199, !DIExpression(), !1200)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #3, !dbg !1201
  ret void, !dbg !1202
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1203 {
entry:
    #dbg_value(ptr %r, !1206, !DIExpression(), !1207)
    #dbg_value(ptr %a, !1208, !DIExpression(), !1207)
    #dbg_value(ptr %b, !1209, !DIExpression(), !1207)
    #dbg_value(i32 0, !1210, !DIExpression(), !1207)
  br label %for.cond, !dbg !1211

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1213
    #dbg_value(i32 %i.0, !1210, !DIExpression(), !1207)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1214
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1216

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1217
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1219
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !1220
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !1221
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !1222
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !1223
  %add = or disjoint i32 %i.0, 64, !dbg !1224
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1225
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1225
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #3, !dbg !1226
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1227
  %add10 = or disjoint i32 %mul9, 2, !dbg !1228
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !1229
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !1230
  %add14 = or disjoint i32 %mul13, 2, !dbg !1231
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !1232
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !1233
  %add18 = or disjoint i32 %mul17, 2, !dbg !1234
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !1235
  %add20 = or disjoint i32 %i.0, 64, !dbg !1236
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add20, !dbg !1237
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1237
  %sub = sub i16 0, %1, !dbg !1238
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #3, !dbg !1239
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1240
    #dbg_value(i32 %inc, !1210, !DIExpression(), !1207)
  br label %for.cond, !dbg !1241, !llvm.loop !1242

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1244
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1245 {
entry:
    #dbg_value(ptr %r, !1246, !DIExpression(), !1247)
    #dbg_value(i16 1353, !1248, !DIExpression(), !1247)
    #dbg_value(i32 0, !1249, !DIExpression(), !1247)
  br label %for.cond, !dbg !1250

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1252
    #dbg_value(i32 %i.0, !1249, !DIExpression(), !1247)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1253
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1255

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1256
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1256
  %conv = sext i16 %0 to i32, !dbg !1257
  %mul = mul nsw i32 %conv, 1353, !dbg !1258
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1259
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1260
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1261
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1262
    #dbg_value(i32 %inc, !1249, !DIExpression(), !1247)
  br label %for.cond, !dbg !1263, !llvm.loop !1264

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1266
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1267 {
entry:
    #dbg_value(ptr %r, !1268, !DIExpression(), !1269)
    #dbg_value(ptr %a, !1270, !DIExpression(), !1269)
    #dbg_value(ptr %b, !1271, !DIExpression(), !1269)
    #dbg_value(i32 0, !1272, !DIExpression(), !1269)
  br label %for.cond, !dbg !1273

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1275
    #dbg_value(i32 %i.0, !1272, !DIExpression(), !1269)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1276
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1278

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1279
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1279
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1280
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1280
  %add = add i16 %0, %1, !dbg !1281
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1282
  store i16 %add, ptr %arrayidx6, align 2, !dbg !1283
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1284
    #dbg_value(i32 %inc, !1272, !DIExpression(), !1269)
  br label %for.cond, !dbg !1285, !llvm.loop !1286

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1288
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1289 {
entry:
    #dbg_value(ptr %r, !1290, !DIExpression(), !1291)
    #dbg_value(ptr %a, !1292, !DIExpression(), !1291)
    #dbg_value(ptr %b, !1293, !DIExpression(), !1291)
    #dbg_value(i32 0, !1294, !DIExpression(), !1291)
  br label %for.cond, !dbg !1295

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1297
    #dbg_value(i32 %i.0, !1294, !DIExpression(), !1291)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1298
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1300

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1301
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1301
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1302
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1302
  %sub = sub i16 %0, %1, !dbg !1303
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1304
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !1305
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1306
    #dbg_value(i32 %inc, !1294, !DIExpression(), !1291)
  br label %for.cond, !dbg !1307, !llvm.loop !1308

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1310
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1311 {
entry:
    #dbg_value(ptr %r, !1314, !DIExpression(), !1315)
    #dbg_value(i32 1, !1316, !DIExpression(), !1315)
    #dbg_value(i32 128, !1317, !DIExpression(), !1315)
  br label %for.cond, !dbg !1318

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1320
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1321
    #dbg_value(i32 %k.0, !1316, !DIExpression(), !1315)
    #dbg_value(i32 %len.0, !1317, !DIExpression(), !1315)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1322
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1324

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1325

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1328
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1315
    #dbg_value(i32 %k.1, !1316, !DIExpression(), !1315)
    #dbg_value(i32 %start.0, !1329, !DIExpression(), !1315)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1330
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1325

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1316, !DIExpression(), !1315)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1332
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1332
    #dbg_value(i16 %0, !1334, !DIExpression(), !1315)
    #dbg_value(i32 %start.0, !1335, !DIExpression(), !1315)
  br label %for.cond4, !dbg !1336

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1338
    #dbg_value(i32 %j.0, !1335, !DIExpression(), !1315)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1339
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1341
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1342

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1343
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1343
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1343
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1345
    #dbg_value(i16 %call, !1346, !DIExpression(), !1315)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1347
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1347
  %sub = sub i16 %3, %call, !dbg !1348
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1349
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1349
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1350
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1351
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1351
  %add17 = add i16 %5, %call, !dbg !1352
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1353
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1354
  %inc20 = add nuw i32 %j.0, 1, !dbg !1355
    #dbg_value(i32 %inc20, !1335, !DIExpression(), !1315)
  br label %for.cond4, !dbg !1356, !llvm.loop !1357

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1338
  %inc = add i32 %k.1, 1, !dbg !1359
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1360
    #dbg_value(i32 %add22, !1329, !DIExpression(), !1315)
  br label %for.cond1, !dbg !1361, !llvm.loop !1362

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1315
  %shr = lshr i32 %len.0, 1, !dbg !1364
    #dbg_value(i32 %shr, !1317, !DIExpression(), !1315)
  br label %for.cond, !dbg !1365, !llvm.loop !1366

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1368
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1369 {
entry:
    #dbg_value(i16 %a, !1372, !DIExpression(), !1373)
    #dbg_value(i16 %b, !1374, !DIExpression(), !1373)
  %conv = sext i16 %a to i32, !dbg !1375
  %conv1 = sext i16 %b to i32, !dbg !1376
  %mul = mul nsw i32 %conv, %conv1, !dbg !1377
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1378
  ret i16 %call, !dbg !1379
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1380 {
entry:
    #dbg_value(ptr %r, !1381, !DIExpression(), !1382)
    #dbg_value(i16 1441, !1383, !DIExpression(), !1382)
    #dbg_value(i32 127, !1384, !DIExpression(), !1382)
    #dbg_value(i32 2, !1385, !DIExpression(), !1382)
  br label %for.cond, !dbg !1386

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1388
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1389
    #dbg_value(i32 %k.0, !1384, !DIExpression(), !1382)
    #dbg_value(i32 %len.0, !1385, !DIExpression(), !1382)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1390
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1392

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1393

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1396

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1398
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1382
    #dbg_value(i32 %k.1, !1384, !DIExpression(), !1382)
    #dbg_value(i32 %start.0, !1399, !DIExpression(), !1382)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1400
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1393

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1384, !DIExpression(), !1382)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1402
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1402
    #dbg_value(i16 %0, !1404, !DIExpression(), !1382)
    #dbg_value(i32 %start.0, !1405, !DIExpression(), !1382)
  br label %for.cond4, !dbg !1406

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1408
    #dbg_value(i32 %j.0, !1405, !DIExpression(), !1382)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1409
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1411
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1412

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1413
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1413
    #dbg_value(i16 %1, !1415, !DIExpression(), !1382)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1416
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1416
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1416
  %add11 = add i16 %1, %3, !dbg !1417
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1418
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1419
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1420
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1421
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1421
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1421
  %sub = sub i16 %5, %1, !dbg !1422
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1423
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1423
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1424
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1425
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1425
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1425
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1426
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1427
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1427
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1428
  %inc = add nuw i32 %j.0, 1, !dbg !1429
    #dbg_value(i32 %inc, !1405, !DIExpression(), !1382)
  br label %for.cond4, !dbg !1430, !llvm.loop !1431

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1408
  %dec = add i32 %k.1, -1, !dbg !1433
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1434
    #dbg_value(i32 %add27, !1399, !DIExpression(), !1382)
  br label %for.cond1, !dbg !1435, !llvm.loop !1436

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1382
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1438
    #dbg_value(i32 %shl, !1385, !DIExpression(), !1382)
  br label %for.cond, !dbg !1439, !llvm.loop !1440

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1442
    #dbg_value(i32 %j.1, !1405, !DIExpression(), !1382)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1443
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1396

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1445
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1445
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1446
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1447
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1448
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1449
    #dbg_value(i32 %inc39, !1405, !DIExpression(), !1382)
  br label %for.cond31, !dbg !1450, !llvm.loop !1451

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1453
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1454 {
entry:
    #dbg_value(ptr %r, !1458, !DIExpression(), !1459)
    #dbg_value(ptr %a, !1460, !DIExpression(), !1459)
    #dbg_value(ptr %b, !1461, !DIExpression(), !1459)
    #dbg_value(i16 %zeta, !1462, !DIExpression(), !1459)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1463
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1463
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1464
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1464
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1465
  store i16 %call, ptr %r, align 2, !dbg !1466
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1467
  store i16 %call4, ptr %r, align 2, !dbg !1468
  %2 = load i16, ptr %a, align 2, !dbg !1469
  %3 = load i16, ptr %b, align 2, !dbg !1470
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1471
  %4 = load i16, ptr %r, align 2, !dbg !1472
  %add = add i16 %4, %call8, !dbg !1472
  store i16 %add, ptr %r, align 2, !dbg !1472
  %5 = load i16, ptr %a, align 2, !dbg !1473
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1474
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1474
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1475
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1476
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1477
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1478
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1478
  %8 = load i16, ptr %b, align 2, !dbg !1479
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1480
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1481
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1482
  %add22 = add i16 %9, %call18, !dbg !1482
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1482
  ret void, !dbg !1483
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1484 {
entry:
    #dbg_value(ptr %r, !1493, !DIExpression(), !1494)
    #dbg_value(ptr %buf, !1495, !DIExpression(), !1494)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #3, !dbg !1496
  ret void, !dbg !1497
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1498 {
entry:
    #dbg_value(ptr %r, !1499, !DIExpression(), !1500)
    #dbg_value(ptr %buf, !1501, !DIExpression(), !1500)
    #dbg_value(i32 0, !1502, !DIExpression(), !1500)
  br label %for.cond, !dbg !1503

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1505
    #dbg_value(i32 %i.0, !1502, !DIExpression(), !1500)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !1506
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !1508

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1509
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1511
  %call = call fastcc i32 @load24_littleendian(ptr noundef %add.ptr) #3, !dbg !1512
    #dbg_value(i32 %call, !1513, !DIExpression(), !1500)
  %and = and i32 %call, 2396745, !dbg !1514
    #dbg_value(i32 %and, !1515, !DIExpression(), !1500)
  %shr = lshr i32 %call, 1, !dbg !1516
  %and1 = and i32 %shr, 2396745, !dbg !1517
  %add = add nuw nsw i32 %and, %and1, !dbg !1518
    #dbg_value(i32 %add, !1515, !DIExpression(), !1500)
  %shr2 = lshr i32 %call, 2, !dbg !1519
  %and3 = and i32 %shr2, 2396745, !dbg !1520
  %add4 = add nuw nsw i32 %add, %and3, !dbg !1521
    #dbg_value(i32 %add4, !1515, !DIExpression(), !1500)
    #dbg_value(i32 0, !1522, !DIExpression(), !1500)
  br label %for.cond5, !dbg !1523

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !1525
    #dbg_value(i32 %j.0, !1522, !DIExpression(), !1500)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !1526
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !1528

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !1529
  %shr10 = lshr i32 %add4, %mul8, !dbg !1531
  %conv = and i32 %shr10, 7, !dbg !1532
    #dbg_value(i32 %shr10, !1533, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1500)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !1534
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !1535
  %shr14 = lshr i32 %add4, %add13, !dbg !1536
  %conv16 = and i32 %shr14, 7, !dbg !1537
    #dbg_value(i32 %conv16, !1538, !DIExpression(), !1500)
  %sub = sub nsw i32 %conv, %conv16, !dbg !1539
  %conv19 = trunc nsw i32 %sub to i16, !dbg !1540
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !1541
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !1542
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !1543
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1544
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1545
    #dbg_value(i32 %inc, !1522, !DIExpression(), !1500)
  br label %for.cond5, !dbg !1546, !llvm.loop !1547

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !1549
    #dbg_value(i32 %inc23, !1502, !DIExpression(), !1500)
  br label %for.cond, !dbg !1550, !llvm.loop !1551

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !1553
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 16777216) i32 @load24_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1554 {
entry:
    #dbg_value(ptr %x, !1557, !DIExpression(), !1558)
  %0 = load i8, ptr %x, align 1, !dbg !1559
  %conv = zext i8 %0 to i32, !dbg !1560
    #dbg_value(i32 %conv, !1561, !DIExpression(), !1558)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1562
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1562
  %conv2 = zext i8 %1 to i32, !dbg !1563
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1564
  %or = or disjoint i32 %shl, %conv, !dbg !1565
    #dbg_value(i32 %or, !1561, !DIExpression(), !1558)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1566
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1566
  %conv4 = zext i8 %2 to i32, !dbg !1567
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1568
  %or6 = or disjoint i32 %or, %shl5, !dbg !1569
    #dbg_value(i32 %or6, !1561, !DIExpression(), !1558)
  ret i32 %or6, !dbg !1570
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1571 {
entry:
    #dbg_value(ptr %r, !1572, !DIExpression(), !1573)
    #dbg_value(ptr %buf, !1574, !DIExpression(), !1573)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1575
  ret void, !dbg !1576
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1577 {
entry:
    #dbg_value(ptr %r, !1578, !DIExpression(), !1579)
    #dbg_value(ptr %buf, !1580, !DIExpression(), !1579)
    #dbg_value(i32 0, !1581, !DIExpression(), !1579)
  br label %for.cond, !dbg !1582

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1584
    #dbg_value(i32 %i.0, !1581, !DIExpression(), !1579)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1585
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1587

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1588
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1590
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1591
    #dbg_value(i32 %call, !1592, !DIExpression(), !1579)
  %and = and i32 %call, 1431655765, !dbg !1593
    #dbg_value(i32 %and, !1594, !DIExpression(), !1579)
  %shr = lshr i32 %call, 1, !dbg !1595
  %and1 = and i32 %shr, 1431655765, !dbg !1596
  %add = add nuw i32 %and, %and1, !dbg !1597
    #dbg_value(i32 %add, !1594, !DIExpression(), !1579)
    #dbg_value(i32 0, !1598, !DIExpression(), !1579)
  br label %for.cond2, !dbg !1599

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1601
    #dbg_value(i32 %j.0, !1598, !DIExpression(), !1579)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1602
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1604

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1605
  %shr7 = lshr i32 %add, %mul5, !dbg !1607
  %conv = and i32 %shr7, 3, !dbg !1608
    #dbg_value(i32 %shr7, !1609, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1579)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1610
  %add10 = or disjoint i32 %mul9, 2, !dbg !1611
  %shr11 = lshr i32 %add, %add10, !dbg !1612
  %conv13 = and i32 %shr11, 3, !dbg !1613
    #dbg_value(i32 %conv13, !1614, !DIExpression(), !1579)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1615
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1616
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1617
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1618
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1619
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1620
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1621
    #dbg_value(i32 %inc, !1598, !DIExpression(), !1579)
  br label %for.cond2, !dbg !1622, !llvm.loop !1623

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1625
    #dbg_value(i32 %inc20, !1581, !DIExpression(), !1579)
  br label %for.cond, !dbg !1626, !llvm.loop !1627

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1629
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1630 {
entry:
    #dbg_value(ptr %x, !1631, !DIExpression(), !1632)
  %0 = load i8, ptr %x, align 1, !dbg !1633
  %conv = zext i8 %0 to i32, !dbg !1634
    #dbg_value(i32 %conv, !1635, !DIExpression(), !1632)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1636
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1636
  %conv2 = zext i8 %1 to i32, !dbg !1637
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1638
  %or = or disjoint i32 %shl, %conv, !dbg !1639
    #dbg_value(i32 %or, !1635, !DIExpression(), !1632)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1640
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1640
  %conv4 = zext i8 %2 to i32, !dbg !1641
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1642
  %or6 = or disjoint i32 %or, %shl5, !dbg !1643
    #dbg_value(i32 %or6, !1635, !DIExpression(), !1632)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1644
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1644
  %conv8 = zext i8 %3 to i32, !dbg !1645
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1646
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1647
    #dbg_value(i32 %or10, !1635, !DIExpression(), !1632)
  ret i32 %or10, !dbg !1648
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1649 {
entry:
    #dbg_value(i32 %a, !1652, !DIExpression(), !1653)
    #dbg_value(i32 %a, !1654, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1653)
  %sext = mul i32 %a, -218038272, !dbg !1655
  %conv3 = ashr exact i32 %sext, 16, !dbg !1655
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1656
  %sub = add i32 %mul4.neg, %a, !dbg !1657
  %shr = lshr i32 %sub, 16, !dbg !1658
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1659
    #dbg_value(i16 %conv5, !1654, !DIExpression(), !1653)
  ret i16 %conv5, !dbg !1660
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1661 {
entry:
    #dbg_value(i16 %a, !1664, !DIExpression(), !1665)
    #dbg_value(i16 20159, !1666, !DIExpression(), !1665)
  %conv = sext i16 %a to i32, !dbg !1667
  %mul = mul nsw i32 %conv, 20159, !dbg !1668
  %add = add nsw i32 %mul, 33554432, !dbg !1669
  %shr = ashr i32 %add, 26, !dbg !1670
    #dbg_value(i32 %shr, !1671, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1665)
    #dbg_value(i32 %shr, !1671, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1665)
  %0 = trunc nsw i32 %shr to i16, !dbg !1672
  %1 = mul i16 %0, -3329, !dbg !1672
  %conv7 = add i16 %1, %a, !dbg !1672
  ret i16 %conv7, !dbg !1673
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1674 {
entry:
    #dbg_value(ptr %a, !1680, !DIExpression(), !1681)
    #dbg_value(ptr %b, !1682, !DIExpression(), !1681)
    #dbg_value(i32 %len, !1683, !DIExpression(), !1681)
    #dbg_value(i8 0, !1684, !DIExpression(), !1681)
    #dbg_value(i32 0, !1685, !DIExpression(), !1681)
  br label %for.cond, !dbg !1686

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1688
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1681
    #dbg_value(i8 %r.0, !1684, !DIExpression(), !1681)
    #dbg_value(i32 %i.0, !1685, !DIExpression(), !1681)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1689
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1691

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1684, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1681)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1692
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1692
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1693
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1693
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1684, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1681)
  %xor1 = xor i8 %0, %1, !dbg !1694
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1684, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1681)
  %or2 = or i8 %r.0, %xor1, !dbg !1695
    #dbg_value(i8 %or2, !1684, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1681)
    #dbg_value(i8 %or2, !1684, !DIExpression(), !1681)
  %inc = add i32 %i.0, 1, !dbg !1696
    #dbg_value(i32 %inc, !1685, !DIExpression(), !1681)
  br label %for.cond, !dbg !1697, !llvm.loop !1698

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1681
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1700
  %conv6 = zext i1 %2 to i32, !dbg !1701
  ret i32 %conv6, !dbg !1702
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1703 {
entry:
    #dbg_value(ptr %r, !1706, !DIExpression(), !1707)
    #dbg_value(ptr %x, !1708, !DIExpression(), !1707)
    #dbg_value(i32 %len, !1709, !DIExpression(), !1707)
    #dbg_value(i8 %b, !1710, !DIExpression(), !1707)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1711, !srcloc !1712
    #dbg_value(i8 %0, !1710, !DIExpression(), !1707)
  %sub = sub i8 0, %0, !dbg !1713
    #dbg_value(i8 %sub, !1710, !DIExpression(), !1707)
    #dbg_value(i32 0, !1714, !DIExpression(), !1707)
  br label %for.cond, !dbg !1715

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1717
    #dbg_value(i32 %i.0, !1714, !DIExpression(), !1707)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1718
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1720

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1721
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1721
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1722
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1722
  %xor1 = xor i8 %1, %2, !dbg !1723
  %and2 = and i8 %xor1, %sub, !dbg !1724
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1725
  %xor93 = xor i8 %1, %and2, !dbg !1726
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1726
  %inc = add i32 %i.0, 1, !dbg !1727
    #dbg_value(i32 %inc, !1714, !DIExpression(), !1707)
  br label %for.cond, !dbg !1728, !llvm.loop !1729

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1731
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1732 {
entry:
    #dbg_value(ptr %r, !1735, !DIExpression(), !1736)
    #dbg_value(i16 %v, !1737, !DIExpression(), !1736)
    #dbg_value(i16 %b, !1738, !DIExpression(), !1736)
  %sub = sub i16 0, %b, !dbg !1739
    #dbg_value(i16 %sub, !1738, !DIExpression(), !1736)
  %0 = load i16, ptr %r, align 2, !dbg !1740
  %xor1 = xor i16 %0, %v, !dbg !1741
  %and = and i16 %xor1, %sub, !dbg !1742
  %xor6 = xor i16 %and, %0, !dbg !1743
  store i16 %xor6, ptr %r, align 2, !dbg !1743
  ret void, !dbg !1744
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1745 {
entry:
    #dbg_value(ptr %state, !1754, !DIExpression(), !1755)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1756
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1757
  store i32 0, ptr %pos, align 8, !dbg !1758
  ret void, !dbg !1759
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1760 {
entry:
    #dbg_value(ptr %s, !1764, !DIExpression(), !1765)
    #dbg_value(i32 0, !1766, !DIExpression(), !1765)
  br label %for.cond, !dbg !1767

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1769
    #dbg_value(i32 %i.0, !1766, !DIExpression(), !1765)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1770
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1772

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1773
  store i64 0, ptr %arrayidx, align 8, !dbg !1774
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1775
    #dbg_value(i32 %inc, !1766, !DIExpression(), !1765)
  br label %for.cond, !dbg !1776, !llvm.loop !1777

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1779
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1780 {
entry:
    #dbg_value(ptr %state, !1783, !DIExpression(), !1784)
    #dbg_value(ptr %in, !1785, !DIExpression(), !1784)
    #dbg_value(i32 %inlen, !1786, !DIExpression(), !1784)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1787
  %0 = load i32, ptr %pos, align 8, !dbg !1787
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1788
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1789
  store i32 %call, ptr %pos1, align 8, !dbg !1790
  ret void, !dbg !1791
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1792 {
entry:
    #dbg_value(ptr %s, !1795, !DIExpression(), !1796)
    #dbg_value(i32 %pos, !1797, !DIExpression(), !1796)
    #dbg_value(i32 %r, !1798, !DIExpression(), !1796)
    #dbg_value(ptr %in, !1799, !DIExpression(), !1796)
    #dbg_value(i32 %inlen, !1800, !DIExpression(), !1796)
  br label %while.cond, !dbg !1801

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1797, !DIExpression(), !1796)
    #dbg_value(i32 %inlen.addr.0, !1800, !DIExpression(), !1796)
    #dbg_value(ptr %in.addr.0, !1799, !DIExpression(), !1796)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1802
  %cmp.not = icmp ult i32 %add, %r, !dbg !1803
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1801

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1804
  br label %for.cond, !dbg !1804

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1807

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1809
    #dbg_value(i32 %i.0, !1810, !DIExpression(), !1796)
    #dbg_value(ptr %in.addr.1, !1799, !DIExpression(), !1796)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1811
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1804

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1799, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1796)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1813
  %conv = zext i8 %0 to i64, !dbg !1814
  %rem = shl i32 %i.0, 3, !dbg !1815
  %mul = and i32 %rem, 56, !dbg !1815
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1816
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1816
  %div2 = lshr i32 %i.0, 3, !dbg !1817
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1818
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1819
  %xor = xor i64 %1, %shl, !dbg !1819
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1819
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1820
    #dbg_value(ptr %incdec.ptr, !1799, !DIExpression(), !1796)
  %inc = add i32 %i.0, 1, !dbg !1821
    #dbg_value(i32 %inc, !1810, !DIExpression(), !1796)
  br label %for.cond, !dbg !1822, !llvm.loop !1823

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1825
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1826
    #dbg_value(i32 %sub2, !1800, !DIExpression(), !1796)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1827
    #dbg_value(i32 0, !1797, !DIExpression(), !1796)
  br label %while.cond, !dbg !1801, !llvm.loop !1828

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1830
    #dbg_value(i32 %i.1, !1810, !DIExpression(), !1796)
    #dbg_value(ptr %in.addr.2, !1799, !DIExpression(), !1796)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1831
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1833
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1807

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1799, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1796)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1834
  %conv9 = zext i8 %2 to i64, !dbg !1835
  %rem10 = shl i32 %i.1, 3, !dbg !1836
  %mul11 = and i32 %rem10, 56, !dbg !1836
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1837
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1837
  %div141 = lshr i32 %i.1, 3, !dbg !1838
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1839
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1840
  %xor16 = xor i64 %3, %shl13, !dbg !1840
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1840
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1841
    #dbg_value(ptr %incdec.ptr8, !1799, !DIExpression(), !1796)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1842
    #dbg_value(i32 %inc18, !1810, !DIExpression(), !1796)
  br label %for.cond3, !dbg !1843, !llvm.loop !1844

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1830
  ret i32 %i.1.lcssa, !dbg !1846
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1847 {
entry:
    #dbg_value(ptr %state, !1848, !DIExpression(), !1849)
  %0 = load i64, ptr %state, align 8, !dbg !1850
    #dbg_value(i64 %0, !1851, !DIExpression(), !1849)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1852
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1852
    #dbg_value(i64 %1, !1853, !DIExpression(), !1849)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1854
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1854
    #dbg_value(i64 %2, !1855, !DIExpression(), !1849)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1856
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1856
    #dbg_value(i64 %3, !1857, !DIExpression(), !1849)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1858
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1858
    #dbg_value(i64 %4, !1859, !DIExpression(), !1849)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1860
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1860
    #dbg_value(i64 %5, !1861, !DIExpression(), !1849)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1862
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1862
    #dbg_value(i64 %6, !1863, !DIExpression(), !1849)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1864
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1864
    #dbg_value(i64 %7, !1865, !DIExpression(), !1849)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1866
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1866
    #dbg_value(i64 %8, !1867, !DIExpression(), !1849)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1868
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1868
    #dbg_value(i64 %9, !1869, !DIExpression(), !1849)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1870
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1870
    #dbg_value(i64 %10, !1871, !DIExpression(), !1849)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1872
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1872
    #dbg_value(i64 %11, !1873, !DIExpression(), !1849)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1874
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1874
    #dbg_value(i64 %12, !1875, !DIExpression(), !1849)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1876
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1876
    #dbg_value(i64 %13, !1877, !DIExpression(), !1849)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1878
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1878
    #dbg_value(i64 %14, !1879, !DIExpression(), !1849)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1880
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1880
    #dbg_value(i64 %15, !1881, !DIExpression(), !1849)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1882
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1882
    #dbg_value(i64 %16, !1883, !DIExpression(), !1849)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1884
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1884
    #dbg_value(i64 %17, !1885, !DIExpression(), !1849)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1886
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1886
    #dbg_value(i64 %18, !1887, !DIExpression(), !1849)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1888
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1888
    #dbg_value(i64 %19, !1889, !DIExpression(), !1849)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1890
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1890
    #dbg_value(i64 %20, !1891, !DIExpression(), !1849)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1892
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1892
    #dbg_value(i64 %21, !1893, !DIExpression(), !1849)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1894
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1894
    #dbg_value(i64 %22, !1895, !DIExpression(), !1849)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1896
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1896
    #dbg_value(i64 %23, !1897, !DIExpression(), !1849)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1898
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1898
    #dbg_value(i64 %24, !1899, !DIExpression(), !1849)
    #dbg_value(i32 0, !1900, !DIExpression(), !1849)
  br label %for.cond, !dbg !1901

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1849
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1849
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1849
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1849
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1849
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1849
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1849
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1849
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1849
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1849
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1849
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1849
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1849
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1849
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1849
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1849
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1849
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1849
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1849
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1849
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1849
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1849
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1849
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1849
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1903
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1849
    #dbg_value(i64 %Asu.0, !1899, !DIExpression(), !1849)
    #dbg_value(i32 %round.0, !1900, !DIExpression(), !1849)
    #dbg_value(i64 %Aba.0, !1851, !DIExpression(), !1849)
    #dbg_value(i64 %Abe.0, !1853, !DIExpression(), !1849)
    #dbg_value(i64 %Abi.0, !1855, !DIExpression(), !1849)
    #dbg_value(i64 %Abo.0, !1857, !DIExpression(), !1849)
    #dbg_value(i64 %Abu.0, !1859, !DIExpression(), !1849)
    #dbg_value(i64 %Aga.0, !1861, !DIExpression(), !1849)
    #dbg_value(i64 %Age.0, !1863, !DIExpression(), !1849)
    #dbg_value(i64 %Agi.0, !1865, !DIExpression(), !1849)
    #dbg_value(i64 %Ago.0, !1867, !DIExpression(), !1849)
    #dbg_value(i64 %Agu.0, !1869, !DIExpression(), !1849)
    #dbg_value(i64 %Aka.0, !1871, !DIExpression(), !1849)
    #dbg_value(i64 %Ake.0, !1873, !DIExpression(), !1849)
    #dbg_value(i64 %Aki.0, !1875, !DIExpression(), !1849)
    #dbg_value(i64 %Ako.0, !1877, !DIExpression(), !1849)
    #dbg_value(i64 %Aku.0, !1879, !DIExpression(), !1849)
    #dbg_value(i64 %Ama.0, !1881, !DIExpression(), !1849)
    #dbg_value(i64 %Ame.0, !1883, !DIExpression(), !1849)
    #dbg_value(i64 %Ami.0, !1885, !DIExpression(), !1849)
    #dbg_value(i64 %Amo.0, !1887, !DIExpression(), !1849)
    #dbg_value(i64 %Amu.0, !1889, !DIExpression(), !1849)
    #dbg_value(i64 %Asa.0, !1891, !DIExpression(), !1849)
    #dbg_value(i64 %Ase.0, !1893, !DIExpression(), !1849)
    #dbg_value(i64 %Asi.0, !1895, !DIExpression(), !1849)
    #dbg_value(i64 %Aso.0, !1897, !DIExpression(), !1849)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1904
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1906

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1913, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1915, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1913, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1915, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 poison, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !1942
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !1944
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !1945
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !1946
    #dbg_value(i64 %xor35, !1909, !DIExpression(), !1849)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !1947
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !1948
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !1949
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !1950
    #dbg_value(i64 %xor43, !1911, !DIExpression(), !1849)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !1951
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !1915, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor57 = xor i64 %xor35, %xor56, !dbg !1952
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 %xor57, !1915, !DIExpression(), !1849)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !1953
    #dbg_value(i64 %xor203, !1867, !DIExpression(), !1849)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !1954
    #dbg_value(i64 %xor206, !1908, !DIExpression(), !1849)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !1955
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !1956
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !1957
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !1958
    #dbg_value(i64 %xor31, !1908, !DIExpression(), !1849)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !1959
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor45 = xor i64 %xor43, %xor44, !dbg !1960
    #dbg_value(i64 %xor45, !1912, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !1961
    #dbg_value(i64 %xor211, !1881, !DIExpression(), !1849)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !1962
    #dbg_value(i64 %xor214, !1910, !DIExpression(), !1849)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !1963
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !1964
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !1965
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !1966
    #dbg_value(i64 %xor39, !1910, !DIExpression(), !1849)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !1967
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !1968
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !1969
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !1970
    #dbg_value(i64 %xor27, !1907, !DIExpression(), !1849)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !1971
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor61 = xor i64 %xor39, %xor60, !dbg !1972
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 %xor61, !1916, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !1973
    #dbg_value(i64 %xor207, !1879, !DIExpression(), !1849)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !1974
    #dbg_value(i64 %xor210, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not222 = xor i64 %xor210, -1, !dbg !1975
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and223 = and i64 %xor214, %not222, !dbg !1976
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor224 = xor i64 %xor206, %and223, !dbg !1977
    #dbg_value(i64 %xor224, !1938, !DIExpression(), !1849)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !1978
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor53 = xor i64 %xor31, %xor52, !dbg !1979
    #dbg_value(i64 %xor53, !1914, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !1980
    #dbg_value(i64 %xor67, !1875, !DIExpression(), !1849)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !1981
    #dbg_value(i64 %xor70, !1909, !DIExpression(), !1849)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !1982
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !1913, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor49 = xor i64 %xor27, %xor48, !dbg !1983
    #dbg_value(i64 %xor49, !1913, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !1984
    #dbg_value(i64 %xor63, !1863, !DIExpression(), !1849)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !1985
    #dbg_value(i64 %xor66, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not = xor i64 %xor66, -1, !dbg !1986
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and = and i64 %xor70, %not, !dbg !1987
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !1988
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !1988
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %26 = xor i64 %and, %25, !dbg !1989
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !1990
    #dbg_value(i64 %xor62, !1851, !DIExpression(), !1849)
    #dbg_value(i64 %xor62, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor81 = xor i64 %26, %xor62, !dbg !1989
    #dbg_value(i64 %xor81, !1917, !DIExpression(), !1849)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !1991
    #dbg_value(i64 %xor94, !1857, !DIExpression(), !1849)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !1992
    #dbg_value(i64 %xor97, !1907, !DIExpression(), !1849)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !1993
    #dbg_value(i64 %xor102, !1871, !DIExpression(), !1849)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !1994
    #dbg_value(i64 %xor105, !1909, !DIExpression(), !1849)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !1995
    #dbg_value(i64 %xor98, !1869, !DIExpression(), !1849)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !1996
    #dbg_value(i64 %xor101, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not114 = xor i64 %xor101, -1, !dbg !1997
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and115 = and i64 %xor105, %not114, !dbg !1998
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor116 = xor i64 %xor97, %and115, !dbg !1999
    #dbg_value(i64 %xor116, !1922, !DIExpression(), !1849)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2000
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2001
    #dbg_value(i64 %xor129, !1853, !DIExpression(), !1849)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2002
    #dbg_value(i64 %xor132, !1907, !DIExpression(), !1849)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2003
    #dbg_value(i64 %xor137, !1877, !DIExpression(), !1849)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2004
    #dbg_value(i64 %xor140, !1909, !DIExpression(), !1849)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2005
    #dbg_value(i64 %xor133, !1865, !DIExpression(), !1849)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2006
    #dbg_value(i64 %xor136, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not149 = xor i64 %xor136, -1, !dbg !2007
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and150 = and i64 %xor140, %not149, !dbg !2008
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor151 = xor i64 %xor132, %and150, !dbg !2009
    #dbg_value(i64 %xor151, !1927, !DIExpression(), !1849)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2010
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2011
    #dbg_value(i64 %xor164, !1859, !DIExpression(), !1849)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2012
    #dbg_value(i64 %xor167, !1907, !DIExpression(), !1849)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2013
    #dbg_value(i64 %xor172, !1873, !DIExpression(), !1849)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2014
    #dbg_value(i64 %xor175, !1909, !DIExpression(), !1849)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2015
    #dbg_value(i64 %xor168, !1861, !DIExpression(), !1849)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2016
    #dbg_value(i64 %xor171, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not184 = xor i64 %xor171, -1, !dbg !2017
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and185 = and i64 %xor175, %not184, !dbg !2018
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor186 = xor i64 %xor167, %and185, !dbg !2019
    #dbg_value(i64 %xor186, !1932, !DIExpression(), !1849)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2020
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2021
    #dbg_value(i64 %xor199, !1855, !DIExpression(), !1849)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2022
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not219 = xor i64 %xor206, -1, !dbg !2023
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and220 = and i64 %xor210, %not219, !dbg !2024
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor221 = xor i64 %xor202, %and220, !dbg !2025
    #dbg_value(i64 %xor221, !1937, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2026
    #dbg_value(i64 %xor237, !1907, !DIExpression(), !1849)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2027
    #dbg_value(i64 %xor75, !1899, !DIExpression(), !1849)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2028
    #dbg_value(i64 %xor78, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2029
    #dbg_value(i64 %xor71, !1887, !DIExpression(), !1849)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2030
    #dbg_value(i64 %xor74, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not85 = xor i64 %xor74, -1, !dbg !2031
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and86 = and i64 %xor78, %not85, !dbg !2032
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor87 = xor i64 %xor70, %and86, !dbg !2033
    #dbg_value(i64 %xor87, !1919, !DIExpression(), !1849)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2034
    #dbg_value(i64 %xor110, !1895, !DIExpression(), !1849)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2035
    #dbg_value(i64 %xor113, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2036
    #dbg_value(i64 %xor106, !1883, !DIExpression(), !1849)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2037
    #dbg_value(i64 %xor109, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not120 = xor i64 %xor109, -1, !dbg !2038
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and121 = and i64 %xor113, %not120, !dbg !2039
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor122 = xor i64 %xor105, %and121, !dbg !2040
    #dbg_value(i64 %xor122, !1924, !DIExpression(), !1849)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2041
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2042
    #dbg_value(i64 %xor145, !1891, !DIExpression(), !1849)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2043
    #dbg_value(i64 %xor148, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2044
    #dbg_value(i64 %xor141, !1889, !DIExpression(), !1849)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2045
    #dbg_value(i64 %xor144, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not155 = xor i64 %xor144, -1, !dbg !2046
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and156 = and i64 %xor148, %not155, !dbg !2047
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor157 = xor i64 %xor140, %and156, !dbg !2048
    #dbg_value(i64 %xor157, !1929, !DIExpression(), !1849)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2049
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2050
    #dbg_value(i64 %xor180, !1897, !DIExpression(), !1849)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2051
    #dbg_value(i64 %xor183, !1911, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2052
    #dbg_value(i64 %xor176, !1885, !DIExpression(), !1849)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2053
    #dbg_value(i64 %xor179, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %not190 = xor i64 %xor179, -1, !dbg !2054
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and191 = and i64 %xor183, %not190, !dbg !2055
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor192 = xor i64 %xor175, %and191, !dbg !2056
    #dbg_value(i64 %xor192, !1934, !DIExpression(), !1849)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2057
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2058
    #dbg_value(i64 %xor215, !1893, !DIExpression(), !1849)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2059
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not225 = xor i64 %xor214, -1, !dbg !2060
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and226 = and i64 %xor218, %not225, !dbg !2061
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor227 = xor i64 %xor210, %and226, !dbg !2062
    #dbg_value(i64 %xor227, !1939, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1909, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2063
    #dbg_value(i64 %xor245, !1909, !DIExpression(), !1849)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2064
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !1913, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2065
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 %xor261, !1913, !DIExpression(), !1849)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2066
    #dbg_value(i64 %xor429, !1938, !DIExpression(), !1849)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2067
    #dbg_value(i64 %xor432, !1911, !DIExpression(), !1849)
  %not123 = xor i64 %xor113, -1, !dbg !2068
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and124 = and i64 %xor97, %not123, !dbg !2069
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor125 = xor i64 %xor109, %and124, !dbg !2070
    #dbg_value(i64 %xor125, !1925, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not91 = xor i64 %xor62, -1, !dbg !2071
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and92 = and i64 %xor66, %not91, !dbg !2072
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor93 = xor i64 %xor78, %and92, !dbg !2073
    #dbg_value(i64 %xor93, !1921, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not126 = xor i64 %xor97, -1, !dbg !2074
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and127 = and i64 %xor101, %not126, !dbg !2075
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor128 = xor i64 %xor113, %and127, !dbg !2076
    #dbg_value(i64 %xor128, !1926, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2077
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not161 = xor i64 %xor132, -1, !dbg !2078
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and162 = and i64 %xor136, %not161, !dbg !2079
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor163 = xor i64 %xor148, %and162, !dbg !2080
    #dbg_value(i64 %xor163, !1931, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2081
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not196 = xor i64 %xor167, -1, !dbg !2082
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and197 = and i64 %xor171, %not196, !dbg !2083
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor198 = xor i64 %xor183, %and197, !dbg !2084
    #dbg_value(i64 %xor198, !1936, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2085
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not231 = xor i64 %xor202, -1, !dbg !2086
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %and232 = and i64 %xor206, %not231, !dbg !2087
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor233 = xor i64 %xor218, %and232, !dbg !2088
    #dbg_value(i64 %xor233, !1941, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1911, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2089
    #dbg_value(i64 %xor253, !1911, !DIExpression(), !1849)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2090
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !1915, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2091
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !1925, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 %xor269, !1915, !DIExpression(), !1849)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2092
    #dbg_value(i64 %xor417, !1925, !DIExpression(), !1849)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2093
    #dbg_value(i64 %xor420, !1908, !DIExpression(), !1849)
  %not82 = xor i64 %xor70, -1, !dbg !2094
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and83 = and i64 %xor74, %not82, !dbg !2095
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor84 = xor i64 %xor66, %and83, !dbg !2096
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %not117 = xor i64 %xor105, -1, !dbg !2097
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and118 = and i64 %xor109, %not117, !dbg !2098
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor119 = xor i64 %xor101, %and118, !dbg !2099
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !1923, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2100
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %not152 = xor i64 %xor140, -1, !dbg !2101
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and153 = and i64 %xor144, %not152, !dbg !2102
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor154 = xor i64 %xor136, %and153, !dbg !2103
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2104
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %not187 = xor i64 %xor175, -1, !dbg !2105
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and188 = and i64 %xor179, %not187, !dbg !2106
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor189 = xor i64 %xor171, %and188, !dbg !2107
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !1933, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2108
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2109
    #dbg_value(i64 %xor241, !1908, !DIExpression(), !1849)
  %not88 = xor i64 %xor78, -1, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and89 = and i64 %xor62, %not88, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor90 = xor i64 %xor74, %and89, !dbg !2112
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not158 = xor i64 %xor148, -1, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and159 = and i64 %xor132, %not158, !dbg !2115
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor160 = xor i64 %xor144, %and159, !dbg !2116
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2117
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not193 = xor i64 %xor183, -1, !dbg !2118
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and194 = and i64 %xor167, %not193, !dbg !2119
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor195 = xor i64 %xor179, %and194, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !1935, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2121
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %not228 = xor i64 %xor218, -1, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and229 = and i64 %xor202, %not228, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor230 = xor i64 %xor214, %and229, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2125
    #dbg_value(i64 %xor249, !1910, !DIExpression(), !1849)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2126
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2127
    #dbg_value(i64 %xor265, !1914, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !1919, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !1939, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !1929, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2128
    #dbg_value(i64 %xor413, !1919, !DIExpression(), !1849)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2129
    #dbg_value(i64 %xor416, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not445 = xor i64 %xor416, -1, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and446 = and i64 %xor420, %not445, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !1899, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor447 = xor i64 %xor432, %and446, !dbg !2132
    #dbg_value(i64 %xor447, !1899, !DIExpression(), !1849)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2133
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2134
    #dbg_value(i64 %xor257, !1912, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !1937, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1907, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1917, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2135
    #dbg_value(i64 %xor425, !1932, !DIExpression(), !1849)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2136
    #dbg_value(i64 %xor428, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not442 = xor i64 %xor432, -1, !dbg !2137
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and443 = and i64 %xor416, %not442, !dbg !2138
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !1897, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor444 = xor i64 %xor428, %and443, !dbg !2139
    #dbg_value(i64 %xor444, !1897, !DIExpression(), !1849)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2140
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2141
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !1921, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !1941, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(i64 %xor273, !1916, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !1931, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2142
    #dbg_value(i64 %xor421, !1931, !DIExpression(), !1849)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2143
    #dbg_value(i64 %xor424, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not439 = xor i64 %xor428, -1, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and440 = and i64 %xor432, %not439, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !1895, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor441 = xor i64 %xor424, %and440, !dbg !2146
    #dbg_value(i64 %xor441, !1895, !DIExpression(), !1849)
  %not436 = xor i64 %xor424, -1, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and437 = and i64 %xor428, %not436, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !1893, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor438 = xor i64 %xor420, %and437, !dbg !2149
    #dbg_value(i64 %xor438, !1893, !DIExpression(), !1849)
  %not433 = xor i64 %xor420, -1, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and434 = and i64 %xor424, %not433, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !1891, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor435 = xor i64 %xor416, %and434, !dbg !2152
    #dbg_value(i64 %xor435, !1891, !DIExpression(), !1849)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2153
    #dbg_value(i64 %xor394, !1940, !DIExpression(), !1849)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2154
    #dbg_value(i64 %xor397, !1911, !DIExpression(), !1849)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2155
    #dbg_value(i64 %xor382, !1922, !DIExpression(), !1849)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2156
    #dbg_value(i64 %xor385, !1908, !DIExpression(), !1849)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2157
    #dbg_value(i64 %xor378, !1921, !DIExpression(), !1849)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2158
    #dbg_value(i64 %xor381, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not410 = xor i64 %xor381, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and411 = and i64 %xor385, %not410, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !1889, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor412 = xor i64 %xor397, %and411, !dbg !2161
    #dbg_value(i64 %xor412, !1889, !DIExpression(), !1849)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2162
    #dbg_value(i64 %xor390, !1934, !DIExpression(), !1849)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2163
    #dbg_value(i64 %xor393, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not407 = xor i64 %xor397, -1, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and408 = and i64 %xor381, %not407, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !1887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor409 = xor i64 %xor393, %and408, !dbg !2166
    #dbg_value(i64 %xor409, !1887, !DIExpression(), !1849)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2167
    #dbg_value(i64 %xor386, !1928, !DIExpression(), !1849)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2168
    #dbg_value(i64 %xor389, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not404 = xor i64 %xor393, -1, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and405 = and i64 %xor397, %not404, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !1885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor406 = xor i64 %xor389, %and405, !dbg !2171
    #dbg_value(i64 %xor406, !1885, !DIExpression(), !1849)
  %not401 = xor i64 %xor389, -1, !dbg !2172
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and402 = and i64 %xor393, %not401, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor403 = xor i64 %xor385, %and402, !dbg !2174
    #dbg_value(i64 %xor403, !1883, !DIExpression(), !1849)
  %not398 = xor i64 %xor385, -1, !dbg !2175
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and399 = and i64 %xor389, %not398, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1881, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor400 = xor i64 %xor381, %and399, !dbg !2177
    #dbg_value(i64 %xor400, !1881, !DIExpression(), !1849)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2178
    #dbg_value(i64 %xor359, !1937, !DIExpression(), !1849)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2179
    #dbg_value(i64 %xor362, !1911, !DIExpression(), !1849)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2180
    #dbg_value(i64 %xor347, !1924, !DIExpression(), !1849)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2181
    #dbg_value(i64 %xor350, !1908, !DIExpression(), !1849)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2182
    #dbg_value(i64 %xor343, !1918, !DIExpression(), !1849)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2183
    #dbg_value(i64 %xor346, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not375 = xor i64 %xor346, -1, !dbg !2184
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and376 = and i64 %xor350, %not375, !dbg !2185
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1879, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor377 = xor i64 %xor362, %and376, !dbg !2186
    #dbg_value(i64 %xor377, !1879, !DIExpression(), !1849)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2187
    #dbg_value(i64 %xor355, !1936, !DIExpression(), !1849)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2188
    #dbg_value(i64 %xor358, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not372 = xor i64 %xor362, -1, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and373 = and i64 %xor346, %not372, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1877, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor374 = xor i64 %xor358, %and373, !dbg !2191
    #dbg_value(i64 %xor374, !1877, !DIExpression(), !1849)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2192
    #dbg_value(i64 %xor351, !1930, !DIExpression(), !1849)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2193
    #dbg_value(i64 %xor354, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not369 = xor i64 %xor358, -1, !dbg !2194
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and370 = and i64 %xor362, %not369, !dbg !2195
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1875, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor371 = xor i64 %xor354, %and370, !dbg !2196
    #dbg_value(i64 %xor371, !1875, !DIExpression(), !1849)
  %not366 = xor i64 %xor354, -1, !dbg !2197
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and367 = and i64 %xor358, %not366, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1873, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor368 = xor i64 %xor350, %and367, !dbg !2199
    #dbg_value(i64 %xor368, !1873, !DIExpression(), !1849)
  %not363 = xor i64 %xor350, -1, !dbg !2200
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and364 = and i64 %xor354, %not363, !dbg !2201
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1871, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor365 = xor i64 %xor346, %and364, !dbg !2202
    #dbg_value(i64 %xor365, !1871, !DIExpression(), !1849)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2203
    #dbg_value(i64 %xor324, !1939, !DIExpression(), !1849)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2204
    #dbg_value(i64 %xor327, !1911, !DIExpression(), !1849)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2205
    #dbg_value(i64 %xor312, !1926, !DIExpression(), !1849)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2206
    #dbg_value(i64 %xor315, !1908, !DIExpression(), !1849)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2207
    #dbg_value(i64 %xor308, !1920, !DIExpression(), !1849)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2208
    #dbg_value(i64 %xor311, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not340 = xor i64 %xor311, -1, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and341 = and i64 %xor315, %not340, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1869, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor342 = xor i64 %xor327, %and341, !dbg !2211
    #dbg_value(i64 %xor342, !1869, !DIExpression(), !1849)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2212
    #dbg_value(i64 %xor320, !1933, !DIExpression(), !1849)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2213
    #dbg_value(i64 %xor323, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not337 = xor i64 %xor327, -1, !dbg !2214
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and338 = and i64 %xor311, %not337, !dbg !2215
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor339 = xor i64 %xor323, %and338, !dbg !2216
    #dbg_value(i64 %xor339, !1867, !DIExpression(), !1849)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2217
    #dbg_value(i64 %xor316, !1927, !DIExpression(), !1849)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2218
    #dbg_value(i64 %xor319, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not334 = xor i64 %xor323, -1, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and335 = and i64 %xor327, %not334, !dbg !2220
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor336 = xor i64 %xor319, %and335, !dbg !2221
    #dbg_value(i64 %xor336, !1865, !DIExpression(), !1849)
  %not331 = xor i64 %xor319, -1, !dbg !2222
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and332 = and i64 %xor323, %not331, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor333 = xor i64 %xor315, %and332, !dbg !2224
    #dbg_value(i64 %xor333, !1863, !DIExpression(), !1849)
  %not328 = xor i64 %xor315, -1, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and329 = and i64 %xor319, %not328, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor330 = xor i64 %xor311, %and329, !dbg !2227
    #dbg_value(i64 %xor330, !1861, !DIExpression(), !1849)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2228
    #dbg_value(i64 %xor287, !1941, !DIExpression(), !1849)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2229
    #dbg_value(i64 %xor290, !1911, !DIExpression(), !1849)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2230
    #dbg_value(i64 %xor275, !1923, !DIExpression(), !1849)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2231
    #dbg_value(i64 %xor278, !1908, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2232
    #dbg_value(i64 %xor274, !1917, !DIExpression(), !1849)
    #dbg_value(i64 %xor274, !1907, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not305 = xor i64 %xor274, -1, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and306 = and i64 %xor278, %not305, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor307 = xor i64 %xor290, %and306, !dbg !2235
    #dbg_value(i64 %xor307, !1859, !DIExpression(), !1849)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2236
    #dbg_value(i64 %xor283, !1935, !DIExpression(), !1849)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2237
    #dbg_value(i64 %xor286, !1910, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not302 = xor i64 %xor290, -1, !dbg !2238
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and303 = and i64 %xor274, %not302, !dbg !2239
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor304 = xor i64 %xor286, %and303, !dbg !2240
    #dbg_value(i64 %xor304, !1857, !DIExpression(), !1849)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2241
    #dbg_value(i64 %xor279, !1929, !DIExpression(), !1849)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2242
    #dbg_value(i64 %xor282, !1909, !DIExpression(), !1849)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %not299 = xor i64 %xor286, -1, !dbg !2243
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and300 = and i64 %xor290, %not299, !dbg !2244
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor301 = xor i64 %xor282, %and300, !dbg !2245
    #dbg_value(i64 %xor301, !1855, !DIExpression(), !1849)
  %not296 = xor i64 %xor282, -1, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1849)
  %and297 = and i64 %xor286, %not296, !dbg !2247
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %xor298 = xor i64 %xor278, %and297, !dbg !2248
    #dbg_value(i64 %xor298, !1853, !DIExpression(), !1849)
  %add = or disjoint i32 %round.0, 1, !dbg !2249
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2250
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %not291 = xor i64 %xor278, -1, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %and292 = and i64 %xor282, %not291, !dbg !2252
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1849)
  %28 = xor i64 %and292, %27, !dbg !2253
  %xor295 = xor i64 %28, %xor274, !dbg !2253
    #dbg_value(i64 %xor295, !1851, !DIExpression(), !1849)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2254
    #dbg_value(i32 %add448, !1900, !DIExpression(), !1849)
  br label %for.cond, !dbg !2255, !llvm.loop !2256

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1849
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1849
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1849
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1849
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1849
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1849
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1849
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1849
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1849
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1849
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1849
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1849
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1849
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1849
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1849
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1849
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1849
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1849
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1849
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1849
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1849
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1849
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1849
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1849
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1849
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2258
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2259
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2260
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2261
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2262
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2263
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2264
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2265
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2266
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2267
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2268
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2269
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2270
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2271
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2272
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2273
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2274
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2275
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2276
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2277
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2278
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2279
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2280
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2281
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2282
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2283
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2284
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2285
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2286
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2287
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2288
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2289
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2290
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2291
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2292
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2293
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2294
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2295
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2296
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2297
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2298
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2299
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2300
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2301
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2302
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2303
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2304
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2305
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2306
  ret void, !dbg !2307
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2308 {
entry:
    #dbg_value(ptr %state, !2309, !DIExpression(), !2310)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2311
  %0 = load i32, ptr %pos, align 8, !dbg !2311
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2312
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2313
  store i32 168, ptr %pos1, align 8, !dbg !2314
  ret void, !dbg !2315
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2316 {
entry:
    #dbg_value(ptr %s, !2319, !DIExpression(), !2320)
    #dbg_value(i32 %pos, !2321, !DIExpression(), !2320)
    #dbg_value(i32 %r, !2322, !DIExpression(), !2320)
    #dbg_value(i8 %p, !2323, !DIExpression(), !2320)
  %conv = zext i8 %p to i64, !dbg !2324
  %rem = shl i32 %pos, 3, !dbg !2325
  %mul = and i32 %rem, 56, !dbg !2325
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2326
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2326
  %div2 = lshr i32 %pos, 3, !dbg !2327
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2328
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2329
  %xor = xor i64 %0, %shl, !dbg !2329
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2329
  %div13 = lshr i32 %r, 3, !dbg !2330
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2331
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2331
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2332
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2332
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2332
  ret void, !dbg !2333
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2334 {
entry:
    #dbg_value(ptr %out, !2337, !DIExpression(), !2338)
    #dbg_value(i32 %outlen, !2339, !DIExpression(), !2338)
    #dbg_value(ptr %state, !2340, !DIExpression(), !2338)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2341
  %0 = load i32, ptr %pos, align 8, !dbg !2341
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 168) #3, !dbg !2342
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2343
  store i32 %call, ptr %pos1, align 8, !dbg !2344
  ret void, !dbg !2345
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) unnamed_addr #0 !dbg !2346 {
entry:
    #dbg_value(ptr %out, !2349, !DIExpression(), !2350)
    #dbg_value(i32 %outlen, !2351, !DIExpression(), !2350)
    #dbg_value(ptr %s, !2352, !DIExpression(), !2350)
    #dbg_value(i32 %pos, !2353, !DIExpression(), !2350)
    #dbg_value(i32 %r, !2354, !DIExpression(), !2350)
  br label %while.cond, !dbg !2355

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2349, !DIExpression(), !2350)
    #dbg_value(i32 %outlen.addr.0, !2351, !DIExpression(), !2350)
    #dbg_value(i32 %pos.addr.0, !2353, !DIExpression(), !2350)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2355
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2355

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2356
  br i1 %cmp, label %if.then, label %if.end, !dbg !2356

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2359
    #dbg_value(i32 0, !2353, !DIExpression(), !2350)
  br label %if.end, !dbg !2361

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2353, !DIExpression(), !2350)
    #dbg_value(i32 %pos.addr.1, !2362, !DIExpression(), !2350)
  br label %for.cond, !dbg !2363

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2365
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2349, !DIExpression(), !2350)
    #dbg_value(i32 %i.0, !2362, !DIExpression(), !2350)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2366
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2368
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2368
  %0 = and i1 %cmp1, %cmp2, !dbg !2368
  br i1 %0, label %for.body, label %for.end, !dbg !2369

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2370
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2371
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2371
  %rem = shl i32 %i.0, 3, !dbg !2372
  %mul = and i32 %rem, 56, !dbg !2372
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2373
  %shr = lshr i64 %1, %sh_prom, !dbg !2373
  %conv = trunc i64 %shr to i8, !dbg !2371
    #dbg_value(ptr %out.addr.1, !2349, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2350)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2374
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2375
    #dbg_value(ptr %incdec.ptr, !2349, !DIExpression(), !2350)
  %inc = add nuw i32 %i.0, 1, !dbg !2376
    #dbg_value(i32 %inc, !2362, !DIExpression(), !2350)
  br label %for.cond, !dbg !2377, !llvm.loop !2378

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2365
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2380
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2381
    #dbg_value(i32 %sub3, !2351, !DIExpression(), !2350)
    #dbg_value(i32 %i.0.lcssa, !2353, !DIExpression(), !2350)
  br label %while.cond, !dbg !2355, !llvm.loop !2382

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2384
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2385 {
entry:
    #dbg_value(ptr %state, !2386, !DIExpression(), !2387)
    #dbg_value(ptr %in, !2388, !DIExpression(), !2387)
    #dbg_value(i32 %inlen, !2389, !DIExpression(), !2387)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2390
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2391
  store i32 168, ptr %pos, align 8, !dbg !2392
  ret void, !dbg !2393
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2394 {
entry:
    #dbg_value(ptr %s, !2397, !DIExpression(), !2398)
    #dbg_value(i32 %r, !2399, !DIExpression(), !2398)
    #dbg_value(ptr %in, !2400, !DIExpression(), !2398)
    #dbg_value(i32 %inlen, !2401, !DIExpression(), !2398)
    #dbg_value(i8 %p, !2402, !DIExpression(), !2398)
    #dbg_value(i32 0, !2403, !DIExpression(), !2398)
  br label %for.cond, !dbg !2404

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2406
    #dbg_value(i32 %i.0, !2403, !DIExpression(), !2398)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2407
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2409

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2410
  br label %while.cond, !dbg !2410

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2411
  store i64 0, ptr %arrayidx, align 8, !dbg !2412
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2413
    #dbg_value(i32 %inc, !2403, !DIExpression(), !2398)
  br label %for.cond, !dbg !2414, !llvm.loop !2415

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2401, !DIExpression(), !2398)
    #dbg_value(ptr %in.addr.0, !2400, !DIExpression(), !2398)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2417
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2410

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2418

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2421

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2423
    #dbg_value(i32 %i.1, !2403, !DIExpression(), !2398)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2424
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2418

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !2426
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2427
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2428
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2429
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2430
  %xor = xor i64 %1, %call, !dbg !2430
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2430
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2431
    #dbg_value(i32 %inc7, !2403, !DIExpression(), !2398)
  br label %for.cond2, !dbg !2432, !llvm.loop !2433

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2435
    #dbg_value(ptr %add.ptr9, !2400, !DIExpression(), !2398)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2436
    #dbg_value(i32 %sub, !2401, !DIExpression(), !2398)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2437
  br label %while.cond, !dbg !2410, !llvm.loop !2438

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2440
    #dbg_value(i32 %i.2, !2403, !DIExpression(), !2398)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2441
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2421

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2443
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2443
  %conv = zext i8 %2 to i64, !dbg !2444
  %rem = shl i32 %i.2, 3, !dbg !2445
  %mul14 = and i32 %rem, 56, !dbg !2445
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2446
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2446
  %div153 = lshr i32 %i.2, 3, !dbg !2447
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2448
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2449
  %xor17 = xor i64 %3, %shl, !dbg !2449
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2449
  %inc19 = add i32 %i.2, 1, !dbg !2450
    #dbg_value(i32 %inc19, !2403, !DIExpression(), !2398)
  br label %for.cond10, !dbg !2451, !llvm.loop !2452

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2440
  %conv21 = zext i8 %p to i64, !dbg !2454
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2455
  %mul23 = and i32 %rem22, 56, !dbg !2455
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2456
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !2456
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2457
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2458
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2459
  %xor28 = xor i64 %4, %shl25, !dbg !2459
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2459
  %sub29 = add i32 %r, -1, !dbg !2460
  %div302 = lshr i32 %sub29, 3, !dbg !2461
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2462
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2463
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2463
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2463
  ret void, !dbg !2464
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2465 {
entry:
    #dbg_value(ptr %x, !2468, !DIExpression(), !2469)
    #dbg_value(i64 0, !2470, !DIExpression(), !2469)
    #dbg_value(i32 0, !2471, !DIExpression(), !2469)
  br label %for.cond, !dbg !2472

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2474
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2469
    #dbg_value(i64 %r.0, !2470, !DIExpression(), !2469)
    #dbg_value(i32 %i.0, !2471, !DIExpression(), !2469)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2475
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2477

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2469)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2478
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2478
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2469)
  %conv = zext i8 %0 to i64, !dbg !2479
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2469)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2480
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2469)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2481
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2469)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2481
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2470, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2469)
  %or = or i64 %r.0, %shl, !dbg !2482
    #dbg_value(i64 %or, !2470, !DIExpression(), !2469)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2483
    #dbg_value(i32 %inc, !2471, !DIExpression(), !2469)
  br label %for.cond, !dbg !2484, !llvm.loop !2485

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2469
  ret i64 %r.0.lcssa, !dbg !2487
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2488 {
entry:
    #dbg_value(ptr %out, !2489, !DIExpression(), !2490)
    #dbg_value(i32 %nblocks, !2491, !DIExpression(), !2490)
    #dbg_value(ptr %state, !2492, !DIExpression(), !2490)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2493
  ret void, !dbg !2494
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) unnamed_addr #0 !dbg !2495 {
entry:
    #dbg_value(ptr %out, !2498, !DIExpression(), !2499)
    #dbg_value(i32 %nblocks, !2500, !DIExpression(), !2499)
    #dbg_value(ptr %s, !2501, !DIExpression(), !2499)
    #dbg_value(i32 %r, !2502, !DIExpression(), !2499)
  %0 = lshr i32 %r, 3, !dbg !2503
  br label %while.cond, !dbg !2503

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2498, !DIExpression(), !2499)
    #dbg_value(i32 %nblocks.addr.0, !2500, !DIExpression(), !2499)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2503
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2503

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2504
    #dbg_value(i32 0, !2506, !DIExpression(), !2499)
  br label %for.cond, !dbg !2507

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2509
    #dbg_value(i32 %i.0, !2506, !DIExpression(), !2499)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2510
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2512

for.body:                                         ; preds = %for.cond
  %mul = shl nuw i32 %i.0, 3, !dbg !2513
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2514
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2515
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2515
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2516
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2517
    #dbg_value(i32 %inc, !2506, !DIExpression(), !2499)
  br label %for.cond, !dbg !2518, !llvm.loop !2519

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2521
    #dbg_value(ptr %add.ptr1, !2498, !DIExpression(), !2499)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2522
    #dbg_value(i32 %sub, !2500, !DIExpression(), !2499)
  br label %while.cond, !dbg !2503, !llvm.loop !2523

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2525
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2526 {
entry:
    #dbg_value(ptr %x, !2529, !DIExpression(), !2530)
    #dbg_value(i64 %u, !2531, !DIExpression(), !2530)
    #dbg_value(i32 0, !2532, !DIExpression(), !2530)
  br label %for.cond, !dbg !2533

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2535
    #dbg_value(i32 %i.0, !2532, !DIExpression(), !2530)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2536
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2538

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2539
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2540
  %shr = lshr i64 %u, %sh_prom, !dbg !2540
  %conv = trunc i64 %shr to i8, !dbg !2541
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2542
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2543
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2544
    #dbg_value(i32 %inc, !2532, !DIExpression(), !2530)
  br label %for.cond, !dbg !2545, !llvm.loop !2546

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2548
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2549 {
entry:
    #dbg_value(ptr %state, !2550, !DIExpression(), !2551)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2552
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2553
  store i32 0, ptr %pos, align 8, !dbg !2554
  ret void, !dbg !2555
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2556 {
entry:
    #dbg_value(ptr %state, !2557, !DIExpression(), !2558)
    #dbg_value(ptr %in, !2559, !DIExpression(), !2558)
    #dbg_value(i32 %inlen, !2560, !DIExpression(), !2558)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2561
  %0 = load i32, ptr %pos, align 8, !dbg !2561
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2562
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2563
  store i32 %call, ptr %pos1, align 8, !dbg !2564
  ret void, !dbg !2565
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2566 {
entry:
    #dbg_value(ptr %state, !2567, !DIExpression(), !2568)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2569
  %0 = load i32, ptr %pos, align 8, !dbg !2569
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2570
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2571
  store i32 136, ptr %pos1, align 8, !dbg !2572
  ret void, !dbg !2573
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2574 {
entry:
    #dbg_value(ptr %out, !2575, !DIExpression(), !2576)
    #dbg_value(i32 %outlen, !2577, !DIExpression(), !2576)
    #dbg_value(ptr %state, !2578, !DIExpression(), !2576)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2579
  %0 = load i32, ptr %pos, align 8, !dbg !2579
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 136) #3, !dbg !2580
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2581
  store i32 %call, ptr %pos1, align 8, !dbg !2582
  ret void, !dbg !2583
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2584 {
entry:
    #dbg_value(ptr %state, !2585, !DIExpression(), !2586)
    #dbg_value(ptr %in, !2587, !DIExpression(), !2586)
    #dbg_value(i32 %inlen, !2588, !DIExpression(), !2586)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2589
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2590
  store i32 136, ptr %pos, align 8, !dbg !2591
  ret void, !dbg !2592
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2593 {
entry:
    #dbg_value(ptr %out, !2594, !DIExpression(), !2595)
    #dbg_value(i32 %nblocks, !2596, !DIExpression(), !2595)
    #dbg_value(ptr %state, !2597, !DIExpression(), !2595)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2598
  ret void, !dbg !2599
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2600 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2603, !DIExpression(), !2604)
    #dbg_value(i32 %outlen, !2605, !DIExpression(), !2604)
    #dbg_value(ptr %in, !2606, !DIExpression(), !2604)
    #dbg_value(i32 %inlen, !2607, !DIExpression(), !2604)
    #dbg_declare(ptr %state, !2608, !DIExpression(), !2609)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2610
  %div = udiv i32 %outlen, 168, !dbg !2611
    #dbg_value(i32 %div, !2612, !DIExpression(), !2604)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2613
  %mul.neg = mul i32 %div, -168, !dbg !2614
  %sub = add i32 %mul.neg, %outlen, !dbg !2615
    #dbg_value(i32 %sub, !2605, !DIExpression(), !2604)
  %mul1 = mul nuw i32 %div, 168, !dbg !2616
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2617
    #dbg_value(ptr %add.ptr, !2603, !DIExpression(), !2604)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2618
  ret void, !dbg !2619
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2620 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2621, !DIExpression(), !2622)
    #dbg_value(i32 %outlen, !2623, !DIExpression(), !2622)
    #dbg_value(ptr %in, !2624, !DIExpression(), !2622)
    #dbg_value(i32 %inlen, !2625, !DIExpression(), !2622)
    #dbg_declare(ptr %state, !2626, !DIExpression(), !2627)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2628
  %div = udiv i32 %outlen, 136, !dbg !2629
    #dbg_value(i32 %div, !2630, !DIExpression(), !2622)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2631
  %mul.neg = mul i32 %div, -136, !dbg !2632
  %sub = add i32 %mul.neg, %outlen, !dbg !2633
    #dbg_value(i32 %sub, !2623, !DIExpression(), !2622)
  %mul1 = mul nuw i32 %div, 136, !dbg !2634
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2635
    #dbg_value(ptr %add.ptr, !2621, !DIExpression(), !2622)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2636
  ret void, !dbg !2637
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2638 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2641, !DIExpression(), !2642)
    #dbg_value(ptr %in, !2643, !DIExpression(), !2642)
    #dbg_value(i32 %inlen, !2644, !DIExpression(), !2642)
    #dbg_declare(ptr %s, !2645, !DIExpression(), !2646)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2647
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2648
    #dbg_value(i32 0, !2649, !DIExpression(), !2642)
  br label %for.cond, !dbg !2650

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2652
    #dbg_value(i32 %i.0, !2649, !DIExpression(), !2642)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2653
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2655

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2656
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2657
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2658
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2658
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2659
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2660
    #dbg_value(i32 %inc, !2649, !DIExpression(), !2642)
  br label %for.cond, !dbg !2661, !llvm.loop !2662

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2664
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2665 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2666, !DIExpression(), !2667)
    #dbg_value(ptr %in, !2668, !DIExpression(), !2667)
    #dbg_value(i32 %inlen, !2669, !DIExpression(), !2667)
    #dbg_declare(ptr %s, !2670, !DIExpression(), !2671)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2672
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2673
    #dbg_value(i32 0, !2674, !DIExpression(), !2667)
  br label %for.cond, !dbg !2675

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2677
    #dbg_value(i32 %i.0, !2674, !DIExpression(), !2667)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2678
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2680

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2681
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2682
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2683
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2683
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2684
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2685
    #dbg_value(i32 %inc, !2674, !DIExpression(), !2667)
  br label %for.cond, !dbg !2686, !llvm.loop !2687

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2689
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2690 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2700, !DIExpression(), !2701)
    #dbg_value(ptr %seed, !2702, !DIExpression(), !2701)
    #dbg_value(i8 %x, !2703, !DIExpression(), !2701)
    #dbg_value(i8 %y, !2704, !DIExpression(), !2701)
    #dbg_declare(ptr %extseed, !2705, !DIExpression(), !2709)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2710
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2711
  store i8 %x, ptr %arrayidx, align 1, !dbg !2712
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2713
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2714
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2715
  ret void, !dbg !2716
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2717 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2720, !DIExpression(), !2721)
    #dbg_value(i32 %outlen, !2722, !DIExpression(), !2721)
    #dbg_value(ptr %key, !2723, !DIExpression(), !2721)
    #dbg_value(i8 %nonce, !2724, !DIExpression(), !2721)
    #dbg_declare(ptr %extkey, !2725, !DIExpression(), !2729)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2730
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2731
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2732
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2733
  ret void, !dbg !2734
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2735 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2736, !DIExpression(), !2737)
    #dbg_value(ptr %key, !2738, !DIExpression(), !2737)
    #dbg_value(ptr %input, !2739, !DIExpression(), !2737)
    #dbg_declare(ptr %s, !2740, !DIExpression(), !2741)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2742
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2743
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 768) #3, !dbg !2744
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2745
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2746
  ret void, !dbg !2747
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }
attributes #5 = { nounwind memory(none) }

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
!91 = !DILocation(line: 55, column: 3, scope: !79)
!92 = !DILocation(line: 56, column: 3, scope: !79)
!93 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !57, file: !57, line: 76, type: !94, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!94 = !DISubroutineType(types: !95)
!95 = !{!9, !60, !60, !64, !64}
!96 = !DILocalVariable(name: "ct", arg: 1, scope: !93, file: !57, line: 76, type: !60)
!97 = !DILocation(line: 0, scope: !93)
!98 = !DILocalVariable(name: "ss", arg: 2, scope: !93, file: !57, line: 77, type: !60)
!99 = !DILocalVariable(name: "pk", arg: 3, scope: !93, file: !57, line: 78, type: !64)
!100 = !DILocalVariable(name: "coins", arg: 4, scope: !93, file: !57, line: 79, type: !64)
!101 = !DILocalVariable(name: "buf", scope: !93, file: !57, line: 81, type: !86)
!102 = !DILocation(line: 81, column: 11, scope: !93)
!103 = !DILocalVariable(name: "kr", scope: !93, file: !57, line: 83, type: !86)
!104 = !DILocation(line: 83, column: 11, scope: !93)
!105 = !DILocation(line: 85, column: 3, scope: !93)
!106 = !DILocation(line: 88, column: 3, scope: !93)
!107 = !DILocation(line: 89, column: 3, scope: !93)
!108 = !DILocation(line: 92, column: 29, scope: !93)
!109 = !DILocation(line: 92, column: 3, scope: !93)
!110 = !DILocation(line: 94, column: 3, scope: !93)
!111 = !DILocation(line: 95, column: 3, scope: !93)
!112 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!113 = !DILocalVariable(name: "ct", arg: 1, scope: !112, file: !57, line: 113, type: !60)
!114 = !DILocation(line: 0, scope: !112)
!115 = !DILocalVariable(name: "ss", arg: 2, scope: !112, file: !57, line: 114, type: !60)
!116 = !DILocalVariable(name: "pk", arg: 3, scope: !112, file: !57, line: 115, type: !64)
!117 = !DILocalVariable(name: "coins", scope: !112, file: !57, line: 117, type: !118)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 256, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 32)
!121 = !DILocation(line: 117, column: 11, scope: !112)
!122 = !DILocation(line: 118, column: 3, scope: !112)
!123 = !DILocation(line: 119, column: 3, scope: !112)
!124 = !DILocation(line: 120, column: 3, scope: !112)
!125 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !57, file: !57, line: 140, type: !126, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!126 = !DISubroutineType(types: !127)
!127 = !{!9, !60, !64, !64}
!128 = !DILocalVariable(name: "ss", arg: 1, scope: !125, file: !57, line: 140, type: !60)
!129 = !DILocation(line: 0, scope: !125)
!130 = !DILocalVariable(name: "ct", arg: 2, scope: !125, file: !57, line: 141, type: !64)
!131 = !DILocalVariable(name: "sk", arg: 3, scope: !125, file: !57, line: 142, type: !64)
!132 = !DILocalVariable(name: "buf", scope: !125, file: !57, line: 145, type: !86)
!133 = !DILocation(line: 145, column: 11, scope: !125)
!134 = !DILocalVariable(name: "kr", scope: !125, file: !57, line: 147, type: !86)
!135 = !DILocation(line: 147, column: 11, scope: !125)
!136 = !DILocalVariable(name: "cmp", scope: !125, file: !57, line: 149, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 6144, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 768)
!140 = !DILocation(line: 149, column: 11, scope: !125)
!141 = !DILocation(line: 150, column: 25, scope: !125)
!142 = !DILocalVariable(name: "pk", scope: !125, file: !57, line: 150, type: !64)
!143 = !DILocation(line: 152, column: 3, scope: !125)
!144 = !DILocation(line: 155, column: 13, scope: !125)
!145 = !DILocation(line: 155, column: 53, scope: !125)
!146 = !DILocation(line: 155, column: 3, scope: !125)
!147 = !DILocation(line: 156, column: 3, scope: !125)
!148 = !DILocation(line: 159, column: 30, scope: !125)
!149 = !DILocation(line: 159, column: 3, scope: !125)
!150 = !DILocation(line: 161, column: 10, scope: !125)
!151 = !DILocalVariable(name: "fail", scope: !125, file: !57, line: 144, type: !9)
!152 = !DILocation(line: 164, column: 3, scope: !125)
!153 = !DILocation(line: 167, column: 29, scope: !125)
!154 = !DILocation(line: 167, column: 3, scope: !125)
!155 = !DILocation(line: 169, column: 3, scope: !125)
!156 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !157, file: !157, line: 165, type: !158, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!157 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!158 = !DISubroutineType(types: !159)
!159 = !{null, !160, !64, !9}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !163)
!162 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 8192, elements: !164)
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !163, file: !162, line: 9, baseType: !166, size: 8192)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !167, size: 8192, elements: !175)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !169)
!168 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !170)
!170 = !{!171}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !169, file: !168, line: 12, baseType: !172, size: 4096)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 256)
!175 = !{!176}
!176 = !DISubrange(count: 2)
!177 = !DILocalVariable(name: "a", arg: 1, scope: !156, file: !157, line: 165, type: !160)
!178 = !DILocation(line: 0, scope: !156)
!179 = !DILocalVariable(name: "seed", arg: 2, scope: !156, file: !157, line: 165, type: !64)
!180 = !DILocalVariable(name: "transposed", arg: 3, scope: !156, file: !157, line: 165, type: !9)
!181 = !DILocalVariable(name: "buf", scope: !156, file: !157, line: 169, type: !182)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4032, elements: !183)
!183 = !{!184}
!184 = !DISubrange(count: 504)
!185 = !DILocation(line: 169, column: 11, scope: !156)
!186 = !DILocalVariable(name: "state", scope: !156, file: !157, line: 170, type: !187)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !188, line: 10, baseType: !189)
!188 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !191)
!190 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!191 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !192)
!192 = !{!193, !197}
!193 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !191, file: !190, line: 15, baseType: !194, size: 1600)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 25)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !191, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!198 = !DILocation(line: 170, column: 13, scope: !156)
!199 = !DILocalVariable(name: "i", scope: !156, file: !157, line: 167, type: !42)
!200 = !DILocation(line: 172, column: 7, scope: !201)
!201 = distinct !DILexicalBlock(scope: !156, file: !157, line: 172, column: 3)
!202 = !DILocation(line: 172, scope: !201)
!203 = !DILocation(line: 172, column: 12, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !157, line: 172, column: 3)
!205 = !DILocation(line: 172, column: 3, scope: !201)
!206 = !DILocation(line: 173, column: 5, scope: !207)
!207 = distinct !DILexicalBlock(scope: !208, file: !157, line: 173, column: 5)
!208 = distinct !DILexicalBlock(scope: !204, file: !157, line: 172, column: 26)
!209 = !DILocation(line: 173, scope: !207)
!210 = !DILocalVariable(name: "j", scope: !156, file: !157, line: 167, type: !42)
!211 = !DILocation(line: 173, column: 14, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !157, line: 173, column: 5)
!213 = !DILocation(line: 174, column: 10, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !157, line: 174, column: 10)
!215 = distinct !DILexicalBlock(scope: !212, file: !157, line: 173, column: 28)
!216 = !DILocation(line: 175, column: 9, scope: !214)
!217 = !DILocation(line: 177, column: 9, scope: !214)
!218 = !DILocation(line: 179, column: 7, scope: !215)
!219 = !DILocalVariable(name: "buflen", scope: !156, file: !157, line: 168, type: !42)
!220 = !DILocation(line: 181, column: 25, scope: !215)
!221 = !DILocation(line: 181, column: 13, scope: !215)
!222 = !DILocalVariable(name: "ctr", scope: !156, file: !157, line: 167, type: !42)
!223 = !DILocation(line: 183, column: 7, scope: !215)
!224 = !DILocation(line: 0, scope: !215)
!225 = !DILocation(line: 183, column: 17, scope: !215)
!226 = !DILocation(line: 184, column: 9, scope: !227)
!227 = distinct !DILexicalBlock(scope: !215, file: !157, line: 183, column: 28)
!228 = !DILocation(line: 186, column: 28, scope: !227)
!229 = !DILocation(line: 186, column: 47, scope: !227)
!230 = !DILocation(line: 186, column: 62, scope: !227)
!231 = !DILocation(line: 186, column: 16, scope: !227)
!232 = !DILocation(line: 186, column: 13, scope: !227)
!233 = distinct !{!233, !223, !234, !235}
!234 = !DILocation(line: 187, column: 7, scope: !215)
!235 = !{!"llvm.loop.mustprogress"}
!236 = !DILocation(line: 173, column: 24, scope: !212)
!237 = !DILocation(line: 173, column: 5, scope: !212)
!238 = distinct !{!238, !206, !239, !235}
!239 = !DILocation(line: 188, column: 5, scope: !207)
!240 = !DILocation(line: 172, column: 22, scope: !204)
!241 = !DILocation(line: 172, column: 3, scope: !204)
!242 = distinct !{!242, !205, !243, !235}
!243 = !DILocation(line: 189, column: 3, scope: !201)
!244 = !DILocation(line: 190, column: 1, scope: !156)
!245 = distinct !DISubprogram(name: "rej_uniform", scope: !157, file: !157, line: 121, type: !246, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!246 = !DISubroutineType(types: !247)
!247 = !{!42, !248, !42, !64, !42}
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!249 = !DILocalVariable(name: "r", arg: 1, scope: !245, file: !157, line: 121, type: !248)
!250 = !DILocation(line: 0, scope: !245)
!251 = !DILocalVariable(name: "len", arg: 2, scope: !245, file: !157, line: 122, type: !42)
!252 = !DILocalVariable(name: "buf", arg: 3, scope: !245, file: !157, line: 123, type: !64)
!253 = !DILocalVariable(name: "buflen", arg: 4, scope: !245, file: !157, line: 124, type: !42)
!254 = !DILocalVariable(name: "pos", scope: !245, file: !157, line: 126, type: !42)
!255 = !DILocalVariable(name: "ctr", scope: !245, file: !157, line: 126, type: !42)
!256 = !DILocation(line: 130, column: 3, scope: !245)
!257 = !DILocation(line: 130, column: 13, scope: !245)
!258 = !DILocation(line: 130, column: 19, scope: !245)
!259 = !DILocation(line: 131, column: 14, scope: !260)
!260 = distinct !DILexicalBlock(scope: !245, file: !157, line: 130, column: 41)
!261 = !DILocation(line: 131, column: 44, scope: !260)
!262 = !DILocation(line: 131, column: 34, scope: !260)
!263 = !DILocation(line: 131, column: 55, scope: !260)
!264 = !DILocation(line: 131, column: 62, scope: !260)
!265 = !DILocalVariable(name: "val0", scope: !245, file: !157, line: 127, type: !35)
!266 = !DILocation(line: 132, column: 14, scope: !260)
!267 = !DILocation(line: 132, column: 25, scope: !260)
!268 = !DILocation(line: 132, column: 44, scope: !260)
!269 = !DILocation(line: 132, column: 34, scope: !260)
!270 = !DILocation(line: 132, column: 55, scope: !260)
!271 = !DILocation(line: 132, column: 31, scope: !260)
!272 = !DILocalVariable(name: "val1", scope: !245, file: !157, line: 127, type: !35)
!273 = !DILocation(line: 133, column: 9, scope: !260)
!274 = !DILocation(line: 135, column: 13, scope: !275)
!275 = distinct !DILexicalBlock(scope: !260, file: !157, line: 135, column: 8)
!276 = !DILocation(line: 136, column: 12, scope: !275)
!277 = !DILocation(line: 136, column: 7, scope: !275)
!278 = !DILocation(line: 136, column: 16, scope: !275)
!279 = !DILocation(line: 137, column: 12, scope: !280)
!280 = distinct !DILexicalBlock(scope: !260, file: !157, line: 137, column: 8)
!281 = !DILocation(line: 137, column: 18, scope: !280)
!282 = !DILocation(line: 138, column: 12, scope: !280)
!283 = !DILocation(line: 138, column: 7, scope: !280)
!284 = !DILocation(line: 138, column: 16, scope: !280)
!285 = !DILocation(line: 0, scope: !260)
!286 = distinct !{!286, !256, !287, !235}
!287 = !DILocation(line: 139, column: 3, scope: !245)
!288 = !DILocation(line: 141, column: 3, scope: !245)
!289 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !157, file: !157, line: 205, type: !290, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!290 = !DISubroutineType(types: !291)
!291 = !{null, !60, !60, !64}
!292 = !DILocalVariable(name: "pk", arg: 1, scope: !289, file: !157, line: 205, type: !60)
!293 = !DILocation(line: 0, scope: !289)
!294 = !DILocalVariable(name: "sk", arg: 2, scope: !289, file: !157, line: 206, type: !60)
!295 = !DILocalVariable(name: "coins", arg: 3, scope: !289, file: !157, line: 207, type: !64)
!296 = !DILocalVariable(name: "buf", scope: !289, file: !157, line: 210, type: !86)
!297 = !DILocation(line: 210, column: 11, scope: !289)
!298 = !DILocalVariable(name: "publicseed", scope: !289, file: !157, line: 211, type: !64)
!299 = !DILocation(line: 212, column: 33, scope: !289)
!300 = !DILocalVariable(name: "noiseseed", scope: !289, file: !157, line: 212, type: !64)
!301 = !DILocalVariable(name: "nonce", scope: !289, file: !157, line: 213, type: !61)
!302 = !DILocalVariable(name: "a", scope: !289, file: !157, line: 214, type: !303)
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 16384, elements: !175)
!304 = !DILocation(line: 214, column: 11, scope: !289)
!305 = !DILocalVariable(name: "e", scope: !289, file: !157, line: 214, type: !161)
!306 = !DILocation(line: 214, column: 23, scope: !289)
!307 = !DILocalVariable(name: "pkpv", scope: !289, file: !157, line: 214, type: !161)
!308 = !DILocation(line: 214, column: 26, scope: !289)
!309 = !DILocalVariable(name: "skpv", scope: !289, file: !157, line: 214, type: !161)
!310 = !DILocation(line: 214, column: 32, scope: !289)
!311 = !DILocation(line: 216, column: 3, scope: !289)
!312 = !DILocation(line: 217, column: 3, scope: !289)
!313 = !DILocation(line: 217, column: 23, scope: !289)
!314 = !DILocation(line: 218, column: 3, scope: !289)
!315 = !DILocation(line: 220, column: 3, scope: !289)
!316 = !DILocalVariable(name: "i", scope: !289, file: !157, line: 209, type: !42)
!317 = !DILocation(line: 222, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !289, file: !157, line: 222, column: 3)
!319 = !DILocation(line: 222, scope: !318)
!320 = !DILocation(line: 222, column: 12, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !157, line: 222, column: 3)
!322 = !DILocation(line: 222, column: 3, scope: !318)
!323 = !DILocation(line: 224, column: 3, scope: !324)
!324 = distinct !DILexicalBlock(scope: !289, file: !157, line: 224, column: 3)
!325 = !DILocation(line: 223, column: 25, scope: !321)
!326 = !DILocation(line: 223, column: 5, scope: !321)
!327 = !DILocation(line: 223, column: 54, scope: !321)
!328 = !DILocation(line: 222, column: 22, scope: !321)
!329 = !DILocation(line: 222, column: 3, scope: !321)
!330 = distinct !{!330, !322, !331, !235}
!331 = !DILocation(line: 223, column: 56, scope: !318)
!332 = !DILocation(line: 224, scope: !324)
!333 = !DILocation(line: 224, column: 12, scope: !334)
!334 = distinct !DILexicalBlock(scope: !324, file: !157, line: 224, column: 3)
!335 = !DILocation(line: 225, column: 25, scope: !334)
!336 = !DILocation(line: 225, column: 5, scope: !334)
!337 = !DILocation(line: 225, column: 51, scope: !334)
!338 = !DILocation(line: 224, column: 22, scope: !334)
!339 = !DILocation(line: 224, column: 3, scope: !334)
!340 = distinct !{!340, !323, !341, !235}
!341 = !DILocation(line: 225, column: 53, scope: !324)
!342 = !DILocation(line: 227, column: 3, scope: !289)
!343 = !DILocation(line: 228, column: 3, scope: !289)
!344 = !DILocation(line: 231, column: 7, scope: !345)
!345 = distinct !DILexicalBlock(scope: !289, file: !157, line: 231, column: 3)
!346 = !DILocation(line: 231, scope: !345)
!347 = !DILocation(line: 231, column: 12, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !157, line: 231, column: 3)
!349 = !DILocation(line: 231, column: 3, scope: !345)
!350 = !DILocation(line: 232, column: 37, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !157, line: 231, column: 26)
!352 = !DILocation(line: 232, column: 51, scope: !351)
!353 = !DILocation(line: 232, column: 5, scope: !351)
!354 = !DILocation(line: 233, column: 18, scope: !351)
!355 = !DILocation(line: 233, column: 5, scope: !351)
!356 = !DILocation(line: 231, column: 22, scope: !348)
!357 = !DILocation(line: 231, column: 3, scope: !348)
!358 = distinct !{!358, !349, !359, !235}
!359 = !DILocation(line: 234, column: 3, scope: !345)
!360 = !DILocation(line: 236, column: 3, scope: !289)
!361 = !DILocation(line: 237, column: 3, scope: !289)
!362 = !DILocation(line: 239, column: 3, scope: !289)
!363 = !DILocation(line: 240, column: 3, scope: !289)
!364 = !DILocation(line: 241, column: 1, scope: !289)
!365 = distinct !DISubprogram(name: "pack_sk", scope: !157, file: !157, line: 57, type: !366, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !60, !160}
!368 = !DILocalVariable(name: "r", arg: 1, scope: !365, file: !157, line: 57, type: !60)
!369 = !DILocation(line: 0, scope: !365)
!370 = !DILocalVariable(name: "sk", arg: 2, scope: !365, file: !157, line: 57, type: !160)
!371 = !DILocation(line: 59, column: 3, scope: !365)
!372 = !DILocation(line: 60, column: 1, scope: !365)
!373 = distinct !DISubprogram(name: "pack_pk", scope: !157, file: !157, line: 23, type: !374, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !60, !160, !64}
!376 = !DILocalVariable(name: "r", arg: 1, scope: !373, file: !157, line: 23, type: !60)
!377 = !DILocation(line: 0, scope: !373)
!378 = !DILocalVariable(name: "pk", arg: 2, scope: !373, file: !157, line: 24, type: !160)
!379 = !DILocalVariable(name: "seed", arg: 3, scope: !373, file: !157, line: 25, type: !64)
!380 = !DILocation(line: 27, column: 3, scope: !373)
!381 = !DILocation(line: 28, column: 11, scope: !373)
!382 = !DILocation(line: 28, column: 3, scope: !373)
!383 = !DILocation(line: 29, column: 1, scope: !373)
!384 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !157, file: !157, line: 260, type: !385, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!385 = !DISubroutineType(types: !386)
!386 = !{null, !60, !64, !64, !64}
!387 = !DILocalVariable(name: "c", arg: 1, scope: !384, file: !157, line: 260, type: !60)
!388 = !DILocation(line: 0, scope: !384)
!389 = !DILocalVariable(name: "m", arg: 2, scope: !384, file: !157, line: 261, type: !64)
!390 = !DILocalVariable(name: "pk", arg: 3, scope: !384, file: !157, line: 262, type: !64)
!391 = !DILocalVariable(name: "coins", arg: 4, scope: !384, file: !157, line: 263, type: !64)
!392 = !DILocalVariable(name: "seed", scope: !384, file: !157, line: 266, type: !118)
!393 = !DILocation(line: 266, column: 11, scope: !384)
!394 = !DILocalVariable(name: "nonce", scope: !384, file: !157, line: 267, type: !61)
!395 = !DILocalVariable(name: "sp", scope: !384, file: !157, line: 268, type: !161)
!396 = !DILocation(line: 268, column: 11, scope: !384)
!397 = !DILocalVariable(name: "pkpv", scope: !384, file: !157, line: 268, type: !161)
!398 = !DILocation(line: 268, column: 15, scope: !384)
!399 = !DILocalVariable(name: "ep", scope: !384, file: !157, line: 268, type: !161)
!400 = !DILocation(line: 268, column: 21, scope: !384)
!401 = !DILocalVariable(name: "at", scope: !384, file: !157, line: 268, type: !303)
!402 = !DILocation(line: 268, column: 25, scope: !384)
!403 = !DILocalVariable(name: "b", scope: !384, file: !157, line: 268, type: !161)
!404 = !DILocation(line: 268, column: 38, scope: !384)
!405 = !DILocalVariable(name: "v", scope: !384, file: !157, line: 269, type: !167)
!406 = !DILocation(line: 269, column: 8, scope: !384)
!407 = !DILocalVariable(name: "k", scope: !384, file: !157, line: 269, type: !167)
!408 = !DILocation(line: 269, column: 11, scope: !384)
!409 = !DILocalVariable(name: "epp", scope: !384, file: !157, line: 269, type: !167)
!410 = !DILocation(line: 269, column: 14, scope: !384)
!411 = !DILocation(line: 271, column: 3, scope: !384)
!412 = !DILocation(line: 272, column: 3, scope: !384)
!413 = !DILocation(line: 273, column: 3, scope: !384)
!414 = !DILocalVariable(name: "i", scope: !384, file: !157, line: 265, type: !42)
!415 = !DILocation(line: 275, column: 7, scope: !416)
!416 = distinct !DILexicalBlock(scope: !384, file: !157, line: 275, column: 3)
!417 = !DILocation(line: 275, scope: !416)
!418 = !DILocation(line: 275, column: 12, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !157, line: 275, column: 3)
!420 = !DILocation(line: 275, column: 3, scope: !416)
!421 = !DILocation(line: 277, column: 3, scope: !422)
!422 = distinct !DILexicalBlock(scope: !384, file: !157, line: 277, column: 3)
!423 = !DILocation(line: 276, column: 30, scope: !419)
!424 = !DILocation(line: 276, column: 5, scope: !419)
!425 = !DILocation(line: 276, column: 46, scope: !419)
!426 = !DILocation(line: 275, column: 22, scope: !419)
!427 = !DILocation(line: 275, column: 3, scope: !419)
!428 = distinct !{!428, !420, !429, !235}
!429 = !DILocation(line: 276, column: 48, scope: !416)
!430 = !DILocation(line: 277, scope: !422)
!431 = !DILocation(line: 277, column: 12, scope: !432)
!432 = distinct !DILexicalBlock(scope: !422, file: !157, line: 277, column: 3)
!433 = !DILocation(line: 278, column: 30, scope: !432)
!434 = !DILocation(line: 278, column: 5, scope: !432)
!435 = !DILocation(line: 278, column: 46, scope: !432)
!436 = !DILocation(line: 277, column: 22, scope: !432)
!437 = !DILocation(line: 277, column: 3, scope: !432)
!438 = distinct !{!438, !421, !439, !235}
!439 = !DILocation(line: 278, column: 48, scope: !422)
!440 = !DILocation(line: 279, column: 3, scope: !384)
!441 = !DILocation(line: 281, column: 3, scope: !384)
!442 = !DILocation(line: 284, column: 7, scope: !443)
!443 = distinct !DILexicalBlock(scope: !384, file: !157, line: 284, column: 3)
!444 = !DILocation(line: 284, scope: !443)
!445 = !DILocation(line: 284, column: 12, scope: !446)
!446 = distinct !DILexicalBlock(scope: !443, file: !157, line: 284, column: 3)
!447 = !DILocation(line: 284, column: 3, scope: !443)
!448 = !DILocation(line: 285, column: 37, scope: !446)
!449 = !DILocation(line: 285, column: 48, scope: !446)
!450 = !DILocation(line: 285, column: 5, scope: !446)
!451 = !DILocation(line: 284, column: 22, scope: !446)
!452 = !DILocation(line: 284, column: 3, scope: !446)
!453 = distinct !{!453, !447, !454, !235}
!454 = !DILocation(line: 285, column: 58, scope: !443)
!455 = !DILocation(line: 287, column: 3, scope: !384)
!456 = !DILocation(line: 289, column: 3, scope: !384)
!457 = !DILocation(line: 290, column: 3, scope: !384)
!458 = !DILocation(line: 292, column: 3, scope: !384)
!459 = !DILocation(line: 293, column: 3, scope: !384)
!460 = !DILocation(line: 294, column: 3, scope: !384)
!461 = !DILocation(line: 295, column: 3, scope: !384)
!462 = !DILocation(line: 296, column: 3, scope: !384)
!463 = !DILocation(line: 298, column: 3, scope: !384)
!464 = !DILocation(line: 299, column: 1, scope: !384)
!465 = distinct !DISubprogram(name: "unpack_pk", scope: !157, file: !157, line: 41, type: !466, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!466 = !DISubroutineType(types: !467)
!467 = !{null, !160, !60, !64}
!468 = !DILocalVariable(name: "pk", arg: 1, scope: !465, file: !157, line: 41, type: !160)
!469 = !DILocation(line: 0, scope: !465)
!470 = !DILocalVariable(name: "seed", arg: 2, scope: !465, file: !157, line: 42, type: !60)
!471 = !DILocalVariable(name: "packedpk", arg: 3, scope: !465, file: !157, line: 43, type: !64)
!472 = !DILocation(line: 45, column: 3, scope: !465)
!473 = !DILocation(line: 46, column: 24, scope: !465)
!474 = !DILocation(line: 46, column: 3, scope: !465)
!475 = !DILocation(line: 47, column: 1, scope: !465)
!476 = distinct !DISubprogram(name: "pack_ciphertext", scope: !157, file: !157, line: 86, type: !477, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!477 = !DISubroutineType(types: !478)
!478 = !{null, !60, !160, !479}
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 32)
!480 = !DILocalVariable(name: "r", arg: 1, scope: !476, file: !157, line: 86, type: !60)
!481 = !DILocation(line: 0, scope: !476)
!482 = !DILocalVariable(name: "b", arg: 2, scope: !476, file: !157, line: 86, type: !160)
!483 = !DILocalVariable(name: "v", arg: 3, scope: !476, file: !157, line: 86, type: !479)
!484 = !DILocation(line: 88, column: 3, scope: !476)
!485 = !DILocation(line: 89, column: 18, scope: !476)
!486 = !DILocation(line: 89, column: 3, scope: !476)
!487 = !DILocation(line: 90, column: 1, scope: !476)
!488 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !157, file: !157, line: 314, type: !489, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !60, !64, !64}
!491 = !DILocalVariable(name: "m", arg: 1, scope: !488, file: !157, line: 314, type: !60)
!492 = !DILocation(line: 0, scope: !488)
!493 = !DILocalVariable(name: "c", arg: 2, scope: !488, file: !157, line: 315, type: !64)
!494 = !DILocalVariable(name: "sk", arg: 3, scope: !488, file: !157, line: 316, type: !64)
!495 = !DILocalVariable(name: "b", scope: !488, file: !157, line: 318, type: !161)
!496 = !DILocation(line: 318, column: 11, scope: !488)
!497 = !DILocalVariable(name: "skpv", scope: !488, file: !157, line: 318, type: !161)
!498 = !DILocation(line: 318, column: 14, scope: !488)
!499 = !DILocalVariable(name: "v", scope: !488, file: !157, line: 319, type: !167)
!500 = !DILocation(line: 319, column: 8, scope: !488)
!501 = !DILocalVariable(name: "mp", scope: !488, file: !157, line: 319, type: !167)
!502 = !DILocation(line: 319, column: 11, scope: !488)
!503 = !DILocation(line: 321, column: 3, scope: !488)
!504 = !DILocation(line: 322, column: 3, scope: !488)
!505 = !DILocation(line: 324, column: 3, scope: !488)
!506 = !DILocation(line: 325, column: 3, scope: !488)
!507 = !DILocation(line: 326, column: 3, scope: !488)
!508 = !DILocation(line: 328, column: 3, scope: !488)
!509 = !DILocation(line: 329, column: 3, scope: !488)
!510 = !DILocation(line: 331, column: 3, scope: !488)
!511 = !DILocation(line: 332, column: 1, scope: !488)
!512 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !157, file: !157, line: 102, type: !513, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !160, !479, !64}
!515 = !DILocalVariable(name: "b", arg: 1, scope: !512, file: !157, line: 102, type: !160)
!516 = !DILocation(line: 0, scope: !512)
!517 = !DILocalVariable(name: "v", arg: 2, scope: !512, file: !157, line: 102, type: !479)
!518 = !DILocalVariable(name: "c", arg: 3, scope: !512, file: !157, line: 102, type: !64)
!519 = !DILocation(line: 104, column: 3, scope: !512)
!520 = !DILocation(line: 105, column: 23, scope: !512)
!521 = !DILocation(line: 105, column: 3, scope: !512)
!522 = !DILocation(line: 106, column: 1, scope: !512)
!523 = distinct !DISubprogram(name: "unpack_sk", scope: !157, file: !157, line: 70, type: !524, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !160, !64}
!526 = !DILocalVariable(name: "sk", arg: 1, scope: !523, file: !157, line: 70, type: !160)
!527 = !DILocation(line: 0, scope: !523)
!528 = !DILocalVariable(name: "packedsk", arg: 2, scope: !523, file: !157, line: 70, type: !64)
!529 = !DILocation(line: 72, column: 3, scope: !523)
!530 = !DILocation(line: 73, column: 1, scope: !523)
!531 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !532, file: !532, line: 15, type: !533, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!532 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!533 = !DISubroutineType(types: !534)
!534 = !{null, !60, !535}
!535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !536, size: 32)
!536 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !537)
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !538)
!538 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 8192, elements: !539)
!539 = !{!540}
!540 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !538, file: !162, line: 9, baseType: !541, size: 8192)
!541 = !DICompositeType(tag: DW_TAG_array_type, baseType: !542, size: 8192, elements: !175)
!542 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !543)
!543 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !544)
!544 = !{!545}
!545 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !543, file: !168, line: 12, baseType: !172, size: 4096)
!546 = !DILocalVariable(name: "r", arg: 1, scope: !531, file: !532, line: 15, type: !60)
!547 = !DILocation(line: 0, scope: !531)
!548 = !DILocalVariable(name: "a", arg: 2, scope: !531, file: !532, line: 15, type: !535)
!549 = !DILocalVariable(name: "t", scope: !531, file: !532, line: 51, type: !550)
!550 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 64, elements: !551)
!551 = !{!552}
!552 = !DISubrange(count: 4)
!553 = !DILocation(line: 51, column: 12, scope: !531)
!554 = !DILocalVariable(name: "i", scope: !531, file: !532, line: 17, type: !42)
!555 = !DILocation(line: 52, column: 7, scope: !556)
!556 = distinct !DILexicalBlock(scope: !531, file: !532, line: 52, column: 3)
!557 = !DILocation(line: 52, scope: !556)
!558 = !DILocation(line: 52, column: 12, scope: !559)
!559 = distinct !DILexicalBlock(scope: !556, file: !532, line: 52, column: 3)
!560 = !DILocation(line: 52, column: 3, scope: !556)
!561 = !DILocation(line: 53, column: 5, scope: !562)
!562 = distinct !DILexicalBlock(scope: !563, file: !532, line: 53, column: 5)
!563 = distinct !DILexicalBlock(scope: !559, file: !532, line: 52, column: 26)
!564 = !DILocation(line: 53, scope: !562)
!565 = !DILocalVariable(name: "j", scope: !531, file: !532, line: 17, type: !42)
!566 = !DILocation(line: 53, column: 14, scope: !567)
!567 = distinct !DILexicalBlock(scope: !562, file: !532, line: 53, column: 5)
!568 = !DILocation(line: 54, column: 7, scope: !569)
!569 = distinct !DILexicalBlock(scope: !570, file: !532, line: 54, column: 7)
!570 = distinct !DILexicalBlock(scope: !567, file: !532, line: 53, column: 30)
!571 = !DILocation(line: 54, scope: !569)
!572 = !DILocalVariable(name: "k", scope: !531, file: !532, line: 17, type: !42)
!573 = !DILocation(line: 54, column: 16, scope: !574)
!574 = distinct !DILexicalBlock(scope: !569, file: !532, line: 54, column: 7)
!575 = !DILocation(line: 55, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !574, file: !532, line: 54, column: 24)
!577 = !DILocation(line: 55, column: 35, scope: !576)
!578 = !DILocation(line: 55, column: 37, scope: !576)
!579 = !DILocation(line: 56, column: 39, scope: !576)
!580 = !DILocation(line: 56, column: 9, scope: !576)
!581 = !DILocation(line: 56, column: 14, scope: !576)
!582 = !DILocation(line: 58, column: 14, scope: !576)
!583 = !DILocalVariable(name: "d0", scope: !531, file: !532, line: 18, type: !23)
!584 = !DILocation(line: 61, column: 12, scope: !576)
!585 = !DILocation(line: 62, column: 12, scope: !576)
!586 = !DILocation(line: 63, column: 16, scope: !576)
!587 = !DILocation(line: 63, column: 9, scope: !576)
!588 = !DILocation(line: 63, column: 14, scope: !576)
!589 = !DILocation(line: 54, column: 20, scope: !574)
!590 = !DILocation(line: 54, column: 7, scope: !574)
!591 = distinct !{!591, !568, !592, !235}
!592 = !DILocation(line: 64, column: 7, scope: !569)
!593 = !DILocation(line: 66, column: 15, scope: !570)
!594 = !DILocation(line: 66, column: 14, scope: !570)
!595 = !DILocation(line: 66, column: 12, scope: !570)
!596 = !DILocation(line: 67, column: 15, scope: !570)
!597 = !DILocation(line: 67, column: 20, scope: !570)
!598 = !DILocation(line: 67, column: 29, scope: !570)
!599 = !DILocation(line: 67, column: 34, scope: !570)
!600 = !DILocation(line: 67, column: 26, scope: !570)
!601 = !DILocation(line: 67, column: 7, scope: !570)
!602 = !DILocation(line: 67, column: 12, scope: !570)
!603 = !DILocation(line: 68, column: 15, scope: !570)
!604 = !DILocation(line: 68, column: 20, scope: !570)
!605 = !DILocation(line: 68, column: 29, scope: !570)
!606 = !DILocation(line: 68, column: 34, scope: !570)
!607 = !DILocation(line: 68, column: 26, scope: !570)
!608 = !DILocation(line: 68, column: 7, scope: !570)
!609 = !DILocation(line: 68, column: 12, scope: !570)
!610 = !DILocation(line: 69, column: 15, scope: !570)
!611 = !DILocation(line: 69, column: 20, scope: !570)
!612 = !DILocation(line: 69, column: 29, scope: !570)
!613 = !DILocation(line: 69, column: 34, scope: !570)
!614 = !DILocation(line: 69, column: 26, scope: !570)
!615 = !DILocation(line: 69, column: 7, scope: !570)
!616 = !DILocation(line: 69, column: 12, scope: !570)
!617 = !DILocation(line: 70, column: 15, scope: !570)
!618 = !DILocation(line: 70, column: 20, scope: !570)
!619 = !DILocation(line: 70, column: 14, scope: !570)
!620 = !DILocation(line: 70, column: 7, scope: !570)
!621 = !DILocation(line: 70, column: 12, scope: !570)
!622 = !DILocation(line: 71, column: 9, scope: !570)
!623 = !DILocation(line: 53, column: 26, scope: !567)
!624 = !DILocation(line: 53, column: 5, scope: !567)
!625 = distinct !{!625, !561, !626, !235}
!626 = !DILocation(line: 72, column: 5, scope: !562)
!627 = !DILocation(line: 52, column: 22, scope: !559)
!628 = !DILocation(line: 52, column: 3, scope: !559)
!629 = distinct !{!629, !560, !630, !235}
!630 = !DILocation(line: 73, column: 3, scope: !556)
!631 = !DILocation(line: 77, column: 1, scope: !531)
!632 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !532, file: !532, line: 89, type: !633, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!633 = !DISubroutineType(types: !634)
!634 = !{null, !635, !64}
!635 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !537, size: 32)
!636 = !DILocalVariable(name: "r", arg: 1, scope: !632, file: !532, line: 89, type: !635)
!637 = !DILocation(line: 0, scope: !632)
!638 = !DILocalVariable(name: "a", arg: 2, scope: !632, file: !532, line: 89, type: !64)
!639 = !DILocalVariable(name: "t", scope: !632, file: !532, line: 112, type: !550)
!640 = !DILocation(line: 112, column: 12, scope: !632)
!641 = !DILocalVariable(name: "i", scope: !632, file: !532, line: 91, type: !42)
!642 = !DILocation(line: 113, column: 7, scope: !643)
!643 = distinct !DILexicalBlock(scope: !632, file: !532, line: 113, column: 3)
!644 = !DILocation(line: 113, scope: !643)
!645 = !DILocation(line: 113, column: 12, scope: !646)
!646 = distinct !DILexicalBlock(scope: !643, file: !532, line: 113, column: 3)
!647 = !DILocation(line: 113, column: 3, scope: !643)
!648 = !DILocation(line: 114, column: 5, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !532, line: 114, column: 5)
!650 = distinct !DILexicalBlock(scope: !646, file: !532, line: 113, column: 26)
!651 = !DILocation(line: 114, scope: !649)
!652 = !DILocalVariable(name: "j", scope: !632, file: !532, line: 91, type: !42)
!653 = !DILocation(line: 114, column: 14, scope: !654)
!654 = distinct !DILexicalBlock(scope: !649, file: !532, line: 114, column: 5)
!655 = !DILocation(line: 115, column: 15, scope: !656)
!656 = distinct !DILexicalBlock(scope: !654, file: !532, line: 114, column: 30)
!657 = !DILocation(line: 115, column: 39, scope: !656)
!658 = !DILocation(line: 115, column: 29, scope: !656)
!659 = !DILocation(line: 115, column: 44, scope: !656)
!660 = !DILocation(line: 115, column: 26, scope: !656)
!661 = !DILocation(line: 115, column: 12, scope: !656)
!662 = !DILocation(line: 116, column: 15, scope: !656)
!663 = !DILocation(line: 116, column: 20, scope: !656)
!664 = !DILocation(line: 116, column: 39, scope: !656)
!665 = !DILocation(line: 116, column: 29, scope: !656)
!666 = !DILocation(line: 116, column: 44, scope: !656)
!667 = !DILocation(line: 116, column: 26, scope: !656)
!668 = !DILocation(line: 116, column: 7, scope: !656)
!669 = !DILocation(line: 116, column: 12, scope: !656)
!670 = !DILocation(line: 117, column: 15, scope: !656)
!671 = !DILocation(line: 117, column: 20, scope: !656)
!672 = !DILocation(line: 117, column: 39, scope: !656)
!673 = !DILocation(line: 117, column: 29, scope: !656)
!674 = !DILocation(line: 117, column: 44, scope: !656)
!675 = !DILocation(line: 117, column: 26, scope: !656)
!676 = !DILocation(line: 117, column: 7, scope: !656)
!677 = !DILocation(line: 117, column: 12, scope: !656)
!678 = !DILocation(line: 118, column: 15, scope: !656)
!679 = !DILocation(line: 118, column: 20, scope: !656)
!680 = !DILocation(line: 118, column: 39, scope: !656)
!681 = !DILocation(line: 118, column: 29, scope: !656)
!682 = !DILocation(line: 118, column: 44, scope: !656)
!683 = !DILocation(line: 118, column: 26, scope: !656)
!684 = !DILocation(line: 118, column: 7, scope: !656)
!685 = !DILocation(line: 118, column: 12, scope: !656)
!686 = !DILocalVariable(name: "k", scope: !632, file: !532, line: 91, type: !42)
!687 = !DILocation(line: 121, column: 11, scope: !688)
!688 = distinct !DILexicalBlock(scope: !656, file: !532, line: 121, column: 7)
!689 = !DILocation(line: 121, scope: !688)
!690 = !DILocation(line: 121, column: 16, scope: !691)
!691 = distinct !DILexicalBlock(scope: !688, file: !532, line: 121, column: 7)
!692 = !DILocation(line: 121, column: 7, scope: !688)
!693 = !DILocation(line: 122, column: 47, scope: !691)
!694 = !DILocation(line: 122, column: 52, scope: !691)
!695 = !DILocation(line: 122, column: 60, scope: !691)
!696 = !DILocation(line: 122, column: 69, scope: !691)
!697 = !DILocation(line: 122, column: 76, scope: !691)
!698 = !DILocation(line: 122, column: 35, scope: !691)
!699 = !DILocation(line: 122, column: 9, scope: !691)
!700 = !DILocation(line: 122, column: 27, scope: !691)
!701 = !DILocation(line: 122, column: 29, scope: !691)
!702 = !DILocation(line: 122, column: 33, scope: !691)
!703 = !DILocation(line: 121, column: 20, scope: !691)
!704 = !DILocation(line: 121, column: 7, scope: !691)
!705 = distinct !{!705, !692, !706, !235}
!706 = !DILocation(line: 122, column: 79, scope: !688)
!707 = !DILocation(line: 119, column: 9, scope: !656)
!708 = !DILocation(line: 114, column: 26, scope: !654)
!709 = !DILocation(line: 114, column: 5, scope: !654)
!710 = distinct !{!710, !648, !711, !235}
!711 = !DILocation(line: 123, column: 5, scope: !649)
!712 = !DILocation(line: 113, column: 22, scope: !646)
!713 = !DILocation(line: 113, column: 3, scope: !646)
!714 = distinct !{!714, !647, !715, !235}
!715 = !DILocation(line: 124, column: 3, scope: !643)
!716 = !DILocation(line: 128, column: 1, scope: !632)
!717 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !532, file: !532, line: 139, type: !533, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!718 = !DILocalVariable(name: "r", arg: 1, scope: !717, file: !532, line: 139, type: !60)
!719 = !DILocation(line: 0, scope: !717)
!720 = !DILocalVariable(name: "a", arg: 2, scope: !717, file: !532, line: 139, type: !535)
!721 = !DILocalVariable(name: "i", scope: !717, file: !532, line: 141, type: !42)
!722 = !DILocation(line: 142, column: 7, scope: !723)
!723 = distinct !DILexicalBlock(scope: !717, file: !532, line: 142, column: 3)
!724 = !DILocation(line: 142, scope: !723)
!725 = !DILocation(line: 142, column: 12, scope: !726)
!726 = distinct !DILexicalBlock(scope: !723, file: !532, line: 142, column: 3)
!727 = !DILocation(line: 142, column: 3, scope: !723)
!728 = !DILocation(line: 143, column: 21, scope: !726)
!729 = !DILocation(line: 143, column: 19, scope: !726)
!730 = !DILocation(line: 143, column: 40, scope: !726)
!731 = !DILocation(line: 143, column: 5, scope: !726)
!732 = !DILocation(line: 142, column: 22, scope: !726)
!733 = !DILocation(line: 142, column: 3, scope: !726)
!734 = distinct !{!734, !727, !735, !235}
!735 = !DILocation(line: 143, column: 49, scope: !723)
!736 = !DILocation(line: 144, column: 1, scope: !717)
!737 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !532, file: !532, line: 156, type: !633, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!738 = !DILocalVariable(name: "r", arg: 1, scope: !737, file: !532, line: 156, type: !635)
!739 = !DILocation(line: 0, scope: !737)
!740 = !DILocalVariable(name: "a", arg: 2, scope: !737, file: !532, line: 156, type: !64)
!741 = !DILocalVariable(name: "i", scope: !737, file: !532, line: 158, type: !42)
!742 = !DILocation(line: 159, column: 7, scope: !743)
!743 = distinct !DILexicalBlock(scope: !737, file: !532, line: 159, column: 3)
!744 = !DILocation(line: 159, scope: !743)
!745 = !DILocation(line: 159, column: 12, scope: !746)
!746 = distinct !DILexicalBlock(scope: !743, file: !532, line: 159, column: 3)
!747 = !DILocation(line: 159, column: 3, scope: !743)
!748 = !DILocation(line: 160, column: 21, scope: !746)
!749 = !DILocation(line: 160, column: 35, scope: !746)
!750 = !DILocation(line: 160, column: 33, scope: !746)
!751 = !DILocation(line: 160, column: 5, scope: !746)
!752 = !DILocation(line: 159, column: 22, scope: !746)
!753 = !DILocation(line: 159, column: 3, scope: !746)
!754 = distinct !{!754, !747, !755, !235}
!755 = !DILocation(line: 160, column: 51, scope: !743)
!756 = !DILocation(line: 161, column: 1, scope: !737)
!757 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !532, file: !532, line: 170, type: !758, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!758 = !DISubroutineType(types: !759)
!759 = !{null, !635}
!760 = !DILocalVariable(name: "r", arg: 1, scope: !757, file: !532, line: 170, type: !635)
!761 = !DILocation(line: 0, scope: !757)
!762 = !DILocalVariable(name: "i", scope: !757, file: !532, line: 172, type: !42)
!763 = !DILocation(line: 173, column: 7, scope: !764)
!764 = distinct !DILexicalBlock(scope: !757, file: !532, line: 173, column: 3)
!765 = !DILocation(line: 173, scope: !764)
!766 = !DILocation(line: 173, column: 12, scope: !767)
!767 = distinct !DILexicalBlock(scope: !764, file: !532, line: 173, column: 3)
!768 = !DILocation(line: 173, column: 3, scope: !764)
!769 = !DILocation(line: 174, column: 15, scope: !767)
!770 = !DILocation(line: 174, column: 5, scope: !767)
!771 = !DILocation(line: 173, column: 22, scope: !767)
!772 = !DILocation(line: 173, column: 3, scope: !767)
!773 = distinct !{!773, !768, !774, !235}
!774 = !DILocation(line: 174, column: 24, scope: !764)
!775 = !DILocation(line: 175, column: 1, scope: !757)
!776 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !532, file: !532, line: 185, type: !758, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!777 = !DILocalVariable(name: "r", arg: 1, scope: !776, file: !532, line: 185, type: !635)
!778 = !DILocation(line: 0, scope: !776)
!779 = !DILocalVariable(name: "i", scope: !776, file: !532, line: 187, type: !42)
!780 = !DILocation(line: 188, column: 7, scope: !781)
!781 = distinct !DILexicalBlock(scope: !776, file: !532, line: 188, column: 3)
!782 = !DILocation(line: 188, scope: !781)
!783 = !DILocation(line: 188, column: 12, scope: !784)
!784 = distinct !DILexicalBlock(scope: !781, file: !532, line: 188, column: 3)
!785 = !DILocation(line: 188, column: 3, scope: !781)
!786 = !DILocation(line: 189, column: 25, scope: !784)
!787 = !DILocation(line: 189, column: 5, scope: !784)
!788 = !DILocation(line: 188, column: 22, scope: !784)
!789 = !DILocation(line: 188, column: 3, scope: !784)
!790 = distinct !{!790, !785, !791, !235}
!791 = !DILocation(line: 189, column: 34, scope: !781)
!792 = !DILocation(line: 190, column: 1, scope: !776)
!793 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !532, file: !532, line: 202, type: !794, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!794 = !DISubroutineType(types: !795)
!795 = !{null, !796, !535, !535}
!796 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !542, size: 32)
!797 = !DILocalVariable(name: "r", arg: 1, scope: !793, file: !532, line: 202, type: !796)
!798 = !DILocation(line: 0, scope: !793)
!799 = !DILocalVariable(name: "a", arg: 2, scope: !793, file: !532, line: 202, type: !535)
!800 = !DILocalVariable(name: "b", arg: 3, scope: !793, file: !532, line: 202, type: !535)
!801 = !DILocalVariable(name: "t", scope: !793, file: !532, line: 205, type: !542)
!802 = !DILocation(line: 205, column: 8, scope: !793)
!803 = !DILocation(line: 207, column: 3, scope: !793)
!804 = !DILocalVariable(name: "i", scope: !793, file: !532, line: 204, type: !42)
!805 = !DILocation(line: 208, column: 7, scope: !806)
!806 = distinct !DILexicalBlock(scope: !793, file: !532, line: 208, column: 3)
!807 = !DILocation(line: 208, scope: !806)
!808 = !DILocation(line: 208, column: 12, scope: !809)
!809 = distinct !DILexicalBlock(scope: !806, file: !532, line: 208, column: 3)
!810 = !DILocation(line: 208, column: 3, scope: !806)
!811 = !DILocation(line: 209, column: 34, scope: !812)
!812 = distinct !DILexicalBlock(scope: !809, file: !532, line: 208, column: 26)
!813 = !DILocation(line: 209, column: 46, scope: !812)
!814 = !DILocation(line: 209, column: 5, scope: !812)
!815 = !DILocation(line: 210, column: 5, scope: !812)
!816 = !DILocation(line: 208, column: 22, scope: !809)
!817 = !DILocation(line: 208, column: 3, scope: !809)
!818 = distinct !{!818, !810, !819, !235}
!819 = !DILocation(line: 211, column: 3, scope: !806)
!820 = !DILocation(line: 213, column: 3, scope: !793)
!821 = !DILocation(line: 214, column: 1, scope: !793)
!822 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !532, file: !532, line: 225, type: !758, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!823 = !DILocalVariable(name: "r", arg: 1, scope: !822, file: !532, line: 225, type: !635)
!824 = !DILocation(line: 0, scope: !822)
!825 = !DILocalVariable(name: "i", scope: !822, file: !532, line: 227, type: !42)
!826 = !DILocation(line: 228, column: 7, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !532, line: 228, column: 3)
!828 = !DILocation(line: 228, scope: !827)
!829 = !DILocation(line: 228, column: 12, scope: !830)
!830 = distinct !DILexicalBlock(scope: !827, file: !532, line: 228, column: 3)
!831 = !DILocation(line: 228, column: 3, scope: !827)
!832 = !DILocation(line: 229, column: 18, scope: !830)
!833 = !DILocation(line: 229, column: 5, scope: !830)
!834 = !DILocation(line: 228, column: 22, scope: !830)
!835 = !DILocation(line: 228, column: 3, scope: !830)
!836 = distinct !{!836, !831, !837, !235}
!837 = !DILocation(line: 229, column: 27, scope: !827)
!838 = !DILocation(line: 230, column: 1, scope: !822)
!839 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !532, file: !532, line: 241, type: !840, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!840 = !DISubroutineType(types: !841)
!841 = !{null, !635, !535, !535}
!842 = !DILocalVariable(name: "r", arg: 1, scope: !839, file: !532, line: 241, type: !635)
!843 = !DILocation(line: 0, scope: !839)
!844 = !DILocalVariable(name: "a", arg: 2, scope: !839, file: !532, line: 241, type: !535)
!845 = !DILocalVariable(name: "b", arg: 3, scope: !839, file: !532, line: 241, type: !535)
!846 = !DILocalVariable(name: "i", scope: !839, file: !532, line: 243, type: !42)
!847 = !DILocation(line: 244, column: 7, scope: !848)
!848 = distinct !DILexicalBlock(scope: !839, file: !532, line: 244, column: 3)
!849 = !DILocation(line: 244, scope: !848)
!850 = !DILocation(line: 244, column: 12, scope: !851)
!851 = distinct !DILexicalBlock(scope: !848, file: !532, line: 244, column: 3)
!852 = !DILocation(line: 244, column: 3, scope: !848)
!853 = !DILocation(line: 245, column: 15, scope: !851)
!854 = !DILocation(line: 245, column: 27, scope: !851)
!855 = !DILocation(line: 245, column: 39, scope: !851)
!856 = !DILocation(line: 245, column: 5, scope: !851)
!857 = !DILocation(line: 244, column: 22, scope: !851)
!858 = !DILocation(line: 244, column: 3, scope: !851)
!859 = distinct !{!859, !852, !860, !235}
!860 = !DILocation(line: 245, column: 48, scope: !848)
!861 = !DILocation(line: 246, column: 1, scope: !839)
!862 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !863, file: !863, line: 19, type: !864, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!863 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!864 = !DISubroutineType(types: !865)
!865 = !{null, !60, !866}
!866 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !867, size: 32)
!867 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !868)
!868 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !869)
!869 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !870)
!870 = !{!871}
!871 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !869, file: !168, line: 12, baseType: !172, size: 4096)
!872 = !DILocalVariable(name: "r", arg: 1, scope: !862, file: !863, line: 19, type: !60)
!873 = !DILocation(line: 0, scope: !862)
!874 = !DILocalVariable(name: "a", arg: 2, scope: !862, file: !863, line: 19, type: !866)
!875 = !DILocalVariable(name: "t", scope: !862, file: !863, line: 24, type: !876)
!876 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !877)
!877 = !{!878}
!878 = !DISubrange(count: 8)
!879 = !DILocation(line: 24, column: 11, scope: !862)
!880 = !DILocalVariable(name: "i", scope: !862, file: !863, line: 21, type: !42)
!881 = !DILocation(line: 28, column: 7, scope: !882)
!882 = distinct !DILexicalBlock(scope: !862, file: !863, line: 28, column: 3)
!883 = !DILocation(line: 28, scope: !882)
!884 = !DILocation(line: 28, column: 12, scope: !885)
!885 = distinct !DILexicalBlock(scope: !882, file: !863, line: 28, column: 3)
!886 = !DILocation(line: 28, column: 3, scope: !882)
!887 = !DILocation(line: 29, column: 5, scope: !888)
!888 = distinct !DILexicalBlock(scope: !889, file: !863, line: 29, column: 5)
!889 = distinct !DILexicalBlock(scope: !885, file: !863, line: 28, column: 28)
!890 = !DILocation(line: 29, scope: !888)
!891 = !DILocalVariable(name: "j", scope: !862, file: !863, line: 21, type: !42)
!892 = !DILocation(line: 29, column: 14, scope: !893)
!893 = distinct !DILexicalBlock(scope: !888, file: !863, line: 29, column: 5)
!894 = !DILocation(line: 31, column: 23, scope: !895)
!895 = distinct !DILexicalBlock(scope: !893, file: !863, line: 29, column: 22)
!896 = !DILocation(line: 31, column: 25, scope: !895)
!897 = !DILocation(line: 31, column: 12, scope: !895)
!898 = !DILocalVariable(name: "u", scope: !862, file: !863, line: 22, type: !14)
!899 = !DILocation(line: 32, column: 22, scope: !895)
!900 = !DILocation(line: 32, column: 9, scope: !895)
!901 = !DILocation(line: 34, column: 12, scope: !895)
!902 = !DILocalVariable(name: "d0", scope: !862, file: !863, line: 23, type: !40)
!903 = !DILocation(line: 36, column: 10, scope: !895)
!904 = !DILocation(line: 37, column: 10, scope: !895)
!905 = !DILocation(line: 38, column: 14, scope: !895)
!906 = !DILocation(line: 38, column: 7, scope: !895)
!907 = !DILocation(line: 38, column: 12, scope: !895)
!908 = !DILocation(line: 29, column: 18, scope: !893)
!909 = !DILocation(line: 29, column: 5, scope: !893)
!910 = distinct !{!910, !887, !911, !235}
!911 = !DILocation(line: 39, column: 5, scope: !888)
!912 = !DILocation(line: 41, column: 12, scope: !889)
!913 = !DILocation(line: 41, column: 20, scope: !889)
!914 = !DILocation(line: 41, column: 25, scope: !889)
!915 = !DILocation(line: 41, column: 17, scope: !889)
!916 = !DILocation(line: 41, column: 10, scope: !889)
!917 = !DILocation(line: 42, column: 12, scope: !889)
!918 = !DILocation(line: 42, column: 20, scope: !889)
!919 = !DILocation(line: 42, column: 25, scope: !889)
!920 = !DILocation(line: 42, column: 17, scope: !889)
!921 = !DILocation(line: 42, column: 5, scope: !889)
!922 = !DILocation(line: 42, column: 10, scope: !889)
!923 = !DILocation(line: 43, column: 12, scope: !889)
!924 = !DILocation(line: 43, column: 20, scope: !889)
!925 = !DILocation(line: 43, column: 25, scope: !889)
!926 = !DILocation(line: 43, column: 17, scope: !889)
!927 = !DILocation(line: 43, column: 5, scope: !889)
!928 = !DILocation(line: 43, column: 10, scope: !889)
!929 = !DILocation(line: 44, column: 12, scope: !889)
!930 = !DILocation(line: 44, column: 20, scope: !889)
!931 = !DILocation(line: 44, column: 25, scope: !889)
!932 = !DILocation(line: 44, column: 17, scope: !889)
!933 = !DILocation(line: 44, column: 5, scope: !889)
!934 = !DILocation(line: 44, column: 10, scope: !889)
!935 = !DILocation(line: 45, column: 7, scope: !889)
!936 = !DILocation(line: 28, column: 24, scope: !885)
!937 = !DILocation(line: 28, column: 3, scope: !885)
!938 = distinct !{!938, !886, !939, !235}
!939 = !DILocation(line: 46, column: 3, scope: !882)
!940 = !DILocation(line: 71, column: 1, scope: !862)
!941 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !863, file: !863, line: 83, type: !942, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!942 = !DISubroutineType(types: !943)
!943 = !{null, !944, !64}
!944 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !868, size: 32)
!945 = !DILocalVariable(name: "r", arg: 1, scope: !941, file: !863, line: 83, type: !944)
!946 = !DILocation(line: 0, scope: !941)
!947 = !DILocalVariable(name: "a", arg: 2, scope: !941, file: !863, line: 83, type: !64)
!948 = !DILocalVariable(name: "i", scope: !941, file: !863, line: 85, type: !42)
!949 = !DILocation(line: 88, column: 7, scope: !950)
!950 = distinct !DILexicalBlock(scope: !941, file: !863, line: 88, column: 3)
!951 = !DILocation(line: 88, scope: !950)
!952 = !DILocation(line: 88, column: 12, scope: !953)
!953 = distinct !DILexicalBlock(scope: !950, file: !863, line: 88, column: 3)
!954 = !DILocation(line: 88, column: 3, scope: !950)
!955 = !DILocation(line: 89, column: 37, scope: !956)
!956 = distinct !DILexicalBlock(scope: !953, file: !863, line: 88, column: 28)
!957 = !DILocation(line: 89, column: 42, scope: !956)
!958 = !DILocation(line: 89, column: 26, scope: !956)
!959 = !DILocation(line: 89, column: 47, scope: !956)
!960 = !DILocation(line: 89, column: 57, scope: !956)
!961 = !DILocation(line: 89, column: 62, scope: !956)
!962 = !DILocation(line: 89, column: 24, scope: !956)
!963 = !DILocation(line: 89, column: 16, scope: !956)
!964 = !DILocation(line: 89, column: 5, scope: !956)
!965 = !DILocation(line: 89, column: 22, scope: !956)
!966 = !DILocation(line: 90, column: 37, scope: !956)
!967 = !DILocation(line: 90, column: 42, scope: !956)
!968 = !DILocation(line: 90, column: 26, scope: !956)
!969 = !DILocation(line: 90, column: 47, scope: !956)
!970 = !DILocation(line: 90, column: 57, scope: !956)
!971 = !DILocation(line: 90, column: 62, scope: !956)
!972 = !DILocation(line: 90, column: 24, scope: !956)
!973 = !DILocation(line: 90, column: 16, scope: !956)
!974 = !DILocation(line: 90, column: 18, scope: !956)
!975 = !DILocation(line: 90, column: 5, scope: !956)
!976 = !DILocation(line: 90, column: 22, scope: !956)
!977 = !DILocation(line: 91, column: 7, scope: !956)
!978 = !DILocation(line: 88, column: 24, scope: !953)
!979 = !DILocation(line: 88, column: 3, scope: !953)
!980 = distinct !{!980, !954, !981, !235}
!981 = !DILocation(line: 92, column: 3, scope: !950)
!982 = !DILocation(line: 113, column: 1, scope: !941)
!983 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !863, file: !863, line: 124, type: !864, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!984 = !DILocalVariable(name: "r", arg: 1, scope: !983, file: !863, line: 124, type: !60)
!985 = !DILocation(line: 0, scope: !983)
!986 = !DILocalVariable(name: "a", arg: 2, scope: !983, file: !863, line: 124, type: !866)
!987 = !DILocalVariable(name: "i", scope: !983, file: !863, line: 126, type: !42)
!988 = !DILocation(line: 129, column: 7, scope: !989)
!989 = distinct !DILexicalBlock(scope: !983, file: !863, line: 129, column: 3)
!990 = !DILocation(line: 129, scope: !989)
!991 = !DILocation(line: 129, column: 12, scope: !992)
!992 = distinct !DILexicalBlock(scope: !989, file: !863, line: 129, column: 3)
!993 = !DILocation(line: 129, column: 3, scope: !989)
!994 = !DILocation(line: 131, column: 22, scope: !995)
!995 = distinct !DILexicalBlock(scope: !992, file: !863, line: 129, column: 28)
!996 = !DILocation(line: 131, column: 11, scope: !995)
!997 = !DILocalVariable(name: "t0", scope: !983, file: !863, line: 127, type: !35)
!998 = !DILocation(line: 132, column: 31, scope: !995)
!999 = !DILocation(line: 132, column: 8, scope: !995)
!1000 = !DILocation(line: 133, column: 21, scope: !995)
!1001 = !DILocation(line: 133, column: 23, scope: !995)
!1002 = !DILocation(line: 133, column: 10, scope: !995)
!1003 = !DILocalVariable(name: "t1", scope: !983, file: !863, line: 127, type: !35)
!1004 = !DILocation(line: 134, column: 31, scope: !995)
!1005 = !DILocation(line: 134, column: 8, scope: !995)
!1006 = !DILocation(line: 135, column: 16, scope: !995)
!1007 = !DILocation(line: 135, column: 8, scope: !995)
!1008 = !DILocation(line: 135, column: 5, scope: !995)
!1009 = !DILocation(line: 135, column: 14, scope: !995)
!1010 = !DILocation(line: 136, column: 20, scope: !995)
!1011 = !DILocation(line: 136, column: 29, scope: !995)
!1012 = !DILocation(line: 136, column: 32, scope: !995)
!1013 = !DILocation(line: 136, column: 26, scope: !995)
!1014 = !DILocation(line: 136, column: 8, scope: !995)
!1015 = !DILocation(line: 136, column: 5, scope: !995)
!1016 = !DILocation(line: 136, column: 14, scope: !995)
!1017 = !DILocation(line: 137, column: 20, scope: !995)
!1018 = !DILocation(line: 137, column: 16, scope: !995)
!1019 = !DILocation(line: 137, column: 8, scope: !995)
!1020 = !DILocation(line: 137, column: 5, scope: !995)
!1021 = !DILocation(line: 137, column: 14, scope: !995)
!1022 = !DILocation(line: 129, column: 24, scope: !992)
!1023 = !DILocation(line: 129, column: 3, scope: !992)
!1024 = distinct !{!1024, !993, !1025, !235}
!1025 = !DILocation(line: 138, column: 3, scope: !989)
!1026 = !DILocation(line: 139, column: 1, scope: !983)
!1027 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !863, file: !863, line: 151, type: !942, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1028 = !DILocalVariable(name: "r", arg: 1, scope: !1027, file: !863, line: 151, type: !944)
!1029 = !DILocation(line: 0, scope: !1027)
!1030 = !DILocalVariable(name: "a", arg: 2, scope: !1027, file: !863, line: 151, type: !64)
!1031 = !DILocalVariable(name: "i", scope: !1027, file: !863, line: 153, type: !42)
!1032 = !DILocation(line: 154, column: 7, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1027, file: !863, line: 154, column: 3)
!1034 = !DILocation(line: 154, scope: !1033)
!1035 = !DILocation(line: 154, column: 12, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1033, file: !863, line: 154, column: 3)
!1037 = !DILocation(line: 154, column: 3, scope: !1033)
!1038 = !DILocation(line: 155, column: 29, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1036, file: !863, line: 154, column: 28)
!1040 = !DILocation(line: 155, column: 26, scope: !1039)
!1041 = !DILocation(line: 155, column: 57, scope: !1039)
!1042 = !DILocation(line: 155, column: 54, scope: !1039)
!1043 = !DILocation(line: 155, column: 44, scope: !1039)
!1044 = !DILocation(line: 155, column: 63, scope: !1039)
!1045 = !DILocation(line: 155, column: 70, scope: !1039)
!1046 = !DILocation(line: 155, column: 16, scope: !1039)
!1047 = !DILocation(line: 155, column: 5, scope: !1039)
!1048 = !DILocation(line: 155, column: 22, scope: !1039)
!1049 = !DILocation(line: 156, column: 29, scope: !1039)
!1050 = !DILocation(line: 156, column: 26, scope: !1039)
!1051 = !DILocation(line: 156, column: 35, scope: !1039)
!1052 = !DILocation(line: 156, column: 57, scope: !1039)
!1053 = !DILocation(line: 156, column: 54, scope: !1039)
!1054 = !DILocation(line: 156, column: 44, scope: !1039)
!1055 = !DILocation(line: 156, column: 63, scope: !1039)
!1056 = !DILocation(line: 156, column: 41, scope: !1039)
!1057 = !DILocation(line: 156, column: 16, scope: !1039)
!1058 = !DILocation(line: 156, column: 18, scope: !1039)
!1059 = !DILocation(line: 156, column: 5, scope: !1039)
!1060 = !DILocation(line: 156, column: 22, scope: !1039)
!1061 = !DILocation(line: 154, column: 24, scope: !1036)
!1062 = !DILocation(line: 154, column: 3, scope: !1036)
!1063 = distinct !{!1063, !1037, !1064, !235}
!1064 = !DILocation(line: 157, column: 3, scope: !1033)
!1065 = !DILocation(line: 158, column: 1, scope: !1027)
!1066 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !863, file: !863, line: 168, type: !942, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1067 = !DILocalVariable(name: "r", arg: 1, scope: !1066, file: !863, line: 168, type: !944)
!1068 = !DILocation(line: 0, scope: !1066)
!1069 = !DILocalVariable(name: "msg", arg: 2, scope: !1066, file: !863, line: 168, type: !64)
!1070 = !DILocalVariable(name: "i", scope: !1066, file: !863, line: 170, type: !42)
!1071 = !DILocation(line: 176, column: 7, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1066, file: !863, line: 176, column: 3)
!1073 = !DILocation(line: 176, scope: !1072)
!1074 = !DILocation(line: 176, column: 12, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1072, file: !863, line: 176, column: 3)
!1076 = !DILocation(line: 176, column: 3, scope: !1072)
!1077 = !DILocation(line: 177, column: 5, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1079, file: !863, line: 177, column: 5)
!1079 = distinct !DILexicalBlock(scope: !1075, file: !863, line: 176, column: 28)
!1080 = !DILocation(line: 177, scope: !1078)
!1081 = !DILocalVariable(name: "j", scope: !1066, file: !863, line: 170, type: !42)
!1082 = !DILocation(line: 177, column: 14, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1078, file: !863, line: 177, column: 5)
!1084 = !DILocation(line: 178, column: 18, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1083, file: !863, line: 177, column: 22)
!1086 = !DILocation(line: 178, column: 20, scope: !1085)
!1087 = !DILocation(line: 178, column: 7, scope: !1085)
!1088 = !DILocation(line: 178, column: 24, scope: !1085)
!1089 = !DILocation(line: 179, column: 27, scope: !1085)
!1090 = !DILocation(line: 179, column: 31, scope: !1085)
!1091 = !DILocation(line: 179, column: 53, scope: !1085)
!1092 = !DILocation(line: 179, column: 60, scope: !1085)
!1093 = !DILocation(line: 179, column: 52, scope: !1085)
!1094 = !DILocation(line: 179, column: 7, scope: !1085)
!1095 = !DILocation(line: 177, column: 18, scope: !1083)
!1096 = !DILocation(line: 177, column: 5, scope: !1083)
!1097 = distinct !{!1097, !1077, !1098, !235}
!1098 = !DILocation(line: 180, column: 5, scope: !1078)
!1099 = !DILocation(line: 176, column: 24, scope: !1075)
!1100 = !DILocation(line: 176, column: 3, scope: !1075)
!1101 = distinct !{!1101, !1076, !1102, !235}
!1102 = !DILocation(line: 181, column: 3, scope: !1072)
!1103 = !DILocation(line: 182, column: 1, scope: !1066)
!1104 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !863, file: !863, line: 192, type: !864, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1105 = !DILocalVariable(name: "msg", arg: 1, scope: !1104, file: !863, line: 192, type: !60)
!1106 = !DILocation(line: 0, scope: !1104)
!1107 = !DILocalVariable(name: "a", arg: 2, scope: !1104, file: !863, line: 192, type: !866)
!1108 = !DILocalVariable(name: "i", scope: !1104, file: !863, line: 194, type: !42)
!1109 = !DILocation(line: 197, column: 7, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1104, file: !863, line: 197, column: 3)
!1111 = !DILocation(line: 197, scope: !1110)
!1112 = !DILocation(line: 197, column: 12, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1110, file: !863, line: 197, column: 3)
!1114 = !DILocation(line: 197, column: 3, scope: !1110)
!1115 = !DILocation(line: 198, column: 5, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1113, file: !863, line: 197, column: 28)
!1117 = !DILocation(line: 198, column: 12, scope: !1116)
!1118 = !DILocalVariable(name: "j", scope: !1104, file: !863, line: 194, type: !42)
!1119 = !DILocation(line: 199, column: 9, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1116, file: !863, line: 199, column: 5)
!1121 = !DILocation(line: 199, scope: !1120)
!1122 = !DILocation(line: 199, column: 14, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1120, file: !863, line: 199, column: 5)
!1124 = !DILocation(line: 199, column: 5, scope: !1120)
!1125 = !DILocation(line: 200, column: 23, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1123, file: !863, line: 199, column: 22)
!1127 = !DILocation(line: 200, column: 25, scope: !1126)
!1128 = !DILocation(line: 200, column: 12, scope: !1126)
!1129 = !DILocalVariable(name: "t", scope: !1104, file: !863, line: 195, type: !40)
!1130 = !DILocation(line: 205, column: 9, scope: !1126)
!1131 = !DILocation(line: 206, column: 9, scope: !1126)
!1132 = !DILocation(line: 207, column: 9, scope: !1126)
!1133 = !DILocation(line: 208, column: 19, scope: !1126)
!1134 = !DILocation(line: 208, column: 7, scope: !1126)
!1135 = !DILocation(line: 208, column: 14, scope: !1126)
!1136 = !DILocation(line: 199, column: 18, scope: !1123)
!1137 = !DILocation(line: 199, column: 5, scope: !1123)
!1138 = distinct !{!1138, !1124, !1139, !235}
!1139 = !DILocation(line: 209, column: 5, scope: !1120)
!1140 = !DILocation(line: 197, column: 24, scope: !1113)
!1141 = !DILocation(line: 197, column: 3, scope: !1113)
!1142 = distinct !{!1142, !1114, !1143, !235}
!1143 = !DILocation(line: 210, column: 3, scope: !1110)
!1144 = !DILocation(line: 211, column: 1, scope: !1104)
!1145 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !863, file: !863, line: 225, type: !1146, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{null, !944, !64, !61}
!1148 = !DILocalVariable(name: "r", arg: 1, scope: !1145, file: !863, line: 225, type: !944)
!1149 = !DILocation(line: 0, scope: !1145)
!1150 = !DILocalVariable(name: "seed", arg: 2, scope: !1145, file: !863, line: 225, type: !64)
!1151 = !DILocalVariable(name: "nonce", arg: 3, scope: !1145, file: !863, line: 225, type: !61)
!1152 = !DILocalVariable(name: "buf", scope: !1145, file: !863, line: 227, type: !1153)
!1153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1536, elements: !1154)
!1154 = !{!1155}
!1155 = !DISubrange(count: 192)
!1156 = !DILocation(line: 227, column: 11, scope: !1145)
!1157 = !DILocation(line: 228, column: 3, scope: !1145)
!1158 = !DILocation(line: 229, column: 3, scope: !1145)
!1159 = !DILocation(line: 230, column: 1, scope: !1145)
!1160 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !863, file: !863, line: 244, type: !1146, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1161 = !DILocalVariable(name: "r", arg: 1, scope: !1160, file: !863, line: 244, type: !944)
!1162 = !DILocation(line: 0, scope: !1160)
!1163 = !DILocalVariable(name: "seed", arg: 2, scope: !1160, file: !863, line: 244, type: !64)
!1164 = !DILocalVariable(name: "nonce", arg: 3, scope: !1160, file: !863, line: 244, type: !61)
!1165 = !DILocalVariable(name: "buf", scope: !1160, file: !863, line: 246, type: !1166)
!1166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1167 = !DILocation(line: 246, column: 11, scope: !1160)
!1168 = !DILocation(line: 247, column: 3, scope: !1160)
!1169 = !DILocation(line: 248, column: 3, scope: !1160)
!1170 = !DILocation(line: 249, column: 1, scope: !1160)
!1171 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !863, file: !863, line: 261, type: !1172, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{null, !944}
!1174 = !DILocalVariable(name: "r", arg: 1, scope: !1171, file: !863, line: 261, type: !944)
!1175 = !DILocation(line: 0, scope: !1171)
!1176 = !DILocation(line: 263, column: 3, scope: !1171)
!1177 = !DILocation(line: 264, column: 3, scope: !1171)
!1178 = !DILocation(line: 265, column: 1, scope: !1171)
!1179 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !863, file: !863, line: 323, type: !1172, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1180 = !DILocalVariable(name: "r", arg: 1, scope: !1179, file: !863, line: 323, type: !944)
!1181 = !DILocation(line: 0, scope: !1179)
!1182 = !DILocalVariable(name: "i", scope: !1179, file: !863, line: 325, type: !42)
!1183 = !DILocation(line: 326, column: 7, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1179, file: !863, line: 326, column: 3)
!1185 = !DILocation(line: 326, scope: !1184)
!1186 = !DILocation(line: 326, column: 12, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1184, file: !863, line: 326, column: 3)
!1188 = !DILocation(line: 326, column: 3, scope: !1184)
!1189 = !DILocation(line: 327, column: 35, scope: !1187)
!1190 = !DILocation(line: 327, column: 20, scope: !1187)
!1191 = !DILocation(line: 327, column: 5, scope: !1187)
!1192 = !DILocation(line: 327, column: 18, scope: !1187)
!1193 = !DILocation(line: 326, column: 22, scope: !1187)
!1194 = !DILocation(line: 326, column: 3, scope: !1187)
!1195 = distinct !{!1195, !1188, !1196, !235}
!1196 = !DILocation(line: 327, column: 47, scope: !1184)
!1197 = !DILocation(line: 328, column: 1, scope: !1179)
!1198 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !863, file: !863, line: 276, type: !1172, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1199 = !DILocalVariable(name: "r", arg: 1, scope: !1198, file: !863, line: 276, type: !944)
!1200 = !DILocation(line: 0, scope: !1198)
!1201 = !DILocation(line: 278, column: 3, scope: !1198)
!1202 = !DILocation(line: 279, column: 1, scope: !1198)
!1203 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !863, file: !863, line: 290, type: !1204, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{null, !944, !866, !866}
!1206 = !DILocalVariable(name: "r", arg: 1, scope: !1203, file: !863, line: 290, type: !944)
!1207 = !DILocation(line: 0, scope: !1203)
!1208 = !DILocalVariable(name: "a", arg: 2, scope: !1203, file: !863, line: 290, type: !866)
!1209 = !DILocalVariable(name: "b", arg: 3, scope: !1203, file: !863, line: 290, type: !866)
!1210 = !DILocalVariable(name: "i", scope: !1203, file: !863, line: 292, type: !42)
!1211 = !DILocation(line: 293, column: 7, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1203, file: !863, line: 293, column: 3)
!1213 = !DILocation(line: 293, scope: !1212)
!1214 = !DILocation(line: 293, column: 12, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1212, file: !863, line: 293, column: 3)
!1216 = !DILocation(line: 293, column: 3, scope: !1212)
!1217 = !DILocation(line: 294, column: 25, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1215, file: !863, line: 293, column: 28)
!1219 = !DILocation(line: 294, column: 14, scope: !1218)
!1220 = !DILocation(line: 294, column: 42, scope: !1218)
!1221 = !DILocation(line: 294, column: 31, scope: !1218)
!1222 = !DILocation(line: 294, column: 59, scope: !1218)
!1223 = !DILocation(line: 294, column: 48, scope: !1218)
!1224 = !DILocation(line: 294, column: 72, scope: !1218)
!1225 = !DILocation(line: 294, column: 64, scope: !1218)
!1226 = !DILocation(line: 294, column: 5, scope: !1218)
!1227 = !DILocation(line: 295, column: 25, scope: !1218)
!1228 = !DILocation(line: 295, column: 27, scope: !1218)
!1229 = !DILocation(line: 295, column: 14, scope: !1218)
!1230 = !DILocation(line: 295, column: 44, scope: !1218)
!1231 = !DILocation(line: 295, column: 46, scope: !1218)
!1232 = !DILocation(line: 295, column: 33, scope: !1218)
!1233 = !DILocation(line: 295, column: 63, scope: !1218)
!1234 = !DILocation(line: 295, column: 65, scope: !1218)
!1235 = !DILocation(line: 295, column: 52, scope: !1218)
!1236 = !DILocation(line: 295, column: 79, scope: !1218)
!1237 = !DILocation(line: 295, column: 71, scope: !1218)
!1238 = !DILocation(line: 295, column: 70, scope: !1218)
!1239 = !DILocation(line: 295, column: 5, scope: !1218)
!1240 = !DILocation(line: 293, column: 24, scope: !1215)
!1241 = !DILocation(line: 293, column: 3, scope: !1215)
!1242 = distinct !{!1242, !1216, !1243, !235}
!1243 = !DILocation(line: 296, column: 3, scope: !1212)
!1244 = !DILocation(line: 297, column: 1, scope: !1203)
!1245 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !863, file: !863, line: 307, type: !1172, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1246 = !DILocalVariable(name: "r", arg: 1, scope: !1245, file: !863, line: 307, type: !944)
!1247 = !DILocation(line: 0, scope: !1245)
!1248 = !DILocalVariable(name: "f", scope: !1245, file: !863, line: 310, type: !13)
!1249 = !DILocalVariable(name: "i", scope: !1245, file: !863, line: 309, type: !42)
!1250 = !DILocation(line: 311, column: 7, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1245, file: !863, line: 311, column: 3)
!1252 = !DILocation(line: 311, scope: !1251)
!1253 = !DILocation(line: 311, column: 12, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1251, file: !863, line: 311, column: 3)
!1255 = !DILocation(line: 311, column: 3, scope: !1251)
!1256 = !DILocation(line: 312, column: 47, scope: !1254)
!1257 = !DILocation(line: 312, column: 38, scope: !1254)
!1258 = !DILocation(line: 312, column: 59, scope: !1254)
!1259 = !DILocation(line: 312, column: 20, scope: !1254)
!1260 = !DILocation(line: 312, column: 5, scope: !1254)
!1261 = !DILocation(line: 312, column: 18, scope: !1254)
!1262 = !DILocation(line: 311, column: 22, scope: !1254)
!1263 = !DILocation(line: 311, column: 3, scope: !1254)
!1264 = distinct !{!1264, !1255, !1265, !235}
!1265 = !DILocation(line: 312, column: 61, scope: !1251)
!1266 = !DILocation(line: 313, column: 1, scope: !1245)
!1267 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !863, file: !863, line: 339, type: !1204, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1268 = !DILocalVariable(name: "r", arg: 1, scope: !1267, file: !863, line: 339, type: !944)
!1269 = !DILocation(line: 0, scope: !1267)
!1270 = !DILocalVariable(name: "a", arg: 2, scope: !1267, file: !863, line: 339, type: !866)
!1271 = !DILocalVariable(name: "b", arg: 3, scope: !1267, file: !863, line: 339, type: !866)
!1272 = !DILocalVariable(name: "i", scope: !1267, file: !863, line: 341, type: !42)
!1273 = !DILocation(line: 342, column: 7, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1267, file: !863, line: 342, column: 3)
!1275 = !DILocation(line: 342, scope: !1274)
!1276 = !DILocation(line: 342, column: 12, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1274, file: !863, line: 342, column: 3)
!1278 = !DILocation(line: 342, column: 3, scope: !1274)
!1279 = !DILocation(line: 343, column: 20, scope: !1277)
!1280 = !DILocation(line: 343, column: 35, scope: !1277)
!1281 = !DILocation(line: 343, column: 33, scope: !1277)
!1282 = !DILocation(line: 343, column: 5, scope: !1277)
!1283 = !DILocation(line: 343, column: 18, scope: !1277)
!1284 = !DILocation(line: 342, column: 22, scope: !1277)
!1285 = !DILocation(line: 342, column: 3, scope: !1277)
!1286 = distinct !{!1286, !1278, !1287, !235}
!1287 = !DILocation(line: 343, column: 46, scope: !1274)
!1288 = !DILocation(line: 344, column: 1, scope: !1267)
!1289 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !863, file: !863, line: 355, type: !1204, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1290 = !DILocalVariable(name: "r", arg: 1, scope: !1289, file: !863, line: 355, type: !944)
!1291 = !DILocation(line: 0, scope: !1289)
!1292 = !DILocalVariable(name: "a", arg: 2, scope: !1289, file: !863, line: 355, type: !866)
!1293 = !DILocalVariable(name: "b", arg: 3, scope: !1289, file: !863, line: 355, type: !866)
!1294 = !DILocalVariable(name: "i", scope: !1289, file: !863, line: 357, type: !42)
!1295 = !DILocation(line: 358, column: 7, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1289, file: !863, line: 358, column: 3)
!1297 = !DILocation(line: 358, scope: !1296)
!1298 = !DILocation(line: 358, column: 12, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1296, file: !863, line: 358, column: 3)
!1300 = !DILocation(line: 358, column: 3, scope: !1296)
!1301 = !DILocation(line: 359, column: 20, scope: !1299)
!1302 = !DILocation(line: 359, column: 35, scope: !1299)
!1303 = !DILocation(line: 359, column: 33, scope: !1299)
!1304 = !DILocation(line: 359, column: 5, scope: !1299)
!1305 = !DILocation(line: 359, column: 18, scope: !1299)
!1306 = !DILocation(line: 358, column: 22, scope: !1299)
!1307 = !DILocation(line: 358, column: 3, scope: !1299)
!1308 = distinct !{!1308, !1300, !1309, !235}
!1309 = !DILocation(line: 359, column: 46, scope: !1296)
!1310 = !DILocation(line: 360, column: 1, scope: !1289)
!1311 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !11, file: !11, line: 80, type: !1312, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{null, !248}
!1314 = !DILocalVariable(name: "r", arg: 1, scope: !1311, file: !11, line: 80, type: !248)
!1315 = !DILocation(line: 0, scope: !1311)
!1316 = !DILocalVariable(name: "k", scope: !1311, file: !11, line: 81, type: !42)
!1317 = !DILocalVariable(name: "len", scope: !1311, file: !11, line: 81, type: !42)
!1318 = !DILocation(line: 85, column: 7, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1311, file: !11, line: 85, column: 3)
!1320 = !DILocation(line: 85, scope: !1319)
!1321 = !DILocation(line: 84, column: 5, scope: !1311)
!1322 = !DILocation(line: 85, column: 22, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1319, file: !11, line: 85, column: 3)
!1324 = !DILocation(line: 85, column: 3, scope: !1319)
!1325 = !DILocation(line: 86, column: 5, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1327, file: !11, line: 86, column: 5)
!1327 = distinct !DILexicalBlock(scope: !1323, file: !11, line: 85, column: 39)
!1328 = !DILocation(line: 86, scope: !1326)
!1329 = !DILocalVariable(name: "start", scope: !1311, file: !11, line: 81, type: !42)
!1330 = !DILocation(line: 86, column: 26, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1326, file: !11, line: 86, column: 5)
!1332 = !DILocation(line: 87, column: 14, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1331, file: !11, line: 86, column: 50)
!1334 = !DILocalVariable(name: "zeta", scope: !1311, file: !11, line: 82, type: !14)
!1335 = !DILocalVariable(name: "j", scope: !1311, file: !11, line: 81, type: !42)
!1336 = !DILocation(line: 88, column: 11, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1333, file: !11, line: 88, column: 7)
!1338 = !DILocation(line: 88, scope: !1337)
!1339 = !DILocation(line: 88, column: 32, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1337, file: !11, line: 88, column: 7)
!1341 = !DILocation(line: 88, column: 24, scope: !1340)
!1342 = !DILocation(line: 88, column: 7, scope: !1337)
!1343 = !DILocation(line: 89, column: 25, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1340, file: !11, line: 88, column: 44)
!1345 = !DILocation(line: 89, column: 13, scope: !1344)
!1346 = !DILocalVariable(name: "t", scope: !1311, file: !11, line: 82, type: !14)
!1347 = !DILocation(line: 90, column: 22, scope: !1344)
!1348 = !DILocation(line: 90, column: 27, scope: !1344)
!1349 = !DILocation(line: 90, column: 9, scope: !1344)
!1350 = !DILocation(line: 90, column: 20, scope: !1344)
!1351 = !DILocation(line: 91, column: 16, scope: !1344)
!1352 = !DILocation(line: 91, column: 21, scope: !1344)
!1353 = !DILocation(line: 91, column: 9, scope: !1344)
!1354 = !DILocation(line: 91, column: 14, scope: !1344)
!1355 = !DILocation(line: 88, column: 40, scope: !1340)
!1356 = !DILocation(line: 88, column: 7, scope: !1340)
!1357 = distinct !{!1357, !1342, !1358, !235}
!1358 = !DILocation(line: 92, column: 7, scope: !1337)
!1359 = !DILocation(line: 87, column: 21, scope: !1333)
!1360 = !DILocation(line: 86, column: 43, scope: !1331)
!1361 = !DILocation(line: 86, column: 5, scope: !1331)
!1362 = distinct !{!1362, !1325, !1363, !235}
!1363 = !DILocation(line: 93, column: 5, scope: !1326)
!1364 = !DILocation(line: 85, column: 32, scope: !1323)
!1365 = !DILocation(line: 85, column: 3, scope: !1323)
!1366 = distinct !{!1366, !1324, !1367, !235}
!1367 = !DILocation(line: 94, column: 3, scope: !1319)
!1368 = !DILocation(line: 95, column: 1, scope: !1311)
!1369 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1370, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1370 = !DISubroutineType(types: !1371)
!1371 = !{!14, !14, !14}
!1372 = !DILocalVariable(name: "a", arg: 1, scope: !1369, file: !11, line: 68, type: !14)
!1373 = !DILocation(line: 0, scope: !1369)
!1374 = !DILocalVariable(name: "b", arg: 2, scope: !1369, file: !11, line: 68, type: !14)
!1375 = !DILocation(line: 69, column: 28, scope: !1369)
!1376 = !DILocation(line: 69, column: 39, scope: !1369)
!1377 = !DILocation(line: 69, column: 38, scope: !1369)
!1378 = !DILocation(line: 69, column: 10, scope: !1369)
!1379 = !DILocation(line: 69, column: 3, scope: !1369)
!1380 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !11, file: !11, line: 106, type: !1312, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1381 = !DILocalVariable(name: "r", arg: 1, scope: !1380, file: !11, line: 106, type: !248)
!1382 = !DILocation(line: 0, scope: !1380)
!1383 = !DILocalVariable(name: "f", scope: !1380, file: !11, line: 109, type: !13)
!1384 = !DILocalVariable(name: "k", scope: !1380, file: !11, line: 107, type: !42)
!1385 = !DILocalVariable(name: "len", scope: !1380, file: !11, line: 107, type: !42)
!1386 = !DILocation(line: 112, column: 7, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1380, file: !11, line: 112, column: 3)
!1388 = !DILocation(line: 112, scope: !1387)
!1389 = !DILocation(line: 111, column: 5, scope: !1380)
!1390 = !DILocation(line: 112, column: 20, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1387, file: !11, line: 112, column: 3)
!1392 = !DILocation(line: 112, column: 3, scope: !1387)
!1393 = !DILocation(line: 113, column: 5, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1395, file: !11, line: 113, column: 5)
!1395 = distinct !DILexicalBlock(scope: !1391, file: !11, line: 112, column: 39)
!1396 = !DILocation(line: 124, column: 3, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1380, file: !11, line: 124, column: 3)
!1398 = !DILocation(line: 113, scope: !1394)
!1399 = !DILocalVariable(name: "start", scope: !1380, file: !11, line: 107, type: !42)
!1400 = !DILocation(line: 113, column: 26, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1394, file: !11, line: 113, column: 5)
!1402 = !DILocation(line: 114, column: 14, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1401, file: !11, line: 113, column: 50)
!1404 = !DILocalVariable(name: "zeta", scope: !1380, file: !11, line: 108, type: !14)
!1405 = !DILocalVariable(name: "j", scope: !1380, file: !11, line: 107, type: !42)
!1406 = !DILocation(line: 115, column: 11, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1403, file: !11, line: 115, column: 7)
!1408 = !DILocation(line: 115, scope: !1407)
!1409 = !DILocation(line: 115, column: 32, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1407, file: !11, line: 115, column: 7)
!1411 = !DILocation(line: 115, column: 24, scope: !1410)
!1412 = !DILocation(line: 115, column: 7, scope: !1407)
!1413 = !DILocation(line: 116, column: 13, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1410, file: !11, line: 115, column: 44)
!1415 = !DILocalVariable(name: "t", scope: !1380, file: !11, line: 108, type: !14)
!1416 = !DILocation(line: 117, column: 35, scope: !1414)
!1417 = !DILocation(line: 117, column: 33, scope: !1414)
!1418 = !DILocation(line: 117, column: 16, scope: !1414)
!1419 = !DILocation(line: 117, column: 9, scope: !1414)
!1420 = !DILocation(line: 117, column: 14, scope: !1414)
!1421 = !DILocation(line: 118, column: 22, scope: !1414)
!1422 = !DILocation(line: 118, column: 33, scope: !1414)
!1423 = !DILocation(line: 118, column: 9, scope: !1414)
!1424 = !DILocation(line: 118, column: 20, scope: !1414)
!1425 = !DILocation(line: 119, column: 34, scope: !1414)
!1426 = !DILocation(line: 119, column: 22, scope: !1414)
!1427 = !DILocation(line: 119, column: 9, scope: !1414)
!1428 = !DILocation(line: 119, column: 20, scope: !1414)
!1429 = !DILocation(line: 115, column: 40, scope: !1410)
!1430 = !DILocation(line: 115, column: 7, scope: !1410)
!1431 = distinct !{!1431, !1412, !1432, !235}
!1432 = !DILocation(line: 120, column: 7, scope: !1407)
!1433 = !DILocation(line: 114, column: 21, scope: !1403)
!1434 = !DILocation(line: 113, column: 43, scope: !1401)
!1435 = !DILocation(line: 113, column: 5, scope: !1401)
!1436 = distinct !{!1436, !1393, !1437, !235}
!1437 = !DILocation(line: 121, column: 5, scope: !1394)
!1438 = !DILocation(line: 112, column: 32, scope: !1391)
!1439 = !DILocation(line: 112, column: 3, scope: !1391)
!1440 = distinct !{!1440, !1392, !1441, !235}
!1441 = !DILocation(line: 122, column: 3, scope: !1387)
!1442 = !DILocation(line: 124, scope: !1397)
!1443 = !DILocation(line: 124, column: 16, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1397, file: !11, line: 124, column: 3)
!1445 = !DILocation(line: 125, column: 18, scope: !1444)
!1446 = !DILocation(line: 125, column: 12, scope: !1444)
!1447 = !DILocation(line: 125, column: 5, scope: !1444)
!1448 = !DILocation(line: 125, column: 10, scope: !1444)
!1449 = !DILocation(line: 124, column: 24, scope: !1444)
!1450 = !DILocation(line: 124, column: 3, scope: !1444)
!1451 = distinct !{!1451, !1396, !1452, !235}
!1452 = !DILocation(line: 125, column: 25, scope: !1397)
!1453 = !DILocation(line: 126, column: 1, scope: !1380)
!1454 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !11, file: !11, line: 139, type: !1455, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{null, !248, !1457, !1457, !14}
!1457 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1458 = !DILocalVariable(name: "r", arg: 1, scope: !1454, file: !11, line: 139, type: !248)
!1459 = !DILocation(line: 0, scope: !1454)
!1460 = !DILocalVariable(name: "a", arg: 2, scope: !1454, file: !11, line: 139, type: !1457)
!1461 = !DILocalVariable(name: "b", arg: 3, scope: !1454, file: !11, line: 139, type: !1457)
!1462 = !DILocalVariable(name: "zeta", arg: 4, scope: !1454, file: !11, line: 139, type: !14)
!1463 = !DILocation(line: 141, column: 17, scope: !1454)
!1464 = !DILocation(line: 141, column: 23, scope: !1454)
!1465 = !DILocation(line: 141, column: 11, scope: !1454)
!1466 = !DILocation(line: 141, column: 9, scope: !1454)
!1467 = !DILocation(line: 142, column: 11, scope: !1454)
!1468 = !DILocation(line: 142, column: 9, scope: !1454)
!1469 = !DILocation(line: 143, column: 17, scope: !1454)
!1470 = !DILocation(line: 143, column: 23, scope: !1454)
!1471 = !DILocation(line: 143, column: 11, scope: !1454)
!1472 = !DILocation(line: 143, column: 8, scope: !1454)
!1473 = !DILocation(line: 144, column: 17, scope: !1454)
!1474 = !DILocation(line: 144, column: 23, scope: !1454)
!1475 = !DILocation(line: 144, column: 11, scope: !1454)
!1476 = !DILocation(line: 144, column: 3, scope: !1454)
!1477 = !DILocation(line: 144, column: 9, scope: !1454)
!1478 = !DILocation(line: 145, column: 17, scope: !1454)
!1479 = !DILocation(line: 145, column: 23, scope: !1454)
!1480 = !DILocation(line: 145, column: 11, scope: !1454)
!1481 = !DILocation(line: 145, column: 3, scope: !1454)
!1482 = !DILocation(line: 145, column: 8, scope: !1454)
!1483 = !DILocation(line: 146, column: 1, scope: !1454)
!1484 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1485, file: !1485, line: 110, type: !1486, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1485 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1486 = !DISubroutineType(types: !1487)
!1487 = !{null, !1488, !64}
!1488 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1489, size: 32)
!1489 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !1490)
!1490 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !1491)
!1491 = !{!1492}
!1492 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1490, file: !168, line: 12, baseType: !172, size: 4096)
!1493 = !DILocalVariable(name: "r", arg: 1, scope: !1484, file: !1485, line: 110, type: !1488)
!1494 = !DILocation(line: 0, scope: !1484)
!1495 = !DILocalVariable(name: "buf", arg: 2, scope: !1484, file: !1485, line: 110, type: !64)
!1496 = !DILocation(line: 115, column: 3, scope: !1484)
!1497 = !DILocation(line: 119, column: 1, scope: !1484)
!1498 = distinct !DISubprogram(name: "cbd3", scope: !1485, file: !1485, line: 89, type: !1486, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1499 = !DILocalVariable(name: "r", arg: 1, scope: !1498, file: !1485, line: 89, type: !1488)
!1500 = !DILocation(line: 0, scope: !1498)
!1501 = !DILocalVariable(name: "buf", arg: 2, scope: !1498, file: !1485, line: 89, type: !64)
!1502 = !DILocalVariable(name: "i", scope: !1498, file: !1485, line: 91, type: !42)
!1503 = !DILocation(line: 95, column: 7, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1498, file: !1485, line: 95, column: 3)
!1505 = !DILocation(line: 95, scope: !1504)
!1506 = !DILocation(line: 95, column: 12, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1504, file: !1485, line: 95, column: 3)
!1508 = !DILocation(line: 95, column: 3, scope: !1504)
!1509 = !DILocation(line: 96, column: 35, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1507, file: !1485, line: 95, column: 28)
!1511 = !DILocation(line: 96, column: 33, scope: !1510)
!1512 = !DILocation(line: 96, column: 10, scope: !1510)
!1513 = !DILocalVariable(name: "t", scope: !1498, file: !1485, line: 92, type: !40)
!1514 = !DILocation(line: 97, column: 12, scope: !1510)
!1515 = !DILocalVariable(name: "d", scope: !1498, file: !1485, line: 92, type: !40)
!1516 = !DILocation(line: 98, column: 12, scope: !1510)
!1517 = !DILocation(line: 98, column: 17, scope: !1510)
!1518 = !DILocation(line: 98, column: 7, scope: !1510)
!1519 = !DILocation(line: 99, column: 12, scope: !1510)
!1520 = !DILocation(line: 99, column: 17, scope: !1510)
!1521 = !DILocation(line: 99, column: 7, scope: !1510)
!1522 = !DILocalVariable(name: "j", scope: !1498, file: !1485, line: 91, type: !42)
!1523 = !DILocation(line: 101, column: 9, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1510, file: !1485, line: 101, column: 5)
!1525 = !DILocation(line: 101, scope: !1524)
!1526 = !DILocation(line: 101, column: 14, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1524, file: !1485, line: 101, column: 5)
!1528 = !DILocation(line: 101, column: 5, scope: !1524)
!1529 = !DILocation(line: 102, column: 19, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1527, file: !1485, line: 101, column: 22)
!1531 = !DILocation(line: 102, column: 14, scope: !1530)
!1532 = !DILocation(line: 102, column: 11, scope: !1530)
!1533 = !DILocalVariable(name: "a", scope: !1498, file: !1485, line: 93, type: !14)
!1534 = !DILocation(line: 103, column: 19, scope: !1530)
!1535 = !DILocation(line: 103, column: 21, scope: !1530)
!1536 = !DILocation(line: 103, column: 14, scope: !1530)
!1537 = !DILocation(line: 103, column: 11, scope: !1530)
!1538 = !DILocalVariable(name: "b", scope: !1498, file: !1485, line: 93, type: !14)
!1539 = !DILocation(line: 104, column: 28, scope: !1530)
!1540 = !DILocation(line: 104, column: 26, scope: !1530)
!1541 = !DILocation(line: 104, column: 18, scope: !1530)
!1542 = !DILocation(line: 104, column: 20, scope: !1530)
!1543 = !DILocation(line: 104, column: 7, scope: !1530)
!1544 = !DILocation(line: 104, column: 24, scope: !1530)
!1545 = !DILocation(line: 101, column: 18, scope: !1527)
!1546 = !DILocation(line: 101, column: 5, scope: !1527)
!1547 = distinct !{!1547, !1528, !1548, !235}
!1548 = !DILocation(line: 105, column: 5, scope: !1524)
!1549 = !DILocation(line: 95, column: 24, scope: !1507)
!1550 = !DILocation(line: 95, column: 3, scope: !1507)
!1551 = distinct !{!1551, !1508, !1552, !235}
!1552 = !DILocation(line: 106, column: 3, scope: !1504)
!1553 = !DILocation(line: 107, column: 1, scope: !1498)
!1554 = distinct !DISubprogram(name: "load24_littleendian", scope: !1485, file: !1485, line: 37, type: !1555, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!40, !64}
!1557 = !DILocalVariable(name: "x", arg: 1, scope: !1554, file: !1485, line: 37, type: !64)
!1558 = !DILocation(line: 0, scope: !1554)
!1559 = !DILocation(line: 40, column: 18, scope: !1554)
!1560 = !DILocation(line: 40, column: 8, scope: !1554)
!1561 = !DILocalVariable(name: "r", scope: !1554, file: !1485, line: 39, type: !40)
!1562 = !DILocation(line: 41, column: 18, scope: !1554)
!1563 = !DILocation(line: 41, column: 8, scope: !1554)
!1564 = !DILocation(line: 41, column: 23, scope: !1554)
!1565 = !DILocation(line: 41, column: 5, scope: !1554)
!1566 = !DILocation(line: 42, column: 18, scope: !1554)
!1567 = !DILocation(line: 42, column: 8, scope: !1554)
!1568 = !DILocation(line: 42, column: 23, scope: !1554)
!1569 = !DILocation(line: 42, column: 5, scope: !1554)
!1570 = !DILocation(line: 43, column: 3, scope: !1554)
!1571 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1485, file: !1485, line: 121, type: !1486, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1572 = !DILocalVariable(name: "r", arg: 1, scope: !1571, file: !1485, line: 121, type: !1488)
!1573 = !DILocation(line: 0, scope: !1571)
!1574 = !DILocalVariable(name: "buf", arg: 2, scope: !1571, file: !1485, line: 121, type: !64)
!1575 = !DILocation(line: 124, column: 3, scope: !1571)
!1576 = !DILocation(line: 128, column: 1, scope: !1571)
!1577 = distinct !DISubprogram(name: "cbd2", scope: !1485, file: !1485, line: 58, type: !1486, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1578 = !DILocalVariable(name: "r", arg: 1, scope: !1577, file: !1485, line: 58, type: !1488)
!1579 = !DILocation(line: 0, scope: !1577)
!1580 = !DILocalVariable(name: "buf", arg: 2, scope: !1577, file: !1485, line: 58, type: !64)
!1581 = !DILocalVariable(name: "i", scope: !1577, file: !1485, line: 60, type: !42)
!1582 = !DILocation(line: 64, column: 7, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1577, file: !1485, line: 64, column: 3)
!1584 = !DILocation(line: 64, scope: !1583)
!1585 = !DILocation(line: 64, column: 12, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1583, file: !1485, line: 64, column: 3)
!1587 = !DILocation(line: 64, column: 3, scope: !1583)
!1588 = !DILocation(line: 65, column: 35, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1586, file: !1485, line: 64, column: 28)
!1590 = !DILocation(line: 65, column: 33, scope: !1589)
!1591 = !DILocation(line: 65, column: 10, scope: !1589)
!1592 = !DILocalVariable(name: "t", scope: !1577, file: !1485, line: 61, type: !40)
!1593 = !DILocation(line: 66, column: 12, scope: !1589)
!1594 = !DILocalVariable(name: "d", scope: !1577, file: !1485, line: 61, type: !40)
!1595 = !DILocation(line: 67, column: 12, scope: !1589)
!1596 = !DILocation(line: 67, column: 17, scope: !1589)
!1597 = !DILocation(line: 67, column: 7, scope: !1589)
!1598 = !DILocalVariable(name: "j", scope: !1577, file: !1485, line: 60, type: !42)
!1599 = !DILocation(line: 69, column: 9, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1589, file: !1485, line: 69, column: 5)
!1601 = !DILocation(line: 69, scope: !1600)
!1602 = !DILocation(line: 69, column: 14, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1600, file: !1485, line: 69, column: 5)
!1604 = !DILocation(line: 69, column: 5, scope: !1600)
!1605 = !DILocation(line: 70, column: 19, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1603, file: !1485, line: 69, column: 22)
!1607 = !DILocation(line: 70, column: 14, scope: !1606)
!1608 = !DILocation(line: 70, column: 11, scope: !1606)
!1609 = !DILocalVariable(name: "a", scope: !1577, file: !1485, line: 62, type: !14)
!1610 = !DILocation(line: 71, column: 19, scope: !1606)
!1611 = !DILocation(line: 71, column: 21, scope: !1606)
!1612 = !DILocation(line: 71, column: 14, scope: !1606)
!1613 = !DILocation(line: 71, column: 11, scope: !1606)
!1614 = !DILocalVariable(name: "b", scope: !1577, file: !1485, line: 62, type: !14)
!1615 = !DILocation(line: 72, column: 28, scope: !1606)
!1616 = !DILocation(line: 72, column: 26, scope: !1606)
!1617 = !DILocation(line: 72, column: 18, scope: !1606)
!1618 = !DILocation(line: 72, column: 20, scope: !1606)
!1619 = !DILocation(line: 72, column: 7, scope: !1606)
!1620 = !DILocation(line: 72, column: 24, scope: !1606)
!1621 = !DILocation(line: 69, column: 18, scope: !1603)
!1622 = !DILocation(line: 69, column: 5, scope: !1603)
!1623 = distinct !{!1623, !1604, !1624, !235}
!1624 = !DILocation(line: 73, column: 5, scope: !1600)
!1625 = !DILocation(line: 64, column: 24, scope: !1586)
!1626 = !DILocation(line: 64, column: 3, scope: !1586)
!1627 = distinct !{!1627, !1587, !1628, !235}
!1628 = !DILocation(line: 74, column: 3, scope: !1583)
!1629 = !DILocation(line: 75, column: 1, scope: !1577)
!1630 = distinct !DISubprogram(name: "load32_littleendian", scope: !1485, file: !1485, line: 15, type: !1555, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1631 = !DILocalVariable(name: "x", arg: 1, scope: !1630, file: !1485, line: 15, type: !64)
!1632 = !DILocation(line: 0, scope: !1630)
!1633 = !DILocation(line: 18, column: 18, scope: !1630)
!1634 = !DILocation(line: 18, column: 8, scope: !1630)
!1635 = !DILocalVariable(name: "r", scope: !1630, file: !1485, line: 17, type: !40)
!1636 = !DILocation(line: 19, column: 18, scope: !1630)
!1637 = !DILocation(line: 19, column: 8, scope: !1630)
!1638 = !DILocation(line: 19, column: 23, scope: !1630)
!1639 = !DILocation(line: 19, column: 5, scope: !1630)
!1640 = !DILocation(line: 20, column: 18, scope: !1630)
!1641 = !DILocation(line: 20, column: 8, scope: !1630)
!1642 = !DILocation(line: 20, column: 23, scope: !1630)
!1643 = !DILocation(line: 20, column: 5, scope: !1630)
!1644 = !DILocation(line: 21, column: 18, scope: !1630)
!1645 = !DILocation(line: 21, column: 8, scope: !1630)
!1646 = !DILocation(line: 21, column: 23, scope: !1630)
!1647 = !DILocation(line: 21, column: 5, scope: !1630)
!1648 = !DILocation(line: 22, column: 3, scope: !1630)
!1649 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1650, file: !1650, line: 16, type: !1651, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1650 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1651 = !DISubroutineType(types: !48)
!1652 = !DILocalVariable(name: "a", arg: 1, scope: !1649, file: !1650, line: 16, type: !5)
!1653 = !DILocation(line: 0, scope: !1649)
!1654 = !DILocalVariable(name: "t", scope: !1649, file: !1650, line: 18, type: !14)
!1655 = !DILocation(line: 21, column: 12, scope: !1649)
!1656 = !DILocation(line: 21, column: 22, scope: !1649)
!1657 = !DILocation(line: 21, column: 10, scope: !1649)
!1658 = !DILocation(line: 21, column: 32, scope: !1649)
!1659 = !DILocation(line: 21, column: 7, scope: !1649)
!1660 = !DILocation(line: 22, column: 3, scope: !1649)
!1661 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1650, file: !1650, line: 35, type: !1662, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{!14, !14}
!1664 = !DILocalVariable(name: "a", arg: 1, scope: !1661, file: !1650, line: 35, type: !14)
!1665 = !DILocation(line: 0, scope: !1661)
!1666 = !DILocalVariable(name: "v", scope: !1661, file: !1650, line: 37, type: !13)
!1667 = !DILocation(line: 39, column: 20, scope: !1661)
!1668 = !DILocation(line: 39, column: 19, scope: !1661)
!1669 = !DILocation(line: 39, column: 22, scope: !1661)
!1670 = !DILocation(line: 39, column: 33, scope: !1661)
!1671 = !DILocalVariable(name: "t", scope: !1661, file: !1650, line: 36, type: !14)
!1672 = !DILocation(line: 41, column: 10, scope: !1661)
!1673 = !DILocation(line: 41, column: 3, scope: !1661)
!1674 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !1675, file: !1675, line: 16, type: !1676, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1675 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1676 = !DISubroutineType(types: !1677)
!1677 = !{!9, !64, !64, !1678}
!1678 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1679, line: 214, baseType: !42)
!1679 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1680 = !DILocalVariable(name: "a", arg: 1, scope: !1674, file: !1675, line: 16, type: !64)
!1681 = !DILocation(line: 0, scope: !1674)
!1682 = !DILocalVariable(name: "b", arg: 2, scope: !1674, file: !1675, line: 16, type: !64)
!1683 = !DILocalVariable(name: "len", arg: 3, scope: !1674, file: !1675, line: 16, type: !1678)
!1684 = !DILocalVariable(name: "r", scope: !1674, file: !1675, line: 19, type: !61)
!1685 = !DILocalVariable(name: "i", scope: !1674, file: !1675, line: 18, type: !1678)
!1686 = !DILocation(line: 21, column: 7, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1674, file: !1675, line: 21, column: 3)
!1688 = !DILocation(line: 21, scope: !1687)
!1689 = !DILocation(line: 21, column: 12, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1687, file: !1675, line: 21, column: 3)
!1691 = !DILocation(line: 21, column: 3, scope: !1687)
!1692 = !DILocation(line: 22, column: 10, scope: !1690)
!1693 = !DILocation(line: 22, column: 17, scope: !1690)
!1694 = !DILocation(line: 22, column: 15, scope: !1690)
!1695 = !DILocation(line: 22, column: 7, scope: !1690)
!1696 = !DILocation(line: 21, column: 18, scope: !1690)
!1697 = !DILocation(line: 21, column: 3, scope: !1690)
!1698 = distinct !{!1698, !1691, !1699, !235}
!1699 = !DILocation(line: 22, column: 20, scope: !1687)
!1700 = !DILocation(line: 24, column: 25, scope: !1674)
!1701 = !DILocation(line: 24, column: 10, scope: !1674)
!1702 = !DILocation(line: 24, column: 3, scope: !1674)
!1703 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !1675, file: !1675, line: 40, type: !1704, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1704 = !DISubroutineType(types: !1705)
!1705 = !{null, !60, !64, !1678, !61}
!1706 = !DILocalVariable(name: "r", arg: 1, scope: !1703, file: !1675, line: 40, type: !60)
!1707 = !DILocation(line: 0, scope: !1703)
!1708 = !DILocalVariable(name: "x", arg: 2, scope: !1703, file: !1675, line: 40, type: !64)
!1709 = !DILocalVariable(name: "len", arg: 3, scope: !1703, file: !1675, line: 40, type: !1678)
!1710 = !DILocalVariable(name: "b", arg: 4, scope: !1703, file: !1675, line: 40, type: !61)
!1711 = !DILocation(line: 51, column: 3, scope: !1703)
!1712 = !{i64 1722}
!1713 = !DILocation(line: 54, column: 7, scope: !1703)
!1714 = !DILocalVariable(name: "i", scope: !1703, file: !1675, line: 42, type: !1678)
!1715 = !DILocation(line: 55, column: 7, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1703, file: !1675, line: 55, column: 3)
!1717 = !DILocation(line: 55, scope: !1716)
!1718 = !DILocation(line: 55, column: 12, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1716, file: !1675, line: 55, column: 3)
!1720 = !DILocation(line: 55, column: 3, scope: !1716)
!1721 = !DILocation(line: 56, column: 18, scope: !1719)
!1722 = !DILocation(line: 56, column: 25, scope: !1719)
!1723 = !DILocation(line: 56, column: 23, scope: !1719)
!1724 = !DILocation(line: 56, column: 15, scope: !1719)
!1725 = !DILocation(line: 56, column: 5, scope: !1719)
!1726 = !DILocation(line: 56, column: 10, scope: !1719)
!1727 = !DILocation(line: 55, column: 18, scope: !1719)
!1728 = !DILocation(line: 55, column: 3, scope: !1719)
!1729 = distinct !{!1729, !1720, !1730, !235}
!1730 = !DILocation(line: 56, column: 29, scope: !1716)
!1731 = !DILocation(line: 57, column: 1, scope: !1703)
!1732 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !1675, file: !1675, line: 71, type: !1733, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1733 = !DISubroutineType(types: !1734)
!1734 = !{null, !248, !14, !35}
!1735 = !DILocalVariable(name: "r", arg: 1, scope: !1732, file: !1675, line: 71, type: !248)
!1736 = !DILocation(line: 0, scope: !1732)
!1737 = !DILocalVariable(name: "v", arg: 2, scope: !1732, file: !1675, line: 71, type: !14)
!1738 = !DILocalVariable(name: "b", arg: 3, scope: !1732, file: !1675, line: 71, type: !35)
!1739 = !DILocation(line: 73, column: 7, scope: !1732)
!1740 = !DILocation(line: 74, column: 15, scope: !1732)
!1741 = !DILocation(line: 74, column: 19, scope: !1732)
!1742 = !DILocation(line: 74, column: 11, scope: !1732)
!1743 = !DILocation(line: 74, column: 6, scope: !1732)
!1744 = !DILocation(line: 75, column: 1, scope: !1732)
!1745 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !1746, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1746 = !DISubroutineType(types: !1747)
!1747 = !{null, !1748}
!1748 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1749, size: 32)
!1749 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !1750)
!1750 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !1751)
!1751 = !{!1752, !1753}
!1752 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1750, file: !190, line: 15, baseType: !194, size: 1600)
!1753 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1750, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!1754 = !DILocalVariable(name: "state", arg: 1, scope: !1745, file: !27, line: 523, type: !1748)
!1755 = !DILocation(line: 0, scope: !1745)
!1756 = !DILocation(line: 525, column: 3, scope: !1745)
!1757 = !DILocation(line: 526, column: 10, scope: !1745)
!1758 = !DILocation(line: 526, column: 14, scope: !1745)
!1759 = !DILocation(line: 527, column: 1, scope: !1745)
!1760 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !1761, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1761 = !DISubroutineType(types: !1762)
!1762 = !{null, !1763}
!1763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!1764 = !DILocalVariable(name: "s", arg: 1, scope: !1760, file: !27, line: 353, type: !1763)
!1765 = !DILocation(line: 0, scope: !1760)
!1766 = !DILocalVariable(name: "i", scope: !1760, file: !27, line: 355, type: !42)
!1767 = !DILocation(line: 356, column: 7, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1760, file: !27, line: 356, column: 3)
!1769 = !DILocation(line: 356, scope: !1768)
!1770 = !DILocation(line: 356, column: 12, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1768, file: !27, line: 356, column: 3)
!1772 = !DILocation(line: 356, column: 3, scope: !1768)
!1773 = !DILocation(line: 357, column: 5, scope: !1771)
!1774 = !DILocation(line: 357, column: 10, scope: !1771)
!1775 = !DILocation(line: 356, column: 17, scope: !1771)
!1776 = !DILocation(line: 356, column: 3, scope: !1771)
!1777 = distinct !{!1777, !1772, !1778, !235}
!1778 = !DILocation(line: 357, column: 12, scope: !1768)
!1779 = !DILocation(line: 358, column: 1, scope: !1760)
!1780 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !1781, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1781 = !DISubroutineType(types: !1782)
!1782 = !{null, !1748, !64, !1678}
!1783 = !DILocalVariable(name: "state", arg: 1, scope: !1780, file: !27, line: 538, type: !1748)
!1784 = !DILocation(line: 0, scope: !1780)
!1785 = !DILocalVariable(name: "in", arg: 2, scope: !1780, file: !27, line: 538, type: !64)
!1786 = !DILocalVariable(name: "inlen", arg: 3, scope: !1780, file: !27, line: 538, type: !1678)
!1787 = !DILocation(line: 540, column: 47, scope: !1780)
!1788 = !DILocation(line: 540, column: 16, scope: !1780)
!1789 = !DILocation(line: 540, column: 10, scope: !1780)
!1790 = !DILocation(line: 540, column: 14, scope: !1780)
!1791 = !DILocation(line: 541, column: 1, scope: !1780)
!1792 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !1793, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1793 = !DISubroutineType(types: !1794)
!1794 = !{!42, !1763, !42, !42, !64, !1678}
!1795 = !DILocalVariable(name: "s", arg: 1, scope: !1792, file: !27, line: 373, type: !1763)
!1796 = !DILocation(line: 0, scope: !1792)
!1797 = !DILocalVariable(name: "pos", arg: 2, scope: !1792, file: !27, line: 374, type: !42)
!1798 = !DILocalVariable(name: "r", arg: 3, scope: !1792, file: !27, line: 375, type: !42)
!1799 = !DILocalVariable(name: "in", arg: 4, scope: !1792, file: !27, line: 376, type: !64)
!1800 = !DILocalVariable(name: "inlen", arg: 5, scope: !1792, file: !27, line: 377, type: !1678)
!1801 = !DILocation(line: 381, column: 3, scope: !1792)
!1802 = !DILocation(line: 381, column: 12, scope: !1792)
!1803 = !DILocation(line: 381, column: 19, scope: !1792)
!1804 = !DILocation(line: 382, column: 5, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1806, file: !27, line: 382, column: 5)
!1806 = distinct !DILexicalBlock(scope: !1792, file: !27, line: 381, column: 25)
!1807 = !DILocation(line: 389, column: 3, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1792, file: !27, line: 389, column: 3)
!1809 = !DILocation(line: 382, scope: !1805)
!1810 = !DILocalVariable(name: "i", scope: !1792, file: !27, line: 379, type: !42)
!1811 = !DILocation(line: 382, column: 16, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1805, file: !27, line: 382, column: 5)
!1813 = !DILocation(line: 383, column: 27, scope: !1812)
!1814 = !DILocation(line: 383, column: 17, scope: !1812)
!1815 = !DILocation(line: 383, column: 37, scope: !1812)
!1816 = !DILocation(line: 383, column: 33, scope: !1812)
!1817 = !DILocation(line: 383, column: 10, scope: !1812)
!1818 = !DILocation(line: 383, column: 7, scope: !1812)
!1819 = !DILocation(line: 383, column: 14, scope: !1812)
!1820 = !DILocation(line: 383, column: 30, scope: !1812)
!1821 = !DILocation(line: 382, column: 20, scope: !1812)
!1822 = !DILocation(line: 382, column: 5, scope: !1812)
!1823 = distinct !{!1823, !1804, !1824, !235}
!1824 = !DILocation(line: 383, column: 42, scope: !1805)
!1825 = !DILocation(line: 384, column: 15, scope: !1806)
!1826 = !DILocation(line: 384, column: 11, scope: !1806)
!1827 = !DILocation(line: 385, column: 5, scope: !1806)
!1828 = distinct !{!1828, !1801, !1829, !235}
!1829 = !DILocation(line: 387, column: 3, scope: !1792)
!1830 = !DILocation(line: 389, scope: !1808)
!1831 = !DILocation(line: 389, column: 18, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1808, file: !27, line: 389, column: 3)
!1833 = !DILocation(line: 389, column: 14, scope: !1832)
!1834 = !DILocation(line: 390, column: 25, scope: !1832)
!1835 = !DILocation(line: 390, column: 15, scope: !1832)
!1836 = !DILocation(line: 390, column: 35, scope: !1832)
!1837 = !DILocation(line: 390, column: 31, scope: !1832)
!1838 = !DILocation(line: 390, column: 8, scope: !1832)
!1839 = !DILocation(line: 390, column: 5, scope: !1832)
!1840 = !DILocation(line: 390, column: 12, scope: !1832)
!1841 = !DILocation(line: 390, column: 28, scope: !1832)
!1842 = !DILocation(line: 389, column: 26, scope: !1832)
!1843 = !DILocation(line: 389, column: 3, scope: !1832)
!1844 = distinct !{!1844, !1807, !1845, !235}
!1845 = !DILocation(line: 390, column: 40, scope: !1808)
!1846 = !DILocation(line: 392, column: 3, scope: !1792)
!1847 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !1761, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1848 = !DILocalVariable(name: "state", arg: 1, scope: !1847, file: !27, line: 82, type: !1763)
!1849 = !DILocation(line: 0, scope: !1847)
!1850 = !DILocation(line: 100, column: 15, scope: !1847)
!1851 = !DILocalVariable(name: "Aba", scope: !1847, file: !27, line: 86, type: !23)
!1852 = !DILocation(line: 101, column: 15, scope: !1847)
!1853 = !DILocalVariable(name: "Abe", scope: !1847, file: !27, line: 86, type: !23)
!1854 = !DILocation(line: 102, column: 15, scope: !1847)
!1855 = !DILocalVariable(name: "Abi", scope: !1847, file: !27, line: 86, type: !23)
!1856 = !DILocation(line: 103, column: 15, scope: !1847)
!1857 = !DILocalVariable(name: "Abo", scope: !1847, file: !27, line: 86, type: !23)
!1858 = !DILocation(line: 104, column: 15, scope: !1847)
!1859 = !DILocalVariable(name: "Abu", scope: !1847, file: !27, line: 86, type: !23)
!1860 = !DILocation(line: 105, column: 15, scope: !1847)
!1861 = !DILocalVariable(name: "Aga", scope: !1847, file: !27, line: 87, type: !23)
!1862 = !DILocation(line: 106, column: 15, scope: !1847)
!1863 = !DILocalVariable(name: "Age", scope: !1847, file: !27, line: 87, type: !23)
!1864 = !DILocation(line: 107, column: 15, scope: !1847)
!1865 = !DILocalVariable(name: "Agi", scope: !1847, file: !27, line: 87, type: !23)
!1866 = !DILocation(line: 108, column: 15, scope: !1847)
!1867 = !DILocalVariable(name: "Ago", scope: !1847, file: !27, line: 87, type: !23)
!1868 = !DILocation(line: 109, column: 15, scope: !1847)
!1869 = !DILocalVariable(name: "Agu", scope: !1847, file: !27, line: 87, type: !23)
!1870 = !DILocation(line: 110, column: 15, scope: !1847)
!1871 = !DILocalVariable(name: "Aka", scope: !1847, file: !27, line: 88, type: !23)
!1872 = !DILocation(line: 111, column: 15, scope: !1847)
!1873 = !DILocalVariable(name: "Ake", scope: !1847, file: !27, line: 88, type: !23)
!1874 = !DILocation(line: 112, column: 15, scope: !1847)
!1875 = !DILocalVariable(name: "Aki", scope: !1847, file: !27, line: 88, type: !23)
!1876 = !DILocation(line: 113, column: 15, scope: !1847)
!1877 = !DILocalVariable(name: "Ako", scope: !1847, file: !27, line: 88, type: !23)
!1878 = !DILocation(line: 114, column: 15, scope: !1847)
!1879 = !DILocalVariable(name: "Aku", scope: !1847, file: !27, line: 88, type: !23)
!1880 = !DILocation(line: 115, column: 15, scope: !1847)
!1881 = !DILocalVariable(name: "Ama", scope: !1847, file: !27, line: 89, type: !23)
!1882 = !DILocation(line: 116, column: 15, scope: !1847)
!1883 = !DILocalVariable(name: "Ame", scope: !1847, file: !27, line: 89, type: !23)
!1884 = !DILocation(line: 117, column: 15, scope: !1847)
!1885 = !DILocalVariable(name: "Ami", scope: !1847, file: !27, line: 89, type: !23)
!1886 = !DILocation(line: 118, column: 15, scope: !1847)
!1887 = !DILocalVariable(name: "Amo", scope: !1847, file: !27, line: 89, type: !23)
!1888 = !DILocation(line: 119, column: 15, scope: !1847)
!1889 = !DILocalVariable(name: "Amu", scope: !1847, file: !27, line: 89, type: !23)
!1890 = !DILocation(line: 120, column: 15, scope: !1847)
!1891 = !DILocalVariable(name: "Asa", scope: !1847, file: !27, line: 90, type: !23)
!1892 = !DILocation(line: 121, column: 15, scope: !1847)
!1893 = !DILocalVariable(name: "Ase", scope: !1847, file: !27, line: 90, type: !23)
!1894 = !DILocation(line: 122, column: 15, scope: !1847)
!1895 = !DILocalVariable(name: "Asi", scope: !1847, file: !27, line: 90, type: !23)
!1896 = !DILocation(line: 123, column: 15, scope: !1847)
!1897 = !DILocalVariable(name: "Aso", scope: !1847, file: !27, line: 90, type: !23)
!1898 = !DILocation(line: 124, column: 15, scope: !1847)
!1899 = !DILocalVariable(name: "Asu", scope: !1847, file: !27, line: 90, type: !23)
!1900 = !DILocalVariable(name: "round", scope: !1847, file: !27, line: 84, type: !9)
!1901 = !DILocation(line: 126, column: 13, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1847, file: !27, line: 126, column: 9)
!1903 = !DILocation(line: 126, scope: !1902)
!1904 = !DILocation(line: 126, column: 30, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1902, file: !27, line: 126, column: 9)
!1906 = !DILocation(line: 126, column: 9, scope: !1902)
!1907 = !DILocalVariable(name: "BCa", scope: !1847, file: !27, line: 91, type: !23)
!1908 = !DILocalVariable(name: "BCe", scope: !1847, file: !27, line: 91, type: !23)
!1909 = !DILocalVariable(name: "BCi", scope: !1847, file: !27, line: 91, type: !23)
!1910 = !DILocalVariable(name: "BCo", scope: !1847, file: !27, line: 91, type: !23)
!1911 = !DILocalVariable(name: "BCu", scope: !1847, file: !27, line: 91, type: !23)
!1912 = !DILocalVariable(name: "Da", scope: !1847, file: !27, line: 92, type: !23)
!1913 = !DILocalVariable(name: "De", scope: !1847, file: !27, line: 92, type: !23)
!1914 = !DILocalVariable(name: "Di", scope: !1847, file: !27, line: 92, type: !23)
!1915 = !DILocalVariable(name: "Do", scope: !1847, file: !27, line: 92, type: !23)
!1916 = !DILocalVariable(name: "Du", scope: !1847, file: !27, line: 92, type: !23)
!1917 = !DILocalVariable(name: "Eba", scope: !1847, file: !27, line: 93, type: !23)
!1918 = !DILocalVariable(name: "Ebe", scope: !1847, file: !27, line: 93, type: !23)
!1919 = !DILocalVariable(name: "Ebi", scope: !1847, file: !27, line: 93, type: !23)
!1920 = !DILocalVariable(name: "Ebo", scope: !1847, file: !27, line: 93, type: !23)
!1921 = !DILocalVariable(name: "Ebu", scope: !1847, file: !27, line: 93, type: !23)
!1922 = !DILocalVariable(name: "Ega", scope: !1847, file: !27, line: 94, type: !23)
!1923 = !DILocalVariable(name: "Ege", scope: !1847, file: !27, line: 94, type: !23)
!1924 = !DILocalVariable(name: "Egi", scope: !1847, file: !27, line: 94, type: !23)
!1925 = !DILocalVariable(name: "Ego", scope: !1847, file: !27, line: 94, type: !23)
!1926 = !DILocalVariable(name: "Egu", scope: !1847, file: !27, line: 94, type: !23)
!1927 = !DILocalVariable(name: "Eka", scope: !1847, file: !27, line: 95, type: !23)
!1928 = !DILocalVariable(name: "Eke", scope: !1847, file: !27, line: 95, type: !23)
!1929 = !DILocalVariable(name: "Eki", scope: !1847, file: !27, line: 95, type: !23)
!1930 = !DILocalVariable(name: "Eko", scope: !1847, file: !27, line: 95, type: !23)
!1931 = !DILocalVariable(name: "Eku", scope: !1847, file: !27, line: 95, type: !23)
!1932 = !DILocalVariable(name: "Ema", scope: !1847, file: !27, line: 96, type: !23)
!1933 = !DILocalVariable(name: "Eme", scope: !1847, file: !27, line: 96, type: !23)
!1934 = !DILocalVariable(name: "Emi", scope: !1847, file: !27, line: 96, type: !23)
!1935 = !DILocalVariable(name: "Emo", scope: !1847, file: !27, line: 96, type: !23)
!1936 = !DILocalVariable(name: "Emu", scope: !1847, file: !27, line: 96, type: !23)
!1937 = !DILocalVariable(name: "Esa", scope: !1847, file: !27, line: 97, type: !23)
!1938 = !DILocalVariable(name: "Ese", scope: !1847, file: !27, line: 97, type: !23)
!1939 = !DILocalVariable(name: "Esi", scope: !1847, file: !27, line: 97, type: !23)
!1940 = !DILocalVariable(name: "Eso", scope: !1847, file: !27, line: 97, type: !23)
!1941 = !DILocalVariable(name: "Esu", scope: !1847, file: !27, line: 97, type: !23)
!1942 = !DILocation(line: 130, column: 22, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1905, file: !27, line: 126, column: 53)
!1944 = !DILocation(line: 130, column: 26, scope: !1943)
!1945 = !DILocation(line: 130, column: 30, scope: !1943)
!1946 = !DILocation(line: 130, column: 34, scope: !1943)
!1947 = !DILocation(line: 132, column: 22, scope: !1943)
!1948 = !DILocation(line: 132, column: 26, scope: !1943)
!1949 = !DILocation(line: 132, column: 30, scope: !1943)
!1950 = !DILocation(line: 132, column: 34, scope: !1943)
!1951 = !DILocation(line: 138, column: 22, scope: !1943)
!1952 = !DILocation(line: 138, column: 21, scope: !1943)
!1953 = !DILocation(line: 208, column: 17, scope: !1943)
!1954 = !DILocation(line: 209, column: 19, scope: !1943)
!1955 = !DILocation(line: 129, column: 22, scope: !1943)
!1956 = !DILocation(line: 129, column: 26, scope: !1943)
!1957 = !DILocation(line: 129, column: 30, scope: !1943)
!1958 = !DILocation(line: 129, column: 34, scope: !1943)
!1959 = !DILocation(line: 135, column: 22, scope: !1943)
!1960 = !DILocation(line: 135, column: 21, scope: !1943)
!1961 = !DILocation(line: 212, column: 17, scope: !1943)
!1962 = !DILocation(line: 213, column: 19, scope: !1943)
!1963 = !DILocation(line: 131, column: 22, scope: !1943)
!1964 = !DILocation(line: 131, column: 26, scope: !1943)
!1965 = !DILocation(line: 131, column: 30, scope: !1943)
!1966 = !DILocation(line: 131, column: 34, scope: !1943)
!1967 = !DILocation(line: 128, column: 22, scope: !1943)
!1968 = !DILocation(line: 128, column: 26, scope: !1943)
!1969 = !DILocation(line: 128, column: 30, scope: !1943)
!1970 = !DILocation(line: 128, column: 34, scope: !1943)
!1971 = !DILocation(line: 139, column: 22, scope: !1943)
!1972 = !DILocation(line: 139, column: 21, scope: !1943)
!1973 = !DILocation(line: 210, column: 17, scope: !1943)
!1974 = !DILocation(line: 211, column: 19, scope: !1943)
!1975 = !DILocation(line: 217, column: 28, scope: !1943)
!1976 = !DILocation(line: 217, column: 33, scope: !1943)
!1977 = !DILocation(line: 217, column: 25, scope: !1943)
!1978 = !DILocation(line: 137, column: 22, scope: !1943)
!1979 = !DILocation(line: 137, column: 21, scope: !1943)
!1980 = !DILocation(line: 145, column: 17, scope: !1943)
!1981 = !DILocation(line: 146, column: 19, scope: !1943)
!1982 = !DILocation(line: 136, column: 22, scope: !1943)
!1983 = !DILocation(line: 136, column: 21, scope: !1943)
!1984 = !DILocation(line: 143, column: 17, scope: !1943)
!1985 = !DILocation(line: 144, column: 19, scope: !1943)
!1986 = !DILocation(line: 151, column: 28, scope: !1943)
!1987 = !DILocation(line: 151, column: 33, scope: !1943)
!1988 = !DILocation(line: 152, column: 30, scope: !1943)
!1989 = !DILocation(line: 152, column: 17, scope: !1943)
!1990 = !DILocation(line: 141, column: 17, scope: !1943)
!1991 = !DILocation(line: 158, column: 17, scope: !1943)
!1992 = !DILocation(line: 159, column: 19, scope: !1943)
!1993 = !DILocation(line: 162, column: 17, scope: !1943)
!1994 = !DILocation(line: 163, column: 19, scope: !1943)
!1995 = !DILocation(line: 160, column: 17, scope: !1943)
!1996 = !DILocation(line: 161, column: 19, scope: !1943)
!1997 = !DILocation(line: 168, column: 28, scope: !1943)
!1998 = !DILocation(line: 168, column: 33, scope: !1943)
!1999 = !DILocation(line: 168, column: 25, scope: !1943)
!2000 = !DILocation(line: 223, column: 22, scope: !1943)
!2001 = !DILocation(line: 174, column: 17, scope: !1943)
!2002 = !DILocation(line: 175, column: 19, scope: !1943)
!2003 = !DILocation(line: 178, column: 17, scope: !1943)
!2004 = !DILocation(line: 179, column: 19, scope: !1943)
!2005 = !DILocation(line: 176, column: 17, scope: !1943)
!2006 = !DILocation(line: 177, column: 19, scope: !1943)
!2007 = !DILocation(line: 184, column: 28, scope: !1943)
!2008 = !DILocation(line: 184, column: 33, scope: !1943)
!2009 = !DILocation(line: 184, column: 25, scope: !1943)
!2010 = !DILocation(line: 223, column: 26, scope: !1943)
!2011 = !DILocation(line: 190, column: 17, scope: !1943)
!2012 = !DILocation(line: 191, column: 19, scope: !1943)
!2013 = !DILocation(line: 194, column: 17, scope: !1943)
!2014 = !DILocation(line: 195, column: 19, scope: !1943)
!2015 = !DILocation(line: 192, column: 17, scope: !1943)
!2016 = !DILocation(line: 193, column: 19, scope: !1943)
!2017 = !DILocation(line: 200, column: 28, scope: !1943)
!2018 = !DILocation(line: 200, column: 33, scope: !1943)
!2019 = !DILocation(line: 200, column: 25, scope: !1943)
!2020 = !DILocation(line: 223, column: 30, scope: !1943)
!2021 = !DILocation(line: 206, column: 17, scope: !1943)
!2022 = !DILocation(line: 207, column: 19, scope: !1943)
!2023 = !DILocation(line: 216, column: 28, scope: !1943)
!2024 = !DILocation(line: 216, column: 33, scope: !1943)
!2025 = !DILocation(line: 216, column: 25, scope: !1943)
!2026 = !DILocation(line: 223, column: 34, scope: !1943)
!2027 = !DILocation(line: 149, column: 17, scope: !1943)
!2028 = !DILocation(line: 150, column: 19, scope: !1943)
!2029 = !DILocation(line: 147, column: 17, scope: !1943)
!2030 = !DILocation(line: 148, column: 19, scope: !1943)
!2031 = !DILocation(line: 154, column: 28, scope: !1943)
!2032 = !DILocation(line: 154, column: 33, scope: !1943)
!2033 = !DILocation(line: 154, column: 25, scope: !1943)
!2034 = !DILocation(line: 166, column: 17, scope: !1943)
!2035 = !DILocation(line: 167, column: 19, scope: !1943)
!2036 = !DILocation(line: 164, column: 17, scope: !1943)
!2037 = !DILocation(line: 165, column: 19, scope: !1943)
!2038 = !DILocation(line: 170, column: 28, scope: !1943)
!2039 = !DILocation(line: 170, column: 33, scope: !1943)
!2040 = !DILocation(line: 170, column: 25, scope: !1943)
!2041 = !DILocation(line: 225, column: 22, scope: !1943)
!2042 = !DILocation(line: 182, column: 17, scope: !1943)
!2043 = !DILocation(line: 183, column: 19, scope: !1943)
!2044 = !DILocation(line: 180, column: 17, scope: !1943)
!2045 = !DILocation(line: 181, column: 19, scope: !1943)
!2046 = !DILocation(line: 186, column: 28, scope: !1943)
!2047 = !DILocation(line: 186, column: 33, scope: !1943)
!2048 = !DILocation(line: 186, column: 25, scope: !1943)
!2049 = !DILocation(line: 225, column: 26, scope: !1943)
!2050 = !DILocation(line: 198, column: 17, scope: !1943)
!2051 = !DILocation(line: 199, column: 19, scope: !1943)
!2052 = !DILocation(line: 196, column: 17, scope: !1943)
!2053 = !DILocation(line: 197, column: 19, scope: !1943)
!2054 = !DILocation(line: 202, column: 28, scope: !1943)
!2055 = !DILocation(line: 202, column: 33, scope: !1943)
!2056 = !DILocation(line: 202, column: 25, scope: !1943)
!2057 = !DILocation(line: 225, column: 30, scope: !1943)
!2058 = !DILocation(line: 214, column: 17, scope: !1943)
!2059 = !DILocation(line: 215, column: 19, scope: !1943)
!2060 = !DILocation(line: 218, column: 28, scope: !1943)
!2061 = !DILocation(line: 218, column: 33, scope: !1943)
!2062 = !DILocation(line: 218, column: 25, scope: !1943)
!2063 = !DILocation(line: 225, column: 34, scope: !1943)
!2064 = !DILocation(line: 231, column: 22, scope: !1943)
!2065 = !DILocation(line: 231, column: 21, scope: !1943)
!2066 = !DILocation(line: 309, column: 17, scope: !1943)
!2067 = !DILocation(line: 310, column: 19, scope: !1943)
!2068 = !DILocation(line: 171, column: 28, scope: !1943)
!2069 = !DILocation(line: 171, column: 33, scope: !1943)
!2070 = !DILocation(line: 171, column: 25, scope: !1943)
!2071 = !DILocation(line: 156, column: 28, scope: !1943)
!2072 = !DILocation(line: 156, column: 33, scope: !1943)
!2073 = !DILocation(line: 156, column: 25, scope: !1943)
!2074 = !DILocation(line: 172, column: 28, scope: !1943)
!2075 = !DILocation(line: 172, column: 33, scope: !1943)
!2076 = !DILocation(line: 172, column: 25, scope: !1943)
!2077 = !DILocation(line: 227, column: 22, scope: !1943)
!2078 = !DILocation(line: 188, column: 28, scope: !1943)
!2079 = !DILocation(line: 188, column: 33, scope: !1943)
!2080 = !DILocation(line: 188, column: 25, scope: !1943)
!2081 = !DILocation(line: 227, column: 26, scope: !1943)
!2082 = !DILocation(line: 204, column: 28, scope: !1943)
!2083 = !DILocation(line: 204, column: 33, scope: !1943)
!2084 = !DILocation(line: 204, column: 25, scope: !1943)
!2085 = !DILocation(line: 227, column: 30, scope: !1943)
!2086 = !DILocation(line: 220, column: 28, scope: !1943)
!2087 = !DILocation(line: 220, column: 33, scope: !1943)
!2088 = !DILocation(line: 220, column: 25, scope: !1943)
!2089 = !DILocation(line: 227, column: 34, scope: !1943)
!2090 = !DILocation(line: 233, column: 22, scope: !1943)
!2091 = !DILocation(line: 233, column: 21, scope: !1943)
!2092 = !DILocation(line: 303, column: 17, scope: !1943)
!2093 = !DILocation(line: 304, column: 19, scope: !1943)
!2094 = !DILocation(line: 153, column: 28, scope: !1943)
!2095 = !DILocation(line: 153, column: 33, scope: !1943)
!2096 = !DILocation(line: 153, column: 25, scope: !1943)
!2097 = !DILocation(line: 169, column: 28, scope: !1943)
!2098 = !DILocation(line: 169, column: 33, scope: !1943)
!2099 = !DILocation(line: 169, column: 25, scope: !1943)
!2100 = !DILocation(line: 224, column: 22, scope: !1943)
!2101 = !DILocation(line: 185, column: 28, scope: !1943)
!2102 = !DILocation(line: 185, column: 33, scope: !1943)
!2103 = !DILocation(line: 185, column: 25, scope: !1943)
!2104 = !DILocation(line: 224, column: 26, scope: !1943)
!2105 = !DILocation(line: 201, column: 28, scope: !1943)
!2106 = !DILocation(line: 201, column: 33, scope: !1943)
!2107 = !DILocation(line: 201, column: 25, scope: !1943)
!2108 = !DILocation(line: 224, column: 30, scope: !1943)
!2109 = !DILocation(line: 224, column: 34, scope: !1943)
!2110 = !DILocation(line: 155, column: 28, scope: !1943)
!2111 = !DILocation(line: 155, column: 33, scope: !1943)
!2112 = !DILocation(line: 155, column: 25, scope: !1943)
!2113 = !DILocation(line: 226, column: 22, scope: !1943)
!2114 = !DILocation(line: 187, column: 28, scope: !1943)
!2115 = !DILocation(line: 187, column: 33, scope: !1943)
!2116 = !DILocation(line: 187, column: 25, scope: !1943)
!2117 = !DILocation(line: 226, column: 26, scope: !1943)
!2118 = !DILocation(line: 203, column: 28, scope: !1943)
!2119 = !DILocation(line: 203, column: 33, scope: !1943)
!2120 = !DILocation(line: 203, column: 25, scope: !1943)
!2121 = !DILocation(line: 226, column: 30, scope: !1943)
!2122 = !DILocation(line: 219, column: 28, scope: !1943)
!2123 = !DILocation(line: 219, column: 33, scope: !1943)
!2124 = !DILocation(line: 219, column: 25, scope: !1943)
!2125 = !DILocation(line: 226, column: 34, scope: !1943)
!2126 = !DILocation(line: 232, column: 22, scope: !1943)
!2127 = !DILocation(line: 232, column: 21, scope: !1943)
!2128 = !DILocation(line: 301, column: 17, scope: !1943)
!2129 = !DILocation(line: 302, column: 19, scope: !1943)
!2130 = !DILocation(line: 315, column: 28, scope: !1943)
!2131 = !DILocation(line: 315, column: 33, scope: !1943)
!2132 = !DILocation(line: 315, column: 25, scope: !1943)
!2133 = !DILocation(line: 230, column: 22, scope: !1943)
!2134 = !DILocation(line: 230, column: 21, scope: !1943)
!2135 = !DILocation(line: 307, column: 17, scope: !1943)
!2136 = !DILocation(line: 308, column: 19, scope: !1943)
!2137 = !DILocation(line: 314, column: 28, scope: !1943)
!2138 = !DILocation(line: 314, column: 33, scope: !1943)
!2139 = !DILocation(line: 314, column: 25, scope: !1943)
!2140 = !DILocation(line: 234, column: 22, scope: !1943)
!2141 = !DILocation(line: 234, column: 21, scope: !1943)
!2142 = !DILocation(line: 305, column: 17, scope: !1943)
!2143 = !DILocation(line: 306, column: 19, scope: !1943)
!2144 = !DILocation(line: 313, column: 28, scope: !1943)
!2145 = !DILocation(line: 313, column: 33, scope: !1943)
!2146 = !DILocation(line: 313, column: 25, scope: !1943)
!2147 = !DILocation(line: 312, column: 28, scope: !1943)
!2148 = !DILocation(line: 312, column: 33, scope: !1943)
!2149 = !DILocation(line: 312, column: 25, scope: !1943)
!2150 = !DILocation(line: 311, column: 28, scope: !1943)
!2151 = !DILocation(line: 311, column: 33, scope: !1943)
!2152 = !DILocation(line: 311, column: 25, scope: !1943)
!2153 = !DILocation(line: 293, column: 17, scope: !1943)
!2154 = !DILocation(line: 294, column: 19, scope: !1943)
!2155 = !DILocation(line: 287, column: 17, scope: !1943)
!2156 = !DILocation(line: 288, column: 19, scope: !1943)
!2157 = !DILocation(line: 285, column: 17, scope: !1943)
!2158 = !DILocation(line: 286, column: 19, scope: !1943)
!2159 = !DILocation(line: 299, column: 28, scope: !1943)
!2160 = !DILocation(line: 299, column: 33, scope: !1943)
!2161 = !DILocation(line: 299, column: 25, scope: !1943)
!2162 = !DILocation(line: 291, column: 17, scope: !1943)
!2163 = !DILocation(line: 292, column: 19, scope: !1943)
!2164 = !DILocation(line: 298, column: 28, scope: !1943)
!2165 = !DILocation(line: 298, column: 33, scope: !1943)
!2166 = !DILocation(line: 298, column: 25, scope: !1943)
!2167 = !DILocation(line: 289, column: 17, scope: !1943)
!2168 = !DILocation(line: 290, column: 19, scope: !1943)
!2169 = !DILocation(line: 297, column: 28, scope: !1943)
!2170 = !DILocation(line: 297, column: 33, scope: !1943)
!2171 = !DILocation(line: 297, column: 25, scope: !1943)
!2172 = !DILocation(line: 296, column: 28, scope: !1943)
!2173 = !DILocation(line: 296, column: 33, scope: !1943)
!2174 = !DILocation(line: 296, column: 25, scope: !1943)
!2175 = !DILocation(line: 295, column: 28, scope: !1943)
!2176 = !DILocation(line: 295, column: 33, scope: !1943)
!2177 = !DILocation(line: 295, column: 25, scope: !1943)
!2178 = !DILocation(line: 277, column: 17, scope: !1943)
!2179 = !DILocation(line: 278, column: 19, scope: !1943)
!2180 = !DILocation(line: 271, column: 17, scope: !1943)
!2181 = !DILocation(line: 272, column: 19, scope: !1943)
!2182 = !DILocation(line: 269, column: 17, scope: !1943)
!2183 = !DILocation(line: 270, column: 19, scope: !1943)
!2184 = !DILocation(line: 283, column: 28, scope: !1943)
!2185 = !DILocation(line: 283, column: 33, scope: !1943)
!2186 = !DILocation(line: 283, column: 25, scope: !1943)
!2187 = !DILocation(line: 275, column: 17, scope: !1943)
!2188 = !DILocation(line: 276, column: 19, scope: !1943)
!2189 = !DILocation(line: 282, column: 28, scope: !1943)
!2190 = !DILocation(line: 282, column: 33, scope: !1943)
!2191 = !DILocation(line: 282, column: 25, scope: !1943)
!2192 = !DILocation(line: 273, column: 17, scope: !1943)
!2193 = !DILocation(line: 274, column: 19, scope: !1943)
!2194 = !DILocation(line: 281, column: 28, scope: !1943)
!2195 = !DILocation(line: 281, column: 33, scope: !1943)
!2196 = !DILocation(line: 281, column: 25, scope: !1943)
!2197 = !DILocation(line: 280, column: 28, scope: !1943)
!2198 = !DILocation(line: 280, column: 33, scope: !1943)
!2199 = !DILocation(line: 280, column: 25, scope: !1943)
!2200 = !DILocation(line: 279, column: 28, scope: !1943)
!2201 = !DILocation(line: 279, column: 33, scope: !1943)
!2202 = !DILocation(line: 279, column: 25, scope: !1943)
!2203 = !DILocation(line: 261, column: 17, scope: !1943)
!2204 = !DILocation(line: 262, column: 19, scope: !1943)
!2205 = !DILocation(line: 255, column: 17, scope: !1943)
!2206 = !DILocation(line: 256, column: 19, scope: !1943)
!2207 = !DILocation(line: 253, column: 17, scope: !1943)
!2208 = !DILocation(line: 254, column: 19, scope: !1943)
!2209 = !DILocation(line: 267, column: 28, scope: !1943)
!2210 = !DILocation(line: 267, column: 33, scope: !1943)
!2211 = !DILocation(line: 267, column: 25, scope: !1943)
!2212 = !DILocation(line: 259, column: 17, scope: !1943)
!2213 = !DILocation(line: 260, column: 19, scope: !1943)
!2214 = !DILocation(line: 266, column: 28, scope: !1943)
!2215 = !DILocation(line: 266, column: 33, scope: !1943)
!2216 = !DILocation(line: 266, column: 25, scope: !1943)
!2217 = !DILocation(line: 257, column: 17, scope: !1943)
!2218 = !DILocation(line: 258, column: 19, scope: !1943)
!2219 = !DILocation(line: 265, column: 28, scope: !1943)
!2220 = !DILocation(line: 265, column: 33, scope: !1943)
!2221 = !DILocation(line: 265, column: 25, scope: !1943)
!2222 = !DILocation(line: 264, column: 28, scope: !1943)
!2223 = !DILocation(line: 264, column: 33, scope: !1943)
!2224 = !DILocation(line: 264, column: 25, scope: !1943)
!2225 = !DILocation(line: 263, column: 28, scope: !1943)
!2226 = !DILocation(line: 263, column: 33, scope: !1943)
!2227 = !DILocation(line: 263, column: 25, scope: !1943)
!2228 = !DILocation(line: 244, column: 17, scope: !1943)
!2229 = !DILocation(line: 245, column: 19, scope: !1943)
!2230 = !DILocation(line: 238, column: 17, scope: !1943)
!2231 = !DILocation(line: 239, column: 19, scope: !1943)
!2232 = !DILocation(line: 236, column: 17, scope: !1943)
!2233 = !DILocation(line: 251, column: 28, scope: !1943)
!2234 = !DILocation(line: 251, column: 33, scope: !1943)
!2235 = !DILocation(line: 251, column: 25, scope: !1943)
!2236 = !DILocation(line: 242, column: 17, scope: !1943)
!2237 = !DILocation(line: 243, column: 19, scope: !1943)
!2238 = !DILocation(line: 250, column: 28, scope: !1943)
!2239 = !DILocation(line: 250, column: 33, scope: !1943)
!2240 = !DILocation(line: 250, column: 25, scope: !1943)
!2241 = !DILocation(line: 240, column: 17, scope: !1943)
!2242 = !DILocation(line: 241, column: 19, scope: !1943)
!2243 = !DILocation(line: 249, column: 28, scope: !1943)
!2244 = !DILocation(line: 249, column: 33, scope: !1943)
!2245 = !DILocation(line: 249, column: 25, scope: !1943)
!2246 = !DILocation(line: 248, column: 28, scope: !1943)
!2247 = !DILocation(line: 248, column: 33, scope: !1943)
!2248 = !DILocation(line: 248, column: 25, scope: !1943)
!2249 = !DILocation(line: 247, column: 58, scope: !1943)
!2250 = !DILocation(line: 247, column: 30, scope: !1943)
!2251 = !DILocation(line: 246, column: 28, scope: !1943)
!2252 = !DILocation(line: 246, column: 33, scope: !1943)
!2253 = !DILocation(line: 247, column: 17, scope: !1943)
!2254 = !DILocation(line: 126, column: 47, scope: !1905)
!2255 = !DILocation(line: 126, column: 9, scope: !1905)
!2256 = distinct !{!2256, !1906, !2257, !235}
!2257 = !DILocation(line: 316, column: 9, scope: !1902)
!2258 = !DILocation(line: 319, column: 19, scope: !1847)
!2259 = !DILocation(line: 320, column: 9, scope: !1847)
!2260 = !DILocation(line: 320, column: 19, scope: !1847)
!2261 = !DILocation(line: 321, column: 9, scope: !1847)
!2262 = !DILocation(line: 321, column: 19, scope: !1847)
!2263 = !DILocation(line: 322, column: 9, scope: !1847)
!2264 = !DILocation(line: 322, column: 19, scope: !1847)
!2265 = !DILocation(line: 323, column: 9, scope: !1847)
!2266 = !DILocation(line: 323, column: 19, scope: !1847)
!2267 = !DILocation(line: 324, column: 9, scope: !1847)
!2268 = !DILocation(line: 324, column: 19, scope: !1847)
!2269 = !DILocation(line: 325, column: 9, scope: !1847)
!2270 = !DILocation(line: 325, column: 19, scope: !1847)
!2271 = !DILocation(line: 326, column: 9, scope: !1847)
!2272 = !DILocation(line: 326, column: 19, scope: !1847)
!2273 = !DILocation(line: 327, column: 9, scope: !1847)
!2274 = !DILocation(line: 327, column: 19, scope: !1847)
!2275 = !DILocation(line: 328, column: 9, scope: !1847)
!2276 = !DILocation(line: 328, column: 19, scope: !1847)
!2277 = !DILocation(line: 329, column: 9, scope: !1847)
!2278 = !DILocation(line: 329, column: 19, scope: !1847)
!2279 = !DILocation(line: 330, column: 9, scope: !1847)
!2280 = !DILocation(line: 330, column: 19, scope: !1847)
!2281 = !DILocation(line: 331, column: 9, scope: !1847)
!2282 = !DILocation(line: 331, column: 19, scope: !1847)
!2283 = !DILocation(line: 332, column: 9, scope: !1847)
!2284 = !DILocation(line: 332, column: 19, scope: !1847)
!2285 = !DILocation(line: 333, column: 9, scope: !1847)
!2286 = !DILocation(line: 333, column: 19, scope: !1847)
!2287 = !DILocation(line: 334, column: 9, scope: !1847)
!2288 = !DILocation(line: 334, column: 19, scope: !1847)
!2289 = !DILocation(line: 335, column: 9, scope: !1847)
!2290 = !DILocation(line: 335, column: 19, scope: !1847)
!2291 = !DILocation(line: 336, column: 9, scope: !1847)
!2292 = !DILocation(line: 336, column: 19, scope: !1847)
!2293 = !DILocation(line: 337, column: 9, scope: !1847)
!2294 = !DILocation(line: 337, column: 19, scope: !1847)
!2295 = !DILocation(line: 338, column: 9, scope: !1847)
!2296 = !DILocation(line: 338, column: 19, scope: !1847)
!2297 = !DILocation(line: 339, column: 9, scope: !1847)
!2298 = !DILocation(line: 339, column: 19, scope: !1847)
!2299 = !DILocation(line: 340, column: 9, scope: !1847)
!2300 = !DILocation(line: 340, column: 19, scope: !1847)
!2301 = !DILocation(line: 341, column: 9, scope: !1847)
!2302 = !DILocation(line: 341, column: 19, scope: !1847)
!2303 = !DILocation(line: 342, column: 9, scope: !1847)
!2304 = !DILocation(line: 342, column: 19, scope: !1847)
!2305 = !DILocation(line: 343, column: 9, scope: !1847)
!2306 = !DILocation(line: 343, column: 19, scope: !1847)
!2307 = !DILocation(line: 344, column: 1, scope: !1847)
!2308 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !1746, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2309 = !DILocalVariable(name: "state", arg: 1, scope: !2308, file: !27, line: 550, type: !1748)
!2310 = !DILocation(line: 0, scope: !2308)
!2311 = !DILocation(line: 552, column: 36, scope: !2308)
!2312 = !DILocation(line: 552, column: 3, scope: !2308)
!2313 = !DILocation(line: 553, column: 10, scope: !2308)
!2314 = !DILocation(line: 553, column: 14, scope: !2308)
!2315 = !DILocation(line: 554, column: 1, scope: !2308)
!2316 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2317, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2317 = !DISubroutineType(types: !2318)
!2318 = !{null, !1763, !42, !42, !61}
!2319 = !DILocalVariable(name: "s", arg: 1, scope: !2316, file: !27, line: 405, type: !1763)
!2320 = !DILocation(line: 0, scope: !2316)
!2321 = !DILocalVariable(name: "pos", arg: 2, scope: !2316, file: !27, line: 405, type: !42)
!2322 = !DILocalVariable(name: "r", arg: 3, scope: !2316, file: !27, line: 405, type: !42)
!2323 = !DILocalVariable(name: "p", arg: 4, scope: !2316, file: !27, line: 405, type: !61)
!2324 = !DILocation(line: 407, column: 15, scope: !2316)
!2325 = !DILocation(line: 407, column: 31, scope: !2316)
!2326 = !DILocation(line: 407, column: 27, scope: !2316)
!2327 = !DILocation(line: 407, column: 8, scope: !2316)
!2328 = !DILocation(line: 407, column: 3, scope: !2316)
!2329 = !DILocation(line: 407, column: 12, scope: !2316)
!2330 = !DILocation(line: 408, column: 6, scope: !2316)
!2331 = !DILocation(line: 408, column: 3, scope: !2316)
!2332 = !DILocation(line: 408, column: 12, scope: !2316)
!2333 = !DILocation(line: 409, column: 1, scope: !2316)
!2334 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2335, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2335 = !DISubroutineType(types: !2336)
!2336 = !{null, !60, !1678, !1748}
!2337 = !DILocalVariable(name: "out", arg: 1, scope: !2334, file: !27, line: 566, type: !60)
!2338 = !DILocation(line: 0, scope: !2334)
!2339 = !DILocalVariable(name: "outlen", arg: 2, scope: !2334, file: !27, line: 566, type: !1678)
!2340 = !DILocalVariable(name: "state", arg: 3, scope: !2334, file: !27, line: 566, type: !1748)
!2341 = !DILocation(line: 568, column: 61, scope: !2334)
!2342 = !DILocation(line: 568, column: 16, scope: !2334)
!2343 = !DILocation(line: 568, column: 10, scope: !2334)
!2344 = !DILocation(line: 568, column: 14, scope: !2334)
!2345 = !DILocation(line: 569, column: 1, scope: !2334)
!2346 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2347, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2347 = !DISubroutineType(types: !2348)
!2348 = !{!42, !60, !1678, !1763, !42, !42}
!2349 = !DILocalVariable(name: "out", arg: 1, scope: !2346, file: !27, line: 426, type: !60)
!2350 = !DILocation(line: 0, scope: !2346)
!2351 = !DILocalVariable(name: "outlen", arg: 2, scope: !2346, file: !27, line: 427, type: !1678)
!2352 = !DILocalVariable(name: "s", arg: 3, scope: !2346, file: !27, line: 428, type: !1763)
!2353 = !DILocalVariable(name: "pos", arg: 4, scope: !2346, file: !27, line: 429, type: !42)
!2354 = !DILocalVariable(name: "r", arg: 5, scope: !2346, file: !27, line: 430, type: !42)
!2355 = !DILocation(line: 434, column: 3, scope: !2346)
!2356 = !DILocation(line: 435, column: 12, scope: !2357)
!2357 = distinct !DILexicalBlock(scope: !2358, file: !27, line: 435, column: 8)
!2358 = distinct !DILexicalBlock(scope: !2346, file: !27, line: 434, column: 17)
!2359 = !DILocation(line: 436, column: 7, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !2357, file: !27, line: 435, column: 18)
!2361 = !DILocation(line: 438, column: 5, scope: !2360)
!2362 = !DILocalVariable(name: "i", scope: !2346, file: !27, line: 432, type: !42)
!2363 = !DILocation(line: 439, column: 9, scope: !2364)
!2364 = distinct !DILexicalBlock(scope: !2358, file: !27, line: 439, column: 5)
!2365 = !DILocation(line: 439, scope: !2364)
!2366 = !DILocation(line: 439, column: 17, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2364, file: !27, line: 439, column: 5)
!2368 = !DILocation(line: 439, column: 21, scope: !2367)
!2369 = !DILocation(line: 439, column: 5, scope: !2364)
!2370 = !DILocation(line: 440, column: 19, scope: !2367)
!2371 = !DILocation(line: 440, column: 16, scope: !2367)
!2372 = !DILocation(line: 440, column: 27, scope: !2367)
!2373 = !DILocation(line: 440, column: 23, scope: !2367)
!2374 = !DILocation(line: 440, column: 14, scope: !2367)
!2375 = !DILocation(line: 440, column: 11, scope: !2367)
!2376 = !DILocation(line: 439, column: 41, scope: !2367)
!2377 = !DILocation(line: 439, column: 5, scope: !2367)
!2378 = distinct !{!2378, !2369, !2379, !235}
!2379 = !DILocation(line: 440, column: 32, scope: !2364)
!2380 = !DILocation(line: 441, column: 16, scope: !2358)
!2381 = !DILocation(line: 441, column: 12, scope: !2358)
!2382 = distinct !{!2382, !2355, !2383, !235}
!2383 = !DILocation(line: 443, column: 3, scope: !2346)
!2384 = !DILocation(line: 445, column: 3, scope: !2346)
!2385 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !1781, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2386 = !DILocalVariable(name: "state", arg: 1, scope: !2385, file: !27, line: 580, type: !1748)
!2387 = !DILocation(line: 0, scope: !2385)
!2388 = !DILocalVariable(name: "in", arg: 2, scope: !2385, file: !27, line: 580, type: !64)
!2389 = !DILocalVariable(name: "inlen", arg: 3, scope: !2385, file: !27, line: 580, type: !1678)
!2390 = !DILocation(line: 582, column: 3, scope: !2385)
!2391 = !DILocation(line: 583, column: 10, scope: !2385)
!2392 = !DILocation(line: 583, column: 14, scope: !2385)
!2393 = !DILocation(line: 584, column: 1, scope: !2385)
!2394 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2395, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2395 = !DISubroutineType(types: !2396)
!2396 = !{null, !1763, !42, !64, !1678, !61}
!2397 = !DILocalVariable(name: "s", arg: 1, scope: !2394, file: !27, line: 461, type: !1763)
!2398 = !DILocation(line: 0, scope: !2394)
!2399 = !DILocalVariable(name: "r", arg: 2, scope: !2394, file: !27, line: 462, type: !42)
!2400 = !DILocalVariable(name: "in", arg: 3, scope: !2394, file: !27, line: 463, type: !64)
!2401 = !DILocalVariable(name: "inlen", arg: 4, scope: !2394, file: !27, line: 464, type: !1678)
!2402 = !DILocalVariable(name: "p", arg: 5, scope: !2394, file: !27, line: 465, type: !61)
!2403 = !DILocalVariable(name: "i", scope: !2394, file: !27, line: 467, type: !42)
!2404 = !DILocation(line: 469, column: 7, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2394, file: !27, line: 469, column: 3)
!2406 = !DILocation(line: 469, scope: !2405)
!2407 = !DILocation(line: 469, column: 12, scope: !2408)
!2408 = distinct !DILexicalBlock(scope: !2405, file: !27, line: 469, column: 3)
!2409 = !DILocation(line: 469, column: 3, scope: !2405)
!2410 = !DILocation(line: 472, column: 3, scope: !2394)
!2411 = !DILocation(line: 470, column: 5, scope: !2408)
!2412 = !DILocation(line: 470, column: 10, scope: !2408)
!2413 = !DILocation(line: 469, column: 17, scope: !2408)
!2414 = !DILocation(line: 469, column: 3, scope: !2408)
!2415 = distinct !{!2415, !2409, !2416, !235}
!2416 = !DILocation(line: 470, column: 12, scope: !2405)
!2417 = !DILocation(line: 472, column: 15, scope: !2394)
!2418 = !DILocation(line: 473, column: 5, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2420, file: !27, line: 473, column: 5)
!2420 = distinct !DILexicalBlock(scope: !2394, file: !27, line: 472, column: 21)
!2421 = !DILocation(line: 480, column: 3, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2394, file: !27, line: 480, column: 3)
!2423 = !DILocation(line: 473, scope: !2419)
!2424 = !DILocation(line: 473, column: 14, scope: !2425)
!2425 = distinct !DILexicalBlock(scope: !2419, file: !27, line: 473, column: 5)
!2426 = !DILocation(line: 474, column: 26, scope: !2425)
!2427 = !DILocation(line: 474, column: 24, scope: !2425)
!2428 = !DILocation(line: 474, column: 15, scope: !2425)
!2429 = !DILocation(line: 474, column: 7, scope: !2425)
!2430 = !DILocation(line: 474, column: 12, scope: !2425)
!2431 = !DILocation(line: 473, column: 20, scope: !2425)
!2432 = !DILocation(line: 473, column: 5, scope: !2425)
!2433 = distinct !{!2433, !2418, !2434, !235}
!2434 = !DILocation(line: 474, column: 28, scope: !2419)
!2435 = !DILocation(line: 475, column: 8, scope: !2420)
!2436 = !DILocation(line: 476, column: 11, scope: !2420)
!2437 = !DILocation(line: 477, column: 5, scope: !2420)
!2438 = distinct !{!2438, !2410, !2439, !235}
!2439 = !DILocation(line: 478, column: 3, scope: !2394)
!2440 = !DILocation(line: 480, scope: !2422)
!2441 = !DILocation(line: 480, column: 12, scope: !2442)
!2442 = distinct !DILexicalBlock(scope: !2422, file: !27, line: 480, column: 3)
!2443 = !DILocation(line: 481, column: 25, scope: !2442)
!2444 = !DILocation(line: 481, column: 15, scope: !2442)
!2445 = !DILocation(line: 481, column: 35, scope: !2442)
!2446 = !DILocation(line: 481, column: 31, scope: !2442)
!2447 = !DILocation(line: 481, column: 8, scope: !2442)
!2448 = !DILocation(line: 481, column: 5, scope: !2442)
!2449 = !DILocation(line: 481, column: 12, scope: !2442)
!2450 = !DILocation(line: 480, column: 20, scope: !2442)
!2451 = !DILocation(line: 480, column: 3, scope: !2442)
!2452 = distinct !{!2452, !2421, !2453, !235}
!2453 = !DILocation(line: 481, column: 40, scope: !2422)
!2454 = !DILocation(line: 483, column: 13, scope: !2394)
!2455 = !DILocation(line: 483, column: 29, scope: !2394)
!2456 = !DILocation(line: 483, column: 25, scope: !2394)
!2457 = !DILocation(line: 483, column: 6, scope: !2394)
!2458 = !DILocation(line: 483, column: 3, scope: !2394)
!2459 = !DILocation(line: 483, column: 10, scope: !2394)
!2460 = !DILocation(line: 484, column: 7, scope: !2394)
!2461 = !DILocation(line: 484, column: 10, scope: !2394)
!2462 = !DILocation(line: 484, column: 3, scope: !2394)
!2463 = !DILocation(line: 484, column: 14, scope: !2394)
!2464 = !DILocation(line: 485, column: 1, scope: !2394)
!2465 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2466, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2466 = !DISubroutineType(types: !2467)
!2467 = !{!23, !64}
!2468 = !DILocalVariable(name: "x", arg: 1, scope: !2465, file: !27, line: 22, type: !64)
!2469 = !DILocation(line: 0, scope: !2465)
!2470 = !DILocalVariable(name: "r", scope: !2465, file: !27, line: 24, type: !23)
!2471 = !DILocalVariable(name: "i", scope: !2465, file: !27, line: 23, type: !42)
!2472 = !DILocation(line: 26, column: 7, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2465, file: !27, line: 26, column: 3)
!2474 = !DILocation(line: 26, scope: !2473)
!2475 = !DILocation(line: 26, column: 12, scope: !2476)
!2476 = distinct !DILexicalBlock(scope: !2473, file: !27, line: 26, column: 3)
!2477 = !DILocation(line: 26, column: 3, scope: !2473)
!2478 = !DILocation(line: 27, column: 20, scope: !2476)
!2479 = !DILocation(line: 27, column: 10, scope: !2476)
!2480 = !DILocation(line: 27, column: 29, scope: !2476)
!2481 = !DILocation(line: 27, column: 25, scope: !2476)
!2482 = !DILocation(line: 27, column: 7, scope: !2476)
!2483 = !DILocation(line: 26, column: 16, scope: !2476)
!2484 = !DILocation(line: 26, column: 3, scope: !2476)
!2485 = distinct !{!2485, !2477, !2486, !235}
!2486 = !DILocation(line: 27, column: 30, scope: !2473)
!2487 = !DILocation(line: 29, column: 3, scope: !2465)
!2488 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2335, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2489 = !DILocalVariable(name: "out", arg: 1, scope: !2488, file: !27, line: 598, type: !60)
!2490 = !DILocation(line: 0, scope: !2488)
!2491 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2488, file: !27, line: 598, type: !1678)
!2492 = !DILocalVariable(name: "state", arg: 3, scope: !2488, file: !27, line: 598, type: !1748)
!2493 = !DILocation(line: 600, column: 3, scope: !2488)
!2494 = !DILocation(line: 601, column: 1, scope: !2488)
!2495 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2496, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2496 = !DISubroutineType(types: !2497)
!2497 = !{null, !60, !1678, !1763, !42}
!2498 = !DILocalVariable(name: "out", arg: 1, scope: !2495, file: !27, line: 500, type: !60)
!2499 = !DILocation(line: 0, scope: !2495)
!2500 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2495, file: !27, line: 501, type: !1678)
!2501 = !DILocalVariable(name: "s", arg: 3, scope: !2495, file: !27, line: 502, type: !1763)
!2502 = !DILocalVariable(name: "r", arg: 4, scope: !2495, file: !27, line: 503, type: !42)
!2503 = !DILocation(line: 507, column: 3, scope: !2495)
!2504 = !DILocation(line: 508, column: 5, scope: !2505)
!2505 = distinct !DILexicalBlock(scope: !2495, file: !27, line: 507, column: 18)
!2506 = !DILocalVariable(name: "i", scope: !2495, file: !27, line: 505, type: !42)
!2507 = !DILocation(line: 509, column: 9, scope: !2508)
!2508 = distinct !DILexicalBlock(scope: !2505, file: !27, line: 509, column: 5)
!2509 = !DILocation(line: 509, scope: !2508)
!2510 = !DILocation(line: 509, column: 14, scope: !2511)
!2511 = distinct !DILexicalBlock(scope: !2508, file: !27, line: 509, column: 5)
!2512 = !DILocation(line: 509, column: 5, scope: !2508)
!2513 = !DILocation(line: 510, column: 20, scope: !2511)
!2514 = !DILocation(line: 510, column: 18, scope: !2511)
!2515 = !DILocation(line: 510, column: 24, scope: !2511)
!2516 = !DILocation(line: 510, column: 7, scope: !2511)
!2517 = !DILocation(line: 509, column: 20, scope: !2511)
!2518 = !DILocation(line: 509, column: 5, scope: !2511)
!2519 = distinct !{!2519, !2512, !2520, !235}
!2520 = !DILocation(line: 510, column: 28, scope: !2508)
!2521 = !DILocation(line: 511, column: 9, scope: !2505)
!2522 = !DILocation(line: 512, column: 13, scope: !2505)
!2523 = distinct !{!2523, !2503, !2524, !235}
!2524 = !DILocation(line: 513, column: 3, scope: !2495)
!2525 = !DILocation(line: 514, column: 1, scope: !2495)
!2526 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2527, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2527 = !DISubroutineType(types: !2528)
!2528 = !{null, !60, !23}
!2529 = !DILocalVariable(name: "x", arg: 1, scope: !2526, file: !27, line: 40, type: !60)
!2530 = !DILocation(line: 0, scope: !2526)
!2531 = !DILocalVariable(name: "u", arg: 2, scope: !2526, file: !27, line: 40, type: !23)
!2532 = !DILocalVariable(name: "i", scope: !2526, file: !27, line: 41, type: !42)
!2533 = !DILocation(line: 43, column: 7, scope: !2534)
!2534 = distinct !DILexicalBlock(scope: !2526, file: !27, line: 43, column: 3)
!2535 = !DILocation(line: 43, scope: !2534)
!2536 = !DILocation(line: 43, column: 12, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2534, file: !27, line: 43, column: 3)
!2538 = !DILocation(line: 43, column: 3, scope: !2534)
!2539 = !DILocation(line: 44, column: 18, scope: !2537)
!2540 = !DILocation(line: 44, column: 14, scope: !2537)
!2541 = !DILocation(line: 44, column: 12, scope: !2537)
!2542 = !DILocation(line: 44, column: 5, scope: !2537)
!2543 = !DILocation(line: 44, column: 10, scope: !2537)
!2544 = !DILocation(line: 43, column: 16, scope: !2537)
!2545 = !DILocation(line: 43, column: 3, scope: !2537)
!2546 = distinct !{!2546, !2538, !2547, !235}
!2547 = !DILocation(line: 44, column: 19, scope: !2534)
!2548 = !DILocation(line: 45, column: 1, scope: !2526)
!2549 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !1746, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2550 = !DILocalVariable(name: "state", arg: 1, scope: !2549, file: !27, line: 610, type: !1748)
!2551 = !DILocation(line: 0, scope: !2549)
!2552 = !DILocation(line: 612, column: 3, scope: !2549)
!2553 = !DILocation(line: 613, column: 10, scope: !2549)
!2554 = !DILocation(line: 613, column: 14, scope: !2549)
!2555 = !DILocation(line: 614, column: 1, scope: !2549)
!2556 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !1781, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2557 = !DILocalVariable(name: "state", arg: 1, scope: !2556, file: !27, line: 625, type: !1748)
!2558 = !DILocation(line: 0, scope: !2556)
!2559 = !DILocalVariable(name: "in", arg: 2, scope: !2556, file: !27, line: 625, type: !64)
!2560 = !DILocalVariable(name: "inlen", arg: 3, scope: !2556, file: !27, line: 625, type: !1678)
!2561 = !DILocation(line: 627, column: 47, scope: !2556)
!2562 = !DILocation(line: 627, column: 16, scope: !2556)
!2563 = !DILocation(line: 627, column: 10, scope: !2556)
!2564 = !DILocation(line: 627, column: 14, scope: !2556)
!2565 = !DILocation(line: 628, column: 1, scope: !2556)
!2566 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !1746, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2567 = !DILocalVariable(name: "state", arg: 1, scope: !2566, file: !27, line: 637, type: !1748)
!2568 = !DILocation(line: 0, scope: !2566)
!2569 = !DILocation(line: 639, column: 36, scope: !2566)
!2570 = !DILocation(line: 639, column: 3, scope: !2566)
!2571 = !DILocation(line: 640, column: 10, scope: !2566)
!2572 = !DILocation(line: 640, column: 14, scope: !2566)
!2573 = !DILocation(line: 641, column: 1, scope: !2566)
!2574 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2335, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2575 = !DILocalVariable(name: "out", arg: 1, scope: !2574, file: !27, line: 653, type: !60)
!2576 = !DILocation(line: 0, scope: !2574)
!2577 = !DILocalVariable(name: "outlen", arg: 2, scope: !2574, file: !27, line: 653, type: !1678)
!2578 = !DILocalVariable(name: "state", arg: 3, scope: !2574, file: !27, line: 653, type: !1748)
!2579 = !DILocation(line: 655, column: 61, scope: !2574)
!2580 = !DILocation(line: 655, column: 16, scope: !2574)
!2581 = !DILocation(line: 655, column: 10, scope: !2574)
!2582 = !DILocation(line: 655, column: 14, scope: !2574)
!2583 = !DILocation(line: 656, column: 1, scope: !2574)
!2584 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !1781, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2585 = !DILocalVariable(name: "state", arg: 1, scope: !2584, file: !27, line: 667, type: !1748)
!2586 = !DILocation(line: 0, scope: !2584)
!2587 = !DILocalVariable(name: "in", arg: 2, scope: !2584, file: !27, line: 667, type: !64)
!2588 = !DILocalVariable(name: "inlen", arg: 3, scope: !2584, file: !27, line: 667, type: !1678)
!2589 = !DILocation(line: 669, column: 3, scope: !2584)
!2590 = !DILocation(line: 670, column: 10, scope: !2584)
!2591 = !DILocation(line: 670, column: 14, scope: !2584)
!2592 = !DILocation(line: 671, column: 1, scope: !2584)
!2593 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2335, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2594 = !DILocalVariable(name: "out", arg: 1, scope: !2593, file: !27, line: 685, type: !60)
!2595 = !DILocation(line: 0, scope: !2593)
!2596 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2593, file: !27, line: 685, type: !1678)
!2597 = !DILocalVariable(name: "state", arg: 3, scope: !2593, file: !27, line: 685, type: !1748)
!2598 = !DILocation(line: 687, column: 3, scope: !2593)
!2599 = !DILocation(line: 688, column: 1, scope: !2593)
!2600 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2601, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2601 = !DISubroutineType(types: !2602)
!2602 = !{null, !60, !1678, !64, !1678}
!2603 = !DILocalVariable(name: "out", arg: 1, scope: !2600, file: !27, line: 700, type: !60)
!2604 = !DILocation(line: 0, scope: !2600)
!2605 = !DILocalVariable(name: "outlen", arg: 2, scope: !2600, file: !27, line: 700, type: !1678)
!2606 = !DILocalVariable(name: "in", arg: 3, scope: !2600, file: !27, line: 700, type: !64)
!2607 = !DILocalVariable(name: "inlen", arg: 4, scope: !2600, file: !27, line: 700, type: !1678)
!2608 = !DILocalVariable(name: "state", scope: !2600, file: !27, line: 703, type: !1749)
!2609 = !DILocation(line: 703, column: 16, scope: !2600)
!2610 = !DILocation(line: 705, column: 3, scope: !2600)
!2611 = !DILocation(line: 706, column: 19, scope: !2600)
!2612 = !DILocalVariable(name: "nblocks", scope: !2600, file: !27, line: 702, type: !1678)
!2613 = !DILocation(line: 707, column: 3, scope: !2600)
!2614 = !DILocation(line: 708, column: 20, scope: !2600)
!2615 = !DILocation(line: 708, column: 10, scope: !2600)
!2616 = !DILocation(line: 709, column: 17, scope: !2600)
!2617 = !DILocation(line: 709, column: 7, scope: !2600)
!2618 = !DILocation(line: 710, column: 3, scope: !2600)
!2619 = !DILocation(line: 711, column: 1, scope: !2600)
!2620 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2601, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2621 = !DILocalVariable(name: "out", arg: 1, scope: !2620, file: !27, line: 723, type: !60)
!2622 = !DILocation(line: 0, scope: !2620)
!2623 = !DILocalVariable(name: "outlen", arg: 2, scope: !2620, file: !27, line: 723, type: !1678)
!2624 = !DILocalVariable(name: "in", arg: 3, scope: !2620, file: !27, line: 723, type: !64)
!2625 = !DILocalVariable(name: "inlen", arg: 4, scope: !2620, file: !27, line: 723, type: !1678)
!2626 = !DILocalVariable(name: "state", scope: !2620, file: !27, line: 726, type: !1749)
!2627 = !DILocation(line: 726, column: 16, scope: !2620)
!2628 = !DILocation(line: 728, column: 3, scope: !2620)
!2629 = !DILocation(line: 729, column: 19, scope: !2620)
!2630 = !DILocalVariable(name: "nblocks", scope: !2620, file: !27, line: 725, type: !1678)
!2631 = !DILocation(line: 730, column: 3, scope: !2620)
!2632 = !DILocation(line: 731, column: 20, scope: !2620)
!2633 = !DILocation(line: 731, column: 10, scope: !2620)
!2634 = !DILocation(line: 732, column: 17, scope: !2620)
!2635 = !DILocation(line: 732, column: 7, scope: !2620)
!2636 = !DILocation(line: 733, column: 3, scope: !2620)
!2637 = !DILocation(line: 734, column: 1, scope: !2620)
!2638 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2639, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{null, !60, !64, !1678}
!2641 = !DILocalVariable(name: "h", arg: 1, scope: !2638, file: !27, line: 745, type: !60)
!2642 = !DILocation(line: 0, scope: !2638)
!2643 = !DILocalVariable(name: "in", arg: 2, scope: !2638, file: !27, line: 745, type: !64)
!2644 = !DILocalVariable(name: "inlen", arg: 3, scope: !2638, file: !27, line: 745, type: !1678)
!2645 = !DILocalVariable(name: "s", scope: !2638, file: !27, line: 748, type: !194)
!2646 = !DILocation(line: 748, column: 12, scope: !2638)
!2647 = !DILocation(line: 750, column: 3, scope: !2638)
!2648 = !DILocation(line: 751, column: 3, scope: !2638)
!2649 = !DILocalVariable(name: "i", scope: !2638, file: !27, line: 747, type: !42)
!2650 = !DILocation(line: 752, column: 7, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2638, file: !27, line: 752, column: 3)
!2652 = !DILocation(line: 752, scope: !2651)
!2653 = !DILocation(line: 752, column: 12, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2651, file: !27, line: 752, column: 3)
!2655 = !DILocation(line: 752, column: 3, scope: !2651)
!2656 = !DILocation(line: 753, column: 16, scope: !2654)
!2657 = !DILocation(line: 753, column: 14, scope: !2654)
!2658 = !DILocation(line: 753, column: 19, scope: !2654)
!2659 = !DILocation(line: 753, column: 5, scope: !2654)
!2660 = !DILocation(line: 752, column: 16, scope: !2654)
!2661 = !DILocation(line: 752, column: 3, scope: !2654)
!2662 = distinct !{!2662, !2655, !2663, !235}
!2663 = !DILocation(line: 753, column: 23, scope: !2651)
!2664 = !DILocation(line: 754, column: 1, scope: !2638)
!2665 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2639, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2666 = !DILocalVariable(name: "h", arg: 1, scope: !2665, file: !27, line: 765, type: !60)
!2667 = !DILocation(line: 0, scope: !2665)
!2668 = !DILocalVariable(name: "in", arg: 2, scope: !2665, file: !27, line: 765, type: !64)
!2669 = !DILocalVariable(name: "inlen", arg: 3, scope: !2665, file: !27, line: 765, type: !1678)
!2670 = !DILocalVariable(name: "s", scope: !2665, file: !27, line: 768, type: !194)
!2671 = !DILocation(line: 768, column: 12, scope: !2665)
!2672 = !DILocation(line: 770, column: 3, scope: !2665)
!2673 = !DILocation(line: 771, column: 3, scope: !2665)
!2674 = !DILocalVariable(name: "i", scope: !2665, file: !27, line: 767, type: !42)
!2675 = !DILocation(line: 772, column: 7, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2665, file: !27, line: 772, column: 3)
!2677 = !DILocation(line: 772, scope: !2676)
!2678 = !DILocation(line: 772, column: 12, scope: !2679)
!2679 = distinct !DILexicalBlock(scope: !2676, file: !27, line: 772, column: 3)
!2680 = !DILocation(line: 772, column: 3, scope: !2676)
!2681 = !DILocation(line: 773, column: 16, scope: !2679)
!2682 = !DILocation(line: 773, column: 14, scope: !2679)
!2683 = !DILocation(line: 773, column: 19, scope: !2679)
!2684 = !DILocation(line: 773, column: 5, scope: !2679)
!2685 = !DILocation(line: 772, column: 16, scope: !2679)
!2686 = !DILocation(line: 772, column: 3, scope: !2679)
!2687 = distinct !{!2687, !2680, !2688, !235}
!2688 = !DILocation(line: 773, column: 23, scope: !2676)
!2689 = !DILocation(line: 774, column: 1, scope: !2665)
!2690 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !2691, file: !2691, line: 18, type: !2692, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2691 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2692 = !DISubroutineType(types: !2693)
!2693 = !{null, !2694, !64, !61, !61}
!2694 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2695, size: 32)
!2695 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !2696)
!2696 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !2697)
!2697 = !{!2698, !2699}
!2698 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2696, file: !190, line: 15, baseType: !194, size: 1600)
!2699 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2696, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!2700 = !DILocalVariable(name: "state", arg: 1, scope: !2690, file: !2691, line: 18, type: !2694)
!2701 = !DILocation(line: 0, scope: !2690)
!2702 = !DILocalVariable(name: "seed", arg: 2, scope: !2690, file: !2691, line: 19, type: !64)
!2703 = !DILocalVariable(name: "x", arg: 3, scope: !2690, file: !2691, line: 20, type: !61)
!2704 = !DILocalVariable(name: "y", arg: 4, scope: !2690, file: !2691, line: 21, type: !61)
!2705 = !DILocalVariable(name: "extseed", scope: !2690, file: !2691, line: 23, type: !2706)
!2706 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !2707)
!2707 = !{!2708}
!2708 = !DISubrange(count: 34)
!2709 = !DILocation(line: 23, column: 11, scope: !2690)
!2710 = !DILocation(line: 25, column: 3, scope: !2690)
!2711 = !DILocation(line: 26, column: 3, scope: !2690)
!2712 = !DILocation(line: 26, column: 29, scope: !2690)
!2713 = !DILocation(line: 27, column: 3, scope: !2690)
!2714 = !DILocation(line: 27, column: 29, scope: !2690)
!2715 = !DILocation(line: 29, column: 3, scope: !2690)
!2716 = !DILocation(line: 30, column: 1, scope: !2690)
!2717 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !2691, file: !2691, line: 43, type: !2718, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2718 = !DISubroutineType(types: !2719)
!2719 = !{null, !60, !1678, !64, !61}
!2720 = !DILocalVariable(name: "out", arg: 1, scope: !2717, file: !2691, line: 43, type: !60)
!2721 = !DILocation(line: 0, scope: !2717)
!2722 = !DILocalVariable(name: "outlen", arg: 2, scope: !2717, file: !2691, line: 43, type: !1678)
!2723 = !DILocalVariable(name: "key", arg: 3, scope: !2717, file: !2691, line: 43, type: !64)
!2724 = !DILocalVariable(name: "nonce", arg: 4, scope: !2717, file: !2691, line: 43, type: !61)
!2725 = !DILocalVariable(name: "extkey", scope: !2717, file: !2691, line: 45, type: !2726)
!2726 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !2727)
!2727 = !{!2728}
!2728 = !DISubrange(count: 33)
!2729 = !DILocation(line: 45, column: 11, scope: !2717)
!2730 = !DILocation(line: 47, column: 3, scope: !2717)
!2731 = !DILocation(line: 48, column: 3, scope: !2717)
!2732 = !DILocation(line: 48, column: 26, scope: !2717)
!2733 = !DILocation(line: 50, column: 3, scope: !2717)
!2734 = !DILocation(line: 51, column: 1, scope: !2717)
!2735 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !2691, file: !2691, line: 64, type: !489, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2736 = !DILocalVariable(name: "out", arg: 1, scope: !2735, file: !2691, line: 64, type: !60)
!2737 = !DILocation(line: 0, scope: !2735)
!2738 = !DILocalVariable(name: "key", arg: 2, scope: !2735, file: !2691, line: 64, type: !64)
!2739 = !DILocalVariable(name: "input", arg: 3, scope: !2735, file: !2691, line: 64, type: !64)
!2740 = !DILocalVariable(name: "s", scope: !2735, file: !2691, line: 66, type: !2695)
!2741 = !DILocation(line: 66, column: 16, scope: !2735)
!2742 = !DILocation(line: 68, column: 3, scope: !2735)
!2743 = !DILocation(line: 69, column: 3, scope: !2735)
!2744 = !DILocation(line: 70, column: 3, scope: !2735)
!2745 = !DILocation(line: 71, column: 3, scope: !2735)
!2746 = !DILocation(line: 72, column: 3, scope: !2735)
!2747 = !DILocation(line: 73, column: 1, scope: !2735)
