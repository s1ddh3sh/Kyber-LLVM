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
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #3, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !77
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
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !90
  %call = call i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !91
  ret i32 0, !dbg !92
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !93 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #3, !dbg !106
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !107
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !108
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !109
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !112 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !113, !DIExpression(), !114)
    #dbg_value(ptr %ss, !115, !DIExpression(), !114)
    #dbg_value(ptr %pk, !116, !DIExpression(), !114)
    #dbg_declare(ptr %coins, !117, !DIExpression(), !121)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !122
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !125 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !128, !DIExpression(), !129)
    #dbg_value(ptr %ct, !130, !DIExpression(), !129)
    #dbg_value(ptr %sk, !131, !DIExpression(), !129)
    #dbg_declare(ptr %buf, !132, !DIExpression(), !133)
    #dbg_declare(ptr %kr, !134, !DIExpression(), !135)
    #dbg_declare(ptr %cmp, !136, !DIExpression(), !140)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !141
    #dbg_value(ptr %add.ptr, !142, !DIExpression(), !129)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !143
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !144
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !145
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !146
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !147
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !148
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !149
  %call12 = call i32 @pqcrystals_kyber768_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1088) #3, !dbg !150
    #dbg_value(i32 %call12, !151, !DIExpression(), !129)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !152
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !152
  %tobool.not = icmp eq i32 %call12, 0, !dbg !153
  %conv = zext i1 %tobool.not to i8, !dbg !153
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !156 {
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
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !203
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end22, !dbg !205

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !206

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !209
    #dbg_value(i32 %j.0, !210, !DIExpression(), !178)
  %exitcond = icmp ne i32 %j.0, 3, !dbg !211
  br i1 %exitcond, label %for.body3, label %for.inc20, !dbg !206

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !213
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !213

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !216
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !216
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !216
  br label %if.end, !dbg !216

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !217
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !217
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !218
    #dbg_value(i32 504, !219, !DIExpression(), !178)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !220
  %arrayidx7 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !220
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
  %arrayidx15 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !228
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
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !289 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x %struct.polyvec], align 2
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
  store i8 3, ptr %arrayidx, align 1, !dbg !313
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !314
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !315
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !319
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !293
    #dbg_value(i8 %nonce.0, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.0, !316, !DIExpression(), !293)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !320
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !322

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !323

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !325
    #dbg_value(i8 %nonce.0, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !326
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !327
    #dbg_value(i8 %inc, !301, !DIExpression(), !293)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !328
    #dbg_value(i32 %inc7, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !329, !llvm.loop !330

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc15, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !332
  %nonce.1 = phi i8 [ %inc13, %for.body10 ], [ 3, %for.cond8.preheader ], !dbg !293
    #dbg_value(i8 %nonce.1, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.1, !316, !DIExpression(), !293)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !333
  br i1 %exitcond1, label %for.body10, label %for.end16, !dbg !323

for.body10:                                       ; preds = %for.cond8
  %arrayidx12 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !335
    #dbg_value(i8 %nonce.1, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !336
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !337
    #dbg_value(i8 %inc13, !301, !DIExpression(), !293)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !338
    #dbg_value(i32 %inc15, !316, !DIExpression(), !293)
  br label %for.cond8, !dbg !339, !llvm.loop !340

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !342
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !343
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !344

for.cond17:                                       ; preds = %for.body19, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.body19 ], !dbg !346
    #dbg_value(i32 %i.2, !316, !DIExpression(), !293)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !347
  br i1 %exitcond2, label %for.body19, label %for.end27, !dbg !349

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !350
  %arrayidx22 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !352
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #3, !dbg !353
  %arrayidx24 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !354
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef nonnull %arrayidx24) #3, !dbg !355
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !356
    #dbg_value(i32 %inc26, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !357, !llvm.loop !358

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !360
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !361
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !362
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !363
  ret void, !dbg !364
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef %sk) unnamed_addr #0 !dbg !365 {
entry:
    #dbg_value(ptr %r, !368, !DIExpression(), !369)
    #dbg_value(ptr %sk, !370, !DIExpression(), !369)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #3, !dbg !371
  ret void, !dbg !372
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) unnamed_addr #0 !dbg !373 {
entry:
    #dbg_value(ptr %r, !376, !DIExpression(), !377)
    #dbg_value(ptr %pk, !378, !DIExpression(), !377)
    #dbg_value(ptr %seed, !379, !DIExpression(), !377)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #3, !dbg !380
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1152, !dbg !381
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %seed, i32 noundef 32) #4, !dbg !382
  ret void, !dbg !383
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !384 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [3 x %struct.polyvec], align 2
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
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !412
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !413
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !417
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !388
    #dbg_value(i8 %nonce.0, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.0, !414, !DIExpression(), !388)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !418
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !420

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !421

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !423
    #dbg_value(i8 %nonce.0, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !424
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !425
    #dbg_value(i8 %inc, !394, !DIExpression(), !388)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !426
    #dbg_value(i32 %inc4, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !427, !llvm.loop !428

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc13, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !430
  %nonce.1 = phi i8 [ %inc11, %for.body7 ], [ 3, %for.cond5.preheader ], !dbg !388
    #dbg_value(i8 %nonce.1, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.1, !414, !DIExpression(), !388)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !431
  br i1 %exitcond1, label %for.body7, label %for.end14, !dbg !421

for.body7:                                        ; preds = %for.cond5
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !433
    #dbg_value(i8 %nonce.1, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !434
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !435
    #dbg_value(i8 %inc11, !394, !DIExpression(), !388)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !436
    #dbg_value(i32 %inc13, !414, !DIExpression(), !388)
  br label %for.cond5, !dbg !437, !llvm.loop !438

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 6) #3, !dbg !440
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !441
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !442

