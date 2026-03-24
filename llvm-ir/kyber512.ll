; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [2 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@pqcrystals_kyber512_ref_zetas = dso_local constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !0
@KeccakF_RoundConstants = internal constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !19

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !56 {
entry:
    #dbg_value(ptr %pk, !67, !DIExpression(), !68)
    #dbg_value(ptr %sk, !69, !DIExpression(), !68)
    #dbg_value(ptr %coins, !70, !DIExpression(), !68)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #2, !dbg !71
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 768, !dbg !72
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 800) #2, !dbg !73
  %add.ptr1 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !74
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr1, i32 -64, !dbg !74
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr2, ptr noundef %pk, i32 noundef 800) #2, !dbg !74
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !75
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -32, !dbg !76
  %add.ptr5 = getelementptr inbounds i8, ptr %coins, i32 32, !dbg !77
  %call6 = call ptr @memcpy(ptr noundef %add.ptr4, ptr noundef %add.ptr5, i32 noundef 32) #2, !dbg !78
  ret i32 0, !dbg !79
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) #0 !dbg !80 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !83, !DIExpression(), !84)
    #dbg_value(ptr %sk, !85, !DIExpression(), !84)
    #dbg_declare(ptr %coins, !86, !DIExpression(), !90)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !91
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 64) #2, !dbg !92
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !93
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %arraydecay1) #2, !dbg !94
  ret i32 0, !dbg !95
}

declare dso_local void @randombytes(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) #0 !dbg !96 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 800) #2, !dbg !110
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !111
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !111
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay2, ptr noundef %arraydecay3, i32 noundef 64) #2, !dbg !111
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !112
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !113
  %add.ptr6 = getelementptr inbounds i8, ptr %arraydecay5, i32 32, !dbg !114
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef %arraydecay4, ptr noundef %pk, ptr noundef %add.ptr6) #2, !dbg !115
  %arraydecay7 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !116
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef %arraydecay7, i32 noundef 32) #2, !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) #0 !dbg !119 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !120, !DIExpression(), !121)
    #dbg_value(ptr %ss, !122, !DIExpression(), !121)
    #dbg_value(ptr %pk, !123, !DIExpression(), !121)
    #dbg_declare(ptr %coins, !124, !DIExpression(), !128)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !129
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 32) #2, !dbg !130
  %arraydecay1 = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !131
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %arraydecay1) #2, !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) #0 !dbg !134 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !137, !DIExpression(), !138)
    #dbg_value(ptr %ct, !139, !DIExpression(), !138)
    #dbg_value(ptr %sk, !140, !DIExpression(), !138)
    #dbg_declare(ptr %buf, !141, !DIExpression(), !142)
    #dbg_declare(ptr %kr, !143, !DIExpression(), !144)
    #dbg_declare(ptr %cmp, !145, !DIExpression(), !149)
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 768, !dbg !150
    #dbg_value(ptr %add.ptr, !151, !DIExpression(), !138)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !152
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %arraydecay, ptr noundef %ct, ptr noundef %sk) #2, !dbg !153
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !154
  %add.ptr2 = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !155
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !156
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -64, !dbg !157
  %call = call ptr @memcpy(ptr noundef %add.ptr2, ptr noundef %add.ptr4, i32 noundef 32) #2, !dbg !158
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !159
  %arraydecay6 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !159
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay5, ptr noundef %arraydecay6, i32 noundef 64) #2, !dbg !159
  %arraydecay7 = getelementptr inbounds [768 x i8], ptr %cmp, i32 0, i32 0, !dbg !160
  %arraydecay8 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !161
  %arraydecay9 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !162
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i32 32, !dbg !163
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %add.ptr, ptr noundef %add.ptr10) #2, !dbg !164
  %arraydecay11 = getelementptr inbounds [768 x i8], ptr %cmp, i32 0, i32 0, !dbg !165
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef %arraydecay11, i32 noundef 768) #2, !dbg !166
    #dbg_value(i32 %call12, !167, !DIExpression(), !138)
  %add.ptr13 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !168
  %add.ptr14 = getelementptr inbounds i8, ptr %add.ptr13, i32 -32, !dbg !168
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef %add.ptr14, ptr noundef %ct) #2, !dbg !168
  %arraydecay15 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !169
  %tobool = icmp ne i32 %call12, 0, !dbg !170
  %lnot = xor i1 %tobool, true, !dbg !170
  %lnot.ext = zext i1 %lnot to i32, !dbg !170
  %conv = trunc i32 %lnot.ext to i8, !dbg !170
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef %arraydecay15, i32 noundef 32, i8 noundef zeroext %conv) #2, !dbg !171
  ret i32 0, !dbg !172
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) #0 !dbg !173 {
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
  %cmp = icmp ult i32 %i.0, 2, !dbg !220
  br i1 %cmp, label %for.body, label %for.end22, !dbg !222

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !223, !DIExpression(), !195)
  br label %for.cond1, !dbg !224

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !227
    #dbg_value(i32 %j.0, !223, !DIExpression(), !195)
  %cmp2 = icmp ult i32 %j.0, 2, !dbg !228
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !230

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %transposed, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %for.body3
  %conv = trunc i32 %i.0 to i8, !dbg !234
  %conv4 = trunc i32 %j.0 to i8, !dbg !234
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #2, !dbg !234
  br label %if.end, !dbg !234

if.else:                                          ; preds = %for.body3
  %conv5 = trunc i32 %j.0 to i8, !dbg !235
  %conv6 = trunc i32 %i.0 to i8, !dbg !235
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #2, !dbg !235
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !236
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay, i32 noundef 3, ptr noundef %state) #2, !dbg !236
    #dbg_value(i32 504, !237, !DIExpression(), !195)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !238
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx, i32 0, i32 0, !dbg !239
  %arrayidx7 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %j.0, !dbg !238
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
  %arrayidx15 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec14, i32 0, i32 %j.0, !dbg !249
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
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !329 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x %struct.polyvec], align 2
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
  store i8 2, ptr %arrayidx, align 1, !dbg !356
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !357
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay3, ptr noundef %arraydecay4, i32 noundef 33) #2, !dbg !357
  %arraydecay5 = getelementptr inbounds [2 x %struct.polyvec], ptr %a, i32 0, i32 0, !dbg !358
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %arraydecay5, ptr noundef %arraydecay, i32 noundef 0) #2, !dbg !358
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond, !dbg !360

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !362
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !333
    #dbg_value(i8 %nonce.0, !343, !DIExpression(), !333)
    #dbg_value(i32 %i.0, !359, !DIExpression(), !333)
  %cmp = icmp ult i32 %i.0, 2, !dbg !363
  br i1 %cmp, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %skpv, i32 0, i32 0, !dbg !366
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !367
  %inc = add i8 %nonce.0, 1, !dbg !368
    #dbg_value(i8 %inc, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %arrayidx6, ptr noundef %add.ptr, i8 noundef zeroext %nonce.0) #2, !dbg !369
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
  %cmp9 = icmp ult i32 %i.1, 2, !dbg !377
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !379

for.body10:                                       ; preds = %for.cond8
  %vec11 = getelementptr inbounds nuw %struct.polyvec, ptr %e, i32 0, i32 0, !dbg !380
  %arrayidx12 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec11, i32 0, i32 %i.1, !dbg !381
  %inc13 = add i8 %nonce.1, 1, !dbg !382
    #dbg_value(i8 %inc13, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %arrayidx12, ptr noundef %add.ptr, i8 noundef zeroext %nonce.1) #2, !dbg !383
  br label %for.inc14, !dbg !383

for.inc14:                                        ; preds = %for.body10
  %inc15 = add i32 %i.1, 1, !dbg !384
    #dbg_value(i32 %inc15, !359, !DIExpression(), !333)
  br label %for.cond8, !dbg !385, !llvm.loop !386

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %skpv) #2, !dbg !388
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %e) #2, !dbg !389
    #dbg_value(i32 0, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !390

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.inc25 ], !dbg !392
    #dbg_value(i32 %i.2, !359, !DIExpression(), !333)
  %cmp18 = icmp ult i32 %i.2, 2, !dbg !393
  br i1 %cmp18, label %for.body19, label %for.end27, !dbg !395

for.body19:                                       ; preds = %for.cond17
  %vec20 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !396
  %arrayidx21 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec20, i32 0, i32 %i.2, !dbg !398
  %arrayidx22 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !399
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx21, ptr noundef %arrayidx22, ptr noundef %skpv) #2, !dbg !400
  %vec23 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !401
  %arrayidx24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec23, i32 0, i32 %i.2, !dbg !402
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %arrayidx24) #2, !dbg !403
  br label %for.inc25, !dbg !404

for.inc25:                                        ; preds = %for.body19
  %inc26 = add i32 %i.2, 1, !dbg !405
    #dbg_value(i32 %inc26, !359, !DIExpression(), !333)
  br label %for.cond17, !dbg !406, !llvm.loop !407

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %pkpv, ptr noundef %pkpv, ptr noundef %e) #2, !dbg !409
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %pkpv) #2, !dbg !410
  call void @pack_sk(ptr noundef %sk, ptr noundef %skpv) #2, !dbg !411
  call void @pack_pk(ptr noundef %pk, ptr noundef %pkpv, ptr noundef %arraydecay) #2, !dbg !412
  ret void, !dbg !413
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_sk(ptr noundef %r, ptr noundef %sk) #0 !dbg !414 {
entry:
    #dbg_value(ptr %r, !417, !DIExpression(), !418)
    #dbg_value(ptr %sk, !419, !DIExpression(), !418)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #2, !dbg !420
  ret void, !dbg !421
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) #0 !dbg !422 {
entry:
    #dbg_value(ptr %r, !425, !DIExpression(), !426)
    #dbg_value(ptr %pk, !427, !DIExpression(), !426)
    #dbg_value(ptr %seed, !428, !DIExpression(), !426)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #2, !dbg !429
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 768, !dbg !430
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %seed, i32 noundef 32) #2, !dbg !431
  ret void, !dbg !432
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) #0 !dbg !433 {
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
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %k, ptr noundef %m) #2, !dbg !462
  %arraydecay1 = getelementptr inbounds [2 x %struct.polyvec], ptr %at, i32 0, i32 0, !dbg !463
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !463
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %arraydecay1, ptr noundef %arraydecay2, i32 noundef 1) #2, !dbg !463
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond, !dbg !465

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ], !dbg !467
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !437
    #dbg_value(i8 %nonce.0, !443, !DIExpression(), !437)
    #dbg_value(i32 %i.0, !464, !DIExpression(), !437)
  %cmp = icmp ult i32 %i.0, 2, !dbg !468
  br i1 %cmp, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %sp, i32 0, i32 0, !dbg !471
  %arraydecay3 = getelementptr inbounds [2 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !472
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %arraydecay3, i32 %i.0, !dbg !473
  %inc = add i8 %nonce.0, 1, !dbg !474
    #dbg_value(i8 %inc, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #2, !dbg !475
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
  %cmp6 = icmp ult i32 %i.1, 2, !dbg !483
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !485

for.body7:                                        ; preds = %for.cond5
  %vec8 = getelementptr inbounds nuw %struct.polyvec, ptr %ep, i32 0, i32 0, !dbg !486
  %arraydecay9 = getelementptr inbounds [2 x %struct.poly], ptr %vec8, i32 0, i32 0, !dbg !487
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %arraydecay9, i32 %i.1, !dbg !488
  %inc11 = add i8 %nonce.1, 1, !dbg !489
    #dbg_value(i8 %inc11, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !490
  br label %for.inc12, !dbg !490

for.inc12:                                        ; preds = %for.body7
  %inc13 = add i32 %i.1, 1, !dbg !491
    #dbg_value(i32 %inc13, !464, !DIExpression(), !437)
  br label %for.cond5, !dbg !492, !llvm.loop !493

for.end14:                                        ; preds = %for.cond5
  %inc15 = add i8 %nonce.1, 1, !dbg !495
    #dbg_value(i8 %inc15, !443, !DIExpression(), !437)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %epp, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !496
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %sp) #2, !dbg !497
    #dbg_value(i32 0, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !498

for.cond16:                                       ; preds = %for.inc21, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.inc21 ], !dbg !500
    #dbg_value(i32 %i.2, !464, !DIExpression(), !437)
  %cmp17 = icmp ult i32 %i.2, 2, !dbg !501
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !503

for.body18:                                       ; preds = %for.cond16
  %vec19 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !504
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec19, i32 0, i32 %i.2, !dbg !505
  %arrayidx20 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !506
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx, ptr noundef %arrayidx20, ptr noundef %sp) #2, !dbg !507
  br label %for.inc21, !dbg !507

for.inc21:                                        ; preds = %for.body18
  %inc22 = add i32 %i.2, 1, !dbg !508
    #dbg_value(i32 %inc22, !464, !DIExpression(), !437)
  br label %for.cond16, !dbg !509, !llvm.loop !510

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %v, ptr noundef %pkpv, ptr noundef %sp) #2, !dbg !512
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %b) #2, !dbg !513
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %v) #2, !dbg !514
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %b, ptr noundef %b, ptr noundef %ep) #2, !dbg !515
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %epp) #2, !dbg !516
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %k) #2, !dbg !517
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %b) #2, !dbg !518
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %v) #2, !dbg !519
  call void @pack_ciphertext(ptr noundef %c, ptr noundef %b, ptr noundef %v) #2, !dbg !520
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) #0 !dbg !522 {
entry:
    #dbg_value(ptr %pk, !525, !DIExpression(), !526)
    #dbg_value(ptr %seed, !527, !DIExpression(), !526)
    #dbg_value(ptr %packedpk, !528, !DIExpression(), !526)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #2, !dbg !529
  %add.ptr = getelementptr inbounds i8, ptr %packedpk, i32 768, !dbg !530
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef %add.ptr, i32 noundef 32) #2, !dbg !531
  ret void, !dbg !532
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) #0 !dbg !533 {
entry:
    #dbg_value(ptr %r, !537, !DIExpression(), !538)
    #dbg_value(ptr %b, !539, !DIExpression(), !538)
    #dbg_value(ptr %v, !540, !DIExpression(), !538)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #2, !dbg !541
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 640, !dbg !542
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %add.ptr, ptr noundef %v) #2, !dbg !543
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) #0 !dbg !545 {
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
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %b) #2, !dbg !562
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %mp, ptr noundef %skpv, ptr noundef %b) #2, !dbg !563
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %mp) #2, !dbg !564
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %mp, ptr noundef %v, ptr noundef %mp) #2, !dbg !565
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %mp) #2, !dbg !566
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef %mp) #2, !dbg !567
  ret void, !dbg !568
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #0 !dbg !569 {
entry:
    #dbg_value(ptr %b, !572, !DIExpression(), !573)
    #dbg_value(ptr %v, !574, !DIExpression(), !573)
    #dbg_value(ptr %c, !575, !DIExpression(), !573)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #2, !dbg !576
  %add.ptr = getelementptr inbounds i8, ptr %c, i32 640, !dbg !577
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %v, ptr noundef %add.ptr) #2, !dbg !578
  ret void, !dbg !579
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) #0 !dbg !580 {
entry:
    #dbg_value(ptr %sk, !583, !DIExpression(), !584)
    #dbg_value(ptr %packedsk, !585, !DIExpression(), !584)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #2, !dbg !586
  ret void, !dbg !587
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !588 {
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
  %cmp = icmp ult i32 %i.0, 2, !dbg !615
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
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !636
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
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !709 {
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
  %cmp = icmp ult i32 %i.0, 2, !dbg !722
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
  %arrayidx47 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !785
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
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !805 {
entry:
    #dbg_value(ptr %r, !806, !DIExpression(), !807)
    #dbg_value(ptr %a, !808, !DIExpression(), !807)
    #dbg_value(i32 0, !809, !DIExpression(), !807)
  br label %for.cond, !dbg !810

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !812
    #dbg_value(i32 %i.0, !809, !DIExpression(), !807)
  %cmp = icmp ult i32 %i.0, 2, !dbg !813
  br i1 %cmp, label %for.body, label %for.end, !dbg !815

for.body:                                         ; preds = %for.cond
  %mul = mul i32 %i.0, 384, !dbg !816
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !817
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !818
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !819
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #2, !dbg !820
  br label %for.inc, !dbg !820

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !821
    #dbg_value(i32 %inc, !809, !DIExpression(), !807)
  br label %for.cond, !dbg !822, !llvm.loop !823

for.end:                                          ; preds = %for.cond
  ret void, !dbg !825
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !826 {
entry:
    #dbg_value(ptr %r, !827, !DIExpression(), !828)
    #dbg_value(ptr %a, !829, !DIExpression(), !828)
    #dbg_value(i32 0, !830, !DIExpression(), !828)
  br label %for.cond, !dbg !831

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !833
    #dbg_value(i32 %i.0, !830, !DIExpression(), !828)
  %cmp = icmp ult i32 %i.0, 2, !dbg !834
  br i1 %cmp, label %for.body, label %for.end, !dbg !836

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !837
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !838
  %mul = mul i32 %i.0, 384, !dbg !839
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !840
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #2, !dbg !841
  br label %for.inc, !dbg !841

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !842
    #dbg_value(i32 %inc, !830, !DIExpression(), !828)
  br label %for.cond, !dbg !843, !llvm.loop !844

for.end:                                          ; preds = %for.cond
  ret void, !dbg !846
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) #0 !dbg !847 {
entry:
    #dbg_value(ptr %r, !850, !DIExpression(), !851)
    #dbg_value(i32 0, !852, !DIExpression(), !851)
  br label %for.cond, !dbg !853

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !855
    #dbg_value(i32 %i.0, !852, !DIExpression(), !851)
  %cmp = icmp ult i32 %i.0, 2, !dbg !856
  br i1 %cmp, label %for.body, label %for.end, !dbg !858

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !859
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !860
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #2, !dbg !861
  br label %for.inc, !dbg !861

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !862
    #dbg_value(i32 %inc, !852, !DIExpression(), !851)
  br label %for.cond, !dbg !863, !llvm.loop !864

for.end:                                          ; preds = %for.cond
  ret void, !dbg !866
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) #0 !dbg !867 {
entry:
    #dbg_value(ptr %r, !868, !DIExpression(), !869)
    #dbg_value(i32 0, !870, !DIExpression(), !869)
  br label %for.cond, !dbg !871

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !873
    #dbg_value(i32 %i.0, !870, !DIExpression(), !869)
  %cmp = icmp ult i32 %i.0, 2, !dbg !874
  br i1 %cmp, label %for.body, label %for.end, !dbg !876

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !877
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !878
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #2, !dbg !879
  br label %for.inc, !dbg !879

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !880
    #dbg_value(i32 %inc, !870, !DIExpression(), !869)
  br label %for.cond, !dbg !881, !llvm.loop !882

for.end:                                          ; preds = %for.cond
  ret void, !dbg !884
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !885 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !889, !DIExpression(), !890)
    #dbg_value(ptr %a, !891, !DIExpression(), !890)
    #dbg_value(ptr %b, !892, !DIExpression(), !890)
    #dbg_declare(ptr %t, !893, !DIExpression(), !894)
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !895
  %arrayidx = getelementptr inbounds [2 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !896
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !897
  %arrayidx2 = getelementptr inbounds [2 x %struct.poly], ptr %vec1, i32 0, i32 0, !dbg !898
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %arrayidx, ptr noundef %arrayidx2) #2, !dbg !899
    #dbg_value(i32 1, !900, !DIExpression(), !890)
  br label %for.cond, !dbg !901

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !903
    #dbg_value(i32 %i.0, !900, !DIExpression(), !890)
  %cmp = icmp ult i32 %i.0, 2, !dbg !904
  br i1 %cmp, label %for.body, label %for.end, !dbg !906

for.body:                                         ; preds = %for.cond
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !907
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !909
  %vec5 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !910
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec5, i32 0, i32 %i.0, !dbg !911
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %t, ptr noundef %arrayidx4, ptr noundef %arrayidx6) #2, !dbg !912
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef %t) #2, !dbg !913
  br label %for.inc, !dbg !914

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !915
    #dbg_value(i32 %inc, !900, !DIExpression(), !890)
  br label %for.cond, !dbg !916, !llvm.loop !917

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #2, !dbg !919
  ret void, !dbg !920
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) #0 !dbg !921 {
entry:
    #dbg_value(ptr %r, !922, !DIExpression(), !923)
    #dbg_value(i32 0, !924, !DIExpression(), !923)
  br label %for.cond, !dbg !925

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !927
    #dbg_value(i32 %i.0, !924, !DIExpression(), !923)
  %cmp = icmp ult i32 %i.0, 2, !dbg !928
  br i1 %cmp, label %for.body, label %for.end, !dbg !930

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !931
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !932
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #2, !dbg !933
  br label %for.inc, !dbg !933

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !934
    #dbg_value(i32 %inc, !924, !DIExpression(), !923)
  br label %for.cond, !dbg !935, !llvm.loop !936

for.end:                                          ; preds = %for.cond
  ret void, !dbg !938
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !939 {
entry:
    #dbg_value(ptr %r, !942, !DIExpression(), !943)
    #dbg_value(ptr %a, !944, !DIExpression(), !943)
    #dbg_value(ptr %b, !945, !DIExpression(), !943)
    #dbg_value(i32 0, !946, !DIExpression(), !943)
  br label %for.cond, !dbg !947

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !949
    #dbg_value(i32 %i.0, !946, !DIExpression(), !943)
  %cmp = icmp ult i32 %i.0, 2, !dbg !950
  br i1 %cmp, label %for.body, label %for.end, !dbg !952

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !953
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !954
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !955
  %arrayidx2 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec1, i32 0, i32 %i.0, !dbg !956
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !957
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !958
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #2, !dbg !959
  br label %for.inc, !dbg !959

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !960
    #dbg_value(i32 %inc, !946, !DIExpression(), !943)
  br label %for.cond, !dbg !961, !llvm.loop !962

for.end:                                          ; preds = %for.cond
  ret void, !dbg !964
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !965 {
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
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !1054 {
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
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1100 {
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
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1159 {
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
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) #0 !dbg !1210 {
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
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #2, !dbg !1244
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
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) #0 !dbg !1256 {
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
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1302 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1305, !DIExpression(), !1306)
    #dbg_value(ptr %seed, !1307, !DIExpression(), !1306)
    #dbg_value(i8 %nonce, !1308, !DIExpression(), !1306)
    #dbg_declare(ptr %buf, !1309, !DIExpression(), !1313)
  %arraydecay = getelementptr inbounds [192 x i8], ptr %buf, i32 0, i32 0, !dbg !1314
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1314
  %arraydecay1 = getelementptr inbounds [192 x i8], ptr %buf, i32 0, i32 0, !dbg !1315
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1316
  ret void, !dbg !1317
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1318 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1319, !DIExpression(), !1320)
    #dbg_value(ptr %seed, !1321, !DIExpression(), !1320)
    #dbg_value(i8 %nonce, !1322, !DIExpression(), !1320)
    #dbg_declare(ptr %buf, !1323, !DIExpression(), !1325)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1326
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1326
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1327
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1328
  ret void, !dbg !1329
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) #0 !dbg !1330 {
entry:
    #dbg_value(ptr %r, !1333, !DIExpression(), !1334)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1335
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1336
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %arraydecay) #2, !dbg !1337
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #2, !dbg !1338
  ret void, !dbg !1339
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #0 !dbg !1340 {
entry:
    #dbg_value(ptr %r, !1341, !DIExpression(), !1342)
    #dbg_value(i32 0, !1343, !DIExpression(), !1342)
  br label %for.cond, !dbg !1344

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1346
    #dbg_value(i32 %i.0, !1343, !DIExpression(), !1342)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1347
  br i1 %cmp, label %for.body, label %for.end, !dbg !1349

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1350
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1351
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1351
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #2, !dbg !1352
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1353
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1354
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1355
  br label %for.inc, !dbg !1354

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1356
    #dbg_value(i32 %inc, !1343, !DIExpression(), !1342)
  br label %for.cond, !dbg !1357, !llvm.loop !1358

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1360
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) #0 !dbg !1361 {
entry:
    #dbg_value(ptr %r, !1362, !DIExpression(), !1363)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1364
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1365
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %arraydecay) #2, !dbg !1366
  ret void, !dbg !1367
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1368 {
entry:
    #dbg_value(ptr %r, !1371, !DIExpression(), !1372)
    #dbg_value(ptr %a, !1373, !DIExpression(), !1372)
    #dbg_value(ptr %b, !1374, !DIExpression(), !1372)
    #dbg_value(i32 0, !1375, !DIExpression(), !1372)
  br label %for.cond, !dbg !1376

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1378
    #dbg_value(i32 %i.0, !1375, !DIExpression(), !1372)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1379
  br i1 %cmp, label %for.body, label %for.end, !dbg !1381

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1382
  %mul = mul i32 4, %i.0, !dbg !1384
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1385
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1386
  %mul2 = mul i32 4, %i.0, !dbg !1387
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %mul2, !dbg !1388
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1389
  %mul5 = mul i32 4, %i.0, !dbg !1390
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs4, i32 0, i32 %mul5, !dbg !1391
  %add = add i32 64, %i.0, !dbg !1392
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1393
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1393
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #2, !dbg !1394
  %coeffs8 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1395
  %mul9 = mul i32 4, %i.0, !dbg !1396
  %add10 = add i32 %mul9, 2, !dbg !1397
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %coeffs8, i32 0, i32 %add10, !dbg !1398
  %coeffs12 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1399
  %mul13 = mul i32 4, %i.0, !dbg !1400
  %add14 = add i32 %mul13, 2, !dbg !1401
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %coeffs12, i32 0, i32 %add14, !dbg !1402
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1403
  %mul17 = mul i32 4, %i.0, !dbg !1404
  %add18 = add i32 %mul17, 2, !dbg !1405
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1406
  %add20 = add i32 64, %i.0, !dbg !1407
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add20, !dbg !1408
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1408
  %conv = sext i16 %1 to i32, !dbg !1408
  %sub = sub nsw i32 0, %conv, !dbg !1409
  %conv22 = trunc i32 %sub to i16, !dbg !1409
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx11, ptr noundef %arrayidx15, ptr noundef %arrayidx19, i16 noundef signext %conv22) #2, !dbg !1410
  br label %for.inc, !dbg !1411

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1412
    #dbg_value(i32 %inc, !1375, !DIExpression(), !1372)
  br label %for.cond, !dbg !1413, !llvm.loop !1414

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1416
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) #0 !dbg !1417 {
entry:
    #dbg_value(ptr %r, !1418, !DIExpression(), !1419)
    #dbg_value(i16 1353, !1420, !DIExpression(), !1419)
    #dbg_value(i32 0, !1421, !DIExpression(), !1419)
  br label %for.cond, !dbg !1422

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1424
    #dbg_value(i32 %i.0, !1421, !DIExpression(), !1419)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1425
  br i1 %cmp, label %for.body, label %for.end, !dbg !1427

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1428
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1429
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1429
  %conv = sext i16 %0 to i32, !dbg !1430
  %mul = mul nsw i32 %conv, 1353, !dbg !1431
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1432
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1433
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1434
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1435
  br label %for.inc, !dbg !1434

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1436
    #dbg_value(i32 %inc, !1421, !DIExpression(), !1419)
  br label %for.cond, !dbg !1437, !llvm.loop !1438

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1440
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1441 {
entry:
    #dbg_value(ptr %r, !1442, !DIExpression(), !1443)
    #dbg_value(ptr %a, !1444, !DIExpression(), !1443)
    #dbg_value(ptr %b, !1445, !DIExpression(), !1443)
    #dbg_value(i32 0, !1446, !DIExpression(), !1443)
  br label %for.cond, !dbg !1447

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1449
    #dbg_value(i32 %i.0, !1446, !DIExpression(), !1443)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1450
  br i1 %cmp, label %for.body, label %for.end, !dbg !1452

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1453
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1454
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1454
  %conv = sext i16 %0 to i32, !dbg !1454
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1455
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1456
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1456
  %conv3 = sext i16 %1 to i32, !dbg !1456
  %add = add nsw i32 %conv, %conv3, !dbg !1457
  %conv4 = trunc i32 %add to i16, !dbg !1454
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1458
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1459
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1460
  br label %for.inc, !dbg !1459

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1461
    #dbg_value(i32 %inc, !1446, !DIExpression(), !1443)
  br label %for.cond, !dbg !1462, !llvm.loop !1463

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1465
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1466 {
entry:
    #dbg_value(ptr %r, !1467, !DIExpression(), !1468)
    #dbg_value(ptr %a, !1469, !DIExpression(), !1468)
    #dbg_value(ptr %b, !1470, !DIExpression(), !1468)
    #dbg_value(i32 0, !1471, !DIExpression(), !1468)
  br label %for.cond, !dbg !1472

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1474
    #dbg_value(i32 %i.0, !1471, !DIExpression(), !1468)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1475
  br i1 %cmp, label %for.body, label %for.end, !dbg !1477

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1478
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1479
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1479
  %conv = sext i16 %0 to i32, !dbg !1479
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1480
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1481
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1481
  %conv3 = sext i16 %1 to i32, !dbg !1481
  %sub = sub nsw i32 %conv, %conv3, !dbg !1482
  %conv4 = trunc i32 %sub to i16, !dbg !1479
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1483
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1484
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1485
  br label %for.inc, !dbg !1484

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1486
    #dbg_value(i32 %inc, !1471, !DIExpression(), !1468)
  br label %for.cond, !dbg !1487, !llvm.loop !1488

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1490
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #0 !dbg !1491 {
entry:
    #dbg_value(ptr %r, !1494, !DIExpression(), !1495)
    #dbg_value(i32 1, !1496, !DIExpression(), !1495)
    #dbg_value(i32 128, !1497, !DIExpression(), !1495)
  br label %for.cond, !dbg !1498

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1500
  %k.0 = phi i32 [ 1, %entry ], [ %k.1, %for.inc24 ], !dbg !1501
    #dbg_value(i32 %k.0, !1496, !DIExpression(), !1495)
    #dbg_value(i32 %len.0, !1497, !DIExpression(), !1495)
  %cmp = icmp uge i32 %len.0, 2, !dbg !1502
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1504

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1505, !DIExpression(), !1495)
  br label %for.cond1, !dbg !1506

for.cond1:                                        ; preds = %for.inc21, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add22, %for.inc21 ], !dbg !1509
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc21 ], !dbg !1495
    #dbg_value(i32 %k.1, !1496, !DIExpression(), !1495)
    #dbg_value(i32 %start.0, !1505, !DIExpression(), !1495)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1510
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !1512

for.body3:                                        ; preds = %for.cond1
  %inc = add i32 %k.1, 1, !dbg !1513
    #dbg_value(i32 %inc, !1496, !DIExpression(), !1495)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1515
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1515
    #dbg_value(i16 %0, !1516, !DIExpression(), !1495)
    #dbg_value(i32 %start.0, !1517, !DIExpression(), !1495)
  br label %for.cond4, !dbg !1518

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.inc ], !dbg !1520
    #dbg_value(i32 %j.0, !1517, !DIExpression(), !1495)
  %add = add i32 %start.0, %len.0, !dbg !1521
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1523
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1524

for.body6:                                        ; preds = %for.cond4
  %add7 = add i32 %j.0, %len.0, !dbg !1525
  %arrayidx8 = getelementptr inbounds nuw i16, ptr %r, i32 %add7, !dbg !1527
  %1 = load i16, ptr %arrayidx8, align 2, !dbg !1527
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1528
    #dbg_value(i16 %call, !1529, !DIExpression(), !1495)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1530
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1530
  %conv = sext i16 %2 to i32, !dbg !1530
  %conv10 = sext i16 %call to i32, !dbg !1531
  %sub = sub nsw i32 %conv, %conv10, !dbg !1532
  %conv11 = trunc i32 %sub to i16, !dbg !1530
  %add12 = add i32 %j.0, %len.0, !dbg !1533
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %add12, !dbg !1534
  store i16 %conv11, ptr %arrayidx13, align 2, !dbg !1535
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1536
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !1536
  %conv15 = sext i16 %3 to i32, !dbg !1536
  %conv16 = sext i16 %call to i32, !dbg !1537
  %add17 = add nsw i32 %conv15, %conv16, !dbg !1538
  %conv18 = trunc i32 %add17 to i16, !dbg !1536
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1539
  store i16 %conv18, ptr %arrayidx19, align 2, !dbg !1540
  br label %for.inc, !dbg !1541

for.inc:                                          ; preds = %for.body6
  %inc20 = add i32 %j.0, 1, !dbg !1542
    #dbg_value(i32 %inc20, !1517, !DIExpression(), !1495)
  br label %for.cond4, !dbg !1543, !llvm.loop !1544

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !1546

for.inc21:                                        ; preds = %for.end
  %add22 = add i32 %j.0, %len.0, !dbg !1547
    #dbg_value(i32 %add22, !1505, !DIExpression(), !1495)
  br label %for.cond1, !dbg !1548, !llvm.loop !1549

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !1551

