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
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !71
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !72
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !73
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #3, !dbg !74
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !75
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !76
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !77
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
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !90
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !91
  ret i32 0, !dbg !92
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !93 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #3, !dbg !106
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !107
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !108
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !109
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !112 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !113, !DIExpression(), !114)
    #dbg_value(ptr %ss, !115, !DIExpression(), !114)
    #dbg_value(ptr %pk, !116, !DIExpression(), !114)
    #dbg_declare(ptr %coins, !117, !DIExpression(), !121)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !122
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !125 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !128, !DIExpression(), !129)
    #dbg_value(ptr %ct, !130, !DIExpression(), !129)
    #dbg_value(ptr %sk, !131, !DIExpression(), !129)
    #dbg_declare(ptr %buf, !132, !DIExpression(), !133)
    #dbg_declare(ptr %kr, !134, !DIExpression(), !135)
    #dbg_declare(ptr %cmp, !136, !DIExpression(), !140)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !141
    #dbg_value(ptr %add.ptr, !142, !DIExpression(), !129)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !143
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !144
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !145
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !146
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !147
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !148
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !149
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1568) #3, !dbg !150
    #dbg_value(i32 %call12, !151, !DIExpression(), !129)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !152
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !152
  %tobool.not = icmp eq i32 %call12, 0, !dbg !153
  %conv = zext i1 %tobool.not to i8, !dbg !153
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !156 {
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
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !203
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end22, !dbg !205

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !206

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !209
    #dbg_value(i32 %j.0, !210, !DIExpression(), !178)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !211
  br i1 %exitcond, label %for.body3, label %for.inc20, !dbg !206

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !213
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !213

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !216
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !216
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !216
  br label %if.end, !dbg !216

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !217
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !217
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !218
    #dbg_value(i32 504, !219, !DIExpression(), !178)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !220
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !220
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
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !228
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
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !289 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
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
  store i8 4, ptr %arrayidx, align 1, !dbg !313
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !314
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !315
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !319
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !293
    #dbg_value(i8 %nonce.0, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.0, !316, !DIExpression(), !293)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !320
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !322

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !323

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !325
    #dbg_value(i8 %nonce.0, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !326
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !327
    #dbg_value(i8 %inc, !301, !DIExpression(), !293)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !328
    #dbg_value(i32 %inc7, !316, !DIExpression(), !293)
  br label %for.cond, !dbg !329, !llvm.loop !330

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc15, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !332
  %nonce.1 = phi i8 [ %inc13, %for.body10 ], [ 4, %for.cond8.preheader ], !dbg !293
    #dbg_value(i8 %nonce.1, !301, !DIExpression(), !293)
    #dbg_value(i32 %i.1, !316, !DIExpression(), !293)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !333
  br i1 %exitcond1, label %for.body10, label %for.end16, !dbg !323

for.body10:                                       ; preds = %for.cond8
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !335
    #dbg_value(i8 %nonce.1, !301, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !293)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !336
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !337
    #dbg_value(i8 %inc13, !301, !DIExpression(), !293)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !338
    #dbg_value(i32 %inc15, !316, !DIExpression(), !293)
  br label %for.cond8, !dbg !339, !llvm.loop !340

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !342
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !343
    #dbg_value(i32 0, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !344

for.cond17:                                       ; preds = %for.body19, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.body19 ], !dbg !346
    #dbg_value(i32 %i.2, !316, !DIExpression(), !293)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !347
  br i1 %exitcond2, label %for.body19, label %for.end27, !dbg !349

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !350
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !352
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #3, !dbg !353
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !354
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef nonnull %arrayidx24) #3, !dbg !355
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !356
    #dbg_value(i32 %inc26, !316, !DIExpression(), !293)
  br label %for.cond17, !dbg !357, !llvm.loop !358

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !360
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !361
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !362
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !363
  ret void, !dbg !364
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef %sk) unnamed_addr #0 !dbg !365 {
entry:
    #dbg_value(ptr %r, !368, !DIExpression(), !369)
    #dbg_value(ptr %sk, !370, !DIExpression(), !369)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #3, !dbg !371
  ret void, !dbg !372
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) unnamed_addr #0 !dbg !373 {
entry:
    #dbg_value(ptr %r, !376, !DIExpression(), !377)
    #dbg_value(ptr %pk, !378, !DIExpression(), !377)
    #dbg_value(ptr %seed, !379, !DIExpression(), !377)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #3, !dbg !380
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1536, !dbg !381
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %seed, i32 noundef 32) #4, !dbg !382
  ret void, !dbg !383
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !384 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [4 x %struct.polyvec], align 2
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
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !412
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !413
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !417
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !388
    #dbg_value(i8 %nonce.0, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.0, !414, !DIExpression(), !388)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !418
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !420

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !421

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !423
    #dbg_value(i8 %nonce.0, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !424
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !425
    #dbg_value(i8 %inc, !394, !DIExpression(), !388)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !426
    #dbg_value(i32 %inc4, !414, !DIExpression(), !388)
  br label %for.cond, !dbg !427, !llvm.loop !428

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc13, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !430
  %nonce.1 = phi i8 [ %inc11, %for.body7 ], [ 4, %for.cond5.preheader ], !dbg !388
    #dbg_value(i8 %nonce.1, !394, !DIExpression(), !388)
    #dbg_value(i32 %i.1, !414, !DIExpression(), !388)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !431
  br i1 %exitcond1, label %for.body7, label %for.end14, !dbg !421

for.body7:                                        ; preds = %for.cond5
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !433
    #dbg_value(i8 %nonce.1, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !434
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !435
    #dbg_value(i8 %inc11, !394, !DIExpression(), !388)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !436
    #dbg_value(i32 %inc13, !414, !DIExpression(), !388)
  br label %for.cond5, !dbg !437, !llvm.loop !438

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !388)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 8) #3, !dbg !440
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !441
    #dbg_value(i32 0, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !442

