; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [3 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber768_ref_zetas = dso_local constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #2, !dbg !71
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1152, !dbg !72
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1184) #2, !dbg !73
  %add.ptr1 = getelementptr inbounds i8, ptr %sk, i32 2400, !dbg !74
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr1, i32 -64, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr2, ptr noundef %pk, i32 noundef 1184) #2, !dbg !74
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 2400, !dbg !75
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -32, !dbg !76
  %add.ptr5 = getelementptr inbounds i8, ptr %coins, i32 32, !dbg !77
  %call6 = call ptr @memcpy(ptr noundef %add.ptr4, ptr noundef %add.ptr5, i32 noundef 32) #2, !dbg !78
  ret i32 0, !dbg !79
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) #0 !dbg !80 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !83, !DIExpression(), !84)
    #dbg_value(ptr %sk, !85, !DIExpression(), !84)
    #dbg_declare(ptr %coins, !86, !DIExpression(), !90)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !91
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 64) #2, !dbg !92
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !93
  %call = call i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %arraydecay1) #2, !dbg !94
  ret i32 0, !dbg !95
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) #0 !dbg !96 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !99, !DIExpression(), !100)
    #dbg_value(ptr %ss, !101, !DIExpression(), !100)
    #dbg_value(ptr %pk, !102, !DIExpression(), !100)
    #dbg_value(ptr %coins, !103, !DIExpression(), !100)
    #dbg_declare(ptr %buf, !104, !DIExpression(), !105)
    #dbg_declare(ptr %kr, !106, !DIExpression(), !107)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !108
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %coins, i32 noundef 32) #2, !dbg !109
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !110
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !110
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1184) #2, !dbg !110
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !111
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !111
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay2, ptr noundef %arraydecay3, i32 noundef 64) #2, !dbg !111
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !112
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !113
  %add.ptr6 = getelementptr inbounds i8, ptr %arraydecay5, i32 32, !dbg !114
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef %arraydecay4, ptr noundef %pk, ptr noundef %add.ptr6) #2, !dbg !115
  %arraydecay7 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !116
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef %arraydecay7, i32 noundef 32) #2, !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) #0 !dbg !119 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !120, !DIExpression(), !121)
    #dbg_value(ptr %ss, !122, !DIExpression(), !121)
    #dbg_value(ptr %pk, !123, !DIExpression(), !121)
    #dbg_declare(ptr %coins, !124, !DIExpression(), !128)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !129
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 32) #2, !dbg !130
  %arraydecay1 = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !131
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %arraydecay1) #2, !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) #0 !dbg !134 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !137, !DIExpression(), !138)
    #dbg_value(ptr %ct, !139, !DIExpression(), !138)
    #dbg_value(ptr %sk, !140, !DIExpression(), !138)
    #dbg_declare(ptr %buf, !141, !DIExpression(), !142)
    #dbg_declare(ptr %kr, !143, !DIExpression(), !144)
    #dbg_declare(ptr %cmp, !145, !DIExpression(), !149)
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1152, !dbg !150
    #dbg_value(ptr %add.ptr, !151, !DIExpression(), !138)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !152
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %arraydecay, ptr noundef %ct, ptr noundef %sk) #2, !dbg !153
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !154
  %add.ptr2 = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !155
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 2400, !dbg !156
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -64, !dbg !157
  %call = call ptr @memcpy(ptr noundef %add.ptr2, ptr noundef %add.ptr4, i32 noundef 32) #2, !dbg !158
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !159
  %arraydecay6 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !159
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay5, ptr noundef %arraydecay6, i32 noundef 64) #2, !dbg !159
  %arraydecay7 = getelementptr inbounds [1088 x i8], ptr %cmp, i32 0, i32 0, !dbg !160
  %arraydecay8 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !161
  %arraydecay9 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !162
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i32 32, !dbg !163
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %add.ptr, ptr noundef %add.ptr10) #2, !dbg !164
  %arraydecay11 = getelementptr inbounds [1088 x i8], ptr %cmp, i32 0, i32 0, !dbg !165
  %call12 = call i32 @pqcrystals_kyber768_ref_verify(ptr noundef %ct, ptr noundef %arraydecay11, i32 noundef 1088) #2, !dbg !166
    #dbg_value(i32 %call12, !167, !DIExpression(), !138)
  %add.ptr13 = getelementptr inbounds i8, ptr %sk, i32 2400, !dbg !168
  %add.ptr14 = getelementptr inbounds i8, ptr %add.ptr13, i32 -32, !dbg !168
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef %add.ptr14, ptr noundef %ct) #2, !dbg !168
  %arraydecay15 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !169
  %tobool = icmp ne i32 %call12, 0, !dbg !170
  %lnot = xor i1 %tobool, true, !dbg !170
  %lnot.ext = zext i1 %lnot to i32, !dbg !170
  %conv = trunc i32 %lnot.ext to i8, !dbg !170
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef %arraydecay15, i32 noundef 32, i8 noundef zeroext %conv) #2, !dbg !171
  ret i32 0, !dbg !172
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) #0 !dbg !173 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !194, !DIExpression(), !195)
    #dbg_value(ptr %seed, !196, !DIExpression(), !195)
    #dbg_value(i32 %transposed, !197, !DIExpression(), !195)
    #dbg_declare(ptr %buf, !198, !DIExpression(), !202)
    #dbg_declare(ptr %state, !203, !DIExpression(), !215)
    #dbg_value(i32 0, !216, !DIExpression(), !195)
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !219
    #dbg_value(i32 %i.0, !216, !DIExpression(), !195)
  %cmp = icmp ult i32 %i.0, 3, !dbg !220
  br i1 %cmp, label %for.body, label %for.end22, !dbg !222

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !223, !DIExpression(), !195)
  br label %for.cond1, !dbg !224

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !227
    #dbg_value(i32 %j.0, !223, !DIExpression(), !195)
  %cmp2 = icmp ult i32 %j.0, 3, !dbg !228
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !230

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %transposed, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %for.body3
  %conv = trunc i32 %i.0 to i8, !dbg !234
  %conv4 = trunc i32 %j.0 to i8, !dbg !234
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #2, !dbg !234
  br label %if.end, !dbg !234

if.else:                                          ; preds = %for.body3
  %conv5 = trunc i32 %j.0 to i8, !dbg !235
  %conv6 = trunc i32 %i.0 to i8, !dbg !235
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #2, !dbg !235
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !236
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay, i32 noundef 3, ptr noundef %state) #2, !dbg !236
    #dbg_value(i32 504, !237, !DIExpression(), !195)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !238
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx, i32 0, i32 0, !dbg !239
  %arrayidx7 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %j.0, !dbg !238
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx7, i32 0, i32 0, !dbg !240
  %arraydecay8 = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !238
  %arraydecay9 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !241
  %call = call i32 @rej_uniform(ptr noundef %arraydecay8, i32 noundef 256, ptr noundef %arraydecay9, i32 noundef 504) #2, !dbg !242
    #dbg_value(i32 %call, !243, !DIExpression(), !195)
  br label %while.cond, !dbg !244

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !245
    #dbg_value(i32 %ctr.0, !243, !DIExpression(), !195)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !246
  br i1 %cmp10, label %while.body, label %while.end, !dbg !244

while.body:                                       ; preds = %while.cond
  %arraydecay12 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !247
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay12, i32 noundef 1, ptr noundef %state) #2, !dbg !247
    #dbg_value(i32 168, !237, !DIExpression(), !195)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !249
  %vec14 = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx13, i32 0, i32 0, !dbg !250
  %arrayidx15 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec14, i32 0, i32 %j.0, !dbg !249
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %arrayidx15, i32 0, i32 0, !dbg !251
  %arraydecay17 = getelementptr inbounds [256 x i16], ptr %coeffs16, i32 0, i32 0, !dbg !249
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay17, i32 %ctr.0, !dbg !252
  %sub = sub i32 256, %ctr.0, !dbg !253
  %arraydecay18 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !254
  %call19 = call i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %arraydecay18, i32 noundef 168) #2, !dbg !255
  %add = add i32 %ctr.0, %call19, !dbg !256
    #dbg_value(i32 %add, !243, !DIExpression(), !195)
  br label %while.cond, !dbg !244, !llvm.loop !257

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !260

for.inc:                                          ; preds = %while.end
  %inc = add i32 %j.0, 1, !dbg !261
    #dbg_value(i32 %inc, !223, !DIExpression(), !195)
  br label %for.cond1, !dbg !262, !llvm.loop !263

for.end:                                          ; preds = %for.cond1
  br label %for.inc20, !dbg !265

for.inc20:                                        ; preds = %for.end
  %inc21 = add i32 %i.0, 1, !dbg !266
    #dbg_value(i32 %inc21, !216, !DIExpression(), !195)
  br label %for.cond, !dbg !267, !llvm.loop !268

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !270
}

; Function Attrs: noinline nounwind optnone
define internal i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) #0 !dbg !271 {
entry:
    #dbg_value(ptr %r, !275, !DIExpression(), !276)
    #dbg_value(i32 %len, !277, !DIExpression(), !276)
    #dbg_value(ptr %buf, !278, !DIExpression(), !276)
    #dbg_value(i32 %buflen, !279, !DIExpression(), !276)
    #dbg_value(i32 0, !280, !DIExpression(), !276)
    #dbg_value(i32 0, !281, !DIExpression(), !276)
  br label %while.cond, !dbg !282

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !276
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !276
    #dbg_value(i32 %pos.0, !280, !DIExpression(), !276)
    #dbg_value(i32 %ctr.0, !281, !DIExpression(), !276)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !283
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !284

land.rhs:                                         ; preds = %while.cond
  %add = add i32 %pos.0, 3, !dbg !285
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !286
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !dbg !276
  br i1 %0, label %while.body, label %while.end, !dbg !282

while.body:                                       ; preds = %land.end
  %add2 = add i32 %pos.0, 0, !dbg !287
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %add2, !dbg !289
  %1 = load i8, ptr %arrayidx, align 1, !dbg !289
  %conv = zext i8 %1 to i32, !dbg !289
  %shr = ashr i32 %conv, 0, !dbg !290
  %add3 = add i32 %pos.0, 1, !dbg !291
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %buf, i32 %add3, !dbg !292
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !292
  %conv5 = zext i8 %2 to i16, !dbg !293
  %conv6 = zext i16 %conv5 to i32, !dbg !293
  %shl = shl i32 %conv6, 8, !dbg !294
  %or = or i32 %shr, %shl, !dbg !295
  %and = and i32 %or, 4095, !dbg !296
  %conv7 = trunc i32 %and to i16, !dbg !297
    #dbg_value(i16 %conv7, !298, !DIExpression(), !276)
  %add8 = add i32 %pos.0, 1, !dbg !299
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %buf, i32 %add8, !dbg !300
  %3 = load i8, ptr %arrayidx9, align 1, !dbg !300
  %conv10 = zext i8 %3 to i32, !dbg !300
  %shr11 = ashr i32 %conv10, 4, !dbg !301
  %add12 = add i32 %pos.0, 2, !dbg !302
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %buf, i32 %add12, !dbg !303
  %4 = load i8, ptr %arrayidx13, align 1, !dbg !303
  %conv14 = zext i8 %4 to i16, !dbg !304
  %conv15 = zext i16 %conv14 to i32, !dbg !304
  %shl16 = shl i32 %conv15, 4, !dbg !305
  %or17 = or i32 %shr11, %shl16, !dbg !306
  %and18 = and i32 %or17, 4095, !dbg !307
  %conv19 = trunc i32 %and18 to i16, !dbg !308
    #dbg_value(i16 %conv19, !309, !DIExpression(), !276)
  %add20 = add i32 %pos.0, 3, !dbg !310
    #dbg_value(i32 %add20, !280, !DIExpression(), !276)
  %conv21 = zext i16 %conv7 to i32, !dbg !311
  %cmp22 = icmp slt i32 %conv21, 3329, !dbg !313
  br i1 %cmp22, label %if.then, label %if.end, !dbg !313

if.then:                                          ; preds = %while.body
  %inc = add i32 %ctr.0, 1, !dbg !314
    #dbg_value(i32 %inc, !281, !DIExpression(), !276)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !315
  store i16 %conv7, ptr %arrayidx24, align 2, !dbg !316
  br label %if.end, !dbg !315

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !276
    #dbg_value(i32 %ctr.1, !281, !DIExpression(), !276)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !317
  br i1 %cmp25, label %land.lhs.true, label %if.end33, !dbg !319

land.lhs.true:                                    ; preds = %if.end
  %conv27 = zext i16 %conv19 to i32, !dbg !320
  %cmp28 = icmp slt i32 %conv27, 3329, !dbg !321
  br i1 %cmp28, label %if.then30, label %if.end33, !dbg !319

if.then30:                                        ; preds = %land.lhs.true
  %inc31 = add i32 %ctr.1, 1, !dbg !322
    #dbg_value(i32 %inc31, !281, !DIExpression(), !276)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !323
  store i16 %conv19, ptr %arrayidx32, align 2, !dbg !324
  br label %if.end33, !dbg !323

if.end33:                                         ; preds = %if.then30, %land.lhs.true, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %land.lhs.true ], [ %ctr.1, %if.end ], !dbg !325
    #dbg_value(i32 %ctr.2, !281, !DIExpression(), !276)
  br label %while.cond, !dbg !282, !llvm.loop !326

while.end:                                        ; preds = %land.end
  ret i32 %ctr.0, !dbg !328
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !329 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !332, !DIExpression(), !333)
    #dbg_value(ptr %sk, !334, !DIExpression(), !333)
    #dbg_value(ptr %coins, !335, !DIExpression(), !333)
    #dbg_declare(ptr %buf, !336, !DIExpression(), !337)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !338
    #dbg_value(ptr %arraydecay, !339, !DIExpression(), !333)
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !340
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !341
    #dbg_value(ptr %add.ptr, !342, !DIExpression(), !333)
    #dbg_value(i8 0, !343, !DIExpression(), !333)
    #dbg_declare(ptr %a, !344, !DIExpression(), !346)
    #dbg_declare(ptr %e, !347, !DIExpression(), !348)
    #dbg_declare(ptr %pkpv, !349, !DIExpression(), !350)
    #dbg_declare(ptr %skpv, !351, !DIExpression(), !352)
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !353
  %call = call ptr @memcpy(ptr noundef %arraydecay2, ptr noundef %coins, i32 noundef 32) #2, !dbg !354
  %arrayidx = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32, !dbg !355
  store i8 3, ptr %arrayidx, align 1, !dbg !356
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay3, ptr noundef %arraydecay4, i32 noundef 33) #2, !dbg !357
  %arraydecay5 = getelementptr inbounds [3 x %struct.polyvec], ptr %a, i32 0, i32 0, !dbg !358
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %arraydecay5, ptr noundef %arraydecay, i32 noundef 0) #2, !dbg !358
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond, !dbg !360

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !362
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !333
    #dbg_value(i8 %nonce.0, !343, !DIExpression(), !333)
    #dbg_value(i32 %i.0, !359, !DIExpression(), !333)
  %cmp = icmp ult i32 %i.0, 3, !dbg !363
  br i1 %cmp, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %skpv, i32 0, i32 0, !dbg !366
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !367
  %inc = add i8 %nonce.0, 1, !dbg !368
    #dbg_value(i8 %inc, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %arrayidx6, ptr noundef %add.ptr, i8 noundef zeroext %nonce.0) #2, !dbg !369
  br label %for.inc, !dbg !369

for.inc:                                          ; preds = %for.body
  %inc7 = add i32 %i.0, 1, !dbg !370
    #dbg_value(i32 %inc7, !359, !DIExpression(), !333)
  br label %for.cond, !dbg !371, !llvm.loop !372

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond8, !dbg !374

for.cond8:                                        ; preds = %for.inc14, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !376
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc13, %for.inc14 ], !dbg !333
    #dbg_value(i8 %nonce.1, !343, !DIExpression(), !333)
    #dbg_value(i32 %i.1, !359, !DIExpression(), !333)
  %cmp9 = icmp ult i32 %i.1, 3, !dbg !377
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !379

for.body10:                                       ; preds = %for.cond8
  %vec11 = getelementptr inbounds nuw %struct.polyvec, ptr %e, i32 0, i32 0, !dbg !380
  %arrayidx12 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec11, i32 0, i32 %i.1, !dbg !381
  %inc13 = add i8 %nonce.1, 1, !dbg !382
    #dbg_value(i8 %inc13, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %arrayidx12, ptr noundef %add.ptr, i8 noundef zeroext %nonce.1) #2, !dbg !383
  br label %for.inc14, !dbg !383

for.inc14:                                        ; preds = %for.body10
  %inc15 = add i32 %i.1, 1, !dbg !384
    #dbg_value(i32 %inc15, !359, !DIExpression(), !333)
  br label %for.cond8, !dbg !385, !llvm.loop !386

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %skpv) #2, !dbg !388
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %e) #2, !dbg !389
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !390

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.inc25 ], !dbg !392
    #dbg_value(i32 %i.2, !359, !DIExpression(), !333)
  %cmp18 = icmp ult i32 %i.2, 3, !dbg !393
  br i1 %cmp18, label %for.body19, label %for.end27, !dbg !395

for.body19:                                       ; preds = %for.cond17
  %vec20 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !396
  %arrayidx21 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec20, i32 0, i32 %i.2, !dbg !398
  %arrayidx22 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !399
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx21, ptr noundef %arrayidx22, ptr noundef %skpv) #2, !dbg !400
  %vec23 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !401
  %arrayidx24 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec23, i32 0, i32 %i.2, !dbg !402
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %arrayidx24) #2, !dbg !403
  br label %for.inc25, !dbg !404

for.inc25:                                        ; preds = %for.body19
  %inc26 = add i32 %i.2, 1, !dbg !405
    #dbg_value(i32 %inc26, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !406, !llvm.loop !407

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %pkpv, ptr noundef %pkpv, ptr noundef %e) #2, !dbg !409
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %pkpv) #2, !dbg !410
  call void @pack_sk(ptr noundef %sk, ptr noundef %skpv) #2, !dbg !411
  call void @pack_pk(ptr noundef %pk, ptr noundef %pkpv, ptr noundef %arraydecay) #2, !dbg !412
  ret void, !dbg !413
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_sk(ptr noundef %r, ptr noundef %sk) #0 !dbg !414 {
entry:
    #dbg_value(ptr %r, !417, !DIExpression(), !418)
    #dbg_value(ptr %sk, !419, !DIExpression(), !418)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #2, !dbg !420
  ret void, !dbg !421
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) #0 !dbg !422 {
entry:
    #dbg_value(ptr %r, !425, !DIExpression(), !426)
    #dbg_value(ptr %pk, !427, !DIExpression(), !426)
    #dbg_value(ptr %seed, !428, !DIExpression(), !426)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #2, !dbg !429
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 1152, !dbg !430
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %seed, i32 noundef 32) #2, !dbg !431
  ret void, !dbg !432
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) #0 !dbg !433 {
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
    #dbg_value(ptr %c, !436, !DIExpression(), !437)
    #dbg_value(ptr %m, !438, !DIExpression(), !437)
    #dbg_value(ptr %pk, !439, !DIExpression(), !437)
    #dbg_value(ptr %coins, !440, !DIExpression(), !437)
    #dbg_declare(ptr %seed, !441, !DIExpression(), !442)
    #dbg_value(i8 0, !443, !DIExpression(), !437)
    #dbg_declare(ptr %sp, !444, !DIExpression(), !445)
    #dbg_declare(ptr %pkpv, !446, !DIExpression(), !447)
    #dbg_declare(ptr %ep, !448, !DIExpression(), !449)
    #dbg_declare(ptr %at, !450, !DIExpression(), !451)
    #dbg_declare(ptr %b, !452, !DIExpression(), !453)
    #dbg_declare(ptr %v, !454, !DIExpression(), !455)
    #dbg_declare(ptr %k, !456, !DIExpression(), !457)
    #dbg_declare(ptr %epp, !458, !DIExpression(), !459)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !460
  call void @unpack_pk(ptr noundef %pkpv, ptr noundef %arraydecay, ptr noundef %pk) #2, !dbg !461
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %k, ptr noundef %m) #2, !dbg !462
  %arraydecay1 = getelementptr inbounds [3 x %struct.polyvec], ptr %at, i32 0, i32 0, !dbg !463
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !463
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %arraydecay1, ptr noundef %arraydecay2, i32 noundef 1) #2, !dbg !463
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond, !dbg !465

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ], !dbg !467
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !437
    #dbg_value(i8 %nonce.0, !443, !DIExpression(), !437)
    #dbg_value(i32 %i.0, !464, !DIExpression(), !437)
  %cmp = icmp ult i32 %i.0, 3, !dbg !468
  br i1 %cmp, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %sp, i32 0, i32 0, !dbg !471
  %arraydecay3 = getelementptr inbounds [3 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !472
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %arraydecay3, i32 %i.0, !dbg !473
  %inc = add i8 %nonce.0, 1, !dbg !474
    #dbg_value(i8 %inc, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #2, !dbg !475
  br label %for.inc, !dbg !475

for.inc:                                          ; preds = %for.body
  %inc4 = add i32 %i.0, 1, !dbg !476
    #dbg_value(i32 %inc4, !464, !DIExpression(), !437)
  br label %for.cond, !dbg !477, !llvm.loop !478

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond5, !dbg !480

for.cond5:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !482
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc11, %for.inc12 ], !dbg !437
    #dbg_value(i8 %nonce.1, !443, !DIExpression(), !437)
    #dbg_value(i32 %i.1, !464, !DIExpression(), !437)
  %cmp6 = icmp ult i32 %i.1, 3, !dbg !483
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !485

for.body7:                                        ; preds = %for.cond5
  %vec8 = getelementptr inbounds nuw %struct.polyvec, ptr %ep, i32 0, i32 0, !dbg !486
  %arraydecay9 = getelementptr inbounds [3 x %struct.poly], ptr %vec8, i32 0, i32 0, !dbg !487
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %arraydecay9, i32 %i.1, !dbg !488
  %inc11 = add i8 %nonce.1, 1, !dbg !489
    #dbg_value(i8 %inc11, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !490
  br label %for.inc12, !dbg !490

for.inc12:                                        ; preds = %for.body7
  %inc13 = add i32 %i.1, 1, !dbg !491
    #dbg_value(i32 %inc13, !464, !DIExpression(), !437)
  br label %for.cond5, !dbg !492, !llvm.loop !493

for.end14:                                        ; preds = %for.cond5
  %inc15 = add i8 %nonce.1, 1, !dbg !495
    #dbg_value(i8 %inc15, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %epp, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !496
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %sp) #2, !dbg !497
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !498

for.cond16:                                       ; preds = %for.inc21, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.inc21 ], !dbg !500
    #dbg_value(i32 %i.2, !464, !DIExpression(), !437)
  %cmp17 = icmp ult i32 %i.2, 3, !dbg !501
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !503

for.body18:                                       ; preds = %for.cond16
  %vec19 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !504
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec19, i32 0, i32 %i.2, !dbg !505
  %arrayidx20 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !506
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx, ptr noundef %arrayidx20, ptr noundef %sp) #2, !dbg !507
  br label %for.inc21, !dbg !507

for.inc21:                                        ; preds = %for.body18
  %inc22 = add i32 %i.2, 1, !dbg !508
    #dbg_value(i32 %inc22, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !509, !llvm.loop !510

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %v, ptr noundef %pkpv, ptr noundef %sp) #2, !dbg !512
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %b) #2, !dbg !513
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %v) #2, !dbg !514
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %b, ptr noundef %b, ptr noundef %ep) #2, !dbg !515
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %epp) #2, !dbg !516
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %k) #2, !dbg !517
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %b) #2, !dbg !518
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %v) #2, !dbg !519
  call void @pack_ciphertext(ptr noundef %c, ptr noundef %b, ptr noundef %v) #2, !dbg !520
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) #0 !dbg !522 {
entry:
    #dbg_value(ptr %pk, !525, !DIExpression(), !526)
    #dbg_value(ptr %seed, !527, !DIExpression(), !526)
    #dbg_value(ptr %packedpk, !528, !DIExpression(), !526)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #2, !dbg !529
  %add.ptr = getelementptr inbounds i8, ptr %packedpk, i32 1152, !dbg !530
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef %add.ptr, i32 noundef 32) #2, !dbg !531
  ret void, !dbg !532
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) #0 !dbg !533 {
entry:
    #dbg_value(ptr %r, !537, !DIExpression(), !538)
    #dbg_value(ptr %b, !539, !DIExpression(), !538)
    #dbg_value(ptr %v, !540, !DIExpression(), !538)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #2, !dbg !541
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 960, !dbg !542
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %add.ptr, ptr noundef %v) #2, !dbg !543
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) #0 !dbg !545 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !548, !DIExpression(), !549)
    #dbg_value(ptr %c, !550, !DIExpression(), !549)
    #dbg_value(ptr %sk, !551, !DIExpression(), !549)
    #dbg_declare(ptr %b, !552, !DIExpression(), !553)
    #dbg_declare(ptr %skpv, !554, !DIExpression(), !555)
    #dbg_declare(ptr %v, !556, !DIExpression(), !557)
    #dbg_declare(ptr %mp, !558, !DIExpression(), !559)
  call void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #2, !dbg !560
  call void @unpack_sk(ptr noundef %skpv, ptr noundef %sk) #2, !dbg !561
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %b) #2, !dbg !562
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %mp, ptr noundef %skpv, ptr noundef %b) #2, !dbg !563
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %mp) #2, !dbg !564
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %mp, ptr noundef %v, ptr noundef %mp) #2, !dbg !565
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %mp) #2, !dbg !566
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef %mp) #2, !dbg !567
  ret void, !dbg !568
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #0 !dbg !569 {
entry:
    #dbg_value(ptr %b, !572, !DIExpression(), !573)
    #dbg_value(ptr %v, !574, !DIExpression(), !573)
    #dbg_value(ptr %c, !575, !DIExpression(), !573)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #2, !dbg !576
  %add.ptr = getelementptr inbounds i8, ptr %c, i32 960, !dbg !577
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %v, ptr noundef %add.ptr) #2, !dbg !578
  ret void, !dbg !579
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) #0 !dbg !580 {
entry:
    #dbg_value(ptr %sk, !583, !DIExpression(), !584)
    #dbg_value(ptr %packedsk, !585, !DIExpression(), !584)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #2, !dbg !586
  ret void, !dbg !587
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !588 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !603, !DIExpression(), !604)
    #dbg_value(ptr %a, !605, !DIExpression(), !604)
    #dbg_declare(ptr %t, !606, !DIExpression(), !610)
    #dbg_value(i32 0, !611, !DIExpression(), !604)
  br label %for.cond, !dbg !612

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !614
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !603, !DIExpression(), !604)
    #dbg_value(i32 %i.0, !611, !DIExpression(), !604)
  %cmp = icmp ult i32 %i.0, 3, !dbg !615
  br i1 %cmp, label %for.body, label %for.end63, !dbg !617

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !618, !DIExpression(), !604)
  br label %for.cond1, !dbg !619

for.cond1:                                        ; preds = %for.inc58, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc59, %for.inc58 ], !dbg !622
  %r.addr.1 = phi ptr [ %r.addr.0, %for.body ], [ %add.ptr, %for.inc58 ]
    #dbg_value(ptr %r.addr.1, !603, !DIExpression(), !604)
    #dbg_value(i32 %j.0, !618, !DIExpression(), !604)
  %cmp2 = icmp ult i32 %j.0, 64, !dbg !623
  br i1 %cmp2, label %for.body3, label %for.end60, !dbg !625

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 0, !626, !DIExpression(), !604)
  br label %for.cond4, !dbg !627

for.cond4:                                        ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !630
    #dbg_value(i32 %k.0, !626, !DIExpression(), !604)
  %cmp5 = icmp ult i32 %k.0, 4, !dbg !631
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !633

for.body6:                                        ; preds = %for.cond4
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !634
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !636
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx, i32 0, i32 0, !dbg !637
  %mul = mul i32 4, %j.0, !dbg !638
  %add = add i32 %mul, %k.0, !dbg !639
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !636
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !636
  %arrayidx8 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !640
  store i16 %0, ptr %arrayidx8, align 2, !dbg !641
  %arrayidx9 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !642
  %1 = load i16, ptr %arrayidx9, align 2, !dbg !642
  %conv = sext i16 %1 to i32, !dbg !643
  %shr = ashr i32 %conv, 15, !dbg !644
  %and = and i32 %shr, 3329, !dbg !645
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !646
  %2 = load i16, ptr %arrayidx10, align 2, !dbg !647
  %conv11 = zext i16 %2 to i32, !dbg !647
  %add12 = add nsw i32 %conv11, %and, !dbg !647
  %conv13 = trunc i32 %add12 to i16, !dbg !647
  store i16 %conv13, ptr %arrayidx10, align 2, !dbg !647
  %arrayidx14 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !648
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !648
  %conv15 = zext i16 %3 to i64, !dbg !648
    #dbg_value(i64 %conv15, !649, !DIExpression(), !604)
  %shl = shl i64 %conv15, 10, !dbg !650
    #dbg_value(i64 %shl, !649, !DIExpression(), !604)
  %add16 = add i64 %shl, 1665, !dbg !651
    #dbg_value(i64 %add16, !649, !DIExpression(), !604)
  %mul17 = mul i64 %add16, 1290167, !dbg !652
    #dbg_value(i64 %mul17, !649, !DIExpression(), !604)
  %shr18 = lshr i64 %mul17, 32, !dbg !653
    #dbg_value(i64 %shr18, !649, !DIExpression(), !604)
  %and19 = and i64 %shr18, 1023, !dbg !654
  %conv20 = trunc i64 %and19 to i16, !dbg !655
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !656
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !657
  br label %for.inc, !dbg !658

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %k.0, 1, !dbg !659
    #dbg_value(i32 %inc, !626, !DIExpression(), !604)
  br label %for.cond4, !dbg !660, !llvm.loop !661

for.end:                                          ; preds = %for.cond4
  %arrayidx22 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !663
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !663
  %conv23 = zext i16 %4 to i32, !dbg !663
  %shr24 = ashr i32 %conv23, 0, !dbg !664
  %conv25 = trunc i32 %shr24 to i8, !dbg !665
  %arrayidx26 = getelementptr inbounds i8, ptr %r.addr.1, i32 0, !dbg !666
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !667
  %arrayidx27 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !668
  %5 = load i16, ptr %arrayidx27, align 2, !dbg !668
  %conv28 = zext i16 %5 to i32, !dbg !668
  %shr29 = ashr i32 %conv28, 8, !dbg !669
  %arrayidx30 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !670
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !670
  %conv31 = zext i16 %6 to i32, !dbg !670
  %shl32 = shl i32 %conv31, 2, !dbg !671
  %or = or i32 %shr29, %shl32, !dbg !672
  %conv33 = trunc i32 %or to i8, !dbg !673
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.1, i32 1, !dbg !674
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !675
  %arrayidx35 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !676
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !676
  %conv36 = zext i16 %7 to i32, !dbg !676
  %shr37 = ashr i32 %conv36, 6, !dbg !677
  %arrayidx38 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !678
  %8 = load i16, ptr %arrayidx38, align 2, !dbg !678
  %conv39 = zext i16 %8 to i32, !dbg !678
  %shl40 = shl i32 %conv39, 4, !dbg !679
  %or41 = or i32 %shr37, %shl40, !dbg !680
  %conv42 = trunc i32 %or41 to i8, !dbg !681
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.1, i32 2, !dbg !682
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !683
  %arrayidx44 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !684
  %9 = load i16, ptr %arrayidx44, align 2, !dbg !684
  %conv45 = zext i16 %9 to i32, !dbg !684
  %shr46 = ashr i32 %conv45, 4, !dbg !685
  %arrayidx47 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !686
  %10 = load i16, ptr %arrayidx47, align 2, !dbg !686
  %conv48 = zext i16 %10 to i32, !dbg !686
  %shl49 = shl i32 %conv48, 6, !dbg !687
  %or50 = or i32 %shr46, %shl49, !dbg !688
  %conv51 = trunc i32 %or50 to i8, !dbg !689
  %arrayidx52 = getelementptr inbounds i8, ptr %r.addr.1, i32 3, !dbg !690
  store i8 %conv51, ptr %arrayidx52, align 1, !dbg !691
  %arrayidx53 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !692
  %11 = load i16, ptr %arrayidx53, align 2, !dbg !692
  %conv54 = zext i16 %11 to i32, !dbg !692
  %shr55 = ashr i32 %conv54, 2, !dbg !693
  %conv56 = trunc i32 %shr55 to i8, !dbg !694
  %arrayidx57 = getelementptr inbounds i8, ptr %r.addr.1, i32 4, !dbg !695
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !696
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.1, i32 5, !dbg !697
    #dbg_value(ptr %add.ptr, !603, !DIExpression(), !604)
  br label %for.inc58, !dbg !698

for.inc58:                                        ; preds = %for.end
  %inc59 = add i32 %j.0, 1, !dbg !699
    #dbg_value(i32 %inc59, !618, !DIExpression(), !604)
  br label %for.cond1, !dbg !700, !llvm.loop !701

for.end60:                                        ; preds = %for.cond1
  br label %for.inc61, !dbg !703

for.inc61:                                        ; preds = %for.end60
  %inc62 = add i32 %i.0, 1, !dbg !704
    #dbg_value(i32 %inc62, !611, !DIExpression(), !604)
  br label %for.cond, !dbg !705, !llvm.loop !706

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !708
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !709 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !713, !DIExpression(), !714)
    #dbg_value(ptr %a, !715, !DIExpression(), !714)
    #dbg_declare(ptr %t, !716, !DIExpression(), !717)
    #dbg_value(i32 0, !718, !DIExpression(), !714)
  br label %for.cond, !dbg !719

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !721
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !715, !DIExpression(), !714)
    #dbg_value(i32 %i.0, !718, !DIExpression(), !714)
  %cmp = icmp ult i32 %i.0, 3, !dbg !722
  br i1 %cmp, label %for.body, label %for.end56, !dbg !724

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !725, !DIExpression(), !714)
  br label %for.cond1, !dbg !726

for.cond1:                                        ; preds = %for.inc51, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc52, %for.inc51 ], !dbg !729
  %a.addr.1 = phi ptr [ %a.addr.0, %for.body ], [ %add.ptr, %for.inc51 ]
    #dbg_value(ptr %a.addr.1, !715, !DIExpression(), !714)
    #dbg_value(i32 %j.0, !725, !DIExpression(), !714)
  %cmp2 = icmp ult i32 %j.0, 64, !dbg !730
  br i1 %cmp2, label %for.body3, label %for.end53, !dbg !732

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.1, i32 0, !dbg !733
  %0 = load i8, ptr %arrayidx, align 1, !dbg !733
  %conv = zext i8 %0 to i32, !dbg !733
  %shr = ashr i32 %conv, 0, !dbg !735
  %arrayidx4 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !736
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !736
  %conv5 = zext i8 %1 to i16, !dbg !737
  %conv6 = zext i16 %conv5 to i32, !dbg !737
  %shl = shl i32 %conv6, 8, !dbg !738
  %or = or i32 %shr, %shl, !dbg !739
  %conv7 = trunc i32 %or to i16, !dbg !740
  %arrayidx8 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !741
  store i16 %conv7, ptr %arrayidx8, align 2, !dbg !742
  %arrayidx9 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !743
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !743
  %conv10 = zext i8 %2 to i32, !dbg !743
  %shr11 = ashr i32 %conv10, 2, !dbg !744
  %arrayidx12 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !745
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !745
  %conv13 = zext i8 %3 to i16, !dbg !746
  %conv14 = zext i16 %conv13 to i32, !dbg !746
  %shl15 = shl i32 %conv14, 6, !dbg !747
  %or16 = or i32 %shr11, %shl15, !dbg !748
  %conv17 = trunc i32 %or16 to i16, !dbg !749
  %arrayidx18 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !750
  store i16 %conv17, ptr %arrayidx18, align 2, !dbg !751
  %arrayidx19 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !752
  %4 = load i8, ptr %arrayidx19, align 1, !dbg !752
  %conv20 = zext i8 %4 to i32, !dbg !752
  %shr21 = ashr i32 %conv20, 4, !dbg !753
  %arrayidx22 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !754
  %5 = load i8, ptr %arrayidx22, align 1, !dbg !754
  %conv23 = zext i8 %5 to i16, !dbg !755
  %conv24 = zext i16 %conv23 to i32, !dbg !755
  %shl25 = shl i32 %conv24, 4, !dbg !756
  %or26 = or i32 %shr21, %shl25, !dbg !757
  %conv27 = trunc i32 %or26 to i16, !dbg !758
  %arrayidx28 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !759
  store i16 %conv27, ptr %arrayidx28, align 2, !dbg !760
  %arrayidx29 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !761
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !761
  %conv30 = zext i8 %6 to i32, !dbg !761
  %shr31 = ashr i32 %conv30, 6, !dbg !762
  %arrayidx32 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !763
  %7 = load i8, ptr %arrayidx32, align 1, !dbg !763
  %conv33 = zext i8 %7 to i16, !dbg !764
  %conv34 = zext i16 %conv33 to i32, !dbg !764
  %shl35 = shl i32 %conv34, 2, !dbg !765
  %or36 = or i32 %shr31, %shl35, !dbg !766
  %conv37 = trunc i32 %or36 to i16, !dbg !767
  %arrayidx38 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !768
  store i16 %conv37, ptr %arrayidx38, align 2, !dbg !769
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !770
    #dbg_value(ptr %add.ptr, !715, !DIExpression(), !714)
    #dbg_value(i32 0, !771, !DIExpression(), !714)
  br label %for.cond39, !dbg !772

for.cond39:                                       ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !774
    #dbg_value(i32 %k.0, !771, !DIExpression(), !714)
  %cmp40 = icmp ult i32 %k.0, 4, !dbg !775
  br i1 %cmp40, label %for.body42, label %for.end, !dbg !777

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !778
  %8 = load i16, ptr %arrayidx43, align 2, !dbg !778
  %conv44 = zext i16 %8 to i32, !dbg !778
  %and = and i32 %conv44, 1023, !dbg !779
  %mul = mul i32 %and, 3329, !dbg !780
  %add = add i32 %mul, 512, !dbg !781
  %shr45 = lshr i32 %add, 10, !dbg !782
  %conv46 = trunc i32 %shr45 to i16, !dbg !783
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !784
  %arrayidx47 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !785
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx47, i32 0, i32 0, !dbg !786
  %mul48 = mul i32 4, %j.0, !dbg !787
  %add49 = add i32 %mul48, %k.0, !dbg !788
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add49, !dbg !785
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !789
  br label %for.inc, !dbg !785

for.inc:                                          ; preds = %for.body42
  %inc = add i32 %k.0, 1, !dbg !790
    #dbg_value(i32 %inc, !771, !DIExpression(), !714)
  br label %for.cond39, !dbg !791, !llvm.loop !792

for.end:                                          ; preds = %for.cond39
  br label %for.inc51, !dbg !794

for.inc51:                                        ; preds = %for.end
  %inc52 = add i32 %j.0, 1, !dbg !795
    #dbg_value(i32 %inc52, !725, !DIExpression(), !714)
  br label %for.cond1, !dbg !796, !llvm.loop !797

for.end53:                                        ; preds = %for.cond1
  br label %for.inc54, !dbg !799

for.inc54:                                        ; preds = %for.end53
  %inc55 = add i32 %i.0, 1, !dbg !800
    #dbg_value(i32 %inc55, !718, !DIExpression(), !714)
  br label %for.cond, !dbg !801, !llvm.loop !802

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !804
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !805 {
entry:
    #dbg_value(ptr %r, !806, !DIExpression(), !807)
    #dbg_value(ptr %a, !808, !DIExpression(), !807)
    #dbg_value(i32 0, !809, !DIExpression(), !807)
  br label %for.cond, !dbg !810

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !812
    #dbg_value(i32 %i.0, !809, !DIExpression(), !807)
  %cmp = icmp ult i32 %i.0, 3, !dbg !813
  br i1 %cmp, label %for.body, label %for.end, !dbg !815

for.body:                                         ; preds = %for.cond
  %mul = mul i32 %i.0, 384, !dbg !816
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !817
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !818
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !819
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #2, !dbg !820
  br label %for.inc, !dbg !820

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !821
    #dbg_value(i32 %inc, !809, !DIExpression(), !807)
  br label %for.cond, !dbg !822, !llvm.loop !823

for.end:                                          ; preds = %for.cond
  ret void, !dbg !825
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !826 {
entry:
    #dbg_value(ptr %r, !827, !DIExpression(), !828)
    #dbg_value(ptr %a, !829, !DIExpression(), !828)
    #dbg_value(i32 0, !830, !DIExpression(), !828)
  br label %for.cond, !dbg !831

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !833
    #dbg_value(i32 %i.0, !830, !DIExpression(), !828)
  %cmp = icmp ult i32 %i.0, 3, !dbg !834
  br i1 %cmp, label %for.body, label %for.end, !dbg !836

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !837
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !838
  %mul = mul i32 %i.0, 384, !dbg !839
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !840
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #2, !dbg !841
  br label %for.inc, !dbg !841

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !842
    #dbg_value(i32 %inc, !830, !DIExpression(), !828)
  br label %for.cond, !dbg !843, !llvm.loop !844

for.end:                                          ; preds = %for.cond
  ret void, !dbg !846
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) #0 !dbg !847 {
entry:
    #dbg_value(ptr %r, !850, !DIExpression(), !851)
    #dbg_value(i32 0, !852, !DIExpression(), !851)
  br label %for.cond, !dbg !853

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !855
    #dbg_value(i32 %i.0, !852, !DIExpression(), !851)
  %cmp = icmp ult i32 %i.0, 3, !dbg !856
  br i1 %cmp, label %for.body, label %for.end, !dbg !858

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !859
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !860
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #2, !dbg !861
  br label %for.inc, !dbg !861

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !862
    #dbg_value(i32 %inc, !852, !DIExpression(), !851)
  br label %for.cond, !dbg !863, !llvm.loop !864

for.end:                                          ; preds = %for.cond
  ret void, !dbg !866
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) #0 !dbg !867 {
entry:
    #dbg_value(ptr %r, !868, !DIExpression(), !869)
    #dbg_value(i32 0, !870, !DIExpression(), !869)
  br label %for.cond, !dbg !871

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !873
    #dbg_value(i32 %i.0, !870, !DIExpression(), !869)
  %cmp = icmp ult i32 %i.0, 3, !dbg !874
  br i1 %cmp, label %for.body, label %for.end, !dbg !876

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !877
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !878
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #2, !dbg !879
  br label %for.inc, !dbg !879

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !880
    #dbg_value(i32 %inc, !870, !DIExpression(), !869)
  br label %for.cond, !dbg !881, !llvm.loop !882

for.end:                                          ; preds = %for.cond
  ret void, !dbg !884
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !885 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !889, !DIExpression(), !890)
    #dbg_value(ptr %a, !891, !DIExpression(), !890)
    #dbg_value(ptr %b, !892, !DIExpression(), !890)
    #dbg_declare(ptr %t, !893, !DIExpression(), !894)
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !895
  %arrayidx = getelementptr inbounds [3 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !896
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !897
  %arrayidx2 = getelementptr inbounds [3 x %struct.poly], ptr %vec1, i32 0, i32 0, !dbg !898
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %arrayidx, ptr noundef %arrayidx2) #2, !dbg !899
    #dbg_value(i32 1, !900, !DIExpression(), !890)
  br label %for.cond, !dbg !901

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !903
    #dbg_value(i32 %i.0, !900, !DIExpression(), !890)
  %cmp = icmp ult i32 %i.0, 3, !dbg !904
  br i1 %cmp, label %for.body, label %for.end, !dbg !906

for.body:                                         ; preds = %for.cond
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !907
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !909
  %vec5 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !910
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec5, i32 0, i32 %i.0, !dbg !911
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %t, ptr noundef %arrayidx4, ptr noundef %arrayidx6) #2, !dbg !912
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef %t) #2, !dbg !913
  br label %for.inc, !dbg !914

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !915
    #dbg_value(i32 %inc, !900, !DIExpression(), !890)
  br label %for.cond, !dbg !916, !llvm.loop !917

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #2, !dbg !919
  ret void, !dbg !920
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) #0 !dbg !921 {
entry:
    #dbg_value(ptr %r, !922, !DIExpression(), !923)
    #dbg_value(i32 0, !924, !DIExpression(), !923)
  br label %for.cond, !dbg !925

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !927
    #dbg_value(i32 %i.0, !924, !DIExpression(), !923)
  %cmp = icmp ult i32 %i.0, 3, !dbg !928
  br i1 %cmp, label %for.body, label %for.end, !dbg !930

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !931
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !932
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #2, !dbg !933
  br label %for.inc, !dbg !933

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !934
    #dbg_value(i32 %inc, !924, !DIExpression(), !923)
  br label %for.cond, !dbg !935, !llvm.loop !936

for.end:                                          ; preds = %for.cond
  ret void, !dbg !938
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !939 {
entry:
    #dbg_value(ptr %r, !942, !DIExpression(), !943)
    #dbg_value(ptr %a, !944, !DIExpression(), !943)
    #dbg_value(ptr %b, !945, !DIExpression(), !943)
    #dbg_value(i32 0, !946, !DIExpression(), !943)
  br label %for.cond, !dbg !947

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !949
    #dbg_value(i32 %i.0, !946, !DIExpression(), !943)
  %cmp = icmp ult i32 %i.0, 3, !dbg !950
  br i1 %cmp, label %for.body, label %for.end, !dbg !952

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !953
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !954
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !955
  %arrayidx2 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec1, i32 0, i32 %i.0, !dbg !956
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !957
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !958
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #2, !dbg !959
  br label %for.inc, !dbg !959

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !960
    #dbg_value(i32 %inc, !946, !DIExpression(), !943)
  br label %for.cond, !dbg !961, !llvm.loop !962

for.end:                                          ; preds = %for.cond
  ret void, !dbg !964
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !965 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !975, !DIExpression(), !976)
    #dbg_value(ptr %a, !977, !DIExpression(), !976)
    #dbg_declare(ptr %t, !978, !DIExpression(), !982)
    #dbg_value(i32 0, !983, !DIExpression(), !976)
  br label %for.cond, !dbg !984

for.cond:                                         ; preds = %for.inc45, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.inc45 ], !dbg !986
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.inc45 ]
    #dbg_value(ptr %r.addr.0, !975, !DIExpression(), !976)
    #dbg_value(i32 %i.0, !983, !DIExpression(), !976)
  %cmp = icmp ult i32 %i.0, 32, !dbg !987
  br i1 %cmp, label %for.body, label %for.end47, !dbg !989

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !990, !DIExpression(), !976)
  br label %for.cond1, !dbg !991

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !994
    #dbg_value(i32 %j.0, !990, !DIExpression(), !976)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !995
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !997

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !998
  %mul = mul i32 8, %i.0, !dbg !1000
  %add = add i32 %mul, %j.0, !dbg !1001
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1002
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1002
    #dbg_value(i16 %0, !1003, !DIExpression(), !976)
  %conv = sext i16 %0 to i32, !dbg !1004
  %shr = ashr i32 %conv, 15, !dbg !1005
  %and = and i32 %shr, 3329, !dbg !1006
  %conv4 = sext i16 %0 to i32, !dbg !1007
  %add5 = add nsw i32 %conv4, %and, !dbg !1007
  %conv6 = trunc i32 %add5 to i16, !dbg !1007
    #dbg_value(i16 %conv6, !1003, !DIExpression(), !976)
  %conv7 = sext i16 %conv6 to i32, !dbg !1008
  %shl = shl i32 %conv7, 4, !dbg !1009
    #dbg_value(i32 %shl, !1010, !DIExpression(), !976)
  %add8 = add i32 %shl, 1665, !dbg !1011
    #dbg_value(i32 %add8, !1010, !DIExpression(), !976)
  %mul9 = mul i32 %add8, 80635, !dbg !1012
    #dbg_value(i32 %mul9, !1010, !DIExpression(), !976)
  %shr10 = lshr i32 %mul9, 28, !dbg !1013
    #dbg_value(i32 %shr10, !1010, !DIExpression(), !976)
  %and11 = and i32 %shr10, 15, !dbg !1014
  %conv12 = trunc i32 %and11 to i8, !dbg !1015
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1016
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1017
  br label %for.inc, !dbg !1018

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1019
    #dbg_value(i32 %inc, !990, !DIExpression(), !976)
  br label %for.cond1, !dbg !1020, !llvm.loop !1021

for.end:                                          ; preds = %for.cond1
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1023
  %1 = load i8, ptr %arrayidx14, align 1, !dbg !1023
  %conv15 = zext i8 %1 to i32, !dbg !1023
  %arrayidx16 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1024
  %2 = load i8, ptr %arrayidx16, align 1, !dbg !1024
  %conv17 = zext i8 %2 to i32, !dbg !1024
  %shl18 = shl i32 %conv17, 4, !dbg !1025
  %or = or i32 %conv15, %shl18, !dbg !1026
  %conv19 = trunc i32 %or to i8, !dbg !1023
  %arrayidx20 = getelementptr inbounds i8, ptr %r.addr.0, i32 0, !dbg !1027
  store i8 %conv19, ptr %arrayidx20, align 1, !dbg !1028
  %arrayidx21 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1029
  %3 = load i8, ptr %arrayidx21, align 1, !dbg !1029
  %conv22 = zext i8 %3 to i32, !dbg !1029
  %arrayidx23 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1030
  %4 = load i8, ptr %arrayidx23, align 1, !dbg !1030
  %conv24 = zext i8 %4 to i32, !dbg !1030
  %shl25 = shl i32 %conv24, 4, !dbg !1031
  %or26 = or i32 %conv22, %shl25, !dbg !1032
  %conv27 = trunc i32 %or26 to i8, !dbg !1029
  %arrayidx28 = getelementptr inbounds i8, ptr %r.addr.0, i32 1, !dbg !1033
  store i8 %conv27, ptr %arrayidx28, align 1, !dbg !1034
  %arrayidx29 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1035
  %5 = load i8, ptr %arrayidx29, align 1, !dbg !1035
  %conv30 = zext i8 %5 to i32, !dbg !1035
  %arrayidx31 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1036
  %6 = load i8, ptr %arrayidx31, align 1, !dbg !1036
  %conv32 = zext i8 %6 to i32, !dbg !1036
  %shl33 = shl i32 %conv32, 4, !dbg !1037
  %or34 = or i32 %conv30, %shl33, !dbg !1038
  %conv35 = trunc i32 %or34 to i8, !dbg !1035
  %arrayidx36 = getelementptr inbounds i8, ptr %r.addr.0, i32 2, !dbg !1039
  store i8 %conv35, ptr %arrayidx36, align 1, !dbg !1040
  %arrayidx37 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1041
  %7 = load i8, ptr %arrayidx37, align 1, !dbg !1041
  %conv38 = zext i8 %7 to i32, !dbg !1041
  %arrayidx39 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1042
  %8 = load i8, ptr %arrayidx39, align 1, !dbg !1042
  %conv40 = zext i8 %8 to i32, !dbg !1042
  %shl41 = shl i32 %conv40, 4, !dbg !1043
  %or42 = or i32 %conv38, %shl41, !dbg !1044
  %conv43 = trunc i32 %or42 to i8, !dbg !1041
  %arrayidx44 = getelementptr inbounds i8, ptr %r.addr.0, i32 3, !dbg !1045
  store i8 %conv43, ptr %arrayidx44, align 1, !dbg !1046
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.0, i32 4, !dbg !1047
    #dbg_value(ptr %add.ptr, !975, !DIExpression(), !976)
  br label %for.inc45, !dbg !1048

for.inc45:                                        ; preds = %for.end
  %inc46 = add i32 %i.0, 1, !dbg !1049
    #dbg_value(i32 %inc46, !983, !DIExpression(), !976)
  br label %for.cond, !dbg !1050, !llvm.loop !1051

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1053
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !1054 {
entry:
    #dbg_value(ptr %r, !1058, !DIExpression(), !1059)
    #dbg_value(ptr %a, !1060, !DIExpression(), !1059)
    #dbg_value(i32 0, !1061, !DIExpression(), !1059)
  br label %for.cond, !dbg !1062

for.cond:                                         ; preds = %for.inc, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1064
    #dbg_value(i32 %i.0, !1061, !DIExpression(), !1059)
    #dbg_value(ptr %a.addr.0, !1060, !DIExpression(), !1059)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1065
  br i1 %cmp, label %for.body, label %for.end, !dbg !1067

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1068
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1068
  %conv = zext i8 %0 to i32, !dbg !1068
  %and = and i32 %conv, 15, !dbg !1070
  %conv1 = trunc i32 %and to i16, !dbg !1071
  %conv2 = zext i16 %conv1 to i32, !dbg !1071
  %mul = mul nsw i32 %conv2, 3329, !dbg !1072
  %add = add nsw i32 %mul, 8, !dbg !1073
  %shr = ashr i32 %add, 4, !dbg !1074
  %conv3 = trunc i32 %shr to i16, !dbg !1075
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1076
  %mul4 = mul i32 2, %i.0, !dbg !1077
  %add5 = add i32 %mul4, 0, !dbg !1078
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add5, !dbg !1079
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1080
  %arrayidx7 = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1081
  %1 = load i8, ptr %arrayidx7, align 1, !dbg !1081
  %conv8 = zext i8 %1 to i32, !dbg !1081
  %shr9 = ashr i32 %conv8, 4, !dbg !1082
  %conv10 = trunc i32 %shr9 to i16, !dbg !1083
  %conv11 = zext i16 %conv10 to i32, !dbg !1083
  %mul12 = mul nsw i32 %conv11, 3329, !dbg !1084
  %add13 = add nsw i32 %mul12, 8, !dbg !1085
  %shr14 = ashr i32 %add13, 4, !dbg !1086
  %conv15 = trunc i32 %shr14 to i16, !dbg !1087
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1088
  %mul17 = mul i32 2, %i.0, !dbg !1089
  %add18 = add i32 %mul17, 1, !dbg !1090
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1091
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !1092
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1093
    #dbg_value(ptr %add.ptr, !1060, !DIExpression(), !1059)
  br label %for.inc, !dbg !1094

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1095
    #dbg_value(i32 %inc, !1061, !DIExpression(), !1059)
  br label %for.cond, !dbg !1096, !llvm.loop !1097

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1099
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1100 {
entry:
    #dbg_value(ptr %r, !1101, !DIExpression(), !1102)
    #dbg_value(ptr %a, !1103, !DIExpression(), !1102)
    #dbg_value(i32 0, !1104, !DIExpression(), !1102)
  br label %for.cond, !dbg !1105

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1107
    #dbg_value(i32 %i.0, !1104, !DIExpression(), !1102)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1108
  br i1 %cmp, label %for.body, label %for.end, !dbg !1110

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1111
  %mul = mul i32 2, %i.0, !dbg !1113
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1114
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1114
    #dbg_value(i16 %0, !1115, !DIExpression(), !1102)
  %conv = sext i16 %0 to i32, !dbg !1116
  %shr = ashr i32 %conv, 15, !dbg !1117
  %and = and i32 %shr, 3329, !dbg !1118
  %conv1 = zext i16 %0 to i32, !dbg !1119
  %add = add nsw i32 %conv1, %and, !dbg !1119
  %conv2 = trunc i32 %add to i16, !dbg !1119
    #dbg_value(i16 %conv2, !1115, !DIExpression(), !1102)
  %coeffs3 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1120
  %mul4 = mul i32 2, %i.0, !dbg !1121
  %add5 = add i32 %mul4, 1, !dbg !1122
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs3, i32 0, i32 %add5, !dbg !1123
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1123
    #dbg_value(i16 %1, !1124, !DIExpression(), !1102)
  %conv7 = sext i16 %1 to i32, !dbg !1125
  %shr8 = ashr i32 %conv7, 15, !dbg !1126
  %and9 = and i32 %shr8, 3329, !dbg !1127
  %conv10 = zext i16 %1 to i32, !dbg !1128
  %add11 = add nsw i32 %conv10, %and9, !dbg !1128
  %conv12 = trunc i32 %add11 to i16, !dbg !1128
    #dbg_value(i16 %conv12, !1124, !DIExpression(), !1102)
  %conv13 = zext i16 %conv2 to i32, !dbg !1129
  %shr14 = ashr i32 %conv13, 0, !dbg !1130
  %conv15 = trunc i32 %shr14 to i8, !dbg !1131
  %mul16 = mul i32 3, %i.0, !dbg !1132
  %add17 = add i32 %mul16, 0, !dbg !1133
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %add17, !dbg !1134
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1135
  %conv19 = zext i16 %conv2 to i32, !dbg !1136
  %shr20 = ashr i32 %conv19, 8, !dbg !1137
  %conv21 = zext i16 %conv12 to i32, !dbg !1138
  %shl = shl i32 %conv21, 4, !dbg !1139
  %or = or i32 %shr20, %shl, !dbg !1140
  %conv22 = trunc i32 %or to i8, !dbg !1141
  %mul23 = mul i32 3, %i.0, !dbg !1142
  %add24 = add i32 %mul23, 1, !dbg !1143
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %r, i32 %add24, !dbg !1144
  store i8 %conv22, ptr %arrayidx25, align 1, !dbg !1145
  %conv26 = zext i16 %conv12 to i32, !dbg !1146
  %shr27 = ashr i32 %conv26, 4, !dbg !1147
  %conv28 = trunc i32 %shr27 to i8, !dbg !1148
  %mul29 = mul i32 3, %i.0, !dbg !1149
  %add30 = add i32 %mul29, 2, !dbg !1150
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %r, i32 %add30, !dbg !1151
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1152
  br label %for.inc, !dbg !1153

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1154
    #dbg_value(i32 %inc, !1104, !DIExpression(), !1102)
  br label %for.cond, !dbg !1155, !llvm.loop !1156

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1158
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1159 {
entry:
    #dbg_value(ptr %r, !1160, !DIExpression(), !1161)
    #dbg_value(ptr %a, !1162, !DIExpression(), !1161)
    #dbg_value(i32 0, !1163, !DIExpression(), !1161)
  br label %for.cond, !dbg !1164

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1166
    #dbg_value(i32 %i.0, !1163, !DIExpression(), !1161)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1167
  br i1 %cmp, label %for.body, label %for.end, !dbg !1169

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1170
  %add = add i32 %mul, 0, !dbg !1172
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %add, !dbg !1173
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1173
  %conv = zext i8 %0 to i32, !dbg !1173
  %shr = ashr i32 %conv, 0, !dbg !1174
  %mul1 = mul i32 3, %i.0, !dbg !1175
  %add2 = add i32 %mul1, 1, !dbg !1176
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %a, i32 %add2, !dbg !1177
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1177
  %conv4 = zext i8 %1 to i16, !dbg !1178
  %conv5 = zext i16 %conv4 to i32, !dbg !1178
  %shl = shl i32 %conv5, 8, !dbg !1179
  %or = or i32 %shr, %shl, !dbg !1180
  %and = and i32 %or, 4095, !dbg !1181
  %conv6 = trunc i32 %and to i16, !dbg !1182
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1183
  %mul7 = mul i32 2, %i.0, !dbg !1184
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul7, !dbg !1185
  store i16 %conv6, ptr %arrayidx8, align 2, !dbg !1186
  %mul9 = mul i32 3, %i.0, !dbg !1187
  %add10 = add i32 %mul9, 1, !dbg !1188
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %a, i32 %add10, !dbg !1189
  %2 = load i8, ptr %arrayidx11, align 1, !dbg !1189
  %conv12 = zext i8 %2 to i32, !dbg !1189
  %shr13 = ashr i32 %conv12, 4, !dbg !1190
  %mul14 = mul i32 3, %i.0, !dbg !1191
  %add15 = add i32 %mul14, 2, !dbg !1192
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 %add15, !dbg !1193
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1193
  %conv17 = zext i8 %3 to i16, !dbg !1194
  %conv18 = zext i16 %conv17 to i32, !dbg !1194
  %shl19 = shl i32 %conv18, 4, !dbg !1195
  %or20 = or i32 %shr13, %shl19, !dbg !1196
  %and21 = and i32 %or20, 4095, !dbg !1197
  %conv22 = trunc i32 %and21 to i16, !dbg !1198
  %coeffs23 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1199
  %mul24 = mul i32 2, %i.0, !dbg !1200
  %add25 = add i32 %mul24, 1, !dbg !1201
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %coeffs23, i32 0, i32 %add25, !dbg !1202
  store i16 %conv22, ptr %arrayidx26, align 2, !dbg !1203
  br label %for.inc, !dbg !1204

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1205
    #dbg_value(i32 %inc, !1163, !DIExpression(), !1161)
  br label %for.cond, !dbg !1206, !llvm.loop !1207

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1209
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) #0 !dbg !1210 {
entry:
    #dbg_value(ptr %r, !1211, !DIExpression(), !1212)
    #dbg_value(ptr %msg, !1213, !DIExpression(), !1212)
    #dbg_value(i32 0, !1214, !DIExpression(), !1212)
  br label %for.cond, !dbg !1215

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1217
    #dbg_value(i32 %i.0, !1214, !DIExpression(), !1212)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1218
  br i1 %cmp, label %for.body, label %for.end11, !dbg !1220

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1221, !DIExpression(), !1212)
  br label %for.cond1, !dbg !1222

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1225
    #dbg_value(i32 %j.0, !1221, !DIExpression(), !1212)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1226
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1228

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1229
  %mul = mul i32 8, %i.0, !dbg !1231
  %add = add i32 %mul, %j.0, !dbg !1232
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1233
  store i16 0, ptr %arrayidx, align 2, !dbg !1234
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1235
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs4, i32 0, i32 0, !dbg !1236
  %mul5 = mul i32 8, %i.0, !dbg !1237
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay, i32 %mul5, !dbg !1238
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1239
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1240
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1240
  %conv = zext i8 %0 to i32, !dbg !1240
  %shr = ashr i32 %conv, %j.0, !dbg !1241
  %and = and i32 %shr, 1, !dbg !1242
  %conv8 = trunc i32 %and to i16, !dbg !1243
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #2, !dbg !1244
  br label %for.inc, !dbg !1245

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1246
    #dbg_value(i32 %inc, !1221, !DIExpression(), !1212)
  br label %for.cond1, !dbg !1247, !llvm.loop !1248

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !1250

for.inc9:                                         ; preds = %for.end
  %inc10 = add i32 %i.0, 1, !dbg !1251
    #dbg_value(i32 %inc10, !1214, !DIExpression(), !1212)
  br label %for.cond, !dbg !1252, !llvm.loop !1253

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1255
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) #0 !dbg !1256 {
entry:
    #dbg_value(ptr %msg, !1257, !DIExpression(), !1258)
    #dbg_value(ptr %a, !1259, !DIExpression(), !1258)
    #dbg_value(i32 0, !1260, !DIExpression(), !1258)
  br label %for.cond, !dbg !1261

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1263
    #dbg_value(i32 %i.0, !1260, !DIExpression(), !1258)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1264
  br i1 %cmp, label %for.body, label %for.end13, !dbg !1266

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1267
  store i8 0, ptr %arrayidx, align 1, !dbg !1269
    #dbg_value(i32 0, !1270, !DIExpression(), !1258)
  br label %for.cond1, !dbg !1271

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1273
    #dbg_value(i32 %j.0, !1270, !DIExpression(), !1258)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1274
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1276

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1277
  %mul = mul i32 8, %i.0, !dbg !1279
  %add = add i32 %mul, %j.0, !dbg !1280
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1281
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1281
  %conv = sext i16 %0 to i32, !dbg !1281
    #dbg_value(i32 %conv, !1282, !DIExpression(), !1258)
  %shl = shl i32 %conv, 1, !dbg !1283
    #dbg_value(i32 %shl, !1282, !DIExpression(), !1258)
  %add5 = add i32 %shl, 1665, !dbg !1284
    #dbg_value(i32 %add5, !1282, !DIExpression(), !1258)
  %mul6 = mul i32 %add5, 80635, !dbg !1285
    #dbg_value(i32 %mul6, !1282, !DIExpression(), !1258)
  %shr = lshr i32 %mul6, 28, !dbg !1286
    #dbg_value(i32 %shr, !1282, !DIExpression(), !1258)
  %and = and i32 %shr, 1, !dbg !1287
    #dbg_value(i32 %and, !1282, !DIExpression(), !1258)
  %shl7 = shl i32 %and, %j.0, !dbg !1288
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1289
  %1 = load i8, ptr %arrayidx8, align 1, !dbg !1290
  %conv9 = zext i8 %1 to i32, !dbg !1290
  %or = or i32 %conv9, %shl7, !dbg !1290
  %conv10 = trunc i32 %or to i8, !dbg !1290
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1290
  br label %for.inc, !dbg !1291

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1292
    #dbg_value(i32 %inc, !1270, !DIExpression(), !1258)
  br label %for.cond1, !dbg !1293, !llvm.loop !1294

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !1296

for.inc11:                                        ; preds = %for.end
  %inc12 = add i32 %i.0, 1, !dbg !1297
    #dbg_value(i32 %inc12, !1260, !DIExpression(), !1258)
  br label %for.cond, !dbg !1298, !llvm.loop !1299

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1301
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1302 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1305, !DIExpression(), !1306)
    #dbg_value(ptr %seed, !1307, !DIExpression(), !1306)
    #dbg_value(i8 %nonce, !1308, !DIExpression(), !1306)
    #dbg_declare(ptr %buf, !1309, !DIExpression(), !1311)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1312
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1312
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1313
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1314
  ret void, !dbg !1315
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1316 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1317, !DIExpression(), !1318)
    #dbg_value(ptr %seed, !1319, !DIExpression(), !1318)
    #dbg_value(i8 %nonce, !1320, !DIExpression(), !1318)
    #dbg_declare(ptr %buf, !1321, !DIExpression(), !1322)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1323
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1323
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1324
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1325
  ret void, !dbg !1326
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) #0 !dbg !1327 {
entry:
    #dbg_value(ptr %r, !1330, !DIExpression(), !1331)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1332
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1333
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %arraydecay) #2, !dbg !1334
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #2, !dbg !1335
  ret void, !dbg !1336
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #0 !dbg !1337 {
entry:
    #dbg_value(ptr %r, !1338, !DIExpression(), !1339)
    #dbg_value(i32 0, !1340, !DIExpression(), !1339)
  br label %for.cond, !dbg !1341

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1343
    #dbg_value(i32 %i.0, !1340, !DIExpression(), !1339)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1344
  br i1 %cmp, label %for.body, label %for.end, !dbg !1346

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1347
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1348
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1348
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #2, !dbg !1349
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1350
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1351
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1352
  br label %for.inc, !dbg !1351

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1353
    #dbg_value(i32 %inc, !1340, !DIExpression(), !1339)
  br label %for.cond, !dbg !1354, !llvm.loop !1355

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1357
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) #0 !dbg !1358 {
entry:
    #dbg_value(ptr %r, !1359, !DIExpression(), !1360)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1361
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1362
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %arraydecay) #2, !dbg !1363
  ret void, !dbg !1364
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1365 {
entry:
    #dbg_value(ptr %r, !1368, !DIExpression(), !1369)
    #dbg_value(ptr %a, !1370, !DIExpression(), !1369)
    #dbg_value(ptr %b, !1371, !DIExpression(), !1369)
    #dbg_value(i32 0, !1372, !DIExpression(), !1369)
  br label %for.cond, !dbg !1373

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1375
    #dbg_value(i32 %i.0, !1372, !DIExpression(), !1369)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1376
  br i1 %cmp, label %for.body, label %for.end, !dbg !1378

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1379
  %mul = mul i32 4, %i.0, !dbg !1381
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1382
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1383
  %mul2 = mul i32 4, %i.0, !dbg !1384
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %mul2, !dbg !1385
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1386
  %mul5 = mul i32 4, %i.0, !dbg !1387
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs4, i32 0, i32 %mul5, !dbg !1388
  %add = add i32 64, %i.0, !dbg !1389
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1390
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1390
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #2, !dbg !1391
  %coeffs8 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1392
  %mul9 = mul i32 4, %i.0, !dbg !1393
  %add10 = add i32 %mul9, 2, !dbg !1394
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %coeffs8, i32 0, i32 %add10, !dbg !1395
  %coeffs12 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1396
  %mul13 = mul i32 4, %i.0, !dbg !1397
  %add14 = add i32 %mul13, 2, !dbg !1398
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %coeffs12, i32 0, i32 %add14, !dbg !1399
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1400
  %mul17 = mul i32 4, %i.0, !dbg !1401
  %add18 = add i32 %mul17, 2, !dbg !1402
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1403
  %add20 = add i32 64, %i.0, !dbg !1404
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add20, !dbg !1405
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1405
  %conv = sext i16 %1 to i32, !dbg !1405
  %sub = sub nsw i32 0, %conv, !dbg !1406
  %conv22 = trunc i32 %sub to i16, !dbg !1406
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx11, ptr noundef %arrayidx15, ptr noundef %arrayidx19, i16 noundef signext %conv22) #2, !dbg !1407
  br label %for.inc, !dbg !1408

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1409
    #dbg_value(i32 %inc, !1372, !DIExpression(), !1369)
  br label %for.cond, !dbg !1410, !llvm.loop !1411

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1413
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) #0 !dbg !1414 {
entry:
    #dbg_value(ptr %r, !1415, !DIExpression(), !1416)
    #dbg_value(i16 1353, !1417, !DIExpression(), !1416)
    #dbg_value(i32 0, !1418, !DIExpression(), !1416)
  br label %for.cond, !dbg !1419

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1421
    #dbg_value(i32 %i.0, !1418, !DIExpression(), !1416)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1422
  br i1 %cmp, label %for.body, label %for.end, !dbg !1424

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1425
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1426
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1426
  %conv = sext i16 %0 to i32, !dbg !1427
  %mul = mul nsw i32 %conv, 1353, !dbg !1428
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1429
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1430
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1431
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1432
  br label %for.inc, !dbg !1431

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1433
    #dbg_value(i32 %inc, !1418, !DIExpression(), !1416)
  br label %for.cond, !dbg !1434, !llvm.loop !1435

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1437
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1438 {
entry:
    #dbg_value(ptr %r, !1439, !DIExpression(), !1440)
    #dbg_value(ptr %a, !1441, !DIExpression(), !1440)
    #dbg_value(ptr %b, !1442, !DIExpression(), !1440)
    #dbg_value(i32 0, !1443, !DIExpression(), !1440)
  br label %for.cond, !dbg !1444

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1446
    #dbg_value(i32 %i.0, !1443, !DIExpression(), !1440)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1447
  br i1 %cmp, label %for.body, label %for.end, !dbg !1449

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1450
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1451
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1451
  %conv = sext i16 %0 to i32, !dbg !1451
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1452
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1453
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1453
  %conv3 = sext i16 %1 to i32, !dbg !1453
  %add = add nsw i32 %conv, %conv3, !dbg !1454
  %conv4 = trunc i32 %add to i16, !dbg !1451
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1455
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1456
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1457
  br label %for.inc, !dbg !1456

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1458
    #dbg_value(i32 %inc, !1443, !DIExpression(), !1440)
  br label %for.cond, !dbg !1459, !llvm.loop !1460

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1462
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1463 {
entry:
    #dbg_value(ptr %r, !1464, !DIExpression(), !1465)
    #dbg_value(ptr %a, !1466, !DIExpression(), !1465)
    #dbg_value(ptr %b, !1467, !DIExpression(), !1465)
    #dbg_value(i32 0, !1468, !DIExpression(), !1465)
  br label %for.cond, !dbg !1469

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1471
    #dbg_value(i32 %i.0, !1468, !DIExpression(), !1465)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1472
  br i1 %cmp, label %for.body, label %for.end, !dbg !1474

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1475
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1476
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1476
  %conv = sext i16 %0 to i32, !dbg !1476
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1477
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1478
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1478
  %conv3 = sext i16 %1 to i32, !dbg !1478
  %sub = sub nsw i32 %conv, %conv3, !dbg !1479
  %conv4 = trunc i32 %sub to i16, !dbg !1476
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1480
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1481
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1482
  br label %for.inc, !dbg !1481

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1483
    #dbg_value(i32 %inc, !1468, !DIExpression(), !1465)
  br label %for.cond, !dbg !1484, !llvm.loop !1485

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1487
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #0 !dbg !1488 {
entry:
    #dbg_value(ptr %r, !1491, !DIExpression(), !1492)
    #dbg_value(i32 1, !1493, !DIExpression(), !1492)
    #dbg_value(i32 128, !1494, !DIExpression(), !1492)
  br label %for.cond, !dbg !1495

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1497
  %k.0 = phi i32 [ 1, %entry ], [ %k.1, %for.inc24 ], !dbg !1498
    #dbg_value(i32 %k.0, !1493, !DIExpression(), !1492)
    #dbg_value(i32 %len.0, !1494, !DIExpression(), !1492)
  %cmp = icmp uge i32 %len.0, 2, !dbg !1499
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1501

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1502, !DIExpression(), !1492)
  br label %for.cond1, !dbg !1503

for.cond1:                                        ; preds = %for.inc21, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add22, %for.inc21 ], !dbg !1506
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc21 ], !dbg !1492
    #dbg_value(i32 %k.1, !1493, !DIExpression(), !1492)
    #dbg_value(i32 %start.0, !1502, !DIExpression(), !1492)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1507
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !1509

for.body3:                                        ; preds = %for.cond1
  %inc = add i32 %k.1, 1, !dbg !1510
    #dbg_value(i32 %inc, !1493, !DIExpression(), !1492)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1512
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1512
    #dbg_value(i16 %0, !1513, !DIExpression(), !1492)
    #dbg_value(i32 %start.0, !1514, !DIExpression(), !1492)
  br label %for.cond4, !dbg !1515

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.inc ], !dbg !1517
    #dbg_value(i32 %j.0, !1514, !DIExpression(), !1492)
  %add = add i32 %start.0, %len.0, !dbg !1518
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1520
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1521

for.body6:                                        ; preds = %for.cond4
  %add7 = add i32 %j.0, %len.0, !dbg !1522
  %arrayidx8 = getelementptr inbounds nuw i16, ptr %r, i32 %add7, !dbg !1524
  %1 = load i16, ptr %arrayidx8, align 2, !dbg !1524
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1525
    #dbg_value(i16 %call, !1526, !DIExpression(), !1492)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1527
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1527
  %conv = sext i16 %2 to i32, !dbg !1527
  %conv10 = sext i16 %call to i32, !dbg !1528
  %sub = sub nsw i32 %conv, %conv10, !dbg !1529
  %conv11 = trunc i32 %sub to i16, !dbg !1527
  %add12 = add i32 %j.0, %len.0, !dbg !1530
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %add12, !dbg !1531
  store i16 %conv11, ptr %arrayidx13, align 2, !dbg !1532
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1533
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !1533
  %conv15 = sext i16 %3 to i32, !dbg !1533
  %conv16 = sext i16 %call to i32, !dbg !1534
  %add17 = add nsw i32 %conv15, %conv16, !dbg !1535
  %conv18 = trunc i32 %add17 to i16, !dbg !1533
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1536
  store i16 %conv18, ptr %arrayidx19, align 2, !dbg !1537
  br label %for.inc, !dbg !1538

for.inc:                                          ; preds = %for.body6
  %inc20 = add i32 %j.0, 1, !dbg !1539
    #dbg_value(i32 %inc20, !1514, !DIExpression(), !1492)
  br label %for.cond4, !dbg !1540, !llvm.loop !1541

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !1543

for.inc21:                                        ; preds = %for.end
  %add22 = add i32 %j.0, %len.0, !dbg !1544
    #dbg_value(i32 %add22, !1502, !DIExpression(), !1492)
  br label %for.cond1, !dbg !1545, !llvm.loop !1546

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !1548

for.inc24:                                        ; preds = %for.end23
  %shr = lshr i32 %len.0, 1, !dbg !1549
    #dbg_value(i32 %shr, !1494, !DIExpression(), !1492)
  br label %for.cond, !dbg !1550, !llvm.loop !1551

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1553
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) #0 !dbg !1554 {
entry:
    #dbg_value(i16 %a, !1557, !DIExpression(), !1558)
    #dbg_value(i16 %b, !1559, !DIExpression(), !1558)
  %conv = sext i16 %a to i32, !dbg !1560
  %conv1 = sext i16 %b to i32, !dbg !1561
  %mul = mul nsw i32 %conv, %conv1, !dbg !1562
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1563
  ret i16 %call, !dbg !1564
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #0 !dbg !1565 {
entry:
    #dbg_value(ptr %r, !1566, !DIExpression(), !1567)
    #dbg_value(i16 1441, !1568, !DIExpression(), !1567)
    #dbg_value(i32 127, !1569, !DIExpression(), !1567)
    #dbg_value(i32 2, !1570, !DIExpression(), !1567)
  br label %for.cond, !dbg !1571

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1573
  %k.0 = phi i32 [ 127, %entry ], [ %k.1, %for.inc29 ], !dbg !1574
    #dbg_value(i32 %k.0, !1569, !DIExpression(), !1567)
    #dbg_value(i32 %len.0, !1570, !DIExpression(), !1567)
  %cmp = icmp ule i32 %len.0, 128, !dbg !1575
  br i1 %cmp, label %for.body, label %for.end30, !dbg !1577

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1578, !DIExpression(), !1567)
  br label %for.cond1, !dbg !1579

for.cond1:                                        ; preds = %for.inc26, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add27, %for.inc26 ], !dbg !1582
  %k.1 = phi i32 [ %k.0, %for.body ], [ %dec, %for.inc26 ], !dbg !1567
    #dbg_value(i32 %k.1, !1569, !DIExpression(), !1567)
    #dbg_value(i32 %start.0, !1578, !DIExpression(), !1567)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1583
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !1585

for.body3:                                        ; preds = %for.cond1
  %dec = add i32 %k.1, -1, !dbg !1586
    #dbg_value(i32 %dec, !1569, !DIExpression(), !1567)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1588
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1588
    #dbg_value(i16 %0, !1589, !DIExpression(), !1567)
    #dbg_value(i32 %start.0, !1590, !DIExpression(), !1567)
  br label %for.cond4, !dbg !1591

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.inc ], !dbg !1593
    #dbg_value(i32 %j.0, !1590, !DIExpression(), !1567)
  %add = add i32 %start.0, %len.0, !dbg !1594
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1596
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1597

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1598
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1598
    #dbg_value(i16 %1, !1600, !DIExpression(), !1567)
  %conv = sext i16 %1 to i32, !dbg !1601
  %add8 = add i32 %j.0, %len.0, !dbg !1602
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %add8, !dbg !1603
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1603
  %conv10 = sext i16 %2 to i32, !dbg !1603
  %add11 = add nsw i32 %conv, %conv10, !dbg !1604
  %conv12 = trunc i32 %add11 to i16, !dbg !1601
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %conv12) #2, !dbg !1605
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1606
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1607
  %add14 = add i32 %j.0, %len.0, !dbg !1608
  %arrayidx15 = getelementptr inbounds nuw i16, ptr %r, i32 %add14, !dbg !1609
  %3 = load i16, ptr %arrayidx15, align 2, !dbg !1609
  %conv16 = sext i16 %3 to i32, !dbg !1609
  %conv17 = sext i16 %1 to i32, !dbg !1610
  %sub = sub nsw i32 %conv16, %conv17, !dbg !1611
  %conv18 = trunc i32 %sub to i16, !dbg !1609
  %add19 = add i32 %j.0, %len.0, !dbg !1612
  %arrayidx20 = getelementptr inbounds nuw i16, ptr %r, i32 %add19, !dbg !1613
  store i16 %conv18, ptr %arrayidx20, align 2, !dbg !1614
  %add21 = add i32 %j.0, %len.0, !dbg !1615
  %arrayidx22 = getelementptr inbounds nuw i16, ptr %r, i32 %add21, !dbg !1616
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !1616
  %call23 = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %4) #2, !dbg !1617
  %add24 = add i32 %j.0, %len.0, !dbg !1618
  %arrayidx25 = getelementptr inbounds nuw i16, ptr %r, i32 %add24, !dbg !1619
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1620
  br label %for.inc, !dbg !1621

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %j.0, 1, !dbg !1622
    #dbg_value(i32 %inc, !1590, !DIExpression(), !1567)
  br label %for.cond4, !dbg !1623, !llvm.loop !1624

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !1626

for.inc26:                                        ; preds = %for.end
  %add27 = add i32 %j.0, %len.0, !dbg !1627
    #dbg_value(i32 %add27, !1578, !DIExpression(), !1567)
  br label %for.cond1, !dbg !1628, !llvm.loop !1629

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !1631

for.inc29:                                        ; preds = %for.end28
  %shl = shl i32 %len.0, 1, !dbg !1632
    #dbg_value(i32 %shl, !1570, !DIExpression(), !1567)
  br label %for.cond, !dbg !1633, !llvm.loop !1634

for.end30:                                        ; preds = %for.cond
    #dbg_value(i32 0, !1590, !DIExpression(), !1567)
  br label %for.cond31, !dbg !1636

for.cond31:                                       ; preds = %for.inc38, %for.end30
  %j.1 = phi i32 [ 0, %for.end30 ], [ %inc39, %for.inc38 ], !dbg !1638
    #dbg_value(i32 %j.1, !1590, !DIExpression(), !1567)
  %cmp32 = icmp ult i32 %j.1, 256, !dbg !1639
  br i1 %cmp32, label %for.body34, label %for.end40, !dbg !1641

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1642
  %5 = load i16, ptr %arrayidx35, align 2, !dbg !1642
  %call36 = call signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext 1441) #2, !dbg !1643
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1644
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1645
  br label %for.inc38, !dbg !1644

for.inc38:                                        ; preds = %for.body34
  %inc39 = add i32 %j.1, 1, !dbg !1646
    #dbg_value(i32 %inc39, !1590, !DIExpression(), !1567)
  br label %for.cond31, !dbg !1647, !llvm.loop !1648

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1650
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) #0 !dbg !1651 {
entry:
    #dbg_value(ptr %r, !1655, !DIExpression(), !1656)
    #dbg_value(ptr %a, !1657, !DIExpression(), !1656)
    #dbg_value(ptr %b, !1658, !DIExpression(), !1656)
    #dbg_value(i16 %zeta, !1659, !DIExpression(), !1656)
  %arrayidx = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1660
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1660
  %arrayidx1 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1661
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1661
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1662
  %arrayidx2 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1663
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1664
  %arrayidx3 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1665
  %2 = load i16, ptr %arrayidx3, align 2, !dbg !1665
  %call4 = call signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %zeta) #2, !dbg !1666
  %arrayidx5 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1667
  store i16 %call4, ptr %arrayidx5, align 2, !dbg !1668
  %arrayidx6 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1669
  %3 = load i16, ptr %arrayidx6, align 2, !dbg !1669
  %arrayidx7 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1670
  %4 = load i16, ptr %arrayidx7, align 2, !dbg !1670
  %call8 = call signext i16 @fqmul(i16 noundef signext %3, i16 noundef signext %4) #2, !dbg !1671
  %conv = sext i16 %call8 to i32, !dbg !1671
  %arrayidx9 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1672
  %5 = load i16, ptr %arrayidx9, align 2, !dbg !1673
  %conv10 = sext i16 %5 to i32, !dbg !1673
  %add = add nsw i32 %conv10, %conv, !dbg !1673
  %conv11 = trunc i32 %add to i16, !dbg !1673
  store i16 %conv11, ptr %arrayidx9, align 2, !dbg !1673
  %arrayidx12 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1674
  %6 = load i16, ptr %arrayidx12, align 2, !dbg !1674
  %arrayidx13 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1675
  %7 = load i16, ptr %arrayidx13, align 2, !dbg !1675
  %call14 = call signext i16 @fqmul(i16 noundef signext %6, i16 noundef signext %7) #2, !dbg !1676
  %arrayidx15 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1677
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1678
  %arrayidx16 = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1679
  %8 = load i16, ptr %arrayidx16, align 2, !dbg !1679
  %arrayidx17 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1680
  %9 = load i16, ptr %arrayidx17, align 2, !dbg !1680
  %call18 = call signext i16 @fqmul(i16 noundef signext %8, i16 noundef signext %9) #2, !dbg !1681
  %conv19 = sext i16 %call18 to i32, !dbg !1681
  %arrayidx20 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1682
  %10 = load i16, ptr %arrayidx20, align 2, !dbg !1683
  %conv21 = sext i16 %10 to i32, !dbg !1683
  %add22 = add nsw i32 %conv21, %conv19, !dbg !1683
  %conv23 = trunc i32 %add22 to i16, !dbg !1683
  store i16 %conv23, ptr %arrayidx20, align 2, !dbg !1683
  ret void, !dbg !1684
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) #0 !dbg !1685 {
entry:
    #dbg_value(ptr %r, !1694, !DIExpression(), !1695)
    #dbg_value(ptr %buf, !1696, !DIExpression(), !1695)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !1697
  ret void, !dbg !1698
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1699 {
entry:
    #dbg_value(ptr %r, !1700, !DIExpression(), !1701)
    #dbg_value(ptr %buf, !1702, !DIExpression(), !1701)
    #dbg_value(i32 0, !1703, !DIExpression(), !1701)
  br label %for.cond, !dbg !1704

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1706
    #dbg_value(i32 %i.0, !1703, !DIExpression(), !1701)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1707
  br i1 %cmp, label %for.body, label %for.end21, !dbg !1709

for.body:                                         ; preds = %for.cond
  %mul = mul i32 4, %i.0, !dbg !1710
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1712
  %call = call i32 @load32_littleendian(ptr noundef %add.ptr) #2, !dbg !1713
    #dbg_value(i32 %call, !1714, !DIExpression(), !1701)
  %and = and i32 %call, 1431655765, !dbg !1715
    #dbg_value(i32 %and, !1716, !DIExpression(), !1701)
  %shr = lshr i32 %call, 1, !dbg !1717
  %and1 = and i32 %shr, 1431655765, !dbg !1718
  %add = add i32 %and, %and1, !dbg !1719
    #dbg_value(i32 %add, !1716, !DIExpression(), !1701)
    #dbg_value(i32 0, !1720, !DIExpression(), !1701)
  br label %for.cond2, !dbg !1721

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1723
    #dbg_value(i32 %j.0, !1720, !DIExpression(), !1701)
  %cmp3 = icmp ult i32 %j.0, 8, !dbg !1724
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !1726

for.body4:                                        ; preds = %for.cond2
  %mul5 = mul i32 4, %j.0, !dbg !1727
  %add6 = add i32 %mul5, 0, !dbg !1729
  %shr7 = lshr i32 %add, %add6, !dbg !1730
  %and8 = and i32 %shr7, 3, !dbg !1731
  %conv = trunc i32 %and8 to i16, !dbg !1732
    #dbg_value(i16 %conv, !1733, !DIExpression(), !1701)
  %mul9 = mul i32 4, %j.0, !dbg !1734
  %add10 = add i32 %mul9, 2, !dbg !1735
  %shr11 = lshr i32 %add, %add10, !dbg !1736
  %and12 = and i32 %shr11, 3, !dbg !1737
  %conv13 = trunc i32 %and12 to i16, !dbg !1738
    #dbg_value(i16 %conv13, !1739, !DIExpression(), !1701)
  %conv14 = sext i16 %conv to i32, !dbg !1740
  %conv15 = sext i16 %conv13 to i32, !dbg !1741
  %sub = sub nsw i32 %conv14, %conv15, !dbg !1742
  %conv16 = trunc i32 %sub to i16, !dbg !1740
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1743
  %mul17 = mul i32 8, %i.0, !dbg !1744
  %add18 = add i32 %mul17, %j.0, !dbg !1745
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add18, !dbg !1746
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1747
  br label %for.inc, !dbg !1748

for.inc:                                          ; preds = %for.body4
  %inc = add i32 %j.0, 1, !dbg !1749
    #dbg_value(i32 %inc, !1720, !DIExpression(), !1701)
  br label %for.cond2, !dbg !1750, !llvm.loop !1751

for.end:                                          ; preds = %for.cond2
  br label %for.inc19, !dbg !1753

for.inc19:                                        ; preds = %for.end
  %inc20 = add i32 %i.0, 1, !dbg !1754
    #dbg_value(i32 %inc20, !1703, !DIExpression(), !1701)
  br label %for.cond, !dbg !1755, !llvm.loop !1756

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1758
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load32_littleendian(ptr noundef %x) #0 !dbg !1759 {
entry:
    #dbg_value(ptr %x, !1762, !DIExpression(), !1763)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !1764
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1764
  %conv = zext i8 %0 to i32, !dbg !1765
    #dbg_value(i32 %conv, !1766, !DIExpression(), !1763)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !1767
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1767
  %conv2 = zext i8 %1 to i32, !dbg !1768
  %shl = shl i32 %conv2, 8, !dbg !1769
  %or = or i32 %conv, %shl, !dbg !1770
    #dbg_value(i32 %or, !1766, !DIExpression(), !1763)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !1771
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1771
  %conv4 = zext i8 %2 to i32, !dbg !1772
  %shl5 = shl i32 %conv4, 16, !dbg !1773
  %or6 = or i32 %or, %shl5, !dbg !1774
    #dbg_value(i32 %or6, !1766, !DIExpression(), !1763)
  %arrayidx7 = getelementptr inbounds i8, ptr %x, i32 3, !dbg !1775
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1775
  %conv8 = zext i8 %3 to i32, !dbg !1776
  %shl9 = shl i32 %conv8, 24, !dbg !1777
  %or10 = or i32 %or6, %shl9, !dbg !1778
    #dbg_value(i32 %or10, !1766, !DIExpression(), !1763)
  ret i32 %or10, !dbg !1779
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1780 {
entry:
    #dbg_value(ptr %r, !1781, !DIExpression(), !1782)
    #dbg_value(ptr %buf, !1783, !DIExpression(), !1782)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !1784
  ret void, !dbg !1785
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) #0 !dbg !1786 {
entry:
    #dbg_value(i32 %a, !1789, !DIExpression(), !1790)
  %conv = trunc i32 %a to i16, !dbg !1791
  %conv1 = sext i16 %conv to i32, !dbg !1791
  %mul = mul nsw i32 %conv1, -3327, !dbg !1792
  %conv2 = trunc i32 %mul to i16, !dbg !1791
    #dbg_value(i16 %conv2, !1793, !DIExpression(), !1790)
  %conv3 = sext i16 %conv2 to i32, !dbg !1794
  %mul4 = mul nsw i32 %conv3, 3329, !dbg !1795
  %sub = sub nsw i32 %a, %mul4, !dbg !1796
  %shr = ashr i32 %sub, 16, !dbg !1797
  %conv5 = trunc i32 %shr to i16, !dbg !1798
    #dbg_value(i16 %conv5, !1793, !DIExpression(), !1790)
  ret i16 %conv5, !dbg !1799
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) #0 !dbg !1800 {
entry:
    #dbg_value(i16 %a, !1803, !DIExpression(), !1804)
    #dbg_value(i16 20159, !1805, !DIExpression(), !1804)
  %conv = sext i16 %a to i32, !dbg !1806
  %mul = mul nsw i32 20159, %conv, !dbg !1807
  %add = add nsw i32 %mul, 33554432, !dbg !1808
  %shr = ashr i32 %add, 26, !dbg !1809
  %conv1 = trunc i32 %shr to i16, !dbg !1810
    #dbg_value(i16 %conv1, !1811, !DIExpression(), !1804)
  %conv2 = sext i16 %conv1 to i32, !dbg !1812
  %mul3 = mul nsw i32 %conv2, 3329, !dbg !1812
  %conv4 = trunc i32 %mul3 to i16, !dbg !1812
    #dbg_value(i16 %conv4, !1811, !DIExpression(), !1804)
  %conv5 = sext i16 %a to i32, !dbg !1813
  %conv6 = sext i16 %conv4 to i32, !dbg !1814
  %sub = sub nsw i32 %conv5, %conv6, !dbg !1815
  %conv7 = trunc i32 %sub to i16, !dbg !1813
  ret i16 %conv7, !dbg !1816
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) #0 !dbg !1817 {
entry:
    #dbg_value(ptr %a, !1823, !DIExpression(), !1824)
    #dbg_value(ptr %b, !1825, !DIExpression(), !1824)
    #dbg_value(i32 %len, !1826, !DIExpression(), !1824)
    #dbg_value(i8 0, !1827, !DIExpression(), !1824)
    #dbg_value(i32 0, !1828, !DIExpression(), !1824)
  br label %for.cond, !dbg !1829

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1831
  %r.0 = phi i8 [ 0, %entry ], [ %conv4, %for.inc ], !dbg !1824
    #dbg_value(i8 %r.0, !1827, !DIExpression(), !1824)
    #dbg_value(i32 %i.0, !1828, !DIExpression(), !1824)
  %cmp = icmp ult i32 %i.0, %len, !dbg !1832
  br i1 %cmp, label %for.body, label %for.end, !dbg !1834

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1835
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1835
  %conv = zext i8 %0 to i32, !dbg !1835
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1836
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1836
  %conv2 = zext i8 %1 to i32, !dbg !1836
  %xor = xor i32 %conv, %conv2, !dbg !1837
  %conv3 = zext i8 %r.0 to i32, !dbg !1838
  %or = or i32 %conv3, %xor, !dbg !1838
  %conv4 = trunc i32 %or to i8, !dbg !1838
    #dbg_value(i8 %conv4, !1827, !DIExpression(), !1824)
  br label %for.inc, !dbg !1839

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1840
    #dbg_value(i32 %inc, !1828, !DIExpression(), !1824)
  br label %for.cond, !dbg !1841, !llvm.loop !1842

for.end:                                          ; preds = %for.cond
  %conv5 = zext i8 %r.0 to i64, !dbg !1844
  %sub = sub i64 0, %conv5, !dbg !1845
  %shr = lshr i64 %sub, 63, !dbg !1846
  %conv6 = trunc i64 %shr to i32, !dbg !1847
  ret i32 %conv6, !dbg !1848
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) #0 !dbg !1849 {
entry:
    #dbg_value(ptr %r, !1852, !DIExpression(), !1853)
    #dbg_value(ptr %x, !1854, !DIExpression(), !1853)
    #dbg_value(i32 %len, !1855, !DIExpression(), !1853)
    #dbg_value(i8 %b, !1856, !DIExpression(), !1853)
  %0 = call i8 asm "", "=r,0"(i8 %b) #3, !dbg !1857, !srcloc !1858
    #dbg_value(i8 %0, !1856, !DIExpression(), !1853)
  %conv = zext i8 %0 to i32, !dbg !1859
  %sub = sub nsw i32 0, %conv, !dbg !1860
  %conv1 = trunc i32 %sub to i8, !dbg !1860
    #dbg_value(i8 %conv1, !1856, !DIExpression(), !1853)
    #dbg_value(i32 0, !1861, !DIExpression(), !1853)
  br label %for.cond, !dbg !1862

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1864
    #dbg_value(i32 %i.0, !1861, !DIExpression(), !1853)
  %cmp = icmp ult i32 %i.0, %len, !dbg !1865
  br i1 %cmp, label %for.body, label %for.end, !dbg !1867

for.body:                                         ; preds = %for.cond
  %conv3 = zext i8 %conv1 to i32, !dbg !1868
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1869
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1869
  %conv4 = zext i8 %1 to i32, !dbg !1869
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1870
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1870
  %conv6 = zext i8 %2 to i32, !dbg !1870
  %xor = xor i32 %conv4, %conv6, !dbg !1871
  %and = and i32 %conv3, %xor, !dbg !1872
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1873
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1874
  %conv8 = zext i8 %3 to i32, !dbg !1874
  %xor9 = xor i32 %conv8, %and, !dbg !1874
  %conv10 = trunc i32 %xor9 to i8, !dbg !1874
  store i8 %conv10, ptr %arrayidx7, align 1, !dbg !1874
  br label %for.inc, !dbg !1873

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1875
    #dbg_value(i32 %inc, !1861, !DIExpression(), !1853)
  br label %for.cond, !dbg !1876, !llvm.loop !1877

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1879
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) #0 !dbg !1880 {
entry:
    #dbg_value(ptr %r, !1883, !DIExpression(), !1884)
    #dbg_value(i16 %v, !1885, !DIExpression(), !1884)
    #dbg_value(i16 %b, !1886, !DIExpression(), !1884)
  %conv = zext i16 %b to i32, !dbg !1887
  %sub = sub nsw i32 0, %conv, !dbg !1888
  %conv1 = trunc i32 %sub to i16, !dbg !1888
    #dbg_value(i16 %conv1, !1886, !DIExpression(), !1884)
  %conv2 = zext i16 %conv1 to i32, !dbg !1889
  %0 = load i16, ptr %r, align 2, !dbg !1890
  %conv3 = sext i16 %0 to i32, !dbg !1891
  %conv4 = sext i16 %v to i32, !dbg !1892
  %xor = xor i32 %conv3, %conv4, !dbg !1893
  %and = and i32 %conv2, %xor, !dbg !1894
  %1 = load i16, ptr %r, align 2, !dbg !1895
  %conv5 = sext i16 %1 to i32, !dbg !1895
  %xor6 = xor i32 %conv5, %and, !dbg !1895
  %conv7 = trunc i32 %xor6 to i16, !dbg !1895
  store i16 %conv7, ptr %r, align 2, !dbg !1895
  ret void, !dbg !1896
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) #0 !dbg !1897 {
entry:
    #dbg_value(ptr %state, !1906, !DIExpression(), !1907)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !1908
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !1909
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !1910
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !1911
  store i32 0, ptr %pos, align 8, !dbg !1912
  ret void, !dbg !1913
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_init(ptr noundef %s) #0 !dbg !1914 {
entry:
    #dbg_value(ptr %s, !1918, !DIExpression(), !1919)
    #dbg_value(i32 0, !1920, !DIExpression(), !1919)
  br label %for.cond, !dbg !1921

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1923
    #dbg_value(i32 %i.0, !1920, !DIExpression(), !1919)
  %cmp = icmp ult i32 %i.0, 25, !dbg !1924
  br i1 %cmp, label %for.body, label %for.end, !dbg !1926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1927
  store i64 0, ptr %arrayidx, align 8, !dbg !1928
  br label %for.inc, !dbg !1927

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1929
    #dbg_value(i32 %inc, !1920, !DIExpression(), !1919)
  br label %for.cond, !dbg !1930, !llvm.loop !1931

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1933
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !1934 {
entry:
    #dbg_value(ptr %state, !1937, !DIExpression(), !1938)
    #dbg_value(ptr %in, !1939, !DIExpression(), !1938)
    #dbg_value(i32 %inlen, !1940, !DIExpression(), !1938)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !1941
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !1942
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !1943
  %0 = load i32, ptr %pos, align 8, !dbg !1943
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #2, !dbg !1944
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !1945
  store i32 %call, ptr %pos1, align 8, !dbg !1946
  ret void, !dbg !1947
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) #0 !dbg !1948 {
entry:
    #dbg_value(ptr %s, !1951, !DIExpression(), !1952)
    #dbg_value(i32 %pos, !1953, !DIExpression(), !1952)
    #dbg_value(i32 %r, !1954, !DIExpression(), !1952)
    #dbg_value(ptr %in, !1955, !DIExpression(), !1952)
    #dbg_value(i32 %inlen, !1956, !DIExpression(), !1952)
  br label %while.cond, !dbg !1957

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1953, !DIExpression(), !1952)
    #dbg_value(i32 %inlen.addr.0, !1956, !DIExpression(), !1952)
    #dbg_value(ptr %in.addr.0, !1955, !DIExpression(), !1952)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1958
  %cmp = icmp uge i32 %add, %r, !dbg !1959
  br i1 %cmp, label %while.body, label %while.end, !dbg !1957

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !1960, !DIExpression(), !1952)
  br label %for.cond, !dbg !1961

for.cond:                                         ; preds = %for.inc, %while.body
  %in.addr.1 = phi ptr [ %in.addr.0, %while.body ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ %pos.addr.0, %while.body ], [ %inc, %for.inc ], !dbg !1964
    #dbg_value(i32 %i.0, !1960, !DIExpression(), !1952)
    #dbg_value(ptr %in.addr.1, !1955, !DIExpression(), !1952)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !1965
  br i1 %cmp1, label %for.body, label %for.end, !dbg !1967

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1968
    #dbg_value(ptr %incdec.ptr, !1955, !DIExpression(), !1952)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1969
  %conv = zext i8 %0 to i64, !dbg !1970
  %rem = urem i32 %i.0, 8, !dbg !1971
  %mul = mul i32 8, %rem, !dbg !1972
  %sh_prom = zext i32 %mul to i64, !dbg !1973
  %shl = shl i64 %conv, %sh_prom, !dbg !1973
  %div = udiv i32 %i.0, 8, !dbg !1974
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !1975
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1976
  %xor = xor i64 %1, %shl, !dbg !1976
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1976
  br label %for.inc, !dbg !1975

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1977
    #dbg_value(i32 %inc, !1960, !DIExpression(), !1952)
  br label %for.cond, !dbg !1978, !llvm.loop !1979

for.end:                                          ; preds = %for.cond
  %sub = sub i32 %r, %pos.addr.0, !dbg !1981
  %sub2 = sub i32 %inlen.addr.0, %sub, !dbg !1982
    #dbg_value(i32 %sub2, !1956, !DIExpression(), !1952)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !1983
    #dbg_value(i32 0, !1953, !DIExpression(), !1952)
  br label %while.cond, !dbg !1957, !llvm.loop !1984

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !1960, !DIExpression(), !1952)
  br label %for.cond3, !dbg !1986

for.cond3:                                        ; preds = %for.inc17, %while.end
  %in.addr.2 = phi ptr [ %in.addr.0, %while.end ], [ %incdec.ptr8, %for.inc17 ]
  %i.1 = phi i32 [ %pos.addr.0, %while.end ], [ %inc18, %for.inc17 ], !dbg !1988
    #dbg_value(i32 %i.1, !1960, !DIExpression(), !1952)
    #dbg_value(ptr %in.addr.2, !1955, !DIExpression(), !1952)
  %add4 = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1989
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1991
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1992

for.body7:                                        ; preds = %for.cond3
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1993
    #dbg_value(ptr %incdec.ptr8, !1955, !DIExpression(), !1952)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1994
  %conv9 = zext i8 %2 to i64, !dbg !1995
  %rem10 = urem i32 %i.1, 8, !dbg !1996
  %mul11 = mul i32 8, %rem10, !dbg !1997
  %sh_prom12 = zext i32 %mul11 to i64, !dbg !1998
  %shl13 = shl i64 %conv9, %sh_prom12, !dbg !1998
  %div14 = udiv i32 %i.1, 8, !dbg !1999
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div14, !dbg !2000
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2001
  %xor16 = xor i64 %3, %shl13, !dbg !2001
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2001
  br label %for.inc17, !dbg !2000

for.inc17:                                        ; preds = %for.body7
  %inc18 = add i32 %i.1, 1, !dbg !2002
    #dbg_value(i32 %inc18, !1960, !DIExpression(), !1952)
  br label %for.cond3, !dbg !2003, !llvm.loop !2004

for.end19:                                        ; preds = %for.cond3
  ret i32 %i.1, !dbg !2006
}

; Function Attrs: noinline nounwind optnone
define internal void @KeccakF1600_StatePermute(ptr noundef %state) #0 !dbg !2007 {
entry:
    #dbg_value(ptr %state, !2008, !DIExpression(), !2009)
  %arrayidx = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2010
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2010
    #dbg_value(i64 %0, !2011, !DIExpression(), !2009)
  %arrayidx1 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2012
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2012
    #dbg_value(i64 %1, !2013, !DIExpression(), !2009)
  %arrayidx2 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2014
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2014
    #dbg_value(i64 %2, !2015, !DIExpression(), !2009)
  %arrayidx3 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2016
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2016
    #dbg_value(i64 %3, !2017, !DIExpression(), !2009)
  %arrayidx4 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2018
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2018
    #dbg_value(i64 %4, !2019, !DIExpression(), !2009)
  %arrayidx5 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2020
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2020
    #dbg_value(i64 %5, !2021, !DIExpression(), !2009)
  %arrayidx6 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2022
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2022
    #dbg_value(i64 %6, !2023, !DIExpression(), !2009)
  %arrayidx7 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2024
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2024
    #dbg_value(i64 %7, !2025, !DIExpression(), !2009)
  %arrayidx8 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2026
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2026
    #dbg_value(i64 %8, !2027, !DIExpression(), !2009)
  %arrayidx9 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2028
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2028
    #dbg_value(i64 %9, !2029, !DIExpression(), !2009)
  %arrayidx10 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2030
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2030
    #dbg_value(i64 %10, !2031, !DIExpression(), !2009)
  %arrayidx11 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2032
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2032
    #dbg_value(i64 %11, !2033, !DIExpression(), !2009)
  %arrayidx12 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2034
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2034
    #dbg_value(i64 %12, !2035, !DIExpression(), !2009)
  %arrayidx13 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2036
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2036
    #dbg_value(i64 %13, !2037, !DIExpression(), !2009)
  %arrayidx14 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2038
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2038
    #dbg_value(i64 %14, !2039, !DIExpression(), !2009)
  %arrayidx15 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2040
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2040
    #dbg_value(i64 %15, !2041, !DIExpression(), !2009)
  %arrayidx16 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2042
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2042
    #dbg_value(i64 %16, !2043, !DIExpression(), !2009)
  %arrayidx17 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2044
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2044
    #dbg_value(i64 %17, !2045, !DIExpression(), !2009)
  %arrayidx18 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2046
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2046
    #dbg_value(i64 %18, !2047, !DIExpression(), !2009)
  %arrayidx19 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2048
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2048
    #dbg_value(i64 %19, !2049, !DIExpression(), !2009)
  %arrayidx20 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2050
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2050
    #dbg_value(i64 %20, !2051, !DIExpression(), !2009)
  %arrayidx21 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2052
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2052
    #dbg_value(i64 %21, !2053, !DIExpression(), !2009)
  %arrayidx22 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2054
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2054
    #dbg_value(i64 %22, !2055, !DIExpression(), !2009)
  %arrayidx23 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2056
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2056
    #dbg_value(i64 %23, !2057, !DIExpression(), !2009)
  %arrayidx24 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2058
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2058
    #dbg_value(i64 %24, !2059, !DIExpression(), !2009)
    #dbg_value(i32 0, !2060, !DIExpression(), !2009)
  br label %for.cond, !dbg !2061

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2009
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2009
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2009
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2009
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2009
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2009
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2009
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2009
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2009
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2009
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2009
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2009
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2009
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2009
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2009
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2009
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2009
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2009
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2009
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2009
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2009
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2009
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2009
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2009
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2063
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2009
    #dbg_value(i64 %Asu.0, !2059, !DIExpression(), !2009)
    #dbg_value(i32 %round.0, !2060, !DIExpression(), !2009)
    #dbg_value(i64 %Aba.0, !2011, !DIExpression(), !2009)
    #dbg_value(i64 %Abe.0, !2013, !DIExpression(), !2009)
    #dbg_value(i64 %Abi.0, !2015, !DIExpression(), !2009)
    #dbg_value(i64 %Abo.0, !2017, !DIExpression(), !2009)
    #dbg_value(i64 %Abu.0, !2019, !DIExpression(), !2009)
    #dbg_value(i64 %Aga.0, !2021, !DIExpression(), !2009)
    #dbg_value(i64 %Age.0, !2023, !DIExpression(), !2009)
    #dbg_value(i64 %Agi.0, !2025, !DIExpression(), !2009)
    #dbg_value(i64 %Ago.0, !2027, !DIExpression(), !2009)
    #dbg_value(i64 %Agu.0, !2029, !DIExpression(), !2009)
    #dbg_value(i64 %Aka.0, !2031, !DIExpression(), !2009)
    #dbg_value(i64 %Ake.0, !2033, !DIExpression(), !2009)
    #dbg_value(i64 %Aki.0, !2035, !DIExpression(), !2009)
    #dbg_value(i64 %Ako.0, !2037, !DIExpression(), !2009)
    #dbg_value(i64 %Aku.0, !2039, !DIExpression(), !2009)
    #dbg_value(i64 %Ama.0, !2041, !DIExpression(), !2009)
    #dbg_value(i64 %Ame.0, !2043, !DIExpression(), !2009)
    #dbg_value(i64 %Ami.0, !2045, !DIExpression(), !2009)
    #dbg_value(i64 %Amo.0, !2047, !DIExpression(), !2009)
    #dbg_value(i64 %Amu.0, !2049, !DIExpression(), !2009)
    #dbg_value(i64 %Asa.0, !2051, !DIExpression(), !2009)
    #dbg_value(i64 %Ase.0, !2053, !DIExpression(), !2009)
    #dbg_value(i64 %Asi.0, !2055, !DIExpression(), !2009)
    #dbg_value(i64 %Aso.0, !2057, !DIExpression(), !2009)
  %cmp = icmp slt i32 %round.0, 24, !dbg !2064
  br i1 %cmp, label %for.body, label %for.end, !dbg !2066

for.body:                                         ; preds = %for.cond
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2067
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2069
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2070
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2071
    #dbg_value(i64 %xor27, !2072, !DIExpression(), !2009)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2073
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2074
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2075
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2076
    #dbg_value(i64 %xor31, !2077, !DIExpression(), !2009)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2078
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2079
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2080
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2081
    #dbg_value(i64 %xor35, !2082, !DIExpression(), !2009)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2083
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2084
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2085
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2086
    #dbg_value(i64 %xor39, !2087, !DIExpression(), !2009)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2088
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2089
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2090
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2091
    #dbg_value(i64 %xor43, !2092, !DIExpression(), !2009)
  %shl = shl i64 %xor31, 1, !dbg !2093
  %shr = lshr i64 %xor31, 63, !dbg !2093
  %xor44 = xor i64 %shl, %shr, !dbg !2093
  %xor45 = xor i64 %xor43, %xor44, !dbg !2094
    #dbg_value(i64 %xor45, !2095, !DIExpression(), !2009)
  %shl46 = shl i64 %xor35, 1, !dbg !2096
  %shr47 = lshr i64 %xor35, 63, !dbg !2096
  %xor48 = xor i64 %shl46, %shr47, !dbg !2096
  %xor49 = xor i64 %xor27, %xor48, !dbg !2097
    #dbg_value(i64 %xor49, !2098, !DIExpression(), !2009)
  %shl50 = shl i64 %xor39, 1, !dbg !2099
  %shr51 = lshr i64 %xor39, 63, !dbg !2099
  %xor52 = xor i64 %shl50, %shr51, !dbg !2099
  %xor53 = xor i64 %xor31, %xor52, !dbg !2100
    #dbg_value(i64 %xor53, !2101, !DIExpression(), !2009)
  %shl54 = shl i64 %xor43, 1, !dbg !2102
  %shr55 = lshr i64 %xor43, 63, !dbg !2102
  %xor56 = xor i64 %shl54, %shr55, !dbg !2102
  %xor57 = xor i64 %xor35, %xor56, !dbg !2103
    #dbg_value(i64 %xor57, !2104, !DIExpression(), !2009)
  %shl58 = shl i64 %xor27, 1, !dbg !2105
  %shr59 = lshr i64 %xor27, 63, !dbg !2105
  %xor60 = xor i64 %shl58, %shr59, !dbg !2105
  %xor61 = xor i64 %xor39, %xor60, !dbg !2106
    #dbg_value(i64 %xor61, !2107, !DIExpression(), !2009)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2108
    #dbg_value(i64 %xor62, !2011, !DIExpression(), !2009)
    #dbg_value(i64 %xor62, !2072, !DIExpression(), !2009)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2109
    #dbg_value(i64 %xor63, !2023, !DIExpression(), !2009)
  %shl64 = shl i64 %xor63, 44, !dbg !2110
  %shr65 = lshr i64 %xor63, 20, !dbg !2110
  %xor66 = xor i64 %shl64, %shr65, !dbg !2110
    #dbg_value(i64 %xor66, !2077, !DIExpression(), !2009)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2111
    #dbg_value(i64 %xor67, !2035, !DIExpression(), !2009)
  %shl68 = shl i64 %xor67, 43, !dbg !2112
  %shr69 = lshr i64 %xor67, 21, !dbg !2112
  %xor70 = xor i64 %shl68, %shr69, !dbg !2112
    #dbg_value(i64 %xor70, !2082, !DIExpression(), !2009)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2113
    #dbg_value(i64 %xor71, !2047, !DIExpression(), !2009)
  %shl72 = shl i64 %xor71, 21, !dbg !2114
  %shr73 = lshr i64 %xor71, 43, !dbg !2114
  %xor74 = xor i64 %shl72, %shr73, !dbg !2114
    #dbg_value(i64 %xor74, !2087, !DIExpression(), !2009)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2115
    #dbg_value(i64 %xor75, !2059, !DIExpression(), !2009)
  %shl76 = shl i64 %xor75, 14, !dbg !2116
  %shr77 = lshr i64 %xor75, 50, !dbg !2116
  %xor78 = xor i64 %shl76, %shr77, !dbg !2116
    #dbg_value(i64 %xor78, !2092, !DIExpression(), !2009)
  %not = xor i64 %xor66, -1, !dbg !2117
  %and = and i64 %not, %xor70, !dbg !2118
  %xor79 = xor i64 %xor62, %and, !dbg !2119
    #dbg_value(i64 %xor79, !2120, !DIExpression(), !2009)
  %arrayidx80 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2121
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2121
  %xor81 = xor i64 %xor79, %25, !dbg !2122
    #dbg_value(i64 %xor81, !2120, !DIExpression(), !2009)
  %not82 = xor i64 %xor70, -1, !dbg !2123
  %and83 = and i64 %not82, %xor74, !dbg !2124
  %xor84 = xor i64 %xor66, %and83, !dbg !2125
    #dbg_value(i64 %xor84, !2126, !DIExpression(), !2009)
  %not85 = xor i64 %xor74, -1, !dbg !2127
  %and86 = and i64 %not85, %xor78, !dbg !2128
  %xor87 = xor i64 %xor70, %and86, !dbg !2129
    #dbg_value(i64 %xor87, !2130, !DIExpression(), !2009)
  %not88 = xor i64 %xor78, -1, !dbg !2131
  %and89 = and i64 %not88, %xor62, !dbg !2132
  %xor90 = xor i64 %xor74, %and89, !dbg !2133
    #dbg_value(i64 %xor90, !2134, !DIExpression(), !2009)
  %not91 = xor i64 %xor62, -1, !dbg !2135
  %and92 = and i64 %not91, %xor66, !dbg !2136
  %xor93 = xor i64 %xor78, %and92, !dbg !2137
    #dbg_value(i64 %xor93, !2138, !DIExpression(), !2009)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2139
    #dbg_value(i64 %xor94, !2017, !DIExpression(), !2009)
  %shl95 = shl i64 %xor94, 28, !dbg !2140
  %shr96 = lshr i64 %xor94, 36, !dbg !2140
  %xor97 = xor i64 %shl95, %shr96, !dbg !2140
    #dbg_value(i64 %xor97, !2072, !DIExpression(), !2009)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2141
    #dbg_value(i64 %xor98, !2029, !DIExpression(), !2009)
  %shl99 = shl i64 %xor98, 20, !dbg !2142
  %shr100 = lshr i64 %xor98, 44, !dbg !2142
  %xor101 = xor i64 %shl99, %shr100, !dbg !2142
    #dbg_value(i64 %xor101, !2077, !DIExpression(), !2009)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2143
    #dbg_value(i64 %xor102, !2031, !DIExpression(), !2009)
  %shl103 = shl i64 %xor102, 3, !dbg !2144
  %shr104 = lshr i64 %xor102, 61, !dbg !2144
  %xor105 = xor i64 %shl103, %shr104, !dbg !2144
    #dbg_value(i64 %xor105, !2082, !DIExpression(), !2009)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2145
    #dbg_value(i64 %xor106, !2043, !DIExpression(), !2009)
  %shl107 = shl i64 %xor106, 45, !dbg !2146
  %shr108 = lshr i64 %xor106, 19, !dbg !2146
  %xor109 = xor i64 %shl107, %shr108, !dbg !2146
    #dbg_value(i64 %xor109, !2087, !DIExpression(), !2009)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2147
    #dbg_value(i64 %xor110, !2055, !DIExpression(), !2009)
  %shl111 = shl i64 %xor110, 61, !dbg !2148
  %shr112 = lshr i64 %xor110, 3, !dbg !2148
  %xor113 = xor i64 %shl111, %shr112, !dbg !2148
    #dbg_value(i64 %xor113, !2092, !DIExpression(), !2009)
  %not114 = xor i64 %xor101, -1, !dbg !2149
  %and115 = and i64 %not114, %xor105, !dbg !2150
  %xor116 = xor i64 %xor97, %and115, !dbg !2151
    #dbg_value(i64 %xor116, !2152, !DIExpression(), !2009)
  %not117 = xor i64 %xor105, -1, !dbg !2153
  %and118 = and i64 %not117, %xor109, !dbg !2154
  %xor119 = xor i64 %xor101, %and118, !dbg !2155
    #dbg_value(i64 %xor119, !2156, !DIExpression(), !2009)
  %not120 = xor i64 %xor109, -1, !dbg !2157
  %and121 = and i64 %not120, %xor113, !dbg !2158
  %xor122 = xor i64 %xor105, %and121, !dbg !2159
    #dbg_value(i64 %xor122, !2160, !DIExpression(), !2009)
  %not123 = xor i64 %xor113, -1, !dbg !2161
  %and124 = and i64 %not123, %xor97, !dbg !2162
  %xor125 = xor i64 %xor109, %and124, !dbg !2163
    #dbg_value(i64 %xor125, !2164, !DIExpression(), !2009)
  %not126 = xor i64 %xor97, -1, !dbg !2165
  %and127 = and i64 %not126, %xor101, !dbg !2166
  %xor128 = xor i64 %xor113, %and127, !dbg !2167
    #dbg_value(i64 %xor128, !2168, !DIExpression(), !2009)
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2169
    #dbg_value(i64 %xor129, !2013, !DIExpression(), !2009)
  %shl130 = shl i64 %xor129, 1, !dbg !2170
  %shr131 = lshr i64 %xor129, 63, !dbg !2170
  %xor132 = xor i64 %shl130, %shr131, !dbg !2170
    #dbg_value(i64 %xor132, !2072, !DIExpression(), !2009)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2171
    #dbg_value(i64 %xor133, !2025, !DIExpression(), !2009)
  %shl134 = shl i64 %xor133, 6, !dbg !2172
  %shr135 = lshr i64 %xor133, 58, !dbg !2172
  %xor136 = xor i64 %shl134, %shr135, !dbg !2172
    #dbg_value(i64 %xor136, !2077, !DIExpression(), !2009)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2173
    #dbg_value(i64 %xor137, !2037, !DIExpression(), !2009)
  %shl138 = shl i64 %xor137, 25, !dbg !2174
  %shr139 = lshr i64 %xor137, 39, !dbg !2174
  %xor140 = xor i64 %shl138, %shr139, !dbg !2174
    #dbg_value(i64 %xor140, !2082, !DIExpression(), !2009)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2175
    #dbg_value(i64 %xor141, !2049, !DIExpression(), !2009)
  %shl142 = shl i64 %xor141, 8, !dbg !2176
  %shr143 = lshr i64 %xor141, 56, !dbg !2176
  %xor144 = xor i64 %shl142, %shr143, !dbg !2176
    #dbg_value(i64 %xor144, !2087, !DIExpression(), !2009)
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2177
    #dbg_value(i64 %xor145, !2051, !DIExpression(), !2009)
  %shl146 = shl i64 %xor145, 18, !dbg !2178
  %shr147 = lshr i64 %xor145, 46, !dbg !2178
  %xor148 = xor i64 %shl146, %shr147, !dbg !2178
    #dbg_value(i64 %xor148, !2092, !DIExpression(), !2009)
  %not149 = xor i64 %xor136, -1, !dbg !2179
  %and150 = and i64 %not149, %xor140, !dbg !2180
  %xor151 = xor i64 %xor132, %and150, !dbg !2181
    #dbg_value(i64 %xor151, !2182, !DIExpression(), !2009)
  %not152 = xor i64 %xor140, -1, !dbg !2183
  %and153 = and i64 %not152, %xor144, !dbg !2184
  %xor154 = xor i64 %xor136, %and153, !dbg !2185
    #dbg_value(i64 %xor154, !2186, !DIExpression(), !2009)
  %not155 = xor i64 %xor144, -1, !dbg !2187
  %and156 = and i64 %not155, %xor148, !dbg !2188
  %xor157 = xor i64 %xor140, %and156, !dbg !2189
    #dbg_value(i64 %xor157, !2190, !DIExpression(), !2009)
  %not158 = xor i64 %xor148, -1, !dbg !2191
  %and159 = and i64 %not158, %xor132, !dbg !2192
  %xor160 = xor i64 %xor144, %and159, !dbg !2193
    #dbg_value(i64 %xor160, !2194, !DIExpression(), !2009)
  %not161 = xor i64 %xor132, -1, !dbg !2195
  %and162 = and i64 %not161, %xor136, !dbg !2196
  %xor163 = xor i64 %xor148, %and162, !dbg !2197
    #dbg_value(i64 %xor163, !2198, !DIExpression(), !2009)
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2199
    #dbg_value(i64 %xor164, !2019, !DIExpression(), !2009)
  %shl165 = shl i64 %xor164, 27, !dbg !2200
  %shr166 = lshr i64 %xor164, 37, !dbg !2200
  %xor167 = xor i64 %shl165, %shr166, !dbg !2200
    #dbg_value(i64 %xor167, !2072, !DIExpression(), !2009)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2201
    #dbg_value(i64 %xor168, !2021, !DIExpression(), !2009)
  %shl169 = shl i64 %xor168, 36, !dbg !2202
  %shr170 = lshr i64 %xor168, 28, !dbg !2202
  %xor171 = xor i64 %shl169, %shr170, !dbg !2202
    #dbg_value(i64 %xor171, !2077, !DIExpression(), !2009)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2203
    #dbg_value(i64 %xor172, !2033, !DIExpression(), !2009)
  %shl173 = shl i64 %xor172, 10, !dbg !2204
  %shr174 = lshr i64 %xor172, 54, !dbg !2204
  %xor175 = xor i64 %shl173, %shr174, !dbg !2204
    #dbg_value(i64 %xor175, !2082, !DIExpression(), !2009)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2205
    #dbg_value(i64 %xor176, !2045, !DIExpression(), !2009)
  %shl177 = shl i64 %xor176, 15, !dbg !2206
  %shr178 = lshr i64 %xor176, 49, !dbg !2206
  %xor179 = xor i64 %shl177, %shr178, !dbg !2206
    #dbg_value(i64 %xor179, !2087, !DIExpression(), !2009)
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2207
    #dbg_value(i64 %xor180, !2057, !DIExpression(), !2009)
  %shl181 = shl i64 %xor180, 56, !dbg !2208
  %shr182 = lshr i64 %xor180, 8, !dbg !2208
  %xor183 = xor i64 %shl181, %shr182, !dbg !2208
    #dbg_value(i64 %xor183, !2092, !DIExpression(), !2009)
  %not184 = xor i64 %xor171, -1, !dbg !2209
  %and185 = and i64 %not184, %xor175, !dbg !2210
  %xor186 = xor i64 %xor167, %and185, !dbg !2211
    #dbg_value(i64 %xor186, !2212, !DIExpression(), !2009)
  %not187 = xor i64 %xor175, -1, !dbg !2213
  %and188 = and i64 %not187, %xor179, !dbg !2214
  %xor189 = xor i64 %xor171, %and188, !dbg !2215
    #dbg_value(i64 %xor189, !2216, !DIExpression(), !2009)
  %not190 = xor i64 %xor179, -1, !dbg !2217
  %and191 = and i64 %not190, %xor183, !dbg !2218
  %xor192 = xor i64 %xor175, %and191, !dbg !2219
    #dbg_value(i64 %xor192, !2220, !DIExpression(), !2009)
  %not193 = xor i64 %xor183, -1, !dbg !2221
  %and194 = and i64 %not193, %xor167, !dbg !2222
  %xor195 = xor i64 %xor179, %and194, !dbg !2223
    #dbg_value(i64 %xor195, !2224, !DIExpression(), !2009)
  %not196 = xor i64 %xor167, -1, !dbg !2225
  %and197 = and i64 %not196, %xor171, !dbg !2226
  %xor198 = xor i64 %xor183, %and197, !dbg !2227
    #dbg_value(i64 %xor198, !2228, !DIExpression(), !2009)
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2229
    #dbg_value(i64 %xor199, !2015, !DIExpression(), !2009)
  %shl200 = shl i64 %xor199, 62, !dbg !2230
  %shr201 = lshr i64 %xor199, 2, !dbg !2230
  %xor202 = xor i64 %shl200, %shr201, !dbg !2230
    #dbg_value(i64 %xor202, !2072, !DIExpression(), !2009)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2231
    #dbg_value(i64 %xor203, !2027, !DIExpression(), !2009)
  %shl204 = shl i64 %xor203, 55, !dbg !2232
  %shr205 = lshr i64 %xor203, 9, !dbg !2232
  %xor206 = xor i64 %shl204, %shr205, !dbg !2232
    #dbg_value(i64 %xor206, !2077, !DIExpression(), !2009)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2233
    #dbg_value(i64 %xor207, !2039, !DIExpression(), !2009)
  %shl208 = shl i64 %xor207, 39, !dbg !2234
  %shr209 = lshr i64 %xor207, 25, !dbg !2234
  %xor210 = xor i64 %shl208, %shr209, !dbg !2234
    #dbg_value(i64 %xor210, !2082, !DIExpression(), !2009)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2235
    #dbg_value(i64 %xor211, !2041, !DIExpression(), !2009)
  %shl212 = shl i64 %xor211, 41, !dbg !2236
  %shr213 = lshr i64 %xor211, 23, !dbg !2236
  %xor214 = xor i64 %shl212, %shr213, !dbg !2236
    #dbg_value(i64 %xor214, !2087, !DIExpression(), !2009)
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2237
    #dbg_value(i64 %xor215, !2053, !DIExpression(), !2009)
  %shl216 = shl i64 %xor215, 2, !dbg !2238
  %shr217 = lshr i64 %xor215, 62, !dbg !2238
  %xor218 = xor i64 %shl216, %shr217, !dbg !2238
    #dbg_value(i64 %xor218, !2092, !DIExpression(), !2009)
  %not219 = xor i64 %xor206, -1, !dbg !2239
  %and220 = and i64 %not219, %xor210, !dbg !2240
  %xor221 = xor i64 %xor202, %and220, !dbg !2241
    #dbg_value(i64 %xor221, !2242, !DIExpression(), !2009)
  %not222 = xor i64 %xor210, -1, !dbg !2243
  %and223 = and i64 %not222, %xor214, !dbg !2244
  %xor224 = xor i64 %xor206, %and223, !dbg !2245
    #dbg_value(i64 %xor224, !2246, !DIExpression(), !2009)
  %not225 = xor i64 %xor214, -1, !dbg !2247
  %and226 = and i64 %not225, %xor218, !dbg !2248
  %xor227 = xor i64 %xor210, %and226, !dbg !2249
    #dbg_value(i64 %xor227, !2250, !DIExpression(), !2009)
  %not228 = xor i64 %xor218, -1, !dbg !2251
  %and229 = and i64 %not228, %xor202, !dbg !2252
  %xor230 = xor i64 %xor214, %and229, !dbg !2253
    #dbg_value(i64 %xor230, !2254, !DIExpression(), !2009)
  %not231 = xor i64 %xor202, -1, !dbg !2255
  %and232 = and i64 %not231, %xor206, !dbg !2256
  %xor233 = xor i64 %xor218, %and232, !dbg !2257
    #dbg_value(i64 %xor233, !2258, !DIExpression(), !2009)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2259
  %xor235 = xor i64 %xor234, %xor151, !dbg !2260
  %xor236 = xor i64 %xor235, %xor186, !dbg !2261
  %xor237 = xor i64 %xor236, %xor221, !dbg !2262
    #dbg_value(i64 %xor237, !2072, !DIExpression(), !2009)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2263
  %xor239 = xor i64 %xor238, %xor154, !dbg !2264
  %xor240 = xor i64 %xor239, %xor189, !dbg !2265
  %xor241 = xor i64 %xor240, %xor224, !dbg !2266
    #dbg_value(i64 %xor241, !2077, !DIExpression(), !2009)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2267
  %xor243 = xor i64 %xor242, %xor157, !dbg !2268
  %xor244 = xor i64 %xor243, %xor192, !dbg !2269
  %xor245 = xor i64 %xor244, %xor227, !dbg !2270
    #dbg_value(i64 %xor245, !2082, !DIExpression(), !2009)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2271
  %xor247 = xor i64 %xor246, %xor160, !dbg !2272
  %xor248 = xor i64 %xor247, %xor195, !dbg !2273
  %xor249 = xor i64 %xor248, %xor230, !dbg !2274
    #dbg_value(i64 %xor249, !2087, !DIExpression(), !2009)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2275
  %xor251 = xor i64 %xor250, %xor163, !dbg !2276
  %xor252 = xor i64 %xor251, %xor198, !dbg !2277
  %xor253 = xor i64 %xor252, %xor233, !dbg !2278
    #dbg_value(i64 %xor253, !2092, !DIExpression(), !2009)
  %shl254 = shl i64 %xor241, 1, !dbg !2279
  %shr255 = lshr i64 %xor241, 63, !dbg !2279
  %xor256 = xor i64 %shl254, %shr255, !dbg !2279
  %xor257 = xor i64 %xor253, %xor256, !dbg !2280
    #dbg_value(i64 %xor257, !2095, !DIExpression(), !2009)
  %shl258 = shl i64 %xor245, 1, !dbg !2281
  %shr259 = lshr i64 %xor245, 63, !dbg !2281
  %xor260 = xor i64 %shl258, %shr259, !dbg !2281
  %xor261 = xor i64 %xor237, %xor260, !dbg !2282
    #dbg_value(i64 %xor261, !2098, !DIExpression(), !2009)
  %shl262 = shl i64 %xor249, 1, !dbg !2283
  %shr263 = lshr i64 %xor249, 63, !dbg !2283
  %xor264 = xor i64 %shl262, %shr263, !dbg !2283
  %xor265 = xor i64 %xor241, %xor264, !dbg !2284
    #dbg_value(i64 %xor265, !2101, !DIExpression(), !2009)
  %shl266 = shl i64 %xor253, 1, !dbg !2285
  %shr267 = lshr i64 %xor253, 63, !dbg !2285
  %xor268 = xor i64 %shl266, %shr267, !dbg !2285
  %xor269 = xor i64 %xor245, %xor268, !dbg !2286
    #dbg_value(i64 %xor269, !2104, !DIExpression(), !2009)
  %shl270 = shl i64 %xor237, 1, !dbg !2287
  %shr271 = lshr i64 %xor237, 63, !dbg !2287
  %xor272 = xor i64 %shl270, %shr271, !dbg !2287
  %xor273 = xor i64 %xor249, %xor272, !dbg !2288
    #dbg_value(i64 %xor273, !2107, !DIExpression(), !2009)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2289
    #dbg_value(i64 %xor274, !2120, !DIExpression(), !2009)
    #dbg_value(i64 %xor274, !2072, !DIExpression(), !2009)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2290
    #dbg_value(i64 %xor275, !2156, !DIExpression(), !2009)
  %shl276 = shl i64 %xor275, 44, !dbg !2291
  %shr277 = lshr i64 %xor275, 20, !dbg !2291
  %xor278 = xor i64 %shl276, %shr277, !dbg !2291
    #dbg_value(i64 %xor278, !2077, !DIExpression(), !2009)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2292
    #dbg_value(i64 %xor279, !2190, !DIExpression(), !2009)
  %shl280 = shl i64 %xor279, 43, !dbg !2293
  %shr281 = lshr i64 %xor279, 21, !dbg !2293
  %xor282 = xor i64 %shl280, %shr281, !dbg !2293
    #dbg_value(i64 %xor282, !2082, !DIExpression(), !2009)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2294
    #dbg_value(i64 %xor283, !2224, !DIExpression(), !2009)
  %shl284 = shl i64 %xor283, 21, !dbg !2295
  %shr285 = lshr i64 %xor283, 43, !dbg !2295
  %xor286 = xor i64 %shl284, %shr285, !dbg !2295
    #dbg_value(i64 %xor286, !2087, !DIExpression(), !2009)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2296
    #dbg_value(i64 %xor287, !2258, !DIExpression(), !2009)
  %shl288 = shl i64 %xor287, 14, !dbg !2297
  %shr289 = lshr i64 %xor287, 50, !dbg !2297
  %xor290 = xor i64 %shl288, %shr289, !dbg !2297
    #dbg_value(i64 %xor290, !2092, !DIExpression(), !2009)
  %not291 = xor i64 %xor278, -1, !dbg !2298
  %and292 = and i64 %not291, %xor282, !dbg !2299
  %xor293 = xor i64 %xor274, %and292, !dbg !2300
    #dbg_value(i64 %xor293, !2011, !DIExpression(), !2009)
  %add = add nsw i32 %round.0, 1, !dbg !2301
  %arrayidx294 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2302
  %26 = load i64, ptr %arrayidx294, align 8, !dbg !2302
  %xor295 = xor i64 %xor293, %26, !dbg !2303
    #dbg_value(i64 %xor295, !2011, !DIExpression(), !2009)
  %not296 = xor i64 %xor282, -1, !dbg !2304
  %and297 = and i64 %not296, %xor286, !dbg !2305
  %xor298 = xor i64 %xor278, %and297, !dbg !2306
    #dbg_value(i64 %xor298, !2013, !DIExpression(), !2009)
  %not299 = xor i64 %xor286, -1, !dbg !2307
  %and300 = and i64 %not299, %xor290, !dbg !2308
  %xor301 = xor i64 %xor282, %and300, !dbg !2309
    #dbg_value(i64 %xor301, !2015, !DIExpression(), !2009)
  %not302 = xor i64 %xor290, -1, !dbg !2310
  %and303 = and i64 %not302, %xor274, !dbg !2311
  %xor304 = xor i64 %xor286, %and303, !dbg !2312
    #dbg_value(i64 %xor304, !2017, !DIExpression(), !2009)
  %not305 = xor i64 %xor274, -1, !dbg !2313
  %and306 = and i64 %not305, %xor278, !dbg !2314
  %xor307 = xor i64 %xor290, %and306, !dbg !2315
    #dbg_value(i64 %xor307, !2019, !DIExpression(), !2009)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2316
    #dbg_value(i64 %xor308, !2134, !DIExpression(), !2009)
  %shl309 = shl i64 %xor308, 28, !dbg !2317
  %shr310 = lshr i64 %xor308, 36, !dbg !2317
  %xor311 = xor i64 %shl309, %shr310, !dbg !2317
    #dbg_value(i64 %xor311, !2072, !DIExpression(), !2009)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2318
    #dbg_value(i64 %xor312, !2168, !DIExpression(), !2009)
  %shl313 = shl i64 %xor312, 20, !dbg !2319
  %shr314 = lshr i64 %xor312, 44, !dbg !2319
  %xor315 = xor i64 %shl313, %shr314, !dbg !2319
    #dbg_value(i64 %xor315, !2077, !DIExpression(), !2009)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2320
    #dbg_value(i64 %xor316, !2182, !DIExpression(), !2009)
  %shl317 = shl i64 %xor316, 3, !dbg !2321
  %shr318 = lshr i64 %xor316, 61, !dbg !2321
  %xor319 = xor i64 %shl317, %shr318, !dbg !2321
    #dbg_value(i64 %xor319, !2082, !DIExpression(), !2009)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2322
    #dbg_value(i64 %xor320, !2216, !DIExpression(), !2009)
  %shl321 = shl i64 %xor320, 45, !dbg !2323
  %shr322 = lshr i64 %xor320, 19, !dbg !2323
  %xor323 = xor i64 %shl321, %shr322, !dbg !2323
    #dbg_value(i64 %xor323, !2087, !DIExpression(), !2009)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2324
    #dbg_value(i64 %xor324, !2250, !DIExpression(), !2009)
  %shl325 = shl i64 %xor324, 61, !dbg !2325
  %shr326 = lshr i64 %xor324, 3, !dbg !2325
  %xor327 = xor i64 %shl325, %shr326, !dbg !2325
    #dbg_value(i64 %xor327, !2092, !DIExpression(), !2009)
  %not328 = xor i64 %xor315, -1, !dbg !2326
  %and329 = and i64 %not328, %xor319, !dbg !2327
  %xor330 = xor i64 %xor311, %and329, !dbg !2328
    #dbg_value(i64 %xor330, !2021, !DIExpression(), !2009)
  %not331 = xor i64 %xor319, -1, !dbg !2329
  %and332 = and i64 %not331, %xor323, !dbg !2330
  %xor333 = xor i64 %xor315, %and332, !dbg !2331
    #dbg_value(i64 %xor333, !2023, !DIExpression(), !2009)
  %not334 = xor i64 %xor323, -1, !dbg !2332
  %and335 = and i64 %not334, %xor327, !dbg !2333
  %xor336 = xor i64 %xor319, %and335, !dbg !2334
    #dbg_value(i64 %xor336, !2025, !DIExpression(), !2009)
  %not337 = xor i64 %xor327, -1, !dbg !2335
  %and338 = and i64 %not337, %xor311, !dbg !2336
  %xor339 = xor i64 %xor323, %and338, !dbg !2337
    #dbg_value(i64 %xor339, !2027, !DIExpression(), !2009)
  %not340 = xor i64 %xor311, -1, !dbg !2338
  %and341 = and i64 %not340, %xor315, !dbg !2339
  %xor342 = xor i64 %xor327, %and341, !dbg !2340
    #dbg_value(i64 %xor342, !2029, !DIExpression(), !2009)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2341
    #dbg_value(i64 %xor343, !2126, !DIExpression(), !2009)
  %shl344 = shl i64 %xor343, 1, !dbg !2342
  %shr345 = lshr i64 %xor343, 63, !dbg !2342
  %xor346 = xor i64 %shl344, %shr345, !dbg !2342
    #dbg_value(i64 %xor346, !2072, !DIExpression(), !2009)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2343
    #dbg_value(i64 %xor347, !2160, !DIExpression(), !2009)
  %shl348 = shl i64 %xor347, 6, !dbg !2344
  %shr349 = lshr i64 %xor347, 58, !dbg !2344
  %xor350 = xor i64 %shl348, %shr349, !dbg !2344
    #dbg_value(i64 %xor350, !2077, !DIExpression(), !2009)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2345
    #dbg_value(i64 %xor351, !2194, !DIExpression(), !2009)
  %shl352 = shl i64 %xor351, 25, !dbg !2346
  %shr353 = lshr i64 %xor351, 39, !dbg !2346
  %xor354 = xor i64 %shl352, %shr353, !dbg !2346
    #dbg_value(i64 %xor354, !2082, !DIExpression(), !2009)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2347
    #dbg_value(i64 %xor355, !2228, !DIExpression(), !2009)
  %shl356 = shl i64 %xor355, 8, !dbg !2348
  %shr357 = lshr i64 %xor355, 56, !dbg !2348
  %xor358 = xor i64 %shl356, %shr357, !dbg !2348
    #dbg_value(i64 %xor358, !2087, !DIExpression(), !2009)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2349
    #dbg_value(i64 %xor359, !2242, !DIExpression(), !2009)
  %shl360 = shl i64 %xor359, 18, !dbg !2350
  %shr361 = lshr i64 %xor359, 46, !dbg !2350
  %xor362 = xor i64 %shl360, %shr361, !dbg !2350
    #dbg_value(i64 %xor362, !2092, !DIExpression(), !2009)
  %not363 = xor i64 %xor350, -1, !dbg !2351
  %and364 = and i64 %not363, %xor354, !dbg !2352
  %xor365 = xor i64 %xor346, %and364, !dbg !2353
    #dbg_value(i64 %xor365, !2031, !DIExpression(), !2009)
  %not366 = xor i64 %xor354, -1, !dbg !2354
  %and367 = and i64 %not366, %xor358, !dbg !2355
  %xor368 = xor i64 %xor350, %and367, !dbg !2356
    #dbg_value(i64 %xor368, !2033, !DIExpression(), !2009)
  %not369 = xor i64 %xor358, -1, !dbg !2357
  %and370 = and i64 %not369, %xor362, !dbg !2358
  %xor371 = xor i64 %xor354, %and370, !dbg !2359
    #dbg_value(i64 %xor371, !2035, !DIExpression(), !2009)
  %not372 = xor i64 %xor362, -1, !dbg !2360
  %and373 = and i64 %not372, %xor346, !dbg !2361
  %xor374 = xor i64 %xor358, %and373, !dbg !2362
    #dbg_value(i64 %xor374, !2037, !DIExpression(), !2009)
  %not375 = xor i64 %xor346, -1, !dbg !2363
  %and376 = and i64 %not375, %xor350, !dbg !2364
  %xor377 = xor i64 %xor362, %and376, !dbg !2365
    #dbg_value(i64 %xor377, !2039, !DIExpression(), !2009)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2366
    #dbg_value(i64 %xor378, !2138, !DIExpression(), !2009)
  %shl379 = shl i64 %xor378, 27, !dbg !2367
  %shr380 = lshr i64 %xor378, 37, !dbg !2367
  %xor381 = xor i64 %shl379, %shr380, !dbg !2367
    #dbg_value(i64 %xor381, !2072, !DIExpression(), !2009)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2368
    #dbg_value(i64 %xor382, !2152, !DIExpression(), !2009)
  %shl383 = shl i64 %xor382, 36, !dbg !2369
  %shr384 = lshr i64 %xor382, 28, !dbg !2369
  %xor385 = xor i64 %shl383, %shr384, !dbg !2369
    #dbg_value(i64 %xor385, !2077, !DIExpression(), !2009)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2370
    #dbg_value(i64 %xor386, !2186, !DIExpression(), !2009)
  %shl387 = shl i64 %xor386, 10, !dbg !2371
  %shr388 = lshr i64 %xor386, 54, !dbg !2371
  %xor389 = xor i64 %shl387, %shr388, !dbg !2371
    #dbg_value(i64 %xor389, !2082, !DIExpression(), !2009)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2372
    #dbg_value(i64 %xor390, !2220, !DIExpression(), !2009)
  %shl391 = shl i64 %xor390, 15, !dbg !2373
  %shr392 = lshr i64 %xor390, 49, !dbg !2373
  %xor393 = xor i64 %shl391, %shr392, !dbg !2373
    #dbg_value(i64 %xor393, !2087, !DIExpression(), !2009)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2374
    #dbg_value(i64 %xor394, !2254, !DIExpression(), !2009)
  %shl395 = shl i64 %xor394, 56, !dbg !2375
  %shr396 = lshr i64 %xor394, 8, !dbg !2375
  %xor397 = xor i64 %shl395, %shr396, !dbg !2375
    #dbg_value(i64 %xor397, !2092, !DIExpression(), !2009)
  %not398 = xor i64 %xor385, -1, !dbg !2376
  %and399 = and i64 %not398, %xor389, !dbg !2377
  %xor400 = xor i64 %xor381, %and399, !dbg !2378
    #dbg_value(i64 %xor400, !2041, !DIExpression(), !2009)
  %not401 = xor i64 %xor389, -1, !dbg !2379
  %and402 = and i64 %not401, %xor393, !dbg !2380
  %xor403 = xor i64 %xor385, %and402, !dbg !2381
    #dbg_value(i64 %xor403, !2043, !DIExpression(), !2009)
  %not404 = xor i64 %xor393, -1, !dbg !2382
  %and405 = and i64 %not404, %xor397, !dbg !2383
  %xor406 = xor i64 %xor389, %and405, !dbg !2384
    #dbg_value(i64 %xor406, !2045, !DIExpression(), !2009)
  %not407 = xor i64 %xor397, -1, !dbg !2385
  %and408 = and i64 %not407, %xor381, !dbg !2386
  %xor409 = xor i64 %xor393, %and408, !dbg !2387
    #dbg_value(i64 %xor409, !2047, !DIExpression(), !2009)
  %not410 = xor i64 %xor381, -1, !dbg !2388
  %and411 = and i64 %not410, %xor385, !dbg !2389
  %xor412 = xor i64 %xor397, %and411, !dbg !2390
    #dbg_value(i64 %xor412, !2049, !DIExpression(), !2009)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2391
    #dbg_value(i64 %xor413, !2130, !DIExpression(), !2009)
  %shl414 = shl i64 %xor413, 62, !dbg !2392
  %shr415 = lshr i64 %xor413, 2, !dbg !2392
  %xor416 = xor i64 %shl414, %shr415, !dbg !2392
    #dbg_value(i64 %xor416, !2072, !DIExpression(), !2009)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2393
    #dbg_value(i64 %xor417, !2164, !DIExpression(), !2009)
  %shl418 = shl i64 %xor417, 55, !dbg !2394
  %shr419 = lshr i64 %xor417, 9, !dbg !2394
  %xor420 = xor i64 %shl418, %shr419, !dbg !2394
    #dbg_value(i64 %xor420, !2077, !DIExpression(), !2009)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2395
    #dbg_value(i64 %xor421, !2198, !DIExpression(), !2009)
  %shl422 = shl i64 %xor421, 39, !dbg !2396
  %shr423 = lshr i64 %xor421, 25, !dbg !2396
  %xor424 = xor i64 %shl422, %shr423, !dbg !2396
    #dbg_value(i64 %xor424, !2082, !DIExpression(), !2009)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2397
    #dbg_value(i64 %xor425, !2212, !DIExpression(), !2009)
  %shl426 = shl i64 %xor425, 41, !dbg !2398
  %shr427 = lshr i64 %xor425, 23, !dbg !2398
  %xor428 = xor i64 %shl426, %shr427, !dbg !2398
    #dbg_value(i64 %xor428, !2087, !DIExpression(), !2009)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2399
    #dbg_value(i64 %xor429, !2246, !DIExpression(), !2009)
  %shl430 = shl i64 %xor429, 2, !dbg !2400
  %shr431 = lshr i64 %xor429, 62, !dbg !2400
  %xor432 = xor i64 %shl430, %shr431, !dbg !2400
    #dbg_value(i64 %xor432, !2092, !DIExpression(), !2009)
  %not433 = xor i64 %xor420, -1, !dbg !2401
  %and434 = and i64 %not433, %xor424, !dbg !2402
  %xor435 = xor i64 %xor416, %and434, !dbg !2403
    #dbg_value(i64 %xor435, !2051, !DIExpression(), !2009)
  %not436 = xor i64 %xor424, -1, !dbg !2404
  %and437 = and i64 %not436, %xor428, !dbg !2405
  %xor438 = xor i64 %xor420, %and437, !dbg !2406
    #dbg_value(i64 %xor438, !2053, !DIExpression(), !2009)
  %not439 = xor i64 %xor428, -1, !dbg !2407
  %and440 = and i64 %not439, %xor432, !dbg !2408
  %xor441 = xor i64 %xor424, %and440, !dbg !2409
    #dbg_value(i64 %xor441, !2055, !DIExpression(), !2009)
  %not442 = xor i64 %xor432, -1, !dbg !2410
  %and443 = and i64 %not442, %xor416, !dbg !2411
  %xor444 = xor i64 %xor428, %and443, !dbg !2412
    #dbg_value(i64 %xor444, !2057, !DIExpression(), !2009)
  %not445 = xor i64 %xor416, -1, !dbg !2413
  %and446 = and i64 %not445, %xor420, !dbg !2414
  %xor447 = xor i64 %xor432, %and446, !dbg !2415
    #dbg_value(i64 %xor447, !2059, !DIExpression(), !2009)
  br label %for.inc, !dbg !2416

for.inc:                                          ; preds = %for.body
  %add448 = add nsw i32 %round.0, 2, !dbg !2417
    #dbg_value(i32 %add448, !2060, !DIExpression(), !2009)
  br label %for.cond, !dbg !2418, !llvm.loop !2419

for.end:                                          ; preds = %for.cond
  %arrayidx449 = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2421
  store i64 %Aba.0, ptr %arrayidx449, align 8, !dbg !2422
  %arrayidx450 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2423
  store i64 %Abe.0, ptr %arrayidx450, align 8, !dbg !2424
  %arrayidx451 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2425
  store i64 %Abi.0, ptr %arrayidx451, align 8, !dbg !2426
  %arrayidx452 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2427
  store i64 %Abo.0, ptr %arrayidx452, align 8, !dbg !2428
  %arrayidx453 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2429
  store i64 %Abu.0, ptr %arrayidx453, align 8, !dbg !2430
  %arrayidx454 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2431
  store i64 %Aga.0, ptr %arrayidx454, align 8, !dbg !2432
  %arrayidx455 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2433
  store i64 %Age.0, ptr %arrayidx455, align 8, !dbg !2434
  %arrayidx456 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2435
  store i64 %Agi.0, ptr %arrayidx456, align 8, !dbg !2436
  %arrayidx457 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2437
  store i64 %Ago.0, ptr %arrayidx457, align 8, !dbg !2438
  %arrayidx458 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2439
  store i64 %Agu.0, ptr %arrayidx458, align 8, !dbg !2440
  %arrayidx459 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2441
  store i64 %Aka.0, ptr %arrayidx459, align 8, !dbg !2442
  %arrayidx460 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2443
  store i64 %Ake.0, ptr %arrayidx460, align 8, !dbg !2444
  %arrayidx461 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2445
  store i64 %Aki.0, ptr %arrayidx461, align 8, !dbg !2446
  %arrayidx462 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2447
  store i64 %Ako.0, ptr %arrayidx462, align 8, !dbg !2448
  %arrayidx463 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2449
  store i64 %Aku.0, ptr %arrayidx463, align 8, !dbg !2450
  %arrayidx464 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2451
  store i64 %Ama.0, ptr %arrayidx464, align 8, !dbg !2452
  %arrayidx465 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2453
  store i64 %Ame.0, ptr %arrayidx465, align 8, !dbg !2454
  %arrayidx466 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2455
  store i64 %Ami.0, ptr %arrayidx466, align 8, !dbg !2456
  %arrayidx467 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2457
  store i64 %Amo.0, ptr %arrayidx467, align 8, !dbg !2458
  %arrayidx468 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2459
  store i64 %Amu.0, ptr %arrayidx468, align 8, !dbg !2460
  %arrayidx469 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2461
  store i64 %Asa.0, ptr %arrayidx469, align 8, !dbg !2462
  %arrayidx470 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2463
  store i64 %Ase.0, ptr %arrayidx470, align 8, !dbg !2464
  %arrayidx471 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2465
  store i64 %Asi.0, ptr %arrayidx471, align 8, !dbg !2466
  %arrayidx472 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2467
  store i64 %Aso.0, ptr %arrayidx472, align 8, !dbg !2468
  %arrayidx473 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2469
  store i64 %Asu.0, ptr %arrayidx473, align 8, !dbg !2470
  ret void, !dbg !2471
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) #0 !dbg !2472 {
entry:
    #dbg_value(ptr %state, !2473, !DIExpression(), !2474)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2475
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2476
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2477
  %0 = load i32, ptr %pos, align 8, !dbg !2477
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #2, !dbg !2478
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2479
  store i32 168, ptr %pos1, align 8, !dbg !2480
  ret void, !dbg !2481
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) #0 !dbg !2482 {
entry:
    #dbg_value(ptr %s, !2485, !DIExpression(), !2486)
    #dbg_value(i32 %pos, !2487, !DIExpression(), !2486)
    #dbg_value(i32 %r, !2488, !DIExpression(), !2486)
    #dbg_value(i8 %p, !2489, !DIExpression(), !2486)
  %conv = zext i8 %p to i64, !dbg !2490
  %rem = urem i32 %pos, 8, !dbg !2491
  %mul = mul i32 8, %rem, !dbg !2492
  %sh_prom = zext i32 %mul to i64, !dbg !2493
  %shl = shl i64 %conv, %sh_prom, !dbg !2493
  %div = udiv i32 %pos, 8, !dbg !2494
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2495
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2496
  %xor = xor i64 %0, %shl, !dbg !2496
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2496
  %div1 = udiv i32 %r, 8, !dbg !2497
  %sub = sub i32 %div1, 1, !dbg !2498
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s, i32 %sub, !dbg !2499
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !2500
  %xor3 = xor i64 %1, -9223372036854775808, !dbg !2500
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2500
  ret void, !dbg !2501
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2502 {
entry:
    #dbg_value(ptr %out, !2505, !DIExpression(), !2506)
    #dbg_value(i32 %outlen, !2507, !DIExpression(), !2506)
    #dbg_value(ptr %state, !2508, !DIExpression(), !2506)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2509
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2510
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2511
  %0 = load i32, ptr %pos, align 8, !dbg !2511
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168) #2, !dbg !2512
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2513
  store i32 %call, ptr %pos1, align 8, !dbg !2514
  ret void, !dbg !2515
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) #0 !dbg !2516 {
entry:
    #dbg_value(ptr %out, !2519, !DIExpression(), !2520)
    #dbg_value(i32 %outlen, !2521, !DIExpression(), !2520)
    #dbg_value(ptr %s, !2522, !DIExpression(), !2520)
    #dbg_value(i32 %pos, !2523, !DIExpression(), !2520)
    #dbg_value(i32 %r, !2524, !DIExpression(), !2520)
  br label %while.cond, !dbg !2525

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2519, !DIExpression(), !2520)
    #dbg_value(i32 %outlen.addr.0, !2521, !DIExpression(), !2520)
    #dbg_value(i32 %pos.addr.0, !2523, !DIExpression(), !2520)
  %tobool = icmp ne i32 %outlen.addr.0, 0, !dbg !2525
  br i1 %tobool, label %while.body, label %while.end, !dbg !2525

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2526
  br i1 %cmp, label %if.then, label %if.end, !dbg !2526

if.then:                                          ; preds = %while.body
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2529
    #dbg_value(i32 0, !2523, !DIExpression(), !2520)
  br label %if.end, !dbg !2531

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2523, !DIExpression(), !2520)
    #dbg_value(i32 %pos.addr.1, !2532, !DIExpression(), !2520)
  br label %for.cond, !dbg !2533

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.inc ], !dbg !2535
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.inc ]
    #dbg_value(ptr %out.addr.1, !2519, !DIExpression(), !2520)
    #dbg_value(i32 %i.0, !2532, !DIExpression(), !2520)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2536
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !2538

land.rhs:                                         ; preds = %for.cond
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2539
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2540
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !2541
  br i1 %0, label %for.body, label %for.end, !dbg !2542

for.body:                                         ; preds = %land.end
  %div = udiv i32 %i.0, 8, !dbg !2543
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2544
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2544
  %rem = urem i32 %i.0, 8, !dbg !2545
  %mul = mul i32 8, %rem, !dbg !2546
  %sh_prom = zext i32 %mul to i64, !dbg !2547
  %shr = lshr i64 %1, %sh_prom, !dbg !2547
  %conv = trunc i64 %shr to i8, !dbg !2544
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2548
    #dbg_value(ptr %incdec.ptr, !2519, !DIExpression(), !2520)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2549
  br label %for.inc, !dbg !2550

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2551
    #dbg_value(i32 %inc, !2532, !DIExpression(), !2520)
  br label %for.cond, !dbg !2552, !llvm.loop !2553

for.end:                                          ; preds = %land.end
  %sub = sub i32 %i.0, %pos.addr.1, !dbg !2555
  %sub3 = sub i32 %outlen.addr.0, %sub, !dbg !2556
    #dbg_value(i32 %sub3, !2521, !DIExpression(), !2520)
    #dbg_value(i32 %i.0, !2523, !DIExpression(), !2520)
  br label %while.cond, !dbg !2525, !llvm.loop !2557

while.end:                                        ; preds = %while.cond
  ret i32 %pos.addr.0, !dbg !2559
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2560 {
entry:
    #dbg_value(ptr %state, !2561, !DIExpression(), !2562)
    #dbg_value(ptr %in, !2563, !DIExpression(), !2562)
    #dbg_value(i32 %inlen, !2564, !DIExpression(), !2562)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2565
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2566
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2567
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2568
  store i32 168, ptr %pos, align 8, !dbg !2569
  ret void, !dbg !2570
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) #0 !dbg !2571 {
entry:
    #dbg_value(ptr %s, !2574, !DIExpression(), !2575)
    #dbg_value(i32 %r, !2576, !DIExpression(), !2575)
    #dbg_value(ptr %in, !2577, !DIExpression(), !2575)
    #dbg_value(i32 %inlen, !2578, !DIExpression(), !2575)
    #dbg_value(i8 %p, !2579, !DIExpression(), !2575)
    #dbg_value(i32 0, !2580, !DIExpression(), !2575)
  br label %for.cond, !dbg !2581

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2583
    #dbg_value(i32 %i.0, !2580, !DIExpression(), !2575)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2584
  br i1 %cmp, label %for.body, label %for.end, !dbg !2586

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2587
  store i64 0, ptr %arrayidx, align 8, !dbg !2588
  br label %for.inc, !dbg !2587

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2589
    #dbg_value(i32 %inc, !2580, !DIExpression(), !2575)
  br label %for.cond, !dbg !2590, !llvm.loop !2591

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !2593

while.cond:                                       ; preds = %for.end8, %for.end
  %in.addr.0 = phi ptr [ %in, %for.end ], [ %add.ptr9, %for.end8 ]
  %inlen.addr.0 = phi i32 [ %inlen, %for.end ], [ %sub, %for.end8 ]
    #dbg_value(i32 %inlen.addr.0, !2578, !DIExpression(), !2575)
    #dbg_value(ptr %in.addr.0, !2577, !DIExpression(), !2575)
  %cmp1 = icmp uge i32 %inlen.addr.0, %r, !dbg !2594
  br i1 %cmp1, label %while.body, label %while.end, !dbg !2593

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 0, !2580, !DIExpression(), !2575)
  br label %for.cond2, !dbg !2595

for.cond2:                                        ; preds = %for.inc6, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc7, %for.inc6 ], !dbg !2598
    #dbg_value(i32 %i.1, !2580, !DIExpression(), !2575)
  %div = udiv i32 %r, 8, !dbg !2599
  %cmp3 = icmp ult i32 %i.1, %div, !dbg !2601
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !2602

for.body4:                                        ; preds = %for.cond2
  %mul = mul i32 8, %i.1, !dbg !2603
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2604
  %call = call i64 @load64(ptr noundef %add.ptr) #2, !dbg !2605
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2606
  %0 = load i64, ptr %arrayidx5, align 8, !dbg !2607
  %xor = xor i64 %0, %call, !dbg !2607
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2607
  br label %for.inc6, !dbg !2606

for.inc6:                                         ; preds = %for.body4
  %inc7 = add i32 %i.1, 1, !dbg !2608
    #dbg_value(i32 %inc7, !2580, !DIExpression(), !2575)
  br label %for.cond2, !dbg !2609, !llvm.loop !2610

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2612
    #dbg_value(ptr %add.ptr9, !2577, !DIExpression(), !2575)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2613
    #dbg_value(i32 %sub, !2578, !DIExpression(), !2575)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2614
  br label %while.cond, !dbg !2593, !llvm.loop !2615

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 0, !2580, !DIExpression(), !2575)
  br label %for.cond10, !dbg !2617

for.cond10:                                       ; preds = %for.inc18, %while.end
  %i.2 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc18 ], !dbg !2619
    #dbg_value(i32 %i.2, !2580, !DIExpression(), !2575)
  %cmp11 = icmp ult i32 %i.2, %inlen.addr.0, !dbg !2620
  br i1 %cmp11, label %for.body12, label %for.end20, !dbg !2622

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %i.2, !dbg !2623
  %1 = load i8, ptr %arrayidx13, align 1, !dbg !2623
  %conv = zext i8 %1 to i64, !dbg !2624
  %rem = urem i32 %i.2, 8, !dbg !2625
  %mul14 = mul i32 8, %rem, !dbg !2626
  %sh_prom = zext i32 %mul14 to i64, !dbg !2627
  %shl = shl i64 %conv, %sh_prom, !dbg !2627
  %div15 = udiv i32 %i.2, 8, !dbg !2628
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div15, !dbg !2629
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !2630
  %xor17 = xor i64 %2, %shl, !dbg !2630
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2630
  br label %for.inc18, !dbg !2629

for.inc18:                                        ; preds = %for.body12
  %inc19 = add i32 %i.2, 1, !dbg !2631
    #dbg_value(i32 %inc19, !2580, !DIExpression(), !2575)
  br label %for.cond10, !dbg !2632, !llvm.loop !2633

for.end20:                                        ; preds = %for.cond10
  %conv21 = zext i8 %p to i64, !dbg !2635
  %rem22 = urem i32 %i.2, 8, !dbg !2636
  %mul23 = mul i32 8, %rem22, !dbg !2637
  %sh_prom24 = zext i32 %mul23 to i64, !dbg !2638
  %shl25 = shl i64 %conv21, %sh_prom24, !dbg !2638
  %div26 = udiv i32 %i.2, 8, !dbg !2639
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div26, !dbg !2640
  %3 = load i64, ptr %arrayidx27, align 8, !dbg !2641
  %xor28 = xor i64 %3, %shl25, !dbg !2641
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2641
  %sub29 = sub i32 %r, 1, !dbg !2642
  %div30 = udiv i32 %sub29, 8, !dbg !2643
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div30, !dbg !2644
  %4 = load i64, ptr %arrayidx31, align 8, !dbg !2645
  %xor32 = xor i64 %4, -9223372036854775808, !dbg !2645
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2645
  ret void, !dbg !2646
}

; Function Attrs: noinline nounwind optnone
define internal i64 @load64(ptr noundef %x) #0 !dbg !2647 {
entry:
    #dbg_value(ptr %x, !2650, !DIExpression(), !2651)
    #dbg_value(i64 0, !2652, !DIExpression(), !2651)
    #dbg_value(i32 0, !2653, !DIExpression(), !2651)
  br label %for.cond, !dbg !2654

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2656
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2651
    #dbg_value(i64 %r.0, !2652, !DIExpression(), !2651)
    #dbg_value(i32 %i.0, !2653, !DIExpression(), !2651)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2657
  br i1 %cmp, label %for.body, label %for.end, !dbg !2659

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2660
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2660
  %conv = zext i8 %0 to i64, !dbg !2661
  %mul = mul i32 8, %i.0, !dbg !2662
  %sh_prom = zext i32 %mul to i64, !dbg !2663
  %shl = shl i64 %conv, %sh_prom, !dbg !2663
  %or = or i64 %r.0, %shl, !dbg !2664
    #dbg_value(i64 %or, !2652, !DIExpression(), !2651)
  br label %for.inc, !dbg !2665

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2666
    #dbg_value(i32 %inc, !2653, !DIExpression(), !2651)
  br label %for.cond, !dbg !2667, !llvm.loop !2668

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !2670
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2671 {
entry:
    #dbg_value(ptr %out, !2672, !DIExpression(), !2673)
    #dbg_value(i32 %nblocks, !2674, !DIExpression(), !2673)
    #dbg_value(ptr %state, !2675, !DIExpression(), !2673)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2676
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2677
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 168) #2, !dbg !2678
  ret void, !dbg !2679
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) #0 !dbg !2680 {
entry:
    #dbg_value(ptr %out, !2683, !DIExpression(), !2684)
    #dbg_value(i32 %nblocks, !2685, !DIExpression(), !2684)
    #dbg_value(ptr %s, !2686, !DIExpression(), !2684)
    #dbg_value(i32 %r, !2687, !DIExpression(), !2684)
  br label %while.cond, !dbg !2688

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2683, !DIExpression(), !2684)
    #dbg_value(i32 %nblocks.addr.0, !2685, !DIExpression(), !2684)
  %tobool = icmp ne i32 %nblocks.addr.0, 0, !dbg !2688
  br i1 %tobool, label %while.body, label %while.end, !dbg !2688

while.body:                                       ; preds = %while.cond
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2689
    #dbg_value(i32 0, !2691, !DIExpression(), !2684)
  br label %for.cond, !dbg !2692

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !2694
    #dbg_value(i32 %i.0, !2691, !DIExpression(), !2684)
  %div = udiv i32 %r, 8, !dbg !2695
  %cmp = icmp ult i32 %i.0, %div, !dbg !2697
  br i1 %cmp, label %for.body, label %for.end, !dbg !2698

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2699
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2700
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2701
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2701
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2702
  br label %for.inc, !dbg !2702

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2703
    #dbg_value(i32 %inc, !2691, !DIExpression(), !2684)
  br label %for.cond, !dbg !2704, !llvm.loop !2705

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2707
    #dbg_value(ptr %add.ptr1, !2683, !DIExpression(), !2684)
  %sub = sub i32 %nblocks.addr.0, 1, !dbg !2708
    #dbg_value(i32 %sub, !2685, !DIExpression(), !2684)
  br label %while.cond, !dbg !2688, !llvm.loop !2709

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2711
}

; Function Attrs: noinline nounwind optnone
define internal void @store64(ptr noundef %x, i64 noundef %u) #0 !dbg !2712 {
entry:
    #dbg_value(ptr %x, !2715, !DIExpression(), !2716)
    #dbg_value(i64 %u, !2717, !DIExpression(), !2716)
    #dbg_value(i32 0, !2718, !DIExpression(), !2716)
  br label %for.cond, !dbg !2719

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2721
    #dbg_value(i32 %i.0, !2718, !DIExpression(), !2716)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2722
  br i1 %cmp, label %for.body, label %for.end, !dbg !2724

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2725
  %sh_prom = zext i32 %mul to i64, !dbg !2726
  %shr = lshr i64 %u, %sh_prom, !dbg !2726
  %conv = trunc i64 %shr to i8, !dbg !2727
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2728
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2729
  br label %for.inc, !dbg !2728

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2730
    #dbg_value(i32 %inc, !2718, !DIExpression(), !2716)
  br label %for.cond, !dbg !2731, !llvm.loop !2732

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2734
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) #0 !dbg !2735 {
entry:
    #dbg_value(ptr %state, !2736, !DIExpression(), !2737)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2738
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2739
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2740
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2741
  store i32 0, ptr %pos, align 8, !dbg !2742
  ret void, !dbg !2743
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2744 {
entry:
    #dbg_value(ptr %state, !2745, !DIExpression(), !2746)
    #dbg_value(ptr %in, !2747, !DIExpression(), !2746)
    #dbg_value(i32 %inlen, !2748, !DIExpression(), !2746)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2749
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2750
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2751
  %0 = load i32, ptr %pos, align 8, !dbg !2751
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2752
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2753
  store i32 %call, ptr %pos1, align 8, !dbg !2754
  ret void, !dbg !2755
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) #0 !dbg !2756 {
entry:
    #dbg_value(ptr %state, !2757, !DIExpression(), !2758)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2759
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2760
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2761
  %0 = load i32, ptr %pos, align 8, !dbg !2761
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #2, !dbg !2762
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2763
  store i32 136, ptr %pos1, align 8, !dbg !2764
  ret void, !dbg !2765
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2766 {
entry:
    #dbg_value(ptr %out, !2767, !DIExpression(), !2768)
    #dbg_value(i32 %outlen, !2769, !DIExpression(), !2768)
    #dbg_value(ptr %state, !2770, !DIExpression(), !2768)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2771
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2772
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2773
  %0 = load i32, ptr %pos, align 8, !dbg !2773
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136) #2, !dbg !2774
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2775
  store i32 %call, ptr %pos1, align 8, !dbg !2776
  ret void, !dbg !2777
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2778 {
entry:
    #dbg_value(ptr %state, !2779, !DIExpression(), !2780)
    #dbg_value(ptr %in, !2781, !DIExpression(), !2780)
    #dbg_value(i32 %inlen, !2782, !DIExpression(), !2780)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2783
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2784
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2785
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2786
  store i32 136, ptr %pos, align 8, !dbg !2787
  ret void, !dbg !2788
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2789 {
entry:
    #dbg_value(ptr %out, !2790, !DIExpression(), !2791)
    #dbg_value(i32 %nblocks, !2792, !DIExpression(), !2791)
    #dbg_value(ptr %state, !2793, !DIExpression(), !2791)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2794
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2795
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 136) #2, !dbg !2796
  ret void, !dbg !2797
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2798 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2801, !DIExpression(), !2802)
    #dbg_value(i32 %outlen, !2803, !DIExpression(), !2802)
    #dbg_value(ptr %in, !2804, !DIExpression(), !2802)
    #dbg_value(i32 %inlen, !2805, !DIExpression(), !2802)
    #dbg_declare(ptr %state, !2806, !DIExpression(), !2807)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2808
  %div = udiv i32 %outlen, 168, !dbg !2809
    #dbg_value(i32 %div, !2810, !DIExpression(), !2802)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2811
  %mul = mul i32 %div, 168, !dbg !2812
  %sub = sub i32 %outlen, %mul, !dbg !2813
    #dbg_value(i32 %sub, !2803, !DIExpression(), !2802)
  %mul1 = mul i32 %div, 168, !dbg !2814
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2815
    #dbg_value(ptr %add.ptr, !2801, !DIExpression(), !2802)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2816
  ret void, !dbg !2817
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2818 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2819, !DIExpression(), !2820)
    #dbg_value(i32 %outlen, !2821, !DIExpression(), !2820)
    #dbg_value(ptr %in, !2822, !DIExpression(), !2820)
    #dbg_value(i32 %inlen, !2823, !DIExpression(), !2820)
    #dbg_declare(ptr %state, !2824, !DIExpression(), !2825)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2826
  %div = udiv i32 %outlen, 136, !dbg !2827
    #dbg_value(i32 %div, !2828, !DIExpression(), !2820)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2829
  %mul = mul i32 %div, 136, !dbg !2830
  %sub = sub i32 %outlen, %mul, !dbg !2831
    #dbg_value(i32 %sub, !2821, !DIExpression(), !2820)
  %mul1 = mul i32 %div, 136, !dbg !2832
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2833
    #dbg_value(ptr %add.ptr, !2819, !DIExpression(), !2820)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2834
  ret void, !dbg !2835
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2836 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2839, !DIExpression(), !2840)
    #dbg_value(ptr %in, !2841, !DIExpression(), !2840)
    #dbg_value(i32 %inlen, !2842, !DIExpression(), !2840)
    #dbg_declare(ptr %s, !2843, !DIExpression(), !2844)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2845
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !2846
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2847
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !2848
    #dbg_value(i32 0, !2849, !DIExpression(), !2840)
  br label %for.cond, !dbg !2850

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2852
    #dbg_value(i32 %i.0, !2849, !DIExpression(), !2840)
  %cmp = icmp ult i32 %i.0, 4, !dbg !2853
  br i1 %cmp, label %for.body, label %for.end, !dbg !2855

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2856
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2857
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2858
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2858
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2859
  br label %for.inc, !dbg !2859

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2860
    #dbg_value(i32 %inc, !2849, !DIExpression(), !2840)
  br label %for.cond, !dbg !2861, !llvm.loop !2862

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2864
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2865 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2866, !DIExpression(), !2867)
    #dbg_value(ptr %in, !2868, !DIExpression(), !2867)
    #dbg_value(i32 %inlen, !2869, !DIExpression(), !2867)
    #dbg_declare(ptr %s, !2870, !DIExpression(), !2871)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2872
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !2873
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2874
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !2875
    #dbg_value(i32 0, !2876, !DIExpression(), !2867)
  br label %for.cond, !dbg !2877

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2879
    #dbg_value(i32 %i.0, !2876, !DIExpression(), !2867)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2880
  br i1 %cmp, label %for.body, label %for.end, !dbg !2882

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2883
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2884
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2885
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2885
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2886
  br label %for.inc, !dbg !2886

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2887
    #dbg_value(i32 %inc, !2876, !DIExpression(), !2867)
  br label %for.cond, !dbg !2888, !llvm.loop !2889

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2891
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) #0 !dbg !2892 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2902, !DIExpression(), !2903)
    #dbg_value(ptr %seed, !2904, !DIExpression(), !2903)
    #dbg_value(i8 %x, !2905, !DIExpression(), !2903)
    #dbg_value(i8 %y, !2906, !DIExpression(), !2903)
    #dbg_declare(ptr %extseed, !2907, !DIExpression(), !2911)
  %arraydecay = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !2912
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %seed, i32 noundef 32) #2, !dbg !2913
  %arrayidx = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 32, !dbg !2914
  store i8 %x, ptr %arrayidx, align 1, !dbg !2915
  %arrayidx1 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 33, !dbg !2916
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2917
  %arraydecay2 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !2918
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %arraydecay2, i32 noundef 34) #2, !dbg !2919
  ret void, !dbg !2920
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) #0 !dbg !2921 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2924, !DIExpression(), !2925)
    #dbg_value(i32 %outlen, !2926, !DIExpression(), !2925)
    #dbg_value(ptr %key, !2927, !DIExpression(), !2925)
    #dbg_value(i8 %nonce, !2928, !DIExpression(), !2925)
    #dbg_declare(ptr %extkey, !2929, !DIExpression(), !2933)
  %arraydecay = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !2934
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %key, i32 noundef 32) #2, !dbg !2935
  %arrayidx = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 32, !dbg !2936
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2937
  %arraydecay1 = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !2938
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay1, i32 noundef 33) #2, !dbg !2939
  ret void, !dbg !2940
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) #0 !dbg !2941 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2942, !DIExpression(), !2943)
    #dbg_value(ptr %key, !2944, !DIExpression(), !2943)
    #dbg_value(ptr %input, !2945, !DIExpression(), !2943)
    #dbg_declare(ptr %s, !2946, !DIExpression(), !2947)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %s) #2, !dbg !2948
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %key, i32 noundef 32) #2, !dbg !2949
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %input, i32 noundef 1088) #2, !dbg !2950
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %s) #2, !dbg !2951
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef %s) #2, !dbg !2952
  ret void, !dbg !2953
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nounwind memory(none) }

!llvm.dbg.cu = !{!32, !33, !38, !43, !2, !45, !47, !49, !21, !50}
!llvm.ident = !{!51, !51, !51, !51, !51, !51, !51, !51, !51, !51}
!llvm.module.flags = !{!52, !53, !54, !55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber768_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../ref/<stdin>", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!0}
!11 = !DIFile(filename: "../../ref/ntt.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
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
!27 = !DIFile(filename: "../../ref/fips202.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
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
!57 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
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
!75 = !DILocation(line: 33, column: 12, scope: !56)
!76 = !DILocation(line: 33, column: 33, scope: !56)
!77 = !DILocation(line: 33, column: 55, scope: !56)
!78 = !DILocation(line: 33, column: 3, scope: !56)
!79 = !DILocation(line: 34, column: 3, scope: !56)
!80 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !57, file: !57, line: 50, type: !81, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!81 = !DISubroutineType(types: !82)
!82 = !{!9, !60, !60}
!83 = !DILocalVariable(name: "pk", arg: 1, scope: !80, file: !57, line: 50, type: !60)
!84 = !DILocation(line: 0, scope: !80)
!85 = !DILocalVariable(name: "sk", arg: 2, scope: !80, file: !57, line: 51, type: !60)
!86 = !DILocalVariable(name: "coins", scope: !80, file: !57, line: 53, type: !87)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 512, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 64)
!90 = !DILocation(line: 53, column: 11, scope: !80)
!91 = !DILocation(line: 54, column: 15, scope: !80)
!92 = !DILocation(line: 54, column: 3, scope: !80)
!93 = !DILocation(line: 55, column: 37, scope: !80)
!94 = !DILocation(line: 55, column: 3, scope: !80)
!95 = !DILocation(line: 56, column: 3, scope: !80)
!96 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !57, file: !57, line: 76, type: !97, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!97 = !DISubroutineType(types: !98)
!98 = !{!9, !60, !60, !64, !64}
!99 = !DILocalVariable(name: "ct", arg: 1, scope: !96, file: !57, line: 76, type: !60)
!100 = !DILocation(line: 0, scope: !96)
!101 = !DILocalVariable(name: "ss", arg: 2, scope: !96, file: !57, line: 77, type: !60)
!102 = !DILocalVariable(name: "pk", arg: 3, scope: !96, file: !57, line: 78, type: !64)
!103 = !DILocalVariable(name: "coins", arg: 4, scope: !96, file: !57, line: 79, type: !64)
!104 = !DILocalVariable(name: "buf", scope: !96, file: !57, line: 81, type: !87)
!105 = !DILocation(line: 81, column: 11, scope: !96)
!106 = !DILocalVariable(name: "kr", scope: !96, file: !57, line: 83, type: !87)
!107 = !DILocation(line: 83, column: 11, scope: !96)
!108 = !DILocation(line: 85, column: 10, scope: !96)
!109 = !DILocation(line: 85, column: 3, scope: !96)
!110 = !DILocation(line: 88, column: 3, scope: !96)
!111 = !DILocation(line: 89, column: 3, scope: !96)
!112 = !DILocation(line: 92, column: 18, scope: !96)
!113 = !DILocation(line: 92, column: 27, scope: !96)
!114 = !DILocation(line: 92, column: 29, scope: !96)
!115 = !DILocation(line: 92, column: 3, scope: !96)
!116 = !DILocation(line: 94, column: 13, scope: !96)
!117 = !DILocation(line: 94, column: 3, scope: !96)
!118 = !DILocation(line: 95, column: 3, scope: !96)
!119 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!120 = !DILocalVariable(name: "ct", arg: 1, scope: !119, file: !57, line: 113, type: !60)
!121 = !DILocation(line: 0, scope: !119)
!122 = !DILocalVariable(name: "ss", arg: 2, scope: !119, file: !57, line: 114, type: !60)
!123 = !DILocalVariable(name: "pk", arg: 3, scope: !119, file: !57, line: 115, type: !64)
!124 = !DILocalVariable(name: "coins", scope: !119, file: !57, line: 117, type: !125)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 256, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 32)
!128 = !DILocation(line: 117, column: 11, scope: !119)
!129 = !DILocation(line: 118, column: 15, scope: !119)
!130 = !DILocation(line: 118, column: 3, scope: !119)
!131 = !DILocation(line: 119, column: 37, scope: !119)
!132 = !DILocation(line: 119, column: 3, scope: !119)
!133 = !DILocation(line: 120, column: 3, scope: !119)
!134 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !57, file: !57, line: 140, type: !135, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
!135 = !DISubroutineType(types: !136)
!136 = !{!9, !60, !64, !64}
!137 = !DILocalVariable(name: "ss", arg: 1, scope: !134, file: !57, line: 140, type: !60)
!138 = !DILocation(line: 0, scope: !134)
!139 = !DILocalVariable(name: "ct", arg: 2, scope: !134, file: !57, line: 141, type: !64)
!140 = !DILocalVariable(name: "sk", arg: 3, scope: !134, file: !57, line: 142, type: !64)
!141 = !DILocalVariable(name: "buf", scope: !134, file: !57, line: 145, type: !87)
!142 = !DILocation(line: 145, column: 11, scope: !134)
!143 = !DILocalVariable(name: "kr", scope: !134, file: !57, line: 147, type: !87)
!144 = !DILocation(line: 147, column: 11, scope: !134)
!145 = !DILocalVariable(name: "cmp", scope: !134, file: !57, line: 149, type: !146)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 8704, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 1088)
!149 = !DILocation(line: 149, column: 11, scope: !134)
!150 = !DILocation(line: 150, column: 25, scope: !134)
!151 = !DILocalVariable(name: "pk", scope: !134, file: !57, line: 150, type: !64)
!152 = !DILocation(line: 152, column: 14, scope: !134)
!153 = !DILocation(line: 152, column: 3, scope: !134)
!154 = !DILocation(line: 155, column: 10, scope: !134)
!155 = !DILocation(line: 155, column: 13, scope: !134)
!156 = !DILocation(line: 155, column: 32, scope: !134)
!157 = !DILocation(line: 155, column: 53, scope: !134)
!158 = !DILocation(line: 155, column: 3, scope: !134)
!159 = !DILocation(line: 156, column: 3, scope: !134)
!160 = !DILocation(line: 159, column: 14, scope: !134)
!161 = !DILocation(line: 159, column: 19, scope: !134)
!162 = !DILocation(line: 159, column: 28, scope: !134)
!163 = !DILocation(line: 159, column: 30, scope: !134)
!164 = !DILocation(line: 159, column: 3, scope: !134)
!165 = !DILocation(line: 161, column: 21, scope: !134)
!166 = !DILocation(line: 161, column: 10, scope: !134)
!167 = !DILocalVariable(name: "fail", scope: !134, file: !57, line: 144, type: !9)
!168 = !DILocation(line: 164, column: 3, scope: !134)
!169 = !DILocation(line: 167, column: 11, scope: !134)
!170 = !DILocation(line: 167, column: 29, scope: !134)
!171 = !DILocation(line: 167, column: 3, scope: !134)
!172 = !DILocation(line: 169, column: 3, scope: !134)
!173 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !174, file: !174, line: 165, type: !175, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!174 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!175 = !DISubroutineType(types: !176)
!176 = !{null, !177, !64, !9}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 32)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !180)
!179 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 12288, elements: !181)
!181 = !{!182}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !180, file: !179, line: 9, baseType: !183, size: 12288)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 12288, elements: !192)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !186)
!185 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !187)
!187 = !{!188}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !186, file: !185, line: 12, baseType: !189, size: 4096)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !190)
!190 = !{!191}
!191 = !DISubrange(count: 256)
!192 = !{!193}
!193 = !DISubrange(count: 3)
!194 = !DILocalVariable(name: "a", arg: 1, scope: !173, file: !174, line: 165, type: !177)
!195 = !DILocation(line: 0, scope: !173)
!196 = !DILocalVariable(name: "seed", arg: 2, scope: !173, file: !174, line: 165, type: !64)
!197 = !DILocalVariable(name: "transposed", arg: 3, scope: !173, file: !174, line: 165, type: !9)
!198 = !DILocalVariable(name: "buf", scope: !173, file: !174, line: 169, type: !199)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4032, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 504)
!202 = !DILocation(line: 169, column: 11, scope: !173)
!203 = !DILocalVariable(name: "state", scope: !173, file: !174, line: 170, type: !204)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !205, line: 10, baseType: !206)
!205 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !208)
!207 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !209)
!209 = !{!210, !214}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !208, file: !207, line: 15, baseType: !211, size: 1600)
!211 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !212)
!212 = !{!213}
!213 = !DISubrange(count: 25)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !208, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!215 = !DILocation(line: 170, column: 13, scope: !173)
!216 = !DILocalVariable(name: "i", scope: !173, file: !174, line: 167, type: !42)
!217 = !DILocation(line: 172, column: 7, scope: !218)
!218 = distinct !DILexicalBlock(scope: !173, file: !174, line: 172, column: 3)
!219 = !DILocation(line: 172, scope: !218)
!220 = !DILocation(line: 172, column: 12, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !174, line: 172, column: 3)
!222 = !DILocation(line: 172, column: 3, scope: !218)
!223 = !DILocalVariable(name: "j", scope: !173, file: !174, line: 167, type: !42)
!224 = !DILocation(line: 173, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !174, line: 173, column: 5)
!226 = distinct !DILexicalBlock(scope: !221, file: !174, line: 172, column: 26)
!227 = !DILocation(line: 173, scope: !225)
!228 = !DILocation(line: 173, column: 14, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !174, line: 173, column: 5)
!230 = !DILocation(line: 173, column: 5, scope: !225)
!231 = !DILocation(line: 174, column: 10, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !174, line: 174, column: 10)
!233 = distinct !DILexicalBlock(scope: !229, file: !174, line: 173, column: 28)
!234 = !DILocation(line: 175, column: 9, scope: !232)
!235 = !DILocation(line: 177, column: 9, scope: !232)
!236 = !DILocation(line: 179, column: 7, scope: !233)
!237 = !DILocalVariable(name: "buflen", scope: !173, file: !174, line: 168, type: !42)
!238 = !DILocation(line: 181, column: 25, scope: !233)
!239 = !DILocation(line: 181, column: 30, scope: !233)
!240 = !DILocation(line: 181, column: 37, scope: !233)
!241 = !DILocation(line: 181, column: 54, scope: !233)
!242 = !DILocation(line: 181, column: 13, scope: !233)
!243 = !DILocalVariable(name: "ctr", scope: !173, file: !174, line: 167, type: !42)
!244 = !DILocation(line: 183, column: 7, scope: !233)
!245 = !DILocation(line: 0, scope: !233)
!246 = !DILocation(line: 183, column: 17, scope: !233)
!247 = !DILocation(line: 184, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !233, file: !174, line: 183, column: 28)
!249 = !DILocation(line: 186, column: 28, scope: !248)
!250 = !DILocation(line: 186, column: 33, scope: !248)
!251 = !DILocation(line: 186, column: 40, scope: !248)
!252 = !DILocation(line: 186, column: 47, scope: !248)
!253 = !DILocation(line: 186, column: 62, scope: !248)
!254 = !DILocation(line: 186, column: 69, scope: !248)
!255 = !DILocation(line: 186, column: 16, scope: !248)
!256 = !DILocation(line: 186, column: 13, scope: !248)
!257 = distinct !{!257, !244, !258, !259}
!258 = !DILocation(line: 187, column: 7, scope: !233)
!259 = !{!"llvm.loop.mustprogress"}
!260 = !DILocation(line: 188, column: 5, scope: !233)
!261 = !DILocation(line: 173, column: 24, scope: !229)
!262 = !DILocation(line: 173, column: 5, scope: !229)
!263 = distinct !{!263, !230, !264, !259}
!264 = !DILocation(line: 188, column: 5, scope: !225)
!265 = !DILocation(line: 189, column: 3, scope: !226)
!266 = !DILocation(line: 172, column: 22, scope: !221)
!267 = !DILocation(line: 172, column: 3, scope: !221)
!268 = distinct !{!268, !222, !269, !259}
!269 = !DILocation(line: 189, column: 3, scope: !218)
!270 = !DILocation(line: 190, column: 1, scope: !173)
!271 = distinct !DISubprogram(name: "rej_uniform", scope: !174, file: !174, line: 121, type: !272, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!272 = !DISubroutineType(types: !273)
!273 = !{!42, !274, !42, !64, !42}
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!275 = !DILocalVariable(name: "r", arg: 1, scope: !271, file: !174, line: 121, type: !274)
!276 = !DILocation(line: 0, scope: !271)
!277 = !DILocalVariable(name: "len", arg: 2, scope: !271, file: !174, line: 122, type: !42)
!278 = !DILocalVariable(name: "buf", arg: 3, scope: !271, file: !174, line: 123, type: !64)
!279 = !DILocalVariable(name: "buflen", arg: 4, scope: !271, file: !174, line: 124, type: !42)
!280 = !DILocalVariable(name: "pos", scope: !271, file: !174, line: 126, type: !42)
!281 = !DILocalVariable(name: "ctr", scope: !271, file: !174, line: 126, type: !42)
!282 = !DILocation(line: 130, column: 3, scope: !271)
!283 = !DILocation(line: 130, column: 13, scope: !271)
!284 = !DILocation(line: 130, column: 19, scope: !271)
!285 = !DILocation(line: 130, column: 26, scope: !271)
!286 = !DILocation(line: 130, column: 30, scope: !271)
!287 = !DILocation(line: 131, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !271, file: !174, line: 130, column: 41)
!289 = !DILocation(line: 131, column: 14, scope: !288)
!290 = !DILocation(line: 131, column: 25, scope: !288)
!291 = !DILocation(line: 131, column: 51, scope: !288)
!292 = !DILocation(line: 131, column: 44, scope: !288)
!293 = !DILocation(line: 131, column: 34, scope: !288)
!294 = !DILocation(line: 131, column: 55, scope: !288)
!295 = !DILocation(line: 131, column: 31, scope: !288)
!296 = !DILocation(line: 131, column: 62, scope: !288)
!297 = !DILocation(line: 131, column: 12, scope: !288)
!298 = !DILocalVariable(name: "val0", scope: !271, file: !174, line: 127, type: !35)
!299 = !DILocation(line: 132, column: 21, scope: !288)
!300 = !DILocation(line: 132, column: 14, scope: !288)
!301 = !DILocation(line: 132, column: 25, scope: !288)
!302 = !DILocation(line: 132, column: 51, scope: !288)
!303 = !DILocation(line: 132, column: 44, scope: !288)
!304 = !DILocation(line: 132, column: 34, scope: !288)
!305 = !DILocation(line: 132, column: 55, scope: !288)
!306 = !DILocation(line: 132, column: 31, scope: !288)
!307 = !DILocation(line: 132, column: 62, scope: !288)
!308 = !DILocation(line: 132, column: 12, scope: !288)
!309 = !DILocalVariable(name: "val1", scope: !271, file: !174, line: 127, type: !35)
!310 = !DILocation(line: 133, column: 9, scope: !288)
!311 = !DILocation(line: 135, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !288, file: !174, line: 135, column: 8)
!313 = !DILocation(line: 135, column: 13, scope: !312)
!314 = !DILocation(line: 136, column: 12, scope: !312)
!315 = !DILocation(line: 136, column: 7, scope: !312)
!316 = !DILocation(line: 136, column: 16, scope: !312)
!317 = !DILocation(line: 137, column: 12, scope: !318)
!318 = distinct !DILexicalBlock(scope: !288, file: !174, line: 137, column: 8)
!319 = !DILocation(line: 137, column: 18, scope: !318)
!320 = !DILocation(line: 137, column: 21, scope: !318)
!321 = !DILocation(line: 137, column: 26, scope: !318)
!322 = !DILocation(line: 138, column: 12, scope: !318)
!323 = !DILocation(line: 138, column: 7, scope: !318)
!324 = !DILocation(line: 138, column: 16, scope: !318)
!325 = !DILocation(line: 0, scope: !288)
!326 = distinct !{!326, !282, !327, !259}
!327 = !DILocation(line: 139, column: 3, scope: !271)
!328 = !DILocation(line: 141, column: 3, scope: !271)
!329 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !174, file: !174, line: 205, type: !330, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !60, !60, !64}
!332 = !DILocalVariable(name: "pk", arg: 1, scope: !329, file: !174, line: 205, type: !60)
!333 = !DILocation(line: 0, scope: !329)
!334 = !DILocalVariable(name: "sk", arg: 2, scope: !329, file: !174, line: 206, type: !60)
!335 = !DILocalVariable(name: "coins", arg: 3, scope: !329, file: !174, line: 207, type: !64)
!336 = !DILocalVariable(name: "buf", scope: !329, file: !174, line: 210, type: !87)
!337 = !DILocation(line: 210, column: 11, scope: !329)
!338 = !DILocation(line: 211, column: 31, scope: !329)
!339 = !DILocalVariable(name: "publicseed", scope: !329, file: !174, line: 211, type: !64)
!340 = !DILocation(line: 212, column: 30, scope: !329)
!341 = !DILocation(line: 212, column: 33, scope: !329)
!342 = !DILocalVariable(name: "noiseseed", scope: !329, file: !174, line: 212, type: !64)
!343 = !DILocalVariable(name: "nonce", scope: !329, file: !174, line: 213, type: !61)
!344 = !DILocalVariable(name: "a", scope: !329, file: !174, line: 214, type: !345)
!345 = !DICompositeType(tag: DW_TAG_array_type, baseType: !178, size: 36864, elements: !192)
!346 = !DILocation(line: 214, column: 11, scope: !329)
!347 = !DILocalVariable(name: "e", scope: !329, file: !174, line: 214, type: !178)
!348 = !DILocation(line: 214, column: 23, scope: !329)
!349 = !DILocalVariable(name: "pkpv", scope: !329, file: !174, line: 214, type: !178)
!350 = !DILocation(line: 214, column: 26, scope: !329)
!351 = !DILocalVariable(name: "skpv", scope: !329, file: !174, line: 214, type: !178)
!352 = !DILocation(line: 214, column: 32, scope: !329)
!353 = !DILocation(line: 216, column: 10, scope: !329)
!354 = !DILocation(line: 216, column: 3, scope: !329)
!355 = !DILocation(line: 217, column: 3, scope: !329)
!356 = !DILocation(line: 217, column: 23, scope: !329)
!357 = !DILocation(line: 218, column: 3, scope: !329)
!358 = !DILocation(line: 220, column: 3, scope: !329)
!359 = !DILocalVariable(name: "i", scope: !329, file: !174, line: 209, type: !42)
!360 = !DILocation(line: 222, column: 7, scope: !361)
!361 = distinct !DILexicalBlock(scope: !329, file: !174, line: 222, column: 3)
!362 = !DILocation(line: 222, scope: !361)
!363 = !DILocation(line: 222, column: 12, scope: !364)
!364 = distinct !DILexicalBlock(scope: !361, file: !174, line: 222, column: 3)
!365 = !DILocation(line: 222, column: 3, scope: !361)
!366 = !DILocation(line: 223, column: 30, scope: !364)
!367 = !DILocation(line: 223, column: 25, scope: !364)
!368 = !DILocation(line: 223, column: 54, scope: !364)
!369 = !DILocation(line: 223, column: 5, scope: !364)
!370 = !DILocation(line: 222, column: 22, scope: !364)
!371 = !DILocation(line: 222, column: 3, scope: !364)
!372 = distinct !{!372, !365, !373, !259}
!373 = !DILocation(line: 223, column: 56, scope: !361)
!374 = !DILocation(line: 224, column: 7, scope: !375)
!375 = distinct !DILexicalBlock(scope: !329, file: !174, line: 224, column: 3)
!376 = !DILocation(line: 224, scope: !375)
!377 = !DILocation(line: 224, column: 12, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !174, line: 224, column: 3)
!379 = !DILocation(line: 224, column: 3, scope: !375)
!380 = !DILocation(line: 225, column: 27, scope: !378)
!381 = !DILocation(line: 225, column: 25, scope: !378)
!382 = !DILocation(line: 225, column: 51, scope: !378)
!383 = !DILocation(line: 225, column: 5, scope: !378)
!384 = !DILocation(line: 224, column: 22, scope: !378)
!385 = !DILocation(line: 224, column: 3, scope: !378)
!386 = distinct !{!386, !379, !387, !259}
!387 = !DILocation(line: 225, column: 53, scope: !375)
!388 = !DILocation(line: 227, column: 3, scope: !329)
!389 = !DILocation(line: 228, column: 3, scope: !329)
!390 = !DILocation(line: 231, column: 7, scope: !391)
!391 = distinct !DILexicalBlock(scope: !329, file: !174, line: 231, column: 3)
!392 = !DILocation(line: 231, scope: !391)
!393 = !DILocation(line: 231, column: 12, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !174, line: 231, column: 3)
!395 = !DILocation(line: 231, column: 3, scope: !391)
!396 = !DILocation(line: 232, column: 42, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !174, line: 231, column: 26)
!398 = !DILocation(line: 232, column: 37, scope: !397)
!399 = !DILocation(line: 232, column: 51, scope: !397)
!400 = !DILocation(line: 232, column: 5, scope: !397)
!401 = !DILocation(line: 233, column: 23, scope: !397)
!402 = !DILocation(line: 233, column: 18, scope: !397)
!403 = !DILocation(line: 233, column: 5, scope: !397)
!404 = !DILocation(line: 234, column: 3, scope: !397)
!405 = !DILocation(line: 231, column: 22, scope: !394)
!406 = !DILocation(line: 231, column: 3, scope: !394)
!407 = distinct !{!407, !395, !408, !259}
!408 = !DILocation(line: 234, column: 3, scope: !391)
!409 = !DILocation(line: 236, column: 3, scope: !329)
!410 = !DILocation(line: 237, column: 3, scope: !329)
!411 = !DILocation(line: 239, column: 3, scope: !329)
!412 = !DILocation(line: 240, column: 3, scope: !329)
!413 = !DILocation(line: 241, column: 1, scope: !329)
!414 = distinct !DISubprogram(name: "pack_sk", scope: !174, file: !174, line: 57, type: !415, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!415 = !DISubroutineType(types: !416)
!416 = !{null, !60, !177}
!417 = !DILocalVariable(name: "r", arg: 1, scope: !414, file: !174, line: 57, type: !60)
!418 = !DILocation(line: 0, scope: !414)
!419 = !DILocalVariable(name: "sk", arg: 2, scope: !414, file: !174, line: 57, type: !177)
!420 = !DILocation(line: 59, column: 3, scope: !414)
!421 = !DILocation(line: 60, column: 1, scope: !414)
!422 = distinct !DISubprogram(name: "pack_pk", scope: !174, file: !174, line: 23, type: !423, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !60, !177, !64}
!425 = !DILocalVariable(name: "r", arg: 1, scope: !422, file: !174, line: 23, type: !60)
!426 = !DILocation(line: 0, scope: !422)
!427 = !DILocalVariable(name: "pk", arg: 2, scope: !422, file: !174, line: 24, type: !177)
!428 = !DILocalVariable(name: "seed", arg: 3, scope: !422, file: !174, line: 25, type: !64)
!429 = !DILocation(line: 27, column: 3, scope: !422)
!430 = !DILocation(line: 28, column: 11, scope: !422)
!431 = !DILocation(line: 28, column: 3, scope: !422)
!432 = !DILocation(line: 29, column: 1, scope: !422)
!433 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !174, file: !174, line: 260, type: !434, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!434 = !DISubroutineType(types: !435)
!435 = !{null, !60, !64, !64, !64}
!436 = !DILocalVariable(name: "c", arg: 1, scope: !433, file: !174, line: 260, type: !60)
!437 = !DILocation(line: 0, scope: !433)
!438 = !DILocalVariable(name: "m", arg: 2, scope: !433, file: !174, line: 261, type: !64)
!439 = !DILocalVariable(name: "pk", arg: 3, scope: !433, file: !174, line: 262, type: !64)
!440 = !DILocalVariable(name: "coins", arg: 4, scope: !433, file: !174, line: 263, type: !64)
!441 = !DILocalVariable(name: "seed", scope: !433, file: !174, line: 266, type: !125)
!442 = !DILocation(line: 266, column: 11, scope: !433)
!443 = !DILocalVariable(name: "nonce", scope: !433, file: !174, line: 267, type: !61)
!444 = !DILocalVariable(name: "sp", scope: !433, file: !174, line: 268, type: !178)
!445 = !DILocation(line: 268, column: 11, scope: !433)
!446 = !DILocalVariable(name: "pkpv", scope: !433, file: !174, line: 268, type: !178)
!447 = !DILocation(line: 268, column: 15, scope: !433)
!448 = !DILocalVariable(name: "ep", scope: !433, file: !174, line: 268, type: !178)
!449 = !DILocation(line: 268, column: 21, scope: !433)
!450 = !DILocalVariable(name: "at", scope: !433, file: !174, line: 268, type: !345)
!451 = !DILocation(line: 268, column: 25, scope: !433)
!452 = !DILocalVariable(name: "b", scope: !433, file: !174, line: 268, type: !178)
!453 = !DILocation(line: 268, column: 38, scope: !433)
!454 = !DILocalVariable(name: "v", scope: !433, file: !174, line: 269, type: !184)
!455 = !DILocation(line: 269, column: 8, scope: !433)
!456 = !DILocalVariable(name: "k", scope: !433, file: !174, line: 269, type: !184)
!457 = !DILocation(line: 269, column: 11, scope: !433)
!458 = !DILocalVariable(name: "epp", scope: !433, file: !174, line: 269, type: !184)
!459 = !DILocation(line: 269, column: 14, scope: !433)
!460 = !DILocation(line: 271, column: 20, scope: !433)
!461 = !DILocation(line: 271, column: 3, scope: !433)
!462 = !DILocation(line: 272, column: 3, scope: !433)
!463 = !DILocation(line: 273, column: 3, scope: !433)
!464 = !DILocalVariable(name: "i", scope: !433, file: !174, line: 265, type: !42)
!465 = !DILocation(line: 275, column: 7, scope: !466)
!466 = distinct !DILexicalBlock(scope: !433, file: !174, line: 275, column: 3)
!467 = !DILocation(line: 275, scope: !466)
!468 = !DILocation(line: 275, column: 12, scope: !469)
!469 = distinct !DILexicalBlock(scope: !466, file: !174, line: 275, column: 3)
!470 = !DILocation(line: 275, column: 3, scope: !466)
!471 = !DILocation(line: 276, column: 27, scope: !469)
!472 = !DILocation(line: 276, column: 24, scope: !469)
!473 = !DILocation(line: 276, column: 30, scope: !469)
!474 = !DILocation(line: 276, column: 46, scope: !469)
!475 = !DILocation(line: 276, column: 5, scope: !469)
!476 = !DILocation(line: 275, column: 22, scope: !469)
!477 = !DILocation(line: 275, column: 3, scope: !469)
!478 = distinct !{!478, !470, !479, !259}
!479 = !DILocation(line: 276, column: 48, scope: !466)
!480 = !DILocation(line: 277, column: 7, scope: !481)
!481 = distinct !DILexicalBlock(scope: !433, file: !174, line: 277, column: 3)
!482 = !DILocation(line: 277, scope: !481)
!483 = !DILocation(line: 277, column: 12, scope: !484)
!484 = distinct !DILexicalBlock(scope: !481, file: !174, line: 277, column: 3)
!485 = !DILocation(line: 277, column: 3, scope: !481)
!486 = !DILocation(line: 278, column: 27, scope: !484)
!487 = !DILocation(line: 278, column: 24, scope: !484)
!488 = !DILocation(line: 278, column: 30, scope: !484)
!489 = !DILocation(line: 278, column: 46, scope: !484)
!490 = !DILocation(line: 278, column: 5, scope: !484)
!491 = !DILocation(line: 277, column: 22, scope: !484)
!492 = !DILocation(line: 277, column: 3, scope: !484)
!493 = distinct !{!493, !485, !494, !259}
!494 = !DILocation(line: 278, column: 48, scope: !481)
!495 = !DILocation(line: 279, column: 40, scope: !433)
!496 = !DILocation(line: 279, column: 3, scope: !433)
!497 = !DILocation(line: 281, column: 3, scope: !433)
!498 = !DILocation(line: 284, column: 7, scope: !499)
!499 = distinct !DILexicalBlock(scope: !433, file: !174, line: 284, column: 3)
!500 = !DILocation(line: 284, scope: !499)
!501 = !DILocation(line: 284, column: 12, scope: !502)
!502 = distinct !DILexicalBlock(scope: !499, file: !174, line: 284, column: 3)
!503 = !DILocation(line: 284, column: 3, scope: !499)
!504 = !DILocation(line: 285, column: 39, scope: !502)
!505 = !DILocation(line: 285, column: 37, scope: !502)
!506 = !DILocation(line: 285, column: 48, scope: !502)
!507 = !DILocation(line: 285, column: 5, scope: !502)
!508 = !DILocation(line: 284, column: 22, scope: !502)
!509 = !DILocation(line: 284, column: 3, scope: !502)
!510 = distinct !{!510, !503, !511, !259}
!511 = !DILocation(line: 285, column: 58, scope: !499)
!512 = !DILocation(line: 287, column: 3, scope: !433)
!513 = !DILocation(line: 289, column: 3, scope: !433)
!514 = !DILocation(line: 290, column: 3, scope: !433)
!515 = !DILocation(line: 292, column: 3, scope: !433)
!516 = !DILocation(line: 293, column: 3, scope: !433)
!517 = !DILocation(line: 294, column: 3, scope: !433)
!518 = !DILocation(line: 295, column: 3, scope: !433)
!519 = !DILocation(line: 296, column: 3, scope: !433)
!520 = !DILocation(line: 298, column: 3, scope: !433)
!521 = !DILocation(line: 299, column: 1, scope: !433)
!522 = distinct !DISubprogram(name: "unpack_pk", scope: !174, file: !174, line: 41, type: !523, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!523 = !DISubroutineType(types: !524)
!524 = !{null, !177, !60, !64}
!525 = !DILocalVariable(name: "pk", arg: 1, scope: !522, file: !174, line: 41, type: !177)
!526 = !DILocation(line: 0, scope: !522)
!527 = !DILocalVariable(name: "seed", arg: 2, scope: !522, file: !174, line: 42, type: !60)
!528 = !DILocalVariable(name: "packedpk", arg: 3, scope: !522, file: !174, line: 43, type: !64)
!529 = !DILocation(line: 45, column: 3, scope: !522)
!530 = !DILocation(line: 46, column: 24, scope: !522)
!531 = !DILocation(line: 46, column: 3, scope: !522)
!532 = !DILocation(line: 47, column: 1, scope: !522)
!533 = distinct !DISubprogram(name: "pack_ciphertext", scope: !174, file: !174, line: 86, type: !534, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!534 = !DISubroutineType(types: !535)
!535 = !{null, !60, !177, !536}
!536 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 32)
!537 = !DILocalVariable(name: "r", arg: 1, scope: !533, file: !174, line: 86, type: !60)
!538 = !DILocation(line: 0, scope: !533)
!539 = !DILocalVariable(name: "b", arg: 2, scope: !533, file: !174, line: 86, type: !177)
!540 = !DILocalVariable(name: "v", arg: 3, scope: !533, file: !174, line: 86, type: !536)
!541 = !DILocation(line: 88, column: 3, scope: !533)
!542 = !DILocation(line: 89, column: 18, scope: !533)
!543 = !DILocation(line: 89, column: 3, scope: !533)
!544 = !DILocation(line: 90, column: 1, scope: !533)
!545 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !174, file: !174, line: 314, type: !546, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!546 = !DISubroutineType(types: !547)
!547 = !{null, !60, !64, !64}
!548 = !DILocalVariable(name: "m", arg: 1, scope: !545, file: !174, line: 314, type: !60)
!549 = !DILocation(line: 0, scope: !545)
!550 = !DILocalVariable(name: "c", arg: 2, scope: !545, file: !174, line: 315, type: !64)
!551 = !DILocalVariable(name: "sk", arg: 3, scope: !545, file: !174, line: 316, type: !64)
!552 = !DILocalVariable(name: "b", scope: !545, file: !174, line: 318, type: !178)
!553 = !DILocation(line: 318, column: 11, scope: !545)
!554 = !DILocalVariable(name: "skpv", scope: !545, file: !174, line: 318, type: !178)
!555 = !DILocation(line: 318, column: 14, scope: !545)
!556 = !DILocalVariable(name: "v", scope: !545, file: !174, line: 319, type: !184)
!557 = !DILocation(line: 319, column: 8, scope: !545)
!558 = !DILocalVariable(name: "mp", scope: !545, file: !174, line: 319, type: !184)
!559 = !DILocation(line: 319, column: 11, scope: !545)
!560 = !DILocation(line: 321, column: 3, scope: !545)
!561 = !DILocation(line: 322, column: 3, scope: !545)
!562 = !DILocation(line: 324, column: 3, scope: !545)
!563 = !DILocation(line: 325, column: 3, scope: !545)
!564 = !DILocation(line: 326, column: 3, scope: !545)
!565 = !DILocation(line: 328, column: 3, scope: !545)
!566 = !DILocation(line: 329, column: 3, scope: !545)
!567 = !DILocation(line: 331, column: 3, scope: !545)
!568 = !DILocation(line: 332, column: 1, scope: !545)
!569 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !174, file: !174, line: 102, type: !570, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!570 = !DISubroutineType(types: !571)
!571 = !{null, !177, !536, !64}
!572 = !DILocalVariable(name: "b", arg: 1, scope: !569, file: !174, line: 102, type: !177)
!573 = !DILocation(line: 0, scope: !569)
!574 = !DILocalVariable(name: "v", arg: 2, scope: !569, file: !174, line: 102, type: !536)
!575 = !DILocalVariable(name: "c", arg: 3, scope: !569, file: !174, line: 102, type: !64)
!576 = !DILocation(line: 104, column: 3, scope: !569)
!577 = !DILocation(line: 105, column: 23, scope: !569)
!578 = !DILocation(line: 105, column: 3, scope: !569)
!579 = !DILocation(line: 106, column: 1, scope: !569)
!580 = distinct !DISubprogram(name: "unpack_sk", scope: !174, file: !174, line: 70, type: !581, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !33, retainedNodes: !66)
!581 = !DISubroutineType(types: !582)
!582 = !{null, !177, !64}
!583 = !DILocalVariable(name: "sk", arg: 1, scope: !580, file: !174, line: 70, type: !177)
!584 = !DILocation(line: 0, scope: !580)
!585 = !DILocalVariable(name: "packedsk", arg: 2, scope: !580, file: !174, line: 70, type: !64)
!586 = !DILocation(line: 72, column: 3, scope: !580)
!587 = !DILocation(line: 73, column: 1, scope: !580)
!588 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !589, file: !589, line: 15, type: !590, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!589 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!590 = !DISubroutineType(types: !591)
!591 = !{null, !60, !592}
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !593, size: 32)
!593 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !594)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !595)
!595 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 12288, elements: !596)
!596 = !{!597}
!597 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !595, file: !179, line: 9, baseType: !598, size: 12288)
!598 = !DICompositeType(tag: DW_TAG_array_type, baseType: !599, size: 12288, elements: !192)
!599 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !600)
!600 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !601)
!601 = !{!602}
!602 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !600, file: !185, line: 12, baseType: !189, size: 4096)
!603 = !DILocalVariable(name: "r", arg: 1, scope: !588, file: !589, line: 15, type: !60)
!604 = !DILocation(line: 0, scope: !588)
!605 = !DILocalVariable(name: "a", arg: 2, scope: !588, file: !589, line: 15, type: !592)
!606 = !DILocalVariable(name: "t", scope: !588, file: !589, line: 51, type: !607)
!607 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 64, elements: !608)
!608 = !{!609}
!609 = !DISubrange(count: 4)
!610 = !DILocation(line: 51, column: 12, scope: !588)
!611 = !DILocalVariable(name: "i", scope: !588, file: !589, line: 17, type: !42)
!612 = !DILocation(line: 52, column: 7, scope: !613)
!613 = distinct !DILexicalBlock(scope: !588, file: !589, line: 52, column: 3)
!614 = !DILocation(line: 52, scope: !613)
!615 = !DILocation(line: 52, column: 12, scope: !616)
!616 = distinct !DILexicalBlock(scope: !613, file: !589, line: 52, column: 3)
!617 = !DILocation(line: 52, column: 3, scope: !613)
!618 = !DILocalVariable(name: "j", scope: !588, file: !589, line: 17, type: !42)
!619 = !DILocation(line: 53, column: 9, scope: !620)
!620 = distinct !DILexicalBlock(scope: !621, file: !589, line: 53, column: 5)
!621 = distinct !DILexicalBlock(scope: !616, file: !589, line: 52, column: 26)
!622 = !DILocation(line: 53, scope: !620)
!623 = !DILocation(line: 53, column: 14, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !589, line: 53, column: 5)
!625 = !DILocation(line: 53, column: 5, scope: !620)
!626 = !DILocalVariable(name: "k", scope: !588, file: !589, line: 17, type: !42)
!627 = !DILocation(line: 54, column: 11, scope: !628)
!628 = distinct !DILexicalBlock(scope: !629, file: !589, line: 54, column: 7)
!629 = distinct !DILexicalBlock(scope: !624, file: !589, line: 53, column: 30)
!630 = !DILocation(line: 54, scope: !628)
!631 = !DILocation(line: 54, column: 16, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !589, line: 54, column: 7)
!633 = !DILocation(line: 54, column: 7, scope: !628)
!634 = !DILocation(line: 55, column: 20, scope: !635)
!635 = distinct !DILexicalBlock(scope: !632, file: !589, line: 54, column: 24)
!636 = !DILocation(line: 55, column: 17, scope: !635)
!637 = !DILocation(line: 55, column: 27, scope: !635)
!638 = !DILocation(line: 55, column: 35, scope: !635)
!639 = !DILocation(line: 55, column: 37, scope: !635)
!640 = !DILocation(line: 55, column: 9, scope: !635)
!641 = !DILocation(line: 55, column: 15, scope: !635)
!642 = !DILocation(line: 56, column: 27, scope: !635)
!643 = !DILocation(line: 56, column: 18, scope: !635)
!644 = !DILocation(line: 56, column: 32, scope: !635)
!645 = !DILocation(line: 56, column: 39, scope: !635)
!646 = !DILocation(line: 56, column: 9, scope: !635)
!647 = !DILocation(line: 56, column: 14, scope: !635)
!648 = !DILocation(line: 58, column: 14, scope: !635)
!649 = !DILocalVariable(name: "d0", scope: !588, file: !589, line: 18, type: !23)
!650 = !DILocation(line: 59, column: 12, scope: !635)
!651 = !DILocation(line: 60, column: 12, scope: !635)
!652 = !DILocation(line: 61, column: 12, scope: !635)
!653 = !DILocation(line: 62, column: 12, scope: !635)
!654 = !DILocation(line: 63, column: 19, scope: !635)
!655 = !DILocation(line: 63, column: 16, scope: !635)
!656 = !DILocation(line: 63, column: 9, scope: !635)
!657 = !DILocation(line: 63, column: 14, scope: !635)
!658 = !DILocation(line: 64, column: 7, scope: !635)
!659 = !DILocation(line: 54, column: 20, scope: !632)
!660 = !DILocation(line: 54, column: 7, scope: !632)
!661 = distinct !{!661, !633, !662, !259}
!662 = !DILocation(line: 64, column: 7, scope: !628)
!663 = !DILocation(line: 66, column: 15, scope: !629)
!664 = !DILocation(line: 66, column: 20, scope: !629)
!665 = !DILocation(line: 66, column: 14, scope: !629)
!666 = !DILocation(line: 66, column: 7, scope: !629)
!667 = !DILocation(line: 66, column: 12, scope: !629)
!668 = !DILocation(line: 67, column: 15, scope: !629)
!669 = !DILocation(line: 67, column: 20, scope: !629)
!670 = !DILocation(line: 67, column: 29, scope: !629)
!671 = !DILocation(line: 67, column: 34, scope: !629)
!672 = !DILocation(line: 67, column: 26, scope: !629)
!673 = !DILocation(line: 67, column: 14, scope: !629)
!674 = !DILocation(line: 67, column: 7, scope: !629)
!675 = !DILocation(line: 67, column: 12, scope: !629)
!676 = !DILocation(line: 68, column: 15, scope: !629)
!677 = !DILocation(line: 68, column: 20, scope: !629)
!678 = !DILocation(line: 68, column: 29, scope: !629)
!679 = !DILocation(line: 68, column: 34, scope: !629)
!680 = !DILocation(line: 68, column: 26, scope: !629)
!681 = !DILocation(line: 68, column: 14, scope: !629)
!682 = !DILocation(line: 68, column: 7, scope: !629)
!683 = !DILocation(line: 68, column: 12, scope: !629)
!684 = !DILocation(line: 69, column: 15, scope: !629)
!685 = !DILocation(line: 69, column: 20, scope: !629)
!686 = !DILocation(line: 69, column: 29, scope: !629)
!687 = !DILocation(line: 69, column: 34, scope: !629)
!688 = !DILocation(line: 69, column: 26, scope: !629)
!689 = !DILocation(line: 69, column: 14, scope: !629)
!690 = !DILocation(line: 69, column: 7, scope: !629)
!691 = !DILocation(line: 69, column: 12, scope: !629)
!692 = !DILocation(line: 70, column: 15, scope: !629)
!693 = !DILocation(line: 70, column: 20, scope: !629)
!694 = !DILocation(line: 70, column: 14, scope: !629)
!695 = !DILocation(line: 70, column: 7, scope: !629)
!696 = !DILocation(line: 70, column: 12, scope: !629)
!697 = !DILocation(line: 71, column: 9, scope: !629)
!698 = !DILocation(line: 72, column: 5, scope: !629)
!699 = !DILocation(line: 53, column: 26, scope: !624)
!700 = !DILocation(line: 53, column: 5, scope: !624)
!701 = distinct !{!701, !625, !702, !259}
!702 = !DILocation(line: 72, column: 5, scope: !620)
!703 = !DILocation(line: 73, column: 3, scope: !621)
!704 = !DILocation(line: 52, column: 22, scope: !616)
!705 = !DILocation(line: 52, column: 3, scope: !616)
!706 = distinct !{!706, !617, !707, !259}
!707 = !DILocation(line: 73, column: 3, scope: !613)
!708 = !DILocation(line: 77, column: 1, scope: !588)
!709 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !589, file: !589, line: 89, type: !710, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!710 = !DISubroutineType(types: !711)
!711 = !{null, !712, !64}
!712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !594, size: 32)
!713 = !DILocalVariable(name: "r", arg: 1, scope: !709, file: !589, line: 89, type: !712)
!714 = !DILocation(line: 0, scope: !709)
!715 = !DILocalVariable(name: "a", arg: 2, scope: !709, file: !589, line: 89, type: !64)
!716 = !DILocalVariable(name: "t", scope: !709, file: !589, line: 112, type: !607)
!717 = !DILocation(line: 112, column: 12, scope: !709)
!718 = !DILocalVariable(name: "i", scope: !709, file: !589, line: 91, type: !42)
!719 = !DILocation(line: 113, column: 7, scope: !720)
!720 = distinct !DILexicalBlock(scope: !709, file: !589, line: 113, column: 3)
!721 = !DILocation(line: 113, scope: !720)
!722 = !DILocation(line: 113, column: 12, scope: !723)
!723 = distinct !DILexicalBlock(scope: !720, file: !589, line: 113, column: 3)
!724 = !DILocation(line: 113, column: 3, scope: !720)
!725 = !DILocalVariable(name: "j", scope: !709, file: !589, line: 91, type: !42)
!726 = !DILocation(line: 114, column: 9, scope: !727)
!727 = distinct !DILexicalBlock(scope: !728, file: !589, line: 114, column: 5)
!728 = distinct !DILexicalBlock(scope: !723, file: !589, line: 113, column: 26)
!729 = !DILocation(line: 114, scope: !727)
!730 = !DILocation(line: 114, column: 14, scope: !731)
!731 = distinct !DILexicalBlock(scope: !727, file: !589, line: 114, column: 5)
!732 = !DILocation(line: 114, column: 5, scope: !727)
!733 = !DILocation(line: 115, column: 15, scope: !734)
!734 = distinct !DILexicalBlock(scope: !731, file: !589, line: 114, column: 30)
!735 = !DILocation(line: 115, column: 20, scope: !734)
!736 = !DILocation(line: 115, column: 39, scope: !734)
!737 = !DILocation(line: 115, column: 29, scope: !734)
!738 = !DILocation(line: 115, column: 44, scope: !734)
!739 = !DILocation(line: 115, column: 26, scope: !734)
!740 = !DILocation(line: 115, column: 14, scope: !734)
!741 = !DILocation(line: 115, column: 7, scope: !734)
!742 = !DILocation(line: 115, column: 12, scope: !734)
!743 = !DILocation(line: 116, column: 15, scope: !734)
!744 = !DILocation(line: 116, column: 20, scope: !734)
!745 = !DILocation(line: 116, column: 39, scope: !734)
!746 = !DILocation(line: 116, column: 29, scope: !734)
!747 = !DILocation(line: 116, column: 44, scope: !734)
!748 = !DILocation(line: 116, column: 26, scope: !734)
!749 = !DILocation(line: 116, column: 14, scope: !734)
!750 = !DILocation(line: 116, column: 7, scope: !734)
!751 = !DILocation(line: 116, column: 12, scope: !734)
!752 = !DILocation(line: 117, column: 15, scope: !734)
!753 = !DILocation(line: 117, column: 20, scope: !734)
!754 = !DILocation(line: 117, column: 39, scope: !734)
!755 = !DILocation(line: 117, column: 29, scope: !734)
!756 = !DILocation(line: 117, column: 44, scope: !734)
!757 = !DILocation(line: 117, column: 26, scope: !734)
!758 = !DILocation(line: 117, column: 14, scope: !734)
!759 = !DILocation(line: 117, column: 7, scope: !734)
!760 = !DILocation(line: 117, column: 12, scope: !734)
!761 = !DILocation(line: 118, column: 15, scope: !734)
!762 = !DILocation(line: 118, column: 20, scope: !734)
!763 = !DILocation(line: 118, column: 39, scope: !734)
!764 = !DILocation(line: 118, column: 29, scope: !734)
!765 = !DILocation(line: 118, column: 44, scope: !734)
!766 = !DILocation(line: 118, column: 26, scope: !734)
!767 = !DILocation(line: 118, column: 14, scope: !734)
!768 = !DILocation(line: 118, column: 7, scope: !734)
!769 = !DILocation(line: 118, column: 12, scope: !734)
!770 = !DILocation(line: 119, column: 9, scope: !734)
!771 = !DILocalVariable(name: "k", scope: !709, file: !589, line: 91, type: !42)
!772 = !DILocation(line: 121, column: 11, scope: !773)
!773 = distinct !DILexicalBlock(scope: !734, file: !589, line: 121, column: 7)
!774 = !DILocation(line: 121, scope: !773)
!775 = !DILocation(line: 121, column: 16, scope: !776)
!776 = distinct !DILexicalBlock(scope: !773, file: !589, line: 121, column: 7)
!777 = !DILocation(line: 121, column: 7, scope: !773)
!778 = !DILocation(line: 122, column: 47, scope: !776)
!779 = !DILocation(line: 122, column: 52, scope: !776)
!780 = !DILocation(line: 122, column: 60, scope: !776)
!781 = !DILocation(line: 122, column: 69, scope: !776)
!782 = !DILocation(line: 122, column: 76, scope: !776)
!783 = !DILocation(line: 122, column: 35, scope: !776)
!784 = !DILocation(line: 122, column: 12, scope: !776)
!785 = !DILocation(line: 122, column: 9, scope: !776)
!786 = !DILocation(line: 122, column: 19, scope: !776)
!787 = !DILocation(line: 122, column: 27, scope: !776)
!788 = !DILocation(line: 122, column: 29, scope: !776)
!789 = !DILocation(line: 122, column: 33, scope: !776)
!790 = !DILocation(line: 121, column: 20, scope: !776)
!791 = !DILocation(line: 121, column: 7, scope: !776)
!792 = distinct !{!792, !777, !793, !259}
!793 = !DILocation(line: 122, column: 79, scope: !773)
!794 = !DILocation(line: 123, column: 5, scope: !734)
!795 = !DILocation(line: 114, column: 26, scope: !731)
!796 = !DILocation(line: 114, column: 5, scope: !731)
!797 = distinct !{!797, !732, !798, !259}
!798 = !DILocation(line: 123, column: 5, scope: !727)
!799 = !DILocation(line: 124, column: 3, scope: !728)
!800 = !DILocation(line: 113, column: 22, scope: !723)
!801 = !DILocation(line: 113, column: 3, scope: !723)
!802 = distinct !{!802, !724, !803, !259}
!803 = !DILocation(line: 124, column: 3, scope: !720)
!804 = !DILocation(line: 128, column: 1, scope: !709)
!805 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !589, file: !589, line: 139, type: !590, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!806 = !DILocalVariable(name: "r", arg: 1, scope: !805, file: !589, line: 139, type: !60)
!807 = !DILocation(line: 0, scope: !805)
!808 = !DILocalVariable(name: "a", arg: 2, scope: !805, file: !589, line: 139, type: !592)
!809 = !DILocalVariable(name: "i", scope: !805, file: !589, line: 141, type: !42)
!810 = !DILocation(line: 142, column: 7, scope: !811)
!811 = distinct !DILexicalBlock(scope: !805, file: !589, line: 142, column: 3)
!812 = !DILocation(line: 142, scope: !811)
!813 = !DILocation(line: 142, column: 12, scope: !814)
!814 = distinct !DILexicalBlock(scope: !811, file: !589, line: 142, column: 3)
!815 = !DILocation(line: 142, column: 3, scope: !811)
!816 = !DILocation(line: 143, column: 21, scope: !814)
!817 = !DILocation(line: 143, column: 19, scope: !814)
!818 = !DILocation(line: 143, column: 43, scope: !814)
!819 = !DILocation(line: 143, column: 40, scope: !814)
!820 = !DILocation(line: 143, column: 5, scope: !814)
!821 = !DILocation(line: 142, column: 22, scope: !814)
!822 = !DILocation(line: 142, column: 3, scope: !814)
!823 = distinct !{!823, !815, !824, !259}
!824 = !DILocation(line: 143, column: 49, scope: !811)
!825 = !DILocation(line: 144, column: 1, scope: !805)
!826 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !589, file: !589, line: 156, type: !710, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!827 = !DILocalVariable(name: "r", arg: 1, scope: !826, file: !589, line: 156, type: !712)
!828 = !DILocation(line: 0, scope: !826)
!829 = !DILocalVariable(name: "a", arg: 2, scope: !826, file: !589, line: 156, type: !64)
!830 = !DILocalVariable(name: "i", scope: !826, file: !589, line: 158, type: !42)
!831 = !DILocation(line: 159, column: 7, scope: !832)
!832 = distinct !DILexicalBlock(scope: !826, file: !589, line: 159, column: 3)
!833 = !DILocation(line: 159, scope: !832)
!834 = !DILocation(line: 159, column: 12, scope: !835)
!835 = distinct !DILexicalBlock(scope: !832, file: !589, line: 159, column: 3)
!836 = !DILocation(line: 159, column: 3, scope: !832)
!837 = !DILocation(line: 160, column: 24, scope: !835)
!838 = !DILocation(line: 160, column: 21, scope: !835)
!839 = !DILocation(line: 160, column: 35, scope: !835)
!840 = !DILocation(line: 160, column: 33, scope: !835)
!841 = !DILocation(line: 160, column: 5, scope: !835)
!842 = !DILocation(line: 159, column: 22, scope: !835)
!843 = !DILocation(line: 159, column: 3, scope: !835)
!844 = distinct !{!844, !836, !845, !259}
!845 = !DILocation(line: 160, column: 51, scope: !832)
!846 = !DILocation(line: 161, column: 1, scope: !826)
!847 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !589, file: !589, line: 170, type: !848, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!848 = !DISubroutineType(types: !849)
!849 = !{null, !712}
!850 = !DILocalVariable(name: "r", arg: 1, scope: !847, file: !589, line: 170, type: !712)
!851 = !DILocation(line: 0, scope: !847)
!852 = !DILocalVariable(name: "i", scope: !847, file: !589, line: 172, type: !42)
!853 = !DILocation(line: 173, column: 7, scope: !854)
!854 = distinct !DILexicalBlock(scope: !847, file: !589, line: 173, column: 3)
!855 = !DILocation(line: 173, scope: !854)
!856 = !DILocation(line: 173, column: 12, scope: !857)
!857 = distinct !DILexicalBlock(scope: !854, file: !589, line: 173, column: 3)
!858 = !DILocation(line: 173, column: 3, scope: !854)
!859 = !DILocation(line: 174, column: 18, scope: !857)
!860 = !DILocation(line: 174, column: 15, scope: !857)
!861 = !DILocation(line: 174, column: 5, scope: !857)
!862 = !DILocation(line: 173, column: 22, scope: !857)
!863 = !DILocation(line: 173, column: 3, scope: !857)
!864 = distinct !{!864, !858, !865, !259}
!865 = !DILocation(line: 174, column: 24, scope: !854)
!866 = !DILocation(line: 175, column: 1, scope: !847)
!867 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !589, file: !589, line: 185, type: !848, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!868 = !DILocalVariable(name: "r", arg: 1, scope: !867, file: !589, line: 185, type: !712)
!869 = !DILocation(line: 0, scope: !867)
!870 = !DILocalVariable(name: "i", scope: !867, file: !589, line: 187, type: !42)
!871 = !DILocation(line: 188, column: 7, scope: !872)
!872 = distinct !DILexicalBlock(scope: !867, file: !589, line: 188, column: 3)
!873 = !DILocation(line: 188, scope: !872)
!874 = !DILocation(line: 188, column: 12, scope: !875)
!875 = distinct !DILexicalBlock(scope: !872, file: !589, line: 188, column: 3)
!876 = !DILocation(line: 188, column: 3, scope: !872)
!877 = !DILocation(line: 189, column: 28, scope: !875)
!878 = !DILocation(line: 189, column: 25, scope: !875)
!879 = !DILocation(line: 189, column: 5, scope: !875)
!880 = !DILocation(line: 188, column: 22, scope: !875)
!881 = !DILocation(line: 188, column: 3, scope: !875)
!882 = distinct !{!882, !876, !883, !259}
!883 = !DILocation(line: 189, column: 34, scope: !872)
!884 = !DILocation(line: 190, column: 1, scope: !867)
!885 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !589, file: !589, line: 202, type: !886, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!886 = !DISubroutineType(types: !887)
!887 = !{null, !888, !592, !592}
!888 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !599, size: 32)
!889 = !DILocalVariable(name: "r", arg: 1, scope: !885, file: !589, line: 202, type: !888)
!890 = !DILocation(line: 0, scope: !885)
!891 = !DILocalVariable(name: "a", arg: 2, scope: !885, file: !589, line: 202, type: !592)
!892 = !DILocalVariable(name: "b", arg: 3, scope: !885, file: !589, line: 202, type: !592)
!893 = !DILocalVariable(name: "t", scope: !885, file: !589, line: 205, type: !599)
!894 = !DILocation(line: 205, column: 8, scope: !885)
!895 = !DILocation(line: 207, column: 34, scope: !885)
!896 = !DILocation(line: 207, column: 31, scope: !885)
!897 = !DILocation(line: 207, column: 46, scope: !885)
!898 = !DILocation(line: 207, column: 43, scope: !885)
!899 = !DILocation(line: 207, column: 3, scope: !885)
!900 = !DILocalVariable(name: "i", scope: !885, file: !589, line: 204, type: !42)
!901 = !DILocation(line: 208, column: 7, scope: !902)
!902 = distinct !DILexicalBlock(scope: !885, file: !589, line: 208, column: 3)
!903 = !DILocation(line: 208, scope: !902)
!904 = !DILocation(line: 208, column: 12, scope: !905)
!905 = distinct !DILexicalBlock(scope: !902, file: !589, line: 208, column: 3)
!906 = !DILocation(line: 208, column: 3, scope: !902)
!907 = !DILocation(line: 209, column: 37, scope: !908)
!908 = distinct !DILexicalBlock(scope: !905, file: !589, line: 208, column: 26)
!909 = !DILocation(line: 209, column: 34, scope: !908)
!910 = !DILocation(line: 209, column: 49, scope: !908)
!911 = !DILocation(line: 209, column: 46, scope: !908)
!912 = !DILocation(line: 209, column: 5, scope: !908)
!913 = !DILocation(line: 210, column: 5, scope: !908)
!914 = !DILocation(line: 211, column: 3, scope: !908)
!915 = !DILocation(line: 208, column: 22, scope: !905)
!916 = !DILocation(line: 208, column: 3, scope: !905)
!917 = distinct !{!917, !906, !918, !259}
!918 = !DILocation(line: 211, column: 3, scope: !902)
!919 = !DILocation(line: 213, column: 3, scope: !885)
!920 = !DILocation(line: 214, column: 1, scope: !885)
!921 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !589, file: !589, line: 225, type: !848, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!922 = !DILocalVariable(name: "r", arg: 1, scope: !921, file: !589, line: 225, type: !712)
!923 = !DILocation(line: 0, scope: !921)
!924 = !DILocalVariable(name: "i", scope: !921, file: !589, line: 227, type: !42)
!925 = !DILocation(line: 228, column: 7, scope: !926)
!926 = distinct !DILexicalBlock(scope: !921, file: !589, line: 228, column: 3)
!927 = !DILocation(line: 228, scope: !926)
!928 = !DILocation(line: 228, column: 12, scope: !929)
!929 = distinct !DILexicalBlock(scope: !926, file: !589, line: 228, column: 3)
!930 = !DILocation(line: 228, column: 3, scope: !926)
!931 = !DILocation(line: 229, column: 21, scope: !929)
!932 = !DILocation(line: 229, column: 18, scope: !929)
!933 = !DILocation(line: 229, column: 5, scope: !929)
!934 = !DILocation(line: 228, column: 22, scope: !929)
!935 = !DILocation(line: 228, column: 3, scope: !929)
!936 = distinct !{!936, !930, !937, !259}
!937 = !DILocation(line: 229, column: 27, scope: !926)
!938 = !DILocation(line: 230, column: 1, scope: !921)
!939 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !589, file: !589, line: 241, type: !940, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!940 = !DISubroutineType(types: !941)
!941 = !{null, !712, !592, !592}
!942 = !DILocalVariable(name: "r", arg: 1, scope: !939, file: !589, line: 241, type: !712)
!943 = !DILocation(line: 0, scope: !939)
!944 = !DILocalVariable(name: "a", arg: 2, scope: !939, file: !589, line: 241, type: !592)
!945 = !DILocalVariable(name: "b", arg: 3, scope: !939, file: !589, line: 241, type: !592)
!946 = !DILocalVariable(name: "i", scope: !939, file: !589, line: 243, type: !42)
!947 = !DILocation(line: 244, column: 7, scope: !948)
!948 = distinct !DILexicalBlock(scope: !939, file: !589, line: 244, column: 3)
!949 = !DILocation(line: 244, scope: !948)
!950 = !DILocation(line: 244, column: 12, scope: !951)
!951 = distinct !DILexicalBlock(scope: !948, file: !589, line: 244, column: 3)
!952 = !DILocation(line: 244, column: 3, scope: !948)
!953 = !DILocation(line: 245, column: 18, scope: !951)
!954 = !DILocation(line: 245, column: 15, scope: !951)
!955 = !DILocation(line: 245, column: 30, scope: !951)
!956 = !DILocation(line: 245, column: 27, scope: !951)
!957 = !DILocation(line: 245, column: 42, scope: !951)
!958 = !DILocation(line: 245, column: 39, scope: !951)
!959 = !DILocation(line: 245, column: 5, scope: !951)
!960 = !DILocation(line: 244, column: 22, scope: !951)
!961 = !DILocation(line: 244, column: 3, scope: !951)
!962 = distinct !{!962, !952, !963, !259}
!963 = !DILocation(line: 245, column: 48, scope: !948)
!964 = !DILocation(line: 246, column: 1, scope: !939)
!965 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !966, file: !966, line: 19, type: !967, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!966 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!967 = !DISubroutineType(types: !968)
!968 = !{null, !60, !969}
!969 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !970, size: 32)
!970 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !971)
!971 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !972)
!972 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !973)
!973 = !{!974}
!974 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !972, file: !185, line: 12, baseType: !189, size: 4096)
!975 = !DILocalVariable(name: "r", arg: 1, scope: !965, file: !966, line: 19, type: !60)
!976 = !DILocation(line: 0, scope: !965)
!977 = !DILocalVariable(name: "a", arg: 2, scope: !965, file: !966, line: 19, type: !969)
!978 = !DILocalVariable(name: "t", scope: !965, file: !966, line: 24, type: !979)
!979 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !980)
!980 = !{!981}
!981 = !DISubrange(count: 8)
!982 = !DILocation(line: 24, column: 11, scope: !965)
!983 = !DILocalVariable(name: "i", scope: !965, file: !966, line: 21, type: !42)
!984 = !DILocation(line: 28, column: 7, scope: !985)
!985 = distinct !DILexicalBlock(scope: !965, file: !966, line: 28, column: 3)
!986 = !DILocation(line: 28, scope: !985)
!987 = !DILocation(line: 28, column: 12, scope: !988)
!988 = distinct !DILexicalBlock(scope: !985, file: !966, line: 28, column: 3)
!989 = !DILocation(line: 28, column: 3, scope: !985)
!990 = !DILocalVariable(name: "j", scope: !965, file: !966, line: 21, type: !42)
!991 = !DILocation(line: 29, column: 9, scope: !992)
!992 = distinct !DILexicalBlock(scope: !993, file: !966, line: 29, column: 5)
!993 = distinct !DILexicalBlock(scope: !988, file: !966, line: 28, column: 28)
!994 = !DILocation(line: 29, scope: !992)
!995 = !DILocation(line: 29, column: 14, scope: !996)
!996 = distinct !DILexicalBlock(scope: !992, file: !966, line: 29, column: 5)
!997 = !DILocation(line: 29, column: 5, scope: !992)
!998 = !DILocation(line: 31, column: 15, scope: !999)
!999 = distinct !DILexicalBlock(scope: !996, file: !966, line: 29, column: 22)
!1000 = !DILocation(line: 31, column: 23, scope: !999)
!1001 = !DILocation(line: 31, column: 25, scope: !999)
!1002 = !DILocation(line: 31, column: 12, scope: !999)
!1003 = !DILocalVariable(name: "u", scope: !965, file: !966, line: 22, type: !14)
!1004 = !DILocation(line: 32, column: 13, scope: !999)
!1005 = !DILocation(line: 32, column: 15, scope: !999)
!1006 = !DILocation(line: 32, column: 22, scope: !999)
!1007 = !DILocation(line: 32, column: 9, scope: !999)
!1008 = !DILocation(line: 34, column: 12, scope: !999)
!1009 = !DILocation(line: 34, column: 14, scope: !999)
!1010 = !DILocalVariable(name: "d0", scope: !965, file: !966, line: 23, type: !40)
!1011 = !DILocation(line: 35, column: 10, scope: !999)
!1012 = !DILocation(line: 36, column: 10, scope: !999)
!1013 = !DILocation(line: 37, column: 10, scope: !999)
!1014 = !DILocation(line: 38, column: 17, scope: !999)
!1015 = !DILocation(line: 38, column: 14, scope: !999)
!1016 = !DILocation(line: 38, column: 7, scope: !999)
!1017 = !DILocation(line: 38, column: 12, scope: !999)
!1018 = !DILocation(line: 39, column: 5, scope: !999)
!1019 = !DILocation(line: 29, column: 18, scope: !996)
!1020 = !DILocation(line: 29, column: 5, scope: !996)
!1021 = distinct !{!1021, !997, !1022, !259}
!1022 = !DILocation(line: 39, column: 5, scope: !992)
!1023 = !DILocation(line: 41, column: 12, scope: !993)
!1024 = !DILocation(line: 41, column: 20, scope: !993)
!1025 = !DILocation(line: 41, column: 25, scope: !993)
!1026 = !DILocation(line: 41, column: 17, scope: !993)
!1027 = !DILocation(line: 41, column: 5, scope: !993)
!1028 = !DILocation(line: 41, column: 10, scope: !993)
!1029 = !DILocation(line: 42, column: 12, scope: !993)
!1030 = !DILocation(line: 42, column: 20, scope: !993)
!1031 = !DILocation(line: 42, column: 25, scope: !993)
!1032 = !DILocation(line: 42, column: 17, scope: !993)
!1033 = !DILocation(line: 42, column: 5, scope: !993)
!1034 = !DILocation(line: 42, column: 10, scope: !993)
!1035 = !DILocation(line: 43, column: 12, scope: !993)
!1036 = !DILocation(line: 43, column: 20, scope: !993)
!1037 = !DILocation(line: 43, column: 25, scope: !993)
!1038 = !DILocation(line: 43, column: 17, scope: !993)
!1039 = !DILocation(line: 43, column: 5, scope: !993)
!1040 = !DILocation(line: 43, column: 10, scope: !993)
!1041 = !DILocation(line: 44, column: 12, scope: !993)
!1042 = !DILocation(line: 44, column: 20, scope: !993)
!1043 = !DILocation(line: 44, column: 25, scope: !993)
!1044 = !DILocation(line: 44, column: 17, scope: !993)
!1045 = !DILocation(line: 44, column: 5, scope: !993)
!1046 = !DILocation(line: 44, column: 10, scope: !993)
!1047 = !DILocation(line: 45, column: 7, scope: !993)
!1048 = !DILocation(line: 46, column: 3, scope: !993)
!1049 = !DILocation(line: 28, column: 24, scope: !988)
!1050 = !DILocation(line: 28, column: 3, scope: !988)
!1051 = distinct !{!1051, !989, !1052, !259}
!1052 = !DILocation(line: 46, column: 3, scope: !985)
!1053 = !DILocation(line: 71, column: 1, scope: !965)
!1054 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !966, file: !966, line: 83, type: !1055, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{null, !1057, !64}
!1057 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !971, size: 32)
!1058 = !DILocalVariable(name: "r", arg: 1, scope: !1054, file: !966, line: 83, type: !1057)
!1059 = !DILocation(line: 0, scope: !1054)
!1060 = !DILocalVariable(name: "a", arg: 2, scope: !1054, file: !966, line: 83, type: !64)
!1061 = !DILocalVariable(name: "i", scope: !1054, file: !966, line: 85, type: !42)
!1062 = !DILocation(line: 88, column: 7, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1054, file: !966, line: 88, column: 3)
!1064 = !DILocation(line: 88, scope: !1063)
!1065 = !DILocation(line: 88, column: 12, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1063, file: !966, line: 88, column: 3)
!1067 = !DILocation(line: 88, column: 3, scope: !1063)
!1068 = !DILocation(line: 89, column: 37, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1066, file: !966, line: 88, column: 28)
!1070 = !DILocation(line: 89, column: 42, scope: !1069)
!1071 = !DILocation(line: 89, column: 26, scope: !1069)
!1072 = !DILocation(line: 89, column: 47, scope: !1069)
!1073 = !DILocation(line: 89, column: 57, scope: !1069)
!1074 = !DILocation(line: 89, column: 62, scope: !1069)
!1075 = !DILocation(line: 89, column: 24, scope: !1069)
!1076 = !DILocation(line: 89, column: 8, scope: !1069)
!1077 = !DILocation(line: 89, column: 16, scope: !1069)
!1078 = !DILocation(line: 89, column: 18, scope: !1069)
!1079 = !DILocation(line: 89, column: 5, scope: !1069)
!1080 = !DILocation(line: 89, column: 22, scope: !1069)
!1081 = !DILocation(line: 90, column: 37, scope: !1069)
!1082 = !DILocation(line: 90, column: 42, scope: !1069)
!1083 = !DILocation(line: 90, column: 26, scope: !1069)
!1084 = !DILocation(line: 90, column: 47, scope: !1069)
!1085 = !DILocation(line: 90, column: 57, scope: !1069)
!1086 = !DILocation(line: 90, column: 62, scope: !1069)
!1087 = !DILocation(line: 90, column: 24, scope: !1069)
!1088 = !DILocation(line: 90, column: 8, scope: !1069)
!1089 = !DILocation(line: 90, column: 16, scope: !1069)
!1090 = !DILocation(line: 90, column: 18, scope: !1069)
!1091 = !DILocation(line: 90, column: 5, scope: !1069)
!1092 = !DILocation(line: 90, column: 22, scope: !1069)
!1093 = !DILocation(line: 91, column: 7, scope: !1069)
!1094 = !DILocation(line: 92, column: 3, scope: !1069)
!1095 = !DILocation(line: 88, column: 24, scope: !1066)
!1096 = !DILocation(line: 88, column: 3, scope: !1066)
!1097 = distinct !{!1097, !1067, !1098, !259}
!1098 = !DILocation(line: 92, column: 3, scope: !1063)
!1099 = !DILocation(line: 113, column: 1, scope: !1054)
!1100 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !966, file: !966, line: 124, type: !967, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1101 = !DILocalVariable(name: "r", arg: 1, scope: !1100, file: !966, line: 124, type: !60)
!1102 = !DILocation(line: 0, scope: !1100)
!1103 = !DILocalVariable(name: "a", arg: 2, scope: !1100, file: !966, line: 124, type: !969)
!1104 = !DILocalVariable(name: "i", scope: !1100, file: !966, line: 126, type: !42)
!1105 = !DILocation(line: 129, column: 7, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1100, file: !966, line: 129, column: 3)
!1107 = !DILocation(line: 129, scope: !1106)
!1108 = !DILocation(line: 129, column: 12, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1106, file: !966, line: 129, column: 3)
!1110 = !DILocation(line: 129, column: 3, scope: !1106)
!1111 = !DILocation(line: 131, column: 14, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1109, file: !966, line: 129, column: 28)
!1113 = !DILocation(line: 131, column: 22, scope: !1112)
!1114 = !DILocation(line: 131, column: 11, scope: !1112)
!1115 = !DILocalVariable(name: "t0", scope: !1100, file: !966, line: 127, type: !35)
!1116 = !DILocation(line: 132, column: 12, scope: !1112)
!1117 = !DILocation(line: 132, column: 24, scope: !1112)
!1118 = !DILocation(line: 132, column: 31, scope: !1112)
!1119 = !DILocation(line: 132, column: 8, scope: !1112)
!1120 = !DILocation(line: 133, column: 13, scope: !1112)
!1121 = !DILocation(line: 133, column: 21, scope: !1112)
!1122 = !DILocation(line: 133, column: 23, scope: !1112)
!1123 = !DILocation(line: 133, column: 10, scope: !1112)
!1124 = !DILocalVariable(name: "t1", scope: !1100, file: !966, line: 127, type: !35)
!1125 = !DILocation(line: 134, column: 12, scope: !1112)
!1126 = !DILocation(line: 134, column: 24, scope: !1112)
!1127 = !DILocation(line: 134, column: 31, scope: !1112)
!1128 = !DILocation(line: 134, column: 8, scope: !1112)
!1129 = !DILocation(line: 135, column: 17, scope: !1112)
!1130 = !DILocation(line: 135, column: 20, scope: !1112)
!1131 = !DILocation(line: 135, column: 16, scope: !1112)
!1132 = !DILocation(line: 135, column: 8, scope: !1112)
!1133 = !DILocation(line: 135, column: 10, scope: !1112)
!1134 = !DILocation(line: 135, column: 5, scope: !1112)
!1135 = !DILocation(line: 135, column: 14, scope: !1112)
!1136 = !DILocation(line: 136, column: 17, scope: !1112)
!1137 = !DILocation(line: 136, column: 20, scope: !1112)
!1138 = !DILocation(line: 136, column: 29, scope: !1112)
!1139 = !DILocation(line: 136, column: 32, scope: !1112)
!1140 = !DILocation(line: 136, column: 26, scope: !1112)
!1141 = !DILocation(line: 136, column: 16, scope: !1112)
!1142 = !DILocation(line: 136, column: 8, scope: !1112)
!1143 = !DILocation(line: 136, column: 10, scope: !1112)
!1144 = !DILocation(line: 136, column: 5, scope: !1112)
!1145 = !DILocation(line: 136, column: 14, scope: !1112)
!1146 = !DILocation(line: 137, column: 17, scope: !1112)
!1147 = !DILocation(line: 137, column: 20, scope: !1112)
!1148 = !DILocation(line: 137, column: 16, scope: !1112)
!1149 = !DILocation(line: 137, column: 8, scope: !1112)
!1150 = !DILocation(line: 137, column: 10, scope: !1112)
!1151 = !DILocation(line: 137, column: 5, scope: !1112)
!1152 = !DILocation(line: 137, column: 14, scope: !1112)
!1153 = !DILocation(line: 138, column: 3, scope: !1112)
!1154 = !DILocation(line: 129, column: 24, scope: !1109)
!1155 = !DILocation(line: 129, column: 3, scope: !1109)
!1156 = distinct !{!1156, !1110, !1157, !259}
!1157 = !DILocation(line: 138, column: 3, scope: !1106)
!1158 = !DILocation(line: 139, column: 1, scope: !1100)
!1159 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !966, file: !966, line: 151, type: !1055, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1160 = !DILocalVariable(name: "r", arg: 1, scope: !1159, file: !966, line: 151, type: !1057)
!1161 = !DILocation(line: 0, scope: !1159)
!1162 = !DILocalVariable(name: "a", arg: 2, scope: !1159, file: !966, line: 151, type: !64)
!1163 = !DILocalVariable(name: "i", scope: !1159, file: !966, line: 153, type: !42)
!1164 = !DILocation(line: 154, column: 7, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1159, file: !966, line: 154, column: 3)
!1166 = !DILocation(line: 154, scope: !1165)
!1167 = !DILocation(line: 154, column: 12, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1165, file: !966, line: 154, column: 3)
!1169 = !DILocation(line: 154, column: 3, scope: !1165)
!1170 = !DILocation(line: 155, column: 29, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1168, file: !966, line: 154, column: 28)
!1172 = !DILocation(line: 155, column: 31, scope: !1171)
!1173 = !DILocation(line: 155, column: 26, scope: !1171)
!1174 = !DILocation(line: 155, column: 35, scope: !1171)
!1175 = !DILocation(line: 155, column: 57, scope: !1171)
!1176 = !DILocation(line: 155, column: 59, scope: !1171)
!1177 = !DILocation(line: 155, column: 54, scope: !1171)
!1178 = !DILocation(line: 155, column: 44, scope: !1171)
!1179 = !DILocation(line: 155, column: 63, scope: !1171)
!1180 = !DILocation(line: 155, column: 41, scope: !1171)
!1181 = !DILocation(line: 155, column: 70, scope: !1171)
!1182 = !DILocation(line: 155, column: 24, scope: !1171)
!1183 = !DILocation(line: 155, column: 8, scope: !1171)
!1184 = !DILocation(line: 155, column: 16, scope: !1171)
!1185 = !DILocation(line: 155, column: 5, scope: !1171)
!1186 = !DILocation(line: 155, column: 22, scope: !1171)
!1187 = !DILocation(line: 156, column: 29, scope: !1171)
!1188 = !DILocation(line: 156, column: 31, scope: !1171)
!1189 = !DILocation(line: 156, column: 26, scope: !1171)
!1190 = !DILocation(line: 156, column: 35, scope: !1171)
!1191 = !DILocation(line: 156, column: 57, scope: !1171)
!1192 = !DILocation(line: 156, column: 59, scope: !1171)
!1193 = !DILocation(line: 156, column: 54, scope: !1171)
!1194 = !DILocation(line: 156, column: 44, scope: !1171)
!1195 = !DILocation(line: 156, column: 63, scope: !1171)
!1196 = !DILocation(line: 156, column: 41, scope: !1171)
!1197 = !DILocation(line: 156, column: 70, scope: !1171)
!1198 = !DILocation(line: 156, column: 24, scope: !1171)
!1199 = !DILocation(line: 156, column: 8, scope: !1171)
!1200 = !DILocation(line: 156, column: 16, scope: !1171)
!1201 = !DILocation(line: 156, column: 18, scope: !1171)
!1202 = !DILocation(line: 156, column: 5, scope: !1171)
!1203 = !DILocation(line: 156, column: 22, scope: !1171)
!1204 = !DILocation(line: 157, column: 3, scope: !1171)
!1205 = !DILocation(line: 154, column: 24, scope: !1168)
!1206 = !DILocation(line: 154, column: 3, scope: !1168)
!1207 = distinct !{!1207, !1169, !1208, !259}
!1208 = !DILocation(line: 157, column: 3, scope: !1165)
!1209 = !DILocation(line: 158, column: 1, scope: !1159)
!1210 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !966, file: !966, line: 168, type: !1055, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1211 = !DILocalVariable(name: "r", arg: 1, scope: !1210, file: !966, line: 168, type: !1057)
!1212 = !DILocation(line: 0, scope: !1210)
!1213 = !DILocalVariable(name: "msg", arg: 2, scope: !1210, file: !966, line: 168, type: !64)
!1214 = !DILocalVariable(name: "i", scope: !1210, file: !966, line: 170, type: !42)
!1215 = !DILocation(line: 176, column: 7, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1210, file: !966, line: 176, column: 3)
!1217 = !DILocation(line: 176, scope: !1216)
!1218 = !DILocation(line: 176, column: 12, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1216, file: !966, line: 176, column: 3)
!1220 = !DILocation(line: 176, column: 3, scope: !1216)
!1221 = !DILocalVariable(name: "j", scope: !1210, file: !966, line: 170, type: !42)
!1222 = !DILocation(line: 177, column: 9, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1224, file: !966, line: 177, column: 5)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !966, line: 176, column: 28)
!1225 = !DILocation(line: 177, scope: !1223)
!1226 = !DILocation(line: 177, column: 14, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1223, file: !966, line: 177, column: 5)
!1228 = !DILocation(line: 177, column: 5, scope: !1223)
!1229 = !DILocation(line: 178, column: 10, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1227, file: !966, line: 177, column: 22)
!1231 = !DILocation(line: 178, column: 18, scope: !1230)
!1232 = !DILocation(line: 178, column: 20, scope: !1230)
!1233 = !DILocation(line: 178, column: 7, scope: !1230)
!1234 = !DILocation(line: 178, column: 24, scope: !1230)
!1235 = !DILocation(line: 179, column: 21, scope: !1230)
!1236 = !DILocation(line: 179, column: 18, scope: !1230)
!1237 = !DILocation(line: 179, column: 29, scope: !1230)
!1238 = !DILocation(line: 179, column: 27, scope: !1230)
!1239 = !DILocation(line: 179, column: 31, scope: !1230)
!1240 = !DILocation(line: 179, column: 53, scope: !1230)
!1241 = !DILocation(line: 179, column: 60, scope: !1230)
!1242 = !DILocation(line: 179, column: 65, scope: !1230)
!1243 = !DILocation(line: 179, column: 52, scope: !1230)
!1244 = !DILocation(line: 179, column: 7, scope: !1230)
!1245 = !DILocation(line: 180, column: 5, scope: !1230)
!1246 = !DILocation(line: 177, column: 18, scope: !1227)
!1247 = !DILocation(line: 177, column: 5, scope: !1227)
!1248 = distinct !{!1248, !1228, !1249, !259}
!1249 = !DILocation(line: 180, column: 5, scope: !1223)
!1250 = !DILocation(line: 181, column: 3, scope: !1224)
!1251 = !DILocation(line: 176, column: 24, scope: !1219)
!1252 = !DILocation(line: 176, column: 3, scope: !1219)
!1253 = distinct !{!1253, !1220, !1254, !259}
!1254 = !DILocation(line: 181, column: 3, scope: !1216)
!1255 = !DILocation(line: 182, column: 1, scope: !1210)
!1256 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !966, file: !966, line: 192, type: !967, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1257 = !DILocalVariable(name: "msg", arg: 1, scope: !1256, file: !966, line: 192, type: !60)
!1258 = !DILocation(line: 0, scope: !1256)
!1259 = !DILocalVariable(name: "a", arg: 2, scope: !1256, file: !966, line: 192, type: !969)
!1260 = !DILocalVariable(name: "i", scope: !1256, file: !966, line: 194, type: !42)
!1261 = !DILocation(line: 197, column: 7, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1256, file: !966, line: 197, column: 3)
!1263 = !DILocation(line: 197, scope: !1262)
!1264 = !DILocation(line: 197, column: 12, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1262, file: !966, line: 197, column: 3)
!1266 = !DILocation(line: 197, column: 3, scope: !1262)
!1267 = !DILocation(line: 198, column: 5, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1265, file: !966, line: 197, column: 28)
!1269 = !DILocation(line: 198, column: 12, scope: !1268)
!1270 = !DILocalVariable(name: "j", scope: !1256, file: !966, line: 194, type: !42)
!1271 = !DILocation(line: 199, column: 9, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1268, file: !966, line: 199, column: 5)
!1273 = !DILocation(line: 199, scope: !1272)
!1274 = !DILocation(line: 199, column: 14, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1272, file: !966, line: 199, column: 5)
!1276 = !DILocation(line: 199, column: 5, scope: !1272)
!1277 = !DILocation(line: 200, column: 15, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1275, file: !966, line: 199, column: 22)
!1279 = !DILocation(line: 200, column: 23, scope: !1278)
!1280 = !DILocation(line: 200, column: 25, scope: !1278)
!1281 = !DILocation(line: 200, column: 12, scope: !1278)
!1282 = !DILocalVariable(name: "t", scope: !1256, file: !966, line: 195, type: !40)
!1283 = !DILocation(line: 203, column: 9, scope: !1278)
!1284 = !DILocation(line: 204, column: 9, scope: !1278)
!1285 = !DILocation(line: 205, column: 9, scope: !1278)
!1286 = !DILocation(line: 206, column: 9, scope: !1278)
!1287 = !DILocation(line: 207, column: 9, scope: !1278)
!1288 = !DILocation(line: 208, column: 19, scope: !1278)
!1289 = !DILocation(line: 208, column: 7, scope: !1278)
!1290 = !DILocation(line: 208, column: 14, scope: !1278)
!1291 = !DILocation(line: 209, column: 5, scope: !1278)
!1292 = !DILocation(line: 199, column: 18, scope: !1275)
!1293 = !DILocation(line: 199, column: 5, scope: !1275)
!1294 = distinct !{!1294, !1276, !1295, !259}
!1295 = !DILocation(line: 209, column: 5, scope: !1272)
!1296 = !DILocation(line: 210, column: 3, scope: !1268)
!1297 = !DILocation(line: 197, column: 24, scope: !1265)
!1298 = !DILocation(line: 197, column: 3, scope: !1265)
!1299 = distinct !{!1299, !1266, !1300, !259}
!1300 = !DILocation(line: 210, column: 3, scope: !1262)
!1301 = !DILocation(line: 211, column: 1, scope: !1256)
!1302 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !966, file: !966, line: 225, type: !1303, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{null, !1057, !64, !61}
!1305 = !DILocalVariable(name: "r", arg: 1, scope: !1302, file: !966, line: 225, type: !1057)
!1306 = !DILocation(line: 0, scope: !1302)
!1307 = !DILocalVariable(name: "seed", arg: 2, scope: !1302, file: !966, line: 225, type: !64)
!1308 = !DILocalVariable(name: "nonce", arg: 3, scope: !1302, file: !966, line: 225, type: !61)
!1309 = !DILocalVariable(name: "buf", scope: !1302, file: !966, line: 227, type: !1310)
!1310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1311 = !DILocation(line: 227, column: 11, scope: !1302)
!1312 = !DILocation(line: 228, column: 3, scope: !1302)
!1313 = !DILocation(line: 229, column: 20, scope: !1302)
!1314 = !DILocation(line: 229, column: 3, scope: !1302)
!1315 = !DILocation(line: 230, column: 1, scope: !1302)
!1316 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !966, file: !966, line: 244, type: !1303, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1317 = !DILocalVariable(name: "r", arg: 1, scope: !1316, file: !966, line: 244, type: !1057)
!1318 = !DILocation(line: 0, scope: !1316)
!1319 = !DILocalVariable(name: "seed", arg: 2, scope: !1316, file: !966, line: 244, type: !64)
!1320 = !DILocalVariable(name: "nonce", arg: 3, scope: !1316, file: !966, line: 244, type: !61)
!1321 = !DILocalVariable(name: "buf", scope: !1316, file: !966, line: 246, type: !1310)
!1322 = !DILocation(line: 246, column: 11, scope: !1316)
!1323 = !DILocation(line: 247, column: 3, scope: !1316)
!1324 = !DILocation(line: 248, column: 20, scope: !1316)
!1325 = !DILocation(line: 248, column: 3, scope: !1316)
!1326 = !DILocation(line: 249, column: 1, scope: !1316)
!1327 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !966, file: !966, line: 261, type: !1328, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{null, !1057}
!1330 = !DILocalVariable(name: "r", arg: 1, scope: !1327, file: !966, line: 261, type: !1057)
!1331 = !DILocation(line: 0, scope: !1327)
!1332 = !DILocation(line: 263, column: 10, scope: !1327)
!1333 = !DILocation(line: 263, column: 7, scope: !1327)
!1334 = !DILocation(line: 263, column: 3, scope: !1327)
!1335 = !DILocation(line: 264, column: 3, scope: !1327)
!1336 = !DILocation(line: 265, column: 1, scope: !1327)
!1337 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !966, file: !966, line: 323, type: !1328, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1338 = !DILocalVariable(name: "r", arg: 1, scope: !1337, file: !966, line: 323, type: !1057)
!1339 = !DILocation(line: 0, scope: !1337)
!1340 = !DILocalVariable(name: "i", scope: !1337, file: !966, line: 325, type: !42)
!1341 = !DILocation(line: 326, column: 7, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !966, line: 326, column: 3)
!1343 = !DILocation(line: 326, scope: !1342)
!1344 = !DILocation(line: 326, column: 12, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1342, file: !966, line: 326, column: 3)
!1346 = !DILocation(line: 326, column: 3, scope: !1342)
!1347 = !DILocation(line: 327, column: 38, scope: !1345)
!1348 = !DILocation(line: 327, column: 35, scope: !1345)
!1349 = !DILocation(line: 327, column: 20, scope: !1345)
!1350 = !DILocation(line: 327, column: 8, scope: !1345)
!1351 = !DILocation(line: 327, column: 5, scope: !1345)
!1352 = !DILocation(line: 327, column: 18, scope: !1345)
!1353 = !DILocation(line: 326, column: 22, scope: !1345)
!1354 = !DILocation(line: 326, column: 3, scope: !1345)
!1355 = distinct !{!1355, !1346, !1356, !259}
!1356 = !DILocation(line: 327, column: 47, scope: !1342)
!1357 = !DILocation(line: 328, column: 1, scope: !1337)
!1358 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !966, file: !966, line: 276, type: !1328, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1359 = !DILocalVariable(name: "r", arg: 1, scope: !1358, file: !966, line: 276, type: !1057)
!1360 = !DILocation(line: 0, scope: !1358)
!1361 = !DILocation(line: 278, column: 13, scope: !1358)
!1362 = !DILocation(line: 278, column: 10, scope: !1358)
!1363 = !DILocation(line: 278, column: 3, scope: !1358)
!1364 = !DILocation(line: 279, column: 1, scope: !1358)
!1365 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !966, file: !966, line: 290, type: !1366, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1366 = !DISubroutineType(types: !1367)
!1367 = !{null, !1057, !969, !969}
!1368 = !DILocalVariable(name: "r", arg: 1, scope: !1365, file: !966, line: 290, type: !1057)
!1369 = !DILocation(line: 0, scope: !1365)
!1370 = !DILocalVariable(name: "a", arg: 2, scope: !1365, file: !966, line: 290, type: !969)
!1371 = !DILocalVariable(name: "b", arg: 3, scope: !1365, file: !966, line: 290, type: !969)
!1372 = !DILocalVariable(name: "i", scope: !1365, file: !966, line: 292, type: !42)
!1373 = !DILocation(line: 293, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1365, file: !966, line: 293, column: 3)
!1375 = !DILocation(line: 293, scope: !1374)
!1376 = !DILocation(line: 293, column: 12, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1374, file: !966, line: 293, column: 3)
!1378 = !DILocation(line: 293, column: 3, scope: !1374)
!1379 = !DILocation(line: 294, column: 17, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1377, file: !966, line: 293, column: 28)
!1381 = !DILocation(line: 294, column: 25, scope: !1380)
!1382 = !DILocation(line: 294, column: 14, scope: !1380)
!1383 = !DILocation(line: 294, column: 34, scope: !1380)
!1384 = !DILocation(line: 294, column: 42, scope: !1380)
!1385 = !DILocation(line: 294, column: 31, scope: !1380)
!1386 = !DILocation(line: 294, column: 51, scope: !1380)
!1387 = !DILocation(line: 294, column: 59, scope: !1380)
!1388 = !DILocation(line: 294, column: 48, scope: !1380)
!1389 = !DILocation(line: 294, column: 72, scope: !1380)
!1390 = !DILocation(line: 294, column: 64, scope: !1380)
!1391 = !DILocation(line: 294, column: 5, scope: !1380)
!1392 = !DILocation(line: 295, column: 17, scope: !1380)
!1393 = !DILocation(line: 295, column: 25, scope: !1380)
!1394 = !DILocation(line: 295, column: 27, scope: !1380)
!1395 = !DILocation(line: 295, column: 14, scope: !1380)
!1396 = !DILocation(line: 295, column: 36, scope: !1380)
!1397 = !DILocation(line: 295, column: 44, scope: !1380)
!1398 = !DILocation(line: 295, column: 46, scope: !1380)
!1399 = !DILocation(line: 295, column: 33, scope: !1380)
!1400 = !DILocation(line: 295, column: 55, scope: !1380)
!1401 = !DILocation(line: 295, column: 63, scope: !1380)
!1402 = !DILocation(line: 295, column: 65, scope: !1380)
!1403 = !DILocation(line: 295, column: 52, scope: !1380)
!1404 = !DILocation(line: 295, column: 79, scope: !1380)
!1405 = !DILocation(line: 295, column: 71, scope: !1380)
!1406 = !DILocation(line: 295, column: 70, scope: !1380)
!1407 = !DILocation(line: 295, column: 5, scope: !1380)
!1408 = !DILocation(line: 296, column: 3, scope: !1380)
!1409 = !DILocation(line: 293, column: 24, scope: !1377)
!1410 = !DILocation(line: 293, column: 3, scope: !1377)
!1411 = distinct !{!1411, !1378, !1412, !259}
!1412 = !DILocation(line: 296, column: 3, scope: !1374)
!1413 = !DILocation(line: 297, column: 1, scope: !1365)
!1414 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !966, file: !966, line: 307, type: !1328, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1415 = !DILocalVariable(name: "r", arg: 1, scope: !1414, file: !966, line: 307, type: !1057)
!1416 = !DILocation(line: 0, scope: !1414)
!1417 = !DILocalVariable(name: "f", scope: !1414, file: !966, line: 310, type: !13)
!1418 = !DILocalVariable(name: "i", scope: !1414, file: !966, line: 309, type: !42)
!1419 = !DILocation(line: 311, column: 7, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1414, file: !966, line: 311, column: 3)
!1421 = !DILocation(line: 311, scope: !1420)
!1422 = !DILocation(line: 311, column: 12, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1420, file: !966, line: 311, column: 3)
!1424 = !DILocation(line: 311, column: 3, scope: !1420)
!1425 = !DILocation(line: 312, column: 50, scope: !1423)
!1426 = !DILocation(line: 312, column: 47, scope: !1423)
!1427 = !DILocation(line: 312, column: 38, scope: !1423)
!1428 = !DILocation(line: 312, column: 59, scope: !1423)
!1429 = !DILocation(line: 312, column: 20, scope: !1423)
!1430 = !DILocation(line: 312, column: 8, scope: !1423)
!1431 = !DILocation(line: 312, column: 5, scope: !1423)
!1432 = !DILocation(line: 312, column: 18, scope: !1423)
!1433 = !DILocation(line: 311, column: 22, scope: !1423)
!1434 = !DILocation(line: 311, column: 3, scope: !1423)
!1435 = distinct !{!1435, !1424, !1436, !259}
!1436 = !DILocation(line: 312, column: 61, scope: !1420)
!1437 = !DILocation(line: 313, column: 1, scope: !1414)
!1438 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !966, file: !966, line: 339, type: !1366, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1439 = !DILocalVariable(name: "r", arg: 1, scope: !1438, file: !966, line: 339, type: !1057)
!1440 = !DILocation(line: 0, scope: !1438)
!1441 = !DILocalVariable(name: "a", arg: 2, scope: !1438, file: !966, line: 339, type: !969)
!1442 = !DILocalVariable(name: "b", arg: 3, scope: !1438, file: !966, line: 339, type: !969)
!1443 = !DILocalVariable(name: "i", scope: !1438, file: !966, line: 341, type: !42)
!1444 = !DILocation(line: 342, column: 7, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1438, file: !966, line: 342, column: 3)
!1446 = !DILocation(line: 342, scope: !1445)
!1447 = !DILocation(line: 342, column: 12, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1445, file: !966, line: 342, column: 3)
!1449 = !DILocation(line: 342, column: 3, scope: !1445)
!1450 = !DILocation(line: 343, column: 23, scope: !1448)
!1451 = !DILocation(line: 343, column: 20, scope: !1448)
!1452 = !DILocation(line: 343, column: 38, scope: !1448)
!1453 = !DILocation(line: 343, column: 35, scope: !1448)
!1454 = !DILocation(line: 343, column: 33, scope: !1448)
!1455 = !DILocation(line: 343, column: 8, scope: !1448)
!1456 = !DILocation(line: 343, column: 5, scope: !1448)
!1457 = !DILocation(line: 343, column: 18, scope: !1448)
!1458 = !DILocation(line: 342, column: 22, scope: !1448)
!1459 = !DILocation(line: 342, column: 3, scope: !1448)
!1460 = distinct !{!1460, !1449, !1461, !259}
!1461 = !DILocation(line: 343, column: 46, scope: !1445)
!1462 = !DILocation(line: 344, column: 1, scope: !1438)
!1463 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !966, file: !966, line: 355, type: !1366, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1464 = !DILocalVariable(name: "r", arg: 1, scope: !1463, file: !966, line: 355, type: !1057)
!1465 = !DILocation(line: 0, scope: !1463)
!1466 = !DILocalVariable(name: "a", arg: 2, scope: !1463, file: !966, line: 355, type: !969)
!1467 = !DILocalVariable(name: "b", arg: 3, scope: !1463, file: !966, line: 355, type: !969)
!1468 = !DILocalVariable(name: "i", scope: !1463, file: !966, line: 357, type: !42)
!1469 = !DILocation(line: 358, column: 7, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1463, file: !966, line: 358, column: 3)
!1471 = !DILocation(line: 358, scope: !1470)
!1472 = !DILocation(line: 358, column: 12, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1470, file: !966, line: 358, column: 3)
!1474 = !DILocation(line: 358, column: 3, scope: !1470)
!1475 = !DILocation(line: 359, column: 23, scope: !1473)
!1476 = !DILocation(line: 359, column: 20, scope: !1473)
!1477 = !DILocation(line: 359, column: 38, scope: !1473)
!1478 = !DILocation(line: 359, column: 35, scope: !1473)
!1479 = !DILocation(line: 359, column: 33, scope: !1473)
!1480 = !DILocation(line: 359, column: 8, scope: !1473)
!1481 = !DILocation(line: 359, column: 5, scope: !1473)
!1482 = !DILocation(line: 359, column: 18, scope: !1473)
!1483 = !DILocation(line: 358, column: 22, scope: !1473)
!1484 = !DILocation(line: 358, column: 3, scope: !1473)
!1485 = distinct !{!1485, !1474, !1486, !259}
!1486 = !DILocation(line: 359, column: 46, scope: !1470)
!1487 = !DILocation(line: 360, column: 1, scope: !1463)
!1488 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !11, file: !11, line: 80, type: !1489, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1489 = !DISubroutineType(types: !1490)
!1490 = !{null, !274}
!1491 = !DILocalVariable(name: "r", arg: 1, scope: !1488, file: !11, line: 80, type: !274)
!1492 = !DILocation(line: 0, scope: !1488)
!1493 = !DILocalVariable(name: "k", scope: !1488, file: !11, line: 81, type: !42)
!1494 = !DILocalVariable(name: "len", scope: !1488, file: !11, line: 81, type: !42)
!1495 = !DILocation(line: 85, column: 7, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1488, file: !11, line: 85, column: 3)
!1497 = !DILocation(line: 85, scope: !1496)
!1498 = !DILocation(line: 84, column: 5, scope: !1488)
!1499 = !DILocation(line: 85, column: 22, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1496, file: !11, line: 85, column: 3)
!1501 = !DILocation(line: 85, column: 3, scope: !1496)
!1502 = !DILocalVariable(name: "start", scope: !1488, file: !11, line: 81, type: !42)
!1503 = !DILocation(line: 86, column: 9, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1505, file: !11, line: 86, column: 5)
!1505 = distinct !DILexicalBlock(scope: !1500, file: !11, line: 85, column: 39)
!1506 = !DILocation(line: 86, scope: !1504)
!1507 = !DILocation(line: 86, column: 26, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1504, file: !11, line: 86, column: 5)
!1509 = !DILocation(line: 86, column: 5, scope: !1504)
!1510 = !DILocation(line: 87, column: 21, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1508, file: !11, line: 86, column: 50)
!1512 = !DILocation(line: 87, column: 14, scope: !1511)
!1513 = !DILocalVariable(name: "zeta", scope: !1488, file: !11, line: 82, type: !14)
!1514 = !DILocalVariable(name: "j", scope: !1488, file: !11, line: 81, type: !42)
!1515 = !DILocation(line: 88, column: 11, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1511, file: !11, line: 88, column: 7)
!1517 = !DILocation(line: 88, scope: !1516)
!1518 = !DILocation(line: 88, column: 32, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1516, file: !11, line: 88, column: 7)
!1520 = !DILocation(line: 88, column: 24, scope: !1519)
!1521 = !DILocation(line: 88, column: 7, scope: !1516)
!1522 = !DILocation(line: 89, column: 29, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !11, line: 88, column: 44)
!1524 = !DILocation(line: 89, column: 25, scope: !1523)
!1525 = !DILocation(line: 89, column: 13, scope: !1523)
!1526 = !DILocalVariable(name: "t", scope: !1488, file: !11, line: 82, type: !14)
!1527 = !DILocation(line: 90, column: 22, scope: !1523)
!1528 = !DILocation(line: 90, column: 29, scope: !1523)
!1529 = !DILocation(line: 90, column: 27, scope: !1523)
!1530 = !DILocation(line: 90, column: 13, scope: !1523)
!1531 = !DILocation(line: 90, column: 9, scope: !1523)
!1532 = !DILocation(line: 90, column: 20, scope: !1523)
!1533 = !DILocation(line: 91, column: 16, scope: !1523)
!1534 = !DILocation(line: 91, column: 23, scope: !1523)
!1535 = !DILocation(line: 91, column: 21, scope: !1523)
!1536 = !DILocation(line: 91, column: 9, scope: !1523)
!1537 = !DILocation(line: 91, column: 14, scope: !1523)
!1538 = !DILocation(line: 92, column: 7, scope: !1523)
!1539 = !DILocation(line: 88, column: 40, scope: !1519)
!1540 = !DILocation(line: 88, column: 7, scope: !1519)
!1541 = distinct !{!1541, !1521, !1542, !259}
!1542 = !DILocation(line: 92, column: 7, scope: !1516)
!1543 = !DILocation(line: 93, column: 5, scope: !1511)
!1544 = !DILocation(line: 86, column: 43, scope: !1508)
!1545 = !DILocation(line: 86, column: 5, scope: !1508)
!1546 = distinct !{!1546, !1509, !1547, !259}
!1547 = !DILocation(line: 93, column: 5, scope: !1504)
!1548 = !DILocation(line: 94, column: 3, scope: !1505)
!1549 = !DILocation(line: 85, column: 32, scope: !1500)
!1550 = !DILocation(line: 85, column: 3, scope: !1500)
!1551 = distinct !{!1551, !1501, !1552, !259}
!1552 = !DILocation(line: 94, column: 3, scope: !1496)
!1553 = !DILocation(line: 95, column: 1, scope: !1488)
!1554 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1555, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!14, !14, !14}
!1557 = !DILocalVariable(name: "a", arg: 1, scope: !1554, file: !11, line: 68, type: !14)
!1558 = !DILocation(line: 0, scope: !1554)
!1559 = !DILocalVariable(name: "b", arg: 2, scope: !1554, file: !11, line: 68, type: !14)
!1560 = !DILocation(line: 69, column: 28, scope: !1554)
!1561 = !DILocation(line: 69, column: 39, scope: !1554)
!1562 = !DILocation(line: 69, column: 38, scope: !1554)
!1563 = !DILocation(line: 69, column: 10, scope: !1554)
!1564 = !DILocation(line: 69, column: 3, scope: !1554)
!1565 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !11, file: !11, line: 106, type: !1489, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1566 = !DILocalVariable(name: "r", arg: 1, scope: !1565, file: !11, line: 106, type: !274)
!1567 = !DILocation(line: 0, scope: !1565)
!1568 = !DILocalVariable(name: "f", scope: !1565, file: !11, line: 109, type: !13)
!1569 = !DILocalVariable(name: "k", scope: !1565, file: !11, line: 107, type: !42)
!1570 = !DILocalVariable(name: "len", scope: !1565, file: !11, line: 107, type: !42)
!1571 = !DILocation(line: 112, column: 7, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1565, file: !11, line: 112, column: 3)
!1573 = !DILocation(line: 112, scope: !1572)
!1574 = !DILocation(line: 111, column: 5, scope: !1565)
!1575 = !DILocation(line: 112, column: 20, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1572, file: !11, line: 112, column: 3)
!1577 = !DILocation(line: 112, column: 3, scope: !1572)
!1578 = !DILocalVariable(name: "start", scope: !1565, file: !11, line: 107, type: !42)
!1579 = !DILocation(line: 113, column: 9, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1581, file: !11, line: 113, column: 5)
!1581 = distinct !DILexicalBlock(scope: !1576, file: !11, line: 112, column: 39)
!1582 = !DILocation(line: 113, scope: !1580)
!1583 = !DILocation(line: 113, column: 26, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1580, file: !11, line: 113, column: 5)
!1585 = !DILocation(line: 113, column: 5, scope: !1580)
!1586 = !DILocation(line: 114, column: 21, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1584, file: !11, line: 113, column: 50)
!1588 = !DILocation(line: 114, column: 14, scope: !1587)
!1589 = !DILocalVariable(name: "zeta", scope: !1565, file: !11, line: 108, type: !14)
!1590 = !DILocalVariable(name: "j", scope: !1565, file: !11, line: 107, type: !42)
!1591 = !DILocation(line: 115, column: 11, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1587, file: !11, line: 115, column: 7)
!1593 = !DILocation(line: 115, scope: !1592)
!1594 = !DILocation(line: 115, column: 32, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1592, file: !11, line: 115, column: 7)
!1596 = !DILocation(line: 115, column: 24, scope: !1595)
!1597 = !DILocation(line: 115, column: 7, scope: !1592)
!1598 = !DILocation(line: 116, column: 13, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1595, file: !11, line: 115, column: 44)
!1600 = !DILocalVariable(name: "t", scope: !1565, file: !11, line: 108, type: !14)
!1601 = !DILocation(line: 117, column: 31, scope: !1599)
!1602 = !DILocation(line: 117, column: 39, scope: !1599)
!1603 = !DILocation(line: 117, column: 35, scope: !1599)
!1604 = !DILocation(line: 117, column: 33, scope: !1599)
!1605 = !DILocation(line: 117, column: 16, scope: !1599)
!1606 = !DILocation(line: 117, column: 9, scope: !1599)
!1607 = !DILocation(line: 117, column: 14, scope: !1599)
!1608 = !DILocation(line: 118, column: 26, scope: !1599)
!1609 = !DILocation(line: 118, column: 22, scope: !1599)
!1610 = !DILocation(line: 118, column: 35, scope: !1599)
!1611 = !DILocation(line: 118, column: 33, scope: !1599)
!1612 = !DILocation(line: 118, column: 13, scope: !1599)
!1613 = !DILocation(line: 118, column: 9, scope: !1599)
!1614 = !DILocation(line: 118, column: 20, scope: !1599)
!1615 = !DILocation(line: 119, column: 38, scope: !1599)
!1616 = !DILocation(line: 119, column: 34, scope: !1599)
!1617 = !DILocation(line: 119, column: 22, scope: !1599)
!1618 = !DILocation(line: 119, column: 13, scope: !1599)
!1619 = !DILocation(line: 119, column: 9, scope: !1599)
!1620 = !DILocation(line: 119, column: 20, scope: !1599)
!1621 = !DILocation(line: 120, column: 7, scope: !1599)
!1622 = !DILocation(line: 115, column: 40, scope: !1595)
!1623 = !DILocation(line: 115, column: 7, scope: !1595)
!1624 = distinct !{!1624, !1597, !1625, !259}
!1625 = !DILocation(line: 120, column: 7, scope: !1592)
!1626 = !DILocation(line: 121, column: 5, scope: !1587)
!1627 = !DILocation(line: 113, column: 43, scope: !1584)
!1628 = !DILocation(line: 113, column: 5, scope: !1584)
!1629 = distinct !{!1629, !1585, !1630, !259}
!1630 = !DILocation(line: 121, column: 5, scope: !1580)
!1631 = !DILocation(line: 122, column: 3, scope: !1581)
!1632 = !DILocation(line: 112, column: 32, scope: !1576)
!1633 = !DILocation(line: 112, column: 3, scope: !1576)
!1634 = distinct !{!1634, !1577, !1635, !259}
!1635 = !DILocation(line: 122, column: 3, scope: !1572)
!1636 = !DILocation(line: 124, column: 7, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1565, file: !11, line: 124, column: 3)
!1638 = !DILocation(line: 124, scope: !1637)
!1639 = !DILocation(line: 124, column: 16, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1637, file: !11, line: 124, column: 3)
!1641 = !DILocation(line: 124, column: 3, scope: !1637)
!1642 = !DILocation(line: 125, column: 18, scope: !1640)
!1643 = !DILocation(line: 125, column: 12, scope: !1640)
!1644 = !DILocation(line: 125, column: 5, scope: !1640)
!1645 = !DILocation(line: 125, column: 10, scope: !1640)
!1646 = !DILocation(line: 124, column: 24, scope: !1640)
!1647 = !DILocation(line: 124, column: 3, scope: !1640)
!1648 = distinct !{!1648, !1641, !1649, !259}
!1649 = !DILocation(line: 125, column: 25, scope: !1637)
!1650 = !DILocation(line: 126, column: 1, scope: !1565)
!1651 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !11, file: !11, line: 139, type: !1652, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1652 = !DISubroutineType(types: !1653)
!1653 = !{null, !274, !1654, !1654, !14}
!1654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1655 = !DILocalVariable(name: "r", arg: 1, scope: !1651, file: !11, line: 139, type: !274)
!1656 = !DILocation(line: 0, scope: !1651)
!1657 = !DILocalVariable(name: "a", arg: 2, scope: !1651, file: !11, line: 139, type: !1654)
!1658 = !DILocalVariable(name: "b", arg: 3, scope: !1651, file: !11, line: 139, type: !1654)
!1659 = !DILocalVariable(name: "zeta", arg: 4, scope: !1651, file: !11, line: 139, type: !14)
!1660 = !DILocation(line: 141, column: 17, scope: !1651)
!1661 = !DILocation(line: 141, column: 23, scope: !1651)
!1662 = !DILocation(line: 141, column: 11, scope: !1651)
!1663 = !DILocation(line: 141, column: 3, scope: !1651)
!1664 = !DILocation(line: 141, column: 9, scope: !1651)
!1665 = !DILocation(line: 142, column: 17, scope: !1651)
!1666 = !DILocation(line: 142, column: 11, scope: !1651)
!1667 = !DILocation(line: 142, column: 3, scope: !1651)
!1668 = !DILocation(line: 142, column: 9, scope: !1651)
!1669 = !DILocation(line: 143, column: 17, scope: !1651)
!1670 = !DILocation(line: 143, column: 23, scope: !1651)
!1671 = !DILocation(line: 143, column: 11, scope: !1651)
!1672 = !DILocation(line: 143, column: 3, scope: !1651)
!1673 = !DILocation(line: 143, column: 8, scope: !1651)
!1674 = !DILocation(line: 144, column: 17, scope: !1651)
!1675 = !DILocation(line: 144, column: 23, scope: !1651)
!1676 = !DILocation(line: 144, column: 11, scope: !1651)
!1677 = !DILocation(line: 144, column: 3, scope: !1651)
!1678 = !DILocation(line: 144, column: 9, scope: !1651)
!1679 = !DILocation(line: 145, column: 17, scope: !1651)
!1680 = !DILocation(line: 145, column: 23, scope: !1651)
!1681 = !DILocation(line: 145, column: 11, scope: !1651)
!1682 = !DILocation(line: 145, column: 3, scope: !1651)
!1683 = !DILocation(line: 145, column: 8, scope: !1651)
!1684 = !DILocation(line: 146, column: 1, scope: !1651)
!1685 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1686, file: !1686, line: 110, type: !1687, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1686 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1687 = !DISubroutineType(types: !1688)
!1688 = !{null, !1689, !64}
!1689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1690, size: 32)
!1690 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !1691)
!1691 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !1692)
!1692 = !{!1693}
!1693 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1691, file: !185, line: 12, baseType: !189, size: 4096)
!1694 = !DILocalVariable(name: "r", arg: 1, scope: !1685, file: !1686, line: 110, type: !1689)
!1695 = !DILocation(line: 0, scope: !1685)
!1696 = !DILocalVariable(name: "buf", arg: 2, scope: !1685, file: !1686, line: 110, type: !64)
!1697 = !DILocation(line: 113, column: 3, scope: !1685)
!1698 = !DILocation(line: 119, column: 1, scope: !1685)
!1699 = distinct !DISubprogram(name: "cbd2", scope: !1686, file: !1686, line: 58, type: !1687, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1700 = !DILocalVariable(name: "r", arg: 1, scope: !1699, file: !1686, line: 58, type: !1689)
!1701 = !DILocation(line: 0, scope: !1699)
!1702 = !DILocalVariable(name: "buf", arg: 2, scope: !1699, file: !1686, line: 58, type: !64)
!1703 = !DILocalVariable(name: "i", scope: !1699, file: !1686, line: 60, type: !42)
!1704 = !DILocation(line: 64, column: 7, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1699, file: !1686, line: 64, column: 3)
!1706 = !DILocation(line: 64, scope: !1705)
!1707 = !DILocation(line: 64, column: 12, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1705, file: !1686, line: 64, column: 3)
!1709 = !DILocation(line: 64, column: 3, scope: !1705)
!1710 = !DILocation(line: 65, column: 35, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !1686, line: 64, column: 28)
!1712 = !DILocation(line: 65, column: 33, scope: !1711)
!1713 = !DILocation(line: 65, column: 10, scope: !1711)
!1714 = !DILocalVariable(name: "t", scope: !1699, file: !1686, line: 61, type: !40)
!1715 = !DILocation(line: 66, column: 12, scope: !1711)
!1716 = !DILocalVariable(name: "d", scope: !1699, file: !1686, line: 61, type: !40)
!1717 = !DILocation(line: 67, column: 12, scope: !1711)
!1718 = !DILocation(line: 67, column: 17, scope: !1711)
!1719 = !DILocation(line: 67, column: 7, scope: !1711)
!1720 = !DILocalVariable(name: "j", scope: !1699, file: !1686, line: 60, type: !42)
!1721 = !DILocation(line: 69, column: 9, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1711, file: !1686, line: 69, column: 5)
!1723 = !DILocation(line: 69, scope: !1722)
!1724 = !DILocation(line: 69, column: 14, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1722, file: !1686, line: 69, column: 5)
!1726 = !DILocation(line: 69, column: 5, scope: !1722)
!1727 = !DILocation(line: 70, column: 19, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1725, file: !1686, line: 69, column: 22)
!1729 = !DILocation(line: 70, column: 21, scope: !1728)
!1730 = !DILocation(line: 70, column: 14, scope: !1728)
!1731 = !DILocation(line: 70, column: 26, scope: !1728)
!1732 = !DILocation(line: 70, column: 11, scope: !1728)
!1733 = !DILocalVariable(name: "a", scope: !1699, file: !1686, line: 62, type: !14)
!1734 = !DILocation(line: 71, column: 19, scope: !1728)
!1735 = !DILocation(line: 71, column: 21, scope: !1728)
!1736 = !DILocation(line: 71, column: 14, scope: !1728)
!1737 = !DILocation(line: 71, column: 26, scope: !1728)
!1738 = !DILocation(line: 71, column: 11, scope: !1728)
!1739 = !DILocalVariable(name: "b", scope: !1699, file: !1686, line: 62, type: !14)
!1740 = !DILocation(line: 72, column: 26, scope: !1728)
!1741 = !DILocation(line: 72, column: 30, scope: !1728)
!1742 = !DILocation(line: 72, column: 28, scope: !1728)
!1743 = !DILocation(line: 72, column: 10, scope: !1728)
!1744 = !DILocation(line: 72, column: 18, scope: !1728)
!1745 = !DILocation(line: 72, column: 20, scope: !1728)
!1746 = !DILocation(line: 72, column: 7, scope: !1728)
!1747 = !DILocation(line: 72, column: 24, scope: !1728)
!1748 = !DILocation(line: 73, column: 5, scope: !1728)
!1749 = !DILocation(line: 69, column: 18, scope: !1725)
!1750 = !DILocation(line: 69, column: 5, scope: !1725)
!1751 = distinct !{!1751, !1726, !1752, !259}
!1752 = !DILocation(line: 73, column: 5, scope: !1722)
!1753 = !DILocation(line: 74, column: 3, scope: !1711)
!1754 = !DILocation(line: 64, column: 24, scope: !1708)
!1755 = !DILocation(line: 64, column: 3, scope: !1708)
!1756 = distinct !{!1756, !1709, !1757, !259}
!1757 = !DILocation(line: 74, column: 3, scope: !1705)
!1758 = !DILocation(line: 75, column: 1, scope: !1699)
!1759 = distinct !DISubprogram(name: "load32_littleendian", scope: !1686, file: !1686, line: 15, type: !1760, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1760 = !DISubroutineType(types: !1761)
!1761 = !{!40, !64}
!1762 = !DILocalVariable(name: "x", arg: 1, scope: !1759, file: !1686, line: 15, type: !64)
!1763 = !DILocation(line: 0, scope: !1759)
!1764 = !DILocation(line: 18, column: 18, scope: !1759)
!1765 = !DILocation(line: 18, column: 8, scope: !1759)
!1766 = !DILocalVariable(name: "r", scope: !1759, file: !1686, line: 17, type: !40)
!1767 = !DILocation(line: 19, column: 18, scope: !1759)
!1768 = !DILocation(line: 19, column: 8, scope: !1759)
!1769 = !DILocation(line: 19, column: 23, scope: !1759)
!1770 = !DILocation(line: 19, column: 5, scope: !1759)
!1771 = !DILocation(line: 20, column: 18, scope: !1759)
!1772 = !DILocation(line: 20, column: 8, scope: !1759)
!1773 = !DILocation(line: 20, column: 23, scope: !1759)
!1774 = !DILocation(line: 20, column: 5, scope: !1759)
!1775 = !DILocation(line: 21, column: 18, scope: !1759)
!1776 = !DILocation(line: 21, column: 8, scope: !1759)
!1777 = !DILocation(line: 21, column: 23, scope: !1759)
!1778 = !DILocation(line: 21, column: 5, scope: !1759)
!1779 = !DILocation(line: 22, column: 3, scope: !1759)
!1780 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1686, file: !1686, line: 121, type: !1687, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1781 = !DILocalVariable(name: "r", arg: 1, scope: !1780, file: !1686, line: 121, type: !1689)
!1782 = !DILocation(line: 0, scope: !1780)
!1783 = !DILocalVariable(name: "buf", arg: 2, scope: !1780, file: !1686, line: 121, type: !64)
!1784 = !DILocation(line: 124, column: 3, scope: !1780)
!1785 = !DILocation(line: 128, column: 1, scope: !1780)
!1786 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1787, file: !1787, line: 16, type: !1788, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1787 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1788 = !DISubroutineType(types: !48)
!1789 = !DILocalVariable(name: "a", arg: 1, scope: !1786, file: !1787, line: 16, type: !5)
!1790 = !DILocation(line: 0, scope: !1786)
!1791 = !DILocation(line: 20, column: 7, scope: !1786)
!1792 = !DILocation(line: 20, column: 17, scope: !1786)
!1793 = !DILocalVariable(name: "t", scope: !1786, file: !1787, line: 18, type: !14)
!1794 = !DILocation(line: 21, column: 12, scope: !1786)
!1795 = !DILocation(line: 21, column: 22, scope: !1786)
!1796 = !DILocation(line: 21, column: 10, scope: !1786)
!1797 = !DILocation(line: 21, column: 32, scope: !1786)
!1798 = !DILocation(line: 21, column: 7, scope: !1786)
!1799 = !DILocation(line: 22, column: 3, scope: !1786)
!1800 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1787, file: !1787, line: 35, type: !1801, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1801 = !DISubroutineType(types: !1802)
!1802 = !{!14, !14}
!1803 = !DILocalVariable(name: "a", arg: 1, scope: !1800, file: !1787, line: 35, type: !14)
!1804 = !DILocation(line: 0, scope: !1800)
!1805 = !DILocalVariable(name: "v", scope: !1800, file: !1787, line: 37, type: !13)
!1806 = !DILocation(line: 39, column: 20, scope: !1800)
!1807 = !DILocation(line: 39, column: 19, scope: !1800)
!1808 = !DILocation(line: 39, column: 22, scope: !1800)
!1809 = !DILocation(line: 39, column: 33, scope: !1800)
!1810 = !DILocation(line: 39, column: 8, scope: !1800)
!1811 = !DILocalVariable(name: "t", scope: !1800, file: !1787, line: 36, type: !14)
!1812 = !DILocation(line: 40, column: 5, scope: !1800)
!1813 = !DILocation(line: 41, column: 10, scope: !1800)
!1814 = !DILocation(line: 41, column: 14, scope: !1800)
!1815 = !DILocation(line: 41, column: 12, scope: !1800)
!1816 = !DILocation(line: 41, column: 3, scope: !1800)
!1817 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1818, file: !1818, line: 16, type: !1819, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1818 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1819 = !DISubroutineType(types: !1820)
!1820 = !{!9, !64, !64, !1821}
!1821 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1822, line: 214, baseType: !42)
!1822 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1823 = !DILocalVariable(name: "a", arg: 1, scope: !1817, file: !1818, line: 16, type: !64)
!1824 = !DILocation(line: 0, scope: !1817)
!1825 = !DILocalVariable(name: "b", arg: 2, scope: !1817, file: !1818, line: 16, type: !64)
!1826 = !DILocalVariable(name: "len", arg: 3, scope: !1817, file: !1818, line: 16, type: !1821)
!1827 = !DILocalVariable(name: "r", scope: !1817, file: !1818, line: 19, type: !61)
!1828 = !DILocalVariable(name: "i", scope: !1817, file: !1818, line: 18, type: !1821)
!1829 = !DILocation(line: 21, column: 7, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1817, file: !1818, line: 21, column: 3)
!1831 = !DILocation(line: 21, scope: !1830)
!1832 = !DILocation(line: 21, column: 12, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1830, file: !1818, line: 21, column: 3)
!1834 = !DILocation(line: 21, column: 3, scope: !1830)
!1835 = !DILocation(line: 22, column: 10, scope: !1833)
!1836 = !DILocation(line: 22, column: 17, scope: !1833)
!1837 = !DILocation(line: 22, column: 15, scope: !1833)
!1838 = !DILocation(line: 22, column: 7, scope: !1833)
!1839 = !DILocation(line: 22, column: 5, scope: !1833)
!1840 = !DILocation(line: 21, column: 18, scope: !1833)
!1841 = !DILocation(line: 21, column: 3, scope: !1833)
!1842 = distinct !{!1842, !1834, !1843, !259}
!1843 = !DILocation(line: 22, column: 20, scope: !1830)
!1844 = !DILocation(line: 24, column: 12, scope: !1817)
!1845 = !DILocation(line: 24, column: 11, scope: !1817)
!1846 = !DILocation(line: 24, column: 25, scope: !1817)
!1847 = !DILocation(line: 24, column: 10, scope: !1817)
!1848 = !DILocation(line: 24, column: 3, scope: !1817)
!1849 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1818, file: !1818, line: 40, type: !1850, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1850 = !DISubroutineType(types: !1851)
!1851 = !{null, !60, !64, !1821, !61}
!1852 = !DILocalVariable(name: "r", arg: 1, scope: !1849, file: !1818, line: 40, type: !60)
!1853 = !DILocation(line: 0, scope: !1849)
!1854 = !DILocalVariable(name: "x", arg: 2, scope: !1849, file: !1818, line: 40, type: !64)
!1855 = !DILocalVariable(name: "len", arg: 3, scope: !1849, file: !1818, line: 40, type: !1821)
!1856 = !DILocalVariable(name: "b", arg: 4, scope: !1849, file: !1818, line: 40, type: !61)
!1857 = !DILocation(line: 51, column: 3, scope: !1849)
!1858 = !{i64 1722}
!1859 = !DILocation(line: 54, column: 8, scope: !1849)
!1860 = !DILocation(line: 54, column: 7, scope: !1849)
!1861 = !DILocalVariable(name: "i", scope: !1849, file: !1818, line: 42, type: !1821)
!1862 = !DILocation(line: 55, column: 7, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1849, file: !1818, line: 55, column: 3)
!1864 = !DILocation(line: 55, scope: !1863)
!1865 = !DILocation(line: 55, column: 12, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1863, file: !1818, line: 55, column: 3)
!1867 = !DILocation(line: 55, column: 3, scope: !1863)
!1868 = !DILocation(line: 56, column: 13, scope: !1866)
!1869 = !DILocation(line: 56, column: 18, scope: !1866)
!1870 = !DILocation(line: 56, column: 25, scope: !1866)
!1871 = !DILocation(line: 56, column: 23, scope: !1866)
!1872 = !DILocation(line: 56, column: 15, scope: !1866)
!1873 = !DILocation(line: 56, column: 5, scope: !1866)
!1874 = !DILocation(line: 56, column: 10, scope: !1866)
!1875 = !DILocation(line: 55, column: 18, scope: !1866)
!1876 = !DILocation(line: 55, column: 3, scope: !1866)
!1877 = distinct !{!1877, !1867, !1878, !259}
!1878 = !DILocation(line: 56, column: 29, scope: !1863)
!1879 = !DILocation(line: 57, column: 1, scope: !1849)
!1880 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1818, file: !1818, line: 71, type: !1881, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1881 = !DISubroutineType(types: !1882)
!1882 = !{null, !274, !14, !35}
!1883 = !DILocalVariable(name: "r", arg: 1, scope: !1880, file: !1818, line: 71, type: !274)
!1884 = !DILocation(line: 0, scope: !1880)
!1885 = !DILocalVariable(name: "v", arg: 2, scope: !1880, file: !1818, line: 71, type: !14)
!1886 = !DILocalVariable(name: "b", arg: 3, scope: !1880, file: !1818, line: 71, type: !35)
!1887 = !DILocation(line: 73, column: 8, scope: !1880)
!1888 = !DILocation(line: 73, column: 7, scope: !1880)
!1889 = !DILocation(line: 74, column: 9, scope: !1880)
!1890 = !DILocation(line: 74, column: 15, scope: !1880)
!1891 = !DILocation(line: 74, column: 14, scope: !1880)
!1892 = !DILocation(line: 74, column: 21, scope: !1880)
!1893 = !DILocation(line: 74, column: 19, scope: !1880)
!1894 = !DILocation(line: 74, column: 11, scope: !1880)
!1895 = !DILocation(line: 74, column: 6, scope: !1880)
!1896 = !DILocation(line: 75, column: 1, scope: !1880)
!1897 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !1898, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1898 = !DISubroutineType(types: !1899)
!1899 = !{null, !1900}
!1900 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1901, size: 32)
!1901 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !1902)
!1902 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !1903)
!1903 = !{!1904, !1905}
!1904 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1902, file: !207, line: 15, baseType: !211, size: 1600)
!1905 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1902, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!1906 = !DILocalVariable(name: "state", arg: 1, scope: !1897, file: !27, line: 523, type: !1900)
!1907 = !DILocation(line: 0, scope: !1897)
!1908 = !DILocation(line: 525, column: 22, scope: !1897)
!1909 = !DILocation(line: 525, column: 15, scope: !1897)
!1910 = !DILocation(line: 525, column: 3, scope: !1897)
!1911 = !DILocation(line: 526, column: 10, scope: !1897)
!1912 = !DILocation(line: 526, column: 14, scope: !1897)
!1913 = !DILocation(line: 527, column: 1, scope: !1897)
!1914 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !1915, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1915 = !DISubroutineType(types: !1916)
!1916 = !{null, !1917}
!1917 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!1918 = !DILocalVariable(name: "s", arg: 1, scope: !1914, file: !27, line: 353, type: !1917)
!1919 = !DILocation(line: 0, scope: !1914)
!1920 = !DILocalVariable(name: "i", scope: !1914, file: !27, line: 355, type: !42)
!1921 = !DILocation(line: 356, column: 7, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1914, file: !27, line: 356, column: 3)
!1923 = !DILocation(line: 356, scope: !1922)
!1924 = !DILocation(line: 356, column: 12, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1922, file: !27, line: 356, column: 3)
!1926 = !DILocation(line: 356, column: 3, scope: !1922)
!1927 = !DILocation(line: 357, column: 5, scope: !1925)
!1928 = !DILocation(line: 357, column: 10, scope: !1925)
!1929 = !DILocation(line: 356, column: 17, scope: !1925)
!1930 = !DILocation(line: 356, column: 3, scope: !1925)
!1931 = distinct !{!1931, !1926, !1932, !259}
!1932 = !DILocation(line: 357, column: 12, scope: !1922)
!1933 = !DILocation(line: 358, column: 1, scope: !1914)
!1934 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !1935, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1935 = !DISubroutineType(types: !1936)
!1936 = !{null, !1900, !64, !1821}
!1937 = !DILocalVariable(name: "state", arg: 1, scope: !1934, file: !27, line: 538, type: !1900)
!1938 = !DILocation(line: 0, scope: !1934)
!1939 = !DILocalVariable(name: "in", arg: 2, scope: !1934, file: !27, line: 538, type: !64)
!1940 = !DILocalVariable(name: "inlen", arg: 3, scope: !1934, file: !27, line: 538, type: !1821)
!1941 = !DILocation(line: 540, column: 37, scope: !1934)
!1942 = !DILocation(line: 540, column: 30, scope: !1934)
!1943 = !DILocation(line: 540, column: 47, scope: !1934)
!1944 = !DILocation(line: 540, column: 16, scope: !1934)
!1945 = !DILocation(line: 540, column: 10, scope: !1934)
!1946 = !DILocation(line: 540, column: 14, scope: !1934)
!1947 = !DILocation(line: 541, column: 1, scope: !1934)
!1948 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !1949, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1949 = !DISubroutineType(types: !1950)
!1950 = !{!42, !1917, !42, !42, !64, !1821}
!1951 = !DILocalVariable(name: "s", arg: 1, scope: !1948, file: !27, line: 373, type: !1917)
!1952 = !DILocation(line: 0, scope: !1948)
!1953 = !DILocalVariable(name: "pos", arg: 2, scope: !1948, file: !27, line: 374, type: !42)
!1954 = !DILocalVariable(name: "r", arg: 3, scope: !1948, file: !27, line: 375, type: !42)
!1955 = !DILocalVariable(name: "in", arg: 4, scope: !1948, file: !27, line: 376, type: !64)
!1956 = !DILocalVariable(name: "inlen", arg: 5, scope: !1948, file: !27, line: 377, type: !1821)
!1957 = !DILocation(line: 381, column: 3, scope: !1948)
!1958 = !DILocation(line: 381, column: 12, scope: !1948)
!1959 = !DILocation(line: 381, column: 19, scope: !1948)
!1960 = !DILocalVariable(name: "i", scope: !1948, file: !27, line: 379, type: !42)
!1961 = !DILocation(line: 382, column: 9, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1963, file: !27, line: 382, column: 5)
!1963 = distinct !DILexicalBlock(scope: !1948, file: !27, line: 381, column: 25)
!1964 = !DILocation(line: 382, scope: !1962)
!1965 = !DILocation(line: 382, column: 16, scope: !1966)
!1966 = distinct !DILexicalBlock(scope: !1962, file: !27, line: 382, column: 5)
!1967 = !DILocation(line: 382, column: 5, scope: !1962)
!1968 = !DILocation(line: 383, column: 30, scope: !1966)
!1969 = !DILocation(line: 383, column: 27, scope: !1966)
!1970 = !DILocation(line: 383, column: 17, scope: !1966)
!1971 = !DILocation(line: 383, column: 40, scope: !1966)
!1972 = !DILocation(line: 383, column: 37, scope: !1966)
!1973 = !DILocation(line: 383, column: 33, scope: !1966)
!1974 = !DILocation(line: 383, column: 10, scope: !1966)
!1975 = !DILocation(line: 383, column: 7, scope: !1966)
!1976 = !DILocation(line: 383, column: 14, scope: !1966)
!1977 = !DILocation(line: 382, column: 20, scope: !1966)
!1978 = !DILocation(line: 382, column: 5, scope: !1966)
!1979 = distinct !{!1979, !1967, !1980, !259}
!1980 = !DILocation(line: 383, column: 42, scope: !1962)
!1981 = !DILocation(line: 384, column: 15, scope: !1963)
!1982 = !DILocation(line: 384, column: 11, scope: !1963)
!1983 = !DILocation(line: 385, column: 5, scope: !1963)
!1984 = distinct !{!1984, !1957, !1985, !259}
!1985 = !DILocation(line: 387, column: 3, scope: !1948)
!1986 = !DILocation(line: 389, column: 7, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1948, file: !27, line: 389, column: 3)
!1988 = !DILocation(line: 389, scope: !1987)
!1989 = !DILocation(line: 389, column: 18, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1987, file: !27, line: 389, column: 3)
!1991 = !DILocation(line: 389, column: 14, scope: !1990)
!1992 = !DILocation(line: 389, column: 3, scope: !1987)
!1993 = !DILocation(line: 390, column: 28, scope: !1990)
!1994 = !DILocation(line: 390, column: 25, scope: !1990)
!1995 = !DILocation(line: 390, column: 15, scope: !1990)
!1996 = !DILocation(line: 390, column: 38, scope: !1990)
!1997 = !DILocation(line: 390, column: 35, scope: !1990)
!1998 = !DILocation(line: 390, column: 31, scope: !1990)
!1999 = !DILocation(line: 390, column: 8, scope: !1990)
!2000 = !DILocation(line: 390, column: 5, scope: !1990)
!2001 = !DILocation(line: 390, column: 12, scope: !1990)
!2002 = !DILocation(line: 389, column: 26, scope: !1990)
!2003 = !DILocation(line: 389, column: 3, scope: !1990)
!2004 = distinct !{!2004, !1992, !2005, !259}
!2005 = !DILocation(line: 390, column: 40, scope: !1987)
!2006 = !DILocation(line: 392, column: 3, scope: !1948)
!2007 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !1915, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2008 = !DILocalVariable(name: "state", arg: 1, scope: !2007, file: !27, line: 82, type: !1917)
!2009 = !DILocation(line: 0, scope: !2007)
!2010 = !DILocation(line: 100, column: 15, scope: !2007)
!2011 = !DILocalVariable(name: "Aba", scope: !2007, file: !27, line: 86, type: !23)
!2012 = !DILocation(line: 101, column: 15, scope: !2007)
!2013 = !DILocalVariable(name: "Abe", scope: !2007, file: !27, line: 86, type: !23)
!2014 = !DILocation(line: 102, column: 15, scope: !2007)
!2015 = !DILocalVariable(name: "Abi", scope: !2007, file: !27, line: 86, type: !23)
!2016 = !DILocation(line: 103, column: 15, scope: !2007)
!2017 = !DILocalVariable(name: "Abo", scope: !2007, file: !27, line: 86, type: !23)
!2018 = !DILocation(line: 104, column: 15, scope: !2007)
!2019 = !DILocalVariable(name: "Abu", scope: !2007, file: !27, line: 86, type: !23)
!2020 = !DILocation(line: 105, column: 15, scope: !2007)
!2021 = !DILocalVariable(name: "Aga", scope: !2007, file: !27, line: 87, type: !23)
!2022 = !DILocation(line: 106, column: 15, scope: !2007)
!2023 = !DILocalVariable(name: "Age", scope: !2007, file: !27, line: 87, type: !23)
!2024 = !DILocation(line: 107, column: 15, scope: !2007)
!2025 = !DILocalVariable(name: "Agi", scope: !2007, file: !27, line: 87, type: !23)
!2026 = !DILocation(line: 108, column: 15, scope: !2007)
!2027 = !DILocalVariable(name: "Ago", scope: !2007, file: !27, line: 87, type: !23)
!2028 = !DILocation(line: 109, column: 15, scope: !2007)
!2029 = !DILocalVariable(name: "Agu", scope: !2007, file: !27, line: 87, type: !23)
!2030 = !DILocation(line: 110, column: 15, scope: !2007)
!2031 = !DILocalVariable(name: "Aka", scope: !2007, file: !27, line: 88, type: !23)
!2032 = !DILocation(line: 111, column: 15, scope: !2007)
!2033 = !DILocalVariable(name: "Ake", scope: !2007, file: !27, line: 88, type: !23)
!2034 = !DILocation(line: 112, column: 15, scope: !2007)
!2035 = !DILocalVariable(name: "Aki", scope: !2007, file: !27, line: 88, type: !23)
!2036 = !DILocation(line: 113, column: 15, scope: !2007)
!2037 = !DILocalVariable(name: "Ako", scope: !2007, file: !27, line: 88, type: !23)
!2038 = !DILocation(line: 114, column: 15, scope: !2007)
!2039 = !DILocalVariable(name: "Aku", scope: !2007, file: !27, line: 88, type: !23)
!2040 = !DILocation(line: 115, column: 15, scope: !2007)
!2041 = !DILocalVariable(name: "Ama", scope: !2007, file: !27, line: 89, type: !23)
!2042 = !DILocation(line: 116, column: 15, scope: !2007)
!2043 = !DILocalVariable(name: "Ame", scope: !2007, file: !27, line: 89, type: !23)
!2044 = !DILocation(line: 117, column: 15, scope: !2007)
!2045 = !DILocalVariable(name: "Ami", scope: !2007, file: !27, line: 89, type: !23)
!2046 = !DILocation(line: 118, column: 15, scope: !2007)
!2047 = !DILocalVariable(name: "Amo", scope: !2007, file: !27, line: 89, type: !23)
!2048 = !DILocation(line: 119, column: 15, scope: !2007)
!2049 = !DILocalVariable(name: "Amu", scope: !2007, file: !27, line: 89, type: !23)
!2050 = !DILocation(line: 120, column: 15, scope: !2007)
!2051 = !DILocalVariable(name: "Asa", scope: !2007, file: !27, line: 90, type: !23)
!2052 = !DILocation(line: 121, column: 15, scope: !2007)
!2053 = !DILocalVariable(name: "Ase", scope: !2007, file: !27, line: 90, type: !23)
!2054 = !DILocation(line: 122, column: 15, scope: !2007)
!2055 = !DILocalVariable(name: "Asi", scope: !2007, file: !27, line: 90, type: !23)
!2056 = !DILocation(line: 123, column: 15, scope: !2007)
!2057 = !DILocalVariable(name: "Aso", scope: !2007, file: !27, line: 90, type: !23)
!2058 = !DILocation(line: 124, column: 15, scope: !2007)
!2059 = !DILocalVariable(name: "Asu", scope: !2007, file: !27, line: 90, type: !23)
!2060 = !DILocalVariable(name: "round", scope: !2007, file: !27, line: 84, type: !9)
!2061 = !DILocation(line: 126, column: 13, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2007, file: !27, line: 126, column: 9)
!2063 = !DILocation(line: 126, scope: !2062)
!2064 = !DILocation(line: 126, column: 30, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2062, file: !27, line: 126, column: 9)
!2066 = !DILocation(line: 126, column: 9, scope: !2062)
!2067 = !DILocation(line: 128, column: 22, scope: !2068)
!2068 = distinct !DILexicalBlock(scope: !2065, file: !27, line: 126, column: 53)
!2069 = !DILocation(line: 128, column: 26, scope: !2068)
!2070 = !DILocation(line: 128, column: 30, scope: !2068)
!2071 = !DILocation(line: 128, column: 34, scope: !2068)
!2072 = !DILocalVariable(name: "BCa", scope: !2007, file: !27, line: 91, type: !23)
!2073 = !DILocation(line: 129, column: 22, scope: !2068)
!2074 = !DILocation(line: 129, column: 26, scope: !2068)
!2075 = !DILocation(line: 129, column: 30, scope: !2068)
!2076 = !DILocation(line: 129, column: 34, scope: !2068)
!2077 = !DILocalVariable(name: "BCe", scope: !2007, file: !27, line: 91, type: !23)
!2078 = !DILocation(line: 130, column: 22, scope: !2068)
!2079 = !DILocation(line: 130, column: 26, scope: !2068)
!2080 = !DILocation(line: 130, column: 30, scope: !2068)
!2081 = !DILocation(line: 130, column: 34, scope: !2068)
!2082 = !DILocalVariable(name: "BCi", scope: !2007, file: !27, line: 91, type: !23)
!2083 = !DILocation(line: 131, column: 22, scope: !2068)
!2084 = !DILocation(line: 131, column: 26, scope: !2068)
!2085 = !DILocation(line: 131, column: 30, scope: !2068)
!2086 = !DILocation(line: 131, column: 34, scope: !2068)
!2087 = !DILocalVariable(name: "BCo", scope: !2007, file: !27, line: 91, type: !23)
!2088 = !DILocation(line: 132, column: 22, scope: !2068)
!2089 = !DILocation(line: 132, column: 26, scope: !2068)
!2090 = !DILocation(line: 132, column: 30, scope: !2068)
!2091 = !DILocation(line: 132, column: 34, scope: !2068)
!2092 = !DILocalVariable(name: "BCu", scope: !2007, file: !27, line: 91, type: !23)
!2093 = !DILocation(line: 135, column: 22, scope: !2068)
!2094 = !DILocation(line: 135, column: 21, scope: !2068)
!2095 = !DILocalVariable(name: "Da", scope: !2007, file: !27, line: 92, type: !23)
!2096 = !DILocation(line: 136, column: 22, scope: !2068)
!2097 = !DILocation(line: 136, column: 21, scope: !2068)
!2098 = !DILocalVariable(name: "De", scope: !2007, file: !27, line: 92, type: !23)
!2099 = !DILocation(line: 137, column: 22, scope: !2068)
!2100 = !DILocation(line: 137, column: 21, scope: !2068)
!2101 = !DILocalVariable(name: "Di", scope: !2007, file: !27, line: 92, type: !23)
!2102 = !DILocation(line: 138, column: 22, scope: !2068)
!2103 = !DILocation(line: 138, column: 21, scope: !2068)
!2104 = !DILocalVariable(name: "Do", scope: !2007, file: !27, line: 92, type: !23)
!2105 = !DILocation(line: 139, column: 22, scope: !2068)
!2106 = !DILocation(line: 139, column: 21, scope: !2068)
!2107 = !DILocalVariable(name: "Du", scope: !2007, file: !27, line: 92, type: !23)
!2108 = !DILocation(line: 141, column: 17, scope: !2068)
!2109 = !DILocation(line: 143, column: 17, scope: !2068)
!2110 = !DILocation(line: 144, column: 19, scope: !2068)
!2111 = !DILocation(line: 145, column: 17, scope: !2068)
!2112 = !DILocation(line: 146, column: 19, scope: !2068)
!2113 = !DILocation(line: 147, column: 17, scope: !2068)
!2114 = !DILocation(line: 148, column: 19, scope: !2068)
!2115 = !DILocation(line: 149, column: 17, scope: !2068)
!2116 = !DILocation(line: 150, column: 19, scope: !2068)
!2117 = !DILocation(line: 151, column: 28, scope: !2068)
!2118 = !DILocation(line: 151, column: 33, scope: !2068)
!2119 = !DILocation(line: 151, column: 25, scope: !2068)
!2120 = !DILocalVariable(name: "Eba", scope: !2007, file: !27, line: 93, type: !23)
!2121 = !DILocation(line: 152, column: 30, scope: !2068)
!2122 = !DILocation(line: 152, column: 17, scope: !2068)
!2123 = !DILocation(line: 153, column: 28, scope: !2068)
!2124 = !DILocation(line: 153, column: 33, scope: !2068)
!2125 = !DILocation(line: 153, column: 25, scope: !2068)
!2126 = !DILocalVariable(name: "Ebe", scope: !2007, file: !27, line: 93, type: !23)
!2127 = !DILocation(line: 154, column: 28, scope: !2068)
!2128 = !DILocation(line: 154, column: 33, scope: !2068)
!2129 = !DILocation(line: 154, column: 25, scope: !2068)
!2130 = !DILocalVariable(name: "Ebi", scope: !2007, file: !27, line: 93, type: !23)
!2131 = !DILocation(line: 155, column: 28, scope: !2068)
!2132 = !DILocation(line: 155, column: 33, scope: !2068)
!2133 = !DILocation(line: 155, column: 25, scope: !2068)
!2134 = !DILocalVariable(name: "Ebo", scope: !2007, file: !27, line: 93, type: !23)
!2135 = !DILocation(line: 156, column: 28, scope: !2068)
!2136 = !DILocation(line: 156, column: 33, scope: !2068)
!2137 = !DILocation(line: 156, column: 25, scope: !2068)
!2138 = !DILocalVariable(name: "Ebu", scope: !2007, file: !27, line: 93, type: !23)
!2139 = !DILocation(line: 158, column: 17, scope: !2068)
!2140 = !DILocation(line: 159, column: 19, scope: !2068)
!2141 = !DILocation(line: 160, column: 17, scope: !2068)
!2142 = !DILocation(line: 161, column: 19, scope: !2068)
!2143 = !DILocation(line: 162, column: 17, scope: !2068)
!2144 = !DILocation(line: 163, column: 19, scope: !2068)
!2145 = !DILocation(line: 164, column: 17, scope: !2068)
!2146 = !DILocation(line: 165, column: 19, scope: !2068)
!2147 = !DILocation(line: 166, column: 17, scope: !2068)
!2148 = !DILocation(line: 167, column: 19, scope: !2068)
!2149 = !DILocation(line: 168, column: 28, scope: !2068)
!2150 = !DILocation(line: 168, column: 33, scope: !2068)
!2151 = !DILocation(line: 168, column: 25, scope: !2068)
!2152 = !DILocalVariable(name: "Ega", scope: !2007, file: !27, line: 94, type: !23)
!2153 = !DILocation(line: 169, column: 28, scope: !2068)
!2154 = !DILocation(line: 169, column: 33, scope: !2068)
!2155 = !DILocation(line: 169, column: 25, scope: !2068)
!2156 = !DILocalVariable(name: "Ege", scope: !2007, file: !27, line: 94, type: !23)
!2157 = !DILocation(line: 170, column: 28, scope: !2068)
!2158 = !DILocation(line: 170, column: 33, scope: !2068)
!2159 = !DILocation(line: 170, column: 25, scope: !2068)
!2160 = !DILocalVariable(name: "Egi", scope: !2007, file: !27, line: 94, type: !23)
!2161 = !DILocation(line: 171, column: 28, scope: !2068)
!2162 = !DILocation(line: 171, column: 33, scope: !2068)
!2163 = !DILocation(line: 171, column: 25, scope: !2068)
!2164 = !DILocalVariable(name: "Ego", scope: !2007, file: !27, line: 94, type: !23)
!2165 = !DILocation(line: 172, column: 28, scope: !2068)
!2166 = !DILocation(line: 172, column: 33, scope: !2068)
!2167 = !DILocation(line: 172, column: 25, scope: !2068)
!2168 = !DILocalVariable(name: "Egu", scope: !2007, file: !27, line: 94, type: !23)
!2169 = !DILocation(line: 174, column: 17, scope: !2068)
!2170 = !DILocation(line: 175, column: 19, scope: !2068)
!2171 = !DILocation(line: 176, column: 17, scope: !2068)
!2172 = !DILocation(line: 177, column: 19, scope: !2068)
!2173 = !DILocation(line: 178, column: 17, scope: !2068)
!2174 = !DILocation(line: 179, column: 19, scope: !2068)
!2175 = !DILocation(line: 180, column: 17, scope: !2068)
!2176 = !DILocation(line: 181, column: 19, scope: !2068)
!2177 = !DILocation(line: 182, column: 17, scope: !2068)
!2178 = !DILocation(line: 183, column: 19, scope: !2068)
!2179 = !DILocation(line: 184, column: 28, scope: !2068)
!2180 = !DILocation(line: 184, column: 33, scope: !2068)
!2181 = !DILocation(line: 184, column: 25, scope: !2068)
!2182 = !DILocalVariable(name: "Eka", scope: !2007, file: !27, line: 95, type: !23)
!2183 = !DILocation(line: 185, column: 28, scope: !2068)
!2184 = !DILocation(line: 185, column: 33, scope: !2068)
!2185 = !DILocation(line: 185, column: 25, scope: !2068)
!2186 = !DILocalVariable(name: "Eke", scope: !2007, file: !27, line: 95, type: !23)
!2187 = !DILocation(line: 186, column: 28, scope: !2068)
!2188 = !DILocation(line: 186, column: 33, scope: !2068)
!2189 = !DILocation(line: 186, column: 25, scope: !2068)
!2190 = !DILocalVariable(name: "Eki", scope: !2007, file: !27, line: 95, type: !23)
!2191 = !DILocation(line: 187, column: 28, scope: !2068)
!2192 = !DILocation(line: 187, column: 33, scope: !2068)
!2193 = !DILocation(line: 187, column: 25, scope: !2068)
!2194 = !DILocalVariable(name: "Eko", scope: !2007, file: !27, line: 95, type: !23)
!2195 = !DILocation(line: 188, column: 28, scope: !2068)
!2196 = !DILocation(line: 188, column: 33, scope: !2068)
!2197 = !DILocation(line: 188, column: 25, scope: !2068)
!2198 = !DILocalVariable(name: "Eku", scope: !2007, file: !27, line: 95, type: !23)
!2199 = !DILocation(line: 190, column: 17, scope: !2068)
!2200 = !DILocation(line: 191, column: 19, scope: !2068)
!2201 = !DILocation(line: 192, column: 17, scope: !2068)
!2202 = !DILocation(line: 193, column: 19, scope: !2068)
!2203 = !DILocation(line: 194, column: 17, scope: !2068)
!2204 = !DILocation(line: 195, column: 19, scope: !2068)
!2205 = !DILocation(line: 196, column: 17, scope: !2068)
!2206 = !DILocation(line: 197, column: 19, scope: !2068)
!2207 = !DILocation(line: 198, column: 17, scope: !2068)
!2208 = !DILocation(line: 199, column: 19, scope: !2068)
!2209 = !DILocation(line: 200, column: 28, scope: !2068)
!2210 = !DILocation(line: 200, column: 33, scope: !2068)
!2211 = !DILocation(line: 200, column: 25, scope: !2068)
!2212 = !DILocalVariable(name: "Ema", scope: !2007, file: !27, line: 96, type: !23)
!2213 = !DILocation(line: 201, column: 28, scope: !2068)
!2214 = !DILocation(line: 201, column: 33, scope: !2068)
!2215 = !DILocation(line: 201, column: 25, scope: !2068)
!2216 = !DILocalVariable(name: "Eme", scope: !2007, file: !27, line: 96, type: !23)
!2217 = !DILocation(line: 202, column: 28, scope: !2068)
!2218 = !DILocation(line: 202, column: 33, scope: !2068)
!2219 = !DILocation(line: 202, column: 25, scope: !2068)
!2220 = !DILocalVariable(name: "Emi", scope: !2007, file: !27, line: 96, type: !23)
!2221 = !DILocation(line: 203, column: 28, scope: !2068)
!2222 = !DILocation(line: 203, column: 33, scope: !2068)
!2223 = !DILocation(line: 203, column: 25, scope: !2068)
!2224 = !DILocalVariable(name: "Emo", scope: !2007, file: !27, line: 96, type: !23)
!2225 = !DILocation(line: 204, column: 28, scope: !2068)
!2226 = !DILocation(line: 204, column: 33, scope: !2068)
!2227 = !DILocation(line: 204, column: 25, scope: !2068)
!2228 = !DILocalVariable(name: "Emu", scope: !2007, file: !27, line: 96, type: !23)
!2229 = !DILocation(line: 206, column: 17, scope: !2068)
!2230 = !DILocation(line: 207, column: 19, scope: !2068)
!2231 = !DILocation(line: 208, column: 17, scope: !2068)
!2232 = !DILocation(line: 209, column: 19, scope: !2068)
!2233 = !DILocation(line: 210, column: 17, scope: !2068)
!2234 = !DILocation(line: 211, column: 19, scope: !2068)
!2235 = !DILocation(line: 212, column: 17, scope: !2068)
!2236 = !DILocation(line: 213, column: 19, scope: !2068)
!2237 = !DILocation(line: 214, column: 17, scope: !2068)
!2238 = !DILocation(line: 215, column: 19, scope: !2068)
!2239 = !DILocation(line: 216, column: 28, scope: !2068)
!2240 = !DILocation(line: 216, column: 33, scope: !2068)
!2241 = !DILocation(line: 216, column: 25, scope: !2068)
!2242 = !DILocalVariable(name: "Esa", scope: !2007, file: !27, line: 97, type: !23)
!2243 = !DILocation(line: 217, column: 28, scope: !2068)
!2244 = !DILocation(line: 217, column: 33, scope: !2068)
!2245 = !DILocation(line: 217, column: 25, scope: !2068)
!2246 = !DILocalVariable(name: "Ese", scope: !2007, file: !27, line: 97, type: !23)
!2247 = !DILocation(line: 218, column: 28, scope: !2068)
!2248 = !DILocation(line: 218, column: 33, scope: !2068)
!2249 = !DILocation(line: 218, column: 25, scope: !2068)
!2250 = !DILocalVariable(name: "Esi", scope: !2007, file: !27, line: 97, type: !23)
!2251 = !DILocation(line: 219, column: 28, scope: !2068)
!2252 = !DILocation(line: 219, column: 33, scope: !2068)
!2253 = !DILocation(line: 219, column: 25, scope: !2068)
!2254 = !DILocalVariable(name: "Eso", scope: !2007, file: !27, line: 97, type: !23)
!2255 = !DILocation(line: 220, column: 28, scope: !2068)
!2256 = !DILocation(line: 220, column: 33, scope: !2068)
!2257 = !DILocation(line: 220, column: 25, scope: !2068)
!2258 = !DILocalVariable(name: "Esu", scope: !2007, file: !27, line: 97, type: !23)
!2259 = !DILocation(line: 223, column: 22, scope: !2068)
!2260 = !DILocation(line: 223, column: 26, scope: !2068)
!2261 = !DILocation(line: 223, column: 30, scope: !2068)
!2262 = !DILocation(line: 223, column: 34, scope: !2068)
!2263 = !DILocation(line: 224, column: 22, scope: !2068)
!2264 = !DILocation(line: 224, column: 26, scope: !2068)
!2265 = !DILocation(line: 224, column: 30, scope: !2068)
!2266 = !DILocation(line: 224, column: 34, scope: !2068)
!2267 = !DILocation(line: 225, column: 22, scope: !2068)
!2268 = !DILocation(line: 225, column: 26, scope: !2068)
!2269 = !DILocation(line: 225, column: 30, scope: !2068)
!2270 = !DILocation(line: 225, column: 34, scope: !2068)
!2271 = !DILocation(line: 226, column: 22, scope: !2068)
!2272 = !DILocation(line: 226, column: 26, scope: !2068)
!2273 = !DILocation(line: 226, column: 30, scope: !2068)
!2274 = !DILocation(line: 226, column: 34, scope: !2068)
!2275 = !DILocation(line: 227, column: 22, scope: !2068)
!2276 = !DILocation(line: 227, column: 26, scope: !2068)
!2277 = !DILocation(line: 227, column: 30, scope: !2068)
!2278 = !DILocation(line: 227, column: 34, scope: !2068)
!2279 = !DILocation(line: 230, column: 22, scope: !2068)
!2280 = !DILocation(line: 230, column: 21, scope: !2068)
!2281 = !DILocation(line: 231, column: 22, scope: !2068)
!2282 = !DILocation(line: 231, column: 21, scope: !2068)
!2283 = !DILocation(line: 232, column: 22, scope: !2068)
!2284 = !DILocation(line: 232, column: 21, scope: !2068)
!2285 = !DILocation(line: 233, column: 22, scope: !2068)
!2286 = !DILocation(line: 233, column: 21, scope: !2068)
!2287 = !DILocation(line: 234, column: 22, scope: !2068)
!2288 = !DILocation(line: 234, column: 21, scope: !2068)
!2289 = !DILocation(line: 236, column: 17, scope: !2068)
!2290 = !DILocation(line: 238, column: 17, scope: !2068)
!2291 = !DILocation(line: 239, column: 19, scope: !2068)
!2292 = !DILocation(line: 240, column: 17, scope: !2068)
!2293 = !DILocation(line: 241, column: 19, scope: !2068)
!2294 = !DILocation(line: 242, column: 17, scope: !2068)
!2295 = !DILocation(line: 243, column: 19, scope: !2068)
!2296 = !DILocation(line: 244, column: 17, scope: !2068)
!2297 = !DILocation(line: 245, column: 19, scope: !2068)
!2298 = !DILocation(line: 246, column: 28, scope: !2068)
!2299 = !DILocation(line: 246, column: 33, scope: !2068)
!2300 = !DILocation(line: 246, column: 25, scope: !2068)
!2301 = !DILocation(line: 247, column: 58, scope: !2068)
!2302 = !DILocation(line: 247, column: 30, scope: !2068)
!2303 = !DILocation(line: 247, column: 17, scope: !2068)
!2304 = !DILocation(line: 248, column: 28, scope: !2068)
!2305 = !DILocation(line: 248, column: 33, scope: !2068)
!2306 = !DILocation(line: 248, column: 25, scope: !2068)
!2307 = !DILocation(line: 249, column: 28, scope: !2068)
!2308 = !DILocation(line: 249, column: 33, scope: !2068)
!2309 = !DILocation(line: 249, column: 25, scope: !2068)
!2310 = !DILocation(line: 250, column: 28, scope: !2068)
!2311 = !DILocation(line: 250, column: 33, scope: !2068)
!2312 = !DILocation(line: 250, column: 25, scope: !2068)
!2313 = !DILocation(line: 251, column: 28, scope: !2068)
!2314 = !DILocation(line: 251, column: 33, scope: !2068)
!2315 = !DILocation(line: 251, column: 25, scope: !2068)
!2316 = !DILocation(line: 253, column: 17, scope: !2068)
!2317 = !DILocation(line: 254, column: 19, scope: !2068)
!2318 = !DILocation(line: 255, column: 17, scope: !2068)
!2319 = !DILocation(line: 256, column: 19, scope: !2068)
!2320 = !DILocation(line: 257, column: 17, scope: !2068)
!2321 = !DILocation(line: 258, column: 19, scope: !2068)
!2322 = !DILocation(line: 259, column: 17, scope: !2068)
!2323 = !DILocation(line: 260, column: 19, scope: !2068)
!2324 = !DILocation(line: 261, column: 17, scope: !2068)
!2325 = !DILocation(line: 262, column: 19, scope: !2068)
!2326 = !DILocation(line: 263, column: 28, scope: !2068)
!2327 = !DILocation(line: 263, column: 33, scope: !2068)
!2328 = !DILocation(line: 263, column: 25, scope: !2068)
!2329 = !DILocation(line: 264, column: 28, scope: !2068)
!2330 = !DILocation(line: 264, column: 33, scope: !2068)
!2331 = !DILocation(line: 264, column: 25, scope: !2068)
!2332 = !DILocation(line: 265, column: 28, scope: !2068)
!2333 = !DILocation(line: 265, column: 33, scope: !2068)
!2334 = !DILocation(line: 265, column: 25, scope: !2068)
!2335 = !DILocation(line: 266, column: 28, scope: !2068)
!2336 = !DILocation(line: 266, column: 33, scope: !2068)
!2337 = !DILocation(line: 266, column: 25, scope: !2068)
!2338 = !DILocation(line: 267, column: 28, scope: !2068)
!2339 = !DILocation(line: 267, column: 33, scope: !2068)
!2340 = !DILocation(line: 267, column: 25, scope: !2068)
!2341 = !DILocation(line: 269, column: 17, scope: !2068)
!2342 = !DILocation(line: 270, column: 19, scope: !2068)
!2343 = !DILocation(line: 271, column: 17, scope: !2068)
!2344 = !DILocation(line: 272, column: 19, scope: !2068)
!2345 = !DILocation(line: 273, column: 17, scope: !2068)
!2346 = !DILocation(line: 274, column: 19, scope: !2068)
!2347 = !DILocation(line: 275, column: 17, scope: !2068)
!2348 = !DILocation(line: 276, column: 19, scope: !2068)
!2349 = !DILocation(line: 277, column: 17, scope: !2068)
!2350 = !DILocation(line: 278, column: 19, scope: !2068)
!2351 = !DILocation(line: 279, column: 28, scope: !2068)
!2352 = !DILocation(line: 279, column: 33, scope: !2068)
!2353 = !DILocation(line: 279, column: 25, scope: !2068)
!2354 = !DILocation(line: 280, column: 28, scope: !2068)
!2355 = !DILocation(line: 280, column: 33, scope: !2068)
!2356 = !DILocation(line: 280, column: 25, scope: !2068)
!2357 = !DILocation(line: 281, column: 28, scope: !2068)
!2358 = !DILocation(line: 281, column: 33, scope: !2068)
!2359 = !DILocation(line: 281, column: 25, scope: !2068)
!2360 = !DILocation(line: 282, column: 28, scope: !2068)
!2361 = !DILocation(line: 282, column: 33, scope: !2068)
!2362 = !DILocation(line: 282, column: 25, scope: !2068)
!2363 = !DILocation(line: 283, column: 28, scope: !2068)
!2364 = !DILocation(line: 283, column: 33, scope: !2068)
!2365 = !DILocation(line: 283, column: 25, scope: !2068)
!2366 = !DILocation(line: 285, column: 17, scope: !2068)
!2367 = !DILocation(line: 286, column: 19, scope: !2068)
!2368 = !DILocation(line: 287, column: 17, scope: !2068)
!2369 = !DILocation(line: 288, column: 19, scope: !2068)
!2370 = !DILocation(line: 289, column: 17, scope: !2068)
!2371 = !DILocation(line: 290, column: 19, scope: !2068)
!2372 = !DILocation(line: 291, column: 17, scope: !2068)
!2373 = !DILocation(line: 292, column: 19, scope: !2068)
!2374 = !DILocation(line: 293, column: 17, scope: !2068)
!2375 = !DILocation(line: 294, column: 19, scope: !2068)
!2376 = !DILocation(line: 295, column: 28, scope: !2068)
!2377 = !DILocation(line: 295, column: 33, scope: !2068)
!2378 = !DILocation(line: 295, column: 25, scope: !2068)
!2379 = !DILocation(line: 296, column: 28, scope: !2068)
!2380 = !DILocation(line: 296, column: 33, scope: !2068)
!2381 = !DILocation(line: 296, column: 25, scope: !2068)
!2382 = !DILocation(line: 297, column: 28, scope: !2068)
!2383 = !DILocation(line: 297, column: 33, scope: !2068)
!2384 = !DILocation(line: 297, column: 25, scope: !2068)
!2385 = !DILocation(line: 298, column: 28, scope: !2068)
!2386 = !DILocation(line: 298, column: 33, scope: !2068)
!2387 = !DILocation(line: 298, column: 25, scope: !2068)
!2388 = !DILocation(line: 299, column: 28, scope: !2068)
!2389 = !DILocation(line: 299, column: 33, scope: !2068)
!2390 = !DILocation(line: 299, column: 25, scope: !2068)
!2391 = !DILocation(line: 301, column: 17, scope: !2068)
!2392 = !DILocation(line: 302, column: 19, scope: !2068)
!2393 = !DILocation(line: 303, column: 17, scope: !2068)
!2394 = !DILocation(line: 304, column: 19, scope: !2068)
!2395 = !DILocation(line: 305, column: 17, scope: !2068)
!2396 = !DILocation(line: 306, column: 19, scope: !2068)
!2397 = !DILocation(line: 307, column: 17, scope: !2068)
!2398 = !DILocation(line: 308, column: 19, scope: !2068)
!2399 = !DILocation(line: 309, column: 17, scope: !2068)
!2400 = !DILocation(line: 310, column: 19, scope: !2068)
!2401 = !DILocation(line: 311, column: 28, scope: !2068)
!2402 = !DILocation(line: 311, column: 33, scope: !2068)
!2403 = !DILocation(line: 311, column: 25, scope: !2068)
!2404 = !DILocation(line: 312, column: 28, scope: !2068)
!2405 = !DILocation(line: 312, column: 33, scope: !2068)
!2406 = !DILocation(line: 312, column: 25, scope: !2068)
!2407 = !DILocation(line: 313, column: 28, scope: !2068)
!2408 = !DILocation(line: 313, column: 33, scope: !2068)
!2409 = !DILocation(line: 313, column: 25, scope: !2068)
!2410 = !DILocation(line: 314, column: 28, scope: !2068)
!2411 = !DILocation(line: 314, column: 33, scope: !2068)
!2412 = !DILocation(line: 314, column: 25, scope: !2068)
!2413 = !DILocation(line: 315, column: 28, scope: !2068)
!2414 = !DILocation(line: 315, column: 33, scope: !2068)
!2415 = !DILocation(line: 315, column: 25, scope: !2068)
!2416 = !DILocation(line: 316, column: 9, scope: !2068)
!2417 = !DILocation(line: 126, column: 47, scope: !2065)
!2418 = !DILocation(line: 126, column: 9, scope: !2065)
!2419 = distinct !{!2419, !2066, !2420, !259}
!2420 = !DILocation(line: 316, column: 9, scope: !2062)
!2421 = !DILocation(line: 319, column: 9, scope: !2007)
!2422 = !DILocation(line: 319, column: 19, scope: !2007)
!2423 = !DILocation(line: 320, column: 9, scope: !2007)
!2424 = !DILocation(line: 320, column: 19, scope: !2007)
!2425 = !DILocation(line: 321, column: 9, scope: !2007)
!2426 = !DILocation(line: 321, column: 19, scope: !2007)
!2427 = !DILocation(line: 322, column: 9, scope: !2007)
!2428 = !DILocation(line: 322, column: 19, scope: !2007)
!2429 = !DILocation(line: 323, column: 9, scope: !2007)
!2430 = !DILocation(line: 323, column: 19, scope: !2007)
!2431 = !DILocation(line: 324, column: 9, scope: !2007)
!2432 = !DILocation(line: 324, column: 19, scope: !2007)
!2433 = !DILocation(line: 325, column: 9, scope: !2007)
!2434 = !DILocation(line: 325, column: 19, scope: !2007)
!2435 = !DILocation(line: 326, column: 9, scope: !2007)
!2436 = !DILocation(line: 326, column: 19, scope: !2007)
!2437 = !DILocation(line: 327, column: 9, scope: !2007)
!2438 = !DILocation(line: 327, column: 19, scope: !2007)
!2439 = !DILocation(line: 328, column: 9, scope: !2007)
!2440 = !DILocation(line: 328, column: 19, scope: !2007)
!2441 = !DILocation(line: 329, column: 9, scope: !2007)
!2442 = !DILocation(line: 329, column: 19, scope: !2007)
!2443 = !DILocation(line: 330, column: 9, scope: !2007)
!2444 = !DILocation(line: 330, column: 19, scope: !2007)
!2445 = !DILocation(line: 331, column: 9, scope: !2007)
!2446 = !DILocation(line: 331, column: 19, scope: !2007)
!2447 = !DILocation(line: 332, column: 9, scope: !2007)
!2448 = !DILocation(line: 332, column: 19, scope: !2007)
!2449 = !DILocation(line: 333, column: 9, scope: !2007)
!2450 = !DILocation(line: 333, column: 19, scope: !2007)
!2451 = !DILocation(line: 334, column: 9, scope: !2007)
!2452 = !DILocation(line: 334, column: 19, scope: !2007)
!2453 = !DILocation(line: 335, column: 9, scope: !2007)
!2454 = !DILocation(line: 335, column: 19, scope: !2007)
!2455 = !DILocation(line: 336, column: 9, scope: !2007)
!2456 = !DILocation(line: 336, column: 19, scope: !2007)
!2457 = !DILocation(line: 337, column: 9, scope: !2007)
!2458 = !DILocation(line: 337, column: 19, scope: !2007)
!2459 = !DILocation(line: 338, column: 9, scope: !2007)
!2460 = !DILocation(line: 338, column: 19, scope: !2007)
!2461 = !DILocation(line: 339, column: 9, scope: !2007)
!2462 = !DILocation(line: 339, column: 19, scope: !2007)
!2463 = !DILocation(line: 340, column: 9, scope: !2007)
!2464 = !DILocation(line: 340, column: 19, scope: !2007)
!2465 = !DILocation(line: 341, column: 9, scope: !2007)
!2466 = !DILocation(line: 341, column: 19, scope: !2007)
!2467 = !DILocation(line: 342, column: 9, scope: !2007)
!2468 = !DILocation(line: 342, column: 19, scope: !2007)
!2469 = !DILocation(line: 343, column: 9, scope: !2007)
!2470 = !DILocation(line: 343, column: 19, scope: !2007)
!2471 = !DILocation(line: 344, column: 1, scope: !2007)
!2472 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !1898, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2473 = !DILocalVariable(name: "state", arg: 1, scope: !2472, file: !27, line: 550, type: !1900)
!2474 = !DILocation(line: 0, scope: !2472)
!2475 = !DILocation(line: 552, column: 26, scope: !2472)
!2476 = !DILocation(line: 552, column: 19, scope: !2472)
!2477 = !DILocation(line: 552, column: 36, scope: !2472)
!2478 = !DILocation(line: 552, column: 3, scope: !2472)
!2479 = !DILocation(line: 553, column: 10, scope: !2472)
!2480 = !DILocation(line: 553, column: 14, scope: !2472)
!2481 = !DILocation(line: 554, column: 1, scope: !2472)
!2482 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2483, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2483 = !DISubroutineType(types: !2484)
!2484 = !{null, !1917, !42, !42, !61}
!2485 = !DILocalVariable(name: "s", arg: 1, scope: !2482, file: !27, line: 405, type: !1917)
!2486 = !DILocation(line: 0, scope: !2482)
!2487 = !DILocalVariable(name: "pos", arg: 2, scope: !2482, file: !27, line: 405, type: !42)
!2488 = !DILocalVariable(name: "r", arg: 3, scope: !2482, file: !27, line: 405, type: !42)
!2489 = !DILocalVariable(name: "p", arg: 4, scope: !2482, file: !27, line: 405, type: !61)
!2490 = !DILocation(line: 407, column: 15, scope: !2482)
!2491 = !DILocation(line: 407, column: 36, scope: !2482)
!2492 = !DILocation(line: 407, column: 31, scope: !2482)
!2493 = !DILocation(line: 407, column: 27, scope: !2482)
!2494 = !DILocation(line: 407, column: 8, scope: !2482)
!2495 = !DILocation(line: 407, column: 3, scope: !2482)
!2496 = !DILocation(line: 407, column: 12, scope: !2482)
!2497 = !DILocation(line: 408, column: 6, scope: !2482)
!2498 = !DILocation(line: 408, column: 8, scope: !2482)
!2499 = !DILocation(line: 408, column: 3, scope: !2482)
!2500 = !DILocation(line: 408, column: 12, scope: !2482)
!2501 = !DILocation(line: 409, column: 1, scope: !2482)
!2502 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2503, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2503 = !DISubroutineType(types: !2504)
!2504 = !{null, !60, !1821, !1900}
!2505 = !DILocalVariable(name: "out", arg: 1, scope: !2502, file: !27, line: 566, type: !60)
!2506 = !DILocation(line: 0, scope: !2502)
!2507 = !DILocalVariable(name: "outlen", arg: 2, scope: !2502, file: !27, line: 566, type: !1821)
!2508 = !DILocalVariable(name: "state", arg: 3, scope: !2502, file: !27, line: 566, type: !1900)
!2509 = !DILocation(line: 568, column: 51, scope: !2502)
!2510 = !DILocation(line: 568, column: 44, scope: !2502)
!2511 = !DILocation(line: 568, column: 61, scope: !2502)
!2512 = !DILocation(line: 568, column: 16, scope: !2502)
!2513 = !DILocation(line: 568, column: 10, scope: !2502)
!2514 = !DILocation(line: 568, column: 14, scope: !2502)
!2515 = !DILocation(line: 569, column: 1, scope: !2502)
!2516 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2517, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2517 = !DISubroutineType(types: !2518)
!2518 = !{!42, !60, !1821, !1917, !42, !42}
!2519 = !DILocalVariable(name: "out", arg: 1, scope: !2516, file: !27, line: 426, type: !60)
!2520 = !DILocation(line: 0, scope: !2516)
!2521 = !DILocalVariable(name: "outlen", arg: 2, scope: !2516, file: !27, line: 427, type: !1821)
!2522 = !DILocalVariable(name: "s", arg: 3, scope: !2516, file: !27, line: 428, type: !1917)
!2523 = !DILocalVariable(name: "pos", arg: 4, scope: !2516, file: !27, line: 429, type: !42)
!2524 = !DILocalVariable(name: "r", arg: 5, scope: !2516, file: !27, line: 430, type: !42)
!2525 = !DILocation(line: 434, column: 3, scope: !2516)
!2526 = !DILocation(line: 435, column: 12, scope: !2527)
!2527 = distinct !DILexicalBlock(scope: !2528, file: !27, line: 435, column: 8)
!2528 = distinct !DILexicalBlock(scope: !2516, file: !27, line: 434, column: 17)
!2529 = !DILocation(line: 436, column: 7, scope: !2530)
!2530 = distinct !DILexicalBlock(scope: !2527, file: !27, line: 435, column: 18)
!2531 = !DILocation(line: 438, column: 5, scope: !2530)
!2532 = !DILocalVariable(name: "i", scope: !2516, file: !27, line: 432, type: !42)
!2533 = !DILocation(line: 439, column: 9, scope: !2534)
!2534 = distinct !DILexicalBlock(scope: !2528, file: !27, line: 439, column: 5)
!2535 = !DILocation(line: 439, scope: !2534)
!2536 = !DILocation(line: 439, column: 17, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2534, file: !27, line: 439, column: 5)
!2538 = !DILocation(line: 439, column: 21, scope: !2537)
!2539 = !DILocation(line: 439, column: 31, scope: !2537)
!2540 = !DILocation(line: 439, column: 26, scope: !2537)
!2541 = !DILocation(line: 0, scope: !2537)
!2542 = !DILocation(line: 439, column: 5, scope: !2534)
!2543 = !DILocation(line: 440, column: 19, scope: !2537)
!2544 = !DILocation(line: 440, column: 16, scope: !2537)
!2545 = !DILocation(line: 440, column: 30, scope: !2537)
!2546 = !DILocation(line: 440, column: 27, scope: !2537)
!2547 = !DILocation(line: 440, column: 23, scope: !2537)
!2548 = !DILocation(line: 440, column: 11, scope: !2537)
!2549 = !DILocation(line: 440, column: 14, scope: !2537)
!2550 = !DILocation(line: 440, column: 7, scope: !2537)
!2551 = !DILocation(line: 439, column: 41, scope: !2537)
!2552 = !DILocation(line: 439, column: 5, scope: !2537)
!2553 = distinct !{!2553, !2542, !2554, !259}
!2554 = !DILocation(line: 440, column: 32, scope: !2534)
!2555 = !DILocation(line: 441, column: 16, scope: !2528)
!2556 = !DILocation(line: 441, column: 12, scope: !2528)
!2557 = distinct !{!2557, !2525, !2558, !259}
!2558 = !DILocation(line: 443, column: 3, scope: !2516)
!2559 = !DILocation(line: 445, column: 3, scope: !2516)
!2560 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !1935, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2561 = !DILocalVariable(name: "state", arg: 1, scope: !2560, file: !27, line: 580, type: !1900)
!2562 = !DILocation(line: 0, scope: !2560)
!2563 = !DILocalVariable(name: "in", arg: 2, scope: !2560, file: !27, line: 580, type: !64)
!2564 = !DILocalVariable(name: "inlen", arg: 3, scope: !2560, file: !27, line: 580, type: !1821)
!2565 = !DILocation(line: 582, column: 29, scope: !2560)
!2566 = !DILocation(line: 582, column: 22, scope: !2560)
!2567 = !DILocation(line: 582, column: 3, scope: !2560)
!2568 = !DILocation(line: 583, column: 10, scope: !2560)
!2569 = !DILocation(line: 583, column: 14, scope: !2560)
!2570 = !DILocation(line: 584, column: 1, scope: !2560)
!2571 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2572, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2572 = !DISubroutineType(types: !2573)
!2573 = !{null, !1917, !42, !64, !1821, !61}
!2574 = !DILocalVariable(name: "s", arg: 1, scope: !2571, file: !27, line: 461, type: !1917)
!2575 = !DILocation(line: 0, scope: !2571)
!2576 = !DILocalVariable(name: "r", arg: 2, scope: !2571, file: !27, line: 462, type: !42)
!2577 = !DILocalVariable(name: "in", arg: 3, scope: !2571, file: !27, line: 463, type: !64)
!2578 = !DILocalVariable(name: "inlen", arg: 4, scope: !2571, file: !27, line: 464, type: !1821)
!2579 = !DILocalVariable(name: "p", arg: 5, scope: !2571, file: !27, line: 465, type: !61)
!2580 = !DILocalVariable(name: "i", scope: !2571, file: !27, line: 467, type: !42)
!2581 = !DILocation(line: 469, column: 7, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2571, file: !27, line: 469, column: 3)
!2583 = !DILocation(line: 469, scope: !2582)
!2584 = !DILocation(line: 469, column: 12, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2582, file: !27, line: 469, column: 3)
!2586 = !DILocation(line: 469, column: 3, scope: !2582)
!2587 = !DILocation(line: 470, column: 5, scope: !2585)
!2588 = !DILocation(line: 470, column: 10, scope: !2585)
!2589 = !DILocation(line: 469, column: 17, scope: !2585)
!2590 = !DILocation(line: 469, column: 3, scope: !2585)
!2591 = distinct !{!2591, !2586, !2592, !259}
!2592 = !DILocation(line: 470, column: 12, scope: !2582)
!2593 = !DILocation(line: 472, column: 3, scope: !2571)
!2594 = !DILocation(line: 472, column: 15, scope: !2571)
!2595 = !DILocation(line: 473, column: 9, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2597, file: !27, line: 473, column: 5)
!2597 = distinct !DILexicalBlock(scope: !2571, file: !27, line: 472, column: 21)
!2598 = !DILocation(line: 473, scope: !2596)
!2599 = !DILocation(line: 473, column: 16, scope: !2600)
!2600 = distinct !DILexicalBlock(scope: !2596, file: !27, line: 473, column: 5)
!2601 = !DILocation(line: 473, column: 14, scope: !2600)
!2602 = !DILocation(line: 473, column: 5, scope: !2596)
!2603 = !DILocation(line: 474, column: 26, scope: !2600)
!2604 = !DILocation(line: 474, column: 24, scope: !2600)
!2605 = !DILocation(line: 474, column: 15, scope: !2600)
!2606 = !DILocation(line: 474, column: 7, scope: !2600)
!2607 = !DILocation(line: 474, column: 12, scope: !2600)
!2608 = !DILocation(line: 473, column: 20, scope: !2600)
!2609 = !DILocation(line: 473, column: 5, scope: !2600)
!2610 = distinct !{!2610, !2602, !2611, !259}
!2611 = !DILocation(line: 474, column: 28, scope: !2596)
!2612 = !DILocation(line: 475, column: 8, scope: !2597)
!2613 = !DILocation(line: 476, column: 11, scope: !2597)
!2614 = !DILocation(line: 477, column: 5, scope: !2597)
!2615 = distinct !{!2615, !2593, !2616, !259}
!2616 = !DILocation(line: 478, column: 3, scope: !2571)
!2617 = !DILocation(line: 480, column: 7, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2571, file: !27, line: 480, column: 3)
!2619 = !DILocation(line: 480, scope: !2618)
!2620 = !DILocation(line: 480, column: 12, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2618, file: !27, line: 480, column: 3)
!2622 = !DILocation(line: 480, column: 3, scope: !2618)
!2623 = !DILocation(line: 481, column: 25, scope: !2621)
!2624 = !DILocation(line: 481, column: 15, scope: !2621)
!2625 = !DILocation(line: 481, column: 38, scope: !2621)
!2626 = !DILocation(line: 481, column: 35, scope: !2621)
!2627 = !DILocation(line: 481, column: 31, scope: !2621)
!2628 = !DILocation(line: 481, column: 8, scope: !2621)
!2629 = !DILocation(line: 481, column: 5, scope: !2621)
!2630 = !DILocation(line: 481, column: 12, scope: !2621)
!2631 = !DILocation(line: 480, column: 20, scope: !2621)
!2632 = !DILocation(line: 480, column: 3, scope: !2621)
!2633 = distinct !{!2633, !2622, !2634, !259}
!2634 = !DILocation(line: 481, column: 40, scope: !2618)
!2635 = !DILocation(line: 483, column: 13, scope: !2571)
!2636 = !DILocation(line: 483, column: 32, scope: !2571)
!2637 = !DILocation(line: 483, column: 29, scope: !2571)
!2638 = !DILocation(line: 483, column: 25, scope: !2571)
!2639 = !DILocation(line: 483, column: 6, scope: !2571)
!2640 = !DILocation(line: 483, column: 3, scope: !2571)
!2641 = !DILocation(line: 483, column: 10, scope: !2571)
!2642 = !DILocation(line: 484, column: 7, scope: !2571)
!2643 = !DILocation(line: 484, column: 10, scope: !2571)
!2644 = !DILocation(line: 484, column: 3, scope: !2571)
!2645 = !DILocation(line: 484, column: 14, scope: !2571)
!2646 = !DILocation(line: 485, column: 1, scope: !2571)
!2647 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2648, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2648 = !DISubroutineType(types: !2649)
!2649 = !{!23, !64}
!2650 = !DILocalVariable(name: "x", arg: 1, scope: !2647, file: !27, line: 22, type: !64)
!2651 = !DILocation(line: 0, scope: !2647)
!2652 = !DILocalVariable(name: "r", scope: !2647, file: !27, line: 24, type: !23)
!2653 = !DILocalVariable(name: "i", scope: !2647, file: !27, line: 23, type: !42)
!2654 = !DILocation(line: 26, column: 7, scope: !2655)
!2655 = distinct !DILexicalBlock(scope: !2647, file: !27, line: 26, column: 3)
!2656 = !DILocation(line: 26, scope: !2655)
!2657 = !DILocation(line: 26, column: 12, scope: !2658)
!2658 = distinct !DILexicalBlock(scope: !2655, file: !27, line: 26, column: 3)
!2659 = !DILocation(line: 26, column: 3, scope: !2655)
!2660 = !DILocation(line: 27, column: 20, scope: !2658)
!2661 = !DILocation(line: 27, column: 10, scope: !2658)
!2662 = !DILocation(line: 27, column: 29, scope: !2658)
!2663 = !DILocation(line: 27, column: 25, scope: !2658)
!2664 = !DILocation(line: 27, column: 7, scope: !2658)
!2665 = !DILocation(line: 27, column: 5, scope: !2658)
!2666 = !DILocation(line: 26, column: 16, scope: !2658)
!2667 = !DILocation(line: 26, column: 3, scope: !2658)
!2668 = distinct !{!2668, !2659, !2669, !259}
!2669 = !DILocation(line: 27, column: 30, scope: !2655)
!2670 = !DILocation(line: 29, column: 3, scope: !2647)
!2671 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2503, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2672 = !DILocalVariable(name: "out", arg: 1, scope: !2671, file: !27, line: 598, type: !60)
!2673 = !DILocation(line: 0, scope: !2671)
!2674 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2671, file: !27, line: 598, type: !1821)
!2675 = !DILocalVariable(name: "state", arg: 3, scope: !2671, file: !27, line: 598, type: !1900)
!2676 = !DILocation(line: 600, column: 45, scope: !2671)
!2677 = !DILocation(line: 600, column: 38, scope: !2671)
!2678 = !DILocation(line: 600, column: 3, scope: !2671)
!2679 = !DILocation(line: 601, column: 1, scope: !2671)
!2680 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2681, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2681 = !DISubroutineType(types: !2682)
!2682 = !{null, !60, !1821, !1917, !42}
!2683 = !DILocalVariable(name: "out", arg: 1, scope: !2680, file: !27, line: 500, type: !60)
!2684 = !DILocation(line: 0, scope: !2680)
!2685 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2680, file: !27, line: 501, type: !1821)
!2686 = !DILocalVariable(name: "s", arg: 3, scope: !2680, file: !27, line: 502, type: !1917)
!2687 = !DILocalVariable(name: "r", arg: 4, scope: !2680, file: !27, line: 503, type: !42)
!2688 = !DILocation(line: 507, column: 3, scope: !2680)
!2689 = !DILocation(line: 508, column: 5, scope: !2690)
!2690 = distinct !DILexicalBlock(scope: !2680, file: !27, line: 507, column: 18)
!2691 = !DILocalVariable(name: "i", scope: !2680, file: !27, line: 505, type: !42)
!2692 = !DILocation(line: 509, column: 9, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2690, file: !27, line: 509, column: 5)
!2694 = !DILocation(line: 509, scope: !2693)
!2695 = !DILocation(line: 509, column: 16, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2693, file: !27, line: 509, column: 5)
!2697 = !DILocation(line: 509, column: 14, scope: !2696)
!2698 = !DILocation(line: 509, column: 5, scope: !2693)
!2699 = !DILocation(line: 510, column: 20, scope: !2696)
!2700 = !DILocation(line: 510, column: 18, scope: !2696)
!2701 = !DILocation(line: 510, column: 24, scope: !2696)
!2702 = !DILocation(line: 510, column: 7, scope: !2696)
!2703 = !DILocation(line: 509, column: 20, scope: !2696)
!2704 = !DILocation(line: 509, column: 5, scope: !2696)
!2705 = distinct !{!2705, !2698, !2706, !259}
!2706 = !DILocation(line: 510, column: 28, scope: !2693)
!2707 = !DILocation(line: 511, column: 9, scope: !2690)
!2708 = !DILocation(line: 512, column: 13, scope: !2690)
!2709 = distinct !{!2709, !2688, !2710, !259}
!2710 = !DILocation(line: 513, column: 3, scope: !2680)
!2711 = !DILocation(line: 514, column: 1, scope: !2680)
!2712 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2713, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2713 = !DISubroutineType(types: !2714)
!2714 = !{null, !60, !23}
!2715 = !DILocalVariable(name: "x", arg: 1, scope: !2712, file: !27, line: 40, type: !60)
!2716 = !DILocation(line: 0, scope: !2712)
!2717 = !DILocalVariable(name: "u", arg: 2, scope: !2712, file: !27, line: 40, type: !23)
!2718 = !DILocalVariable(name: "i", scope: !2712, file: !27, line: 41, type: !42)
!2719 = !DILocation(line: 43, column: 7, scope: !2720)
!2720 = distinct !DILexicalBlock(scope: !2712, file: !27, line: 43, column: 3)
!2721 = !DILocation(line: 43, scope: !2720)
!2722 = !DILocation(line: 43, column: 12, scope: !2723)
!2723 = distinct !DILexicalBlock(scope: !2720, file: !27, line: 43, column: 3)
!2724 = !DILocation(line: 43, column: 3, scope: !2720)
!2725 = !DILocation(line: 44, column: 18, scope: !2723)
!2726 = !DILocation(line: 44, column: 14, scope: !2723)
!2727 = !DILocation(line: 44, column: 12, scope: !2723)
!2728 = !DILocation(line: 44, column: 5, scope: !2723)
!2729 = !DILocation(line: 44, column: 10, scope: !2723)
!2730 = !DILocation(line: 43, column: 16, scope: !2723)
!2731 = !DILocation(line: 43, column: 3, scope: !2723)
!2732 = distinct !{!2732, !2724, !2733, !259}
!2733 = !DILocation(line: 44, column: 19, scope: !2720)
!2734 = !DILocation(line: 45, column: 1, scope: !2712)
!2735 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !1898, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2736 = !DILocalVariable(name: "state", arg: 1, scope: !2735, file: !27, line: 610, type: !1900)
!2737 = !DILocation(line: 0, scope: !2735)
!2738 = !DILocation(line: 612, column: 22, scope: !2735)
!2739 = !DILocation(line: 612, column: 15, scope: !2735)
!2740 = !DILocation(line: 612, column: 3, scope: !2735)
!2741 = !DILocation(line: 613, column: 10, scope: !2735)
!2742 = !DILocation(line: 613, column: 14, scope: !2735)
!2743 = !DILocation(line: 614, column: 1, scope: !2735)
!2744 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !1935, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2745 = !DILocalVariable(name: "state", arg: 1, scope: !2744, file: !27, line: 625, type: !1900)
!2746 = !DILocation(line: 0, scope: !2744)
!2747 = !DILocalVariable(name: "in", arg: 2, scope: !2744, file: !27, line: 625, type: !64)
!2748 = !DILocalVariable(name: "inlen", arg: 3, scope: !2744, file: !27, line: 625, type: !1821)
!2749 = !DILocation(line: 627, column: 37, scope: !2744)
!2750 = !DILocation(line: 627, column: 30, scope: !2744)
!2751 = !DILocation(line: 627, column: 47, scope: !2744)
!2752 = !DILocation(line: 627, column: 16, scope: !2744)
!2753 = !DILocation(line: 627, column: 10, scope: !2744)
!2754 = !DILocation(line: 627, column: 14, scope: !2744)
!2755 = !DILocation(line: 628, column: 1, scope: !2744)
!2756 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !1898, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2757 = !DILocalVariable(name: "state", arg: 1, scope: !2756, file: !27, line: 637, type: !1900)
!2758 = !DILocation(line: 0, scope: !2756)
!2759 = !DILocation(line: 639, column: 26, scope: !2756)
!2760 = !DILocation(line: 639, column: 19, scope: !2756)
!2761 = !DILocation(line: 639, column: 36, scope: !2756)
!2762 = !DILocation(line: 639, column: 3, scope: !2756)
!2763 = !DILocation(line: 640, column: 10, scope: !2756)
!2764 = !DILocation(line: 640, column: 14, scope: !2756)
!2765 = !DILocation(line: 641, column: 1, scope: !2756)
!2766 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2503, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2767 = !DILocalVariable(name: "out", arg: 1, scope: !2766, file: !27, line: 653, type: !60)
!2768 = !DILocation(line: 0, scope: !2766)
!2769 = !DILocalVariable(name: "outlen", arg: 2, scope: !2766, file: !27, line: 653, type: !1821)
!2770 = !DILocalVariable(name: "state", arg: 3, scope: !2766, file: !27, line: 653, type: !1900)
!2771 = !DILocation(line: 655, column: 51, scope: !2766)
!2772 = !DILocation(line: 655, column: 44, scope: !2766)
!2773 = !DILocation(line: 655, column: 61, scope: !2766)
!2774 = !DILocation(line: 655, column: 16, scope: !2766)
!2775 = !DILocation(line: 655, column: 10, scope: !2766)
!2776 = !DILocation(line: 655, column: 14, scope: !2766)
!2777 = !DILocation(line: 656, column: 1, scope: !2766)
!2778 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !1935, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2779 = !DILocalVariable(name: "state", arg: 1, scope: !2778, file: !27, line: 667, type: !1900)
!2780 = !DILocation(line: 0, scope: !2778)
!2781 = !DILocalVariable(name: "in", arg: 2, scope: !2778, file: !27, line: 667, type: !64)
!2782 = !DILocalVariable(name: "inlen", arg: 3, scope: !2778, file: !27, line: 667, type: !1821)
!2783 = !DILocation(line: 669, column: 29, scope: !2778)
!2784 = !DILocation(line: 669, column: 22, scope: !2778)
!2785 = !DILocation(line: 669, column: 3, scope: !2778)
!2786 = !DILocation(line: 670, column: 10, scope: !2778)
!2787 = !DILocation(line: 670, column: 14, scope: !2778)
!2788 = !DILocation(line: 671, column: 1, scope: !2778)
!2789 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2503, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2790 = !DILocalVariable(name: "out", arg: 1, scope: !2789, file: !27, line: 685, type: !60)
!2791 = !DILocation(line: 0, scope: !2789)
!2792 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2789, file: !27, line: 685, type: !1821)
!2793 = !DILocalVariable(name: "state", arg: 3, scope: !2789, file: !27, line: 685, type: !1900)
!2794 = !DILocation(line: 687, column: 45, scope: !2789)
!2795 = !DILocation(line: 687, column: 38, scope: !2789)
!2796 = !DILocation(line: 687, column: 3, scope: !2789)
!2797 = !DILocation(line: 688, column: 1, scope: !2789)
!2798 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2799, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2799 = !DISubroutineType(types: !2800)
!2800 = !{null, !60, !1821, !64, !1821}
!2801 = !DILocalVariable(name: "out", arg: 1, scope: !2798, file: !27, line: 700, type: !60)
!2802 = !DILocation(line: 0, scope: !2798)
!2803 = !DILocalVariable(name: "outlen", arg: 2, scope: !2798, file: !27, line: 700, type: !1821)
!2804 = !DILocalVariable(name: "in", arg: 3, scope: !2798, file: !27, line: 700, type: !64)
!2805 = !DILocalVariable(name: "inlen", arg: 4, scope: !2798, file: !27, line: 700, type: !1821)
!2806 = !DILocalVariable(name: "state", scope: !2798, file: !27, line: 703, type: !1901)
!2807 = !DILocation(line: 703, column: 16, scope: !2798)
!2808 = !DILocation(line: 705, column: 3, scope: !2798)
!2809 = !DILocation(line: 706, column: 19, scope: !2798)
!2810 = !DILocalVariable(name: "nblocks", scope: !2798, file: !27, line: 702, type: !1821)
!2811 = !DILocation(line: 707, column: 3, scope: !2798)
!2812 = !DILocation(line: 708, column: 20, scope: !2798)
!2813 = !DILocation(line: 708, column: 10, scope: !2798)
!2814 = !DILocation(line: 709, column: 17, scope: !2798)
!2815 = !DILocation(line: 709, column: 7, scope: !2798)
!2816 = !DILocation(line: 710, column: 3, scope: !2798)
!2817 = !DILocation(line: 711, column: 1, scope: !2798)
!2818 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2799, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2819 = !DILocalVariable(name: "out", arg: 1, scope: !2818, file: !27, line: 723, type: !60)
!2820 = !DILocation(line: 0, scope: !2818)
!2821 = !DILocalVariable(name: "outlen", arg: 2, scope: !2818, file: !27, line: 723, type: !1821)
!2822 = !DILocalVariable(name: "in", arg: 3, scope: !2818, file: !27, line: 723, type: !64)
!2823 = !DILocalVariable(name: "inlen", arg: 4, scope: !2818, file: !27, line: 723, type: !1821)
!2824 = !DILocalVariable(name: "state", scope: !2818, file: !27, line: 726, type: !1901)
!2825 = !DILocation(line: 726, column: 16, scope: !2818)
!2826 = !DILocation(line: 728, column: 3, scope: !2818)
!2827 = !DILocation(line: 729, column: 19, scope: !2818)
!2828 = !DILocalVariable(name: "nblocks", scope: !2818, file: !27, line: 725, type: !1821)
!2829 = !DILocation(line: 730, column: 3, scope: !2818)
!2830 = !DILocation(line: 731, column: 20, scope: !2818)
!2831 = !DILocation(line: 731, column: 10, scope: !2818)
!2832 = !DILocation(line: 732, column: 17, scope: !2818)
!2833 = !DILocation(line: 732, column: 7, scope: !2818)
!2834 = !DILocation(line: 733, column: 3, scope: !2818)
!2835 = !DILocation(line: 734, column: 1, scope: !2818)
!2836 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2837, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2837 = !DISubroutineType(types: !2838)
!2838 = !{null, !60, !64, !1821}
!2839 = !DILocalVariable(name: "h", arg: 1, scope: !2836, file: !27, line: 745, type: !60)
!2840 = !DILocation(line: 0, scope: !2836)
!2841 = !DILocalVariable(name: "in", arg: 2, scope: !2836, file: !27, line: 745, type: !64)
!2842 = !DILocalVariable(name: "inlen", arg: 3, scope: !2836, file: !27, line: 745, type: !1821)
!2843 = !DILocalVariable(name: "s", scope: !2836, file: !27, line: 748, type: !211)
!2844 = !DILocation(line: 748, column: 12, scope: !2836)
!2845 = !DILocation(line: 750, column: 22, scope: !2836)
!2846 = !DILocation(line: 750, column: 3, scope: !2836)
!2847 = !DILocation(line: 751, column: 28, scope: !2836)
!2848 = !DILocation(line: 751, column: 3, scope: !2836)
!2849 = !DILocalVariable(name: "i", scope: !2836, file: !27, line: 747, type: !42)
!2850 = !DILocation(line: 752, column: 7, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2836, file: !27, line: 752, column: 3)
!2852 = !DILocation(line: 752, scope: !2851)
!2853 = !DILocation(line: 752, column: 12, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2851, file: !27, line: 752, column: 3)
!2855 = !DILocation(line: 752, column: 3, scope: !2851)
!2856 = !DILocation(line: 753, column: 16, scope: !2854)
!2857 = !DILocation(line: 753, column: 14, scope: !2854)
!2858 = !DILocation(line: 753, column: 19, scope: !2854)
!2859 = !DILocation(line: 753, column: 5, scope: !2854)
!2860 = !DILocation(line: 752, column: 16, scope: !2854)
!2861 = !DILocation(line: 752, column: 3, scope: !2854)
!2862 = distinct !{!2862, !2855, !2863, !259}
!2863 = !DILocation(line: 753, column: 23, scope: !2851)
!2864 = !DILocation(line: 754, column: 1, scope: !2836)
!2865 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2837, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2866 = !DILocalVariable(name: "h", arg: 1, scope: !2865, file: !27, line: 765, type: !60)
!2867 = !DILocation(line: 0, scope: !2865)
!2868 = !DILocalVariable(name: "in", arg: 2, scope: !2865, file: !27, line: 765, type: !64)
!2869 = !DILocalVariable(name: "inlen", arg: 3, scope: !2865, file: !27, line: 765, type: !1821)
!2870 = !DILocalVariable(name: "s", scope: !2865, file: !27, line: 768, type: !211)
!2871 = !DILocation(line: 768, column: 12, scope: !2865)
!2872 = !DILocation(line: 770, column: 22, scope: !2865)
!2873 = !DILocation(line: 770, column: 3, scope: !2865)
!2874 = !DILocation(line: 771, column: 28, scope: !2865)
!2875 = !DILocation(line: 771, column: 3, scope: !2865)
!2876 = !DILocalVariable(name: "i", scope: !2865, file: !27, line: 767, type: !42)
!2877 = !DILocation(line: 772, column: 7, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2865, file: !27, line: 772, column: 3)
!2879 = !DILocation(line: 772, scope: !2878)
!2880 = !DILocation(line: 772, column: 12, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2878, file: !27, line: 772, column: 3)
!2882 = !DILocation(line: 772, column: 3, scope: !2878)
!2883 = !DILocation(line: 773, column: 16, scope: !2881)
!2884 = !DILocation(line: 773, column: 14, scope: !2881)
!2885 = !DILocation(line: 773, column: 19, scope: !2881)
!2886 = !DILocation(line: 773, column: 5, scope: !2881)
!2887 = !DILocation(line: 772, column: 16, scope: !2881)
!2888 = !DILocation(line: 772, column: 3, scope: !2881)
!2889 = distinct !{!2889, !2882, !2890, !259}
!2890 = !DILocation(line: 773, column: 23, scope: !2878)
!2891 = !DILocation(line: 774, column: 1, scope: !2865)
!2892 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2893, file: !2893, line: 18, type: !2894, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2893 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!2894 = !DISubroutineType(types: !2895)
!2895 = !{null, !2896, !64, !61, !61}
!2896 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2897, size: 32)
!2897 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !2898)
!2898 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !2899)
!2899 = !{!2900, !2901}
!2900 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2898, file: !207, line: 15, baseType: !211, size: 1600)
!2901 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2898, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!2902 = !DILocalVariable(name: "state", arg: 1, scope: !2892, file: !2893, line: 18, type: !2896)
!2903 = !DILocation(line: 0, scope: !2892)
!2904 = !DILocalVariable(name: "seed", arg: 2, scope: !2892, file: !2893, line: 19, type: !64)
!2905 = !DILocalVariable(name: "x", arg: 3, scope: !2892, file: !2893, line: 20, type: !61)
!2906 = !DILocalVariable(name: "y", arg: 4, scope: !2892, file: !2893, line: 21, type: !61)
!2907 = !DILocalVariable(name: "extseed", scope: !2892, file: !2893, line: 23, type: !2908)
!2908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !2909)
!2909 = !{!2910}
!2910 = !DISubrange(count: 34)
!2911 = !DILocation(line: 23, column: 11, scope: !2892)
!2912 = !DILocation(line: 25, column: 10, scope: !2892)
!2913 = !DILocation(line: 25, column: 3, scope: !2892)
!2914 = !DILocation(line: 26, column: 3, scope: !2892)
!2915 = !DILocation(line: 26, column: 29, scope: !2892)
!2916 = !DILocation(line: 27, column: 3, scope: !2892)
!2917 = !DILocation(line: 27, column: 29, scope: !2892)
!2918 = !DILocation(line: 29, column: 31, scope: !2892)
!2919 = !DILocation(line: 29, column: 3, scope: !2892)
!2920 = !DILocation(line: 30, column: 1, scope: !2892)
!2921 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2893, file: !2893, line: 43, type: !2922, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2922 = !DISubroutineType(types: !2923)
!2923 = !{null, !60, !1821, !64, !61}
!2924 = !DILocalVariable(name: "out", arg: 1, scope: !2921, file: !2893, line: 43, type: !60)
!2925 = !DILocation(line: 0, scope: !2921)
!2926 = !DILocalVariable(name: "outlen", arg: 2, scope: !2921, file: !2893, line: 43, type: !1821)
!2927 = !DILocalVariable(name: "key", arg: 3, scope: !2921, file: !2893, line: 43, type: !64)
!2928 = !DILocalVariable(name: "nonce", arg: 4, scope: !2921, file: !2893, line: 43, type: !61)
!2929 = !DILocalVariable(name: "extkey", scope: !2921, file: !2893, line: 45, type: !2930)
!2930 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !2931)
!2931 = !{!2932}
!2932 = !DISubrange(count: 33)
!2933 = !DILocation(line: 45, column: 11, scope: !2921)
!2934 = !DILocation(line: 47, column: 10, scope: !2921)
!2935 = !DILocation(line: 47, column: 3, scope: !2921)
!2936 = !DILocation(line: 48, column: 3, scope: !2921)
!2937 = !DILocation(line: 48, column: 26, scope: !2921)
!2938 = !DILocation(line: 50, column: 25, scope: !2921)
!2939 = !DILocation(line: 50, column: 3, scope: !2921)
!2940 = !DILocation(line: 51, column: 1, scope: !2921)
!2941 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2893, file: !2893, line: 64, type: !546, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2942 = !DILocalVariable(name: "out", arg: 1, scope: !2941, file: !2893, line: 64, type: !60)
!2943 = !DILocation(line: 0, scope: !2941)
!2944 = !DILocalVariable(name: "key", arg: 2, scope: !2941, file: !2893, line: 64, type: !64)
!2945 = !DILocalVariable(name: "input", arg: 3, scope: !2941, file: !2893, line: 64, type: !64)
!2946 = !DILocalVariable(name: "s", scope: !2941, file: !2893, line: 66, type: !2897)
!2947 = !DILocation(line: 66, column: 16, scope: !2941)
!2948 = !DILocation(line: 68, column: 3, scope: !2941)
!2949 = !DILocation(line: 69, column: 3, scope: !2941)
!2950 = !DILocation(line: 70, column: 3, scope: !2941)
!2951 = !DILocation(line: 71, column: 3, scope: !2941)
!2952 = !DILocation(line: 72, column: 3, scope: !2941)
!2953 = !DILocation(line: 73, column: 1, scope: !2941)