for.inc24:                                        ; preds = %for.end23
  %shr = lshr i32 %len.0, 1, !dbg !1552
    #dbg_value(i32 %shr, !1497, !DIExpression(), !1495)
  br label %for.cond, !dbg !1553, !llvm.loop !1554

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1556
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) #0 !dbg !1557 {
entry:
    #dbg_value(i16 %a, !1560, !DIExpression(), !1561)
    #dbg_value(i16 %b, !1562, !DIExpression(), !1561)
  %conv = sext i16 %a to i32, !dbg !1563
  %conv1 = sext i16 %b to i32, !dbg !1564
  %mul = mul nsw i32 %conv, %conv1, !dbg !1565
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1566
  ret i16 %call, !dbg !1567
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #0 !dbg !1568 {
entry:
    #dbg_value(ptr %r, !1569, !DIExpression(), !1570)
    #dbg_value(i16 1441, !1571, !DIExpression(), !1570)
    #dbg_value(i32 127, !1572, !DIExpression(), !1570)
    #dbg_value(i32 2, !1573, !DIExpression(), !1570)
  br label %for.cond, !dbg !1574

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1576
  %k.0 = phi i32 [ 127, %entry ], [ %k.1, %for.inc29 ], !dbg !1577
    #dbg_value(i32 %k.0, !1572, !DIExpression(), !1570)
    #dbg_value(i32 %len.0, !1573, !DIExpression(), !1570)
  %cmp = icmp ule i32 %len.0, 128, !dbg !1578
  br i1 %cmp, label %for.body, label %for.end30, !dbg !1580

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1581, !DIExpression(), !1570)
  br label %for.cond1, !dbg !1582

for.cond1:                                        ; preds = %for.inc26, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add27, %for.inc26 ], !dbg !1585
  %k.1 = phi i32 [ %k.0, %for.body ], [ %dec, %for.inc26 ], !dbg !1570
    #dbg_value(i32 %k.1, !1572, !DIExpression(), !1570)
    #dbg_value(i32 %start.0, !1581, !DIExpression(), !1570)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1586
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !1588

for.body3:                                        ; preds = %for.cond1
  %dec = add i32 %k.1, -1, !dbg !1589
    #dbg_value(i32 %dec, !1572, !DIExpression(), !1570)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1591
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1591
    #dbg_value(i16 %0, !1592, !DIExpression(), !1570)
    #dbg_value(i32 %start.0, !1593, !DIExpression(), !1570)
  br label %for.cond4, !dbg !1594

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.inc ], !dbg !1596
    #dbg_value(i32 %j.0, !1593, !DIExpression(), !1570)
  %add = add i32 %start.0, %len.0, !dbg !1597
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1599
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1600

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1601
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1601
    #dbg_value(i16 %1, !1603, !DIExpression(), !1570)
  %conv = sext i16 %1 to i32, !dbg !1604
  %add8 = add i32 %j.0, %len.0, !dbg !1605
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %add8, !dbg !1606
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1606
  %conv10 = sext i16 %2 to i32, !dbg !1606
  %add11 = add nsw i32 %conv, %conv10, !dbg !1607
  %conv12 = trunc i32 %add11 to i16, !dbg !1604
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %conv12) #2, !dbg !1608
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1609
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1610
  %add14 = add i32 %j.0, %len.0, !dbg !1611
  %arrayidx15 = getelementptr inbounds nuw i16, ptr %r, i32 %add14, !dbg !1612
  %3 = load i16, ptr %arrayidx15, align 2, !dbg !1612
  %conv16 = sext i16 %3 to i32, !dbg !1612
  %conv17 = sext i16 %1 to i32, !dbg !1613
  %sub = sub nsw i32 %conv16, %conv17, !dbg !1614
  %conv18 = trunc i32 %sub to i16, !dbg !1612
  %add19 = add i32 %j.0, %len.0, !dbg !1615
  %arrayidx20 = getelementptr inbounds nuw i16, ptr %r, i32 %add19, !dbg !1616
  store i16 %conv18, ptr %arrayidx20, align 2, !dbg !1617
  %add21 = add i32 %j.0, %len.0, !dbg !1618
  %arrayidx22 = getelementptr inbounds nuw i16, ptr %r, i32 %add21, !dbg !1619
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !1619
  %call23 = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %4) #2, !dbg !1620
  %add24 = add i32 %j.0, %len.0, !dbg !1621
  %arrayidx25 = getelementptr inbounds nuw i16, ptr %r, i32 %add24, !dbg !1622
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1623
  br label %for.inc, !dbg !1624

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %j.0, 1, !dbg !1625
    #dbg_value(i32 %inc, !1593, !DIExpression(), !1570)
  br label %for.cond4, !dbg !1626, !llvm.loop !1627

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !1629

for.inc26:                                        ; preds = %for.end
  %add27 = add i32 %j.0, %len.0, !dbg !1630
    #dbg_value(i32 %add27, !1581, !DIExpression(), !1570)
  br label %for.cond1, !dbg !1631, !llvm.loop !1632

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !1634

for.inc29:                                        ; preds = %for.end28
  %shl = shl i32 %len.0, 1, !dbg !1635
    #dbg_value(i32 %shl, !1573, !DIExpression(), !1570)
  br label %for.cond, !dbg !1636, !llvm.loop !1637

for.end30:                                        ; preds = %for.cond
    #dbg_value(i32 0, !1593, !DIExpression(), !1570)
  br label %for.cond31, !dbg !1639

for.cond31:                                       ; preds = %for.inc38, %for.end30
  %j.1 = phi i32 [ 0, %for.end30 ], [ %inc39, %for.inc38 ], !dbg !1641
    #dbg_value(i32 %j.1, !1593, !DIExpression(), !1570)
  %cmp32 = icmp ult i32 %j.1, 256, !dbg !1642
  br i1 %cmp32, label %for.body34, label %for.end40, !dbg !1644

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1645
  %5 = load i16, ptr %arrayidx35, align 2, !dbg !1645
  %call36 = call signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext 1441) #2, !dbg !1646
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1647
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1648
  br label %for.inc38, !dbg !1647

for.inc38:                                        ; preds = %for.body34
  %inc39 = add i32 %j.1, 1, !dbg !1649
    #dbg_value(i32 %inc39, !1593, !DIExpression(), !1570)
  br label %for.cond31, !dbg !1650, !llvm.loop !1651

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1653
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) #0 !dbg !1654 {
entry:
    #dbg_value(ptr %r, !1658, !DIExpression(), !1659)
    #dbg_value(ptr %a, !1660, !DIExpression(), !1659)
    #dbg_value(ptr %b, !1661, !DIExpression(), !1659)
    #dbg_value(i16 %zeta, !1662, !DIExpression(), !1659)
  %arrayidx = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1663
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1663
  %arrayidx1 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1664
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1664
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1665
  %arrayidx2 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1666
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1667
  %arrayidx3 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1668
  %2 = load i16, ptr %arrayidx3, align 2, !dbg !1668
  %call4 = call signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %zeta) #2, !dbg !1669
  %arrayidx5 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1670
  store i16 %call4, ptr %arrayidx5, align 2, !dbg !1671
  %arrayidx6 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1672
  %3 = load i16, ptr %arrayidx6, align 2, !dbg !1672
  %arrayidx7 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1673
  %4 = load i16, ptr %arrayidx7, align 2, !dbg !1673
  %call8 = call signext i16 @fqmul(i16 noundef signext %3, i16 noundef signext %4) #2, !dbg !1674
  %conv = sext i16 %call8 to i32, !dbg !1674
  %arrayidx9 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1675
  %5 = load i16, ptr %arrayidx9, align 2, !dbg !1676
  %conv10 = sext i16 %5 to i32, !dbg !1676
  %add = add nsw i32 %conv10, %conv, !dbg !1676
  %conv11 = trunc i32 %add to i16, !dbg !1676
  store i16 %conv11, ptr %arrayidx9, align 2, !dbg !1676
  %arrayidx12 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1677
  %6 = load i16, ptr %arrayidx12, align 2, !dbg !1677
  %arrayidx13 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1678
  %7 = load i16, ptr %arrayidx13, align 2, !dbg !1678
  %call14 = call signext i16 @fqmul(i16 noundef signext %6, i16 noundef signext %7) #2, !dbg !1679
  %arrayidx15 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1680
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1681
  %arrayidx16 = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1682
  %8 = load i16, ptr %arrayidx16, align 2, !dbg !1682
  %arrayidx17 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1683
  %9 = load i16, ptr %arrayidx17, align 2, !dbg !1683
  %call18 = call signext i16 @fqmul(i16 noundef signext %8, i16 noundef signext %9) #2, !dbg !1684
  %conv19 = sext i16 %call18 to i32, !dbg !1684
  %arrayidx20 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1685
  %10 = load i16, ptr %arrayidx20, align 2, !dbg !1686
  %conv21 = sext i16 %10 to i32, !dbg !1686
  %add22 = add nsw i32 %conv21, %conv19, !dbg !1686
  %conv23 = trunc i32 %add22 to i16, !dbg !1686
  store i16 %conv23, ptr %arrayidx20, align 2, !dbg !1686
  ret void, !dbg !1687
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) #0 !dbg !1688 {
entry:
    #dbg_value(ptr %r, !1697, !DIExpression(), !1698)
    #dbg_value(ptr %buf, !1699, !DIExpression(), !1698)
  call void @cbd3(ptr noundef %r, ptr noundef %buf) #2, !dbg !1700
  ret void, !dbg !1701
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd3(ptr noundef %r, ptr noundef %buf) #0 !dbg !1702 {
entry:
    #dbg_value(ptr %r, !1703, !DIExpression(), !1704)
    #dbg_value(ptr %buf, !1705, !DIExpression(), !1704)
    #dbg_value(i32 0, !1706, !DIExpression(), !1704)
  br label %for.cond, !dbg !1707

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1709
    #dbg_value(i32 %i.0, !1706, !DIExpression(), !1704)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1710
  br i1 %cmp, label %for.body, label %for.end24, !dbg !1712

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1713
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1715
  %call = call i32 @load24_littleendian(ptr noundef %add.ptr) #2, !dbg !1716
    #dbg_value(i32 %call, !1717, !DIExpression(), !1704)
  %and = and i32 %call, 2396745, !dbg !1718
    #dbg_value(i32 %and, !1719, !DIExpression(), !1704)
  %shr = lshr i32 %call, 1, !dbg !1720
  %and1 = and i32 %shr, 2396745, !dbg !1721
  %add = add i32 %and, %and1, !dbg !1722
    #dbg_value(i32 %add, !1719, !DIExpression(), !1704)
  %shr2 = lshr i32 %call, 2, !dbg !1723
  %and3 = and i32 %shr2, 2396745, !dbg !1724
  %add4 = add i32 %add, %and3, !dbg !1725
    #dbg_value(i32 %add4, !1719, !DIExpression(), !1704)
    #dbg_value(i32 0, !1726, !DIExpression(), !1704)
  br label %for.cond5, !dbg !1727

for.cond5:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1729
    #dbg_value(i32 %j.0, !1726, !DIExpression(), !1704)
  %cmp6 = icmp ult i32 %j.0, 4, !dbg !1730
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !1732

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul i32 6, %j.0, !dbg !1733
  %add9 = add i32 %mul8, 0, !dbg !1735
  %shr10 = lshr i32 %add4, %add9, !dbg !1736
  %and11 = and i32 %shr10, 7, !dbg !1737
  %conv = trunc i32 %and11 to i16, !dbg !1738
    #dbg_value(i16 %conv, !1739, !DIExpression(), !1704)
  %mul12 = mul i32 6, %j.0, !dbg !1740
  %add13 = add i32 %mul12, 3, !dbg !1741
  %shr14 = lshr i32 %add4, %add13, !dbg !1742
  %and15 = and i32 %shr14, 7, !dbg !1743
  %conv16 = trunc i32 %and15 to i16, !dbg !1744
    #dbg_value(i16 %conv16, !1745, !DIExpression(), !1704)
  %conv17 = sext i16 %conv to i32, !dbg !1746
  %conv18 = sext i16 %conv16 to i32, !dbg !1747
  %sub = sub nsw i32 %conv17, %conv18, !dbg !1748
  %conv19 = trunc i32 %sub to i16, !dbg !1746
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1749
  %mul20 = mul i32 4, %i.0, !dbg !1750
  %add21 = add i32 %mul20, %j.0, !dbg !1751
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add21, !dbg !1752
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1753
  br label %for.inc, !dbg !1754

for.inc:                                          ; preds = %for.body7
  %inc = add i32 %j.0, 1, !dbg !1755
    #dbg_value(i32 %inc, !1726, !DIExpression(), !1704)
  br label %for.cond5, !dbg !1756, !llvm.loop !1757

for.end:                                          ; preds = %for.cond5
  br label %for.inc22, !dbg !1759

for.inc22:                                        ; preds = %for.end
  %inc23 = add i32 %i.0, 1, !dbg !1760
    #dbg_value(i32 %inc23, !1706, !DIExpression(), !1704)
  br label %for.cond, !dbg !1761, !llvm.loop !1762

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !1764
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load24_littleendian(ptr noundef %x) #0 !dbg !1765 {
entry:
    #dbg_value(ptr %x, !1768, !DIExpression(), !1769)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !1770
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1770
  %conv = zext i8 %0 to i32, !dbg !1771
    #dbg_value(i32 %conv, !1772, !DIExpression(), !1769)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !1773
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1773
  %conv2 = zext i8 %1 to i32, !dbg !1774
  %shl = shl i32 %conv2, 8, !dbg !1775
  %or = or i32 %conv, %shl, !dbg !1776
    #dbg_value(i32 %or, !1772, !DIExpression(), !1769)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !1777
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1777
  %conv4 = zext i8 %2 to i32, !dbg !1778
  %shl5 = shl i32 %conv4, 16, !dbg !1779
  %or6 = or i32 %or, %shl5, !dbg !1780
    #dbg_value(i32 %or6, !1772, !DIExpression(), !1769)
  ret i32 %or6, !dbg !1781
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1782 {
entry:
    #dbg_value(ptr %r, !1783, !DIExpression(), !1784)
    #dbg_value(ptr %buf, !1785, !DIExpression(), !1784)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !1786
  ret void, !dbg !1787
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd2(ptr noundef %r, ptr noundef %buf) #0 !dbg !1788 {
entry:
    #dbg_value(ptr %r, !1789, !DIExpression(), !1790)
    #dbg_value(ptr %buf, !1791, !DIExpression(), !1790)
    #dbg_value(i32 0, !1792, !DIExpression(), !1790)
  br label %for.cond, !dbg !1793

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1795
    #dbg_value(i32 %i.0, !1792, !DIExpression(), !1790)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1796
  br i1 %cmp, label %for.body, label %for.end21, !dbg !1798

for.body:                                         ; preds = %for.cond
  %mul = mul i32 4, %i.0, !dbg !1799
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1801
  %call = call i32 @load32_littleendian(ptr noundef %add.ptr) #2, !dbg !1802
    #dbg_value(i32 %call, !1803, !DIExpression(), !1790)
  %and = and i32 %call, 1431655765, !dbg !1804
    #dbg_value(i32 %and, !1805, !DIExpression(), !1790)
  %shr = lshr i32 %call, 1, !dbg !1806
  %and1 = and i32 %shr, 1431655765, !dbg !1807
  %add = add i32 %and, %and1, !dbg !1808
    #dbg_value(i32 %add, !1805, !DIExpression(), !1790)
    #dbg_value(i32 0, !1809, !DIExpression(), !1790)
  br label %for.cond2, !dbg !1810

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1812
    #dbg_value(i32 %j.0, !1809, !DIExpression(), !1790)
  %cmp3 = icmp ult i32 %j.0, 8, !dbg !1813
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !1815

for.body4:                                        ; preds = %for.cond2
  %mul5 = mul i32 4, %j.0, !dbg !1816
  %add6 = add i32 %mul5, 0, !dbg !1818
  %shr7 = lshr i32 %add, %add6, !dbg !1819
  %and8 = and i32 %shr7, 3, !dbg !1820
  %conv = trunc i32 %and8 to i16, !dbg !1821
    #dbg_value(i16 %conv, !1822, !DIExpression(), !1790)
  %mul9 = mul i32 4, %j.0, !dbg !1823
  %add10 = add i32 %mul9, 2, !dbg !1824
  %shr11 = lshr i32 %add, %add10, !dbg !1825
  %and12 = and i32 %shr11, 3, !dbg !1826
  %conv13 = trunc i32 %and12 to i16, !dbg !1827
    #dbg_value(i16 %conv13, !1828, !DIExpression(), !1790)
  %conv14 = sext i16 %conv to i32, !dbg !1829
  %conv15 = sext i16 %conv13 to i32, !dbg !1830
  %sub = sub nsw i32 %conv14, %conv15, !dbg !1831
  %conv16 = trunc i32 %sub to i16, !dbg !1829
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1832
  %mul17 = mul i32 8, %i.0, !dbg !1833
  %add18 = add i32 %mul17, %j.0, !dbg !1834
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add18, !dbg !1835
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1836
  br label %for.inc, !dbg !1837

for.inc:                                          ; preds = %for.body4
  %inc = add i32 %j.0, 1, !dbg !1838
    #dbg_value(i32 %inc, !1809, !DIExpression(), !1790)
  br label %for.cond2, !dbg !1839, !llvm.loop !1840

for.end:                                          ; preds = %for.cond2
  br label %for.inc19, !dbg !1842

for.inc19:                                        ; preds = %for.end
  %inc20 = add i32 %i.0, 1, !dbg !1843
    #dbg_value(i32 %inc20, !1792, !DIExpression(), !1790)
  br label %for.cond, !dbg !1844, !llvm.loop !1845

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1847
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load32_littleendian(ptr noundef %x) #0 !dbg !1848 {
entry:
    #dbg_value(ptr %x, !1849, !DIExpression(), !1850)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !1851
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1851
  %conv = zext i8 %0 to i32, !dbg !1852
    #dbg_value(i32 %conv, !1853, !DIExpression(), !1850)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !1854
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1854
  %conv2 = zext i8 %1 to i32, !dbg !1855
  %shl = shl i32 %conv2, 8, !dbg !1856
  %or = or i32 %conv, %shl, !dbg !1857
    #dbg_value(i32 %or, !1853, !DIExpression(), !1850)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !1858
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1858
  %conv4 = zext i8 %2 to i32, !dbg !1859
  %shl5 = shl i32 %conv4, 16, !dbg !1860
  %or6 = or i32 %or, %shl5, !dbg !1861
    #dbg_value(i32 %or6, !1853, !DIExpression(), !1850)
  %arrayidx7 = getelementptr inbounds i8, ptr %x, i32 3, !dbg !1862
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1862
  %conv8 = zext i8 %3 to i32, !dbg !1863
  %shl9 = shl i32 %conv8, 24, !dbg !1864
  %or10 = or i32 %or6, %shl9, !dbg !1865
    #dbg_value(i32 %or10, !1853, !DIExpression(), !1850)
  ret i32 %or10, !dbg !1866
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) #0 !dbg !1867 {
entry:
    #dbg_value(i32 %a, !1870, !DIExpression(), !1871)
  %conv = trunc i32 %a to i16, !dbg !1872
  %conv1 = sext i16 %conv to i32, !dbg !1872
  %mul = mul nsw i32 %conv1, -3327, !dbg !1873
  %conv2 = trunc i32 %mul to i16, !dbg !1872
    #dbg_value(i16 %conv2, !1874, !DIExpression(), !1871)
  %conv3 = sext i16 %conv2 to i32, !dbg !1875
  %mul4 = mul nsw i32 %conv3, 3329, !dbg !1876
  %sub = sub nsw i32 %a, %mul4, !dbg !1877
  %shr = ashr i32 %sub, 16, !dbg !1878
  %conv5 = trunc i32 %shr to i16, !dbg !1879
    #dbg_value(i16 %conv5, !1874, !DIExpression(), !1871)
  ret i16 %conv5, !dbg !1880
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) #0 !dbg !1881 {
entry:
    #dbg_value(i16 %a, !1884, !DIExpression(), !1885)
    #dbg_value(i16 20159, !1886, !DIExpression(), !1885)
  %conv = sext i16 %a to i32, !dbg !1887
  %mul = mul nsw i32 20159, %conv, !dbg !1888
  %add = add nsw i32 %mul, 33554432, !dbg !1889
  %shr = ashr i32 %add, 26, !dbg !1890
  %conv1 = trunc i32 %shr to i16, !dbg !1891
    #dbg_value(i16 %conv1, !1892, !DIExpression(), !1885)
  %conv2 = sext i16 %conv1 to i32, !dbg !1893
  %mul3 = mul nsw i32 %conv2, 3329, !dbg !1893
  %conv4 = trunc i32 %mul3 to i16, !dbg !1893
    #dbg_value(i16 %conv4, !1892, !DIExpression(), !1885)
  %conv5 = sext i16 %a to i32, !dbg !1894
  %conv6 = sext i16 %conv4 to i32, !dbg !1895
  %sub = sub nsw i32 %conv5, %conv6, !dbg !1896
  %conv7 = trunc i32 %sub to i16, !dbg !1894
  ret i16 %conv7, !dbg !1897
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) #0 !dbg !1898 {
entry:
    #dbg_value(ptr %a, !1904, !DIExpression(), !1905)
    #dbg_value(ptr %b, !1906, !DIExpression(), !1905)
    #dbg_value(i32 %len, !1907, !DIExpression(), !1905)
    #dbg_value(i8 0, !1908, !DIExpression(), !1905)
    #dbg_value(i32 0, !1909, !DIExpression(), !1905)
  br label %for.cond, !dbg !1910

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1912
  %r.0 = phi i8 [ 0, %entry ], [ %conv4, %for.inc ], !dbg !1905
    #dbg_value(i8 %r.0, !1908, !DIExpression(), !1905)
    #dbg_value(i32 %i.0, !1909, !DIExpression(), !1905)
  %cmp = icmp ult i32 %i.0, %len, !dbg !1913
  br i1 %cmp, label %for.body, label %for.end, !dbg !1915

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1916
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1916
  %conv = zext i8 %0 to i32, !dbg !1916
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1917
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1917
  %conv2 = zext i8 %1 to i32, !dbg !1917
  %xor = xor i32 %conv, %conv2, !dbg !1918
  %conv3 = zext i8 %r.0 to i32, !dbg !1919
  %or = or i32 %conv3, %xor, !dbg !1919
  %conv4 = trunc i32 %or to i8, !dbg !1919
    #dbg_value(i8 %conv4, !1908, !DIExpression(), !1905)
  br label %for.inc, !dbg !1920

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1921
    #dbg_value(i32 %inc, !1909, !DIExpression(), !1905)
  br label %for.cond, !dbg !1922, !llvm.loop !1923

for.end:                                          ; preds = %for.cond
  %conv5 = zext i8 %r.0 to i64, !dbg !1925
  %sub = sub i64 0, %conv5, !dbg !1926
  %shr = lshr i64 %sub, 63, !dbg !1927
  %conv6 = trunc i64 %shr to i32, !dbg !1928
  ret i32 %conv6, !dbg !1929
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) #0 !dbg !1930 {
entry:
    #dbg_value(ptr %r, !1933, !DIExpression(), !1934)
    #dbg_value(ptr %x, !1935, !DIExpression(), !1934)
    #dbg_value(i32 %len, !1936, !DIExpression(), !1934)
    #dbg_value(i8 %b, !1937, !DIExpression(), !1934)
  %0 = call i8 asm "", "=r,0"(i8 %b) #3, !dbg !1938, !srcloc !1939
    #dbg_value(i8 %0, !1937, !DIExpression(), !1934)
  %conv = zext i8 %0 to i32, !dbg !1940
  %sub = sub nsw i32 0, %conv, !dbg !1941
  %conv1 = trunc i32 %sub to i8, !dbg !1941
    #dbg_value(i8 %conv1, !1937, !DIExpression(), !1934)
    #dbg_value(i32 0, !1942, !DIExpression(), !1934)
  br label %for.cond, !dbg !1943

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1945
    #dbg_value(i32 %i.0, !1942, !DIExpression(), !1934)
  %cmp = icmp ult i32 %i.0, %len, !dbg !1946
  br i1 %cmp, label %for.body, label %for.end, !dbg !1948

for.body:                                         ; preds = %for.cond
  %conv3 = zext i8 %conv1 to i32, !dbg !1949
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1950
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1950
  %conv4 = zext i8 %1 to i32, !dbg !1950
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1951
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1951
  %conv6 = zext i8 %2 to i32, !dbg !1951
  %xor = xor i32 %conv4, %conv6, !dbg !1952
  %and = and i32 %conv3, %xor, !dbg !1953
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1954
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1955
  %conv8 = zext i8 %3 to i32, !dbg !1955
  %xor9 = xor i32 %conv8, %and, !dbg !1955
  %conv10 = trunc i32 %xor9 to i8, !dbg !1955
  store i8 %conv10, ptr %arrayidx7, align 1, !dbg !1955
  br label %for.inc, !dbg !1954

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1956
    #dbg_value(i32 %inc, !1942, !DIExpression(), !1934)
  br label %for.cond, !dbg !1957, !llvm.loop !1958

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1960
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) #0 !dbg !1961 {
entry:
    #dbg_value(ptr %r, !1964, !DIExpression(), !1965)
    #dbg_value(i16 %v, !1966, !DIExpression(), !1965)
    #dbg_value(i16 %b, !1967, !DIExpression(), !1965)
  %conv = zext i16 %b to i32, !dbg !1968
  %sub = sub nsw i32 0, %conv, !dbg !1969
  %conv1 = trunc i32 %sub to i16, !dbg !1969
    #dbg_value(i16 %conv1, !1967, !DIExpression(), !1965)
  %conv2 = zext i16 %conv1 to i32, !dbg !1970
  %0 = load i16, ptr %r, align 2, !dbg !1971
  %conv3 = sext i16 %0 to i32, !dbg !1972
  %conv4 = sext i16 %v to i32, !dbg !1973
  %xor = xor i32 %conv3, %conv4, !dbg !1974
  %and = and i32 %conv2, %xor, !dbg !1975
  %1 = load i16, ptr %r, align 2, !dbg !1976
  %conv5 = sext i16 %1 to i32, !dbg !1976
  %xor6 = xor i32 %conv5, %and, !dbg !1976
  %conv7 = trunc i32 %xor6 to i16, !dbg !1976
  store i16 %conv7, ptr %r, align 2, !dbg !1976
  ret void, !dbg !1977
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) #0 !dbg !1978 {
entry:
    #dbg_value(ptr %state, !1987, !DIExpression(), !1988)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !1989
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !1990
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !1991
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !1992
  store i32 0, ptr %pos, align 8, !dbg !1993
  ret void, !dbg !1994
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_init(ptr noundef %s) #0 !dbg !1995 {
entry:
    #dbg_value(ptr %s, !1999, !DIExpression(), !2000)
    #dbg_value(i32 0, !2001, !DIExpression(), !2000)
  br label %for.cond, !dbg !2002

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2004
    #dbg_value(i32 %i.0, !2001, !DIExpression(), !2000)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2005
  br i1 %cmp, label %for.body, label %for.end, !dbg !2007

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2008
  store i64 0, ptr %arrayidx, align 8, !dbg !2009
  br label %for.inc, !dbg !2008

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2010
    #dbg_value(i32 %inc, !2001, !DIExpression(), !2000)
  br label %for.cond, !dbg !2011, !llvm.loop !2012

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2014
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2015 {
entry:
    #dbg_value(ptr %state, !2018, !DIExpression(), !2019)
    #dbg_value(ptr %in, !2020, !DIExpression(), !2019)
    #dbg_value(i32 %inlen, !2021, !DIExpression(), !2019)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2022
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2023
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2024
  %0 = load i32, ptr %pos, align 8, !dbg !2024
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2025
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2026
  store i32 %call, ptr %pos1, align 8, !dbg !2027
  ret void, !dbg !2028
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2029 {
entry:
    #dbg_value(ptr %s, !2032, !DIExpression(), !2033)
    #dbg_value(i32 %pos, !2034, !DIExpression(), !2033)
    #dbg_value(i32 %r, !2035, !DIExpression(), !2033)
    #dbg_value(ptr %in, !2036, !DIExpression(), !2033)
    #dbg_value(i32 %inlen, !2037, !DIExpression(), !2033)
  br label %while.cond, !dbg !2038

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !2034, !DIExpression(), !2033)
    #dbg_value(i32 %inlen.addr.0, !2037, !DIExpression(), !2033)
    #dbg_value(ptr %in.addr.0, !2036, !DIExpression(), !2033)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2039
  %cmp = icmp uge i32 %add, %r, !dbg !2040
  br i1 %cmp, label %while.body, label %while.end, !dbg !2038

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2041, !DIExpression(), !2033)
  br label %for.cond, !dbg !2042

for.cond:                                         ; preds = %for.inc, %while.body
  %in.addr.1 = phi ptr [ %in.addr.0, %while.body ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ %pos.addr.0, %while.body ], [ %inc, %for.inc ], !dbg !2045
    #dbg_value(i32 %i.0, !2041, !DIExpression(), !2033)
    #dbg_value(ptr %in.addr.1, !2036, !DIExpression(), !2033)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2046
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2048

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2049
    #dbg_value(ptr %incdec.ptr, !2036, !DIExpression(), !2033)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2050
  %conv = zext i8 %0 to i64, !dbg !2051
  %rem = urem i32 %i.0, 8, !dbg !2052
  %mul = mul i32 8, %rem, !dbg !2053
  %sh_prom = zext i32 %mul to i64, !dbg !2054
  %shl = shl i64 %conv, %sh_prom, !dbg !2054
  %div = udiv i32 %i.0, 8, !dbg !2055
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2056
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2057
  %xor = xor i64 %1, %shl, !dbg !2057
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2057
  br label %for.inc, !dbg !2056

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2058
    #dbg_value(i32 %inc, !2041, !DIExpression(), !2033)
  br label %for.cond, !dbg !2059, !llvm.loop !2060

for.end:                                          ; preds = %for.cond
  %sub = sub i32 %r, %pos.addr.0, !dbg !2062
  %sub2 = sub i32 %inlen.addr.0, %sub, !dbg !2063
    #dbg_value(i32 %sub2, !2037, !DIExpression(), !2033)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2064
    #dbg_value(i32 0, !2034, !DIExpression(), !2033)
  br label %while.cond, !dbg !2038, !llvm.loop !2065

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2041, !DIExpression(), !2033)
  br label %for.cond3, !dbg !2067

for.cond3:                                        ; preds = %for.inc17, %while.end
  %in.addr.2 = phi ptr [ %in.addr.0, %while.end ], [ %incdec.ptr8, %for.inc17 ]
  %i.1 = phi i32 [ %pos.addr.0, %while.end ], [ %inc18, %for.inc17 ], !dbg !2069
    #dbg_value(i32 %i.1, !2041, !DIExpression(), !2033)
    #dbg_value(ptr %in.addr.2, !2036, !DIExpression(), !2033)
  %add4 = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2070
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2072
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2073

for.body7:                                        ; preds = %for.cond3
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2074
    #dbg_value(ptr %incdec.ptr8, !2036, !DIExpression(), !2033)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2075
  %conv9 = zext i8 %2 to i64, !dbg !2076
  %rem10 = urem i32 %i.1, 8, !dbg !2077
  %mul11 = mul i32 8, %rem10, !dbg !2078
  %sh_prom12 = zext i32 %mul11 to i64, !dbg !2079
  %shl13 = shl i64 %conv9, %sh_prom12, !dbg !2079
  %div14 = udiv i32 %i.1, 8, !dbg !2080
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div14, !dbg !2081
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2082
  %xor16 = xor i64 %3, %shl13, !dbg !2082
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2082
  br label %for.inc17, !dbg !2081

for.inc17:                                        ; preds = %for.body7
  %inc18 = add i32 %i.1, 1, !dbg !2083
    #dbg_value(i32 %inc18, !2041, !DIExpression(), !2033)
  br label %for.cond3, !dbg !2084, !llvm.loop !2085

for.end19:                                        ; preds = %for.cond3
  ret i32 %i.1, !dbg !2087
}

