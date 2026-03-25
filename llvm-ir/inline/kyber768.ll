; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [3 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@.str = private unnamed_addr constant [28 x i8] c"CRYPTO_SECRETKEYBYTES:  %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [28 x i8] c"CRYPTO_PUBLICKEYBYTES:  %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [28 x i8] c"CRYPTO_CIPHERTEXTBYTES: %d\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [12 x i8] c"ERROR keys\0A\00", align 1, !dbg !11
@.str.4 = private unnamed_addr constant [18 x i8] c"ERROR invalid sk\0A\00", align 1, !dbg !16
@.str.5 = private unnamed_addr constant [26 x i8] c"ERROR invalid ciphertext\0A\00", align 1, !dbg !21
@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !26
@.str.6 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !44
@pqcrystals_kyber768_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !66

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !106 {
entry:
  %coins.i2.i = alloca [64 x i8], align 1
  %coins.i.i19 = alloca [32 x i8], align 1
  %pk.i20 = alloca [1184 x i8], align 1
  %sk.i21 = alloca [2400 x i8], align 1
  %ct.i22 = alloca [1088 x i8], align 1
  %key_a.i23 = alloca [32 x i8], align 1
  %key_b.i24 = alloca [32 x i8], align 1
  %b.i = alloca i8, align 1
  %pos.i = alloca i32, align 4
  %coins.i1.i1 = alloca [32 x i8], align 1
  %coins.i.i2 = alloca [64 x i8], align 1
  %pk.i3 = alloca [1184 x i8], align 1
  %sk.i4 = alloca [2400 x i8], align 1
  %ct.i5 = alloca [1088 x i8], align 1
  %key_a.i6 = alloca [32 x i8], align 1
  %key_b.i7 = alloca [32 x i8], align 1
  %coins.i1.i = alloca [32 x i8], align 1
  %coins.i.i = alloca [64 x i8], align 1
  %pk.i = alloca [1184 x i8], align 1
  %sk.i = alloca [2400 x i8], align 1
  %ct.i = alloca [1088 x i8], align 1
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
  call void @llvm.lifetime.start.p0(i64 1184, ptr nonnull %pk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 2400, ptr nonnull %sk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 1088, ptr nonnull %ct.i), !dbg !117
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
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i, ptr noundef nonnull %sk.i, ptr noundef nonnull %coins.i.i) #4, !dbg !166
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 1152, !dbg !167
  %call.i3.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i, ptr noundef nonnull %pk.i, i32 noundef 1184) #5, !dbg !168
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 2336, !dbg !169
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i, ptr noundef nonnull %pk.i, i32 noundef 1184) #4, !dbg !169
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 2368, !dbg !170
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %coins.i.i, i32 32, !dbg !171
  %call6.i.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i, ptr noundef nonnull %add.ptr5.i.i, i32 noundef 32) #5, !dbg !172
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i), !dbg !173
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !174
    #dbg_value(ptr %ct.i, !177, !DIExpression(), !178)
    #dbg_value(ptr %key_b.i, !179, !DIExpression(), !178)
    #dbg_value(ptr %pk.i, !180, !DIExpression(), !178)
    #dbg_declare(ptr %coins.i1.i, !181, !DIExpression(), !182)
  call void @randombytes(ptr noundef nonnull %coins.i1.i, i32 noundef 32) #4, !dbg !174
  %call.i2.i = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef nonnull %ct.i, ptr noundef nonnull %key_b.i, ptr noundef nonnull %pk.i, ptr noundef nonnull %coins.i1.i) #4, !dbg !183
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !184
  %call9.i = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a.i, ptr noundef nonnull %ct.i, ptr noundef nonnull %sk.i) #4, !dbg !185
  %call12.i = call i32 @memcmp(ptr noundef nonnull %key_a.i, ptr noundef nonnull %key_b.i, i32 noundef 32) #5, !dbg !186
  %tobool.not.i = icmp eq i32 %call12.i, 0, !dbg !186
  br i1 %tobool.not.i, label %test_keys.exit, label %if.then.i, !dbg !186

if.then.i:                                        ; preds = %for.body
  %call13.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #5, !dbg !188
  br label %test_keys.exit, !dbg !190

test_keys.exit:                                   ; preds = %for.body, %if.then.i
  %retval.0.i = phi i32 [ 1, %if.then.i ], [ 0, %for.body ], !dbg !191
  call void @llvm.lifetime.end.p0(i64 1184, ptr nonnull %pk.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 2400, ptr nonnull %sk.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 1088, ptr nonnull %ct.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i), !dbg !192
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i), !dbg !192
    #dbg_value(i32 %retval.0.i, !193, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 1184, ptr nonnull %pk.i3), !dbg !194
  call void @llvm.lifetime.start.p0(i64 2400, ptr nonnull %sk.i4), !dbg !194
  call void @llvm.lifetime.start.p0(i64 1088, ptr nonnull %ct.i5), !dbg !194
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
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i3, ptr noundef nonnull %sk.i4, ptr noundef nonnull %coins.i.i2) #4, !dbg !212
  %add.ptr.i.i8 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 1152, !dbg !213
  %call.i3.i9 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i8, ptr noundef nonnull %pk.i3, i32 noundef 1184) #5, !dbg !214
  %add.ptr2.i.i10 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 2336, !dbg !215
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i10, ptr noundef nonnull %pk.i3, i32 noundef 1184) #4, !dbg !215
  %add.ptr4.i.i11 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 2368, !dbg !216
  %add.ptr5.i.i12 = getelementptr inbounds nuw i8, ptr %coins.i.i2, i32 32, !dbg !217
  %call6.i.i13 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i11, ptr noundef nonnull %add.ptr5.i.i12, i32 noundef 32) #5, !dbg !218
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i2), !dbg !219
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !220
    #dbg_value(ptr %ct.i5, !177, !DIExpression(), !222)
    #dbg_value(ptr %key_b.i7, !179, !DIExpression(), !222)
    #dbg_value(ptr %pk.i3, !180, !DIExpression(), !222)
    #dbg_declare(ptr %coins.i1.i1, !181, !DIExpression(), !223)
  call void @randombytes(ptr noundef nonnull %coins.i1.i1, i32 noundef 32) #4, !dbg !220
  %call.i2.i14 = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef nonnull %ct.i5, ptr noundef nonnull %key_b.i7, ptr noundef nonnull %pk.i3, ptr noundef nonnull %coins.i1.i1) #4, !dbg !224
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !225
  call void @randombytes(ptr noundef nonnull %sk.i4, i32 noundef 2400) #4, !dbg !226
  %call10.i = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %ct.i5, ptr noundef nonnull %sk.i4) #4, !dbg !227
  %call13.i15 = call i32 @memcmp(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %key_b.i7, i32 noundef 32) #5, !dbg !228
  %tobool.not.i16 = icmp eq i32 %call13.i15, 0, !dbg !228
  br i1 %tobool.not.i16, label %if.then.i18, label %test_invalid_sk_a.exit, !dbg !230

if.then.i18:                                      ; preds = %test_keys.exit
  %call14.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #5, !dbg !231
  br label %test_invalid_sk_a.exit, !dbg !233

test_invalid_sk_a.exit:                           ; preds = %test_keys.exit, %if.then.i18
  %retval.0.i17 = phi i32 [ 1, %if.then.i18 ], [ 0, %test_keys.exit ], !dbg !234
  call void @llvm.lifetime.end.p0(i64 1184, ptr nonnull %pk.i3), !dbg !235
  call void @llvm.lifetime.end.p0(i64 2400, ptr nonnull %sk.i4), !dbg !235
  call void @llvm.lifetime.end.p0(i64 1088, ptr nonnull %ct.i5), !dbg !235
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i6), !dbg !235
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i7), !dbg !235
    #dbg_value(i32 %or, !193, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 1184, ptr nonnull %pk.i20), !dbg !236
  call void @llvm.lifetime.start.p0(i64 2400, ptr nonnull %sk.i21), !dbg !236
  call void @llvm.lifetime.start.p0(i64 1088, ptr nonnull %ct.i22), !dbg !236
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
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i20, ptr noundef nonnull %sk.i21, ptr noundef nonnull %coins.i2.i) #4, !dbg !268
  %add.ptr.i.i26 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 1152, !dbg !269
  %call.i4.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i26, ptr noundef nonnull %pk.i20, i32 noundef 1184) #5, !dbg !270
  %add.ptr2.i.i27 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 2336, !dbg !271
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i27, ptr noundef nonnull %pk.i20, i32 noundef 1184) #4, !dbg !271
  %add.ptr4.i.i28 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 2368, !dbg !272
  %add.ptr5.i.i29 = getelementptr inbounds nuw i8, ptr %coins.i2.i, i32 32, !dbg !273
  %call6.i.i30 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i28, ptr noundef nonnull %add.ptr5.i.i29, i32 noundef 32) #5, !dbg !274
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i2.i), !dbg !275
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !276
    #dbg_value(ptr %ct.i22, !177, !DIExpression(), !278)
    #dbg_value(ptr %key_b.i24, !179, !DIExpression(), !278)
    #dbg_value(ptr %pk.i20, !180, !DIExpression(), !278)
    #dbg_declare(ptr %coins.i.i19, !181, !DIExpression(), !279)
  call void @randombytes(ptr noundef nonnull %coins.i.i19, i32 noundef 32) #4, !dbg !276
  %call.i.i = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef nonnull %ct.i22, ptr noundef nonnull %key_b.i24, ptr noundef nonnull %pk.i20, ptr noundef nonnull %coins.i.i19) #4, !dbg !280
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !281
  %1 = load i8, ptr %b.i, align 1, !dbg !282
    #dbg_value(i8 %1, !249, !DIExpression(), !250)
  %2 = load i32, ptr %pos.i, align 4, !dbg !283
    #dbg_value(i32 %2, !260, !DIExpression(), !250)
  %rem.i = urem i32 %2, 1088, !dbg !284
  %arrayidx.i = getelementptr inbounds nuw [1088 x i8], ptr %ct.i22, i32 0, i32 %rem.i, !dbg !285
  %3 = load i8, ptr %arrayidx.i, align 1, !dbg !286
  %xor1.i = xor i8 %3, %1, !dbg !286
  store i8 %xor1.i, ptr %arrayidx.i, align 1, !dbg !286
  %call11.i = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %ct.i22, ptr noundef nonnull %sk.i21) #4, !dbg !287
  %call14.i31 = call i32 @memcmp(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %key_b.i24, i32 noundef 32) #5, !dbg !288
  %tobool15.not.i = icmp eq i32 %call14.i31, 0, !dbg !288
  br i1 %tobool15.not.i, label %if.then.i33, label %test_invalid_ciphertext.exit, !dbg !290

if.then.i33:                                      ; preds = %do.end.i
  %call16.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #5, !dbg !291
  br label %test_invalid_ciphertext.exit, !dbg !293

test_invalid_ciphertext.exit:                     ; preds = %do.end.i, %if.then.i33
  %retval.0.i32 = phi i32 [ 1, %if.then.i33 ], [ 0, %do.end.i ], !dbg !250
  call void @llvm.lifetime.end.p0(i64 1184, ptr nonnull %pk.i20), !dbg !294
  call void @llvm.lifetime.end.p0(i64 2400, ptr nonnull %sk.i21), !dbg !294
  call void @llvm.lifetime.end.p0(i64 1088, ptr nonnull %ct.i22), !dbg !294
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
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 2400) #5, !dbg !302
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 1184) #5, !dbg !303
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 1088) #5, !dbg !304
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
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !157 {
entry:
    #dbg_value(ptr %pk, !156, !DIExpression(), !348)
    #dbg_value(ptr %sk, !164, !DIExpression(), !348)
    #dbg_value(ptr %coins, !165, !DIExpression(), !348)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !349
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !350
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #5, !dbg !351
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !352
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #4, !dbg !352
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !353
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !354
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !355
  ret i32 0, !dbg !356
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !118 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !148, !DIExpression(), !357)
    #dbg_value(ptr %sk, !150, !DIExpression(), !357)
    #dbg_declare(ptr %coins, !151, !DIExpression(), !358)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !359
    #dbg_value(ptr %pk, !156, !DIExpression(), !360)
    #dbg_value(ptr %sk, !164, !DIExpression(), !360)
    #dbg_value(ptr %coins, !165, !DIExpression(), !360)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !362
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !363
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 1184) #5, !dbg !364
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !365
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 1184) #4, !dbg !365
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !366
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !367
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !368
  ret i32 0, !dbg !369
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !370 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !383
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !384
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !385
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !386
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !387
  ret i32 0, !dbg !388
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !175 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !177, !DIExpression(), !389)
    #dbg_value(ptr %ss, !179, !DIExpression(), !389)
    #dbg_value(ptr %pk, !180, !DIExpression(), !389)
    #dbg_declare(ptr %coins, !181, !DIExpression(), !390)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !391
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !392
  ret i32 0, !dbg !393
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !394 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !397, !DIExpression(), !398)
    #dbg_value(ptr %ct, !399, !DIExpression(), !398)
    #dbg_value(ptr %sk, !400, !DIExpression(), !398)
    #dbg_declare(ptr %buf, !401, !DIExpression(), !402)
    #dbg_declare(ptr %kr, !403, !DIExpression(), !404)
    #dbg_declare(ptr %cmp, !405, !DIExpression(), !406)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !407
    #dbg_value(ptr %add.ptr, !408, !DIExpression(), !398)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !409
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !410
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !411
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !412
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !413
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !414
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !415
    #dbg_value(ptr %ct, !416, !DIExpression(), !421)
    #dbg_value(ptr %cmp, !423, !DIExpression(), !421)
    #dbg_value(i32 1088, !424, !DIExpression(), !421)
    #dbg_value(i8 0, !425, !DIExpression(), !421)
    #dbg_value(i32 0, !426, !DIExpression(), !421)
  br label %for.cond.i, !dbg !427

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !429
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !421
    #dbg_value(i8 %r.0.i, !425, !DIExpression(), !421)
    #dbg_value(i32 %i.0.i, !426, !DIExpression(), !421)
  %exitcond = icmp ne i32 %i.0.i, 1088, !dbg !430
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber768_ref_verify.exit, !dbg !432

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

pqcrystals_kyber768_ref_verify.exit:              ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !421
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !441
    #dbg_value(i1 %.not, !442, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !398)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !443
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !443
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

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber768_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber768_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !460
    #dbg_value(i32 %i.0.i2, !457, !DIExpression(), !449)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !461
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber768_ref_cmov.exit, !dbg !463

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

pqcrystals_kyber768_ref_cmov.exit:                ; preds = %for.cond.i1
  ret i32 0, !dbg !474
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !475 {
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
  %exitcond39 = icmp ne i32 %i.0, 3, !dbg !522
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !524

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !525

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !528
    #dbg_value(i32 %j.0, !529, !DIExpression(), !497)
  %exitcond38 = icmp ne i32 %j.0, 3, !dbg !530
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
  %arrayidx7 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !658
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
  %arrayidx15 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !700
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
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !760 {
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
  store i8 3, ptr %arrayidx, align 1, !dbg !784
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !785
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !786
    #dbg_value(i32 0, !787, !DIExpression(), !764)
  br label %for.cond, !dbg !788

for.cond:                                         ; preds = %keccak_squeeze.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit ], !dbg !790
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit ], !dbg !764
    #dbg_value(i8 %nonce.0, !772, !DIExpression(), !764)
    #dbg_value(i32 %i.0, !787, !DIExpression(), !764)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !791
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !793

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !794

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !772, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !764)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !796
    #dbg_value(ptr %arrayidx6, !807, !DIExpression(), !808)
    #dbg_value(ptr %add.ptr, !809, !DIExpression(), !808)
    #dbg_value(i8 %nonce.0, !810, !DIExpression(), !808)
    #dbg_declare(ptr %buf.i, !811, !DIExpression(), !813)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i3), !dbg !814
    #dbg_value(ptr %buf.i, !819, !DIExpression(), !820)
    #dbg_value(i32 128, !821, !DIExpression(), !820)
    #dbg_value(ptr %add.ptr, !822, !DIExpression(), !820)
    #dbg_value(i8 %nonce.0, !823, !DIExpression(), !820)
    #dbg_declare(ptr %extkey.i3, !824, !DIExpression(), !828)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i3, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !814
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %extkey.i3, i32 32, !dbg !829
  store i8 %nonce.0, ptr %arrayidx.i5, align 1, !dbg !830
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i50), !dbg !831
    #dbg_value(ptr %buf.i, !838, !DIExpression(), !839)
    #dbg_value(i32 128, !840, !DIExpression(), !839)
    #dbg_value(ptr %extkey.i3, !841, !DIExpression(), !839)
    #dbg_value(i32 33, !842, !DIExpression(), !839)
    #dbg_declare(ptr %state.i50, !843, !DIExpression(), !844)
    #dbg_value(ptr %state.i50, !845, !DIExpression(), !846)
    #dbg_value(ptr %extkey.i3, !847, !DIExpression(), !846)
    #dbg_value(i32 33, !848, !DIExpression(), !846)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i50, i32 noundef 136, ptr noundef nonnull %extkey.i3, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !831
  %pos.i.i51 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !849
  store i32 136, ptr %pos.i.i51, align 8, !dbg !850
    #dbg_value(i32 0, !851, !DIExpression(), !839)
    #dbg_value(ptr %buf.i, !852, !DIExpression(), !854)
    #dbg_value(i32 0, !856, !DIExpression(), !854)
    #dbg_value(ptr %state.i50, !857, !DIExpression(), !854)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !858)
    #dbg_value(i32 0, !610, !DIExpression(), !858)
    #dbg_value(ptr %state.i50, !611, !DIExpression(), !858)
    #dbg_value(i32 136, !612, !DIExpression(), !858)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !858)
    #dbg_value(i32 0, !610, !DIExpression(), !858)
    #dbg_value(i32 128, !840, !DIExpression(), !839)
    #dbg_value(ptr %buf.i, !838, !DIExpression(), !839)
    #dbg_value(ptr %buf.i, !860, !DIExpression(), !862)
    #dbg_value(i32 128, !864, !DIExpression(), !862)
    #dbg_value(ptr %state.i50, !865, !DIExpression(), !862)
  %pos.i1.i53 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !866
  %0 = load i32, ptr %pos.i1.i53, align 8, !dbg !866
    #dbg_value(ptr %buf.i, !867, !DIExpression(), !871)
    #dbg_value(i32 128, !873, !DIExpression(), !871)
    #dbg_value(ptr %state.i50, !874, !DIExpression(), !871)
    #dbg_value(i32 %0, !875, !DIExpression(), !871)
    #dbg_value(i32 136, !876, !DIExpression(), !871)
  br label %while.cond.i137, !dbg !877

while.cond.i137:                                  ; preds = %for.end.i145, %for.body
  %pos.addr.0.i = phi i32 [ %0, %for.body ], [ %i.0.i143.lcssa, %for.end.i145 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.body ], [ %sub3.i, %for.end.i145 ]
  %out.addr.0.i138 = phi ptr [ %buf.i, %for.body ], [ %out.addr.1.i.lcssa, %for.end.i145 ]
    #dbg_value(ptr %out.addr.0.i138, !867, !DIExpression(), !871)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !871)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !871)
  %tobool.not.i139 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !877
  br i1 %tobool.not.i139, label %keccak_squeeze.exit, label %while.body.i140, !dbg !877

while.body.i140:                                  ; preds = %while.cond.i137
  %cmp.i141 = icmp eq i32 %pos.addr.0.i, 136, !dbg !878
  br i1 %cmp.i141, label %if.then.i, label %if.end.i, !dbg !878

if.then.i:                                        ; preds = %while.body.i140
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !881
    #dbg_value(i32 0, !875, !DIExpression(), !871)
  br label %if.end.i, !dbg !883

if.end.i:                                         ; preds = %if.then.i, %while.body.i140
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i140 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !871)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !871)
  br label %for.cond.i142, !dbg !885

for.cond.i142:                                    ; preds = %for.body.i146, %if.end.i
  %i.0.i143 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i150, %for.body.i146 ], !dbg !887
  %out.addr.1.i = phi ptr [ %out.addr.0.i138, %if.end.i ], [ %incdec.ptr.i, %for.body.i146 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !871)
    #dbg_value(i32 %i.0.i143, !884, !DIExpression(), !871)
  %cmp1.i = icmp ult i32 %i.0.i143, 136, !dbg !888
  %add.i144 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !890
  %cmp2.i = icmp ult i32 %i.0.i143, %add.i144, !dbg !890
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !890
  br i1 %1, label %for.body.i146, label %for.end.i145, !dbg !891

for.body.i146:                                    ; preds = %for.cond.i142
  %div1.i = lshr i32 %i.0.i143, 3, !dbg !892
  %arrayidx.i147 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %div1.i, !dbg !893
  %2 = load i64, ptr %arrayidx.i147, align 8, !dbg !893
  %rem.i = shl nuw nsw i32 %i.0.i143, 3, !dbg !894
  %mul.i148 = and i32 %rem.i, 56, !dbg !894
  %sh_prom.i = zext nneg i32 %mul.i148 to i64, !dbg !895
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !895
  %conv.i149 = trunc i64 %shr.i to i8, !dbg !893
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !871)
  store i8 %conv.i149, ptr %out.addr.1.i, align 1, !dbg !896
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !897
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !871)
  %inc.i150 = add nuw nsw i32 %i.0.i143, 1, !dbg !898
    #dbg_value(i32 %inc.i150, !884, !DIExpression(), !871)
  br label %for.cond.i142, !dbg !899, !llvm.loop !900

for.end.i145:                                     ; preds = %for.cond.i142
  %i.0.i143.lcssa = phi i32 [ %i.0.i143, %for.cond.i142 ], !dbg !887
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i142 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i143.lcssa, !dbg !902
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !903
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !871)
    #dbg_value(i32 %i.0.i143.lcssa, !875, !DIExpression(), !871)
  br label %while.cond.i137, !dbg !877, !llvm.loop !904

keccak_squeeze.exit:                              ; preds = %while.cond.i137
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i137 ]
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !906
  %pos1.i.i55 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !907
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i55, align 8, !dbg !908
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i50), !dbg !909
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i3), !dbg !910
    #dbg_value(ptr %arrayidx6, !911, !DIExpression(), !921)
    #dbg_value(ptr %buf.i, !923, !DIExpression(), !921)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %buf.i) #4, !dbg !924
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !925
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !926
    #dbg_value(i8 %inc, !772, !DIExpression(), !764)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !927
    #dbg_value(i32 %inc7, !787, !DIExpression(), !764)
  br label %for.cond, !dbg !928, !llvm.loop !929

for.cond8:                                        ; preds = %for.cond8.preheader, %keccak_squeeze.exit180
  %i.1 = phi i32 [ %inc15, %keccak_squeeze.exit180 ], [ 0, %for.cond8.preheader ], !dbg !931
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit180 ], [ 3, %for.cond8.preheader ], !dbg !764
    #dbg_value(i8 %nonce.1, !772, !DIExpression(), !764)
    #dbg_value(i32 %i.1, !787, !DIExpression(), !764)
  %exitcond181 = icmp ne i32 %i.1, 3, !dbg !932
  br i1 %exitcond181, label %for.body10, label %for.cond.i13.preheader, !dbg !794

for.cond.i13.preheader:                           ; preds = %for.cond8
  br label %for.cond.i13, !dbg !934

for.body10:                                       ; preds = %for.cond8
    #dbg_value(i8 %nonce.1, !772, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !764)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !951
    #dbg_value(ptr %arrayidx12, !807, !DIExpression(), !953)
    #dbg_value(ptr %add.ptr, !809, !DIExpression(), !953)
    #dbg_value(i8 %nonce.1, !810, !DIExpression(), !953)
    #dbg_declare(ptr %buf.i1, !811, !DIExpression(), !954)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !955
    #dbg_value(ptr %buf.i1, !819, !DIExpression(), !957)
    #dbg_value(i32 128, !821, !DIExpression(), !957)
    #dbg_value(ptr %add.ptr, !822, !DIExpression(), !957)
    #dbg_value(i8 %nonce.1, !823, !DIExpression(), !957)
    #dbg_declare(ptr %extkey.i, !824, !DIExpression(), !958)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !955
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !959
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !960
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !961
    #dbg_value(ptr %buf.i1, !838, !DIExpression(), !964)
    #dbg_value(i32 128, !840, !DIExpression(), !964)
    #dbg_value(ptr %extkey.i, !841, !DIExpression(), !964)
    #dbg_value(i32 33, !842, !DIExpression(), !964)
    #dbg_declare(ptr %state.i, !843, !DIExpression(), !965)
    #dbg_value(ptr %state.i, !845, !DIExpression(), !966)
    #dbg_value(ptr %extkey.i, !847, !DIExpression(), !966)
    #dbg_value(i32 33, !848, !DIExpression(), !966)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !961
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !967
  store i32 136, ptr %pos.i.i, align 8, !dbg !968
    #dbg_value(i32 0, !851, !DIExpression(), !964)
    #dbg_value(ptr %buf.i1, !852, !DIExpression(), !969)
    #dbg_value(i32 0, !856, !DIExpression(), !969)
    #dbg_value(ptr %state.i, !857, !DIExpression(), !969)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !971)
    #dbg_value(i32 0, !610, !DIExpression(), !971)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !971)
    #dbg_value(i32 136, !612, !DIExpression(), !971)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !971)
    #dbg_value(i32 0, !610, !DIExpression(), !971)
    #dbg_value(i32 128, !840, !DIExpression(), !964)
    #dbg_value(ptr %buf.i1, !838, !DIExpression(), !964)
    #dbg_value(ptr %buf.i1, !860, !DIExpression(), !973)
    #dbg_value(i32 128, !864, !DIExpression(), !973)
    #dbg_value(ptr %state.i, !865, !DIExpression(), !973)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !975
  %3 = load i32, ptr %pos.i1.i, align 8, !dbg !975
    #dbg_value(ptr %buf.i1, !867, !DIExpression(), !976)
    #dbg_value(i32 128, !873, !DIExpression(), !976)
    #dbg_value(ptr %state.i, !874, !DIExpression(), !976)
    #dbg_value(i32 %3, !875, !DIExpression(), !976)
    #dbg_value(i32 136, !876, !DIExpression(), !976)
  br label %while.cond.i151, !dbg !978

while.cond.i151:                                  ; preds = %for.end.i166, %for.body10
  %pos.addr.0.i152 = phi i32 [ %3, %for.body10 ], [ %i.0.i161.lcssa, %for.end.i166 ]
  %outlen.addr.0.i153 = phi i32 [ 128, %for.body10 ], [ %sub3.i168, %for.end.i166 ]
  %out.addr.0.i154 = phi ptr [ %buf.i1, %for.body10 ], [ %out.addr.1.i162.lcssa, %for.end.i166 ]
    #dbg_value(ptr %out.addr.0.i154, !867, !DIExpression(), !976)
    #dbg_value(i32 %outlen.addr.0.i153, !873, !DIExpression(), !976)
    #dbg_value(i32 %pos.addr.0.i152, !875, !DIExpression(), !976)
  %tobool.not.i155 = icmp eq i32 %outlen.addr.0.i153, 0, !dbg !978
  br i1 %tobool.not.i155, label %keccak_squeeze.exit180, label %while.body.i156, !dbg !978

while.body.i156:                                  ; preds = %while.cond.i151
  %cmp.i157 = icmp eq i32 %pos.addr.0.i152, 136, !dbg !979
  br i1 %cmp.i157, label %if.then.i179, label %if.end.i158, !dbg !979

if.then.i179:                                     ; preds = %while.body.i156
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !980
    #dbg_value(i32 0, !875, !DIExpression(), !976)
  br label %if.end.i158, !dbg !981

if.end.i158:                                      ; preds = %if.then.i179, %while.body.i156
  %pos.addr.1.i159 = phi i32 [ 0, %if.then.i179 ], [ %pos.addr.0.i152, %while.body.i156 ]
    #dbg_value(i32 %pos.addr.1.i159, !875, !DIExpression(), !976)
    #dbg_value(i32 %pos.addr.1.i159, !884, !DIExpression(), !976)
  br label %for.cond.i160, !dbg !982

for.cond.i160:                                    ; preds = %for.body.i169, %if.end.i158
  %i.0.i161 = phi i32 [ %pos.addr.1.i159, %if.end.i158 ], [ %inc.i178, %for.body.i169 ], !dbg !983
  %out.addr.1.i162 = phi ptr [ %out.addr.0.i154, %if.end.i158 ], [ %incdec.ptr.i177, %for.body.i169 ]
    #dbg_value(ptr %out.addr.1.i162, !867, !DIExpression(), !976)
    #dbg_value(i32 %i.0.i161, !884, !DIExpression(), !976)
  %cmp1.i163 = icmp ult i32 %i.0.i161, 136, !dbg !984
  %add.i164 = add i32 %pos.addr.1.i159, %outlen.addr.0.i153, !dbg !985
  %cmp2.i165 = icmp ult i32 %i.0.i161, %add.i164, !dbg !985
  %4 = select i1 %cmp1.i163, i1 %cmp2.i165, i1 false, !dbg !985
  br i1 %4, label %for.body.i169, label %for.end.i166, !dbg !986

for.body.i169:                                    ; preds = %for.cond.i160
  %div1.i170 = lshr i32 %i.0.i161, 3, !dbg !987
  %arrayidx.i171 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i170, !dbg !988
  %5 = load i64, ptr %arrayidx.i171, align 8, !dbg !988
  %rem.i172 = shl nuw nsw i32 %i.0.i161, 3, !dbg !989
  %mul.i173 = and i32 %rem.i172, 56, !dbg !989
  %sh_prom.i174 = zext nneg i32 %mul.i173 to i64, !dbg !990
  %shr.i175 = lshr i64 %5, %sh_prom.i174, !dbg !990
  %conv.i176 = trunc i64 %shr.i175 to i8, !dbg !988
    #dbg_value(ptr %out.addr.1.i162, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !976)
  store i8 %conv.i176, ptr %out.addr.1.i162, align 1, !dbg !991
  %incdec.ptr.i177 = getelementptr inbounds nuw i8, ptr %out.addr.1.i162, i32 1, !dbg !992
    #dbg_value(ptr %incdec.ptr.i177, !867, !DIExpression(), !976)
  %inc.i178 = add nuw nsw i32 %i.0.i161, 1, !dbg !993
    #dbg_value(i32 %inc.i178, !884, !DIExpression(), !976)
  br label %for.cond.i160, !dbg !994, !llvm.loop !995

for.end.i166:                                     ; preds = %for.cond.i160
  %i.0.i161.lcssa = phi i32 [ %i.0.i161, %for.cond.i160 ], !dbg !983
  %out.addr.1.i162.lcssa = phi ptr [ %out.addr.1.i162, %for.cond.i160 ]
  %sub.neg.i167 = sub i32 %pos.addr.1.i159, %i.0.i161.lcssa, !dbg !997
  %sub3.i168 = add i32 %sub.neg.i167, %outlen.addr.0.i153, !dbg !998
    #dbg_value(i32 %sub3.i168, !873, !DIExpression(), !976)
    #dbg_value(i32 %i.0.i161.lcssa, !875, !DIExpression(), !976)
  br label %while.cond.i151, !dbg !978, !llvm.loop !999

keccak_squeeze.exit180:                           ; preds = %while.cond.i151
  %pos.addr.0.i152.lcssa = phi i32 [ %pos.addr.0.i152, %while.cond.i151 ]
  %arrayidx12 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !1001
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1002
  store i32 %pos.addr.0.i152.lcssa, ptr %pos1.i.i, align 8, !dbg !1003
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1004
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1005
    #dbg_value(ptr %arrayidx12, !911, !DIExpression(), !1006)
    #dbg_value(ptr %buf.i1, !923, !DIExpression(), !1006)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %buf.i1) #4, !dbg !1008
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !1009
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !1010
    #dbg_value(i8 %inc13, !772, !DIExpression(), !764)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !1011
    #dbg_value(i32 %inc15, !787, !DIExpression(), !764)
  br label %for.cond8, !dbg !1012, !llvm.loop !1013

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit88
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber768_ref_poly_reduce.exit88 ], [ 0, %for.cond.i13.preheader ], !dbg !1015
    #dbg_value(i32 %i.0.i14, !1016, !DIExpression(), !1017)
  %exitcond183 = icmp ne i32 %i.0.i14, 3, !dbg !1018
  br i1 %exitcond183, label %for.body.i16, label %for.cond.i7.preheader, !dbg !934

for.cond.i7.preheader:                            ; preds = %for.cond.i13
  br label %for.cond.i7, !dbg !1020

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i14, !dbg !1022
    #dbg_value(ptr %arrayidx.i17, !1023, !DIExpression(), !1027)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !1029
    #dbg_value(ptr %arrayidx.i17, !1030, !DIExpression(), !1032)
    #dbg_value(i32 0, !1034, !DIExpression(), !1032)
  br label %for.cond.i76, !dbg !1035

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i16
  %i.0.i77 = phi i32 [ 0, %for.body.i16 ], [ %inc.i87, %for.body.i79 ], !dbg !1037
    #dbg_value(i32 %i.0.i77, !1034, !DIExpression(), !1032)
  %exitcond182 = icmp ne i32 %i.0.i77, 256, !dbg !1038
  br i1 %exitcond182, label %for.body.i79, label %pqcrystals_kyber768_ref_poly_reduce.exit88, !dbg !1040

for.body.i79:                                     ; preds = %for.cond.i76
  %arrayidx.i80 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !1041
  %6 = load i16, ptr %arrayidx.i80, align 2, !dbg !1041
    #dbg_value(i16 %6, !1042, !DIExpression(), !1047)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1047)
  %conv.i.i81 = sext i16 %6 to i32, !dbg !1050
  %mul.i.i82 = mul nsw i32 %conv.i.i81, 20159, !dbg !1051
  %add.i.i83 = add nsw i32 %mul.i.i82, 33554432, !dbg !1052
  %shr.i.i84 = ashr i32 %add.i.i83, 26, !dbg !1053
    #dbg_value(i32 %shr.i.i84, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1047)
    #dbg_value(i32 %shr.i.i84, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1047)
  %7 = trunc nsw i32 %shr.i.i84 to i16, !dbg !1055
  %8 = mul i16 %7, -3329, !dbg !1055
  %conv7.i.i85 = add i16 %8, %6, !dbg !1055
  %arrayidx2.i86 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !1056
  store i16 %conv7.i.i85, ptr %arrayidx2.i86, align 2, !dbg !1057
  %inc.i87 = add nuw nsw i32 %i.0.i77, 1, !dbg !1058
    #dbg_value(i32 %inc.i87, !1034, !DIExpression(), !1032)
  br label %for.cond.i76, !dbg !1059, !llvm.loop !1060

pqcrystals_kyber768_ref_poly_reduce.exit88:       ; preds = %for.cond.i76
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !1062
    #dbg_value(i32 %inc.i18, !1016, !DIExpression(), !1017)
  br label %for.cond.i13, !dbg !1063, !llvm.loop !1064

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit75
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber768_ref_poly_reduce.exit75 ], [ 0, %for.cond.i7.preheader ], !dbg !1066
    #dbg_value(i32 %i.0.i8, !1016, !DIExpression(), !1067)
  %exitcond185 = icmp ne i32 %i.0.i8, 3, !dbg !1068
  br i1 %exitcond185, label %for.body.i10, label %for.cond17.preheader, !dbg !1020

for.cond17.preheader:                             ; preds = %for.cond.i7
  br label %for.cond17, !dbg !1069

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.0.i8, !dbg !1071
    #dbg_value(ptr %arrayidx.i11, !1023, !DIExpression(), !1072)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !1074
    #dbg_value(ptr %arrayidx.i11, !1030, !DIExpression(), !1075)
    #dbg_value(i32 0, !1034, !DIExpression(), !1075)
  br label %for.cond.i63, !dbg !1077

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i10
  %i.0.i64 = phi i32 [ 0, %for.body.i10 ], [ %inc.i74, %for.body.i66 ], !dbg !1078
    #dbg_value(i32 %i.0.i64, !1034, !DIExpression(), !1075)
  %exitcond184 = icmp ne i32 %i.0.i64, 256, !dbg !1079
  br i1 %exitcond184, label %for.body.i66, label %pqcrystals_kyber768_ref_poly_reduce.exit75, !dbg !1080

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i64, !dbg !1081
  %9 = load i16, ptr %arrayidx.i67, align 2, !dbg !1081
    #dbg_value(i16 %9, !1042, !DIExpression(), !1082)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1082)
  %conv.i.i68 = sext i16 %9 to i32, !dbg !1084
  %mul.i.i69 = mul nsw i32 %conv.i.i68, 20159, !dbg !1085
  %add.i.i70 = add nsw i32 %mul.i.i69, 33554432, !dbg !1086
  %shr.i.i71 = ashr i32 %add.i.i70, 26, !dbg !1087
    #dbg_value(i32 %shr.i.i71, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1082)
    #dbg_value(i32 %shr.i.i71, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1082)
  %10 = trunc nsw i32 %shr.i.i71 to i16, !dbg !1088
  %11 = mul i16 %10, -3329, !dbg !1088
  %conv7.i.i72 = add i16 %11, %9, !dbg !1088
  %arrayidx2.i73 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i64, !dbg !1089
  store i16 %conv7.i.i72, ptr %arrayidx2.i73, align 2, !dbg !1090
  %inc.i74 = add nuw nsw i32 %i.0.i64, 1, !dbg !1091
    #dbg_value(i32 %inc.i74, !1034, !DIExpression(), !1075)
  br label %for.cond.i63, !dbg !1092, !llvm.loop !1093

pqcrystals_kyber768_ref_poly_reduce.exit75:       ; preds = %for.cond.i63
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !1095
    #dbg_value(i32 %inc.i12, !1016, !DIExpression(), !1067)
  br label %for.cond.i7, !dbg !1096, !llvm.loop !1097

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber768_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber768_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !1099
    #dbg_value(i32 %i.2, !787, !DIExpression(), !764)
  %exitcond187 = icmp ne i32 %i.2, 3, !dbg !1100
  br i1 %exitcond187, label %for.body19, label %for.cond.i27.preheader, !dbg !1069

for.cond.i27.preheader:                           ; preds = %for.cond17
  br label %for.cond.i27, !dbg !1102

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1110
  %arrayidx22 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !1112
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !1113
  %arrayidx24 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1114
    #dbg_value(ptr %arrayidx24, !1115, !DIExpression(), !1117)
    #dbg_value(i16 1353, !1119, !DIExpression(), !1117)
    #dbg_value(i32 0, !1120, !DIExpression(), !1117)
  br label %for.cond.i89, !dbg !1121

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !1123
    #dbg_value(i32 %i.0.i90, !1120, !DIExpression(), !1117)
  %exitcond186 = icmp ne i32 %i.0.i90, 256, !dbg !1124
  br i1 %exitcond186, label %for.body.i92, label %pqcrystals_kyber768_ref_poly_tomont.exit, !dbg !1126

for.body.i92:                                     ; preds = %for.cond.i89
  %arrayidx.i93 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1127
  %12 = load i16, ptr %arrayidx.i93, align 2, !dbg !1127
  %conv.i = sext i16 %12 to i32, !dbg !1128
  %mul.i94 = mul nsw i32 %conv.i, 1353, !dbg !1129
    #dbg_value(i32 %mul.i94, !1130, !DIExpression(), !1133)
    #dbg_value(i32 %mul.i94, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1133)
  %sext.i.i = mul i32 %conv.i, 1346961408, !dbg !1136
  %conv3.i.i = ashr exact i32 %sext.i.i, 16, !dbg !1136
  %mul4.neg.i.i = mul nsw i32 %conv3.i.i, -3329, !dbg !1137
  %sub.i.i = add nsw i32 %mul4.neg.i.i, %mul.i94, !dbg !1138
  %shr.i.i95 = lshr i32 %sub.i.i, 16, !dbg !1139
  %conv5.i.i = trunc nuw i32 %shr.i.i95 to i16, !dbg !1140
    #dbg_value(i16 %conv5.i.i, !1135, !DIExpression(), !1133)
  %arrayidx2.i96 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1141
  store i16 %conv5.i.i, ptr %arrayidx2.i96, align 2, !dbg !1142
  %inc.i97 = add nuw nsw i32 %i.0.i90, 1, !dbg !1143
    #dbg_value(i32 %inc.i97, !1120, !DIExpression(), !1117)
  br label %for.cond.i89, !dbg !1144, !llvm.loop !1145

pqcrystals_kyber768_ref_poly_tomont.exit:         ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !1147
    #dbg_value(i32 %inc26, !787, !DIExpression(), !764)
  br label %for.cond17, !dbg !1148, !llvm.loop !1149

for.cond.i27:                                     ; preds = %for.cond.i27.preheader, %pqcrystals_kyber768_ref_poly_add.exit
  %i.0.i28 = phi i32 [ %inc.i32, %pqcrystals_kyber768_ref_poly_add.exit ], [ 0, %for.cond.i27.preheader ], !dbg !1151
    #dbg_value(i32 %i.0.i28, !1152, !DIExpression(), !1153)
  %exitcond189 = icmp ne i32 %i.0.i28, 3, !dbg !1154
  br i1 %exitcond189, label %for.body.i30, label %for.cond.i.preheader, !dbg !1102

for.cond.i.preheader:                             ; preds = %for.cond.i27
  br label %for.cond.i, !dbg !1156

for.body.i30:                                     ; preds = %for.cond.i27
  %arrayidx.i31 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1160
  %arrayidx2.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1161
  %arrayidx4.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.0.i28, !dbg !1162
    #dbg_value(ptr %arrayidx.i31, !1163, !DIExpression(), !1169)
    #dbg_value(ptr %arrayidx2.i, !1171, !DIExpression(), !1169)
    #dbg_value(ptr %arrayidx4.i, !1172, !DIExpression(), !1169)
    #dbg_value(i32 0, !1173, !DIExpression(), !1169)
  br label %for.cond.i42, !dbg !1174

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i30
  %i.0.i43 = phi i32 [ 0, %for.body.i30 ], [ %inc.i48, %for.body.i45 ], !dbg !1176
    #dbg_value(i32 %i.0.i43, !1173, !DIExpression(), !1169)
  %exitcond188 = icmp ne i32 %i.0.i43, 256, !dbg !1177
  br i1 %exitcond188, label %for.body.i45, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !1179

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i43, !dbg !1180
  %13 = load i16, ptr %arrayidx.i46, align 2, !dbg !1180
  %arrayidx2.i47 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i43, !dbg !1181
  %14 = load i16, ptr %arrayidx2.i47, align 2, !dbg !1181
  %add.i = add i16 %13, %14, !dbg !1182
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i31, i32 0, i32 %i.0.i43, !dbg !1183
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1184
  %inc.i48 = add nuw nsw i32 %i.0.i43, 1, !dbg !1185
    #dbg_value(i32 %inc.i48, !1173, !DIExpression(), !1169)
  br label %for.cond.i42, !dbg !1186, !llvm.loop !1187

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i42
  %inc.i32 = add nuw nsw i32 %i.0.i28, 1, !dbg !1189
    #dbg_value(i32 %inc.i32, !1152, !DIExpression(), !1153)
  br label %for.cond.i27, !dbg !1190, !llvm.loop !1191

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1193
    #dbg_value(i32 %i.0.i, !1194, !DIExpression(), !1195)
  %exitcond191 = icmp ne i32 %i.0.i, 3, !dbg !1196
  br i1 %exitcond191, label %for.body.i, label %for.cond.i33.preheader, !dbg !1156

for.cond.i33.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i33, !dbg !1198

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !1208
    #dbg_value(ptr %arrayidx.i6, !1030, !DIExpression(), !1209)
    #dbg_value(i32 0, !1034, !DIExpression(), !1209)
  br label %for.cond.i56, !dbg !1211

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i
  %i.0.i57 = phi i32 [ 0, %for.body.i ], [ %inc.i62, %for.body.i59 ], !dbg !1212
    #dbg_value(i32 %i.0.i57, !1034, !DIExpression(), !1209)
  %exitcond190 = icmp ne i32 %i.0.i57, 256, !dbg !1213
  br i1 %exitcond190, label %for.body.i59, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1214

for.body.i59:                                     ; preds = %for.cond.i56
  %arrayidx.i60 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i57, !dbg !1215
  %15 = load i16, ptr %arrayidx.i60, align 2, !dbg !1215
    #dbg_value(i16 %15, !1042, !DIExpression(), !1216)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1216)
  %conv.i.i = sext i16 %15 to i32, !dbg !1218
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1219
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1220
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1221
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1216)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1216)
  %16 = trunc nsw i32 %shr.i.i to i16, !dbg !1222
  %17 = mul i16 %16, -3329, !dbg !1222
  %conv7.i.i = add i16 %17, %15, !dbg !1222
  %arrayidx2.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i57, !dbg !1223
  store i16 %conv7.i.i, ptr %arrayidx2.i61, align 2, !dbg !1224
  %inc.i62 = add nuw nsw i32 %i.0.i57, 1, !dbg !1225
    #dbg_value(i32 %inc.i62, !1034, !DIExpression(), !1209)
  br label %for.cond.i56, !dbg !1226, !llvm.loop !1227

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i56
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1229
    #dbg_value(i32 %inc.i, !1194, !DIExpression(), !1195)
  br label %for.cond.i, !dbg !1230, !llvm.loop !1231

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !1233
    #dbg_value(i32 %i.0.i34, !1234, !DIExpression(), !1235)
  %exitcond192 = icmp ne i32 %i.0.i34, 3, !dbg !1236
  br i1 %exitcond192, label %for.body.i36, label %for.cond.i20.preheader, !dbg !1198

for.cond.i20.preheader:                           ; preds = %for.cond.i33
  br label %for.cond.i20, !dbg !1238

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1244
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i37, !dbg !1245
  %arrayidx.i39 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i34, !dbg !1246
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1247
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1248
    #dbg_value(i32 %inc.i40, !1234, !DIExpression(), !1235)
  br label %for.cond.i33, !dbg !1249, !llvm.loop !1250

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %for.body.i23
  %i.0.i21 = phi i32 [ %inc.i26, %for.body.i23 ], [ 0, %for.cond.i20.preheader ], !dbg !1252
    #dbg_value(i32 %i.0.i21, !1234, !DIExpression(), !1253)
  %exitcond193 = icmp ne i32 %i.0.i21, 3, !dbg !1254
  br i1 %exitcond193, label %for.body.i23, label %pqcrystals_kyber768_ref_polyvec_tobytes.exit, !dbg !1238

for.body.i23:                                     ; preds = %for.cond.i20
  %mul.i = mul nuw nsw i32 %i.0.i21, 384, !dbg !1255
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1256
  %arrayidx.i25 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i21, !dbg !1257
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr.i24, ptr noundef nonnull %arrayidx.i25) #4, !dbg !1258
  %inc.i26 = add nuw nsw i32 %i.0.i21, 1, !dbg !1259
    #dbg_value(i32 %inc.i26, !1234, !DIExpression(), !1253)
  br label %for.cond.i20, !dbg !1260, !llvm.loop !1261

pqcrystals_kyber768_ref_polyvec_tobytes.exit:     ; preds = %for.cond.i20
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1152, !dbg !1263
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1264
  ret void, !dbg !1265
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1266 {
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
    #dbg_value(ptr %c, !1269, !DIExpression(), !1270)
    #dbg_value(ptr %m, !1271, !DIExpression(), !1270)
    #dbg_value(ptr %pk, !1272, !DIExpression(), !1270)
    #dbg_value(ptr %coins, !1273, !DIExpression(), !1270)
    #dbg_declare(ptr %seed, !1274, !DIExpression(), !1275)
    #dbg_value(i8 0, !1276, !DIExpression(), !1270)
    #dbg_declare(ptr %sp, !1277, !DIExpression(), !1278)
    #dbg_declare(ptr %pkpv, !1279, !DIExpression(), !1280)
    #dbg_declare(ptr %ep, !1281, !DIExpression(), !1282)
    #dbg_declare(ptr %at, !1283, !DIExpression(), !1284)
    #dbg_declare(ptr %b, !1285, !DIExpression(), !1286)
    #dbg_declare(ptr %v, !1287, !DIExpression(), !1288)
    #dbg_declare(ptr %k, !1289, !DIExpression(), !1290)
    #dbg_declare(ptr %epp, !1291, !DIExpression(), !1292)
    #dbg_value(ptr %pkpv, !1293, !DIExpression(), !1297)
    #dbg_value(ptr %seed, !1299, !DIExpression(), !1297)
    #dbg_value(ptr %pk, !1300, !DIExpression(), !1297)
    #dbg_value(ptr %pkpv, !1301, !DIExpression(), !1305)
    #dbg_value(ptr %pk, !1307, !DIExpression(), !1305)
    #dbg_value(i32 0, !1308, !DIExpression(), !1305)
  br label %for.cond.i30, !dbg !1309

for.cond.i30:                                     ; preds = %for.body.i33, %entry
  %i.0.i31 = phi i32 [ 0, %entry ], [ %inc.i36, %for.body.i33 ], !dbg !1311
    #dbg_value(i32 %i.0.i31, !1308, !DIExpression(), !1305)
  %exitcond = icmp ne i32 %i.0.i31, 3, !dbg !1312
  br i1 %exitcond, label %for.body.i33, label %pqcrystals_kyber768_ref_polyvec_frombytes.exit, !dbg !1314

for.body.i33:                                     ; preds = %for.cond.i30
  %arrayidx.i34 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i31, !dbg !1315
  %mul.i = mul nuw nsw i32 %i.0.i31, 384, !dbg !1316
  %add.ptr.i35 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1317
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i34, ptr noundef %add.ptr.i35) #4, !dbg !1318
  %inc.i36 = add nuw nsw i32 %i.0.i31, 1, !dbg !1319
    #dbg_value(i32 %inc.i36, !1308, !DIExpression(), !1305)
  br label %for.cond.i30, !dbg !1320, !llvm.loop !1321

pqcrystals_kyber768_ref_polyvec_frombytes.exit:   ; preds = %for.cond.i30
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1152, !dbg !1323
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i, i32 noundef 32) #5, !dbg !1324
    #dbg_value(ptr %k, !1325, !DIExpression(), !1329)
    #dbg_value(ptr %m, !1331, !DIExpression(), !1329)
    #dbg_value(i32 0, !1332, !DIExpression(), !1329)
  br label %for.cond.i110, !dbg !1333

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber768_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1335
    #dbg_value(i32 %i.0.i111, !1332, !DIExpression(), !1329)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1336
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber768_ref_poly_frommsg.exit, !dbg !1338

for.cond1.i.preheader:                            ; preds = %for.cond.i110
  br label %for.cond1.i, !dbg !1339

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ %inc.i117, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1342
    #dbg_value(i32 %j.0.i, !1343, !DIExpression(), !1329)
  %exitcond262 = icmp ne i32 %j.0.i, 8, !dbg !1344
  br i1 %exitcond262, label %for.body3.i, label %for.inc9.i, !dbg !1339

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i113 = shl nuw nsw i32 %i.0.i111, 3, !dbg !1346
  %add.i114 = or disjoint i32 %mul.i113, %j.0.i, !dbg !1348
  %arrayidx.i115 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %add.i114, !dbg !1349
  store i16 0, ptr %arrayidx.i115, align 2, !dbg !1350
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i111, 4, !dbg !1351
  %add.ptr.i116 = getelementptr inbounds nuw i8, ptr %k, i32 %add.ptr.idx.i, !dbg !1351
  %add.ptr6.i = getelementptr inbounds nuw i16, ptr %add.ptr.i116, i32 %j.0.i, !dbg !1352
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i111, !dbg !1353
  %0 = load i8, ptr %arrayidx7.i, align 1, !dbg !1353
  %conv.i = zext i8 %0 to i32, !dbg !1353
    #dbg_value(ptr %add.ptr6.i, !1354, !DIExpression(), !1358)
    #dbg_value(i16 1665, !1360, !DIExpression(), !1358)
    #dbg_value(!DIArgList(i32 %conv.i, i32 %j.0.i), !1361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !1358)
    #dbg_value(!DIArgList(i16 0, i32 %conv.i, i32 %j.0.i), !1361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !1358)
  %1 = load i16, ptr %add.ptr6.i, align 2, !dbg !1362
  %2 = shl nuw nsw i32 1, %j.0.i, !dbg !1363
  %3 = and i32 %2, %conv.i, !dbg !1363
  %4 = icmp eq i32 %3, 0, !dbg !1363
  %xor6.i.i = select i1 %4, i16 %1, i16 1665, !dbg !1364
  store i16 %xor6.i.i, ptr %add.ptr6.i, align 2, !dbg !1364
  %inc.i117 = add nuw nsw i32 %j.0.i, 1, !dbg !1365
    #dbg_value(i32 %inc.i117, !1343, !DIExpression(), !1329)
  br label %for.cond1.i, !dbg !1366, !llvm.loop !1367

for.inc9.i:                                       ; preds = %for.cond1.i
  %inc10.i = add nuw nsw i32 %i.0.i111, 1, !dbg !1369
    #dbg_value(i32 %inc10.i, !1332, !DIExpression(), !1329)
  br label %for.cond.i110, !dbg !1370, !llvm.loop !1371

pqcrystals_kyber768_ref_poly_frommsg.exit:        ; preds = %for.cond.i110
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1373
    #dbg_value(i32 0, !1374, !DIExpression(), !1270)
  br label %for.cond, !dbg !1375

for.cond:                                         ; preds = %keccak_squeeze.exit230, %pqcrystals_kyber768_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber768_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit230 ], !dbg !1377
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber768_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit230 ], !dbg !1270
    #dbg_value(i8 %nonce.0, !1276, !DIExpression(), !1270)
    #dbg_value(i32 %i.0, !1374, !DIExpression(), !1270)
  %exitcond264 = icmp ne i32 %i.0, 3, !dbg !1378
  br i1 %exitcond264, label %for.body, label %for.cond5.preheader, !dbg !1380

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !1381

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !1276, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1270)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !1383
    #dbg_value(ptr %add.ptr, !807, !DIExpression(), !1385)
    #dbg_value(ptr %coins, !809, !DIExpression(), !1385)
    #dbg_value(i8 %nonce.0, !810, !DIExpression(), !1385)
    #dbg_declare(ptr %buf.i1, !811, !DIExpression(), !1386)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1387
    #dbg_value(ptr %buf.i1, !819, !DIExpression(), !1389)
    #dbg_value(i32 128, !821, !DIExpression(), !1389)
    #dbg_value(ptr %coins, !822, !DIExpression(), !1389)
    #dbg_value(i8 %nonce.0, !823, !DIExpression(), !1389)
    #dbg_declare(ptr %extkey.i8, !824, !DIExpression(), !1390)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1387
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1391
  store i8 %nonce.0, ptr %arrayidx.i10, align 1, !dbg !1392
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i65), !dbg !1393
    #dbg_value(ptr %buf.i1, !838, !DIExpression(), !1396)
    #dbg_value(i32 128, !840, !DIExpression(), !1396)
    #dbg_value(ptr %extkey.i8, !841, !DIExpression(), !1396)
    #dbg_value(i32 33, !842, !DIExpression(), !1396)
    #dbg_declare(ptr %state.i65, !843, !DIExpression(), !1397)
    #dbg_value(ptr %state.i65, !845, !DIExpression(), !1398)
    #dbg_value(ptr %extkey.i8, !847, !DIExpression(), !1398)
    #dbg_value(i32 33, !848, !DIExpression(), !1398)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i65, i32 noundef 136, ptr noundef nonnull %extkey.i8, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1393
  %pos.i.i66 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1399
  store i32 136, ptr %pos.i.i66, align 8, !dbg !1400
    #dbg_value(i32 0, !851, !DIExpression(), !1396)
    #dbg_value(ptr %buf.i1, !852, !DIExpression(), !1401)
    #dbg_value(i32 0, !856, !DIExpression(), !1401)
    #dbg_value(ptr %state.i65, !857, !DIExpression(), !1401)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !1403)
    #dbg_value(i32 0, !610, !DIExpression(), !1403)
    #dbg_value(ptr %state.i65, !611, !DIExpression(), !1403)
    #dbg_value(i32 136, !612, !DIExpression(), !1403)
    #dbg_value(ptr %buf.i1, !603, !DIExpression(), !1403)
    #dbg_value(i32 0, !610, !DIExpression(), !1403)
    #dbg_value(i32 128, !840, !DIExpression(), !1396)
    #dbg_value(ptr %buf.i1, !838, !DIExpression(), !1396)
    #dbg_value(ptr %buf.i1, !860, !DIExpression(), !1405)
    #dbg_value(i32 128, !864, !DIExpression(), !1405)
    #dbg_value(ptr %state.i65, !865, !DIExpression(), !1405)
  %pos.i1.i68 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1407
  %5 = load i32, ptr %pos.i1.i68, align 8, !dbg !1407
    #dbg_value(ptr %buf.i1, !867, !DIExpression(), !1408)
    #dbg_value(i32 128, !873, !DIExpression(), !1408)
    #dbg_value(ptr %state.i65, !874, !DIExpression(), !1408)
    #dbg_value(i32 %5, !875, !DIExpression(), !1408)
    #dbg_value(i32 136, !876, !DIExpression(), !1408)
  br label %while.cond.i201, !dbg !1410

while.cond.i201:                                  ; preds = %for.end.i216, %for.body
  %pos.addr.0.i202 = phi i32 [ %5, %for.body ], [ %i.0.i211.lcssa, %for.end.i216 ]
  %outlen.addr.0.i203 = phi i32 [ 128, %for.body ], [ %sub3.i218, %for.end.i216 ]
  %out.addr.0.i204 = phi ptr [ %buf.i1, %for.body ], [ %out.addr.1.i212.lcssa, %for.end.i216 ]
    #dbg_value(ptr %out.addr.0.i204, !867, !DIExpression(), !1408)
    #dbg_value(i32 %outlen.addr.0.i203, !873, !DIExpression(), !1408)
    #dbg_value(i32 %pos.addr.0.i202, !875, !DIExpression(), !1408)
  %tobool.not.i205 = icmp eq i32 %outlen.addr.0.i203, 0, !dbg !1410
  br i1 %tobool.not.i205, label %keccak_squeeze.exit230, label %while.body.i206, !dbg !1410

while.body.i206:                                  ; preds = %while.cond.i201
  %cmp.i207 = icmp eq i32 %pos.addr.0.i202, 136, !dbg !1411
  br i1 %cmp.i207, label %if.then.i229, label %if.end.i208, !dbg !1411

if.then.i229:                                     ; preds = %while.body.i206
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1412
    #dbg_value(i32 0, !875, !DIExpression(), !1408)
  br label %if.end.i208, !dbg !1413

if.end.i208:                                      ; preds = %if.then.i229, %while.body.i206
  %pos.addr.1.i209 = phi i32 [ 0, %if.then.i229 ], [ %pos.addr.0.i202, %while.body.i206 ]
    #dbg_value(i32 %pos.addr.1.i209, !875, !DIExpression(), !1408)
    #dbg_value(i32 %pos.addr.1.i209, !884, !DIExpression(), !1408)
  br label %for.cond.i210, !dbg !1414

for.cond.i210:                                    ; preds = %for.body.i219, %if.end.i208
  %i.0.i211 = phi i32 [ %pos.addr.1.i209, %if.end.i208 ], [ %inc.i228, %for.body.i219 ], !dbg !1415
  %out.addr.1.i212 = phi ptr [ %out.addr.0.i204, %if.end.i208 ], [ %incdec.ptr.i227, %for.body.i219 ]
    #dbg_value(ptr %out.addr.1.i212, !867, !DIExpression(), !1408)
    #dbg_value(i32 %i.0.i211, !884, !DIExpression(), !1408)
  %cmp1.i213 = icmp ult i32 %i.0.i211, 136, !dbg !1416
  %add.i214 = add i32 %pos.addr.1.i209, %outlen.addr.0.i203, !dbg !1417
  %cmp2.i215 = icmp ult i32 %i.0.i211, %add.i214, !dbg !1417
  %6 = select i1 %cmp1.i213, i1 %cmp2.i215, i1 false, !dbg !1417
  br i1 %6, label %for.body.i219, label %for.end.i216, !dbg !1418

for.body.i219:                                    ; preds = %for.cond.i210
  %div1.i220 = lshr i32 %i.0.i211, 3, !dbg !1419
  %arrayidx.i221 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %div1.i220, !dbg !1420
  %7 = load i64, ptr %arrayidx.i221, align 8, !dbg !1420
  %rem.i222 = shl nuw nsw i32 %i.0.i211, 3, !dbg !1421
  %mul.i223 = and i32 %rem.i222, 56, !dbg !1421
  %sh_prom.i224 = zext nneg i32 %mul.i223 to i64, !dbg !1422
  %shr.i225 = lshr i64 %7, %sh_prom.i224, !dbg !1422
  %conv.i226 = trunc i64 %shr.i225 to i8, !dbg !1420
    #dbg_value(ptr %out.addr.1.i212, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1408)
  store i8 %conv.i226, ptr %out.addr.1.i212, align 1, !dbg !1423
  %incdec.ptr.i227 = getelementptr inbounds nuw i8, ptr %out.addr.1.i212, i32 1, !dbg !1424
    #dbg_value(ptr %incdec.ptr.i227, !867, !DIExpression(), !1408)
  %inc.i228 = add nuw nsw i32 %i.0.i211, 1, !dbg !1425
    #dbg_value(i32 %inc.i228, !884, !DIExpression(), !1408)
  br label %for.cond.i210, !dbg !1426, !llvm.loop !1427

for.end.i216:                                     ; preds = %for.cond.i210
  %i.0.i211.lcssa = phi i32 [ %i.0.i211, %for.cond.i210 ], !dbg !1415
  %out.addr.1.i212.lcssa = phi ptr [ %out.addr.1.i212, %for.cond.i210 ]
  %sub.neg.i217 = sub i32 %pos.addr.1.i209, %i.0.i211.lcssa, !dbg !1429
  %sub3.i218 = add i32 %sub.neg.i217, %outlen.addr.0.i203, !dbg !1430
    #dbg_value(i32 %sub3.i218, !873, !DIExpression(), !1408)
    #dbg_value(i32 %i.0.i211.lcssa, !875, !DIExpression(), !1408)
  br label %while.cond.i201, !dbg !1410, !llvm.loop !1431

keccak_squeeze.exit230:                           ; preds = %while.cond.i201
  %pos.addr.0.i202.lcssa = phi i32 [ %pos.addr.0.i202, %while.cond.i201 ]
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !1433
  %pos1.i.i70 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1434
  store i32 %pos.addr.0.i202.lcssa, ptr %pos1.i.i70, align 8, !dbg !1435
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i65), !dbg !1436
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1437
    #dbg_value(ptr %add.ptr, !911, !DIExpression(), !1438)
    #dbg_value(ptr %buf.i1, !923, !DIExpression(), !1438)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr, ptr noundef nonnull %buf.i1) #4, !dbg !1440
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !1441
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !1442
    #dbg_value(i8 %inc, !1276, !DIExpression(), !1270)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !1443
    #dbg_value(i32 %inc4, !1374, !DIExpression(), !1270)
  br label %for.cond, !dbg !1444, !llvm.loop !1445

for.cond5:                                        ; preds = %for.cond5.preheader, %keccak_squeeze.exit260
  %i.1 = phi i32 [ %inc13, %keccak_squeeze.exit260 ], [ 0, %for.cond5.preheader ], !dbg !1447
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit260 ], [ 3, %for.cond5.preheader ], !dbg !1270
    #dbg_value(i8 %nonce.1, !1276, !DIExpression(), !1270)
    #dbg_value(i32 %i.1, !1374, !DIExpression(), !1270)
  %exitcond265 = icmp ne i32 %i.1, 3, !dbg !1448
  br i1 %exitcond265, label %for.body7, label %for.end14, !dbg !1381

for.body7:                                        ; preds = %for.cond5
    #dbg_value(i8 %nonce.1, !1276, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1270)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i2), !dbg !1450
    #dbg_value(ptr %add.ptr10, !1453, !DIExpression(), !1454)
    #dbg_value(ptr %coins, !1455, !DIExpression(), !1454)
    #dbg_value(i8 %nonce.1, !1456, !DIExpression(), !1454)
    #dbg_declare(ptr %buf.i2, !1457, !DIExpression(), !1458)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !1459
    #dbg_value(ptr %buf.i2, !819, !DIExpression(), !1461)
    #dbg_value(i32 128, !821, !DIExpression(), !1461)
    #dbg_value(ptr %coins, !822, !DIExpression(), !1461)
    #dbg_value(i8 %nonce.1, !823, !DIExpression(), !1461)
    #dbg_declare(ptr %extkey.i, !824, !DIExpression(), !1462)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %coins, i32 noundef 32) #5, !dbg !1459
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !1463
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !1464
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !1465
    #dbg_value(ptr %buf.i2, !838, !DIExpression(), !1468)
    #dbg_value(i32 128, !840, !DIExpression(), !1468)
    #dbg_value(ptr %extkey.i, !841, !DIExpression(), !1468)
    #dbg_value(i32 33, !842, !DIExpression(), !1468)
    #dbg_declare(ptr %state.i, !843, !DIExpression(), !1469)
    #dbg_value(ptr %state.i, !845, !DIExpression(), !1470)
    #dbg_value(ptr %extkey.i, !847, !DIExpression(), !1470)
    #dbg_value(i32 33, !848, !DIExpression(), !1470)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1465
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1471
  store i32 136, ptr %pos.i.i, align 8, !dbg !1472
    #dbg_value(i32 0, !851, !DIExpression(), !1468)
    #dbg_value(ptr %buf.i2, !852, !DIExpression(), !1473)
    #dbg_value(i32 0, !856, !DIExpression(), !1473)
    #dbg_value(ptr %state.i, !857, !DIExpression(), !1473)
    #dbg_value(ptr %buf.i2, !603, !DIExpression(), !1475)
    #dbg_value(i32 0, !610, !DIExpression(), !1475)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !1475)
    #dbg_value(i32 136, !612, !DIExpression(), !1475)
    #dbg_value(ptr %buf.i2, !603, !DIExpression(), !1475)
    #dbg_value(i32 0, !610, !DIExpression(), !1475)
    #dbg_value(i32 128, !840, !DIExpression(), !1468)
    #dbg_value(ptr %buf.i2, !838, !DIExpression(), !1468)
    #dbg_value(ptr %buf.i2, !860, !DIExpression(), !1477)
    #dbg_value(i32 128, !864, !DIExpression(), !1477)
    #dbg_value(ptr %state.i, !865, !DIExpression(), !1477)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1479
  %8 = load i32, ptr %pos.i1.i, align 8, !dbg !1479
    #dbg_value(ptr %buf.i2, !867, !DIExpression(), !1480)
    #dbg_value(i32 128, !873, !DIExpression(), !1480)
    #dbg_value(ptr %state.i, !874, !DIExpression(), !1480)
    #dbg_value(i32 %8, !875, !DIExpression(), !1480)
    #dbg_value(i32 136, !876, !DIExpression(), !1480)
  br label %while.cond.i231, !dbg !1482

while.cond.i231:                                  ; preds = %for.end.i246, %for.body7
  %pos.addr.0.i232 = phi i32 [ %8, %for.body7 ], [ %i.0.i241.lcssa, %for.end.i246 ]
  %outlen.addr.0.i233 = phi i32 [ 128, %for.body7 ], [ %sub3.i248, %for.end.i246 ]
  %out.addr.0.i234 = phi ptr [ %buf.i2, %for.body7 ], [ %out.addr.1.i242.lcssa, %for.end.i246 ]
    #dbg_value(ptr %out.addr.0.i234, !867, !DIExpression(), !1480)
    #dbg_value(i32 %outlen.addr.0.i233, !873, !DIExpression(), !1480)
    #dbg_value(i32 %pos.addr.0.i232, !875, !DIExpression(), !1480)
  %tobool.not.i235 = icmp eq i32 %outlen.addr.0.i233, 0, !dbg !1482
  br i1 %tobool.not.i235, label %keccak_squeeze.exit260, label %while.body.i236, !dbg !1482

while.body.i236:                                  ; preds = %while.cond.i231
  %cmp.i237 = icmp eq i32 %pos.addr.0.i232, 136, !dbg !1483
  br i1 %cmp.i237, label %if.then.i259, label %if.end.i238, !dbg !1483

if.then.i259:                                     ; preds = %while.body.i236
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !1484
    #dbg_value(i32 0, !875, !DIExpression(), !1480)
  br label %if.end.i238, !dbg !1485

if.end.i238:                                      ; preds = %if.then.i259, %while.body.i236
  %pos.addr.1.i239 = phi i32 [ 0, %if.then.i259 ], [ %pos.addr.0.i232, %while.body.i236 ]
    #dbg_value(i32 %pos.addr.1.i239, !875, !DIExpression(), !1480)
    #dbg_value(i32 %pos.addr.1.i239, !884, !DIExpression(), !1480)
  br label %for.cond.i240, !dbg !1486

for.cond.i240:                                    ; preds = %for.body.i249, %if.end.i238
  %i.0.i241 = phi i32 [ %pos.addr.1.i239, %if.end.i238 ], [ %inc.i258, %for.body.i249 ], !dbg !1487
  %out.addr.1.i242 = phi ptr [ %out.addr.0.i234, %if.end.i238 ], [ %incdec.ptr.i257, %for.body.i249 ]
    #dbg_value(ptr %out.addr.1.i242, !867, !DIExpression(), !1480)
    #dbg_value(i32 %i.0.i241, !884, !DIExpression(), !1480)
  %cmp1.i243 = icmp ult i32 %i.0.i241, 136, !dbg !1488
  %add.i244 = add i32 %pos.addr.1.i239, %outlen.addr.0.i233, !dbg !1489
  %cmp2.i245 = icmp ult i32 %i.0.i241, %add.i244, !dbg !1489
  %9 = select i1 %cmp1.i243, i1 %cmp2.i245, i1 false, !dbg !1489
  br i1 %9, label %for.body.i249, label %for.end.i246, !dbg !1490

for.body.i249:                                    ; preds = %for.cond.i240
  %div1.i250 = lshr i32 %i.0.i241, 3, !dbg !1491
  %arrayidx.i251 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i250, !dbg !1492
  %10 = load i64, ptr %arrayidx.i251, align 8, !dbg !1492
  %rem.i252 = shl nuw nsw i32 %i.0.i241, 3, !dbg !1493
  %mul.i253 = and i32 %rem.i252, 56, !dbg !1493
  %sh_prom.i254 = zext nneg i32 %mul.i253 to i64, !dbg !1494
  %shr.i255 = lshr i64 %10, %sh_prom.i254, !dbg !1494
  %conv.i256 = trunc i64 %shr.i255 to i8, !dbg !1492
    #dbg_value(ptr %out.addr.1.i242, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1480)
  store i8 %conv.i256, ptr %out.addr.1.i242, align 1, !dbg !1495
  %incdec.ptr.i257 = getelementptr inbounds nuw i8, ptr %out.addr.1.i242, i32 1, !dbg !1496
    #dbg_value(ptr %incdec.ptr.i257, !867, !DIExpression(), !1480)
  %inc.i258 = add nuw nsw i32 %i.0.i241, 1, !dbg !1497
    #dbg_value(i32 %inc.i258, !884, !DIExpression(), !1480)
  br label %for.cond.i240, !dbg !1498, !llvm.loop !1499

for.end.i246:                                     ; preds = %for.cond.i240
  %i.0.i241.lcssa = phi i32 [ %i.0.i241, %for.cond.i240 ], !dbg !1487
  %out.addr.1.i242.lcssa = phi ptr [ %out.addr.1.i242, %for.cond.i240 ]
  %sub.neg.i247 = sub i32 %pos.addr.1.i239, %i.0.i241.lcssa, !dbg !1501
  %sub3.i248 = add i32 %sub.neg.i247, %outlen.addr.0.i233, !dbg !1502
    #dbg_value(i32 %sub3.i248, !873, !DIExpression(), !1480)
    #dbg_value(i32 %i.0.i241.lcssa, !875, !DIExpression(), !1480)
  br label %while.cond.i231, !dbg !1482, !llvm.loop !1503

keccak_squeeze.exit260:                           ; preds = %while.cond.i231
  %pos.addr.0.i232.lcssa = phi i32 [ %pos.addr.0.i232, %while.cond.i231 ]
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !1505
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1506
  store i32 %pos.addr.0.i232.lcssa, ptr %pos1.i.i, align 8, !dbg !1507
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1508
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1509
    #dbg_value(ptr %add.ptr10, !1510, !DIExpression(), !1512)
    #dbg_value(ptr %buf.i2, !1514, !DIExpression(), !1512)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr10, ptr noundef nonnull %buf.i2) #4, !dbg !1515
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i2), !dbg !1516
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !1517
    #dbg_value(i8 %inc11, !1276, !DIExpression(), !1270)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !1518
    #dbg_value(i32 %inc13, !1374, !DIExpression(), !1270)
  br label %for.cond5, !dbg !1519, !llvm.loop !1520

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !1276, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1270)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !1522
    #dbg_value(ptr %epp, !1453, !DIExpression(), !1524)
    #dbg_value(ptr %coins, !1455, !DIExpression(), !1524)
    #dbg_value(i8 6, !1456, !DIExpression(), !1524)
    #dbg_declare(ptr %buf.i, !1457, !DIExpression(), !1525)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1526
    #dbg_value(ptr %buf.i, !819, !DIExpression(), !1528)
    #dbg_value(i32 128, !821, !DIExpression(), !1528)
    #dbg_value(ptr %coins, !822, !DIExpression(), !1528)
    #dbg_value(i8 6, !823, !DIExpression(), !1528)
    #dbg_declare(ptr %extkey.i5, !824, !DIExpression(), !1529)
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %extkey.i5, ptr noundef %coins, i32 noundef 32) #5, !dbg !1526
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %extkey.i5, i32 32, !dbg !1530
  store i8 6, ptr %arrayidx.i7, align 1, !dbg !1531
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i71), !dbg !1532
    #dbg_value(ptr %buf.i, !838, !DIExpression(), !1535)
    #dbg_value(i32 128, !840, !DIExpression(), !1535)
    #dbg_value(ptr %extkey.i5, !841, !DIExpression(), !1535)
    #dbg_value(i32 33, !842, !DIExpression(), !1535)
    #dbg_declare(ptr %state.i71, !843, !DIExpression(), !1536)
    #dbg_value(ptr %state.i71, !845, !DIExpression(), !1537)
    #dbg_value(ptr %extkey.i5, !847, !DIExpression(), !1537)
    #dbg_value(i32 33, !848, !DIExpression(), !1537)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i71, i32 noundef 136, ptr noundef nonnull %extkey.i5, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1532
  %pos.i.i72 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1538
  store i32 136, ptr %pos.i.i72, align 8, !dbg !1539
    #dbg_value(i32 0, !851, !DIExpression(), !1535)
    #dbg_value(ptr %buf.i, !852, !DIExpression(), !1540)
    #dbg_value(i32 0, !856, !DIExpression(), !1540)
    #dbg_value(ptr %state.i71, !857, !DIExpression(), !1540)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !1542)
    #dbg_value(i32 0, !610, !DIExpression(), !1542)
    #dbg_value(ptr %state.i71, !611, !DIExpression(), !1542)
    #dbg_value(i32 136, !612, !DIExpression(), !1542)
    #dbg_value(ptr %buf.i, !603, !DIExpression(), !1542)
    #dbg_value(i32 0, !610, !DIExpression(), !1542)
    #dbg_value(i32 128, !840, !DIExpression(), !1535)
    #dbg_value(ptr %buf.i, !838, !DIExpression(), !1535)
    #dbg_value(ptr %buf.i, !860, !DIExpression(), !1544)
    #dbg_value(i32 128, !864, !DIExpression(), !1544)
    #dbg_value(ptr %state.i71, !865, !DIExpression(), !1544)
  %pos.i1.i74 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1546
  %11 = load i32, ptr %pos.i1.i74, align 8, !dbg !1546
    #dbg_value(ptr %buf.i, !867, !DIExpression(), !1547)
    #dbg_value(i32 128, !873, !DIExpression(), !1547)
    #dbg_value(ptr %state.i71, !874, !DIExpression(), !1547)
    #dbg_value(i32 %11, !875, !DIExpression(), !1547)
    #dbg_value(i32 136, !876, !DIExpression(), !1547)
  br label %while.cond.i185, !dbg !1549

while.cond.i185:                                  ; preds = %for.end.i194, %for.end14
  %pos.addr.0.i = phi i32 [ %11, %for.end14 ], [ %i.0.i191.lcssa, %for.end.i194 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.end14 ], [ %sub3.i, %for.end.i194 ]
  %out.addr.0.i186 = phi ptr [ %buf.i, %for.end14 ], [ %out.addr.1.i.lcssa, %for.end.i194 ]
    #dbg_value(ptr %out.addr.0.i186, !867, !DIExpression(), !1547)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !1547)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !1547)
  %tobool.not.i187 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1549
  br i1 %tobool.not.i187, label %keccak_squeeze.exit, label %while.body.i188, !dbg !1549

while.body.i188:                                  ; preds = %while.cond.i185
  %cmp.i189 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1550
  br i1 %cmp.i189, label %if.then.i, label %if.end.i, !dbg !1550

if.then.i:                                        ; preds = %while.body.i188
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i71) #4, !dbg !1551
    #dbg_value(i32 0, !875, !DIExpression(), !1547)
  br label %if.end.i, !dbg !1552

if.end.i:                                         ; preds = %if.then.i, %while.body.i188
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i188 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !1547)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !1547)
  br label %for.cond.i190, !dbg !1553

for.cond.i190:                                    ; preds = %for.body.i195, %if.end.i
  %i.0.i191 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i200, %for.body.i195 ], !dbg !1554
  %out.addr.1.i = phi ptr [ %out.addr.0.i186, %if.end.i ], [ %incdec.ptr.i, %for.body.i195 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !1547)
    #dbg_value(i32 %i.0.i191, !884, !DIExpression(), !1547)
  %cmp1.i = icmp ult i32 %i.0.i191, 136, !dbg !1555
  %add.i192 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1556
  %cmp2.i193 = icmp ult i32 %i.0.i191, %add.i192, !dbg !1556
  %12 = select i1 %cmp1.i, i1 %cmp2.i193, i1 false, !dbg !1556
  br i1 %12, label %for.body.i195, label %for.end.i194, !dbg !1557

for.body.i195:                                    ; preds = %for.cond.i190
  %div1.i = lshr i32 %i.0.i191, 3, !dbg !1558
  %arrayidx.i196 = getelementptr inbounds nuw i64, ptr %state.i71, i32 %div1.i, !dbg !1559
  %13 = load i64, ptr %arrayidx.i196, align 8, !dbg !1559
  %rem.i = shl nuw nsw i32 %i.0.i191, 3, !dbg !1560
  %mul.i197 = and i32 %rem.i, 56, !dbg !1560
  %sh_prom.i = zext nneg i32 %mul.i197 to i64, !dbg !1561
  %shr.i198 = lshr i64 %13, %sh_prom.i, !dbg !1561
  %conv.i199 = trunc i64 %shr.i198 to i8, !dbg !1559
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1547)
  store i8 %conv.i199, ptr %out.addr.1.i, align 1, !dbg !1562
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1563
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !1547)
  %inc.i200 = add nuw nsw i32 %i.0.i191, 1, !dbg !1564
    #dbg_value(i32 %inc.i200, !884, !DIExpression(), !1547)
  br label %for.cond.i190, !dbg !1565, !llvm.loop !1566

for.end.i194:                                     ; preds = %for.cond.i190
  %i.0.i191.lcssa = phi i32 [ %i.0.i191, %for.cond.i190 ], !dbg !1554
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i190 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i191.lcssa, !dbg !1568
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1569
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !1547)
    #dbg_value(i32 %i.0.i191.lcssa, !875, !DIExpression(), !1547)
  br label %while.cond.i185, !dbg !1549, !llvm.loop !1570

keccak_squeeze.exit:                              ; preds = %while.cond.i185
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i185 ]
  %pos1.i.i76 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1572
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i76, align 8, !dbg !1573
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i71), !dbg !1574
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1575
    #dbg_value(ptr %epp, !1510, !DIExpression(), !1576)
    #dbg_value(ptr %buf.i, !1514, !DIExpression(), !1576)
  call fastcc void @cbd2(ptr noundef nonnull %epp, ptr noundef nonnull %buf.i) #4, !dbg !1578
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !1579
    #dbg_value(ptr %sp, !1580, !DIExpression(), !1581)
    #dbg_value(i32 0, !1016, !DIExpression(), !1581)
  br label %for.cond.i18, !dbg !1583

for.cond.i18:                                     ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit109, %keccak_squeeze.exit
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit ], [ %inc.i23, %pqcrystals_kyber768_ref_poly_reduce.exit109 ], !dbg !1584
    #dbg_value(i32 %i.0.i19, !1016, !DIExpression(), !1581)
  %exitcond267 = icmp ne i32 %i.0.i19, 3, !dbg !1585
  br i1 %exitcond267, label %for.body.i21, label %for.cond16.preheader, !dbg !1586

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1587

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [3 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1589
    #dbg_value(ptr %arrayidx.i22, !1023, !DIExpression(), !1590)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1592
    #dbg_value(ptr %arrayidx.i22, !1030, !DIExpression(), !1593)
    #dbg_value(i32 0, !1034, !DIExpression(), !1593)
  br label %for.cond.i97, !dbg !1595

for.cond.i97:                                     ; preds = %for.body.i100, %for.body.i21
  %i.0.i98 = phi i32 [ 0, %for.body.i21 ], [ %inc.i108, %for.body.i100 ], !dbg !1596
    #dbg_value(i32 %i.0.i98, !1034, !DIExpression(), !1593)
  %exitcond266 = icmp ne i32 %i.0.i98, 256, !dbg !1597
  br i1 %exitcond266, label %for.body.i100, label %pqcrystals_kyber768_ref_poly_reduce.exit109, !dbg !1598

for.body.i100:                                    ; preds = %for.cond.i97
  %arrayidx.i101 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1599
  %14 = load i16, ptr %arrayidx.i101, align 2, !dbg !1599
    #dbg_value(i16 %14, !1042, !DIExpression(), !1600)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1600)
  %conv.i.i102 = sext i16 %14 to i32, !dbg !1602
  %mul.i.i103 = mul nsw i32 %conv.i.i102, 20159, !dbg !1603
  %add.i.i104 = add nsw i32 %mul.i.i103, 33554432, !dbg !1604
  %shr.i.i105 = ashr i32 %add.i.i104, 26, !dbg !1605
    #dbg_value(i32 %shr.i.i105, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1600)
    #dbg_value(i32 %shr.i.i105, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1600)
  %15 = trunc nsw i32 %shr.i.i105 to i16, !dbg !1606
  %16 = mul i16 %15, -3329, !dbg !1606
  %conv7.i.i106 = add i16 %16, %14, !dbg !1606
  %arrayidx2.i107 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1607
  store i16 %conv7.i.i106, ptr %arrayidx2.i107, align 2, !dbg !1608
  %inc.i108 = add nuw nsw i32 %i.0.i98, 1, !dbg !1609
    #dbg_value(i32 %inc.i108, !1034, !DIExpression(), !1593)
  br label %for.cond.i97, !dbg !1610, !llvm.loop !1611

pqcrystals_kyber768_ref_poly_reduce.exit109:      ; preds = %for.cond.i97
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1613
    #dbg_value(i32 %inc.i23, !1016, !DIExpression(), !1581)
  br label %for.cond.i18, !dbg !1614, !llvm.loop !1615

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1617
    #dbg_value(i32 %i.2, !1374, !DIExpression(), !1270)
  %exitcond268 = icmp ne i32 %i.2, 3, !dbg !1618
  br i1 %exitcond268, label %for.body18, label %for.end23, !dbg !1587

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1620
  %arrayidx20 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1621
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1622
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1623
    #dbg_value(i32 %inc22, !1374, !DIExpression(), !1270)
  br label %for.cond16, !dbg !1624, !llvm.loop !1625

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1627
    #dbg_value(ptr %b, !1628, !DIExpression(), !1630)
    #dbg_value(i32 0, !1632, !DIExpression(), !1630)
  br label %for.cond.i12, !dbg !1633

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1635
    #dbg_value(i32 %i.0.i13, !1632, !DIExpression(), !1630)
  %exitcond269 = icmp ne i32 %i.0.i13, 3, !dbg !1636
  br i1 %exitcond269, label %for.body.i15, label %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit, !dbg !1638

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1639
    #dbg_value(ptr %arrayidx.i16, !1640, !DIExpression(), !1642)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1644
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1645
    #dbg_value(i32 %inc.i17, !1632, !DIExpression(), !1630)
  br label %for.cond.i12, !dbg !1646, !llvm.loop !1647

pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1640, !DIExpression(), !1649)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1651
    #dbg_value(ptr %b, !1652, !DIExpression(), !1653)
    #dbg_value(ptr %b, !1655, !DIExpression(), !1653)
    #dbg_value(ptr %ep, !1656, !DIExpression(), !1653)
    #dbg_value(i32 0, !1152, !DIExpression(), !1653)
  br label %for.cond.i24, !dbg !1657

for.cond.i24:                                     ; preds = %pqcrystals_kyber768_ref_poly_add.exit63, %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit
  %i.0.i25 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_invntt_tomont.exit ], [ %inc.i29, %pqcrystals_kyber768_ref_poly_add.exit63 ], !dbg !1658
    #dbg_value(i32 %i.0.i25, !1152, !DIExpression(), !1653)
  %exitcond271 = icmp ne i32 %i.0.i25, 3, !dbg !1659
  br i1 %exitcond271, label %for.body.i27, label %for.cond.i37.preheader, !dbg !1660

for.cond.i37.preheader:                           ; preds = %for.cond.i24
  br label %for.cond.i37, !dbg !1661

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1663
  %arrayidx2.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1664
  %arrayidx4.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i25, !dbg !1665
    #dbg_value(ptr %arrayidx.i28, !1163, !DIExpression(), !1666)
    #dbg_value(ptr %arrayidx2.i, !1171, !DIExpression(), !1666)
    #dbg_value(ptr %arrayidx4.i, !1172, !DIExpression(), !1666)
    #dbg_value(i32 0, !1173, !DIExpression(), !1666)
  br label %for.cond.i54, !dbg !1668

for.cond.i54:                                     ; preds = %for.body.i57, %for.body.i27
  %i.0.i55 = phi i32 [ 0, %for.body.i27 ], [ %inc.i62, %for.body.i57 ], !dbg !1669
    #dbg_value(i32 %i.0.i55, !1173, !DIExpression(), !1666)
  %exitcond270 = icmp ne i32 %i.0.i55, 256, !dbg !1670
  br i1 %exitcond270, label %for.body.i57, label %pqcrystals_kyber768_ref_poly_add.exit63, !dbg !1671

for.body.i57:                                     ; preds = %for.cond.i54
  %arrayidx.i58 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i55, !dbg !1672
  %17 = load i16, ptr %arrayidx.i58, align 2, !dbg !1672
  %arrayidx2.i59 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i55, !dbg !1673
  %18 = load i16, ptr %arrayidx2.i59, align 2, !dbg !1673
  %add.i60 = add i16 %17, %18, !dbg !1674
  %arrayidx6.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i28, i32 0, i32 %i.0.i55, !dbg !1675
  store i16 %add.i60, ptr %arrayidx6.i61, align 2, !dbg !1676
  %inc.i62 = add nuw nsw i32 %i.0.i55, 1, !dbg !1677
    #dbg_value(i32 %inc.i62, !1173, !DIExpression(), !1666)
  br label %for.cond.i54, !dbg !1678, !llvm.loop !1679

pqcrystals_kyber768_ref_poly_add.exit63:          ; preds = %for.cond.i54
  %inc.i29 = add nuw nsw i32 %i.0.i25, 1, !dbg !1681
    #dbg_value(i32 %inc.i29, !1152, !DIExpression(), !1653)
  br label %for.cond.i24, !dbg !1682, !llvm.loop !1683

for.cond.i37:                                     ; preds = %for.cond.i37.preheader, %for.body.i40
  %i.0.i38 = phi i32 [ %inc.i43, %for.body.i40 ], [ 0, %for.cond.i37.preheader ], !dbg !1685
    #dbg_value(i32 %i.0.i38, !1173, !DIExpression(), !1686)
  %exitcond272 = icmp ne i32 %i.0.i38, 256, !dbg !1687
  br i1 %exitcond272, label %for.body.i40, label %for.cond.i44.preheader, !dbg !1661

for.cond.i44.preheader:                           ; preds = %for.cond.i37
  br label %for.cond.i44, !dbg !1688

for.body.i40:                                     ; preds = %for.cond.i37
  %arrayidx.i41 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1690
  %19 = load i16, ptr %arrayidx.i41, align 2, !dbg !1690
  %arrayidx2.i42 = getelementptr inbounds nuw [256 x i16], ptr %epp, i32 0, i32 %i.0.i38, !dbg !1691
  %20 = load i16, ptr %arrayidx2.i42, align 2, !dbg !1691
  %add.i = add i16 %19, %20, !dbg !1692
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1693
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1694
  %inc.i43 = add nuw nsw i32 %i.0.i38, 1, !dbg !1695
    #dbg_value(i32 %inc.i43, !1173, !DIExpression(), !1686)
  br label %for.cond.i37, !dbg !1696, !llvm.loop !1697

for.cond.i44:                                     ; preds = %for.cond.i44.preheader, %for.body.i47
  %i.0.i45 = phi i32 [ %inc.i52, %for.body.i47 ], [ 0, %for.cond.i44.preheader ], !dbg !1699
    #dbg_value(i32 %i.0.i45, !1173, !DIExpression(), !1700)
  %exitcond273 = icmp ne i32 %i.0.i45, 256, !dbg !1701
  br i1 %exitcond273, label %for.body.i47, label %for.cond.i.preheader, !dbg !1688

for.cond.i.preheader:                             ; preds = %for.cond.i44
  br label %for.cond.i, !dbg !1702

for.body.i47:                                     ; preds = %for.cond.i44
  %arrayidx.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1704
  %21 = load i16, ptr %arrayidx.i48, align 2, !dbg !1704
  %arrayidx2.i49 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %i.0.i45, !dbg !1705
  %22 = load i16, ptr %arrayidx2.i49, align 2, !dbg !1705
  %add.i50 = add i16 %21, %22, !dbg !1706
  %arrayidx6.i51 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1707
  store i16 %add.i50, ptr %arrayidx6.i51, align 2, !dbg !1708
  %inc.i52 = add nuw nsw i32 %i.0.i45, 1, !dbg !1709
    #dbg_value(i32 %inc.i52, !1173, !DIExpression(), !1700)
  br label %for.cond.i44, !dbg !1710, !llvm.loop !1711

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit96
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit96 ], [ 0, %for.cond.i.preheader ], !dbg !1713
    #dbg_value(i32 %i.0.i, !1194, !DIExpression(), !1714)
  %exitcond275 = icmp ne i32 %i.0.i, 3, !dbg !1715
  br i1 %exitcond275, label %for.body.i, label %for.cond.i77.preheader, !dbg !1702

for.cond.i77.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i77, !dbg !1716

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1718
    #dbg_value(ptr %arrayidx.i11, !1030, !DIExpression(), !1719)
    #dbg_value(i32 0, !1034, !DIExpression(), !1719)
  br label %for.cond.i84, !dbg !1721

for.cond.i84:                                     ; preds = %for.body.i87, %for.body.i
  %i.0.i85 = phi i32 [ 0, %for.body.i ], [ %inc.i95, %for.body.i87 ], !dbg !1722
    #dbg_value(i32 %i.0.i85, !1034, !DIExpression(), !1719)
  %exitcond274 = icmp ne i32 %i.0.i85, 256, !dbg !1723
  br i1 %exitcond274, label %for.body.i87, label %pqcrystals_kyber768_ref_poly_reduce.exit96, !dbg !1724

for.body.i87:                                     ; preds = %for.cond.i84
  %arrayidx.i88 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1725
  %23 = load i16, ptr %arrayidx.i88, align 2, !dbg !1725
    #dbg_value(i16 %23, !1042, !DIExpression(), !1726)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1726)
  %conv.i.i89 = sext i16 %23 to i32, !dbg !1728
  %mul.i.i90 = mul nsw i32 %conv.i.i89, 20159, !dbg !1729
  %add.i.i91 = add nsw i32 %mul.i.i90, 33554432, !dbg !1730
  %shr.i.i92 = ashr i32 %add.i.i91, 26, !dbg !1731
    #dbg_value(i32 %shr.i.i92, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1726)
    #dbg_value(i32 %shr.i.i92, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1726)
  %24 = trunc nsw i32 %shr.i.i92 to i16, !dbg !1732
  %25 = mul i16 %24, -3329, !dbg !1732
  %conv7.i.i93 = add i16 %25, %23, !dbg !1732
  %arrayidx2.i94 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1733
  store i16 %conv7.i.i93, ptr %arrayidx2.i94, align 2, !dbg !1734
  %inc.i95 = add nuw nsw i32 %i.0.i85, 1, !dbg !1735
    #dbg_value(i32 %inc.i95, !1034, !DIExpression(), !1719)
  br label %for.cond.i84, !dbg !1736, !llvm.loop !1737

pqcrystals_kyber768_ref_poly_reduce.exit96:       ; preds = %for.cond.i84
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1739
    #dbg_value(i32 %inc.i, !1194, !DIExpression(), !1714)
  br label %for.cond.i, !dbg !1740, !llvm.loop !1741

for.cond.i77:                                     ; preds = %for.cond.i77.preheader, %for.body.i80
  %i.0.i78 = phi i32 [ %inc.i83, %for.body.i80 ], [ 0, %for.cond.i77.preheader ], !dbg !1743
    #dbg_value(i32 %i.0.i78, !1034, !DIExpression(), !1744)
  %exitcond276 = icmp ne i32 %i.0.i78, 256, !dbg !1745
  br i1 %exitcond276, label %for.body.i80, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1716

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i78, !dbg !1746
  %26 = load i16, ptr %arrayidx.i81, align 2, !dbg !1746
    #dbg_value(i16 %26, !1042, !DIExpression(), !1747)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1747)
  %conv.i.i = sext i16 %26 to i32, !dbg !1749
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1750
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1751
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1752
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1747)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1747)
  %27 = trunc nsw i32 %shr.i.i to i16, !dbg !1753
  %28 = mul i16 %27, -3329, !dbg !1753
  %conv7.i.i = add i16 %28, %26, !dbg !1753
  %arrayidx2.i82 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i78, !dbg !1754
  store i16 %conv7.i.i, ptr %arrayidx2.i82, align 2, !dbg !1755
  %inc.i83 = add nuw nsw i32 %i.0.i78, 1, !dbg !1756
    #dbg_value(i32 %inc.i83, !1034, !DIExpression(), !1744)
  br label %for.cond.i77, !dbg !1757, !llvm.loop !1758

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i77
    #dbg_value(ptr %c, !1760, !DIExpression(), !1765)
    #dbg_value(ptr %b, !1767, !DIExpression(), !1765)
    #dbg_value(ptr %v, !1768, !DIExpression(), !1765)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1769
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !1770
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr.i3, ptr noundef nonnull %v) #4, !dbg !1771
  ret void, !dbg !1772
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1773 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !1776, !DIExpression(), !1777)
    #dbg_value(ptr %c, !1778, !DIExpression(), !1777)
    #dbg_value(ptr %sk, !1779, !DIExpression(), !1777)
    #dbg_declare(ptr %b, !1780, !DIExpression(), !1781)
    #dbg_declare(ptr %skpv, !1782, !DIExpression(), !1783)
    #dbg_declare(ptr %v, !1784, !DIExpression(), !1785)
    #dbg_declare(ptr %mp, !1786, !DIExpression(), !1787)
    #dbg_value(ptr %b, !1788, !DIExpression(), !1792)
    #dbg_value(ptr %v, !1794, !DIExpression(), !1792)
    #dbg_value(ptr %c, !1795, !DIExpression(), !1792)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1796
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !1797
    #dbg_value(ptr %v, !1798, !DIExpression(), !1800)
    #dbg_value(ptr %add.ptr.i, !1802, !DIExpression(), !1800)
    #dbg_value(i32 0, !1803, !DIExpression(), !1800)
  br label %for.cond.i34, !dbg !1804

for.cond.i34:                                     ; preds = %for.body.i37, %entry
  %a.addr.0.i = phi ptr [ %add.ptr.i, %entry ], [ %add.ptr.i40, %for.body.i37 ]
  %i.0.i35 = phi i32 [ 0, %entry ], [ %inc.i41, %for.body.i37 ], !dbg !1806
    #dbg_value(i32 %i.0.i35, !1803, !DIExpression(), !1800)
    #dbg_value(ptr %a.addr.0.i, !1802, !DIExpression(), !1800)
  %exitcond = icmp ne i32 %i.0.i35, 128, !dbg !1807
  br i1 %exitcond, label %for.body.i37, label %for.cond.i1.preheader, !dbg !1809

for.cond.i1.preheader:                            ; preds = %for.cond.i34
  br label %for.cond.i1, !dbg !1810

for.body.i37:                                     ; preds = %for.cond.i34
  %0 = load i8, ptr %a.addr.0.i, align 1, !dbg !1816
  %1 = and i8 %0, 15, !dbg !1818
  %conv2.i = zext nneg i8 %1 to i32, !dbg !1819
  %mul.i38 = mul nuw nsw i32 %conv2.i, 3329, !dbg !1820
  %add.i = add nuw nsw i32 %mul.i38, 8, !dbg !1821
  %shr.i = lshr i32 %add.i, 4, !dbg !1822
  %conv3.i = trunc nuw nsw i32 %shr.i to i16, !dbg !1823
  %mul4.i = shl nuw nsw i32 %i.0.i35, 1, !dbg !1824
  %arrayidx6.i39 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %mul4.i, !dbg !1825
  store i16 %conv3.i, ptr %arrayidx6.i39, align 2, !dbg !1826
  %2 = load i8, ptr %a.addr.0.i, align 1, !dbg !1827
  %3 = lshr i8 %2, 4, !dbg !1828
  %conv11.i = zext nneg i8 %3 to i32, !dbg !1829
  %mul12.i = mul nuw nsw i32 %conv11.i, 3329, !dbg !1830
  %add13.i = add nuw nsw i32 %mul12.i, 8, !dbg !1831
  %shr14.i = lshr i32 %add13.i, 4, !dbg !1832
  %conv15.i = trunc nuw nsw i32 %shr14.i to i16, !dbg !1833
  %mul17.i = shl nuw nsw i32 %i.0.i35, 1, !dbg !1834
  %add18.i = or disjoint i32 %mul17.i, 1, !dbg !1835
  %arrayidx19.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %add18.i, !dbg !1836
  store i16 %conv15.i, ptr %arrayidx19.i, align 2, !dbg !1837
    #dbg_value(ptr %a.addr.0.i, !1802, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1800)
  %add.ptr.i40 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 1, !dbg !1838
    #dbg_value(ptr %add.ptr.i40, !1802, !DIExpression(), !1800)
  %inc.i41 = add nuw nsw i32 %i.0.i35, 1, !dbg !1839
    #dbg_value(i32 %inc.i41, !1803, !DIExpression(), !1800)
  br label %for.cond.i34, !dbg !1840, !llvm.loop !1841

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !1843
    #dbg_value(i32 %i.0.i2, !1308, !DIExpression(), !1844)
  %exitcond51 = icmp ne i32 %i.0.i2, 3, !dbg !1845
  br i1 %exitcond51, label %for.body.i4, label %for.cond.i.preheader, !dbg !1810

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1846

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1848
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1849
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1850
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1851
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1852
    #dbg_value(i32 %inc.i7, !1308, !DIExpression(), !1844)
  br label %for.cond.i1, !dbg !1853, !llvm.loop !1854

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber768_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber768_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1856
    #dbg_value(i32 %i.0.i, !1016, !DIExpression(), !1857)
  %exitcond53 = icmp ne i32 %i.0.i, 3, !dbg !1858
  br i1 %exitcond53, label %for.body.i, label %pqcrystals_kyber768_ref_polyvec_ntt.exit, !dbg !1846

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1859
    #dbg_value(ptr %arrayidx.i, !1023, !DIExpression(), !1860)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1862
    #dbg_value(ptr %arrayidx.i, !1030, !DIExpression(), !1863)
    #dbg_value(i32 0, !1034, !DIExpression(), !1863)
  br label %for.cond.i14, !dbg !1865

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1866
    #dbg_value(i32 %i.0.i15, !1034, !DIExpression(), !1863)
  %exitcond52 = icmp ne i32 %i.0.i15, 256, !dbg !1867
  br i1 %exitcond52, label %for.body.i17, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !1868

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1869
  %4 = load i16, ptr %arrayidx.i18, align 2, !dbg !1869
    #dbg_value(i16 %4, !1042, !DIExpression(), !1870)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1870)
  %conv.i.i = sext i16 %4 to i32, !dbg !1872
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1873
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1874
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1875
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1870)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1870)
  %5 = trunc nsw i32 %shr.i.i to i16, !dbg !1876
  %6 = mul i16 %5, -3329, !dbg !1876
  %conv7.i.i = add i16 %6, %4, !dbg !1876
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1877
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1878
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1879
    #dbg_value(i32 %inc.i20, !1034, !DIExpression(), !1863)
  br label %for.cond.i14, !dbg !1880, !llvm.loop !1881

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1883
    #dbg_value(i32 %inc.i, !1016, !DIExpression(), !1857)
  br label %for.cond.i, !dbg !1884, !llvm.loop !1885

pqcrystals_kyber768_ref_polyvec_ntt.exit:         ; preds = %for.cond.i
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1887
    #dbg_value(ptr %mp, !1640, !DIExpression(), !1888)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1890
    #dbg_value(ptr %mp, !1891, !DIExpression(), !1893)
    #dbg_value(ptr %v, !1895, !DIExpression(), !1893)
    #dbg_value(ptr %mp, !1896, !DIExpression(), !1893)
    #dbg_value(i32 0, !1897, !DIExpression(), !1893)
  br label %for.cond.i8, !dbg !1898

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber768_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber768_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !1900
    #dbg_value(i32 %i.0.i9, !1897, !DIExpression(), !1893)
  %exitcond54 = icmp ne i32 %i.0.i9, 256, !dbg !1901
  br i1 %exitcond54, label %for.body.i11, label %for.cond.i21.preheader, !dbg !1903

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !1904

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !1906
  %7 = load i16, ptr %arrayidx.i12, align 2, !dbg !1906
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1907
  %8 = load i16, ptr %arrayidx2.i, align 2, !dbg !1907
  %sub.i = sub i16 %7, %8, !dbg !1908
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1909
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !1910
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !1911
    #dbg_value(i32 %inc.i13, !1897, !DIExpression(), !1893)
  br label %for.cond.i8, !dbg !1912, !llvm.loop !1913

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !1915
    #dbg_value(i32 %i.0.i22, !1034, !DIExpression(), !1916)
  %exitcond55 = icmp ne i32 %i.0.i22, 256, !dbg !1917
  br i1 %exitcond55, label %for.body.i24, label %for.cond.i42.preheader, !dbg !1904

for.cond.i42.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i42, !dbg !1918

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1924
  %9 = load i16, ptr %arrayidx.i25, align 2, !dbg !1924
    #dbg_value(i16 %9, !1042, !DIExpression(), !1925)
    #dbg_value(i16 20159, !1049, !DIExpression(), !1925)
  %conv.i.i26 = sext i16 %9 to i32, !dbg !1927
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !1928
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !1929
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !1930
    #dbg_value(i32 %shr.i.i29, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1925)
    #dbg_value(i32 %shr.i.i29, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1925)
  %10 = trunc nsw i32 %shr.i.i29 to i16, !dbg !1931
  %11 = mul i16 %10, -3329, !dbg !1931
  %conv7.i.i30 = add i16 %11, %9, !dbg !1931
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1932
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !1933
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !1934
    #dbg_value(i32 %inc.i32, !1034, !DIExpression(), !1916)
  br label %for.cond.i21, !dbg !1935, !llvm.loop !1936

for.cond.i42:                                     ; preds = %for.cond.i42.preheader, %for.inc11.i
  %i.0.i43 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i42.preheader ], !dbg !1938
    #dbg_value(i32 %i.0.i43, !1939, !DIExpression(), !1940)
  %exitcond57 = icmp ne i32 %i.0.i43, 32, !dbg !1941
  br i1 %exitcond57, label %for.body.i45, label %pqcrystals_kyber768_ref_poly_tomsg.exit, !dbg !1918

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i43, !dbg !1943
  store i8 0, ptr %arrayidx.i46, align 1, !dbg !1945
    #dbg_value(i32 0, !1946, !DIExpression(), !1940)
  br label %for.cond1.i, !dbg !1947

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i45
  %j.0.i = phi i32 [ 0, %for.body.i45 ], [ %inc.i50, %for.body3.i ], !dbg !1949
    #dbg_value(i32 %j.0.i, !1946, !DIExpression(), !1940)
  %exitcond56 = icmp ne i32 %j.0.i, 8, !dbg !1950
  br i1 %exitcond56, label %for.body3.i, label %for.inc11.i, !dbg !1952

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i47 = shl nuw nsw i32 %i.0.i43, 3, !dbg !1953
  %add.i48 = or disjoint i32 %mul.i47, %j.0.i, !dbg !1955
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i48, !dbg !1956
  %12 = load i16, ptr %arrayidx4.i, align 2, !dbg !1956
  %conv.i = sext i16 %12 to i32, !dbg !1956
    #dbg_value(i32 %conv.i, !1957, !DIExpression(), !1940)
    #dbg_value(i32 %conv.i, !1957, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1940)
    #dbg_value(i32 %conv.i, !1957, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1940)
  %13 = mul i32 %conv.i, 161270, !dbg !1958
  %mul6.i = add i32 %13, 134257275, !dbg !1958
    #dbg_value(i32 %mul6.i, !1957, !DIExpression(), !1940)
  %shr.i49 = lshr i32 %mul6.i, 28, !dbg !1959
    #dbg_value(i32 %shr.i49, !1957, !DIExpression(), !1940)
  %and.i = and i32 %shr.i49, 1, !dbg !1960
    #dbg_value(i32 %and.i, !1957, !DIExpression(), !1940)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !1961
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i43, !dbg !1962
  %14 = load i8, ptr %arrayidx8.i, align 1, !dbg !1963
  %15 = trunc nuw i32 %shl7.i to i8, !dbg !1963
  %conv10.i = or i8 %14, %15, !dbg !1963
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !1963
  %inc.i50 = add nuw nsw i32 %j.0.i, 1, !dbg !1964
    #dbg_value(i32 %inc.i50, !1946, !DIExpression(), !1940)
  br label %for.cond1.i, !dbg !1965, !llvm.loop !1966

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i43, 1, !dbg !1968
    #dbg_value(i32 %inc12.i, !1939, !DIExpression(), !1940)
  br label %for.cond.i42, !dbg !1969, !llvm.loop !1970

pqcrystals_kyber768_ref_poly_tomsg.exit:          ; preds = %for.cond.i42
  ret void, !dbg !1972
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1973 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !1974, !DIExpression(), !1975)
    #dbg_value(ptr %a, !1976, !DIExpression(), !1975)
    #dbg_declare(ptr %t, !1977, !DIExpression(), !1981)
    #dbg_value(i32 0, !1982, !DIExpression(), !1975)
  br label %for.cond, !dbg !1983

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !1985
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !1974, !DIExpression(), !1975)
    #dbg_value(i32 %i.0, !1982, !DIExpression(), !1975)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !1986
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !1988

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1989

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !1992
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !1974, !DIExpression(), !1975)
    #dbg_value(i32 %j.0, !1993, !DIExpression(), !1975)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !1994
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !1989

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1996

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1999
    #dbg_value(i32 %k.0, !2000, !DIExpression(), !1975)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !2001
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !1996

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2003
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !2005
  %add = or disjoint i32 %mul, %k.0, !dbg !2006
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !2003
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2003
  %isneg = icmp slt i16 %0, 0, !dbg !2007
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2007
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2008
  %add12 = add i16 %and, %0, !dbg !2009
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !2009
  %conv15 = zext i16 %add12 to i64, !dbg !2010
    #dbg_value(i64 %conv15, !2011, !DIExpression(), !1975)
    #dbg_value(i64 %conv15, !2011, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !1975)
    #dbg_value(i64 %conv15, !2011, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1975)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !2012
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !2012
    #dbg_value(i64 %mul17, !2011, !DIExpression(), !1975)
  %shr18 = lshr i64 %mul17, 32, !dbg !2013
    #dbg_value(i64 %shr18, !2011, !DIExpression(), !1975)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !2014
  %conv20 = and i16 %2, 1023, !dbg !2014
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2015
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !2016
  %inc = add nuw nsw i32 %k.0, 1, !dbg !2017
    #dbg_value(i32 %inc, !2000, !DIExpression(), !1975)
  br label %for.cond4, !dbg !2018, !llvm.loop !2019

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !2021
  %conv25 = trunc i16 %3 to i8, !dbg !2022
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !2023
  %4 = load i16, ptr %t, align 2, !dbg !2024
  %5 = lshr i16 %4, 8, !dbg !2025
  %shr29 = trunc nuw i16 %5 to i8, !dbg !2025
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2026
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !2026
  %conv31 = trunc i16 %6 to i8, !dbg !2026
  %shl32 = shl i8 %conv31, 2, !dbg !2027
  %or = or i8 %shl32, %shr29, !dbg !2028
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !2029
  store i8 %or, ptr %arrayidx34, align 1, !dbg !2030
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2031
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !2031
  %8 = lshr i16 %7, 6, !dbg !2032
  %shr37 = trunc i16 %8 to i8, !dbg !2032
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2033
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !2033
  %conv39 = trunc i16 %9 to i8, !dbg !2033
  %shl40 = shl i8 %conv39, 4, !dbg !2034
  %or41 = or i8 %shl40, %shr37, !dbg !2035
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !2036
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !2037
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2038
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !2038
  %11 = lshr i16 %10, 4, !dbg !2039
  %shr46 = trunc i16 %11 to i8, !dbg !2039
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2040
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !2040
  %conv48 = trunc i16 %12 to i8, !dbg !2040
  %shl49 = shl i8 %conv48, 6, !dbg !2041
  %or50 = or i8 %shl49, %shr46, !dbg !2042
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !2043
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !2044
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2045
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !2045
  %14 = lshr i16 %13, 2, !dbg !2046
  %conv56 = trunc i16 %14 to i8, !dbg !2047
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !2048
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !2049
    #dbg_value(ptr %r.addr.1, !1974, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1975)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !2050
    #dbg_value(ptr %add.ptr, !1974, !DIExpression(), !1975)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !2051
    #dbg_value(i32 %inc59, !1993, !DIExpression(), !1975)
  br label %for.cond1, !dbg !2052, !llvm.loop !2053

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !2055
    #dbg_value(i32 %inc62, !1982, !DIExpression(), !1975)
  br label %for.cond, !dbg !2056, !llvm.loop !2057

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !2059
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2060 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !2061, !DIExpression(), !2062)
    #dbg_value(ptr %a, !2063, !DIExpression(), !2062)
    #dbg_declare(ptr %t, !2064, !DIExpression(), !2065)
    #dbg_value(i32 0, !2066, !DIExpression(), !2062)
  br label %for.cond, !dbg !2067

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !2069
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !2063, !DIExpression(), !2062)
    #dbg_value(i32 %i.0, !2066, !DIExpression(), !2062)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !2070
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !2072

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2073

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !2076
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !2063, !DIExpression(), !2062)
    #dbg_value(i32 %j.0, !2077, !DIExpression(), !2062)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !2078
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !2073

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !2080
  %conv = zext i8 %0 to i16, !dbg !2080
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2082
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !2082
  %conv6 = zext i8 %1 to i16, !dbg !2083
  %shl = shl nuw i16 %conv6, 8, !dbg !2084
  %or = or disjoint i16 %shl, %conv, !dbg !2085
  store i16 %or, ptr %t, align 2, !dbg !2086
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2087
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !2087
  %3 = lshr i8 %2, 2, !dbg !2088
  %shr11 = zext nneg i8 %3 to i16, !dbg !2088
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2089
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !2089
  %conv14 = zext i8 %4 to i16, !dbg !2090
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !2091
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !2092
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2093
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !2094
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2095
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !2095
  %6 = lshr i8 %5, 4, !dbg !2096
  %shr21 = zext nneg i8 %6 to i16, !dbg !2096
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !2097
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !2097
  %conv24 = zext i8 %7 to i16, !dbg !2098
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !2099
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !2100
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2101
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !2102
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !2103
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !2103
  %9 = lshr i8 %8, 6, !dbg !2104
  %shr31 = zext nneg i8 %9 to i16, !dbg !2104
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !2105
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !2105
  %conv34 = zext i8 %10 to i16, !dbg !2106
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !2107
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !2108
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2109
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !2110
    #dbg_value(ptr %add.ptr, !2063, !DIExpression(), !2062)
    #dbg_value(i32 0, !2111, !DIExpression(), !2062)
  br label %for.cond39, !dbg !2112

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !2114
    #dbg_value(i32 %k.0, !2111, !DIExpression(), !2062)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !2115
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !2117

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2118
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !2118
  %12 = and i16 %11, 1023, !dbg !2119
  %and = zext nneg i16 %12 to i32, !dbg !2119
  %mul = mul nuw nsw i32 %and, 3329, !dbg !2120
  %add = add nuw nsw i32 %mul, 512, !dbg !2121
  %shr45 = lshr i32 %add, 10, !dbg !2122
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !2123
  %arrayidx47 = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2124
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !2125
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !2126
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !2124
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !2127
  %inc = add nuw nsw i32 %k.0, 1, !dbg !2128
    #dbg_value(i32 %inc, !2111, !DIExpression(), !2062)
  br label %for.cond39, !dbg !2129, !llvm.loop !2130

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !2132
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !2133
    #dbg_value(i32 %inc52, !2077, !DIExpression(), !2062)
  br label %for.cond1, !dbg !2134, !llvm.loop !2135

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !2137
    #dbg_value(i32 %inc55, !2066, !DIExpression(), !2062)
  br label %for.cond, !dbg !2138, !llvm.loop !2139

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !2141
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1200 {
entry:
    #dbg_value(ptr %r, !2142, !DIExpression(), !2143)
    #dbg_value(ptr %a, !2144, !DIExpression(), !2143)
    #dbg_value(i32 0, !1234, !DIExpression(), !2143)
  br label %for.cond, !dbg !2145

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2146
    #dbg_value(i32 %i.0, !1234, !DIExpression(), !2143)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !2147
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2148

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2149
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !2150
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2151
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !2152
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2153
    #dbg_value(i32 %inc, !1234, !DIExpression(), !2143)
  br label %for.cond, !dbg !2154, !llvm.loop !2155

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2157
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1302 {
entry:
    #dbg_value(ptr %r, !1301, !DIExpression(), !2158)
    #dbg_value(ptr %a, !1307, !DIExpression(), !2158)
    #dbg_value(i32 0, !1308, !DIExpression(), !2158)
  br label %for.cond, !dbg !2159

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2160
    #dbg_value(i32 %i.0, !1308, !DIExpression(), !2158)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !2161
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2162

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2163
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2164
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2165
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !2166
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2167
    #dbg_value(i32 %inc, !1308, !DIExpression(), !2158)
  br label %for.cond, !dbg !2168, !llvm.loop !2169

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2171
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !937 {
entry:
    #dbg_value(ptr %r, !1580, !DIExpression(), !2172)
    #dbg_value(i32 0, !1016, !DIExpression(), !2172)
  br label %for.cond, !dbg !2173

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_reduce.exit ], !dbg !2174
    #dbg_value(i32 %i.0, !1016, !DIExpression(), !2172)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !2175
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2176

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2177
    #dbg_value(ptr %arrayidx, !1023, !DIExpression(), !2178)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %arrayidx) #4, !dbg !2180
    #dbg_value(ptr %arrayidx, !1030, !DIExpression(), !2181)
    #dbg_value(i32 0, !1034, !DIExpression(), !2181)
  br label %for.cond.i, !dbg !2183

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2184
    #dbg_value(i32 %i.0.i, !1034, !DIExpression(), !2181)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2185
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2186

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2187
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2187
    #dbg_value(i16 %0, !1042, !DIExpression(), !2188)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2188)
  %conv.i.i = sext i16 %0 to i32, !dbg !2190
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2191
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2192
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2193
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2188)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2188)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2194
  %2 = mul i16 %1, -3329, !dbg !2194
  %conv7.i.i = add i16 %2, %0, !dbg !2194
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2195
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2196
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2197
    #dbg_value(i32 %inc.i, !1034, !DIExpression(), !2181)
  br label %for.cond.i, !dbg !2198, !llvm.loop !2199

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2201
    #dbg_value(i32 %inc, !1016, !DIExpression(), !2172)
  br label %for.cond, !dbg !2202, !llvm.loop !2203

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2205
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1629 {
entry:
    #dbg_value(ptr %r, !1628, !DIExpression(), !2206)
    #dbg_value(i32 0, !1632, !DIExpression(), !2206)
  br label %for.cond, !dbg !2207

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2208
    #dbg_value(i32 %i.0, !1632, !DIExpression(), !2206)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !2209
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2210

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2211
    #dbg_value(ptr %arrayidx, !1640, !DIExpression(), !2212)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %arrayidx) #4, !dbg !2214
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2215
    #dbg_value(i32 %inc, !1632, !DIExpression(), !2206)
  br label %for.cond, !dbg !2216, !llvm.loop !2217

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2219
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2220 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !2224, !DIExpression(), !2225)
    #dbg_value(ptr %a, !2226, !DIExpression(), !2225)
    #dbg_value(ptr %b, !2227, !DIExpression(), !2225)
    #dbg_declare(ptr %t, !2228, !DIExpression(), !2229)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !2230
    #dbg_value(i32 1, !2231, !DIExpression(), !2225)
  br label %for.cond, !dbg !2232

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_add.exit ], !dbg !2234
    #dbg_value(i32 %i.0, !2231, !DIExpression(), !2225)
  %exitcond8 = icmp ne i32 %i.0, 3, !dbg !2235
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !2237

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !2238

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2240
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2242
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !2243
    #dbg_value(ptr %r, !1163, !DIExpression(), !2244)
    #dbg_value(ptr %r, !1171, !DIExpression(), !2244)
    #dbg_value(ptr %t, !1172, !DIExpression(), !2244)
    #dbg_value(i32 0, !1173, !DIExpression(), !2244)
  br label %for.cond.i, !dbg !2246

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2247
    #dbg_value(i32 %i.0.i, !1173, !DIExpression(), !2244)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2248
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !2249

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2250
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2250
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !2251
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2251
  %add.i = add i16 %0, %1, !dbg !2252
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2253
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2254
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2255
    #dbg_value(i32 %inc.i, !1173, !DIExpression(), !2244)
  br label %for.cond.i, !dbg !2256, !llvm.loop !2257

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2259
    #dbg_value(i32 %inc, !2231, !DIExpression(), !2225)
  br label %for.cond, !dbg !2260, !llvm.loop !2261

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2263
    #dbg_value(i32 %i.0.i2, !1034, !DIExpression(), !2264)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2265
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2238

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2266
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2266
    #dbg_value(i16 %2, !1042, !DIExpression(), !2267)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2267)
  %conv.i.i = sext i16 %2 to i32, !dbg !2269
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2270
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2271
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2272
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2267)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2267)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2273
  %4 = mul i16 %3, -3329, !dbg !2273
  %conv7.i.i = add i16 %4, %2, !dbg !2273
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2274
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2275
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2276
    #dbg_value(i32 %inc.i7, !1034, !DIExpression(), !2264)
  br label %for.cond.i1, !dbg !2277, !llvm.loop !2278

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i1
  ret void, !dbg !2280
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1158 {
entry:
    #dbg_value(ptr %r, !2281, !DIExpression(), !2282)
    #dbg_value(i32 0, !1194, !DIExpression(), !2282)
  br label %for.cond, !dbg !2283

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_reduce.exit ], !dbg !2284
    #dbg_value(i32 %i.0, !1194, !DIExpression(), !2282)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !2285
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2286

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2287
    #dbg_value(ptr %arrayidx, !1030, !DIExpression(), !2288)
    #dbg_value(i32 0, !1034, !DIExpression(), !2288)
  br label %for.cond.i, !dbg !2290

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2291
    #dbg_value(i32 %i.0.i, !1034, !DIExpression(), !2288)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2292
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2293

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2294
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2294
    #dbg_value(i16 %0, !1042, !DIExpression(), !2295)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2295)
  %conv.i.i = sext i16 %0 to i32, !dbg !2297
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2298
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2299
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2300
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2295)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2295)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2301
  %2 = mul i16 %1, -3329, !dbg !2301
  %conv7.i.i = add i16 %2, %0, !dbg !2301
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2302
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2303
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2304
    #dbg_value(i32 %inc.i, !1034, !DIExpression(), !2288)
  br label %for.cond.i, !dbg !2305, !llvm.loop !2306

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2308
    #dbg_value(i32 %inc, !1194, !DIExpression(), !2282)
  br label %for.cond, !dbg !2309, !llvm.loop !2310

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2312
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1104 {
entry:
    #dbg_value(ptr %r, !1652, !DIExpression(), !2313)
    #dbg_value(ptr %a, !1655, !DIExpression(), !2313)
    #dbg_value(ptr %b, !1656, !DIExpression(), !2313)
    #dbg_value(i32 0, !1152, !DIExpression(), !2313)
  br label %for.cond, !dbg !2314

for.cond:                                         ; preds = %pqcrystals_kyber768_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber768_ref_poly_add.exit ], !dbg !2315
    #dbg_value(i32 %i.0, !1152, !DIExpression(), !2313)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !2316
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2317

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2318
  %arrayidx2 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2319
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2320
    #dbg_value(ptr %arrayidx, !1163, !DIExpression(), !2321)
    #dbg_value(ptr %arrayidx2, !1171, !DIExpression(), !2321)
    #dbg_value(ptr %arrayidx4, !1172, !DIExpression(), !2321)
    #dbg_value(i32 0, !1173, !DIExpression(), !2321)
  br label %for.cond.i, !dbg !2323

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2324
    #dbg_value(i32 %i.0.i, !1173, !DIExpression(), !2321)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2325
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_add.exit, !dbg !2326

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2327
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2327
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2328
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2328
  %add.i = add i16 %0, %1, !dbg !2329
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2330
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2331
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2332
    #dbg_value(i32 %inc.i, !1173, !DIExpression(), !2321)
  br label %for.cond.i, !dbg !2333, !llvm.loop !2334

pqcrystals_kyber768_ref_poly_add.exit:            ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2336
    #dbg_value(i32 %inc, !1152, !DIExpression(), !2313)
  br label %for.cond, !dbg !2337, !llvm.loop !2338

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2340
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2341 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2342, !DIExpression(), !2343)
    #dbg_value(ptr %a, !2344, !DIExpression(), !2343)
    #dbg_declare(ptr %t, !2345, !DIExpression(), !2349)
    #dbg_value(i32 0, !2350, !DIExpression(), !2343)
  br label %for.cond, !dbg !2351

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !2353
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2342, !DIExpression(), !2343)
    #dbg_value(i32 %i.0, !2350, !DIExpression(), !2343)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2354
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !2356

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2357

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2360
    #dbg_value(i32 %j.0, !2361, !DIExpression(), !2343)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2362
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2357

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2364
  %add = or disjoint i32 %mul, %j.0, !dbg !2366
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2367
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2367
    #dbg_value(i16 %0, !2368, !DIExpression(), !2343)
  %isneg = icmp slt i16 %0, 0, !dbg !2369
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2369
  %add5 = add i16 %and, %0, !dbg !2370
    #dbg_value(i16 %add5, !2368, !DIExpression(), !2343)
  %conv7 = sext i16 %add5 to i32, !dbg !2371
    #dbg_value(i32 %conv7, !2372, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !2343)
    #dbg_value(i32 %conv7, !2372, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2343)
  %1 = mul i32 %conv7, 1290160, !dbg !2373
  %mul9 = add i32 %1, 134257275, !dbg !2373
    #dbg_value(i32 %mul9, !2372, !DIExpression(), !2343)
  %shr10 = lshr i32 %mul9, 28, !dbg !2374
    #dbg_value(i32 %shr10, !2372, !DIExpression(), !2343)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2375
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2376
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2377
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2378
    #dbg_value(i32 %inc, !2361, !DIExpression(), !2343)
  br label %for.cond1, !dbg !2379, !llvm.loop !2380

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2382
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2383
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !2383
  %shl18 = shl i8 %3, 4, !dbg !2384
  %or = or i8 %shl18, %2, !dbg !2385
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2386
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2387
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2387
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2388
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !2388
  %shl25 = shl i8 %5, 4, !dbg !2389
  %or26 = or i8 %shl25, %4, !dbg !2390
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2391
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !2392
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2393
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2393
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2394
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2394
  %shl33 = shl i8 %7, 4, !dbg !2395
  %or34 = or i8 %shl33, %6, !dbg !2396
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2397
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !2398
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2399
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !2399
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2400
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !2400
  %shl41 = shl i8 %9, 4, !dbg !2401
  %or42 = or i8 %shl41, %8, !dbg !2402
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2403
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !2404
    #dbg_value(ptr %r.addr.0, !2342, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !2343)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2405
    #dbg_value(ptr %add.ptr, !2342, !DIExpression(), !2343)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !2406
    #dbg_value(i32 %inc46, !2350, !DIExpression(), !2343)
  br label %for.cond, !dbg !2407, !llvm.loop !2408

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !2410
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1799 {
entry:
    #dbg_value(ptr %r, !1798, !DIExpression(), !2411)
    #dbg_value(ptr %a, !1802, !DIExpression(), !2411)
    #dbg_value(i32 0, !1803, !DIExpression(), !2411)
  br label %for.cond, !dbg !2412

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2413
    #dbg_value(i32 %i.0, !1803, !DIExpression(), !2411)
    #dbg_value(ptr %a.addr.0, !1802, !DIExpression(), !2411)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2414
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2415

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2416
  %1 = and i8 %0, 15, !dbg !2417
  %conv2 = zext nneg i8 %1 to i32, !dbg !2418
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !2419
  %add = add nuw nsw i32 %mul, 8, !dbg !2420
  %shr = lshr i32 %add, 4, !dbg !2421
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !2422
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2423
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !2424
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !2425
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !2426
  %3 = lshr i8 %2, 4, !dbg !2427
  %conv11 = zext nneg i8 %3 to i32, !dbg !2428
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !2429
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !2430
  %shr14 = lshr i32 %add13, 4, !dbg !2431
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !2432
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !2433
  %add18 = or disjoint i32 %mul17, 1, !dbg !2434
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !2435
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !2436
    #dbg_value(ptr %a.addr.0, !1802, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2411)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2437
    #dbg_value(ptr %add.ptr, !1802, !DIExpression(), !2411)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2438
    #dbg_value(i32 %inc, !1803, !DIExpression(), !2411)
  br label %for.cond, !dbg !2439, !llvm.loop !2440

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2442
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2443 {
entry:
    #dbg_value(ptr %r, !2444, !DIExpression(), !2445)
    #dbg_value(ptr %a, !2446, !DIExpression(), !2445)
    #dbg_value(i32 0, !2447, !DIExpression(), !2445)
  br label %for.cond, !dbg !2448

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2450
    #dbg_value(i32 %i.0, !2447, !DIExpression(), !2445)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2451
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2453

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2454
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2456
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2456
    #dbg_value(i16 %0, !2457, !DIExpression(), !2445)
  %isneg = icmp slt i16 %0, 0, !dbg !2458
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2458
  %add = add i16 %and, %0, !dbg !2459
    #dbg_value(i16 %add, !2457, !DIExpression(), !2445)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2460
  %add5 = or disjoint i32 %mul4, 1, !dbg !2461
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2462
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2462
    #dbg_value(i16 %1, !2463, !DIExpression(), !2445)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2464
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2464
  %add11 = add i16 %and9, %1, !dbg !2465
    #dbg_value(i16 %add11, !2463, !DIExpression(), !2445)
  %conv15 = trunc i16 %add to i8, !dbg !2466
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2467
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2468
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2469
  %2 = lshr i16 %add, 8, !dbg !2470
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2470
  %conv21 = trunc i16 %add11 to i8, !dbg !2471
  %shl = shl i8 %conv21, 4, !dbg !2472
  %or = or i8 %shl, %shr20, !dbg !2473
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2474
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2475
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2475
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2476
  %4 = lshr i16 %add11, 4, !dbg !2477
  %conv28 = trunc i16 %4 to i8, !dbg !2478
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2479
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2480
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2480
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2481
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2482
    #dbg_value(i32 %inc, !2447, !DIExpression(), !2445)
  br label %for.cond, !dbg !2483, !llvm.loop !2484

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2486
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2487 {
entry:
    #dbg_value(ptr %r, !2488, !DIExpression(), !2489)
    #dbg_value(ptr %a, !2490, !DIExpression(), !2489)
    #dbg_value(i32 0, !2491, !DIExpression(), !2489)
  br label %for.cond, !dbg !2492

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2494
    #dbg_value(i32 %i.0, !2491, !DIExpression(), !2489)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2495
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2497

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2498
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2500
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2500
  %conv = zext i8 %0 to i16, !dbg !2500
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2501
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2502
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2502
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2502
  %conv5 = zext i8 %2 to i16, !dbg !2503
  %shl = shl nuw i16 %conv5, 8, !dbg !2504
  %shl.masked = and i16 %shl, 3840, !dbg !2505
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2505
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2506
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2507
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2508
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2509
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2510
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2510
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2510
  %5 = lshr i8 %4, 4, !dbg !2511
  %shr13 = zext nneg i8 %5 to i16, !dbg !2511
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2512
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2513
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2513
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2513
  %conv18 = zext i8 %7 to i16, !dbg !2514
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2515
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2516
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2517
  %add25 = or disjoint i32 %mul24, 1, !dbg !2518
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2519
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2520
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2521
    #dbg_value(i32 %inc, !2491, !DIExpression(), !2489)
  br label %for.cond, !dbg !2522, !llvm.loop !2523

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2525
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1326 {
entry:
    #dbg_value(ptr %r, !1325, !DIExpression(), !2526)
    #dbg_value(ptr %msg, !1331, !DIExpression(), !2526)
    #dbg_value(i32 0, !1332, !DIExpression(), !2526)
  br label %for.cond, !dbg !2527

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2528
    #dbg_value(i32 %i.0, !1332, !DIExpression(), !2526)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2529
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2530

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2531

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2532
    #dbg_value(i32 %j.0, !1343, !DIExpression(), !2526)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2533
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2531

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2534
  %add = or disjoint i32 %mul, %j.0, !dbg !2535
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2536
  store i16 0, ptr %arrayidx, align 2, !dbg !2537
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2538
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2538
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2539
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2540
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2540
  %conv = zext i8 %0 to i32, !dbg !2540
    #dbg_value(ptr %add.ptr6, !1354, !DIExpression(), !2541)
    #dbg_value(i16 1665, !1360, !DIExpression(), !2541)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2541)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1361, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2541)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2543
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2544
  %3 = and i32 %2, %conv, !dbg !2544
  %4 = icmp eq i32 %3, 0, !dbg !2544
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2545
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2545
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2546
    #dbg_value(i32 %inc, !1343, !DIExpression(), !2526)
  br label %for.cond1, !dbg !2547, !llvm.loop !2548

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2550
    #dbg_value(i32 %inc10, !1332, !DIExpression(), !2526)
  br label %for.cond, !dbg !2551, !llvm.loop !2552

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2554
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1920 {
entry:
    #dbg_value(ptr %msg, !2555, !DIExpression(), !2556)
    #dbg_value(ptr %a, !2557, !DIExpression(), !2556)
    #dbg_value(i32 0, !1939, !DIExpression(), !2556)
  br label %for.cond, !dbg !2558

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2559
    #dbg_value(i32 %i.0, !1939, !DIExpression(), !2556)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2560
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2561

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2562
  store i8 0, ptr %arrayidx, align 1, !dbg !2563
    #dbg_value(i32 0, !1946, !DIExpression(), !2556)
  br label %for.cond1, !dbg !2564

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2565
    #dbg_value(i32 %j.0, !1946, !DIExpression(), !2556)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2566
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2567

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2568
  %add = or disjoint i32 %mul, %j.0, !dbg !2569
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2570
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2570
  %conv = sext i16 %0 to i32, !dbg !2570
    #dbg_value(i32 %conv, !1957, !DIExpression(), !2556)
    #dbg_value(i32 %conv, !1957, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2556)
    #dbg_value(i32 %conv, !1957, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2556)
  %1 = mul i32 %conv, 161270, !dbg !2571
  %mul6 = add i32 %1, 134257275, !dbg !2571
    #dbg_value(i32 %mul6, !1957, !DIExpression(), !2556)
  %shr = lshr i32 %mul6, 28, !dbg !2572
    #dbg_value(i32 %shr, !1957, !DIExpression(), !2556)
  %and = and i32 %shr, 1, !dbg !2573
    #dbg_value(i32 %and, !1957, !DIExpression(), !2556)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2574
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2575
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2576
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2576
  %conv10 = or i8 %2, %3, !dbg !2576
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2576
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2577
    #dbg_value(i32 %inc, !1946, !DIExpression(), !2556)
  br label %for.cond1, !dbg !2578, !llvm.loop !2579

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2581
    #dbg_value(i32 %inc12, !1939, !DIExpression(), !2556)
  br label %for.cond, !dbg !2582, !llvm.loop !2583

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2585
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !797 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !807, !DIExpression(), !2586)
    #dbg_value(ptr %seed, !809, !DIExpression(), !2586)
    #dbg_value(i8 %nonce, !810, !DIExpression(), !2586)
    #dbg_declare(ptr %buf, !811, !DIExpression(), !2587)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2588
    #dbg_value(ptr %buf, !819, !DIExpression(), !2590)
    #dbg_value(i32 128, !821, !DIExpression(), !2590)
    #dbg_value(ptr %seed, !822, !DIExpression(), !2590)
    #dbg_value(i8 %nonce, !823, !DIExpression(), !2590)
    #dbg_declare(ptr %extkey.i, !824, !DIExpression(), !2591)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2588
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2592
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2593
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2594
    #dbg_value(ptr %buf, !838, !DIExpression(), !2597)
    #dbg_value(i32 128, !840, !DIExpression(), !2597)
    #dbg_value(ptr %extkey.i, !841, !DIExpression(), !2597)
    #dbg_value(i32 33, !842, !DIExpression(), !2597)
    #dbg_declare(ptr %state.i, !843, !DIExpression(), !2598)
    #dbg_value(ptr %state.i, !845, !DIExpression(), !2599)
    #dbg_value(ptr %extkey.i, !847, !DIExpression(), !2599)
    #dbg_value(i32 33, !848, !DIExpression(), !2599)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2594
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2600
  store i32 136, ptr %pos.i.i, align 8, !dbg !2601
    #dbg_value(i32 0, !851, !DIExpression(), !2597)
    #dbg_value(ptr %buf, !852, !DIExpression(), !2602)
    #dbg_value(i32 0, !856, !DIExpression(), !2602)
    #dbg_value(ptr %state.i, !857, !DIExpression(), !2602)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2604)
    #dbg_value(i32 0, !610, !DIExpression(), !2604)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !2604)
    #dbg_value(i32 136, !612, !DIExpression(), !2604)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2604)
    #dbg_value(i32 0, !610, !DIExpression(), !2604)
    #dbg_value(i32 128, !840, !DIExpression(), !2597)
    #dbg_value(ptr %buf, !838, !DIExpression(), !2597)
    #dbg_value(ptr %buf, !860, !DIExpression(), !2606)
    #dbg_value(i32 128, !864, !DIExpression(), !2606)
    #dbg_value(ptr %state.i, !865, !DIExpression(), !2606)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2608
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2608
    #dbg_value(ptr %buf, !867, !DIExpression(), !2609)
    #dbg_value(i32 128, !873, !DIExpression(), !2609)
    #dbg_value(ptr %state.i, !874, !DIExpression(), !2609)
    #dbg_value(i32 %0, !875, !DIExpression(), !2609)
    #dbg_value(i32 136, !876, !DIExpression(), !2609)
  br label %while.cond.i2, !dbg !2611

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !867, !DIExpression(), !2609)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !2609)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !2609)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2611
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2611

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2612
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2612

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2613
    #dbg_value(i32 0, !875, !DIExpression(), !2609)
  br label %if.end.i, !dbg !2614

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !2609)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !2609)
  br label %for.cond.i7, !dbg !2615

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2616
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !2609)
    #dbg_value(i32 %i.0.i8, !884, !DIExpression(), !2609)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2617
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2618
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2618
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2618
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2619

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2620
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2621
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2621
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2622
  %mul.i12 = and i32 %rem.i, 56, !dbg !2622
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2623
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2623
  %conv.i = trunc i64 %shr.i to i8, !dbg !2621
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2609)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2624
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2625
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !2609)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2626
    #dbg_value(i32 %inc.i13, !884, !DIExpression(), !2609)
  br label %for.cond.i7, !dbg !2627, !llvm.loop !2628

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2616
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2630
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2631
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !2609)
    #dbg_value(i32 %i.0.i8.lcssa, !875, !DIExpression(), !2609)
  br label %while.cond.i2, !dbg !2611, !llvm.loop !2632

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2634
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2635
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2636
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2637
    #dbg_value(ptr %r, !911, !DIExpression(), !2638)
    #dbg_value(ptr %buf, !923, !DIExpression(), !2638)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2640
  ret void, !dbg !2641
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1451 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1453, !DIExpression(), !2642)
    #dbg_value(ptr %seed, !1455, !DIExpression(), !2642)
    #dbg_value(i8 %nonce, !1456, !DIExpression(), !2642)
    #dbg_declare(ptr %buf, !1457, !DIExpression(), !2643)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2644
    #dbg_value(ptr %buf, !819, !DIExpression(), !2646)
    #dbg_value(i32 128, !821, !DIExpression(), !2646)
    #dbg_value(ptr %seed, !822, !DIExpression(), !2646)
    #dbg_value(i8 %nonce, !823, !DIExpression(), !2646)
    #dbg_declare(ptr %extkey.i, !824, !DIExpression(), !2647)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2644
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2648
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2649
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2650
    #dbg_value(ptr %buf, !838, !DIExpression(), !2653)
    #dbg_value(i32 128, !840, !DIExpression(), !2653)
    #dbg_value(ptr %extkey.i, !841, !DIExpression(), !2653)
    #dbg_value(i32 33, !842, !DIExpression(), !2653)
    #dbg_declare(ptr %state.i, !843, !DIExpression(), !2654)
    #dbg_value(ptr %state.i, !845, !DIExpression(), !2655)
    #dbg_value(ptr %extkey.i, !847, !DIExpression(), !2655)
    #dbg_value(i32 33, !848, !DIExpression(), !2655)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2650
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2656
  store i32 136, ptr %pos.i.i, align 8, !dbg !2657
    #dbg_value(i32 0, !851, !DIExpression(), !2653)
    #dbg_value(ptr %buf, !852, !DIExpression(), !2658)
    #dbg_value(i32 0, !856, !DIExpression(), !2658)
    #dbg_value(ptr %state.i, !857, !DIExpression(), !2658)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2660)
    #dbg_value(i32 0, !610, !DIExpression(), !2660)
    #dbg_value(ptr %state.i, !611, !DIExpression(), !2660)
    #dbg_value(i32 136, !612, !DIExpression(), !2660)
    #dbg_value(ptr %buf, !603, !DIExpression(), !2660)
    #dbg_value(i32 0, !610, !DIExpression(), !2660)
    #dbg_value(i32 128, !840, !DIExpression(), !2653)
    #dbg_value(ptr %buf, !838, !DIExpression(), !2653)
    #dbg_value(ptr %buf, !860, !DIExpression(), !2662)
    #dbg_value(i32 128, !864, !DIExpression(), !2662)
    #dbg_value(ptr %state.i, !865, !DIExpression(), !2662)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2664
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2664
    #dbg_value(ptr %buf, !867, !DIExpression(), !2665)
    #dbg_value(i32 128, !873, !DIExpression(), !2665)
    #dbg_value(ptr %state.i, !874, !DIExpression(), !2665)
    #dbg_value(i32 %0, !875, !DIExpression(), !2665)
    #dbg_value(i32 136, !876, !DIExpression(), !2665)
  br label %while.cond.i2, !dbg !2667

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !867, !DIExpression(), !2665)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !2665)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !2665)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2667
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2667

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2668
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2668

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2669
    #dbg_value(i32 0, !875, !DIExpression(), !2665)
  br label %if.end.i, !dbg !2670

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !2665)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !2665)
  br label %for.cond.i7, !dbg !2671

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2672
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !2665)
    #dbg_value(i32 %i.0.i8, !884, !DIExpression(), !2665)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2673
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2674
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2674
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2674
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2675

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2676
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2677
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2677
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2678
  %mul.i12 = and i32 %rem.i, 56, !dbg !2678
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2679
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2679
  %conv.i = trunc i64 %shr.i to i8, !dbg !2677
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2665)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2680
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2681
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !2665)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2682
    #dbg_value(i32 %inc.i13, !884, !DIExpression(), !2665)
  br label %for.cond.i7, !dbg !2683, !llvm.loop !2684

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2672
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2686
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2687
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !2665)
    #dbg_value(i32 %i.0.i8.lcssa, !875, !DIExpression(), !2665)
  br label %while.cond.i2, !dbg !2667, !llvm.loop !2688

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2690
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2691
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2692
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2693
    #dbg_value(ptr %r, !1510, !DIExpression(), !2694)
    #dbg_value(ptr %buf, !1514, !DIExpression(), !2694)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2696
  ret void, !dbg !2697
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1024 {
entry:
    #dbg_value(ptr %r, !1023, !DIExpression(), !2698)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #4, !dbg !2699
    #dbg_value(ptr %r, !1030, !DIExpression(), !2700)
    #dbg_value(i32 0, !1034, !DIExpression(), !2700)
  br label %for.cond.i, !dbg !2702

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2703
    #dbg_value(i32 %i.0.i, !1034, !DIExpression(), !2700)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2704
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber768_ref_poly_reduce.exit, !dbg !2705

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2706
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2706
    #dbg_value(i16 %0, !1042, !DIExpression(), !2707)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2707)
  %conv.i.i = sext i16 %0 to i32, !dbg !2709
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2710
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2711
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2712
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2707)
    #dbg_value(i32 %shr.i.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2707)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2713
  %2 = mul i16 %1, -3329, !dbg !2713
  %conv7.i.i = add i16 %2, %0, !dbg !2713
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2714
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2715
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2716
    #dbg_value(i32 %inc.i, !1034, !DIExpression(), !2700)
  br label %for.cond.i, !dbg !2717, !llvm.loop !2718

pqcrystals_kyber768_ref_poly_reduce.exit:         ; preds = %for.cond.i
  ret void, !dbg !2720
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1031 {
entry:
    #dbg_value(ptr %r, !1030, !DIExpression(), !2721)
    #dbg_value(i32 0, !1034, !DIExpression(), !2721)
  br label %for.cond, !dbg !2722

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2723
    #dbg_value(i32 %i.0, !1034, !DIExpression(), !2721)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2724
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2725

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2726
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2726
    #dbg_value(i16 %0, !1042, !DIExpression(), !2727)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2727)
  %conv.i = sext i16 %0 to i32, !dbg !2729
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2730
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2731
  %shr.i = ashr i32 %add.i, 26, !dbg !2732
    #dbg_value(i32 %shr.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2727)
    #dbg_value(i32 %shr.i, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2727)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2733
  %2 = mul i16 %1, -3329, !dbg !2733
  %conv7.i = add i16 %2, %0, !dbg !2733
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2734
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2735
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2736
    #dbg_value(i32 %inc, !1034, !DIExpression(), !2721)
  br label %for.cond, !dbg !2737, !llvm.loop !2738

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2740
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1641 {
entry:
    #dbg_value(ptr %r, !1640, !DIExpression(), !2741)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #4, !dbg !2742
  ret void, !dbg !2743
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2744 {
entry:
    #dbg_value(ptr %r, !2745, !DIExpression(), !2746)
    #dbg_value(ptr %a, !2747, !DIExpression(), !2746)
    #dbg_value(ptr %b, !2748, !DIExpression(), !2746)
    #dbg_value(i32 0, !2749, !DIExpression(), !2746)
  br label %for.cond, !dbg !2750

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2752
    #dbg_value(i32 %i.0, !2749, !DIExpression(), !2746)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2753
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2755

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2756
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2758
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2759
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2760
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2761
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2762
  %add = or disjoint i32 %i.0, 64, !dbg !2763
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !2764
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2764
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2765
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2766
  %add10 = or disjoint i32 %mul9, 2, !dbg !2767
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2768
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2769
  %add14 = or disjoint i32 %mul13, 2, !dbg !2770
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2771
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2772
  %add18 = or disjoint i32 %mul17, 2, !dbg !2773
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2774
  %add20 = or disjoint i32 %i.0, 64, !dbg !2775
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add20, !dbg !2776
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2776
  %sub = sub i16 0, %1, !dbg !2777
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2778
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2779
    #dbg_value(i32 %inc, !2749, !DIExpression(), !2746)
  br label %for.cond, !dbg !2780, !llvm.loop !2781

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2783
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1116 {
entry:
    #dbg_value(ptr %r, !1115, !DIExpression(), !2784)
    #dbg_value(i16 1353, !1119, !DIExpression(), !2784)
    #dbg_value(i32 0, !1120, !DIExpression(), !2784)
  br label %for.cond, !dbg !2785

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2786
    #dbg_value(i32 %i.0, !1120, !DIExpression(), !2784)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2787
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2788

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2789
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2789
  %conv = sext i16 %0 to i32, !dbg !2790
  %mul = mul nsw i32 %conv, 1353, !dbg !2791
    #dbg_value(i32 %mul, !1130, !DIExpression(), !2792)
    #dbg_value(i32 %mul, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2792)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2794
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2794
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2795
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2796
  %shr.i = lshr i32 %sub.i, 16, !dbg !2797
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2798
    #dbg_value(i16 %conv5.i, !1135, !DIExpression(), !2792)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2799
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2800
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2801
    #dbg_value(i32 %inc, !1120, !DIExpression(), !2784)
  br label %for.cond, !dbg !2802, !llvm.loop !2803

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2805
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1164 {
entry:
    #dbg_value(ptr %r, !1163, !DIExpression(), !2806)
    #dbg_value(ptr %a, !1171, !DIExpression(), !2806)
    #dbg_value(ptr %b, !1172, !DIExpression(), !2806)
    #dbg_value(i32 0, !1173, !DIExpression(), !2806)
  br label %for.cond, !dbg !2807

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2808
    #dbg_value(i32 %i.0, !1173, !DIExpression(), !2806)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2809
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2810

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2811
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2811
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2812
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2812
  %add = add i16 %0, %1, !dbg !2813
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2814
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2815
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2816
    #dbg_value(i32 %inc, !1173, !DIExpression(), !2806)
  br label %for.cond, !dbg !2817, !llvm.loop !2818

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2820
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1892 {
entry:
    #dbg_value(ptr %r, !1891, !DIExpression(), !2821)
    #dbg_value(ptr %a, !1895, !DIExpression(), !2821)
    #dbg_value(ptr %b, !1896, !DIExpression(), !2821)
    #dbg_value(i32 0, !1897, !DIExpression(), !2821)
  br label %for.cond, !dbg !2822

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2823
    #dbg_value(i32 %i.0, !1897, !DIExpression(), !2821)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2824
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2825

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2826
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2826
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2827
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2827
  %sub = sub i16 %0, %1, !dbg !2828
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2829
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2830
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2831
    #dbg_value(i32 %inc, !1897, !DIExpression(), !2821)
  br label %for.cond, !dbg !2832, !llvm.loop !2833

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2835
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2836 {
entry:
    #dbg_value(ptr %r, !2839, !DIExpression(), !2840)
    #dbg_value(i32 1, !2841, !DIExpression(), !2840)
    #dbg_value(i32 128, !2842, !DIExpression(), !2840)
  br label %for.cond, !dbg !2843

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2845
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2846
    #dbg_value(i32 %k.0, !2841, !DIExpression(), !2840)
    #dbg_value(i32 %len.0, !2842, !DIExpression(), !2840)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2847
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2849

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2850

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2853
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2840
    #dbg_value(i32 %k.1, !2841, !DIExpression(), !2840)
    #dbg_value(i32 %start.0, !2854, !DIExpression(), !2840)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2855
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2850

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2841, !DIExpression(), !2840)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !2857
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2857
    #dbg_value(i16 %0, !2859, !DIExpression(), !2840)
    #dbg_value(i32 %start.0, !2860, !DIExpression(), !2840)
  br label %for.cond4, !dbg !2861

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2863
    #dbg_value(i32 %j.0, !2860, !DIExpression(), !2840)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2864
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2866
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !2867

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2868
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !2868
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !2868
    #dbg_value(i16 %0, !2870, !DIExpression(), !2874)
    #dbg_value(i16 %2, !2876, !DIExpression(), !2874)
  %conv.i = sext i16 %0 to i32, !dbg !2877
  %conv1.i = sext i16 %2 to i32, !dbg !2878
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2879
    #dbg_value(i32 %mul.i, !1130, !DIExpression(), !2880)
    #dbg_value(i32 %mul.i, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2880)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2882
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2882
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2883
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2884
  %shr.i = lshr i32 %sub.i, 16, !dbg !2885
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2886
    #dbg_value(i16 %conv5.i, !1135, !DIExpression(), !2880)
    #dbg_value(i16 %conv5.i, !2887, !DIExpression(), !2840)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2888
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2888
  %sub = sub i16 %3, %conv5.i, !dbg !2889
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2890
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !2890
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !2891
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2892
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !2892
  %add17 = add i16 %5, %conv5.i, !dbg !2893
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2894
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !2895
  %inc20 = add nuw i32 %j.0, 1, !dbg !2896
    #dbg_value(i32 %inc20, !2860, !DIExpression(), !2840)
  br label %for.cond4, !dbg !2897, !llvm.loop !2898

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2863
  %inc = add i32 %k.1, 1, !dbg !2900
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !2901
    #dbg_value(i32 %add22, !2854, !DIExpression(), !2840)
  br label %for.cond1, !dbg !2902, !llvm.loop !2903

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2840
  %shr = lshr i32 %len.0, 1, !dbg !2905
    #dbg_value(i32 %shr, !2842, !DIExpression(), !2840)
  br label %for.cond, !dbg !2906, !llvm.loop !2907

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !2909
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2910 {
entry:
    #dbg_value(ptr %r, !2911, !DIExpression(), !2912)
    #dbg_value(i16 1441, !2913, !DIExpression(), !2912)
    #dbg_value(i32 127, !2914, !DIExpression(), !2912)
    #dbg_value(i32 2, !2915, !DIExpression(), !2912)
  br label %for.cond, !dbg !2916

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !2918
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !2919
    #dbg_value(i32 %k.0, !2914, !DIExpression(), !2912)
    #dbg_value(i32 %len.0, !2915, !DIExpression(), !2912)
  %cmp = icmp ult i32 %len.0, 129, !dbg !2920
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !2922

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2923

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !2926

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !2928
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !2912
    #dbg_value(i32 %k.1, !2914, !DIExpression(), !2912)
    #dbg_value(i32 %start.0, !2929, !DIExpression(), !2912)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2930
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !2923

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !2914, !DIExpression(), !2912)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !2932
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2932
    #dbg_value(i16 %0, !2934, !DIExpression(), !2912)
    #dbg_value(i32 %start.0, !2935, !DIExpression(), !2912)
  br label %for.cond4, !dbg !2936

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !2938
    #dbg_value(i32 %j.0, !2935, !DIExpression(), !2912)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2939
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2941
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !2942

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2943
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !2943
    #dbg_value(i16 %1, !2945, !DIExpression(), !2912)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2946
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !2946
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2946
  %add11 = add i16 %1, %3, !dbg !2947
    #dbg_value(i16 %add11, !1042, !DIExpression(), !2948)
    #dbg_value(i16 20159, !1049, !DIExpression(), !2948)
  %conv.i10 = sext i16 %add11 to i32, !dbg !2950
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !2951
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !2952
  %shr.i12 = ashr i32 %add.i, 26, !dbg !2953
    #dbg_value(i32 %shr.i12, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2948)
    #dbg_value(i32 %shr.i12, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2948)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !2954
  %5 = mul i16 %4, -3329, !dbg !2954
  %conv7.i = add i16 %5, %add11, !dbg !2954
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2955
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !2956
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2957
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !2957
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !2957
  %sub = sub i16 %7, %1, !dbg !2958
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2959
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !2959
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !2960
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2961
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !2961
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !2961
    #dbg_value(i16 %0, !2870, !DIExpression(), !2962)
    #dbg_value(i16 %10, !2876, !DIExpression(), !2962)
  %conv.i1 = sext i16 %0 to i32, !dbg !2964
  %conv1.i = sext i16 %10 to i32, !dbg !2965
  %mul.i2 = mul nsw i32 %conv.i1, %conv1.i, !dbg !2966
    #dbg_value(i32 %mul.i2, !1130, !DIExpression(), !2967)
    #dbg_value(i32 %mul.i2, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2967)
  %sext.i4 = mul i32 %mul.i2, -218038272, !dbg !2969
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !2969
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !2970
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i2, !dbg !2971
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !2972
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !2973
    #dbg_value(i16 %conv5.i9, !1135, !DIExpression(), !2967)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2974
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !2974
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !2975
  %inc = add nuw i32 %j.0, 1, !dbg !2976
    #dbg_value(i32 %inc, !2935, !DIExpression(), !2912)
  br label %for.cond4, !dbg !2977, !llvm.loop !2978

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2938
  %dec = add i32 %k.1, -1, !dbg !2980
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !2981
    #dbg_value(i32 %add27, !2929, !DIExpression(), !2912)
  br label %for.cond1, !dbg !2982, !llvm.loop !2983

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2912
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !2985
    #dbg_value(i32 %shl, !2915, !DIExpression(), !2912)
  br label %for.cond, !dbg !2986, !llvm.loop !2987

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !2989
    #dbg_value(i32 %j.1, !2935, !DIExpression(), !2912)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !2990
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !2926

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2992
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !2992
    #dbg_value(i16 %12, !2870, !DIExpression(), !2993)
    #dbg_value(i16 1441, !2876, !DIExpression(), !2993)
  %conv.i = sext i16 %12 to i32, !dbg !2995
  %mul.i = mul nsw i32 %conv.i, 1441, !dbg !2996
    #dbg_value(i32 %mul.i, !1130, !DIExpression(), !2997)
    #dbg_value(i32 %mul.i, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2997)
  %sext.i = mul i32 %conv.i, -660537344, !dbg !2999
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2999
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3000
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !3001
  %shr.i = lshr i32 %sub.i, 16, !dbg !3002
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3003
    #dbg_value(i16 %conv5.i, !1135, !DIExpression(), !2997)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !3004
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !3005
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !3006
    #dbg_value(i32 %inc39, !2935, !DIExpression(), !2912)
  br label %for.cond31, !dbg !3007, !llvm.loop !3008

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !3010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !3011 {
entry:
    #dbg_value(ptr %r, !3015, !DIExpression(), !3016)
    #dbg_value(ptr %a, !3017, !DIExpression(), !3016)
    #dbg_value(ptr %b, !3018, !DIExpression(), !3016)
    #dbg_value(i16 %zeta, !3019, !DIExpression(), !3016)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3020
  %0 = load i16, ptr %arrayidx, align 2, !dbg !3020
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3021
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !3021
    #dbg_value(i16 %0, !2870, !DIExpression(), !3022)
    #dbg_value(i16 %1, !2876, !DIExpression(), !3022)
  %conv.i9 = sext i16 %0 to i32, !dbg !3024
  %conv1.i10 = sext i16 %1 to i32, !dbg !3025
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !3026
    #dbg_value(i32 %mul.i11, !1130, !DIExpression(), !3027)
    #dbg_value(i32 %mul.i11, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3027)
  %sext.i29 = mul i32 %mul.i11, -218038272, !dbg !3029
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !3029
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !3030
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i11, !dbg !3031
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !3032
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !3033
    #dbg_value(i16 %conv5.i34, !1135, !DIExpression(), !3027)
  store i16 %conv5.i34, ptr %r, align 2, !dbg !3034
    #dbg_value(i16 %conv5.i34, !2870, !DIExpression(), !3035)
    #dbg_value(i16 %zeta, !2876, !DIExpression(), !3035)
  %conv.i5 = ashr i32 %sub.i32, 16, !dbg !3037
  %conv1.i6 = sext i16 %zeta to i32, !dbg !3038
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !3039
    #dbg_value(i32 %mul.i7, !1130, !DIExpression(), !3040)
    #dbg_value(i32 %mul.i7, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3040)
  %sext.i17 = mul i32 %mul.i7, -218038272, !dbg !3042
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !3042
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !3043
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i7, !dbg !3044
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !3045
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !3046
    #dbg_value(i16 %conv5.i22, !1135, !DIExpression(), !3040)
  store i16 %conv5.i22, ptr %r, align 2, !dbg !3047
  %2 = load i16, ptr %a, align 2, !dbg !3048
  %3 = load i16, ptr %b, align 2, !dbg !3049
    #dbg_value(i16 %2, !2870, !DIExpression(), !3050)
    #dbg_value(i16 %3, !2876, !DIExpression(), !3050)
  %conv.i13 = sext i16 %2 to i32, !dbg !3052
  %conv1.i14 = sext i16 %3 to i32, !dbg !3053
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !3054
    #dbg_value(i32 %mul.i15, !1130, !DIExpression(), !3055)
    #dbg_value(i32 %mul.i15, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3055)
  %sext.i = mul i32 %mul.i15, -218038272, !dbg !3057
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3057
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3058
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i15, !dbg !3059
  %shr.i = lshr i32 %sub.i, 16, !dbg !3060
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3061
    #dbg_value(i16 %conv5.i, !1135, !DIExpression(), !3055)
  %4 = load i16, ptr %r, align 2, !dbg !3062
  %add = add i16 %4, %conv5.i, !dbg !3062
  store i16 %add, ptr %r, align 2, !dbg !3062
  %5 = load i16, ptr %a, align 2, !dbg !3063
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3064
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !3064
    #dbg_value(i16 %5, !2870, !DIExpression(), !3065)
    #dbg_value(i16 %6, !2876, !DIExpression(), !3065)
  %conv.i = sext i16 %5 to i32, !dbg !3067
  %conv1.i = sext i16 %6 to i32, !dbg !3068
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !3069
    #dbg_value(i32 %mul.i, !1130, !DIExpression(), !3070)
    #dbg_value(i32 %mul.i, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3070)
  %sext.i35 = mul i32 %mul.i, -218038272, !dbg !3072
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !3072
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !3073
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i, !dbg !3074
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !3075
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !3076
    #dbg_value(i16 %conv5.i40, !1135, !DIExpression(), !3070)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3077
  store i16 %conv5.i40, ptr %arrayidx15, align 2, !dbg !3078
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3079
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !3079
  %8 = load i16, ptr %b, align 2, !dbg !3080
    #dbg_value(i16 %7, !2870, !DIExpression(), !3081)
    #dbg_value(i16 %8, !2876, !DIExpression(), !3081)
  %conv.i1 = sext i16 %7 to i32, !dbg !3083
  %conv1.i2 = sext i16 %8 to i32, !dbg !3084
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !3085
    #dbg_value(i32 %mul.i3, !1130, !DIExpression(), !3086)
    #dbg_value(i32 %mul.i3, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3086)
  %sext.i23 = mul i32 %mul.i3, -218038272, !dbg !3088
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !3088
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !3089
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i3, !dbg !3090
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !3091
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !3092
    #dbg_value(i16 %conv5.i28, !1135, !DIExpression(), !3086)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3093
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !3094
  %add22 = add i16 %9, %conv5.i28, !dbg !3094
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !3094
  ret void, !dbg !3095
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !912 {
entry:
    #dbg_value(ptr %r, !911, !DIExpression(), !3096)
    #dbg_value(ptr %buf, !923, !DIExpression(), !3096)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3097
  ret void, !dbg !3098
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !3099 {
entry:
    #dbg_value(ptr %r, !3100, !DIExpression(), !3101)
    #dbg_value(ptr %buf, !3102, !DIExpression(), !3101)
    #dbg_value(i32 0, !3103, !DIExpression(), !3101)
  br label %for.cond, !dbg !3104

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !3106
    #dbg_value(i32 %i.0, !3103, !DIExpression(), !3101)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !3107
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !3109

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !3110
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !3112
    #dbg_value(ptr %add.ptr, !3113, !DIExpression(), !3117)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !3119
  %conv.i = zext i8 %0 to i32, !dbg !3120
    #dbg_value(i32 %conv.i, !3121, !DIExpression(), !3117)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3122
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3122
  %conv2.i = zext i8 %1 to i32, !dbg !3123
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3124
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3125
    #dbg_value(i32 %or.i, !3121, !DIExpression(), !3117)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3126
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3126
  %conv4.i = zext i8 %2 to i32, !dbg !3127
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3128
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3129
    #dbg_value(i32 %or6.i, !3121, !DIExpression(), !3117)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !3130
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !3130
  %conv8.i = zext i8 %3 to i32, !dbg !3131
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !3132
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !3133
    #dbg_value(i32 %or10.i, !3121, !DIExpression(), !3117)
    #dbg_value(i32 %or10.i, !3134, !DIExpression(), !3101)
  %and = and i32 %or10.i, 1431655765, !dbg !3135
    #dbg_value(i32 %and, !3136, !DIExpression(), !3101)
  %shr = lshr i32 %or10.i, 1, !dbg !3137
  %and1 = and i32 %shr, 1431655765, !dbg !3138
  %add = add nuw i32 %and, %and1, !dbg !3139
    #dbg_value(i32 %add, !3136, !DIExpression(), !3101)
    #dbg_value(i32 0, !3140, !DIExpression(), !3101)
  br label %for.cond2, !dbg !3141

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !3143
    #dbg_value(i32 %j.0, !3140, !DIExpression(), !3101)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !3144
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !3146

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !3147
  %shr7 = lshr i32 %add, %mul5, !dbg !3149
  %conv = and i32 %shr7, 3, !dbg !3150
    #dbg_value(i32 %shr7, !3151, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !3101)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !3152
  %add10 = or disjoint i32 %mul9, 2, !dbg !3153
  %shr11 = lshr i32 %add, %add10, !dbg !3154
  %conv13 = and i32 %shr11, 3, !dbg !3155
    #dbg_value(i32 %conv13, !3156, !DIExpression(), !3101)
  %sub = sub nsw i32 %conv, %conv13, !dbg !3157
  %conv16 = trunc nsw i32 %sub to i16, !dbg !3158
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !3159
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !3160
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !3161
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !3162
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3163
    #dbg_value(i32 %inc, !3140, !DIExpression(), !3101)
  br label %for.cond2, !dbg !3164, !llvm.loop !3165

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !3167
    #dbg_value(i32 %inc20, !3103, !DIExpression(), !3101)
  br label %for.cond, !dbg !3168, !llvm.loop !3169

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !3171
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1511 {
entry:
    #dbg_value(ptr %r, !1510, !DIExpression(), !3172)
    #dbg_value(ptr %buf, !1514, !DIExpression(), !3172)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3173
  ret void, !dbg !3174
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1131 {
entry:
    #dbg_value(i32 %a, !1130, !DIExpression(), !3175)
    #dbg_value(i32 %a, !1135, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3175)
  %sext = mul i32 %a, -218038272, !dbg !3176
  %conv3 = ashr exact i32 %sext, 16, !dbg !3176
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !3177
  %sub = add i32 %mul4.neg, %a, !dbg !3178
  %shr = lshr i32 %sub, 16, !dbg !3179
  %conv5 = trunc nuw i32 %shr to i16, !dbg !3180
    #dbg_value(i16 %conv5, !1135, !DIExpression(), !3175)
  ret i16 %conv5, !dbg !3181
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1043 {
entry:
    #dbg_value(i16 %a, !1042, !DIExpression(), !3182)
    #dbg_value(i16 20159, !1049, !DIExpression(), !3182)
  %conv = sext i16 %a to i32, !dbg !3183
  %mul = mul nsw i32 %conv, 20159, !dbg !3184
  %add = add nsw i32 %mul, 33554432, !dbg !3185
  %shr = ashr i32 %add, 26, !dbg !3186
    #dbg_value(i32 %shr, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3182)
    #dbg_value(i32 %shr, !1054, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3182)
  %0 = trunc nsw i32 %shr to i16, !dbg !3187
  %1 = mul i16 %0, -3329, !dbg !3187
  %conv7 = add i16 %1, %a, !dbg !3187
  ret i16 %conv7, !dbg !3188
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !417 {
entry:
    #dbg_value(ptr %a, !416, !DIExpression(), !3189)
    #dbg_value(ptr %b, !423, !DIExpression(), !3189)
    #dbg_value(i32 %len, !424, !DIExpression(), !3189)
    #dbg_value(i8 0, !425, !DIExpression(), !3189)
    #dbg_value(i32 0, !426, !DIExpression(), !3189)
  br label %for.cond, !dbg !3190

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3191
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !3189
    #dbg_value(i8 %r.0, !425, !DIExpression(), !3189)
    #dbg_value(i32 %i.0, !426, !DIExpression(), !3189)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3192
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !3193

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3189)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3194
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3194
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !3195
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !3195
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3189)
  %xor1 = xor i8 %0, %1, !dbg !3196
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3189)
  %or2 = or i8 %r.0, %xor1, !dbg !3197
    #dbg_value(i8 %or2, !425, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3189)
    #dbg_value(i8 %or2, !425, !DIExpression(), !3189)
  %inc = add i32 %i.0, 1, !dbg !3198
    #dbg_value(i32 %inc, !426, !DIExpression(), !3189)
  br label %for.cond, !dbg !3199, !llvm.loop !3200

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !3189
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !3202
  %conv6 = zext i1 %2 to i32, !dbg !3203
  ret i32 %conv6, !dbg !3204
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !446 {
entry:
    #dbg_value(ptr %r, !445, !DIExpression(), !3205)
    #dbg_value(ptr %x, !451, !DIExpression(), !3205)
    #dbg_value(i32 %len, !452, !DIExpression(), !3205)
    #dbg_value(i8 %b, !453, !DIExpression(), !3205)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !3206, !srcloc !455
    #dbg_value(i8 %0, !453, !DIExpression(), !3205)
  %sub = sub i8 0, %0, !dbg !3207
    #dbg_value(i8 %sub, !453, !DIExpression(), !3205)
    #dbg_value(i32 0, !457, !DIExpression(), !3205)
  br label %for.cond, !dbg !3208

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3209
    #dbg_value(i32 %i.0, !457, !DIExpression(), !3205)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3210
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3211

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3212
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3212
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3213
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !3213
  %xor1 = xor i8 %1, %2, !dbg !3214
  %and2 = and i8 %xor1, %sub, !dbg !3215
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3216
  %xor93 = xor i8 %1, %and2, !dbg !3217
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !3217
  %inc = add i32 %i.0, 1, !dbg !3218
    #dbg_value(i32 %inc, !457, !DIExpression(), !3205)
  br label %for.cond, !dbg !3219, !llvm.loop !3220

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3222
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1355 {
entry:
    #dbg_value(ptr %r, !1354, !DIExpression(), !3223)
    #dbg_value(i16 %v, !1360, !DIExpression(), !3223)
    #dbg_value(i16 %b, !1361, !DIExpression(), !3223)
  %sub = sub i16 0, %b, !dbg !3224
    #dbg_value(i16 %sub, !1361, !DIExpression(), !3223)
  %0 = load i16, ptr %r, align 2, !dbg !3225
  %xor1 = xor i16 %0, %v, !dbg !3226
  %and = and i16 %xor1, %sub, !dbg !3227
  %xor6 = xor i16 %and, %0, !dbg !3228
  store i16 %xor6, ptr %r, align 2, !dbg !3228
  ret void, !dbg !3229
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3230 {
entry:
    #dbg_value(ptr %state, !3233, !DIExpression(), !3234)
    #dbg_value(ptr %state, !3235, !DIExpression(), !3239)
    #dbg_value(i32 0, !3241, !DIExpression(), !3239)
  br label %for.cond.i, !dbg !3242

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3244
    #dbg_value(i32 %i.0.i, !3241, !DIExpression(), !3239)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3245
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3247

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3248
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3249
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3250
    #dbg_value(i32 %inc.i, !3241, !DIExpression(), !3239)
  br label %for.cond.i, !dbg !3251, !llvm.loop !3252

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3254
  store i32 0, ptr %pos, align 8, !dbg !3255
  ret void, !dbg !3256
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3257 {
entry:
    #dbg_value(ptr %state, !3258, !DIExpression(), !3259)
    #dbg_value(ptr %in, !3260, !DIExpression(), !3259)
    #dbg_value(i32 %inlen, !3261, !DIExpression(), !3259)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3262
  %0 = load i32, ptr %pos, align 8, !dbg !3262
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3263
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3264
  store i32 %call, ptr %pos1, align 8, !dbg !3265
  ret void, !dbg !3266
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3267 {
entry:
    #dbg_value(ptr %s, !3270, !DIExpression(), !3271)
    #dbg_value(i32 %pos, !3272, !DIExpression(), !3271)
    #dbg_value(i32 %r, !3273, !DIExpression(), !3271)
    #dbg_value(ptr %in, !3274, !DIExpression(), !3271)
    #dbg_value(i32 %inlen, !3275, !DIExpression(), !3271)
  br label %while.cond, !dbg !3276

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3272, !DIExpression(), !3271)
    #dbg_value(i32 %inlen.addr.0, !3275, !DIExpression(), !3271)
    #dbg_value(ptr %in.addr.0, !3274, !DIExpression(), !3271)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3277
  %cmp.not = icmp ult i32 %add, %r, !dbg !3278
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3276

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3279
  br label %for.cond, !dbg !3279

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3282

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3284
    #dbg_value(i32 %i.0, !3285, !DIExpression(), !3271)
    #dbg_value(ptr %in.addr.1, !3274, !DIExpression(), !3271)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3286
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3279

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3274, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3271)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3288
  %conv = zext i8 %0 to i64, !dbg !3289
  %rem = shl i32 %i.0, 3, !dbg !3290
  %mul = and i32 %rem, 56, !dbg !3290
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3291
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3291
  %div2 = lshr i32 %i.0, 3, !dbg !3292
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3293
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3294
  %xor = xor i64 %1, %shl, !dbg !3294
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3294
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3295
    #dbg_value(ptr %incdec.ptr, !3274, !DIExpression(), !3271)
  %inc = add i32 %i.0, 1, !dbg !3296
    #dbg_value(i32 %inc, !3285, !DIExpression(), !3271)
  br label %for.cond, !dbg !3297, !llvm.loop !3298

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3300
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3301
    #dbg_value(i32 %sub2, !3275, !DIExpression(), !3271)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3302
    #dbg_value(i32 0, !3272, !DIExpression(), !3271)
  br label %while.cond, !dbg !3276, !llvm.loop !3303

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3305
    #dbg_value(i32 %i.1, !3285, !DIExpression(), !3271)
    #dbg_value(ptr %in.addr.2, !3274, !DIExpression(), !3271)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3306
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3308
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3282

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3274, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3271)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3309
  %conv9 = zext i8 %2 to i64, !dbg !3310
  %rem10 = shl i32 %i.1, 3, !dbg !3311
  %mul11 = and i32 %rem10, 56, !dbg !3311
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3312
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3312
  %div141 = lshr i32 %i.1, 3, !dbg !3313
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3314
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3315
  %xor16 = xor i64 %3, %shl13, !dbg !3315
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3315
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3316
    #dbg_value(ptr %incdec.ptr8, !3274, !DIExpression(), !3271)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3317
    #dbg_value(i32 %inc18, !3285, !DIExpression(), !3271)
  br label %for.cond3, !dbg !3318, !llvm.loop !3319

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3305
  ret i32 %i.1.lcssa, !dbg !3321
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3322 {
entry:
    #dbg_value(ptr %state, !3323, !DIExpression(), !3324)
  %0 = load i64, ptr %state, align 8, !dbg !3325
    #dbg_value(i64 %0, !3326, !DIExpression(), !3324)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3327
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3327
    #dbg_value(i64 %1, !3328, !DIExpression(), !3324)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3329
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3329
    #dbg_value(i64 %2, !3330, !DIExpression(), !3324)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3331
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3331
    #dbg_value(i64 %3, !3332, !DIExpression(), !3324)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3333
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3333
    #dbg_value(i64 %4, !3334, !DIExpression(), !3324)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3335
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3335
    #dbg_value(i64 %5, !3336, !DIExpression(), !3324)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3337
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3337
    #dbg_value(i64 %6, !3338, !DIExpression(), !3324)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3339
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3339
    #dbg_value(i64 %7, !3340, !DIExpression(), !3324)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3341
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3341
    #dbg_value(i64 %8, !3342, !DIExpression(), !3324)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3343
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3343
    #dbg_value(i64 %9, !3344, !DIExpression(), !3324)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3345
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3345
    #dbg_value(i64 %10, !3346, !DIExpression(), !3324)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3347
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3347
    #dbg_value(i64 %11, !3348, !DIExpression(), !3324)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3349
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3349
    #dbg_value(i64 %12, !3350, !DIExpression(), !3324)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3351
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3351
    #dbg_value(i64 %13, !3352, !DIExpression(), !3324)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3353
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3353
    #dbg_value(i64 %14, !3354, !DIExpression(), !3324)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3355
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3355
    #dbg_value(i64 %15, !3356, !DIExpression(), !3324)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3357
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3357
    #dbg_value(i64 %16, !3358, !DIExpression(), !3324)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3359
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3359
    #dbg_value(i64 %17, !3360, !DIExpression(), !3324)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3361
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3361
    #dbg_value(i64 %18, !3362, !DIExpression(), !3324)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3363
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3363
    #dbg_value(i64 %19, !3364, !DIExpression(), !3324)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3365
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3365
    #dbg_value(i64 %20, !3366, !DIExpression(), !3324)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3367
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3367
    #dbg_value(i64 %21, !3368, !DIExpression(), !3324)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3369
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3369
    #dbg_value(i64 %22, !3370, !DIExpression(), !3324)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3371
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3371
    #dbg_value(i64 %23, !3372, !DIExpression(), !3324)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3373
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3373
    #dbg_value(i64 %24, !3374, !DIExpression(), !3324)
    #dbg_value(i32 0, !3375, !DIExpression(), !3324)
  br label %for.cond, !dbg !3376

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3324
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3324
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3324
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3324
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3324
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3324
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3324
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3324
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3324
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3324
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3324
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3324
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3324
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3324
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3324
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3324
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3324
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3324
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3324
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3324
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3324
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3324
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3324
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3324
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3378
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3324
    #dbg_value(i64 %Asu.0, !3374, !DIExpression(), !3324)
    #dbg_value(i32 %round.0, !3375, !DIExpression(), !3324)
    #dbg_value(i64 %Aba.0, !3326, !DIExpression(), !3324)
    #dbg_value(i64 %Abe.0, !3328, !DIExpression(), !3324)
    #dbg_value(i64 %Abi.0, !3330, !DIExpression(), !3324)
    #dbg_value(i64 %Abo.0, !3332, !DIExpression(), !3324)
    #dbg_value(i64 %Abu.0, !3334, !DIExpression(), !3324)
    #dbg_value(i64 %Aga.0, !3336, !DIExpression(), !3324)
    #dbg_value(i64 %Age.0, !3338, !DIExpression(), !3324)
    #dbg_value(i64 %Agi.0, !3340, !DIExpression(), !3324)
    #dbg_value(i64 %Ago.0, !3342, !DIExpression(), !3324)
    #dbg_value(i64 %Agu.0, !3344, !DIExpression(), !3324)
    #dbg_value(i64 %Aka.0, !3346, !DIExpression(), !3324)
    #dbg_value(i64 %Ake.0, !3348, !DIExpression(), !3324)
    #dbg_value(i64 %Aki.0, !3350, !DIExpression(), !3324)
    #dbg_value(i64 %Ako.0, !3352, !DIExpression(), !3324)
    #dbg_value(i64 %Aku.0, !3354, !DIExpression(), !3324)
    #dbg_value(i64 %Ama.0, !3356, !DIExpression(), !3324)
    #dbg_value(i64 %Ame.0, !3358, !DIExpression(), !3324)
    #dbg_value(i64 %Ami.0, !3360, !DIExpression(), !3324)
    #dbg_value(i64 %Amo.0, !3362, !DIExpression(), !3324)
    #dbg_value(i64 %Amu.0, !3364, !DIExpression(), !3324)
    #dbg_value(i64 %Asa.0, !3366, !DIExpression(), !3324)
    #dbg_value(i64 %Ase.0, !3368, !DIExpression(), !3324)
    #dbg_value(i64 %Asi.0, !3370, !DIExpression(), !3324)
    #dbg_value(i64 %Aso.0, !3372, !DIExpression(), !3324)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3379
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3381

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3387, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3388, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3389, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3390, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3391, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3387, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3388, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3389, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3390, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3391, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 poison, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3417
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3419
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3420
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3421
    #dbg_value(i64 %xor35, !3384, !DIExpression(), !3324)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3422
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3423
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3424
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3425
    #dbg_value(i64 %xor43, !3386, !DIExpression(), !3324)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3426
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3390, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3427
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 %xor57, !3390, !DIExpression(), !3324)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3428
    #dbg_value(i64 %xor203, !3342, !DIExpression(), !3324)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3429
    #dbg_value(i64 %xor206, !3383, !DIExpression(), !3324)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3430
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3431
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3432
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3433
    #dbg_value(i64 %xor31, !3383, !DIExpression(), !3324)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3434
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3387, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3435
    #dbg_value(i64 %xor45, !3387, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3436
    #dbg_value(i64 %xor211, !3356, !DIExpression(), !3324)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3437
    #dbg_value(i64 %xor214, !3385, !DIExpression(), !3324)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3438
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3439
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3440
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3441
    #dbg_value(i64 %xor39, !3385, !DIExpression(), !3324)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3442
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3443
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3444
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3445
    #dbg_value(i64 %xor27, !3382, !DIExpression(), !3324)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3446
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3391, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3447
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 %xor61, !3391, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3448
    #dbg_value(i64 %xor207, !3354, !DIExpression(), !3324)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3449
    #dbg_value(i64 %xor210, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not222 = xor i64 %xor210, -1, !dbg !3450
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and223 = and i64 %xor214, %not222, !dbg !3451
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor224 = xor i64 %xor206, %and223, !dbg !3452
    #dbg_value(i64 %xor224, !3413, !DIExpression(), !3324)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3453
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3389, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3454
    #dbg_value(i64 %xor53, !3389, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3455
    #dbg_value(i64 %xor67, !3350, !DIExpression(), !3324)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3456
    #dbg_value(i64 %xor70, !3384, !DIExpression(), !3324)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3457
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3388, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3458
    #dbg_value(i64 %xor49, !3388, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3459
    #dbg_value(i64 %xor63, !3338, !DIExpression(), !3324)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3460
    #dbg_value(i64 %xor66, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not = xor i64 %xor66, -1, !dbg !3461
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and = and i64 %xor70, %not, !dbg !3462
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3463
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3463
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %26 = xor i64 %and, %25, !dbg !3464
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3465
    #dbg_value(i64 %xor62, !3326, !DIExpression(), !3324)
    #dbg_value(i64 %xor62, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor81 = xor i64 %26, %xor62, !dbg !3464
    #dbg_value(i64 %xor81, !3392, !DIExpression(), !3324)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3466
    #dbg_value(i64 %xor94, !3332, !DIExpression(), !3324)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3467
    #dbg_value(i64 %xor97, !3382, !DIExpression(), !3324)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3468
    #dbg_value(i64 %xor102, !3346, !DIExpression(), !3324)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3469
    #dbg_value(i64 %xor105, !3384, !DIExpression(), !3324)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3470
    #dbg_value(i64 %xor98, !3344, !DIExpression(), !3324)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3471
    #dbg_value(i64 %xor101, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not114 = xor i64 %xor101, -1, !dbg !3472
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and115 = and i64 %xor105, %not114, !dbg !3473
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor116 = xor i64 %xor97, %and115, !dbg !3474
    #dbg_value(i64 %xor116, !3397, !DIExpression(), !3324)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3475
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3476
    #dbg_value(i64 %xor129, !3328, !DIExpression(), !3324)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3477
    #dbg_value(i64 %xor132, !3382, !DIExpression(), !3324)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3478
    #dbg_value(i64 %xor137, !3352, !DIExpression(), !3324)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3479
    #dbg_value(i64 %xor140, !3384, !DIExpression(), !3324)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3480
    #dbg_value(i64 %xor133, !3340, !DIExpression(), !3324)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3481
    #dbg_value(i64 %xor136, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not149 = xor i64 %xor136, -1, !dbg !3482
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and150 = and i64 %xor140, %not149, !dbg !3483
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor151 = xor i64 %xor132, %and150, !dbg !3484
    #dbg_value(i64 %xor151, !3402, !DIExpression(), !3324)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3485
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3486
    #dbg_value(i64 %xor164, !3334, !DIExpression(), !3324)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3487
    #dbg_value(i64 %xor167, !3382, !DIExpression(), !3324)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3488
    #dbg_value(i64 %xor172, !3348, !DIExpression(), !3324)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3489
    #dbg_value(i64 %xor175, !3384, !DIExpression(), !3324)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3490
    #dbg_value(i64 %xor168, !3336, !DIExpression(), !3324)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3491
    #dbg_value(i64 %xor171, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not184 = xor i64 %xor171, -1, !dbg !3492
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and185 = and i64 %xor175, %not184, !dbg !3493
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor186 = xor i64 %xor167, %and185, !dbg !3494
    #dbg_value(i64 %xor186, !3407, !DIExpression(), !3324)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3495
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3496
    #dbg_value(i64 %xor199, !3330, !DIExpression(), !3324)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3497
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not219 = xor i64 %xor206, -1, !dbg !3498
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and220 = and i64 %xor210, %not219, !dbg !3499
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor221 = xor i64 %xor202, %and220, !dbg !3500
    #dbg_value(i64 %xor221, !3412, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3501
    #dbg_value(i64 %xor237, !3382, !DIExpression(), !3324)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3502
    #dbg_value(i64 %xor75, !3374, !DIExpression(), !3324)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3503
    #dbg_value(i64 %xor78, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3504
    #dbg_value(i64 %xor71, !3362, !DIExpression(), !3324)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3505
    #dbg_value(i64 %xor74, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not85 = xor i64 %xor74, -1, !dbg !3506
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and86 = and i64 %xor78, %not85, !dbg !3507
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor87 = xor i64 %xor70, %and86, !dbg !3508
    #dbg_value(i64 %xor87, !3394, !DIExpression(), !3324)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3509
    #dbg_value(i64 %xor110, !3370, !DIExpression(), !3324)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3510
    #dbg_value(i64 %xor113, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3511
    #dbg_value(i64 %xor106, !3358, !DIExpression(), !3324)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3512
    #dbg_value(i64 %xor109, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not120 = xor i64 %xor109, -1, !dbg !3513
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and121 = and i64 %xor113, %not120, !dbg !3514
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor122 = xor i64 %xor105, %and121, !dbg !3515
    #dbg_value(i64 %xor122, !3399, !DIExpression(), !3324)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3516
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3517
    #dbg_value(i64 %xor145, !3366, !DIExpression(), !3324)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3518
    #dbg_value(i64 %xor148, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3519
    #dbg_value(i64 %xor141, !3364, !DIExpression(), !3324)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3520
    #dbg_value(i64 %xor144, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not155 = xor i64 %xor144, -1, !dbg !3521
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and156 = and i64 %xor148, %not155, !dbg !3522
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor157 = xor i64 %xor140, %and156, !dbg !3523
    #dbg_value(i64 %xor157, !3404, !DIExpression(), !3324)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3524
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3525
    #dbg_value(i64 %xor180, !3372, !DIExpression(), !3324)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3526
    #dbg_value(i64 %xor183, !3386, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3527
    #dbg_value(i64 %xor176, !3360, !DIExpression(), !3324)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3528
    #dbg_value(i64 %xor179, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %not190 = xor i64 %xor179, -1, !dbg !3529
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and191 = and i64 %xor183, %not190, !dbg !3530
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor192 = xor i64 %xor175, %and191, !dbg !3531
    #dbg_value(i64 %xor192, !3409, !DIExpression(), !3324)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3532
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3533
    #dbg_value(i64 %xor215, !3368, !DIExpression(), !3324)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3534
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not225 = xor i64 %xor214, -1, !dbg !3535
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and226 = and i64 %xor218, %not225, !dbg !3536
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor227 = xor i64 %xor210, %and226, !dbg !3537
    #dbg_value(i64 %xor227, !3414, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3384, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3538
    #dbg_value(i64 %xor245, !3384, !DIExpression(), !3324)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3539
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3388, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3540
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3413, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 %xor261, !3388, !DIExpression(), !3324)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3541
    #dbg_value(i64 %xor429, !3413, !DIExpression(), !3324)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3542
    #dbg_value(i64 %xor432, !3386, !DIExpression(), !3324)
  %not123 = xor i64 %xor113, -1, !dbg !3543
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and124 = and i64 %xor97, %not123, !dbg !3544
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor125 = xor i64 %xor109, %and124, !dbg !3545
    #dbg_value(i64 %xor125, !3400, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not91 = xor i64 %xor62, -1, !dbg !3546
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and92 = and i64 %xor66, %not91, !dbg !3547
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor93 = xor i64 %xor78, %and92, !dbg !3548
    #dbg_value(i64 %xor93, !3396, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not126 = xor i64 %xor97, -1, !dbg !3549
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and127 = and i64 %xor101, %not126, !dbg !3550
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor128 = xor i64 %xor113, %and127, !dbg !3551
    #dbg_value(i64 %xor128, !3401, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3552
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not161 = xor i64 %xor132, -1, !dbg !3553
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and162 = and i64 %xor136, %not161, !dbg !3554
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor163 = xor i64 %xor148, %and162, !dbg !3555
    #dbg_value(i64 %xor163, !3406, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3556
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not196 = xor i64 %xor167, -1, !dbg !3557
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and197 = and i64 %xor171, %not196, !dbg !3558
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor198 = xor i64 %xor183, %and197, !dbg !3559
    #dbg_value(i64 %xor198, !3411, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3560
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not231 = xor i64 %xor202, -1, !dbg !3561
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %and232 = and i64 %xor206, %not231, !dbg !3562
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor233 = xor i64 %xor218, %and232, !dbg !3563
    #dbg_value(i64 %xor233, !3416, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3386, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3564
    #dbg_value(i64 %xor253, !3386, !DIExpression(), !3324)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3565
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3390, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3566
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3400, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 %xor269, !3390, !DIExpression(), !3324)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3567
    #dbg_value(i64 %xor417, !3400, !DIExpression(), !3324)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3568
    #dbg_value(i64 %xor420, !3383, !DIExpression(), !3324)
  %not82 = xor i64 %xor70, -1, !dbg !3569
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and83 = and i64 %xor74, %not82, !dbg !3570
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor84 = xor i64 %xor66, %and83, !dbg !3571
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3393, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %not117 = xor i64 %xor105, -1, !dbg !3572
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and118 = and i64 %xor109, %not117, !dbg !3573
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor119 = xor i64 %xor101, %and118, !dbg !3574
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3398, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3575
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %not152 = xor i64 %xor140, -1, !dbg !3576
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and153 = and i64 %xor144, %not152, !dbg !3577
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor154 = xor i64 %xor136, %and153, !dbg !3578
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3403, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3579
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %not187 = xor i64 %xor175, -1, !dbg !3580
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and188 = and i64 %xor179, %not187, !dbg !3581
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor189 = xor i64 %xor171, %and188, !dbg !3582
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3408, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3583
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3383, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3584
    #dbg_value(i64 %xor241, !3383, !DIExpression(), !3324)
  %not88 = xor i64 %xor78, -1, !dbg !3585
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and89 = and i64 %xor62, %not88, !dbg !3586
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor90 = xor i64 %xor74, %and89, !dbg !3587
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3395, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3588
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not158 = xor i64 %xor148, -1, !dbg !3589
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and159 = and i64 %xor132, %not158, !dbg !3590
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor160 = xor i64 %xor144, %and159, !dbg !3591
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3405, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3592
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not193 = xor i64 %xor183, -1, !dbg !3593
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and194 = and i64 %xor167, %not193, !dbg !3594
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor195 = xor i64 %xor179, %and194, !dbg !3595
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3410, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3596
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %not228 = xor i64 %xor218, -1, !dbg !3597
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and229 = and i64 %xor202, %not228, !dbg !3598
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor230 = xor i64 %xor214, %and229, !dbg !3599
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3385, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3600
    #dbg_value(i64 %xor249, !3385, !DIExpression(), !3324)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3601
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3389, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3602
    #dbg_value(i64 %xor265, !3389, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3394, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3409, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3399, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3414, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3404, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3603
    #dbg_value(i64 %xor413, !3394, !DIExpression(), !3324)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3604
    #dbg_value(i64 %xor416, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not445 = xor i64 %xor416, -1, !dbg !3605
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and446 = and i64 %xor420, %not445, !dbg !3606
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3374, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor447 = xor i64 %xor432, %and446, !dbg !3607
    #dbg_value(i64 %xor447, !3374, !DIExpression(), !3324)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3608
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3387, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3609
    #dbg_value(i64 %xor257, !3387, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3397, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3412, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3402, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3382, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3392, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3407, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3610
    #dbg_value(i64 %xor425, !3407, !DIExpression(), !3324)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3611
    #dbg_value(i64 %xor428, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not442 = xor i64 %xor432, -1, !dbg !3612
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and443 = and i64 %xor416, %not442, !dbg !3613
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3372, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor444 = xor i64 %xor428, %and443, !dbg !3614
    #dbg_value(i64 %xor444, !3372, !DIExpression(), !3324)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3615
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3391, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3616
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3396, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3411, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3401, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3416, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(i64 %xor273, !3391, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3406, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3617
    #dbg_value(i64 %xor421, !3406, !DIExpression(), !3324)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3618
    #dbg_value(i64 %xor424, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not439 = xor i64 %xor428, -1, !dbg !3619
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and440 = and i64 %xor432, %not439, !dbg !3620
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3370, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor441 = xor i64 %xor424, %and440, !dbg !3621
    #dbg_value(i64 %xor441, !3370, !DIExpression(), !3324)
  %not436 = xor i64 %xor424, -1, !dbg !3622
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and437 = and i64 %xor428, %not436, !dbg !3623
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3368, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor438 = xor i64 %xor420, %and437, !dbg !3624
    #dbg_value(i64 %xor438, !3368, !DIExpression(), !3324)
  %not433 = xor i64 %xor420, -1, !dbg !3625
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and434 = and i64 %xor424, %not433, !dbg !3626
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3366, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor435 = xor i64 %xor416, %and434, !dbg !3627
    #dbg_value(i64 %xor435, !3366, !DIExpression(), !3324)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3628
    #dbg_value(i64 %xor394, !3415, !DIExpression(), !3324)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3629
    #dbg_value(i64 %xor397, !3386, !DIExpression(), !3324)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3630
    #dbg_value(i64 %xor382, !3397, !DIExpression(), !3324)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3631
    #dbg_value(i64 %xor385, !3383, !DIExpression(), !3324)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3632
    #dbg_value(i64 %xor378, !3396, !DIExpression(), !3324)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3633
    #dbg_value(i64 %xor381, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not410 = xor i64 %xor381, -1, !dbg !3634
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and411 = and i64 %xor385, %not410, !dbg !3635
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3364, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor412 = xor i64 %xor397, %and411, !dbg !3636
    #dbg_value(i64 %xor412, !3364, !DIExpression(), !3324)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3637
    #dbg_value(i64 %xor390, !3409, !DIExpression(), !3324)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3638
    #dbg_value(i64 %xor393, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not407 = xor i64 %xor397, -1, !dbg !3639
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and408 = and i64 %xor381, %not407, !dbg !3640
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3362, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor409 = xor i64 %xor393, %and408, !dbg !3641
    #dbg_value(i64 %xor409, !3362, !DIExpression(), !3324)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3642
    #dbg_value(i64 %xor386, !3403, !DIExpression(), !3324)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3643
    #dbg_value(i64 %xor389, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not404 = xor i64 %xor393, -1, !dbg !3644
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and405 = and i64 %xor397, %not404, !dbg !3645
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3360, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor406 = xor i64 %xor389, %and405, !dbg !3646
    #dbg_value(i64 %xor406, !3360, !DIExpression(), !3324)
  %not401 = xor i64 %xor389, -1, !dbg !3647
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and402 = and i64 %xor393, %not401, !dbg !3648
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor403 = xor i64 %xor385, %and402, !dbg !3649
    #dbg_value(i64 %xor403, !3358, !DIExpression(), !3324)
  %not398 = xor i64 %xor385, -1, !dbg !3650
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and399 = and i64 %xor389, %not398, !dbg !3651
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3356, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor400 = xor i64 %xor381, %and399, !dbg !3652
    #dbg_value(i64 %xor400, !3356, !DIExpression(), !3324)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3653
    #dbg_value(i64 %xor359, !3412, !DIExpression(), !3324)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3654
    #dbg_value(i64 %xor362, !3386, !DIExpression(), !3324)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3655
    #dbg_value(i64 %xor347, !3399, !DIExpression(), !3324)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3656
    #dbg_value(i64 %xor350, !3383, !DIExpression(), !3324)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3657
    #dbg_value(i64 %xor343, !3393, !DIExpression(), !3324)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3658
    #dbg_value(i64 %xor346, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not375 = xor i64 %xor346, -1, !dbg !3659
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and376 = and i64 %xor350, %not375, !dbg !3660
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3354, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor377 = xor i64 %xor362, %and376, !dbg !3661
    #dbg_value(i64 %xor377, !3354, !DIExpression(), !3324)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3662
    #dbg_value(i64 %xor355, !3411, !DIExpression(), !3324)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3663
    #dbg_value(i64 %xor358, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not372 = xor i64 %xor362, -1, !dbg !3664
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and373 = and i64 %xor346, %not372, !dbg !3665
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3352, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor374 = xor i64 %xor358, %and373, !dbg !3666
    #dbg_value(i64 %xor374, !3352, !DIExpression(), !3324)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3667
    #dbg_value(i64 %xor351, !3405, !DIExpression(), !3324)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3668
    #dbg_value(i64 %xor354, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not369 = xor i64 %xor358, -1, !dbg !3669
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and370 = and i64 %xor362, %not369, !dbg !3670
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3350, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor371 = xor i64 %xor354, %and370, !dbg !3671
    #dbg_value(i64 %xor371, !3350, !DIExpression(), !3324)
  %not366 = xor i64 %xor354, -1, !dbg !3672
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and367 = and i64 %xor358, %not366, !dbg !3673
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3348, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor368 = xor i64 %xor350, %and367, !dbg !3674
    #dbg_value(i64 %xor368, !3348, !DIExpression(), !3324)
  %not363 = xor i64 %xor350, -1, !dbg !3675
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and364 = and i64 %xor354, %not363, !dbg !3676
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3346, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor365 = xor i64 %xor346, %and364, !dbg !3677
    #dbg_value(i64 %xor365, !3346, !DIExpression(), !3324)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3678
    #dbg_value(i64 %xor324, !3414, !DIExpression(), !3324)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3679
    #dbg_value(i64 %xor327, !3386, !DIExpression(), !3324)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3680
    #dbg_value(i64 %xor312, !3401, !DIExpression(), !3324)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3681
    #dbg_value(i64 %xor315, !3383, !DIExpression(), !3324)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3682
    #dbg_value(i64 %xor308, !3395, !DIExpression(), !3324)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3683
    #dbg_value(i64 %xor311, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not340 = xor i64 %xor311, -1, !dbg !3684
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and341 = and i64 %xor315, %not340, !dbg !3685
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3344, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor342 = xor i64 %xor327, %and341, !dbg !3686
    #dbg_value(i64 %xor342, !3344, !DIExpression(), !3324)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3687
    #dbg_value(i64 %xor320, !3408, !DIExpression(), !3324)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3688
    #dbg_value(i64 %xor323, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not337 = xor i64 %xor327, -1, !dbg !3689
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and338 = and i64 %xor311, %not337, !dbg !3690
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3342, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor339 = xor i64 %xor323, %and338, !dbg !3691
    #dbg_value(i64 %xor339, !3342, !DIExpression(), !3324)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3692
    #dbg_value(i64 %xor316, !3402, !DIExpression(), !3324)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3693
    #dbg_value(i64 %xor319, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not334 = xor i64 %xor323, -1, !dbg !3694
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and335 = and i64 %xor327, %not334, !dbg !3695
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3340, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor336 = xor i64 %xor319, %and335, !dbg !3696
    #dbg_value(i64 %xor336, !3340, !DIExpression(), !3324)
  %not331 = xor i64 %xor319, -1, !dbg !3697
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and332 = and i64 %xor323, %not331, !dbg !3698
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3338, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor333 = xor i64 %xor315, %and332, !dbg !3699
    #dbg_value(i64 %xor333, !3338, !DIExpression(), !3324)
  %not328 = xor i64 %xor315, -1, !dbg !3700
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and329 = and i64 %xor319, %not328, !dbg !3701
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3336, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor330 = xor i64 %xor311, %and329, !dbg !3702
    #dbg_value(i64 %xor330, !3336, !DIExpression(), !3324)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3703
    #dbg_value(i64 %xor287, !3416, !DIExpression(), !3324)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3704
    #dbg_value(i64 %xor290, !3386, !DIExpression(), !3324)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3705
    #dbg_value(i64 %xor275, !3398, !DIExpression(), !3324)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3706
    #dbg_value(i64 %xor278, !3383, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3707
    #dbg_value(i64 %xor274, !3392, !DIExpression(), !3324)
    #dbg_value(i64 %xor274, !3382, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not305 = xor i64 %xor274, -1, !dbg !3708
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and306 = and i64 %xor278, %not305, !dbg !3709
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3334, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor307 = xor i64 %xor290, %and306, !dbg !3710
    #dbg_value(i64 %xor307, !3334, !DIExpression(), !3324)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3711
    #dbg_value(i64 %xor283, !3410, !DIExpression(), !3324)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3712
    #dbg_value(i64 %xor286, !3385, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not302 = xor i64 %xor290, -1, !dbg !3713
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and303 = and i64 %xor274, %not302, !dbg !3714
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3332, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor304 = xor i64 %xor286, %and303, !dbg !3715
    #dbg_value(i64 %xor304, !3332, !DIExpression(), !3324)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3716
    #dbg_value(i64 %xor279, !3404, !DIExpression(), !3324)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3717
    #dbg_value(i64 %xor282, !3384, !DIExpression(), !3324)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %not299 = xor i64 %xor286, -1, !dbg !3718
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and300 = and i64 %xor290, %not299, !dbg !3719
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3330, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor301 = xor i64 %xor282, %and300, !dbg !3720
    #dbg_value(i64 %xor301, !3330, !DIExpression(), !3324)
  %not296 = xor i64 %xor282, -1, !dbg !3721
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3324)
  %and297 = and i64 %xor286, %not296, !dbg !3722
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3328, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %xor298 = xor i64 %xor278, %and297, !dbg !3723
    #dbg_value(i64 %xor298, !3328, !DIExpression(), !3324)
  %add = or disjoint i32 %round.0, 1, !dbg !3724
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3725
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3725
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %not291 = xor i64 %xor278, -1, !dbg !3726
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %and292 = and i64 %xor282, %not291, !dbg !3727
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3326, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3324)
  %28 = xor i64 %and292, %27, !dbg !3728
  %xor295 = xor i64 %28, %xor274, !dbg !3728
    #dbg_value(i64 %xor295, !3326, !DIExpression(), !3324)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3729
    #dbg_value(i32 %add448, !3375, !DIExpression(), !3324)
  br label %for.cond, !dbg !3730, !llvm.loop !3731

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3324
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3324
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3324
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3324
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3324
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3324
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3324
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3324
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3324
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3324
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3324
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3324
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3324
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3324
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3324
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3324
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3324
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3324
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3324
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3324
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3324
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3324
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3324
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3324
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3324
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3733
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3734
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3735
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3736
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3737
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3738
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3739
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3740
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3741
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3742
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3743
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3744
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3745
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3746
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3747
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3748
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3749
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3750
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3751
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3752
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3753
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3754
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3755
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3756
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3757
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3758
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3759
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3760
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3761
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3762
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3763
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3764
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3765
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3766
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3767
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3768
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3769
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3770
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3771
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3772
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3773
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3774
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3775
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3776
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3777
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3778
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3779
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3780
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3781
  ret void, !dbg !3782
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3783 {
entry:
    #dbg_value(ptr %state, !3784, !DIExpression(), !3785)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3786
  %0 = load i32, ptr %pos, align 8, !dbg !3786
    #dbg_value(ptr %state, !3787, !DIExpression(), !3791)
    #dbg_value(i32 %0, !3793, !DIExpression(), !3791)
    #dbg_value(i32 168, !3794, !DIExpression(), !3791)
    #dbg_value(i8 31, !3795, !DIExpression(), !3791)
  %rem.i = shl i32 %0, 3, !dbg !3796
  %mul.i = and i32 %rem.i, 56, !dbg !3796
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3797
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3797
  %div2.i = lshr i32 %0, 3, !dbg !3798
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3799
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3800
  %xor.i = xor i64 %1, %shl.i, !dbg !3800
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3800
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !3801
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3802
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3802
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3802
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3803
  store i32 168, ptr %pos1, align 8, !dbg !3804
  ret void, !dbg !3805
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !3806 {
entry:
    #dbg_value(ptr %out, !3807, !DIExpression(), !3808)
    #dbg_value(i32 %outlen, !3809, !DIExpression(), !3808)
    #dbg_value(ptr %state, !3810, !DIExpression(), !3808)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3811
  %0 = load i32, ptr %pos, align 8, !dbg !3811
    #dbg_value(ptr %out, !867, !DIExpression(), !3812)
    #dbg_value(i32 %outlen, !873, !DIExpression(), !3812)
    #dbg_value(ptr %state, !874, !DIExpression(), !3812)
    #dbg_value(i32 %0, !875, !DIExpression(), !3812)
    #dbg_value(i32 168, !876, !DIExpression(), !3812)
  br label %while.cond.i, !dbg !3814

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !867, !DIExpression(), !3812)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !3812)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !3812)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3814
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3814

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !3815
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3815

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3816
    #dbg_value(i32 0, !875, !DIExpression(), !3812)
  br label %if.end.i, !dbg !3817

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !3812)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !3812)
  br label %for.cond.i, !dbg !3818

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3819
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !3812)
    #dbg_value(i32 %i.0.i, !884, !DIExpression(), !3812)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !3820
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3821
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3821
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3821
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3822

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3823
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3824
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3824
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3825
  %mul.i = and i32 %rem.i, 56, !dbg !3825
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3826
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3826
  %conv.i = trunc i64 %shr.i to i8, !dbg !3824
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3812)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3827
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3828
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !3812)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3829
    #dbg_value(i32 %inc.i, !884, !DIExpression(), !3812)
  br label %for.cond.i, !dbg !3830, !llvm.loop !3831

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3819
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3833
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3834
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !3812)
    #dbg_value(i32 %i.0.i.lcssa, !875, !DIExpression(), !3812)
  br label %while.cond.i, !dbg !3814, !llvm.loop !3835

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3837
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3838
  ret void, !dbg !3839
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !563 {
entry:
    #dbg_value(ptr %state, !562, !DIExpression(), !3840)
    #dbg_value(ptr %in, !574, !DIExpression(), !3840)
    #dbg_value(i32 %inlen, !575, !DIExpression(), !3840)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3841
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3842
  store i32 168, ptr %pos, align 8, !dbg !3843
  ret void, !dbg !3844
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !3845 {
entry:
    #dbg_value(ptr %s, !3848, !DIExpression(), !3849)
    #dbg_value(i32 %r, !3850, !DIExpression(), !3849)
    #dbg_value(ptr %in, !3851, !DIExpression(), !3849)
    #dbg_value(i32 %inlen, !3852, !DIExpression(), !3849)
    #dbg_value(i8 %p, !3853, !DIExpression(), !3849)
    #dbg_value(i32 0, !3854, !DIExpression(), !3849)
  br label %for.cond, !dbg !3855

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3857
    #dbg_value(i32 %i.0, !3854, !DIExpression(), !3849)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3858
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !3860

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !3861
  br label %while.cond, !dbg !3861

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3862
  store i64 0, ptr %arrayidx, align 8, !dbg !3863
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3864
    #dbg_value(i32 %inc, !3854, !DIExpression(), !3849)
  br label %for.cond, !dbg !3865, !llvm.loop !3866

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !3852, !DIExpression(), !3849)
    #dbg_value(ptr %in.addr.0, !3851, !DIExpression(), !3849)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !3868
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !3861

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !3869

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !3872

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !3874
    #dbg_value(i32 %i.1, !3854, !DIExpression(), !3849)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !3875
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !3869

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !3877
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3878
    #dbg_value(ptr %add.ptr, !3879, !DIExpression(), !3883)
    #dbg_value(i64 0, !3885, !DIExpression(), !3883)
    #dbg_value(i32 0, !3886, !DIExpression(), !3883)
  br label %for.cond.i, !dbg !3887

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !3889
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !3883
    #dbg_value(i64 %r.0.i, !3885, !DIExpression(), !3883)
    #dbg_value(i32 %i.0.i, !3886, !DIExpression(), !3883)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !3890
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !3892

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3883)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !3893
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !3893
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3883)
  %conv.i = zext i8 %1 to i64, !dbg !3894
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3883)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3895
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3883)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3896
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3883)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !3896
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !3885, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !3883)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !3897
    #dbg_value(i64 %or.i, !3885, !DIExpression(), !3883)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3898
    #dbg_value(i32 %inc.i, !3886, !DIExpression(), !3883)
  br label %for.cond.i, !dbg !3899, !llvm.loop !3900

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !3883
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3902
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !3903
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !3903
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3903
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !3904
    #dbg_value(i32 %inc7, !3854, !DIExpression(), !3849)
  br label %for.cond2, !dbg !3905, !llvm.loop !3906

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3908
    #dbg_value(ptr %add.ptr9, !3851, !DIExpression(), !3849)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3909
    #dbg_value(i32 %sub, !3852, !DIExpression(), !3849)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3910
  br label %while.cond, !dbg !3861, !llvm.loop !3911

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !3913
    #dbg_value(i32 %i.2, !3854, !DIExpression(), !3849)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !3914
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !3872

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !3916
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !3916
  %conv = zext i8 %3 to i64, !dbg !3917
  %rem = shl i32 %i.2, 3, !dbg !3918
  %mul14 = and i32 %rem, 56, !dbg !3918
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !3919
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3919
  %div153 = lshr i32 %i.2, 3, !dbg !3920
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !3921
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !3922
  %xor17 = xor i64 %4, %shl, !dbg !3922
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !3922
  %inc19 = add i32 %i.2, 1, !dbg !3923
    #dbg_value(i32 %inc19, !3854, !DIExpression(), !3849)
  br label %for.cond10, !dbg !3924, !llvm.loop !3925

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !3913
  %conv21 = zext i8 %p to i64, !dbg !3927
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !3928
  %mul23 = and i32 %rem22, 56, !dbg !3928
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !3929
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !3929
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !3930
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !3931
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !3932
  %xor28 = xor i64 %5, %shl25, !dbg !3932
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !3932
  %sub29 = add i32 %r, -1, !dbg !3933
  %div302 = lshr i32 %sub29, 3, !dbg !3934
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !3935
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !3936
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !3936
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !3936
  ret void, !dbg !3937
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !596 {
entry:
    #dbg_value(ptr %out, !595, !DIExpression(), !3938)
    #dbg_value(i32 %nblocks, !601, !DIExpression(), !3938)
    #dbg_value(ptr %state, !602, !DIExpression(), !3938)
    #dbg_value(ptr %out, !603, !DIExpression(), !3939)
    #dbg_value(i32 %nblocks, !610, !DIExpression(), !3939)
    #dbg_value(ptr %state, !611, !DIExpression(), !3939)
    #dbg_value(i32 168, !612, !DIExpression(), !3939)
  br label %while.cond.i, !dbg !3941

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !3939)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !3939)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !3941
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !3941

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3942
    #dbg_value(i32 0, !616, !DIExpression(), !3939)
  br label %for.cond.i, !dbg !3943

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !3944
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !3939)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !3945
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !3946

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3947
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !3948
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3949
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !3949
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !3950)
    #dbg_value(i64 %0, !632, !DIExpression(), !3950)
    #dbg_value(i32 0, !633, !DIExpression(), !3950)
  br label %for.cond.i.i, !dbg !3952

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3953
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !3950)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !3954
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !3955

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !3956
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3957
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !3957
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !3958
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !3959
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !3960
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !3961
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !3950)
  br label %for.cond.i.i, !dbg !3962, !llvm.loop !3963

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3965
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !3939)
  br label %for.cond.i, !dbg !3966, !llvm.loop !3967

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !3969
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !3939)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !3970
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !3939)
  br label %while.cond.i, !dbg !3941, !llvm.loop !3971

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !3973
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3974 {
entry:
    #dbg_value(ptr %state, !3975, !DIExpression(), !3976)
    #dbg_value(ptr %state, !3235, !DIExpression(), !3977)
    #dbg_value(i32 0, !3241, !DIExpression(), !3977)
  br label %for.cond.i, !dbg !3979

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3980
    #dbg_value(i32 %i.0.i, !3241, !DIExpression(), !3977)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3981
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3982

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3983
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3984
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3985
    #dbg_value(i32 %inc.i, !3241, !DIExpression(), !3977)
  br label %for.cond.i, !dbg !3986, !llvm.loop !3987

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3989
  store i32 0, ptr %pos, align 8, !dbg !3990
  ret void, !dbg !3991
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3992 {
entry:
    #dbg_value(ptr %state, !3993, !DIExpression(), !3994)
    #dbg_value(ptr %in, !3995, !DIExpression(), !3994)
    #dbg_value(i32 %inlen, !3996, !DIExpression(), !3994)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3997
  %0 = load i32, ptr %pos, align 8, !dbg !3997
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3998
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3999
  store i32 %call, ptr %pos1, align 8, !dbg !4000
  ret void, !dbg !4001
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !4002 {
entry:
    #dbg_value(ptr %state, !4003, !DIExpression(), !4004)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4005
  %0 = load i32, ptr %pos, align 8, !dbg !4005
    #dbg_value(ptr %state, !3787, !DIExpression(), !4006)
    #dbg_value(i32 %0, !3793, !DIExpression(), !4006)
    #dbg_value(i32 136, !3794, !DIExpression(), !4006)
    #dbg_value(i8 31, !3795, !DIExpression(), !4006)
  %rem.i = shl i32 %0, 3, !dbg !4008
  %mul.i = and i32 %rem.i, 56, !dbg !4008
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4009
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4009
  %div2.i = lshr i32 %0, 3, !dbg !4010
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !4011
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !4012
  %xor.i = xor i64 %1, %shl.i, !dbg !4012
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !4012
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !4013
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !4014
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !4014
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4014
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4015
  store i32 136, ptr %pos1, align 8, !dbg !4016
  ret void, !dbg !4017
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !861 {
entry:
    #dbg_value(ptr %out, !860, !DIExpression(), !4018)
    #dbg_value(i32 %outlen, !864, !DIExpression(), !4018)
    #dbg_value(ptr %state, !865, !DIExpression(), !4018)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4019
  %0 = load i32, ptr %pos, align 8, !dbg !4019
    #dbg_value(ptr %out, !867, !DIExpression(), !4020)
    #dbg_value(i32 %outlen, !873, !DIExpression(), !4020)
    #dbg_value(ptr %state, !874, !DIExpression(), !4020)
    #dbg_value(i32 %0, !875, !DIExpression(), !4020)
    #dbg_value(i32 136, !876, !DIExpression(), !4020)
  br label %while.cond.i, !dbg !4022

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !867, !DIExpression(), !4020)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !4020)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !4020)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4022
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4022

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !4023
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !4023

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4024
    #dbg_value(i32 0, !875, !DIExpression(), !4020)
  br label %if.end.i, !dbg !4025

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !4020)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !4020)
  br label %for.cond.i, !dbg !4026

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !4027
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !4020)
    #dbg_value(i32 %i.0.i, !884, !DIExpression(), !4020)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !4028
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4029
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !4029
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4029
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !4030

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !4031
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4032
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !4032
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4033
  %mul.i = and i32 %rem.i, 56, !dbg !4033
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4034
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !4034
  %conv.i = trunc i64 %shr.i to i8, !dbg !4032
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4020)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4035
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4036
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !4020)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4037
    #dbg_value(i32 %inc.i, !884, !DIExpression(), !4020)
  br label %for.cond.i, !dbg !4038, !llvm.loop !4039

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !4027
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !4041
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4042
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !4020)
    #dbg_value(i32 %i.0.i.lcssa, !875, !DIExpression(), !4020)
  br label %while.cond.i, !dbg !4022, !llvm.loop !4043

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4045
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !4046
  ret void, !dbg !4047
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !832 {
entry:
    #dbg_value(ptr %state, !845, !DIExpression(), !4048)
    #dbg_value(ptr %in, !847, !DIExpression(), !4048)
    #dbg_value(i32 %inlen, !848, !DIExpression(), !4048)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4049
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4050
  store i32 136, ptr %pos, align 8, !dbg !4051
  ret void, !dbg !4052
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !853 {
entry:
    #dbg_value(ptr %out, !852, !DIExpression(), !4053)
    #dbg_value(i32 %nblocks, !856, !DIExpression(), !4053)
    #dbg_value(ptr %state, !857, !DIExpression(), !4053)
    #dbg_value(ptr %out, !603, !DIExpression(), !4054)
    #dbg_value(i32 %nblocks, !610, !DIExpression(), !4054)
    #dbg_value(ptr %state, !611, !DIExpression(), !4054)
    #dbg_value(i32 136, !612, !DIExpression(), !4054)
  br label %while.cond.i, !dbg !4056

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4054)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4054)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4056
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4056

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4057
    #dbg_value(i32 0, !616, !DIExpression(), !4054)
  br label %for.cond.i, !dbg !4058

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4059
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4054)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !4060
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4061

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4062
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4063
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4064
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4064
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4065)
    #dbg_value(i64 %0, !632, !DIExpression(), !4065)
    #dbg_value(i32 0, !633, !DIExpression(), !4065)
  br label %for.cond.i.i, !dbg !4067

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4068
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4065)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4069
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4070

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4071
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4072
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4072
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4073
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4074
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4075
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4076
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4065)
  br label %for.cond.i.i, !dbg !4077, !llvm.loop !4078

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4080
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4054)
  br label %for.cond.i, !dbg !4081, !llvm.loop !4082

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4084
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4054)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4085
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4054)
  br label %while.cond.i, !dbg !4056, !llvm.loop !4086

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4088
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4089 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4090, !DIExpression(), !4091)
    #dbg_value(i32 %outlen, !4092, !DIExpression(), !4091)
    #dbg_value(ptr %in, !4093, !DIExpression(), !4091)
    #dbg_value(i32 %inlen, !4094, !DIExpression(), !4091)
    #dbg_declare(ptr %state, !4095, !DIExpression(), !4096)
    #dbg_value(ptr %state, !562, !DIExpression(), !4097)
    #dbg_value(ptr %in, !574, !DIExpression(), !4097)
    #dbg_value(i32 %inlen, !575, !DIExpression(), !4097)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4099
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4100
  store i32 168, ptr %pos.i, align 8, !dbg !4101
  %div = udiv i32 %outlen, 168, !dbg !4102
    #dbg_value(i32 %div, !4103, !DIExpression(), !4091)
    #dbg_value(ptr %out, !595, !DIExpression(), !4104)
    #dbg_value(i32 %div, !601, !DIExpression(), !4104)
    #dbg_value(ptr %state, !602, !DIExpression(), !4104)
    #dbg_value(ptr %out, !603, !DIExpression(), !4106)
    #dbg_value(i32 %div, !610, !DIExpression(), !4106)
    #dbg_value(ptr %state, !611, !DIExpression(), !4106)
    #dbg_value(i32 168, !612, !DIExpression(), !4106)
  br label %while.cond.i, !dbg !4108

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4106)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4106)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4108
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4108

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4109
    #dbg_value(i32 0, !616, !DIExpression(), !4106)
  br label %for.cond.i, !dbg !4110

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4111
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4106)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !4112
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4113

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4114
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4115
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4116
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4116
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4117)
    #dbg_value(i64 %0, !632, !DIExpression(), !4117)
    #dbg_value(i32 0, !633, !DIExpression(), !4117)
  br label %for.cond.i.i, !dbg !4119

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4120
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4117)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4121
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4122

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4123
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4124
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4124
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4125
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4126
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4127
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4128
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4117)
  br label %for.cond.i.i, !dbg !4129, !llvm.loop !4130

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4132
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4106)
  br label %for.cond.i, !dbg !4133, !llvm.loop !4134

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4136
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4106)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4137
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4106)
  br label %while.cond.i, !dbg !4108, !llvm.loop !4138

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !4140
  %sub = add i32 %mul.neg, %outlen, !dbg !4141
    #dbg_value(i32 %sub, !4092, !DIExpression(), !4091)
  %mul1 = mul nuw i32 %div, 168, !dbg !4142
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4143
    #dbg_value(ptr %add.ptr, !4090, !DIExpression(), !4091)
    #dbg_value(ptr %add.ptr, !3807, !DIExpression(), !4144)
    #dbg_value(i32 %sub, !3809, !DIExpression(), !4144)
    #dbg_value(ptr %state, !3810, !DIExpression(), !4144)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4146
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4146
    #dbg_value(ptr %add.ptr, !867, !DIExpression(), !4147)
    #dbg_value(i32 %sub, !873, !DIExpression(), !4147)
    #dbg_value(ptr %state, !874, !DIExpression(), !4147)
    #dbg_value(i32 %1, !875, !DIExpression(), !4147)
    #dbg_value(i32 168, !876, !DIExpression(), !4147)
  br label %while.cond.i2, !dbg !4149

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !867, !DIExpression(), !4147)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !4147)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !4147)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4149
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4149

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !4150
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4150

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4151
    #dbg_value(i32 0, !875, !DIExpression(), !4147)
  br label %if.end.i, !dbg !4152

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !4147)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !4147)
  br label %for.cond.i7, !dbg !4153

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4154
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !4147)
    #dbg_value(i32 %i.0.i8, !884, !DIExpression(), !4147)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !4155
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4156
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4156
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4156
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4157

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4158
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4159
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4159
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4160
  %mul.i12 = and i32 %rem.i, 56, !dbg !4160
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4161
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4161
  %conv.i = trunc i64 %shr.i to i8, !dbg !4159
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4147)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4162
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4163
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !4147)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4164
    #dbg_value(i32 %inc.i13, !884, !DIExpression(), !4147)
  br label %for.cond.i7, !dbg !4165, !llvm.loop !4166

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4154
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4168
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4169
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !4147)
    #dbg_value(i32 %i.0.i8.lcssa, !875, !DIExpression(), !4147)
  br label %while.cond.i2, !dbg !4149, !llvm.loop !4170

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4172
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4173
  ret void, !dbg !4174
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !834 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !838, !DIExpression(), !4175)
    #dbg_value(i32 %outlen, !840, !DIExpression(), !4175)
    #dbg_value(ptr %in, !841, !DIExpression(), !4175)
    #dbg_value(i32 %inlen, !842, !DIExpression(), !4175)
    #dbg_declare(ptr %state, !843, !DIExpression(), !4176)
    #dbg_value(ptr %state, !845, !DIExpression(), !4177)
    #dbg_value(ptr %in, !847, !DIExpression(), !4177)
    #dbg_value(i32 %inlen, !848, !DIExpression(), !4177)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4179
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4180
  store i32 136, ptr %pos.i, align 8, !dbg !4181
  %div = udiv i32 %outlen, 136, !dbg !4182
    #dbg_value(i32 %div, !851, !DIExpression(), !4175)
    #dbg_value(ptr %out, !852, !DIExpression(), !4183)
    #dbg_value(i32 %div, !856, !DIExpression(), !4183)
    #dbg_value(ptr %state, !857, !DIExpression(), !4183)
    #dbg_value(ptr %out, !603, !DIExpression(), !4185)
    #dbg_value(i32 %div, !610, !DIExpression(), !4185)
    #dbg_value(ptr %state, !611, !DIExpression(), !4185)
    #dbg_value(i32 136, !612, !DIExpression(), !4185)
  br label %while.cond.i, !dbg !4187

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !603, !DIExpression(), !4185)
    #dbg_value(i32 %nblocks.addr.0.i, !610, !DIExpression(), !4185)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4187
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4187

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4188
    #dbg_value(i32 0, !616, !DIExpression(), !4185)
  br label %for.cond.i, !dbg !4189

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4190
    #dbg_value(i32 %i.0.i, !616, !DIExpression(), !4185)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !4191
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4192

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4193
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4194
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4195
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4195
    #dbg_value(ptr %add.ptr.i, !626, !DIExpression(), !4196)
    #dbg_value(i64 %0, !632, !DIExpression(), !4196)
    #dbg_value(i32 0, !633, !DIExpression(), !4196)
  br label %for.cond.i.i, !dbg !4198

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4199
    #dbg_value(i32 %i.0.i.i, !633, !DIExpression(), !4196)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4200
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4201

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4202
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4203
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4203
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4204
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4205
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4206
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4207
    #dbg_value(i32 %inc.i.i, !633, !DIExpression(), !4196)
  br label %for.cond.i.i, !dbg !4208, !llvm.loop !4209

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4211
    #dbg_value(i32 %inc.i, !616, !DIExpression(), !4185)
  br label %for.cond.i, !dbg !4212, !llvm.loop !4213

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4215
    #dbg_value(ptr %add.ptr1.i, !603, !DIExpression(), !4185)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4216
    #dbg_value(i32 %sub.i, !610, !DIExpression(), !4185)
  br label %while.cond.i, !dbg !4187, !llvm.loop !4217

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !4219
  %sub = add i32 %mul.neg, %outlen, !dbg !4220
    #dbg_value(i32 %sub, !840, !DIExpression(), !4175)
  %mul1 = mul nuw i32 %div, 136, !dbg !4221
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4222
    #dbg_value(ptr %add.ptr, !838, !DIExpression(), !4175)
    #dbg_value(ptr %add.ptr, !860, !DIExpression(), !4223)
    #dbg_value(i32 %sub, !864, !DIExpression(), !4223)
    #dbg_value(ptr %state, !865, !DIExpression(), !4223)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4225
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4225
    #dbg_value(ptr %add.ptr, !867, !DIExpression(), !4226)
    #dbg_value(i32 %sub, !873, !DIExpression(), !4226)
    #dbg_value(ptr %state, !874, !DIExpression(), !4226)
    #dbg_value(i32 %1, !875, !DIExpression(), !4226)
    #dbg_value(i32 136, !876, !DIExpression(), !4226)
  br label %while.cond.i2, !dbg !4228

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !867, !DIExpression(), !4226)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !4226)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !4226)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4228
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4228

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4229
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4229

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4230
    #dbg_value(i32 0, !875, !DIExpression(), !4226)
  br label %if.end.i, !dbg !4231

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !4226)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !4226)
  br label %for.cond.i7, !dbg !4232

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4233
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !4226)
    #dbg_value(i32 %i.0.i8, !884, !DIExpression(), !4226)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !4234
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4235
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4235
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4235
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4236

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4237
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4238
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4238
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4239
  %mul.i12 = and i32 %rem.i, 56, !dbg !4239
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4240
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4240
  %conv.i = trunc i64 %shr.i to i8, !dbg !4238
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4226)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4241
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4242
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !4226)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4243
    #dbg_value(i32 %inc.i13, !884, !DIExpression(), !4226)
  br label %for.cond.i7, !dbg !4244, !llvm.loop !4245

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4233
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4247
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4248
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !4226)
    #dbg_value(i32 %i.0.i8.lcssa, !875, !DIExpression(), !4226)
  br label %while.cond.i2, !dbg !4228, !llvm.loop !4249

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4251
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4252
  ret void, !dbg !4253
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4254 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4257, !DIExpression(), !4258)
    #dbg_value(ptr %in, !4259, !DIExpression(), !4258)
    #dbg_value(i32 %inlen, !4260, !DIExpression(), !4258)
    #dbg_declare(ptr %s, !4261, !DIExpression(), !4262)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4263
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4264
    #dbg_value(i32 0, !4265, !DIExpression(), !4258)
  br label %for.cond, !dbg !4266

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4268
    #dbg_value(i32 %i.0, !4265, !DIExpression(), !4258)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4269
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4271

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4272
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4273
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4274
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4274
    #dbg_value(ptr %add.ptr, !626, !DIExpression(), !4275)
    #dbg_value(i64 %0, !632, !DIExpression(), !4275)
    #dbg_value(i32 0, !633, !DIExpression(), !4275)
  br label %for.cond.i, !dbg !4277

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4278
    #dbg_value(i32 %i.0.i, !633, !DIExpression(), !4275)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4279
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4280

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4281
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4282
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4282
  %conv.i = trunc i64 %shr.i to i8, !dbg !4283
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4284
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4285
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4286
    #dbg_value(i32 %inc.i, !633, !DIExpression(), !4275)
  br label %for.cond.i, !dbg !4287, !llvm.loop !4288

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4290
    #dbg_value(i32 %inc, !4265, !DIExpression(), !4258)
  br label %for.cond, !dbg !4291, !llvm.loop !4292

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4294
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4295 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4296, !DIExpression(), !4297)
    #dbg_value(ptr %in, !4298, !DIExpression(), !4297)
    #dbg_value(i32 %inlen, !4299, !DIExpression(), !4297)
    #dbg_declare(ptr %s, !4300, !DIExpression(), !4301)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4302
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4303
    #dbg_value(i32 0, !4304, !DIExpression(), !4297)
  br label %for.cond, !dbg !4305

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4307
    #dbg_value(i32 %i.0, !4304, !DIExpression(), !4297)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4308
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4310

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4311
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4312
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4313
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4313
    #dbg_value(ptr %add.ptr, !626, !DIExpression(), !4314)
    #dbg_value(i64 %0, !632, !DIExpression(), !4314)
    #dbg_value(i32 0, !633, !DIExpression(), !4314)
  br label %for.cond.i, !dbg !4316

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4317
    #dbg_value(i32 %i.0.i, !633, !DIExpression(), !4314)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4318
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4319

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4320
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4321
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4321
  %conv.i = trunc i64 %shr.i to i8, !dbg !4322
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4323
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4324
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4325
    #dbg_value(i32 %inc.i, !633, !DIExpression(), !4314)
  br label %for.cond.i, !dbg !4326, !llvm.loop !4327

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4329
    #dbg_value(i32 %inc, !4304, !DIExpression(), !4297)
  br label %for.cond, !dbg !4330, !llvm.loop !4331

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4333
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !537 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !548, !DIExpression(), !4334)
    #dbg_value(ptr %seed, !550, !DIExpression(), !4334)
    #dbg_value(i8 %x, !551, !DIExpression(), !4334)
    #dbg_value(i8 %y, !552, !DIExpression(), !4334)
    #dbg_declare(ptr %extseed, !553, !DIExpression(), !4335)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4336
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4337
  store i8 %x, ptr %arrayidx, align 1, !dbg !4338
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4339
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4340
    #dbg_value(ptr %state, !562, !DIExpression(), !4341)
    #dbg_value(ptr %extseed, !574, !DIExpression(), !4341)
    #dbg_value(i32 34, !575, !DIExpression(), !4341)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4343
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4344
  store i32 168, ptr %pos.i, align 8, !dbg !4345
  ret void, !dbg !4346
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !815 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !819, !DIExpression(), !4347)
    #dbg_value(i32 %outlen, !821, !DIExpression(), !4347)
    #dbg_value(ptr %key, !822, !DIExpression(), !4347)
    #dbg_value(i8 %nonce, !823, !DIExpression(), !4347)
    #dbg_declare(ptr %extkey, !824, !DIExpression(), !4348)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4349
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4350
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4351
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4352
  ret void, !dbg !4353
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4354 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4355, !DIExpression(), !4356)
    #dbg_value(ptr %key, !4357, !DIExpression(), !4356)
    #dbg_value(ptr %input, !4358, !DIExpression(), !4356)
    #dbg_declare(ptr %s, !4359, !DIExpression(), !4360)
    #dbg_value(ptr %s, !3975, !DIExpression(), !4361)
    #dbg_value(ptr %s, !3235, !DIExpression(), !4363)
    #dbg_value(i32 0, !3241, !DIExpression(), !4363)
  br label %for.cond.i, !dbg !4365

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4366
    #dbg_value(i32 %i.0.i, !3241, !DIExpression(), !4363)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4367
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4368

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4369
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4370
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4371
    #dbg_value(i32 %inc.i, !3241, !DIExpression(), !4363)
  br label %for.cond.i, !dbg !4372, !llvm.loop !4373

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4375
  store i32 0, ptr %pos.i, align 8, !dbg !4376
    #dbg_value(ptr %s, !3993, !DIExpression(), !4377)
    #dbg_value(ptr %key, !3995, !DIExpression(), !4377)
    #dbg_value(i32 32, !3996, !DIExpression(), !4377)
  %call.i8 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4379
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4380
  store i32 %call.i8, ptr %pos1.i9, align 8, !dbg !4381
    #dbg_value(ptr %s, !3993, !DIExpression(), !4382)
    #dbg_value(ptr %input, !3995, !DIExpression(), !4382)
    #dbg_value(i32 1088, !3996, !DIExpression(), !4382)
  %call.i5 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i8, i32 noundef 136, ptr noundef %input, i32 noundef 1088) #4, !dbg !4384
  %pos1.i6 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4385
  store i32 %call.i5, ptr %pos1.i6, align 8, !dbg !4386
    #dbg_value(ptr %s, !4003, !DIExpression(), !4387)
    #dbg_value(ptr %s, !3787, !DIExpression(), !4389)
    #dbg_value(i32 %call.i5, !3793, !DIExpression(), !4389)
    #dbg_value(i32 136, !3794, !DIExpression(), !4389)
    #dbg_value(i8 31, !3795, !DIExpression(), !4389)
  %rem.i = shl i32 %call.i5, 3, !dbg !4391
  %mul.i = and i32 %rem.i, 56, !dbg !4391
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4392
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4392
  %div2.i = lshr i32 %call.i5, 3, !dbg !4393
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4394
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4395
  %xor.i = xor i64 %0, %shl.i, !dbg !4395
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4395
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4396
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4397
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4397
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4397
  %pos1.i3 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4398
  store i32 136, ptr %pos1.i3, align 8, !dbg !4399
    #dbg_value(ptr %out, !860, !DIExpression(), !4400)
    #dbg_value(i32 32, !864, !DIExpression(), !4400)
    #dbg_value(ptr %s, !865, !DIExpression(), !4400)
    #dbg_value(ptr %out, !867, !DIExpression(), !4402)
    #dbg_value(i32 32, !873, !DIExpression(), !4402)
    #dbg_value(ptr %s, !874, !DIExpression(), !4402)
    #dbg_value(i32 136, !875, !DIExpression(), !4402)
    #dbg_value(i32 136, !876, !DIExpression(), !4402)
  br label %while.cond.i, !dbg !4404

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !867, !DIExpression(), !4402)
    #dbg_value(i32 %outlen.addr.0.i, !873, !DIExpression(), !4402)
    #dbg_value(i32 %pos.addr.0.i, !875, !DIExpression(), !4402)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4404
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4404

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4405
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4405

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4406
    #dbg_value(i32 0, !875, !DIExpression(), !4402)
  br label %if.end.i, !dbg !4407

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !875, !DIExpression(), !4402)
    #dbg_value(i32 %pos.addr.1.i, !884, !DIExpression(), !4402)
  br label %for.cond.i12, !dbg !4408

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4409
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(), !4402)
    #dbg_value(i32 %i.0.i13, !884, !DIExpression(), !4402)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4410
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4411
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4411
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4411
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4412

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4413
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4414
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4414
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4415
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4415
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4416
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4416
  %conv.i = trunc i64 %shr.i to i8, !dbg !4414
    #dbg_value(ptr %out.addr.1.i, !867, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4402)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4417
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4418
    #dbg_value(ptr %incdec.ptr.i, !867, !DIExpression(), !4402)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4419
    #dbg_value(i32 %inc.i19, !884, !DIExpression(), !4402)
  br label %for.cond.i12, !dbg !4420, !llvm.loop !4421

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4409
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4423
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4424
    #dbg_value(i32 %sub3.i, !873, !DIExpression(), !4402)
    #dbg_value(i32 %i.0.i13.lcssa, !875, !DIExpression(), !4402)
  br label %while.cond.i, !dbg !4404, !llvm.loop !4425

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4427
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4428
  ret void, !dbg !4429
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
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber768_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
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
!118 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !119, file: !119, line: 50, type: !120, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!119 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!120 = !DISubroutineType(types: !121)
!121 = !{!50, !32, !32}
!122 = distinct !DILocation(line: 18, column: 3, scope: !123, inlinedAt: !124)
!123 = distinct !DISubprogram(name: "test_keys", scope: !2, file: !2, line: 9, type: !107, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!124 = distinct !DILocation(line: 103, column: 10, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !2, line: 102, column: 25)
!126 = !DILocalVariable(name: "pk", scope: !123, file: !2, line: 11, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 9472, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 1184)
!130 = !DILocation(line: 11, column: 11, scope: !123, inlinedAt: !124)
!131 = !DILocalVariable(name: "sk", scope: !123, file: !2, line: 12, type: !132)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 19200, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 2400)
!135 = !DILocation(line: 12, column: 11, scope: !123, inlinedAt: !124)
!136 = !DILocalVariable(name: "ct", scope: !123, file: !2, line: 13, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 8704, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 1088)
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
!157 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair_derand", scope: !119, file: !119, line: 25, type: !158, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!175 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !119, file: !119, line: 113, type: !158, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!370 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !119, file: !119, line: 76, type: !371, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!394 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !119, file: !119, line: 140, type: !395, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!417 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !418, file: !418, line: 16, type: !419, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
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
!446 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !418, file: !418, line: 40, type: !447, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
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
!475 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !476, file: !476, line: 165, type: !477, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!476 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!477 = !DISubroutineType(types: !478)
!478 = !{null, !479, !160, !50}
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 32)
!480 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !481, line: 10, baseType: !482)
!481 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!482 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !481, line: 8, size: 12288, elements: !483)
!483 = !{!484}
!484 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !482, file: !481, line: 9, baseType: !485, size: 12288)
!485 = !DICompositeType(tag: DW_TAG_array_type, baseType: !486, size: 12288, elements: !494)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !488)
!487 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!488 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !489)
!489 = !{!490}
!490 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !488, file: !487, line: 12, baseType: !491, size: 4096)
!491 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !492)
!492 = !{!493}
!493 = !DISubrange(count: 256)
!494 = !{!495}
!495 = !DISubrange(count: 3)
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
!537 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !538, file: !538, line: 18, type: !539, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
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
!760 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !476, file: !476, line: 205, type: !761, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
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
!774 = !DICompositeType(tag: DW_TAG_array_type, baseType: !480, size: 36864, elements: !494)
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
!797 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !798, file: !798, line: 225, type: !799, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
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
!812 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!813 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !806)
!814 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !818)
!815 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !538, file: !538, line: 43, type: !816, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!816 = !DISubroutineType(types: !817)
!817 = !{null, !32, !38, !160, !33}
!818 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !806)
!819 = !DILocalVariable(name: "out", arg: 1, scope: !815, file: !538, line: 43, type: !32)
!820 = !DILocation(line: 0, scope: !815, inlinedAt: !818)
!821 = !DILocalVariable(name: "outlen", arg: 2, scope: !815, file: !538, line: 43, type: !38)
!822 = !DILocalVariable(name: "key", arg: 3, scope: !815, file: !538, line: 43, type: !160)
!823 = !DILocalVariable(name: "nonce", arg: 4, scope: !815, file: !538, line: 43, type: !33)
!824 = !DILocalVariable(name: "extkey", scope: !815, file: !538, line: 45, type: !825)
!825 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !826)
!826 = !{!827}
!827 = !DISubrange(count: 33)
!828 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !818)
!829 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !818)
!830 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !818)
!831 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !833)
!832 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !564, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!833 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !837)
!834 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !835, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!835 = !DISubroutineType(types: !836)
!836 = !{null, !32, !38, !160, !38}
!837 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !818)
!838 = !DILocalVariable(name: "out", arg: 1, scope: !834, file: !74, line: 723, type: !32)
!839 = !DILocation(line: 0, scope: !834, inlinedAt: !837)
!840 = !DILocalVariable(name: "outlen", arg: 2, scope: !834, file: !74, line: 723, type: !38)
!841 = !DILocalVariable(name: "in", arg: 3, scope: !834, file: !74, line: 723, type: !160)
!842 = !DILocalVariable(name: "inlen", arg: 4, scope: !834, file: !74, line: 723, type: !38)
!843 = !DILocalVariable(name: "state", scope: !834, file: !74, line: 726, type: !567)
!844 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !837)
!845 = !DILocalVariable(name: "state", arg: 1, scope: !832, file: !74, line: 667, type: !566)
!846 = !DILocation(line: 0, scope: !832, inlinedAt: !833)
!847 = !DILocalVariable(name: "in", arg: 2, scope: !832, file: !74, line: 667, type: !160)
!848 = !DILocalVariable(name: "inlen", arg: 3, scope: !832, file: !74, line: 667, type: !38)
!849 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !833)
!850 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !833)
!851 = !DILocalVariable(name: "nblocks", scope: !834, file: !74, line: 725, type: !38)
!852 = !DILocalVariable(name: "out", arg: 1, scope: !853, file: !74, line: 685, type: !32)
!853 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !597, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!854 = !DILocation(line: 0, scope: !853, inlinedAt: !855)
!855 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !837)
!856 = !DILocalVariable(name: "nblocks", arg: 2, scope: !853, file: !74, line: 685, type: !38)
!857 = !DILocalVariable(name: "state", arg: 3, scope: !853, file: !74, line: 685, type: !566)
!858 = !DILocation(line: 0, scope: !604, inlinedAt: !859)
!859 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !855)
!860 = !DILocalVariable(name: "out", arg: 1, scope: !861, file: !74, line: 653, type: !32)
!861 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !597, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!862 = !DILocation(line: 0, scope: !861, inlinedAt: !863)
!863 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !837)
!864 = !DILocalVariable(name: "outlen", arg: 2, scope: !861, file: !74, line: 653, type: !38)
!865 = !DILocalVariable(name: "state", arg: 3, scope: !861, file: !74, line: 653, type: !566)
!866 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !863)
!867 = !DILocalVariable(name: "out", arg: 1, scope: !868, file: !74, line: 426, type: !32)
!868 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !869, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!869 = !DISubroutineType(types: !870)
!870 = !{!40, !32, !38, !607, !40, !40}
!871 = !DILocation(line: 0, scope: !868, inlinedAt: !872)
!872 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !863)
!873 = !DILocalVariable(name: "outlen", arg: 2, scope: !868, file: !74, line: 427, type: !38)
!874 = !DILocalVariable(name: "s", arg: 3, scope: !868, file: !74, line: 428, type: !607)
!875 = !DILocalVariable(name: "pos", arg: 4, scope: !868, file: !74, line: 429, type: !40)
!876 = !DILocalVariable(name: "r", arg: 5, scope: !868, file: !74, line: 430, type: !40)
!877 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !872)
!878 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !872)
!879 = distinct !DILexicalBlock(scope: !880, file: !74, line: 435, column: 8)
!880 = distinct !DILexicalBlock(scope: !868, file: !74, line: 434, column: 17)
!881 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !872)
!882 = distinct !DILexicalBlock(scope: !879, file: !74, line: 435, column: 18)
!883 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !872)
!884 = !DILocalVariable(name: "i", scope: !868, file: !74, line: 432, type: !40)
!885 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !872)
!886 = distinct !DILexicalBlock(scope: !880, file: !74, line: 439, column: 5)
!887 = !DILocation(line: 439, scope: !886, inlinedAt: !872)
!888 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !872)
!889 = distinct !DILexicalBlock(scope: !886, file: !74, line: 439, column: 5)
!890 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !872)
!891 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !872)
!892 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !872)
!893 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !872)
!894 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !872)
!895 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !872)
!896 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !872)
!897 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !872)
!898 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !872)
!899 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !872)
!900 = distinct !{!900, !891, !901, !258}
!901 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !872)
!902 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !872)
!903 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !872)
!904 = distinct !{!904, !877, !905, !258}
!905 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !872)
!906 = !DILocation(line: 223, column: 25, scope: !792)
!907 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !863)
!908 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !863)
!909 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !837)
!910 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !818)
!911 = !DILocalVariable(name: "r", arg: 1, scope: !912, file: !913, line: 110, type: !916)
!912 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !913, file: !913, line: 110, type: !914, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!913 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!914 = !DISubroutineType(types: !915)
!915 = !{null, !916, !160}
!916 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !917, size: 32)
!917 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !918)
!918 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !919)
!919 = !{!920}
!920 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !918, file: !487, line: 12, baseType: !491, size: 4096)
!921 = !DILocation(line: 0, scope: !912, inlinedAt: !922)
!922 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !806)
!923 = !DILocalVariable(name: "buf", arg: 2, scope: !912, file: !913, line: 110, type: !160)
!924 = !DILocation(line: 113, column: 3, scope: !912, inlinedAt: !922)
!925 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !806)
!926 = !DILocation(line: 223, column: 54, scope: !792)
!927 = !DILocation(line: 222, column: 22, scope: !792)
!928 = !DILocation(line: 222, column: 3, scope: !792)
!929 = distinct !{!929, !793, !930, !258}
!930 = !DILocation(line: 223, column: 56, scope: !789)
!931 = !DILocation(line: 224, scope: !795)
!932 = !DILocation(line: 224, column: 12, scope: !933)
!933 = distinct !DILexicalBlock(scope: !795, file: !476, line: 224, column: 3)
!934 = !DILocation(line: 173, column: 3, scope: !935, inlinedAt: !950)
!935 = distinct !DILexicalBlock(scope: !937, file: !936, line: 173, column: 3)
!936 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!937 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !936, file: !936, line: 170, type: !938, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!938 = !DISubroutineType(types: !939)
!939 = !{null, !940}
!940 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !941, size: 32)
!941 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !481, line: 10, baseType: !942)
!942 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !481, line: 8, size: 12288, elements: !943)
!943 = !{!944}
!944 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !942, file: !481, line: 9, baseType: !945, size: 12288)
!945 = !DICompositeType(tag: DW_TAG_array_type, baseType: !946, size: 12288, elements: !494)
!946 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !487, line: 13, baseType: !947)
!947 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !487, line: 11, size: 4096, elements: !948)
!948 = !{!949}
!949 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !947, file: !487, line: 12, baseType: !491, size: 4096)
!950 = distinct !DILocation(line: 227, column: 3, scope: !760)
!951 = !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !952)
!952 = distinct !DILocation(line: 225, column: 5, scope: !933)
!953 = !DILocation(line: 0, scope: !797, inlinedAt: !952)
!954 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !952)
!955 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !956)
!956 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !952)
!957 = !DILocation(line: 0, scope: !815, inlinedAt: !956)
!958 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !956)
!959 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !956)
!960 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !956)
!961 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !962)
!962 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !963)
!963 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !956)
!964 = !DILocation(line: 0, scope: !834, inlinedAt: !963)
!965 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !963)
!966 = !DILocation(line: 0, scope: !832, inlinedAt: !962)
!967 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !962)
!968 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !962)
!969 = !DILocation(line: 0, scope: !853, inlinedAt: !970)
!970 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !963)
!971 = !DILocation(line: 0, scope: !604, inlinedAt: !972)
!972 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !970)
!973 = !DILocation(line: 0, scope: !861, inlinedAt: !974)
!974 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !963)
!975 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !974)
!976 = !DILocation(line: 0, scope: !868, inlinedAt: !977)
!977 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !974)
!978 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !977)
!979 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !977)
!980 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !977)
!981 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !977)
!982 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !977)
!983 = !DILocation(line: 439, scope: !886, inlinedAt: !977)
!984 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !977)
!985 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !977)
!986 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !977)
!987 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !977)
!988 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !977)
!989 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !977)
!990 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !977)
!991 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !977)
!992 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !977)
!993 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !977)
!994 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !977)
!995 = distinct !{!995, !986, !996, !258}
!996 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !977)
!997 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !977)
!998 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !977)
!999 = distinct !{!999, !978, !1000, !258}
!1000 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !977)
!1001 = !DILocation(line: 225, column: 25, scope: !933)
!1002 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !974)
!1003 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !974)
!1004 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !963)
!1005 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !956)
!1006 = !DILocation(line: 0, scope: !912, inlinedAt: !1007)
!1007 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !952)
!1008 = !DILocation(line: 113, column: 3, scope: !912, inlinedAt: !1007)
!1009 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !952)
!1010 = !DILocation(line: 225, column: 51, scope: !933)
!1011 = !DILocation(line: 224, column: 22, scope: !933)
!1012 = !DILocation(line: 224, column: 3, scope: !933)
!1013 = distinct !{!1013, !794, !1014, !258}
!1014 = !DILocation(line: 225, column: 53, scope: !795)
!1015 = !DILocation(line: 173, scope: !935, inlinedAt: !950)
!1016 = !DILocalVariable(name: "i", scope: !937, file: !936, line: 172, type: !40)
!1017 = !DILocation(line: 0, scope: !937, inlinedAt: !950)
!1018 = !DILocation(line: 173, column: 12, scope: !1019, inlinedAt: !950)
!1019 = distinct !DILexicalBlock(scope: !935, file: !936, line: 173, column: 3)
!1020 = !DILocation(line: 173, column: 3, scope: !935, inlinedAt: !1021)
!1021 = distinct !DILocation(line: 228, column: 3, scope: !760)
!1022 = !DILocation(line: 174, column: 15, scope: !1019, inlinedAt: !950)
!1023 = !DILocalVariable(name: "r", arg: 1, scope: !1024, file: !798, line: 261, type: !801)
!1024 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !798, file: !798, line: 261, type: !1025, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{null, !801}
!1027 = !DILocation(line: 0, scope: !1024, inlinedAt: !1028)
!1028 = distinct !DILocation(line: 174, column: 5, scope: !1019, inlinedAt: !950)
!1029 = !DILocation(line: 263, column: 3, scope: !1024, inlinedAt: !1028)
!1030 = !DILocalVariable(name: "r", arg: 1, scope: !1031, file: !798, line: 323, type: !801)
!1031 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !798, file: !798, line: 323, type: !1025, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1032 = !DILocation(line: 0, scope: !1031, inlinedAt: !1033)
!1033 = distinct !DILocation(line: 264, column: 3, scope: !1024, inlinedAt: !1028)
!1034 = !DILocalVariable(name: "i", scope: !1031, file: !798, line: 325, type: !40)
!1035 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1033)
!1036 = distinct !DILexicalBlock(scope: !1031, file: !798, line: 326, column: 3)
!1037 = !DILocation(line: 326, scope: !1036, inlinedAt: !1033)
!1038 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1033)
!1039 = distinct !DILexicalBlock(scope: !1036, file: !798, line: 326, column: 3)
!1040 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1033)
!1041 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1033)
!1042 = !DILocalVariable(name: "a", arg: 1, scope: !1043, file: !1044, line: 35, type: !61)
!1043 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1044, file: !1044, line: 35, type: !1045, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1044 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!61, !61}
!1047 = !DILocation(line: 0, scope: !1043, inlinedAt: !1048)
!1048 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1033)
!1049 = !DILocalVariable(name: "v", scope: !1043, file: !1044, line: 37, type: !60)
!1050 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1048)
!1051 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1048)
!1052 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1048)
!1053 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1048)
!1054 = !DILocalVariable(name: "t", scope: !1043, file: !1044, line: 36, type: !61)
!1055 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1048)
!1056 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1033)
!1057 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1033)
!1058 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1033)
!1059 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1033)
!1060 = distinct !{!1060, !1040, !1061, !258}
!1061 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1033)
!1062 = !DILocation(line: 173, column: 22, scope: !1019, inlinedAt: !950)
!1063 = !DILocation(line: 173, column: 3, scope: !1019, inlinedAt: !950)
!1064 = distinct !{!1064, !934, !1065, !258}
!1065 = !DILocation(line: 174, column: 24, scope: !935, inlinedAt: !950)
!1066 = !DILocation(line: 173, scope: !935, inlinedAt: !1021)
!1067 = !DILocation(line: 0, scope: !937, inlinedAt: !1021)
!1068 = !DILocation(line: 173, column: 12, scope: !1019, inlinedAt: !1021)
!1069 = !DILocation(line: 231, column: 3, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !760, file: !476, line: 231, column: 3)
!1071 = !DILocation(line: 174, column: 15, scope: !1019, inlinedAt: !1021)
!1072 = !DILocation(line: 0, scope: !1024, inlinedAt: !1073)
!1073 = distinct !DILocation(line: 174, column: 5, scope: !1019, inlinedAt: !1021)
!1074 = !DILocation(line: 263, column: 3, scope: !1024, inlinedAt: !1073)
!1075 = !DILocation(line: 0, scope: !1031, inlinedAt: !1076)
!1076 = distinct !DILocation(line: 264, column: 3, scope: !1024, inlinedAt: !1073)
!1077 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1076)
!1078 = !DILocation(line: 326, scope: !1036, inlinedAt: !1076)
!1079 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1076)
!1080 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1076)
!1081 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1076)
!1082 = !DILocation(line: 0, scope: !1043, inlinedAt: !1083)
!1083 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1076)
!1084 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1083)
!1085 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1083)
!1086 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1083)
!1087 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1083)
!1088 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1083)
!1089 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1076)
!1090 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1076)
!1091 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1076)
!1092 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1076)
!1093 = distinct !{!1093, !1080, !1094, !258}
!1094 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1076)
!1095 = !DILocation(line: 173, column: 22, scope: !1019, inlinedAt: !1021)
!1096 = !DILocation(line: 173, column: 3, scope: !1019, inlinedAt: !1021)
!1097 = distinct !{!1097, !1020, !1098, !258}
!1098 = !DILocation(line: 174, column: 24, scope: !935, inlinedAt: !1021)
!1099 = !DILocation(line: 231, scope: !1070)
!1100 = !DILocation(line: 231, column: 12, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1070, file: !476, line: 231, column: 3)
!1102 = !DILocation(line: 244, column: 3, scope: !1103, inlinedAt: !1109)
!1103 = distinct !DILexicalBlock(scope: !1104, file: !936, line: 244, column: 3)
!1104 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !936, file: !936, line: 241, type: !1105, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{null, !940, !1107, !1107}
!1107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1108, size: 32)
!1108 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !941)
!1109 = distinct !DILocation(line: 236, column: 3, scope: !760)
!1110 = !DILocation(line: 232, column: 37, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1101, file: !476, line: 231, column: 26)
!1112 = !DILocation(line: 232, column: 51, scope: !1111)
!1113 = !DILocation(line: 232, column: 5, scope: !1111)
!1114 = !DILocation(line: 233, column: 18, scope: !1111)
!1115 = !DILocalVariable(name: "r", arg: 1, scope: !1116, file: !798, line: 307, type: !801)
!1116 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !798, file: !798, line: 307, type: !1025, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1117 = !DILocation(line: 0, scope: !1116, inlinedAt: !1118)
!1118 = distinct !DILocation(line: 233, column: 5, scope: !1111)
!1119 = !DILocalVariable(name: "f", scope: !1116, file: !798, line: 310, type: !60)
!1120 = !DILocalVariable(name: "i", scope: !1116, file: !798, line: 309, type: !40)
!1121 = !DILocation(line: 311, column: 7, scope: !1122, inlinedAt: !1118)
!1122 = distinct !DILexicalBlock(scope: !1116, file: !798, line: 311, column: 3)
!1123 = !DILocation(line: 311, scope: !1122, inlinedAt: !1118)
!1124 = !DILocation(line: 311, column: 12, scope: !1125, inlinedAt: !1118)
!1125 = distinct !DILexicalBlock(scope: !1122, file: !798, line: 311, column: 3)
!1126 = !DILocation(line: 311, column: 3, scope: !1122, inlinedAt: !1118)
!1127 = !DILocation(line: 312, column: 47, scope: !1125, inlinedAt: !1118)
!1128 = !DILocation(line: 312, column: 38, scope: !1125, inlinedAt: !1118)
!1129 = !DILocation(line: 312, column: 59, scope: !1125, inlinedAt: !1118)
!1130 = !DILocalVariable(name: "a", arg: 1, scope: !1131, file: !1044, line: 16, type: !55)
!1131 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1044, file: !1044, line: 16, type: !1132, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1132 = !DISubroutineType(types: !98)
!1133 = !DILocation(line: 0, scope: !1131, inlinedAt: !1134)
!1134 = distinct !DILocation(line: 312, column: 20, scope: !1125, inlinedAt: !1118)
!1135 = !DILocalVariable(name: "t", scope: !1131, file: !1044, line: 18, type: !61)
!1136 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !1134)
!1137 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !1134)
!1138 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !1134)
!1139 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !1134)
!1140 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !1134)
!1141 = !DILocation(line: 312, column: 5, scope: !1125, inlinedAt: !1118)
!1142 = !DILocation(line: 312, column: 18, scope: !1125, inlinedAt: !1118)
!1143 = !DILocation(line: 311, column: 22, scope: !1125, inlinedAt: !1118)
!1144 = !DILocation(line: 311, column: 3, scope: !1125, inlinedAt: !1118)
!1145 = distinct !{!1145, !1126, !1146, !258}
!1146 = !DILocation(line: 312, column: 61, scope: !1122, inlinedAt: !1118)
!1147 = !DILocation(line: 231, column: 22, scope: !1101)
!1148 = !DILocation(line: 231, column: 3, scope: !1101)
!1149 = distinct !{!1149, !1069, !1150, !258}
!1150 = !DILocation(line: 234, column: 3, scope: !1070)
!1151 = !DILocation(line: 244, scope: !1103, inlinedAt: !1109)
!1152 = !DILocalVariable(name: "i", scope: !1104, file: !936, line: 243, type: !40)
!1153 = !DILocation(line: 0, scope: !1104, inlinedAt: !1109)
!1154 = !DILocation(line: 244, column: 12, scope: !1155, inlinedAt: !1109)
!1155 = distinct !DILexicalBlock(scope: !1103, file: !936, line: 244, column: 3)
!1156 = !DILocation(line: 228, column: 3, scope: !1157, inlinedAt: !1159)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !936, line: 228, column: 3)
!1158 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !936, file: !936, line: 225, type: !938, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1159 = distinct !DILocation(line: 237, column: 3, scope: !760)
!1160 = !DILocation(line: 245, column: 15, scope: !1155, inlinedAt: !1109)
!1161 = !DILocation(line: 245, column: 27, scope: !1155, inlinedAt: !1109)
!1162 = !DILocation(line: 245, column: 39, scope: !1155, inlinedAt: !1109)
!1163 = !DILocalVariable(name: "r", arg: 1, scope: !1164, file: !798, line: 339, type: !801)
!1164 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !798, file: !798, line: 339, type: !1165, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{null, !801, !1167, !1167}
!1167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1168, size: 32)
!1168 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !802)
!1169 = !DILocation(line: 0, scope: !1164, inlinedAt: !1170)
!1170 = distinct !DILocation(line: 245, column: 5, scope: !1155, inlinedAt: !1109)
!1171 = !DILocalVariable(name: "a", arg: 2, scope: !1164, file: !798, line: 339, type: !1167)
!1172 = !DILocalVariable(name: "b", arg: 3, scope: !1164, file: !798, line: 339, type: !1167)
!1173 = !DILocalVariable(name: "i", scope: !1164, file: !798, line: 341, type: !40)
!1174 = !DILocation(line: 342, column: 7, scope: !1175, inlinedAt: !1170)
!1175 = distinct !DILexicalBlock(scope: !1164, file: !798, line: 342, column: 3)
!1176 = !DILocation(line: 342, scope: !1175, inlinedAt: !1170)
!1177 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !1170)
!1178 = distinct !DILexicalBlock(scope: !1175, file: !798, line: 342, column: 3)
!1179 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1170)
!1180 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !1170)
!1181 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !1170)
!1182 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !1170)
!1183 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !1170)
!1184 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !1170)
!1185 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !1170)
!1186 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !1170)
!1187 = distinct !{!1187, !1179, !1188, !258}
!1188 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !1170)
!1189 = !DILocation(line: 244, column: 22, scope: !1155, inlinedAt: !1109)
!1190 = !DILocation(line: 244, column: 3, scope: !1155, inlinedAt: !1109)
!1191 = distinct !{!1191, !1102, !1192, !258}
!1192 = !DILocation(line: 245, column: 48, scope: !1103, inlinedAt: !1109)
!1193 = !DILocation(line: 228, scope: !1157, inlinedAt: !1159)
!1194 = !DILocalVariable(name: "i", scope: !1158, file: !936, line: 227, type: !40)
!1195 = !DILocation(line: 0, scope: !1158, inlinedAt: !1159)
!1196 = !DILocation(line: 228, column: 12, scope: !1197, inlinedAt: !1159)
!1197 = distinct !DILexicalBlock(scope: !1157, file: !936, line: 228, column: 3)
!1198 = !DILocation(line: 142, column: 3, scope: !1199, inlinedAt: !1203)
!1199 = distinct !DILexicalBlock(scope: !1200, file: !936, line: 142, column: 3)
!1200 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !936, file: !936, line: 139, type: !1201, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{null, !32, !1107}
!1203 = distinct !DILocation(line: 59, column: 3, scope: !1204, inlinedAt: !1207)
!1204 = distinct !DISubprogram(name: "pack_sk", scope: !476, file: !476, line: 57, type: !1205, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1205 = !DISubroutineType(types: !1206)
!1206 = !{null, !32, !479}
!1207 = distinct !DILocation(line: 239, column: 3, scope: !760)
!1208 = !DILocation(line: 229, column: 18, scope: !1197, inlinedAt: !1159)
!1209 = !DILocation(line: 0, scope: !1031, inlinedAt: !1210)
!1210 = distinct !DILocation(line: 229, column: 5, scope: !1197, inlinedAt: !1159)
!1211 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1210)
!1212 = !DILocation(line: 326, scope: !1036, inlinedAt: !1210)
!1213 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1210)
!1214 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1210)
!1215 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1210)
!1216 = !DILocation(line: 0, scope: !1043, inlinedAt: !1217)
!1217 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1210)
!1218 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1217)
!1219 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1217)
!1220 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1217)
!1221 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1217)
!1222 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1217)
!1223 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1210)
!1224 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1210)
!1225 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1210)
!1226 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1210)
!1227 = distinct !{!1227, !1214, !1228, !258}
!1228 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1210)
!1229 = !DILocation(line: 228, column: 22, scope: !1197, inlinedAt: !1159)
!1230 = !DILocation(line: 228, column: 3, scope: !1197, inlinedAt: !1159)
!1231 = distinct !{!1231, !1156, !1232, !258}
!1232 = !DILocation(line: 229, column: 27, scope: !1157, inlinedAt: !1159)
!1233 = !DILocation(line: 142, scope: !1199, inlinedAt: !1203)
!1234 = !DILocalVariable(name: "i", scope: !1200, file: !936, line: 141, type: !40)
!1235 = !DILocation(line: 0, scope: !1200, inlinedAt: !1203)
!1236 = !DILocation(line: 142, column: 12, scope: !1237, inlinedAt: !1203)
!1237 = distinct !DILexicalBlock(scope: !1199, file: !936, line: 142, column: 3)
!1238 = !DILocation(line: 142, column: 3, scope: !1199, inlinedAt: !1239)
!1239 = distinct !DILocation(line: 27, column: 3, scope: !1240, inlinedAt: !1243)
!1240 = distinct !DISubprogram(name: "pack_pk", scope: !476, file: !476, line: 23, type: !1241, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{null, !32, !479, !160}
!1243 = distinct !DILocation(line: 240, column: 3, scope: !760)
!1244 = !DILocation(line: 143, column: 21, scope: !1237, inlinedAt: !1203)
!1245 = !DILocation(line: 143, column: 19, scope: !1237, inlinedAt: !1203)
!1246 = !DILocation(line: 143, column: 40, scope: !1237, inlinedAt: !1203)
!1247 = !DILocation(line: 143, column: 5, scope: !1237, inlinedAt: !1203)
!1248 = !DILocation(line: 142, column: 22, scope: !1237, inlinedAt: !1203)
!1249 = !DILocation(line: 142, column: 3, scope: !1237, inlinedAt: !1203)
!1250 = distinct !{!1250, !1198, !1251, !258}
!1251 = !DILocation(line: 143, column: 49, scope: !1199, inlinedAt: !1203)
!1252 = !DILocation(line: 142, scope: !1199, inlinedAt: !1239)
!1253 = !DILocation(line: 0, scope: !1200, inlinedAt: !1239)
!1254 = !DILocation(line: 142, column: 12, scope: !1237, inlinedAt: !1239)
!1255 = !DILocation(line: 143, column: 21, scope: !1237, inlinedAt: !1239)
!1256 = !DILocation(line: 143, column: 19, scope: !1237, inlinedAt: !1239)
!1257 = !DILocation(line: 143, column: 40, scope: !1237, inlinedAt: !1239)
!1258 = !DILocation(line: 143, column: 5, scope: !1237, inlinedAt: !1239)
!1259 = !DILocation(line: 142, column: 22, scope: !1237, inlinedAt: !1239)
!1260 = !DILocation(line: 142, column: 3, scope: !1237, inlinedAt: !1239)
!1261 = distinct !{!1261, !1238, !1262, !258}
!1262 = !DILocation(line: 143, column: 49, scope: !1199, inlinedAt: !1239)
!1263 = !DILocation(line: 28, column: 11, scope: !1240, inlinedAt: !1243)
!1264 = !DILocation(line: 28, column: 3, scope: !1240, inlinedAt: !1243)
!1265 = !DILocation(line: 241, column: 1, scope: !760)
!1266 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !476, file: !476, line: 260, type: !1267, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1267 = !DISubroutineType(types: !1268)
!1268 = !{null, !32, !160, !160, !160}
!1269 = !DILocalVariable(name: "c", arg: 1, scope: !1266, file: !476, line: 260, type: !32)
!1270 = !DILocation(line: 0, scope: !1266)
!1271 = !DILocalVariable(name: "m", arg: 2, scope: !1266, file: !476, line: 261, type: !160)
!1272 = !DILocalVariable(name: "pk", arg: 3, scope: !1266, file: !476, line: 262, type: !160)
!1273 = !DILocalVariable(name: "coins", arg: 4, scope: !1266, file: !476, line: 263, type: !160)
!1274 = !DILocalVariable(name: "seed", scope: !1266, file: !476, line: 266, type: !142)
!1275 = !DILocation(line: 266, column: 11, scope: !1266)
!1276 = !DILocalVariable(name: "nonce", scope: !1266, file: !476, line: 267, type: !33)
!1277 = !DILocalVariable(name: "sp", scope: !1266, file: !476, line: 268, type: !480)
!1278 = !DILocation(line: 268, column: 11, scope: !1266)
!1279 = !DILocalVariable(name: "pkpv", scope: !1266, file: !476, line: 268, type: !480)
!1280 = !DILocation(line: 268, column: 15, scope: !1266)
!1281 = !DILocalVariable(name: "ep", scope: !1266, file: !476, line: 268, type: !480)
!1282 = !DILocation(line: 268, column: 21, scope: !1266)
!1283 = !DILocalVariable(name: "at", scope: !1266, file: !476, line: 268, type: !774)
!1284 = !DILocation(line: 268, column: 25, scope: !1266)
!1285 = !DILocalVariable(name: "b", scope: !1266, file: !476, line: 268, type: !480)
!1286 = !DILocation(line: 268, column: 38, scope: !1266)
!1287 = !DILocalVariable(name: "v", scope: !1266, file: !476, line: 269, type: !486)
!1288 = !DILocation(line: 269, column: 8, scope: !1266)
!1289 = !DILocalVariable(name: "k", scope: !1266, file: !476, line: 269, type: !486)
!1290 = !DILocation(line: 269, column: 11, scope: !1266)
!1291 = !DILocalVariable(name: "epp", scope: !1266, file: !476, line: 269, type: !486)
!1292 = !DILocation(line: 269, column: 14, scope: !1266)
!1293 = !DILocalVariable(name: "pk", arg: 1, scope: !1294, file: !476, line: 41, type: !479)
!1294 = distinct !DISubprogram(name: "unpack_pk", scope: !476, file: !476, line: 41, type: !1295, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{null, !479, !32, !160}
!1297 = !DILocation(line: 0, scope: !1294, inlinedAt: !1298)
!1298 = distinct !DILocation(line: 271, column: 3, scope: !1266)
!1299 = !DILocalVariable(name: "seed", arg: 2, scope: !1294, file: !476, line: 42, type: !32)
!1300 = !DILocalVariable(name: "packedpk", arg: 3, scope: !1294, file: !476, line: 43, type: !160)
!1301 = !DILocalVariable(name: "r", arg: 1, scope: !1302, file: !936, line: 156, type: !940)
!1302 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !936, file: !936, line: 156, type: !1303, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{null, !940, !160}
!1305 = !DILocation(line: 0, scope: !1302, inlinedAt: !1306)
!1306 = distinct !DILocation(line: 45, column: 3, scope: !1294, inlinedAt: !1298)
!1307 = !DILocalVariable(name: "a", arg: 2, scope: !1302, file: !936, line: 156, type: !160)
!1308 = !DILocalVariable(name: "i", scope: !1302, file: !936, line: 158, type: !40)
!1309 = !DILocation(line: 159, column: 7, scope: !1310, inlinedAt: !1306)
!1310 = distinct !DILexicalBlock(scope: !1302, file: !936, line: 159, column: 3)
!1311 = !DILocation(line: 159, scope: !1310, inlinedAt: !1306)
!1312 = !DILocation(line: 159, column: 12, scope: !1313, inlinedAt: !1306)
!1313 = distinct !DILexicalBlock(scope: !1310, file: !936, line: 159, column: 3)
!1314 = !DILocation(line: 159, column: 3, scope: !1310, inlinedAt: !1306)
!1315 = !DILocation(line: 160, column: 21, scope: !1313, inlinedAt: !1306)
!1316 = !DILocation(line: 160, column: 35, scope: !1313, inlinedAt: !1306)
!1317 = !DILocation(line: 160, column: 33, scope: !1313, inlinedAt: !1306)
!1318 = !DILocation(line: 160, column: 5, scope: !1313, inlinedAt: !1306)
!1319 = !DILocation(line: 159, column: 22, scope: !1313, inlinedAt: !1306)
!1320 = !DILocation(line: 159, column: 3, scope: !1313, inlinedAt: !1306)
!1321 = distinct !{!1321, !1314, !1322, !258}
!1322 = !DILocation(line: 160, column: 51, scope: !1310, inlinedAt: !1306)
!1323 = !DILocation(line: 46, column: 24, scope: !1294, inlinedAt: !1298)
!1324 = !DILocation(line: 46, column: 3, scope: !1294, inlinedAt: !1298)
!1325 = !DILocalVariable(name: "r", arg: 1, scope: !1326, file: !798, line: 168, type: !801)
!1326 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !798, file: !798, line: 168, type: !1327, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{null, !801, !160}
!1329 = !DILocation(line: 0, scope: !1326, inlinedAt: !1330)
!1330 = distinct !DILocation(line: 272, column: 3, scope: !1266)
!1331 = !DILocalVariable(name: "msg", arg: 2, scope: !1326, file: !798, line: 168, type: !160)
!1332 = !DILocalVariable(name: "i", scope: !1326, file: !798, line: 170, type: !40)
!1333 = !DILocation(line: 176, column: 7, scope: !1334, inlinedAt: !1330)
!1334 = distinct !DILexicalBlock(scope: !1326, file: !798, line: 176, column: 3)
!1335 = !DILocation(line: 176, scope: !1334, inlinedAt: !1330)
!1336 = !DILocation(line: 176, column: 12, scope: !1337, inlinedAt: !1330)
!1337 = distinct !DILexicalBlock(scope: !1334, file: !798, line: 176, column: 3)
!1338 = !DILocation(line: 176, column: 3, scope: !1334, inlinedAt: !1330)
!1339 = !DILocation(line: 177, column: 5, scope: !1340, inlinedAt: !1330)
!1340 = distinct !DILexicalBlock(scope: !1341, file: !798, line: 177, column: 5)
!1341 = distinct !DILexicalBlock(scope: !1337, file: !798, line: 176, column: 28)
!1342 = !DILocation(line: 177, scope: !1340, inlinedAt: !1330)
!1343 = !DILocalVariable(name: "j", scope: !1326, file: !798, line: 170, type: !40)
!1344 = !DILocation(line: 177, column: 14, scope: !1345, inlinedAt: !1330)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !798, line: 177, column: 5)
!1346 = !DILocation(line: 178, column: 18, scope: !1347, inlinedAt: !1330)
!1347 = distinct !DILexicalBlock(scope: !1345, file: !798, line: 177, column: 22)
!1348 = !DILocation(line: 178, column: 20, scope: !1347, inlinedAt: !1330)
!1349 = !DILocation(line: 178, column: 7, scope: !1347, inlinedAt: !1330)
!1350 = !DILocation(line: 178, column: 24, scope: !1347, inlinedAt: !1330)
!1351 = !DILocation(line: 179, column: 27, scope: !1347, inlinedAt: !1330)
!1352 = !DILocation(line: 179, column: 31, scope: !1347, inlinedAt: !1330)
!1353 = !DILocation(line: 179, column: 53, scope: !1347, inlinedAt: !1330)
!1354 = !DILocalVariable(name: "r", arg: 1, scope: !1355, file: !418, line: 71, type: !719)
!1355 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !418, file: !418, line: 71, type: !1356, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{null, !719, !61, !86}
!1358 = !DILocation(line: 0, scope: !1355, inlinedAt: !1359)
!1359 = distinct !DILocation(line: 179, column: 7, scope: !1347, inlinedAt: !1330)
!1360 = !DILocalVariable(name: "v", arg: 2, scope: !1355, file: !418, line: 71, type: !61)
!1361 = !DILocalVariable(name: "b", arg: 3, scope: !1355, file: !418, line: 71, type: !86)
!1362 = !DILocation(line: 74, column: 15, scope: !1355, inlinedAt: !1359)
!1363 = !DILocation(line: 74, column: 11, scope: !1355, inlinedAt: !1359)
!1364 = !DILocation(line: 74, column: 6, scope: !1355, inlinedAt: !1359)
!1365 = !DILocation(line: 177, column: 18, scope: !1345, inlinedAt: !1330)
!1366 = !DILocation(line: 177, column: 5, scope: !1345, inlinedAt: !1330)
!1367 = distinct !{!1367, !1339, !1368, !258}
!1368 = !DILocation(line: 180, column: 5, scope: !1340, inlinedAt: !1330)
!1369 = !DILocation(line: 176, column: 24, scope: !1337, inlinedAt: !1330)
!1370 = !DILocation(line: 176, column: 3, scope: !1337, inlinedAt: !1330)
!1371 = distinct !{!1371, !1338, !1372, !258}
!1372 = !DILocation(line: 181, column: 3, scope: !1334, inlinedAt: !1330)
!1373 = !DILocation(line: 273, column: 3, scope: !1266)
!1374 = !DILocalVariable(name: "i", scope: !1266, file: !476, line: 265, type: !40)
!1375 = !DILocation(line: 275, column: 7, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1266, file: !476, line: 275, column: 3)
!1377 = !DILocation(line: 275, scope: !1376)
!1378 = !DILocation(line: 275, column: 12, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1376, file: !476, line: 275, column: 3)
!1380 = !DILocation(line: 275, column: 3, scope: !1376)
!1381 = !DILocation(line: 277, column: 3, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1266, file: !476, line: 277, column: 3)
!1383 = !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !1384)
!1384 = distinct !DILocation(line: 276, column: 5, scope: !1379)
!1385 = !DILocation(line: 0, scope: !797, inlinedAt: !1384)
!1386 = !DILocation(line: 227, column: 11, scope: !797, inlinedAt: !1384)
!1387 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !1388)
!1388 = distinct !DILocation(line: 228, column: 3, scope: !797, inlinedAt: !1384)
!1389 = !DILocation(line: 0, scope: !815, inlinedAt: !1388)
!1390 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !1388)
!1391 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !1388)
!1392 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !1388)
!1393 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !1394)
!1394 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !1395)
!1395 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !1388)
!1396 = !DILocation(line: 0, scope: !834, inlinedAt: !1395)
!1397 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !1395)
!1398 = !DILocation(line: 0, scope: !832, inlinedAt: !1394)
!1399 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !1394)
!1400 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !1394)
!1401 = !DILocation(line: 0, scope: !853, inlinedAt: !1402)
!1402 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !1395)
!1403 = !DILocation(line: 0, scope: !604, inlinedAt: !1404)
!1404 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !1402)
!1405 = !DILocation(line: 0, scope: !861, inlinedAt: !1406)
!1406 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !1395)
!1407 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !1406)
!1408 = !DILocation(line: 0, scope: !868, inlinedAt: !1409)
!1409 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !1406)
!1410 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !1409)
!1411 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !1409)
!1412 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !1409)
!1413 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !1409)
!1414 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !1409)
!1415 = !DILocation(line: 439, scope: !886, inlinedAt: !1409)
!1416 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !1409)
!1417 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !1409)
!1418 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1409)
!1419 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !1409)
!1420 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !1409)
!1421 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !1409)
!1422 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !1409)
!1423 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !1409)
!1424 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !1409)
!1425 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !1409)
!1426 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !1409)
!1427 = distinct !{!1427, !1418, !1428, !258}
!1428 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !1409)
!1429 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !1409)
!1430 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !1409)
!1431 = distinct !{!1431, !1410, !1432, !258}
!1432 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !1409)
!1433 = !DILocation(line: 276, column: 30, scope: !1379)
!1434 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !1406)
!1435 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !1406)
!1436 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !1395)
!1437 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !1388)
!1438 = !DILocation(line: 0, scope: !912, inlinedAt: !1439)
!1439 = distinct !DILocation(line: 229, column: 3, scope: !797, inlinedAt: !1384)
!1440 = !DILocation(line: 113, column: 3, scope: !912, inlinedAt: !1439)
!1441 = !DILocation(line: 230, column: 1, scope: !797, inlinedAt: !1384)
!1442 = !DILocation(line: 276, column: 46, scope: !1379)
!1443 = !DILocation(line: 275, column: 22, scope: !1379)
!1444 = !DILocation(line: 275, column: 3, scope: !1379)
!1445 = distinct !{!1445, !1380, !1446, !258}
!1446 = !DILocation(line: 276, column: 48, scope: !1376)
!1447 = !DILocation(line: 277, scope: !1382)
!1448 = !DILocation(line: 277, column: 12, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1382, file: !476, line: 277, column: 3)
!1450 = !DILocation(line: 247, column: 3, scope: !1451, inlinedAt: !1452)
!1451 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !798, file: !798, line: 244, type: !799, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1452 = distinct !DILocation(line: 278, column: 5, scope: !1449)
!1453 = !DILocalVariable(name: "r", arg: 1, scope: !1451, file: !798, line: 244, type: !801)
!1454 = !DILocation(line: 0, scope: !1451, inlinedAt: !1452)
!1455 = !DILocalVariable(name: "seed", arg: 2, scope: !1451, file: !798, line: 244, type: !160)
!1456 = !DILocalVariable(name: "nonce", arg: 3, scope: !1451, file: !798, line: 244, type: !33)
!1457 = !DILocalVariable(name: "buf", scope: !1451, file: !798, line: 246, type: !812)
!1458 = !DILocation(line: 246, column: 11, scope: !1451, inlinedAt: !1452)
!1459 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !1460)
!1460 = distinct !DILocation(line: 247, column: 3, scope: !1451, inlinedAt: !1452)
!1461 = !DILocation(line: 0, scope: !815, inlinedAt: !1460)
!1462 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !1460)
!1463 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !1460)
!1464 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !1460)
!1465 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !1466)
!1466 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !1467)
!1467 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !1460)
!1468 = !DILocation(line: 0, scope: !834, inlinedAt: !1467)
!1469 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !1467)
!1470 = !DILocation(line: 0, scope: !832, inlinedAt: !1466)
!1471 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !1466)
!1472 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !1466)
!1473 = !DILocation(line: 0, scope: !853, inlinedAt: !1474)
!1474 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !1467)
!1475 = !DILocation(line: 0, scope: !604, inlinedAt: !1476)
!1476 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !1474)
!1477 = !DILocation(line: 0, scope: !861, inlinedAt: !1478)
!1478 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !1467)
!1479 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !1478)
!1480 = !DILocation(line: 0, scope: !868, inlinedAt: !1481)
!1481 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !1478)
!1482 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !1481)
!1483 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !1481)
!1484 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !1481)
!1485 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !1481)
!1486 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !1481)
!1487 = !DILocation(line: 439, scope: !886, inlinedAt: !1481)
!1488 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !1481)
!1489 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !1481)
!1490 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1481)
!1491 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !1481)
!1492 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !1481)
!1493 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !1481)
!1494 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !1481)
!1495 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !1481)
!1496 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !1481)
!1497 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !1481)
!1498 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !1481)
!1499 = distinct !{!1499, !1490, !1500, !258}
!1500 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !1481)
!1501 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !1481)
!1502 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !1481)
!1503 = distinct !{!1503, !1482, !1504, !258}
!1504 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !1481)
!1505 = !DILocation(line: 278, column: 30, scope: !1449)
!1506 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !1478)
!1507 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !1478)
!1508 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !1467)
!1509 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !1460)
!1510 = !DILocalVariable(name: "r", arg: 1, scope: !1511, file: !913, line: 121, type: !916)
!1511 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !913, file: !913, line: 121, type: !914, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1512 = !DILocation(line: 0, scope: !1511, inlinedAt: !1513)
!1513 = distinct !DILocation(line: 248, column: 3, scope: !1451, inlinedAt: !1452)
!1514 = !DILocalVariable(name: "buf", arg: 2, scope: !1511, file: !913, line: 121, type: !160)
!1515 = !DILocation(line: 124, column: 3, scope: !1511, inlinedAt: !1513)
!1516 = !DILocation(line: 249, column: 1, scope: !1451, inlinedAt: !1452)
!1517 = !DILocation(line: 278, column: 46, scope: !1449)
!1518 = !DILocation(line: 277, column: 22, scope: !1449)
!1519 = !DILocation(line: 277, column: 3, scope: !1449)
!1520 = distinct !{!1520, !1381, !1521, !258}
!1521 = !DILocation(line: 278, column: 48, scope: !1382)
!1522 = !DILocation(line: 247, column: 3, scope: !1451, inlinedAt: !1523)
!1523 = distinct !DILocation(line: 279, column: 3, scope: !1266)
!1524 = !DILocation(line: 0, scope: !1451, inlinedAt: !1523)
!1525 = !DILocation(line: 246, column: 11, scope: !1451, inlinedAt: !1523)
!1526 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !1527)
!1527 = distinct !DILocation(line: 247, column: 3, scope: !1451, inlinedAt: !1523)
!1528 = !DILocation(line: 0, scope: !815, inlinedAt: !1527)
!1529 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !1527)
!1530 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !1527)
!1531 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !1527)
!1532 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !1533)
!1533 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !1534)
!1534 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !1527)
!1535 = !DILocation(line: 0, scope: !834, inlinedAt: !1534)
!1536 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !1534)
!1537 = !DILocation(line: 0, scope: !832, inlinedAt: !1533)
!1538 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !1533)
!1539 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !1533)
!1540 = !DILocation(line: 0, scope: !853, inlinedAt: !1541)
!1541 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !1534)
!1542 = !DILocation(line: 0, scope: !604, inlinedAt: !1543)
!1543 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !1541)
!1544 = !DILocation(line: 0, scope: !861, inlinedAt: !1545)
!1545 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !1534)
!1546 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !1545)
!1547 = !DILocation(line: 0, scope: !868, inlinedAt: !1548)
!1548 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !1545)
!1549 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !1548)
!1550 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !1548)
!1551 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !1548)
!1552 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !1548)
!1553 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !1548)
!1554 = !DILocation(line: 439, scope: !886, inlinedAt: !1548)
!1555 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !1548)
!1556 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !1548)
!1557 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1548)
!1558 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !1548)
!1559 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !1548)
!1560 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !1548)
!1561 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !1548)
!1562 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !1548)
!1563 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !1548)
!1564 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !1548)
!1565 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !1548)
!1566 = distinct !{!1566, !1557, !1567, !258}
!1567 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !1548)
!1568 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !1548)
!1569 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !1548)
!1570 = distinct !{!1570, !1549, !1571, !258}
!1571 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !1548)
!1572 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !1545)
!1573 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !1545)
!1574 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !1534)
!1575 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !1527)
!1576 = !DILocation(line: 0, scope: !1511, inlinedAt: !1577)
!1577 = distinct !DILocation(line: 248, column: 3, scope: !1451, inlinedAt: !1523)
!1578 = !DILocation(line: 124, column: 3, scope: !1511, inlinedAt: !1577)
!1579 = !DILocation(line: 249, column: 1, scope: !1451, inlinedAt: !1523)
!1580 = !DILocalVariable(name: "r", arg: 1, scope: !937, file: !936, line: 170, type: !940)
!1581 = !DILocation(line: 0, scope: !937, inlinedAt: !1582)
!1582 = distinct !DILocation(line: 281, column: 3, scope: !1266)
!1583 = !DILocation(line: 173, column: 7, scope: !935, inlinedAt: !1582)
!1584 = !DILocation(line: 173, scope: !935, inlinedAt: !1582)
!1585 = !DILocation(line: 173, column: 12, scope: !1019, inlinedAt: !1582)
!1586 = !DILocation(line: 173, column: 3, scope: !935, inlinedAt: !1582)
!1587 = !DILocation(line: 284, column: 3, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1266, file: !476, line: 284, column: 3)
!1589 = !DILocation(line: 174, column: 15, scope: !1019, inlinedAt: !1582)
!1590 = !DILocation(line: 0, scope: !1024, inlinedAt: !1591)
!1591 = distinct !DILocation(line: 174, column: 5, scope: !1019, inlinedAt: !1582)
!1592 = !DILocation(line: 263, column: 3, scope: !1024, inlinedAt: !1591)
!1593 = !DILocation(line: 0, scope: !1031, inlinedAt: !1594)
!1594 = distinct !DILocation(line: 264, column: 3, scope: !1024, inlinedAt: !1591)
!1595 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1594)
!1596 = !DILocation(line: 326, scope: !1036, inlinedAt: !1594)
!1597 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1594)
!1598 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1594)
!1599 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1594)
!1600 = !DILocation(line: 0, scope: !1043, inlinedAt: !1601)
!1601 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1594)
!1602 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1601)
!1603 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1601)
!1604 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1601)
!1605 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1601)
!1606 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1601)
!1607 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1594)
!1608 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1594)
!1609 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1594)
!1610 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1594)
!1611 = distinct !{!1611, !1598, !1612, !258}
!1612 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1594)
!1613 = !DILocation(line: 173, column: 22, scope: !1019, inlinedAt: !1582)
!1614 = !DILocation(line: 173, column: 3, scope: !1019, inlinedAt: !1582)
!1615 = distinct !{!1615, !1586, !1616, !258}
!1616 = !DILocation(line: 174, column: 24, scope: !935, inlinedAt: !1582)
!1617 = !DILocation(line: 284, scope: !1588)
!1618 = !DILocation(line: 284, column: 12, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1588, file: !476, line: 284, column: 3)
!1620 = !DILocation(line: 285, column: 37, scope: !1619)
!1621 = !DILocation(line: 285, column: 48, scope: !1619)
!1622 = !DILocation(line: 285, column: 5, scope: !1619)
!1623 = !DILocation(line: 284, column: 22, scope: !1619)
!1624 = !DILocation(line: 284, column: 3, scope: !1619)
!1625 = distinct !{!1625, !1587, !1626, !258}
!1626 = !DILocation(line: 285, column: 58, scope: !1588)
!1627 = !DILocation(line: 287, column: 3, scope: !1266)
!1628 = !DILocalVariable(name: "r", arg: 1, scope: !1629, file: !936, line: 185, type: !940)
!1629 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !936, file: !936, line: 185, type: !938, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1630 = !DILocation(line: 0, scope: !1629, inlinedAt: !1631)
!1631 = distinct !DILocation(line: 289, column: 3, scope: !1266)
!1632 = !DILocalVariable(name: "i", scope: !1629, file: !936, line: 187, type: !40)
!1633 = !DILocation(line: 188, column: 7, scope: !1634, inlinedAt: !1631)
!1634 = distinct !DILexicalBlock(scope: !1629, file: !936, line: 188, column: 3)
!1635 = !DILocation(line: 188, scope: !1634, inlinedAt: !1631)
!1636 = !DILocation(line: 188, column: 12, scope: !1637, inlinedAt: !1631)
!1637 = distinct !DILexicalBlock(scope: !1634, file: !936, line: 188, column: 3)
!1638 = !DILocation(line: 188, column: 3, scope: !1634, inlinedAt: !1631)
!1639 = !DILocation(line: 189, column: 25, scope: !1637, inlinedAt: !1631)
!1640 = !DILocalVariable(name: "r", arg: 1, scope: !1641, file: !798, line: 276, type: !801)
!1641 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !798, file: !798, line: 276, type: !1025, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1642 = !DILocation(line: 0, scope: !1641, inlinedAt: !1643)
!1643 = distinct !DILocation(line: 189, column: 5, scope: !1637, inlinedAt: !1631)
!1644 = !DILocation(line: 278, column: 3, scope: !1641, inlinedAt: !1643)
!1645 = !DILocation(line: 188, column: 22, scope: !1637, inlinedAt: !1631)
!1646 = !DILocation(line: 188, column: 3, scope: !1637, inlinedAt: !1631)
!1647 = distinct !{!1647, !1638, !1648, !258}
!1648 = !DILocation(line: 189, column: 34, scope: !1634, inlinedAt: !1631)
!1649 = !DILocation(line: 0, scope: !1641, inlinedAt: !1650)
!1650 = distinct !DILocation(line: 290, column: 3, scope: !1266)
!1651 = !DILocation(line: 278, column: 3, scope: !1641, inlinedAt: !1650)
!1652 = !DILocalVariable(name: "r", arg: 1, scope: !1104, file: !936, line: 241, type: !940)
!1653 = !DILocation(line: 0, scope: !1104, inlinedAt: !1654)
!1654 = distinct !DILocation(line: 292, column: 3, scope: !1266)
!1655 = !DILocalVariable(name: "a", arg: 2, scope: !1104, file: !936, line: 241, type: !1107)
!1656 = !DILocalVariable(name: "b", arg: 3, scope: !1104, file: !936, line: 241, type: !1107)
!1657 = !DILocation(line: 244, column: 7, scope: !1103, inlinedAt: !1654)
!1658 = !DILocation(line: 244, scope: !1103, inlinedAt: !1654)
!1659 = !DILocation(line: 244, column: 12, scope: !1155, inlinedAt: !1654)
!1660 = !DILocation(line: 244, column: 3, scope: !1103, inlinedAt: !1654)
!1661 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1662)
!1662 = distinct !DILocation(line: 293, column: 3, scope: !1266)
!1663 = !DILocation(line: 245, column: 15, scope: !1155, inlinedAt: !1654)
!1664 = !DILocation(line: 245, column: 27, scope: !1155, inlinedAt: !1654)
!1665 = !DILocation(line: 245, column: 39, scope: !1155, inlinedAt: !1654)
!1666 = !DILocation(line: 0, scope: !1164, inlinedAt: !1667)
!1667 = distinct !DILocation(line: 245, column: 5, scope: !1155, inlinedAt: !1654)
!1668 = !DILocation(line: 342, column: 7, scope: !1175, inlinedAt: !1667)
!1669 = !DILocation(line: 342, scope: !1175, inlinedAt: !1667)
!1670 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !1667)
!1671 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1667)
!1672 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !1667)
!1673 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !1667)
!1674 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !1667)
!1675 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !1667)
!1676 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !1667)
!1677 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !1667)
!1678 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !1667)
!1679 = distinct !{!1679, !1671, !1680, !258}
!1680 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !1667)
!1681 = !DILocation(line: 244, column: 22, scope: !1155, inlinedAt: !1654)
!1682 = !DILocation(line: 244, column: 3, scope: !1155, inlinedAt: !1654)
!1683 = distinct !{!1683, !1660, !1684, !258}
!1684 = !DILocation(line: 245, column: 48, scope: !1103, inlinedAt: !1654)
!1685 = !DILocation(line: 342, scope: !1175, inlinedAt: !1662)
!1686 = !DILocation(line: 0, scope: !1164, inlinedAt: !1662)
!1687 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !1662)
!1688 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1689)
!1689 = distinct !DILocation(line: 294, column: 3, scope: !1266)
!1690 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !1662)
!1691 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !1662)
!1692 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !1662)
!1693 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !1662)
!1694 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !1662)
!1695 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !1662)
!1696 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !1662)
!1697 = distinct !{!1697, !1661, !1698, !258}
!1698 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !1662)
!1699 = !DILocation(line: 342, scope: !1175, inlinedAt: !1689)
!1700 = !DILocation(line: 0, scope: !1164, inlinedAt: !1689)
!1701 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !1689)
!1702 = !DILocation(line: 228, column: 3, scope: !1157, inlinedAt: !1703)
!1703 = distinct !DILocation(line: 295, column: 3, scope: !1266)
!1704 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !1689)
!1705 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !1689)
!1706 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !1689)
!1707 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !1689)
!1708 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !1689)
!1709 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !1689)
!1710 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !1689)
!1711 = distinct !{!1711, !1688, !1712, !258}
!1712 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !1689)
!1713 = !DILocation(line: 228, scope: !1157, inlinedAt: !1703)
!1714 = !DILocation(line: 0, scope: !1158, inlinedAt: !1703)
!1715 = !DILocation(line: 228, column: 12, scope: !1197, inlinedAt: !1703)
!1716 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1717)
!1717 = distinct !DILocation(line: 296, column: 3, scope: !1266)
!1718 = !DILocation(line: 229, column: 18, scope: !1197, inlinedAt: !1703)
!1719 = !DILocation(line: 0, scope: !1031, inlinedAt: !1720)
!1720 = distinct !DILocation(line: 229, column: 5, scope: !1197, inlinedAt: !1703)
!1721 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1720)
!1722 = !DILocation(line: 326, scope: !1036, inlinedAt: !1720)
!1723 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1720)
!1724 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1720)
!1725 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1720)
!1726 = !DILocation(line: 0, scope: !1043, inlinedAt: !1727)
!1727 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1720)
!1728 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1727)
!1729 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1727)
!1730 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1727)
!1731 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1727)
!1732 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1727)
!1733 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1720)
!1734 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1720)
!1735 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1720)
!1736 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1720)
!1737 = distinct !{!1737, !1724, !1738, !258}
!1738 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1720)
!1739 = !DILocation(line: 228, column: 22, scope: !1197, inlinedAt: !1703)
!1740 = !DILocation(line: 228, column: 3, scope: !1197, inlinedAt: !1703)
!1741 = distinct !{!1741, !1702, !1742, !258}
!1742 = !DILocation(line: 229, column: 27, scope: !1157, inlinedAt: !1703)
!1743 = !DILocation(line: 326, scope: !1036, inlinedAt: !1717)
!1744 = !DILocation(line: 0, scope: !1031, inlinedAt: !1717)
!1745 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1717)
!1746 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1717)
!1747 = !DILocation(line: 0, scope: !1043, inlinedAt: !1748)
!1748 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1717)
!1749 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1748)
!1750 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1748)
!1751 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1748)
!1752 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1748)
!1753 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1748)
!1754 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1717)
!1755 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1717)
!1756 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1717)
!1757 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1717)
!1758 = distinct !{!1758, !1716, !1759, !258}
!1759 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1717)
!1760 = !DILocalVariable(name: "r", arg: 1, scope: !1761, file: !476, line: 86, type: !32)
!1761 = distinct !DISubprogram(name: "pack_ciphertext", scope: !476, file: !476, line: 86, type: !1762, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1762 = !DISubroutineType(types: !1763)
!1763 = !{null, !32, !479, !1764}
!1764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 32)
!1765 = !DILocation(line: 0, scope: !1761, inlinedAt: !1766)
!1766 = distinct !DILocation(line: 298, column: 3, scope: !1266)
!1767 = !DILocalVariable(name: "b", arg: 2, scope: !1761, file: !476, line: 86, type: !479)
!1768 = !DILocalVariable(name: "v", arg: 3, scope: !1761, file: !476, line: 86, type: !1764)
!1769 = !DILocation(line: 88, column: 3, scope: !1761, inlinedAt: !1766)
!1770 = !DILocation(line: 89, column: 18, scope: !1761, inlinedAt: !1766)
!1771 = !DILocation(line: 89, column: 3, scope: !1761, inlinedAt: !1766)
!1772 = !DILocation(line: 299, column: 1, scope: !1266)
!1773 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !476, file: !476, line: 314, type: !1774, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1774 = !DISubroutineType(types: !1775)
!1775 = !{null, !32, !160, !160}
!1776 = !DILocalVariable(name: "m", arg: 1, scope: !1773, file: !476, line: 314, type: !32)
!1777 = !DILocation(line: 0, scope: !1773)
!1778 = !DILocalVariable(name: "c", arg: 2, scope: !1773, file: !476, line: 315, type: !160)
!1779 = !DILocalVariable(name: "sk", arg: 3, scope: !1773, file: !476, line: 316, type: !160)
!1780 = !DILocalVariable(name: "b", scope: !1773, file: !476, line: 318, type: !480)
!1781 = !DILocation(line: 318, column: 11, scope: !1773)
!1782 = !DILocalVariable(name: "skpv", scope: !1773, file: !476, line: 318, type: !480)
!1783 = !DILocation(line: 318, column: 14, scope: !1773)
!1784 = !DILocalVariable(name: "v", scope: !1773, file: !476, line: 319, type: !486)
!1785 = !DILocation(line: 319, column: 8, scope: !1773)
!1786 = !DILocalVariable(name: "mp", scope: !1773, file: !476, line: 319, type: !486)
!1787 = !DILocation(line: 319, column: 11, scope: !1773)
!1788 = !DILocalVariable(name: "b", arg: 1, scope: !1789, file: !476, line: 102, type: !479)
!1789 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !476, file: !476, line: 102, type: !1790, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1790 = !DISubroutineType(types: !1791)
!1791 = !{null, !479, !1764, !160}
!1792 = !DILocation(line: 0, scope: !1789, inlinedAt: !1793)
!1793 = distinct !DILocation(line: 321, column: 3, scope: !1773)
!1794 = !DILocalVariable(name: "v", arg: 2, scope: !1789, file: !476, line: 102, type: !1764)
!1795 = !DILocalVariable(name: "c", arg: 3, scope: !1789, file: !476, line: 102, type: !160)
!1796 = !DILocation(line: 104, column: 3, scope: !1789, inlinedAt: !1793)
!1797 = !DILocation(line: 105, column: 23, scope: !1789, inlinedAt: !1793)
!1798 = !DILocalVariable(name: "r", arg: 1, scope: !1799, file: !798, line: 83, type: !801)
!1799 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !798, file: !798, line: 83, type: !1327, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1800 = !DILocation(line: 0, scope: !1799, inlinedAt: !1801)
!1801 = distinct !DILocation(line: 105, column: 3, scope: !1789, inlinedAt: !1793)
!1802 = !DILocalVariable(name: "a", arg: 2, scope: !1799, file: !798, line: 83, type: !160)
!1803 = !DILocalVariable(name: "i", scope: !1799, file: !798, line: 85, type: !40)
!1804 = !DILocation(line: 88, column: 7, scope: !1805, inlinedAt: !1801)
!1805 = distinct !DILexicalBlock(scope: !1799, file: !798, line: 88, column: 3)
!1806 = !DILocation(line: 88, scope: !1805, inlinedAt: !1801)
!1807 = !DILocation(line: 88, column: 12, scope: !1808, inlinedAt: !1801)
!1808 = distinct !DILexicalBlock(scope: !1805, file: !798, line: 88, column: 3)
!1809 = !DILocation(line: 88, column: 3, scope: !1805, inlinedAt: !1801)
!1810 = !DILocation(line: 159, column: 3, scope: !1310, inlinedAt: !1811)
!1811 = distinct !DILocation(line: 72, column: 3, scope: !1812, inlinedAt: !1815)
!1812 = distinct !DISubprogram(name: "unpack_sk", scope: !476, file: !476, line: 70, type: !1813, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1813 = !DISubroutineType(types: !1814)
!1814 = !{null, !479, !160}
!1815 = distinct !DILocation(line: 322, column: 3, scope: !1773)
!1816 = !DILocation(line: 89, column: 37, scope: !1817, inlinedAt: !1801)
!1817 = distinct !DILexicalBlock(scope: !1808, file: !798, line: 88, column: 28)
!1818 = !DILocation(line: 89, column: 42, scope: !1817, inlinedAt: !1801)
!1819 = !DILocation(line: 89, column: 26, scope: !1817, inlinedAt: !1801)
!1820 = !DILocation(line: 89, column: 47, scope: !1817, inlinedAt: !1801)
!1821 = !DILocation(line: 89, column: 57, scope: !1817, inlinedAt: !1801)
!1822 = !DILocation(line: 89, column: 62, scope: !1817, inlinedAt: !1801)
!1823 = !DILocation(line: 89, column: 24, scope: !1817, inlinedAt: !1801)
!1824 = !DILocation(line: 89, column: 16, scope: !1817, inlinedAt: !1801)
!1825 = !DILocation(line: 89, column: 5, scope: !1817, inlinedAt: !1801)
!1826 = !DILocation(line: 89, column: 22, scope: !1817, inlinedAt: !1801)
!1827 = !DILocation(line: 90, column: 37, scope: !1817, inlinedAt: !1801)
!1828 = !DILocation(line: 90, column: 42, scope: !1817, inlinedAt: !1801)
!1829 = !DILocation(line: 90, column: 26, scope: !1817, inlinedAt: !1801)
!1830 = !DILocation(line: 90, column: 47, scope: !1817, inlinedAt: !1801)
!1831 = !DILocation(line: 90, column: 57, scope: !1817, inlinedAt: !1801)
!1832 = !DILocation(line: 90, column: 62, scope: !1817, inlinedAt: !1801)
!1833 = !DILocation(line: 90, column: 24, scope: !1817, inlinedAt: !1801)
!1834 = !DILocation(line: 90, column: 16, scope: !1817, inlinedAt: !1801)
!1835 = !DILocation(line: 90, column: 18, scope: !1817, inlinedAt: !1801)
!1836 = !DILocation(line: 90, column: 5, scope: !1817, inlinedAt: !1801)
!1837 = !DILocation(line: 90, column: 22, scope: !1817, inlinedAt: !1801)
!1838 = !DILocation(line: 91, column: 7, scope: !1817, inlinedAt: !1801)
!1839 = !DILocation(line: 88, column: 24, scope: !1808, inlinedAt: !1801)
!1840 = !DILocation(line: 88, column: 3, scope: !1808, inlinedAt: !1801)
!1841 = distinct !{!1841, !1809, !1842, !258}
!1842 = !DILocation(line: 92, column: 3, scope: !1805, inlinedAt: !1801)
!1843 = !DILocation(line: 159, scope: !1310, inlinedAt: !1811)
!1844 = !DILocation(line: 0, scope: !1302, inlinedAt: !1811)
!1845 = !DILocation(line: 159, column: 12, scope: !1313, inlinedAt: !1811)
!1846 = !DILocation(line: 173, column: 3, scope: !935, inlinedAt: !1847)
!1847 = distinct !DILocation(line: 324, column: 3, scope: !1773)
!1848 = !DILocation(line: 160, column: 21, scope: !1313, inlinedAt: !1811)
!1849 = !DILocation(line: 160, column: 35, scope: !1313, inlinedAt: !1811)
!1850 = !DILocation(line: 160, column: 33, scope: !1313, inlinedAt: !1811)
!1851 = !DILocation(line: 160, column: 5, scope: !1313, inlinedAt: !1811)
!1852 = !DILocation(line: 159, column: 22, scope: !1313, inlinedAt: !1811)
!1853 = !DILocation(line: 159, column: 3, scope: !1313, inlinedAt: !1811)
!1854 = distinct !{!1854, !1810, !1855, !258}
!1855 = !DILocation(line: 160, column: 51, scope: !1310, inlinedAt: !1811)
!1856 = !DILocation(line: 173, scope: !935, inlinedAt: !1847)
!1857 = !DILocation(line: 0, scope: !937, inlinedAt: !1847)
!1858 = !DILocation(line: 173, column: 12, scope: !1019, inlinedAt: !1847)
!1859 = !DILocation(line: 174, column: 15, scope: !1019, inlinedAt: !1847)
!1860 = !DILocation(line: 0, scope: !1024, inlinedAt: !1861)
!1861 = distinct !DILocation(line: 174, column: 5, scope: !1019, inlinedAt: !1847)
!1862 = !DILocation(line: 263, column: 3, scope: !1024, inlinedAt: !1861)
!1863 = !DILocation(line: 0, scope: !1031, inlinedAt: !1864)
!1864 = distinct !DILocation(line: 264, column: 3, scope: !1024, inlinedAt: !1861)
!1865 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !1864)
!1866 = !DILocation(line: 326, scope: !1036, inlinedAt: !1864)
!1867 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1864)
!1868 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1864)
!1869 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1864)
!1870 = !DILocation(line: 0, scope: !1043, inlinedAt: !1871)
!1871 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1864)
!1872 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1871)
!1873 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1871)
!1874 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1871)
!1875 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1871)
!1876 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1871)
!1877 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1864)
!1878 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1864)
!1879 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1864)
!1880 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1864)
!1881 = distinct !{!1881, !1868, !1882, !258}
!1882 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1864)
!1883 = !DILocation(line: 173, column: 22, scope: !1019, inlinedAt: !1847)
!1884 = !DILocation(line: 173, column: 3, scope: !1019, inlinedAt: !1847)
!1885 = distinct !{!1885, !1846, !1886, !258}
!1886 = !DILocation(line: 174, column: 24, scope: !935, inlinedAt: !1847)
!1887 = !DILocation(line: 325, column: 3, scope: !1773)
!1888 = !DILocation(line: 0, scope: !1641, inlinedAt: !1889)
!1889 = distinct !DILocation(line: 326, column: 3, scope: !1773)
!1890 = !DILocation(line: 278, column: 3, scope: !1641, inlinedAt: !1889)
!1891 = !DILocalVariable(name: "r", arg: 1, scope: !1892, file: !798, line: 355, type: !801)
!1892 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !798, file: !798, line: 355, type: !1165, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1893 = !DILocation(line: 0, scope: !1892, inlinedAt: !1894)
!1894 = distinct !DILocation(line: 328, column: 3, scope: !1773)
!1895 = !DILocalVariable(name: "a", arg: 2, scope: !1892, file: !798, line: 355, type: !1167)
!1896 = !DILocalVariable(name: "b", arg: 3, scope: !1892, file: !798, line: 355, type: !1167)
!1897 = !DILocalVariable(name: "i", scope: !1892, file: !798, line: 357, type: !40)
!1898 = !DILocation(line: 358, column: 7, scope: !1899, inlinedAt: !1894)
!1899 = distinct !DILexicalBlock(scope: !1892, file: !798, line: 358, column: 3)
!1900 = !DILocation(line: 358, scope: !1899, inlinedAt: !1894)
!1901 = !DILocation(line: 358, column: 12, scope: !1902, inlinedAt: !1894)
!1902 = distinct !DILexicalBlock(scope: !1899, file: !798, line: 358, column: 3)
!1903 = !DILocation(line: 358, column: 3, scope: !1899, inlinedAt: !1894)
!1904 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1905)
!1905 = distinct !DILocation(line: 329, column: 3, scope: !1773)
!1906 = !DILocation(line: 359, column: 20, scope: !1902, inlinedAt: !1894)
!1907 = !DILocation(line: 359, column: 35, scope: !1902, inlinedAt: !1894)
!1908 = !DILocation(line: 359, column: 33, scope: !1902, inlinedAt: !1894)
!1909 = !DILocation(line: 359, column: 5, scope: !1902, inlinedAt: !1894)
!1910 = !DILocation(line: 359, column: 18, scope: !1902, inlinedAt: !1894)
!1911 = !DILocation(line: 358, column: 22, scope: !1902, inlinedAt: !1894)
!1912 = !DILocation(line: 358, column: 3, scope: !1902, inlinedAt: !1894)
!1913 = distinct !{!1913, !1903, !1914, !258}
!1914 = !DILocation(line: 359, column: 46, scope: !1899, inlinedAt: !1894)
!1915 = !DILocation(line: 326, scope: !1036, inlinedAt: !1905)
!1916 = !DILocation(line: 0, scope: !1031, inlinedAt: !1905)
!1917 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !1905)
!1918 = !DILocation(line: 197, column: 3, scope: !1919, inlinedAt: !1923)
!1919 = distinct !DILexicalBlock(scope: !1920, file: !798, line: 197, column: 3)
!1920 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !798, file: !798, line: 192, type: !1921, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1921 = !DISubroutineType(types: !1922)
!1922 = !{null, !32, !1167}
!1923 = distinct !DILocation(line: 331, column: 3, scope: !1773)
!1924 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !1905)
!1925 = !DILocation(line: 0, scope: !1043, inlinedAt: !1926)
!1926 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !1905)
!1927 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !1926)
!1928 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !1926)
!1929 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !1926)
!1930 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !1926)
!1931 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !1926)
!1932 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !1905)
!1933 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !1905)
!1934 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !1905)
!1935 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !1905)
!1936 = distinct !{!1936, !1904, !1937, !258}
!1937 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !1905)
!1938 = !DILocation(line: 197, scope: !1919, inlinedAt: !1923)
!1939 = !DILocalVariable(name: "i", scope: !1920, file: !798, line: 194, type: !40)
!1940 = !DILocation(line: 0, scope: !1920, inlinedAt: !1923)
!1941 = !DILocation(line: 197, column: 12, scope: !1942, inlinedAt: !1923)
!1942 = distinct !DILexicalBlock(scope: !1919, file: !798, line: 197, column: 3)
!1943 = !DILocation(line: 198, column: 5, scope: !1944, inlinedAt: !1923)
!1944 = distinct !DILexicalBlock(scope: !1942, file: !798, line: 197, column: 28)
!1945 = !DILocation(line: 198, column: 12, scope: !1944, inlinedAt: !1923)
!1946 = !DILocalVariable(name: "j", scope: !1920, file: !798, line: 194, type: !40)
!1947 = !DILocation(line: 199, column: 9, scope: !1948, inlinedAt: !1923)
!1948 = distinct !DILexicalBlock(scope: !1944, file: !798, line: 199, column: 5)
!1949 = !DILocation(line: 199, scope: !1948, inlinedAt: !1923)
!1950 = !DILocation(line: 199, column: 14, scope: !1951, inlinedAt: !1923)
!1951 = distinct !DILexicalBlock(scope: !1948, file: !798, line: 199, column: 5)
!1952 = !DILocation(line: 199, column: 5, scope: !1948, inlinedAt: !1923)
!1953 = !DILocation(line: 200, column: 23, scope: !1954, inlinedAt: !1923)
!1954 = distinct !DILexicalBlock(scope: !1951, file: !798, line: 199, column: 22)
!1955 = !DILocation(line: 200, column: 25, scope: !1954, inlinedAt: !1923)
!1956 = !DILocation(line: 200, column: 12, scope: !1954, inlinedAt: !1923)
!1957 = !DILocalVariable(name: "t", scope: !1920, file: !798, line: 195, type: !91)
!1958 = !DILocation(line: 205, column: 9, scope: !1954, inlinedAt: !1923)
!1959 = !DILocation(line: 206, column: 9, scope: !1954, inlinedAt: !1923)
!1960 = !DILocation(line: 207, column: 9, scope: !1954, inlinedAt: !1923)
!1961 = !DILocation(line: 208, column: 19, scope: !1954, inlinedAt: !1923)
!1962 = !DILocation(line: 208, column: 7, scope: !1954, inlinedAt: !1923)
!1963 = !DILocation(line: 208, column: 14, scope: !1954, inlinedAt: !1923)
!1964 = !DILocation(line: 199, column: 18, scope: !1951, inlinedAt: !1923)
!1965 = !DILocation(line: 199, column: 5, scope: !1951, inlinedAt: !1923)
!1966 = distinct !{!1966, !1952, !1967, !258}
!1967 = !DILocation(line: 209, column: 5, scope: !1948, inlinedAt: !1923)
!1968 = !DILocation(line: 197, column: 24, scope: !1942, inlinedAt: !1923)
!1969 = !DILocation(line: 197, column: 3, scope: !1942, inlinedAt: !1923)
!1970 = distinct !{!1970, !1918, !1971, !258}
!1971 = !DILocation(line: 210, column: 3, scope: !1919, inlinedAt: !1923)
!1972 = !DILocation(line: 332, column: 1, scope: !1773)
!1973 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !936, file: !936, line: 15, type: !1201, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1974 = !DILocalVariable(name: "r", arg: 1, scope: !1973, file: !936, line: 15, type: !32)
!1975 = !DILocation(line: 0, scope: !1973)
!1976 = !DILocalVariable(name: "a", arg: 2, scope: !1973, file: !936, line: 15, type: !1107)
!1977 = !DILocalVariable(name: "t", scope: !1973, file: !936, line: 51, type: !1978)
!1978 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !1979)
!1979 = !{!1980}
!1980 = !DISubrange(count: 4)
!1981 = !DILocation(line: 51, column: 12, scope: !1973)
!1982 = !DILocalVariable(name: "i", scope: !1973, file: !936, line: 17, type: !40)
!1983 = !DILocation(line: 52, column: 7, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1973, file: !936, line: 52, column: 3)
!1985 = !DILocation(line: 52, scope: !1984)
!1986 = !DILocation(line: 52, column: 12, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1984, file: !936, line: 52, column: 3)
!1988 = !DILocation(line: 52, column: 3, scope: !1984)
!1989 = !DILocation(line: 53, column: 5, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1991, file: !936, line: 53, column: 5)
!1991 = distinct !DILexicalBlock(scope: !1987, file: !936, line: 52, column: 26)
!1992 = !DILocation(line: 53, scope: !1990)
!1993 = !DILocalVariable(name: "j", scope: !1973, file: !936, line: 17, type: !40)
!1994 = !DILocation(line: 53, column: 14, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1990, file: !936, line: 53, column: 5)
!1996 = !DILocation(line: 54, column: 7, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1998, file: !936, line: 54, column: 7)
!1998 = distinct !DILexicalBlock(scope: !1995, file: !936, line: 53, column: 30)
!1999 = !DILocation(line: 54, scope: !1997)
!2000 = !DILocalVariable(name: "k", scope: !1973, file: !936, line: 17, type: !40)
!2001 = !DILocation(line: 54, column: 16, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1997, file: !936, line: 54, column: 7)
!2003 = !DILocation(line: 55, column: 17, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !2002, file: !936, line: 54, column: 24)
!2005 = !DILocation(line: 55, column: 35, scope: !2004)
!2006 = !DILocation(line: 55, column: 37, scope: !2004)
!2007 = !DILocation(line: 56, column: 39, scope: !2004)
!2008 = !DILocation(line: 56, column: 9, scope: !2004)
!2009 = !DILocation(line: 56, column: 14, scope: !2004)
!2010 = !DILocation(line: 58, column: 14, scope: !2004)
!2011 = !DILocalVariable(name: "d0", scope: !1973, file: !936, line: 18, type: !70)
!2012 = !DILocation(line: 61, column: 12, scope: !2004)
!2013 = !DILocation(line: 62, column: 12, scope: !2004)
!2014 = !DILocation(line: 63, column: 16, scope: !2004)
!2015 = !DILocation(line: 63, column: 9, scope: !2004)
!2016 = !DILocation(line: 63, column: 14, scope: !2004)
!2017 = !DILocation(line: 54, column: 20, scope: !2002)
!2018 = !DILocation(line: 54, column: 7, scope: !2002)
!2019 = distinct !{!2019, !1996, !2020, !258}
!2020 = !DILocation(line: 64, column: 7, scope: !1997)
!2021 = !DILocation(line: 66, column: 15, scope: !1998)
!2022 = !DILocation(line: 66, column: 14, scope: !1998)
!2023 = !DILocation(line: 66, column: 12, scope: !1998)
!2024 = !DILocation(line: 67, column: 15, scope: !1998)
!2025 = !DILocation(line: 67, column: 20, scope: !1998)
!2026 = !DILocation(line: 67, column: 29, scope: !1998)
!2027 = !DILocation(line: 67, column: 34, scope: !1998)
!2028 = !DILocation(line: 67, column: 26, scope: !1998)
!2029 = !DILocation(line: 67, column: 7, scope: !1998)
!2030 = !DILocation(line: 67, column: 12, scope: !1998)
!2031 = !DILocation(line: 68, column: 15, scope: !1998)
!2032 = !DILocation(line: 68, column: 20, scope: !1998)
!2033 = !DILocation(line: 68, column: 29, scope: !1998)
!2034 = !DILocation(line: 68, column: 34, scope: !1998)
!2035 = !DILocation(line: 68, column: 26, scope: !1998)
!2036 = !DILocation(line: 68, column: 7, scope: !1998)
!2037 = !DILocation(line: 68, column: 12, scope: !1998)
!2038 = !DILocation(line: 69, column: 15, scope: !1998)
!2039 = !DILocation(line: 69, column: 20, scope: !1998)
!2040 = !DILocation(line: 69, column: 29, scope: !1998)
!2041 = !DILocation(line: 69, column: 34, scope: !1998)
!2042 = !DILocation(line: 69, column: 26, scope: !1998)
!2043 = !DILocation(line: 69, column: 7, scope: !1998)
!2044 = !DILocation(line: 69, column: 12, scope: !1998)
!2045 = !DILocation(line: 70, column: 15, scope: !1998)
!2046 = !DILocation(line: 70, column: 20, scope: !1998)
!2047 = !DILocation(line: 70, column: 14, scope: !1998)
!2048 = !DILocation(line: 70, column: 7, scope: !1998)
!2049 = !DILocation(line: 70, column: 12, scope: !1998)
!2050 = !DILocation(line: 71, column: 9, scope: !1998)
!2051 = !DILocation(line: 53, column: 26, scope: !1995)
!2052 = !DILocation(line: 53, column: 5, scope: !1995)
!2053 = distinct !{!2053, !1989, !2054, !258}
!2054 = !DILocation(line: 72, column: 5, scope: !1990)
!2055 = !DILocation(line: 52, column: 22, scope: !1987)
!2056 = !DILocation(line: 52, column: 3, scope: !1987)
!2057 = distinct !{!2057, !1988, !2058, !258}
!2058 = !DILocation(line: 73, column: 3, scope: !1984)
!2059 = !DILocation(line: 77, column: 1, scope: !1973)
!2060 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !936, file: !936, line: 89, type: !1303, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2061 = !DILocalVariable(name: "r", arg: 1, scope: !2060, file: !936, line: 89, type: !940)
!2062 = !DILocation(line: 0, scope: !2060)
!2063 = !DILocalVariable(name: "a", arg: 2, scope: !2060, file: !936, line: 89, type: !160)
!2064 = !DILocalVariable(name: "t", scope: !2060, file: !936, line: 112, type: !1978)
!2065 = !DILocation(line: 112, column: 12, scope: !2060)
!2066 = !DILocalVariable(name: "i", scope: !2060, file: !936, line: 91, type: !40)
!2067 = !DILocation(line: 113, column: 7, scope: !2068)
!2068 = distinct !DILexicalBlock(scope: !2060, file: !936, line: 113, column: 3)
!2069 = !DILocation(line: 113, scope: !2068)
!2070 = !DILocation(line: 113, column: 12, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2068, file: !936, line: 113, column: 3)
!2072 = !DILocation(line: 113, column: 3, scope: !2068)
!2073 = !DILocation(line: 114, column: 5, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2075, file: !936, line: 114, column: 5)
!2075 = distinct !DILexicalBlock(scope: !2071, file: !936, line: 113, column: 26)
!2076 = !DILocation(line: 114, scope: !2074)
!2077 = !DILocalVariable(name: "j", scope: !2060, file: !936, line: 91, type: !40)
!2078 = !DILocation(line: 114, column: 14, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2074, file: !936, line: 114, column: 5)
!2080 = !DILocation(line: 115, column: 15, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2079, file: !936, line: 114, column: 30)
!2082 = !DILocation(line: 115, column: 39, scope: !2081)
!2083 = !DILocation(line: 115, column: 29, scope: !2081)
!2084 = !DILocation(line: 115, column: 44, scope: !2081)
!2085 = !DILocation(line: 115, column: 26, scope: !2081)
!2086 = !DILocation(line: 115, column: 12, scope: !2081)
!2087 = !DILocation(line: 116, column: 15, scope: !2081)
!2088 = !DILocation(line: 116, column: 20, scope: !2081)
!2089 = !DILocation(line: 116, column: 39, scope: !2081)
!2090 = !DILocation(line: 116, column: 29, scope: !2081)
!2091 = !DILocation(line: 116, column: 44, scope: !2081)
!2092 = !DILocation(line: 116, column: 26, scope: !2081)
!2093 = !DILocation(line: 116, column: 7, scope: !2081)
!2094 = !DILocation(line: 116, column: 12, scope: !2081)
!2095 = !DILocation(line: 117, column: 15, scope: !2081)
!2096 = !DILocation(line: 117, column: 20, scope: !2081)
!2097 = !DILocation(line: 117, column: 39, scope: !2081)
!2098 = !DILocation(line: 117, column: 29, scope: !2081)
!2099 = !DILocation(line: 117, column: 44, scope: !2081)
!2100 = !DILocation(line: 117, column: 26, scope: !2081)
!2101 = !DILocation(line: 117, column: 7, scope: !2081)
!2102 = !DILocation(line: 117, column: 12, scope: !2081)
!2103 = !DILocation(line: 118, column: 15, scope: !2081)
!2104 = !DILocation(line: 118, column: 20, scope: !2081)
!2105 = !DILocation(line: 118, column: 39, scope: !2081)
!2106 = !DILocation(line: 118, column: 29, scope: !2081)
!2107 = !DILocation(line: 118, column: 44, scope: !2081)
!2108 = !DILocation(line: 118, column: 26, scope: !2081)
!2109 = !DILocation(line: 118, column: 7, scope: !2081)
!2110 = !DILocation(line: 118, column: 12, scope: !2081)
!2111 = !DILocalVariable(name: "k", scope: !2060, file: !936, line: 91, type: !40)
!2112 = !DILocation(line: 121, column: 11, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2081, file: !936, line: 121, column: 7)
!2114 = !DILocation(line: 121, scope: !2113)
!2115 = !DILocation(line: 121, column: 16, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2113, file: !936, line: 121, column: 7)
!2117 = !DILocation(line: 121, column: 7, scope: !2113)
!2118 = !DILocation(line: 122, column: 47, scope: !2116)
!2119 = !DILocation(line: 122, column: 52, scope: !2116)
!2120 = !DILocation(line: 122, column: 60, scope: !2116)
!2121 = !DILocation(line: 122, column: 69, scope: !2116)
!2122 = !DILocation(line: 122, column: 76, scope: !2116)
!2123 = !DILocation(line: 122, column: 35, scope: !2116)
!2124 = !DILocation(line: 122, column: 9, scope: !2116)
!2125 = !DILocation(line: 122, column: 27, scope: !2116)
!2126 = !DILocation(line: 122, column: 29, scope: !2116)
!2127 = !DILocation(line: 122, column: 33, scope: !2116)
!2128 = !DILocation(line: 121, column: 20, scope: !2116)
!2129 = !DILocation(line: 121, column: 7, scope: !2116)
!2130 = distinct !{!2130, !2117, !2131, !258}
!2131 = !DILocation(line: 122, column: 79, scope: !2113)
!2132 = !DILocation(line: 119, column: 9, scope: !2081)
!2133 = !DILocation(line: 114, column: 26, scope: !2079)
!2134 = !DILocation(line: 114, column: 5, scope: !2079)
!2135 = distinct !{!2135, !2073, !2136, !258}
!2136 = !DILocation(line: 123, column: 5, scope: !2074)
!2137 = !DILocation(line: 113, column: 22, scope: !2071)
!2138 = !DILocation(line: 113, column: 3, scope: !2071)
!2139 = distinct !{!2139, !2072, !2140, !258}
!2140 = !DILocation(line: 124, column: 3, scope: !2068)
!2141 = !DILocation(line: 128, column: 1, scope: !2060)
!2142 = !DILocalVariable(name: "r", arg: 1, scope: !1200, file: !936, line: 139, type: !32)
!2143 = !DILocation(line: 0, scope: !1200)
!2144 = !DILocalVariable(name: "a", arg: 2, scope: !1200, file: !936, line: 139, type: !1107)
!2145 = !DILocation(line: 142, column: 7, scope: !1199)
!2146 = !DILocation(line: 142, scope: !1199)
!2147 = !DILocation(line: 142, column: 12, scope: !1237)
!2148 = !DILocation(line: 142, column: 3, scope: !1199)
!2149 = !DILocation(line: 143, column: 21, scope: !1237)
!2150 = !DILocation(line: 143, column: 19, scope: !1237)
!2151 = !DILocation(line: 143, column: 40, scope: !1237)
!2152 = !DILocation(line: 143, column: 5, scope: !1237)
!2153 = !DILocation(line: 142, column: 22, scope: !1237)
!2154 = !DILocation(line: 142, column: 3, scope: !1237)
!2155 = distinct !{!2155, !2148, !2156, !258}
!2156 = !DILocation(line: 143, column: 49, scope: !1199)
!2157 = !DILocation(line: 144, column: 1, scope: !1200)
!2158 = !DILocation(line: 0, scope: !1302)
!2159 = !DILocation(line: 159, column: 7, scope: !1310)
!2160 = !DILocation(line: 159, scope: !1310)
!2161 = !DILocation(line: 159, column: 12, scope: !1313)
!2162 = !DILocation(line: 159, column: 3, scope: !1310)
!2163 = !DILocation(line: 160, column: 21, scope: !1313)
!2164 = !DILocation(line: 160, column: 35, scope: !1313)
!2165 = !DILocation(line: 160, column: 33, scope: !1313)
!2166 = !DILocation(line: 160, column: 5, scope: !1313)
!2167 = !DILocation(line: 159, column: 22, scope: !1313)
!2168 = !DILocation(line: 159, column: 3, scope: !1313)
!2169 = distinct !{!2169, !2162, !2170, !258}
!2170 = !DILocation(line: 160, column: 51, scope: !1310)
!2171 = !DILocation(line: 161, column: 1, scope: !1302)
!2172 = !DILocation(line: 0, scope: !937)
!2173 = !DILocation(line: 173, column: 7, scope: !935)
!2174 = !DILocation(line: 173, scope: !935)
!2175 = !DILocation(line: 173, column: 12, scope: !1019)
!2176 = !DILocation(line: 173, column: 3, scope: !935)
!2177 = !DILocation(line: 174, column: 15, scope: !1019)
!2178 = !DILocation(line: 0, scope: !1024, inlinedAt: !2179)
!2179 = distinct !DILocation(line: 174, column: 5, scope: !1019)
!2180 = !DILocation(line: 263, column: 3, scope: !1024, inlinedAt: !2179)
!2181 = !DILocation(line: 0, scope: !1031, inlinedAt: !2182)
!2182 = distinct !DILocation(line: 264, column: 3, scope: !1024, inlinedAt: !2179)
!2183 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !2182)
!2184 = !DILocation(line: 326, scope: !1036, inlinedAt: !2182)
!2185 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !2182)
!2186 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2182)
!2187 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !2182)
!2188 = !DILocation(line: 0, scope: !1043, inlinedAt: !2189)
!2189 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !2182)
!2190 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2189)
!2191 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2189)
!2192 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2189)
!2193 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2189)
!2194 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2189)
!2195 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !2182)
!2196 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !2182)
!2197 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !2182)
!2198 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !2182)
!2199 = distinct !{!2199, !2186, !2200, !258}
!2200 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !2182)
!2201 = !DILocation(line: 173, column: 22, scope: !1019)
!2202 = !DILocation(line: 173, column: 3, scope: !1019)
!2203 = distinct !{!2203, !2176, !2204, !258}
!2204 = !DILocation(line: 174, column: 24, scope: !935)
!2205 = !DILocation(line: 175, column: 1, scope: !937)
!2206 = !DILocation(line: 0, scope: !1629)
!2207 = !DILocation(line: 188, column: 7, scope: !1634)
!2208 = !DILocation(line: 188, scope: !1634)
!2209 = !DILocation(line: 188, column: 12, scope: !1637)
!2210 = !DILocation(line: 188, column: 3, scope: !1634)
!2211 = !DILocation(line: 189, column: 25, scope: !1637)
!2212 = !DILocation(line: 0, scope: !1641, inlinedAt: !2213)
!2213 = distinct !DILocation(line: 189, column: 5, scope: !1637)
!2214 = !DILocation(line: 278, column: 3, scope: !1641, inlinedAt: !2213)
!2215 = !DILocation(line: 188, column: 22, scope: !1637)
!2216 = !DILocation(line: 188, column: 3, scope: !1637)
!2217 = distinct !{!2217, !2210, !2218, !258}
!2218 = !DILocation(line: 189, column: 34, scope: !1634)
!2219 = !DILocation(line: 190, column: 1, scope: !1629)
!2220 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !936, file: !936, line: 202, type: !2221, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2221 = !DISubroutineType(types: !2222)
!2222 = !{null, !2223, !1107, !1107}
!2223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !946, size: 32)
!2224 = !DILocalVariable(name: "r", arg: 1, scope: !2220, file: !936, line: 202, type: !2223)
!2225 = !DILocation(line: 0, scope: !2220)
!2226 = !DILocalVariable(name: "a", arg: 2, scope: !2220, file: !936, line: 202, type: !1107)
!2227 = !DILocalVariable(name: "b", arg: 3, scope: !2220, file: !936, line: 202, type: !1107)
!2228 = !DILocalVariable(name: "t", scope: !2220, file: !936, line: 205, type: !946)
!2229 = !DILocation(line: 205, column: 8, scope: !2220)
!2230 = !DILocation(line: 207, column: 3, scope: !2220)
!2231 = !DILocalVariable(name: "i", scope: !2220, file: !936, line: 204, type: !40)
!2232 = !DILocation(line: 208, column: 7, scope: !2233)
!2233 = distinct !DILexicalBlock(scope: !2220, file: !936, line: 208, column: 3)
!2234 = !DILocation(line: 208, scope: !2233)
!2235 = !DILocation(line: 208, column: 12, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2233, file: !936, line: 208, column: 3)
!2237 = !DILocation(line: 208, column: 3, scope: !2233)
!2238 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2239)
!2239 = distinct !DILocation(line: 213, column: 3, scope: !2220)
!2240 = !DILocation(line: 209, column: 34, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2236, file: !936, line: 208, column: 26)
!2242 = !DILocation(line: 209, column: 46, scope: !2241)
!2243 = !DILocation(line: 209, column: 5, scope: !2241)
!2244 = !DILocation(line: 0, scope: !1164, inlinedAt: !2245)
!2245 = distinct !DILocation(line: 210, column: 5, scope: !2241)
!2246 = !DILocation(line: 342, column: 7, scope: !1175, inlinedAt: !2245)
!2247 = !DILocation(line: 342, scope: !1175, inlinedAt: !2245)
!2248 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !2245)
!2249 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !2245)
!2250 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !2245)
!2251 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !2245)
!2252 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !2245)
!2253 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !2245)
!2254 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !2245)
!2255 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !2245)
!2256 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !2245)
!2257 = distinct !{!2257, !2249, !2258, !258}
!2258 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !2245)
!2259 = !DILocation(line: 208, column: 22, scope: !2236)
!2260 = !DILocation(line: 208, column: 3, scope: !2236)
!2261 = distinct !{!2261, !2237, !2262, !258}
!2262 = !DILocation(line: 211, column: 3, scope: !2233)
!2263 = !DILocation(line: 326, scope: !1036, inlinedAt: !2239)
!2264 = !DILocation(line: 0, scope: !1031, inlinedAt: !2239)
!2265 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !2239)
!2266 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !2239)
!2267 = !DILocation(line: 0, scope: !1043, inlinedAt: !2268)
!2268 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !2239)
!2269 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2268)
!2270 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2268)
!2271 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2268)
!2272 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2268)
!2273 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2268)
!2274 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !2239)
!2275 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !2239)
!2276 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !2239)
!2277 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !2239)
!2278 = distinct !{!2278, !2238, !2279, !258}
!2279 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !2239)
!2280 = !DILocation(line: 214, column: 1, scope: !2220)
!2281 = !DILocalVariable(name: "r", arg: 1, scope: !1158, file: !936, line: 225, type: !940)
!2282 = !DILocation(line: 0, scope: !1158)
!2283 = !DILocation(line: 228, column: 7, scope: !1157)
!2284 = !DILocation(line: 228, scope: !1157)
!2285 = !DILocation(line: 228, column: 12, scope: !1197)
!2286 = !DILocation(line: 228, column: 3, scope: !1157)
!2287 = !DILocation(line: 229, column: 18, scope: !1197)
!2288 = !DILocation(line: 0, scope: !1031, inlinedAt: !2289)
!2289 = distinct !DILocation(line: 229, column: 5, scope: !1197)
!2290 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !2289)
!2291 = !DILocation(line: 326, scope: !1036, inlinedAt: !2289)
!2292 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !2289)
!2293 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2289)
!2294 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !2289)
!2295 = !DILocation(line: 0, scope: !1043, inlinedAt: !2296)
!2296 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !2289)
!2297 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2296)
!2298 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2296)
!2299 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2296)
!2300 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2296)
!2301 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2296)
!2302 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !2289)
!2303 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !2289)
!2304 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !2289)
!2305 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !2289)
!2306 = distinct !{!2306, !2293, !2307, !258}
!2307 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !2289)
!2308 = !DILocation(line: 228, column: 22, scope: !1197)
!2309 = !DILocation(line: 228, column: 3, scope: !1197)
!2310 = distinct !{!2310, !2286, !2311, !258}
!2311 = !DILocation(line: 229, column: 27, scope: !1157)
!2312 = !DILocation(line: 230, column: 1, scope: !1158)
!2313 = !DILocation(line: 0, scope: !1104)
!2314 = !DILocation(line: 244, column: 7, scope: !1103)
!2315 = !DILocation(line: 244, scope: !1103)
!2316 = !DILocation(line: 244, column: 12, scope: !1155)
!2317 = !DILocation(line: 244, column: 3, scope: !1103)
!2318 = !DILocation(line: 245, column: 15, scope: !1155)
!2319 = !DILocation(line: 245, column: 27, scope: !1155)
!2320 = !DILocation(line: 245, column: 39, scope: !1155)
!2321 = !DILocation(line: 0, scope: !1164, inlinedAt: !2322)
!2322 = distinct !DILocation(line: 245, column: 5, scope: !1155)
!2323 = !DILocation(line: 342, column: 7, scope: !1175, inlinedAt: !2322)
!2324 = !DILocation(line: 342, scope: !1175, inlinedAt: !2322)
!2325 = !DILocation(line: 342, column: 12, scope: !1178, inlinedAt: !2322)
!2326 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !2322)
!2327 = !DILocation(line: 343, column: 20, scope: !1178, inlinedAt: !2322)
!2328 = !DILocation(line: 343, column: 35, scope: !1178, inlinedAt: !2322)
!2329 = !DILocation(line: 343, column: 33, scope: !1178, inlinedAt: !2322)
!2330 = !DILocation(line: 343, column: 5, scope: !1178, inlinedAt: !2322)
!2331 = !DILocation(line: 343, column: 18, scope: !1178, inlinedAt: !2322)
!2332 = !DILocation(line: 342, column: 22, scope: !1178, inlinedAt: !2322)
!2333 = !DILocation(line: 342, column: 3, scope: !1178, inlinedAt: !2322)
!2334 = distinct !{!2334, !2326, !2335, !258}
!2335 = !DILocation(line: 343, column: 46, scope: !1175, inlinedAt: !2322)
!2336 = !DILocation(line: 244, column: 22, scope: !1155)
!2337 = !DILocation(line: 244, column: 3, scope: !1155)
!2338 = distinct !{!2338, !2317, !2339, !258}
!2339 = !DILocation(line: 245, column: 48, scope: !1103)
!2340 = !DILocation(line: 246, column: 1, scope: !1104)
!2341 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !798, file: !798, line: 19, type: !1921, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2342 = !DILocalVariable(name: "r", arg: 1, scope: !2341, file: !798, line: 19, type: !32)
!2343 = !DILocation(line: 0, scope: !2341)
!2344 = !DILocalVariable(name: "a", arg: 2, scope: !2341, file: !798, line: 19, type: !1167)
!2345 = !DILocalVariable(name: "t", scope: !2341, file: !798, line: 24, type: !2346)
!2346 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !2347)
!2347 = !{!2348}
!2348 = !DISubrange(count: 8)
!2349 = !DILocation(line: 24, column: 11, scope: !2341)
!2350 = !DILocalVariable(name: "i", scope: !2341, file: !798, line: 21, type: !40)
!2351 = !DILocation(line: 28, column: 7, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2341, file: !798, line: 28, column: 3)
!2353 = !DILocation(line: 28, scope: !2352)
!2354 = !DILocation(line: 28, column: 12, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2352, file: !798, line: 28, column: 3)
!2356 = !DILocation(line: 28, column: 3, scope: !2352)
!2357 = !DILocation(line: 29, column: 5, scope: !2358)
!2358 = distinct !DILexicalBlock(scope: !2359, file: !798, line: 29, column: 5)
!2359 = distinct !DILexicalBlock(scope: !2355, file: !798, line: 28, column: 28)
!2360 = !DILocation(line: 29, scope: !2358)
!2361 = !DILocalVariable(name: "j", scope: !2341, file: !798, line: 21, type: !40)
!2362 = !DILocation(line: 29, column: 14, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2358, file: !798, line: 29, column: 5)
!2364 = !DILocation(line: 31, column: 23, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2363, file: !798, line: 29, column: 22)
!2366 = !DILocation(line: 31, column: 25, scope: !2365)
!2367 = !DILocation(line: 31, column: 12, scope: !2365)
!2368 = !DILocalVariable(name: "u", scope: !2341, file: !798, line: 22, type: !61)
!2369 = !DILocation(line: 32, column: 22, scope: !2365)
!2370 = !DILocation(line: 32, column: 9, scope: !2365)
!2371 = !DILocation(line: 34, column: 12, scope: !2365)
!2372 = !DILocalVariable(name: "d0", scope: !2341, file: !798, line: 23, type: !91)
!2373 = !DILocation(line: 36, column: 10, scope: !2365)
!2374 = !DILocation(line: 37, column: 10, scope: !2365)
!2375 = !DILocation(line: 38, column: 14, scope: !2365)
!2376 = !DILocation(line: 38, column: 7, scope: !2365)
!2377 = !DILocation(line: 38, column: 12, scope: !2365)
!2378 = !DILocation(line: 29, column: 18, scope: !2363)
!2379 = !DILocation(line: 29, column: 5, scope: !2363)
!2380 = distinct !{!2380, !2357, !2381, !258}
!2381 = !DILocation(line: 39, column: 5, scope: !2358)
!2382 = !DILocation(line: 41, column: 12, scope: !2359)
!2383 = !DILocation(line: 41, column: 20, scope: !2359)
!2384 = !DILocation(line: 41, column: 25, scope: !2359)
!2385 = !DILocation(line: 41, column: 17, scope: !2359)
!2386 = !DILocation(line: 41, column: 10, scope: !2359)
!2387 = !DILocation(line: 42, column: 12, scope: !2359)
!2388 = !DILocation(line: 42, column: 20, scope: !2359)
!2389 = !DILocation(line: 42, column: 25, scope: !2359)
!2390 = !DILocation(line: 42, column: 17, scope: !2359)
!2391 = !DILocation(line: 42, column: 5, scope: !2359)
!2392 = !DILocation(line: 42, column: 10, scope: !2359)
!2393 = !DILocation(line: 43, column: 12, scope: !2359)
!2394 = !DILocation(line: 43, column: 20, scope: !2359)
!2395 = !DILocation(line: 43, column: 25, scope: !2359)
!2396 = !DILocation(line: 43, column: 17, scope: !2359)
!2397 = !DILocation(line: 43, column: 5, scope: !2359)
!2398 = !DILocation(line: 43, column: 10, scope: !2359)
!2399 = !DILocation(line: 44, column: 12, scope: !2359)
!2400 = !DILocation(line: 44, column: 20, scope: !2359)
!2401 = !DILocation(line: 44, column: 25, scope: !2359)
!2402 = !DILocation(line: 44, column: 17, scope: !2359)
!2403 = !DILocation(line: 44, column: 5, scope: !2359)
!2404 = !DILocation(line: 44, column: 10, scope: !2359)
!2405 = !DILocation(line: 45, column: 7, scope: !2359)
!2406 = !DILocation(line: 28, column: 24, scope: !2355)
!2407 = !DILocation(line: 28, column: 3, scope: !2355)
!2408 = distinct !{!2408, !2356, !2409, !258}
!2409 = !DILocation(line: 46, column: 3, scope: !2352)
!2410 = !DILocation(line: 71, column: 1, scope: !2341)
!2411 = !DILocation(line: 0, scope: !1799)
!2412 = !DILocation(line: 88, column: 7, scope: !1805)
!2413 = !DILocation(line: 88, scope: !1805)
!2414 = !DILocation(line: 88, column: 12, scope: !1808)
!2415 = !DILocation(line: 88, column: 3, scope: !1805)
!2416 = !DILocation(line: 89, column: 37, scope: !1817)
!2417 = !DILocation(line: 89, column: 42, scope: !1817)
!2418 = !DILocation(line: 89, column: 26, scope: !1817)
!2419 = !DILocation(line: 89, column: 47, scope: !1817)
!2420 = !DILocation(line: 89, column: 57, scope: !1817)
!2421 = !DILocation(line: 89, column: 62, scope: !1817)
!2422 = !DILocation(line: 89, column: 24, scope: !1817)
!2423 = !DILocation(line: 89, column: 16, scope: !1817)
!2424 = !DILocation(line: 89, column: 5, scope: !1817)
!2425 = !DILocation(line: 89, column: 22, scope: !1817)
!2426 = !DILocation(line: 90, column: 37, scope: !1817)
!2427 = !DILocation(line: 90, column: 42, scope: !1817)
!2428 = !DILocation(line: 90, column: 26, scope: !1817)
!2429 = !DILocation(line: 90, column: 47, scope: !1817)
!2430 = !DILocation(line: 90, column: 57, scope: !1817)
!2431 = !DILocation(line: 90, column: 62, scope: !1817)
!2432 = !DILocation(line: 90, column: 24, scope: !1817)
!2433 = !DILocation(line: 90, column: 16, scope: !1817)
!2434 = !DILocation(line: 90, column: 18, scope: !1817)
!2435 = !DILocation(line: 90, column: 5, scope: !1817)
!2436 = !DILocation(line: 90, column: 22, scope: !1817)
!2437 = !DILocation(line: 91, column: 7, scope: !1817)
!2438 = !DILocation(line: 88, column: 24, scope: !1808)
!2439 = !DILocation(line: 88, column: 3, scope: !1808)
!2440 = distinct !{!2440, !2415, !2441, !258}
!2441 = !DILocation(line: 92, column: 3, scope: !1805)
!2442 = !DILocation(line: 113, column: 1, scope: !1799)
!2443 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !798, file: !798, line: 124, type: !1921, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2444 = !DILocalVariable(name: "r", arg: 1, scope: !2443, file: !798, line: 124, type: !32)
!2445 = !DILocation(line: 0, scope: !2443)
!2446 = !DILocalVariable(name: "a", arg: 2, scope: !2443, file: !798, line: 124, type: !1167)
!2447 = !DILocalVariable(name: "i", scope: !2443, file: !798, line: 126, type: !40)
!2448 = !DILocation(line: 129, column: 7, scope: !2449)
!2449 = distinct !DILexicalBlock(scope: !2443, file: !798, line: 129, column: 3)
!2450 = !DILocation(line: 129, scope: !2449)
!2451 = !DILocation(line: 129, column: 12, scope: !2452)
!2452 = distinct !DILexicalBlock(scope: !2449, file: !798, line: 129, column: 3)
!2453 = !DILocation(line: 129, column: 3, scope: !2449)
!2454 = !DILocation(line: 131, column: 22, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2452, file: !798, line: 129, column: 28)
!2456 = !DILocation(line: 131, column: 11, scope: !2455)
!2457 = !DILocalVariable(name: "t0", scope: !2443, file: !798, line: 127, type: !86)
!2458 = !DILocation(line: 132, column: 31, scope: !2455)
!2459 = !DILocation(line: 132, column: 8, scope: !2455)
!2460 = !DILocation(line: 133, column: 21, scope: !2455)
!2461 = !DILocation(line: 133, column: 23, scope: !2455)
!2462 = !DILocation(line: 133, column: 10, scope: !2455)
!2463 = !DILocalVariable(name: "t1", scope: !2443, file: !798, line: 127, type: !86)
!2464 = !DILocation(line: 134, column: 31, scope: !2455)
!2465 = !DILocation(line: 134, column: 8, scope: !2455)
!2466 = !DILocation(line: 135, column: 16, scope: !2455)
!2467 = !DILocation(line: 135, column: 8, scope: !2455)
!2468 = !DILocation(line: 135, column: 5, scope: !2455)
!2469 = !DILocation(line: 135, column: 14, scope: !2455)
!2470 = !DILocation(line: 136, column: 20, scope: !2455)
!2471 = !DILocation(line: 136, column: 29, scope: !2455)
!2472 = !DILocation(line: 136, column: 32, scope: !2455)
!2473 = !DILocation(line: 136, column: 26, scope: !2455)
!2474 = !DILocation(line: 136, column: 8, scope: !2455)
!2475 = !DILocation(line: 136, column: 5, scope: !2455)
!2476 = !DILocation(line: 136, column: 14, scope: !2455)
!2477 = !DILocation(line: 137, column: 20, scope: !2455)
!2478 = !DILocation(line: 137, column: 16, scope: !2455)
!2479 = !DILocation(line: 137, column: 8, scope: !2455)
!2480 = !DILocation(line: 137, column: 5, scope: !2455)
!2481 = !DILocation(line: 137, column: 14, scope: !2455)
!2482 = !DILocation(line: 129, column: 24, scope: !2452)
!2483 = !DILocation(line: 129, column: 3, scope: !2452)
!2484 = distinct !{!2484, !2453, !2485, !258}
!2485 = !DILocation(line: 138, column: 3, scope: !2449)
!2486 = !DILocation(line: 139, column: 1, scope: !2443)
!2487 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !798, file: !798, line: 151, type: !1327, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2488 = !DILocalVariable(name: "r", arg: 1, scope: !2487, file: !798, line: 151, type: !801)
!2489 = !DILocation(line: 0, scope: !2487)
!2490 = !DILocalVariable(name: "a", arg: 2, scope: !2487, file: !798, line: 151, type: !160)
!2491 = !DILocalVariable(name: "i", scope: !2487, file: !798, line: 153, type: !40)
!2492 = !DILocation(line: 154, column: 7, scope: !2493)
!2493 = distinct !DILexicalBlock(scope: !2487, file: !798, line: 154, column: 3)
!2494 = !DILocation(line: 154, scope: !2493)
!2495 = !DILocation(line: 154, column: 12, scope: !2496)
!2496 = distinct !DILexicalBlock(scope: !2493, file: !798, line: 154, column: 3)
!2497 = !DILocation(line: 154, column: 3, scope: !2493)
!2498 = !DILocation(line: 155, column: 29, scope: !2499)
!2499 = distinct !DILexicalBlock(scope: !2496, file: !798, line: 154, column: 28)
!2500 = !DILocation(line: 155, column: 26, scope: !2499)
!2501 = !DILocation(line: 155, column: 57, scope: !2499)
!2502 = !DILocation(line: 155, column: 54, scope: !2499)
!2503 = !DILocation(line: 155, column: 44, scope: !2499)
!2504 = !DILocation(line: 155, column: 63, scope: !2499)
!2505 = !DILocation(line: 155, column: 70, scope: !2499)
!2506 = !DILocation(line: 155, column: 16, scope: !2499)
!2507 = !DILocation(line: 155, column: 5, scope: !2499)
!2508 = !DILocation(line: 155, column: 22, scope: !2499)
!2509 = !DILocation(line: 156, column: 29, scope: !2499)
!2510 = !DILocation(line: 156, column: 26, scope: !2499)
!2511 = !DILocation(line: 156, column: 35, scope: !2499)
!2512 = !DILocation(line: 156, column: 57, scope: !2499)
!2513 = !DILocation(line: 156, column: 54, scope: !2499)
!2514 = !DILocation(line: 156, column: 44, scope: !2499)
!2515 = !DILocation(line: 156, column: 63, scope: !2499)
!2516 = !DILocation(line: 156, column: 41, scope: !2499)
!2517 = !DILocation(line: 156, column: 16, scope: !2499)
!2518 = !DILocation(line: 156, column: 18, scope: !2499)
!2519 = !DILocation(line: 156, column: 5, scope: !2499)
!2520 = !DILocation(line: 156, column: 22, scope: !2499)
!2521 = !DILocation(line: 154, column: 24, scope: !2496)
!2522 = !DILocation(line: 154, column: 3, scope: !2496)
!2523 = distinct !{!2523, !2497, !2524, !258}
!2524 = !DILocation(line: 157, column: 3, scope: !2493)
!2525 = !DILocation(line: 158, column: 1, scope: !2487)
!2526 = !DILocation(line: 0, scope: !1326)
!2527 = !DILocation(line: 176, column: 7, scope: !1334)
!2528 = !DILocation(line: 176, scope: !1334)
!2529 = !DILocation(line: 176, column: 12, scope: !1337)
!2530 = !DILocation(line: 176, column: 3, scope: !1334)
!2531 = !DILocation(line: 177, column: 5, scope: !1340)
!2532 = !DILocation(line: 177, scope: !1340)
!2533 = !DILocation(line: 177, column: 14, scope: !1345)
!2534 = !DILocation(line: 178, column: 18, scope: !1347)
!2535 = !DILocation(line: 178, column: 20, scope: !1347)
!2536 = !DILocation(line: 178, column: 7, scope: !1347)
!2537 = !DILocation(line: 178, column: 24, scope: !1347)
!2538 = !DILocation(line: 179, column: 27, scope: !1347)
!2539 = !DILocation(line: 179, column: 31, scope: !1347)
!2540 = !DILocation(line: 179, column: 53, scope: !1347)
!2541 = !DILocation(line: 0, scope: !1355, inlinedAt: !2542)
!2542 = distinct !DILocation(line: 179, column: 7, scope: !1347)
!2543 = !DILocation(line: 74, column: 15, scope: !1355, inlinedAt: !2542)
!2544 = !DILocation(line: 74, column: 11, scope: !1355, inlinedAt: !2542)
!2545 = !DILocation(line: 74, column: 6, scope: !1355, inlinedAt: !2542)
!2546 = !DILocation(line: 177, column: 18, scope: !1345)
!2547 = !DILocation(line: 177, column: 5, scope: !1345)
!2548 = distinct !{!2548, !2531, !2549, !258}
!2549 = !DILocation(line: 180, column: 5, scope: !1340)
!2550 = !DILocation(line: 176, column: 24, scope: !1337)
!2551 = !DILocation(line: 176, column: 3, scope: !1337)
!2552 = distinct !{!2552, !2530, !2553, !258}
!2553 = !DILocation(line: 181, column: 3, scope: !1334)
!2554 = !DILocation(line: 182, column: 1, scope: !1326)
!2555 = !DILocalVariable(name: "msg", arg: 1, scope: !1920, file: !798, line: 192, type: !32)
!2556 = !DILocation(line: 0, scope: !1920)
!2557 = !DILocalVariable(name: "a", arg: 2, scope: !1920, file: !798, line: 192, type: !1167)
!2558 = !DILocation(line: 197, column: 7, scope: !1919)
!2559 = !DILocation(line: 197, scope: !1919)
!2560 = !DILocation(line: 197, column: 12, scope: !1942)
!2561 = !DILocation(line: 197, column: 3, scope: !1919)
!2562 = !DILocation(line: 198, column: 5, scope: !1944)
!2563 = !DILocation(line: 198, column: 12, scope: !1944)
!2564 = !DILocation(line: 199, column: 9, scope: !1948)
!2565 = !DILocation(line: 199, scope: !1948)
!2566 = !DILocation(line: 199, column: 14, scope: !1951)
!2567 = !DILocation(line: 199, column: 5, scope: !1948)
!2568 = !DILocation(line: 200, column: 23, scope: !1954)
!2569 = !DILocation(line: 200, column: 25, scope: !1954)
!2570 = !DILocation(line: 200, column: 12, scope: !1954)
!2571 = !DILocation(line: 205, column: 9, scope: !1954)
!2572 = !DILocation(line: 206, column: 9, scope: !1954)
!2573 = !DILocation(line: 207, column: 9, scope: !1954)
!2574 = !DILocation(line: 208, column: 19, scope: !1954)
!2575 = !DILocation(line: 208, column: 7, scope: !1954)
!2576 = !DILocation(line: 208, column: 14, scope: !1954)
!2577 = !DILocation(line: 199, column: 18, scope: !1951)
!2578 = !DILocation(line: 199, column: 5, scope: !1951)
!2579 = distinct !{!2579, !2567, !2580, !258}
!2580 = !DILocation(line: 209, column: 5, scope: !1948)
!2581 = !DILocation(line: 197, column: 24, scope: !1942)
!2582 = !DILocation(line: 197, column: 3, scope: !1942)
!2583 = distinct !{!2583, !2561, !2584, !258}
!2584 = !DILocation(line: 210, column: 3, scope: !1919)
!2585 = !DILocation(line: 211, column: 1, scope: !1920)
!2586 = !DILocation(line: 0, scope: !797)
!2587 = !DILocation(line: 227, column: 11, scope: !797)
!2588 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !2589)
!2589 = distinct !DILocation(line: 228, column: 3, scope: !797)
!2590 = !DILocation(line: 0, scope: !815, inlinedAt: !2589)
!2591 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !2589)
!2592 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !2589)
!2593 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !2589)
!2594 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !2595)
!2595 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !2596)
!2596 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !2589)
!2597 = !DILocation(line: 0, scope: !834, inlinedAt: !2596)
!2598 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !2596)
!2599 = !DILocation(line: 0, scope: !832, inlinedAt: !2595)
!2600 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !2595)
!2601 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !2595)
!2602 = !DILocation(line: 0, scope: !853, inlinedAt: !2603)
!2603 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !2596)
!2604 = !DILocation(line: 0, scope: !604, inlinedAt: !2605)
!2605 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !2603)
!2606 = !DILocation(line: 0, scope: !861, inlinedAt: !2607)
!2607 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !2596)
!2608 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !2607)
!2609 = !DILocation(line: 0, scope: !868, inlinedAt: !2610)
!2610 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !2607)
!2611 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !2610)
!2612 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !2610)
!2613 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !2610)
!2614 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !2610)
!2615 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !2610)
!2616 = !DILocation(line: 439, scope: !886, inlinedAt: !2610)
!2617 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !2610)
!2618 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !2610)
!2619 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !2610)
!2620 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !2610)
!2621 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !2610)
!2622 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !2610)
!2623 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !2610)
!2624 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !2610)
!2625 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !2610)
!2626 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !2610)
!2627 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !2610)
!2628 = distinct !{!2628, !2619, !2629, !258}
!2629 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !2610)
!2630 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !2610)
!2631 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !2610)
!2632 = distinct !{!2632, !2611, !2633, !258}
!2633 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !2610)
!2634 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !2607)
!2635 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !2607)
!2636 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !2596)
!2637 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !2589)
!2638 = !DILocation(line: 0, scope: !912, inlinedAt: !2639)
!2639 = distinct !DILocation(line: 229, column: 3, scope: !797)
!2640 = !DILocation(line: 113, column: 3, scope: !912, inlinedAt: !2639)
!2641 = !DILocation(line: 230, column: 1, scope: !797)
!2642 = !DILocation(line: 0, scope: !1451)
!2643 = !DILocation(line: 246, column: 11, scope: !1451)
!2644 = !DILocation(line: 47, column: 3, scope: !815, inlinedAt: !2645)
!2645 = distinct !DILocation(line: 247, column: 3, scope: !1451)
!2646 = !DILocation(line: 0, scope: !815, inlinedAt: !2645)
!2647 = !DILocation(line: 45, column: 11, scope: !815, inlinedAt: !2645)
!2648 = !DILocation(line: 48, column: 3, scope: !815, inlinedAt: !2645)
!2649 = !DILocation(line: 48, column: 26, scope: !815, inlinedAt: !2645)
!2650 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !2651)
!2651 = distinct !DILocation(line: 728, column: 3, scope: !834, inlinedAt: !2652)
!2652 = distinct !DILocation(line: 50, column: 3, scope: !815, inlinedAt: !2645)
!2653 = !DILocation(line: 0, scope: !834, inlinedAt: !2652)
!2654 = !DILocation(line: 726, column: 16, scope: !834, inlinedAt: !2652)
!2655 = !DILocation(line: 0, scope: !832, inlinedAt: !2651)
!2656 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !2651)
!2657 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !2651)
!2658 = !DILocation(line: 0, scope: !853, inlinedAt: !2659)
!2659 = distinct !DILocation(line: 730, column: 3, scope: !834, inlinedAt: !2652)
!2660 = !DILocation(line: 0, scope: !604, inlinedAt: !2661)
!2661 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !2659)
!2662 = !DILocation(line: 0, scope: !861, inlinedAt: !2663)
!2663 = distinct !DILocation(line: 733, column: 3, scope: !834, inlinedAt: !2652)
!2664 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !2663)
!2665 = !DILocation(line: 0, scope: !868, inlinedAt: !2666)
!2666 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !2663)
!2667 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !2666)
!2668 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !2666)
!2669 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !2666)
!2670 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !2666)
!2671 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !2666)
!2672 = !DILocation(line: 439, scope: !886, inlinedAt: !2666)
!2673 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !2666)
!2674 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !2666)
!2675 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !2666)
!2676 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !2666)
!2677 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !2666)
!2678 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !2666)
!2679 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !2666)
!2680 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !2666)
!2681 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !2666)
!2682 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !2666)
!2683 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !2666)
!2684 = distinct !{!2684, !2675, !2685, !258}
!2685 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !2666)
!2686 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !2666)
!2687 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !2666)
!2688 = distinct !{!2688, !2667, !2689, !258}
!2689 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !2666)
!2690 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !2663)
!2691 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !2663)
!2692 = !DILocation(line: 734, column: 1, scope: !834, inlinedAt: !2652)
!2693 = !DILocation(line: 51, column: 1, scope: !815, inlinedAt: !2645)
!2694 = !DILocation(line: 0, scope: !1511, inlinedAt: !2695)
!2695 = distinct !DILocation(line: 248, column: 3, scope: !1451)
!2696 = !DILocation(line: 124, column: 3, scope: !1511, inlinedAt: !2695)
!2697 = !DILocation(line: 249, column: 1, scope: !1451)
!2698 = !DILocation(line: 0, scope: !1024)
!2699 = !DILocation(line: 263, column: 3, scope: !1024)
!2700 = !DILocation(line: 0, scope: !1031, inlinedAt: !2701)
!2701 = distinct !DILocation(line: 264, column: 3, scope: !1024)
!2702 = !DILocation(line: 326, column: 7, scope: !1036, inlinedAt: !2701)
!2703 = !DILocation(line: 326, scope: !1036, inlinedAt: !2701)
!2704 = !DILocation(line: 326, column: 12, scope: !1039, inlinedAt: !2701)
!2705 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2701)
!2706 = !DILocation(line: 327, column: 35, scope: !1039, inlinedAt: !2701)
!2707 = !DILocation(line: 0, scope: !1043, inlinedAt: !2708)
!2708 = distinct !DILocation(line: 327, column: 20, scope: !1039, inlinedAt: !2701)
!2709 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2708)
!2710 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2708)
!2711 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2708)
!2712 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2708)
!2713 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2708)
!2714 = !DILocation(line: 327, column: 5, scope: !1039, inlinedAt: !2701)
!2715 = !DILocation(line: 327, column: 18, scope: !1039, inlinedAt: !2701)
!2716 = !DILocation(line: 326, column: 22, scope: !1039, inlinedAt: !2701)
!2717 = !DILocation(line: 326, column: 3, scope: !1039, inlinedAt: !2701)
!2718 = distinct !{!2718, !2705, !2719, !258}
!2719 = !DILocation(line: 327, column: 47, scope: !1036, inlinedAt: !2701)
!2720 = !DILocation(line: 265, column: 1, scope: !1024)
!2721 = !DILocation(line: 0, scope: !1031)
!2722 = !DILocation(line: 326, column: 7, scope: !1036)
!2723 = !DILocation(line: 326, scope: !1036)
!2724 = !DILocation(line: 326, column: 12, scope: !1039)
!2725 = !DILocation(line: 326, column: 3, scope: !1036)
!2726 = !DILocation(line: 327, column: 35, scope: !1039)
!2727 = !DILocation(line: 0, scope: !1043, inlinedAt: !2728)
!2728 = distinct !DILocation(line: 327, column: 20, scope: !1039)
!2729 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2728)
!2730 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2728)
!2731 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2728)
!2732 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2728)
!2733 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2728)
!2734 = !DILocation(line: 327, column: 5, scope: !1039)
!2735 = !DILocation(line: 327, column: 18, scope: !1039)
!2736 = !DILocation(line: 326, column: 22, scope: !1039)
!2737 = !DILocation(line: 326, column: 3, scope: !1039)
!2738 = distinct !{!2738, !2725, !2739, !258}
!2739 = !DILocation(line: 327, column: 47, scope: !1036)
!2740 = !DILocation(line: 328, column: 1, scope: !1031)
!2741 = !DILocation(line: 0, scope: !1641)
!2742 = !DILocation(line: 278, column: 3, scope: !1641)
!2743 = !DILocation(line: 279, column: 1, scope: !1641)
!2744 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !798, file: !798, line: 290, type: !1165, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2745 = !DILocalVariable(name: "r", arg: 1, scope: !2744, file: !798, line: 290, type: !801)
!2746 = !DILocation(line: 0, scope: !2744)
!2747 = !DILocalVariable(name: "a", arg: 2, scope: !2744, file: !798, line: 290, type: !1167)
!2748 = !DILocalVariable(name: "b", arg: 3, scope: !2744, file: !798, line: 290, type: !1167)
!2749 = !DILocalVariable(name: "i", scope: !2744, file: !798, line: 292, type: !40)
!2750 = !DILocation(line: 293, column: 7, scope: !2751)
!2751 = distinct !DILexicalBlock(scope: !2744, file: !798, line: 293, column: 3)
!2752 = !DILocation(line: 293, scope: !2751)
!2753 = !DILocation(line: 293, column: 12, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2751, file: !798, line: 293, column: 3)
!2755 = !DILocation(line: 293, column: 3, scope: !2751)
!2756 = !DILocation(line: 294, column: 25, scope: !2757)
!2757 = distinct !DILexicalBlock(scope: !2754, file: !798, line: 293, column: 28)
!2758 = !DILocation(line: 294, column: 14, scope: !2757)
!2759 = !DILocation(line: 294, column: 42, scope: !2757)
!2760 = !DILocation(line: 294, column: 31, scope: !2757)
!2761 = !DILocation(line: 294, column: 59, scope: !2757)
!2762 = !DILocation(line: 294, column: 48, scope: !2757)
!2763 = !DILocation(line: 294, column: 72, scope: !2757)
!2764 = !DILocation(line: 294, column: 64, scope: !2757)
!2765 = !DILocation(line: 294, column: 5, scope: !2757)
!2766 = !DILocation(line: 295, column: 25, scope: !2757)
!2767 = !DILocation(line: 295, column: 27, scope: !2757)
!2768 = !DILocation(line: 295, column: 14, scope: !2757)
!2769 = !DILocation(line: 295, column: 44, scope: !2757)
!2770 = !DILocation(line: 295, column: 46, scope: !2757)
!2771 = !DILocation(line: 295, column: 33, scope: !2757)
!2772 = !DILocation(line: 295, column: 63, scope: !2757)
!2773 = !DILocation(line: 295, column: 65, scope: !2757)
!2774 = !DILocation(line: 295, column: 52, scope: !2757)
!2775 = !DILocation(line: 295, column: 79, scope: !2757)
!2776 = !DILocation(line: 295, column: 71, scope: !2757)
!2777 = !DILocation(line: 295, column: 70, scope: !2757)
!2778 = !DILocation(line: 295, column: 5, scope: !2757)
!2779 = !DILocation(line: 293, column: 24, scope: !2754)
!2780 = !DILocation(line: 293, column: 3, scope: !2754)
!2781 = distinct !{!2781, !2755, !2782, !258}
!2782 = !DILocation(line: 296, column: 3, scope: !2751)
!2783 = !DILocation(line: 297, column: 1, scope: !2744)
!2784 = !DILocation(line: 0, scope: !1116)
!2785 = !DILocation(line: 311, column: 7, scope: !1122)
!2786 = !DILocation(line: 311, scope: !1122)
!2787 = !DILocation(line: 311, column: 12, scope: !1125)
!2788 = !DILocation(line: 311, column: 3, scope: !1122)
!2789 = !DILocation(line: 312, column: 47, scope: !1125)
!2790 = !DILocation(line: 312, column: 38, scope: !1125)
!2791 = !DILocation(line: 312, column: 59, scope: !1125)
!2792 = !DILocation(line: 0, scope: !1131, inlinedAt: !2793)
!2793 = distinct !DILocation(line: 312, column: 20, scope: !1125)
!2794 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !2793)
!2795 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !2793)
!2796 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !2793)
!2797 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !2793)
!2798 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !2793)
!2799 = !DILocation(line: 312, column: 5, scope: !1125)
!2800 = !DILocation(line: 312, column: 18, scope: !1125)
!2801 = !DILocation(line: 311, column: 22, scope: !1125)
!2802 = !DILocation(line: 311, column: 3, scope: !1125)
!2803 = distinct !{!2803, !2788, !2804, !258}
!2804 = !DILocation(line: 312, column: 61, scope: !1122)
!2805 = !DILocation(line: 313, column: 1, scope: !1116)
!2806 = !DILocation(line: 0, scope: !1164)
!2807 = !DILocation(line: 342, column: 7, scope: !1175)
!2808 = !DILocation(line: 342, scope: !1175)
!2809 = !DILocation(line: 342, column: 12, scope: !1178)
!2810 = !DILocation(line: 342, column: 3, scope: !1175)
!2811 = !DILocation(line: 343, column: 20, scope: !1178)
!2812 = !DILocation(line: 343, column: 35, scope: !1178)
!2813 = !DILocation(line: 343, column: 33, scope: !1178)
!2814 = !DILocation(line: 343, column: 5, scope: !1178)
!2815 = !DILocation(line: 343, column: 18, scope: !1178)
!2816 = !DILocation(line: 342, column: 22, scope: !1178)
!2817 = !DILocation(line: 342, column: 3, scope: !1178)
!2818 = distinct !{!2818, !2810, !2819, !258}
!2819 = !DILocation(line: 343, column: 46, scope: !1175)
!2820 = !DILocation(line: 344, column: 1, scope: !1164)
!2821 = !DILocation(line: 0, scope: !1892)
!2822 = !DILocation(line: 358, column: 7, scope: !1899)
!2823 = !DILocation(line: 358, scope: !1899)
!2824 = !DILocation(line: 358, column: 12, scope: !1902)
!2825 = !DILocation(line: 358, column: 3, scope: !1899)
!2826 = !DILocation(line: 359, column: 20, scope: !1902)
!2827 = !DILocation(line: 359, column: 35, scope: !1902)
!2828 = !DILocation(line: 359, column: 33, scope: !1902)
!2829 = !DILocation(line: 359, column: 5, scope: !1902)
!2830 = !DILocation(line: 359, column: 18, scope: !1902)
!2831 = !DILocation(line: 358, column: 22, scope: !1902)
!2832 = !DILocation(line: 358, column: 3, scope: !1902)
!2833 = distinct !{!2833, !2825, !2834, !258}
!2834 = !DILocation(line: 359, column: 46, scope: !1899)
!2835 = !DILocation(line: 360, column: 1, scope: !1892)
!2836 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !58, file: !58, line: 80, type: !2837, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2837 = !DISubroutineType(types: !2838)
!2838 = !{null, !719}
!2839 = !DILocalVariable(name: "r", arg: 1, scope: !2836, file: !58, line: 80, type: !719)
!2840 = !DILocation(line: 0, scope: !2836)
!2841 = !DILocalVariable(name: "k", scope: !2836, file: !58, line: 81, type: !40)
!2842 = !DILocalVariable(name: "len", scope: !2836, file: !58, line: 81, type: !40)
!2843 = !DILocation(line: 85, column: 7, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2836, file: !58, line: 85, column: 3)
!2845 = !DILocation(line: 85, scope: !2844)
!2846 = !DILocation(line: 84, column: 5, scope: !2836)
!2847 = !DILocation(line: 85, column: 22, scope: !2848)
!2848 = distinct !DILexicalBlock(scope: !2844, file: !58, line: 85, column: 3)
!2849 = !DILocation(line: 85, column: 3, scope: !2844)
!2850 = !DILocation(line: 86, column: 5, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2852, file: !58, line: 86, column: 5)
!2852 = distinct !DILexicalBlock(scope: !2848, file: !58, line: 85, column: 39)
!2853 = !DILocation(line: 86, scope: !2851)
!2854 = !DILocalVariable(name: "start", scope: !2836, file: !58, line: 81, type: !40)
!2855 = !DILocation(line: 86, column: 26, scope: !2856)
!2856 = distinct !DILexicalBlock(scope: !2851, file: !58, line: 86, column: 5)
!2857 = !DILocation(line: 87, column: 14, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2856, file: !58, line: 86, column: 50)
!2859 = !DILocalVariable(name: "zeta", scope: !2836, file: !58, line: 82, type: !61)
!2860 = !DILocalVariable(name: "j", scope: !2836, file: !58, line: 81, type: !40)
!2861 = !DILocation(line: 88, column: 11, scope: !2862)
!2862 = distinct !DILexicalBlock(scope: !2858, file: !58, line: 88, column: 7)
!2863 = !DILocation(line: 88, scope: !2862)
!2864 = !DILocation(line: 88, column: 32, scope: !2865)
!2865 = distinct !DILexicalBlock(scope: !2862, file: !58, line: 88, column: 7)
!2866 = !DILocation(line: 88, column: 24, scope: !2865)
!2867 = !DILocation(line: 88, column: 7, scope: !2862)
!2868 = !DILocation(line: 89, column: 25, scope: !2869)
!2869 = distinct !DILexicalBlock(scope: !2865, file: !58, line: 88, column: 44)
!2870 = !DILocalVariable(name: "a", arg: 1, scope: !2871, file: !58, line: 68, type: !61)
!2871 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !2872, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2872 = !DISubroutineType(types: !2873)
!2873 = !{!61, !61, !61}
!2874 = !DILocation(line: 0, scope: !2871, inlinedAt: !2875)
!2875 = distinct !DILocation(line: 89, column: 13, scope: !2869)
!2876 = !DILocalVariable(name: "b", arg: 2, scope: !2871, file: !58, line: 68, type: !61)
!2877 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !2875)
!2878 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !2875)
!2879 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !2875)
!2880 = !DILocation(line: 0, scope: !1131, inlinedAt: !2881)
!2881 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !2875)
!2882 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !2881)
!2883 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !2881)
!2884 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !2881)
!2885 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !2881)
!2886 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !2881)
!2887 = !DILocalVariable(name: "t", scope: !2836, file: !58, line: 82, type: !61)
!2888 = !DILocation(line: 90, column: 22, scope: !2869)
!2889 = !DILocation(line: 90, column: 27, scope: !2869)
!2890 = !DILocation(line: 90, column: 9, scope: !2869)
!2891 = !DILocation(line: 90, column: 20, scope: !2869)
!2892 = !DILocation(line: 91, column: 16, scope: !2869)
!2893 = !DILocation(line: 91, column: 21, scope: !2869)
!2894 = !DILocation(line: 91, column: 9, scope: !2869)
!2895 = !DILocation(line: 91, column: 14, scope: !2869)
!2896 = !DILocation(line: 88, column: 40, scope: !2865)
!2897 = !DILocation(line: 88, column: 7, scope: !2865)
!2898 = distinct !{!2898, !2867, !2899, !258}
!2899 = !DILocation(line: 92, column: 7, scope: !2862)
!2900 = !DILocation(line: 87, column: 21, scope: !2858)
!2901 = !DILocation(line: 86, column: 43, scope: !2856)
!2902 = !DILocation(line: 86, column: 5, scope: !2856)
!2903 = distinct !{!2903, !2850, !2904, !258}
!2904 = !DILocation(line: 93, column: 5, scope: !2851)
!2905 = !DILocation(line: 85, column: 32, scope: !2848)
!2906 = !DILocation(line: 85, column: 3, scope: !2848)
!2907 = distinct !{!2907, !2849, !2908, !258}
!2908 = !DILocation(line: 94, column: 3, scope: !2844)
!2909 = !DILocation(line: 95, column: 1, scope: !2836)
!2910 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !58, file: !58, line: 106, type: !2837, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2911 = !DILocalVariable(name: "r", arg: 1, scope: !2910, file: !58, line: 106, type: !719)
!2912 = !DILocation(line: 0, scope: !2910)
!2913 = !DILocalVariable(name: "f", scope: !2910, file: !58, line: 109, type: !60)
!2914 = !DILocalVariable(name: "k", scope: !2910, file: !58, line: 107, type: !40)
!2915 = !DILocalVariable(name: "len", scope: !2910, file: !58, line: 107, type: !40)
!2916 = !DILocation(line: 112, column: 7, scope: !2917)
!2917 = distinct !DILexicalBlock(scope: !2910, file: !58, line: 112, column: 3)
!2918 = !DILocation(line: 112, scope: !2917)
!2919 = !DILocation(line: 111, column: 5, scope: !2910)
!2920 = !DILocation(line: 112, column: 20, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2917, file: !58, line: 112, column: 3)
!2922 = !DILocation(line: 112, column: 3, scope: !2917)
!2923 = !DILocation(line: 113, column: 5, scope: !2924)
!2924 = distinct !DILexicalBlock(scope: !2925, file: !58, line: 113, column: 5)
!2925 = distinct !DILexicalBlock(scope: !2921, file: !58, line: 112, column: 39)
!2926 = !DILocation(line: 124, column: 3, scope: !2927)
!2927 = distinct !DILexicalBlock(scope: !2910, file: !58, line: 124, column: 3)
!2928 = !DILocation(line: 113, scope: !2924)
!2929 = !DILocalVariable(name: "start", scope: !2910, file: !58, line: 107, type: !40)
!2930 = !DILocation(line: 113, column: 26, scope: !2931)
!2931 = distinct !DILexicalBlock(scope: !2924, file: !58, line: 113, column: 5)
!2932 = !DILocation(line: 114, column: 14, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2931, file: !58, line: 113, column: 50)
!2934 = !DILocalVariable(name: "zeta", scope: !2910, file: !58, line: 108, type: !61)
!2935 = !DILocalVariable(name: "j", scope: !2910, file: !58, line: 107, type: !40)
!2936 = !DILocation(line: 115, column: 11, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2933, file: !58, line: 115, column: 7)
!2938 = !DILocation(line: 115, scope: !2937)
!2939 = !DILocation(line: 115, column: 32, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2937, file: !58, line: 115, column: 7)
!2941 = !DILocation(line: 115, column: 24, scope: !2940)
!2942 = !DILocation(line: 115, column: 7, scope: !2937)
!2943 = !DILocation(line: 116, column: 13, scope: !2944)
!2944 = distinct !DILexicalBlock(scope: !2940, file: !58, line: 115, column: 44)
!2945 = !DILocalVariable(name: "t", scope: !2910, file: !58, line: 108, type: !61)
!2946 = !DILocation(line: 117, column: 35, scope: !2944)
!2947 = !DILocation(line: 117, column: 33, scope: !2944)
!2948 = !DILocation(line: 0, scope: !1043, inlinedAt: !2949)
!2949 = distinct !DILocation(line: 117, column: 16, scope: !2944)
!2950 = !DILocation(line: 39, column: 20, scope: !1043, inlinedAt: !2949)
!2951 = !DILocation(line: 39, column: 19, scope: !1043, inlinedAt: !2949)
!2952 = !DILocation(line: 39, column: 22, scope: !1043, inlinedAt: !2949)
!2953 = !DILocation(line: 39, column: 33, scope: !1043, inlinedAt: !2949)
!2954 = !DILocation(line: 41, column: 10, scope: !1043, inlinedAt: !2949)
!2955 = !DILocation(line: 117, column: 9, scope: !2944)
!2956 = !DILocation(line: 117, column: 14, scope: !2944)
!2957 = !DILocation(line: 118, column: 22, scope: !2944)
!2958 = !DILocation(line: 118, column: 33, scope: !2944)
!2959 = !DILocation(line: 118, column: 9, scope: !2944)
!2960 = !DILocation(line: 118, column: 20, scope: !2944)
!2961 = !DILocation(line: 119, column: 34, scope: !2944)
!2962 = !DILocation(line: 0, scope: !2871, inlinedAt: !2963)
!2963 = distinct !DILocation(line: 119, column: 22, scope: !2944)
!2964 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !2963)
!2965 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !2963)
!2966 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !2963)
!2967 = !DILocation(line: 0, scope: !1131, inlinedAt: !2968)
!2968 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !2963)
!2969 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !2968)
!2970 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !2968)
!2971 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !2968)
!2972 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !2968)
!2973 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !2968)
!2974 = !DILocation(line: 119, column: 9, scope: !2944)
!2975 = !DILocation(line: 119, column: 20, scope: !2944)
!2976 = !DILocation(line: 115, column: 40, scope: !2940)
!2977 = !DILocation(line: 115, column: 7, scope: !2940)
!2978 = distinct !{!2978, !2942, !2979, !258}
!2979 = !DILocation(line: 120, column: 7, scope: !2937)
!2980 = !DILocation(line: 114, column: 21, scope: !2933)
!2981 = !DILocation(line: 113, column: 43, scope: !2931)
!2982 = !DILocation(line: 113, column: 5, scope: !2931)
!2983 = distinct !{!2983, !2923, !2984, !258}
!2984 = !DILocation(line: 121, column: 5, scope: !2924)
!2985 = !DILocation(line: 112, column: 32, scope: !2921)
!2986 = !DILocation(line: 112, column: 3, scope: !2921)
!2987 = distinct !{!2987, !2922, !2988, !258}
!2988 = !DILocation(line: 122, column: 3, scope: !2917)
!2989 = !DILocation(line: 124, scope: !2927)
!2990 = !DILocation(line: 124, column: 16, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2927, file: !58, line: 124, column: 3)
!2992 = !DILocation(line: 125, column: 18, scope: !2991)
!2993 = !DILocation(line: 0, scope: !2871, inlinedAt: !2994)
!2994 = distinct !DILocation(line: 125, column: 12, scope: !2991)
!2995 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !2994)
!2996 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !2994)
!2997 = !DILocation(line: 0, scope: !1131, inlinedAt: !2998)
!2998 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !2994)
!2999 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !2998)
!3000 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !2998)
!3001 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !2998)
!3002 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !2998)
!3003 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !2998)
!3004 = !DILocation(line: 125, column: 5, scope: !2991)
!3005 = !DILocation(line: 125, column: 10, scope: !2991)
!3006 = !DILocation(line: 124, column: 24, scope: !2991)
!3007 = !DILocation(line: 124, column: 3, scope: !2991)
!3008 = distinct !{!3008, !2926, !3009, !258}
!3009 = !DILocation(line: 125, column: 25, scope: !2927)
!3010 = !DILocation(line: 126, column: 1, scope: !2910)
!3011 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !58, file: !58, line: 139, type: !3012, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3012 = !DISubroutineType(types: !3013)
!3013 = !{null, !719, !3014, !3014, !61}
!3014 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!3015 = !DILocalVariable(name: "r", arg: 1, scope: !3011, file: !58, line: 139, type: !719)
!3016 = !DILocation(line: 0, scope: !3011)
!3017 = !DILocalVariable(name: "a", arg: 2, scope: !3011, file: !58, line: 139, type: !3014)
!3018 = !DILocalVariable(name: "b", arg: 3, scope: !3011, file: !58, line: 139, type: !3014)
!3019 = !DILocalVariable(name: "zeta", arg: 4, scope: !3011, file: !58, line: 139, type: !61)
!3020 = !DILocation(line: 141, column: 17, scope: !3011)
!3021 = !DILocation(line: 141, column: 23, scope: !3011)
!3022 = !DILocation(line: 0, scope: !2871, inlinedAt: !3023)
!3023 = distinct !DILocation(line: 141, column: 11, scope: !3011)
!3024 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !3023)
!3025 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !3023)
!3026 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !3023)
!3027 = !DILocation(line: 0, scope: !1131, inlinedAt: !3028)
!3028 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !3023)
!3029 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !3028)
!3030 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !3028)
!3031 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !3028)
!3032 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !3028)
!3033 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !3028)
!3034 = !DILocation(line: 141, column: 9, scope: !3011)
!3035 = !DILocation(line: 0, scope: !2871, inlinedAt: !3036)
!3036 = distinct !DILocation(line: 142, column: 11, scope: !3011)
!3037 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !3036)
!3038 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !3036)
!3039 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !3036)
!3040 = !DILocation(line: 0, scope: !1131, inlinedAt: !3041)
!3041 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !3036)
!3042 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !3041)
!3043 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !3041)
!3044 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !3041)
!3045 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !3041)
!3046 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !3041)
!3047 = !DILocation(line: 142, column: 9, scope: !3011)
!3048 = !DILocation(line: 143, column: 17, scope: !3011)
!3049 = !DILocation(line: 143, column: 23, scope: !3011)
!3050 = !DILocation(line: 0, scope: !2871, inlinedAt: !3051)
!3051 = distinct !DILocation(line: 143, column: 11, scope: !3011)
!3052 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !3051)
!3053 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !3051)
!3054 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !3051)
!3055 = !DILocation(line: 0, scope: !1131, inlinedAt: !3056)
!3056 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !3051)
!3057 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !3056)
!3058 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !3056)
!3059 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !3056)
!3060 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !3056)
!3061 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !3056)
!3062 = !DILocation(line: 143, column: 8, scope: !3011)
!3063 = !DILocation(line: 144, column: 17, scope: !3011)
!3064 = !DILocation(line: 144, column: 23, scope: !3011)
!3065 = !DILocation(line: 0, scope: !2871, inlinedAt: !3066)
!3066 = distinct !DILocation(line: 144, column: 11, scope: !3011)
!3067 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !3066)
!3068 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !3066)
!3069 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !3066)
!3070 = !DILocation(line: 0, scope: !1131, inlinedAt: !3071)
!3071 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !3066)
!3072 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !3071)
!3073 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !3071)
!3074 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !3071)
!3075 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !3071)
!3076 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !3071)
!3077 = !DILocation(line: 144, column: 3, scope: !3011)
!3078 = !DILocation(line: 144, column: 9, scope: !3011)
!3079 = !DILocation(line: 145, column: 17, scope: !3011)
!3080 = !DILocation(line: 145, column: 23, scope: !3011)
!3081 = !DILocation(line: 0, scope: !2871, inlinedAt: !3082)
!3082 = distinct !DILocation(line: 145, column: 11, scope: !3011)
!3083 = !DILocation(line: 69, column: 28, scope: !2871, inlinedAt: !3082)
!3084 = !DILocation(line: 69, column: 39, scope: !2871, inlinedAt: !3082)
!3085 = !DILocation(line: 69, column: 38, scope: !2871, inlinedAt: !3082)
!3086 = !DILocation(line: 0, scope: !1131, inlinedAt: !3087)
!3087 = distinct !DILocation(line: 69, column: 10, scope: !2871, inlinedAt: !3082)
!3088 = !DILocation(line: 21, column: 12, scope: !1131, inlinedAt: !3087)
!3089 = !DILocation(line: 21, column: 22, scope: !1131, inlinedAt: !3087)
!3090 = !DILocation(line: 21, column: 10, scope: !1131, inlinedAt: !3087)
!3091 = !DILocation(line: 21, column: 32, scope: !1131, inlinedAt: !3087)
!3092 = !DILocation(line: 21, column: 7, scope: !1131, inlinedAt: !3087)
!3093 = !DILocation(line: 145, column: 3, scope: !3011)
!3094 = !DILocation(line: 145, column: 8, scope: !3011)
!3095 = !DILocation(line: 146, column: 1, scope: !3011)
!3096 = !DILocation(line: 0, scope: !912)
!3097 = !DILocation(line: 113, column: 3, scope: !912)
!3098 = !DILocation(line: 119, column: 1, scope: !912)
!3099 = distinct !DISubprogram(name: "cbd2", scope: !913, file: !913, line: 58, type: !914, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3100 = !DILocalVariable(name: "r", arg: 1, scope: !3099, file: !913, line: 58, type: !916)
!3101 = !DILocation(line: 0, scope: !3099)
!3102 = !DILocalVariable(name: "buf", arg: 2, scope: !3099, file: !913, line: 58, type: !160)
!3103 = !DILocalVariable(name: "i", scope: !3099, file: !913, line: 60, type: !40)
!3104 = !DILocation(line: 64, column: 7, scope: !3105)
!3105 = distinct !DILexicalBlock(scope: !3099, file: !913, line: 64, column: 3)
!3106 = !DILocation(line: 64, scope: !3105)
!3107 = !DILocation(line: 64, column: 12, scope: !3108)
!3108 = distinct !DILexicalBlock(scope: !3105, file: !913, line: 64, column: 3)
!3109 = !DILocation(line: 64, column: 3, scope: !3105)
!3110 = !DILocation(line: 65, column: 35, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3108, file: !913, line: 64, column: 28)
!3112 = !DILocation(line: 65, column: 33, scope: !3111)
!3113 = !DILocalVariable(name: "x", arg: 1, scope: !3114, file: !913, line: 15, type: !160)
!3114 = distinct !DISubprogram(name: "load32_littleendian", scope: !913, file: !913, line: 15, type: !3115, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3115 = !DISubroutineType(types: !3116)
!3116 = !{!91, !160}
!3117 = !DILocation(line: 0, scope: !3114, inlinedAt: !3118)
!3118 = distinct !DILocation(line: 65, column: 10, scope: !3111)
!3119 = !DILocation(line: 18, column: 18, scope: !3114, inlinedAt: !3118)
!3120 = !DILocation(line: 18, column: 8, scope: !3114, inlinedAt: !3118)
!3121 = !DILocalVariable(name: "r", scope: !3114, file: !913, line: 17, type: !91)
!3122 = !DILocation(line: 19, column: 18, scope: !3114, inlinedAt: !3118)
!3123 = !DILocation(line: 19, column: 8, scope: !3114, inlinedAt: !3118)
!3124 = !DILocation(line: 19, column: 23, scope: !3114, inlinedAt: !3118)
!3125 = !DILocation(line: 19, column: 5, scope: !3114, inlinedAt: !3118)
!3126 = !DILocation(line: 20, column: 18, scope: !3114, inlinedAt: !3118)
!3127 = !DILocation(line: 20, column: 8, scope: !3114, inlinedAt: !3118)
!3128 = !DILocation(line: 20, column: 23, scope: !3114, inlinedAt: !3118)
!3129 = !DILocation(line: 20, column: 5, scope: !3114, inlinedAt: !3118)
!3130 = !DILocation(line: 21, column: 18, scope: !3114, inlinedAt: !3118)
!3131 = !DILocation(line: 21, column: 8, scope: !3114, inlinedAt: !3118)
!3132 = !DILocation(line: 21, column: 23, scope: !3114, inlinedAt: !3118)
!3133 = !DILocation(line: 21, column: 5, scope: !3114, inlinedAt: !3118)
!3134 = !DILocalVariable(name: "t", scope: !3099, file: !913, line: 61, type: !91)
!3135 = !DILocation(line: 66, column: 12, scope: !3111)
!3136 = !DILocalVariable(name: "d", scope: !3099, file: !913, line: 61, type: !91)
!3137 = !DILocation(line: 67, column: 12, scope: !3111)
!3138 = !DILocation(line: 67, column: 17, scope: !3111)
!3139 = !DILocation(line: 67, column: 7, scope: !3111)
!3140 = !DILocalVariable(name: "j", scope: !3099, file: !913, line: 60, type: !40)
!3141 = !DILocation(line: 69, column: 9, scope: !3142)
!3142 = distinct !DILexicalBlock(scope: !3111, file: !913, line: 69, column: 5)
!3143 = !DILocation(line: 69, scope: !3142)
!3144 = !DILocation(line: 69, column: 14, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !3142, file: !913, line: 69, column: 5)
!3146 = !DILocation(line: 69, column: 5, scope: !3142)
!3147 = !DILocation(line: 70, column: 19, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3145, file: !913, line: 69, column: 22)
!3149 = !DILocation(line: 70, column: 14, scope: !3148)
!3150 = !DILocation(line: 70, column: 11, scope: !3148)
!3151 = !DILocalVariable(name: "a", scope: !3099, file: !913, line: 62, type: !61)
!3152 = !DILocation(line: 71, column: 19, scope: !3148)
!3153 = !DILocation(line: 71, column: 21, scope: !3148)
!3154 = !DILocation(line: 71, column: 14, scope: !3148)
!3155 = !DILocation(line: 71, column: 11, scope: !3148)
!3156 = !DILocalVariable(name: "b", scope: !3099, file: !913, line: 62, type: !61)
!3157 = !DILocation(line: 72, column: 28, scope: !3148)
!3158 = !DILocation(line: 72, column: 26, scope: !3148)
!3159 = !DILocation(line: 72, column: 18, scope: !3148)
!3160 = !DILocation(line: 72, column: 20, scope: !3148)
!3161 = !DILocation(line: 72, column: 7, scope: !3148)
!3162 = !DILocation(line: 72, column: 24, scope: !3148)
!3163 = !DILocation(line: 69, column: 18, scope: !3145)
!3164 = !DILocation(line: 69, column: 5, scope: !3145)
!3165 = distinct !{!3165, !3146, !3166, !258}
!3166 = !DILocation(line: 73, column: 5, scope: !3142)
!3167 = !DILocation(line: 64, column: 24, scope: !3108)
!3168 = !DILocation(line: 64, column: 3, scope: !3108)
!3169 = distinct !{!3169, !3109, !3170, !258}
!3170 = !DILocation(line: 74, column: 3, scope: !3105)
!3171 = !DILocation(line: 75, column: 1, scope: !3099)
!3172 = !DILocation(line: 0, scope: !1511)
!3173 = !DILocation(line: 124, column: 3, scope: !1511)
!3174 = !DILocation(line: 128, column: 1, scope: !1511)
!3175 = !DILocation(line: 0, scope: !1131)
!3176 = !DILocation(line: 21, column: 12, scope: !1131)
!3177 = !DILocation(line: 21, column: 22, scope: !1131)
!3178 = !DILocation(line: 21, column: 10, scope: !1131)
!3179 = !DILocation(line: 21, column: 32, scope: !1131)
!3180 = !DILocation(line: 21, column: 7, scope: !1131)
!3181 = !DILocation(line: 22, column: 3, scope: !1131)
!3182 = !DILocation(line: 0, scope: !1043)
!3183 = !DILocation(line: 39, column: 20, scope: !1043)
!3184 = !DILocation(line: 39, column: 19, scope: !1043)
!3185 = !DILocation(line: 39, column: 22, scope: !1043)
!3186 = !DILocation(line: 39, column: 33, scope: !1043)
!3187 = !DILocation(line: 41, column: 10, scope: !1043)
!3188 = !DILocation(line: 41, column: 3, scope: !1043)
!3189 = !DILocation(line: 0, scope: !417)
!3190 = !DILocation(line: 21, column: 7, scope: !428)
!3191 = !DILocation(line: 21, scope: !428)
!3192 = !DILocation(line: 21, column: 12, scope: !431)
!3193 = !DILocation(line: 21, column: 3, scope: !428)
!3194 = !DILocation(line: 22, column: 10, scope: !431)
!3195 = !DILocation(line: 22, column: 17, scope: !431)
!3196 = !DILocation(line: 22, column: 15, scope: !431)
!3197 = !DILocation(line: 22, column: 7, scope: !431)
!3198 = !DILocation(line: 21, column: 18, scope: !431)
!3199 = !DILocation(line: 21, column: 3, scope: !431)
!3200 = distinct !{!3200, !3193, !3201, !258}
!3201 = !DILocation(line: 22, column: 20, scope: !428)
!3202 = !DILocation(line: 24, column: 25, scope: !417)
!3203 = !DILocation(line: 24, column: 10, scope: !417)
!3204 = !DILocation(line: 24, column: 3, scope: !417)
!3205 = !DILocation(line: 0, scope: !446)
!3206 = !DILocation(line: 51, column: 3, scope: !446)
!3207 = !DILocation(line: 54, column: 7, scope: !446)
!3208 = !DILocation(line: 55, column: 7, scope: !459)
!3209 = !DILocation(line: 55, scope: !459)
!3210 = !DILocation(line: 55, column: 12, scope: !462)
!3211 = !DILocation(line: 55, column: 3, scope: !459)
!3212 = !DILocation(line: 56, column: 18, scope: !462)
!3213 = !DILocation(line: 56, column: 25, scope: !462)
!3214 = !DILocation(line: 56, column: 23, scope: !462)
!3215 = !DILocation(line: 56, column: 15, scope: !462)
!3216 = !DILocation(line: 56, column: 5, scope: !462)
!3217 = !DILocation(line: 56, column: 10, scope: !462)
!3218 = !DILocation(line: 55, column: 18, scope: !462)
!3219 = !DILocation(line: 55, column: 3, scope: !462)
!3220 = distinct !{!3220, !3211, !3221, !258}
!3221 = !DILocation(line: 56, column: 29, scope: !459)
!3222 = !DILocation(line: 57, column: 1, scope: !446)
!3223 = !DILocation(line: 0, scope: !1355)
!3224 = !DILocation(line: 73, column: 7, scope: !1355)
!3225 = !DILocation(line: 74, column: 15, scope: !1355)
!3226 = !DILocation(line: 74, column: 19, scope: !1355)
!3227 = !DILocation(line: 74, column: 11, scope: !1355)
!3228 = !DILocation(line: 74, column: 6, scope: !1355)
!3229 = !DILocation(line: 75, column: 1, scope: !1355)
!3230 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !3231, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3231 = !DISubroutineType(types: !3232)
!3232 = !{null, !566}
!3233 = !DILocalVariable(name: "state", arg: 1, scope: !3230, file: !74, line: 523, type: !566)
!3234 = !DILocation(line: 0, scope: !3230)
!3235 = !DILocalVariable(name: "s", arg: 1, scope: !3236, file: !74, line: 353, type: !607)
!3236 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !3237, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3237 = !DISubroutineType(types: !3238)
!3238 = !{null, !607}
!3239 = !DILocation(line: 0, scope: !3236, inlinedAt: !3240)
!3240 = distinct !DILocation(line: 525, column: 3, scope: !3230)
!3241 = !DILocalVariable(name: "i", scope: !3236, file: !74, line: 355, type: !40)
!3242 = !DILocation(line: 356, column: 7, scope: !3243, inlinedAt: !3240)
!3243 = distinct !DILexicalBlock(scope: !3236, file: !74, line: 356, column: 3)
!3244 = !DILocation(line: 356, scope: !3243, inlinedAt: !3240)
!3245 = !DILocation(line: 356, column: 12, scope: !3246, inlinedAt: !3240)
!3246 = distinct !DILexicalBlock(scope: !3243, file: !74, line: 356, column: 3)
!3247 = !DILocation(line: 356, column: 3, scope: !3243, inlinedAt: !3240)
!3248 = !DILocation(line: 357, column: 5, scope: !3246, inlinedAt: !3240)
!3249 = !DILocation(line: 357, column: 10, scope: !3246, inlinedAt: !3240)
!3250 = !DILocation(line: 356, column: 17, scope: !3246, inlinedAt: !3240)
!3251 = !DILocation(line: 356, column: 3, scope: !3246, inlinedAt: !3240)
!3252 = distinct !{!3252, !3247, !3253, !258}
!3253 = !DILocation(line: 357, column: 12, scope: !3243, inlinedAt: !3240)
!3254 = !DILocation(line: 526, column: 10, scope: !3230)
!3255 = !DILocation(line: 526, column: 14, scope: !3230)
!3256 = !DILocation(line: 527, column: 1, scope: !3230)
!3257 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !564, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3258 = !DILocalVariable(name: "state", arg: 1, scope: !3257, file: !74, line: 538, type: !566)
!3259 = !DILocation(line: 0, scope: !3257)
!3260 = !DILocalVariable(name: "in", arg: 2, scope: !3257, file: !74, line: 538, type: !160)
!3261 = !DILocalVariable(name: "inlen", arg: 3, scope: !3257, file: !74, line: 538, type: !38)
!3262 = !DILocation(line: 540, column: 47, scope: !3257)
!3263 = !DILocation(line: 540, column: 16, scope: !3257)
!3264 = !DILocation(line: 540, column: 10, scope: !3257)
!3265 = !DILocation(line: 540, column: 14, scope: !3257)
!3266 = !DILocation(line: 541, column: 1, scope: !3257)
!3267 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !3268, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3268 = !DISubroutineType(types: !3269)
!3269 = !{!40, !607, !40, !40, !160, !38}
!3270 = !DILocalVariable(name: "s", arg: 1, scope: !3267, file: !74, line: 373, type: !607)
!3271 = !DILocation(line: 0, scope: !3267)
!3272 = !DILocalVariable(name: "pos", arg: 2, scope: !3267, file: !74, line: 374, type: !40)
!3273 = !DILocalVariable(name: "r", arg: 3, scope: !3267, file: !74, line: 375, type: !40)
!3274 = !DILocalVariable(name: "in", arg: 4, scope: !3267, file: !74, line: 376, type: !160)
!3275 = !DILocalVariable(name: "inlen", arg: 5, scope: !3267, file: !74, line: 377, type: !38)
!3276 = !DILocation(line: 381, column: 3, scope: !3267)
!3277 = !DILocation(line: 381, column: 12, scope: !3267)
!3278 = !DILocation(line: 381, column: 19, scope: !3267)
!3279 = !DILocation(line: 382, column: 5, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3281, file: !74, line: 382, column: 5)
!3281 = distinct !DILexicalBlock(scope: !3267, file: !74, line: 381, column: 25)
!3282 = !DILocation(line: 389, column: 3, scope: !3283)
!3283 = distinct !DILexicalBlock(scope: !3267, file: !74, line: 389, column: 3)
!3284 = !DILocation(line: 382, scope: !3280)
!3285 = !DILocalVariable(name: "i", scope: !3267, file: !74, line: 379, type: !40)
!3286 = !DILocation(line: 382, column: 16, scope: !3287)
!3287 = distinct !DILexicalBlock(scope: !3280, file: !74, line: 382, column: 5)
!3288 = !DILocation(line: 383, column: 27, scope: !3287)
!3289 = !DILocation(line: 383, column: 17, scope: !3287)
!3290 = !DILocation(line: 383, column: 37, scope: !3287)
!3291 = !DILocation(line: 383, column: 33, scope: !3287)
!3292 = !DILocation(line: 383, column: 10, scope: !3287)
!3293 = !DILocation(line: 383, column: 7, scope: !3287)
!3294 = !DILocation(line: 383, column: 14, scope: !3287)
!3295 = !DILocation(line: 383, column: 30, scope: !3287)
!3296 = !DILocation(line: 382, column: 20, scope: !3287)
!3297 = !DILocation(line: 382, column: 5, scope: !3287)
!3298 = distinct !{!3298, !3279, !3299, !258}
!3299 = !DILocation(line: 383, column: 42, scope: !3280)
!3300 = !DILocation(line: 384, column: 15, scope: !3281)
!3301 = !DILocation(line: 384, column: 11, scope: !3281)
!3302 = !DILocation(line: 385, column: 5, scope: !3281)
!3303 = distinct !{!3303, !3276, !3304, !258}
!3304 = !DILocation(line: 387, column: 3, scope: !3267)
!3305 = !DILocation(line: 389, scope: !3283)
!3306 = !DILocation(line: 389, column: 18, scope: !3307)
!3307 = distinct !DILexicalBlock(scope: !3283, file: !74, line: 389, column: 3)
!3308 = !DILocation(line: 389, column: 14, scope: !3307)
!3309 = !DILocation(line: 390, column: 25, scope: !3307)
!3310 = !DILocation(line: 390, column: 15, scope: !3307)
!3311 = !DILocation(line: 390, column: 35, scope: !3307)
!3312 = !DILocation(line: 390, column: 31, scope: !3307)
!3313 = !DILocation(line: 390, column: 8, scope: !3307)
!3314 = !DILocation(line: 390, column: 5, scope: !3307)
!3315 = !DILocation(line: 390, column: 12, scope: !3307)
!3316 = !DILocation(line: 390, column: 28, scope: !3307)
!3317 = !DILocation(line: 389, column: 26, scope: !3307)
!3318 = !DILocation(line: 389, column: 3, scope: !3307)
!3319 = distinct !{!3319, !3282, !3320, !258}
!3320 = !DILocation(line: 390, column: 40, scope: !3283)
!3321 = !DILocation(line: 392, column: 3, scope: !3267)
!3322 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !3237, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3323 = !DILocalVariable(name: "state", arg: 1, scope: !3322, file: !74, line: 82, type: !607)
!3324 = !DILocation(line: 0, scope: !3322)
!3325 = !DILocation(line: 100, column: 15, scope: !3322)
!3326 = !DILocalVariable(name: "Aba", scope: !3322, file: !74, line: 86, type: !70)
!3327 = !DILocation(line: 101, column: 15, scope: !3322)
!3328 = !DILocalVariable(name: "Abe", scope: !3322, file: !74, line: 86, type: !70)
!3329 = !DILocation(line: 102, column: 15, scope: !3322)
!3330 = !DILocalVariable(name: "Abi", scope: !3322, file: !74, line: 86, type: !70)
!3331 = !DILocation(line: 103, column: 15, scope: !3322)
!3332 = !DILocalVariable(name: "Abo", scope: !3322, file: !74, line: 86, type: !70)
!3333 = !DILocation(line: 104, column: 15, scope: !3322)
!3334 = !DILocalVariable(name: "Abu", scope: !3322, file: !74, line: 86, type: !70)
!3335 = !DILocation(line: 105, column: 15, scope: !3322)
!3336 = !DILocalVariable(name: "Aga", scope: !3322, file: !74, line: 87, type: !70)
!3337 = !DILocation(line: 106, column: 15, scope: !3322)
!3338 = !DILocalVariable(name: "Age", scope: !3322, file: !74, line: 87, type: !70)
!3339 = !DILocation(line: 107, column: 15, scope: !3322)
!3340 = !DILocalVariable(name: "Agi", scope: !3322, file: !74, line: 87, type: !70)
!3341 = !DILocation(line: 108, column: 15, scope: !3322)
!3342 = !DILocalVariable(name: "Ago", scope: !3322, file: !74, line: 87, type: !70)
!3343 = !DILocation(line: 109, column: 15, scope: !3322)
!3344 = !DILocalVariable(name: "Agu", scope: !3322, file: !74, line: 87, type: !70)
!3345 = !DILocation(line: 110, column: 15, scope: !3322)
!3346 = !DILocalVariable(name: "Aka", scope: !3322, file: !74, line: 88, type: !70)
!3347 = !DILocation(line: 111, column: 15, scope: !3322)
!3348 = !DILocalVariable(name: "Ake", scope: !3322, file: !74, line: 88, type: !70)
!3349 = !DILocation(line: 112, column: 15, scope: !3322)
!3350 = !DILocalVariable(name: "Aki", scope: !3322, file: !74, line: 88, type: !70)
!3351 = !DILocation(line: 113, column: 15, scope: !3322)
!3352 = !DILocalVariable(name: "Ako", scope: !3322, file: !74, line: 88, type: !70)
!3353 = !DILocation(line: 114, column: 15, scope: !3322)
!3354 = !DILocalVariable(name: "Aku", scope: !3322, file: !74, line: 88, type: !70)
!3355 = !DILocation(line: 115, column: 15, scope: !3322)
!3356 = !DILocalVariable(name: "Ama", scope: !3322, file: !74, line: 89, type: !70)
!3357 = !DILocation(line: 116, column: 15, scope: !3322)
!3358 = !DILocalVariable(name: "Ame", scope: !3322, file: !74, line: 89, type: !70)
!3359 = !DILocation(line: 117, column: 15, scope: !3322)
!3360 = !DILocalVariable(name: "Ami", scope: !3322, file: !74, line: 89, type: !70)
!3361 = !DILocation(line: 118, column: 15, scope: !3322)
!3362 = !DILocalVariable(name: "Amo", scope: !3322, file: !74, line: 89, type: !70)
!3363 = !DILocation(line: 119, column: 15, scope: !3322)
!3364 = !DILocalVariable(name: "Amu", scope: !3322, file: !74, line: 89, type: !70)
!3365 = !DILocation(line: 120, column: 15, scope: !3322)
!3366 = !DILocalVariable(name: "Asa", scope: !3322, file: !74, line: 90, type: !70)
!3367 = !DILocation(line: 121, column: 15, scope: !3322)
!3368 = !DILocalVariable(name: "Ase", scope: !3322, file: !74, line: 90, type: !70)
!3369 = !DILocation(line: 122, column: 15, scope: !3322)
!3370 = !DILocalVariable(name: "Asi", scope: !3322, file: !74, line: 90, type: !70)
!3371 = !DILocation(line: 123, column: 15, scope: !3322)
!3372 = !DILocalVariable(name: "Aso", scope: !3322, file: !74, line: 90, type: !70)
!3373 = !DILocation(line: 124, column: 15, scope: !3322)
!3374 = !DILocalVariable(name: "Asu", scope: !3322, file: !74, line: 90, type: !70)
!3375 = !DILocalVariable(name: "round", scope: !3322, file: !74, line: 84, type: !50)
!3376 = !DILocation(line: 126, column: 13, scope: !3377)
!3377 = distinct !DILexicalBlock(scope: !3322, file: !74, line: 126, column: 9)
!3378 = !DILocation(line: 126, scope: !3377)
!3379 = !DILocation(line: 126, column: 30, scope: !3380)
!3380 = distinct !DILexicalBlock(scope: !3377, file: !74, line: 126, column: 9)
!3381 = !DILocation(line: 126, column: 9, scope: !3377)
!3382 = !DILocalVariable(name: "BCa", scope: !3322, file: !74, line: 91, type: !70)
!3383 = !DILocalVariable(name: "BCe", scope: !3322, file: !74, line: 91, type: !70)
!3384 = !DILocalVariable(name: "BCi", scope: !3322, file: !74, line: 91, type: !70)
!3385 = !DILocalVariable(name: "BCo", scope: !3322, file: !74, line: 91, type: !70)
!3386 = !DILocalVariable(name: "BCu", scope: !3322, file: !74, line: 91, type: !70)
!3387 = !DILocalVariable(name: "Da", scope: !3322, file: !74, line: 92, type: !70)
!3388 = !DILocalVariable(name: "De", scope: !3322, file: !74, line: 92, type: !70)
!3389 = !DILocalVariable(name: "Di", scope: !3322, file: !74, line: 92, type: !70)
!3390 = !DILocalVariable(name: "Do", scope: !3322, file: !74, line: 92, type: !70)
!3391 = !DILocalVariable(name: "Du", scope: !3322, file: !74, line: 92, type: !70)
!3392 = !DILocalVariable(name: "Eba", scope: !3322, file: !74, line: 93, type: !70)
!3393 = !DILocalVariable(name: "Ebe", scope: !3322, file: !74, line: 93, type: !70)
!3394 = !DILocalVariable(name: "Ebi", scope: !3322, file: !74, line: 93, type: !70)
!3395 = !DILocalVariable(name: "Ebo", scope: !3322, file: !74, line: 93, type: !70)
!3396 = !DILocalVariable(name: "Ebu", scope: !3322, file: !74, line: 93, type: !70)
!3397 = !DILocalVariable(name: "Ega", scope: !3322, file: !74, line: 94, type: !70)
!3398 = !DILocalVariable(name: "Ege", scope: !3322, file: !74, line: 94, type: !70)
!3399 = !DILocalVariable(name: "Egi", scope: !3322, file: !74, line: 94, type: !70)
!3400 = !DILocalVariable(name: "Ego", scope: !3322, file: !74, line: 94, type: !70)
!3401 = !DILocalVariable(name: "Egu", scope: !3322, file: !74, line: 94, type: !70)
!3402 = !DILocalVariable(name: "Eka", scope: !3322, file: !74, line: 95, type: !70)
!3403 = !DILocalVariable(name: "Eke", scope: !3322, file: !74, line: 95, type: !70)
!3404 = !DILocalVariable(name: "Eki", scope: !3322, file: !74, line: 95, type: !70)
!3405 = !DILocalVariable(name: "Eko", scope: !3322, file: !74, line: 95, type: !70)
!3406 = !DILocalVariable(name: "Eku", scope: !3322, file: !74, line: 95, type: !70)
!3407 = !DILocalVariable(name: "Ema", scope: !3322, file: !74, line: 96, type: !70)
!3408 = !DILocalVariable(name: "Eme", scope: !3322, file: !74, line: 96, type: !70)
!3409 = !DILocalVariable(name: "Emi", scope: !3322, file: !74, line: 96, type: !70)
!3410 = !DILocalVariable(name: "Emo", scope: !3322, file: !74, line: 96, type: !70)
!3411 = !DILocalVariable(name: "Emu", scope: !3322, file: !74, line: 96, type: !70)
!3412 = !DILocalVariable(name: "Esa", scope: !3322, file: !74, line: 97, type: !70)
!3413 = !DILocalVariable(name: "Ese", scope: !3322, file: !74, line: 97, type: !70)
!3414 = !DILocalVariable(name: "Esi", scope: !3322, file: !74, line: 97, type: !70)
!3415 = !DILocalVariable(name: "Eso", scope: !3322, file: !74, line: 97, type: !70)
!3416 = !DILocalVariable(name: "Esu", scope: !3322, file: !74, line: 97, type: !70)
!3417 = !DILocation(line: 130, column: 22, scope: !3418)
!3418 = distinct !DILexicalBlock(scope: !3380, file: !74, line: 126, column: 53)
!3419 = !DILocation(line: 130, column: 26, scope: !3418)
!3420 = !DILocation(line: 130, column: 30, scope: !3418)
!3421 = !DILocation(line: 130, column: 34, scope: !3418)
!3422 = !DILocation(line: 132, column: 22, scope: !3418)
!3423 = !DILocation(line: 132, column: 26, scope: !3418)
!3424 = !DILocation(line: 132, column: 30, scope: !3418)
!3425 = !DILocation(line: 132, column: 34, scope: !3418)
!3426 = !DILocation(line: 138, column: 22, scope: !3418)
!3427 = !DILocation(line: 138, column: 21, scope: !3418)
!3428 = !DILocation(line: 208, column: 17, scope: !3418)
!3429 = !DILocation(line: 209, column: 19, scope: !3418)
!3430 = !DILocation(line: 129, column: 22, scope: !3418)
!3431 = !DILocation(line: 129, column: 26, scope: !3418)
!3432 = !DILocation(line: 129, column: 30, scope: !3418)
!3433 = !DILocation(line: 129, column: 34, scope: !3418)
!3434 = !DILocation(line: 135, column: 22, scope: !3418)
!3435 = !DILocation(line: 135, column: 21, scope: !3418)
!3436 = !DILocation(line: 212, column: 17, scope: !3418)
!3437 = !DILocation(line: 213, column: 19, scope: !3418)
!3438 = !DILocation(line: 131, column: 22, scope: !3418)
!3439 = !DILocation(line: 131, column: 26, scope: !3418)
!3440 = !DILocation(line: 131, column: 30, scope: !3418)
!3441 = !DILocation(line: 131, column: 34, scope: !3418)
!3442 = !DILocation(line: 128, column: 22, scope: !3418)
!3443 = !DILocation(line: 128, column: 26, scope: !3418)
!3444 = !DILocation(line: 128, column: 30, scope: !3418)
!3445 = !DILocation(line: 128, column: 34, scope: !3418)
!3446 = !DILocation(line: 139, column: 22, scope: !3418)
!3447 = !DILocation(line: 139, column: 21, scope: !3418)
!3448 = !DILocation(line: 210, column: 17, scope: !3418)
!3449 = !DILocation(line: 211, column: 19, scope: !3418)
!3450 = !DILocation(line: 217, column: 28, scope: !3418)
!3451 = !DILocation(line: 217, column: 33, scope: !3418)
!3452 = !DILocation(line: 217, column: 25, scope: !3418)
!3453 = !DILocation(line: 137, column: 22, scope: !3418)
!3454 = !DILocation(line: 137, column: 21, scope: !3418)
!3455 = !DILocation(line: 145, column: 17, scope: !3418)
!3456 = !DILocation(line: 146, column: 19, scope: !3418)
!3457 = !DILocation(line: 136, column: 22, scope: !3418)
!3458 = !DILocation(line: 136, column: 21, scope: !3418)
!3459 = !DILocation(line: 143, column: 17, scope: !3418)
!3460 = !DILocation(line: 144, column: 19, scope: !3418)
!3461 = !DILocation(line: 151, column: 28, scope: !3418)
!3462 = !DILocation(line: 151, column: 33, scope: !3418)
!3463 = !DILocation(line: 152, column: 30, scope: !3418)
!3464 = !DILocation(line: 152, column: 17, scope: !3418)
!3465 = !DILocation(line: 141, column: 17, scope: !3418)
!3466 = !DILocation(line: 158, column: 17, scope: !3418)
!3467 = !DILocation(line: 159, column: 19, scope: !3418)
!3468 = !DILocation(line: 162, column: 17, scope: !3418)
!3469 = !DILocation(line: 163, column: 19, scope: !3418)
!3470 = !DILocation(line: 160, column: 17, scope: !3418)
!3471 = !DILocation(line: 161, column: 19, scope: !3418)
!3472 = !DILocation(line: 168, column: 28, scope: !3418)
!3473 = !DILocation(line: 168, column: 33, scope: !3418)
!3474 = !DILocation(line: 168, column: 25, scope: !3418)
!3475 = !DILocation(line: 223, column: 22, scope: !3418)
!3476 = !DILocation(line: 174, column: 17, scope: !3418)
!3477 = !DILocation(line: 175, column: 19, scope: !3418)
!3478 = !DILocation(line: 178, column: 17, scope: !3418)
!3479 = !DILocation(line: 179, column: 19, scope: !3418)
!3480 = !DILocation(line: 176, column: 17, scope: !3418)
!3481 = !DILocation(line: 177, column: 19, scope: !3418)
!3482 = !DILocation(line: 184, column: 28, scope: !3418)
!3483 = !DILocation(line: 184, column: 33, scope: !3418)
!3484 = !DILocation(line: 184, column: 25, scope: !3418)
!3485 = !DILocation(line: 223, column: 26, scope: !3418)
!3486 = !DILocation(line: 190, column: 17, scope: !3418)
!3487 = !DILocation(line: 191, column: 19, scope: !3418)
!3488 = !DILocation(line: 194, column: 17, scope: !3418)
!3489 = !DILocation(line: 195, column: 19, scope: !3418)
!3490 = !DILocation(line: 192, column: 17, scope: !3418)
!3491 = !DILocation(line: 193, column: 19, scope: !3418)
!3492 = !DILocation(line: 200, column: 28, scope: !3418)
!3493 = !DILocation(line: 200, column: 33, scope: !3418)
!3494 = !DILocation(line: 200, column: 25, scope: !3418)
!3495 = !DILocation(line: 223, column: 30, scope: !3418)
!3496 = !DILocation(line: 206, column: 17, scope: !3418)
!3497 = !DILocation(line: 207, column: 19, scope: !3418)
!3498 = !DILocation(line: 216, column: 28, scope: !3418)
!3499 = !DILocation(line: 216, column: 33, scope: !3418)
!3500 = !DILocation(line: 216, column: 25, scope: !3418)
!3501 = !DILocation(line: 223, column: 34, scope: !3418)
!3502 = !DILocation(line: 149, column: 17, scope: !3418)
!3503 = !DILocation(line: 150, column: 19, scope: !3418)
!3504 = !DILocation(line: 147, column: 17, scope: !3418)
!3505 = !DILocation(line: 148, column: 19, scope: !3418)
!3506 = !DILocation(line: 154, column: 28, scope: !3418)
!3507 = !DILocation(line: 154, column: 33, scope: !3418)
!3508 = !DILocation(line: 154, column: 25, scope: !3418)
!3509 = !DILocation(line: 166, column: 17, scope: !3418)
!3510 = !DILocation(line: 167, column: 19, scope: !3418)
!3511 = !DILocation(line: 164, column: 17, scope: !3418)
!3512 = !DILocation(line: 165, column: 19, scope: !3418)
!3513 = !DILocation(line: 170, column: 28, scope: !3418)
!3514 = !DILocation(line: 170, column: 33, scope: !3418)
!3515 = !DILocation(line: 170, column: 25, scope: !3418)
!3516 = !DILocation(line: 225, column: 22, scope: !3418)
!3517 = !DILocation(line: 182, column: 17, scope: !3418)
!3518 = !DILocation(line: 183, column: 19, scope: !3418)
!3519 = !DILocation(line: 180, column: 17, scope: !3418)
!3520 = !DILocation(line: 181, column: 19, scope: !3418)
!3521 = !DILocation(line: 186, column: 28, scope: !3418)
!3522 = !DILocation(line: 186, column: 33, scope: !3418)
!3523 = !DILocation(line: 186, column: 25, scope: !3418)
!3524 = !DILocation(line: 225, column: 26, scope: !3418)
!3525 = !DILocation(line: 198, column: 17, scope: !3418)
!3526 = !DILocation(line: 199, column: 19, scope: !3418)
!3527 = !DILocation(line: 196, column: 17, scope: !3418)
!3528 = !DILocation(line: 197, column: 19, scope: !3418)
!3529 = !DILocation(line: 202, column: 28, scope: !3418)
!3530 = !DILocation(line: 202, column: 33, scope: !3418)
!3531 = !DILocation(line: 202, column: 25, scope: !3418)
!3532 = !DILocation(line: 225, column: 30, scope: !3418)
!3533 = !DILocation(line: 214, column: 17, scope: !3418)
!3534 = !DILocation(line: 215, column: 19, scope: !3418)
!3535 = !DILocation(line: 218, column: 28, scope: !3418)
!3536 = !DILocation(line: 218, column: 33, scope: !3418)
!3537 = !DILocation(line: 218, column: 25, scope: !3418)
!3538 = !DILocation(line: 225, column: 34, scope: !3418)
!3539 = !DILocation(line: 231, column: 22, scope: !3418)
!3540 = !DILocation(line: 231, column: 21, scope: !3418)
!3541 = !DILocation(line: 309, column: 17, scope: !3418)
!3542 = !DILocation(line: 310, column: 19, scope: !3418)
!3543 = !DILocation(line: 171, column: 28, scope: !3418)
!3544 = !DILocation(line: 171, column: 33, scope: !3418)
!3545 = !DILocation(line: 171, column: 25, scope: !3418)
!3546 = !DILocation(line: 156, column: 28, scope: !3418)
!3547 = !DILocation(line: 156, column: 33, scope: !3418)
!3548 = !DILocation(line: 156, column: 25, scope: !3418)
!3549 = !DILocation(line: 172, column: 28, scope: !3418)
!3550 = !DILocation(line: 172, column: 33, scope: !3418)
!3551 = !DILocation(line: 172, column: 25, scope: !3418)
!3552 = !DILocation(line: 227, column: 22, scope: !3418)
!3553 = !DILocation(line: 188, column: 28, scope: !3418)
!3554 = !DILocation(line: 188, column: 33, scope: !3418)
!3555 = !DILocation(line: 188, column: 25, scope: !3418)
!3556 = !DILocation(line: 227, column: 26, scope: !3418)
!3557 = !DILocation(line: 204, column: 28, scope: !3418)
!3558 = !DILocation(line: 204, column: 33, scope: !3418)
!3559 = !DILocation(line: 204, column: 25, scope: !3418)
!3560 = !DILocation(line: 227, column: 30, scope: !3418)
!3561 = !DILocation(line: 220, column: 28, scope: !3418)
!3562 = !DILocation(line: 220, column: 33, scope: !3418)
!3563 = !DILocation(line: 220, column: 25, scope: !3418)
!3564 = !DILocation(line: 227, column: 34, scope: !3418)
!3565 = !DILocation(line: 233, column: 22, scope: !3418)
!3566 = !DILocation(line: 233, column: 21, scope: !3418)
!3567 = !DILocation(line: 303, column: 17, scope: !3418)
!3568 = !DILocation(line: 304, column: 19, scope: !3418)
!3569 = !DILocation(line: 153, column: 28, scope: !3418)
!3570 = !DILocation(line: 153, column: 33, scope: !3418)
!3571 = !DILocation(line: 153, column: 25, scope: !3418)
!3572 = !DILocation(line: 169, column: 28, scope: !3418)
!3573 = !DILocation(line: 169, column: 33, scope: !3418)
!3574 = !DILocation(line: 169, column: 25, scope: !3418)
!3575 = !DILocation(line: 224, column: 22, scope: !3418)
!3576 = !DILocation(line: 185, column: 28, scope: !3418)
!3577 = !DILocation(line: 185, column: 33, scope: !3418)
!3578 = !DILocation(line: 185, column: 25, scope: !3418)
!3579 = !DILocation(line: 224, column: 26, scope: !3418)
!3580 = !DILocation(line: 201, column: 28, scope: !3418)
!3581 = !DILocation(line: 201, column: 33, scope: !3418)
!3582 = !DILocation(line: 201, column: 25, scope: !3418)
!3583 = !DILocation(line: 224, column: 30, scope: !3418)
!3584 = !DILocation(line: 224, column: 34, scope: !3418)
!3585 = !DILocation(line: 155, column: 28, scope: !3418)
!3586 = !DILocation(line: 155, column: 33, scope: !3418)
!3587 = !DILocation(line: 155, column: 25, scope: !3418)
!3588 = !DILocation(line: 226, column: 22, scope: !3418)
!3589 = !DILocation(line: 187, column: 28, scope: !3418)
!3590 = !DILocation(line: 187, column: 33, scope: !3418)
!3591 = !DILocation(line: 187, column: 25, scope: !3418)
!3592 = !DILocation(line: 226, column: 26, scope: !3418)
!3593 = !DILocation(line: 203, column: 28, scope: !3418)
!3594 = !DILocation(line: 203, column: 33, scope: !3418)
!3595 = !DILocation(line: 203, column: 25, scope: !3418)
!3596 = !DILocation(line: 226, column: 30, scope: !3418)
!3597 = !DILocation(line: 219, column: 28, scope: !3418)
!3598 = !DILocation(line: 219, column: 33, scope: !3418)
!3599 = !DILocation(line: 219, column: 25, scope: !3418)
!3600 = !DILocation(line: 226, column: 34, scope: !3418)
!3601 = !DILocation(line: 232, column: 22, scope: !3418)
!3602 = !DILocation(line: 232, column: 21, scope: !3418)
!3603 = !DILocation(line: 301, column: 17, scope: !3418)
!3604 = !DILocation(line: 302, column: 19, scope: !3418)
!3605 = !DILocation(line: 315, column: 28, scope: !3418)
!3606 = !DILocation(line: 315, column: 33, scope: !3418)
!3607 = !DILocation(line: 315, column: 25, scope: !3418)
!3608 = !DILocation(line: 230, column: 22, scope: !3418)
!3609 = !DILocation(line: 230, column: 21, scope: !3418)
!3610 = !DILocation(line: 307, column: 17, scope: !3418)
!3611 = !DILocation(line: 308, column: 19, scope: !3418)
!3612 = !DILocation(line: 314, column: 28, scope: !3418)
!3613 = !DILocation(line: 314, column: 33, scope: !3418)
!3614 = !DILocation(line: 314, column: 25, scope: !3418)
!3615 = !DILocation(line: 234, column: 22, scope: !3418)
!3616 = !DILocation(line: 234, column: 21, scope: !3418)
!3617 = !DILocation(line: 305, column: 17, scope: !3418)
!3618 = !DILocation(line: 306, column: 19, scope: !3418)
!3619 = !DILocation(line: 313, column: 28, scope: !3418)
!3620 = !DILocation(line: 313, column: 33, scope: !3418)
!3621 = !DILocation(line: 313, column: 25, scope: !3418)
!3622 = !DILocation(line: 312, column: 28, scope: !3418)
!3623 = !DILocation(line: 312, column: 33, scope: !3418)
!3624 = !DILocation(line: 312, column: 25, scope: !3418)
!3625 = !DILocation(line: 311, column: 28, scope: !3418)
!3626 = !DILocation(line: 311, column: 33, scope: !3418)
!3627 = !DILocation(line: 311, column: 25, scope: !3418)
!3628 = !DILocation(line: 293, column: 17, scope: !3418)
!3629 = !DILocation(line: 294, column: 19, scope: !3418)
!3630 = !DILocation(line: 287, column: 17, scope: !3418)
!3631 = !DILocation(line: 288, column: 19, scope: !3418)
!3632 = !DILocation(line: 285, column: 17, scope: !3418)
!3633 = !DILocation(line: 286, column: 19, scope: !3418)
!3634 = !DILocation(line: 299, column: 28, scope: !3418)
!3635 = !DILocation(line: 299, column: 33, scope: !3418)
!3636 = !DILocation(line: 299, column: 25, scope: !3418)
!3637 = !DILocation(line: 291, column: 17, scope: !3418)
!3638 = !DILocation(line: 292, column: 19, scope: !3418)
!3639 = !DILocation(line: 298, column: 28, scope: !3418)
!3640 = !DILocation(line: 298, column: 33, scope: !3418)
!3641 = !DILocation(line: 298, column: 25, scope: !3418)
!3642 = !DILocation(line: 289, column: 17, scope: !3418)
!3643 = !DILocation(line: 290, column: 19, scope: !3418)
!3644 = !DILocation(line: 297, column: 28, scope: !3418)
!3645 = !DILocation(line: 297, column: 33, scope: !3418)
!3646 = !DILocation(line: 297, column: 25, scope: !3418)
!3647 = !DILocation(line: 296, column: 28, scope: !3418)
!3648 = !DILocation(line: 296, column: 33, scope: !3418)
!3649 = !DILocation(line: 296, column: 25, scope: !3418)
!3650 = !DILocation(line: 295, column: 28, scope: !3418)
!3651 = !DILocation(line: 295, column: 33, scope: !3418)
!3652 = !DILocation(line: 295, column: 25, scope: !3418)
!3653 = !DILocation(line: 277, column: 17, scope: !3418)
!3654 = !DILocation(line: 278, column: 19, scope: !3418)
!3655 = !DILocation(line: 271, column: 17, scope: !3418)
!3656 = !DILocation(line: 272, column: 19, scope: !3418)
!3657 = !DILocation(line: 269, column: 17, scope: !3418)
!3658 = !DILocation(line: 270, column: 19, scope: !3418)
!3659 = !DILocation(line: 283, column: 28, scope: !3418)
!3660 = !DILocation(line: 283, column: 33, scope: !3418)
!3661 = !DILocation(line: 283, column: 25, scope: !3418)
!3662 = !DILocation(line: 275, column: 17, scope: !3418)
!3663 = !DILocation(line: 276, column: 19, scope: !3418)
!3664 = !DILocation(line: 282, column: 28, scope: !3418)
!3665 = !DILocation(line: 282, column: 33, scope: !3418)
!3666 = !DILocation(line: 282, column: 25, scope: !3418)
!3667 = !DILocation(line: 273, column: 17, scope: !3418)
!3668 = !DILocation(line: 274, column: 19, scope: !3418)
!3669 = !DILocation(line: 281, column: 28, scope: !3418)
!3670 = !DILocation(line: 281, column: 33, scope: !3418)
!3671 = !DILocation(line: 281, column: 25, scope: !3418)
!3672 = !DILocation(line: 280, column: 28, scope: !3418)
!3673 = !DILocation(line: 280, column: 33, scope: !3418)
!3674 = !DILocation(line: 280, column: 25, scope: !3418)
!3675 = !DILocation(line: 279, column: 28, scope: !3418)
!3676 = !DILocation(line: 279, column: 33, scope: !3418)
!3677 = !DILocation(line: 279, column: 25, scope: !3418)
!3678 = !DILocation(line: 261, column: 17, scope: !3418)
!3679 = !DILocation(line: 262, column: 19, scope: !3418)
!3680 = !DILocation(line: 255, column: 17, scope: !3418)
!3681 = !DILocation(line: 256, column: 19, scope: !3418)
!3682 = !DILocation(line: 253, column: 17, scope: !3418)
!3683 = !DILocation(line: 254, column: 19, scope: !3418)
!3684 = !DILocation(line: 267, column: 28, scope: !3418)
!3685 = !DILocation(line: 267, column: 33, scope: !3418)
!3686 = !DILocation(line: 267, column: 25, scope: !3418)
!3687 = !DILocation(line: 259, column: 17, scope: !3418)
!3688 = !DILocation(line: 260, column: 19, scope: !3418)
!3689 = !DILocation(line: 266, column: 28, scope: !3418)
!3690 = !DILocation(line: 266, column: 33, scope: !3418)
!3691 = !DILocation(line: 266, column: 25, scope: !3418)
!3692 = !DILocation(line: 257, column: 17, scope: !3418)
!3693 = !DILocation(line: 258, column: 19, scope: !3418)
!3694 = !DILocation(line: 265, column: 28, scope: !3418)
!3695 = !DILocation(line: 265, column: 33, scope: !3418)
!3696 = !DILocation(line: 265, column: 25, scope: !3418)
!3697 = !DILocation(line: 264, column: 28, scope: !3418)
!3698 = !DILocation(line: 264, column: 33, scope: !3418)
!3699 = !DILocation(line: 264, column: 25, scope: !3418)
!3700 = !DILocation(line: 263, column: 28, scope: !3418)
!3701 = !DILocation(line: 263, column: 33, scope: !3418)
!3702 = !DILocation(line: 263, column: 25, scope: !3418)
!3703 = !DILocation(line: 244, column: 17, scope: !3418)
!3704 = !DILocation(line: 245, column: 19, scope: !3418)
!3705 = !DILocation(line: 238, column: 17, scope: !3418)
!3706 = !DILocation(line: 239, column: 19, scope: !3418)
!3707 = !DILocation(line: 236, column: 17, scope: !3418)
!3708 = !DILocation(line: 251, column: 28, scope: !3418)
!3709 = !DILocation(line: 251, column: 33, scope: !3418)
!3710 = !DILocation(line: 251, column: 25, scope: !3418)
!3711 = !DILocation(line: 242, column: 17, scope: !3418)
!3712 = !DILocation(line: 243, column: 19, scope: !3418)
!3713 = !DILocation(line: 250, column: 28, scope: !3418)
!3714 = !DILocation(line: 250, column: 33, scope: !3418)
!3715 = !DILocation(line: 250, column: 25, scope: !3418)
!3716 = !DILocation(line: 240, column: 17, scope: !3418)
!3717 = !DILocation(line: 241, column: 19, scope: !3418)
!3718 = !DILocation(line: 249, column: 28, scope: !3418)
!3719 = !DILocation(line: 249, column: 33, scope: !3418)
!3720 = !DILocation(line: 249, column: 25, scope: !3418)
!3721 = !DILocation(line: 248, column: 28, scope: !3418)
!3722 = !DILocation(line: 248, column: 33, scope: !3418)
!3723 = !DILocation(line: 248, column: 25, scope: !3418)
!3724 = !DILocation(line: 247, column: 58, scope: !3418)
!3725 = !DILocation(line: 247, column: 30, scope: !3418)
!3726 = !DILocation(line: 246, column: 28, scope: !3418)
!3727 = !DILocation(line: 246, column: 33, scope: !3418)
!3728 = !DILocation(line: 247, column: 17, scope: !3418)
!3729 = !DILocation(line: 126, column: 47, scope: !3380)
!3730 = !DILocation(line: 126, column: 9, scope: !3380)
!3731 = distinct !{!3731, !3381, !3732, !258}
!3732 = !DILocation(line: 316, column: 9, scope: !3377)
!3733 = !DILocation(line: 319, column: 19, scope: !3322)
!3734 = !DILocation(line: 320, column: 9, scope: !3322)
!3735 = !DILocation(line: 320, column: 19, scope: !3322)
!3736 = !DILocation(line: 321, column: 9, scope: !3322)
!3737 = !DILocation(line: 321, column: 19, scope: !3322)
!3738 = !DILocation(line: 322, column: 9, scope: !3322)
!3739 = !DILocation(line: 322, column: 19, scope: !3322)
!3740 = !DILocation(line: 323, column: 9, scope: !3322)
!3741 = !DILocation(line: 323, column: 19, scope: !3322)
!3742 = !DILocation(line: 324, column: 9, scope: !3322)
!3743 = !DILocation(line: 324, column: 19, scope: !3322)
!3744 = !DILocation(line: 325, column: 9, scope: !3322)
!3745 = !DILocation(line: 325, column: 19, scope: !3322)
!3746 = !DILocation(line: 326, column: 9, scope: !3322)
!3747 = !DILocation(line: 326, column: 19, scope: !3322)
!3748 = !DILocation(line: 327, column: 9, scope: !3322)
!3749 = !DILocation(line: 327, column: 19, scope: !3322)
!3750 = !DILocation(line: 328, column: 9, scope: !3322)
!3751 = !DILocation(line: 328, column: 19, scope: !3322)
!3752 = !DILocation(line: 329, column: 9, scope: !3322)
!3753 = !DILocation(line: 329, column: 19, scope: !3322)
!3754 = !DILocation(line: 330, column: 9, scope: !3322)
!3755 = !DILocation(line: 330, column: 19, scope: !3322)
!3756 = !DILocation(line: 331, column: 9, scope: !3322)
!3757 = !DILocation(line: 331, column: 19, scope: !3322)
!3758 = !DILocation(line: 332, column: 9, scope: !3322)
!3759 = !DILocation(line: 332, column: 19, scope: !3322)
!3760 = !DILocation(line: 333, column: 9, scope: !3322)
!3761 = !DILocation(line: 333, column: 19, scope: !3322)
!3762 = !DILocation(line: 334, column: 9, scope: !3322)
!3763 = !DILocation(line: 334, column: 19, scope: !3322)
!3764 = !DILocation(line: 335, column: 9, scope: !3322)
!3765 = !DILocation(line: 335, column: 19, scope: !3322)
!3766 = !DILocation(line: 336, column: 9, scope: !3322)
!3767 = !DILocation(line: 336, column: 19, scope: !3322)
!3768 = !DILocation(line: 337, column: 9, scope: !3322)
!3769 = !DILocation(line: 337, column: 19, scope: !3322)
!3770 = !DILocation(line: 338, column: 9, scope: !3322)
!3771 = !DILocation(line: 338, column: 19, scope: !3322)
!3772 = !DILocation(line: 339, column: 9, scope: !3322)
!3773 = !DILocation(line: 339, column: 19, scope: !3322)
!3774 = !DILocation(line: 340, column: 9, scope: !3322)
!3775 = !DILocation(line: 340, column: 19, scope: !3322)
!3776 = !DILocation(line: 341, column: 9, scope: !3322)
!3777 = !DILocation(line: 341, column: 19, scope: !3322)
!3778 = !DILocation(line: 342, column: 9, scope: !3322)
!3779 = !DILocation(line: 342, column: 19, scope: !3322)
!3780 = !DILocation(line: 343, column: 9, scope: !3322)
!3781 = !DILocation(line: 343, column: 19, scope: !3322)
!3782 = !DILocation(line: 344, column: 1, scope: !3322)
!3783 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !3231, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3784 = !DILocalVariable(name: "state", arg: 1, scope: !3783, file: !74, line: 550, type: !566)
!3785 = !DILocation(line: 0, scope: !3783)
!3786 = !DILocation(line: 552, column: 36, scope: !3783)
!3787 = !DILocalVariable(name: "s", arg: 1, scope: !3788, file: !74, line: 405, type: !607)
!3788 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !3789, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3789 = !DISubroutineType(types: !3790)
!3790 = !{null, !607, !40, !40, !33}
!3791 = !DILocation(line: 0, scope: !3788, inlinedAt: !3792)
!3792 = distinct !DILocation(line: 552, column: 3, scope: !3783)
!3793 = !DILocalVariable(name: "pos", arg: 2, scope: !3788, file: !74, line: 405, type: !40)
!3794 = !DILocalVariable(name: "r", arg: 3, scope: !3788, file: !74, line: 405, type: !40)
!3795 = !DILocalVariable(name: "p", arg: 4, scope: !3788, file: !74, line: 405, type: !33)
!3796 = !DILocation(line: 407, column: 31, scope: !3788, inlinedAt: !3792)
!3797 = !DILocation(line: 407, column: 27, scope: !3788, inlinedAt: !3792)
!3798 = !DILocation(line: 407, column: 8, scope: !3788, inlinedAt: !3792)
!3799 = !DILocation(line: 407, column: 3, scope: !3788, inlinedAt: !3792)
!3800 = !DILocation(line: 407, column: 12, scope: !3788, inlinedAt: !3792)
!3801 = !DILocation(line: 408, column: 3, scope: !3788, inlinedAt: !3792)
!3802 = !DILocation(line: 408, column: 12, scope: !3788, inlinedAt: !3792)
!3803 = !DILocation(line: 553, column: 10, scope: !3783)
!3804 = !DILocation(line: 553, column: 14, scope: !3783)
!3805 = !DILocation(line: 554, column: 1, scope: !3783)
!3806 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !597, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3807 = !DILocalVariable(name: "out", arg: 1, scope: !3806, file: !74, line: 566, type: !32)
!3808 = !DILocation(line: 0, scope: !3806)
!3809 = !DILocalVariable(name: "outlen", arg: 2, scope: !3806, file: !74, line: 566, type: !38)
!3810 = !DILocalVariable(name: "state", arg: 3, scope: !3806, file: !74, line: 566, type: !566)
!3811 = !DILocation(line: 568, column: 61, scope: !3806)
!3812 = !DILocation(line: 0, scope: !868, inlinedAt: !3813)
!3813 = distinct !DILocation(line: 568, column: 16, scope: !3806)
!3814 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !3813)
!3815 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !3813)
!3816 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !3813)
!3817 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !3813)
!3818 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !3813)
!3819 = !DILocation(line: 439, scope: !886, inlinedAt: !3813)
!3820 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !3813)
!3821 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !3813)
!3822 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !3813)
!3823 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !3813)
!3824 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !3813)
!3825 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !3813)
!3826 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !3813)
!3827 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !3813)
!3828 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !3813)
!3829 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !3813)
!3830 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !3813)
!3831 = distinct !{!3831, !3822, !3832, !258}
!3832 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !3813)
!3833 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !3813)
!3834 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !3813)
!3835 = distinct !{!3835, !3814, !3836, !258}
!3836 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !3813)
!3837 = !DILocation(line: 568, column: 10, scope: !3806)
!3838 = !DILocation(line: 568, column: 14, scope: !3806)
!3839 = !DILocation(line: 569, column: 1, scope: !3806)
!3840 = !DILocation(line: 0, scope: !563)
!3841 = !DILocation(line: 582, column: 3, scope: !563)
!3842 = !DILocation(line: 583, column: 10, scope: !563)
!3843 = !DILocation(line: 583, column: 14, scope: !563)
!3844 = !DILocation(line: 584, column: 1, scope: !563)
!3845 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !3846, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3846 = !DISubroutineType(types: !3847)
!3847 = !{null, !607, !40, !160, !38, !33}
!3848 = !DILocalVariable(name: "s", arg: 1, scope: !3845, file: !74, line: 461, type: !607)
!3849 = !DILocation(line: 0, scope: !3845)
!3850 = !DILocalVariable(name: "r", arg: 2, scope: !3845, file: !74, line: 462, type: !40)
!3851 = !DILocalVariable(name: "in", arg: 3, scope: !3845, file: !74, line: 463, type: !160)
!3852 = !DILocalVariable(name: "inlen", arg: 4, scope: !3845, file: !74, line: 464, type: !38)
!3853 = !DILocalVariable(name: "p", arg: 5, scope: !3845, file: !74, line: 465, type: !33)
!3854 = !DILocalVariable(name: "i", scope: !3845, file: !74, line: 467, type: !40)
!3855 = !DILocation(line: 469, column: 7, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3845, file: !74, line: 469, column: 3)
!3857 = !DILocation(line: 469, scope: !3856)
!3858 = !DILocation(line: 469, column: 12, scope: !3859)
!3859 = distinct !DILexicalBlock(scope: !3856, file: !74, line: 469, column: 3)
!3860 = !DILocation(line: 469, column: 3, scope: !3856)
!3861 = !DILocation(line: 472, column: 3, scope: !3845)
!3862 = !DILocation(line: 470, column: 5, scope: !3859)
!3863 = !DILocation(line: 470, column: 10, scope: !3859)
!3864 = !DILocation(line: 469, column: 17, scope: !3859)
!3865 = !DILocation(line: 469, column: 3, scope: !3859)
!3866 = distinct !{!3866, !3860, !3867, !258}
!3867 = !DILocation(line: 470, column: 12, scope: !3856)
!3868 = !DILocation(line: 472, column: 15, scope: !3845)
!3869 = !DILocation(line: 473, column: 5, scope: !3870)
!3870 = distinct !DILexicalBlock(scope: !3871, file: !74, line: 473, column: 5)
!3871 = distinct !DILexicalBlock(scope: !3845, file: !74, line: 472, column: 21)
!3872 = !DILocation(line: 480, column: 3, scope: !3873)
!3873 = distinct !DILexicalBlock(scope: !3845, file: !74, line: 480, column: 3)
!3874 = !DILocation(line: 473, scope: !3870)
!3875 = !DILocation(line: 473, column: 14, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3870, file: !74, line: 473, column: 5)
!3877 = !DILocation(line: 474, column: 26, scope: !3876)
!3878 = !DILocation(line: 474, column: 24, scope: !3876)
!3879 = !DILocalVariable(name: "x", arg: 1, scope: !3880, file: !74, line: 22, type: !160)
!3880 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !3881, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3881 = !DISubroutineType(types: !3882)
!3882 = !{!70, !160}
!3883 = !DILocation(line: 0, scope: !3880, inlinedAt: !3884)
!3884 = distinct !DILocation(line: 474, column: 15, scope: !3876)
!3885 = !DILocalVariable(name: "r", scope: !3880, file: !74, line: 24, type: !70)
!3886 = !DILocalVariable(name: "i", scope: !3880, file: !74, line: 23, type: !40)
!3887 = !DILocation(line: 26, column: 7, scope: !3888, inlinedAt: !3884)
!3888 = distinct !DILexicalBlock(scope: !3880, file: !74, line: 26, column: 3)
!3889 = !DILocation(line: 26, scope: !3888, inlinedAt: !3884)
!3890 = !DILocation(line: 26, column: 12, scope: !3891, inlinedAt: !3884)
!3891 = distinct !DILexicalBlock(scope: !3888, file: !74, line: 26, column: 3)
!3892 = !DILocation(line: 26, column: 3, scope: !3888, inlinedAt: !3884)
!3893 = !DILocation(line: 27, column: 20, scope: !3891, inlinedAt: !3884)
!3894 = !DILocation(line: 27, column: 10, scope: !3891, inlinedAt: !3884)
!3895 = !DILocation(line: 27, column: 29, scope: !3891, inlinedAt: !3884)
!3896 = !DILocation(line: 27, column: 25, scope: !3891, inlinedAt: !3884)
!3897 = !DILocation(line: 27, column: 7, scope: !3891, inlinedAt: !3884)
!3898 = !DILocation(line: 26, column: 16, scope: !3891, inlinedAt: !3884)
!3899 = !DILocation(line: 26, column: 3, scope: !3891, inlinedAt: !3884)
!3900 = distinct !{!3900, !3892, !3901, !258}
!3901 = !DILocation(line: 27, column: 30, scope: !3888, inlinedAt: !3884)
!3902 = !DILocation(line: 474, column: 7, scope: !3876)
!3903 = !DILocation(line: 474, column: 12, scope: !3876)
!3904 = !DILocation(line: 473, column: 20, scope: !3876)
!3905 = !DILocation(line: 473, column: 5, scope: !3876)
!3906 = distinct !{!3906, !3869, !3907, !258}
!3907 = !DILocation(line: 474, column: 28, scope: !3870)
!3908 = !DILocation(line: 475, column: 8, scope: !3871)
!3909 = !DILocation(line: 476, column: 11, scope: !3871)
!3910 = !DILocation(line: 477, column: 5, scope: !3871)
!3911 = distinct !{!3911, !3861, !3912, !258}
!3912 = !DILocation(line: 478, column: 3, scope: !3845)
!3913 = !DILocation(line: 480, scope: !3873)
!3914 = !DILocation(line: 480, column: 12, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3873, file: !74, line: 480, column: 3)
!3916 = !DILocation(line: 481, column: 25, scope: !3915)
!3917 = !DILocation(line: 481, column: 15, scope: !3915)
!3918 = !DILocation(line: 481, column: 35, scope: !3915)
!3919 = !DILocation(line: 481, column: 31, scope: !3915)
!3920 = !DILocation(line: 481, column: 8, scope: !3915)
!3921 = !DILocation(line: 481, column: 5, scope: !3915)
!3922 = !DILocation(line: 481, column: 12, scope: !3915)
!3923 = !DILocation(line: 480, column: 20, scope: !3915)
!3924 = !DILocation(line: 480, column: 3, scope: !3915)
!3925 = distinct !{!3925, !3872, !3926, !258}
!3926 = !DILocation(line: 481, column: 40, scope: !3873)
!3927 = !DILocation(line: 483, column: 13, scope: !3845)
!3928 = !DILocation(line: 483, column: 29, scope: !3845)
!3929 = !DILocation(line: 483, column: 25, scope: !3845)
!3930 = !DILocation(line: 483, column: 6, scope: !3845)
!3931 = !DILocation(line: 483, column: 3, scope: !3845)
!3932 = !DILocation(line: 483, column: 10, scope: !3845)
!3933 = !DILocation(line: 484, column: 7, scope: !3845)
!3934 = !DILocation(line: 484, column: 10, scope: !3845)
!3935 = !DILocation(line: 484, column: 3, scope: !3845)
!3936 = !DILocation(line: 484, column: 14, scope: !3845)
!3937 = !DILocation(line: 485, column: 1, scope: !3845)
!3938 = !DILocation(line: 0, scope: !596)
!3939 = !DILocation(line: 0, scope: !604, inlinedAt: !3940)
!3940 = distinct !DILocation(line: 600, column: 3, scope: !596)
!3941 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !3940)
!3942 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !3940)
!3943 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !3940)
!3944 = !DILocation(line: 509, scope: !618, inlinedAt: !3940)
!3945 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !3940)
!3946 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !3940)
!3947 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !3940)
!3948 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !3940)
!3949 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !3940)
!3950 = !DILocation(line: 0, scope: !627, inlinedAt: !3951)
!3951 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !3940)
!3952 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !3951)
!3953 = !DILocation(line: 43, scope: !635, inlinedAt: !3951)
!3954 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !3951)
!3955 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !3951)
!3956 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !3951)
!3957 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !3951)
!3958 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !3951)
!3959 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !3951)
!3960 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !3951)
!3961 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !3951)
!3962 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !3951)
!3963 = distinct !{!3963, !3955, !3964, !258}
!3964 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !3951)
!3965 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !3940)
!3966 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !3940)
!3967 = distinct !{!3967, !3946, !3968, !258}
!3968 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !3940)
!3969 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !3940)
!3970 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !3940)
!3971 = distinct !{!3971, !3941, !3972, !258}
!3972 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !3940)
!3973 = !DILocation(line: 601, column: 1, scope: !596)
!3974 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !3231, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3975 = !DILocalVariable(name: "state", arg: 1, scope: !3974, file: !74, line: 610, type: !566)
!3976 = !DILocation(line: 0, scope: !3974)
!3977 = !DILocation(line: 0, scope: !3236, inlinedAt: !3978)
!3978 = distinct !DILocation(line: 612, column: 3, scope: !3974)
!3979 = !DILocation(line: 356, column: 7, scope: !3243, inlinedAt: !3978)
!3980 = !DILocation(line: 356, scope: !3243, inlinedAt: !3978)
!3981 = !DILocation(line: 356, column: 12, scope: !3246, inlinedAt: !3978)
!3982 = !DILocation(line: 356, column: 3, scope: !3243, inlinedAt: !3978)
!3983 = !DILocation(line: 357, column: 5, scope: !3246, inlinedAt: !3978)
!3984 = !DILocation(line: 357, column: 10, scope: !3246, inlinedAt: !3978)
!3985 = !DILocation(line: 356, column: 17, scope: !3246, inlinedAt: !3978)
!3986 = !DILocation(line: 356, column: 3, scope: !3246, inlinedAt: !3978)
!3987 = distinct !{!3987, !3982, !3988, !258}
!3988 = !DILocation(line: 357, column: 12, scope: !3243, inlinedAt: !3978)
!3989 = !DILocation(line: 613, column: 10, scope: !3974)
!3990 = !DILocation(line: 613, column: 14, scope: !3974)
!3991 = !DILocation(line: 614, column: 1, scope: !3974)
!3992 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !564, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3993 = !DILocalVariable(name: "state", arg: 1, scope: !3992, file: !74, line: 625, type: !566)
!3994 = !DILocation(line: 0, scope: !3992)
!3995 = !DILocalVariable(name: "in", arg: 2, scope: !3992, file: !74, line: 625, type: !160)
!3996 = !DILocalVariable(name: "inlen", arg: 3, scope: !3992, file: !74, line: 625, type: !38)
!3997 = !DILocation(line: 627, column: 47, scope: !3992)
!3998 = !DILocation(line: 627, column: 16, scope: !3992)
!3999 = !DILocation(line: 627, column: 10, scope: !3992)
!4000 = !DILocation(line: 627, column: 14, scope: !3992)
!4001 = !DILocation(line: 628, column: 1, scope: !3992)
!4002 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !3231, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4003 = !DILocalVariable(name: "state", arg: 1, scope: !4002, file: !74, line: 637, type: !566)
!4004 = !DILocation(line: 0, scope: !4002)
!4005 = !DILocation(line: 639, column: 36, scope: !4002)
!4006 = !DILocation(line: 0, scope: !3788, inlinedAt: !4007)
!4007 = distinct !DILocation(line: 639, column: 3, scope: !4002)
!4008 = !DILocation(line: 407, column: 31, scope: !3788, inlinedAt: !4007)
!4009 = !DILocation(line: 407, column: 27, scope: !3788, inlinedAt: !4007)
!4010 = !DILocation(line: 407, column: 8, scope: !3788, inlinedAt: !4007)
!4011 = !DILocation(line: 407, column: 3, scope: !3788, inlinedAt: !4007)
!4012 = !DILocation(line: 407, column: 12, scope: !3788, inlinedAt: !4007)
!4013 = !DILocation(line: 408, column: 3, scope: !3788, inlinedAt: !4007)
!4014 = !DILocation(line: 408, column: 12, scope: !3788, inlinedAt: !4007)
!4015 = !DILocation(line: 640, column: 10, scope: !4002)
!4016 = !DILocation(line: 640, column: 14, scope: !4002)
!4017 = !DILocation(line: 641, column: 1, scope: !4002)
!4018 = !DILocation(line: 0, scope: !861)
!4019 = !DILocation(line: 655, column: 61, scope: !861)
!4020 = !DILocation(line: 0, scope: !868, inlinedAt: !4021)
!4021 = distinct !DILocation(line: 655, column: 16, scope: !861)
!4022 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !4021)
!4023 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !4021)
!4024 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !4021)
!4025 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !4021)
!4026 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !4021)
!4027 = !DILocation(line: 439, scope: !886, inlinedAt: !4021)
!4028 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !4021)
!4029 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !4021)
!4030 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4021)
!4031 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !4021)
!4032 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !4021)
!4033 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !4021)
!4034 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !4021)
!4035 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !4021)
!4036 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !4021)
!4037 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !4021)
!4038 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !4021)
!4039 = distinct !{!4039, !4030, !4040, !258}
!4040 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !4021)
!4041 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !4021)
!4042 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !4021)
!4043 = distinct !{!4043, !4022, !4044, !258}
!4044 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !4021)
!4045 = !DILocation(line: 655, column: 10, scope: !861)
!4046 = !DILocation(line: 655, column: 14, scope: !861)
!4047 = !DILocation(line: 656, column: 1, scope: !861)
!4048 = !DILocation(line: 0, scope: !832)
!4049 = !DILocation(line: 669, column: 3, scope: !832)
!4050 = !DILocation(line: 670, column: 10, scope: !832)
!4051 = !DILocation(line: 670, column: 14, scope: !832)
!4052 = !DILocation(line: 671, column: 1, scope: !832)
!4053 = !DILocation(line: 0, scope: !853)
!4054 = !DILocation(line: 0, scope: !604, inlinedAt: !4055)
!4055 = distinct !DILocation(line: 687, column: 3, scope: !853)
!4056 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4055)
!4057 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4055)
!4058 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4055)
!4059 = !DILocation(line: 509, scope: !618, inlinedAt: !4055)
!4060 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4055)
!4061 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4055)
!4062 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4055)
!4063 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4055)
!4064 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4055)
!4065 = !DILocation(line: 0, scope: !627, inlinedAt: !4066)
!4066 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4055)
!4067 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4066)
!4068 = !DILocation(line: 43, scope: !635, inlinedAt: !4066)
!4069 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4066)
!4070 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4066)
!4071 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4066)
!4072 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4066)
!4073 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4066)
!4074 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4066)
!4075 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4066)
!4076 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4066)
!4077 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4066)
!4078 = distinct !{!4078, !4070, !4079, !258}
!4079 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4066)
!4080 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4055)
!4081 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4055)
!4082 = distinct !{!4082, !4061, !4083, !258}
!4083 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4055)
!4084 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4055)
!4085 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4055)
!4086 = distinct !{!4086, !4056, !4087, !258}
!4087 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4055)
!4088 = !DILocation(line: 688, column: 1, scope: !853)
!4089 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !835, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4090 = !DILocalVariable(name: "out", arg: 1, scope: !4089, file: !74, line: 700, type: !32)
!4091 = !DILocation(line: 0, scope: !4089)
!4092 = !DILocalVariable(name: "outlen", arg: 2, scope: !4089, file: !74, line: 700, type: !38)
!4093 = !DILocalVariable(name: "in", arg: 3, scope: !4089, file: !74, line: 700, type: !160)
!4094 = !DILocalVariable(name: "inlen", arg: 4, scope: !4089, file: !74, line: 700, type: !38)
!4095 = !DILocalVariable(name: "state", scope: !4089, file: !74, line: 703, type: !567)
!4096 = !DILocation(line: 703, column: 16, scope: !4089)
!4097 = !DILocation(line: 0, scope: !563, inlinedAt: !4098)
!4098 = distinct !DILocation(line: 705, column: 3, scope: !4089)
!4099 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !4098)
!4100 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !4098)
!4101 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !4098)
!4102 = !DILocation(line: 706, column: 19, scope: !4089)
!4103 = !DILocalVariable(name: "nblocks", scope: !4089, file: !74, line: 702, type: !38)
!4104 = !DILocation(line: 0, scope: !596, inlinedAt: !4105)
!4105 = distinct !DILocation(line: 707, column: 3, scope: !4089)
!4106 = !DILocation(line: 0, scope: !604, inlinedAt: !4107)
!4107 = distinct !DILocation(line: 600, column: 3, scope: !596, inlinedAt: !4105)
!4108 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4107)
!4109 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4107)
!4110 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4107)
!4111 = !DILocation(line: 509, scope: !618, inlinedAt: !4107)
!4112 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4107)
!4113 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4107)
!4114 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4107)
!4115 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4107)
!4116 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4107)
!4117 = !DILocation(line: 0, scope: !627, inlinedAt: !4118)
!4118 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4107)
!4119 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4118)
!4120 = !DILocation(line: 43, scope: !635, inlinedAt: !4118)
!4121 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4118)
!4122 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4118)
!4123 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4118)
!4124 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4118)
!4125 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4118)
!4126 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4118)
!4127 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4118)
!4128 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4118)
!4129 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4118)
!4130 = distinct !{!4130, !4122, !4131, !258}
!4131 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4118)
!4132 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4107)
!4133 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4107)
!4134 = distinct !{!4134, !4113, !4135, !258}
!4135 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4107)
!4136 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4107)
!4137 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4107)
!4138 = distinct !{!4138, !4108, !4139, !258}
!4139 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4107)
!4140 = !DILocation(line: 708, column: 20, scope: !4089)
!4141 = !DILocation(line: 708, column: 10, scope: !4089)
!4142 = !DILocation(line: 709, column: 17, scope: !4089)
!4143 = !DILocation(line: 709, column: 7, scope: !4089)
!4144 = !DILocation(line: 0, scope: !3806, inlinedAt: !4145)
!4145 = distinct !DILocation(line: 710, column: 3, scope: !4089)
!4146 = !DILocation(line: 568, column: 61, scope: !3806, inlinedAt: !4145)
!4147 = !DILocation(line: 0, scope: !868, inlinedAt: !4148)
!4148 = distinct !DILocation(line: 568, column: 16, scope: !3806, inlinedAt: !4145)
!4149 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !4148)
!4150 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !4148)
!4151 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !4148)
!4152 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !4148)
!4153 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !4148)
!4154 = !DILocation(line: 439, scope: !886, inlinedAt: !4148)
!4155 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !4148)
!4156 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !4148)
!4157 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4148)
!4158 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !4148)
!4159 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !4148)
!4160 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !4148)
!4161 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !4148)
!4162 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !4148)
!4163 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !4148)
!4164 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !4148)
!4165 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !4148)
!4166 = distinct !{!4166, !4157, !4167, !258}
!4167 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !4148)
!4168 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !4148)
!4169 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !4148)
!4170 = distinct !{!4170, !4149, !4171, !258}
!4171 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !4148)
!4172 = !DILocation(line: 568, column: 10, scope: !3806, inlinedAt: !4145)
!4173 = !DILocation(line: 568, column: 14, scope: !3806, inlinedAt: !4145)
!4174 = !DILocation(line: 711, column: 1, scope: !4089)
!4175 = !DILocation(line: 0, scope: !834)
!4176 = !DILocation(line: 726, column: 16, scope: !834)
!4177 = !DILocation(line: 0, scope: !832, inlinedAt: !4178)
!4178 = distinct !DILocation(line: 728, column: 3, scope: !834)
!4179 = !DILocation(line: 669, column: 3, scope: !832, inlinedAt: !4178)
!4180 = !DILocation(line: 670, column: 10, scope: !832, inlinedAt: !4178)
!4181 = !DILocation(line: 670, column: 14, scope: !832, inlinedAt: !4178)
!4182 = !DILocation(line: 729, column: 19, scope: !834)
!4183 = !DILocation(line: 0, scope: !853, inlinedAt: !4184)
!4184 = distinct !DILocation(line: 730, column: 3, scope: !834)
!4185 = !DILocation(line: 0, scope: !604, inlinedAt: !4186)
!4186 = distinct !DILocation(line: 687, column: 3, scope: !853, inlinedAt: !4184)
!4187 = !DILocation(line: 507, column: 3, scope: !604, inlinedAt: !4186)
!4188 = !DILocation(line: 508, column: 5, scope: !615, inlinedAt: !4186)
!4189 = !DILocation(line: 509, column: 9, scope: !618, inlinedAt: !4186)
!4190 = !DILocation(line: 509, scope: !618, inlinedAt: !4186)
!4191 = !DILocation(line: 509, column: 14, scope: !621, inlinedAt: !4186)
!4192 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4186)
!4193 = !DILocation(line: 510, column: 20, scope: !621, inlinedAt: !4186)
!4194 = !DILocation(line: 510, column: 18, scope: !621, inlinedAt: !4186)
!4195 = !DILocation(line: 510, column: 24, scope: !621, inlinedAt: !4186)
!4196 = !DILocation(line: 0, scope: !627, inlinedAt: !4197)
!4197 = distinct !DILocation(line: 510, column: 7, scope: !621, inlinedAt: !4186)
!4198 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4197)
!4199 = !DILocation(line: 43, scope: !635, inlinedAt: !4197)
!4200 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4197)
!4201 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4197)
!4202 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4197)
!4203 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4197)
!4204 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4197)
!4205 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4197)
!4206 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4197)
!4207 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4197)
!4208 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4197)
!4209 = distinct !{!4209, !4201, !4210, !258}
!4210 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4197)
!4211 = !DILocation(line: 509, column: 20, scope: !621, inlinedAt: !4186)
!4212 = !DILocation(line: 509, column: 5, scope: !621, inlinedAt: !4186)
!4213 = distinct !{!4213, !4192, !4214, !258}
!4214 = !DILocation(line: 510, column: 28, scope: !618, inlinedAt: !4186)
!4215 = !DILocation(line: 511, column: 9, scope: !615, inlinedAt: !4186)
!4216 = !DILocation(line: 512, column: 13, scope: !615, inlinedAt: !4186)
!4217 = distinct !{!4217, !4187, !4218, !258}
!4218 = !DILocation(line: 513, column: 3, scope: !604, inlinedAt: !4186)
!4219 = !DILocation(line: 731, column: 20, scope: !834)
!4220 = !DILocation(line: 731, column: 10, scope: !834)
!4221 = !DILocation(line: 732, column: 17, scope: !834)
!4222 = !DILocation(line: 732, column: 7, scope: !834)
!4223 = !DILocation(line: 0, scope: !861, inlinedAt: !4224)
!4224 = distinct !DILocation(line: 733, column: 3, scope: !834)
!4225 = !DILocation(line: 655, column: 61, scope: !861, inlinedAt: !4224)
!4226 = !DILocation(line: 0, scope: !868, inlinedAt: !4227)
!4227 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !4224)
!4228 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !4227)
!4229 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !4227)
!4230 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !4227)
!4231 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !4227)
!4232 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !4227)
!4233 = !DILocation(line: 439, scope: !886, inlinedAt: !4227)
!4234 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !4227)
!4235 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !4227)
!4236 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4227)
!4237 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !4227)
!4238 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !4227)
!4239 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !4227)
!4240 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !4227)
!4241 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !4227)
!4242 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !4227)
!4243 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !4227)
!4244 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !4227)
!4245 = distinct !{!4245, !4236, !4246, !258}
!4246 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !4227)
!4247 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !4227)
!4248 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !4227)
!4249 = distinct !{!4249, !4228, !4250, !258}
!4250 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !4227)
!4251 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !4224)
!4252 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !4224)
!4253 = !DILocation(line: 734, column: 1, scope: !834)
!4254 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !4255, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4255 = !DISubroutineType(types: !4256)
!4256 = !{null, !32, !160, !38}
!4257 = !DILocalVariable(name: "h", arg: 1, scope: !4254, file: !74, line: 745, type: !32)
!4258 = !DILocation(line: 0, scope: !4254)
!4259 = !DILocalVariable(name: "in", arg: 2, scope: !4254, file: !74, line: 745, type: !160)
!4260 = !DILocalVariable(name: "inlen", arg: 3, scope: !4254, file: !74, line: 745, type: !38)
!4261 = !DILocalVariable(name: "s", scope: !4254, file: !74, line: 748, type: !513)
!4262 = !DILocation(line: 748, column: 12, scope: !4254)
!4263 = !DILocation(line: 750, column: 3, scope: !4254)
!4264 = !DILocation(line: 751, column: 3, scope: !4254)
!4265 = !DILocalVariable(name: "i", scope: !4254, file: !74, line: 747, type: !40)
!4266 = !DILocation(line: 752, column: 7, scope: !4267)
!4267 = distinct !DILexicalBlock(scope: !4254, file: !74, line: 752, column: 3)
!4268 = !DILocation(line: 752, scope: !4267)
!4269 = !DILocation(line: 752, column: 12, scope: !4270)
!4270 = distinct !DILexicalBlock(scope: !4267, file: !74, line: 752, column: 3)
!4271 = !DILocation(line: 752, column: 3, scope: !4267)
!4272 = !DILocation(line: 753, column: 16, scope: !4270)
!4273 = !DILocation(line: 753, column: 14, scope: !4270)
!4274 = !DILocation(line: 753, column: 19, scope: !4270)
!4275 = !DILocation(line: 0, scope: !627, inlinedAt: !4276)
!4276 = distinct !DILocation(line: 753, column: 5, scope: !4270)
!4277 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4276)
!4278 = !DILocation(line: 43, scope: !635, inlinedAt: !4276)
!4279 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4276)
!4280 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4276)
!4281 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4276)
!4282 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4276)
!4283 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4276)
!4284 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4276)
!4285 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4276)
!4286 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4276)
!4287 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4276)
!4288 = distinct !{!4288, !4280, !4289, !258}
!4289 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4276)
!4290 = !DILocation(line: 752, column: 16, scope: !4270)
!4291 = !DILocation(line: 752, column: 3, scope: !4270)
!4292 = distinct !{!4292, !4271, !4293, !258}
!4293 = !DILocation(line: 753, column: 23, scope: !4267)
!4294 = !DILocation(line: 754, column: 1, scope: !4254)
!4295 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !4255, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4296 = !DILocalVariable(name: "h", arg: 1, scope: !4295, file: !74, line: 765, type: !32)
!4297 = !DILocation(line: 0, scope: !4295)
!4298 = !DILocalVariable(name: "in", arg: 2, scope: !4295, file: !74, line: 765, type: !160)
!4299 = !DILocalVariable(name: "inlen", arg: 3, scope: !4295, file: !74, line: 765, type: !38)
!4300 = !DILocalVariable(name: "s", scope: !4295, file: !74, line: 768, type: !513)
!4301 = !DILocation(line: 768, column: 12, scope: !4295)
!4302 = !DILocation(line: 770, column: 3, scope: !4295)
!4303 = !DILocation(line: 771, column: 3, scope: !4295)
!4304 = !DILocalVariable(name: "i", scope: !4295, file: !74, line: 767, type: !40)
!4305 = !DILocation(line: 772, column: 7, scope: !4306)
!4306 = distinct !DILexicalBlock(scope: !4295, file: !74, line: 772, column: 3)
!4307 = !DILocation(line: 772, scope: !4306)
!4308 = !DILocation(line: 772, column: 12, scope: !4309)
!4309 = distinct !DILexicalBlock(scope: !4306, file: !74, line: 772, column: 3)
!4310 = !DILocation(line: 772, column: 3, scope: !4306)
!4311 = !DILocation(line: 773, column: 16, scope: !4309)
!4312 = !DILocation(line: 773, column: 14, scope: !4309)
!4313 = !DILocation(line: 773, column: 19, scope: !4309)
!4314 = !DILocation(line: 0, scope: !627, inlinedAt: !4315)
!4315 = distinct !DILocation(line: 773, column: 5, scope: !4309)
!4316 = !DILocation(line: 43, column: 7, scope: !635, inlinedAt: !4315)
!4317 = !DILocation(line: 43, scope: !635, inlinedAt: !4315)
!4318 = !DILocation(line: 43, column: 12, scope: !638, inlinedAt: !4315)
!4319 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4315)
!4320 = !DILocation(line: 44, column: 18, scope: !638, inlinedAt: !4315)
!4321 = !DILocation(line: 44, column: 14, scope: !638, inlinedAt: !4315)
!4322 = !DILocation(line: 44, column: 12, scope: !638, inlinedAt: !4315)
!4323 = !DILocation(line: 44, column: 5, scope: !638, inlinedAt: !4315)
!4324 = !DILocation(line: 44, column: 10, scope: !638, inlinedAt: !4315)
!4325 = !DILocation(line: 43, column: 16, scope: !638, inlinedAt: !4315)
!4326 = !DILocation(line: 43, column: 3, scope: !638, inlinedAt: !4315)
!4327 = distinct !{!4327, !4319, !4328, !258}
!4328 = !DILocation(line: 44, column: 19, scope: !635, inlinedAt: !4315)
!4329 = !DILocation(line: 772, column: 16, scope: !4309)
!4330 = !DILocation(line: 772, column: 3, scope: !4309)
!4331 = distinct !{!4331, !4310, !4332, !258}
!4332 = !DILocation(line: 773, column: 23, scope: !4306)
!4333 = !DILocation(line: 774, column: 1, scope: !4295)
!4334 = !DILocation(line: 0, scope: !537)
!4335 = !DILocation(line: 23, column: 11, scope: !537)
!4336 = !DILocation(line: 25, column: 3, scope: !537)
!4337 = !DILocation(line: 26, column: 3, scope: !537)
!4338 = !DILocation(line: 26, column: 29, scope: !537)
!4339 = !DILocation(line: 27, column: 3, scope: !537)
!4340 = !DILocation(line: 27, column: 29, scope: !537)
!4341 = !DILocation(line: 0, scope: !563, inlinedAt: !4342)
!4342 = distinct !DILocation(line: 29, column: 3, scope: !537)
!4343 = !DILocation(line: 582, column: 3, scope: !563, inlinedAt: !4342)
!4344 = !DILocation(line: 583, column: 10, scope: !563, inlinedAt: !4342)
!4345 = !DILocation(line: 583, column: 14, scope: !563, inlinedAt: !4342)
!4346 = !DILocation(line: 30, column: 1, scope: !537)
!4347 = !DILocation(line: 0, scope: !815)
!4348 = !DILocation(line: 45, column: 11, scope: !815)
!4349 = !DILocation(line: 47, column: 3, scope: !815)
!4350 = !DILocation(line: 48, column: 3, scope: !815)
!4351 = !DILocation(line: 48, column: 26, scope: !815)
!4352 = !DILocation(line: 50, column: 3, scope: !815)
!4353 = !DILocation(line: 51, column: 1, scope: !815)
!4354 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !538, file: !538, line: 64, type: !1774, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!4355 = !DILocalVariable(name: "out", arg: 1, scope: !4354, file: !538, line: 64, type: !32)
!4356 = !DILocation(line: 0, scope: !4354)
!4357 = !DILocalVariable(name: "key", arg: 2, scope: !4354, file: !538, line: 64, type: !160)
!4358 = !DILocalVariable(name: "input", arg: 3, scope: !4354, file: !538, line: 64, type: !160)
!4359 = !DILocalVariable(name: "s", scope: !4354, file: !538, line: 66, type: !542)
!4360 = !DILocation(line: 66, column: 16, scope: !4354)
!4361 = !DILocation(line: 0, scope: !3974, inlinedAt: !4362)
!4362 = distinct !DILocation(line: 68, column: 3, scope: !4354)
!4363 = !DILocation(line: 0, scope: !3236, inlinedAt: !4364)
!4364 = distinct !DILocation(line: 612, column: 3, scope: !3974, inlinedAt: !4362)
!4365 = !DILocation(line: 356, column: 7, scope: !3243, inlinedAt: !4364)
!4366 = !DILocation(line: 356, scope: !3243, inlinedAt: !4364)
!4367 = !DILocation(line: 356, column: 12, scope: !3246, inlinedAt: !4364)
!4368 = !DILocation(line: 356, column: 3, scope: !3243, inlinedAt: !4364)
!4369 = !DILocation(line: 357, column: 5, scope: !3246, inlinedAt: !4364)
!4370 = !DILocation(line: 357, column: 10, scope: !3246, inlinedAt: !4364)
!4371 = !DILocation(line: 356, column: 17, scope: !3246, inlinedAt: !4364)
!4372 = !DILocation(line: 356, column: 3, scope: !3246, inlinedAt: !4364)
!4373 = distinct !{!4373, !4368, !4374, !258}
!4374 = !DILocation(line: 357, column: 12, scope: !3243, inlinedAt: !4364)
!4375 = !DILocation(line: 613, column: 10, scope: !3974, inlinedAt: !4362)
!4376 = !DILocation(line: 613, column: 14, scope: !3974, inlinedAt: !4362)
!4377 = !DILocation(line: 0, scope: !3992, inlinedAt: !4378)
!4378 = distinct !DILocation(line: 69, column: 3, scope: !4354)
!4379 = !DILocation(line: 627, column: 16, scope: !3992, inlinedAt: !4378)
!4380 = !DILocation(line: 627, column: 10, scope: !3992, inlinedAt: !4378)
!4381 = !DILocation(line: 627, column: 14, scope: !3992, inlinedAt: !4378)
!4382 = !DILocation(line: 0, scope: !3992, inlinedAt: !4383)
!4383 = distinct !DILocation(line: 70, column: 3, scope: !4354)
!4384 = !DILocation(line: 627, column: 16, scope: !3992, inlinedAt: !4383)
!4385 = !DILocation(line: 627, column: 10, scope: !3992, inlinedAt: !4383)
!4386 = !DILocation(line: 627, column: 14, scope: !3992, inlinedAt: !4383)
!4387 = !DILocation(line: 0, scope: !4002, inlinedAt: !4388)
!4388 = distinct !DILocation(line: 71, column: 3, scope: !4354)
!4389 = !DILocation(line: 0, scope: !3788, inlinedAt: !4390)
!4390 = distinct !DILocation(line: 639, column: 3, scope: !4002, inlinedAt: !4388)
!4391 = !DILocation(line: 407, column: 31, scope: !3788, inlinedAt: !4390)
!4392 = !DILocation(line: 407, column: 27, scope: !3788, inlinedAt: !4390)
!4393 = !DILocation(line: 407, column: 8, scope: !3788, inlinedAt: !4390)
!4394 = !DILocation(line: 407, column: 3, scope: !3788, inlinedAt: !4390)
!4395 = !DILocation(line: 407, column: 12, scope: !3788, inlinedAt: !4390)
!4396 = !DILocation(line: 408, column: 3, scope: !3788, inlinedAt: !4390)
!4397 = !DILocation(line: 408, column: 12, scope: !3788, inlinedAt: !4390)
!4398 = !DILocation(line: 640, column: 10, scope: !4002, inlinedAt: !4388)
!4399 = !DILocation(line: 640, column: 14, scope: !4002, inlinedAt: !4388)
!4400 = !DILocation(line: 0, scope: !861, inlinedAt: !4401)
!4401 = distinct !DILocation(line: 72, column: 3, scope: !4354)
!4402 = !DILocation(line: 0, scope: !868, inlinedAt: !4403)
!4403 = distinct !DILocation(line: 655, column: 16, scope: !861, inlinedAt: !4401)
!4404 = !DILocation(line: 434, column: 3, scope: !868, inlinedAt: !4403)
!4405 = !DILocation(line: 435, column: 12, scope: !879, inlinedAt: !4403)
!4406 = !DILocation(line: 436, column: 7, scope: !882, inlinedAt: !4403)
!4407 = !DILocation(line: 438, column: 5, scope: !882, inlinedAt: !4403)
!4408 = !DILocation(line: 439, column: 9, scope: !886, inlinedAt: !4403)
!4409 = !DILocation(line: 439, scope: !886, inlinedAt: !4403)
!4410 = !DILocation(line: 439, column: 17, scope: !889, inlinedAt: !4403)
!4411 = !DILocation(line: 439, column: 21, scope: !889, inlinedAt: !4403)
!4412 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4403)
!4413 = !DILocation(line: 440, column: 19, scope: !889, inlinedAt: !4403)
!4414 = !DILocation(line: 440, column: 16, scope: !889, inlinedAt: !4403)
!4415 = !DILocation(line: 440, column: 27, scope: !889, inlinedAt: !4403)
!4416 = !DILocation(line: 440, column: 23, scope: !889, inlinedAt: !4403)
!4417 = !DILocation(line: 440, column: 14, scope: !889, inlinedAt: !4403)
!4418 = !DILocation(line: 440, column: 11, scope: !889, inlinedAt: !4403)
!4419 = !DILocation(line: 439, column: 41, scope: !889, inlinedAt: !4403)
!4420 = !DILocation(line: 439, column: 5, scope: !889, inlinedAt: !4403)
!4421 = distinct !{!4421, !4412, !4422, !258}
!4422 = !DILocation(line: 440, column: 32, scope: !886, inlinedAt: !4403)
!4423 = !DILocation(line: 441, column: 16, scope: !880, inlinedAt: !4403)
!4424 = !DILocation(line: 441, column: 12, scope: !880, inlinedAt: !4403)
!4425 = distinct !{!4425, !4404, !4426, !258}
!4426 = !DILocation(line: 443, column: 3, scope: !868, inlinedAt: !4403)
!4427 = !DILocation(line: 655, column: 10, scope: !861, inlinedAt: !4401)
!4428 = !DILocation(line: 655, column: 14, scope: !861, inlinedAt: !4401)
!4429 = !DILocation(line: 73, column: 1, scope: !4354)