for.cond16:                                       ; preds = %for.body18, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.body18 ], !dbg !444
    #dbg_value(i32 %i.2, !414, !DIExpression(), !388)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !445
  br i1 %exitcond2, label %for.body18, label %for.end23, !dbg !447

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !448
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !449
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #3, !dbg !450
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !451
    #dbg_value(i32 %inc22, !414, !DIExpression(), !388)
  br label %for.cond16, !dbg !452, !llvm.loop !453

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !455
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !456
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !457
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !458
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !459
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !460
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !461
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !462
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !463
  ret void, !dbg !464
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !465 {
entry:
    #dbg_value(ptr %pk, !468, !DIExpression(), !469)
    #dbg_value(ptr %seed, !470, !DIExpression(), !469)
    #dbg_value(ptr %packedpk, !471, !DIExpression(), !469)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #3, !dbg !472
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1536, !dbg !473
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !474
  ret void, !dbg !475
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) unnamed_addr #0 !dbg !476 {
entry:
    #dbg_value(ptr %r, !480, !DIExpression(), !481)
    #dbg_value(ptr %b, !482, !DIExpression(), !481)
    #dbg_value(ptr %v, !483, !DIExpression(), !481)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #3, !dbg !484
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1408, !dbg !485
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef %v) #3, !dbg !486
  ret void, !dbg !487
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !488 {
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
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !505
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !506
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !507
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !508
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !509
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !510
  ret void, !dbg !511
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) unnamed_addr #0 !dbg !512 {
entry:
    #dbg_value(ptr %b, !515, !DIExpression(), !516)
    #dbg_value(ptr %v, !517, !DIExpression(), !516)
    #dbg_value(ptr %c, !518, !DIExpression(), !516)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #3, !dbg !519
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !520
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %v, ptr noundef nonnull %add.ptr) #3, !dbg !521
  ret void, !dbg !522
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !523 {
entry:
    #dbg_value(ptr %sk, !526, !DIExpression(), !527)
    #dbg_value(ptr %packedsk, !528, !DIExpression(), !527)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #3, !dbg !529
  ret void, !dbg !530
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !531 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !546, !DIExpression(), !547)
    #dbg_value(ptr %a, !548, !DIExpression(), !547)
    #dbg_declare(ptr %t, !549, !DIExpression(), !553)
    #dbg_value(i32 0, !554, !DIExpression(), !547)
  br label %for.cond, !dbg !555

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !557
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !546, !DIExpression(), !547)
    #dbg_value(i32 %i.0, !554, !DIExpression(), !547)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !558
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !560

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !561

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !564
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !546, !DIExpression(), !547)
    #dbg_value(i32 %j.0, !565, !DIExpression(), !547)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !566
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !561

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !568

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !571
    #dbg_value(i32 %k.0, !572, !DIExpression(), !547)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !573
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !568

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !575
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !577
  %add = or disjoint i32 %mul, %k.0, !dbg !578
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !575
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !575
  %isneg = icmp slt i16 %0, 0, !dbg !579
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !579
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !580
  %add12 = add i16 %and, %0, !dbg !581
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !581
  %conv15 = zext i16 %add12 to i64, !dbg !582
    #dbg_value(i64 %conv15, !583, !DIExpression(), !547)
    #dbg_value(i64 %conv15, !583, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !547)
    #dbg_value(i64 %conv15, !583, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !547)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !584
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !584
    #dbg_value(i64 %mul17, !583, !DIExpression(), !547)
  %shr18 = lshr i64 %mul17, 31, !dbg !585
    #dbg_value(i64 %shr18, !583, !DIExpression(), !547)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !586
  %conv20 = and i16 %2, 2047, !dbg !586
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !587
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
  %shl32 = shl i8 %conv31, 3, !dbg !599
  %or = or i8 %shl32, %shr29, !dbg !600
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !601
  store i8 %or, ptr %arrayidx34, align 1, !dbg !602
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !603
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !603
  %8 = lshr i16 %7, 5, !dbg !604
  %shr37 = trunc i16 %8 to i8, !dbg !604
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !605
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !605
  %conv39 = trunc i16 %9 to i8, !dbg !605
  %shl40 = shl i8 %conv39, 6, !dbg !606
  %or41 = or i8 %shl40, %shr37, !dbg !607
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !608
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !609
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !610
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !610
  %11 = lshr i16 %10, 2, !dbg !611
  %conv47 = trunc i16 %11 to i8, !dbg !612
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !613
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !614
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !615
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !615
  %13 = lshr i16 %12, 10, !dbg !616
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !616
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !617
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !617
  %conv53 = trunc i16 %14 to i8, !dbg !617
  %shl54 = shl i8 %conv53, 1, !dbg !618
  %or55 = or i8 %shl54, %shr51, !dbg !619
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !620
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !621
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !622
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !622
  %16 = lshr i16 %15, 7, !dbg !623
  %shr60 = trunc i16 %16 to i8, !dbg !623
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !624
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !624
  %conv62 = trunc i16 %17 to i8, !dbg !624
  %shl63 = shl i8 %conv62, 4, !dbg !625
  %or64 = or i8 %shl63, %shr60, !dbg !626
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !627
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !628
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !629
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !629
  %19 = lshr i16 %18, 4, !dbg !630
  %shr69 = trunc i16 %19 to i8, !dbg !630
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !631
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !631
  %conv71 = trunc i16 %20 to i8, !dbg !631
  %shl72 = shl i8 %conv71, 7, !dbg !632
  %or73 = or i8 %shl72, %shr69, !dbg !633
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !634
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !635
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !636
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !636
  %22 = lshr i16 %21, 1, !dbg !637
  %conv79 = trunc i16 %22 to i8, !dbg !638
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !639
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !640
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !641
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !641
  %24 = lshr i16 %23, 9, !dbg !642
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !642
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !643
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !643
  %conv85 = trunc i16 %25 to i8, !dbg !643
  %shl86 = shl i8 %conv85, 2, !dbg !644
  %or87 = or i8 %shl86, %shr83, !dbg !645
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !646
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !647
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !648
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !648
  %27 = lshr i16 %26, 6, !dbg !649
  %shr92 = trunc i16 %27 to i8, !dbg !649
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !650
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !650
  %conv94 = trunc i16 %28 to i8, !dbg !650
  %shl95 = shl i8 %conv94, 5, !dbg !651
  %or96 = or i8 %shl95, %shr92, !dbg !652
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !653
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !654
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !655
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !655
  %30 = lshr i16 %29, 3, !dbg !656
  %conv102 = trunc i16 %30 to i8, !dbg !657
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !658
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !659
    #dbg_value(ptr %r.addr.1, !546, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !547)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !660
    #dbg_value(ptr %add.ptr, !546, !DIExpression(), !547)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !661
    #dbg_value(i32 %inc105, !565, !DIExpression(), !547)
  br label %for.cond1, !dbg !662, !llvm.loop !663

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !665
    #dbg_value(i32 %inc108, !554, !DIExpression(), !547)
  br label %for.cond, !dbg !666, !llvm.loop !667

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !669
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !670 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !674, !DIExpression(), !675)
    #dbg_value(ptr %a, !676, !DIExpression(), !675)
    #dbg_declare(ptr %t, !677, !DIExpression(), !678)
    #dbg_value(i32 0, !679, !DIExpression(), !675)
  br label %for.cond, !dbg !680

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !682
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !676, !DIExpression(), !675)
    #dbg_value(i32 %i.0, !679, !DIExpression(), !675)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !683
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !685

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !686

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !689
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !676, !DIExpression(), !675)
    #dbg_value(i32 %j.0, !690, !DIExpression(), !675)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !691
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !686

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !693
  %conv = zext i8 %0 to i16, !dbg !693
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !695
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !695
  %conv6 = zext i8 %1 to i16, !dbg !696
  %shl = shl nuw i16 %conv6, 8, !dbg !697
  %or = or disjoint i16 %shl, %conv, !dbg !698
  store i16 %or, ptr %t, align 2, !dbg !699
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !700
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !700
  %3 = lshr i8 %2, 3, !dbg !701
  %shr11 = zext nneg i8 %3 to i16, !dbg !701
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !702
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !702
  %conv14 = zext i8 %4 to i16, !dbg !703
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !704
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !705
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !706
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !707
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !708
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !708
  %6 = lshr i8 %5, 6, !dbg !709
  %shr21 = zext nneg i8 %6 to i16, !dbg !709
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !710
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !710
  %conv24 = zext i8 %7 to i16, !dbg !711
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !712
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !713
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !714
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !714
  %conv29 = zext i8 %8 to i16, !dbg !715
  %shl30 = shl i16 %conv29, 10, !dbg !716
  %or31 = or disjoint i16 %or26, %shl30, !dbg !717
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !718
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !719
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !720
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !720
  %10 = lshr i8 %9, 1, !dbg !721
  %shr36 = zext nneg i8 %10 to i16, !dbg !721
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !722
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !722
  %conv39 = zext i8 %11 to i16, !dbg !723
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !724
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !725
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !726
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !727
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !728
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !728
  %13 = lshr i8 %12, 4, !dbg !729
  %shr46 = zext nneg i8 %13 to i16, !dbg !729
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !730
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !730
  %conv49 = zext i8 %14 to i16, !dbg !731
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !732
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !733
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !734
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !735
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !736
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !736
  %16 = lshr i8 %15, 7, !dbg !737
  %shr56 = zext nneg i8 %16 to i16, !dbg !737
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !738
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !738
  %conv59 = zext i8 %17 to i16, !dbg !739
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !740
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !741
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !742
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !742
  %conv64 = zext i8 %18 to i16, !dbg !743
  %shl65 = shl i16 %conv64, 9, !dbg !744
  %or66 = or disjoint i16 %or61, %shl65, !dbg !745
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !746
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !747
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !748
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !748
  %20 = lshr i8 %19, 2, !dbg !749
  %shr71 = zext nneg i8 %20 to i16, !dbg !749
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !750
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !750
  %conv74 = zext i8 %21 to i16, !dbg !751
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !752
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !753
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !754
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !755
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !756
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !756
  %23 = lshr i8 %22, 5, !dbg !757
  %shr81 = zext nneg i8 %23 to i16, !dbg !757
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !758
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !758
  %conv84 = zext i8 %24 to i16, !dbg !759
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !760
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !761
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !762
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !763
    #dbg_value(ptr %add.ptr, !676, !DIExpression(), !675)
    #dbg_value(i32 0, !764, !DIExpression(), !675)
  br label %for.cond89, !dbg !765

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !767
    #dbg_value(i32 %k.0, !764, !DIExpression(), !675)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !768
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !770

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !771
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !771
  %26 = and i16 %25, 2047, !dbg !772
  %and = zext nneg i16 %26 to i32, !dbg !772
  %mul = mul nuw nsw i32 %and, 3329, !dbg !773
  %add = add nuw nsw i32 %mul, 1024, !dbg !774
  %shr95 = lshr i32 %add, 11, !dbg !775
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !776
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !777
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !778
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !779
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx97, i32 0, i32 %add99, !dbg !777
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !780
  %inc = add nuw nsw i32 %k.0, 1, !dbg !781
    #dbg_value(i32 %inc, !764, !DIExpression(), !675)
  br label %for.cond89, !dbg !782, !llvm.loop !783

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !785
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !786
    #dbg_value(i32 %inc102, !690, !DIExpression(), !675)
  br label %for.cond1, !dbg !787, !llvm.loop !788

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !790
    #dbg_value(i32 %inc105, !679, !DIExpression(), !675)
  br label %for.cond, !dbg !791, !llvm.loop !792

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !794
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !795 {
entry:
    #dbg_value(ptr %r, !796, !DIExpression(), !797)
    #dbg_value(ptr %a, !798, !DIExpression(), !797)
    #dbg_value(i32 0, !799, !DIExpression(), !797)
  br label %for.cond, !dbg !800

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !802
    #dbg_value(i32 %i.0, !799, !DIExpression(), !797)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !803
  br i1 %exitcond, label %for.body, label %for.end, !dbg !805

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !806
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !807
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !808
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !809
  %inc = add nuw nsw i32 %i.0, 1, !dbg !810
    #dbg_value(i32 %inc, !799, !DIExpression(), !797)
  br label %for.cond, !dbg !811, !llvm.loop !812

for.end:                                          ; preds = %for.cond
  ret void, !dbg !814
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !815 {
entry:
    #dbg_value(ptr %r, !816, !DIExpression(), !817)
    #dbg_value(ptr %a, !818, !DIExpression(), !817)
    #dbg_value(i32 0, !819, !DIExpression(), !817)
  br label %for.cond, !dbg !820

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !822
    #dbg_value(i32 %i.0, !819, !DIExpression(), !817)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !823
  br i1 %exitcond, label %for.body, label %for.end, !dbg !825

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !826
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !827
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !828
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !829
  %inc = add nuw nsw i32 %i.0, 1, !dbg !830
    #dbg_value(i32 %inc, !819, !DIExpression(), !817)
  br label %for.cond, !dbg !831, !llvm.loop !832

for.end:                                          ; preds = %for.cond
  ret void, !dbg !834
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !835 {
entry:
    #dbg_value(ptr %r, !838, !DIExpression(), !839)
    #dbg_value(i32 0, !840, !DIExpression(), !839)
  br label %for.cond, !dbg !841

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !843
    #dbg_value(i32 %i.0, !840, !DIExpression(), !839)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !844
  br i1 %exitcond, label %for.body, label %for.end, !dbg !846

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !847
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !848
  %inc = add nuw nsw i32 %i.0, 1, !dbg !849
    #dbg_value(i32 %inc, !840, !DIExpression(), !839)
  br label %for.cond, !dbg !850, !llvm.loop !851

for.end:                                          ; preds = %for.cond
  ret void, !dbg !853
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !854 {
entry:
    #dbg_value(ptr %r, !855, !DIExpression(), !856)
    #dbg_value(i32 0, !857, !DIExpression(), !856)
  br label %for.cond, !dbg !858

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !860
    #dbg_value(i32 %i.0, !857, !DIExpression(), !856)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !861
  br i1 %exitcond, label %for.body, label %for.end, !dbg !863

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !864
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !865
  %inc = add nuw nsw i32 %i.0, 1, !dbg !866
    #dbg_value(i32 %inc, !857, !DIExpression(), !856)
  br label %for.cond, !dbg !867, !llvm.loop !868

for.end:                                          ; preds = %for.cond
  ret void, !dbg !870
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !871 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !875, !DIExpression(), !876)
    #dbg_value(ptr %a, !877, !DIExpression(), !876)
    #dbg_value(ptr %b, !878, !DIExpression(), !876)
    #dbg_declare(ptr %t, !879, !DIExpression(), !880)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !881
    #dbg_value(i32 1, !882, !DIExpression(), !876)
  br label %for.cond, !dbg !883

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !885
    #dbg_value(i32 %i.0, !882, !DIExpression(), !876)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !886
  br i1 %exitcond, label %for.body, label %for.end, !dbg !888

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !889
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !891
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #3, !dbg !892
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !893
  %inc = add nuw nsw i32 %i.0, 1, !dbg !894
    #dbg_value(i32 %inc, !882, !DIExpression(), !876)
  br label %for.cond, !dbg !895, !llvm.loop !896

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !898
  ret void, !dbg !899
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !900 {
entry:
    #dbg_value(ptr %r, !901, !DIExpression(), !902)
    #dbg_value(i32 0, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !904

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !906
    #dbg_value(i32 %i.0, !903, !DIExpression(), !902)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !907
  br i1 %exitcond, label %for.body, label %for.end, !dbg !909

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !910
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !911
  %inc = add nuw nsw i32 %i.0, 1, !dbg !912
    #dbg_value(i32 %inc, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !913, !llvm.loop !914

for.end:                                          ; preds = %for.cond
  ret void, !dbg !916
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !917 {
entry:
    #dbg_value(ptr %r, !920, !DIExpression(), !921)
    #dbg_value(ptr %a, !922, !DIExpression(), !921)
    #dbg_value(ptr %b, !923, !DIExpression(), !921)
    #dbg_value(i32 0, !924, !DIExpression(), !921)
  br label %for.cond, !dbg !925

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !927
    #dbg_value(i32 %i.0, !924, !DIExpression(), !921)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !928
  br i1 %exitcond, label %for.body, label %for.end, !dbg !930

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !931
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !932
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !933
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #3, !dbg !934
  %inc = add nuw nsw i32 %i.0, 1, !dbg !935
    #dbg_value(i32 %inc, !924, !DIExpression(), !921)
  br label %for.cond, !dbg !936, !llvm.loop !937

for.end:                                          ; preds = %for.cond
  ret void, !dbg !939
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !940 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !950, !DIExpression(), !951)
    #dbg_value(ptr %a, !952, !DIExpression(), !951)
    #dbg_declare(ptr %t, !953, !DIExpression(), !955)
    #dbg_value(i32 0, !956, !DIExpression(), !951)
  br label %for.cond, !dbg !957

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !959
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !950, !DIExpression(), !951)
    #dbg_value(i32 %i.0, !956, !DIExpression(), !951)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !960
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !962

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !963

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !966
    #dbg_value(i32 %j.0, !967, !DIExpression(), !951)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !968
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !963

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !970
  %add = or disjoint i32 %mul, %j.0, !dbg !972
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !973
  %0 = load i16, ptr %arrayidx, align 2, !dbg !973
    #dbg_value(i16 %0, !974, !DIExpression(), !951)
  %isneg = icmp slt i16 %0, 0, !dbg !975
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !975
  %add5 = add i16 %and, %0, !dbg !976
    #dbg_value(i16 %add5, !974, !DIExpression(), !951)
  %conv7 = sext i16 %add5 to i32, !dbg !977
    #dbg_value(i32 %conv7, !978, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !951)
    #dbg_value(i32 %conv7, !978, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !951)
  %1 = mul i32 %conv7, 1290176, !dbg !979
  %mul9 = add i32 %1, 67089152, !dbg !979
    #dbg_value(i32 %mul9, !978, !DIExpression(), !951)
  %shr10 = lshr i32 %mul9, 27, !dbg !980
    #dbg_value(i32 %shr10, !978, !DIExpression(), !951)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !981
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !982
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !983
  %inc = add nuw nsw i32 %j.0, 1, !dbg !984
    #dbg_value(i32 %inc, !967, !DIExpression(), !951)
  br label %for.cond1, !dbg !985, !llvm.loop !986

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !988
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !989
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !989
  %shl19 = shl i8 %3, 5, !dbg !990
  %or = or i8 %shl19, %2, !dbg !991
  store i8 %or, ptr %r.addr.0, align 1, !dbg !992
  %4 = lshr i8 %3, 3, !dbg !993
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !994
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !994
  %shl27 = shl i8 %5, 2, !dbg !995
  %or28 = or i8 %shl27, %4, !dbg !996
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !997
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !997
  %shl31 = shl i8 %6, 7, !dbg !998
  %or32 = or i8 %or28, %shl31, !dbg !999
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1000
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !1001
  %7 = lshr i8 %6, 1, !dbg !1002
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1003
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !1003
  %shl40 = shl i8 %8, 4, !dbg !1004
  %or41 = or i8 %shl40, %7, !dbg !1005
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1006
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1007
  %9 = lshr i8 %8, 4, !dbg !1008
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1009
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1009
  %shl49 = shl i8 %10, 1, !dbg !1010
  %or50 = or i8 %shl49, %9, !dbg !1011
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1012
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !1012
  %shl53 = shl i8 %11, 6, !dbg !1013
  %or54 = or i8 %or50, %shl53, !dbg !1014
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1015
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !1016
  %12 = lshr i8 %11, 2, !dbg !1017
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1018
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !1018
  %shl62 = shl i8 %13, 3, !dbg !1019
  %or63 = or i8 %shl62, %12, !dbg !1020
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1021
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !1022
    #dbg_value(ptr %r.addr.0, !950, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !951)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !1023
    #dbg_value(ptr %add.ptr, !950, !DIExpression(), !951)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !1024
    #dbg_value(i32 %inc67, !956, !DIExpression(), !951)
  br label %for.cond, !dbg !1025, !llvm.loop !1026

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1028
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1029 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1033, !DIExpression(), !1034)
    #dbg_value(ptr %a, !1035, !DIExpression(), !1034)
    #dbg_declare(ptr %t, !1036, !DIExpression(), !1037)
    #dbg_value(i32 0, !1038, !DIExpression(), !1034)
  br label %for.cond, !dbg !1039

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1041
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1035, !DIExpression(), !1034)
    #dbg_value(i32 %i.0, !1038, !DIExpression(), !1034)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1042
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !1044

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1045
  store i8 %0, ptr %t, align 1, !dbg !1047
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1048
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !1048
  %or = call i8 @llvm.fshl.i8(i8 %1, i8 %0, i8 3), !dbg !1049
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1050
  store i8 %or, ptr %arrayidx9, align 1, !dbg !1051
  %2 = lshr i8 %1, 2, !dbg !1052
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1053
  store i8 %2, ptr %arrayidx14, align 1, !dbg !1054
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1055
  %3 = load i8, ptr %arrayidx15, align 1, !dbg !1055
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !1056
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !1056
  %or21 = call i8 @llvm.fshl.i8(i8 %4, i8 %3, i8 1), !dbg !1057
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1058
  store i8 %or21, ptr %arrayidx23, align 1, !dbg !1059
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1060
  %5 = load i8, ptr %arrayidx27, align 1, !dbg !1060
  %or30 = call i8 @llvm.fshl.i8(i8 %5, i8 %4, i8 4), !dbg !1061
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1062
  store i8 %or30, ptr %arrayidx32, align 1, !dbg !1063
  %6 = lshr i8 %5, 1, !dbg !1064
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1065
  store i8 %6, ptr %arrayidx37, align 1, !dbg !1066
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1067
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !1067
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !1068
  %8 = load i8, ptr %arrayidx41, align 1, !dbg !1068
  %or44 = call i8 @llvm.fshl.i8(i8 %8, i8 %7, i8 2), !dbg !1069
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1070
  store i8 %or44, ptr %arrayidx46, align 1, !dbg !1071
  %9 = lshr i8 %8, 3, !dbg !1072
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1073
  store i8 %9, ptr %arrayidx51, align 1, !dbg !1074
    #dbg_value(ptr %add.ptr, !1035, !DIExpression(), !1034)
    #dbg_value(i32 0, !1075, !DIExpression(), !1034)
  br label %for.cond52, !dbg !1076

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !1078
    #dbg_value(i32 %j.0, !1075, !DIExpression(), !1034)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1079
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !1081

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1082
  %10 = load i8, ptr %arrayidx56, align 1, !dbg !1082
  %11 = and i8 %10, 31, !dbg !1083
  %and = zext nneg i8 %11 to i32, !dbg !1083
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1084
  %add = add nuw nsw i32 %mul, 16, !dbg !1085
  %shr58 = lshr i32 %add, 5, !dbg !1086
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !1087
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !1088
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !1089
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !1090
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1091
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1092
    #dbg_value(i32 %inc, !1075, !DIExpression(), !1034)
  br label %for.cond52, !dbg !1093, !llvm.loop !1094

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !1096
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !1097
    #dbg_value(i32 %inc64, !1038, !DIExpression(), !1034)
  br label %for.cond, !dbg !1098, !llvm.loop !1099

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1101
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1102 {
entry:
    #dbg_value(ptr %r, !1103, !DIExpression(), !1104)
    #dbg_value(ptr %a, !1105, !DIExpression(), !1104)
    #dbg_value(i32 0, !1106, !DIExpression(), !1104)
  br label %for.cond, !dbg !1107

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1109
    #dbg_value(i32 %i.0, !1106, !DIExpression(), !1104)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1110
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1112

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1113
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1115
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1115
    #dbg_value(i16 %0, !1116, !DIExpression(), !1104)
  %isneg = icmp slt i16 %0, 0, !dbg !1117
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1117
  %add = add i16 %and, %0, !dbg !1118
    #dbg_value(i16 %add, !1116, !DIExpression(), !1104)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1119
  %add5 = or disjoint i32 %mul4, 1, !dbg !1120
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !1121
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1121
    #dbg_value(i16 %1, !1122, !DIExpression(), !1104)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1123
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !1123
  %add11 = add i16 %and9, %1, !dbg !1124
    #dbg_value(i16 %add11, !1122, !DIExpression(), !1104)
  %conv15 = trunc i16 %add to i8, !dbg !1125
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !1126
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !1127
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1128
  %2 = lshr i16 %add, 8, !dbg !1129
  %shr20 = trunc nuw i16 %2 to i8, !dbg !1129
  %conv21 = trunc i16 %add11 to i8, !dbg !1130
  %shl = shl i8 %conv21, 4, !dbg !1131
  %or = or i8 %shl, %shr20, !dbg !1132
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !1133
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !1134
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1134
  store i8 %or, ptr %arrayidx25, align 1, !dbg !1135
  %4 = lshr i16 %add11, 4, !dbg !1136
  %conv28 = trunc i16 %4 to i8, !dbg !1137
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !1138
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !1139
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1139
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1140
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1141
    #dbg_value(i32 %inc, !1106, !DIExpression(), !1104)
  br label %for.cond, !dbg !1142, !llvm.loop !1143

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1145
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1146 {
entry:
    #dbg_value(ptr %r, !1147, !DIExpression(), !1148)
    #dbg_value(ptr %a, !1149, !DIExpression(), !1148)
    #dbg_value(i32 0, !1150, !DIExpression(), !1148)
  br label %for.cond, !dbg !1151

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1153
    #dbg_value(i32 %i.0, !1150, !DIExpression(), !1148)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1154
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1156

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1157
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1159
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1159
  %conv = zext i8 %0 to i16, !dbg !1159
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1160
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1161
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1161
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1161
  %conv5 = zext i8 %2 to i16, !dbg !1162
  %shl = shl nuw i16 %conv5, 8, !dbg !1163
  %shl.masked = and i16 %shl, 3840, !dbg !1164
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1164
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1165
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1166
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1167
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1168
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1169
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1169
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1169
  %5 = lshr i8 %4, 4, !dbg !1170
  %shr13 = zext nneg i8 %5 to i16, !dbg !1170
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1171
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1172
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1172
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1172
  %conv18 = zext i8 %7 to i16, !dbg !1173
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1174
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1175
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !1176
  %add25 = or disjoint i32 %mul24, 1, !dbg !1177
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !1178
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !1179
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1180
    #dbg_value(i32 %inc, !1150, !DIExpression(), !1148)
  br label %for.cond, !dbg !1181, !llvm.loop !1182

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1184
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1185 {
entry:
    #dbg_value(ptr %r, !1186, !DIExpression(), !1187)
    #dbg_value(ptr %msg, !1188, !DIExpression(), !1187)
    #dbg_value(i32 0, !1189, !DIExpression(), !1187)
  br label %for.cond, !dbg !1190

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1192
    #dbg_value(i32 %i.0, !1189, !DIExpression(), !1187)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1193
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end11, !dbg !1195

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1196

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1199
    #dbg_value(i32 %j.0, !1200, !DIExpression(), !1187)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1201
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !1196

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1203
  %add = or disjoint i32 %mul, %j.0, !dbg !1205
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1206
  store i16 0, ptr %arrayidx, align 2, !dbg !1207
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1208
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1208
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1209
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1210
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1210
  %conv = zext i8 %0 to i32, !dbg !1210
  %shr = lshr i32 %conv, %j.0, !dbg !1211
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1212
  %conv8 = and i16 %1, 1, !dbg !1212
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #3, !dbg !1213
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1214
    #dbg_value(i32 %inc, !1200, !DIExpression(), !1187)
  br label %for.cond1, !dbg !1215, !llvm.loop !1216

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !1218
    #dbg_value(i32 %inc10, !1189, !DIExpression(), !1187)
  br label %for.cond, !dbg !1219, !llvm.loop !1220

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1222
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1223 {
entry:
    #dbg_value(ptr %msg, !1224, !DIExpression(), !1225)
    #dbg_value(ptr %a, !1226, !DIExpression(), !1225)
    #dbg_value(i32 0, !1227, !DIExpression(), !1225)
  br label %for.cond, !dbg !1228

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1230
    #dbg_value(i32 %i.0, !1227, !DIExpression(), !1225)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1231
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1233

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1234
  store i8 0, ptr %arrayidx, align 1, !dbg !1236
    #dbg_value(i32 0, !1237, !DIExpression(), !1225)
  br label %for.cond1, !dbg !1238

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1240
    #dbg_value(i32 %j.0, !1237, !DIExpression(), !1225)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1241
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1243

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1244
  %add = or disjoint i32 %mul, %j.0, !dbg !1246
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1247
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1247
  %conv = sext i16 %0 to i32, !dbg !1247
    #dbg_value(i32 %conv, !1248, !DIExpression(), !1225)
    #dbg_value(i32 %conv, !1248, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1225)
    #dbg_value(i32 %conv, !1248, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1225)
  %1 = mul i32 %conv, 161270, !dbg !1249
  %mul6 = add i32 %1, 134257275, !dbg !1249
    #dbg_value(i32 %mul6, !1248, !DIExpression(), !1225)
  %shr = lshr i32 %mul6, 28, !dbg !1250
    #dbg_value(i32 %shr, !1248, !DIExpression(), !1225)
  %and = and i32 %shr, 1, !dbg !1251
    #dbg_value(i32 %and, !1248, !DIExpression(), !1225)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1252
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1253
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1254
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1254
  %conv10 = or i8 %2, %3, !dbg !1254
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1254
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1255
    #dbg_value(i32 %inc, !1237, !DIExpression(), !1225)
  br label %for.cond1, !dbg !1256, !llvm.loop !1257

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1259
    #dbg_value(i32 %inc12, !1227, !DIExpression(), !1225)
  br label %for.cond, !dbg !1260, !llvm.loop !1261

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1263
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1264 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1267, !DIExpression(), !1268)
    #dbg_value(ptr %seed, !1269, !DIExpression(), !1268)
    #dbg_value(i8 %nonce, !1270, !DIExpression(), !1268)
    #dbg_declare(ptr %buf, !1271, !DIExpression(), !1273)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1274
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1275
  ret void, !dbg !1276
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1277 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1278, !DIExpression(), !1279)
    #dbg_value(ptr %seed, !1280, !DIExpression(), !1279)
    #dbg_value(i8 %nonce, !1281, !DIExpression(), !1279)
    #dbg_declare(ptr %buf, !1282, !DIExpression(), !1283)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1284
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1285
  ret void, !dbg !1286
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1287 {
entry:
    #dbg_value(ptr %r, !1290, !DIExpression(), !1291)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #3, !dbg !1292
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1293
  ret void, !dbg !1294
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1295 {
entry:
    #dbg_value(ptr %r, !1296, !DIExpression(), !1297)
    #dbg_value(i32 0, !1298, !DIExpression(), !1297)
  br label %for.cond, !dbg !1299

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1301
    #dbg_value(i32 %i.0, !1298, !DIExpression(), !1297)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1302
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1304

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1305
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1305
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1306
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1307
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1308
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1309
    #dbg_value(i32 %inc, !1298, !DIExpression(), !1297)
  br label %for.cond, !dbg !1310, !llvm.loop !1311

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1313
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1314 {
entry:
    #dbg_value(ptr %r, !1315, !DIExpression(), !1316)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #3, !dbg !1317
  ret void, !dbg !1318
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1319 {
entry:
    #dbg_value(ptr %r, !1322, !DIExpression(), !1323)
    #dbg_value(ptr %a, !1324, !DIExpression(), !1323)
    #dbg_value(ptr %b, !1325, !DIExpression(), !1323)
    #dbg_value(i32 0, !1326, !DIExpression(), !1323)
  br label %for.cond, !dbg !1327

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1329
    #dbg_value(i32 %i.0, !1326, !DIExpression(), !1323)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1330
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1332

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1333
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1335
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !1336
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !1337
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !1338
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !1339
  %add = or disjoint i32 %i.0, 64, !dbg !1340
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1341
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1341
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #3, !dbg !1342
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1343
  %add10 = or disjoint i32 %mul9, 2, !dbg !1344
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !1345
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !1346
  %add14 = or disjoint i32 %mul13, 2, !dbg !1347
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !1348
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !1349
  %add18 = or disjoint i32 %mul17, 2, !dbg !1350
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !1351
  %add20 = or disjoint i32 %i.0, 64, !dbg !1352
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !1353
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1353
  %sub = sub i16 0, %1, !dbg !1354
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #3, !dbg !1355
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1356
    #dbg_value(i32 %inc, !1326, !DIExpression(), !1323)
  br label %for.cond, !dbg !1357, !llvm.loop !1358

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1360
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1361 {
entry:
    #dbg_value(ptr %r, !1362, !DIExpression(), !1363)
    #dbg_value(i16 1353, !1364, !DIExpression(), !1363)
    #dbg_value(i32 0, !1365, !DIExpression(), !1363)
  br label %for.cond, !dbg !1366

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1368
    #dbg_value(i32 %i.0, !1365, !DIExpression(), !1363)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1369
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1371

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1372
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1372
  %conv = sext i16 %0 to i32, !dbg !1373
  %mul = mul nsw i32 %conv, 1353, !dbg !1374
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1375
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1376
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1377
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1378
    #dbg_value(i32 %inc, !1365, !DIExpression(), !1363)
  br label %for.cond, !dbg !1379, !llvm.loop !1380

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1382
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1383 {
entry:
    #dbg_value(ptr %r, !1384, !DIExpression(), !1385)
    #dbg_value(ptr %a, !1386, !DIExpression(), !1385)
    #dbg_value(ptr %b, !1387, !DIExpression(), !1385)
    #dbg_value(i32 0, !1388, !DIExpression(), !1385)
  br label %for.cond, !dbg !1389

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1391
    #dbg_value(i32 %i.0, !1388, !DIExpression(), !1385)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1392
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1394

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1395
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1395
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1396
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1396
  %add = add i16 %0, %1, !dbg !1397
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1398
  store i16 %add, ptr %arrayidx6, align 2, !dbg !1399
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1400
    #dbg_value(i32 %inc, !1388, !DIExpression(), !1385)
  br label %for.cond, !dbg !1401, !llvm.loop !1402

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1404
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1405 {
entry:
    #dbg_value(ptr %r, !1406, !DIExpression(), !1407)
    #dbg_value(ptr %a, !1408, !DIExpression(), !1407)
    #dbg_value(ptr %b, !1409, !DIExpression(), !1407)
    #dbg_value(i32 0, !1410, !DIExpression(), !1407)
  br label %for.cond, !dbg !1411

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1413
    #dbg_value(i32 %i.0, !1410, !DIExpression(), !1407)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1414
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1416

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1417
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1417
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1418
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1418
  %sub = sub i16 %0, %1, !dbg !1419
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1420
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !1421
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1422
    #dbg_value(i32 %inc, !1410, !DIExpression(), !1407)
  br label %for.cond, !dbg !1423, !llvm.loop !1424

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1426
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1427 {
entry:
    #dbg_value(ptr %r, !1430, !DIExpression(), !1431)
    #dbg_value(i32 1, !1432, !DIExpression(), !1431)
    #dbg_value(i32 128, !1433, !DIExpression(), !1431)
  br label %for.cond, !dbg !1434

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1436
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1437
    #dbg_value(i32 %k.0, !1432, !DIExpression(), !1431)
    #dbg_value(i32 %len.0, !1433, !DIExpression(), !1431)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1438
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1440

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1441

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1444
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1431
    #dbg_value(i32 %k.1, !1432, !DIExpression(), !1431)
    #dbg_value(i32 %start.0, !1445, !DIExpression(), !1431)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1446
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1441

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1432, !DIExpression(), !1431)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1448
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1448
    #dbg_value(i16 %0, !1450, !DIExpression(), !1431)
    #dbg_value(i32 %start.0, !1451, !DIExpression(), !1431)
  br label %for.cond4, !dbg !1452

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1454
    #dbg_value(i32 %j.0, !1451, !DIExpression(), !1431)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1455
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1457
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1458

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1459
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1459
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1459
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1461
    #dbg_value(i16 %call, !1462, !DIExpression(), !1431)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1463
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1463
  %sub = sub i16 %3, %call, !dbg !1464
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1465
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1465
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1466
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1467
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1467
  %add17 = add i16 %5, %call, !dbg !1468
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1469
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1470
  %inc20 = add nuw i32 %j.0, 1, !dbg !1471
    #dbg_value(i32 %inc20, !1451, !DIExpression(), !1431)
  br label %for.cond4, !dbg !1472, !llvm.loop !1473

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1454
  %inc = add i32 %k.1, 1, !dbg !1475
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1476
    #dbg_value(i32 %add22, !1445, !DIExpression(), !1431)
  br label %for.cond1, !dbg !1477, !llvm.loop !1478

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1431
  %shr = lshr i32 %len.0, 1, !dbg !1480
    #dbg_value(i32 %shr, !1433, !DIExpression(), !1431)
  br label %for.cond, !dbg !1481, !llvm.loop !1482

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1484
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1485 {
entry:
    #dbg_value(i16 %a, !1488, !DIExpression(), !1489)
    #dbg_value(i16 %b, !1490, !DIExpression(), !1489)
  %conv = sext i16 %a to i32, !dbg !1491
  %conv1 = sext i16 %b to i32, !dbg !1492
  %mul = mul nsw i32 %conv, %conv1, !dbg !1493
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1494
  ret i16 %call, !dbg !1495
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1496 {
entry:
    #dbg_value(ptr %r, !1497, !DIExpression(), !1498)
    #dbg_value(i16 1441, !1499, !DIExpression(), !1498)
    #dbg_value(i32 127, !1500, !DIExpression(), !1498)
    #dbg_value(i32 2, !1501, !DIExpression(), !1498)
  br label %for.cond, !dbg !1502

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1504
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1505
    #dbg_value(i32 %k.0, !1500, !DIExpression(), !1498)
    #dbg_value(i32 %len.0, !1501, !DIExpression(), !1498)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1506
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1508

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1509

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1512

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1514
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1498
    #dbg_value(i32 %k.1, !1500, !DIExpression(), !1498)
    #dbg_value(i32 %start.0, !1515, !DIExpression(), !1498)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1516
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1509

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1500, !DIExpression(), !1498)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1518
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1518
    #dbg_value(i16 %0, !1520, !DIExpression(), !1498)
    #dbg_value(i32 %start.0, !1521, !DIExpression(), !1498)
  br label %for.cond4, !dbg !1522

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1524
    #dbg_value(i32 %j.0, !1521, !DIExpression(), !1498)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1525
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1527
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1528

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1529
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1529
    #dbg_value(i16 %1, !1531, !DIExpression(), !1498)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1532
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1532
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1532
  %add11 = add i16 %1, %3, !dbg !1533
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1534
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1535
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1536
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1537
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1537
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1537
  %sub = sub i16 %5, %1, !dbg !1538
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1539
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1539
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1540
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1541
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1541
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1541
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1542
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1543
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1543
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1544
  %inc = add nuw i32 %j.0, 1, !dbg !1545
    #dbg_value(i32 %inc, !1521, !DIExpression(), !1498)
  br label %for.cond4, !dbg !1546, !llvm.loop !1547

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1524
  %dec = add i32 %k.1, -1, !dbg !1549
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1550
    #dbg_value(i32 %add27, !1515, !DIExpression(), !1498)
  br label %for.cond1, !dbg !1551, !llvm.loop !1552

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1498
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1554
    #dbg_value(i32 %shl, !1501, !DIExpression(), !1498)
  br label %for.cond, !dbg !1555, !llvm.loop !1556

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1558
    #dbg_value(i32 %j.1, !1521, !DIExpression(), !1498)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1559
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1512

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1561
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1561
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1562
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1563
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1564
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1565
    #dbg_value(i32 %inc39, !1521, !DIExpression(), !1498)
  br label %for.cond31, !dbg !1566, !llvm.loop !1567

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1569
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1570 {
entry:
    #dbg_value(ptr %r, !1574, !DIExpression(), !1575)
    #dbg_value(ptr %a, !1576, !DIExpression(), !1575)
    #dbg_value(ptr %b, !1577, !DIExpression(), !1575)
    #dbg_value(i16 %zeta, !1578, !DIExpression(), !1575)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1579
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1579
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1580
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1580
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1581
  store i16 %call, ptr %r, align 2, !dbg !1582
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1583
  store i16 %call4, ptr %r, align 2, !dbg !1584
  %2 = load i16, ptr %a, align 2, !dbg !1585
  %3 = load i16, ptr %b, align 2, !dbg !1586
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1587
  %4 = load i16, ptr %r, align 2, !dbg !1588
  %add = add i16 %4, %call8, !dbg !1588
  store i16 %add, ptr %r, align 2, !dbg !1588
  %5 = load i16, ptr %a, align 2, !dbg !1589
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1590
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1590
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1591
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1592
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1593
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1594
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1594
  %8 = load i16, ptr %b, align 2, !dbg !1595
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1596
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1597
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1598
  %add22 = add i16 %9, %call18, !dbg !1598
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1598
  ret void, !dbg !1599
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1600 {
entry:
    #dbg_value(ptr %r, !1609, !DIExpression(), !1610)
    #dbg_value(ptr %buf, !1611, !DIExpression(), !1610)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1612
  ret void, !dbg !1613
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1614 {
entry:
    #dbg_value(ptr %r, !1615, !DIExpression(), !1616)
    #dbg_value(ptr %buf, !1617, !DIExpression(), !1616)
    #dbg_value(i32 0, !1618, !DIExpression(), !1616)
  br label %for.cond, !dbg !1619

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1621
    #dbg_value(i32 %i.0, !1618, !DIExpression(), !1616)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1622
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1624

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1625
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1627
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1628
    #dbg_value(i32 %call, !1629, !DIExpression(), !1616)
  %and = and i32 %call, 1431655765, !dbg !1630
    #dbg_value(i32 %and, !1631, !DIExpression(), !1616)
  %shr = lshr i32 %call, 1, !dbg !1632
  %and1 = and i32 %shr, 1431655765, !dbg !1633
  %add = add nuw i32 %and, %and1, !dbg !1634
    #dbg_value(i32 %add, !1631, !DIExpression(), !1616)
    #dbg_value(i32 0, !1635, !DIExpression(), !1616)
  br label %for.cond2, !dbg !1636

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1638
    #dbg_value(i32 %j.0, !1635, !DIExpression(), !1616)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1639
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1641

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1642
  %shr7 = lshr i32 %add, %mul5, !dbg !1644
  %conv = and i32 %shr7, 3, !dbg !1645
    #dbg_value(i32 %shr7, !1646, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1616)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1647
  %add10 = or disjoint i32 %mul9, 2, !dbg !1648
  %shr11 = lshr i32 %add, %add10, !dbg !1649
  %conv13 = and i32 %shr11, 3, !dbg !1650
    #dbg_value(i32 %conv13, !1651, !DIExpression(), !1616)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1652
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1653
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1654
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1655
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1656
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1657
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1658
    #dbg_value(i32 %inc, !1635, !DIExpression(), !1616)
  br label %for.cond2, !dbg !1659, !llvm.loop !1660

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1662
    #dbg_value(i32 %inc20, !1618, !DIExpression(), !1616)
  br label %for.cond, !dbg !1663, !llvm.loop !1664

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1666
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1667 {
entry:
    #dbg_value(ptr %x, !1670, !DIExpression(), !1671)
  %0 = load i8, ptr %x, align 1, !dbg !1672
  %conv = zext i8 %0 to i32, !dbg !1673
    #dbg_value(i32 %conv, !1674, !DIExpression(), !1671)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1675
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1675
  %conv2 = zext i8 %1 to i32, !dbg !1676
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1677
  %or = or disjoint i32 %shl, %conv, !dbg !1678
    #dbg_value(i32 %or, !1674, !DIExpression(), !1671)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1679
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1679
  %conv4 = zext i8 %2 to i32, !dbg !1680
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1681
  %or6 = or disjoint i32 %or, %shl5, !dbg !1682
    #dbg_value(i32 %or6, !1674, !DIExpression(), !1671)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1683
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1683
  %conv8 = zext i8 %3 to i32, !dbg !1684
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1685
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1686
    #dbg_value(i32 %or10, !1674, !DIExpression(), !1671)
  ret i32 %or10, !dbg !1687
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1688 {
entry:
    #dbg_value(ptr %r, !1689, !DIExpression(), !1690)
    #dbg_value(ptr %buf, !1691, !DIExpression(), !1690)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1692
  ret void, !dbg !1693
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1694 {
entry:
    #dbg_value(i32 %a, !1697, !DIExpression(), !1698)
    #dbg_value(i32 %a, !1699, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1698)
  %sext = mul i32 %a, -218038272, !dbg !1700
  %conv3 = ashr exact i32 %sext, 16, !dbg !1700
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1701
  %sub = add i32 %mul4.neg, %a, !dbg !1702
  %shr = lshr i32 %sub, 16, !dbg !1703
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1704
    #dbg_value(i16 %conv5, !1699, !DIExpression(), !1698)
  ret i16 %conv5, !dbg !1705
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1706 {
entry:
    #dbg_value(i16 %a, !1709, !DIExpression(), !1710)
    #dbg_value(i16 20159, !1711, !DIExpression(), !1710)
  %conv = sext i16 %a to i32, !dbg !1712
  %mul = mul nsw i32 %conv, 20159, !dbg !1713
  %add = add nsw i32 %mul, 33554432, !dbg !1714
  %shr = ashr i32 %add, 26, !dbg !1715
    #dbg_value(i32 %shr, !1716, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1710)
    #dbg_value(i32 %shr, !1716, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1710)
  %0 = trunc nsw i32 %shr to i16, !dbg !1717
  %1 = mul i16 %0, -3329, !dbg !1717
  %conv7 = add i16 %1, %a, !dbg !1717
  ret i16 %conv7, !dbg !1718
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1719 {
entry:
    #dbg_value(ptr %a, !1725, !DIExpression(), !1726)
    #dbg_value(ptr %b, !1727, !DIExpression(), !1726)
    #dbg_value(i32 %len, !1728, !DIExpression(), !1726)
    #dbg_value(i8 0, !1729, !DIExpression(), !1726)
    #dbg_value(i32 0, !1730, !DIExpression(), !1726)
  br label %for.cond, !dbg !1731

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1733
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1726
    #dbg_value(i8 %r.0, !1729, !DIExpression(), !1726)
    #dbg_value(i32 %i.0, !1730, !DIExpression(), !1726)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1734
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1736

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1729, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1726)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1737
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1737
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1738
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1738
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1729, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1726)
  %xor1 = xor i8 %0, %1, !dbg !1739
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1729, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1726)
  %or2 = or i8 %r.0, %xor1, !dbg !1740
    #dbg_value(i8 %or2, !1729, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1726)
    #dbg_value(i8 %or2, !1729, !DIExpression(), !1726)
  %inc = add i32 %i.0, 1, !dbg !1741
    #dbg_value(i32 %inc, !1730, !DIExpression(), !1726)
  br label %for.cond, !dbg !1742, !llvm.loop !1743

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1726
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1745
  %conv6 = zext i1 %2 to i32, !dbg !1746
  ret i32 %conv6, !dbg !1747
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1748 {
entry:
    #dbg_value(ptr %r, !1751, !DIExpression(), !1752)
    #dbg_value(ptr %x, !1753, !DIExpression(), !1752)
    #dbg_value(i32 %len, !1754, !DIExpression(), !1752)
    #dbg_value(i8 %b, !1755, !DIExpression(), !1752)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1756, !srcloc !1757
    #dbg_value(i8 %0, !1755, !DIExpression(), !1752)
  %sub = sub i8 0, %0, !dbg !1758
    #dbg_value(i8 %sub, !1755, !DIExpression(), !1752)
    #dbg_value(i32 0, !1759, !DIExpression(), !1752)
  br label %for.cond, !dbg !1760

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1762
    #dbg_value(i32 %i.0, !1759, !DIExpression(), !1752)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1763
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1765

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1766
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1766
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1767
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1767
  %xor1 = xor i8 %1, %2, !dbg !1768
  %and2 = and i8 %xor1, %sub, !dbg !1769
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1770
  %xor93 = xor i8 %1, %and2, !dbg !1771
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1771
  %inc = add i32 %i.0, 1, !dbg !1772
    #dbg_value(i32 %inc, !1759, !DIExpression(), !1752)
  br label %for.cond, !dbg !1773, !llvm.loop !1774

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1776
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1777 {
entry:
    #dbg_value(ptr %r, !1780, !DIExpression(), !1781)
    #dbg_value(i16 %v, !1782, !DIExpression(), !1781)
    #dbg_value(i16 %b, !1783, !DIExpression(), !1781)
  %sub = sub i16 0, %b, !dbg !1784
    #dbg_value(i16 %sub, !1783, !DIExpression(), !1781)
  %0 = load i16, ptr %r, align 2, !dbg !1785
  %xor1 = xor i16 %0, %v, !dbg !1786
  %and = and i16 %xor1, %sub, !dbg !1787
  %xor6 = xor i16 %and, %0, !dbg !1788
  store i16 %xor6, ptr %r, align 2, !dbg !1788
  ret void, !dbg !1789
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1790 {
entry:
    #dbg_value(ptr %state, !1799, !DIExpression(), !1800)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1801
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1802
  store i32 0, ptr %pos, align 8, !dbg !1803
  ret void, !dbg !1804
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1805 {
entry:
    #dbg_value(ptr %s, !1809, !DIExpression(), !1810)
    #dbg_value(i32 0, !1811, !DIExpression(), !1810)
  br label %for.cond, !dbg !1812

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1814
    #dbg_value(i32 %i.0, !1811, !DIExpression(), !1810)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1815
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1817

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1818
  store i64 0, ptr %arrayidx, align 8, !dbg !1819
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1820
    #dbg_value(i32 %inc, !1811, !DIExpression(), !1810)
  br label %for.cond, !dbg !1821, !llvm.loop !1822

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1824
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1825 {
entry:
    #dbg_value(ptr %state, !1828, !DIExpression(), !1829)
    #dbg_value(ptr %in, !1830, !DIExpression(), !1829)
    #dbg_value(i32 %inlen, !1831, !DIExpression(), !1829)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1832
  %0 = load i32, ptr %pos, align 8, !dbg !1832
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1833
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1834
  store i32 %call, ptr %pos1, align 8, !dbg !1835
  ret void, !dbg !1836
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1837 {
entry:
    #dbg_value(ptr %s, !1840, !DIExpression(), !1841)
    #dbg_value(i32 %pos, !1842, !DIExpression(), !1841)
    #dbg_value(i32 %r, !1843, !DIExpression(), !1841)
    #dbg_value(ptr %in, !1844, !DIExpression(), !1841)
    #dbg_value(i32 %inlen, !1845, !DIExpression(), !1841)
  br label %while.cond, !dbg !1846

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1842, !DIExpression(), !1841)
    #dbg_value(i32 %inlen.addr.0, !1845, !DIExpression(), !1841)
    #dbg_value(ptr %in.addr.0, !1844, !DIExpression(), !1841)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1847
  %cmp.not = icmp ult i32 %add, %r, !dbg !1848
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1846

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1849
  br label %for.cond, !dbg !1849

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1852

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1854
    #dbg_value(i32 %i.0, !1855, !DIExpression(), !1841)
    #dbg_value(ptr %in.addr.1, !1844, !DIExpression(), !1841)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1856
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1849

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1844, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1841)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1858
  %conv = zext i8 %0 to i64, !dbg !1859
  %rem = shl i32 %i.0, 3, !dbg !1860
  %mul = and i32 %rem, 56, !dbg !1860
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1861
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1861
  %div2 = lshr i32 %i.0, 3, !dbg !1862
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1863
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1864
  %xor = xor i64 %1, %shl, !dbg !1864
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1864
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1865
    #dbg_value(ptr %incdec.ptr, !1844, !DIExpression(), !1841)
  %inc = add i32 %i.0, 1, !dbg !1866
    #dbg_value(i32 %inc, !1855, !DIExpression(), !1841)
  br label %for.cond, !dbg !1867, !llvm.loop !1868

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1870
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1871
    #dbg_value(i32 %sub2, !1845, !DIExpression(), !1841)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1872
    #dbg_value(i32 0, !1842, !DIExpression(), !1841)
  br label %while.cond, !dbg !1846, !llvm.loop !1873

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1875
    #dbg_value(i32 %i.1, !1855, !DIExpression(), !1841)
    #dbg_value(ptr %in.addr.2, !1844, !DIExpression(), !1841)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1876
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1878
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1852

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1844, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1841)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1879
  %conv9 = zext i8 %2 to i64, !dbg !1880
  %rem10 = shl i32 %i.1, 3, !dbg !1881
  %mul11 = and i32 %rem10, 56, !dbg !1881
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1882
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1882
  %div141 = lshr i32 %i.1, 3, !dbg !1883
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1884
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1885
  %xor16 = xor i64 %3, %shl13, !dbg !1885
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1885
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1886
    #dbg_value(ptr %incdec.ptr8, !1844, !DIExpression(), !1841)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1887
    #dbg_value(i32 %inc18, !1855, !DIExpression(), !1841)
  br label %for.cond3, !dbg !1888, !llvm.loop !1889

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1875
  ret i32 %i.1.lcssa, !dbg !1891
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1892 {
entry:
    #dbg_value(ptr %state, !1893, !DIExpression(), !1894)
  %0 = load i64, ptr %state, align 8, !dbg !1895
    #dbg_value(i64 %0, !1896, !DIExpression(), !1894)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1897
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1897
    #dbg_value(i64 %1, !1898, !DIExpression(), !1894)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1899
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1899
    #dbg_value(i64 %2, !1900, !DIExpression(), !1894)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1901
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1901
    #dbg_value(i64 %3, !1902, !DIExpression(), !1894)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1903
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1903
    #dbg_value(i64 %4, !1904, !DIExpression(), !1894)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1905
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1905
    #dbg_value(i64 %5, !1906, !DIExpression(), !1894)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1907
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1907
    #dbg_value(i64 %6, !1908, !DIExpression(), !1894)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1909
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1909
    #dbg_value(i64 %7, !1910, !DIExpression(), !1894)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1911
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1911
    #dbg_value(i64 %8, !1912, !DIExpression(), !1894)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1913
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1913
    #dbg_value(i64 %9, !1914, !DIExpression(), !1894)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1915
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1915
    #dbg_value(i64 %10, !1916, !DIExpression(), !1894)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1917
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1917
    #dbg_value(i64 %11, !1918, !DIExpression(), !1894)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1919
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1919
    #dbg_value(i64 %12, !1920, !DIExpression(), !1894)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1921
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1921
    #dbg_value(i64 %13, !1922, !DIExpression(), !1894)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1923
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1923
    #dbg_value(i64 %14, !1924, !DIExpression(), !1894)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1925
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1925
    #dbg_value(i64 %15, !1926, !DIExpression(), !1894)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1927
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1927
    #dbg_value(i64 %16, !1928, !DIExpression(), !1894)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1929
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1929
    #dbg_value(i64 %17, !1930, !DIExpression(), !1894)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1931
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1931
    #dbg_value(i64 %18, !1932, !DIExpression(), !1894)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1933
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1933
    #dbg_value(i64 %19, !1934, !DIExpression(), !1894)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1935
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1935
    #dbg_value(i64 %20, !1936, !DIExpression(), !1894)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1937
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1937
    #dbg_value(i64 %21, !1938, !DIExpression(), !1894)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1939
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1939
    #dbg_value(i64 %22, !1940, !DIExpression(), !1894)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1941
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1941
    #dbg_value(i64 %23, !1942, !DIExpression(), !1894)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1943
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1943
    #dbg_value(i64 %24, !1944, !DIExpression(), !1894)
    #dbg_value(i32 0, !1945, !DIExpression(), !1894)
  br label %for.cond, !dbg !1946

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1894
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1894
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1894
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1894
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1894
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1894
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1894
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1894
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1894
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1894
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1894
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1894
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1894
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1894
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1894
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1894
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1894
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1894
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1894
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1894
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1894
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1894
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1894
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1894
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1948
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1894
    #dbg_value(i64 %Asu.0, !1944, !DIExpression(), !1894)
    #dbg_value(i32 %round.0, !1945, !DIExpression(), !1894)
    #dbg_value(i64 %Aba.0, !1896, !DIExpression(), !1894)
    #dbg_value(i64 %Abe.0, !1898, !DIExpression(), !1894)
    #dbg_value(i64 %Abi.0, !1900, !DIExpression(), !1894)
    #dbg_value(i64 %Abo.0, !1902, !DIExpression(), !1894)
    #dbg_value(i64 %Abu.0, !1904, !DIExpression(), !1894)
    #dbg_value(i64 %Aga.0, !1906, !DIExpression(), !1894)
    #dbg_value(i64 %Age.0, !1908, !DIExpression(), !1894)
    #dbg_value(i64 %Agi.0, !1910, !DIExpression(), !1894)
    #dbg_value(i64 %Ago.0, !1912, !DIExpression(), !1894)
    #dbg_value(i64 %Agu.0, !1914, !DIExpression(), !1894)
    #dbg_value(i64 %Aka.0, !1916, !DIExpression(), !1894)
    #dbg_value(i64 %Ake.0, !1918, !DIExpression(), !1894)
    #dbg_value(i64 %Aki.0, !1920, !DIExpression(), !1894)
    #dbg_value(i64 %Ako.0, !1922, !DIExpression(), !1894)
    #dbg_value(i64 %Aku.0, !1924, !DIExpression(), !1894)
    #dbg_value(i64 %Ama.0, !1926, !DIExpression(), !1894)
    #dbg_value(i64 %Ame.0, !1928, !DIExpression(), !1894)
    #dbg_value(i64 %Ami.0, !1930, !DIExpression(), !1894)
    #dbg_value(i64 %Amo.0, !1932, !DIExpression(), !1894)
    #dbg_value(i64 %Amu.0, !1934, !DIExpression(), !1894)
    #dbg_value(i64 %Asa.0, !1936, !DIExpression(), !1894)
    #dbg_value(i64 %Ase.0, !1938, !DIExpression(), !1894)
    #dbg_value(i64 %Asi.0, !1940, !DIExpression(), !1894)
    #dbg_value(i64 %Aso.0, !1942, !DIExpression(), !1894)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1949
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1951

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !1987
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !1989
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !1990
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !1991
    #dbg_value(i64 %xor35, !1954, !DIExpression(), !1894)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !1992
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !1993
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !1994
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !1995
    #dbg_value(i64 %xor43, !1956, !DIExpression(), !1894)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !1996
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor57 = xor i64 %xor35, %xor56, !dbg !1997
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 %xor57, !1960, !DIExpression(), !1894)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !1998
    #dbg_value(i64 %xor203, !1912, !DIExpression(), !1894)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !1999
    #dbg_value(i64 %xor206, !1953, !DIExpression(), !1894)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2000
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2001
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2002
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2003
    #dbg_value(i64 %xor31, !1953, !DIExpression(), !1894)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2004
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2005
    #dbg_value(i64 %xor45, !1957, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2006
    #dbg_value(i64 %xor211, !1926, !DIExpression(), !1894)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2007
    #dbg_value(i64 %xor214, !1955, !DIExpression(), !1894)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2008
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2009
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2010
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2011
    #dbg_value(i64 %xor39, !1955, !DIExpression(), !1894)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2012
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2013
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2014
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2015
    #dbg_value(i64 %xor27, !1952, !DIExpression(), !1894)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2016
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2017
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 %xor61, !1961, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2018
    #dbg_value(i64 %xor207, !1924, !DIExpression(), !1894)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2019
    #dbg_value(i64 %xor210, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not222 = xor i64 %xor210, -1, !dbg !2020
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and223 = and i64 %xor214, %not222, !dbg !2021
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor224 = xor i64 %xor206, %and223, !dbg !2022
    #dbg_value(i64 %xor224, !1983, !DIExpression(), !1894)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2023
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2024
    #dbg_value(i64 %xor53, !1959, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2025
    #dbg_value(i64 %xor67, !1920, !DIExpression(), !1894)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2026
    #dbg_value(i64 %xor70, !1954, !DIExpression(), !1894)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2027
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2028
    #dbg_value(i64 %xor49, !1958, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2029
    #dbg_value(i64 %xor63, !1908, !DIExpression(), !1894)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2030
    #dbg_value(i64 %xor66, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not = xor i64 %xor66, -1, !dbg !2031
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and = and i64 %xor70, %not, !dbg !2032
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2033
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2033
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %26 = xor i64 %and, %25, !dbg !2034
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2035
    #dbg_value(i64 %xor62, !1896, !DIExpression(), !1894)
    #dbg_value(i64 %xor62, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor81 = xor i64 %26, %xor62, !dbg !2034
    #dbg_value(i64 %xor81, !1962, !DIExpression(), !1894)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2036
    #dbg_value(i64 %xor94, !1902, !DIExpression(), !1894)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2037
    #dbg_value(i64 %xor97, !1952, !DIExpression(), !1894)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2038
    #dbg_value(i64 %xor102, !1916, !DIExpression(), !1894)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2039
    #dbg_value(i64 %xor105, !1954, !DIExpression(), !1894)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2040
    #dbg_value(i64 %xor98, !1914, !DIExpression(), !1894)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2041
    #dbg_value(i64 %xor101, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not114 = xor i64 %xor101, -1, !dbg !2042
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and115 = and i64 %xor105, %not114, !dbg !2043
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor116 = xor i64 %xor97, %and115, !dbg !2044
    #dbg_value(i64 %xor116, !1967, !DIExpression(), !1894)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2045
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2046
    #dbg_value(i64 %xor129, !1898, !DIExpression(), !1894)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2047
    #dbg_value(i64 %xor132, !1952, !DIExpression(), !1894)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2048
    #dbg_value(i64 %xor137, !1922, !DIExpression(), !1894)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2049
    #dbg_value(i64 %xor140, !1954, !DIExpression(), !1894)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2050
    #dbg_value(i64 %xor133, !1910, !DIExpression(), !1894)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2051
    #dbg_value(i64 %xor136, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not149 = xor i64 %xor136, -1, !dbg !2052
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and150 = and i64 %xor140, %not149, !dbg !2053
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor151 = xor i64 %xor132, %and150, !dbg !2054
    #dbg_value(i64 %xor151, !1972, !DIExpression(), !1894)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2055
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2056
    #dbg_value(i64 %xor164, !1904, !DIExpression(), !1894)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2057
    #dbg_value(i64 %xor167, !1952, !DIExpression(), !1894)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2058
    #dbg_value(i64 %xor172, !1918, !DIExpression(), !1894)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2059
    #dbg_value(i64 %xor175, !1954, !DIExpression(), !1894)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2060
    #dbg_value(i64 %xor168, !1906, !DIExpression(), !1894)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2061
    #dbg_value(i64 %xor171, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not184 = xor i64 %xor171, -1, !dbg !2062
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and185 = and i64 %xor175, %not184, !dbg !2063
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor186 = xor i64 %xor167, %and185, !dbg !2064
    #dbg_value(i64 %xor186, !1977, !DIExpression(), !1894)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2065
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2066
    #dbg_value(i64 %xor199, !1900, !DIExpression(), !1894)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2067
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not219 = xor i64 %xor206, -1, !dbg !2068
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and220 = and i64 %xor210, %not219, !dbg !2069
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor221 = xor i64 %xor202, %and220, !dbg !2070
    #dbg_value(i64 %xor221, !1982, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2071
    #dbg_value(i64 %xor237, !1952, !DIExpression(), !1894)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2072
    #dbg_value(i64 %xor75, !1944, !DIExpression(), !1894)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2073
    #dbg_value(i64 %xor78, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2074
    #dbg_value(i64 %xor71, !1932, !DIExpression(), !1894)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2075
    #dbg_value(i64 %xor74, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not85 = xor i64 %xor74, -1, !dbg !2076
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and86 = and i64 %xor78, %not85, !dbg !2077
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor87 = xor i64 %xor70, %and86, !dbg !2078
    #dbg_value(i64 %xor87, !1964, !DIExpression(), !1894)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2079
    #dbg_value(i64 %xor110, !1940, !DIExpression(), !1894)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2080
    #dbg_value(i64 %xor113, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2081
    #dbg_value(i64 %xor106, !1928, !DIExpression(), !1894)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2082
    #dbg_value(i64 %xor109, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not120 = xor i64 %xor109, -1, !dbg !2083
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and121 = and i64 %xor113, %not120, !dbg !2084
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor122 = xor i64 %xor105, %and121, !dbg !2085
    #dbg_value(i64 %xor122, !1969, !DIExpression(), !1894)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2086
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2087
    #dbg_value(i64 %xor145, !1936, !DIExpression(), !1894)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2088
    #dbg_value(i64 %xor148, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2089
    #dbg_value(i64 %xor141, !1934, !DIExpression(), !1894)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2090
    #dbg_value(i64 %xor144, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not155 = xor i64 %xor144, -1, !dbg !2091
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and156 = and i64 %xor148, %not155, !dbg !2092
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor157 = xor i64 %xor140, %and156, !dbg !2093
    #dbg_value(i64 %xor157, !1974, !DIExpression(), !1894)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2094
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2095
    #dbg_value(i64 %xor180, !1942, !DIExpression(), !1894)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2096
    #dbg_value(i64 %xor183, !1956, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2097
    #dbg_value(i64 %xor176, !1930, !DIExpression(), !1894)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2098
    #dbg_value(i64 %xor179, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %not190 = xor i64 %xor179, -1, !dbg !2099
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and191 = and i64 %xor183, %not190, !dbg !2100
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor192 = xor i64 %xor175, %and191, !dbg !2101
    #dbg_value(i64 %xor192, !1979, !DIExpression(), !1894)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2102
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2103
    #dbg_value(i64 %xor215, !1938, !DIExpression(), !1894)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2104
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not225 = xor i64 %xor214, -1, !dbg !2105
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and226 = and i64 %xor218, %not225, !dbg !2106
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor227 = xor i64 %xor210, %and226, !dbg !2107
    #dbg_value(i64 %xor227, !1984, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2108
    #dbg_value(i64 %xor245, !1954, !DIExpression(), !1894)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2109
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 %xor261, !1958, !DIExpression(), !1894)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2111
    #dbg_value(i64 %xor429, !1983, !DIExpression(), !1894)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2112
    #dbg_value(i64 %xor432, !1956, !DIExpression(), !1894)
  %not123 = xor i64 %xor113, -1, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and124 = and i64 %xor97, %not123, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor125 = xor i64 %xor109, %and124, !dbg !2115
    #dbg_value(i64 %xor125, !1970, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not91 = xor i64 %xor62, -1, !dbg !2116
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and92 = and i64 %xor66, %not91, !dbg !2117
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor93 = xor i64 %xor78, %and92, !dbg !2118
    #dbg_value(i64 %xor93, !1966, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not126 = xor i64 %xor97, -1, !dbg !2119
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and127 = and i64 %xor101, %not126, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor128 = xor i64 %xor113, %and127, !dbg !2121
    #dbg_value(i64 %xor128, !1971, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not161 = xor i64 %xor132, -1, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and162 = and i64 %xor136, %not161, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor163 = xor i64 %xor148, %and162, !dbg !2125
    #dbg_value(i64 %xor163, !1976, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2126
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not196 = xor i64 %xor167, -1, !dbg !2127
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and197 = and i64 %xor171, %not196, !dbg !2128
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor198 = xor i64 %xor183, %and197, !dbg !2129
    #dbg_value(i64 %xor198, !1981, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not231 = xor i64 %xor202, -1, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %and232 = and i64 %xor206, %not231, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor233 = xor i64 %xor218, %and232, !dbg !2133
    #dbg_value(i64 %xor233, !1986, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2134
    #dbg_value(i64 %xor253, !1956, !DIExpression(), !1894)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2135
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2136
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 %xor269, !1960, !DIExpression(), !1894)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2137
    #dbg_value(i64 %xor417, !1970, !DIExpression(), !1894)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2138
    #dbg_value(i64 %xor420, !1953, !DIExpression(), !1894)
  %not82 = xor i64 %xor70, -1, !dbg !2139
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and83 = and i64 %xor74, %not82, !dbg !2140
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor84 = xor i64 %xor66, %and83, !dbg !2141
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %not117 = xor i64 %xor105, -1, !dbg !2142
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and118 = and i64 %xor109, %not117, !dbg !2143
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor119 = xor i64 %xor101, %and118, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %not152 = xor i64 %xor140, -1, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and153 = and i64 %xor144, %not152, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor154 = xor i64 %xor136, %and153, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %not187 = xor i64 %xor175, -1, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and188 = and i64 %xor179, %not187, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor189 = xor i64 %xor171, %and188, !dbg !2152
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2153
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1953, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2154
    #dbg_value(i64 %xor241, !1953, !DIExpression(), !1894)
  %not88 = xor i64 %xor78, -1, !dbg !2155
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and89 = and i64 %xor62, %not88, !dbg !2156
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor90 = xor i64 %xor74, %and89, !dbg !2157
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2158
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not158 = xor i64 %xor148, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and159 = and i64 %xor132, %not158, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor160 = xor i64 %xor144, %and159, !dbg !2161
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2162
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not193 = xor i64 %xor183, -1, !dbg !2163
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and194 = and i64 %xor167, %not193, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor195 = xor i64 %xor179, %and194, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %not228 = xor i64 %xor218, -1, !dbg !2167
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and229 = and i64 %xor202, %not228, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor230 = xor i64 %xor214, %and229, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2170
    #dbg_value(i64 %xor249, !1955, !DIExpression(), !1894)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2171
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2172
    #dbg_value(i64 %xor265, !1959, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2173
    #dbg_value(i64 %xor413, !1964, !DIExpression(), !1894)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2174
    #dbg_value(i64 %xor416, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not445 = xor i64 %xor416, -1, !dbg !2175
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and446 = and i64 %xor420, %not445, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor447 = xor i64 %xor432, %and446, !dbg !2177
    #dbg_value(i64 %xor447, !1944, !DIExpression(), !1894)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2178
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2179
    #dbg_value(i64 %xor257, !1957, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2180
    #dbg_value(i64 %xor425, !1977, !DIExpression(), !1894)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2181
    #dbg_value(i64 %xor428, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not442 = xor i64 %xor432, -1, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and443 = and i64 %xor416, %not442, !dbg !2183
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor444 = xor i64 %xor428, %and443, !dbg !2184
    #dbg_value(i64 %xor444, !1942, !DIExpression(), !1894)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2185
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2186
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(i64 %xor273, !1961, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2187
    #dbg_value(i64 %xor421, !1976, !DIExpression(), !1894)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2188
    #dbg_value(i64 %xor424, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not439 = xor i64 %xor428, -1, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and440 = and i64 %xor432, %not439, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor441 = xor i64 %xor424, %and440, !dbg !2191
    #dbg_value(i64 %xor441, !1940, !DIExpression(), !1894)
  %not436 = xor i64 %xor424, -1, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and437 = and i64 %xor428, %not436, !dbg !2193
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor438 = xor i64 %xor420, %and437, !dbg !2194
    #dbg_value(i64 %xor438, !1938, !DIExpression(), !1894)
  %not433 = xor i64 %xor420, -1, !dbg !2195
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and434 = and i64 %xor424, %not433, !dbg !2196
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor435 = xor i64 %xor416, %and434, !dbg !2197
    #dbg_value(i64 %xor435, !1936, !DIExpression(), !1894)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2198
    #dbg_value(i64 %xor394, !1985, !DIExpression(), !1894)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2199
    #dbg_value(i64 %xor397, !1956, !DIExpression(), !1894)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2200
    #dbg_value(i64 %xor382, !1967, !DIExpression(), !1894)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2201
    #dbg_value(i64 %xor385, !1953, !DIExpression(), !1894)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2202
    #dbg_value(i64 %xor378, !1966, !DIExpression(), !1894)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2203
    #dbg_value(i64 %xor381, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not410 = xor i64 %xor381, -1, !dbg !2204
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and411 = and i64 %xor385, %not410, !dbg !2205
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor412 = xor i64 %xor397, %and411, !dbg !2206
    #dbg_value(i64 %xor412, !1934, !DIExpression(), !1894)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2207
    #dbg_value(i64 %xor390, !1979, !DIExpression(), !1894)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2208
    #dbg_value(i64 %xor393, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not407 = xor i64 %xor397, -1, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and408 = and i64 %xor381, %not407, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor409 = xor i64 %xor393, %and408, !dbg !2211
    #dbg_value(i64 %xor409, !1932, !DIExpression(), !1894)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2212
    #dbg_value(i64 %xor386, !1973, !DIExpression(), !1894)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2213
    #dbg_value(i64 %xor389, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not404 = xor i64 %xor393, -1, !dbg !2214
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and405 = and i64 %xor397, %not404, !dbg !2215
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor406 = xor i64 %xor389, %and405, !dbg !2216
    #dbg_value(i64 %xor406, !1930, !DIExpression(), !1894)
  %not401 = xor i64 %xor389, -1, !dbg !2217
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and402 = and i64 %xor393, %not401, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor403 = xor i64 %xor385, %and402, !dbg !2219
    #dbg_value(i64 %xor403, !1928, !DIExpression(), !1894)
  %not398 = xor i64 %xor385, -1, !dbg !2220
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and399 = and i64 %xor389, %not398, !dbg !2221
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor400 = xor i64 %xor381, %and399, !dbg !2222
    #dbg_value(i64 %xor400, !1926, !DIExpression(), !1894)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2223
    #dbg_value(i64 %xor359, !1982, !DIExpression(), !1894)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2224
    #dbg_value(i64 %xor362, !1956, !DIExpression(), !1894)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2225
    #dbg_value(i64 %xor347, !1969, !DIExpression(), !1894)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2226
    #dbg_value(i64 %xor350, !1953, !DIExpression(), !1894)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2227
    #dbg_value(i64 %xor343, !1963, !DIExpression(), !1894)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2228
    #dbg_value(i64 %xor346, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not375 = xor i64 %xor346, -1, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and376 = and i64 %xor350, %not375, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor377 = xor i64 %xor362, %and376, !dbg !2231
    #dbg_value(i64 %xor377, !1924, !DIExpression(), !1894)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2232
    #dbg_value(i64 %xor355, !1981, !DIExpression(), !1894)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2233
    #dbg_value(i64 %xor358, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not372 = xor i64 %xor362, -1, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and373 = and i64 %xor346, %not372, !dbg !2235
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor374 = xor i64 %xor358, %and373, !dbg !2236
    #dbg_value(i64 %xor374, !1922, !DIExpression(), !1894)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2237
    #dbg_value(i64 %xor351, !1975, !DIExpression(), !1894)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2238
    #dbg_value(i64 %xor354, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not369 = xor i64 %xor358, -1, !dbg !2239
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and370 = and i64 %xor362, %not369, !dbg !2240
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor371 = xor i64 %xor354, %and370, !dbg !2241
    #dbg_value(i64 %xor371, !1920, !DIExpression(), !1894)
  %not366 = xor i64 %xor354, -1, !dbg !2242
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and367 = and i64 %xor358, %not366, !dbg !2243
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor368 = xor i64 %xor350, %and367, !dbg !2244
    #dbg_value(i64 %xor368, !1918, !DIExpression(), !1894)
  %not363 = xor i64 %xor350, -1, !dbg !2245
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and364 = and i64 %xor354, %not363, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor365 = xor i64 %xor346, %and364, !dbg !2247
    #dbg_value(i64 %xor365, !1916, !DIExpression(), !1894)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2248
    #dbg_value(i64 %xor324, !1984, !DIExpression(), !1894)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2249
    #dbg_value(i64 %xor327, !1956, !DIExpression(), !1894)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2250
    #dbg_value(i64 %xor312, !1971, !DIExpression(), !1894)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2251
    #dbg_value(i64 %xor315, !1953, !DIExpression(), !1894)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2252
    #dbg_value(i64 %xor308, !1965, !DIExpression(), !1894)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2253
    #dbg_value(i64 %xor311, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not340 = xor i64 %xor311, -1, !dbg !2254
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and341 = and i64 %xor315, %not340, !dbg !2255
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor342 = xor i64 %xor327, %and341, !dbg !2256
    #dbg_value(i64 %xor342, !1914, !DIExpression(), !1894)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2257
    #dbg_value(i64 %xor320, !1978, !DIExpression(), !1894)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2258
    #dbg_value(i64 %xor323, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not337 = xor i64 %xor327, -1, !dbg !2259
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and338 = and i64 %xor311, %not337, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor339 = xor i64 %xor323, %and338, !dbg !2261
    #dbg_value(i64 %xor339, !1912, !DIExpression(), !1894)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2262
    #dbg_value(i64 %xor316, !1972, !DIExpression(), !1894)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2263
    #dbg_value(i64 %xor319, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not334 = xor i64 %xor323, -1, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and335 = and i64 %xor327, %not334, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor336 = xor i64 %xor319, %and335, !dbg !2266
    #dbg_value(i64 %xor336, !1910, !DIExpression(), !1894)
  %not331 = xor i64 %xor319, -1, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and332 = and i64 %xor323, %not331, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor333 = xor i64 %xor315, %and332, !dbg !2269
    #dbg_value(i64 %xor333, !1908, !DIExpression(), !1894)
  %not328 = xor i64 %xor315, -1, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and329 = and i64 %xor319, %not328, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor330 = xor i64 %xor311, %and329, !dbg !2272
    #dbg_value(i64 %xor330, !1906, !DIExpression(), !1894)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2273
    #dbg_value(i64 %xor287, !1986, !DIExpression(), !1894)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2274
    #dbg_value(i64 %xor290, !1956, !DIExpression(), !1894)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2275
    #dbg_value(i64 %xor275, !1968, !DIExpression(), !1894)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2276
    #dbg_value(i64 %xor278, !1953, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2277
    #dbg_value(i64 %xor274, !1962, !DIExpression(), !1894)
    #dbg_value(i64 %xor274, !1952, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not305 = xor i64 %xor274, -1, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and306 = and i64 %xor278, %not305, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor307 = xor i64 %xor290, %and306, !dbg !2280
    #dbg_value(i64 %xor307, !1904, !DIExpression(), !1894)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2281
    #dbg_value(i64 %xor283, !1980, !DIExpression(), !1894)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2282
    #dbg_value(i64 %xor286, !1955, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not302 = xor i64 %xor290, -1, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and303 = and i64 %xor274, %not302, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor304 = xor i64 %xor286, %and303, !dbg !2285
    #dbg_value(i64 %xor304, !1902, !DIExpression(), !1894)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2286
    #dbg_value(i64 %xor279, !1974, !DIExpression(), !1894)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2287
    #dbg_value(i64 %xor282, !1954, !DIExpression(), !1894)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %not299 = xor i64 %xor286, -1, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and300 = and i64 %xor290, %not299, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor301 = xor i64 %xor282, %and300, !dbg !2290
    #dbg_value(i64 %xor301, !1900, !DIExpression(), !1894)
  %not296 = xor i64 %xor282, -1, !dbg !2291
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1894)
  %and297 = and i64 %xor286, %not296, !dbg !2292
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %xor298 = xor i64 %xor278, %and297, !dbg !2293
    #dbg_value(i64 %xor298, !1898, !DIExpression(), !1894)
  %add = or disjoint i32 %round.0, 1, !dbg !2294
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2295
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2295
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %not291 = xor i64 %xor278, -1, !dbg !2296
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %and292 = and i64 %xor282, %not291, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1896, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1894)
  %28 = xor i64 %and292, %27, !dbg !2298
  %xor295 = xor i64 %28, %xor274, !dbg !2298
    #dbg_value(i64 %xor295, !1896, !DIExpression(), !1894)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2299
    #dbg_value(i32 %add448, !1945, !DIExpression(), !1894)
  br label %for.cond, !dbg !2300, !llvm.loop !2301

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1894
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1894
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1894
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1894
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1894
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1894
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1894
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1894
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1894
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1894
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1894
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1894
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1894
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1894
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1894
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1894
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1894
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1894
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1894
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1894
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1894
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1894
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1894
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1894
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1894
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2303
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2304
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2305
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2306
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2307
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2308
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2309
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2310
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2311
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2312
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2313
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2314
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2315
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2316
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2317
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2318
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2319
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2320
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2321
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2322
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2323
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2324
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2325
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2326
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2327
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2328
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2329
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2330
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2331
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2332
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2333
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2334
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2335
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2336
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2337
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2338
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2339
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2340
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2341
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2342
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2343
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2344
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2345
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2346
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2347
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2348
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2349
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2350
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2351
  ret void, !dbg !2352
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2353 {
entry:
    #dbg_value(ptr %state, !2354, !DIExpression(), !2355)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2356
  %0 = load i32, ptr %pos, align 8, !dbg !2356
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2357
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2358
  store i32 168, ptr %pos1, align 8, !dbg !2359
  ret void, !dbg !2360
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2361 {
entry:
    #dbg_value(ptr %s, !2364, !DIExpression(), !2365)
    #dbg_value(i32 %pos, !2366, !DIExpression(), !2365)
    #dbg_value(i32 %r, !2367, !DIExpression(), !2365)
    #dbg_value(i8 %p, !2368, !DIExpression(), !2365)
  %conv = zext i8 %p to i64, !dbg !2369
  %rem = shl i32 %pos, 3, !dbg !2370
  %mul = and i32 %rem, 56, !dbg !2370
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2371
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2371
  %div2 = lshr i32 %pos, 3, !dbg !2372
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2373
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2374
  %xor = xor i64 %0, %shl, !dbg !2374
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2374
  %div13 = lshr i32 %r, 3, !dbg !2375
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2376
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2376
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2377
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2377
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2377
  ret void, !dbg !2378
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2379 {
entry:
    #dbg_value(ptr %out, !2382, !DIExpression(), !2383)
    #dbg_value(i32 %outlen, !2384, !DIExpression(), !2383)
    #dbg_value(ptr %state, !2385, !DIExpression(), !2383)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2386
  %0 = load i32, ptr %pos, align 8, !dbg !2386
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 168) #3, !dbg !2387
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2388
  store i32 %call, ptr %pos1, align 8, !dbg !2389
  ret void, !dbg !2390
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) unnamed_addr #0 !dbg !2391 {
entry:
    #dbg_value(ptr %out, !2394, !DIExpression(), !2395)
    #dbg_value(i32 %outlen, !2396, !DIExpression(), !2395)
    #dbg_value(ptr %s, !2397, !DIExpression(), !2395)
    #dbg_value(i32 %pos, !2398, !DIExpression(), !2395)
    #dbg_value(i32 %r, !2399, !DIExpression(), !2395)
  br label %while.cond, !dbg !2400

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2394, !DIExpression(), !2395)
    #dbg_value(i32 %outlen.addr.0, !2396, !DIExpression(), !2395)
    #dbg_value(i32 %pos.addr.0, !2398, !DIExpression(), !2395)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2400
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2400

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2401
  br i1 %cmp, label %if.then, label %if.end, !dbg !2401

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2404
    #dbg_value(i32 0, !2398, !DIExpression(), !2395)
  br label %if.end, !dbg !2406

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2398, !DIExpression(), !2395)
    #dbg_value(i32 %pos.addr.1, !2407, !DIExpression(), !2395)
  br label %for.cond, !dbg !2408

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2410
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2394, !DIExpression(), !2395)
    #dbg_value(i32 %i.0, !2407, !DIExpression(), !2395)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2411
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2413
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2413
  %0 = and i1 %cmp1, %cmp2, !dbg !2413
  br i1 %0, label %for.body, label %for.end, !dbg !2414

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2415
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2416
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2416
  %rem = shl i32 %i.0, 3, !dbg !2417
  %mul = and i32 %rem, 56, !dbg !2417
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2418
  %shr = lshr i64 %1, %sh_prom, !dbg !2418
  %conv = trunc i64 %shr to i8, !dbg !2416
    #dbg_value(ptr %out.addr.1, !2394, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2395)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2419
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2420
    #dbg_value(ptr %incdec.ptr, !2394, !DIExpression(), !2395)
  %inc = add nuw i32 %i.0, 1, !dbg !2421
    #dbg_value(i32 %inc, !2407, !DIExpression(), !2395)
  br label %for.cond, !dbg !2422, !llvm.loop !2423

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2410
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2425
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2426
    #dbg_value(i32 %sub3, !2396, !DIExpression(), !2395)
    #dbg_value(i32 %i.0.lcssa, !2398, !DIExpression(), !2395)
  br label %while.cond, !dbg !2400, !llvm.loop !2427

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2429
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2430 {
entry:
    #dbg_value(ptr %state, !2431, !DIExpression(), !2432)
    #dbg_value(ptr %in, !2433, !DIExpression(), !2432)
    #dbg_value(i32 %inlen, !2434, !DIExpression(), !2432)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2435
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2436
  store i32 168, ptr %pos, align 8, !dbg !2437
  ret void, !dbg !2438
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2439 {
entry:
    #dbg_value(ptr %s, !2442, !DIExpression(), !2443)
    #dbg_value(i32 %r, !2444, !DIExpression(), !2443)
    #dbg_value(ptr %in, !2445, !DIExpression(), !2443)
    #dbg_value(i32 %inlen, !2446, !DIExpression(), !2443)
    #dbg_value(i8 %p, !2447, !DIExpression(), !2443)
    #dbg_value(i32 0, !2448, !DIExpression(), !2443)
  br label %for.cond, !dbg !2449

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2451
    #dbg_value(i32 %i.0, !2448, !DIExpression(), !2443)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2452
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2454

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2455
  br label %while.cond, !dbg !2455

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2456
  store i64 0, ptr %arrayidx, align 8, !dbg !2457
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2458
    #dbg_value(i32 %inc, !2448, !DIExpression(), !2443)
  br label %for.cond, !dbg !2459, !llvm.loop !2460

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2446, !DIExpression(), !2443)
    #dbg_value(ptr %in.addr.0, !2445, !DIExpression(), !2443)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2462
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2455

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2463

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2466

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2468
    #dbg_value(i32 %i.1, !2448, !DIExpression(), !2443)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2469
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2463

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !2471
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2472
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2473
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2474
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2475
  %xor = xor i64 %1, %call, !dbg !2475
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2475
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2476
    #dbg_value(i32 %inc7, !2448, !DIExpression(), !2443)
  br label %for.cond2, !dbg !2477, !llvm.loop !2478

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2480
    #dbg_value(ptr %add.ptr9, !2445, !DIExpression(), !2443)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2481
    #dbg_value(i32 %sub, !2446, !DIExpression(), !2443)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2482
  br label %while.cond, !dbg !2455, !llvm.loop !2483

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2485
    #dbg_value(i32 %i.2, !2448, !DIExpression(), !2443)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2486
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2466

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2488
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2488
  %conv = zext i8 %2 to i64, !dbg !2489
  %rem = shl i32 %i.2, 3, !dbg !2490
  %mul14 = and i32 %rem, 56, !dbg !2490
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2491
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2491
  %div153 = lshr i32 %i.2, 3, !dbg !2492
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2493
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2494
  %xor17 = xor i64 %3, %shl, !dbg !2494
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2494
  %inc19 = add i32 %i.2, 1, !dbg !2495
    #dbg_value(i32 %inc19, !2448, !DIExpression(), !2443)
  br label %for.cond10, !dbg !2496, !llvm.loop !2497

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2485
  %conv21 = zext i8 %p to i64, !dbg !2499
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2500
  %mul23 = and i32 %rem22, 56, !dbg !2500
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2501
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !2501
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2502
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2503
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2504
  %xor28 = xor i64 %4, %shl25, !dbg !2504
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2504
  %sub29 = add i32 %r, -1, !dbg !2505
  %div302 = lshr i32 %sub29, 3, !dbg !2506
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2507
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2508
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2508
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2508
  ret void, !dbg !2509
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2510 {
entry:
    #dbg_value(ptr %x, !2513, !DIExpression(), !2514)
    #dbg_value(i64 0, !2515, !DIExpression(), !2514)
    #dbg_value(i32 0, !2516, !DIExpression(), !2514)
  br label %for.cond, !dbg !2517

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2519
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2514
    #dbg_value(i64 %r.0, !2515, !DIExpression(), !2514)
    #dbg_value(i32 %i.0, !2516, !DIExpression(), !2514)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2520
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2522

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2514)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2523
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2523
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2514)
  %conv = zext i8 %0 to i64, !dbg !2524
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2514)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2525
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2514)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2526
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2514)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2526
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2515, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2514)
  %or = or i64 %r.0, %shl, !dbg !2527
    #dbg_value(i64 %or, !2515, !DIExpression(), !2514)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2528
    #dbg_value(i32 %inc, !2516, !DIExpression(), !2514)
  br label %for.cond, !dbg !2529, !llvm.loop !2530

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2514
  ret i64 %r.0.lcssa, !dbg !2532
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2533 {
entry:
    #dbg_value(ptr %out, !2534, !DIExpression(), !2535)
    #dbg_value(i32 %nblocks, !2536, !DIExpression(), !2535)
    #dbg_value(ptr %state, !2537, !DIExpression(), !2535)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2538
  ret void, !dbg !2539
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) unnamed_addr #0 !dbg !2540 {
entry:
    #dbg_value(ptr %out, !2543, !DIExpression(), !2544)
    #dbg_value(i32 %nblocks, !2545, !DIExpression(), !2544)
    #dbg_value(ptr %s, !2546, !DIExpression(), !2544)
    #dbg_value(i32 %r, !2547, !DIExpression(), !2544)
  %0 = lshr i32 %r, 3, !dbg !2548
  br label %while.cond, !dbg !2548

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2543, !DIExpression(), !2544)
    #dbg_value(i32 %nblocks.addr.0, !2545, !DIExpression(), !2544)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2548
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2548

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2549
    #dbg_value(i32 0, !2551, !DIExpression(), !2544)
  br label %for.cond, !dbg !2552

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2554
    #dbg_value(i32 %i.0, !2551, !DIExpression(), !2544)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2555
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2557

for.body:                                         ; preds = %for.cond
  %mul = shl nuw i32 %i.0, 3, !dbg !2558
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2559
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2560
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2560
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2561
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2562
    #dbg_value(i32 %inc, !2551, !DIExpression(), !2544)
  br label %for.cond, !dbg !2563, !llvm.loop !2564

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2566
    #dbg_value(ptr %add.ptr1, !2543, !DIExpression(), !2544)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2567
    #dbg_value(i32 %sub, !2545, !DIExpression(), !2544)
  br label %while.cond, !dbg !2548, !llvm.loop !2568

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2570
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2571 {
entry:
    #dbg_value(ptr %x, !2574, !DIExpression(), !2575)
    #dbg_value(i64 %u, !2576, !DIExpression(), !2575)
    #dbg_value(i32 0, !2577, !DIExpression(), !2575)
  br label %for.cond, !dbg !2578

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2580
    #dbg_value(i32 %i.0, !2577, !DIExpression(), !2575)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2581
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2583

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2584
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2585
  %shr = lshr i64 %u, %sh_prom, !dbg !2585
  %conv = trunc i64 %shr to i8, !dbg !2586
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2587
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2588
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2589
    #dbg_value(i32 %inc, !2577, !DIExpression(), !2575)
  br label %for.cond, !dbg !2590, !llvm.loop !2591

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2593
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2594 {
entry:
    #dbg_value(ptr %state, !2595, !DIExpression(), !2596)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2597
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2598
  store i32 0, ptr %pos, align 8, !dbg !2599
  ret void, !dbg !2600
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2601 {
entry:
    #dbg_value(ptr %state, !2602, !DIExpression(), !2603)
    #dbg_value(ptr %in, !2604, !DIExpression(), !2603)
    #dbg_value(i32 %inlen, !2605, !DIExpression(), !2603)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2606
  %0 = load i32, ptr %pos, align 8, !dbg !2606
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2607
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2608
  store i32 %call, ptr %pos1, align 8, !dbg !2609
  ret void, !dbg !2610
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2611 {
entry:
    #dbg_value(ptr %state, !2612, !DIExpression(), !2613)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2614
  %0 = load i32, ptr %pos, align 8, !dbg !2614
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2615
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2616
  store i32 136, ptr %pos1, align 8, !dbg !2617
  ret void, !dbg !2618
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2619 {
entry:
    #dbg_value(ptr %out, !2620, !DIExpression(), !2621)
    #dbg_value(i32 %outlen, !2622, !DIExpression(), !2621)
    #dbg_value(ptr %state, !2623, !DIExpression(), !2621)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2624
  %0 = load i32, ptr %pos, align 8, !dbg !2624
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 136) #3, !dbg !2625
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2626
  store i32 %call, ptr %pos1, align 8, !dbg !2627
  ret void, !dbg !2628
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2629 {
entry:
    #dbg_value(ptr %state, !2630, !DIExpression(), !2631)
    #dbg_value(ptr %in, !2632, !DIExpression(), !2631)
    #dbg_value(i32 %inlen, !2633, !DIExpression(), !2631)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2634
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2635
  store i32 136, ptr %pos, align 8, !dbg !2636
  ret void, !dbg !2637
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2638 {
entry:
    #dbg_value(ptr %out, !2639, !DIExpression(), !2640)
    #dbg_value(i32 %nblocks, !2641, !DIExpression(), !2640)
    #dbg_value(ptr %state, !2642, !DIExpression(), !2640)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2643
  ret void, !dbg !2644
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2645 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2648, !DIExpression(), !2649)
    #dbg_value(i32 %outlen, !2650, !DIExpression(), !2649)
    #dbg_value(ptr %in, !2651, !DIExpression(), !2649)
    #dbg_value(i32 %inlen, !2652, !DIExpression(), !2649)
    #dbg_declare(ptr %state, !2653, !DIExpression(), !2654)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2655
  %div = udiv i32 %outlen, 168, !dbg !2656
    #dbg_value(i32 %div, !2657, !DIExpression(), !2649)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2658
  %mul.neg = mul i32 %div, -168, !dbg !2659
  %sub = add i32 %mul.neg, %outlen, !dbg !2660
    #dbg_value(i32 %sub, !2650, !DIExpression(), !2649)
  %mul1 = mul nuw i32 %div, 168, !dbg !2661
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2662
    #dbg_value(ptr %add.ptr, !2648, !DIExpression(), !2649)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2663
  ret void, !dbg !2664
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2665 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2666, !DIExpression(), !2667)
    #dbg_value(i32 %outlen, !2668, !DIExpression(), !2667)
    #dbg_value(ptr %in, !2669, !DIExpression(), !2667)
    #dbg_value(i32 %inlen, !2670, !DIExpression(), !2667)
    #dbg_declare(ptr %state, !2671, !DIExpression(), !2672)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2673
  %div = udiv i32 %outlen, 136, !dbg !2674
    #dbg_value(i32 %div, !2675, !DIExpression(), !2667)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2676
  %mul.neg = mul i32 %div, -136, !dbg !2677
  %sub = add i32 %mul.neg, %outlen, !dbg !2678
    #dbg_value(i32 %sub, !2668, !DIExpression(), !2667)
  %mul1 = mul nuw i32 %div, 136, !dbg !2679
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2680
    #dbg_value(ptr %add.ptr, !2666, !DIExpression(), !2667)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2681
  ret void, !dbg !2682
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2683 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2686, !DIExpression(), !2687)
    #dbg_value(ptr %in, !2688, !DIExpression(), !2687)
    #dbg_value(i32 %inlen, !2689, !DIExpression(), !2687)
    #dbg_declare(ptr %s, !2690, !DIExpression(), !2691)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2692
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2693
    #dbg_value(i32 0, !2694, !DIExpression(), !2687)
  br label %for.cond, !dbg !2695

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2697
    #dbg_value(i32 %i.0, !2694, !DIExpression(), !2687)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2698
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2700

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2701
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2702
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2703
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2703
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2704
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2705
    #dbg_value(i32 %inc, !2694, !DIExpression(), !2687)
  br label %for.cond, !dbg !2706, !llvm.loop !2707

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2709
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2710 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2711, !DIExpression(), !2712)
    #dbg_value(ptr %in, !2713, !DIExpression(), !2712)
    #dbg_value(i32 %inlen, !2714, !DIExpression(), !2712)
    #dbg_declare(ptr %s, !2715, !DIExpression(), !2716)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2717
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2718
    #dbg_value(i32 0, !2719, !DIExpression(), !2712)
  br label %for.cond, !dbg !2720

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2722
    #dbg_value(i32 %i.0, !2719, !DIExpression(), !2712)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2723
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2725

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2726
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2727
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2728
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2728
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2729
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2730
    #dbg_value(i32 %inc, !2719, !DIExpression(), !2712)
  br label %for.cond, !dbg !2731, !llvm.loop !2732

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2734
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2735 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2745, !DIExpression(), !2746)
    #dbg_value(ptr %seed, !2747, !DIExpression(), !2746)
    #dbg_value(i8 %x, !2748, !DIExpression(), !2746)
    #dbg_value(i8 %y, !2749, !DIExpression(), !2746)
    #dbg_declare(ptr %extseed, !2750, !DIExpression(), !2754)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2755
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2756
  store i8 %x, ptr %arrayidx, align 1, !dbg !2757
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2758
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2759
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2760
  ret void, !dbg !2761
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2762 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2765, !DIExpression(), !2766)
    #dbg_value(i32 %outlen, !2767, !DIExpression(), !2766)
    #dbg_value(ptr %key, !2768, !DIExpression(), !2766)
    #dbg_value(i8 %nonce, !2769, !DIExpression(), !2766)
    #dbg_declare(ptr %extkey, !2770, !DIExpression(), !2774)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2775
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2776
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2777
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2778
  ret void, !dbg !2779
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2780 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2781, !DIExpression(), !2782)
    #dbg_value(ptr %key, !2783, !DIExpression(), !2782)
    #dbg_value(ptr %input, !2784, !DIExpression(), !2782)
    #dbg_declare(ptr %s, !2785, !DIExpression(), !2786)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2787
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2788
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2789
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2790
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2791
  ret void, !dbg !2792
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshl.i8(i8, i8, i8) #2

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
!91 = !DILocation(line: 55, column: 3, scope: !79)
!92 = !DILocation(line: 56, column: 3, scope: !79)
!93 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !57, file: !57, line: 76, type: !94, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!112 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!125 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !57, file: !57, line: 140, type: !126, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 12544, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 1568)
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
!156 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !157, file: !157, line: 165, type: !158, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!157 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!158 = !DISubroutineType(types: !159)
!159 = !{null, !160, !64, !9}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !163)
!162 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 16384, elements: !164)
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !163, file: !162, line: 9, baseType: !166, size: 16384)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !167, size: 16384, elements: !175)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !169)
!168 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !170)
!170 = !{!171}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !169, file: !168, line: 12, baseType: !172, size: 4096)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 256)
!175 = !{!176}
!176 = !DISubrange(count: 4)
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
!289 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !157, file: !157, line: 205, type: !290, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 65536, elements: !175)
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
!384 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !157, file: !157, line: 260, type: !385, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!488 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !157, file: !157, line: 314, type: !489, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!531 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !532, file: !532, line: 15, type: !533, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!532 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!533 = !DISubroutineType(types: !534)
!534 = !{null, !60, !535}
!535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !536, size: 32)
!536 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !537)
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !162, line: 10, baseType: !538)
!538 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !162, line: 8, size: 16384, elements: !539)
!539 = !{!540}
!540 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !538, file: !162, line: 9, baseType: !541, size: 16384)
!541 = !DICompositeType(tag: DW_TAG_array_type, baseType: !542, size: 16384, elements: !175)
!542 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !543)
!543 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !544)
!544 = !{!545}
!545 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !543, file: !168, line: 12, baseType: !172, size: 4096)
!546 = !DILocalVariable(name: "r", arg: 1, scope: !531, file: !532, line: 15, type: !60)
!547 = !DILocation(line: 0, scope: !531)
!548 = !DILocalVariable(name: "a", arg: 2, scope: !531, file: !532, line: 15, type: !535)
!549 = !DILocalVariable(name: "t", scope: !531, file: !532, line: 21, type: !550)
!550 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !551)
!551 = !{!552}
!552 = !DISubrange(count: 8)
!553 = !DILocation(line: 21, column: 12, scope: !531)
!554 = !DILocalVariable(name: "i", scope: !531, file: !532, line: 17, type: !42)
!555 = !DILocation(line: 22, column: 7, scope: !556)
!556 = distinct !DILexicalBlock(scope: !531, file: !532, line: 22, column: 3)
!557 = !DILocation(line: 22, scope: !556)
!558 = !DILocation(line: 22, column: 12, scope: !559)
!559 = distinct !DILexicalBlock(scope: !556, file: !532, line: 22, column: 3)
!560 = !DILocation(line: 22, column: 3, scope: !556)
!561 = !DILocation(line: 23, column: 5, scope: !562)
!562 = distinct !DILexicalBlock(scope: !563, file: !532, line: 23, column: 5)
!563 = distinct !DILexicalBlock(scope: !559, file: !532, line: 22, column: 26)
!564 = !DILocation(line: 23, scope: !562)
!565 = !DILocalVariable(name: "j", scope: !531, file: !532, line: 17, type: !42)
!566 = !DILocation(line: 23, column: 14, scope: !567)
!567 = distinct !DILexicalBlock(scope: !562, file: !532, line: 23, column: 5)
!568 = !DILocation(line: 24, column: 7, scope: !569)
!569 = distinct !DILexicalBlock(scope: !570, file: !532, line: 24, column: 7)
!570 = distinct !DILexicalBlock(scope: !567, file: !532, line: 23, column: 30)
!571 = !DILocation(line: 24, scope: !569)
!572 = !DILocalVariable(name: "k", scope: !531, file: !532, line: 17, type: !42)
!573 = !DILocation(line: 24, column: 16, scope: !574)
!574 = distinct !DILexicalBlock(scope: !569, file: !532, line: 24, column: 7)
!575 = !DILocation(line: 25, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !574, file: !532, line: 24, column: 24)
!577 = !DILocation(line: 25, column: 35, scope: !576)
!578 = !DILocation(line: 25, column: 37, scope: !576)
!579 = !DILocation(line: 26, column: 39, scope: !576)
!580 = !DILocation(line: 26, column: 9, scope: !576)
!581 = !DILocation(line: 26, column: 14, scope: !576)
!582 = !DILocation(line: 28, column: 14, scope: !576)
!583 = !DILocalVariable(name: "d0", scope: !531, file: !532, line: 18, type: !23)
!584 = !DILocation(line: 31, column: 12, scope: !576)
!585 = !DILocation(line: 32, column: 12, scope: !576)
!586 = !DILocation(line: 33, column: 16, scope: !576)
!587 = !DILocation(line: 33, column: 9, scope: !576)
!588 = !DILocation(line: 33, column: 14, scope: !576)
!589 = !DILocation(line: 24, column: 20, scope: !574)
!590 = !DILocation(line: 24, column: 7, scope: !574)
!591 = distinct !{!591, !568, !592, !235}
!592 = !DILocation(line: 34, column: 7, scope: !569)
!593 = !DILocation(line: 36, column: 16, scope: !570)
!594 = !DILocation(line: 36, column: 15, scope: !570)
!595 = !DILocation(line: 36, column: 13, scope: !570)
!596 = !DILocation(line: 37, column: 16, scope: !570)
!597 = !DILocation(line: 37, column: 21, scope: !570)
!598 = !DILocation(line: 37, column: 31, scope: !570)
!599 = !DILocation(line: 37, column: 36, scope: !570)
!600 = !DILocation(line: 37, column: 28, scope: !570)
!601 = !DILocation(line: 37, column: 7, scope: !570)
!602 = !DILocation(line: 37, column: 13, scope: !570)
!603 = !DILocation(line: 38, column: 16, scope: !570)
!604 = !DILocation(line: 38, column: 21, scope: !570)
!605 = !DILocation(line: 38, column: 31, scope: !570)
!606 = !DILocation(line: 38, column: 36, scope: !570)
!607 = !DILocation(line: 38, column: 28, scope: !570)
!608 = !DILocation(line: 38, column: 7, scope: !570)
!609 = !DILocation(line: 38, column: 13, scope: !570)
!610 = !DILocation(line: 39, column: 16, scope: !570)
!611 = !DILocation(line: 39, column: 21, scope: !570)
!612 = !DILocation(line: 39, column: 15, scope: !570)
!613 = !DILocation(line: 39, column: 7, scope: !570)
!614 = !DILocation(line: 39, column: 13, scope: !570)
!615 = !DILocation(line: 40, column: 16, scope: !570)
!616 = !DILocation(line: 40, column: 21, scope: !570)
!617 = !DILocation(line: 40, column: 31, scope: !570)
!618 = !DILocation(line: 40, column: 36, scope: !570)
!619 = !DILocation(line: 40, column: 28, scope: !570)
!620 = !DILocation(line: 40, column: 7, scope: !570)
!621 = !DILocation(line: 40, column: 13, scope: !570)
!622 = !DILocation(line: 41, column: 16, scope: !570)
!623 = !DILocation(line: 41, column: 21, scope: !570)
!624 = !DILocation(line: 41, column: 31, scope: !570)
!625 = !DILocation(line: 41, column: 36, scope: !570)
!626 = !DILocation(line: 41, column: 28, scope: !570)
!627 = !DILocation(line: 41, column: 7, scope: !570)
!628 = !DILocation(line: 41, column: 13, scope: !570)
!629 = !DILocation(line: 42, column: 16, scope: !570)
!630 = !DILocation(line: 42, column: 21, scope: !570)
!631 = !DILocation(line: 42, column: 31, scope: !570)
!632 = !DILocation(line: 42, column: 36, scope: !570)
!633 = !DILocation(line: 42, column: 28, scope: !570)
!634 = !DILocation(line: 42, column: 7, scope: !570)
!635 = !DILocation(line: 42, column: 13, scope: !570)
!636 = !DILocation(line: 43, column: 16, scope: !570)
!637 = !DILocation(line: 43, column: 21, scope: !570)
!638 = !DILocation(line: 43, column: 15, scope: !570)
!639 = !DILocation(line: 43, column: 7, scope: !570)
!640 = !DILocation(line: 43, column: 13, scope: !570)
!641 = !DILocation(line: 44, column: 16, scope: !570)
!642 = !DILocation(line: 44, column: 21, scope: !570)
!643 = !DILocation(line: 44, column: 31, scope: !570)
!644 = !DILocation(line: 44, column: 36, scope: !570)
!645 = !DILocation(line: 44, column: 28, scope: !570)
!646 = !DILocation(line: 44, column: 7, scope: !570)
!647 = !DILocation(line: 44, column: 13, scope: !570)
!648 = !DILocation(line: 45, column: 16, scope: !570)
!649 = !DILocation(line: 45, column: 21, scope: !570)
!650 = !DILocation(line: 45, column: 31, scope: !570)
!651 = !DILocation(line: 45, column: 36, scope: !570)
!652 = !DILocation(line: 45, column: 28, scope: !570)
!653 = !DILocation(line: 45, column: 7, scope: !570)
!654 = !DILocation(line: 45, column: 13, scope: !570)
!655 = !DILocation(line: 46, column: 16, scope: !570)
!656 = !DILocation(line: 46, column: 21, scope: !570)
!657 = !DILocation(line: 46, column: 15, scope: !570)
!658 = !DILocation(line: 46, column: 7, scope: !570)
!659 = !DILocation(line: 46, column: 13, scope: !570)
!660 = !DILocation(line: 47, column: 9, scope: !570)
!661 = !DILocation(line: 23, column: 26, scope: !567)
!662 = !DILocation(line: 23, column: 5, scope: !567)
!663 = distinct !{!663, !561, !664, !235}
!664 = !DILocation(line: 48, column: 5, scope: !562)
!665 = !DILocation(line: 22, column: 22, scope: !559)
!666 = !DILocation(line: 22, column: 3, scope: !559)
!667 = distinct !{!667, !560, !668, !235}
!668 = !DILocation(line: 49, column: 3, scope: !556)
!669 = !DILocation(line: 77, column: 1, scope: !531)
!670 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !532, file: !532, line: 89, type: !671, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!671 = !DISubroutineType(types: !672)
!672 = !{null, !673, !64}
!673 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !537, size: 32)
!674 = !DILocalVariable(name: "r", arg: 1, scope: !670, file: !532, line: 89, type: !673)
!675 = !DILocation(line: 0, scope: !670)
!676 = !DILocalVariable(name: "a", arg: 2, scope: !670, file: !532, line: 89, type: !64)
!677 = !DILocalVariable(name: "t", scope: !670, file: !532, line: 94, type: !550)
!678 = !DILocation(line: 94, column: 12, scope: !670)
!679 = !DILocalVariable(name: "i", scope: !670, file: !532, line: 91, type: !42)
!680 = !DILocation(line: 95, column: 7, scope: !681)
!681 = distinct !DILexicalBlock(scope: !670, file: !532, line: 95, column: 3)
!682 = !DILocation(line: 95, scope: !681)
!683 = !DILocation(line: 95, column: 12, scope: !684)
!684 = distinct !DILexicalBlock(scope: !681, file: !532, line: 95, column: 3)
!685 = !DILocation(line: 95, column: 3, scope: !681)
!686 = !DILocation(line: 96, column: 5, scope: !687)
!687 = distinct !DILexicalBlock(scope: !688, file: !532, line: 96, column: 5)
!688 = distinct !DILexicalBlock(scope: !684, file: !532, line: 95, column: 26)
!689 = !DILocation(line: 96, scope: !687)
!690 = !DILocalVariable(name: "j", scope: !670, file: !532, line: 91, type: !42)
!691 = !DILocation(line: 96, column: 14, scope: !692)
!692 = distinct !DILexicalBlock(scope: !687, file: !532, line: 96, column: 5)
!693 = !DILocation(line: 97, column: 15, scope: !694)
!694 = distinct !DILexicalBlock(scope: !692, file: !532, line: 96, column: 30)
!695 = !DILocation(line: 97, column: 39, scope: !694)
!696 = !DILocation(line: 97, column: 29, scope: !694)
!697 = !DILocation(line: 97, column: 45, scope: !694)
!698 = !DILocation(line: 97, column: 26, scope: !694)
!699 = !DILocation(line: 97, column: 12, scope: !694)
!700 = !DILocation(line: 98, column: 15, scope: !694)
!701 = !DILocation(line: 98, column: 20, scope: !694)
!702 = !DILocation(line: 98, column: 39, scope: !694)
!703 = !DILocation(line: 98, column: 29, scope: !694)
!704 = !DILocation(line: 98, column: 45, scope: !694)
!705 = !DILocation(line: 98, column: 26, scope: !694)
!706 = !DILocation(line: 98, column: 7, scope: !694)
!707 = !DILocation(line: 98, column: 12, scope: !694)
!708 = !DILocation(line: 99, column: 15, scope: !694)
!709 = !DILocation(line: 99, column: 20, scope: !694)
!710 = !DILocation(line: 99, column: 39, scope: !694)
!711 = !DILocation(line: 99, column: 29, scope: !694)
!712 = !DILocation(line: 99, column: 45, scope: !694)
!713 = !DILocation(line: 99, column: 26, scope: !694)
!714 = !DILocation(line: 99, column: 64, scope: !694)
!715 = !DILocation(line: 99, column: 54, scope: !694)
!716 = !DILocation(line: 99, column: 69, scope: !694)
!717 = !DILocation(line: 99, column: 51, scope: !694)
!718 = !DILocation(line: 99, column: 7, scope: !694)
!719 = !DILocation(line: 99, column: 12, scope: !694)
!720 = !DILocation(line: 100, column: 15, scope: !694)
!721 = !DILocation(line: 100, column: 20, scope: !694)
!722 = !DILocation(line: 100, column: 39, scope: !694)
!723 = !DILocation(line: 100, column: 29, scope: !694)
!724 = !DILocation(line: 100, column: 45, scope: !694)
!725 = !DILocation(line: 100, column: 26, scope: !694)
!726 = !DILocation(line: 100, column: 7, scope: !694)
!727 = !DILocation(line: 100, column: 12, scope: !694)
!728 = !DILocation(line: 101, column: 15, scope: !694)
!729 = !DILocation(line: 101, column: 20, scope: !694)
!730 = !DILocation(line: 101, column: 39, scope: !694)
!731 = !DILocation(line: 101, column: 29, scope: !694)
!732 = !DILocation(line: 101, column: 45, scope: !694)
!733 = !DILocation(line: 101, column: 26, scope: !694)
!734 = !DILocation(line: 101, column: 7, scope: !694)
!735 = !DILocation(line: 101, column: 12, scope: !694)
!736 = !DILocation(line: 102, column: 15, scope: !694)
!737 = !DILocation(line: 102, column: 20, scope: !694)
!738 = !DILocation(line: 102, column: 39, scope: !694)
!739 = !DILocation(line: 102, column: 29, scope: !694)
!740 = !DILocation(line: 102, column: 45, scope: !694)
!741 = !DILocation(line: 102, column: 26, scope: !694)
!742 = !DILocation(line: 102, column: 64, scope: !694)
!743 = !DILocation(line: 102, column: 54, scope: !694)
!744 = !DILocation(line: 102, column: 69, scope: !694)
!745 = !DILocation(line: 102, column: 51, scope: !694)
!746 = !DILocation(line: 102, column: 7, scope: !694)
!747 = !DILocation(line: 102, column: 12, scope: !694)
!748 = !DILocation(line: 103, column: 15, scope: !694)
!749 = !DILocation(line: 103, column: 20, scope: !694)
!750 = !DILocation(line: 103, column: 39, scope: !694)
!751 = !DILocation(line: 103, column: 29, scope: !694)
!752 = !DILocation(line: 103, column: 45, scope: !694)
!753 = !DILocation(line: 103, column: 26, scope: !694)
!754 = !DILocation(line: 103, column: 7, scope: !694)
!755 = !DILocation(line: 103, column: 12, scope: !694)
!756 = !DILocation(line: 104, column: 15, scope: !694)
!757 = !DILocation(line: 104, column: 20, scope: !694)
!758 = !DILocation(line: 104, column: 39, scope: !694)
!759 = !DILocation(line: 104, column: 29, scope: !694)
!760 = !DILocation(line: 104, column: 45, scope: !694)
!761 = !DILocation(line: 104, column: 26, scope: !694)
!762 = !DILocation(line: 104, column: 7, scope: !694)
!763 = !DILocation(line: 104, column: 12, scope: !694)
!764 = !DILocalVariable(name: "k", scope: !670, file: !532, line: 91, type: !42)
!765 = !DILocation(line: 107, column: 11, scope: !766)
!766 = distinct !DILexicalBlock(scope: !694, file: !532, line: 107, column: 7)
!767 = !DILocation(line: 107, scope: !766)
!768 = !DILocation(line: 107, column: 16, scope: !769)
!769 = distinct !DILexicalBlock(scope: !766, file: !532, line: 107, column: 7)
!770 = !DILocation(line: 107, column: 7, scope: !766)
!771 = !DILocation(line: 108, column: 47, scope: !769)
!772 = !DILocation(line: 108, column: 52, scope: !769)
!773 = !DILocation(line: 108, column: 60, scope: !769)
!774 = !DILocation(line: 108, column: 69, scope: !769)
!775 = !DILocation(line: 108, column: 77, scope: !769)
!776 = !DILocation(line: 108, column: 35, scope: !769)
!777 = !DILocation(line: 108, column: 9, scope: !769)
!778 = !DILocation(line: 108, column: 27, scope: !769)
!779 = !DILocation(line: 108, column: 29, scope: !769)
!780 = !DILocation(line: 108, column: 33, scope: !769)
!781 = !DILocation(line: 107, column: 20, scope: !769)
!782 = !DILocation(line: 107, column: 7, scope: !769)
!783 = distinct !{!783, !770, !784, !235}
!784 = !DILocation(line: 108, column: 80, scope: !766)
!785 = !DILocation(line: 105, column: 9, scope: !694)
!786 = !DILocation(line: 96, column: 26, scope: !692)
!787 = !DILocation(line: 96, column: 5, scope: !692)
!788 = distinct !{!788, !686, !789, !235}
!789 = !DILocation(line: 109, column: 5, scope: !687)
!790 = !DILocation(line: 95, column: 22, scope: !684)
!791 = !DILocation(line: 95, column: 3, scope: !684)
!792 = distinct !{!792, !685, !793, !235}
!793 = !DILocation(line: 110, column: 3, scope: !681)
!794 = !DILocation(line: 128, column: 1, scope: !670)
!795 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !532, file: !532, line: 139, type: !533, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!796 = !DILocalVariable(name: "r", arg: 1, scope: !795, file: !532, line: 139, type: !60)
!797 = !DILocation(line: 0, scope: !795)
!798 = !DILocalVariable(name: "a", arg: 2, scope: !795, file: !532, line: 139, type: !535)
!799 = !DILocalVariable(name: "i", scope: !795, file: !532, line: 141, type: !42)
!800 = !DILocation(line: 142, column: 7, scope: !801)
!801 = distinct !DILexicalBlock(scope: !795, file: !532, line: 142, column: 3)
!802 = !DILocation(line: 142, scope: !801)
!803 = !DILocation(line: 142, column: 12, scope: !804)
!804 = distinct !DILexicalBlock(scope: !801, file: !532, line: 142, column: 3)
!805 = !DILocation(line: 142, column: 3, scope: !801)
!806 = !DILocation(line: 143, column: 21, scope: !804)
!807 = !DILocation(line: 143, column: 19, scope: !804)
!808 = !DILocation(line: 143, column: 40, scope: !804)
!809 = !DILocation(line: 143, column: 5, scope: !804)
!810 = !DILocation(line: 142, column: 22, scope: !804)
!811 = !DILocation(line: 142, column: 3, scope: !804)
!812 = distinct !{!812, !805, !813, !235}
!813 = !DILocation(line: 143, column: 49, scope: !801)
!814 = !DILocation(line: 144, column: 1, scope: !795)
!815 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !532, file: !532, line: 156, type: !671, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!816 = !DILocalVariable(name: "r", arg: 1, scope: !815, file: !532, line: 156, type: !673)
!817 = !DILocation(line: 0, scope: !815)
!818 = !DILocalVariable(name: "a", arg: 2, scope: !815, file: !532, line: 156, type: !64)
!819 = !DILocalVariable(name: "i", scope: !815, file: !532, line: 158, type: !42)
!820 = !DILocation(line: 159, column: 7, scope: !821)
!821 = distinct !DILexicalBlock(scope: !815, file: !532, line: 159, column: 3)
!822 = !DILocation(line: 159, scope: !821)
!823 = !DILocation(line: 159, column: 12, scope: !824)
!824 = distinct !DILexicalBlock(scope: !821, file: !532, line: 159, column: 3)
!825 = !DILocation(line: 159, column: 3, scope: !821)
!826 = !DILocation(line: 160, column: 21, scope: !824)
!827 = !DILocation(line: 160, column: 35, scope: !824)
!828 = !DILocation(line: 160, column: 33, scope: !824)
!829 = !DILocation(line: 160, column: 5, scope: !824)
!830 = !DILocation(line: 159, column: 22, scope: !824)
!831 = !DILocation(line: 159, column: 3, scope: !824)
!832 = distinct !{!832, !825, !833, !235}
!833 = !DILocation(line: 160, column: 51, scope: !821)
!834 = !DILocation(line: 161, column: 1, scope: !815)
!835 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !532, file: !532, line: 170, type: !836, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!836 = !DISubroutineType(types: !837)
!837 = !{null, !673}
!838 = !DILocalVariable(name: "r", arg: 1, scope: !835, file: !532, line: 170, type: !673)
!839 = !DILocation(line: 0, scope: !835)
!840 = !DILocalVariable(name: "i", scope: !835, file: !532, line: 172, type: !42)
!841 = !DILocation(line: 173, column: 7, scope: !842)
!842 = distinct !DILexicalBlock(scope: !835, file: !532, line: 173, column: 3)
!843 = !DILocation(line: 173, scope: !842)
!844 = !DILocation(line: 173, column: 12, scope: !845)
!845 = distinct !DILexicalBlock(scope: !842, file: !532, line: 173, column: 3)
!846 = !DILocation(line: 173, column: 3, scope: !842)
!847 = !DILocation(line: 174, column: 15, scope: !845)
!848 = !DILocation(line: 174, column: 5, scope: !845)
!849 = !DILocation(line: 173, column: 22, scope: !845)
!850 = !DILocation(line: 173, column: 3, scope: !845)
!851 = distinct !{!851, !846, !852, !235}
!852 = !DILocation(line: 174, column: 24, scope: !842)
!853 = !DILocation(line: 175, column: 1, scope: !835)
!854 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !532, file: !532, line: 185, type: !836, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!855 = !DILocalVariable(name: "r", arg: 1, scope: !854, file: !532, line: 185, type: !673)
!856 = !DILocation(line: 0, scope: !854)
!857 = !DILocalVariable(name: "i", scope: !854, file: !532, line: 187, type: !42)
!858 = !DILocation(line: 188, column: 7, scope: !859)
!859 = distinct !DILexicalBlock(scope: !854, file: !532, line: 188, column: 3)
!860 = !DILocation(line: 188, scope: !859)
!861 = !DILocation(line: 188, column: 12, scope: !862)
!862 = distinct !DILexicalBlock(scope: !859, file: !532, line: 188, column: 3)
!863 = !DILocation(line: 188, column: 3, scope: !859)
!864 = !DILocation(line: 189, column: 25, scope: !862)
!865 = !DILocation(line: 189, column: 5, scope: !862)
!866 = !DILocation(line: 188, column: 22, scope: !862)
!867 = !DILocation(line: 188, column: 3, scope: !862)
!868 = distinct !{!868, !863, !869, !235}
!869 = !DILocation(line: 189, column: 34, scope: !859)
!870 = !DILocation(line: 190, column: 1, scope: !854)
!871 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !532, file: !532, line: 202, type: !872, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!872 = !DISubroutineType(types: !873)
!873 = !{null, !874, !535, !535}
!874 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !542, size: 32)
!875 = !DILocalVariable(name: "r", arg: 1, scope: !871, file: !532, line: 202, type: !874)
!876 = !DILocation(line: 0, scope: !871)
!877 = !DILocalVariable(name: "a", arg: 2, scope: !871, file: !532, line: 202, type: !535)
!878 = !DILocalVariable(name: "b", arg: 3, scope: !871, file: !532, line: 202, type: !535)
!879 = !DILocalVariable(name: "t", scope: !871, file: !532, line: 205, type: !542)
!880 = !DILocation(line: 205, column: 8, scope: !871)
!881 = !DILocation(line: 207, column: 3, scope: !871)
!882 = !DILocalVariable(name: "i", scope: !871, file: !532, line: 204, type: !42)
!883 = !DILocation(line: 208, column: 7, scope: !884)
!884 = distinct !DILexicalBlock(scope: !871, file: !532, line: 208, column: 3)
!885 = !DILocation(line: 208, scope: !884)
!886 = !DILocation(line: 208, column: 12, scope: !887)
!887 = distinct !DILexicalBlock(scope: !884, file: !532, line: 208, column: 3)
!888 = !DILocation(line: 208, column: 3, scope: !884)
!889 = !DILocation(line: 209, column: 34, scope: !890)
!890 = distinct !DILexicalBlock(scope: !887, file: !532, line: 208, column: 26)
!891 = !DILocation(line: 209, column: 46, scope: !890)
!892 = !DILocation(line: 209, column: 5, scope: !890)
!893 = !DILocation(line: 210, column: 5, scope: !890)
!894 = !DILocation(line: 208, column: 22, scope: !887)
!895 = !DILocation(line: 208, column: 3, scope: !887)
!896 = distinct !{!896, !888, !897, !235}
!897 = !DILocation(line: 211, column: 3, scope: !884)
!898 = !DILocation(line: 213, column: 3, scope: !871)
!899 = !DILocation(line: 214, column: 1, scope: !871)
!900 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !532, file: !532, line: 225, type: !836, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!901 = !DILocalVariable(name: "r", arg: 1, scope: !900, file: !532, line: 225, type: !673)
!902 = !DILocation(line: 0, scope: !900)
!903 = !DILocalVariable(name: "i", scope: !900, file: !532, line: 227, type: !42)
!904 = !DILocation(line: 228, column: 7, scope: !905)
!905 = distinct !DILexicalBlock(scope: !900, file: !532, line: 228, column: 3)
!906 = !DILocation(line: 228, scope: !905)
!907 = !DILocation(line: 228, column: 12, scope: !908)
!908 = distinct !DILexicalBlock(scope: !905, file: !532, line: 228, column: 3)
!909 = !DILocation(line: 228, column: 3, scope: !905)
!910 = !DILocation(line: 229, column: 18, scope: !908)
!911 = !DILocation(line: 229, column: 5, scope: !908)
!912 = !DILocation(line: 228, column: 22, scope: !908)
!913 = !DILocation(line: 228, column: 3, scope: !908)
!914 = distinct !{!914, !909, !915, !235}
!915 = !DILocation(line: 229, column: 27, scope: !905)
!916 = !DILocation(line: 230, column: 1, scope: !900)
!917 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !532, file: !532, line: 241, type: !918, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!918 = !DISubroutineType(types: !919)
!919 = !{null, !673, !535, !535}
!920 = !DILocalVariable(name: "r", arg: 1, scope: !917, file: !532, line: 241, type: !673)
!921 = !DILocation(line: 0, scope: !917)
!922 = !DILocalVariable(name: "a", arg: 2, scope: !917, file: !532, line: 241, type: !535)
!923 = !DILocalVariable(name: "b", arg: 3, scope: !917, file: !532, line: 241, type: !535)
!924 = !DILocalVariable(name: "i", scope: !917, file: !532, line: 243, type: !42)
!925 = !DILocation(line: 244, column: 7, scope: !926)
!926 = distinct !DILexicalBlock(scope: !917, file: !532, line: 244, column: 3)
!927 = !DILocation(line: 244, scope: !926)
!928 = !DILocation(line: 244, column: 12, scope: !929)
!929 = distinct !DILexicalBlock(scope: !926, file: !532, line: 244, column: 3)
!930 = !DILocation(line: 244, column: 3, scope: !926)
!931 = !DILocation(line: 245, column: 15, scope: !929)
!932 = !DILocation(line: 245, column: 27, scope: !929)
!933 = !DILocation(line: 245, column: 39, scope: !929)
!934 = !DILocation(line: 245, column: 5, scope: !929)
!935 = !DILocation(line: 244, column: 22, scope: !929)
!936 = !DILocation(line: 244, column: 3, scope: !929)
!937 = distinct !{!937, !930, !938, !235}
!938 = !DILocation(line: 245, column: 48, scope: !926)
!939 = !DILocation(line: 246, column: 1, scope: !917)
!940 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !941, file: !941, line: 19, type: !942, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!941 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!942 = !DISubroutineType(types: !943)
!943 = !{null, !60, !944}
!944 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !945, size: 32)
!945 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !946)
!946 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !947)
!947 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !948)
!948 = !{!949}
!949 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !947, file: !168, line: 12, baseType: !172, size: 4096)
!950 = !DILocalVariable(name: "r", arg: 1, scope: !940, file: !941, line: 19, type: !60)
!951 = !DILocation(line: 0, scope: !940)
!952 = !DILocalVariable(name: "a", arg: 2, scope: !940, file: !941, line: 19, type: !944)
!953 = !DILocalVariable(name: "t", scope: !940, file: !941, line: 24, type: !954)
!954 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !551)
!955 = !DILocation(line: 24, column: 11, scope: !940)
!956 = !DILocalVariable(name: "i", scope: !940, file: !941, line: 21, type: !42)
!957 = !DILocation(line: 48, column: 7, scope: !958)
!958 = distinct !DILexicalBlock(scope: !940, file: !941, line: 48, column: 3)
!959 = !DILocation(line: 48, scope: !958)
!960 = !DILocation(line: 48, column: 12, scope: !961)
!961 = distinct !DILexicalBlock(scope: !958, file: !941, line: 48, column: 3)
!962 = !DILocation(line: 48, column: 3, scope: !958)
!963 = !DILocation(line: 49, column: 5, scope: !964)
!964 = distinct !DILexicalBlock(scope: !965, file: !941, line: 49, column: 5)
!965 = distinct !DILexicalBlock(scope: !961, file: !941, line: 48, column: 28)
!966 = !DILocation(line: 49, scope: !964)
!967 = !DILocalVariable(name: "j", scope: !940, file: !941, line: 21, type: !42)
!968 = !DILocation(line: 49, column: 14, scope: !969)
!969 = distinct !DILexicalBlock(scope: !964, file: !941, line: 49, column: 5)
!970 = !DILocation(line: 51, column: 23, scope: !971)
!971 = distinct !DILexicalBlock(scope: !969, file: !941, line: 49, column: 22)
!972 = !DILocation(line: 51, column: 25, scope: !971)
!973 = !DILocation(line: 51, column: 12, scope: !971)
!974 = !DILocalVariable(name: "u", scope: !940, file: !941, line: 22, type: !14)
!975 = !DILocation(line: 52, column: 22, scope: !971)
!976 = !DILocation(line: 52, column: 9, scope: !971)
!977 = !DILocation(line: 54, column: 12, scope: !971)
!978 = !DILocalVariable(name: "d0", scope: !940, file: !941, line: 23, type: !40)
!979 = !DILocation(line: 56, column: 10, scope: !971)
!980 = !DILocation(line: 57, column: 10, scope: !971)
!981 = !DILocation(line: 58, column: 14, scope: !971)
!982 = !DILocation(line: 58, column: 7, scope: !971)
!983 = !DILocation(line: 58, column: 12, scope: !971)
!984 = !DILocation(line: 49, column: 18, scope: !969)
!985 = !DILocation(line: 49, column: 5, scope: !969)
!986 = distinct !{!986, !963, !987, !235}
!987 = !DILocation(line: 59, column: 5, scope: !964)
!988 = !DILocation(line: 61, column: 13, scope: !965)
!989 = !DILocation(line: 61, column: 27, scope: !965)
!990 = !DILocation(line: 61, column: 32, scope: !965)
!991 = !DILocation(line: 61, column: 24, scope: !965)
!992 = !DILocation(line: 61, column: 10, scope: !965)
!993 = !DILocation(line: 62, column: 18, scope: !965)
!994 = !DILocation(line: 62, column: 27, scope: !965)
!995 = !DILocation(line: 62, column: 32, scope: !965)
!996 = !DILocation(line: 62, column: 24, scope: !965)
!997 = !DILocation(line: 62, column: 41, scope: !965)
!998 = !DILocation(line: 62, column: 46, scope: !965)
!999 = !DILocation(line: 62, column: 38, scope: !965)
!1000 = !DILocation(line: 62, column: 5, scope: !965)
!1001 = !DILocation(line: 62, column: 10, scope: !965)
!1002 = !DILocation(line: 63, column: 18, scope: !965)
!1003 = !DILocation(line: 63, column: 27, scope: !965)
!1004 = !DILocation(line: 63, column: 32, scope: !965)
!1005 = !DILocation(line: 63, column: 24, scope: !965)
!1006 = !DILocation(line: 63, column: 5, scope: !965)
!1007 = !DILocation(line: 63, column: 10, scope: !965)
!1008 = !DILocation(line: 64, column: 18, scope: !965)
!1009 = !DILocation(line: 64, column: 27, scope: !965)
!1010 = !DILocation(line: 64, column: 32, scope: !965)
!1011 = !DILocation(line: 64, column: 24, scope: !965)
!1012 = !DILocation(line: 64, column: 41, scope: !965)
!1013 = !DILocation(line: 64, column: 46, scope: !965)
!1014 = !DILocation(line: 64, column: 38, scope: !965)
!1015 = !DILocation(line: 64, column: 5, scope: !965)
!1016 = !DILocation(line: 64, column: 10, scope: !965)
!1017 = !DILocation(line: 65, column: 18, scope: !965)
!1018 = !DILocation(line: 65, column: 27, scope: !965)
!1019 = !DILocation(line: 65, column: 32, scope: !965)
!1020 = !DILocation(line: 65, column: 24, scope: !965)
!1021 = !DILocation(line: 65, column: 5, scope: !965)
!1022 = !DILocation(line: 65, column: 10, scope: !965)
!1023 = !DILocation(line: 66, column: 7, scope: !965)
!1024 = !DILocation(line: 48, column: 24, scope: !961)
!1025 = !DILocation(line: 48, column: 3, scope: !961)
!1026 = distinct !{!1026, !962, !1027, !235}
!1027 = !DILocation(line: 67, column: 3, scope: !958)
!1028 = !DILocation(line: 71, column: 1, scope: !940)
!1029 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !941, file: !941, line: 83, type: !1030, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{null, !1032, !64}
!1032 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !946, size: 32)
!1033 = !DILocalVariable(name: "r", arg: 1, scope: !1029, file: !941, line: 83, type: !1032)
!1034 = !DILocation(line: 0, scope: !1029)
!1035 = !DILocalVariable(name: "a", arg: 2, scope: !1029, file: !941, line: 83, type: !64)
!1036 = !DILocalVariable(name: "t", scope: !1029, file: !941, line: 95, type: !954)
!1037 = !DILocation(line: 95, column: 11, scope: !1029)
!1038 = !DILocalVariable(name: "i", scope: !1029, file: !941, line: 85, type: !42)
!1039 = !DILocation(line: 96, column: 7, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1029, file: !941, line: 96, column: 3)
!1041 = !DILocation(line: 96, scope: !1040)
!1042 = !DILocation(line: 96, column: 12, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1040, file: !941, line: 96, column: 3)
!1044 = !DILocation(line: 96, column: 3, scope: !1040)
!1045 = !DILocation(line: 97, column: 13, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1043, file: !941, line: 96, column: 28)
!1047 = !DILocation(line: 97, column: 10, scope: !1046)
!1048 = !DILocation(line: 98, column: 27, scope: !1046)
!1049 = !DILocation(line: 98, column: 24, scope: !1046)
!1050 = !DILocation(line: 98, column: 5, scope: !1046)
!1051 = !DILocation(line: 98, column: 10, scope: !1046)
!1052 = !DILocation(line: 99, column: 18, scope: !1046)
!1053 = !DILocation(line: 99, column: 5, scope: !1046)
!1054 = !DILocation(line: 99, column: 10, scope: !1046)
!1055 = !DILocation(line: 100, column: 13, scope: !1046)
!1056 = !DILocation(line: 100, column: 27, scope: !1046)
!1057 = !DILocation(line: 100, column: 24, scope: !1046)
!1058 = !DILocation(line: 100, column: 5, scope: !1046)
!1059 = !DILocation(line: 100, column: 10, scope: !1046)
!1060 = !DILocation(line: 101, column: 27, scope: !1046)
!1061 = !DILocation(line: 101, column: 24, scope: !1046)
!1062 = !DILocation(line: 101, column: 5, scope: !1046)
!1063 = !DILocation(line: 101, column: 10, scope: !1046)
!1064 = !DILocation(line: 102, column: 18, scope: !1046)
!1065 = !DILocation(line: 102, column: 5, scope: !1046)
!1066 = !DILocation(line: 102, column: 10, scope: !1046)
!1067 = !DILocation(line: 103, column: 13, scope: !1046)
!1068 = !DILocation(line: 103, column: 27, scope: !1046)
!1069 = !DILocation(line: 103, column: 24, scope: !1046)
!1070 = !DILocation(line: 103, column: 5, scope: !1046)
!1071 = !DILocation(line: 103, column: 10, scope: !1046)
!1072 = !DILocation(line: 104, column: 18, scope: !1046)
!1073 = !DILocation(line: 104, column: 5, scope: !1046)
!1074 = !DILocation(line: 104, column: 10, scope: !1046)
!1075 = !DILocalVariable(name: "j", scope: !1029, file: !941, line: 94, type: !42)
!1076 = !DILocation(line: 107, column: 9, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1046, file: !941, line: 107, column: 5)
!1078 = !DILocation(line: 107, scope: !1077)
!1079 = !DILocation(line: 107, column: 14, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1077, file: !941, line: 107, column: 5)
!1081 = !DILocation(line: 107, column: 5, scope: !1077)
!1082 = !DILocation(line: 108, column: 38, scope: !1080)
!1083 = !DILocation(line: 108, column: 43, scope: !1080)
!1084 = !DILocation(line: 108, column: 48, scope: !1080)
!1085 = !DILocation(line: 108, column: 57, scope: !1080)
!1086 = !DILocation(line: 108, column: 63, scope: !1080)
!1087 = !DILocation(line: 108, column: 26, scope: !1080)
!1088 = !DILocation(line: 108, column: 18, scope: !1080)
!1089 = !DILocation(line: 108, column: 20, scope: !1080)
!1090 = !DILocation(line: 108, column: 7, scope: !1080)
!1091 = !DILocation(line: 108, column: 24, scope: !1080)
!1092 = !DILocation(line: 107, column: 18, scope: !1080)
!1093 = !DILocation(line: 107, column: 5, scope: !1080)
!1094 = distinct !{!1094, !1081, !1095, !235}
!1095 = !DILocation(line: 108, column: 66, scope: !1077)
!1096 = !DILocation(line: 105, column: 7, scope: !1046)
!1097 = !DILocation(line: 96, column: 24, scope: !1043)
!1098 = !DILocation(line: 96, column: 3, scope: !1043)
!1099 = distinct !{!1099, !1044, !1100, !235}
!1100 = !DILocation(line: 109, column: 3, scope: !1040)
!1101 = !DILocation(line: 113, column: 1, scope: !1029)
!1102 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !941, file: !941, line: 124, type: !942, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1103 = !DILocalVariable(name: "r", arg: 1, scope: !1102, file: !941, line: 124, type: !60)
!1104 = !DILocation(line: 0, scope: !1102)
!1105 = !DILocalVariable(name: "a", arg: 2, scope: !1102, file: !941, line: 124, type: !944)
!1106 = !DILocalVariable(name: "i", scope: !1102, file: !941, line: 126, type: !42)
!1107 = !DILocation(line: 129, column: 7, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1102, file: !941, line: 129, column: 3)
!1109 = !DILocation(line: 129, scope: !1108)
!1110 = !DILocation(line: 129, column: 12, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1108, file: !941, line: 129, column: 3)
!1112 = !DILocation(line: 129, column: 3, scope: !1108)
!1113 = !DILocation(line: 131, column: 22, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1111, file: !941, line: 129, column: 28)
!1115 = !DILocation(line: 131, column: 11, scope: !1114)
!1116 = !DILocalVariable(name: "t0", scope: !1102, file: !941, line: 127, type: !35)
!1117 = !DILocation(line: 132, column: 31, scope: !1114)
!1118 = !DILocation(line: 132, column: 8, scope: !1114)
!1119 = !DILocation(line: 133, column: 21, scope: !1114)
!1120 = !DILocation(line: 133, column: 23, scope: !1114)
!1121 = !DILocation(line: 133, column: 10, scope: !1114)
!1122 = !DILocalVariable(name: "t1", scope: !1102, file: !941, line: 127, type: !35)
!1123 = !DILocation(line: 134, column: 31, scope: !1114)
!1124 = !DILocation(line: 134, column: 8, scope: !1114)
!1125 = !DILocation(line: 135, column: 16, scope: !1114)
!1126 = !DILocation(line: 135, column: 8, scope: !1114)
!1127 = !DILocation(line: 135, column: 5, scope: !1114)
!1128 = !DILocation(line: 135, column: 14, scope: !1114)
!1129 = !DILocation(line: 136, column: 20, scope: !1114)
!1130 = !DILocation(line: 136, column: 29, scope: !1114)
!1131 = !DILocation(line: 136, column: 32, scope: !1114)
!1132 = !DILocation(line: 136, column: 26, scope: !1114)
!1133 = !DILocation(line: 136, column: 8, scope: !1114)
!1134 = !DILocation(line: 136, column: 5, scope: !1114)
!1135 = !DILocation(line: 136, column: 14, scope: !1114)
!1136 = !DILocation(line: 137, column: 20, scope: !1114)
!1137 = !DILocation(line: 137, column: 16, scope: !1114)
!1138 = !DILocation(line: 137, column: 8, scope: !1114)
!1139 = !DILocation(line: 137, column: 5, scope: !1114)
!1140 = !DILocation(line: 137, column: 14, scope: !1114)
!1141 = !DILocation(line: 129, column: 24, scope: !1111)
!1142 = !DILocation(line: 129, column: 3, scope: !1111)
!1143 = distinct !{!1143, !1112, !1144, !235}
!1144 = !DILocation(line: 138, column: 3, scope: !1108)
!1145 = !DILocation(line: 139, column: 1, scope: !1102)
!1146 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !941, file: !941, line: 151, type: !1030, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1147 = !DILocalVariable(name: "r", arg: 1, scope: !1146, file: !941, line: 151, type: !1032)
!1148 = !DILocation(line: 0, scope: !1146)
!1149 = !DILocalVariable(name: "a", arg: 2, scope: !1146, file: !941, line: 151, type: !64)
!1150 = !DILocalVariable(name: "i", scope: !1146, file: !941, line: 153, type: !42)
!1151 = !DILocation(line: 154, column: 7, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1146, file: !941, line: 154, column: 3)
!1153 = !DILocation(line: 154, scope: !1152)
!1154 = !DILocation(line: 154, column: 12, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1152, file: !941, line: 154, column: 3)
!1156 = !DILocation(line: 154, column: 3, scope: !1152)
!1157 = !DILocation(line: 155, column: 29, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1155, file: !941, line: 154, column: 28)
!1159 = !DILocation(line: 155, column: 26, scope: !1158)
!1160 = !DILocation(line: 155, column: 57, scope: !1158)
!1161 = !DILocation(line: 155, column: 54, scope: !1158)
!1162 = !DILocation(line: 155, column: 44, scope: !1158)
!1163 = !DILocation(line: 155, column: 63, scope: !1158)
!1164 = !DILocation(line: 155, column: 70, scope: !1158)
!1165 = !DILocation(line: 155, column: 16, scope: !1158)
!1166 = !DILocation(line: 155, column: 5, scope: !1158)
!1167 = !DILocation(line: 155, column: 22, scope: !1158)
!1168 = !DILocation(line: 156, column: 29, scope: !1158)
!1169 = !DILocation(line: 156, column: 26, scope: !1158)
!1170 = !DILocation(line: 156, column: 35, scope: !1158)
!1171 = !DILocation(line: 156, column: 57, scope: !1158)
!1172 = !DILocation(line: 156, column: 54, scope: !1158)
!1173 = !DILocation(line: 156, column: 44, scope: !1158)
!1174 = !DILocation(line: 156, column: 63, scope: !1158)
!1175 = !DILocation(line: 156, column: 41, scope: !1158)
!1176 = !DILocation(line: 156, column: 16, scope: !1158)
!1177 = !DILocation(line: 156, column: 18, scope: !1158)
!1178 = !DILocation(line: 156, column: 5, scope: !1158)
!1179 = !DILocation(line: 156, column: 22, scope: !1158)
!1180 = !DILocation(line: 154, column: 24, scope: !1155)
!1181 = !DILocation(line: 154, column: 3, scope: !1155)
!1182 = distinct !{!1182, !1156, !1183, !235}
!1183 = !DILocation(line: 157, column: 3, scope: !1152)
!1184 = !DILocation(line: 158, column: 1, scope: !1146)
!1185 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !941, file: !941, line: 168, type: !1030, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1186 = !DILocalVariable(name: "r", arg: 1, scope: !1185, file: !941, line: 168, type: !1032)
!1187 = !DILocation(line: 0, scope: !1185)
!1188 = !DILocalVariable(name: "msg", arg: 2, scope: !1185, file: !941, line: 168, type: !64)
!1189 = !DILocalVariable(name: "i", scope: !1185, file: !941, line: 170, type: !42)
!1190 = !DILocation(line: 176, column: 7, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1185, file: !941, line: 176, column: 3)
!1192 = !DILocation(line: 176, scope: !1191)
!1193 = !DILocation(line: 176, column: 12, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1191, file: !941, line: 176, column: 3)
!1195 = !DILocation(line: 176, column: 3, scope: !1191)
!1196 = !DILocation(line: 177, column: 5, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1198, file: !941, line: 177, column: 5)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !941, line: 176, column: 28)
!1199 = !DILocation(line: 177, scope: !1197)
!1200 = !DILocalVariable(name: "j", scope: !1185, file: !941, line: 170, type: !42)
!1201 = !DILocation(line: 177, column: 14, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1197, file: !941, line: 177, column: 5)
!1203 = !DILocation(line: 178, column: 18, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1202, file: !941, line: 177, column: 22)
!1205 = !DILocation(line: 178, column: 20, scope: !1204)
!1206 = !DILocation(line: 178, column: 7, scope: !1204)
!1207 = !DILocation(line: 178, column: 24, scope: !1204)
!1208 = !DILocation(line: 179, column: 27, scope: !1204)
!1209 = !DILocation(line: 179, column: 31, scope: !1204)
!1210 = !DILocation(line: 179, column: 53, scope: !1204)
!1211 = !DILocation(line: 179, column: 60, scope: !1204)
!1212 = !DILocation(line: 179, column: 52, scope: !1204)
!1213 = !DILocation(line: 179, column: 7, scope: !1204)
!1214 = !DILocation(line: 177, column: 18, scope: !1202)
!1215 = !DILocation(line: 177, column: 5, scope: !1202)
!1216 = distinct !{!1216, !1196, !1217, !235}
!1217 = !DILocation(line: 180, column: 5, scope: !1197)
!1218 = !DILocation(line: 176, column: 24, scope: !1194)
!1219 = !DILocation(line: 176, column: 3, scope: !1194)
!1220 = distinct !{!1220, !1195, !1221, !235}
!1221 = !DILocation(line: 181, column: 3, scope: !1191)
!1222 = !DILocation(line: 182, column: 1, scope: !1185)
!1223 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !941, file: !941, line: 192, type: !942, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1224 = !DILocalVariable(name: "msg", arg: 1, scope: !1223, file: !941, line: 192, type: !60)
!1225 = !DILocation(line: 0, scope: !1223)
!1226 = !DILocalVariable(name: "a", arg: 2, scope: !1223, file: !941, line: 192, type: !944)
!1227 = !DILocalVariable(name: "i", scope: !1223, file: !941, line: 194, type: !42)
!1228 = !DILocation(line: 197, column: 7, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1223, file: !941, line: 197, column: 3)
!1230 = !DILocation(line: 197, scope: !1229)
!1231 = !DILocation(line: 197, column: 12, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1229, file: !941, line: 197, column: 3)
!1233 = !DILocation(line: 197, column: 3, scope: !1229)
!1234 = !DILocation(line: 198, column: 5, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1232, file: !941, line: 197, column: 28)
!1236 = !DILocation(line: 198, column: 12, scope: !1235)
!1237 = !DILocalVariable(name: "j", scope: !1223, file: !941, line: 194, type: !42)
!1238 = !DILocation(line: 199, column: 9, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1235, file: !941, line: 199, column: 5)
!1240 = !DILocation(line: 199, scope: !1239)
!1241 = !DILocation(line: 199, column: 14, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1239, file: !941, line: 199, column: 5)
!1243 = !DILocation(line: 199, column: 5, scope: !1239)
!1244 = !DILocation(line: 200, column: 23, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !941, line: 199, column: 22)
!1246 = !DILocation(line: 200, column: 25, scope: !1245)
!1247 = !DILocation(line: 200, column: 12, scope: !1245)
!1248 = !DILocalVariable(name: "t", scope: !1223, file: !941, line: 195, type: !40)
!1249 = !DILocation(line: 205, column: 9, scope: !1245)
!1250 = !DILocation(line: 206, column: 9, scope: !1245)
!1251 = !DILocation(line: 207, column: 9, scope: !1245)
!1252 = !DILocation(line: 208, column: 19, scope: !1245)
!1253 = !DILocation(line: 208, column: 7, scope: !1245)
!1254 = !DILocation(line: 208, column: 14, scope: !1245)
!1255 = !DILocation(line: 199, column: 18, scope: !1242)
!1256 = !DILocation(line: 199, column: 5, scope: !1242)
!1257 = distinct !{!1257, !1243, !1258, !235}
!1258 = !DILocation(line: 209, column: 5, scope: !1239)
!1259 = !DILocation(line: 197, column: 24, scope: !1232)
!1260 = !DILocation(line: 197, column: 3, scope: !1232)
!1261 = distinct !{!1261, !1233, !1262, !235}
!1262 = !DILocation(line: 210, column: 3, scope: !1229)
!1263 = !DILocation(line: 211, column: 1, scope: !1223)
!1264 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !941, file: !941, line: 225, type: !1265, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1265 = !DISubroutineType(types: !1266)
!1266 = !{null, !1032, !64, !61}
!1267 = !DILocalVariable(name: "r", arg: 1, scope: !1264, file: !941, line: 225, type: !1032)
!1268 = !DILocation(line: 0, scope: !1264)
!1269 = !DILocalVariable(name: "seed", arg: 2, scope: !1264, file: !941, line: 225, type: !64)
!1270 = !DILocalVariable(name: "nonce", arg: 3, scope: !1264, file: !941, line: 225, type: !61)
!1271 = !DILocalVariable(name: "buf", scope: !1264, file: !941, line: 227, type: !1272)
!1272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1273 = !DILocation(line: 227, column: 11, scope: !1264)
!1274 = !DILocation(line: 228, column: 3, scope: !1264)
!1275 = !DILocation(line: 229, column: 3, scope: !1264)
!1276 = !DILocation(line: 230, column: 1, scope: !1264)
!1277 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !941, file: !941, line: 244, type: !1265, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1278 = !DILocalVariable(name: "r", arg: 1, scope: !1277, file: !941, line: 244, type: !1032)
!1279 = !DILocation(line: 0, scope: !1277)
!1280 = !DILocalVariable(name: "seed", arg: 2, scope: !1277, file: !941, line: 244, type: !64)
!1281 = !DILocalVariable(name: "nonce", arg: 3, scope: !1277, file: !941, line: 244, type: !61)
!1282 = !DILocalVariable(name: "buf", scope: !1277, file: !941, line: 246, type: !1272)
!1283 = !DILocation(line: 246, column: 11, scope: !1277)
!1284 = !DILocation(line: 247, column: 3, scope: !1277)
!1285 = !DILocation(line: 248, column: 3, scope: !1277)
!1286 = !DILocation(line: 249, column: 1, scope: !1277)
!1287 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !941, file: !941, line: 261, type: !1288, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1288 = !DISubroutineType(types: !1289)
!1289 = !{null, !1032}
!1290 = !DILocalVariable(name: "r", arg: 1, scope: !1287, file: !941, line: 261, type: !1032)
!1291 = !DILocation(line: 0, scope: !1287)
!1292 = !DILocation(line: 263, column: 3, scope: !1287)
!1293 = !DILocation(line: 264, column: 3, scope: !1287)
!1294 = !DILocation(line: 265, column: 1, scope: !1287)
!1295 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !941, file: !941, line: 323, type: !1288, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1296 = !DILocalVariable(name: "r", arg: 1, scope: !1295, file: !941, line: 323, type: !1032)
!1297 = !DILocation(line: 0, scope: !1295)
!1298 = !DILocalVariable(name: "i", scope: !1295, file: !941, line: 325, type: !42)
!1299 = !DILocation(line: 326, column: 7, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1295, file: !941, line: 326, column: 3)
!1301 = !DILocation(line: 326, scope: !1300)
!1302 = !DILocation(line: 326, column: 12, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1300, file: !941, line: 326, column: 3)
!1304 = !DILocation(line: 326, column: 3, scope: !1300)
!1305 = !DILocation(line: 327, column: 35, scope: !1303)
!1306 = !DILocation(line: 327, column: 20, scope: !1303)
!1307 = !DILocation(line: 327, column: 5, scope: !1303)
!1308 = !DILocation(line: 327, column: 18, scope: !1303)
!1309 = !DILocation(line: 326, column: 22, scope: !1303)
!1310 = !DILocation(line: 326, column: 3, scope: !1303)
!1311 = distinct !{!1311, !1304, !1312, !235}
!1312 = !DILocation(line: 327, column: 47, scope: !1300)
!1313 = !DILocation(line: 328, column: 1, scope: !1295)
!1314 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !941, file: !941, line: 276, type: !1288, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1315 = !DILocalVariable(name: "r", arg: 1, scope: !1314, file: !941, line: 276, type: !1032)
!1316 = !DILocation(line: 0, scope: !1314)
!1317 = !DILocation(line: 278, column: 3, scope: !1314)
!1318 = !DILocation(line: 279, column: 1, scope: !1314)
!1319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !941, file: !941, line: 290, type: !1320, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1320 = !DISubroutineType(types: !1321)
!1321 = !{null, !1032, !944, !944}
!1322 = !DILocalVariable(name: "r", arg: 1, scope: !1319, file: !941, line: 290, type: !1032)
!1323 = !DILocation(line: 0, scope: !1319)
!1324 = !DILocalVariable(name: "a", arg: 2, scope: !1319, file: !941, line: 290, type: !944)
!1325 = !DILocalVariable(name: "b", arg: 3, scope: !1319, file: !941, line: 290, type: !944)
!1326 = !DILocalVariable(name: "i", scope: !1319, file: !941, line: 292, type: !42)
!1327 = !DILocation(line: 293, column: 7, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1319, file: !941, line: 293, column: 3)
!1329 = !DILocation(line: 293, scope: !1328)
!1330 = !DILocation(line: 293, column: 12, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1328, file: !941, line: 293, column: 3)
!1332 = !DILocation(line: 293, column: 3, scope: !1328)
!1333 = !DILocation(line: 294, column: 25, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1331, file: !941, line: 293, column: 28)
!1335 = !DILocation(line: 294, column: 14, scope: !1334)
!1336 = !DILocation(line: 294, column: 42, scope: !1334)
!1337 = !DILocation(line: 294, column: 31, scope: !1334)
!1338 = !DILocation(line: 294, column: 59, scope: !1334)
!1339 = !DILocation(line: 294, column: 48, scope: !1334)
!1340 = !DILocation(line: 294, column: 72, scope: !1334)
!1341 = !DILocation(line: 294, column: 64, scope: !1334)
!1342 = !DILocation(line: 294, column: 5, scope: !1334)
!1343 = !DILocation(line: 295, column: 25, scope: !1334)
!1344 = !DILocation(line: 295, column: 27, scope: !1334)
!1345 = !DILocation(line: 295, column: 14, scope: !1334)
!1346 = !DILocation(line: 295, column: 44, scope: !1334)
!1347 = !DILocation(line: 295, column: 46, scope: !1334)
!1348 = !DILocation(line: 295, column: 33, scope: !1334)
!1349 = !DILocation(line: 295, column: 63, scope: !1334)
!1350 = !DILocation(line: 295, column: 65, scope: !1334)
!1351 = !DILocation(line: 295, column: 52, scope: !1334)
!1352 = !DILocation(line: 295, column: 79, scope: !1334)
!1353 = !DILocation(line: 295, column: 71, scope: !1334)
!1354 = !DILocation(line: 295, column: 70, scope: !1334)
!1355 = !DILocation(line: 295, column: 5, scope: !1334)
!1356 = !DILocation(line: 293, column: 24, scope: !1331)
!1357 = !DILocation(line: 293, column: 3, scope: !1331)
!1358 = distinct !{!1358, !1332, !1359, !235}
!1359 = !DILocation(line: 296, column: 3, scope: !1328)
!1360 = !DILocation(line: 297, column: 1, scope: !1319)
!1361 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !941, file: !941, line: 307, type: !1288, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1362 = !DILocalVariable(name: "r", arg: 1, scope: !1361, file: !941, line: 307, type: !1032)
!1363 = !DILocation(line: 0, scope: !1361)
!1364 = !DILocalVariable(name: "f", scope: !1361, file: !941, line: 310, type: !13)
!1365 = !DILocalVariable(name: "i", scope: !1361, file: !941, line: 309, type: !42)
!1366 = !DILocation(line: 311, column: 7, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1361, file: !941, line: 311, column: 3)
!1368 = !DILocation(line: 311, scope: !1367)
!1369 = !DILocation(line: 311, column: 12, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1367, file: !941, line: 311, column: 3)
!1371 = !DILocation(line: 311, column: 3, scope: !1367)
!1372 = !DILocation(line: 312, column: 47, scope: !1370)
!1373 = !DILocation(line: 312, column: 38, scope: !1370)
!1374 = !DILocation(line: 312, column: 59, scope: !1370)
!1375 = !DILocation(line: 312, column: 20, scope: !1370)
!1376 = !DILocation(line: 312, column: 5, scope: !1370)
!1377 = !DILocation(line: 312, column: 18, scope: !1370)
!1378 = !DILocation(line: 311, column: 22, scope: !1370)
!1379 = !DILocation(line: 311, column: 3, scope: !1370)
!1380 = distinct !{!1380, !1371, !1381, !235}
!1381 = !DILocation(line: 312, column: 61, scope: !1367)
!1382 = !DILocation(line: 313, column: 1, scope: !1361)
!1383 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !941, file: !941, line: 339, type: !1320, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1384 = !DILocalVariable(name: "r", arg: 1, scope: !1383, file: !941, line: 339, type: !1032)
!1385 = !DILocation(line: 0, scope: !1383)
!1386 = !DILocalVariable(name: "a", arg: 2, scope: !1383, file: !941, line: 339, type: !944)
!1387 = !DILocalVariable(name: "b", arg: 3, scope: !1383, file: !941, line: 339, type: !944)
!1388 = !DILocalVariable(name: "i", scope: !1383, file: !941, line: 341, type: !42)
!1389 = !DILocation(line: 342, column: 7, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1383, file: !941, line: 342, column: 3)
!1391 = !DILocation(line: 342, scope: !1390)
!1392 = !DILocation(line: 342, column: 12, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1390, file: !941, line: 342, column: 3)
!1394 = !DILocation(line: 342, column: 3, scope: !1390)
!1395 = !DILocation(line: 343, column: 20, scope: !1393)
!1396 = !DILocation(line: 343, column: 35, scope: !1393)
!1397 = !DILocation(line: 343, column: 33, scope: !1393)
!1398 = !DILocation(line: 343, column: 5, scope: !1393)
!1399 = !DILocation(line: 343, column: 18, scope: !1393)
!1400 = !DILocation(line: 342, column: 22, scope: !1393)
!1401 = !DILocation(line: 342, column: 3, scope: !1393)
!1402 = distinct !{!1402, !1394, !1403, !235}
!1403 = !DILocation(line: 343, column: 46, scope: !1390)
!1404 = !DILocation(line: 344, column: 1, scope: !1383)
!1405 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !941, file: !941, line: 355, type: !1320, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1406 = !DILocalVariable(name: "r", arg: 1, scope: !1405, file: !941, line: 355, type: !1032)
!1407 = !DILocation(line: 0, scope: !1405)
!1408 = !DILocalVariable(name: "a", arg: 2, scope: !1405, file: !941, line: 355, type: !944)
!1409 = !DILocalVariable(name: "b", arg: 3, scope: !1405, file: !941, line: 355, type: !944)
!1410 = !DILocalVariable(name: "i", scope: !1405, file: !941, line: 357, type: !42)
!1411 = !DILocation(line: 358, column: 7, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1405, file: !941, line: 358, column: 3)
!1413 = !DILocation(line: 358, scope: !1412)
!1414 = !DILocation(line: 358, column: 12, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1412, file: !941, line: 358, column: 3)
!1416 = !DILocation(line: 358, column: 3, scope: !1412)
!1417 = !DILocation(line: 359, column: 20, scope: !1415)
!1418 = !DILocation(line: 359, column: 35, scope: !1415)
!1419 = !DILocation(line: 359, column: 33, scope: !1415)
!1420 = !DILocation(line: 359, column: 5, scope: !1415)
!1421 = !DILocation(line: 359, column: 18, scope: !1415)
!1422 = !DILocation(line: 358, column: 22, scope: !1415)
!1423 = !DILocation(line: 358, column: 3, scope: !1415)
!1424 = distinct !{!1424, !1416, !1425, !235}
!1425 = !DILocation(line: 359, column: 46, scope: !1412)
!1426 = !DILocation(line: 360, column: 1, scope: !1405)
!1427 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !11, file: !11, line: 80, type: !1428, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{null, !248}
!1430 = !DILocalVariable(name: "r", arg: 1, scope: !1427, file: !11, line: 80, type: !248)
!1431 = !DILocation(line: 0, scope: !1427)
!1432 = !DILocalVariable(name: "k", scope: !1427, file: !11, line: 81, type: !42)
!1433 = !DILocalVariable(name: "len", scope: !1427, file: !11, line: 81, type: !42)
!1434 = !DILocation(line: 85, column: 7, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1427, file: !11, line: 85, column: 3)
!1436 = !DILocation(line: 85, scope: !1435)
!1437 = !DILocation(line: 84, column: 5, scope: !1427)
!1438 = !DILocation(line: 85, column: 22, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1435, file: !11, line: 85, column: 3)
!1440 = !DILocation(line: 85, column: 3, scope: !1435)
!1441 = !DILocation(line: 86, column: 5, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1443, file: !11, line: 86, column: 5)
!1443 = distinct !DILexicalBlock(scope: !1439, file: !11, line: 85, column: 39)
!1444 = !DILocation(line: 86, scope: !1442)
!1445 = !DILocalVariable(name: "start", scope: !1427, file: !11, line: 81, type: !42)
!1446 = !DILocation(line: 86, column: 26, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1442, file: !11, line: 86, column: 5)
!1448 = !DILocation(line: 87, column: 14, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1447, file: !11, line: 86, column: 50)
!1450 = !DILocalVariable(name: "zeta", scope: !1427, file: !11, line: 82, type: !14)
!1451 = !DILocalVariable(name: "j", scope: !1427, file: !11, line: 81, type: !42)
!1452 = !DILocation(line: 88, column: 11, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1449, file: !11, line: 88, column: 7)
!1454 = !DILocation(line: 88, scope: !1453)
!1455 = !DILocation(line: 88, column: 32, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1453, file: !11, line: 88, column: 7)
!1457 = !DILocation(line: 88, column: 24, scope: !1456)
!1458 = !DILocation(line: 88, column: 7, scope: !1453)
!1459 = !DILocation(line: 89, column: 25, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1456, file: !11, line: 88, column: 44)
!1461 = !DILocation(line: 89, column: 13, scope: !1460)
!1462 = !DILocalVariable(name: "t", scope: !1427, file: !11, line: 82, type: !14)
!1463 = !DILocation(line: 90, column: 22, scope: !1460)
!1464 = !DILocation(line: 90, column: 27, scope: !1460)
!1465 = !DILocation(line: 90, column: 9, scope: !1460)
!1466 = !DILocation(line: 90, column: 20, scope: !1460)
!1467 = !DILocation(line: 91, column: 16, scope: !1460)
!1468 = !DILocation(line: 91, column: 21, scope: !1460)
!1469 = !DILocation(line: 91, column: 9, scope: !1460)
!1470 = !DILocation(line: 91, column: 14, scope: !1460)
!1471 = !DILocation(line: 88, column: 40, scope: !1456)
!1472 = !DILocation(line: 88, column: 7, scope: !1456)
!1473 = distinct !{!1473, !1458, !1474, !235}
!1474 = !DILocation(line: 92, column: 7, scope: !1453)
!1475 = !DILocation(line: 87, column: 21, scope: !1449)
!1476 = !DILocation(line: 86, column: 43, scope: !1447)
!1477 = !DILocation(line: 86, column: 5, scope: !1447)
!1478 = distinct !{!1478, !1441, !1479, !235}
!1479 = !DILocation(line: 93, column: 5, scope: !1442)
!1480 = !DILocation(line: 85, column: 32, scope: !1439)
!1481 = !DILocation(line: 85, column: 3, scope: !1439)
!1482 = distinct !{!1482, !1440, !1483, !235}
!1483 = !DILocation(line: 94, column: 3, scope: !1435)
!1484 = !DILocation(line: 95, column: 1, scope: !1427)
!1485 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1486, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!14, !14, !14}
!1488 = !DILocalVariable(name: "a", arg: 1, scope: !1485, file: !11, line: 68, type: !14)
!1489 = !DILocation(line: 0, scope: !1485)
!1490 = !DILocalVariable(name: "b", arg: 2, scope: !1485, file: !11, line: 68, type: !14)
!1491 = !DILocation(line: 69, column: 28, scope: !1485)
!1492 = !DILocation(line: 69, column: 39, scope: !1485)
!1493 = !DILocation(line: 69, column: 38, scope: !1485)
!1494 = !DILocation(line: 69, column: 10, scope: !1485)
!1495 = !DILocation(line: 69, column: 3, scope: !1485)
!1496 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !11, file: !11, line: 106, type: !1428, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1497 = !DILocalVariable(name: "r", arg: 1, scope: !1496, file: !11, line: 106, type: !248)
!1498 = !DILocation(line: 0, scope: !1496)
!1499 = !DILocalVariable(name: "f", scope: !1496, file: !11, line: 109, type: !13)
!1500 = !DILocalVariable(name: "k", scope: !1496, file: !11, line: 107, type: !42)
!1501 = !DILocalVariable(name: "len", scope: !1496, file: !11, line: 107, type: !42)
!1502 = !DILocation(line: 112, column: 7, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1496, file: !11, line: 112, column: 3)
!1504 = !DILocation(line: 112, scope: !1503)
!1505 = !DILocation(line: 111, column: 5, scope: !1496)
!1506 = !DILocation(line: 112, column: 20, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1503, file: !11, line: 112, column: 3)
!1508 = !DILocation(line: 112, column: 3, scope: !1503)
!1509 = !DILocation(line: 113, column: 5, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1511, file: !11, line: 113, column: 5)
!1511 = distinct !DILexicalBlock(scope: !1507, file: !11, line: 112, column: 39)
!1512 = !DILocation(line: 124, column: 3, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1496, file: !11, line: 124, column: 3)
!1514 = !DILocation(line: 113, scope: !1510)
!1515 = !DILocalVariable(name: "start", scope: !1496, file: !11, line: 107, type: !42)
!1516 = !DILocation(line: 113, column: 26, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1510, file: !11, line: 113, column: 5)
!1518 = !DILocation(line: 114, column: 14, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1517, file: !11, line: 113, column: 50)
!1520 = !DILocalVariable(name: "zeta", scope: !1496, file: !11, line: 108, type: !14)
!1521 = !DILocalVariable(name: "j", scope: !1496, file: !11, line: 107, type: !42)
!1522 = !DILocation(line: 115, column: 11, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !11, line: 115, column: 7)
!1524 = !DILocation(line: 115, scope: !1523)
!1525 = !DILocation(line: 115, column: 32, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1523, file: !11, line: 115, column: 7)
!1527 = !DILocation(line: 115, column: 24, scope: !1526)
!1528 = !DILocation(line: 115, column: 7, scope: !1523)
!1529 = !DILocation(line: 116, column: 13, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1526, file: !11, line: 115, column: 44)
!1531 = !DILocalVariable(name: "t", scope: !1496, file: !11, line: 108, type: !14)
!1532 = !DILocation(line: 117, column: 35, scope: !1530)
!1533 = !DILocation(line: 117, column: 33, scope: !1530)
!1534 = !DILocation(line: 117, column: 16, scope: !1530)
!1535 = !DILocation(line: 117, column: 9, scope: !1530)
!1536 = !DILocation(line: 117, column: 14, scope: !1530)
!1537 = !DILocation(line: 118, column: 22, scope: !1530)
!1538 = !DILocation(line: 118, column: 33, scope: !1530)
!1539 = !DILocation(line: 118, column: 9, scope: !1530)
!1540 = !DILocation(line: 118, column: 20, scope: !1530)
!1541 = !DILocation(line: 119, column: 34, scope: !1530)
!1542 = !DILocation(line: 119, column: 22, scope: !1530)
!1543 = !DILocation(line: 119, column: 9, scope: !1530)
!1544 = !DILocation(line: 119, column: 20, scope: !1530)
!1545 = !DILocation(line: 115, column: 40, scope: !1526)
!1546 = !DILocation(line: 115, column: 7, scope: !1526)
!1547 = distinct !{!1547, !1528, !1548, !235}
!1548 = !DILocation(line: 120, column: 7, scope: !1523)
!1549 = !DILocation(line: 114, column: 21, scope: !1519)
!1550 = !DILocation(line: 113, column: 43, scope: !1517)
!1551 = !DILocation(line: 113, column: 5, scope: !1517)
!1552 = distinct !{!1552, !1509, !1553, !235}
!1553 = !DILocation(line: 121, column: 5, scope: !1510)
!1554 = !DILocation(line: 112, column: 32, scope: !1507)
!1555 = !DILocation(line: 112, column: 3, scope: !1507)
!1556 = distinct !{!1556, !1508, !1557, !235}
!1557 = !DILocation(line: 122, column: 3, scope: !1503)
!1558 = !DILocation(line: 124, scope: !1513)
!1559 = !DILocation(line: 124, column: 16, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1513, file: !11, line: 124, column: 3)
!1561 = !DILocation(line: 125, column: 18, scope: !1560)
!1562 = !DILocation(line: 125, column: 12, scope: !1560)
!1563 = !DILocation(line: 125, column: 5, scope: !1560)
!1564 = !DILocation(line: 125, column: 10, scope: !1560)
!1565 = !DILocation(line: 124, column: 24, scope: !1560)
!1566 = !DILocation(line: 124, column: 3, scope: !1560)
!1567 = distinct !{!1567, !1512, !1568, !235}
!1568 = !DILocation(line: 125, column: 25, scope: !1513)
!1569 = !DILocation(line: 126, column: 1, scope: !1496)
!1570 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !11, file: !11, line: 139, type: !1571, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1571 = !DISubroutineType(types: !1572)
!1572 = !{null, !248, !1573, !1573, !14}
!1573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1574 = !DILocalVariable(name: "r", arg: 1, scope: !1570, file: !11, line: 139, type: !248)
!1575 = !DILocation(line: 0, scope: !1570)
!1576 = !DILocalVariable(name: "a", arg: 2, scope: !1570, file: !11, line: 139, type: !1573)
!1577 = !DILocalVariable(name: "b", arg: 3, scope: !1570, file: !11, line: 139, type: !1573)
!1578 = !DILocalVariable(name: "zeta", arg: 4, scope: !1570, file: !11, line: 139, type: !14)
!1579 = !DILocation(line: 141, column: 17, scope: !1570)
!1580 = !DILocation(line: 141, column: 23, scope: !1570)
!1581 = !DILocation(line: 141, column: 11, scope: !1570)
!1582 = !DILocation(line: 141, column: 9, scope: !1570)
!1583 = !DILocation(line: 142, column: 11, scope: !1570)
!1584 = !DILocation(line: 142, column: 9, scope: !1570)
!1585 = !DILocation(line: 143, column: 17, scope: !1570)
!1586 = !DILocation(line: 143, column: 23, scope: !1570)
!1587 = !DILocation(line: 143, column: 11, scope: !1570)
!1588 = !DILocation(line: 143, column: 8, scope: !1570)
!1589 = !DILocation(line: 144, column: 17, scope: !1570)
!1590 = !DILocation(line: 144, column: 23, scope: !1570)
!1591 = !DILocation(line: 144, column: 11, scope: !1570)
!1592 = !DILocation(line: 144, column: 3, scope: !1570)
!1593 = !DILocation(line: 144, column: 9, scope: !1570)
!1594 = !DILocation(line: 145, column: 17, scope: !1570)
!1595 = !DILocation(line: 145, column: 23, scope: !1570)
!1596 = !DILocation(line: 145, column: 11, scope: !1570)
!1597 = !DILocation(line: 145, column: 3, scope: !1570)
!1598 = !DILocation(line: 145, column: 8, scope: !1570)
!1599 = !DILocation(line: 146, column: 1, scope: !1570)
!1600 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1601, file: !1601, line: 110, type: !1602, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1601 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1602 = !DISubroutineType(types: !1603)
!1603 = !{null, !1604, !64}
!1604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1605, size: 32)
!1605 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !168, line: 13, baseType: !1606)
!1606 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !168, line: 11, size: 4096, elements: !1607)
!1607 = !{!1608}
!1608 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1606, file: !168, line: 12, baseType: !172, size: 4096)
!1609 = !DILocalVariable(name: "r", arg: 1, scope: !1600, file: !1601, line: 110, type: !1604)
!1610 = !DILocation(line: 0, scope: !1600)
!1611 = !DILocalVariable(name: "buf", arg: 2, scope: !1600, file: !1601, line: 110, type: !64)
!1612 = !DILocation(line: 113, column: 3, scope: !1600)
!1613 = !DILocation(line: 119, column: 1, scope: !1600)
!1614 = distinct !DISubprogram(name: "cbd2", scope: !1601, file: !1601, line: 58, type: !1602, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1615 = !DILocalVariable(name: "r", arg: 1, scope: !1614, file: !1601, line: 58, type: !1604)
!1616 = !DILocation(line: 0, scope: !1614)
!1617 = !DILocalVariable(name: "buf", arg: 2, scope: !1614, file: !1601, line: 58, type: !64)
!1618 = !DILocalVariable(name: "i", scope: !1614, file: !1601, line: 60, type: !42)
!1619 = !DILocation(line: 64, column: 7, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1614, file: !1601, line: 64, column: 3)
!1621 = !DILocation(line: 64, scope: !1620)
!1622 = !DILocation(line: 64, column: 12, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1620, file: !1601, line: 64, column: 3)
!1624 = !DILocation(line: 64, column: 3, scope: !1620)
!1625 = !DILocation(line: 65, column: 35, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1623, file: !1601, line: 64, column: 28)
!1627 = !DILocation(line: 65, column: 33, scope: !1626)
!1628 = !DILocation(line: 65, column: 10, scope: !1626)
!1629 = !DILocalVariable(name: "t", scope: !1614, file: !1601, line: 61, type: !40)
!1630 = !DILocation(line: 66, column: 12, scope: !1626)
!1631 = !DILocalVariable(name: "d", scope: !1614, file: !1601, line: 61, type: !40)
!1632 = !DILocation(line: 67, column: 12, scope: !1626)
!1633 = !DILocation(line: 67, column: 17, scope: !1626)
!1634 = !DILocation(line: 67, column: 7, scope: !1626)
!1635 = !DILocalVariable(name: "j", scope: !1614, file: !1601, line: 60, type: !42)
!1636 = !DILocation(line: 69, column: 9, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1626, file: !1601, line: 69, column: 5)
!1638 = !DILocation(line: 69, scope: !1637)
!1639 = !DILocation(line: 69, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1637, file: !1601, line: 69, column: 5)
!1641 = !DILocation(line: 69, column: 5, scope: !1637)
!1642 = !DILocation(line: 70, column: 19, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1640, file: !1601, line: 69, column: 22)
!1644 = !DILocation(line: 70, column: 14, scope: !1643)
!1645 = !DILocation(line: 70, column: 11, scope: !1643)
!1646 = !DILocalVariable(name: "a", scope: !1614, file: !1601, line: 62, type: !14)
!1647 = !DILocation(line: 71, column: 19, scope: !1643)
!1648 = !DILocation(line: 71, column: 21, scope: !1643)
!1649 = !DILocation(line: 71, column: 14, scope: !1643)
!1650 = !DILocation(line: 71, column: 11, scope: !1643)
!1651 = !DILocalVariable(name: "b", scope: !1614, file: !1601, line: 62, type: !14)
!1652 = !DILocation(line: 72, column: 28, scope: !1643)
!1653 = !DILocation(line: 72, column: 26, scope: !1643)
!1654 = !DILocation(line: 72, column: 18, scope: !1643)
!1655 = !DILocation(line: 72, column: 20, scope: !1643)
!1656 = !DILocation(line: 72, column: 7, scope: !1643)
!1657 = !DILocation(line: 72, column: 24, scope: !1643)
!1658 = !DILocation(line: 69, column: 18, scope: !1640)
!1659 = !DILocation(line: 69, column: 5, scope: !1640)
!1660 = distinct !{!1660, !1641, !1661, !235}
!1661 = !DILocation(line: 73, column: 5, scope: !1637)
!1662 = !DILocation(line: 64, column: 24, scope: !1623)
!1663 = !DILocation(line: 64, column: 3, scope: !1623)
!1664 = distinct !{!1664, !1624, !1665, !235}
!1665 = !DILocation(line: 74, column: 3, scope: !1620)
!1666 = !DILocation(line: 75, column: 1, scope: !1614)
!1667 = distinct !DISubprogram(name: "load32_littleendian", scope: !1601, file: !1601, line: 15, type: !1668, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1668 = !DISubroutineType(types: !1669)
!1669 = !{!40, !64}
!1670 = !DILocalVariable(name: "x", arg: 1, scope: !1667, file: !1601, line: 15, type: !64)
!1671 = !DILocation(line: 0, scope: !1667)
!1672 = !DILocation(line: 18, column: 18, scope: !1667)
!1673 = !DILocation(line: 18, column: 8, scope: !1667)
!1674 = !DILocalVariable(name: "r", scope: !1667, file: !1601, line: 17, type: !40)
!1675 = !DILocation(line: 19, column: 18, scope: !1667)
!1676 = !DILocation(line: 19, column: 8, scope: !1667)
!1677 = !DILocation(line: 19, column: 23, scope: !1667)
!1678 = !DILocation(line: 19, column: 5, scope: !1667)
!1679 = !DILocation(line: 20, column: 18, scope: !1667)
!1680 = !DILocation(line: 20, column: 8, scope: !1667)
!1681 = !DILocation(line: 20, column: 23, scope: !1667)
!1682 = !DILocation(line: 20, column: 5, scope: !1667)
!1683 = !DILocation(line: 21, column: 18, scope: !1667)
!1684 = !DILocation(line: 21, column: 8, scope: !1667)
!1685 = !DILocation(line: 21, column: 23, scope: !1667)
!1686 = !DILocation(line: 21, column: 5, scope: !1667)
!1687 = !DILocation(line: 22, column: 3, scope: !1667)
!1688 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1601, file: !1601, line: 121, type: !1602, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1689 = !DILocalVariable(name: "r", arg: 1, scope: !1688, file: !1601, line: 121, type: !1604)
!1690 = !DILocation(line: 0, scope: !1688)
!1691 = !DILocalVariable(name: "buf", arg: 2, scope: !1688, file: !1601, line: 121, type: !64)
!1692 = !DILocation(line: 124, column: 3, scope: !1688)
!1693 = !DILocation(line: 128, column: 1, scope: !1688)
!1694 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1695, file: !1695, line: 16, type: !1696, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1695 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1696 = !DISubroutineType(types: !48)
!1697 = !DILocalVariable(name: "a", arg: 1, scope: !1694, file: !1695, line: 16, type: !5)
!1698 = !DILocation(line: 0, scope: !1694)
!1699 = !DILocalVariable(name: "t", scope: !1694, file: !1695, line: 18, type: !14)
!1700 = !DILocation(line: 21, column: 12, scope: !1694)
!1701 = !DILocation(line: 21, column: 22, scope: !1694)
!1702 = !DILocation(line: 21, column: 10, scope: !1694)
!1703 = !DILocation(line: 21, column: 32, scope: !1694)
!1704 = !DILocation(line: 21, column: 7, scope: !1694)
!1705 = !DILocation(line: 22, column: 3, scope: !1694)
!1706 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1695, file: !1695, line: 35, type: !1707, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1707 = !DISubroutineType(types: !1708)
!1708 = !{!14, !14}
!1709 = !DILocalVariable(name: "a", arg: 1, scope: !1706, file: !1695, line: 35, type: !14)
!1710 = !DILocation(line: 0, scope: !1706)
!1711 = !DILocalVariable(name: "v", scope: !1706, file: !1695, line: 37, type: !13)
!1712 = !DILocation(line: 39, column: 20, scope: !1706)
!1713 = !DILocation(line: 39, column: 19, scope: !1706)
!1714 = !DILocation(line: 39, column: 22, scope: !1706)
!1715 = !DILocation(line: 39, column: 33, scope: !1706)
!1716 = !DILocalVariable(name: "t", scope: !1706, file: !1695, line: 36, type: !14)
!1717 = !DILocation(line: 41, column: 10, scope: !1706)
!1718 = !DILocation(line: 41, column: 3, scope: !1706)
!1719 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1720, file: !1720, line: 16, type: !1721, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1720 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1721 = !DISubroutineType(types: !1722)
!1722 = !{!9, !64, !64, !1723}
!1723 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1724, line: 214, baseType: !42)
!1724 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1725 = !DILocalVariable(name: "a", arg: 1, scope: !1719, file: !1720, line: 16, type: !64)
!1726 = !DILocation(line: 0, scope: !1719)
!1727 = !DILocalVariable(name: "b", arg: 2, scope: !1719, file: !1720, line: 16, type: !64)
!1728 = !DILocalVariable(name: "len", arg: 3, scope: !1719, file: !1720, line: 16, type: !1723)
!1729 = !DILocalVariable(name: "r", scope: !1719, file: !1720, line: 19, type: !61)
!1730 = !DILocalVariable(name: "i", scope: !1719, file: !1720, line: 18, type: !1723)
!1731 = !DILocation(line: 21, column: 7, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1719, file: !1720, line: 21, column: 3)
!1733 = !DILocation(line: 21, scope: !1732)
!1734 = !DILocation(line: 21, column: 12, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1732, file: !1720, line: 21, column: 3)
!1736 = !DILocation(line: 21, column: 3, scope: !1732)
!1737 = !DILocation(line: 22, column: 10, scope: !1735)
!1738 = !DILocation(line: 22, column: 17, scope: !1735)
!1739 = !DILocation(line: 22, column: 15, scope: !1735)
!1740 = !DILocation(line: 22, column: 7, scope: !1735)
!1741 = !DILocation(line: 21, column: 18, scope: !1735)
!1742 = !DILocation(line: 21, column: 3, scope: !1735)
!1743 = distinct !{!1743, !1736, !1744, !235}
!1744 = !DILocation(line: 22, column: 20, scope: !1732)
!1745 = !DILocation(line: 24, column: 25, scope: !1719)
!1746 = !DILocation(line: 24, column: 10, scope: !1719)
!1747 = !DILocation(line: 24, column: 3, scope: !1719)
!1748 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1720, file: !1720, line: 40, type: !1749, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1749 = !DISubroutineType(types: !1750)
!1750 = !{null, !60, !64, !1723, !61}
!1751 = !DILocalVariable(name: "r", arg: 1, scope: !1748, file: !1720, line: 40, type: !60)
!1752 = !DILocation(line: 0, scope: !1748)
!1753 = !DILocalVariable(name: "x", arg: 2, scope: !1748, file: !1720, line: 40, type: !64)
!1754 = !DILocalVariable(name: "len", arg: 3, scope: !1748, file: !1720, line: 40, type: !1723)
!1755 = !DILocalVariable(name: "b", arg: 4, scope: !1748, file: !1720, line: 40, type: !61)
!1756 = !DILocation(line: 51, column: 3, scope: !1748)
!1757 = !{i64 1722}
!1758 = !DILocation(line: 54, column: 7, scope: !1748)
!1759 = !DILocalVariable(name: "i", scope: !1748, file: !1720, line: 42, type: !1723)
!1760 = !DILocation(line: 55, column: 7, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1748, file: !1720, line: 55, column: 3)
!1762 = !DILocation(line: 55, scope: !1761)
!1763 = !DILocation(line: 55, column: 12, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1761, file: !1720, line: 55, column: 3)
!1765 = !DILocation(line: 55, column: 3, scope: !1761)
!1766 = !DILocation(line: 56, column: 18, scope: !1764)
!1767 = !DILocation(line: 56, column: 25, scope: !1764)
!1768 = !DILocation(line: 56, column: 23, scope: !1764)
!1769 = !DILocation(line: 56, column: 15, scope: !1764)
!1770 = !DILocation(line: 56, column: 5, scope: !1764)
!1771 = !DILocation(line: 56, column: 10, scope: !1764)
!1772 = !DILocation(line: 55, column: 18, scope: !1764)
!1773 = !DILocation(line: 55, column: 3, scope: !1764)
!1774 = distinct !{!1774, !1765, !1775, !235}
!1775 = !DILocation(line: 56, column: 29, scope: !1761)
!1776 = !DILocation(line: 57, column: 1, scope: !1748)
!1777 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1720, file: !1720, line: 71, type: !1778, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1778 = !DISubroutineType(types: !1779)
!1779 = !{null, !248, !14, !35}
!1780 = !DILocalVariable(name: "r", arg: 1, scope: !1777, file: !1720, line: 71, type: !248)
!1781 = !DILocation(line: 0, scope: !1777)
!1782 = !DILocalVariable(name: "v", arg: 2, scope: !1777, file: !1720, line: 71, type: !14)
!1783 = !DILocalVariable(name: "b", arg: 3, scope: !1777, file: !1720, line: 71, type: !35)
!1784 = !DILocation(line: 73, column: 7, scope: !1777)
!1785 = !DILocation(line: 74, column: 15, scope: !1777)
!1786 = !DILocation(line: 74, column: 19, scope: !1777)
!1787 = !DILocation(line: 74, column: 11, scope: !1777)
!1788 = !DILocation(line: 74, column: 6, scope: !1777)
!1789 = !DILocation(line: 75, column: 1, scope: !1777)
!1790 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !1791, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1791 = !DISubroutineType(types: !1792)
!1792 = !{null, !1793}
!1793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1794, size: 32)
!1794 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !1795)
!1795 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !1796)
!1796 = !{!1797, !1798}
!1797 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1795, file: !190, line: 15, baseType: !194, size: 1600)
!1798 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1795, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!1799 = !DILocalVariable(name: "state", arg: 1, scope: !1790, file: !27, line: 523, type: !1793)
!1800 = !DILocation(line: 0, scope: !1790)
!1801 = !DILocation(line: 525, column: 3, scope: !1790)
!1802 = !DILocation(line: 526, column: 10, scope: !1790)
!1803 = !DILocation(line: 526, column: 14, scope: !1790)
!1804 = !DILocation(line: 527, column: 1, scope: !1790)
!1805 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !1806, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1806 = !DISubroutineType(types: !1807)
!1807 = !{null, !1808}
!1808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!1809 = !DILocalVariable(name: "s", arg: 1, scope: !1805, file: !27, line: 353, type: !1808)
!1810 = !DILocation(line: 0, scope: !1805)
!1811 = !DILocalVariable(name: "i", scope: !1805, file: !27, line: 355, type: !42)
!1812 = !DILocation(line: 356, column: 7, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1805, file: !27, line: 356, column: 3)
!1814 = !DILocation(line: 356, scope: !1813)
!1815 = !DILocation(line: 356, column: 12, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1813, file: !27, line: 356, column: 3)
!1817 = !DILocation(line: 356, column: 3, scope: !1813)
!1818 = !DILocation(line: 357, column: 5, scope: !1816)
!1819 = !DILocation(line: 357, column: 10, scope: !1816)
!1820 = !DILocation(line: 356, column: 17, scope: !1816)
!1821 = !DILocation(line: 356, column: 3, scope: !1816)
!1822 = distinct !{!1822, !1817, !1823, !235}
!1823 = !DILocation(line: 357, column: 12, scope: !1813)
!1824 = !DILocation(line: 358, column: 1, scope: !1805)
!1825 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !1826, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1826 = !DISubroutineType(types: !1827)
!1827 = !{null, !1793, !64, !1723}
!1828 = !DILocalVariable(name: "state", arg: 1, scope: !1825, file: !27, line: 538, type: !1793)
!1829 = !DILocation(line: 0, scope: !1825)
!1830 = !DILocalVariable(name: "in", arg: 2, scope: !1825, file: !27, line: 538, type: !64)
!1831 = !DILocalVariable(name: "inlen", arg: 3, scope: !1825, file: !27, line: 538, type: !1723)
!1832 = !DILocation(line: 540, column: 47, scope: !1825)
!1833 = !DILocation(line: 540, column: 16, scope: !1825)
!1834 = !DILocation(line: 540, column: 10, scope: !1825)
!1835 = !DILocation(line: 540, column: 14, scope: !1825)
!1836 = !DILocation(line: 541, column: 1, scope: !1825)
!1837 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !1838, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1838 = !DISubroutineType(types: !1839)
!1839 = !{!42, !1808, !42, !42, !64, !1723}
!1840 = !DILocalVariable(name: "s", arg: 1, scope: !1837, file: !27, line: 373, type: !1808)
!1841 = !DILocation(line: 0, scope: !1837)
!1842 = !DILocalVariable(name: "pos", arg: 2, scope: !1837, file: !27, line: 374, type: !42)
!1843 = !DILocalVariable(name: "r", arg: 3, scope: !1837, file: !27, line: 375, type: !42)
!1844 = !DILocalVariable(name: "in", arg: 4, scope: !1837, file: !27, line: 376, type: !64)
!1845 = !DILocalVariable(name: "inlen", arg: 5, scope: !1837, file: !27, line: 377, type: !1723)
!1846 = !DILocation(line: 381, column: 3, scope: !1837)
!1847 = !DILocation(line: 381, column: 12, scope: !1837)
!1848 = !DILocation(line: 381, column: 19, scope: !1837)
!1849 = !DILocation(line: 382, column: 5, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1851, file: !27, line: 382, column: 5)
!1851 = distinct !DILexicalBlock(scope: !1837, file: !27, line: 381, column: 25)
!1852 = !DILocation(line: 389, column: 3, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1837, file: !27, line: 389, column: 3)
!1854 = !DILocation(line: 382, scope: !1850)
!1855 = !DILocalVariable(name: "i", scope: !1837, file: !27, line: 379, type: !42)
!1856 = !DILocation(line: 382, column: 16, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1850, file: !27, line: 382, column: 5)
!1858 = !DILocation(line: 383, column: 27, scope: !1857)
!1859 = !DILocation(line: 383, column: 17, scope: !1857)
!1860 = !DILocation(line: 383, column: 37, scope: !1857)
!1861 = !DILocation(line: 383, column: 33, scope: !1857)
!1862 = !DILocation(line: 383, column: 10, scope: !1857)
!1863 = !DILocation(line: 383, column: 7, scope: !1857)
!1864 = !DILocation(line: 383, column: 14, scope: !1857)
!1865 = !DILocation(line: 383, column: 30, scope: !1857)
!1866 = !DILocation(line: 382, column: 20, scope: !1857)
!1867 = !DILocation(line: 382, column: 5, scope: !1857)
!1868 = distinct !{!1868, !1849, !1869, !235}
!1869 = !DILocation(line: 383, column: 42, scope: !1850)
!1870 = !DILocation(line: 384, column: 15, scope: !1851)
!1871 = !DILocation(line: 384, column: 11, scope: !1851)
!1872 = !DILocation(line: 385, column: 5, scope: !1851)
!1873 = distinct !{!1873, !1846, !1874, !235}
!1874 = !DILocation(line: 387, column: 3, scope: !1837)
!1875 = !DILocation(line: 389, scope: !1853)
!1876 = !DILocation(line: 389, column: 18, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1853, file: !27, line: 389, column: 3)
!1878 = !DILocation(line: 389, column: 14, scope: !1877)
!1879 = !DILocation(line: 390, column: 25, scope: !1877)
!1880 = !DILocation(line: 390, column: 15, scope: !1877)
!1881 = !DILocation(line: 390, column: 35, scope: !1877)
!1882 = !DILocation(line: 390, column: 31, scope: !1877)
!1883 = !DILocation(line: 390, column: 8, scope: !1877)
!1884 = !DILocation(line: 390, column: 5, scope: !1877)
!1885 = !DILocation(line: 390, column: 12, scope: !1877)
!1886 = !DILocation(line: 390, column: 28, scope: !1877)
!1887 = !DILocation(line: 389, column: 26, scope: !1877)
!1888 = !DILocation(line: 389, column: 3, scope: !1877)
!1889 = distinct !{!1889, !1852, !1890, !235}
!1890 = !DILocation(line: 390, column: 40, scope: !1853)
!1891 = !DILocation(line: 392, column: 3, scope: !1837)
!1892 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !1806, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1893 = !DILocalVariable(name: "state", arg: 1, scope: !1892, file: !27, line: 82, type: !1808)
!1894 = !DILocation(line: 0, scope: !1892)
!1895 = !DILocation(line: 100, column: 15, scope: !1892)
!1896 = !DILocalVariable(name: "Aba", scope: !1892, file: !27, line: 86, type: !23)
!1897 = !DILocation(line: 101, column: 15, scope: !1892)
!1898 = !DILocalVariable(name: "Abe", scope: !1892, file: !27, line: 86, type: !23)
!1899 = !DILocation(line: 102, column: 15, scope: !1892)
!1900 = !DILocalVariable(name: "Abi", scope: !1892, file: !27, line: 86, type: !23)
!1901 = !DILocation(line: 103, column: 15, scope: !1892)
!1902 = !DILocalVariable(name: "Abo", scope: !1892, file: !27, line: 86, type: !23)
!1903 = !DILocation(line: 104, column: 15, scope: !1892)
!1904 = !DILocalVariable(name: "Abu", scope: !1892, file: !27, line: 86, type: !23)
!1905 = !DILocation(line: 105, column: 15, scope: !1892)
!1906 = !DILocalVariable(name: "Aga", scope: !1892, file: !27, line: 87, type: !23)
!1907 = !DILocation(line: 106, column: 15, scope: !1892)
!1908 = !DILocalVariable(name: "Age", scope: !1892, file: !27, line: 87, type: !23)
!1909 = !DILocation(line: 107, column: 15, scope: !1892)
!1910 = !DILocalVariable(name: "Agi", scope: !1892, file: !27, line: 87, type: !23)
!1911 = !DILocation(line: 108, column: 15, scope: !1892)
!1912 = !DILocalVariable(name: "Ago", scope: !1892, file: !27, line: 87, type: !23)
!1913 = !DILocation(line: 109, column: 15, scope: !1892)
!1914 = !DILocalVariable(name: "Agu", scope: !1892, file: !27, line: 87, type: !23)
!1915 = !DILocation(line: 110, column: 15, scope: !1892)
!1916 = !DILocalVariable(name: "Aka", scope: !1892, file: !27, line: 88, type: !23)
!1917 = !DILocation(line: 111, column: 15, scope: !1892)
!1918 = !DILocalVariable(name: "Ake", scope: !1892, file: !27, line: 88, type: !23)
!1919 = !DILocation(line: 112, column: 15, scope: !1892)
!1920 = !DILocalVariable(name: "Aki", scope: !1892, file: !27, line: 88, type: !23)
!1921 = !DILocation(line: 113, column: 15, scope: !1892)
!1922 = !DILocalVariable(name: "Ako", scope: !1892, file: !27, line: 88, type: !23)
!1923 = !DILocation(line: 114, column: 15, scope: !1892)
!1924 = !DILocalVariable(name: "Aku", scope: !1892, file: !27, line: 88, type: !23)
!1925 = !DILocation(line: 115, column: 15, scope: !1892)
!1926 = !DILocalVariable(name: "Ama", scope: !1892, file: !27, line: 89, type: !23)
!1927 = !DILocation(line: 116, column: 15, scope: !1892)
!1928 = !DILocalVariable(name: "Ame", scope: !1892, file: !27, line: 89, type: !23)
!1929 = !DILocation(line: 117, column: 15, scope: !1892)
!1930 = !DILocalVariable(name: "Ami", scope: !1892, file: !27, line: 89, type: !23)
!1931 = !DILocation(line: 118, column: 15, scope: !1892)
!1932 = !DILocalVariable(name: "Amo", scope: !1892, file: !27, line: 89, type: !23)
!1933 = !DILocation(line: 119, column: 15, scope: !1892)
!1934 = !DILocalVariable(name: "Amu", scope: !1892, file: !27, line: 89, type: !23)
!1935 = !DILocation(line: 120, column: 15, scope: !1892)
!1936 = !DILocalVariable(name: "Asa", scope: !1892, file: !27, line: 90, type: !23)
!1937 = !DILocation(line: 121, column: 15, scope: !1892)
!1938 = !DILocalVariable(name: "Ase", scope: !1892, file: !27, line: 90, type: !23)
!1939 = !DILocation(line: 122, column: 15, scope: !1892)
!1940 = !DILocalVariable(name: "Asi", scope: !1892, file: !27, line: 90, type: !23)
!1941 = !DILocation(line: 123, column: 15, scope: !1892)
!1942 = !DILocalVariable(name: "Aso", scope: !1892, file: !27, line: 90, type: !23)
!1943 = !DILocation(line: 124, column: 15, scope: !1892)
!1944 = !DILocalVariable(name: "Asu", scope: !1892, file: !27, line: 90, type: !23)
!1945 = !DILocalVariable(name: "round", scope: !1892, file: !27, line: 84, type: !9)
!1946 = !DILocation(line: 126, column: 13, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1892, file: !27, line: 126, column: 9)
!1948 = !DILocation(line: 126, scope: !1947)
!1949 = !DILocation(line: 126, column: 30, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1947, file: !27, line: 126, column: 9)
!1951 = !DILocation(line: 126, column: 9, scope: !1947)
!1952 = !DILocalVariable(name: "BCa", scope: !1892, file: !27, line: 91, type: !23)
!1953 = !DILocalVariable(name: "BCe", scope: !1892, file: !27, line: 91, type: !23)
!1954 = !DILocalVariable(name: "BCi", scope: !1892, file: !27, line: 91, type: !23)
!1955 = !DILocalVariable(name: "BCo", scope: !1892, file: !27, line: 91, type: !23)
!1956 = !DILocalVariable(name: "BCu", scope: !1892, file: !27, line: 91, type: !23)
!1957 = !DILocalVariable(name: "Da", scope: !1892, file: !27, line: 92, type: !23)
!1958 = !DILocalVariable(name: "De", scope: !1892, file: !27, line: 92, type: !23)
!1959 = !DILocalVariable(name: "Di", scope: !1892, file: !27, line: 92, type: !23)
!1960 = !DILocalVariable(name: "Do", scope: !1892, file: !27, line: 92, type: !23)
!1961 = !DILocalVariable(name: "Du", scope: !1892, file: !27, line: 92, type: !23)
!1962 = !DILocalVariable(name: "Eba", scope: !1892, file: !27, line: 93, type: !23)
!1963 = !DILocalVariable(name: "Ebe", scope: !1892, file: !27, line: 93, type: !23)
!1964 = !DILocalVariable(name: "Ebi", scope: !1892, file: !27, line: 93, type: !23)
!1965 = !DILocalVariable(name: "Ebo", scope: !1892, file: !27, line: 93, type: !23)
!1966 = !DILocalVariable(name: "Ebu", scope: !1892, file: !27, line: 93, type: !23)
!1967 = !DILocalVariable(name: "Ega", scope: !1892, file: !27, line: 94, type: !23)
!1968 = !DILocalVariable(name: "Ege", scope: !1892, file: !27, line: 94, type: !23)
!1969 = !DILocalVariable(name: "Egi", scope: !1892, file: !27, line: 94, type: !23)
!1970 = !DILocalVariable(name: "Ego", scope: !1892, file: !27, line: 94, type: !23)
!1971 = !DILocalVariable(name: "Egu", scope: !1892, file: !27, line: 94, type: !23)
!1972 = !DILocalVariable(name: "Eka", scope: !1892, file: !27, line: 95, type: !23)
!1973 = !DILocalVariable(name: "Eke", scope: !1892, file: !27, line: 95, type: !23)
!1974 = !DILocalVariable(name: "Eki", scope: !1892, file: !27, line: 95, type: !23)
!1975 = !DILocalVariable(name: "Eko", scope: !1892, file: !27, line: 95, type: !23)
!1976 = !DILocalVariable(name: "Eku", scope: !1892, file: !27, line: 95, type: !23)
!1977 = !DILocalVariable(name: "Ema", scope: !1892, file: !27, line: 96, type: !23)
!1978 = !DILocalVariable(name: "Eme", scope: !1892, file: !27, line: 96, type: !23)
!1979 = !DILocalVariable(name: "Emi", scope: !1892, file: !27, line: 96, type: !23)
!1980 = !DILocalVariable(name: "Emo", scope: !1892, file: !27, line: 96, type: !23)
!1981 = !DILocalVariable(name: "Emu", scope: !1892, file: !27, line: 96, type: !23)
!1982 = !DILocalVariable(name: "Esa", scope: !1892, file: !27, line: 97, type: !23)
!1983 = !DILocalVariable(name: "Ese", scope: !1892, file: !27, line: 97, type: !23)
!1984 = !DILocalVariable(name: "Esi", scope: !1892, file: !27, line: 97, type: !23)
!1985 = !DILocalVariable(name: "Eso", scope: !1892, file: !27, line: 97, type: !23)
!1986 = !DILocalVariable(name: "Esu", scope: !1892, file: !27, line: 97, type: !23)
!1987 = !DILocation(line: 130, column: 22, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1950, file: !27, line: 126, column: 53)
!1989 = !DILocation(line: 130, column: 26, scope: !1988)
!1990 = !DILocation(line: 130, column: 30, scope: !1988)
!1991 = !DILocation(line: 130, column: 34, scope: !1988)
!1992 = !DILocation(line: 132, column: 22, scope: !1988)
!1993 = !DILocation(line: 132, column: 26, scope: !1988)
!1994 = !DILocation(line: 132, column: 30, scope: !1988)
!1995 = !DILocation(line: 132, column: 34, scope: !1988)
!1996 = !DILocation(line: 138, column: 22, scope: !1988)
!1997 = !DILocation(line: 138, column: 21, scope: !1988)
!1998 = !DILocation(line: 208, column: 17, scope: !1988)
!1999 = !DILocation(line: 209, column: 19, scope: !1988)
!2000 = !DILocation(line: 129, column: 22, scope: !1988)
!2001 = !DILocation(line: 129, column: 26, scope: !1988)
!2002 = !DILocation(line: 129, column: 30, scope: !1988)
!2003 = !DILocation(line: 129, column: 34, scope: !1988)
!2004 = !DILocation(line: 135, column: 22, scope: !1988)
!2005 = !DILocation(line: 135, column: 21, scope: !1988)
!2006 = !DILocation(line: 212, column: 17, scope: !1988)
!2007 = !DILocation(line: 213, column: 19, scope: !1988)
!2008 = !DILocation(line: 131, column: 22, scope: !1988)
!2009 = !DILocation(line: 131, column: 26, scope: !1988)
!2010 = !DILocation(line: 131, column: 30, scope: !1988)
!2011 = !DILocation(line: 131, column: 34, scope: !1988)
!2012 = !DILocation(line: 128, column: 22, scope: !1988)
!2013 = !DILocation(line: 128, column: 26, scope: !1988)
!2014 = !DILocation(line: 128, column: 30, scope: !1988)
!2015 = !DILocation(line: 128, column: 34, scope: !1988)
!2016 = !DILocation(line: 139, column: 22, scope: !1988)
!2017 = !DILocation(line: 139, column: 21, scope: !1988)
!2018 = !DILocation(line: 210, column: 17, scope: !1988)
!2019 = !DILocation(line: 211, column: 19, scope: !1988)
!2020 = !DILocation(line: 217, column: 28, scope: !1988)
!2021 = !DILocation(line: 217, column: 33, scope: !1988)
!2022 = !DILocation(line: 217, column: 25, scope: !1988)
!2023 = !DILocation(line: 137, column: 22, scope: !1988)
!2024 = !DILocation(line: 137, column: 21, scope: !1988)
!2025 = !DILocation(line: 145, column: 17, scope: !1988)
!2026 = !DILocation(line: 146, column: 19, scope: !1988)
!2027 = !DILocation(line: 136, column: 22, scope: !1988)
!2028 = !DILocation(line: 136, column: 21, scope: !1988)
!2029 = !DILocation(line: 143, column: 17, scope: !1988)
!2030 = !DILocation(line: 144, column: 19, scope: !1988)
!2031 = !DILocation(line: 151, column: 28, scope: !1988)
!2032 = !DILocation(line: 151, column: 33, scope: !1988)
!2033 = !DILocation(line: 152, column: 30, scope: !1988)
!2034 = !DILocation(line: 152, column: 17, scope: !1988)
!2035 = !DILocation(line: 141, column: 17, scope: !1988)
!2036 = !DILocation(line: 158, column: 17, scope: !1988)
!2037 = !DILocation(line: 159, column: 19, scope: !1988)
!2038 = !DILocation(line: 162, column: 17, scope: !1988)
!2039 = !DILocation(line: 163, column: 19, scope: !1988)
!2040 = !DILocation(line: 160, column: 17, scope: !1988)
!2041 = !DILocation(line: 161, column: 19, scope: !1988)
!2042 = !DILocation(line: 168, column: 28, scope: !1988)
!2043 = !DILocation(line: 168, column: 33, scope: !1988)
!2044 = !DILocation(line: 168, column: 25, scope: !1988)
!2045 = !DILocation(line: 223, column: 22, scope: !1988)
!2046 = !DILocation(line: 174, column: 17, scope: !1988)
!2047 = !DILocation(line: 175, column: 19, scope: !1988)
!2048 = !DILocation(line: 178, column: 17, scope: !1988)
!2049 = !DILocation(line: 179, column: 19, scope: !1988)
!2050 = !DILocation(line: 176, column: 17, scope: !1988)
!2051 = !DILocation(line: 177, column: 19, scope: !1988)
!2052 = !DILocation(line: 184, column: 28, scope: !1988)
!2053 = !DILocation(line: 184, column: 33, scope: !1988)
!2054 = !DILocation(line: 184, column: 25, scope: !1988)
!2055 = !DILocation(line: 223, column: 26, scope: !1988)
!2056 = !DILocation(line: 190, column: 17, scope: !1988)
!2057 = !DILocation(line: 191, column: 19, scope: !1988)
!2058 = !DILocation(line: 194, column: 17, scope: !1988)
!2059 = !DILocation(line: 195, column: 19, scope: !1988)
!2060 = !DILocation(line: 192, column: 17, scope: !1988)
!2061 = !DILocation(line: 193, column: 19, scope: !1988)
!2062 = !DILocation(line: 200, column: 28, scope: !1988)
!2063 = !DILocation(line: 200, column: 33, scope: !1988)
!2064 = !DILocation(line: 200, column: 25, scope: !1988)
!2065 = !DILocation(line: 223, column: 30, scope: !1988)
!2066 = !DILocation(line: 206, column: 17, scope: !1988)
!2067 = !DILocation(line: 207, column: 19, scope: !1988)
!2068 = !DILocation(line: 216, column: 28, scope: !1988)
!2069 = !DILocation(line: 216, column: 33, scope: !1988)
!2070 = !DILocation(line: 216, column: 25, scope: !1988)
!2071 = !DILocation(line: 223, column: 34, scope: !1988)
!2072 = !DILocation(line: 149, column: 17, scope: !1988)
!2073 = !DILocation(line: 150, column: 19, scope: !1988)
!2074 = !DILocation(line: 147, column: 17, scope: !1988)
!2075 = !DILocation(line: 148, column: 19, scope: !1988)
!2076 = !DILocation(line: 154, column: 28, scope: !1988)
!2077 = !DILocation(line: 154, column: 33, scope: !1988)
!2078 = !DILocation(line: 154, column: 25, scope: !1988)
!2079 = !DILocation(line: 166, column: 17, scope: !1988)
!2080 = !DILocation(line: 167, column: 19, scope: !1988)
!2081 = !DILocation(line: 164, column: 17, scope: !1988)
!2082 = !DILocation(line: 165, column: 19, scope: !1988)
!2083 = !DILocation(line: 170, column: 28, scope: !1988)
!2084 = !DILocation(line: 170, column: 33, scope: !1988)
!2085 = !DILocation(line: 170, column: 25, scope: !1988)
!2086 = !DILocation(line: 225, column: 22, scope: !1988)
!2087 = !DILocation(line: 182, column: 17, scope: !1988)
!2088 = !DILocation(line: 183, column: 19, scope: !1988)
!2089 = !DILocation(line: 180, column: 17, scope: !1988)
!2090 = !DILocation(line: 181, column: 19, scope: !1988)
!2091 = !DILocation(line: 186, column: 28, scope: !1988)
!2092 = !DILocation(line: 186, column: 33, scope: !1988)
!2093 = !DILocation(line: 186, column: 25, scope: !1988)
!2094 = !DILocation(line: 225, column: 26, scope: !1988)
!2095 = !DILocation(line: 198, column: 17, scope: !1988)
!2096 = !DILocation(line: 199, column: 19, scope: !1988)
!2097 = !DILocation(line: 196, column: 17, scope: !1988)
!2098 = !DILocation(line: 197, column: 19, scope: !1988)
!2099 = !DILocation(line: 202, column: 28, scope: !1988)
!2100 = !DILocation(line: 202, column: 33, scope: !1988)
!2101 = !DILocation(line: 202, column: 25, scope: !1988)
!2102 = !DILocation(line: 225, column: 30, scope: !1988)
!2103 = !DILocation(line: 214, column: 17, scope: !1988)
!2104 = !DILocation(line: 215, column: 19, scope: !1988)
!2105 = !DILocation(line: 218, column: 28, scope: !1988)
!2106 = !DILocation(line: 218, column: 33, scope: !1988)
!2107 = !DILocation(line: 218, column: 25, scope: !1988)
!2108 = !DILocation(line: 225, column: 34, scope: !1988)
!2109 = !DILocation(line: 231, column: 22, scope: !1988)
!2110 = !DILocation(line: 231, column: 21, scope: !1988)
!2111 = !DILocation(line: 309, column: 17, scope: !1988)
!2112 = !DILocation(line: 310, column: 19, scope: !1988)
!2113 = !DILocation(line: 171, column: 28, scope: !1988)
!2114 = !DILocation(line: 171, column: 33, scope: !1988)
!2115 = !DILocation(line: 171, column: 25, scope: !1988)
!2116 = !DILocation(line: 156, column: 28, scope: !1988)
!2117 = !DILocation(line: 156, column: 33, scope: !1988)
!2118 = !DILocation(line: 156, column: 25, scope: !1988)
!2119 = !DILocation(line: 172, column: 28, scope: !1988)
!2120 = !DILocation(line: 172, column: 33, scope: !1988)
!2121 = !DILocation(line: 172, column: 25, scope: !1988)
!2122 = !DILocation(line: 227, column: 22, scope: !1988)
!2123 = !DILocation(line: 188, column: 28, scope: !1988)
!2124 = !DILocation(line: 188, column: 33, scope: !1988)
!2125 = !DILocation(line: 188, column: 25, scope: !1988)
!2126 = !DILocation(line: 227, column: 26, scope: !1988)
!2127 = !DILocation(line: 204, column: 28, scope: !1988)
!2128 = !DILocation(line: 204, column: 33, scope: !1988)
!2129 = !DILocation(line: 204, column: 25, scope: !1988)
!2130 = !DILocation(line: 227, column: 30, scope: !1988)
!2131 = !DILocation(line: 220, column: 28, scope: !1988)
!2132 = !DILocation(line: 220, column: 33, scope: !1988)
!2133 = !DILocation(line: 220, column: 25, scope: !1988)
!2134 = !DILocation(line: 227, column: 34, scope: !1988)
!2135 = !DILocation(line: 233, column: 22, scope: !1988)
!2136 = !DILocation(line: 233, column: 21, scope: !1988)
!2137 = !DILocation(line: 303, column: 17, scope: !1988)
!2138 = !DILocation(line: 304, column: 19, scope: !1988)
!2139 = !DILocation(line: 153, column: 28, scope: !1988)
!2140 = !DILocation(line: 153, column: 33, scope: !1988)
!2141 = !DILocation(line: 153, column: 25, scope: !1988)
!2142 = !DILocation(line: 169, column: 28, scope: !1988)
!2143 = !DILocation(line: 169, column: 33, scope: !1988)
!2144 = !DILocation(line: 169, column: 25, scope: !1988)
!2145 = !DILocation(line: 224, column: 22, scope: !1988)
!2146 = !DILocation(line: 185, column: 28, scope: !1988)
!2147 = !DILocation(line: 185, column: 33, scope: !1988)
!2148 = !DILocation(line: 185, column: 25, scope: !1988)
!2149 = !DILocation(line: 224, column: 26, scope: !1988)
!2150 = !DILocation(line: 201, column: 28, scope: !1988)
!2151 = !DILocation(line: 201, column: 33, scope: !1988)
!2152 = !DILocation(line: 201, column: 25, scope: !1988)
!2153 = !DILocation(line: 224, column: 30, scope: !1988)
!2154 = !DILocation(line: 224, column: 34, scope: !1988)
!2155 = !DILocation(line: 155, column: 28, scope: !1988)
!2156 = !DILocation(line: 155, column: 33, scope: !1988)
!2157 = !DILocation(line: 155, column: 25, scope: !1988)
!2158 = !DILocation(line: 226, column: 22, scope: !1988)
!2159 = !DILocation(line: 187, column: 28, scope: !1988)
!2160 = !DILocation(line: 187, column: 33, scope: !1988)
!2161 = !DILocation(line: 187, column: 25, scope: !1988)
!2162 = !DILocation(line: 226, column: 26, scope: !1988)
!2163 = !DILocation(line: 203, column: 28, scope: !1988)
!2164 = !DILocation(line: 203, column: 33, scope: !1988)
!2165 = !DILocation(line: 203, column: 25, scope: !1988)
!2166 = !DILocation(line: 226, column: 30, scope: !1988)
!2167 = !DILocation(line: 219, column: 28, scope: !1988)
!2168 = !DILocation(line: 219, column: 33, scope: !1988)
!2169 = !DILocation(line: 219, column: 25, scope: !1988)
!2170 = !DILocation(line: 226, column: 34, scope: !1988)
!2171 = !DILocation(line: 232, column: 22, scope: !1988)
!2172 = !DILocation(line: 232, column: 21, scope: !1988)
!2173 = !DILocation(line: 301, column: 17, scope: !1988)
!2174 = !DILocation(line: 302, column: 19, scope: !1988)
!2175 = !DILocation(line: 315, column: 28, scope: !1988)
!2176 = !DILocation(line: 315, column: 33, scope: !1988)
!2177 = !DILocation(line: 315, column: 25, scope: !1988)
!2178 = !DILocation(line: 230, column: 22, scope: !1988)
!2179 = !DILocation(line: 230, column: 21, scope: !1988)
!2180 = !DILocation(line: 307, column: 17, scope: !1988)
!2181 = !DILocation(line: 308, column: 19, scope: !1988)
!2182 = !DILocation(line: 314, column: 28, scope: !1988)
!2183 = !DILocation(line: 314, column: 33, scope: !1988)
!2184 = !DILocation(line: 314, column: 25, scope: !1988)
!2185 = !DILocation(line: 234, column: 22, scope: !1988)
!2186 = !DILocation(line: 234, column: 21, scope: !1988)
!2187 = !DILocation(line: 305, column: 17, scope: !1988)
!2188 = !DILocation(line: 306, column: 19, scope: !1988)
!2189 = !DILocation(line: 313, column: 28, scope: !1988)
!2190 = !DILocation(line: 313, column: 33, scope: !1988)
!2191 = !DILocation(line: 313, column: 25, scope: !1988)
!2192 = !DILocation(line: 312, column: 28, scope: !1988)
!2193 = !DILocation(line: 312, column: 33, scope: !1988)
!2194 = !DILocation(line: 312, column: 25, scope: !1988)
!2195 = !DILocation(line: 311, column: 28, scope: !1988)
!2196 = !DILocation(line: 311, column: 33, scope: !1988)
!2197 = !DILocation(line: 311, column: 25, scope: !1988)
!2198 = !DILocation(line: 293, column: 17, scope: !1988)
!2199 = !DILocation(line: 294, column: 19, scope: !1988)
!2200 = !DILocation(line: 287, column: 17, scope: !1988)
!2201 = !DILocation(line: 288, column: 19, scope: !1988)
!2202 = !DILocation(line: 285, column: 17, scope: !1988)
!2203 = !DILocation(line: 286, column: 19, scope: !1988)
!2204 = !DILocation(line: 299, column: 28, scope: !1988)
!2205 = !DILocation(line: 299, column: 33, scope: !1988)
!2206 = !DILocation(line: 299, column: 25, scope: !1988)
!2207 = !DILocation(line: 291, column: 17, scope: !1988)
!2208 = !DILocation(line: 292, column: 19, scope: !1988)
!2209 = !DILocation(line: 298, column: 28, scope: !1988)
!2210 = !DILocation(line: 298, column: 33, scope: !1988)
!2211 = !DILocation(line: 298, column: 25, scope: !1988)
!2212 = !DILocation(line: 289, column: 17, scope: !1988)
!2213 = !DILocation(line: 290, column: 19, scope: !1988)
!2214 = !DILocation(line: 297, column: 28, scope: !1988)
!2215 = !DILocation(line: 297, column: 33, scope: !1988)
!2216 = !DILocation(line: 297, column: 25, scope: !1988)
!2217 = !DILocation(line: 296, column: 28, scope: !1988)
!2218 = !DILocation(line: 296, column: 33, scope: !1988)
!2219 = !DILocation(line: 296, column: 25, scope: !1988)
!2220 = !DILocation(line: 295, column: 28, scope: !1988)
!2221 = !DILocation(line: 295, column: 33, scope: !1988)
!2222 = !DILocation(line: 295, column: 25, scope: !1988)
!2223 = !DILocation(line: 277, column: 17, scope: !1988)
!2224 = !DILocation(line: 278, column: 19, scope: !1988)
!2225 = !DILocation(line: 271, column: 17, scope: !1988)
!2226 = !DILocation(line: 272, column: 19, scope: !1988)
!2227 = !DILocation(line: 269, column: 17, scope: !1988)
!2228 = !DILocation(line: 270, column: 19, scope: !1988)
!2229 = !DILocation(line: 283, column: 28, scope: !1988)
!2230 = !DILocation(line: 283, column: 33, scope: !1988)
!2231 = !DILocation(line: 283, column: 25, scope: !1988)
!2232 = !DILocation(line: 275, column: 17, scope: !1988)
!2233 = !DILocation(line: 276, column: 19, scope: !1988)
!2234 = !DILocation(line: 282, column: 28, scope: !1988)
!2235 = !DILocation(line: 282, column: 33, scope: !1988)
!2236 = !DILocation(line: 282, column: 25, scope: !1988)
!2237 = !DILocation(line: 273, column: 17, scope: !1988)
!2238 = !DILocation(line: 274, column: 19, scope: !1988)
!2239 = !DILocation(line: 281, column: 28, scope: !1988)
!2240 = !DILocation(line: 281, column: 33, scope: !1988)
!2241 = !DILocation(line: 281, column: 25, scope: !1988)
!2242 = !DILocation(line: 280, column: 28, scope: !1988)
!2243 = !DILocation(line: 280, column: 33, scope: !1988)
!2244 = !DILocation(line: 280, column: 25, scope: !1988)
!2245 = !DILocation(line: 279, column: 28, scope: !1988)
!2246 = !DILocation(line: 279, column: 33, scope: !1988)
!2247 = !DILocation(line: 279, column: 25, scope: !1988)
!2248 = !DILocation(line: 261, column: 17, scope: !1988)
!2249 = !DILocation(line: 262, column: 19, scope: !1988)
!2250 = !DILocation(line: 255, column: 17, scope: !1988)
!2251 = !DILocation(line: 256, column: 19, scope: !1988)
!2252 = !DILocation(line: 253, column: 17, scope: !1988)
!2253 = !DILocation(line: 254, column: 19, scope: !1988)
!2254 = !DILocation(line: 267, column: 28, scope: !1988)
!2255 = !DILocation(line: 267, column: 33, scope: !1988)
!2256 = !DILocation(line: 267, column: 25, scope: !1988)
!2257 = !DILocation(line: 259, column: 17, scope: !1988)
!2258 = !DILocation(line: 260, column: 19, scope: !1988)
!2259 = !DILocation(line: 266, column: 28, scope: !1988)
!2260 = !DILocation(line: 266, column: 33, scope: !1988)
!2261 = !DILocation(line: 266, column: 25, scope: !1988)
!2262 = !DILocation(line: 257, column: 17, scope: !1988)
!2263 = !DILocation(line: 258, column: 19, scope: !1988)
!2264 = !DILocation(line: 265, column: 28, scope: !1988)
!2265 = !DILocation(line: 265, column: 33, scope: !1988)
!2266 = !DILocation(line: 265, column: 25, scope: !1988)
!2267 = !DILocation(line: 264, column: 28, scope: !1988)
!2268 = !DILocation(line: 264, column: 33, scope: !1988)
!2269 = !DILocation(line: 264, column: 25, scope: !1988)
!2270 = !DILocation(line: 263, column: 28, scope: !1988)
!2271 = !DILocation(line: 263, column: 33, scope: !1988)
!2272 = !DILocation(line: 263, column: 25, scope: !1988)
!2273 = !DILocation(line: 244, column: 17, scope: !1988)
!2274 = !DILocation(line: 245, column: 19, scope: !1988)
!2275 = !DILocation(line: 238, column: 17, scope: !1988)
!2276 = !DILocation(line: 239, column: 19, scope: !1988)
!2277 = !DILocation(line: 236, column: 17, scope: !1988)
!2278 = !DILocation(line: 251, column: 28, scope: !1988)
!2279 = !DILocation(line: 251, column: 33, scope: !1988)
!2280 = !DILocation(line: 251, column: 25, scope: !1988)
!2281 = !DILocation(line: 242, column: 17, scope: !1988)
!2282 = !DILocation(line: 243, column: 19, scope: !1988)
!2283 = !DILocation(line: 250, column: 28, scope: !1988)
!2284 = !DILocation(line: 250, column: 33, scope: !1988)
!2285 = !DILocation(line: 250, column: 25, scope: !1988)
!2286 = !DILocation(line: 240, column: 17, scope: !1988)
!2287 = !DILocation(line: 241, column: 19, scope: !1988)
!2288 = !DILocation(line: 249, column: 28, scope: !1988)
!2289 = !DILocation(line: 249, column: 33, scope: !1988)
!2290 = !DILocation(line: 249, column: 25, scope: !1988)
!2291 = !DILocation(line: 248, column: 28, scope: !1988)
!2292 = !DILocation(line: 248, column: 33, scope: !1988)
!2293 = !DILocation(line: 248, column: 25, scope: !1988)
!2294 = !DILocation(line: 247, column: 58, scope: !1988)
!2295 = !DILocation(line: 247, column: 30, scope: !1988)
!2296 = !DILocation(line: 246, column: 28, scope: !1988)
!2297 = !DILocation(line: 246, column: 33, scope: !1988)
!2298 = !DILocation(line: 247, column: 17, scope: !1988)
!2299 = !DILocation(line: 126, column: 47, scope: !1950)
!2300 = !DILocation(line: 126, column: 9, scope: !1950)
!2301 = distinct !{!2301, !1951, !2302, !235}
!2302 = !DILocation(line: 316, column: 9, scope: !1947)
!2303 = !DILocation(line: 319, column: 19, scope: !1892)
!2304 = !DILocation(line: 320, column: 9, scope: !1892)
!2305 = !DILocation(line: 320, column: 19, scope: !1892)
!2306 = !DILocation(line: 321, column: 9, scope: !1892)
!2307 = !DILocation(line: 321, column: 19, scope: !1892)
!2308 = !DILocation(line: 322, column: 9, scope: !1892)
!2309 = !DILocation(line: 322, column: 19, scope: !1892)
!2310 = !DILocation(line: 323, column: 9, scope: !1892)
!2311 = !DILocation(line: 323, column: 19, scope: !1892)
!2312 = !DILocation(line: 324, column: 9, scope: !1892)
!2313 = !DILocation(line: 324, column: 19, scope: !1892)
!2314 = !DILocation(line: 325, column: 9, scope: !1892)
!2315 = !DILocation(line: 325, column: 19, scope: !1892)
!2316 = !DILocation(line: 326, column: 9, scope: !1892)
!2317 = !DILocation(line: 326, column: 19, scope: !1892)
!2318 = !DILocation(line: 327, column: 9, scope: !1892)
!2319 = !DILocation(line: 327, column: 19, scope: !1892)
!2320 = !DILocation(line: 328, column: 9, scope: !1892)
!2321 = !DILocation(line: 328, column: 19, scope: !1892)
!2322 = !DILocation(line: 329, column: 9, scope: !1892)
!2323 = !DILocation(line: 329, column: 19, scope: !1892)
!2324 = !DILocation(line: 330, column: 9, scope: !1892)
!2325 = !DILocation(line: 330, column: 19, scope: !1892)
!2326 = !DILocation(line: 331, column: 9, scope: !1892)
!2327 = !DILocation(line: 331, column: 19, scope: !1892)
!2328 = !DILocation(line: 332, column: 9, scope: !1892)
!2329 = !DILocation(line: 332, column: 19, scope: !1892)
!2330 = !DILocation(line: 333, column: 9, scope: !1892)
!2331 = !DILocation(line: 333, column: 19, scope: !1892)
!2332 = !DILocation(line: 334, column: 9, scope: !1892)
!2333 = !DILocation(line: 334, column: 19, scope: !1892)
!2334 = !DILocation(line: 335, column: 9, scope: !1892)
!2335 = !DILocation(line: 335, column: 19, scope: !1892)
!2336 = !DILocation(line: 336, column: 9, scope: !1892)
!2337 = !DILocation(line: 336, column: 19, scope: !1892)
!2338 = !DILocation(line: 337, column: 9, scope: !1892)
!2339 = !DILocation(line: 337, column: 19, scope: !1892)
!2340 = !DILocation(line: 338, column: 9, scope: !1892)
!2341 = !DILocation(line: 338, column: 19, scope: !1892)
!2342 = !DILocation(line: 339, column: 9, scope: !1892)
!2343 = !DILocation(line: 339, column: 19, scope: !1892)
!2344 = !DILocation(line: 340, column: 9, scope: !1892)
!2345 = !DILocation(line: 340, column: 19, scope: !1892)
!2346 = !DILocation(line: 341, column: 9, scope: !1892)
!2347 = !DILocation(line: 341, column: 19, scope: !1892)
!2348 = !DILocation(line: 342, column: 9, scope: !1892)
!2349 = !DILocation(line: 342, column: 19, scope: !1892)
!2350 = !DILocation(line: 343, column: 9, scope: !1892)
!2351 = !DILocation(line: 343, column: 19, scope: !1892)
!2352 = !DILocation(line: 344, column: 1, scope: !1892)
!2353 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !1791, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2354 = !DILocalVariable(name: "state", arg: 1, scope: !2353, file: !27, line: 550, type: !1793)
!2355 = !DILocation(line: 0, scope: !2353)
!2356 = !DILocation(line: 552, column: 36, scope: !2353)
!2357 = !DILocation(line: 552, column: 3, scope: !2353)
!2358 = !DILocation(line: 553, column: 10, scope: !2353)
!2359 = !DILocation(line: 553, column: 14, scope: !2353)
!2360 = !DILocation(line: 554, column: 1, scope: !2353)
!2361 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2362, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2362 = !DISubroutineType(types: !2363)
!2363 = !{null, !1808, !42, !42, !61}
!2364 = !DILocalVariable(name: "s", arg: 1, scope: !2361, file: !27, line: 405, type: !1808)
!2365 = !DILocation(line: 0, scope: !2361)
!2366 = !DILocalVariable(name: "pos", arg: 2, scope: !2361, file: !27, line: 405, type: !42)
!2367 = !DILocalVariable(name: "r", arg: 3, scope: !2361, file: !27, line: 405, type: !42)
!2368 = !DILocalVariable(name: "p", arg: 4, scope: !2361, file: !27, line: 405, type: !61)
!2369 = !DILocation(line: 407, column: 15, scope: !2361)
!2370 = !DILocation(line: 407, column: 31, scope: !2361)
!2371 = !DILocation(line: 407, column: 27, scope: !2361)
!2372 = !DILocation(line: 407, column: 8, scope: !2361)
!2373 = !DILocation(line: 407, column: 3, scope: !2361)
!2374 = !DILocation(line: 407, column: 12, scope: !2361)
!2375 = !DILocation(line: 408, column: 6, scope: !2361)
!2376 = !DILocation(line: 408, column: 3, scope: !2361)
!2377 = !DILocation(line: 408, column: 12, scope: !2361)
!2378 = !DILocation(line: 409, column: 1, scope: !2361)
!2379 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2380, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2380 = !DISubroutineType(types: !2381)
!2381 = !{null, !60, !1723, !1793}
!2382 = !DILocalVariable(name: "out", arg: 1, scope: !2379, file: !27, line: 566, type: !60)
!2383 = !DILocation(line: 0, scope: !2379)
!2384 = !DILocalVariable(name: "outlen", arg: 2, scope: !2379, file: !27, line: 566, type: !1723)
!2385 = !DILocalVariable(name: "state", arg: 3, scope: !2379, file: !27, line: 566, type: !1793)
!2386 = !DILocation(line: 568, column: 61, scope: !2379)
!2387 = !DILocation(line: 568, column: 16, scope: !2379)
!2388 = !DILocation(line: 568, column: 10, scope: !2379)
!2389 = !DILocation(line: 568, column: 14, scope: !2379)
!2390 = !DILocation(line: 569, column: 1, scope: !2379)
!2391 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2392, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2392 = !DISubroutineType(types: !2393)
!2393 = !{!42, !60, !1723, !1808, !42, !42}
!2394 = !DILocalVariable(name: "out", arg: 1, scope: !2391, file: !27, line: 426, type: !60)
!2395 = !DILocation(line: 0, scope: !2391)
!2396 = !DILocalVariable(name: "outlen", arg: 2, scope: !2391, file: !27, line: 427, type: !1723)
!2397 = !DILocalVariable(name: "s", arg: 3, scope: !2391, file: !27, line: 428, type: !1808)
!2398 = !DILocalVariable(name: "pos", arg: 4, scope: !2391, file: !27, line: 429, type: !42)
!2399 = !DILocalVariable(name: "r", arg: 5, scope: !2391, file: !27, line: 430, type: !42)
!2400 = !DILocation(line: 434, column: 3, scope: !2391)
!2401 = !DILocation(line: 435, column: 12, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2403, file: !27, line: 435, column: 8)
!2403 = distinct !DILexicalBlock(scope: !2391, file: !27, line: 434, column: 17)
!2404 = !DILocation(line: 436, column: 7, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2402, file: !27, line: 435, column: 18)
!2406 = !DILocation(line: 438, column: 5, scope: !2405)
!2407 = !DILocalVariable(name: "i", scope: !2391, file: !27, line: 432, type: !42)
!2408 = !DILocation(line: 439, column: 9, scope: !2409)
!2409 = distinct !DILexicalBlock(scope: !2403, file: !27, line: 439, column: 5)
!2410 = !DILocation(line: 439, scope: !2409)
!2411 = !DILocation(line: 439, column: 17, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2409, file: !27, line: 439, column: 5)
!2413 = !DILocation(line: 439, column: 21, scope: !2412)
!2414 = !DILocation(line: 439, column: 5, scope: !2409)
!2415 = !DILocation(line: 440, column: 19, scope: !2412)
!2416 = !DILocation(line: 440, column: 16, scope: !2412)
!2417 = !DILocation(line: 440, column: 27, scope: !2412)
!2418 = !DILocation(line: 440, column: 23, scope: !2412)
!2419 = !DILocation(line: 440, column: 14, scope: !2412)
!2420 = !DILocation(line: 440, column: 11, scope: !2412)
!2421 = !DILocation(line: 439, column: 41, scope: !2412)
!2422 = !DILocation(line: 439, column: 5, scope: !2412)
!2423 = distinct !{!2423, !2414, !2424, !235}
!2424 = !DILocation(line: 440, column: 32, scope: !2409)
!2425 = !DILocation(line: 441, column: 16, scope: !2403)
!2426 = !DILocation(line: 441, column: 12, scope: !2403)
!2427 = distinct !{!2427, !2400, !2428, !235}
!2428 = !DILocation(line: 443, column: 3, scope: !2391)
!2429 = !DILocation(line: 445, column: 3, scope: !2391)
!2430 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !1826, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2431 = !DILocalVariable(name: "state", arg: 1, scope: !2430, file: !27, line: 580, type: !1793)
!2432 = !DILocation(line: 0, scope: !2430)
!2433 = !DILocalVariable(name: "in", arg: 2, scope: !2430, file: !27, line: 580, type: !64)
!2434 = !DILocalVariable(name: "inlen", arg: 3, scope: !2430, file: !27, line: 580, type: !1723)
!2435 = !DILocation(line: 582, column: 3, scope: !2430)
!2436 = !DILocation(line: 583, column: 10, scope: !2430)
!2437 = !DILocation(line: 583, column: 14, scope: !2430)
!2438 = !DILocation(line: 584, column: 1, scope: !2430)
!2439 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2440, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2440 = !DISubroutineType(types: !2441)
!2441 = !{null, !1808, !42, !64, !1723, !61}
!2442 = !DILocalVariable(name: "s", arg: 1, scope: !2439, file: !27, line: 461, type: !1808)
!2443 = !DILocation(line: 0, scope: !2439)
!2444 = !DILocalVariable(name: "r", arg: 2, scope: !2439, file: !27, line: 462, type: !42)
!2445 = !DILocalVariable(name: "in", arg: 3, scope: !2439, file: !27, line: 463, type: !64)
!2446 = !DILocalVariable(name: "inlen", arg: 4, scope: !2439, file: !27, line: 464, type: !1723)
!2447 = !DILocalVariable(name: "p", arg: 5, scope: !2439, file: !27, line: 465, type: !61)
!2448 = !DILocalVariable(name: "i", scope: !2439, file: !27, line: 467, type: !42)
!2449 = !DILocation(line: 469, column: 7, scope: !2450)
!2450 = distinct !DILexicalBlock(scope: !2439, file: !27, line: 469, column: 3)
!2451 = !DILocation(line: 469, scope: !2450)
!2452 = !DILocation(line: 469, column: 12, scope: !2453)
!2453 = distinct !DILexicalBlock(scope: !2450, file: !27, line: 469, column: 3)
!2454 = !DILocation(line: 469, column: 3, scope: !2450)
!2455 = !DILocation(line: 472, column: 3, scope: !2439)
!2456 = !DILocation(line: 470, column: 5, scope: !2453)
!2457 = !DILocation(line: 470, column: 10, scope: !2453)
!2458 = !DILocation(line: 469, column: 17, scope: !2453)
!2459 = !DILocation(line: 469, column: 3, scope: !2453)
!2460 = distinct !{!2460, !2454, !2461, !235}
!2461 = !DILocation(line: 470, column: 12, scope: !2450)
!2462 = !DILocation(line: 472, column: 15, scope: !2439)
!2463 = !DILocation(line: 473, column: 5, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2465, file: !27, line: 473, column: 5)
!2465 = distinct !DILexicalBlock(scope: !2439, file: !27, line: 472, column: 21)
!2466 = !DILocation(line: 480, column: 3, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2439, file: !27, line: 480, column: 3)
!2468 = !DILocation(line: 473, scope: !2464)
!2469 = !DILocation(line: 473, column: 14, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !2464, file: !27, line: 473, column: 5)
!2471 = !DILocation(line: 474, column: 26, scope: !2470)
!2472 = !DILocation(line: 474, column: 24, scope: !2470)
!2473 = !DILocation(line: 474, column: 15, scope: !2470)
!2474 = !DILocation(line: 474, column: 7, scope: !2470)
!2475 = !DILocation(line: 474, column: 12, scope: !2470)
!2476 = !DILocation(line: 473, column: 20, scope: !2470)
!2477 = !DILocation(line: 473, column: 5, scope: !2470)
!2478 = distinct !{!2478, !2463, !2479, !235}
!2479 = !DILocation(line: 474, column: 28, scope: !2464)
!2480 = !DILocation(line: 475, column: 8, scope: !2465)
!2481 = !DILocation(line: 476, column: 11, scope: !2465)
!2482 = !DILocation(line: 477, column: 5, scope: !2465)
!2483 = distinct !{!2483, !2455, !2484, !235}
!2484 = !DILocation(line: 478, column: 3, scope: !2439)
!2485 = !DILocation(line: 480, scope: !2467)
!2486 = !DILocation(line: 480, column: 12, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2467, file: !27, line: 480, column: 3)
!2488 = !DILocation(line: 481, column: 25, scope: !2487)
!2489 = !DILocation(line: 481, column: 15, scope: !2487)
!2490 = !DILocation(line: 481, column: 35, scope: !2487)
!2491 = !DILocation(line: 481, column: 31, scope: !2487)
!2492 = !DILocation(line: 481, column: 8, scope: !2487)
!2493 = !DILocation(line: 481, column: 5, scope: !2487)
!2494 = !DILocation(line: 481, column: 12, scope: !2487)
!2495 = !DILocation(line: 480, column: 20, scope: !2487)
!2496 = !DILocation(line: 480, column: 3, scope: !2487)
!2497 = distinct !{!2497, !2466, !2498, !235}
!2498 = !DILocation(line: 481, column: 40, scope: !2467)
!2499 = !DILocation(line: 483, column: 13, scope: !2439)
!2500 = !DILocation(line: 483, column: 29, scope: !2439)
!2501 = !DILocation(line: 483, column: 25, scope: !2439)
!2502 = !DILocation(line: 483, column: 6, scope: !2439)
!2503 = !DILocation(line: 483, column: 3, scope: !2439)
!2504 = !DILocation(line: 483, column: 10, scope: !2439)
!2505 = !DILocation(line: 484, column: 7, scope: !2439)
!2506 = !DILocation(line: 484, column: 10, scope: !2439)
!2507 = !DILocation(line: 484, column: 3, scope: !2439)
!2508 = !DILocation(line: 484, column: 14, scope: !2439)
!2509 = !DILocation(line: 485, column: 1, scope: !2439)
!2510 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2511, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2511 = !DISubroutineType(types: !2512)
!2512 = !{!23, !64}
!2513 = !DILocalVariable(name: "x", arg: 1, scope: !2510, file: !27, line: 22, type: !64)
!2514 = !DILocation(line: 0, scope: !2510)
!2515 = !DILocalVariable(name: "r", scope: !2510, file: !27, line: 24, type: !23)
!2516 = !DILocalVariable(name: "i", scope: !2510, file: !27, line: 23, type: !42)
!2517 = !DILocation(line: 26, column: 7, scope: !2518)
!2518 = distinct !DILexicalBlock(scope: !2510, file: !27, line: 26, column: 3)
!2519 = !DILocation(line: 26, scope: !2518)
!2520 = !DILocation(line: 26, column: 12, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2518, file: !27, line: 26, column: 3)
!2522 = !DILocation(line: 26, column: 3, scope: !2518)
!2523 = !DILocation(line: 27, column: 20, scope: !2521)
!2524 = !DILocation(line: 27, column: 10, scope: !2521)
!2525 = !DILocation(line: 27, column: 29, scope: !2521)
!2526 = !DILocation(line: 27, column: 25, scope: !2521)
!2527 = !DILocation(line: 27, column: 7, scope: !2521)
!2528 = !DILocation(line: 26, column: 16, scope: !2521)
!2529 = !DILocation(line: 26, column: 3, scope: !2521)
!2530 = distinct !{!2530, !2522, !2531, !235}
!2531 = !DILocation(line: 27, column: 30, scope: !2518)
!2532 = !DILocation(line: 29, column: 3, scope: !2510)
!2533 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2380, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2534 = !DILocalVariable(name: "out", arg: 1, scope: !2533, file: !27, line: 598, type: !60)
!2535 = !DILocation(line: 0, scope: !2533)
!2536 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2533, file: !27, line: 598, type: !1723)
!2537 = !DILocalVariable(name: "state", arg: 3, scope: !2533, file: !27, line: 598, type: !1793)
!2538 = !DILocation(line: 600, column: 3, scope: !2533)
!2539 = !DILocation(line: 601, column: 1, scope: !2533)
!2540 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2541, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2541 = !DISubroutineType(types: !2542)
!2542 = !{null, !60, !1723, !1808, !42}
!2543 = !DILocalVariable(name: "out", arg: 1, scope: !2540, file: !27, line: 500, type: !60)
!2544 = !DILocation(line: 0, scope: !2540)
!2545 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2540, file: !27, line: 501, type: !1723)
!2546 = !DILocalVariable(name: "s", arg: 3, scope: !2540, file: !27, line: 502, type: !1808)
!2547 = !DILocalVariable(name: "r", arg: 4, scope: !2540, file: !27, line: 503, type: !42)
!2548 = !DILocation(line: 507, column: 3, scope: !2540)
!2549 = !DILocation(line: 508, column: 5, scope: !2550)
!2550 = distinct !DILexicalBlock(scope: !2540, file: !27, line: 507, column: 18)
!2551 = !DILocalVariable(name: "i", scope: !2540, file: !27, line: 505, type: !42)
!2552 = !DILocation(line: 509, column: 9, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2550, file: !27, line: 509, column: 5)
!2554 = !DILocation(line: 509, scope: !2553)
!2555 = !DILocation(line: 509, column: 14, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2553, file: !27, line: 509, column: 5)
!2557 = !DILocation(line: 509, column: 5, scope: !2553)
!2558 = !DILocation(line: 510, column: 20, scope: !2556)
!2559 = !DILocation(line: 510, column: 18, scope: !2556)
!2560 = !DILocation(line: 510, column: 24, scope: !2556)
!2561 = !DILocation(line: 510, column: 7, scope: !2556)
!2562 = !DILocation(line: 509, column: 20, scope: !2556)
!2563 = !DILocation(line: 509, column: 5, scope: !2556)
!2564 = distinct !{!2564, !2557, !2565, !235}
!2565 = !DILocation(line: 510, column: 28, scope: !2553)
!2566 = !DILocation(line: 511, column: 9, scope: !2550)
!2567 = !DILocation(line: 512, column: 13, scope: !2550)
!2568 = distinct !{!2568, !2548, !2569, !235}
!2569 = !DILocation(line: 513, column: 3, scope: !2540)
!2570 = !DILocation(line: 514, column: 1, scope: !2540)
!2571 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2572, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2572 = !DISubroutineType(types: !2573)
!2573 = !{null, !60, !23}
!2574 = !DILocalVariable(name: "x", arg: 1, scope: !2571, file: !27, line: 40, type: !60)
!2575 = !DILocation(line: 0, scope: !2571)
!2576 = !DILocalVariable(name: "u", arg: 2, scope: !2571, file: !27, line: 40, type: !23)
!2577 = !DILocalVariable(name: "i", scope: !2571, file: !27, line: 41, type: !42)
!2578 = !DILocation(line: 43, column: 7, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2571, file: !27, line: 43, column: 3)
!2580 = !DILocation(line: 43, scope: !2579)
!2581 = !DILocation(line: 43, column: 12, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2579, file: !27, line: 43, column: 3)
!2583 = !DILocation(line: 43, column: 3, scope: !2579)
!2584 = !DILocation(line: 44, column: 18, scope: !2582)
!2585 = !DILocation(line: 44, column: 14, scope: !2582)
!2586 = !DILocation(line: 44, column: 12, scope: !2582)
!2587 = !DILocation(line: 44, column: 5, scope: !2582)
!2588 = !DILocation(line: 44, column: 10, scope: !2582)
!2589 = !DILocation(line: 43, column: 16, scope: !2582)
!2590 = !DILocation(line: 43, column: 3, scope: !2582)
!2591 = distinct !{!2591, !2583, !2592, !235}
!2592 = !DILocation(line: 44, column: 19, scope: !2579)
!2593 = !DILocation(line: 45, column: 1, scope: !2571)
!2594 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !1791, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2595 = !DILocalVariable(name: "state", arg: 1, scope: !2594, file: !27, line: 610, type: !1793)
!2596 = !DILocation(line: 0, scope: !2594)
!2597 = !DILocation(line: 612, column: 3, scope: !2594)
!2598 = !DILocation(line: 613, column: 10, scope: !2594)
!2599 = !DILocation(line: 613, column: 14, scope: !2594)
!2600 = !DILocation(line: 614, column: 1, scope: !2594)
!2601 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !1826, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2602 = !DILocalVariable(name: "state", arg: 1, scope: !2601, file: !27, line: 625, type: !1793)
!2603 = !DILocation(line: 0, scope: !2601)
!2604 = !DILocalVariable(name: "in", arg: 2, scope: !2601, file: !27, line: 625, type: !64)
!2605 = !DILocalVariable(name: "inlen", arg: 3, scope: !2601, file: !27, line: 625, type: !1723)
!2606 = !DILocation(line: 627, column: 47, scope: !2601)
!2607 = !DILocation(line: 627, column: 16, scope: !2601)
!2608 = !DILocation(line: 627, column: 10, scope: !2601)
!2609 = !DILocation(line: 627, column: 14, scope: !2601)
!2610 = !DILocation(line: 628, column: 1, scope: !2601)
!2611 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !1791, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2612 = !DILocalVariable(name: "state", arg: 1, scope: !2611, file: !27, line: 637, type: !1793)
!2613 = !DILocation(line: 0, scope: !2611)
!2614 = !DILocation(line: 639, column: 36, scope: !2611)
!2615 = !DILocation(line: 639, column: 3, scope: !2611)
!2616 = !DILocation(line: 640, column: 10, scope: !2611)
!2617 = !DILocation(line: 640, column: 14, scope: !2611)
!2618 = !DILocation(line: 641, column: 1, scope: !2611)
!2619 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2380, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2620 = !DILocalVariable(name: "out", arg: 1, scope: !2619, file: !27, line: 653, type: !60)
!2621 = !DILocation(line: 0, scope: !2619)
!2622 = !DILocalVariable(name: "outlen", arg: 2, scope: !2619, file: !27, line: 653, type: !1723)
!2623 = !DILocalVariable(name: "state", arg: 3, scope: !2619, file: !27, line: 653, type: !1793)
!2624 = !DILocation(line: 655, column: 61, scope: !2619)
!2625 = !DILocation(line: 655, column: 16, scope: !2619)
!2626 = !DILocation(line: 655, column: 10, scope: !2619)
!2627 = !DILocation(line: 655, column: 14, scope: !2619)
!2628 = !DILocation(line: 656, column: 1, scope: !2619)
!2629 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !1826, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2630 = !DILocalVariable(name: "state", arg: 1, scope: !2629, file: !27, line: 667, type: !1793)
!2631 = !DILocation(line: 0, scope: !2629)
!2632 = !DILocalVariable(name: "in", arg: 2, scope: !2629, file: !27, line: 667, type: !64)
!2633 = !DILocalVariable(name: "inlen", arg: 3, scope: !2629, file: !27, line: 667, type: !1723)
!2634 = !DILocation(line: 669, column: 3, scope: !2629)
!2635 = !DILocation(line: 670, column: 10, scope: !2629)
!2636 = !DILocation(line: 670, column: 14, scope: !2629)
!2637 = !DILocation(line: 671, column: 1, scope: !2629)
!2638 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2380, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2639 = !DILocalVariable(name: "out", arg: 1, scope: !2638, file: !27, line: 685, type: !60)
!2640 = !DILocation(line: 0, scope: !2638)
!2641 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2638, file: !27, line: 685, type: !1723)
!2642 = !DILocalVariable(name: "state", arg: 3, scope: !2638, file: !27, line: 685, type: !1793)
!2643 = !DILocation(line: 687, column: 3, scope: !2638)
!2644 = !DILocation(line: 688, column: 1, scope: !2638)
!2645 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2646, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2646 = !DISubroutineType(types: !2647)
!2647 = !{null, !60, !1723, !64, !1723}
!2648 = !DILocalVariable(name: "out", arg: 1, scope: !2645, file: !27, line: 700, type: !60)
!2649 = !DILocation(line: 0, scope: !2645)
!2650 = !DILocalVariable(name: "outlen", arg: 2, scope: !2645, file: !27, line: 700, type: !1723)
!2651 = !DILocalVariable(name: "in", arg: 3, scope: !2645, file: !27, line: 700, type: !64)
!2652 = !DILocalVariable(name: "inlen", arg: 4, scope: !2645, file: !27, line: 700, type: !1723)
!2653 = !DILocalVariable(name: "state", scope: !2645, file: !27, line: 703, type: !1794)
!2654 = !DILocation(line: 703, column: 16, scope: !2645)
!2655 = !DILocation(line: 705, column: 3, scope: !2645)
!2656 = !DILocation(line: 706, column: 19, scope: !2645)
!2657 = !DILocalVariable(name: "nblocks", scope: !2645, file: !27, line: 702, type: !1723)
!2658 = !DILocation(line: 707, column: 3, scope: !2645)
!2659 = !DILocation(line: 708, column: 20, scope: !2645)
!2660 = !DILocation(line: 708, column: 10, scope: !2645)
!2661 = !DILocation(line: 709, column: 17, scope: !2645)
!2662 = !DILocation(line: 709, column: 7, scope: !2645)
!2663 = !DILocation(line: 710, column: 3, scope: !2645)
!2664 = !DILocation(line: 711, column: 1, scope: !2645)
!2665 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2646, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2666 = !DILocalVariable(name: "out", arg: 1, scope: !2665, file: !27, line: 723, type: !60)
!2667 = !DILocation(line: 0, scope: !2665)
!2668 = !DILocalVariable(name: "outlen", arg: 2, scope: !2665, file: !27, line: 723, type: !1723)
!2669 = !DILocalVariable(name: "in", arg: 3, scope: !2665, file: !27, line: 723, type: !64)
!2670 = !DILocalVariable(name: "inlen", arg: 4, scope: !2665, file: !27, line: 723, type: !1723)
!2671 = !DILocalVariable(name: "state", scope: !2665, file: !27, line: 726, type: !1794)
!2672 = !DILocation(line: 726, column: 16, scope: !2665)
!2673 = !DILocation(line: 728, column: 3, scope: !2665)
!2674 = !DILocation(line: 729, column: 19, scope: !2665)
!2675 = !DILocalVariable(name: "nblocks", scope: !2665, file: !27, line: 725, type: !1723)
!2676 = !DILocation(line: 730, column: 3, scope: !2665)
!2677 = !DILocation(line: 731, column: 20, scope: !2665)
!2678 = !DILocation(line: 731, column: 10, scope: !2665)
!2679 = !DILocation(line: 732, column: 17, scope: !2665)
!2680 = !DILocation(line: 732, column: 7, scope: !2665)
!2681 = !DILocation(line: 733, column: 3, scope: !2665)
!2682 = !DILocation(line: 734, column: 1, scope: !2665)
!2683 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2684, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2684 = !DISubroutineType(types: !2685)
!2685 = !{null, !60, !64, !1723}
!2686 = !DILocalVariable(name: "h", arg: 1, scope: !2683, file: !27, line: 745, type: !60)
!2687 = !DILocation(line: 0, scope: !2683)
!2688 = !DILocalVariable(name: "in", arg: 2, scope: !2683, file: !27, line: 745, type: !64)
!2689 = !DILocalVariable(name: "inlen", arg: 3, scope: !2683, file: !27, line: 745, type: !1723)
!2690 = !DILocalVariable(name: "s", scope: !2683, file: !27, line: 748, type: !194)
!2691 = !DILocation(line: 748, column: 12, scope: !2683)
!2692 = !DILocation(line: 750, column: 3, scope: !2683)
!2693 = !DILocation(line: 751, column: 3, scope: !2683)
!2694 = !DILocalVariable(name: "i", scope: !2683, file: !27, line: 747, type: !42)
!2695 = !DILocation(line: 752, column: 7, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2683, file: !27, line: 752, column: 3)
!2697 = !DILocation(line: 752, scope: !2696)
!2698 = !DILocation(line: 752, column: 12, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2696, file: !27, line: 752, column: 3)
!2700 = !DILocation(line: 752, column: 3, scope: !2696)
!2701 = !DILocation(line: 753, column: 16, scope: !2699)
!2702 = !DILocation(line: 753, column: 14, scope: !2699)
!2703 = !DILocation(line: 753, column: 19, scope: !2699)
!2704 = !DILocation(line: 753, column: 5, scope: !2699)
!2705 = !DILocation(line: 752, column: 16, scope: !2699)
!2706 = !DILocation(line: 752, column: 3, scope: !2699)
!2707 = distinct !{!2707, !2700, !2708, !235}
!2708 = !DILocation(line: 753, column: 23, scope: !2696)
!2709 = !DILocation(line: 754, column: 1, scope: !2683)
!2710 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2684, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2711 = !DILocalVariable(name: "h", arg: 1, scope: !2710, file: !27, line: 765, type: !60)
!2712 = !DILocation(line: 0, scope: !2710)
!2713 = !DILocalVariable(name: "in", arg: 2, scope: !2710, file: !27, line: 765, type: !64)
!2714 = !DILocalVariable(name: "inlen", arg: 3, scope: !2710, file: !27, line: 765, type: !1723)
!2715 = !DILocalVariable(name: "s", scope: !2710, file: !27, line: 768, type: !194)
!2716 = !DILocation(line: 768, column: 12, scope: !2710)
!2717 = !DILocation(line: 770, column: 3, scope: !2710)
!2718 = !DILocation(line: 771, column: 3, scope: !2710)
!2719 = !DILocalVariable(name: "i", scope: !2710, file: !27, line: 767, type: !42)
!2720 = !DILocation(line: 772, column: 7, scope: !2721)
!2721 = distinct !DILexicalBlock(scope: !2710, file: !27, line: 772, column: 3)
!2722 = !DILocation(line: 772, scope: !2721)
!2723 = !DILocation(line: 772, column: 12, scope: !2724)
!2724 = distinct !DILexicalBlock(scope: !2721, file: !27, line: 772, column: 3)
!2725 = !DILocation(line: 772, column: 3, scope: !2721)
!2726 = !DILocation(line: 773, column: 16, scope: !2724)
!2727 = !DILocation(line: 773, column: 14, scope: !2724)
!2728 = !DILocation(line: 773, column: 19, scope: !2724)
!2729 = !DILocation(line: 773, column: 5, scope: !2724)
!2730 = !DILocation(line: 772, column: 16, scope: !2724)
!2731 = !DILocation(line: 772, column: 3, scope: !2724)
!2732 = distinct !{!2732, !2725, !2733, !235}
!2733 = !DILocation(line: 773, column: 23, scope: !2721)
!2734 = !DILocation(line: 774, column: 1, scope: !2710)
!2735 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2736, file: !2736, line: 18, type: !2737, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2736 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2737 = !DISubroutineType(types: !2738)
!2738 = !{null, !2739, !64, !61, !61}
!2739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2740, size: 32)
!2740 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !190, line: 17, baseType: !2741)
!2741 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !190, line: 14, size: 1664, elements: !2742)
!2742 = !{!2743, !2744}
!2743 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2741, file: !190, line: 15, baseType: !194, size: 1600)
!2744 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2741, file: !190, line: 16, baseType: !42, size: 32, offset: 1600)
!2745 = !DILocalVariable(name: "state", arg: 1, scope: !2735, file: !2736, line: 18, type: !2739)
!2746 = !DILocation(line: 0, scope: !2735)
!2747 = !DILocalVariable(name: "seed", arg: 2, scope: !2735, file: !2736, line: 19, type: !64)
!2748 = !DILocalVariable(name: "x", arg: 3, scope: !2735, file: !2736, line: 20, type: !61)
!2749 = !DILocalVariable(name: "y", arg: 4, scope: !2735, file: !2736, line: 21, type: !61)
!2750 = !DILocalVariable(name: "extseed", scope: !2735, file: !2736, line: 23, type: !2751)
!2751 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !2752)
!2752 = !{!2753}
!2753 = !DISubrange(count: 34)
!2754 = !DILocation(line: 23, column: 11, scope: !2735)
!2755 = !DILocation(line: 25, column: 3, scope: !2735)
!2756 = !DILocation(line: 26, column: 3, scope: !2735)
!2757 = !DILocation(line: 26, column: 29, scope: !2735)
!2758 = !DILocation(line: 27, column: 3, scope: !2735)
!2759 = !DILocation(line: 27, column: 29, scope: !2735)
!2760 = !DILocation(line: 29, column: 3, scope: !2735)
!2761 = !DILocation(line: 30, column: 1, scope: !2735)
!2762 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2736, file: !2736, line: 43, type: !2763, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2763 = !DISubroutineType(types: !2764)
!2764 = !{null, !60, !1723, !64, !61}
!2765 = !DILocalVariable(name: "out", arg: 1, scope: !2762, file: !2736, line: 43, type: !60)
!2766 = !DILocation(line: 0, scope: !2762)
!2767 = !DILocalVariable(name: "outlen", arg: 2, scope: !2762, file: !2736, line: 43, type: !1723)
!2768 = !DILocalVariable(name: "key", arg: 3, scope: !2762, file: !2736, line: 43, type: !64)
!2769 = !DILocalVariable(name: "nonce", arg: 4, scope: !2762, file: !2736, line: 43, type: !61)
!2770 = !DILocalVariable(name: "extkey", scope: !2762, file: !2736, line: 45, type: !2771)
!2771 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !2772)
!2772 = !{!2773}
!2773 = !DISubrange(count: 33)
!2774 = !DILocation(line: 45, column: 11, scope: !2762)
!2775 = !DILocation(line: 47, column: 3, scope: !2762)
!2776 = !DILocation(line: 48, column: 3, scope: !2762)
!2777 = !DILocation(line: 48, column: 26, scope: !2762)
!2778 = !DILocation(line: 50, column: 3, scope: !2762)
!2779 = !DILocation(line: 51, column: 1, scope: !2762)
!2780 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2736, file: !2736, line: 64, type: !489, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2781 = !DILocalVariable(name: "out", arg: 1, scope: !2780, file: !2736, line: 64, type: !60)
!2782 = !DILocation(line: 0, scope: !2780)
!2783 = !DILocalVariable(name: "key", arg: 2, scope: !2780, file: !2736, line: 64, type: !64)
!2784 = !DILocalVariable(name: "input", arg: 3, scope: !2780, file: !2736, line: 64, type: !64)
!2785 = !DILocalVariable(name: "s", scope: !2780, file: !2736, line: 66, type: !2740)
!2786 = !DILocation(line: 66, column: 16, scope: !2780)
!2787 = !DILocation(line: 68, column: 3, scope: !2780)
!2788 = !DILocation(line: 69, column: 3, scope: !2780)
!2789 = !DILocation(line: 70, column: 3, scope: !2780)
!2790 = !DILocation(line: 71, column: 3, scope: !2780)
!2791 = !DILocation(line: 72, column: 3, scope: !2780)
!2792 = !DILocation(line: 73, column: 1, scope: !2780)