; Function Attrs: noinline nounwind optnone
define internal void @KeccakF1600_StatePermute(ptr noundef %state) #0 !dbg !2088 {
entry:
    #dbg_value(ptr %state, !2089, !DIExpression(), !2090)
  %arrayidx = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2091
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2091
    #dbg_value(i64 %0, !2092, !DIExpression(), !2090)
  %arrayidx1 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2093
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2093
    #dbg_value(i64 %1, !2094, !DIExpression(), !2090)
  %arrayidx2 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2095
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2095
    #dbg_value(i64 %2, !2096, !DIExpression(), !2090)
  %arrayidx3 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2097
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2097
    #dbg_value(i64 %3, !2098, !DIExpression(), !2090)
  %arrayidx4 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2099
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2099
    #dbg_value(i64 %4, !2100, !DIExpression(), !2090)
  %arrayidx5 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2101
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2101
    #dbg_value(i64 %5, !2102, !DIExpression(), !2090)
  %arrayidx6 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2103
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2103
    #dbg_value(i64 %6, !2104, !DIExpression(), !2090)
  %arrayidx7 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2105
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2105
    #dbg_value(i64 %7, !2106, !DIExpression(), !2090)
  %arrayidx8 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2107
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2107
    #dbg_value(i64 %8, !2108, !DIExpression(), !2090)
  %arrayidx9 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2109
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2109
    #dbg_value(i64 %9, !2110, !DIExpression(), !2090)
  %arrayidx10 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2111
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2111
    #dbg_value(i64 %10, !2112, !DIExpression(), !2090)
  %arrayidx11 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2113
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2113
    #dbg_value(i64 %11, !2114, !DIExpression(), !2090)
  %arrayidx12 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2115
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2115
    #dbg_value(i64 %12, !2116, !DIExpression(), !2090)
  %arrayidx13 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2117
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2117
    #dbg_value(i64 %13, !2118, !DIExpression(), !2090)
  %arrayidx14 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2119
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2119
    #dbg_value(i64 %14, !2120, !DIExpression(), !2090)
  %arrayidx15 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2121
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2121
    #dbg_value(i64 %15, !2122, !DIExpression(), !2090)
  %arrayidx16 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2123
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2123
    #dbg_value(i64 %16, !2124, !DIExpression(), !2090)
  %arrayidx17 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2125
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2125
    #dbg_value(i64 %17, !2126, !DIExpression(), !2090)
  %arrayidx18 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2127
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2127
    #dbg_value(i64 %18, !2128, !DIExpression(), !2090)
  %arrayidx19 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2129
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2129
    #dbg_value(i64 %19, !2130, !DIExpression(), !2090)
  %arrayidx20 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2131
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2131
    #dbg_value(i64 %20, !2132, !DIExpression(), !2090)
  %arrayidx21 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2133
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2133
    #dbg_value(i64 %21, !2134, !DIExpression(), !2090)
  %arrayidx22 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2135
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2135
    #dbg_value(i64 %22, !2136, !DIExpression(), !2090)
  %arrayidx23 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2137
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2137
    #dbg_value(i64 %23, !2138, !DIExpression(), !2090)
  %arrayidx24 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2139
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2139
    #dbg_value(i64 %24, !2140, !DIExpression(), !2090)
    #dbg_value(i32 0, !2141, !DIExpression(), !2090)
  br label %for.cond, !dbg !2142

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2090
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2090
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2090
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2090
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2090
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2090
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2090
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2090
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2090
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2090
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2090
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2090
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2090
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2090
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2090
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2090
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2090
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2090
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2090
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2090
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2090
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2090
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2090
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2090
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2144
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2090
    #dbg_value(i64 %Asu.0, !2140, !DIExpression(), !2090)
    #dbg_value(i32 %round.0, !2141, !DIExpression(), !2090)
    #dbg_value(i64 %Aba.0, !2092, !DIExpression(), !2090)
    #dbg_value(i64 %Abe.0, !2094, !DIExpression(), !2090)
    #dbg_value(i64 %Abi.0, !2096, !DIExpression(), !2090)
    #dbg_value(i64 %Abo.0, !2098, !DIExpression(), !2090)
    #dbg_value(i64 %Abu.0, !2100, !DIExpression(), !2090)
    #dbg_value(i64 %Aga.0, !2102, !DIExpression(), !2090)
    #dbg_value(i64 %Age.0, !2104, !DIExpression(), !2090)
    #dbg_value(i64 %Agi.0, !2106, !DIExpression(), !2090)
    #dbg_value(i64 %Ago.0, !2108, !DIExpression(), !2090)
    #dbg_value(i64 %Agu.0, !2110, !DIExpression(), !2090)
    #dbg_value(i64 %Aka.0, !2112, !DIExpression(), !2090)
    #dbg_value(i64 %Ake.0, !2114, !DIExpression(), !2090)
    #dbg_value(i64 %Aki.0, !2116, !DIExpression(), !2090)
    #dbg_value(i64 %Ako.0, !2118, !DIExpression(), !2090)
    #dbg_value(i64 %Aku.0, !2120, !DIExpression(), !2090)
    #dbg_value(i64 %Ama.0, !2122, !DIExpression(), !2090)
    #dbg_value(i64 %Ame.0, !2124, !DIExpression(), !2090)
    #dbg_value(i64 %Ami.0, !2126, !DIExpression(), !2090)
    #dbg_value(i64 %Amo.0, !2128, !DIExpression(), !2090)
    #dbg_value(i64 %Amu.0, !2130, !DIExpression(), !2090)
    #dbg_value(i64 %Asa.0, !2132, !DIExpression(), !2090)
    #dbg_value(i64 %Ase.0, !2134, !DIExpression(), !2090)
    #dbg_value(i64 %Asi.0, !2136, !DIExpression(), !2090)
    #dbg_value(i64 %Aso.0, !2138, !DIExpression(), !2090)
  %cmp = icmp slt i32 %round.0, 24, !dbg !2145
  br i1 %cmp, label %for.body, label %for.end, !dbg !2147

for.body:                                         ; preds = %for.cond
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2148
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2150
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2151
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2152
    #dbg_value(i64 %xor27, !2153, !DIExpression(), !2090)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2154
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2155
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2156
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2157
    #dbg_value(i64 %xor31, !2158, !DIExpression(), !2090)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2159
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2160
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2161
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2162
    #dbg_value(i64 %xor35, !2163, !DIExpression(), !2090)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2164
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2165
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2166
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2167
    #dbg_value(i64 %xor39, !2168, !DIExpression(), !2090)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2169
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2170
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2171
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2172
    #dbg_value(i64 %xor43, !2173, !DIExpression(), !2090)
  %shl = shl i64 %xor31, 1, !dbg !2174
  %shr = lshr i64 %xor31, 63, !dbg !2174
  %xor44 = xor i64 %shl, %shr, !dbg !2174
  %xor45 = xor i64 %xor43, %xor44, !dbg !2175
    #dbg_value(i64 %xor45, !2176, !DIExpression(), !2090)
  %shl46 = shl i64 %xor35, 1, !dbg !2177
  %shr47 = lshr i64 %xor35, 63, !dbg !2177
  %xor48 = xor i64 %shl46, %shr47, !dbg !2177
  %xor49 = xor i64 %xor27, %xor48, !dbg !2178
    #dbg_value(i64 %xor49, !2179, !DIExpression(), !2090)
  %shl50 = shl i64 %xor39, 1, !dbg !2180
  %shr51 = lshr i64 %xor39, 63, !dbg !2180
  %xor52 = xor i64 %shl50, %shr51, !dbg !2180
  %xor53 = xor i64 %xor31, %xor52, !dbg !2181
    #dbg_value(i64 %xor53, !2182, !DIExpression(), !2090)
  %shl54 = shl i64 %xor43, 1, !dbg !2183
  %shr55 = lshr i64 %xor43, 63, !dbg !2183
  %xor56 = xor i64 %shl54, %shr55, !dbg !2183
  %xor57 = xor i64 %xor35, %xor56, !dbg !2184
    #dbg_value(i64 %xor57, !2185, !DIExpression(), !2090)
  %shl58 = shl i64 %xor27, 1, !dbg !2186
  %shr59 = lshr i64 %xor27, 63, !dbg !2186
  %xor60 = xor i64 %shl58, %shr59, !dbg !2186
  %xor61 = xor i64 %xor39, %xor60, !dbg !2187
    #dbg_value(i64 %xor61, !2188, !DIExpression(), !2090)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2189
    #dbg_value(i64 %xor62, !2092, !DIExpression(), !2090)
    #dbg_value(i64 %xor62, !2153, !DIExpression(), !2090)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2190
    #dbg_value(i64 %xor63, !2104, !DIExpression(), !2090)
  %shl64 = shl i64 %xor63, 44, !dbg !2191
  %shr65 = lshr i64 %xor63, 20, !dbg !2191
  %xor66 = xor i64 %shl64, %shr65, !dbg !2191
    #dbg_value(i64 %xor66, !2158, !DIExpression(), !2090)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2192
    #dbg_value(i64 %xor67, !2116, !DIExpression(), !2090)
  %shl68 = shl i64 %xor67, 43, !dbg !2193
  %shr69 = lshr i64 %xor67, 21, !dbg !2193
  %xor70 = xor i64 %shl68, %shr69, !dbg !2193
    #dbg_value(i64 %xor70, !2163, !DIExpression(), !2090)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2194
    #dbg_value(i64 %xor71, !2128, !DIExpression(), !2090)
  %shl72 = shl i64 %xor71, 21, !dbg !2195
  %shr73 = lshr i64 %xor71, 43, !dbg !2195
  %xor74 = xor i64 %shl72, %shr73, !dbg !2195
    #dbg_value(i64 %xor74, !2168, !DIExpression(), !2090)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2196
    #dbg_value(i64 %xor75, !2140, !DIExpression(), !2090)
  %shl76 = shl i64 %xor75, 14, !dbg !2197
  %shr77 = lshr i64 %xor75, 50, !dbg !2197
  %xor78 = xor i64 %shl76, %shr77, !dbg !2197
    #dbg_value(i64 %xor78, !2173, !DIExpression(), !2090)
  %not = xor i64 %xor66, -1, !dbg !2198
  %and = and i64 %not, %xor70, !dbg !2199
  %xor79 = xor i64 %xor62, %and, !dbg !2200
    #dbg_value(i64 %xor79, !2201, !DIExpression(), !2090)
  %arrayidx80 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2202
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2202
  %xor81 = xor i64 %xor79, %25, !dbg !2203
    #dbg_value(i64 %xor81, !2201, !DIExpression(), !2090)
  %not82 = xor i64 %xor70, -1, !dbg !2204
  %and83 = and i64 %not82, %xor74, !dbg !2205
  %xor84 = xor i64 %xor66, %and83, !dbg !2206
    #dbg_value(i64 %xor84, !2207, !DIExpression(), !2090)
  %not85 = xor i64 %xor74, -1, !dbg !2208
  %and86 = and i64 %not85, %xor78, !dbg !2209
  %xor87 = xor i64 %xor70, %and86, !dbg !2210
    #dbg_value(i64 %xor87, !2211, !DIExpression(), !2090)
  %not88 = xor i64 %xor78, -1, !dbg !2212
  %and89 = and i64 %not88, %xor62, !dbg !2213
  %xor90 = xor i64 %xor74, %and89, !dbg !2214
    #dbg_value(i64 %xor90, !2215, !DIExpression(), !2090)
  %not91 = xor i64 %xor62, -1, !dbg !2216
  %and92 = and i64 %not91, %xor66, !dbg !2217
  %xor93 = xor i64 %xor78, %and92, !dbg !2218
    #dbg_value(i64 %xor93, !2219, !DIExpression(), !2090)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2220
    #dbg_value(i64 %xor94, !2098, !DIExpression(), !2090)
  %shl95 = shl i64 %xor94, 28, !dbg !2221
  %shr96 = lshr i64 %xor94, 36, !dbg !2221
  %xor97 = xor i64 %shl95, %shr96, !dbg !2221
    #dbg_value(i64 %xor97, !2153, !DIExpression(), !2090)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2222
    #dbg_value(i64 %xor98, !2110, !DIExpression(), !2090)
  %shl99 = shl i64 %xor98, 20, !dbg !2223
  %shr100 = lshr i64 %xor98, 44, !dbg !2223
  %xor101 = xor i64 %shl99, %shr100, !dbg !2223
    #dbg_value(i64 %xor101, !2158, !DIExpression(), !2090)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2224
    #dbg_value(i64 %xor102, !2112, !DIExpression(), !2090)
  %shl103 = shl i64 %xor102, 3, !dbg !2225
  %shr104 = lshr i64 %xor102, 61, !dbg !2225
  %xor105 = xor i64 %shl103, %shr104, !dbg !2225
    #dbg_value(i64 %xor105, !2163, !DIExpression(), !2090)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2226
    #dbg_value(i64 %xor106, !2124, !DIExpression(), !2090)
  %shl107 = shl i64 %xor106, 45, !dbg !2227
  %shr108 = lshr i64 %xor106, 19, !dbg !2227
  %xor109 = xor i64 %shl107, %shr108, !dbg !2227
    #dbg_value(i64 %xor109, !2168, !DIExpression(), !2090)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2228
    #dbg_value(i64 %xor110, !2136, !DIExpression(), !2090)
  %shl111 = shl i64 %xor110, 61, !dbg !2229
  %shr112 = lshr i64 %xor110, 3, !dbg !2229
  %xor113 = xor i64 %shl111, %shr112, !dbg !2229
    #dbg_value(i64 %xor113, !2173, !DIExpression(), !2090)
  %not114 = xor i64 %xor101, -1, !dbg !2230
  %and115 = and i64 %not114, %xor105, !dbg !2231
  %xor116 = xor i64 %xor97, %and115, !dbg !2232
    #dbg_value(i64 %xor116, !2233, !DIExpression(), !2090)
  %not117 = xor i64 %xor105, -1, !dbg !2234
  %and118 = and i64 %not117, %xor109, !dbg !2235
  %xor119 = xor i64 %xor101, %and118, !dbg !2236
    #dbg_value(i64 %xor119, !2237, !DIExpression(), !2090)
  %not120 = xor i64 %xor109, -1, !dbg !2238
  %and121 = and i64 %not120, %xor113, !dbg !2239
  %xor122 = xor i64 %xor105, %and121, !dbg !2240
    #dbg_value(i64 %xor122, !2241, !DIExpression(), !2090)
  %not123 = xor i64 %xor113, -1, !dbg !2242
  %and124 = and i64 %not123, %xor97, !dbg !2243
  %xor125 = xor i64 %xor109, %and124, !dbg !2244
    #dbg_value(i64 %xor125, !2245, !DIExpression(), !2090)
  %not126 = xor i64 %xor97, -1, !dbg !2246
  %and127 = and i64 %not126, %xor101, !dbg !2247
  %xor128 = xor i64 %xor113, %and127, !dbg !2248
    #dbg_value(i64 %xor128, !2249, !DIExpression(), !2090)
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2250
    #dbg_value(i64 %xor129, !2094, !DIExpression(), !2090)
  %shl130 = shl i64 %xor129, 1, !dbg !2251
  %shr131 = lshr i64 %xor129, 63, !dbg !2251
  %xor132 = xor i64 %shl130, %shr131, !dbg !2251
    #dbg_value(i64 %xor132, !2153, !DIExpression(), !2090)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2252
    #dbg_value(i64 %xor133, !2106, !DIExpression(), !2090)
  %shl134 = shl i64 %xor133, 6, !dbg !2253
  %shr135 = lshr i64 %xor133, 58, !dbg !2253
  %xor136 = xor i64 %shl134, %shr135, !dbg !2253
    #dbg_value(i64 %xor136, !2158, !DIExpression(), !2090)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2254
    #dbg_value(i64 %xor137, !2118, !DIExpression(), !2090)
  %shl138 = shl i64 %xor137, 25, !dbg !2255
  %shr139 = lshr i64 %xor137, 39, !dbg !2255
  %xor140 = xor i64 %shl138, %shr139, !dbg !2255
    #dbg_value(i64 %xor140, !2163, !DIExpression(), !2090)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2256
    #dbg_value(i64 %xor141, !2130, !DIExpression(), !2090)
  %shl142 = shl i64 %xor141, 8, !dbg !2257
  %shr143 = lshr i64 %xor141, 56, !dbg !2257
  %xor144 = xor i64 %shl142, %shr143, !dbg !2257
    #dbg_value(i64 %xor144, !2168, !DIExpression(), !2090)
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2258
    #dbg_value(i64 %xor145, !2132, !DIExpression(), !2090)
  %shl146 = shl i64 %xor145, 18, !dbg !2259
  %shr147 = lshr i64 %xor145, 46, !dbg !2259
  %xor148 = xor i64 %shl146, %shr147, !dbg !2259
    #dbg_value(i64 %xor148, !2173, !DIExpression(), !2090)
  %not149 = xor i64 %xor136, -1, !dbg !2260
  %and150 = and i64 %not149, %xor140, !dbg !2261
  %xor151 = xor i64 %xor132, %and150, !dbg !2262
    #dbg_value(i64 %xor151, !2263, !DIExpression(), !2090)
  %not152 = xor i64 %xor140, -1, !dbg !2264
  %and153 = and i64 %not152, %xor144, !dbg !2265
  %xor154 = xor i64 %xor136, %and153, !dbg !2266
    #dbg_value(i64 %xor154, !2267, !DIExpression(), !2090)
  %not155 = xor i64 %xor144, -1, !dbg !2268
  %and156 = and i64 %not155, %xor148, !dbg !2269
  %xor157 = xor i64 %xor140, %and156, !dbg !2270
    #dbg_value(i64 %xor157, !2271, !DIExpression(), !2090)
  %not158 = xor i64 %xor148, -1, !dbg !2272
  %and159 = and i64 %not158, %xor132, !dbg !2273
  %xor160 = xor i64 %xor144, %and159, !dbg !2274
    #dbg_value(i64 %xor160, !2275, !DIExpression(), !2090)
  %not161 = xor i64 %xor132, -1, !dbg !2276
  %and162 = and i64 %not161, %xor136, !dbg !2277
  %xor163 = xor i64 %xor148, %and162, !dbg !2278
    #dbg_value(i64 %xor163, !2279, !DIExpression(), !2090)
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2280
    #dbg_value(i64 %xor164, !2100, !DIExpression(), !2090)
  %shl165 = shl i64 %xor164, 27, !dbg !2281
  %shr166 = lshr i64 %xor164, 37, !dbg !2281
  %xor167 = xor i64 %shl165, %shr166, !dbg !2281
    #dbg_value(i64 %xor167, !2153, !DIExpression(), !2090)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2282
    #dbg_value(i64 %xor168, !2102, !DIExpression(), !2090)
  %shl169 = shl i64 %xor168, 36, !dbg !2283
  %shr170 = lshr i64 %xor168, 28, !dbg !2283
  %xor171 = xor i64 %shl169, %shr170, !dbg !2283
    #dbg_value(i64 %xor171, !2158, !DIExpression(), !2090)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2284
    #dbg_value(i64 %xor172, !2114, !DIExpression(), !2090)
  %shl173 = shl i64 %xor172, 10, !dbg !2285
  %shr174 = lshr i64 %xor172, 54, !dbg !2285
  %xor175 = xor i64 %shl173, %shr174, !dbg !2285
    #dbg_value(i64 %xor175, !2163, !DIExpression(), !2090)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2286
    #dbg_value(i64 %xor176, !2126, !DIExpression(), !2090)
  %shl177 = shl i64 %xor176, 15, !dbg !2287
  %shr178 = lshr i64 %xor176, 49, !dbg !2287
  %xor179 = xor i64 %shl177, %shr178, !dbg !2287
    #dbg_value(i64 %xor179, !2168, !DIExpression(), !2090)
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2288
    #dbg_value(i64 %xor180, !2138, !DIExpression(), !2090)
  %shl181 = shl i64 %xor180, 56, !dbg !2289
  %shr182 = lshr i64 %xor180, 8, !dbg !2289
  %xor183 = xor i64 %shl181, %shr182, !dbg !2289
    #dbg_value(i64 %xor183, !2173, !DIExpression(), !2090)
  %not184 = xor i64 %xor171, -1, !dbg !2290
  %and185 = and i64 %not184, %xor175, !dbg !2291
  %xor186 = xor i64 %xor167, %and185, !dbg !2292
    #dbg_value(i64 %xor186, !2293, !DIExpression(), !2090)
  %not187 = xor i64 %xor175, -1, !dbg !2294
  %and188 = and i64 %not187, %xor179, !dbg !2295
  %xor189 = xor i64 %xor171, %and188, !dbg !2296
    #dbg_value(i64 %xor189, !2297, !DIExpression(), !2090)
  %not190 = xor i64 %xor179, -1, !dbg !2298
  %and191 = and i64 %not190, %xor183, !dbg !2299
  %xor192 = xor i64 %xor175, %and191, !dbg !2300
    #dbg_value(i64 %xor192, !2301, !DIExpression(), !2090)
  %not193 = xor i64 %xor183, -1, !dbg !2302
  %and194 = and i64 %not193, %xor167, !dbg !2303
  %xor195 = xor i64 %xor179, %and194, !dbg !2304
    #dbg_value(i64 %xor195, !2305, !DIExpression(), !2090)
  %not196 = xor i64 %xor167, -1, !dbg !2306
  %and197 = and i64 %not196, %xor171, !dbg !2307
  %xor198 = xor i64 %xor183, %and197, !dbg !2308
    #dbg_value(i64 %xor198, !2309, !DIExpression(), !2090)
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2310
    #dbg_value(i64 %xor199, !2096, !DIExpression(), !2090)
  %shl200 = shl i64 %xor199, 62, !dbg !2311
  %shr201 = lshr i64 %xor199, 2, !dbg !2311
  %xor202 = xor i64 %shl200, %shr201, !dbg !2311
    #dbg_value(i64 %xor202, !2153, !DIExpression(), !2090)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2312
    #dbg_value(i64 %xor203, !2108, !DIExpression(), !2090)
  %shl204 = shl i64 %xor203, 55, !dbg !2313
  %shr205 = lshr i64 %xor203, 9, !dbg !2313
  %xor206 = xor i64 %shl204, %shr205, !dbg !2313
    #dbg_value(i64 %xor206, !2158, !DIExpression(), !2090)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2314
    #dbg_value(i64 %xor207, !2120, !DIExpression(), !2090)
  %shl208 = shl i64 %xor207, 39, !dbg !2315
  %shr209 = lshr i64 %xor207, 25, !dbg !2315
  %xor210 = xor i64 %shl208, %shr209, !dbg !2315
    #dbg_value(i64 %xor210, !2163, !DIExpression(), !2090)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2316
    #dbg_value(i64 %xor211, !2122, !DIExpression(), !2090)
  %shl212 = shl i64 %xor211, 41, !dbg !2317
  %shr213 = lshr i64 %xor211, 23, !dbg !2317
  %xor214 = xor i64 %shl212, %shr213, !dbg !2317
    #dbg_value(i64 %xor214, !2168, !DIExpression(), !2090)
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2318
    #dbg_value(i64 %xor215, !2134, !DIExpression(), !2090)
  %shl216 = shl i64 %xor215, 2, !dbg !2319
  %shr217 = lshr i64 %xor215, 62, !dbg !2319
  %xor218 = xor i64 %shl216, %shr217, !dbg !2319
    #dbg_value(i64 %xor218, !2173, !DIExpression(), !2090)
  %not219 = xor i64 %xor206, -1, !dbg !2320
  %and220 = and i64 %not219, %xor210, !dbg !2321
  %xor221 = xor i64 %xor202, %and220, !dbg !2322
    #dbg_value(i64 %xor221, !2323, !DIExpression(), !2090)
  %not222 = xor i64 %xor210, -1, !dbg !2324
  %and223 = and i64 %not222, %xor214, !dbg !2325
  %xor224 = xor i64 %xor206, %and223, !dbg !2326
    #dbg_value(i64 %xor224, !2327, !DIExpression(), !2090)
  %not225 = xor i64 %xor214, -1, !dbg !2328
  %and226 = and i64 %not225, %xor218, !dbg !2329
  %xor227 = xor i64 %xor210, %and226, !dbg !2330
    #dbg_value(i64 %xor227, !2331, !DIExpression(), !2090)
  %not228 = xor i64 %xor218, -1, !dbg !2332
  %and229 = and i64 %not228, %xor202, !dbg !2333
  %xor230 = xor i64 %xor214, %and229, !dbg !2334
    #dbg_value(i64 %xor230, !2335, !DIExpression(), !2090)
  %not231 = xor i64 %xor202, -1, !dbg !2336
  %and232 = and i64 %not231, %xor206, !dbg !2337
  %xor233 = xor i64 %xor218, %and232, !dbg !2338
    #dbg_value(i64 %xor233, !2339, !DIExpression(), !2090)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2340
  %xor235 = xor i64 %xor234, %xor151, !dbg !2341
  %xor236 = xor i64 %xor235, %xor186, !dbg !2342
  %xor237 = xor i64 %xor236, %xor221, !dbg !2343
    #dbg_value(i64 %xor237, !2153, !DIExpression(), !2090)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2344
  %xor239 = xor i64 %xor238, %xor154, !dbg !2345
  %xor240 = xor i64 %xor239, %xor189, !dbg !2346
  %xor241 = xor i64 %xor240, %xor224, !dbg !2347
    #dbg_value(i64 %xor241, !2158, !DIExpression(), !2090)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2348
  %xor243 = xor i64 %xor242, %xor157, !dbg !2349
  %xor244 = xor i64 %xor243, %xor192, !dbg !2350
  %xor245 = xor i64 %xor244, %xor227, !dbg !2351
    #dbg_value(i64 %xor245, !2163, !DIExpression(), !2090)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2352
  %xor247 = xor i64 %xor246, %xor160, !dbg !2353
  %xor248 = xor i64 %xor247, %xor195, !dbg !2354
  %xor249 = xor i64 %xor248, %xor230, !dbg !2355
    #dbg_value(i64 %xor249, !2168, !DIExpression(), !2090)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2356
  %xor251 = xor i64 %xor250, %xor163, !dbg !2357
  %xor252 = xor i64 %xor251, %xor198, !dbg !2358
  %xor253 = xor i64 %xor252, %xor233, !dbg !2359
    #dbg_value(i64 %xor253, !2173, !DIExpression(), !2090)
  %shl254 = shl i64 %xor241, 1, !dbg !2360
  %shr255 = lshr i64 %xor241, 63, !dbg !2360
  %xor256 = xor i64 %shl254, %shr255, !dbg !2360
  %xor257 = xor i64 %xor253, %xor256, !dbg !2361
    #dbg_value(i64 %xor257, !2176, !DIExpression(), !2090)
  %shl258 = shl i64 %xor245, 1, !dbg !2362
  %shr259 = lshr i64 %xor245, 63, !dbg !2362
  %xor260 = xor i64 %shl258, %shr259, !dbg !2362
  %xor261 = xor i64 %xor237, %xor260, !dbg !2363
    #dbg_value(i64 %xor261, !2179, !DIExpression(), !2090)
  %shl262 = shl i64 %xor249, 1, !dbg !2364
  %shr263 = lshr i64 %xor249, 63, !dbg !2364
  %xor264 = xor i64 %shl262, %shr263, !dbg !2364
  %xor265 = xor i64 %xor241, %xor264, !dbg !2365
    #dbg_value(i64 %xor265, !2182, !DIExpression(), !2090)
  %shl266 = shl i64 %xor253, 1, !dbg !2366
  %shr267 = lshr i64 %xor253, 63, !dbg !2366
  %xor268 = xor i64 %shl266, %shr267, !dbg !2366
  %xor269 = xor i64 %xor245, %xor268, !dbg !2367
    #dbg_value(i64 %xor269, !2185, !DIExpression(), !2090)
  %shl270 = shl i64 %xor237, 1, !dbg !2368
  %shr271 = lshr i64 %xor237, 63, !dbg !2368
  %xor272 = xor i64 %shl270, %shr271, !dbg !2368
  %xor273 = xor i64 %xor249, %xor272, !dbg !2369
    #dbg_value(i64 %xor273, !2188, !DIExpression(), !2090)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2370
    #dbg_value(i64 %xor274, !2201, !DIExpression(), !2090)
    #dbg_value(i64 %xor274, !2153, !DIExpression(), !2090)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2371
    #dbg_value(i64 %xor275, !2237, !DIExpression(), !2090)
  %shl276 = shl i64 %xor275, 44, !dbg !2372
  %shr277 = lshr i64 %xor275, 20, !dbg !2372
  %xor278 = xor i64 %shl276, %shr277, !dbg !2372
    #dbg_value(i64 %xor278, !2158, !DIExpression(), !2090)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2373
    #dbg_value(i64 %xor279, !2271, !DIExpression(), !2090)
  %shl280 = shl i64 %xor279, 43, !dbg !2374
  %shr281 = lshr i64 %xor279, 21, !dbg !2374
  %xor282 = xor i64 %shl280, %shr281, !dbg !2374
    #dbg_value(i64 %xor282, !2163, !DIExpression(), !2090)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2375
    #dbg_value(i64 %xor283, !2305, !DIExpression(), !2090)
  %shl284 = shl i64 %xor283, 21, !dbg !2376
  %shr285 = lshr i64 %xor283, 43, !dbg !2376
  %xor286 = xor i64 %shl284, %shr285, !dbg !2376
    #dbg_value(i64 %xor286, !2168, !DIExpression(), !2090)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2377
    #dbg_value(i64 %xor287, !2339, !DIExpression(), !2090)
  %shl288 = shl i64 %xor287, 14, !dbg !2378
  %shr289 = lshr i64 %xor287, 50, !dbg !2378
  %xor290 = xor i64 %shl288, %shr289, !dbg !2378
    #dbg_value(i64 %xor290, !2173, !DIExpression(), !2090)
  %not291 = xor i64 %xor278, -1, !dbg !2379
  %and292 = and i64 %not291, %xor282, !dbg !2380
  %xor293 = xor i64 %xor274, %and292, !dbg !2381
    #dbg_value(i64 %xor293, !2092, !DIExpression(), !2090)
  %add = add nsw i32 %round.0, 1, !dbg !2382
  %arrayidx294 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2383
  %26 = load i64, ptr %arrayidx294, align 8, !dbg !2383
  %xor295 = xor i64 %xor293, %26, !dbg !2384
    #dbg_value(i64 %xor295, !2092, !DIExpression(), !2090)
  %not296 = xor i64 %xor282, -1, !dbg !2385
  %and297 = and i64 %not296, %xor286, !dbg !2386
  %xor298 = xor i64 %xor278, %and297, !dbg !2387
    #dbg_value(i64 %xor298, !2094, !DIExpression(), !2090)
  %not299 = xor i64 %xor286, -1, !dbg !2388
  %and300 = and i64 %not299, %xor290, !dbg !2389
  %xor301 = xor i64 %xor282, %and300, !dbg !2390
    #dbg_value(i64 %xor301, !2096, !DIExpression(), !2090)
  %not302 = xor i64 %xor290, -1, !dbg !2391
  %and303 = and i64 %not302, %xor274, !dbg !2392
  %xor304 = xor i64 %xor286, %and303, !dbg !2393
    #dbg_value(i64 %xor304, !2098, !DIExpression(), !2090)
  %not305 = xor i64 %xor274, -1, !dbg !2394
  %and306 = and i64 %not305, %xor278, !dbg !2395
  %xor307 = xor i64 %xor290, %and306, !dbg !2396
    #dbg_value(i64 %xor307, !2100, !DIExpression(), !2090)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2397
    #dbg_value(i64 %xor308, !2215, !DIExpression(), !2090)
  %shl309 = shl i64 %xor308, 28, !dbg !2398
  %shr310 = lshr i64 %xor308, 36, !dbg !2398
  %xor311 = xor i64 %shl309, %shr310, !dbg !2398
    #dbg_value(i64 %xor311, !2153, !DIExpression(), !2090)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2399
    #dbg_value(i64 %xor312, !2249, !DIExpression(), !2090)
  %shl313 = shl i64 %xor312, 20, !dbg !2400
  %shr314 = lshr i64 %xor312, 44, !dbg !2400
  %xor315 = xor i64 %shl313, %shr314, !dbg !2400
    #dbg_value(i64 %xor315, !2158, !DIExpression(), !2090)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2401
    #dbg_value(i64 %xor316, !2263, !DIExpression(), !2090)
  %shl317 = shl i64 %xor316, 3, !dbg !2402
  %shr318 = lshr i64 %xor316, 61, !dbg !2402
  %xor319 = xor i64 %shl317, %shr318, !dbg !2402
    #dbg_value(i64 %xor319, !2163, !DIExpression(), !2090)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2403
    #dbg_value(i64 %xor320, !2297, !DIExpression(), !2090)
  %shl321 = shl i64 %xor320, 45, !dbg !2404
  %shr322 = lshr i64 %xor320, 19, !dbg !2404
  %xor323 = xor i64 %shl321, %shr322, !dbg !2404
    #dbg_value(i64 %xor323, !2168, !DIExpression(), !2090)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2405
    #dbg_value(i64 %xor324, !2331, !DIExpression(), !2090)
  %shl325 = shl i64 %xor324, 61, !dbg !2406
  %shr326 = lshr i64 %xor324, 3, !dbg !2406
  %xor327 = xor i64 %shl325, %shr326, !dbg !2406
    #dbg_value(i64 %xor327, !2173, !DIExpression(), !2090)
  %not328 = xor i64 %xor315, -1, !dbg !2407
  %and329 = and i64 %not328, %xor319, !dbg !2408
  %xor330 = xor i64 %xor311, %and329, !dbg !2409
    #dbg_value(i64 %xor330, !2102, !DIExpression(), !2090)
  %not331 = xor i64 %xor319, -1, !dbg !2410
  %and332 = and i64 %not331, %xor323, !dbg !2411
  %xor333 = xor i64 %xor315, %and332, !dbg !2412
    #dbg_value(i64 %xor333, !2104, !DIExpression(), !2090)
  %not334 = xor i64 %xor323, -1, !dbg !2413
  %and335 = and i64 %not334, %xor327, !dbg !2414
  %xor336 = xor i64 %xor319, %and335, !dbg !2415
    #dbg_value(i64 %xor336, !2106, !DIExpression(), !2090)
  %not337 = xor i64 %xor327, -1, !dbg !2416
  %and338 = and i64 %not337, %xor311, !dbg !2417
  %xor339 = xor i64 %xor323, %and338, !dbg !2418
    #dbg_value(i64 %xor339, !2108, !DIExpression(), !2090)
  %not340 = xor i64 %xor311, -1, !dbg !2419
  %and341 = and i64 %not340, %xor315, !dbg !2420
  %xor342 = xor i64 %xor327, %and341, !dbg !2421
    #dbg_value(i64 %xor342, !2110, !DIExpression(), !2090)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2422
    #dbg_value(i64 %xor343, !2207, !DIExpression(), !2090)
  %shl344 = shl i64 %xor343, 1, !dbg !2423
  %shr345 = lshr i64 %xor343, 63, !dbg !2423
  %xor346 = xor i64 %shl344, %shr345, !dbg !2423
    #dbg_value(i64 %xor346, !2153, !DIExpression(), !2090)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2424
    #dbg_value(i64 %xor347, !2241, !DIExpression(), !2090)
  %shl348 = shl i64 %xor347, 6, !dbg !2425
  %shr349 = lshr i64 %xor347, 58, !dbg !2425
  %xor350 = xor i64 %shl348, %shr349, !dbg !2425
    #dbg_value(i64 %xor350, !2158, !DIExpression(), !2090)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2426
    #dbg_value(i64 %xor351, !2275, !DIExpression(), !2090)
  %shl352 = shl i64 %xor351, 25, !dbg !2427
  %shr353 = lshr i64 %xor351, 39, !dbg !2427
  %xor354 = xor i64 %shl352, %shr353, !dbg !2427
    #dbg_value(i64 %xor354, !2163, !DIExpression(), !2090)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2428
    #dbg_value(i64 %xor355, !2309, !DIExpression(), !2090)
  %shl356 = shl i64 %xor355, 8, !dbg !2429
  %shr357 = lshr i64 %xor355, 56, !dbg !2429
  %xor358 = xor i64 %shl356, %shr357, !dbg !2429
    #dbg_value(i64 %xor358, !2168, !DIExpression(), !2090)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2430
    #dbg_value(i64 %xor359, !2323, !DIExpression(), !2090)
  %shl360 = shl i64 %xor359, 18, !dbg !2431
  %shr361 = lshr i64 %xor359, 46, !dbg !2431
  %xor362 = xor i64 %shl360, %shr361, !dbg !2431
    #dbg_value(i64 %xor362, !2173, !DIExpression(), !2090)
  %not363 = xor i64 %xor350, -1, !dbg !2432
  %and364 = and i64 %not363, %xor354, !dbg !2433
  %xor365 = xor i64 %xor346, %and364, !dbg !2434
    #dbg_value(i64 %xor365, !2112, !DIExpression(), !2090)
  %not366 = xor i64 %xor354, -1, !dbg !2435
  %and367 = and i64 %not366, %xor358, !dbg !2436
  %xor368 = xor i64 %xor350, %and367, !dbg !2437
    #dbg_value(i64 %xor368, !2114, !DIExpression(), !2090)
  %not369 = xor i64 %xor358, -1, !dbg !2438
  %and370 = and i64 %not369, %xor362, !dbg !2439
  %xor371 = xor i64 %xor354, %and370, !dbg !2440
    #dbg_value(i64 %xor371, !2116, !DIExpression(), !2090)
  %not372 = xor i64 %xor362, -1, !dbg !2441
  %and373 = and i64 %not372, %xor346, !dbg !2442
  %xor374 = xor i64 %xor358, %and373, !dbg !2443
    #dbg_value(i64 %xor374, !2118, !DIExpression(), !2090)
  %not375 = xor i64 %xor346, -1, !dbg !2444
  %and376 = and i64 %not375, %xor350, !dbg !2445
  %xor377 = xor i64 %xor362, %and376, !dbg !2446
    #dbg_value(i64 %xor377, !2120, !DIExpression(), !2090)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2447
    #dbg_value(i64 %xor378, !2219, !DIExpression(), !2090)
  %shl379 = shl i64 %xor378, 27, !dbg !2448
  %shr380 = lshr i64 %xor378, 37, !dbg !2448
  %xor381 = xor i64 %shl379, %shr380, !dbg !2448
    #dbg_value(i64 %xor381, !2153, !DIExpression(), !2090)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2449
    #dbg_value(i64 %xor382, !2233, !DIExpression(), !2090)
  %shl383 = shl i64 %xor382, 36, !dbg !2450
  %shr384 = lshr i64 %xor382, 28, !dbg !2450
  %xor385 = xor i64 %shl383, %shr384, !dbg !2450
    #dbg_value(i64 %xor385, !2158, !DIExpression(), !2090)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2451
    #dbg_value(i64 %xor386, !2267, !DIExpression(), !2090)
  %shl387 = shl i64 %xor386, 10, !dbg !2452
  %shr388 = lshr i64 %xor386, 54, !dbg !2452
  %xor389 = xor i64 %shl387, %shr388, !dbg !2452
    #dbg_value(i64 %xor389, !2163, !DIExpression(), !2090)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2453
    #dbg_value(i64 %xor390, !2301, !DIExpression(), !2090)
  %shl391 = shl i64 %xor390, 15, !dbg !2454
  %shr392 = lshr i64 %xor390, 49, !dbg !2454
  %xor393 = xor i64 %shl391, %shr392, !dbg !2454
    #dbg_value(i64 %xor393, !2168, !DIExpression(), !2090)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2455
    #dbg_value(i64 %xor394, !2335, !DIExpression(), !2090)
  %shl395 = shl i64 %xor394, 56, !dbg !2456
  %shr396 = lshr i64 %xor394, 8, !dbg !2456
  %xor397 = xor i64 %shl395, %shr396, !dbg !2456
    #dbg_value(i64 %xor397, !2173, !DIExpression(), !2090)
  %not398 = xor i64 %xor385, -1, !dbg !2457
  %and399 = and i64 %not398, %xor389, !dbg !2458
  %xor400 = xor i64 %xor381, %and399, !dbg !2459
    #dbg_value(i64 %xor400, !2122, !DIExpression(), !2090)
  %not401 = xor i64 %xor389, -1, !dbg !2460
  %and402 = and i64 %not401, %xor393, !dbg !2461
  %xor403 = xor i64 %xor385, %and402, !dbg !2462
    #dbg_value(i64 %xor403, !2124, !DIExpression(), !2090)
  %not404 = xor i64 %xor393, -1, !dbg !2463
  %and405 = and i64 %not404, %xor397, !dbg !2464
  %xor406 = xor i64 %xor389, %and405, !dbg !2465
    #dbg_value(i64 %xor406, !2126, !DIExpression(), !2090)
  %not407 = xor i64 %xor397, -1, !dbg !2466
  %and408 = and i64 %not407, %xor381, !dbg !2467
  %xor409 = xor i64 %xor393, %and408, !dbg !2468
    #dbg_value(i64 %xor409, !2128, !DIExpression(), !2090)
  %not410 = xor i64 %xor381, -1, !dbg !2469
  %and411 = and i64 %not410, %xor385, !dbg !2470
  %xor412 = xor i64 %xor397, %and411, !dbg !2471
    #dbg_value(i64 %xor412, !2130, !DIExpression(), !2090)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2472
    #dbg_value(i64 %xor413, !2211, !DIExpression(), !2090)
  %shl414 = shl i64 %xor413, 62, !dbg !2473
  %shr415 = lshr i64 %xor413, 2, !dbg !2473
  %xor416 = xor i64 %shl414, %shr415, !dbg !2473
    #dbg_value(i64 %xor416, !2153, !DIExpression(), !2090)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2474
    #dbg_value(i64 %xor417, !2245, !DIExpression(), !2090)
  %shl418 = shl i64 %xor417, 55, !dbg !2475
  %shr419 = lshr i64 %xor417, 9, !dbg !2475
  %xor420 = xor i64 %shl418, %shr419, !dbg !2475
    #dbg_value(i64 %xor420, !2158, !DIExpression(), !2090)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2476
    #dbg_value(i64 %xor421, !2279, !DIExpression(), !2090)
  %shl422 = shl i64 %xor421, 39, !dbg !2477
  %shr423 = lshr i64 %xor421, 25, !dbg !2477
  %xor424 = xor i64 %shl422, %shr423, !dbg !2477
    #dbg_value(i64 %xor424, !2163, !DIExpression(), !2090)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2478
    #dbg_value(i64 %xor425, !2293, !DIExpression(), !2090)
  %shl426 = shl i64 %xor425, 41, !dbg !2479
  %shr427 = lshr i64 %xor425, 23, !dbg !2479
  %xor428 = xor i64 %shl426, %shr427, !dbg !2479
    #dbg_value(i64 %xor428, !2168, !DIExpression(), !2090)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2480
    #dbg_value(i64 %xor429, !2327, !DIExpression(), !2090)
  %shl430 = shl i64 %xor429, 2, !dbg !2481
  %shr431 = lshr i64 %xor429, 62, !dbg !2481
  %xor432 = xor i64 %shl430, %shr431, !dbg !2481
    #dbg_value(i64 %xor432, !2173, !DIExpression(), !2090)
  %not433 = xor i64 %xor420, -1, !dbg !2482
  %and434 = and i64 %not433, %xor424, !dbg !2483
  %xor435 = xor i64 %xor416, %and434, !dbg !2484
    #dbg_value(i64 %xor435, !2132, !DIExpression(), !2090)
  %not436 = xor i64 %xor424, -1, !dbg !2485
  %and437 = and i64 %not436, %xor428, !dbg !2486
  %xor438 = xor i64 %xor420, %and437, !dbg !2487
    #dbg_value(i64 %xor438, !2134, !DIExpression(), !2090)
  %not439 = xor i64 %xor428, -1, !dbg !2488
  %and440 = and i64 %not439, %xor432, !dbg !2489
  %xor441 = xor i64 %xor424, %and440, !dbg !2490
    #dbg_value(i64 %xor441, !2136, !DIExpression(), !2090)
  %not442 = xor i64 %xor432, -1, !dbg !2491
  %and443 = and i64 %not442, %xor416, !dbg !2492
  %xor444 = xor i64 %xor428, %and443, !dbg !2493
    #dbg_value(i64 %xor444, !2138, !DIExpression(), !2090)
  %not445 = xor i64 %xor416, -1, !dbg !2494
  %and446 = and i64 %not445, %xor420, !dbg !2495
  %xor447 = xor i64 %xor432, %and446, !dbg !2496
    #dbg_value(i64 %xor447, !2140, !DIExpression(), !2090)
  br label %for.inc, !dbg !2497

