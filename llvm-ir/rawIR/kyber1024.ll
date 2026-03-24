; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [4 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber1024_ref_zetas = dso_local constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #2, !dbg !71
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1536, !dbg !72
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1568) #2, !dbg !73
  %add.ptr1 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !74
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr1, i32 -64, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr2, ptr noundef %pk, i32 noundef 1568) #2, !dbg !74
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !75
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -32, !dbg !76
  %add.ptr5 = getelementptr inbounds i8, ptr %coins, i32 32, !dbg !77
  %call6 = call ptr @memcpy(ptr noundef %add.ptr4, ptr noundef %add.ptr5, i32 noundef 32) #2, !dbg !78
  ret i32 0, !dbg !79
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) #0 !dbg !80 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !83, !DIExpression(), !84)
    #dbg_value(ptr %sk, !85, !DIExpression(), !84)
    #dbg_declare(ptr %coins, !86, !DIExpression(), !90)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !91
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 64) #2, !dbg !92
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !93
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %arraydecay1) #2, !dbg !94
  ret i32 0, !dbg !95
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) #0 !dbg !96 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1568) #2, !dbg !110
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !111
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !111
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay2, ptr noundef %arraydecay3, i32 noundef 64) #2, !dbg !111
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !112
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !113
  %add.ptr6 = getelementptr inbounds i8, ptr %arraydecay5, i32 32, !dbg !114
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef %arraydecay4, ptr noundef %pk, ptr noundef %add.ptr6) #2, !dbg !115
  %arraydecay7 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !116
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef %arraydecay7, i32 noundef 32) #2, !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) #0 !dbg !119 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !120, !DIExpression(), !121)
    #dbg_value(ptr %ss, !122, !DIExpression(), !121)
    #dbg_value(ptr %pk, !123, !DIExpression(), !121)
    #dbg_declare(ptr %coins, !124, !DIExpression(), !128)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !129
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 32) #2, !dbg !130
  %arraydecay1 = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !131
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %arraydecay1) #2, !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) #0 !dbg !134 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !137, !DIExpression(), !138)
    #dbg_value(ptr %ct, !139, !DIExpression(), !138)
    #dbg_value(ptr %sk, !140, !DIExpression(), !138)
    #dbg_declare(ptr %buf, !141, !DIExpression(), !142)
    #dbg_declare(ptr %kr, !143, !DIExpression(), !144)
    #dbg_declare(ptr %cmp, !145, !DIExpression(), !149)
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1536, !dbg !150
    #dbg_value(ptr %add.ptr, !151, !DIExpression(), !138)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !152
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %arraydecay, ptr noundef %ct, ptr noundef %sk) #2, !dbg !153
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !154
  %add.ptr2 = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !155
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !156
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -64, !dbg !157
  %call = call ptr @memcpy(ptr noundef %add.ptr2, ptr noundef %add.ptr4, i32 noundef 32) #2, !dbg !158
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !159
  %arraydecay6 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !159
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay5, ptr noundef %arraydecay6, i32 noundef 64) #2, !dbg !159
  %arraydecay7 = getelementptr inbounds [1568 x i8], ptr %cmp, i32 0, i32 0, !dbg !160
  %arraydecay8 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !161
  %arraydecay9 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !162
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i32 32, !dbg !163
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %add.ptr, ptr noundef %add.ptr10) #2, !dbg !164
  %arraydecay11 = getelementptr inbounds [1568 x i8], ptr %cmp, i32 0, i32 0, !dbg !165
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef %arraydecay11, i32 noundef 1568) #2, !dbg !166
    #dbg_value(i32 %call12, !167, !DIExpression(), !138)
  %add.ptr13 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !168
  %add.ptr14 = getelementptr inbounds i8, ptr %add.ptr13, i32 -32, !dbg !168
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef %add.ptr14, ptr noundef %ct) #2, !dbg !168
  %arraydecay15 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !169
  %tobool = icmp ne i32 %call12, 0, !dbg !170
  %lnot = xor i1 %tobool, true, !dbg !170
  %lnot.ext = zext i1 %lnot to i32, !dbg !170
  %conv = trunc i32 %lnot.ext to i8, !dbg !170
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef %arraydecay15, i32 noundef 32, i8 noundef zeroext %conv) #2, !dbg !171
  ret i32 0, !dbg !172
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) #0 !dbg !173 {
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
  %cmp = icmp ult i32 %i.0, 4, !dbg !220
  br i1 %cmp, label %for.body, label %for.end22, !dbg !222

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !223, !DIExpression(), !195)
  br label %for.cond1, !dbg !224

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !227
    #dbg_value(i32 %j.0, !223, !DIExpression(), !195)
  %cmp2 = icmp ult i32 %j.0, 4, !dbg !228
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !230

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %transposed, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %for.body3
  %conv = trunc i32 %i.0 to i8, !dbg !234
  %conv4 = trunc i32 %j.0 to i8, !dbg !234
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #2, !dbg !234
  br label %if.end, !dbg !234

if.else:                                          ; preds = %for.body3
  %conv5 = trunc i32 %j.0 to i8, !dbg !235
  %conv6 = trunc i32 %i.0 to i8, !dbg !235
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #2, !dbg !235
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !236
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay, i32 noundef 3, ptr noundef %state) #2, !dbg !236
    #dbg_value(i32 504, !237, !DIExpression(), !195)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !238
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx, i32 0, i32 0, !dbg !239
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %j.0, !dbg !238
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
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec14, i32 0, i32 %j.0, !dbg !249
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
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !329 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
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
  store i8 4, ptr %arrayidx, align 1, !dbg !356
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay3, ptr noundef %arraydecay4, i32 noundef 33) #2, !dbg !357
  %arraydecay5 = getelementptr inbounds [4 x %struct.polyvec], ptr %a, i32 0, i32 0, !dbg !358
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %arraydecay5, ptr noundef %arraydecay, i32 noundef 0) #2, !dbg !358
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond, !dbg !360

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !362
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !333
    #dbg_value(i8 %nonce.0, !343, !DIExpression(), !333)
    #dbg_value(i32 %i.0, !359, !DIExpression(), !333)
  %cmp = icmp ult i32 %i.0, 4, !dbg !363
  br i1 %cmp, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %skpv, i32 0, i32 0, !dbg !366
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !367
  %inc = add i8 %nonce.0, 1, !dbg !368
    #dbg_value(i8 %inc, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %arrayidx6, ptr noundef %add.ptr, i8 noundef zeroext %nonce.0) #2, !dbg !369
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
  %cmp9 = icmp ult i32 %i.1, 4, !dbg !377
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !379

for.body10:                                       ; preds = %for.cond8
  %vec11 = getelementptr inbounds nuw %struct.polyvec, ptr %e, i32 0, i32 0, !dbg !380
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec11, i32 0, i32 %i.1, !dbg !381
  %inc13 = add i8 %nonce.1, 1, !dbg !382
    #dbg_value(i8 %inc13, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %arrayidx12, ptr noundef %add.ptr, i8 noundef zeroext %nonce.1) #2, !dbg !383
  br label %for.inc14, !dbg !383

for.inc14:                                        ; preds = %for.body10
  %inc15 = add i32 %i.1, 1, !dbg !384
    #dbg_value(i32 %inc15, !359, !DIExpression(), !333)
  br label %for.cond8, !dbg !385, !llvm.loop !386

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %skpv) #2, !dbg !388
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %e) #2, !dbg !389
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !390

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.inc25 ], !dbg !392
    #dbg_value(i32 %i.2, !359, !DIExpression(), !333)
  %cmp18 = icmp ult i32 %i.2, 4, !dbg !393
  br i1 %cmp18, label %for.body19, label %for.end27, !dbg !395

for.body19:                                       ; preds = %for.cond17
  %vec20 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !396
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec20, i32 0, i32 %i.2, !dbg !398
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !399
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx21, ptr noundef %arrayidx22, ptr noundef %skpv) #2, !dbg !400
  %vec23 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !401
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec23, i32 0, i32 %i.2, !dbg !402
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %arrayidx24) #2, !dbg !403
  br label %for.inc25, !dbg !404

for.inc25:                                        ; preds = %for.body19
  %inc26 = add i32 %i.2, 1, !dbg !405
    #dbg_value(i32 %inc26, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !406, !llvm.loop !407

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %pkpv, ptr noundef %pkpv, ptr noundef %e) #2, !dbg !409
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %pkpv) #2, !dbg !410
  call void @pack_sk(ptr noundef %sk, ptr noundef %skpv) #2, !dbg !411
  call void @pack_pk(ptr noundef %pk, ptr noundef %pkpv, ptr noundef %arraydecay) #2, !dbg !412
  ret void, !dbg !413
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_sk(ptr noundef %r, ptr noundef %sk) #0 !dbg !414 {
entry:
    #dbg_value(ptr %r, !417, !DIExpression(), !418)
    #dbg_value(ptr %sk, !419, !DIExpression(), !418)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #2, !dbg !420
  ret void, !dbg !421
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) #0 !dbg !422 {
entry:
    #dbg_value(ptr %r, !425, !DIExpression(), !426)
    #dbg_value(ptr %pk, !427, !DIExpression(), !426)
    #dbg_value(ptr %seed, !428, !DIExpression(), !426)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #2, !dbg !429
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 1536, !dbg !430
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %seed, i32 noundef 32) #2, !dbg !431
  ret void, !dbg !432
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) #0 !dbg !433 {
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
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %k, ptr noundef %m) #2, !dbg !462
  %arraydecay1 = getelementptr inbounds [4 x %struct.polyvec], ptr %at, i32 0, i32 0, !dbg !463
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !463
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %arraydecay1, ptr noundef %arraydecay2, i32 noundef 1) #2, !dbg !463
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond, !dbg !465

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ], !dbg !467
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !437
    #dbg_value(i8 %nonce.0, !443, !DIExpression(), !437)
    #dbg_value(i32 %i.0, !464, !DIExpression(), !437)
  %cmp = icmp ult i32 %i.0, 4, !dbg !468
  br i1 %cmp, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %sp, i32 0, i32 0, !dbg !471
  %arraydecay3 = getelementptr inbounds [4 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !472
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %arraydecay3, i32 %i.0, !dbg !473
  %inc = add i8 %nonce.0, 1, !dbg !474
    #dbg_value(i8 %inc, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #2, !dbg !475
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
  %cmp6 = icmp ult i32 %i.1, 4, !dbg !483
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !485

for.body7:                                        ; preds = %for.cond5
  %vec8 = getelementptr inbounds nuw %struct.polyvec, ptr %ep, i32 0, i32 0, !dbg !486
  %arraydecay9 = getelementptr inbounds [4 x %struct.poly], ptr %vec8, i32 0, i32 0, !dbg !487
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %arraydecay9, i32 %i.1, !dbg !488
  %inc11 = add i8 %nonce.1, 1, !dbg !489
    #dbg_value(i8 %inc11, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !490
  br label %for.inc12, !dbg !490

for.inc12:                                        ; preds = %for.body7
  %inc13 = add i32 %i.1, 1, !dbg !491
    #dbg_value(i32 %inc13, !464, !DIExpression(), !437)
  br label %for.cond5, !dbg !492, !llvm.loop !493

for.end14:                                        ; preds = %for.cond5
  %inc15 = add i8 %nonce.1, 1, !dbg !495
    #dbg_value(i8 %inc15, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %epp, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !496
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %sp) #2, !dbg !497
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !498

for.cond16:                                       ; preds = %for.inc21, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.inc21 ], !dbg !500
    #dbg_value(i32 %i.2, !464, !DIExpression(), !437)
  %cmp17 = icmp ult i32 %i.2, 4, !dbg !501
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !503

for.body18:                                       ; preds = %for.cond16
  %vec19 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !504
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec19, i32 0, i32 %i.2, !dbg !505
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !506
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx, ptr noundef %arrayidx20, ptr noundef %sp) #2, !dbg !507
  br label %for.inc21, !dbg !507

for.inc21:                                        ; preds = %for.body18
  %inc22 = add i32 %i.2, 1, !dbg !508
    #dbg_value(i32 %inc22, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !509, !llvm.loop !510

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %v, ptr noundef %pkpv, ptr noundef %sp) #2, !dbg !512
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %b) #2, !dbg !513
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %v) #2, !dbg !514
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %b, ptr noundef %b, ptr noundef %ep) #2, !dbg !515
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %epp) #2, !dbg !516
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %k) #2, !dbg !517
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %b) #2, !dbg !518
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %v) #2, !dbg !519
  call void @pack_ciphertext(ptr noundef %c, ptr noundef %b, ptr noundef %v) #2, !dbg !520
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) #0 !dbg !522 {
entry:
    #dbg_value(ptr %pk, !525, !DIExpression(), !526)
    #dbg_value(ptr %seed, !527, !DIExpression(), !526)
    #dbg_value(ptr %packedpk, !528, !DIExpression(), !526)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #2, !dbg !529
  %add.ptr = getelementptr inbounds i8, ptr %packedpk, i32 1536, !dbg !530
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef %add.ptr, i32 noundef 32) #2, !dbg !531
  ret void, !dbg !532
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) #0 !dbg !533 {
entry:
    #dbg_value(ptr %r, !537, !DIExpression(), !538)
    #dbg_value(ptr %b, !539, !DIExpression(), !538)
    #dbg_value(ptr %v, !540, !DIExpression(), !538)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #2, !dbg !541
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 1408, !dbg !542
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %add.ptr, ptr noundef %v) #2, !dbg !543
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) #0 !dbg !545 {
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
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %b) #2, !dbg !562
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %mp, ptr noundef %skpv, ptr noundef %b) #2, !dbg !563
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %mp) #2, !dbg !564
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %mp, ptr noundef %v, ptr noundef %mp) #2, !dbg !565
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %mp) #2, !dbg !566
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef %mp) #2, !dbg !567
  ret void, !dbg !568
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #0 !dbg !569 {
entry:
    #dbg_value(ptr %b, !572, !DIExpression(), !573)
    #dbg_value(ptr %v, !574, !DIExpression(), !573)
    #dbg_value(ptr %c, !575, !DIExpression(), !573)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #2, !dbg !576
  %add.ptr = getelementptr inbounds i8, ptr %c, i32 1408, !dbg !577
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %v, ptr noundef %add.ptr) #2, !dbg !578
  ret void, !dbg !579
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) #0 !dbg !580 {
entry:
    #dbg_value(ptr %sk, !583, !DIExpression(), !584)
    #dbg_value(ptr %packedsk, !585, !DIExpression(), !584)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #2, !dbg !586
  ret void, !dbg !587
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !588 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !603, !DIExpression(), !604)
    #dbg_value(ptr %a, !605, !DIExpression(), !604)
    #dbg_declare(ptr %t, !606, !DIExpression(), !610)
    #dbg_value(i32 0, !611, !DIExpression(), !604)
  br label %for.cond, !dbg !612

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !614
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !603, !DIExpression(), !604)
    #dbg_value(i32 %i.0, !611, !DIExpression(), !604)
  %cmp = icmp ult i32 %i.0, 4, !dbg !615
  br i1 %cmp, label %for.body, label %for.end109, !dbg !617

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !618, !DIExpression(), !604)
  br label %for.cond1, !dbg !619

for.cond1:                                        ; preds = %for.inc104, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc105, %for.inc104 ], !dbg !622
  %r.addr.1 = phi ptr [ %r.addr.0, %for.body ], [ %add.ptr, %for.inc104 ]
    #dbg_value(ptr %r.addr.1, !603, !DIExpression(), !604)
    #dbg_value(i32 %j.0, !618, !DIExpression(), !604)
  %cmp2 = icmp ult i32 %j.0, 32, !dbg !623
  br i1 %cmp2, label %for.body3, label %for.end106, !dbg !625

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 0, !626, !DIExpression(), !604)
  br label %for.cond4, !dbg !627

for.cond4:                                        ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !630
    #dbg_value(i32 %k.0, !626, !DIExpression(), !604)
  %cmp5 = icmp ult i32 %k.0, 8, !dbg !631
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !633

for.body6:                                        ; preds = %for.cond4
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !634
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !636
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx, i32 0, i32 0, !dbg !637
  %mul = mul i32 8, %j.0, !dbg !638
  %add = add i32 %mul, %k.0, !dbg !639
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !636
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !636
  %arrayidx8 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !640
  store i16 %0, ptr %arrayidx8, align 2, !dbg !641
  %arrayidx9 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !642
  %1 = load i16, ptr %arrayidx9, align 2, !dbg !642
  %conv = sext i16 %1 to i32, !dbg !643
  %shr = ashr i32 %conv, 15, !dbg !644
  %and = and i32 %shr, 3329, !dbg !645
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !646
  %2 = load i16, ptr %arrayidx10, align 2, !dbg !647
  %conv11 = zext i16 %2 to i32, !dbg !647
  %add12 = add nsw i32 %conv11, %and, !dbg !647
  %conv13 = trunc i32 %add12 to i16, !dbg !647
  store i16 %conv13, ptr %arrayidx10, align 2, !dbg !647
  %arrayidx14 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !648
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !648
  %conv15 = zext i16 %3 to i64, !dbg !648
    #dbg_value(i64 %conv15, !649, !DIExpression(), !604)
  %shl = shl i64 %conv15, 11, !dbg !650
    #dbg_value(i64 %shl, !649, !DIExpression(), !604)
  %add16 = add i64 %shl, 1664, !dbg !651
    #dbg_value(i64 %add16, !649, !DIExpression(), !604)
  %mul17 = mul i64 %add16, 645084, !dbg !652
    #dbg_value(i64 %mul17, !649, !DIExpression(), !604)
  %shr18 = lshr i64 %mul17, 31, !dbg !653
    #dbg_value(i64 %shr18, !649, !DIExpression(), !604)
  %and19 = and i64 %shr18, 2047, !dbg !654
  %conv20 = trunc i64 %and19 to i16, !dbg !655
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !656
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !657
  br label %for.inc, !dbg !658

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %k.0, 1, !dbg !659
    #dbg_value(i32 %inc, !626, !DIExpression(), !604)
  br label %for.cond4, !dbg !660, !llvm.loop !661

for.end:                                          ; preds = %for.cond4
  %arrayidx22 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !663
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !663
  %conv23 = zext i16 %4 to i32, !dbg !663
  %shr24 = ashr i32 %conv23, 0, !dbg !664
  %conv25 = trunc i32 %shr24 to i8, !dbg !665
  %arrayidx26 = getelementptr inbounds i8, ptr %r.addr.1, i32 0, !dbg !666
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !667
  %arrayidx27 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !668
  %5 = load i16, ptr %arrayidx27, align 2, !dbg !668
  %conv28 = zext i16 %5 to i32, !dbg !668
  %shr29 = ashr i32 %conv28, 8, !dbg !669
  %arrayidx30 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !670
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !670
  %conv31 = zext i16 %6 to i32, !dbg !670
  %shl32 = shl i32 %conv31, 3, !dbg !671
  %or = or i32 %shr29, %shl32, !dbg !672
  %conv33 = trunc i32 %or to i8, !dbg !673
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.1, i32 1, !dbg !674
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !675
  %arrayidx35 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !676
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !676
  %conv36 = zext i16 %7 to i32, !dbg !676
  %shr37 = ashr i32 %conv36, 5, !dbg !677
  %arrayidx38 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !678
  %8 = load i16, ptr %arrayidx38, align 2, !dbg !678
  %conv39 = zext i16 %8 to i32, !dbg !678
  %shl40 = shl i32 %conv39, 6, !dbg !679
  %or41 = or i32 %shr37, %shl40, !dbg !680
  %conv42 = trunc i32 %or41 to i8, !dbg !681
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.1, i32 2, !dbg !682
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !683
  %arrayidx44 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !684
  %9 = load i16, ptr %arrayidx44, align 2, !dbg !684
  %conv45 = zext i16 %9 to i32, !dbg !684
  %shr46 = ashr i32 %conv45, 2, !dbg !685
  %conv47 = trunc i32 %shr46 to i8, !dbg !686
  %arrayidx48 = getelementptr inbounds i8, ptr %r.addr.1, i32 3, !dbg !687
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !688
  %arrayidx49 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !689
  %10 = load i16, ptr %arrayidx49, align 2, !dbg !689
  %conv50 = zext i16 %10 to i32, !dbg !689
  %shr51 = ashr i32 %conv50, 10, !dbg !690
  %arrayidx52 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !691
  %11 = load i16, ptr %arrayidx52, align 2, !dbg !691
  %conv53 = zext i16 %11 to i32, !dbg !691
  %shl54 = shl i32 %conv53, 1, !dbg !692
  %or55 = or i32 %shr51, %shl54, !dbg !693
  %conv56 = trunc i32 %or55 to i8, !dbg !694
  %arrayidx57 = getelementptr inbounds i8, ptr %r.addr.1, i32 4, !dbg !695
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !696
  %arrayidx58 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !697
  %12 = load i16, ptr %arrayidx58, align 2, !dbg !697
  %conv59 = zext i16 %12 to i32, !dbg !697
  %shr60 = ashr i32 %conv59, 7, !dbg !698
  %arrayidx61 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !699
  %13 = load i16, ptr %arrayidx61, align 2, !dbg !699
  %conv62 = zext i16 %13 to i32, !dbg !699
  %shl63 = shl i32 %conv62, 4, !dbg !700
  %or64 = or i32 %shr60, %shl63, !dbg !701
  %conv65 = trunc i32 %or64 to i8, !dbg !702
  %arrayidx66 = getelementptr inbounds i8, ptr %r.addr.1, i32 5, !dbg !703
  store i8 %conv65, ptr %arrayidx66, align 1, !dbg !704
  %arrayidx67 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !705
  %14 = load i16, ptr %arrayidx67, align 2, !dbg !705
  %conv68 = zext i16 %14 to i32, !dbg !705
  %shr69 = ashr i32 %conv68, 4, !dbg !706
  %arrayidx70 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !707
  %15 = load i16, ptr %arrayidx70, align 2, !dbg !707
  %conv71 = zext i16 %15 to i32, !dbg !707
  %shl72 = shl i32 %conv71, 7, !dbg !708
  %or73 = or i32 %shr69, %shl72, !dbg !709
  %conv74 = trunc i32 %or73 to i8, !dbg !710
  %arrayidx75 = getelementptr inbounds i8, ptr %r.addr.1, i32 6, !dbg !711
  store i8 %conv74, ptr %arrayidx75, align 1, !dbg !712
  %arrayidx76 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !713
  %16 = load i16, ptr %arrayidx76, align 2, !dbg !713
  %conv77 = zext i16 %16 to i32, !dbg !713
  %shr78 = ashr i32 %conv77, 1, !dbg !714
  %conv79 = trunc i32 %shr78 to i8, !dbg !715
  %arrayidx80 = getelementptr inbounds i8, ptr %r.addr.1, i32 7, !dbg !716
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !717
  %arrayidx81 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !718
  %17 = load i16, ptr %arrayidx81, align 2, !dbg !718
  %conv82 = zext i16 %17 to i32, !dbg !718
  %shr83 = ashr i32 %conv82, 9, !dbg !719
  %arrayidx84 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !720
  %18 = load i16, ptr %arrayidx84, align 2, !dbg !720
  %conv85 = zext i16 %18 to i32, !dbg !720
  %shl86 = shl i32 %conv85, 2, !dbg !721
  %or87 = or i32 %shr83, %shl86, !dbg !722
  %conv88 = trunc i32 %or87 to i8, !dbg !723
  %arrayidx89 = getelementptr inbounds i8, ptr %r.addr.1, i32 8, !dbg !724
  store i8 %conv88, ptr %arrayidx89, align 1, !dbg !725
  %arrayidx90 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !726
  %19 = load i16, ptr %arrayidx90, align 2, !dbg !726
  %conv91 = zext i16 %19 to i32, !dbg !726
  %shr92 = ashr i32 %conv91, 6, !dbg !727
  %arrayidx93 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !728
  %20 = load i16, ptr %arrayidx93, align 2, !dbg !728
  %conv94 = zext i16 %20 to i32, !dbg !728
  %shl95 = shl i32 %conv94, 5, !dbg !729
  %or96 = or i32 %shr92, %shl95, !dbg !730
  %conv97 = trunc i32 %or96 to i8, !dbg !731
  %arrayidx98 = getelementptr inbounds i8, ptr %r.addr.1, i32 9, !dbg !732
  store i8 %conv97, ptr %arrayidx98, align 1, !dbg !733
  %arrayidx99 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !734
  %21 = load i16, ptr %arrayidx99, align 2, !dbg !734
  %conv100 = zext i16 %21 to i32, !dbg !734
  %shr101 = ashr i32 %conv100, 3, !dbg !735
  %conv102 = trunc i32 %shr101 to i8, !dbg !736
  %arrayidx103 = getelementptr inbounds i8, ptr %r.addr.1, i32 10, !dbg !737
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !738
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.1, i32 11, !dbg !739
    #dbg_value(ptr %add.ptr, !603, !DIExpression(), !604)
  br label %for.inc104, !dbg !740

for.inc104:                                       ; preds = %for.end
  %inc105 = add i32 %j.0, 1, !dbg !741
    #dbg_value(i32 %inc105, !618, !DIExpression(), !604)
  br label %for.cond1, !dbg !742, !llvm.loop !743

for.end106:                                       ; preds = %for.cond1
  br label %for.inc107, !dbg !745

for.inc107:                                       ; preds = %for.end106
  %inc108 = add i32 %i.0, 1, !dbg !746
    #dbg_value(i32 %inc108, !611, !DIExpression(), !604)
  br label %for.cond, !dbg !747, !llvm.loop !748

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !750
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !751 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !755, !DIExpression(), !756)
    #dbg_value(ptr %a, !757, !DIExpression(), !756)
    #dbg_declare(ptr %t, !758, !DIExpression(), !759)
    #dbg_value(i32 0, !760, !DIExpression(), !756)
  br label %for.cond, !dbg !761

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !763
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !757, !DIExpression(), !756)
    #dbg_value(i32 %i.0, !760, !DIExpression(), !756)
  %cmp = icmp ult i32 %i.0, 4, !dbg !764
  br i1 %cmp, label %for.body, label %for.end106, !dbg !766

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !767, !DIExpression(), !756)
  br label %for.cond1, !dbg !768

for.cond1:                                        ; preds = %for.inc101, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc102, %for.inc101 ], !dbg !771
  %a.addr.1 = phi ptr [ %a.addr.0, %for.body ], [ %add.ptr, %for.inc101 ]
    #dbg_value(ptr %a.addr.1, !757, !DIExpression(), !756)
    #dbg_value(i32 %j.0, !767, !DIExpression(), !756)
  %cmp2 = icmp ult i32 %j.0, 32, !dbg !772
  br i1 %cmp2, label %for.body3, label %for.end103, !dbg !774

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.1, i32 0, !dbg !775
  %0 = load i8, ptr %arrayidx, align 1, !dbg !775
  %conv = zext i8 %0 to i32, !dbg !775
  %shr = ashr i32 %conv, 0, !dbg !777
  %arrayidx4 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !778
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !778
  %conv5 = zext i8 %1 to i16, !dbg !779
  %conv6 = zext i16 %conv5 to i32, !dbg !779
  %shl = shl i32 %conv6, 8, !dbg !780
  %or = or i32 %shr, %shl, !dbg !781
  %conv7 = trunc i32 %or to i16, !dbg !782
  %arrayidx8 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !783
  store i16 %conv7, ptr %arrayidx8, align 2, !dbg !784
  %arrayidx9 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !785
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !785
  %conv10 = zext i8 %2 to i32, !dbg !785
  %shr11 = ashr i32 %conv10, 3, !dbg !786
  %arrayidx12 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !787
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !787
  %conv13 = zext i8 %3 to i16, !dbg !788
  %conv14 = zext i16 %conv13 to i32, !dbg !788
  %shl15 = shl i32 %conv14, 5, !dbg !789
  %or16 = or i32 %shr11, %shl15, !dbg !790
  %conv17 = trunc i32 %or16 to i16, !dbg !791
  %arrayidx18 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !792
  store i16 %conv17, ptr %arrayidx18, align 2, !dbg !793
  %arrayidx19 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !794
  %4 = load i8, ptr %arrayidx19, align 1, !dbg !794
  %conv20 = zext i8 %4 to i32, !dbg !794
  %shr21 = ashr i32 %conv20, 6, !dbg !795
  %arrayidx22 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !796
  %5 = load i8, ptr %arrayidx22, align 1, !dbg !796
  %conv23 = zext i8 %5 to i16, !dbg !797
  %conv24 = zext i16 %conv23 to i32, !dbg !797
  %shl25 = shl i32 %conv24, 2, !dbg !798
  %or26 = or i32 %shr21, %shl25, !dbg !799
  %arrayidx27 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !800
  %6 = load i8, ptr %arrayidx27, align 1, !dbg !800
  %conv28 = zext i8 %6 to i16, !dbg !801
  %conv29 = zext i16 %conv28 to i32, !dbg !801
  %shl30 = shl i32 %conv29, 10, !dbg !802
  %or31 = or i32 %or26, %shl30, !dbg !803
  %conv32 = trunc i32 %or31 to i16, !dbg !804
  %arrayidx33 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !805
  store i16 %conv32, ptr %arrayidx33, align 2, !dbg !806
  %arrayidx34 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !807
  %7 = load i8, ptr %arrayidx34, align 1, !dbg !807
  %conv35 = zext i8 %7 to i32, !dbg !807
  %shr36 = ashr i32 %conv35, 1, !dbg !808
  %arrayidx37 = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !809
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !809
  %conv38 = zext i8 %8 to i16, !dbg !810
  %conv39 = zext i16 %conv38 to i32, !dbg !810
  %shl40 = shl i32 %conv39, 7, !dbg !811
  %or41 = or i32 %shr36, %shl40, !dbg !812
  %conv42 = trunc i32 %or41 to i16, !dbg !813
  %arrayidx43 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !814
  store i16 %conv42, ptr %arrayidx43, align 2, !dbg !815
  %arrayidx44 = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !816
  %9 = load i8, ptr %arrayidx44, align 1, !dbg !816
  %conv45 = zext i8 %9 to i32, !dbg !816
  %shr46 = ashr i32 %conv45, 4, !dbg !817
  %arrayidx47 = getelementptr inbounds i8, ptr %a.addr.1, i32 6, !dbg !818
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !818
  %conv48 = zext i8 %10 to i16, !dbg !819
  %conv49 = zext i16 %conv48 to i32, !dbg !819
  %shl50 = shl i32 %conv49, 4, !dbg !820
  %or51 = or i32 %shr46, %shl50, !dbg !821
  %conv52 = trunc i32 %or51 to i16, !dbg !822
  %arrayidx53 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !823
  store i16 %conv52, ptr %arrayidx53, align 2, !dbg !824
  %arrayidx54 = getelementptr inbounds i8, ptr %a.addr.1, i32 6, !dbg !825
  %11 = load i8, ptr %arrayidx54, align 1, !dbg !825
  %conv55 = zext i8 %11 to i32, !dbg !825
  %shr56 = ashr i32 %conv55, 7, !dbg !826
  %arrayidx57 = getelementptr inbounds i8, ptr %a.addr.1, i32 7, !dbg !827
  %12 = load i8, ptr %arrayidx57, align 1, !dbg !827
  %conv58 = zext i8 %12 to i16, !dbg !828
  %conv59 = zext i16 %conv58 to i32, !dbg !828
  %shl60 = shl i32 %conv59, 1, !dbg !829
  %or61 = or i32 %shr56, %shl60, !dbg !830
  %arrayidx62 = getelementptr inbounds i8, ptr %a.addr.1, i32 8, !dbg !831
  %13 = load i8, ptr %arrayidx62, align 1, !dbg !831
  %conv63 = zext i8 %13 to i16, !dbg !832
  %conv64 = zext i16 %conv63 to i32, !dbg !832
  %shl65 = shl i32 %conv64, 9, !dbg !833
  %or66 = or i32 %or61, %shl65, !dbg !834
  %conv67 = trunc i32 %or66 to i16, !dbg !835
  %arrayidx68 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !836
  store i16 %conv67, ptr %arrayidx68, align 2, !dbg !837
  %arrayidx69 = getelementptr inbounds i8, ptr %a.addr.1, i32 8, !dbg !838
  %14 = load i8, ptr %arrayidx69, align 1, !dbg !838
  %conv70 = zext i8 %14 to i32, !dbg !838
  %shr71 = ashr i32 %conv70, 2, !dbg !839
  %arrayidx72 = getelementptr inbounds i8, ptr %a.addr.1, i32 9, !dbg !840
  %15 = load i8, ptr %arrayidx72, align 1, !dbg !840
  %conv73 = zext i8 %15 to i16, !dbg !841
  %conv74 = zext i16 %conv73 to i32, !dbg !841
  %shl75 = shl i32 %conv74, 6, !dbg !842
  %or76 = or i32 %shr71, %shl75, !dbg !843
  %conv77 = trunc i32 %or76 to i16, !dbg !844
  %arrayidx78 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !845
  store i16 %conv77, ptr %arrayidx78, align 2, !dbg !846
  %arrayidx79 = getelementptr inbounds i8, ptr %a.addr.1, i32 9, !dbg !847
  %16 = load i8, ptr %arrayidx79, align 1, !dbg !847
  %conv80 = zext i8 %16 to i32, !dbg !847
  %shr81 = ashr i32 %conv80, 5, !dbg !848
  %arrayidx82 = getelementptr inbounds i8, ptr %a.addr.1, i32 10, !dbg !849
  %17 = load i8, ptr %arrayidx82, align 1, !dbg !849
  %conv83 = zext i8 %17 to i16, !dbg !850
  %conv84 = zext i16 %conv83 to i32, !dbg !850
  %shl85 = shl i32 %conv84, 3, !dbg !851
  %or86 = or i32 %shr81, %shl85, !dbg !852
  %conv87 = trunc i32 %or86 to i16, !dbg !853
  %arrayidx88 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !854
  store i16 %conv87, ptr %arrayidx88, align 2, !dbg !855
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.1, i32 11, !dbg !856
    #dbg_value(ptr %add.ptr, !757, !DIExpression(), !756)
    #dbg_value(i32 0, !857, !DIExpression(), !756)
  br label %for.cond89, !dbg !858

for.cond89:                                       ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !860
    #dbg_value(i32 %k.0, !857, !DIExpression(), !756)
  %cmp90 = icmp ult i32 %k.0, 8, !dbg !861
  br i1 %cmp90, label %for.body92, label %for.end, !dbg !863

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !864
  %18 = load i16, ptr %arrayidx93, align 2, !dbg !864
  %conv94 = zext i16 %18 to i32, !dbg !864
  %and = and i32 %conv94, 2047, !dbg !865
  %mul = mul i32 %and, 3329, !dbg !866
  %add = add i32 %mul, 1024, !dbg !867
  %shr95 = lshr i32 %add, 11, !dbg !868
  %conv96 = trunc i32 %shr95 to i16, !dbg !869
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !870
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !871
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx97, i32 0, i32 0, !dbg !872
  %mul98 = mul i32 8, %j.0, !dbg !873
  %add99 = add i32 %mul98, %k.0, !dbg !874
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add99, !dbg !871
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !875
  br label %for.inc, !dbg !871

for.inc:                                          ; preds = %for.body92
  %inc = add i32 %k.0, 1, !dbg !876
    #dbg_value(i32 %inc, !857, !DIExpression(), !756)
  br label %for.cond89, !dbg !877, !llvm.loop !878

for.end:                                          ; preds = %for.cond89
  br label %for.inc101, !dbg !880

for.inc101:                                       ; preds = %for.end
  %inc102 = add i32 %j.0, 1, !dbg !881
    #dbg_value(i32 %inc102, !767, !DIExpression(), !756)
  br label %for.cond1, !dbg !882, !llvm.loop !883

for.end103:                                       ; preds = %for.cond1
  br label %for.inc104, !dbg !885

for.inc104:                                       ; preds = %for.end103
  %inc105 = add i32 %i.0, 1, !dbg !886
    #dbg_value(i32 %inc105, !760, !DIExpression(), !756)
  br label %for.cond, !dbg !887, !llvm.loop !888

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !890
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !891 {
entry:
    #dbg_value(ptr %r, !892, !DIExpression(), !893)
    #dbg_value(ptr %a, !894, !DIExpression(), !893)
    #dbg_value(i32 0, !895, !DIExpression(), !893)
  br label %for.cond, !dbg !896

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !898
    #dbg_value(i32 %i.0, !895, !DIExpression(), !893)
  %cmp = icmp ult i32 %i.0, 4, !dbg !899
  br i1 %cmp, label %for.body, label %for.end, !dbg !901

for.body:                                         ; preds = %for.cond
  %mul = mul i32 %i.0, 384, !dbg !902
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !903
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !904
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !905
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #2, !dbg !906
  br label %for.inc, !dbg !906

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !907
    #dbg_value(i32 %inc, !895, !DIExpression(), !893)
  br label %for.cond, !dbg !908, !llvm.loop !909

for.end:                                          ; preds = %for.cond
  ret void, !dbg !911
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !912 {
entry:
    #dbg_value(ptr %r, !913, !DIExpression(), !914)
    #dbg_value(ptr %a, !915, !DIExpression(), !914)
    #dbg_value(i32 0, !916, !DIExpression(), !914)
  br label %for.cond, !dbg !917

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !919
    #dbg_value(i32 %i.0, !916, !DIExpression(), !914)
  %cmp = icmp ult i32 %i.0, 4, !dbg !920
  br i1 %cmp, label %for.body, label %for.end, !dbg !922

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !923
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !924
  %mul = mul i32 %i.0, 384, !dbg !925
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !926
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #2, !dbg !927
  br label %for.inc, !dbg !927

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !928
    #dbg_value(i32 %inc, !916, !DIExpression(), !914)
  br label %for.cond, !dbg !929, !llvm.loop !930

for.end:                                          ; preds = %for.cond
  ret void, !dbg !932
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) #0 !dbg !933 {
entry:
    #dbg_value(ptr %r, !936, !DIExpression(), !937)
    #dbg_value(i32 0, !938, !DIExpression(), !937)
  br label %for.cond, !dbg !939

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !941
    #dbg_value(i32 %i.0, !938, !DIExpression(), !937)
  %cmp = icmp ult i32 %i.0, 4, !dbg !942
  br i1 %cmp, label %for.body, label %for.end, !dbg !944

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !945
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !946
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #2, !dbg !947
  br label %for.inc, !dbg !947

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !948
    #dbg_value(i32 %inc, !938, !DIExpression(), !937)
  br label %for.cond, !dbg !949, !llvm.loop !950

for.end:                                          ; preds = %for.cond
  ret void, !dbg !952
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) #0 !dbg !953 {
entry:
    #dbg_value(ptr %r, !954, !DIExpression(), !955)
    #dbg_value(i32 0, !956, !DIExpression(), !955)
  br label %for.cond, !dbg !957

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !959
    #dbg_value(i32 %i.0, !956, !DIExpression(), !955)
  %cmp = icmp ult i32 %i.0, 4, !dbg !960
  br i1 %cmp, label %for.body, label %for.end, !dbg !962

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !963
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !964
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #2, !dbg !965
  br label %for.inc, !dbg !965

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !966
    #dbg_value(i32 %inc, !956, !DIExpression(), !955)
  br label %for.cond, !dbg !967, !llvm.loop !968

for.end:                                          ; preds = %for.cond
  ret void, !dbg !970
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !971 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !975, !DIExpression(), !976)
    #dbg_value(ptr %a, !977, !DIExpression(), !976)
    #dbg_value(ptr %b, !978, !DIExpression(), !976)
    #dbg_declare(ptr %t, !979, !DIExpression(), !980)
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !981
  %arrayidx = getelementptr inbounds [4 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !982
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !983
  %arrayidx2 = getelementptr inbounds [4 x %struct.poly], ptr %vec1, i32 0, i32 0, !dbg !984
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %arrayidx, ptr noundef %arrayidx2) #2, !dbg !985
    #dbg_value(i32 1, !986, !DIExpression(), !976)
  br label %for.cond, !dbg !987

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !989
    #dbg_value(i32 %i.0, !986, !DIExpression(), !976)
  %cmp = icmp ult i32 %i.0, 4, !dbg !990
  br i1 %cmp, label %for.body, label %for.end, !dbg !992

for.body:                                         ; preds = %for.cond
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !993
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !995
  %vec5 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !996
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec5, i32 0, i32 %i.0, !dbg !997
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %t, ptr noundef %arrayidx4, ptr noundef %arrayidx6) #2, !dbg !998
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef %t) #2, !dbg !999
  br label %for.inc, !dbg !1000

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1001
    #dbg_value(i32 %inc, !986, !DIExpression(), !976)
  br label %for.cond, !dbg !1002, !llvm.loop !1003

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #2, !dbg !1005
  ret void, !dbg !1006
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) #0 !dbg !1007 {
entry:
    #dbg_value(ptr %r, !1008, !DIExpression(), !1009)
    #dbg_value(i32 0, !1010, !DIExpression(), !1009)
  br label %for.cond, !dbg !1011

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1013
    #dbg_value(i32 %i.0, !1010, !DIExpression(), !1009)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1014
  br i1 %cmp, label %for.body, label %for.end, !dbg !1016

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1017
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1018
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #2, !dbg !1019
  br label %for.inc, !dbg !1019

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1020
    #dbg_value(i32 %inc, !1010, !DIExpression(), !1009)
  br label %for.cond, !dbg !1021, !llvm.loop !1022

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1024
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1025 {
entry:
    #dbg_value(ptr %r, !1028, !DIExpression(), !1029)
    #dbg_value(ptr %a, !1030, !DIExpression(), !1029)
    #dbg_value(ptr %b, !1031, !DIExpression(), !1029)
    #dbg_value(i32 0, !1032, !DIExpression(), !1029)
  br label %for.cond, !dbg !1033

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1035
    #dbg_value(i32 %i.0, !1032, !DIExpression(), !1029)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1036
  br i1 %cmp, label %for.body, label %for.end, !dbg !1038

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1039
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1040
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1041
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec1, i32 0, i32 %i.0, !dbg !1042
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1043
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !1044
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #2, !dbg !1045
  br label %for.inc, !dbg !1045

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1046
    #dbg_value(i32 %inc, !1032, !DIExpression(), !1029)
  br label %for.cond, !dbg !1047, !llvm.loop !1048

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1050
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !1051 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1061, !DIExpression(), !1062)
    #dbg_value(ptr %a, !1063, !DIExpression(), !1062)
    #dbg_declare(ptr %t, !1064, !DIExpression(), !1066)
    #dbg_value(i32 0, !1067, !DIExpression(), !1062)
  br label %for.cond, !dbg !1068

for.cond:                                         ; preds = %for.inc66, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.inc66 ], !dbg !1070
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.inc66 ]
    #dbg_value(ptr %r.addr.0, !1061, !DIExpression(), !1062)
    #dbg_value(i32 %i.0, !1067, !DIExpression(), !1062)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1071
  br i1 %cmp, label %for.body, label %for.end68, !dbg !1073

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1074, !DIExpression(), !1062)
  br label %for.cond1, !dbg !1075

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1078
    #dbg_value(i32 %j.0, !1074, !DIExpression(), !1062)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1079
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1081

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1082
  %mul = mul i32 8, %i.0, !dbg !1084
  %add = add i32 %mul, %j.0, !dbg !1085
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1086
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1086
    #dbg_value(i16 %0, !1087, !DIExpression(), !1062)
  %conv = sext i16 %0 to i32, !dbg !1088
  %shr = ashr i32 %conv, 15, !dbg !1089
  %and = and i32 %shr, 3329, !dbg !1090
  %conv4 = sext i16 %0 to i32, !dbg !1091
  %add5 = add nsw i32 %conv4, %and, !dbg !1091
  %conv6 = trunc i32 %add5 to i16, !dbg !1091
    #dbg_value(i16 %conv6, !1087, !DIExpression(), !1062)
  %conv7 = sext i16 %conv6 to i32, !dbg !1092
  %shl = shl i32 %conv7, 5, !dbg !1093
    #dbg_value(i32 %shl, !1094, !DIExpression(), !1062)
  %add8 = add i32 %shl, 1664, !dbg !1095
    #dbg_value(i32 %add8, !1094, !DIExpression(), !1062)
  %mul9 = mul i32 %add8, 40318, !dbg !1096
    #dbg_value(i32 %mul9, !1094, !DIExpression(), !1062)
  %shr10 = lshr i32 %mul9, 27, !dbg !1097
    #dbg_value(i32 %shr10, !1094, !DIExpression(), !1062)
  %and11 = and i32 %shr10, 31, !dbg !1098
  %conv12 = trunc i32 %and11 to i8, !dbg !1099
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1100
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1101
  br label %for.inc, !dbg !1102

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1103
    #dbg_value(i32 %inc, !1074, !DIExpression(), !1062)
  br label %for.cond1, !dbg !1104, !llvm.loop !1105

for.end:                                          ; preds = %for.cond1
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1107
  %1 = load i8, ptr %arrayidx14, align 1, !dbg !1107
  %conv15 = zext i8 %1 to i32, !dbg !1107
  %shr16 = ashr i32 %conv15, 0, !dbg !1108
  %arrayidx17 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1109
  %2 = load i8, ptr %arrayidx17, align 1, !dbg !1109
  %conv18 = zext i8 %2 to i32, !dbg !1109
  %shl19 = shl i32 %conv18, 5, !dbg !1110
  %or = or i32 %shr16, %shl19, !dbg !1111
  %conv20 = trunc i32 %or to i8, !dbg !1112
  %arrayidx21 = getelementptr inbounds i8, ptr %r.addr.0, i32 0, !dbg !1113
  store i8 %conv20, ptr %arrayidx21, align 1, !dbg !1114
  %arrayidx22 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1115
  %3 = load i8, ptr %arrayidx22, align 1, !dbg !1115
  %conv23 = zext i8 %3 to i32, !dbg !1115
  %shr24 = ashr i32 %conv23, 3, !dbg !1116
  %arrayidx25 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1117
  %4 = load i8, ptr %arrayidx25, align 1, !dbg !1117
  %conv26 = zext i8 %4 to i32, !dbg !1117
  %shl27 = shl i32 %conv26, 2, !dbg !1118
  %or28 = or i32 %shr24, %shl27, !dbg !1119
  %arrayidx29 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1120
  %5 = load i8, ptr %arrayidx29, align 1, !dbg !1120
  %conv30 = zext i8 %5 to i32, !dbg !1120
  %shl31 = shl i32 %conv30, 7, !dbg !1121
  %or32 = or i32 %or28, %shl31, !dbg !1122
  %conv33 = trunc i32 %or32 to i8, !dbg !1123
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.0, i32 1, !dbg !1124
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !1125
  %arrayidx35 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1126
  %6 = load i8, ptr %arrayidx35, align 1, !dbg !1126
  %conv36 = zext i8 %6 to i32, !dbg !1126
  %shr37 = ashr i32 %conv36, 1, !dbg !1127
  %arrayidx38 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1128
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !1128
  %conv39 = zext i8 %7 to i32, !dbg !1128
  %shl40 = shl i32 %conv39, 4, !dbg !1129
  %or41 = or i32 %shr37, %shl40, !dbg !1130
  %conv42 = trunc i32 %or41 to i8, !dbg !1131
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.0, i32 2, !dbg !1132
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !1133
  %arrayidx44 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1134
  %8 = load i8, ptr %arrayidx44, align 1, !dbg !1134
  %conv45 = zext i8 %8 to i32, !dbg !1134
  %shr46 = ashr i32 %conv45, 4, !dbg !1135
  %arrayidx47 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1136
  %9 = load i8, ptr %arrayidx47, align 1, !dbg !1136
  %conv48 = zext i8 %9 to i32, !dbg !1136
  %shl49 = shl i32 %conv48, 1, !dbg !1137
  %or50 = or i32 %shr46, %shl49, !dbg !1138
  %arrayidx51 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1139
  %10 = load i8, ptr %arrayidx51, align 1, !dbg !1139
  %conv52 = zext i8 %10 to i32, !dbg !1139
  %shl53 = shl i32 %conv52, 6, !dbg !1140
  %or54 = or i32 %or50, %shl53, !dbg !1141
  %conv55 = trunc i32 %or54 to i8, !dbg !1142
  %arrayidx56 = getelementptr inbounds i8, ptr %r.addr.0, i32 3, !dbg !1143
  store i8 %conv55, ptr %arrayidx56, align 1, !dbg !1144
  %arrayidx57 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1145
  %11 = load i8, ptr %arrayidx57, align 1, !dbg !1145
  %conv58 = zext i8 %11 to i32, !dbg !1145
  %shr59 = ashr i32 %conv58, 2, !dbg !1146
  %arrayidx60 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1147
  %12 = load i8, ptr %arrayidx60, align 1, !dbg !1147
  %conv61 = zext i8 %12 to i32, !dbg !1147
  %shl62 = shl i32 %conv61, 3, !dbg !1148
  %or63 = or i32 %shr59, %shl62, !dbg !1149
  %conv64 = trunc i32 %or63 to i8, !dbg !1150
  %arrayidx65 = getelementptr inbounds i8, ptr %r.addr.0, i32 4, !dbg !1151
  store i8 %conv64, ptr %arrayidx65, align 1, !dbg !1152
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.0, i32 5, !dbg !1153
    #dbg_value(ptr %add.ptr, !1061, !DIExpression(), !1062)
  br label %for.inc66, !dbg !1154

for.inc66:                                        ; preds = %for.end
  %inc67 = add i32 %i.0, 1, !dbg !1155
    #dbg_value(i32 %inc67, !1067, !DIExpression(), !1062)
  br label %for.cond, !dbg !1156, !llvm.loop !1157

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1159
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !1160 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1164, !DIExpression(), !1165)
    #dbg_value(ptr %a, !1166, !DIExpression(), !1165)
    #dbg_declare(ptr %t, !1167, !DIExpression(), !1168)
    #dbg_value(i32 0, !1169, !DIExpression(), !1165)
  br label %for.cond, !dbg !1170

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1172
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1166, !DIExpression(), !1165)
    #dbg_value(i32 %i.0, !1169, !DIExpression(), !1165)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1173
  br i1 %cmp, label %for.body, label %for.end65, !dbg !1175

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1176
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1176
  %conv = zext i8 %0 to i32, !dbg !1176
  %shr = ashr i32 %conv, 0, !dbg !1178
  %conv1 = trunc i32 %shr to i8, !dbg !1179
  %arrayidx2 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1180
  store i8 %conv1, ptr %arrayidx2, align 1, !dbg !1181
  %arrayidx3 = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1182
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1182
  %conv4 = zext i8 %1 to i32, !dbg !1182
  %shr5 = ashr i32 %conv4, 5, !dbg !1183
  %arrayidx6 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1184
  %2 = load i8, ptr %arrayidx6, align 1, !dbg !1184
  %conv7 = zext i8 %2 to i32, !dbg !1184
  %shl = shl i32 %conv7, 3, !dbg !1185
  %or = or i32 %shr5, %shl, !dbg !1186
  %conv8 = trunc i32 %or to i8, !dbg !1187
  %arrayidx9 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1188
  store i8 %conv8, ptr %arrayidx9, align 1, !dbg !1189
  %arrayidx10 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1190
  %3 = load i8, ptr %arrayidx10, align 1, !dbg !1190
  %conv11 = zext i8 %3 to i32, !dbg !1190
  %shr12 = ashr i32 %conv11, 2, !dbg !1191
  %conv13 = trunc i32 %shr12 to i8, !dbg !1192
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1193
  store i8 %conv13, ptr %arrayidx14, align 1, !dbg !1194
  %arrayidx15 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1195
  %4 = load i8, ptr %arrayidx15, align 1, !dbg !1195
  %conv16 = zext i8 %4 to i32, !dbg !1195
  %shr17 = ashr i32 %conv16, 7, !dbg !1196
  %arrayidx18 = getelementptr inbounds i8, ptr %a.addr.0, i32 2, !dbg !1197
  %5 = load i8, ptr %arrayidx18, align 1, !dbg !1197
  %conv19 = zext i8 %5 to i32, !dbg !1197
  %shl20 = shl i32 %conv19, 1, !dbg !1198
  %or21 = or i32 %shr17, %shl20, !dbg !1199
  %conv22 = trunc i32 %or21 to i8, !dbg !1200
  %arrayidx23 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1201
  store i8 %conv22, ptr %arrayidx23, align 1, !dbg !1202
  %arrayidx24 = getelementptr inbounds i8, ptr %a.addr.0, i32 2, !dbg !1203
  %6 = load i8, ptr %arrayidx24, align 1, !dbg !1203
  %conv25 = zext i8 %6 to i32, !dbg !1203
  %shr26 = ashr i32 %conv25, 4, !dbg !1204
  %arrayidx27 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1205
  %7 = load i8, ptr %arrayidx27, align 1, !dbg !1205
  %conv28 = zext i8 %7 to i32, !dbg !1205
  %shl29 = shl i32 %conv28, 4, !dbg !1206
  %or30 = or i32 %shr26, %shl29, !dbg !1207
  %conv31 = trunc i32 %or30 to i8, !dbg !1208
  %arrayidx32 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1209
  store i8 %conv31, ptr %arrayidx32, align 1, !dbg !1210
  %arrayidx33 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1211
  %8 = load i8, ptr %arrayidx33, align 1, !dbg !1211
  %conv34 = zext i8 %8 to i32, !dbg !1211
  %shr35 = ashr i32 %conv34, 1, !dbg !1212
  %conv36 = trunc i32 %shr35 to i8, !dbg !1213
  %arrayidx37 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1214
  store i8 %conv36, ptr %arrayidx37, align 1, !dbg !1215
  %arrayidx38 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1216
  %9 = load i8, ptr %arrayidx38, align 1, !dbg !1216
  %conv39 = zext i8 %9 to i32, !dbg !1216
  %shr40 = ashr i32 %conv39, 6, !dbg !1217
  %arrayidx41 = getelementptr inbounds i8, ptr %a.addr.0, i32 4, !dbg !1218
  %10 = load i8, ptr %arrayidx41, align 1, !dbg !1218
  %conv42 = zext i8 %10 to i32, !dbg !1218
  %shl43 = shl i32 %conv42, 2, !dbg !1219
  %or44 = or i32 %shr40, %shl43, !dbg !1220
  %conv45 = trunc i32 %or44 to i8, !dbg !1221
  %arrayidx46 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1222
  store i8 %conv45, ptr %arrayidx46, align 1, !dbg !1223
  %arrayidx47 = getelementptr inbounds i8, ptr %a.addr.0, i32 4, !dbg !1224
  %11 = load i8, ptr %arrayidx47, align 1, !dbg !1224
  %conv48 = zext i8 %11 to i32, !dbg !1224
  %shr49 = ashr i32 %conv48, 3, !dbg !1225
  %conv50 = trunc i32 %shr49 to i8, !dbg !1226
  %arrayidx51 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1227
  store i8 %conv50, ptr %arrayidx51, align 1, !dbg !1228
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.0, i32 5, !dbg !1229
    #dbg_value(ptr %add.ptr, !1166, !DIExpression(), !1165)
    #dbg_value(i32 0, !1230, !DIExpression(), !1165)
  br label %for.cond52, !dbg !1231

for.cond52:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1233
    #dbg_value(i32 %j.0, !1230, !DIExpression(), !1165)
  %cmp53 = icmp ult i32 %j.0, 8, !dbg !1234
  br i1 %cmp53, label %for.body55, label %for.end, !dbg !1236

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1237
  %12 = load i8, ptr %arrayidx56, align 1, !dbg !1237
  %conv57 = zext i8 %12 to i32, !dbg !1237
  %and = and i32 %conv57, 31, !dbg !1238
  %mul = mul i32 %and, 3329, !dbg !1239
  %add = add i32 %mul, 16, !dbg !1240
  %shr58 = lshr i32 %add, 5, !dbg !1241
  %conv59 = trunc i32 %shr58 to i16, !dbg !1242
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1243
  %mul60 = mul i32 8, %i.0, !dbg !1244
  %add61 = add i32 %mul60, %j.0, !dbg !1245
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add61, !dbg !1246
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1247
  br label %for.inc, !dbg !1246

for.inc:                                          ; preds = %for.body55
  %inc = add i32 %j.0, 1, !dbg !1248
    #dbg_value(i32 %inc, !1230, !DIExpression(), !1165)
  br label %for.cond52, !dbg !1249, !llvm.loop !1250

for.end:                                          ; preds = %for.cond52
  br label %for.inc63, !dbg !1252

for.inc63:                                        ; preds = %for.end
  %inc64 = add i32 %i.0, 1, !dbg !1253
    #dbg_value(i32 %inc64, !1169, !DIExpression(), !1165)
  br label %for.cond, !dbg !1254, !llvm.loop !1255

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1257
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1258 {
entry:
    #dbg_value(ptr %r, !1259, !DIExpression(), !1260)
    #dbg_value(ptr %a, !1261, !DIExpression(), !1260)
    #dbg_value(i32 0, !1262, !DIExpression(), !1260)
  br label %for.cond, !dbg !1263

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1265
    #dbg_value(i32 %i.0, !1262, !DIExpression(), !1260)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1266
  br i1 %cmp, label %for.body, label %for.end, !dbg !1268

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1269
  %mul = mul i32 2, %i.0, !dbg !1271
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1272
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1272
    #dbg_value(i16 %0, !1273, !DIExpression(), !1260)
  %conv = sext i16 %0 to i32, !dbg !1274
  %shr = ashr i32 %conv, 15, !dbg !1275
  %and = and i32 %shr, 3329, !dbg !1276
  %conv1 = zext i16 %0 to i32, !dbg !1277
  %add = add nsw i32 %conv1, %and, !dbg !1277
  %conv2 = trunc i32 %add to i16, !dbg !1277
    #dbg_value(i16 %conv2, !1273, !DIExpression(), !1260)
  %coeffs3 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1278
  %mul4 = mul i32 2, %i.0, !dbg !1279
  %add5 = add i32 %mul4, 1, !dbg !1280
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs3, i32 0, i32 %add5, !dbg !1281
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1281
    #dbg_value(i16 %1, !1282, !DIExpression(), !1260)
  %conv7 = sext i16 %1 to i32, !dbg !1283
  %shr8 = ashr i32 %conv7, 15, !dbg !1284
  %and9 = and i32 %shr8, 3329, !dbg !1285
  %conv10 = zext i16 %1 to i32, !dbg !1286
  %add11 = add nsw i32 %conv10, %and9, !dbg !1286
  %conv12 = trunc i32 %add11 to i16, !dbg !1286
    #dbg_value(i16 %conv12, !1282, !DIExpression(), !1260)
  %conv13 = zext i16 %conv2 to i32, !dbg !1287
  %shr14 = ashr i32 %conv13, 0, !dbg !1288
  %conv15 = trunc i32 %shr14 to i8, !dbg !1289
  %mul16 = mul i32 3, %i.0, !dbg !1290
  %add17 = add i32 %mul16, 0, !dbg !1291
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %add17, !dbg !1292
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1293
  %conv19 = zext i16 %conv2 to i32, !dbg !1294
  %shr20 = ashr i32 %conv19, 8, !dbg !1295
  %conv21 = zext i16 %conv12 to i32, !dbg !1296
  %shl = shl i32 %conv21, 4, !dbg !1297
  %or = or i32 %shr20, %shl, !dbg !1298
  %conv22 = trunc i32 %or to i8, !dbg !1299
  %mul23 = mul i32 3, %i.0, !dbg !1300
  %add24 = add i32 %mul23, 1, !dbg !1301
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %r, i32 %add24, !dbg !1302
  store i8 %conv22, ptr %arrayidx25, align 1, !dbg !1303
  %conv26 = zext i16 %conv12 to i32, !dbg !1304
  %shr27 = ashr i32 %conv26, 4, !dbg !1305
  %conv28 = trunc i32 %shr27 to i8, !dbg !1306
  %mul29 = mul i32 3, %i.0, !dbg !1307
  %add30 = add i32 %mul29, 2, !dbg !1308
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %r, i32 %add30, !dbg !1309
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1310
  br label %for.inc, !dbg !1311

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1312
    #dbg_value(i32 %inc, !1262, !DIExpression(), !1260)
  br label %for.cond, !dbg !1313, !llvm.loop !1314

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1316
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1317 {
entry:
    #dbg_value(ptr %r, !1318, !DIExpression(), !1319)
    #dbg_value(ptr %a, !1320, !DIExpression(), !1319)
    #dbg_value(i32 0, !1321, !DIExpression(), !1319)
  br label %for.cond, !dbg !1322

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1324
    #dbg_value(i32 %i.0, !1321, !DIExpression(), !1319)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1325
  br i1 %cmp, label %for.body, label %for.end, !dbg !1327

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1328
  %add = add i32 %mul, 0, !dbg !1330
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %add, !dbg !1331
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1331
  %conv = zext i8 %0 to i32, !dbg !1331
  %shr = ashr i32 %conv, 0, !dbg !1332
  %mul1 = mul i32 3, %i.0, !dbg !1333
  %add2 = add i32 %mul1, 1, !dbg !1334
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %a, i32 %add2, !dbg !1335
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1335
  %conv4 = zext i8 %1 to i16, !dbg !1336
  %conv5 = zext i16 %conv4 to i32, !dbg !1336
  %shl = shl i32 %conv5, 8, !dbg !1337
  %or = or i32 %shr, %shl, !dbg !1338
  %and = and i32 %or, 4095, !dbg !1339
  %conv6 = trunc i32 %and to i16, !dbg !1340
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1341
  %mul7 = mul i32 2, %i.0, !dbg !1342
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul7, !dbg !1343
  store i16 %conv6, ptr %arrayidx8, align 2, !dbg !1344
  %mul9 = mul i32 3, %i.0, !dbg !1345
  %add10 = add i32 %mul9, 1, !dbg !1346
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %a, i32 %add10, !dbg !1347
  %2 = load i8, ptr %arrayidx11, align 1, !dbg !1347
  %conv12 = zext i8 %2 to i32, !dbg !1347
  %shr13 = ashr i32 %conv12, 4, !dbg !1348
  %mul14 = mul i32 3, %i.0, !dbg !1349
  %add15 = add i32 %mul14, 2, !dbg !1350
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 %add15, !dbg !1351
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1351
  %conv17 = zext i8 %3 to i16, !dbg !1352
  %conv18 = zext i16 %conv17 to i32, !dbg !1352
  %shl19 = shl i32 %conv18, 4, !dbg !1353
  %or20 = or i32 %shr13, %shl19, !dbg !1354
  %and21 = and i32 %or20, 4095, !dbg !1355
  %conv22 = trunc i32 %and21 to i16, !dbg !1356
  %coeffs23 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1357
  %mul24 = mul i32 2, %i.0, !dbg !1358
  %add25 = add i32 %mul24, 1, !dbg !1359
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %coeffs23, i32 0, i32 %add25, !dbg !1360
  store i16 %conv22, ptr %arrayidx26, align 2, !dbg !1361
  br label %for.inc, !dbg !1362

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1363
    #dbg_value(i32 %inc, !1321, !DIExpression(), !1319)
  br label %for.cond, !dbg !1364, !llvm.loop !1365

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1367
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) #0 !dbg !1368 {
entry:
    #dbg_value(ptr %r, !1369, !DIExpression(), !1370)
    #dbg_value(ptr %msg, !1371, !DIExpression(), !1370)
    #dbg_value(i32 0, !1372, !DIExpression(), !1370)
  br label %for.cond, !dbg !1373

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1375
    #dbg_value(i32 %i.0, !1372, !DIExpression(), !1370)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1376
  br i1 %cmp, label %for.body, label %for.end11, !dbg !1378

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1379, !DIExpression(), !1370)
  br label %for.cond1, !dbg !1380

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1383
    #dbg_value(i32 %j.0, !1379, !DIExpression(), !1370)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1384
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1386

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1387
  %mul = mul i32 8, %i.0, !dbg !1389
  %add = add i32 %mul, %j.0, !dbg !1390
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1391
  store i16 0, ptr %arrayidx, align 2, !dbg !1392
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1393
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs4, i32 0, i32 0, !dbg !1394
  %mul5 = mul i32 8, %i.0, !dbg !1395
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay, i32 %mul5, !dbg !1396
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1397
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1398
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1398
  %conv = zext i8 %0 to i32, !dbg !1398
  %shr = ashr i32 %conv, %j.0, !dbg !1399
  %and = and i32 %shr, 1, !dbg !1400
  %conv8 = trunc i32 %and to i16, !dbg !1401
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #2, !dbg !1402
  br label %for.inc, !dbg !1403

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1404
    #dbg_value(i32 %inc, !1379, !DIExpression(), !1370)
  br label %for.cond1, !dbg !1405, !llvm.loop !1406

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !1408

for.inc9:                                         ; preds = %for.end
  %inc10 = add i32 %i.0, 1, !dbg !1409
    #dbg_value(i32 %inc10, !1372, !DIExpression(), !1370)
  br label %for.cond, !dbg !1410, !llvm.loop !1411

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1413
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) #0 !dbg !1414 {
entry:
    #dbg_value(ptr %msg, !1415, !DIExpression(), !1416)
    #dbg_value(ptr %a, !1417, !DIExpression(), !1416)
    #dbg_value(i32 0, !1418, !DIExpression(), !1416)
  br label %for.cond, !dbg !1419

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1421
    #dbg_value(i32 %i.0, !1418, !DIExpression(), !1416)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1422
  br i1 %cmp, label %for.body, label %for.end13, !dbg !1424

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1425
  store i8 0, ptr %arrayidx, align 1, !dbg !1427
    #dbg_value(i32 0, !1428, !DIExpression(), !1416)
  br label %for.cond1, !dbg !1429

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1431
    #dbg_value(i32 %j.0, !1428, !DIExpression(), !1416)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1432
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1434

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1435
  %mul = mul i32 8, %i.0, !dbg !1437
  %add = add i32 %mul, %j.0, !dbg !1438
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1439
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1439
  %conv = sext i16 %0 to i32, !dbg !1439
    #dbg_value(i32 %conv, !1440, !DIExpression(), !1416)
  %shl = shl i32 %conv, 1, !dbg !1441
    #dbg_value(i32 %shl, !1440, !DIExpression(), !1416)
  %add5 = add i32 %shl, 1665, !dbg !1442
    #dbg_value(i32 %add5, !1440, !DIExpression(), !1416)
  %mul6 = mul i32 %add5, 80635, !dbg !1443
    #dbg_value(i32 %mul6, !1440, !DIExpression(), !1416)
  %shr = lshr i32 %mul6, 28, !dbg !1444
    #dbg_value(i32 %shr, !1440, !DIExpression(), !1416)
  %and = and i32 %shr, 1, !dbg !1445
    #dbg_value(i32 %and, !1440, !DIExpression(), !1416)
  %shl7 = shl i32 %and, %j.0, !dbg !1446
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1447
  %1 = load i8, ptr %arrayidx8, align 1, !dbg !1448
  %conv9 = zext i8 %1 to i32, !dbg !1448
  %or = or i32 %conv9, %shl7, !dbg !1448
  %conv10 = trunc i32 %or to i8, !dbg !1448
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1448
  br label %for.inc, !dbg !1449

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1450
    #dbg_value(i32 %inc, !1428, !DIExpression(), !1416)
  br label %for.cond1, !dbg !1451, !llvm.loop !1452

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !1454

for.inc11:                                        ; preds = %for.end
  %inc12 = add i32 %i.0, 1, !dbg !1455
    #dbg_value(i32 %inc12, !1418, !DIExpression(), !1416)
  br label %for.cond, !dbg !1456, !llvm.loop !1457

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1459
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1460 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1463, !DIExpression(), !1464)
    #dbg_value(ptr %seed, !1465, !DIExpression(), !1464)
    #dbg_value(i8 %nonce, !1466, !DIExpression(), !1464)
    #dbg_declare(ptr %buf, !1467, !DIExpression(), !1469)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1470
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1470
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1471
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1472
  ret void, !dbg !1473
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1474 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1475, !DIExpression(), !1476)
    #dbg_value(ptr %seed, !1477, !DIExpression(), !1476)
    #dbg_value(i8 %nonce, !1478, !DIExpression(), !1476)
    #dbg_declare(ptr %buf, !1479, !DIExpression(), !1480)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1481
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1481
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1482
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1483
  ret void, !dbg !1484
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) #0 !dbg !1485 {
entry:
    #dbg_value(ptr %r, !1488, !DIExpression(), !1489)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1490
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1491
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %arraydecay) #2, !dbg !1492
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #2, !dbg !1493
  ret void, !dbg !1494
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #0 !dbg !1495 {
entry:
    #dbg_value(ptr %r, !1496, !DIExpression(), !1497)
    #dbg_value(i32 0, !1498, !DIExpression(), !1497)
  br label %for.cond, !dbg !1499

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1501
    #dbg_value(i32 %i.0, !1498, !DIExpression(), !1497)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1502
  br i1 %cmp, label %for.body, label %for.end, !dbg !1504

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1505
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1506
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1506
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #2, !dbg !1507
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1508
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1509
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1510
  br label %for.inc, !dbg !1509

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1511
    #dbg_value(i32 %inc, !1498, !DIExpression(), !1497)
  br label %for.cond, !dbg !1512, !llvm.loop !1513

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1515
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) #0 !dbg !1516 {
entry:
    #dbg_value(ptr %r, !1517, !DIExpression(), !1518)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1519
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1520
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %arraydecay) #2, !dbg !1521
  ret void, !dbg !1522
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1523 {
entry:
    #dbg_value(ptr %r, !1526, !DIExpression(), !1527)
    #dbg_value(ptr %a, !1528, !DIExpression(), !1527)
    #dbg_value(ptr %b, !1529, !DIExpression(), !1527)
    #dbg_value(i32 0, !1530, !DIExpression(), !1527)
  br label %for.cond, !dbg !1531

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1533
    #dbg_value(i32 %i.0, !1530, !DIExpression(), !1527)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1534
  br i1 %cmp, label %for.body, label %for.end, !dbg !1536

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1537
  %mul = mul i32 4, %i.0, !dbg !1539
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1540
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1541
  %mul2 = mul i32 4, %i.0, !dbg !1542
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %mul2, !dbg !1543
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1544
  %mul5 = mul i32 4, %i.0, !dbg !1545
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs4, i32 0, i32 %mul5, !dbg !1546
  %add = add i32 64, %i.0, !dbg !1547
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1548
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1548
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #2, !dbg !1549
  %coeffs8 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1550
  %mul9 = mul i32 4, %i.0, !dbg !1551
  %add10 = add i32 %mul9, 2, !dbg !1552
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %coeffs8, i32 0, i32 %add10, !dbg !1553
  %coeffs12 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1554
  %mul13 = mul i32 4, %i.0, !dbg !1555
  %add14 = add i32 %mul13, 2, !dbg !1556
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %coeffs12, i32 0, i32 %add14, !dbg !1557
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1558
  %mul17 = mul i32 4, %i.0, !dbg !1559
  %add18 = add i32 %mul17, 2, !dbg !1560
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1561
  %add20 = add i32 64, %i.0, !dbg !1562
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !1563
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1563
  %conv = sext i16 %1 to i32, !dbg !1563
  %sub = sub nsw i32 0, %conv, !dbg !1564
  %conv22 = trunc i32 %sub to i16, !dbg !1564
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx11, ptr noundef %arrayidx15, ptr noundef %arrayidx19, i16 noundef signext %conv22) #2, !dbg !1565
  br label %for.inc, !dbg !1566

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1567
    #dbg_value(i32 %inc, !1530, !DIExpression(), !1527)
  br label %for.cond, !dbg !1568, !llvm.loop !1569

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1571
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) #0 !dbg !1572 {
entry:
    #dbg_value(ptr %r, !1573, !DIExpression(), !1574)
    #dbg_value(i16 1353, !1575, !DIExpression(), !1574)
    #dbg_value(i32 0, !1576, !DIExpression(), !1574)
  br label %for.cond, !dbg !1577

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1579
    #dbg_value(i32 %i.0, !1576, !DIExpression(), !1574)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1580
  br i1 %cmp, label %for.body, label %for.end, !dbg !1582

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1583
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1584
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1584
  %conv = sext i16 %0 to i32, !dbg !1585
  %mul = mul nsw i32 %conv, 1353, !dbg !1586
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1587
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1588
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1589
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1590
  br label %for.inc, !dbg !1589

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1591
    #dbg_value(i32 %inc, !1576, !DIExpression(), !1574)
  br label %for.cond, !dbg !1592, !llvm.loop !1593

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1595
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1596 {
entry:
    #dbg_value(ptr %r, !1597, !DIExpression(), !1598)
    #dbg_value(ptr %a, !1599, !DIExpression(), !1598)
    #dbg_value(ptr %b, !1600, !DIExpression(), !1598)
    #dbg_value(i32 0, !1601, !DIExpression(), !1598)
  br label %for.cond, !dbg !1602

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1604
    #dbg_value(i32 %i.0, !1601, !DIExpression(), !1598)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1605
  br i1 %cmp, label %for.body, label %for.end, !dbg !1607

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1608
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1609
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1609
  %conv = sext i16 %0 to i32, !dbg !1609
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1610
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1611
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1611
  %conv3 = sext i16 %1 to i32, !dbg !1611
  %add = add nsw i32 %conv, %conv3, !dbg !1612
  %conv4 = trunc i32 %add to i16, !dbg !1609
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1613
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1614
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1615
  br label %for.inc, !dbg !1614

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1616
    #dbg_value(i32 %inc, !1601, !DIExpression(), !1598)
  br label %for.cond, !dbg !1617, !llvm.loop !1618

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1620
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1621 {
entry:
    #dbg_value(ptr %r, !1622, !DIExpression(), !1623)
    #dbg_value(ptr %a, !1624, !DIExpression(), !1623)
    #dbg_value(ptr %b, !1625, !DIExpression(), !1623)
    #dbg_value(i32 0, !1626, !DIExpression(), !1623)
  br label %for.cond, !dbg !1627

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1629
    #dbg_value(i32 %i.0, !1626, !DIExpression(), !1623)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1630
  br i1 %cmp, label %for.body, label %for.end, !dbg !1632

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1633
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1634
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1634
  %conv = sext i16 %0 to i32, !dbg !1634
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1635
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1636
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1636
  %conv3 = sext i16 %1 to i32, !dbg !1636
  %sub = sub nsw i32 %conv, %conv3, !dbg !1637
  %conv4 = trunc i32 %sub to i16, !dbg !1634
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1638
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1639
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1640
  br label %for.inc, !dbg !1639

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1641
    #dbg_value(i32 %inc, !1626, !DIExpression(), !1623)
  br label %for.cond, !dbg !1642, !llvm.loop !1643

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1645
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #0 !dbg !1646 {
entry:
    #dbg_value(ptr %r, !1649, !DIExpression(), !1650)
    #dbg_value(i32 1, !1651, !DIExpression(), !1650)
    #dbg_value(i32 128, !1652, !DIExpression(), !1650)
  br label %for.cond, !dbg !1653

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1655
  %k.0 = phi i32 [ 1, %entry ], [ %k.1, %for.inc24 ], !dbg !1656
    #dbg_value(i32 %k.0, !1651, !DIExpression(), !1650)
    #dbg_value(i32 %len.0, !1652, !DIExpression(), !1650)
  %cmp = icmp uge i32 %len.0, 2, !dbg !1657
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1659

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1660, !DIExpression(), !1650)
  br label %for.cond1, !dbg !1661

for.cond1:                                        ; preds = %for.inc21, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add22, %for.inc21 ], !dbg !1664
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc21 ], !dbg !1650
    #dbg_value(i32 %k.1, !1651, !DIExpression(), !1650)
    #dbg_value(i32 %start.0, !1660, !DIExpression(), !1650)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1665
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !1667

for.body3:                                        ; preds = %for.cond1
  %inc = add i32 %k.1, 1, !dbg !1668
    #dbg_value(i32 %inc, !1651, !DIExpression(), !1650)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1670
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1670
    #dbg_value(i16 %0, !1671, !DIExpression(), !1650)
    #dbg_value(i32 %start.0, !1672, !DIExpression(), !1650)
  br label %for.cond4, !dbg !1673

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.inc ], !dbg !1675
    #dbg_value(i32 %j.0, !1672, !DIExpression(), !1650)
  %add = add i32 %start.0, %len.0, !dbg !1676
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1678
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1679

for.body6:                                        ; preds = %for.cond4
  %add7 = add i32 %j.0, %len.0, !dbg !1680
  %arrayidx8 = getelementptr inbounds nuw i16, ptr %r, i32 %add7, !dbg !1682
  %1 = load i16, ptr %arrayidx8, align 2, !dbg !1682
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1683
    #dbg_value(i16 %call, !1684, !DIExpression(), !1650)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1685
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1685
  %conv = sext i16 %2 to i32, !dbg !1685
  %conv10 = sext i16 %call to i32, !dbg !1686
  %sub = sub nsw i32 %conv, %conv10, !dbg !1687
  %conv11 = trunc i32 %sub to i16, !dbg !1685
  %add12 = add i32 %j.0, %len.0, !dbg !1688
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %add12, !dbg !1689
  store i16 %conv11, ptr %arrayidx13, align 2, !dbg !1690
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1691
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !1691
  %conv15 = sext i16 %3 to i32, !dbg !1691
  %conv16 = sext i16 %call to i32, !dbg !1692
  %add17 = add nsw i32 %conv15, %conv16, !dbg !1693
  %conv18 = trunc i32 %add17 to i16, !dbg !1691
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1694
  store i16 %conv18, ptr %arrayidx19, align 2, !dbg !1695
  br label %for.inc, !dbg !1696

for.inc:                                          ; preds = %for.body6
  %inc20 = add i32 %j.0, 1, !dbg !1697
    #dbg_value(i32 %inc20, !1672, !DIExpression(), !1650)
  br label %for.cond4, !dbg !1698, !llvm.loop !1699

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !1701

for.inc21:                                        ; preds = %for.end
  %add22 = add i32 %j.0, %len.0, !dbg !1702
    #dbg_value(i32 %add22, !1660, !DIExpression(), !1650)
  br label %for.cond1, !dbg !1703, !llvm.loop !1704

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !1706

for.inc24:                                        ; preds = %for.end23
  %shr = lshr i32 %len.0, 1, !dbg !1707
    #dbg_value(i32 %shr, !1652, !DIExpression(), !1650)
  br label %for.cond, !dbg !1708, !llvm.loop !1709

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1711
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) #0 !dbg !1712 {
entry:
    #dbg_value(i16 %a, !1715, !DIExpression(), !1716)
    #dbg_value(i16 %b, !1717, !DIExpression(), !1716)
  %conv = sext i16 %a to i32, !dbg !1718
  %conv1 = sext i16 %b to i32, !dbg !1719
  %mul = mul nsw i32 %conv, %conv1, !dbg !1720
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1721
  ret i16 %call, !dbg !1722
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #0 !dbg !1723 {
entry:
    #dbg_value(ptr %r, !1724, !DIExpression(), !1725)
    #dbg_value(i16 1441, !1726, !DIExpression(), !1725)
    #dbg_value(i32 127, !1727, !DIExpression(), !1725)
    #dbg_value(i32 2, !1728, !DIExpression(), !1725)
  br label %for.cond, !dbg !1729

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1731
  %k.0 = phi i32 [ 127, %entry ], [ %k.1, %for.inc29 ], !dbg !1732
    #dbg_value(i32 %k.0, !1727, !DIExpression(), !1725)
    #dbg_value(i32 %len.0, !1728, !DIExpression(), !1725)
  %cmp = icmp ule i32 %len.0, 128, !dbg !1733
  br i1 %cmp, label %for.body, label %for.end30, !dbg !1735

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1736, !DIExpression(), !1725)
  br label %for.cond1, !dbg !1737

for.cond1:                                        ; preds = %for.inc26, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add27, %for.inc26 ], !dbg !1740
  %k.1 = phi i32 [ %k.0, %for.body ], [ %dec, %for.inc26 ], !dbg !1725
    #dbg_value(i32 %k.1, !1727, !DIExpression(), !1725)
    #dbg_value(i32 %start.0, !1736, !DIExpression(), !1725)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1741
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !1743

for.body3:                                        ; preds = %for.cond1
  %dec = add i32 %k.1, -1, !dbg !1744
    #dbg_value(i32 %dec, !1727, !DIExpression(), !1725)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1746
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1746
    #dbg_value(i16 %0, !1747, !DIExpression(), !1725)
    #dbg_value(i32 %start.0, !1748, !DIExpression(), !1725)
  br label %for.cond4, !dbg !1749

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.inc ], !dbg !1751
    #dbg_value(i32 %j.0, !1748, !DIExpression(), !1725)
  %add = add i32 %start.0, %len.0, !dbg !1752
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1754
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1755

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1756
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1756
    #dbg_value(i16 %1, !1758, !DIExpression(), !1725)
  %conv = sext i16 %1 to i32, !dbg !1759
  %add8 = add i32 %j.0, %len.0, !dbg !1760
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %add8, !dbg !1761
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1761
  %conv10 = sext i16 %2 to i32, !dbg !1761
  %add11 = add nsw i32 %conv, %conv10, !dbg !1762
  %conv12 = trunc i32 %add11 to i16, !dbg !1759
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %conv12) #2, !dbg !1763
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1764
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1765
  %add14 = add i32 %j.0, %len.0, !dbg !1766
  %arrayidx15 = getelementptr inbounds nuw i16, ptr %r, i32 %add14, !dbg !1767
  %3 = load i16, ptr %arrayidx15, align 2, !dbg !1767
  %conv16 = sext i16 %3 to i32, !dbg !1767
  %conv17 = sext i16 %1 to i32, !dbg !1768
  %sub = sub nsw i32 %conv16, %conv17, !dbg !1769
  %conv18 = trunc i32 %sub to i16, !dbg !1767
  %add19 = add i32 %j.0, %len.0, !dbg !1770
  %arrayidx20 = getelementptr inbounds nuw i16, ptr %r, i32 %add19, !dbg !1771
  store i16 %conv18, ptr %arrayidx20, align 2, !dbg !1772
  %add21 = add i32 %j.0, %len.0, !dbg !1773
  %arrayidx22 = getelementptr inbounds nuw i16, ptr %r, i32 %add21, !dbg !1774
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !1774
  %call23 = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %4) #2, !dbg !1775
  %add24 = add i32 %j.0, %len.0, !dbg !1776
  %arrayidx25 = getelementptr inbounds nuw i16, ptr %r, i32 %add24, !dbg !1777
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1778
  br label %for.inc, !dbg !1779

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %j.0, 1, !dbg !1780
    #dbg_value(i32 %inc, !1748, !DIExpression(), !1725)
  br label %for.cond4, !dbg !1781, !llvm.loop !1782

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !1784

for.inc26:                                        ; preds = %for.end
  %add27 = add i32 %j.0, %len.0, !dbg !1785
    #dbg_value(i32 %add27, !1736, !DIExpression(), !1725)
  br label %for.cond1, !dbg !1786, !llvm.loop !1787

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !1789

for.inc29:                                        ; preds = %for.end28
  %shl = shl i32 %len.0, 1, !dbg !1790
    #dbg_value(i32 %shl, !1728, !DIExpression(), !1725)
  br label %for.cond, !dbg !1791, !llvm.loop !1792

for.end30:                                        ; preds = %for.cond
    #dbg_value(i32 0, !1748, !DIExpression(), !1725)
  br label %for.cond31, !dbg !1794

for.cond31:                                       ; preds = %for.inc38, %for.end30
  %j.1 = phi i32 [ 0, %for.end30 ], [ %inc39, %for.inc38 ], !dbg !1796
    #dbg_value(i32 %j.1, !1748, !DIExpression(), !1725)
  %cmp32 = icmp ult i32 %j.1, 256, !dbg !1797
  br i1 %cmp32, label %for.body34, label %for.end40, !dbg !1799

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1800
  %5 = load i16, ptr %arrayidx35, align 2, !dbg !1800
  %call36 = call signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext 1441) #2, !dbg !1801
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1802
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1803
  br label %for.inc38, !dbg !1802

for.inc38:                                        ; preds = %for.body34
  %inc39 = add i32 %j.1, 1, !dbg !1804
    #dbg_value(i32 %inc39, !1748, !DIExpression(), !1725)
  br label %for.cond31, !dbg !1805, !llvm.loop !1806

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1808
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) #0 !dbg !1809 {
entry:
    #dbg_value(ptr %r, !1813, !DIExpression(), !1814)
    #dbg_value(ptr %a, !1815, !DIExpression(), !1814)
    #dbg_value(ptr %b, !1816, !DIExpression(), !1814)
    #dbg_value(i16 %zeta, !1817, !DIExpression(), !1814)
  %arrayidx = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1818
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1818
  %arrayidx1 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1819
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1819
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1820
  %arrayidx2 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1821
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1822
  %arrayidx3 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1823
  %2 = load i16, ptr %arrayidx3, align 2, !dbg !1823
  %call4 = call signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %zeta) #2, !dbg !1824
  %arrayidx5 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1825
  store i16 %call4, ptr %arrayidx5, align 2, !dbg !1826
  %arrayidx6 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1827
  %3 = load i16, ptr %arrayidx6, align 2, !dbg !1827
  %arrayidx7 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1828
  %4 = load i16, ptr %arrayidx7, align 2, !dbg !1828
  %call8 = call signext i16 @fqmul(i16 noundef signext %3, i16 noundef signext %4) #2, !dbg !1829
  %conv = sext i16 %call8 to i32, !dbg !1829
  %arrayidx9 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1830
  %5 = load i16, ptr %arrayidx9, align 2, !dbg !1831
  %conv10 = sext i16 %5 to i32, !dbg !1831
  %add = add nsw i32 %conv10, %conv, !dbg !1831
  %conv11 = trunc i32 %add to i16, !dbg !1831
  store i16 %conv11, ptr %arrayidx9, align 2, !dbg !1831
  %arrayidx12 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1832
  %6 = load i16, ptr %arrayidx12, align 2, !dbg !1832
  %arrayidx13 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1833
  %7 = load i16, ptr %arrayidx13, align 2, !dbg !1833
  %call14 = call signext i16 @fqmul(i16 noundef signext %6, i16 noundef signext %7) #2, !dbg !1834
  %arrayidx15 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1835
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1836
  %arrayidx16 = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1837
  %8 = load i16, ptr %arrayidx16, align 2, !dbg !1837
  %arrayidx17 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1838
  %9 = load i16, ptr %arrayidx17, align 2, !dbg !1838
  %call18 = call signext i16 @fqmul(i16 noundef signext %8, i16 noundef signext %9) #2, !dbg !1839
  %conv19 = sext i16 %call18 to i32, !dbg !1839
  %arrayidx20 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1840
  %10 = load i16, ptr %arrayidx20, align 2, !dbg !1841
  %conv21 = sext i16 %10 to i32, !dbg !1841
  %add22 = add nsw i32 %conv21, %conv19, !dbg !1841
  %conv23 = trunc i32 %add22 to i16, !dbg !1841
  store i16 %conv23, ptr %arrayidx20, align 2, !dbg !1841
  ret void, !dbg !1842
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) #0 !dbg !1843 {
entry:
    #dbg_value(ptr %r, !1852, !DIExpression(), !1853)
    #dbg_value(ptr %buf, !1854, !DIExpression(), !1853)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !1855
  ret void, !dbg !1856
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1857 {
entry:
    #dbg_value(ptr %r, !1858, !DIExpression(), !1859)
    #dbg_value(ptr %buf, !1860, !DIExpression(), !1859)
    #dbg_value(i32 0, !1861, !DIExpression(), !1859)
  br label %for.cond, !dbg !1862

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1864
    #dbg_value(i32 %i.0, !1861, !DIExpression(), !1859)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1865
  br i1 %cmp, label %for.body, label %for.end21, !dbg !1867

for.body:                                         ; preds = %for.cond
  %mul = mul i32 4, %i.0, !dbg !1868
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1870
  %call = call i32 @load32_littleendian(ptr noundef %add.ptr) #2, !dbg !1871
    #dbg_value(i32 %call, !1872, !DIExpression(), !1859)
  %and = and i32 %call, 1431655765, !dbg !1873
    #dbg_value(i32 %and, !1874, !DIExpression(), !1859)
  %shr = lshr i32 %call, 1, !dbg !1875
  %and1 = and i32 %shr, 1431655765, !dbg !1876
  %add = add i32 %and, %and1, !dbg !1877
    #dbg_value(i32 %add, !1874, !DIExpression(), !1859)
    #dbg_value(i32 0, !1878, !DIExpression(), !1859)
  br label %for.cond2, !dbg !1879

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1881
    #dbg_value(i32 %j.0, !1878, !DIExpression(), !1859)
  %cmp3 = icmp ult i32 %j.0, 8, !dbg !1882
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !1884

for.body4:                                        ; preds = %for.cond2
  %mul5 = mul i32 4, %j.0, !dbg !1885
  %add6 = add i32 %mul5, 0, !dbg !1887
  %shr7 = lshr i32 %add, %add6, !dbg !1888
  %and8 = and i32 %shr7, 3, !dbg !1889
  %conv = trunc i32 %and8 to i16, !dbg !1890
    #dbg_value(i16 %conv, !1891, !DIExpression(), !1859)
  %mul9 = mul i32 4, %j.0, !dbg !1892
  %add10 = add i32 %mul9, 2, !dbg !1893
  %shr11 = lshr i32 %add, %add10, !dbg !1894
  %and12 = and i32 %shr11, 3, !dbg !1895
  %conv13 = trunc i32 %and12 to i16, !dbg !1896
    #dbg_value(i16 %conv13, !1897, !DIExpression(), !1859)
  %conv14 = sext i16 %conv to i32, !dbg !1898
  %conv15 = sext i16 %conv13 to i32, !dbg !1899
  %sub = sub nsw i32 %conv14, %conv15, !dbg !1900
  %conv16 = trunc i32 %sub to i16, !dbg !1898
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1901
  %mul17 = mul i32 8, %i.0, !dbg !1902
  %add18 = add i32 %mul17, %j.0, !dbg !1903
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add18, !dbg !1904
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1905
  br label %for.inc, !dbg !1906

for.inc:                                          ; preds = %for.body4
  %inc = add i32 %j.0, 1, !dbg !1907
    #dbg_value(i32 %inc, !1878, !DIExpression(), !1859)
  br label %for.cond2, !dbg !1908, !llvm.loop !1909

for.end:                                          ; preds = %for.cond2
  br label %for.inc19, !dbg !1911

for.inc19:                                        ; preds = %for.end
  %inc20 = add i32 %i.0, 1, !dbg !1912
    #dbg_value(i32 %inc20, !1861, !DIExpression(), !1859)
  br label %for.cond, !dbg !1913, !llvm.loop !1914

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1916
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load32_littleendian(ptr noundef %x) #0 !dbg !1917 {
entry:
    #dbg_value(ptr %x, !1920, !DIExpression(), !1921)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !1922
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1922
  %conv = zext i8 %0 to i32, !dbg !1923
    #dbg_value(i32 %conv, !1924, !DIExpression(), !1921)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !1925
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1925
  %conv2 = zext i8 %1 to i32, !dbg !1926
  %shl = shl i32 %conv2, 8, !dbg !1927
  %or = or i32 %conv, %shl, !dbg !1928
    #dbg_value(i32 %or, !1924, !DIExpression(), !1921)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !1929
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1929
  %conv4 = zext i8 %2 to i32, !dbg !1930
  %shl5 = shl i32 %conv4, 16, !dbg !1931
  %or6 = or i32 %or, %shl5, !dbg !1932
    #dbg_value(i32 %or6, !1924, !DIExpression(), !1921)
  %arrayidx7 = getelementptr inbounds i8, ptr %x, i32 3, !dbg !1933
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1933
  %conv8 = zext i8 %3 to i32, !dbg !1934
  %shl9 = shl i32 %conv8, 24, !dbg !1935
  %or10 = or i32 %or6, %shl9, !dbg !1936
    #dbg_value(i32 %or10, !1924, !DIExpression(), !1921)
  ret i32 %or10, !dbg !1937
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1938 {
entry:
    #dbg_value(ptr %r, !1939, !DIExpression(), !1940)
    #dbg_value(ptr %buf, !1941, !DIExpression(), !1940)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !1942
  ret void, !dbg !1943
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) #0 !dbg !1944 {
entry:
    #dbg_value(i32 %a, !1947, !DIExpression(), !1948)
  %conv = trunc i32 %a to i16, !dbg !1949
  %conv1 = sext i16 %conv to i32, !dbg !1949
  %mul = mul nsw i32 %conv1, -3327, !dbg !1950
  %conv2 = trunc i32 %mul to i16, !dbg !1949
    #dbg_value(i16 %conv2, !1951, !DIExpression(), !1948)
  %conv3 = sext i16 %conv2 to i32, !dbg !1952
  %mul4 = mul nsw i32 %conv3, 3329, !dbg !1953
  %sub = sub nsw i32 %a, %mul4, !dbg !1954
  %shr = ashr i32 %sub, 16, !dbg !1955
  %conv5 = trunc i32 %shr to i16, !dbg !1956
    #dbg_value(i16 %conv5, !1951, !DIExpression(), !1948)
  ret i16 %conv5, !dbg !1957
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) #0 !dbg !1958 {
entry:
    #dbg_value(i16 %a, !1961, !DIExpression(), !1962)
    #dbg_value(i16 20159, !1963, !DIExpression(), !1962)
  %conv = sext i16 %a to i32, !dbg !1964
  %mul = mul nsw i32 20159, %conv, !dbg !1965
  %add = add nsw i32 %mul, 33554432, !dbg !1966
  %shr = ashr i32 %add, 26, !dbg !1967
  %conv1 = trunc i32 %shr to i16, !dbg !1968
    #dbg_value(i16 %conv1, !1969, !DIExpression(), !1962)
  %conv2 = sext i16 %conv1 to i32, !dbg !1970
  %mul3 = mul nsw i32 %conv2, 3329, !dbg !1970
  %conv4 = trunc i32 %mul3 to i16, !dbg !1970
    #dbg_value(i16 %conv4, !1969, !DIExpression(), !1962)
  %conv5 = sext i16 %a to i32, !dbg !1971
  %conv6 = sext i16 %conv4 to i32, !dbg !1972
  %sub = sub nsw i32 %conv5, %conv6, !dbg !1973
  %conv7 = trunc i32 %sub to i16, !dbg !1971
  ret i16 %conv7, !dbg !1974
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) #0 !dbg !1975 {
entry:
    #dbg_value(ptr %a, !1981, !DIExpression(), !1982)
    #dbg_value(ptr %b, !1983, !DIExpression(), !1982)
    #dbg_value(i32 %len, !1984, !DIExpression(), !1982)
    #dbg_value(i8 0, !1985, !DIExpression(), !1982)
    #dbg_value(i32 0, !1986, !DIExpression(), !1982)
  br label %for.cond, !dbg !1987

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1989
  %r.0 = phi i8 [ 0, %entry ], [ %conv4, %for.inc ], !dbg !1982
    #dbg_value(i8 %r.0, !1985, !DIExpression(), !1982)
    #dbg_value(i32 %i.0, !1986, !DIExpression(), !1982)
  %cmp = icmp ult i32 %i.0, %len, !dbg !1990
  br i1 %cmp, label %for.body, label %for.end, !dbg !1992

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1993
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1993
  %conv = zext i8 %0 to i32, !dbg !1993
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1994
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1994
  %conv2 = zext i8 %1 to i32, !dbg !1994
  %xor = xor i32 %conv, %conv2, !dbg !1995
  %conv3 = zext i8 %r.0 to i32, !dbg !1996
  %or = or i32 %conv3, %xor, !dbg !1996
  %conv4 = trunc i32 %or to i8, !dbg !1996
    #dbg_value(i8 %conv4, !1985, !DIExpression(), !1982)
  br label %for.inc, !dbg !1997

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1998
    #dbg_value(i32 %inc, !1986, !DIExpression(), !1982)
  br label %for.cond, !dbg !1999, !llvm.loop !2000

for.end:                                          ; preds = %for.cond
  %conv5 = zext i8 %r.0 to i64, !dbg !2002
  %sub = sub i64 0, %conv5, !dbg !2003
  %shr = lshr i64 %sub, 63, !dbg !2004
  %conv6 = trunc i64 %shr to i32, !dbg !2005
  ret i32 %conv6, !dbg !2006
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) #0 !dbg !2007 {
entry:
    #dbg_value(ptr %r, !2010, !DIExpression(), !2011)
    #dbg_value(ptr %x, !2012, !DIExpression(), !2011)
    #dbg_value(i32 %len, !2013, !DIExpression(), !2011)
    #dbg_value(i8 %b, !2014, !DIExpression(), !2011)
  %0 = call i8 asm "", "=r,0"(i8 %b) #3, !dbg !2015, !srcloc !2016
    #dbg_value(i8 %0, !2014, !DIExpression(), !2011)
  %conv = zext i8 %0 to i32, !dbg !2017
  %sub = sub nsw i32 0, %conv, !dbg !2018
  %conv1 = trunc i32 %sub to i8, !dbg !2018
    #dbg_value(i8 %conv1, !2014, !DIExpression(), !2011)
    #dbg_value(i32 0, !2019, !DIExpression(), !2011)
  br label %for.cond, !dbg !2020

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2022
    #dbg_value(i32 %i.0, !2019, !DIExpression(), !2011)
  %cmp = icmp ult i32 %i.0, %len, !dbg !2023
  br i1 %cmp, label %for.body, label %for.end, !dbg !2025

for.body:                                         ; preds = %for.cond
  %conv3 = zext i8 %conv1 to i32, !dbg !2026
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2027
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2027
  %conv4 = zext i8 %1 to i32, !dbg !2027
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2028
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !2028
  %conv6 = zext i8 %2 to i32, !dbg !2028
  %xor = xor i32 %conv4, %conv6, !dbg !2029
  %and = and i32 %conv3, %xor, !dbg !2030
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2031
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2032
  %conv8 = zext i8 %3 to i32, !dbg !2032
  %xor9 = xor i32 %conv8, %and, !dbg !2032
  %conv10 = trunc i32 %xor9 to i8, !dbg !2032
  store i8 %conv10, ptr %arrayidx7, align 1, !dbg !2032
  br label %for.inc, !dbg !2031

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2033
    #dbg_value(i32 %inc, !2019, !DIExpression(), !2011)
  br label %for.cond, !dbg !2034, !llvm.loop !2035

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2037
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) #0 !dbg !2038 {
entry:
    #dbg_value(ptr %r, !2041, !DIExpression(), !2042)
    #dbg_value(i16 %v, !2043, !DIExpression(), !2042)
    #dbg_value(i16 %b, !2044, !DIExpression(), !2042)
  %conv = zext i16 %b to i32, !dbg !2045
  %sub = sub nsw i32 0, %conv, !dbg !2046
  %conv1 = trunc i32 %sub to i16, !dbg !2046
    #dbg_value(i16 %conv1, !2044, !DIExpression(), !2042)
  %conv2 = zext i16 %conv1 to i32, !dbg !2047
  %0 = load i16, ptr %r, align 2, !dbg !2048
  %conv3 = sext i16 %0 to i32, !dbg !2049
  %conv4 = sext i16 %v to i32, !dbg !2050
  %xor = xor i32 %conv3, %conv4, !dbg !2051
  %and = and i32 %conv2, %xor, !dbg !2052
  %1 = load i16, ptr %r, align 2, !dbg !2053
  %conv5 = sext i16 %1 to i32, !dbg !2053
  %xor6 = xor i32 %conv5, %and, !dbg !2053
  %conv7 = trunc i32 %xor6 to i16, !dbg !2053
  store i16 %conv7, ptr %r, align 2, !dbg !2053
  ret void, !dbg !2054
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) #0 !dbg !2055 {
entry:
    #dbg_value(ptr %state, !2064, !DIExpression(), !2065)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2066
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2067
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2068
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2069
  store i32 0, ptr %pos, align 8, !dbg !2070
  ret void, !dbg !2071
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_init(ptr noundef %s) #0 !dbg !2072 {
entry:
    #dbg_value(ptr %s, !2076, !DIExpression(), !2077)
    #dbg_value(i32 0, !2078, !DIExpression(), !2077)
  br label %for.cond, !dbg !2079

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2081
    #dbg_value(i32 %i.0, !2078, !DIExpression(), !2077)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2082
  br i1 %cmp, label %for.body, label %for.end, !dbg !2084

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2085
  store i64 0, ptr %arrayidx, align 8, !dbg !2086
  br label %for.inc, !dbg !2085

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2087
    #dbg_value(i32 %inc, !2078, !DIExpression(), !2077)
  br label %for.cond, !dbg !2088, !llvm.loop !2089

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2091
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2092 {
entry:
    #dbg_value(ptr %state, !2095, !DIExpression(), !2096)
    #dbg_value(ptr %in, !2097, !DIExpression(), !2096)
    #dbg_value(i32 %inlen, !2098, !DIExpression(), !2096)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2099
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2100
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2101
  %0 = load i32, ptr %pos, align 8, !dbg !2101
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2102
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2103
  store i32 %call, ptr %pos1, align 8, !dbg !2104
  ret void, !dbg !2105
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2106 {
entry:
    #dbg_value(ptr %s, !2109, !DIExpression(), !2110)
    #dbg_value(i32 %pos, !2111, !DIExpression(), !2110)
    #dbg_value(i32 %r, !2112, !DIExpression(), !2110)
    #dbg_value(ptr %in, !2113, !DIExpression(), !2110)
    #dbg_value(i32 %inlen, !2114, !DIExpression(), !2110)
  br label %while.cond, !dbg !2115

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !2111, !DIExpression(), !2110)
    #dbg_value(i32 %inlen.addr.0, !2114, !DIExpression(), !2110)
    #dbg_value(ptr %in.addr.0, !2113, !DIExpression(), !2110)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2116
  %cmp = icmp uge i32 %add, %r, !dbg !2117
  br i1 %cmp, label %while.body, label %while.end, !dbg !2115

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2118, !DIExpression(), !2110)
  br label %for.cond, !dbg !2119

for.cond:                                         ; preds = %for.inc, %while.body
  %in.addr.1 = phi ptr [ %in.addr.0, %while.body ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ %pos.addr.0, %while.body ], [ %inc, %for.inc ], !dbg !2122
    #dbg_value(i32 %i.0, !2118, !DIExpression(), !2110)
    #dbg_value(ptr %in.addr.1, !2113, !DIExpression(), !2110)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2125

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2126
    #dbg_value(ptr %incdec.ptr, !2113, !DIExpression(), !2110)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2127
  %conv = zext i8 %0 to i64, !dbg !2128
  %rem = urem i32 %i.0, 8, !dbg !2129
  %mul = mul i32 8, %rem, !dbg !2130
  %sh_prom = zext i32 %mul to i64, !dbg !2131
  %shl = shl i64 %conv, %sh_prom, !dbg !2131
  %div = udiv i32 %i.0, 8, !dbg !2132
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2133
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2134
  %xor = xor i64 %1, %shl, !dbg !2134
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2134
  br label %for.inc, !dbg !2133

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2135
    #dbg_value(i32 %inc, !2118, !DIExpression(), !2110)
  br label %for.cond, !dbg !2136, !llvm.loop !2137

for.end:                                          ; preds = %for.cond
  %sub = sub i32 %r, %pos.addr.0, !dbg !2139
  %sub2 = sub i32 %inlen.addr.0, %sub, !dbg !2140
    #dbg_value(i32 %sub2, !2114, !DIExpression(), !2110)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2141
    #dbg_value(i32 0, !2111, !DIExpression(), !2110)
  br label %while.cond, !dbg !2115, !llvm.loop !2142

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2118, !DIExpression(), !2110)
  br label %for.cond3, !dbg !2144

for.cond3:                                        ; preds = %for.inc17, %while.end
  %in.addr.2 = phi ptr [ %in.addr.0, %while.end ], [ %incdec.ptr8, %for.inc17 ]
  %i.1 = phi i32 [ %pos.addr.0, %while.end ], [ %inc18, %for.inc17 ], !dbg !2146
    #dbg_value(i32 %i.1, !2118, !DIExpression(), !2110)
    #dbg_value(ptr %in.addr.2, !2113, !DIExpression(), !2110)
  %add4 = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2147
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2149
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2150

for.body7:                                        ; preds = %for.cond3
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2151
    #dbg_value(ptr %incdec.ptr8, !2113, !DIExpression(), !2110)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2152
  %conv9 = zext i8 %2 to i64, !dbg !2153
  %rem10 = urem i32 %i.1, 8, !dbg !2154
  %mul11 = mul i32 8, %rem10, !dbg !2155
  %sh_prom12 = zext i32 %mul11 to i64, !dbg !2156
  %shl13 = shl i64 %conv9, %sh_prom12, !dbg !2156
  %div14 = udiv i32 %i.1, 8, !dbg !2157
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div14, !dbg !2158
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2159
  %xor16 = xor i64 %3, %shl13, !dbg !2159
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2159
  br label %for.inc17, !dbg !2158

for.inc17:                                        ; preds = %for.body7
  %inc18 = add i32 %i.1, 1, !dbg !2160
    #dbg_value(i32 %inc18, !2118, !DIExpression(), !2110)
  br label %for.cond3, !dbg !2161, !llvm.loop !2162

for.end19:                                        ; preds = %for.cond3
  ret i32 %i.1, !dbg !2164
}

; Function Attrs: noinline nounwind optnone
define internal void @KeccakF1600_StatePermute(ptr noundef %state) #0 !dbg !2165 {
entry:
    #dbg_value(ptr %state, !2166, !DIExpression(), !2167)
  %arrayidx = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2168
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2168
    #dbg_value(i64 %0, !2169, !DIExpression(), !2167)
  %arrayidx1 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2170
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2170
    #dbg_value(i64 %1, !2171, !DIExpression(), !2167)
  %arrayidx2 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2172
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2172
    #dbg_value(i64 %2, !2173, !DIExpression(), !2167)
  %arrayidx3 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2174
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2174
    #dbg_value(i64 %3, !2175, !DIExpression(), !2167)
  %arrayidx4 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2176
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2176
    #dbg_value(i64 %4, !2177, !DIExpression(), !2167)
  %arrayidx5 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2178
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2178
    #dbg_value(i64 %5, !2179, !DIExpression(), !2167)
  %arrayidx6 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2180
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2180
    #dbg_value(i64 %6, !2181, !DIExpression(), !2167)
  %arrayidx7 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2182
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2182
    #dbg_value(i64 %7, !2183, !DIExpression(), !2167)
  %arrayidx8 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2184
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2184
    #dbg_value(i64 %8, !2185, !DIExpression(), !2167)
  %arrayidx9 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2186
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2186
    #dbg_value(i64 %9, !2187, !DIExpression(), !2167)
  %arrayidx10 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2188
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2188
    #dbg_value(i64 %10, !2189, !DIExpression(), !2167)
  %arrayidx11 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2190
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2190
    #dbg_value(i64 %11, !2191, !DIExpression(), !2167)
  %arrayidx12 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2192
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2192
    #dbg_value(i64 %12, !2193, !DIExpression(), !2167)
  %arrayidx13 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2194
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2194
    #dbg_value(i64 %13, !2195, !DIExpression(), !2167)
  %arrayidx14 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2196
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2196
    #dbg_value(i64 %14, !2197, !DIExpression(), !2167)
  %arrayidx15 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2198
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2198
    #dbg_value(i64 %15, !2199, !DIExpression(), !2167)
  %arrayidx16 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2200
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2200
    #dbg_value(i64 %16, !2201, !DIExpression(), !2167)
  %arrayidx17 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2202
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2202
    #dbg_value(i64 %17, !2203, !DIExpression(), !2167)
  %arrayidx18 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2204
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2204
    #dbg_value(i64 %18, !2205, !DIExpression(), !2167)
  %arrayidx19 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2206
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2206
    #dbg_value(i64 %19, !2207, !DIExpression(), !2167)
  %arrayidx20 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2208
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2208
    #dbg_value(i64 %20, !2209, !DIExpression(), !2167)
  %arrayidx21 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2210
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2210
    #dbg_value(i64 %21, !2211, !DIExpression(), !2167)
  %arrayidx22 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2212
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2212
    #dbg_value(i64 %22, !2213, !DIExpression(), !2167)
  %arrayidx23 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2214
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2214
    #dbg_value(i64 %23, !2215, !DIExpression(), !2167)
  %arrayidx24 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2216
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2216
    #dbg_value(i64 %24, !2217, !DIExpression(), !2167)
    #dbg_value(i32 0, !2218, !DIExpression(), !2167)
  br label %for.cond, !dbg !2219

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2167
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2167
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2167
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2167
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2167
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2167
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2167
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2167
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2167
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2167
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2167
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2167
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2167
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2167
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2167
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2167
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2167
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2167
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2167
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2167
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2167
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2167
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2167
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2167
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2221
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2167
    #dbg_value(i64 %Asu.0, !2217, !DIExpression(), !2167)
    #dbg_value(i32 %round.0, !2218, !DIExpression(), !2167)
    #dbg_value(i64 %Aba.0, !2169, !DIExpression(), !2167)
    #dbg_value(i64 %Abe.0, !2171, !DIExpression(), !2167)
    #dbg_value(i64 %Abi.0, !2173, !DIExpression(), !2167)
    #dbg_value(i64 %Abo.0, !2175, !DIExpression(), !2167)
    #dbg_value(i64 %Abu.0, !2177, !DIExpression(), !2167)
    #dbg_value(i64 %Aga.0, !2179, !DIExpression(), !2167)
    #dbg_value(i64 %Age.0, !2181, !DIExpression(), !2167)
    #dbg_value(i64 %Agi.0, !2183, !DIExpression(), !2167)
    #dbg_value(i64 %Ago.0, !2185, !DIExpression(), !2167)
    #dbg_value(i64 %Agu.0, !2187, !DIExpression(), !2167)
    #dbg_value(i64 %Aka.0, !2189, !DIExpression(), !2167)
    #dbg_value(i64 %Ake.0, !2191, !DIExpression(), !2167)
    #dbg_value(i64 %Aki.0, !2193, !DIExpression(), !2167)
    #dbg_value(i64 %Ako.0, !2195, !DIExpression(), !2167)
    #dbg_value(i64 %Aku.0, !2197, !DIExpression(), !2167)
    #dbg_value(i64 %Ama.0, !2199, !DIExpression(), !2167)
    #dbg_value(i64 %Ame.0, !2201, !DIExpression(), !2167)
    #dbg_value(i64 %Ami.0, !2203, !DIExpression(), !2167)
    #dbg_value(i64 %Amo.0, !2205, !DIExpression(), !2167)
    #dbg_value(i64 %Amu.0, !2207, !DIExpression(), !2167)
    #dbg_value(i64 %Asa.0, !2209, !DIExpression(), !2167)
    #dbg_value(i64 %Ase.0, !2211, !DIExpression(), !2167)
    #dbg_value(i64 %Asi.0, !2213, !DIExpression(), !2167)
    #dbg_value(i64 %Aso.0, !2215, !DIExpression(), !2167)
  %cmp = icmp slt i32 %round.0, 24, !dbg !2222
  br i1 %cmp, label %for.body, label %for.end, !dbg !2224

for.body:                                         ; preds = %for.cond
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2225
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2227
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2228
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2229
    #dbg_value(i64 %xor27, !2230, !DIExpression(), !2167)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2231
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2232
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2233
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2234
    #dbg_value(i64 %xor31, !2235, !DIExpression(), !2167)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2236
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2237
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2238
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2239
    #dbg_value(i64 %xor35, !2240, !DIExpression(), !2167)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2241
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2242
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2243
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2244
    #dbg_value(i64 %xor39, !2245, !DIExpression(), !2167)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2246
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2247
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2248
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2249
    #dbg_value(i64 %xor43, !2250, !DIExpression(), !2167)
  %shl = shl i64 %xor31, 1, !dbg !2251
  %shr = lshr i64 %xor31, 63, !dbg !2251
  %xor44 = xor i64 %shl, %shr, !dbg !2251
  %xor45 = xor i64 %xor43, %xor44, !dbg !2252
    #dbg_value(i64 %xor45, !2253, !DIExpression(), !2167)
  %shl46 = shl i64 %xor35, 1, !dbg !2254
  %shr47 = lshr i64 %xor35, 63, !dbg !2254
  %xor48 = xor i64 %shl46, %shr47, !dbg !2254
  %xor49 = xor i64 %xor27, %xor48, !dbg !2255
    #dbg_value(i64 %xor49, !2256, !DIExpression(), !2167)
  %shl50 = shl i64 %xor39, 1, !dbg !2257
  %shr51 = lshr i64 %xor39, 63, !dbg !2257
  %xor52 = xor i64 %shl50, %shr51, !dbg !2257
  %xor53 = xor i64 %xor31, %xor52, !dbg !2258
    #dbg_value(i64 %xor53, !2259, !DIExpression(), !2167)
  %shl54 = shl i64 %xor43, 1, !dbg !2260
  %shr55 = lshr i64 %xor43, 63, !dbg !2260
  %xor56 = xor i64 %shl54, %shr55, !dbg !2260
  %xor57 = xor i64 %xor35, %xor56, !dbg !2261
    #dbg_value(i64 %xor57, !2262, !DIExpression(), !2167)
  %shl58 = shl i64 %xor27, 1, !dbg !2263
  %shr59 = lshr i64 %xor27, 63, !dbg !2263
  %xor60 = xor i64 %shl58, %shr59, !dbg !2263
  %xor61 = xor i64 %xor39, %xor60, !dbg !2264
    #dbg_value(i64 %xor61, !2265, !DIExpression(), !2167)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2266
    #dbg_value(i64 %xor62, !2169, !DIExpression(), !2167)
    #dbg_value(i64 %xor62, !2230, !DIExpression(), !2167)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2267
    #dbg_value(i64 %xor63, !2181, !DIExpression(), !2167)
  %shl64 = shl i64 %xor63, 44, !dbg !2268
  %shr65 = lshr i64 %xor63, 20, !dbg !2268
  %xor66 = xor i64 %shl64, %shr65, !dbg !2268
    #dbg_value(i64 %xor66, !2235, !DIExpression(), !2167)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2269
    #dbg_value(i64 %xor67, !2193, !DIExpression(), !2167)
  %shl68 = shl i64 %xor67, 43, !dbg !2270
  %shr69 = lshr i64 %xor67, 21, !dbg !2270
  %xor70 = xor i64 %shl68, %shr69, !dbg !2270
    #dbg_value(i64 %xor70, !2240, !DIExpression(), !2167)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2271
    #dbg_value(i64 %xor71, !2205, !DIExpression(), !2167)
  %shl72 = shl i64 %xor71, 21, !dbg !2272
  %shr73 = lshr i64 %xor71, 43, !dbg !2272
  %xor74 = xor i64 %shl72, %shr73, !dbg !2272
    #dbg_value(i64 %xor74, !2245, !DIExpression(), !2167)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2273
    #dbg_value(i64 %xor75, !2217, !DIExpression(), !2167)
  %shl76 = shl i64 %xor75, 14, !dbg !2274
  %shr77 = lshr i64 %xor75, 50, !dbg !2274
  %xor78 = xor i64 %shl76, %shr77, !dbg !2274
    #dbg_value(i64 %xor78, !2250, !DIExpression(), !2167)
  %not = xor i64 %xor66, -1, !dbg !2275
  %and = and i64 %not, %xor70, !dbg !2276
  %xor79 = xor i64 %xor62, %and, !dbg !2277
    #dbg_value(i64 %xor79, !2278, !DIExpression(), !2167)
  %arrayidx80 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2279
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2279
  %xor81 = xor i64 %xor79, %25, !dbg !2280
    #dbg_value(i64 %xor81, !2278, !DIExpression(), !2167)
  %not82 = xor i64 %xor70, -1, !dbg !2281
  %and83 = and i64 %not82, %xor74, !dbg !2282
  %xor84 = xor i64 %xor66, %and83, !dbg !2283
    #dbg_value(i64 %xor84, !2284, !DIExpression(), !2167)
  %not85 = xor i64 %xor74, -1, !dbg !2285
  %and86 = and i64 %not85, %xor78, !dbg !2286
  %xor87 = xor i64 %xor70, %and86, !dbg !2287
    #dbg_value(i64 %xor87, !2288, !DIExpression(), !2167)
  %not88 = xor i64 %xor78, -1, !dbg !2289
  %and89 = and i64 %not88, %xor62, !dbg !2290
  %xor90 = xor i64 %xor74, %and89, !dbg !2291
    #dbg_value(i64 %xor90, !2292, !DIExpression(), !2167)
  %not91 = xor i64 %xor62, -1, !dbg !2293
  %and92 = and i64 %not91, %xor66, !dbg !2294
  %xor93 = xor i64 %xor78, %and92, !dbg !2295
    #dbg_value(i64 %xor93, !2296, !DIExpression(), !2167)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2297
    #dbg_value(i64 %xor94, !2175, !DIExpression(), !2167)
  %shl95 = shl i64 %xor94, 28, !dbg !2298
  %shr96 = lshr i64 %xor94, 36, !dbg !2298
  %xor97 = xor i64 %shl95, %shr96, !dbg !2298
    #dbg_value(i64 %xor97, !2230, !DIExpression(), !2167)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2299
    #dbg_value(i64 %xor98, !2187, !DIExpression(), !2167)
  %shl99 = shl i64 %xor98, 20, !dbg !2300
  %shr100 = lshr i64 %xor98, 44, !dbg !2300
  %xor101 = xor i64 %shl99, %shr100, !dbg !2300
    #dbg_value(i64 %xor101, !2235, !DIExpression(), !2167)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2301
    #dbg_value(i64 %xor102, !2189, !DIExpression(), !2167)
  %shl103 = shl i64 %xor102, 3, !dbg !2302
  %shr104 = lshr i64 %xor102, 61, !dbg !2302
  %xor105 = xor i64 %shl103, %shr104, !dbg !2302
    #dbg_value(i64 %xor105, !2240, !DIExpression(), !2167)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2303
    #dbg_value(i64 %xor106, !2201, !DIExpression(), !2167)
  %shl107 = shl i64 %xor106, 45, !dbg !2304
  %shr108 = lshr i64 %xor106, 19, !dbg !2304
  %xor109 = xor i64 %shl107, %shr108, !dbg !2304
    #dbg_value(i64 %xor109, !2245, !DIExpression(), !2167)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2305
    #dbg_value(i64 %xor110, !2213, !DIExpression(), !2167)
  %shl111 = shl i64 %xor110, 61, !dbg !2306
  %shr112 = lshr i64 %xor110, 3, !dbg !2306
  %xor113 = xor i64 %shl111, %shr112, !dbg !2306
    #dbg_value(i64 %xor113, !2250, !DIExpression(), !2167)
  %not114 = xor i64 %xor101, -1, !dbg !2307
  %and115 = and i64 %not114, %xor105, !dbg !2308
  %xor116 = xor i64 %xor97, %and115, !dbg !2309
    #dbg_value(i64 %xor116, !2310, !DIExpression(), !2167)
  %not117 = xor i64 %xor105, -1, !dbg !2311
  %and118 = and i64 %not117, %xor109, !dbg !2312
  %xor119 = xor i64 %xor101, %and118, !dbg !2313
    #dbg_value(i64 %xor119, !2314, !DIExpression(), !2167)
  %not120 = xor i64 %xor109, -1, !dbg !2315
  %and121 = and i64 %not120, %xor113, !dbg !2316
  %xor122 = xor i64 %xor105, %and121, !dbg !2317
    #dbg_value(i64 %xor122, !2318, !DIExpression(), !2167)
  %not123 = xor i64 %xor113, -1, !dbg !2319
  %and124 = and i64 %not123, %xor97, !dbg !2320
  %xor125 = xor i64 %xor109, %and124, !dbg !2321
    #dbg_value(i64 %xor125, !2322, !DIExpression(), !2167)
  %not126 = xor i64 %xor97, -1, !dbg !2323
  %and127 = and i64 %not126, %xor101, !dbg !2324
  %xor128 = xor i64 %xor113, %and127, !dbg !2325
    #dbg_value(i64 %xor128, !2326, !DIExpression(), !2167)
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2327
    #dbg_value(i64 %xor129, !2171, !DIExpression(), !2167)
  %shl130 = shl i64 %xor129, 1, !dbg !2328
  %shr131 = lshr i64 %xor129, 63, !dbg !2328
  %xor132 = xor i64 %shl130, %shr131, !dbg !2328
    #dbg_value(i64 %xor132, !2230, !DIExpression(), !2167)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2329
    #dbg_value(i64 %xor133, !2183, !DIExpression(), !2167)
  %shl134 = shl i64 %xor133, 6, !dbg !2330
  %shr135 = lshr i64 %xor133, 58, !dbg !2330
  %xor136 = xor i64 %shl134, %shr135, !dbg !2330
    #dbg_value(i64 %xor136, !2235, !DIExpression(), !2167)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2331
    #dbg_value(i64 %xor137, !2195, !DIExpression(), !2167)
  %shl138 = shl i64 %xor137, 25, !dbg !2332
  %shr139 = lshr i64 %xor137, 39, !dbg !2332
  %xor140 = xor i64 %shl138, %shr139, !dbg !2332
    #dbg_value(i64 %xor140, !2240, !DIExpression(), !2167)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2333
    #dbg_value(i64 %xor141, !2207, !DIExpression(), !2167)
  %shl142 = shl i64 %xor141, 8, !dbg !2334
  %shr143 = lshr i64 %xor141, 56, !dbg !2334
  %xor144 = xor i64 %shl142, %shr143, !dbg !2334
    #dbg_value(i64 %xor144, !2245, !DIExpression(), !2167)
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2335
    #dbg_value(i64 %xor145, !2209, !DIExpression(), !2167)
  %shl146 = shl i64 %xor145, 18, !dbg !2336
  %shr147 = lshr i64 %xor145, 46, !dbg !2336
  %xor148 = xor i64 %shl146, %shr147, !dbg !2336
    #dbg_value(i64 %xor148, !2250, !DIExpression(), !2167)
  %not149 = xor i64 %xor136, -1, !dbg !2337
  %and150 = and i64 %not149, %xor140, !dbg !2338
  %xor151 = xor i64 %xor132, %and150, !dbg !2339
    #dbg_value(i64 %xor151, !2340, !DIExpression(), !2167)
  %not152 = xor i64 %xor140, -1, !dbg !2341
  %and153 = and i64 %not152, %xor144, !dbg !2342
  %xor154 = xor i64 %xor136, %and153, !dbg !2343
    #dbg_value(i64 %xor154, !2344, !DIExpression(), !2167)
  %not155 = xor i64 %xor144, -1, !dbg !2345
  %and156 = and i64 %not155, %xor148, !dbg !2346
  %xor157 = xor i64 %xor140, %and156, !dbg !2347
    #dbg_value(i64 %xor157, !2348, !DIExpression(), !2167)
  %not158 = xor i64 %xor148, -1, !dbg !2349
  %and159 = and i64 %not158, %xor132, !dbg !2350
  %xor160 = xor i64 %xor144, %and159, !dbg !2351
    #dbg_value(i64 %xor160, !2352, !DIExpression(), !2167)
  %not161 = xor i64 %xor132, -1, !dbg !2353
  %and162 = and i64 %not161, %xor136, !dbg !2354
  %xor163 = xor i64 %xor148, %and162, !dbg !2355
    #dbg_value(i64 %xor163, !2356, !DIExpression(), !2167)
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2357
    #dbg_value(i64 %xor164, !2177, !DIExpression(), !2167)
  %shl165 = shl i64 %xor164, 27, !dbg !2358
  %shr166 = lshr i64 %xor164, 37, !dbg !2358
  %xor167 = xor i64 %shl165, %shr166, !dbg !2358
    #dbg_value(i64 %xor167, !2230, !DIExpression(), !2167)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2359
    #dbg_value(i64 %xor168, !2179, !DIExpression(), !2167)
  %shl169 = shl i64 %xor168, 36, !dbg !2360
  %shr170 = lshr i64 %xor168, 28, !dbg !2360
  %xor171 = xor i64 %shl169, %shr170, !dbg !2360
    #dbg_value(i64 %xor171, !2235, !DIExpression(), !2167)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2361
    #dbg_value(i64 %xor172, !2191, !DIExpression(), !2167)
  %shl173 = shl i64 %xor172, 10, !dbg !2362
  %shr174 = lshr i64 %xor172, 54, !dbg !2362
  %xor175 = xor i64 %shl173, %shr174, !dbg !2362
    #dbg_value(i64 %xor175, !2240, !DIExpression(), !2167)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2363
    #dbg_value(i64 %xor176, !2203, !DIExpression(), !2167)
  %shl177 = shl i64 %xor176, 15, !dbg !2364
  %shr178 = lshr i64 %xor176, 49, !dbg !2364
  %xor179 = xor i64 %shl177, %shr178, !dbg !2364
    #dbg_value(i64 %xor179, !2245, !DIExpression(), !2167)
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2365
    #dbg_value(i64 %xor180, !2215, !DIExpression(), !2167)
  %shl181 = shl i64 %xor180, 56, !dbg !2366
  %shr182 = lshr i64 %xor180, 8, !dbg !2366
  %xor183 = xor i64 %shl181, %shr182, !dbg !2366
    #dbg_value(i64 %xor183, !2250, !DIExpression(), !2167)
  %not184 = xor i64 %xor171, -1, !dbg !2367
  %and185 = and i64 %not184, %xor175, !dbg !2368
  %xor186 = xor i64 %xor167, %and185, !dbg !2369
    #dbg_value(i64 %xor186, !2370, !DIExpression(), !2167)
  %not187 = xor i64 %xor175, -1, !dbg !2371
  %and188 = and i64 %not187, %xor179, !dbg !2372
  %xor189 = xor i64 %xor171, %and188, !dbg !2373
    #dbg_value(i64 %xor189, !2374, !DIExpression(), !2167)
  %not190 = xor i64 %xor179, -1, !dbg !2375
  %and191 = and i64 %not190, %xor183, !dbg !2376
  %xor192 = xor i64 %xor175, %and191, !dbg !2377
    #dbg_value(i64 %xor192, !2378, !DIExpression(), !2167)
  %not193 = xor i64 %xor183, -1, !dbg !2379
  %and194 = and i64 %not193, %xor167, !dbg !2380
  %xor195 = xor i64 %xor179, %and194, !dbg !2381
    #dbg_value(i64 %xor195, !2382, !DIExpression(), !2167)
  %not196 = xor i64 %xor167, -1, !dbg !2383
  %and197 = and i64 %not196, %xor171, !dbg !2384
  %xor198 = xor i64 %xor183, %and197, !dbg !2385
    #dbg_value(i64 %xor198, !2386, !DIExpression(), !2167)
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2387
    #dbg_value(i64 %xor199, !2173, !DIExpression(), !2167)
  %shl200 = shl i64 %xor199, 62, !dbg !2388
  %shr201 = lshr i64 %xor199, 2, !dbg !2388
  %xor202 = xor i64 %shl200, %shr201, !dbg !2388
    #dbg_value(i64 %xor202, !2230, !DIExpression(), !2167)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2389
    #dbg_value(i64 %xor203, !2185, !DIExpression(), !2167)
  %shl204 = shl i64 %xor203, 55, !dbg !2390
  %shr205 = lshr i64 %xor203, 9, !dbg !2390
  %xor206 = xor i64 %shl204, %shr205, !dbg !2390
    #dbg_value(i64 %xor206, !2235, !DIExpression(), !2167)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2391
    #dbg_value(i64 %xor207, !2197, !DIExpression(), !2167)
  %shl208 = shl i64 %xor207, 39, !dbg !2392
  %shr209 = lshr i64 %xor207, 25, !dbg !2392
  %xor210 = xor i64 %shl208, %shr209, !dbg !2392
    #dbg_value(i64 %xor210, !2240, !DIExpression(), !2167)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2393
    #dbg_value(i64 %xor211, !2199, !DIExpression(), !2167)
  %shl212 = shl i64 %xor211, 41, !dbg !2394
  %shr213 = lshr i64 %xor211, 23, !dbg !2394
  %xor214 = xor i64 %shl212, %shr213, !dbg !2394
    #dbg_value(i64 %xor214, !2245, !DIExpression(), !2167)
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2395
    #dbg_value(i64 %xor215, !2211, !DIExpression(), !2167)
  %shl216 = shl i64 %xor215, 2, !dbg !2396
  %shr217 = lshr i64 %xor215, 62, !dbg !2396
  %xor218 = xor i64 %shl216, %shr217, !dbg !2396
    #dbg_value(i64 %xor218, !2250, !DIExpression(), !2167)
  %not219 = xor i64 %xor206, -1, !dbg !2397
  %and220 = and i64 %not219, %xor210, !dbg !2398
  %xor221 = xor i64 %xor202, %and220, !dbg !2399
    #dbg_value(i64 %xor221, !2400, !DIExpression(), !2167)
  %not222 = xor i64 %xor210, -1, !dbg !2401
  %and223 = and i64 %not222, %xor214, !dbg !2402
  %xor224 = xor i64 %xor206, %and223, !dbg !2403
    #dbg_value(i64 %xor224, !2404, !DIExpression(), !2167)
  %not225 = xor i64 %xor214, -1, !dbg !2405
  %and226 = and i64 %not225, %xor218, !dbg !2406
  %xor227 = xor i64 %xor210, %and226, !dbg !2407
    #dbg_value(i64 %xor227, !2408, !DIExpression(), !2167)
  %not228 = xor i64 %xor218, -1, !dbg !2409
  %and229 = and i64 %not228, %xor202, !dbg !2410
  %xor230 = xor i64 %xor214, %and229, !dbg !2411
    #dbg_value(i64 %xor230, !2412, !DIExpression(), !2167)
  %not231 = xor i64 %xor202, -1, !dbg !2413
  %and232 = and i64 %not231, %xor206, !dbg !2414
  %xor233 = xor i64 %xor218, %and232, !dbg !2415
    #dbg_value(i64 %xor233, !2416, !DIExpression(), !2167)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2417
  %xor235 = xor i64 %xor234, %xor151, !dbg !2418
  %xor236 = xor i64 %xor235, %xor186, !dbg !2419
  %xor237 = xor i64 %xor236, %xor221, !dbg !2420
    #dbg_value(i64 %xor237, !2230, !DIExpression(), !2167)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2421
  %xor239 = xor i64 %xor238, %xor154, !dbg !2422
  %xor240 = xor i64 %xor239, %xor189, !dbg !2423
  %xor241 = xor i64 %xor240, %xor224, !dbg !2424
    #dbg_value(i64 %xor241, !2235, !DIExpression(), !2167)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2425
  %xor243 = xor i64 %xor242, %xor157, !dbg !2426
  %xor244 = xor i64 %xor243, %xor192, !dbg !2427
  %xor245 = xor i64 %xor244, %xor227, !dbg !2428
    #dbg_value(i64 %xor245, !2240, !DIExpression(), !2167)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2429
  %xor247 = xor i64 %xor246, %xor160, !dbg !2430
  %xor248 = xor i64 %xor247, %xor195, !dbg !2431
  %xor249 = xor i64 %xor248, %xor230, !dbg !2432
    #dbg_value(i64 %xor249, !2245, !DIExpression(), !2167)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2433
  %xor251 = xor i64 %xor250, %xor163, !dbg !2434
  %xor252 = xor i64 %xor251, %xor198, !dbg !2435
  %xor253 = xor i64 %xor252, %xor233, !dbg !2436
    #dbg_value(i64 %xor253, !2250, !DIExpression(), !2167)
  %shl254 = shl i64 %xor241, 1, !dbg !2437
  %shr255 = lshr i64 %xor241, 63, !dbg !2437
  %xor256 = xor i64 %shl254, %shr255, !dbg !2437
  %xor257 = xor i64 %xor253, %xor256, !dbg !2438
    #dbg_value(i64 %xor257, !2253, !DIExpression(), !2167)
  %shl258 = shl i64 %xor245, 1, !dbg !2439
  %shr259 = lshr i64 %xor245, 63, !dbg !2439
  %xor260 = xor i64 %shl258, %shr259, !dbg !2439
  %xor261 = xor i64 %xor237, %xor260, !dbg !2440
    #dbg_value(i64 %xor261, !2256, !DIExpression(), !2167)
  %shl262 = shl i64 %xor249, 1, !dbg !2441
  %shr263 = lshr i64 %xor249, 63, !dbg !2441
  %xor264 = xor i64 %shl262, %shr263, !dbg !2441
  %xor265 = xor i64 %xor241, %xor264, !dbg !2442
    #dbg_value(i64 %xor265, !2259, !DIExpression(), !2167)
  %shl266 = shl i64 %xor253, 1, !dbg !2443
  %shr267 = lshr i64 %xor253, 63, !dbg !2443
  %xor268 = xor i64 %shl266, %shr267, !dbg !2443
  %xor269 = xor i64 %xor245, %xor268, !dbg !2444
    #dbg_value(i64 %xor269, !2262, !DIExpression(), !2167)
  %shl270 = shl i64 %xor237, 1, !dbg !2445
  %shr271 = lshr i64 %xor237, 63, !dbg !2445
  %xor272 = xor i64 %shl270, %shr271, !dbg !2445
  %xor273 = xor i64 %xor249, %xor272, !dbg !2446
    #dbg_value(i64 %xor273, !2265, !DIExpression(), !2167)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2447
    #dbg_value(i64 %xor274, !2278, !DIExpression(), !2167)
    #dbg_value(i64 %xor274, !2230, !DIExpression(), !2167)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2448
    #dbg_value(i64 %xor275, !2314, !DIExpression(), !2167)
  %shl276 = shl i64 %xor275, 44, !dbg !2449
  %shr277 = lshr i64 %xor275, 20, !dbg !2449
  %xor278 = xor i64 %shl276, %shr277, !dbg !2449
    #dbg_value(i64 %xor278, !2235, !DIExpression(), !2167)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2450
    #dbg_value(i64 %xor279, !2348, !DIExpression(), !2167)
  %shl280 = shl i64 %xor279, 43, !dbg !2451
  %shr281 = lshr i64 %xor279, 21, !dbg !2451
  %xor282 = xor i64 %shl280, %shr281, !dbg !2451
    #dbg_value(i64 %xor282, !2240, !DIExpression(), !2167)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2452
    #dbg_value(i64 %xor283, !2382, !DIExpression(), !2167)
  %shl284 = shl i64 %xor283, 21, !dbg !2453
  %shr285 = lshr i64 %xor283, 43, !dbg !2453
  %xor286 = xor i64 %shl284, %shr285, !dbg !2453
    #dbg_value(i64 %xor286, !2245, !DIExpression(), !2167)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2454
    #dbg_value(i64 %xor287, !2416, !DIExpression(), !2167)
  %shl288 = shl i64 %xor287, 14, !dbg !2455
  %shr289 = lshr i64 %xor287, 50, !dbg !2455
  %xor290 = xor i64 %shl288, %shr289, !dbg !2455
    #dbg_value(i64 %xor290, !2250, !DIExpression(), !2167)
  %not291 = xor i64 %xor278, -1, !dbg !2456
  %and292 = and i64 %not291, %xor282, !dbg !2457
  %xor293 = xor i64 %xor274, %and292, !dbg !2458
    #dbg_value(i64 %xor293, !2169, !DIExpression(), !2167)
  %add = add nsw i32 %round.0, 1, !dbg !2459
  %arrayidx294 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2460
  %26 = load i64, ptr %arrayidx294, align 8, !dbg !2460
  %xor295 = xor i64 %xor293, %26, !dbg !2461
    #dbg_value(i64 %xor295, !2169, !DIExpression(), !2167)
  %not296 = xor i64 %xor282, -1, !dbg !2462
  %and297 = and i64 %not296, %xor286, !dbg !2463
  %xor298 = xor i64 %xor278, %and297, !dbg !2464
    #dbg_value(i64 %xor298, !2171, !DIExpression(), !2167)
  %not299 = xor i64 %xor286, -1, !dbg !2465
  %and300 = and i64 %not299, %xor290, !dbg !2466
  %xor301 = xor i64 %xor282, %and300, !dbg !2467
    #dbg_value(i64 %xor301, !2173, !DIExpression(), !2167)
  %not302 = xor i64 %xor290, -1, !dbg !2468
  %and303 = and i64 %not302, %xor274, !dbg !2469
  %xor304 = xor i64 %xor286, %and303, !dbg !2470
    #dbg_value(i64 %xor304, !2175, !DIExpression(), !2167)
  %not305 = xor i64 %xor274, -1, !dbg !2471
  %and306 = and i64 %not305, %xor278, !dbg !2472
  %xor307 = xor i64 %xor290, %and306, !dbg !2473
    #dbg_value(i64 %xor307, !2177, !DIExpression(), !2167)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2474
    #dbg_value(i64 %xor308, !2292, !DIExpression(), !2167)
  %shl309 = shl i64 %xor308, 28, !dbg !2475
  %shr310 = lshr i64 %xor308, 36, !dbg !2475
  %xor311 = xor i64 %shl309, %shr310, !dbg !2475
    #dbg_value(i64 %xor311, !2230, !DIExpression(), !2167)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2476
    #dbg_value(i64 %xor312, !2326, !DIExpression(), !2167)
  %shl313 = shl i64 %xor312, 20, !dbg !2477
  %shr314 = lshr i64 %xor312, 44, !dbg !2477
  %xor315 = xor i64 %shl313, %shr314, !dbg !2477
    #dbg_value(i64 %xor315, !2235, !DIExpression(), !2167)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2478
    #dbg_value(i64 %xor316, !2340, !DIExpression(), !2167)
  %shl317 = shl i64 %xor316, 3, !dbg !2479
  %shr318 = lshr i64 %xor316, 61, !dbg !2479
  %xor319 = xor i64 %shl317, %shr318, !dbg !2479
    #dbg_value(i64 %xor319, !2240, !DIExpression(), !2167)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2480
    #dbg_value(i64 %xor320, !2374, !DIExpression(), !2167)
  %shl321 = shl i64 %xor320, 45, !dbg !2481
  %shr322 = lshr i64 %xor320, 19, !dbg !2481
  %xor323 = xor i64 %shl321, %shr322, !dbg !2481
    #dbg_value(i64 %xor323, !2245, !DIExpression(), !2167)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2482
    #dbg_value(i64 %xor324, !2408, !DIExpression(), !2167)
  %shl325 = shl i64 %xor324, 61, !dbg !2483
  %shr326 = lshr i64 %xor324, 3, !dbg !2483
  %xor327 = xor i64 %shl325, %shr326, !dbg !2483
    #dbg_value(i64 %xor327, !2250, !DIExpression(), !2167)
  %not328 = xor i64 %xor315, -1, !dbg !2484
  %and329 = and i64 %not328, %xor319, !dbg !2485
  %xor330 = xor i64 %xor311, %and329, !dbg !2486
    #dbg_value(i64 %xor330, !2179, !DIExpression(), !2167)
  %not331 = xor i64 %xor319, -1, !dbg !2487
  %and332 = and i64 %not331, %xor323, !dbg !2488
  %xor333 = xor i64 %xor315, %and332, !dbg !2489
    #dbg_value(i64 %xor333, !2181, !DIExpression(), !2167)
  %not334 = xor i64 %xor323, -1, !dbg !2490
  %and335 = and i64 %not334, %xor327, !dbg !2491
  %xor336 = xor i64 %xor319, %and335, !dbg !2492
    #dbg_value(i64 %xor336, !2183, !DIExpression(), !2167)
  %not337 = xor i64 %xor327, -1, !dbg !2493
  %and338 = and i64 %not337, %xor311, !dbg !2494
  %xor339 = xor i64 %xor323, %and338, !dbg !2495
    #dbg_value(i64 %xor339, !2185, !DIExpression(), !2167)
  %not340 = xor i64 %xor311, -1, !dbg !2496
  %and341 = and i64 %not340, %xor315, !dbg !2497
  %xor342 = xor i64 %xor327, %and341, !dbg !2498
    #dbg_value(i64 %xor342, !2187, !DIExpression(), !2167)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2499
    #dbg_value(i64 %xor343, !2284, !DIExpression(), !2167)
  %shl344 = shl i64 %xor343, 1, !dbg !2500
  %shr345 = lshr i64 %xor343, 63, !dbg !2500
  %xor346 = xor i64 %shl344, %shr345, !dbg !2500
    #dbg_value(i64 %xor346, !2230, !DIExpression(), !2167)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2501
    #dbg_value(i64 %xor347, !2318, !DIExpression(), !2167)
  %shl348 = shl i64 %xor347, 6, !dbg !2502
  %shr349 = lshr i64 %xor347, 58, !dbg !2502
  %xor350 = xor i64 %shl348, %shr349, !dbg !2502
    #dbg_value(i64 %xor350, !2235, !DIExpression(), !2167)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2503
    #dbg_value(i64 %xor351, !2352, !DIExpression(), !2167)
  %shl352 = shl i64 %xor351, 25, !dbg !2504
  %shr353 = lshr i64 %xor351, 39, !dbg !2504
  %xor354 = xor i64 %shl352, %shr353, !dbg !2504
    #dbg_value(i64 %xor354, !2240, !DIExpression(), !2167)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2505
    #dbg_value(i64 %xor355, !2386, !DIExpression(), !2167)
  %shl356 = shl i64 %xor355, 8, !dbg !2506
  %shr357 = lshr i64 %xor355, 56, !dbg !2506
  %xor358 = xor i64 %shl356, %shr357, !dbg !2506
    #dbg_value(i64 %xor358, !2245, !DIExpression(), !2167)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2507
    #dbg_value(i64 %xor359, !2400, !DIExpression(), !2167)
  %shl360 = shl i64 %xor359, 18, !dbg !2508
  %shr361 = lshr i64 %xor359, 46, !dbg !2508
  %xor362 = xor i64 %shl360, %shr361, !dbg !2508
    #dbg_value(i64 %xor362, !2250, !DIExpression(), !2167)
  %not363 = xor i64 %xor350, -1, !dbg !2509
  %and364 = and i64 %not363, %xor354, !dbg !2510
  %xor365 = xor i64 %xor346, %and364, !dbg !2511
    #dbg_value(i64 %xor365, !2189, !DIExpression(), !2167)
  %not366 = xor i64 %xor354, -1, !dbg !2512
  %and367 = and i64 %not366, %xor358, !dbg !2513
  %xor368 = xor i64 %xor350, %and367, !dbg !2514
    #dbg_value(i64 %xor368, !2191, !DIExpression(), !2167)
  %not369 = xor i64 %xor358, -1, !dbg !2515
  %and370 = and i64 %not369, %xor362, !dbg !2516
  %xor371 = xor i64 %xor354, %and370, !dbg !2517
    #dbg_value(i64 %xor371, !2193, !DIExpression(), !2167)
  %not372 = xor i64 %xor362, -1, !dbg !2518
  %and373 = and i64 %not372, %xor346, !dbg !2519
  %xor374 = xor i64 %xor358, %and373, !dbg !2520
    #dbg_value(i64 %xor374, !2195, !DIExpression(), !2167)
  %not375 = xor i64 %xor346, -1, !dbg !2521
  %and376 = and i64 %not375, %xor350, !dbg !2522
  %xor377 = xor i64 %xor362, %and376, !dbg !2523
    #dbg_value(i64 %xor377, !2197, !DIExpression(), !2167)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2524
    #dbg_value(i64 %xor378, !2296, !DIExpression(), !2167)
  %shl379 = shl i64 %xor378, 27, !dbg !2525
  %shr380 = lshr i64 %xor378, 37, !dbg !2525
  %xor381 = xor i64 %shl379, %shr380, !dbg !2525
    #dbg_value(i64 %xor381, !2230, !DIExpression(), !2167)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2526
    #dbg_value(i64 %xor382, !2310, !DIExpression(), !2167)
  %shl383 = shl i64 %xor382, 36, !dbg !2527
  %shr384 = lshr i64 %xor382, 28, !dbg !2527
  %xor385 = xor i64 %shl383, %shr384, !dbg !2527
    #dbg_value(i64 %xor385, !2235, !DIExpression(), !2167)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2528
    #dbg_value(i64 %xor386, !2344, !DIExpression(), !2167)
  %shl387 = shl i64 %xor386, 10, !dbg !2529
  %shr388 = lshr i64 %xor386, 54, !dbg !2529
  %xor389 = xor i64 %shl387, %shr388, !dbg !2529
    #dbg_value(i64 %xor389, !2240, !DIExpression(), !2167)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2530
    #dbg_value(i64 %xor390, !2378, !DIExpression(), !2167)
  %shl391 = shl i64 %xor390, 15, !dbg !2531
  %shr392 = lshr i64 %xor390, 49, !dbg !2531
  %xor393 = xor i64 %shl391, %shr392, !dbg !2531
    #dbg_value(i64 %xor393, !2245, !DIExpression(), !2167)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2532
    #dbg_value(i64 %xor394, !2412, !DIExpression(), !2167)
  %shl395 = shl i64 %xor394, 56, !dbg !2533
  %shr396 = lshr i64 %xor394, 8, !dbg !2533
  %xor397 = xor i64 %shl395, %shr396, !dbg !2533
    #dbg_value(i64 %xor397, !2250, !DIExpression(), !2167)
  %not398 = xor i64 %xor385, -1, !dbg !2534
  %and399 = and i64 %not398, %xor389, !dbg !2535
  %xor400 = xor i64 %xor381, %and399, !dbg !2536
    #dbg_value(i64 %xor400, !2199, !DIExpression(), !2167)
  %not401 = xor i64 %xor389, -1, !dbg !2537
  %and402 = and i64 %not401, %xor393, !dbg !2538
  %xor403 = xor i64 %xor385, %and402, !dbg !2539
    #dbg_value(i64 %xor403, !2201, !DIExpression(), !2167)
  %not404 = xor i64 %xor393, -1, !dbg !2540
  %and405 = and i64 %not404, %xor397, !dbg !2541
  %xor406 = xor i64 %xor389, %and405, !dbg !2542
    #dbg_value(i64 %xor406, !2203, !DIExpression(), !2167)
  %not407 = xor i64 %xor397, -1, !dbg !2543
  %and408 = and i64 %not407, %xor381, !dbg !2544
  %xor409 = xor i64 %xor393, %and408, !dbg !2545
    #dbg_value(i64 %xor409, !2205, !DIExpression(), !2167)
  %not410 = xor i64 %xor381, -1, !dbg !2546
  %and411 = and i64 %not410, %xor385, !dbg !2547
  %xor412 = xor i64 %xor397, %and411, !dbg !2548
    #dbg_value(i64 %xor412, !2207, !DIExpression(), !2167)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2549
    #dbg_value(i64 %xor413, !2288, !DIExpression(), !2167)
  %shl414 = shl i64 %xor413, 62, !dbg !2550
  %shr415 = lshr i64 %xor413, 2, !dbg !2550
  %xor416 = xor i64 %shl414, %shr415, !dbg !2550
    #dbg_value(i64 %xor416, !2230, !DIExpression(), !2167)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2551
    #dbg_value(i64 %xor417, !2322, !DIExpression(), !2167)
  %shl418 = shl i64 %xor417, 55, !dbg !2552
  %shr419 = lshr i64 %xor417, 9, !dbg !2552
  %xor420 = xor i64 %shl418, %shr419, !dbg !2552
    #dbg_value(i64 %xor420, !2235, !DIExpression(), !2167)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2553
    #dbg_value(i64 %xor421, !2356, !DIExpression(), !2167)
  %shl422 = shl i64 %xor421, 39, !dbg !2554
  %shr423 = lshr i64 %xor421, 25, !dbg !2554
  %xor424 = xor i64 %shl422, %shr423, !dbg !2554
    #dbg_value(i64 %xor424, !2240, !DIExpression(), !2167)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2555
    #dbg_value(i64 %xor425, !2370, !DIExpression(), !2167)
  %shl426 = shl i64 %xor425, 41, !dbg !2556
  %shr427 = lshr i64 %xor425, 23, !dbg !2556
  %xor428 = xor i64 %shl426, %shr427, !dbg !2556
    #dbg_value(i64 %xor428, !2245, !DIExpression(), !2167)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2557
    #dbg_value(i64 %xor429, !2404, !DIExpression(), !2167)
  %shl430 = shl i64 %xor429, 2, !dbg !2558
  %shr431 = lshr i64 %xor429, 62, !dbg !2558
  %xor432 = xor i64 %shl430, %shr431, !dbg !2558
    #dbg_value(i64 %xor432, !2250, !DIExpression(), !2167)
  %not433 = xor i64 %xor420, -1, !dbg !2559
  %and434 = and i64 %not433, %xor424, !dbg !2560
  %xor435 = xor i64 %xor416, %and434, !dbg !2561
    #dbg_value(i64 %xor435, !2209, !DIExpression(), !2167)
  %not436 = xor i64 %xor424, -1, !dbg !2562
  %and437 = and i64 %not436, %xor428, !dbg !2563
  %xor438 = xor i64 %xor420, %and437, !dbg !2564
    #dbg_value(i64 %xor438, !2211, !DIExpression(), !2167)
  %not439 = xor i64 %xor428, -1, !dbg !2565
  %and440 = and i64 %not439, %xor432, !dbg !2566
  %xor441 = xor i64 %xor424, %and440, !dbg !2567
    #dbg_value(i64 %xor441, !2213, !DIExpression(), !2167)
  %not442 = xor i64 %xor432, -1, !dbg !2568
  %and443 = and i64 %not442, %xor416, !dbg !2569
  %xor444 = xor i64 %xor428, %and443, !dbg !2570
    #dbg_value(i64 %xor444, !2215, !DIExpression(), !2167)
  %not445 = xor i64 %xor416, -1, !dbg !2571
  %and446 = and i64 %not445, %xor420, !dbg !2572
  %xor447 = xor i64 %xor432, %and446, !dbg !2573
    #dbg_value(i64 %xor447, !2217, !DIExpression(), !2167)
  br label %for.inc, !dbg !2574

for.inc:                                          ; preds = %for.body
  %add448 = add nsw i32 %round.0, 2, !dbg !2575
    #dbg_value(i32 %add448, !2218, !DIExpression(), !2167)
  br label %for.cond, !dbg !2576, !llvm.loop !2577

for.end:                                          ; preds = %for.cond
  %arrayidx449 = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2579
  store i64 %Aba.0, ptr %arrayidx449, align 8, !dbg !2580
  %arrayidx450 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2581
  store i64 %Abe.0, ptr %arrayidx450, align 8, !dbg !2582
  %arrayidx451 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2583
  store i64 %Abi.0, ptr %arrayidx451, align 8, !dbg !2584
  %arrayidx452 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2585
  store i64 %Abo.0, ptr %arrayidx452, align 8, !dbg !2586
  %arrayidx453 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2587
  store i64 %Abu.0, ptr %arrayidx453, align 8, !dbg !2588
  %arrayidx454 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2589
  store i64 %Aga.0, ptr %arrayidx454, align 8, !dbg !2590
  %arrayidx455 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2591
  store i64 %Age.0, ptr %arrayidx455, align 8, !dbg !2592
  %arrayidx456 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2593
  store i64 %Agi.0, ptr %arrayidx456, align 8, !dbg !2594
  %arrayidx457 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2595
  store i64 %Ago.0, ptr %arrayidx457, align 8, !dbg !2596
  %arrayidx458 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2597
  store i64 %Agu.0, ptr %arrayidx458, align 8, !dbg !2598
  %arrayidx459 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2599
  store i64 %Aka.0, ptr %arrayidx459, align 8, !dbg !2600
  %arrayidx460 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2601
  store i64 %Ake.0, ptr %arrayidx460, align 8, !dbg !2602
  %arrayidx461 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2603
  store i64 %Aki.0, ptr %arrayidx461, align 8, !dbg !2604
  %arrayidx462 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2605
  store i64 %Ako.0, ptr %arrayidx462, align 8, !dbg !2606
  %arrayidx463 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2607
  store i64 %Aku.0, ptr %arrayidx463, align 8, !dbg !2608
  %arrayidx464 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2609
  store i64 %Ama.0, ptr %arrayidx464, align 8, !dbg !2610
  %arrayidx465 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2611
  store i64 %Ame.0, ptr %arrayidx465, align 8, !dbg !2612
  %arrayidx466 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2613
  store i64 %Ami.0, ptr %arrayidx466, align 8, !dbg !2614
  %arrayidx467 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2615
  store i64 %Amo.0, ptr %arrayidx467, align 8, !dbg !2616
  %arrayidx468 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2617
  store i64 %Amu.0, ptr %arrayidx468, align 8, !dbg !2618
  %arrayidx469 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2619
  store i64 %Asa.0, ptr %arrayidx469, align 8, !dbg !2620
  %arrayidx470 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2621
  store i64 %Ase.0, ptr %arrayidx470, align 8, !dbg !2622
  %arrayidx471 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2623
  store i64 %Asi.0, ptr %arrayidx471, align 8, !dbg !2624
  %arrayidx472 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2625
  store i64 %Aso.0, ptr %arrayidx472, align 8, !dbg !2626
  %arrayidx473 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2627
  store i64 %Asu.0, ptr %arrayidx473, align 8, !dbg !2628
  ret void, !dbg !2629
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) #0 !dbg !2630 {
entry:
    #dbg_value(ptr %state, !2631, !DIExpression(), !2632)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2633
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2634
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2635
  %0 = load i32, ptr %pos, align 8, !dbg !2635
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #2, !dbg !2636
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2637
  store i32 168, ptr %pos1, align 8, !dbg !2638
  ret void, !dbg !2639
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) #0 !dbg !2640 {
entry:
    #dbg_value(ptr %s, !2643, !DIExpression(), !2644)
    #dbg_value(i32 %pos, !2645, !DIExpression(), !2644)
    #dbg_value(i32 %r, !2646, !DIExpression(), !2644)
    #dbg_value(i8 %p, !2647, !DIExpression(), !2644)
  %conv = zext i8 %p to i64, !dbg !2648
  %rem = urem i32 %pos, 8, !dbg !2649
  %mul = mul i32 8, %rem, !dbg !2650
  %sh_prom = zext i32 %mul to i64, !dbg !2651
  %shl = shl i64 %conv, %sh_prom, !dbg !2651
  %div = udiv i32 %pos, 8, !dbg !2652
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2653
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2654
  %xor = xor i64 %0, %shl, !dbg !2654
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2654
  %div1 = udiv i32 %r, 8, !dbg !2655
  %sub = sub i32 %div1, 1, !dbg !2656
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s, i32 %sub, !dbg !2657
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !2658
  %xor3 = xor i64 %1, -9223372036854775808, !dbg !2658
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2658
  ret void, !dbg !2659
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2660 {
entry:
    #dbg_value(ptr %out, !2663, !DIExpression(), !2664)
    #dbg_value(i32 %outlen, !2665, !DIExpression(), !2664)
    #dbg_value(ptr %state, !2666, !DIExpression(), !2664)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2667
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2668
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2669
  %0 = load i32, ptr %pos, align 8, !dbg !2669
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168) #2, !dbg !2670
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2671
  store i32 %call, ptr %pos1, align 8, !dbg !2672
  ret void, !dbg !2673
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) #0 !dbg !2674 {
entry:
    #dbg_value(ptr %out, !2677, !DIExpression(), !2678)
    #dbg_value(i32 %outlen, !2679, !DIExpression(), !2678)
    #dbg_value(ptr %s, !2680, !DIExpression(), !2678)
    #dbg_value(i32 %pos, !2681, !DIExpression(), !2678)
    #dbg_value(i32 %r, !2682, !DIExpression(), !2678)
  br label %while.cond, !dbg !2683

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2677, !DIExpression(), !2678)
    #dbg_value(i32 %outlen.addr.0, !2679, !DIExpression(), !2678)
    #dbg_value(i32 %pos.addr.0, !2681, !DIExpression(), !2678)
  %tobool = icmp ne i32 %outlen.addr.0, 0, !dbg !2683
  br i1 %tobool, label %while.body, label %while.end, !dbg !2683

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2684
  br i1 %cmp, label %if.then, label %if.end, !dbg !2684

if.then:                                          ; preds = %while.body
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2687
    #dbg_value(i32 0, !2681, !DIExpression(), !2678)
  br label %if.end, !dbg !2689

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2681, !DIExpression(), !2678)
    #dbg_value(i32 %pos.addr.1, !2690, !DIExpression(), !2678)
  br label %for.cond, !dbg !2691

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.inc ], !dbg !2693
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.inc ]
    #dbg_value(ptr %out.addr.1, !2677, !DIExpression(), !2678)
    #dbg_value(i32 %i.0, !2690, !DIExpression(), !2678)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2694
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !2696

land.rhs:                                         ; preds = %for.cond
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2697
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2698
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !2699
  br i1 %0, label %for.body, label %for.end, !dbg !2700

for.body:                                         ; preds = %land.end
  %div = udiv i32 %i.0, 8, !dbg !2701
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2702
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2702
  %rem = urem i32 %i.0, 8, !dbg !2703
  %mul = mul i32 8, %rem, !dbg !2704
  %sh_prom = zext i32 %mul to i64, !dbg !2705
  %shr = lshr i64 %1, %sh_prom, !dbg !2705
  %conv = trunc i64 %shr to i8, !dbg !2702
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2706
    #dbg_value(ptr %incdec.ptr, !2677, !DIExpression(), !2678)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2707
  br label %for.inc, !dbg !2708

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2709
    #dbg_value(i32 %inc, !2690, !DIExpression(), !2678)
  br label %for.cond, !dbg !2710, !llvm.loop !2711

for.end:                                          ; preds = %land.end
  %sub = sub i32 %i.0, %pos.addr.1, !dbg !2713
  %sub3 = sub i32 %outlen.addr.0, %sub, !dbg !2714
    #dbg_value(i32 %sub3, !2679, !DIExpression(), !2678)
    #dbg_value(i32 %i.0, !2681, !DIExpression(), !2678)
  br label %while.cond, !dbg !2683, !llvm.loop !2715

while.end:                                        ; preds = %while.cond
  ret i32 %pos.addr.0, !dbg !2717
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2718 {
entry:
    #dbg_value(ptr %state, !2719, !DIExpression(), !2720)
    #dbg_value(ptr %in, !2721, !DIExpression(), !2720)
    #dbg_value(i32 %inlen, !2722, !DIExpression(), !2720)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2723
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2724
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2725
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2726
  store i32 168, ptr %pos, align 8, !dbg !2727
  ret void, !dbg !2728
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) #0 !dbg !2729 {
entry:
    #dbg_value(ptr %s, !2732, !DIExpression(), !2733)
    #dbg_value(i32 %r, !2734, !DIExpression(), !2733)
    #dbg_value(ptr %in, !2735, !DIExpression(), !2733)
    #dbg_value(i32 %inlen, !2736, !DIExpression(), !2733)
    #dbg_value(i8 %p, !2737, !DIExpression(), !2733)
    #dbg_value(i32 0, !2738, !DIExpression(), !2733)
  br label %for.cond, !dbg !2739

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2741
    #dbg_value(i32 %i.0, !2738, !DIExpression(), !2733)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2742
  br i1 %cmp, label %for.body, label %for.end, !dbg !2744

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2745
  store i64 0, ptr %arrayidx, align 8, !dbg !2746
  br label %for.inc, !dbg !2745

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2747
    #dbg_value(i32 %inc, !2738, !DIExpression(), !2733)
  br label %for.cond, !dbg !2748, !llvm.loop !2749

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !2751

while.cond:                                       ; preds = %for.end8, %for.end
  %in.addr.0 = phi ptr [ %in, %for.end ], [ %add.ptr9, %for.end8 ]
  %inlen.addr.0 = phi i32 [ %inlen, %for.end ], [ %sub, %for.end8 ]
    #dbg_value(i32 %inlen.addr.0, !2736, !DIExpression(), !2733)
    #dbg_value(ptr %in.addr.0, !2735, !DIExpression(), !2733)
  %cmp1 = icmp uge i32 %inlen.addr.0, %r, !dbg !2752
  br i1 %cmp1, label %while.body, label %while.end, !dbg !2751

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 0, !2738, !DIExpression(), !2733)
  br label %for.cond2, !dbg !2753

for.cond2:                                        ; preds = %for.inc6, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc7, %for.inc6 ], !dbg !2756
    #dbg_value(i32 %i.1, !2738, !DIExpression(), !2733)
  %div = udiv i32 %r, 8, !dbg !2757
  %cmp3 = icmp ult i32 %i.1, %div, !dbg !2759
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !2760

for.body4:                                        ; preds = %for.cond2
  %mul = mul i32 8, %i.1, !dbg !2761
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2762
  %call = call i64 @load64(ptr noundef %add.ptr) #2, !dbg !2763
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2764
  %0 = load i64, ptr %arrayidx5, align 8, !dbg !2765
  %xor = xor i64 %0, %call, !dbg !2765
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2765
  br label %for.inc6, !dbg !2764

for.inc6:                                         ; preds = %for.body4
  %inc7 = add i32 %i.1, 1, !dbg !2766
    #dbg_value(i32 %inc7, !2738, !DIExpression(), !2733)
  br label %for.cond2, !dbg !2767, !llvm.loop !2768

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2770
    #dbg_value(ptr %add.ptr9, !2735, !DIExpression(), !2733)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2771
    #dbg_value(i32 %sub, !2736, !DIExpression(), !2733)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2772
  br label %while.cond, !dbg !2751, !llvm.loop !2773

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 0, !2738, !DIExpression(), !2733)
  br label %for.cond10, !dbg !2775

for.cond10:                                       ; preds = %for.inc18, %while.end
  %i.2 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc18 ], !dbg !2777
    #dbg_value(i32 %i.2, !2738, !DIExpression(), !2733)
  %cmp11 = icmp ult i32 %i.2, %inlen.addr.0, !dbg !2778
  br i1 %cmp11, label %for.body12, label %for.end20, !dbg !2780

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %i.2, !dbg !2781
  %1 = load i8, ptr %arrayidx13, align 1, !dbg !2781
  %conv = zext i8 %1 to i64, !dbg !2782
  %rem = urem i32 %i.2, 8, !dbg !2783
  %mul14 = mul i32 8, %rem, !dbg !2784
  %sh_prom = zext i32 %mul14 to i64, !dbg !2785
  %shl = shl i64 %conv, %sh_prom, !dbg !2785
  %div15 = udiv i32 %i.2, 8, !dbg !2786
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div15, !dbg !2787
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !2788
  %xor17 = xor i64 %2, %shl, !dbg !2788
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2788
  br label %for.inc18, !dbg !2787

for.inc18:                                        ; preds = %for.body12
  %inc19 = add i32 %i.2, 1, !dbg !2789
    #dbg_value(i32 %inc19, !2738, !DIExpression(), !2733)
  br label %for.cond10, !dbg !2790, !llvm.loop !2791

for.end20:                                        ; preds = %for.cond10
  %conv21 = zext i8 %p to i64, !dbg !2793
  %rem22 = urem i32 %i.2, 8, !dbg !2794
  %mul23 = mul i32 8, %rem22, !dbg !2795
  %sh_prom24 = zext i32 %mul23 to i64, !dbg !2796
  %shl25 = shl i64 %conv21, %sh_prom24, !dbg !2796
  %div26 = udiv i32 %i.2, 8, !dbg !2797
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div26, !dbg !2798
  %3 = load i64, ptr %arrayidx27, align 8, !dbg !2799
  %xor28 = xor i64 %3, %shl25, !dbg !2799
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2799
  %sub29 = sub i32 %r, 1, !dbg !2800
  %div30 = udiv i32 %sub29, 8, !dbg !2801
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div30, !dbg !2802
  %4 = load i64, ptr %arrayidx31, align 8, !dbg !2803
  %xor32 = xor i64 %4, -9223372036854775808, !dbg !2803
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2803
  ret void, !dbg !2804
}

; Function Attrs: noinline nounwind optnone
define internal i64 @load64(ptr noundef %x) #0 !dbg !2805 {
entry:
    #dbg_value(ptr %x, !2808, !DIExpression(), !2809)
    #dbg_value(i64 0, !2810, !DIExpression(), !2809)
    #dbg_value(i32 0, !2811, !DIExpression(), !2809)
  br label %for.cond, !dbg !2812

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2814
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2809
    #dbg_value(i64 %r.0, !2810, !DIExpression(), !2809)
    #dbg_value(i32 %i.0, !2811, !DIExpression(), !2809)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2815
  br i1 %cmp, label %for.body, label %for.end, !dbg !2817

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2818
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2818
  %conv = zext i8 %0 to i64, !dbg !2819
  %mul = mul i32 8, %i.0, !dbg !2820
  %sh_prom = zext i32 %mul to i64, !dbg !2821
  %shl = shl i64 %conv, %sh_prom, !dbg !2821
  %or = or i64 %r.0, %shl, !dbg !2822
    #dbg_value(i64 %or, !2810, !DIExpression(), !2809)
  br label %for.inc, !dbg !2823

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2824
    #dbg_value(i32 %inc, !2811, !DIExpression(), !2809)
  br label %for.cond, !dbg !2825, !llvm.loop !2826

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !2828
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2829 {
entry:
    #dbg_value(ptr %out, !2830, !DIExpression(), !2831)
    #dbg_value(i32 %nblocks, !2832, !DIExpression(), !2831)
    #dbg_value(ptr %state, !2833, !DIExpression(), !2831)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2834
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2835
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 168) #2, !dbg !2836
  ret void, !dbg !2837
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) #0 !dbg !2838 {
entry:
    #dbg_value(ptr %out, !2841, !DIExpression(), !2842)
    #dbg_value(i32 %nblocks, !2843, !DIExpression(), !2842)
    #dbg_value(ptr %s, !2844, !DIExpression(), !2842)
    #dbg_value(i32 %r, !2845, !DIExpression(), !2842)
  br label %while.cond, !dbg !2846

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2841, !DIExpression(), !2842)
    #dbg_value(i32 %nblocks.addr.0, !2843, !DIExpression(), !2842)
  %tobool = icmp ne i32 %nblocks.addr.0, 0, !dbg !2846
  br i1 %tobool, label %while.body, label %while.end, !dbg !2846

while.body:                                       ; preds = %while.cond
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2847
    #dbg_value(i32 0, !2849, !DIExpression(), !2842)
  br label %for.cond, !dbg !2850

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !2852
    #dbg_value(i32 %i.0, !2849, !DIExpression(), !2842)
  %div = udiv i32 %r, 8, !dbg !2853
  %cmp = icmp ult i32 %i.0, %div, !dbg !2855
  br i1 %cmp, label %for.body, label %for.end, !dbg !2856

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2857
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2858
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2859
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2859
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2860
  br label %for.inc, !dbg !2860

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2861
    #dbg_value(i32 %inc, !2849, !DIExpression(), !2842)
  br label %for.cond, !dbg !2862, !llvm.loop !2863

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2865
    #dbg_value(ptr %add.ptr1, !2841, !DIExpression(), !2842)
  %sub = sub i32 %nblocks.addr.0, 1, !dbg !2866
    #dbg_value(i32 %sub, !2843, !DIExpression(), !2842)
  br label %while.cond, !dbg !2846, !llvm.loop !2867

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2869
}

; Function Attrs: noinline nounwind optnone
define internal void @store64(ptr noundef %x, i64 noundef %u) #0 !dbg !2870 {
entry:
    #dbg_value(ptr %x, !2873, !DIExpression(), !2874)
    #dbg_value(i64 %u, !2875, !DIExpression(), !2874)
    #dbg_value(i32 0, !2876, !DIExpression(), !2874)
  br label %for.cond, !dbg !2877

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2879
    #dbg_value(i32 %i.0, !2876, !DIExpression(), !2874)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2880
  br i1 %cmp, label %for.body, label %for.end, !dbg !2882

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2883
  %sh_prom = zext i32 %mul to i64, !dbg !2884
  %shr = lshr i64 %u, %sh_prom, !dbg !2884
  %conv = trunc i64 %shr to i8, !dbg !2885
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2886
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2887
  br label %for.inc, !dbg !2886

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2888
    #dbg_value(i32 %inc, !2876, !DIExpression(), !2874)
  br label %for.cond, !dbg !2889, !llvm.loop !2890

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2892
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) #0 !dbg !2893 {
entry:
    #dbg_value(ptr %state, !2894, !DIExpression(), !2895)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2896
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2897
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2898
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2899
  store i32 0, ptr %pos, align 8, !dbg !2900
  ret void, !dbg !2901
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2902 {
entry:
    #dbg_value(ptr %state, !2903, !DIExpression(), !2904)
    #dbg_value(ptr %in, !2905, !DIExpression(), !2904)
    #dbg_value(i32 %inlen, !2906, !DIExpression(), !2904)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2907
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2908
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2909
  %0 = load i32, ptr %pos, align 8, !dbg !2909
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2910
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2911
  store i32 %call, ptr %pos1, align 8, !dbg !2912
  ret void, !dbg !2913
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) #0 !dbg !2914 {
entry:
    #dbg_value(ptr %state, !2915, !DIExpression(), !2916)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2917
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2918
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2919
  %0 = load i32, ptr %pos, align 8, !dbg !2919
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #2, !dbg !2920
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2921
  store i32 136, ptr %pos1, align 8, !dbg !2922
  ret void, !dbg !2923
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2924 {
entry:
    #dbg_value(ptr %out, !2925, !DIExpression(), !2926)
    #dbg_value(i32 %outlen, !2927, !DIExpression(), !2926)
    #dbg_value(ptr %state, !2928, !DIExpression(), !2926)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2929
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2930
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2931
  %0 = load i32, ptr %pos, align 8, !dbg !2931
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136) #2, !dbg !2932
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2933
  store i32 %call, ptr %pos1, align 8, !dbg !2934
  ret void, !dbg !2935
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2936 {
entry:
    #dbg_value(ptr %state, !2937, !DIExpression(), !2938)
    #dbg_value(ptr %in, !2939, !DIExpression(), !2938)
    #dbg_value(i32 %inlen, !2940, !DIExpression(), !2938)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2941
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2942
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2943
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2944
  store i32 136, ptr %pos, align 8, !dbg !2945
  ret void, !dbg !2946
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2947 {
entry:
    #dbg_value(ptr %out, !2948, !DIExpression(), !2949)
    #dbg_value(i32 %nblocks, !2950, !DIExpression(), !2949)
    #dbg_value(ptr %state, !2951, !DIExpression(), !2949)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2952
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2953
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 136) #2, !dbg !2954
  ret void, !dbg !2955
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2956 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2959, !DIExpression(), !2960)
    #dbg_value(i32 %outlen, !2961, !DIExpression(), !2960)
    #dbg_value(ptr %in, !2962, !DIExpression(), !2960)
    #dbg_value(i32 %inlen, !2963, !DIExpression(), !2960)
    #dbg_declare(ptr %state, !2964, !DIExpression(), !2965)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2966
  %div = udiv i32 %outlen, 168, !dbg !2967
    #dbg_value(i32 %div, !2968, !DIExpression(), !2960)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2969
  %mul = mul i32 %div, 168, !dbg !2970
  %sub = sub i32 %outlen, %mul, !dbg !2971
    #dbg_value(i32 %sub, !2961, !DIExpression(), !2960)
  %mul1 = mul i32 %div, 168, !dbg !2972
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2973
    #dbg_value(ptr %add.ptr, !2959, !DIExpression(), !2960)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2974
  ret void, !dbg !2975
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2976 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2977, !DIExpression(), !2978)
    #dbg_value(i32 %outlen, !2979, !DIExpression(), !2978)
    #dbg_value(ptr %in, !2980, !DIExpression(), !2978)
    #dbg_value(i32 %inlen, !2981, !DIExpression(), !2978)
    #dbg_declare(ptr %state, !2982, !DIExpression(), !2983)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2984
  %div = udiv i32 %outlen, 136, !dbg !2985
    #dbg_value(i32 %div, !2986, !DIExpression(), !2978)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2987
  %mul = mul i32 %div, 136, !dbg !2988
  %sub = sub i32 %outlen, %mul, !dbg !2989
    #dbg_value(i32 %sub, !2979, !DIExpression(), !2978)
  %mul1 = mul i32 %div, 136, !dbg !2990
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2991
    #dbg_value(ptr %add.ptr, !2977, !DIExpression(), !2978)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2992
  ret void, !dbg !2993
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2994 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2997, !DIExpression(), !2998)
    #dbg_value(ptr %in, !2999, !DIExpression(), !2998)
    #dbg_value(i32 %inlen, !3000, !DIExpression(), !2998)
    #dbg_declare(ptr %s, !3001, !DIExpression(), !3002)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3003
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3004
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3005
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3006
    #dbg_value(i32 0, !3007, !DIExpression(), !2998)
  br label %for.cond, !dbg !3008

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3010
    #dbg_value(i32 %i.0, !3007, !DIExpression(), !2998)
  %cmp = icmp ult i32 %i.0, 4, !dbg !3011
  br i1 %cmp, label %for.body, label %for.end, !dbg !3013

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3014
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3015
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3016
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3016
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3017
  br label %for.inc, !dbg !3017

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3018
    #dbg_value(i32 %inc, !3007, !DIExpression(), !2998)
  br label %for.cond, !dbg !3019, !llvm.loop !3020

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3022
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3023 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !3024, !DIExpression(), !3025)
    #dbg_value(ptr %in, !3026, !DIExpression(), !3025)
    #dbg_value(i32 %inlen, !3027, !DIExpression(), !3025)
    #dbg_declare(ptr %s, !3028, !DIExpression(), !3029)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3030
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3031
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3032
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3033
    #dbg_value(i32 0, !3034, !DIExpression(), !3025)
  br label %for.cond, !dbg !3035

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3037
    #dbg_value(i32 %i.0, !3034, !DIExpression(), !3025)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3038
  br i1 %cmp, label %for.body, label %for.end, !dbg !3040

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3041
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3042
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3043
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3043
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3044
  br label %for.inc, !dbg !3044

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3045
    #dbg_value(i32 %inc, !3034, !DIExpression(), !3025)
  br label %for.cond, !dbg !3046, !llvm.loop !3047

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3049
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) #0 !dbg !3050 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !3060, !DIExpression(), !3061)
    #dbg_value(ptr %seed, !3062, !DIExpression(), !3061)
    #dbg_value(i8 %x, !3063, !DIExpression(), !3061)
    #dbg_value(i8 %y, !3064, !DIExpression(), !3061)
    #dbg_declare(ptr %extseed, !3065, !DIExpression(), !3069)
  %arraydecay = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3070
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %seed, i32 noundef 32) #2, !dbg !3071
  %arrayidx = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 32, !dbg !3072
  store i8 %x, ptr %arrayidx, align 1, !dbg !3073
  %arrayidx1 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 33, !dbg !3074
  store i8 %y, ptr %arrayidx1, align 1, !dbg !3075
  %arraydecay2 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3076
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %arraydecay2, i32 noundef 34) #2, !dbg !3077
  ret void, !dbg !3078
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) #0 !dbg !3079 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !3082, !DIExpression(), !3083)
    #dbg_value(i32 %outlen, !3084, !DIExpression(), !3083)
    #dbg_value(ptr %key, !3085, !DIExpression(), !3083)
    #dbg_value(i8 %nonce, !3086, !DIExpression(), !3083)
    #dbg_declare(ptr %extkey, !3087, !DIExpression(), !3091)
  %arraydecay = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3092
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %key, i32 noundef 32) #2, !dbg !3093
  %arrayidx = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 32, !dbg !3094
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !3095
  %arraydecay1 = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3096
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay1, i32 noundef 33) #2, !dbg !3097
  ret void, !dbg !3098
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) #0 !dbg !3099 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3100, !DIExpression(), !3101)
    #dbg_value(ptr %key, !3102, !DIExpression(), !3101)
    #dbg_value(ptr %input, !3103, !DIExpression(), !3101)
    #dbg_declare(ptr %s, !3104, !DIExpression(), !3105)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %s) #2, !dbg !3106
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %key, i32 noundef 32) #2, !dbg !3107
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %input, i32 noundef 1568) #2, !dbg !3108
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %s) #2, !dbg !3109
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef %s) #2, !dbg !3110
  ret void, !dbg !3111
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nounwind memory(none) }

!llvm.dbg.cu = !{!32, !33, !38, !43, !2, !45, !47, !49, !21, !50}
!llvm.ident = !{!51, !51, !51, !51, !51, !51, !51, !51, !51, !51}
!llvm.module.flags = !{!52, !53, !54, !55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
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
!80 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !57, file: !57, line: 50, type: !81, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!96 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !57, file: !57, line: 76, type: !97, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!119 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!134 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !57, file: !57, line: 140, type: !135, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 12544, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 1568)
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
!173 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !174, file: !174, line: 165, type: !175, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!174 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!175 = !DISubroutineType(types: !176)
!176 = !{null, !177, !64, !9}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 32)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !180)
!179 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 16384, elements: !181)
!181 = !{!182}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !180, file: !179, line: 9, baseType: !183, size: 16384)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 16384, elements: !192)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !186)
!185 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !187)
!187 = !{!188}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !186, file: !185, line: 12, baseType: !189, size: 4096)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !190)
!190 = !{!191}
!191 = !DISubrange(count: 256)
!192 = !{!193}
!193 = !DISubrange(count: 4)
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
!329 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !174, file: !174, line: 205, type: !330, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!345 = !DICompositeType(tag: DW_TAG_array_type, baseType: !178, size: 65536, elements: !192)
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
!433 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !174, file: !174, line: 260, type: !434, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!545 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !174, file: !174, line: 314, type: !546, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!588 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !589, file: !589, line: 15, type: !590, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!589 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!590 = !DISubroutineType(types: !591)
!591 = !{null, !60, !592}
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !593, size: 32)
!593 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !594)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !595)
!595 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 16384, elements: !596)
!596 = !{!597}
!597 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !595, file: !179, line: 9, baseType: !598, size: 16384)
!598 = !DICompositeType(tag: DW_TAG_array_type, baseType: !599, size: 16384, elements: !192)
!599 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !600)
!600 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !601)
!601 = !{!602}
!602 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !600, file: !185, line: 12, baseType: !189, size: 4096)
!603 = !DILocalVariable(name: "r", arg: 1, scope: !588, file: !589, line: 15, type: !60)
!604 = !DILocation(line: 0, scope: !588)
!605 = !DILocalVariable(name: "a", arg: 2, scope: !588, file: !589, line: 15, type: !592)
!606 = !DILocalVariable(name: "t", scope: !588, file: !589, line: 21, type: !607)
!607 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !608)
!608 = !{!609}
!609 = !DISubrange(count: 8)
!610 = !DILocation(line: 21, column: 12, scope: !588)
!611 = !DILocalVariable(name: "i", scope: !588, file: !589, line: 17, type: !42)
!612 = !DILocation(line: 22, column: 7, scope: !613)
!613 = distinct !DILexicalBlock(scope: !588, file: !589, line: 22, column: 3)
!614 = !DILocation(line: 22, scope: !613)
!615 = !DILocation(line: 22, column: 12, scope: !616)
!616 = distinct !DILexicalBlock(scope: !613, file: !589, line: 22, column: 3)
!617 = !DILocation(line: 22, column: 3, scope: !613)
!618 = !DILocalVariable(name: "j", scope: !588, file: !589, line: 17, type: !42)
!619 = !DILocation(line: 23, column: 9, scope: !620)
!620 = distinct !DILexicalBlock(scope: !621, file: !589, line: 23, column: 5)
!621 = distinct !DILexicalBlock(scope: !616, file: !589, line: 22, column: 26)
!622 = !DILocation(line: 23, scope: !620)
!623 = !DILocation(line: 23, column: 14, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !589, line: 23, column: 5)
!625 = !DILocation(line: 23, column: 5, scope: !620)
!626 = !DILocalVariable(name: "k", scope: !588, file: !589, line: 17, type: !42)
!627 = !DILocation(line: 24, column: 11, scope: !628)
!628 = distinct !DILexicalBlock(scope: !629, file: !589, line: 24, column: 7)
!629 = distinct !DILexicalBlock(scope: !624, file: !589, line: 23, column: 30)
!630 = !DILocation(line: 24, scope: !628)
!631 = !DILocation(line: 24, column: 16, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !589, line: 24, column: 7)
!633 = !DILocation(line: 24, column: 7, scope: !628)
!634 = !DILocation(line: 25, column: 20, scope: !635)
!635 = distinct !DILexicalBlock(scope: !632, file: !589, line: 24, column: 24)
!636 = !DILocation(line: 25, column: 17, scope: !635)
!637 = !DILocation(line: 25, column: 27, scope: !635)
!638 = !DILocation(line: 25, column: 35, scope: !635)
!639 = !DILocation(line: 25, column: 37, scope: !635)
!640 = !DILocation(line: 25, column: 9, scope: !635)
!641 = !DILocation(line: 25, column: 15, scope: !635)
!642 = !DILocation(line: 26, column: 27, scope: !635)
!643 = !DILocation(line: 26, column: 18, scope: !635)
!644 = !DILocation(line: 26, column: 32, scope: !635)
!645 = !DILocation(line: 26, column: 39, scope: !635)
!646 = !DILocation(line: 26, column: 9, scope: !635)
!647 = !DILocation(line: 26, column: 14, scope: !635)
!648 = !DILocation(line: 28, column: 14, scope: !635)
!649 = !DILocalVariable(name: "d0", scope: !588, file: !589, line: 18, type: !23)
!650 = !DILocation(line: 29, column: 12, scope: !635)
!651 = !DILocation(line: 30, column: 12, scope: !635)
!652 = !DILocation(line: 31, column: 12, scope: !635)
!653 = !DILocation(line: 32, column: 12, scope: !635)
!654 = !DILocation(line: 33, column: 19, scope: !635)
!655 = !DILocation(line: 33, column: 16, scope: !635)
!656 = !DILocation(line: 33, column: 9, scope: !635)
!657 = !DILocation(line: 33, column: 14, scope: !635)
!658 = !DILocation(line: 34, column: 7, scope: !635)
!659 = !DILocation(line: 24, column: 20, scope: !632)
!660 = !DILocation(line: 24, column: 7, scope: !632)
!661 = distinct !{!661, !633, !662, !259}
!662 = !DILocation(line: 34, column: 7, scope: !628)
!663 = !DILocation(line: 36, column: 16, scope: !629)
!664 = !DILocation(line: 36, column: 21, scope: !629)
!665 = !DILocation(line: 36, column: 15, scope: !629)
!666 = !DILocation(line: 36, column: 7, scope: !629)
!667 = !DILocation(line: 36, column: 13, scope: !629)
!668 = !DILocation(line: 37, column: 16, scope: !629)
!669 = !DILocation(line: 37, column: 21, scope: !629)
!670 = !DILocation(line: 37, column: 31, scope: !629)
!671 = !DILocation(line: 37, column: 36, scope: !629)
!672 = !DILocation(line: 37, column: 28, scope: !629)
!673 = !DILocation(line: 37, column: 15, scope: !629)
!674 = !DILocation(line: 37, column: 7, scope: !629)
!675 = !DILocation(line: 37, column: 13, scope: !629)
!676 = !DILocation(line: 38, column: 16, scope: !629)
!677 = !DILocation(line: 38, column: 21, scope: !629)
!678 = !DILocation(line: 38, column: 31, scope: !629)
!679 = !DILocation(line: 38, column: 36, scope: !629)
!680 = !DILocation(line: 38, column: 28, scope: !629)
!681 = !DILocation(line: 38, column: 15, scope: !629)
!682 = !DILocation(line: 38, column: 7, scope: !629)
!683 = !DILocation(line: 38, column: 13, scope: !629)
!684 = !DILocation(line: 39, column: 16, scope: !629)
!685 = !DILocation(line: 39, column: 21, scope: !629)
!686 = !DILocation(line: 39, column: 15, scope: !629)
!687 = !DILocation(line: 39, column: 7, scope: !629)
!688 = !DILocation(line: 39, column: 13, scope: !629)
!689 = !DILocation(line: 40, column: 16, scope: !629)
!690 = !DILocation(line: 40, column: 21, scope: !629)
!691 = !DILocation(line: 40, column: 31, scope: !629)
!692 = !DILocation(line: 40, column: 36, scope: !629)
!693 = !DILocation(line: 40, column: 28, scope: !629)
!694 = !DILocation(line: 40, column: 15, scope: !629)
!695 = !DILocation(line: 40, column: 7, scope: !629)
!696 = !DILocation(line: 40, column: 13, scope: !629)
!697 = !DILocation(line: 41, column: 16, scope: !629)
!698 = !DILocation(line: 41, column: 21, scope: !629)
!699 = !DILocation(line: 41, column: 31, scope: !629)
!700 = !DILocation(line: 41, column: 36, scope: !629)
!701 = !DILocation(line: 41, column: 28, scope: !629)
!702 = !DILocation(line: 41, column: 15, scope: !629)
!703 = !DILocation(line: 41, column: 7, scope: !629)
!704 = !DILocation(line: 41, column: 13, scope: !629)
!705 = !DILocation(line: 42, column: 16, scope: !629)
!706 = !DILocation(line: 42, column: 21, scope: !629)
!707 = !DILocation(line: 42, column: 31, scope: !629)
!708 = !DILocation(line: 42, column: 36, scope: !629)
!709 = !DILocation(line: 42, column: 28, scope: !629)
!710 = !DILocation(line: 42, column: 15, scope: !629)
!711 = !DILocation(line: 42, column: 7, scope: !629)
!712 = !DILocation(line: 42, column: 13, scope: !629)
!713 = !DILocation(line: 43, column: 16, scope: !629)
!714 = !DILocation(line: 43, column: 21, scope: !629)
!715 = !DILocation(line: 43, column: 15, scope: !629)
!716 = !DILocation(line: 43, column: 7, scope: !629)
!717 = !DILocation(line: 43, column: 13, scope: !629)
!718 = !DILocation(line: 44, column: 16, scope: !629)
!719 = !DILocation(line: 44, column: 21, scope: !629)
!720 = !DILocation(line: 44, column: 31, scope: !629)
!721 = !DILocation(line: 44, column: 36, scope: !629)
!722 = !DILocation(line: 44, column: 28, scope: !629)
!723 = !DILocation(line: 44, column: 15, scope: !629)
!724 = !DILocation(line: 44, column: 7, scope: !629)
!725 = !DILocation(line: 44, column: 13, scope: !629)
!726 = !DILocation(line: 45, column: 16, scope: !629)
!727 = !DILocation(line: 45, column: 21, scope: !629)
!728 = !DILocation(line: 45, column: 31, scope: !629)
!729 = !DILocation(line: 45, column: 36, scope: !629)
!730 = !DILocation(line: 45, column: 28, scope: !629)
!731 = !DILocation(line: 45, column: 15, scope: !629)
!732 = !DILocation(line: 45, column: 7, scope: !629)
!733 = !DILocation(line: 45, column: 13, scope: !629)
!734 = !DILocation(line: 46, column: 16, scope: !629)
!735 = !DILocation(line: 46, column: 21, scope: !629)
!736 = !DILocation(line: 46, column: 15, scope: !629)
!737 = !DILocation(line: 46, column: 7, scope: !629)
!738 = !DILocation(line: 46, column: 13, scope: !629)
!739 = !DILocation(line: 47, column: 9, scope: !629)
!740 = !DILocation(line: 48, column: 5, scope: !629)
!741 = !DILocation(line: 23, column: 26, scope: !624)
!742 = !DILocation(line: 23, column: 5, scope: !624)
!743 = distinct !{!743, !625, !744, !259}
!744 = !DILocation(line: 48, column: 5, scope: !620)
!745 = !DILocation(line: 49, column: 3, scope: !621)
!746 = !DILocation(line: 22, column: 22, scope: !616)
!747 = !DILocation(line: 22, column: 3, scope: !616)
!748 = distinct !{!748, !617, !749, !259}
!749 = !DILocation(line: 49, column: 3, scope: !613)
!750 = !DILocation(line: 77, column: 1, scope: !588)
!751 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !589, file: !589, line: 89, type: !752, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!752 = !DISubroutineType(types: !753)
!753 = !{null, !754, !64}
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !594, size: 32)
!755 = !DILocalVariable(name: "r", arg: 1, scope: !751, file: !589, line: 89, type: !754)
!756 = !DILocation(line: 0, scope: !751)
!757 = !DILocalVariable(name: "a", arg: 2, scope: !751, file: !589, line: 89, type: !64)
!758 = !DILocalVariable(name: "t", scope: !751, file: !589, line: 94, type: !607)
!759 = !DILocation(line: 94, column: 12, scope: !751)
!760 = !DILocalVariable(name: "i", scope: !751, file: !589, line: 91, type: !42)
!761 = !DILocation(line: 95, column: 7, scope: !762)
!762 = distinct !DILexicalBlock(scope: !751, file: !589, line: 95, column: 3)
!763 = !DILocation(line: 95, scope: !762)
!764 = !DILocation(line: 95, column: 12, scope: !765)
!765 = distinct !DILexicalBlock(scope: !762, file: !589, line: 95, column: 3)
!766 = !DILocation(line: 95, column: 3, scope: !762)
!767 = !DILocalVariable(name: "j", scope: !751, file: !589, line: 91, type: !42)
!768 = !DILocation(line: 96, column: 9, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !589, line: 96, column: 5)
!770 = distinct !DILexicalBlock(scope: !765, file: !589, line: 95, column: 26)
!771 = !DILocation(line: 96, scope: !769)
!772 = !DILocation(line: 96, column: 14, scope: !773)
!773 = distinct !DILexicalBlock(scope: !769, file: !589, line: 96, column: 5)
!774 = !DILocation(line: 96, column: 5, scope: !769)
!775 = !DILocation(line: 97, column: 15, scope: !776)
!776 = distinct !DILexicalBlock(scope: !773, file: !589, line: 96, column: 30)
!777 = !DILocation(line: 97, column: 20, scope: !776)
!778 = !DILocation(line: 97, column: 39, scope: !776)
!779 = !DILocation(line: 97, column: 29, scope: !776)
!780 = !DILocation(line: 97, column: 45, scope: !776)
!781 = !DILocation(line: 97, column: 26, scope: !776)
!782 = !DILocation(line: 97, column: 14, scope: !776)
!783 = !DILocation(line: 97, column: 7, scope: !776)
!784 = !DILocation(line: 97, column: 12, scope: !776)
!785 = !DILocation(line: 98, column: 15, scope: !776)
!786 = !DILocation(line: 98, column: 20, scope: !776)
!787 = !DILocation(line: 98, column: 39, scope: !776)
!788 = !DILocation(line: 98, column: 29, scope: !776)
!789 = !DILocation(line: 98, column: 45, scope: !776)
!790 = !DILocation(line: 98, column: 26, scope: !776)
!791 = !DILocation(line: 98, column: 14, scope: !776)
!792 = !DILocation(line: 98, column: 7, scope: !776)
!793 = !DILocation(line: 98, column: 12, scope: !776)
!794 = !DILocation(line: 99, column: 15, scope: !776)
!795 = !DILocation(line: 99, column: 20, scope: !776)
!796 = !DILocation(line: 99, column: 39, scope: !776)
!797 = !DILocation(line: 99, column: 29, scope: !776)
!798 = !DILocation(line: 99, column: 45, scope: !776)
!799 = !DILocation(line: 99, column: 26, scope: !776)
!800 = !DILocation(line: 99, column: 64, scope: !776)
!801 = !DILocation(line: 99, column: 54, scope: !776)
!802 = !DILocation(line: 99, column: 69, scope: !776)
!803 = !DILocation(line: 99, column: 51, scope: !776)
!804 = !DILocation(line: 99, column: 14, scope: !776)
!805 = !DILocation(line: 99, column: 7, scope: !776)
!806 = !DILocation(line: 99, column: 12, scope: !776)
!807 = !DILocation(line: 100, column: 15, scope: !776)
!808 = !DILocation(line: 100, column: 20, scope: !776)
!809 = !DILocation(line: 100, column: 39, scope: !776)
!810 = !DILocation(line: 100, column: 29, scope: !776)
!811 = !DILocation(line: 100, column: 45, scope: !776)
!812 = !DILocation(line: 100, column: 26, scope: !776)
!813 = !DILocation(line: 100, column: 14, scope: !776)
!814 = !DILocation(line: 100, column: 7, scope: !776)
!815 = !DILocation(line: 100, column: 12, scope: !776)
!816 = !DILocation(line: 101, column: 15, scope: !776)
!817 = !DILocation(line: 101, column: 20, scope: !776)
!818 = !DILocation(line: 101, column: 39, scope: !776)
!819 = !DILocation(line: 101, column: 29, scope: !776)
!820 = !DILocation(line: 101, column: 45, scope: !776)
!821 = !DILocation(line: 101, column: 26, scope: !776)
!822 = !DILocation(line: 101, column: 14, scope: !776)
!823 = !DILocation(line: 101, column: 7, scope: !776)
!824 = !DILocation(line: 101, column: 12, scope: !776)
!825 = !DILocation(line: 102, column: 15, scope: !776)
!826 = !DILocation(line: 102, column: 20, scope: !776)
!827 = !DILocation(line: 102, column: 39, scope: !776)
!828 = !DILocation(line: 102, column: 29, scope: !776)
!829 = !DILocation(line: 102, column: 45, scope: !776)
!830 = !DILocation(line: 102, column: 26, scope: !776)
!831 = !DILocation(line: 102, column: 64, scope: !776)
!832 = !DILocation(line: 102, column: 54, scope: !776)
!833 = !DILocation(line: 102, column: 69, scope: !776)
!834 = !DILocation(line: 102, column: 51, scope: !776)
!835 = !DILocation(line: 102, column: 14, scope: !776)
!836 = !DILocation(line: 102, column: 7, scope: !776)
!837 = !DILocation(line: 102, column: 12, scope: !776)
!838 = !DILocation(line: 103, column: 15, scope: !776)
!839 = !DILocation(line: 103, column: 20, scope: !776)
!840 = !DILocation(line: 103, column: 39, scope: !776)
!841 = !DILocation(line: 103, column: 29, scope: !776)
!842 = !DILocation(line: 103, column: 45, scope: !776)
!843 = !DILocation(line: 103, column: 26, scope: !776)
!844 = !DILocation(line: 103, column: 14, scope: !776)
!845 = !DILocation(line: 103, column: 7, scope: !776)
!846 = !DILocation(line: 103, column: 12, scope: !776)
!847 = !DILocation(line: 104, column: 15, scope: !776)
!848 = !DILocation(line: 104, column: 20, scope: !776)
!849 = !DILocation(line: 104, column: 39, scope: !776)
!850 = !DILocation(line: 104, column: 29, scope: !776)
!851 = !DILocation(line: 104, column: 45, scope: !776)
!852 = !DILocation(line: 104, column: 26, scope: !776)
!853 = !DILocation(line: 104, column: 14, scope: !776)
!854 = !DILocation(line: 104, column: 7, scope: !776)
!855 = !DILocation(line: 104, column: 12, scope: !776)
!856 = !DILocation(line: 105, column: 9, scope: !776)
!857 = !DILocalVariable(name: "k", scope: !751, file: !589, line: 91, type: !42)
!858 = !DILocation(line: 107, column: 11, scope: !859)
!859 = distinct !DILexicalBlock(scope: !776, file: !589, line: 107, column: 7)
!860 = !DILocation(line: 107, scope: !859)
!861 = !DILocation(line: 107, column: 16, scope: !862)
!862 = distinct !DILexicalBlock(scope: !859, file: !589, line: 107, column: 7)
!863 = !DILocation(line: 107, column: 7, scope: !859)
!864 = !DILocation(line: 108, column: 47, scope: !862)
!865 = !DILocation(line: 108, column: 52, scope: !862)
!866 = !DILocation(line: 108, column: 60, scope: !862)
!867 = !DILocation(line: 108, column: 69, scope: !862)
!868 = !DILocation(line: 108, column: 77, scope: !862)
!869 = !DILocation(line: 108, column: 35, scope: !862)
!870 = !DILocation(line: 108, column: 12, scope: !862)
!871 = !DILocation(line: 108, column: 9, scope: !862)
!872 = !DILocation(line: 108, column: 19, scope: !862)
!873 = !DILocation(line: 108, column: 27, scope: !862)
!874 = !DILocation(line: 108, column: 29, scope: !862)
!875 = !DILocation(line: 108, column: 33, scope: !862)
!876 = !DILocation(line: 107, column: 20, scope: !862)
!877 = !DILocation(line: 107, column: 7, scope: !862)
!878 = distinct !{!878, !863, !879, !259}
!879 = !DILocation(line: 108, column: 80, scope: !859)
!880 = !DILocation(line: 109, column: 5, scope: !776)
!881 = !DILocation(line: 96, column: 26, scope: !773)
!882 = !DILocation(line: 96, column: 5, scope: !773)
!883 = distinct !{!883, !774, !884, !259}
!884 = !DILocation(line: 109, column: 5, scope: !769)
!885 = !DILocation(line: 110, column: 3, scope: !770)
!886 = !DILocation(line: 95, column: 22, scope: !765)
!887 = !DILocation(line: 95, column: 3, scope: !765)
!888 = distinct !{!888, !766, !889, !259}
!889 = !DILocation(line: 110, column: 3, scope: !762)
!890 = !DILocation(line: 128, column: 1, scope: !751)
!891 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !589, file: !589, line: 139, type: !590, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!892 = !DILocalVariable(name: "r", arg: 1, scope: !891, file: !589, line: 139, type: !60)
!893 = !DILocation(line: 0, scope: !891)
!894 = !DILocalVariable(name: "a", arg: 2, scope: !891, file: !589, line: 139, type: !592)
!895 = !DILocalVariable(name: "i", scope: !891, file: !589, line: 141, type: !42)
!896 = !DILocation(line: 142, column: 7, scope: !897)
!897 = distinct !DILexicalBlock(scope: !891, file: !589, line: 142, column: 3)
!898 = !DILocation(line: 142, scope: !897)
!899 = !DILocation(line: 142, column: 12, scope: !900)
!900 = distinct !DILexicalBlock(scope: !897, file: !589, line: 142, column: 3)
!901 = !DILocation(line: 142, column: 3, scope: !897)
!902 = !DILocation(line: 143, column: 21, scope: !900)
!903 = !DILocation(line: 143, column: 19, scope: !900)
!904 = !DILocation(line: 143, column: 43, scope: !900)
!905 = !DILocation(line: 143, column: 40, scope: !900)
!906 = !DILocation(line: 143, column: 5, scope: !900)
!907 = !DILocation(line: 142, column: 22, scope: !900)
!908 = !DILocation(line: 142, column: 3, scope: !900)
!909 = distinct !{!909, !901, !910, !259}
!910 = !DILocation(line: 143, column: 49, scope: !897)
!911 = !DILocation(line: 144, column: 1, scope: !891)
!912 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !589, file: !589, line: 156, type: !752, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!913 = !DILocalVariable(name: "r", arg: 1, scope: !912, file: !589, line: 156, type: !754)
!914 = !DILocation(line: 0, scope: !912)
!915 = !DILocalVariable(name: "a", arg: 2, scope: !912, file: !589, line: 156, type: !64)
!916 = !DILocalVariable(name: "i", scope: !912, file: !589, line: 158, type: !42)
!917 = !DILocation(line: 159, column: 7, scope: !918)
!918 = distinct !DILexicalBlock(scope: !912, file: !589, line: 159, column: 3)
!919 = !DILocation(line: 159, scope: !918)
!920 = !DILocation(line: 159, column: 12, scope: !921)
!921 = distinct !DILexicalBlock(scope: !918, file: !589, line: 159, column: 3)
!922 = !DILocation(line: 159, column: 3, scope: !918)
!923 = !DILocation(line: 160, column: 24, scope: !921)
!924 = !DILocation(line: 160, column: 21, scope: !921)
!925 = !DILocation(line: 160, column: 35, scope: !921)
!926 = !DILocation(line: 160, column: 33, scope: !921)
!927 = !DILocation(line: 160, column: 5, scope: !921)
!928 = !DILocation(line: 159, column: 22, scope: !921)
!929 = !DILocation(line: 159, column: 3, scope: !921)
!930 = distinct !{!930, !922, !931, !259}
!931 = !DILocation(line: 160, column: 51, scope: !918)
!932 = !DILocation(line: 161, column: 1, scope: !912)
!933 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !589, file: !589, line: 170, type: !934, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!934 = !DISubroutineType(types: !935)
!935 = !{null, !754}
!936 = !DILocalVariable(name: "r", arg: 1, scope: !933, file: !589, line: 170, type: !754)
!937 = !DILocation(line: 0, scope: !933)
!938 = !DILocalVariable(name: "i", scope: !933, file: !589, line: 172, type: !42)
!939 = !DILocation(line: 173, column: 7, scope: !940)
!940 = distinct !DILexicalBlock(scope: !933, file: !589, line: 173, column: 3)
!941 = !DILocation(line: 173, scope: !940)
!942 = !DILocation(line: 173, column: 12, scope: !943)
!943 = distinct !DILexicalBlock(scope: !940, file: !589, line: 173, column: 3)
!944 = !DILocation(line: 173, column: 3, scope: !940)
!945 = !DILocation(line: 174, column: 18, scope: !943)
!946 = !DILocation(line: 174, column: 15, scope: !943)
!947 = !DILocation(line: 174, column: 5, scope: !943)
!948 = !DILocation(line: 173, column: 22, scope: !943)
!949 = !DILocation(line: 173, column: 3, scope: !943)
!950 = distinct !{!950, !944, !951, !259}
!951 = !DILocation(line: 174, column: 24, scope: !940)
!952 = !DILocation(line: 175, column: 1, scope: !933)
!953 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !589, file: !589, line: 185, type: !934, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!954 = !DILocalVariable(name: "r", arg: 1, scope: !953, file: !589, line: 185, type: !754)
!955 = !DILocation(line: 0, scope: !953)
!956 = !DILocalVariable(name: "i", scope: !953, file: !589, line: 187, type: !42)
!957 = !DILocation(line: 188, column: 7, scope: !958)
!958 = distinct !DILexicalBlock(scope: !953, file: !589, line: 188, column: 3)
!959 = !DILocation(line: 188, scope: !958)
!960 = !DILocation(line: 188, column: 12, scope: !961)
!961 = distinct !DILexicalBlock(scope: !958, file: !589, line: 188, column: 3)
!962 = !DILocation(line: 188, column: 3, scope: !958)
!963 = !DILocation(line: 189, column: 28, scope: !961)
!964 = !DILocation(line: 189, column: 25, scope: !961)
!965 = !DILocation(line: 189, column: 5, scope: !961)
!966 = !DILocation(line: 188, column: 22, scope: !961)
!967 = !DILocation(line: 188, column: 3, scope: !961)
!968 = distinct !{!968, !962, !969, !259}
!969 = !DILocation(line: 189, column: 34, scope: !958)
!970 = !DILocation(line: 190, column: 1, scope: !953)
!971 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !589, file: !589, line: 202, type: !972, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!972 = !DISubroutineType(types: !973)
!973 = !{null, !974, !592, !592}
!974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !599, size: 32)
!975 = !DILocalVariable(name: "r", arg: 1, scope: !971, file: !589, line: 202, type: !974)
!976 = !DILocation(line: 0, scope: !971)
!977 = !DILocalVariable(name: "a", arg: 2, scope: !971, file: !589, line: 202, type: !592)
!978 = !DILocalVariable(name: "b", arg: 3, scope: !971, file: !589, line: 202, type: !592)
!979 = !DILocalVariable(name: "t", scope: !971, file: !589, line: 205, type: !599)
!980 = !DILocation(line: 205, column: 8, scope: !971)
!981 = !DILocation(line: 207, column: 34, scope: !971)
!982 = !DILocation(line: 207, column: 31, scope: !971)
!983 = !DILocation(line: 207, column: 46, scope: !971)
!984 = !DILocation(line: 207, column: 43, scope: !971)
!985 = !DILocation(line: 207, column: 3, scope: !971)
!986 = !DILocalVariable(name: "i", scope: !971, file: !589, line: 204, type: !42)
!987 = !DILocation(line: 208, column: 7, scope: !988)
!988 = distinct !DILexicalBlock(scope: !971, file: !589, line: 208, column: 3)
!989 = !DILocation(line: 208, scope: !988)
!990 = !DILocation(line: 208, column: 12, scope: !991)
!991 = distinct !DILexicalBlock(scope: !988, file: !589, line: 208, column: 3)
!992 = !DILocation(line: 208, column: 3, scope: !988)
!993 = !DILocation(line: 209, column: 37, scope: !994)
!994 = distinct !DILexicalBlock(scope: !991, file: !589, line: 208, column: 26)
!995 = !DILocation(line: 209, column: 34, scope: !994)
!996 = !DILocation(line: 209, column: 49, scope: !994)
!997 = !DILocation(line: 209, column: 46, scope: !994)
!998 = !DILocation(line: 209, column: 5, scope: !994)
!999 = !DILocation(line: 210, column: 5, scope: !994)
!1000 = !DILocation(line: 211, column: 3, scope: !994)
!1001 = !DILocation(line: 208, column: 22, scope: !991)
!1002 = !DILocation(line: 208, column: 3, scope: !991)
!1003 = distinct !{!1003, !992, !1004, !259}
!1004 = !DILocation(line: 211, column: 3, scope: !988)
!1005 = !DILocation(line: 213, column: 3, scope: !971)
!1006 = !DILocation(line: 214, column: 1, scope: !971)
!1007 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !589, file: !589, line: 225, type: !934, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1008 = !DILocalVariable(name: "r", arg: 1, scope: !1007, file: !589, line: 225, type: !754)
!1009 = !DILocation(line: 0, scope: !1007)
!1010 = !DILocalVariable(name: "i", scope: !1007, file: !589, line: 227, type: !42)
!1011 = !DILocation(line: 228, column: 7, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1007, file: !589, line: 228, column: 3)
!1013 = !DILocation(line: 228, scope: !1012)
!1014 = !DILocation(line: 228, column: 12, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1012, file: !589, line: 228, column: 3)
!1016 = !DILocation(line: 228, column: 3, scope: !1012)
!1017 = !DILocation(line: 229, column: 21, scope: !1015)
!1018 = !DILocation(line: 229, column: 18, scope: !1015)
!1019 = !DILocation(line: 229, column: 5, scope: !1015)
!1020 = !DILocation(line: 228, column: 22, scope: !1015)
!1021 = !DILocation(line: 228, column: 3, scope: !1015)
!1022 = distinct !{!1022, !1016, !1023, !259}
!1023 = !DILocation(line: 229, column: 27, scope: !1012)
!1024 = !DILocation(line: 230, column: 1, scope: !1007)
!1025 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !589, file: !589, line: 241, type: !1026, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!1026 = !DISubroutineType(types: !1027)
!1027 = !{null, !754, !592, !592}
!1028 = !DILocalVariable(name: "r", arg: 1, scope: !1025, file: !589, line: 241, type: !754)
!1029 = !DILocation(line: 0, scope: !1025)
!1030 = !DILocalVariable(name: "a", arg: 2, scope: !1025, file: !589, line: 241, type: !592)
!1031 = !DILocalVariable(name: "b", arg: 3, scope: !1025, file: !589, line: 241, type: !592)
!1032 = !DILocalVariable(name: "i", scope: !1025, file: !589, line: 243, type: !42)
!1033 = !DILocation(line: 244, column: 7, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1025, file: !589, line: 244, column: 3)
!1035 = !DILocation(line: 244, scope: !1034)
!1036 = !DILocation(line: 244, column: 12, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1034, file: !589, line: 244, column: 3)
!1038 = !DILocation(line: 244, column: 3, scope: !1034)
!1039 = !DILocation(line: 245, column: 18, scope: !1037)
!1040 = !DILocation(line: 245, column: 15, scope: !1037)
!1041 = !DILocation(line: 245, column: 30, scope: !1037)
!1042 = !DILocation(line: 245, column: 27, scope: !1037)
!1043 = !DILocation(line: 245, column: 42, scope: !1037)
!1044 = !DILocation(line: 245, column: 39, scope: !1037)
!1045 = !DILocation(line: 245, column: 5, scope: !1037)
!1046 = !DILocation(line: 244, column: 22, scope: !1037)
!1047 = !DILocation(line: 244, column: 3, scope: !1037)
!1048 = distinct !{!1048, !1038, !1049, !259}
!1049 = !DILocation(line: 245, column: 48, scope: !1034)
!1050 = !DILocation(line: 246, column: 1, scope: !1025)
!1051 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1052, file: !1052, line: 19, type: !1053, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1052 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1053 = !DISubroutineType(types: !1054)
!1054 = !{null, !60, !1055}
!1055 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1056, size: 32)
!1056 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1057)
!1057 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !1058)
!1058 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !1059)
!1059 = !{!1060}
!1060 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1058, file: !185, line: 12, baseType: !189, size: 4096)
!1061 = !DILocalVariable(name: "r", arg: 1, scope: !1051, file: !1052, line: 19, type: !60)
!1062 = !DILocation(line: 0, scope: !1051)
!1063 = !DILocalVariable(name: "a", arg: 2, scope: !1051, file: !1052, line: 19, type: !1055)
!1064 = !DILocalVariable(name: "t", scope: !1051, file: !1052, line: 24, type: !1065)
!1065 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 64, elements: !608)
!1066 = !DILocation(line: 24, column: 11, scope: !1051)
!1067 = !DILocalVariable(name: "i", scope: !1051, file: !1052, line: 21, type: !42)
!1068 = !DILocation(line: 48, column: 7, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1051, file: !1052, line: 48, column: 3)
!1070 = !DILocation(line: 48, scope: !1069)
!1071 = !DILocation(line: 48, column: 12, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1069, file: !1052, line: 48, column: 3)
!1073 = !DILocation(line: 48, column: 3, scope: !1069)
!1074 = !DILocalVariable(name: "j", scope: !1051, file: !1052, line: 21, type: !42)
!1075 = !DILocation(line: 49, column: 9, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1077, file: !1052, line: 49, column: 5)
!1077 = distinct !DILexicalBlock(scope: !1072, file: !1052, line: 48, column: 28)
!1078 = !DILocation(line: 49, scope: !1076)
!1079 = !DILocation(line: 49, column: 14, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1076, file: !1052, line: 49, column: 5)
!1081 = !DILocation(line: 49, column: 5, scope: !1076)
!1082 = !DILocation(line: 51, column: 15, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !1052, line: 49, column: 22)
!1084 = !DILocation(line: 51, column: 23, scope: !1083)
!1085 = !DILocation(line: 51, column: 25, scope: !1083)
!1086 = !DILocation(line: 51, column: 12, scope: !1083)
!1087 = !DILocalVariable(name: "u", scope: !1051, file: !1052, line: 22, type: !14)
!1088 = !DILocation(line: 52, column: 13, scope: !1083)
!1089 = !DILocation(line: 52, column: 15, scope: !1083)
!1090 = !DILocation(line: 52, column: 22, scope: !1083)
!1091 = !DILocation(line: 52, column: 9, scope: !1083)
!1092 = !DILocation(line: 54, column: 12, scope: !1083)
!1093 = !DILocation(line: 54, column: 14, scope: !1083)
!1094 = !DILocalVariable(name: "d0", scope: !1051, file: !1052, line: 23, type: !40)
!1095 = !DILocation(line: 55, column: 10, scope: !1083)
!1096 = !DILocation(line: 56, column: 10, scope: !1083)
!1097 = !DILocation(line: 57, column: 10, scope: !1083)
!1098 = !DILocation(line: 58, column: 17, scope: !1083)
!1099 = !DILocation(line: 58, column: 14, scope: !1083)
!1100 = !DILocation(line: 58, column: 7, scope: !1083)
!1101 = !DILocation(line: 58, column: 12, scope: !1083)
!1102 = !DILocation(line: 59, column: 5, scope: !1083)
!1103 = !DILocation(line: 49, column: 18, scope: !1080)
!1104 = !DILocation(line: 49, column: 5, scope: !1080)
!1105 = distinct !{!1105, !1081, !1106, !259}
!1106 = !DILocation(line: 59, column: 5, scope: !1076)
!1107 = !DILocation(line: 61, column: 13, scope: !1077)
!1108 = !DILocation(line: 61, column: 18, scope: !1077)
!1109 = !DILocation(line: 61, column: 27, scope: !1077)
!1110 = !DILocation(line: 61, column: 32, scope: !1077)
!1111 = !DILocation(line: 61, column: 24, scope: !1077)
!1112 = !DILocation(line: 61, column: 12, scope: !1077)
!1113 = !DILocation(line: 61, column: 5, scope: !1077)
!1114 = !DILocation(line: 61, column: 10, scope: !1077)
!1115 = !DILocation(line: 62, column: 13, scope: !1077)
!1116 = !DILocation(line: 62, column: 18, scope: !1077)
!1117 = !DILocation(line: 62, column: 27, scope: !1077)
!1118 = !DILocation(line: 62, column: 32, scope: !1077)
!1119 = !DILocation(line: 62, column: 24, scope: !1077)
!1120 = !DILocation(line: 62, column: 41, scope: !1077)
!1121 = !DILocation(line: 62, column: 46, scope: !1077)
!1122 = !DILocation(line: 62, column: 38, scope: !1077)
!1123 = !DILocation(line: 62, column: 12, scope: !1077)
!1124 = !DILocation(line: 62, column: 5, scope: !1077)
!1125 = !DILocation(line: 62, column: 10, scope: !1077)
!1126 = !DILocation(line: 63, column: 13, scope: !1077)
!1127 = !DILocation(line: 63, column: 18, scope: !1077)
!1128 = !DILocation(line: 63, column: 27, scope: !1077)
!1129 = !DILocation(line: 63, column: 32, scope: !1077)
!1130 = !DILocation(line: 63, column: 24, scope: !1077)
!1131 = !DILocation(line: 63, column: 12, scope: !1077)
!1132 = !DILocation(line: 63, column: 5, scope: !1077)
!1133 = !DILocation(line: 63, column: 10, scope: !1077)
!1134 = !DILocation(line: 64, column: 13, scope: !1077)
!1135 = !DILocation(line: 64, column: 18, scope: !1077)
!1136 = !DILocation(line: 64, column: 27, scope: !1077)
!1137 = !DILocation(line: 64, column: 32, scope: !1077)
!1138 = !DILocation(line: 64, column: 24, scope: !1077)
!1139 = !DILocation(line: 64, column: 41, scope: !1077)
!1140 = !DILocation(line: 64, column: 46, scope: !1077)
!1141 = !DILocation(line: 64, column: 38, scope: !1077)
!1142 = !DILocation(line: 64, column: 12, scope: !1077)
!1143 = !DILocation(line: 64, column: 5, scope: !1077)
!1144 = !DILocation(line: 64, column: 10, scope: !1077)
!1145 = !DILocation(line: 65, column: 13, scope: !1077)
!1146 = !DILocation(line: 65, column: 18, scope: !1077)
!1147 = !DILocation(line: 65, column: 27, scope: !1077)
!1148 = !DILocation(line: 65, column: 32, scope: !1077)
!1149 = !DILocation(line: 65, column: 24, scope: !1077)
!1150 = !DILocation(line: 65, column: 12, scope: !1077)
!1151 = !DILocation(line: 65, column: 5, scope: !1077)
!1152 = !DILocation(line: 65, column: 10, scope: !1077)
!1153 = !DILocation(line: 66, column: 7, scope: !1077)
!1154 = !DILocation(line: 67, column: 3, scope: !1077)
!1155 = !DILocation(line: 48, column: 24, scope: !1072)
!1156 = !DILocation(line: 48, column: 3, scope: !1072)
!1157 = distinct !{!1157, !1073, !1158, !259}
!1158 = !DILocation(line: 67, column: 3, scope: !1069)
!1159 = !DILocation(line: 71, column: 1, scope: !1051)
!1160 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1052, file: !1052, line: 83, type: !1161, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{null, !1163, !64}
!1163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1057, size: 32)
!1164 = !DILocalVariable(name: "r", arg: 1, scope: !1160, file: !1052, line: 83, type: !1163)
!1165 = !DILocation(line: 0, scope: !1160)
!1166 = !DILocalVariable(name: "a", arg: 2, scope: !1160, file: !1052, line: 83, type: !64)
!1167 = !DILocalVariable(name: "t", scope: !1160, file: !1052, line: 95, type: !1065)
!1168 = !DILocation(line: 95, column: 11, scope: !1160)
!1169 = !DILocalVariable(name: "i", scope: !1160, file: !1052, line: 85, type: !42)
!1170 = !DILocation(line: 96, column: 7, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1160, file: !1052, line: 96, column: 3)
!1172 = !DILocation(line: 96, scope: !1171)
!1173 = !DILocation(line: 96, column: 12, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1171, file: !1052, line: 96, column: 3)
!1175 = !DILocation(line: 96, column: 3, scope: !1171)
!1176 = !DILocation(line: 97, column: 13, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1174, file: !1052, line: 96, column: 28)
!1178 = !DILocation(line: 97, column: 18, scope: !1177)
!1179 = !DILocation(line: 97, column: 12, scope: !1177)
!1180 = !DILocation(line: 97, column: 5, scope: !1177)
!1181 = !DILocation(line: 97, column: 10, scope: !1177)
!1182 = !DILocation(line: 98, column: 13, scope: !1177)
!1183 = !DILocation(line: 98, column: 18, scope: !1177)
!1184 = !DILocation(line: 98, column: 27, scope: !1177)
!1185 = !DILocation(line: 98, column: 32, scope: !1177)
!1186 = !DILocation(line: 98, column: 24, scope: !1177)
!1187 = !DILocation(line: 98, column: 12, scope: !1177)
!1188 = !DILocation(line: 98, column: 5, scope: !1177)
!1189 = !DILocation(line: 98, column: 10, scope: !1177)
!1190 = !DILocation(line: 99, column: 13, scope: !1177)
!1191 = !DILocation(line: 99, column: 18, scope: !1177)
!1192 = !DILocation(line: 99, column: 12, scope: !1177)
!1193 = !DILocation(line: 99, column: 5, scope: !1177)
!1194 = !DILocation(line: 99, column: 10, scope: !1177)
!1195 = !DILocation(line: 100, column: 13, scope: !1177)
!1196 = !DILocation(line: 100, column: 18, scope: !1177)
!1197 = !DILocation(line: 100, column: 27, scope: !1177)
!1198 = !DILocation(line: 100, column: 32, scope: !1177)
!1199 = !DILocation(line: 100, column: 24, scope: !1177)
!1200 = !DILocation(line: 100, column: 12, scope: !1177)
!1201 = !DILocation(line: 100, column: 5, scope: !1177)
!1202 = !DILocation(line: 100, column: 10, scope: !1177)
!1203 = !DILocation(line: 101, column: 13, scope: !1177)
!1204 = !DILocation(line: 101, column: 18, scope: !1177)
!1205 = !DILocation(line: 101, column: 27, scope: !1177)
!1206 = !DILocation(line: 101, column: 32, scope: !1177)
!1207 = !DILocation(line: 101, column: 24, scope: !1177)
!1208 = !DILocation(line: 101, column: 12, scope: !1177)
!1209 = !DILocation(line: 101, column: 5, scope: !1177)
!1210 = !DILocation(line: 101, column: 10, scope: !1177)
!1211 = !DILocation(line: 102, column: 13, scope: !1177)
!1212 = !DILocation(line: 102, column: 18, scope: !1177)
!1213 = !DILocation(line: 102, column: 12, scope: !1177)
!1214 = !DILocation(line: 102, column: 5, scope: !1177)
!1215 = !DILocation(line: 102, column: 10, scope: !1177)
!1216 = !DILocation(line: 103, column: 13, scope: !1177)
!1217 = !DILocation(line: 103, column: 18, scope: !1177)
!1218 = !DILocation(line: 103, column: 27, scope: !1177)
!1219 = !DILocation(line: 103, column: 32, scope: !1177)
!1220 = !DILocation(line: 103, column: 24, scope: !1177)
!1221 = !DILocation(line: 103, column: 12, scope: !1177)
!1222 = !DILocation(line: 103, column: 5, scope: !1177)
!1223 = !DILocation(line: 103, column: 10, scope: !1177)
!1224 = !DILocation(line: 104, column: 13, scope: !1177)
!1225 = !DILocation(line: 104, column: 18, scope: !1177)
!1226 = !DILocation(line: 104, column: 12, scope: !1177)
!1227 = !DILocation(line: 104, column: 5, scope: !1177)
!1228 = !DILocation(line: 104, column: 10, scope: !1177)
!1229 = !DILocation(line: 105, column: 7, scope: !1177)
!1230 = !DILocalVariable(name: "j", scope: !1160, file: !1052, line: 94, type: !42)
!1231 = !DILocation(line: 107, column: 9, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1177, file: !1052, line: 107, column: 5)
!1233 = !DILocation(line: 107, scope: !1232)
!1234 = !DILocation(line: 107, column: 14, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1232, file: !1052, line: 107, column: 5)
!1236 = !DILocation(line: 107, column: 5, scope: !1232)
!1237 = !DILocation(line: 108, column: 38, scope: !1235)
!1238 = !DILocation(line: 108, column: 43, scope: !1235)
!1239 = !DILocation(line: 108, column: 48, scope: !1235)
!1240 = !DILocation(line: 108, column: 57, scope: !1235)
!1241 = !DILocation(line: 108, column: 63, scope: !1235)
!1242 = !DILocation(line: 108, column: 26, scope: !1235)
!1243 = !DILocation(line: 108, column: 10, scope: !1235)
!1244 = !DILocation(line: 108, column: 18, scope: !1235)
!1245 = !DILocation(line: 108, column: 20, scope: !1235)
!1246 = !DILocation(line: 108, column: 7, scope: !1235)
!1247 = !DILocation(line: 108, column: 24, scope: !1235)
!1248 = !DILocation(line: 107, column: 18, scope: !1235)
!1249 = !DILocation(line: 107, column: 5, scope: !1235)
!1250 = distinct !{!1250, !1236, !1251, !259}
!1251 = !DILocation(line: 108, column: 66, scope: !1232)
!1252 = !DILocation(line: 109, column: 3, scope: !1177)
!1253 = !DILocation(line: 96, column: 24, scope: !1174)
!1254 = !DILocation(line: 96, column: 3, scope: !1174)
!1255 = distinct !{!1255, !1175, !1256, !259}
!1256 = !DILocation(line: 109, column: 3, scope: !1171)
!1257 = !DILocation(line: 113, column: 1, scope: !1160)
!1258 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1052, file: !1052, line: 124, type: !1053, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1259 = !DILocalVariable(name: "r", arg: 1, scope: !1258, file: !1052, line: 124, type: !60)
!1260 = !DILocation(line: 0, scope: !1258)
!1261 = !DILocalVariable(name: "a", arg: 2, scope: !1258, file: !1052, line: 124, type: !1055)
!1262 = !DILocalVariable(name: "i", scope: !1258, file: !1052, line: 126, type: !42)
!1263 = !DILocation(line: 129, column: 7, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1258, file: !1052, line: 129, column: 3)
!1265 = !DILocation(line: 129, scope: !1264)
!1266 = !DILocation(line: 129, column: 12, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1264, file: !1052, line: 129, column: 3)
!1268 = !DILocation(line: 129, column: 3, scope: !1264)
!1269 = !DILocation(line: 131, column: 14, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1267, file: !1052, line: 129, column: 28)
!1271 = !DILocation(line: 131, column: 22, scope: !1270)
!1272 = !DILocation(line: 131, column: 11, scope: !1270)
!1273 = !DILocalVariable(name: "t0", scope: !1258, file: !1052, line: 127, type: !35)
!1274 = !DILocation(line: 132, column: 12, scope: !1270)
!1275 = !DILocation(line: 132, column: 24, scope: !1270)
!1276 = !DILocation(line: 132, column: 31, scope: !1270)
!1277 = !DILocation(line: 132, column: 8, scope: !1270)
!1278 = !DILocation(line: 133, column: 13, scope: !1270)
!1279 = !DILocation(line: 133, column: 21, scope: !1270)
!1280 = !DILocation(line: 133, column: 23, scope: !1270)
!1281 = !DILocation(line: 133, column: 10, scope: !1270)
!1282 = !DILocalVariable(name: "t1", scope: !1258, file: !1052, line: 127, type: !35)
!1283 = !DILocation(line: 134, column: 12, scope: !1270)
!1284 = !DILocation(line: 134, column: 24, scope: !1270)
!1285 = !DILocation(line: 134, column: 31, scope: !1270)
!1286 = !DILocation(line: 134, column: 8, scope: !1270)
!1287 = !DILocation(line: 135, column: 17, scope: !1270)
!1288 = !DILocation(line: 135, column: 20, scope: !1270)
!1289 = !DILocation(line: 135, column: 16, scope: !1270)
!1290 = !DILocation(line: 135, column: 8, scope: !1270)
!1291 = !DILocation(line: 135, column: 10, scope: !1270)
!1292 = !DILocation(line: 135, column: 5, scope: !1270)
!1293 = !DILocation(line: 135, column: 14, scope: !1270)
!1294 = !DILocation(line: 136, column: 17, scope: !1270)
!1295 = !DILocation(line: 136, column: 20, scope: !1270)
!1296 = !DILocation(line: 136, column: 29, scope: !1270)
!1297 = !DILocation(line: 136, column: 32, scope: !1270)
!1298 = !DILocation(line: 136, column: 26, scope: !1270)
!1299 = !DILocation(line: 136, column: 16, scope: !1270)
!1300 = !DILocation(line: 136, column: 8, scope: !1270)
!1301 = !DILocation(line: 136, column: 10, scope: !1270)
!1302 = !DILocation(line: 136, column: 5, scope: !1270)
!1303 = !DILocation(line: 136, column: 14, scope: !1270)
!1304 = !DILocation(line: 137, column: 17, scope: !1270)
!1305 = !DILocation(line: 137, column: 20, scope: !1270)
!1306 = !DILocation(line: 137, column: 16, scope: !1270)
!1307 = !DILocation(line: 137, column: 8, scope: !1270)
!1308 = !DILocation(line: 137, column: 10, scope: !1270)
!1309 = !DILocation(line: 137, column: 5, scope: !1270)
!1310 = !DILocation(line: 137, column: 14, scope: !1270)
!1311 = !DILocation(line: 138, column: 3, scope: !1270)
!1312 = !DILocation(line: 129, column: 24, scope: !1267)
!1313 = !DILocation(line: 129, column: 3, scope: !1267)
!1314 = distinct !{!1314, !1268, !1315, !259}
!1315 = !DILocation(line: 138, column: 3, scope: !1264)
!1316 = !DILocation(line: 139, column: 1, scope: !1258)
!1317 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1052, file: !1052, line: 151, type: !1161, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1318 = !DILocalVariable(name: "r", arg: 1, scope: !1317, file: !1052, line: 151, type: !1163)
!1319 = !DILocation(line: 0, scope: !1317)
!1320 = !DILocalVariable(name: "a", arg: 2, scope: !1317, file: !1052, line: 151, type: !64)
!1321 = !DILocalVariable(name: "i", scope: !1317, file: !1052, line: 153, type: !42)
!1322 = !DILocation(line: 154, column: 7, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1317, file: !1052, line: 154, column: 3)
!1324 = !DILocation(line: 154, scope: !1323)
!1325 = !DILocation(line: 154, column: 12, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1323, file: !1052, line: 154, column: 3)
!1327 = !DILocation(line: 154, column: 3, scope: !1323)
!1328 = !DILocation(line: 155, column: 29, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1326, file: !1052, line: 154, column: 28)
!1330 = !DILocation(line: 155, column: 31, scope: !1329)
!1331 = !DILocation(line: 155, column: 26, scope: !1329)
!1332 = !DILocation(line: 155, column: 35, scope: !1329)
!1333 = !DILocation(line: 155, column: 57, scope: !1329)
!1334 = !DILocation(line: 155, column: 59, scope: !1329)
!1335 = !DILocation(line: 155, column: 54, scope: !1329)
!1336 = !DILocation(line: 155, column: 44, scope: !1329)
!1337 = !DILocation(line: 155, column: 63, scope: !1329)
!1338 = !DILocation(line: 155, column: 41, scope: !1329)
!1339 = !DILocation(line: 155, column: 70, scope: !1329)
!1340 = !DILocation(line: 155, column: 24, scope: !1329)
!1341 = !DILocation(line: 155, column: 8, scope: !1329)
!1342 = !DILocation(line: 155, column: 16, scope: !1329)
!1343 = !DILocation(line: 155, column: 5, scope: !1329)
!1344 = !DILocation(line: 155, column: 22, scope: !1329)
!1345 = !DILocation(line: 156, column: 29, scope: !1329)
!1346 = !DILocation(line: 156, column: 31, scope: !1329)
!1347 = !DILocation(line: 156, column: 26, scope: !1329)
!1348 = !DILocation(line: 156, column: 35, scope: !1329)
!1349 = !DILocation(line: 156, column: 57, scope: !1329)
!1350 = !DILocation(line: 156, column: 59, scope: !1329)
!1351 = !DILocation(line: 156, column: 54, scope: !1329)
!1352 = !DILocation(line: 156, column: 44, scope: !1329)
!1353 = !DILocation(line: 156, column: 63, scope: !1329)
!1354 = !DILocation(line: 156, column: 41, scope: !1329)
!1355 = !DILocation(line: 156, column: 70, scope: !1329)
!1356 = !DILocation(line: 156, column: 24, scope: !1329)
!1357 = !DILocation(line: 156, column: 8, scope: !1329)
!1358 = !DILocation(line: 156, column: 16, scope: !1329)
!1359 = !DILocation(line: 156, column: 18, scope: !1329)
!1360 = !DILocation(line: 156, column: 5, scope: !1329)
!1361 = !DILocation(line: 156, column: 22, scope: !1329)
!1362 = !DILocation(line: 157, column: 3, scope: !1329)
!1363 = !DILocation(line: 154, column: 24, scope: !1326)
!1364 = !DILocation(line: 154, column: 3, scope: !1326)
!1365 = distinct !{!1365, !1327, !1366, !259}
!1366 = !DILocation(line: 157, column: 3, scope: !1323)
!1367 = !DILocation(line: 158, column: 1, scope: !1317)
!1368 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1052, file: !1052, line: 168, type: !1161, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1369 = !DILocalVariable(name: "r", arg: 1, scope: !1368, file: !1052, line: 168, type: !1163)
!1370 = !DILocation(line: 0, scope: !1368)
!1371 = !DILocalVariable(name: "msg", arg: 2, scope: !1368, file: !1052, line: 168, type: !64)
!1372 = !DILocalVariable(name: "i", scope: !1368, file: !1052, line: 170, type: !42)
!1373 = !DILocation(line: 176, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1368, file: !1052, line: 176, column: 3)
!1375 = !DILocation(line: 176, scope: !1374)
!1376 = !DILocation(line: 176, column: 12, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1374, file: !1052, line: 176, column: 3)
!1378 = !DILocation(line: 176, column: 3, scope: !1374)
!1379 = !DILocalVariable(name: "j", scope: !1368, file: !1052, line: 170, type: !42)
!1380 = !DILocation(line: 177, column: 9, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !1052, line: 177, column: 5)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !1052, line: 176, column: 28)
!1383 = !DILocation(line: 177, scope: !1381)
!1384 = !DILocation(line: 177, column: 14, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1381, file: !1052, line: 177, column: 5)
!1386 = !DILocation(line: 177, column: 5, scope: !1381)
!1387 = !DILocation(line: 178, column: 10, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1385, file: !1052, line: 177, column: 22)
!1389 = !DILocation(line: 178, column: 18, scope: !1388)
!1390 = !DILocation(line: 178, column: 20, scope: !1388)
!1391 = !DILocation(line: 178, column: 7, scope: !1388)
!1392 = !DILocation(line: 178, column: 24, scope: !1388)
!1393 = !DILocation(line: 179, column: 21, scope: !1388)
!1394 = !DILocation(line: 179, column: 18, scope: !1388)
!1395 = !DILocation(line: 179, column: 29, scope: !1388)
!1396 = !DILocation(line: 179, column: 27, scope: !1388)
!1397 = !DILocation(line: 179, column: 31, scope: !1388)
!1398 = !DILocation(line: 179, column: 53, scope: !1388)
!1399 = !DILocation(line: 179, column: 60, scope: !1388)
!1400 = !DILocation(line: 179, column: 65, scope: !1388)
!1401 = !DILocation(line: 179, column: 52, scope: !1388)
!1402 = !DILocation(line: 179, column: 7, scope: !1388)
!1403 = !DILocation(line: 180, column: 5, scope: !1388)
!1404 = !DILocation(line: 177, column: 18, scope: !1385)
!1405 = !DILocation(line: 177, column: 5, scope: !1385)
!1406 = distinct !{!1406, !1386, !1407, !259}
!1407 = !DILocation(line: 180, column: 5, scope: !1381)
!1408 = !DILocation(line: 181, column: 3, scope: !1382)
!1409 = !DILocation(line: 176, column: 24, scope: !1377)
!1410 = !DILocation(line: 176, column: 3, scope: !1377)
!1411 = distinct !{!1411, !1378, !1412, !259}
!1412 = !DILocation(line: 181, column: 3, scope: !1374)
!1413 = !DILocation(line: 182, column: 1, scope: !1368)
!1414 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1052, file: !1052, line: 192, type: !1053, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1415 = !DILocalVariable(name: "msg", arg: 1, scope: !1414, file: !1052, line: 192, type: !60)
!1416 = !DILocation(line: 0, scope: !1414)
!1417 = !DILocalVariable(name: "a", arg: 2, scope: !1414, file: !1052, line: 192, type: !1055)
!1418 = !DILocalVariable(name: "i", scope: !1414, file: !1052, line: 194, type: !42)
!1419 = !DILocation(line: 197, column: 7, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1414, file: !1052, line: 197, column: 3)
!1421 = !DILocation(line: 197, scope: !1420)
!1422 = !DILocation(line: 197, column: 12, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1420, file: !1052, line: 197, column: 3)
!1424 = !DILocation(line: 197, column: 3, scope: !1420)
!1425 = !DILocation(line: 198, column: 5, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1423, file: !1052, line: 197, column: 28)
!1427 = !DILocation(line: 198, column: 12, scope: !1426)
!1428 = !DILocalVariable(name: "j", scope: !1414, file: !1052, line: 194, type: !42)
!1429 = !DILocation(line: 199, column: 9, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1426, file: !1052, line: 199, column: 5)
!1431 = !DILocation(line: 199, scope: !1430)
!1432 = !DILocation(line: 199, column: 14, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1430, file: !1052, line: 199, column: 5)
!1434 = !DILocation(line: 199, column: 5, scope: !1430)
!1435 = !DILocation(line: 200, column: 15, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1433, file: !1052, line: 199, column: 22)
!1437 = !DILocation(line: 200, column: 23, scope: !1436)
!1438 = !DILocation(line: 200, column: 25, scope: !1436)
!1439 = !DILocation(line: 200, column: 12, scope: !1436)
!1440 = !DILocalVariable(name: "t", scope: !1414, file: !1052, line: 195, type: !40)
!1441 = !DILocation(line: 203, column: 9, scope: !1436)
!1442 = !DILocation(line: 204, column: 9, scope: !1436)
!1443 = !DILocation(line: 205, column: 9, scope: !1436)
!1444 = !DILocation(line: 206, column: 9, scope: !1436)
!1445 = !DILocation(line: 207, column: 9, scope: !1436)
!1446 = !DILocation(line: 208, column: 19, scope: !1436)
!1447 = !DILocation(line: 208, column: 7, scope: !1436)
!1448 = !DILocation(line: 208, column: 14, scope: !1436)
!1449 = !DILocation(line: 209, column: 5, scope: !1436)
!1450 = !DILocation(line: 199, column: 18, scope: !1433)
!1451 = !DILocation(line: 199, column: 5, scope: !1433)
!1452 = distinct !{!1452, !1434, !1453, !259}
!1453 = !DILocation(line: 209, column: 5, scope: !1430)
!1454 = !DILocation(line: 210, column: 3, scope: !1426)
!1455 = !DILocation(line: 197, column: 24, scope: !1423)
!1456 = !DILocation(line: 197, column: 3, scope: !1423)
!1457 = distinct !{!1457, !1424, !1458, !259}
!1458 = !DILocation(line: 210, column: 3, scope: !1420)
!1459 = !DILocation(line: 211, column: 1, scope: !1414)
!1460 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1052, file: !1052, line: 225, type: !1461, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{null, !1163, !64, !61}
!1463 = !DILocalVariable(name: "r", arg: 1, scope: !1460, file: !1052, line: 225, type: !1163)
!1464 = !DILocation(line: 0, scope: !1460)
!1465 = !DILocalVariable(name: "seed", arg: 2, scope: !1460, file: !1052, line: 225, type: !64)
!1466 = !DILocalVariable(name: "nonce", arg: 3, scope: !1460, file: !1052, line: 225, type: !61)
!1467 = !DILocalVariable(name: "buf", scope: !1460, file: !1052, line: 227, type: !1468)
!1468 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1469 = !DILocation(line: 227, column: 11, scope: !1460)
!1470 = !DILocation(line: 228, column: 3, scope: !1460)
!1471 = !DILocation(line: 229, column: 20, scope: !1460)
!1472 = !DILocation(line: 229, column: 3, scope: !1460)
!1473 = !DILocation(line: 230, column: 1, scope: !1460)
!1474 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1052, file: !1052, line: 244, type: !1461, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1475 = !DILocalVariable(name: "r", arg: 1, scope: !1474, file: !1052, line: 244, type: !1163)
!1476 = !DILocation(line: 0, scope: !1474)
!1477 = !DILocalVariable(name: "seed", arg: 2, scope: !1474, file: !1052, line: 244, type: !64)
!1478 = !DILocalVariable(name: "nonce", arg: 3, scope: !1474, file: !1052, line: 244, type: !61)
!1479 = !DILocalVariable(name: "buf", scope: !1474, file: !1052, line: 246, type: !1468)
!1480 = !DILocation(line: 246, column: 11, scope: !1474)
!1481 = !DILocation(line: 247, column: 3, scope: !1474)
!1482 = !DILocation(line: 248, column: 20, scope: !1474)
!1483 = !DILocation(line: 248, column: 3, scope: !1474)
!1484 = !DILocation(line: 249, column: 1, scope: !1474)
!1485 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1052, file: !1052, line: 261, type: !1486, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{null, !1163}
!1488 = !DILocalVariable(name: "r", arg: 1, scope: !1485, file: !1052, line: 261, type: !1163)
!1489 = !DILocation(line: 0, scope: !1485)
!1490 = !DILocation(line: 263, column: 10, scope: !1485)
!1491 = !DILocation(line: 263, column: 7, scope: !1485)
!1492 = !DILocation(line: 263, column: 3, scope: !1485)
!1493 = !DILocation(line: 264, column: 3, scope: !1485)
!1494 = !DILocation(line: 265, column: 1, scope: !1485)
!1495 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1052, file: !1052, line: 323, type: !1486, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1496 = !DILocalVariable(name: "r", arg: 1, scope: !1495, file: !1052, line: 323, type: !1163)
!1497 = !DILocation(line: 0, scope: !1495)
!1498 = !DILocalVariable(name: "i", scope: !1495, file: !1052, line: 325, type: !42)
!1499 = !DILocation(line: 326, column: 7, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1495, file: !1052, line: 326, column: 3)
!1501 = !DILocation(line: 326, scope: !1500)
!1502 = !DILocation(line: 326, column: 12, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1500, file: !1052, line: 326, column: 3)
!1504 = !DILocation(line: 326, column: 3, scope: !1500)
!1505 = !DILocation(line: 327, column: 38, scope: !1503)
!1506 = !DILocation(line: 327, column: 35, scope: !1503)
!1507 = !DILocation(line: 327, column: 20, scope: !1503)
!1508 = !DILocation(line: 327, column: 8, scope: !1503)
!1509 = !DILocation(line: 327, column: 5, scope: !1503)
!1510 = !DILocation(line: 327, column: 18, scope: !1503)
!1511 = !DILocation(line: 326, column: 22, scope: !1503)
!1512 = !DILocation(line: 326, column: 3, scope: !1503)
!1513 = distinct !{!1513, !1504, !1514, !259}
!1514 = !DILocation(line: 327, column: 47, scope: !1500)
!1515 = !DILocation(line: 328, column: 1, scope: !1495)
!1516 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1052, file: !1052, line: 276, type: !1486, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1517 = !DILocalVariable(name: "r", arg: 1, scope: !1516, file: !1052, line: 276, type: !1163)
!1518 = !DILocation(line: 0, scope: !1516)
!1519 = !DILocation(line: 278, column: 13, scope: !1516)
!1520 = !DILocation(line: 278, column: 10, scope: !1516)
!1521 = !DILocation(line: 278, column: 3, scope: !1516)
!1522 = !DILocation(line: 279, column: 1, scope: !1516)
!1523 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1052, file: !1052, line: 290, type: !1524, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{null, !1163, !1055, !1055}
!1526 = !DILocalVariable(name: "r", arg: 1, scope: !1523, file: !1052, line: 290, type: !1163)
!1527 = !DILocation(line: 0, scope: !1523)
!1528 = !DILocalVariable(name: "a", arg: 2, scope: !1523, file: !1052, line: 290, type: !1055)
!1529 = !DILocalVariable(name: "b", arg: 3, scope: !1523, file: !1052, line: 290, type: !1055)
!1530 = !DILocalVariable(name: "i", scope: !1523, file: !1052, line: 292, type: !42)
!1531 = !DILocation(line: 293, column: 7, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1523, file: !1052, line: 293, column: 3)
!1533 = !DILocation(line: 293, scope: !1532)
!1534 = !DILocation(line: 293, column: 12, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1532, file: !1052, line: 293, column: 3)
!1536 = !DILocation(line: 293, column: 3, scope: !1532)
!1537 = !DILocation(line: 294, column: 17, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1535, file: !1052, line: 293, column: 28)
!1539 = !DILocation(line: 294, column: 25, scope: !1538)
!1540 = !DILocation(line: 294, column: 14, scope: !1538)
!1541 = !DILocation(line: 294, column: 34, scope: !1538)
!1542 = !DILocation(line: 294, column: 42, scope: !1538)
!1543 = !DILocation(line: 294, column: 31, scope: !1538)
!1544 = !DILocation(line: 294, column: 51, scope: !1538)
!1545 = !DILocation(line: 294, column: 59, scope: !1538)
!1546 = !DILocation(line: 294, column: 48, scope: !1538)
!1547 = !DILocation(line: 294, column: 72, scope: !1538)
!1548 = !DILocation(line: 294, column: 64, scope: !1538)
!1549 = !DILocation(line: 294, column: 5, scope: !1538)
!1550 = !DILocation(line: 295, column: 17, scope: !1538)
!1551 = !DILocation(line: 295, column: 25, scope: !1538)
!1552 = !DILocation(line: 295, column: 27, scope: !1538)
!1553 = !DILocation(line: 295, column: 14, scope: !1538)
!1554 = !DILocation(line: 295, column: 36, scope: !1538)
!1555 = !DILocation(line: 295, column: 44, scope: !1538)
!1556 = !DILocation(line: 295, column: 46, scope: !1538)
!1557 = !DILocation(line: 295, column: 33, scope: !1538)
!1558 = !DILocation(line: 295, column: 55, scope: !1538)
!1559 = !DILocation(line: 295, column: 63, scope: !1538)
!1560 = !DILocation(line: 295, column: 65, scope: !1538)
!1561 = !DILocation(line: 295, column: 52, scope: !1538)
!1562 = !DILocation(line: 295, column: 79, scope: !1538)
!1563 = !DILocation(line: 295, column: 71, scope: !1538)
!1564 = !DILocation(line: 295, column: 70, scope: !1538)
!1565 = !DILocation(line: 295, column: 5, scope: !1538)
!1566 = !DILocation(line: 296, column: 3, scope: !1538)
!1567 = !DILocation(line: 293, column: 24, scope: !1535)
!1568 = !DILocation(line: 293, column: 3, scope: !1535)
!1569 = distinct !{!1569, !1536, !1570, !259}
!1570 = !DILocation(line: 296, column: 3, scope: !1532)
!1571 = !DILocation(line: 297, column: 1, scope: !1523)
!1572 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1052, file: !1052, line: 307, type: !1486, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1573 = !DILocalVariable(name: "r", arg: 1, scope: !1572, file: !1052, line: 307, type: !1163)
!1574 = !DILocation(line: 0, scope: !1572)
!1575 = !DILocalVariable(name: "f", scope: !1572, file: !1052, line: 310, type: !13)
!1576 = !DILocalVariable(name: "i", scope: !1572, file: !1052, line: 309, type: !42)
!1577 = !DILocation(line: 311, column: 7, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1572, file: !1052, line: 311, column: 3)
!1579 = !DILocation(line: 311, scope: !1578)
!1580 = !DILocation(line: 311, column: 12, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1578, file: !1052, line: 311, column: 3)
!1582 = !DILocation(line: 311, column: 3, scope: !1578)
!1583 = !DILocation(line: 312, column: 50, scope: !1581)
!1584 = !DILocation(line: 312, column: 47, scope: !1581)
!1585 = !DILocation(line: 312, column: 38, scope: !1581)
!1586 = !DILocation(line: 312, column: 59, scope: !1581)
!1587 = !DILocation(line: 312, column: 20, scope: !1581)
!1588 = !DILocation(line: 312, column: 8, scope: !1581)
!1589 = !DILocation(line: 312, column: 5, scope: !1581)
!1590 = !DILocation(line: 312, column: 18, scope: !1581)
!1591 = !DILocation(line: 311, column: 22, scope: !1581)
!1592 = !DILocation(line: 311, column: 3, scope: !1581)
!1593 = distinct !{!1593, !1582, !1594, !259}
!1594 = !DILocation(line: 312, column: 61, scope: !1578)
!1595 = !DILocation(line: 313, column: 1, scope: !1572)
!1596 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1052, file: !1052, line: 339, type: !1524, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1597 = !DILocalVariable(name: "r", arg: 1, scope: !1596, file: !1052, line: 339, type: !1163)
!1598 = !DILocation(line: 0, scope: !1596)
!1599 = !DILocalVariable(name: "a", arg: 2, scope: !1596, file: !1052, line: 339, type: !1055)
!1600 = !DILocalVariable(name: "b", arg: 3, scope: !1596, file: !1052, line: 339, type: !1055)
!1601 = !DILocalVariable(name: "i", scope: !1596, file: !1052, line: 341, type: !42)
!1602 = !DILocation(line: 342, column: 7, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1596, file: !1052, line: 342, column: 3)
!1604 = !DILocation(line: 342, scope: !1603)
!1605 = !DILocation(line: 342, column: 12, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1603, file: !1052, line: 342, column: 3)
!1607 = !DILocation(line: 342, column: 3, scope: !1603)
!1608 = !DILocation(line: 343, column: 23, scope: !1606)
!1609 = !DILocation(line: 343, column: 20, scope: !1606)
!1610 = !DILocation(line: 343, column: 38, scope: !1606)
!1611 = !DILocation(line: 343, column: 35, scope: !1606)
!1612 = !DILocation(line: 343, column: 33, scope: !1606)
!1613 = !DILocation(line: 343, column: 8, scope: !1606)
!1614 = !DILocation(line: 343, column: 5, scope: !1606)
!1615 = !DILocation(line: 343, column: 18, scope: !1606)
!1616 = !DILocation(line: 342, column: 22, scope: !1606)
!1617 = !DILocation(line: 342, column: 3, scope: !1606)
!1618 = distinct !{!1618, !1607, !1619, !259}
!1619 = !DILocation(line: 343, column: 46, scope: !1603)
!1620 = !DILocation(line: 344, column: 1, scope: !1596)
!1621 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1052, file: !1052, line: 355, type: !1524, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1622 = !DILocalVariable(name: "r", arg: 1, scope: !1621, file: !1052, line: 355, type: !1163)
!1623 = !DILocation(line: 0, scope: !1621)
!1624 = !DILocalVariable(name: "a", arg: 2, scope: !1621, file: !1052, line: 355, type: !1055)
!1625 = !DILocalVariable(name: "b", arg: 3, scope: !1621, file: !1052, line: 355, type: !1055)
!1626 = !DILocalVariable(name: "i", scope: !1621, file: !1052, line: 357, type: !42)
!1627 = !DILocation(line: 358, column: 7, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1621, file: !1052, line: 358, column: 3)
!1629 = !DILocation(line: 358, scope: !1628)
!1630 = !DILocation(line: 358, column: 12, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1628, file: !1052, line: 358, column: 3)
!1632 = !DILocation(line: 358, column: 3, scope: !1628)
!1633 = !DILocation(line: 359, column: 23, scope: !1631)
!1634 = !DILocation(line: 359, column: 20, scope: !1631)
!1635 = !DILocation(line: 359, column: 38, scope: !1631)
!1636 = !DILocation(line: 359, column: 35, scope: !1631)
!1637 = !DILocation(line: 359, column: 33, scope: !1631)
!1638 = !DILocation(line: 359, column: 8, scope: !1631)
!1639 = !DILocation(line: 359, column: 5, scope: !1631)
!1640 = !DILocation(line: 359, column: 18, scope: !1631)
!1641 = !DILocation(line: 358, column: 22, scope: !1631)
!1642 = !DILocation(line: 358, column: 3, scope: !1631)
!1643 = distinct !{!1643, !1632, !1644, !259}
!1644 = !DILocation(line: 359, column: 46, scope: !1628)
!1645 = !DILocation(line: 360, column: 1, scope: !1621)
!1646 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !11, file: !11, line: 80, type: !1647, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1647 = !DISubroutineType(types: !1648)
!1648 = !{null, !274}
!1649 = !DILocalVariable(name: "r", arg: 1, scope: !1646, file: !11, line: 80, type: !274)
!1650 = !DILocation(line: 0, scope: !1646)
!1651 = !DILocalVariable(name: "k", scope: !1646, file: !11, line: 81, type: !42)
!1652 = !DILocalVariable(name: "len", scope: !1646, file: !11, line: 81, type: !42)
!1653 = !DILocation(line: 85, column: 7, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1646, file: !11, line: 85, column: 3)
!1655 = !DILocation(line: 85, scope: !1654)
!1656 = !DILocation(line: 84, column: 5, scope: !1646)
!1657 = !DILocation(line: 85, column: 22, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1654, file: !11, line: 85, column: 3)
!1659 = !DILocation(line: 85, column: 3, scope: !1654)
!1660 = !DILocalVariable(name: "start", scope: !1646, file: !11, line: 81, type: !42)
!1661 = !DILocation(line: 86, column: 9, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1663, file: !11, line: 86, column: 5)
!1663 = distinct !DILexicalBlock(scope: !1658, file: !11, line: 85, column: 39)
!1664 = !DILocation(line: 86, scope: !1662)
!1665 = !DILocation(line: 86, column: 26, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1662, file: !11, line: 86, column: 5)
!1667 = !DILocation(line: 86, column: 5, scope: !1662)
!1668 = !DILocation(line: 87, column: 21, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1666, file: !11, line: 86, column: 50)
!1670 = !DILocation(line: 87, column: 14, scope: !1669)
!1671 = !DILocalVariable(name: "zeta", scope: !1646, file: !11, line: 82, type: !14)
!1672 = !DILocalVariable(name: "j", scope: !1646, file: !11, line: 81, type: !42)
!1673 = !DILocation(line: 88, column: 11, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1669, file: !11, line: 88, column: 7)
!1675 = !DILocation(line: 88, scope: !1674)
!1676 = !DILocation(line: 88, column: 32, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1674, file: !11, line: 88, column: 7)
!1678 = !DILocation(line: 88, column: 24, scope: !1677)
!1679 = !DILocation(line: 88, column: 7, scope: !1674)
!1680 = !DILocation(line: 89, column: 29, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1677, file: !11, line: 88, column: 44)
!1682 = !DILocation(line: 89, column: 25, scope: !1681)
!1683 = !DILocation(line: 89, column: 13, scope: !1681)
!1684 = !DILocalVariable(name: "t", scope: !1646, file: !11, line: 82, type: !14)
!1685 = !DILocation(line: 90, column: 22, scope: !1681)
!1686 = !DILocation(line: 90, column: 29, scope: !1681)
!1687 = !DILocation(line: 90, column: 27, scope: !1681)
!1688 = !DILocation(line: 90, column: 13, scope: !1681)
!1689 = !DILocation(line: 90, column: 9, scope: !1681)
!1690 = !DILocation(line: 90, column: 20, scope: !1681)
!1691 = !DILocation(line: 91, column: 16, scope: !1681)
!1692 = !DILocation(line: 91, column: 23, scope: !1681)
!1693 = !DILocation(line: 91, column: 21, scope: !1681)
!1694 = !DILocation(line: 91, column: 9, scope: !1681)
!1695 = !DILocation(line: 91, column: 14, scope: !1681)
!1696 = !DILocation(line: 92, column: 7, scope: !1681)
!1697 = !DILocation(line: 88, column: 40, scope: !1677)
!1698 = !DILocation(line: 88, column: 7, scope: !1677)
!1699 = distinct !{!1699, !1679, !1700, !259}
!1700 = !DILocation(line: 92, column: 7, scope: !1674)
!1701 = !DILocation(line: 93, column: 5, scope: !1669)
!1702 = !DILocation(line: 86, column: 43, scope: !1666)
!1703 = !DILocation(line: 86, column: 5, scope: !1666)
!1704 = distinct !{!1704, !1667, !1705, !259}
!1705 = !DILocation(line: 93, column: 5, scope: !1662)
!1706 = !DILocation(line: 94, column: 3, scope: !1663)
!1707 = !DILocation(line: 85, column: 32, scope: !1658)
!1708 = !DILocation(line: 85, column: 3, scope: !1658)
!1709 = distinct !{!1709, !1659, !1710, !259}
!1710 = !DILocation(line: 94, column: 3, scope: !1654)
!1711 = !DILocation(line: 95, column: 1, scope: !1646)
!1712 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1713, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{!14, !14, !14}
!1715 = !DILocalVariable(name: "a", arg: 1, scope: !1712, file: !11, line: 68, type: !14)
!1716 = !DILocation(line: 0, scope: !1712)
!1717 = !DILocalVariable(name: "b", arg: 2, scope: !1712, file: !11, line: 68, type: !14)
!1718 = !DILocation(line: 69, column: 28, scope: !1712)
!1719 = !DILocation(line: 69, column: 39, scope: !1712)
!1720 = !DILocation(line: 69, column: 38, scope: !1712)
!1721 = !DILocation(line: 69, column: 10, scope: !1712)
!1722 = !DILocation(line: 69, column: 3, scope: !1712)
!1723 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !11, file: !11, line: 106, type: !1647, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1724 = !DILocalVariable(name: "r", arg: 1, scope: !1723, file: !11, line: 106, type: !274)
!1725 = !DILocation(line: 0, scope: !1723)
!1726 = !DILocalVariable(name: "f", scope: !1723, file: !11, line: 109, type: !13)
!1727 = !DILocalVariable(name: "k", scope: !1723, file: !11, line: 107, type: !42)
!1728 = !DILocalVariable(name: "len", scope: !1723, file: !11, line: 107, type: !42)
!1729 = !DILocation(line: 112, column: 7, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1723, file: !11, line: 112, column: 3)
!1731 = !DILocation(line: 112, scope: !1730)
!1732 = !DILocation(line: 111, column: 5, scope: !1723)
!1733 = !DILocation(line: 112, column: 20, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1730, file: !11, line: 112, column: 3)
!1735 = !DILocation(line: 112, column: 3, scope: !1730)
!1736 = !DILocalVariable(name: "start", scope: !1723, file: !11, line: 107, type: !42)
!1737 = !DILocation(line: 113, column: 9, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1739, file: !11, line: 113, column: 5)
!1739 = distinct !DILexicalBlock(scope: !1734, file: !11, line: 112, column: 39)
!1740 = !DILocation(line: 113, scope: !1738)
!1741 = !DILocation(line: 113, column: 26, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1738, file: !11, line: 113, column: 5)
!1743 = !DILocation(line: 113, column: 5, scope: !1738)
!1744 = !DILocation(line: 114, column: 21, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1742, file: !11, line: 113, column: 50)
!1746 = !DILocation(line: 114, column: 14, scope: !1745)
!1747 = !DILocalVariable(name: "zeta", scope: !1723, file: !11, line: 108, type: !14)
!1748 = !DILocalVariable(name: "j", scope: !1723, file: !11, line: 107, type: !42)
!1749 = !DILocation(line: 115, column: 11, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1745, file: !11, line: 115, column: 7)
!1751 = !DILocation(line: 115, scope: !1750)
!1752 = !DILocation(line: 115, column: 32, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1750, file: !11, line: 115, column: 7)
!1754 = !DILocation(line: 115, column: 24, scope: !1753)
!1755 = !DILocation(line: 115, column: 7, scope: !1750)
!1756 = !DILocation(line: 116, column: 13, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1753, file: !11, line: 115, column: 44)
!1758 = !DILocalVariable(name: "t", scope: !1723, file: !11, line: 108, type: !14)
!1759 = !DILocation(line: 117, column: 31, scope: !1757)
!1760 = !DILocation(line: 117, column: 39, scope: !1757)
!1761 = !DILocation(line: 117, column: 35, scope: !1757)
!1762 = !DILocation(line: 117, column: 33, scope: !1757)
!1763 = !DILocation(line: 117, column: 16, scope: !1757)
!1764 = !DILocation(line: 117, column: 9, scope: !1757)
!1765 = !DILocation(line: 117, column: 14, scope: !1757)
!1766 = !DILocation(line: 118, column: 26, scope: !1757)
!1767 = !DILocation(line: 118, column: 22, scope: !1757)
!1768 = !DILocation(line: 118, column: 35, scope: !1757)
!1769 = !DILocation(line: 118, column: 33, scope: !1757)
!1770 = !DILocation(line: 118, column: 13, scope: !1757)
!1771 = !DILocation(line: 118, column: 9, scope: !1757)
!1772 = !DILocation(line: 118, column: 20, scope: !1757)
!1773 = !DILocation(line: 119, column: 38, scope: !1757)
!1774 = !DILocation(line: 119, column: 34, scope: !1757)
!1775 = !DILocation(line: 119, column: 22, scope: !1757)
!1776 = !DILocation(line: 119, column: 13, scope: !1757)
!1777 = !DILocation(line: 119, column: 9, scope: !1757)
!1778 = !DILocation(line: 119, column: 20, scope: !1757)
!1779 = !DILocation(line: 120, column: 7, scope: !1757)
!1780 = !DILocation(line: 115, column: 40, scope: !1753)
!1781 = !DILocation(line: 115, column: 7, scope: !1753)
!1782 = distinct !{!1782, !1755, !1783, !259}
!1783 = !DILocation(line: 120, column: 7, scope: !1750)
!1784 = !DILocation(line: 121, column: 5, scope: !1745)
!1785 = !DILocation(line: 113, column: 43, scope: !1742)
!1786 = !DILocation(line: 113, column: 5, scope: !1742)
!1787 = distinct !{!1787, !1743, !1788, !259}
!1788 = !DILocation(line: 121, column: 5, scope: !1738)
!1789 = !DILocation(line: 122, column: 3, scope: !1739)
!1790 = !DILocation(line: 112, column: 32, scope: !1734)
!1791 = !DILocation(line: 112, column: 3, scope: !1734)
!1792 = distinct !{!1792, !1735, !1793, !259}
!1793 = !DILocation(line: 122, column: 3, scope: !1730)
!1794 = !DILocation(line: 124, column: 7, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1723, file: !11, line: 124, column: 3)
!1796 = !DILocation(line: 124, scope: !1795)
!1797 = !DILocation(line: 124, column: 16, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1795, file: !11, line: 124, column: 3)
!1799 = !DILocation(line: 124, column: 3, scope: !1795)
!1800 = !DILocation(line: 125, column: 18, scope: !1798)
!1801 = !DILocation(line: 125, column: 12, scope: !1798)
!1802 = !DILocation(line: 125, column: 5, scope: !1798)
!1803 = !DILocation(line: 125, column: 10, scope: !1798)
!1804 = !DILocation(line: 124, column: 24, scope: !1798)
!1805 = !DILocation(line: 124, column: 3, scope: !1798)
!1806 = distinct !{!1806, !1799, !1807, !259}
!1807 = !DILocation(line: 125, column: 25, scope: !1795)
!1808 = !DILocation(line: 126, column: 1, scope: !1723)
!1809 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !11, file: !11, line: 139, type: !1810, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1810 = !DISubroutineType(types: !1811)
!1811 = !{null, !274, !1812, !1812, !14}
!1812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1813 = !DILocalVariable(name: "r", arg: 1, scope: !1809, file: !11, line: 139, type: !274)
!1814 = !DILocation(line: 0, scope: !1809)
!1815 = !DILocalVariable(name: "a", arg: 2, scope: !1809, file: !11, line: 139, type: !1812)
!1816 = !DILocalVariable(name: "b", arg: 3, scope: !1809, file: !11, line: 139, type: !1812)
!1817 = !DILocalVariable(name: "zeta", arg: 4, scope: !1809, file: !11, line: 139, type: !14)
!1818 = !DILocation(line: 141, column: 17, scope: !1809)
!1819 = !DILocation(line: 141, column: 23, scope: !1809)
!1820 = !DILocation(line: 141, column: 11, scope: !1809)
!1821 = !DILocation(line: 141, column: 3, scope: !1809)
!1822 = !DILocation(line: 141, column: 9, scope: !1809)
!1823 = !DILocation(line: 142, column: 17, scope: !1809)
!1824 = !DILocation(line: 142, column: 11, scope: !1809)
!1825 = !DILocation(line: 142, column: 3, scope: !1809)
!1826 = !DILocation(line: 142, column: 9, scope: !1809)
!1827 = !DILocation(line: 143, column: 17, scope: !1809)
!1828 = !DILocation(line: 143, column: 23, scope: !1809)
!1829 = !DILocation(line: 143, column: 11, scope: !1809)
!1830 = !DILocation(line: 143, column: 3, scope: !1809)
!1831 = !DILocation(line: 143, column: 8, scope: !1809)
!1832 = !DILocation(line: 144, column: 17, scope: !1809)
!1833 = !DILocation(line: 144, column: 23, scope: !1809)
!1834 = !DILocation(line: 144, column: 11, scope: !1809)
!1835 = !DILocation(line: 144, column: 3, scope: !1809)
!1836 = !DILocation(line: 144, column: 9, scope: !1809)
!1837 = !DILocation(line: 145, column: 17, scope: !1809)
!1838 = !DILocation(line: 145, column: 23, scope: !1809)
!1839 = !DILocation(line: 145, column: 11, scope: !1809)
!1840 = !DILocation(line: 145, column: 3, scope: !1809)
!1841 = !DILocation(line: 145, column: 8, scope: !1809)
!1842 = !DILocation(line: 146, column: 1, scope: !1809)
!1843 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1844, file: !1844, line: 110, type: !1845, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1844 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1845 = !DISubroutineType(types: !1846)
!1846 = !{null, !1847, !64}
!1847 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1848, size: 32)
!1848 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !1849)
!1849 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !1850)
!1850 = !{!1851}
!1851 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1849, file: !185, line: 12, baseType: !189, size: 4096)
!1852 = !DILocalVariable(name: "r", arg: 1, scope: !1843, file: !1844, line: 110, type: !1847)
!1853 = !DILocation(line: 0, scope: !1843)
!1854 = !DILocalVariable(name: "buf", arg: 2, scope: !1843, file: !1844, line: 110, type: !64)
!1855 = !DILocation(line: 113, column: 3, scope: !1843)
!1856 = !DILocation(line: 119, column: 1, scope: !1843)
!1857 = distinct !DISubprogram(name: "cbd2", scope: !1844, file: !1844, line: 58, type: !1845, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1858 = !DILocalVariable(name: "r", arg: 1, scope: !1857, file: !1844, line: 58, type: !1847)
!1859 = !DILocation(line: 0, scope: !1857)
!1860 = !DILocalVariable(name: "buf", arg: 2, scope: !1857, file: !1844, line: 58, type: !64)
!1861 = !DILocalVariable(name: "i", scope: !1857, file: !1844, line: 60, type: !42)
!1862 = !DILocation(line: 64, column: 7, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1857, file: !1844, line: 64, column: 3)
!1864 = !DILocation(line: 64, scope: !1863)
!1865 = !DILocation(line: 64, column: 12, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1863, file: !1844, line: 64, column: 3)
!1867 = !DILocation(line: 64, column: 3, scope: !1863)
!1868 = !DILocation(line: 65, column: 35, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1866, file: !1844, line: 64, column: 28)
!1870 = !DILocation(line: 65, column: 33, scope: !1869)
!1871 = !DILocation(line: 65, column: 10, scope: !1869)
!1872 = !DILocalVariable(name: "t", scope: !1857, file: !1844, line: 61, type: !40)
!1873 = !DILocation(line: 66, column: 12, scope: !1869)
!1874 = !DILocalVariable(name: "d", scope: !1857, file: !1844, line: 61, type: !40)
!1875 = !DILocation(line: 67, column: 12, scope: !1869)
!1876 = !DILocation(line: 67, column: 17, scope: !1869)
!1877 = !DILocation(line: 67, column: 7, scope: !1869)
!1878 = !DILocalVariable(name: "j", scope: !1857, file: !1844, line: 60, type: !42)
!1879 = !DILocation(line: 69, column: 9, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1869, file: !1844, line: 69, column: 5)
!1881 = !DILocation(line: 69, scope: !1880)
!1882 = !DILocation(line: 69, column: 14, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1880, file: !1844, line: 69, column: 5)
!1884 = !DILocation(line: 69, column: 5, scope: !1880)
!1885 = !DILocation(line: 70, column: 19, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1883, file: !1844, line: 69, column: 22)
!1887 = !DILocation(line: 70, column: 21, scope: !1886)
!1888 = !DILocation(line: 70, column: 14, scope: !1886)
!1889 = !DILocation(line: 70, column: 26, scope: !1886)
!1890 = !DILocation(line: 70, column: 11, scope: !1886)
!1891 = !DILocalVariable(name: "a", scope: !1857, file: !1844, line: 62, type: !14)
!1892 = !DILocation(line: 71, column: 19, scope: !1886)
!1893 = !DILocation(line: 71, column: 21, scope: !1886)
!1894 = !DILocation(line: 71, column: 14, scope: !1886)
!1895 = !DILocation(line: 71, column: 26, scope: !1886)
!1896 = !DILocation(line: 71, column: 11, scope: !1886)
!1897 = !DILocalVariable(name: "b", scope: !1857, file: !1844, line: 62, type: !14)
!1898 = !DILocation(line: 72, column: 26, scope: !1886)
!1899 = !DILocation(line: 72, column: 30, scope: !1886)
!1900 = !DILocation(line: 72, column: 28, scope: !1886)
!1901 = !DILocation(line: 72, column: 10, scope: !1886)
!1902 = !DILocation(line: 72, column: 18, scope: !1886)
!1903 = !DILocation(line: 72, column: 20, scope: !1886)
!1904 = !DILocation(line: 72, column: 7, scope: !1886)
!1905 = !DILocation(line: 72, column: 24, scope: !1886)
!1906 = !DILocation(line: 73, column: 5, scope: !1886)
!1907 = !DILocation(line: 69, column: 18, scope: !1883)
!1908 = !DILocation(line: 69, column: 5, scope: !1883)
!1909 = distinct !{!1909, !1884, !1910, !259}
!1910 = !DILocation(line: 73, column: 5, scope: !1880)
!1911 = !DILocation(line: 74, column: 3, scope: !1869)
!1912 = !DILocation(line: 64, column: 24, scope: !1866)
!1913 = !DILocation(line: 64, column: 3, scope: !1866)
!1914 = distinct !{!1914, !1867, !1915, !259}
!1915 = !DILocation(line: 74, column: 3, scope: !1863)
!1916 = !DILocation(line: 75, column: 1, scope: !1857)
!1917 = distinct !DISubprogram(name: "load32_littleendian", scope: !1844, file: !1844, line: 15, type: !1918, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1918 = !DISubroutineType(types: !1919)
!1919 = !{!40, !64}
!1920 = !DILocalVariable(name: "x", arg: 1, scope: !1917, file: !1844, line: 15, type: !64)
!1921 = !DILocation(line: 0, scope: !1917)
!1922 = !DILocation(line: 18, column: 18, scope: !1917)
!1923 = !DILocation(line: 18, column: 8, scope: !1917)
!1924 = !DILocalVariable(name: "r", scope: !1917, file: !1844, line: 17, type: !40)
!1925 = !DILocation(line: 19, column: 18, scope: !1917)
!1926 = !DILocation(line: 19, column: 8, scope: !1917)
!1927 = !DILocation(line: 19, column: 23, scope: !1917)
!1928 = !DILocation(line: 19, column: 5, scope: !1917)
!1929 = !DILocation(line: 20, column: 18, scope: !1917)
!1930 = !DILocation(line: 20, column: 8, scope: !1917)
!1931 = !DILocation(line: 20, column: 23, scope: !1917)
!1932 = !DILocation(line: 20, column: 5, scope: !1917)
!1933 = !DILocation(line: 21, column: 18, scope: !1917)
!1934 = !DILocation(line: 21, column: 8, scope: !1917)
!1935 = !DILocation(line: 21, column: 23, scope: !1917)
!1936 = !DILocation(line: 21, column: 5, scope: !1917)
!1937 = !DILocation(line: 22, column: 3, scope: !1917)
!1938 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1844, file: !1844, line: 121, type: !1845, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1939 = !DILocalVariable(name: "r", arg: 1, scope: !1938, file: !1844, line: 121, type: !1847)
!1940 = !DILocation(line: 0, scope: !1938)
!1941 = !DILocalVariable(name: "buf", arg: 2, scope: !1938, file: !1844, line: 121, type: !64)
!1942 = !DILocation(line: 124, column: 3, scope: !1938)
!1943 = !DILocation(line: 128, column: 1, scope: !1938)
!1944 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1945, file: !1945, line: 16, type: !1946, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1945 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1946 = !DISubroutineType(types: !48)
!1947 = !DILocalVariable(name: "a", arg: 1, scope: !1944, file: !1945, line: 16, type: !5)
!1948 = !DILocation(line: 0, scope: !1944)
!1949 = !DILocation(line: 20, column: 7, scope: !1944)
!1950 = !DILocation(line: 20, column: 17, scope: !1944)
!1951 = !DILocalVariable(name: "t", scope: !1944, file: !1945, line: 18, type: !14)
!1952 = !DILocation(line: 21, column: 12, scope: !1944)
!1953 = !DILocation(line: 21, column: 22, scope: !1944)
!1954 = !DILocation(line: 21, column: 10, scope: !1944)
!1955 = !DILocation(line: 21, column: 32, scope: !1944)
!1956 = !DILocation(line: 21, column: 7, scope: !1944)
!1957 = !DILocation(line: 22, column: 3, scope: !1944)
!1958 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1945, file: !1945, line: 35, type: !1959, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1959 = !DISubroutineType(types: !1960)
!1960 = !{!14, !14}
!1961 = !DILocalVariable(name: "a", arg: 1, scope: !1958, file: !1945, line: 35, type: !14)
!1962 = !DILocation(line: 0, scope: !1958)
!1963 = !DILocalVariable(name: "v", scope: !1958, file: !1945, line: 37, type: !13)
!1964 = !DILocation(line: 39, column: 20, scope: !1958)
!1965 = !DILocation(line: 39, column: 19, scope: !1958)
!1966 = !DILocation(line: 39, column: 22, scope: !1958)
!1967 = !DILocation(line: 39, column: 33, scope: !1958)
!1968 = !DILocation(line: 39, column: 8, scope: !1958)
!1969 = !DILocalVariable(name: "t", scope: !1958, file: !1945, line: 36, type: !14)
!1970 = !DILocation(line: 40, column: 5, scope: !1958)
!1971 = !DILocation(line: 41, column: 10, scope: !1958)
!1972 = !DILocation(line: 41, column: 14, scope: !1958)
!1973 = !DILocation(line: 41, column: 12, scope: !1958)
!1974 = !DILocation(line: 41, column: 3, scope: !1958)
!1975 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1976, file: !1976, line: 16, type: !1977, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1976 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1977 = !DISubroutineType(types: !1978)
!1978 = !{!9, !64, !64, !1979}
!1979 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1980, line: 214, baseType: !42)
!1980 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1981 = !DILocalVariable(name: "a", arg: 1, scope: !1975, file: !1976, line: 16, type: !64)
!1982 = !DILocation(line: 0, scope: !1975)
!1983 = !DILocalVariable(name: "b", arg: 2, scope: !1975, file: !1976, line: 16, type: !64)
!1984 = !DILocalVariable(name: "len", arg: 3, scope: !1975, file: !1976, line: 16, type: !1979)
!1985 = !DILocalVariable(name: "r", scope: !1975, file: !1976, line: 19, type: !61)
!1986 = !DILocalVariable(name: "i", scope: !1975, file: !1976, line: 18, type: !1979)
!1987 = !DILocation(line: 21, column: 7, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1975, file: !1976, line: 21, column: 3)
!1989 = !DILocation(line: 21, scope: !1988)
!1990 = !DILocation(line: 21, column: 12, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1988, file: !1976, line: 21, column: 3)
!1992 = !DILocation(line: 21, column: 3, scope: !1988)
!1993 = !DILocation(line: 22, column: 10, scope: !1991)
!1994 = !DILocation(line: 22, column: 17, scope: !1991)
!1995 = !DILocation(line: 22, column: 15, scope: !1991)
!1996 = !DILocation(line: 22, column: 7, scope: !1991)
!1997 = !DILocation(line: 22, column: 5, scope: !1991)
!1998 = !DILocation(line: 21, column: 18, scope: !1991)
!1999 = !DILocation(line: 21, column: 3, scope: !1991)
!2000 = distinct !{!2000, !1992, !2001, !259}
!2001 = !DILocation(line: 22, column: 20, scope: !1988)
!2002 = !DILocation(line: 24, column: 12, scope: !1975)
!2003 = !DILocation(line: 24, column: 11, scope: !1975)
!2004 = !DILocation(line: 24, column: 25, scope: !1975)
!2005 = !DILocation(line: 24, column: 10, scope: !1975)
!2006 = !DILocation(line: 24, column: 3, scope: !1975)
!2007 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1976, file: !1976, line: 40, type: !2008, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!2008 = !DISubroutineType(types: !2009)
!2009 = !{null, !60, !64, !1979, !61}
!2010 = !DILocalVariable(name: "r", arg: 1, scope: !2007, file: !1976, line: 40, type: !60)
!2011 = !DILocation(line: 0, scope: !2007)
!2012 = !DILocalVariable(name: "x", arg: 2, scope: !2007, file: !1976, line: 40, type: !64)
!2013 = !DILocalVariable(name: "len", arg: 3, scope: !2007, file: !1976, line: 40, type: !1979)
!2014 = !DILocalVariable(name: "b", arg: 4, scope: !2007, file: !1976, line: 40, type: !61)
!2015 = !DILocation(line: 51, column: 3, scope: !2007)
!2016 = !{i64 1722}
!2017 = !DILocation(line: 54, column: 8, scope: !2007)
!2018 = !DILocation(line: 54, column: 7, scope: !2007)
!2019 = !DILocalVariable(name: "i", scope: !2007, file: !1976, line: 42, type: !1979)
!2020 = !DILocation(line: 55, column: 7, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2007, file: !1976, line: 55, column: 3)
!2022 = !DILocation(line: 55, scope: !2021)
!2023 = !DILocation(line: 55, column: 12, scope: !2024)
!2024 = distinct !DILexicalBlock(scope: !2021, file: !1976, line: 55, column: 3)
!2025 = !DILocation(line: 55, column: 3, scope: !2021)
!2026 = !DILocation(line: 56, column: 13, scope: !2024)
!2027 = !DILocation(line: 56, column: 18, scope: !2024)
!2028 = !DILocation(line: 56, column: 25, scope: !2024)
!2029 = !DILocation(line: 56, column: 23, scope: !2024)
!2030 = !DILocation(line: 56, column: 15, scope: !2024)
!2031 = !DILocation(line: 56, column: 5, scope: !2024)
!2032 = !DILocation(line: 56, column: 10, scope: !2024)
!2033 = !DILocation(line: 55, column: 18, scope: !2024)
!2034 = !DILocation(line: 55, column: 3, scope: !2024)
!2035 = distinct !{!2035, !2025, !2036, !259}
!2036 = !DILocation(line: 56, column: 29, scope: !2021)
!2037 = !DILocation(line: 57, column: 1, scope: !2007)
!2038 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1976, file: !1976, line: 71, type: !2039, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!2039 = !DISubroutineType(types: !2040)
!2040 = !{null, !274, !14, !35}
!2041 = !DILocalVariable(name: "r", arg: 1, scope: !2038, file: !1976, line: 71, type: !274)
!2042 = !DILocation(line: 0, scope: !2038)
!2043 = !DILocalVariable(name: "v", arg: 2, scope: !2038, file: !1976, line: 71, type: !14)
!2044 = !DILocalVariable(name: "b", arg: 3, scope: !2038, file: !1976, line: 71, type: !35)
!2045 = !DILocation(line: 73, column: 8, scope: !2038)
!2046 = !DILocation(line: 73, column: 7, scope: !2038)
!2047 = !DILocation(line: 74, column: 9, scope: !2038)
!2048 = !DILocation(line: 74, column: 15, scope: !2038)
!2049 = !DILocation(line: 74, column: 14, scope: !2038)
!2050 = !DILocation(line: 74, column: 21, scope: !2038)
!2051 = !DILocation(line: 74, column: 19, scope: !2038)
!2052 = !DILocation(line: 74, column: 11, scope: !2038)
!2053 = !DILocation(line: 74, column: 6, scope: !2038)
!2054 = !DILocation(line: 75, column: 1, scope: !2038)
!2055 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !2056, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2056 = !DISubroutineType(types: !2057)
!2057 = !{null, !2058}
!2058 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2059, size: 32)
!2059 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !2060)
!2060 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !2061)
!2061 = !{!2062, !2063}
!2062 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2060, file: !207, line: 15, baseType: !211, size: 1600)
!2063 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2060, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!2064 = !DILocalVariable(name: "state", arg: 1, scope: !2055, file: !27, line: 523, type: !2058)
!2065 = !DILocation(line: 0, scope: !2055)
!2066 = !DILocation(line: 525, column: 22, scope: !2055)
!2067 = !DILocation(line: 525, column: 15, scope: !2055)
!2068 = !DILocation(line: 525, column: 3, scope: !2055)
!2069 = !DILocation(line: 526, column: 10, scope: !2055)
!2070 = !DILocation(line: 526, column: 14, scope: !2055)
!2071 = !DILocation(line: 527, column: 1, scope: !2055)
!2072 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !2073, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2073 = !DISubroutineType(types: !2074)
!2074 = !{null, !2075}
!2075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!2076 = !DILocalVariable(name: "s", arg: 1, scope: !2072, file: !27, line: 353, type: !2075)
!2077 = !DILocation(line: 0, scope: !2072)
!2078 = !DILocalVariable(name: "i", scope: !2072, file: !27, line: 355, type: !42)
!2079 = !DILocation(line: 356, column: 7, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2072, file: !27, line: 356, column: 3)
!2081 = !DILocation(line: 356, scope: !2080)
!2082 = !DILocation(line: 356, column: 12, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2080, file: !27, line: 356, column: 3)
!2084 = !DILocation(line: 356, column: 3, scope: !2080)
!2085 = !DILocation(line: 357, column: 5, scope: !2083)
!2086 = !DILocation(line: 357, column: 10, scope: !2083)
!2087 = !DILocation(line: 356, column: 17, scope: !2083)
!2088 = !DILocation(line: 356, column: 3, scope: !2083)
!2089 = distinct !{!2089, !2084, !2090, !259}
!2090 = !DILocation(line: 357, column: 12, scope: !2080)
!2091 = !DILocation(line: 358, column: 1, scope: !2072)
!2092 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !2093, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2093 = !DISubroutineType(types: !2094)
!2094 = !{null, !2058, !64, !1979}
!2095 = !DILocalVariable(name: "state", arg: 1, scope: !2092, file: !27, line: 538, type: !2058)
!2096 = !DILocation(line: 0, scope: !2092)
!2097 = !DILocalVariable(name: "in", arg: 2, scope: !2092, file: !27, line: 538, type: !64)
!2098 = !DILocalVariable(name: "inlen", arg: 3, scope: !2092, file: !27, line: 538, type: !1979)
!2099 = !DILocation(line: 540, column: 37, scope: !2092)
!2100 = !DILocation(line: 540, column: 30, scope: !2092)
!2101 = !DILocation(line: 540, column: 47, scope: !2092)
!2102 = !DILocation(line: 540, column: 16, scope: !2092)
!2103 = !DILocation(line: 540, column: 10, scope: !2092)
!2104 = !DILocation(line: 540, column: 14, scope: !2092)
!2105 = !DILocation(line: 541, column: 1, scope: !2092)
!2106 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !2107, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2107 = !DISubroutineType(types: !2108)
!2108 = !{!42, !2075, !42, !42, !64, !1979}
!2109 = !DILocalVariable(name: "s", arg: 1, scope: !2106, file: !27, line: 373, type: !2075)
!2110 = !DILocation(line: 0, scope: !2106)
!2111 = !DILocalVariable(name: "pos", arg: 2, scope: !2106, file: !27, line: 374, type: !42)
!2112 = !DILocalVariable(name: "r", arg: 3, scope: !2106, file: !27, line: 375, type: !42)
!2113 = !DILocalVariable(name: "in", arg: 4, scope: !2106, file: !27, line: 376, type: !64)
!2114 = !DILocalVariable(name: "inlen", arg: 5, scope: !2106, file: !27, line: 377, type: !1979)
!2115 = !DILocation(line: 381, column: 3, scope: !2106)
!2116 = !DILocation(line: 381, column: 12, scope: !2106)
!2117 = !DILocation(line: 381, column: 19, scope: !2106)
!2118 = !DILocalVariable(name: "i", scope: !2106, file: !27, line: 379, type: !42)
!2119 = !DILocation(line: 382, column: 9, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2121, file: !27, line: 382, column: 5)
!2121 = distinct !DILexicalBlock(scope: !2106, file: !27, line: 381, column: 25)
!2122 = !DILocation(line: 382, scope: !2120)
!2123 = !DILocation(line: 382, column: 16, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2120, file: !27, line: 382, column: 5)
!2125 = !DILocation(line: 382, column: 5, scope: !2120)
!2126 = !DILocation(line: 383, column: 30, scope: !2124)
!2127 = !DILocation(line: 383, column: 27, scope: !2124)
!2128 = !DILocation(line: 383, column: 17, scope: !2124)
!2129 = !DILocation(line: 383, column: 40, scope: !2124)
!2130 = !DILocation(line: 383, column: 37, scope: !2124)
!2131 = !DILocation(line: 383, column: 33, scope: !2124)
!2132 = !DILocation(line: 383, column: 10, scope: !2124)
!2133 = !DILocation(line: 383, column: 7, scope: !2124)
!2134 = !DILocation(line: 383, column: 14, scope: !2124)
!2135 = !DILocation(line: 382, column: 20, scope: !2124)
!2136 = !DILocation(line: 382, column: 5, scope: !2124)
!2137 = distinct !{!2137, !2125, !2138, !259}
!2138 = !DILocation(line: 383, column: 42, scope: !2120)
!2139 = !DILocation(line: 384, column: 15, scope: !2121)
!2140 = !DILocation(line: 384, column: 11, scope: !2121)
!2141 = !DILocation(line: 385, column: 5, scope: !2121)
!2142 = distinct !{!2142, !2115, !2143, !259}
!2143 = !DILocation(line: 387, column: 3, scope: !2106)
!2144 = !DILocation(line: 389, column: 7, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2106, file: !27, line: 389, column: 3)
!2146 = !DILocation(line: 389, scope: !2145)
!2147 = !DILocation(line: 389, column: 18, scope: !2148)
!2148 = distinct !DILexicalBlock(scope: !2145, file: !27, line: 389, column: 3)
!2149 = !DILocation(line: 389, column: 14, scope: !2148)
!2150 = !DILocation(line: 389, column: 3, scope: !2145)
!2151 = !DILocation(line: 390, column: 28, scope: !2148)
!2152 = !DILocation(line: 390, column: 25, scope: !2148)
!2153 = !DILocation(line: 390, column: 15, scope: !2148)
!2154 = !DILocation(line: 390, column: 38, scope: !2148)
!2155 = !DILocation(line: 390, column: 35, scope: !2148)
!2156 = !DILocation(line: 390, column: 31, scope: !2148)
!2157 = !DILocation(line: 390, column: 8, scope: !2148)
!2158 = !DILocation(line: 390, column: 5, scope: !2148)
!2159 = !DILocation(line: 390, column: 12, scope: !2148)
!2160 = !DILocation(line: 389, column: 26, scope: !2148)
!2161 = !DILocation(line: 389, column: 3, scope: !2148)
!2162 = distinct !{!2162, !2150, !2163, !259}
!2163 = !DILocation(line: 390, column: 40, scope: !2145)
!2164 = !DILocation(line: 392, column: 3, scope: !2106)
!2165 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !2073, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2166 = !DILocalVariable(name: "state", arg: 1, scope: !2165, file: !27, line: 82, type: !2075)
!2167 = !DILocation(line: 0, scope: !2165)
!2168 = !DILocation(line: 100, column: 15, scope: !2165)
!2169 = !DILocalVariable(name: "Aba", scope: !2165, file: !27, line: 86, type: !23)
!2170 = !DILocation(line: 101, column: 15, scope: !2165)
!2171 = !DILocalVariable(name: "Abe", scope: !2165, file: !27, line: 86, type: !23)
!2172 = !DILocation(line: 102, column: 15, scope: !2165)
!2173 = !DILocalVariable(name: "Abi", scope: !2165, file: !27, line: 86, type: !23)
!2174 = !DILocation(line: 103, column: 15, scope: !2165)
!2175 = !DILocalVariable(name: "Abo", scope: !2165, file: !27, line: 86, type: !23)
!2176 = !DILocation(line: 104, column: 15, scope: !2165)
!2177 = !DILocalVariable(name: "Abu", scope: !2165, file: !27, line: 86, type: !23)
!2178 = !DILocation(line: 105, column: 15, scope: !2165)
!2179 = !DILocalVariable(name: "Aga", scope: !2165, file: !27, line: 87, type: !23)
!2180 = !DILocation(line: 106, column: 15, scope: !2165)
!2181 = !DILocalVariable(name: "Age", scope: !2165, file: !27, line: 87, type: !23)
!2182 = !DILocation(line: 107, column: 15, scope: !2165)
!2183 = !DILocalVariable(name: "Agi", scope: !2165, file: !27, line: 87, type: !23)
!2184 = !DILocation(line: 108, column: 15, scope: !2165)
!2185 = !DILocalVariable(name: "Ago", scope: !2165, file: !27, line: 87, type: !23)
!2186 = !DILocation(line: 109, column: 15, scope: !2165)
!2187 = !DILocalVariable(name: "Agu", scope: !2165, file: !27, line: 87, type: !23)
!2188 = !DILocation(line: 110, column: 15, scope: !2165)
!2189 = !DILocalVariable(name: "Aka", scope: !2165, file: !27, line: 88, type: !23)
!2190 = !DILocation(line: 111, column: 15, scope: !2165)
!2191 = !DILocalVariable(name: "Ake", scope: !2165, file: !27, line: 88, type: !23)
!2192 = !DILocation(line: 112, column: 15, scope: !2165)
!2193 = !DILocalVariable(name: "Aki", scope: !2165, file: !27, line: 88, type: !23)
!2194 = !DILocation(line: 113, column: 15, scope: !2165)
!2195 = !DILocalVariable(name: "Ako", scope: !2165, file: !27, line: 88, type: !23)
!2196 = !DILocation(line: 114, column: 15, scope: !2165)
!2197 = !DILocalVariable(name: "Aku", scope: !2165, file: !27, line: 88, type: !23)
!2198 = !DILocation(line: 115, column: 15, scope: !2165)
!2199 = !DILocalVariable(name: "Ama", scope: !2165, file: !27, line: 89, type: !23)
!2200 = !DILocation(line: 116, column: 15, scope: !2165)
!2201 = !DILocalVariable(name: "Ame", scope: !2165, file: !27, line: 89, type: !23)
!2202 = !DILocation(line: 117, column: 15, scope: !2165)
!2203 = !DILocalVariable(name: "Ami", scope: !2165, file: !27, line: 89, type: !23)
!2204 = !DILocation(line: 118, column: 15, scope: !2165)
!2205 = !DILocalVariable(name: "Amo", scope: !2165, file: !27, line: 89, type: !23)
!2206 = !DILocation(line: 119, column: 15, scope: !2165)
!2207 = !DILocalVariable(name: "Amu", scope: !2165, file: !27, line: 89, type: !23)
!2208 = !DILocation(line: 120, column: 15, scope: !2165)
!2209 = !DILocalVariable(name: "Asa", scope: !2165, file: !27, line: 90, type: !23)
!2210 = !DILocation(line: 121, column: 15, scope: !2165)
!2211 = !DILocalVariable(name: "Ase", scope: !2165, file: !27, line: 90, type: !23)
!2212 = !DILocation(line: 122, column: 15, scope: !2165)
!2213 = !DILocalVariable(name: "Asi", scope: !2165, file: !27, line: 90, type: !23)
!2214 = !DILocation(line: 123, column: 15, scope: !2165)
!2215 = !DILocalVariable(name: "Aso", scope: !2165, file: !27, line: 90, type: !23)
!2216 = !DILocation(line: 124, column: 15, scope: !2165)
!2217 = !DILocalVariable(name: "Asu", scope: !2165, file: !27, line: 90, type: !23)
!2218 = !DILocalVariable(name: "round", scope: !2165, file: !27, line: 84, type: !9)
!2219 = !DILocation(line: 126, column: 13, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2165, file: !27, line: 126, column: 9)
!2221 = !DILocation(line: 126, scope: !2220)
!2222 = !DILocation(line: 126, column: 30, scope: !2223)
!2223 = distinct !DILexicalBlock(scope: !2220, file: !27, line: 126, column: 9)
!2224 = !DILocation(line: 126, column: 9, scope: !2220)
!2225 = !DILocation(line: 128, column: 22, scope: !2226)
!2226 = distinct !DILexicalBlock(scope: !2223, file: !27, line: 126, column: 53)
!2227 = !DILocation(line: 128, column: 26, scope: !2226)
!2228 = !DILocation(line: 128, column: 30, scope: !2226)
!2229 = !DILocation(line: 128, column: 34, scope: !2226)
!2230 = !DILocalVariable(name: "BCa", scope: !2165, file: !27, line: 91, type: !23)
!2231 = !DILocation(line: 129, column: 22, scope: !2226)
!2232 = !DILocation(line: 129, column: 26, scope: !2226)
!2233 = !DILocation(line: 129, column: 30, scope: !2226)
!2234 = !DILocation(line: 129, column: 34, scope: !2226)
!2235 = !DILocalVariable(name: "BCe", scope: !2165, file: !27, line: 91, type: !23)
!2236 = !DILocation(line: 130, column: 22, scope: !2226)
!2237 = !DILocation(line: 130, column: 26, scope: !2226)
!2238 = !DILocation(line: 130, column: 30, scope: !2226)
!2239 = !DILocation(line: 130, column: 34, scope: !2226)
!2240 = !DILocalVariable(name: "BCi", scope: !2165, file: !27, line: 91, type: !23)
!2241 = !DILocation(line: 131, column: 22, scope: !2226)
!2242 = !DILocation(line: 131, column: 26, scope: !2226)
!2243 = !DILocation(line: 131, column: 30, scope: !2226)
!2244 = !DILocation(line: 131, column: 34, scope: !2226)
!2245 = !DILocalVariable(name: "BCo", scope: !2165, file: !27, line: 91, type: !23)
!2246 = !DILocation(line: 132, column: 22, scope: !2226)
!2247 = !DILocation(line: 132, column: 26, scope: !2226)
!2248 = !DILocation(line: 132, column: 30, scope: !2226)
!2249 = !DILocation(line: 132, column: 34, scope: !2226)
!2250 = !DILocalVariable(name: "BCu", scope: !2165, file: !27, line: 91, type: !23)
!2251 = !DILocation(line: 135, column: 22, scope: !2226)
!2252 = !DILocation(line: 135, column: 21, scope: !2226)
!2253 = !DILocalVariable(name: "Da", scope: !2165, file: !27, line: 92, type: !23)
!2254 = !DILocation(line: 136, column: 22, scope: !2226)
!2255 = !DILocation(line: 136, column: 21, scope: !2226)
!2256 = !DILocalVariable(name: "De", scope: !2165, file: !27, line: 92, type: !23)
!2257 = !DILocation(line: 137, column: 22, scope: !2226)
!2258 = !DILocation(line: 137, column: 21, scope: !2226)
!2259 = !DILocalVariable(name: "Di", scope: !2165, file: !27, line: 92, type: !23)
!2260 = !DILocation(line: 138, column: 22, scope: !2226)
!2261 = !DILocation(line: 138, column: 21, scope: !2226)
!2262 = !DILocalVariable(name: "Do", scope: !2165, file: !27, line: 92, type: !23)
!2263 = !DILocation(line: 139, column: 22, scope: !2226)
!2264 = !DILocation(line: 139, column: 21, scope: !2226)
!2265 = !DILocalVariable(name: "Du", scope: !2165, file: !27, line: 92, type: !23)
!2266 = !DILocation(line: 141, column: 17, scope: !2226)
!2267 = !DILocation(line: 143, column: 17, scope: !2226)
!2268 = !DILocation(line: 144, column: 19, scope: !2226)
!2269 = !DILocation(line: 145, column: 17, scope: !2226)
!2270 = !DILocation(line: 146, column: 19, scope: !2226)
!2271 = !DILocation(line: 147, column: 17, scope: !2226)
!2272 = !DILocation(line: 148, column: 19, scope: !2226)
!2273 = !DILocation(line: 149, column: 17, scope: !2226)
!2274 = !DILocation(line: 150, column: 19, scope: !2226)
!2275 = !DILocation(line: 151, column: 28, scope: !2226)
!2276 = !DILocation(line: 151, column: 33, scope: !2226)
!2277 = !DILocation(line: 151, column: 25, scope: !2226)
!2278 = !DILocalVariable(name: "Eba", scope: !2165, file: !27, line: 93, type: !23)
!2279 = !DILocation(line: 152, column: 30, scope: !2226)
!2280 = !DILocation(line: 152, column: 17, scope: !2226)
!2281 = !DILocation(line: 153, column: 28, scope: !2226)
!2282 = !DILocation(line: 153, column: 33, scope: !2226)
!2283 = !DILocation(line: 153, column: 25, scope: !2226)
!2284 = !DILocalVariable(name: "Ebe", scope: !2165, file: !27, line: 93, type: !23)
!2285 = !DILocation(line: 154, column: 28, scope: !2226)
!2286 = !DILocation(line: 154, column: 33, scope: !2226)
!2287 = !DILocation(line: 154, column: 25, scope: !2226)
!2288 = !DILocalVariable(name: "Ebi", scope: !2165, file: !27, line: 93, type: !23)
!2289 = !DILocation(line: 155, column: 28, scope: !2226)
!2290 = !DILocation(line: 155, column: 33, scope: !2226)
!2291 = !DILocation(line: 155, column: 25, scope: !2226)
!2292 = !DILocalVariable(name: "Ebo", scope: !2165, file: !27, line: 93, type: !23)
!2293 = !DILocation(line: 156, column: 28, scope: !2226)
!2294 = !DILocation(line: 156, column: 33, scope: !2226)
!2295 = !DILocation(line: 156, column: 25, scope: !2226)
!2296 = !DILocalVariable(name: "Ebu", scope: !2165, file: !27, line: 93, type: !23)
!2297 = !DILocation(line: 158, column: 17, scope: !2226)
!2298 = !DILocation(line: 159, column: 19, scope: !2226)
!2299 = !DILocation(line: 160, column: 17, scope: !2226)
!2300 = !DILocation(line: 161, column: 19, scope: !2226)
!2301 = !DILocation(line: 162, column: 17, scope: !2226)
!2302 = !DILocation(line: 163, column: 19, scope: !2226)
!2303 = !DILocation(line: 164, column: 17, scope: !2226)
!2304 = !DILocation(line: 165, column: 19, scope: !2226)
!2305 = !DILocation(line: 166, column: 17, scope: !2226)
!2306 = !DILocation(line: 167, column: 19, scope: !2226)
!2307 = !DILocation(line: 168, column: 28, scope: !2226)
!2308 = !DILocation(line: 168, column: 33, scope: !2226)
!2309 = !DILocation(line: 168, column: 25, scope: !2226)
!2310 = !DILocalVariable(name: "Ega", scope: !2165, file: !27, line: 94, type: !23)
!2311 = !DILocation(line: 169, column: 28, scope: !2226)
!2312 = !DILocation(line: 169, column: 33, scope: !2226)
!2313 = !DILocation(line: 169, column: 25, scope: !2226)
!2314 = !DILocalVariable(name: "Ege", scope: !2165, file: !27, line: 94, type: !23)
!2315 = !DILocation(line: 170, column: 28, scope: !2226)
!2316 = !DILocation(line: 170, column: 33, scope: !2226)
!2317 = !DILocation(line: 170, column: 25, scope: !2226)
!2318 = !DILocalVariable(name: "Egi", scope: !2165, file: !27, line: 94, type: !23)
!2319 = !DILocation(line: 171, column: 28, scope: !2226)
!2320 = !DILocation(line: 171, column: 33, scope: !2226)
!2321 = !DILocation(line: 171, column: 25, scope: !2226)
!2322 = !DILocalVariable(name: "Ego", scope: !2165, file: !27, line: 94, type: !23)
!2323 = !DILocation(line: 172, column: 28, scope: !2226)
!2324 = !DILocation(line: 172, column: 33, scope: !2226)
!2325 = !DILocation(line: 172, column: 25, scope: !2226)
!2326 = !DILocalVariable(name: "Egu", scope: !2165, file: !27, line: 94, type: !23)
!2327 = !DILocation(line: 174, column: 17, scope: !2226)
!2328 = !DILocation(line: 175, column: 19, scope: !2226)
!2329 = !DILocation(line: 176, column: 17, scope: !2226)
!2330 = !DILocation(line: 177, column: 19, scope: !2226)
!2331 = !DILocation(line: 178, column: 17, scope: !2226)
!2332 = !DILocation(line: 179, column: 19, scope: !2226)
!2333 = !DILocation(line: 180, column: 17, scope: !2226)
!2334 = !DILocation(line: 181, column: 19, scope: !2226)
!2335 = !DILocation(line: 182, column: 17, scope: !2226)
!2336 = !DILocation(line: 183, column: 19, scope: !2226)
!2337 = !DILocation(line: 184, column: 28, scope: !2226)
!2338 = !DILocation(line: 184, column: 33, scope: !2226)
!2339 = !DILocation(line: 184, column: 25, scope: !2226)
!2340 = !DILocalVariable(name: "Eka", scope: !2165, file: !27, line: 95, type: !23)
!2341 = !DILocation(line: 185, column: 28, scope: !2226)
!2342 = !DILocation(line: 185, column: 33, scope: !2226)
!2343 = !DILocation(line: 185, column: 25, scope: !2226)
!2344 = !DILocalVariable(name: "Eke", scope: !2165, file: !27, line: 95, type: !23)
!2345 = !DILocation(line: 186, column: 28, scope: !2226)
!2346 = !DILocation(line: 186, column: 33, scope: !2226)
!2347 = !DILocation(line: 186, column: 25, scope: !2226)
!2348 = !DILocalVariable(name: "Eki", scope: !2165, file: !27, line: 95, type: !23)
!2349 = !DILocation(line: 187, column: 28, scope: !2226)
!2350 = !DILocation(line: 187, column: 33, scope: !2226)
!2351 = !DILocation(line: 187, column: 25, scope: !2226)
!2352 = !DILocalVariable(name: "Eko", scope: !2165, file: !27, line: 95, type: !23)
!2353 = !DILocation(line: 188, column: 28, scope: !2226)
!2354 = !DILocation(line: 188, column: 33, scope: !2226)
!2355 = !DILocation(line: 188, column: 25, scope: !2226)
!2356 = !DILocalVariable(name: "Eku", scope: !2165, file: !27, line: 95, type: !23)
!2357 = !DILocation(line: 190, column: 17, scope: !2226)
!2358 = !DILocation(line: 191, column: 19, scope: !2226)
!2359 = !DILocation(line: 192, column: 17, scope: !2226)
!2360 = !DILocation(line: 193, column: 19, scope: !2226)
!2361 = !DILocation(line: 194, column: 17, scope: !2226)
!2362 = !DILocation(line: 195, column: 19, scope: !2226)
!2363 = !DILocation(line: 196, column: 17, scope: !2226)
!2364 = !DILocation(line: 197, column: 19, scope: !2226)
!2365 = !DILocation(line: 198, column: 17, scope: !2226)
!2366 = !DILocation(line: 199, column: 19, scope: !2226)
!2367 = !DILocation(line: 200, column: 28, scope: !2226)
!2368 = !DILocation(line: 200, column: 33, scope: !2226)
!2369 = !DILocation(line: 200, column: 25, scope: !2226)
!2370 = !DILocalVariable(name: "Ema", scope: !2165, file: !27, line: 96, type: !23)
!2371 = !DILocation(line: 201, column: 28, scope: !2226)
!2372 = !DILocation(line: 201, column: 33, scope: !2226)
!2373 = !DILocation(line: 201, column: 25, scope: !2226)
!2374 = !DILocalVariable(name: "Eme", scope: !2165, file: !27, line: 96, type: !23)
!2375 = !DILocation(line: 202, column: 28, scope: !2226)
!2376 = !DILocation(line: 202, column: 33, scope: !2226)
!2377 = !DILocation(line: 202, column: 25, scope: !2226)
!2378 = !DILocalVariable(name: "Emi", scope: !2165, file: !27, line: 96, type: !23)
!2379 = !DILocation(line: 203, column: 28, scope: !2226)
!2380 = !DILocation(line: 203, column: 33, scope: !2226)
!2381 = !DILocation(line: 203, column: 25, scope: !2226)
!2382 = !DILocalVariable(name: "Emo", scope: !2165, file: !27, line: 96, type: !23)
!2383 = !DILocation(line: 204, column: 28, scope: !2226)
!2384 = !DILocation(line: 204, column: 33, scope: !2226)
!2385 = !DILocation(line: 204, column: 25, scope: !2226)
!2386 = !DILocalVariable(name: "Emu", scope: !2165, file: !27, line: 96, type: !23)
!2387 = !DILocation(line: 206, column: 17, scope: !2226)
!2388 = !DILocation(line: 207, column: 19, scope: !2226)
!2389 = !DILocation(line: 208, column: 17, scope: !2226)
!2390 = !DILocation(line: 209, column: 19, scope: !2226)
!2391 = !DILocation(line: 210, column: 17, scope: !2226)
!2392 = !DILocation(line: 211, column: 19, scope: !2226)
!2393 = !DILocation(line: 212, column: 17, scope: !2226)
!2394 = !DILocation(line: 213, column: 19, scope: !2226)
!2395 = !DILocation(line: 214, column: 17, scope: !2226)
!2396 = !DILocation(line: 215, column: 19, scope: !2226)
!2397 = !DILocation(line: 216, column: 28, scope: !2226)
!2398 = !DILocation(line: 216, column: 33, scope: !2226)
!2399 = !DILocation(line: 216, column: 25, scope: !2226)
!2400 = !DILocalVariable(name: "Esa", scope: !2165, file: !27, line: 97, type: !23)
!2401 = !DILocation(line: 217, column: 28, scope: !2226)
!2402 = !DILocation(line: 217, column: 33, scope: !2226)
!2403 = !DILocation(line: 217, column: 25, scope: !2226)
!2404 = !DILocalVariable(name: "Ese", scope: !2165, file: !27, line: 97, type: !23)
!2405 = !DILocation(line: 218, column: 28, scope: !2226)
!2406 = !DILocation(line: 218, column: 33, scope: !2226)
!2407 = !DILocation(line: 218, column: 25, scope: !2226)
!2408 = !DILocalVariable(name: "Esi", scope: !2165, file: !27, line: 97, type: !23)
!2409 = !DILocation(line: 219, column: 28, scope: !2226)
!2410 = !DILocation(line: 219, column: 33, scope: !2226)
!2411 = !DILocation(line: 219, column: 25, scope: !2226)
!2412 = !DILocalVariable(name: "Eso", scope: !2165, file: !27, line: 97, type: !23)
!2413 = !DILocation(line: 220, column: 28, scope: !2226)
!2414 = !DILocation(line: 220, column: 33, scope: !2226)
!2415 = !DILocation(line: 220, column: 25, scope: !2226)
!2416 = !DILocalVariable(name: "Esu", scope: !2165, file: !27, line: 97, type: !23)
!2417 = !DILocation(line: 223, column: 22, scope: !2226)
!2418 = !DILocation(line: 223, column: 26, scope: !2226)
!2419 = !DILocation(line: 223, column: 30, scope: !2226)
!2420 = !DILocation(line: 223, column: 34, scope: !2226)
!2421 = !DILocation(line: 224, column: 22, scope: !2226)
!2422 = !DILocation(line: 224, column: 26, scope: !2226)
!2423 = !DILocation(line: 224, column: 30, scope: !2226)
!2424 = !DILocation(line: 224, column: 34, scope: !2226)
!2425 = !DILocation(line: 225, column: 22, scope: !2226)
!2426 = !DILocation(line: 225, column: 26, scope: !2226)
!2427 = !DILocation(line: 225, column: 30, scope: !2226)
!2428 = !DILocation(line: 225, column: 34, scope: !2226)
!2429 = !DILocation(line: 226, column: 22, scope: !2226)
!2430 = !DILocation(line: 226, column: 26, scope: !2226)
!2431 = !DILocation(line: 226, column: 30, scope: !2226)
!2432 = !DILocation(line: 226, column: 34, scope: !2226)
!2433 = !DILocation(line: 227, column: 22, scope: !2226)
!2434 = !DILocation(line: 227, column: 26, scope: !2226)
!2435 = !DILocation(line: 227, column: 30, scope: !2226)
!2436 = !DILocation(line: 227, column: 34, scope: !2226)
!2437 = !DILocation(line: 230, column: 22, scope: !2226)
!2438 = !DILocation(line: 230, column: 21, scope: !2226)
!2439 = !DILocation(line: 231, column: 22, scope: !2226)
!2440 = !DILocation(line: 231, column: 21, scope: !2226)
!2441 = !DILocation(line: 232, column: 22, scope: !2226)
!2442 = !DILocation(line: 232, column: 21, scope: !2226)
!2443 = !DILocation(line: 233, column: 22, scope: !2226)
!2444 = !DILocation(line: 233, column: 21, scope: !2226)
!2445 = !DILocation(line: 234, column: 22, scope: !2226)
!2446 = !DILocation(line: 234, column: 21, scope: !2226)
!2447 = !DILocation(line: 236, column: 17, scope: !2226)
!2448 = !DILocation(line: 238, column: 17, scope: !2226)
!2449 = !DILocation(line: 239, column: 19, scope: !2226)
!2450 = !DILocation(line: 240, column: 17, scope: !2226)
!2451 = !DILocation(line: 241, column: 19, scope: !2226)
!2452 = !DILocation(line: 242, column: 17, scope: !2226)
!2453 = !DILocation(line: 243, column: 19, scope: !2226)
!2454 = !DILocation(line: 244, column: 17, scope: !2226)
!2455 = !DILocation(line: 245, column: 19, scope: !2226)
!2456 = !DILocation(line: 246, column: 28, scope: !2226)
!2457 = !DILocation(line: 246, column: 33, scope: !2226)
!2458 = !DILocation(line: 246, column: 25, scope: !2226)
!2459 = !DILocation(line: 247, column: 58, scope: !2226)
!2460 = !DILocation(line: 247, column: 30, scope: !2226)
!2461 = !DILocation(line: 247, column: 17, scope: !2226)
!2462 = !DILocation(line: 248, column: 28, scope: !2226)
!2463 = !DILocation(line: 248, column: 33, scope: !2226)
!2464 = !DILocation(line: 248, column: 25, scope: !2226)
!2465 = !DILocation(line: 249, column: 28, scope: !2226)
!2466 = !DILocation(line: 249, column: 33, scope: !2226)
!2467 = !DILocation(line: 249, column: 25, scope: !2226)
!2468 = !DILocation(line: 250, column: 28, scope: !2226)
!2469 = !DILocation(line: 250, column: 33, scope: !2226)
!2470 = !DILocation(line: 250, column: 25, scope: !2226)
!2471 = !DILocation(line: 251, column: 28, scope: !2226)
!2472 = !DILocation(line: 251, column: 33, scope: !2226)
!2473 = !DILocation(line: 251, column: 25, scope: !2226)
!2474 = !DILocation(line: 253, column: 17, scope: !2226)
!2475 = !DILocation(line: 254, column: 19, scope: !2226)
!2476 = !DILocation(line: 255, column: 17, scope: !2226)
!2477 = !DILocation(line: 256, column: 19, scope: !2226)
!2478 = !DILocation(line: 257, column: 17, scope: !2226)
!2479 = !DILocation(line: 258, column: 19, scope: !2226)
!2480 = !DILocation(line: 259, column: 17, scope: !2226)
!2481 = !DILocation(line: 260, column: 19, scope: !2226)
!2482 = !DILocation(line: 261, column: 17, scope: !2226)
!2483 = !DILocation(line: 262, column: 19, scope: !2226)
!2484 = !DILocation(line: 263, column: 28, scope: !2226)
!2485 = !DILocation(line: 263, column: 33, scope: !2226)
!2486 = !DILocation(line: 263, column: 25, scope: !2226)
!2487 = !DILocation(line: 264, column: 28, scope: !2226)
!2488 = !DILocation(line: 264, column: 33, scope: !2226)
!2489 = !DILocation(line: 264, column: 25, scope: !2226)
!2490 = !DILocation(line: 265, column: 28, scope: !2226)
!2491 = !DILocation(line: 265, column: 33, scope: !2226)
!2492 = !DILocation(line: 265, column: 25, scope: !2226)
!2493 = !DILocation(line: 266, column: 28, scope: !2226)
!2494 = !DILocation(line: 266, column: 33, scope: !2226)
!2495 = !DILocation(line: 266, column: 25, scope: !2226)
!2496 = !DILocation(line: 267, column: 28, scope: !2226)
!2497 = !DILocation(line: 267, column: 33, scope: !2226)
!2498 = !DILocation(line: 267, column: 25, scope: !2226)
!2499 = !DILocation(line: 269, column: 17, scope: !2226)
!2500 = !DILocation(line: 270, column: 19, scope: !2226)
!2501 = !DILocation(line: 271, column: 17, scope: !2226)
!2502 = !DILocation(line: 272, column: 19, scope: !2226)
!2503 = !DILocation(line: 273, column: 17, scope: !2226)
!2504 = !DILocation(line: 274, column: 19, scope: !2226)
!2505 = !DILocation(line: 275, column: 17, scope: !2226)
!2506 = !DILocation(line: 276, column: 19, scope: !2226)
!2507 = !DILocation(line: 277, column: 17, scope: !2226)
!2508 = !DILocation(line: 278, column: 19, scope: !2226)
!2509 = !DILocation(line: 279, column: 28, scope: !2226)
!2510 = !DILocation(line: 279, column: 33, scope: !2226)
!2511 = !DILocation(line: 279, column: 25, scope: !2226)
!2512 = !DILocation(line: 280, column: 28, scope: !2226)
!2513 = !DILocation(line: 280, column: 33, scope: !2226)
!2514 = !DILocation(line: 280, column: 25, scope: !2226)
!2515 = !DILocation(line: 281, column: 28, scope: !2226)
!2516 = !DILocation(line: 281, column: 33, scope: !2226)
!2517 = !DILocation(line: 281, column: 25, scope: !2226)
!2518 = !DILocation(line: 282, column: 28, scope: !2226)
!2519 = !DILocation(line: 282, column: 33, scope: !2226)
!2520 = !DILocation(line: 282, column: 25, scope: !2226)
!2521 = !DILocation(line: 283, column: 28, scope: !2226)
!2522 = !DILocation(line: 283, column: 33, scope: !2226)
!2523 = !DILocation(line: 283, column: 25, scope: !2226)
!2524 = !DILocation(line: 285, column: 17, scope: !2226)
!2525 = !DILocation(line: 286, column: 19, scope: !2226)
!2526 = !DILocation(line: 287, column: 17, scope: !2226)
!2527 = !DILocation(line: 288, column: 19, scope: !2226)
!2528 = !DILocation(line: 289, column: 17, scope: !2226)
!2529 = !DILocation(line: 290, column: 19, scope: !2226)
!2530 = !DILocation(line: 291, column: 17, scope: !2226)
!2531 = !DILocation(line: 292, column: 19, scope: !2226)
!2532 = !DILocation(line: 293, column: 17, scope: !2226)
!2533 = !DILocation(line: 294, column: 19, scope: !2226)
!2534 = !DILocation(line: 295, column: 28, scope: !2226)
!2535 = !DILocation(line: 295, column: 33, scope: !2226)
!2536 = !DILocation(line: 295, column: 25, scope: !2226)
!2537 = !DILocation(line: 296, column: 28, scope: !2226)
!2538 = !DILocation(line: 296, column: 33, scope: !2226)
!2539 = !DILocation(line: 296, column: 25, scope: !2226)
!2540 = !DILocation(line: 297, column: 28, scope: !2226)
!2541 = !DILocation(line: 297, column: 33, scope: !2226)
!2542 = !DILocation(line: 297, column: 25, scope: !2226)
!2543 = !DILocation(line: 298, column: 28, scope: !2226)
!2544 = !DILocation(line: 298, column: 33, scope: !2226)
!2545 = !DILocation(line: 298, column: 25, scope: !2226)
!2546 = !DILocation(line: 299, column: 28, scope: !2226)
!2547 = !DILocation(line: 299, column: 33, scope: !2226)
!2548 = !DILocation(line: 299, column: 25, scope: !2226)
!2549 = !DILocation(line: 301, column: 17, scope: !2226)
!2550 = !DILocation(line: 302, column: 19, scope: !2226)
!2551 = !DILocation(line: 303, column: 17, scope: !2226)
!2552 = !DILocation(line: 304, column: 19, scope: !2226)
!2553 = !DILocation(line: 305, column: 17, scope: !2226)
!2554 = !DILocation(line: 306, column: 19, scope: !2226)
!2555 = !DILocation(line: 307, column: 17, scope: !2226)
!2556 = !DILocation(line: 308, column: 19, scope: !2226)
!2557 = !DILocation(line: 309, column: 17, scope: !2226)
!2558 = !DILocation(line: 310, column: 19, scope: !2226)
!2559 = !DILocation(line: 311, column: 28, scope: !2226)
!2560 = !DILocation(line: 311, column: 33, scope: !2226)
!2561 = !DILocation(line: 311, column: 25, scope: !2226)
!2562 = !DILocation(line: 312, column: 28, scope: !2226)
!2563 = !DILocation(line: 312, column: 33, scope: !2226)
!2564 = !DILocation(line: 312, column: 25, scope: !2226)
!2565 = !DILocation(line: 313, column: 28, scope: !2226)
!2566 = !DILocation(line: 313, column: 33, scope: !2226)
!2567 = !DILocation(line: 313, column: 25, scope: !2226)
!2568 = !DILocation(line: 314, column: 28, scope: !2226)
!2569 = !DILocation(line: 314, column: 33, scope: !2226)
!2570 = !DILocation(line: 314, column: 25, scope: !2226)
!2571 = !DILocation(line: 315, column: 28, scope: !2226)
!2572 = !DILocation(line: 315, column: 33, scope: !2226)
!2573 = !DILocation(line: 315, column: 25, scope: !2226)
!2574 = !DILocation(line: 316, column: 9, scope: !2226)
!2575 = !DILocation(line: 126, column: 47, scope: !2223)
!2576 = !DILocation(line: 126, column: 9, scope: !2223)
!2577 = distinct !{!2577, !2224, !2578, !259}
!2578 = !DILocation(line: 316, column: 9, scope: !2220)
!2579 = !DILocation(line: 319, column: 9, scope: !2165)
!2580 = !DILocation(line: 319, column: 19, scope: !2165)
!2581 = !DILocation(line: 320, column: 9, scope: !2165)
!2582 = !DILocation(line: 320, column: 19, scope: !2165)
!2583 = !DILocation(line: 321, column: 9, scope: !2165)
!2584 = !DILocation(line: 321, column: 19, scope: !2165)
!2585 = !DILocation(line: 322, column: 9, scope: !2165)
!2586 = !DILocation(line: 322, column: 19, scope: !2165)
!2587 = !DILocation(line: 323, column: 9, scope: !2165)
!2588 = !DILocation(line: 323, column: 19, scope: !2165)
!2589 = !DILocation(line: 324, column: 9, scope: !2165)
!2590 = !DILocation(line: 324, column: 19, scope: !2165)
!2591 = !DILocation(line: 325, column: 9, scope: !2165)
!2592 = !DILocation(line: 325, column: 19, scope: !2165)
!2593 = !DILocation(line: 326, column: 9, scope: !2165)
!2594 = !DILocation(line: 326, column: 19, scope: !2165)
!2595 = !DILocation(line: 327, column: 9, scope: !2165)
!2596 = !DILocation(line: 327, column: 19, scope: !2165)
!2597 = !DILocation(line: 328, column: 9, scope: !2165)
!2598 = !DILocation(line: 328, column: 19, scope: !2165)
!2599 = !DILocation(line: 329, column: 9, scope: !2165)
!2600 = !DILocation(line: 329, column: 19, scope: !2165)
!2601 = !DILocation(line: 330, column: 9, scope: !2165)
!2602 = !DILocation(line: 330, column: 19, scope: !2165)
!2603 = !DILocation(line: 331, column: 9, scope: !2165)
!2604 = !DILocation(line: 331, column: 19, scope: !2165)
!2605 = !DILocation(line: 332, column: 9, scope: !2165)
!2606 = !DILocation(line: 332, column: 19, scope: !2165)
!2607 = !DILocation(line: 333, column: 9, scope: !2165)
!2608 = !DILocation(line: 333, column: 19, scope: !2165)
!2609 = !DILocation(line: 334, column: 9, scope: !2165)
!2610 = !DILocation(line: 334, column: 19, scope: !2165)
!2611 = !DILocation(line: 335, column: 9, scope: !2165)
!2612 = !DILocation(line: 335, column: 19, scope: !2165)
!2613 = !DILocation(line: 336, column: 9, scope: !2165)
!2614 = !DILocation(line: 336, column: 19, scope: !2165)
!2615 = !DILocation(line: 337, column: 9, scope: !2165)
!2616 = !DILocation(line: 337, column: 19, scope: !2165)
!2617 = !DILocation(line: 338, column: 9, scope: !2165)
!2618 = !DILocation(line: 338, column: 19, scope: !2165)
!2619 = !DILocation(line: 339, column: 9, scope: !2165)
!2620 = !DILocation(line: 339, column: 19, scope: !2165)
!2621 = !DILocation(line: 340, column: 9, scope: !2165)
!2622 = !DILocation(line: 340, column: 19, scope: !2165)
!2623 = !DILocation(line: 341, column: 9, scope: !2165)
!2624 = !DILocation(line: 341, column: 19, scope: !2165)
!2625 = !DILocation(line: 342, column: 9, scope: !2165)
!2626 = !DILocation(line: 342, column: 19, scope: !2165)
!2627 = !DILocation(line: 343, column: 9, scope: !2165)
!2628 = !DILocation(line: 343, column: 19, scope: !2165)
!2629 = !DILocation(line: 344, column: 1, scope: !2165)
!2630 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !2056, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2631 = !DILocalVariable(name: "state", arg: 1, scope: !2630, file: !27, line: 550, type: !2058)
!2632 = !DILocation(line: 0, scope: !2630)
!2633 = !DILocation(line: 552, column: 26, scope: !2630)
!2634 = !DILocation(line: 552, column: 19, scope: !2630)
!2635 = !DILocation(line: 552, column: 36, scope: !2630)
!2636 = !DILocation(line: 552, column: 3, scope: !2630)
!2637 = !DILocation(line: 553, column: 10, scope: !2630)
!2638 = !DILocation(line: 553, column: 14, scope: !2630)
!2639 = !DILocation(line: 554, column: 1, scope: !2630)
!2640 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2641, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2641 = !DISubroutineType(types: !2642)
!2642 = !{null, !2075, !42, !42, !61}
!2643 = !DILocalVariable(name: "s", arg: 1, scope: !2640, file: !27, line: 405, type: !2075)
!2644 = !DILocation(line: 0, scope: !2640)
!2645 = !DILocalVariable(name: "pos", arg: 2, scope: !2640, file: !27, line: 405, type: !42)
!2646 = !DILocalVariable(name: "r", arg: 3, scope: !2640, file: !27, line: 405, type: !42)
!2647 = !DILocalVariable(name: "p", arg: 4, scope: !2640, file: !27, line: 405, type: !61)
!2648 = !DILocation(line: 407, column: 15, scope: !2640)
!2649 = !DILocation(line: 407, column: 36, scope: !2640)
!2650 = !DILocation(line: 407, column: 31, scope: !2640)
!2651 = !DILocation(line: 407, column: 27, scope: !2640)
!2652 = !DILocation(line: 407, column: 8, scope: !2640)
!2653 = !DILocation(line: 407, column: 3, scope: !2640)
!2654 = !DILocation(line: 407, column: 12, scope: !2640)
!2655 = !DILocation(line: 408, column: 6, scope: !2640)
!2656 = !DILocation(line: 408, column: 8, scope: !2640)
!2657 = !DILocation(line: 408, column: 3, scope: !2640)
!2658 = !DILocation(line: 408, column: 12, scope: !2640)
!2659 = !DILocation(line: 409, column: 1, scope: !2640)
!2660 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2661, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2661 = !DISubroutineType(types: !2662)
!2662 = !{null, !60, !1979, !2058}
!2663 = !DILocalVariable(name: "out", arg: 1, scope: !2660, file: !27, line: 566, type: !60)
!2664 = !DILocation(line: 0, scope: !2660)
!2665 = !DILocalVariable(name: "outlen", arg: 2, scope: !2660, file: !27, line: 566, type: !1979)
!2666 = !DILocalVariable(name: "state", arg: 3, scope: !2660, file: !27, line: 566, type: !2058)
!2667 = !DILocation(line: 568, column: 51, scope: !2660)
!2668 = !DILocation(line: 568, column: 44, scope: !2660)
!2669 = !DILocation(line: 568, column: 61, scope: !2660)
!2670 = !DILocation(line: 568, column: 16, scope: !2660)
!2671 = !DILocation(line: 568, column: 10, scope: !2660)
!2672 = !DILocation(line: 568, column: 14, scope: !2660)
!2673 = !DILocation(line: 569, column: 1, scope: !2660)
!2674 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2675, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2675 = !DISubroutineType(types: !2676)
!2676 = !{!42, !60, !1979, !2075, !42, !42}
!2677 = !DILocalVariable(name: "out", arg: 1, scope: !2674, file: !27, line: 426, type: !60)
!2678 = !DILocation(line: 0, scope: !2674)
!2679 = !DILocalVariable(name: "outlen", arg: 2, scope: !2674, file: !27, line: 427, type: !1979)
!2680 = !DILocalVariable(name: "s", arg: 3, scope: !2674, file: !27, line: 428, type: !2075)
!2681 = !DILocalVariable(name: "pos", arg: 4, scope: !2674, file: !27, line: 429, type: !42)
!2682 = !DILocalVariable(name: "r", arg: 5, scope: !2674, file: !27, line: 430, type: !42)
!2683 = !DILocation(line: 434, column: 3, scope: !2674)
!2684 = !DILocation(line: 435, column: 12, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2686, file: !27, line: 435, column: 8)
!2686 = distinct !DILexicalBlock(scope: !2674, file: !27, line: 434, column: 17)
!2687 = !DILocation(line: 436, column: 7, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2685, file: !27, line: 435, column: 18)
!2689 = !DILocation(line: 438, column: 5, scope: !2688)
!2690 = !DILocalVariable(name: "i", scope: !2674, file: !27, line: 432, type: !42)
!2691 = !DILocation(line: 439, column: 9, scope: !2692)
!2692 = distinct !DILexicalBlock(scope: !2686, file: !27, line: 439, column: 5)
!2693 = !DILocation(line: 439, scope: !2692)
!2694 = !DILocation(line: 439, column: 17, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2692, file: !27, line: 439, column: 5)
!2696 = !DILocation(line: 439, column: 21, scope: !2695)
!2697 = !DILocation(line: 439, column: 31, scope: !2695)
!2698 = !DILocation(line: 439, column: 26, scope: !2695)
!2699 = !DILocation(line: 0, scope: !2695)
!2700 = !DILocation(line: 439, column: 5, scope: !2692)
!2701 = !DILocation(line: 440, column: 19, scope: !2695)
!2702 = !DILocation(line: 440, column: 16, scope: !2695)
!2703 = !DILocation(line: 440, column: 30, scope: !2695)
!2704 = !DILocation(line: 440, column: 27, scope: !2695)
!2705 = !DILocation(line: 440, column: 23, scope: !2695)
!2706 = !DILocation(line: 440, column: 11, scope: !2695)
!2707 = !DILocation(line: 440, column: 14, scope: !2695)
!2708 = !DILocation(line: 440, column: 7, scope: !2695)
!2709 = !DILocation(line: 439, column: 41, scope: !2695)
!2710 = !DILocation(line: 439, column: 5, scope: !2695)
!2711 = distinct !{!2711, !2700, !2712, !259}
!2712 = !DILocation(line: 440, column: 32, scope: !2692)
!2713 = !DILocation(line: 441, column: 16, scope: !2686)
!2714 = !DILocation(line: 441, column: 12, scope: !2686)
!2715 = distinct !{!2715, !2683, !2716, !259}
!2716 = !DILocation(line: 443, column: 3, scope: !2674)
!2717 = !DILocation(line: 445, column: 3, scope: !2674)
!2718 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !2093, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2719 = !DILocalVariable(name: "state", arg: 1, scope: !2718, file: !27, line: 580, type: !2058)
!2720 = !DILocation(line: 0, scope: !2718)
!2721 = !DILocalVariable(name: "in", arg: 2, scope: !2718, file: !27, line: 580, type: !64)
!2722 = !DILocalVariable(name: "inlen", arg: 3, scope: !2718, file: !27, line: 580, type: !1979)
!2723 = !DILocation(line: 582, column: 29, scope: !2718)
!2724 = !DILocation(line: 582, column: 22, scope: !2718)
!2725 = !DILocation(line: 582, column: 3, scope: !2718)
!2726 = !DILocation(line: 583, column: 10, scope: !2718)
!2727 = !DILocation(line: 583, column: 14, scope: !2718)
!2728 = !DILocation(line: 584, column: 1, scope: !2718)
!2729 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2730, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2730 = !DISubroutineType(types: !2731)
!2731 = !{null, !2075, !42, !64, !1979, !61}
!2732 = !DILocalVariable(name: "s", arg: 1, scope: !2729, file: !27, line: 461, type: !2075)
!2733 = !DILocation(line: 0, scope: !2729)
!2734 = !DILocalVariable(name: "r", arg: 2, scope: !2729, file: !27, line: 462, type: !42)
!2735 = !DILocalVariable(name: "in", arg: 3, scope: !2729, file: !27, line: 463, type: !64)
!2736 = !DILocalVariable(name: "inlen", arg: 4, scope: !2729, file: !27, line: 464, type: !1979)
!2737 = !DILocalVariable(name: "p", arg: 5, scope: !2729, file: !27, line: 465, type: !61)
!2738 = !DILocalVariable(name: "i", scope: !2729, file: !27, line: 467, type: !42)
!2739 = !DILocation(line: 469, column: 7, scope: !2740)
!2740 = distinct !DILexicalBlock(scope: !2729, file: !27, line: 469, column: 3)
!2741 = !DILocation(line: 469, scope: !2740)
!2742 = !DILocation(line: 469, column: 12, scope: !2743)
!2743 = distinct !DILexicalBlock(scope: !2740, file: !27, line: 469, column: 3)
!2744 = !DILocation(line: 469, column: 3, scope: !2740)
!2745 = !DILocation(line: 470, column: 5, scope: !2743)
!2746 = !DILocation(line: 470, column: 10, scope: !2743)
!2747 = !DILocation(line: 469, column: 17, scope: !2743)
!2748 = !DILocation(line: 469, column: 3, scope: !2743)
!2749 = distinct !{!2749, !2744, !2750, !259}
!2750 = !DILocation(line: 470, column: 12, scope: !2740)
!2751 = !DILocation(line: 472, column: 3, scope: !2729)
!2752 = !DILocation(line: 472, column: 15, scope: !2729)
!2753 = !DILocation(line: 473, column: 9, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2755, file: !27, line: 473, column: 5)
!2755 = distinct !DILexicalBlock(scope: !2729, file: !27, line: 472, column: 21)
!2756 = !DILocation(line: 473, scope: !2754)
!2757 = !DILocation(line: 473, column: 16, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2754, file: !27, line: 473, column: 5)
!2759 = !DILocation(line: 473, column: 14, scope: !2758)
!2760 = !DILocation(line: 473, column: 5, scope: !2754)
!2761 = !DILocation(line: 474, column: 26, scope: !2758)
!2762 = !DILocation(line: 474, column: 24, scope: !2758)
!2763 = !DILocation(line: 474, column: 15, scope: !2758)
!2764 = !DILocation(line: 474, column: 7, scope: !2758)
!2765 = !DILocation(line: 474, column: 12, scope: !2758)
!2766 = !DILocation(line: 473, column: 20, scope: !2758)
!2767 = !DILocation(line: 473, column: 5, scope: !2758)
!2768 = distinct !{!2768, !2760, !2769, !259}
!2769 = !DILocation(line: 474, column: 28, scope: !2754)
!2770 = !DILocation(line: 475, column: 8, scope: !2755)
!2771 = !DILocation(line: 476, column: 11, scope: !2755)
!2772 = !DILocation(line: 477, column: 5, scope: !2755)
!2773 = distinct !{!2773, !2751, !2774, !259}
!2774 = !DILocation(line: 478, column: 3, scope: !2729)
!2775 = !DILocation(line: 480, column: 7, scope: !2776)
!2776 = distinct !DILexicalBlock(scope: !2729, file: !27, line: 480, column: 3)
!2777 = !DILocation(line: 480, scope: !2776)
!2778 = !DILocation(line: 480, column: 12, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2776, file: !27, line: 480, column: 3)
!2780 = !DILocation(line: 480, column: 3, scope: !2776)
!2781 = !DILocation(line: 481, column: 25, scope: !2779)
!2782 = !DILocation(line: 481, column: 15, scope: !2779)
!2783 = !DILocation(line: 481, column: 38, scope: !2779)
!2784 = !DILocation(line: 481, column: 35, scope: !2779)
!2785 = !DILocation(line: 481, column: 31, scope: !2779)
!2786 = !DILocation(line: 481, column: 8, scope: !2779)
!2787 = !DILocation(line: 481, column: 5, scope: !2779)
!2788 = !DILocation(line: 481, column: 12, scope: !2779)
!2789 = !DILocation(line: 480, column: 20, scope: !2779)
!2790 = !DILocation(line: 480, column: 3, scope: !2779)
!2791 = distinct !{!2791, !2780, !2792, !259}
!2792 = !DILocation(line: 481, column: 40, scope: !2776)
!2793 = !DILocation(line: 483, column: 13, scope: !2729)
!2794 = !DILocation(line: 483, column: 32, scope: !2729)
!2795 = !DILocation(line: 483, column: 29, scope: !2729)
!2796 = !DILocation(line: 483, column: 25, scope: !2729)
!2797 = !DILocation(line: 483, column: 6, scope: !2729)
!2798 = !DILocation(line: 483, column: 3, scope: !2729)
!2799 = !DILocation(line: 483, column: 10, scope: !2729)
!2800 = !DILocation(line: 484, column: 7, scope: !2729)
!2801 = !DILocation(line: 484, column: 10, scope: !2729)
!2802 = !DILocation(line: 484, column: 3, scope: !2729)
!2803 = !DILocation(line: 484, column: 14, scope: !2729)
!2804 = !DILocation(line: 485, column: 1, scope: !2729)
!2805 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2806, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2806 = !DISubroutineType(types: !2807)
!2807 = !{!23, !64}
!2808 = !DILocalVariable(name: "x", arg: 1, scope: !2805, file: !27, line: 22, type: !64)
!2809 = !DILocation(line: 0, scope: !2805)
!2810 = !DILocalVariable(name: "r", scope: !2805, file: !27, line: 24, type: !23)
!2811 = !DILocalVariable(name: "i", scope: !2805, file: !27, line: 23, type: !42)
!2812 = !DILocation(line: 26, column: 7, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2805, file: !27, line: 26, column: 3)
!2814 = !DILocation(line: 26, scope: !2813)
!2815 = !DILocation(line: 26, column: 12, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2813, file: !27, line: 26, column: 3)
!2817 = !DILocation(line: 26, column: 3, scope: !2813)
!2818 = !DILocation(line: 27, column: 20, scope: !2816)
!2819 = !DILocation(line: 27, column: 10, scope: !2816)
!2820 = !DILocation(line: 27, column: 29, scope: !2816)
!2821 = !DILocation(line: 27, column: 25, scope: !2816)
!2822 = !DILocation(line: 27, column: 7, scope: !2816)
!2823 = !DILocation(line: 27, column: 5, scope: !2816)
!2824 = !DILocation(line: 26, column: 16, scope: !2816)
!2825 = !DILocation(line: 26, column: 3, scope: !2816)
!2826 = distinct !{!2826, !2817, !2827, !259}
!2827 = !DILocation(line: 27, column: 30, scope: !2813)
!2828 = !DILocation(line: 29, column: 3, scope: !2805)
!2829 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2661, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2830 = !DILocalVariable(name: "out", arg: 1, scope: !2829, file: !27, line: 598, type: !60)
!2831 = !DILocation(line: 0, scope: !2829)
!2832 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2829, file: !27, line: 598, type: !1979)
!2833 = !DILocalVariable(name: "state", arg: 3, scope: !2829, file: !27, line: 598, type: !2058)
!2834 = !DILocation(line: 600, column: 45, scope: !2829)
!2835 = !DILocation(line: 600, column: 38, scope: !2829)
!2836 = !DILocation(line: 600, column: 3, scope: !2829)
!2837 = !DILocation(line: 601, column: 1, scope: !2829)
!2838 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2839, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2839 = !DISubroutineType(types: !2840)
!2840 = !{null, !60, !1979, !2075, !42}
!2841 = !DILocalVariable(name: "out", arg: 1, scope: !2838, file: !27, line: 500, type: !60)
!2842 = !DILocation(line: 0, scope: !2838)
!2843 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2838, file: !27, line: 501, type: !1979)
!2844 = !DILocalVariable(name: "s", arg: 3, scope: !2838, file: !27, line: 502, type: !2075)
!2845 = !DILocalVariable(name: "r", arg: 4, scope: !2838, file: !27, line: 503, type: !42)
!2846 = !DILocation(line: 507, column: 3, scope: !2838)
!2847 = !DILocation(line: 508, column: 5, scope: !2848)
!2848 = distinct !DILexicalBlock(scope: !2838, file: !27, line: 507, column: 18)
!2849 = !DILocalVariable(name: "i", scope: !2838, file: !27, line: 505, type: !42)
!2850 = !DILocation(line: 509, column: 9, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2848, file: !27, line: 509, column: 5)
!2852 = !DILocation(line: 509, scope: !2851)
!2853 = !DILocation(line: 509, column: 16, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2851, file: !27, line: 509, column: 5)
!2855 = !DILocation(line: 509, column: 14, scope: !2854)
!2856 = !DILocation(line: 509, column: 5, scope: !2851)
!2857 = !DILocation(line: 510, column: 20, scope: !2854)
!2858 = !DILocation(line: 510, column: 18, scope: !2854)
!2859 = !DILocation(line: 510, column: 24, scope: !2854)
!2860 = !DILocation(line: 510, column: 7, scope: !2854)
!2861 = !DILocation(line: 509, column: 20, scope: !2854)
!2862 = !DILocation(line: 509, column: 5, scope: !2854)
!2863 = distinct !{!2863, !2856, !2864, !259}
!2864 = !DILocation(line: 510, column: 28, scope: !2851)
!2865 = !DILocation(line: 511, column: 9, scope: !2848)
!2866 = !DILocation(line: 512, column: 13, scope: !2848)
!2867 = distinct !{!2867, !2846, !2868, !259}
!2868 = !DILocation(line: 513, column: 3, scope: !2838)
!2869 = !DILocation(line: 514, column: 1, scope: !2838)
!2870 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2871, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2871 = !DISubroutineType(types: !2872)
!2872 = !{null, !60, !23}
!2873 = !DILocalVariable(name: "x", arg: 1, scope: !2870, file: !27, line: 40, type: !60)
!2874 = !DILocation(line: 0, scope: !2870)
!2875 = !DILocalVariable(name: "u", arg: 2, scope: !2870, file: !27, line: 40, type: !23)
!2876 = !DILocalVariable(name: "i", scope: !2870, file: !27, line: 41, type: !42)
!2877 = !DILocation(line: 43, column: 7, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2870, file: !27, line: 43, column: 3)
!2879 = !DILocation(line: 43, scope: !2878)
!2880 = !DILocation(line: 43, column: 12, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2878, file: !27, line: 43, column: 3)
!2882 = !DILocation(line: 43, column: 3, scope: !2878)
!2883 = !DILocation(line: 44, column: 18, scope: !2881)
!2884 = !DILocation(line: 44, column: 14, scope: !2881)
!2885 = !DILocation(line: 44, column: 12, scope: !2881)
!2886 = !DILocation(line: 44, column: 5, scope: !2881)
!2887 = !DILocation(line: 44, column: 10, scope: !2881)
!2888 = !DILocation(line: 43, column: 16, scope: !2881)
!2889 = !DILocation(line: 43, column: 3, scope: !2881)
!2890 = distinct !{!2890, !2882, !2891, !259}
!2891 = !DILocation(line: 44, column: 19, scope: !2878)
!2892 = !DILocation(line: 45, column: 1, scope: !2870)
!2893 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !2056, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2894 = !DILocalVariable(name: "state", arg: 1, scope: !2893, file: !27, line: 610, type: !2058)
!2895 = !DILocation(line: 0, scope: !2893)
!2896 = !DILocation(line: 612, column: 22, scope: !2893)
!2897 = !DILocation(line: 612, column: 15, scope: !2893)
!2898 = !DILocation(line: 612, column: 3, scope: !2893)
!2899 = !DILocation(line: 613, column: 10, scope: !2893)
!2900 = !DILocation(line: 613, column: 14, scope: !2893)
!2901 = !DILocation(line: 614, column: 1, scope: !2893)
!2902 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !2093, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2903 = !DILocalVariable(name: "state", arg: 1, scope: !2902, file: !27, line: 625, type: !2058)
!2904 = !DILocation(line: 0, scope: !2902)
!2905 = !DILocalVariable(name: "in", arg: 2, scope: !2902, file: !27, line: 625, type: !64)
!2906 = !DILocalVariable(name: "inlen", arg: 3, scope: !2902, file: !27, line: 625, type: !1979)
!2907 = !DILocation(line: 627, column: 37, scope: !2902)
!2908 = !DILocation(line: 627, column: 30, scope: !2902)
!2909 = !DILocation(line: 627, column: 47, scope: !2902)
!2910 = !DILocation(line: 627, column: 16, scope: !2902)
!2911 = !DILocation(line: 627, column: 10, scope: !2902)
!2912 = !DILocation(line: 627, column: 14, scope: !2902)
!2913 = !DILocation(line: 628, column: 1, scope: !2902)
!2914 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !2056, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2915 = !DILocalVariable(name: "state", arg: 1, scope: !2914, file: !27, line: 637, type: !2058)
!2916 = !DILocation(line: 0, scope: !2914)
!2917 = !DILocation(line: 639, column: 26, scope: !2914)
!2918 = !DILocation(line: 639, column: 19, scope: !2914)
!2919 = !DILocation(line: 639, column: 36, scope: !2914)
!2920 = !DILocation(line: 639, column: 3, scope: !2914)
!2921 = !DILocation(line: 640, column: 10, scope: !2914)
!2922 = !DILocation(line: 640, column: 14, scope: !2914)
!2923 = !DILocation(line: 641, column: 1, scope: !2914)
!2924 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2661, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2925 = !DILocalVariable(name: "out", arg: 1, scope: !2924, file: !27, line: 653, type: !60)
!2926 = !DILocation(line: 0, scope: !2924)
!2927 = !DILocalVariable(name: "outlen", arg: 2, scope: !2924, file: !27, line: 653, type: !1979)
!2928 = !DILocalVariable(name: "state", arg: 3, scope: !2924, file: !27, line: 653, type: !2058)
!2929 = !DILocation(line: 655, column: 51, scope: !2924)
!2930 = !DILocation(line: 655, column: 44, scope: !2924)
!2931 = !DILocation(line: 655, column: 61, scope: !2924)
!2932 = !DILocation(line: 655, column: 16, scope: !2924)
!2933 = !DILocation(line: 655, column: 10, scope: !2924)
!2934 = !DILocation(line: 655, column: 14, scope: !2924)
!2935 = !DILocation(line: 656, column: 1, scope: !2924)
!2936 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !2093, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2937 = !DILocalVariable(name: "state", arg: 1, scope: !2936, file: !27, line: 667, type: !2058)
!2938 = !DILocation(line: 0, scope: !2936)
!2939 = !DILocalVariable(name: "in", arg: 2, scope: !2936, file: !27, line: 667, type: !64)
!2940 = !DILocalVariable(name: "inlen", arg: 3, scope: !2936, file: !27, line: 667, type: !1979)
!2941 = !DILocation(line: 669, column: 29, scope: !2936)
!2942 = !DILocation(line: 669, column: 22, scope: !2936)
!2943 = !DILocation(line: 669, column: 3, scope: !2936)
!2944 = !DILocation(line: 670, column: 10, scope: !2936)
!2945 = !DILocation(line: 670, column: 14, scope: !2936)
!2946 = !DILocation(line: 671, column: 1, scope: !2936)
!2947 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2661, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2948 = !DILocalVariable(name: "out", arg: 1, scope: !2947, file: !27, line: 685, type: !60)
!2949 = !DILocation(line: 0, scope: !2947)
!2950 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2947, file: !27, line: 685, type: !1979)
!2951 = !DILocalVariable(name: "state", arg: 3, scope: !2947, file: !27, line: 685, type: !2058)
!2952 = !DILocation(line: 687, column: 45, scope: !2947)
!2953 = !DILocation(line: 687, column: 38, scope: !2947)
!2954 = !DILocation(line: 687, column: 3, scope: !2947)
!2955 = !DILocation(line: 688, column: 1, scope: !2947)
!2956 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2957, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2957 = !DISubroutineType(types: !2958)
!2958 = !{null, !60, !1979, !64, !1979}
!2959 = !DILocalVariable(name: "out", arg: 1, scope: !2956, file: !27, line: 700, type: !60)
!2960 = !DILocation(line: 0, scope: !2956)
!2961 = !DILocalVariable(name: "outlen", arg: 2, scope: !2956, file: !27, line: 700, type: !1979)
!2962 = !DILocalVariable(name: "in", arg: 3, scope: !2956, file: !27, line: 700, type: !64)
!2963 = !DILocalVariable(name: "inlen", arg: 4, scope: !2956, file: !27, line: 700, type: !1979)
!2964 = !DILocalVariable(name: "state", scope: !2956, file: !27, line: 703, type: !2059)
!2965 = !DILocation(line: 703, column: 16, scope: !2956)
!2966 = !DILocation(line: 705, column: 3, scope: !2956)
!2967 = !DILocation(line: 706, column: 19, scope: !2956)
!2968 = !DILocalVariable(name: "nblocks", scope: !2956, file: !27, line: 702, type: !1979)
!2969 = !DILocation(line: 707, column: 3, scope: !2956)
!2970 = !DILocation(line: 708, column: 20, scope: !2956)
!2971 = !DILocation(line: 708, column: 10, scope: !2956)
!2972 = !DILocation(line: 709, column: 17, scope: !2956)
!2973 = !DILocation(line: 709, column: 7, scope: !2956)
!2974 = !DILocation(line: 710, column: 3, scope: !2956)
!2975 = !DILocation(line: 711, column: 1, scope: !2956)
!2976 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2957, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2977 = !DILocalVariable(name: "out", arg: 1, scope: !2976, file: !27, line: 723, type: !60)
!2978 = !DILocation(line: 0, scope: !2976)
!2979 = !DILocalVariable(name: "outlen", arg: 2, scope: !2976, file: !27, line: 723, type: !1979)
!2980 = !DILocalVariable(name: "in", arg: 3, scope: !2976, file: !27, line: 723, type: !64)
!2981 = !DILocalVariable(name: "inlen", arg: 4, scope: !2976, file: !27, line: 723, type: !1979)
!2982 = !DILocalVariable(name: "state", scope: !2976, file: !27, line: 726, type: !2059)
!2983 = !DILocation(line: 726, column: 16, scope: !2976)
!2984 = !DILocation(line: 728, column: 3, scope: !2976)
!2985 = !DILocation(line: 729, column: 19, scope: !2976)
!2986 = !DILocalVariable(name: "nblocks", scope: !2976, file: !27, line: 725, type: !1979)
!2987 = !DILocation(line: 730, column: 3, scope: !2976)
!2988 = !DILocation(line: 731, column: 20, scope: !2976)
!2989 = !DILocation(line: 731, column: 10, scope: !2976)
!2990 = !DILocation(line: 732, column: 17, scope: !2976)
!2991 = !DILocation(line: 732, column: 7, scope: !2976)
!2992 = !DILocation(line: 733, column: 3, scope: !2976)
!2993 = !DILocation(line: 734, column: 1, scope: !2976)
!2994 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2995, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2995 = !DISubroutineType(types: !2996)
!2996 = !{null, !60, !64, !1979}
!2997 = !DILocalVariable(name: "h", arg: 1, scope: !2994, file: !27, line: 745, type: !60)
!2998 = !DILocation(line: 0, scope: !2994)
!2999 = !DILocalVariable(name: "in", arg: 2, scope: !2994, file: !27, line: 745, type: !64)
!3000 = !DILocalVariable(name: "inlen", arg: 3, scope: !2994, file: !27, line: 745, type: !1979)
!3001 = !DILocalVariable(name: "s", scope: !2994, file: !27, line: 748, type: !211)
!3002 = !DILocation(line: 748, column: 12, scope: !2994)
!3003 = !DILocation(line: 750, column: 22, scope: !2994)
!3004 = !DILocation(line: 750, column: 3, scope: !2994)
!3005 = !DILocation(line: 751, column: 28, scope: !2994)
!3006 = !DILocation(line: 751, column: 3, scope: !2994)
!3007 = !DILocalVariable(name: "i", scope: !2994, file: !27, line: 747, type: !42)
!3008 = !DILocation(line: 752, column: 7, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !2994, file: !27, line: 752, column: 3)
!3010 = !DILocation(line: 752, scope: !3009)
!3011 = !DILocation(line: 752, column: 12, scope: !3012)
!3012 = distinct !DILexicalBlock(scope: !3009, file: !27, line: 752, column: 3)
!3013 = !DILocation(line: 752, column: 3, scope: !3009)
!3014 = !DILocation(line: 753, column: 16, scope: !3012)
!3015 = !DILocation(line: 753, column: 14, scope: !3012)
!3016 = !DILocation(line: 753, column: 19, scope: !3012)
!3017 = !DILocation(line: 753, column: 5, scope: !3012)
!3018 = !DILocation(line: 752, column: 16, scope: !3012)
!3019 = !DILocation(line: 752, column: 3, scope: !3012)
!3020 = distinct !{!3020, !3013, !3021, !259}
!3021 = !DILocation(line: 753, column: 23, scope: !3009)
!3022 = !DILocation(line: 754, column: 1, scope: !2994)
!3023 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2995, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!3024 = !DILocalVariable(name: "h", arg: 1, scope: !3023, file: !27, line: 765, type: !60)
!3025 = !DILocation(line: 0, scope: !3023)
!3026 = !DILocalVariable(name: "in", arg: 2, scope: !3023, file: !27, line: 765, type: !64)
!3027 = !DILocalVariable(name: "inlen", arg: 3, scope: !3023, file: !27, line: 765, type: !1979)
!3028 = !DILocalVariable(name: "s", scope: !3023, file: !27, line: 768, type: !211)
!3029 = !DILocation(line: 768, column: 12, scope: !3023)
!3030 = !DILocation(line: 770, column: 22, scope: !3023)
!3031 = !DILocation(line: 770, column: 3, scope: !3023)
!3032 = !DILocation(line: 771, column: 28, scope: !3023)
!3033 = !DILocation(line: 771, column: 3, scope: !3023)
!3034 = !DILocalVariable(name: "i", scope: !3023, file: !27, line: 767, type: !42)
!3035 = !DILocation(line: 772, column: 7, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !3023, file: !27, line: 772, column: 3)
!3037 = !DILocation(line: 772, scope: !3036)
!3038 = !DILocation(line: 772, column: 12, scope: !3039)
!3039 = distinct !DILexicalBlock(scope: !3036, file: !27, line: 772, column: 3)
!3040 = !DILocation(line: 772, column: 3, scope: !3036)
!3041 = !DILocation(line: 773, column: 16, scope: !3039)
!3042 = !DILocation(line: 773, column: 14, scope: !3039)
!3043 = !DILocation(line: 773, column: 19, scope: !3039)
!3044 = !DILocation(line: 773, column: 5, scope: !3039)
!3045 = !DILocation(line: 772, column: 16, scope: !3039)
!3046 = !DILocation(line: 772, column: 3, scope: !3039)
!3047 = distinct !{!3047, !3040, !3048, !259}
!3048 = !DILocation(line: 773, column: 23, scope: !3036)
!3049 = !DILocation(line: 774, column: 1, scope: !3023)
!3050 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !3051, file: !3051, line: 18, type: !3052, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!3051 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!3052 = !DISubroutineType(types: !3053)
!3053 = !{null, !3054, !64, !61, !61}
!3054 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3055, size: 32)
!3055 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !3056)
!3056 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !3057)
!3057 = !{!3058, !3059}
!3058 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !3056, file: !207, line: 15, baseType: !211, size: 1600)
!3059 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3056, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!3060 = !DILocalVariable(name: "state", arg: 1, scope: !3050, file: !3051, line: 18, type: !3054)
!3061 = !DILocation(line: 0, scope: !3050)
!3062 = !DILocalVariable(name: "seed", arg: 2, scope: !3050, file: !3051, line: 19, type: !64)
!3063 = !DILocalVariable(name: "x", arg: 3, scope: !3050, file: !3051, line: 20, type: !61)
!3064 = !DILocalVariable(name: "y", arg: 4, scope: !3050, file: !3051, line: 21, type: !61)
!3065 = !DILocalVariable(name: "extseed", scope: !3050, file: !3051, line: 23, type: !3066)
!3066 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !3067)
!3067 = !{!3068}
!3068 = !DISubrange(count: 34)
!3069 = !DILocation(line: 23, column: 11, scope: !3050)
!3070 = !DILocation(line: 25, column: 10, scope: !3050)
!3071 = !DILocation(line: 25, column: 3, scope: !3050)
!3072 = !DILocation(line: 26, column: 3, scope: !3050)
!3073 = !DILocation(line: 26, column: 29, scope: !3050)
!3074 = !DILocation(line: 27, column: 3, scope: !3050)
!3075 = !DILocation(line: 27, column: 29, scope: !3050)
!3076 = !DILocation(line: 29, column: 31, scope: !3050)
!3077 = !DILocation(line: 29, column: 3, scope: !3050)
!3078 = !DILocation(line: 30, column: 1, scope: !3050)
!3079 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !3051, file: !3051, line: 43, type: !3080, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!3080 = !DISubroutineType(types: !3081)
!3081 = !{null, !60, !1979, !64, !61}
!3082 = !DILocalVariable(name: "out", arg: 1, scope: !3079, file: !3051, line: 43, type: !60)
!3083 = !DILocation(line: 0, scope: !3079)
!3084 = !DILocalVariable(name: "outlen", arg: 2, scope: !3079, file: !3051, line: 43, type: !1979)
!3085 = !DILocalVariable(name: "key", arg: 3, scope: !3079, file: !3051, line: 43, type: !64)
!3086 = !DILocalVariable(name: "nonce", arg: 4, scope: !3079, file: !3051, line: 43, type: !61)
!3087 = !DILocalVariable(name: "extkey", scope: !3079, file: !3051, line: 45, type: !3088)
!3088 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !3089)
!3089 = !{!3090}
!3090 = !DISubrange(count: 33)
!3091 = !DILocation(line: 45, column: 11, scope: !3079)
!3092 = !DILocation(line: 47, column: 10, scope: !3079)
!3093 = !DILocation(line: 47, column: 3, scope: !3079)
!3094 = !DILocation(line: 48, column: 3, scope: !3079)
!3095 = !DILocation(line: 48, column: 26, scope: !3079)
!3096 = !DILocation(line: 50, column: 25, scope: !3079)
!3097 = !DILocation(line: 50, column: 3, scope: !3079)
!3098 = !DILocation(line: 51, column: 1, scope: !3079)
!3099 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !3051, file: !3051, line: 64, type: !546, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!3100 = !DILocalVariable(name: "out", arg: 1, scope: !3099, file: !3051, line: 64, type: !60)
!3101 = !DILocation(line: 0, scope: !3099)
!3102 = !DILocalVariable(name: "key", arg: 2, scope: !3099, file: !3051, line: 64, type: !64)
!3103 = !DILocalVariable(name: "input", arg: 3, scope: !3099, file: !3051, line: 64, type: !64)
!3104 = !DILocalVariable(name: "s", scope: !3099, file: !3051, line: 66, type: !3055)
!3105 = !DILocation(line: 66, column: 16, scope: !3099)
!3106 = !DILocation(line: 68, column: 3, scope: !3099)
!3107 = !DILocation(line: 69, column: 3, scope: !3099)
!3108 = !DILocation(line: 70, column: 3, scope: !3099)
!3109 = !DILocation(line: 71, column: 3, scope: !3099)
!3110 = !DILocation(line: 72, column: 3, scope: !3099)
!3111 = !DILocation(line: 73, column: 1, scope: !3099)
