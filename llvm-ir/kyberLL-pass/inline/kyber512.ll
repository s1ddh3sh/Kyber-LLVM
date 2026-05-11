; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [2 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@.str = private unnamed_addr constant [28 x i8] c"CRYPTO_SECRETKEYBYTES:  %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [28 x i8] c"CRYPTO_PUBLICKEYBYTES:  %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [28 x i8] c"CRYPTO_CIPHERTEXTBYTES: %d\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [12 x i8] c"ERROR keys\0A\00", align 1, !dbg !11
@.str.4 = private unnamed_addr constant [18 x i8] c"ERROR invalid sk\0A\00", align 1, !dbg !16
@.str.5 = private unnamed_addr constant [26 x i8] c"ERROR invalid ciphertext\0A\00", align 1, !dbg !21
@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !26
@.str.6 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !44
@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !66

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !106 {
entry:
  %coins.i2.i = alloca [64 x i8], align 1
  %coins.i.i19 = alloca [32 x i8], align 1
  %pk.i20 = alloca [800 x i8], align 1
  %sk.i21 = alloca [1632 x i8], align 1
  %ct.i22 = alloca [768 x i8], align 1
  %key_a.i23 = alloca [32 x i8], align 1
  %key_b.i24 = alloca [32 x i8], align 1
  %b.i = alloca i8, align 1
  %pos.i = alloca i32, align 4
  %coins.i1.i1 = alloca [32 x i8], align 1
  %coins.i.i2 = alloca [64 x i8], align 1
  %pk.i3 = alloca [800 x i8], align 1
  %sk.i4 = alloca [1632 x i8], align 1
  %ct.i5 = alloca [768 x i8], align 1
  %key_a.i6 = alloca [32 x i8], align 1
  %key_b.i7 = alloca [32 x i8], align 1
  %coins.i1.i = alloca [32 x i8], align 1
  %coins.i.i = alloca [64 x i8], align 1
  %pk.i = alloca [800 x i8], align 1
  %sk.i = alloca [1632 x i8], align 1
  %ct.i = alloca [768 x i8], align 1
  %key_a.i = alloca [32 x i8], align 1
  %key_b.i = alloca [32 x i8], align 1
    #dbg_value(i32 0, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !113
    #dbg_value(i32 %i.0, !109, !DIExpression(), !110)
  %exitcond = icmp ne i32 %i.0, 1000, !dbg !114
  br i1 %exitcond, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %pk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 1632, ptr nonnull %sk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 768, ptr nonnull %ct.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i), !dbg !117
    #dbg_declare(ptr %pk.i, !126, !DIExpression(), !130)
    #dbg_declare(ptr %sk.i, !131, !DIExpression(), !135)
    #dbg_declare(ptr %ct.i, !136, !DIExpression(), !140)
    #dbg_declare(ptr %key_a.i, !141, !DIExpression(), !145)
    #dbg_declare(ptr %key_b.i, !146, !DIExpression(), !147)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i.i), !dbg !117
    #dbg_value(ptr %pk.i, !148, !DIExpression(), !149)
    #dbg_value(ptr %sk.i, !150, !DIExpression(), !149)
    #dbg_declare(ptr %coins.i.i, !151, !DIExpression(), !155)
  call void @randombytes(ptr noundef nonnull %coins.i.i, i32 noundef 64) #4, !dbg !117
    #dbg_value(ptr %pk.i, !156, !DIExpression(), !162)
    #dbg_value(ptr %sk.i, !164, !DIExpression(), !162)
    #dbg_value(ptr %coins.i.i, !165, !DIExpression(), !162)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i, ptr noundef nonnull %sk.i, ptr noundef nonnull %coins.i.i) #4, !dbg !166
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 768, !dbg !167
  %call.i3.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i, ptr noundef nonnull %pk.i, i32 noundef 800) #5, !dbg !168
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 1568, !dbg !169
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i, ptr noundef nonnull %pk.i, i32 noundef 800) #4, !dbg !169
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 1600, !dbg !170
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %coins.i.i, i32 32, !dbg !171
  %call6.i.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i, ptr noundef nonnull %add.ptr5.i.i, i32 noundef 32) #5, !dbg !172
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i), !dbg !173
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !174
    #dbg_value(ptr %ct.i, !177, !DIExpression(), !178)
    #dbg_value(ptr %key_b.i, !179, !DIExpression(), !178)
    #dbg_value(ptr %pk.i, !180, !DIExpression(), !178)
    #dbg_declare(ptr %coins.i1.i, !181, !DIExpression(), !182)
  call void @randombytes(ptr noundef nonnull %coins.i1.i, i32 noundef 32) #4, !dbg !174
  %call.i2.i = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef nonnull %ct.i, ptr noundef nonnull %key_b.i, ptr noundef nonnull %pk.i, ptr noundef nonnull %coins.i1.i) #4, !dbg !183
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !184
  %call9.i = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a.i, ptr noundef nonnull %ct.i, ptr noundef nonnull %sk.i) #4, !dbg !185
  %call12.i = call i32 @memcmp(ptr noundef nonnull %key_a.i, ptr noundef nonnull %key_b.i, i32 noundef 32) #5, !dbg !186
  %tobool.not.i = icmp eq i32 %call12.i, 0, !dbg !186
  br i1 %tobool.not.i, label %test_keys.exit, label %if.then.i, !dbg !186

if.then.i:                                        ; preds = %for.body
  %call13.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #5, !dbg !188
  br label %test_keys.exit, !dbg !190

test_keys.exit:                                   ; preds = %for.body, %if.then.i
  %retval.0.i = phi i32 [ 1, %if.then.i ], [ 0, %for.body ], !dbg !191
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %pk.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 1632, ptr nonnull %sk.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 768, ptr nonnull %ct.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i), !dbg !192
    #dbg_value(i32 %retval.0.i, !193, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %pk.i3), !dbg !194
  call void @llvm.lifetime.start.p0(i64 1632, ptr nonnull %sk.i4), !dbg !194
  call void @llvm.lifetime.start.p0(i64 768, ptr nonnull %ct.i5), !dbg !194
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i6), !dbg !194
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i7), !dbg !194
    #dbg_declare(ptr %pk.i3, !198, !DIExpression(), !199)
    #dbg_declare(ptr %sk.i4, !200, !DIExpression(), !201)
    #dbg_declare(ptr %ct.i5, !202, !DIExpression(), !203)
    #dbg_declare(ptr %key_a.i6, !204, !DIExpression(), !205)
    #dbg_declare(ptr %key_b.i7, !206, !DIExpression(), !207)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i.i2), !dbg !194
    #dbg_value(ptr %pk.i3, !148, !DIExpression(), !208)
    #dbg_value(ptr %sk.i4, !150, !DIExpression(), !208)
    #dbg_declare(ptr %coins.i.i2, !151, !DIExpression(), !209)
  call void @randombytes(ptr noundef nonnull %coins.i.i2, i32 noundef 64) #4, !dbg !194
    #dbg_value(ptr %pk.i3, !156, !DIExpression(), !210)
    #dbg_value(ptr %sk.i4, !164, !DIExpression(), !210)
    #dbg_value(ptr %coins.i.i2, !165, !DIExpression(), !210)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i3, ptr noundef nonnull %sk.i4, ptr noundef nonnull %coins.i.i2) #4, !dbg !212
  %add.ptr.i.i8 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 768, !dbg !213
  %call.i3.i9 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i8, ptr noundef nonnull %pk.i3, i32 noundef 800) #5, !dbg !214
  %add.ptr2.i.i10 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 1568, !dbg !215
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i10, ptr noundef nonnull %pk.i3, i32 noundef 800) #4, !dbg !215
  %add.ptr4.i.i11 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 1600, !dbg !216
  %add.ptr5.i.i12 = getelementptr inbounds nuw i8, ptr %coins.i.i2, i32 32, !dbg !217
  %call6.i.i13 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i11, ptr noundef nonnull %add.ptr5.i.i12, i32 noundef 32) #5, !dbg !218
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i2), !dbg !219
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !220
    #dbg_value(ptr %ct.i5, !177, !DIExpression(), !222)
    #dbg_value(ptr %key_b.i7, !179, !DIExpression(), !222)
    #dbg_value(ptr %pk.i3, !180, !DIExpression(), !222)
    #dbg_declare(ptr %coins.i1.i1, !181, !DIExpression(), !223)
  call void @randombytes(ptr noundef nonnull %coins.i1.i1, i32 noundef 32) #4, !dbg !220
  %call.i2.i14 = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef nonnull %ct.i5, ptr noundef nonnull %key_b.i7, ptr noundef nonnull %pk.i3, ptr noundef nonnull %coins.i1.i1) #4, !dbg !224
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !225
  call void @randombytes(ptr noundef nonnull %sk.i4, i32 noundef 1632) #4, !dbg !226
  %call10.i = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %ct.i5, ptr noundef nonnull %sk.i4) #4, !dbg !227
  %call13.i15 = call i32 @memcmp(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %key_b.i7, i32 noundef 32) #5, !dbg !228
  %tobool.not.i16 = icmp eq i32 %call13.i15, 0, !dbg !228
  br i1 %tobool.not.i16, label %if.then.i18, label %test_invalid_sk_a.exit, !dbg !230

if.then.i18:                                      ; preds = %test_keys.exit
  %call14.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #5, !dbg !231
  br label %test_invalid_sk_a.exit, !dbg !233

test_invalid_sk_a.exit:                           ; preds = %test_keys.exit, %if.then.i18
  %retval.0.i17 = phi i32 [ 1, %if.then.i18 ], [ 0, %test_keys.exit ], !dbg !234
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %pk.i3), !dbg !235
  call void @llvm.lifetime.end.p0(i64 1632, ptr nonnull %sk.i4), !dbg !235
  call void @llvm.lifetime.end.p0(i64 768, ptr nonnull %ct.i5), !dbg !235
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i6), !dbg !235
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i7), !dbg !235
    #dbg_value(i32 %or, !193, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 800, ptr nonnull %pk.i20), !dbg !236
  call void @llvm.lifetime.start.p0(i64 1632, ptr nonnull %sk.i21), !dbg !236
  call void @llvm.lifetime.start.p0(i64 768, ptr nonnull %ct.i22), !dbg !236
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i23), !dbg !236
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i24), !dbg !236
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %b.i), !dbg !236
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %pos.i), !dbg !236
    #dbg_declare(ptr %pk.i20, !239, !DIExpression(), !240)
    #dbg_declare(ptr %sk.i21, !241, !DIExpression(), !242)
    #dbg_declare(ptr %ct.i22, !243, !DIExpression(), !244)
    #dbg_declare(ptr %key_a.i23, !245, !DIExpression(), !246)
    #dbg_declare(ptr %key_b.i24, !247, !DIExpression(), !248)
  br label %do.body.i, !dbg !236

do.body.i:                                        ; preds = %do.body.i, %test_invalid_sk_a.exit
    #dbg_value(ptr %b.i, !249, !DIExpression(DW_OP_deref), !250)
  call void @randombytes(ptr noundef nonnull %b.i, i32 noundef 1) #4, !dbg !251
  %0 = load i8, ptr %b.i, align 1, !dbg !253
    #dbg_value(i8 %0, !249, !DIExpression(), !250)
  %tobool.not.i25 = icmp eq i8 %0, 0, !dbg !254
  br i1 %tobool.not.i25, label %do.body.i, label %do.end.i, !dbg !255, !llvm.loop !256

do.end.i:                                         ; preds = %do.body.i
  %or = or i32 %retval.0.i, %retval.0.i17, !dbg !259
    #dbg_value(ptr %pos.i, !260, !DIExpression(DW_OP_deref), !250)
  call void @randombytes(ptr noundef nonnull %pos.i, i32 noundef 4) #4, !dbg !261
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i2.i), !dbg !262
    #dbg_value(ptr %pk.i20, !148, !DIExpression(), !264)
    #dbg_value(ptr %sk.i21, !150, !DIExpression(), !264)
    #dbg_declare(ptr %coins.i2.i, !151, !DIExpression(), !265)
  call void @randombytes(ptr noundef nonnull %coins.i2.i, i32 noundef 64) #4, !dbg !262
    #dbg_value(ptr %pk.i20, !156, !DIExpression(), !266)
    #dbg_value(ptr %sk.i21, !164, !DIExpression(), !266)
    #dbg_value(ptr %coins.i2.i, !165, !DIExpression(), !266)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i20, ptr noundef nonnull %sk.i21, ptr noundef nonnull %coins.i2.i) #4, !dbg !268
  %add.ptr.i.i26 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 768, !dbg !269
  %call.i4.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i26, ptr noundef nonnull %pk.i20, i32 noundef 800) #5, !dbg !270
  %add.ptr2.i.i27 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 1568, !dbg !271
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i27, ptr noundef nonnull %pk.i20, i32 noundef 800) #4, !dbg !271
  %add.ptr4.i.i28 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 1600, !dbg !272
  %add.ptr5.i.i29 = getelementptr inbounds nuw i8, ptr %coins.i2.i, i32 32, !dbg !273
  %call6.i.i30 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i28, ptr noundef nonnull %add.ptr5.i.i29, i32 noundef 32) #5, !dbg !274
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i2.i), !dbg !275
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !276
    #dbg_value(ptr %ct.i22, !177, !DIExpression(), !278)
    #dbg_value(ptr %key_b.i24, !179, !DIExpression(), !278)
    #dbg_value(ptr %pk.i20, !180, !DIExpression(), !278)
    #dbg_declare(ptr %coins.i.i19, !181, !DIExpression(), !279)
  call void @randombytes(ptr noundef nonnull %coins.i.i19, i32 noundef 32) #4, !dbg !276
  %call.i.i = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef nonnull %ct.i22, ptr noundef nonnull %key_b.i24, ptr noundef nonnull %pk.i20, ptr noundef nonnull %coins.i.i19) #4, !dbg !280
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !281
  %1 = load i8, ptr %b.i, align 1, !dbg !282
    #dbg_value(i8 %1, !249, !DIExpression(), !250)
  %2 = load i32, ptr %pos.i, align 4, !dbg !283
    #dbg_value(i32 %2, !260, !DIExpression(), !250)
  %rem.i = urem i32 %2, 768, !dbg !284
  %arrayidx.i = getelementptr inbounds nuw [768 x i8], ptr %ct.i22, i32 0, i32 %rem.i, !dbg !285
  %3 = load i8, ptr %arrayidx.i, align 1, !dbg !286
  %xor1.i = xor i8 %3, %1, !dbg !286
  store i8 %xor1.i, ptr %arrayidx.i, align 1, !dbg !286
  %call11.i = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %ct.i22, ptr noundef nonnull %sk.i21) #4, !dbg !287
  %call14.i31 = call i32 @memcmp(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %key_b.i24, i32 noundef 32) #5, !dbg !288
  %tobool15.not.i = icmp eq i32 %call14.i31, 0, !dbg !288
  br i1 %tobool15.not.i, label %if.then.i33, label %test_invalid_ciphertext.exit, !dbg !290

if.then.i33:                                      ; preds = %do.end.i
  %call16.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #5, !dbg !291
  br label %test_invalid_ciphertext.exit, !dbg !293

test_invalid_ciphertext.exit:                     ; preds = %do.end.i, %if.then.i33
  %retval.0.i32 = phi i32 [ 1, %if.then.i33 ], [ 0, %do.end.i ], !dbg !250
  call void @llvm.lifetime.end.p0(i64 800, ptr nonnull %pk.i20), !dbg !294
  call void @llvm.lifetime.end.p0(i64 1632, ptr nonnull %sk.i21), !dbg !294
  call void @llvm.lifetime.end.p0(i64 768, ptr nonnull %ct.i22), !dbg !294
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i23), !dbg !294
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i24), !dbg !294
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %b.i), !dbg !294
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %pos.i), !dbg !294
  %or3 = or i32 %or, %retval.0.i32, !dbg !295
    #dbg_value(i32 %or3, !193, !DIExpression(), !110)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !296
  br i1 %tobool.not, label %for.inc, label %return.loopexit, !dbg !296

for.inc:                                          ; preds = %test_invalid_ciphertext.exit
  %inc = add nuw nsw i32 %i.0, 1, !dbg !298
    #dbg_value(i32 %inc, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 1632) #5, !dbg !302
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 800) #5, !dbg !303
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 768) #5, !dbg !304
  br label %return, !dbg !305

return.loopexit:                                  ; preds = %test_invalid_ciphertext.exit
  br label %return, !dbg !306

return:                                           ; preds = %return.loopexit, %for.end
  %retval.0 = phi i32 [ 0, %for.end ], [ 1, %return.loopexit ], !dbg !110
  ret i32 %retval.0, !dbg !306
}

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !307, !DIExpression(), !308)
    #dbg_value(i32 %outlen, !309, !DIExpression(), !308)
  br label %while.cond, !dbg !310

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !311
  %cmp = icmp eq i32 %0, -1, !dbg !312
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !310

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !313

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.6, i32 noundef 0) #5, !dbg !314
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !316
  %cmp1 = icmp eq i32 %call, -1, !dbg !317
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !319

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #5, !dbg !320
  %1 = load i32, ptr %call2, align 4, !dbg !320
  %cmp3 = icmp eq i32 %1, 4, !dbg !321
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !319

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !322
  %cmp4 = icmp eq i32 %2, -1, !dbg !324
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !324

if.then5:                                         ; preds = %if.else
  call void @abort() #5, !dbg !325
  br label %if.end6, !dbg !325

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !310

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !311, !llvm.loop !326

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !307, !DIExpression(), !308)
    #dbg_value(i32 %outlen.addr.0.ph, !309, !DIExpression(), !308)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !328
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !313

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !329
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #5, !dbg !331
    #dbg_value(i32 %call10, !332, !DIExpression(), !308)
  %cond = icmp eq i32 %call10, -1, !dbg !337
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !337

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #5, !dbg !339
  %4 = load i32, ptr %call13, align 4, !dbg !339
  %cmp14 = icmp eq i32 %4, 4, !dbg !340
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !337, !llvm.loop !341

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !331
  call void @abort() #5, !dbg !343
  br label %if.end20, !dbg !343

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !331
  br label %if.end20, !dbg !345

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !345
    #dbg_value(ptr %add.ptr, !307, !DIExpression(), !308)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !346
    #dbg_value(i32 %sub, !309, !DIExpression(), !308)
  br label %while.cond7.outer, !dbg !313, !llvm.loop !341

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !313

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !347
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !157 {
entry:
    #dbg_value(ptr %pk, !156, !DIExpression(), !348)
    #dbg_value(ptr %sk, !164, !DIExpression(), !348)
    #dbg_value(ptr %coins, !165, !DIExpression(), !348)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !349
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !350
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #5, !dbg !351
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !352
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #4, !dbg !352
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !353
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !354
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !355
  ret i32 0, !dbg !356
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !118 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !148, !DIExpression(), !357)
    #dbg_value(ptr %sk, !150, !DIExpression(), !357)
    #dbg_declare(ptr %coins, !151, !DIExpression(), !358)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !359
    #dbg_value(ptr %pk, !156, !DIExpression(), !360)
    #dbg_value(ptr %sk, !164, !DIExpression(), !360)
    #dbg_value(ptr %coins, !165, !DIExpression(), !360)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !362
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !363
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 800) #5, !dbg !364
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !365
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 800) #4, !dbg !365
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !366
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !367
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !368
  ret i32 0, !dbg !369
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !370 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !373, !DIExpression(), !374)
    #dbg_value(ptr %ss, !375, !DIExpression(), !374)
    #dbg_value(ptr %pk, !376, !DIExpression(), !374)
    #dbg_value(ptr %coins, !377, !DIExpression(), !374)
    #dbg_declare(ptr %buf, !378, !DIExpression(), !379)
    #dbg_declare(ptr %kr, !380, !DIExpression(), !381)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !382
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !383
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #4, !dbg !383
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !384
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !385
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !386
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !387
  ret i32 0, !dbg !388
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !175 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !177, !DIExpression(), !389)
    #dbg_value(ptr %ss, !179, !DIExpression(), !389)
    #dbg_value(ptr %pk, !180, !DIExpression(), !389)
    #dbg_declare(ptr %coins, !181, !DIExpression(), !390)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !391
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !392
  ret i32 0, !dbg !393
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !394 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !397, !DIExpression(), !398)
    #dbg_value(ptr %ct, !399, !DIExpression(), !398)
    #dbg_value(ptr %sk, !400, !DIExpression(), !398)
    #dbg_declare(ptr %buf, !401, !DIExpression(), !402)
    #dbg_declare(ptr %kr, !403, !DIExpression(), !404)
    #dbg_declare(ptr %cmp, !405, !DIExpression(), !406)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !407
    #dbg_value(ptr %add.ptr, !408, !DIExpression(), !398)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !409
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !410
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !411
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !412
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !413
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !414
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !415
    #dbg_value(ptr %ct, !416, !DIExpression(), !421)
    #dbg_value(ptr %cmp, !423, !DIExpression(), !421)
    #dbg_value(i32 768, !424, !DIExpression(), !421)
    #dbg_value(i8 0, !425, !DIExpression(), !421)
    #dbg_value(i32 0, !426, !DIExpression(), !421)
  br label %for.cond.i, !dbg !427

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !429
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !421
    #dbg_value(i8 %r.0.i, !425, !DIExpression(), !421)
    #dbg_value(i32 %i.0.i, !426, !DIExpression(), !421)
  %exitcond = icmp ne i32 %i.0.i, 768, !dbg !430
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber512_ref_verify.exit, !dbg !432

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !421)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %ct, i32 %i.0.i, !dbg !433
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !433
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %cmp, i32 %i.0.i, !dbg !434
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !434
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %0, i8 %1), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !421)
  %xor1.i = xor i8 %0, %1, !dbg !435
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %xor1.i), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !421)
  %or2.i = or i8 %r.0.i, %xor1.i, !dbg !436
    #dbg_value(i8 %or2.i, !425, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !421)
    #dbg_value(i8 %or2.i, !425, !DIExpression(), !421)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !437
    #dbg_value(i32 %inc.i, !426, !DIExpression(), !421)
  br label %for.cond.i, !dbg !438, !llvm.loop !439

pqcrystals_kyber512_ref_verify.exit:              ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !421
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !441
    #dbg_value(i1 %.not, !442, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !398)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !443
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !443
  %conv = zext i1 %.not to i8, !dbg !444
    #dbg_value(ptr %ss, !445, !DIExpression(), !449)
    #dbg_value(ptr %kr, !451, !DIExpression(), !449)
    #dbg_value(i32 32, !452, !DIExpression(), !449)
    #dbg_value(i8 %conv, !453, !DIExpression(), !449)
  %2 = call i8 asm "", "=r,0"(i8 %conv) #6, !dbg !454, !srcloc !455
    #dbg_value(i8 %2, !453, !DIExpression(), !449)
  %sub.i = sub i8 0, %2, !dbg !456
    #dbg_value(i8 %sub.i, !453, !DIExpression(), !449)
    #dbg_value(i32 0, !457, !DIExpression(), !449)
  br label %for.cond.i1, !dbg !458

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber512_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber512_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !460
    #dbg_value(i32 %i.0.i2, !457, !DIExpression(), !449)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !461
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber512_ref_cmov.exit, !dbg !463

for.body.i:                                       ; preds = %for.cond.i1
  %arrayidx.i4 = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !464
  %3 = load i8, ptr %arrayidx.i4, align 1, !dbg !464
  %arrayidx5.i = getelementptr inbounds nuw i8, ptr %kr, i32 %i.0.i2, !dbg !465
  %4 = load i8, ptr %arrayidx5.i, align 1, !dbg !465
  %xor1.i5 = xor i8 %3, %4, !dbg !466
  %and2.i = and i8 %xor1.i5, %sub.i, !dbg !467
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !468
  %xor93.i = xor i8 %3, %and2.i, !dbg !469
  store i8 %xor93.i, ptr %arrayidx7.i, align 1, !dbg !469
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !470
    #dbg_value(i32 %inc.i6, !457, !DIExpression(), !449)
  br label %for.cond.i1, !dbg !471, !llvm.loop !472

pqcrystals_kyber512_ref_cmov.exit:                ; preds = %for.cond.i1
  ret i32 0, !dbg !474
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !475 {
entry:
  %extseed.i1 = alloca [34 x i8], align 1
  %extseed.i = alloca [34 x i8], align 1
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !496, !DIExpression(), !497)
    #dbg_value(ptr %seed, !498, !DIExpression(), !497)
    #dbg_value(i32 %transposed, !499, !DIExpression(), !497)
    #dbg_declare(ptr %buf, !500, !DIExpression(), !504)
    #dbg_declare(ptr %state, !505, !DIExpression(), !517)
    #dbg_value(i32 0, !518, !DIExpression(), !497)
  br label %for.cond, !dbg !519

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !521
    #dbg_value(i32 %i.0, !518, !DIExpression(), !497)
  %exitcond39 = icmp ne i32 %i.0, 2, !dbg !522
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !524

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !525

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !528
    #dbg_value(i32 %j.0, !529, !DIExpression(), !497)
  %exitcond38 = icmp ne i32 %j.0, 2, !dbg !530
  br i1 %exitcond38, label %for.body3, label %for.inc20, !dbg !525

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !532
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !532

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !535
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !535
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i), !dbg !536
    #dbg_value(ptr %state, !548, !DIExpression(), !549)
    #dbg_value(ptr %seed, !550, !DIExpression(), !549)
    #dbg_value(i8 %conv, !551, !DIExpression(), !549)
    #dbg_value(i8 %conv4, !552, !DIExpression(), !549)
    #dbg_declare(ptr %extseed.i, !553, !DIExpression(), !557)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extseed.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !536
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 32, !dbg !558
  store i8 %conv, ptr %arrayidx.i, align 1, !dbg !559
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 33, !dbg !560
  store i8 %conv4, ptr %arrayidx1.i, align 1, !dbg !561
    #dbg_value(ptr %state, !562, !DIExpression(), !572)
    #dbg_value(ptr %extseed.i, !574, !DIExpression(), !572)
    #dbg_value(i32 34, !575, !DIExpression(), !572)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !576
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !577
  store i32 168, ptr %pos.i.i, align 8, !dbg !578
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i), !dbg !579
  br label %if.end, !dbg !535

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !580
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !580
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i1), !dbg !581
    #dbg_value(ptr %state, !548, !DIExpression(), !583)
    #dbg_value(ptr %seed, !550, !DIExpression(), !583)
    #dbg_value(i8 %conv5, !551, !DIExpression(), !583)
    #dbg_value(i8 %conv6, !552, !DIExpression(), !583)
    #dbg_declare(ptr %extseed.i1, !553, !DIExpression(), !584)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extseed.i1, ptr noundef %seed, i32 noundef 32) #5, !dbg !581
  %arrayidx.i3 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 32, !dbg !585
  store i8 %conv5, ptr %arrayidx.i3, align 1, !dbg !586
  %arrayidx1.i4 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 33, !dbg !587
  store i8 %conv6, ptr %arrayidx1.i4, align 1, !dbg !588
    #dbg_value(ptr %state, !562, !DIExpression(), !589)
    #dbg_value(ptr %extseed.i1, !574, !DIExpression(), !589)
    #dbg_value(i32 34, !575, !DIExpression(), !589)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i1, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !591
  %pos.i.i5 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !592
  store i32 168, ptr %pos.i.i5, align 8, !dbg !593
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i1), !dbg !594
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
    #dbg_value(ptr %buf, !595, !DIExpression(), !599)
    #dbg_value(i32 3, !601, !DIExpression(), !599)
    #dbg_value(ptr %state, !602, !DIExpression(), !599)
    #dbg_value(ptr %buf, !603, !DIExpression(), !608)
    #dbg_value(i32 3, !610, !DIExpression(), !608)
    #dbg_value(ptr %state, !611, !DIExpression(), !608)
    #dbg_value(i32 168, !612, !DIExpression(), !608)
  br label %while.cond.i, !dbg !613

while.cond.i:                                     ; preds = %for.end.i, %if.end
  %nblocks.addr.0.i = phi i32 [ 3, %if.end ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf, %if.end ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !608)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !608)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !613
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !613

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !614
    #dbg_value(i32 0, !616, !DIExpression(), !608)
  br label %for.cond.i, !dbg !617

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !619
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !608)
  %exitcond35 = icmp ne i32 %i.0.i, 21, !dbg !620
  br i1 %exitcond35, label %for.body.i, label %for.end.i, !dbg !622

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !623
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !624
  %arrayidx.i6 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !625
  %0 = load i64, ptr %arrayidx.i6, align 8, !dbg !625
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !630)
    #dbg_value(i64 %0, !632, !DIExpression(), !630)
    #dbg_value(i32 0, !633, !DIExpression(), !630)
  br label %for.cond.i.i, !dbg !634

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !636
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !630)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !637
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !639

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !640
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !641
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !641
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !642
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !643
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !644
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !645
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !630)
  br label %for.cond.i.i, !dbg !646, !llvm.loop !647

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !649
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !608)
  br label %for.cond.i, !dbg !650, !llvm.loop !651

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !653
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !608)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !654
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !608)
  br label %while.cond.i, !dbg !613, !llvm.loop !655

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 504, !657, !DIExpression(), !497)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !658
  %arrayidx7 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !658
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #4, !dbg !659
    #dbg_value(i32 %call, !660, !DIExpression(), !497)
  br label %while.cond, !dbg !661

while.cond:                                       ; preds = %keccak_squeezeblocks.exit34, %keccak_squeezeblocks.exit
  %ctr.0 = phi i32 [ %call, %keccak_squeezeblocks.exit ], [ %add, %keccak_squeezeblocks.exit34 ], !dbg !662
    #dbg_value(i32 %ctr.0, !660, !DIExpression(), !497)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !663
  br i1 %cmp10, label %while.cond.i7.preheader, label %for.inc, !dbg !661

while.cond.i7.preheader:                          ; preds = %while.cond
  br label %while.cond.i7, !dbg !664

while.cond.i7:                                    ; preds = %while.cond.i7.preheader, %for.end.i15
  %nblocks.addr.0.i8 = phi i32 [ %sub.i17, %for.end.i15 ], [ 1, %while.cond.i7.preheader ]
  %out.addr.0.i9 = phi ptr [ %add.ptr1.i16, %for.end.i15 ], [ %buf, %while.cond.i7.preheader ]
    #dbg_value(ptr %out.addr.0.i9, !603, !DIExpression(), !668)
    #dbg_value(i32 %nblocks.addr.0.i8, !610, !DIExpression(), !668)
  %tobool.not.i10 = icmp eq i32 %nblocks.addr.0.i8, 0, !dbg !664
  br i1 %tobool.not.i10, label %keccak_squeezeblocks.exit34, label %while.body.i11, !dbg !664

while.body.i11:                                   ; preds = %while.cond.i7
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !669
    #dbg_value(i32 0, !616, !DIExpression(), !668)
  br label %for.cond.i12, !dbg !670

for.cond.i12:                                     ; preds = %store64.exit.i25, %while.body.i11
  %i.0.i13 = phi i32 [ 0, %while.body.i11 ], [ %inc.i26, %store64.exit.i25 ], !dbg !671
    #dbg_value(i32 %i.0.i13, !616, !DIExpression(), !668)
  %exitcond37 = icmp ne i32 %i.0.i13, 21, !dbg !672
  br i1 %exitcond37, label %for.body.i18, label %for.end.i15, !dbg !673

for.body.i18:                                     ; preds = %for.cond.i12
  %mul.i19 = shl nuw nsw i32 %i.0.i13, 3, !dbg !674
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 %mul.i19, !dbg !675
  %arrayidx.i21 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i13, !dbg !676
  %1 = load i64, ptr %arrayidx.i21, align 8, !dbg !676
    #dbg_value(ptr %add.ptr.i20, !626, !DIExpression(), !677)
    #dbg_value(i64 %1, !632, !DIExpression(), !677)
    #dbg_value(i32 0, !633, !DIExpression(), !677)
  br label %for.cond.i.i22, !dbg !679

for.cond.i.i22:                                   ; preds = %for.body.i.i27, %for.body.i18
  %i.0.i.i23 = phi i32 [ 0, %for.body.i18 ], [ %inc.i.i33, %for.body.i.i27 ], !dbg !680
    #dbg_value(i32 %i.0.i.i23, !633, !DIExpression(), !677)
  %exitcond36 = icmp ne i32 %i.0.i.i23, 8, !dbg !681
  br i1 %exitcond36, label %for.body.i.i27, label %store64.exit.i25, !dbg !682

for.body.i.i27:                                   ; preds = %for.cond.i.i22
  %mul.i.i28 = shl nuw nsw i32 %i.0.i.i23, 3, !dbg !683
  %sh_prom.i.i29 = zext nneg i32 %mul.i.i28 to i64, !dbg !684
  %shr.i.i30 = lshr i64 %1, %sh_prom.i.i29, !dbg !684
  %conv.i.i31 = trunc i64 %shr.i.i30 to i8, !dbg !685
  %arrayidx.i.i32 = getelementptr inbounds nuw i8, ptr %add.ptr.i20, i32 %i.0.i.i23, !dbg !686
  store i8 %conv.i.i31, ptr %arrayidx.i.i32, align 1, !dbg !687
  %inc.i.i33 = add nuw nsw i32 %i.0.i.i23, 1, !dbg !688
    #dbg_value(i32 %inc.i.i33, !633, !DIExpression(), !677)
  br label %for.cond.i.i22, !dbg !689, !llvm.loop !690

store64.exit.i25:                                 ; preds = %for.cond.i.i22
  %inc.i26 = add nuw nsw i32 %i.0.i13, 1, !dbg !692
    #dbg_value(i32 %inc.i26, !616, !DIExpression(), !668)
  br label %for.cond.i12, !dbg !693, !llvm.loop !694

for.end.i15:                                      ; preds = %for.cond.i12
  %add.ptr1.i16 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 168, !dbg !696
    #dbg_value(ptr %add.ptr1.i16, !603, !DIExpression(), !668)
  %sub.i17 = add nsw i32 %nblocks.addr.0.i8, -1, !dbg !697
    #dbg_value(i32 %sub.i17, !610, !DIExpression(), !668)
  br label %while.cond.i7, !dbg !664, !llvm.loop !698

keccak_squeezeblocks.exit34:                      ; preds = %while.cond.i7
    #dbg_value(i32 168, !657, !DIExpression(), !497)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !700
  %arrayidx15 = getelementptr inbounds nuw [2 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !700
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !701
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !702
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #4, !dbg !703
  %add = add i32 %ctr.0, %call19, !dbg !704
    #dbg_value(i32 %add, !660, !DIExpression(), !497)
  br label %while.cond, !dbg !661, !llvm.loop !705

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !707
    #dbg_value(i32 %inc, !529, !DIExpression(), !497)
  br label %for.cond1, !dbg !708, !llvm.loop !709

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !711
    #dbg_value(i32 %inc21, !518, !DIExpression(), !497)
  br label %for.cond, !dbg !712, !llvm.loop !713

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !715
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !716 {
entry:
    #dbg_value(ptr %r, !720, !DIExpression(), !721)
    #dbg_value(i32 %len, !722, !DIExpression(), !721)
    #dbg_value(ptr %buf, !723, !DIExpression(), !721)
    #dbg_value(i32 %buflen, !724, !DIExpression(), !721)
    #dbg_value(i32 0, !725, !DIExpression(), !721)
    #dbg_value(i32 0, !726, !DIExpression(), !721)
  br label %while.cond, !dbg !727

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !721
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !721
    #dbg_value(i32 %pos.0, !725, !DIExpression(), !721)
    #dbg_value(i32 %ctr.0, !726, !DIExpression(), !721)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !728
  %add = add i32 %pos.0, 3, !dbg !729
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !729
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !729
  br i1 %0, label %while.body, label %while.end, !dbg !727

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !730
  %1 = load i8, ptr %arrayidx, align 1, !dbg !730
  %conv = zext i8 %1 to i16, !dbg !730
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !732
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !732
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !732
  %conv6 = zext i8 %3 to i16, !dbg !733
  %shl = shl nuw i16 %conv6, 8, !dbg !734
  %shl.masked = and i16 %shl, 3840, !dbg !735
  %and = or disjoint i16 %shl.masked, %conv, !dbg !735
    #dbg_value(i16 %and, !736, !DIExpression(), !721)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !737
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !737
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !737
  %6 = lshr i8 %5, 4, !dbg !738
  %shr11 = zext nneg i8 %6 to i16, !dbg !738
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !739
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !739
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !739
  %conv15 = zext i8 %8 to i16, !dbg !740
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !741
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !742
    #dbg_value(i16 %or17, !743, !DIExpression(), !721)
  %add20 = add i32 %pos.0, 3, !dbg !744
    #dbg_value(i32 %add20, !725, !DIExpression(), !721)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !745
  br i1 %cmp22, label %if.then, label %if.end, !dbg !745

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !747
    #dbg_value(i32 %inc, !726, !DIExpression(), !721)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !748
  store i16 %and, ptr %arrayidx24, align 2, !dbg !749
  br label %if.end, !dbg !748

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !721
    #dbg_value(i32 %ctr.1, !726, !DIExpression(), !721)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !750
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !752
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !752

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !753
    #dbg_value(i32 %inc31, !726, !DIExpression(), !721)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !754
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !755
  br label %if.end33, !dbg !754

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !756
    #dbg_value(i32 %ctr.2, !726, !DIExpression(), !721)
  br label %while.cond, !dbg !727, !llvm.loop !757

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !721
  ret i32 %ctr.0.lcssa, !dbg !759
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !760 {
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
    #dbg_value(ptr %pk, !763, !DIExpression(), !764)
    #dbg_value(ptr %sk, !765, !DIExpression(), !764)
    #dbg_value(ptr %coins, !766, !DIExpression(), !764)
    #dbg_declare(ptr %buf, !767, !DIExpression(), !768)
    #dbg_value(ptr %buf, !769, !DIExpression(), !764)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !770
    #dbg_value(ptr %add.ptr, !771, !DIExpression(), !764)
    #dbg_value(i8 0, !772, !DIExpression(), !764)
    #dbg_declare(ptr %a, !773, !DIExpression(), !775)
    #dbg_declare(ptr %e, !776, !DIExpression(), !777)
    #dbg_declare(ptr %pkpv, !778, !DIExpression(), !779)
    #dbg_declare(ptr %skpv, !780, !DIExpression(), !781)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !782
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !783
  store i8 2, ptr %arrayidx, align 1, !dbg !784
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !785
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !786
    #dbg_value(i32 0, !787, !DIExpression(), !764)
  br label %for.cond, !dbg !788

for.cond:                                         ; preds = %keccak_squeeze.exit180, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit180 ], !dbg !790
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit180 ], !dbg !764
    #dbg_value(i8 %nonce.0, !772, !DIExpression(), !764)
    #dbg_value(i32 %i.0, !787, !DIExpression(), !764)
  %exitcond182 = icmp ne i32 %i.0, 2, !dbg !791
  br i1 %exitcond182, label %for.body, label %for.cond8.preheader, !dbg !793

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !794

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !772, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !764)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i), !dbg !796
    #dbg_value(ptr %arrayidx6, !807, !DIExpression(), !808)
    #dbg_value(ptr %add.ptr, !809, !DIExpression(), !808)
    #dbg_value(i8 %nonce.0, !810, !DIExpression(), !808)
    #dbg_declare(ptr %buf.i, !811, !DIExpression(), !815)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i3), !dbg !816
    #dbg_value(ptr %buf.i, !821, !DIExpression(), !822)
    #dbg_value(i32 192, !823, !DIExpression(), !822)
    #dbg_value(ptr %add.ptr, !824, !DIExpression(), !822)
    #dbg_value(i8 %nonce.0, !825, !DIExpression(), !822)
    #dbg_declare(ptr %extkey.i3, !826, !DIExpression(), !830)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i3, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !816
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %extkey.i3, i32 32, !dbg !831
  store i8 %nonce.0, ptr %arrayidx.i5, align 1, !dbg !832
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !833
    #dbg_value(ptr %buf.i, !840, !DIExpression(), !841)
    #dbg_value(i32 192, !842, !DIExpression(), !841)
    #dbg_value(ptr %extkey.i3, !843, !DIExpression(), !841)
    #dbg_value(i32 33, !844, !DIExpression(), !841)
    #dbg_declare(ptr %state.i, !845, !DIExpression(), !846)
    #dbg_value(ptr %state.i, !847, !DIExpression(), !848)
    #dbg_value(ptr %extkey.i3, !849, !DIExpression(), !848)
    #dbg_value(i32 33, !850, !DIExpression(), !848)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i3, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !833
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !851
  store i32 136, ptr %pos.i.i, align 8, !dbg !852
    #dbg_value(i32 1, !853, !DIExpression(), !841)
    #dbg_value(ptr %buf.i, !854, !DIExpression(), !856)
    #dbg_value(i32 1, !858, !DIExpression(), !856)
    #dbg_value(ptr %state.i, !859, !DIExpression(), !856)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !860)
    #dbg_value(i32 1, !610, !DIExpression(), !860)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !860)
    #dbg_value(i32 136, !612, !DIExpression(), !860)
  br label %while.cond.i109, !dbg !862

while.cond.i109:                                  ; preds = %for.end.i117, %for.body
  %nblocks.addr.0.i110 = phi i32 [ 1, %for.body ], [ %sub.i119, %for.end.i117 ]
  %out.addr.0.i111 = phi ptr [ %buf.i, %for.body ], [ %add.ptr1.i118, %for.end.i117 ]
    #dbg_value(ptr %out.addr.0.i111, !603, !DIExpression(), !860)
    #dbg_value(i32 %nblocks.addr.0.i110, !610, !DIExpression(), !860)
  %tobool.not.i112 = icmp eq i32 %nblocks.addr.0.i110, 0, !dbg !862
  br i1 %tobool.not.i112, label %keccak_squeezeblocks.exit136, label %while.body.i113, !dbg !862

while.body.i113:                                  ; preds = %while.cond.i109
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !863
    #dbg_value(i32 0, !616, !DIExpression(), !860)
  br label %for.cond.i114, !dbg !864

for.cond.i114:                                    ; preds = %store64.exit.i127, %while.body.i113
  %i.0.i115 = phi i32 [ 0, %while.body.i113 ], [ %inc.i128, %store64.exit.i127 ], !dbg !865
    #dbg_value(i32 %i.0.i115, !616, !DIExpression(), !860)
  %exitcond181 = icmp ne i32 %i.0.i115, 17, !dbg !866
  br i1 %exitcond181, label %for.body.i120, label %for.end.i117, !dbg !867

for.body.i120:                                    ; preds = %for.cond.i114
  %mul.i121 = shl nuw nsw i32 %i.0.i115, 3, !dbg !868
  %add.ptr.i122 = getelementptr inbounds nuw i8, ptr %out.addr.0.i111, i32 %mul.i121, !dbg !869
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %state.i, i32 %i.0.i115, !dbg !870
  %0 = load i64, ptr %arrayidx.i123, align 8, !dbg !870
    #dbg_value(ptr %add.ptr.i122, !626, !DIExpression(), !871)
    #dbg_value(i64 %0, !632, !DIExpression(), !871)
    #dbg_value(i32 0, !633, !DIExpression(), !871)
  br label %for.cond.i.i124, !dbg !873

for.cond.i.i124:                                  ; preds = %for.body.i.i129, %for.body.i120
  %i.0.i.i125 = phi i32 [ 0, %for.body.i120 ], [ %inc.i.i135, %for.body.i.i129 ], !dbg !874
    #dbg_value(i32 %i.0.i.i125, !633, !DIExpression(), !871)
  %exitcond = icmp ne i32 %i.0.i.i125, 8, !dbg !875
  br i1 %exitcond, label %for.body.i.i129, label %store64.exit.i127, !dbg !876

for.body.i.i129:                                  ; preds = %for.cond.i.i124
  %mul.i.i130 = shl nuw nsw i32 %i.0.i.i125, 3, !dbg !877
  %sh_prom.i.i131 = zext nneg i32 %mul.i.i130 to i64, !dbg !878
  %shr.i.i132 = lshr i64 %0, %sh_prom.i.i131, !dbg !878
  %conv.i.i133 = trunc i64 %shr.i.i132 to i8, !dbg !879
  %arrayidx.i.i134 = getelementptr inbounds nuw i8, ptr %add.ptr.i122, i32 %i.0.i.i125, !dbg !880
  store i8 %conv.i.i133, ptr %arrayidx.i.i134, align 1, !dbg !881
  %inc.i.i135 = add nuw nsw i32 %i.0.i.i125, 1, !dbg !882
    #dbg_value(i32 %inc.i.i135, !633, !DIExpression(), !871)
  br label %for.cond.i.i124, !dbg !883, !llvm.loop !884

store64.exit.i127:                                ; preds = %for.cond.i.i124
  %inc.i128 = add nuw nsw i32 %i.0.i115, 1, !dbg !886
    #dbg_value(i32 %inc.i128, !616, !DIExpression(), !860)
  br label %for.cond.i114, !dbg !887, !llvm.loop !888

for.end.i117:                                     ; preds = %for.cond.i114
  %add.ptr1.i118 = getelementptr inbounds nuw i8, ptr %out.addr.0.i111, i32 136, !dbg !890
    #dbg_value(ptr %add.ptr1.i118, !603, !DIExpression(), !860)
  %sub.i119 = add nsw i32 %nblocks.addr.0.i110, -1, !dbg !891
    #dbg_value(i32 %sub.i119, !610, !DIExpression(), !860)
  br label %while.cond.i109, !dbg !862, !llvm.loop !892

keccak_squeezeblocks.exit136:                     ; preds = %while.cond.i109
    #dbg_value(i32 56, !842, !DIExpression(), !841)
  %add.ptr.i49 = getelementptr inbounds nuw i8, ptr %buf.i, i32 136, !dbg !894
    #dbg_value(ptr %add.ptr.i49, !840, !DIExpression(), !841)
    #dbg_value(ptr %add.ptr.i49, !895, !DIExpression(), !897)
    #dbg_value(i32 56, !899, !DIExpression(), !897)
    #dbg_value(ptr %state.i, !900, !DIExpression(), !897)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !901
  %1 = load i32, ptr %pos.i1.i, align 8, !dbg !901
    #dbg_value(ptr %add.ptr.i49, !902, !DIExpression(), !906)
    #dbg_value(i32 56, !908, !DIExpression(), !906)
    #dbg_value(ptr %state.i, !909, !DIExpression(), !906)
    #dbg_value(i32 %1, !910, !DIExpression(), !906)
    #dbg_value(i32 136, !911, !DIExpression(), !906)
  br label %while.cond.i151, !dbg !912

while.cond.i151:                                  ; preds = %for.end.i166, %keccak_squeezeblocks.exit136
  %pos.addr.0.i152 = phi i32 [ %1, %keccak_squeezeblocks.exit136 ], [ %i.0.i161.lcssa, %for.end.i166 ]
  %outlen.addr.0.i153 = phi i32 [ 56, %keccak_squeezeblocks.exit136 ], [ %sub3.i168, %for.end.i166 ]
  %out.addr.0.i154 = phi ptr [ %add.ptr.i49, %keccak_squeezeblocks.exit136 ], [ %out.addr.1.i162.lcssa, %for.end.i166 ]
    #dbg_value(ptr %out.addr.0.i154, !902, !DIExpression(), !906)
    #dbg_value(i32 %outlen.addr.0.i153, !908, !DIExpression(), !906)
    #dbg_value(i32 %pos.addr.0.i152, !910, !DIExpression(), !906)
  %tobool.not.i155 = icmp eq i32 %outlen.addr.0.i153, 0, !dbg !912
  br i1 %tobool.not.i155, label %keccak_squeeze.exit180, label %while.body.i156, !dbg !912

while.body.i156:                                  ; preds = %while.cond.i151
  %cmp.i157 = icmp eq i32 %pos.addr.0.i152, 136, !dbg !913
  br i1 %cmp.i157, label %if.then.i179, label %if.end.i158, !dbg !913

if.then.i179:                                     ; preds = %while.body.i156
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !916
    #dbg_value(i32 0, !910, !DIExpression(), !906)
  br label %if.end.i158, !dbg !918

if.end.i158:                                      ; preds = %if.then.i179, %while.body.i156
  %pos.addr.1.i159 = phi i32 [ 0, %if.then.i179 ], [ %pos.addr.0.i152, %while.body.i156 ]
    #dbg_value(i32 %pos.addr.1.i159, !910, !DIExpression(), !906)
    #dbg_value(i32 %pos.addr.1.i159, !919, !DIExpression(), !906)
  br label %for.cond.i160, !dbg !920

for.cond.i160:                                    ; preds = %for.body.i169, %if.end.i158
  %i.0.i161 = phi i32 [ %pos.addr.1.i159, %if.end.i158 ], [ %inc.i178, %for.body.i169 ], !dbg !922
  %out.addr.1.i162 = phi ptr [ %out.addr.0.i154, %if.end.i158 ], [ %incdec.ptr.i177, %for.body.i169 ]
    #dbg_value(ptr %out.addr.1.i162, !902, !DIExpression(), !906)
    #dbg_value(i32 %i.0.i161, !919, !DIExpression(), !906)
  %cmp1.i163 = icmp ult i32 %i.0.i161, 136, !dbg !923
  %add.i164 = add i32 %pos.addr.1.i159, %outlen.addr.0.i153, !dbg !925
  %cmp2.i165 = icmp ult i32 %i.0.i161, %add.i164, !dbg !925
  %2 = select i1 %cmp1.i163, i1 %cmp2.i165, i1 false, !dbg !925
  br i1 %2, label %for.body.i169, label %for.end.i166, !dbg !926

for.body.i169:                                    ; preds = %for.cond.i160
  %div1.i170 = lshr i32 %i.0.i161, 3, !dbg !927
  %arrayidx.i171 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i170, !dbg !928
  %3 = load i64, ptr %arrayidx.i171, align 8, !dbg !928
  %rem.i172 = shl nuw nsw i32 %i.0.i161, 3, !dbg !929
  %mul.i173 = and i32 %rem.i172, 56, !dbg !929
  %sh_prom.i174 = zext nneg i32 %mul.i173 to i64, !dbg !930
  %shr.i175 = lshr i64 %3, %sh_prom.i174, !dbg !930
  %conv.i176 = trunc i64 %shr.i175 to i8, !dbg !928
    #dbg_value(ptr %out.addr.1.i162, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !906)
  store i8 %conv.i176, ptr %out.addr.1.i162, align 1, !dbg !931
  %incdec.ptr.i177 = getelementptr inbounds nuw i8, ptr %out.addr.1.i162, i32 1, !dbg !932
    #dbg_value(ptr %incdec.ptr.i177, !902, !DIExpression(), !906)
  %inc.i178 = add nuw nsw i32 %i.0.i161, 1, !dbg !933
    #dbg_value(i32 %inc.i178, !919, !DIExpression(), !906)
  br label %for.cond.i160, !dbg !934, !llvm.loop !935

for.end.i166:                                     ; preds = %for.cond.i160
  %i.0.i161.lcssa = phi i32 [ %i.0.i161, %for.cond.i160 ], !dbg !922
  %out.addr.1.i162.lcssa = phi ptr [ %out.addr.1.i162, %for.cond.i160 ]
  %sub.neg.i167 = sub i32 %pos.addr.1.i159, %i.0.i161.lcssa, !dbg !937
  %sub3.i168 = add i32 %sub.neg.i167, %outlen.addr.0.i153, !dbg !938
    #dbg_value(i32 %sub3.i168, !908, !DIExpression(), !906)
    #dbg_value(i32 %i.0.i161.lcssa, !910, !DIExpression(), !906)
  br label %while.cond.i151, !dbg !912, !llvm.loop !939

keccak_squeeze.exit180:                           ; preds = %while.cond.i151
  %pos.addr.0.i152.lcssa = phi i32 [ %pos.addr.0.i152, %while.cond.i151 ]
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !941
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !942
  store i32 %pos.addr.0.i152.lcssa, ptr %pos1.i.i, align 8, !dbg !943
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !944
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i3), !dbg !945
    #dbg_value(ptr %arrayidx6, !946, !DIExpression(), !956)
    #dbg_value(ptr %buf.i, !958, !DIExpression(), !956)
  call fastcc void @cbd3(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %buf.i) #4, !dbg !959
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i), !dbg !960
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !961
    #dbg_value(i8 %inc, !772, !DIExpression(), !764)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !962
    #dbg_value(i32 %inc7, !787, !DIExpression(), !764)
  br label %for.cond, !dbg !963, !llvm.loop !964

for.cond8:                                        ; preds = %for.cond8.preheader, %keccak_squeeze.exit
  %i.1 = phi i32 [ %inc15, %keccak_squeeze.exit ], [ 0, %for.cond8.preheader ], !dbg !966
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit ], [ 2, %for.cond8.preheader ], !dbg !764
    #dbg_value(i8 %nonce.1, !772, !DIExpression(), !764)
    #dbg_value(i32 %i.1, !787, !DIExpression(), !764)
  %exitcond185 = icmp ne i32 %i.1, 2, !dbg !967
  br i1 %exitcond185, label %for.body10, label %for.cond.i7.preheader, !dbg !794

for.cond.i7.preheader:                            ; preds = %for.cond8
  br label %for.cond.i7, !dbg !969

for.body10:                                       ; preds = %for.cond8
    #dbg_value(i8 %nonce.1, !772, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !764)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i1), !dbg !986
    #dbg_value(ptr %arrayidx12, !807, !DIExpression(), !988)
    #dbg_value(ptr %add.ptr, !809, !DIExpression(), !988)
    #dbg_value(i8 %nonce.1, !810, !DIExpression(), !988)
    #dbg_declare(ptr %buf.i1, !811, !DIExpression(), !989)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !990
    #dbg_value(ptr %buf.i1, !821, !DIExpression(), !992)
    #dbg_value(i32 192, !823, !DIExpression(), !992)
    #dbg_value(ptr %add.ptr, !824, !DIExpression(), !992)
    #dbg_value(i8 %nonce.1, !825, !DIExpression(), !992)
    #dbg_declare(ptr %extkey.i, !826, !DIExpression(), !993)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !990
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !994
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !995
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i50), !dbg !996
    #dbg_value(ptr %buf.i1, !840, !DIExpression(), !999)
    #dbg_value(i32 192, !842, !DIExpression(), !999)
    #dbg_value(ptr %extkey.i, !843, !DIExpression(), !999)
    #dbg_value(i32 33, !844, !DIExpression(), !999)
    #dbg_declare(ptr %state.i50, !845, !DIExpression(), !1000)
    #dbg_value(ptr %state.i50, !847, !DIExpression(), !1001)
    #dbg_value(ptr %extkey.i, !849, !DIExpression(), !1001)
    #dbg_value(i32 33, !850, !DIExpression(), !1001)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i50, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !996
  %pos.i.i51 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !1002
  store i32 136, ptr %pos.i.i51, align 8, !dbg !1003
    #dbg_value(i32 1, !853, !DIExpression(), !999)
    #dbg_value(ptr %buf.i1, !854, !DIExpression(), !1004)
    #dbg_value(i32 1, !858, !DIExpression(), !1004)
    #dbg_value(ptr %state.i50, !859, !DIExpression(), !1004)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !1006)
    #dbg_value(i32 1, !610, !DIExpression(), !1006)
    #dbg_value(ptr %state.i50, !611, !DIExpression(), !1006)
    #dbg_value(i32 136, !612, !DIExpression(), !1006)
  br label %while.cond.i, !dbg !1008

while.cond.i:                                     ; preds = %for.end.i, %for.body10
  %nblocks.addr.0.i = phi i32 [ 1, %for.body10 ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf.i1, %for.body10 ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !1006)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !1006)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !1008
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !1008

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !1009
    #dbg_value(i32 0, !616, !DIExpression(), !1006)
  br label %for.cond.i98, !dbg !1010

for.cond.i98:                                     ; preds = %store64.exit.i, %while.body.i
  %i.0.i99 = phi i32 [ 0, %while.body.i ], [ %inc.i105, %store64.exit.i ], !dbg !1011
    #dbg_value(i32 %i.0.i99, !616, !DIExpression(), !1006)
  %exitcond184 = icmp ne i32 %i.0.i99, 17, !dbg !1012
  br i1 %exitcond184, label %for.body.i101, label %for.end.i, !dbg !1013

for.body.i101:                                    ; preds = %for.cond.i98
  %mul.i102 = shl nuw nsw i32 %i.0.i99, 3, !dbg !1014
  %add.ptr.i103 = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i102, !dbg !1015
  %arrayidx.i104 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %i.0.i99, !dbg !1016
  %4 = load i64, ptr %arrayidx.i104, align 8, !dbg !1016
    #dbg_value(ptr %add.ptr.i103, !626, !DIExpression(), !1017)
    #dbg_value(i64 %4, !632, !DIExpression(), !1017)
    #dbg_value(i32 0, !633, !DIExpression(), !1017)
  br label %for.cond.i.i, !dbg !1019

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i101
  %i.0.i.i = phi i32 [ 0, %for.body.i101 ], [ %inc.i.i, %for.body.i.i ], !dbg !1020
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !1017)
  %exitcond183 = icmp ne i32 %i.0.i.i, 8, !dbg !1021
  br i1 %exitcond183, label %for.body.i.i, label %store64.exit.i, !dbg !1022

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i106 = shl nuw nsw i32 %i.0.i.i, 3, !dbg !1023
  %sh_prom.i.i = zext nneg i32 %mul.i.i106 to i64, !dbg !1024
  %shr.i.i107 = lshr i64 %4, %sh_prom.i.i, !dbg !1024
  %conv.i.i108 = trunc i64 %shr.i.i107 to i8, !dbg !1025
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i103, i32 %i.0.i.i, !dbg !1026
  store i8 %conv.i.i108, ptr %arrayidx.i.i, align 1, !dbg !1027
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !1028
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !1017)
  br label %for.cond.i.i, !dbg !1029, !llvm.loop !1030

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i105 = add nuw nsw i32 %i.0.i99, 1, !dbg !1032
    #dbg_value(i32 %inc.i105, !616, !DIExpression(), !1006)
  br label %for.cond.i98, !dbg !1033, !llvm.loop !1034

for.end.i:                                        ; preds = %for.cond.i98
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !1036
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !1006)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !1037
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !1006)
  br label %while.cond.i, !dbg !1008, !llvm.loop !1038

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 56, !842, !DIExpression(), !999)
  %add.ptr.i52 = getelementptr inbounds nuw i8, ptr %buf.i1, i32 136, !dbg !1040
    #dbg_value(ptr %add.ptr.i52, !840, !DIExpression(), !999)
    #dbg_value(ptr %add.ptr.i52, !895, !DIExpression(), !1041)
    #dbg_value(i32 56, !899, !DIExpression(), !1041)
    #dbg_value(ptr %state.i50, !900, !DIExpression(), !1041)
  %pos.i1.i53 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !1043
  %5 = load i32, ptr %pos.i1.i53, align 8, !dbg !1043
    #dbg_value(ptr %add.ptr.i52, !902, !DIExpression(), !1044)
    #dbg_value(i32 56, !908, !DIExpression(), !1044)
    #dbg_value(ptr %state.i50, !909, !DIExpression(), !1044)
    #dbg_value(i32 %5, !910, !DIExpression(), !1044)
    #dbg_value(i32 136, !911, !DIExpression(), !1044)
  br label %while.cond.i137, !dbg !1046

while.cond.i137:                                  ; preds = %for.end.i145, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %5, %keccak_squeezeblocks.exit ], [ %i.0.i143.lcssa, %for.end.i145 ]
  %outlen.addr.0.i = phi i32 [ 56, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i145 ]
  %out.addr.0.i138 = phi ptr [ %add.ptr.i52, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i145 ]
    #dbg_value(ptr %out.addr.0.i138, !902, !DIExpression(), !1044)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !1044)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !1044)
  %tobool.not.i139 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1046
  br i1 %tobool.not.i139, label %keccak_squeeze.exit, label %while.body.i140, !dbg !1046

while.body.i140:                                  ; preds = %while.cond.i137
  %cmp.i141 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1047
  br i1 %cmp.i141, label %if.then.i, label %if.end.i, !dbg !1047

if.then.i:                                        ; preds = %while.body.i140
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !1048
    #dbg_value(i32 0, !910, !DIExpression(), !1044)
  br label %if.end.i, !dbg !1049

if.end.i:                                         ; preds = %if.then.i, %while.body.i140
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i140 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !1044)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !1044)
  br label %for.cond.i142, !dbg !1050

for.cond.i142:                                    ; preds = %for.body.i146, %if.end.i
  %i.0.i143 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i150, %for.body.i146 ], !dbg !1051
  %out.addr.1.i = phi ptr [ %out.addr.0.i138, %if.end.i ], [ %incdec.ptr.i, %for.body.i146 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !1044)
    #dbg_value(i32 %i.0.i143, !919, !DIExpression(), !1044)
  %cmp1.i = icmp ult i32 %i.0.i143, 136, !dbg !1052
  %add.i144 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1053
  %cmp2.i = icmp ult i32 %i.0.i143, %add.i144, !dbg !1053
  %6 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !1053
  br i1 %6, label %for.body.i146, label %for.end.i145, !dbg !1054

for.body.i146:                                    ; preds = %for.cond.i142
  %div1.i = lshr i32 %i.0.i143, 3, !dbg !1055
  %arrayidx.i147 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %div1.i, !dbg !1056
  %7 = load i64, ptr %arrayidx.i147, align 8, !dbg !1056
  %rem.i = shl nuw nsw i32 %i.0.i143, 3, !dbg !1057
  %mul.i148 = and i32 %rem.i, 56, !dbg !1057
  %sh_prom.i = zext nneg i32 %mul.i148 to i64, !dbg !1058
  %shr.i = lshr i64 %7, %sh_prom.i, !dbg !1058
  %conv.i149 = trunc i64 %shr.i to i8, !dbg !1056
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1044)
  store i8 %conv.i149, ptr %out.addr.1.i, align 1, !dbg !1059
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1060
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !1044)
  %inc.i150 = add nuw nsw i32 %i.0.i143, 1, !dbg !1061
    #dbg_value(i32 %inc.i150, !919, !DIExpression(), !1044)
  br label %for.cond.i142, !dbg !1062, !llvm.loop !1063

for.end.i145:                                     ; preds = %for.cond.i142
  %i.0.i143.lcssa = phi i32 [ %i.0.i143, %for.cond.i142 ], !dbg !1051
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i142 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i143.lcssa, !dbg !1065
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1066
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !1044)
    #dbg_value(i32 %i.0.i143.lcssa, !910, !DIExpression(), !1044)
  br label %while.cond.i137, !dbg !1046, !llvm.loop !1067

keccak_squeeze.exit:                              ; preds = %while.cond.i137
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i137 ]
  %arrayidx12 = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !1069
  %pos1.i.i55 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !1070
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i55, align 8, !dbg !1071
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i50), !dbg !1072
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1073
    #dbg_value(ptr %arrayidx12, !946, !DIExpression(), !1074)
    #dbg_value(ptr %buf.i1, !958, !DIExpression(), !1074)
  call fastcc void @cbd3(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %buf.i1) #4, !dbg !1076
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i1), !dbg !1077
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !1078
    #dbg_value(i8 %inc13, !772, !DIExpression(), !764)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !1079
    #dbg_value(i32 %inc15, !787, !DIExpression(), !764)
  br label %for.cond8, !dbg !1080, !llvm.loop !1081

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit88
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber512_ref_poly_reduce.exit88 ], [ 0, %for.cond.i7.preheader ], !dbg !1083
    #dbg_value(i32 %i.0.i8, !1084, !DIExpression(), !1085)
  %exitcond187 = icmp ne i32 %i.0.i8, 2, !dbg !1086
  br i1 %exitcond187, label %for.body.i10, label %for.cond.i13.preheader, !dbg !969

for.cond.i13.preheader:                           ; preds = %for.cond.i7
  br label %for.cond.i13, !dbg !1088

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i8, !dbg !1090
    #dbg_value(ptr %arrayidx.i11, !1091, !DIExpression(), !1095)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !1097
    #dbg_value(ptr %arrayidx.i11, !1098, !DIExpression(), !1100)
    #dbg_value(i32 0, !1102, !DIExpression(), !1100)
  br label %for.cond.i76, !dbg !1103

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i10
  %i.0.i77 = phi i32 [ 0, %for.body.i10 ], [ %inc.i87, %for.body.i79 ], !dbg !1105
    #dbg_value(i32 %i.0.i77, !1102, !DIExpression(), !1100)
  %exitcond186 = icmp ne i32 %i.0.i77, 256, !dbg !1106
  br i1 %exitcond186, label %for.body.i79, label %pqcrystals_kyber512_ref_poly_reduce.exit88, !dbg !1108

for.body.i79:                                     ; preds = %for.cond.i76
  %arrayidx.i80 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i77, !dbg !1109
  %8 = load i16, ptr %arrayidx.i80, align 2, !dbg !1109
    #dbg_value(i16 %8, !1110, !DIExpression(), !1115)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1115)
  %conv.i.i81 = sext i16 %8 to i32, !dbg !1118
  %mul.i.i82 = mul nsw i32 %conv.i.i81, 20159, !dbg !1119
  %add.i.i83 = add nsw i32 %mul.i.i82, 33554432, !dbg !1120
  %shr.i.i84 = ashr i32 %add.i.i83, 26, !dbg !1121
    #dbg_value(i32 %shr.i.i84, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1115)
    #dbg_value(i32 %shr.i.i84, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1115)
  %9 = trunc nsw i32 %shr.i.i84 to i16, !dbg !1123
  %10 = mul i16 %9, -3329, !dbg !1123
  %conv7.i.i85 = add i16 %10, %8, !dbg !1123
  %arrayidx2.i86 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i77, !dbg !1124
  store i16 %conv7.i.i85, ptr %arrayidx2.i86, align 2, !dbg !1125
  %inc.i87 = add nuw nsw i32 %i.0.i77, 1, !dbg !1126
    #dbg_value(i32 %inc.i87, !1102, !DIExpression(), !1100)
  br label %for.cond.i76, !dbg !1127, !llvm.loop !1128

pqcrystals_kyber512_ref_poly_reduce.exit88:       ; preds = %for.cond.i76
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !1130
    #dbg_value(i32 %inc.i12, !1084, !DIExpression(), !1085)
  br label %for.cond.i7, !dbg !1131, !llvm.loop !1132

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber512_ref_poly_reduce.exit ], [ 0, %for.cond.i13.preheader ], !dbg !1134
    #dbg_value(i32 %i.0.i14, !1084, !DIExpression(), !1135)
  %exitcond189 = icmp ne i32 %i.0.i14, 2, !dbg !1136
  br i1 %exitcond189, label %for.body.i16, label %for.cond17.preheader, !dbg !1088

for.cond17.preheader:                             ; preds = %for.cond.i13
  br label %for.cond17, !dbg !1137

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.0.i14, !dbg !1139
    #dbg_value(ptr %arrayidx.i17, !1091, !DIExpression(), !1140)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !1142
    #dbg_value(ptr %arrayidx.i17, !1098, !DIExpression(), !1143)
    #dbg_value(i32 0, !1102, !DIExpression(), !1143)
  br label %for.cond.i56, !dbg !1145

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i16
  %i.0.i57 = phi i32 [ 0, %for.body.i16 ], [ %inc.i62, %for.body.i59 ], !dbg !1146
    #dbg_value(i32 %i.0.i57, !1102, !DIExpression(), !1143)
  %exitcond188 = icmp ne i32 %i.0.i57, 256, !dbg !1147
  br i1 %exitcond188, label %for.body.i59, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !1148

for.body.i59:                                     ; preds = %for.cond.i56
  %arrayidx.i60 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i57, !dbg !1149
  %11 = load i16, ptr %arrayidx.i60, align 2, !dbg !1149
    #dbg_value(i16 %11, !1110, !DIExpression(), !1150)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1150)
  %conv.i.i = sext i16 %11 to i32, !dbg !1152
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1153
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1154
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1155
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1150)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1150)
  %12 = trunc nsw i32 %shr.i.i to i16, !dbg !1156
  %13 = mul i16 %12, -3329, !dbg !1156
  %conv7.i.i = add i16 %13, %11, !dbg !1156
  %arrayidx2.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i57, !dbg !1157
  store i16 %conv7.i.i, ptr %arrayidx2.i61, align 2, !dbg !1158
  %inc.i62 = add nuw nsw i32 %i.0.i57, 1, !dbg !1159
    #dbg_value(i32 %inc.i62, !1102, !DIExpression(), !1143)
  br label %for.cond.i56, !dbg !1160, !llvm.loop !1161

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i56
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !1163
    #dbg_value(i32 %inc.i18, !1084, !DIExpression(), !1135)
  br label %for.cond.i13, !dbg !1164, !llvm.loop !1165

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber512_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber512_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !1167
    #dbg_value(i32 %i.2, !787, !DIExpression(), !764)
  %exitcond191 = icmp ne i32 %i.2, 2, !dbg !1168
  br i1 %exitcond191, label %for.body19, label %for.cond.i27.preheader, !dbg !1137

for.cond.i27.preheader:                           ; preds = %for.cond17
  br label %for.cond.i27, !dbg !1170

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1178
  %arrayidx22 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !1180
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !1181
  %arrayidx24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1182
    #dbg_value(ptr %arrayidx24, !1183, !DIExpression(), !1185)
    #dbg_value(i16 1353, !1187, !DIExpression(), !1185)
    #dbg_value(i32 0, !1188, !DIExpression(), !1185)
  br label %for.cond.i89, !dbg !1189

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !1191
    #dbg_value(i32 %i.0.i90, !1188, !DIExpression(), !1185)
  %exitcond190 = icmp ne i32 %i.0.i90, 256, !dbg !1192
  br i1 %exitcond190, label %for.body.i92, label %pqcrystals_kyber512_ref_poly_tomont.exit, !dbg !1194

for.body.i92:                                     ; preds = %for.cond.i89
  %arrayidx.i93 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1195
  %14 = load i16, ptr %arrayidx.i93, align 2, !dbg !1195
  %conv.i = sext i16 %14 to i32, !dbg !1196
  %mul.i94 = mul nsw i32 %conv.i, 1353, !dbg !1197
    #dbg_value(i32 %mul.i94, !1198, !DIExpression(), !1201)
    #dbg_value(i32 %mul.i94, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1201)
  %sext.i.i = mul i32 %conv.i, 1346961408, !dbg !1204
  %conv3.i.i = ashr exact i32 %sext.i.i, 16, !dbg !1204
  %mul4.neg.i.i = mul nsw i32 %conv3.i.i, -3329, !dbg !1205
  %sub.i.i = add nsw i32 %mul4.neg.i.i, %mul.i94, !dbg !1206
  %shr.i.i95 = lshr i32 %sub.i.i, 16, !dbg !1207
  %conv5.i.i = trunc nuw i32 %shr.i.i95 to i16, !dbg !1208
    #dbg_value(i16 %conv5.i.i, !1203, !DIExpression(), !1201)
  %arrayidx2.i96 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1209
  store i16 %conv5.i.i, ptr %arrayidx2.i96, align 2, !dbg !1210
  %inc.i97 = add nuw nsw i32 %i.0.i90, 1, !dbg !1211
    #dbg_value(i32 %inc.i97, !1188, !DIExpression(), !1185)
  br label %for.cond.i89, !dbg !1212, !llvm.loop !1213

pqcrystals_kyber512_ref_poly_tomont.exit:         ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !1215
    #dbg_value(i32 %inc26, !787, !DIExpression(), !764)
  br label %for.cond17, !dbg !1216, !llvm.loop !1217

for.cond.i27:                                     ; preds = %for.cond.i27.preheader, %pqcrystals_kyber512_ref_poly_add.exit
  %i.0.i28 = phi i32 [ %inc.i32, %pqcrystals_kyber512_ref_poly_add.exit ], [ 0, %for.cond.i27.preheader ], !dbg !1219
    #dbg_value(i32 %i.0.i28, !1220, !DIExpression(), !1221)
  %exitcond193 = icmp ne i32 %i.0.i28, 2, !dbg !1222
  br i1 %exitcond193, label %for.body.i30, label %for.cond.i.preheader, !dbg !1170

for.cond.i.preheader:                             ; preds = %for.cond.i27
  br label %for.cond.i, !dbg !1224

for.body.i30:                                     ; preds = %for.cond.i27
  %arrayidx.i31 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1228
  %arrayidx2.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1229
  %arrayidx4.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %e, i32 0, i32 %i.0.i28, !dbg !1230
    #dbg_value(ptr %arrayidx.i31, !1231, !DIExpression(), !1237)
    #dbg_value(ptr %arrayidx2.i, !1239, !DIExpression(), !1237)
    #dbg_value(ptr %arrayidx4.i, !1240, !DIExpression(), !1237)
    #dbg_value(i32 0, !1241, !DIExpression(), !1237)
  br label %for.cond.i42, !dbg !1242

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i30
  %i.0.i43 = phi i32 [ 0, %for.body.i30 ], [ %inc.i48, %for.body.i45 ], !dbg !1244
    #dbg_value(i32 %i.0.i43, !1241, !DIExpression(), !1237)
  %exitcond192 = icmp ne i32 %i.0.i43, 256, !dbg !1245
  br i1 %exitcond192, label %for.body.i45, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !1247

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i43, !dbg !1248
  %15 = load i16, ptr %arrayidx.i46, align 2, !dbg !1248
  %arrayidx2.i47 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i43, !dbg !1249
  %16 = load i16, ptr %arrayidx2.i47, align 2, !dbg !1249
  %add.i = add i16 %15, %16, !dbg !1250
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i31, i32 0, i32 %i.0.i43, !dbg !1251
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1252
  %inc.i48 = add nuw nsw i32 %i.0.i43, 1, !dbg !1253
    #dbg_value(i32 %inc.i48, !1241, !DIExpression(), !1237)
  br label %for.cond.i42, !dbg !1254, !llvm.loop !1255

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i42
  %inc.i32 = add nuw nsw i32 %i.0.i28, 1, !dbg !1257
    #dbg_value(i32 %inc.i32, !1220, !DIExpression(), !1221)
  br label %for.cond.i27, !dbg !1258, !llvm.loop !1259

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit75
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit75 ], [ 0, %for.cond.i.preheader ], !dbg !1261
    #dbg_value(i32 %i.0.i, !1262, !DIExpression(), !1263)
  %exitcond195 = icmp ne i32 %i.0.i, 2, !dbg !1264
  br i1 %exitcond195, label %for.body.i, label %for.cond.i33.preheader, !dbg !1224

for.cond.i33.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i33, !dbg !1266

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !1276
    #dbg_value(ptr %arrayidx.i6, !1098, !DIExpression(), !1277)
    #dbg_value(i32 0, !1102, !DIExpression(), !1277)
  br label %for.cond.i63, !dbg !1279

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i
  %i.0.i64 = phi i32 [ 0, %for.body.i ], [ %inc.i74, %for.body.i66 ], !dbg !1280
    #dbg_value(i32 %i.0.i64, !1102, !DIExpression(), !1277)
  %exitcond194 = icmp ne i32 %i.0.i64, 256, !dbg !1281
  br i1 %exitcond194, label %for.body.i66, label %pqcrystals_kyber512_ref_poly_reduce.exit75, !dbg !1282

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i64, !dbg !1283
  %17 = load i16, ptr %arrayidx.i67, align 2, !dbg !1283
    #dbg_value(i16 %17, !1110, !DIExpression(), !1284)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1284)
  %conv.i.i68 = sext i16 %17 to i32, !dbg !1286
  %mul.i.i69 = mul nsw i32 %conv.i.i68, 20159, !dbg !1287
  %add.i.i70 = add nsw i32 %mul.i.i69, 33554432, !dbg !1288
  %shr.i.i71 = ashr i32 %add.i.i70, 26, !dbg !1289
    #dbg_value(i32 %shr.i.i71, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1284)
    #dbg_value(i32 %shr.i.i71, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1284)
  %18 = trunc nsw i32 %shr.i.i71 to i16, !dbg !1290
  %19 = mul i16 %18, -3329, !dbg !1290
  %conv7.i.i72 = add i16 %19, %17, !dbg !1290
  %arrayidx2.i73 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i64, !dbg !1291
  store i16 %conv7.i.i72, ptr %arrayidx2.i73, align 2, !dbg !1292
  %inc.i74 = add nuw nsw i32 %i.0.i64, 1, !dbg !1293
    #dbg_value(i32 %inc.i74, !1102, !DIExpression(), !1277)
  br label %for.cond.i63, !dbg !1294, !llvm.loop !1295

pqcrystals_kyber512_ref_poly_reduce.exit75:       ; preds = %for.cond.i63
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1297
    #dbg_value(i32 %inc.i, !1262, !DIExpression(), !1263)
  br label %for.cond.i, !dbg !1298, !llvm.loop !1299

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !1301
    #dbg_value(i32 %i.0.i34, !1302, !DIExpression(), !1303)
  %exitcond196 = icmp ne i32 %i.0.i34, 2, !dbg !1304
  br i1 %exitcond196, label %for.body.i36, label %for.cond.i20.preheader, !dbg !1266

for.cond.i20.preheader:                           ; preds = %for.cond.i33
  br label %for.cond.i20, !dbg !1306

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1312
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i37, !dbg !1313
  %arrayidx.i39 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i34, !dbg !1314
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1315
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1316
    #dbg_value(i32 %inc.i40, !1302, !DIExpression(), !1303)
  br label %for.cond.i33, !dbg !1317, !llvm.loop !1318

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %for.body.i23
  %i.0.i21 = phi i32 [ %inc.i26, %for.body.i23 ], [ 0, %for.cond.i20.preheader ], !dbg !1320
    #dbg_value(i32 %i.0.i21, !1302, !DIExpression(), !1321)
  %exitcond197 = icmp ne i32 %i.0.i21, 2, !dbg !1322
  br i1 %exitcond197, label %for.body.i23, label %pqcrystals_kyber512_ref_polyvec_tobytes.exit, !dbg !1306

for.body.i23:                                     ; preds = %for.cond.i20
  %mul.i = mul nuw nsw i32 %i.0.i21, 384, !dbg !1323
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1324
  %arrayidx.i25 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i21, !dbg !1325
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr.i24, ptr noundef nonnull %arrayidx.i25) #4, !dbg !1326
  %inc.i26 = add nuw nsw i32 %i.0.i21, 1, !dbg !1327
    #dbg_value(i32 %inc.i26, !1302, !DIExpression(), !1321)
  br label %for.cond.i20, !dbg !1328, !llvm.loop !1329

pqcrystals_kyber512_ref_polyvec_tobytes.exit:     ; preds = %for.cond.i20
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 768, !dbg !1331
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1332
  ret void, !dbg !1333
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1334 {
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
    #dbg_value(ptr %c, !1337, !DIExpression(), !1338)
    #dbg_value(ptr %m, !1339, !DIExpression(), !1338)
    #dbg_value(ptr %pk, !1340, !DIExpression(), !1338)
    #dbg_value(ptr %coins, !1341, !DIExpression(), !1338)
    #dbg_declare(ptr %seed, !1342, !DIExpression(), !1343)
    #dbg_value(i8 0, !1344, !DIExpression(), !1338)
    #dbg_declare(ptr %sp, !1345, !DIExpression(), !1346)
    #dbg_declare(ptr %pkpv, !1347, !DIExpression(), !1348)
    #dbg_declare(ptr %ep, !1349, !DIExpression(), !1350)
    #dbg_declare(ptr %at, !1351, !DIExpression(), !1352)
    #dbg_declare(ptr %b, !1353, !DIExpression(), !1354)
    #dbg_declare(ptr %v, !1355, !DIExpression(), !1356)
    #dbg_declare(ptr %k, !1357, !DIExpression(), !1358)
    #dbg_declare(ptr %epp, !1359, !DIExpression(), !1360)
    #dbg_value(ptr %pkpv, !1361, !DIExpression(), !1365)
    #dbg_value(ptr %seed, !1367, !DIExpression(), !1365)
    #dbg_value(ptr %pk, !1368, !DIExpression(), !1365)
    #dbg_value(ptr %pkpv, !1369, !DIExpression(), !1373)
    #dbg_value(ptr %pk, !1375, !DIExpression(), !1373)
    #dbg_value(i32 0, !1376, !DIExpression(), !1373)
  br label %for.cond.i30, !dbg !1377

for.cond.i30:                                     ; preds = %for.body.i33, %entry
  %i.0.i31 = phi i32 [ 0, %entry ], [ %inc.i36, %for.body.i33 ], !dbg !1379
    #dbg_value(i32 %i.0.i31, !1376, !DIExpression(), !1373)
  %exitcond = icmp ne i32 %i.0.i31, 2, !dbg !1380
  br i1 %exitcond, label %for.body.i33, label %pqcrystals_kyber512_ref_polyvec_frombytes.exit, !dbg !1382

for.body.i33:                                     ; preds = %for.cond.i30
  %arrayidx.i34 = getelementptr inbounds nuw [2 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i31, !dbg !1383
  %mul.i = mul nuw nsw i32 %i.0.i31, 384, !dbg !1384
  %add.ptr.i35 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1385
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i34, ptr noundef %add.ptr.i35) #4, !dbg !1386
  %inc.i36 = add nuw nsw i32 %i.0.i31, 1, !dbg !1387
    #dbg_value(i32 %inc.i36, !1376, !DIExpression(), !1373)
  br label %for.cond.i30, !dbg !1388, !llvm.loop !1389

pqcrystals_kyber512_ref_polyvec_frombytes.exit:   ; preds = %for.cond.i30
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 768, !dbg !1391
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i, i32 noundef 32) #5, !dbg !1392
    #dbg_value(ptr %k, !1393, !DIExpression(), !1397)
    #dbg_value(ptr %m, !1399, !DIExpression(), !1397)
    #dbg_value(i32 0, !1400, !DIExpression(), !1397)
  br label %for.cond.i110, !dbg !1401

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber512_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1403
    #dbg_value(i32 %i.0.i111, !1400, !DIExpression(), !1397)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1404
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber512_ref_poly_frommsg.exit, !dbg !1406

for.cond1.i.preheader:                            ; preds = %for.cond.i110
  br label %for.cond1.i, !dbg !1407

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ %inc.i117, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1410
    #dbg_value(i32 %j.0.i, !1411, !DIExpression(), !1397)
  %exitcond262 = icmp ne i32 %j.0.i, 8, !dbg !1412
  br i1 %exitcond262, label %for.body3.i, label %for.inc9.i, !dbg !1407

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i113 = shl nuw nsw i32 %i.0.i111, 3, !dbg !1414
  %add.i114 = or disjoint i32 %mul.i113, %j.0.i, !dbg !1416
  %arrayidx.i115 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %add.i114, !dbg !1417
  store i16 0, ptr %arrayidx.i115, align 2, !dbg !1418
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i111, 4, !dbg !1419
  %add.ptr.i116 = getelementptr inbounds nuw i8, ptr %k, i32 %add.ptr.idx.i, !dbg !1419
  %add.ptr6.i = getelementptr inbounds nuw i16, ptr %add.ptr.i116, i32 %j.0.i, !dbg !1420
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i111, !dbg !1421
  %0 = load i8, ptr %arrayidx7.i, align 1, !dbg !1421
  %conv.i = zext i8 %0 to i32, !dbg !1421
    #dbg_value(ptr %add.ptr6.i, !1422, !DIExpression(), !1426)
    #dbg_value(i16 1665, !1428, !DIExpression(), !1426)
    #dbg_value(!DIArgList(i32 %conv.i, i32 %j.0.i), !1429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !1426)
    #dbg_value(!DIArgList(i16 0, i32 %conv.i, i32 %j.0.i), !1429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !1426)
  %1 = load i16, ptr %add.ptr6.i, align 2, !dbg !1430
  %2 = shl nuw nsw i32 1, %j.0.i, !dbg !1431
  %3 = and i32 %2, %conv.i, !dbg !1431
  %4 = icmp eq i32 %3, 0, !dbg !1431
  %xor6.i.i = select i1 %4, i16 %1, i16 1665, !dbg !1432
  store i16 %xor6.i.i, ptr %add.ptr6.i, align 2, !dbg !1432
  %inc.i117 = add nuw nsw i32 %j.0.i, 1, !dbg !1433
    #dbg_value(i32 %inc.i117, !1411, !DIExpression(), !1397)
  br label %for.cond1.i, !dbg !1434, !llvm.loop !1435

for.inc9.i:                                       ; preds = %for.cond1.i
  %inc10.i = add nuw nsw i32 %i.0.i111, 1, !dbg !1437
    #dbg_value(i32 %inc10.i, !1400, !DIExpression(), !1397)
  br label %for.cond.i110, !dbg !1438, !llvm.loop !1439

pqcrystals_kyber512_ref_poly_frommsg.exit:        ; preds = %for.cond.i110
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1441
    #dbg_value(i32 0, !1442, !DIExpression(), !1338)
  br label %for.cond, !dbg !1443

for.cond:                                         ; preds = %keccak_squeeze.exit, %pqcrystals_kyber512_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber512_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit ], !dbg !1445
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber512_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit ], !dbg !1338
    #dbg_value(i8 %nonce.0, !1344, !DIExpression(), !1338)
    #dbg_value(i32 %i.0, !1442, !DIExpression(), !1338)
  %exitcond266 = icmp ne i32 %i.0, 2, !dbg !1446
  br i1 %exitcond266, label %for.body, label %for.cond5.preheader, !dbg !1448

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !1449

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !1344, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1338)
  call void @llvm.lifetime.start.p0(i64 192, ptr nonnull %buf.i1), !dbg !1451
    #dbg_value(ptr %add.ptr, !807, !DIExpression(), !1453)
    #dbg_value(ptr %coins, !809, !DIExpression(), !1453)
    #dbg_value(i8 %nonce.0, !810, !DIExpression(), !1453)
    #dbg_declare(ptr %buf.i1, !811, !DIExpression(), !1454)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1455
    #dbg_value(ptr %buf.i1, !821, !DIExpression(), !1457)
    #dbg_value(i32 192, !823, !DIExpression(), !1457)
    #dbg_value(ptr %coins, !824, !DIExpression(), !1457)
    #dbg_value(i8 %nonce.0, !825, !DIExpression(), !1457)
    #dbg_declare(ptr %extkey.i8, !826, !DIExpression(), !1458)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1455
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1459
  store i8 %nonce.0, ptr %arrayidx.i10, align 1, !dbg !1460
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i65), !dbg !1461
    #dbg_value(ptr %buf.i1, !840, !DIExpression(), !1464)
    #dbg_value(i32 192, !842, !DIExpression(), !1464)
    #dbg_value(ptr %extkey.i8, !843, !DIExpression(), !1464)
    #dbg_value(i32 33, !844, !DIExpression(), !1464)
    #dbg_declare(ptr %state.i65, !845, !DIExpression(), !1465)
    #dbg_value(ptr %state.i65, !847, !DIExpression(), !1466)
    #dbg_value(ptr %extkey.i8, !849, !DIExpression(), !1466)
    #dbg_value(i32 33, !850, !DIExpression(), !1466)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i65, i32 noundef 136, ptr noundef nonnull %extkey.i8, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1461
  %pos.i.i66 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1467
  store i32 136, ptr %pos.i.i66, align 8, !dbg !1468
    #dbg_value(i32 1, !853, !DIExpression(), !1464)
    #dbg_value(ptr %buf.i1, !854, !DIExpression(), !1469)
    #dbg_value(i32 1, !858, !DIExpression(), !1469)
    #dbg_value(ptr %state.i65, !859, !DIExpression(), !1469)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !1471)
    #dbg_value(i32 1, !610, !DIExpression(), !1471)
    #dbg_value(ptr %state.i65, !611, !DIExpression(), !1471)
    #dbg_value(i32 136, !612, !DIExpression(), !1471)
  br label %while.cond.i129, !dbg !1473

while.cond.i129:                                  ; preds = %for.end.i137, %for.body
  %nblocks.addr.0.i130 = phi i32 [ 1, %for.body ], [ %sub.i139, %for.end.i137 ]
  %out.addr.0.i131 = phi ptr [ %buf.i1, %for.body ], [ %add.ptr1.i138, %for.end.i137 ]
    #dbg_value(ptr %out.addr.0.i131, !603, !DIExpression(), !1471)
    #dbg_value(i32 %nblocks.addr.0.i130, !610, !DIExpression(), !1471)
  %tobool.not.i132 = icmp eq i32 %nblocks.addr.0.i130, 0, !dbg !1473
  br i1 %tobool.not.i132, label %keccak_squeezeblocks.exit156, label %while.body.i133, !dbg !1473

while.body.i133:                                  ; preds = %while.cond.i129
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1474
    #dbg_value(i32 0, !616, !DIExpression(), !1471)
  br label %for.cond.i134, !dbg !1475

for.cond.i134:                                    ; preds = %store64.exit.i147, %while.body.i133
  %i.0.i135 = phi i32 [ 0, %while.body.i133 ], [ %inc.i148, %store64.exit.i147 ], !dbg !1476
    #dbg_value(i32 %i.0.i135, !616, !DIExpression(), !1471)
  %exitcond265 = icmp ne i32 %i.0.i135, 17, !dbg !1477
  br i1 %exitcond265, label %for.body.i140, label %for.end.i137, !dbg !1478

for.body.i140:                                    ; preds = %for.cond.i134
  %mul.i141 = shl nuw nsw i32 %i.0.i135, 3, !dbg !1479
  %add.ptr.i142 = getelementptr inbounds nuw i8, ptr %out.addr.0.i131, i32 %mul.i141, !dbg !1480
  %arrayidx.i143 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %i.0.i135, !dbg !1481
  %5 = load i64, ptr %arrayidx.i143, align 8, !dbg !1481
    #dbg_value(ptr %add.ptr.i142, !626, !DIExpression(), !1482)
    #dbg_value(i64 %5, !632, !DIExpression(), !1482)
    #dbg_value(i32 0, !633, !DIExpression(), !1482)
  br label %for.cond.i.i144, !dbg !1484

for.cond.i.i144:                                  ; preds = %for.body.i.i149, %for.body.i140
  %i.0.i.i145 = phi i32 [ 0, %for.body.i140 ], [ %inc.i.i155, %for.body.i.i149 ], !dbg !1485
    #dbg_value(i32 %i.0.i.i145, !633, !DIExpression(), !1482)
  %exitcond264 = icmp ne i32 %i.0.i.i145, 8, !dbg !1486
  br i1 %exitcond264, label %for.body.i.i149, label %store64.exit.i147, !dbg !1487

for.body.i.i149:                                  ; preds = %for.cond.i.i144
  %mul.i.i150 = shl nuw nsw i32 %i.0.i.i145, 3, !dbg !1488
  %sh_prom.i.i151 = zext nneg i32 %mul.i.i150 to i64, !dbg !1489
  %shr.i.i152 = lshr i64 %5, %sh_prom.i.i151, !dbg !1489
  %conv.i.i153 = trunc i64 %shr.i.i152 to i8, !dbg !1490
  %arrayidx.i.i154 = getelementptr inbounds nuw i8, ptr %add.ptr.i142, i32 %i.0.i.i145, !dbg !1491
  store i8 %conv.i.i153, ptr %arrayidx.i.i154, align 1, !dbg !1492
  %inc.i.i155 = add nuw nsw i32 %i.0.i.i145, 1, !dbg !1493
    #dbg_value(i32 %inc.i.i155, !633, !DIExpression(), !1482)
  br label %for.cond.i.i144, !dbg !1494, !llvm.loop !1495

store64.exit.i147:                                ; preds = %for.cond.i.i144
  %inc.i148 = add nuw nsw i32 %i.0.i135, 1, !dbg !1497
    #dbg_value(i32 %inc.i148, !616, !DIExpression(), !1471)
  br label %for.cond.i134, !dbg !1498, !llvm.loop !1499

for.end.i137:                                     ; preds = %for.cond.i134
  %add.ptr1.i138 = getelementptr inbounds nuw i8, ptr %out.addr.0.i131, i32 136, !dbg !1501
    #dbg_value(ptr %add.ptr1.i138, !603, !DIExpression(), !1471)
  %sub.i139 = add nsw i32 %nblocks.addr.0.i130, -1, !dbg !1502
    #dbg_value(i32 %sub.i139, !610, !DIExpression(), !1471)
  br label %while.cond.i129, !dbg !1473, !llvm.loop !1503

keccak_squeezeblocks.exit156:                     ; preds = %while.cond.i129
    #dbg_value(i32 56, !842, !DIExpression(), !1464)
  %add.ptr.i67 = getelementptr inbounds nuw i8, ptr %buf.i1, i32 136, !dbg !1505
    #dbg_value(ptr %add.ptr.i67, !840, !DIExpression(), !1464)
    #dbg_value(ptr %add.ptr.i67, !895, !DIExpression(), !1506)
    #dbg_value(i32 56, !899, !DIExpression(), !1506)
    #dbg_value(ptr %state.i65, !900, !DIExpression(), !1506)
  %pos.i1.i68 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1508
  %6 = load i32, ptr %pos.i1.i68, align 8, !dbg !1508
    #dbg_value(ptr %add.ptr.i67, !902, !DIExpression(), !1509)
    #dbg_value(i32 56, !908, !DIExpression(), !1509)
    #dbg_value(ptr %state.i65, !909, !DIExpression(), !1509)
    #dbg_value(i32 %6, !910, !DIExpression(), !1509)
    #dbg_value(i32 136, !911, !DIExpression(), !1509)
  br label %while.cond.i185, !dbg !1511

while.cond.i185:                                  ; preds = %for.end.i194, %keccak_squeezeblocks.exit156
  %pos.addr.0.i = phi i32 [ %6, %keccak_squeezeblocks.exit156 ], [ %i.0.i191.lcssa, %for.end.i194 ]
  %outlen.addr.0.i = phi i32 [ 56, %keccak_squeezeblocks.exit156 ], [ %sub3.i, %for.end.i194 ]
  %out.addr.0.i186 = phi ptr [ %add.ptr.i67, %keccak_squeezeblocks.exit156 ], [ %out.addr.1.i.lcssa, %for.end.i194 ]
    #dbg_value(ptr %out.addr.0.i186, !902, !DIExpression(), !1509)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !1509)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !1509)
  %tobool.not.i187 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1511
  br i1 %tobool.not.i187, label %keccak_squeeze.exit, label %while.body.i188, !dbg !1511

while.body.i188:                                  ; preds = %while.cond.i185
  %cmp.i189 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1512
  br i1 %cmp.i189, label %if.then.i, label %if.end.i, !dbg !1512

if.then.i:                                        ; preds = %while.body.i188
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1513
    #dbg_value(i32 0, !910, !DIExpression(), !1509)
  br label %if.end.i, !dbg !1514

if.end.i:                                         ; preds = %if.then.i, %while.body.i188
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i188 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !1509)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !1509)
  br label %for.cond.i190, !dbg !1515

for.cond.i190:                                    ; preds = %for.body.i195, %if.end.i
  %i.0.i191 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i200, %for.body.i195 ], !dbg !1516
  %out.addr.1.i = phi ptr [ %out.addr.0.i186, %if.end.i ], [ %incdec.ptr.i, %for.body.i195 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !1509)
    #dbg_value(i32 %i.0.i191, !919, !DIExpression(), !1509)
  %cmp1.i = icmp ult i32 %i.0.i191, 136, !dbg !1517
  %add.i192 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1518
  %cmp2.i193 = icmp ult i32 %i.0.i191, %add.i192, !dbg !1518
  %7 = select i1 %cmp1.i, i1 %cmp2.i193, i1 false, !dbg !1518
  br i1 %7, label %for.body.i195, label %for.end.i194, !dbg !1519

for.body.i195:                                    ; preds = %for.cond.i190
  %div1.i = lshr i32 %i.0.i191, 3, !dbg !1520
  %arrayidx.i196 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %div1.i, !dbg !1521
  %8 = load i64, ptr %arrayidx.i196, align 8, !dbg !1521
  %rem.i = shl nuw nsw i32 %i.0.i191, 3, !dbg !1522
  %mul.i197 = and i32 %rem.i, 56, !dbg !1522
  %sh_prom.i = zext nneg i32 %mul.i197 to i64, !dbg !1523
  %shr.i198 = lshr i64 %8, %sh_prom.i, !dbg !1523
  %conv.i199 = trunc i64 %shr.i198 to i8, !dbg !1521
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1509)
  store i8 %conv.i199, ptr %out.addr.1.i, align 1, !dbg !1524
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1525
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !1509)
  %inc.i200 = add nuw nsw i32 %i.0.i191, 1, !dbg !1526
    #dbg_value(i32 %inc.i200, !919, !DIExpression(), !1509)
  br label %for.cond.i190, !dbg !1527, !llvm.loop !1528

for.end.i194:                                     ; preds = %for.cond.i190
  %i.0.i191.lcssa = phi i32 [ %i.0.i191, %for.cond.i190 ], !dbg !1516
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i190 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i191.lcssa, !dbg !1530
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1531
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !1509)
    #dbg_value(i32 %i.0.i191.lcssa, !910, !DIExpression(), !1509)
  br label %while.cond.i185, !dbg !1511, !llvm.loop !1532

keccak_squeeze.exit:                              ; preds = %while.cond.i185
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i185 ]
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !1534
  %pos1.i.i70 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1535
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i70, align 8, !dbg !1536
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i65), !dbg !1537
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1538
    #dbg_value(ptr %add.ptr, !946, !DIExpression(), !1539)
    #dbg_value(ptr %buf.i1, !958, !DIExpression(), !1539)
  call fastcc void @cbd3(ptr noundef nonnull %add.ptr, ptr noundef nonnull %buf.i1) #4, !dbg !1541
  call void @llvm.lifetime.end.p0(i64 192, ptr nonnull %buf.i1), !dbg !1542
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !1543
    #dbg_value(i8 %inc, !1344, !DIExpression(), !1338)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !1544
    #dbg_value(i32 %inc4, !1442, !DIExpression(), !1338)
  br label %for.cond, !dbg !1545, !llvm.loop !1546

for.cond5:                                        ; preds = %for.cond5.preheader, %keccak_squeeze.exit230
  %i.1 = phi i32 [ %inc13, %keccak_squeeze.exit230 ], [ 0, %for.cond5.preheader ], !dbg !1548
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit230 ], [ 2, %for.cond5.preheader ], !dbg !1338
    #dbg_value(i8 %nonce.1, !1344, !DIExpression(), !1338)
    #dbg_value(i32 %i.1, !1442, !DIExpression(), !1338)
  %exitcond267 = icmp ne i32 %i.1, 2, !dbg !1549
  br i1 %exitcond267, label %for.body7, label %for.end14, !dbg !1449

for.body7:                                        ; preds = %for.cond5
    #dbg_value(i8 %nonce.1, !1344, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1338)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i2), !dbg !1551
    #dbg_value(ptr %add.ptr10, !1554, !DIExpression(), !1555)
    #dbg_value(ptr %coins, !1556, !DIExpression(), !1555)
    #dbg_value(i8 %nonce.1, !1557, !DIExpression(), !1555)
    #dbg_declare(ptr %buf.i2, !1558, !DIExpression(), !1560)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !1561
    #dbg_value(ptr %buf.i2, !821, !DIExpression(), !1563)
    #dbg_value(i32 128, !823, !DIExpression(), !1563)
    #dbg_value(ptr %coins, !824, !DIExpression(), !1563)
    #dbg_value(i8 %nonce.1, !825, !DIExpression(), !1563)
    #dbg_declare(ptr %extkey.i, !826, !DIExpression(), !1564)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %coins, i32 noundef 32) #5, !dbg !1561
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !1565
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !1566
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !1567
    #dbg_value(ptr %buf.i2, !840, !DIExpression(), !1570)
    #dbg_value(i32 128, !842, !DIExpression(), !1570)
    #dbg_value(ptr %extkey.i, !843, !DIExpression(), !1570)
    #dbg_value(i32 33, !844, !DIExpression(), !1570)
    #dbg_declare(ptr %state.i, !845, !DIExpression(), !1571)
    #dbg_value(ptr %state.i, !847, !DIExpression(), !1572)
    #dbg_value(ptr %extkey.i, !849, !DIExpression(), !1572)
    #dbg_value(i32 33, !850, !DIExpression(), !1572)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1567
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1573
  store i32 136, ptr %pos.i.i, align 8, !dbg !1574
    #dbg_value(i32 0, !853, !DIExpression(), !1570)
    #dbg_value(ptr %buf.i2, !854, !DIExpression(), !1575)
    #dbg_value(i32 0, !858, !DIExpression(), !1575)
    #dbg_value(ptr %state.i, !859, !DIExpression(), !1575)
    #dbg_value(ptr %buf.i2, !603, !DIExpression(), !1577)
    #dbg_value(i32 0, !610, !DIExpression(), !1577)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !1577)
    #dbg_value(i32 136, !612, !DIExpression(), !1577)
    #dbg_value(ptr %buf.i2, !603, !DIExpression(), !1577)
    #dbg_value(i32 0, !610, !DIExpression(), !1577)
    #dbg_value(i32 128, !842, !DIExpression(), !1570)
    #dbg_value(ptr %buf.i2, !840, !DIExpression(), !1570)
    #dbg_value(ptr %buf.i2, !895, !DIExpression(), !1579)
    #dbg_value(i32 128, !899, !DIExpression(), !1579)
    #dbg_value(ptr %state.i, !900, !DIExpression(), !1579)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1581
  %9 = load i32, ptr %pos.i1.i, align 8, !dbg !1581
    #dbg_value(ptr %buf.i2, !902, !DIExpression(), !1582)
    #dbg_value(i32 128, !908, !DIExpression(), !1582)
    #dbg_value(ptr %state.i, !909, !DIExpression(), !1582)
    #dbg_value(i32 %9, !910, !DIExpression(), !1582)
    #dbg_value(i32 136, !911, !DIExpression(), !1582)
  br label %while.cond.i201, !dbg !1584

while.cond.i201:                                  ; preds = %for.end.i216, %for.body7
  %pos.addr.0.i202 = phi i32 [ %9, %for.body7 ], [ %i.0.i211.lcssa, %for.end.i216 ]
  %outlen.addr.0.i203 = phi i32 [ 128, %for.body7 ], [ %sub3.i218, %for.end.i216 ]
  %out.addr.0.i204 = phi ptr [ %buf.i2, %for.body7 ], [ %out.addr.1.i212.lcssa, %for.end.i216 ]
    #dbg_value(ptr %out.addr.0.i204, !902, !DIExpression(), !1582)
    #dbg_value(i32 %outlen.addr.0.i203, !908, !DIExpression(), !1582)
    #dbg_value(i32 %pos.addr.0.i202, !910, !DIExpression(), !1582)
  %tobool.not.i205 = icmp eq i32 %outlen.addr.0.i203, 0, !dbg !1584
  br i1 %tobool.not.i205, label %keccak_squeeze.exit230, label %while.body.i206, !dbg !1584

while.body.i206:                                  ; preds = %while.cond.i201
  %cmp.i207 = icmp eq i32 %pos.addr.0.i202, 136, !dbg !1585
  br i1 %cmp.i207, label %if.then.i229, label %if.end.i208, !dbg !1585

if.then.i229:                                     ; preds = %while.body.i206
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !1586
    #dbg_value(i32 0, !910, !DIExpression(), !1582)
  br label %if.end.i208, !dbg !1587

if.end.i208:                                      ; preds = %if.then.i229, %while.body.i206
  %pos.addr.1.i209 = phi i32 [ 0, %if.then.i229 ], [ %pos.addr.0.i202, %while.body.i206 ]
    #dbg_value(i32 %pos.addr.1.i209, !910, !DIExpression(), !1582)
    #dbg_value(i32 %pos.addr.1.i209, !919, !DIExpression(), !1582)
  br label %for.cond.i210, !dbg !1588

for.cond.i210:                                    ; preds = %for.body.i219, %if.end.i208
  %i.0.i211 = phi i32 [ %pos.addr.1.i209, %if.end.i208 ], [ %inc.i228, %for.body.i219 ], !dbg !1589
  %out.addr.1.i212 = phi ptr [ %out.addr.0.i204, %if.end.i208 ], [ %incdec.ptr.i227, %for.body.i219 ]
    #dbg_value(ptr %out.addr.1.i212, !902, !DIExpression(), !1582)
    #dbg_value(i32 %i.0.i211, !919, !DIExpression(), !1582)
  %cmp1.i213 = icmp ult i32 %i.0.i211, 136, !dbg !1590
  %add.i214 = add i32 %pos.addr.1.i209, %outlen.addr.0.i203, !dbg !1591
  %cmp2.i215 = icmp ult i32 %i.0.i211, %add.i214, !dbg !1591
  %10 = select i1 %cmp1.i213, i1 %cmp2.i215, i1 false, !dbg !1591
  br i1 %10, label %for.body.i219, label %for.end.i216, !dbg !1592

for.body.i219:                                    ; preds = %for.cond.i210
  %div1.i220 = lshr i32 %i.0.i211, 3, !dbg !1593
  %arrayidx.i221 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i220, !dbg !1594
  %11 = load i64, ptr %arrayidx.i221, align 8, !dbg !1594
  %rem.i222 = shl nuw nsw i32 %i.0.i211, 3, !dbg !1595
  %mul.i223 = and i32 %rem.i222, 56, !dbg !1595
  %sh_prom.i224 = zext nneg i32 %mul.i223 to i64, !dbg !1596
  %shr.i225 = lshr i64 %11, %sh_prom.i224, !dbg !1596
  %conv.i226 = trunc i64 %shr.i225 to i8, !dbg !1594
    #dbg_value(ptr %out.addr.1.i212, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1582)
  store i8 %conv.i226, ptr %out.addr.1.i212, align 1, !dbg !1597
  %incdec.ptr.i227 = getelementptr inbounds nuw i8, ptr %out.addr.1.i212, i32 1, !dbg !1598
    #dbg_value(ptr %incdec.ptr.i227, !902, !DIExpression(), !1582)
  %inc.i228 = add nuw nsw i32 %i.0.i211, 1, !dbg !1599
    #dbg_value(i32 %inc.i228, !919, !DIExpression(), !1582)
  br label %for.cond.i210, !dbg !1600, !llvm.loop !1601

for.end.i216:                                     ; preds = %for.cond.i210
  %i.0.i211.lcssa = phi i32 [ %i.0.i211, %for.cond.i210 ], !dbg !1589
  %out.addr.1.i212.lcssa = phi ptr [ %out.addr.1.i212, %for.cond.i210 ]
  %sub.neg.i217 = sub i32 %pos.addr.1.i209, %i.0.i211.lcssa, !dbg !1603
  %sub3.i218 = add i32 %sub.neg.i217, %outlen.addr.0.i203, !dbg !1604
    #dbg_value(i32 %sub3.i218, !908, !DIExpression(), !1582)
    #dbg_value(i32 %i.0.i211.lcssa, !910, !DIExpression(), !1582)
  br label %while.cond.i201, !dbg !1584, !llvm.loop !1605

keccak_squeeze.exit230:                           ; preds = %while.cond.i201
  %pos.addr.0.i202.lcssa = phi i32 [ %pos.addr.0.i202, %while.cond.i201 ]
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !1607
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1608
  store i32 %pos.addr.0.i202.lcssa, ptr %pos1.i.i, align 8, !dbg !1609
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1610
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1611
    #dbg_value(ptr %add.ptr10, !1612, !DIExpression(), !1614)
    #dbg_value(ptr %buf.i2, !1616, !DIExpression(), !1614)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr10, ptr noundef nonnull %buf.i2) #4, !dbg !1617
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i2), !dbg !1618
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !1619
    #dbg_value(i8 %inc11, !1344, !DIExpression(), !1338)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !1620
    #dbg_value(i32 %inc13, !1442, !DIExpression(), !1338)
  br label %for.cond5, !dbg !1621, !llvm.loop !1622

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !1344, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1338)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !1624
    #dbg_value(ptr %epp, !1554, !DIExpression(), !1626)
    #dbg_value(ptr %coins, !1556, !DIExpression(), !1626)
    #dbg_value(i8 4, !1557, !DIExpression(), !1626)
    #dbg_declare(ptr %buf.i, !1558, !DIExpression(), !1627)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1628
    #dbg_value(ptr %buf.i, !821, !DIExpression(), !1630)
    #dbg_value(i32 128, !823, !DIExpression(), !1630)
    #dbg_value(ptr %coins, !824, !DIExpression(), !1630)
    #dbg_value(i8 4, !825, !DIExpression(), !1630)
    #dbg_declare(ptr %extkey.i5, !826, !DIExpression(), !1631)
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %extkey.i5, ptr noundef %coins, i32 noundef 32) #5, !dbg !1628
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %extkey.i5, i32 32, !dbg !1632
  store i8 4, ptr %arrayidx.i7, align 1, !dbg !1633
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i71), !dbg !1634
    #dbg_value(ptr %buf.i, !840, !DIExpression(), !1637)
    #dbg_value(i32 128, !842, !DIExpression(), !1637)
    #dbg_value(ptr %extkey.i5, !843, !DIExpression(), !1637)
    #dbg_value(i32 33, !844, !DIExpression(), !1637)
    #dbg_declare(ptr %state.i71, !845, !DIExpression(), !1638)
    #dbg_value(ptr %state.i71, !847, !DIExpression(), !1639)
    #dbg_value(ptr %extkey.i5, !849, !DIExpression(), !1639)
    #dbg_value(i32 33, !850, !DIExpression(), !1639)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i71, i32 noundef 136, ptr noundef nonnull %extkey.i5, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1634
  %pos.i.i72 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1640
  store i32 136, ptr %pos.i.i72, align 8, !dbg !1641
    #dbg_value(i32 0, !853, !DIExpression(), !1637)
    #dbg_value(ptr %buf.i, !854, !DIExpression(), !1642)
    #dbg_value(i32 0, !858, !DIExpression(), !1642)
    #dbg_value(ptr %state.i71, !859, !DIExpression(), !1642)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !1644)
    #dbg_value(i32 0, !610, !DIExpression(), !1644)
    #dbg_value(ptr %state.i71, !611, !DIExpression(), !1644)
    #dbg_value(i32 136, !612, !DIExpression(), !1644)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !1644)
    #dbg_value(i32 0, !610, !DIExpression(), !1644)
    #dbg_value(i32 128, !842, !DIExpression(), !1637)
    #dbg_value(ptr %buf.i, !840, !DIExpression(), !1637)
    #dbg_value(ptr %buf.i, !895, !DIExpression(), !1646)
    #dbg_value(i32 128, !899, !DIExpression(), !1646)
    #dbg_value(ptr %state.i71, !900, !DIExpression(), !1646)
  %pos.i1.i74 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1648
  %12 = load i32, ptr %pos.i1.i74, align 8, !dbg !1648
    #dbg_value(ptr %buf.i, !902, !DIExpression(), !1649)
    #dbg_value(i32 128, !908, !DIExpression(), !1649)
    #dbg_value(ptr %state.i71, !909, !DIExpression(), !1649)
    #dbg_value(i32 %12, !910, !DIExpression(), !1649)
    #dbg_value(i32 136, !911, !DIExpression(), !1649)
  br label %while.cond.i231, !dbg !1651

while.cond.i231:                                  ; preds = %for.end.i246, %for.end14
  %pos.addr.0.i232 = phi i32 [ %12, %for.end14 ], [ %i.0.i241.lcssa, %for.end.i246 ]
  %outlen.addr.0.i233 = phi i32 [ 128, %for.end14 ], [ %sub3.i248, %for.end.i246 ]
  %out.addr.0.i234 = phi ptr [ %buf.i, %for.end14 ], [ %out.addr.1.i242.lcssa, %for.end.i246 ]
    #dbg_value(ptr %out.addr.0.i234, !902, !DIExpression(), !1649)
    #dbg_value(i32 %outlen.addr.0.i233, !908, !DIExpression(), !1649)
    #dbg_value(i32 %pos.addr.0.i232, !910, !DIExpression(), !1649)
  %tobool.not.i235 = icmp eq i32 %outlen.addr.0.i233, 0, !dbg !1651
  br i1 %tobool.not.i235, label %keccak_squeeze.exit260, label %while.body.i236, !dbg !1651

while.body.i236:                                  ; preds = %while.cond.i231
  %cmp.i237 = icmp eq i32 %pos.addr.0.i232, 136, !dbg !1652
  br i1 %cmp.i237, label %if.then.i259, label %if.end.i238, !dbg !1652

if.then.i259:                                     ; preds = %while.body.i236
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i71) #4, !dbg !1653
    #dbg_value(i32 0, !910, !DIExpression(), !1649)
  br label %if.end.i238, !dbg !1654

if.end.i238:                                      ; preds = %if.then.i259, %while.body.i236
  %pos.addr.1.i239 = phi i32 [ 0, %if.then.i259 ], [ %pos.addr.0.i232, %while.body.i236 ]
    #dbg_value(i32 %pos.addr.1.i239, !910, !DIExpression(), !1649)
    #dbg_value(i32 %pos.addr.1.i239, !919, !DIExpression(), !1649)
  br label %for.cond.i240, !dbg !1655

for.cond.i240:                                    ; preds = %for.body.i249, %if.end.i238
  %i.0.i241 = phi i32 [ %pos.addr.1.i239, %if.end.i238 ], [ %inc.i258, %for.body.i249 ], !dbg !1656
  %out.addr.1.i242 = phi ptr [ %out.addr.0.i234, %if.end.i238 ], [ %incdec.ptr.i257, %for.body.i249 ]
    #dbg_value(ptr %out.addr.1.i242, !902, !DIExpression(), !1649)
    #dbg_value(i32 %i.0.i241, !919, !DIExpression(), !1649)
  %cmp1.i243 = icmp ult i32 %i.0.i241, 136, !dbg !1657
  %add.i244 = add i32 %pos.addr.1.i239, %outlen.addr.0.i233, !dbg !1658
  %cmp2.i245 = icmp ult i32 %i.0.i241, %add.i244, !dbg !1658
  %13 = select i1 %cmp1.i243, i1 %cmp2.i245, i1 false, !dbg !1658
  br i1 %13, label %for.body.i249, label %for.end.i246, !dbg !1659

for.body.i249:                                    ; preds = %for.cond.i240
  %div1.i250 = lshr i32 %i.0.i241, 3, !dbg !1660
  %arrayidx.i251 = getelementptr inbounds nuw i64, ptr %state.i71, i32 %div1.i250, !dbg !1661
  %14 = load i64, ptr %arrayidx.i251, align 8, !dbg !1661
  %rem.i252 = shl nuw nsw i32 %i.0.i241, 3, !dbg !1662
  %mul.i253 = and i32 %rem.i252, 56, !dbg !1662
  %sh_prom.i254 = zext nneg i32 %mul.i253 to i64, !dbg !1663
  %shr.i255 = lshr i64 %14, %sh_prom.i254, !dbg !1663
  %conv.i256 = trunc i64 %shr.i255 to i8, !dbg !1661
    #dbg_value(ptr %out.addr.1.i242, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1649)
  store i8 %conv.i256, ptr %out.addr.1.i242, align 1, !dbg !1664
  %incdec.ptr.i257 = getelementptr inbounds nuw i8, ptr %out.addr.1.i242, i32 1, !dbg !1665
    #dbg_value(ptr %incdec.ptr.i257, !902, !DIExpression(), !1649)
  %inc.i258 = add nuw nsw i32 %i.0.i241, 1, !dbg !1666
    #dbg_value(i32 %inc.i258, !919, !DIExpression(), !1649)
  br label %for.cond.i240, !dbg !1667, !llvm.loop !1668

for.end.i246:                                     ; preds = %for.cond.i240
  %i.0.i241.lcssa = phi i32 [ %i.0.i241, %for.cond.i240 ], !dbg !1656
  %out.addr.1.i242.lcssa = phi ptr [ %out.addr.1.i242, %for.cond.i240 ]
  %sub.neg.i247 = sub i32 %pos.addr.1.i239, %i.0.i241.lcssa, !dbg !1670
  %sub3.i248 = add i32 %sub.neg.i247, %outlen.addr.0.i233, !dbg !1671
    #dbg_value(i32 %sub3.i248, !908, !DIExpression(), !1649)
    #dbg_value(i32 %i.0.i241.lcssa, !910, !DIExpression(), !1649)
  br label %while.cond.i231, !dbg !1651, !llvm.loop !1672

keccak_squeeze.exit260:                           ; preds = %while.cond.i231
  %pos.addr.0.i232.lcssa = phi i32 [ %pos.addr.0.i232, %while.cond.i231 ]
  %pos1.i.i76 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1674
  store i32 %pos.addr.0.i232.lcssa, ptr %pos1.i.i76, align 8, !dbg !1675
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i71), !dbg !1676
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1677
    #dbg_value(ptr %epp, !1612, !DIExpression(), !1678)
    #dbg_value(ptr %buf.i, !1616, !DIExpression(), !1678)
  call fastcc void @cbd2(ptr noundef nonnull %epp, ptr noundef nonnull %buf.i) #4, !dbg !1680
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !1681
    #dbg_value(ptr %sp, !1682, !DIExpression(), !1683)
    #dbg_value(i32 0, !1084, !DIExpression(), !1683)
  br label %for.cond.i18, !dbg !1685

for.cond.i18:                                     ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit, %keccak_squeeze.exit260
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit260 ], [ %inc.i23, %pqcrystals_kyber512_ref_poly_reduce.exit ], !dbg !1686
    #dbg_value(i32 %i.0.i19, !1084, !DIExpression(), !1683)
  %exitcond269 = icmp ne i32 %i.0.i19, 2, !dbg !1687
  br i1 %exitcond269, label %for.body.i21, label %for.cond16.preheader, !dbg !1688

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1689

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [2 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1691
    #dbg_value(ptr %arrayidx.i22, !1091, !DIExpression(), !1692)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1694
    #dbg_value(ptr %arrayidx.i22, !1098, !DIExpression(), !1695)
    #dbg_value(i32 0, !1102, !DIExpression(), !1695)
  br label %for.cond.i77, !dbg !1697

for.cond.i77:                                     ; preds = %for.body.i80, %for.body.i21
  %i.0.i78 = phi i32 [ 0, %for.body.i21 ], [ %inc.i83, %for.body.i80 ], !dbg !1698
    #dbg_value(i32 %i.0.i78, !1102, !DIExpression(), !1695)
  %exitcond268 = icmp ne i32 %i.0.i78, 256, !dbg !1699
  br i1 %exitcond268, label %for.body.i80, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !1700

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i78, !dbg !1701
  %15 = load i16, ptr %arrayidx.i81, align 2, !dbg !1701
    #dbg_value(i16 %15, !1110, !DIExpression(), !1702)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1702)
  %conv.i.i = sext i16 %15 to i32, !dbg !1704
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1705
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1706
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1707
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1702)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1702)
  %16 = trunc nsw i32 %shr.i.i to i16, !dbg !1708
  %17 = mul i16 %16, -3329, !dbg !1708
  %conv7.i.i = add i16 %17, %15, !dbg !1708
  %arrayidx2.i82 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i78, !dbg !1709
  store i16 %conv7.i.i, ptr %arrayidx2.i82, align 2, !dbg !1710
  %inc.i83 = add nuw nsw i32 %i.0.i78, 1, !dbg !1711
    #dbg_value(i32 %inc.i83, !1102, !DIExpression(), !1695)
  br label %for.cond.i77, !dbg !1712, !llvm.loop !1713

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i77
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1715
    #dbg_value(i32 %inc.i23, !1084, !DIExpression(), !1683)
  br label %for.cond.i18, !dbg !1716, !llvm.loop !1717

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1719
    #dbg_value(i32 %i.2, !1442, !DIExpression(), !1338)
  %exitcond270 = icmp ne i32 %i.2, 2, !dbg !1720
  br i1 %exitcond270, label %for.body18, label %for.end23, !dbg !1689

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1722
  %arrayidx20 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1723
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1724
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1725
    #dbg_value(i32 %inc22, !1442, !DIExpression(), !1338)
  br label %for.cond16, !dbg !1726, !llvm.loop !1727

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1729
    #dbg_value(ptr %b, !1730, !DIExpression(), !1732)
    #dbg_value(i32 0, !1734, !DIExpression(), !1732)
  br label %for.cond.i12, !dbg !1735

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1737
    #dbg_value(i32 %i.0.i13, !1734, !DIExpression(), !1732)
  %exitcond271 = icmp ne i32 %i.0.i13, 2, !dbg !1738
  br i1 %exitcond271, label %for.body.i15, label %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit, !dbg !1740

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1741
    #dbg_value(ptr %arrayidx.i16, !1742, !DIExpression(), !1744)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1746
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1747
    #dbg_value(i32 %inc.i17, !1734, !DIExpression(), !1732)
  br label %for.cond.i12, !dbg !1748, !llvm.loop !1749

pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1742, !DIExpression(), !1751)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1753
    #dbg_value(ptr %b, !1754, !DIExpression(), !1755)
    #dbg_value(ptr %b, !1757, !DIExpression(), !1755)
    #dbg_value(ptr %ep, !1758, !DIExpression(), !1755)
    #dbg_value(i32 0, !1220, !DIExpression(), !1755)
  br label %for.cond.i24, !dbg !1759

for.cond.i24:                                     ; preds = %pqcrystals_kyber512_ref_poly_add.exit63, %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit
  %i.0.i25 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_invntt_tomont.exit ], [ %inc.i29, %pqcrystals_kyber512_ref_poly_add.exit63 ], !dbg !1760
    #dbg_value(i32 %i.0.i25, !1220, !DIExpression(), !1755)
  %exitcond273 = icmp ne i32 %i.0.i25, 2, !dbg !1761
  br i1 %exitcond273, label %for.body.i27, label %for.cond.i44.preheader, !dbg !1762

for.cond.i44.preheader:                           ; preds = %for.cond.i24
  br label %for.cond.i44, !dbg !1763

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1765
  %arrayidx2.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1766
  %arrayidx4.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i25, !dbg !1767
    #dbg_value(ptr %arrayidx.i28, !1231, !DIExpression(), !1768)
    #dbg_value(ptr %arrayidx2.i, !1239, !DIExpression(), !1768)
    #dbg_value(ptr %arrayidx4.i, !1240, !DIExpression(), !1768)
    #dbg_value(i32 0, !1241, !DIExpression(), !1768)
  br label %for.cond.i54, !dbg !1770

for.cond.i54:                                     ; preds = %for.body.i57, %for.body.i27
  %i.0.i55 = phi i32 [ 0, %for.body.i27 ], [ %inc.i62, %for.body.i57 ], !dbg !1771
    #dbg_value(i32 %i.0.i55, !1241, !DIExpression(), !1768)
  %exitcond272 = icmp ne i32 %i.0.i55, 256, !dbg !1772
  br i1 %exitcond272, label %for.body.i57, label %pqcrystals_kyber512_ref_poly_add.exit63, !dbg !1773

for.body.i57:                                     ; preds = %for.cond.i54
  %arrayidx.i58 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i55, !dbg !1774
  %18 = load i16, ptr %arrayidx.i58, align 2, !dbg !1774
  %arrayidx2.i59 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i55, !dbg !1775
  %19 = load i16, ptr %arrayidx2.i59, align 2, !dbg !1775
  %add.i60 = add i16 %18, %19, !dbg !1776
  %arrayidx6.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i28, i32 0, i32 %i.0.i55, !dbg !1777
  store i16 %add.i60, ptr %arrayidx6.i61, align 2, !dbg !1778
  %inc.i62 = add nuw nsw i32 %i.0.i55, 1, !dbg !1779
    #dbg_value(i32 %inc.i62, !1241, !DIExpression(), !1768)
  br label %for.cond.i54, !dbg !1780, !llvm.loop !1781

pqcrystals_kyber512_ref_poly_add.exit63:          ; preds = %for.cond.i54
  %inc.i29 = add nuw nsw i32 %i.0.i25, 1, !dbg !1783
    #dbg_value(i32 %inc.i29, !1220, !DIExpression(), !1755)
  br label %for.cond.i24, !dbg !1784, !llvm.loop !1785

for.cond.i44:                                     ; preds = %for.cond.i44.preheader, %for.body.i47
  %i.0.i45 = phi i32 [ %inc.i52, %for.body.i47 ], [ 0, %for.cond.i44.preheader ], !dbg !1787
    #dbg_value(i32 %i.0.i45, !1241, !DIExpression(), !1788)
  %exitcond274 = icmp ne i32 %i.0.i45, 256, !dbg !1789
  br i1 %exitcond274, label %for.body.i47, label %for.cond.i37.preheader, !dbg !1763

for.cond.i37.preheader:                           ; preds = %for.cond.i44
  br label %for.cond.i37, !dbg !1790

for.body.i47:                                     ; preds = %for.cond.i44
  %arrayidx.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1792
  %20 = load i16, ptr %arrayidx.i48, align 2, !dbg !1792
  %arrayidx2.i49 = getelementptr inbounds nuw [256 x i16], ptr %epp, i32 0, i32 %i.0.i45, !dbg !1793
  %21 = load i16, ptr %arrayidx2.i49, align 2, !dbg !1793
  %add.i50 = add i16 %20, %21, !dbg !1794
  %arrayidx6.i51 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1795
  store i16 %add.i50, ptr %arrayidx6.i51, align 2, !dbg !1796
  %inc.i52 = add nuw nsw i32 %i.0.i45, 1, !dbg !1797
    #dbg_value(i32 %inc.i52, !1241, !DIExpression(), !1788)
  br label %for.cond.i44, !dbg !1798, !llvm.loop !1799

for.cond.i37:                                     ; preds = %for.cond.i37.preheader, %for.body.i40
  %i.0.i38 = phi i32 [ %inc.i43, %for.body.i40 ], [ 0, %for.cond.i37.preheader ], !dbg !1801
    #dbg_value(i32 %i.0.i38, !1241, !DIExpression(), !1802)
  %exitcond275 = icmp ne i32 %i.0.i38, 256, !dbg !1803
  br i1 %exitcond275, label %for.body.i40, label %for.cond.i.preheader, !dbg !1790

for.cond.i.preheader:                             ; preds = %for.cond.i37
  br label %for.cond.i, !dbg !1804

for.body.i40:                                     ; preds = %for.cond.i37
  %arrayidx.i41 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1806
  %22 = load i16, ptr %arrayidx.i41, align 2, !dbg !1806
  %arrayidx2.i42 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %i.0.i38, !dbg !1807
  %23 = load i16, ptr %arrayidx2.i42, align 2, !dbg !1807
  %add.i = add i16 %22, %23, !dbg !1808
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1809
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1810
  %inc.i43 = add nuw nsw i32 %i.0.i38, 1, !dbg !1811
    #dbg_value(i32 %inc.i43, !1241, !DIExpression(), !1802)
  br label %for.cond.i37, !dbg !1812, !llvm.loop !1813

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit96
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit96 ], [ 0, %for.cond.i.preheader ], !dbg !1815
    #dbg_value(i32 %i.0.i, !1262, !DIExpression(), !1816)
  %exitcond277 = icmp ne i32 %i.0.i, 2, !dbg !1817
  br i1 %exitcond277, label %for.body.i, label %for.cond.i97.preheader, !dbg !1804

for.cond.i97.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i97, !dbg !1818

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1820
    #dbg_value(ptr %arrayidx.i11, !1098, !DIExpression(), !1821)
    #dbg_value(i32 0, !1102, !DIExpression(), !1821)
  br label %for.cond.i84, !dbg !1823

for.cond.i84:                                     ; preds = %for.body.i87, %for.body.i
  %i.0.i85 = phi i32 [ 0, %for.body.i ], [ %inc.i95, %for.body.i87 ], !dbg !1824
    #dbg_value(i32 %i.0.i85, !1102, !DIExpression(), !1821)
  %exitcond276 = icmp ne i32 %i.0.i85, 256, !dbg !1825
  br i1 %exitcond276, label %for.body.i87, label %pqcrystals_kyber512_ref_poly_reduce.exit96, !dbg !1826

for.body.i87:                                     ; preds = %for.cond.i84
  %arrayidx.i88 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1827
  %24 = load i16, ptr %arrayidx.i88, align 2, !dbg !1827
    #dbg_value(i16 %24, !1110, !DIExpression(), !1828)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1828)
  %conv.i.i89 = sext i16 %24 to i32, !dbg !1830
  %mul.i.i90 = mul nsw i32 %conv.i.i89, 20159, !dbg !1831
  %add.i.i91 = add nsw i32 %mul.i.i90, 33554432, !dbg !1832
  %shr.i.i92 = ashr i32 %add.i.i91, 26, !dbg !1833
    #dbg_value(i32 %shr.i.i92, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1828)
    #dbg_value(i32 %shr.i.i92, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1828)
  %25 = trunc nsw i32 %shr.i.i92 to i16, !dbg !1834
  %26 = mul i16 %25, -3329, !dbg !1834
  %conv7.i.i93 = add i16 %26, %24, !dbg !1834
  %arrayidx2.i94 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1835
  store i16 %conv7.i.i93, ptr %arrayidx2.i94, align 2, !dbg !1836
  %inc.i95 = add nuw nsw i32 %i.0.i85, 1, !dbg !1837
    #dbg_value(i32 %inc.i95, !1102, !DIExpression(), !1821)
  br label %for.cond.i84, !dbg !1838, !llvm.loop !1839

pqcrystals_kyber512_ref_poly_reduce.exit96:       ; preds = %for.cond.i84
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1841
    #dbg_value(i32 %inc.i, !1262, !DIExpression(), !1816)
  br label %for.cond.i, !dbg !1842, !llvm.loop !1843

for.cond.i97:                                     ; preds = %for.cond.i97.preheader, %for.body.i100
  %i.0.i98 = phi i32 [ %inc.i108, %for.body.i100 ], [ 0, %for.cond.i97.preheader ], !dbg !1845
    #dbg_value(i32 %i.0.i98, !1102, !DIExpression(), !1846)
  %exitcond278 = icmp ne i32 %i.0.i98, 256, !dbg !1847
  br i1 %exitcond278, label %for.body.i100, label %pqcrystals_kyber512_ref_poly_reduce.exit109, !dbg !1818

for.body.i100:                                    ; preds = %for.cond.i97
  %arrayidx.i101 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i98, !dbg !1848
  %27 = load i16, ptr %arrayidx.i101, align 2, !dbg !1848
    #dbg_value(i16 %27, !1110, !DIExpression(), !1849)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1849)
  %conv.i.i102 = sext i16 %27 to i32, !dbg !1851
  %mul.i.i103 = mul nsw i32 %conv.i.i102, 20159, !dbg !1852
  %add.i.i104 = add nsw i32 %mul.i.i103, 33554432, !dbg !1853
  %shr.i.i105 = ashr i32 %add.i.i104, 26, !dbg !1854
    #dbg_value(i32 %shr.i.i105, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1849)
    #dbg_value(i32 %shr.i.i105, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1849)
  %28 = trunc nsw i32 %shr.i.i105 to i16, !dbg !1855
  %29 = mul i16 %28, -3329, !dbg !1855
  %conv7.i.i106 = add i16 %29, %27, !dbg !1855
  %arrayidx2.i107 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i98, !dbg !1856
  store i16 %conv7.i.i106, ptr %arrayidx2.i107, align 2, !dbg !1857
  %inc.i108 = add nuw nsw i32 %i.0.i98, 1, !dbg !1858
    #dbg_value(i32 %inc.i108, !1102, !DIExpression(), !1846)
  br label %for.cond.i97, !dbg !1859, !llvm.loop !1860

pqcrystals_kyber512_ref_poly_reduce.exit109:      ; preds = %for.cond.i97
    #dbg_value(ptr %c, !1862, !DIExpression(), !1867)
    #dbg_value(ptr %b, !1869, !DIExpression(), !1867)
    #dbg_value(ptr %v, !1870, !DIExpression(), !1867)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1871
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !1872
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr.i3, ptr noundef nonnull %v) #4, !dbg !1873
  ret void, !dbg !1874
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1875 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !1878, !DIExpression(), !1879)
    #dbg_value(ptr %c, !1880, !DIExpression(), !1879)
    #dbg_value(ptr %sk, !1881, !DIExpression(), !1879)
    #dbg_declare(ptr %b, !1882, !DIExpression(), !1883)
    #dbg_declare(ptr %skpv, !1884, !DIExpression(), !1885)
    #dbg_declare(ptr %v, !1886, !DIExpression(), !1887)
    #dbg_declare(ptr %mp, !1888, !DIExpression(), !1889)
    #dbg_value(ptr %b, !1890, !DIExpression(), !1894)
    #dbg_value(ptr %v, !1896, !DIExpression(), !1894)
    #dbg_value(ptr %c, !1897, !DIExpression(), !1894)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1898
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !1899
    #dbg_value(ptr %v, !1900, !DIExpression(), !1902)
    #dbg_value(ptr %add.ptr.i, !1904, !DIExpression(), !1902)
    #dbg_value(i32 0, !1905, !DIExpression(), !1902)
  br label %for.cond.i34, !dbg !1906

for.cond.i34:                                     ; preds = %for.body.i37, %entry
  %a.addr.0.i = phi ptr [ %add.ptr.i, %entry ], [ %add.ptr.i40, %for.body.i37 ]
  %i.0.i35 = phi i32 [ 0, %entry ], [ %inc.i41, %for.body.i37 ], !dbg !1908
    #dbg_value(i32 %i.0.i35, !1905, !DIExpression(), !1902)
    #dbg_value(ptr %a.addr.0.i, !1904, !DIExpression(), !1902)
  %exitcond = icmp ne i32 %i.0.i35, 128, !dbg !1909
  br i1 %exitcond, label %for.body.i37, label %for.cond.i1.preheader, !dbg !1911

for.cond.i1.preheader:                            ; preds = %for.cond.i34
  br label %for.cond.i1, !dbg !1912

for.body.i37:                                     ; preds = %for.cond.i34
  %0 = load i8, ptr %a.addr.0.i, align 1, !dbg !1918
  %1 = and i8 %0, 15, !dbg !1920
  %conv2.i = zext nneg i8 %1 to i32, !dbg !1921
  %mul.i38 = mul nuw nsw i32 %conv2.i, 3329, !dbg !1922
  %add.i = add nuw nsw i32 %mul.i38, 8, !dbg !1923
  %shr.i = lshr i32 %add.i, 4, !dbg !1924
  %conv3.i = trunc nuw nsw i32 %shr.i to i16, !dbg !1925
  %mul4.i = shl nuw nsw i32 %i.0.i35, 1, !dbg !1926
  %arrayidx6.i39 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %mul4.i, !dbg !1927
  store i16 %conv3.i, ptr %arrayidx6.i39, align 2, !dbg !1928
  %2 = load i8, ptr %a.addr.0.i, align 1, !dbg !1929
  %3 = lshr i8 %2, 4, !dbg !1930
  %conv11.i = zext nneg i8 %3 to i32, !dbg !1931
  %mul12.i = mul nuw nsw i32 %conv11.i, 3329, !dbg !1932
  %add13.i = add nuw nsw i32 %mul12.i, 8, !dbg !1933
  %shr14.i = lshr i32 %add13.i, 4, !dbg !1934
  %conv15.i = trunc nuw nsw i32 %shr14.i to i16, !dbg !1935
  %mul17.i = shl nuw nsw i32 %i.0.i35, 1, !dbg !1936
  %add18.i = or disjoint i32 %mul17.i, 1, !dbg !1937
  %arrayidx19.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %add18.i, !dbg !1938
  store i16 %conv15.i, ptr %arrayidx19.i, align 2, !dbg !1939
    #dbg_value(ptr %a.addr.0.i, !1904, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1902)
  %add.ptr.i40 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 1, !dbg !1940
    #dbg_value(ptr %add.ptr.i40, !1904, !DIExpression(), !1902)
  %inc.i41 = add nuw nsw i32 %i.0.i35, 1, !dbg !1941
    #dbg_value(i32 %inc.i41, !1905, !DIExpression(), !1902)
  br label %for.cond.i34, !dbg !1942, !llvm.loop !1943

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !1945
    #dbg_value(i32 %i.0.i2, !1376, !DIExpression(), !1946)
  %exitcond51 = icmp ne i32 %i.0.i2, 2, !dbg !1947
  br i1 %exitcond51, label %for.body.i4, label %for.cond.i.preheader, !dbg !1912

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1948

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [2 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1950
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1951
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1952
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1953
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1954
    #dbg_value(i32 %inc.i7, !1376, !DIExpression(), !1946)
  br label %for.cond.i1, !dbg !1955, !llvm.loop !1956

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber512_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber512_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1958
    #dbg_value(i32 %i.0.i, !1084, !DIExpression(), !1959)
  %exitcond53 = icmp ne i32 %i.0.i, 2, !dbg !1960
  br i1 %exitcond53, label %for.body.i, label %pqcrystals_kyber512_ref_polyvec_ntt.exit, !dbg !1948

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1961
    #dbg_value(ptr %arrayidx.i, !1091, !DIExpression(), !1962)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1964
    #dbg_value(ptr %arrayidx.i, !1098, !DIExpression(), !1965)
    #dbg_value(i32 0, !1102, !DIExpression(), !1965)
  br label %for.cond.i14, !dbg !1967

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1968
    #dbg_value(i32 %i.0.i15, !1102, !DIExpression(), !1965)
  %exitcond52 = icmp ne i32 %i.0.i15, 256, !dbg !1969
  br i1 %exitcond52, label %for.body.i17, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !1970

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1971
  %4 = load i16, ptr %arrayidx.i18, align 2, !dbg !1971
    #dbg_value(i16 %4, !1110, !DIExpression(), !1972)
    #dbg_value(i16 20159, !1117, !DIExpression(), !1972)
  %conv.i.i = sext i16 %4 to i32, !dbg !1974
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1975
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1976
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1977
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1972)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1972)
  %5 = trunc nsw i32 %shr.i.i to i16, !dbg !1978
  %6 = mul i16 %5, -3329, !dbg !1978
  %conv7.i.i = add i16 %6, %4, !dbg !1978
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1979
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1980
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1981
    #dbg_value(i32 %inc.i20, !1102, !DIExpression(), !1965)
  br label %for.cond.i14, !dbg !1982, !llvm.loop !1983

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1985
    #dbg_value(i32 %inc.i, !1084, !DIExpression(), !1959)
  br label %for.cond.i, !dbg !1986, !llvm.loop !1987

pqcrystals_kyber512_ref_polyvec_ntt.exit:         ; preds = %for.cond.i
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1989
    #dbg_value(ptr %mp, !1742, !DIExpression(), !1990)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1992
    #dbg_value(ptr %mp, !1993, !DIExpression(), !1995)
    #dbg_value(ptr %v, !1997, !DIExpression(), !1995)
    #dbg_value(ptr %mp, !1998, !DIExpression(), !1995)
    #dbg_value(i32 0, !1999, !DIExpression(), !1995)
  br label %for.cond.i8, !dbg !2000

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber512_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber512_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !2002
    #dbg_value(i32 %i.0.i9, !1999, !DIExpression(), !1995)
  %exitcond54 = icmp ne i32 %i.0.i9, 256, !dbg !2003
  br i1 %exitcond54, label %for.body.i11, label %for.cond.i21.preheader, !dbg !2005

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !2006

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !2008
  %7 = load i16, ptr %arrayidx.i12, align 2, !dbg !2008
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !2009
  %8 = load i16, ptr %arrayidx2.i, align 2, !dbg !2009
  %sub.i = sub i16 %7, %8, !dbg !2010
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !2011
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !2012
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !2013
    #dbg_value(i32 %inc.i13, !1999, !DIExpression(), !1995)
  br label %for.cond.i8, !dbg !2014, !llvm.loop !2015

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !2017
    #dbg_value(i32 %i.0.i22, !1102, !DIExpression(), !2018)
  %exitcond55 = icmp ne i32 %i.0.i22, 256, !dbg !2019
  br i1 %exitcond55, label %for.body.i24, label %for.cond.i42.preheader, !dbg !2006

for.cond.i42.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i42, !dbg !2020

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !2026
  %9 = load i16, ptr %arrayidx.i25, align 2, !dbg !2026
    #dbg_value(i16 %9, !1110, !DIExpression(), !2027)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2027)
  %conv.i.i26 = sext i16 %9 to i32, !dbg !2029
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !2030
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !2031
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !2032
    #dbg_value(i32 %shr.i.i29, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2027)
    #dbg_value(i32 %shr.i.i29, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2027)
  %10 = trunc nsw i32 %shr.i.i29 to i16, !dbg !2033
  %11 = mul i16 %10, -3329, !dbg !2033
  %conv7.i.i30 = add i16 %11, %9, !dbg !2033
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !2034
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !2035
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !2036
    #dbg_value(i32 %inc.i32, !1102, !DIExpression(), !2018)
  br label %for.cond.i21, !dbg !2037, !llvm.loop !2038

for.cond.i42:                                     ; preds = %for.cond.i42.preheader, %for.inc11.i
  %i.0.i43 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i42.preheader ], !dbg !2040
    #dbg_value(i32 %i.0.i43, !2041, !DIExpression(), !2042)
  %exitcond57 = icmp ne i32 %i.0.i43, 32, !dbg !2043
  br i1 %exitcond57, label %for.body.i45, label %pqcrystals_kyber512_ref_poly_tomsg.exit, !dbg !2020

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i43, !dbg !2045
  store i8 0, ptr %arrayidx.i46, align 1, !dbg !2047
    #dbg_value(i32 0, !2048, !DIExpression(), !2042)
  br label %for.cond1.i, !dbg !2049

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i45
  %j.0.i = phi i32 [ 0, %for.body.i45 ], [ %inc.i50, %for.body3.i ], !dbg !2051
    #dbg_value(i32 %j.0.i, !2048, !DIExpression(), !2042)
  %exitcond56 = icmp ne i32 %j.0.i, 8, !dbg !2052
  br i1 %exitcond56, label %for.body3.i, label %for.inc11.i, !dbg !2054

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i47 = shl nuw nsw i32 %i.0.i43, 3, !dbg !2055
  %add.i48 = or disjoint i32 %mul.i47, %j.0.i, !dbg !2057
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i48, !dbg !2058
  %12 = load i16, ptr %arrayidx4.i, align 2, !dbg !2058
  %conv.i = sext i16 %12 to i32, !dbg !2058
    #dbg_value(i32 %conv.i, !2059, !DIExpression(), !2042)
    #dbg_value(i32 %conv.i, !2059, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2042)
    #dbg_value(i32 %conv.i, !2059, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2042)
  %13 = mul i32 %conv.i, 161270, !dbg !2060
  %mul6.i = add i32 %13, 134257275, !dbg !2060
    #dbg_value(i32 %mul6.i, !2059, !DIExpression(), !2042)
  %shr.i49 = lshr i32 %mul6.i, 28, !dbg !2061
    #dbg_value(i32 %shr.i49, !2059, !DIExpression(), !2042)
  %and.i = and i32 %shr.i49, 1, !dbg !2062
    #dbg_value(i32 %and.i, !2059, !DIExpression(), !2042)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !2063
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i43, !dbg !2064
  %14 = load i8, ptr %arrayidx8.i, align 1, !dbg !2065
  %15 = trunc nuw i32 %shl7.i to i8, !dbg !2065
  %conv10.i = or i8 %14, %15, !dbg !2065
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !2065
  %inc.i50 = add nuw nsw i32 %j.0.i, 1, !dbg !2066
    #dbg_value(i32 %inc.i50, !2048, !DIExpression(), !2042)
  br label %for.cond1.i, !dbg !2067, !llvm.loop !2068

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i43, 1, !dbg !2070
    #dbg_value(i32 %inc12.i, !2041, !DIExpression(), !2042)
  br label %for.cond.i42, !dbg !2071, !llvm.loop !2072

pqcrystals_kyber512_ref_poly_tomsg.exit:          ; preds = %for.cond.i42
  ret void, !dbg !2074
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2075 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !2076, !DIExpression(), !2077)
    #dbg_value(ptr %a, !2078, !DIExpression(), !2077)
    #dbg_declare(ptr %t, !2079, !DIExpression(), !2083)
    #dbg_value(i32 0, !2084, !DIExpression(), !2077)
  br label %for.cond, !dbg !2085

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !2087
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !2076, !DIExpression(), !2077)
    #dbg_value(i32 %i.0, !2084, !DIExpression(), !2077)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !2088
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !2090

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2091

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !2094
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !2076, !DIExpression(), !2077)
    #dbg_value(i32 %j.0, !2095, !DIExpression(), !2077)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !2096
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !2091

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !2098

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !2101
    #dbg_value(i32 %k.0, !2102, !DIExpression(), !2077)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !2103
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !2098

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2105
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !2107
  %add = or disjoint i32 %mul, %k.0, !dbg !2108
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !2105
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2105
  %isneg = icmp slt i16 %0, 0, !dbg !2109
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2109
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2110
  %add12 = add i16 %and, %0, !dbg !2111
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !2111
  %conv15 = zext i16 %add12 to i64, !dbg !2112
    #dbg_value(i64 %conv15, !2113, !DIExpression(), !2077)
    #dbg_value(i64 %conv15, !2113, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !2077)
    #dbg_value(i64 %conv15, !2113, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2077)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !2114
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !2114
    #dbg_value(i64 %mul17, !2113, !DIExpression(), !2077)
  %shr18 = lshr i64 %mul17, 32, !dbg !2115
    #dbg_value(i64 %shr18, !2113, !DIExpression(), !2077)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !2116
  %conv20 = and i16 %2, 1023, !dbg !2116
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2117
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !2118
  %inc = add nuw nsw i32 %k.0, 1, !dbg !2119
    #dbg_value(i32 %inc, !2102, !DIExpression(), !2077)
  br label %for.cond4, !dbg !2120, !llvm.loop !2121

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !2123
  %conv25 = trunc i16 %3 to i8, !dbg !2124
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !2125
  %4 = load i16, ptr %t, align 2, !dbg !2126
  %5 = lshr i16 %4, 8, !dbg !2127
  %shr29 = trunc nuw i16 %5 to i8, !dbg !2127
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2128
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !2128
  %conv31 = trunc i16 %6 to i8, !dbg !2128
  %shl32 = shl i8 %conv31, 2, !dbg !2129
  %or = or i8 %shl32, %shr29, !dbg !2130
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !2131
  store i8 %or, ptr %arrayidx34, align 1, !dbg !2132
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2133
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !2133
  %8 = lshr i16 %7, 6, !dbg !2134
  %shr37 = trunc i16 %8 to i8, !dbg !2134
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2135
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !2135
  %conv39 = trunc i16 %9 to i8, !dbg !2135
  %shl40 = shl i8 %conv39, 4, !dbg !2136
  %or41 = or i8 %shl40, %shr37, !dbg !2137
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !2138
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !2139
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2140
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !2140
  %11 = lshr i16 %10, 4, !dbg !2141
  %shr46 = trunc i16 %11 to i8, !dbg !2141
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2142
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !2142
  %conv48 = trunc i16 %12 to i8, !dbg !2142
  %shl49 = shl i8 %conv48, 6, !dbg !2143
  %or50 = or i8 %shl49, %shr46, !dbg !2144
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !2145
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !2146
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2147
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !2147
  %14 = lshr i16 %13, 2, !dbg !2148
  %conv56 = trunc i16 %14 to i8, !dbg !2149
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !2150
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !2151
    #dbg_value(ptr %r.addr.1, !2076, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !2077)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !2152
    #dbg_value(ptr %add.ptr, !2076, !DIExpression(), !2077)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !2153
    #dbg_value(i32 %inc59, !2095, !DIExpression(), !2077)
  br label %for.cond1, !dbg !2154, !llvm.loop !2155

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !2157
    #dbg_value(i32 %inc62, !2084, !DIExpression(), !2077)
  br label %for.cond, !dbg !2158, !llvm.loop !2159

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !2161
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2162 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !2163, !DIExpression(), !2164)
    #dbg_value(ptr %a, !2165, !DIExpression(), !2164)
    #dbg_declare(ptr %t, !2166, !DIExpression(), !2167)
    #dbg_value(i32 0, !2168, !DIExpression(), !2164)
  br label %for.cond, !dbg !2169

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !2171
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !2165, !DIExpression(), !2164)
    #dbg_value(i32 %i.0, !2168, !DIExpression(), !2164)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !2172
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !2174

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2175

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !2178
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !2165, !DIExpression(), !2164)
    #dbg_value(i32 %j.0, !2179, !DIExpression(), !2164)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !2180
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !2175

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !2182
  %conv = zext i8 %0 to i16, !dbg !2182
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2184
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !2184
  %conv6 = zext i8 %1 to i16, !dbg !2185
  %shl = shl nuw i16 %conv6, 8, !dbg !2186
  %or = or disjoint i16 %shl, %conv, !dbg !2187
  store i16 %or, ptr %t, align 2, !dbg !2188
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2189
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !2189
  %3 = lshr i8 %2, 2, !dbg !2190
  %shr11 = zext nneg i8 %3 to i16, !dbg !2190
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2191
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !2191
  %conv14 = zext i8 %4 to i16, !dbg !2192
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !2193
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !2194
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2195
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !2196
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2197
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !2197
  %6 = lshr i8 %5, 4, !dbg !2198
  %shr21 = zext nneg i8 %6 to i16, !dbg !2198
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !2199
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !2199
  %conv24 = zext i8 %7 to i16, !dbg !2200
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !2201
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !2202
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2203
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !2204
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !2205
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !2205
  %9 = lshr i8 %8, 6, !dbg !2206
  %shr31 = zext nneg i8 %9 to i16, !dbg !2206
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !2207
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !2207
  %conv34 = zext i8 %10 to i16, !dbg !2208
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !2209
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !2210
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2211
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !2212
    #dbg_value(ptr %add.ptr, !2165, !DIExpression(), !2164)
    #dbg_value(i32 0, !2213, !DIExpression(), !2164)
  br label %for.cond39, !dbg !2214

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !2216
    #dbg_value(i32 %k.0, !2213, !DIExpression(), !2164)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !2217
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !2219

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2220
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !2220
  %12 = and i16 %11, 1023, !dbg !2221
  %and = zext nneg i16 %12 to i32, !dbg !2221
  %mul = mul nuw nsw i32 %and, 3329, !dbg !2222
  %add = add nuw nsw i32 %mul, 512, !dbg !2223
  %shr45 = lshr i32 %add, 10, !dbg !2224
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !2225
  %arrayidx47 = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2226
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !2227
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !2228
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !2226
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !2229
  %inc = add nuw nsw i32 %k.0, 1, !dbg !2230
    #dbg_value(i32 %inc, !2213, !DIExpression(), !2164)
  br label %for.cond39, !dbg !2231, !llvm.loop !2232

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !2234
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !2235
    #dbg_value(i32 %inc52, !2179, !DIExpression(), !2164)
  br label %for.cond1, !dbg !2236, !llvm.loop !2237

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !2239
    #dbg_value(i32 %inc55, !2168, !DIExpression(), !2164)
  br label %for.cond, !dbg !2240, !llvm.loop !2241

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !2243
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1268 {
entry:
    #dbg_value(ptr %r, !2244, !DIExpression(), !2245)
    #dbg_value(ptr %a, !2246, !DIExpression(), !2245)
    #dbg_value(i32 0, !1302, !DIExpression(), !2245)
  br label %for.cond, !dbg !2247

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2248
    #dbg_value(i32 %i.0, !1302, !DIExpression(), !2245)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !2249
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2250

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2251
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !2252
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2253
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !2254
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2255
    #dbg_value(i32 %inc, !1302, !DIExpression(), !2245)
  br label %for.cond, !dbg !2256, !llvm.loop !2257

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2259
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1370 {
entry:
    #dbg_value(ptr %r, !1369, !DIExpression(), !2260)
    #dbg_value(ptr %a, !1375, !DIExpression(), !2260)
    #dbg_value(i32 0, !1376, !DIExpression(), !2260)
  br label %for.cond, !dbg !2261

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2262
    #dbg_value(i32 %i.0, !1376, !DIExpression(), !2260)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !2263
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2264

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2265
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2266
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2267
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !2268
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2269
    #dbg_value(i32 %inc, !1376, !DIExpression(), !2260)
  br label %for.cond, !dbg !2270, !llvm.loop !2271

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2273
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !972 {
entry:
    #dbg_value(ptr %r, !1682, !DIExpression(), !2274)
    #dbg_value(i32 0, !1084, !DIExpression(), !2274)
  br label %for.cond, !dbg !2275

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_reduce.exit ], !dbg !2276
    #dbg_value(i32 %i.0, !1084, !DIExpression(), !2274)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2277
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2278

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2279
    #dbg_value(ptr %arrayidx, !1091, !DIExpression(), !2280)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %arrayidx) #4, !dbg !2282
    #dbg_value(ptr %arrayidx, !1098, !DIExpression(), !2283)
    #dbg_value(i32 0, !1102, !DIExpression(), !2283)
  br label %for.cond.i, !dbg !2285

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2286
    #dbg_value(i32 %i.0.i, !1102, !DIExpression(), !2283)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2287
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2288

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2289
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2289
    #dbg_value(i16 %0, !1110, !DIExpression(), !2290)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2290)
  %conv.i.i = sext i16 %0 to i32, !dbg !2292
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2293
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2294
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2295
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2290)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2290)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2296
  %2 = mul i16 %1, -3329, !dbg !2296
  %conv7.i.i = add i16 %2, %0, !dbg !2296
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2297
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2298
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2299
    #dbg_value(i32 %inc.i, !1102, !DIExpression(), !2283)
  br label %for.cond.i, !dbg !2300, !llvm.loop !2301

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2303
    #dbg_value(i32 %inc, !1084, !DIExpression(), !2274)
  br label %for.cond, !dbg !2304, !llvm.loop !2305

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2307
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1731 {
entry:
    #dbg_value(ptr %r, !1730, !DIExpression(), !2308)
    #dbg_value(i32 0, !1734, !DIExpression(), !2308)
  br label %for.cond, !dbg !2309

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2310
    #dbg_value(i32 %i.0, !1734, !DIExpression(), !2308)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !2311
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2312

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2313
    #dbg_value(ptr %arrayidx, !1742, !DIExpression(), !2314)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %arrayidx) #4, !dbg !2316
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2317
    #dbg_value(i32 %inc, !1734, !DIExpression(), !2308)
  br label %for.cond, !dbg !2318, !llvm.loop !2319

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2321
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2322 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !2326, !DIExpression(), !2327)
    #dbg_value(ptr %a, !2328, !DIExpression(), !2327)
    #dbg_value(ptr %b, !2329, !DIExpression(), !2327)
    #dbg_declare(ptr %t, !2330, !DIExpression(), !2331)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !2332
    #dbg_value(i32 1, !2333, !DIExpression(), !2327)
  br label %for.cond, !dbg !2334

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_add.exit ], !dbg !2336
    #dbg_value(i32 %i.0, !2333, !DIExpression(), !2327)
  %exitcond8 = icmp ne i32 %i.0, 2, !dbg !2337
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !2339

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !2340

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2342
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2344
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !2345
    #dbg_value(ptr %r, !1231, !DIExpression(), !2346)
    #dbg_value(ptr %r, !1239, !DIExpression(), !2346)
    #dbg_value(ptr %t, !1240, !DIExpression(), !2346)
    #dbg_value(i32 0, !1241, !DIExpression(), !2346)
  br label %for.cond.i, !dbg !2348

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2349
    #dbg_value(i32 %i.0.i, !1241, !DIExpression(), !2346)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2350
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !2351

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2352
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2352
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !2353
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2353
  %add.i = add i16 %0, %1, !dbg !2354
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2355
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2356
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2357
    #dbg_value(i32 %inc.i, !1241, !DIExpression(), !2346)
  br label %for.cond.i, !dbg !2358, !llvm.loop !2359

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2361
    #dbg_value(i32 %inc, !2333, !DIExpression(), !2327)
  br label %for.cond, !dbg !2362, !llvm.loop !2363

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2365
    #dbg_value(i32 %i.0.i2, !1102, !DIExpression(), !2366)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2367
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2340

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2368
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2368
    #dbg_value(i16 %2, !1110, !DIExpression(), !2369)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2369)
  %conv.i.i = sext i16 %2 to i32, !dbg !2371
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2372
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2373
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2374
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2369)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2369)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2375
  %4 = mul i16 %3, -3329, !dbg !2375
  %conv7.i.i = add i16 %4, %2, !dbg !2375
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2376
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2377
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2378
    #dbg_value(i32 %inc.i7, !1102, !DIExpression(), !2366)
  br label %for.cond.i1, !dbg !2379, !llvm.loop !2380

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i1
  ret void, !dbg !2382
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1226 {
entry:
    #dbg_value(ptr %r, !2383, !DIExpression(), !2384)
    #dbg_value(i32 0, !1262, !DIExpression(), !2384)
  br label %for.cond, !dbg !2385

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_reduce.exit ], !dbg !2386
    #dbg_value(i32 %i.0, !1262, !DIExpression(), !2384)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2387
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2388

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2389
    #dbg_value(ptr %arrayidx, !1098, !DIExpression(), !2390)
    #dbg_value(i32 0, !1102, !DIExpression(), !2390)
  br label %for.cond.i, !dbg !2392

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2393
    #dbg_value(i32 %i.0.i, !1102, !DIExpression(), !2390)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2394
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2395

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2396
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2396
    #dbg_value(i16 %0, !1110, !DIExpression(), !2397)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2397)
  %conv.i.i = sext i16 %0 to i32, !dbg !2399
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2400
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2401
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2402
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2397)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2397)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2403
  %2 = mul i16 %1, -3329, !dbg !2403
  %conv7.i.i = add i16 %2, %0, !dbg !2403
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2404
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2405
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2406
    #dbg_value(i32 %inc.i, !1102, !DIExpression(), !2390)
  br label %for.cond.i, !dbg !2407, !llvm.loop !2408

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2410
    #dbg_value(i32 %inc, !1262, !DIExpression(), !2384)
  br label %for.cond, !dbg !2411, !llvm.loop !2412

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2414
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1172 {
entry:
    #dbg_value(ptr %r, !1754, !DIExpression(), !2415)
    #dbg_value(ptr %a, !1757, !DIExpression(), !2415)
    #dbg_value(ptr %b, !1758, !DIExpression(), !2415)
    #dbg_value(i32 0, !1220, !DIExpression(), !2415)
  br label %for.cond, !dbg !2416

for.cond:                                         ; preds = %pqcrystals_kyber512_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber512_ref_poly_add.exit ], !dbg !2417
    #dbg_value(i32 %i.0, !1220, !DIExpression(), !2415)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !2418
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2419

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2420
  %arrayidx2 = getelementptr inbounds nuw [2 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2421
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2422
    #dbg_value(ptr %arrayidx, !1231, !DIExpression(), !2423)
    #dbg_value(ptr %arrayidx2, !1239, !DIExpression(), !2423)
    #dbg_value(ptr %arrayidx4, !1240, !DIExpression(), !2423)
    #dbg_value(i32 0, !1241, !DIExpression(), !2423)
  br label %for.cond.i, !dbg !2425

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2426
    #dbg_value(i32 %i.0.i, !1241, !DIExpression(), !2423)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2427
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_add.exit, !dbg !2428

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2429
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2429
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2430
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2430
  %add.i = add i16 %0, %1, !dbg !2431
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2432
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2433
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2434
    #dbg_value(i32 %inc.i, !1241, !DIExpression(), !2423)
  br label %for.cond.i, !dbg !2435, !llvm.loop !2436

pqcrystals_kyber512_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2438
    #dbg_value(i32 %inc, !1220, !DIExpression(), !2415)
  br label %for.cond, !dbg !2439, !llvm.loop !2440

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2442
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2443 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2444, !DIExpression(), !2445)
    #dbg_value(ptr %a, !2446, !DIExpression(), !2445)
    #dbg_declare(ptr %t, !2447, !DIExpression(), !2451)
    #dbg_value(i32 0, !2452, !DIExpression(), !2445)
  br label %for.cond, !dbg !2453

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !2455
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2444, !DIExpression(), !2445)
    #dbg_value(i32 %i.0, !2452, !DIExpression(), !2445)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2456
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !2458

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2459

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2462
    #dbg_value(i32 %j.0, !2463, !DIExpression(), !2445)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2464
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2459

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2466
  %add = or disjoint i32 %mul, %j.0, !dbg !2468
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2469
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2469
    #dbg_value(i16 %0, !2470, !DIExpression(), !2445)
  %isneg = icmp slt i16 %0, 0, !dbg !2471
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2471
  %add5 = add i16 %and, %0, !dbg !2472
    #dbg_value(i16 %add5, !2470, !DIExpression(), !2445)
  %conv7 = sext i16 %add5 to i32, !dbg !2473
    #dbg_value(i32 %conv7, !2474, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !2445)
    #dbg_value(i32 %conv7, !2474, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2445)
  %1 = mul i32 %conv7, 1290160, !dbg !2475
  %mul9 = add i32 %1, 134257275, !dbg !2475
    #dbg_value(i32 %mul9, !2474, !DIExpression(), !2445)
  %shr10 = lshr i32 %mul9, 28, !dbg !2476
    #dbg_value(i32 %shr10, !2474, !DIExpression(), !2445)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2477
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2478
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2479
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2480
    #dbg_value(i32 %inc, !2463, !DIExpression(), !2445)
  br label %for.cond1, !dbg !2481, !llvm.loop !2482

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2484
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2485
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !2485
  %shl18 = shl i8 %3, 4, !dbg !2486
  %or = or i8 %shl18, %2, !dbg !2487
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2488
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2489
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2489
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2490
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !2490
  %shl25 = shl i8 %5, 4, !dbg !2491
  %or26 = or i8 %shl25, %4, !dbg !2492
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2493
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !2494
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2495
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2495
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2496
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2496
  %shl33 = shl i8 %7, 4, !dbg !2497
  %or34 = or i8 %shl33, %6, !dbg !2498
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2499
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !2500
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2501
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !2501
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2502
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !2502
  %shl41 = shl i8 %9, 4, !dbg !2503
  %or42 = or i8 %shl41, %8, !dbg !2504
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2505
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !2506
    #dbg_value(ptr %r.addr.0, !2444, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !2445)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2507
    #dbg_value(ptr %add.ptr, !2444, !DIExpression(), !2445)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !2508
    #dbg_value(i32 %inc46, !2452, !DIExpression(), !2445)
  br label %for.cond, !dbg !2509, !llvm.loop !2510

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !2512
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1901 {
entry:
    #dbg_value(ptr %r, !1900, !DIExpression(), !2513)
    #dbg_value(ptr %a, !1904, !DIExpression(), !2513)
    #dbg_value(i32 0, !1905, !DIExpression(), !2513)
  br label %for.cond, !dbg !2514

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2515
    #dbg_value(i32 %i.0, !1905, !DIExpression(), !2513)
    #dbg_value(ptr %a.addr.0, !1904, !DIExpression(), !2513)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2516
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2517

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2518
  %1 = and i8 %0, 15, !dbg !2519
  %conv2 = zext nneg i8 %1 to i32, !dbg !2520
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !2521
  %add = add nuw nsw i32 %mul, 8, !dbg !2522
  %shr = lshr i32 %add, 4, !dbg !2523
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !2524
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2525
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !2526
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !2527
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !2528
  %3 = lshr i8 %2, 4, !dbg !2529
  %conv11 = zext nneg i8 %3 to i32, !dbg !2530
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !2531
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !2532
  %shr14 = lshr i32 %add13, 4, !dbg !2533
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !2534
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !2535
  %add18 = or disjoint i32 %mul17, 1, !dbg !2536
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2537
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !2538
    #dbg_value(ptr %a.addr.0, !1904, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2513)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2539
    #dbg_value(ptr %add.ptr, !1904, !DIExpression(), !2513)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2540
    #dbg_value(i32 %inc, !1905, !DIExpression(), !2513)
  br label %for.cond, !dbg !2541, !llvm.loop !2542

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2544
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2545 {
entry:
    #dbg_value(ptr %r, !2546, !DIExpression(), !2547)
    #dbg_value(ptr %a, !2548, !DIExpression(), !2547)
    #dbg_value(i32 0, !2549, !DIExpression(), !2547)
  br label %for.cond, !dbg !2550

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2552
    #dbg_value(i32 %i.0, !2549, !DIExpression(), !2547)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2553
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2555

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2556
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2558
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2558
    #dbg_value(i16 %0, !2559, !DIExpression(), !2547)
  %isneg = icmp slt i16 %0, 0, !dbg !2560
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2560
  %add = add i16 %and, %0, !dbg !2561
    #dbg_value(i16 %add, !2559, !DIExpression(), !2547)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2562
  %add5 = or disjoint i32 %mul4, 1, !dbg !2563
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2564
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2564
    #dbg_value(i16 %1, !2565, !DIExpression(), !2547)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2566
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2566
  %add11 = add i16 %and9, %1, !dbg !2567
    #dbg_value(i16 %add11, !2565, !DIExpression(), !2547)
  %conv15 = trunc i16 %add to i8, !dbg !2568
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2569
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2570
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2571
  %2 = lshr i16 %add, 8, !dbg !2572
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2572
  %conv21 = trunc i16 %add11 to i8, !dbg !2573
  %shl = shl i8 %conv21, 4, !dbg !2574
  %or = or i8 %shl, %shr20, !dbg !2575
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2576
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2577
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2577
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2578
  %4 = lshr i16 %add11, 4, !dbg !2579
  %conv28 = trunc i16 %4 to i8, !dbg !2580
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2581
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2582
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2582
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2583
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2584
    #dbg_value(i32 %inc, !2549, !DIExpression(), !2547)
  br label %for.cond, !dbg !2585, !llvm.loop !2586

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2588
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2589 {
entry:
    #dbg_value(ptr %r, !2590, !DIExpression(), !2591)
    #dbg_value(ptr %a, !2592, !DIExpression(), !2591)
    #dbg_value(i32 0, !2593, !DIExpression(), !2591)
  br label %for.cond, !dbg !2594

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2596
    #dbg_value(i32 %i.0, !2593, !DIExpression(), !2591)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2597
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2599

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2600
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2602
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2602
  %conv = zext i8 %0 to i16, !dbg !2602
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2603
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2604
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2604
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2604
  %conv5 = zext i8 %2 to i16, !dbg !2605
  %shl = shl nuw i16 %conv5, 8, !dbg !2606
  %shl.masked = and i16 %shl, 3840, !dbg !2607
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2607
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2608
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2609
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2610
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2611
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2612
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2612
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2612
  %5 = lshr i8 %4, 4, !dbg !2613
  %shr13 = zext nneg i8 %5 to i16, !dbg !2613
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2614
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2615
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2615
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2615
  %conv18 = zext i8 %7 to i16, !dbg !2616
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2617
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2618
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2619
  %add25 = or disjoint i32 %mul24, 1, !dbg !2620
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2621
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2622
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2623
    #dbg_value(i32 %inc, !2593, !DIExpression(), !2591)
  br label %for.cond, !dbg !2624, !llvm.loop !2625

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2627
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1394 {
entry:
    #dbg_value(ptr %r, !1393, !DIExpression(), !2628)
    #dbg_value(ptr %msg, !1399, !DIExpression(), !2628)
    #dbg_value(i32 0, !1400, !DIExpression(), !2628)
  br label %for.cond, !dbg !2629

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2630
    #dbg_value(i32 %i.0, !1400, !DIExpression(), !2628)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2631
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2632

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2633

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2634
    #dbg_value(i32 %j.0, !1411, !DIExpression(), !2628)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2635
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2633

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2636
  %add = or disjoint i32 %mul, %j.0, !dbg !2637
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2638
  store i16 0, ptr %arrayidx, align 2, !dbg !2639
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2640
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2640
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2641
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2642
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2642
  %conv = zext i8 %0 to i32, !dbg !2642
    #dbg_value(ptr %add.ptr6, !1422, !DIExpression(), !2643)
    #dbg_value(i16 1665, !1428, !DIExpression(), !2643)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2643)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2643)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2645
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2646
  %3 = and i32 %2, %conv, !dbg !2646
  %4 = icmp eq i32 %3, 0, !dbg !2646
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2647
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2647
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2648
    #dbg_value(i32 %inc, !1411, !DIExpression(), !2628)
  br label %for.cond1, !dbg !2649, !llvm.loop !2650

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2652
    #dbg_value(i32 %inc10, !1400, !DIExpression(), !2628)
  br label %for.cond, !dbg !2653, !llvm.loop !2654

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2656
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !2022 {
entry:
    #dbg_value(ptr %msg, !2657, !DIExpression(), !2658)
    #dbg_value(ptr %a, !2659, !DIExpression(), !2658)
    #dbg_value(i32 0, !2041, !DIExpression(), !2658)
  br label %for.cond, !dbg !2660

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2661
    #dbg_value(i32 %i.0, !2041, !DIExpression(), !2658)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2662
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2663

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2664
  store i8 0, ptr %arrayidx, align 1, !dbg !2665
    #dbg_value(i32 0, !2048, !DIExpression(), !2658)
  br label %for.cond1, !dbg !2666

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2667
    #dbg_value(i32 %j.0, !2048, !DIExpression(), !2658)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2668
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2669

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2670
  %add = or disjoint i32 %mul, %j.0, !dbg !2671
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2672
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2672
  %conv = sext i16 %0 to i32, !dbg !2672
    #dbg_value(i32 %conv, !2059, !DIExpression(), !2658)
    #dbg_value(i32 %conv, !2059, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2658)
    #dbg_value(i32 %conv, !2059, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2658)
  %1 = mul i32 %conv, 161270, !dbg !2673
  %mul6 = add i32 %1, 134257275, !dbg !2673
    #dbg_value(i32 %mul6, !2059, !DIExpression(), !2658)
  %shr = lshr i32 %mul6, 28, !dbg !2674
    #dbg_value(i32 %shr, !2059, !DIExpression(), !2658)
  %and = and i32 %shr, 1, !dbg !2675
    #dbg_value(i32 %and, !2059, !DIExpression(), !2658)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2676
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2677
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2678
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2678
  %conv10 = or i8 %2, %3, !dbg !2678
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2678
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2679
    #dbg_value(i32 %inc, !2048, !DIExpression(), !2658)
  br label %for.cond1, !dbg !2680, !llvm.loop !2681

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2683
    #dbg_value(i32 %inc12, !2041, !DIExpression(), !2658)
  br label %for.cond, !dbg !2684, !llvm.loop !2685

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2687
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !797 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !807, !DIExpression(), !2688)
    #dbg_value(ptr %seed, !809, !DIExpression(), !2688)
    #dbg_value(i8 %nonce, !810, !DIExpression(), !2688)
    #dbg_declare(ptr %buf, !811, !DIExpression(), !2689)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2690
    #dbg_value(ptr %buf, !821, !DIExpression(), !2692)
    #dbg_value(i32 192, !823, !DIExpression(), !2692)
    #dbg_value(ptr %seed, !824, !DIExpression(), !2692)
    #dbg_value(i8 %nonce, !825, !DIExpression(), !2692)
    #dbg_declare(ptr %extkey.i, !826, !DIExpression(), !2693)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2690
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2694
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2695
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2696
    #dbg_value(ptr %buf, !840, !DIExpression(), !2699)
    #dbg_value(i32 192, !842, !DIExpression(), !2699)
    #dbg_value(ptr %extkey.i, !843, !DIExpression(), !2699)
    #dbg_value(i32 33, !844, !DIExpression(), !2699)
    #dbg_declare(ptr %state.i, !845, !DIExpression(), !2700)
    #dbg_value(ptr %state.i, !847, !DIExpression(), !2701)
    #dbg_value(ptr %extkey.i, !849, !DIExpression(), !2701)
    #dbg_value(i32 33, !850, !DIExpression(), !2701)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2696
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2702
  store i32 136, ptr %pos.i.i, align 8, !dbg !2703
    #dbg_value(i32 1, !853, !DIExpression(), !2699)
    #dbg_value(ptr %buf, !854, !DIExpression(), !2704)
    #dbg_value(i32 1, !858, !DIExpression(), !2704)
    #dbg_value(ptr %state.i, !859, !DIExpression(), !2704)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2706)
    #dbg_value(i32 1, !610, !DIExpression(), !2706)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !2706)
    #dbg_value(i32 136, !612, !DIExpression(), !2706)
  br label %while.cond.i, !dbg !2708

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ 1, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !2706)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !2706)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !2708
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !2708

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2709
    #dbg_value(i32 0, !616, !DIExpression(), !2706)
  br label %for.cond.i, !dbg !2710

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !2711
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !2706)
  %exitcond15 = icmp ne i32 %i.0.i, 17, !dbg !2712
  br i1 %exitcond15, label %for.body.i, label %for.end.i, !dbg !2713

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !2714
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !2715
  %arrayidx.i2 = getelementptr inbounds nuw i64, ptr %state.i, i32 %i.0.i, !dbg !2716
  %0 = load i64, ptr %arrayidx.i2, align 8, !dbg !2716
    #dbg_value(ptr %add.ptr.i1, !626, !DIExpression(), !2717)
    #dbg_value(i64 %0, !632, !DIExpression(), !2717)
    #dbg_value(i32 0, !633, !DIExpression(), !2717)
  br label %for.cond.i.i, !dbg !2719

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2720
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !2717)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !2721
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !2722

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !2723
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !2724
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !2724
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !2725
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i1, i32 %i.0.i.i, !dbg !2726
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !2727
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2728
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !2717)
  br label %for.cond.i.i, !dbg !2729, !llvm.loop !2730

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2732
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !2706)
  br label %for.cond.i, !dbg !2733, !llvm.loop !2734

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !2736
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !2706)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !2737
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !2706)
  br label %while.cond.i, !dbg !2708, !llvm.loop !2738

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 56, !842, !DIExpression(), !2699)
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %buf, i32 136, !dbg !2740
    #dbg_value(ptr %add.ptr.i, !840, !DIExpression(), !2699)
    #dbg_value(ptr %add.ptr.i, !895, !DIExpression(), !2741)
    #dbg_value(i32 56, !899, !DIExpression(), !2741)
    #dbg_value(ptr %state.i, !900, !DIExpression(), !2741)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2743
  %1 = load i32, ptr %pos.i1.i, align 8, !dbg !2743
    #dbg_value(ptr %add.ptr.i, !902, !DIExpression(), !2744)
    #dbg_value(i32 56, !908, !DIExpression(), !2744)
    #dbg_value(ptr %state.i, !909, !DIExpression(), !2744)
    #dbg_value(i32 %1, !910, !DIExpression(), !2744)
    #dbg_value(i32 136, !911, !DIExpression(), !2744)
  br label %while.cond.i3, !dbg !2746

while.cond.i3:                                    ; preds = %for.end.i10, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i9.lcssa, %for.end.i10 ]
  %outlen.addr.0.i = phi i32 [ 56, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i10 ]
  %out.addr.0.i4 = phi ptr [ %add.ptr.i, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i10 ]
    #dbg_value(ptr %out.addr.0.i4, !902, !DIExpression(), !2744)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !2744)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !2744)
  %tobool.not.i5 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2746
  br i1 %tobool.not.i5, label %keccak_squeeze.exit, label %while.body.i6, !dbg !2746

while.body.i6:                                    ; preds = %while.cond.i3
  %cmp.i7 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2747
  br i1 %cmp.i7, label %if.then.i, label %if.end.i, !dbg !2747

if.then.i:                                        ; preds = %while.body.i6
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2748
    #dbg_value(i32 0, !910, !DIExpression(), !2744)
  br label %if.end.i, !dbg !2749

if.end.i:                                         ; preds = %if.then.i, %while.body.i6
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i6 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !2744)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !2744)
  br label %for.cond.i8, !dbg !2750

for.cond.i8:                                      ; preds = %for.body.i11, %if.end.i
  %i.0.i9 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i14, %for.body.i11 ], !dbg !2751
  %out.addr.1.i = phi ptr [ %out.addr.0.i4, %if.end.i ], [ %incdec.ptr.i, %for.body.i11 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !2744)
    #dbg_value(i32 %i.0.i9, !919, !DIExpression(), !2744)
  %cmp1.i = icmp ult i32 %i.0.i9, 136, !dbg !2752
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2753
  %cmp2.i = icmp ult i32 %i.0.i9, %add.i, !dbg !2753
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2753
  br i1 %2, label %for.body.i11, label %for.end.i10, !dbg !2754

for.body.i11:                                     ; preds = %for.cond.i8
  %div1.i = lshr i32 %i.0.i9, 3, !dbg !2755
  %arrayidx.i12 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2756
  %3 = load i64, ptr %arrayidx.i12, align 8, !dbg !2756
  %rem.i = shl nuw nsw i32 %i.0.i9, 3, !dbg !2757
  %mul.i13 = and i32 %rem.i, 56, !dbg !2757
  %sh_prom.i = zext nneg i32 %mul.i13 to i64, !dbg !2758
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !2758
  %conv.i = trunc i64 %shr.i to i8, !dbg !2756
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2744)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2759
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2760
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !2744)
  %inc.i14 = add nuw nsw i32 %i.0.i9, 1, !dbg !2761
    #dbg_value(i32 %inc.i14, !919, !DIExpression(), !2744)
  br label %for.cond.i8, !dbg !2762, !llvm.loop !2763

for.end.i10:                                      ; preds = %for.cond.i8
  %i.0.i9.lcssa = phi i32 [ %i.0.i9, %for.cond.i8 ], !dbg !2751
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i8 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i9.lcssa, !dbg !2765
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2766
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !2744)
    #dbg_value(i32 %i.0.i9.lcssa, !910, !DIExpression(), !2744)
  br label %while.cond.i3, !dbg !2746, !llvm.loop !2767

keccak_squeeze.exit:                              ; preds = %while.cond.i3
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i3 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2769
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2770
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2771
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2772
    #dbg_value(ptr %r, !946, !DIExpression(), !2773)
    #dbg_value(ptr %buf, !958, !DIExpression(), !2773)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2775
  ret void, !dbg !2776
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1552 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1554, !DIExpression(), !2777)
    #dbg_value(ptr %seed, !1556, !DIExpression(), !2777)
    #dbg_value(i8 %nonce, !1557, !DIExpression(), !2777)
    #dbg_declare(ptr %buf, !1558, !DIExpression(), !2778)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2779
    #dbg_value(ptr %buf, !821, !DIExpression(), !2781)
    #dbg_value(i32 128, !823, !DIExpression(), !2781)
    #dbg_value(ptr %seed, !824, !DIExpression(), !2781)
    #dbg_value(i8 %nonce, !825, !DIExpression(), !2781)
    #dbg_declare(ptr %extkey.i, !826, !DIExpression(), !2782)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2779
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2783
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2784
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2785
    #dbg_value(ptr %buf, !840, !DIExpression(), !2788)
    #dbg_value(i32 128, !842, !DIExpression(), !2788)
    #dbg_value(ptr %extkey.i, !843, !DIExpression(), !2788)
    #dbg_value(i32 33, !844, !DIExpression(), !2788)
    #dbg_declare(ptr %state.i, !845, !DIExpression(), !2789)
    #dbg_value(ptr %state.i, !847, !DIExpression(), !2790)
    #dbg_value(ptr %extkey.i, !849, !DIExpression(), !2790)
    #dbg_value(i32 33, !850, !DIExpression(), !2790)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2785
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2791
  store i32 136, ptr %pos.i.i, align 8, !dbg !2792
    #dbg_value(i32 0, !853, !DIExpression(), !2788)
    #dbg_value(ptr %buf, !854, !DIExpression(), !2793)
    #dbg_value(i32 0, !858, !DIExpression(), !2793)
    #dbg_value(ptr %state.i, !859, !DIExpression(), !2793)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2795)
    #dbg_value(i32 0, !610, !DIExpression(), !2795)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !2795)
    #dbg_value(i32 136, !612, !DIExpression(), !2795)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2795)
    #dbg_value(i32 0, !610, !DIExpression(), !2795)
    #dbg_value(i32 128, !842, !DIExpression(), !2788)
    #dbg_value(ptr %buf, !840, !DIExpression(), !2788)
    #dbg_value(ptr %buf, !895, !DIExpression(), !2797)
    #dbg_value(i32 128, !899, !DIExpression(), !2797)
    #dbg_value(ptr %state.i, !900, !DIExpression(), !2797)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2799
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2799
    #dbg_value(ptr %buf, !902, !DIExpression(), !2800)
    #dbg_value(i32 128, !908, !DIExpression(), !2800)
    #dbg_value(ptr %state.i, !909, !DIExpression(), !2800)
    #dbg_value(i32 %0, !910, !DIExpression(), !2800)
    #dbg_value(i32 136, !911, !DIExpression(), !2800)
  br label %while.cond.i2, !dbg !2802

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !902, !DIExpression(), !2800)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !2800)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !2800)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2802
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2802

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2803
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2803

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2804
    #dbg_value(i32 0, !910, !DIExpression(), !2800)
  br label %if.end.i, !dbg !2805

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !2800)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !2800)
  br label %for.cond.i7, !dbg !2806

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2807
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !2800)
    #dbg_value(i32 %i.0.i8, !919, !DIExpression(), !2800)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2808
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2809
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2809
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2809
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2810

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2811
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2812
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2812
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2813
  %mul.i12 = and i32 %rem.i, 56, !dbg !2813
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2814
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2814
  %conv.i = trunc i64 %shr.i to i8, !dbg !2812
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2800)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2815
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2816
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !2800)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2817
    #dbg_value(i32 %inc.i13, !919, !DIExpression(), !2800)
  br label %for.cond.i7, !dbg !2818, !llvm.loop !2819

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2807
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2821
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2822
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !2800)
    #dbg_value(i32 %i.0.i8.lcssa, !910, !DIExpression(), !2800)
  br label %while.cond.i2, !dbg !2802, !llvm.loop !2823

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2825
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2826
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2827
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2828
    #dbg_value(ptr %r, !1612, !DIExpression(), !2829)
    #dbg_value(ptr %buf, !1616, !DIExpression(), !2829)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2831
  ret void, !dbg !2832
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1092 {
entry:
    #dbg_value(ptr %r, !1091, !DIExpression(), !2833)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #4, !dbg !2834
    #dbg_value(ptr %r, !1098, !DIExpression(), !2835)
    #dbg_value(i32 0, !1102, !DIExpression(), !2835)
  br label %for.cond.i, !dbg !2837

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2838
    #dbg_value(i32 %i.0.i, !1102, !DIExpression(), !2835)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2839
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber512_ref_poly_reduce.exit, !dbg !2840

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2841
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2841
    #dbg_value(i16 %0, !1110, !DIExpression(), !2842)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2842)
  %conv.i.i = sext i16 %0 to i32, !dbg !2844
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2845
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2846
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2847
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2842)
    #dbg_value(i32 %shr.i.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2842)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2848
  %2 = mul i16 %1, -3329, !dbg !2848
  %conv7.i.i = add i16 %2, %0, !dbg !2848
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2849
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2850
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2851
    #dbg_value(i32 %inc.i, !1102, !DIExpression(), !2835)
  br label %for.cond.i, !dbg !2852, !llvm.loop !2853

pqcrystals_kyber512_ref_poly_reduce.exit:         ; preds = %for.cond.i
  ret void, !dbg !2855
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1099 {
entry:
    #dbg_value(ptr %r, !1098, !DIExpression(), !2856)
    #dbg_value(i32 0, !1102, !DIExpression(), !2856)
  br label %for.cond, !dbg !2857

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2858
    #dbg_value(i32 %i.0, !1102, !DIExpression(), !2856)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2859
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2860

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2861
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2861
    #dbg_value(i16 %0, !1110, !DIExpression(), !2862)
    #dbg_value(i16 20159, !1117, !DIExpression(), !2862)
  %conv.i = sext i16 %0 to i32, !dbg !2864
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2865
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2866
  %shr.i = ashr i32 %add.i, 26, !dbg !2867
    #dbg_value(i32 %shr.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2862)
    #dbg_value(i32 %shr.i, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2862)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2868
  %2 = mul i16 %1, -3329, !dbg !2868
  %conv7.i = add i16 %2, %0, !dbg !2868
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2869
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2870
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2871
    #dbg_value(i32 %inc, !1102, !DIExpression(), !2856)
  br label %for.cond, !dbg !2872, !llvm.loop !2873

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2875
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1743 {
entry:
    #dbg_value(ptr %r, !1742, !DIExpression(), !2876)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #4, !dbg !2877
  ret void, !dbg !2878
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2879 {
entry:
    #dbg_value(ptr %r, !2880, !DIExpression(), !2881)
    #dbg_value(ptr %a, !2882, !DIExpression(), !2881)
    #dbg_value(ptr %b, !2883, !DIExpression(), !2881)
    #dbg_value(i32 0, !2884, !DIExpression(), !2881)
  br label %for.cond, !dbg !2885

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2887
    #dbg_value(i32 %i.0, !2884, !DIExpression(), !2881)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2888
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2890

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2891
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2893
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2894
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2895
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2896
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2897
  %add = or disjoint i32 %i.0, 64, !dbg !2898
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !2899
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2899
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2900
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2901
  %add10 = or disjoint i32 %mul9, 2, !dbg !2902
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2903
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2904
  %add14 = or disjoint i32 %mul13, 2, !dbg !2905
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2906
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2907
  %add18 = or disjoint i32 %mul17, 2, !dbg !2908
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2909
  %add20 = or disjoint i32 %i.0, 64, !dbg !2910
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add20, !dbg !2911
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2911
  %sub = sub i16 0, %1, !dbg !2912
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2913
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2914
    #dbg_value(i32 %inc, !2884, !DIExpression(), !2881)
  br label %for.cond, !dbg !2915, !llvm.loop !2916

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2918
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1184 {
entry:
    #dbg_value(ptr %r, !1183, !DIExpression(), !2919)
    #dbg_value(i16 1353, !1187, !DIExpression(), !2919)
    #dbg_value(i32 0, !1188, !DIExpression(), !2919)
  br label %for.cond, !dbg !2920

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2921
    #dbg_value(i32 %i.0, !1188, !DIExpression(), !2919)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2922
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2923

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2924
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2924
  %conv = sext i16 %0 to i32, !dbg !2925
  %mul = mul nsw i32 %conv, 1353, !dbg !2926
    #dbg_value(i32 %mul, !1198, !DIExpression(), !2927)
    #dbg_value(i32 %mul, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2927)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2929
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2929
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2930
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2931
  %shr.i = lshr i32 %sub.i, 16, !dbg !2932
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2933
    #dbg_value(i16 %conv5.i, !1203, !DIExpression(), !2927)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2934
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2935
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2936
    #dbg_value(i32 %inc, !1188, !DIExpression(), !2919)
  br label %for.cond, !dbg !2937, !llvm.loop !2938

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2940
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1232 {
entry:
    #dbg_value(ptr %r, !1231, !DIExpression(), !2941)
    #dbg_value(ptr %a, !1239, !DIExpression(), !2941)
    #dbg_value(ptr %b, !1240, !DIExpression(), !2941)
    #dbg_value(i32 0, !1241, !DIExpression(), !2941)
  br label %for.cond, !dbg !2942

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2943
    #dbg_value(i32 %i.0, !1241, !DIExpression(), !2941)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2944
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2945

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2946
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2946
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2947
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2947
  %add = add i16 %0, %1, !dbg !2948
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2949
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2950
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2951
    #dbg_value(i32 %inc, !1241, !DIExpression(), !2941)
  br label %for.cond, !dbg !2952, !llvm.loop !2953

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2955
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1994 {
entry:
    #dbg_value(ptr %r, !1993, !DIExpression(), !2956)
    #dbg_value(ptr %a, !1997, !DIExpression(), !2956)
    #dbg_value(ptr %b, !1998, !DIExpression(), !2956)
    #dbg_value(i32 0, !1999, !DIExpression(), !2956)
  br label %for.cond, !dbg !2957

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2958
    #dbg_value(i32 %i.0, !1999, !DIExpression(), !2956)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2959
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2960

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2961
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2961
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2962
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2962
  %sub = sub i16 %0, %1, !dbg !2963
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2964
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2965
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2966
    #dbg_value(i32 %inc, !1999, !DIExpression(), !2956)
  br label %for.cond, !dbg !2967, !llvm.loop !2968

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2970
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2971 {
entry:
    #dbg_value(ptr %r, !2974, !DIExpression(), !2975)
    #dbg_value(i32 1, !2976, !DIExpression(), !2975)
    #dbg_value(i32 128, !2977, !DIExpression(), !2975)
  br label %for.cond, !dbg !2978

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2980
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2981
    #dbg_value(i32 %k.0, !2976, !DIExpression(), !2975)
    #dbg_value(i32 %len.0, !2977, !DIExpression(), !2975)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2982
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2984

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2985

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2988
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2975
    #dbg_value(i32 %k.1, !2976, !DIExpression(), !2975)
    #dbg_value(i32 %start.0, !2989, !DIExpression(), !2975)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2990
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2985

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2976, !DIExpression(), !2975)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !2992
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2992
    #dbg_value(i16 %0, !2994, !DIExpression(), !2975)
    #dbg_value(i32 %start.0, !2995, !DIExpression(), !2975)
  br label %for.cond4, !dbg !2996

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2998
    #dbg_value(i32 %j.0, !2995, !DIExpression(), !2975)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2999
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !3001
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !3002

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3003
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !3003
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !3003
    #dbg_value(i16 %0, !3005, !DIExpression(), !3009)
    #dbg_value(i16 %2, !3011, !DIExpression(), !3009)
  %conv.i = sext i16 %0 to i32, !dbg !3012
  %conv1.i = sext i16 %2 to i32, !dbg !3013
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !3014
    #dbg_value(i32 %mul.i, !1198, !DIExpression(), !3015)
    #dbg_value(i32 %mul.i, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3015)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !3017
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3017
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3018
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !3019
  %shr.i = lshr i32 %sub.i, 16, !dbg !3020
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3021
    #dbg_value(i16 %conv5.i, !1203, !DIExpression(), !3015)
    #dbg_value(i16 %conv5.i, !3022, !DIExpression(), !2975)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3023
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !3023
  %sub = sub i16 %3, %conv5.i, !dbg !3024
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3025
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !3025
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !3026
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3027
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !3027
  %add17 = add i16 %5, %conv5.i, !dbg !3028
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3029
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !3030
  %inc20 = add nuw i32 %j.0, 1, !dbg !3031
    #dbg_value(i32 %inc20, !2995, !DIExpression(), !2975)
  br label %for.cond4, !dbg !3032, !llvm.loop !3033

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2998
  %inc = add i32 %k.1, 1, !dbg !3035
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !3036
    #dbg_value(i32 %add22, !2989, !DIExpression(), !2975)
  br label %for.cond1, !dbg !3037, !llvm.loop !3038

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2975
  %shr = lshr i32 %len.0, 1, !dbg !3040
    #dbg_value(i32 %shr, !2977, !DIExpression(), !2975)
  br label %for.cond, !dbg !3041, !llvm.loop !3042

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !3044
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !3045 {
entry:
    #dbg_value(ptr %r, !3046, !DIExpression(), !3047)
    #dbg_value(i16 1441, !3048, !DIExpression(), !3047)
    #dbg_value(i32 127, !3049, !DIExpression(), !3047)
    #dbg_value(i32 2, !3050, !DIExpression(), !3047)
  br label %for.cond, !dbg !3051

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !3053
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !3054
    #dbg_value(i32 %k.0, !3049, !DIExpression(), !3047)
    #dbg_value(i32 %len.0, !3050, !DIExpression(), !3047)
  %cmp = icmp ult i32 %len.0, 129, !dbg !3055
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !3057

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !3058

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !3061

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !3063
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !3047
    #dbg_value(i32 %k.1, !3049, !DIExpression(), !3047)
    #dbg_value(i32 %start.0, !3064, !DIExpression(), !3047)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !3065
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !3058

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !3049, !DIExpression(), !3047)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !3067
  %0 = load i16, ptr %arrayidx, align 2, !dbg !3067
    #dbg_value(i16 %0, !3069, !DIExpression(), !3047)
    #dbg_value(i32 %start.0, !3070, !DIExpression(), !3047)
  br label %for.cond4, !dbg !3071

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !3073
    #dbg_value(i32 %j.0, !3070, !DIExpression(), !3047)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !3074
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !3076
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !3077

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3078
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !3078
    #dbg_value(i16 %1, !3080, !DIExpression(), !3047)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3081
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !3081
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !3081
  %add11 = add i16 %1, %3, !dbg !3082
    #dbg_value(i16 %add11, !1110, !DIExpression(), !3083)
    #dbg_value(i16 20159, !1117, !DIExpression(), !3083)
  %conv.i10 = sext i16 %add11 to i32, !dbg !3085
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !3086
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !3087
  %shr.i12 = ashr i32 %add.i, 26, !dbg !3088
    #dbg_value(i32 %shr.i12, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3083)
    #dbg_value(i32 %shr.i12, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3083)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !3089
  %5 = mul i16 %4, -3329, !dbg !3089
  %conv7.i = add i16 %5, %add11, !dbg !3089
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3090
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !3091
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3092
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !3092
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !3092
  %sub = sub i16 %7, %1, !dbg !3093
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3094
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !3094
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !3095
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3096
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !3096
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !3096
    #dbg_value(i16 %0, !3005, !DIExpression(), !3097)
    #dbg_value(i16 %10, !3011, !DIExpression(), !3097)
  %conv.i1 = sext i16 %0 to i32, !dbg !3099
  %conv1.i = sext i16 %10 to i32, !dbg !3100
  %mul.i2 = mul nsw i32 %conv.i1, %conv1.i, !dbg !3101
    #dbg_value(i32 %mul.i2, !1198, !DIExpression(), !3102)
    #dbg_value(i32 %mul.i2, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3102)
  %sext.i4 = mul i32 %mul.i2, -218038272, !dbg !3104
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !3104
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !3105
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i2, !dbg !3106
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !3107
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !3108
    #dbg_value(i16 %conv5.i9, !1203, !DIExpression(), !3102)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3109
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !3109
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !3110
  %inc = add nuw i32 %j.0, 1, !dbg !3111
    #dbg_value(i32 %inc, !3070, !DIExpression(), !3047)
  br label %for.cond4, !dbg !3112, !llvm.loop !3113

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !3073
  %dec = add i32 %k.1, -1, !dbg !3115
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !3116
    #dbg_value(i32 %add27, !3064, !DIExpression(), !3047)
  br label %for.cond1, !dbg !3117, !llvm.loop !3118

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !3047
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !3120
    #dbg_value(i32 %shl, !3050, !DIExpression(), !3047)
  br label %for.cond, !dbg !3121, !llvm.loop !3122

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !3124
    #dbg_value(i32 %j.1, !3070, !DIExpression(), !3047)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !3125
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !3061

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !3127
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !3127
    #dbg_value(i16 %12, !3005, !DIExpression(), !3128)
    #dbg_value(i16 1441, !3011, !DIExpression(), !3128)
  %conv.i = sext i16 %12 to i32, !dbg !3130
  %mul.i = mul nsw i32 %conv.i, 1441, !dbg !3131
    #dbg_value(i32 %mul.i, !1198, !DIExpression(), !3132)
    #dbg_value(i32 %mul.i, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3132)
  %sext.i = mul i32 %conv.i, -660537344, !dbg !3134
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3134
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3135
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !3136
  %shr.i = lshr i32 %sub.i, 16, !dbg !3137
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3138
    #dbg_value(i16 %conv5.i, !1203, !DIExpression(), !3132)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !3139
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !3140
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !3141
    #dbg_value(i32 %inc39, !3070, !DIExpression(), !3047)
  br label %for.cond31, !dbg !3142, !llvm.loop !3143

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !3145
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !3146 {
entry:
    #dbg_value(ptr %r, !3150, !DIExpression(), !3151)
    #dbg_value(ptr %a, !3152, !DIExpression(), !3151)
    #dbg_value(ptr %b, !3153, !DIExpression(), !3151)
    #dbg_value(i16 %zeta, !3154, !DIExpression(), !3151)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3155
  %0 = load i16, ptr %arrayidx, align 2, !dbg !3155
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3156
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !3156
    #dbg_value(i16 %0, !3005, !DIExpression(), !3157)
    #dbg_value(i16 %1, !3011, !DIExpression(), !3157)
  %conv.i5 = sext i16 %0 to i32, !dbg !3159
  %conv1.i6 = sext i16 %1 to i32, !dbg !3160
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !3161
    #dbg_value(i32 %mul.i7, !1198, !DIExpression(), !3162)
    #dbg_value(i32 %mul.i7, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3162)
  %sext.i = mul i32 %mul.i7, -218038272, !dbg !3164
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3164
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3165
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i7, !dbg !3166
  %shr.i = lshr i32 %sub.i, 16, !dbg !3167
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3168
    #dbg_value(i16 %conv5.i, !1203, !DIExpression(), !3162)
  store i16 %conv5.i, ptr %r, align 2, !dbg !3169
    #dbg_value(i16 %conv5.i, !3005, !DIExpression(), !3170)
    #dbg_value(i16 %zeta, !3011, !DIExpression(), !3170)
  %conv.i1 = ashr i32 %sub.i, 16, !dbg !3172
  %conv1.i2 = sext i16 %zeta to i32, !dbg !3173
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !3174
    #dbg_value(i32 %mul.i3, !1198, !DIExpression(), !3175)
    #dbg_value(i32 %mul.i3, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3175)
  %sext.i35 = mul i32 %mul.i3, -218038272, !dbg !3177
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !3177
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !3178
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i3, !dbg !3179
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !3180
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !3181
    #dbg_value(i16 %conv5.i40, !1203, !DIExpression(), !3175)
  store i16 %conv5.i40, ptr %r, align 2, !dbg !3182
  %2 = load i16, ptr %a, align 2, !dbg !3183
  %3 = load i16, ptr %b, align 2, !dbg !3184
    #dbg_value(i16 %2, !3005, !DIExpression(), !3185)
    #dbg_value(i16 %3, !3011, !DIExpression(), !3185)
  %conv.i9 = sext i16 %2 to i32, !dbg !3187
  %conv1.i10 = sext i16 %3 to i32, !dbg !3188
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !3189
    #dbg_value(i32 %mul.i11, !1198, !DIExpression(), !3190)
    #dbg_value(i32 %mul.i11, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3190)
  %sext.i23 = mul i32 %mul.i11, -218038272, !dbg !3192
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !3192
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !3193
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i11, !dbg !3194
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !3195
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !3196
    #dbg_value(i16 %conv5.i28, !1203, !DIExpression(), !3190)
  %4 = load i16, ptr %r, align 2, !dbg !3197
  %add = add i16 %4, %conv5.i28, !dbg !3197
  store i16 %add, ptr %r, align 2, !dbg !3197
  %5 = load i16, ptr %a, align 2, !dbg !3198
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3199
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !3199
    #dbg_value(i16 %5, !3005, !DIExpression(), !3200)
    #dbg_value(i16 %6, !3011, !DIExpression(), !3200)
  %conv.i13 = sext i16 %5 to i32, !dbg !3202
  %conv1.i14 = sext i16 %6 to i32, !dbg !3203
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !3204
    #dbg_value(i32 %mul.i15, !1198, !DIExpression(), !3205)
    #dbg_value(i32 %mul.i15, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3205)
  %sext.i17 = mul i32 %mul.i15, -218038272, !dbg !3207
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !3207
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !3208
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i15, !dbg !3209
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !3210
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !3211
    #dbg_value(i16 %conv5.i22, !1203, !DIExpression(), !3205)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3212
  store i16 %conv5.i22, ptr %arrayidx15, align 2, !dbg !3213
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3214
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !3214
  %8 = load i16, ptr %b, align 2, !dbg !3215
    #dbg_value(i16 %7, !3005, !DIExpression(), !3216)
    #dbg_value(i16 %8, !3011, !DIExpression(), !3216)
  %conv.i = sext i16 %7 to i32, !dbg !3218
  %conv1.i = sext i16 %8 to i32, !dbg !3219
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !3220
    #dbg_value(i32 %mul.i, !1198, !DIExpression(), !3221)
    #dbg_value(i32 %mul.i, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3221)
  %sext.i29 = mul i32 %mul.i, -218038272, !dbg !3223
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !3223
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !3224
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i, !dbg !3225
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !3226
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !3227
    #dbg_value(i16 %conv5.i34, !1203, !DIExpression(), !3221)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3228
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !3229
  %add22 = add i16 %9, %conv5.i34, !dbg !3229
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !3229
  ret void, !dbg !3230
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !947 {
entry:
    #dbg_value(ptr %r, !946, !DIExpression(), !3231)
    #dbg_value(ptr %buf, !958, !DIExpression(), !3231)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #4, !dbg !3232
  ret void, !dbg !3233
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !3234 {
entry:
    #dbg_value(ptr %r, !3235, !DIExpression(), !3236)
    #dbg_value(ptr %buf, !3237, !DIExpression(), !3236)
    #dbg_value(i32 0, !3238, !DIExpression(), !3236)
  br label %for.cond, !dbg !3239

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !3241
    #dbg_value(i32 %i.0, !3238, !DIExpression(), !3236)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !3242
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !3244

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !3245
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !3247
    #dbg_value(ptr %add.ptr, !3248, !DIExpression(), !3252)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !3254
  %conv.i = zext i8 %0 to i32, !dbg !3255
    #dbg_value(i32 %conv.i, !3256, !DIExpression(), !3252)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3257
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3257
  %conv2.i = zext i8 %1 to i32, !dbg !3258
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3259
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3260
    #dbg_value(i32 %or.i, !3256, !DIExpression(), !3252)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3261
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3261
  %conv4.i = zext i8 %2 to i32, !dbg !3262
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3263
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3264
    #dbg_value(i32 %or6.i, !3256, !DIExpression(), !3252)
    #dbg_value(i32 %or6.i, !3265, !DIExpression(), !3236)
  %and = and i32 %or6.i, 2396745, !dbg !3266
    #dbg_value(i32 %and, !3267, !DIExpression(), !3236)
  %shr = lshr i32 %or6.i, 1, !dbg !3268
  %and1 = and i32 %shr, 2396745, !dbg !3269
  %add = add nuw nsw i32 %and, %and1, !dbg !3270
    #dbg_value(i32 %add, !3267, !DIExpression(), !3236)
  %shr2 = lshr i32 %or6.i, 2, !dbg !3271
  %and3 = and i32 %shr2, 2396745, !dbg !3272
  %add4 = add nuw nsw i32 %add, %and3, !dbg !3273
    #dbg_value(i32 %add4, !3267, !DIExpression(), !3236)
    #dbg_value(i32 0, !3274, !DIExpression(), !3236)
  br label %for.cond5, !dbg !3275

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !3277
    #dbg_value(i32 %j.0, !3274, !DIExpression(), !3236)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !3278
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !3280

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !3281
  %shr10 = lshr i32 %add4, %mul8, !dbg !3283
  %conv = and i32 %shr10, 7, !dbg !3284
    #dbg_value(i32 %shr10, !3285, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !3236)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !3286
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !3287
  %shr14 = lshr i32 %add4, %add13, !dbg !3288
  %conv16 = and i32 %shr14, 7, !dbg !3289
    #dbg_value(i32 %conv16, !3290, !DIExpression(), !3236)
  %sub = sub nsw i32 %conv, %conv16, !dbg !3291
  %conv19 = trunc nsw i32 %sub to i16, !dbg !3292
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !3293
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !3294
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !3295
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !3296
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3297
    #dbg_value(i32 %inc, !3274, !DIExpression(), !3236)
  br label %for.cond5, !dbg !3298, !llvm.loop !3299

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !3301
    #dbg_value(i32 %inc23, !3238, !DIExpression(), !3236)
  br label %for.cond, !dbg !3302, !llvm.loop !3303

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !3305
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1613 {
entry:
    #dbg_value(ptr %r, !1612, !DIExpression(), !3306)
    #dbg_value(ptr %buf, !1616, !DIExpression(), !3306)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3307
  ret void, !dbg !3308
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !3309 {
entry:
    #dbg_value(ptr %r, !3310, !DIExpression(), !3311)
    #dbg_value(ptr %buf, !3312, !DIExpression(), !3311)
    #dbg_value(i32 0, !3313, !DIExpression(), !3311)
  br label %for.cond, !dbg !3314

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !3316
    #dbg_value(i32 %i.0, !3313, !DIExpression(), !3311)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !3317
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !3319

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !3320
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !3322
    #dbg_value(ptr %add.ptr, !3323, !DIExpression(), !3325)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !3327
  %conv.i = zext i8 %0 to i32, !dbg !3328
    #dbg_value(i32 %conv.i, !3329, !DIExpression(), !3325)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3330
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3330
  %conv2.i = zext i8 %1 to i32, !dbg !3331
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3332
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3333
    #dbg_value(i32 %or.i, !3329, !DIExpression(), !3325)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3334
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3334
  %conv4.i = zext i8 %2 to i32, !dbg !3335
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3336
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3337
    #dbg_value(i32 %or6.i, !3329, !DIExpression(), !3325)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !3338
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !3338
  %conv8.i = zext i8 %3 to i32, !dbg !3339
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !3340
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !3341
    #dbg_value(i32 %or10.i, !3329, !DIExpression(), !3325)
    #dbg_value(i32 %or10.i, !3342, !DIExpression(), !3311)
  %and = and i32 %or10.i, 1431655765, !dbg !3343
    #dbg_value(i32 %and, !3344, !DIExpression(), !3311)
  %shr = lshr i32 %or10.i, 1, !dbg !3345
  %and1 = and i32 %shr, 1431655765, !dbg !3346
  %add = add nuw i32 %and, %and1, !dbg !3347
    #dbg_value(i32 %add, !3344, !DIExpression(), !3311)
    #dbg_value(i32 0, !3348, !DIExpression(), !3311)
  br label %for.cond2, !dbg !3349

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !3351
    #dbg_value(i32 %j.0, !3348, !DIExpression(), !3311)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !3352
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !3354

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !3355
  %shr7 = lshr i32 %add, %mul5, !dbg !3357
  %conv = and i32 %shr7, 3, !dbg !3358
    #dbg_value(i32 %shr7, !3359, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !3311)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !3360
  %add10 = or disjoint i32 %mul9, 2, !dbg !3361
  %shr11 = lshr i32 %add, %add10, !dbg !3362
  %conv13 = and i32 %shr11, 3, !dbg !3363
    #dbg_value(i32 %conv13, !3364, !DIExpression(), !3311)
  %sub = sub nsw i32 %conv, %conv13, !dbg !3365
  %conv16 = trunc nsw i32 %sub to i16, !dbg !3366
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !3367
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !3368
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !3369
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !3370
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3371
    #dbg_value(i32 %inc, !3348, !DIExpression(), !3311)
  br label %for.cond2, !dbg !3372, !llvm.loop !3373

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !3375
    #dbg_value(i32 %inc20, !3313, !DIExpression(), !3311)
  br label %for.cond, !dbg !3376, !llvm.loop !3377

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !3379
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1199 {
entry:
    #dbg_value(i32 %a, !1198, !DIExpression(), !3380)
    #dbg_value(i32 %a, !1203, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3380)
  %sext = mul i32 %a, -218038272, !dbg !3381
  %conv3 = ashr exact i32 %sext, 16, !dbg !3381
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !3382
  %sub = add i32 %mul4.neg, %a, !dbg !3383
  %shr = lshr i32 %sub, 16, !dbg !3384
  %conv5 = trunc nuw i32 %shr to i16, !dbg !3385
    #dbg_value(i16 %conv5, !1203, !DIExpression(), !3380)
  ret i16 %conv5, !dbg !3386
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1111 {
entry:
    #dbg_value(i16 %a, !1110, !DIExpression(), !3387)
    #dbg_value(i16 20159, !1117, !DIExpression(), !3387)
  %conv = sext i16 %a to i32, !dbg !3388
  %mul = mul nsw i32 %conv, 20159, !dbg !3389
  %add = add nsw i32 %mul, 33554432, !dbg !3390
  %shr = ashr i32 %add, 26, !dbg !3391
    #dbg_value(i32 %shr, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3387)
    #dbg_value(i32 %shr, !1122, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3387)
  %0 = trunc nsw i32 %shr to i16, !dbg !3392
  %1 = mul i16 %0, -3329, !dbg !3392
  %conv7 = add i16 %1, %a, !dbg !3392
  ret i16 %conv7, !dbg !3393
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !417 {
entry:
    #dbg_value(ptr %a, !416, !DIExpression(), !3394)
    #dbg_value(ptr %b, !423, !DIExpression(), !3394)
    #dbg_value(i32 %len, !424, !DIExpression(), !3394)
    #dbg_value(i8 0, !425, !DIExpression(), !3394)
    #dbg_value(i32 0, !426, !DIExpression(), !3394)
  br label %for.cond, !dbg !3395

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3396
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !3394
    #dbg_value(i8 %r.0, !425, !DIExpression(), !3394)
    #dbg_value(i32 %i.0, !426, !DIExpression(), !3394)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3397
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !3398

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3394)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3399
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3399
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !3400
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !3400
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3394)
  %xor1 = xor i8 %0, %1, !dbg !3401
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3394)
  %or2 = or i8 %r.0, %xor1, !dbg !3402
    #dbg_value(i8 %or2, !425, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3394)
    #dbg_value(i8 %or2, !425, !DIExpression(), !3394)
  %inc = add i32 %i.0, 1, !dbg !3403
    #dbg_value(i32 %inc, !426, !DIExpression(), !3394)
  br label %for.cond, !dbg !3404, !llvm.loop !3405

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !3394
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !3407
  %conv6 = zext i1 %2 to i32, !dbg !3408
  ret i32 %conv6, !dbg !3409
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !446 {
entry:
    #dbg_value(ptr %r, !445, !DIExpression(), !3410)
    #dbg_value(ptr %x, !451, !DIExpression(), !3410)
    #dbg_value(i32 %len, !452, !DIExpression(), !3410)
    #dbg_value(i8 %b, !453, !DIExpression(), !3410)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !3411, !srcloc !455
    #dbg_value(i8 %0, !453, !DIExpression(), !3410)
  %sub = sub i8 0, %0, !dbg !3412
    #dbg_value(i8 %sub, !453, !DIExpression(), !3410)
    #dbg_value(i32 0, !457, !DIExpression(), !3410)
  br label %for.cond, !dbg !3413

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3414
    #dbg_value(i32 %i.0, !457, !DIExpression(), !3410)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3415
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3416

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3417
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3417
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3418
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !3418
  %xor1 = xor i8 %1, %2, !dbg !3419
  %and2 = and i8 %xor1, %sub, !dbg !3420
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3421
  %xor93 = xor i8 %1, %and2, !dbg !3422
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !3422
  %inc = add i32 %i.0, 1, !dbg !3423
    #dbg_value(i32 %inc, !457, !DIExpression(), !3410)
  br label %for.cond, !dbg !3424, !llvm.loop !3425

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3427
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1423 {
entry:
    #dbg_value(ptr %r, !1422, !DIExpression(), !3428)
    #dbg_value(i16 %v, !1428, !DIExpression(), !3428)
    #dbg_value(i16 %b, !1429, !DIExpression(), !3428)
  %sub = sub i16 0, %b, !dbg !3429
    #dbg_value(i16 %sub, !1429, !DIExpression(), !3428)
  %0 = load i16, ptr %r, align 2, !dbg !3430
  %xor1 = xor i16 %0, %v, !dbg !3431
  %and = and i16 %xor1, %sub, !dbg !3432
  %xor6 = xor i16 %and, %0, !dbg !3433
  store i16 %xor6, ptr %r, align 2, !dbg !3433
  ret void, !dbg !3434
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3435 {
entry:
    #dbg_value(ptr %state, !3438, !DIExpression(), !3439)
    #dbg_value(ptr %state, !3440, !DIExpression(), !3444)
    #dbg_value(i32 0, !3446, !DIExpression(), !3444)
  br label %for.cond.i, !dbg !3447

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3449
    #dbg_value(i32 %i.0.i, !3446, !DIExpression(), !3444)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3450
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3452

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3453
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3454
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3455
    #dbg_value(i32 %inc.i, !3446, !DIExpression(), !3444)
  br label %for.cond.i, !dbg !3456, !llvm.loop !3457

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3459
  store i32 0, ptr %pos, align 8, !dbg !3460
  ret void, !dbg !3461
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3462 {
entry:
    #dbg_value(ptr %state, !3463, !DIExpression(), !3464)
    #dbg_value(ptr %in, !3465, !DIExpression(), !3464)
    #dbg_value(i32 %inlen, !3466, !DIExpression(), !3464)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3467
  %0 = load i32, ptr %pos, align 8, !dbg !3467
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3468
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3469
  store i32 %call, ptr %pos1, align 8, !dbg !3470
  ret void, !dbg !3471
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3472 {
entry:
    #dbg_value(ptr %s, !3475, !DIExpression(), !3476)
    #dbg_value(i32 %pos, !3477, !DIExpression(), !3476)
    #dbg_value(i32 %r, !3478, !DIExpression(), !3476)
    #dbg_value(ptr %in, !3479, !DIExpression(), !3476)
    #dbg_value(i32 %inlen, !3480, !DIExpression(), !3476)
  br label %while.cond, !dbg !3481

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3477, !DIExpression(), !3476)
    #dbg_value(i32 %inlen.addr.0, !3480, !DIExpression(), !3476)
    #dbg_value(ptr %in.addr.0, !3479, !DIExpression(), !3476)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3482
  %cmp.not = icmp ult i32 %add, %r, !dbg !3483
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3481

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3484
  br label %for.cond, !dbg !3484

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3487

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3489
    #dbg_value(i32 %i.0, !3490, !DIExpression(), !3476)
    #dbg_value(ptr %in.addr.1, !3479, !DIExpression(), !3476)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3491
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3484

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3479, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3476)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3493
  %conv = zext i8 %0 to i64, !dbg !3494
  %rem = shl i32 %i.0, 3, !dbg !3495
  %mul = and i32 %rem, 56, !dbg !3495
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3496
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3496
  %div2 = lshr i32 %i.0, 3, !dbg !3497
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3498
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3499
  %xor = xor i64 %1, %shl, !dbg !3499
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3499
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3500
    #dbg_value(ptr %incdec.ptr, !3479, !DIExpression(), !3476)
  %inc = add i32 %i.0, 1, !dbg !3501
    #dbg_value(i32 %inc, !3490, !DIExpression(), !3476)
  br label %for.cond, !dbg !3502, !llvm.loop !3503

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3505
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3506
    #dbg_value(i32 %sub2, !3480, !DIExpression(), !3476)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3507
    #dbg_value(i32 0, !3477, !DIExpression(), !3476)
  br label %while.cond, !dbg !3481, !llvm.loop !3508

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3510
    #dbg_value(i32 %i.1, !3490, !DIExpression(), !3476)
    #dbg_value(ptr %in.addr.2, !3479, !DIExpression(), !3476)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3511
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3513
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3487

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3479, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3476)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3514
  %conv9 = zext i8 %2 to i64, !dbg !3515
  %rem10 = shl i32 %i.1, 3, !dbg !3516
  %mul11 = and i32 %rem10, 56, !dbg !3516
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3517
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3517
  %div141 = lshr i32 %i.1, 3, !dbg !3518
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3519
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3520
  %xor16 = xor i64 %3, %shl13, !dbg !3520
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3520
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3521
    #dbg_value(ptr %incdec.ptr8, !3479, !DIExpression(), !3476)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3522
    #dbg_value(i32 %inc18, !3490, !DIExpression(), !3476)
  br label %for.cond3, !dbg !3523, !llvm.loop !3524

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3510
  ret i32 %i.1.lcssa, !dbg !3526
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3527 {
entry:
    #dbg_value(ptr %state, !3528, !DIExpression(), !3529)
  %0 = load i64, ptr %state, align 8, !dbg !3530
    #dbg_value(i64 %0, !3531, !DIExpression(), !3529)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3532
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3532
    #dbg_value(i64 %1, !3533, !DIExpression(), !3529)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3534
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3534
    #dbg_value(i64 %2, !3535, !DIExpression(), !3529)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3536
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3536
    #dbg_value(i64 %3, !3537, !DIExpression(), !3529)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3538
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3538
    #dbg_value(i64 %4, !3539, !DIExpression(), !3529)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3540
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3540
    #dbg_value(i64 %5, !3541, !DIExpression(), !3529)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3542
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3542
    #dbg_value(i64 %6, !3543, !DIExpression(), !3529)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3544
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3544
    #dbg_value(i64 %7, !3545, !DIExpression(), !3529)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3546
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3546
    #dbg_value(i64 %8, !3547, !DIExpression(), !3529)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3548
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3548
    #dbg_value(i64 %9, !3549, !DIExpression(), !3529)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3550
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3550
    #dbg_value(i64 %10, !3551, !DIExpression(), !3529)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3552
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3552
    #dbg_value(i64 %11, !3553, !DIExpression(), !3529)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3554
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3554
    #dbg_value(i64 %12, !3555, !DIExpression(), !3529)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3556
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3556
    #dbg_value(i64 %13, !3557, !DIExpression(), !3529)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3558
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3558
    #dbg_value(i64 %14, !3559, !DIExpression(), !3529)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3560
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3560
    #dbg_value(i64 %15, !3561, !DIExpression(), !3529)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3562
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3562
    #dbg_value(i64 %16, !3563, !DIExpression(), !3529)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3564
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3564
    #dbg_value(i64 %17, !3565, !DIExpression(), !3529)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3566
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3566
    #dbg_value(i64 %18, !3567, !DIExpression(), !3529)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3568
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3568
    #dbg_value(i64 %19, !3569, !DIExpression(), !3529)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3570
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3570
    #dbg_value(i64 %20, !3571, !DIExpression(), !3529)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3572
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3572
    #dbg_value(i64 %21, !3573, !DIExpression(), !3529)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3574
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3574
    #dbg_value(i64 %22, !3575, !DIExpression(), !3529)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3576
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3576
    #dbg_value(i64 %23, !3577, !DIExpression(), !3529)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3578
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3578
    #dbg_value(i64 %24, !3579, !DIExpression(), !3529)
    #dbg_value(i32 0, !3580, !DIExpression(), !3529)
  br label %for.cond, !dbg !3581

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3529
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3529
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3529
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3529
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3529
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3529
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3529
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3529
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3529
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3529
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3529
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3529
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3529
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3529
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3529
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3529
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3529
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3529
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3529
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3529
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3529
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3529
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3529
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3529
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3583
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3529
    #dbg_value(i64 %Asu.0, !3579, !DIExpression(), !3529)
    #dbg_value(i32 %round.0, !3580, !DIExpression(), !3529)
    #dbg_value(i64 %Aba.0, !3531, !DIExpression(), !3529)
    #dbg_value(i64 %Abe.0, !3533, !DIExpression(), !3529)
    #dbg_value(i64 %Abi.0, !3535, !DIExpression(), !3529)
    #dbg_value(i64 %Abo.0, !3537, !DIExpression(), !3529)
    #dbg_value(i64 %Abu.0, !3539, !DIExpression(), !3529)
    #dbg_value(i64 %Aga.0, !3541, !DIExpression(), !3529)
    #dbg_value(i64 %Age.0, !3543, !DIExpression(), !3529)
    #dbg_value(i64 %Agi.0, !3545, !DIExpression(), !3529)
    #dbg_value(i64 %Ago.0, !3547, !DIExpression(), !3529)
    #dbg_value(i64 %Agu.0, !3549, !DIExpression(), !3529)
    #dbg_value(i64 %Aka.0, !3551, !DIExpression(), !3529)
    #dbg_value(i64 %Ake.0, !3553, !DIExpression(), !3529)
    #dbg_value(i64 %Aki.0, !3555, !DIExpression(), !3529)
    #dbg_value(i64 %Ako.0, !3557, !DIExpression(), !3529)
    #dbg_value(i64 %Aku.0, !3559, !DIExpression(), !3529)
    #dbg_value(i64 %Ama.0, !3561, !DIExpression(), !3529)
    #dbg_value(i64 %Ame.0, !3563, !DIExpression(), !3529)
    #dbg_value(i64 %Ami.0, !3565, !DIExpression(), !3529)
    #dbg_value(i64 %Amo.0, !3567, !DIExpression(), !3529)
    #dbg_value(i64 %Amu.0, !3569, !DIExpression(), !3529)
    #dbg_value(i64 %Asa.0, !3571, !DIExpression(), !3529)
    #dbg_value(i64 %Ase.0, !3573, !DIExpression(), !3529)
    #dbg_value(i64 %Asi.0, !3575, !DIExpression(), !3529)
    #dbg_value(i64 %Aso.0, !3577, !DIExpression(), !3529)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3584
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3586

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 poison, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3622
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3624
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3625
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3626
    #dbg_value(i64 %xor35, !3589, !DIExpression(), !3529)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3627
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3628
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3629
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3630
    #dbg_value(i64 %xor43, !3591, !DIExpression(), !3529)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3631
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3632
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 %xor57, !3595, !DIExpression(), !3529)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3633
    #dbg_value(i64 %xor203, !3547, !DIExpression(), !3529)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3634
    #dbg_value(i64 %xor206, !3588, !DIExpression(), !3529)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3635
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3636
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3637
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3638
    #dbg_value(i64 %xor31, !3588, !DIExpression(), !3529)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3639
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3640
    #dbg_value(i64 %xor45, !3592, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3641
    #dbg_value(i64 %xor211, !3561, !DIExpression(), !3529)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3642
    #dbg_value(i64 %xor214, !3590, !DIExpression(), !3529)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3643
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3644
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3645
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3646
    #dbg_value(i64 %xor39, !3590, !DIExpression(), !3529)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3647
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3648
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3649
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3650
    #dbg_value(i64 %xor27, !3587, !DIExpression(), !3529)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3651
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3652
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 %xor61, !3596, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3653
    #dbg_value(i64 %xor207, !3559, !DIExpression(), !3529)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3654
    #dbg_value(i64 %xor210, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not222 = xor i64 %xor210, -1, !dbg !3655
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and223 = and i64 %xor214, %not222, !dbg !3656
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor224 = xor i64 %xor206, %and223, !dbg !3657
    #dbg_value(i64 %xor224, !3618, !DIExpression(), !3529)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3658
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3659
    #dbg_value(i64 %xor53, !3594, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3660
    #dbg_value(i64 %xor67, !3555, !DIExpression(), !3529)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3661
    #dbg_value(i64 %xor70, !3589, !DIExpression(), !3529)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3662
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3663
    #dbg_value(i64 %xor49, !3593, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3664
    #dbg_value(i64 %xor63, !3543, !DIExpression(), !3529)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3665
    #dbg_value(i64 %xor66, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not = xor i64 %xor66, -1, !dbg !3666
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and = and i64 %xor70, %not, !dbg !3667
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3668
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3668
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %26 = xor i64 %and, %25, !dbg !3669
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3670
    #dbg_value(i64 %xor62, !3531, !DIExpression(), !3529)
    #dbg_value(i64 %xor62, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor81 = xor i64 %26, %xor62, !dbg !3669
    #dbg_value(i64 %xor81, !3597, !DIExpression(), !3529)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3671
    #dbg_value(i64 %xor94, !3537, !DIExpression(), !3529)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3672
    #dbg_value(i64 %xor97, !3587, !DIExpression(), !3529)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3673
    #dbg_value(i64 %xor102, !3551, !DIExpression(), !3529)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3674
    #dbg_value(i64 %xor105, !3589, !DIExpression(), !3529)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3675
    #dbg_value(i64 %xor98, !3549, !DIExpression(), !3529)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3676
    #dbg_value(i64 %xor101, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not114 = xor i64 %xor101, -1, !dbg !3677
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and115 = and i64 %xor105, %not114, !dbg !3678
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor116 = xor i64 %xor97, %and115, !dbg !3679
    #dbg_value(i64 %xor116, !3602, !DIExpression(), !3529)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3680
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3681
    #dbg_value(i64 %xor129, !3533, !DIExpression(), !3529)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3682
    #dbg_value(i64 %xor132, !3587, !DIExpression(), !3529)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3683
    #dbg_value(i64 %xor137, !3557, !DIExpression(), !3529)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3684
    #dbg_value(i64 %xor140, !3589, !DIExpression(), !3529)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3685
    #dbg_value(i64 %xor133, !3545, !DIExpression(), !3529)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3686
    #dbg_value(i64 %xor136, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not149 = xor i64 %xor136, -1, !dbg !3687
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and150 = and i64 %xor140, %not149, !dbg !3688
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor151 = xor i64 %xor132, %and150, !dbg !3689
    #dbg_value(i64 %xor151, !3607, !DIExpression(), !3529)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3690
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3691
    #dbg_value(i64 %xor164, !3539, !DIExpression(), !3529)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3692
    #dbg_value(i64 %xor167, !3587, !DIExpression(), !3529)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3693
    #dbg_value(i64 %xor172, !3553, !DIExpression(), !3529)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3694
    #dbg_value(i64 %xor175, !3589, !DIExpression(), !3529)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3695
    #dbg_value(i64 %xor168, !3541, !DIExpression(), !3529)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3696
    #dbg_value(i64 %xor171, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not184 = xor i64 %xor171, -1, !dbg !3697
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and185 = and i64 %xor175, %not184, !dbg !3698
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor186 = xor i64 %xor167, %and185, !dbg !3699
    #dbg_value(i64 %xor186, !3612, !DIExpression(), !3529)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3700
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3701
    #dbg_value(i64 %xor199, !3535, !DIExpression(), !3529)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3702
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not219 = xor i64 %xor206, -1, !dbg !3703
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and220 = and i64 %xor210, %not219, !dbg !3704
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor221 = xor i64 %xor202, %and220, !dbg !3705
    #dbg_value(i64 %xor221, !3617, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3706
    #dbg_value(i64 %xor237, !3587, !DIExpression(), !3529)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3707
    #dbg_value(i64 %xor75, !3579, !DIExpression(), !3529)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3708
    #dbg_value(i64 %xor78, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3709
    #dbg_value(i64 %xor71, !3567, !DIExpression(), !3529)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3710
    #dbg_value(i64 %xor74, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not85 = xor i64 %xor74, -1, !dbg !3711
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and86 = and i64 %xor78, %not85, !dbg !3712
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor87 = xor i64 %xor70, %and86, !dbg !3713
    #dbg_value(i64 %xor87, !3599, !DIExpression(), !3529)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3714
    #dbg_value(i64 %xor110, !3575, !DIExpression(), !3529)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3715
    #dbg_value(i64 %xor113, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3716
    #dbg_value(i64 %xor106, !3563, !DIExpression(), !3529)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3717
    #dbg_value(i64 %xor109, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not120 = xor i64 %xor109, -1, !dbg !3718
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and121 = and i64 %xor113, %not120, !dbg !3719
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor122 = xor i64 %xor105, %and121, !dbg !3720
    #dbg_value(i64 %xor122, !3604, !DIExpression(), !3529)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3721
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3722
    #dbg_value(i64 %xor145, !3571, !DIExpression(), !3529)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3723
    #dbg_value(i64 %xor148, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3724
    #dbg_value(i64 %xor141, !3569, !DIExpression(), !3529)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3725
    #dbg_value(i64 %xor144, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not155 = xor i64 %xor144, -1, !dbg !3726
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and156 = and i64 %xor148, %not155, !dbg !3727
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor157 = xor i64 %xor140, %and156, !dbg !3728
    #dbg_value(i64 %xor157, !3609, !DIExpression(), !3529)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3729
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3730
    #dbg_value(i64 %xor180, !3577, !DIExpression(), !3529)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3731
    #dbg_value(i64 %xor183, !3591, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3732
    #dbg_value(i64 %xor176, !3565, !DIExpression(), !3529)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3733
    #dbg_value(i64 %xor179, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %not190 = xor i64 %xor179, -1, !dbg !3734
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and191 = and i64 %xor183, %not190, !dbg !3735
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor192 = xor i64 %xor175, %and191, !dbg !3736
    #dbg_value(i64 %xor192, !3614, !DIExpression(), !3529)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3737
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3738
    #dbg_value(i64 %xor215, !3573, !DIExpression(), !3529)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3739
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not225 = xor i64 %xor214, -1, !dbg !3740
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and226 = and i64 %xor218, %not225, !dbg !3741
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor227 = xor i64 %xor210, %and226, !dbg !3742
    #dbg_value(i64 %xor227, !3619, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3589, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3743
    #dbg_value(i64 %xor245, !3589, !DIExpression(), !3529)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3744
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3593, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3745
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3618, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 %xor261, !3593, !DIExpression(), !3529)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3746
    #dbg_value(i64 %xor429, !3618, !DIExpression(), !3529)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3747
    #dbg_value(i64 %xor432, !3591, !DIExpression(), !3529)
  %not123 = xor i64 %xor113, -1, !dbg !3748
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and124 = and i64 %xor97, %not123, !dbg !3749
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor125 = xor i64 %xor109, %and124, !dbg !3750
    #dbg_value(i64 %xor125, !3605, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not91 = xor i64 %xor62, -1, !dbg !3751
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and92 = and i64 %xor66, %not91, !dbg !3752
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor93 = xor i64 %xor78, %and92, !dbg !3753
    #dbg_value(i64 %xor93, !3601, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not126 = xor i64 %xor97, -1, !dbg !3754
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and127 = and i64 %xor101, %not126, !dbg !3755
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor128 = xor i64 %xor113, %and127, !dbg !3756
    #dbg_value(i64 %xor128, !3606, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3757
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not161 = xor i64 %xor132, -1, !dbg !3758
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and162 = and i64 %xor136, %not161, !dbg !3759
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor163 = xor i64 %xor148, %and162, !dbg !3760
    #dbg_value(i64 %xor163, !3611, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3761
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not196 = xor i64 %xor167, -1, !dbg !3762
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and197 = and i64 %xor171, %not196, !dbg !3763
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor198 = xor i64 %xor183, %and197, !dbg !3764
    #dbg_value(i64 %xor198, !3616, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3765
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not231 = xor i64 %xor202, -1, !dbg !3766
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %and232 = and i64 %xor206, %not231, !dbg !3767
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor233 = xor i64 %xor218, %and232, !dbg !3768
    #dbg_value(i64 %xor233, !3621, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3591, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3769
    #dbg_value(i64 %xor253, !3591, !DIExpression(), !3529)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3770
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3595, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3771
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 %xor269, !3595, !DIExpression(), !3529)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3772
    #dbg_value(i64 %xor417, !3605, !DIExpression(), !3529)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3773
    #dbg_value(i64 %xor420, !3588, !DIExpression(), !3529)
  %not82 = xor i64 %xor70, -1, !dbg !3774
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and83 = and i64 %xor74, %not82, !dbg !3775
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor84 = xor i64 %xor66, %and83, !dbg !3776
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3598, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %not117 = xor i64 %xor105, -1, !dbg !3777
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and118 = and i64 %xor109, %not117, !dbg !3778
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor119 = xor i64 %xor101, %and118, !dbg !3779
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3603, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3780
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %not152 = xor i64 %xor140, -1, !dbg !3781
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and153 = and i64 %xor144, %not152, !dbg !3782
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor154 = xor i64 %xor136, %and153, !dbg !3783
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3608, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3784
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %not187 = xor i64 %xor175, -1, !dbg !3785
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and188 = and i64 %xor179, %not187, !dbg !3786
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor189 = xor i64 %xor171, %and188, !dbg !3787
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3613, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3788
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3588, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3789
    #dbg_value(i64 %xor241, !3588, !DIExpression(), !3529)
  %not88 = xor i64 %xor78, -1, !dbg !3790
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and89 = and i64 %xor62, %not88, !dbg !3791
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor90 = xor i64 %xor74, %and89, !dbg !3792
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3793
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not158 = xor i64 %xor148, -1, !dbg !3794
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and159 = and i64 %xor132, %not158, !dbg !3795
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor160 = xor i64 %xor144, %and159, !dbg !3796
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3610, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3797
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not193 = xor i64 %xor183, -1, !dbg !3798
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and194 = and i64 %xor167, %not193, !dbg !3799
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor195 = xor i64 %xor179, %and194, !dbg !3800
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3801
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %not228 = xor i64 %xor218, -1, !dbg !3802
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and229 = and i64 %xor202, %not228, !dbg !3803
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor230 = xor i64 %xor214, %and229, !dbg !3804
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3590, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3805
    #dbg_value(i64 %xor249, !3590, !DIExpression(), !3529)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3806
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3807
    #dbg_value(i64 %xor265, !3594, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3599, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3614, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3604, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3619, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3609, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3808
    #dbg_value(i64 %xor413, !3599, !DIExpression(), !3529)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3809
    #dbg_value(i64 %xor416, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not445 = xor i64 %xor416, -1, !dbg !3810
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and446 = and i64 %xor420, %not445, !dbg !3811
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3579, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor447 = xor i64 %xor432, %and446, !dbg !3812
    #dbg_value(i64 %xor447, !3579, !DIExpression(), !3529)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3813
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3592, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3814
    #dbg_value(i64 %xor257, !3592, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3617, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3607, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3587, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3612, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3815
    #dbg_value(i64 %xor425, !3612, !DIExpression(), !3529)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3816
    #dbg_value(i64 %xor428, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not442 = xor i64 %xor432, -1, !dbg !3817
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and443 = and i64 %xor416, %not442, !dbg !3818
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3577, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor444 = xor i64 %xor428, %and443, !dbg !3819
    #dbg_value(i64 %xor444, !3577, !DIExpression(), !3529)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3820
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3596, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3821
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3601, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3616, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3606, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(i64 %xor273, !3596, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3611, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3822
    #dbg_value(i64 %xor421, !3611, !DIExpression(), !3529)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3823
    #dbg_value(i64 %xor424, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not439 = xor i64 %xor428, -1, !dbg !3824
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and440 = and i64 %xor432, %not439, !dbg !3825
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3575, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor441 = xor i64 %xor424, %and440, !dbg !3826
    #dbg_value(i64 %xor441, !3575, !DIExpression(), !3529)
  %not436 = xor i64 %xor424, -1, !dbg !3827
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and437 = and i64 %xor428, %not436, !dbg !3828
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3573, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor438 = xor i64 %xor420, %and437, !dbg !3829
    #dbg_value(i64 %xor438, !3573, !DIExpression(), !3529)
  %not433 = xor i64 %xor420, -1, !dbg !3830
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and434 = and i64 %xor424, %not433, !dbg !3831
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3571, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor435 = xor i64 %xor416, %and434, !dbg !3832
    #dbg_value(i64 %xor435, !3571, !DIExpression(), !3529)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3833
    #dbg_value(i64 %xor394, !3620, !DIExpression(), !3529)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3834
    #dbg_value(i64 %xor397, !3591, !DIExpression(), !3529)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3835
    #dbg_value(i64 %xor382, !3602, !DIExpression(), !3529)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3836
    #dbg_value(i64 %xor385, !3588, !DIExpression(), !3529)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3837
    #dbg_value(i64 %xor378, !3601, !DIExpression(), !3529)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3838
    #dbg_value(i64 %xor381, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not410 = xor i64 %xor381, -1, !dbg !3839
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and411 = and i64 %xor385, %not410, !dbg !3840
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3569, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor412 = xor i64 %xor397, %and411, !dbg !3841
    #dbg_value(i64 %xor412, !3569, !DIExpression(), !3529)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3842
    #dbg_value(i64 %xor390, !3614, !DIExpression(), !3529)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3843
    #dbg_value(i64 %xor393, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not407 = xor i64 %xor397, -1, !dbg !3844
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and408 = and i64 %xor381, %not407, !dbg !3845
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3567, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor409 = xor i64 %xor393, %and408, !dbg !3846
    #dbg_value(i64 %xor409, !3567, !DIExpression(), !3529)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3847
    #dbg_value(i64 %xor386, !3608, !DIExpression(), !3529)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3848
    #dbg_value(i64 %xor389, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not404 = xor i64 %xor393, -1, !dbg !3849
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and405 = and i64 %xor397, %not404, !dbg !3850
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3565, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor406 = xor i64 %xor389, %and405, !dbg !3851
    #dbg_value(i64 %xor406, !3565, !DIExpression(), !3529)
  %not401 = xor i64 %xor389, -1, !dbg !3852
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and402 = and i64 %xor393, %not401, !dbg !3853
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3563, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor403 = xor i64 %xor385, %and402, !dbg !3854
    #dbg_value(i64 %xor403, !3563, !DIExpression(), !3529)
  %not398 = xor i64 %xor385, -1, !dbg !3855
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and399 = and i64 %xor389, %not398, !dbg !3856
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3561, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor400 = xor i64 %xor381, %and399, !dbg !3857
    #dbg_value(i64 %xor400, !3561, !DIExpression(), !3529)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3858
    #dbg_value(i64 %xor359, !3617, !DIExpression(), !3529)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3859
    #dbg_value(i64 %xor362, !3591, !DIExpression(), !3529)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3860
    #dbg_value(i64 %xor347, !3604, !DIExpression(), !3529)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3861
    #dbg_value(i64 %xor350, !3588, !DIExpression(), !3529)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3862
    #dbg_value(i64 %xor343, !3598, !DIExpression(), !3529)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3863
    #dbg_value(i64 %xor346, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not375 = xor i64 %xor346, -1, !dbg !3864
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and376 = and i64 %xor350, %not375, !dbg !3865
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3559, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor377 = xor i64 %xor362, %and376, !dbg !3866
    #dbg_value(i64 %xor377, !3559, !DIExpression(), !3529)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3867
    #dbg_value(i64 %xor355, !3616, !DIExpression(), !3529)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3868
    #dbg_value(i64 %xor358, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not372 = xor i64 %xor362, -1, !dbg !3869
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and373 = and i64 %xor346, %not372, !dbg !3870
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3557, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor374 = xor i64 %xor358, %and373, !dbg !3871
    #dbg_value(i64 %xor374, !3557, !DIExpression(), !3529)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3872
    #dbg_value(i64 %xor351, !3610, !DIExpression(), !3529)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3873
    #dbg_value(i64 %xor354, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not369 = xor i64 %xor358, -1, !dbg !3874
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and370 = and i64 %xor362, %not369, !dbg !3875
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3555, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor371 = xor i64 %xor354, %and370, !dbg !3876
    #dbg_value(i64 %xor371, !3555, !DIExpression(), !3529)
  %not366 = xor i64 %xor354, -1, !dbg !3877
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and367 = and i64 %xor358, %not366, !dbg !3878
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3553, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor368 = xor i64 %xor350, %and367, !dbg !3879
    #dbg_value(i64 %xor368, !3553, !DIExpression(), !3529)
  %not363 = xor i64 %xor350, -1, !dbg !3880
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and364 = and i64 %xor354, %not363, !dbg !3881
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor365 = xor i64 %xor346, %and364, !dbg !3882
    #dbg_value(i64 %xor365, !3551, !DIExpression(), !3529)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3883
    #dbg_value(i64 %xor324, !3619, !DIExpression(), !3529)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3884
    #dbg_value(i64 %xor327, !3591, !DIExpression(), !3529)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3885
    #dbg_value(i64 %xor312, !3606, !DIExpression(), !3529)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3886
    #dbg_value(i64 %xor315, !3588, !DIExpression(), !3529)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3887
    #dbg_value(i64 %xor308, !3600, !DIExpression(), !3529)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3888
    #dbg_value(i64 %xor311, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not340 = xor i64 %xor311, -1, !dbg !3889
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and341 = and i64 %xor315, %not340, !dbg !3890
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor342 = xor i64 %xor327, %and341, !dbg !3891
    #dbg_value(i64 %xor342, !3549, !DIExpression(), !3529)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3892
    #dbg_value(i64 %xor320, !3613, !DIExpression(), !3529)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3893
    #dbg_value(i64 %xor323, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not337 = xor i64 %xor327, -1, !dbg !3894
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and338 = and i64 %xor311, %not337, !dbg !3895
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor339 = xor i64 %xor323, %and338, !dbg !3896
    #dbg_value(i64 %xor339, !3547, !DIExpression(), !3529)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3897
    #dbg_value(i64 %xor316, !3607, !DIExpression(), !3529)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3898
    #dbg_value(i64 %xor319, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not334 = xor i64 %xor323, -1, !dbg !3899
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and335 = and i64 %xor327, %not334, !dbg !3900
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor336 = xor i64 %xor319, %and335, !dbg !3901
    #dbg_value(i64 %xor336, !3545, !DIExpression(), !3529)
  %not331 = xor i64 %xor319, -1, !dbg !3902
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and332 = and i64 %xor323, %not331, !dbg !3903
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor333 = xor i64 %xor315, %and332, !dbg !3904
    #dbg_value(i64 %xor333, !3543, !DIExpression(), !3529)
  %not328 = xor i64 %xor315, -1, !dbg !3905
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and329 = and i64 %xor319, %not328, !dbg !3906
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3541, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor330 = xor i64 %xor311, %and329, !dbg !3907
    #dbg_value(i64 %xor330, !3541, !DIExpression(), !3529)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3908
    #dbg_value(i64 %xor287, !3621, !DIExpression(), !3529)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3909
    #dbg_value(i64 %xor290, !3591, !DIExpression(), !3529)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3910
    #dbg_value(i64 %xor275, !3603, !DIExpression(), !3529)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3911
    #dbg_value(i64 %xor278, !3588, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3912
    #dbg_value(i64 %xor274, !3597, !DIExpression(), !3529)
    #dbg_value(i64 %xor274, !3587, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not305 = xor i64 %xor274, -1, !dbg !3913
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and306 = and i64 %xor278, %not305, !dbg !3914
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3539, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor307 = xor i64 %xor290, %and306, !dbg !3915
    #dbg_value(i64 %xor307, !3539, !DIExpression(), !3529)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3916
    #dbg_value(i64 %xor283, !3615, !DIExpression(), !3529)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3917
    #dbg_value(i64 %xor286, !3590, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not302 = xor i64 %xor290, -1, !dbg !3918
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and303 = and i64 %xor274, %not302, !dbg !3919
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3537, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor304 = xor i64 %xor286, %and303, !dbg !3920
    #dbg_value(i64 %xor304, !3537, !DIExpression(), !3529)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3921
    #dbg_value(i64 %xor279, !3609, !DIExpression(), !3529)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3922
    #dbg_value(i64 %xor282, !3589, !DIExpression(), !3529)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %not299 = xor i64 %xor286, -1, !dbg !3923
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and300 = and i64 %xor290, %not299, !dbg !3924
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3535, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor301 = xor i64 %xor282, %and300, !dbg !3925
    #dbg_value(i64 %xor301, !3535, !DIExpression(), !3529)
  %not296 = xor i64 %xor282, -1, !dbg !3926
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3529)
  %and297 = and i64 %xor286, %not296, !dbg !3927
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %xor298 = xor i64 %xor278, %and297, !dbg !3928
    #dbg_value(i64 %xor298, !3533, !DIExpression(), !3529)
  %add = or disjoint i32 %round.0, 1, !dbg !3929
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3930
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3930
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %not291 = xor i64 %xor278, -1, !dbg !3931
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %and292 = and i64 %xor282, %not291, !dbg !3932
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3531, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3529)
  %28 = xor i64 %and292, %27, !dbg !3933
  %xor295 = xor i64 %28, %xor274, !dbg !3933
    #dbg_value(i64 %xor295, !3531, !DIExpression(), !3529)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3934
    #dbg_value(i32 %add448, !3580, !DIExpression(), !3529)
  br label %for.cond, !dbg !3935, !llvm.loop !3936

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3529
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3529
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3529
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3529
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3529
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3529
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3529
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3529
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3529
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3529
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3529
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3529
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3529
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3529
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3529
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3529
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3529
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3529
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3529
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3529
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3529
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3529
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3529
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3529
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3529
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3938
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3939
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3940
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3941
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3942
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3943
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3944
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3945
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3946
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3947
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3948
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3949
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3950
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3951
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3952
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3953
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3954
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3955
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3956
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3957
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3958
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3959
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3960
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3961
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3962
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3963
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3964
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3965
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3966
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3967
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3968
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3969
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3970
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3971
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3972
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3973
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3974
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3975
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3976
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3977
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3978
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3979
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3980
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3981
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3982
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3983
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3984
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3985
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3986
  ret void, !dbg !3987
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3988 {
entry:
    #dbg_value(ptr %state, !3989, !DIExpression(), !3990)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3991
  %0 = load i32, ptr %pos, align 8, !dbg !3991
    #dbg_value(ptr %state, !3992, !DIExpression(), !3996)
    #dbg_value(i32 %0, !3998, !DIExpression(), !3996)
    #dbg_value(i32 168, !3999, !DIExpression(), !3996)
    #dbg_value(i8 31, !4000, !DIExpression(), !3996)
  %rem.i = shl i32 %0, 3, !dbg !4001
  %mul.i = and i32 %rem.i, 56, !dbg !4001
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4002
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4002
  %div2.i = lshr i32 %0, 3, !dbg !4003
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !4004
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !4005
  %xor.i = xor i64 %1, %shl.i, !dbg !4005
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !4005
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !4006
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !4007
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !4007
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4007
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4008
  store i32 168, ptr %pos1, align 8, !dbg !4009
  ret void, !dbg !4010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !4011 {
entry:
    #dbg_value(ptr %out, !4012, !DIExpression(), !4013)
    #dbg_value(i32 %outlen, !4014, !DIExpression(), !4013)
    #dbg_value(ptr %state, !4015, !DIExpression(), !4013)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4016
  %0 = load i32, ptr %pos, align 8, !dbg !4016
    #dbg_value(ptr %out, !902, !DIExpression(), !4017)
    #dbg_value(i32 %outlen, !908, !DIExpression(), !4017)
    #dbg_value(ptr %state, !909, !DIExpression(), !4017)
    #dbg_value(i32 %0, !910, !DIExpression(), !4017)
    #dbg_value(i32 168, !911, !DIExpression(), !4017)
  br label %while.cond.i, !dbg !4019

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !902, !DIExpression(), !4017)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !4017)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !4017)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4019
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4019

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !4020
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !4020

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4021
    #dbg_value(i32 0, !910, !DIExpression(), !4017)
  br label %if.end.i, !dbg !4022

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !4017)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !4017)
  br label %for.cond.i, !dbg !4023

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !4024
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !4017)
    #dbg_value(i32 %i.0.i, !919, !DIExpression(), !4017)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !4025
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4026
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !4026
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4026
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !4027

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !4028
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4029
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !4029
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4030
  %mul.i = and i32 %rem.i, 56, !dbg !4030
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4031
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !4031
  %conv.i = trunc i64 %shr.i to i8, !dbg !4029
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4017)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4032
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4033
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !4017)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4034
    #dbg_value(i32 %inc.i, !919, !DIExpression(), !4017)
  br label %for.cond.i, !dbg !4035, !llvm.loop !4036

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !4024
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !4038
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4039
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !4017)
    #dbg_value(i32 %i.0.i.lcssa, !910, !DIExpression(), !4017)
  br label %while.cond.i, !dbg !4019, !llvm.loop !4040

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4042
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !4043
  ret void, !dbg !4044
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !563 {
entry:
    #dbg_value(ptr %state, !562, !DIExpression(), !4045)
    #dbg_value(ptr %in, !574, !DIExpression(), !4045)
    #dbg_value(i32 %inlen, !575, !DIExpression(), !4045)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4046
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4047
  store i32 168, ptr %pos, align 8, !dbg !4048
  ret void, !dbg !4049
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !4050 {
entry:
    #dbg_value(ptr %s, !4053, !DIExpression(), !4054)
    #dbg_value(i32 %r, !4055, !DIExpression(), !4054)
    #dbg_value(ptr %in, !4056, !DIExpression(), !4054)
    #dbg_value(i32 %inlen, !4057, !DIExpression(), !4054)
    #dbg_value(i8 %p, !4058, !DIExpression(), !4054)
    #dbg_value(i32 0, !4059, !DIExpression(), !4054)
  br label %for.cond, !dbg !4060

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4062
    #dbg_value(i32 %i.0, !4059, !DIExpression(), !4054)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !4063
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !4065

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !4066
  br label %while.cond, !dbg !4066

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !4067
  store i64 0, ptr %arrayidx, align 8, !dbg !4068
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4069
    #dbg_value(i32 %inc, !4059, !DIExpression(), !4054)
  br label %for.cond, !dbg !4070, !llvm.loop !4071

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !4057, !DIExpression(), !4054)
    #dbg_value(ptr %in.addr.0, !4056, !DIExpression(), !4054)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !4073
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !4066

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !4074

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !4077

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !4079
    #dbg_value(i32 %i.1, !4059, !DIExpression(), !4054)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !4080
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !4074

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !4082
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !4083
    #dbg_value(ptr %add.ptr, !4084, !DIExpression(), !4088)
    #dbg_value(i64 0, !4090, !DIExpression(), !4088)
    #dbg_value(i32 0, !4091, !DIExpression(), !4088)
  br label %for.cond.i, !dbg !4092

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !4094
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !4088
    #dbg_value(i64 %r.0.i, !4090, !DIExpression(), !4088)
    #dbg_value(i32 %i.0.i, !4091, !DIExpression(), !4088)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !4095
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !4097

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4088)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4098
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !4098
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4088)
  %conv.i = zext i8 %1 to i64, !dbg !4099
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4088)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4100
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4088)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4101
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !4088)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !4101
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !4090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !4088)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !4102
    #dbg_value(i64 %or.i, !4090, !DIExpression(), !4088)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4103
    #dbg_value(i32 %inc.i, !4091, !DIExpression(), !4088)
  br label %for.cond.i, !dbg !4104, !llvm.loop !4105

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !4088
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !4107
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !4108
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !4108
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !4108
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !4109
    #dbg_value(i32 %inc7, !4059, !DIExpression(), !4054)
  br label %for.cond2, !dbg !4110, !llvm.loop !4111

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !4113
    #dbg_value(ptr %add.ptr9, !4056, !DIExpression(), !4054)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !4114
    #dbg_value(i32 %sub, !4057, !DIExpression(), !4054)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !4115
  br label %while.cond, !dbg !4066, !llvm.loop !4116

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !4118
    #dbg_value(i32 %i.2, !4059, !DIExpression(), !4054)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !4119
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !4077

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !4121
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !4121
  %conv = zext i8 %3 to i64, !dbg !4122
  %rem = shl i32 %i.2, 3, !dbg !4123
  %mul14 = and i32 %rem, 56, !dbg !4123
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !4124
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !4124
  %div153 = lshr i32 %i.2, 3, !dbg !4125
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !4126
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !4127
  %xor17 = xor i64 %4, %shl, !dbg !4127
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !4127
  %inc19 = add i32 %i.2, 1, !dbg !4128
    #dbg_value(i32 %inc19, !4059, !DIExpression(), !4054)
  br label %for.cond10, !dbg !4129, !llvm.loop !4130

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !4118
  %conv21 = zext i8 %p to i64, !dbg !4132
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !4133
  %mul23 = and i32 %rem22, 56, !dbg !4133
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !4134
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !4134
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !4135
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !4136
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !4137
  %xor28 = xor i64 %5, %shl25, !dbg !4137
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !4137
  %sub29 = add i32 %r, -1, !dbg !4138
  %div302 = lshr i32 %sub29, 3, !dbg !4139
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !4140
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !4141
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !4141
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !4141
  ret void, !dbg !4142
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !596 {
entry:
    #dbg_value(ptr %out, !595, !DIExpression(), !4143)
    #dbg_value(i32 %nblocks, !601, !DIExpression(), !4143)
    #dbg_value(ptr %state, !602, !DIExpression(), !4143)
    #dbg_value(ptr %out, !603, !DIExpression(), !4144)
    #dbg_value(i32 %nblocks, !610, !DIExpression(), !4144)
    #dbg_value(ptr %state, !611, !DIExpression(), !4144)
    #dbg_value(i32 168, !612, !DIExpression(), !4144)
  br label %while.cond.i, !dbg !4146

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4144)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4144)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4146
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4146

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4147
    #dbg_value(i32 0, !616, !DIExpression(), !4144)
  br label %for.cond.i, !dbg !4148

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4149
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4144)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !4150
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4151

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4152
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4153
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4154
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4154
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4155)
    #dbg_value(i64 %0, !632, !DIExpression(), !4155)
    #dbg_value(i32 0, !633, !DIExpression(), !4155)
  br label %for.cond.i.i, !dbg !4157

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4158
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4155)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4159
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4160

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4161
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4162
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4162
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4163
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4164
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4165
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4166
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4155)
  br label %for.cond.i.i, !dbg !4167, !llvm.loop !4168

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4170
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4144)
  br label %for.cond.i, !dbg !4171, !llvm.loop !4172

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4174
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4144)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4175
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4144)
  br label %while.cond.i, !dbg !4146, !llvm.loop !4176

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4178
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4179 {
entry:
    #dbg_value(ptr %state, !4180, !DIExpression(), !4181)
    #dbg_value(ptr %state, !3440, !DIExpression(), !4182)
    #dbg_value(i32 0, !3446, !DIExpression(), !4182)
  br label %for.cond.i, !dbg !4184

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4185
    #dbg_value(i32 %i.0.i, !3446, !DIExpression(), !4182)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4186
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4187

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4188
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4189
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4190
    #dbg_value(i32 %inc.i, !3446, !DIExpression(), !4182)
  br label %for.cond.i, !dbg !4191, !llvm.loop !4192

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4194
  store i32 0, ptr %pos, align 8, !dbg !4195
  ret void, !dbg !4196
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4197 {
entry:
    #dbg_value(ptr %state, !4198, !DIExpression(), !4199)
    #dbg_value(ptr %in, !4200, !DIExpression(), !4199)
    #dbg_value(i32 %inlen, !4201, !DIExpression(), !4199)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4202
  %0 = load i32, ptr %pos, align 8, !dbg !4202
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !4203
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4204
  store i32 %call, ptr %pos1, align 8, !dbg !4205
  ret void, !dbg !4206
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !4207 {
entry:
    #dbg_value(ptr %state, !4208, !DIExpression(), !4209)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4210
  %0 = load i32, ptr %pos, align 8, !dbg !4210
    #dbg_value(ptr %state, !3992, !DIExpression(), !4211)
    #dbg_value(i32 %0, !3998, !DIExpression(), !4211)
    #dbg_value(i32 136, !3999, !DIExpression(), !4211)
    #dbg_value(i8 31, !4000, !DIExpression(), !4211)
  %rem.i = shl i32 %0, 3, !dbg !4213
  %mul.i = and i32 %rem.i, 56, !dbg !4213
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4214
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4214
  %div2.i = lshr i32 %0, 3, !dbg !4215
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !4216
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !4217
  %xor.i = xor i64 %1, %shl.i, !dbg !4217
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !4217
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !4218
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !4219
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !4219
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4219
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4220
  store i32 136, ptr %pos1, align 8, !dbg !4221
  ret void, !dbg !4222
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !896 {
entry:
    #dbg_value(ptr %out, !895, !DIExpression(), !4223)
    #dbg_value(i32 %outlen, !899, !DIExpression(), !4223)
    #dbg_value(ptr %state, !900, !DIExpression(), !4223)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4224
  %0 = load i32, ptr %pos, align 8, !dbg !4224
    #dbg_value(ptr %out, !902, !DIExpression(), !4225)
    #dbg_value(i32 %outlen, !908, !DIExpression(), !4225)
    #dbg_value(ptr %state, !909, !DIExpression(), !4225)
    #dbg_value(i32 %0, !910, !DIExpression(), !4225)
    #dbg_value(i32 136, !911, !DIExpression(), !4225)
  br label %while.cond.i, !dbg !4227

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !902, !DIExpression(), !4225)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !4225)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !4225)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4227
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4227

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !4228
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !4228

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4229
    #dbg_value(i32 0, !910, !DIExpression(), !4225)
  br label %if.end.i, !dbg !4230

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !4225)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !4225)
  br label %for.cond.i, !dbg !4231

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !4232
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !4225)
    #dbg_value(i32 %i.0.i, !919, !DIExpression(), !4225)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !4233
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4234
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !4234
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4234
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !4235

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !4236
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4237
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !4237
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4238
  %mul.i = and i32 %rem.i, 56, !dbg !4238
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4239
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !4239
  %conv.i = trunc i64 %shr.i to i8, !dbg !4237
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4225)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4240
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4241
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !4225)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4242
    #dbg_value(i32 %inc.i, !919, !DIExpression(), !4225)
  br label %for.cond.i, !dbg !4243, !llvm.loop !4244

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !4232
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !4246
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4247
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !4225)
    #dbg_value(i32 %i.0.i.lcssa, !910, !DIExpression(), !4225)
  br label %while.cond.i, !dbg !4227, !llvm.loop !4248

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4250
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !4251
  ret void, !dbg !4252
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !834 {
entry:
    #dbg_value(ptr %state, !847, !DIExpression(), !4253)
    #dbg_value(ptr %in, !849, !DIExpression(), !4253)
    #dbg_value(i32 %inlen, !850, !DIExpression(), !4253)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4254
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4255
  store i32 136, ptr %pos, align 8, !dbg !4256
  ret void, !dbg !4257
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !855 {
entry:
    #dbg_value(ptr %out, !854, !DIExpression(), !4258)
    #dbg_value(i32 %nblocks, !858, !DIExpression(), !4258)
    #dbg_value(ptr %state, !859, !DIExpression(), !4258)
    #dbg_value(ptr %out, !603, !DIExpression(), !4259)
    #dbg_value(i32 %nblocks, !610, !DIExpression(), !4259)
    #dbg_value(ptr %state, !611, !DIExpression(), !4259)
    #dbg_value(i32 136, !612, !DIExpression(), !4259)
  br label %while.cond.i, !dbg !4261

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4259)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4259)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4261
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4261

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4262
    #dbg_value(i32 0, !616, !DIExpression(), !4259)
  br label %for.cond.i, !dbg !4263

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4264
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4259)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !4265
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4266

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4267
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4268
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4269
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4269
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4270)
    #dbg_value(i64 %0, !632, !DIExpression(), !4270)
    #dbg_value(i32 0, !633, !DIExpression(), !4270)
  br label %for.cond.i.i, !dbg !4272

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4273
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4270)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4274
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4275

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4276
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4277
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4277
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4278
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4279
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4280
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4281
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4270)
  br label %for.cond.i.i, !dbg !4282, !llvm.loop !4283

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4285
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4259)
  br label %for.cond.i, !dbg !4286, !llvm.loop !4287

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4289
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4259)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4290
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4259)
  br label %while.cond.i, !dbg !4261, !llvm.loop !4291

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4293
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4294 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4295, !DIExpression(), !4296)
    #dbg_value(i32 %outlen, !4297, !DIExpression(), !4296)
    #dbg_value(ptr %in, !4298, !DIExpression(), !4296)
    #dbg_value(i32 %inlen, !4299, !DIExpression(), !4296)
    #dbg_declare(ptr %state, !4300, !DIExpression(), !4301)
    #dbg_value(ptr %state, !562, !DIExpression(), !4302)
    #dbg_value(ptr %in, !574, !DIExpression(), !4302)
    #dbg_value(i32 %inlen, !575, !DIExpression(), !4302)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4304
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4305
  store i32 168, ptr %pos.i, align 8, !dbg !4306
  %div = udiv i32 %outlen, 168, !dbg !4307
    #dbg_value(i32 %div, !4308, !DIExpression(), !4296)
    #dbg_value(ptr %out, !595, !DIExpression(), !4309)
    #dbg_value(i32 %div, !601, !DIExpression(), !4309)
    #dbg_value(ptr %state, !602, !DIExpression(), !4309)
    #dbg_value(ptr %out, !603, !DIExpression(), !4311)
    #dbg_value(i32 %div, !610, !DIExpression(), !4311)
    #dbg_value(ptr %state, !611, !DIExpression(), !4311)
    #dbg_value(i32 168, !612, !DIExpression(), !4311)
  br label %while.cond.i, !dbg !4313

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4311)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4311)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4313
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4313

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4314
    #dbg_value(i32 0, !616, !DIExpression(), !4311)
  br label %for.cond.i, !dbg !4315

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4316
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4311)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !4317
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4318

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4319
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4320
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4321
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4321
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4322)
    #dbg_value(i64 %0, !632, !DIExpression(), !4322)
    #dbg_value(i32 0, !633, !DIExpression(), !4322)
  br label %for.cond.i.i, !dbg !4324

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4325
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4322)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4326
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4327

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4328
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4329
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4329
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4330
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4331
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4332
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4333
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4322)
  br label %for.cond.i.i, !dbg !4334, !llvm.loop !4335

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4337
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4311)
  br label %for.cond.i, !dbg !4338, !llvm.loop !4339

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4341
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4311)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4342
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4311)
  br label %while.cond.i, !dbg !4313, !llvm.loop !4343

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !4345
  %sub = add i32 %mul.neg, %outlen, !dbg !4346
    #dbg_value(i32 %sub, !4297, !DIExpression(), !4296)
  %mul1 = mul nuw i32 %div, 168, !dbg !4347
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4348
    #dbg_value(ptr %add.ptr, !4295, !DIExpression(), !4296)
    #dbg_value(ptr %add.ptr, !4012, !DIExpression(), !4349)
    #dbg_value(i32 %sub, !4014, !DIExpression(), !4349)
    #dbg_value(ptr %state, !4015, !DIExpression(), !4349)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4351
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4351
    #dbg_value(ptr %add.ptr, !902, !DIExpression(), !4352)
    #dbg_value(i32 %sub, !908, !DIExpression(), !4352)
    #dbg_value(ptr %state, !909, !DIExpression(), !4352)
    #dbg_value(i32 %1, !910, !DIExpression(), !4352)
    #dbg_value(i32 168, !911, !DIExpression(), !4352)
  br label %while.cond.i2, !dbg !4354

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !902, !DIExpression(), !4352)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !4352)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !4352)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4354
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4354

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !4355
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4355

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4356
    #dbg_value(i32 0, !910, !DIExpression(), !4352)
  br label %if.end.i, !dbg !4357

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !4352)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !4352)
  br label %for.cond.i7, !dbg !4358

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4359
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !4352)
    #dbg_value(i32 %i.0.i8, !919, !DIExpression(), !4352)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !4360
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4361
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4361
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4361
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4362

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4363
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4364
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4364
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4365
  %mul.i12 = and i32 %rem.i, 56, !dbg !4365
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4366
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4366
  %conv.i = trunc i64 %shr.i to i8, !dbg !4364
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4352)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4367
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4368
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !4352)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4369
    #dbg_value(i32 %inc.i13, !919, !DIExpression(), !4352)
  br label %for.cond.i7, !dbg !4370, !llvm.loop !4371

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4359
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4373
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4374
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !4352)
    #dbg_value(i32 %i.0.i8.lcssa, !910, !DIExpression(), !4352)
  br label %while.cond.i2, !dbg !4354, !llvm.loop !4375

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4377
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4378
  ret void, !dbg !4379
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !836 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !840, !DIExpression(), !4380)
    #dbg_value(i32 %outlen, !842, !DIExpression(), !4380)
    #dbg_value(ptr %in, !843, !DIExpression(), !4380)
    #dbg_value(i32 %inlen, !844, !DIExpression(), !4380)
    #dbg_declare(ptr %state, !845, !DIExpression(), !4381)
    #dbg_value(ptr %state, !847, !DIExpression(), !4382)
    #dbg_value(ptr %in, !849, !DIExpression(), !4382)
    #dbg_value(i32 %inlen, !850, !DIExpression(), !4382)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4384
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4385
  store i32 136, ptr %pos.i, align 8, !dbg !4386
  %div = udiv i32 %outlen, 136, !dbg !4387
    #dbg_value(i32 %div, !853, !DIExpression(), !4380)
    #dbg_value(ptr %out, !854, !DIExpression(), !4388)
    #dbg_value(i32 %div, !858, !DIExpression(), !4388)
    #dbg_value(ptr %state, !859, !DIExpression(), !4388)
    #dbg_value(ptr %out, !603, !DIExpression(), !4390)
    #dbg_value(i32 %div, !610, !DIExpression(), !4390)
    #dbg_value(ptr %state, !611, !DIExpression(), !4390)
    #dbg_value(i32 136, !612, !DIExpression(), !4390)
  br label %while.cond.i, !dbg !4392

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4390)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4390)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4392
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4392

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4393
    #dbg_value(i32 0, !616, !DIExpression(), !4390)
  br label %for.cond.i, !dbg !4394

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4395
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4390)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !4396
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4397

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4398
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4399
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4400
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4400
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4401)
    #dbg_value(i64 %0, !632, !DIExpression(), !4401)
    #dbg_value(i32 0, !633, !DIExpression(), !4401)
  br label %for.cond.i.i, !dbg !4403

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4404
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4401)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4405
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4406

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4407
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4408
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4408
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4409
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4410
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4411
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4412
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4401)
  br label %for.cond.i.i, !dbg !4413, !llvm.loop !4414

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4416
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4390)
  br label %for.cond.i, !dbg !4417, !llvm.loop !4418

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4420
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4390)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4421
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4390)
  br label %while.cond.i, !dbg !4392, !llvm.loop !4422

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !4424
  %sub = add i32 %mul.neg, %outlen, !dbg !4425
    #dbg_value(i32 %sub, !842, !DIExpression(), !4380)
  %mul1 = mul nuw i32 %div, 136, !dbg !4426
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4427
    #dbg_value(ptr %add.ptr, !840, !DIExpression(), !4380)
    #dbg_value(ptr %add.ptr, !895, !DIExpression(), !4428)
    #dbg_value(i32 %sub, !899, !DIExpression(), !4428)
    #dbg_value(ptr %state, !900, !DIExpression(), !4428)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4430
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4430
    #dbg_value(ptr %add.ptr, !902, !DIExpression(), !4431)
    #dbg_value(i32 %sub, !908, !DIExpression(), !4431)
    #dbg_value(ptr %state, !909, !DIExpression(), !4431)
    #dbg_value(i32 %1, !910, !DIExpression(), !4431)
    #dbg_value(i32 136, !911, !DIExpression(), !4431)
  br label %while.cond.i2, !dbg !4433

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !902, !DIExpression(), !4431)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !4431)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !4431)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4433
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4433

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4434
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4434

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4435
    #dbg_value(i32 0, !910, !DIExpression(), !4431)
  br label %if.end.i, !dbg !4436

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !4431)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !4431)
  br label %for.cond.i7, !dbg !4437

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4438
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !4431)
    #dbg_value(i32 %i.0.i8, !919, !DIExpression(), !4431)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !4439
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4440
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4440
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4440
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4441

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4442
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4443
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4443
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4444
  %mul.i12 = and i32 %rem.i, 56, !dbg !4444
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4445
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4445
  %conv.i = trunc i64 %shr.i to i8, !dbg !4443
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4431)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4446
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4447
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !4431)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4448
    #dbg_value(i32 %inc.i13, !919, !DIExpression(), !4431)
  br label %for.cond.i7, !dbg !4449, !llvm.loop !4450

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4438
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4452
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4453
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !4431)
    #dbg_value(i32 %i.0.i8.lcssa, !910, !DIExpression(), !4431)
  br label %while.cond.i2, !dbg !4433, !llvm.loop !4454

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4456
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4457
  ret void, !dbg !4458
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4459 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4462, !DIExpression(), !4463)
    #dbg_value(ptr %in, !4464, !DIExpression(), !4463)
    #dbg_value(i32 %inlen, !4465, !DIExpression(), !4463)
    #dbg_declare(ptr %s, !4466, !DIExpression(), !4467)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4468
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4469
    #dbg_value(i32 0, !4470, !DIExpression(), !4463)
  br label %for.cond, !dbg !4471

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4473
    #dbg_value(i32 %i.0, !4470, !DIExpression(), !4463)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4474
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4476

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4477
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4478
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4479
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4479
    #dbg_value(ptr %add.ptr, !626, !DIExpression(), !4480)
    #dbg_value(i64 %0, !632, !DIExpression(), !4480)
    #dbg_value(i32 0, !633, !DIExpression(), !4480)
  br label %for.cond.i, !dbg !4482

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4483
    #dbg_value(i32 %i.0.i, !633, !DIExpression(), !4480)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4484
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4485

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4486
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4487
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4487
  %conv.i = trunc i64 %shr.i to i8, !dbg !4488
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4489
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4490
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4491
    #dbg_value(i32 %inc.i, !633, !DIExpression(), !4480)
  br label %for.cond.i, !dbg !4492, !llvm.loop !4493

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4495
    #dbg_value(i32 %inc, !4470, !DIExpression(), !4463)
  br label %for.cond, !dbg !4496, !llvm.loop !4497

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4499
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4500 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4501, !DIExpression(), !4502)
    #dbg_value(ptr %in, !4503, !DIExpression(), !4502)
    #dbg_value(i32 %inlen, !4504, !DIExpression(), !4502)
    #dbg_declare(ptr %s, !4505, !DIExpression(), !4506)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4507
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4508
    #dbg_value(i32 0, !4509, !DIExpression(), !4502)
  br label %for.cond, !dbg !4510

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4512
    #dbg_value(i32 %i.0, !4509, !DIExpression(), !4502)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4513
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4515

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4516
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4517
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4518
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4518
    #dbg_value(ptr %add.ptr, !626, !DIExpression(), !4519)
    #dbg_value(i64 %0, !632, !DIExpression(), !4519)
    #dbg_value(i32 0, !633, !DIExpression(), !4519)
  br label %for.cond.i, !dbg !4521

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4522
    #dbg_value(i32 %i.0.i, !633, !DIExpression(), !4519)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4523
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4524

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4525
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4526
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4526
  %conv.i = trunc i64 %shr.i to i8, !dbg !4527
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4528
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4529
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4530
    #dbg_value(i32 %inc.i, !633, !DIExpression(), !4519)
  br label %for.cond.i, !dbg !4531, !llvm.loop !4532

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4534
    #dbg_value(i32 %inc, !4509, !DIExpression(), !4502)
  br label %for.cond, !dbg !4535, !llvm.loop !4536

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4538
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !537 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !548, !DIExpression(), !4539)
    #dbg_value(ptr %seed, !550, !DIExpression(), !4539)
    #dbg_value(i8 %x, !551, !DIExpression(), !4539)
    #dbg_value(i8 %y, !552, !DIExpression(), !4539)
    #dbg_declare(ptr %extseed, !553, !DIExpression(), !4540)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4541
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4542
  store i8 %x, ptr %arrayidx, align 1, !dbg !4543
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4544
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4545
    #dbg_value(ptr %state, !562, !DIExpression(), !4546)
    #dbg_value(ptr %extseed, !574, !DIExpression(), !4546)
    #dbg_value(i32 34, !575, !DIExpression(), !4546)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4548
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4549
  store i32 168, ptr %pos.i, align 8, !dbg !4550
  ret void, !dbg !4551
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !817 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !821, !DIExpression(), !4552)
    #dbg_value(i32 %outlen, !823, !DIExpression(), !4552)
    #dbg_value(ptr %key, !824, !DIExpression(), !4552)
    #dbg_value(i8 %nonce, !825, !DIExpression(), !4552)
    #dbg_declare(ptr %extkey, !826, !DIExpression(), !4553)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4554
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4555
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4556
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4557
  ret void, !dbg !4558
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4559 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4560, !DIExpression(), !4561)
    #dbg_value(ptr %key, !4562, !DIExpression(), !4561)
    #dbg_value(ptr %input, !4563, !DIExpression(), !4561)
    #dbg_declare(ptr %s, !4564, !DIExpression(), !4565)
    #dbg_value(ptr %s, !4180, !DIExpression(), !4566)
    #dbg_value(ptr %s, !3440, !DIExpression(), !4568)
    #dbg_value(i32 0, !3446, !DIExpression(), !4568)
  br label %for.cond.i, !dbg !4570

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4571
    #dbg_value(i32 %i.0.i, !3446, !DIExpression(), !4568)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4572
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4573

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4574
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4575
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4576
    #dbg_value(i32 %inc.i, !3446, !DIExpression(), !4568)
  br label %for.cond.i, !dbg !4577, !llvm.loop !4578

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4580
  store i32 0, ptr %pos.i, align 8, !dbg !4581
    #dbg_value(ptr %s, !4198, !DIExpression(), !4582)
    #dbg_value(ptr %key, !4200, !DIExpression(), !4582)
    #dbg_value(i32 32, !4201, !DIExpression(), !4582)
  %call.i8 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4584
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4585
  store i32 %call.i8, ptr %pos1.i9, align 8, !dbg !4586
    #dbg_value(ptr %s, !4198, !DIExpression(), !4587)
    #dbg_value(ptr %input, !4200, !DIExpression(), !4587)
    #dbg_value(i32 768, !4201, !DIExpression(), !4587)
  %call.i3 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i8, i32 noundef 136, ptr noundef %input, i32 noundef 768) #4, !dbg !4589
  %pos1.i4 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4590
  store i32 %call.i3, ptr %pos1.i4, align 8, !dbg !4591
    #dbg_value(ptr %s, !4208, !DIExpression(), !4592)
    #dbg_value(ptr %s, !3992, !DIExpression(), !4594)
    #dbg_value(i32 %call.i3, !3998, !DIExpression(), !4594)
    #dbg_value(i32 136, !3999, !DIExpression(), !4594)
    #dbg_value(i8 31, !4000, !DIExpression(), !4594)
  %rem.i = shl i32 %call.i3, 3, !dbg !4596
  %mul.i = and i32 %rem.i, 56, !dbg !4596
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4597
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4597
  %div2.i = lshr i32 %call.i3, 3, !dbg !4598
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4599
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4600
  %xor.i = xor i64 %0, %shl.i, !dbg !4600
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4600
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4601
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4602
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4602
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4602
  %pos1.i6 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4603
  store i32 136, ptr %pos1.i6, align 8, !dbg !4604
    #dbg_value(ptr %out, !895, !DIExpression(), !4605)
    #dbg_value(i32 32, !899, !DIExpression(), !4605)
    #dbg_value(ptr %s, !900, !DIExpression(), !4605)
    #dbg_value(ptr %out, !902, !DIExpression(), !4607)
    #dbg_value(i32 32, !908, !DIExpression(), !4607)
    #dbg_value(ptr %s, !909, !DIExpression(), !4607)
    #dbg_value(i32 136, !910, !DIExpression(), !4607)
    #dbg_value(i32 136, !911, !DIExpression(), !4607)
  br label %while.cond.i, !dbg !4609

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !902, !DIExpression(), !4607)
    #dbg_value(i32 %outlen.addr.0.i, !908, !DIExpression(), !4607)
    #dbg_value(i32 %pos.addr.0.i, !910, !DIExpression(), !4607)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4609
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4609

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4610
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4610

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4611
    #dbg_value(i32 0, !910, !DIExpression(), !4607)
  br label %if.end.i, !dbg !4612

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !910, !DIExpression(), !4607)
    #dbg_value(i32 %pos.addr.1.i, !919, !DIExpression(), !4607)
  br label %for.cond.i12, !dbg !4613

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4614
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(), !4607)
    #dbg_value(i32 %i.0.i13, !919, !DIExpression(), !4607)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4615
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4616
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4616
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4616
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4617

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4618
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4619
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4619
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4620
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4620
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4621
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4621
  %conv.i = trunc i64 %shr.i to i8, !dbg !4619
    #dbg_value(ptr %out.addr.1.i, !902, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4607)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4622
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4623
    #dbg_value(ptr %incdec.ptr.i, !902, !DIExpression(), !4607)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4624
    #dbg_value(i32 %inc.i19, !919, !DIExpression(), !4607)
  br label %for.cond.i12, !dbg !4625, !llvm.loop !4626

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4614
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4628
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4629
    #dbg_value(i32 %sub3.i, !908, !DIExpression(), !4607)
    #dbg_value(i32 %i.0.i13.lcssa, !910, !DIExpression(), !4607)
  br label %while.cond.i, !dbg !4609, !llvm.loop !4630

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4632
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4633
  ret void, !dbg !4634
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

!llvm.dbg.cu = !{!79, !41, !83, !84, !89, !93, !53, !95, !97, !99, !68, !100}
!llvm.ident = !{!101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101}
!llvm.module.flags = !{!102, !103, !104, !105}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 110, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 28)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 111, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 112, type: !3, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 12)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !18, isLocal: true, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 18)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(scope: null, file: !2, line: 90, type: !23, isLocal: true, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 208, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 26)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "fd", scope: !28, file: !29, line: 75, type: !50, isLocal: true, isDefinition: true)
!28 = distinct !DISubprogram(name: "randombytes", scope: !29, file: !29, line: 74, type: !30, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !41, retainedNodes: !49)
!29 = !DIFile(filename: "../../ref/randombytes.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32, !38}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !34, line: 24, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !36, line: 43, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!37 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 214, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!40 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!41 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !43, splitDebugInlining: false, nameTableKind: None)
!42 = !DIFile(filename: "../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!43 = !{!26, !44}
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !29, line: 79, type: !46, isLocal: true, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 13)
!49 = !{}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
!53 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !54, globals: !57, splitDebugInlining: false, nameTableKind: None)
!54 = !{!55}
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !34, line: 44, baseType: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !36, line: 77, baseType: !50)
!57 = !{!51}
!58 = !DIFile(filename: "../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2048, elements: !64)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !34, line: 32, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !36, line: 55, baseType: !63)
!63 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!64 = !{!65}
!65 = !DISubrange(count: 128)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !68, file: !74, line: 48, type: !75, isLocal: true, isDefinition: true)
!68 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !73, splitDebugInlining: false, nameTableKind: None)
!69 = !{!70}
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !34, line: 60, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !36, line: 105, baseType: !72)
!72 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!73 = !{!66}
!74 = !DIFile(filename: "../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 1536, elements: !77)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!77 = !{!78}
!78 = !DISubrange(count: 24)
!79 = distinct !DICompileUnit(language: DW_LANG_C11, file: !80, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !81, globals: !82, splitDebugInlining: false, nameTableKind: None)
!80 = !DIFile(filename: "../../ref/test/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!81 = !{!32}
!82 = !{!0, !7, !9, !11, !16, !21}
!83 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!84 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !85, splitDebugInlining: false, nameTableKind: None)
!85 = !{!86}
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !34, line: 36, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !36, line: 57, baseType: !88)
!88 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!89 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !90, splitDebugInlining: false, nameTableKind: None)
!90 = !{!61, !86, !91}
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !34, line: 48, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !36, line: 79, baseType: !40)
!93 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !94, splitDebugInlining: false, nameTableKind: None)
!94 = !{!86, !61, !55}
!95 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !96, splitDebugInlining: false, nameTableKind: None)
!96 = !{!91}
!97 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !98, splitDebugInlining: false, nameTableKind: None)
!98 = !{!61, !55}
!99 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, splitDebugInlining: false, nameTableKind: None)
!100 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!101 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!102 = !{i32 2, !"Debug Info Version", i32 3}
!103 = !{i32 1, !"wchar_size", i32 4}
!104 = !{i32 1, !"min_enum_size", i32 4}
!105 = !{i32 1, !"Code Model", i32 1}
!106 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 97, type: !107, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !49)
!107 = !DISubroutineType(types: !108)
!108 = !{!50}
!109 = !DILocalVariable(name: "i", scope: !106, file: !2, line: 99, type: !40)
!110 = !DILocation(line: 0, scope: !106)
!111 = !DILocation(line: 102, column: 7, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !2, line: 102, column: 3)
!113 = !DILocation(line: 102, scope: !112)
!114 = !DILocation(line: 102, column: 12, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !2, line: 102, column: 3)
!116 = !DILocation(line: 102, column: 3, scope: !112)
!117 = !DILocation(line: 54, column: 3, scope: !118, inlinedAt: !122)
!118 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !119, file: !119, line: 50, type: !120, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!119 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!120 = !DISubroutineType(types: !121)
!121 = !{!50, !32, !32}
!122 = distinct !DILocation(line: 18, column: 3, scope: !123, inlinedAt: !124)
!123 = distinct !DISubprogram(name: "test_keys", scope: !2, file: !2, line: 9, type: !107, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!124 = distinct !DILocation(line: 103, column: 10, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !2, line: 102, column: 25)
!126 = !DILocalVariable(name: "pk", scope: !123, file: !2, line: 11, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6400, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 800)
!130 = !DILocation(line: 11, column: 11, scope: !123, inlinedAt: !124)
!131 = !DILocalVariable(name: "sk", scope: !123, file: !2, line: 12, type: !132)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 13056, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 1632)
!135 = !DILocation(line: 12, column: 11, scope: !123, inlinedAt: !124)
!136 = !DILocalVariable(name: "ct", scope: !123, file: !2, line: 13, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6144, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 768)
!140 = !DILocation(line: 13, column: 11, scope: !123, inlinedAt: !124)
!141 = !DILocalVariable(name: "key_a", scope: !123, file: !2, line: 14, type: !142)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 32)
!145 = !DILocation(line: 14, column: 11, scope: !123, inlinedAt: !124)
!146 = !DILocalVariable(name: "key_b", scope: !123, file: !2, line: 15, type: !142)
!147 = !DILocation(line: 15, column: 11, scope: !123, inlinedAt: !124)
!148 = !DILocalVariable(name: "pk", arg: 1, scope: !118, file: !119, line: 50, type: !32)
!149 = !DILocation(line: 0, scope: !118, inlinedAt: !122)
!150 = !DILocalVariable(name: "sk", arg: 2, scope: !118, file: !119, line: 51, type: !32)
!151 = !DILocalVariable(name: "coins", scope: !118, file: !119, line: 53, type: !152)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 64)
!155 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !122)
!156 = !DILocalVariable(name: "pk", arg: 1, scope: !157, file: !119, line: 25, type: !32)
!157 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !119, file: !119, line: 25, type: !158, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!158 = !DISubroutineType(types: !159)
!159 = !{!50, !32, !32, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!162 = !DILocation(line: 0, scope: !157, inlinedAt: !163)
!163 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !122)
!164 = !DILocalVariable(name: "sk", arg: 2, scope: !157, file: !119, line: 26, type: !32)
!165 = !DILocalVariable(name: "coins", arg: 3, scope: !157, file: !119, line: 27, type: !160)
!166 = !DILocation(line: 29, column: 3, scope: !157, inlinedAt: !163)
!167 = !DILocation(line: 30, column: 12, scope: !157, inlinedAt: !163)
!168 = !DILocation(line: 30, column: 3, scope: !157, inlinedAt: !163)
!169 = !DILocation(line: 31, column: 3, scope: !157, inlinedAt: !163)
!170 = !DILocation(line: 33, column: 33, scope: !157, inlinedAt: !163)
!171 = !DILocation(line: 33, column: 55, scope: !157, inlinedAt: !163)
!172 = !DILocation(line: 33, column: 3, scope: !157, inlinedAt: !163)
!173 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !122)
!174 = !DILocation(line: 118, column: 3, scope: !175, inlinedAt: !176)
!175 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !119, file: !119, line: 113, type: !158, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!176 = distinct !DILocation(line: 21, column: 3, scope: !123, inlinedAt: !124)
!177 = !DILocalVariable(name: "ct", arg: 1, scope: !175, file: !119, line: 113, type: !32)
!178 = !DILocation(line: 0, scope: !175, inlinedAt: !176)
!179 = !DILocalVariable(name: "ss", arg: 2, scope: !175, file: !119, line: 114, type: !32)
!180 = !DILocalVariable(name: "pk", arg: 3, scope: !175, file: !119, line: 115, type: !160)
!181 = !DILocalVariable(name: "coins", scope: !175, file: !119, line: 117, type: !142)
!182 = !DILocation(line: 117, column: 11, scope: !175, inlinedAt: !176)
!183 = !DILocation(line: 119, column: 3, scope: !175, inlinedAt: !176)
!184 = !DILocation(line: 120, column: 3, scope: !175, inlinedAt: !176)
!185 = !DILocation(line: 24, column: 3, scope: !123, inlinedAt: !124)
!186 = !DILocation(line: 26, column: 6, scope: !187, inlinedAt: !124)
!187 = distinct !DILexicalBlock(scope: !123, file: !2, line: 26, column: 6)
!188 = !DILocation(line: 27, column: 5, scope: !189, inlinedAt: !124)
!189 = distinct !DILexicalBlock(scope: !187, file: !2, line: 26, column: 42)
!190 = !DILocation(line: 28, column: 5, scope: !189, inlinedAt: !124)
!191 = !DILocation(line: 0, scope: !123, inlinedAt: !124)
!192 = !DILocation(line: 32, column: 1, scope: !123, inlinedAt: !124)
!193 = !DILocalVariable(name: "r", scope: !106, file: !2, line: 100, type: !50)
!194 = !DILocation(line: 54, column: 3, scope: !118, inlinedAt: !195)
!195 = distinct !DILocation(line: 43, column: 3, scope: !196, inlinedAt: !197)
!196 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!197 = distinct !DILocation(line: 104, column: 10, scope: !125)
!198 = !DILocalVariable(name: "pk", scope: !196, file: !2, line: 36, type: !127)
!199 = !DILocation(line: 36, column: 11, scope: !196, inlinedAt: !197)
!200 = !DILocalVariable(name: "sk", scope: !196, file: !2, line: 37, type: !132)
!201 = !DILocation(line: 37, column: 11, scope: !196, inlinedAt: !197)
!202 = !DILocalVariable(name: "ct", scope: !196, file: !2, line: 38, type: !137)
!203 = !DILocation(line: 38, column: 11, scope: !196, inlinedAt: !197)
!204 = !DILocalVariable(name: "key_a", scope: !196, file: !2, line: 39, type: !142)
!205 = !DILocation(line: 39, column: 11, scope: !196, inlinedAt: !197)
!206 = !DILocalVariable(name: "key_b", scope: !196, file: !2, line: 40, type: !142)
!207 = !DILocation(line: 40, column: 11, scope: !196, inlinedAt: !197)
!208 = !DILocation(line: 0, scope: !118, inlinedAt: !195)
!209 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !195)
!210 = !DILocation(line: 0, scope: !157, inlinedAt: !211)
!211 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !195)
!212 = !DILocation(line: 29, column: 3, scope: !157, inlinedAt: !211)
!213 = !DILocation(line: 30, column: 12, scope: !157, inlinedAt: !211)
!214 = !DILocation(line: 30, column: 3, scope: !157, inlinedAt: !211)
!215 = !DILocation(line: 31, column: 3, scope: !157, inlinedAt: !211)
!216 = !DILocation(line: 33, column: 33, scope: !157, inlinedAt: !211)
!217 = !DILocation(line: 33, column: 55, scope: !157, inlinedAt: !211)
!218 = !DILocation(line: 33, column: 3, scope: !157, inlinedAt: !211)
!219 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !195)
!220 = !DILocation(line: 118, column: 3, scope: !175, inlinedAt: !221)
!221 = distinct !DILocation(line: 46, column: 3, scope: !196, inlinedAt: !197)
!222 = !DILocation(line: 0, scope: !175, inlinedAt: !221)
!223 = !DILocation(line: 117, column: 11, scope: !175, inlinedAt: !221)
!224 = !DILocation(line: 119, column: 3, scope: !175, inlinedAt: !221)
!225 = !DILocation(line: 120, column: 3, scope: !175, inlinedAt: !221)
!226 = !DILocation(line: 49, column: 3, scope: !196, inlinedAt: !197)
!227 = !DILocation(line: 52, column: 3, scope: !196, inlinedAt: !197)
!228 = !DILocation(line: 54, column: 7, scope: !229, inlinedAt: !197)
!229 = distinct !DILexicalBlock(scope: !196, file: !2, line: 54, column: 6)
!230 = !DILocation(line: 54, column: 6, scope: !229, inlinedAt: !197)
!231 = !DILocation(line: 55, column: 5, scope: !232, inlinedAt: !197)
!232 = distinct !DILexicalBlock(scope: !229, file: !2, line: 54, column: 43)
!233 = !DILocation(line: 56, column: 5, scope: !232, inlinedAt: !197)
!234 = !DILocation(line: 0, scope: !196, inlinedAt: !197)
!235 = !DILocation(line: 60, column: 1, scope: !196, inlinedAt: !197)
!236 = !DILocation(line: 72, column: 3, scope: !237, inlinedAt: !238)
!237 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!238 = distinct !DILocation(line: 105, column: 10, scope: !125)
!239 = !DILocalVariable(name: "pk", scope: !237, file: !2, line: 64, type: !127)
!240 = !DILocation(line: 64, column: 11, scope: !237, inlinedAt: !238)
!241 = !DILocalVariable(name: "sk", scope: !237, file: !2, line: 65, type: !132)
!242 = !DILocation(line: 65, column: 11, scope: !237, inlinedAt: !238)
!243 = !DILocalVariable(name: "ct", scope: !237, file: !2, line: 66, type: !137)
!244 = !DILocation(line: 66, column: 11, scope: !237, inlinedAt: !238)
!245 = !DILocalVariable(name: "key_a", scope: !237, file: !2, line: 67, type: !142)
!246 = !DILocation(line: 67, column: 11, scope: !237, inlinedAt: !238)
!247 = !DILocalVariable(name: "key_b", scope: !237, file: !2, line: 68, type: !142)
!248 = !DILocation(line: 68, column: 11, scope: !237, inlinedAt: !238)
!249 = !DILocalVariable(name: "b", scope: !237, file: !2, line: 69, type: !33)
!250 = !DILocation(line: 0, scope: !237, inlinedAt: !238)
!251 = !DILocation(line: 73, column: 5, scope: !252, inlinedAt: !238)
!252 = distinct !DILexicalBlock(scope: !237, file: !2, line: 72, column: 6)
!253 = !DILocation(line: 74, column: 12, scope: !237, inlinedAt: !238)
!254 = !DILocation(line: 74, column: 11, scope: !237, inlinedAt: !238)
!255 = !DILocation(line: 74, column: 3, scope: !252, inlinedAt: !238)
!256 = distinct !{!256, !236, !257, !258}
!257 = !DILocation(line: 74, column: 13, scope: !237, inlinedAt: !238)
!258 = !{!"llvm.loop.mustprogress"}
!259 = !DILocation(line: 104, column: 7, scope: !125)
!260 = !DILocalVariable(name: "pos", scope: !237, file: !2, line: 70, type: !38)
!261 = !DILocation(line: 75, column: 3, scope: !237, inlinedAt: !238)
!262 = !DILocation(line: 54, column: 3, scope: !118, inlinedAt: !263)
!263 = distinct !DILocation(line: 78, column: 3, scope: !237, inlinedAt: !238)
!264 = !DILocation(line: 0, scope: !118, inlinedAt: !263)
!265 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !263)
!266 = !DILocation(line: 0, scope: !157, inlinedAt: !267)
!267 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !263)
!268 = !DILocation(line: 29, column: 3, scope: !157, inlinedAt: !267)
!269 = !DILocation(line: 30, column: 12, scope: !157, inlinedAt: !267)
!270 = !DILocation(line: 30, column: 3, scope: !157, inlinedAt: !267)
!271 = !DILocation(line: 31, column: 3, scope: !157, inlinedAt: !267)
!272 = !DILocation(line: 33, column: 33, scope: !157, inlinedAt: !267)
!273 = !DILocation(line: 33, column: 55, scope: !157, inlinedAt: !267)
!274 = !DILocation(line: 33, column: 3, scope: !157, inlinedAt: !267)
!275 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !263)
!276 = !DILocation(line: 118, column: 3, scope: !175, inlinedAt: !277)
!277 = distinct !DILocation(line: 81, column: 3, scope: !237, inlinedAt: !238)
!278 = !DILocation(line: 0, scope: !175, inlinedAt: !277)
!279 = !DILocation(line: 117, column: 11, scope: !175, inlinedAt: !277)
!280 = !DILocation(line: 119, column: 3, scope: !175, inlinedAt: !277)
!281 = !DILocation(line: 120, column: 3, scope: !175, inlinedAt: !277)
!282 = !DILocation(line: 84, column: 39, scope: !237, inlinedAt: !238)
!283 = !DILocation(line: 84, column: 6, scope: !237, inlinedAt: !238)
!284 = !DILocation(line: 84, column: 10, scope: !237, inlinedAt: !238)
!285 = !DILocation(line: 84, column: 3, scope: !237, inlinedAt: !238)
!286 = !DILocation(line: 84, column: 36, scope: !237, inlinedAt: !238)
!287 = !DILocation(line: 87, column: 3, scope: !237, inlinedAt: !238)
!288 = !DILocation(line: 89, column: 7, scope: !289, inlinedAt: !238)
!289 = distinct !DILexicalBlock(scope: !237, file: !2, line: 89, column: 6)
!290 = !DILocation(line: 89, column: 6, scope: !289, inlinedAt: !238)
!291 = !DILocation(line: 90, column: 5, scope: !292, inlinedAt: !238)
!292 = distinct !DILexicalBlock(scope: !289, file: !2, line: 89, column: 43)
!293 = !DILocation(line: 91, column: 5, scope: !292, inlinedAt: !238)
!294 = !DILocation(line: 95, column: 1, scope: !237, inlinedAt: !238)
!295 = !DILocation(line: 105, column: 7, scope: !125)
!296 = !DILocation(line: 106, column: 8, scope: !297)
!297 = distinct !DILexicalBlock(scope: !125, file: !2, line: 106, column: 8)
!298 = !DILocation(line: 102, column: 21, scope: !115)
!299 = !DILocation(line: 102, column: 3, scope: !115)
!300 = distinct !{!300, !116, !301, !258}
!301 = !DILocation(line: 108, column: 3, scope: !112)
!302 = !DILocation(line: 110, column: 3, scope: !106)
!303 = !DILocation(line: 111, column: 3, scope: !106)
!304 = !DILocation(line: 112, column: 3, scope: !106)
!305 = !DILocation(line: 114, column: 3, scope: !106)
!306 = !DILocation(line: 115, column: 1, scope: !106)
!307 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!308 = !DILocation(line: 0, scope: !28)
!309 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!310 = !DILocation(line: 78, column: 3, scope: !28)
!311 = !DILocation(line: 78, column: 9, scope: !28)
!312 = !DILocation(line: 78, column: 12, scope: !28)
!313 = !DILocation(line: 86, column: 3, scope: !28)
!314 = !DILocation(line: 79, column: 10, scope: !315)
!315 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!316 = !DILocation(line: 79, column: 8, scope: !315)
!317 = !DILocation(line: 80, column: 11, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !29, line: 80, column: 8)
!319 = !DILocation(line: 80, column: 17, scope: !318)
!320 = !DILocation(line: 80, column: 20, scope: !318)
!321 = !DILocation(line: 80, column: 26, scope: !318)
!322 = !DILocation(line: 82, column: 13, scope: !323)
!323 = distinct !DILexicalBlock(scope: !318, file: !29, line: 82, column: 13)
!324 = !DILocation(line: 82, column: 16, scope: !323)
!325 = !DILocation(line: 83, column: 7, scope: !323)
!326 = distinct !{!326, !310, !327, !258}
!327 = !DILocation(line: 84, column: 3, scope: !28)
!328 = !DILocation(line: 86, column: 16, scope: !28)
!329 = !DILocation(line: 87, column: 16, scope: !330)
!330 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!331 = !DILocation(line: 87, column: 11, scope: !330)
!332 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !333)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !334, line: 182, baseType: !335)
!334 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !336, line: 147, baseType: !50)
!336 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!337 = !DILocation(line: 88, column: 18, scope: !338)
!338 = distinct !DILexicalBlock(scope: !330, file: !29, line: 88, column: 8)
!339 = !DILocation(line: 88, column: 21, scope: !338)
!340 = !DILocation(line: 88, column: 27, scope: !338)
!341 = distinct !{!341, !313, !342, !258}
!342 = !DILocation(line: 95, column: 3, scope: !28)
!343 = !DILocation(line: 91, column: 7, scope: !344)
!344 = distinct !DILexicalBlock(scope: !338, file: !29, line: 90, column: 13)
!345 = !DILocation(line: 93, column: 9, scope: !330)
!346 = !DILocation(line: 94, column: 12, scope: !330)
!347 = !DILocation(line: 96, column: 1, scope: !28)
!348 = !DILocation(line: 0, scope: !157)
!349 = !DILocation(line: 29, column: 3, scope: !157)
!350 = !DILocation(line: 30, column: 12, scope: !157)
!351 = !DILocation(line: 30, column: 3, scope: !157)
!352 = !DILocation(line: 31, column: 3, scope: !157)
!353 = !DILocation(line: 33, column: 33, scope: !157)
!354 = !DILocation(line: 33, column: 55, scope: !157)
!355 = !DILocation(line: 33, column: 3, scope: !157)
!356 = !DILocation(line: 34, column: 3, scope: !157)
!357 = !DILocation(line: 0, scope: !118)
!358 = !DILocation(line: 53, column: 11, scope: !118)
!359 = !DILocation(line: 54, column: 3, scope: !118)
!360 = !DILocation(line: 0, scope: !157, inlinedAt: !361)
!361 = distinct !DILocation(line: 55, column: 3, scope: !118)
!362 = !DILocation(line: 29, column: 3, scope: !157, inlinedAt: !361)
!363 = !DILocation(line: 30, column: 12, scope: !157, inlinedAt: !361)
!364 = !DILocation(line: 30, column: 3, scope: !157, inlinedAt: !361)
!365 = !DILocation(line: 31, column: 3, scope: !157, inlinedAt: !361)
!366 = !DILocation(line: 33, column: 33, scope: !157, inlinedAt: !361)
!367 = !DILocation(line: 33, column: 55, scope: !157, inlinedAt: !361)
!368 = !DILocation(line: 33, column: 3, scope: !157, inlinedAt: !361)
!369 = !DILocation(line: 56, column: 3, scope: !118)
!370 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !119, file: !119, line: 76, type: !371, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!371 = !DISubroutineType(types: !372)
!372 = !{!50, !32, !32, !160, !160}
!373 = !DILocalVariable(name: "ct", arg: 1, scope: !370, file: !119, line: 76, type: !32)
!374 = !DILocation(line: 0, scope: !370)
!375 = !DILocalVariable(name: "ss", arg: 2, scope: !370, file: !119, line: 77, type: !32)
!376 = !DILocalVariable(name: "pk", arg: 3, scope: !370, file: !119, line: 78, type: !160)
!377 = !DILocalVariable(name: "coins", arg: 4, scope: !370, file: !119, line: 79, type: !160)
!378 = !DILocalVariable(name: "buf", scope: !370, file: !119, line: 81, type: !152)
!379 = !DILocation(line: 81, column: 11, scope: !370)
!380 = !DILocalVariable(name: "kr", scope: !370, file: !119, line: 83, type: !152)
!381 = !DILocation(line: 83, column: 11, scope: !370)
!382 = !DILocation(line: 85, column: 3, scope: !370)
!383 = !DILocation(line: 88, column: 3, scope: !370)
!384 = !DILocation(line: 89, column: 3, scope: !370)
!385 = !DILocation(line: 92, column: 29, scope: !370)
!386 = !DILocation(line: 92, column: 3, scope: !370)
!387 = !DILocation(line: 94, column: 3, scope: !370)
!388 = !DILocation(line: 95, column: 3, scope: !370)
!389 = !DILocation(line: 0, scope: !175)
!390 = !DILocation(line: 117, column: 11, scope: !175)
!391 = !DILocation(line: 118, column: 3, scope: !175)
!392 = !DILocation(line: 119, column: 3, scope: !175)
!393 = !DILocation(line: 120, column: 3, scope: !175)
!394 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !119, file: !119, line: 140, type: !395, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!395 = !DISubroutineType(types: !396)
!396 = !{!50, !32, !160, !160}
!397 = !DILocalVariable(name: "ss", arg: 1, scope: !394, file: !119, line: 140, type: !32)
!398 = !DILocation(line: 0, scope: !394)
!399 = !DILocalVariable(name: "ct", arg: 2, scope: !394, file: !119, line: 141, type: !160)
!400 = !DILocalVariable(name: "sk", arg: 3, scope: !394, file: !119, line: 142, type: !160)
!401 = !DILocalVariable(name: "buf", scope: !394, file: !119, line: 145, type: !152)
!402 = !DILocation(line: 145, column: 11, scope: !394)
!403 = !DILocalVariable(name: "kr", scope: !394, file: !119, line: 147, type: !152)
!404 = !DILocation(line: 147, column: 11, scope: !394)
!405 = !DILocalVariable(name: "cmp", scope: !394, file: !119, line: 149, type: !137)
!406 = !DILocation(line: 149, column: 11, scope: !394)
!407 = !DILocation(line: 150, column: 25, scope: !394)
!408 = !DILocalVariable(name: "pk", scope: !394, file: !119, line: 150, type: !160)
!409 = !DILocation(line: 152, column: 3, scope: !394)
!410 = !DILocation(line: 155, column: 13, scope: !394)
!411 = !DILocation(line: 155, column: 53, scope: !394)
!412 = !DILocation(line: 155, column: 3, scope: !394)
!413 = !DILocation(line: 156, column: 3, scope: !394)
!414 = !DILocation(line: 159, column: 30, scope: !394)
!415 = !DILocation(line: 159, column: 3, scope: !394)
!416 = !DILocalVariable(name: "a", arg: 1, scope: !417, file: !418, line: 16, type: !160)
!417 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !418, file: !418, line: 16, type: !419, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!418 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!419 = !DISubroutineType(types: !420)
!420 = !{!50, !160, !160, !38}
!421 = !DILocation(line: 0, scope: !417, inlinedAt: !422)
!422 = distinct !DILocation(line: 161, column: 10, scope: !394)
!423 = !DILocalVariable(name: "b", arg: 2, scope: !417, file: !418, line: 16, type: !160)
!424 = !DILocalVariable(name: "len", arg: 3, scope: !417, file: !418, line: 16, type: !38)
!425 = !DILocalVariable(name: "r", scope: !417, file: !418, line: 19, type: !33)
!426 = !DILocalVariable(name: "i", scope: !417, file: !418, line: 18, type: !38)
!427 = !DILocation(line: 21, column: 7, scope: !428, inlinedAt: !422)
!428 = distinct !DILexicalBlock(scope: !417, file: !418, line: 21, column: 3)
!429 = !DILocation(line: 21, scope: !428, inlinedAt: !422)
!430 = !DILocation(line: 21, column: 12, scope: !431, inlinedAt: !422)
!431 = distinct !DILexicalBlock(scope: !428, file: !418, line: 21, column: 3)
!432 = !DILocation(line: 21, column: 3, scope: !428, inlinedAt: !422)
!433 = !DILocation(line: 22, column: 10, scope: !431, inlinedAt: !422)
!434 = !DILocation(line: 22, column: 17, scope: !431, inlinedAt: !422)
!435 = !DILocation(line: 22, column: 15, scope: !431, inlinedAt: !422)
!436 = !DILocation(line: 22, column: 7, scope: !431, inlinedAt: !422)
!437 = !DILocation(line: 21, column: 18, scope: !431, inlinedAt: !422)
!438 = !DILocation(line: 21, column: 3, scope: !431, inlinedAt: !422)
!439 = distinct !{!439, !432, !440, !258}
!440 = !DILocation(line: 22, column: 20, scope: !428, inlinedAt: !422)
!441 = !DILocation(line: 24, column: 25, scope: !417, inlinedAt: !422)
!442 = !DILocalVariable(name: "fail", scope: !394, file: !119, line: 144, type: !50)
!443 = !DILocation(line: 164, column: 3, scope: !394)
!444 = !DILocation(line: 167, column: 29, scope: !394)
!445 = !DILocalVariable(name: "r", arg: 1, scope: !446, file: !418, line: 40, type: !32)
!446 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !418, file: !418, line: 40, type: !447, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!447 = !DISubroutineType(types: !448)
!448 = !{null, !32, !160, !38, !33}
!449 = !DILocation(line: 0, scope: !446, inlinedAt: !450)
!450 = distinct !DILocation(line: 167, column: 3, scope: !394)
!451 = !DILocalVariable(name: "x", arg: 2, scope: !446, file: !418, line: 40, type: !160)
!452 = !DILocalVariable(name: "len", arg: 3, scope: !446, file: !418, line: 40, type: !38)
!453 = !DILocalVariable(name: "b", arg: 4, scope: !446, file: !418, line: 40, type: !33)
!454 = !DILocation(line: 51, column: 3, scope: !446, inlinedAt: !450)
!455 = !{i64 1722}
!456 = !DILocation(line: 54, column: 7, scope: !446, inlinedAt: !450)
!457 = !DILocalVariable(name: "i", scope: !446, file: !418, line: 42, type: !38)
!458 = !DILocation(line: 55, column: 7, scope: !459, inlinedAt: !450)
!459 = distinct !DILexicalBlock(scope: !446, file: !418, line: 55, column: 3)
!460 = !DILocation(line: 55, scope: !459, inlinedAt: !450)
!461 = !DILocation(line: 55, column: 12, scope: !462, inlinedAt: !450)
!462 = distinct !DILexicalBlock(scope: !459, file: !418, line: 55, column: 3)
!463 = !DILocation(line: 55, column: 3, scope: !459, inlinedAt: !450)
!464 = !DILocation(line: 56, column: 18, scope: !462, inlinedAt: !450)
!465 = !DILocation(line: 56, column: 25, scope: !462, inlinedAt: !450)
!466 = !DILocation(line: 56, column: 23, scope: !462, inlinedAt: !450)
!467 = !DILocation(line: 56, column: 15, scope: !462, inlinedAt: !450)
!468 = !DILocation(line: 56, column: 5, scope: !462, inlinedAt: !450)
!469 = !DILocation(line: 56, column: 10, scope: !462, inlinedAt: !450)
!470 = !DILocation(line: 55, column: 18, scope: !462, inlinedAt: !450)
!471 = !DILocation(line: 55, column: 3, scope: !462, inlinedAt: !450)
!472 = distinct !{!472, !463, !473, !258}
!473 = !DILocation(line: 56, column: 29, scope: !459, inlinedAt: !450)
!474 = !DILocation(line: 169, column: 3, scope: !394)
!475 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !476, file: !476, line: 165, type: !477, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!476 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!477 = !DISubroutineType(types: !478)
!478 = !{null, !479, !160, !50}
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 32)
!480 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !481, line: 10, baseType: !482)
!481 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!482 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !481, line: 8, size: 8192, elements: !483)
!483 = !{!484}
!484 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !482, file: !481, line: 9, baseType: !485, size: 8192)
!485 = !DICompositeType(tag: DW_TAG_array_type, baseType: !486, size: 8192, elements: !494)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !488)
!487 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!488 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !489)
!489 = !{!490}
!490 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !488, file: !487, line: 12, baseType: !491, size: 4096)
!491 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !492)
!492 = !{!493}
!493 = !DISubrange(count: 256)
!494 = !{!495}
!495 = !DISubrange(count: 2)
!496 = !DILocalVariable(name: "a", arg: 1, scope: !475, file: !476, line: 165, type: !479)
!497 = !DILocation(line: 0, scope: !475)
!498 = !DILocalVariable(name: "seed", arg: 2, scope: !475, file: !476, line: 165, type: !160)
!499 = !DILocalVariable(name: "transposed", arg: 3, scope: !475, file: !476, line: 165, type: !50)
!500 = !DILocalVariable(name: "buf", scope: !475, file: !476, line: 169, type: !501)
!501 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !502)
!502 = !{!503}
!503 = !DISubrange(count: 504)
!504 = !DILocation(line: 169, column: 11, scope: !475)
!505 = !DILocalVariable(name: "state", scope: !475, file: !476, line: 170, type: !506)
!506 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !507, line: 10, baseType: !508)
!507 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!508 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !509, line: 17, baseType: !510)
!509 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!510 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !509, line: 14, size: 1664, elements: !511)
!511 = !{!512, !516}
!512 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !510, file: !509, line: 15, baseType: !513, size: 1600)
!513 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !514)
!514 = !{!515}
!515 = !DISubrange(count: 25)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !510, file: !509, line: 16, baseType: !40, size: 32, offset: 1600)
!517 = !DILocation(line: 170, column: 13, scope: !475)
!518 = !DILocalVariable(name: "i", scope: !475, file: !476, line: 167, type: !40)
!519 = !DILocation(line: 172, column: 7, scope: !520)
!520 = distinct !DILexicalBlock(scope: !475, file: !476, line: 172, column: 3)
!521 = !DILocation(line: 172, scope: !520)
!522 = !DILocation(line: 172, column: 12, scope: !523)
!523 = distinct !DILexicalBlock(scope: !520, file: !476, line: 172, column: 3)
!524 = !DILocation(line: 172, column: 3, scope: !520)
!525 = !DILocation(line: 173, column: 5, scope: !526)
!526 = distinct !DILexicalBlock(scope: !527, file: !476, line: 173, column: 5)
!527 = distinct !DILexicalBlock(scope: !523, file: !476, line: 172, column: 26)
!528 = !DILocation(line: 173, scope: !526)
!529 = !DILocalVariable(name: "j", scope: !475, file: !476, line: 167, type: !40)
!530 = !DILocation(line: 173, column: 14, scope: !531)
!531 = distinct !DILexicalBlock(scope: !526, file: !476, line: 173, column: 5)
!532 = !DILocation(line: 174, column: 10, scope: !533)
!533 = distinct !DILexicalBlock(scope: !534, file: !476, line: 174, column: 10)
!534 = distinct !DILexicalBlock(scope: !531, file: !476, line: 173, column: 28)
!535 = !DILocation(line: 175, column: 9, scope: !533)
!536 = !DILocation(line: 25, column: 3, scope: !537, inlinedAt: !547)
!537 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !538, file: !538, line: 18, type: !539, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!538 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!539 = !DISubroutineType(types: !540)
!540 = !{null, !541, !160, !33, !33}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !542, size: 32)
!542 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !509, line: 17, baseType: !543)
!543 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !509, line: 14, size: 1664, elements: !544)
!544 = !{!545, !546}
!545 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !543, file: !509, line: 15, baseType: !513, size: 1600)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !543, file: !509, line: 16, baseType: !40, size: 32, offset: 1600)
!547 = distinct !DILocation(line: 175, column: 9, scope: !533)
!548 = !DILocalVariable(name: "state", arg: 1, scope: !537, file: !538, line: 18, type: !541)
!549 = !DILocation(line: 0, scope: !537, inlinedAt: !547)
!550 = !DILocalVariable(name: "seed", arg: 2, scope: !537, file: !538, line: 19, type: !160)
!551 = !DILocalVariable(name: "x", arg: 3, scope: !537, file: !538, line: 20, type: !33)
!552 = !DILocalVariable(name: "y", arg: 4, scope: !537, file: !538, line: 21, type: !33)
!553 = !DILocalVariable(name: "extseed", scope: !537, file: !538, line: 23, type: !554)
!554 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !555)
!555 = !{!556}
!556 = !DISubrange(count: 34)
!557 = !DILocation(line: 23, column: 11, scope: !537, inlinedAt: !547)
!558 = !DILocation(line: 26, column: 3, scope: !537, inlinedAt: !547)
!559 = !DILocation(line: 26, column: 29, scope: !537, inlinedAt: !547)
!560 = !DILocation(line: 27, column: 3, scope: !537, inlinedAt: !547)
!561 = !DILocation(line: 27, column: 29, scope: !537, inlinedAt: !547)
!562 = !DILocalVariable(name: "state", arg: 1, scope: !563, file: !74, line: 580, type: !566)
!563 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !564, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!564 = !DISubroutineType(types: !565)
!565 = !{null, !566, !160, !38}
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 32)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !509, line: 17, baseType: !568)
!568 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !509, line: 14, size: 1664, elements: !569)
!569 = !{!570, !571}
!570 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !568, file: !509, line: 15, baseType: !513, size: 1600)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !568, file: !509, line: 16, baseType: !40, size: 32, offset: 1600)
!572 = !DILocation(line: 0, scope: !563, inlinedAt: !573)
!573 = distinct !DILocation(line: 29, column: 3, scope: !537, inlinedAt: !547)
!574 = !DILocalVariable(name: "in", arg: 2, scope: !563, file: !74, line: 580, type: !160)
!575 = !DILocalVariable(name: "inlen", arg: 3, scope: !563, file: !74, line: 580, type: !38)
!576 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !573)
!577 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !573)
!578 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !573)
!579 = !DILocation(line: 30, column: 1, scope: !537, inlinedAt: !547)
!580 = !DILocation(line: 177, column: 9, scope: !533)
!581 = !DILocation(line: 25, column: 3, scope: !537, inlinedAt: !582)
!582 = distinct !DILocation(line: 177, column: 9, scope: !533)
!583 = !DILocation(line: 0, scope: !537, inlinedAt: !582)
!584 = !DILocation(line: 23, column: 11, scope: !537, inlinedAt: !582)
!585 = !DILocation(line: 26, column: 3, scope: !537, inlinedAt: !582)
!586 = !DILocation(line: 26, column: 29, scope: !537, inlinedAt: !582)
!587 = !DILocation(line: 27, column: 3, scope: !537, inlinedAt: !582)
!588 = !DILocation(line: 27, column: 29, scope: !537, inlinedAt: !582)
!589 = !DILocation(line: 0, scope: !563, inlinedAt: !590)
!590 = distinct !DILocation(line: 29, column: 3, scope: !537, inlinedAt: !582)
!591 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !590)
!592 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !590)
!593 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !590)
!594 = !DILocation(line: 30, column: 1, scope: !537, inlinedAt: !582)
!595 = !DILocalVariable(name: "out", arg: 1, scope: !596, file: !74, line: 598, type: !32)
!596 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !597, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!597 = !DISubroutineType(types: !598)
!598 = !{null, !32, !38, !566}
!599 = !DILocation(line: 0, scope: !596, inlinedAt: !600)
!600 = distinct !DILocation(line: 179, column: 7, scope: !534)
!601 = !DILocalVariable(name: "nblocks", arg: 2, scope: !596, file: !74, line: 598, type: !38)
!602 = !DILocalVariable(name: "state", arg: 3, scope: !596, file: !74, line: 598, type: !566)
!603 = !DILocalVariable(name: "out", arg: 1, scope: !604, file: !74, line: 500, type: !32)
!604 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !605, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!605 = !DISubroutineType(types: !606)
!606 = !{null, !32, !38, !607, !40}
!607 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!608 = !DILocation(line: 0, scope: !604, inlinedAt: !609)
!609 = distinct !DILocation(line: 600, column: 3, scope: !596, inlinedAt: !600)
!610 = !DILocalVariable(name: "nblocks", arg: 2, scope: !604, file: !74, line: 501, type: !38)
!611 = !DILocalVariable(name: "s", arg: 3, scope: !604, file: !74, line: 502, type: !607)
!612 = !DILocalVariable(name: "r", arg: 4, scope: !604, file: !74, line: 503, type: !40)
!613 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !609)
!614 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !609)
!615 = distinct !DILexicalBlock(scope: !604, file: !74, line: 507, column: 18)
!616 = !DILocalVariable(name: "i", scope: !604, file: !74, line: 505, type: !40)
!617 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !609)
!618 = distinct !DILexicalBlock(scope: !615, file: !74, line: 509, column: 5)
!619 = !DILocation(line: 509, scope: !618, inlinedAt: !609)
!620 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !609)
!621 = distinct !DILexicalBlock(scope: !618, file: !74, line: 509, column: 5)
!622 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !609)
!623 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !609)
!624 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !609)
!625 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !609)
!626 = !DILocalVariable(name: "x", arg: 1, scope: !627, file: !74, line: 40, type: !32)
!627 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !628, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!628 = !DISubroutineType(types: !629)
!629 = !{null, !32, !70}
!630 = !DILocation(line: 0, scope: !627, inlinedAt: !631)
!631 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !609)
!632 = !DILocalVariable(name: "u", arg: 2, scope: !627, file: !74, line: 40, type: !70)
!633 = !DILocalVariable(name: "i", scope: !627, file: !74, line: 41, type: !40)
!634 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !631)
!635 = distinct !DILexicalBlock(scope: !627, file: !74, line: 43, column: 3)
!636 = !DILocation(line: 43, scope: !635, inlinedAt: !631)
!637 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !631)
!638 = distinct !DILexicalBlock(scope: !635, file: !74, line: 43, column: 3)
!639 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !631)
!640 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !631)
!641 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !631)
!642 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !631)
!643 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !631)
!644 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !631)
!645 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !631)
!646 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !631)
!647 = distinct !{!647, !639, !648, !258}
!648 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !631)
!649 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !609)
!650 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !609)
!651 = distinct !{!651, !622, !652, !258}
!652 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !609)
!653 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !609)
!654 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !609)
!655 = distinct !{!655, !613, !656, !258}
!656 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !609)
!657 = !DILocalVariable(name: "buflen", scope: !475, file: !476, line: 168, type: !40)
!658 = !DILocation(line: 181, column: 25, scope: !534)
!659 = !DILocation(line: 181, column: 13, scope: !534)
!660 = !DILocalVariable(name: "ctr", scope: !475, file: !476, line: 167, type: !40)
!661 = !DILocation(line: 183, column: 7, scope: !534)
!662 = !DILocation(line: 0, scope: !534)
!663 = !DILocation(line: 183, column: 17, scope: !534)
!664 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !665)
!665 = distinct !DILocation(line: 600, column: 3, scope: !596, inlinedAt: !666)
!666 = distinct !DILocation(line: 184, column: 9, scope: !667)
!667 = distinct !DILexicalBlock(scope: !534, file: !476, line: 183, column: 28)
!668 = !DILocation(line: 0, scope: !604, inlinedAt: !665)
!669 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !665)
!670 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !665)
!671 = !DILocation(line: 509, scope: !618, inlinedAt: !665)
!672 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !665)
!673 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !665)
!674 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !665)
!675 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !665)
!676 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !665)
!677 = !DILocation(line: 0, scope: !627, inlinedAt: !678)
!678 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !665)
!679 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !678)
!680 = !DILocation(line: 43, scope: !635, inlinedAt: !678)
!681 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !678)
!682 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !678)
!683 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !678)
!684 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !678)
!685 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !678)
!686 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !678)
!687 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !678)
!688 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !678)
!689 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !678)
!690 = distinct !{!690, !682, !691, !258}
!691 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !678)
!692 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !665)
!693 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !665)
!694 = distinct !{!694, !673, !695, !258}
!695 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !665)
!696 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !665)
!697 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !665)
!698 = distinct !{!698, !664, !699, !258}
!699 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !665)
!700 = !DILocation(line: 186, column: 28, scope: !667)
!701 = !DILocation(line: 186, column: 47, scope: !667)
!702 = !DILocation(line: 186, column: 62, scope: !667)
!703 = !DILocation(line: 186, column: 16, scope: !667)
!704 = !DILocation(line: 186, column: 13, scope: !667)
!705 = distinct !{!705, !661, !706, !258}
!706 = !DILocation(line: 187, column: 7, scope: !534)
!707 = !DILocation(line: 173, column: 24, scope: !531)
!708 = !DILocation(line: 173, column: 5, scope: !531)
!709 = distinct !{!709, !525, !710, !258}
!710 = !DILocation(line: 188, column: 5, scope: !526)
!711 = !DILocation(line: 172, column: 22, scope: !523)
!712 = !DILocation(line: 172, column: 3, scope: !523)
!713 = distinct !{!713, !524, !714, !258}
!714 = !DILocation(line: 189, column: 3, scope: !520)
!715 = !DILocation(line: 190, column: 1, scope: !475)
!716 = distinct !DISubprogram(name: "rej_uniform", scope: !476, file: !476, line: 121, type: !717, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!717 = !DISubroutineType(types: !718)
!718 = !{!40, !719, !40, !160, !40}
!719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!720 = !DILocalVariable(name: "r", arg: 1, scope: !716, file: !476, line: 121, type: !719)
!721 = !DILocation(line: 0, scope: !716)
!722 = !DILocalVariable(name: "len", arg: 2, scope: !716, file: !476, line: 122, type: !40)
!723 = !DILocalVariable(name: "buf", arg: 3, scope: !716, file: !476, line: 123, type: !160)
!724 = !DILocalVariable(name: "buflen", arg: 4, scope: !716, file: !476, line: 124, type: !40)
!725 = !DILocalVariable(name: "pos", scope: !716, file: !476, line: 126, type: !40)
!726 = !DILocalVariable(name: "ctr", scope: !716, file: !476, line: 126, type: !40)
!727 = !DILocation(line: 130, column: 3, scope: !716)
!728 = !DILocation(line: 130, column: 13, scope: !716)
!729 = !DILocation(line: 130, column: 19, scope: !716)
!730 = !DILocation(line: 131, column: 14, scope: !731)
!731 = distinct !DILexicalBlock(scope: !716, file: !476, line: 130, column: 41)
!732 = !DILocation(line: 131, column: 44, scope: !731)
!733 = !DILocation(line: 131, column: 34, scope: !731)
!734 = !DILocation(line: 131, column: 55, scope: !731)
!735 = !DILocation(line: 131, column: 62, scope: !731)
!736 = !DILocalVariable(name: "val0", scope: !716, file: !476, line: 127, type: !86)
!737 = !DILocation(line: 132, column: 14, scope: !731)
!738 = !DILocation(line: 132, column: 25, scope: !731)
!739 = !DILocation(line: 132, column: 44, scope: !731)
!740 = !DILocation(line: 132, column: 34, scope: !731)
!741 = !DILocation(line: 132, column: 55, scope: !731)
!742 = !DILocation(line: 132, column: 31, scope: !731)
!743 = !DILocalVariable(name: "val1", scope: !716, file: !476, line: 127, type: !86)
!744 = !DILocation(line: 133, column: 9, scope: !731)
!745 = !DILocation(line: 135, column: 13, scope: !746)
!746 = distinct !DILexicalBlock(scope: !731, file: !476, line: 135, column: 8)
!747 = !DILocation(line: 136, column: 12, scope: !746)
!748 = !DILocation(line: 136, column: 7, scope: !746)
!749 = !DILocation(line: 136, column: 16, scope: !746)
!750 = !DILocation(line: 137, column: 12, scope: !751)
!751 = distinct !DILexicalBlock(scope: !731, file: !476, line: 137, column: 8)
!752 = !DILocation(line: 137, column: 18, scope: !751)
!753 = !DILocation(line: 138, column: 12, scope: !751)
!754 = !DILocation(line: 138, column: 7, scope: !751)
!755 = !DILocation(line: 138, column: 16, scope: !751)
!756 = !DILocation(line: 0, scope: !731)
!757 = distinct !{!757, !727, !758, !258}
!758 = !DILocation(line: 139, column: 3, scope: !716)
!759 = !DILocation(line: 141, column: 3, scope: !716)
!760 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !476, file: !476, line: 205, type: !761, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!761 = !DISubroutineType(types: !762)
!762 = !{null, !32, !32, !160}
!763 = !DILocalVariable(name: "pk", arg: 1, scope: !760, file: !476, line: 205, type: !32)
!764 = !DILocation(line: 0, scope: !760)
!765 = !DILocalVariable(name: "sk", arg: 2, scope: !760, file: !476, line: 206, type: !32)
!766 = !DILocalVariable(name: "coins", arg: 3, scope: !760, file: !476, line: 207, type: !160)
!767 = !DILocalVariable(name: "buf", scope: !760, file: !476, line: 210, type: !152)
!768 = !DILocation(line: 210, column: 11, scope: !760)
!769 = !DILocalVariable(name: "publicseed", scope: !760, file: !476, line: 211, type: !160)
!770 = !DILocation(line: 212, column: 33, scope: !760)
!771 = !DILocalVariable(name: "noiseseed", scope: !760, file: !476, line: 212, type: !160)
!772 = !DILocalVariable(name: "nonce", scope: !760, file: !476, line: 213, type: !33)
!773 = !DILocalVariable(name: "a", scope: !760, file: !476, line: 214, type: !774)
!774 = !DICompositeType(tag: DW_TAG_array_type, baseType: !480, size: 16384, elements: !494)
!775 = !DILocation(line: 214, column: 11, scope: !760)
!776 = !DILocalVariable(name: "e", scope: !760, file: !476, line: 214, type: !480)
!777 = !DILocation(line: 214, column: 23, scope: !760)
!778 = !DILocalVariable(name: "pkpv", scope: !760, file: !476, line: 214, type: !480)
!779 = !DILocation(line: 214, column: 26, scope: !760)
!780 = !DILocalVariable(name: "skpv", scope: !760, file: !476, line: 214, type: !480)
!781 = !DILocation(line: 214, column: 32, scope: !760)
!782 = !DILocation(line: 216, column: 3, scope: !760)
!783 = !DILocation(line: 217, column: 3, scope: !760)
!784 = !DILocation(line: 217, column: 23, scope: !760)
!785 = !DILocation(line: 218, column: 3, scope: !760)
!786 = !DILocation(line: 220, column: 3, scope: !760)
!787 = !DILocalVariable(name: "i", scope: !760, file: !476, line: 209, type: !40)
!788 = !DILocation(line: 222, column: 7, scope: !789)
!789 = distinct !DILexicalBlock(scope: !760, file: !476, line: 222, column: 3)
!790 = !DILocation(line: 222, scope: !789)
!791 = !DILocation(line: 222, column: 12, scope: !792)
!792 = distinct !DILexicalBlock(scope: !789, file: !476, line: 222, column: 3)
!793 = !DILocation(line: 222, column: 3, scope: !789)
!794 = !DILocation(line: 224, column: 3, scope: !795)
!795 = distinct !DILexicalBlock(scope: !760, file: !476, line: 224, column: 3)
!796 = !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !806)
!797 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !798, file: !798, line: 225, type: !799, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!798 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!799 = !DISubroutineType(types: !800)
!800 = !{null, !801, !160, !33}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !802, size: 32)
!802 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !803)
!803 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !804)
!804 = !{!805}
!805 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !803, file: !487, line: 12, baseType: !491, size: 4096)
!806 = distinct !DILocation(line: 223, column: 5, scope: !792)
!807 = !DILocalVariable(name: "r", arg: 1, scope: !797, file: !798, line: 225, type: !801)
!808 = !DILocation(line: 0, scope: !797, inlinedAt: !806)
!809 = !DILocalVariable(name: "seed", arg: 2, scope: !797, file: !798, line: 225, type: !160)
!810 = !DILocalVariable(name: "nonce", arg: 3, scope: !797, file: !798, line: 225, type: !33)
!811 = !DILocalVariable(name: "buf", scope: !797, file: !798, line: 227, type: !812)
!812 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1536, elements: !813)
!813 = !{!814}
!814 = !DISubrange(count: 192)
!815 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !806)
!816 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !820)
!817 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !538, file: !538, line: 43, type: !818, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!818 = !DISubroutineType(types: !819)
!819 = !{null, !32, !38, !160, !33}
!820 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !806)
!821 = !DILocalVariable(name: "out", arg: 1, scope: !817, file: !538, line: 43, type: !32)
!822 = !DILocation(line: 0, scope: !817, inlinedAt: !820)
!823 = !DILocalVariable(name: "outlen", arg: 2, scope: !817, file: !538, line: 43, type: !38)
!824 = !DILocalVariable(name: "key", arg: 3, scope: !817, file: !538, line: 43, type: !160)
!825 = !DILocalVariable(name: "nonce", arg: 4, scope: !817, file: !538, line: 43, type: !33)
!826 = !DILocalVariable(name: "extkey", scope: !817, file: !538, line: 45, type: !827)
!827 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !828)
!828 = !{!829}
!829 = !DISubrange(count: 33)
!830 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !820)
!831 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !820)
!832 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !820)
!833 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !835)
!834 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !564, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!835 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !839)
!836 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !837, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!837 = !DISubroutineType(types: !838)
!838 = !{null, !32, !38, !160, !38}
!839 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !820)
!840 = !DILocalVariable(name: "out", arg: 1, scope: !836, file: !74, line: 723, type: !32)
!841 = !DILocation(line: 0, scope: !836, inlinedAt: !839)
!842 = !DILocalVariable(name: "outlen", arg: 2, scope: !836, file: !74, line: 723, type: !38)
!843 = !DILocalVariable(name: "in", arg: 3, scope: !836, file: !74, line: 723, type: !160)
!844 = !DILocalVariable(name: "inlen", arg: 4, scope: !836, file: !74, line: 723, type: !38)
!845 = !DILocalVariable(name: "state", scope: !836, file: !74, line: 726, type: !567)
!846 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !839)
!847 = !DILocalVariable(name: "state", arg: 1, scope: !834, file: !74, line: 667, type: !566)
!848 = !DILocation(line: 0, scope: !834, inlinedAt: !835)
!849 = !DILocalVariable(name: "in", arg: 2, scope: !834, file: !74, line: 667, type: !160)
!850 = !DILocalVariable(name: "inlen", arg: 3, scope: !834, file: !74, line: 667, type: !38)
!851 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !835)
!852 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !835)
!853 = !DILocalVariable(name: "nblocks", scope: !836, file: !74, line: 725, type: !38)
!854 = !DILocalVariable(name: "out", arg: 1, scope: !855, file: !74, line: 685, type: !32)
!855 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !597, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!856 = !DILocation(line: 0, scope: !855, inlinedAt: !857)
!857 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !839)
!858 = !DILocalVariable(name: "nblocks", arg: 2, scope: !855, file: !74, line: 685, type: !38)
!859 = !DILocalVariable(name: "state", arg: 3, scope: !855, file: !74, line: 685, type: !566)
!860 = !DILocation(line: 0, scope: !604, inlinedAt: !861)
!861 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !857)
!862 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !861)
!863 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !861)
!864 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !861)
!865 = !DILocation(line: 509, scope: !618, inlinedAt: !861)
!866 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !861)
!867 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !861)
!868 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !861)
!869 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !861)
!870 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !861)
!871 = !DILocation(line: 0, scope: !627, inlinedAt: !872)
!872 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !861)
!873 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !872)
!874 = !DILocation(line: 43, scope: !635, inlinedAt: !872)
!875 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !872)
!876 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !872)
!877 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !872)
!878 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !872)
!879 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !872)
!880 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !872)
!881 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !872)
!882 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !872)
!883 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !872)
!884 = distinct !{!884, !876, !885, !258}
!885 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !872)
!886 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !861)
!887 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !861)
!888 = distinct !{!888, !867, !889, !258}
!889 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !861)
!890 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !861)
!891 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !861)
!892 = distinct !{!892, !862, !893, !258}
!893 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !861)
!894 = !DILocation(line: 732, column: 7, scope: !836, inlinedAt: !839)
!895 = !DILocalVariable(name: "out", arg: 1, scope: !896, file: !74, line: 653, type: !32)
!896 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !597, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!897 = !DILocation(line: 0, scope: !896, inlinedAt: !898)
!898 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !839)
!899 = !DILocalVariable(name: "outlen", arg: 2, scope: !896, file: !74, line: 653, type: !38)
!900 = !DILocalVariable(name: "state", arg: 3, scope: !896, file: !74, line: 653, type: !566)
!901 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !898)
!902 = !DILocalVariable(name: "out", arg: 1, scope: !903, file: !74, line: 426, type: !32)
!903 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !904, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!904 = !DISubroutineType(types: !905)
!905 = !{!40, !32, !38, !607, !40, !40}
!906 = !DILocation(line: 0, scope: !903, inlinedAt: !907)
!907 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !898)
!908 = !DILocalVariable(name: "outlen", arg: 2, scope: !903, file: !74, line: 427, type: !38)
!909 = !DILocalVariable(name: "s", arg: 3, scope: !903, file: !74, line: 428, type: !607)
!910 = !DILocalVariable(name: "pos", arg: 4, scope: !903, file: !74, line: 429, type: !40)
!911 = !DILocalVariable(name: "r", arg: 5, scope: !903, file: !74, line: 430, type: !40)
!912 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !907)
!913 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !907)
!914 = distinct !DILexicalBlock(scope: !915, file: !74, line: 435, column: 8)
!915 = distinct !DILexicalBlock(scope: !903, file: !74, line: 434, column: 17)
!916 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !907)
!917 = distinct !DILexicalBlock(scope: !914, file: !74, line: 435, column: 18)
!918 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !907)
!919 = !DILocalVariable(name: "i", scope: !903, file: !74, line: 432, type: !40)
!920 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !907)
!921 = distinct !DILexicalBlock(scope: !915, file: !74, line: 439, column: 5)
!922 = !DILocation(line: 439, scope: !921, inlinedAt: !907)
!923 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !907)
!924 = distinct !DILexicalBlock(scope: !921, file: !74, line: 439, column: 5)
!925 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !907)
!926 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !907)
!927 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !907)
!928 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !907)
!929 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !907)
!930 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !907)
!931 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !907)
!932 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !907)
!933 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !907)
!934 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !907)
!935 = distinct !{!935, !926, !936, !258}
!936 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !907)
!937 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !907)
!938 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !907)
!939 = distinct !{!939, !912, !940, !258}
!940 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !907)
!941 = !DILocation(line: 223, column: 25, scope: !792)
!942 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !898)
!943 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !898)
!944 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !839)
!945 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !820)
!946 = !DILocalVariable(name: "r", arg: 1, scope: !947, file: !948, line: 110, type: !951)
!947 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !948, file: !948, line: 110, type: !949, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!948 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!949 = !DISubroutineType(types: !950)
!950 = !{null, !951, !160}
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !952, size: 32)
!952 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !953)
!953 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !954)
!954 = !{!955}
!955 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !953, file: !487, line: 12, baseType: !491, size: 4096)
!956 = !DILocation(line: 0, scope: !947, inlinedAt: !957)
!957 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !806)
!958 = !DILocalVariable(name: "buf", arg: 2, scope: !947, file: !948, line: 110, type: !160)
!959 = !DILocation(line: 115, column: 3, scope: !947, inlinedAt: !957)
!960 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !806)
!961 = !DILocation(line: 223, column: 54, scope: !792)
!962 = !DILocation(line: 222, column: 22, scope: !792)
!963 = !DILocation(line: 222, column: 3, scope: !792)
!964 = distinct !{!964, !793, !965, !258}
!965 = !DILocation(line: 223, column: 56, scope: !789)
!966 = !DILocation(line: 224, scope: !795)
!967 = !DILocation(line: 224, column: 12, scope: !968)
!968 = distinct !DILexicalBlock(scope: !795, file: !476, line: 224, column: 3)
!969 = !DILocation(line: 173, column: 3, scope: !970, inlinedAt: !985)
!970 = distinct !DILexicalBlock(scope: !972, file: !971, line: 173, column: 3)
!971 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!972 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !971, file: !971, line: 170, type: !973, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!973 = !DISubroutineType(types: !974)
!974 = !{null, !975}
!975 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !976, size: 32)
!976 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !481, line: 10, baseType: !977)
!977 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !481, line: 8, size: 8192, elements: !978)
!978 = !{!979}
!979 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !977, file: !481, line: 9, baseType: !980, size: 8192)
!980 = !DICompositeType(tag: DW_TAG_array_type, baseType: !981, size: 8192, elements: !494)
!981 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !982)
!982 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !983)
!983 = !{!984}
!984 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !982, file: !487, line: 12, baseType: !491, size: 4096)
!985 = distinct !DILocation(line: 227, column: 3, scope: !760)
!986 = !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !987)
!987 = distinct !DILocation(line: 225, column: 5, scope: !968)
!988 = !DILocation(line: 0, scope: !797, inlinedAt: !987)
!989 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !987)
!990 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !991)
!991 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !987)
!992 = !DILocation(line: 0, scope: !817, inlinedAt: !991)
!993 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !991)
!994 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !991)
!995 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !991)
!996 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !997)
!997 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !998)
!998 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !991)
!999 = !DILocation(line: 0, scope: !836, inlinedAt: !998)
!1000 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !998)
!1001 = !DILocation(line: 0, scope: !834, inlinedAt: !997)
!1002 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !997)
!1003 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !997)
!1004 = !DILocation(line: 0, scope: !855, inlinedAt: !1005)
!1005 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !998)
!1006 = !DILocation(line: 0, scope: !604, inlinedAt: !1007)
!1007 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !1005)
!1008 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !1007)
!1009 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !1007)
!1010 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !1007)
!1011 = !DILocation(line: 509, scope: !618, inlinedAt: !1007)
!1012 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !1007)
!1013 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !1007)
!1014 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !1007)
!1015 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !1007)
!1016 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !1007)
!1017 = !DILocation(line: 0, scope: !627, inlinedAt: !1018)
!1018 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !1007)
!1019 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !1018)
!1020 = !DILocation(line: 43, scope: !635, inlinedAt: !1018)
!1021 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !1018)
!1022 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !1018)
!1023 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !1018)
!1024 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !1018)
!1025 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !1018)
!1026 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !1018)
!1027 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !1018)
!1028 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !1018)
!1029 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !1018)
!1030 = distinct !{!1030, !1022, !1031, !258}
!1031 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !1018)
!1032 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !1007)
!1033 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !1007)
!1034 = distinct !{!1034, !1013, !1035, !258}
!1035 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !1007)
!1036 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !1007)
!1037 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !1007)
!1038 = distinct !{!1038, !1008, !1039, !258}
!1039 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !1007)
!1040 = !DILocation(line: 732, column: 7, scope: !836, inlinedAt: !998)
!1041 = !DILocation(line: 0, scope: !896, inlinedAt: !1042)
!1042 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !998)
!1043 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !1042)
!1044 = !DILocation(line: 0, scope: !903, inlinedAt: !1045)
!1045 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !1042)
!1046 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !1045)
!1047 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !1045)
!1048 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !1045)
!1049 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !1045)
!1050 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !1045)
!1051 = !DILocation(line: 439, scope: !921, inlinedAt: !1045)
!1052 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !1045)
!1053 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !1045)
!1054 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !1045)
!1055 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !1045)
!1056 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !1045)
!1057 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !1045)
!1058 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !1045)
!1059 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !1045)
!1060 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !1045)
!1061 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !1045)
!1062 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !1045)
!1063 = distinct !{!1063, !1054, !1064, !258}
!1064 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !1045)
!1065 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !1045)
!1066 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !1045)
!1067 = distinct !{!1067, !1046, !1068, !258}
!1068 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !1045)
!1069 = !DILocation(line: 225, column: 25, scope: !968)
!1070 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !1042)
!1071 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !1042)
!1072 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !998)
!1073 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !991)
!1074 = !DILocation(line: 0, scope: !947, inlinedAt: !1075)
!1075 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !987)
!1076 = !DILocation(line: 115, column: 3, scope: !947, inlinedAt: !1075)
!1077 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !987)
!1078 = !DILocation(line: 225, column: 51, scope: !968)
!1079 = !DILocation(line: 224, column: 22, scope: !968)
!1080 = !DILocation(line: 224, column: 3, scope: !968)
!1081 = distinct !{!1081, !794, !1082, !258}
!1082 = !DILocation(line: 225, column: 53, scope: !795)
!1083 = !DILocation(line: 173, scope: !970, inlinedAt: !985)
!1084 = !DILocalVariable(name: "i", scope: !972, file: !971, line: 172, type: !40)
!1085 = !DILocation(line: 0, scope: !972, inlinedAt: !985)
!1086 = !DILocation(line: 173, column: 12, scope: !1087, inlinedAt: !985)
!1087 = distinct !DILexicalBlock(scope: !970, file: !971, line: 173, column: 3)
!1088 = !DILocation(line: 173, column: 3, scope: !970, inlinedAt: !1089)
!1089 = distinct !DILocation(line: 228, column: 3, scope: !760)
!1090 = !DILocation(line: 174, column: 15, scope: !1087, inlinedAt: !985)
!1091 = !DILocalVariable(name: "r", arg: 1, scope: !1092, file: !798, line: 261, type: !801)
!1092 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !798, file: !798, line: 261, type: !1093, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{null, !801}
!1095 = !DILocation(line: 0, scope: !1092, inlinedAt: !1096)
!1096 = distinct !DILocation(line: 174, column: 5, scope: !1087, inlinedAt: !985)
!1097 = !DILocation(line: 263, column: 3, scope: !1092, inlinedAt: !1096)
!1098 = !DILocalVariable(name: "r", arg: 1, scope: !1099, file: !798, line: 323, type: !801)
!1099 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !798, file: !798, line: 323, type: !1093, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1100 = !DILocation(line: 0, scope: !1099, inlinedAt: !1101)
!1101 = distinct !DILocation(line: 264, column: 3, scope: !1092, inlinedAt: !1096)
!1102 = !DILocalVariable(name: "i", scope: !1099, file: !798, line: 325, type: !40)
!1103 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1101)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !798, line: 326, column: 3)
!1105 = !DILocation(line: 326, scope: !1104, inlinedAt: !1101)
!1106 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1101)
!1107 = distinct !DILexicalBlock(scope: !1104, file: !798, line: 326, column: 3)
!1108 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1101)
!1109 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1101)
!1110 = !DILocalVariable(name: "a", arg: 1, scope: !1111, file: !1112, line: 35, type: !61)
!1111 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1112, file: !1112, line: 35, type: !1113, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1112 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1113 = !DISubroutineType(types: !1114)
!1114 = !{!61, !61}
!1115 = !DILocation(line: 0, scope: !1111, inlinedAt: !1116)
!1116 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1101)
!1117 = !DILocalVariable(name: "v", scope: !1111, file: !1112, line: 37, type: !60)
!1118 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1116)
!1119 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1116)
!1120 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1116)
!1121 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1116)
!1122 = !DILocalVariable(name: "t", scope: !1111, file: !1112, line: 36, type: !61)
!1123 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1116)
!1124 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1101)
!1125 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1101)
!1126 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1101)
!1127 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1101)
!1128 = distinct !{!1128, !1108, !1129, !258}
!1129 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1101)
!1130 = !DILocation(line: 173, column: 22, scope: !1087, inlinedAt: !985)
!1131 = !DILocation(line: 173, column: 3, scope: !1087, inlinedAt: !985)
!1132 = distinct !{!1132, !969, !1133, !258}
!1133 = !DILocation(line: 174, column: 24, scope: !970, inlinedAt: !985)
!1134 = !DILocation(line: 173, scope: !970, inlinedAt: !1089)
!1135 = !DILocation(line: 0, scope: !972, inlinedAt: !1089)
!1136 = !DILocation(line: 173, column: 12, scope: !1087, inlinedAt: !1089)
!1137 = !DILocation(line: 231, column: 3, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !760, file: !476, line: 231, column: 3)
!1139 = !DILocation(line: 174, column: 15, scope: !1087, inlinedAt: !1089)
!1140 = !DILocation(line: 0, scope: !1092, inlinedAt: !1141)
!1141 = distinct !DILocation(line: 174, column: 5, scope: !1087, inlinedAt: !1089)
!1142 = !DILocation(line: 263, column: 3, scope: !1092, inlinedAt: !1141)
!1143 = !DILocation(line: 0, scope: !1099, inlinedAt: !1144)
!1144 = distinct !DILocation(line: 264, column: 3, scope: !1092, inlinedAt: !1141)
!1145 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1144)
!1146 = !DILocation(line: 326, scope: !1104, inlinedAt: !1144)
!1147 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1144)
!1148 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1144)
!1149 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1144)
!1150 = !DILocation(line: 0, scope: !1111, inlinedAt: !1151)
!1151 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1144)
!1152 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1151)
!1153 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1151)
!1154 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1151)
!1155 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1151)
!1156 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1151)
!1157 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1144)
!1158 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1144)
!1159 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1144)
!1160 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1144)
!1161 = distinct !{!1161, !1148, !1162, !258}
!1162 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1144)
!1163 = !DILocation(line: 173, column: 22, scope: !1087, inlinedAt: !1089)
!1164 = !DILocation(line: 173, column: 3, scope: !1087, inlinedAt: !1089)
!1165 = distinct !{!1165, !1088, !1166, !258}
!1166 = !DILocation(line: 174, column: 24, scope: !970, inlinedAt: !1089)
!1167 = !DILocation(line: 231, scope: !1138)
!1168 = !DILocation(line: 231, column: 12, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1138, file: !476, line: 231, column: 3)
!1170 = !DILocation(line: 244, column: 3, scope: !1171, inlinedAt: !1177)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !971, line: 244, column: 3)
!1172 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !971, file: !971, line: 241, type: !1173, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{null, !975, !1175, !1175}
!1175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1176, size: 32)
!1176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !976)
!1177 = distinct !DILocation(line: 236, column: 3, scope: !760)
!1178 = !DILocation(line: 232, column: 37, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1169, file: !476, line: 231, column: 26)
!1180 = !DILocation(line: 232, column: 51, scope: !1179)
!1181 = !DILocation(line: 232, column: 5, scope: !1179)
!1182 = !DILocation(line: 233, column: 18, scope: !1179)
!1183 = !DILocalVariable(name: "r", arg: 1, scope: !1184, file: !798, line: 307, type: !801)
!1184 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !798, file: !798, line: 307, type: !1093, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1185 = !DILocation(line: 0, scope: !1184, inlinedAt: !1186)
!1186 = distinct !DILocation(line: 233, column: 5, scope: !1179)
!1187 = !DILocalVariable(name: "f", scope: !1184, file: !798, line: 310, type: !60)
!1188 = !DILocalVariable(name: "i", scope: !1184, file: !798, line: 309, type: !40)
!1189 = !DILocation(line: 311, column: 7, scope: !1190, inlinedAt: !1186)
!1190 = distinct !DILexicalBlock(scope: !1184, file: !798, line: 311, column: 3)
!1191 = !DILocation(line: 311, scope: !1190, inlinedAt: !1186)
!1192 = !DILocation(line: 311, column: 12, scope: !1193, inlinedAt: !1186)
!1193 = distinct !DILexicalBlock(scope: !1190, file: !798, line: 311, column: 3)
!1194 = !DILocation(line: 311, column: 3, scope: !1190, inlinedAt: !1186)
!1195 = !DILocation(line: 312, column: 47, scope: !1193, inlinedAt: !1186)
!1196 = !DILocation(line: 312, column: 38, scope: !1193, inlinedAt: !1186)
!1197 = !DILocation(line: 312, column: 59, scope: !1193, inlinedAt: !1186)
!1198 = !DILocalVariable(name: "a", arg: 1, scope: !1199, file: !1112, line: 16, type: !55)
!1199 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1112, file: !1112, line: 16, type: !1200, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1200 = !DISubroutineType(types: !98)
!1201 = !DILocation(line: 0, scope: !1199, inlinedAt: !1202)
!1202 = distinct !DILocation(line: 312, column: 20, scope: !1193, inlinedAt: !1186)
!1203 = !DILocalVariable(name: "t", scope: !1199, file: !1112, line: 18, type: !61)
!1204 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !1202)
!1205 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !1202)
!1206 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !1202)
!1207 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !1202)
!1208 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !1202)
!1209 = !DILocation(line: 312, column: 5, scope: !1193, inlinedAt: !1186)
!1210 = !DILocation(line: 312, column: 18, scope: !1193, inlinedAt: !1186)
!1211 = !DILocation(line: 311, column: 22, scope: !1193, inlinedAt: !1186)
!1212 = !DILocation(line: 311, column: 3, scope: !1193, inlinedAt: !1186)
!1213 = distinct !{!1213, !1194, !1214, !258}
!1214 = !DILocation(line: 312, column: 61, scope: !1190, inlinedAt: !1186)
!1215 = !DILocation(line: 231, column: 22, scope: !1169)
!1216 = !DILocation(line: 231, column: 3, scope: !1169)
!1217 = distinct !{!1217, !1137, !1218, !258}
!1218 = !DILocation(line: 234, column: 3, scope: !1138)
!1219 = !DILocation(line: 244, scope: !1171, inlinedAt: !1177)
!1220 = !DILocalVariable(name: "i", scope: !1172, file: !971, line: 243, type: !40)
!1221 = !DILocation(line: 0, scope: !1172, inlinedAt: !1177)
!1222 = !DILocation(line: 244, column: 12, scope: !1223, inlinedAt: !1177)
!1223 = distinct !DILexicalBlock(scope: !1171, file: !971, line: 244, column: 3)
!1224 = !DILocation(line: 228, column: 3, scope: !1225, inlinedAt: !1227)
!1225 = distinct !DILexicalBlock(scope: !1226, file: !971, line: 228, column: 3)
!1226 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !971, file: !971, line: 225, type: !973, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1227 = distinct !DILocation(line: 237, column: 3, scope: !760)
!1228 = !DILocation(line: 245, column: 15, scope: !1223, inlinedAt: !1177)
!1229 = !DILocation(line: 245, column: 27, scope: !1223, inlinedAt: !1177)
!1230 = !DILocation(line: 245, column: 39, scope: !1223, inlinedAt: !1177)
!1231 = !DILocalVariable(name: "r", arg: 1, scope: !1232, file: !798, line: 339, type: !801)
!1232 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !798, file: !798, line: 339, type: !1233, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{null, !801, !1235, !1235}
!1235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1236, size: 32)
!1236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !802)
!1237 = !DILocation(line: 0, scope: !1232, inlinedAt: !1238)
!1238 = distinct !DILocation(line: 245, column: 5, scope: !1223, inlinedAt: !1177)
!1239 = !DILocalVariable(name: "a", arg: 2, scope: !1232, file: !798, line: 339, type: !1235)
!1240 = !DILocalVariable(name: "b", arg: 3, scope: !1232, file: !798, line: 339, type: !1235)
!1241 = !DILocalVariable(name: "i", scope: !1232, file: !798, line: 341, type: !40)
!1242 = !DILocation(line: 342, column: 7, scope: !1243, inlinedAt: !1238)
!1243 = distinct !DILexicalBlock(scope: !1232, file: !798, line: 342, column: 3)
!1244 = !DILocation(line: 342, scope: !1243, inlinedAt: !1238)
!1245 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !1238)
!1246 = distinct !DILexicalBlock(scope: !1243, file: !798, line: 342, column: 3)
!1247 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !1238)
!1248 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !1238)
!1249 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !1238)
!1250 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !1238)
!1251 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !1238)
!1252 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !1238)
!1253 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !1238)
!1254 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !1238)
!1255 = distinct !{!1255, !1247, !1256, !258}
!1256 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !1238)
!1257 = !DILocation(line: 244, column: 22, scope: !1223, inlinedAt: !1177)
!1258 = !DILocation(line: 244, column: 3, scope: !1223, inlinedAt: !1177)
!1259 = distinct !{!1259, !1170, !1260, !258}
!1260 = !DILocation(line: 245, column: 48, scope: !1171, inlinedAt: !1177)
!1261 = !DILocation(line: 228, scope: !1225, inlinedAt: !1227)
!1262 = !DILocalVariable(name: "i", scope: !1226, file: !971, line: 227, type: !40)
!1263 = !DILocation(line: 0, scope: !1226, inlinedAt: !1227)
!1264 = !DILocation(line: 228, column: 12, scope: !1265, inlinedAt: !1227)
!1265 = distinct !DILexicalBlock(scope: !1225, file: !971, line: 228, column: 3)
!1266 = !DILocation(line: 142, column: 3, scope: !1267, inlinedAt: !1271)
!1267 = distinct !DILexicalBlock(scope: !1268, file: !971, line: 142, column: 3)
!1268 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !971, file: !971, line: 139, type: !1269, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{null, !32, !1175}
!1271 = distinct !DILocation(line: 59, column: 3, scope: !1272, inlinedAt: !1275)
!1272 = distinct !DISubprogram(name: "pack_sk", scope: !476, file: !476, line: 57, type: !1273, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{null, !32, !479}
!1275 = distinct !DILocation(line: 239, column: 3, scope: !760)
!1276 = !DILocation(line: 229, column: 18, scope: !1265, inlinedAt: !1227)
!1277 = !DILocation(line: 0, scope: !1099, inlinedAt: !1278)
!1278 = distinct !DILocation(line: 229, column: 5, scope: !1265, inlinedAt: !1227)
!1279 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1278)
!1280 = !DILocation(line: 326, scope: !1104, inlinedAt: !1278)
!1281 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1278)
!1282 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1278)
!1283 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1278)
!1284 = !DILocation(line: 0, scope: !1111, inlinedAt: !1285)
!1285 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1278)
!1286 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1285)
!1287 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1285)
!1288 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1285)
!1289 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1285)
!1290 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1285)
!1291 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1278)
!1292 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1278)
!1293 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1278)
!1294 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1278)
!1295 = distinct !{!1295, !1282, !1296, !258}
!1296 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1278)
!1297 = !DILocation(line: 228, column: 22, scope: !1265, inlinedAt: !1227)
!1298 = !DILocation(line: 228, column: 3, scope: !1265, inlinedAt: !1227)
!1299 = distinct !{!1299, !1224, !1300, !258}
!1300 = !DILocation(line: 229, column: 27, scope: !1225, inlinedAt: !1227)
!1301 = !DILocation(line: 142, scope: !1267, inlinedAt: !1271)
!1302 = !DILocalVariable(name: "i", scope: !1268, file: !971, line: 141, type: !40)
!1303 = !DILocation(line: 0, scope: !1268, inlinedAt: !1271)
!1304 = !DILocation(line: 142, column: 12, scope: !1305, inlinedAt: !1271)
!1305 = distinct !DILexicalBlock(scope: !1267, file: !971, line: 142, column: 3)
!1306 = !DILocation(line: 142, column: 3, scope: !1267, inlinedAt: !1307)
!1307 = distinct !DILocation(line: 27, column: 3, scope: !1308, inlinedAt: !1311)
!1308 = distinct !DISubprogram(name: "pack_pk", scope: !476, file: !476, line: 23, type: !1309, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1309 = !DISubroutineType(types: !1310)
!1310 = !{null, !32, !479, !160}
!1311 = distinct !DILocation(line: 240, column: 3, scope: !760)
!1312 = !DILocation(line: 143, column: 21, scope: !1305, inlinedAt: !1271)
!1313 = !DILocation(line: 143, column: 19, scope: !1305, inlinedAt: !1271)
!1314 = !DILocation(line: 143, column: 40, scope: !1305, inlinedAt: !1271)
!1315 = !DILocation(line: 143, column: 5, scope: !1305, inlinedAt: !1271)
!1316 = !DILocation(line: 142, column: 22, scope: !1305, inlinedAt: !1271)
!1317 = !DILocation(line: 142, column: 3, scope: !1305, inlinedAt: !1271)
!1318 = distinct !{!1318, !1266, !1319, !258}
!1319 = !DILocation(line: 143, column: 49, scope: !1267, inlinedAt: !1271)
!1320 = !DILocation(line: 142, scope: !1267, inlinedAt: !1307)
!1321 = !DILocation(line: 0, scope: !1268, inlinedAt: !1307)
!1322 = !DILocation(line: 142, column: 12, scope: !1305, inlinedAt: !1307)
!1323 = !DILocation(line: 143, column: 21, scope: !1305, inlinedAt: !1307)
!1324 = !DILocation(line: 143, column: 19, scope: !1305, inlinedAt: !1307)
!1325 = !DILocation(line: 143, column: 40, scope: !1305, inlinedAt: !1307)
!1326 = !DILocation(line: 143, column: 5, scope: !1305, inlinedAt: !1307)
!1327 = !DILocation(line: 142, column: 22, scope: !1305, inlinedAt: !1307)
!1328 = !DILocation(line: 142, column: 3, scope: !1305, inlinedAt: !1307)
!1329 = distinct !{!1329, !1306, !1330, !258}
!1330 = !DILocation(line: 143, column: 49, scope: !1267, inlinedAt: !1307)
!1331 = !DILocation(line: 28, column: 11, scope: !1308, inlinedAt: !1311)
!1332 = !DILocation(line: 28, column: 3, scope: !1308, inlinedAt: !1311)
!1333 = !DILocation(line: 241, column: 1, scope: !760)
!1334 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !476, file: !476, line: 260, type: !1335, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{null, !32, !160, !160, !160}
!1337 = !DILocalVariable(name: "c", arg: 1, scope: !1334, file: !476, line: 260, type: !32)
!1338 = !DILocation(line: 0, scope: !1334)
!1339 = !DILocalVariable(name: "m", arg: 2, scope: !1334, file: !476, line: 261, type: !160)
!1340 = !DILocalVariable(name: "pk", arg: 3, scope: !1334, file: !476, line: 262, type: !160)
!1341 = !DILocalVariable(name: "coins", arg: 4, scope: !1334, file: !476, line: 263, type: !160)
!1342 = !DILocalVariable(name: "seed", scope: !1334, file: !476, line: 266, type: !142)
!1343 = !DILocation(line: 266, column: 11, scope: !1334)
!1344 = !DILocalVariable(name: "nonce", scope: !1334, file: !476, line: 267, type: !33)
!1345 = !DILocalVariable(name: "sp", scope: !1334, file: !476, line: 268, type: !480)
!1346 = !DILocation(line: 268, column: 11, scope: !1334)
!1347 = !DILocalVariable(name: "pkpv", scope: !1334, file: !476, line: 268, type: !480)
!1348 = !DILocation(line: 268, column: 15, scope: !1334)
!1349 = !DILocalVariable(name: "ep", scope: !1334, file: !476, line: 268, type: !480)
!1350 = !DILocation(line: 268, column: 21, scope: !1334)
!1351 = !DILocalVariable(name: "at", scope: !1334, file: !476, line: 268, type: !774)
!1352 = !DILocation(line: 268, column: 25, scope: !1334)
!1353 = !DILocalVariable(name: "b", scope: !1334, file: !476, line: 268, type: !480)
!1354 = !DILocation(line: 268, column: 38, scope: !1334)
!1355 = !DILocalVariable(name: "v", scope: !1334, file: !476, line: 269, type: !486)
!1356 = !DILocation(line: 269, column: 8, scope: !1334)
!1357 = !DILocalVariable(name: "k", scope: !1334, file: !476, line: 269, type: !486)
!1358 = !DILocation(line: 269, column: 11, scope: !1334)
!1359 = !DILocalVariable(name: "epp", scope: !1334, file: !476, line: 269, type: !486)
!1360 = !DILocation(line: 269, column: 14, scope: !1334)
!1361 = !DILocalVariable(name: "pk", arg: 1, scope: !1362, file: !476, line: 41, type: !479)
!1362 = distinct !DISubprogram(name: "unpack_pk", scope: !476, file: !476, line: 41, type: !1363, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{null, !479, !32, !160}
!1365 = !DILocation(line: 0, scope: !1362, inlinedAt: !1366)
!1366 = distinct !DILocation(line: 271, column: 3, scope: !1334)
!1367 = !DILocalVariable(name: "seed", arg: 2, scope: !1362, file: !476, line: 42, type: !32)
!1368 = !DILocalVariable(name: "packedpk", arg: 3, scope: !1362, file: !476, line: 43, type: !160)
!1369 = !DILocalVariable(name: "r", arg: 1, scope: !1370, file: !971, line: 156, type: !975)
!1370 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !971, file: !971, line: 156, type: !1371, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{null, !975, !160}
!1373 = !DILocation(line: 0, scope: !1370, inlinedAt: !1374)
!1374 = distinct !DILocation(line: 45, column: 3, scope: !1362, inlinedAt: !1366)
!1375 = !DILocalVariable(name: "a", arg: 2, scope: !1370, file: !971, line: 156, type: !160)
!1376 = !DILocalVariable(name: "i", scope: !1370, file: !971, line: 158, type: !40)
!1377 = !DILocation(line: 159, column: 7, scope: !1378, inlinedAt: !1374)
!1378 = distinct !DILexicalBlock(scope: !1370, file: !971, line: 159, column: 3)
!1379 = !DILocation(line: 159, scope: !1378, inlinedAt: !1374)
!1380 = !DILocation(line: 159, column: 12, scope: !1381, inlinedAt: !1374)
!1381 = distinct !DILexicalBlock(scope: !1378, file: !971, line: 159, column: 3)
!1382 = !DILocation(line: 159, column: 3, scope: !1378, inlinedAt: !1374)
!1383 = !DILocation(line: 160, column: 21, scope: !1381, inlinedAt: !1374)
!1384 = !DILocation(line: 160, column: 35, scope: !1381, inlinedAt: !1374)
!1385 = !DILocation(line: 160, column: 33, scope: !1381, inlinedAt: !1374)
!1386 = !DILocation(line: 160, column: 5, scope: !1381, inlinedAt: !1374)
!1387 = !DILocation(line: 159, column: 22, scope: !1381, inlinedAt: !1374)
!1388 = !DILocation(line: 159, column: 3, scope: !1381, inlinedAt: !1374)
!1389 = distinct !{!1389, !1382, !1390, !258}
!1390 = !DILocation(line: 160, column: 51, scope: !1378, inlinedAt: !1374)
!1391 = !DILocation(line: 46, column: 24, scope: !1362, inlinedAt: !1366)
!1392 = !DILocation(line: 46, column: 3, scope: !1362, inlinedAt: !1366)
!1393 = !DILocalVariable(name: "r", arg: 1, scope: !1394, file: !798, line: 168, type: !801)
!1394 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !798, file: !798, line: 168, type: !1395, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1395 = !DISubroutineType(types: !1396)
!1396 = !{null, !801, !160}
!1397 = !DILocation(line: 0, scope: !1394, inlinedAt: !1398)
!1398 = distinct !DILocation(line: 272, column: 3, scope: !1334)
!1399 = !DILocalVariable(name: "msg", arg: 2, scope: !1394, file: !798, line: 168, type: !160)
!1400 = !DILocalVariable(name: "i", scope: !1394, file: !798, line: 170, type: !40)
!1401 = !DILocation(line: 176, column: 7, scope: !1402, inlinedAt: !1398)
!1402 = distinct !DILexicalBlock(scope: !1394, file: !798, line: 176, column: 3)
!1403 = !DILocation(line: 176, scope: !1402, inlinedAt: !1398)
!1404 = !DILocation(line: 176, column: 12, scope: !1405, inlinedAt: !1398)
!1405 = distinct !DILexicalBlock(scope: !1402, file: !798, line: 176, column: 3)
!1406 = !DILocation(line: 176, column: 3, scope: !1402, inlinedAt: !1398)
!1407 = !DILocation(line: 177, column: 5, scope: !1408, inlinedAt: !1398)
!1408 = distinct !DILexicalBlock(scope: !1409, file: !798, line: 177, column: 5)
!1409 = distinct !DILexicalBlock(scope: !1405, file: !798, line: 176, column: 28)
!1410 = !DILocation(line: 177, scope: !1408, inlinedAt: !1398)
!1411 = !DILocalVariable(name: "j", scope: !1394, file: !798, line: 170, type: !40)
!1412 = !DILocation(line: 177, column: 14, scope: !1413, inlinedAt: !1398)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !798, line: 177, column: 5)
!1414 = !DILocation(line: 178, column: 18, scope: !1415, inlinedAt: !1398)
!1415 = distinct !DILexicalBlock(scope: !1413, file: !798, line: 177, column: 22)
!1416 = !DILocation(line: 178, column: 20, scope: !1415, inlinedAt: !1398)
!1417 = !DILocation(line: 178, column: 7, scope: !1415, inlinedAt: !1398)
!1418 = !DILocation(line: 178, column: 24, scope: !1415, inlinedAt: !1398)
!1419 = !DILocation(line: 179, column: 27, scope: !1415, inlinedAt: !1398)
!1420 = !DILocation(line: 179, column: 31, scope: !1415, inlinedAt: !1398)
!1421 = !DILocation(line: 179, column: 53, scope: !1415, inlinedAt: !1398)
!1422 = !DILocalVariable(name: "r", arg: 1, scope: !1423, file: !418, line: 71, type: !719)
!1423 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !418, file: !418, line: 71, type: !1424, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{null, !719, !61, !86}
!1426 = !DILocation(line: 0, scope: !1423, inlinedAt: !1427)
!1427 = distinct !DILocation(line: 179, column: 7, scope: !1415, inlinedAt: !1398)
!1428 = !DILocalVariable(name: "v", arg: 2, scope: !1423, file: !418, line: 71, type: !61)
!1429 = !DILocalVariable(name: "b", arg: 3, scope: !1423, file: !418, line: 71, type: !86)
!1430 = !DILocation(line: 74, column: 15, scope: !1423, inlinedAt: !1427)
!1431 = !DILocation(line: 74, column: 11, scope: !1423, inlinedAt: !1427)
!1432 = !DILocation(line: 74, column: 6, scope: !1423, inlinedAt: !1427)
!1433 = !DILocation(line: 177, column: 18, scope: !1413, inlinedAt: !1398)
!1434 = !DILocation(line: 177, column: 5, scope: !1413, inlinedAt: !1398)
!1435 = distinct !{!1435, !1407, !1436, !258}
!1436 = !DILocation(line: 180, column: 5, scope: !1408, inlinedAt: !1398)
!1437 = !DILocation(line: 176, column: 24, scope: !1405, inlinedAt: !1398)
!1438 = !DILocation(line: 176, column: 3, scope: !1405, inlinedAt: !1398)
!1439 = distinct !{!1439, !1406, !1440, !258}
!1440 = !DILocation(line: 181, column: 3, scope: !1402, inlinedAt: !1398)
!1441 = !DILocation(line: 273, column: 3, scope: !1334)
!1442 = !DILocalVariable(name: "i", scope: !1334, file: !476, line: 265, type: !40)
!1443 = !DILocation(line: 275, column: 7, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1334, file: !476, line: 275, column: 3)
!1445 = !DILocation(line: 275, scope: !1444)
!1446 = !DILocation(line: 275, column: 12, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1444, file: !476, line: 275, column: 3)
!1448 = !DILocation(line: 275, column: 3, scope: !1444)
!1449 = !DILocation(line: 277, column: 3, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1334, file: !476, line: 277, column: 3)
!1451 = !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !1452)
!1452 = distinct !DILocation(line: 276, column: 5, scope: !1447)
!1453 = !DILocation(line: 0, scope: !797, inlinedAt: !1452)
!1454 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !1452)
!1455 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !1456)
!1456 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !1452)
!1457 = !DILocation(line: 0, scope: !817, inlinedAt: !1456)
!1458 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !1456)
!1459 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !1456)
!1460 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !1456)
!1461 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !1462)
!1462 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !1463)
!1463 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !1456)
!1464 = !DILocation(line: 0, scope: !836, inlinedAt: !1463)
!1465 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !1463)
!1466 = !DILocation(line: 0, scope: !834, inlinedAt: !1462)
!1467 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !1462)
!1468 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !1462)
!1469 = !DILocation(line: 0, scope: !855, inlinedAt: !1470)
!1470 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !1463)
!1471 = !DILocation(line: 0, scope: !604, inlinedAt: !1472)
!1472 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !1470)
!1473 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !1472)
!1474 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !1472)
!1475 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !1472)
!1476 = !DILocation(line: 509, scope: !618, inlinedAt: !1472)
!1477 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !1472)
!1478 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !1472)
!1479 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !1472)
!1480 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !1472)
!1481 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !1472)
!1482 = !DILocation(line: 0, scope: !627, inlinedAt: !1483)
!1483 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !1472)
!1484 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !1483)
!1485 = !DILocation(line: 43, scope: !635, inlinedAt: !1483)
!1486 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !1483)
!1487 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !1483)
!1488 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !1483)
!1489 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !1483)
!1490 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !1483)
!1491 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !1483)
!1492 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !1483)
!1493 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !1483)
!1494 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !1483)
!1495 = distinct !{!1495, !1487, !1496, !258}
!1496 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !1483)
!1497 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !1472)
!1498 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !1472)
!1499 = distinct !{!1499, !1478, !1500, !258}
!1500 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !1472)
!1501 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !1472)
!1502 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !1472)
!1503 = distinct !{!1503, !1473, !1504, !258}
!1504 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !1472)
!1505 = !DILocation(line: 732, column: 7, scope: !836, inlinedAt: !1463)
!1506 = !DILocation(line: 0, scope: !896, inlinedAt: !1507)
!1507 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !1463)
!1508 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !1507)
!1509 = !DILocation(line: 0, scope: !903, inlinedAt: !1510)
!1510 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !1507)
!1511 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !1510)
!1512 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !1510)
!1513 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !1510)
!1514 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !1510)
!1515 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !1510)
!1516 = !DILocation(line: 439, scope: !921, inlinedAt: !1510)
!1517 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !1510)
!1518 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !1510)
!1519 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !1510)
!1520 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !1510)
!1521 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !1510)
!1522 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !1510)
!1523 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !1510)
!1524 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !1510)
!1525 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !1510)
!1526 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !1510)
!1527 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !1510)
!1528 = distinct !{!1528, !1519, !1529, !258}
!1529 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !1510)
!1530 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !1510)
!1531 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !1510)
!1532 = distinct !{!1532, !1511, !1533, !258}
!1533 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !1510)
!1534 = !DILocation(line: 276, column: 30, scope: !1447)
!1535 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !1507)
!1536 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !1507)
!1537 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !1463)
!1538 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !1456)
!1539 = !DILocation(line: 0, scope: !947, inlinedAt: !1540)
!1540 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !1452)
!1541 = !DILocation(line: 115, column: 3, scope: !947, inlinedAt: !1540)
!1542 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !1452)
!1543 = !DILocation(line: 276, column: 46, scope: !1447)
!1544 = !DILocation(line: 275, column: 22, scope: !1447)
!1545 = !DILocation(line: 275, column: 3, scope: !1447)
!1546 = distinct !{!1546, !1448, !1547, !258}
!1547 = !DILocation(line: 276, column: 48, scope: !1444)
!1548 = !DILocation(line: 277, scope: !1450)
!1549 = !DILocation(line: 277, column: 12, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1450, file: !476, line: 277, column: 3)
!1551 = !DILocation(line: 247, column: 3, scope: !1552, inlinedAt: !1553)
!1552 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !798, file: !798, line: 244, type: !799, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1553 = distinct !DILocation(line: 278, column: 5, scope: !1550)
!1554 = !DILocalVariable(name: "r", arg: 1, scope: !1552, file: !798, line: 244, type: !801)
!1555 = !DILocation(line: 0, scope: !1552, inlinedAt: !1553)
!1556 = !DILocalVariable(name: "seed", arg: 2, scope: !1552, file: !798, line: 244, type: !160)
!1557 = !DILocalVariable(name: "nonce", arg: 3, scope: !1552, file: !798, line: 244, type: !33)
!1558 = !DILocalVariable(name: "buf", scope: !1552, file: !798, line: 246, type: !1559)
!1559 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1560 = !DILocation(line: 246, column: 11, scope: !1552, inlinedAt: !1553)
!1561 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !1562)
!1562 = distinct !DILocation(line: 247, column: 3, scope: !1552, inlinedAt: !1553)
!1563 = !DILocation(line: 0, scope: !817, inlinedAt: !1562)
!1564 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !1562)
!1565 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !1562)
!1566 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !1562)
!1567 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !1568)
!1568 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !1569)
!1569 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !1562)
!1570 = !DILocation(line: 0, scope: !836, inlinedAt: !1569)
!1571 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !1569)
!1572 = !DILocation(line: 0, scope: !834, inlinedAt: !1568)
!1573 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !1568)
!1574 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !1568)
!1575 = !DILocation(line: 0, scope: !855, inlinedAt: !1576)
!1576 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !1569)
!1577 = !DILocation(line: 0, scope: !604, inlinedAt: !1578)
!1578 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !1576)
!1579 = !DILocation(line: 0, scope: !896, inlinedAt: !1580)
!1580 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !1569)
!1581 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !1580)
!1582 = !DILocation(line: 0, scope: !903, inlinedAt: !1583)
!1583 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !1580)
!1584 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !1583)
!1585 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !1583)
!1586 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !1583)
!1587 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !1583)
!1588 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !1583)
!1589 = !DILocation(line: 439, scope: !921, inlinedAt: !1583)
!1590 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !1583)
!1591 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !1583)
!1592 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !1583)
!1593 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !1583)
!1594 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !1583)
!1595 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !1583)
!1596 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !1583)
!1597 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !1583)
!1598 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !1583)
!1599 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !1583)
!1600 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !1583)
!1601 = distinct !{!1601, !1592, !1602, !258}
!1602 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !1583)
!1603 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !1583)
!1604 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !1583)
!1605 = distinct !{!1605, !1584, !1606, !258}
!1606 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !1583)
!1607 = !DILocation(line: 278, column: 30, scope: !1550)
!1608 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !1580)
!1609 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !1580)
!1610 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !1569)
!1611 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !1562)
!1612 = !DILocalVariable(name: "r", arg: 1, scope: !1613, file: !948, line: 121, type: !951)
!1613 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !948, file: !948, line: 121, type: !949, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1614 = !DILocation(line: 0, scope: !1613, inlinedAt: !1615)
!1615 = distinct !DILocation(line: 248, column: 3, scope: !1552, inlinedAt: !1553)
!1616 = !DILocalVariable(name: "buf", arg: 2, scope: !1613, file: !948, line: 121, type: !160)
!1617 = !DILocation(line: 124, column: 3, scope: !1613, inlinedAt: !1615)
!1618 = !DILocation(line: 249, column: 1, scope: !1552, inlinedAt: !1553)
!1619 = !DILocation(line: 278, column: 46, scope: !1550)
!1620 = !DILocation(line: 277, column: 22, scope: !1550)
!1621 = !DILocation(line: 277, column: 3, scope: !1550)
!1622 = distinct !{!1622, !1449, !1623, !258}
!1623 = !DILocation(line: 278, column: 48, scope: !1450)
!1624 = !DILocation(line: 247, column: 3, scope: !1552, inlinedAt: !1625)
!1625 = distinct !DILocation(line: 279, column: 3, scope: !1334)
!1626 = !DILocation(line: 0, scope: !1552, inlinedAt: !1625)
!1627 = !DILocation(line: 246, column: 11, scope: !1552, inlinedAt: !1625)
!1628 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 247, column: 3, scope: !1552, inlinedAt: !1625)
!1630 = !DILocation(line: 0, scope: !817, inlinedAt: !1629)
!1631 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !1629)
!1632 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !1629)
!1633 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !1629)
!1634 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !1636)
!1636 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !1629)
!1637 = !DILocation(line: 0, scope: !836, inlinedAt: !1636)
!1638 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !1636)
!1639 = !DILocation(line: 0, scope: !834, inlinedAt: !1635)
!1640 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !1635)
!1641 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !1635)
!1642 = !DILocation(line: 0, scope: !855, inlinedAt: !1643)
!1643 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !1636)
!1644 = !DILocation(line: 0, scope: !604, inlinedAt: !1645)
!1645 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !1643)
!1646 = !DILocation(line: 0, scope: !896, inlinedAt: !1647)
!1647 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !1636)
!1648 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !1647)
!1649 = !DILocation(line: 0, scope: !903, inlinedAt: !1650)
!1650 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !1647)
!1651 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !1650)
!1652 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !1650)
!1653 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !1650)
!1654 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !1650)
!1655 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !1650)
!1656 = !DILocation(line: 439, scope: !921, inlinedAt: !1650)
!1657 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !1650)
!1658 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !1650)
!1659 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !1650)
!1660 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !1650)
!1661 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !1650)
!1662 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !1650)
!1663 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !1650)
!1664 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !1650)
!1665 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !1650)
!1666 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !1650)
!1667 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !1650)
!1668 = distinct !{!1668, !1659, !1669, !258}
!1669 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !1650)
!1670 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !1650)
!1671 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !1650)
!1672 = distinct !{!1672, !1651, !1673, !258}
!1673 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !1650)
!1674 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !1647)
!1675 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !1647)
!1676 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !1636)
!1677 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !1629)
!1678 = !DILocation(line: 0, scope: !1613, inlinedAt: !1679)
!1679 = distinct !DILocation(line: 248, column: 3, scope: !1552, inlinedAt: !1625)
!1680 = !DILocation(line: 124, column: 3, scope: !1613, inlinedAt: !1679)
!1681 = !DILocation(line: 249, column: 1, scope: !1552, inlinedAt: !1625)
!1682 = !DILocalVariable(name: "r", arg: 1, scope: !972, file: !971, line: 170, type: !975)
!1683 = !DILocation(line: 0, scope: !972, inlinedAt: !1684)
!1684 = distinct !DILocation(line: 281, column: 3, scope: !1334)
!1685 = !DILocation(line: 173, column: 7, scope: !970, inlinedAt: !1684)
!1686 = !DILocation(line: 173, scope: !970, inlinedAt: !1684)
!1687 = !DILocation(line: 173, column: 12, scope: !1087, inlinedAt: !1684)
!1688 = !DILocation(line: 173, column: 3, scope: !970, inlinedAt: !1684)
!1689 = !DILocation(line: 284, column: 3, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1334, file: !476, line: 284, column: 3)
!1691 = !DILocation(line: 174, column: 15, scope: !1087, inlinedAt: !1684)
!1692 = !DILocation(line: 0, scope: !1092, inlinedAt: !1693)
!1693 = distinct !DILocation(line: 174, column: 5, scope: !1087, inlinedAt: !1684)
!1694 = !DILocation(line: 263, column: 3, scope: !1092, inlinedAt: !1693)
!1695 = !DILocation(line: 0, scope: !1099, inlinedAt: !1696)
!1696 = distinct !DILocation(line: 264, column: 3, scope: !1092, inlinedAt: !1693)
!1697 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1696)
!1698 = !DILocation(line: 326, scope: !1104, inlinedAt: !1696)
!1699 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1696)
!1700 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1696)
!1701 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1696)
!1702 = !DILocation(line: 0, scope: !1111, inlinedAt: !1703)
!1703 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1696)
!1704 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1703)
!1705 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1703)
!1706 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1703)
!1707 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1703)
!1708 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1703)
!1709 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1696)
!1710 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1696)
!1711 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1696)
!1712 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1696)
!1713 = distinct !{!1713, !1700, !1714, !258}
!1714 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1696)
!1715 = !DILocation(line: 173, column: 22, scope: !1087, inlinedAt: !1684)
!1716 = !DILocation(line: 173, column: 3, scope: !1087, inlinedAt: !1684)
!1717 = distinct !{!1717, !1688, !1718, !258}
!1718 = !DILocation(line: 174, column: 24, scope: !970, inlinedAt: !1684)
!1719 = !DILocation(line: 284, scope: !1690)
!1720 = !DILocation(line: 284, column: 12, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1690, file: !476, line: 284, column: 3)
!1722 = !DILocation(line: 285, column: 37, scope: !1721)
!1723 = !DILocation(line: 285, column: 48, scope: !1721)
!1724 = !DILocation(line: 285, column: 5, scope: !1721)
!1725 = !DILocation(line: 284, column: 22, scope: !1721)
!1726 = !DILocation(line: 284, column: 3, scope: !1721)
!1727 = distinct !{!1727, !1689, !1728, !258}
!1728 = !DILocation(line: 285, column: 58, scope: !1690)
!1729 = !DILocation(line: 287, column: 3, scope: !1334)
!1730 = !DILocalVariable(name: "r", arg: 1, scope: !1731, file: !971, line: 185, type: !975)
!1731 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !971, file: !971, line: 185, type: !973, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1732 = !DILocation(line: 0, scope: !1731, inlinedAt: !1733)
!1733 = distinct !DILocation(line: 289, column: 3, scope: !1334)
!1734 = !DILocalVariable(name: "i", scope: !1731, file: !971, line: 187, type: !40)
!1735 = !DILocation(line: 188, column: 7, scope: !1736, inlinedAt: !1733)
!1736 = distinct !DILexicalBlock(scope: !1731, file: !971, line: 188, column: 3)
!1737 = !DILocation(line: 188, scope: !1736, inlinedAt: !1733)
!1738 = !DILocation(line: 188, column: 12, scope: !1739, inlinedAt: !1733)
!1739 = distinct !DILexicalBlock(scope: !1736, file: !971, line: 188, column: 3)
!1740 = !DILocation(line: 188, column: 3, scope: !1736, inlinedAt: !1733)
!1741 = !DILocation(line: 189, column: 25, scope: !1739, inlinedAt: !1733)
!1742 = !DILocalVariable(name: "r", arg: 1, scope: !1743, file: !798, line: 276, type: !801)
!1743 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !798, file: !798, line: 276, type: !1093, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1744 = !DILocation(line: 0, scope: !1743, inlinedAt: !1745)
!1745 = distinct !DILocation(line: 189, column: 5, scope: !1739, inlinedAt: !1733)
!1746 = !DILocation(line: 278, column: 3, scope: !1743, inlinedAt: !1745)
!1747 = !DILocation(line: 188, column: 22, scope: !1739, inlinedAt: !1733)
!1748 = !DILocation(line: 188, column: 3, scope: !1739, inlinedAt: !1733)
!1749 = distinct !{!1749, !1740, !1750, !258}
!1750 = !DILocation(line: 189, column: 34, scope: !1736, inlinedAt: !1733)
!1751 = !DILocation(line: 0, scope: !1743, inlinedAt: !1752)
!1752 = distinct !DILocation(line: 290, column: 3, scope: !1334)
!1753 = !DILocation(line: 278, column: 3, scope: !1743, inlinedAt: !1752)
!1754 = !DILocalVariable(name: "r", arg: 1, scope: !1172, file: !971, line: 241, type: !975)
!1755 = !DILocation(line: 0, scope: !1172, inlinedAt: !1756)
!1756 = distinct !DILocation(line: 292, column: 3, scope: !1334)
!1757 = !DILocalVariable(name: "a", arg: 2, scope: !1172, file: !971, line: 241, type: !1175)
!1758 = !DILocalVariable(name: "b", arg: 3, scope: !1172, file: !971, line: 241, type: !1175)
!1759 = !DILocation(line: 244, column: 7, scope: !1171, inlinedAt: !1756)
!1760 = !DILocation(line: 244, scope: !1171, inlinedAt: !1756)
!1761 = !DILocation(line: 244, column: 12, scope: !1223, inlinedAt: !1756)
!1762 = !DILocation(line: 244, column: 3, scope: !1171, inlinedAt: !1756)
!1763 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !1764)
!1764 = distinct !DILocation(line: 293, column: 3, scope: !1334)
!1765 = !DILocation(line: 245, column: 15, scope: !1223, inlinedAt: !1756)
!1766 = !DILocation(line: 245, column: 27, scope: !1223, inlinedAt: !1756)
!1767 = !DILocation(line: 245, column: 39, scope: !1223, inlinedAt: !1756)
!1768 = !DILocation(line: 0, scope: !1232, inlinedAt: !1769)
!1769 = distinct !DILocation(line: 245, column: 5, scope: !1223, inlinedAt: !1756)
!1770 = !DILocation(line: 342, column: 7, scope: !1243, inlinedAt: !1769)
!1771 = !DILocation(line: 342, scope: !1243, inlinedAt: !1769)
!1772 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !1769)
!1773 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !1769)
!1774 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !1769)
!1775 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !1769)
!1776 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !1769)
!1777 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !1769)
!1778 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !1769)
!1779 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !1769)
!1780 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !1769)
!1781 = distinct !{!1781, !1773, !1782, !258}
!1782 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !1769)
!1783 = !DILocation(line: 244, column: 22, scope: !1223, inlinedAt: !1756)
!1784 = !DILocation(line: 244, column: 3, scope: !1223, inlinedAt: !1756)
!1785 = distinct !{!1785, !1762, !1786, !258}
!1786 = !DILocation(line: 245, column: 48, scope: !1171, inlinedAt: !1756)
!1787 = !DILocation(line: 342, scope: !1243, inlinedAt: !1764)
!1788 = !DILocation(line: 0, scope: !1232, inlinedAt: !1764)
!1789 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !1764)
!1790 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !1791)
!1791 = distinct !DILocation(line: 294, column: 3, scope: !1334)
!1792 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !1764)
!1793 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !1764)
!1794 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !1764)
!1795 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !1764)
!1796 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !1764)
!1797 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !1764)
!1798 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !1764)
!1799 = distinct !{!1799, !1763, !1800, !258}
!1800 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !1764)
!1801 = !DILocation(line: 342, scope: !1243, inlinedAt: !1791)
!1802 = !DILocation(line: 0, scope: !1232, inlinedAt: !1791)
!1803 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !1791)
!1804 = !DILocation(line: 228, column: 3, scope: !1225, inlinedAt: !1805)
!1805 = distinct !DILocation(line: 295, column: 3, scope: !1334)
!1806 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !1791)
!1807 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !1791)
!1808 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !1791)
!1809 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !1791)
!1810 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !1791)
!1811 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !1791)
!1812 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !1791)
!1813 = distinct !{!1813, !1790, !1814, !258}
!1814 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !1791)
!1815 = !DILocation(line: 228, scope: !1225, inlinedAt: !1805)
!1816 = !DILocation(line: 0, scope: !1226, inlinedAt: !1805)
!1817 = !DILocation(line: 228, column: 12, scope: !1265, inlinedAt: !1805)
!1818 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1819)
!1819 = distinct !DILocation(line: 296, column: 3, scope: !1334)
!1820 = !DILocation(line: 229, column: 18, scope: !1265, inlinedAt: !1805)
!1821 = !DILocation(line: 0, scope: !1099, inlinedAt: !1822)
!1822 = distinct !DILocation(line: 229, column: 5, scope: !1265, inlinedAt: !1805)
!1823 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1822)
!1824 = !DILocation(line: 326, scope: !1104, inlinedAt: !1822)
!1825 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1822)
!1826 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1822)
!1827 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1822)
!1828 = !DILocation(line: 0, scope: !1111, inlinedAt: !1829)
!1829 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1822)
!1830 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1829)
!1831 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1829)
!1832 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1829)
!1833 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1829)
!1834 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1829)
!1835 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1822)
!1836 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1822)
!1837 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1822)
!1838 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1822)
!1839 = distinct !{!1839, !1826, !1840, !258}
!1840 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1822)
!1841 = !DILocation(line: 228, column: 22, scope: !1265, inlinedAt: !1805)
!1842 = !DILocation(line: 228, column: 3, scope: !1265, inlinedAt: !1805)
!1843 = distinct !{!1843, !1804, !1844, !258}
!1844 = !DILocation(line: 229, column: 27, scope: !1225, inlinedAt: !1805)
!1845 = !DILocation(line: 326, scope: !1104, inlinedAt: !1819)
!1846 = !DILocation(line: 0, scope: !1099, inlinedAt: !1819)
!1847 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1819)
!1848 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1819)
!1849 = !DILocation(line: 0, scope: !1111, inlinedAt: !1850)
!1850 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1819)
!1851 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1850)
!1852 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1850)
!1853 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1850)
!1854 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1850)
!1855 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1850)
!1856 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1819)
!1857 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1819)
!1858 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1819)
!1859 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1819)
!1860 = distinct !{!1860, !1818, !1861, !258}
!1861 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1819)
!1862 = !DILocalVariable(name: "r", arg: 1, scope: !1863, file: !476, line: 86, type: !32)
!1863 = distinct !DISubprogram(name: "pack_ciphertext", scope: !476, file: !476, line: 86, type: !1864, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1864 = !DISubroutineType(types: !1865)
!1865 = !{null, !32, !479, !1866}
!1866 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 32)
!1867 = !DILocation(line: 0, scope: !1863, inlinedAt: !1868)
!1868 = distinct !DILocation(line: 298, column: 3, scope: !1334)
!1869 = !DILocalVariable(name: "b", arg: 2, scope: !1863, file: !476, line: 86, type: !479)
!1870 = !DILocalVariable(name: "v", arg: 3, scope: !1863, file: !476, line: 86, type: !1866)
!1871 = !DILocation(line: 88, column: 3, scope: !1863, inlinedAt: !1868)
!1872 = !DILocation(line: 89, column: 18, scope: !1863, inlinedAt: !1868)
!1873 = !DILocation(line: 89, column: 3, scope: !1863, inlinedAt: !1868)
!1874 = !DILocation(line: 299, column: 1, scope: !1334)
!1875 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !476, file: !476, line: 314, type: !1876, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1876 = !DISubroutineType(types: !1877)
!1877 = !{null, !32, !160, !160}
!1878 = !DILocalVariable(name: "m", arg: 1, scope: !1875, file: !476, line: 314, type: !32)
!1879 = !DILocation(line: 0, scope: !1875)
!1880 = !DILocalVariable(name: "c", arg: 2, scope: !1875, file: !476, line: 315, type: !160)
!1881 = !DILocalVariable(name: "sk", arg: 3, scope: !1875, file: !476, line: 316, type: !160)
!1882 = !DILocalVariable(name: "b", scope: !1875, file: !476, line: 318, type: !480)
!1883 = !DILocation(line: 318, column: 11, scope: !1875)
!1884 = !DILocalVariable(name: "skpv", scope: !1875, file: !476, line: 318, type: !480)
!1885 = !DILocation(line: 318, column: 14, scope: !1875)
!1886 = !DILocalVariable(name: "v", scope: !1875, file: !476, line: 319, type: !486)
!1887 = !DILocation(line: 319, column: 8, scope: !1875)
!1888 = !DILocalVariable(name: "mp", scope: !1875, file: !476, line: 319, type: !486)
!1889 = !DILocation(line: 319, column: 11, scope: !1875)
!1890 = !DILocalVariable(name: "b", arg: 1, scope: !1891, file: !476, line: 102, type: !479)
!1891 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !476, file: !476, line: 102, type: !1892, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1892 = !DISubroutineType(types: !1893)
!1893 = !{null, !479, !1866, !160}
!1894 = !DILocation(line: 0, scope: !1891, inlinedAt: !1895)
!1895 = distinct !DILocation(line: 321, column: 3, scope: !1875)
!1896 = !DILocalVariable(name: "v", arg: 2, scope: !1891, file: !476, line: 102, type: !1866)
!1897 = !DILocalVariable(name: "c", arg: 3, scope: !1891, file: !476, line: 102, type: !160)
!1898 = !DILocation(line: 104, column: 3, scope: !1891, inlinedAt: !1895)
!1899 = !DILocation(line: 105, column: 23, scope: !1891, inlinedAt: !1895)
!1900 = !DILocalVariable(name: "r", arg: 1, scope: !1901, file: !798, line: 83, type: !801)
!1901 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !798, file: !798, line: 83, type: !1395, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1902 = !DILocation(line: 0, scope: !1901, inlinedAt: !1903)
!1903 = distinct !DILocation(line: 105, column: 3, scope: !1891, inlinedAt: !1895)
!1904 = !DILocalVariable(name: "a", arg: 2, scope: !1901, file: !798, line: 83, type: !160)
!1905 = !DILocalVariable(name: "i", scope: !1901, file: !798, line: 85, type: !40)
!1906 = !DILocation(line: 88, column: 7, scope: !1907, inlinedAt: !1903)
!1907 = distinct !DILexicalBlock(scope: !1901, file: !798, line: 88, column: 3)
!1908 = !DILocation(line: 88, scope: !1907, inlinedAt: !1903)
!1909 = !DILocation(line: 88, column: 12, scope: !1910, inlinedAt: !1903)
!1910 = distinct !DILexicalBlock(scope: !1907, file: !798, line: 88, column: 3)
!1911 = !DILocation(line: 88, column: 3, scope: !1907, inlinedAt: !1903)
!1912 = !DILocation(line: 159, column: 3, scope: !1378, inlinedAt: !1913)
!1913 = distinct !DILocation(line: 72, column: 3, scope: !1914, inlinedAt: !1917)
!1914 = distinct !DISubprogram(name: "unpack_sk", scope: !476, file: !476, line: 70, type: !1915, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1915 = !DISubroutineType(types: !1916)
!1916 = !{null, !479, !160}
!1917 = distinct !DILocation(line: 322, column: 3, scope: !1875)
!1918 = !DILocation(line: 89, column: 37, scope: !1919, inlinedAt: !1903)
!1919 = distinct !DILexicalBlock(scope: !1910, file: !798, line: 88, column: 28)
!1920 = !DILocation(line: 89, column: 42, scope: !1919, inlinedAt: !1903)
!1921 = !DILocation(line: 89, column: 26, scope: !1919, inlinedAt: !1903)
!1922 = !DILocation(line: 89, column: 47, scope: !1919, inlinedAt: !1903)
!1923 = !DILocation(line: 89, column: 57, scope: !1919, inlinedAt: !1903)
!1924 = !DILocation(line: 89, column: 62, scope: !1919, inlinedAt: !1903)
!1925 = !DILocation(line: 89, column: 24, scope: !1919, inlinedAt: !1903)
!1926 = !DILocation(line: 89, column: 16, scope: !1919, inlinedAt: !1903)
!1927 = !DILocation(line: 89, column: 5, scope: !1919, inlinedAt: !1903)
!1928 = !DILocation(line: 89, column: 22, scope: !1919, inlinedAt: !1903)
!1929 = !DILocation(line: 90, column: 37, scope: !1919, inlinedAt: !1903)
!1930 = !DILocation(line: 90, column: 42, scope: !1919, inlinedAt: !1903)
!1931 = !DILocation(line: 90, column: 26, scope: !1919, inlinedAt: !1903)
!1932 = !DILocation(line: 90, column: 47, scope: !1919, inlinedAt: !1903)
!1933 = !DILocation(line: 90, column: 57, scope: !1919, inlinedAt: !1903)
!1934 = !DILocation(line: 90, column: 62, scope: !1919, inlinedAt: !1903)
!1935 = !DILocation(line: 90, column: 24, scope: !1919, inlinedAt: !1903)
!1936 = !DILocation(line: 90, column: 16, scope: !1919, inlinedAt: !1903)
!1937 = !DILocation(line: 90, column: 18, scope: !1919, inlinedAt: !1903)
!1938 = !DILocation(line: 90, column: 5, scope: !1919, inlinedAt: !1903)
!1939 = !DILocation(line: 90, column: 22, scope: !1919, inlinedAt: !1903)
!1940 = !DILocation(line: 91, column: 7, scope: !1919, inlinedAt: !1903)
!1941 = !DILocation(line: 88, column: 24, scope: !1910, inlinedAt: !1903)
!1942 = !DILocation(line: 88, column: 3, scope: !1910, inlinedAt: !1903)
!1943 = distinct !{!1943, !1911, !1944, !258}
!1944 = !DILocation(line: 92, column: 3, scope: !1907, inlinedAt: !1903)
!1945 = !DILocation(line: 159, scope: !1378, inlinedAt: !1913)
!1946 = !DILocation(line: 0, scope: !1370, inlinedAt: !1913)
!1947 = !DILocation(line: 159, column: 12, scope: !1381, inlinedAt: !1913)
!1948 = !DILocation(line: 173, column: 3, scope: !970, inlinedAt: !1949)
!1949 = distinct !DILocation(line: 324, column: 3, scope: !1875)
!1950 = !DILocation(line: 160, column: 21, scope: !1381, inlinedAt: !1913)
!1951 = !DILocation(line: 160, column: 35, scope: !1381, inlinedAt: !1913)
!1952 = !DILocation(line: 160, column: 33, scope: !1381, inlinedAt: !1913)
!1953 = !DILocation(line: 160, column: 5, scope: !1381, inlinedAt: !1913)
!1954 = !DILocation(line: 159, column: 22, scope: !1381, inlinedAt: !1913)
!1955 = !DILocation(line: 159, column: 3, scope: !1381, inlinedAt: !1913)
!1956 = distinct !{!1956, !1912, !1957, !258}
!1957 = !DILocation(line: 160, column: 51, scope: !1378, inlinedAt: !1913)
!1958 = !DILocation(line: 173, scope: !970, inlinedAt: !1949)
!1959 = !DILocation(line: 0, scope: !972, inlinedAt: !1949)
!1960 = !DILocation(line: 173, column: 12, scope: !1087, inlinedAt: !1949)
!1961 = !DILocation(line: 174, column: 15, scope: !1087, inlinedAt: !1949)
!1962 = !DILocation(line: 0, scope: !1092, inlinedAt: !1963)
!1963 = distinct !DILocation(line: 174, column: 5, scope: !1087, inlinedAt: !1949)
!1964 = !DILocation(line: 263, column: 3, scope: !1092, inlinedAt: !1963)
!1965 = !DILocation(line: 0, scope: !1099, inlinedAt: !1966)
!1966 = distinct !DILocation(line: 264, column: 3, scope: !1092, inlinedAt: !1963)
!1967 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !1966)
!1968 = !DILocation(line: 326, scope: !1104, inlinedAt: !1966)
!1969 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !1966)
!1970 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !1966)
!1971 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !1966)
!1972 = !DILocation(line: 0, scope: !1111, inlinedAt: !1973)
!1973 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !1966)
!1974 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !1973)
!1975 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !1973)
!1976 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !1973)
!1977 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !1973)
!1978 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !1973)
!1979 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !1966)
!1980 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !1966)
!1981 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !1966)
!1982 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !1966)
!1983 = distinct !{!1983, !1970, !1984, !258}
!1984 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !1966)
!1985 = !DILocation(line: 173, column: 22, scope: !1087, inlinedAt: !1949)
!1986 = !DILocation(line: 173, column: 3, scope: !1087, inlinedAt: !1949)
!1987 = distinct !{!1987, !1948, !1988, !258}
!1988 = !DILocation(line: 174, column: 24, scope: !970, inlinedAt: !1949)
!1989 = !DILocation(line: 325, column: 3, scope: !1875)
!1990 = !DILocation(line: 0, scope: !1743, inlinedAt: !1991)
!1991 = distinct !DILocation(line: 326, column: 3, scope: !1875)
!1992 = !DILocation(line: 278, column: 3, scope: !1743, inlinedAt: !1991)
!1993 = !DILocalVariable(name: "r", arg: 1, scope: !1994, file: !798, line: 355, type: !801)
!1994 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !798, file: !798, line: 355, type: !1233, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1995 = !DILocation(line: 0, scope: !1994, inlinedAt: !1996)
!1996 = distinct !DILocation(line: 328, column: 3, scope: !1875)
!1997 = !DILocalVariable(name: "a", arg: 2, scope: !1994, file: !798, line: 355, type: !1235)
!1998 = !DILocalVariable(name: "b", arg: 3, scope: !1994, file: !798, line: 355, type: !1235)
!1999 = !DILocalVariable(name: "i", scope: !1994, file: !798, line: 357, type: !40)
!2000 = !DILocation(line: 358, column: 7, scope: !2001, inlinedAt: !1996)
!2001 = distinct !DILexicalBlock(scope: !1994, file: !798, line: 358, column: 3)
!2002 = !DILocation(line: 358, scope: !2001, inlinedAt: !1996)
!2003 = !DILocation(line: 358, column: 12, scope: !2004, inlinedAt: !1996)
!2004 = distinct !DILexicalBlock(scope: !2001, file: !798, line: 358, column: 3)
!2005 = !DILocation(line: 358, column: 3, scope: !2001, inlinedAt: !1996)
!2006 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !2007)
!2007 = distinct !DILocation(line: 329, column: 3, scope: !1875)
!2008 = !DILocation(line: 359, column: 20, scope: !2004, inlinedAt: !1996)
!2009 = !DILocation(line: 359, column: 35, scope: !2004, inlinedAt: !1996)
!2010 = !DILocation(line: 359, column: 33, scope: !2004, inlinedAt: !1996)
!2011 = !DILocation(line: 359, column: 5, scope: !2004, inlinedAt: !1996)
!2012 = !DILocation(line: 359, column: 18, scope: !2004, inlinedAt: !1996)
!2013 = !DILocation(line: 358, column: 22, scope: !2004, inlinedAt: !1996)
!2014 = !DILocation(line: 358, column: 3, scope: !2004, inlinedAt: !1996)
!2015 = distinct !{!2015, !2005, !2016, !258}
!2016 = !DILocation(line: 359, column: 46, scope: !2001, inlinedAt: !1996)
!2017 = !DILocation(line: 326, scope: !1104, inlinedAt: !2007)
!2018 = !DILocation(line: 0, scope: !1099, inlinedAt: !2007)
!2019 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !2007)
!2020 = !DILocation(line: 197, column: 3, scope: !2021, inlinedAt: !2025)
!2021 = distinct !DILexicalBlock(scope: !2022, file: !798, line: 197, column: 3)
!2022 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !798, file: !798, line: 192, type: !2023, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2023 = !DISubroutineType(types: !2024)
!2024 = !{null, !32, !1235}
!2025 = distinct !DILocation(line: 331, column: 3, scope: !1875)
!2026 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !2007)
!2027 = !DILocation(line: 0, scope: !1111, inlinedAt: !2028)
!2028 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !2007)
!2029 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2028)
!2030 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2028)
!2031 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2028)
!2032 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2028)
!2033 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2028)
!2034 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !2007)
!2035 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !2007)
!2036 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !2007)
!2037 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !2007)
!2038 = distinct !{!2038, !2006, !2039, !258}
!2039 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !2007)
!2040 = !DILocation(line: 197, scope: !2021, inlinedAt: !2025)
!2041 = !DILocalVariable(name: "i", scope: !2022, file: !798, line: 194, type: !40)
!2042 = !DILocation(line: 0, scope: !2022, inlinedAt: !2025)
!2043 = !DILocation(line: 197, column: 12, scope: !2044, inlinedAt: !2025)
!2044 = distinct !DILexicalBlock(scope: !2021, file: !798, line: 197, column: 3)
!2045 = !DILocation(line: 198, column: 5, scope: !2046, inlinedAt: !2025)
!2046 = distinct !DILexicalBlock(scope: !2044, file: !798, line: 197, column: 28)
!2047 = !DILocation(line: 198, column: 12, scope: !2046, inlinedAt: !2025)
!2048 = !DILocalVariable(name: "j", scope: !2022, file: !798, line: 194, type: !40)
!2049 = !DILocation(line: 199, column: 9, scope: !2050, inlinedAt: !2025)
!2050 = distinct !DILexicalBlock(scope: !2046, file: !798, line: 199, column: 5)
!2051 = !DILocation(line: 199, scope: !2050, inlinedAt: !2025)
!2052 = !DILocation(line: 199, column: 14, scope: !2053, inlinedAt: !2025)
!2053 = distinct !DILexicalBlock(scope: !2050, file: !798, line: 199, column: 5)
!2054 = !DILocation(line: 199, column: 5, scope: !2050, inlinedAt: !2025)
!2055 = !DILocation(line: 200, column: 23, scope: !2056, inlinedAt: !2025)
!2056 = distinct !DILexicalBlock(scope: !2053, file: !798, line: 199, column: 22)
!2057 = !DILocation(line: 200, column: 25, scope: !2056, inlinedAt: !2025)
!2058 = !DILocation(line: 200, column: 12, scope: !2056, inlinedAt: !2025)
!2059 = !DILocalVariable(name: "t", scope: !2022, file: !798, line: 195, type: !91)
!2060 = !DILocation(line: 205, column: 9, scope: !2056, inlinedAt: !2025)
!2061 = !DILocation(line: 206, column: 9, scope: !2056, inlinedAt: !2025)
!2062 = !DILocation(line: 207, column: 9, scope: !2056, inlinedAt: !2025)
!2063 = !DILocation(line: 208, column: 19, scope: !2056, inlinedAt: !2025)
!2064 = !DILocation(line: 208, column: 7, scope: !2056, inlinedAt: !2025)
!2065 = !DILocation(line: 208, column: 14, scope: !2056, inlinedAt: !2025)
!2066 = !DILocation(line: 199, column: 18, scope: !2053, inlinedAt: !2025)
!2067 = !DILocation(line: 199, column: 5, scope: !2053, inlinedAt: !2025)
!2068 = distinct !{!2068, !2054, !2069, !258}
!2069 = !DILocation(line: 209, column: 5, scope: !2050, inlinedAt: !2025)
!2070 = !DILocation(line: 197, column: 24, scope: !2044, inlinedAt: !2025)
!2071 = !DILocation(line: 197, column: 3, scope: !2044, inlinedAt: !2025)
!2072 = distinct !{!2072, !2020, !2073, !258}
!2073 = !DILocation(line: 210, column: 3, scope: !2021, inlinedAt: !2025)
!2074 = !DILocation(line: 332, column: 1, scope: !1875)
!2075 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !971, file: !971, line: 15, type: !1269, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2076 = !DILocalVariable(name: "r", arg: 1, scope: !2075, file: !971, line: 15, type: !32)
!2077 = !DILocation(line: 0, scope: !2075)
!2078 = !DILocalVariable(name: "a", arg: 2, scope: !2075, file: !971, line: 15, type: !1175)
!2079 = !DILocalVariable(name: "t", scope: !2075, file: !971, line: 51, type: !2080)
!2080 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !2081)
!2081 = !{!2082}
!2082 = !DISubrange(count: 4)
!2083 = !DILocation(line: 51, column: 12, scope: !2075)
!2084 = !DILocalVariable(name: "i", scope: !2075, file: !971, line: 17, type: !40)
!2085 = !DILocation(line: 52, column: 7, scope: !2086)
!2086 = distinct !DILexicalBlock(scope: !2075, file: !971, line: 52, column: 3)
!2087 = !DILocation(line: 52, scope: !2086)
!2088 = !DILocation(line: 52, column: 12, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2086, file: !971, line: 52, column: 3)
!2090 = !DILocation(line: 52, column: 3, scope: !2086)
!2091 = !DILocation(line: 53, column: 5, scope: !2092)
!2092 = distinct !DILexicalBlock(scope: !2093, file: !971, line: 53, column: 5)
!2093 = distinct !DILexicalBlock(scope: !2089, file: !971, line: 52, column: 26)
!2094 = !DILocation(line: 53, scope: !2092)
!2095 = !DILocalVariable(name: "j", scope: !2075, file: !971, line: 17, type: !40)
!2096 = !DILocation(line: 53, column: 14, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2092, file: !971, line: 53, column: 5)
!2098 = !DILocation(line: 54, column: 7, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2100, file: !971, line: 54, column: 7)
!2100 = distinct !DILexicalBlock(scope: !2097, file: !971, line: 53, column: 30)
!2101 = !DILocation(line: 54, scope: !2099)
!2102 = !DILocalVariable(name: "k", scope: !2075, file: !971, line: 17, type: !40)
!2103 = !DILocation(line: 54, column: 16, scope: !2104)
!2104 = distinct !DILexicalBlock(scope: !2099, file: !971, line: 54, column: 7)
!2105 = !DILocation(line: 55, column: 17, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2104, file: !971, line: 54, column: 24)
!2107 = !DILocation(line: 55, column: 35, scope: !2106)
!2108 = !DILocation(line: 55, column: 37, scope: !2106)
!2109 = !DILocation(line: 56, column: 39, scope: !2106)
!2110 = !DILocation(line: 56, column: 9, scope: !2106)
!2111 = !DILocation(line: 56, column: 14, scope: !2106)
!2112 = !DILocation(line: 58, column: 14, scope: !2106)
!2113 = !DILocalVariable(name: "d0", scope: !2075, file: !971, line: 18, type: !70)
!2114 = !DILocation(line: 61, column: 12, scope: !2106)
!2115 = !DILocation(line: 62, column: 12, scope: !2106)
!2116 = !DILocation(line: 63, column: 16, scope: !2106)
!2117 = !DILocation(line: 63, column: 9, scope: !2106)
!2118 = !DILocation(line: 63, column: 14, scope: !2106)
!2119 = !DILocation(line: 54, column: 20, scope: !2104)
!2120 = !DILocation(line: 54, column: 7, scope: !2104)
!2121 = distinct !{!2121, !2098, !2122, !258}
!2122 = !DILocation(line: 64, column: 7, scope: !2099)
!2123 = !DILocation(line: 66, column: 15, scope: !2100)
!2124 = !DILocation(line: 66, column: 14, scope: !2100)
!2125 = !DILocation(line: 66, column: 12, scope: !2100)
!2126 = !DILocation(line: 67, column: 15, scope: !2100)
!2127 = !DILocation(line: 67, column: 20, scope: !2100)
!2128 = !DILocation(line: 67, column: 29, scope: !2100)
!2129 = !DILocation(line: 67, column: 34, scope: !2100)
!2130 = !DILocation(line: 67, column: 26, scope: !2100)
!2131 = !DILocation(line: 67, column: 7, scope: !2100)
!2132 = !DILocation(line: 67, column: 12, scope: !2100)
!2133 = !DILocation(line: 68, column: 15, scope: !2100)
!2134 = !DILocation(line: 68, column: 20, scope: !2100)
!2135 = !DILocation(line: 68, column: 29, scope: !2100)
!2136 = !DILocation(line: 68, column: 34, scope: !2100)
!2137 = !DILocation(line: 68, column: 26, scope: !2100)
!2138 = !DILocation(line: 68, column: 7, scope: !2100)
!2139 = !DILocation(line: 68, column: 12, scope: !2100)
!2140 = !DILocation(line: 69, column: 15, scope: !2100)
!2141 = !DILocation(line: 69, column: 20, scope: !2100)
!2142 = !DILocation(line: 69, column: 29, scope: !2100)
!2143 = !DILocation(line: 69, column: 34, scope: !2100)
!2144 = !DILocation(line: 69, column: 26, scope: !2100)
!2145 = !DILocation(line: 69, column: 7, scope: !2100)
!2146 = !DILocation(line: 69, column: 12, scope: !2100)
!2147 = !DILocation(line: 70, column: 15, scope: !2100)
!2148 = !DILocation(line: 70, column: 20, scope: !2100)
!2149 = !DILocation(line: 70, column: 14, scope: !2100)
!2150 = !DILocation(line: 70, column: 7, scope: !2100)
!2151 = !DILocation(line: 70, column: 12, scope: !2100)
!2152 = !DILocation(line: 71, column: 9, scope: !2100)
!2153 = !DILocation(line: 53, column: 26, scope: !2097)
!2154 = !DILocation(line: 53, column: 5, scope: !2097)
!2155 = distinct !{!2155, !2091, !2156, !258}
!2156 = !DILocation(line: 72, column: 5, scope: !2092)
!2157 = !DILocation(line: 52, column: 22, scope: !2089)
!2158 = !DILocation(line: 52, column: 3, scope: !2089)
!2159 = distinct !{!2159, !2090, !2160, !258}
!2160 = !DILocation(line: 73, column: 3, scope: !2086)
!2161 = !DILocation(line: 77, column: 1, scope: !2075)
!2162 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !971, file: !971, line: 89, type: !1371, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2163 = !DILocalVariable(name: "r", arg: 1, scope: !2162, file: !971, line: 89, type: !975)
!2164 = !DILocation(line: 0, scope: !2162)
!2165 = !DILocalVariable(name: "a", arg: 2, scope: !2162, file: !971, line: 89, type: !160)
!2166 = !DILocalVariable(name: "t", scope: !2162, file: !971, line: 112, type: !2080)
!2167 = !DILocation(line: 112, column: 12, scope: !2162)
!2168 = !DILocalVariable(name: "i", scope: !2162, file: !971, line: 91, type: !40)
!2169 = !DILocation(line: 113, column: 7, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2162, file: !971, line: 113, column: 3)
!2171 = !DILocation(line: 113, scope: !2170)
!2172 = !DILocation(line: 113, column: 12, scope: !2173)
!2173 = distinct !DILexicalBlock(scope: !2170, file: !971, line: 113, column: 3)
!2174 = !DILocation(line: 113, column: 3, scope: !2170)
!2175 = !DILocation(line: 114, column: 5, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2177, file: !971, line: 114, column: 5)
!2177 = distinct !DILexicalBlock(scope: !2173, file: !971, line: 113, column: 26)
!2178 = !DILocation(line: 114, scope: !2176)
!2179 = !DILocalVariable(name: "j", scope: !2162, file: !971, line: 91, type: !40)
!2180 = !DILocation(line: 114, column: 14, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2176, file: !971, line: 114, column: 5)
!2182 = !DILocation(line: 115, column: 15, scope: !2183)
!2183 = distinct !DILexicalBlock(scope: !2181, file: !971, line: 114, column: 30)
!2184 = !DILocation(line: 115, column: 39, scope: !2183)
!2185 = !DILocation(line: 115, column: 29, scope: !2183)
!2186 = !DILocation(line: 115, column: 44, scope: !2183)
!2187 = !DILocation(line: 115, column: 26, scope: !2183)
!2188 = !DILocation(line: 115, column: 12, scope: !2183)
!2189 = !DILocation(line: 116, column: 15, scope: !2183)
!2190 = !DILocation(line: 116, column: 20, scope: !2183)
!2191 = !DILocation(line: 116, column: 39, scope: !2183)
!2192 = !DILocation(line: 116, column: 29, scope: !2183)
!2193 = !DILocation(line: 116, column: 44, scope: !2183)
!2194 = !DILocation(line: 116, column: 26, scope: !2183)
!2195 = !DILocation(line: 116, column: 7, scope: !2183)
!2196 = !DILocation(line: 116, column: 12, scope: !2183)
!2197 = !DILocation(line: 117, column: 15, scope: !2183)
!2198 = !DILocation(line: 117, column: 20, scope: !2183)
!2199 = !DILocation(line: 117, column: 39, scope: !2183)
!2200 = !DILocation(line: 117, column: 29, scope: !2183)
!2201 = !DILocation(line: 117, column: 44, scope: !2183)
!2202 = !DILocation(line: 117, column: 26, scope: !2183)
!2203 = !DILocation(line: 117, column: 7, scope: !2183)
!2204 = !DILocation(line: 117, column: 12, scope: !2183)
!2205 = !DILocation(line: 118, column: 15, scope: !2183)
!2206 = !DILocation(line: 118, column: 20, scope: !2183)
!2207 = !DILocation(line: 118, column: 39, scope: !2183)
!2208 = !DILocation(line: 118, column: 29, scope: !2183)
!2209 = !DILocation(line: 118, column: 44, scope: !2183)
!2210 = !DILocation(line: 118, column: 26, scope: !2183)
!2211 = !DILocation(line: 118, column: 7, scope: !2183)
!2212 = !DILocation(line: 118, column: 12, scope: !2183)
!2213 = !DILocalVariable(name: "k", scope: !2162, file: !971, line: 91, type: !40)
!2214 = !DILocation(line: 121, column: 11, scope: !2215)
!2215 = distinct !DILexicalBlock(scope: !2183, file: !971, line: 121, column: 7)
!2216 = !DILocation(line: 121, scope: !2215)
!2217 = !DILocation(line: 121, column: 16, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2215, file: !971, line: 121, column: 7)
!2219 = !DILocation(line: 121, column: 7, scope: !2215)
!2220 = !DILocation(line: 122, column: 47, scope: !2218)
!2221 = !DILocation(line: 122, column: 52, scope: !2218)
!2222 = !DILocation(line: 122, column: 60, scope: !2218)
!2223 = !DILocation(line: 122, column: 69, scope: !2218)
!2224 = !DILocation(line: 122, column: 76, scope: !2218)
!2225 = !DILocation(line: 122, column: 35, scope: !2218)
!2226 = !DILocation(line: 122, column: 9, scope: !2218)
!2227 = !DILocation(line: 122, column: 27, scope: !2218)
!2228 = !DILocation(line: 122, column: 29, scope: !2218)
!2229 = !DILocation(line: 122, column: 33, scope: !2218)
!2230 = !DILocation(line: 121, column: 20, scope: !2218)
!2231 = !DILocation(line: 121, column: 7, scope: !2218)
!2232 = distinct !{!2232, !2219, !2233, !258}
!2233 = !DILocation(line: 122, column: 79, scope: !2215)
!2234 = !DILocation(line: 119, column: 9, scope: !2183)
!2235 = !DILocation(line: 114, column: 26, scope: !2181)
!2236 = !DILocation(line: 114, column: 5, scope: !2181)
!2237 = distinct !{!2237, !2175, !2238, !258}
!2238 = !DILocation(line: 123, column: 5, scope: !2176)
!2239 = !DILocation(line: 113, column: 22, scope: !2173)
!2240 = !DILocation(line: 113, column: 3, scope: !2173)
!2241 = distinct !{!2241, !2174, !2242, !258}
!2242 = !DILocation(line: 124, column: 3, scope: !2170)
!2243 = !DILocation(line: 128, column: 1, scope: !2162)
!2244 = !DILocalVariable(name: "r", arg: 1, scope: !1268, file: !971, line: 139, type: !32)
!2245 = !DILocation(line: 0, scope: !1268)
!2246 = !DILocalVariable(name: "a", arg: 2, scope: !1268, file: !971, line: 139, type: !1175)
!2247 = !DILocation(line: 142, column: 7, scope: !1267)
!2248 = !DILocation(line: 142, scope: !1267)
!2249 = !DILocation(line: 142, column: 12, scope: !1305)
!2250 = !DILocation(line: 142, column: 3, scope: !1267)
!2251 = !DILocation(line: 143, column: 21, scope: !1305)
!2252 = !DILocation(line: 143, column: 19, scope: !1305)
!2253 = !DILocation(line: 143, column: 40, scope: !1305)
!2254 = !DILocation(line: 143, column: 5, scope: !1305)
!2255 = !DILocation(line: 142, column: 22, scope: !1305)
!2256 = !DILocation(line: 142, column: 3, scope: !1305)
!2257 = distinct !{!2257, !2250, !2258, !258}
!2258 = !DILocation(line: 143, column: 49, scope: !1267)
!2259 = !DILocation(line: 144, column: 1, scope: !1268)
!2260 = !DILocation(line: 0, scope: !1370)
!2261 = !DILocation(line: 159, column: 7, scope: !1378)
!2262 = !DILocation(line: 159, scope: !1378)
!2263 = !DILocation(line: 159, column: 12, scope: !1381)
!2264 = !DILocation(line: 159, column: 3, scope: !1378)
!2265 = !DILocation(line: 160, column: 21, scope: !1381)
!2266 = !DILocation(line: 160, column: 35, scope: !1381)
!2267 = !DILocation(line: 160, column: 33, scope: !1381)
!2268 = !DILocation(line: 160, column: 5, scope: !1381)
!2269 = !DILocation(line: 159, column: 22, scope: !1381)
!2270 = !DILocation(line: 159, column: 3, scope: !1381)
!2271 = distinct !{!2271, !2264, !2272, !258}
!2272 = !DILocation(line: 160, column: 51, scope: !1378)
!2273 = !DILocation(line: 161, column: 1, scope: !1370)
!2274 = !DILocation(line: 0, scope: !972)
!2275 = !DILocation(line: 173, column: 7, scope: !970)
!2276 = !DILocation(line: 173, scope: !970)
!2277 = !DILocation(line: 173, column: 12, scope: !1087)
!2278 = !DILocation(line: 173, column: 3, scope: !970)
!2279 = !DILocation(line: 174, column: 15, scope: !1087)
!2280 = !DILocation(line: 0, scope: !1092, inlinedAt: !2281)
!2281 = distinct !DILocation(line: 174, column: 5, scope: !1087)
!2282 = !DILocation(line: 263, column: 3, scope: !1092, inlinedAt: !2281)
!2283 = !DILocation(line: 0, scope: !1099, inlinedAt: !2284)
!2284 = distinct !DILocation(line: 264, column: 3, scope: !1092, inlinedAt: !2281)
!2285 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !2284)
!2286 = !DILocation(line: 326, scope: !1104, inlinedAt: !2284)
!2287 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !2284)
!2288 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !2284)
!2289 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !2284)
!2290 = !DILocation(line: 0, scope: !1111, inlinedAt: !2291)
!2291 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !2284)
!2292 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2291)
!2293 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2291)
!2294 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2291)
!2295 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2291)
!2296 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2291)
!2297 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !2284)
!2298 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !2284)
!2299 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !2284)
!2300 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !2284)
!2301 = distinct !{!2301, !2288, !2302, !258}
!2302 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !2284)
!2303 = !DILocation(line: 173, column: 22, scope: !1087)
!2304 = !DILocation(line: 173, column: 3, scope: !1087)
!2305 = distinct !{!2305, !2278, !2306, !258}
!2306 = !DILocation(line: 174, column: 24, scope: !970)
!2307 = !DILocation(line: 175, column: 1, scope: !972)
!2308 = !DILocation(line: 0, scope: !1731)
!2309 = !DILocation(line: 188, column: 7, scope: !1736)
!2310 = !DILocation(line: 188, scope: !1736)
!2311 = !DILocation(line: 188, column: 12, scope: !1739)
!2312 = !DILocation(line: 188, column: 3, scope: !1736)
!2313 = !DILocation(line: 189, column: 25, scope: !1739)
!2314 = !DILocation(line: 0, scope: !1743, inlinedAt: !2315)
!2315 = distinct !DILocation(line: 189, column: 5, scope: !1739)
!2316 = !DILocation(line: 278, column: 3, scope: !1743, inlinedAt: !2315)
!2317 = !DILocation(line: 188, column: 22, scope: !1739)
!2318 = !DILocation(line: 188, column: 3, scope: !1739)
!2319 = distinct !{!2319, !2312, !2320, !258}
!2320 = !DILocation(line: 189, column: 34, scope: !1736)
!2321 = !DILocation(line: 190, column: 1, scope: !1731)
!2322 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !971, file: !971, line: 202, type: !2323, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2323 = !DISubroutineType(types: !2324)
!2324 = !{null, !2325, !1175, !1175}
!2325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !981, size: 32)
!2326 = !DILocalVariable(name: "r", arg: 1, scope: !2322, file: !971, line: 202, type: !2325)
!2327 = !DILocation(line: 0, scope: !2322)
!2328 = !DILocalVariable(name: "a", arg: 2, scope: !2322, file: !971, line: 202, type: !1175)
!2329 = !DILocalVariable(name: "b", arg: 3, scope: !2322, file: !971, line: 202, type: !1175)
!2330 = !DILocalVariable(name: "t", scope: !2322, file: !971, line: 205, type: !981)
!2331 = !DILocation(line: 205, column: 8, scope: !2322)
!2332 = !DILocation(line: 207, column: 3, scope: !2322)
!2333 = !DILocalVariable(name: "i", scope: !2322, file: !971, line: 204, type: !40)
!2334 = !DILocation(line: 208, column: 7, scope: !2335)
!2335 = distinct !DILexicalBlock(scope: !2322, file: !971, line: 208, column: 3)
!2336 = !DILocation(line: 208, scope: !2335)
!2337 = !DILocation(line: 208, column: 12, scope: !2338)
!2338 = distinct !DILexicalBlock(scope: !2335, file: !971, line: 208, column: 3)
!2339 = !DILocation(line: 208, column: 3, scope: !2335)
!2340 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !2341)
!2341 = distinct !DILocation(line: 213, column: 3, scope: !2322)
!2342 = !DILocation(line: 209, column: 34, scope: !2343)
!2343 = distinct !DILexicalBlock(scope: !2338, file: !971, line: 208, column: 26)
!2344 = !DILocation(line: 209, column: 46, scope: !2343)
!2345 = !DILocation(line: 209, column: 5, scope: !2343)
!2346 = !DILocation(line: 0, scope: !1232, inlinedAt: !2347)
!2347 = distinct !DILocation(line: 210, column: 5, scope: !2343)
!2348 = !DILocation(line: 342, column: 7, scope: !1243, inlinedAt: !2347)
!2349 = !DILocation(line: 342, scope: !1243, inlinedAt: !2347)
!2350 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !2347)
!2351 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !2347)
!2352 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !2347)
!2353 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !2347)
!2354 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !2347)
!2355 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !2347)
!2356 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !2347)
!2357 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !2347)
!2358 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !2347)
!2359 = distinct !{!2359, !2351, !2360, !258}
!2360 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !2347)
!2361 = !DILocation(line: 208, column: 22, scope: !2338)
!2362 = !DILocation(line: 208, column: 3, scope: !2338)
!2363 = distinct !{!2363, !2339, !2364, !258}
!2364 = !DILocation(line: 211, column: 3, scope: !2335)
!2365 = !DILocation(line: 326, scope: !1104, inlinedAt: !2341)
!2366 = !DILocation(line: 0, scope: !1099, inlinedAt: !2341)
!2367 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !2341)
!2368 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !2341)
!2369 = !DILocation(line: 0, scope: !1111, inlinedAt: !2370)
!2370 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !2341)
!2371 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2370)
!2372 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2370)
!2373 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2370)
!2374 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2370)
!2375 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2370)
!2376 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !2341)
!2377 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !2341)
!2378 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !2341)
!2379 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !2341)
!2380 = distinct !{!2380, !2340, !2381, !258}
!2381 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !2341)
!2382 = !DILocation(line: 214, column: 1, scope: !2322)
!2383 = !DILocalVariable(name: "r", arg: 1, scope: !1226, file: !971, line: 225, type: !975)
!2384 = !DILocation(line: 0, scope: !1226)
!2385 = !DILocation(line: 228, column: 7, scope: !1225)
!2386 = !DILocation(line: 228, scope: !1225)
!2387 = !DILocation(line: 228, column: 12, scope: !1265)
!2388 = !DILocation(line: 228, column: 3, scope: !1225)
!2389 = !DILocation(line: 229, column: 18, scope: !1265)
!2390 = !DILocation(line: 0, scope: !1099, inlinedAt: !2391)
!2391 = distinct !DILocation(line: 229, column: 5, scope: !1265)
!2392 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !2391)
!2393 = !DILocation(line: 326, scope: !1104, inlinedAt: !2391)
!2394 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !2391)
!2395 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !2391)
!2396 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !2391)
!2397 = !DILocation(line: 0, scope: !1111, inlinedAt: !2398)
!2398 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !2391)
!2399 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2398)
!2400 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2398)
!2401 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2398)
!2402 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2398)
!2403 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2398)
!2404 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !2391)
!2405 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !2391)
!2406 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !2391)
!2407 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !2391)
!2408 = distinct !{!2408, !2395, !2409, !258}
!2409 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !2391)
!2410 = !DILocation(line: 228, column: 22, scope: !1265)
!2411 = !DILocation(line: 228, column: 3, scope: !1265)
!2412 = distinct !{!2412, !2388, !2413, !258}
!2413 = !DILocation(line: 229, column: 27, scope: !1225)
!2414 = !DILocation(line: 230, column: 1, scope: !1226)
!2415 = !DILocation(line: 0, scope: !1172)
!2416 = !DILocation(line: 244, column: 7, scope: !1171)
!2417 = !DILocation(line: 244, scope: !1171)
!2418 = !DILocation(line: 244, column: 12, scope: !1223)
!2419 = !DILocation(line: 244, column: 3, scope: !1171)
!2420 = !DILocation(line: 245, column: 15, scope: !1223)
!2421 = !DILocation(line: 245, column: 27, scope: !1223)
!2422 = !DILocation(line: 245, column: 39, scope: !1223)
!2423 = !DILocation(line: 0, scope: !1232, inlinedAt: !2424)
!2424 = distinct !DILocation(line: 245, column: 5, scope: !1223)
!2425 = !DILocation(line: 342, column: 7, scope: !1243, inlinedAt: !2424)
!2426 = !DILocation(line: 342, scope: !1243, inlinedAt: !2424)
!2427 = !DILocation(line: 342, column: 12, scope: !1246, inlinedAt: !2424)
!2428 = !DILocation(line: 342, column: 3, scope: !1243, inlinedAt: !2424)
!2429 = !DILocation(line: 343, column: 20, scope: !1246, inlinedAt: !2424)
!2430 = !DILocation(line: 343, column: 35, scope: !1246, inlinedAt: !2424)
!2431 = !DILocation(line: 343, column: 33, scope: !1246, inlinedAt: !2424)
!2432 = !DILocation(line: 343, column: 5, scope: !1246, inlinedAt: !2424)
!2433 = !DILocation(line: 343, column: 18, scope: !1246, inlinedAt: !2424)
!2434 = !DILocation(line: 342, column: 22, scope: !1246, inlinedAt: !2424)
!2435 = !DILocation(line: 342, column: 3, scope: !1246, inlinedAt: !2424)
!2436 = distinct !{!2436, !2428, !2437, !258}
!2437 = !DILocation(line: 343, column: 46, scope: !1243, inlinedAt: !2424)
!2438 = !DILocation(line: 244, column: 22, scope: !1223)
!2439 = !DILocation(line: 244, column: 3, scope: !1223)
!2440 = distinct !{!2440, !2419, !2441, !258}
!2441 = !DILocation(line: 245, column: 48, scope: !1171)
!2442 = !DILocation(line: 246, column: 1, scope: !1172)
!2443 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !798, file: !798, line: 19, type: !2023, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2444 = !DILocalVariable(name: "r", arg: 1, scope: !2443, file: !798, line: 19, type: !32)
!2445 = !DILocation(line: 0, scope: !2443)
!2446 = !DILocalVariable(name: "a", arg: 2, scope: !2443, file: !798, line: 19, type: !1235)
!2447 = !DILocalVariable(name: "t", scope: !2443, file: !798, line: 24, type: !2448)
!2448 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !2449)
!2449 = !{!2450}
!2450 = !DISubrange(count: 8)
!2451 = !DILocation(line: 24, column: 11, scope: !2443)
!2452 = !DILocalVariable(name: "i", scope: !2443, file: !798, line: 21, type: !40)
!2453 = !DILocation(line: 28, column: 7, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2443, file: !798, line: 28, column: 3)
!2455 = !DILocation(line: 28, scope: !2454)
!2456 = !DILocation(line: 28, column: 12, scope: !2457)
!2457 = distinct !DILexicalBlock(scope: !2454, file: !798, line: 28, column: 3)
!2458 = !DILocation(line: 28, column: 3, scope: !2454)
!2459 = !DILocation(line: 29, column: 5, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2461, file: !798, line: 29, column: 5)
!2461 = distinct !DILexicalBlock(scope: !2457, file: !798, line: 28, column: 28)
!2462 = !DILocation(line: 29, scope: !2460)
!2463 = !DILocalVariable(name: "j", scope: !2443, file: !798, line: 21, type: !40)
!2464 = !DILocation(line: 29, column: 14, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2460, file: !798, line: 29, column: 5)
!2466 = !DILocation(line: 31, column: 23, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2465, file: !798, line: 29, column: 22)
!2468 = !DILocation(line: 31, column: 25, scope: !2467)
!2469 = !DILocation(line: 31, column: 12, scope: !2467)
!2470 = !DILocalVariable(name: "u", scope: !2443, file: !798, line: 22, type: !61)
!2471 = !DILocation(line: 32, column: 22, scope: !2467)
!2472 = !DILocation(line: 32, column: 9, scope: !2467)
!2473 = !DILocation(line: 34, column: 12, scope: !2467)
!2474 = !DILocalVariable(name: "d0", scope: !2443, file: !798, line: 23, type: !91)
!2475 = !DILocation(line: 36, column: 10, scope: !2467)
!2476 = !DILocation(line: 37, column: 10, scope: !2467)
!2477 = !DILocation(line: 38, column: 14, scope: !2467)
!2478 = !DILocation(line: 38, column: 7, scope: !2467)
!2479 = !DILocation(line: 38, column: 12, scope: !2467)
!2480 = !DILocation(line: 29, column: 18, scope: !2465)
!2481 = !DILocation(line: 29, column: 5, scope: !2465)
!2482 = distinct !{!2482, !2459, !2483, !258}
!2483 = !DILocation(line: 39, column: 5, scope: !2460)
!2484 = !DILocation(line: 41, column: 12, scope: !2461)
!2485 = !DILocation(line: 41, column: 20, scope: !2461)
!2486 = !DILocation(line: 41, column: 25, scope: !2461)
!2487 = !DILocation(line: 41, column: 17, scope: !2461)
!2488 = !DILocation(line: 41, column: 10, scope: !2461)
!2489 = !DILocation(line: 42, column: 12, scope: !2461)
!2490 = !DILocation(line: 42, column: 20, scope: !2461)
!2491 = !DILocation(line: 42, column: 25, scope: !2461)
!2492 = !DILocation(line: 42, column: 17, scope: !2461)
!2493 = !DILocation(line: 42, column: 5, scope: !2461)
!2494 = !DILocation(line: 42, column: 10, scope: !2461)
!2495 = !DILocation(line: 43, column: 12, scope: !2461)
!2496 = !DILocation(line: 43, column: 20, scope: !2461)
!2497 = !DILocation(line: 43, column: 25, scope: !2461)
!2498 = !DILocation(line: 43, column: 17, scope: !2461)
!2499 = !DILocation(line: 43, column: 5, scope: !2461)
!2500 = !DILocation(line: 43, column: 10, scope: !2461)
!2501 = !DILocation(line: 44, column: 12, scope: !2461)
!2502 = !DILocation(line: 44, column: 20, scope: !2461)
!2503 = !DILocation(line: 44, column: 25, scope: !2461)
!2504 = !DILocation(line: 44, column: 17, scope: !2461)
!2505 = !DILocation(line: 44, column: 5, scope: !2461)
!2506 = !DILocation(line: 44, column: 10, scope: !2461)
!2507 = !DILocation(line: 45, column: 7, scope: !2461)
!2508 = !DILocation(line: 28, column: 24, scope: !2457)
!2509 = !DILocation(line: 28, column: 3, scope: !2457)
!2510 = distinct !{!2510, !2458, !2511, !258}
!2511 = !DILocation(line: 46, column: 3, scope: !2454)
!2512 = !DILocation(line: 71, column: 1, scope: !2443)
!2513 = !DILocation(line: 0, scope: !1901)
!2514 = !DILocation(line: 88, column: 7, scope: !1907)
!2515 = !DILocation(line: 88, scope: !1907)
!2516 = !DILocation(line: 88, column: 12, scope: !1910)
!2517 = !DILocation(line: 88, column: 3, scope: !1907)
!2518 = !DILocation(line: 89, column: 37, scope: !1919)
!2519 = !DILocation(line: 89, column: 42, scope: !1919)
!2520 = !DILocation(line: 89, column: 26, scope: !1919)
!2521 = !DILocation(line: 89, column: 47, scope: !1919)
!2522 = !DILocation(line: 89, column: 57, scope: !1919)
!2523 = !DILocation(line: 89, column: 62, scope: !1919)
!2524 = !DILocation(line: 89, column: 24, scope: !1919)
!2525 = !DILocation(line: 89, column: 16, scope: !1919)
!2526 = !DILocation(line: 89, column: 5, scope: !1919)
!2527 = !DILocation(line: 89, column: 22, scope: !1919)
!2528 = !DILocation(line: 90, column: 37, scope: !1919)
!2529 = !DILocation(line: 90, column: 42, scope: !1919)
!2530 = !DILocation(line: 90, column: 26, scope: !1919)
!2531 = !DILocation(line: 90, column: 47, scope: !1919)
!2532 = !DILocation(line: 90, column: 57, scope: !1919)
!2533 = !DILocation(line: 90, column: 62, scope: !1919)
!2534 = !DILocation(line: 90, column: 24, scope: !1919)
!2535 = !DILocation(line: 90, column: 16, scope: !1919)
!2536 = !DILocation(line: 90, column: 18, scope: !1919)
!2537 = !DILocation(line: 90, column: 5, scope: !1919)
!2538 = !DILocation(line: 90, column: 22, scope: !1919)
!2539 = !DILocation(line: 91, column: 7, scope: !1919)
!2540 = !DILocation(line: 88, column: 24, scope: !1910)
!2541 = !DILocation(line: 88, column: 3, scope: !1910)
!2542 = distinct !{!2542, !2517, !2543, !258}
!2543 = !DILocation(line: 92, column: 3, scope: !1907)
!2544 = !DILocation(line: 113, column: 1, scope: !1901)
!2545 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !798, file: !798, line: 124, type: !2023, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2546 = !DILocalVariable(name: "r", arg: 1, scope: !2545, file: !798, line: 124, type: !32)
!2547 = !DILocation(line: 0, scope: !2545)
!2548 = !DILocalVariable(name: "a", arg: 2, scope: !2545, file: !798, line: 124, type: !1235)
!2549 = !DILocalVariable(name: "i", scope: !2545, file: !798, line: 126, type: !40)
!2550 = !DILocation(line: 129, column: 7, scope: !2551)
!2551 = distinct !DILexicalBlock(scope: !2545, file: !798, line: 129, column: 3)
!2552 = !DILocation(line: 129, scope: !2551)
!2553 = !DILocation(line: 129, column: 12, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2551, file: !798, line: 129, column: 3)
!2555 = !DILocation(line: 129, column: 3, scope: !2551)
!2556 = !DILocation(line: 131, column: 22, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2554, file: !798, line: 129, column: 28)
!2558 = !DILocation(line: 131, column: 11, scope: !2557)
!2559 = !DILocalVariable(name: "t0", scope: !2545, file: !798, line: 127, type: !86)
!2560 = !DILocation(line: 132, column: 31, scope: !2557)
!2561 = !DILocation(line: 132, column: 8, scope: !2557)
!2562 = !DILocation(line: 133, column: 21, scope: !2557)
!2563 = !DILocation(line: 133, column: 23, scope: !2557)
!2564 = !DILocation(line: 133, column: 10, scope: !2557)
!2565 = !DILocalVariable(name: "t1", scope: !2545, file: !798, line: 127, type: !86)
!2566 = !DILocation(line: 134, column: 31, scope: !2557)
!2567 = !DILocation(line: 134, column: 8, scope: !2557)
!2568 = !DILocation(line: 135, column: 16, scope: !2557)
!2569 = !DILocation(line: 135, column: 8, scope: !2557)
!2570 = !DILocation(line: 135, column: 5, scope: !2557)
!2571 = !DILocation(line: 135, column: 14, scope: !2557)
!2572 = !DILocation(line: 136, column: 20, scope: !2557)
!2573 = !DILocation(line: 136, column: 29, scope: !2557)
!2574 = !DILocation(line: 136, column: 32, scope: !2557)
!2575 = !DILocation(line: 136, column: 26, scope: !2557)
!2576 = !DILocation(line: 136, column: 8, scope: !2557)
!2577 = !DILocation(line: 136, column: 5, scope: !2557)
!2578 = !DILocation(line: 136, column: 14, scope: !2557)
!2579 = !DILocation(line: 137, column: 20, scope: !2557)
!2580 = !DILocation(line: 137, column: 16, scope: !2557)
!2581 = !DILocation(line: 137, column: 8, scope: !2557)
!2582 = !DILocation(line: 137, column: 5, scope: !2557)
!2583 = !DILocation(line: 137, column: 14, scope: !2557)
!2584 = !DILocation(line: 129, column: 24, scope: !2554)
!2585 = !DILocation(line: 129, column: 3, scope: !2554)
!2586 = distinct !{!2586, !2555, !2587, !258}
!2587 = !DILocation(line: 138, column: 3, scope: !2551)
!2588 = !DILocation(line: 139, column: 1, scope: !2545)
!2589 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !798, file: !798, line: 151, type: !1395, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2590 = !DILocalVariable(name: "r", arg: 1, scope: !2589, file: !798, line: 151, type: !801)
!2591 = !DILocation(line: 0, scope: !2589)
!2592 = !DILocalVariable(name: "a", arg: 2, scope: !2589, file: !798, line: 151, type: !160)
!2593 = !DILocalVariable(name: "i", scope: !2589, file: !798, line: 153, type: !40)
!2594 = !DILocation(line: 154, column: 7, scope: !2595)
!2595 = distinct !DILexicalBlock(scope: !2589, file: !798, line: 154, column: 3)
!2596 = !DILocation(line: 154, scope: !2595)
!2597 = !DILocation(line: 154, column: 12, scope: !2598)
!2598 = distinct !DILexicalBlock(scope: !2595, file: !798, line: 154, column: 3)
!2599 = !DILocation(line: 154, column: 3, scope: !2595)
!2600 = !DILocation(line: 155, column: 29, scope: !2601)
!2601 = distinct !DILexicalBlock(scope: !2598, file: !798, line: 154, column: 28)
!2602 = !DILocation(line: 155, column: 26, scope: !2601)
!2603 = !DILocation(line: 155, column: 57, scope: !2601)
!2604 = !DILocation(line: 155, column: 54, scope: !2601)
!2605 = !DILocation(line: 155, column: 44, scope: !2601)
!2606 = !DILocation(line: 155, column: 63, scope: !2601)
!2607 = !DILocation(line: 155, column: 70, scope: !2601)
!2608 = !DILocation(line: 155, column: 16, scope: !2601)
!2609 = !DILocation(line: 155, column: 5, scope: !2601)
!2610 = !DILocation(line: 155, column: 22, scope: !2601)
!2611 = !DILocation(line: 156, column: 29, scope: !2601)
!2612 = !DILocation(line: 156, column: 26, scope: !2601)
!2613 = !DILocation(line: 156, column: 35, scope: !2601)
!2614 = !DILocation(line: 156, column: 57, scope: !2601)
!2615 = !DILocation(line: 156, column: 54, scope: !2601)
!2616 = !DILocation(line: 156, column: 44, scope: !2601)
!2617 = !DILocation(line: 156, column: 63, scope: !2601)
!2618 = !DILocation(line: 156, column: 41, scope: !2601)
!2619 = !DILocation(line: 156, column: 16, scope: !2601)
!2620 = !DILocation(line: 156, column: 18, scope: !2601)
!2621 = !DILocation(line: 156, column: 5, scope: !2601)
!2622 = !DILocation(line: 156, column: 22, scope: !2601)
!2623 = !DILocation(line: 154, column: 24, scope: !2598)
!2624 = !DILocation(line: 154, column: 3, scope: !2598)
!2625 = distinct !{!2625, !2599, !2626, !258}
!2626 = !DILocation(line: 157, column: 3, scope: !2595)
!2627 = !DILocation(line: 158, column: 1, scope: !2589)
!2628 = !DILocation(line: 0, scope: !1394)
!2629 = !DILocation(line: 176, column: 7, scope: !1402)
!2630 = !DILocation(line: 176, scope: !1402)
!2631 = !DILocation(line: 176, column: 12, scope: !1405)
!2632 = !DILocation(line: 176, column: 3, scope: !1402)
!2633 = !DILocation(line: 177, column: 5, scope: !1408)
!2634 = !DILocation(line: 177, scope: !1408)
!2635 = !DILocation(line: 177, column: 14, scope: !1413)
!2636 = !DILocation(line: 178, column: 18, scope: !1415)
!2637 = !DILocation(line: 178, column: 20, scope: !1415)
!2638 = !DILocation(line: 178, column: 7, scope: !1415)
!2639 = !DILocation(line: 178, column: 24, scope: !1415)
!2640 = !DILocation(line: 179, column: 27, scope: !1415)
!2641 = !DILocation(line: 179, column: 31, scope: !1415)
!2642 = !DILocation(line: 179, column: 53, scope: !1415)
!2643 = !DILocation(line: 0, scope: !1423, inlinedAt: !2644)
!2644 = distinct !DILocation(line: 179, column: 7, scope: !1415)
!2645 = !DILocation(line: 74, column: 15, scope: !1423, inlinedAt: !2644)
!2646 = !DILocation(line: 74, column: 11, scope: !1423, inlinedAt: !2644)
!2647 = !DILocation(line: 74, column: 6, scope: !1423, inlinedAt: !2644)
!2648 = !DILocation(line: 177, column: 18, scope: !1413)
!2649 = !DILocation(line: 177, column: 5, scope: !1413)
!2650 = distinct !{!2650, !2633, !2651, !258}
!2651 = !DILocation(line: 180, column: 5, scope: !1408)
!2652 = !DILocation(line: 176, column: 24, scope: !1405)
!2653 = !DILocation(line: 176, column: 3, scope: !1405)
!2654 = distinct !{!2654, !2632, !2655, !258}
!2655 = !DILocation(line: 181, column: 3, scope: !1402)
!2656 = !DILocation(line: 182, column: 1, scope: !1394)
!2657 = !DILocalVariable(name: "msg", arg: 1, scope: !2022, file: !798, line: 192, type: !32)
!2658 = !DILocation(line: 0, scope: !2022)
!2659 = !DILocalVariable(name: "a", arg: 2, scope: !2022, file: !798, line: 192, type: !1235)
!2660 = !DILocation(line: 197, column: 7, scope: !2021)
!2661 = !DILocation(line: 197, scope: !2021)
!2662 = !DILocation(line: 197, column: 12, scope: !2044)
!2663 = !DILocation(line: 197, column: 3, scope: !2021)
!2664 = !DILocation(line: 198, column: 5, scope: !2046)
!2665 = !DILocation(line: 198, column: 12, scope: !2046)
!2666 = !DILocation(line: 199, column: 9, scope: !2050)
!2667 = !DILocation(line: 199, scope: !2050)
!2668 = !DILocation(line: 199, column: 14, scope: !2053)
!2669 = !DILocation(line: 199, column: 5, scope: !2050)
!2670 = !DILocation(line: 200, column: 23, scope: !2056)
!2671 = !DILocation(line: 200, column: 25, scope: !2056)
!2672 = !DILocation(line: 200, column: 12, scope: !2056)
!2673 = !DILocation(line: 205, column: 9, scope: !2056)
!2674 = !DILocation(line: 206, column: 9, scope: !2056)
!2675 = !DILocation(line: 207, column: 9, scope: !2056)
!2676 = !DILocation(line: 208, column: 19, scope: !2056)
!2677 = !DILocation(line: 208, column: 7, scope: !2056)
!2678 = !DILocation(line: 208, column: 14, scope: !2056)
!2679 = !DILocation(line: 199, column: 18, scope: !2053)
!2680 = !DILocation(line: 199, column: 5, scope: !2053)
!2681 = distinct !{!2681, !2669, !2682, !258}
!2682 = !DILocation(line: 209, column: 5, scope: !2050)
!2683 = !DILocation(line: 197, column: 24, scope: !2044)
!2684 = !DILocation(line: 197, column: 3, scope: !2044)
!2685 = distinct !{!2685, !2663, !2686, !258}
!2686 = !DILocation(line: 210, column: 3, scope: !2021)
!2687 = !DILocation(line: 211, column: 1, scope: !2022)
!2688 = !DILocation(line: 0, scope: !797)
!2689 = !DILocation(line: 227, column: 11, scope: !797)
!2690 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !2691)
!2691 = distinct !DILocation(line: 228, column: 3, scope: !797)
!2692 = !DILocation(line: 0, scope: !817, inlinedAt: !2691)
!2693 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !2691)
!2694 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !2691)
!2695 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !2691)
!2696 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !2697)
!2697 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !2698)
!2698 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !2691)
!2699 = !DILocation(line: 0, scope: !836, inlinedAt: !2698)
!2700 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !2698)
!2701 = !DILocation(line: 0, scope: !834, inlinedAt: !2697)
!2702 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !2697)
!2703 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !2697)
!2704 = !DILocation(line: 0, scope: !855, inlinedAt: !2705)
!2705 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !2698)
!2706 = !DILocation(line: 0, scope: !604, inlinedAt: !2707)
!2707 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !2705)
!2708 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !2707)
!2709 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !2707)
!2710 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !2707)
!2711 = !DILocation(line: 509, scope: !618, inlinedAt: !2707)
!2712 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !2707)
!2713 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !2707)
!2714 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !2707)
!2715 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !2707)
!2716 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !2707)
!2717 = !DILocation(line: 0, scope: !627, inlinedAt: !2718)
!2718 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !2707)
!2719 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !2718)
!2720 = !DILocation(line: 43, scope: !635, inlinedAt: !2718)
!2721 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !2718)
!2722 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !2718)
!2723 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !2718)
!2724 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !2718)
!2725 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !2718)
!2726 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !2718)
!2727 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !2718)
!2728 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !2718)
!2729 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !2718)
!2730 = distinct !{!2730, !2722, !2731, !258}
!2731 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !2718)
!2732 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !2707)
!2733 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !2707)
!2734 = distinct !{!2734, !2713, !2735, !258}
!2735 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !2707)
!2736 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !2707)
!2737 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !2707)
!2738 = distinct !{!2738, !2708, !2739, !258}
!2739 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !2707)
!2740 = !DILocation(line: 732, column: 7, scope: !836, inlinedAt: !2698)
!2741 = !DILocation(line: 0, scope: !896, inlinedAt: !2742)
!2742 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !2698)
!2743 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !2742)
!2744 = !DILocation(line: 0, scope: !903, inlinedAt: !2745)
!2745 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !2742)
!2746 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !2745)
!2747 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !2745)
!2748 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !2745)
!2749 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !2745)
!2750 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !2745)
!2751 = !DILocation(line: 439, scope: !921, inlinedAt: !2745)
!2752 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !2745)
!2753 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !2745)
!2754 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !2745)
!2755 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !2745)
!2756 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !2745)
!2757 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !2745)
!2758 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !2745)
!2759 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !2745)
!2760 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !2745)
!2761 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !2745)
!2762 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !2745)
!2763 = distinct !{!2763, !2754, !2764, !258}
!2764 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !2745)
!2765 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !2745)
!2766 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !2745)
!2767 = distinct !{!2767, !2746, !2768, !258}
!2768 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !2745)
!2769 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !2742)
!2770 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !2742)
!2771 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !2698)
!2772 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !2691)
!2773 = !DILocation(line: 0, scope: !947, inlinedAt: !2774)
!2774 = distinct !DILocation(line: 229, column: 3, scope: !797)
!2775 = !DILocation(line: 115, column: 3, scope: !947, inlinedAt: !2774)
!2776 = !DILocation(line: 230, column: 1, scope: !797)
!2777 = !DILocation(line: 0, scope: !1552)
!2778 = !DILocation(line: 246, column: 11, scope: !1552)
!2779 = !DILocation(line: 47, column: 3, scope: !817, inlinedAt: !2780)
!2780 = distinct !DILocation(line: 247, column: 3, scope: !1552)
!2781 = !DILocation(line: 0, scope: !817, inlinedAt: !2780)
!2782 = !DILocation(line: 45, column: 11, scope: !817, inlinedAt: !2780)
!2783 = !DILocation(line: 48, column: 3, scope: !817, inlinedAt: !2780)
!2784 = !DILocation(line: 48, column: 26, scope: !817, inlinedAt: !2780)
!2785 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !2786)
!2786 = distinct !DILocation(line: 728, column: 3, scope: !836, inlinedAt: !2787)
!2787 = distinct !DILocation(line: 50, column: 3, scope: !817, inlinedAt: !2780)
!2788 = !DILocation(line: 0, scope: !836, inlinedAt: !2787)
!2789 = !DILocation(line: 726, column: 16, scope: !836, inlinedAt: !2787)
!2790 = !DILocation(line: 0, scope: !834, inlinedAt: !2786)
!2791 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !2786)
!2792 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !2786)
!2793 = !DILocation(line: 0, scope: !855, inlinedAt: !2794)
!2794 = distinct !DILocation(line: 730, column: 3, scope: !836, inlinedAt: !2787)
!2795 = !DILocation(line: 0, scope: !604, inlinedAt: !2796)
!2796 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !2794)
!2797 = !DILocation(line: 0, scope: !896, inlinedAt: !2798)
!2798 = distinct !DILocation(line: 733, column: 3, scope: !836, inlinedAt: !2787)
!2799 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !2798)
!2800 = !DILocation(line: 0, scope: !903, inlinedAt: !2801)
!2801 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !2798)
!2802 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !2801)
!2803 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !2801)
!2804 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !2801)
!2805 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !2801)
!2806 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !2801)
!2807 = !DILocation(line: 439, scope: !921, inlinedAt: !2801)
!2808 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !2801)
!2809 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !2801)
!2810 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !2801)
!2811 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !2801)
!2812 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !2801)
!2813 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !2801)
!2814 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !2801)
!2815 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !2801)
!2816 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !2801)
!2817 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !2801)
!2818 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !2801)
!2819 = distinct !{!2819, !2810, !2820, !258}
!2820 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !2801)
!2821 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !2801)
!2822 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !2801)
!2823 = distinct !{!2823, !2802, !2824, !258}
!2824 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !2801)
!2825 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !2798)
!2826 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !2798)
!2827 = !DILocation(line: 734, column: 1, scope: !836, inlinedAt: !2787)
!2828 = !DILocation(line: 51, column: 1, scope: !817, inlinedAt: !2780)
!2829 = !DILocation(line: 0, scope: !1613, inlinedAt: !2830)
!2830 = distinct !DILocation(line: 248, column: 3, scope: !1552)
!2831 = !DILocation(line: 124, column: 3, scope: !1613, inlinedAt: !2830)
!2832 = !DILocation(line: 249, column: 1, scope: !1552)
!2833 = !DILocation(line: 0, scope: !1092)
!2834 = !DILocation(line: 263, column: 3, scope: !1092)
!2835 = !DILocation(line: 0, scope: !1099, inlinedAt: !2836)
!2836 = distinct !DILocation(line: 264, column: 3, scope: !1092)
!2837 = !DILocation(line: 326, column: 7, scope: !1104, inlinedAt: !2836)
!2838 = !DILocation(line: 326, scope: !1104, inlinedAt: !2836)
!2839 = !DILocation(line: 326, column: 12, scope: !1107, inlinedAt: !2836)
!2840 = !DILocation(line: 326, column: 3, scope: !1104, inlinedAt: !2836)
!2841 = !DILocation(line: 327, column: 35, scope: !1107, inlinedAt: !2836)
!2842 = !DILocation(line: 0, scope: !1111, inlinedAt: !2843)
!2843 = distinct !DILocation(line: 327, column: 20, scope: !1107, inlinedAt: !2836)
!2844 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2843)
!2845 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2843)
!2846 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2843)
!2847 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2843)
!2848 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2843)
!2849 = !DILocation(line: 327, column: 5, scope: !1107, inlinedAt: !2836)
!2850 = !DILocation(line: 327, column: 18, scope: !1107, inlinedAt: !2836)
!2851 = !DILocation(line: 326, column: 22, scope: !1107, inlinedAt: !2836)
!2852 = !DILocation(line: 326, column: 3, scope: !1107, inlinedAt: !2836)
!2853 = distinct !{!2853, !2840, !2854, !258}
!2854 = !DILocation(line: 327, column: 47, scope: !1104, inlinedAt: !2836)
!2855 = !DILocation(line: 265, column: 1, scope: !1092)
!2856 = !DILocation(line: 0, scope: !1099)
!2857 = !DILocation(line: 326, column: 7, scope: !1104)
!2858 = !DILocation(line: 326, scope: !1104)
!2859 = !DILocation(line: 326, column: 12, scope: !1107)
!2860 = !DILocation(line: 326, column: 3, scope: !1104)
!2861 = !DILocation(line: 327, column: 35, scope: !1107)
!2862 = !DILocation(line: 0, scope: !1111, inlinedAt: !2863)
!2863 = distinct !DILocation(line: 327, column: 20, scope: !1107)
!2864 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !2863)
!2865 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !2863)
!2866 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !2863)
!2867 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !2863)
!2868 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !2863)
!2869 = !DILocation(line: 327, column: 5, scope: !1107)
!2870 = !DILocation(line: 327, column: 18, scope: !1107)
!2871 = !DILocation(line: 326, column: 22, scope: !1107)
!2872 = !DILocation(line: 326, column: 3, scope: !1107)
!2873 = distinct !{!2873, !2860, !2874, !258}
!2874 = !DILocation(line: 327, column: 47, scope: !1104)
!2875 = !DILocation(line: 328, column: 1, scope: !1099)
!2876 = !DILocation(line: 0, scope: !1743)
!2877 = !DILocation(line: 278, column: 3, scope: !1743)
!2878 = !DILocation(line: 279, column: 1, scope: !1743)
!2879 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !798, file: !798, line: 290, type: !1233, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2880 = !DILocalVariable(name: "r", arg: 1, scope: !2879, file: !798, line: 290, type: !801)
!2881 = !DILocation(line: 0, scope: !2879)
!2882 = !DILocalVariable(name: "a", arg: 2, scope: !2879, file: !798, line: 290, type: !1235)
!2883 = !DILocalVariable(name: "b", arg: 3, scope: !2879, file: !798, line: 290, type: !1235)
!2884 = !DILocalVariable(name: "i", scope: !2879, file: !798, line: 292, type: !40)
!2885 = !DILocation(line: 293, column: 7, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2879, file: !798, line: 293, column: 3)
!2887 = !DILocation(line: 293, scope: !2886)
!2888 = !DILocation(line: 293, column: 12, scope: !2889)
!2889 = distinct !DILexicalBlock(scope: !2886, file: !798, line: 293, column: 3)
!2890 = !DILocation(line: 293, column: 3, scope: !2886)
!2891 = !DILocation(line: 294, column: 25, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2889, file: !798, line: 293, column: 28)
!2893 = !DILocation(line: 294, column: 14, scope: !2892)
!2894 = !DILocation(line: 294, column: 42, scope: !2892)
!2895 = !DILocation(line: 294, column: 31, scope: !2892)
!2896 = !DILocation(line: 294, column: 59, scope: !2892)
!2897 = !DILocation(line: 294, column: 48, scope: !2892)
!2898 = !DILocation(line: 294, column: 72, scope: !2892)
!2899 = !DILocation(line: 294, column: 64, scope: !2892)
!2900 = !DILocation(line: 294, column: 5, scope: !2892)
!2901 = !DILocation(line: 295, column: 25, scope: !2892)
!2902 = !DILocation(line: 295, column: 27, scope: !2892)
!2903 = !DILocation(line: 295, column: 14, scope: !2892)
!2904 = !DILocation(line: 295, column: 44, scope: !2892)
!2905 = !DILocation(line: 295, column: 46, scope: !2892)
!2906 = !DILocation(line: 295, column: 33, scope: !2892)
!2907 = !DILocation(line: 295, column: 63, scope: !2892)
!2908 = !DILocation(line: 295, column: 65, scope: !2892)
!2909 = !DILocation(line: 295, column: 52, scope: !2892)
!2910 = !DILocation(line: 295, column: 79, scope: !2892)
!2911 = !DILocation(line: 295, column: 71, scope: !2892)
!2912 = !DILocation(line: 295, column: 70, scope: !2892)
!2913 = !DILocation(line: 295, column: 5, scope: !2892)
!2914 = !DILocation(line: 293, column: 24, scope: !2889)
!2915 = !DILocation(line: 293, column: 3, scope: !2889)
!2916 = distinct !{!2916, !2890, !2917, !258}
!2917 = !DILocation(line: 296, column: 3, scope: !2886)
!2918 = !DILocation(line: 297, column: 1, scope: !2879)
!2919 = !DILocation(line: 0, scope: !1184)
!2920 = !DILocation(line: 311, column: 7, scope: !1190)
!2921 = !DILocation(line: 311, scope: !1190)
!2922 = !DILocation(line: 311, column: 12, scope: !1193)
!2923 = !DILocation(line: 311, column: 3, scope: !1190)
!2924 = !DILocation(line: 312, column: 47, scope: !1193)
!2925 = !DILocation(line: 312, column: 38, scope: !1193)
!2926 = !DILocation(line: 312, column: 59, scope: !1193)
!2927 = !DILocation(line: 0, scope: !1199, inlinedAt: !2928)
!2928 = distinct !DILocation(line: 312, column: 20, scope: !1193)
!2929 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !2928)
!2930 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !2928)
!2931 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !2928)
!2932 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !2928)
!2933 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !2928)
!2934 = !DILocation(line: 312, column: 5, scope: !1193)
!2935 = !DILocation(line: 312, column: 18, scope: !1193)
!2936 = !DILocation(line: 311, column: 22, scope: !1193)
!2937 = !DILocation(line: 311, column: 3, scope: !1193)
!2938 = distinct !{!2938, !2923, !2939, !258}
!2939 = !DILocation(line: 312, column: 61, scope: !1190)
!2940 = !DILocation(line: 313, column: 1, scope: !1184)
!2941 = !DILocation(line: 0, scope: !1232)
!2942 = !DILocation(line: 342, column: 7, scope: !1243)
!2943 = !DILocation(line: 342, scope: !1243)
!2944 = !DILocation(line: 342, column: 12, scope: !1246)
!2945 = !DILocation(line: 342, column: 3, scope: !1243)
!2946 = !DILocation(line: 343, column: 20, scope: !1246)
!2947 = !DILocation(line: 343, column: 35, scope: !1246)
!2948 = !DILocation(line: 343, column: 33, scope: !1246)
!2949 = !DILocation(line: 343, column: 5, scope: !1246)
!2950 = !DILocation(line: 343, column: 18, scope: !1246)
!2951 = !DILocation(line: 342, column: 22, scope: !1246)
!2952 = !DILocation(line: 342, column: 3, scope: !1246)
!2953 = distinct !{!2953, !2945, !2954, !258}
!2954 = !DILocation(line: 343, column: 46, scope: !1243)
!2955 = !DILocation(line: 344, column: 1, scope: !1232)
!2956 = !DILocation(line: 0, scope: !1994)
!2957 = !DILocation(line: 358, column: 7, scope: !2001)
!2958 = !DILocation(line: 358, scope: !2001)
!2959 = !DILocation(line: 358, column: 12, scope: !2004)
!2960 = !DILocation(line: 358, column: 3, scope: !2001)
!2961 = !DILocation(line: 359, column: 20, scope: !2004)
!2962 = !DILocation(line: 359, column: 35, scope: !2004)
!2963 = !DILocation(line: 359, column: 33, scope: !2004)
!2964 = !DILocation(line: 359, column: 5, scope: !2004)
!2965 = !DILocation(line: 359, column: 18, scope: !2004)
!2966 = !DILocation(line: 358, column: 22, scope: !2004)
!2967 = !DILocation(line: 358, column: 3, scope: !2004)
!2968 = distinct !{!2968, !2960, !2969, !258}
!2969 = !DILocation(line: 359, column: 46, scope: !2001)
!2970 = !DILocation(line: 360, column: 1, scope: !1994)
!2971 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !58, file: !58, line: 80, type: !2972, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2972 = !DISubroutineType(types: !2973)
!2973 = !{null, !719}
!2974 = !DILocalVariable(name: "r", arg: 1, scope: !2971, file: !58, line: 80, type: !719)
!2975 = !DILocation(line: 0, scope: !2971)
!2976 = !DILocalVariable(name: "k", scope: !2971, file: !58, line: 81, type: !40)
!2977 = !DILocalVariable(name: "len", scope: !2971, file: !58, line: 81, type: !40)
!2978 = !DILocation(line: 85, column: 7, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2971, file: !58, line: 85, column: 3)
!2980 = !DILocation(line: 85, scope: !2979)
!2981 = !DILocation(line: 84, column: 5, scope: !2971)
!2982 = !DILocation(line: 85, column: 22, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2979, file: !58, line: 85, column: 3)
!2984 = !DILocation(line: 85, column: 3, scope: !2979)
!2985 = !DILocation(line: 86, column: 5, scope: !2986)
!2986 = distinct !DILexicalBlock(scope: !2987, file: !58, line: 86, column: 5)
!2987 = distinct !DILexicalBlock(scope: !2983, file: !58, line: 85, column: 39)
!2988 = !DILocation(line: 86, scope: !2986)
!2989 = !DILocalVariable(name: "start", scope: !2971, file: !58, line: 81, type: !40)
!2990 = !DILocation(line: 86, column: 26, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2986, file: !58, line: 86, column: 5)
!2992 = !DILocation(line: 87, column: 14, scope: !2993)
!2993 = distinct !DILexicalBlock(scope: !2991, file: !58, line: 86, column: 50)
!2994 = !DILocalVariable(name: "zeta", scope: !2971, file: !58, line: 82, type: !61)
!2995 = !DILocalVariable(name: "j", scope: !2971, file: !58, line: 81, type: !40)
!2996 = !DILocation(line: 88, column: 11, scope: !2997)
!2997 = distinct !DILexicalBlock(scope: !2993, file: !58, line: 88, column: 7)
!2998 = !DILocation(line: 88, scope: !2997)
!2999 = !DILocation(line: 88, column: 32, scope: !3000)
!3000 = distinct !DILexicalBlock(scope: !2997, file: !58, line: 88, column: 7)
!3001 = !DILocation(line: 88, column: 24, scope: !3000)
!3002 = !DILocation(line: 88, column: 7, scope: !2997)
!3003 = !DILocation(line: 89, column: 25, scope: !3004)
!3004 = distinct !DILexicalBlock(scope: !3000, file: !58, line: 88, column: 44)
!3005 = !DILocalVariable(name: "a", arg: 1, scope: !3006, file: !58, line: 68, type: !61)
!3006 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !3007, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3007 = !DISubroutineType(types: !3008)
!3008 = !{!61, !61, !61}
!3009 = !DILocation(line: 0, scope: !3006, inlinedAt: !3010)
!3010 = distinct !DILocation(line: 89, column: 13, scope: !3004)
!3011 = !DILocalVariable(name: "b", arg: 2, scope: !3006, file: !58, line: 68, type: !61)
!3012 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3010)
!3013 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3010)
!3014 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3010)
!3015 = !DILocation(line: 0, scope: !1199, inlinedAt: !3016)
!3016 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3010)
!3017 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3016)
!3018 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3016)
!3019 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3016)
!3020 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3016)
!3021 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3016)
!3022 = !DILocalVariable(name: "t", scope: !2971, file: !58, line: 82, type: !61)
!3023 = !DILocation(line: 90, column: 22, scope: !3004)
!3024 = !DILocation(line: 90, column: 27, scope: !3004)
!3025 = !DILocation(line: 90, column: 9, scope: !3004)
!3026 = !DILocation(line: 90, column: 20, scope: !3004)
!3027 = !DILocation(line: 91, column: 16, scope: !3004)
!3028 = !DILocation(line: 91, column: 21, scope: !3004)
!3029 = !DILocation(line: 91, column: 9, scope: !3004)
!3030 = !DILocation(line: 91, column: 14, scope: !3004)
!3031 = !DILocation(line: 88, column: 40, scope: !3000)
!3032 = !DILocation(line: 88, column: 7, scope: !3000)
!3033 = distinct !{!3033, !3002, !3034, !258}
!3034 = !DILocation(line: 92, column: 7, scope: !2997)
!3035 = !DILocation(line: 87, column: 21, scope: !2993)
!3036 = !DILocation(line: 86, column: 43, scope: !2991)
!3037 = !DILocation(line: 86, column: 5, scope: !2991)
!3038 = distinct !{!3038, !2985, !3039, !258}
!3039 = !DILocation(line: 93, column: 5, scope: !2986)
!3040 = !DILocation(line: 85, column: 32, scope: !2983)
!3041 = !DILocation(line: 85, column: 3, scope: !2983)
!3042 = distinct !{!3042, !2984, !3043, !258}
!3043 = !DILocation(line: 94, column: 3, scope: !2979)
!3044 = !DILocation(line: 95, column: 1, scope: !2971)
!3045 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !58, file: !58, line: 106, type: !2972, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3046 = !DILocalVariable(name: "r", arg: 1, scope: !3045, file: !58, line: 106, type: !719)
!3047 = !DILocation(line: 0, scope: !3045)
!3048 = !DILocalVariable(name: "f", scope: !3045, file: !58, line: 109, type: !60)
!3049 = !DILocalVariable(name: "k", scope: !3045, file: !58, line: 107, type: !40)
!3050 = !DILocalVariable(name: "len", scope: !3045, file: !58, line: 107, type: !40)
!3051 = !DILocation(line: 112, column: 7, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3045, file: !58, line: 112, column: 3)
!3053 = !DILocation(line: 112, scope: !3052)
!3054 = !DILocation(line: 111, column: 5, scope: !3045)
!3055 = !DILocation(line: 112, column: 20, scope: !3056)
!3056 = distinct !DILexicalBlock(scope: !3052, file: !58, line: 112, column: 3)
!3057 = !DILocation(line: 112, column: 3, scope: !3052)
!3058 = !DILocation(line: 113, column: 5, scope: !3059)
!3059 = distinct !DILexicalBlock(scope: !3060, file: !58, line: 113, column: 5)
!3060 = distinct !DILexicalBlock(scope: !3056, file: !58, line: 112, column: 39)
!3061 = !DILocation(line: 124, column: 3, scope: !3062)
!3062 = distinct !DILexicalBlock(scope: !3045, file: !58, line: 124, column: 3)
!3063 = !DILocation(line: 113, scope: !3059)
!3064 = !DILocalVariable(name: "start", scope: !3045, file: !58, line: 107, type: !40)
!3065 = !DILocation(line: 113, column: 26, scope: !3066)
!3066 = distinct !DILexicalBlock(scope: !3059, file: !58, line: 113, column: 5)
!3067 = !DILocation(line: 114, column: 14, scope: !3068)
!3068 = distinct !DILexicalBlock(scope: !3066, file: !58, line: 113, column: 50)
!3069 = !DILocalVariable(name: "zeta", scope: !3045, file: !58, line: 108, type: !61)
!3070 = !DILocalVariable(name: "j", scope: !3045, file: !58, line: 107, type: !40)
!3071 = !DILocation(line: 115, column: 11, scope: !3072)
!3072 = distinct !DILexicalBlock(scope: !3068, file: !58, line: 115, column: 7)
!3073 = !DILocation(line: 115, scope: !3072)
!3074 = !DILocation(line: 115, column: 32, scope: !3075)
!3075 = distinct !DILexicalBlock(scope: !3072, file: !58, line: 115, column: 7)
!3076 = !DILocation(line: 115, column: 24, scope: !3075)
!3077 = !DILocation(line: 115, column: 7, scope: !3072)
!3078 = !DILocation(line: 116, column: 13, scope: !3079)
!3079 = distinct !DILexicalBlock(scope: !3075, file: !58, line: 115, column: 44)
!3080 = !DILocalVariable(name: "t", scope: !3045, file: !58, line: 108, type: !61)
!3081 = !DILocation(line: 117, column: 35, scope: !3079)
!3082 = !DILocation(line: 117, column: 33, scope: !3079)
!3083 = !DILocation(line: 0, scope: !1111, inlinedAt: !3084)
!3084 = distinct !DILocation(line: 117, column: 16, scope: !3079)
!3085 = !DILocation(line: 39, column: 20, scope: !1111, inlinedAt: !3084)
!3086 = !DILocation(line: 39, column: 19, scope: !1111, inlinedAt: !3084)
!3087 = !DILocation(line: 39, column: 22, scope: !1111, inlinedAt: !3084)
!3088 = !DILocation(line: 39, column: 33, scope: !1111, inlinedAt: !3084)
!3089 = !DILocation(line: 41, column: 10, scope: !1111, inlinedAt: !3084)
!3090 = !DILocation(line: 117, column: 9, scope: !3079)
!3091 = !DILocation(line: 117, column: 14, scope: !3079)
!3092 = !DILocation(line: 118, column: 22, scope: !3079)
!3093 = !DILocation(line: 118, column: 33, scope: !3079)
!3094 = !DILocation(line: 118, column: 9, scope: !3079)
!3095 = !DILocation(line: 118, column: 20, scope: !3079)
!3096 = !DILocation(line: 119, column: 34, scope: !3079)
!3097 = !DILocation(line: 0, scope: !3006, inlinedAt: !3098)
!3098 = distinct !DILocation(line: 119, column: 22, scope: !3079)
!3099 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3098)
!3100 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3098)
!3101 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3098)
!3102 = !DILocation(line: 0, scope: !1199, inlinedAt: !3103)
!3103 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3098)
!3104 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3103)
!3105 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3103)
!3106 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3103)
!3107 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3103)
!3108 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3103)
!3109 = !DILocation(line: 119, column: 9, scope: !3079)
!3110 = !DILocation(line: 119, column: 20, scope: !3079)
!3111 = !DILocation(line: 115, column: 40, scope: !3075)
!3112 = !DILocation(line: 115, column: 7, scope: !3075)
!3113 = distinct !{!3113, !3077, !3114, !258}
!3114 = !DILocation(line: 120, column: 7, scope: !3072)
!3115 = !DILocation(line: 114, column: 21, scope: !3068)
!3116 = !DILocation(line: 113, column: 43, scope: !3066)
!3117 = !DILocation(line: 113, column: 5, scope: !3066)
!3118 = distinct !{!3118, !3058, !3119, !258}
!3119 = !DILocation(line: 121, column: 5, scope: !3059)
!3120 = !DILocation(line: 112, column: 32, scope: !3056)
!3121 = !DILocation(line: 112, column: 3, scope: !3056)
!3122 = distinct !{!3122, !3057, !3123, !258}
!3123 = !DILocation(line: 122, column: 3, scope: !3052)
!3124 = !DILocation(line: 124, scope: !3062)
!3125 = !DILocation(line: 124, column: 16, scope: !3126)
!3126 = distinct !DILexicalBlock(scope: !3062, file: !58, line: 124, column: 3)
!3127 = !DILocation(line: 125, column: 18, scope: !3126)
!3128 = !DILocation(line: 0, scope: !3006, inlinedAt: !3129)
!3129 = distinct !DILocation(line: 125, column: 12, scope: !3126)
!3130 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3129)
!3131 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3129)
!3132 = !DILocation(line: 0, scope: !1199, inlinedAt: !3133)
!3133 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3129)
!3134 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3133)
!3135 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3133)
!3136 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3133)
!3137 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3133)
!3138 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3133)
!3139 = !DILocation(line: 125, column: 5, scope: !3126)
!3140 = !DILocation(line: 125, column: 10, scope: !3126)
!3141 = !DILocation(line: 124, column: 24, scope: !3126)
!3142 = !DILocation(line: 124, column: 3, scope: !3126)
!3143 = distinct !{!3143, !3061, !3144, !258}
!3144 = !DILocation(line: 125, column: 25, scope: !3062)
!3145 = !DILocation(line: 126, column: 1, scope: !3045)
!3146 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !58, file: !58, line: 139, type: !3147, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3147 = !DISubroutineType(types: !3148)
!3148 = !{null, !719, !3149, !3149, !61}
!3149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!3150 = !DILocalVariable(name: "r", arg: 1, scope: !3146, file: !58, line: 139, type: !719)
!3151 = !DILocation(line: 0, scope: !3146)
!3152 = !DILocalVariable(name: "a", arg: 2, scope: !3146, file: !58, line: 139, type: !3149)
!3153 = !DILocalVariable(name: "b", arg: 3, scope: !3146, file: !58, line: 139, type: !3149)
!3154 = !DILocalVariable(name: "zeta", arg: 4, scope: !3146, file: !58, line: 139, type: !61)
!3155 = !DILocation(line: 141, column: 17, scope: !3146)
!3156 = !DILocation(line: 141, column: 23, scope: !3146)
!3157 = !DILocation(line: 0, scope: !3006, inlinedAt: !3158)
!3158 = distinct !DILocation(line: 141, column: 11, scope: !3146)
!3159 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3158)
!3160 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3158)
!3161 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3158)
!3162 = !DILocation(line: 0, scope: !1199, inlinedAt: !3163)
!3163 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3158)
!3164 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3163)
!3165 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3163)
!3166 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3163)
!3167 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3163)
!3168 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3163)
!3169 = !DILocation(line: 141, column: 9, scope: !3146)
!3170 = !DILocation(line: 0, scope: !3006, inlinedAt: !3171)
!3171 = distinct !DILocation(line: 142, column: 11, scope: !3146)
!3172 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3171)
!3173 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3171)
!3174 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3171)
!3175 = !DILocation(line: 0, scope: !1199, inlinedAt: !3176)
!3176 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3171)
!3177 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3176)
!3178 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3176)
!3179 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3176)
!3180 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3176)
!3181 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3176)
!3182 = !DILocation(line: 142, column: 9, scope: !3146)
!3183 = !DILocation(line: 143, column: 17, scope: !3146)
!3184 = !DILocation(line: 143, column: 23, scope: !3146)
!3185 = !DILocation(line: 0, scope: !3006, inlinedAt: !3186)
!3186 = distinct !DILocation(line: 143, column: 11, scope: !3146)
!3187 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3186)
!3188 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3186)
!3189 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3186)
!3190 = !DILocation(line: 0, scope: !1199, inlinedAt: !3191)
!3191 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3186)
!3192 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3191)
!3193 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3191)
!3194 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3191)
!3195 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3191)
!3196 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3191)
!3197 = !DILocation(line: 143, column: 8, scope: !3146)
!3198 = !DILocation(line: 144, column: 17, scope: !3146)
!3199 = !DILocation(line: 144, column: 23, scope: !3146)
!3200 = !DILocation(line: 0, scope: !3006, inlinedAt: !3201)
!3201 = distinct !DILocation(line: 144, column: 11, scope: !3146)
!3202 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3201)
!3203 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3201)
!3204 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3201)
!3205 = !DILocation(line: 0, scope: !1199, inlinedAt: !3206)
!3206 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3201)
!3207 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3206)
!3208 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3206)
!3209 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3206)
!3210 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3206)
!3211 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3206)
!3212 = !DILocation(line: 144, column: 3, scope: !3146)
!3213 = !DILocation(line: 144, column: 9, scope: !3146)
!3214 = !DILocation(line: 145, column: 17, scope: !3146)
!3215 = !DILocation(line: 145, column: 23, scope: !3146)
!3216 = !DILocation(line: 0, scope: !3006, inlinedAt: !3217)
!3217 = distinct !DILocation(line: 145, column: 11, scope: !3146)
!3218 = !DILocation(line: 69, column: 28, scope: !3006, inlinedAt: !3217)
!3219 = !DILocation(line: 69, column: 39, scope: !3006, inlinedAt: !3217)
!3220 = !DILocation(line: 69, column: 38, scope: !3006, inlinedAt: !3217)
!3221 = !DILocation(line: 0, scope: !1199, inlinedAt: !3222)
!3222 = distinct !DILocation(line: 69, column: 10, scope: !3006, inlinedAt: !3217)
!3223 = !DILocation(line: 21, column: 12, scope: !1199, inlinedAt: !3222)
!3224 = !DILocation(line: 21, column: 22, scope: !1199, inlinedAt: !3222)
!3225 = !DILocation(line: 21, column: 10, scope: !1199, inlinedAt: !3222)
!3226 = !DILocation(line: 21, column: 32, scope: !1199, inlinedAt: !3222)
!3227 = !DILocation(line: 21, column: 7, scope: !1199, inlinedAt: !3222)
!3228 = !DILocation(line: 145, column: 3, scope: !3146)
!3229 = !DILocation(line: 145, column: 8, scope: !3146)
!3230 = !DILocation(line: 146, column: 1, scope: !3146)
!3231 = !DILocation(line: 0, scope: !947)
!3232 = !DILocation(line: 115, column: 3, scope: !947)
!3233 = !DILocation(line: 119, column: 1, scope: !947)
!3234 = distinct !DISubprogram(name: "cbd3", scope: !948, file: !948, line: 89, type: !949, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3235 = !DILocalVariable(name: "r", arg: 1, scope: !3234, file: !948, line: 89, type: !951)
!3236 = !DILocation(line: 0, scope: !3234)
!3237 = !DILocalVariable(name: "buf", arg: 2, scope: !3234, file: !948, line: 89, type: !160)
!3238 = !DILocalVariable(name: "i", scope: !3234, file: !948, line: 91, type: !40)
!3239 = !DILocation(line: 95, column: 7, scope: !3240)
!3240 = distinct !DILexicalBlock(scope: !3234, file: !948, line: 95, column: 3)
!3241 = !DILocation(line: 95, scope: !3240)
!3242 = !DILocation(line: 95, column: 12, scope: !3243)
!3243 = distinct !DILexicalBlock(scope: !3240, file: !948, line: 95, column: 3)
!3244 = !DILocation(line: 95, column: 3, scope: !3240)
!3245 = !DILocation(line: 96, column: 35, scope: !3246)
!3246 = distinct !DILexicalBlock(scope: !3243, file: !948, line: 95, column: 28)
!3247 = !DILocation(line: 96, column: 33, scope: !3246)
!3248 = !DILocalVariable(name: "x", arg: 1, scope: !3249, file: !948, line: 37, type: !160)
!3249 = distinct !DISubprogram(name: "load24_littleendian", scope: !948, file: !948, line: 37, type: !3250, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3250 = !DISubroutineType(types: !3251)
!3251 = !{!91, !160}
!3252 = !DILocation(line: 0, scope: !3249, inlinedAt: !3253)
!3253 = distinct !DILocation(line: 96, column: 10, scope: !3246)
!3254 = !DILocation(line: 40, column: 18, scope: !3249, inlinedAt: !3253)
!3255 = !DILocation(line: 40, column: 8, scope: !3249, inlinedAt: !3253)
!3256 = !DILocalVariable(name: "r", scope: !3249, file: !948, line: 39, type: !91)
!3257 = !DILocation(line: 41, column: 18, scope: !3249, inlinedAt: !3253)
!3258 = !DILocation(line: 41, column: 8, scope: !3249, inlinedAt: !3253)
!3259 = !DILocation(line: 41, column: 23, scope: !3249, inlinedAt: !3253)
!3260 = !DILocation(line: 41, column: 5, scope: !3249, inlinedAt: !3253)
!3261 = !DILocation(line: 42, column: 18, scope: !3249, inlinedAt: !3253)
!3262 = !DILocation(line: 42, column: 8, scope: !3249, inlinedAt: !3253)
!3263 = !DILocation(line: 42, column: 23, scope: !3249, inlinedAt: !3253)
!3264 = !DILocation(line: 42, column: 5, scope: !3249, inlinedAt: !3253)
!3265 = !DILocalVariable(name: "t", scope: !3234, file: !948, line: 92, type: !91)
!3266 = !DILocation(line: 97, column: 12, scope: !3246)
!3267 = !DILocalVariable(name: "d", scope: !3234, file: !948, line: 92, type: !91)
!3268 = !DILocation(line: 98, column: 12, scope: !3246)
!3269 = !DILocation(line: 98, column: 17, scope: !3246)
!3270 = !DILocation(line: 98, column: 7, scope: !3246)
!3271 = !DILocation(line: 99, column: 12, scope: !3246)
!3272 = !DILocation(line: 99, column: 17, scope: !3246)
!3273 = !DILocation(line: 99, column: 7, scope: !3246)
!3274 = !DILocalVariable(name: "j", scope: !3234, file: !948, line: 91, type: !40)
!3275 = !DILocation(line: 101, column: 9, scope: !3276)
!3276 = distinct !DILexicalBlock(scope: !3246, file: !948, line: 101, column: 5)
!3277 = !DILocation(line: 101, scope: !3276)
!3278 = !DILocation(line: 101, column: 14, scope: !3279)
!3279 = distinct !DILexicalBlock(scope: !3276, file: !948, line: 101, column: 5)
!3280 = !DILocation(line: 101, column: 5, scope: !3276)
!3281 = !DILocation(line: 102, column: 19, scope: !3282)
!3282 = distinct !DILexicalBlock(scope: !3279, file: !948, line: 101, column: 22)
!3283 = !DILocation(line: 102, column: 14, scope: !3282)
!3284 = !DILocation(line: 102, column: 11, scope: !3282)
!3285 = !DILocalVariable(name: "a", scope: !3234, file: !948, line: 93, type: !61)
!3286 = !DILocation(line: 103, column: 19, scope: !3282)
!3287 = !DILocation(line: 103, column: 21, scope: !3282)
!3288 = !DILocation(line: 103, column: 14, scope: !3282)
!3289 = !DILocation(line: 103, column: 11, scope: !3282)
!3290 = !DILocalVariable(name: "b", scope: !3234, file: !948, line: 93, type: !61)
!3291 = !DILocation(line: 104, column: 28, scope: !3282)
!3292 = !DILocation(line: 104, column: 26, scope: !3282)
!3293 = !DILocation(line: 104, column: 18, scope: !3282)
!3294 = !DILocation(line: 104, column: 20, scope: !3282)
!3295 = !DILocation(line: 104, column: 7, scope: !3282)
!3296 = !DILocation(line: 104, column: 24, scope: !3282)
!3297 = !DILocation(line: 101, column: 18, scope: !3279)
!3298 = !DILocation(line: 101, column: 5, scope: !3279)
!3299 = distinct !{!3299, !3280, !3300, !258}
!3300 = !DILocation(line: 105, column: 5, scope: !3276)
!3301 = !DILocation(line: 95, column: 24, scope: !3243)
!3302 = !DILocation(line: 95, column: 3, scope: !3243)
!3303 = distinct !{!3303, !3244, !3304, !258}
!3304 = !DILocation(line: 106, column: 3, scope: !3240)
!3305 = !DILocation(line: 107, column: 1, scope: !3234)
!3306 = !DILocation(line: 0, scope: !1613)
!3307 = !DILocation(line: 124, column: 3, scope: !1613)
!3308 = !DILocation(line: 128, column: 1, scope: !1613)
!3309 = distinct !DISubprogram(name: "cbd2", scope: !948, file: !948, line: 58, type: !949, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3310 = !DILocalVariable(name: "r", arg: 1, scope: !3309, file: !948, line: 58, type: !951)
!3311 = !DILocation(line: 0, scope: !3309)
!3312 = !DILocalVariable(name: "buf", arg: 2, scope: !3309, file: !948, line: 58, type: !160)
!3313 = !DILocalVariable(name: "i", scope: !3309, file: !948, line: 60, type: !40)
!3314 = !DILocation(line: 64, column: 7, scope: !3315)
!3315 = distinct !DILexicalBlock(scope: !3309, file: !948, line: 64, column: 3)
!3316 = !DILocation(line: 64, scope: !3315)
!3317 = !DILocation(line: 64, column: 12, scope: !3318)
!3318 = distinct !DILexicalBlock(scope: !3315, file: !948, line: 64, column: 3)
!3319 = !DILocation(line: 64, column: 3, scope: !3315)
!3320 = !DILocation(line: 65, column: 35, scope: !3321)
!3321 = distinct !DILexicalBlock(scope: !3318, file: !948, line: 64, column: 28)
!3322 = !DILocation(line: 65, column: 33, scope: !3321)
!3323 = !DILocalVariable(name: "x", arg: 1, scope: !3324, file: !948, line: 15, type: !160)
!3324 = distinct !DISubprogram(name: "load32_littleendian", scope: !948, file: !948, line: 15, type: !3250, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3325 = !DILocation(line: 0, scope: !3324, inlinedAt: !3326)
!3326 = distinct !DILocation(line: 65, column: 10, scope: !3321)
!3327 = !DILocation(line: 18, column: 18, scope: !3324, inlinedAt: !3326)
!3328 = !DILocation(line: 18, column: 8, scope: !3324, inlinedAt: !3326)
!3329 = !DILocalVariable(name: "r", scope: !3324, file: !948, line: 17, type: !91)
!3330 = !DILocation(line: 19, column: 18, scope: !3324, inlinedAt: !3326)
!3331 = !DILocation(line: 19, column: 8, scope: !3324, inlinedAt: !3326)
!3332 = !DILocation(line: 19, column: 23, scope: !3324, inlinedAt: !3326)
!3333 = !DILocation(line: 19, column: 5, scope: !3324, inlinedAt: !3326)
!3334 = !DILocation(line: 20, column: 18, scope: !3324, inlinedAt: !3326)
!3335 = !DILocation(line: 20, column: 8, scope: !3324, inlinedAt: !3326)
!3336 = !DILocation(line: 20, column: 23, scope: !3324, inlinedAt: !3326)
!3337 = !DILocation(line: 20, column: 5, scope: !3324, inlinedAt: !3326)
!3338 = !DILocation(line: 21, column: 18, scope: !3324, inlinedAt: !3326)
!3339 = !DILocation(line: 21, column: 8, scope: !3324, inlinedAt: !3326)
!3340 = !DILocation(line: 21, column: 23, scope: !3324, inlinedAt: !3326)
!3341 = !DILocation(line: 21, column: 5, scope: !3324, inlinedAt: !3326)
!3342 = !DILocalVariable(name: "t", scope: !3309, file: !948, line: 61, type: !91)
!3343 = !DILocation(line: 66, column: 12, scope: !3321)
!3344 = !DILocalVariable(name: "d", scope: !3309, file: !948, line: 61, type: !91)
!3345 = !DILocation(line: 67, column: 12, scope: !3321)
!3346 = !DILocation(line: 67, column: 17, scope: !3321)
!3347 = !DILocation(line: 67, column: 7, scope: !3321)
!3348 = !DILocalVariable(name: "j", scope: !3309, file: !948, line: 60, type: !40)
!3349 = !DILocation(line: 69, column: 9, scope: !3350)
!3350 = distinct !DILexicalBlock(scope: !3321, file: !948, line: 69, column: 5)
!3351 = !DILocation(line: 69, scope: !3350)
!3352 = !DILocation(line: 69, column: 14, scope: !3353)
!3353 = distinct !DILexicalBlock(scope: !3350, file: !948, line: 69, column: 5)
!3354 = !DILocation(line: 69, column: 5, scope: !3350)
!3355 = !DILocation(line: 70, column: 19, scope: !3356)
!3356 = distinct !DILexicalBlock(scope: !3353, file: !948, line: 69, column: 22)
!3357 = !DILocation(line: 70, column: 14, scope: !3356)
!3358 = !DILocation(line: 70, column: 11, scope: !3356)
!3359 = !DILocalVariable(name: "a", scope: !3309, file: !948, line: 62, type: !61)
!3360 = !DILocation(line: 71, column: 19, scope: !3356)
!3361 = !DILocation(line: 71, column: 21, scope: !3356)
!3362 = !DILocation(line: 71, column: 14, scope: !3356)
!3363 = !DILocation(line: 71, column: 11, scope: !3356)
!3364 = !DILocalVariable(name: "b", scope: !3309, file: !948, line: 62, type: !61)
!3365 = !DILocation(line: 72, column: 28, scope: !3356)
!3366 = !DILocation(line: 72, column: 26, scope: !3356)
!3367 = !DILocation(line: 72, column: 18, scope: !3356)
!3368 = !DILocation(line: 72, column: 20, scope: !3356)
!3369 = !DILocation(line: 72, column: 7, scope: !3356)
!3370 = !DILocation(line: 72, column: 24, scope: !3356)
!3371 = !DILocation(line: 69, column: 18, scope: !3353)
!3372 = !DILocation(line: 69, column: 5, scope: !3353)
!3373 = distinct !{!3373, !3354, !3374, !258}
!3374 = !DILocation(line: 73, column: 5, scope: !3350)
!3375 = !DILocation(line: 64, column: 24, scope: !3318)
!3376 = !DILocation(line: 64, column: 3, scope: !3318)
!3377 = distinct !{!3377, !3319, !3378, !258}
!3378 = !DILocation(line: 74, column: 3, scope: !3315)
!3379 = !DILocation(line: 75, column: 1, scope: !3309)
!3380 = !DILocation(line: 0, scope: !1199)
!3381 = !DILocation(line: 21, column: 12, scope: !1199)
!3382 = !DILocation(line: 21, column: 22, scope: !1199)
!3383 = !DILocation(line: 21, column: 10, scope: !1199)
!3384 = !DILocation(line: 21, column: 32, scope: !1199)
!3385 = !DILocation(line: 21, column: 7, scope: !1199)
!3386 = !DILocation(line: 22, column: 3, scope: !1199)
!3387 = !DILocation(line: 0, scope: !1111)
!3388 = !DILocation(line: 39, column: 20, scope: !1111)
!3389 = !DILocation(line: 39, column: 19, scope: !1111)
!3390 = !DILocation(line: 39, column: 22, scope: !1111)
!3391 = !DILocation(line: 39, column: 33, scope: !1111)
!3392 = !DILocation(line: 41, column: 10, scope: !1111)
!3393 = !DILocation(line: 41, column: 3, scope: !1111)
!3394 = !DILocation(line: 0, scope: !417)
!3395 = !DILocation(line: 21, column: 7, scope: !428)
!3396 = !DILocation(line: 21, scope: !428)
!3397 = !DILocation(line: 21, column: 12, scope: !431)
!3398 = !DILocation(line: 21, column: 3, scope: !428)
!3399 = !DILocation(line: 22, column: 10, scope: !431)
!3400 = !DILocation(line: 22, column: 17, scope: !431)
!3401 = !DILocation(line: 22, column: 15, scope: !431)
!3402 = !DILocation(line: 22, column: 7, scope: !431)
!3403 = !DILocation(line: 21, column: 18, scope: !431)
!3404 = !DILocation(line: 21, column: 3, scope: !431)
!3405 = distinct !{!3405, !3398, !3406, !258}
!3406 = !DILocation(line: 22, column: 20, scope: !428)
!3407 = !DILocation(line: 24, column: 25, scope: !417)
!3408 = !DILocation(line: 24, column: 10, scope: !417)
!3409 = !DILocation(line: 24, column: 3, scope: !417)
!3410 = !DILocation(line: 0, scope: !446)
!3411 = !DILocation(line: 51, column: 3, scope: !446)
!3412 = !DILocation(line: 54, column: 7, scope: !446)
!3413 = !DILocation(line: 55, column: 7, scope: !459)
!3414 = !DILocation(line: 55, scope: !459)
!3415 = !DILocation(line: 55, column: 12, scope: !462)
!3416 = !DILocation(line: 55, column: 3, scope: !459)
!3417 = !DILocation(line: 56, column: 18, scope: !462)
!3418 = !DILocation(line: 56, column: 25, scope: !462)
!3419 = !DILocation(line: 56, column: 23, scope: !462)
!3420 = !DILocation(line: 56, column: 15, scope: !462)
!3421 = !DILocation(line: 56, column: 5, scope: !462)
!3422 = !DILocation(line: 56, column: 10, scope: !462)
!3423 = !DILocation(line: 55, column: 18, scope: !462)
!3424 = !DILocation(line: 55, column: 3, scope: !462)
!3425 = distinct !{!3425, !3416, !3426, !258}
!3426 = !DILocation(line: 56, column: 29, scope: !459)
!3427 = !DILocation(line: 57, column: 1, scope: !446)
!3428 = !DILocation(line: 0, scope: !1423)
!3429 = !DILocation(line: 73, column: 7, scope: !1423)
!3430 = !DILocation(line: 74, column: 15, scope: !1423)
!3431 = !DILocation(line: 74, column: 19, scope: !1423)
!3432 = !DILocation(line: 74, column: 11, scope: !1423)
!3433 = !DILocation(line: 74, column: 6, scope: !1423)
!3434 = !DILocation(line: 75, column: 1, scope: !1423)
!3435 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !3436, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3436 = !DISubroutineType(types: !3437)
!3437 = !{null, !566}
!3438 = !DILocalVariable(name: "state", arg: 1, scope: !3435, file: !74, line: 523, type: !566)
!3439 = !DILocation(line: 0, scope: !3435)
!3440 = !DILocalVariable(name: "s", arg: 1, scope: !3441, file: !74, line: 353, type: !607)
!3441 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !3442, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3442 = !DISubroutineType(types: !3443)
!3443 = !{null, !607}
!3444 = !DILocation(line: 0, scope: !3441, inlinedAt: !3445)
!3445 = distinct !DILocation(line: 525, column: 3, scope: !3435)
!3446 = !DILocalVariable(name: "i", scope: !3441, file: !74, line: 355, type: !40)
!3447 = !DILocation(line: 356, column: 7, scope: !3448, inlinedAt: !3445)
!3448 = distinct !DILexicalBlock(scope: !3441, file: !74, line: 356, column: 3)
!3449 = !DILocation(line: 356, scope: !3448, inlinedAt: !3445)
!3450 = !DILocation(line: 356, column: 12, scope: !3451, inlinedAt: !3445)
!3451 = distinct !DILexicalBlock(scope: !3448, file: !74, line: 356, column: 3)
!3452 = !DILocation(line: 356, column: 3, scope: !3448, inlinedAt: !3445)
!3453 = !DILocation(line: 357, column: 5, scope: !3451, inlinedAt: !3445)
!3454 = !DILocation(line: 357, column: 10, scope: !3451, inlinedAt: !3445)
!3455 = !DILocation(line: 356, column: 17, scope: !3451, inlinedAt: !3445)
!3456 = !DILocation(line: 356, column: 3, scope: !3451, inlinedAt: !3445)
!3457 = distinct !{!3457, !3452, !3458, !258}
!3458 = !DILocation(line: 357, column: 12, scope: !3448, inlinedAt: !3445)
!3459 = !DILocation(line: 526, column: 10, scope: !3435)
!3460 = !DILocation(line: 526, column: 14, scope: !3435)
!3461 = !DILocation(line: 527, column: 1, scope: !3435)
!3462 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !564, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3463 = !DILocalVariable(name: "state", arg: 1, scope: !3462, file: !74, line: 538, type: !566)
!3464 = !DILocation(line: 0, scope: !3462)
!3465 = !DILocalVariable(name: "in", arg: 2, scope: !3462, file: !74, line: 538, type: !160)
!3466 = !DILocalVariable(name: "inlen", arg: 3, scope: !3462, file: !74, line: 538, type: !38)
!3467 = !DILocation(line: 540, column: 47, scope: !3462)
!3468 = !DILocation(line: 540, column: 16, scope: !3462)
!3469 = !DILocation(line: 540, column: 10, scope: !3462)
!3470 = !DILocation(line: 540, column: 14, scope: !3462)
!3471 = !DILocation(line: 541, column: 1, scope: !3462)
!3472 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !3473, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3473 = !DISubroutineType(types: !3474)
!3474 = !{!40, !607, !40, !40, !160, !38}
!3475 = !DILocalVariable(name: "s", arg: 1, scope: !3472, file: !74, line: 373, type: !607)
!3476 = !DILocation(line: 0, scope: !3472)
!3477 = !DILocalVariable(name: "pos", arg: 2, scope: !3472, file: !74, line: 374, type: !40)
!3478 = !DILocalVariable(name: "r", arg: 3, scope: !3472, file: !74, line: 375, type: !40)
!3479 = !DILocalVariable(name: "in", arg: 4, scope: !3472, file: !74, line: 376, type: !160)
!3480 = !DILocalVariable(name: "inlen", arg: 5, scope: !3472, file: !74, line: 377, type: !38)
!3481 = !DILocation(line: 381, column: 3, scope: !3472)
!3482 = !DILocation(line: 381, column: 12, scope: !3472)
!3483 = !DILocation(line: 381, column: 19, scope: !3472)
!3484 = !DILocation(line: 382, column: 5, scope: !3485)
!3485 = distinct !DILexicalBlock(scope: !3486, file: !74, line: 382, column: 5)
!3486 = distinct !DILexicalBlock(scope: !3472, file: !74, line: 381, column: 25)
!3487 = !DILocation(line: 389, column: 3, scope: !3488)
!3488 = distinct !DILexicalBlock(scope: !3472, file: !74, line: 389, column: 3)
!3489 = !DILocation(line: 382, scope: !3485)
!3490 = !DILocalVariable(name: "i", scope: !3472, file: !74, line: 379, type: !40)
!3491 = !DILocation(line: 382, column: 16, scope: !3492)
!3492 = distinct !DILexicalBlock(scope: !3485, file: !74, line: 382, column: 5)
!3493 = !DILocation(line: 383, column: 27, scope: !3492)
!3494 = !DILocation(line: 383, column: 17, scope: !3492)
!3495 = !DILocation(line: 383, column: 37, scope: !3492)
!3496 = !DILocation(line: 383, column: 33, scope: !3492)
!3497 = !DILocation(line: 383, column: 10, scope: !3492)
!3498 = !DILocation(line: 383, column: 7, scope: !3492)
!3499 = !DILocation(line: 383, column: 14, scope: !3492)
!3500 = !DILocation(line: 383, column: 30, scope: !3492)
!3501 = !DILocation(line: 382, column: 20, scope: !3492)
!3502 = !DILocation(line: 382, column: 5, scope: !3492)
!3503 = distinct !{!3503, !3484, !3504, !258}
!3504 = !DILocation(line: 383, column: 42, scope: !3485)
!3505 = !DILocation(line: 384, column: 15, scope: !3486)
!3506 = !DILocation(line: 384, column: 11, scope: !3486)
!3507 = !DILocation(line: 385, column: 5, scope: !3486)
!3508 = distinct !{!3508, !3481, !3509, !258}
!3509 = !DILocation(line: 387, column: 3, scope: !3472)
!3510 = !DILocation(line: 389, scope: !3488)
!3511 = !DILocation(line: 389, column: 18, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3488, file: !74, line: 389, column: 3)
!3513 = !DILocation(line: 389, column: 14, scope: !3512)
!3514 = !DILocation(line: 390, column: 25, scope: !3512)
!3515 = !DILocation(line: 390, column: 15, scope: !3512)
!3516 = !DILocation(line: 390, column: 35, scope: !3512)
!3517 = !DILocation(line: 390, column: 31, scope: !3512)
!3518 = !DILocation(line: 390, column: 8, scope: !3512)
!3519 = !DILocation(line: 390, column: 5, scope: !3512)
!3520 = !DILocation(line: 390, column: 12, scope: !3512)
!3521 = !DILocation(line: 390, column: 28, scope: !3512)
!3522 = !DILocation(line: 389, column: 26, scope: !3512)
!3523 = !DILocation(line: 389, column: 3, scope: !3512)
!3524 = distinct !{!3524, !3487, !3525, !258}
!3525 = !DILocation(line: 390, column: 40, scope: !3488)
!3526 = !DILocation(line: 392, column: 3, scope: !3472)
!3527 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !3442, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3528 = !DILocalVariable(name: "state", arg: 1, scope: !3527, file: !74, line: 82, type: !607)
!3529 = !DILocation(line: 0, scope: !3527)
!3530 = !DILocation(line: 100, column: 15, scope: !3527)
!3531 = !DILocalVariable(name: "Aba", scope: !3527, file: !74, line: 86, type: !70)
!3532 = !DILocation(line: 101, column: 15, scope: !3527)
!3533 = !DILocalVariable(name: "Abe", scope: !3527, file: !74, line: 86, type: !70)
!3534 = !DILocation(line: 102, column: 15, scope: !3527)
!3535 = !DILocalVariable(name: "Abi", scope: !3527, file: !74, line: 86, type: !70)
!3536 = !DILocation(line: 103, column: 15, scope: !3527)
!3537 = !DILocalVariable(name: "Abo", scope: !3527, file: !74, line: 86, type: !70)
!3538 = !DILocation(line: 104, column: 15, scope: !3527)
!3539 = !DILocalVariable(name: "Abu", scope: !3527, file: !74, line: 86, type: !70)
!3540 = !DILocation(line: 105, column: 15, scope: !3527)
!3541 = !DILocalVariable(name: "Aga", scope: !3527, file: !74, line: 87, type: !70)
!3542 = !DILocation(line: 106, column: 15, scope: !3527)
!3543 = !DILocalVariable(name: "Age", scope: !3527, file: !74, line: 87, type: !70)
!3544 = !DILocation(line: 107, column: 15, scope: !3527)
!3545 = !DILocalVariable(name: "Agi", scope: !3527, file: !74, line: 87, type: !70)
!3546 = !DILocation(line: 108, column: 15, scope: !3527)
!3547 = !DILocalVariable(name: "Ago", scope: !3527, file: !74, line: 87, type: !70)
!3548 = !DILocation(line: 109, column: 15, scope: !3527)
!3549 = !DILocalVariable(name: "Agu", scope: !3527, file: !74, line: 87, type: !70)
!3550 = !DILocation(line: 110, column: 15, scope: !3527)
!3551 = !DILocalVariable(name: "Aka", scope: !3527, file: !74, line: 88, type: !70)
!3552 = !DILocation(line: 111, column: 15, scope: !3527)
!3553 = !DILocalVariable(name: "Ake", scope: !3527, file: !74, line: 88, type: !70)
!3554 = !DILocation(line: 112, column: 15, scope: !3527)
!3555 = !DILocalVariable(name: "Aki", scope: !3527, file: !74, line: 88, type: !70)
!3556 = !DILocation(line: 113, column: 15, scope: !3527)
!3557 = !DILocalVariable(name: "Ako", scope: !3527, file: !74, line: 88, type: !70)
!3558 = !DILocation(line: 114, column: 15, scope: !3527)
!3559 = !DILocalVariable(name: "Aku", scope: !3527, file: !74, line: 88, type: !70)
!3560 = !DILocation(line: 115, column: 15, scope: !3527)
!3561 = !DILocalVariable(name: "Ama", scope: !3527, file: !74, line: 89, type: !70)
!3562 = !DILocation(line: 116, column: 15, scope: !3527)
!3563 = !DILocalVariable(name: "Ame", scope: !3527, file: !74, line: 89, type: !70)
!3564 = !DILocation(line: 117, column: 15, scope: !3527)
!3565 = !DILocalVariable(name: "Ami", scope: !3527, file: !74, line: 89, type: !70)
!3566 = !DILocation(line: 118, column: 15, scope: !3527)
!3567 = !DILocalVariable(name: "Amo", scope: !3527, file: !74, line: 89, type: !70)
!3568 = !DILocation(line: 119, column: 15, scope: !3527)
!3569 = !DILocalVariable(name: "Amu", scope: !3527, file: !74, line: 89, type: !70)
!3570 = !DILocation(line: 120, column: 15, scope: !3527)
!3571 = !DILocalVariable(name: "Asa", scope: !3527, file: !74, line: 90, type: !70)
!3572 = !DILocation(line: 121, column: 15, scope: !3527)
!3573 = !DILocalVariable(name: "Ase", scope: !3527, file: !74, line: 90, type: !70)
!3574 = !DILocation(line: 122, column: 15, scope: !3527)
!3575 = !DILocalVariable(name: "Asi", scope: !3527, file: !74, line: 90, type: !70)
!3576 = !DILocation(line: 123, column: 15, scope: !3527)
!3577 = !DILocalVariable(name: "Aso", scope: !3527, file: !74, line: 90, type: !70)
!3578 = !DILocation(line: 124, column: 15, scope: !3527)
!3579 = !DILocalVariable(name: "Asu", scope: !3527, file: !74, line: 90, type: !70)
!3580 = !DILocalVariable(name: "round", scope: !3527, file: !74, line: 84, type: !50)
!3581 = !DILocation(line: 126, column: 13, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3527, file: !74, line: 126, column: 9)
!3583 = !DILocation(line: 126, scope: !3582)
!3584 = !DILocation(line: 126, column: 30, scope: !3585)
!3585 = distinct !DILexicalBlock(scope: !3582, file: !74, line: 126, column: 9)
!3586 = !DILocation(line: 126, column: 9, scope: !3582)
!3587 = !DILocalVariable(name: "BCa", scope: !3527, file: !74, line: 91, type: !70)
!3588 = !DILocalVariable(name: "BCe", scope: !3527, file: !74, line: 91, type: !70)
!3589 = !DILocalVariable(name: "BCi", scope: !3527, file: !74, line: 91, type: !70)
!3590 = !DILocalVariable(name: "BCo", scope: !3527, file: !74, line: 91, type: !70)
!3591 = !DILocalVariable(name: "BCu", scope: !3527, file: !74, line: 91, type: !70)
!3592 = !DILocalVariable(name: "Da", scope: !3527, file: !74, line: 92, type: !70)
!3593 = !DILocalVariable(name: "De", scope: !3527, file: !74, line: 92, type: !70)
!3594 = !DILocalVariable(name: "Di", scope: !3527, file: !74, line: 92, type: !70)
!3595 = !DILocalVariable(name: "Do", scope: !3527, file: !74, line: 92, type: !70)
!3596 = !DILocalVariable(name: "Du", scope: !3527, file: !74, line: 92, type: !70)
!3597 = !DILocalVariable(name: "Eba", scope: !3527, file: !74, line: 93, type: !70)
!3598 = !DILocalVariable(name: "Ebe", scope: !3527, file: !74, line: 93, type: !70)
!3599 = !DILocalVariable(name: "Ebi", scope: !3527, file: !74, line: 93, type: !70)
!3600 = !DILocalVariable(name: "Ebo", scope: !3527, file: !74, line: 93, type: !70)
!3601 = !DILocalVariable(name: "Ebu", scope: !3527, file: !74, line: 93, type: !70)
!3602 = !DILocalVariable(name: "Ega", scope: !3527, file: !74, line: 94, type: !70)
!3603 = !DILocalVariable(name: "Ege", scope: !3527, file: !74, line: 94, type: !70)
!3604 = !DILocalVariable(name: "Egi", scope: !3527, file: !74, line: 94, type: !70)
!3605 = !DILocalVariable(name: "Ego", scope: !3527, file: !74, line: 94, type: !70)
!3606 = !DILocalVariable(name: "Egu", scope: !3527, file: !74, line: 94, type: !70)
!3607 = !DILocalVariable(name: "Eka", scope: !3527, file: !74, line: 95, type: !70)
!3608 = !DILocalVariable(name: "Eke", scope: !3527, file: !74, line: 95, type: !70)
!3609 = !DILocalVariable(name: "Eki", scope: !3527, file: !74, line: 95, type: !70)
!3610 = !DILocalVariable(name: "Eko", scope: !3527, file: !74, line: 95, type: !70)
!3611 = !DILocalVariable(name: "Eku", scope: !3527, file: !74, line: 95, type: !70)
!3612 = !DILocalVariable(name: "Ema", scope: !3527, file: !74, line: 96, type: !70)
!3613 = !DILocalVariable(name: "Eme", scope: !3527, file: !74, line: 96, type: !70)
!3614 = !DILocalVariable(name: "Emi", scope: !3527, file: !74, line: 96, type: !70)
!3615 = !DILocalVariable(name: "Emo", scope: !3527, file: !74, line: 96, type: !70)
!3616 = !DILocalVariable(name: "Emu", scope: !3527, file: !74, line: 96, type: !70)
!3617 = !DILocalVariable(name: "Esa", scope: !3527, file: !74, line: 97, type: !70)
!3618 = !DILocalVariable(name: "Ese", scope: !3527, file: !74, line: 97, type: !70)
!3619 = !DILocalVariable(name: "Esi", scope: !3527, file: !74, line: 97, type: !70)
!3620 = !DILocalVariable(name: "Eso", scope: !3527, file: !74, line: 97, type: !70)
!3621 = !DILocalVariable(name: "Esu", scope: !3527, file: !74, line: 97, type: !70)
!3622 = !DILocation(line: 130, column: 22, scope: !3623)
!3623 = distinct !DILexicalBlock(scope: !3585, file: !74, line: 126, column: 53)
!3624 = !DILocation(line: 130, column: 26, scope: !3623)
!3625 = !DILocation(line: 130, column: 30, scope: !3623)
!3626 = !DILocation(line: 130, column: 34, scope: !3623)
!3627 = !DILocation(line: 132, column: 22, scope: !3623)
!3628 = !DILocation(line: 132, column: 26, scope: !3623)
!3629 = !DILocation(line: 132, column: 30, scope: !3623)
!3630 = !DILocation(line: 132, column: 34, scope: !3623)
!3631 = !DILocation(line: 138, column: 22, scope: !3623)
!3632 = !DILocation(line: 138, column: 21, scope: !3623)
!3633 = !DILocation(line: 208, column: 17, scope: !3623)
!3634 = !DILocation(line: 209, column: 19, scope: !3623)
!3635 = !DILocation(line: 129, column: 22, scope: !3623)
!3636 = !DILocation(line: 129, column: 26, scope: !3623)
!3637 = !DILocation(line: 129, column: 30, scope: !3623)
!3638 = !DILocation(line: 129, column: 34, scope: !3623)
!3639 = !DILocation(line: 135, column: 22, scope: !3623)
!3640 = !DILocation(line: 135, column: 21, scope: !3623)
!3641 = !DILocation(line: 212, column: 17, scope: !3623)
!3642 = !DILocation(line: 213, column: 19, scope: !3623)
!3643 = !DILocation(line: 131, column: 22, scope: !3623)
!3644 = !DILocation(line: 131, column: 26, scope: !3623)
!3645 = !DILocation(line: 131, column: 30, scope: !3623)
!3646 = !DILocation(line: 131, column: 34, scope: !3623)
!3647 = !DILocation(line: 128, column: 22, scope: !3623)
!3648 = !DILocation(line: 128, column: 26, scope: !3623)
!3649 = !DILocation(line: 128, column: 30, scope: !3623)
!3650 = !DILocation(line: 128, column: 34, scope: !3623)
!3651 = !DILocation(line: 139, column: 22, scope: !3623)
!3652 = !DILocation(line: 139, column: 21, scope: !3623)
!3653 = !DILocation(line: 210, column: 17, scope: !3623)
!3654 = !DILocation(line: 211, column: 19, scope: !3623)
!3655 = !DILocation(line: 217, column: 28, scope: !3623)
!3656 = !DILocation(line: 217, column: 33, scope: !3623)
!3657 = !DILocation(line: 217, column: 25, scope: !3623)
!3658 = !DILocation(line: 137, column: 22, scope: !3623)
!3659 = !DILocation(line: 137, column: 21, scope: !3623)
!3660 = !DILocation(line: 145, column: 17, scope: !3623)
!3661 = !DILocation(line: 146, column: 19, scope: !3623)
!3662 = !DILocation(line: 136, column: 22, scope: !3623)
!3663 = !DILocation(line: 136, column: 21, scope: !3623)
!3664 = !DILocation(line: 143, column: 17, scope: !3623)
!3665 = !DILocation(line: 144, column: 19, scope: !3623)
!3666 = !DILocation(line: 151, column: 28, scope: !3623)
!3667 = !DILocation(line: 151, column: 33, scope: !3623)
!3668 = !DILocation(line: 152, column: 30, scope: !3623)
!3669 = !DILocation(line: 152, column: 17, scope: !3623)
!3670 = !DILocation(line: 141, column: 17, scope: !3623)
!3671 = !DILocation(line: 158, column: 17, scope: !3623)
!3672 = !DILocation(line: 159, column: 19, scope: !3623)
!3673 = !DILocation(line: 162, column: 17, scope: !3623)
!3674 = !DILocation(line: 163, column: 19, scope: !3623)
!3675 = !DILocation(line: 160, column: 17, scope: !3623)
!3676 = !DILocation(line: 161, column: 19, scope: !3623)
!3677 = !DILocation(line: 168, column: 28, scope: !3623)
!3678 = !DILocation(line: 168, column: 33, scope: !3623)
!3679 = !DILocation(line: 168, column: 25, scope: !3623)
!3680 = !DILocation(line: 223, column: 22, scope: !3623)
!3681 = !DILocation(line: 174, column: 17, scope: !3623)
!3682 = !DILocation(line: 175, column: 19, scope: !3623)
!3683 = !DILocation(line: 178, column: 17, scope: !3623)
!3684 = !DILocation(line: 179, column: 19, scope: !3623)
!3685 = !DILocation(line: 176, column: 17, scope: !3623)
!3686 = !DILocation(line: 177, column: 19, scope: !3623)
!3687 = !DILocation(line: 184, column: 28, scope: !3623)
!3688 = !DILocation(line: 184, column: 33, scope: !3623)
!3689 = !DILocation(line: 184, column: 25, scope: !3623)
!3690 = !DILocation(line: 223, column: 26, scope: !3623)
!3691 = !DILocation(line: 190, column: 17, scope: !3623)
!3692 = !DILocation(line: 191, column: 19, scope: !3623)
!3693 = !DILocation(line: 194, column: 17, scope: !3623)
!3694 = !DILocation(line: 195, column: 19, scope: !3623)
!3695 = !DILocation(line: 192, column: 17, scope: !3623)
!3696 = !DILocation(line: 193, column: 19, scope: !3623)
!3697 = !DILocation(line: 200, column: 28, scope: !3623)
!3698 = !DILocation(line: 200, column: 33, scope: !3623)
!3699 = !DILocation(line: 200, column: 25, scope: !3623)
!3700 = !DILocation(line: 223, column: 30, scope: !3623)
!3701 = !DILocation(line: 206, column: 17, scope: !3623)
!3702 = !DILocation(line: 207, column: 19, scope: !3623)
!3703 = !DILocation(line: 216, column: 28, scope: !3623)
!3704 = !DILocation(line: 216, column: 33, scope: !3623)
!3705 = !DILocation(line: 216, column: 25, scope: !3623)
!3706 = !DILocation(line: 223, column: 34, scope: !3623)
!3707 = !DILocation(line: 149, column: 17, scope: !3623)
!3708 = !DILocation(line: 150, column: 19, scope: !3623)
!3709 = !DILocation(line: 147, column: 17, scope: !3623)
!3710 = !DILocation(line: 148, column: 19, scope: !3623)
!3711 = !DILocation(line: 154, column: 28, scope: !3623)
!3712 = !DILocation(line: 154, column: 33, scope: !3623)
!3713 = !DILocation(line: 154, column: 25, scope: !3623)
!3714 = !DILocation(line: 166, column: 17, scope: !3623)
!3715 = !DILocation(line: 167, column: 19, scope: !3623)
!3716 = !DILocation(line: 164, column: 17, scope: !3623)
!3717 = !DILocation(line: 165, column: 19, scope: !3623)
!3718 = !DILocation(line: 170, column: 28, scope: !3623)
!3719 = !DILocation(line: 170, column: 33, scope: !3623)
!3720 = !DILocation(line: 170, column: 25, scope: !3623)
!3721 = !DILocation(line: 225, column: 22, scope: !3623)
!3722 = !DILocation(line: 182, column: 17, scope: !3623)
!3723 = !DILocation(line: 183, column: 19, scope: !3623)
!3724 = !DILocation(line: 180, column: 17, scope: !3623)
!3725 = !DILocation(line: 181, column: 19, scope: !3623)
!3726 = !DILocation(line: 186, column: 28, scope: !3623)
!3727 = !DILocation(line: 186, column: 33, scope: !3623)
!3728 = !DILocation(line: 186, column: 25, scope: !3623)
!3729 = !DILocation(line: 225, column: 26, scope: !3623)
!3730 = !DILocation(line: 198, column: 17, scope: !3623)
!3731 = !DILocation(line: 199, column: 19, scope: !3623)
!3732 = !DILocation(line: 196, column: 17, scope: !3623)
!3733 = !DILocation(line: 197, column: 19, scope: !3623)
!3734 = !DILocation(line: 202, column: 28, scope: !3623)
!3735 = !DILocation(line: 202, column: 33, scope: !3623)
!3736 = !DILocation(line: 202, column: 25, scope: !3623)
!3737 = !DILocation(line: 225, column: 30, scope: !3623)
!3738 = !DILocation(line: 214, column: 17, scope: !3623)
!3739 = !DILocation(line: 215, column: 19, scope: !3623)
!3740 = !DILocation(line: 218, column: 28, scope: !3623)
!3741 = !DILocation(line: 218, column: 33, scope: !3623)
!3742 = !DILocation(line: 218, column: 25, scope: !3623)
!3743 = !DILocation(line: 225, column: 34, scope: !3623)
!3744 = !DILocation(line: 231, column: 22, scope: !3623)
!3745 = !DILocation(line: 231, column: 21, scope: !3623)
!3746 = !DILocation(line: 309, column: 17, scope: !3623)
!3747 = !DILocation(line: 310, column: 19, scope: !3623)
!3748 = !DILocation(line: 171, column: 28, scope: !3623)
!3749 = !DILocation(line: 171, column: 33, scope: !3623)
!3750 = !DILocation(line: 171, column: 25, scope: !3623)
!3751 = !DILocation(line: 156, column: 28, scope: !3623)
!3752 = !DILocation(line: 156, column: 33, scope: !3623)
!3753 = !DILocation(line: 156, column: 25, scope: !3623)
!3754 = !DILocation(line: 172, column: 28, scope: !3623)
!3755 = !DILocation(line: 172, column: 33, scope: !3623)
!3756 = !DILocation(line: 172, column: 25, scope: !3623)
!3757 = !DILocation(line: 227, column: 22, scope: !3623)
!3758 = !DILocation(line: 188, column: 28, scope: !3623)
!3759 = !DILocation(line: 188, column: 33, scope: !3623)
!3760 = !DILocation(line: 188, column: 25, scope: !3623)
!3761 = !DILocation(line: 227, column: 26, scope: !3623)
!3762 = !DILocation(line: 204, column: 28, scope: !3623)
!3763 = !DILocation(line: 204, column: 33, scope: !3623)
!3764 = !DILocation(line: 204, column: 25, scope: !3623)
!3765 = !DILocation(line: 227, column: 30, scope: !3623)
!3766 = !DILocation(line: 220, column: 28, scope: !3623)
!3767 = !DILocation(line: 220, column: 33, scope: !3623)
!3768 = !DILocation(line: 220, column: 25, scope: !3623)
!3769 = !DILocation(line: 227, column: 34, scope: !3623)
!3770 = !DILocation(line: 233, column: 22, scope: !3623)
!3771 = !DILocation(line: 233, column: 21, scope: !3623)
!3772 = !DILocation(line: 303, column: 17, scope: !3623)
!3773 = !DILocation(line: 304, column: 19, scope: !3623)
!3774 = !DILocation(line: 153, column: 28, scope: !3623)
!3775 = !DILocation(line: 153, column: 33, scope: !3623)
!3776 = !DILocation(line: 153, column: 25, scope: !3623)
!3777 = !DILocation(line: 169, column: 28, scope: !3623)
!3778 = !DILocation(line: 169, column: 33, scope: !3623)
!3779 = !DILocation(line: 169, column: 25, scope: !3623)
!3780 = !DILocation(line: 224, column: 22, scope: !3623)
!3781 = !DILocation(line: 185, column: 28, scope: !3623)
!3782 = !DILocation(line: 185, column: 33, scope: !3623)
!3783 = !DILocation(line: 185, column: 25, scope: !3623)
!3784 = !DILocation(line: 224, column: 26, scope: !3623)
!3785 = !DILocation(line: 201, column: 28, scope: !3623)
!3786 = !DILocation(line: 201, column: 33, scope: !3623)
!3787 = !DILocation(line: 201, column: 25, scope: !3623)
!3788 = !DILocation(line: 224, column: 30, scope: !3623)
!3789 = !DILocation(line: 224, column: 34, scope: !3623)
!3790 = !DILocation(line: 155, column: 28, scope: !3623)
!3791 = !DILocation(line: 155, column: 33, scope: !3623)
!3792 = !DILocation(line: 155, column: 25, scope: !3623)
!3793 = !DILocation(line: 226, column: 22, scope: !3623)
!3794 = !DILocation(line: 187, column: 28, scope: !3623)
!3795 = !DILocation(line: 187, column: 33, scope: !3623)
!3796 = !DILocation(line: 187, column: 25, scope: !3623)
!3797 = !DILocation(line: 226, column: 26, scope: !3623)
!3798 = !DILocation(line: 203, column: 28, scope: !3623)
!3799 = !DILocation(line: 203, column: 33, scope: !3623)
!3800 = !DILocation(line: 203, column: 25, scope: !3623)
!3801 = !DILocation(line: 226, column: 30, scope: !3623)
!3802 = !DILocation(line: 219, column: 28, scope: !3623)
!3803 = !DILocation(line: 219, column: 33, scope: !3623)
!3804 = !DILocation(line: 219, column: 25, scope: !3623)
!3805 = !DILocation(line: 226, column: 34, scope: !3623)
!3806 = !DILocation(line: 232, column: 22, scope: !3623)
!3807 = !DILocation(line: 232, column: 21, scope: !3623)
!3808 = !DILocation(line: 301, column: 17, scope: !3623)
!3809 = !DILocation(line: 302, column: 19, scope: !3623)
!3810 = !DILocation(line: 315, column: 28, scope: !3623)
!3811 = !DILocation(line: 315, column: 33, scope: !3623)
!3812 = !DILocation(line: 315, column: 25, scope: !3623)
!3813 = !DILocation(line: 230, column: 22, scope: !3623)
!3814 = !DILocation(line: 230, column: 21, scope: !3623)
!3815 = !DILocation(line: 307, column: 17, scope: !3623)
!3816 = !DILocation(line: 308, column: 19, scope: !3623)
!3817 = !DILocation(line: 314, column: 28, scope: !3623)
!3818 = !DILocation(line: 314, column: 33, scope: !3623)
!3819 = !DILocation(line: 314, column: 25, scope: !3623)
!3820 = !DILocation(line: 234, column: 22, scope: !3623)
!3821 = !DILocation(line: 234, column: 21, scope: !3623)
!3822 = !DILocation(line: 305, column: 17, scope: !3623)
!3823 = !DILocation(line: 306, column: 19, scope: !3623)
!3824 = !DILocation(line: 313, column: 28, scope: !3623)
!3825 = !DILocation(line: 313, column: 33, scope: !3623)
!3826 = !DILocation(line: 313, column: 25, scope: !3623)
!3827 = !DILocation(line: 312, column: 28, scope: !3623)
!3828 = !DILocation(line: 312, column: 33, scope: !3623)
!3829 = !DILocation(line: 312, column: 25, scope: !3623)
!3830 = !DILocation(line: 311, column: 28, scope: !3623)
!3831 = !DILocation(line: 311, column: 33, scope: !3623)
!3832 = !DILocation(line: 311, column: 25, scope: !3623)
!3833 = !DILocation(line: 293, column: 17, scope: !3623)
!3834 = !DILocation(line: 294, column: 19, scope: !3623)
!3835 = !DILocation(line: 287, column: 17, scope: !3623)
!3836 = !DILocation(line: 288, column: 19, scope: !3623)
!3837 = !DILocation(line: 285, column: 17, scope: !3623)
!3838 = !DILocation(line: 286, column: 19, scope: !3623)
!3839 = !DILocation(line: 299, column: 28, scope: !3623)
!3840 = !DILocation(line: 299, column: 33, scope: !3623)
!3841 = !DILocation(line: 299, column: 25, scope: !3623)
!3842 = !DILocation(line: 291, column: 17, scope: !3623)
!3843 = !DILocation(line: 292, column: 19, scope: !3623)
!3844 = !DILocation(line: 298, column: 28, scope: !3623)
!3845 = !DILocation(line: 298, column: 33, scope: !3623)
!3846 = !DILocation(line: 298, column: 25, scope: !3623)
!3847 = !DILocation(line: 289, column: 17, scope: !3623)
!3848 = !DILocation(line: 290, column: 19, scope: !3623)
!3849 = !DILocation(line: 297, column: 28, scope: !3623)
!3850 = !DILocation(line: 297, column: 33, scope: !3623)
!3851 = !DILocation(line: 297, column: 25, scope: !3623)
!3852 = !DILocation(line: 296, column: 28, scope: !3623)
!3853 = !DILocation(line: 296, column: 33, scope: !3623)
!3854 = !DILocation(line: 296, column: 25, scope: !3623)
!3855 = !DILocation(line: 295, column: 28, scope: !3623)
!3856 = !DILocation(line: 295, column: 33, scope: !3623)
!3857 = !DILocation(line: 295, column: 25, scope: !3623)
!3858 = !DILocation(line: 277, column: 17, scope: !3623)
!3859 = !DILocation(line: 278, column: 19, scope: !3623)
!3860 = !DILocation(line: 271, column: 17, scope: !3623)
!3861 = !DILocation(line: 272, column: 19, scope: !3623)
!3862 = !DILocation(line: 269, column: 17, scope: !3623)
!3863 = !DILocation(line: 270, column: 19, scope: !3623)
!3864 = !DILocation(line: 283, column: 28, scope: !3623)
!3865 = !DILocation(line: 283, column: 33, scope: !3623)
!3866 = !DILocation(line: 283, column: 25, scope: !3623)
!3867 = !DILocation(line: 275, column: 17, scope: !3623)
!3868 = !DILocation(line: 276, column: 19, scope: !3623)
!3869 = !DILocation(line: 282, column: 28, scope: !3623)
!3870 = !DILocation(line: 282, column: 33, scope: !3623)
!3871 = !DILocation(line: 282, column: 25, scope: !3623)
!3872 = !DILocation(line: 273, column: 17, scope: !3623)
!3873 = !DILocation(line: 274, column: 19, scope: !3623)
!3874 = !DILocation(line: 281, column: 28, scope: !3623)
!3875 = !DILocation(line: 281, column: 33, scope: !3623)
!3876 = !DILocation(line: 281, column: 25, scope: !3623)
!3877 = !DILocation(line: 280, column: 28, scope: !3623)
!3878 = !DILocation(line: 280, column: 33, scope: !3623)
!3879 = !DILocation(line: 280, column: 25, scope: !3623)
!3880 = !DILocation(line: 279, column: 28, scope: !3623)
!3881 = !DILocation(line: 279, column: 33, scope: !3623)
!3882 = !DILocation(line: 279, column: 25, scope: !3623)
!3883 = !DILocation(line: 261, column: 17, scope: !3623)
!3884 = !DILocation(line: 262, column: 19, scope: !3623)
!3885 = !DILocation(line: 255, column: 17, scope: !3623)
!3886 = !DILocation(line: 256, column: 19, scope: !3623)
!3887 = !DILocation(line: 253, column: 17, scope: !3623)
!3888 = !DILocation(line: 254, column: 19, scope: !3623)
!3889 = !DILocation(line: 267, column: 28, scope: !3623)
!3890 = !DILocation(line: 267, column: 33, scope: !3623)
!3891 = !DILocation(line: 267, column: 25, scope: !3623)
!3892 = !DILocation(line: 259, column: 17, scope: !3623)
!3893 = !DILocation(line: 260, column: 19, scope: !3623)
!3894 = !DILocation(line: 266, column: 28, scope: !3623)
!3895 = !DILocation(line: 266, column: 33, scope: !3623)
!3896 = !DILocation(line: 266, column: 25, scope: !3623)
!3897 = !DILocation(line: 257, column: 17, scope: !3623)
!3898 = !DILocation(line: 258, column: 19, scope: !3623)
!3899 = !DILocation(line: 265, column: 28, scope: !3623)
!3900 = !DILocation(line: 265, column: 33, scope: !3623)
!3901 = !DILocation(line: 265, column: 25, scope: !3623)
!3902 = !DILocation(line: 264, column: 28, scope: !3623)
!3903 = !DILocation(line: 264, column: 33, scope: !3623)
!3904 = !DILocation(line: 264, column: 25, scope: !3623)
!3905 = !DILocation(line: 263, column: 28, scope: !3623)
!3906 = !DILocation(line: 263, column: 33, scope: !3623)
!3907 = !DILocation(line: 263, column: 25, scope: !3623)
!3908 = !DILocation(line: 244, column: 17, scope: !3623)
!3909 = !DILocation(line: 245, column: 19, scope: !3623)
!3910 = !DILocation(line: 238, column: 17, scope: !3623)
!3911 = !DILocation(line: 239, column: 19, scope: !3623)
!3912 = !DILocation(line: 236, column: 17, scope: !3623)
!3913 = !DILocation(line: 251, column: 28, scope: !3623)
!3914 = !DILocation(line: 251, column: 33, scope: !3623)
!3915 = !DILocation(line: 251, column: 25, scope: !3623)
!3916 = !DILocation(line: 242, column: 17, scope: !3623)
!3917 = !DILocation(line: 243, column: 19, scope: !3623)
!3918 = !DILocation(line: 250, column: 28, scope: !3623)
!3919 = !DILocation(line: 250, column: 33, scope: !3623)
!3920 = !DILocation(line: 250, column: 25, scope: !3623)
!3921 = !DILocation(line: 240, column: 17, scope: !3623)
!3922 = !DILocation(line: 241, column: 19, scope: !3623)
!3923 = !DILocation(line: 249, column: 28, scope: !3623)
!3924 = !DILocation(line: 249, column: 33, scope: !3623)
!3925 = !DILocation(line: 249, column: 25, scope: !3623)
!3926 = !DILocation(line: 248, column: 28, scope: !3623)
!3927 = !DILocation(line: 248, column: 33, scope: !3623)
!3928 = !DILocation(line: 248, column: 25, scope: !3623)
!3929 = !DILocation(line: 247, column: 58, scope: !3623)
!3930 = !DILocation(line: 247, column: 30, scope: !3623)
!3931 = !DILocation(line: 246, column: 28, scope: !3623)
!3932 = !DILocation(line: 246, column: 33, scope: !3623)
!3933 = !DILocation(line: 247, column: 17, scope: !3623)
!3934 = !DILocation(line: 126, column: 47, scope: !3585)
!3935 = !DILocation(line: 126, column: 9, scope: !3585)
!3936 = distinct !{!3936, !3586, !3937, !258}
!3937 = !DILocation(line: 316, column: 9, scope: !3582)
!3938 = !DILocation(line: 319, column: 19, scope: !3527)
!3939 = !DILocation(line: 320, column: 9, scope: !3527)
!3940 = !DILocation(line: 320, column: 19, scope: !3527)
!3941 = !DILocation(line: 321, column: 9, scope: !3527)
!3942 = !DILocation(line: 321, column: 19, scope: !3527)
!3943 = !DILocation(line: 322, column: 9, scope: !3527)
!3944 = !DILocation(line: 322, column: 19, scope: !3527)
!3945 = !DILocation(line: 323, column: 9, scope: !3527)
!3946 = !DILocation(line: 323, column: 19, scope: !3527)
!3947 = !DILocation(line: 324, column: 9, scope: !3527)
!3948 = !DILocation(line: 324, column: 19, scope: !3527)
!3949 = !DILocation(line: 325, column: 9, scope: !3527)
!3950 = !DILocation(line: 325, column: 19, scope: !3527)
!3951 = !DILocation(line: 326, column: 9, scope: !3527)
!3952 = !DILocation(line: 326, column: 19, scope: !3527)
!3953 = !DILocation(line: 327, column: 9, scope: !3527)
!3954 = !DILocation(line: 327, column: 19, scope: !3527)
!3955 = !DILocation(line: 328, column: 9, scope: !3527)
!3956 = !DILocation(line: 328, column: 19, scope: !3527)
!3957 = !DILocation(line: 329, column: 9, scope: !3527)
!3958 = !DILocation(line: 329, column: 19, scope: !3527)
!3959 = !DILocation(line: 330, column: 9, scope: !3527)
!3960 = !DILocation(line: 330, column: 19, scope: !3527)
!3961 = !DILocation(line: 331, column: 9, scope: !3527)
!3962 = !DILocation(line: 331, column: 19, scope: !3527)
!3963 = !DILocation(line: 332, column: 9, scope: !3527)
!3964 = !DILocation(line: 332, column: 19, scope: !3527)
!3965 = !DILocation(line: 333, column: 9, scope: !3527)
!3966 = !DILocation(line: 333, column: 19, scope: !3527)
!3967 = !DILocation(line: 334, column: 9, scope: !3527)
!3968 = !DILocation(line: 334, column: 19, scope: !3527)
!3969 = !DILocation(line: 335, column: 9, scope: !3527)
!3970 = !DILocation(line: 335, column: 19, scope: !3527)
!3971 = !DILocation(line: 336, column: 9, scope: !3527)
!3972 = !DILocation(line: 336, column: 19, scope: !3527)
!3973 = !DILocation(line: 337, column: 9, scope: !3527)
!3974 = !DILocation(line: 337, column: 19, scope: !3527)
!3975 = !DILocation(line: 338, column: 9, scope: !3527)
!3976 = !DILocation(line: 338, column: 19, scope: !3527)
!3977 = !DILocation(line: 339, column: 9, scope: !3527)
!3978 = !DILocation(line: 339, column: 19, scope: !3527)
!3979 = !DILocation(line: 340, column: 9, scope: !3527)
!3980 = !DILocation(line: 340, column: 19, scope: !3527)
!3981 = !DILocation(line: 341, column: 9, scope: !3527)
!3982 = !DILocation(line: 341, column: 19, scope: !3527)
!3983 = !DILocation(line: 342, column: 9, scope: !3527)
!3984 = !DILocation(line: 342, column: 19, scope: !3527)
!3985 = !DILocation(line: 343, column: 9, scope: !3527)
!3986 = !DILocation(line: 343, column: 19, scope: !3527)
!3987 = !DILocation(line: 344, column: 1, scope: !3527)
!3988 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !3436, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3989 = !DILocalVariable(name: "state", arg: 1, scope: !3988, file: !74, line: 550, type: !566)
!3990 = !DILocation(line: 0, scope: !3988)
!3991 = !DILocation(line: 552, column: 36, scope: !3988)
!3992 = !DILocalVariable(name: "s", arg: 1, scope: !3993, file: !74, line: 405, type: !607)
!3993 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !3994, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3994 = !DISubroutineType(types: !3995)
!3995 = !{null, !607, !40, !40, !33}
!3996 = !DILocation(line: 0, scope: !3993, inlinedAt: !3997)
!3997 = distinct !DILocation(line: 552, column: 3, scope: !3988)
!3998 = !DILocalVariable(name: "pos", arg: 2, scope: !3993, file: !74, line: 405, type: !40)
!3999 = !DILocalVariable(name: "r", arg: 3, scope: !3993, file: !74, line: 405, type: !40)
!4000 = !DILocalVariable(name: "p", arg: 4, scope: !3993, file: !74, line: 405, type: !33)
!4001 = !DILocation(line: 407, column: 31, scope: !3993, inlinedAt: !3997)
!4002 = !DILocation(line: 407, column: 27, scope: !3993, inlinedAt: !3997)
!4003 = !DILocation(line: 407, column: 8, scope: !3993, inlinedAt: !3997)
!4004 = !DILocation(line: 407, column: 3, scope: !3993, inlinedAt: !3997)
!4005 = !DILocation(line: 407, column: 12, scope: !3993, inlinedAt: !3997)
!4006 = !DILocation(line: 408, column: 3, scope: !3993, inlinedAt: !3997)
!4007 = !DILocation(line: 408, column: 12, scope: !3993, inlinedAt: !3997)
!4008 = !DILocation(line: 553, column: 10, scope: !3988)
!4009 = !DILocation(line: 553, column: 14, scope: !3988)
!4010 = !DILocation(line: 554, column: 1, scope: !3988)
!4011 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !597, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4012 = !DILocalVariable(name: "out", arg: 1, scope: !4011, file: !74, line: 566, type: !32)
!4013 = !DILocation(line: 0, scope: !4011)
!4014 = !DILocalVariable(name: "outlen", arg: 2, scope: !4011, file: !74, line: 566, type: !38)
!4015 = !DILocalVariable(name: "state", arg: 3, scope: !4011, file: !74, line: 566, type: !566)
!4016 = !DILocation(line: 568, column: 61, scope: !4011)
!4017 = !DILocation(line: 0, scope: !903, inlinedAt: !4018)
!4018 = distinct !DILocation(line: 568, column: 16, scope: !4011)
!4019 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !4018)
!4020 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !4018)
!4021 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !4018)
!4022 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !4018)
!4023 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !4018)
!4024 = !DILocation(line: 439, scope: !921, inlinedAt: !4018)
!4025 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !4018)
!4026 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !4018)
!4027 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !4018)
!4028 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !4018)
!4029 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !4018)
!4030 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !4018)
!4031 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !4018)
!4032 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !4018)
!4033 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !4018)
!4034 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !4018)
!4035 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !4018)
!4036 = distinct !{!4036, !4027, !4037, !258}
!4037 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !4018)
!4038 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !4018)
!4039 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !4018)
!4040 = distinct !{!4040, !4019, !4041, !258}
!4041 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !4018)
!4042 = !DILocation(line: 568, column: 10, scope: !4011)
!4043 = !DILocation(line: 568, column: 14, scope: !4011)
!4044 = !DILocation(line: 569, column: 1, scope: !4011)
!4045 = !DILocation(line: 0, scope: !563)
!4046 = !DILocation(line: 582, column: 3, scope: !563)
!4047 = !DILocation(line: 583, column: 10, scope: !563)
!4048 = !DILocation(line: 583, column: 14, scope: !563)
!4049 = !DILocation(line: 584, column: 1, scope: !563)
!4050 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !4051, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4051 = !DISubroutineType(types: !4052)
!4052 = !{null, !607, !40, !160, !38, !33}
!4053 = !DILocalVariable(name: "s", arg: 1, scope: !4050, file: !74, line: 461, type: !607)
!4054 = !DILocation(line: 0, scope: !4050)
!4055 = !DILocalVariable(name: "r", arg: 2, scope: !4050, file: !74, line: 462, type: !40)
!4056 = !DILocalVariable(name: "in", arg: 3, scope: !4050, file: !74, line: 463, type: !160)
!4057 = !DILocalVariable(name: "inlen", arg: 4, scope: !4050, file: !74, line: 464, type: !38)
!4058 = !DILocalVariable(name: "p", arg: 5, scope: !4050, file: !74, line: 465, type: !33)
!4059 = !DILocalVariable(name: "i", scope: !4050, file: !74, line: 467, type: !40)
!4060 = !DILocation(line: 469, column: 7, scope: !4061)
!4061 = distinct !DILexicalBlock(scope: !4050, file: !74, line: 469, column: 3)
!4062 = !DILocation(line: 469, scope: !4061)
!4063 = !DILocation(line: 469, column: 12, scope: !4064)
!4064 = distinct !DILexicalBlock(scope: !4061, file: !74, line: 469, column: 3)
!4065 = !DILocation(line: 469, column: 3, scope: !4061)
!4066 = !DILocation(line: 472, column: 3, scope: !4050)
!4067 = !DILocation(line: 470, column: 5, scope: !4064)
!4068 = !DILocation(line: 470, column: 10, scope: !4064)
!4069 = !DILocation(line: 469, column: 17, scope: !4064)
!4070 = !DILocation(line: 469, column: 3, scope: !4064)
!4071 = distinct !{!4071, !4065, !4072, !258}
!4072 = !DILocation(line: 470, column: 12, scope: !4061)
!4073 = !DILocation(line: 472, column: 15, scope: !4050)
!4074 = !DILocation(line: 473, column: 5, scope: !4075)
!4075 = distinct !DILexicalBlock(scope: !4076, file: !74, line: 473, column: 5)
!4076 = distinct !DILexicalBlock(scope: !4050, file: !74, line: 472, column: 21)
!4077 = !DILocation(line: 480, column: 3, scope: !4078)
!4078 = distinct !DILexicalBlock(scope: !4050, file: !74, line: 480, column: 3)
!4079 = !DILocation(line: 473, scope: !4075)
!4080 = !DILocation(line: 473, column: 14, scope: !4081)
!4081 = distinct !DILexicalBlock(scope: !4075, file: !74, line: 473, column: 5)
!4082 = !DILocation(line: 474, column: 26, scope: !4081)
!4083 = !DILocation(line: 474, column: 24, scope: !4081)
!4084 = !DILocalVariable(name: "x", arg: 1, scope: !4085, file: !74, line: 22, type: !160)
!4085 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !4086, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4086 = !DISubroutineType(types: !4087)
!4087 = !{!70, !160}
!4088 = !DILocation(line: 0, scope: !4085, inlinedAt: !4089)
!4089 = distinct !DILocation(line: 474, column: 15, scope: !4081)
!4090 = !DILocalVariable(name: "r", scope: !4085, file: !74, line: 24, type: !70)
!4091 = !DILocalVariable(name: "i", scope: !4085, file: !74, line: 23, type: !40)
!4092 = !DILocation(line: 26, column: 7, scope: !4093, inlinedAt: !4089)
!4093 = distinct !DILexicalBlock(scope: !4085, file: !74, line: 26, column: 3)
!4094 = !DILocation(line: 26, scope: !4093, inlinedAt: !4089)
!4095 = !DILocation(line: 26, column: 12, scope: !4096, inlinedAt: !4089)
!4096 = distinct !DILexicalBlock(scope: !4093, file: !74, line: 26, column: 3)
!4097 = !DILocation(line: 26, column: 3, scope: !4093, inlinedAt: !4089)
!4098 = !DILocation(line: 27, column: 20, scope: !4096, inlinedAt: !4089)
!4099 = !DILocation(line: 27, column: 10, scope: !4096, inlinedAt: !4089)
!4100 = !DILocation(line: 27, column: 29, scope: !4096, inlinedAt: !4089)
!4101 = !DILocation(line: 27, column: 25, scope: !4096, inlinedAt: !4089)
!4102 = !DILocation(line: 27, column: 7, scope: !4096, inlinedAt: !4089)
!4103 = !DILocation(line: 26, column: 16, scope: !4096, inlinedAt: !4089)
!4104 = !DILocation(line: 26, column: 3, scope: !4096, inlinedAt: !4089)
!4105 = distinct !{!4105, !4097, !4106, !258}
!4106 = !DILocation(line: 27, column: 30, scope: !4093, inlinedAt: !4089)
!4107 = !DILocation(line: 474, column: 7, scope: !4081)
!4108 = !DILocation(line: 474, column: 12, scope: !4081)
!4109 = !DILocation(line: 473, column: 20, scope: !4081)
!4110 = !DILocation(line: 473, column: 5, scope: !4081)
!4111 = distinct !{!4111, !4074, !4112, !258}
!4112 = !DILocation(line: 474, column: 28, scope: !4075)
!4113 = !DILocation(line: 475, column: 8, scope: !4076)
!4114 = !DILocation(line: 476, column: 11, scope: !4076)
!4115 = !DILocation(line: 477, column: 5, scope: !4076)
!4116 = distinct !{!4116, !4066, !4117, !258}
!4117 = !DILocation(line: 478, column: 3, scope: !4050)
!4118 = !DILocation(line: 480, scope: !4078)
!4119 = !DILocation(line: 480, column: 12, scope: !4120)
!4120 = distinct !DILexicalBlock(scope: !4078, file: !74, line: 480, column: 3)
!4121 = !DILocation(line: 481, column: 25, scope: !4120)
!4122 = !DILocation(line: 481, column: 15, scope: !4120)
!4123 = !DILocation(line: 481, column: 35, scope: !4120)
!4124 = !DILocation(line: 481, column: 31, scope: !4120)
!4125 = !DILocation(line: 481, column: 8, scope: !4120)
!4126 = !DILocation(line: 481, column: 5, scope: !4120)
!4127 = !DILocation(line: 481, column: 12, scope: !4120)
!4128 = !DILocation(line: 480, column: 20, scope: !4120)
!4129 = !DILocation(line: 480, column: 3, scope: !4120)
!4130 = distinct !{!4130, !4077, !4131, !258}
!4131 = !DILocation(line: 481, column: 40, scope: !4078)
!4132 = !DILocation(line: 483, column: 13, scope: !4050)
!4133 = !DILocation(line: 483, column: 29, scope: !4050)
!4134 = !DILocation(line: 483, column: 25, scope: !4050)
!4135 = !DILocation(line: 483, column: 6, scope: !4050)
!4136 = !DILocation(line: 483, column: 3, scope: !4050)
!4137 = !DILocation(line: 483, column: 10, scope: !4050)
!4138 = !DILocation(line: 484, column: 7, scope: !4050)
!4139 = !DILocation(line: 484, column: 10, scope: !4050)
!4140 = !DILocation(line: 484, column: 3, scope: !4050)
!4141 = !DILocation(line: 484, column: 14, scope: !4050)
!4142 = !DILocation(line: 485, column: 1, scope: !4050)
!4143 = !DILocation(line: 0, scope: !596)
!4144 = !DILocation(line: 0, scope: !604, inlinedAt: !4145)
!4145 = distinct !DILocation(line: 600, column: 3, scope: !596)
!4146 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4145)
!4147 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4145)
!4148 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4145)
!4149 = !DILocation(line: 509, scope: !618, inlinedAt: !4145)
!4150 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4145)
!4151 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4145)
!4152 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4145)
!4153 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4145)
!4154 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4145)
!4155 = !DILocation(line: 0, scope: !627, inlinedAt: !4156)
!4156 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4145)
!4157 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4156)
!4158 = !DILocation(line: 43, scope: !635, inlinedAt: !4156)
!4159 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4156)
!4160 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4156)
!4161 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4156)
!4162 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4156)
!4163 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4156)
!4164 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4156)
!4165 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4156)
!4166 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4156)
!4167 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4156)
!4168 = distinct !{!4168, !4160, !4169, !258}
!4169 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4156)
!4170 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4145)
!4171 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4145)
!4172 = distinct !{!4172, !4151, !4173, !258}
!4173 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4145)
!4174 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4145)
!4175 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4145)
!4176 = distinct !{!4176, !4146, !4177, !258}
!4177 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4145)
!4178 = !DILocation(line: 601, column: 1, scope: !596)
!4179 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !3436, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4180 = !DILocalVariable(name: "state", arg: 1, scope: !4179, file: !74, line: 610, type: !566)
!4181 = !DILocation(line: 0, scope: !4179)
!4182 = !DILocation(line: 0, scope: !3441, inlinedAt: !4183)
!4183 = distinct !DILocation(line: 612, column: 3, scope: !4179)
!4184 = !DILocation(line: 356, column: 7, scope: !3448, inlinedAt: !4183)
!4185 = !DILocation(line: 356, scope: !3448, inlinedAt: !4183)
!4186 = !DILocation(line: 356, column: 12, scope: !3451, inlinedAt: !4183)
!4187 = !DILocation(line: 356, column: 3, scope: !3448, inlinedAt: !4183)
!4188 = !DILocation(line: 357, column: 5, scope: !3451, inlinedAt: !4183)
!4189 = !DILocation(line: 357, column: 10, scope: !3451, inlinedAt: !4183)
!4190 = !DILocation(line: 356, column: 17, scope: !3451, inlinedAt: !4183)
!4191 = !DILocation(line: 356, column: 3, scope: !3451, inlinedAt: !4183)
!4192 = distinct !{!4192, !4187, !4193, !258}
!4193 = !DILocation(line: 357, column: 12, scope: !3448, inlinedAt: !4183)
!4194 = !DILocation(line: 613, column: 10, scope: !4179)
!4195 = !DILocation(line: 613, column: 14, scope: !4179)
!4196 = !DILocation(line: 614, column: 1, scope: !4179)
!4197 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !564, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4198 = !DILocalVariable(name: "state", arg: 1, scope: !4197, file: !74, line: 625, type: !566)
!4199 = !DILocation(line: 0, scope: !4197)
!4200 = !DILocalVariable(name: "in", arg: 2, scope: !4197, file: !74, line: 625, type: !160)
!4201 = !DILocalVariable(name: "inlen", arg: 3, scope: !4197, file: !74, line: 625, type: !38)
!4202 = !DILocation(line: 627, column: 47, scope: !4197)
!4203 = !DILocation(line: 627, column: 16, scope: !4197)
!4204 = !DILocation(line: 627, column: 10, scope: !4197)
!4205 = !DILocation(line: 627, column: 14, scope: !4197)
!4206 = !DILocation(line: 628, column: 1, scope: !4197)
!4207 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !3436, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4208 = !DILocalVariable(name: "state", arg: 1, scope: !4207, file: !74, line: 637, type: !566)
!4209 = !DILocation(line: 0, scope: !4207)
!4210 = !DILocation(line: 639, column: 36, scope: !4207)
!4211 = !DILocation(line: 0, scope: !3993, inlinedAt: !4212)
!4212 = distinct !DILocation(line: 639, column: 3, scope: !4207)
!4213 = !DILocation(line: 407, column: 31, scope: !3993, inlinedAt: !4212)
!4214 = !DILocation(line: 407, column: 27, scope: !3993, inlinedAt: !4212)
!4215 = !DILocation(line: 407, column: 8, scope: !3993, inlinedAt: !4212)
!4216 = !DILocation(line: 407, column: 3, scope: !3993, inlinedAt: !4212)
!4217 = !DILocation(line: 407, column: 12, scope: !3993, inlinedAt: !4212)
!4218 = !DILocation(line: 408, column: 3, scope: !3993, inlinedAt: !4212)
!4219 = !DILocation(line: 408, column: 12, scope: !3993, inlinedAt: !4212)
!4220 = !DILocation(line: 640, column: 10, scope: !4207)
!4221 = !DILocation(line: 640, column: 14, scope: !4207)
!4222 = !DILocation(line: 641, column: 1, scope: !4207)
!4223 = !DILocation(line: 0, scope: !896)
!4224 = !DILocation(line: 655, column: 61, scope: !896)
!4225 = !DILocation(line: 0, scope: !903, inlinedAt: !4226)
!4226 = distinct !DILocation(line: 655, column: 16, scope: !896)
!4227 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !4226)
!4228 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !4226)
!4229 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !4226)
!4230 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !4226)
!4231 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !4226)
!4232 = !DILocation(line: 439, scope: !921, inlinedAt: !4226)
!4233 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !4226)
!4234 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !4226)
!4235 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !4226)
!4236 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !4226)
!4237 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !4226)
!4238 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !4226)
!4239 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !4226)
!4240 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !4226)
!4241 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !4226)
!4242 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !4226)
!4243 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !4226)
!4244 = distinct !{!4244, !4235, !4245, !258}
!4245 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !4226)
!4246 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !4226)
!4247 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !4226)
!4248 = distinct !{!4248, !4227, !4249, !258}
!4249 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !4226)
!4250 = !DILocation(line: 655, column: 10, scope: !896)
!4251 = !DILocation(line: 655, column: 14, scope: !896)
!4252 = !DILocation(line: 656, column: 1, scope: !896)
!4253 = !DILocation(line: 0, scope: !834)
!4254 = !DILocation(line: 669, column: 3, scope: !834)
!4255 = !DILocation(line: 670, column: 10, scope: !834)
!4256 = !DILocation(line: 670, column: 14, scope: !834)
!4257 = !DILocation(line: 671, column: 1, scope: !834)
!4258 = !DILocation(line: 0, scope: !855)
!4259 = !DILocation(line: 0, scope: !604, inlinedAt: !4260)
!4260 = distinct !DILocation(line: 687, column: 3, scope: !855)
!4261 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4260)
!4262 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4260)
!4263 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4260)
!4264 = !DILocation(line: 509, scope: !618, inlinedAt: !4260)
!4265 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4260)
!4266 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4260)
!4267 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4260)
!4268 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4260)
!4269 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4260)
!4270 = !DILocation(line: 0, scope: !627, inlinedAt: !4271)
!4271 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4260)
!4272 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4271)
!4273 = !DILocation(line: 43, scope: !635, inlinedAt: !4271)
!4274 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4271)
!4275 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4271)
!4276 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4271)
!4277 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4271)
!4278 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4271)
!4279 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4271)
!4280 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4271)
!4281 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4271)
!4282 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4271)
!4283 = distinct !{!4283, !4275, !4284, !258}
!4284 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4271)
!4285 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4260)
!4286 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4260)
!4287 = distinct !{!4287, !4266, !4288, !258}
!4288 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4260)
!4289 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4260)
!4290 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4260)
!4291 = distinct !{!4291, !4261, !4292, !258}
!4292 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4260)
!4293 = !DILocation(line: 688, column: 1, scope: !855)
!4294 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !837, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4295 = !DILocalVariable(name: "out", arg: 1, scope: !4294, file: !74, line: 700, type: !32)
!4296 = !DILocation(line: 0, scope: !4294)
!4297 = !DILocalVariable(name: "outlen", arg: 2, scope: !4294, file: !74, line: 700, type: !38)
!4298 = !DILocalVariable(name: "in", arg: 3, scope: !4294, file: !74, line: 700, type: !160)
!4299 = !DILocalVariable(name: "inlen", arg: 4, scope: !4294, file: !74, line: 700, type: !38)
!4300 = !DILocalVariable(name: "state", scope: !4294, file: !74, line: 703, type: !567)
!4301 = !DILocation(line: 703, column: 16, scope: !4294)
!4302 = !DILocation(line: 0, scope: !563, inlinedAt: !4303)
!4303 = distinct !DILocation(line: 705, column: 3, scope: !4294)
!4304 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !4303)
!4305 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !4303)
!4306 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !4303)
!4307 = !DILocation(line: 706, column: 19, scope: !4294)
!4308 = !DILocalVariable(name: "nblocks", scope: !4294, file: !74, line: 702, type: !38)
!4309 = !DILocation(line: 0, scope: !596, inlinedAt: !4310)
!4310 = distinct !DILocation(line: 707, column: 3, scope: !4294)
!4311 = !DILocation(line: 0, scope: !604, inlinedAt: !4312)
!4312 = distinct !DILocation(line: 600, column: 3, scope: !596, inlinedAt: !4310)
!4313 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4312)
!4314 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4312)
!4315 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4312)
!4316 = !DILocation(line: 509, scope: !618, inlinedAt: !4312)
!4317 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4312)
!4318 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4312)
!4319 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4312)
!4320 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4312)
!4321 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4312)
!4322 = !DILocation(line: 0, scope: !627, inlinedAt: !4323)
!4323 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4312)
!4324 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4323)
!4325 = !DILocation(line: 43, scope: !635, inlinedAt: !4323)
!4326 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4323)
!4327 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4323)
!4328 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4323)
!4329 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4323)
!4330 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4323)
!4331 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4323)
!4332 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4323)
!4333 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4323)
!4334 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4323)
!4335 = distinct !{!4335, !4327, !4336, !258}
!4336 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4323)
!4337 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4312)
!4338 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4312)
!4339 = distinct !{!4339, !4318, !4340, !258}
!4340 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4312)
!4341 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4312)
!4342 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4312)
!4343 = distinct !{!4343, !4313, !4344, !258}
!4344 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4312)
!4345 = !DILocation(line: 708, column: 20, scope: !4294)
!4346 = !DILocation(line: 708, column: 10, scope: !4294)
!4347 = !DILocation(line: 709, column: 17, scope: !4294)
!4348 = !DILocation(line: 709, column: 7, scope: !4294)
!4349 = !DILocation(line: 0, scope: !4011, inlinedAt: !4350)
!4350 = distinct !DILocation(line: 710, column: 3, scope: !4294)
!4351 = !DILocation(line: 568, column: 61, scope: !4011, inlinedAt: !4350)
!4352 = !DILocation(line: 0, scope: !903, inlinedAt: !4353)
!4353 = distinct !DILocation(line: 568, column: 16, scope: !4011, inlinedAt: !4350)
!4354 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !4353)
!4355 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !4353)
!4356 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !4353)
!4357 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !4353)
!4358 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !4353)
!4359 = !DILocation(line: 439, scope: !921, inlinedAt: !4353)
!4360 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !4353)
!4361 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !4353)
!4362 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !4353)
!4363 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !4353)
!4364 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !4353)
!4365 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !4353)
!4366 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !4353)
!4367 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !4353)
!4368 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !4353)
!4369 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !4353)
!4370 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !4353)
!4371 = distinct !{!4371, !4362, !4372, !258}
!4372 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !4353)
!4373 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !4353)
!4374 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !4353)
!4375 = distinct !{!4375, !4354, !4376, !258}
!4376 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !4353)
!4377 = !DILocation(line: 568, column: 10, scope: !4011, inlinedAt: !4350)
!4378 = !DILocation(line: 568, column: 14, scope: !4011, inlinedAt: !4350)
!4379 = !DILocation(line: 711, column: 1, scope: !4294)
!4380 = !DILocation(line: 0, scope: !836)
!4381 = !DILocation(line: 726, column: 16, scope: !836)
!4382 = !DILocation(line: 0, scope: !834, inlinedAt: !4383)
!4383 = distinct !DILocation(line: 728, column: 3, scope: !836)
!4384 = !DILocation(line: 669, column: 3, scope: !834, inlinedAt: !4383)
!4385 = !DILocation(line: 670, column: 10, scope: !834, inlinedAt: !4383)
!4386 = !DILocation(line: 670, column: 14, scope: !834, inlinedAt: !4383)
!4387 = !DILocation(line: 729, column: 19, scope: !836)
!4388 = !DILocation(line: 0, scope: !855, inlinedAt: !4389)
!4389 = distinct !DILocation(line: 730, column: 3, scope: !836)
!4390 = !DILocation(line: 0, scope: !604, inlinedAt: !4391)
!4391 = distinct !DILocation(line: 687, column: 3, scope: !855, inlinedAt: !4389)
!4392 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4391)
!4393 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4391)
!4394 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4391)
!4395 = !DILocation(line: 509, scope: !618, inlinedAt: !4391)
!4396 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4391)
!4397 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4391)
!4398 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4391)
!4399 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4391)
!4400 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4391)
!4401 = !DILocation(line: 0, scope: !627, inlinedAt: !4402)
!4402 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4391)
!4403 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4402)
!4404 = !DILocation(line: 43, scope: !635, inlinedAt: !4402)
!4405 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4402)
!4406 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4402)
!4407 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4402)
!4408 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4402)
!4409 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4402)
!4410 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4402)
!4411 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4402)
!4412 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4402)
!4413 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4402)
!4414 = distinct !{!4414, !4406, !4415, !258}
!4415 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4402)
!4416 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4391)
!4417 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4391)
!4418 = distinct !{!4418, !4397, !4419, !258}
!4419 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4391)
!4420 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4391)
!4421 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4391)
!4422 = distinct !{!4422, !4392, !4423, !258}
!4423 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4391)
!4424 = !DILocation(line: 731, column: 20, scope: !836)
!4425 = !DILocation(line: 731, column: 10, scope: !836)
!4426 = !DILocation(line: 732, column: 17, scope: !836)
!4427 = !DILocation(line: 732, column: 7, scope: !836)
!4428 = !DILocation(line: 0, scope: !896, inlinedAt: !4429)
!4429 = distinct !DILocation(line: 733, column: 3, scope: !836)
!4430 = !DILocation(line: 655, column: 61, scope: !896, inlinedAt: !4429)
!4431 = !DILocation(line: 0, scope: !903, inlinedAt: !4432)
!4432 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !4429)
!4433 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !4432)
!4434 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !4432)
!4435 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !4432)
!4436 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !4432)
!4437 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !4432)
!4438 = !DILocation(line: 439, scope: !921, inlinedAt: !4432)
!4439 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !4432)
!4440 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !4432)
!4441 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !4432)
!4442 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !4432)
!4443 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !4432)
!4444 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !4432)
!4445 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !4432)
!4446 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !4432)
!4447 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !4432)
!4448 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !4432)
!4449 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !4432)
!4450 = distinct !{!4450, !4441, !4451, !258}
!4451 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !4432)
!4452 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !4432)
!4453 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !4432)
!4454 = distinct !{!4454, !4433, !4455, !258}
!4455 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !4432)
!4456 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !4429)
!4457 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !4429)
!4458 = !DILocation(line: 734, column: 1, scope: !836)
!4459 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !4460, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4460 = !DISubroutineType(types: !4461)
!4461 = !{null, !32, !160, !38}
!4462 = !DILocalVariable(name: "h", arg: 1, scope: !4459, file: !74, line: 745, type: !32)
!4463 = !DILocation(line: 0, scope: !4459)
!4464 = !DILocalVariable(name: "in", arg: 2, scope: !4459, file: !74, line: 745, type: !160)
!4465 = !DILocalVariable(name: "inlen", arg: 3, scope: !4459, file: !74, line: 745, type: !38)
!4466 = !DILocalVariable(name: "s", scope: !4459, file: !74, line: 748, type: !513)
!4467 = !DILocation(line: 748, column: 12, scope: !4459)
!4468 = !DILocation(line: 750, column: 3, scope: !4459)
!4469 = !DILocation(line: 751, column: 3, scope: !4459)
!4470 = !DILocalVariable(name: "i", scope: !4459, file: !74, line: 747, type: !40)
!4471 = !DILocation(line: 752, column: 7, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4459, file: !74, line: 752, column: 3)
!4473 = !DILocation(line: 752, scope: !4472)
!4474 = !DILocation(line: 752, column: 12, scope: !4475)
!4475 = distinct !DILexicalBlock(scope: !4472, file: !74, line: 752, column: 3)
!4476 = !DILocation(line: 752, column: 3, scope: !4472)
!4477 = !DILocation(line: 753, column: 16, scope: !4475)
!4478 = !DILocation(line: 753, column: 14, scope: !4475)
!4479 = !DILocation(line: 753, column: 19, scope: !4475)
!4480 = !DILocation(line: 0, scope: !627, inlinedAt: !4481)
!4481 = distinct !DILocation(line: 753, column: 5, scope: !4475)
!4482 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4481)
!4483 = !DILocation(line: 43, scope: !635, inlinedAt: !4481)
!4484 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4481)
!4485 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4481)
!4486 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4481)
!4487 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4481)
!4488 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4481)
!4489 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4481)
!4490 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4481)
!4491 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4481)
!4492 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4481)
!4493 = distinct !{!4493, !4485, !4494, !258}
!4494 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4481)
!4495 = !DILocation(line: 752, column: 16, scope: !4475)
!4496 = !DILocation(line: 752, column: 3, scope: !4475)
!4497 = distinct !{!4497, !4476, !4498, !258}
!4498 = !DILocation(line: 753, column: 23, scope: !4472)
!4499 = !DILocation(line: 754, column: 1, scope: !4459)
!4500 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !4460, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4501 = !DILocalVariable(name: "h", arg: 1, scope: !4500, file: !74, line: 765, type: !32)
!4502 = !DILocation(line: 0, scope: !4500)
!4503 = !DILocalVariable(name: "in", arg: 2, scope: !4500, file: !74, line: 765, type: !160)
!4504 = !DILocalVariable(name: "inlen", arg: 3, scope: !4500, file: !74, line: 765, type: !38)
!4505 = !DILocalVariable(name: "s", scope: !4500, file: !74, line: 768, type: !513)
!4506 = !DILocation(line: 768, column: 12, scope: !4500)
!4507 = !DILocation(line: 770, column: 3, scope: !4500)
!4508 = !DILocation(line: 771, column: 3, scope: !4500)
!4509 = !DILocalVariable(name: "i", scope: !4500, file: !74, line: 767, type: !40)
!4510 = !DILocation(line: 772, column: 7, scope: !4511)
!4511 = distinct !DILexicalBlock(scope: !4500, file: !74, line: 772, column: 3)
!4512 = !DILocation(line: 772, scope: !4511)
!4513 = !DILocation(line: 772, column: 12, scope: !4514)
!4514 = distinct !DILexicalBlock(scope: !4511, file: !74, line: 772, column: 3)
!4515 = !DILocation(line: 772, column: 3, scope: !4511)
!4516 = !DILocation(line: 773, column: 16, scope: !4514)
!4517 = !DILocation(line: 773, column: 14, scope: !4514)
!4518 = !DILocation(line: 773, column: 19, scope: !4514)
!4519 = !DILocation(line: 0, scope: !627, inlinedAt: !4520)
!4520 = distinct !DILocation(line: 773, column: 5, scope: !4514)
!4521 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4520)
!4522 = !DILocation(line: 43, scope: !635, inlinedAt: !4520)
!4523 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4520)
!4524 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4520)
!4525 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4520)
!4526 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4520)
!4527 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4520)
!4528 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4520)
!4529 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4520)
!4530 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4520)
!4531 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4520)
!4532 = distinct !{!4532, !4524, !4533, !258}
!4533 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4520)
!4534 = !DILocation(line: 772, column: 16, scope: !4514)
!4535 = !DILocation(line: 772, column: 3, scope: !4514)
!4536 = distinct !{!4536, !4515, !4537, !258}
!4537 = !DILocation(line: 773, column: 23, scope: !4511)
!4538 = !DILocation(line: 774, column: 1, scope: !4500)
!4539 = !DILocation(line: 0, scope: !537)
!4540 = !DILocation(line: 23, column: 11, scope: !537)
!4541 = !DILocation(line: 25, column: 3, scope: !537)
!4542 = !DILocation(line: 26, column: 3, scope: !537)
!4543 = !DILocation(line: 26, column: 29, scope: !537)
!4544 = !DILocation(line: 27, column: 3, scope: !537)
!4545 = !DILocation(line: 27, column: 29, scope: !537)
!4546 = !DILocation(line: 0, scope: !563, inlinedAt: !4547)
!4547 = distinct !DILocation(line: 29, column: 3, scope: !537)
!4548 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !4547)
!4549 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !4547)
!4550 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !4547)
!4551 = !DILocation(line: 30, column: 1, scope: !537)
!4552 = !DILocation(line: 0, scope: !817)
!4553 = !DILocation(line: 45, column: 11, scope: !817)
!4554 = !DILocation(line: 47, column: 3, scope: !817)
!4555 = !DILocation(line: 48, column: 3, scope: !817)
!4556 = !DILocation(line: 48, column: 26, scope: !817)
!4557 = !DILocation(line: 50, column: 3, scope: !817)
!4558 = !DILocation(line: 51, column: 1, scope: !817)
!4559 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !538, file: !538, line: 64, type: !1876, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!4560 = !DILocalVariable(name: "out", arg: 1, scope: !4559, file: !538, line: 64, type: !32)
!4561 = !DILocation(line: 0, scope: !4559)
!4562 = !DILocalVariable(name: "key", arg: 2, scope: !4559, file: !538, line: 64, type: !160)
!4563 = !DILocalVariable(name: "input", arg: 3, scope: !4559, file: !538, line: 64, type: !160)
!4564 = !DILocalVariable(name: "s", scope: !4559, file: !538, line: 66, type: !542)
!4565 = !DILocation(line: 66, column: 16, scope: !4559)
!4566 = !DILocation(line: 0, scope: !4179, inlinedAt: !4567)
!4567 = distinct !DILocation(line: 68, column: 3, scope: !4559)
!4568 = !DILocation(line: 0, scope: !3441, inlinedAt: !4569)
!4569 = distinct !DILocation(line: 612, column: 3, scope: !4179, inlinedAt: !4567)
!4570 = !DILocation(line: 356, column: 7, scope: !3448, inlinedAt: !4569)
!4571 = !DILocation(line: 356, scope: !3448, inlinedAt: !4569)
!4572 = !DILocation(line: 356, column: 12, scope: !3451, inlinedAt: !4569)
!4573 = !DILocation(line: 356, column: 3, scope: !3448, inlinedAt: !4569)
!4574 = !DILocation(line: 357, column: 5, scope: !3451, inlinedAt: !4569)
!4575 = !DILocation(line: 357, column: 10, scope: !3451, inlinedAt: !4569)
!4576 = !DILocation(line: 356, column: 17, scope: !3451, inlinedAt: !4569)
!4577 = !DILocation(line: 356, column: 3, scope: !3451, inlinedAt: !4569)
!4578 = distinct !{!4578, !4573, !4579, !258}
!4579 = !DILocation(line: 357, column: 12, scope: !3448, inlinedAt: !4569)
!4580 = !DILocation(line: 613, column: 10, scope: !4179, inlinedAt: !4567)
!4581 = !DILocation(line: 613, column: 14, scope: !4179, inlinedAt: !4567)
!4582 = !DILocation(line: 0, scope: !4197, inlinedAt: !4583)
!4583 = distinct !DILocation(line: 69, column: 3, scope: !4559)
!4584 = !DILocation(line: 627, column: 16, scope: !4197, inlinedAt: !4583)
!4585 = !DILocation(line: 627, column: 10, scope: !4197, inlinedAt: !4583)
!4586 = !DILocation(line: 627, column: 14, scope: !4197, inlinedAt: !4583)
!4587 = !DILocation(line: 0, scope: !4197, inlinedAt: !4588)
!4588 = distinct !DILocation(line: 70, column: 3, scope: !4559)
!4589 = !DILocation(line: 627, column: 16, scope: !4197, inlinedAt: !4588)
!4590 = !DILocation(line: 627, column: 10, scope: !4197, inlinedAt: !4588)
!4591 = !DILocation(line: 627, column: 14, scope: !4197, inlinedAt: !4588)
!4592 = !DILocation(line: 0, scope: !4207, inlinedAt: !4593)
!4593 = distinct !DILocation(line: 71, column: 3, scope: !4559)
!4594 = !DILocation(line: 0, scope: !3993, inlinedAt: !4595)
!4595 = distinct !DILocation(line: 639, column: 3, scope: !4207, inlinedAt: !4593)
!4596 = !DILocation(line: 407, column: 31, scope: !3993, inlinedAt: !4595)
!4597 = !DILocation(line: 407, column: 27, scope: !3993, inlinedAt: !4595)
!4598 = !DILocation(line: 407, column: 8, scope: !3993, inlinedAt: !4595)
!4599 = !DILocation(line: 407, column: 3, scope: !3993, inlinedAt: !4595)
!4600 = !DILocation(line: 407, column: 12, scope: !3993, inlinedAt: !4595)
!4601 = !DILocation(line: 408, column: 3, scope: !3993, inlinedAt: !4595)
!4602 = !DILocation(line: 408, column: 12, scope: !3993, inlinedAt: !4595)
!4603 = !DILocation(line: 640, column: 10, scope: !4207, inlinedAt: !4593)
!4604 = !DILocation(line: 640, column: 14, scope: !4207, inlinedAt: !4593)
!4605 = !DILocation(line: 0, scope: !896, inlinedAt: !4606)
!4606 = distinct !DILocation(line: 72, column: 3, scope: !4559)
!4607 = !DILocation(line: 0, scope: !903, inlinedAt: !4608)
!4608 = distinct !DILocation(line: 655, column: 16, scope: !896, inlinedAt: !4606)
!4609 = !DILocation(line: 434, column: 3, scope: !903, inlinedAt: !4608)
!4610 = !DILocation(line: 435, column: 12, scope: !914, inlinedAt: !4608)
!4611 = !DILocation(line: 436, column: 7, scope: !917, inlinedAt: !4608)
!4612 = !DILocation(line: 438, column: 5, scope: !917, inlinedAt: !4608)
!4613 = !DILocation(line: 439, column: 9, scope: !921, inlinedAt: !4608)
!4614 = !DILocation(line: 439, scope: !921, inlinedAt: !4608)
!4615 = !DILocation(line: 439, column: 17, scope: !924, inlinedAt: !4608)
!4616 = !DILocation(line: 439, column: 21, scope: !924, inlinedAt: !4608)
!4617 = !DILocation(line: 439, column: 5, scope: !921, inlinedAt: !4608)
!4618 = !DILocation(line: 440, column: 19, scope: !924, inlinedAt: !4608)
!4619 = !DILocation(line: 440, column: 16, scope: !924, inlinedAt: !4608)
!4620 = !DILocation(line: 440, column: 27, scope: !924, inlinedAt: !4608)
!4621 = !DILocation(line: 440, column: 23, scope: !924, inlinedAt: !4608)
!4622 = !DILocation(line: 440, column: 14, scope: !924, inlinedAt: !4608)
!4623 = !DILocation(line: 440, column: 11, scope: !924, inlinedAt: !4608)
!4624 = !DILocation(line: 439, column: 41, scope: !924, inlinedAt: !4608)
!4625 = !DILocation(line: 439, column: 5, scope: !924, inlinedAt: !4608)
!4626 = distinct !{!4626, !4617, !4627, !258}
!4627 = !DILocation(line: 440, column: 32, scope: !921, inlinedAt: !4608)
!4628 = !DILocation(line: 441, column: 16, scope: !915, inlinedAt: !4608)
!4629 = !DILocation(line: 441, column: 12, scope: !915, inlinedAt: !4608)
!4630 = distinct !{!4630, !4609, !4631, !258}
!4631 = !DILocation(line: 443, column: 3, scope: !903, inlinedAt: !4608)
!4632 = !DILocation(line: 655, column: 10, scope: !896, inlinedAt: !4606)
!4633 = !DILocation(line: 655, column: 14, scope: !896, inlinedAt: !4606)
!4634 = !DILocation(line: 73, column: 1, scope: !4559)