for.inc:                                          ; preds = %for.body
  %add448 = add nsw i32 %round.0, 2, !dbg !2498
    #dbg_value(i32 %add448, !2141, !DIExpression(), !2090)
  br label %for.cond, !dbg !2499, !llvm.loop !2500

for.end:                                          ; preds = %for.cond
  %arrayidx449 = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2502
  store i64 %Aba.0, ptr %arrayidx449, align 8, !dbg !2503
  %arrayidx450 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2504
  store i64 %Abe.0, ptr %arrayidx450, align 8, !dbg !2505
  %arrayidx451 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2506
  store i64 %Abi.0, ptr %arrayidx451, align 8, !dbg !2507
  %arrayidx452 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2508
  store i64 %Abo.0, ptr %arrayidx452, align 8, !dbg !2509
  %arrayidx453 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2510
  store i64 %Abu.0, ptr %arrayidx453, align 8, !dbg !2511
  %arrayidx454 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2512
  store i64 %Aga.0, ptr %arrayidx454, align 8, !dbg !2513
  %arrayidx455 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2514
  store i64 %Age.0, ptr %arrayidx455, align 8, !dbg !2515
  %arrayidx456 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2516
  store i64 %Agi.0, ptr %arrayidx456, align 8, !dbg !2517
  %arrayidx457 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2518
  store i64 %Ago.0, ptr %arrayidx457, align 8, !dbg !2519
  %arrayidx458 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2520
  store i64 %Agu.0, ptr %arrayidx458, align 8, !dbg !2521
  %arrayidx459 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2522
  store i64 %Aka.0, ptr %arrayidx459, align 8, !dbg !2523
  %arrayidx460 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2524
  store i64 %Ake.0, ptr %arrayidx460, align 8, !dbg !2525
  %arrayidx461 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2526
  store i64 %Aki.0, ptr %arrayidx461, align 8, !dbg !2527
  %arrayidx462 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2528
  store i64 %Ako.0, ptr %arrayidx462, align 8, !dbg !2529
  %arrayidx463 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2530
  store i64 %Aku.0, ptr %arrayidx463, align 8, !dbg !2531
  %arrayidx464 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2532
  store i64 %Ama.0, ptr %arrayidx464, align 8, !dbg !2533
  %arrayidx465 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2534
  store i64 %Ame.0, ptr %arrayidx465, align 8, !dbg !2535
  %arrayidx466 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2536
  store i64 %Ami.0, ptr %arrayidx466, align 8, !dbg !2537
  %arrayidx467 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2538
  store i64 %Amo.0, ptr %arrayidx467, align 8, !dbg !2539
  %arrayidx468 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2540
  store i64 %Amu.0, ptr %arrayidx468, align 8, !dbg !2541
  %arrayidx469 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2542
  store i64 %Asa.0, ptr %arrayidx469, align 8, !dbg !2543
  %arrayidx470 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2544
  store i64 %Ase.0, ptr %arrayidx470, align 8, !dbg !2545
  %arrayidx471 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2546
  store i64 %Asi.0, ptr %arrayidx471, align 8, !dbg !2547
  %arrayidx472 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2548
  store i64 %Aso.0, ptr %arrayidx472, align 8, !dbg !2549
  %arrayidx473 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2550
  store i64 %Asu.0, ptr %arrayidx473, align 8, !dbg !2551
  ret void, !dbg !2552
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) #0 !dbg !2553 {
entry:
    #dbg_value(ptr %state, !2554, !DIExpression(), !2555)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2556
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2557
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2558
  %0 = load i32, ptr %pos, align 8, !dbg !2558
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #2, !dbg !2559
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2560
  store i32 168, ptr %pos1, align 8, !dbg !2561
  ret void, !dbg !2562
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) #0 !dbg !2563 {
entry:
    #dbg_value(ptr %s, !2566, !DIExpression(), !2567)
    #dbg_value(i32 %pos, !2568, !DIExpression(), !2567)
    #dbg_value(i32 %r, !2569, !DIExpression(), !2567)
    #dbg_value(i8 %p, !2570, !DIExpression(), !2567)
  %conv = zext i8 %p to i64, !dbg !2571
  %rem = urem i32 %pos, 8, !dbg !2572
  %mul = mul i32 8, %rem, !dbg !2573
  %sh_prom = zext i32 %mul to i64, !dbg !2574
  %shl = shl i64 %conv, %sh_prom, !dbg !2574
  %div = udiv i32 %pos, 8, !dbg !2575
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2576
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2577
  %xor = xor i64 %0, %shl, !dbg !2577
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2577
  %div1 = udiv i32 %r, 8, !dbg !2578
  %sub = sub i32 %div1, 1, !dbg !2579
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s, i32 %sub, !dbg !2580
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !2581
  %xor3 = xor i64 %1, -9223372036854775808, !dbg !2581
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2581
  ret void, !dbg !2582
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2583 {
entry:
    #dbg_value(ptr %out, !2586, !DIExpression(), !2587)
    #dbg_value(i32 %outlen, !2588, !DIExpression(), !2587)
    #dbg_value(ptr %state, !2589, !DIExpression(), !2587)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2590
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2591
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2592
  %0 = load i32, ptr %pos, align 8, !dbg !2592
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168) #2, !dbg !2593
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2594
  store i32 %call, ptr %pos1, align 8, !dbg !2595
  ret void, !dbg !2596
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) #0 !dbg !2597 {
entry:
    #dbg_value(ptr %out, !2600, !DIExpression(), !2601)
    #dbg_value(i32 %outlen, !2602, !DIExpression(), !2601)
    #dbg_value(ptr %s, !2603, !DIExpression(), !2601)
    #dbg_value(i32 %pos, !2604, !DIExpression(), !2601)
    #dbg_value(i32 %r, !2605, !DIExpression(), !2601)
  br label %while.cond, !dbg !2606

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2600, !DIExpression(), !2601)
    #dbg_value(i32 %outlen.addr.0, !2602, !DIExpression(), !2601)
    #dbg_value(i32 %pos.addr.0, !2604, !DIExpression(), !2601)
  %tobool = icmp ne i32 %outlen.addr.0, 0, !dbg !2606
  br i1 %tobool, label %while.body, label %while.end, !dbg !2606

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2607
  br i1 %cmp, label %if.then, label %if.end, !dbg !2607

if.then:                                          ; preds = %while.body
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2610
    #dbg_value(i32 0, !2604, !DIExpression(), !2601)
  br label %if.end, !dbg !2612

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2604, !DIExpression(), !2601)
    #dbg_value(i32 %pos.addr.1, !2613, !DIExpression(), !2601)
  br label %for.cond, !dbg !2614

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.inc ], !dbg !2616
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.inc ]
    #dbg_value(ptr %out.addr.1, !2600, !DIExpression(), !2601)
    #dbg_value(i32 %i.0, !2613, !DIExpression(), !2601)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2617
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !2619

land.rhs:                                         ; preds = %for.cond
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2620
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2621
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !2622
  br i1 %0, label %for.body, label %for.end, !dbg !2623

for.body:                                         ; preds = %land.end
  %div = udiv i32 %i.0, 8, !dbg !2624
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2625
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2625
  %rem = urem i32 %i.0, 8, !dbg !2626
  %mul = mul i32 8, %rem, !dbg !2627
  %sh_prom = zext i32 %mul to i64, !dbg !2628
  %shr = lshr i64 %1, %sh_prom, !dbg !2628
  %conv = trunc i64 %shr to i8, !dbg !2625
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2629
    #dbg_value(ptr %incdec.ptr, !2600, !DIExpression(), !2601)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2630
  br label %for.inc, !dbg !2631

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2632
    #dbg_value(i32 %inc, !2613, !DIExpression(), !2601)
  br label %for.cond, !dbg !2633, !llvm.loop !2634

for.end:                                          ; preds = %land.end
  %sub = sub i32 %i.0, %pos.addr.1, !dbg !2636
  %sub3 = sub i32 %outlen.addr.0, %sub, !dbg !2637
    #dbg_value(i32 %sub3, !2602, !DIExpression(), !2601)
    #dbg_value(i32 %i.0, !2604, !DIExpression(), !2601)
  br label %while.cond, !dbg !2606, !llvm.loop !2638

while.end:                                        ; preds = %while.cond
  ret i32 %pos.addr.0, !dbg !2640
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2641 {
entry:
    #dbg_value(ptr %state, !2642, !DIExpression(), !2643)
    #dbg_value(ptr %in, !2644, !DIExpression(), !2643)
    #dbg_value(i32 %inlen, !2645, !DIExpression(), !2643)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2646
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2647
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2648
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2649
  store i32 168, ptr %pos, align 8, !dbg !2650
  ret void, !dbg !2651
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) #0 !dbg !2652 {
entry:
    #dbg_value(ptr %s, !2655, !DIExpression(), !2656)
    #dbg_value(i32 %r, !2657, !DIExpression(), !2656)
    #dbg_value(ptr %in, !2658, !DIExpression(), !2656)
    #dbg_value(i32 %inlen, !2659, !DIExpression(), !2656)
    #dbg_value(i8 %p, !2660, !DIExpression(), !2656)
    #dbg_value(i32 0, !2661, !DIExpression(), !2656)
  br label %for.cond, !dbg !2662

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2664
    #dbg_value(i32 %i.0, !2661, !DIExpression(), !2656)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2665
  br i1 %cmp, label %for.body, label %for.end, !dbg !2667

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2668
  store i64 0, ptr %arrayidx, align 8, !dbg !2669
  br label %for.inc, !dbg !2668

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2670
    #dbg_value(i32 %inc, !2661, !DIExpression(), !2656)
  br label %for.cond, !dbg !2671, !llvm.loop !2672

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !2674

while.cond:                                       ; preds = %for.end8, %for.end
  %in.addr.0 = phi ptr [ %in, %for.end ], [ %add.ptr9, %for.end8 ]
  %inlen.addr.0 = phi i32 [ %inlen, %for.end ], [ %sub, %for.end8 ]
    #dbg_value(i32 %inlen.addr.0, !2659, !DIExpression(), !2656)
    #dbg_value(ptr %in.addr.0, !2658, !DIExpression(), !2656)
  %cmp1 = icmp uge i32 %inlen.addr.0, %r, !dbg !2675
  br i1 %cmp1, label %while.body, label %while.end, !dbg !2674

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 0, !2661, !DIExpression(), !2656)
  br label %for.cond2, !dbg !2676

for.cond2:                                        ; preds = %for.inc6, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc7, %for.inc6 ], !dbg !2679
    #dbg_value(i32 %i.1, !2661, !DIExpression(), !2656)
  %div = udiv i32 %r, 8, !dbg !2680
  %cmp3 = icmp ult i32 %i.1, %div, !dbg !2682
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !2683

for.body4:                                        ; preds = %for.cond2
  %mul = mul i32 8, %i.1, !dbg !2684
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2685
  %call = call i64 @load64(ptr noundef %add.ptr) #2, !dbg !2686
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2687
  %0 = load i64, ptr %arrayidx5, align 8, !dbg !2688
  %xor = xor i64 %0, %call, !dbg !2688
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2688
  br label %for.inc6, !dbg !2687

for.inc6:                                         ; preds = %for.body4
  %inc7 = add i32 %i.1, 1, !dbg !2689
    #dbg_value(i32 %inc7, !2661, !DIExpression(), !2656)
  br label %for.cond2, !dbg !2690, !llvm.loop !2691

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2693
    #dbg_value(ptr %add.ptr9, !2658, !DIExpression(), !2656)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2694
    #dbg_value(i32 %sub, !2659, !DIExpression(), !2656)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2695
  br label %while.cond, !dbg !2674, !llvm.loop !2696

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 0, !2661, !DIExpression(), !2656)
  br label %for.cond10, !dbg !2698

for.cond10:                                       ; preds = %for.inc18, %while.end
  %i.2 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc18 ], !dbg !2700
    #dbg_value(i32 %i.2, !2661, !DIExpression(), !2656)
  %cmp11 = icmp ult i32 %i.2, %inlen.addr.0, !dbg !2701
  br i1 %cmp11, label %for.body12, label %for.end20, !dbg !2703

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %i.2, !dbg !2704
  %1 = load i8, ptr %arrayidx13, align 1, !dbg !2704
  %conv = zext i8 %1 to i64, !dbg !2705
  %rem = urem i32 %i.2, 8, !dbg !2706
  %mul14 = mul i32 8, %rem, !dbg !2707
  %sh_prom = zext i32 %mul14 to i64, !dbg !2708
  %shl = shl i64 %conv, %sh_prom, !dbg !2708
  %div15 = udiv i32 %i.2, 8, !dbg !2709
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div15, !dbg !2710
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !2711
  %xor17 = xor i64 %2, %shl, !dbg !2711
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2711
  br label %for.inc18, !dbg !2710

for.inc18:                                        ; preds = %for.body12
  %inc19 = add i32 %i.2, 1, !dbg !2712
    #dbg_value(i32 %inc19, !2661, !DIExpression(), !2656)
  br label %for.cond10, !dbg !2713, !llvm.loop !2714

for.end20:                                        ; preds = %for.cond10
  %conv21 = zext i8 %p to i64, !dbg !2716
  %rem22 = urem i32 %i.2, 8, !dbg !2717
  %mul23 = mul i32 8, %rem22, !dbg !2718
  %sh_prom24 = zext i32 %mul23 to i64, !dbg !2719
  %shl25 = shl i64 %conv21, %sh_prom24, !dbg !2719
  %div26 = udiv i32 %i.2, 8, !dbg !2720
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div26, !dbg !2721
  %3 = load i64, ptr %arrayidx27, align 8, !dbg !2722
  %xor28 = xor i64 %3, %shl25, !dbg !2722
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2722
  %sub29 = sub i32 %r, 1, !dbg !2723
  %div30 = udiv i32 %sub29, 8, !dbg !2724
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div30, !dbg !2725
  %4 = load i64, ptr %arrayidx31, align 8, !dbg !2726
  %xor32 = xor i64 %4, -9223372036854775808, !dbg !2726
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2726
  ret void, !dbg !2727
}

; Function Attrs: noinline nounwind optnone
define internal i64 @load64(ptr noundef %x) #0 !dbg !2728 {
entry:
    #dbg_value(ptr %x, !2731, !DIExpression(), !2732)
    #dbg_value(i64 0, !2733, !DIExpression(), !2732)
    #dbg_value(i32 0, !2734, !DIExpression(), !2732)
  br label %for.cond, !dbg !2735

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2737
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2732
    #dbg_value(i64 %r.0, !2733, !DIExpression(), !2732)
    #dbg_value(i32 %i.0, !2734, !DIExpression(), !2732)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2738
  br i1 %cmp, label %for.body, label %for.end, !dbg !2740

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2741
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2741
  %conv = zext i8 %0 to i64, !dbg !2742
  %mul = mul i32 8, %i.0, !dbg !2743
  %sh_prom = zext i32 %mul to i64, !dbg !2744
  %shl = shl i64 %conv, %sh_prom, !dbg !2744
  %or = or i64 %r.0, %shl, !dbg !2745
    #dbg_value(i64 %or, !2733, !DIExpression(), !2732)
  br label %for.inc, !dbg !2746

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2747
    #dbg_value(i32 %inc, !2734, !DIExpression(), !2732)
  br label %for.cond, !dbg !2748, !llvm.loop !2749

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !2751
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2752 {
entry:
    #dbg_value(ptr %out, !2753, !DIExpression(), !2754)
    #dbg_value(i32 %nblocks, !2755, !DIExpression(), !2754)
    #dbg_value(ptr %state, !2756, !DIExpression(), !2754)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2757
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2758
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 168) #2, !dbg !2759
  ret void, !dbg !2760
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) #0 !dbg !2761 {
entry:
    #dbg_value(ptr %out, !2764, !DIExpression(), !2765)
    #dbg_value(i32 %nblocks, !2766, !DIExpression(), !2765)
    #dbg_value(ptr %s, !2767, !DIExpression(), !2765)
    #dbg_value(i32 %r, !2768, !DIExpression(), !2765)
  br label %while.cond, !dbg !2769

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2764, !DIExpression(), !2765)
    #dbg_value(i32 %nblocks.addr.0, !2766, !DIExpression(), !2765)
  %tobool = icmp ne i32 %nblocks.addr.0, 0, !dbg !2769
  br i1 %tobool, label %while.body, label %while.end, !dbg !2769

while.body:                                       ; preds = %while.cond
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2770
    #dbg_value(i32 0, !2772, !DIExpression(), !2765)
  br label %for.cond, !dbg !2773

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !2775
    #dbg_value(i32 %i.0, !2772, !DIExpression(), !2765)
  %div = udiv i32 %r, 8, !dbg !2776
  %cmp = icmp ult i32 %i.0, %div, !dbg !2778
  br i1 %cmp, label %for.body, label %for.end, !dbg !2779

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2780
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2781
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2782
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2782
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2783
  br label %for.inc, !dbg !2783

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2784
    #dbg_value(i32 %inc, !2772, !DIExpression(), !2765)
  br label %for.cond, !dbg !2785, !llvm.loop !2786

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2788
    #dbg_value(ptr %add.ptr1, !2764, !DIExpression(), !2765)
  %sub = sub i32 %nblocks.addr.0, 1, !dbg !2789
    #dbg_value(i32 %sub, !2766, !DIExpression(), !2765)
  br label %while.cond, !dbg !2769, !llvm.loop !2790

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2792
}

; Function Attrs: noinline nounwind optnone
define internal void @store64(ptr noundef %x, i64 noundef %u) #0 !dbg !2793 {
entry:
    #dbg_value(ptr %x, !2796, !DIExpression(), !2797)
    #dbg_value(i64 %u, !2798, !DIExpression(), !2797)
    #dbg_value(i32 0, !2799, !DIExpression(), !2797)
  br label %for.cond, !dbg !2800

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2802
    #dbg_value(i32 %i.0, !2799, !DIExpression(), !2797)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2803
  br i1 %cmp, label %for.body, label %for.end, !dbg !2805

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2806
  %sh_prom = zext i32 %mul to i64, !dbg !2807
  %shr = lshr i64 %u, %sh_prom, !dbg !2807
  %conv = trunc i64 %shr to i8, !dbg !2808
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2809
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2810
  br label %for.inc, !dbg !2809

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2811
    #dbg_value(i32 %inc, !2799, !DIExpression(), !2797)
  br label %for.cond, !dbg !2812, !llvm.loop !2813

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2815
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) #0 !dbg !2816 {
entry:
    #dbg_value(ptr %state, !2817, !DIExpression(), !2818)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2819
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2820
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2821
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2822
  store i32 0, ptr %pos, align 8, !dbg !2823
  ret void, !dbg !2824
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2825 {
entry:
    #dbg_value(ptr %state, !2826, !DIExpression(), !2827)
    #dbg_value(ptr %in, !2828, !DIExpression(), !2827)
    #dbg_value(i32 %inlen, !2829, !DIExpression(), !2827)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2830
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2831
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2832
  %0 = load i32, ptr %pos, align 8, !dbg !2832
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2833
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2834
  store i32 %call, ptr %pos1, align 8, !dbg !2835
  ret void, !dbg !2836
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) #0 !dbg !2837 {
entry:
    #dbg_value(ptr %state, !2838, !DIExpression(), !2839)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2840
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2841
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2842
  %0 = load i32, ptr %pos, align 8, !dbg !2842
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #2, !dbg !2843
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2844
  store i32 136, ptr %pos1, align 8, !dbg !2845
  ret void, !dbg !2846
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2847 {
entry:
    #dbg_value(ptr %out, !2848, !DIExpression(), !2849)
    #dbg_value(i32 %outlen, !2850, !DIExpression(), !2849)
    #dbg_value(ptr %state, !2851, !DIExpression(), !2849)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2852
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2853
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2854
  %0 = load i32, ptr %pos, align 8, !dbg !2854
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136) #2, !dbg !2855
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2856
  store i32 %call, ptr %pos1, align 8, !dbg !2857
  ret void, !dbg !2858
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2859 {
entry:
    #dbg_value(ptr %state, !2860, !DIExpression(), !2861)
    #dbg_value(ptr %in, !2862, !DIExpression(), !2861)
    #dbg_value(i32 %inlen, !2863, !DIExpression(), !2861)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2864
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2865
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2866
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2867
  store i32 136, ptr %pos, align 8, !dbg !2868
  ret void, !dbg !2869
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2870 {
entry:
    #dbg_value(ptr %out, !2871, !DIExpression(), !2872)
    #dbg_value(i32 %nblocks, !2873, !DIExpression(), !2872)
    #dbg_value(ptr %state, !2874, !DIExpression(), !2872)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2875
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2876
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 136) #2, !dbg !2877
  ret void, !dbg !2878
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2879 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2882, !DIExpression(), !2883)
    #dbg_value(i32 %outlen, !2884, !DIExpression(), !2883)
    #dbg_value(ptr %in, !2885, !DIExpression(), !2883)
    #dbg_value(i32 %inlen, !2886, !DIExpression(), !2883)
    #dbg_declare(ptr %state, !2887, !DIExpression(), !2888)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2889
  %div = udiv i32 %outlen, 168, !dbg !2890
    #dbg_value(i32 %div, !2891, !DIExpression(), !2883)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2892
  %mul = mul i32 %div, 168, !dbg !2893
  %sub = sub i32 %outlen, %mul, !dbg !2894
    #dbg_value(i32 %sub, !2884, !DIExpression(), !2883)
  %mul1 = mul i32 %div, 168, !dbg !2895
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2896
    #dbg_value(ptr %add.ptr, !2882, !DIExpression(), !2883)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2897
  ret void, !dbg !2898
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2899 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2900, !DIExpression(), !2901)
    #dbg_value(i32 %outlen, !2902, !DIExpression(), !2901)
    #dbg_value(ptr %in, !2903, !DIExpression(), !2901)
    #dbg_value(i32 %inlen, !2904, !DIExpression(), !2901)
    #dbg_declare(ptr %state, !2905, !DIExpression(), !2906)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2907
  %div = udiv i32 %outlen, 136, !dbg !2908
    #dbg_value(i32 %div, !2909, !DIExpression(), !2901)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !2910
  %mul = mul i32 %div, 136, !dbg !2911
  %sub = sub i32 %outlen, %mul, !dbg !2912
    #dbg_value(i32 %sub, !2902, !DIExpression(), !2901)
  %mul1 = mul i32 %div, 136, !dbg !2913
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2914
    #dbg_value(ptr %add.ptr, !2900, !DIExpression(), !2901)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !2915
  ret void, !dbg !2916
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2917 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2920, !DIExpression(), !2921)
    #dbg_value(ptr %in, !2922, !DIExpression(), !2921)
    #dbg_value(i32 %inlen, !2923, !DIExpression(), !2921)
    #dbg_declare(ptr %s, !2924, !DIExpression(), !2925)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2926
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !2927
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2928
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !2929
    #dbg_value(i32 0, !2930, !DIExpression(), !2921)
  br label %for.cond, !dbg !2931

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2933
    #dbg_value(i32 %i.0, !2930, !DIExpression(), !2921)
  %cmp = icmp ult i32 %i.0, 4, !dbg !2934
  br i1 %cmp, label %for.body, label %for.end, !dbg !2936

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2937
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2938
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2939
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2939
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2940
  br label %for.inc, !dbg !2940

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2941
    #dbg_value(i32 %inc, !2930, !DIExpression(), !2921)
  br label %for.cond, !dbg !2942, !llvm.loop !2943

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2945
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2946 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2947, !DIExpression(), !2948)
    #dbg_value(ptr %in, !2949, !DIExpression(), !2948)
    #dbg_value(i32 %inlen, !2950, !DIExpression(), !2948)
    #dbg_declare(ptr %s, !2951, !DIExpression(), !2952)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2953
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !2954
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2955
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !2956
    #dbg_value(i32 0, !2957, !DIExpression(), !2948)
  br label %for.cond, !dbg !2958

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2960
    #dbg_value(i32 %i.0, !2957, !DIExpression(), !2948)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2961
  br i1 %cmp, label %for.body, label %for.end, !dbg !2963

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !2964
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2965
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2966
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2966
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !2967
  br label %for.inc, !dbg !2967

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2968
    #dbg_value(i32 %inc, !2957, !DIExpression(), !2948)
  br label %for.cond, !dbg !2969, !llvm.loop !2970

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2972
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) #0 !dbg !2973 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2983, !DIExpression(), !2984)
    #dbg_value(ptr %seed, !2985, !DIExpression(), !2984)
    #dbg_value(i8 %x, !2986, !DIExpression(), !2984)
    #dbg_value(i8 %y, !2987, !DIExpression(), !2984)
    #dbg_declare(ptr %extseed, !2988, !DIExpression(), !2992)
  %arraydecay = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !2993
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %seed, i32 noundef 32) #2, !dbg !2994
  %arrayidx = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 32, !dbg !2995
  store i8 %x, ptr %arrayidx, align 1, !dbg !2996
  %arrayidx1 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 33, !dbg !2997
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2998
  %arraydecay2 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !2999
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %arraydecay2, i32 noundef 34) #2, !dbg !3000
  ret void, !dbg !3001
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) #0 !dbg !3002 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !3005, !DIExpression(), !3006)
    #dbg_value(i32 %outlen, !3007, !DIExpression(), !3006)
    #dbg_value(ptr %key, !3008, !DIExpression(), !3006)
    #dbg_value(i8 %nonce, !3009, !DIExpression(), !3006)
    #dbg_declare(ptr %extkey, !3010, !DIExpression(), !3014)
  %arraydecay = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3015
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %key, i32 noundef 32) #2, !dbg !3016
  %arrayidx = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 32, !dbg !3017
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !3018
  %arraydecay1 = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3019
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay1, i32 noundef 33) #2, !dbg !3020
  ret void, !dbg !3021
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) #0 !dbg !3022 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3023, !DIExpression(), !3024)
    #dbg_value(ptr %key, !3025, !DIExpression(), !3024)
    #dbg_value(ptr %input, !3026, !DIExpression(), !3024)
    #dbg_declare(ptr %s, !3027, !DIExpression(), !3028)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %s) #2, !dbg !3029
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %key, i32 noundef 32) #2, !dbg !3030
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %input, i32 noundef 768) #2, !dbg !3031
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %s) #2, !dbg !3032
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef %s) #2, !dbg !3033
  ret void, !dbg !3034
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nounwind memory(none) }