for.cond16:                                       ; preds = %for.body18, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.body18 ], !dbg !444
    #dbg_value(i32 %i.2, !414, !DIExpression(), !388)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !445
  br i1 %exitcond2, label %for.body18, label %for.end23, !dbg !447

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !448
  %arrayidx20 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !449
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #3, !dbg !450
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !451
    #dbg_value(i32 %inc22, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !452, !llvm.loop !453

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !455
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !456
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !457
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !458
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !459
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !460
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !461
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !462
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !463
  ret void, !dbg !464
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !465 {
entry:
    #dbg_value(ptr %pk, !468, !DIExpression(), !469)
    #dbg_value(ptr %seed, !470, !DIExpression(), !469)
    #dbg_value(ptr %packedpk, !471, !DIExpression(), !469)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #3, !dbg !472
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1152, !dbg !473
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !474
  ret void, !dbg !475
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) unnamed_addr #0 !dbg !476 {
entry:
    #dbg_value(ptr %r, !480, !DIExpression(), !481)
    #dbg_value(ptr %b, !482, !DIExpression(), !481)
    #dbg_value(ptr %v, !483, !DIExpression(), !481)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #3, !dbg !484
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 960, !dbg !485
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef %v) #3, !dbg !486
  ret void, !dbg !487
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !488 {
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
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !505
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !506
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !507
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !508
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !509
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !510
  ret void, !dbg !511
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) unnamed_addr #0 !dbg !512 {
entry:
    #dbg_value(ptr %b, !515, !DIExpression(), !516)
    #dbg_value(ptr %v, !517, !DIExpression(), !516)
    #dbg_value(ptr %c, !518, !DIExpression(), !516)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #3, !dbg !519
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !520
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %v, ptr noundef nonnull %add.ptr) #3, !dbg !521
  ret void, !dbg !522
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !523 {
entry:
    #dbg_value(ptr %sk, !526, !DIExpression(), !527)
    #dbg_value(ptr %packedsk, !528, !DIExpression(), !527)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #3, !dbg !529
  ret void, !dbg !530
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !531 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !558
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
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !575
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !632 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !645
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
  %arrayidx47 = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !699
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !717 {
entry:
    #dbg_value(ptr %r, !718, !DIExpression(), !719)
    #dbg_value(ptr %a, !720, !DIExpression(), !719)
    #dbg_value(i32 0, !721, !DIExpression(), !719)
  br label %for.cond, !dbg !722

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !724
    #dbg_value(i32 %i.0, !721, !DIExpression(), !719)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !725
  br i1 %exitcond, label %for.body, label %for.end, !dbg !727

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !728
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !729
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !730
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !731
  %inc = add nuw nsw i32 %i.0, 1, !dbg !732
    #dbg_value(i32 %inc, !721, !DIExpression(), !719)
  br label %for.cond, !dbg !733, !llvm.loop !734

for.end:                                          ; preds = %for.cond
  ret void, !dbg !736
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !737 {
entry:
    #dbg_value(ptr %r, !738, !DIExpression(), !739)
    #dbg_value(ptr %a, !740, !DIExpression(), !739)
    #dbg_value(i32 0, !741, !DIExpression(), !739)
  br label %for.cond, !dbg !742

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !744
    #dbg_value(i32 %i.0, !741, !DIExpression(), !739)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !745
  br i1 %exitcond, label %for.body, label %for.end, !dbg !747

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !748
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !749
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !750
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !751
  %inc = add nuw nsw i32 %i.0, 1, !dbg !752
    #dbg_value(i32 %inc, !741, !DIExpression(), !739)
  br label %for.cond, !dbg !753, !llvm.loop !754

for.end:                                          ; preds = %for.cond
  ret void, !dbg !756
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !757 {
entry:
    #dbg_value(ptr %r, !760, !DIExpression(), !761)
    #dbg_value(i32 0, !762, !DIExpression(), !761)
  br label %for.cond, !dbg !763

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !765
    #dbg_value(i32 %i.0, !762, !DIExpression(), !761)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !766
  br i1 %exitcond, label %for.body, label %for.end, !dbg !768

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !769
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !770
  %inc = add nuw nsw i32 %i.0, 1, !dbg !771
    #dbg_value(i32 %inc, !762, !DIExpression(), !761)
  br label %for.cond, !dbg !772, !llvm.loop !773

for.end:                                          ; preds = %for.cond
  ret void, !dbg !775
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !776 {
entry:
    #dbg_value(ptr %r, !777, !DIExpression(), !778)
    #dbg_value(i32 0, !779, !DIExpression(), !778)
  br label %for.cond, !dbg !780

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !782
    #dbg_value(i32 %i.0, !779, !DIExpression(), !778)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !783
  br i1 %exitcond, label %for.body, label %for.end, !dbg !785

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !786
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !787
  %inc = add nuw nsw i32 %i.0, 1, !dbg !788
    #dbg_value(i32 %inc, !779, !DIExpression(), !778)
  br label %for.cond, !dbg !789, !llvm.loop !790

for.end:                                          ; preds = %for.cond
  ret void, !dbg !792
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !793 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !797, !DIExpression(), !798)
    #dbg_value(ptr %a, !799, !DIExpression(), !798)
    #dbg_value(ptr %b, !800, !DIExpression(), !798)
    #dbg_declare(ptr %t, !801, !DIExpression(), !802)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !803
    #dbg_value(i32 1, !804, !DIExpression(), !798)
  br label %for.cond, !dbg !805

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !807
    #dbg_value(i32 %i.0, !804, !DIExpression(), !798)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !808
  br i1 %exitcond, label %for.body, label %for.end, !dbg !810

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !811
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !813
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #3, !dbg !814
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !815
  %inc = add nuw nsw i32 %i.0, 1, !dbg !816
    #dbg_value(i32 %inc, !804, !DIExpression(), !798)
  br label %for.cond, !dbg !817, !llvm.loop !818

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !820
  ret void, !dbg !821
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !822 {
entry:
    #dbg_value(ptr %r, !823, !DIExpression(), !824)
    #dbg_value(i32 0, !825, !DIExpression(), !824)
  br label %for.cond, !dbg !826

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !828
    #dbg_value(i32 %i.0, !825, !DIExpression(), !824)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !829
  br i1 %exitcond, label %for.body, label %for.end, !dbg !831

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !832
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !833
  %inc = add nuw nsw i32 %i.0, 1, !dbg !834
    #dbg_value(i32 %inc, !825, !DIExpression(), !824)
  br label %for.cond, !dbg !835, !llvm.loop !836

for.end:                                          ; preds = %for.cond
  ret void, !dbg !838
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !839 {
entry:
    #dbg_value(ptr %r, !842, !DIExpression(), !843)
    #dbg_value(ptr %a, !844, !DIExpression(), !843)
    #dbg_value(ptr %b, !845, !DIExpression(), !843)
    #dbg_value(i32 0, !846, !DIExpression(), !843)
  br label %for.cond, !dbg !847

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !849
    #dbg_value(i32 %i.0, !846, !DIExpression(), !843)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !850
  br i1 %exitcond, label %for.body, label %for.end, !dbg !852

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !853
  %arrayidx2 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !854
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !855
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #3, !dbg !856
  %inc = add nuw nsw i32 %i.0, 1, !dbg !857
    #dbg_value(i32 %inc, !846, !DIExpression(), !843)
  br label %for.cond, !dbg !858, !llvm.loop !859

for.end:                                          ; preds = %for.cond
  ret void, !dbg !861
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !862 {
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
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !941 {
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
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !983 {
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
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1027 {
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
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1066 {
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
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #3, !dbg !1094
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
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1104 {
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
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1145 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1148, !DIExpression(), !1149)
    #dbg_value(ptr %seed, !1150, !DIExpression(), !1149)
    #dbg_value(i8 %nonce, !1151, !DIExpression(), !1149)
    #dbg_declare(ptr %buf, !1152, !DIExpression(), !1154)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1155
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1156
  ret void, !dbg !1157
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1158 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1159, !DIExpression(), !1160)
    #dbg_value(ptr %seed, !1161, !DIExpression(), !1160)
    #dbg_value(i8 %nonce, !1162, !DIExpression(), !1160)
    #dbg_declare(ptr %buf, !1163, !DIExpression(), !1164)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1165
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1166
  ret void, !dbg !1167
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1168 {
entry:
    #dbg_value(ptr %r, !1171, !DIExpression(), !1172)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #3, !dbg !1173
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1174
  ret void, !dbg !1175
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1176 {
entry:
    #dbg_value(ptr %r, !1177, !DIExpression(), !1178)
    #dbg_value(i32 0, !1179, !DIExpression(), !1178)
  br label %for.cond, !dbg !1180

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1182
    #dbg_value(i32 %i.0, !1179, !DIExpression(), !1178)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1183
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1185

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1186
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1186
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1187
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1188
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1189
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1190
    #dbg_value(i32 %inc, !1179, !DIExpression(), !1178)
  br label %for.cond, !dbg !1191, !llvm.loop !1192

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1194
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1195 {
entry:
    #dbg_value(ptr %r, !1196, !DIExpression(), !1197)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #3, !dbg !1198
  ret void, !dbg !1199
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1200 {
entry:
    #dbg_value(ptr %r, !1203, !DIExpression(), !1204)
    #dbg_value(ptr %a, !1205, !DIExpression(), !1204)
    #dbg_value(ptr %b, !1206, !DIExpression(), !1204)
    #dbg_value(i32 0, !1207, !DIExpression(), !1204)
  br label %for.cond, !dbg !1208

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1210
    #dbg_value(i32 %i.0, !1207, !DIExpression(), !1204)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1211
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1213

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1214
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1216
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !1217
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !1218
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !1219
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !1220
  %add = or disjoint i32 %i.0, 64, !dbg !1221
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1222
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1222
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #3, !dbg !1223
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1224
  %add10 = or disjoint i32 %mul9, 2, !dbg !1225
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !1226
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !1227
  %add14 = or disjoint i32 %mul13, 2, !dbg !1228
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !1229
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !1230
  %add18 = or disjoint i32 %mul17, 2, !dbg !1231
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !1232
  %add20 = or disjoint i32 %i.0, 64, !dbg !1233
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add20, !dbg !1234
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1234
  %sub = sub i16 0, %1, !dbg !1235
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #3, !dbg !1236
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1237
    #dbg_value(i32 %inc, !1207, !DIExpression(), !1204)
  br label %for.cond, !dbg !1238, !llvm.loop !1239

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1241
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1242 {
entry:
    #dbg_value(ptr %r, !1243, !DIExpression(), !1244)
    #dbg_value(i16 1353, !1245, !DIExpression(), !1244)
    #dbg_value(i32 0, !1246, !DIExpression(), !1244)
  br label %for.cond, !dbg !1247

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1249
    #dbg_value(i32 %i.0, !1246, !DIExpression(), !1244)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1250
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1252

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1253
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1253
  %conv = sext i16 %0 to i32, !dbg !1254
  %mul = mul nsw i32 %conv, 1353, !dbg !1255
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1256
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1257
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1258
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1259
    #dbg_value(i32 %inc, !1246, !DIExpression(), !1244)
  br label %for.cond, !dbg !1260, !llvm.loop !1261

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1263
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1264 {
entry:
    #dbg_value(ptr %r, !1265, !DIExpression(), !1266)
    #dbg_value(ptr %a, !1267, !DIExpression(), !1266)
    #dbg_value(ptr %b, !1268, !DIExpression(), !1266)
    #dbg_value(i32 0, !1269, !DIExpression(), !1266)
  br label %for.cond, !dbg !1270

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1272
    #dbg_value(i32 %i.0, !1269, !DIExpression(), !1266)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1273
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1275

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1276
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1276
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1277
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1277
  %add = add i16 %0, %1, !dbg !1278
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1279
  store i16 %add, ptr %arrayidx6, align 2, !dbg !1280
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1281
    #dbg_value(i32 %inc, !1269, !DIExpression(), !1266)
  br label %for.cond, !dbg !1282, !llvm.loop !1283

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1285
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1286 {
entry:
    #dbg_value(ptr %r, !1287, !DIExpression(), !1288)
    #dbg_value(ptr %a, !1289, !DIExpression(), !1288)
    #dbg_value(ptr %b, !1290, !DIExpression(), !1288)
    #dbg_value(i32 0, !1291, !DIExpression(), !1288)
  br label %for.cond, !dbg !1292

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1294
    #dbg_value(i32 %i.0, !1291, !DIExpression(), !1288)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1295
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1297

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1298
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1298
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1299
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1299
  %sub = sub i16 %0, %1, !dbg !1300
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1301
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !1302
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1303
    #dbg_value(i32 %inc, !1291, !DIExpression(), !1288)
  br label %for.cond, !dbg !1304, !llvm.loop !1305

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1307
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1308 {
entry:
    #dbg_value(ptr %r, !1311, !DIExpression(), !1312)
    #dbg_value(i32 1, !1313, !DIExpression(), !1312)
    #dbg_value(i32 128, !1314, !DIExpression(), !1312)
  br label %for.cond, !dbg !1315

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1317
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1318
    #dbg_value(i32 %k.0, !1313, !DIExpression(), !1312)
    #dbg_value(i32 %len.0, !1314, !DIExpression(), !1312)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1319
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1321

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1322

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1325
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1312
    #dbg_value(i32 %k.1, !1313, !DIExpression(), !1312)
    #dbg_value(i32 %start.0, !1326, !DIExpression(), !1312)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1327
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1322

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1313, !DIExpression(), !1312)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1329
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1329
    #dbg_value(i16 %0, !1331, !DIExpression(), !1312)
    #dbg_value(i32 %start.0, !1332, !DIExpression(), !1312)
  br label %for.cond4, !dbg !1333

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1335
    #dbg_value(i32 %j.0, !1332, !DIExpression(), !1312)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1336
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1338
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1339

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1340
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1340
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1340
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1342
    #dbg_value(i16 %call, !1343, !DIExpression(), !1312)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1344
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1344
  %sub = sub i16 %3, %call, !dbg !1345
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1346
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1346
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1347
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1348
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1348
  %add17 = add i16 %5, %call, !dbg !1349
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1350
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1351
  %inc20 = add nuw i32 %j.0, 1, !dbg !1352
    #dbg_value(i32 %inc20, !1332, !DIExpression(), !1312)
  br label %for.cond4, !dbg !1353, !llvm.loop !1354

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1335
  %inc = add i32 %k.1, 1, !dbg !1356
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1357
    #dbg_value(i32 %add22, !1326, !DIExpression(), !1312)
  br label %for.cond1, !dbg !1358, !llvm.loop !1359

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1312
  %shr = lshr i32 %len.0, 1, !dbg !1361
    #dbg_value(i32 %shr, !1314, !DIExpression(), !1312)
  br label %for.cond, !dbg !1362, !llvm.loop !1363

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1365
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1366 {
entry:
    #dbg_value(i16 %a, !1369, !DIExpression(), !1370)
    #dbg_value(i16 %b, !1371, !DIExpression(), !1370)
  %conv = sext i16 %a to i32, !dbg !1372
  %conv1 = sext i16 %b to i32, !dbg !1373
  %mul = mul nsw i32 %conv, %conv1, !dbg !1374
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1375
  ret i16 %call, !dbg !1376
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1377 {
entry:
    #dbg_value(ptr %r, !1378, !DIExpression(), !1379)
    #dbg_value(i16 1441, !1380, !DIExpression(), !1379)
    #dbg_value(i32 127, !1381, !DIExpression(), !1379)
    #dbg_value(i32 2, !1382, !DIExpression(), !1379)
  br label %for.cond, !dbg !1383

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1385
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1386
    #dbg_value(i32 %k.0, !1381, !DIExpression(), !1379)
    #dbg_value(i32 %len.0, !1382, !DIExpression(), !1379)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1387
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1389

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1390

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1393

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1395
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1379
    #dbg_value(i32 %k.1, !1381, !DIExpression(), !1379)
    #dbg_value(i32 %start.0, !1396, !DIExpression(), !1379)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1397
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1390

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1381, !DIExpression(), !1379)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1399
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1399
    #dbg_value(i16 %0, !1401, !DIExpression(), !1379)
    #dbg_value(i32 %start.0, !1402, !DIExpression(), !1379)
  br label %for.cond4, !dbg !1403

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1405
    #dbg_value(i32 %j.0, !1402, !DIExpression(), !1379)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1406
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1408
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1409

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1410
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1410
    #dbg_value(i16 %1, !1412, !DIExpression(), !1379)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1413
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1413
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1413
  %add11 = add i16 %1, %3, !dbg !1414
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1415
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1416
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1417
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1418
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1418
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1418
  %sub = sub i16 %5, %1, !dbg !1419
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1420
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1420
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1421
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1422
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1422
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1422
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1423
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1424
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1424
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1425
  %inc = add nuw i32 %j.0, 1, !dbg !1426
    #dbg_value(i32 %inc, !1402, !DIExpression(), !1379)
  br label %for.cond4, !dbg !1427, !llvm.loop !1428

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1405
  %dec = add i32 %k.1, -1, !dbg !1430
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1431
    #dbg_value(i32 %add27, !1396, !DIExpression(), !1379)
  br label %for.cond1, !dbg !1432, !llvm.loop !1433

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1379
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1435
    #dbg_value(i32 %shl, !1382, !DIExpression(), !1379)
  br label %for.cond, !dbg !1436, !llvm.loop !1437

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1439
    #dbg_value(i32 %j.1, !1402, !DIExpression(), !1379)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1440
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1393

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1442
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1442
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1443
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1444
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1445
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1446
    #dbg_value(i32 %inc39, !1402, !DIExpression(), !1379)
  br label %for.cond31, !dbg !1447, !llvm.loop !1448

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1450
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1451 {
entry:
    #dbg_value(ptr %r, !1455, !DIExpression(), !1456)
    #dbg_value(ptr %a, !1457, !DIExpression(), !1456)
    #dbg_value(ptr %b, !1458, !DIExpression(), !1456)
    #dbg_value(i16 %zeta, !1459, !DIExpression(), !1456)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1460
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1460
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1461
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1461
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1462
  store i16 %call, ptr %r, align 2, !dbg !1463
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1464
  store i16 %call4, ptr %r, align 2, !dbg !1465
  %2 = load i16, ptr %a, align 2, !dbg !1466
  %3 = load i16, ptr %b, align 2, !dbg !1467
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1468
  %4 = load i16, ptr %r, align 2, !dbg !1469
  %add = add i16 %4, %call8, !dbg !1469
  store i16 %add, ptr %r, align 2, !dbg !1469
  %5 = load i16, ptr %a, align 2, !dbg !1470
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1471
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1471
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1472
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1473
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1474
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1475
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1475
  %8 = load i16, ptr %b, align 2, !dbg !1476
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1477
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1478
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1479
  %add22 = add i16 %9, %call18, !dbg !1479
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1479
  ret void, !dbg !1480
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1481 {
entry:
    #dbg_value(ptr %r, !1490, !DIExpression(), !1491)
    #dbg_value(ptr %buf, !1492, !DIExpression(), !1491)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1493
  ret void, !dbg !1494
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1495 {
entry:
    #dbg_value(ptr %r, !1496, !DIExpression(), !1497)
    #dbg_value(ptr %buf, !1498, !DIExpression(), !1497)
    #dbg_value(i32 0, !1499, !DIExpression(), !1497)
  br label %for.cond, !dbg !1500

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1502
    #dbg_value(i32 %i.0, !1499, !DIExpression(), !1497)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1503
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1505

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1506
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1508
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1509
    #dbg_value(i32 %call, !1510, !DIExpression(), !1497)
  %and = and i32 %call, 1431655765, !dbg !1511
    #dbg_value(i32 %and, !1512, !DIExpression(), !1497)
  %shr = lshr i32 %call, 1, !dbg !1513
  %and1 = and i32 %shr, 1431655765, !dbg !1514
  %add = add nuw i32 %and, %and1, !dbg !1515
    #dbg_value(i32 %add, !1512, !DIExpression(), !1497)
    #dbg_value(i32 0, !1516, !DIExpression(), !1497)
  br label %for.cond2, !dbg !1517

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1519
    #dbg_value(i32 %j.0, !1516, !DIExpression(), !1497)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1520
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1522

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1523
  %shr7 = lshr i32 %add, %mul5, !dbg !1525
  %conv = and i32 %shr7, 3, !dbg !1526
    #dbg_value(i32 %shr7, !1527, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1497)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1528
  %add10 = or disjoint i32 %mul9, 2, !dbg !1529
  %shr11 = lshr i32 %add, %add10, !dbg !1530
  %conv13 = and i32 %shr11, 3, !dbg !1531
    #dbg_value(i32 %conv13, !1532, !DIExpression(), !1497)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1533
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1534
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1535
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1536
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1537
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1538
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1539
    #dbg_value(i32 %inc, !1516, !DIExpression(), !1497)
  br label %for.cond2, !dbg !1540, !llvm.loop !1541

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1543
    #dbg_value(i32 %inc20, !1499, !DIExpression(), !1497)
  br label %for.cond, !dbg !1544, !llvm.loop !1545

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1547
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1548 {
entry:
    #dbg_value(ptr %x, !1551, !DIExpression(), !1552)
  %0 = load i8, ptr %x, align 1, !dbg !1553
  %conv = zext i8 %0 to i32, !dbg !1554
    #dbg_value(i32 %conv, !1555, !DIExpression(), !1552)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1556
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1556
  %conv2 = zext i8 %1 to i32, !dbg !1557
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1558
  %or = or disjoint i32 %shl, %conv, !dbg !1559
    #dbg_value(i32 %or, !1555, !DIExpression(), !1552)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1560
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1560
  %conv4 = zext i8 %2 to i32, !dbg !1561
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1562
  %or6 = or disjoint i32 %or, %shl5, !dbg !1563
    #dbg_value(i32 %or6, !1555, !DIExpression(), !1552)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1564
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1564
  %conv8 = zext i8 %3 to i32, !dbg !1565
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1566
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1567
    #dbg_value(i32 %or10, !1555, !DIExpression(), !1552)
  ret i32 %or10, !dbg !1568
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1569 {
entry:
    #dbg_value(ptr %r, !1570, !DIExpression(), !1571)
    #dbg_value(ptr %buf, !1572, !DIExpression(), !1571)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1573
  ret void, !dbg !1574
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1575 {
entry:
    #dbg_value(i32 %a, !1578, !DIExpression(), !1579)
    #dbg_value(i32 %a, !1580, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1579)
  %sext = mul i32 %a, -218038272, !dbg !1581
  %conv3 = ashr exact i32 %sext, 16, !dbg !1581
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1582
  %sub = add i32 %mul4.neg, %a, !dbg !1583
  %shr = lshr i32 %sub, 16, !dbg !1584
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1585
    #dbg_value(i16 %conv5, !1580, !DIExpression(), !1579)
  ret i16 %conv5, !dbg !1586
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1587 {
entry:
    #dbg_value(i16 %a, !1590, !DIExpression(), !1591)
    #dbg_value(i16 20159, !1592, !DIExpression(), !1591)
  %conv = sext i16 %a to i32, !dbg !1593
  %mul = mul nsw i32 %conv, 20159, !dbg !1594
  %add = add nsw i32 %mul, 33554432, !dbg !1595
  %shr = ashr i32 %add, 26, !dbg !1596
    #dbg_value(i32 %shr, !1597, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1591)
    #dbg_value(i32 %shr, !1597, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1591)
  %0 = trunc nsw i32 %shr to i16, !dbg !1598
  %1 = mul i16 %0, -3329, !dbg !1598
  %conv7 = add i16 %1, %a, !dbg !1598
  ret i16 %conv7, !dbg !1599
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1600 {
entry:
    #dbg_value(ptr %a, !1606, !DIExpression(), !1607)
    #dbg_value(ptr %b, !1608, !DIExpression(), !1607)
    #dbg_value(i32 %len, !1609, !DIExpression(), !1607)
    #dbg_value(i8 0, !1610, !DIExpression(), !1607)
    #dbg_value(i32 0, !1611, !DIExpression(), !1607)
  br label %for.cond, !dbg !1612

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1614
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1607
    #dbg_value(i8 %r.0, !1610, !DIExpression(), !1607)
    #dbg_value(i32 %i.0, !1611, !DIExpression(), !1607)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1615
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1617

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1607)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1618
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1618
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1619
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1619
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1607)
  %xor1 = xor i8 %0, %1, !dbg !1620
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1607)
  %or2 = or i8 %r.0, %xor1, !dbg !1621
    #dbg_value(i8 %or2, !1610, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1607)
    #dbg_value(i8 %or2, !1610, !DIExpression(), !1607)
  %inc = add i32 %i.0, 1, !dbg !1622
    #dbg_value(i32 %inc, !1611, !DIExpression(), !1607)
  br label %for.cond, !dbg !1623, !llvm.loop !1624

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1607
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1626
  %conv6 = zext i1 %2 to i32, !dbg !1627
  ret i32 %conv6, !dbg !1628
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1629 {
entry:
    #dbg_value(ptr %r, !1632, !DIExpression(), !1633)
    #dbg_value(ptr %x, !1634, !DIExpression(), !1633)
    #dbg_value(i32 %len, !1635, !DIExpression(), !1633)
    #dbg_value(i8 %b, !1636, !DIExpression(), !1633)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1637, !srcloc !1638
    #dbg_value(i8 %0, !1636, !DIExpression(), !1633)
  %sub = sub i8 0, %0, !dbg !1639
    #dbg_value(i8 %sub, !1636, !DIExpression(), !1633)
    #dbg_value(i32 0, !1640, !DIExpression(), !1633)
  br label %for.cond, !dbg !1641

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1643
    #dbg_value(i32 %i.0, !1640, !DIExpression(), !1633)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1644
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1646

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1647
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1647
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1648
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1648
  %xor1 = xor i8 %1, %2, !dbg !1649
  %and2 = and i8 %xor1, %sub, !dbg !1650
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1651
  %xor93 = xor i8 %1, %and2, !dbg !1652
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1652
  %inc = add i32 %i.0, 1, !dbg !1653
    #dbg_value(i32 %inc, !1640, !DIExpression(), !1633)
  br label %for.cond, !dbg !1654, !llvm.loop !1655

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1657
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1658 {
entry:
    #dbg_value(ptr %r, !1661, !DIExpression(), !1662)
    #dbg_value(i16 %v, !1663, !DIExpression(), !1662)
    #dbg_value(i16 %b, !1664, !DIExpression(), !1662)
  %sub = sub i16 0, %b, !dbg !1665
    #dbg_value(i16 %sub, !1664, !DIExpression(), !1662)
  %0 = load i16, ptr %r, align 2, !dbg !1666
  %xor1 = xor i16 %0, %v, !dbg !1667
  %and = and i16 %xor1, %sub, !dbg !1668
  %xor6 = xor i16 %and, %0, !dbg !1669
  store i16 %xor6, ptr %r, align 2, !dbg !1669
  ret void, !dbg !1670
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1671 {
entry:
    #dbg_value(ptr %state, !1680, !DIExpression(), !1681)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1682
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1683
  store i32 0, ptr %pos, align 8, !dbg !1684
  ret void, !dbg !1685
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1686 {
entry:
    #dbg_value(ptr %s, !1690, !DIExpression(), !1691)
    #dbg_value(i32 0, !1692, !DIExpression(), !1691)
  br label %for.cond, !dbg !1693

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1695
    #dbg_value(i32 %i.0, !1692, !DIExpression(), !1691)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1696
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1698

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1699
  store i64 0, ptr %arrayidx, align 8, !dbg !1700
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1701
    #dbg_value(i32 %inc, !1692, !DIExpression(), !1691)
  br label %for.cond, !dbg !1702, !llvm.loop !1703

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1705
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1706 {
entry:
    #dbg_value(ptr %state, !1709, !DIExpression(), !1710)
    #dbg_value(ptr %in, !1711, !DIExpression(), !1710)
    #dbg_value(i32 %inlen, !1712, !DIExpression(), !1710)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1713
  %0 = load i32, ptr %pos, align 8, !dbg !1713
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1714
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1715
  store i32 %call, ptr %pos1, align 8, !dbg !1716
  ret void, !dbg !1717
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1718 {
entry:
    #dbg_value(ptr %s, !1721, !DIExpression(), !1722)
    #dbg_value(i32 %pos, !1723, !DIExpression(), !1722)
    #dbg_value(i32 %r, !1724, !DIExpression(), !1722)
    #dbg_value(ptr %in, !1725, !DIExpression(), !1722)
    #dbg_value(i32 %inlen, !1726, !DIExpression(), !1722)
  br label %while.cond, !dbg !1727

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1723, !DIExpression(), !1722)
    #dbg_value(i32 %inlen.addr.0, !1726, !DIExpression(), !1722)
    #dbg_value(ptr %in.addr.0, !1725, !DIExpression(), !1722)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1728
  %cmp.not = icmp ult i32 %add, %r, !dbg !1729
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1727

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1730
  br label %for.cond, !dbg !1730

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1733

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1735
    #dbg_value(i32 %i.0, !1736, !DIExpression(), !1722)
    #dbg_value(ptr %in.addr.1, !1725, !DIExpression(), !1722)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1737
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1730

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1725, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1722)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1739
  %conv = zext i8 %0 to i64, !dbg !1740
  %rem = shl i32 %i.0, 3, !dbg !1741
  %mul = and i32 %rem, 56, !dbg !1741
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1742
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1742
  %div2 = lshr i32 %i.0, 3, !dbg !1743
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1744
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1745
  %xor = xor i64 %1, %shl, !dbg !1745
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1745
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1746
    #dbg_value(ptr %incdec.ptr, !1725, !DIExpression(), !1722)
  %inc = add i32 %i.0, 1, !dbg !1747
    #dbg_value(i32 %inc, !1736, !DIExpression(), !1722)
  br label %for.cond, !dbg !1748, !llvm.loop !1749

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1751
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1752
    #dbg_value(i32 %sub2, !1726, !DIExpression(), !1722)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1753
    #dbg_value(i32 0, !1723, !DIExpression(), !1722)
  br label %while.cond, !dbg !1727, !llvm.loop !1754

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1756
    #dbg_value(i32 %i.1, !1736, !DIExpression(), !1722)
    #dbg_value(ptr %in.addr.2, !1725, !DIExpression(), !1722)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1757
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1759
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1733

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1725, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1722)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1760
  %conv9 = zext i8 %2 to i64, !dbg !1761
  %rem10 = shl i32 %i.1, 3, !dbg !1762
  %mul11 = and i32 %rem10, 56, !dbg !1762
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1763
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1763
  %div141 = lshr i32 %i.1, 3, !dbg !1764
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1765
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1766
  %xor16 = xor i64 %3, %shl13, !dbg !1766
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1766
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1767
    #dbg_value(ptr %incdec.ptr8, !1725, !DIExpression(), !1722)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1768
    #dbg_value(i32 %inc18, !1736, !DIExpression(), !1722)
  br label %for.cond3, !dbg !1769, !llvm.loop !1770

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1756
  ret i32 %i.1.lcssa, !dbg !1772
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1773 {
entry:
    #dbg_value(ptr %state, !1774, !DIExpression(), !1775)
  %0 = load i64, ptr %state, align 8, !dbg !1776
    #dbg_value(i64 %0, !1777, !DIExpression(), !1775)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1778
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1778
    #dbg_value(i64 %1, !1779, !DIExpression(), !1775)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1780
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1780
    #dbg_value(i64 %2, !1781, !DIExpression(), !1775)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1782
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1782
    #dbg_value(i64 %3, !1783, !DIExpression(), !1775)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1784
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1784
    #dbg_value(i64 %4, !1785, !DIExpression(), !1775)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1786
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1786
    #dbg_value(i64 %5, !1787, !DIExpression(), !1775)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1788
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1788
    #dbg_value(i64 %6, !1789, !DIExpression(), !1775)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1790
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1790
    #dbg_value(i64 %7, !1791, !DIExpression(), !1775)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1792
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1792
    #dbg_value(i64 %8, !1793, !DIExpression(), !1775)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1794
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1794
    #dbg_value(i64 %9, !1795, !DIExpression(), !1775)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1796
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1796
    #dbg_value(i64 %10, !1797, !DIExpression(), !1775)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1798
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1798
    #dbg_value(i64 %11, !1799, !DIExpression(), !1775)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1800
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1800
    #dbg_value(i64 %12, !1801, !DIExpression(), !1775)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1802
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1802
    #dbg_value(i64 %13, !1803, !DIExpression(), !1775)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1804
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1804
    #dbg_value(i64 %14, !1805, !DIExpression(), !1775)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1806
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1806
    #dbg_value(i64 %15, !1807, !DIExpression(), !1775)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1808
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1808
    #dbg_value(i64 %16, !1809, !DIExpression(), !1775)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1810
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1810
    #dbg_value(i64 %17, !1811, !DIExpression(), !1775)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1812
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1812
    #dbg_value(i64 %18, !1813, !DIExpression(), !1775)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1814
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1814
    #dbg_value(i64 %19, !1815, !DIExpression(), !1775)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1816
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1816
    #dbg_value(i64 %20, !1817, !DIExpression(), !1775)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1818
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1818
    #dbg_value(i64 %21, !1819, !DIExpression(), !1775)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1820
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1820
    #dbg_value(i64 %22, !1821, !DIExpression(), !1775)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1822
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1822
    #dbg_value(i64 %23, !1823, !DIExpression(), !1775)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1824
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1824
    #dbg_value(i64 %24, !1825, !DIExpression(), !1775)
    #dbg_value(i32 0, !1826, !DIExpression(), !1775)
  br label %for.cond, !dbg !1827

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1775
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1775
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1775
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1775
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1775
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1775
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1775
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1775
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1775
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1775
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1775
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1775
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1775
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1775
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1775
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1775
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1775
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1775
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1775
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1775
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1775
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1775
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1775
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1775
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1829
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1775
    #dbg_value(i64 %Asu.0, !1825, !DIExpression(), !1775)
    #dbg_value(i32 %round.0, !1826, !DIExpression(), !1775)
    #dbg_value(i64 %Aba.0, !1777, !DIExpression(), !1775)
    #dbg_value(i64 %Abe.0, !1779, !DIExpression(), !1775)
    #dbg_value(i64 %Abi.0, !1781, !DIExpression(), !1775)
    #dbg_value(i64 %Abo.0, !1783, !DIExpression(), !1775)
    #dbg_value(i64 %Abu.0, !1785, !DIExpression(), !1775)
    #dbg_value(i64 %Aga.0, !1787, !DIExpression(), !1775)
    #dbg_value(i64 %Age.0, !1789, !DIExpression(), !1775)
    #dbg_value(i64 %Agi.0, !1791, !DIExpression(), !1775)
    #dbg_value(i64 %Ago.0, !1793, !DIExpression(), !1775)
    #dbg_value(i64 %Agu.0, !1795, !DIExpression(), !1775)
    #dbg_value(i64 %Aka.0, !1797, !DIExpression(), !1775)
    #dbg_value(i64 %Ake.0, !1799, !DIExpression(), !1775)
    #dbg_value(i64 %Aki.0, !1801, !DIExpression(), !1775)
    #dbg_value(i64 %Ako.0, !1803, !DIExpression(), !1775)
    #dbg_value(i64 %Aku.0, !1805, !DIExpression(), !1775)
    #dbg_value(i64 %Ama.0, !1807, !DIExpression(), !1775)
    #dbg_value(i64 %Ame.0, !1809, !DIExpression(), !1775)
    #dbg_value(i64 %Ami.0, !1811, !DIExpression(), !1775)
    #dbg_value(i64 %Amo.0, !1813, !DIExpression(), !1775)
    #dbg_value(i64 %Amu.0, !1815, !DIExpression(), !1775)
    #dbg_value(i64 %Asa.0, !1817, !DIExpression(), !1775)
    #dbg_value(i64 %Ase.0, !1819, !DIExpression(), !1775)
    #dbg_value(i64 %Asi.0, !1821, !DIExpression(), !1775)
    #dbg_value(i64 %Aso.0, !1823, !DIExpression(), !1775)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1830
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1832

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 poison, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !1868
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !1870
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !1871
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !1872
    #dbg_value(i64 %xor35, !1835, !DIExpression(), !1775)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !1873
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !1874
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !1875
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !1876
    #dbg_value(i64 %xor43, !1837, !DIExpression(), !1775)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !1877
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !1841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor57 = xor i64 %xor35, %xor56, !dbg !1878
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 %xor57, !1841, !DIExpression(), !1775)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !1879
    #dbg_value(i64 %xor203, !1793, !DIExpression(), !1775)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !1880
    #dbg_value(i64 %xor206, !1834, !DIExpression(), !1775)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !1881
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !1882
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !1883
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !1884
    #dbg_value(i64 %xor31, !1834, !DIExpression(), !1775)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !1885
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !1838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor45 = xor i64 %xor43, %xor44, !dbg !1886
    #dbg_value(i64 %xor45, !1838, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !1887
    #dbg_value(i64 %xor211, !1807, !DIExpression(), !1775)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !1888
    #dbg_value(i64 %xor214, !1836, !DIExpression(), !1775)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !1889
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !1890
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !1891
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !1892
    #dbg_value(i64 %xor39, !1836, !DIExpression(), !1775)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !1893
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !1894
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !1895
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !1896
    #dbg_value(i64 %xor27, !1833, !DIExpression(), !1775)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !1897
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !1842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor61 = xor i64 %xor39, %xor60, !dbg !1898
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 %xor61, !1842, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !1899
    #dbg_value(i64 %xor207, !1805, !DIExpression(), !1775)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !1900
    #dbg_value(i64 %xor210, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not222 = xor i64 %xor210, -1, !dbg !1901
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and223 = and i64 %xor214, %not222, !dbg !1902
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor224 = xor i64 %xor206, %and223, !dbg !1903
    #dbg_value(i64 %xor224, !1864, !DIExpression(), !1775)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !1904
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor53 = xor i64 %xor31, %xor52, !dbg !1905
    #dbg_value(i64 %xor53, !1840, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !1906
    #dbg_value(i64 %xor67, !1801, !DIExpression(), !1775)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !1907
    #dbg_value(i64 %xor70, !1835, !DIExpression(), !1775)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !1908
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !1839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor49 = xor i64 %xor27, %xor48, !dbg !1909
    #dbg_value(i64 %xor49, !1839, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !1910
    #dbg_value(i64 %xor63, !1789, !DIExpression(), !1775)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !1911
    #dbg_value(i64 %xor66, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not = xor i64 %xor66, -1, !dbg !1912
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and = and i64 %xor70, %not, !dbg !1913
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !1914
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !1914
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %26 = xor i64 %and, %25, !dbg !1915
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !1916
    #dbg_value(i64 %xor62, !1777, !DIExpression(), !1775)
    #dbg_value(i64 %xor62, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor81 = xor i64 %26, %xor62, !dbg !1915
    #dbg_value(i64 %xor81, !1843, !DIExpression(), !1775)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !1917
    #dbg_value(i64 %xor94, !1783, !DIExpression(), !1775)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !1918
    #dbg_value(i64 %xor97, !1833, !DIExpression(), !1775)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !1919
    #dbg_value(i64 %xor102, !1797, !DIExpression(), !1775)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !1920
    #dbg_value(i64 %xor105, !1835, !DIExpression(), !1775)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !1921
    #dbg_value(i64 %xor98, !1795, !DIExpression(), !1775)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !1922
    #dbg_value(i64 %xor101, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not114 = xor i64 %xor101, -1, !dbg !1923
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and115 = and i64 %xor105, %not114, !dbg !1924
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor116 = xor i64 %xor97, %and115, !dbg !1925
    #dbg_value(i64 %xor116, !1848, !DIExpression(), !1775)
  %xor234 = xor i64 %xor81, %xor116, !dbg !1926
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !1927
    #dbg_value(i64 %xor129, !1779, !DIExpression(), !1775)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !1928
    #dbg_value(i64 %xor132, !1833, !DIExpression(), !1775)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !1929
    #dbg_value(i64 %xor137, !1803, !DIExpression(), !1775)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !1930
    #dbg_value(i64 %xor140, !1835, !DIExpression(), !1775)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !1931
    #dbg_value(i64 %xor133, !1791, !DIExpression(), !1775)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !1932
    #dbg_value(i64 %xor136, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not149 = xor i64 %xor136, -1, !dbg !1933
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and150 = and i64 %xor140, %not149, !dbg !1934
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor151 = xor i64 %xor132, %and150, !dbg !1935
    #dbg_value(i64 %xor151, !1853, !DIExpression(), !1775)
  %xor235 = xor i64 %xor234, %xor151, !dbg !1936
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !1937
    #dbg_value(i64 %xor164, !1785, !DIExpression(), !1775)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !1938
    #dbg_value(i64 %xor167, !1833, !DIExpression(), !1775)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !1939
    #dbg_value(i64 %xor172, !1799, !DIExpression(), !1775)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !1940
    #dbg_value(i64 %xor175, !1835, !DIExpression(), !1775)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !1941
    #dbg_value(i64 %xor168, !1787, !DIExpression(), !1775)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !1942
    #dbg_value(i64 %xor171, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not184 = xor i64 %xor171, -1, !dbg !1943
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and185 = and i64 %xor175, %not184, !dbg !1944
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor186 = xor i64 %xor167, %and185, !dbg !1945
    #dbg_value(i64 %xor186, !1858, !DIExpression(), !1775)
  %xor236 = xor i64 %xor235, %xor186, !dbg !1946
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !1947
    #dbg_value(i64 %xor199, !1781, !DIExpression(), !1775)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !1948
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not219 = xor i64 %xor206, -1, !dbg !1949
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and220 = and i64 %xor210, %not219, !dbg !1950
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor221 = xor i64 %xor202, %and220, !dbg !1951
    #dbg_value(i64 %xor221, !1863, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor237 = xor i64 %xor236, %xor221, !dbg !1952
    #dbg_value(i64 %xor237, !1833, !DIExpression(), !1775)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !1953
    #dbg_value(i64 %xor75, !1825, !DIExpression(), !1775)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !1954
    #dbg_value(i64 %xor78, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !1955
    #dbg_value(i64 %xor71, !1813, !DIExpression(), !1775)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !1956
    #dbg_value(i64 %xor74, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not85 = xor i64 %xor74, -1, !dbg !1957
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and86 = and i64 %xor78, %not85, !dbg !1958
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor87 = xor i64 %xor70, %and86, !dbg !1959
    #dbg_value(i64 %xor87, !1845, !DIExpression(), !1775)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !1960
    #dbg_value(i64 %xor110, !1821, !DIExpression(), !1775)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !1961
    #dbg_value(i64 %xor113, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !1962
    #dbg_value(i64 %xor106, !1809, !DIExpression(), !1775)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !1963
    #dbg_value(i64 %xor109, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not120 = xor i64 %xor109, -1, !dbg !1964
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and121 = and i64 %xor113, %not120, !dbg !1965
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor122 = xor i64 %xor105, %and121, !dbg !1966
    #dbg_value(i64 %xor122, !1850, !DIExpression(), !1775)
  %xor242 = xor i64 %xor87, %xor122, !dbg !1967
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !1968
    #dbg_value(i64 %xor145, !1817, !DIExpression(), !1775)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !1969
    #dbg_value(i64 %xor148, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !1970
    #dbg_value(i64 %xor141, !1815, !DIExpression(), !1775)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !1971
    #dbg_value(i64 %xor144, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not155 = xor i64 %xor144, -1, !dbg !1972
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and156 = and i64 %xor148, %not155, !dbg !1973
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor157 = xor i64 %xor140, %and156, !dbg !1974
    #dbg_value(i64 %xor157, !1855, !DIExpression(), !1775)
  %xor243 = xor i64 %xor242, %xor157, !dbg !1975
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !1976
    #dbg_value(i64 %xor180, !1823, !DIExpression(), !1775)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !1977
    #dbg_value(i64 %xor183, !1837, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !1978
    #dbg_value(i64 %xor176, !1811, !DIExpression(), !1775)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !1979
    #dbg_value(i64 %xor179, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %not190 = xor i64 %xor179, -1, !dbg !1980
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and191 = and i64 %xor183, %not190, !dbg !1981
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor192 = xor i64 %xor175, %and191, !dbg !1982
    #dbg_value(i64 %xor192, !1860, !DIExpression(), !1775)
  %xor244 = xor i64 %xor243, %xor192, !dbg !1983
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !1984
    #dbg_value(i64 %xor215, !1819, !DIExpression(), !1775)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !1985
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not225 = xor i64 %xor214, -1, !dbg !1986
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and226 = and i64 %xor218, %not225, !dbg !1987
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor227 = xor i64 %xor210, %and226, !dbg !1988
    #dbg_value(i64 %xor227, !1865, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor245 = xor i64 %xor244, %xor227, !dbg !1989
    #dbg_value(i64 %xor245, !1835, !DIExpression(), !1775)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !1990
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !1839, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor261 = xor i64 %xor237, %xor260, !dbg !1991
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !1864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 %xor261, !1839, !DIExpression(), !1775)
  %xor429 = xor i64 %xor224, %xor261, !dbg !1992
    #dbg_value(i64 %xor429, !1864, !DIExpression(), !1775)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !1993
    #dbg_value(i64 %xor432, !1837, !DIExpression(), !1775)
  %not123 = xor i64 %xor113, -1, !dbg !1994
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and124 = and i64 %xor97, %not123, !dbg !1995
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor125 = xor i64 %xor109, %and124, !dbg !1996
    #dbg_value(i64 %xor125, !1851, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not91 = xor i64 %xor62, -1, !dbg !1997
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and92 = and i64 %xor66, %not91, !dbg !1998
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor93 = xor i64 %xor78, %and92, !dbg !1999
    #dbg_value(i64 %xor93, !1847, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not126 = xor i64 %xor97, -1, !dbg !2000
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and127 = and i64 %xor101, %not126, !dbg !2001
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor128 = xor i64 %xor113, %and127, !dbg !2002
    #dbg_value(i64 %xor128, !1852, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2003
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not161 = xor i64 %xor132, -1, !dbg !2004
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and162 = and i64 %xor136, %not161, !dbg !2005
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor163 = xor i64 %xor148, %and162, !dbg !2006
    #dbg_value(i64 %xor163, !1857, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2007
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not196 = xor i64 %xor167, -1, !dbg !2008
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and197 = and i64 %xor171, %not196, !dbg !2009
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor198 = xor i64 %xor183, %and197, !dbg !2010
    #dbg_value(i64 %xor198, !1862, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2011
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not231 = xor i64 %xor202, -1, !dbg !2012
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %and232 = and i64 %xor206, %not231, !dbg !2013
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor233 = xor i64 %xor218, %and232, !dbg !2014
    #dbg_value(i64 %xor233, !1867, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1837, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2015
    #dbg_value(i64 %xor253, !1837, !DIExpression(), !1775)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2016
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !1841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2017
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !1851, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 %xor269, !1841, !DIExpression(), !1775)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2018
    #dbg_value(i64 %xor417, !1851, !DIExpression(), !1775)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2019
    #dbg_value(i64 %xor420, !1834, !DIExpression(), !1775)
  %not82 = xor i64 %xor70, -1, !dbg !2020
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and83 = and i64 %xor74, %not82, !dbg !2021
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor84 = xor i64 %xor66, %and83, !dbg !2022
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !1844, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %not117 = xor i64 %xor105, -1, !dbg !2023
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and118 = and i64 %xor109, %not117, !dbg !2024
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor119 = xor i64 %xor101, %and118, !dbg !2025
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !1849, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2026
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %not152 = xor i64 %xor140, -1, !dbg !2027
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and153 = and i64 %xor144, %not152, !dbg !2028
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor154 = xor i64 %xor136, %and153, !dbg !2029
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2030
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %not187 = xor i64 %xor175, -1, !dbg !2031
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and188 = and i64 %xor179, %not187, !dbg !2032
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor189 = xor i64 %xor171, %and188, !dbg !2033
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !1859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2034
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1834, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2035
    #dbg_value(i64 %xor241, !1834, !DIExpression(), !1775)
  %not88 = xor i64 %xor78, -1, !dbg !2036
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and89 = and i64 %xor62, %not88, !dbg !2037
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor90 = xor i64 %xor74, %and89, !dbg !2038
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !1846, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2039
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not158 = xor i64 %xor148, -1, !dbg !2040
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and159 = and i64 %xor132, %not158, !dbg !2041
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor160 = xor i64 %xor144, %and159, !dbg !2042
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !1856, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2043
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not193 = xor i64 %xor183, -1, !dbg !2044
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and194 = and i64 %xor167, %not193, !dbg !2045
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor195 = xor i64 %xor179, %and194, !dbg !2046
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !1861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2047
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %not228 = xor i64 %xor218, -1, !dbg !2048
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and229 = and i64 %xor202, %not228, !dbg !2049
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor230 = xor i64 %xor214, %and229, !dbg !2050
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !1866, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2051
    #dbg_value(i64 %xor249, !1836, !DIExpression(), !1775)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2052
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2053
    #dbg_value(i64 %xor265, !1840, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !1845, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !1860, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !1850, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !1865, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2054
    #dbg_value(i64 %xor413, !1845, !DIExpression(), !1775)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2055
    #dbg_value(i64 %xor416, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not445 = xor i64 %xor416, -1, !dbg !2056
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and446 = and i64 %xor420, %not445, !dbg !2057
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !1825, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor447 = xor i64 %xor432, %and446, !dbg !2058
    #dbg_value(i64 %xor447, !1825, !DIExpression(), !1775)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2059
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !1838, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2060
    #dbg_value(i64 %xor257, !1838, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !1848, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !1863, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !1853, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1833, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1843, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !1858, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2061
    #dbg_value(i64 %xor425, !1858, !DIExpression(), !1775)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2062
    #dbg_value(i64 %xor428, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not442 = xor i64 %xor432, -1, !dbg !2063
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and443 = and i64 %xor416, %not442, !dbg !2064
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !1823, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor444 = xor i64 %xor428, %and443, !dbg !2065
    #dbg_value(i64 %xor444, !1823, !DIExpression(), !1775)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2066
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !1842, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2067
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !1847, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !1862, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !1867, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(i64 %xor273, !1842, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !1857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2068
    #dbg_value(i64 %xor421, !1857, !DIExpression(), !1775)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2069
    #dbg_value(i64 %xor424, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not439 = xor i64 %xor428, -1, !dbg !2070
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and440 = and i64 %xor432, %not439, !dbg !2071
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !1821, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor441 = xor i64 %xor424, %and440, !dbg !2072
    #dbg_value(i64 %xor441, !1821, !DIExpression(), !1775)
  %not436 = xor i64 %xor424, -1, !dbg !2073
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and437 = and i64 %xor428, %not436, !dbg !2074
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !1819, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor438 = xor i64 %xor420, %and437, !dbg !2075
    #dbg_value(i64 %xor438, !1819, !DIExpression(), !1775)
  %not433 = xor i64 %xor420, -1, !dbg !2076
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and434 = and i64 %xor424, %not433, !dbg !2077
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !1817, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor435 = xor i64 %xor416, %and434, !dbg !2078
    #dbg_value(i64 %xor435, !1817, !DIExpression(), !1775)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2079
    #dbg_value(i64 %xor394, !1866, !DIExpression(), !1775)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2080
    #dbg_value(i64 %xor397, !1837, !DIExpression(), !1775)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2081
    #dbg_value(i64 %xor382, !1848, !DIExpression(), !1775)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2082
    #dbg_value(i64 %xor385, !1834, !DIExpression(), !1775)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2083
    #dbg_value(i64 %xor378, !1847, !DIExpression(), !1775)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2084
    #dbg_value(i64 %xor381, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not410 = xor i64 %xor381, -1, !dbg !2085
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and411 = and i64 %xor385, %not410, !dbg !2086
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !1815, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor412 = xor i64 %xor397, %and411, !dbg !2087
    #dbg_value(i64 %xor412, !1815, !DIExpression(), !1775)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2088
    #dbg_value(i64 %xor390, !1860, !DIExpression(), !1775)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2089
    #dbg_value(i64 %xor393, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not407 = xor i64 %xor397, -1, !dbg !2090
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and408 = and i64 %xor381, %not407, !dbg !2091
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !1813, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor409 = xor i64 %xor393, %and408, !dbg !2092
    #dbg_value(i64 %xor409, !1813, !DIExpression(), !1775)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2093
    #dbg_value(i64 %xor386, !1854, !DIExpression(), !1775)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2094
    #dbg_value(i64 %xor389, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not404 = xor i64 %xor393, -1, !dbg !2095
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and405 = and i64 %xor397, %not404, !dbg !2096
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor406 = xor i64 %xor389, %and405, !dbg !2097
    #dbg_value(i64 %xor406, !1811, !DIExpression(), !1775)
  %not401 = xor i64 %xor389, -1, !dbg !2098
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and402 = and i64 %xor393, %not401, !dbg !2099
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor403 = xor i64 %xor385, %and402, !dbg !2100
    #dbg_value(i64 %xor403, !1809, !DIExpression(), !1775)
  %not398 = xor i64 %xor385, -1, !dbg !2101
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and399 = and i64 %xor389, %not398, !dbg !2102
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1807, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor400 = xor i64 %xor381, %and399, !dbg !2103
    #dbg_value(i64 %xor400, !1807, !DIExpression(), !1775)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2104
    #dbg_value(i64 %xor359, !1863, !DIExpression(), !1775)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2105
    #dbg_value(i64 %xor362, !1837, !DIExpression(), !1775)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2106
    #dbg_value(i64 %xor347, !1850, !DIExpression(), !1775)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2107
    #dbg_value(i64 %xor350, !1834, !DIExpression(), !1775)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2108
    #dbg_value(i64 %xor343, !1844, !DIExpression(), !1775)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2109
    #dbg_value(i64 %xor346, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not375 = xor i64 %xor346, -1, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and376 = and i64 %xor350, %not375, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1805, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor377 = xor i64 %xor362, %and376, !dbg !2112
    #dbg_value(i64 %xor377, !1805, !DIExpression(), !1775)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2113
    #dbg_value(i64 %xor355, !1862, !DIExpression(), !1775)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2114
    #dbg_value(i64 %xor358, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not372 = xor i64 %xor362, -1, !dbg !2115
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and373 = and i64 %xor346, %not372, !dbg !2116
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1803, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor374 = xor i64 %xor358, %and373, !dbg !2117
    #dbg_value(i64 %xor374, !1803, !DIExpression(), !1775)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2118
    #dbg_value(i64 %xor351, !1856, !DIExpression(), !1775)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2119
    #dbg_value(i64 %xor354, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not369 = xor i64 %xor358, -1, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and370 = and i64 %xor362, %not369, !dbg !2121
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1801, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor371 = xor i64 %xor354, %and370, !dbg !2122
    #dbg_value(i64 %xor371, !1801, !DIExpression(), !1775)
  %not366 = xor i64 %xor354, -1, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and367 = and i64 %xor358, %not366, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1799, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor368 = xor i64 %xor350, %and367, !dbg !2125
    #dbg_value(i64 %xor368, !1799, !DIExpression(), !1775)
  %not363 = xor i64 %xor350, -1, !dbg !2126
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and364 = and i64 %xor354, %not363, !dbg !2127
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1797, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor365 = xor i64 %xor346, %and364, !dbg !2128
    #dbg_value(i64 %xor365, !1797, !DIExpression(), !1775)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2129
    #dbg_value(i64 %xor324, !1865, !DIExpression(), !1775)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2130
    #dbg_value(i64 %xor327, !1837, !DIExpression(), !1775)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2131
    #dbg_value(i64 %xor312, !1852, !DIExpression(), !1775)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2132
    #dbg_value(i64 %xor315, !1834, !DIExpression(), !1775)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2133
    #dbg_value(i64 %xor308, !1846, !DIExpression(), !1775)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2134
    #dbg_value(i64 %xor311, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not340 = xor i64 %xor311, -1, !dbg !2135
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and341 = and i64 %xor315, %not340, !dbg !2136
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1795, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor342 = xor i64 %xor327, %and341, !dbg !2137
    #dbg_value(i64 %xor342, !1795, !DIExpression(), !1775)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2138
    #dbg_value(i64 %xor320, !1859, !DIExpression(), !1775)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2139
    #dbg_value(i64 %xor323, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not337 = xor i64 %xor327, -1, !dbg !2140
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and338 = and i64 %xor311, %not337, !dbg !2141
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1793, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor339 = xor i64 %xor323, %and338, !dbg !2142
    #dbg_value(i64 %xor339, !1793, !DIExpression(), !1775)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2143
    #dbg_value(i64 %xor316, !1853, !DIExpression(), !1775)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2144
    #dbg_value(i64 %xor319, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not334 = xor i64 %xor323, -1, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and335 = and i64 %xor327, %not334, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1791, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor336 = xor i64 %xor319, %and335, !dbg !2147
    #dbg_value(i64 %xor336, !1791, !DIExpression(), !1775)
  %not331 = xor i64 %xor319, -1, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and332 = and i64 %xor323, %not331, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1789, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor333 = xor i64 %xor315, %and332, !dbg !2150
    #dbg_value(i64 %xor333, !1789, !DIExpression(), !1775)
  %not328 = xor i64 %xor315, -1, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and329 = and i64 %xor319, %not328, !dbg !2152
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1787, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor330 = xor i64 %xor311, %and329, !dbg !2153
    #dbg_value(i64 %xor330, !1787, !DIExpression(), !1775)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2154
    #dbg_value(i64 %xor287, !1867, !DIExpression(), !1775)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2155
    #dbg_value(i64 %xor290, !1837, !DIExpression(), !1775)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2156
    #dbg_value(i64 %xor275, !1849, !DIExpression(), !1775)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2157
    #dbg_value(i64 %xor278, !1834, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2158
    #dbg_value(i64 %xor274, !1843, !DIExpression(), !1775)
    #dbg_value(i64 %xor274, !1833, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not305 = xor i64 %xor274, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and306 = and i64 %xor278, %not305, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1785, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor307 = xor i64 %xor290, %and306, !dbg !2161
    #dbg_value(i64 %xor307, !1785, !DIExpression(), !1775)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2162
    #dbg_value(i64 %xor283, !1861, !DIExpression(), !1775)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2163
    #dbg_value(i64 %xor286, !1836, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not302 = xor i64 %xor290, -1, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and303 = and i64 %xor274, %not302, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1783, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor304 = xor i64 %xor286, %and303, !dbg !2166
    #dbg_value(i64 %xor304, !1783, !DIExpression(), !1775)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2167
    #dbg_value(i64 %xor279, !1855, !DIExpression(), !1775)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2168
    #dbg_value(i64 %xor282, !1835, !DIExpression(), !1775)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %not299 = xor i64 %xor286, -1, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and300 = and i64 %xor290, %not299, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1781, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor301 = xor i64 %xor282, %and300, !dbg !2171
    #dbg_value(i64 %xor301, !1781, !DIExpression(), !1775)
  %not296 = xor i64 %xor282, -1, !dbg !2172
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1775)
  %and297 = and i64 %xor286, %not296, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1779, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %xor298 = xor i64 %xor278, %and297, !dbg !2174
    #dbg_value(i64 %xor298, !1779, !DIExpression(), !1775)
  %add = or disjoint i32 %round.0, 1, !dbg !2175
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2176
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %not291 = xor i64 %xor278, -1, !dbg !2177
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %and292 = and i64 %xor282, %not291, !dbg !2178
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1777, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1775)
  %28 = xor i64 %and292, %27, !dbg !2179
  %xor295 = xor i64 %28, %xor274, !dbg !2179
    #dbg_value(i64 %xor295, !1777, !DIExpression(), !1775)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2180
    #dbg_value(i32 %add448, !1826, !DIExpression(), !1775)
  br label %for.cond, !dbg !2181, !llvm.loop !2182

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1775
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1775
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1775
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1775
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1775
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1775
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1775
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1775
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1775
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1775
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1775
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1775
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1775
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1775
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1775
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1775
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1775
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1775
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1775
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1775
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1775
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1775
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1775
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1775
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1775
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2184
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2185
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2186
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2187
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2188
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2189
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2190
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2191
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2192
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2193
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2194
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2195
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2196
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2197
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2198
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2199
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2200
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2201
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2202
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2203
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2204
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2205
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2206
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2207
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2208
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2209
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2210
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2211
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2212
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2213
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2214
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2215
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2216
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2217
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2218
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2219
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2220
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2221
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2222
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2223
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2224
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2225
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2226
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2227
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2228
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2229
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2230
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2231
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2232
  ret void, !dbg !2233
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2234 {
entry:
    #dbg_value(ptr %state, !2235, !DIExpression(), !2236)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2237
  %0 = load i32, ptr %pos, align 8, !dbg !2237
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2238
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2239
  store i32 168, ptr %pos1, align 8, !dbg !2240
  ret void, !dbg !2241
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2242 {
entry:
    #dbg_value(ptr %s, !2245, !DIExpression(), !2246)
    #dbg_value(i32 %pos, !2247, !DIExpression(), !2246)
    #dbg_value(i32 %r, !2248, !DIExpression(), !2246)
    #dbg_value(i8 %p, !2249, !DIExpression(), !2246)
  %conv = zext i8 %p to i64, !dbg !2250
  %rem = shl i32 %pos, 3, !dbg !2251
  %mul = and i32 %rem, 56, !dbg !2251
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2252
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2252
  %div2 = lshr i32 %pos, 3, !dbg !2253
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2254
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2255
  %xor = xor i64 %0, %shl, !dbg !2255
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2255
  %div13 = lshr i32 %r, 3, !dbg !2256
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2257
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2257
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2258
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2258
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2258
  ret void, !dbg !2259
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2260 {
entry:
    #dbg_value(ptr %out, !2263, !DIExpression(), !2264)
    #dbg_value(i32 %outlen, !2265, !DIExpression(), !2264)
    #dbg_value(ptr %state, !2266, !DIExpression(), !2264)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2267
  %0 = load i32, ptr %pos, align 8, !dbg !2267
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 168) #3, !dbg !2268
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2269
  store i32 %call, ptr %pos1, align 8, !dbg !2270
  ret void, !dbg !2271
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) unnamed_addr #0 !dbg !2272 {
entry:
    #dbg_value(ptr %out, !2275, !DIExpression(), !2276)
    #dbg_value(i32 %outlen, !2277, !DIExpression(), !2276)
    #dbg_value(ptr %s, !2278, !DIExpression(), !2276)
    #dbg_value(i32 %pos, !2279, !DIExpression(), !2276)
    #dbg_value(i32 %r, !2280, !DIExpression(), !2276)
  br label %while.cond, !dbg !2281

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2275, !DIExpression(), !2276)
    #dbg_value(i32 %outlen.addr.0, !2277, !DIExpression(), !2276)
    #dbg_value(i32 %pos.addr.0, !2279, !DIExpression(), !2276)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2281
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2281

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2282
  br i1 %cmp, label %if.then, label %if.end, !dbg !2282

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2285
    #dbg_value(i32 0, !2279, !DIExpression(), !2276)
  br label %if.end, !dbg !2287

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2279, !DIExpression(), !2276)
    #dbg_value(i32 %pos.addr.1, !2288, !DIExpression(), !2276)
  br label %for.cond, !dbg !2289

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2291
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2275, !DIExpression(), !2276)
    #dbg_value(i32 %i.0, !2288, !DIExpression(), !2276)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2292
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2294
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2294
  %0 = and i1 %cmp1, %cmp2, !dbg !2294
  br i1 %0, label %for.body, label %for.end, !dbg !2295

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2296
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2297
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2297
  %rem = shl i32 %i.0, 3, !dbg !2298
  %mul = and i32 %rem, 56, !dbg !2298
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2299
  %shr = lshr i64 %1, %sh_prom, !dbg !2299
  %conv = trunc i64 %shr to i8, !dbg !2297
    #dbg_value(ptr %out.addr.1, !2275, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2276)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2300
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2301
    #dbg_value(ptr %incdec.ptr, !2275, !DIExpression(), !2276)
  %inc = add nuw i32 %i.0, 1, !dbg !2302
    #dbg_value(i32 %inc, !2288, !DIExpression(), !2276)
  br label %for.cond, !dbg !2303, !llvm.loop !2304

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2291
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2306
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2307
    #dbg_value(i32 %sub3, !2277, !DIExpression(), !2276)
    #dbg_value(i32 %i.0.lcssa, !2279, !DIExpression(), !2276)
  br label %while.cond, !dbg !2281, !llvm.loop !2308

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2310
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2311 {
entry:
    #dbg_value(ptr %state, !2312, !DIExpression(), !2313)
    #dbg_value(ptr %in, !2314, !DIExpression(), !2313)
    #dbg_value(i32 %inlen, !2315, !DIExpression(), !2313)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2316
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2317
  store i32 168, ptr %pos, align 8, !dbg !2318
  ret void, !dbg !2319
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2320 {
entry:
    #dbg_value(ptr %s, !2323, !DIExpression(), !2324)
    #dbg_value(i32 %r, !2325, !DIExpression(), !2324)
    #dbg_value(ptr %in, !2326, !DIExpression(), !2324)
    #dbg_value(i32 %inlen, !2327, !DIExpression(), !2324)
    #dbg_value(i8 %p, !2328, !DIExpression(), !2324)
    #dbg_value(i32 0, !2329, !DIExpression(), !2324)
  br label %for.cond, !dbg !2330

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2332
    #dbg_value(i32 %i.0, !2329, !DIExpression(), !2324)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2333
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2335

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2336
  br label %while.cond, !dbg !2336

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2337
  store i64 0, ptr %arrayidx, align 8, !dbg !2338
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2339
    #dbg_value(i32 %inc, !2329, !DIExpression(), !2324)
  br label %for.cond, !dbg !2340, !llvm.loop !2341

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2327, !DIExpression(), !2324)
    #dbg_value(ptr %in.addr.0, !2326, !DIExpression(), !2324)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2343
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2336

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2344

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2347

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2349
    #dbg_value(i32 %i.1, !2329, !DIExpression(), !2324)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2350
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2344

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !2352
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2353
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2354
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2355
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2356
  %xor = xor i64 %1, %call, !dbg !2356
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2356
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2357
    #dbg_value(i32 %inc7, !2329, !DIExpression(), !2324)
  br label %for.cond2, !dbg !2358, !llvm.loop !2359

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2361
    #dbg_value(ptr %add.ptr9, !2326, !DIExpression(), !2324)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2362
    #dbg_value(i32 %sub, !2327, !DIExpression(), !2324)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2363
  br label %while.cond, !dbg !2336, !llvm.loop !2364

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2366
    #dbg_value(i32 %i.2, !2329, !DIExpression(), !2324)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2367
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2347

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2369
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2369
  %conv = zext i8 %2 to i64, !dbg !2370
  %rem = shl i32 %i.2, 3, !dbg !2371
  %mul14 = and i32 %rem, 56, !dbg !2371
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2372
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2372
  %div153 = lshr i32 %i.2, 3, !dbg !2373
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2374
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2375
  %xor17 = xor i64 %3, %shl, !dbg !2375
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2375
  %inc19 = add i32 %i.2, 1, !dbg !2376
    #dbg_value(i32 %inc19, !2329, !DIExpression(), !2324)
  br label %for.cond10, !dbg !2377, !llvm.loop !2378

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2366
  %conv21 = zext i8 %p to i64, !dbg !2380
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2381
  %mul23 = and i32 %rem22, 56, !dbg !2381
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2382
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !2382
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2383
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2384
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2385
  %xor28 = xor i64 %4, %shl25, !dbg !2385
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2385
  %sub29 = add i32 %r, -1, !dbg !2386
  %div302 = lshr i32 %sub29, 3, !dbg !2387
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2388
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2389
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2389
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2389
  ret void, !dbg !2390
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2391 {
entry:
    #dbg_value(ptr %x, !2394, !DIExpression(), !2395)
    #dbg_value(i64 0, !2396, !DIExpression(), !2395)
    #dbg_value(i32 0, !2397, !DIExpression(), !2395)
  br label %for.cond, !dbg !2398

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2400
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2395
    #dbg_value(i64 %r.0, !2396, !DIExpression(), !2395)
    #dbg_value(i32 %i.0, !2397, !DIExpression(), !2395)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2401
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2403

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2395)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2404
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2404
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2395)
  %conv = zext i8 %0 to i64, !dbg !2405
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2395)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2406
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2395)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2407
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2395)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2407
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2395)
  %or = or i64 %r.0, %shl, !dbg !2408
    #dbg_value(i64 %or, !2396, !DIExpression(), !2395)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2409
    #dbg_value(i32 %inc, !2397, !DIExpression(), !2395)
  br label %for.cond, !dbg !2410, !llvm.loop !2411

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2395
  ret i64 %r.0.lcssa, !dbg !2413
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2414 {
entry:
    #dbg_value(ptr %out, !2415, !DIExpression(), !2416)
    #dbg_value(i32 %nblocks, !2417, !DIExpression(), !2416)
    #dbg_value(ptr %state, !2418, !DIExpression(), !2416)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2419
  ret void, !dbg !2420
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) unnamed_addr #0 !dbg !2421 {
entry:
    #dbg_value(ptr %out, !2424, !DIExpression(), !2425)
    #dbg_value(i32 %nblocks, !2426, !DIExpression(), !2425)
    #dbg_value(ptr %s, !2427, !DIExpression(), !2425)
    #dbg_value(i32 %r, !2428, !DIExpression(), !2425)
  %0 = lshr i32 %r, 3, !dbg !2429
  br label %while.cond, !dbg !2429

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2424, !DIExpression(), !2425)
    #dbg_value(i32 %nblocks.addr.0, !2426, !DIExpression(), !2425)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2429
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2429

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2430
    #dbg_value(i32 0, !2432, !DIExpression(), !2425)
  br label %for.cond, !dbg !2433

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2435
    #dbg_value(i32 %i.0, !2432, !DIExpression(), !2425)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2436
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2438

for.body:                                         ; preds = %for.cond
  %mul = shl nuw i32 %i.0, 3, !dbg !2439
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2440
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2441
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2441
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2442
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2443
    #dbg_value(i32 %inc, !2432, !DIExpression(), !2425)
  br label %for.cond, !dbg !2444, !llvm.loop !2445

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2447
    #dbg_value(ptr %add.ptr1, !2424, !DIExpression(), !2425)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2448
    #dbg_value(i32 %sub, !2426, !DIExpression(), !2425)
  br label %while.cond, !dbg !2429, !llvm.loop !2449

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2451
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2452 {
entry:
    #dbg_value(ptr %x, !2455, !DIExpression(), !2456)
    #dbg_value(i64 %u, !2457, !DIExpression(), !2456)
    #dbg_value(i32 0, !2458, !DIExpression(), !2456)
  br label %for.cond, !dbg !2459

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2461
    #dbg_value(i32 %i.0, !2458, !DIExpression(), !2456)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2462
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2464

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2465
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2466
  %shr = lshr i64 %u, %sh_prom, !dbg !2466
  %conv = trunc i64 %shr to i8, !dbg !2467
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2468
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2469
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2470
    #dbg_value(i32 %inc, !2458, !DIExpression(), !2456)
  br label %for.cond, !dbg !2471, !llvm.loop !2472

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2474
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2475 {
entry:
    #dbg_value(ptr %state, !2476, !DIExpression(), !2477)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2478
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2479
  store i32 0, ptr %pos, align 8, !dbg !2480
  ret void, !dbg !2481
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2482 {
entry:
    #dbg_value(ptr %state, !2483, !DIExpression(), !2484)
    #dbg_value(ptr %in, !2485, !DIExpression(), !2484)
    #dbg_value(i32 %inlen, !2486, !DIExpression(), !2484)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2487
  %0 = load i32, ptr %pos, align 8, !dbg !2487
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2488
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2489
  store i32 %call, ptr %pos1, align 8, !dbg !2490
  ret void, !dbg !2491
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2492 {
entry:
    #dbg_value(ptr %state, !2493, !DIExpression(), !2494)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2495
  %0 = load i32, ptr %pos, align 8, !dbg !2495
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2496
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2497
  store i32 136, ptr %pos1, align 8, !dbg !2498
  ret void, !dbg !2499
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2500 {
entry:
    #dbg_value(ptr %out, !2501, !DIExpression(), !2502)
    #dbg_value(i32 %outlen, !2503, !DIExpression(), !2502)
    #dbg_value(ptr %state, !2504, !DIExpression(), !2502)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2505
  %0 = load i32, ptr %pos, align 8, !dbg !2505
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 136) #3, !dbg !2506
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2507
  store i32 %call, ptr %pos1, align 8, !dbg !2508
  ret void, !dbg !2509
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2510 {
entry:
    #dbg_value(ptr %state, !2511, !DIExpression(), !2512)
    #dbg_value(ptr %in, !2513, !DIExpression(), !2512)
    #dbg_value(i32 %inlen, !2514, !DIExpression(), !2512)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2515
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2516
  store i32 136, ptr %pos, align 8, !dbg !2517
  ret void, !dbg !2518
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2519 {
entry:
    #dbg_value(ptr %out, !2520, !DIExpression(), !2521)
    #dbg_value(i32 %nblocks, !2522, !DIExpression(), !2521)
    #dbg_value(ptr %state, !2523, !DIExpression(), !2521)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2524
  ret void, !dbg !2525
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2526 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2529, !DIExpression(), !2530)
    #dbg_value(i32 %outlen, !2531, !DIExpression(), !2530)
    #dbg_value(ptr %in, !2532, !DIExpression(), !2530)
    #dbg_value(i32 %inlen, !2533, !DIExpression(), !2530)
    #dbg_declare(ptr %state, !2534, !DIExpression(), !2535)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2536
  %div = udiv i32 %outlen, 168, !dbg !2537
    #dbg_value(i32 %div, !2538, !DIExpression(), !2530)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2539
  %mul.neg = mul i32 %div, -168, !dbg !2540
  %sub = add i32 %mul.neg, %outlen, !dbg !2541
    #dbg_value(i32 %sub, !2531, !DIExpression(), !2530)
  %mul1 = mul nuw i32 %div, 168, !dbg !2542
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2543
    #dbg_value(ptr %add.ptr, !2529, !DIExpression(), !2530)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2544
  ret void, !dbg !2545
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2546 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2547, !DIExpression(), !2548)
    #dbg_value(i32 %outlen, !2549, !DIExpression(), !2548)
    #dbg_value(ptr %in, !2550, !DIExpression(), !2548)
    #dbg_value(i32 %inlen, !2551, !DIExpression(), !2548)
    #dbg_declare(ptr %state, !2552, !DIExpression(), !2553)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2554
  %div = udiv i32 %outlen, 136, !dbg !2555
    #dbg_value(i32 %div, !2556, !DIExpression(), !2548)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2557
  %mul.neg = mul i32 %div, -136, !dbg !2558
  %sub = add i32 %mul.neg, %outlen, !dbg !2559
    #dbg_value(i32 %sub, !2549, !DIExpression(), !2548)
  %mul1 = mul nuw i32 %div, 136, !dbg !2560
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2561
    #dbg_value(ptr %add.ptr, !2547, !DIExpression(), !2548)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2562
  ret void, !dbg !2563
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2564 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2567, !DIExpression(), !2568)
    #dbg_value(ptr %in, !2569, !DIExpression(), !2568)
    #dbg_value(i32 %inlen, !2570, !DIExpression(), !2568)
    #dbg_declare(ptr %s, !2571, !DIExpression(), !2572)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2573
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2574
    #dbg_value(i32 0, !2575, !DIExpression(), !2568)
  br label %for.cond, !dbg !2576

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2578
    #dbg_value(i32 %i.0, !2575, !DIExpression(), !2568)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2579
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2581

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2582
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2583
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2584
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2584
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2585
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2586
    #dbg_value(i32 %inc, !2575, !DIExpression(), !2568)
  br label %for.cond, !dbg !2587, !llvm.loop !2588

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2590
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2591 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2592, !DIExpression(), !2593)
    #dbg_value(ptr %in, !2594, !DIExpression(), !2593)
    #dbg_value(i32 %inlen, !2595, !DIExpression(), !2593)
    #dbg_declare(ptr %s, !2596, !DIExpression(), !2597)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2598
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2599
    #dbg_value(i32 0, !2600, !DIExpression(), !2593)
  br label %for.cond, !dbg !2601

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2603
    #dbg_value(i32 %i.0, !2600, !DIExpression(), !2593)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2604
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2606

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2607
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2608
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2609
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2609
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2610
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2611
    #dbg_value(i32 %inc, !2600, !DIExpression(), !2593)
  br label %for.cond, !dbg !2612, !llvm.loop !2613

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2615
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2616 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2626, !DIExpression(), !2627)
    #dbg_value(ptr %seed, !2628, !DIExpression(), !2627)
    #dbg_value(i8 %x, !2629, !DIExpression(), !2627)
    #dbg_value(i8 %y, !2630, !DIExpression(), !2627)
    #dbg_declare(ptr %extseed, !2631, !DIExpression(), !2635)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2636
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2637
  store i8 %x, ptr %arrayidx, align 1, !dbg !2638
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2639
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2640
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2641
  ret void, !dbg !2642
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2643 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2646, !DIExpression(), !2647)
    #dbg_value(i32 %outlen, !2648, !DIExpression(), !2647)
    #dbg_value(ptr %key, !2649, !DIExpression(), !2647)
    #dbg_value(i8 %nonce, !2650, !DIExpression(), !2647)
    #dbg_declare(ptr %extkey, !2651, !DIExpression(), !2655)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2656
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2657
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2658
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2659
  ret void, !dbg !2660
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2661 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2662, !DIExpression(), !2663)
    #dbg_value(ptr %key, !2664, !DIExpression(), !2663)
    #dbg_value(ptr %input, !2665, !DIExpression(), !2663)
    #dbg_declare(ptr %s, !2666, !DIExpression(), !2667)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2668
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2669
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1088) #3, !dbg !2670
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2671
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2672
  ret void, !dbg !2673
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
!91 = !DILocation(line: 55, column: 3, scope: !79)
!92 = !DILocation(line: 56, column: 3, scope: !79)
!93 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !57, file: !57, line: 76, type: !94, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!112 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!125 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !57, file: !57, line: 140, type: !126, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 8704, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 1088)
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
!156 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !157, file: !157, line: 165, type: !158, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!157 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!158 = !DISubroutineType(types: !159)
!159 = !{null, !160, !64, !9}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !163)
!162 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 12288, elements: !164)
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !163, file: !162, line: 9, baseType: !166, size: 12288)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !167, size: 12288, elements: !175)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !169)
!168 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !170)
!170 = !{!171}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !169, file: !168, line: 12, baseType: !172, size: 4096)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 256)
!175 = !{!176}
!176 = !DISubrange(count: 3)
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
!289 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !157, file: !157, line: 205, type: !290, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 36864, elements: !175)
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
!384 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !157, file: !157, line: 260, type: !385, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!488 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !157, file: !157, line: 314, type: !489, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!531 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !532, file: !532, line: 15, type: !533, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!532 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!533 = !DISubroutineType(types: !534)
!534 = !{null, !60, !535}
!535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !536, size: 32)
!536 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !537)
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !538)
!538 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 12288, elements: !539)
!539 = !{!540}
!540 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !538, file: !162, line: 9, baseType: !541, size: 12288)
!541 = !DICompositeType(tag: DW_TAG_array_type, baseType: !542, size: 12288, elements: !175)
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
!632 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !532, file: !532, line: 89, type: !633, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!717 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !532, file: !532, line: 139, type: !533, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!737 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !532, file: !532, line: 156, type: !633, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!757 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !532, file: !532, line: 170, type: !758, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!776 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !532, file: !532, line: 185, type: !758, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!793 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !532, file: !532, line: 202, type: !794, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!822 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !532, file: !532, line: 225, type: !758, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!839 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !532, file: !532, line: 241, type: !840, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!862 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !863, file: !863, line: 19, type: !864, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!941 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !863, file: !863, line: 83, type: !942, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!983 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !863, file: !863, line: 124, type: !864, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1027 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !863, file: !863, line: 151, type: !942, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1066 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !863, file: !863, line: 168, type: !942, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1104 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !863, file: !863, line: 192, type: !864, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1145 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !863, file: !863, line: 225, type: !1146, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{null, !944, !64, !61}
!1148 = !DILocalVariable(name: "r", arg: 1, scope: !1145, file: !863, line: 225, type: !944)
!1149 = !DILocation(line: 0, scope: !1145)
!1150 = !DILocalVariable(name: "seed", arg: 2, scope: !1145, file: !863, line: 225, type: !64)
!1151 = !DILocalVariable(name: "nonce", arg: 3, scope: !1145, file: !863, line: 225, type: !61)
!1152 = !DILocalVariable(name: "buf", scope: !1145, file: !863, line: 227, type: !1153)
!1153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1154 = !DILocation(line: 227, column: 11, scope: !1145)
!1155 = !DILocation(line: 228, column: 3, scope: !1145)
!1156 = !DILocation(line: 229, column: 3, scope: !1145)
!1157 = !DILocation(line: 230, column: 1, scope: !1145)
!1158 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !863, file: !863, line: 244, type: !1146, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1159 = !DILocalVariable(name: "r", arg: 1, scope: !1158, file: !863, line: 244, type: !944)
!1160 = !DILocation(line: 0, scope: !1158)
!1161 = !DILocalVariable(name: "seed", arg: 2, scope: !1158, file: !863, line: 244, type: !64)
!1162 = !DILocalVariable(name: "nonce", arg: 3, scope: !1158, file: !863, line: 244, type: !61)
!1163 = !DILocalVariable(name: "buf", scope: !1158, file: !863, line: 246, type: !1153)
!1164 = !DILocation(line: 246, column: 11, scope: !1158)
!1165 = !DILocation(line: 247, column: 3, scope: !1158)
!1166 = !DILocation(line: 248, column: 3, scope: !1158)
!1167 = !DILocation(line: 249, column: 1, scope: !1158)
!1168 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !863, file: !863, line: 261, type: !1169, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{null, !944}
!1171 = !DILocalVariable(name: "r", arg: 1, scope: !1168, file: !863, line: 261, type: !944)
!1172 = !DILocation(line: 0, scope: !1168)
!1173 = !DILocation(line: 263, column: 3, scope: !1168)
!1174 = !DILocation(line: 264, column: 3, scope: !1168)
!1175 = !DILocation(line: 265, column: 1, scope: !1168)
!1176 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !863, file: !863, line: 323, type: !1169, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1177 = !DILocalVariable(name: "r", arg: 1, scope: !1176, file: !863, line: 323, type: !944)
!1178 = !DILocation(line: 0, scope: !1176)
!1179 = !DILocalVariable(name: "i", scope: !1176, file: !863, line: 325, type: !42)
!1180 = !DILocation(line: 326, column: 7, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1176, file: !863, line: 326, column: 3)
!1182 = !DILocation(line: 326, scope: !1181)
!1183 = !DILocation(line: 326, column: 12, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1181, file: !863, line: 326, column: 3)
!1185 = !DILocation(line: 326, column: 3, scope: !1181)
!1186 = !DILocation(line: 327, column: 35, scope: !1184)
!1187 = !DILocation(line: 327, column: 20, scope: !1184)
!1188 = !DILocation(line: 327, column: 5, scope: !1184)
!1189 = !DILocation(line: 327, column: 18, scope: !1184)
!1190 = !DILocation(line: 326, column: 22, scope: !1184)
!1191 = !DILocation(line: 326, column: 3, scope: !1184)
!1192 = distinct !{!1192, !1185, !1193, !235}
!1193 = !DILocation(line: 327, column: 47, scope: !1181)
!1194 = !DILocation(line: 328, column: 1, scope: !1176)
!1195 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !863, file: !863, line: 276, type: !1169, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1196 = !DILocalVariable(name: "r", arg: 1, scope: !1195, file: !863, line: 276, type: !944)
!1197 = !DILocation(line: 0, scope: !1195)
!1198 = !DILocation(line: 278, column: 3, scope: !1195)
!1199 = !DILocation(line: 279, column: 1, scope: !1195)
!1200 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !863, file: !863, line: 290, type: !1201, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{null, !944, !866, !866}
!1203 = !DILocalVariable(name: "r", arg: 1, scope: !1200, file: !863, line: 290, type: !944)
!1204 = !DILocation(line: 0, scope: !1200)
!1205 = !DILocalVariable(name: "a", arg: 2, scope: !1200, file: !863, line: 290, type: !866)
!1206 = !DILocalVariable(name: "b", arg: 3, scope: !1200, file: !863, line: 290, type: !866)
!1207 = !DILocalVariable(name: "i", scope: !1200, file: !863, line: 292, type: !42)
!1208 = !DILocation(line: 293, column: 7, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1200, file: !863, line: 293, column: 3)
!1210 = !DILocation(line: 293, scope: !1209)
!1211 = !DILocation(line: 293, column: 12, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1209, file: !863, line: 293, column: 3)
!1213 = !DILocation(line: 293, column: 3, scope: !1209)
!1214 = !DILocation(line: 294, column: 25, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1212, file: !863, line: 293, column: 28)
!1216 = !DILocation(line: 294, column: 14, scope: !1215)
!1217 = !DILocation(line: 294, column: 42, scope: !1215)
!1218 = !DILocation(line: 294, column: 31, scope: !1215)
!1219 = !DILocation(line: 294, column: 59, scope: !1215)
!1220 = !DILocation(line: 294, column: 48, scope: !1215)
!1221 = !DILocation(line: 294, column: 72, scope: !1215)
!1222 = !DILocation(line: 294, column: 64, scope: !1215)
!1223 = !DILocation(line: 294, column: 5, scope: !1215)
!1224 = !DILocation(line: 295, column: 25, scope: !1215)
!1225 = !DILocation(line: 295, column: 27, scope: !1215)
!1226 = !DILocation(line: 295, column: 14, scope: !1215)
!1227 = !DILocation(line: 295, column: 44, scope: !1215)
!1228 = !DILocation(line: 295, column: 46, scope: !1215)
!1229 = !DILocation(line: 295, column: 33, scope: !1215)
!1230 = !DILocation(line: 295, column: 63, scope: !1215)
!1231 = !DILocation(line: 295, column: 65, scope: !1215)
!1232 = !DILocation(line: 295, column: 52, scope: !1215)
!1233 = !DILocation(line: 295, column: 79, scope: !1215)
!1234 = !DILocation(line: 295, column: 71, scope: !1215)
!1235 = !DILocation(line: 295, column: 70, scope: !1215)
!1236 = !DILocation(line: 295, column: 5, scope: !1215)
!1237 = !DILocation(line: 293, column: 24, scope: !1212)
!1238 = !DILocation(line: 293, column: 3, scope: !1212)
!1239 = distinct !{!1239, !1213, !1240, !235}
!1240 = !DILocation(line: 296, column: 3, scope: !1209)
!1241 = !DILocation(line: 297, column: 1, scope: !1200)
!1242 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !863, file: !863, line: 307, type: !1169, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1243 = !DILocalVariable(name: "r", arg: 1, scope: !1242, file: !863, line: 307, type: !944)
!1244 = !DILocation(line: 0, scope: !1242)
!1245 = !DILocalVariable(name: "f", scope: !1242, file: !863, line: 310, type: !13)
!1246 = !DILocalVariable(name: "i", scope: !1242, file: !863, line: 309, type: !42)
!1247 = !DILocation(line: 311, column: 7, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1242, file: !863, line: 311, column: 3)
!1249 = !DILocation(line: 311, scope: !1248)
!1250 = !DILocation(line: 311, column: 12, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1248, file: !863, line: 311, column: 3)
!1252 = !DILocation(line: 311, column: 3, scope: !1248)
!1253 = !DILocation(line: 312, column: 47, scope: !1251)
!1254 = !DILocation(line: 312, column: 38, scope: !1251)
!1255 = !DILocation(line: 312, column: 59, scope: !1251)
!1256 = !DILocation(line: 312, column: 20, scope: !1251)
!1257 = !DILocation(line: 312, column: 5, scope: !1251)
!1258 = !DILocation(line: 312, column: 18, scope: !1251)
!1259 = !DILocation(line: 311, column: 22, scope: !1251)
!1260 = !DILocation(line: 311, column: 3, scope: !1251)
!1261 = distinct !{!1261, !1252, !1262, !235}
!1262 = !DILocation(line: 312, column: 61, scope: !1248)
!1263 = !DILocation(line: 313, column: 1, scope: !1242)
!1264 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !863, file: !863, line: 339, type: !1201, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1265 = !DILocalVariable(name: "r", arg: 1, scope: !1264, file: !863, line: 339, type: !944)
!1266 = !DILocation(line: 0, scope: !1264)
!1267 = !DILocalVariable(name: "a", arg: 2, scope: !1264, file: !863, line: 339, type: !866)
!1268 = !DILocalVariable(name: "b", arg: 3, scope: !1264, file: !863, line: 339, type: !866)
!1269 = !DILocalVariable(name: "i", scope: !1264, file: !863, line: 341, type: !42)
!1270 = !DILocation(line: 342, column: 7, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1264, file: !863, line: 342, column: 3)
!1272 = !DILocation(line: 342, scope: !1271)
!1273 = !DILocation(line: 342, column: 12, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1271, file: !863, line: 342, column: 3)
!1275 = !DILocation(line: 342, column: 3, scope: !1271)
!1276 = !DILocation(line: 343, column: 20, scope: !1274)
!1277 = !DILocation(line: 343, column: 35, scope: !1274)
!1278 = !DILocation(line: 343, column: 33, scope: !1274)
!1279 = !DILocation(line: 343, column: 5, scope: !1274)
!1280 = !DILocation(line: 343, column: 18, scope: !1274)
!1281 = !DILocation(line: 342, column: 22, scope: !1274)
!1282 = !DILocation(line: 342, column: 3, scope: !1274)
!1283 = distinct !{!1283, !1275, !1284, !235}
!1284 = !DILocation(line: 343, column: 46, scope: !1271)
!1285 = !DILocation(line: 344, column: 1, scope: !1264)
!1286 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !863, file: !863, line: 355, type: !1201, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1287 = !DILocalVariable(name: "r", arg: 1, scope: !1286, file: !863, line: 355, type: !944)
!1288 = !DILocation(line: 0, scope: !1286)
!1289 = !DILocalVariable(name: "a", arg: 2, scope: !1286, file: !863, line: 355, type: !866)
!1290 = !DILocalVariable(name: "b", arg: 3, scope: !1286, file: !863, line: 355, type: !866)
!1291 = !DILocalVariable(name: "i", scope: !1286, file: !863, line: 357, type: !42)
!1292 = !DILocation(line: 358, column: 7, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1286, file: !863, line: 358, column: 3)
!1294 = !DILocation(line: 358, scope: !1293)
!1295 = !DILocation(line: 358, column: 12, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1293, file: !863, line: 358, column: 3)
!1297 = !DILocation(line: 358, column: 3, scope: !1293)
!1298 = !DILocation(line: 359, column: 20, scope: !1296)
!1299 = !DILocation(line: 359, column: 35, scope: !1296)
!1300 = !DILocation(line: 359, column: 33, scope: !1296)
!1301 = !DILocation(line: 359, column: 5, scope: !1296)
!1302 = !DILocation(line: 359, column: 18, scope: !1296)
!1303 = !DILocation(line: 358, column: 22, scope: !1296)
!1304 = !DILocation(line: 358, column: 3, scope: !1296)
!1305 = distinct !{!1305, !1297, !1306, !235}
!1306 = !DILocation(line: 359, column: 46, scope: !1293)
!1307 = !DILocation(line: 360, column: 1, scope: !1286)
!1308 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !11, file: !11, line: 80, type: !1309, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1309 = !DISubroutineType(types: !1310)
!1310 = !{null, !248}
!1311 = !DILocalVariable(name: "r", arg: 1, scope: !1308, file: !11, line: 80, type: !248)
!1312 = !DILocation(line: 0, scope: !1308)
!1313 = !DILocalVariable(name: "k", scope: !1308, file: !11, line: 81, type: !42)
!1314 = !DILocalVariable(name: "len", scope: !1308, file: !11, line: 81, type: !42)
!1315 = !DILocation(line: 85, column: 7, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1308, file: !11, line: 85, column: 3)
!1317 = !DILocation(line: 85, scope: !1316)
!1318 = !DILocation(line: 84, column: 5, scope: !1308)
!1319 = !DILocation(line: 85, column: 22, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1316, file: !11, line: 85, column: 3)
!1321 = !DILocation(line: 85, column: 3, scope: !1316)
!1322 = !DILocation(line: 86, column: 5, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1324, file: !11, line: 86, column: 5)
!1324 = distinct !DILexicalBlock(scope: !1320, file: !11, line: 85, column: 39)
!1325 = !DILocation(line: 86, scope: !1323)
!1326 = !DILocalVariable(name: "start", scope: !1308, file: !11, line: 81, type: !42)
!1327 = !DILocation(line: 86, column: 26, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1323, file: !11, line: 86, column: 5)
!1329 = !DILocation(line: 87, column: 14, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1328, file: !11, line: 86, column: 50)
!1331 = !DILocalVariable(name: "zeta", scope: !1308, file: !11, line: 82, type: !14)
!1332 = !DILocalVariable(name: "j", scope: !1308, file: !11, line: 81, type: !42)
!1333 = !DILocation(line: 88, column: 11, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1330, file: !11, line: 88, column: 7)
!1335 = !DILocation(line: 88, scope: !1334)
!1336 = !DILocation(line: 88, column: 32, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1334, file: !11, line: 88, column: 7)
!1338 = !DILocation(line: 88, column: 24, scope: !1337)
!1339 = !DILocation(line: 88, column: 7, scope: !1334)
!1340 = !DILocation(line: 89, column: 25, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1337, file: !11, line: 88, column: 44)
!1342 = !DILocation(line: 89, column: 13, scope: !1341)
!1343 = !DILocalVariable(name: "t", scope: !1308, file: !11, line: 82, type: !14)
!1344 = !DILocation(line: 90, column: 22, scope: !1341)
!1345 = !DILocation(line: 90, column: 27, scope: !1341)
!1346 = !DILocation(line: 90, column: 9, scope: !1341)
!1347 = !DILocation(line: 90, column: 20, scope: !1341)
!1348 = !DILocation(line: 91, column: 16, scope: !1341)
!1349 = !DILocation(line: 91, column: 21, scope: !1341)
!1350 = !DILocation(line: 91, column: 9, scope: !1341)
!1351 = !DILocation(line: 91, column: 14, scope: !1341)
!1352 = !DILocation(line: 88, column: 40, scope: !1337)
!1353 = !DILocation(line: 88, column: 7, scope: !1337)
!1354 = distinct !{!1354, !1339, !1355, !235}
!1355 = !DILocation(line: 92, column: 7, scope: !1334)
!1356 = !DILocation(line: 87, column: 21, scope: !1330)
!1357 = !DILocation(line: 86, column: 43, scope: !1328)
!1358 = !DILocation(line: 86, column: 5, scope: !1328)
!1359 = distinct !{!1359, !1322, !1360, !235}
!1360 = !DILocation(line: 93, column: 5, scope: !1323)
!1361 = !DILocation(line: 85, column: 32, scope: !1320)
!1362 = !DILocation(line: 85, column: 3, scope: !1320)
!1363 = distinct !{!1363, !1321, !1364, !235}
!1364 = !DILocation(line: 94, column: 3, scope: !1316)
!1365 = !DILocation(line: 95, column: 1, scope: !1308)
!1366 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1367, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!14, !14, !14}
!1369 = !DILocalVariable(name: "a", arg: 1, scope: !1366, file: !11, line: 68, type: !14)
!1370 = !DILocation(line: 0, scope: !1366)
!1371 = !DILocalVariable(name: "b", arg: 2, scope: !1366, file: !11, line: 68, type: !14)
!1372 = !DILocation(line: 69, column: 28, scope: !1366)
!1373 = !DILocation(line: 69, column: 39, scope: !1366)
!1374 = !DILocation(line: 69, column: 38, scope: !1366)
!1375 = !DILocation(line: 69, column: 10, scope: !1366)
!1376 = !DILocation(line: 69, column: 3, scope: !1366)
!1377 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !11, file: !11, line: 106, type: !1309, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1378 = !DILocalVariable(name: "r", arg: 1, scope: !1377, file: !11, line: 106, type: !248)
!1379 = !DILocation(line: 0, scope: !1377)
!1380 = !DILocalVariable(name: "f", scope: !1377, file: !11, line: 109, type: !13)
!1381 = !DILocalVariable(name: "k", scope: !1377, file: !11, line: 107, type: !42)
!1382 = !DILocalVariable(name: "len", scope: !1377, file: !11, line: 107, type: !42)
!1383 = !DILocation(line: 112, column: 7, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1377, file: !11, line: 112, column: 3)
!1385 = !DILocation(line: 112, scope: !1384)
!1386 = !DILocation(line: 111, column: 5, scope: !1377)
!1387 = !DILocation(line: 112, column: 20, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1384, file: !11, line: 112, column: 3)
!1389 = !DILocation(line: 112, column: 3, scope: !1384)
!1390 = !DILocation(line: 113, column: 5, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1392, file: !11, line: 113, column: 5)
!1392 = distinct !DILexicalBlock(scope: !1388, file: !11, line: 112, column: 39)
!1393 = !DILocation(line: 124, column: 3, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1377, file: !11, line: 124, column: 3)
!1395 = !DILocation(line: 113, scope: !1391)
!1396 = !DILocalVariable(name: "start", scope: !1377, file: !11, line: 107, type: !42)
!1397 = !DILocation(line: 113, column: 26, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1391, file: !11, line: 113, column: 5)
!1399 = !DILocation(line: 114, column: 14, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1398, file: !11, line: 113, column: 50)
!1401 = !DILocalVariable(name: "zeta", scope: !1377, file: !11, line: 108, type: !14)
!1402 = !DILocalVariable(name: "j", scope: !1377, file: !11, line: 107, type: !42)
!1403 = !DILocation(line: 115, column: 11, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1400, file: !11, line: 115, column: 7)
!1405 = !DILocation(line: 115, scope: !1404)
!1406 = !DILocation(line: 115, column: 32, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1404, file: !11, line: 115, column: 7)
!1408 = !DILocation(line: 115, column: 24, scope: !1407)
!1409 = !DILocation(line: 115, column: 7, scope: !1404)
!1410 = !DILocation(line: 116, column: 13, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1407, file: !11, line: 115, column: 44)
!1412 = !DILocalVariable(name: "t", scope: !1377, file: !11, line: 108, type: !14)
!1413 = !DILocation(line: 117, column: 35, scope: !1411)
!1414 = !DILocation(line: 117, column: 33, scope: !1411)
!1415 = !DILocation(line: 117, column: 16, scope: !1411)
!1416 = !DILocation(line: 117, column: 9, scope: !1411)
!1417 = !DILocation(line: 117, column: 14, scope: !1411)
!1418 = !DILocation(line: 118, column: 22, scope: !1411)
!1419 = !DILocation(line: 118, column: 33, scope: !1411)
!1420 = !DILocation(line: 118, column: 9, scope: !1411)
!1421 = !DILocation(line: 118, column: 20, scope: !1411)
!1422 = !DILocation(line: 119, column: 34, scope: !1411)
!1423 = !DILocation(line: 119, column: 22, scope: !1411)
!1424 = !DILocation(line: 119, column: 9, scope: !1411)
!1425 = !DILocation(line: 119, column: 20, scope: !1411)
!1426 = !DILocation(line: 115, column: 40, scope: !1407)
!1427 = !DILocation(line: 115, column: 7, scope: !1407)
!1428 = distinct !{!1428, !1409, !1429, !235}
!1429 = !DILocation(line: 120, column: 7, scope: !1404)
!1430 = !DILocation(line: 114, column: 21, scope: !1400)
!1431 = !DILocation(line: 113, column: 43, scope: !1398)
!1432 = !DILocation(line: 113, column: 5, scope: !1398)
!1433 = distinct !{!1433, !1390, !1434, !235}
!1434 = !DILocation(line: 121, column: 5, scope: !1391)
!1435 = !DILocation(line: 112, column: 32, scope: !1388)
!1436 = !DILocation(line: 112, column: 3, scope: !1388)
!1437 = distinct !{!1437, !1389, !1438, !235}
!1438 = !DILocation(line: 122, column: 3, scope: !1384)
!1439 = !DILocation(line: 124, scope: !1394)
!1440 = !DILocation(line: 124, column: 16, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1394, file: !11, line: 124, column: 3)
!1442 = !DILocation(line: 125, column: 18, scope: !1441)
!1443 = !DILocation(line: 125, column: 12, scope: !1441)
!1444 = !DILocation(line: 125, column: 5, scope: !1441)
!1445 = !DILocation(line: 125, column: 10, scope: !1441)
!1446 = !DILocation(line: 124, column: 24, scope: !1441)
!1447 = !DILocation(line: 124, column: 3, scope: !1441)
!1448 = distinct !{!1448, !1393, !1449, !235}
!1449 = !DILocation(line: 125, column: 25, scope: !1394)
!1450 = !DILocation(line: 126, column: 1, scope: !1377)
!1451 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !11, file: !11, line: 139, type: !1452, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{null, !248, !1454, !1454, !14}
!1454 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1455 = !DILocalVariable(name: "r", arg: 1, scope: !1451, file: !11, line: 139, type: !248)
!1456 = !DILocation(line: 0, scope: !1451)
!1457 = !DILocalVariable(name: "a", arg: 2, scope: !1451, file: !11, line: 139, type: !1454)
!1458 = !DILocalVariable(name: "b", arg: 3, scope: !1451, file: !11, line: 139, type: !1454)
!1459 = !DILocalVariable(name: "zeta", arg: 4, scope: !1451, file: !11, line: 139, type: !14)
!1460 = !DILocation(line: 141, column: 17, scope: !1451)
!1461 = !DILocation(line: 141, column: 23, scope: !1451)
!1462 = !DILocation(line: 141, column: 11, scope: !1451)
!1463 = !DILocation(line: 141, column: 9, scope: !1451)
!1464 = !DILocation(line: 142, column: 11, scope: !1451)
!1465 = !DILocation(line: 142, column: 9, scope: !1451)
!1466 = !DILocation(line: 143, column: 17, scope: !1451)
!1467 = !DILocation(line: 143, column: 23, scope: !1451)
!1468 = !DILocation(line: 143, column: 11, scope: !1451)
!1469 = !DILocation(line: 143, column: 8, scope: !1451)
!1470 = !DILocation(line: 144, column: 17, scope: !1451)
!1471 = !DILocation(line: 144, column: 23, scope: !1451)
!1472 = !DILocation(line: 144, column: 11, scope: !1451)
!1473 = !DILocation(line: 144, column: 3, scope: !1451)
!1474 = !DILocation(line: 144, column: 9, scope: !1451)
!1475 = !DILocation(line: 145, column: 17, scope: !1451)
!1476 = !DILocation(line: 145, column: 23, scope: !1451)
!1477 = !DILocation(line: 145, column: 11, scope: !1451)
!1478 = !DILocation(line: 145, column: 3, scope: !1451)
!1479 = !DILocation(line: 145, column: 8, scope: !1451)
!1480 = !DILocation(line: 146, column: 1, scope: !1451)
!1481 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1482, file: !1482, line: 110, type: !1483, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1482 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1483 = !DISubroutineType(types: !1484)
!1484 = !{null, !1485, !64}
!1485 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1486, size: 32)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !1487)
!1487 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !1488)
!1488 = !{!1489}
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1487, file: !168, line: 12, baseType: !172, size: 4096)
!1490 = !DILocalVariable(name: "r", arg: 1, scope: !1481, file: !1482, line: 110, type: !1485)
!1491 = !DILocation(line: 0, scope: !1481)
!1492 = !DILocalVariable(name: "buf", arg: 2, scope: !1481, file: !1482, line: 110, type: !64)
!1493 = !DILocation(line: 113, column: 3, scope: !1481)
!1494 = !DILocation(line: 119, column: 1, scope: !1481)
!1495 = distinct !DISubprogram(name: "cbd2", scope: !1482, file: !1482, line: 58, type: !1483, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1496 = !DILocalVariable(name: "r", arg: 1, scope: !1495, file: !1482, line: 58, type: !1485)
!1497 = !DILocation(line: 0, scope: !1495)
!1498 = !DILocalVariable(name: "buf", arg: 2, scope: !1495, file: !1482, line: 58, type: !64)
!1499 = !DILocalVariable(name: "i", scope: !1495, file: !1482, line: 60, type: !42)
!1500 = !DILocation(line: 64, column: 7, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1495, file: !1482, line: 64, column: 3)
!1502 = !DILocation(line: 64, scope: !1501)
!1503 = !DILocation(line: 64, column: 12, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1501, file: !1482, line: 64, column: 3)
!1505 = !DILocation(line: 64, column: 3, scope: !1501)
!1506 = !DILocation(line: 65, column: 35, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1504, file: !1482, line: 64, column: 28)
!1508 = !DILocation(line: 65, column: 33, scope: !1507)
!1509 = !DILocation(line: 65, column: 10, scope: !1507)
!1510 = !DILocalVariable(name: "t", scope: !1495, file: !1482, line: 61, type: !40)
!1511 = !DILocation(line: 66, column: 12, scope: !1507)
!1512 = !DILocalVariable(name: "d", scope: !1495, file: !1482, line: 61, type: !40)
!1513 = !DILocation(line: 67, column: 12, scope: !1507)
!1514 = !DILocation(line: 67, column: 17, scope: !1507)
!1515 = !DILocation(line: 67, column: 7, scope: !1507)
!1516 = !DILocalVariable(name: "j", scope: !1495, file: !1482, line: 60, type: !42)
!1517 = !DILocation(line: 69, column: 9, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1507, file: !1482, line: 69, column: 5)
!1519 = !DILocation(line: 69, scope: !1518)
!1520 = !DILocation(line: 69, column: 14, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1518, file: !1482, line: 69, column: 5)
!1522 = !DILocation(line: 69, column: 5, scope: !1518)
!1523 = !DILocation(line: 70, column: 19, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1521, file: !1482, line: 69, column: 22)
!1525 = !DILocation(line: 70, column: 14, scope: !1524)
!1526 = !DILocation(line: 70, column: 11, scope: !1524)
!1527 = !DILocalVariable(name: "a", scope: !1495, file: !1482, line: 62, type: !14)
!1528 = !DILocation(line: 71, column: 19, scope: !1524)
!1529 = !DILocation(line: 71, column: 21, scope: !1524)
!1530 = !DILocation(line: 71, column: 14, scope: !1524)
!1531 = !DILocation(line: 71, column: 11, scope: !1524)
!1532 = !DILocalVariable(name: "b", scope: !1495, file: !1482, line: 62, type: !14)
!1533 = !DILocation(line: 72, column: 28, scope: !1524)
!1534 = !DILocation(line: 72, column: 26, scope: !1524)
!1535 = !DILocation(line: 72, column: 18, scope: !1524)
!1536 = !DILocation(line: 72, column: 20, scope: !1524)
!1537 = !DILocation(line: 72, column: 7, scope: !1524)
!1538 = !DILocation(line: 72, column: 24, scope: !1524)
!1539 = !DILocation(line: 69, column: 18, scope: !1521)
!1540 = !DILocation(line: 69, column: 5, scope: !1521)
!1541 = distinct !{!1541, !1522, !1542, !235}
!1542 = !DILocation(line: 73, column: 5, scope: !1518)
!1543 = !DILocation(line: 64, column: 24, scope: !1504)
!1544 = !DILocation(line: 64, column: 3, scope: !1504)
!1545 = distinct !{!1545, !1505, !1546, !235}
!1546 = !DILocation(line: 74, column: 3, scope: !1501)
!1547 = !DILocation(line: 75, column: 1, scope: !1495)
!1548 = distinct !DISubprogram(name: "load32_littleendian", scope: !1482, file: !1482, line: 15, type: !1549, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1549 = !DISubroutineType(types: !1550)
!1550 = !{!40, !64}
!1551 = !DILocalVariable(name: "x", arg: 1, scope: !1548, file: !1482, line: 15, type: !64)
!1552 = !DILocation(line: 0, scope: !1548)
!1553 = !DILocation(line: 18, column: 18, scope: !1548)
!1554 = !DILocation(line: 18, column: 8, scope: !1548)
!1555 = !DILocalVariable(name: "r", scope: !1548, file: !1482, line: 17, type: !40)
!1556 = !DILocation(line: 19, column: 18, scope: !1548)
!1557 = !DILocation(line: 19, column: 8, scope: !1548)
!1558 = !DILocation(line: 19, column: 23, scope: !1548)
!1559 = !DILocation(line: 19, column: 5, scope: !1548)
!1560 = !DILocation(line: 20, column: 18, scope: !1548)
!1561 = !DILocation(line: 20, column: 8, scope: !1548)
!1562 = !DILocation(line: 20, column: 23, scope: !1548)
!1563 = !DILocation(line: 20, column: 5, scope: !1548)
!1564 = !DILocation(line: 21, column: 18, scope: !1548)
!1565 = !DILocation(line: 21, column: 8, scope: !1548)
!1566 = !DILocation(line: 21, column: 23, scope: !1548)
!1567 = !DILocation(line: 21, column: 5, scope: !1548)
!1568 = !DILocation(line: 22, column: 3, scope: !1548)
!1569 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1482, file: !1482, line: 121, type: !1483, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1570 = !DILocalVariable(name: "r", arg: 1, scope: !1569, file: !1482, line: 121, type: !1485)
!1571 = !DILocation(line: 0, scope: !1569)
!1572 = !DILocalVariable(name: "buf", arg: 2, scope: !1569, file: !1482, line: 121, type: !64)
!1573 = !DILocation(line: 124, column: 3, scope: !1569)
!1574 = !DILocation(line: 128, column: 1, scope: !1569)
!1575 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1576, file: !1576, line: 16, type: !1577, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1576 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1577 = !DISubroutineType(types: !48)
!1578 = !DILocalVariable(name: "a", arg: 1, scope: !1575, file: !1576, line: 16, type: !5)
!1579 = !DILocation(line: 0, scope: !1575)
!1580 = !DILocalVariable(name: "t", scope: !1575, file: !1576, line: 18, type: !14)
!1581 = !DILocation(line: 21, column: 12, scope: !1575)
!1582 = !DILocation(line: 21, column: 22, scope: !1575)
!1583 = !DILocation(line: 21, column: 10, scope: !1575)
!1584 = !DILocation(line: 21, column: 32, scope: !1575)
!1585 = !DILocation(line: 21, column: 7, scope: !1575)
!1586 = !DILocation(line: 22, column: 3, scope: !1575)
!1587 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1576, file: !1576, line: 35, type: !1588, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1588 = !DISubroutineType(types: !1589)
!1589 = !{!14, !14}
!1590 = !DILocalVariable(name: "a", arg: 1, scope: !1587, file: !1576, line: 35, type: !14)
!1591 = !DILocation(line: 0, scope: !1587)
!1592 = !DILocalVariable(name: "v", scope: !1587, file: !1576, line: 37, type: !13)
!1593 = !DILocation(line: 39, column: 20, scope: !1587)
!1594 = !DILocation(line: 39, column: 19, scope: !1587)
!1595 = !DILocation(line: 39, column: 22, scope: !1587)
!1596 = !DILocation(line: 39, column: 33, scope: !1587)
!1597 = !DILocalVariable(name: "t", scope: !1587, file: !1576, line: 36, type: !14)
!1598 = !DILocation(line: 41, column: 10, scope: !1587)
!1599 = !DILocation(line: 41, column: 3, scope: !1587)
!1600 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1601, file: !1601, line: 16, type: !1602, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1601 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1602 = !DISubroutineType(types: !1603)
!1603 = !{!9, !64, !64, !1604}
!1604 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1605, line: 214, baseType: !42)
!1605 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1606 = !DILocalVariable(name: "a", arg: 1, scope: !1600, file: !1601, line: 16, type: !64)
!1607 = !DILocation(line: 0, scope: !1600)
!1608 = !DILocalVariable(name: "b", arg: 2, scope: !1600, file: !1601, line: 16, type: !64)
!1609 = !DILocalVariable(name: "len", arg: 3, scope: !1600, file: !1601, line: 16, type: !1604)
!1610 = !DILocalVariable(name: "r", scope: !1600, file: !1601, line: 19, type: !61)
!1611 = !DILocalVariable(name: "i", scope: !1600, file: !1601, line: 18, type: !1604)
!1612 = !DILocation(line: 21, column: 7, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1600, file: !1601, line: 21, column: 3)
!1614 = !DILocation(line: 21, scope: !1613)
!1615 = !DILocation(line: 21, column: 12, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1613, file: !1601, line: 21, column: 3)
!1617 = !DILocation(line: 21, column: 3, scope: !1613)
!1618 = !DILocation(line: 22, column: 10, scope: !1616)
!1619 = !DILocation(line: 22, column: 17, scope: !1616)
!1620 = !DILocation(line: 22, column: 15, scope: !1616)
!1621 = !DILocation(line: 22, column: 7, scope: !1616)
!1622 = !DILocation(line: 21, column: 18, scope: !1616)
!1623 = !DILocation(line: 21, column: 3, scope: !1616)
!1624 = distinct !{!1624, !1617, !1625, !235}
!1625 = !DILocation(line: 22, column: 20, scope: !1613)
!1626 = !DILocation(line: 24, column: 25, scope: !1600)
!1627 = !DILocation(line: 24, column: 10, scope: !1600)
!1628 = !DILocation(line: 24, column: 3, scope: !1600)
!1629 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1601, file: !1601, line: 40, type: !1630, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{null, !60, !64, !1604, !61}
!1632 = !DILocalVariable(name: "r", arg: 1, scope: !1629, file: !1601, line: 40, type: !60)
!1633 = !DILocation(line: 0, scope: !1629)
!1634 = !DILocalVariable(name: "x", arg: 2, scope: !1629, file: !1601, line: 40, type: !64)
!1635 = !DILocalVariable(name: "len", arg: 3, scope: !1629, file: !1601, line: 40, type: !1604)
!1636 = !DILocalVariable(name: "b", arg: 4, scope: !1629, file: !1601, line: 40, type: !61)
!1637 = !DILocation(line: 51, column: 3, scope: !1629)
!1638 = !{i64 1722}
!1639 = !DILocation(line: 54, column: 7, scope: !1629)
!1640 = !DILocalVariable(name: "i", scope: !1629, file: !1601, line: 42, type: !1604)
!1641 = !DILocation(line: 55, column: 7, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1629, file: !1601, line: 55, column: 3)
!1643 = !DILocation(line: 55, scope: !1642)
!1644 = !DILocation(line: 55, column: 12, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1642, file: !1601, line: 55, column: 3)
!1646 = !DILocation(line: 55, column: 3, scope: !1642)
!1647 = !DILocation(line: 56, column: 18, scope: !1645)
!1648 = !DILocation(line: 56, column: 25, scope: !1645)
!1649 = !DILocation(line: 56, column: 23, scope: !1645)
!1650 = !DILocation(line: 56, column: 15, scope: !1645)
!1651 = !DILocation(line: 56, column: 5, scope: !1645)
!1652 = !DILocation(line: 56, column: 10, scope: !1645)
!1653 = !DILocation(line: 55, column: 18, scope: !1645)
!1654 = !DILocation(line: 55, column: 3, scope: !1645)
!1655 = distinct !{!1655, !1646, !1656, !235}
!1656 = !DILocation(line: 56, column: 29, scope: !1642)
!1657 = !DILocation(line: 57, column: 1, scope: !1629)
!1658 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1601, file: !1601, line: 71, type: !1659, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1659 = !DISubroutineType(types: !1660)
!1660 = !{null, !248, !14, !35}
!1661 = !DILocalVariable(name: "r", arg: 1, scope: !1658, file: !1601, line: 71, type: !248)
!1662 = !DILocation(line: 0, scope: !1658)
!1663 = !DILocalVariable(name: "v", arg: 2, scope: !1658, file: !1601, line: 71, type: !14)
!1664 = !DILocalVariable(name: "b", arg: 3, scope: !1658, file: !1601, line: 71, type: !35)
!1665 = !DILocation(line: 73, column: 7, scope: !1658)
!1666 = !DILocation(line: 74, column: 15, scope: !1658)
!1667 = !DILocation(line: 74, column: 19, scope: !1658)
!1668 = !DILocation(line: 74, column: 11, scope: !1658)
!1669 = !DILocation(line: 74, column: 6, scope: !1658)
!1670 = !DILocation(line: 75, column: 1, scope: !1658)
!1671 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !1672, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{null, !1674}
!1674 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1675, size: 32)
!1675 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !1676)
!1676 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !1677)
!1677 = !{!1678, !1679}
!1678 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1676, file: !190, line: 15, baseType: !194, size: 1600)
!1679 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1676, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!1680 = !DILocalVariable(name: "state", arg: 1, scope: !1671, file: !27, line: 523, type: !1674)
!1681 = !DILocation(line: 0, scope: !1671)
!1682 = !DILocation(line: 525, column: 3, scope: !1671)
!1683 = !DILocation(line: 526, column: 10, scope: !1671)
!1684 = !DILocation(line: 526, column: 14, scope: !1671)
!1685 = !DILocation(line: 527, column: 1, scope: !1671)
!1686 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !1687, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1687 = !DISubroutineType(types: !1688)
!1688 = !{null, !1689}
!1689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!1690 = !DILocalVariable(name: "s", arg: 1, scope: !1686, file: !27, line: 353, type: !1689)
!1691 = !DILocation(line: 0, scope: !1686)
!1692 = !DILocalVariable(name: "i", scope: !1686, file: !27, line: 355, type: !42)
!1693 = !DILocation(line: 356, column: 7, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1686, file: !27, line: 356, column: 3)
!1695 = !DILocation(line: 356, scope: !1694)
!1696 = !DILocation(line: 356, column: 12, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1694, file: !27, line: 356, column: 3)
!1698 = !DILocation(line: 356, column: 3, scope: !1694)
!1699 = !DILocation(line: 357, column: 5, scope: !1697)
!1700 = !DILocation(line: 357, column: 10, scope: !1697)
!1701 = !DILocation(line: 356, column: 17, scope: !1697)
!1702 = !DILocation(line: 356, column: 3, scope: !1697)
!1703 = distinct !{!1703, !1698, !1704, !235}
!1704 = !DILocation(line: 357, column: 12, scope: !1694)
!1705 = !DILocation(line: 358, column: 1, scope: !1686)
!1706 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !1707, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1707 = !DISubroutineType(types: !1708)
!1708 = !{null, !1674, !64, !1604}
!1709 = !DILocalVariable(name: "state", arg: 1, scope: !1706, file: !27, line: 538, type: !1674)
!1710 = !DILocation(line: 0, scope: !1706)
!1711 = !DILocalVariable(name: "in", arg: 2, scope: !1706, file: !27, line: 538, type: !64)
!1712 = !DILocalVariable(name: "inlen", arg: 3, scope: !1706, file: !27, line: 538, type: !1604)
!1713 = !DILocation(line: 540, column: 47, scope: !1706)
!1714 = !DILocation(line: 540, column: 16, scope: !1706)
!1715 = !DILocation(line: 540, column: 10, scope: !1706)
!1716 = !DILocation(line: 540, column: 14, scope: !1706)
!1717 = !DILocation(line: 541, column: 1, scope: !1706)
!1718 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !1719, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!42, !1689, !42, !42, !64, !1604}
!1721 = !DILocalVariable(name: "s", arg: 1, scope: !1718, file: !27, line: 373, type: !1689)
!1722 = !DILocation(line: 0, scope: !1718)
!1723 = !DILocalVariable(name: "pos", arg: 2, scope: !1718, file: !27, line: 374, type: !42)
!1724 = !DILocalVariable(name: "r", arg: 3, scope: !1718, file: !27, line: 375, type: !42)
!1725 = !DILocalVariable(name: "in", arg: 4, scope: !1718, file: !27, line: 376, type: !64)
!1726 = !DILocalVariable(name: "inlen", arg: 5, scope: !1718, file: !27, line: 377, type: !1604)
!1727 = !DILocation(line: 381, column: 3, scope: !1718)
!1728 = !DILocation(line: 381, column: 12, scope: !1718)
!1729 = !DILocation(line: 381, column: 19, scope: !1718)
!1730 = !DILocation(line: 382, column: 5, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1732, file: !27, line: 382, column: 5)
!1732 = distinct !DILexicalBlock(scope: !1718, file: !27, line: 381, column: 25)
!1733 = !DILocation(line: 389, column: 3, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1718, file: !27, line: 389, column: 3)
!1735 = !DILocation(line: 382, scope: !1731)
!1736 = !DILocalVariable(name: "i", scope: !1718, file: !27, line: 379, type: !42)
!1737 = !DILocation(line: 382, column: 16, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1731, file: !27, line: 382, column: 5)
!1739 = !DILocation(line: 383, column: 27, scope: !1738)
!1740 = !DILocation(line: 383, column: 17, scope: !1738)
!1741 = !DILocation(line: 383, column: 37, scope: !1738)
!1742 = !DILocation(line: 383, column: 33, scope: !1738)
!1743 = !DILocation(line: 383, column: 10, scope: !1738)
!1744 = !DILocation(line: 383, column: 7, scope: !1738)
!1745 = !DILocation(line: 383, column: 14, scope: !1738)
!1746 = !DILocation(line: 383, column: 30, scope: !1738)
!1747 = !DILocation(line: 382, column: 20, scope: !1738)
!1748 = !DILocation(line: 382, column: 5, scope: !1738)
!1749 = distinct !{!1749, !1730, !1750, !235}
!1750 = !DILocation(line: 383, column: 42, scope: !1731)
!1751 = !DILocation(line: 384, column: 15, scope: !1732)
!1752 = !DILocation(line: 384, column: 11, scope: !1732)
!1753 = !DILocation(line: 385, column: 5, scope: !1732)
!1754 = distinct !{!1754, !1727, !1755, !235}
!1755 = !DILocation(line: 387, column: 3, scope: !1718)
!1756 = !DILocation(line: 389, scope: !1734)
!1757 = !DILocation(line: 389, column: 18, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1734, file: !27, line: 389, column: 3)
!1759 = !DILocation(line: 389, column: 14, scope: !1758)
!1760 = !DILocation(line: 390, column: 25, scope: !1758)
!1761 = !DILocation(line: 390, column: 15, scope: !1758)
!1762 = !DILocation(line: 390, column: 35, scope: !1758)
!1763 = !DILocation(line: 390, column: 31, scope: !1758)
!1764 = !DILocation(line: 390, column: 8, scope: !1758)
!1765 = !DILocation(line: 390, column: 5, scope: !1758)
!1766 = !DILocation(line: 390, column: 12, scope: !1758)
!1767 = !DILocation(line: 390, column: 28, scope: !1758)
!1768 = !DILocation(line: 389, column: 26, scope: !1758)
!1769 = !DILocation(line: 389, column: 3, scope: !1758)
!1770 = distinct !{!1770, !1733, !1771, !235}
!1771 = !DILocation(line: 390, column: 40, scope: !1734)
!1772 = !DILocation(line: 392, column: 3, scope: !1718)
!1773 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !1687, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1774 = !DILocalVariable(name: "state", arg: 1, scope: !1773, file: !27, line: 82, type: !1689)
!1775 = !DILocation(line: 0, scope: !1773)
!1776 = !DILocation(line: 100, column: 15, scope: !1773)
!1777 = !DILocalVariable(name: "Aba", scope: !1773, file: !27, line: 86, type: !23)
!1778 = !DILocation(line: 101, column: 15, scope: !1773)
!1779 = !DILocalVariable(name: "Abe", scope: !1773, file: !27, line: 86, type: !23)
!1780 = !DILocation(line: 102, column: 15, scope: !1773)
!1781 = !DILocalVariable(name: "Abi", scope: !1773, file: !27, line: 86, type: !23)
!1782 = !DILocation(line: 103, column: 15, scope: !1773)
!1783 = !DILocalVariable(name: "Abo", scope: !1773, file: !27, line: 86, type: !23)
!1784 = !DILocation(line: 104, column: 15, scope: !1773)
!1785 = !DILocalVariable(name: "Abu", scope: !1773, file: !27, line: 86, type: !23)
!1786 = !DILocation(line: 105, column: 15, scope: !1773)
!1787 = !DILocalVariable(name: "Aga", scope: !1773, file: !27, line: 87, type: !23)
!1788 = !DILocation(line: 106, column: 15, scope: !1773)
!1789 = !DILocalVariable(name: "Age", scope: !1773, file: !27, line: 87, type: !23)
!1790 = !DILocation(line: 107, column: 15, scope: !1773)
!1791 = !DILocalVariable(name: "Agi", scope: !1773, file: !27, line: 87, type: !23)
!1792 = !DILocation(line: 108, column: 15, scope: !1773)
!1793 = !DILocalVariable(name: "Ago", scope: !1773, file: !27, line: 87, type: !23)
!1794 = !DILocation(line: 109, column: 15, scope: !1773)
!1795 = !DILocalVariable(name: "Agu", scope: !1773, file: !27, line: 87, type: !23)
!1796 = !DILocation(line: 110, column: 15, scope: !1773)
!1797 = !DILocalVariable(name: "Aka", scope: !1773, file: !27, line: 88, type: !23)
!1798 = !DILocation(line: 111, column: 15, scope: !1773)
!1799 = !DILocalVariable(name: "Ake", scope: !1773, file: !27, line: 88, type: !23)
!1800 = !DILocation(line: 112, column: 15, scope: !1773)
!1801 = !DILocalVariable(name: "Aki", scope: !1773, file: !27, line: 88, type: !23)
!1802 = !DILocation(line: 113, column: 15, scope: !1773)
!1803 = !DILocalVariable(name: "Ako", scope: !1773, file: !27, line: 88, type: !23)
!1804 = !DILocation(line: 114, column: 15, scope: !1773)
!1805 = !DILocalVariable(name: "Aku", scope: !1773, file: !27, line: 88, type: !23)
!1806 = !DILocation(line: 115, column: 15, scope: !1773)
!1807 = !DILocalVariable(name: "Ama", scope: !1773, file: !27, line: 89, type: !23)
!1808 = !DILocation(line: 116, column: 15, scope: !1773)
!1809 = !DILocalVariable(name: "Ame", scope: !1773, file: !27, line: 89, type: !23)
!1810 = !DILocation(line: 117, column: 15, scope: !1773)
!1811 = !DILocalVariable(name: "Ami", scope: !1773, file: !27, line: 89, type: !23)
!1812 = !DILocation(line: 118, column: 15, scope: !1773)
!1813 = !DILocalVariable(name: "Amo", scope: !1773, file: !27, line: 89, type: !23)
!1814 = !DILocation(line: 119, column: 15, scope: !1773)
!1815 = !DILocalVariable(name: "Amu", scope: !1773, file: !27, line: 89, type: !23)
!1816 = !DILocation(line: 120, column: 15, scope: !1773)
!1817 = !DILocalVariable(name: "Asa", scope: !1773, file: !27, line: 90, type: !23)
!1818 = !DILocation(line: 121, column: 15, scope: !1773)
!1819 = !DILocalVariable(name: "Ase", scope: !1773, file: !27, line: 90, type: !23)
!1820 = !DILocation(line: 122, column: 15, scope: !1773)
!1821 = !DILocalVariable(name: "Asi", scope: !1773, file: !27, line: 90, type: !23)
!1822 = !DILocation(line: 123, column: 15, scope: !1773)
!1823 = !DILocalVariable(name: "Aso", scope: !1773, file: !27, line: 90, type: !23)
!1824 = !DILocation(line: 124, column: 15, scope: !1773)
!1825 = !DILocalVariable(name: "Asu", scope: !1773, file: !27, line: 90, type: !23)
!1826 = !DILocalVariable(name: "round", scope: !1773, file: !27, line: 84, type: !9)
!1827 = !DILocation(line: 126, column: 13, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1773, file: !27, line: 126, column: 9)
!1829 = !DILocation(line: 126, scope: !1828)
!1830 = !DILocation(line: 126, column: 30, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1828, file: !27, line: 126, column: 9)
!1832 = !DILocation(line: 126, column: 9, scope: !1828)
!1833 = !DILocalVariable(name: "BCa", scope: !1773, file: !27, line: 91, type: !23)
!1834 = !DILocalVariable(name: "BCe", scope: !1773, file: !27, line: 91, type: !23)
!1835 = !DILocalVariable(name: "BCi", scope: !1773, file: !27, line: 91, type: !23)
!1836 = !DILocalVariable(name: "BCo", scope: !1773, file: !27, line: 91, type: !23)
!1837 = !DILocalVariable(name: "BCu", scope: !1773, file: !27, line: 91, type: !23)
!1838 = !DILocalVariable(name: "Da", scope: !1773, file: !27, line: 92, type: !23)
!1839 = !DILocalVariable(name: "De", scope: !1773, file: !27, line: 92, type: !23)
!1840 = !DILocalVariable(name: "Di", scope: !1773, file: !27, line: 92, type: !23)
!1841 = !DILocalVariable(name: "Do", scope: !1773, file: !27, line: 92, type: !23)
!1842 = !DILocalVariable(name: "Du", scope: !1773, file: !27, line: 92, type: !23)
!1843 = !DILocalVariable(name: "Eba", scope: !1773, file: !27, line: 93, type: !23)
!1844 = !DILocalVariable(name: "Ebe", scope: !1773, file: !27, line: 93, type: !23)
!1845 = !DILocalVariable(name: "Ebi", scope: !1773, file: !27, line: 93, type: !23)
!1846 = !DILocalVariable(name: "Ebo", scope: !1773, file: !27, line: 93, type: !23)
!1847 = !DILocalVariable(name: "Ebu", scope: !1773, file: !27, line: 93, type: !23)
!1848 = !DILocalVariable(name: "Ega", scope: !1773, file: !27, line: 94, type: !23)
!1849 = !DILocalVariable(name: "Ege", scope: !1773, file: !27, line: 94, type: !23)
!1850 = !DILocalVariable(name: "Egi", scope: !1773, file: !27, line: 94, type: !23)
!1851 = !DILocalVariable(name: "Ego", scope: !1773, file: !27, line: 94, type: !23)
!1852 = !DILocalVariable(name: "Egu", scope: !1773, file: !27, line: 94, type: !23)
!1853 = !DILocalVariable(name: "Eka", scope: !1773, file: !27, line: 95, type: !23)
!1854 = !DILocalVariable(name: "Eke", scope: !1773, file: !27, line: 95, type: !23)
!1855 = !DILocalVariable(name: "Eki", scope: !1773, file: !27, line: 95, type: !23)
!1856 = !DILocalVariable(name: "Eko", scope: !1773, file: !27, line: 95, type: !23)
!1857 = !DILocalVariable(name: "Eku", scope: !1773, file: !27, line: 95, type: !23)
!1858 = !DILocalVariable(name: "Ema", scope: !1773, file: !27, line: 96, type: !23)
!1859 = !DILocalVariable(name: "Eme", scope: !1773, file: !27, line: 96, type: !23)
!1860 = !DILocalVariable(name: "Emi", scope: !1773, file: !27, line: 96, type: !23)
!1861 = !DILocalVariable(name: "Emo", scope: !1773, file: !27, line: 96, type: !23)
!1862 = !DILocalVariable(name: "Emu", scope: !1773, file: !27, line: 96, type: !23)
!1863 = !DILocalVariable(name: "Esa", scope: !1773, file: !27, line: 97, type: !23)
!1864 = !DILocalVariable(name: "Ese", scope: !1773, file: !27, line: 97, type: !23)
!1865 = !DILocalVariable(name: "Esi", scope: !1773, file: !27, line: 97, type: !23)
!1866 = !DILocalVariable(name: "Eso", scope: !1773, file: !27, line: 97, type: !23)
!1867 = !DILocalVariable(name: "Esu", scope: !1773, file: !27, line: 97, type: !23)
!1868 = !DILocation(line: 130, column: 22, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1831, file: !27, line: 126, column: 53)
!1870 = !DILocation(line: 130, column: 26, scope: !1869)
!1871 = !DILocation(line: 130, column: 30, scope: !1869)
!1872 = !DILocation(line: 130, column: 34, scope: !1869)
!1873 = !DILocation(line: 132, column: 22, scope: !1869)
!1874 = !DILocation(line: 132, column: 26, scope: !1869)
!1875 = !DILocation(line: 132, column: 30, scope: !1869)
!1876 = !DILocation(line: 132, column: 34, scope: !1869)
!1877 = !DILocation(line: 138, column: 22, scope: !1869)
!1878 = !DILocation(line: 138, column: 21, scope: !1869)
!1879 = !DILocation(line: 208, column: 17, scope: !1869)
!1880 = !DILocation(line: 209, column: 19, scope: !1869)
!1881 = !DILocation(line: 129, column: 22, scope: !1869)
!1882 = !DILocation(line: 129, column: 26, scope: !1869)
!1883 = !DILocation(line: 129, column: 30, scope: !1869)
!1884 = !DILocation(line: 129, column: 34, scope: !1869)
!1885 = !DILocation(line: 135, column: 22, scope: !1869)
!1886 = !DILocation(line: 135, column: 21, scope: !1869)
!1887 = !DILocation(line: 212, column: 17, scope: !1869)
!1888 = !DILocation(line: 213, column: 19, scope: !1869)
!1889 = !DILocation(line: 131, column: 22, scope: !1869)
!1890 = !DILocation(line: 131, column: 26, scope: !1869)
!1891 = !DILocation(line: 131, column: 30, scope: !1869)
!1892 = !DILocation(line: 131, column: 34, scope: !1869)
!1893 = !DILocation(line: 128, column: 22, scope: !1869)
!1894 = !DILocation(line: 128, column: 26, scope: !1869)
!1895 = !DILocation(line: 128, column: 30, scope: !1869)
!1896 = !DILocation(line: 128, column: 34, scope: !1869)
!1897 = !DILocation(line: 139, column: 22, scope: !1869)
!1898 = !DILocation(line: 139, column: 21, scope: !1869)
!1899 = !DILocation(line: 210, column: 17, scope: !1869)
!1900 = !DILocation(line: 211, column: 19, scope: !1869)
!1901 = !DILocation(line: 217, column: 28, scope: !1869)
!1902 = !DILocation(line: 217, column: 33, scope: !1869)
!1903 = !DILocation(line: 217, column: 25, scope: !1869)
!1904 = !DILocation(line: 137, column: 22, scope: !1869)
!1905 = !DILocation(line: 137, column: 21, scope: !1869)
!1906 = !DILocation(line: 145, column: 17, scope: !1869)
!1907 = !DILocation(line: 146, column: 19, scope: !1869)
!1908 = !DILocation(line: 136, column: 22, scope: !1869)
!1909 = !DILocation(line: 136, column: 21, scope: !1869)
!1910 = !DILocation(line: 143, column: 17, scope: !1869)
!1911 = !DILocation(line: 144, column: 19, scope: !1869)
!1912 = !DILocation(line: 151, column: 28, scope: !1869)
!1913 = !DILocation(line: 151, column: 33, scope: !1869)
!1914 = !DILocation(line: 152, column: 30, scope: !1869)
!1915 = !DILocation(line: 152, column: 17, scope: !1869)
!1916 = !DILocation(line: 141, column: 17, scope: !1869)
!1917 = !DILocation(line: 158, column: 17, scope: !1869)
!1918 = !DILocation(line: 159, column: 19, scope: !1869)
!1919 = !DILocation(line: 162, column: 17, scope: !1869)
!1920 = !DILocation(line: 163, column: 19, scope: !1869)
!1921 = !DILocation(line: 160, column: 17, scope: !1869)
!1922 = !DILocation(line: 161, column: 19, scope: !1869)
!1923 = !DILocation(line: 168, column: 28, scope: !1869)
!1924 = !DILocation(line: 168, column: 33, scope: !1869)
!1925 = !DILocation(line: 168, column: 25, scope: !1869)
!1926 = !DILocation(line: 223, column: 22, scope: !1869)
!1927 = !DILocation(line: 174, column: 17, scope: !1869)
!1928 = !DILocation(line: 175, column: 19, scope: !1869)
!1929 = !DILocation(line: 178, column: 17, scope: !1869)
!1930 = !DILocation(line: 179, column: 19, scope: !1869)
!1931 = !DILocation(line: 176, column: 17, scope: !1869)
!1932 = !DILocation(line: 177, column: 19, scope: !1869)
!1933 = !DILocation(line: 184, column: 28, scope: !1869)
!1934 = !DILocation(line: 184, column: 33, scope: !1869)
!1935 = !DILocation(line: 184, column: 25, scope: !1869)
!1936 = !DILocation(line: 223, column: 26, scope: !1869)
!1937 = !DILocation(line: 190, column: 17, scope: !1869)
!1938 = !DILocation(line: 191, column: 19, scope: !1869)
!1939 = !DILocation(line: 194, column: 17, scope: !1869)
!1940 = !DILocation(line: 195, column: 19, scope: !1869)
!1941 = !DILocation(line: 192, column: 17, scope: !1869)
!1942 = !DILocation(line: 193, column: 19, scope: !1869)
!1943 = !DILocation(line: 200, column: 28, scope: !1869)
!1944 = !DILocation(line: 200, column: 33, scope: !1869)
!1945 = !DILocation(line: 200, column: 25, scope: !1869)
!1946 = !DILocation(line: 223, column: 30, scope: !1869)
!1947 = !DILocation(line: 206, column: 17, scope: !1869)
!1948 = !DILocation(line: 207, column: 19, scope: !1869)
!1949 = !DILocation(line: 216, column: 28, scope: !1869)
!1950 = !DILocation(line: 216, column: 33, scope: !1869)
!1951 = !DILocation(line: 216, column: 25, scope: !1869)
!1952 = !DILocation(line: 223, column: 34, scope: !1869)
!1953 = !DILocation(line: 149, column: 17, scope: !1869)
!1954 = !DILocation(line: 150, column: 19, scope: !1869)
!1955 = !DILocation(line: 147, column: 17, scope: !1869)
!1956 = !DILocation(line: 148, column: 19, scope: !1869)
!1957 = !DILocation(line: 154, column: 28, scope: !1869)
!1958 = !DILocation(line: 154, column: 33, scope: !1869)
!1959 = !DILocation(line: 154, column: 25, scope: !1869)
!1960 = !DILocation(line: 166, column: 17, scope: !1869)
!1961 = !DILocation(line: 167, column: 19, scope: !1869)
!1962 = !DILocation(line: 164, column: 17, scope: !1869)
!1963 = !DILocation(line: 165, column: 19, scope: !1869)
!1964 = !DILocation(line: 170, column: 28, scope: !1869)
!1965 = !DILocation(line: 170, column: 33, scope: !1869)
!1966 = !DILocation(line: 170, column: 25, scope: !1869)
!1967 = !DILocation(line: 225, column: 22, scope: !1869)
!1968 = !DILocation(line: 182, column: 17, scope: !1869)
!1969 = !DILocation(line: 183, column: 19, scope: !1869)
!1970 = !DILocation(line: 180, column: 17, scope: !1869)
!1971 = !DILocation(line: 181, column: 19, scope: !1869)
!1972 = !DILocation(line: 186, column: 28, scope: !1869)
!1973 = !DILocation(line: 186, column: 33, scope: !1869)
!1974 = !DILocation(line: 186, column: 25, scope: !1869)
!1975 = !DILocation(line: 225, column: 26, scope: !1869)
!1976 = !DILocation(line: 198, column: 17, scope: !1869)
!1977 = !DILocation(line: 199, column: 19, scope: !1869)
!1978 = !DILocation(line: 196, column: 17, scope: !1869)
!1979 = !DILocation(line: 197, column: 19, scope: !1869)
!1980 = !DILocation(line: 202, column: 28, scope: !1869)
!1981 = !DILocation(line: 202, column: 33, scope: !1869)
!1982 = !DILocation(line: 202, column: 25, scope: !1869)
!1983 = !DILocation(line: 225, column: 30, scope: !1869)
!1984 = !DILocation(line: 214, column: 17, scope: !1869)
!1985 = !DILocation(line: 215, column: 19, scope: !1869)
!1986 = !DILocation(line: 218, column: 28, scope: !1869)
!1987 = !DILocation(line: 218, column: 33, scope: !1869)
!1988 = !DILocation(line: 218, column: 25, scope: !1869)
!1989 = !DILocation(line: 225, column: 34, scope: !1869)
!1990 = !DILocation(line: 231, column: 22, scope: !1869)
!1991 = !DILocation(line: 231, column: 21, scope: !1869)
!1992 = !DILocation(line: 309, column: 17, scope: !1869)
!1993 = !DILocation(line: 310, column: 19, scope: !1869)
!1994 = !DILocation(line: 171, column: 28, scope: !1869)
!1995 = !DILocation(line: 171, column: 33, scope: !1869)
!1996 = !DILocation(line: 171, column: 25, scope: !1869)
!1997 = !DILocation(line: 156, column: 28, scope: !1869)
!1998 = !DILocation(line: 156, column: 33, scope: !1869)
!1999 = !DILocation(line: 156, column: 25, scope: !1869)
!2000 = !DILocation(line: 172, column: 28, scope: !1869)
!2001 = !DILocation(line: 172, column: 33, scope: !1869)
!2002 = !DILocation(line: 172, column: 25, scope: !1869)
!2003 = !DILocation(line: 227, column: 22, scope: !1869)
!2004 = !DILocation(line: 188, column: 28, scope: !1869)
!2005 = !DILocation(line: 188, column: 33, scope: !1869)
!2006 = !DILocation(line: 188, column: 25, scope: !1869)
!2007 = !DILocation(line: 227, column: 26, scope: !1869)
!2008 = !DILocation(line: 204, column: 28, scope: !1869)
!2009 = !DILocation(line: 204, column: 33, scope: !1869)
!2010 = !DILocation(line: 204, column: 25, scope: !1869)
!2011 = !DILocation(line: 227, column: 30, scope: !1869)
!2012 = !DILocation(line: 220, column: 28, scope: !1869)
!2013 = !DILocation(line: 220, column: 33, scope: !1869)
!2014 = !DILocation(line: 220, column: 25, scope: !1869)
!2015 = !DILocation(line: 227, column: 34, scope: !1869)
!2016 = !DILocation(line: 233, column: 22, scope: !1869)
!2017 = !DILocation(line: 233, column: 21, scope: !1869)
!2018 = !DILocation(line: 303, column: 17, scope: !1869)
!2019 = !DILocation(line: 304, column: 19, scope: !1869)
!2020 = !DILocation(line: 153, column: 28, scope: !1869)
!2021 = !DILocation(line: 153, column: 33, scope: !1869)
!2022 = !DILocation(line: 153, column: 25, scope: !1869)
!2023 = !DILocation(line: 169, column: 28, scope: !1869)
!2024 = !DILocation(line: 169, column: 33, scope: !1869)
!2025 = !DILocation(line: 169, column: 25, scope: !1869)
!2026 = !DILocation(line: 224, column: 22, scope: !1869)
!2027 = !DILocation(line: 185, column: 28, scope: !1869)
!2028 = !DILocation(line: 185, column: 33, scope: !1869)
!2029 = !DILocation(line: 185, column: 25, scope: !1869)
!2030 = !DILocation(line: 224, column: 26, scope: !1869)
!2031 = !DILocation(line: 201, column: 28, scope: !1869)
!2032 = !DILocation(line: 201, column: 33, scope: !1869)
!2033 = !DILocation(line: 201, column: 25, scope: !1869)
!2034 = !DILocation(line: 224, column: 30, scope: !1869)
!2035 = !DILocation(line: 224, column: 34, scope: !1869)
!2036 = !DILocation(line: 155, column: 28, scope: !1869)
!2037 = !DILocation(line: 155, column: 33, scope: !1869)
!2038 = !DILocation(line: 155, column: 25, scope: !1869)
!2039 = !DILocation(line: 226, column: 22, scope: !1869)
!2040 = !DILocation(line: 187, column: 28, scope: !1869)
!2041 = !DILocation(line: 187, column: 33, scope: !1869)
!2042 = !DILocation(line: 187, column: 25, scope: !1869)
!2043 = !DILocation(line: 226, column: 26, scope: !1869)
!2044 = !DILocation(line: 203, column: 28, scope: !1869)
!2045 = !DILocation(line: 203, column: 33, scope: !1869)
!2046 = !DILocation(line: 203, column: 25, scope: !1869)
!2047 = !DILocation(line: 226, column: 30, scope: !1869)
!2048 = !DILocation(line: 219, column: 28, scope: !1869)
!2049 = !DILocation(line: 219, column: 33, scope: !1869)
!2050 = !DILocation(line: 219, column: 25, scope: !1869)
!2051 = !DILocation(line: 226, column: 34, scope: !1869)
!2052 = !DILocation(line: 232, column: 22, scope: !1869)
!2053 = !DILocation(line: 232, column: 21, scope: !1869)
!2054 = !DILocation(line: 301, column: 17, scope: !1869)
!2055 = !DILocation(line: 302, column: 19, scope: !1869)
!2056 = !DILocation(line: 315, column: 28, scope: !1869)
!2057 = !DILocation(line: 315, column: 33, scope: !1869)
!2058 = !DILocation(line: 315, column: 25, scope: !1869)
!2059 = !DILocation(line: 230, column: 22, scope: !1869)
!2060 = !DILocation(line: 230, column: 21, scope: !1869)
!2061 = !DILocation(line: 307, column: 17, scope: !1869)
!2062 = !DILocation(line: 308, column: 19, scope: !1869)
!2063 = !DILocation(line: 314, column: 28, scope: !1869)
!2064 = !DILocation(line: 314, column: 33, scope: !1869)
!2065 = !DILocation(line: 314, column: 25, scope: !1869)
!2066 = !DILocation(line: 234, column: 22, scope: !1869)
!2067 = !DILocation(line: 234, column: 21, scope: !1869)
!2068 = !DILocation(line: 305, column: 17, scope: !1869)
!2069 = !DILocation(line: 306, column: 19, scope: !1869)
!2070 = !DILocation(line: 313, column: 28, scope: !1869)
!2071 = !DILocation(line: 313, column: 33, scope: !1869)
!2072 = !DILocation(line: 313, column: 25, scope: !1869)
!2073 = !DILocation(line: 312, column: 28, scope: !1869)
!2074 = !DILocation(line: 312, column: 33, scope: !1869)
!2075 = !DILocation(line: 312, column: 25, scope: !1869)
!2076 = !DILocation(line: 311, column: 28, scope: !1869)
!2077 = !DILocation(line: 311, column: 33, scope: !1869)
!2078 = !DILocation(line: 311, column: 25, scope: !1869)
!2079 = !DILocation(line: 293, column: 17, scope: !1869)
!2080 = !DILocation(line: 294, column: 19, scope: !1869)
!2081 = !DILocation(line: 287, column: 17, scope: !1869)
!2082 = !DILocation(line: 288, column: 19, scope: !1869)
!2083 = !DILocation(line: 285, column: 17, scope: !1869)
!2084 = !DILocation(line: 286, column: 19, scope: !1869)
!2085 = !DILocation(line: 299, column: 28, scope: !1869)
!2086 = !DILocation(line: 299, column: 33, scope: !1869)
!2087 = !DILocation(line: 299, column: 25, scope: !1869)
!2088 = !DILocation(line: 291, column: 17, scope: !1869)
!2089 = !DILocation(line: 292, column: 19, scope: !1869)
!2090 = !DILocation(line: 298, column: 28, scope: !1869)
!2091 = !DILocation(line: 298, column: 33, scope: !1869)
!2092 = !DILocation(line: 298, column: 25, scope: !1869)
!2093 = !DILocation(line: 289, column: 17, scope: !1869)
!2094 = !DILocation(line: 290, column: 19, scope: !1869)
!2095 = !DILocation(line: 297, column: 28, scope: !1869)
!2096 = !DILocation(line: 297, column: 33, scope: !1869)
!2097 = !DILocation(line: 297, column: 25, scope: !1869)
!2098 = !DILocation(line: 296, column: 28, scope: !1869)
!2099 = !DILocation(line: 296, column: 33, scope: !1869)
!2100 = !DILocation(line: 296, column: 25, scope: !1869)
!2101 = !DILocation(line: 295, column: 28, scope: !1869)
!2102 = !DILocation(line: 295, column: 33, scope: !1869)
!2103 = !DILocation(line: 295, column: 25, scope: !1869)
!2104 = !DILocation(line: 277, column: 17, scope: !1869)
!2105 = !DILocation(line: 278, column: 19, scope: !1869)
!2106 = !DILocation(line: 271, column: 17, scope: !1869)
!2107 = !DILocation(line: 272, column: 19, scope: !1869)
!2108 = !DILocation(line: 269, column: 17, scope: !1869)
!2109 = !DILocation(line: 270, column: 19, scope: !1869)
!2110 = !DILocation(line: 283, column: 28, scope: !1869)
!2111 = !DILocation(line: 283, column: 33, scope: !1869)
!2112 = !DILocation(line: 283, column: 25, scope: !1869)
!2113 = !DILocation(line: 275, column: 17, scope: !1869)
!2114 = !DILocation(line: 276, column: 19, scope: !1869)
!2115 = !DILocation(line: 282, column: 28, scope: !1869)
!2116 = !DILocation(line: 282, column: 33, scope: !1869)
!2117 = !DILocation(line: 282, column: 25, scope: !1869)
!2118 = !DILocation(line: 273, column: 17, scope: !1869)
!2119 = !DILocation(line: 274, column: 19, scope: !1869)
!2120 = !DILocation(line: 281, column: 28, scope: !1869)
!2121 = !DILocation(line: 281, column: 33, scope: !1869)
!2122 = !DILocation(line: 281, column: 25, scope: !1869)
!2123 = !DILocation(line: 280, column: 28, scope: !1869)
!2124 = !DILocation(line: 280, column: 33, scope: !1869)
!2125 = !DILocation(line: 280, column: 25, scope: !1869)
!2126 = !DILocation(line: 279, column: 28, scope: !1869)
!2127 = !DILocation(line: 279, column: 33, scope: !1869)
!2128 = !DILocation(line: 279, column: 25, scope: !1869)
!2129 = !DILocation(line: 261, column: 17, scope: !1869)
!2130 = !DILocation(line: 262, column: 19, scope: !1869)
!2131 = !DILocation(line: 255, column: 17, scope: !1869)
!2132 = !DILocation(line: 256, column: 19, scope: !1869)
!2133 = !DILocation(line: 253, column: 17, scope: !1869)
!2134 = !DILocation(line: 254, column: 19, scope: !1869)
!2135 = !DILocation(line: 267, column: 28, scope: !1869)
!2136 = !DILocation(line: 267, column: 33, scope: !1869)
!2137 = !DILocation(line: 267, column: 25, scope: !1869)
!2138 = !DILocation(line: 259, column: 17, scope: !1869)
!2139 = !DILocation(line: 260, column: 19, scope: !1869)
!2140 = !DILocation(line: 266, column: 28, scope: !1869)
!2141 = !DILocation(line: 266, column: 33, scope: !1869)
!2142 = !DILocation(line: 266, column: 25, scope: !1869)
!2143 = !DILocation(line: 257, column: 17, scope: !1869)
!2144 = !DILocation(line: 258, column: 19, scope: !1869)
!2145 = !DILocation(line: 265, column: 28, scope: !1869)
!2146 = !DILocation(line: 265, column: 33, scope: !1869)
!2147 = !DILocation(line: 265, column: 25, scope: !1869)
!2148 = !DILocation(line: 264, column: 28, scope: !1869)
!2149 = !DILocation(line: 264, column: 33, scope: !1869)
!2150 = !DILocation(line: 264, column: 25, scope: !1869)
!2151 = !DILocation(line: 263, column: 28, scope: !1869)
!2152 = !DILocation(line: 263, column: 33, scope: !1869)
!2153 = !DILocation(line: 263, column: 25, scope: !1869)
!2154 = !DILocation(line: 244, column: 17, scope: !1869)
!2155 = !DILocation(line: 245, column: 19, scope: !1869)
!2156 = !DILocation(line: 238, column: 17, scope: !1869)
!2157 = !DILocation(line: 239, column: 19, scope: !1869)
!2158 = !DILocation(line: 236, column: 17, scope: !1869)
!2159 = !DILocation(line: 251, column: 28, scope: !1869)
!2160 = !DILocation(line: 251, column: 33, scope: !1869)
!2161 = !DILocation(line: 251, column: 25, scope: !1869)
!2162 = !DILocation(line: 242, column: 17, scope: !1869)
!2163 = !DILocation(line: 243, column: 19, scope: !1869)
!2164 = !DILocation(line: 250, column: 28, scope: !1869)
!2165 = !DILocation(line: 250, column: 33, scope: !1869)
!2166 = !DILocation(line: 250, column: 25, scope: !1869)
!2167 = !DILocation(line: 240, column: 17, scope: !1869)
!2168 = !DILocation(line: 241, column: 19, scope: !1869)
!2169 = !DILocation(line: 249, column: 28, scope: !1869)
!2170 = !DILocation(line: 249, column: 33, scope: !1869)
!2171 = !DILocation(line: 249, column: 25, scope: !1869)
!2172 = !DILocation(line: 248, column: 28, scope: !1869)
!2173 = !DILocation(line: 248, column: 33, scope: !1869)
!2174 = !DILocation(line: 248, column: 25, scope: !1869)
!2175 = !DILocation(line: 247, column: 58, scope: !1869)
!2176 = !DILocation(line: 247, column: 30, scope: !1869)
!2177 = !DILocation(line: 246, column: 28, scope: !1869)
!2178 = !DILocation(line: 246, column: 33, scope: !1869)
!2179 = !DILocation(line: 247, column: 17, scope: !1869)
!2180 = !DILocation(line: 126, column: 47, scope: !1831)
!2181 = !DILocation(line: 126, column: 9, scope: !1831)
!2182 = distinct !{!2182, !1832, !2183, !235}
!2183 = !DILocation(line: 316, column: 9, scope: !1828)
!2184 = !DILocation(line: 319, column: 19, scope: !1773)
!2185 = !DILocation(line: 320, column: 9, scope: !1773)
!2186 = !DILocation(line: 320, column: 19, scope: !1773)
!2187 = !DILocation(line: 321, column: 9, scope: !1773)
!2188 = !DILocation(line: 321, column: 19, scope: !1773)
!2189 = !DILocation(line: 322, column: 9, scope: !1773)
!2190 = !DILocation(line: 322, column: 19, scope: !1773)
!2191 = !DILocation(line: 323, column: 9, scope: !1773)
!2192 = !DILocation(line: 323, column: 19, scope: !1773)
!2193 = !DILocation(line: 324, column: 9, scope: !1773)
!2194 = !DILocation(line: 324, column: 19, scope: !1773)
!2195 = !DILocation(line: 325, column: 9, scope: !1773)
!2196 = !DILocation(line: 325, column: 19, scope: !1773)
!2197 = !DILocation(line: 326, column: 9, scope: !1773)
!2198 = !DILocation(line: 326, column: 19, scope: !1773)
!2199 = !DILocation(line: 327, column: 9, scope: !1773)
!2200 = !DILocation(line: 327, column: 19, scope: !1773)
!2201 = !DILocation(line: 328, column: 9, scope: !1773)
!2202 = !DILocation(line: 328, column: 19, scope: !1773)
!2203 = !DILocation(line: 329, column: 9, scope: !1773)
!2204 = !DILocation(line: 329, column: 19, scope: !1773)
!2205 = !DILocation(line: 330, column: 9, scope: !1773)
!2206 = !DILocation(line: 330, column: 19, scope: !1773)
!2207 = !DILocation(line: 331, column: 9, scope: !1773)
!2208 = !DILocation(line: 331, column: 19, scope: !1773)
!2209 = !DILocation(line: 332, column: 9, scope: !1773)
!2210 = !DILocation(line: 332, column: 19, scope: !1773)
!2211 = !DILocation(line: 333, column: 9, scope: !1773)
!2212 = !DILocation(line: 333, column: 19, scope: !1773)
!2213 = !DILocation(line: 334, column: 9, scope: !1773)
!2214 = !DILocation(line: 334, column: 19, scope: !1773)
!2215 = !DILocation(line: 335, column: 9, scope: !1773)
!2216 = !DILocation(line: 335, column: 19, scope: !1773)
!2217 = !DILocation(line: 336, column: 9, scope: !1773)
!2218 = !DILocation(line: 336, column: 19, scope: !1773)
!2219 = !DILocation(line: 337, column: 9, scope: !1773)
!2220 = !DILocation(line: 337, column: 19, scope: !1773)
!2221 = !DILocation(line: 338, column: 9, scope: !1773)
!2222 = !DILocation(line: 338, column: 19, scope: !1773)
!2223 = !DILocation(line: 339, column: 9, scope: !1773)
!2224 = !DILocation(line: 339, column: 19, scope: !1773)
!2225 = !DILocation(line: 340, column: 9, scope: !1773)
!2226 = !DILocation(line: 340, column: 19, scope: !1773)
!2227 = !DILocation(line: 341, column: 9, scope: !1773)
!2228 = !DILocation(line: 341, column: 19, scope: !1773)
!2229 = !DILocation(line: 342, column: 9, scope: !1773)
!2230 = !DILocation(line: 342, column: 19, scope: !1773)
!2231 = !DILocation(line: 343, column: 9, scope: !1773)
!2232 = !DILocation(line: 343, column: 19, scope: !1773)
!2233 = !DILocation(line: 344, column: 1, scope: !1773)
!2234 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !1672, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2235 = !DILocalVariable(name: "state", arg: 1, scope: !2234, file: !27, line: 550, type: !1674)
!2236 = !DILocation(line: 0, scope: !2234)
!2237 = !DILocation(line: 552, column: 36, scope: !2234)
!2238 = !DILocation(line: 552, column: 3, scope: !2234)
!2239 = !DILocation(line: 553, column: 10, scope: !2234)
!2240 = !DILocation(line: 553, column: 14, scope: !2234)
!2241 = !DILocation(line: 554, column: 1, scope: !2234)
!2242 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2243, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2243 = !DISubroutineType(types: !2244)
!2244 = !{null, !1689, !42, !42, !61}
!2245 = !DILocalVariable(name: "s", arg: 1, scope: !2242, file: !27, line: 405, type: !1689)
!2246 = !DILocation(line: 0, scope: !2242)
!2247 = !DILocalVariable(name: "pos", arg: 2, scope: !2242, file: !27, line: 405, type: !42)
!2248 = !DILocalVariable(name: "r", arg: 3, scope: !2242, file: !27, line: 405, type: !42)
!2249 = !DILocalVariable(name: "p", arg: 4, scope: !2242, file: !27, line: 405, type: !61)
!2250 = !DILocation(line: 407, column: 15, scope: !2242)
!2251 = !DILocation(line: 407, column: 31, scope: !2242)
!2252 = !DILocation(line: 407, column: 27, scope: !2242)
!2253 = !DILocation(line: 407, column: 8, scope: !2242)
!2254 = !DILocation(line: 407, column: 3, scope: !2242)
!2255 = !DILocation(line: 407, column: 12, scope: !2242)
!2256 = !DILocation(line: 408, column: 6, scope: !2242)
!2257 = !DILocation(line: 408, column: 3, scope: !2242)
!2258 = !DILocation(line: 408, column: 12, scope: !2242)
!2259 = !DILocation(line: 409, column: 1, scope: !2242)
!2260 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2261, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2261 = !DISubroutineType(types: !2262)
!2262 = !{null, !60, !1604, !1674}
!2263 = !DILocalVariable(name: "out", arg: 1, scope: !2260, file: !27, line: 566, type: !60)
!2264 = !DILocation(line: 0, scope: !2260)
!2265 = !DILocalVariable(name: "outlen", arg: 2, scope: !2260, file: !27, line: 566, type: !1604)
!2266 = !DILocalVariable(name: "state", arg: 3, scope: !2260, file: !27, line: 566, type: !1674)
!2267 = !DILocation(line: 568, column: 61, scope: !2260)
!2268 = !DILocation(line: 568, column: 16, scope: !2260)
!2269 = !DILocation(line: 568, column: 10, scope: !2260)
!2270 = !DILocation(line: 568, column: 14, scope: !2260)
!2271 = !DILocation(line: 569, column: 1, scope: !2260)
!2272 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2273, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2273 = !DISubroutineType(types: !2274)
!2274 = !{!42, !60, !1604, !1689, !42, !42}
!2275 = !DILocalVariable(name: "out", arg: 1, scope: !2272, file: !27, line: 426, type: !60)
!2276 = !DILocation(line: 0, scope: !2272)
!2277 = !DILocalVariable(name: "outlen", arg: 2, scope: !2272, file: !27, line: 427, type: !1604)
!2278 = !DILocalVariable(name: "s", arg: 3, scope: !2272, file: !27, line: 428, type: !1689)
!2279 = !DILocalVariable(name: "pos", arg: 4, scope: !2272, file: !27, line: 429, type: !42)
!2280 = !DILocalVariable(name: "r", arg: 5, scope: !2272, file: !27, line: 430, type: !42)
!2281 = !DILocation(line: 434, column: 3, scope: !2272)
!2282 = !DILocation(line: 435, column: 12, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2284, file: !27, line: 435, column: 8)
!2284 = distinct !DILexicalBlock(scope: !2272, file: !27, line: 434, column: 17)
!2285 = !DILocation(line: 436, column: 7, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2283, file: !27, line: 435, column: 18)
!2287 = !DILocation(line: 438, column: 5, scope: !2286)
!2288 = !DILocalVariable(name: "i", scope: !2272, file: !27, line: 432, type: !42)
!2289 = !DILocation(line: 439, column: 9, scope: !2290)
!2290 = distinct !DILexicalBlock(scope: !2284, file: !27, line: 439, column: 5)
!2291 = !DILocation(line: 439, scope: !2290)
!2292 = !DILocation(line: 439, column: 17, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2290, file: !27, line: 439, column: 5)
!2294 = !DILocation(line: 439, column: 21, scope: !2293)
!2295 = !DILocation(line: 439, column: 5, scope: !2290)
!2296 = !DILocation(line: 440, column: 19, scope: !2293)
!2297 = !DILocation(line: 440, column: 16, scope: !2293)
!2298 = !DILocation(line: 440, column: 27, scope: !2293)
!2299 = !DILocation(line: 440, column: 23, scope: !2293)
!2300 = !DILocation(line: 440, column: 14, scope: !2293)
!2301 = !DILocation(line: 440, column: 11, scope: !2293)
!2302 = !DILocation(line: 439, column: 41, scope: !2293)
!2303 = !DILocation(line: 439, column: 5, scope: !2293)
!2304 = distinct !{!2304, !2295, !2305, !235}
!2305 = !DILocation(line: 440, column: 32, scope: !2290)
!2306 = !DILocation(line: 441, column: 16, scope: !2284)
!2307 = !DILocation(line: 441, column: 12, scope: !2284)
!2308 = distinct !{!2308, !2281, !2309, !235}
!2309 = !DILocation(line: 443, column: 3, scope: !2272)
!2310 = !DILocation(line: 445, column: 3, scope: !2272)
!2311 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !1707, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2312 = !DILocalVariable(name: "state", arg: 1, scope: !2311, file: !27, line: 580, type: !1674)
!2313 = !DILocation(line: 0, scope: !2311)
!2314 = !DILocalVariable(name: "in", arg: 2, scope: !2311, file: !27, line: 580, type: !64)
!2315 = !DILocalVariable(name: "inlen", arg: 3, scope: !2311, file: !27, line: 580, type: !1604)
!2316 = !DILocation(line: 582, column: 3, scope: !2311)
!2317 = !DILocation(line: 583, column: 10, scope: !2311)
!2318 = !DILocation(line: 583, column: 14, scope: !2311)
!2319 = !DILocation(line: 584, column: 1, scope: !2311)
!2320 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2321, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2321 = !DISubroutineType(types: !2322)
!2322 = !{null, !1689, !42, !64, !1604, !61}
!2323 = !DILocalVariable(name: "s", arg: 1, scope: !2320, file: !27, line: 461, type: !1689)
!2324 = !DILocation(line: 0, scope: !2320)
!2325 = !DILocalVariable(name: "r", arg: 2, scope: !2320, file: !27, line: 462, type: !42)
!2326 = !DILocalVariable(name: "in", arg: 3, scope: !2320, file: !27, line: 463, type: !64)
!2327 = !DILocalVariable(name: "inlen", arg: 4, scope: !2320, file: !27, line: 464, type: !1604)
!2328 = !DILocalVariable(name: "p", arg: 5, scope: !2320, file: !27, line: 465, type: !61)
!2329 = !DILocalVariable(name: "i", scope: !2320, file: !27, line: 467, type: !42)
!2330 = !DILocation(line: 469, column: 7, scope: !2331)
!2331 = distinct !DILexicalBlock(scope: !2320, file: !27, line: 469, column: 3)
!2332 = !DILocation(line: 469, scope: !2331)
!2333 = !DILocation(line: 469, column: 12, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2331, file: !27, line: 469, column: 3)
!2335 = !DILocation(line: 469, column: 3, scope: !2331)
!2336 = !DILocation(line: 472, column: 3, scope: !2320)
!2337 = !DILocation(line: 470, column: 5, scope: !2334)
!2338 = !DILocation(line: 470, column: 10, scope: !2334)
!2339 = !DILocation(line: 469, column: 17, scope: !2334)
!2340 = !DILocation(line: 469, column: 3, scope: !2334)
!2341 = distinct !{!2341, !2335, !2342, !235}
!2342 = !DILocation(line: 470, column: 12, scope: !2331)
!2343 = !DILocation(line: 472, column: 15, scope: !2320)
!2344 = !DILocation(line: 473, column: 5, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2346, file: !27, line: 473, column: 5)
!2346 = distinct !DILexicalBlock(scope: !2320, file: !27, line: 472, column: 21)
!2347 = !DILocation(line: 480, column: 3, scope: !2348)
!2348 = distinct !DILexicalBlock(scope: !2320, file: !27, line: 480, column: 3)
!2349 = !DILocation(line: 473, scope: !2345)
!2350 = !DILocation(line: 473, column: 14, scope: !2351)
!2351 = distinct !DILexicalBlock(scope: !2345, file: !27, line: 473, column: 5)
!2352 = !DILocation(line: 474, column: 26, scope: !2351)
!2353 = !DILocation(line: 474, column: 24, scope: !2351)
!2354 = !DILocation(line: 474, column: 15, scope: !2351)
!2355 = !DILocation(line: 474, column: 7, scope: !2351)
!2356 = !DILocation(line: 474, column: 12, scope: !2351)
!2357 = !DILocation(line: 473, column: 20, scope: !2351)
!2358 = !DILocation(line: 473, column: 5, scope: !2351)
!2359 = distinct !{!2359, !2344, !2360, !235}
!2360 = !DILocation(line: 474, column: 28, scope: !2345)
!2361 = !DILocation(line: 475, column: 8, scope: !2346)
!2362 = !DILocation(line: 476, column: 11, scope: !2346)
!2363 = !DILocation(line: 477, column: 5, scope: !2346)
!2364 = distinct !{!2364, !2336, !2365, !235}
!2365 = !DILocation(line: 478, column: 3, scope: !2320)
!2366 = !DILocation(line: 480, scope: !2348)
!2367 = !DILocation(line: 480, column: 12, scope: !2368)
!2368 = distinct !DILexicalBlock(scope: !2348, file: !27, line: 480, column: 3)
!2369 = !DILocation(line: 481, column: 25, scope: !2368)
!2370 = !DILocation(line: 481, column: 15, scope: !2368)
!2371 = !DILocation(line: 481, column: 35, scope: !2368)
!2372 = !DILocation(line: 481, column: 31, scope: !2368)
!2373 = !DILocation(line: 481, column: 8, scope: !2368)
!2374 = !DILocation(line: 481, column: 5, scope: !2368)
!2375 = !DILocation(line: 481, column: 12, scope: !2368)
!2376 = !DILocation(line: 480, column: 20, scope: !2368)
!2377 = !DILocation(line: 480, column: 3, scope: !2368)
!2378 = distinct !{!2378, !2347, !2379, !235}
!2379 = !DILocation(line: 481, column: 40, scope: !2348)
!2380 = !DILocation(line: 483, column: 13, scope: !2320)
!2381 = !DILocation(line: 483, column: 29, scope: !2320)
!2382 = !DILocation(line: 483, column: 25, scope: !2320)
!2383 = !DILocation(line: 483, column: 6, scope: !2320)
!2384 = !DILocation(line: 483, column: 3, scope: !2320)
!2385 = !DILocation(line: 483, column: 10, scope: !2320)
!2386 = !DILocation(line: 484, column: 7, scope: !2320)
!2387 = !DILocation(line: 484, column: 10, scope: !2320)
!2388 = !DILocation(line: 484, column: 3, scope: !2320)
!2389 = !DILocation(line: 484, column: 14, scope: !2320)
!2390 = !DILocation(line: 485, column: 1, scope: !2320)
!2391 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2392, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2392 = !DISubroutineType(types: !2393)
!2393 = !{!23, !64}
!2394 = !DILocalVariable(name: "x", arg: 1, scope: !2391, file: !27, line: 22, type: !64)
!2395 = !DILocation(line: 0, scope: !2391)
!2396 = !DILocalVariable(name: "r", scope: !2391, file: !27, line: 24, type: !23)
!2397 = !DILocalVariable(name: "i", scope: !2391, file: !27, line: 23, type: !42)
!2398 = !DILocation(line: 26, column: 7, scope: !2399)
!2399 = distinct !DILexicalBlock(scope: !2391, file: !27, line: 26, column: 3)
!2400 = !DILocation(line: 26, scope: !2399)
!2401 = !DILocation(line: 26, column: 12, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2399, file: !27, line: 26, column: 3)
!2403 = !DILocation(line: 26, column: 3, scope: !2399)
!2404 = !DILocation(line: 27, column: 20, scope: !2402)
!2405 = !DILocation(line: 27, column: 10, scope: !2402)
!2406 = !DILocation(line: 27, column: 29, scope: !2402)
!2407 = !DILocation(line: 27, column: 25, scope: !2402)
!2408 = !DILocation(line: 27, column: 7, scope: !2402)
!2409 = !DILocation(line: 26, column: 16, scope: !2402)
!2410 = !DILocation(line: 26, column: 3, scope: !2402)
!2411 = distinct !{!2411, !2403, !2412, !235}
!2412 = !DILocation(line: 27, column: 30, scope: !2399)
!2413 = !DILocation(line: 29, column: 3, scope: !2391)
!2414 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2261, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2415 = !DILocalVariable(name: "out", arg: 1, scope: !2414, file: !27, line: 598, type: !60)
!2416 = !DILocation(line: 0, scope: !2414)
!2417 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2414, file: !27, line: 598, type: !1604)
!2418 = !DILocalVariable(name: "state", arg: 3, scope: !2414, file: !27, line: 598, type: !1674)
!2419 = !DILocation(line: 600, column: 3, scope: !2414)
!2420 = !DILocation(line: 601, column: 1, scope: !2414)
!2421 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2422, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2422 = !DISubroutineType(types: !2423)
!2423 = !{null, !60, !1604, !1689, !42}
!2424 = !DILocalVariable(name: "out", arg: 1, scope: !2421, file: !27, line: 500, type: !60)
!2425 = !DILocation(line: 0, scope: !2421)
!2426 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2421, file: !27, line: 501, type: !1604)
!2427 = !DILocalVariable(name: "s", arg: 3, scope: !2421, file: !27, line: 502, type: !1689)
!2428 = !DILocalVariable(name: "r", arg: 4, scope: !2421, file: !27, line: 503, type: !42)
!2429 = !DILocation(line: 507, column: 3, scope: !2421)
!2430 = !DILocation(line: 508, column: 5, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2421, file: !27, line: 507, column: 18)
!2432 = !DILocalVariable(name: "i", scope: !2421, file: !27, line: 505, type: !42)
!2433 = !DILocation(line: 509, column: 9, scope: !2434)
!2434 = distinct !DILexicalBlock(scope: !2431, file: !27, line: 509, column: 5)
!2435 = !DILocation(line: 509, scope: !2434)
!2436 = !DILocation(line: 509, column: 14, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2434, file: !27, line: 509, column: 5)
!2438 = !DILocation(line: 509, column: 5, scope: !2434)
!2439 = !DILocation(line: 510, column: 20, scope: !2437)
!2440 = !DILocation(line: 510, column: 18, scope: !2437)
!2441 = !DILocation(line: 510, column: 24, scope: !2437)
!2442 = !DILocation(line: 510, column: 7, scope: !2437)
!2443 = !DILocation(line: 509, column: 20, scope: !2437)
!2444 = !DILocation(line: 509, column: 5, scope: !2437)
!2445 = distinct !{!2445, !2438, !2446, !235}
!2446 = !DILocation(line: 510, column: 28, scope: !2434)
!2447 = !DILocation(line: 511, column: 9, scope: !2431)
!2448 = !DILocation(line: 512, column: 13, scope: !2431)
!2449 = distinct !{!2449, !2429, !2450, !235}
!2450 = !DILocation(line: 513, column: 3, scope: !2421)
!2451 = !DILocation(line: 514, column: 1, scope: !2421)
!2452 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2453, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2453 = !DISubroutineType(types: !2454)
!2454 = !{null, !60, !23}
!2455 = !DILocalVariable(name: "x", arg: 1, scope: !2452, file: !27, line: 40, type: !60)
!2456 = !DILocation(line: 0, scope: !2452)
!2457 = !DILocalVariable(name: "u", arg: 2, scope: !2452, file: !27, line: 40, type: !23)
!2458 = !DILocalVariable(name: "i", scope: !2452, file: !27, line: 41, type: !42)
!2459 = !DILocation(line: 43, column: 7, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2452, file: !27, line: 43, column: 3)
!2461 = !DILocation(line: 43, scope: !2460)
!2462 = !DILocation(line: 43, column: 12, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2460, file: !27, line: 43, column: 3)
!2464 = !DILocation(line: 43, column: 3, scope: !2460)
!2465 = !DILocation(line: 44, column: 18, scope: !2463)
!2466 = !DILocation(line: 44, column: 14, scope: !2463)
!2467 = !DILocation(line: 44, column: 12, scope: !2463)
!2468 = !DILocation(line: 44, column: 5, scope: !2463)
!2469 = !DILocation(line: 44, column: 10, scope: !2463)
!2470 = !DILocation(line: 43, column: 16, scope: !2463)
!2471 = !DILocation(line: 43, column: 3, scope: !2463)
!2472 = distinct !{!2472, !2464, !2473, !235}
!2473 = !DILocation(line: 44, column: 19, scope: !2460)
!2474 = !DILocation(line: 45, column: 1, scope: !2452)
!2475 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !1672, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2476 = !DILocalVariable(name: "state", arg: 1, scope: !2475, file: !27, line: 610, type: !1674)
!2477 = !DILocation(line: 0, scope: !2475)
!2478 = !DILocation(line: 612, column: 3, scope: !2475)
!2479 = !DILocation(line: 613, column: 10, scope: !2475)
!2480 = !DILocation(line: 613, column: 14, scope: !2475)
!2481 = !DILocation(line: 614, column: 1, scope: !2475)
!2482 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !1707, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2483 = !DILocalVariable(name: "state", arg: 1, scope: !2482, file: !27, line: 625, type: !1674)
!2484 = !DILocation(line: 0, scope: !2482)
!2485 = !DILocalVariable(name: "in", arg: 2, scope: !2482, file: !27, line: 625, type: !64)
!2486 = !DILocalVariable(name: "inlen", arg: 3, scope: !2482, file: !27, line: 625, type: !1604)
!2487 = !DILocation(line: 627, column: 47, scope: !2482)
!2488 = !DILocation(line: 627, column: 16, scope: !2482)
!2489 = !DILocation(line: 627, column: 10, scope: !2482)
!2490 = !DILocation(line: 627, column: 14, scope: !2482)
!2491 = !DILocation(line: 628, column: 1, scope: !2482)
!2492 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !1672, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2493 = !DILocalVariable(name: "state", arg: 1, scope: !2492, file: !27, line: 637, type: !1674)
!2494 = !DILocation(line: 0, scope: !2492)
!2495 = !DILocation(line: 639, column: 36, scope: !2492)
!2496 = !DILocation(line: 639, column: 3, scope: !2492)
!2497 = !DILocation(line: 640, column: 10, scope: !2492)
!2498 = !DILocation(line: 640, column: 14, scope: !2492)
!2499 = !DILocation(line: 641, column: 1, scope: !2492)
!2500 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2261, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2501 = !DILocalVariable(name: "out", arg: 1, scope: !2500, file: !27, line: 653, type: !60)
!2502 = !DILocation(line: 0, scope: !2500)
!2503 = !DILocalVariable(name: "outlen", arg: 2, scope: !2500, file: !27, line: 653, type: !1604)
!2504 = !DILocalVariable(name: "state", arg: 3, scope: !2500, file: !27, line: 653, type: !1674)
!2505 = !DILocation(line: 655, column: 61, scope: !2500)
!2506 = !DILocation(line: 655, column: 16, scope: !2500)
!2507 = !DILocation(line: 655, column: 10, scope: !2500)
!2508 = !DILocation(line: 655, column: 14, scope: !2500)
!2509 = !DILocation(line: 656, column: 1, scope: !2500)
!2510 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !1707, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2511 = !DILocalVariable(name: "state", arg: 1, scope: !2510, file: !27, line: 667, type: !1674)
!2512 = !DILocation(line: 0, scope: !2510)
!2513 = !DILocalVariable(name: "in", arg: 2, scope: !2510, file: !27, line: 667, type: !64)
!2514 = !DILocalVariable(name: "inlen", arg: 3, scope: !2510, file: !27, line: 667, type: !1604)
!2515 = !DILocation(line: 669, column: 3, scope: !2510)
!2516 = !DILocation(line: 670, column: 10, scope: !2510)
!2517 = !DILocation(line: 670, column: 14, scope: !2510)
!2518 = !DILocation(line: 671, column: 1, scope: !2510)
!2519 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2261, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2520 = !DILocalVariable(name: "out", arg: 1, scope: !2519, file: !27, line: 685, type: !60)
!2521 = !DILocation(line: 0, scope: !2519)
!2522 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2519, file: !27, line: 685, type: !1604)
!2523 = !DILocalVariable(name: "state", arg: 3, scope: !2519, file: !27, line: 685, type: !1674)
!2524 = !DILocation(line: 687, column: 3, scope: !2519)
!2525 = !DILocation(line: 688, column: 1, scope: !2519)
!2526 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2527, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2527 = !DISubroutineType(types: !2528)
!2528 = !{null, !60, !1604, !64, !1604}
!2529 = !DILocalVariable(name: "out", arg: 1, scope: !2526, file: !27, line: 700, type: !60)
!2530 = !DILocation(line: 0, scope: !2526)
!2531 = !DILocalVariable(name: "outlen", arg: 2, scope: !2526, file: !27, line: 700, type: !1604)
!2532 = !DILocalVariable(name: "in", arg: 3, scope: !2526, file: !27, line: 700, type: !64)
!2533 = !DILocalVariable(name: "inlen", arg: 4, scope: !2526, file: !27, line: 700, type: !1604)
!2534 = !DILocalVariable(name: "state", scope: !2526, file: !27, line: 703, type: !1675)
!2535 = !DILocation(line: 703, column: 16, scope: !2526)
!2536 = !DILocation(line: 705, column: 3, scope: !2526)
!2537 = !DILocation(line: 706, column: 19, scope: !2526)
!2538 = !DILocalVariable(name: "nblocks", scope: !2526, file: !27, line: 702, type: !1604)
!2539 = !DILocation(line: 707, column: 3, scope: !2526)
!2540 = !DILocation(line: 708, column: 20, scope: !2526)
!2541 = !DILocation(line: 708, column: 10, scope: !2526)
!2542 = !DILocation(line: 709, column: 17, scope: !2526)
!2543 = !DILocation(line: 709, column: 7, scope: !2526)
!2544 = !DILocation(line: 710, column: 3, scope: !2526)
!2545 = !DILocation(line: 711, column: 1, scope: !2526)
!2546 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2527, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2547 = !DILocalVariable(name: "out", arg: 1, scope: !2546, file: !27, line: 723, type: !60)
!2548 = !DILocation(line: 0, scope: !2546)
!2549 = !DILocalVariable(name: "outlen", arg: 2, scope: !2546, file: !27, line: 723, type: !1604)
!2550 = !DILocalVariable(name: "in", arg: 3, scope: !2546, file: !27, line: 723, type: !64)
!2551 = !DILocalVariable(name: "inlen", arg: 4, scope: !2546, file: !27, line: 723, type: !1604)
!2552 = !DILocalVariable(name: "state", scope: !2546, file: !27, line: 726, type: !1675)
!2553 = !DILocation(line: 726, column: 16, scope: !2546)
!2554 = !DILocation(line: 728, column: 3, scope: !2546)
!2555 = !DILocation(line: 729, column: 19, scope: !2546)
!2556 = !DILocalVariable(name: "nblocks", scope: !2546, file: !27, line: 725, type: !1604)
!2557 = !DILocation(line: 730, column: 3, scope: !2546)
!2558 = !DILocation(line: 731, column: 20, scope: !2546)
!2559 = !DILocation(line: 731, column: 10, scope: !2546)
!2560 = !DILocation(line: 732, column: 17, scope: !2546)
!2561 = !DILocation(line: 732, column: 7, scope: !2546)
!2562 = !DILocation(line: 733, column: 3, scope: !2546)
!2563 = !DILocation(line: 734, column: 1, scope: !2546)
!2564 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2565, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2565 = !DISubroutineType(types: !2566)
!2566 = !{null, !60, !64, !1604}
!2567 = !DILocalVariable(name: "h", arg: 1, scope: !2564, file: !27, line: 745, type: !60)
!2568 = !DILocation(line: 0, scope: !2564)
!2569 = !DILocalVariable(name: "in", arg: 2, scope: !2564, file: !27, line: 745, type: !64)
!2570 = !DILocalVariable(name: "inlen", arg: 3, scope: !2564, file: !27, line: 745, type: !1604)
!2571 = !DILocalVariable(name: "s", scope: !2564, file: !27, line: 748, type: !194)
!2572 = !DILocation(line: 748, column: 12, scope: !2564)
!2573 = !DILocation(line: 750, column: 3, scope: !2564)
!2574 = !DILocation(line: 751, column: 3, scope: !2564)
!2575 = !DILocalVariable(name: "i", scope: !2564, file: !27, line: 747, type: !42)
!2576 = !DILocation(line: 752, column: 7, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2564, file: !27, line: 752, column: 3)
!2578 = !DILocation(line: 752, scope: !2577)
!2579 = !DILocation(line: 752, column: 12, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2577, file: !27, line: 752, column: 3)
!2581 = !DILocation(line: 752, column: 3, scope: !2577)
!2582 = !DILocation(line: 753, column: 16, scope: !2580)
!2583 = !DILocation(line: 753, column: 14, scope: !2580)
!2584 = !DILocation(line: 753, column: 19, scope: !2580)
!2585 = !DILocation(line: 753, column: 5, scope: !2580)
!2586 = !DILocation(line: 752, column: 16, scope: !2580)
!2587 = !DILocation(line: 752, column: 3, scope: !2580)
!2588 = distinct !{!2588, !2581, !2589, !235}
!2589 = !DILocation(line: 753, column: 23, scope: !2577)
!2590 = !DILocation(line: 754, column: 1, scope: !2564)
!2591 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2565, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2592 = !DILocalVariable(name: "h", arg: 1, scope: !2591, file: !27, line: 765, type: !60)
!2593 = !DILocation(line: 0, scope: !2591)
!2594 = !DILocalVariable(name: "in", arg: 2, scope: !2591, file: !27, line: 765, type: !64)
!2595 = !DILocalVariable(name: "inlen", arg: 3, scope: !2591, file: !27, line: 765, type: !1604)
!2596 = !DILocalVariable(name: "s", scope: !2591, file: !27, line: 768, type: !194)
!2597 = !DILocation(line: 768, column: 12, scope: !2591)
!2598 = !DILocation(line: 770, column: 3, scope: !2591)
!2599 = !DILocation(line: 771, column: 3, scope: !2591)
!2600 = !DILocalVariable(name: "i", scope: !2591, file: !27, line: 767, type: !42)
!2601 = !DILocation(line: 772, column: 7, scope: !2602)
!2602 = distinct !DILexicalBlock(scope: !2591, file: !27, line: 772, column: 3)
!2603 = !DILocation(line: 772, scope: !2602)
!2604 = !DILocation(line: 772, column: 12, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !2602, file: !27, line: 772, column: 3)
!2606 = !DILocation(line: 772, column: 3, scope: !2602)
!2607 = !DILocation(line: 773, column: 16, scope: !2605)
!2608 = !DILocation(line: 773, column: 14, scope: !2605)
!2609 = !DILocation(line: 773, column: 19, scope: !2605)
!2610 = !DILocation(line: 773, column: 5, scope: !2605)
!2611 = !DILocation(line: 772, column: 16, scope: !2605)
!2612 = !DILocation(line: 772, column: 3, scope: !2605)
!2613 = distinct !{!2613, !2606, !2614, !235}
!2614 = !DILocation(line: 773, column: 23, scope: !2602)
!2615 = !DILocation(line: 774, column: 1, scope: !2591)
!2616 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2617, file: !2617, line: 18, type: !2618, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2617 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2618 = !DISubroutineType(types: !2619)
!2619 = !{null, !2620, !64, !61, !61}
!2620 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2621, size: 32)
!2621 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !2622)
!2622 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !2623)
!2623 = !{!2624, !2625}
!2624 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2622, file: !190, line: 15, baseType: !194, size: 1600)
!2625 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2622, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!2626 = !DILocalVariable(name: "state", arg: 1, scope: !2616, file: !2617, line: 18, type: !2620)
!2627 = !DILocation(line: 0, scope: !2616)
!2628 = !DILocalVariable(name: "seed", arg: 2, scope: !2616, file: !2617, line: 19, type: !64)
!2629 = !DILocalVariable(name: "x", arg: 3, scope: !2616, file: !2617, line: 20, type: !61)
!2630 = !DILocalVariable(name: "y", arg: 4, scope: !2616, file: !2617, line: 21, type: !61)
!2631 = !DILocalVariable(name: "extseed", scope: !2616, file: !2617, line: 23, type: !2632)
!2632 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !2633)
!2633 = !{!2634}
!2634 = !DISubrange(count: 34)
!2635 = !DILocation(line: 23, column: 11, scope: !2616)
!2636 = !DILocation(line: 25, column: 3, scope: !2616)
!2637 = !DILocation(line: 26, column: 3, scope: !2616)
!2638 = !DILocation(line: 26, column: 29, scope: !2616)
!2639 = !DILocation(line: 27, column: 3, scope: !2616)
!2640 = !DILocation(line: 27, column: 29, scope: !2616)
!2641 = !DILocation(line: 29, column: 3, scope: !2616)
!2642 = !DILocation(line: 30, column: 1, scope: !2616)
!2643 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2617, file: !2617, line: 43, type: !2644, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2644 = !DISubroutineType(types: !2645)
!2645 = !{null, !60, !1604, !64, !61}
!2646 = !DILocalVariable(name: "out", arg: 1, scope: !2643, file: !2617, line: 43, type: !60)
!2647 = !DILocation(line: 0, scope: !2643)
!2648 = !DILocalVariable(name: "outlen", arg: 2, scope: !2643, file: !2617, line: 43, type: !1604)
!2649 = !DILocalVariable(name: "key", arg: 3, scope: !2643, file: !2617, line: 43, type: !64)
!2650 = !DILocalVariable(name: "nonce", arg: 4, scope: !2643, file: !2617, line: 43, type: !61)
!2651 = !DILocalVariable(name: "extkey", scope: !2643, file: !2617, line: 45, type: !2652)
!2652 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !2653)
!2653 = !{!2654}
!2654 = !DISubrange(count: 33)
!2655 = !DILocation(line: 45, column: 11, scope: !2643)
!2656 = !DILocation(line: 47, column: 3, scope: !2643)
!2657 = !DILocation(line: 48, column: 3, scope: !2643)
!2658 = !DILocation(line: 48, column: 26, scope: !2643)
!2659 = !DILocation(line: 50, column: 3, scope: !2643)
!2660 = !DILocation(line: 51, column: 1, scope: !2643)
!2661 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2617, file: !2617, line: 64, type: !489, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2662 = !DILocalVariable(name: "out", arg: 1, scope: !2661, file: !2617, line: 64, type: !60)
!2663 = !DILocation(line: 0, scope: !2661)
!2664 = !DILocalVariable(name: "key", arg: 2, scope: !2661, file: !2617, line: 64, type: !64)
!2665 = !DILocalVariable(name: "input", arg: 3, scope: !2661, file: !2617, line: 64, type: !64)
!2666 = !DILocalVariable(name: "s", scope: !2661, file: !2617, line: 66, type: !2621)
!2667 = !DILocation(line: 66, column: 16, scope: !2661)
!2668 = !DILocation(line: 68, column: 3, scope: !2661)
!2669 = !DILocation(line: 69, column: 3, scope: !2661)
!2670 = !DILocation(line: 70, column: 3, scope: !2661)
!2671 = !DILocation(line: 71, column: 3, scope: !2661)
!2672 = !DILocation(line: 72, column: 3, scope: !2661)
!2673 = !DILocation(line: 73, column: 1, scope: !2661)