!llvm.dbg.cu = !{!32, !33, !38, !43, !2, !45, !47, !49, !21, !50}
!llvm.ident = !{!51, !51, !51, !51, !51, !51, !51, !51, !51, !51}
!llvm.module.flags = !{!52, !53, !54, !55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !2, file: !11, line: 39, type: !12, isLocal: false, isDefinition: true)
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
!56 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !57, file: !57, line: 25, type: !58, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!80 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !57, file: !57, line: 50, type: !81, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!96 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !57, file: !57, line: 76, type: !97, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!119 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !57, file: !57, line: 113, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!134 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !57, file: !57, line: 140, type: !135, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !66)
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
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 6144, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 768)
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
!173 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !174, file: !174, line: 165, type: !175, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
!174 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!175 = !DISubroutineType(types: !176)
!176 = !{null, !177, !64, !9}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 32)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !180)
!179 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 8192, elements: !181)
!181 = !{!182}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !180, file: !179, line: 9, baseType: !183, size: 8192)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 8192, elements: !192)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !186)
!185 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !187)
!187 = !{!188}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !186, file: !185, line: 12, baseType: !189, size: 4096)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 4096, elements: !190)
!190 = !{!191}
!191 = !DISubrange(count: 256)
!192 = !{!193}
!193 = !DISubrange(count: 2)
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
!329 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !174, file: !174, line: 205, type: !330, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!345 = !DICompositeType(tag: DW_TAG_array_type, baseType: !178, size: 16384, elements: !192)
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
!433 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !174, file: !174, line: 260, type: !434, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!545 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !174, file: !174, line: 314, type: !546, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !66)
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
!588 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !589, file: !589, line: 15, type: !590, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
!589 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!590 = !DISubroutineType(types: !591)
!591 = !{null, !60, !592}
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !593, size: 32)
!593 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !594)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !179, line: 10, baseType: !595)
!595 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !179, line: 8, size: 8192, elements: !596)
!596 = !{!597}
!597 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !595, file: !179, line: 9, baseType: !598, size: 8192)
!598 = !DICompositeType(tag: DW_TAG_array_type, baseType: !599, size: 8192, elements: !192)
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
!709 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !589, file: !589, line: 89, type: !710, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!805 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !589, file: !589, line: 139, type: !590, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!826 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !589, file: !589, line: 156, type: !710, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!847 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !589, file: !589, line: 170, type: !848, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!867 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !589, file: !589, line: 185, type: !848, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!885 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !589, file: !589, line: 202, type: !886, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!921 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !589, file: !589, line: 225, type: !848, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!939 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !589, file: !589, line: 241, type: !940, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !38, retainedNodes: !66)
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
!965 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !966, file: !966, line: 19, type: !967, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1054 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !966, file: !966, line: 83, type: !1055, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1100 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !966, file: !966, line: 124, type: !967, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1159 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !966, file: !966, line: 151, type: !1055, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1210 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !966, file: !966, line: 168, type: !1055, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1256 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !966, file: !966, line: 192, type: !967, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
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
!1302 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !966, file: !966, line: 225, type: !1303, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{null, !1057, !64, !61}
!1305 = !DILocalVariable(name: "r", arg: 1, scope: !1302, file: !966, line: 225, type: !1057)
!1306 = !DILocation(line: 0, scope: !1302)
!1307 = !DILocalVariable(name: "seed", arg: 2, scope: !1302, file: !966, line: 225, type: !64)
!1308 = !DILocalVariable(name: "nonce", arg: 3, scope: !1302, file: !966, line: 225, type: !61)
!1309 = !DILocalVariable(name: "buf", scope: !1302, file: !966, line: 227, type: !1310)
!1310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1536, elements: !1311)
!1311 = !{!1312}
!1312 = !DISubrange(count: 192)
!1313 = !DILocation(line: 227, column: 11, scope: !1302)
!1314 = !DILocation(line: 228, column: 3, scope: !1302)
!1315 = !DILocation(line: 229, column: 20, scope: !1302)
!1316 = !DILocation(line: 229, column: 3, scope: !1302)
!1317 = !DILocation(line: 230, column: 1, scope: !1302)
!1318 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !966, file: !966, line: 244, type: !1303, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1319 = !DILocalVariable(name: "r", arg: 1, scope: !1318, file: !966, line: 244, type: !1057)
!1320 = !DILocation(line: 0, scope: !1318)
!1321 = !DILocalVariable(name: "seed", arg: 2, scope: !1318, file: !966, line: 244, type: !64)
!1322 = !DILocalVariable(name: "nonce", arg: 3, scope: !1318, file: !966, line: 244, type: !61)
!1323 = !DILocalVariable(name: "buf", scope: !1318, file: !966, line: 246, type: !1324)
!1324 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 1024, elements: !17)
!1325 = !DILocation(line: 246, column: 11, scope: !1318)
!1326 = !DILocation(line: 247, column: 3, scope: !1318)
!1327 = !DILocation(line: 248, column: 20, scope: !1318)
!1328 = !DILocation(line: 248, column: 3, scope: !1318)
!1329 = !DILocation(line: 249, column: 1, scope: !1318)
!1330 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !966, file: !966, line: 261, type: !1331, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{null, !1057}
!1333 = !DILocalVariable(name: "r", arg: 1, scope: !1330, file: !966, line: 261, type: !1057)
!1334 = !DILocation(line: 0, scope: !1330)
!1335 = !DILocation(line: 263, column: 10, scope: !1330)
!1336 = !DILocation(line: 263, column: 7, scope: !1330)
!1337 = !DILocation(line: 263, column: 3, scope: !1330)
!1338 = !DILocation(line: 264, column: 3, scope: !1330)
!1339 = !DILocation(line: 265, column: 1, scope: !1330)
!1340 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !966, file: !966, line: 323, type: !1331, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1341 = !DILocalVariable(name: "r", arg: 1, scope: !1340, file: !966, line: 323, type: !1057)
!1342 = !DILocation(line: 0, scope: !1340)
!1343 = !DILocalVariable(name: "i", scope: !1340, file: !966, line: 325, type: !42)
!1344 = !DILocation(line: 326, column: 7, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !966, line: 326, column: 3)
!1346 = !DILocation(line: 326, scope: !1345)
!1347 = !DILocation(line: 326, column: 12, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1345, file: !966, line: 326, column: 3)
!1349 = !DILocation(line: 326, column: 3, scope: !1345)
!1350 = !DILocation(line: 327, column: 38, scope: !1348)
!1351 = !DILocation(line: 327, column: 35, scope: !1348)
!1352 = !DILocation(line: 327, column: 20, scope: !1348)
!1353 = !DILocation(line: 327, column: 8, scope: !1348)
!1354 = !DILocation(line: 327, column: 5, scope: !1348)
!1355 = !DILocation(line: 327, column: 18, scope: !1348)
!1356 = !DILocation(line: 326, column: 22, scope: !1348)
!1357 = !DILocation(line: 326, column: 3, scope: !1348)
!1358 = distinct !{!1358, !1349, !1359, !259}
!1359 = !DILocation(line: 327, column: 47, scope: !1345)
!1360 = !DILocation(line: 328, column: 1, scope: !1340)
!1361 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !966, file: !966, line: 276, type: !1331, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1362 = !DILocalVariable(name: "r", arg: 1, scope: !1361, file: !966, line: 276, type: !1057)
!1363 = !DILocation(line: 0, scope: !1361)
!1364 = !DILocation(line: 278, column: 13, scope: !1361)
!1365 = !DILocation(line: 278, column: 10, scope: !1361)
!1366 = !DILocation(line: 278, column: 3, scope: !1361)
!1367 = !DILocation(line: 279, column: 1, scope: !1361)
!1368 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !966, file: !966, line: 290, type: !1369, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{null, !1057, !969, !969}
!1371 = !DILocalVariable(name: "r", arg: 1, scope: !1368, file: !966, line: 290, type: !1057)
!1372 = !DILocation(line: 0, scope: !1368)
!1373 = !DILocalVariable(name: "a", arg: 2, scope: !1368, file: !966, line: 290, type: !969)
!1374 = !DILocalVariable(name: "b", arg: 3, scope: !1368, file: !966, line: 290, type: !969)
!1375 = !DILocalVariable(name: "i", scope: !1368, file: !966, line: 292, type: !42)
!1376 = !DILocation(line: 293, column: 7, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1368, file: !966, line: 293, column: 3)
!1378 = !DILocation(line: 293, scope: !1377)
!1379 = !DILocation(line: 293, column: 12, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1377, file: !966, line: 293, column: 3)
!1381 = !DILocation(line: 293, column: 3, scope: !1377)
!1382 = !DILocation(line: 294, column: 17, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1380, file: !966, line: 293, column: 28)
!1384 = !DILocation(line: 294, column: 25, scope: !1383)
!1385 = !DILocation(line: 294, column: 14, scope: !1383)
!1386 = !DILocation(line: 294, column: 34, scope: !1383)
!1387 = !DILocation(line: 294, column: 42, scope: !1383)
!1388 = !DILocation(line: 294, column: 31, scope: !1383)
!1389 = !DILocation(line: 294, column: 51, scope: !1383)
!1390 = !DILocation(line: 294, column: 59, scope: !1383)
!1391 = !DILocation(line: 294, column: 48, scope: !1383)
!1392 = !DILocation(line: 294, column: 72, scope: !1383)
!1393 = !DILocation(line: 294, column: 64, scope: !1383)
!1394 = !DILocation(line: 294, column: 5, scope: !1383)
!1395 = !DILocation(line: 295, column: 17, scope: !1383)
!1396 = !DILocation(line: 295, column: 25, scope: !1383)
!1397 = !DILocation(line: 295, column: 27, scope: !1383)
!1398 = !DILocation(line: 295, column: 14, scope: !1383)
!1399 = !DILocation(line: 295, column: 36, scope: !1383)
!1400 = !DILocation(line: 295, column: 44, scope: !1383)
!1401 = !DILocation(line: 295, column: 46, scope: !1383)
!1402 = !DILocation(line: 295, column: 33, scope: !1383)
!1403 = !DILocation(line: 295, column: 55, scope: !1383)
!1404 = !DILocation(line: 295, column: 63, scope: !1383)
!1405 = !DILocation(line: 295, column: 65, scope: !1383)
!1406 = !DILocation(line: 295, column: 52, scope: !1383)
!1407 = !DILocation(line: 295, column: 79, scope: !1383)
!1408 = !DILocation(line: 295, column: 71, scope: !1383)
!1409 = !DILocation(line: 295, column: 70, scope: !1383)
!1410 = !DILocation(line: 295, column: 5, scope: !1383)
!1411 = !DILocation(line: 296, column: 3, scope: !1383)
!1412 = !DILocation(line: 293, column: 24, scope: !1380)
!1413 = !DILocation(line: 293, column: 3, scope: !1380)
!1414 = distinct !{!1414, !1381, !1415, !259}
!1415 = !DILocation(line: 296, column: 3, scope: !1377)
!1416 = !DILocation(line: 297, column: 1, scope: !1368)
!1417 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !966, file: !966, line: 307, type: !1331, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1418 = !DILocalVariable(name: "r", arg: 1, scope: !1417, file: !966, line: 307, type: !1057)
!1419 = !DILocation(line: 0, scope: !1417)
!1420 = !DILocalVariable(name: "f", scope: !1417, file: !966, line: 310, type: !13)
!1421 = !DILocalVariable(name: "i", scope: !1417, file: !966, line: 309, type: !42)
!1422 = !DILocation(line: 311, column: 7, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1417, file: !966, line: 311, column: 3)
!1424 = !DILocation(line: 311, scope: !1423)
!1425 = !DILocation(line: 311, column: 12, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1423, file: !966, line: 311, column: 3)
!1427 = !DILocation(line: 311, column: 3, scope: !1423)
!1428 = !DILocation(line: 312, column: 50, scope: !1426)
!1429 = !DILocation(line: 312, column: 47, scope: !1426)
!1430 = !DILocation(line: 312, column: 38, scope: !1426)
!1431 = !DILocation(line: 312, column: 59, scope: !1426)
!1432 = !DILocation(line: 312, column: 20, scope: !1426)
!1433 = !DILocation(line: 312, column: 8, scope: !1426)
!1434 = !DILocation(line: 312, column: 5, scope: !1426)
!1435 = !DILocation(line: 312, column: 18, scope: !1426)
!1436 = !DILocation(line: 311, column: 22, scope: !1426)
!1437 = !DILocation(line: 311, column: 3, scope: !1426)
!1438 = distinct !{!1438, !1427, !1439, !259}
!1439 = !DILocation(line: 312, column: 61, scope: !1423)
!1440 = !DILocation(line: 313, column: 1, scope: !1417)
!1441 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !966, file: !966, line: 339, type: !1369, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1442 = !DILocalVariable(name: "r", arg: 1, scope: !1441, file: !966, line: 339, type: !1057)
!1443 = !DILocation(line: 0, scope: !1441)
!1444 = !DILocalVariable(name: "a", arg: 2, scope: !1441, file: !966, line: 339, type: !969)
!1445 = !DILocalVariable(name: "b", arg: 3, scope: !1441, file: !966, line: 339, type: !969)
!1446 = !DILocalVariable(name: "i", scope: !1441, file: !966, line: 341, type: !42)
!1447 = !DILocation(line: 342, column: 7, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1441, file: !966, line: 342, column: 3)
!1449 = !DILocation(line: 342, scope: !1448)
!1450 = !DILocation(line: 342, column: 12, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1448, file: !966, line: 342, column: 3)
!1452 = !DILocation(line: 342, column: 3, scope: !1448)
!1453 = !DILocation(line: 343, column: 23, scope: !1451)
!1454 = !DILocation(line: 343, column: 20, scope: !1451)
!1455 = !DILocation(line: 343, column: 38, scope: !1451)
!1456 = !DILocation(line: 343, column: 35, scope: !1451)
!1457 = !DILocation(line: 343, column: 33, scope: !1451)
!1458 = !DILocation(line: 343, column: 8, scope: !1451)
!1459 = !DILocation(line: 343, column: 5, scope: !1451)
!1460 = !DILocation(line: 343, column: 18, scope: !1451)
!1461 = !DILocation(line: 342, column: 22, scope: !1451)
!1462 = !DILocation(line: 342, column: 3, scope: !1451)
!1463 = distinct !{!1463, !1452, !1464, !259}
!1464 = !DILocation(line: 343, column: 46, scope: !1448)
!1465 = !DILocation(line: 344, column: 1, scope: !1441)
!1466 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !966, file: !966, line: 355, type: !1369, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !66)
!1467 = !DILocalVariable(name: "r", arg: 1, scope: !1466, file: !966, line: 355, type: !1057)
!1468 = !DILocation(line: 0, scope: !1466)
!1469 = !DILocalVariable(name: "a", arg: 2, scope: !1466, file: !966, line: 355, type: !969)
!1470 = !DILocalVariable(name: "b", arg: 3, scope: !1466, file: !966, line: 355, type: !969)
!1471 = !DILocalVariable(name: "i", scope: !1466, file: !966, line: 357, type: !42)
!1472 = !DILocation(line: 358, column: 7, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1466, file: !966, line: 358, column: 3)
!1474 = !DILocation(line: 358, scope: !1473)
!1475 = !DILocation(line: 358, column: 12, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1473, file: !966, line: 358, column: 3)
!1477 = !DILocation(line: 358, column: 3, scope: !1473)
!1478 = !DILocation(line: 359, column: 23, scope: !1476)
!1479 = !DILocation(line: 359, column: 20, scope: !1476)
!1480 = !DILocation(line: 359, column: 38, scope: !1476)
!1481 = !DILocation(line: 359, column: 35, scope: !1476)
!1482 = !DILocation(line: 359, column: 33, scope: !1476)
!1483 = !DILocation(line: 359, column: 8, scope: !1476)
!1484 = !DILocation(line: 359, column: 5, scope: !1476)
!1485 = !DILocation(line: 359, column: 18, scope: !1476)
!1486 = !DILocation(line: 358, column: 22, scope: !1476)
!1487 = !DILocation(line: 358, column: 3, scope: !1476)
!1488 = distinct !{!1488, !1477, !1489, !259}
!1489 = !DILocation(line: 359, column: 46, scope: !1473)
!1490 = !DILocation(line: 360, column: 1, scope: !1466)
!1491 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !11, file: !11, line: 80, type: !1492, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{null, !274}
!1494 = !DILocalVariable(name: "r", arg: 1, scope: !1491, file: !11, line: 80, type: !274)
!1495 = !DILocation(line: 0, scope: !1491)
!1496 = !DILocalVariable(name: "k", scope: !1491, file: !11, line: 81, type: !42)
!1497 = !DILocalVariable(name: "len", scope: !1491, file: !11, line: 81, type: !42)
!1498 = !DILocation(line: 85, column: 7, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1491, file: !11, line: 85, column: 3)
!1500 = !DILocation(line: 85, scope: !1499)
!1501 = !DILocation(line: 84, column: 5, scope: !1491)
!1502 = !DILocation(line: 85, column: 22, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1499, file: !11, line: 85, column: 3)
!1504 = !DILocation(line: 85, column: 3, scope: !1499)
!1505 = !DILocalVariable(name: "start", scope: !1491, file: !11, line: 81, type: !42)
!1506 = !DILocation(line: 86, column: 9, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1508, file: !11, line: 86, column: 5)
!1508 = distinct !DILexicalBlock(scope: !1503, file: !11, line: 85, column: 39)
!1509 = !DILocation(line: 86, scope: !1507)
!1510 = !DILocation(line: 86, column: 26, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1507, file: !11, line: 86, column: 5)
!1512 = !DILocation(line: 86, column: 5, scope: !1507)
!1513 = !DILocation(line: 87, column: 21, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1511, file: !11, line: 86, column: 50)
!1515 = !DILocation(line: 87, column: 14, scope: !1514)
!1516 = !DILocalVariable(name: "zeta", scope: !1491, file: !11, line: 82, type: !14)
!1517 = !DILocalVariable(name: "j", scope: !1491, file: !11, line: 81, type: !42)
!1518 = !DILocation(line: 88, column: 11, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1514, file: !11, line: 88, column: 7)
!1520 = !DILocation(line: 88, scope: !1519)
!1521 = !DILocation(line: 88, column: 32, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1519, file: !11, line: 88, column: 7)
!1523 = !DILocation(line: 88, column: 24, scope: !1522)
!1524 = !DILocation(line: 88, column: 7, scope: !1519)
!1525 = !DILocation(line: 89, column: 29, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1522, file: !11, line: 88, column: 44)
!1527 = !DILocation(line: 89, column: 25, scope: !1526)
!1528 = !DILocation(line: 89, column: 13, scope: !1526)
!1529 = !DILocalVariable(name: "t", scope: !1491, file: !11, line: 82, type: !14)
!1530 = !DILocation(line: 90, column: 22, scope: !1526)
!1531 = !DILocation(line: 90, column: 29, scope: !1526)
!1532 = !DILocation(line: 90, column: 27, scope: !1526)
!1533 = !DILocation(line: 90, column: 13, scope: !1526)
!1534 = !DILocation(line: 90, column: 9, scope: !1526)
!1535 = !DILocation(line: 90, column: 20, scope: !1526)
!1536 = !DILocation(line: 91, column: 16, scope: !1526)
!1537 = !DILocation(line: 91, column: 23, scope: !1526)
!1538 = !DILocation(line: 91, column: 21, scope: !1526)
!1539 = !DILocation(line: 91, column: 9, scope: !1526)
!1540 = !DILocation(line: 91, column: 14, scope: !1526)
!1541 = !DILocation(line: 92, column: 7, scope: !1526)
!1542 = !DILocation(line: 88, column: 40, scope: !1522)
!1543 = !DILocation(line: 88, column: 7, scope: !1522)
!1544 = distinct !{!1544, !1524, !1545, !259}
!1545 = !DILocation(line: 92, column: 7, scope: !1519)
!1546 = !DILocation(line: 93, column: 5, scope: !1514)
!1547 = !DILocation(line: 86, column: 43, scope: !1511)
!1548 = !DILocation(line: 86, column: 5, scope: !1511)
!1549 = distinct !{!1549, !1512, !1550, !259}
!1550 = !DILocation(line: 93, column: 5, scope: !1507)
!1551 = !DILocation(line: 94, column: 3, scope: !1508)
!1552 = !DILocation(line: 85, column: 32, scope: !1503)
!1553 = !DILocation(line: 85, column: 3, scope: !1503)
!1554 = distinct !{!1554, !1504, !1555, !259}
!1555 = !DILocation(line: 94, column: 3, scope: !1499)
!1556 = !DILocation(line: 95, column: 1, scope: !1491)
!1557 = distinct !DISubprogram(name: "fqmul", scope: !11, file: !11, line: 68, type: !1558, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{!14, !14, !14}
!1560 = !DILocalVariable(name: "a", arg: 1, scope: !1557, file: !11, line: 68, type: !14)
!1561 = !DILocation(line: 0, scope: !1557)
!1562 = !DILocalVariable(name: "b", arg: 2, scope: !1557, file: !11, line: 68, type: !14)
!1563 = !DILocation(line: 69, column: 28, scope: !1557)
!1564 = !DILocation(line: 69, column: 39, scope: !1557)
!1565 = !DILocation(line: 69, column: 38, scope: !1557)
!1566 = !DILocation(line: 69, column: 10, scope: !1557)
!1567 = !DILocation(line: 69, column: 3, scope: !1557)
!1568 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !11, file: !11, line: 106, type: !1492, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1569 = !DILocalVariable(name: "r", arg: 1, scope: !1568, file: !11, line: 106, type: !274)
!1570 = !DILocation(line: 0, scope: !1568)
!1571 = !DILocalVariable(name: "f", scope: !1568, file: !11, line: 109, type: !13)
!1572 = !DILocalVariable(name: "k", scope: !1568, file: !11, line: 107, type: !42)
!1573 = !DILocalVariable(name: "len", scope: !1568, file: !11, line: 107, type: !42)
!1574 = !DILocation(line: 112, column: 7, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1568, file: !11, line: 112, column: 3)
!1576 = !DILocation(line: 112, scope: !1575)
!1577 = !DILocation(line: 111, column: 5, scope: !1568)
!1578 = !DILocation(line: 112, column: 20, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1575, file: !11, line: 112, column: 3)
!1580 = !DILocation(line: 112, column: 3, scope: !1575)
!1581 = !DILocalVariable(name: "start", scope: !1568, file: !11, line: 107, type: !42)
!1582 = !DILocation(line: 113, column: 9, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1584, file: !11, line: 113, column: 5)
!1584 = distinct !DILexicalBlock(scope: !1579, file: !11, line: 112, column: 39)
!1585 = !DILocation(line: 113, scope: !1583)
!1586 = !DILocation(line: 113, column: 26, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1583, file: !11, line: 113, column: 5)
!1588 = !DILocation(line: 113, column: 5, scope: !1583)
!1589 = !DILocation(line: 114, column: 21, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1587, file: !11, line: 113, column: 50)
!1591 = !DILocation(line: 114, column: 14, scope: !1590)
!1592 = !DILocalVariable(name: "zeta", scope: !1568, file: !11, line: 108, type: !14)
!1593 = !DILocalVariable(name: "j", scope: !1568, file: !11, line: 107, type: !42)
!1594 = !DILocation(line: 115, column: 11, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1590, file: !11, line: 115, column: 7)
!1596 = !DILocation(line: 115, scope: !1595)
!1597 = !DILocation(line: 115, column: 32, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1595, file: !11, line: 115, column: 7)
!1599 = !DILocation(line: 115, column: 24, scope: !1598)
!1600 = !DILocation(line: 115, column: 7, scope: !1595)
!1601 = !DILocation(line: 116, column: 13, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1598, file: !11, line: 115, column: 44)
!1603 = !DILocalVariable(name: "t", scope: !1568, file: !11, line: 108, type: !14)
!1604 = !DILocation(line: 117, column: 31, scope: !1602)
!1605 = !DILocation(line: 117, column: 39, scope: !1602)
!1606 = !DILocation(line: 117, column: 35, scope: !1602)
!1607 = !DILocation(line: 117, column: 33, scope: !1602)
!1608 = !DILocation(line: 117, column: 16, scope: !1602)
!1609 = !DILocation(line: 117, column: 9, scope: !1602)
!1610 = !DILocation(line: 117, column: 14, scope: !1602)
!1611 = !DILocation(line: 118, column: 26, scope: !1602)
!1612 = !DILocation(line: 118, column: 22, scope: !1602)
!1613 = !DILocation(line: 118, column: 35, scope: !1602)
!1614 = !DILocation(line: 118, column: 33, scope: !1602)
!1615 = !DILocation(line: 118, column: 13, scope: !1602)
!1616 = !DILocation(line: 118, column: 9, scope: !1602)
!1617 = !DILocation(line: 118, column: 20, scope: !1602)
!1618 = !DILocation(line: 119, column: 38, scope: !1602)
!1619 = !DILocation(line: 119, column: 34, scope: !1602)
!1620 = !DILocation(line: 119, column: 22, scope: !1602)
!1621 = !DILocation(line: 119, column: 13, scope: !1602)
!1622 = !DILocation(line: 119, column: 9, scope: !1602)
!1623 = !DILocation(line: 119, column: 20, scope: !1602)
!1624 = !DILocation(line: 120, column: 7, scope: !1602)
!1625 = !DILocation(line: 115, column: 40, scope: !1598)
!1626 = !DILocation(line: 115, column: 7, scope: !1598)
!1627 = distinct !{!1627, !1600, !1628, !259}
!1628 = !DILocation(line: 120, column: 7, scope: !1595)
!1629 = !DILocation(line: 121, column: 5, scope: !1590)
!1630 = !DILocation(line: 113, column: 43, scope: !1587)
!1631 = !DILocation(line: 113, column: 5, scope: !1587)
!1632 = distinct !{!1632, !1588, !1633, !259}
!1633 = !DILocation(line: 121, column: 5, scope: !1583)
!1634 = !DILocation(line: 122, column: 3, scope: !1584)
!1635 = !DILocation(line: 112, column: 32, scope: !1579)
!1636 = !DILocation(line: 112, column: 3, scope: !1579)
!1637 = distinct !{!1637, !1580, !1638, !259}
!1638 = !DILocation(line: 122, column: 3, scope: !1575)
!1639 = !DILocation(line: 124, column: 7, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1568, file: !11, line: 124, column: 3)
!1641 = !DILocation(line: 124, scope: !1640)
!1642 = !DILocation(line: 124, column: 16, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1640, file: !11, line: 124, column: 3)
!1644 = !DILocation(line: 124, column: 3, scope: !1640)
!1645 = !DILocation(line: 125, column: 18, scope: !1643)
!1646 = !DILocation(line: 125, column: 12, scope: !1643)
!1647 = !DILocation(line: 125, column: 5, scope: !1643)
!1648 = !DILocation(line: 125, column: 10, scope: !1643)
!1649 = !DILocation(line: 124, column: 24, scope: !1643)
!1650 = !DILocation(line: 124, column: 3, scope: !1643)
!1651 = distinct !{!1651, !1644, !1652, !259}
!1652 = !DILocation(line: 125, column: 25, scope: !1640)
!1653 = !DILocation(line: 126, column: 1, scope: !1568)
!1654 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !11, file: !11, line: 139, type: !1655, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !66)
!1655 = !DISubroutineType(types: !1656)
!1656 = !{null, !274, !1657, !1657, !14}
!1657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!1658 = !DILocalVariable(name: "r", arg: 1, scope: !1654, file: !11, line: 139, type: !274)
!1659 = !DILocation(line: 0, scope: !1654)
!1660 = !DILocalVariable(name: "a", arg: 2, scope: !1654, file: !11, line: 139, type: !1657)
!1661 = !DILocalVariable(name: "b", arg: 3, scope: !1654, file: !11, line: 139, type: !1657)
!1662 = !DILocalVariable(name: "zeta", arg: 4, scope: !1654, file: !11, line: 139, type: !14)
!1663 = !DILocation(line: 141, column: 17, scope: !1654)
!1664 = !DILocation(line: 141, column: 23, scope: !1654)
!1665 = !DILocation(line: 141, column: 11, scope: !1654)
!1666 = !DILocation(line: 141, column: 3, scope: !1654)
!1667 = !DILocation(line: 141, column: 9, scope: !1654)
!1668 = !DILocation(line: 142, column: 17, scope: !1654)
!1669 = !DILocation(line: 142, column: 11, scope: !1654)
!1670 = !DILocation(line: 142, column: 3, scope: !1654)
!1671 = !DILocation(line: 142, column: 9, scope: !1654)
!1672 = !DILocation(line: 143, column: 17, scope: !1654)
!1673 = !DILocation(line: 143, column: 23, scope: !1654)
!1674 = !DILocation(line: 143, column: 11, scope: !1654)
!1675 = !DILocation(line: 143, column: 3, scope: !1654)
!1676 = !DILocation(line: 143, column: 8, scope: !1654)
!1677 = !DILocation(line: 144, column: 17, scope: !1654)
!1678 = !DILocation(line: 144, column: 23, scope: !1654)
!1679 = !DILocation(line: 144, column: 11, scope: !1654)
!1680 = !DILocation(line: 144, column: 3, scope: !1654)
!1681 = !DILocation(line: 144, column: 9, scope: !1654)
!1682 = !DILocation(line: 145, column: 17, scope: !1654)
!1683 = !DILocation(line: 145, column: 23, scope: !1654)
!1684 = !DILocation(line: 145, column: 11, scope: !1654)
!1685 = !DILocation(line: 145, column: 3, scope: !1654)
!1686 = !DILocation(line: 145, column: 8, scope: !1654)
!1687 = !DILocation(line: 146, column: 1, scope: !1654)
!1688 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1689, file: !1689, line: 110, type: !1690, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1689 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1690 = !DISubroutineType(types: !1691)
!1691 = !{null, !1692, !64}
!1692 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1693, size: 32)
!1693 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !185, line: 13, baseType: !1694)
!1694 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !185, line: 11, size: 4096, elements: !1695)
!1695 = !{!1696}
!1696 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1694, file: !185, line: 12, baseType: !189, size: 4096)
!1697 = !DILocalVariable(name: "r", arg: 1, scope: !1688, file: !1689, line: 110, type: !1692)
!1698 = !DILocation(line: 0, scope: !1688)
!1699 = !DILocalVariable(name: "buf", arg: 2, scope: !1688, file: !1689, line: 110, type: !64)
!1700 = !DILocation(line: 115, column: 3, scope: !1688)
!1701 = !DILocation(line: 119, column: 1, scope: !1688)
!1702 = distinct !DISubprogram(name: "cbd3", scope: !1689, file: !1689, line: 89, type: !1690, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1703 = !DILocalVariable(name: "r", arg: 1, scope: !1702, file: !1689, line: 89, type: !1692)
!1704 = !DILocation(line: 0, scope: !1702)
!1705 = !DILocalVariable(name: "buf", arg: 2, scope: !1702, file: !1689, line: 89, type: !64)
!1706 = !DILocalVariable(name: "i", scope: !1702, file: !1689, line: 91, type: !42)
!1707 = !DILocation(line: 95, column: 7, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1702, file: !1689, line: 95, column: 3)
!1709 = !DILocation(line: 95, scope: !1708)
!1710 = !DILocation(line: 95, column: 12, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !1689, line: 95, column: 3)
!1712 = !DILocation(line: 95, column: 3, scope: !1708)
!1713 = !DILocation(line: 96, column: 35, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1711, file: !1689, line: 95, column: 28)
!1715 = !DILocation(line: 96, column: 33, scope: !1714)
!1716 = !DILocation(line: 96, column: 10, scope: !1714)
!1717 = !DILocalVariable(name: "t", scope: !1702, file: !1689, line: 92, type: !40)
!1718 = !DILocation(line: 97, column: 12, scope: !1714)
!1719 = !DILocalVariable(name: "d", scope: !1702, file: !1689, line: 92, type: !40)
!1720 = !DILocation(line: 98, column: 12, scope: !1714)
!1721 = !DILocation(line: 98, column: 17, scope: !1714)
!1722 = !DILocation(line: 98, column: 7, scope: !1714)
!1723 = !DILocation(line: 99, column: 12, scope: !1714)
!1724 = !DILocation(line: 99, column: 17, scope: !1714)
!1725 = !DILocation(line: 99, column: 7, scope: !1714)
!1726 = !DILocalVariable(name: "j", scope: !1702, file: !1689, line: 91, type: !42)
!1727 = !DILocation(line: 101, column: 9, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1714, file: !1689, line: 101, column: 5)
!1729 = !DILocation(line: 101, scope: !1728)
!1730 = !DILocation(line: 101, column: 14, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1728, file: !1689, line: 101, column: 5)
!1732 = !DILocation(line: 101, column: 5, scope: !1728)
!1733 = !DILocation(line: 102, column: 19, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1731, file: !1689, line: 101, column: 22)
!1735 = !DILocation(line: 102, column: 21, scope: !1734)
!1736 = !DILocation(line: 102, column: 14, scope: !1734)
!1737 = !DILocation(line: 102, column: 26, scope: !1734)
!1738 = !DILocation(line: 102, column: 11, scope: !1734)
!1739 = !DILocalVariable(name: "a", scope: !1702, file: !1689, line: 93, type: !14)
!1740 = !DILocation(line: 103, column: 19, scope: !1734)
!1741 = !DILocation(line: 103, column: 21, scope: !1734)
!1742 = !DILocation(line: 103, column: 14, scope: !1734)
!1743 = !DILocation(line: 103, column: 26, scope: !1734)
!1744 = !DILocation(line: 103, column: 11, scope: !1734)
!1745 = !DILocalVariable(name: "b", scope: !1702, file: !1689, line: 93, type: !14)
!1746 = !DILocation(line: 104, column: 26, scope: !1734)
!1747 = !DILocation(line: 104, column: 30, scope: !1734)
!1748 = !DILocation(line: 104, column: 28, scope: !1734)
!1749 = !DILocation(line: 104, column: 10, scope: !1734)
!1750 = !DILocation(line: 104, column: 18, scope: !1734)
!1751 = !DILocation(line: 104, column: 20, scope: !1734)
!1752 = !DILocation(line: 104, column: 7, scope: !1734)
!1753 = !DILocation(line: 104, column: 24, scope: !1734)
!1754 = !DILocation(line: 105, column: 5, scope: !1734)
!1755 = !DILocation(line: 101, column: 18, scope: !1731)
!1756 = !DILocation(line: 101, column: 5, scope: !1731)
!1757 = distinct !{!1757, !1732, !1758, !259}
!1758 = !DILocation(line: 105, column: 5, scope: !1728)
!1759 = !DILocation(line: 106, column: 3, scope: !1714)
!1760 = !DILocation(line: 95, column: 24, scope: !1711)
!1761 = !DILocation(line: 95, column: 3, scope: !1711)
!1762 = distinct !{!1762, !1712, !1763, !259}
!1763 = !DILocation(line: 106, column: 3, scope: !1708)
!1764 = !DILocation(line: 107, column: 1, scope: !1702)
!1765 = distinct !DISubprogram(name: "load24_littleendian", scope: !1689, file: !1689, line: 37, type: !1766, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1766 = !DISubroutineType(types: !1767)
!1767 = !{!40, !64}
!1768 = !DILocalVariable(name: "x", arg: 1, scope: !1765, file: !1689, line: 37, type: !64)
!1769 = !DILocation(line: 0, scope: !1765)
!1770 = !DILocation(line: 40, column: 18, scope: !1765)
!1771 = !DILocation(line: 40, column: 8, scope: !1765)
!1772 = !DILocalVariable(name: "r", scope: !1765, file: !1689, line: 39, type: !40)
!1773 = !DILocation(line: 41, column: 18, scope: !1765)
!1774 = !DILocation(line: 41, column: 8, scope: !1765)
!1775 = !DILocation(line: 41, column: 23, scope: !1765)
!1776 = !DILocation(line: 41, column: 5, scope: !1765)
!1777 = !DILocation(line: 42, column: 18, scope: !1765)
!1778 = !DILocation(line: 42, column: 8, scope: !1765)
!1779 = !DILocation(line: 42, column: 23, scope: !1765)
!1780 = !DILocation(line: 42, column: 5, scope: !1765)
!1781 = !DILocation(line: 43, column: 3, scope: !1765)
!1782 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1689, file: !1689, line: 121, type: !1690, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1783 = !DILocalVariable(name: "r", arg: 1, scope: !1782, file: !1689, line: 121, type: !1692)
!1784 = !DILocation(line: 0, scope: !1782)
!1785 = !DILocalVariable(name: "buf", arg: 2, scope: !1782, file: !1689, line: 121, type: !64)
!1786 = !DILocation(line: 124, column: 3, scope: !1782)
!1787 = !DILocation(line: 128, column: 1, scope: !1782)
!1788 = distinct !DISubprogram(name: "cbd2", scope: !1689, file: !1689, line: 58, type: !1690, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1789 = !DILocalVariable(name: "r", arg: 1, scope: !1788, file: !1689, line: 58, type: !1692)
!1790 = !DILocation(line: 0, scope: !1788)
!1791 = !DILocalVariable(name: "buf", arg: 2, scope: !1788, file: !1689, line: 58, type: !64)
!1792 = !DILocalVariable(name: "i", scope: !1788, file: !1689, line: 60, type: !42)
!1793 = !DILocation(line: 64, column: 7, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1788, file: !1689, line: 64, column: 3)
!1795 = !DILocation(line: 64, scope: !1794)
!1796 = !DILocation(line: 64, column: 12, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1794, file: !1689, line: 64, column: 3)
!1798 = !DILocation(line: 64, column: 3, scope: !1794)
!1799 = !DILocation(line: 65, column: 35, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1797, file: !1689, line: 64, column: 28)
!1801 = !DILocation(line: 65, column: 33, scope: !1800)
!1802 = !DILocation(line: 65, column: 10, scope: !1800)
!1803 = !DILocalVariable(name: "t", scope: !1788, file: !1689, line: 61, type: !40)
!1804 = !DILocation(line: 66, column: 12, scope: !1800)
!1805 = !DILocalVariable(name: "d", scope: !1788, file: !1689, line: 61, type: !40)
!1806 = !DILocation(line: 67, column: 12, scope: !1800)
!1807 = !DILocation(line: 67, column: 17, scope: !1800)
!1808 = !DILocation(line: 67, column: 7, scope: !1800)
!1809 = !DILocalVariable(name: "j", scope: !1788, file: !1689, line: 60, type: !42)
!1810 = !DILocation(line: 69, column: 9, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1800, file: !1689, line: 69, column: 5)
!1812 = !DILocation(line: 69, scope: !1811)
!1813 = !DILocation(line: 69, column: 14, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1811, file: !1689, line: 69, column: 5)
!1815 = !DILocation(line: 69, column: 5, scope: !1811)
!1816 = !DILocation(line: 70, column: 19, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1814, file: !1689, line: 69, column: 22)
!1818 = !DILocation(line: 70, column: 21, scope: !1817)
!1819 = !DILocation(line: 70, column: 14, scope: !1817)
!1820 = !DILocation(line: 70, column: 26, scope: !1817)
!1821 = !DILocation(line: 70, column: 11, scope: !1817)
!1822 = !DILocalVariable(name: "a", scope: !1788, file: !1689, line: 62, type: !14)
!1823 = !DILocation(line: 71, column: 19, scope: !1817)
!1824 = !DILocation(line: 71, column: 21, scope: !1817)
!1825 = !DILocation(line: 71, column: 14, scope: !1817)
!1826 = !DILocation(line: 71, column: 26, scope: !1817)
!1827 = !DILocation(line: 71, column: 11, scope: !1817)
!1828 = !DILocalVariable(name: "b", scope: !1788, file: !1689, line: 62, type: !14)
!1829 = !DILocation(line: 72, column: 26, scope: !1817)
!1830 = !DILocation(line: 72, column: 30, scope: !1817)
!1831 = !DILocation(line: 72, column: 28, scope: !1817)
!1832 = !DILocation(line: 72, column: 10, scope: !1817)
!1833 = !DILocation(line: 72, column: 18, scope: !1817)
!1834 = !DILocation(line: 72, column: 20, scope: !1817)
!1835 = !DILocation(line: 72, column: 7, scope: !1817)
!1836 = !DILocation(line: 72, column: 24, scope: !1817)
!1837 = !DILocation(line: 73, column: 5, scope: !1817)
!1838 = !DILocation(line: 69, column: 18, scope: !1814)
!1839 = !DILocation(line: 69, column: 5, scope: !1814)
!1840 = distinct !{!1840, !1815, !1841, !259}
!1841 = !DILocation(line: 73, column: 5, scope: !1811)
!1842 = !DILocation(line: 74, column: 3, scope: !1800)
!1843 = !DILocation(line: 64, column: 24, scope: !1797)
!1844 = !DILocation(line: 64, column: 3, scope: !1797)
!1845 = distinct !{!1845, !1798, !1846, !259}
!1846 = !DILocation(line: 74, column: 3, scope: !1794)
!1847 = !DILocation(line: 75, column: 1, scope: !1788)
!1848 = distinct !DISubprogram(name: "load32_littleendian", scope: !1689, file: !1689, line: 15, type: !1766, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!1849 = !DILocalVariable(name: "x", arg: 1, scope: !1848, file: !1689, line: 15, type: !64)
!1850 = !DILocation(line: 0, scope: !1848)
!1851 = !DILocation(line: 18, column: 18, scope: !1848)
!1852 = !DILocation(line: 18, column: 8, scope: !1848)
!1853 = !DILocalVariable(name: "r", scope: !1848, file: !1689, line: 17, type: !40)
!1854 = !DILocation(line: 19, column: 18, scope: !1848)
!1855 = !DILocation(line: 19, column: 8, scope: !1848)
!1856 = !DILocation(line: 19, column: 23, scope: !1848)
!1857 = !DILocation(line: 19, column: 5, scope: !1848)
!1858 = !DILocation(line: 20, column: 18, scope: !1848)
!1859 = !DILocation(line: 20, column: 8, scope: !1848)
!1860 = !DILocation(line: 20, column: 23, scope: !1848)
!1861 = !DILocation(line: 20, column: 5, scope: !1848)
!1862 = !DILocation(line: 21, column: 18, scope: !1848)
!1863 = !DILocation(line: 21, column: 8, scope: !1848)
!1864 = !DILocation(line: 21, column: 23, scope: !1848)
!1865 = !DILocation(line: 21, column: 5, scope: !1848)
!1866 = !DILocation(line: 22, column: 3, scope: !1848)
!1867 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1868, file: !1868, line: 16, type: !1869, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1868 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1869 = !DISubroutineType(types: !48)
!1870 = !DILocalVariable(name: "a", arg: 1, scope: !1867, file: !1868, line: 16, type: !5)
!1871 = !DILocation(line: 0, scope: !1867)
!1872 = !DILocation(line: 20, column: 7, scope: !1867)
!1873 = !DILocation(line: 20, column: 17, scope: !1867)
!1874 = !DILocalVariable(name: "t", scope: !1867, file: !1868, line: 18, type: !14)
!1875 = !DILocation(line: 21, column: 12, scope: !1867)
!1876 = !DILocation(line: 21, column: 22, scope: !1867)
!1877 = !DILocation(line: 21, column: 10, scope: !1867)
!1878 = !DILocation(line: 21, column: 32, scope: !1867)
!1879 = !DILocation(line: 21, column: 7, scope: !1867)
!1880 = !DILocation(line: 22, column: 3, scope: !1867)
!1881 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1868, file: !1868, line: 35, type: !1882, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1882 = !DISubroutineType(types: !1883)
!1883 = !{!14, !14}
!1884 = !DILocalVariable(name: "a", arg: 1, scope: !1881, file: !1868, line: 35, type: !14)
!1885 = !DILocation(line: 0, scope: !1881)
!1886 = !DILocalVariable(name: "v", scope: !1881, file: !1868, line: 37, type: !13)
!1887 = !DILocation(line: 39, column: 20, scope: !1881)
!1888 = !DILocation(line: 39, column: 19, scope: !1881)
!1889 = !DILocation(line: 39, column: 22, scope: !1881)
!1890 = !DILocation(line: 39, column: 33, scope: !1881)
!1891 = !DILocation(line: 39, column: 8, scope: !1881)
!1892 = !DILocalVariable(name: "t", scope: !1881, file: !1868, line: 36, type: !14)
!1893 = !DILocation(line: 40, column: 5, scope: !1881)
!1894 = !DILocation(line: 41, column: 10, scope: !1881)
!1895 = !DILocation(line: 41, column: 14, scope: !1881)
!1896 = !DILocation(line: 41, column: 12, scope: !1881)
!1897 = !DILocation(line: 41, column: 3, scope: !1881)
!1898 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !1899, file: !1899, line: 16, type: !1900, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1899 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!1900 = !DISubroutineType(types: !1901)
!1901 = !{!9, !64, !64, !1902}
!1902 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1903, line: 214, baseType: !42)
!1903 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!1904 = !DILocalVariable(name: "a", arg: 1, scope: !1898, file: !1899, line: 16, type: !64)
!1905 = !DILocation(line: 0, scope: !1898)
!1906 = !DILocalVariable(name: "b", arg: 2, scope: !1898, file: !1899, line: 16, type: !64)
!1907 = !DILocalVariable(name: "len", arg: 3, scope: !1898, file: !1899, line: 16, type: !1902)
!1908 = !DILocalVariable(name: "r", scope: !1898, file: !1899, line: 19, type: !61)
!1909 = !DILocalVariable(name: "i", scope: !1898, file: !1899, line: 18, type: !1902)
!1910 = !DILocation(line: 21, column: 7, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1898, file: !1899, line: 21, column: 3)
!1912 = !DILocation(line: 21, scope: !1911)
!1913 = !DILocation(line: 21, column: 12, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1911, file: !1899, line: 21, column: 3)
!1915 = !DILocation(line: 21, column: 3, scope: !1911)
!1916 = !DILocation(line: 22, column: 10, scope: !1914)
!1917 = !DILocation(line: 22, column: 17, scope: !1914)
!1918 = !DILocation(line: 22, column: 15, scope: !1914)
!1919 = !DILocation(line: 22, column: 7, scope: !1914)
!1920 = !DILocation(line: 22, column: 5, scope: !1914)
!1921 = !DILocation(line: 21, column: 18, scope: !1914)
!1922 = !DILocation(line: 21, column: 3, scope: !1914)
!1923 = distinct !{!1923, !1915, !1924, !259}
!1924 = !DILocation(line: 22, column: 20, scope: !1911)
!1925 = !DILocation(line: 24, column: 12, scope: !1898)
!1926 = !DILocation(line: 24, column: 11, scope: !1898)
!1927 = !DILocation(line: 24, column: 25, scope: !1898)
!1928 = !DILocation(line: 24, column: 10, scope: !1898)
!1929 = !DILocation(line: 24, column: 3, scope: !1898)
!1930 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !1899, file: !1899, line: 40, type: !1931, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1931 = !DISubroutineType(types: !1932)
!1932 = !{null, !60, !64, !1902, !61}
!1933 = !DILocalVariable(name: "r", arg: 1, scope: !1930, file: !1899, line: 40, type: !60)
!1934 = !DILocation(line: 0, scope: !1930)
!1935 = !DILocalVariable(name: "x", arg: 2, scope: !1930, file: !1899, line: 40, type: !64)
!1936 = !DILocalVariable(name: "len", arg: 3, scope: !1930, file: !1899, line: 40, type: !1902)
!1937 = !DILocalVariable(name: "b", arg: 4, scope: !1930, file: !1899, line: 40, type: !61)
!1938 = !DILocation(line: 51, column: 3, scope: !1930)
!1939 = !{i64 1722}
!1940 = !DILocation(line: 54, column: 8, scope: !1930)
!1941 = !DILocation(line: 54, column: 7, scope: !1930)
!1942 = !DILocalVariable(name: "i", scope: !1930, file: !1899, line: 42, type: !1902)
!1943 = !DILocation(line: 55, column: 7, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1930, file: !1899, line: 55, column: 3)
!1945 = !DILocation(line: 55, scope: !1944)
!1946 = !DILocation(line: 55, column: 12, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1944, file: !1899, line: 55, column: 3)
!1948 = !DILocation(line: 55, column: 3, scope: !1944)
!1949 = !DILocation(line: 56, column: 13, scope: !1947)
!1950 = !DILocation(line: 56, column: 18, scope: !1947)
!1951 = !DILocation(line: 56, column: 25, scope: !1947)
!1952 = !DILocation(line: 56, column: 23, scope: !1947)
!1953 = !DILocation(line: 56, column: 15, scope: !1947)
!1954 = !DILocation(line: 56, column: 5, scope: !1947)
!1955 = !DILocation(line: 56, column: 10, scope: !1947)
!1956 = !DILocation(line: 55, column: 18, scope: !1947)
!1957 = !DILocation(line: 55, column: 3, scope: !1947)
!1958 = distinct !{!1958, !1948, !1959, !259}
!1959 = !DILocation(line: 56, column: 29, scope: !1944)
!1960 = !DILocation(line: 57, column: 1, scope: !1930)
!1961 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !1899, file: !1899, line: 71, type: !1962, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !49, retainedNodes: !66)
!1962 = !DISubroutineType(types: !1963)
!1963 = !{null, !274, !14, !35}
!1964 = !DILocalVariable(name: "r", arg: 1, scope: !1961, file: !1899, line: 71, type: !274)
!1965 = !DILocation(line: 0, scope: !1961)
!1966 = !DILocalVariable(name: "v", arg: 2, scope: !1961, file: !1899, line: 71, type: !14)
!1967 = !DILocalVariable(name: "b", arg: 3, scope: !1961, file: !1899, line: 71, type: !35)
!1968 = !DILocation(line: 73, column: 8, scope: !1961)
!1969 = !DILocation(line: 73, column: 7, scope: !1961)
!1970 = !DILocation(line: 74, column: 9, scope: !1961)
!1971 = !DILocation(line: 74, column: 15, scope: !1961)
!1972 = !DILocation(line: 74, column: 14, scope: !1961)
!1973 = !DILocation(line: 74, column: 21, scope: !1961)
!1974 = !DILocation(line: 74, column: 19, scope: !1961)
!1975 = !DILocation(line: 74, column: 11, scope: !1961)
!1976 = !DILocation(line: 74, column: 6, scope: !1961)
!1977 = !DILocation(line: 75, column: 1, scope: !1961)
!1978 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !27, file: !27, line: 523, type: !1979, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1979 = !DISubroutineType(types: !1980)
!1980 = !{null, !1981}
!1981 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1982, size: 32)
!1982 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !1983)
!1983 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !1984)
!1984 = !{!1985, !1986}
!1985 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1983, file: !207, line: 15, baseType: !211, size: 1600)
!1986 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1983, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!1987 = !DILocalVariable(name: "state", arg: 1, scope: !1978, file: !27, line: 523, type: !1981)
!1988 = !DILocation(line: 0, scope: !1978)
!1989 = !DILocation(line: 525, column: 22, scope: !1978)
!1990 = !DILocation(line: 525, column: 15, scope: !1978)
!1991 = !DILocation(line: 525, column: 3, scope: !1978)
!1992 = !DILocation(line: 526, column: 10, scope: !1978)
!1993 = !DILocation(line: 526, column: 14, scope: !1978)
!1994 = !DILocation(line: 527, column: 1, scope: !1978)
!1995 = distinct !DISubprogram(name: "keccak_init", scope: !27, file: !27, line: 353, type: !1996, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!1996 = !DISubroutineType(types: !1997)
!1997 = !{null, !1998}
!1998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!1999 = !DILocalVariable(name: "s", arg: 1, scope: !1995, file: !27, line: 353, type: !1998)
!2000 = !DILocation(line: 0, scope: !1995)
!2001 = !DILocalVariable(name: "i", scope: !1995, file: !27, line: 355, type: !42)
!2002 = !DILocation(line: 356, column: 7, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1995, file: !27, line: 356, column: 3)
!2004 = !DILocation(line: 356, scope: !2003)
!2005 = !DILocation(line: 356, column: 12, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !2003, file: !27, line: 356, column: 3)
!2007 = !DILocation(line: 356, column: 3, scope: !2003)
!2008 = !DILocation(line: 357, column: 5, scope: !2006)
!2009 = !DILocation(line: 357, column: 10, scope: !2006)
!2010 = !DILocation(line: 356, column: 17, scope: !2006)
!2011 = !DILocation(line: 356, column: 3, scope: !2006)
!2012 = distinct !{!2012, !2007, !2013, !259}
!2013 = !DILocation(line: 357, column: 12, scope: !2003)
!2014 = !DILocation(line: 358, column: 1, scope: !1995)
!2015 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !27, file: !27, line: 538, type: !2016, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2016 = !DISubroutineType(types: !2017)
!2017 = !{null, !1981, !64, !1902}
!2018 = !DILocalVariable(name: "state", arg: 1, scope: !2015, file: !27, line: 538, type: !1981)
!2019 = !DILocation(line: 0, scope: !2015)
!2020 = !DILocalVariable(name: "in", arg: 2, scope: !2015, file: !27, line: 538, type: !64)
!2021 = !DILocalVariable(name: "inlen", arg: 3, scope: !2015, file: !27, line: 538, type: !1902)
!2022 = !DILocation(line: 540, column: 37, scope: !2015)
!2023 = !DILocation(line: 540, column: 30, scope: !2015)
!2024 = !DILocation(line: 540, column: 47, scope: !2015)
!2025 = !DILocation(line: 540, column: 16, scope: !2015)
!2026 = !DILocation(line: 540, column: 10, scope: !2015)
!2027 = !DILocation(line: 540, column: 14, scope: !2015)
!2028 = !DILocation(line: 541, column: 1, scope: !2015)
!2029 = distinct !DISubprogram(name: "keccak_absorb", scope: !27, file: !27, line: 373, type: !2030, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2030 = !DISubroutineType(types: !2031)
!2031 = !{!42, !1998, !42, !42, !64, !1902}
!2032 = !DILocalVariable(name: "s", arg: 1, scope: !2029, file: !27, line: 373, type: !1998)
!2033 = !DILocation(line: 0, scope: !2029)
!2034 = !DILocalVariable(name: "pos", arg: 2, scope: !2029, file: !27, line: 374, type: !42)
!2035 = !DILocalVariable(name: "r", arg: 3, scope: !2029, file: !27, line: 375, type: !42)
!2036 = !DILocalVariable(name: "in", arg: 4, scope: !2029, file: !27, line: 376, type: !64)
!2037 = !DILocalVariable(name: "inlen", arg: 5, scope: !2029, file: !27, line: 377, type: !1902)
!2038 = !DILocation(line: 381, column: 3, scope: !2029)
!2039 = !DILocation(line: 381, column: 12, scope: !2029)
!2040 = !DILocation(line: 381, column: 19, scope: !2029)
!2041 = !DILocalVariable(name: "i", scope: !2029, file: !27, line: 379, type: !42)
!2042 = !DILocation(line: 382, column: 9, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2044, file: !27, line: 382, column: 5)
!2044 = distinct !DILexicalBlock(scope: !2029, file: !27, line: 381, column: 25)
!2045 = !DILocation(line: 382, scope: !2043)
!2046 = !DILocation(line: 382, column: 16, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2043, file: !27, line: 382, column: 5)
!2048 = !DILocation(line: 382, column: 5, scope: !2043)
!2049 = !DILocation(line: 383, column: 30, scope: !2047)
!2050 = !DILocation(line: 383, column: 27, scope: !2047)
!2051 = !DILocation(line: 383, column: 17, scope: !2047)
!2052 = !DILocation(line: 383, column: 40, scope: !2047)
!2053 = !DILocation(line: 383, column: 37, scope: !2047)
!2054 = !DILocation(line: 383, column: 33, scope: !2047)
!2055 = !DILocation(line: 383, column: 10, scope: !2047)
!2056 = !DILocation(line: 383, column: 7, scope: !2047)
!2057 = !DILocation(line: 383, column: 14, scope: !2047)
!2058 = !DILocation(line: 382, column: 20, scope: !2047)
!2059 = !DILocation(line: 382, column: 5, scope: !2047)
!2060 = distinct !{!2060, !2048, !2061, !259}
!2061 = !DILocation(line: 383, column: 42, scope: !2043)
!2062 = !DILocation(line: 384, column: 15, scope: !2044)
!2063 = !DILocation(line: 384, column: 11, scope: !2044)
!2064 = !DILocation(line: 385, column: 5, scope: !2044)
!2065 = distinct !{!2065, !2038, !2066, !259}
!2066 = !DILocation(line: 387, column: 3, scope: !2029)
!2067 = !DILocation(line: 389, column: 7, scope: !2068)
!2068 = distinct !DILexicalBlock(scope: !2029, file: !27, line: 389, column: 3)
!2069 = !DILocation(line: 389, scope: !2068)
!2070 = !DILocation(line: 389, column: 18, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2068, file: !27, line: 389, column: 3)
!2072 = !DILocation(line: 389, column: 14, scope: !2071)
!2073 = !DILocation(line: 389, column: 3, scope: !2068)
!2074 = !DILocation(line: 390, column: 28, scope: !2071)
!2075 = !DILocation(line: 390, column: 25, scope: !2071)
!2076 = !DILocation(line: 390, column: 15, scope: !2071)
!2077 = !DILocation(line: 390, column: 38, scope: !2071)
!2078 = !DILocation(line: 390, column: 35, scope: !2071)
!2079 = !DILocation(line: 390, column: 31, scope: !2071)
!2080 = !DILocation(line: 390, column: 8, scope: !2071)
!2081 = !DILocation(line: 390, column: 5, scope: !2071)
!2082 = !DILocation(line: 390, column: 12, scope: !2071)
!2083 = !DILocation(line: 389, column: 26, scope: !2071)
!2084 = !DILocation(line: 389, column: 3, scope: !2071)
!2085 = distinct !{!2085, !2073, !2086, !259}
!2086 = !DILocation(line: 390, column: 40, scope: !2068)
!2087 = !DILocation(line: 392, column: 3, scope: !2029)
!2088 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !27, file: !27, line: 82, type: !1996, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2089 = !DILocalVariable(name: "state", arg: 1, scope: !2088, file: !27, line: 82, type: !1998)
!2090 = !DILocation(line: 0, scope: !2088)
!2091 = !DILocation(line: 100, column: 15, scope: !2088)
!2092 = !DILocalVariable(name: "Aba", scope: !2088, file: !27, line: 86, type: !23)
!2093 = !DILocation(line: 101, column: 15, scope: !2088)
!2094 = !DILocalVariable(name: "Abe", scope: !2088, file: !27, line: 86, type: !23)
!2095 = !DILocation(line: 102, column: 15, scope: !2088)
!2096 = !DILocalVariable(name: "Abi", scope: !2088, file: !27, line: 86, type: !23)
!2097 = !DILocation(line: 103, column: 15, scope: !2088)
!2098 = !DILocalVariable(name: "Abo", scope: !2088, file: !27, line: 86, type: !23)
!2099 = !DILocation(line: 104, column: 15, scope: !2088)
!2100 = !DILocalVariable(name: "Abu", scope: !2088, file: !27, line: 86, type: !23)
!2101 = !DILocation(line: 105, column: 15, scope: !2088)
!2102 = !DILocalVariable(name: "Aga", scope: !2088, file: !27, line: 87, type: !23)
!2103 = !DILocation(line: 106, column: 15, scope: !2088)
!2104 = !DILocalVariable(name: "Age", scope: !2088, file: !27, line: 87, type: !23)
!2105 = !DILocation(line: 107, column: 15, scope: !2088)
!2106 = !DILocalVariable(name: "Agi", scope: !2088, file: !27, line: 87, type: !23)
!2107 = !DILocation(line: 108, column: 15, scope: !2088)
!2108 = !DILocalVariable(name: "Ago", scope: !2088, file: !27, line: 87, type: !23)
!2109 = !DILocation(line: 109, column: 15, scope: !2088)
!2110 = !DILocalVariable(name: "Agu", scope: !2088, file: !27, line: 87, type: !23)
!2111 = !DILocation(line: 110, column: 15, scope: !2088)
!2112 = !DILocalVariable(name: "Aka", scope: !2088, file: !27, line: 88, type: !23)
!2113 = !DILocation(line: 111, column: 15, scope: !2088)
!2114 = !DILocalVariable(name: "Ake", scope: !2088, file: !27, line: 88, type: !23)
!2115 = !DILocation(line: 112, column: 15, scope: !2088)
!2116 = !DILocalVariable(name: "Aki", scope: !2088, file: !27, line: 88, type: !23)
!2117 = !DILocation(line: 113, column: 15, scope: !2088)
!2118 = !DILocalVariable(name: "Ako", scope: !2088, file: !27, line: 88, type: !23)
!2119 = !DILocation(line: 114, column: 15, scope: !2088)
!2120 = !DILocalVariable(name: "Aku", scope: !2088, file: !27, line: 88, type: !23)
!2121 = !DILocation(line: 115, column: 15, scope: !2088)
!2122 = !DILocalVariable(name: "Ama", scope: !2088, file: !27, line: 89, type: !23)
!2123 = !DILocation(line: 116, column: 15, scope: !2088)
!2124 = !DILocalVariable(name: "Ame", scope: !2088, file: !27, line: 89, type: !23)
!2125 = !DILocation(line: 117, column: 15, scope: !2088)
!2126 = !DILocalVariable(name: "Ami", scope: !2088, file: !27, line: 89, type: !23)
!2127 = !DILocation(line: 118, column: 15, scope: !2088)
!2128 = !DILocalVariable(name: "Amo", scope: !2088, file: !27, line: 89, type: !23)
!2129 = !DILocation(line: 119, column: 15, scope: !2088)
!2130 = !DILocalVariable(name: "Amu", scope: !2088, file: !27, line: 89, type: !23)
!2131 = !DILocation(line: 120, column: 15, scope: !2088)
!2132 = !DILocalVariable(name: "Asa", scope: !2088, file: !27, line: 90, type: !23)
!2133 = !DILocation(line: 121, column: 15, scope: !2088)
!2134 = !DILocalVariable(name: "Ase", scope: !2088, file: !27, line: 90, type: !23)
!2135 = !DILocation(line: 122, column: 15, scope: !2088)
!2136 = !DILocalVariable(name: "Asi", scope: !2088, file: !27, line: 90, type: !23)
!2137 = !DILocation(line: 123, column: 15, scope: !2088)
!2138 = !DILocalVariable(name: "Aso", scope: !2088, file: !27, line: 90, type: !23)
!2139 = !DILocation(line: 124, column: 15, scope: !2088)
!2140 = !DILocalVariable(name: "Asu", scope: !2088, file: !27, line: 90, type: !23)
!2141 = !DILocalVariable(name: "round", scope: !2088, file: !27, line: 84, type: !9)
!2142 = !DILocation(line: 126, column: 13, scope: !2143)
!2143 = distinct !DILexicalBlock(scope: !2088, file: !27, line: 126, column: 9)
!2144 = !DILocation(line: 126, scope: !2143)
!2145 = !DILocation(line: 126, column: 30, scope: !2146)
!2146 = distinct !DILexicalBlock(scope: !2143, file: !27, line: 126, column: 9)
!2147 = !DILocation(line: 126, column: 9, scope: !2143)
!2148 = !DILocation(line: 128, column: 22, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2146, file: !27, line: 126, column: 53)
!2150 = !DILocation(line: 128, column: 26, scope: !2149)
!2151 = !DILocation(line: 128, column: 30, scope: !2149)
!2152 = !DILocation(line: 128, column: 34, scope: !2149)
!2153 = !DILocalVariable(name: "BCa", scope: !2088, file: !27, line: 91, type: !23)
!2154 = !DILocation(line: 129, column: 22, scope: !2149)
!2155 = !DILocation(line: 129, column: 26, scope: !2149)
!2156 = !DILocation(line: 129, column: 30, scope: !2149)
!2157 = !DILocation(line: 129, column: 34, scope: !2149)
!2158 = !DILocalVariable(name: "BCe", scope: !2088, file: !27, line: 91, type: !23)
!2159 = !DILocation(line: 130, column: 22, scope: !2149)
!2160 = !DILocation(line: 130, column: 26, scope: !2149)
!2161 = !DILocation(line: 130, column: 30, scope: !2149)
!2162 = !DILocation(line: 130, column: 34, scope: !2149)
!2163 = !DILocalVariable(name: "BCi", scope: !2088, file: !27, line: 91, type: !23)
!2164 = !DILocation(line: 131, column: 22, scope: !2149)
!2165 = !DILocation(line: 131, column: 26, scope: !2149)
!2166 = !DILocation(line: 131, column: 30, scope: !2149)
!2167 = !DILocation(line: 131, column: 34, scope: !2149)
!2168 = !DILocalVariable(name: "BCo", scope: !2088, file: !27, line: 91, type: !23)
!2169 = !DILocation(line: 132, column: 22, scope: !2149)
!2170 = !DILocation(line: 132, column: 26, scope: !2149)
!2171 = !DILocation(line: 132, column: 30, scope: !2149)
!2172 = !DILocation(line: 132, column: 34, scope: !2149)
!2173 = !DILocalVariable(name: "BCu", scope: !2088, file: !27, line: 91, type: !23)
!2174 = !DILocation(line: 135, column: 22, scope: !2149)
!2175 = !DILocation(line: 135, column: 21, scope: !2149)
!2176 = !DILocalVariable(name: "Da", scope: !2088, file: !27, line: 92, type: !23)
!2177 = !DILocation(line: 136, column: 22, scope: !2149)
!2178 = !DILocation(line: 136, column: 21, scope: !2149)
!2179 = !DILocalVariable(name: "De", scope: !2088, file: !27, line: 92, type: !23)
!2180 = !DILocation(line: 137, column: 22, scope: !2149)
!2181 = !DILocation(line: 137, column: 21, scope: !2149)
!2182 = !DILocalVariable(name: "Di", scope: !2088, file: !27, line: 92, type: !23)
!2183 = !DILocation(line: 138, column: 22, scope: !2149)
!2184 = !DILocation(line: 138, column: 21, scope: !2149)
!2185 = !DILocalVariable(name: "Do", scope: !2088, file: !27, line: 92, type: !23)
!2186 = !DILocation(line: 139, column: 22, scope: !2149)
!2187 = !DILocation(line: 139, column: 21, scope: !2149)
!2188 = !DILocalVariable(name: "Du", scope: !2088, file: !27, line: 92, type: !23)
!2189 = !DILocation(line: 141, column: 17, scope: !2149)
!2190 = !DILocation(line: 143, column: 17, scope: !2149)
!2191 = !DILocation(line: 144, column: 19, scope: !2149)
!2192 = !DILocation(line: 145, column: 17, scope: !2149)
!2193 = !DILocation(line: 146, column: 19, scope: !2149)
!2194 = !DILocation(line: 147, column: 17, scope: !2149)
!2195 = !DILocation(line: 148, column: 19, scope: !2149)
!2196 = !DILocation(line: 149, column: 17, scope: !2149)
!2197 = !DILocation(line: 150, column: 19, scope: !2149)
!2198 = !DILocation(line: 151, column: 28, scope: !2149)
!2199 = !DILocation(line: 151, column: 33, scope: !2149)
!2200 = !DILocation(line: 151, column: 25, scope: !2149)
!2201 = !DILocalVariable(name: "Eba", scope: !2088, file: !27, line: 93, type: !23)
!2202 = !DILocation(line: 152, column: 30, scope: !2149)
!2203 = !DILocation(line: 152, column: 17, scope: !2149)
!2204 = !DILocation(line: 153, column: 28, scope: !2149)
!2205 = !DILocation(line: 153, column: 33, scope: !2149)
!2206 = !DILocation(line: 153, column: 25, scope: !2149)
!2207 = !DILocalVariable(name: "Ebe", scope: !2088, file: !27, line: 93, type: !23)
!2208 = !DILocation(line: 154, column: 28, scope: !2149)
!2209 = !DILocation(line: 154, column: 33, scope: !2149)
!2210 = !DILocation(line: 154, column: 25, scope: !2149)
!2211 = !DILocalVariable(name: "Ebi", scope: !2088, file: !27, line: 93, type: !23)
!2212 = !DILocation(line: 155, column: 28, scope: !2149)
!2213 = !DILocation(line: 155, column: 33, scope: !2149)
!2214 = !DILocation(line: 155, column: 25, scope: !2149)
!2215 = !DILocalVariable(name: "Ebo", scope: !2088, file: !27, line: 93, type: !23)
!2216 = !DILocation(line: 156, column: 28, scope: !2149)
!2217 = !DILocation(line: 156, column: 33, scope: !2149)
!2218 = !DILocation(line: 156, column: 25, scope: !2149)
!2219 = !DILocalVariable(name: "Ebu", scope: !2088, file: !27, line: 93, type: !23)
!2220 = !DILocation(line: 158, column: 17, scope: !2149)
!2221 = !DILocation(line: 159, column: 19, scope: !2149)
!2222 = !DILocation(line: 160, column: 17, scope: !2149)
!2223 = !DILocation(line: 161, column: 19, scope: !2149)
!2224 = !DILocation(line: 162, column: 17, scope: !2149)
!2225 = !DILocation(line: 163, column: 19, scope: !2149)
!2226 = !DILocation(line: 164, column: 17, scope: !2149)
!2227 = !DILocation(line: 165, column: 19, scope: !2149)
!2228 = !DILocation(line: 166, column: 17, scope: !2149)
!2229 = !DILocation(line: 167, column: 19, scope: !2149)
!2230 = !DILocation(line: 168, column: 28, scope: !2149)
!2231 = !DILocation(line: 168, column: 33, scope: !2149)
!2232 = !DILocation(line: 168, column: 25, scope: !2149)
!2233 = !DILocalVariable(name: "Ega", scope: !2088, file: !27, line: 94, type: !23)
!2234 = !DILocation(line: 169, column: 28, scope: !2149)
!2235 = !DILocation(line: 169, column: 33, scope: !2149)
!2236 = !DILocation(line: 169, column: 25, scope: !2149)
!2237 = !DILocalVariable(name: "Ege", scope: !2088, file: !27, line: 94, type: !23)
!2238 = !DILocation(line: 170, column: 28, scope: !2149)
!2239 = !DILocation(line: 170, column: 33, scope: !2149)
!2240 = !DILocation(line: 170, column: 25, scope: !2149)
!2241 = !DILocalVariable(name: "Egi", scope: !2088, file: !27, line: 94, type: !23)
!2242 = !DILocation(line: 171, column: 28, scope: !2149)
!2243 = !DILocation(line: 171, column: 33, scope: !2149)
!2244 = !DILocation(line: 171, column: 25, scope: !2149)
!2245 = !DILocalVariable(name: "Ego", scope: !2088, file: !27, line: 94, type: !23)
!2246 = !DILocation(line: 172, column: 28, scope: !2149)
!2247 = !DILocation(line: 172, column: 33, scope: !2149)
!2248 = !DILocation(line: 172, column: 25, scope: !2149)
!2249 = !DILocalVariable(name: "Egu", scope: !2088, file: !27, line: 94, type: !23)
!2250 = !DILocation(line: 174, column: 17, scope: !2149)
!2251 = !DILocation(line: 175, column: 19, scope: !2149)
!2252 = !DILocation(line: 176, column: 17, scope: !2149)
!2253 = !DILocation(line: 177, column: 19, scope: !2149)
!2254 = !DILocation(line: 178, column: 17, scope: !2149)
!2255 = !DILocation(line: 179, column: 19, scope: !2149)
!2256 = !DILocation(line: 180, column: 17, scope: !2149)
!2257 = !DILocation(line: 181, column: 19, scope: !2149)
!2258 = !DILocation(line: 182, column: 17, scope: !2149)
!2259 = !DILocation(line: 183, column: 19, scope: !2149)
!2260 = !DILocation(line: 184, column: 28, scope: !2149)
!2261 = !DILocation(line: 184, column: 33, scope: !2149)
!2262 = !DILocation(line: 184, column: 25, scope: !2149)
!2263 = !DILocalVariable(name: "Eka", scope: !2088, file: !27, line: 95, type: !23)
!2264 = !DILocation(line: 185, column: 28, scope: !2149)
!2265 = !DILocation(line: 185, column: 33, scope: !2149)
!2266 = !DILocation(line: 185, column: 25, scope: !2149)
!2267 = !DILocalVariable(name: "Eke", scope: !2088, file: !27, line: 95, type: !23)
!2268 = !DILocation(line: 186, column: 28, scope: !2149)
!2269 = !DILocation(line: 186, column: 33, scope: !2149)
!2270 = !DILocation(line: 186, column: 25, scope: !2149)
!2271 = !DILocalVariable(name: "Eki", scope: !2088, file: !27, line: 95, type: !23)
!2272 = !DILocation(line: 187, column: 28, scope: !2149)
!2273 = !DILocation(line: 187, column: 33, scope: !2149)
!2274 = !DILocation(line: 187, column: 25, scope: !2149)
!2275 = !DILocalVariable(name: "Eko", scope: !2088, file: !27, line: 95, type: !23)
!2276 = !DILocation(line: 188, column: 28, scope: !2149)
!2277 = !DILocation(line: 188, column: 33, scope: !2149)
!2278 = !DILocation(line: 188, column: 25, scope: !2149)
!2279 = !DILocalVariable(name: "Eku", scope: !2088, file: !27, line: 95, type: !23)
!2280 = !DILocation(line: 190, column: 17, scope: !2149)
!2281 = !DILocation(line: 191, column: 19, scope: !2149)
!2282 = !DILocation(line: 192, column: 17, scope: !2149)
!2283 = !DILocation(line: 193, column: 19, scope: !2149)
!2284 = !DILocation(line: 194, column: 17, scope: !2149)
!2285 = !DILocation(line: 195, column: 19, scope: !2149)
!2286 = !DILocation(line: 196, column: 17, scope: !2149)
!2287 = !DILocation(line: 197, column: 19, scope: !2149)
!2288 = !DILocation(line: 198, column: 17, scope: !2149)
!2289 = !DILocation(line: 199, column: 19, scope: !2149)
!2290 = !DILocation(line: 200, column: 28, scope: !2149)
!2291 = !DILocation(line: 200, column: 33, scope: !2149)
!2292 = !DILocation(line: 200, column: 25, scope: !2149)
!2293 = !DILocalVariable(name: "Ema", scope: !2088, file: !27, line: 96, type: !23)
!2294 = !DILocation(line: 201, column: 28, scope: !2149)
!2295 = !DILocation(line: 201, column: 33, scope: !2149)
!2296 = !DILocation(line: 201, column: 25, scope: !2149)
!2297 = !DILocalVariable(name: "Eme", scope: !2088, file: !27, line: 96, type: !23)
!2298 = !DILocation(line: 202, column: 28, scope: !2149)
!2299 = !DILocation(line: 202, column: 33, scope: !2149)
!2300 = !DILocation(line: 202, column: 25, scope: !2149)
!2301 = !DILocalVariable(name: "Emi", scope: !2088, file: !27, line: 96, type: !23)
!2302 = !DILocation(line: 203, column: 28, scope: !2149)
!2303 = !DILocation(line: 203, column: 33, scope: !2149)
!2304 = !DILocation(line: 203, column: 25, scope: !2149)
!2305 = !DILocalVariable(name: "Emo", scope: !2088, file: !27, line: 96, type: !23)
!2306 = !DILocation(line: 204, column: 28, scope: !2149)
!2307 = !DILocation(line: 204, column: 33, scope: !2149)
!2308 = !DILocation(line: 204, column: 25, scope: !2149)
!2309 = !DILocalVariable(name: "Emu", scope: !2088, file: !27, line: 96, type: !23)
!2310 = !DILocation(line: 206, column: 17, scope: !2149)
!2311 = !DILocation(line: 207, column: 19, scope: !2149)
!2312 = !DILocation(line: 208, column: 17, scope: !2149)
!2313 = !DILocation(line: 209, column: 19, scope: !2149)
!2314 = !DILocation(line: 210, column: 17, scope: !2149)
!2315 = !DILocation(line: 211, column: 19, scope: !2149)
!2316 = !DILocation(line: 212, column: 17, scope: !2149)
!2317 = !DILocation(line: 213, column: 19, scope: !2149)
!2318 = !DILocation(line: 214, column: 17, scope: !2149)
!2319 = !DILocation(line: 215, column: 19, scope: !2149)
!2320 = !DILocation(line: 216, column: 28, scope: !2149)
!2321 = !DILocation(line: 216, column: 33, scope: !2149)
!2322 = !DILocation(line: 216, column: 25, scope: !2149)
!2323 = !DILocalVariable(name: "Esa", scope: !2088, file: !27, line: 97, type: !23)
!2324 = !DILocation(line: 217, column: 28, scope: !2149)
!2325 = !DILocation(line: 217, column: 33, scope: !2149)
!2326 = !DILocation(line: 217, column: 25, scope: !2149)
!2327 = !DILocalVariable(name: "Ese", scope: !2088, file: !27, line: 97, type: !23)
!2328 = !DILocation(line: 218, column: 28, scope: !2149)
!2329 = !DILocation(line: 218, column: 33, scope: !2149)
!2330 = !DILocation(line: 218, column: 25, scope: !2149)
!2331 = !DILocalVariable(name: "Esi", scope: !2088, file: !27, line: 97, type: !23)
!2332 = !DILocation(line: 219, column: 28, scope: !2149)
!2333 = !DILocation(line: 219, column: 33, scope: !2149)
!2334 = !DILocation(line: 219, column: 25, scope: !2149)
!2335 = !DILocalVariable(name: "Eso", scope: !2088, file: !27, line: 97, type: !23)
!2336 = !DILocation(line: 220, column: 28, scope: !2149)
!2337 = !DILocation(line: 220, column: 33, scope: !2149)
!2338 = !DILocation(line: 220, column: 25, scope: !2149)
!2339 = !DILocalVariable(name: "Esu", scope: !2088, file: !27, line: 97, type: !23)
!2340 = !DILocation(line: 223, column: 22, scope: !2149)
!2341 = !DILocation(line: 223, column: 26, scope: !2149)
!2342 = !DILocation(line: 223, column: 30, scope: !2149)
!2343 = !DILocation(line: 223, column: 34, scope: !2149)
!2344 = !DILocation(line: 224, column: 22, scope: !2149)
!2345 = !DILocation(line: 224, column: 26, scope: !2149)
!2346 = !DILocation(line: 224, column: 30, scope: !2149)
!2347 = !DILocation(line: 224, column: 34, scope: !2149)
!2348 = !DILocation(line: 225, column: 22, scope: !2149)
!2349 = !DILocation(line: 225, column: 26, scope: !2149)
!2350 = !DILocation(line: 225, column: 30, scope: !2149)
!2351 = !DILocation(line: 225, column: 34, scope: !2149)
!2352 = !DILocation(line: 226, column: 22, scope: !2149)
!2353 = !DILocation(line: 226, column: 26, scope: !2149)
!2354 = !DILocation(line: 226, column: 30, scope: !2149)
!2355 = !DILocation(line: 226, column: 34, scope: !2149)
!2356 = !DILocation(line: 227, column: 22, scope: !2149)
!2357 = !DILocation(line: 227, column: 26, scope: !2149)
!2358 = !DILocation(line: 227, column: 30, scope: !2149)
!2359 = !DILocation(line: 227, column: 34, scope: !2149)
!2360 = !DILocation(line: 230, column: 22, scope: !2149)
!2361 = !DILocation(line: 230, column: 21, scope: !2149)
!2362 = !DILocation(line: 231, column: 22, scope: !2149)
!2363 = !DILocation(line: 231, column: 21, scope: !2149)
!2364 = !DILocation(line: 232, column: 22, scope: !2149)
!2365 = !DILocation(line: 232, column: 21, scope: !2149)
!2366 = !DILocation(line: 233, column: 22, scope: !2149)
!2367 = !DILocation(line: 233, column: 21, scope: !2149)
!2368 = !DILocation(line: 234, column: 22, scope: !2149)
!2369 = !DILocation(line: 234, column: 21, scope: !2149)
!2370 = !DILocation(line: 236, column: 17, scope: !2149)
!2371 = !DILocation(line: 238, column: 17, scope: !2149)
!2372 = !DILocation(line: 239, column: 19, scope: !2149)
!2373 = !DILocation(line: 240, column: 17, scope: !2149)
!2374 = !DILocation(line: 241, column: 19, scope: !2149)
!2375 = !DILocation(line: 242, column: 17, scope: !2149)
!2376 = !DILocation(line: 243, column: 19, scope: !2149)
!2377 = !DILocation(line: 244, column: 17, scope: !2149)
!2378 = !DILocation(line: 245, column: 19, scope: !2149)
!2379 = !DILocation(line: 246, column: 28, scope: !2149)
!2380 = !DILocation(line: 246, column: 33, scope: !2149)
!2381 = !DILocation(line: 246, column: 25, scope: !2149)
!2382 = !DILocation(line: 247, column: 58, scope: !2149)
!2383 = !DILocation(line: 247, column: 30, scope: !2149)
!2384 = !DILocation(line: 247, column: 17, scope: !2149)
!2385 = !DILocation(line: 248, column: 28, scope: !2149)
!2386 = !DILocation(line: 248, column: 33, scope: !2149)
!2387 = !DILocation(line: 248, column: 25, scope: !2149)
!2388 = !DILocation(line: 249, column: 28, scope: !2149)
!2389 = !DILocation(line: 249, column: 33, scope: !2149)
!2390 = !DILocation(line: 249, column: 25, scope: !2149)
!2391 = !DILocation(line: 250, column: 28, scope: !2149)
!2392 = !DILocation(line: 250, column: 33, scope: !2149)
!2393 = !DILocation(line: 250, column: 25, scope: !2149)
!2394 = !DILocation(line: 251, column: 28, scope: !2149)
!2395 = !DILocation(line: 251, column: 33, scope: !2149)
!2396 = !DILocation(line: 251, column: 25, scope: !2149)
!2397 = !DILocation(line: 253, column: 17, scope: !2149)
!2398 = !DILocation(line: 254, column: 19, scope: !2149)
!2399 = !DILocation(line: 255, column: 17, scope: !2149)
!2400 = !DILocation(line: 256, column: 19, scope: !2149)
!2401 = !DILocation(line: 257, column: 17, scope: !2149)
!2402 = !DILocation(line: 258, column: 19, scope: !2149)
!2403 = !DILocation(line: 259, column: 17, scope: !2149)
!2404 = !DILocation(line: 260, column: 19, scope: !2149)
!2405 = !DILocation(line: 261, column: 17, scope: !2149)
!2406 = !DILocation(line: 262, column: 19, scope: !2149)
!2407 = !DILocation(line: 263, column: 28, scope: !2149)
!2408 = !DILocation(line: 263, column: 33, scope: !2149)
!2409 = !DILocation(line: 263, column: 25, scope: !2149)
!2410 = !DILocation(line: 264, column: 28, scope: !2149)
!2411 = !DILocation(line: 264, column: 33, scope: !2149)
!2412 = !DILocation(line: 264, column: 25, scope: !2149)
!2413 = !DILocation(line: 265, column: 28, scope: !2149)
!2414 = !DILocation(line: 265, column: 33, scope: !2149)
!2415 = !DILocation(line: 265, column: 25, scope: !2149)
!2416 = !DILocation(line: 266, column: 28, scope: !2149)
!2417 = !DILocation(line: 266, column: 33, scope: !2149)
!2418 = !DILocation(line: 266, column: 25, scope: !2149)
!2419 = !DILocation(line: 267, column: 28, scope: !2149)
!2420 = !DILocation(line: 267, column: 33, scope: !2149)
!2421 = !DILocation(line: 267, column: 25, scope: !2149)
!2422 = !DILocation(line: 269, column: 17, scope: !2149)
!2423 = !DILocation(line: 270, column: 19, scope: !2149)
!2424 = !DILocation(line: 271, column: 17, scope: !2149)
!2425 = !DILocation(line: 272, column: 19, scope: !2149)
!2426 = !DILocation(line: 273, column: 17, scope: !2149)
!2427 = !DILocation(line: 274, column: 19, scope: !2149)
!2428 = !DILocation(line: 275, column: 17, scope: !2149)
!2429 = !DILocation(line: 276, column: 19, scope: !2149)
!2430 = !DILocation(line: 277, column: 17, scope: !2149)
!2431 = !DILocation(line: 278, column: 19, scope: !2149)
!2432 = !DILocation(line: 279, column: 28, scope: !2149)
!2433 = !DILocation(line: 279, column: 33, scope: !2149)
!2434 = !DILocation(line: 279, column: 25, scope: !2149)
!2435 = !DILocation(line: 280, column: 28, scope: !2149)
!2436 = !DILocation(line: 280, column: 33, scope: !2149)
!2437 = !DILocation(line: 280, column: 25, scope: !2149)
!2438 = !DILocation(line: 281, column: 28, scope: !2149)
!2439 = !DILocation(line: 281, column: 33, scope: !2149)
!2440 = !DILocation(line: 281, column: 25, scope: !2149)
!2441 = !DILocation(line: 282, column: 28, scope: !2149)
!2442 = !DILocation(line: 282, column: 33, scope: !2149)
!2443 = !DILocation(line: 282, column: 25, scope: !2149)
!2444 = !DILocation(line: 283, column: 28, scope: !2149)
!2445 = !DILocation(line: 283, column: 33, scope: !2149)
!2446 = !DILocation(line: 283, column: 25, scope: !2149)
!2447 = !DILocation(line: 285, column: 17, scope: !2149)
!2448 = !DILocation(line: 286, column: 19, scope: !2149)
!2449 = !DILocation(line: 287, column: 17, scope: !2149)
!2450 = !DILocation(line: 288, column: 19, scope: !2149)
!2451 = !DILocation(line: 289, column: 17, scope: !2149)
!2452 = !DILocation(line: 290, column: 19, scope: !2149)
!2453 = !DILocation(line: 291, column: 17, scope: !2149)
!2454 = !DILocation(line: 292, column: 19, scope: !2149)
!2455 = !DILocation(line: 293, column: 17, scope: !2149)
!2456 = !DILocation(line: 294, column: 19, scope: !2149)
!2457 = !DILocation(line: 295, column: 28, scope: !2149)
!2458 = !DILocation(line: 295, column: 33, scope: !2149)
!2459 = !DILocation(line: 295, column: 25, scope: !2149)
!2460 = !DILocation(line: 296, column: 28, scope: !2149)
!2461 = !DILocation(line: 296, column: 33, scope: !2149)
!2462 = !DILocation(line: 296, column: 25, scope: !2149)
!2463 = !DILocation(line: 297, column: 28, scope: !2149)
!2464 = !DILocation(line: 297, column: 33, scope: !2149)
!2465 = !DILocation(line: 297, column: 25, scope: !2149)
!2466 = !DILocation(line: 298, column: 28, scope: !2149)
!2467 = !DILocation(line: 298, column: 33, scope: !2149)
!2468 = !DILocation(line: 298, column: 25, scope: !2149)
!2469 = !DILocation(line: 299, column: 28, scope: !2149)
!2470 = !DILocation(line: 299, column: 33, scope: !2149)
!2471 = !DILocation(line: 299, column: 25, scope: !2149)
!2472 = !DILocation(line: 301, column: 17, scope: !2149)
!2473 = !DILocation(line: 302, column: 19, scope: !2149)
!2474 = !DILocation(line: 303, column: 17, scope: !2149)
!2475 = !DILocation(line: 304, column: 19, scope: !2149)
!2476 = !DILocation(line: 305, column: 17, scope: !2149)
!2477 = !DILocation(line: 306, column: 19, scope: !2149)
!2478 = !DILocation(line: 307, column: 17, scope: !2149)
!2479 = !DILocation(line: 308, column: 19, scope: !2149)
!2480 = !DILocation(line: 309, column: 17, scope: !2149)
!2481 = !DILocation(line: 310, column: 19, scope: !2149)
!2482 = !DILocation(line: 311, column: 28, scope: !2149)
!2483 = !DILocation(line: 311, column: 33, scope: !2149)
!2484 = !DILocation(line: 311, column: 25, scope: !2149)
!2485 = !DILocation(line: 312, column: 28, scope: !2149)
!2486 = !DILocation(line: 312, column: 33, scope: !2149)
!2487 = !DILocation(line: 312, column: 25, scope: !2149)
!2488 = !DILocation(line: 313, column: 28, scope: !2149)
!2489 = !DILocation(line: 313, column: 33, scope: !2149)
!2490 = !DILocation(line: 313, column: 25, scope: !2149)
!2491 = !DILocation(line: 314, column: 28, scope: !2149)
!2492 = !DILocation(line: 314, column: 33, scope: !2149)
!2493 = !DILocation(line: 314, column: 25, scope: !2149)
!2494 = !DILocation(line: 315, column: 28, scope: !2149)
!2495 = !DILocation(line: 315, column: 33, scope: !2149)
!2496 = !DILocation(line: 315, column: 25, scope: !2149)
!2497 = !DILocation(line: 316, column: 9, scope: !2149)
!2498 = !DILocation(line: 126, column: 47, scope: !2146)
!2499 = !DILocation(line: 126, column: 9, scope: !2146)
!2500 = distinct !{!2500, !2147, !2501, !259}
!2501 = !DILocation(line: 316, column: 9, scope: !2143)
!2502 = !DILocation(line: 319, column: 9, scope: !2088)
!2503 = !DILocation(line: 319, column: 19, scope: !2088)
!2504 = !DILocation(line: 320, column: 9, scope: !2088)
!2505 = !DILocation(line: 320, column: 19, scope: !2088)
!2506 = !DILocation(line: 321, column: 9, scope: !2088)
!2507 = !DILocation(line: 321, column: 19, scope: !2088)
!2508 = !DILocation(line: 322, column: 9, scope: !2088)
!2509 = !DILocation(line: 322, column: 19, scope: !2088)
!2510 = !DILocation(line: 323, column: 9, scope: !2088)
!2511 = !DILocation(line: 323, column: 19, scope: !2088)
!2512 = !DILocation(line: 324, column: 9, scope: !2088)
!2513 = !DILocation(line: 324, column: 19, scope: !2088)
!2514 = !DILocation(line: 325, column: 9, scope: !2088)
!2515 = !DILocation(line: 325, column: 19, scope: !2088)
!2516 = !DILocation(line: 326, column: 9, scope: !2088)
!2517 = !DILocation(line: 326, column: 19, scope: !2088)
!2518 = !DILocation(line: 327, column: 9, scope: !2088)
!2519 = !DILocation(line: 327, column: 19, scope: !2088)
!2520 = !DILocation(line: 328, column: 9, scope: !2088)
!2521 = !DILocation(line: 328, column: 19, scope: !2088)
!2522 = !DILocation(line: 329, column: 9, scope: !2088)
!2523 = !DILocation(line: 329, column: 19, scope: !2088)
!2524 = !DILocation(line: 330, column: 9, scope: !2088)
!2525 = !DILocation(line: 330, column: 19, scope: !2088)
!2526 = !DILocation(line: 331, column: 9, scope: !2088)
!2527 = !DILocation(line: 331, column: 19, scope: !2088)
!2528 = !DILocation(line: 332, column: 9, scope: !2088)
!2529 = !DILocation(line: 332, column: 19, scope: !2088)
!2530 = !DILocation(line: 333, column: 9, scope: !2088)
!2531 = !DILocation(line: 333, column: 19, scope: !2088)
!2532 = !DILocation(line: 334, column: 9, scope: !2088)
!2533 = !DILocation(line: 334, column: 19, scope: !2088)
!2534 = !DILocation(line: 335, column: 9, scope: !2088)
!2535 = !DILocation(line: 335, column: 19, scope: !2088)
!2536 = !DILocation(line: 336, column: 9, scope: !2088)
!2537 = !DILocation(line: 336, column: 19, scope: !2088)
!2538 = !DILocation(line: 337, column: 9, scope: !2088)
!2539 = !DILocation(line: 337, column: 19, scope: !2088)
!2540 = !DILocation(line: 338, column: 9, scope: !2088)
!2541 = !DILocation(line: 338, column: 19, scope: !2088)
!2542 = !DILocation(line: 339, column: 9, scope: !2088)
!2543 = !DILocation(line: 339, column: 19, scope: !2088)
!2544 = !DILocation(line: 340, column: 9, scope: !2088)
!2545 = !DILocation(line: 340, column: 19, scope: !2088)
!2546 = !DILocation(line: 341, column: 9, scope: !2088)
!2547 = !DILocation(line: 341, column: 19, scope: !2088)
!2548 = !DILocation(line: 342, column: 9, scope: !2088)
!2549 = !DILocation(line: 342, column: 19, scope: !2088)
!2550 = !DILocation(line: 343, column: 9, scope: !2088)
!2551 = !DILocation(line: 343, column: 19, scope: !2088)
!2552 = !DILocation(line: 344, column: 1, scope: !2088)
!2553 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !27, file: !27, line: 550, type: !1979, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2554 = !DILocalVariable(name: "state", arg: 1, scope: !2553, file: !27, line: 550, type: !1981)
!2555 = !DILocation(line: 0, scope: !2553)
!2556 = !DILocation(line: 552, column: 26, scope: !2553)
!2557 = !DILocation(line: 552, column: 19, scope: !2553)
!2558 = !DILocation(line: 552, column: 36, scope: !2553)
!2559 = !DILocation(line: 552, column: 3, scope: !2553)
!2560 = !DILocation(line: 553, column: 10, scope: !2553)
!2561 = !DILocation(line: 553, column: 14, scope: !2553)
!2562 = !DILocation(line: 554, column: 1, scope: !2553)
!2563 = distinct !DISubprogram(name: "keccak_finalize", scope: !27, file: !27, line: 405, type: !2564, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2564 = !DISubroutineType(types: !2565)
!2565 = !{null, !1998, !42, !42, !61}
!2566 = !DILocalVariable(name: "s", arg: 1, scope: !2563, file: !27, line: 405, type: !1998)
!2567 = !DILocation(line: 0, scope: !2563)
!2568 = !DILocalVariable(name: "pos", arg: 2, scope: !2563, file: !27, line: 405, type: !42)
!2569 = !DILocalVariable(name: "r", arg: 3, scope: !2563, file: !27, line: 405, type: !42)
!2570 = !DILocalVariable(name: "p", arg: 4, scope: !2563, file: !27, line: 405, type: !61)
!2571 = !DILocation(line: 407, column: 15, scope: !2563)
!2572 = !DILocation(line: 407, column: 36, scope: !2563)
!2573 = !DILocation(line: 407, column: 31, scope: !2563)
!2574 = !DILocation(line: 407, column: 27, scope: !2563)
!2575 = !DILocation(line: 407, column: 8, scope: !2563)
!2576 = !DILocation(line: 407, column: 3, scope: !2563)
!2577 = !DILocation(line: 407, column: 12, scope: !2563)
!2578 = !DILocation(line: 408, column: 6, scope: !2563)
!2579 = !DILocation(line: 408, column: 8, scope: !2563)
!2580 = !DILocation(line: 408, column: 3, scope: !2563)
!2581 = !DILocation(line: 408, column: 12, scope: !2563)
!2582 = !DILocation(line: 409, column: 1, scope: !2563)
!2583 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !27, file: !27, line: 566, type: !2584, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2584 = !DISubroutineType(types: !2585)
!2585 = !{null, !60, !1902, !1981}
!2586 = !DILocalVariable(name: "out", arg: 1, scope: !2583, file: !27, line: 566, type: !60)
!2587 = !DILocation(line: 0, scope: !2583)
!2588 = !DILocalVariable(name: "outlen", arg: 2, scope: !2583, file: !27, line: 566, type: !1902)
!2589 = !DILocalVariable(name: "state", arg: 3, scope: !2583, file: !27, line: 566, type: !1981)
!2590 = !DILocation(line: 568, column: 51, scope: !2583)
!2591 = !DILocation(line: 568, column: 44, scope: !2583)
!2592 = !DILocation(line: 568, column: 61, scope: !2583)
!2593 = !DILocation(line: 568, column: 16, scope: !2583)
!2594 = !DILocation(line: 568, column: 10, scope: !2583)
!2595 = !DILocation(line: 568, column: 14, scope: !2583)
!2596 = !DILocation(line: 569, column: 1, scope: !2583)
!2597 = distinct !DISubprogram(name: "keccak_squeeze", scope: !27, file: !27, line: 426, type: !2598, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2598 = !DISubroutineType(types: !2599)
!2599 = !{!42, !60, !1902, !1998, !42, !42}
!2600 = !DILocalVariable(name: "out", arg: 1, scope: !2597, file: !27, line: 426, type: !60)
!2601 = !DILocation(line: 0, scope: !2597)
!2602 = !DILocalVariable(name: "outlen", arg: 2, scope: !2597, file: !27, line: 427, type: !1902)
!2603 = !DILocalVariable(name: "s", arg: 3, scope: !2597, file: !27, line: 428, type: !1998)
!2604 = !DILocalVariable(name: "pos", arg: 4, scope: !2597, file: !27, line: 429, type: !42)
!2605 = !DILocalVariable(name: "r", arg: 5, scope: !2597, file: !27, line: 430, type: !42)
!2606 = !DILocation(line: 434, column: 3, scope: !2597)
!2607 = !DILocation(line: 435, column: 12, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2609, file: !27, line: 435, column: 8)
!2609 = distinct !DILexicalBlock(scope: !2597, file: !27, line: 434, column: 17)
!2610 = !DILocation(line: 436, column: 7, scope: !2611)
!2611 = distinct !DILexicalBlock(scope: !2608, file: !27, line: 435, column: 18)
!2612 = !DILocation(line: 438, column: 5, scope: !2611)
!2613 = !DILocalVariable(name: "i", scope: !2597, file: !27, line: 432, type: !42)
!2614 = !DILocation(line: 439, column: 9, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2609, file: !27, line: 439, column: 5)
!2616 = !DILocation(line: 439, scope: !2615)
!2617 = !DILocation(line: 439, column: 17, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2615, file: !27, line: 439, column: 5)
!2619 = !DILocation(line: 439, column: 21, scope: !2618)
!2620 = !DILocation(line: 439, column: 31, scope: !2618)
!2621 = !DILocation(line: 439, column: 26, scope: !2618)
!2622 = !DILocation(line: 0, scope: !2618)
!2623 = !DILocation(line: 439, column: 5, scope: !2615)
!2624 = !DILocation(line: 440, column: 19, scope: !2618)
!2625 = !DILocation(line: 440, column: 16, scope: !2618)
!2626 = !DILocation(line: 440, column: 30, scope: !2618)
!2627 = !DILocation(line: 440, column: 27, scope: !2618)
!2628 = !DILocation(line: 440, column: 23, scope: !2618)
!2629 = !DILocation(line: 440, column: 11, scope: !2618)
!2630 = !DILocation(line: 440, column: 14, scope: !2618)
!2631 = !DILocation(line: 440, column: 7, scope: !2618)
!2632 = !DILocation(line: 439, column: 41, scope: !2618)
!2633 = !DILocation(line: 439, column: 5, scope: !2618)
!2634 = distinct !{!2634, !2623, !2635, !259}
!2635 = !DILocation(line: 440, column: 32, scope: !2615)
!2636 = !DILocation(line: 441, column: 16, scope: !2609)
!2637 = !DILocation(line: 441, column: 12, scope: !2609)
!2638 = distinct !{!2638, !2606, !2639, !259}
!2639 = !DILocation(line: 443, column: 3, scope: !2597)
!2640 = !DILocation(line: 445, column: 3, scope: !2597)
!2641 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !27, file: !27, line: 580, type: !2016, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2642 = !DILocalVariable(name: "state", arg: 1, scope: !2641, file: !27, line: 580, type: !1981)
!2643 = !DILocation(line: 0, scope: !2641)
!2644 = !DILocalVariable(name: "in", arg: 2, scope: !2641, file: !27, line: 580, type: !64)
!2645 = !DILocalVariable(name: "inlen", arg: 3, scope: !2641, file: !27, line: 580, type: !1902)
!2646 = !DILocation(line: 582, column: 29, scope: !2641)
!2647 = !DILocation(line: 582, column: 22, scope: !2641)
!2648 = !DILocation(line: 582, column: 3, scope: !2641)
!2649 = !DILocation(line: 583, column: 10, scope: !2641)
!2650 = !DILocation(line: 583, column: 14, scope: !2641)
!2651 = !DILocation(line: 584, column: 1, scope: !2641)
!2652 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !27, file: !27, line: 461, type: !2653, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2653 = !DISubroutineType(types: !2654)
!2654 = !{null, !1998, !42, !64, !1902, !61}
!2655 = !DILocalVariable(name: "s", arg: 1, scope: !2652, file: !27, line: 461, type: !1998)
!2656 = !DILocation(line: 0, scope: !2652)
!2657 = !DILocalVariable(name: "r", arg: 2, scope: !2652, file: !27, line: 462, type: !42)
!2658 = !DILocalVariable(name: "in", arg: 3, scope: !2652, file: !27, line: 463, type: !64)
!2659 = !DILocalVariable(name: "inlen", arg: 4, scope: !2652, file: !27, line: 464, type: !1902)
!2660 = !DILocalVariable(name: "p", arg: 5, scope: !2652, file: !27, line: 465, type: !61)
!2661 = !DILocalVariable(name: "i", scope: !2652, file: !27, line: 467, type: !42)
!2662 = !DILocation(line: 469, column: 7, scope: !2663)
!2663 = distinct !DILexicalBlock(scope: !2652, file: !27, line: 469, column: 3)
!2664 = !DILocation(line: 469, scope: !2663)
!2665 = !DILocation(line: 469, column: 12, scope: !2666)
!2666 = distinct !DILexicalBlock(scope: !2663, file: !27, line: 469, column: 3)
!2667 = !DILocation(line: 469, column: 3, scope: !2663)
!2668 = !DILocation(line: 470, column: 5, scope: !2666)
!2669 = !DILocation(line: 470, column: 10, scope: !2666)
!2670 = !DILocation(line: 469, column: 17, scope: !2666)
!2671 = !DILocation(line: 469, column: 3, scope: !2666)
!2672 = distinct !{!2672, !2667, !2673, !259}
!2673 = !DILocation(line: 470, column: 12, scope: !2663)
!2674 = !DILocation(line: 472, column: 3, scope: !2652)
!2675 = !DILocation(line: 472, column: 15, scope: !2652)
!2676 = !DILocation(line: 473, column: 9, scope: !2677)
!2677 = distinct !DILexicalBlock(scope: !2678, file: !27, line: 473, column: 5)
!2678 = distinct !DILexicalBlock(scope: !2652, file: !27, line: 472, column: 21)
!2679 = !DILocation(line: 473, scope: !2677)
!2680 = !DILocation(line: 473, column: 16, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2677, file: !27, line: 473, column: 5)
!2682 = !DILocation(line: 473, column: 14, scope: !2681)
!2683 = !DILocation(line: 473, column: 5, scope: !2677)
!2684 = !DILocation(line: 474, column: 26, scope: !2681)
!2685 = !DILocation(line: 474, column: 24, scope: !2681)
!2686 = !DILocation(line: 474, column: 15, scope: !2681)
!2687 = !DILocation(line: 474, column: 7, scope: !2681)
!2688 = !DILocation(line: 474, column: 12, scope: !2681)
!2689 = !DILocation(line: 473, column: 20, scope: !2681)
!2690 = !DILocation(line: 473, column: 5, scope: !2681)
!2691 = distinct !{!2691, !2683, !2692, !259}
!2692 = !DILocation(line: 474, column: 28, scope: !2677)
!2693 = !DILocation(line: 475, column: 8, scope: !2678)
!2694 = !DILocation(line: 476, column: 11, scope: !2678)
!2695 = !DILocation(line: 477, column: 5, scope: !2678)
!2696 = distinct !{!2696, !2674, !2697, !259}
!2697 = !DILocation(line: 478, column: 3, scope: !2652)
!2698 = !DILocation(line: 480, column: 7, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2652, file: !27, line: 480, column: 3)
!2700 = !DILocation(line: 480, scope: !2699)
!2701 = !DILocation(line: 480, column: 12, scope: !2702)
!2702 = distinct !DILexicalBlock(scope: !2699, file: !27, line: 480, column: 3)
!2703 = !DILocation(line: 480, column: 3, scope: !2699)
!2704 = !DILocation(line: 481, column: 25, scope: !2702)
!2705 = !DILocation(line: 481, column: 15, scope: !2702)
!2706 = !DILocation(line: 481, column: 38, scope: !2702)
!2707 = !DILocation(line: 481, column: 35, scope: !2702)
!2708 = !DILocation(line: 481, column: 31, scope: !2702)
!2709 = !DILocation(line: 481, column: 8, scope: !2702)
!2710 = !DILocation(line: 481, column: 5, scope: !2702)
!2711 = !DILocation(line: 481, column: 12, scope: !2702)
!2712 = !DILocation(line: 480, column: 20, scope: !2702)
!2713 = !DILocation(line: 480, column: 3, scope: !2702)
!2714 = distinct !{!2714, !2703, !2715, !259}
!2715 = !DILocation(line: 481, column: 40, scope: !2699)
!2716 = !DILocation(line: 483, column: 13, scope: !2652)
!2717 = !DILocation(line: 483, column: 32, scope: !2652)
!2718 = !DILocation(line: 483, column: 29, scope: !2652)
!2719 = !DILocation(line: 483, column: 25, scope: !2652)
!2720 = !DILocation(line: 483, column: 6, scope: !2652)
!2721 = !DILocation(line: 483, column: 3, scope: !2652)
!2722 = !DILocation(line: 483, column: 10, scope: !2652)
!2723 = !DILocation(line: 484, column: 7, scope: !2652)
!2724 = !DILocation(line: 484, column: 10, scope: !2652)
!2725 = !DILocation(line: 484, column: 3, scope: !2652)
!2726 = !DILocation(line: 484, column: 14, scope: !2652)
!2727 = !DILocation(line: 485, column: 1, scope: !2652)
!2728 = distinct !DISubprogram(name: "load64", scope: !27, file: !27, line: 22, type: !2729, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2729 = !DISubroutineType(types: !2730)
!2730 = !{!23, !64}
!2731 = !DILocalVariable(name: "x", arg: 1, scope: !2728, file: !27, line: 22, type: !64)
!2732 = !DILocation(line: 0, scope: !2728)
!2733 = !DILocalVariable(name: "r", scope: !2728, file: !27, line: 24, type: !23)
!2734 = !DILocalVariable(name: "i", scope: !2728, file: !27, line: 23, type: !42)
!2735 = !DILocation(line: 26, column: 7, scope: !2736)
!2736 = distinct !DILexicalBlock(scope: !2728, file: !27, line: 26, column: 3)
!2737 = !DILocation(line: 26, scope: !2736)
!2738 = !DILocation(line: 26, column: 12, scope: !2739)
!2739 = distinct !DILexicalBlock(scope: !2736, file: !27, line: 26, column: 3)
!2740 = !DILocation(line: 26, column: 3, scope: !2736)
!2741 = !DILocation(line: 27, column: 20, scope: !2739)
!2742 = !DILocation(line: 27, column: 10, scope: !2739)
!2743 = !DILocation(line: 27, column: 29, scope: !2739)
!2744 = !DILocation(line: 27, column: 25, scope: !2739)
!2745 = !DILocation(line: 27, column: 7, scope: !2739)
!2746 = !DILocation(line: 27, column: 5, scope: !2739)
!2747 = !DILocation(line: 26, column: 16, scope: !2739)
!2748 = !DILocation(line: 26, column: 3, scope: !2739)
!2749 = distinct !{!2749, !2740, !2750, !259}
!2750 = !DILocation(line: 27, column: 30, scope: !2736)
!2751 = !DILocation(line: 29, column: 3, scope: !2728)
!2752 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !27, file: !27, line: 598, type: !2584, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2753 = !DILocalVariable(name: "out", arg: 1, scope: !2752, file: !27, line: 598, type: !60)
!2754 = !DILocation(line: 0, scope: !2752)
!2755 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2752, file: !27, line: 598, type: !1902)
!2756 = !DILocalVariable(name: "state", arg: 3, scope: !2752, file: !27, line: 598, type: !1981)
!2757 = !DILocation(line: 600, column: 45, scope: !2752)
!2758 = !DILocation(line: 600, column: 38, scope: !2752)
!2759 = !DILocation(line: 600, column: 3, scope: !2752)
!2760 = !DILocation(line: 601, column: 1, scope: !2752)
!2761 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !27, file: !27, line: 500, type: !2762, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2762 = !DISubroutineType(types: !2763)
!2763 = !{null, !60, !1902, !1998, !42}
!2764 = !DILocalVariable(name: "out", arg: 1, scope: !2761, file: !27, line: 500, type: !60)
!2765 = !DILocation(line: 0, scope: !2761)
!2766 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2761, file: !27, line: 501, type: !1902)
!2767 = !DILocalVariable(name: "s", arg: 3, scope: !2761, file: !27, line: 502, type: !1998)
!2768 = !DILocalVariable(name: "r", arg: 4, scope: !2761, file: !27, line: 503, type: !42)
!2769 = !DILocation(line: 507, column: 3, scope: !2761)
!2770 = !DILocation(line: 508, column: 5, scope: !2771)
!2771 = distinct !DILexicalBlock(scope: !2761, file: !27, line: 507, column: 18)
!2772 = !DILocalVariable(name: "i", scope: !2761, file: !27, line: 505, type: !42)
!2773 = !DILocation(line: 509, column: 9, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2771, file: !27, line: 509, column: 5)
!2775 = !DILocation(line: 509, scope: !2774)
!2776 = !DILocation(line: 509, column: 16, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2774, file: !27, line: 509, column: 5)
!2778 = !DILocation(line: 509, column: 14, scope: !2777)
!2779 = !DILocation(line: 509, column: 5, scope: !2774)
!2780 = !DILocation(line: 510, column: 20, scope: !2777)
!2781 = !DILocation(line: 510, column: 18, scope: !2777)
!2782 = !DILocation(line: 510, column: 24, scope: !2777)
!2783 = !DILocation(line: 510, column: 7, scope: !2777)
!2784 = !DILocation(line: 509, column: 20, scope: !2777)
!2785 = !DILocation(line: 509, column: 5, scope: !2777)
!2786 = distinct !{!2786, !2779, !2787, !259}
!2787 = !DILocation(line: 510, column: 28, scope: !2774)
!2788 = !DILocation(line: 511, column: 9, scope: !2771)
!2789 = !DILocation(line: 512, column: 13, scope: !2771)
!2790 = distinct !{!2790, !2769, !2791, !259}
!2791 = !DILocation(line: 513, column: 3, scope: !2761)
!2792 = !DILocation(line: 514, column: 1, scope: !2761)
!2793 = distinct !DISubprogram(name: "store64", scope: !27, file: !27, line: 40, type: !2794, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2794 = !DISubroutineType(types: !2795)
!2795 = !{null, !60, !23}
!2796 = !DILocalVariable(name: "x", arg: 1, scope: !2793, file: !27, line: 40, type: !60)
!2797 = !DILocation(line: 0, scope: !2793)
!2798 = !DILocalVariable(name: "u", arg: 2, scope: !2793, file: !27, line: 40, type: !23)
!2799 = !DILocalVariable(name: "i", scope: !2793, file: !27, line: 41, type: !42)
!2800 = !DILocation(line: 43, column: 7, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2793, file: !27, line: 43, column: 3)
!2802 = !DILocation(line: 43, scope: !2801)
!2803 = !DILocation(line: 43, column: 12, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2801, file: !27, line: 43, column: 3)
!2805 = !DILocation(line: 43, column: 3, scope: !2801)
!2806 = !DILocation(line: 44, column: 18, scope: !2804)
!2807 = !DILocation(line: 44, column: 14, scope: !2804)
!2808 = !DILocation(line: 44, column: 12, scope: !2804)
!2809 = !DILocation(line: 44, column: 5, scope: !2804)
!2810 = !DILocation(line: 44, column: 10, scope: !2804)
!2811 = !DILocation(line: 43, column: 16, scope: !2804)
!2812 = !DILocation(line: 43, column: 3, scope: !2804)
!2813 = distinct !{!2813, !2805, !2814, !259}
!2814 = !DILocation(line: 44, column: 19, scope: !2801)
!2815 = !DILocation(line: 45, column: 1, scope: !2793)
!2816 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !27, file: !27, line: 610, type: !1979, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2817 = !DILocalVariable(name: "state", arg: 1, scope: !2816, file: !27, line: 610, type: !1981)
!2818 = !DILocation(line: 0, scope: !2816)
!2819 = !DILocation(line: 612, column: 22, scope: !2816)
!2820 = !DILocation(line: 612, column: 15, scope: !2816)
!2821 = !DILocation(line: 612, column: 3, scope: !2816)
!2822 = !DILocation(line: 613, column: 10, scope: !2816)
!2823 = !DILocation(line: 613, column: 14, scope: !2816)
!2824 = !DILocation(line: 614, column: 1, scope: !2816)
!2825 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !27, file: !27, line: 625, type: !2016, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2826 = !DILocalVariable(name: "state", arg: 1, scope: !2825, file: !27, line: 625, type: !1981)
!2827 = !DILocation(line: 0, scope: !2825)
!2828 = !DILocalVariable(name: "in", arg: 2, scope: !2825, file: !27, line: 625, type: !64)
!2829 = !DILocalVariable(name: "inlen", arg: 3, scope: !2825, file: !27, line: 625, type: !1902)
!2830 = !DILocation(line: 627, column: 37, scope: !2825)
!2831 = !DILocation(line: 627, column: 30, scope: !2825)
!2832 = !DILocation(line: 627, column: 47, scope: !2825)
!2833 = !DILocation(line: 627, column: 16, scope: !2825)
!2834 = !DILocation(line: 627, column: 10, scope: !2825)
!2835 = !DILocation(line: 627, column: 14, scope: !2825)
!2836 = !DILocation(line: 628, column: 1, scope: !2825)
!2837 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !27, file: !27, line: 637, type: !1979, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2838 = !DILocalVariable(name: "state", arg: 1, scope: !2837, file: !27, line: 637, type: !1981)
!2839 = !DILocation(line: 0, scope: !2837)
!2840 = !DILocation(line: 639, column: 26, scope: !2837)
!2841 = !DILocation(line: 639, column: 19, scope: !2837)
!2842 = !DILocation(line: 639, column: 36, scope: !2837)
!2843 = !DILocation(line: 639, column: 3, scope: !2837)
!2844 = !DILocation(line: 640, column: 10, scope: !2837)
!2845 = !DILocation(line: 640, column: 14, scope: !2837)
!2846 = !DILocation(line: 641, column: 1, scope: !2837)
!2847 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !27, file: !27, line: 653, type: !2584, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2848 = !DILocalVariable(name: "out", arg: 1, scope: !2847, file: !27, line: 653, type: !60)
!2849 = !DILocation(line: 0, scope: !2847)
!2850 = !DILocalVariable(name: "outlen", arg: 2, scope: !2847, file: !27, line: 653, type: !1902)
!2851 = !DILocalVariable(name: "state", arg: 3, scope: !2847, file: !27, line: 653, type: !1981)
!2852 = !DILocation(line: 655, column: 51, scope: !2847)
!2853 = !DILocation(line: 655, column: 44, scope: !2847)
!2854 = !DILocation(line: 655, column: 61, scope: !2847)
!2855 = !DILocation(line: 655, column: 16, scope: !2847)
!2856 = !DILocation(line: 655, column: 10, scope: !2847)
!2857 = !DILocation(line: 655, column: 14, scope: !2847)
!2858 = !DILocation(line: 656, column: 1, scope: !2847)
!2859 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !27, file: !27, line: 667, type: !2016, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2860 = !DILocalVariable(name: "state", arg: 1, scope: !2859, file: !27, line: 667, type: !1981)
!2861 = !DILocation(line: 0, scope: !2859)
!2862 = !DILocalVariable(name: "in", arg: 2, scope: !2859, file: !27, line: 667, type: !64)
!2863 = !DILocalVariable(name: "inlen", arg: 3, scope: !2859, file: !27, line: 667, type: !1902)
!2864 = !DILocation(line: 669, column: 29, scope: !2859)
!2865 = !DILocation(line: 669, column: 22, scope: !2859)
!2866 = !DILocation(line: 669, column: 3, scope: !2859)
!2867 = !DILocation(line: 670, column: 10, scope: !2859)
!2868 = !DILocation(line: 670, column: 14, scope: !2859)
!2869 = !DILocation(line: 671, column: 1, scope: !2859)
!2870 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !27, file: !27, line: 685, type: !2584, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2871 = !DILocalVariable(name: "out", arg: 1, scope: !2870, file: !27, line: 685, type: !60)
!2872 = !DILocation(line: 0, scope: !2870)
!2873 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2870, file: !27, line: 685, type: !1902)
!2874 = !DILocalVariable(name: "state", arg: 3, scope: !2870, file: !27, line: 685, type: !1981)
!2875 = !DILocation(line: 687, column: 45, scope: !2870)
!2876 = !DILocation(line: 687, column: 38, scope: !2870)
!2877 = !DILocation(line: 687, column: 3, scope: !2870)
!2878 = !DILocation(line: 688, column: 1, scope: !2870)
!2879 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !27, file: !27, line: 700, type: !2880, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2880 = !DISubroutineType(types: !2881)
!2881 = !{null, !60, !1902, !64, !1902}
!2882 = !DILocalVariable(name: "out", arg: 1, scope: !2879, file: !27, line: 700, type: !60)
!2883 = !DILocation(line: 0, scope: !2879)
!2884 = !DILocalVariable(name: "outlen", arg: 2, scope: !2879, file: !27, line: 700, type: !1902)
!2885 = !DILocalVariable(name: "in", arg: 3, scope: !2879, file: !27, line: 700, type: !64)
!2886 = !DILocalVariable(name: "inlen", arg: 4, scope: !2879, file: !27, line: 700, type: !1902)
!2887 = !DILocalVariable(name: "state", scope: !2879, file: !27, line: 703, type: !1982)
!2888 = !DILocation(line: 703, column: 16, scope: !2879)
!2889 = !DILocation(line: 705, column: 3, scope: !2879)
!2890 = !DILocation(line: 706, column: 19, scope: !2879)
!2891 = !DILocalVariable(name: "nblocks", scope: !2879, file: !27, line: 702, type: !1902)
!2892 = !DILocation(line: 707, column: 3, scope: !2879)
!2893 = !DILocation(line: 708, column: 20, scope: !2879)
!2894 = !DILocation(line: 708, column: 10, scope: !2879)
!2895 = !DILocation(line: 709, column: 17, scope: !2879)
!2896 = !DILocation(line: 709, column: 7, scope: !2879)
!2897 = !DILocation(line: 710, column: 3, scope: !2879)
!2898 = !DILocation(line: 711, column: 1, scope: !2879)
!2899 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !27, file: !27, line: 723, type: !2880, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2900 = !DILocalVariable(name: "out", arg: 1, scope: !2899, file: !27, line: 723, type: !60)
!2901 = !DILocation(line: 0, scope: !2899)
!2902 = !DILocalVariable(name: "outlen", arg: 2, scope: !2899, file: !27, line: 723, type: !1902)
!2903 = !DILocalVariable(name: "in", arg: 3, scope: !2899, file: !27, line: 723, type: !64)
!2904 = !DILocalVariable(name: "inlen", arg: 4, scope: !2899, file: !27, line: 723, type: !1902)
!2905 = !DILocalVariable(name: "state", scope: !2899, file: !27, line: 726, type: !1982)
!2906 = !DILocation(line: 726, column: 16, scope: !2899)
!2907 = !DILocation(line: 728, column: 3, scope: !2899)
!2908 = !DILocation(line: 729, column: 19, scope: !2899)
!2909 = !DILocalVariable(name: "nblocks", scope: !2899, file: !27, line: 725, type: !1902)
!2910 = !DILocation(line: 730, column: 3, scope: !2899)
!2911 = !DILocation(line: 731, column: 20, scope: !2899)
!2912 = !DILocation(line: 731, column: 10, scope: !2899)
!2913 = !DILocation(line: 732, column: 17, scope: !2899)
!2914 = !DILocation(line: 732, column: 7, scope: !2899)
!2915 = !DILocation(line: 733, column: 3, scope: !2899)
!2916 = !DILocation(line: 734, column: 1, scope: !2899)
!2917 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !27, file: !27, line: 745, type: !2918, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2918 = !DISubroutineType(types: !2919)
!2919 = !{null, !60, !64, !1902}
!2920 = !DILocalVariable(name: "h", arg: 1, scope: !2917, file: !27, line: 745, type: !60)
!2921 = !DILocation(line: 0, scope: !2917)
!2922 = !DILocalVariable(name: "in", arg: 2, scope: !2917, file: !27, line: 745, type: !64)
!2923 = !DILocalVariable(name: "inlen", arg: 3, scope: !2917, file: !27, line: 745, type: !1902)
!2924 = !DILocalVariable(name: "s", scope: !2917, file: !27, line: 748, type: !211)
!2925 = !DILocation(line: 748, column: 12, scope: !2917)
!2926 = !DILocation(line: 750, column: 22, scope: !2917)
!2927 = !DILocation(line: 750, column: 3, scope: !2917)
!2928 = !DILocation(line: 751, column: 28, scope: !2917)
!2929 = !DILocation(line: 751, column: 3, scope: !2917)
!2930 = !DILocalVariable(name: "i", scope: !2917, file: !27, line: 747, type: !42)
!2931 = !DILocation(line: 752, column: 7, scope: !2932)
!2932 = distinct !DILexicalBlock(scope: !2917, file: !27, line: 752, column: 3)
!2933 = !DILocation(line: 752, scope: !2932)
!2934 = !DILocation(line: 752, column: 12, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2932, file: !27, line: 752, column: 3)
!2936 = !DILocation(line: 752, column: 3, scope: !2932)
!2937 = !DILocation(line: 753, column: 16, scope: !2935)
!2938 = !DILocation(line: 753, column: 14, scope: !2935)
!2939 = !DILocation(line: 753, column: 19, scope: !2935)
!2940 = !DILocation(line: 753, column: 5, scope: !2935)
!2941 = !DILocation(line: 752, column: 16, scope: !2935)
!2942 = !DILocation(line: 752, column: 3, scope: !2935)
!2943 = distinct !{!2943, !2936, !2944, !259}
!2944 = !DILocation(line: 753, column: 23, scope: !2932)
!2945 = !DILocation(line: 754, column: 1, scope: !2917)
!2946 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !27, file: !27, line: 765, type: !2918, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !66)
!2947 = !DILocalVariable(name: "h", arg: 1, scope: !2946, file: !27, line: 765, type: !60)
!2948 = !DILocation(line: 0, scope: !2946)
!2949 = !DILocalVariable(name: "in", arg: 2, scope: !2946, file: !27, line: 765, type: !64)
!2950 = !DILocalVariable(name: "inlen", arg: 3, scope: !2946, file: !27, line: 765, type: !1902)
!2951 = !DILocalVariable(name: "s", scope: !2946, file: !27, line: 768, type: !211)
!2952 = !DILocation(line: 768, column: 12, scope: !2946)
!2953 = !DILocation(line: 770, column: 22, scope: !2946)
!2954 = !DILocation(line: 770, column: 3, scope: !2946)
!2955 = !DILocation(line: 771, column: 28, scope: !2946)
!2956 = !DILocation(line: 771, column: 3, scope: !2946)
!2957 = !DILocalVariable(name: "i", scope: !2946, file: !27, line: 767, type: !42)
!2958 = !DILocation(line: 772, column: 7, scope: !2959)
!2959 = distinct !DILexicalBlock(scope: !2946, file: !27, line: 772, column: 3)
!2960 = !DILocation(line: 772, scope: !2959)
!2961 = !DILocation(line: 772, column: 12, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2959, file: !27, line: 772, column: 3)
!2963 = !DILocation(line: 772, column: 3, scope: !2959)
!2964 = !DILocation(line: 773, column: 16, scope: !2962)
!2965 = !DILocation(line: 773, column: 14, scope: !2962)
!2966 = !DILocation(line: 773, column: 19, scope: !2962)
!2967 = !DILocation(line: 773, column: 5, scope: !2962)
!2968 = !DILocation(line: 772, column: 16, scope: !2962)
!2969 = !DILocation(line: 772, column: 3, scope: !2962)
!2970 = distinct !{!2970, !2963, !2971, !259}
!2971 = !DILocation(line: 773, column: 23, scope: !2959)
!2972 = !DILocation(line: 774, column: 1, scope: !2946)
!2973 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !2974, file: !2974, line: 18, type: !2975, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!2974 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/kyber/llvm-ir/build")
!2975 = !DISubroutineType(types: !2976)
!2976 = !{null, !2977, !64, !61, !61}
!2977 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2978, size: 32)
!2978 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !207, line: 17, baseType: !2979)
!2979 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !207, line: 14, size: 1664, elements: !2980)
!2980 = !{!2981, !2982}
!2981 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2979, file: !207, line: 15, baseType: !211, size: 1600)
!2982 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2979, file: !207, line: 16, baseType: !42, size: 32, offset: 1600)
!2983 = !DILocalVariable(name: "state", arg: 1, scope: !2973, file: !2974, line: 18, type: !2977)
!2984 = !DILocation(line: 0, scope: !2973)
!2985 = !DILocalVariable(name: "seed", arg: 2, scope: !2973, file: !2974, line: 19, type: !64)
!2986 = !DILocalVariable(name: "x", arg: 3, scope: !2973, file: !2974, line: 20, type: !61)
!2987 = !DILocalVariable(name: "y", arg: 4, scope: !2973, file: !2974, line: 21, type: !61)
!2988 = !DILocalVariable(name: "extseed", scope: !2973, file: !2974, line: 23, type: !2989)
!2989 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 272, elements: !2990)
!2990 = !{!2991}
!2991 = !DISubrange(count: 34)
!2992 = !DILocation(line: 23, column: 11, scope: !2973)
!2993 = !DILocation(line: 25, column: 10, scope: !2973)
!2994 = !DILocation(line: 25, column: 3, scope: !2973)
!2995 = !DILocation(line: 26, column: 3, scope: !2973)
!2996 = !DILocation(line: 26, column: 29, scope: !2973)
!2997 = !DILocation(line: 27, column: 3, scope: !2973)
!2998 = !DILocation(line: 27, column: 29, scope: !2973)
!2999 = !DILocation(line: 29, column: 31, scope: !2973)
!3000 = !DILocation(line: 29, column: 3, scope: !2973)
!3001 = !DILocation(line: 30, column: 1, scope: !2973)
!3002 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !2974, file: !2974, line: 43, type: !3003, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!3003 = !DISubroutineType(types: !3004)
!3004 = !{null, !60, !1902, !64, !61}
!3005 = !DILocalVariable(name: "out", arg: 1, scope: !3002, file: !2974, line: 43, type: !60)
!3006 = !DILocation(line: 0, scope: !3002)
!3007 = !DILocalVariable(name: "outlen", arg: 2, scope: !3002, file: !2974, line: 43, type: !1902)
!3008 = !DILocalVariable(name: "key", arg: 3, scope: !3002, file: !2974, line: 43, type: !64)
!3009 = !DILocalVariable(name: "nonce", arg: 4, scope: !3002, file: !2974, line: 43, type: !61)
!3010 = !DILocalVariable(name: "extkey", scope: !3002, file: !2974, line: 45, type: !3011)
!3011 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 264, elements: !3012)
!3012 = !{!3013}
!3013 = !DISubrange(count: 33)
!3014 = !DILocation(line: 45, column: 11, scope: !3002)
!3015 = !DILocation(line: 47, column: 10, scope: !3002)
!3016 = !DILocation(line: 47, column: 3, scope: !3002)
!3017 = !DILocation(line: 48, column: 3, scope: !3002)
!3018 = !DILocation(line: 48, column: 26, scope: !3002)
!3019 = !DILocation(line: 50, column: 25, scope: !3002)
!3020 = !DILocation(line: 50, column: 3, scope: !3002)
!3021 = !DILocation(line: 51, column: 1, scope: !3002)
!3022 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !2974, file: !2974, line: 64, type: !546, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !50, retainedNodes: !66)
!3023 = !DILocalVariable(name: "out", arg: 1, scope: !3022, file: !2974, line: 64, type: !60)
!3024 = !DILocation(line: 0, scope: !3022)
!3025 = !DILocalVariable(name: "key", arg: 2, scope: !3022, file: !2974, line: 64, type: !64)
!3026 = !DILocalVariable(name: "input", arg: 3, scope: !3022, file: !2974, line: 64, type: !64)
!3027 = !DILocalVariable(name: "s", scope: !3022, file: !2974, line: 66, type: !2978)
!3028 = !DILocation(line: 66, column: 16, scope: !3022)
!3029 = !DILocation(line: 68, column: 3, scope: !3022)
!3030 = !DILocation(line: 69, column: 3, scope: !3022)
!3031 = !DILocation(line: 70, column: 3, scope: !3022)
!3032 = !DILocation(line: 71, column: 3, scope: !3022)
!3033 = !DILocation(line: 72, column: 3, scope: !3022)
!3034 = !DILocation(line: 73, column: 1, scope: !3022)
