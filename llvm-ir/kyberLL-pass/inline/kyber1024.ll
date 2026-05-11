; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [4 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@.str = private unnamed_addr constant [28 x i8] c"CRYPTO_SECRETKEYBYTES:  %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [28 x i8] c"CRYPTO_PUBLICKEYBYTES:  %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [28 x i8] c"CRYPTO_CIPHERTEXTBYTES: %d\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [12 x i8] c"ERROR keys\0A\00", align 1, !dbg !11
@.str.4 = private unnamed_addr constant [18 x i8] c"ERROR invalid sk\0A\00", align 1, !dbg !16
@.str.5 = private unnamed_addr constant [26 x i8] c"ERROR invalid ciphertext\0A\00", align 1, !dbg !21
@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !26
@.str.6 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !44
@pqcrystals_kyber1024_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !66

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !106 {
entry:
  %coins.i2.i = alloca [64 x i8], align 1
  %coins.i.i19 = alloca [32 x i8], align 1
  %pk.i20 = alloca [1568 x i8], align 1
  %sk.i21 = alloca [3168 x i8], align 1
  %ct.i22 = alloca [1568 x i8], align 1
  %key_a.i23 = alloca [32 x i8], align 1
  %key_b.i24 = alloca [32 x i8], align 1
  %b.i = alloca i8, align 1
  %pos.i = alloca i32, align 4
  %coins.i1.i1 = alloca [32 x i8], align 1
  %coins.i.i2 = alloca [64 x i8], align 1
  %pk.i3 = alloca [1568 x i8], align 1
  %sk.i4 = alloca [3168 x i8], align 1
  %ct.i5 = alloca [1568 x i8], align 1
  %key_a.i6 = alloca [32 x i8], align 1
  %key_b.i7 = alloca [32 x i8], align 1
  %coins.i1.i = alloca [32 x i8], align 1
  %coins.i.i = alloca [64 x i8], align 1
  %pk.i = alloca [1568 x i8], align 1
  %sk.i = alloca [3168 x i8], align 1
  %ct.i = alloca [1568 x i8], align 1
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
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %pk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 3168, ptr nonnull %sk.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %ct.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i), !dbg !117
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i), !dbg !117
    #dbg_declare(ptr %pk.i, !126, !DIExpression(), !130)
    #dbg_declare(ptr %sk.i, !131, !DIExpression(), !135)
    #dbg_declare(ptr %ct.i, !136, !DIExpression(), !137)
    #dbg_declare(ptr %key_a.i, !138, !DIExpression(), !142)
    #dbg_declare(ptr %key_b.i, !143, !DIExpression(), !144)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i.i), !dbg !117
    #dbg_value(ptr %pk.i, !145, !DIExpression(), !146)
    #dbg_value(ptr %sk.i, !147, !DIExpression(), !146)
    #dbg_declare(ptr %coins.i.i, !148, !DIExpression(), !152)
  call void @randombytes(ptr noundef nonnull %coins.i.i, i32 noundef 64) #4, !dbg !117
    #dbg_value(ptr %pk.i, !153, !DIExpression(), !159)
    #dbg_value(ptr %sk.i, !161, !DIExpression(), !159)
    #dbg_value(ptr %coins.i.i, !162, !DIExpression(), !159)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i, ptr noundef nonnull %sk.i, ptr noundef nonnull %coins.i.i) #4, !dbg !163
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 1536, !dbg !164
  %call.i3.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i, ptr noundef nonnull %pk.i, i32 noundef 1568) #5, !dbg !165
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 3104, !dbg !166
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i, ptr noundef nonnull %pk.i, i32 noundef 1568) #4, !dbg !166
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %sk.i, i32 3136, !dbg !167
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %coins.i.i, i32 32, !dbg !168
  %call6.i.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i, ptr noundef nonnull %add.ptr5.i.i, i32 noundef 32) #5, !dbg !169
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i), !dbg !170
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !171
    #dbg_value(ptr %ct.i, !174, !DIExpression(), !175)
    #dbg_value(ptr %key_b.i, !176, !DIExpression(), !175)
    #dbg_value(ptr %pk.i, !177, !DIExpression(), !175)
    #dbg_declare(ptr %coins.i1.i, !178, !DIExpression(), !179)
  call void @randombytes(ptr noundef nonnull %coins.i1.i, i32 noundef 32) #4, !dbg !171
  %call.i2.i = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef nonnull %ct.i, ptr noundef nonnull %key_b.i, ptr noundef nonnull %pk.i, ptr noundef nonnull %coins.i1.i) #4, !dbg !180
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i), !dbg !181
  %call9.i = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a.i, ptr noundef nonnull %ct.i, ptr noundef nonnull %sk.i) #4, !dbg !182
  %call12.i = call i32 @memcmp(ptr noundef nonnull %key_a.i, ptr noundef nonnull %key_b.i, i32 noundef 32) #5, !dbg !183
  %tobool.not.i = icmp eq i32 %call12.i, 0, !dbg !183
  br i1 %tobool.not.i, label %test_keys.exit, label %if.then.i, !dbg !183

if.then.i:                                        ; preds = %for.body
  %call13.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #5, !dbg !185
  br label %test_keys.exit, !dbg !187

test_keys.exit:                                   ; preds = %for.body, %if.then.i
  %retval.0.i = phi i32 [ 1, %if.then.i ], [ 0, %for.body ], !dbg !188
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %pk.i), !dbg !189
  call void @llvm.lifetime.end.p0(i64 3168, ptr nonnull %sk.i), !dbg !189
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %ct.i), !dbg !189
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i), !dbg !189
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i), !dbg !189
    #dbg_value(i32 %retval.0.i, !190, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %pk.i3), !dbg !191
  call void @llvm.lifetime.start.p0(i64 3168, ptr nonnull %sk.i4), !dbg !191
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %ct.i5), !dbg !191
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i6), !dbg !191
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i7), !dbg !191
    #dbg_declare(ptr %pk.i3, !195, !DIExpression(), !196)
    #dbg_declare(ptr %sk.i4, !197, !DIExpression(), !198)
    #dbg_declare(ptr %ct.i5, !199, !DIExpression(), !200)
    #dbg_declare(ptr %key_a.i6, !201, !DIExpression(), !202)
    #dbg_declare(ptr %key_b.i7, !203, !DIExpression(), !204)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i.i2), !dbg !191
    #dbg_value(ptr %pk.i3, !145, !DIExpression(), !205)
    #dbg_value(ptr %sk.i4, !147, !DIExpression(), !205)
    #dbg_declare(ptr %coins.i.i2, !148, !DIExpression(), !206)
  call void @randombytes(ptr noundef nonnull %coins.i.i2, i32 noundef 64) #4, !dbg !191
    #dbg_value(ptr %pk.i3, !153, !DIExpression(), !207)
    #dbg_value(ptr %sk.i4, !161, !DIExpression(), !207)
    #dbg_value(ptr %coins.i.i2, !162, !DIExpression(), !207)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i3, ptr noundef nonnull %sk.i4, ptr noundef nonnull %coins.i.i2) #4, !dbg !209
  %add.ptr.i.i8 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 1536, !dbg !210
  %call.i3.i9 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i8, ptr noundef nonnull %pk.i3, i32 noundef 1568) #5, !dbg !211
  %add.ptr2.i.i10 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 3104, !dbg !212
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i10, ptr noundef nonnull %pk.i3, i32 noundef 1568) #4, !dbg !212
  %add.ptr4.i.i11 = getelementptr inbounds nuw i8, ptr %sk.i4, i32 3136, !dbg !213
  %add.ptr5.i.i12 = getelementptr inbounds nuw i8, ptr %coins.i.i2, i32 32, !dbg !214
  %call6.i.i13 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i11, ptr noundef nonnull %add.ptr5.i.i12, i32 noundef 32) #5, !dbg !215
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i.i2), !dbg !216
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !217
    #dbg_value(ptr %ct.i5, !174, !DIExpression(), !219)
    #dbg_value(ptr %key_b.i7, !176, !DIExpression(), !219)
    #dbg_value(ptr %pk.i3, !177, !DIExpression(), !219)
    #dbg_declare(ptr %coins.i1.i1, !178, !DIExpression(), !220)
  call void @randombytes(ptr noundef nonnull %coins.i1.i1, i32 noundef 32) #4, !dbg !217
  %call.i2.i14 = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef nonnull %ct.i5, ptr noundef nonnull %key_b.i7, ptr noundef nonnull %pk.i3, ptr noundef nonnull %coins.i1.i1) #4, !dbg !221
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i1.i1), !dbg !222
  call void @randombytes(ptr noundef nonnull %sk.i4, i32 noundef 3168) #4, !dbg !223
  %call10.i = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %ct.i5, ptr noundef nonnull %sk.i4) #4, !dbg !224
  %call13.i15 = call i32 @memcmp(ptr noundef nonnull %key_a.i6, ptr noundef nonnull %key_b.i7, i32 noundef 32) #5, !dbg !225
  %tobool.not.i16 = icmp eq i32 %call13.i15, 0, !dbg !225
  br i1 %tobool.not.i16, label %if.then.i18, label %test_invalid_sk_a.exit, !dbg !227

if.then.i18:                                      ; preds = %test_keys.exit
  %call14.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #5, !dbg !228
  br label %test_invalid_sk_a.exit, !dbg !230

test_invalid_sk_a.exit:                           ; preds = %test_keys.exit, %if.then.i18
  %retval.0.i17 = phi i32 [ 1, %if.then.i18 ], [ 0, %test_keys.exit ], !dbg !231
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %pk.i3), !dbg !232
  call void @llvm.lifetime.end.p0(i64 3168, ptr nonnull %sk.i4), !dbg !232
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %ct.i5), !dbg !232
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i6), !dbg !232
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i7), !dbg !232
    #dbg_value(i32 %or, !190, !DIExpression(), !110)
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %pk.i20), !dbg !233
  call void @llvm.lifetime.start.p0(i64 3168, ptr nonnull %sk.i21), !dbg !233
  call void @llvm.lifetime.start.p0(i64 1568, ptr nonnull %ct.i22), !dbg !233
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_a.i23), !dbg !233
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %key_b.i24), !dbg !233
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %b.i), !dbg !233
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %pos.i), !dbg !233
    #dbg_declare(ptr %pk.i20, !236, !DIExpression(), !237)
    #dbg_declare(ptr %sk.i21, !238, !DIExpression(), !239)
    #dbg_declare(ptr %ct.i22, !240, !DIExpression(), !241)
    #dbg_declare(ptr %key_a.i23, !242, !DIExpression(), !243)
    #dbg_declare(ptr %key_b.i24, !244, !DIExpression(), !245)
  br label %do.body.i, !dbg !233

do.body.i:                                        ; preds = %do.body.i, %test_invalid_sk_a.exit
    #dbg_value(ptr %b.i, !246, !DIExpression(DW_OP_deref), !247)
  call void @randombytes(ptr noundef nonnull %b.i, i32 noundef 1) #4, !dbg !248
  %0 = load i8, ptr %b.i, align 1, !dbg !250
    #dbg_value(i8 %0, !246, !DIExpression(), !247)
  %tobool.not.i25 = icmp eq i8 %0, 0, !dbg !251
  br i1 %tobool.not.i25, label %do.body.i, label %do.end.i, !dbg !252, !llvm.loop !253

do.end.i:                                         ; preds = %do.body.i
  %or = or i32 %retval.0.i, %retval.0.i17, !dbg !256
    #dbg_value(ptr %pos.i, !257, !DIExpression(DW_OP_deref), !247)
  call void @randombytes(ptr noundef nonnull %pos.i, i32 noundef 4) #4, !dbg !258
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %coins.i2.i), !dbg !259
    #dbg_value(ptr %pk.i20, !145, !DIExpression(), !261)
    #dbg_value(ptr %sk.i21, !147, !DIExpression(), !261)
    #dbg_declare(ptr %coins.i2.i, !148, !DIExpression(), !262)
  call void @randombytes(ptr noundef nonnull %coins.i2.i, i32 noundef 64) #4, !dbg !259
    #dbg_value(ptr %pk.i20, !153, !DIExpression(), !263)
    #dbg_value(ptr %sk.i21, !161, !DIExpression(), !263)
    #dbg_value(ptr %coins.i2.i, !162, !DIExpression(), !263)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef nonnull %pk.i20, ptr noundef nonnull %sk.i21, ptr noundef nonnull %coins.i2.i) #4, !dbg !265
  %add.ptr.i.i26 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 1536, !dbg !266
  %call.i4.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i.i26, ptr noundef nonnull %pk.i20, i32 noundef 1568) #5, !dbg !267
  %add.ptr2.i.i27 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 3104, !dbg !268
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i.i27, ptr noundef nonnull %pk.i20, i32 noundef 1568) #4, !dbg !268
  %add.ptr4.i.i28 = getelementptr inbounds nuw i8, ptr %sk.i21, i32 3136, !dbg !269
  %add.ptr5.i.i29 = getelementptr inbounds nuw i8, ptr %coins.i2.i, i32 32, !dbg !270
  %call6.i.i30 = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i.i28, ptr noundef nonnull %add.ptr5.i.i29, i32 noundef 32) #5, !dbg !271
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %coins.i2.i), !dbg !272
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !273
    #dbg_value(ptr %ct.i22, !174, !DIExpression(), !275)
    #dbg_value(ptr %key_b.i24, !176, !DIExpression(), !275)
    #dbg_value(ptr %pk.i20, !177, !DIExpression(), !275)
    #dbg_declare(ptr %coins.i.i19, !178, !DIExpression(), !276)
  call void @randombytes(ptr noundef nonnull %coins.i.i19, i32 noundef 32) #4, !dbg !273
  %call.i.i = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef nonnull %ct.i22, ptr noundef nonnull %key_b.i24, ptr noundef nonnull %pk.i20, ptr noundef nonnull %coins.i.i19) #4, !dbg !277
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %coins.i.i19), !dbg !278
  %1 = load i8, ptr %b.i, align 1, !dbg !279
    #dbg_value(i8 %1, !246, !DIExpression(), !247)
  %2 = load i32, ptr %pos.i, align 4, !dbg !280
    #dbg_value(i32 %2, !257, !DIExpression(), !247)
  %rem.i = urem i32 %2, 1568, !dbg !281
  %arrayidx.i = getelementptr inbounds nuw [1568 x i8], ptr %ct.i22, i32 0, i32 %rem.i, !dbg !282
  %3 = load i8, ptr %arrayidx.i, align 1, !dbg !283
  %xor1.i = xor i8 %3, %1, !dbg !283
  store i8 %xor1.i, ptr %arrayidx.i, align 1, !dbg !283
  %call11.i = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %ct.i22, ptr noundef nonnull %sk.i21) #4, !dbg !284
  %call14.i31 = call i32 @memcmp(ptr noundef nonnull %key_a.i23, ptr noundef nonnull %key_b.i24, i32 noundef 32) #5, !dbg !285
  %tobool15.not.i = icmp eq i32 %call14.i31, 0, !dbg !285
  br i1 %tobool15.not.i, label %if.then.i33, label %test_invalid_ciphertext.exit, !dbg !287

if.then.i33:                                      ; preds = %do.end.i
  %call16.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #5, !dbg !288
  br label %test_invalid_ciphertext.exit, !dbg !290

test_invalid_ciphertext.exit:                     ; preds = %do.end.i, %if.then.i33
  %retval.0.i32 = phi i32 [ 1, %if.then.i33 ], [ 0, %do.end.i ], !dbg !247
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %pk.i20), !dbg !291
  call void @llvm.lifetime.end.p0(i64 3168, ptr nonnull %sk.i21), !dbg !291
  call void @llvm.lifetime.end.p0(i64 1568, ptr nonnull %ct.i22), !dbg !291
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_a.i23), !dbg !291
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %key_b.i24), !dbg !291
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %b.i), !dbg !291
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %pos.i), !dbg !291
  %or3 = or i32 %or, %retval.0.i32, !dbg !292
    #dbg_value(i32 %or3, !190, !DIExpression(), !110)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !293
  br i1 %tobool.not, label %for.inc, label %return.loopexit, !dbg !293

for.inc:                                          ; preds = %test_invalid_ciphertext.exit
  %inc = add nuw nsw i32 %i.0, 1, !dbg !295
    #dbg_value(i32 %inc, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 3168) #5, !dbg !299
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 1568) #5, !dbg !300
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 1568) #5, !dbg !301
  br label %return, !dbg !302

return.loopexit:                                  ; preds = %test_invalid_ciphertext.exit
  br label %return, !dbg !303

return:                                           ; preds = %return.loopexit, %for.end
  %retval.0 = phi i32 [ 0, %for.end ], [ 1, %return.loopexit ], !dbg !110
  ret i32 %retval.0, !dbg !303
}

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !304, !DIExpression(), !305)
    #dbg_value(i32 %outlen, !306, !DIExpression(), !305)
  br label %while.cond, !dbg !307

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !308
  %cmp = icmp eq i32 %0, -1, !dbg !309
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !307

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !310

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.6, i32 noundef 0) #5, !dbg !311
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !313
  %cmp1 = icmp eq i32 %call, -1, !dbg !314
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !316

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #5, !dbg !317
  %1 = load i32, ptr %call2, align 4, !dbg !317
  %cmp3 = icmp eq i32 %1, 4, !dbg !318
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !316

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !319
  %cmp4 = icmp eq i32 %2, -1, !dbg !321
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !321

if.then5:                                         ; preds = %if.else
  call void @abort() #5, !dbg !322
  br label %if.end6, !dbg !322

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !307

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !308, !llvm.loop !323

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !304, !DIExpression(), !305)
    #dbg_value(i32 %outlen.addr.0.ph, !306, !DIExpression(), !305)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !325
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !310

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !326
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #5, !dbg !328
    #dbg_value(i32 %call10, !329, !DIExpression(), !305)
  %cond = icmp eq i32 %call10, -1, !dbg !334
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !334

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #5, !dbg !336
  %4 = load i32, ptr %call13, align 4, !dbg !336
  %cmp14 = icmp eq i32 %4, 4, !dbg !337
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !334, !llvm.loop !338

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !328
  call void @abort() #5, !dbg !340
  br label %if.end20, !dbg !340

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !328
  br label %if.end20, !dbg !342

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !342
    #dbg_value(ptr %add.ptr, !304, !DIExpression(), !305)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !343
    #dbg_value(i32 %sub, !306, !DIExpression(), !305)
  br label %while.cond7.outer, !dbg !310, !llvm.loop !338

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !310

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !344
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !154 {
entry:
    #dbg_value(ptr %pk, !153, !DIExpression(), !345)
    #dbg_value(ptr %sk, !161, !DIExpression(), !345)
    #dbg_value(ptr %coins, !162, !DIExpression(), !345)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #4, !dbg !346
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !347
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #5, !dbg !348
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !349
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #4, !dbg !349
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !350
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !351
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #5, !dbg !352
  ret i32 0, !dbg !353
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !118 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !145, !DIExpression(), !354)
    #dbg_value(ptr %sk, !147, !DIExpression(), !354)
    #dbg_declare(ptr %coins, !148, !DIExpression(), !355)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #4, !dbg !356
    #dbg_value(ptr %pk, !153, !DIExpression(), !357)
    #dbg_value(ptr %sk, !161, !DIExpression(), !357)
    #dbg_value(ptr %coins, !162, !DIExpression(), !357)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #4, !dbg !359
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !360
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef %pk, i32 noundef 1568) #5, !dbg !361
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !362
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2.i, ptr noundef %pk, i32 noundef 1568) #4, !dbg !362
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !363
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !364
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %add.ptr5.i, i32 noundef 32) #5, !dbg !365
  ret i32 0, !dbg !366
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !367 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !370, !DIExpression(), !371)
    #dbg_value(ptr %ss, !372, !DIExpression(), !371)
    #dbg_value(ptr %pk, !373, !DIExpression(), !371)
    #dbg_value(ptr %coins, !374, !DIExpression(), !371)
    #dbg_declare(ptr %buf, !375, !DIExpression(), !376)
    #dbg_declare(ptr %kr, !377, !DIExpression(), !378)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !379
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !380
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !380
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !381
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !382
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #4, !dbg !383
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #5, !dbg !384
  ret i32 0, !dbg !385
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !172 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !174, !DIExpression(), !386)
    #dbg_value(ptr %ss, !176, !DIExpression(), !386)
    #dbg_value(ptr %pk, !177, !DIExpression(), !386)
    #dbg_declare(ptr %coins, !178, !DIExpression(), !387)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #4, !dbg !388
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #4, !dbg !389
  ret i32 0, !dbg !390
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !391 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !394, !DIExpression(), !395)
    #dbg_value(ptr %ct, !396, !DIExpression(), !395)
    #dbg_value(ptr %sk, !397, !DIExpression(), !395)
    #dbg_declare(ptr %buf, !398, !DIExpression(), !399)
    #dbg_declare(ptr %kr, !400, !DIExpression(), !401)
    #dbg_declare(ptr %cmp, !402, !DIExpression(), !403)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !404
    #dbg_value(ptr %add.ptr, !405, !DIExpression(), !395)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #4, !dbg !406
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !407
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !408
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #5, !dbg !409
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #4, !dbg !410
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !411
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #4, !dbg !412
    #dbg_value(ptr %ct, !413, !DIExpression(), !418)
    #dbg_value(ptr %cmp, !420, !DIExpression(), !418)
    #dbg_value(i32 1568, !421, !DIExpression(), !418)
    #dbg_value(i8 0, !422, !DIExpression(), !418)
    #dbg_value(i32 0, !423, !DIExpression(), !418)
  br label %for.cond.i, !dbg !424

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ], !dbg !426
  %r.0.i = phi i8 [ 0, %entry ], [ %or2.i, %for.inc.i ], !dbg !418
    #dbg_value(i8 %r.0.i, !422, !DIExpression(), !418)
    #dbg_value(i32 %i.0.i, !423, !DIExpression(), !418)
  %exitcond = icmp ne i32 %i.0.i, 1568, !dbg !427
  br i1 %exitcond, label %for.inc.i, label %pqcrystals_kyber1024_ref_verify.exit, !dbg !429

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !418)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %ct, i32 %i.0.i, !dbg !430
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !430
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %cmp, i32 %i.0.i, !dbg !431
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !431
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %0, i8 %1), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !418)
  %xor1.i = xor i8 %0, %1, !dbg !432
    #dbg_value(!DIArgList(i8 %r.0.i, i8 %xor1.i), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !418)
  %or2.i = or i8 %r.0.i, %xor1.i, !dbg !433
    #dbg_value(i8 %or2.i, !422, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !418)
    #dbg_value(i8 %or2.i, !422, !DIExpression(), !418)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !434
    #dbg_value(i32 %inc.i, !423, !DIExpression(), !418)
  br label %for.cond.i, !dbg !435, !llvm.loop !436

pqcrystals_kyber1024_ref_verify.exit:             ; preds = %for.cond.i
  %r.0.i.lcssa = phi i8 [ %r.0.i, %for.cond.i ], !dbg !418
  %.not = icmp eq i8 %r.0.i.lcssa, 0, !dbg !438
    #dbg_value(i1 %.not, !439, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !395)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !440
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #4, !dbg !440
  %conv = zext i1 %.not to i8, !dbg !441
    #dbg_value(ptr %ss, !442, !DIExpression(), !446)
    #dbg_value(ptr %kr, !448, !DIExpression(), !446)
    #dbg_value(i32 32, !449, !DIExpression(), !446)
    #dbg_value(i8 %conv, !450, !DIExpression(), !446)
  %2 = call i8 asm "", "=r,0"(i8 %conv) #6, !dbg !451, !srcloc !452
    #dbg_value(i8 %2, !450, !DIExpression(), !446)
  %sub.i = sub i8 0, %2, !dbg !453
    #dbg_value(i8 %sub.i, !450, !DIExpression(), !446)
    #dbg_value(i32 0, !454, !DIExpression(), !446)
  br label %for.cond.i1, !dbg !455

for.cond.i1:                                      ; preds = %for.body.i, %pqcrystals_kyber1024_ref_verify.exit
  %i.0.i2 = phi i32 [ 0, %pqcrystals_kyber1024_ref_verify.exit ], [ %inc.i6, %for.body.i ], !dbg !457
    #dbg_value(i32 %i.0.i2, !454, !DIExpression(), !446)
  %exitcond7 = icmp ne i32 %i.0.i2, 32, !dbg !458
  br i1 %exitcond7, label %for.body.i, label %pqcrystals_kyber1024_ref_cmov.exit, !dbg !460

for.body.i:                                       ; preds = %for.cond.i1
  %arrayidx.i4 = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !461
  %3 = load i8, ptr %arrayidx.i4, align 1, !dbg !461
  %arrayidx5.i = getelementptr inbounds nuw i8, ptr %kr, i32 %i.0.i2, !dbg !462
  %4 = load i8, ptr %arrayidx5.i, align 1, !dbg !462
  %xor1.i5 = xor i8 %3, %4, !dbg !463
  %and2.i = and i8 %xor1.i5, %sub.i, !dbg !464
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %ss, i32 %i.0.i2, !dbg !465
  %xor93.i = xor i8 %3, %and2.i, !dbg !466
  store i8 %xor93.i, ptr %arrayidx7.i, align 1, !dbg !466
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !467
    #dbg_value(i32 %inc.i6, !454, !DIExpression(), !446)
  br label %for.cond.i1, !dbg !468, !llvm.loop !469

pqcrystals_kyber1024_ref_cmov.exit:               ; preds = %for.cond.i1
  ret i32 0, !dbg !471
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !472 {
entry:
  %extseed.i1 = alloca [34 x i8], align 1
  %extseed.i = alloca [34 x i8], align 1
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !493, !DIExpression(), !494)
    #dbg_value(ptr %seed, !495, !DIExpression(), !494)
    #dbg_value(i32 %transposed, !496, !DIExpression(), !494)
    #dbg_declare(ptr %buf, !497, !DIExpression(), !501)
    #dbg_declare(ptr %state, !502, !DIExpression(), !514)
    #dbg_value(i32 0, !515, !DIExpression(), !494)
  br label %for.cond, !dbg !516

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !518
    #dbg_value(i32 %i.0, !515, !DIExpression(), !494)
  %exitcond39 = icmp ne i32 %i.0, 4, !dbg !519
  br i1 %exitcond39, label %for.cond1.preheader, label %for.end22, !dbg !521

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !522

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !525
    #dbg_value(i32 %j.0, !526, !DIExpression(), !494)
  %exitcond38 = icmp ne i32 %j.0, 4, !dbg !527
  br i1 %exitcond38, label %for.body3, label %for.inc20, !dbg !522

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !529
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !529

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !532
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !532
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i), !dbg !533
    #dbg_value(ptr %state, !545, !DIExpression(), !546)
    #dbg_value(ptr %seed, !547, !DIExpression(), !546)
    #dbg_value(i8 %conv, !548, !DIExpression(), !546)
    #dbg_value(i8 %conv4, !549, !DIExpression(), !546)
    #dbg_declare(ptr %extseed.i, !550, !DIExpression(), !554)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extseed.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !533
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 32, !dbg !555
  store i8 %conv, ptr %arrayidx.i, align 1, !dbg !556
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %extseed.i, i32 33, !dbg !557
  store i8 %conv4, ptr %arrayidx1.i, align 1, !dbg !558
    #dbg_value(ptr %state, !559, !DIExpression(), !569)
    #dbg_value(ptr %extseed.i, !571, !DIExpression(), !569)
    #dbg_value(i32 34, !572, !DIExpression(), !569)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !573
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !574
  store i32 168, ptr %pos.i.i, align 8, !dbg !575
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i), !dbg !576
  br label %if.end, !dbg !532

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !577
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !577
  call void @llvm.lifetime.start.p0(i64 34, ptr nonnull %extseed.i1), !dbg !578
    #dbg_value(ptr %state, !545, !DIExpression(), !580)
    #dbg_value(ptr %seed, !547, !DIExpression(), !580)
    #dbg_value(i8 %conv5, !548, !DIExpression(), !580)
    #dbg_value(i8 %conv6, !549, !DIExpression(), !580)
    #dbg_declare(ptr %extseed.i1, !550, !DIExpression(), !581)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extseed.i1, ptr noundef %seed, i32 noundef 32) #5, !dbg !578
  %arrayidx.i3 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 32, !dbg !582
  store i8 %conv5, ptr %arrayidx.i3, align 1, !dbg !583
  %arrayidx1.i4 = getelementptr inbounds nuw i8, ptr %extseed.i1, i32 33, !dbg !584
  store i8 %conv6, ptr %arrayidx1.i4, align 1, !dbg !585
    #dbg_value(ptr %state, !559, !DIExpression(), !586)
    #dbg_value(ptr %extseed.i1, !571, !DIExpression(), !586)
    #dbg_value(i32 34, !572, !DIExpression(), !586)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef nonnull %extseed.i1, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !588
  %pos.i.i5 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !589
  store i32 168, ptr %pos.i.i5, align 8, !dbg !590
  call void @llvm.lifetime.end.p0(i64 34, ptr nonnull %extseed.i1), !dbg !591
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
    #dbg_value(ptr %buf, !592, !DIExpression(), !596)
    #dbg_value(i32 3, !598, !DIExpression(), !596)
    #dbg_value(ptr %state, !599, !DIExpression(), !596)
    #dbg_value(ptr %buf, !600, !DIExpression(), !605)
    #dbg_value(i32 3, !607, !DIExpression(), !605)
    #dbg_value(ptr %state, !608, !DIExpression(), !605)
    #dbg_value(i32 168, !609, !DIExpression(), !605)
  br label %while.cond.i, !dbg !610

while.cond.i:                                     ; preds = %for.end.i, %if.end
  %nblocks.addr.0.i = phi i32 [ 3, %if.end ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %buf, %if.end ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !600, !DIExpression(), !605)
    #dbg_value(i32 %nblocks.addr.0.i, !607, !DIExpression(), !605)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !610
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !610

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !611
    #dbg_value(i32 0, !613, !DIExpression(), !605)
  br label %for.cond.i, !dbg !614

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !616
    #dbg_value(i32 %i.0.i, !613, !DIExpression(), !605)
  %exitcond35 = icmp ne i32 %i.0.i, 21, !dbg !617
  br i1 %exitcond35, label %for.body.i, label %for.end.i, !dbg !619

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !620
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !621
  %arrayidx.i6 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !622
  %0 = load i64, ptr %arrayidx.i6, align 8, !dbg !622
    #dbg_value(ptr %add.ptr.i, !623, !DIExpression(), !627)
    #dbg_value(i64 %0, !629, !DIExpression(), !627)
    #dbg_value(i32 0, !630, !DIExpression(), !627)
  br label %for.cond.i.i, !dbg !631

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !633
    #dbg_value(i32 %i.0.i.i, !630, !DIExpression(), !627)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !634
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !636

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !637
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !638
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !638
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !639
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !640
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !641
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !642
    #dbg_value(i32 %inc.i.i, !630, !DIExpression(), !627)
  br label %for.cond.i.i, !dbg !643, !llvm.loop !644

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !646
    #dbg_value(i32 %inc.i, !613, !DIExpression(), !605)
  br label %for.cond.i, !dbg !647, !llvm.loop !648

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !650
    #dbg_value(ptr %add.ptr1.i, !600, !DIExpression(), !605)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !651
    #dbg_value(i32 %sub.i, !607, !DIExpression(), !605)
  br label %while.cond.i, !dbg !610, !llvm.loop !652

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
    #dbg_value(i32 504, !654, !DIExpression(), !494)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !655
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !655
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #4, !dbg !656
    #dbg_value(i32 %call, !657, !DIExpression(), !494)
  br label %while.cond, !dbg !658

while.cond:                                       ; preds = %keccak_squeezeblocks.exit34, %keccak_squeezeblocks.exit
  %ctr.0 = phi i32 [ %call, %keccak_squeezeblocks.exit ], [ %add, %keccak_squeezeblocks.exit34 ], !dbg !659
    #dbg_value(i32 %ctr.0, !657, !DIExpression(), !494)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !660
  br i1 %cmp10, label %while.cond.i7.preheader, label %for.inc, !dbg !658

while.cond.i7.preheader:                          ; preds = %while.cond
  br label %while.cond.i7, !dbg !661

while.cond.i7:                                    ; preds = %while.cond.i7.preheader, %for.end.i15
  %nblocks.addr.0.i8 = phi i32 [ %sub.i17, %for.end.i15 ], [ 1, %while.cond.i7.preheader ]
  %out.addr.0.i9 = phi ptr [ %add.ptr1.i16, %for.end.i15 ], [ %buf, %while.cond.i7.preheader ]
    #dbg_value(ptr %out.addr.0.i9, !600, !DIExpression(), !665)
    #dbg_value(i32 %nblocks.addr.0.i8, !607, !DIExpression(), !665)
  %tobool.not.i10 = icmp eq i32 %nblocks.addr.0.i8, 0, !dbg !661
  br i1 %tobool.not.i10, label %keccak_squeezeblocks.exit34, label %while.body.i11, !dbg !661

while.body.i11:                                   ; preds = %while.cond.i7
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !666
    #dbg_value(i32 0, !613, !DIExpression(), !665)
  br label %for.cond.i12, !dbg !667

for.cond.i12:                                     ; preds = %store64.exit.i25, %while.body.i11
  %i.0.i13 = phi i32 [ 0, %while.body.i11 ], [ %inc.i26, %store64.exit.i25 ], !dbg !668
    #dbg_value(i32 %i.0.i13, !613, !DIExpression(), !665)
  %exitcond37 = icmp ne i32 %i.0.i13, 21, !dbg !669
  br i1 %exitcond37, label %for.body.i18, label %for.end.i15, !dbg !670

for.body.i18:                                     ; preds = %for.cond.i12
  %mul.i19 = shl nuw nsw i32 %i.0.i13, 3, !dbg !671
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 %mul.i19, !dbg !672
  %arrayidx.i21 = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i13, !dbg !673
  %1 = load i64, ptr %arrayidx.i21, align 8, !dbg !673
    #dbg_value(ptr %add.ptr.i20, !623, !DIExpression(), !674)
    #dbg_value(i64 %1, !629, !DIExpression(), !674)
    #dbg_value(i32 0, !630, !DIExpression(), !674)
  br label %for.cond.i.i22, !dbg !676

for.cond.i.i22:                                   ; preds = %for.body.i.i27, %for.body.i18
  %i.0.i.i23 = phi i32 [ 0, %for.body.i18 ], [ %inc.i.i33, %for.body.i.i27 ], !dbg !677
    #dbg_value(i32 %i.0.i.i23, !630, !DIExpression(), !674)
  %exitcond36 = icmp ne i32 %i.0.i.i23, 8, !dbg !678
  br i1 %exitcond36, label %for.body.i.i27, label %store64.exit.i25, !dbg !679

for.body.i.i27:                                   ; preds = %for.cond.i.i22
  %mul.i.i28 = shl nuw nsw i32 %i.0.i.i23, 3, !dbg !680
  %sh_prom.i.i29 = zext nneg i32 %mul.i.i28 to i64, !dbg !681
  %shr.i.i30 = lshr i64 %1, %sh_prom.i.i29, !dbg !681
  %conv.i.i31 = trunc i64 %shr.i.i30 to i8, !dbg !682
  %arrayidx.i.i32 = getelementptr inbounds nuw i8, ptr %add.ptr.i20, i32 %i.0.i.i23, !dbg !683
  store i8 %conv.i.i31, ptr %arrayidx.i.i32, align 1, !dbg !684
  %inc.i.i33 = add nuw nsw i32 %i.0.i.i23, 1, !dbg !685
    #dbg_value(i32 %inc.i.i33, !630, !DIExpression(), !674)
  br label %for.cond.i.i22, !dbg !686, !llvm.loop !687

store64.exit.i25:                                 ; preds = %for.cond.i.i22
  %inc.i26 = add nuw nsw i32 %i.0.i13, 1, !dbg !689
    #dbg_value(i32 %inc.i26, !613, !DIExpression(), !665)
  br label %for.cond.i12, !dbg !690, !llvm.loop !691

for.end.i15:                                      ; preds = %for.cond.i12
  %add.ptr1.i16 = getelementptr inbounds nuw i8, ptr %out.addr.0.i9, i32 168, !dbg !693
    #dbg_value(ptr %add.ptr1.i16, !600, !DIExpression(), !665)
  %sub.i17 = add nsw i32 %nblocks.addr.0.i8, -1, !dbg !694
    #dbg_value(i32 %sub.i17, !607, !DIExpression(), !665)
  br label %while.cond.i7, !dbg !661, !llvm.loop !695

keccak_squeezeblocks.exit34:                      ; preds = %while.cond.i7
    #dbg_value(i32 168, !654, !DIExpression(), !494)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !697
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !697
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !698
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !699
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #4, !dbg !700
  %add = add i32 %ctr.0, %call19, !dbg !701
    #dbg_value(i32 %add, !657, !DIExpression(), !494)
  br label %while.cond, !dbg !658, !llvm.loop !702

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !704
    #dbg_value(i32 %inc, !526, !DIExpression(), !494)
  br label %for.cond1, !dbg !705, !llvm.loop !706

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !708
    #dbg_value(i32 %inc21, !515, !DIExpression(), !494)
  br label %for.cond, !dbg !709, !llvm.loop !710

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !712
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !713 {
entry:
    #dbg_value(ptr %r, !717, !DIExpression(), !718)
    #dbg_value(i32 %len, !719, !DIExpression(), !718)
    #dbg_value(ptr %buf, !720, !DIExpression(), !718)
    #dbg_value(i32 %buflen, !721, !DIExpression(), !718)
    #dbg_value(i32 0, !722, !DIExpression(), !718)
    #dbg_value(i32 0, !723, !DIExpression(), !718)
  br label %while.cond, !dbg !724

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !718
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !718
    #dbg_value(i32 %pos.0, !722, !DIExpression(), !718)
    #dbg_value(i32 %ctr.0, !723, !DIExpression(), !718)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !725
  %add = add i32 %pos.0, 3, !dbg !726
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !726
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !726
  br i1 %0, label %while.body, label %while.end, !dbg !724

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !727
  %1 = load i8, ptr %arrayidx, align 1, !dbg !727
  %conv = zext i8 %1 to i16, !dbg !727
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !729
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !729
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !729
  %conv6 = zext i8 %3 to i16, !dbg !730
  %shl = shl nuw i16 %conv6, 8, !dbg !731
  %shl.masked = and i16 %shl, 3840, !dbg !732
  %and = or disjoint i16 %shl.masked, %conv, !dbg !732
    #dbg_value(i16 %and, !733, !DIExpression(), !718)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !734
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !734
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !734
  %6 = lshr i8 %5, 4, !dbg !735
  %shr11 = zext nneg i8 %6 to i16, !dbg !735
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !736
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !736
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !736
  %conv15 = zext i8 %8 to i16, !dbg !737
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !738
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !739
    #dbg_value(i16 %or17, !740, !DIExpression(), !718)
  %add20 = add i32 %pos.0, 3, !dbg !741
    #dbg_value(i32 %add20, !722, !DIExpression(), !718)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !742
  br i1 %cmp22, label %if.then, label %if.end, !dbg !742

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !744
    #dbg_value(i32 %inc, !723, !DIExpression(), !718)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !745
  store i16 %and, ptr %arrayidx24, align 2, !dbg !746
  br label %if.end, !dbg !745

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !718
    #dbg_value(i32 %ctr.1, !723, !DIExpression(), !718)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !747
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !749
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !749

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !750
    #dbg_value(i32 %inc31, !723, !DIExpression(), !718)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !751
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !752
  br label %if.end33, !dbg !751

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !753
    #dbg_value(i32 %ctr.2, !723, !DIExpression(), !718)
  br label %while.cond, !dbg !724, !llvm.loop !754

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !718
  ret i32 %ctr.0.lcssa, !dbg !756
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !757 {
entry:
  %state.i50 = alloca %struct.keccak_state, align 8
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i3 = alloca [33 x i8], align 1
  %extkey.i = alloca [33 x i8], align 1
  %buf.i1 = alloca [128 x i8], align 1
  %buf.i = alloca [128 x i8], align 1
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !760, !DIExpression(), !761)
    #dbg_value(ptr %sk, !762, !DIExpression(), !761)
    #dbg_value(ptr %coins, !763, !DIExpression(), !761)
    #dbg_declare(ptr %buf, !764, !DIExpression(), !765)
    #dbg_value(ptr %buf, !766, !DIExpression(), !761)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !767
    #dbg_value(ptr %add.ptr, !768, !DIExpression(), !761)
    #dbg_value(i8 0, !769, !DIExpression(), !761)
    #dbg_declare(ptr %a, !770, !DIExpression(), !772)
    #dbg_declare(ptr %e, !773, !DIExpression(), !774)
    #dbg_declare(ptr %pkpv, !775, !DIExpression(), !776)
    #dbg_declare(ptr %skpv, !777, !DIExpression(), !778)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #5, !dbg !779
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !780
  store i8 4, ptr %arrayidx, align 1, !dbg !781
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #4, !dbg !782
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #4, !dbg !783
    #dbg_value(i32 0, !784, !DIExpression(), !761)
  br label %for.cond, !dbg !785

for.cond:                                         ; preds = %keccak_squeeze.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %keccak_squeeze.exit ], !dbg !787
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %keccak_squeeze.exit ], !dbg !761
    #dbg_value(i8 %nonce.0, !769, !DIExpression(), !761)
    #dbg_value(i32 %i.0, !784, !DIExpression(), !761)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !788
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !790

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !791

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !769, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !761)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !793
    #dbg_value(ptr %arrayidx6, !804, !DIExpression(), !805)
    #dbg_value(ptr %add.ptr, !806, !DIExpression(), !805)
    #dbg_value(i8 %nonce.0, !807, !DIExpression(), !805)
    #dbg_declare(ptr %buf.i, !808, !DIExpression(), !810)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i3), !dbg !811
    #dbg_value(ptr %buf.i, !816, !DIExpression(), !817)
    #dbg_value(i32 128, !818, !DIExpression(), !817)
    #dbg_value(ptr %add.ptr, !819, !DIExpression(), !817)
    #dbg_value(i8 %nonce.0, !820, !DIExpression(), !817)
    #dbg_declare(ptr %extkey.i3, !821, !DIExpression(), !825)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i3, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !811
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %extkey.i3, i32 32, !dbg !826
  store i8 %nonce.0, ptr %arrayidx.i5, align 1, !dbg !827
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i50), !dbg !828
    #dbg_value(ptr %buf.i, !835, !DIExpression(), !836)
    #dbg_value(i32 128, !837, !DIExpression(), !836)
    #dbg_value(ptr %extkey.i3, !838, !DIExpression(), !836)
    #dbg_value(i32 33, !839, !DIExpression(), !836)
    #dbg_declare(ptr %state.i50, !840, !DIExpression(), !841)
    #dbg_value(ptr %state.i50, !842, !DIExpression(), !843)
    #dbg_value(ptr %extkey.i3, !844, !DIExpression(), !843)
    #dbg_value(i32 33, !845, !DIExpression(), !843)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i50, i32 noundef 136, ptr noundef nonnull %extkey.i3, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !828
  %pos.i.i51 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !846
  store i32 136, ptr %pos.i.i51, align 8, !dbg !847
    #dbg_value(i32 0, !848, !DIExpression(), !836)
    #dbg_value(ptr %buf.i, !849, !DIExpression(), !851)
    #dbg_value(i32 0, !853, !DIExpression(), !851)
    #dbg_value(ptr %state.i50, !854, !DIExpression(), !851)
    #dbg_value(ptr %buf.i, !600, !DIExpression(), !855)
    #dbg_value(i32 0, !607, !DIExpression(), !855)
    #dbg_value(ptr %state.i50, !608, !DIExpression(), !855)
    #dbg_value(i32 136, !609, !DIExpression(), !855)
    #dbg_value(ptr %buf.i, !600, !DIExpression(), !855)
    #dbg_value(i32 0, !607, !DIExpression(), !855)
    #dbg_value(i32 128, !837, !DIExpression(), !836)
    #dbg_value(ptr %buf.i, !835, !DIExpression(), !836)
    #dbg_value(ptr %buf.i, !857, !DIExpression(), !859)
    #dbg_value(i32 128, !861, !DIExpression(), !859)
    #dbg_value(ptr %state.i50, !862, !DIExpression(), !859)
  %pos.i1.i53 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !863
  %0 = load i32, ptr %pos.i1.i53, align 8, !dbg !863
    #dbg_value(ptr %buf.i, !864, !DIExpression(), !868)
    #dbg_value(i32 128, !870, !DIExpression(), !868)
    #dbg_value(ptr %state.i50, !871, !DIExpression(), !868)
    #dbg_value(i32 %0, !872, !DIExpression(), !868)
    #dbg_value(i32 136, !873, !DIExpression(), !868)
  br label %while.cond.i137, !dbg !874

while.cond.i137:                                  ; preds = %for.end.i145, %for.body
  %pos.addr.0.i = phi i32 [ %0, %for.body ], [ %i.0.i143.lcssa, %for.end.i145 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.body ], [ %sub3.i, %for.end.i145 ]
  %out.addr.0.i138 = phi ptr [ %buf.i, %for.body ], [ %out.addr.1.i.lcssa, %for.end.i145 ]
    #dbg_value(ptr %out.addr.0.i138, !864, !DIExpression(), !868)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !868)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !868)
  %tobool.not.i139 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !874
  br i1 %tobool.not.i139, label %keccak_squeeze.exit, label %while.body.i140, !dbg !874

while.body.i140:                                  ; preds = %while.cond.i137
  %cmp.i141 = icmp eq i32 %pos.addr.0.i, 136, !dbg !875
  br i1 %cmp.i141, label %if.then.i, label %if.end.i, !dbg !875

if.then.i:                                        ; preds = %while.body.i140
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i50) #4, !dbg !878
    #dbg_value(i32 0, !872, !DIExpression(), !868)
  br label %if.end.i, !dbg !880

if.end.i:                                         ; preds = %if.then.i, %while.body.i140
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i140 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !868)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !868)
  br label %for.cond.i142, !dbg !882

for.cond.i142:                                    ; preds = %for.body.i146, %if.end.i
  %i.0.i143 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i150, %for.body.i146 ], !dbg !884
  %out.addr.1.i = phi ptr [ %out.addr.0.i138, %if.end.i ], [ %incdec.ptr.i, %for.body.i146 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !868)
    #dbg_value(i32 %i.0.i143, !881, !DIExpression(), !868)
  %cmp1.i = icmp ult i32 %i.0.i143, 136, !dbg !885
  %add.i144 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !887
  %cmp2.i = icmp ult i32 %i.0.i143, %add.i144, !dbg !887
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !887
  br i1 %1, label %for.body.i146, label %for.end.i145, !dbg !888

for.body.i146:                                    ; preds = %for.cond.i142
  %div1.i = lshr i32 %i.0.i143, 3, !dbg !889
  %arrayidx.i147 = getelementptr inbounds nuw i64, ptr %state.i50, i32 %div1.i, !dbg !890
  %2 = load i64, ptr %arrayidx.i147, align 8, !dbg !890
  %rem.i = shl nuw nsw i32 %i.0.i143, 3, !dbg !891
  %mul.i148 = and i32 %rem.i, 56, !dbg !891
  %sh_prom.i = zext nneg i32 %mul.i148 to i64, !dbg !892
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !892
  %conv.i149 = trunc i64 %shr.i to i8, !dbg !890
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !868)
  store i8 %conv.i149, ptr %out.addr.1.i, align 1, !dbg !893
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !894
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !868)
  %inc.i150 = add nuw nsw i32 %i.0.i143, 1, !dbg !895
    #dbg_value(i32 %inc.i150, !881, !DIExpression(), !868)
  br label %for.cond.i142, !dbg !896, !llvm.loop !897

for.end.i145:                                     ; preds = %for.cond.i142
  %i.0.i143.lcssa = phi i32 [ %i.0.i143, %for.cond.i142 ], !dbg !884
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i142 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i143.lcssa, !dbg !899
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !900
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !868)
    #dbg_value(i32 %i.0.i143.lcssa, !872, !DIExpression(), !868)
  br label %while.cond.i137, !dbg !874, !llvm.loop !901

keccak_squeeze.exit:                              ; preds = %while.cond.i137
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i137 ]
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !903
  %pos1.i.i55 = getelementptr inbounds nuw i8, ptr %state.i50, i32 200, !dbg !904
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i55, align 8, !dbg !905
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i50), !dbg !906
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i3), !dbg !907
    #dbg_value(ptr %arrayidx6, !908, !DIExpression(), !918)
    #dbg_value(ptr %buf.i, !920, !DIExpression(), !918)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %buf.i) #4, !dbg !921
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !922
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !923
    #dbg_value(i8 %inc, !769, !DIExpression(), !761)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !924
    #dbg_value(i32 %inc7, !784, !DIExpression(), !761)
  br label %for.cond, !dbg !925, !llvm.loop !926

for.cond8:                                        ; preds = %for.cond8.preheader, %keccak_squeeze.exit180
  %i.1 = phi i32 [ %inc15, %keccak_squeeze.exit180 ], [ 0, %for.cond8.preheader ], !dbg !928
  %nonce.1 = phi i8 [ %inc13, %keccak_squeeze.exit180 ], [ 4, %for.cond8.preheader ], !dbg !761
    #dbg_value(i8 %nonce.1, !769, !DIExpression(), !761)
    #dbg_value(i32 %i.1, !784, !DIExpression(), !761)
  %exitcond181 = icmp ne i32 %i.1, 4, !dbg !929
  br i1 %exitcond181, label %for.body10, label %for.cond.i13.preheader, !dbg !791

for.cond.i13.preheader:                           ; preds = %for.cond8
  br label %for.cond.i13, !dbg !931

for.body10:                                       ; preds = %for.cond8
    #dbg_value(i8 %nonce.1, !769, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !761)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !948
    #dbg_value(ptr %arrayidx12, !804, !DIExpression(), !950)
    #dbg_value(ptr %add.ptr, !806, !DIExpression(), !950)
    #dbg_value(i8 %nonce.1, !807, !DIExpression(), !950)
    #dbg_declare(ptr %buf.i1, !808, !DIExpression(), !951)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !952
    #dbg_value(ptr %buf.i1, !816, !DIExpression(), !954)
    #dbg_value(i32 128, !818, !DIExpression(), !954)
    #dbg_value(ptr %add.ptr, !819, !DIExpression(), !954)
    #dbg_value(i8 %nonce.1, !820, !DIExpression(), !954)
    #dbg_declare(ptr %extkey.i, !821, !DIExpression(), !955)
  %call.i2 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef nonnull %add.ptr, i32 noundef 32) #5, !dbg !952
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !956
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !957
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !958
    #dbg_value(ptr %buf.i1, !835, !DIExpression(), !961)
    #dbg_value(i32 128, !837, !DIExpression(), !961)
    #dbg_value(ptr %extkey.i, !838, !DIExpression(), !961)
    #dbg_value(i32 33, !839, !DIExpression(), !961)
    #dbg_declare(ptr %state.i, !840, !DIExpression(), !962)
    #dbg_value(ptr %state.i, !842, !DIExpression(), !963)
    #dbg_value(ptr %extkey.i, !844, !DIExpression(), !963)
    #dbg_value(i32 33, !845, !DIExpression(), !963)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !958
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !964
  store i32 136, ptr %pos.i.i, align 8, !dbg !965
    #dbg_value(i32 0, !848, !DIExpression(), !961)
    #dbg_value(ptr %buf.i1, !849, !DIExpression(), !966)
    #dbg_value(i32 0, !853, !DIExpression(), !966)
    #dbg_value(ptr %state.i, !854, !DIExpression(), !966)
    #dbg_value(ptr %buf.i1, !600, !DIExpression(), !968)
    #dbg_value(i32 0, !607, !DIExpression(), !968)
    #dbg_value(ptr %state.i, !608, !DIExpression(), !968)
    #dbg_value(i32 136, !609, !DIExpression(), !968)
    #dbg_value(ptr %buf.i1, !600, !DIExpression(), !968)
    #dbg_value(i32 0, !607, !DIExpression(), !968)
    #dbg_value(i32 128, !837, !DIExpression(), !961)
    #dbg_value(ptr %buf.i1, !835, !DIExpression(), !961)
    #dbg_value(ptr %buf.i1, !857, !DIExpression(), !970)
    #dbg_value(i32 128, !861, !DIExpression(), !970)
    #dbg_value(ptr %state.i, !862, !DIExpression(), !970)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !972
  %3 = load i32, ptr %pos.i1.i, align 8, !dbg !972
    #dbg_value(ptr %buf.i1, !864, !DIExpression(), !973)
    #dbg_value(i32 128, !870, !DIExpression(), !973)
    #dbg_value(ptr %state.i, !871, !DIExpression(), !973)
    #dbg_value(i32 %3, !872, !DIExpression(), !973)
    #dbg_value(i32 136, !873, !DIExpression(), !973)
  br label %while.cond.i151, !dbg !975

while.cond.i151:                                  ; preds = %for.end.i166, %for.body10
  %pos.addr.0.i152 = phi i32 [ %3, %for.body10 ], [ %i.0.i161.lcssa, %for.end.i166 ]
  %outlen.addr.0.i153 = phi i32 [ 128, %for.body10 ], [ %sub3.i168, %for.end.i166 ]
  %out.addr.0.i154 = phi ptr [ %buf.i1, %for.body10 ], [ %out.addr.1.i162.lcssa, %for.end.i166 ]
    #dbg_value(ptr %out.addr.0.i154, !864, !DIExpression(), !973)
    #dbg_value(i32 %outlen.addr.0.i153, !870, !DIExpression(), !973)
    #dbg_value(i32 %pos.addr.0.i152, !872, !DIExpression(), !973)
  %tobool.not.i155 = icmp eq i32 %outlen.addr.0.i153, 0, !dbg !975
  br i1 %tobool.not.i155, label %keccak_squeeze.exit180, label %while.body.i156, !dbg !975

while.body.i156:                                  ; preds = %while.cond.i151
  %cmp.i157 = icmp eq i32 %pos.addr.0.i152, 136, !dbg !976
  br i1 %cmp.i157, label %if.then.i179, label %if.end.i158, !dbg !976

if.then.i179:                                     ; preds = %while.body.i156
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !977
    #dbg_value(i32 0, !872, !DIExpression(), !973)
  br label %if.end.i158, !dbg !978

if.end.i158:                                      ; preds = %if.then.i179, %while.body.i156
  %pos.addr.1.i159 = phi i32 [ 0, %if.then.i179 ], [ %pos.addr.0.i152, %while.body.i156 ]
    #dbg_value(i32 %pos.addr.1.i159, !872, !DIExpression(), !973)
    #dbg_value(i32 %pos.addr.1.i159, !881, !DIExpression(), !973)
  br label %for.cond.i160, !dbg !979

for.cond.i160:                                    ; preds = %for.body.i169, %if.end.i158
  %i.0.i161 = phi i32 [ %pos.addr.1.i159, %if.end.i158 ], [ %inc.i178, %for.body.i169 ], !dbg !980
  %out.addr.1.i162 = phi ptr [ %out.addr.0.i154, %if.end.i158 ], [ %incdec.ptr.i177, %for.body.i169 ]
    #dbg_value(ptr %out.addr.1.i162, !864, !DIExpression(), !973)
    #dbg_value(i32 %i.0.i161, !881, !DIExpression(), !973)
  %cmp1.i163 = icmp ult i32 %i.0.i161, 136, !dbg !981
  %add.i164 = add i32 %pos.addr.1.i159, %outlen.addr.0.i153, !dbg !982
  %cmp2.i165 = icmp ult i32 %i.0.i161, %add.i164, !dbg !982
  %4 = select i1 %cmp1.i163, i1 %cmp2.i165, i1 false, !dbg !982
  br i1 %4, label %for.body.i169, label %for.end.i166, !dbg !983

for.body.i169:                                    ; preds = %for.cond.i160
  %div1.i170 = lshr i32 %i.0.i161, 3, !dbg !984
  %arrayidx.i171 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i170, !dbg !985
  %5 = load i64, ptr %arrayidx.i171, align 8, !dbg !985
  %rem.i172 = shl nuw nsw i32 %i.0.i161, 3, !dbg !986
  %mul.i173 = and i32 %rem.i172, 56, !dbg !986
  %sh_prom.i174 = zext nneg i32 %mul.i173 to i64, !dbg !987
  %shr.i175 = lshr i64 %5, %sh_prom.i174, !dbg !987
  %conv.i176 = trunc i64 %shr.i175 to i8, !dbg !985
    #dbg_value(ptr %out.addr.1.i162, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !973)
  store i8 %conv.i176, ptr %out.addr.1.i162, align 1, !dbg !988
  %incdec.ptr.i177 = getelementptr inbounds nuw i8, ptr %out.addr.1.i162, i32 1, !dbg !989
    #dbg_value(ptr %incdec.ptr.i177, !864, !DIExpression(), !973)
  %inc.i178 = add nuw nsw i32 %i.0.i161, 1, !dbg !990
    #dbg_value(i32 %inc.i178, !881, !DIExpression(), !973)
  br label %for.cond.i160, !dbg !991, !llvm.loop !992

for.end.i166:                                     ; preds = %for.cond.i160
  %i.0.i161.lcssa = phi i32 [ %i.0.i161, %for.cond.i160 ], !dbg !980
  %out.addr.1.i162.lcssa = phi ptr [ %out.addr.1.i162, %for.cond.i160 ]
  %sub.neg.i167 = sub i32 %pos.addr.1.i159, %i.0.i161.lcssa, !dbg !994
  %sub3.i168 = add i32 %sub.neg.i167, %outlen.addr.0.i153, !dbg !995
    #dbg_value(i32 %sub3.i168, !870, !DIExpression(), !973)
    #dbg_value(i32 %i.0.i161.lcssa, !872, !DIExpression(), !973)
  br label %while.cond.i151, !dbg !975, !llvm.loop !996

keccak_squeeze.exit180:                           ; preds = %while.cond.i151
  %pos.addr.0.i152.lcssa = phi i32 [ %pos.addr.0.i152, %while.cond.i151 ]
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !998
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !999
  store i32 %pos.addr.0.i152.lcssa, ptr %pos1.i.i, align 8, !dbg !1000
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1001
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1002
    #dbg_value(ptr %arrayidx12, !908, !DIExpression(), !1003)
    #dbg_value(ptr %buf.i1, !920, !DIExpression(), !1003)
  call fastcc void @cbd2(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %buf.i1) #4, !dbg !1005
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !1006
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !1007
    #dbg_value(i8 %inc13, !769, !DIExpression(), !761)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !1008
    #dbg_value(i32 %inc15, !784, !DIExpression(), !761)
  br label %for.cond8, !dbg !1009, !llvm.loop !1010

for.cond.i13:                                     ; preds = %for.cond.i13.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit88
  %i.0.i14 = phi i32 [ %inc.i18, %pqcrystals_kyber1024_ref_poly_reduce.exit88 ], [ 0, %for.cond.i13.preheader ], !dbg !1012
    #dbg_value(i32 %i.0.i14, !1013, !DIExpression(), !1014)
  %exitcond183 = icmp ne i32 %i.0.i14, 4, !dbg !1015
  br i1 %exitcond183, label %for.body.i16, label %for.cond.i7.preheader, !dbg !931

for.cond.i7.preheader:                            ; preds = %for.cond.i13
  br label %for.cond.i7, !dbg !1017

for.body.i16:                                     ; preds = %for.cond.i13
  %arrayidx.i17 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i14, !dbg !1019
    #dbg_value(ptr %arrayidx.i17, !1020, !DIExpression(), !1024)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i17) #4, !dbg !1026
    #dbg_value(ptr %arrayidx.i17, !1027, !DIExpression(), !1029)
    #dbg_value(i32 0, !1031, !DIExpression(), !1029)
  br label %for.cond.i76, !dbg !1032

for.cond.i76:                                     ; preds = %for.body.i79, %for.body.i16
  %i.0.i77 = phi i32 [ 0, %for.body.i16 ], [ %inc.i87, %for.body.i79 ], !dbg !1034
    #dbg_value(i32 %i.0.i77, !1031, !DIExpression(), !1029)
  %exitcond182 = icmp ne i32 %i.0.i77, 256, !dbg !1035
  br i1 %exitcond182, label %for.body.i79, label %pqcrystals_kyber1024_ref_poly_reduce.exit88, !dbg !1037

for.body.i79:                                     ; preds = %for.cond.i76
  %arrayidx.i80 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !1038
  %6 = load i16, ptr %arrayidx.i80, align 2, !dbg !1038
    #dbg_value(i16 %6, !1039, !DIExpression(), !1044)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1044)
  %conv.i.i81 = sext i16 %6 to i32, !dbg !1047
  %mul.i.i82 = mul nsw i32 %conv.i.i81, 20159, !dbg !1048
  %add.i.i83 = add nsw i32 %mul.i.i82, 33554432, !dbg !1049
  %shr.i.i84 = ashr i32 %add.i.i83, 26, !dbg !1050
    #dbg_value(i32 %shr.i.i84, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1044)
    #dbg_value(i32 %shr.i.i84, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1044)
  %7 = trunc nsw i32 %shr.i.i84 to i16, !dbg !1052
  %8 = mul i16 %7, -3329, !dbg !1052
  %conv7.i.i85 = add i16 %8, %6, !dbg !1052
  %arrayidx2.i86 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i17, i32 0, i32 %i.0.i77, !dbg !1053
  store i16 %conv7.i.i85, ptr %arrayidx2.i86, align 2, !dbg !1054
  %inc.i87 = add nuw nsw i32 %i.0.i77, 1, !dbg !1055
    #dbg_value(i32 %inc.i87, !1031, !DIExpression(), !1029)
  br label %for.cond.i76, !dbg !1056, !llvm.loop !1057

pqcrystals_kyber1024_ref_poly_reduce.exit88:      ; preds = %for.cond.i76
  %inc.i18 = add nuw nsw i32 %i.0.i14, 1, !dbg !1059
    #dbg_value(i32 %inc.i18, !1013, !DIExpression(), !1014)
  br label %for.cond.i13, !dbg !1060, !llvm.loop !1061

for.cond.i7:                                      ; preds = %for.cond.i7.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit75
  %i.0.i8 = phi i32 [ %inc.i12, %pqcrystals_kyber1024_ref_poly_reduce.exit75 ], [ 0, %for.cond.i7.preheader ], !dbg !1063
    #dbg_value(i32 %i.0.i8, !1013, !DIExpression(), !1064)
  %exitcond185 = icmp ne i32 %i.0.i8, 4, !dbg !1065
  br i1 %exitcond185, label %for.body.i10, label %for.cond17.preheader, !dbg !1017

for.cond17.preheader:                             ; preds = %for.cond.i7
  br label %for.cond17, !dbg !1066

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.0.i8, !dbg !1068
    #dbg_value(ptr %arrayidx.i11, !1020, !DIExpression(), !1069)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i11) #4, !dbg !1071
    #dbg_value(ptr %arrayidx.i11, !1027, !DIExpression(), !1072)
    #dbg_value(i32 0, !1031, !DIExpression(), !1072)
  br label %for.cond.i63, !dbg !1074

for.cond.i63:                                     ; preds = %for.body.i66, %for.body.i10
  %i.0.i64 = phi i32 [ 0, %for.body.i10 ], [ %inc.i74, %for.body.i66 ], !dbg !1075
    #dbg_value(i32 %i.0.i64, !1031, !DIExpression(), !1072)
  %exitcond184 = icmp ne i32 %i.0.i64, 256, !dbg !1076
  br i1 %exitcond184, label %for.body.i66, label %pqcrystals_kyber1024_ref_poly_reduce.exit75, !dbg !1077

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i64, !dbg !1078
  %9 = load i16, ptr %arrayidx.i67, align 2, !dbg !1078
    #dbg_value(i16 %9, !1039, !DIExpression(), !1079)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1079)
  %conv.i.i68 = sext i16 %9 to i32, !dbg !1081
  %mul.i.i69 = mul nsw i32 %conv.i.i68, 20159, !dbg !1082
  %add.i.i70 = add nsw i32 %mul.i.i69, 33554432, !dbg !1083
  %shr.i.i71 = ashr i32 %add.i.i70, 26, !dbg !1084
    #dbg_value(i32 %shr.i.i71, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1079)
    #dbg_value(i32 %shr.i.i71, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1079)
  %10 = trunc nsw i32 %shr.i.i71 to i16, !dbg !1085
  %11 = mul i16 %10, -3329, !dbg !1085
  %conv7.i.i72 = add i16 %11, %9, !dbg !1085
  %arrayidx2.i73 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i64, !dbg !1086
  store i16 %conv7.i.i72, ptr %arrayidx2.i73, align 2, !dbg !1087
  %inc.i74 = add nuw nsw i32 %i.0.i64, 1, !dbg !1088
    #dbg_value(i32 %inc.i74, !1031, !DIExpression(), !1072)
  br label %for.cond.i63, !dbg !1089, !llvm.loop !1090

pqcrystals_kyber1024_ref_poly_reduce.exit75:      ; preds = %for.cond.i63
  %inc.i12 = add nuw nsw i32 %i.0.i8, 1, !dbg !1092
    #dbg_value(i32 %inc.i12, !1013, !DIExpression(), !1064)
  br label %for.cond.i7, !dbg !1093, !llvm.loop !1094

for.cond17:                                       ; preds = %for.cond17.preheader, %pqcrystals_kyber1024_ref_poly_tomont.exit
  %i.2 = phi i32 [ %inc26, %pqcrystals_kyber1024_ref_poly_tomont.exit ], [ 0, %for.cond17.preheader ], !dbg !1096
    #dbg_value(i32 %i.2, !784, !DIExpression(), !761)
  %exitcond187 = icmp ne i32 %i.2, 4, !dbg !1097
  br i1 %exitcond187, label %for.body19, label %for.cond.i27.preheader, !dbg !1066

for.cond.i27.preheader:                           ; preds = %for.cond17
  br label %for.cond.i27, !dbg !1099

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1107
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !1109
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #4, !dbg !1110
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !1111
    #dbg_value(ptr %arrayidx24, !1112, !DIExpression(), !1114)
    #dbg_value(i16 1353, !1116, !DIExpression(), !1114)
    #dbg_value(i32 0, !1117, !DIExpression(), !1114)
  br label %for.cond.i89, !dbg !1118

for.cond.i89:                                     ; preds = %for.body.i92, %for.body19
  %i.0.i90 = phi i32 [ 0, %for.body19 ], [ %inc.i97, %for.body.i92 ], !dbg !1120
    #dbg_value(i32 %i.0.i90, !1117, !DIExpression(), !1114)
  %exitcond186 = icmp ne i32 %i.0.i90, 256, !dbg !1121
  br i1 %exitcond186, label %for.body.i92, label %pqcrystals_kyber1024_ref_poly_tomont.exit, !dbg !1123

for.body.i92:                                     ; preds = %for.cond.i89
  %arrayidx.i93 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1124
  %12 = load i16, ptr %arrayidx.i93, align 2, !dbg !1124
  %conv.i = sext i16 %12 to i32, !dbg !1125
  %mul.i94 = mul nsw i32 %conv.i, 1353, !dbg !1126
    #dbg_value(i32 %mul.i94, !1127, !DIExpression(), !1130)
    #dbg_value(i32 %mul.i94, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1130)
  %sext.i.i = mul i32 %conv.i, 1346961408, !dbg !1133
  %conv3.i.i = ashr exact i32 %sext.i.i, 16, !dbg !1133
  %mul4.neg.i.i = mul nsw i32 %conv3.i.i, -3329, !dbg !1134
  %sub.i.i = add nsw i32 %mul4.neg.i.i, %mul.i94, !dbg !1135
  %shr.i.i95 = lshr i32 %sub.i.i, 16, !dbg !1136
  %conv5.i.i = trunc nuw i32 %shr.i.i95 to i16, !dbg !1137
    #dbg_value(i16 %conv5.i.i, !1132, !DIExpression(), !1130)
  %arrayidx2.i96 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx24, i32 0, i32 %i.0.i90, !dbg !1138
  store i16 %conv5.i.i, ptr %arrayidx2.i96, align 2, !dbg !1139
  %inc.i97 = add nuw nsw i32 %i.0.i90, 1, !dbg !1140
    #dbg_value(i32 %inc.i97, !1117, !DIExpression(), !1114)
  br label %for.cond.i89, !dbg !1141, !llvm.loop !1142

pqcrystals_kyber1024_ref_poly_tomont.exit:        ; preds = %for.cond.i89
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !1144
    #dbg_value(i32 %inc26, !784, !DIExpression(), !761)
  br label %for.cond17, !dbg !1145, !llvm.loop !1146

for.cond.i27:                                     ; preds = %for.cond.i27.preheader, %pqcrystals_kyber1024_ref_poly_add.exit
  %i.0.i28 = phi i32 [ %inc.i32, %pqcrystals_kyber1024_ref_poly_add.exit ], [ 0, %for.cond.i27.preheader ], !dbg !1148
    #dbg_value(i32 %i.0.i28, !1149, !DIExpression(), !1150)
  %exitcond189 = icmp ne i32 %i.0.i28, 4, !dbg !1151
  br i1 %exitcond189, label %for.body.i30, label %for.cond.i.preheader, !dbg !1099

for.cond.i.preheader:                             ; preds = %for.cond.i27
  br label %for.cond.i, !dbg !1153

for.body.i30:                                     ; preds = %for.cond.i27
  %arrayidx.i31 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1157
  %arrayidx2.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i28, !dbg !1158
  %arrayidx4.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.0.i28, !dbg !1159
    #dbg_value(ptr %arrayidx.i31, !1160, !DIExpression(), !1166)
    #dbg_value(ptr %arrayidx2.i, !1168, !DIExpression(), !1166)
    #dbg_value(ptr %arrayidx4.i, !1169, !DIExpression(), !1166)
    #dbg_value(i32 0, !1170, !DIExpression(), !1166)
  br label %for.cond.i42, !dbg !1171

for.cond.i42:                                     ; preds = %for.body.i45, %for.body.i30
  %i.0.i43 = phi i32 [ 0, %for.body.i30 ], [ %inc.i48, %for.body.i45 ], !dbg !1173
    #dbg_value(i32 %i.0.i43, !1170, !DIExpression(), !1166)
  %exitcond188 = icmp ne i32 %i.0.i43, 256, !dbg !1174
  br i1 %exitcond188, label %for.body.i45, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !1176

for.body.i45:                                     ; preds = %for.cond.i42
  %arrayidx.i46 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i43, !dbg !1177
  %13 = load i16, ptr %arrayidx.i46, align 2, !dbg !1177
  %arrayidx2.i47 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i43, !dbg !1178
  %14 = load i16, ptr %arrayidx2.i47, align 2, !dbg !1178
  %add.i = add i16 %13, %14, !dbg !1179
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i31, i32 0, i32 %i.0.i43, !dbg !1180
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1181
  %inc.i48 = add nuw nsw i32 %i.0.i43, 1, !dbg !1182
    #dbg_value(i32 %inc.i48, !1170, !DIExpression(), !1166)
  br label %for.cond.i42, !dbg !1183, !llvm.loop !1184

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i42
  %inc.i32 = add nuw nsw i32 %i.0.i28, 1, !dbg !1186
    #dbg_value(i32 %inc.i32, !1149, !DIExpression(), !1150)
  br label %for.cond.i27, !dbg !1187, !llvm.loop !1188

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1190
    #dbg_value(i32 %i.0.i, !1191, !DIExpression(), !1192)
  %exitcond191 = icmp ne i32 %i.0.i, 4, !dbg !1193
  br i1 %exitcond191, label %for.body.i, label %for.cond.i33.preheader, !dbg !1153

for.cond.i33.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i33, !dbg !1195

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i, !dbg !1205
    #dbg_value(ptr %arrayidx.i6, !1027, !DIExpression(), !1206)
    #dbg_value(i32 0, !1031, !DIExpression(), !1206)
  br label %for.cond.i56, !dbg !1208

for.cond.i56:                                     ; preds = %for.body.i59, %for.body.i
  %i.0.i57 = phi i32 [ 0, %for.body.i ], [ %inc.i62, %for.body.i59 ], !dbg !1209
    #dbg_value(i32 %i.0.i57, !1031, !DIExpression(), !1206)
  %exitcond190 = icmp ne i32 %i.0.i57, 256, !dbg !1210
  br i1 %exitcond190, label %for.body.i59, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1211

for.body.i59:                                     ; preds = %for.cond.i56
  %arrayidx.i60 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i57, !dbg !1212
  %15 = load i16, ptr %arrayidx.i60, align 2, !dbg !1212
    #dbg_value(i16 %15, !1039, !DIExpression(), !1213)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1213)
  %conv.i.i = sext i16 %15 to i32, !dbg !1215
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1216
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1217
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1218
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1213)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1213)
  %16 = trunc nsw i32 %shr.i.i to i16, !dbg !1219
  %17 = mul i16 %16, -3329, !dbg !1219
  %conv7.i.i = add i16 %17, %15, !dbg !1219
  %arrayidx2.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i6, i32 0, i32 %i.0.i57, !dbg !1220
  store i16 %conv7.i.i, ptr %arrayidx2.i61, align 2, !dbg !1221
  %inc.i62 = add nuw nsw i32 %i.0.i57, 1, !dbg !1222
    #dbg_value(i32 %inc.i62, !1031, !DIExpression(), !1206)
  br label %for.cond.i56, !dbg !1223, !llvm.loop !1224

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i56
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1226
    #dbg_value(i32 %inc.i, !1191, !DIExpression(), !1192)
  br label %for.cond.i, !dbg !1227, !llvm.loop !1228

for.cond.i33:                                     ; preds = %for.cond.i33.preheader, %for.body.i36
  %i.0.i34 = phi i32 [ %inc.i40, %for.body.i36 ], [ 0, %for.cond.i33.preheader ], !dbg !1230
    #dbg_value(i32 %i.0.i34, !1231, !DIExpression(), !1232)
  %exitcond192 = icmp ne i32 %i.0.i34, 4, !dbg !1233
  br i1 %exitcond192, label %for.body.i36, label %for.cond.i20.preheader, !dbg !1195

for.cond.i20.preheader:                           ; preds = %for.cond.i33
  br label %for.cond.i20, !dbg !1235

for.body.i36:                                     ; preds = %for.cond.i33
  %mul.i37 = mul nuw nsw i32 %i.0.i34, 384, !dbg !1241
  %add.ptr.i38 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i37, !dbg !1242
  %arrayidx.i39 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i34, !dbg !1243
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr.i38, ptr noundef nonnull %arrayidx.i39) #4, !dbg !1244
  %inc.i40 = add nuw nsw i32 %i.0.i34, 1, !dbg !1245
    #dbg_value(i32 %inc.i40, !1231, !DIExpression(), !1232)
  br label %for.cond.i33, !dbg !1246, !llvm.loop !1247

for.cond.i20:                                     ; preds = %for.cond.i20.preheader, %for.body.i23
  %i.0.i21 = phi i32 [ %inc.i26, %for.body.i23 ], [ 0, %for.cond.i20.preheader ], !dbg !1249
    #dbg_value(i32 %i.0.i21, !1231, !DIExpression(), !1250)
  %exitcond193 = icmp ne i32 %i.0.i21, 4, !dbg !1251
  br i1 %exitcond193, label %for.body.i23, label %pqcrystals_kyber1024_ref_polyvec_tobytes.exit, !dbg !1235

for.body.i23:                                     ; preds = %for.cond.i20
  %mul.i = mul nuw nsw i32 %i.0.i21, 384, !dbg !1252
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1253
  %arrayidx.i25 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i21, !dbg !1254
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr.i24, ptr noundef nonnull %arrayidx.i25) #4, !dbg !1255
  %inc.i26 = add nuw nsw i32 %i.0.i21, 1, !dbg !1256
    #dbg_value(i32 %inc.i26, !1231, !DIExpression(), !1250)
  br label %for.cond.i20, !dbg !1257, !llvm.loop !1258

pqcrystals_kyber1024_ref_polyvec_tobytes.exit:    ; preds = %for.cond.i20
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1536, !dbg !1260
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %buf, i32 noundef 32) #5, !dbg !1261
  ret void, !dbg !1262
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !1263 {
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
  %at = alloca [4 x %struct.polyvec], align 2
  %b = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %k = alloca %struct.poly, align 2
  %epp = alloca %struct.poly, align 2
    #dbg_value(ptr %c, !1266, !DIExpression(), !1267)
    #dbg_value(ptr %m, !1268, !DIExpression(), !1267)
    #dbg_value(ptr %pk, !1269, !DIExpression(), !1267)
    #dbg_value(ptr %coins, !1270, !DIExpression(), !1267)
    #dbg_declare(ptr %seed, !1271, !DIExpression(), !1272)
    #dbg_value(i8 0, !1273, !DIExpression(), !1267)
    #dbg_declare(ptr %sp, !1274, !DIExpression(), !1275)
    #dbg_declare(ptr %pkpv, !1276, !DIExpression(), !1277)
    #dbg_declare(ptr %ep, !1278, !DIExpression(), !1279)
    #dbg_declare(ptr %at, !1280, !DIExpression(), !1281)
    #dbg_declare(ptr %b, !1282, !DIExpression(), !1283)
    #dbg_declare(ptr %v, !1284, !DIExpression(), !1285)
    #dbg_declare(ptr %k, !1286, !DIExpression(), !1287)
    #dbg_declare(ptr %epp, !1288, !DIExpression(), !1289)
    #dbg_value(ptr %pkpv, !1290, !DIExpression(), !1294)
    #dbg_value(ptr %seed, !1296, !DIExpression(), !1294)
    #dbg_value(ptr %pk, !1297, !DIExpression(), !1294)
    #dbg_value(ptr %pkpv, !1298, !DIExpression(), !1302)
    #dbg_value(ptr %pk, !1304, !DIExpression(), !1302)
    #dbg_value(i32 0, !1305, !DIExpression(), !1302)
  br label %for.cond.i30, !dbg !1306

for.cond.i30:                                     ; preds = %for.body.i33, %entry
  %i.0.i31 = phi i32 [ 0, %entry ], [ %inc.i36, %for.body.i33 ], !dbg !1308
    #dbg_value(i32 %i.0.i31, !1305, !DIExpression(), !1302)
  %exitcond = icmp ne i32 %i.0.i31, 4, !dbg !1309
  br i1 %exitcond, label %for.body.i33, label %pqcrystals_kyber1024_ref_polyvec_frombytes.exit, !dbg !1311

for.body.i33:                                     ; preds = %for.cond.i30
  %arrayidx.i34 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.0.i31, !dbg !1312
  %mul.i = mul nuw nsw i32 %i.0.i31, 384, !dbg !1313
  %add.ptr.i35 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul.i, !dbg !1314
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i34, ptr noundef %add.ptr.i35) #4, !dbg !1315
  %inc.i36 = add nuw nsw i32 %i.0.i31, 1, !dbg !1316
    #dbg_value(i32 %inc.i36, !1305, !DIExpression(), !1302)
  br label %for.cond.i30, !dbg !1317, !llvm.loop !1318

pqcrystals_kyber1024_ref_polyvec_frombytes.exit:  ; preds = %for.cond.i30
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %pk, i32 1536, !dbg !1320
  %call.i = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr.i, i32 noundef 32) #5, !dbg !1321
    #dbg_value(ptr %k, !1322, !DIExpression(), !1326)
    #dbg_value(ptr %m, !1328, !DIExpression(), !1326)
    #dbg_value(i32 0, !1329, !DIExpression(), !1326)
  br label %for.cond.i110, !dbg !1330

for.cond.i110:                                    ; preds = %for.inc9.i, %pqcrystals_kyber1024_ref_polyvec_frombytes.exit
  %i.0.i111 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_frombytes.exit ], [ %inc10.i, %for.inc9.i ], !dbg !1332
    #dbg_value(i32 %i.0.i111, !1329, !DIExpression(), !1326)
  %exitcond263 = icmp ne i32 %i.0.i111, 32, !dbg !1333
  br i1 %exitcond263, label %for.cond1.i.preheader, label %pqcrystals_kyber1024_ref_poly_frommsg.exit, !dbg !1335

for.cond1.i.preheader:                            ; preds = %for.cond.i110
  br label %for.cond1.i, !dbg !1336

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ %inc.i117, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1339
    #dbg_value(i32 %j.0.i, !1340, !DIExpression(), !1326)
  %exitcond262 = icmp ne i32 %j.0.i, 8, !dbg !1341
  br i1 %exitcond262, label %for.body3.i, label %for.inc9.i, !dbg !1336

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i113 = shl nuw nsw i32 %i.0.i111, 3, !dbg !1343
  %add.i114 = or disjoint i32 %mul.i113, %j.0.i, !dbg !1345
  %arrayidx.i115 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %add.i114, !dbg !1346
  store i16 0, ptr %arrayidx.i115, align 2, !dbg !1347
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i111, 4, !dbg !1348
  %add.ptr.i116 = getelementptr inbounds nuw i8, ptr %k, i32 %add.ptr.idx.i, !dbg !1348
  %add.ptr6.i = getelementptr inbounds nuw i16, ptr %add.ptr.i116, i32 %j.0.i, !dbg !1349
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i111, !dbg !1350
  %0 = load i8, ptr %arrayidx7.i, align 1, !dbg !1350
  %conv.i = zext i8 %0 to i32, !dbg !1350
    #dbg_value(ptr %add.ptr6.i, !1351, !DIExpression(), !1355)
    #dbg_value(i16 1665, !1357, !DIExpression(), !1355)
    #dbg_value(!DIArgList(i32 %conv.i, i32 %j.0.i), !1358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !1355)
    #dbg_value(!DIArgList(i16 0, i32 %conv.i, i32 %j.0.i), !1358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !1355)
  %1 = load i16, ptr %add.ptr6.i, align 2, !dbg !1359
  %2 = shl nuw nsw i32 1, %j.0.i, !dbg !1360
  %3 = and i32 %2, %conv.i, !dbg !1360
  %4 = icmp eq i32 %3, 0, !dbg !1360
  %xor6.i.i = select i1 %4, i16 %1, i16 1665, !dbg !1361
  store i16 %xor6.i.i, ptr %add.ptr6.i, align 2, !dbg !1361
  %inc.i117 = add nuw nsw i32 %j.0.i, 1, !dbg !1362
    #dbg_value(i32 %inc.i117, !1340, !DIExpression(), !1326)
  br label %for.cond1.i, !dbg !1363, !llvm.loop !1364

for.inc9.i:                                       ; preds = %for.cond1.i
  %inc10.i = add nuw nsw i32 %i.0.i111, 1, !dbg !1366
    #dbg_value(i32 %inc10.i, !1329, !DIExpression(), !1326)
  br label %for.cond.i110, !dbg !1367, !llvm.loop !1368

pqcrystals_kyber1024_ref_poly_frommsg.exit:       ; preds = %for.cond.i110
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #4, !dbg !1370
    #dbg_value(i32 0, !1371, !DIExpression(), !1267)
  br label %for.cond, !dbg !1372

for.cond:                                         ; preds = %keccak_squeeze.exit230, %pqcrystals_kyber1024_ref_poly_frommsg.exit
  %i.0 = phi i32 [ 0, %pqcrystals_kyber1024_ref_poly_frommsg.exit ], [ %inc4, %keccak_squeeze.exit230 ], !dbg !1374
  %nonce.0 = phi i8 [ 0, %pqcrystals_kyber1024_ref_poly_frommsg.exit ], [ %inc, %keccak_squeeze.exit230 ], !dbg !1267
    #dbg_value(i8 %nonce.0, !1273, !DIExpression(), !1267)
    #dbg_value(i32 %i.0, !1371, !DIExpression(), !1267)
  %exitcond264 = icmp ne i32 %i.0, 4, !dbg !1375
  br i1 %exitcond264, label %for.body, label %for.cond5.preheader, !dbg !1377

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !1378

for.body:                                         ; preds = %for.cond
    #dbg_value(i8 %nonce.0, !1273, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1267)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i1), !dbg !1380
    #dbg_value(ptr %add.ptr, !804, !DIExpression(), !1382)
    #dbg_value(ptr %coins, !806, !DIExpression(), !1382)
    #dbg_value(i8 %nonce.0, !807, !DIExpression(), !1382)
    #dbg_declare(ptr %buf.i1, !808, !DIExpression(), !1383)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1384
    #dbg_value(ptr %buf.i1, !816, !DIExpression(), !1386)
    #dbg_value(i32 128, !818, !DIExpression(), !1386)
    #dbg_value(ptr %coins, !819, !DIExpression(), !1386)
    #dbg_value(i8 %nonce.0, !820, !DIExpression(), !1386)
    #dbg_declare(ptr %extkey.i8, !821, !DIExpression(), !1387)
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %extkey.i8, ptr noundef %coins, i32 noundef 32) #5, !dbg !1384
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %extkey.i8, i32 32, !dbg !1388
  store i8 %nonce.0, ptr %arrayidx.i10, align 1, !dbg !1389
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i65), !dbg !1390
    #dbg_value(ptr %buf.i1, !835, !DIExpression(), !1393)
    #dbg_value(i32 128, !837, !DIExpression(), !1393)
    #dbg_value(ptr %extkey.i8, !838, !DIExpression(), !1393)
    #dbg_value(i32 33, !839, !DIExpression(), !1393)
    #dbg_declare(ptr %state.i65, !840, !DIExpression(), !1394)
    #dbg_value(ptr %state.i65, !842, !DIExpression(), !1395)
    #dbg_value(ptr %extkey.i8, !844, !DIExpression(), !1395)
    #dbg_value(i32 33, !845, !DIExpression(), !1395)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i65, i32 noundef 136, ptr noundef nonnull %extkey.i8, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1390
  %pos.i.i66 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1396
  store i32 136, ptr %pos.i.i66, align 8, !dbg !1397
    #dbg_value(i32 0, !848, !DIExpression(), !1393)
    #dbg_value(ptr %buf.i1, !849, !DIExpression(), !1398)
    #dbg_value(i32 0, !853, !DIExpression(), !1398)
    #dbg_value(ptr %state.i65, !854, !DIExpression(), !1398)
    #dbg_value(ptr %buf.i1, !600, !DIExpression(), !1400)
    #dbg_value(i32 0, !607, !DIExpression(), !1400)
    #dbg_value(ptr %state.i65, !608, !DIExpression(), !1400)
    #dbg_value(i32 136, !609, !DIExpression(), !1400)
    #dbg_value(ptr %buf.i1, !600, !DIExpression(), !1400)
    #dbg_value(i32 0, !607, !DIExpression(), !1400)
    #dbg_value(i32 128, !837, !DIExpression(), !1393)
    #dbg_value(ptr %buf.i1, !835, !DIExpression(), !1393)
    #dbg_value(ptr %buf.i1, !857, !DIExpression(), !1402)
    #dbg_value(i32 128, !861, !DIExpression(), !1402)
    #dbg_value(ptr %state.i65, !862, !DIExpression(), !1402)
  %pos.i1.i68 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1404
  %5 = load i32, ptr %pos.i1.i68, align 8, !dbg !1404
    #dbg_value(ptr %buf.i1, !864, !DIExpression(), !1405)
    #dbg_value(i32 128, !870, !DIExpression(), !1405)
    #dbg_value(ptr %state.i65, !871, !DIExpression(), !1405)
    #dbg_value(i32 %5, !872, !DIExpression(), !1405)
    #dbg_value(i32 136, !873, !DIExpression(), !1405)
  br label %while.cond.i201, !dbg !1407

while.cond.i201:                                  ; preds = %for.end.i216, %for.body
  %pos.addr.0.i202 = phi i32 [ %5, %for.body ], [ %i.0.i211.lcssa, %for.end.i216 ]
  %outlen.addr.0.i203 = phi i32 [ 128, %for.body ], [ %sub3.i218, %for.end.i216 ]
  %out.addr.0.i204 = phi ptr [ %buf.i1, %for.body ], [ %out.addr.1.i212.lcssa, %for.end.i216 ]
    #dbg_value(ptr %out.addr.0.i204, !864, !DIExpression(), !1405)
    #dbg_value(i32 %outlen.addr.0.i203, !870, !DIExpression(), !1405)
    #dbg_value(i32 %pos.addr.0.i202, !872, !DIExpression(), !1405)
  %tobool.not.i205 = icmp eq i32 %outlen.addr.0.i203, 0, !dbg !1407
  br i1 %tobool.not.i205, label %keccak_squeeze.exit230, label %while.body.i206, !dbg !1407

while.body.i206:                                  ; preds = %while.cond.i201
  %cmp.i207 = icmp eq i32 %pos.addr.0.i202, 136, !dbg !1408
  br i1 %cmp.i207, label %if.then.i229, label %if.end.i208, !dbg !1408

if.then.i229:                                     ; preds = %while.body.i206
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i65) #4, !dbg !1409
    #dbg_value(i32 0, !872, !DIExpression(), !1405)
  br label %if.end.i208, !dbg !1410

if.end.i208:                                      ; preds = %if.then.i229, %while.body.i206
  %pos.addr.1.i209 = phi i32 [ 0, %if.then.i229 ], [ %pos.addr.0.i202, %while.body.i206 ]
    #dbg_value(i32 %pos.addr.1.i209, !872, !DIExpression(), !1405)
    #dbg_value(i32 %pos.addr.1.i209, !881, !DIExpression(), !1405)
  br label %for.cond.i210, !dbg !1411

for.cond.i210:                                    ; preds = %for.body.i219, %if.end.i208
  %i.0.i211 = phi i32 [ %pos.addr.1.i209, %if.end.i208 ], [ %inc.i228, %for.body.i219 ], !dbg !1412
  %out.addr.1.i212 = phi ptr [ %out.addr.0.i204, %if.end.i208 ], [ %incdec.ptr.i227, %for.body.i219 ]
    #dbg_value(ptr %out.addr.1.i212, !864, !DIExpression(), !1405)
    #dbg_value(i32 %i.0.i211, !881, !DIExpression(), !1405)
  %cmp1.i213 = icmp ult i32 %i.0.i211, 136, !dbg !1413
  %add.i214 = add i32 %pos.addr.1.i209, %outlen.addr.0.i203, !dbg !1414
  %cmp2.i215 = icmp ult i32 %i.0.i211, %add.i214, !dbg !1414
  %6 = select i1 %cmp1.i213, i1 %cmp2.i215, i1 false, !dbg !1414
  br i1 %6, label %for.body.i219, label %for.end.i216, !dbg !1415

for.body.i219:                                    ; preds = %for.cond.i210
  %div1.i220 = lshr i32 %i.0.i211, 3, !dbg !1416
  %arrayidx.i221 = getelementptr inbounds nuw i64, ptr %state.i65, i32 %div1.i220, !dbg !1417
  %7 = load i64, ptr %arrayidx.i221, align 8, !dbg !1417
  %rem.i222 = shl nuw nsw i32 %i.0.i211, 3, !dbg !1418
  %mul.i223 = and i32 %rem.i222, 56, !dbg !1418
  %sh_prom.i224 = zext nneg i32 %mul.i223 to i64, !dbg !1419
  %shr.i225 = lshr i64 %7, %sh_prom.i224, !dbg !1419
  %conv.i226 = trunc i64 %shr.i225 to i8, !dbg !1417
    #dbg_value(ptr %out.addr.1.i212, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1405)
  store i8 %conv.i226, ptr %out.addr.1.i212, align 1, !dbg !1420
  %incdec.ptr.i227 = getelementptr inbounds nuw i8, ptr %out.addr.1.i212, i32 1, !dbg !1421
    #dbg_value(ptr %incdec.ptr.i227, !864, !DIExpression(), !1405)
  %inc.i228 = add nuw nsw i32 %i.0.i211, 1, !dbg !1422
    #dbg_value(i32 %inc.i228, !881, !DIExpression(), !1405)
  br label %for.cond.i210, !dbg !1423, !llvm.loop !1424

for.end.i216:                                     ; preds = %for.cond.i210
  %i.0.i211.lcssa = phi i32 [ %i.0.i211, %for.cond.i210 ], !dbg !1412
  %out.addr.1.i212.lcssa = phi ptr [ %out.addr.1.i212, %for.cond.i210 ]
  %sub.neg.i217 = sub i32 %pos.addr.1.i209, %i.0.i211.lcssa, !dbg !1426
  %sub3.i218 = add i32 %sub.neg.i217, %outlen.addr.0.i203, !dbg !1427
    #dbg_value(i32 %sub3.i218, !870, !DIExpression(), !1405)
    #dbg_value(i32 %i.0.i211.lcssa, !872, !DIExpression(), !1405)
  br label %while.cond.i201, !dbg !1407, !llvm.loop !1428

keccak_squeeze.exit230:                           ; preds = %while.cond.i201
  %pos.addr.0.i202.lcssa = phi i32 [ %pos.addr.0.i202, %while.cond.i201 ]
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !1430
  %pos1.i.i70 = getelementptr inbounds nuw i8, ptr %state.i65, i32 200, !dbg !1431
  store i32 %pos.addr.0.i202.lcssa, ptr %pos1.i.i70, align 8, !dbg !1432
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i65), !dbg !1433
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i8), !dbg !1434
    #dbg_value(ptr %add.ptr, !908, !DIExpression(), !1435)
    #dbg_value(ptr %buf.i1, !920, !DIExpression(), !1435)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr, ptr noundef nonnull %buf.i1) #4, !dbg !1437
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i1), !dbg !1438
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !1439
    #dbg_value(i8 %inc, !1273, !DIExpression(), !1267)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !1440
    #dbg_value(i32 %inc4, !1371, !DIExpression(), !1267)
  br label %for.cond, !dbg !1441, !llvm.loop !1442

for.cond5:                                        ; preds = %for.cond5.preheader, %keccak_squeeze.exit260
  %i.1 = phi i32 [ %inc13, %keccak_squeeze.exit260 ], [ 0, %for.cond5.preheader ], !dbg !1444
  %nonce.1 = phi i8 [ %inc11, %keccak_squeeze.exit260 ], [ 4, %for.cond5.preheader ], !dbg !1267
    #dbg_value(i8 %nonce.1, !1273, !DIExpression(), !1267)
    #dbg_value(i32 %i.1, !1371, !DIExpression(), !1267)
  %exitcond265 = icmp ne i32 %i.1, 4, !dbg !1445
  br i1 %exitcond265, label %for.body7, label %for.end14, !dbg !1378

for.body7:                                        ; preds = %for.cond5
    #dbg_value(i8 %nonce.1, !1273, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1267)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i2), !dbg !1447
    #dbg_value(ptr %add.ptr10, !1450, !DIExpression(), !1451)
    #dbg_value(ptr %coins, !1452, !DIExpression(), !1451)
    #dbg_value(i8 %nonce.1, !1453, !DIExpression(), !1451)
    #dbg_declare(ptr %buf.i2, !1454, !DIExpression(), !1455)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !1456
    #dbg_value(ptr %buf.i2, !816, !DIExpression(), !1458)
    #dbg_value(i32 128, !818, !DIExpression(), !1458)
    #dbg_value(ptr %coins, !819, !DIExpression(), !1458)
    #dbg_value(i8 %nonce.1, !820, !DIExpression(), !1458)
    #dbg_declare(ptr %extkey.i, !821, !DIExpression(), !1459)
  %call.i4 = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %coins, i32 noundef 32) #5, !dbg !1456
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !1460
  store i8 %nonce.1, ptr %arrayidx.i, align 1, !dbg !1461
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !1462
    #dbg_value(ptr %buf.i2, !835, !DIExpression(), !1465)
    #dbg_value(i32 128, !837, !DIExpression(), !1465)
    #dbg_value(ptr %extkey.i, !838, !DIExpression(), !1465)
    #dbg_value(i32 33, !839, !DIExpression(), !1465)
    #dbg_declare(ptr %state.i, !840, !DIExpression(), !1466)
    #dbg_value(ptr %state.i, !842, !DIExpression(), !1467)
    #dbg_value(ptr %extkey.i, !844, !DIExpression(), !1467)
    #dbg_value(i32 33, !845, !DIExpression(), !1467)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1462
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1468
  store i32 136, ptr %pos.i.i, align 8, !dbg !1469
    #dbg_value(i32 0, !848, !DIExpression(), !1465)
    #dbg_value(ptr %buf.i2, !849, !DIExpression(), !1470)
    #dbg_value(i32 0, !853, !DIExpression(), !1470)
    #dbg_value(ptr %state.i, !854, !DIExpression(), !1470)
    #dbg_value(ptr %buf.i2, !600, !DIExpression(), !1472)
    #dbg_value(i32 0, !607, !DIExpression(), !1472)
    #dbg_value(ptr %state.i, !608, !DIExpression(), !1472)
    #dbg_value(i32 136, !609, !DIExpression(), !1472)
    #dbg_value(ptr %buf.i2, !600, !DIExpression(), !1472)
    #dbg_value(i32 0, !607, !DIExpression(), !1472)
    #dbg_value(i32 128, !837, !DIExpression(), !1465)
    #dbg_value(ptr %buf.i2, !835, !DIExpression(), !1465)
    #dbg_value(ptr %buf.i2, !857, !DIExpression(), !1474)
    #dbg_value(i32 128, !861, !DIExpression(), !1474)
    #dbg_value(ptr %state.i, !862, !DIExpression(), !1474)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1476
  %8 = load i32, ptr %pos.i1.i, align 8, !dbg !1476
    #dbg_value(ptr %buf.i2, !864, !DIExpression(), !1477)
    #dbg_value(i32 128, !870, !DIExpression(), !1477)
    #dbg_value(ptr %state.i, !871, !DIExpression(), !1477)
    #dbg_value(i32 %8, !872, !DIExpression(), !1477)
    #dbg_value(i32 136, !873, !DIExpression(), !1477)
  br label %while.cond.i231, !dbg !1479

while.cond.i231:                                  ; preds = %for.end.i246, %for.body7
  %pos.addr.0.i232 = phi i32 [ %8, %for.body7 ], [ %i.0.i241.lcssa, %for.end.i246 ]
  %outlen.addr.0.i233 = phi i32 [ 128, %for.body7 ], [ %sub3.i248, %for.end.i246 ]
  %out.addr.0.i234 = phi ptr [ %buf.i2, %for.body7 ], [ %out.addr.1.i242.lcssa, %for.end.i246 ]
    #dbg_value(ptr %out.addr.0.i234, !864, !DIExpression(), !1477)
    #dbg_value(i32 %outlen.addr.0.i233, !870, !DIExpression(), !1477)
    #dbg_value(i32 %pos.addr.0.i232, !872, !DIExpression(), !1477)
  %tobool.not.i235 = icmp eq i32 %outlen.addr.0.i233, 0, !dbg !1479
  br i1 %tobool.not.i235, label %keccak_squeeze.exit260, label %while.body.i236, !dbg !1479

while.body.i236:                                  ; preds = %while.cond.i231
  %cmp.i237 = icmp eq i32 %pos.addr.0.i232, 136, !dbg !1480
  br i1 %cmp.i237, label %if.then.i259, label %if.end.i238, !dbg !1480

if.then.i259:                                     ; preds = %while.body.i236
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !1481
    #dbg_value(i32 0, !872, !DIExpression(), !1477)
  br label %if.end.i238, !dbg !1482

if.end.i238:                                      ; preds = %if.then.i259, %while.body.i236
  %pos.addr.1.i239 = phi i32 [ 0, %if.then.i259 ], [ %pos.addr.0.i232, %while.body.i236 ]
    #dbg_value(i32 %pos.addr.1.i239, !872, !DIExpression(), !1477)
    #dbg_value(i32 %pos.addr.1.i239, !881, !DIExpression(), !1477)
  br label %for.cond.i240, !dbg !1483

for.cond.i240:                                    ; preds = %for.body.i249, %if.end.i238
  %i.0.i241 = phi i32 [ %pos.addr.1.i239, %if.end.i238 ], [ %inc.i258, %for.body.i249 ], !dbg !1484
  %out.addr.1.i242 = phi ptr [ %out.addr.0.i234, %if.end.i238 ], [ %incdec.ptr.i257, %for.body.i249 ]
    #dbg_value(ptr %out.addr.1.i242, !864, !DIExpression(), !1477)
    #dbg_value(i32 %i.0.i241, !881, !DIExpression(), !1477)
  %cmp1.i243 = icmp ult i32 %i.0.i241, 136, !dbg !1485
  %add.i244 = add i32 %pos.addr.1.i239, %outlen.addr.0.i233, !dbg !1486
  %cmp2.i245 = icmp ult i32 %i.0.i241, %add.i244, !dbg !1486
  %9 = select i1 %cmp1.i243, i1 %cmp2.i245, i1 false, !dbg !1486
  br i1 %9, label %for.body.i249, label %for.end.i246, !dbg !1487

for.body.i249:                                    ; preds = %for.cond.i240
  %div1.i250 = lshr i32 %i.0.i241, 3, !dbg !1488
  %arrayidx.i251 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i250, !dbg !1489
  %10 = load i64, ptr %arrayidx.i251, align 8, !dbg !1489
  %rem.i252 = shl nuw nsw i32 %i.0.i241, 3, !dbg !1490
  %mul.i253 = and i32 %rem.i252, 56, !dbg !1490
  %sh_prom.i254 = zext nneg i32 %mul.i253 to i64, !dbg !1491
  %shr.i255 = lshr i64 %10, %sh_prom.i254, !dbg !1491
  %conv.i256 = trunc i64 %shr.i255 to i8, !dbg !1489
    #dbg_value(ptr %out.addr.1.i242, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1477)
  store i8 %conv.i256, ptr %out.addr.1.i242, align 1, !dbg !1492
  %incdec.ptr.i257 = getelementptr inbounds nuw i8, ptr %out.addr.1.i242, i32 1, !dbg !1493
    #dbg_value(ptr %incdec.ptr.i257, !864, !DIExpression(), !1477)
  %inc.i258 = add nuw nsw i32 %i.0.i241, 1, !dbg !1494
    #dbg_value(i32 %inc.i258, !881, !DIExpression(), !1477)
  br label %for.cond.i240, !dbg !1495, !llvm.loop !1496

for.end.i246:                                     ; preds = %for.cond.i240
  %i.0.i241.lcssa = phi i32 [ %i.0.i241, %for.cond.i240 ], !dbg !1484
  %out.addr.1.i242.lcssa = phi ptr [ %out.addr.1.i242, %for.cond.i240 ]
  %sub.neg.i247 = sub i32 %pos.addr.1.i239, %i.0.i241.lcssa, !dbg !1498
  %sub3.i248 = add i32 %sub.neg.i247, %outlen.addr.0.i233, !dbg !1499
    #dbg_value(i32 %sub3.i248, !870, !DIExpression(), !1477)
    #dbg_value(i32 %i.0.i241.lcssa, !872, !DIExpression(), !1477)
  br label %while.cond.i231, !dbg !1479, !llvm.loop !1500

keccak_squeeze.exit260:                           ; preds = %while.cond.i231
  %pos.addr.0.i232.lcssa = phi i32 [ %pos.addr.0.i232, %while.cond.i231 ]
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !1502
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !1503
  store i32 %pos.addr.0.i232.lcssa, ptr %pos1.i.i, align 8, !dbg !1504
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !1505
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !1506
    #dbg_value(ptr %add.ptr10, !1507, !DIExpression(), !1509)
    #dbg_value(ptr %buf.i2, !1511, !DIExpression(), !1509)
  call fastcc void @cbd2(ptr noundef nonnull %add.ptr10, ptr noundef nonnull %buf.i2) #4, !dbg !1512
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i2), !dbg !1513
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !1514
    #dbg_value(i8 %inc11, !1273, !DIExpression(), !1267)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !1515
    #dbg_value(i32 %inc13, !1371, !DIExpression(), !1267)
  br label %for.cond5, !dbg !1516, !llvm.loop !1517

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !1273, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1267)
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %buf.i), !dbg !1519
    #dbg_value(ptr %epp, !1450, !DIExpression(), !1521)
    #dbg_value(ptr %coins, !1452, !DIExpression(), !1521)
    #dbg_value(i8 8, !1453, !DIExpression(), !1521)
    #dbg_declare(ptr %buf.i, !1454, !DIExpression(), !1522)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1523
    #dbg_value(ptr %buf.i, !816, !DIExpression(), !1525)
    #dbg_value(i32 128, !818, !DIExpression(), !1525)
    #dbg_value(ptr %coins, !819, !DIExpression(), !1525)
    #dbg_value(i8 8, !820, !DIExpression(), !1525)
    #dbg_declare(ptr %extkey.i5, !821, !DIExpression(), !1526)
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %extkey.i5, ptr noundef %coins, i32 noundef 32) #5, !dbg !1523
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %extkey.i5, i32 32, !dbg !1527
  store i8 8, ptr %arrayidx.i7, align 1, !dbg !1528
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i71), !dbg !1529
    #dbg_value(ptr %buf.i, !835, !DIExpression(), !1532)
    #dbg_value(i32 128, !837, !DIExpression(), !1532)
    #dbg_value(ptr %extkey.i5, !838, !DIExpression(), !1532)
    #dbg_value(i32 33, !839, !DIExpression(), !1532)
    #dbg_declare(ptr %state.i71, !840, !DIExpression(), !1533)
    #dbg_value(ptr %state.i71, !842, !DIExpression(), !1534)
    #dbg_value(ptr %extkey.i5, !844, !DIExpression(), !1534)
    #dbg_value(i32 33, !845, !DIExpression(), !1534)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i71, i32 noundef 136, ptr noundef nonnull %extkey.i5, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !1529
  %pos.i.i72 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1535
  store i32 136, ptr %pos.i.i72, align 8, !dbg !1536
    #dbg_value(i32 0, !848, !DIExpression(), !1532)
    #dbg_value(ptr %buf.i, !849, !DIExpression(), !1537)
    #dbg_value(i32 0, !853, !DIExpression(), !1537)
    #dbg_value(ptr %state.i71, !854, !DIExpression(), !1537)
    #dbg_value(ptr %buf.i, !600, !DIExpression(), !1539)
    #dbg_value(i32 0, !607, !DIExpression(), !1539)
    #dbg_value(ptr %state.i71, !608, !DIExpression(), !1539)
    #dbg_value(i32 136, !609, !DIExpression(), !1539)
    #dbg_value(ptr %buf.i, !600, !DIExpression(), !1539)
    #dbg_value(i32 0, !607, !DIExpression(), !1539)
    #dbg_value(i32 128, !837, !DIExpression(), !1532)
    #dbg_value(ptr %buf.i, !835, !DIExpression(), !1532)
    #dbg_value(ptr %buf.i, !857, !DIExpression(), !1541)
    #dbg_value(i32 128, !861, !DIExpression(), !1541)
    #dbg_value(ptr %state.i71, !862, !DIExpression(), !1541)
  %pos.i1.i74 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1543
  %11 = load i32, ptr %pos.i1.i74, align 8, !dbg !1543
    #dbg_value(ptr %buf.i, !864, !DIExpression(), !1544)
    #dbg_value(i32 128, !870, !DIExpression(), !1544)
    #dbg_value(ptr %state.i71, !871, !DIExpression(), !1544)
    #dbg_value(i32 %11, !872, !DIExpression(), !1544)
    #dbg_value(i32 136, !873, !DIExpression(), !1544)
  br label %while.cond.i185, !dbg !1546

while.cond.i185:                                  ; preds = %for.end.i194, %for.end14
  %pos.addr.0.i = phi i32 [ %11, %for.end14 ], [ %i.0.i191.lcssa, %for.end.i194 ]
  %outlen.addr.0.i = phi i32 [ 128, %for.end14 ], [ %sub3.i, %for.end.i194 ]
  %out.addr.0.i186 = phi ptr [ %buf.i, %for.end14 ], [ %out.addr.1.i.lcssa, %for.end.i194 ]
    #dbg_value(ptr %out.addr.0.i186, !864, !DIExpression(), !1544)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !1544)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !1544)
  %tobool.not.i187 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !1546
  br i1 %tobool.not.i187, label %keccak_squeeze.exit, label %while.body.i188, !dbg !1546

while.body.i188:                                  ; preds = %while.cond.i185
  %cmp.i189 = icmp eq i32 %pos.addr.0.i, 136, !dbg !1547
  br i1 %cmp.i189, label %if.then.i, label %if.end.i, !dbg !1547

if.then.i:                                        ; preds = %while.body.i188
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i71) #4, !dbg !1548
    #dbg_value(i32 0, !872, !DIExpression(), !1544)
  br label %if.end.i, !dbg !1549

if.end.i:                                         ; preds = %if.then.i, %while.body.i188
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i188 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !1544)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !1544)
  br label %for.cond.i190, !dbg !1550

for.cond.i190:                                    ; preds = %for.body.i195, %if.end.i
  %i.0.i191 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i200, %for.body.i195 ], !dbg !1551
  %out.addr.1.i = phi ptr [ %out.addr.0.i186, %if.end.i ], [ %incdec.ptr.i, %for.body.i195 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !1544)
    #dbg_value(i32 %i.0.i191, !881, !DIExpression(), !1544)
  %cmp1.i = icmp ult i32 %i.0.i191, 136, !dbg !1552
  %add.i192 = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !1553
  %cmp2.i193 = icmp ult i32 %i.0.i191, %add.i192, !dbg !1553
  %12 = select i1 %cmp1.i, i1 %cmp2.i193, i1 false, !dbg !1553
  br i1 %12, label %for.body.i195, label %for.end.i194, !dbg !1554

for.body.i195:                                    ; preds = %for.cond.i190
  %div1.i = lshr i32 %i.0.i191, 3, !dbg !1555
  %arrayidx.i196 = getelementptr inbounds nuw i64, ptr %state.i71, i32 %div1.i, !dbg !1556
  %13 = load i64, ptr %arrayidx.i196, align 8, !dbg !1556
  %rem.i = shl nuw nsw i32 %i.0.i191, 3, !dbg !1557
  %mul.i197 = and i32 %rem.i, 56, !dbg !1557
  %sh_prom.i = zext nneg i32 %mul.i197 to i64, !dbg !1558
  %shr.i198 = lshr i64 %13, %sh_prom.i, !dbg !1558
  %conv.i199 = trunc i64 %shr.i198 to i8, !dbg !1556
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1544)
  store i8 %conv.i199, ptr %out.addr.1.i, align 1, !dbg !1559
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !1560
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !1544)
  %inc.i200 = add nuw nsw i32 %i.0.i191, 1, !dbg !1561
    #dbg_value(i32 %inc.i200, !881, !DIExpression(), !1544)
  br label %for.cond.i190, !dbg !1562, !llvm.loop !1563

for.end.i194:                                     ; preds = %for.cond.i190
  %i.0.i191.lcssa = phi i32 [ %i.0.i191, %for.cond.i190 ], !dbg !1551
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i190 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i191.lcssa, !dbg !1565
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !1566
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !1544)
    #dbg_value(i32 %i.0.i191.lcssa, !872, !DIExpression(), !1544)
  br label %while.cond.i185, !dbg !1546, !llvm.loop !1567

keccak_squeeze.exit:                              ; preds = %while.cond.i185
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i185 ]
  %pos1.i.i76 = getelementptr inbounds nuw i8, ptr %state.i71, i32 200, !dbg !1569
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i76, align 8, !dbg !1570
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i71), !dbg !1571
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i5), !dbg !1572
    #dbg_value(ptr %epp, !1507, !DIExpression(), !1573)
    #dbg_value(ptr %buf.i, !1511, !DIExpression(), !1573)
  call fastcc void @cbd2(ptr noundef nonnull %epp, ptr noundef nonnull %buf.i) #4, !dbg !1575
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %buf.i), !dbg !1576
    #dbg_value(ptr %sp, !1577, !DIExpression(), !1578)
    #dbg_value(i32 0, !1013, !DIExpression(), !1578)
  br label %for.cond.i18, !dbg !1580

for.cond.i18:                                     ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit109, %keccak_squeeze.exit
  %i.0.i19 = phi i32 [ 0, %keccak_squeeze.exit ], [ %inc.i23, %pqcrystals_kyber1024_ref_poly_reduce.exit109 ], !dbg !1581
    #dbg_value(i32 %i.0.i19, !1013, !DIExpression(), !1578)
  %exitcond267 = icmp ne i32 %i.0.i19, 4, !dbg !1582
  br i1 %exitcond267, label %for.body.i21, label %for.cond16.preheader, !dbg !1583

for.cond16.preheader:                             ; preds = %for.cond.i18
  br label %for.cond16, !dbg !1584

for.body.i21:                                     ; preds = %for.cond.i18
  %arrayidx.i22 = getelementptr inbounds nuw [4 x %struct.poly], ptr %sp, i32 0, i32 %i.0.i19, !dbg !1586
    #dbg_value(ptr %arrayidx.i22, !1020, !DIExpression(), !1587)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i22) #4, !dbg !1589
    #dbg_value(ptr %arrayidx.i22, !1027, !DIExpression(), !1590)
    #dbg_value(i32 0, !1031, !DIExpression(), !1590)
  br label %for.cond.i97, !dbg !1592

for.cond.i97:                                     ; preds = %for.body.i100, %for.body.i21
  %i.0.i98 = phi i32 [ 0, %for.body.i21 ], [ %inc.i108, %for.body.i100 ], !dbg !1593
    #dbg_value(i32 %i.0.i98, !1031, !DIExpression(), !1590)
  %exitcond266 = icmp ne i32 %i.0.i98, 256, !dbg !1594
  br i1 %exitcond266, label %for.body.i100, label %pqcrystals_kyber1024_ref_poly_reduce.exit109, !dbg !1595

for.body.i100:                                    ; preds = %for.cond.i97
  %arrayidx.i101 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1596
  %14 = load i16, ptr %arrayidx.i101, align 2, !dbg !1596
    #dbg_value(i16 %14, !1039, !DIExpression(), !1597)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1597)
  %conv.i.i102 = sext i16 %14 to i32, !dbg !1599
  %mul.i.i103 = mul nsw i32 %conv.i.i102, 20159, !dbg !1600
  %add.i.i104 = add nsw i32 %mul.i.i103, 33554432, !dbg !1601
  %shr.i.i105 = ashr i32 %add.i.i104, 26, !dbg !1602
    #dbg_value(i32 %shr.i.i105, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1597)
    #dbg_value(i32 %shr.i.i105, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1597)
  %15 = trunc nsw i32 %shr.i.i105 to i16, !dbg !1603
  %16 = mul i16 %15, -3329, !dbg !1603
  %conv7.i.i106 = add i16 %16, %14, !dbg !1603
  %arrayidx2.i107 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i22, i32 0, i32 %i.0.i98, !dbg !1604
  store i16 %conv7.i.i106, ptr %arrayidx2.i107, align 2, !dbg !1605
  %inc.i108 = add nuw nsw i32 %i.0.i98, 1, !dbg !1606
    #dbg_value(i32 %inc.i108, !1031, !DIExpression(), !1590)
  br label %for.cond.i97, !dbg !1607, !llvm.loop !1608

pqcrystals_kyber1024_ref_poly_reduce.exit109:     ; preds = %for.cond.i97
  %inc.i23 = add nuw nsw i32 %i.0.i19, 1, !dbg !1610
    #dbg_value(i32 %inc.i23, !1013, !DIExpression(), !1578)
  br label %for.cond.i18, !dbg !1611, !llvm.loop !1612

for.cond16:                                       ; preds = %for.cond16.preheader, %for.body18
  %i.2 = phi i32 [ %inc22, %for.body18 ], [ 0, %for.cond16.preheader ], !dbg !1614
    #dbg_value(i32 %i.2, !1371, !DIExpression(), !1267)
  %exitcond268 = icmp ne i32 %i.2, 4, !dbg !1615
  br i1 %exitcond268, label %for.body18, label %for.end23, !dbg !1584

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !1617
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !1618
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #4, !dbg !1619
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !1620
    #dbg_value(i32 %inc22, !1371, !DIExpression(), !1267)
  br label %for.cond16, !dbg !1621, !llvm.loop !1622

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #4, !dbg !1624
    #dbg_value(ptr %b, !1625, !DIExpression(), !1627)
    #dbg_value(i32 0, !1629, !DIExpression(), !1627)
  br label %for.cond.i12, !dbg !1630

for.cond.i12:                                     ; preds = %for.body.i15, %for.end23
  %i.0.i13 = phi i32 [ 0, %for.end23 ], [ %inc.i17, %for.body.i15 ], !dbg !1632
    #dbg_value(i32 %i.0.i13, !1629, !DIExpression(), !1627)
  %exitcond269 = icmp ne i32 %i.0.i13, 4, !dbg !1633
  br i1 %exitcond269, label %for.body.i15, label %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit, !dbg !1635

for.body.i15:                                     ; preds = %for.cond.i12
  %arrayidx.i16 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i13, !dbg !1636
    #dbg_value(ptr %arrayidx.i16, !1637, !DIExpression(), !1639)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %arrayidx.i16) #4, !dbg !1641
  %inc.i17 = add nuw nsw i32 %i.0.i13, 1, !dbg !1642
    #dbg_value(i32 %inc.i17, !1629, !DIExpression(), !1627)
  br label %for.cond.i12, !dbg !1643, !llvm.loop !1644

pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit: ; preds = %for.cond.i12
    #dbg_value(ptr %v, !1637, !DIExpression(), !1646)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %v) #4, !dbg !1648
    #dbg_value(ptr %b, !1649, !DIExpression(), !1650)
    #dbg_value(ptr %b, !1652, !DIExpression(), !1650)
    #dbg_value(ptr %ep, !1653, !DIExpression(), !1650)
    #dbg_value(i32 0, !1149, !DIExpression(), !1650)
  br label %for.cond.i24, !dbg !1654

for.cond.i24:                                     ; preds = %pqcrystals_kyber1024_ref_poly_add.exit63, %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit
  %i.0.i25 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_invntt_tomont.exit ], [ %inc.i29, %pqcrystals_kyber1024_ref_poly_add.exit63 ], !dbg !1655
    #dbg_value(i32 %i.0.i25, !1149, !DIExpression(), !1650)
  %exitcond271 = icmp ne i32 %i.0.i25, 4, !dbg !1656
  br i1 %exitcond271, label %for.body.i27, label %for.cond.i37.preheader, !dbg !1657

for.cond.i37.preheader:                           ; preds = %for.cond.i24
  br label %for.cond.i37, !dbg !1658

for.body.i27:                                     ; preds = %for.cond.i24
  %arrayidx.i28 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1660
  %arrayidx2.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i25, !dbg !1661
  %arrayidx4.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %ep, i32 0, i32 %i.0.i25, !dbg !1662
    #dbg_value(ptr %arrayidx.i28, !1160, !DIExpression(), !1663)
    #dbg_value(ptr %arrayidx2.i, !1168, !DIExpression(), !1663)
    #dbg_value(ptr %arrayidx4.i, !1169, !DIExpression(), !1663)
    #dbg_value(i32 0, !1170, !DIExpression(), !1663)
  br label %for.cond.i54, !dbg !1665

for.cond.i54:                                     ; preds = %for.body.i57, %for.body.i27
  %i.0.i55 = phi i32 [ 0, %for.body.i27 ], [ %inc.i62, %for.body.i57 ], !dbg !1666
    #dbg_value(i32 %i.0.i55, !1170, !DIExpression(), !1663)
  %exitcond270 = icmp ne i32 %i.0.i55, 256, !dbg !1667
  br i1 %exitcond270, label %for.body.i57, label %pqcrystals_kyber1024_ref_poly_add.exit63, !dbg !1668

for.body.i57:                                     ; preds = %for.cond.i54
  %arrayidx.i58 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2.i, i32 0, i32 %i.0.i55, !dbg !1669
  %17 = load i16, ptr %arrayidx.i58, align 2, !dbg !1669
  %arrayidx2.i59 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4.i, i32 0, i32 %i.0.i55, !dbg !1670
  %18 = load i16, ptr %arrayidx2.i59, align 2, !dbg !1670
  %add.i60 = add i16 %17, %18, !dbg !1671
  %arrayidx6.i61 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i28, i32 0, i32 %i.0.i55, !dbg !1672
  store i16 %add.i60, ptr %arrayidx6.i61, align 2, !dbg !1673
  %inc.i62 = add nuw nsw i32 %i.0.i55, 1, !dbg !1674
    #dbg_value(i32 %inc.i62, !1170, !DIExpression(), !1663)
  br label %for.cond.i54, !dbg !1675, !llvm.loop !1676

pqcrystals_kyber1024_ref_poly_add.exit63:         ; preds = %for.cond.i54
  %inc.i29 = add nuw nsw i32 %i.0.i25, 1, !dbg !1678
    #dbg_value(i32 %inc.i29, !1149, !DIExpression(), !1650)
  br label %for.cond.i24, !dbg !1679, !llvm.loop !1680

for.cond.i37:                                     ; preds = %for.cond.i37.preheader, %for.body.i40
  %i.0.i38 = phi i32 [ %inc.i43, %for.body.i40 ], [ 0, %for.cond.i37.preheader ], !dbg !1682
    #dbg_value(i32 %i.0.i38, !1170, !DIExpression(), !1683)
  %exitcond272 = icmp ne i32 %i.0.i38, 256, !dbg !1684
  br i1 %exitcond272, label %for.body.i40, label %for.cond.i44.preheader, !dbg !1658

for.cond.i44.preheader:                           ; preds = %for.cond.i37
  br label %for.cond.i44, !dbg !1685

for.body.i40:                                     ; preds = %for.cond.i37
  %arrayidx.i41 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1687
  %19 = load i16, ptr %arrayidx.i41, align 2, !dbg !1687
  %arrayidx2.i42 = getelementptr inbounds nuw [256 x i16], ptr %epp, i32 0, i32 %i.0.i38, !dbg !1688
  %20 = load i16, ptr %arrayidx2.i42, align 2, !dbg !1688
  %add.i = add i16 %19, %20, !dbg !1689
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i38, !dbg !1690
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !1691
  %inc.i43 = add nuw nsw i32 %i.0.i38, 1, !dbg !1692
    #dbg_value(i32 %inc.i43, !1170, !DIExpression(), !1683)
  br label %for.cond.i37, !dbg !1693, !llvm.loop !1694

for.cond.i44:                                     ; preds = %for.cond.i44.preheader, %for.body.i47
  %i.0.i45 = phi i32 [ %inc.i52, %for.body.i47 ], [ 0, %for.cond.i44.preheader ], !dbg !1696
    #dbg_value(i32 %i.0.i45, !1170, !DIExpression(), !1697)
  %exitcond273 = icmp ne i32 %i.0.i45, 256, !dbg !1698
  br i1 %exitcond273, label %for.body.i47, label %for.cond.i.preheader, !dbg !1685

for.cond.i.preheader:                             ; preds = %for.cond.i44
  br label %for.cond.i, !dbg !1699

for.body.i47:                                     ; preds = %for.cond.i44
  %arrayidx.i48 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1701
  %21 = load i16, ptr %arrayidx.i48, align 2, !dbg !1701
  %arrayidx2.i49 = getelementptr inbounds nuw [256 x i16], ptr %k, i32 0, i32 %i.0.i45, !dbg !1702
  %22 = load i16, ptr %arrayidx2.i49, align 2, !dbg !1702
  %add.i50 = add i16 %21, %22, !dbg !1703
  %arrayidx6.i51 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i45, !dbg !1704
  store i16 %add.i50, ptr %arrayidx6.i51, align 2, !dbg !1705
  %inc.i52 = add nuw nsw i32 %i.0.i45, 1, !dbg !1706
    #dbg_value(i32 %inc.i52, !1170, !DIExpression(), !1697)
  br label %for.cond.i44, !dbg !1707, !llvm.loop !1708

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit96
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit96 ], [ 0, %for.cond.i.preheader ], !dbg !1710
    #dbg_value(i32 %i.0.i, !1191, !DIExpression(), !1711)
  %exitcond275 = icmp ne i32 %i.0.i, 4, !dbg !1712
  br i1 %exitcond275, label %for.body.i, label %for.cond.i77.preheader, !dbg !1699

for.cond.i77.preheader:                           ; preds = %for.cond.i
  br label %for.cond.i77, !dbg !1713

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i11 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1715
    #dbg_value(ptr %arrayidx.i11, !1027, !DIExpression(), !1716)
    #dbg_value(i32 0, !1031, !DIExpression(), !1716)
  br label %for.cond.i84, !dbg !1718

for.cond.i84:                                     ; preds = %for.body.i87, %for.body.i
  %i.0.i85 = phi i32 [ 0, %for.body.i ], [ %inc.i95, %for.body.i87 ], !dbg !1719
    #dbg_value(i32 %i.0.i85, !1031, !DIExpression(), !1716)
  %exitcond274 = icmp ne i32 %i.0.i85, 256, !dbg !1720
  br i1 %exitcond274, label %for.body.i87, label %pqcrystals_kyber1024_ref_poly_reduce.exit96, !dbg !1721

for.body.i87:                                     ; preds = %for.cond.i84
  %arrayidx.i88 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1722
  %23 = load i16, ptr %arrayidx.i88, align 2, !dbg !1722
    #dbg_value(i16 %23, !1039, !DIExpression(), !1723)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1723)
  %conv.i.i89 = sext i16 %23 to i32, !dbg !1725
  %mul.i.i90 = mul nsw i32 %conv.i.i89, 20159, !dbg !1726
  %add.i.i91 = add nsw i32 %mul.i.i90, 33554432, !dbg !1727
  %shr.i.i92 = ashr i32 %add.i.i91, 26, !dbg !1728
    #dbg_value(i32 %shr.i.i92, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1723)
    #dbg_value(i32 %shr.i.i92, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1723)
  %24 = trunc nsw i32 %shr.i.i92 to i16, !dbg !1729
  %25 = mul i16 %24, -3329, !dbg !1729
  %conv7.i.i93 = add i16 %25, %23, !dbg !1729
  %arrayidx2.i94 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i11, i32 0, i32 %i.0.i85, !dbg !1730
  store i16 %conv7.i.i93, ptr %arrayidx2.i94, align 2, !dbg !1731
  %inc.i95 = add nuw nsw i32 %i.0.i85, 1, !dbg !1732
    #dbg_value(i32 %inc.i95, !1031, !DIExpression(), !1716)
  br label %for.cond.i84, !dbg !1733, !llvm.loop !1734

pqcrystals_kyber1024_ref_poly_reduce.exit96:      ; preds = %for.cond.i84
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1736
    #dbg_value(i32 %inc.i, !1191, !DIExpression(), !1711)
  br label %for.cond.i, !dbg !1737, !llvm.loop !1738

for.cond.i77:                                     ; preds = %for.cond.i77.preheader, %for.body.i80
  %i.0.i78 = phi i32 [ %inc.i83, %for.body.i80 ], [ 0, %for.cond.i77.preheader ], !dbg !1740
    #dbg_value(i32 %i.0.i78, !1031, !DIExpression(), !1741)
  %exitcond276 = icmp ne i32 %i.0.i78, 256, !dbg !1742
  br i1 %exitcond276, label %for.body.i80, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1713

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i78, !dbg !1743
  %26 = load i16, ptr %arrayidx.i81, align 2, !dbg !1743
    #dbg_value(i16 %26, !1039, !DIExpression(), !1744)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1744)
  %conv.i.i = sext i16 %26 to i32, !dbg !1746
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1747
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1748
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1749
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1744)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1744)
  %27 = trunc nsw i32 %shr.i.i to i16, !dbg !1750
  %28 = mul i16 %27, -3329, !dbg !1750
  %conv7.i.i = add i16 %28, %26, !dbg !1750
  %arrayidx2.i82 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i78, !dbg !1751
  store i16 %conv7.i.i, ptr %arrayidx2.i82, align 2, !dbg !1752
  %inc.i83 = add nuw nsw i32 %i.0.i78, 1, !dbg !1753
    #dbg_value(i32 %inc.i83, !1031, !DIExpression(), !1741)
  br label %for.cond.i77, !dbg !1754, !llvm.loop !1755

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i77
    #dbg_value(ptr %c, !1757, !DIExpression(), !1762)
    #dbg_value(ptr %b, !1764, !DIExpression(), !1762)
    #dbg_value(ptr %v, !1765, !DIExpression(), !1762)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %c, ptr noundef nonnull %b) #4, !dbg !1766
  %add.ptr.i3 = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !1767
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr.i3, ptr noundef nonnull %v) #4, !dbg !1768
  ret void, !dbg !1769
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !1770 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !1773, !DIExpression(), !1774)
    #dbg_value(ptr %c, !1775, !DIExpression(), !1774)
    #dbg_value(ptr %sk, !1776, !DIExpression(), !1774)
    #dbg_declare(ptr %b, !1777, !DIExpression(), !1778)
    #dbg_declare(ptr %skpv, !1779, !DIExpression(), !1780)
    #dbg_declare(ptr %v, !1781, !DIExpression(), !1782)
    #dbg_declare(ptr %mp, !1783, !DIExpression(), !1784)
    #dbg_value(ptr %b, !1785, !DIExpression(), !1789)
    #dbg_value(ptr %v, !1791, !DIExpression(), !1789)
    #dbg_value(ptr %c, !1792, !DIExpression(), !1789)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #4, !dbg !1793
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !1794
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr.i) #4, !dbg !1795
    #dbg_value(ptr %skpv, !1796, !DIExpression(), !1800)
    #dbg_value(ptr %sk, !1802, !DIExpression(), !1800)
    #dbg_value(ptr %skpv, !1298, !DIExpression(), !1803)
    #dbg_value(ptr %sk, !1304, !DIExpression(), !1803)
    #dbg_value(i32 0, !1305, !DIExpression(), !1803)
  br label %for.cond.i1, !dbg !1805

for.cond.i1:                                      ; preds = %for.body.i4, %entry
  %i.0.i2 = phi i32 [ 0, %entry ], [ %inc.i7, %for.body.i4 ], !dbg !1806
    #dbg_value(i32 %i.0.i2, !1305, !DIExpression(), !1803)
  %exitcond = icmp ne i32 %i.0.i2, 4, !dbg !1807
  br i1 %exitcond, label %for.body.i4, label %for.cond.i.preheader, !dbg !1808

for.cond.i.preheader:                             ; preds = %for.cond.i1
  br label %for.cond.i, !dbg !1809

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0.i2, !dbg !1811
  %mul.i = mul nuw nsw i32 %i.0.i2, 384, !dbg !1812
  %add.ptr.i6 = getelementptr inbounds nuw i8, ptr %sk, i32 %mul.i, !dbg !1813
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef nonnull %arrayidx.i5, ptr noundef %add.ptr.i6) #4, !dbg !1814
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !1815
    #dbg_value(i32 %inc.i7, !1305, !DIExpression(), !1803)
  br label %for.cond.i1, !dbg !1816, !llvm.loop !1817

for.cond.i:                                       ; preds = %for.cond.i.preheader, %pqcrystals_kyber1024_ref_poly_reduce.exit
  %i.0.i = phi i32 [ %inc.i, %pqcrystals_kyber1024_ref_poly_reduce.exit ], [ 0, %for.cond.i.preheader ], !dbg !1819
    #dbg_value(i32 %i.0.i, !1013, !DIExpression(), !1820)
  %exitcond42 = icmp ne i32 %i.0.i, 4, !dbg !1821
  br i1 %exitcond42, label %for.body.i, label %pqcrystals_kyber1024_ref_polyvec_ntt.exit, !dbg !1809

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0.i, !dbg !1822
    #dbg_value(ptr %arrayidx.i, !1020, !DIExpression(), !1823)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef nonnull %arrayidx.i) #4, !dbg !1825
    #dbg_value(ptr %arrayidx.i, !1027, !DIExpression(), !1826)
    #dbg_value(i32 0, !1031, !DIExpression(), !1826)
  br label %for.cond.i14, !dbg !1828

for.cond.i14:                                     ; preds = %for.body.i17, %for.body.i
  %i.0.i15 = phi i32 [ 0, %for.body.i ], [ %inc.i20, %for.body.i17 ], !dbg !1829
    #dbg_value(i32 %i.0.i15, !1031, !DIExpression(), !1826)
  %exitcond41 = icmp ne i32 %i.0.i15, 256, !dbg !1830
  br i1 %exitcond41, label %for.body.i17, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !1831

for.body.i17:                                     ; preds = %for.cond.i14
  %arrayidx.i18 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1832
  %0 = load i16, ptr %arrayidx.i18, align 2, !dbg !1832
    #dbg_value(i16 %0, !1039, !DIExpression(), !1833)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1833)
  %conv.i.i = sext i16 %0 to i32, !dbg !1835
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !1836
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !1837
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !1838
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1833)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1833)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !1839
  %2 = mul i16 %1, -3329, !dbg !1839
  %conv7.i.i = add i16 %2, %0, !dbg !1839
  %arrayidx2.i19 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx.i, i32 0, i32 %i.0.i15, !dbg !1840
  store i16 %conv7.i.i, ptr %arrayidx2.i19, align 2, !dbg !1841
  %inc.i20 = add nuw nsw i32 %i.0.i15, 1, !dbg !1842
    #dbg_value(i32 %inc.i20, !1031, !DIExpression(), !1826)
  br label %for.cond.i14, !dbg !1843, !llvm.loop !1844

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i14
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1846
    #dbg_value(i32 %inc.i, !1013, !DIExpression(), !1820)
  br label %for.cond.i, !dbg !1847, !llvm.loop !1848

pqcrystals_kyber1024_ref_polyvec_ntt.exit:        ; preds = %for.cond.i
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #4, !dbg !1850
    #dbg_value(ptr %mp, !1637, !DIExpression(), !1851)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef nonnull %mp) #4, !dbg !1853
    #dbg_value(ptr %mp, !1854, !DIExpression(), !1856)
    #dbg_value(ptr %v, !1858, !DIExpression(), !1856)
    #dbg_value(ptr %mp, !1859, !DIExpression(), !1856)
    #dbg_value(i32 0, !1860, !DIExpression(), !1856)
  br label %for.cond.i8, !dbg !1861

for.cond.i8:                                      ; preds = %for.body.i11, %pqcrystals_kyber1024_ref_polyvec_ntt.exit
  %i.0.i9 = phi i32 [ 0, %pqcrystals_kyber1024_ref_polyvec_ntt.exit ], [ %inc.i13, %for.body.i11 ], !dbg !1863
    #dbg_value(i32 %i.0.i9, !1860, !DIExpression(), !1856)
  %exitcond43 = icmp ne i32 %i.0.i9, 256, !dbg !1864
  br i1 %exitcond43, label %for.body.i11, label %for.cond.i21.preheader, !dbg !1866

for.cond.i21.preheader:                           ; preds = %for.cond.i8
  br label %for.cond.i21, !dbg !1867

for.body.i11:                                     ; preds = %for.cond.i8
  %arrayidx.i12 = getelementptr inbounds nuw [256 x i16], ptr %v, i32 0, i32 %i.0.i9, !dbg !1869
  %3 = load i16, ptr %arrayidx.i12, align 2, !dbg !1869
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1870
  %4 = load i16, ptr %arrayidx2.i, align 2, !dbg !1870
  %sub.i = sub i16 %3, %4, !dbg !1871
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i9, !dbg !1872
  store i16 %sub.i, ptr %arrayidx6.i, align 2, !dbg !1873
  %inc.i13 = add nuw nsw i32 %i.0.i9, 1, !dbg !1874
    #dbg_value(i32 %inc.i13, !1860, !DIExpression(), !1856)
  br label %for.cond.i8, !dbg !1875, !llvm.loop !1876

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i24
  %i.0.i22 = phi i32 [ %inc.i32, %for.body.i24 ], [ 0, %for.cond.i21.preheader ], !dbg !1878
    #dbg_value(i32 %i.0.i22, !1031, !DIExpression(), !1879)
  %exitcond44 = icmp ne i32 %i.0.i22, 256, !dbg !1880
  br i1 %exitcond44, label %for.body.i24, label %for.cond.i34.preheader, !dbg !1867

for.cond.i34.preheader:                           ; preds = %for.cond.i21
  br label %for.cond.i34, !dbg !1881

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1887
  %5 = load i16, ptr %arrayidx.i25, align 2, !dbg !1887
    #dbg_value(i16 %5, !1039, !DIExpression(), !1888)
    #dbg_value(i16 20159, !1046, !DIExpression(), !1888)
  %conv.i.i26 = sext i16 %5 to i32, !dbg !1890
  %mul.i.i27 = mul nsw i32 %conv.i.i26, 20159, !dbg !1891
  %add.i.i28 = add nsw i32 %mul.i.i27, 33554432, !dbg !1892
  %shr.i.i29 = ashr i32 %add.i.i28, 26, !dbg !1893
    #dbg_value(i32 %shr.i.i29, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1888)
    #dbg_value(i32 %shr.i.i29, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1888)
  %6 = trunc nsw i32 %shr.i.i29 to i16, !dbg !1894
  %7 = mul i16 %6, -3329, !dbg !1894
  %conv7.i.i30 = add i16 %7, %5, !dbg !1894
  %arrayidx2.i31 = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %i.0.i22, !dbg !1895
  store i16 %conv7.i.i30, ptr %arrayidx2.i31, align 2, !dbg !1896
  %inc.i32 = add nuw nsw i32 %i.0.i22, 1, !dbg !1897
    #dbg_value(i32 %inc.i32, !1031, !DIExpression(), !1879)
  br label %for.cond.i21, !dbg !1898, !llvm.loop !1899

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc11.i
  %i.0.i35 = phi i32 [ %inc12.i, %for.inc11.i ], [ 0, %for.cond.i34.preheader ], !dbg !1901
    #dbg_value(i32 %i.0.i35, !1902, !DIExpression(), !1903)
  %exitcond46 = icmp ne i32 %i.0.i35, 32, !dbg !1904
  br i1 %exitcond46, label %for.body.i37, label %pqcrystals_kyber1024_ref_poly_tomsg.exit, !dbg !1881

for.body.i37:                                     ; preds = %for.cond.i34
  %arrayidx.i38 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1906
  store i8 0, ptr %arrayidx.i38, align 1, !dbg !1908
    #dbg_value(i32 0, !1909, !DIExpression(), !1903)
  br label %for.cond1.i, !dbg !1910

for.cond1.i:                                      ; preds = %for.body3.i, %for.body.i37
  %j.0.i = phi i32 [ 0, %for.body.i37 ], [ %inc.i40, %for.body3.i ], !dbg !1912
    #dbg_value(i32 %j.0.i, !1909, !DIExpression(), !1903)
  %exitcond45 = icmp ne i32 %j.0.i, 8, !dbg !1913
  br i1 %exitcond45, label %for.body3.i, label %for.inc11.i, !dbg !1915

for.body3.i:                                      ; preds = %for.cond1.i
  %mul.i39 = shl nuw nsw i32 %i.0.i35, 3, !dbg !1916
  %add.i = or disjoint i32 %mul.i39, %j.0.i, !dbg !1918
  %arrayidx4.i = getelementptr inbounds nuw [256 x i16], ptr %mp, i32 0, i32 %add.i, !dbg !1919
  %8 = load i16, ptr %arrayidx4.i, align 2, !dbg !1919
  %conv.i = sext i16 %8 to i32, !dbg !1919
    #dbg_value(i32 %conv.i, !1920, !DIExpression(), !1903)
    #dbg_value(i32 %conv.i, !1920, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1903)
    #dbg_value(i32 %conv.i, !1920, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1903)
  %9 = mul i32 %conv.i, 161270, !dbg !1921
  %mul6.i = add i32 %9, 134257275, !dbg !1921
    #dbg_value(i32 %mul6.i, !1920, !DIExpression(), !1903)
  %shr.i = lshr i32 %mul6.i, 28, !dbg !1922
    #dbg_value(i32 %shr.i, !1920, !DIExpression(), !1903)
  %and.i = and i32 %shr.i, 1, !dbg !1923
    #dbg_value(i32 %and.i, !1920, !DIExpression(), !1903)
  %shl7.i = shl nuw nsw i32 %and.i, %j.0.i, !dbg !1924
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.i35, !dbg !1925
  %10 = load i8, ptr %arrayidx8.i, align 1, !dbg !1926
  %11 = trunc nuw i32 %shl7.i to i8, !dbg !1926
  %conv10.i = or i8 %10, %11, !dbg !1926
  store i8 %conv10.i, ptr %arrayidx8.i, align 1, !dbg !1926
  %inc.i40 = add nuw nsw i32 %j.0.i, 1, !dbg !1927
    #dbg_value(i32 %inc.i40, !1909, !DIExpression(), !1903)
  br label %for.cond1.i, !dbg !1928, !llvm.loop !1929

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i35, 1, !dbg !1931
    #dbg_value(i32 %inc12.i, !1902, !DIExpression(), !1903)
  br label %for.cond.i34, !dbg !1932, !llvm.loop !1933

pqcrystals_kyber1024_ref_poly_tomsg.exit:         ; preds = %for.cond.i34
  ret void, !dbg !1935
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1936 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !1937, !DIExpression(), !1938)
    #dbg_value(ptr %a, !1939, !DIExpression(), !1938)
    #dbg_declare(ptr %t, !1940, !DIExpression(), !1944)
    #dbg_value(i32 0, !1945, !DIExpression(), !1938)
  br label %for.cond, !dbg !1946

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !1948
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !1937, !DIExpression(), !1938)
    #dbg_value(i32 %i.0, !1945, !DIExpression(), !1938)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !1949
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !1951

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1952

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !1955
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !1937, !DIExpression(), !1938)
    #dbg_value(i32 %j.0, !1956, !DIExpression(), !1938)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !1957
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !1952

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !1959

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !1962
    #dbg_value(i32 %k.0, !1963, !DIExpression(), !1938)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !1964
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !1959

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1966
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !1968
  %add = or disjoint i32 %mul, %k.0, !dbg !1969
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !1966
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1966
  %isneg = icmp slt i16 %0, 0, !dbg !1970
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1970
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1971
  %add12 = add i16 %and, %0, !dbg !1972
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !1972
  %conv15 = zext i16 %add12 to i64, !dbg !1973
    #dbg_value(i64 %conv15, !1974, !DIExpression(), !1938)
    #dbg_value(i64 %conv15, !1974, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !1938)
    #dbg_value(i64 %conv15, !1974, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !1938)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !1975
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !1975
    #dbg_value(i64 %mul17, !1974, !DIExpression(), !1938)
  %shr18 = lshr i64 %mul17, 31, !dbg !1976
    #dbg_value(i64 %shr18, !1974, !DIExpression(), !1938)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !1977
  %conv20 = and i16 %2, 2047, !dbg !1977
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1978
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !1979
  %inc = add nuw nsw i32 %k.0, 1, !dbg !1980
    #dbg_value(i32 %inc, !1963, !DIExpression(), !1938)
  br label %for.cond4, !dbg !1981, !llvm.loop !1982

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !1984
  %conv25 = trunc i16 %3 to i8, !dbg !1985
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !1986
  %4 = load i16, ptr %t, align 2, !dbg !1987
  %5 = lshr i16 %4, 8, !dbg !1988
  %shr29 = trunc nuw i16 %5 to i8, !dbg !1988
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1989
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !1989
  %conv31 = trunc i16 %6 to i8, !dbg !1989
  %shl32 = shl i8 %conv31, 3, !dbg !1990
  %or = or i8 %shl32, %shr29, !dbg !1991
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !1992
  store i8 %or, ptr %arrayidx34, align 1, !dbg !1993
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1994
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !1994
  %8 = lshr i16 %7, 5, !dbg !1995
  %shr37 = trunc i16 %8 to i8, !dbg !1995
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1996
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !1996
  %conv39 = trunc i16 %9 to i8, !dbg !1996
  %shl40 = shl i8 %conv39, 6, !dbg !1997
  %or41 = or i8 %shl40, %shr37, !dbg !1998
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !1999
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !2000
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2001
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !2001
  %11 = lshr i16 %10, 2, !dbg !2002
  %conv47 = trunc i16 %11 to i8, !dbg !2003
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !2004
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !2005
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2006
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !2006
  %13 = lshr i16 %12, 10, !dbg !2007
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !2007
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2008
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !2008
  %conv53 = trunc i16 %14 to i8, !dbg !2008
  %shl54 = shl i8 %conv53, 1, !dbg !2009
  %or55 = or i8 %shl54, %shr51, !dbg !2010
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !2011
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !2012
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2013
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !2013
  %16 = lshr i16 %15, 7, !dbg !2014
  %shr60 = trunc i16 %16 to i8, !dbg !2014
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !2015
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !2015
  %conv62 = trunc i16 %17 to i8, !dbg !2015
  %shl63 = shl i8 %conv62, 4, !dbg !2016
  %or64 = or i8 %shl63, %shr60, !dbg !2017
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !2018
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !2019
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !2020
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !2020
  %19 = lshr i16 %18, 4, !dbg !2021
  %shr69 = trunc i16 %19 to i8, !dbg !2021
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !2022
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !2022
  %conv71 = trunc i16 %20 to i8, !dbg !2022
  %shl72 = shl i8 %conv71, 7, !dbg !2023
  %or73 = or i8 %shl72, %shr69, !dbg !2024
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !2025
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !2026
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !2027
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !2027
  %22 = lshr i16 %21, 1, !dbg !2028
  %conv79 = trunc i16 %22 to i8, !dbg !2029
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !2030
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !2031
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !2032
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !2032
  %24 = lshr i16 %23, 9, !dbg !2033
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !2033
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !2034
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !2034
  %conv85 = trunc i16 %25 to i8, !dbg !2034
  %shl86 = shl i8 %conv85, 2, !dbg !2035
  %or87 = or i8 %shl86, %shr83, !dbg !2036
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !2037
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !2038
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !2039
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !2039
  %27 = lshr i16 %26, 6, !dbg !2040
  %shr92 = trunc i16 %27 to i8, !dbg !2040
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !2041
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !2041
  %conv94 = trunc i16 %28 to i8, !dbg !2041
  %shl95 = shl i8 %conv94, 5, !dbg !2042
  %or96 = or i8 %shl95, %shr92, !dbg !2043
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !2044
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !2045
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !2046
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !2046
  %30 = lshr i16 %29, 3, !dbg !2047
  %conv102 = trunc i16 %30 to i8, !dbg !2048
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !2049
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !2050
    #dbg_value(ptr %r.addr.1, !1937, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !1938)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !2051
    #dbg_value(ptr %add.ptr, !1937, !DIExpression(), !1938)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !2052
    #dbg_value(i32 %inc105, !1956, !DIExpression(), !1938)
  br label %for.cond1, !dbg !2053, !llvm.loop !2054

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !2056
    #dbg_value(i32 %inc108, !1945, !DIExpression(), !1938)
  br label %for.cond, !dbg !2057, !llvm.loop !2058

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !2060
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2061 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !2062, !DIExpression(), !2063)
    #dbg_value(ptr %a, !2064, !DIExpression(), !2063)
    #dbg_declare(ptr %t, !2065, !DIExpression(), !2066)
    #dbg_value(i32 0, !2067, !DIExpression(), !2063)
  br label %for.cond, !dbg !2068

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !2070
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !2064, !DIExpression(), !2063)
    #dbg_value(i32 %i.0, !2067, !DIExpression(), !2063)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !2071
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !2073

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2074

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !2077
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !2064, !DIExpression(), !2063)
    #dbg_value(i32 %j.0, !2078, !DIExpression(), !2063)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !2079
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !2074

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !2081
  %conv = zext i8 %0 to i16, !dbg !2081
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2083
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !2083
  %conv6 = zext i8 %1 to i16, !dbg !2084
  %shl = shl nuw i16 %conv6, 8, !dbg !2085
  %or = or disjoint i16 %shl, %conv, !dbg !2086
  store i16 %or, ptr %t, align 2, !dbg !2087
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !2088
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !2088
  %3 = lshr i8 %2, 3, !dbg !2089
  %shr11 = zext nneg i8 %3 to i16, !dbg !2089
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2090
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !2090
  %conv14 = zext i8 %4 to i16, !dbg !2091
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !2092
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !2093
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2094
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !2095
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !2096
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !2096
  %6 = lshr i8 %5, 6, !dbg !2097
  %shr21 = zext nneg i8 %6 to i16, !dbg !2097
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !2098
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !2098
  %conv24 = zext i8 %7 to i16, !dbg !2099
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !2100
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !2101
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !2102
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !2102
  %conv29 = zext i8 %8 to i16, !dbg !2103
  %shl30 = shl i16 %conv29, 10, !dbg !2104
  %or31 = or disjoint i16 %or26, %shl30, !dbg !2105
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2106
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !2107
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !2108
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !2108
  %10 = lshr i8 %9, 1, !dbg !2109
  %shr36 = zext nneg i8 %10 to i16, !dbg !2109
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !2110
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !2110
  %conv39 = zext i8 %11 to i16, !dbg !2111
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !2112
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !2113
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2114
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !2115
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !2116
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !2116
  %13 = lshr i8 %12, 4, !dbg !2117
  %shr46 = zext nneg i8 %13 to i16, !dbg !2117
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !2118
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !2118
  %conv49 = zext i8 %14 to i16, !dbg !2119
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !2120
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !2121
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !2122
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !2123
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !2124
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !2124
  %16 = lshr i8 %15, 7, !dbg !2125
  %shr56 = zext nneg i8 %16 to i16, !dbg !2125
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !2126
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !2126
  %conv59 = zext i8 %17 to i16, !dbg !2127
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !2128
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !2129
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !2130
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !2130
  %conv64 = zext i8 %18 to i16, !dbg !2131
  %shl65 = shl i16 %conv64, 9, !dbg !2132
  %or66 = or disjoint i16 %or61, %shl65, !dbg !2133
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !2134
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !2135
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !2136
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !2136
  %20 = lshr i8 %19, 2, !dbg !2137
  %shr71 = zext nneg i8 %20 to i16, !dbg !2137
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !2138
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !2138
  %conv74 = zext i8 %21 to i16, !dbg !2139
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !2140
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !2141
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !2142
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !2143
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !2144
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !2144
  %23 = lshr i8 %22, 5, !dbg !2145
  %shr81 = zext nneg i8 %23 to i16, !dbg !2145
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !2146
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !2146
  %conv84 = zext i8 %24 to i16, !dbg !2147
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !2148
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !2149
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !2150
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !2151
    #dbg_value(ptr %add.ptr, !2064, !DIExpression(), !2063)
    #dbg_value(i32 0, !2152, !DIExpression(), !2063)
  br label %for.cond89, !dbg !2153

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !2155
    #dbg_value(i32 %k.0, !2152, !DIExpression(), !2063)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !2156
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !2158

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !2159
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !2159
  %26 = and i16 %25, 2047, !dbg !2160
  %and = zext nneg i16 %26 to i32, !dbg !2160
  %mul = mul nuw nsw i32 %and, 3329, !dbg !2161
  %add = add nuw nsw i32 %mul, 1024, !dbg !2162
  %shr95 = lshr i32 %add, 11, !dbg !2163
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !2164
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2165
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !2166
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !2167
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx97, i32 0, i32 %add99, !dbg !2165
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !2168
  %inc = add nuw nsw i32 %k.0, 1, !dbg !2169
    #dbg_value(i32 %inc, !2152, !DIExpression(), !2063)
  br label %for.cond89, !dbg !2170, !llvm.loop !2171

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !2173
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !2174
    #dbg_value(i32 %inc102, !2078, !DIExpression(), !2063)
  br label %for.cond1, !dbg !2175, !llvm.loop !2176

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !2178
    #dbg_value(i32 %inc105, !2067, !DIExpression(), !2063)
  br label %for.cond, !dbg !2179, !llvm.loop !2180

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !2182
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1197 {
entry:
    #dbg_value(ptr %r, !2183, !DIExpression(), !2184)
    #dbg_value(ptr %a, !2185, !DIExpression(), !2184)
    #dbg_value(i32 0, !1231, !DIExpression(), !2184)
  br label %for.cond, !dbg !2186

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2187
    #dbg_value(i32 %i.0, !1231, !DIExpression(), !2184)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2188
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2189

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2190
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !2191
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2192
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #4, !dbg !2193
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2194
    #dbg_value(i32 %inc, !1231, !DIExpression(), !2184)
  br label %for.cond, !dbg !2195, !llvm.loop !2196

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2198
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1299 {
entry:
    #dbg_value(ptr %r, !1298, !DIExpression(), !2199)
    #dbg_value(ptr %a, !1304, !DIExpression(), !2199)
    #dbg_value(i32 0, !1305, !DIExpression(), !2199)
  br label %for.cond, !dbg !2200

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2201
    #dbg_value(i32 %i.0, !1305, !DIExpression(), !2199)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2202
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2203

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2204
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !2205
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2206
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #4, !dbg !2207
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2208
    #dbg_value(i32 %inc, !1305, !DIExpression(), !2199)
  br label %for.cond, !dbg !2209, !llvm.loop !2210

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2212
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !934 {
entry:
    #dbg_value(ptr %r, !1577, !DIExpression(), !2213)
    #dbg_value(i32 0, !1013, !DIExpression(), !2213)
  br label %for.cond, !dbg !2214

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_reduce.exit ], !dbg !2215
    #dbg_value(i32 %i.0, !1013, !DIExpression(), !2213)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !2216
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2217

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2218
    #dbg_value(ptr %arrayidx, !1020, !DIExpression(), !2219)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %arrayidx) #4, !dbg !2221
    #dbg_value(ptr %arrayidx, !1027, !DIExpression(), !2222)
    #dbg_value(i32 0, !1031, !DIExpression(), !2222)
  br label %for.cond.i, !dbg !2224

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2225
    #dbg_value(i32 %i.0.i, !1031, !DIExpression(), !2222)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2226
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2227

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2228
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2228
    #dbg_value(i16 %0, !1039, !DIExpression(), !2229)
    #dbg_value(i16 20159, !1046, !DIExpression(), !2229)
  %conv.i.i = sext i16 %0 to i32, !dbg !2231
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2232
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2233
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2234
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2229)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2229)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2235
  %2 = mul i16 %1, -3329, !dbg !2235
  %conv7.i.i = add i16 %2, %0, !dbg !2235
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2236
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2237
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2238
    #dbg_value(i32 %inc.i, !1031, !DIExpression(), !2222)
  br label %for.cond.i, !dbg !2239, !llvm.loop !2240

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2242
    #dbg_value(i32 %inc, !1013, !DIExpression(), !2213)
  br label %for.cond, !dbg !2243, !llvm.loop !2244

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2246
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1626 {
entry:
    #dbg_value(ptr %r, !1625, !DIExpression(), !2247)
    #dbg_value(i32 0, !1629, !DIExpression(), !2247)
  br label %for.cond, !dbg !2248

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2249
    #dbg_value(i32 %i.0, !1629, !DIExpression(), !2247)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2250
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2251

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2252
    #dbg_value(ptr %arrayidx, !1637, !DIExpression(), !2253)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %arrayidx) #4, !dbg !2255
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2256
    #dbg_value(i32 %inc, !1629, !DIExpression(), !2247)
  br label %for.cond, !dbg !2257, !llvm.loop !2258

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2260
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2261 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !2265, !DIExpression(), !2266)
    #dbg_value(ptr %a, !2267, !DIExpression(), !2266)
    #dbg_value(ptr %b, !2268, !DIExpression(), !2266)
    #dbg_declare(ptr %t, !2269, !DIExpression(), !2270)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #4, !dbg !2271
    #dbg_value(i32 1, !2272, !DIExpression(), !2266)
  br label %for.cond, !dbg !2273

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_add.exit ], !dbg !2275
    #dbg_value(i32 %i.0, !2272, !DIExpression(), !2266)
  %exitcond8 = icmp ne i32 %i.0, 4, !dbg !2276
  br i1 %exitcond8, label %for.body, label %for.cond.i1.preheader, !dbg !2278

for.cond.i1.preheader:                            ; preds = %for.cond
  br label %for.cond.i1, !dbg !2279

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2281
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2283
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #4, !dbg !2284
    #dbg_value(ptr %r, !1160, !DIExpression(), !2285)
    #dbg_value(ptr %r, !1168, !DIExpression(), !2285)
    #dbg_value(ptr %t, !1169, !DIExpression(), !2285)
    #dbg_value(i32 0, !1170, !DIExpression(), !2285)
  br label %for.cond.i, !dbg !2287

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2288
    #dbg_value(i32 %i.0.i, !1170, !DIExpression(), !2285)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2289
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !2290

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2291
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2291
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %t, i32 0, i32 %i.0.i, !dbg !2292
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2292
  %add.i = add i16 %0, %1, !dbg !2293
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2294
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2295
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2296
    #dbg_value(i32 %inc.i, !1170, !DIExpression(), !2285)
  br label %for.cond.i, !dbg !2297, !llvm.loop !2298

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2300
    #dbg_value(i32 %inc, !2272, !DIExpression(), !2266)
  br label %for.cond, !dbg !2301, !llvm.loop !2302

for.cond.i1:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i2 = phi i32 [ %inc.i7, %for.body.i4 ], [ 0, %for.cond.i1.preheader ], !dbg !2304
    #dbg_value(i32 %i.0.i2, !1031, !DIExpression(), !2305)
  %exitcond9 = icmp ne i32 %i.0.i2, 256, !dbg !2306
  br i1 %exitcond9, label %for.body.i4, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2279

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2307
  %2 = load i16, ptr %arrayidx.i5, align 2, !dbg !2307
    #dbg_value(i16 %2, !1039, !DIExpression(), !2308)
    #dbg_value(i16 20159, !1046, !DIExpression(), !2308)
  %conv.i.i = sext i16 %2 to i32, !dbg !2310
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2311
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2312
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2313
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2308)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2308)
  %3 = trunc nsw i32 %shr.i.i to i16, !dbg !2314
  %4 = mul i16 %3, -3329, !dbg !2314
  %conv7.i.i = add i16 %4, %2, !dbg !2314
  %arrayidx2.i6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i2, !dbg !2315
  store i16 %conv7.i.i, ptr %arrayidx2.i6, align 2, !dbg !2316
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !2317
    #dbg_value(i32 %inc.i7, !1031, !DIExpression(), !2305)
  br label %for.cond.i1, !dbg !2318, !llvm.loop !2319

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i1
  ret void, !dbg !2321
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1155 {
entry:
    #dbg_value(ptr %r, !2322, !DIExpression(), !2323)
    #dbg_value(i32 0, !1191, !DIExpression(), !2323)
  br label %for.cond, !dbg !2324

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_reduce.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_reduce.exit ], !dbg !2325
    #dbg_value(i32 %i.0, !1191, !DIExpression(), !2323)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !2326
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2327

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2328
    #dbg_value(ptr %arrayidx, !1027, !DIExpression(), !2329)
    #dbg_value(i32 0, !1031, !DIExpression(), !2329)
  br label %for.cond.i, !dbg !2331

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2332
    #dbg_value(i32 %i.0.i, !1031, !DIExpression(), !2329)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2333
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2334

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2335
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2335
    #dbg_value(i16 %0, !1039, !DIExpression(), !2336)
    #dbg_value(i16 20159, !1046, !DIExpression(), !2336)
  %conv.i.i = sext i16 %0 to i32, !dbg !2338
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2339
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2340
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2341
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2336)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2336)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2342
  %2 = mul i16 %1, -3329, !dbg !2342
  %conv7.i.i = add i16 %2, %0, !dbg !2342
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2343
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2344
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2345
    #dbg_value(i32 %inc.i, !1031, !DIExpression(), !2329)
  br label %for.cond.i, !dbg !2346, !llvm.loop !2347

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2349
    #dbg_value(i32 %inc, !1191, !DIExpression(), !2323)
  br label %for.cond, !dbg !2350, !llvm.loop !2351

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2353
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1101 {
entry:
    #dbg_value(ptr %r, !1649, !DIExpression(), !2354)
    #dbg_value(ptr %a, !1652, !DIExpression(), !2354)
    #dbg_value(ptr %b, !1653, !DIExpression(), !2354)
    #dbg_value(i32 0, !1149, !DIExpression(), !2354)
  br label %for.cond, !dbg !2355

for.cond:                                         ; preds = %pqcrystals_kyber1024_ref_poly_add.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %pqcrystals_kyber1024_ref_poly_add.exit ], !dbg !2356
    #dbg_value(i32 %i.0, !1149, !DIExpression(), !2354)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !2357
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !2358

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !2359
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !2360
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !2361
    #dbg_value(ptr %arrayidx, !1160, !DIExpression(), !2362)
    #dbg_value(ptr %arrayidx2, !1168, !DIExpression(), !2362)
    #dbg_value(ptr %arrayidx4, !1169, !DIExpression(), !2362)
    #dbg_value(i32 0, !1170, !DIExpression(), !2362)
  br label %for.cond.i, !dbg !2364

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !2365
    #dbg_value(i32 %i.0.i, !1170, !DIExpression(), !2362)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2366
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_add.exit, !dbg !2367

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx2, i32 0, i32 %i.0.i, !dbg !2368
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2368
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx4, i32 0, i32 %i.0.i, !dbg !2369
  %1 = load i16, ptr %arrayidx2.i, align 2, !dbg !2369
  %add.i = add i16 %0, %1, !dbg !2370
  %arrayidx6.i = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %i.0.i, !dbg !2371
  store i16 %add.i, ptr %arrayidx6.i, align 2, !dbg !2372
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2373
    #dbg_value(i32 %inc.i, !1170, !DIExpression(), !2362)
  br label %for.cond.i, !dbg !2374, !llvm.loop !2375

pqcrystals_kyber1024_ref_poly_add.exit:           ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2377
    #dbg_value(i32 %inc, !1149, !DIExpression(), !2354)
  br label %for.cond, !dbg !2378, !llvm.loop !2379

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2381
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2382 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2383, !DIExpression(), !2384)
    #dbg_value(ptr %a, !2385, !DIExpression(), !2384)
    #dbg_declare(ptr %t, !2386, !DIExpression(), !2388)
    #dbg_value(i32 0, !2389, !DIExpression(), !2384)
  br label %for.cond, !dbg !2390

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !2392
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !2383, !DIExpression(), !2384)
    #dbg_value(i32 %i.0, !2389, !DIExpression(), !2384)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2393
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !2395

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2396

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2399
    #dbg_value(i32 %j.0, !2400, !DIExpression(), !2384)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2401
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !2396

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2403
  %add = or disjoint i32 %mul, %j.0, !dbg !2405
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2406
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2406
    #dbg_value(i16 %0, !2407, !DIExpression(), !2384)
  %isneg = icmp slt i16 %0, 0, !dbg !2408
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2408
  %add5 = add i16 %and, %0, !dbg !2409
    #dbg_value(i16 %add5, !2407, !DIExpression(), !2384)
  %conv7 = sext i16 %add5 to i32, !dbg !2410
    #dbg_value(i32 %conv7, !2411, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !2384)
    #dbg_value(i32 %conv7, !2411, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !2384)
  %1 = mul i32 %conv7, 1290176, !dbg !2412
  %mul9 = add i32 %1, 67089152, !dbg !2412
    #dbg_value(i32 %mul9, !2411, !DIExpression(), !2384)
  %shr10 = lshr i32 %mul9, 27, !dbg !2413
    #dbg_value(i32 %shr10, !2411, !DIExpression(), !2384)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !2414
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2415
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !2416
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2417
    #dbg_value(i32 %inc, !2400, !DIExpression(), !2384)
  br label %for.cond1, !dbg !2418, !llvm.loop !2419

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !2421
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2422
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !2422
  %shl19 = shl i8 %3, 5, !dbg !2423
  %or = or i8 %shl19, %2, !dbg !2424
  store i8 %or, ptr %r.addr.0, align 1, !dbg !2425
  %4 = lshr i8 %3, 3, !dbg !2426
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2427
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !2427
  %shl27 = shl i8 %5, 2, !dbg !2428
  %or28 = or i8 %shl27, %4, !dbg !2429
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2430
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !2430
  %shl31 = shl i8 %6, 7, !dbg !2431
  %or32 = or i8 %or28, %shl31, !dbg !2432
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !2433
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !2434
  %7 = lshr i8 %6, 1, !dbg !2435
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2436
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !2436
  %shl40 = shl i8 %8, 4, !dbg !2437
  %or41 = or i8 %shl40, %7, !dbg !2438
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !2439
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !2440
  %9 = lshr i8 %8, 4, !dbg !2441
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2442
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !2442
  %shl49 = shl i8 %10, 1, !dbg !2443
  %or50 = or i8 %shl49, %9, !dbg !2444
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2445
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !2445
  %shl53 = shl i8 %11, 6, !dbg !2446
  %or54 = or i8 %or50, %shl53, !dbg !2447
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !2448
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !2449
  %12 = lshr i8 %11, 2, !dbg !2450
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2451
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !2451
  %shl62 = shl i8 %13, 3, !dbg !2452
  %or63 = or i8 %shl62, %12, !dbg !2453
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !2454
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !2455
    #dbg_value(ptr %r.addr.0, !2383, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !2384)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !2456
    #dbg_value(ptr %add.ptr, !2383, !DIExpression(), !2384)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !2457
    #dbg_value(i32 %inc67, !2389, !DIExpression(), !2384)
  br label %for.cond, !dbg !2458, !llvm.loop !2459

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !2461
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2462 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !2463, !DIExpression(), !2464)
    #dbg_value(ptr %a, !2465, !DIExpression(), !2464)
    #dbg_declare(ptr %t, !2466, !DIExpression(), !2467)
    #dbg_value(i32 0, !2468, !DIExpression(), !2464)
  br label %for.cond, !dbg !2469

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !2471
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !2465, !DIExpression(), !2464)
    #dbg_value(i32 %i.0, !2468, !DIExpression(), !2464)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2472
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !2474

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !2475
  store i8 %0, ptr %t, align 1, !dbg !2477
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2478
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !2478
  %or = call i8 @llvm.fshl.i8(i8 %1, i8 %0, i8 3), !dbg !2479
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !2480
  store i8 %or, ptr %arrayidx9, align 1, !dbg !2481
  %2 = lshr i8 %1, 2, !dbg !2482
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !2483
  store i8 %2, ptr %arrayidx14, align 1, !dbg !2484
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !2485
  %3 = load i8, ptr %arrayidx15, align 1, !dbg !2485
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !2486
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !2486
  %or21 = call i8 @llvm.fshl.i8(i8 %4, i8 %3, i8 1), !dbg !2487
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !2488
  store i8 %or21, ptr %arrayidx23, align 1, !dbg !2489
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !2490
  %5 = load i8, ptr %arrayidx27, align 1, !dbg !2490
  %or30 = call i8 @llvm.fshl.i8(i8 %5, i8 %4, i8 4), !dbg !2491
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !2492
  store i8 %or30, ptr %arrayidx32, align 1, !dbg !2493
  %6 = lshr i8 %5, 1, !dbg !2494
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !2495
  store i8 %6, ptr %arrayidx37, align 1, !dbg !2496
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !2497
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !2497
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !2498
  %8 = load i8, ptr %arrayidx41, align 1, !dbg !2498
  %or44 = call i8 @llvm.fshl.i8(i8 %8, i8 %7, i8 2), !dbg !2499
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !2500
  store i8 %or44, ptr %arrayidx46, align 1, !dbg !2501
  %9 = lshr i8 %8, 3, !dbg !2502
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !2503
  store i8 %9, ptr %arrayidx51, align 1, !dbg !2504
    #dbg_value(ptr %add.ptr, !2465, !DIExpression(), !2464)
    #dbg_value(i32 0, !2505, !DIExpression(), !2464)
  br label %for.cond52, !dbg !2506

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !2508
    #dbg_value(i32 %j.0, !2505, !DIExpression(), !2464)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2509
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !2511

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !2512
  %10 = load i8, ptr %arrayidx56, align 1, !dbg !2512
  %11 = and i8 %10, 31, !dbg !2513
  %and = zext nneg i8 %11 to i32, !dbg !2513
  %mul = mul nuw nsw i32 %and, 3329, !dbg !2514
  %add = add nuw nsw i32 %mul, 16, !dbg !2515
  %shr58 = lshr i32 %add, 5, !dbg !2516
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !2517
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !2518
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !2519
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !2520
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !2521
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2522
    #dbg_value(i32 %inc, !2505, !DIExpression(), !2464)
  br label %for.cond52, !dbg !2523, !llvm.loop !2524

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !2526
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !2527
    #dbg_value(i32 %inc64, !2468, !DIExpression(), !2464)
  br label %for.cond, !dbg !2528, !llvm.loop !2529

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !2531
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2532 {
entry:
    #dbg_value(ptr %r, !2533, !DIExpression(), !2534)
    #dbg_value(ptr %a, !2535, !DIExpression(), !2534)
    #dbg_value(i32 0, !2536, !DIExpression(), !2534)
  br label %for.cond, !dbg !2537

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2539
    #dbg_value(i32 %i.0, !2536, !DIExpression(), !2534)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2540
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2542

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !2543
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !2545
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2545
    #dbg_value(i16 %0, !2546, !DIExpression(), !2534)
  %isneg = icmp slt i16 %0, 0, !dbg !2547
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !2547
  %add = add i16 %and, %0, !dbg !2548
    #dbg_value(i16 %add, !2546, !DIExpression(), !2534)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !2549
  %add5 = or disjoint i32 %mul4, 1, !dbg !2550
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !2551
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !2551
    #dbg_value(i16 %1, !2552, !DIExpression(), !2534)
  %isneg1 = icmp slt i16 %1, 0, !dbg !2553
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !2553
  %add11 = add i16 %and9, %1, !dbg !2554
    #dbg_value(i16 %add11, !2552, !DIExpression(), !2534)
  %conv15 = trunc i16 %add to i8, !dbg !2555
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !2556
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !2557
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !2558
  %2 = lshr i16 %add, 8, !dbg !2559
  %shr20 = trunc nuw i16 %2 to i8, !dbg !2559
  %conv21 = trunc i16 %add11 to i8, !dbg !2560
  %shl = shl i8 %conv21, 4, !dbg !2561
  %or = or i8 %shl, %shr20, !dbg !2562
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !2563
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !2564
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2564
  store i8 %or, ptr %arrayidx25, align 1, !dbg !2565
  %4 = lshr i16 %add11, 4, !dbg !2566
  %conv28 = trunc i16 %4 to i8, !dbg !2567
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !2568
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !2569
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !2569
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !2570
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2571
    #dbg_value(i32 %inc, !2536, !DIExpression(), !2534)
  br label %for.cond, !dbg !2572, !llvm.loop !2573

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2575
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !2576 {
entry:
    #dbg_value(ptr %r, !2577, !DIExpression(), !2578)
    #dbg_value(ptr %a, !2579, !DIExpression(), !2578)
    #dbg_value(i32 0, !2580, !DIExpression(), !2578)
  br label %for.cond, !dbg !2581

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2583
    #dbg_value(i32 %i.0, !2580, !DIExpression(), !2578)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !2584
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2586

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !2587
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !2589
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2589
  %conv = zext i8 %0 to i16, !dbg !2589
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !2590
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !2591
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !2591
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2591
  %conv5 = zext i8 %2 to i16, !dbg !2592
  %shl = shl nuw i16 %conv5, 8, !dbg !2593
  %shl.masked = and i16 %shl, 3840, !dbg !2594
  %and = or disjoint i16 %shl.masked, %conv, !dbg !2594
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !2595
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !2596
  store i16 %and, ptr %arrayidx8, align 2, !dbg !2597
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !2598
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !2599
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !2599
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !2599
  %5 = lshr i8 %4, 4, !dbg !2600
  %shr13 = zext nneg i8 %5 to i16, !dbg !2600
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !2601
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !2602
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !2602
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !2602
  %conv18 = zext i8 %7 to i16, !dbg !2603
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !2604
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !2605
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !2606
  %add25 = or disjoint i32 %mul24, 1, !dbg !2607
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !2608
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !2609
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2610
    #dbg_value(i32 %inc, !2580, !DIExpression(), !2578)
  br label %for.cond, !dbg !2611, !llvm.loop !2612

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2614
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1323 {
entry:
    #dbg_value(ptr %r, !1322, !DIExpression(), !2615)
    #dbg_value(ptr %msg, !1328, !DIExpression(), !2615)
    #dbg_value(i32 0, !1329, !DIExpression(), !2615)
  br label %for.cond, !dbg !2616

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !2617
    #dbg_value(i32 %i.0, !1329, !DIExpression(), !2615)
  %exitcond2 = icmp ne i32 %i.0, 32, !dbg !2618
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end11, !dbg !2619

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2620

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !2621
    #dbg_value(i32 %j.0, !1340, !DIExpression(), !2615)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2622
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !2620

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2623
  %add = or disjoint i32 %mul, %j.0, !dbg !2624
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !2625
  store i16 0, ptr %arrayidx, align 2, !dbg !2626
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !2627
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !2627
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !2628
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2629
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !2629
  %conv = zext i8 %0 to i32, !dbg !2629
    #dbg_value(ptr %add.ptr6, !1351, !DIExpression(), !2630)
    #dbg_value(i16 1665, !1357, !DIExpression(), !2630)
    #dbg_value(!DIArgList(i32 %conv, i32 %j.0), !1358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value), !2630)
    #dbg_value(!DIArgList(i16 0, i32 %conv, i32 %j.0), !1358, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shr, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_and, DW_OP_minus, DW_OP_stack_value), !2630)
  %1 = load i16, ptr %add.ptr6, align 2, !dbg !2632
  %2 = shl nuw nsw i32 1, %j.0, !dbg !2633
  %3 = and i32 %2, %conv, !dbg !2633
  %4 = icmp eq i32 %3, 0, !dbg !2633
  %xor6.i = select i1 %4, i16 %1, i16 1665, !dbg !2634
  store i16 %xor6.i, ptr %add.ptr6, align 2, !dbg !2634
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2635
    #dbg_value(i32 %inc, !1340, !DIExpression(), !2615)
  br label %for.cond1, !dbg !2636, !llvm.loop !2637

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !2639
    #dbg_value(i32 %inc10, !1329, !DIExpression(), !2615)
  br label %for.cond, !dbg !2640, !llvm.loop !2641

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !2643
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1883 {
entry:
    #dbg_value(ptr %msg, !2644, !DIExpression(), !2645)
    #dbg_value(ptr %a, !2646, !DIExpression(), !2645)
    #dbg_value(i32 0, !1902, !DIExpression(), !2645)
  br label %for.cond, !dbg !2647

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !2648
    #dbg_value(i32 %i.0, !1902, !DIExpression(), !2645)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !2649
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !2650

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2651
  store i8 0, ptr %arrayidx, align 1, !dbg !2652
    #dbg_value(i32 0, !1909, !DIExpression(), !2645)
  br label %for.cond1, !dbg !2653

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !2654
    #dbg_value(i32 %j.0, !1909, !DIExpression(), !2645)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !2655
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !2656

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2657
  %add = or disjoint i32 %mul, %j.0, !dbg !2658
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !2659
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !2659
  %conv = sext i16 %0 to i32, !dbg !2659
    #dbg_value(i32 %conv, !1920, !DIExpression(), !2645)
    #dbg_value(i32 %conv, !1920, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !2645)
    #dbg_value(i32 %conv, !1920, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !2645)
  %1 = mul i32 %conv, 161270, !dbg !2660
  %mul6 = add i32 %1, 134257275, !dbg !2660
    #dbg_value(i32 %mul6, !1920, !DIExpression(), !2645)
  %shr = lshr i32 %mul6, 28, !dbg !2661
    #dbg_value(i32 %shr, !1920, !DIExpression(), !2645)
  %and = and i32 %shr, 1, !dbg !2662
    #dbg_value(i32 %and, !1920, !DIExpression(), !2645)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !2663
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !2664
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !2665
  %3 = trunc nuw i32 %shl7 to i8, !dbg !2665
  %conv10 = or i8 %2, %3, !dbg !2665
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !2665
  %inc = add nuw nsw i32 %j.0, 1, !dbg !2666
    #dbg_value(i32 %inc, !1909, !DIExpression(), !2645)
  br label %for.cond1, !dbg !2667, !llvm.loop !2668

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !2670
    #dbg_value(i32 %inc12, !1902, !DIExpression(), !2645)
  br label %for.cond, !dbg !2671, !llvm.loop !2672

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2674
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !794 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !804, !DIExpression(), !2675)
    #dbg_value(ptr %seed, !806, !DIExpression(), !2675)
    #dbg_value(i8 %nonce, !807, !DIExpression(), !2675)
    #dbg_declare(ptr %buf, !808, !DIExpression(), !2676)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2677
    #dbg_value(ptr %buf, !816, !DIExpression(), !2679)
    #dbg_value(i32 128, !818, !DIExpression(), !2679)
    #dbg_value(ptr %seed, !819, !DIExpression(), !2679)
    #dbg_value(i8 %nonce, !820, !DIExpression(), !2679)
    #dbg_declare(ptr %extkey.i, !821, !DIExpression(), !2680)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2677
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2681
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2682
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2683
    #dbg_value(ptr %buf, !835, !DIExpression(), !2686)
    #dbg_value(i32 128, !837, !DIExpression(), !2686)
    #dbg_value(ptr %extkey.i, !838, !DIExpression(), !2686)
    #dbg_value(i32 33, !839, !DIExpression(), !2686)
    #dbg_declare(ptr %state.i, !840, !DIExpression(), !2687)
    #dbg_value(ptr %state.i, !842, !DIExpression(), !2688)
    #dbg_value(ptr %extkey.i, !844, !DIExpression(), !2688)
    #dbg_value(i32 33, !845, !DIExpression(), !2688)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2683
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2689
  store i32 136, ptr %pos.i.i, align 8, !dbg !2690
    #dbg_value(i32 0, !848, !DIExpression(), !2686)
    #dbg_value(ptr %buf, !849, !DIExpression(), !2691)
    #dbg_value(i32 0, !853, !DIExpression(), !2691)
    #dbg_value(ptr %state.i, !854, !DIExpression(), !2691)
    #dbg_value(ptr %buf, !600, !DIExpression(), !2693)
    #dbg_value(i32 0, !607, !DIExpression(), !2693)
    #dbg_value(ptr %state.i, !608, !DIExpression(), !2693)
    #dbg_value(i32 136, !609, !DIExpression(), !2693)
    #dbg_value(ptr %buf, !600, !DIExpression(), !2693)
    #dbg_value(i32 0, !607, !DIExpression(), !2693)
    #dbg_value(i32 128, !837, !DIExpression(), !2686)
    #dbg_value(ptr %buf, !835, !DIExpression(), !2686)
    #dbg_value(ptr %buf, !857, !DIExpression(), !2695)
    #dbg_value(i32 128, !861, !DIExpression(), !2695)
    #dbg_value(ptr %state.i, !862, !DIExpression(), !2695)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2697
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2697
    #dbg_value(ptr %buf, !864, !DIExpression(), !2698)
    #dbg_value(i32 128, !870, !DIExpression(), !2698)
    #dbg_value(ptr %state.i, !871, !DIExpression(), !2698)
    #dbg_value(i32 %0, !872, !DIExpression(), !2698)
    #dbg_value(i32 136, !873, !DIExpression(), !2698)
  br label %while.cond.i2, !dbg !2700

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !864, !DIExpression(), !2698)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !2698)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !2698)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2700
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2700

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2701
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2701

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2702
    #dbg_value(i32 0, !872, !DIExpression(), !2698)
  br label %if.end.i, !dbg !2703

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !2698)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !2698)
  br label %for.cond.i7, !dbg !2704

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2705
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !2698)
    #dbg_value(i32 %i.0.i8, !881, !DIExpression(), !2698)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2706
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2707
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2707
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2707
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2708

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2709
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2710
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2710
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2711
  %mul.i12 = and i32 %rem.i, 56, !dbg !2711
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2712
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2712
  %conv.i = trunc i64 %shr.i to i8, !dbg !2710
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2698)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2713
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2714
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !2698)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2715
    #dbg_value(i32 %inc.i13, !881, !DIExpression(), !2698)
  br label %for.cond.i7, !dbg !2716, !llvm.loop !2717

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2705
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2719
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2720
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !2698)
    #dbg_value(i32 %i.0.i8.lcssa, !872, !DIExpression(), !2698)
  br label %while.cond.i2, !dbg !2700, !llvm.loop !2721

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2723
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2724
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2725
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2726
    #dbg_value(ptr %r, !908, !DIExpression(), !2727)
    #dbg_value(ptr %buf, !920, !DIExpression(), !2727)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2729
  ret void, !dbg !2730
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1448 {
entry:
  %state.i = alloca %struct.keccak_state, align 8
  %extkey.i = alloca [33 x i8], align 1
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1450, !DIExpression(), !2731)
    #dbg_value(ptr %seed, !1452, !DIExpression(), !2731)
    #dbg_value(i8 %nonce, !1453, !DIExpression(), !2731)
    #dbg_declare(ptr %buf, !1454, !DIExpression(), !2732)
  call void @llvm.lifetime.start.p0(i64 33, ptr nonnull %extkey.i), !dbg !2733
    #dbg_value(ptr %buf, !816, !DIExpression(), !2735)
    #dbg_value(i32 128, !818, !DIExpression(), !2735)
    #dbg_value(ptr %seed, !819, !DIExpression(), !2735)
    #dbg_value(i8 %nonce, !820, !DIExpression(), !2735)
    #dbg_declare(ptr %extkey.i, !821, !DIExpression(), !2736)
  %call.i = call ptr @memcpy(ptr noundef nonnull %extkey.i, ptr noundef %seed, i32 noundef 32) #5, !dbg !2733
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %extkey.i, i32 32, !dbg !2737
  store i8 %nonce, ptr %arrayidx.i, align 1, !dbg !2738
  call void @llvm.lifetime.start.p0(i64 208, ptr nonnull %state.i), !dbg !2739
    #dbg_value(ptr %buf, !835, !DIExpression(), !2742)
    #dbg_value(i32 128, !837, !DIExpression(), !2742)
    #dbg_value(ptr %extkey.i, !838, !DIExpression(), !2742)
    #dbg_value(i32 33, !839, !DIExpression(), !2742)
    #dbg_declare(ptr %state.i, !840, !DIExpression(), !2743)
    #dbg_value(ptr %state.i, !842, !DIExpression(), !2744)
    #dbg_value(ptr %extkey.i, !844, !DIExpression(), !2744)
    #dbg_value(i32 33, !845, !DIExpression(), !2744)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state.i, i32 noundef 136, ptr noundef nonnull %extkey.i, i32 noundef 33, i8 noundef zeroext 31) #4, !dbg !2739
  %pos.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2745
  store i32 136, ptr %pos.i.i, align 8, !dbg !2746
    #dbg_value(i32 0, !848, !DIExpression(), !2742)
    #dbg_value(ptr %buf, !849, !DIExpression(), !2747)
    #dbg_value(i32 0, !853, !DIExpression(), !2747)
    #dbg_value(ptr %state.i, !854, !DIExpression(), !2747)
    #dbg_value(ptr %buf, !600, !DIExpression(), !2749)
    #dbg_value(i32 0, !607, !DIExpression(), !2749)
    #dbg_value(ptr %state.i, !608, !DIExpression(), !2749)
    #dbg_value(i32 136, !609, !DIExpression(), !2749)
    #dbg_value(ptr %buf, !600, !DIExpression(), !2749)
    #dbg_value(i32 0, !607, !DIExpression(), !2749)
    #dbg_value(i32 128, !837, !DIExpression(), !2742)
    #dbg_value(ptr %buf, !835, !DIExpression(), !2742)
    #dbg_value(ptr %buf, !857, !DIExpression(), !2751)
    #dbg_value(i32 128, !861, !DIExpression(), !2751)
    #dbg_value(ptr %state.i, !862, !DIExpression(), !2751)
  %pos.i1.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2753
  %0 = load i32, ptr %pos.i1.i, align 8, !dbg !2753
    #dbg_value(ptr %buf, !864, !DIExpression(), !2754)
    #dbg_value(i32 128, !870, !DIExpression(), !2754)
    #dbg_value(ptr %state.i, !871, !DIExpression(), !2754)
    #dbg_value(i32 %0, !872, !DIExpression(), !2754)
    #dbg_value(i32 136, !873, !DIExpression(), !2754)
  br label %while.cond.i2, !dbg !2756

while.cond.i2:                                    ; preds = %for.end.i9, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ 128, %entry ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %buf, %entry ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !864, !DIExpression(), !2754)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !2754)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !2754)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !2756
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !2756

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !2757
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !2757

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state.i) #4, !dbg !2758
    #dbg_value(i32 0, !872, !DIExpression(), !2754)
  br label %if.end.i, !dbg !2759

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !2754)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !2754)
  br label %for.cond.i7, !dbg !2760

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !2761
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !2754)
    #dbg_value(i32 %i.0.i8, !881, !DIExpression(), !2754)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !2762
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !2763
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !2763
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !2763
  br i1 %1, label %for.body.i10, label %for.end.i9, !dbg !2764

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !2765
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state.i, i32 %div1.i, !dbg !2766
  %2 = load i64, ptr %arrayidx.i11, align 8, !dbg !2766
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !2767
  %mul.i12 = and i32 %rem.i, 56, !dbg !2767
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !2768
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !2768
  %conv.i = trunc i64 %shr.i to i8, !dbg !2766
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2754)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !2769
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !2770
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !2754)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !2771
    #dbg_value(i32 %inc.i13, !881, !DIExpression(), !2754)
  br label %for.cond.i7, !dbg !2772, !llvm.loop !2773

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !2761
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !2775
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !2776
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !2754)
    #dbg_value(i32 %i.0.i8.lcssa, !872, !DIExpression(), !2754)
  br label %while.cond.i2, !dbg !2756, !llvm.loop !2777

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i.i = getelementptr inbounds nuw i8, ptr %state.i, i32 200, !dbg !2779
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i.i, align 8, !dbg !2780
  call void @llvm.lifetime.end.p0(i64 208, ptr nonnull %state.i), !dbg !2781
  call void @llvm.lifetime.end.p0(i64 33, ptr nonnull %extkey.i), !dbg !2782
    #dbg_value(ptr %r, !1507, !DIExpression(), !2783)
    #dbg_value(ptr %buf, !1511, !DIExpression(), !2783)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef nonnull %buf) #4, !dbg !2785
  ret void, !dbg !2786
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1021 {
entry:
    #dbg_value(ptr %r, !1020, !DIExpression(), !2787)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #4, !dbg !2788
    #dbg_value(ptr %r, !1027, !DIExpression(), !2789)
    #dbg_value(i32 0, !1031, !DIExpression(), !2789)
  br label %for.cond.i, !dbg !2791

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !2792
    #dbg_value(i32 %i.0.i, !1031, !DIExpression(), !2789)
  %exitcond = icmp ne i32 %i.0.i, 256, !dbg !2793
  br i1 %exitcond, label %for.body.i, label %pqcrystals_kyber1024_ref_poly_reduce.exit, !dbg !2794

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2795
  %0 = load i16, ptr %arrayidx.i, align 2, !dbg !2795
    #dbg_value(i16 %0, !1039, !DIExpression(), !2796)
    #dbg_value(i16 20159, !1046, !DIExpression(), !2796)
  %conv.i.i = sext i16 %0 to i32, !dbg !2798
  %mul.i.i = mul nsw i32 %conv.i.i, 20159, !dbg !2799
  %add.i.i = add nsw i32 %mul.i.i, 33554432, !dbg !2800
  %shr.i.i = ashr i32 %add.i.i, 26, !dbg !2801
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2796)
    #dbg_value(i32 %shr.i.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2796)
  %1 = trunc nsw i32 %shr.i.i to i16, !dbg !2802
  %2 = mul i16 %1, -3329, !dbg !2802
  %conv7.i.i = add i16 %2, %0, !dbg !2802
  %arrayidx2.i = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0.i, !dbg !2803
  store i16 %conv7.i.i, ptr %arrayidx2.i, align 2, !dbg !2804
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !2805
    #dbg_value(i32 %inc.i, !1031, !DIExpression(), !2789)
  br label %for.cond.i, !dbg !2806, !llvm.loop !2807

pqcrystals_kyber1024_ref_poly_reduce.exit:        ; preds = %for.cond.i
  ret void, !dbg !2809
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1028 {
entry:
    #dbg_value(ptr %r, !1027, !DIExpression(), !2810)
    #dbg_value(i32 0, !1031, !DIExpression(), !2810)
  br label %for.cond, !dbg !2811

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2812
    #dbg_value(i32 %i.0, !1031, !DIExpression(), !2810)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2813
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2814

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2815
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2815
    #dbg_value(i16 %0, !1039, !DIExpression(), !2816)
    #dbg_value(i16 20159, !1046, !DIExpression(), !2816)
  %conv.i = sext i16 %0 to i32, !dbg !2818
  %mul.i = mul nsw i32 %conv.i, 20159, !dbg !2819
  %add.i = add nsw i32 %mul.i, 33554432, !dbg !2820
  %shr.i = ashr i32 %add.i, 26, !dbg !2821
    #dbg_value(i32 %shr.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !2816)
    #dbg_value(i32 %shr.i, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !2816)
  %1 = trunc nsw i32 %shr.i to i16, !dbg !2822
  %2 = mul i16 %1, -3329, !dbg !2822
  %conv7.i = add i16 %2, %0, !dbg !2822
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2823
  store i16 %conv7.i, ptr %arrayidx2, align 2, !dbg !2824
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2825
    #dbg_value(i32 %inc, !1031, !DIExpression(), !2810)
  br label %for.cond, !dbg !2826, !llvm.loop !2827

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2829
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1638 {
entry:
    #dbg_value(ptr %r, !1637, !DIExpression(), !2830)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #4, !dbg !2831
  ret void, !dbg !2832
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !2833 {
entry:
    #dbg_value(ptr %r, !2834, !DIExpression(), !2835)
    #dbg_value(ptr %a, !2836, !DIExpression(), !2835)
    #dbg_value(ptr %b, !2837, !DIExpression(), !2835)
    #dbg_value(i32 0, !2838, !DIExpression(), !2835)
  br label %for.cond, !dbg !2839

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2841
    #dbg_value(i32 %i.0, !2838, !DIExpression(), !2835)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !2842
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2844

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !2845
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !2847
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !2848
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !2849
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !2850
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !2851
  %add = or disjoint i32 %i.0, 64, !dbg !2852
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !2853
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !2853
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #4, !dbg !2854
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !2855
  %add10 = or disjoint i32 %mul9, 2, !dbg !2856
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !2857
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !2858
  %add14 = or disjoint i32 %mul13, 2, !dbg !2859
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !2860
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !2861
  %add18 = or disjoint i32 %mul17, 2, !dbg !2862
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !2863
  %add20 = or disjoint i32 %i.0, 64, !dbg !2864
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !2865
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !2865
  %sub = sub i16 0, %1, !dbg !2866
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #4, !dbg !2867
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2868
    #dbg_value(i32 %inc, !2838, !DIExpression(), !2835)
  br label %for.cond, !dbg !2869, !llvm.loop !2870

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2872
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1113 {
entry:
    #dbg_value(ptr %r, !1112, !DIExpression(), !2873)
    #dbg_value(i16 1353, !1116, !DIExpression(), !2873)
    #dbg_value(i32 0, !1117, !DIExpression(), !2873)
  br label %for.cond, !dbg !2874

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2875
    #dbg_value(i32 %i.0, !1117, !DIExpression(), !2873)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2876
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2877

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2878
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2878
  %conv = sext i16 %0 to i32, !dbg !2879
  %mul = mul nsw i32 %conv, 1353, !dbg !2880
    #dbg_value(i32 %mul, !1127, !DIExpression(), !2881)
    #dbg_value(i32 %mul, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2881)
  %sext.i = mul i32 %conv, 1346961408, !dbg !2883
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2883
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2884
  %sub.i = add nsw i32 %mul4.neg.i, %mul, !dbg !2885
  %shr.i = lshr i32 %sub.i, 16, !dbg !2886
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2887
    #dbg_value(i16 %conv5.i, !1132, !DIExpression(), !2881)
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2888
  store i16 %conv5.i, ptr %arrayidx2, align 2, !dbg !2889
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2890
    #dbg_value(i32 %inc, !1117, !DIExpression(), !2873)
  br label %for.cond, !dbg !2891, !llvm.loop !2892

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2894
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1161 {
entry:
    #dbg_value(ptr %r, !1160, !DIExpression(), !2895)
    #dbg_value(ptr %a, !1168, !DIExpression(), !2895)
    #dbg_value(ptr %b, !1169, !DIExpression(), !2895)
    #dbg_value(i32 0, !1170, !DIExpression(), !2895)
  br label %for.cond, !dbg !2896

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2897
    #dbg_value(i32 %i.0, !1170, !DIExpression(), !2895)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2898
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2899

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2900
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2900
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2901
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2901
  %add = add i16 %0, %1, !dbg !2902
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2903
  store i16 %add, ptr %arrayidx6, align 2, !dbg !2904
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2905
    #dbg_value(i32 %inc, !1170, !DIExpression(), !2895)
  br label %for.cond, !dbg !2906, !llvm.loop !2907

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2909
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1855 {
entry:
    #dbg_value(ptr %r, !1854, !DIExpression(), !2910)
    #dbg_value(ptr %a, !1858, !DIExpression(), !2910)
    #dbg_value(ptr %b, !1859, !DIExpression(), !2910)
    #dbg_value(i32 0, !1860, !DIExpression(), !2910)
  br label %for.cond, !dbg !2911

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2912
    #dbg_value(i32 %i.0, !1860, !DIExpression(), !2910)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !2913
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2914

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !2915
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2915
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !2916
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !2916
  %sub = sub i16 %0, %1, !dbg !2917
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !2918
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !2919
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2920
    #dbg_value(i32 %inc, !1860, !DIExpression(), !2910)
  br label %for.cond, !dbg !2921, !llvm.loop !2922

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2924
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2925 {
entry:
    #dbg_value(ptr %r, !2928, !DIExpression(), !2929)
    #dbg_value(i32 1, !2930, !DIExpression(), !2929)
    #dbg_value(i32 128, !2931, !DIExpression(), !2929)
  br label %for.cond, !dbg !2932

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !2934
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !2935
    #dbg_value(i32 %k.0, !2930, !DIExpression(), !2929)
    #dbg_value(i32 %len.0, !2931, !DIExpression(), !2929)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !2936
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !2938

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2939

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !2942
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !2929
    #dbg_value(i32 %k.1, !2930, !DIExpression(), !2929)
    #dbg_value(i32 %start.0, !2943, !DIExpression(), !2929)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !2944
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !2939

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !2930, !DIExpression(), !2929)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !2946
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2946
    #dbg_value(i16 %0, !2948, !DIExpression(), !2929)
    #dbg_value(i32 %start.0, !2949, !DIExpression(), !2929)
  br label %for.cond4, !dbg !2950

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !2952
    #dbg_value(i32 %j.0, !2949, !DIExpression(), !2929)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !2953
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !2955
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !2956

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2957
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !2957
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !2957
    #dbg_value(i16 %0, !2959, !DIExpression(), !2963)
    #dbg_value(i16 %2, !2965, !DIExpression(), !2963)
  %conv.i = sext i16 %0 to i32, !dbg !2966
  %conv1.i = sext i16 %2 to i32, !dbg !2967
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !2968
    #dbg_value(i32 %mul.i, !1127, !DIExpression(), !2969)
    #dbg_value(i32 %mul.i, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !2969)
  %sext.i = mul i32 %mul.i, -218038272, !dbg !2971
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !2971
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !2972
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !2973
  %shr.i = lshr i32 %sub.i, 16, !dbg !2974
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !2975
    #dbg_value(i16 %conv5.i, !1132, !DIExpression(), !2969)
    #dbg_value(i16 %conv5.i, !2976, !DIExpression(), !2929)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2977
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !2977
  %sub = sub i16 %3, %conv5.i, !dbg !2978
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !2979
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !2979
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !2980
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2981
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !2981
  %add17 = add i16 %5, %conv5.i, !dbg !2982
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2983
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !2984
  %inc20 = add nuw i32 %j.0, 1, !dbg !2985
    #dbg_value(i32 %inc20, !2949, !DIExpression(), !2929)
  br label %for.cond4, !dbg !2986, !llvm.loop !2987

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !2952
  %inc = add i32 %k.1, 1, !dbg !2989
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !2990
    #dbg_value(i32 %add22, !2943, !DIExpression(), !2929)
  br label %for.cond1, !dbg !2991, !llvm.loop !2992

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !2929
  %shr = lshr i32 %len.0, 1, !dbg !2994
    #dbg_value(i32 %shr, !2931, !DIExpression(), !2929)
  br label %for.cond, !dbg !2995, !llvm.loop !2996

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !2998
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !2999 {
entry:
    #dbg_value(ptr %r, !3000, !DIExpression(), !3001)
    #dbg_value(i16 1441, !3002, !DIExpression(), !3001)
    #dbg_value(i32 127, !3003, !DIExpression(), !3001)
    #dbg_value(i32 2, !3004, !DIExpression(), !3001)
  br label %for.cond, !dbg !3005

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !3007
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !3008
    #dbg_value(i32 %k.0, !3003, !DIExpression(), !3001)
    #dbg_value(i32 %len.0, !3004, !DIExpression(), !3001)
  %cmp = icmp ult i32 %len.0, 129, !dbg !3009
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !3011

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !3012

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !3015

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !3017
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !3001
    #dbg_value(i32 %k.1, !3003, !DIExpression(), !3001)
    #dbg_value(i32 %start.0, !3018, !DIExpression(), !3001)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !3019
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !3012

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !3003, !DIExpression(), !3001)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !3021
  %0 = load i16, ptr %arrayidx, align 2, !dbg !3021
    #dbg_value(i16 %0, !3023, !DIExpression(), !3001)
    #dbg_value(i32 %start.0, !3024, !DIExpression(), !3001)
  br label %for.cond4, !dbg !3025

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !3027
    #dbg_value(i32 %j.0, !3024, !DIExpression(), !3001)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !3028
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !3030
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !3031

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3032
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !3032
    #dbg_value(i16 %1, !3034, !DIExpression(), !3001)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3035
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !3035
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !3035
  %add11 = add i16 %1, %3, !dbg !3036
    #dbg_value(i16 %add11, !1039, !DIExpression(), !3037)
    #dbg_value(i16 20159, !1046, !DIExpression(), !3037)
  %conv.i10 = sext i16 %add11 to i32, !dbg !3039
  %mul.i11 = mul nsw i32 %conv.i10, 20159, !dbg !3040
  %add.i = add nsw i32 %mul.i11, 33554432, !dbg !3041
  %shr.i12 = ashr i32 %add.i, 26, !dbg !3042
    #dbg_value(i32 %shr.i12, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3037)
    #dbg_value(i32 %shr.i12, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3037)
  %4 = trunc nsw i32 %shr.i12 to i16, !dbg !3043
  %5 = mul i16 %4, -3329, !dbg !3043
  %conv7.i = add i16 %5, %add11, !dbg !3043
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !3044
  store i16 %conv7.i, ptr %arrayidx13, align 2, !dbg !3045
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3046
  %arrayidx15 = getelementptr i16, ptr %6, i32 %len.0, !dbg !3046
  %7 = load i16, ptr %arrayidx15, align 2, !dbg !3046
  %sub = sub i16 %7, %1, !dbg !3047
  %8 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3048
  %arrayidx20 = getelementptr i16, ptr %8, i32 %len.0, !dbg !3048
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !3049
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3050
  %arrayidx22 = getelementptr i16, ptr %9, i32 %len.0, !dbg !3050
  %10 = load i16, ptr %arrayidx22, align 2, !dbg !3050
    #dbg_value(i16 %0, !2959, !DIExpression(), !3051)
    #dbg_value(i16 %10, !2965, !DIExpression(), !3051)
  %conv.i1 = sext i16 %0 to i32, !dbg !3053
  %conv1.i = sext i16 %10 to i32, !dbg !3054
  %mul.i2 = mul nsw i32 %conv.i1, %conv1.i, !dbg !3055
    #dbg_value(i32 %mul.i2, !1127, !DIExpression(), !3056)
    #dbg_value(i32 %mul.i2, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3056)
  %sext.i4 = mul i32 %mul.i2, -218038272, !dbg !3058
  %conv3.i5 = ashr exact i32 %sext.i4, 16, !dbg !3058
  %mul4.neg.i6 = mul nsw i32 %conv3.i5, -3329, !dbg !3059
  %sub.i7 = add nsw i32 %mul4.neg.i6, %mul.i2, !dbg !3060
  %shr.i8 = lshr i32 %sub.i7, 16, !dbg !3061
  %conv5.i9 = trunc nuw i32 %shr.i8 to i16, !dbg !3062
    #dbg_value(i16 %conv5.i9, !1132, !DIExpression(), !3056)
  %11 = getelementptr i16, ptr %r, i32 %j.0, !dbg !3063
  %arrayidx25 = getelementptr i16, ptr %11, i32 %len.0, !dbg !3063
  store i16 %conv5.i9, ptr %arrayidx25, align 2, !dbg !3064
  %inc = add nuw i32 %j.0, 1, !dbg !3065
    #dbg_value(i32 %inc, !3024, !DIExpression(), !3001)
  br label %for.cond4, !dbg !3066, !llvm.loop !3067

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !3027
  %dec = add i32 %k.1, -1, !dbg !3069
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !3070
    #dbg_value(i32 %add27, !3018, !DIExpression(), !3001)
  br label %for.cond1, !dbg !3071, !llvm.loop !3072

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !3001
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !3074
    #dbg_value(i32 %shl, !3004, !DIExpression(), !3001)
  br label %for.cond, !dbg !3075, !llvm.loop !3076

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !3078
    #dbg_value(i32 %j.1, !3024, !DIExpression(), !3001)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !3079
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !3015

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !3081
  %12 = load i16, ptr %arrayidx35, align 2, !dbg !3081
    #dbg_value(i16 %12, !2959, !DIExpression(), !3082)
    #dbg_value(i16 1441, !2965, !DIExpression(), !3082)
  %conv.i = sext i16 %12 to i32, !dbg !3084
  %mul.i = mul nsw i32 %conv.i, 1441, !dbg !3085
    #dbg_value(i32 %mul.i, !1127, !DIExpression(), !3086)
    #dbg_value(i32 %mul.i, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3086)
  %sext.i = mul i32 %conv.i, -660537344, !dbg !3088
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3088
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3089
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i, !dbg !3090
  %shr.i = lshr i32 %sub.i, 16, !dbg !3091
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3092
    #dbg_value(i16 %conv5.i, !1132, !DIExpression(), !3086)
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !3093
  store i16 %conv5.i, ptr %arrayidx37, align 2, !dbg !3094
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !3095
    #dbg_value(i32 %inc39, !3024, !DIExpression(), !3001)
  br label %for.cond31, !dbg !3096, !llvm.loop !3097

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !3099
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !3100 {
entry:
    #dbg_value(ptr %r, !3104, !DIExpression(), !3105)
    #dbg_value(ptr %a, !3106, !DIExpression(), !3105)
    #dbg_value(ptr %b, !3107, !DIExpression(), !3105)
    #dbg_value(i16 %zeta, !3108, !DIExpression(), !3105)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3109
  %0 = load i16, ptr %arrayidx, align 2, !dbg !3109
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3110
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !3110
    #dbg_value(i16 %0, !2959, !DIExpression(), !3111)
    #dbg_value(i16 %1, !2965, !DIExpression(), !3111)
  %conv.i9 = sext i16 %0 to i32, !dbg !3113
  %conv1.i10 = sext i16 %1 to i32, !dbg !3114
  %mul.i11 = mul nsw i32 %conv.i9, %conv1.i10, !dbg !3115
    #dbg_value(i32 %mul.i11, !1127, !DIExpression(), !3116)
    #dbg_value(i32 %mul.i11, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3116)
  %sext.i23 = mul i32 %mul.i11, -218038272, !dbg !3118
  %conv3.i24 = ashr exact i32 %sext.i23, 16, !dbg !3118
  %mul4.neg.i25 = mul nsw i32 %conv3.i24, -3329, !dbg !3119
  %sub.i26 = add nsw i32 %mul4.neg.i25, %mul.i11, !dbg !3120
  %shr.i27 = lshr i32 %sub.i26, 16, !dbg !3121
  %conv5.i28 = trunc nuw i32 %shr.i27 to i16, !dbg !3122
    #dbg_value(i16 %conv5.i28, !1132, !DIExpression(), !3116)
  store i16 %conv5.i28, ptr %r, align 2, !dbg !3123
    #dbg_value(i16 %conv5.i28, !2959, !DIExpression(), !3124)
    #dbg_value(i16 %zeta, !2965, !DIExpression(), !3124)
  %conv.i5 = ashr i32 %sub.i26, 16, !dbg !3126
  %conv1.i6 = sext i16 %zeta to i32, !dbg !3127
  %mul.i7 = mul nsw i32 %conv.i5, %conv1.i6, !dbg !3128
    #dbg_value(i32 %mul.i7, !1127, !DIExpression(), !3129)
    #dbg_value(i32 %mul.i7, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3129)
  %sext.i = mul i32 %mul.i7, -218038272, !dbg !3131
  %conv3.i = ashr exact i32 %sext.i, 16, !dbg !3131
  %mul4.neg.i = mul nsw i32 %conv3.i, -3329, !dbg !3132
  %sub.i = add nsw i32 %mul4.neg.i, %mul.i7, !dbg !3133
  %shr.i = lshr i32 %sub.i, 16, !dbg !3134
  %conv5.i = trunc nuw i32 %shr.i to i16, !dbg !3135
    #dbg_value(i16 %conv5.i, !1132, !DIExpression(), !3129)
  store i16 %conv5.i, ptr %r, align 2, !dbg !3136
  %2 = load i16, ptr %a, align 2, !dbg !3137
  %3 = load i16, ptr %b, align 2, !dbg !3138
    #dbg_value(i16 %2, !2959, !DIExpression(), !3139)
    #dbg_value(i16 %3, !2965, !DIExpression(), !3139)
  %conv.i13 = sext i16 %2 to i32, !dbg !3141
  %conv1.i14 = sext i16 %3 to i32, !dbg !3142
  %mul.i15 = mul nsw i32 %conv.i13, %conv1.i14, !dbg !3143
    #dbg_value(i32 %mul.i15, !1127, !DIExpression(), !3144)
    #dbg_value(i32 %mul.i15, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3144)
  %sext.i29 = mul i32 %mul.i15, -218038272, !dbg !3146
  %conv3.i30 = ashr exact i32 %sext.i29, 16, !dbg !3146
  %mul4.neg.i31 = mul nsw i32 %conv3.i30, -3329, !dbg !3147
  %sub.i32 = add nsw i32 %mul4.neg.i31, %mul.i15, !dbg !3148
  %shr.i33 = lshr i32 %sub.i32, 16, !dbg !3149
  %conv5.i34 = trunc nuw i32 %shr.i33 to i16, !dbg !3150
    #dbg_value(i16 %conv5.i34, !1132, !DIExpression(), !3144)
  %4 = load i16, ptr %r, align 2, !dbg !3151
  %add = add i16 %4, %conv5.i34, !dbg !3151
  store i16 %add, ptr %r, align 2, !dbg !3151
  %5 = load i16, ptr %a, align 2, !dbg !3152
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !3153
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !3153
    #dbg_value(i16 %5, !2959, !DIExpression(), !3154)
    #dbg_value(i16 %6, !2965, !DIExpression(), !3154)
  %conv.i = sext i16 %5 to i32, !dbg !3156
  %conv1.i = sext i16 %6 to i32, !dbg !3157
  %mul.i = mul nsw i32 %conv.i, %conv1.i, !dbg !3158
    #dbg_value(i32 %mul.i, !1127, !DIExpression(), !3159)
    #dbg_value(i32 %mul.i, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3159)
  %sext.i35 = mul i32 %mul.i, -218038272, !dbg !3161
  %conv3.i36 = ashr exact i32 %sext.i35, 16, !dbg !3161
  %mul4.neg.i37 = mul nsw i32 %conv3.i36, -3329, !dbg !3162
  %sub.i38 = add nsw i32 %mul4.neg.i37, %mul.i, !dbg !3163
  %shr.i39 = lshr i32 %sub.i38, 16, !dbg !3164
  %conv5.i40 = trunc nuw i32 %shr.i39 to i16, !dbg !3165
    #dbg_value(i16 %conv5.i40, !1132, !DIExpression(), !3159)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3166
  store i16 %conv5.i40, ptr %arrayidx15, align 2, !dbg !3167
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !3168
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !3168
  %8 = load i16, ptr %b, align 2, !dbg !3169
    #dbg_value(i16 %7, !2959, !DIExpression(), !3170)
    #dbg_value(i16 %8, !2965, !DIExpression(), !3170)
  %conv.i1 = sext i16 %7 to i32, !dbg !3172
  %conv1.i2 = sext i16 %8 to i32, !dbg !3173
  %mul.i3 = mul nsw i32 %conv.i1, %conv1.i2, !dbg !3174
    #dbg_value(i32 %mul.i3, !1127, !DIExpression(), !3175)
    #dbg_value(i32 %mul.i3, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3175)
  %sext.i17 = mul i32 %mul.i3, -218038272, !dbg !3177
  %conv3.i18 = ashr exact i32 %sext.i17, 16, !dbg !3177
  %mul4.neg.i19 = mul nsw i32 %conv3.i18, -3329, !dbg !3178
  %sub.i20 = add nsw i32 %mul4.neg.i19, %mul.i3, !dbg !3179
  %shr.i21 = lshr i32 %sub.i20, 16, !dbg !3180
  %conv5.i22 = trunc nuw i32 %shr.i21 to i16, !dbg !3181
    #dbg_value(i16 %conv5.i22, !1132, !DIExpression(), !3175)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !3182
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !3183
  %add22 = add i16 %9, %conv5.i22, !dbg !3183
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !3183
  ret void, !dbg !3184
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !909 {
entry:
    #dbg_value(ptr %r, !908, !DIExpression(), !3185)
    #dbg_value(ptr %buf, !920, !DIExpression(), !3185)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3186
  ret void, !dbg !3187
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !3188 {
entry:
    #dbg_value(ptr %r, !3189, !DIExpression(), !3190)
    #dbg_value(ptr %buf, !3191, !DIExpression(), !3190)
    #dbg_value(i32 0, !3192, !DIExpression(), !3190)
  br label %for.cond, !dbg !3193

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !3195
    #dbg_value(i32 %i.0, !3192, !DIExpression(), !3190)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !3196
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !3198

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !3199
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !3201
    #dbg_value(ptr %add.ptr, !3202, !DIExpression(), !3206)
  %0 = load i8, ptr %add.ptr, align 1, !dbg !3208
  %conv.i = zext i8 %0 to i32, !dbg !3209
    #dbg_value(i32 %conv.i, !3210, !DIExpression(), !3206)
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 1, !dbg !3211
  %1 = load i8, ptr %arrayidx1.i, align 1, !dbg !3211
  %conv2.i = zext i8 %1 to i32, !dbg !3212
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !3213
  %or.i = or disjoint i32 %shl.i, %conv.i, !dbg !3214
    #dbg_value(i32 %or.i, !3210, !DIExpression(), !3206)
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 2, !dbg !3215
  %2 = load i8, ptr %arrayidx3.i, align 1, !dbg !3215
  %conv4.i = zext i8 %2 to i32, !dbg !3216
  %shl5.i = shl nuw nsw i32 %conv4.i, 16, !dbg !3217
  %or6.i = or disjoint i32 %or.i, %shl5.i, !dbg !3218
    #dbg_value(i32 %or6.i, !3210, !DIExpression(), !3206)
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 3, !dbg !3219
  %3 = load i8, ptr %arrayidx7.i, align 1, !dbg !3219
  %conv8.i = zext i8 %3 to i32, !dbg !3220
  %shl9.i = shl nuw i32 %conv8.i, 24, !dbg !3221
  %or10.i = or disjoint i32 %or6.i, %shl9.i, !dbg !3222
    #dbg_value(i32 %or10.i, !3210, !DIExpression(), !3206)
    #dbg_value(i32 %or10.i, !3223, !DIExpression(), !3190)
  %and = and i32 %or10.i, 1431655765, !dbg !3224
    #dbg_value(i32 %and, !3225, !DIExpression(), !3190)
  %shr = lshr i32 %or10.i, 1, !dbg !3226
  %and1 = and i32 %shr, 1431655765, !dbg !3227
  %add = add nuw i32 %and, %and1, !dbg !3228
    #dbg_value(i32 %add, !3225, !DIExpression(), !3190)
    #dbg_value(i32 0, !3229, !DIExpression(), !3190)
  br label %for.cond2, !dbg !3230

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !3232
    #dbg_value(i32 %j.0, !3229, !DIExpression(), !3190)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !3233
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !3235

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !3236
  %shr7 = lshr i32 %add, %mul5, !dbg !3238
  %conv = and i32 %shr7, 3, !dbg !3239
    #dbg_value(i32 %shr7, !3240, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !3190)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !3241
  %add10 = or disjoint i32 %mul9, 2, !dbg !3242
  %shr11 = lshr i32 %add, %add10, !dbg !3243
  %conv13 = and i32 %shr11, 3, !dbg !3244
    #dbg_value(i32 %conv13, !3245, !DIExpression(), !3190)
  %sub = sub nsw i32 %conv, %conv13, !dbg !3246
  %conv16 = trunc nsw i32 %sub to i16, !dbg !3247
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !3248
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !3249
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !3250
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !3251
  %inc = add nuw nsw i32 %j.0, 1, !dbg !3252
    #dbg_value(i32 %inc, !3229, !DIExpression(), !3190)
  br label %for.cond2, !dbg !3253, !llvm.loop !3254

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !3256
    #dbg_value(i32 %inc20, !3192, !DIExpression(), !3190)
  br label %for.cond, !dbg !3257, !llvm.loop !3258

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !3260
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1508 {
entry:
    #dbg_value(ptr %r, !1507, !DIExpression(), !3261)
    #dbg_value(ptr %buf, !1511, !DIExpression(), !3261)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #4, !dbg !3262
  ret void, !dbg !3263
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1128 {
entry:
    #dbg_value(i32 %a, !1127, !DIExpression(), !3264)
    #dbg_value(i32 %a, !1132, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !3264)
  %sext = mul i32 %a, -218038272, !dbg !3265
  %conv3 = ashr exact i32 %sext, 16, !dbg !3265
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !3266
  %sub = add i32 %mul4.neg, %a, !dbg !3267
  %shr = lshr i32 %sub, 16, !dbg !3268
  %conv5 = trunc nuw i32 %shr to i16, !dbg !3269
    #dbg_value(i16 %conv5, !1132, !DIExpression(), !3264)
  ret i16 %conv5, !dbg !3270
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1040 {
entry:
    #dbg_value(i16 %a, !1039, !DIExpression(), !3271)
    #dbg_value(i16 20159, !1046, !DIExpression(), !3271)
  %conv = sext i16 %a to i32, !dbg !3272
  %mul = mul nsw i32 %conv, 20159, !dbg !3273
  %add = add nsw i32 %mul, 33554432, !dbg !3274
  %shr = ashr i32 %add, 26, !dbg !3275
    #dbg_value(i32 %shr, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !3271)
    #dbg_value(i32 %shr, !1051, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !3271)
  %0 = trunc nsw i32 %shr to i16, !dbg !3276
  %1 = mul i16 %0, -3329, !dbg !3276
  %conv7 = add i16 %1, %a, !dbg !3276
  ret i16 %conv7, !dbg !3277
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !414 {
entry:
    #dbg_value(ptr %a, !413, !DIExpression(), !3278)
    #dbg_value(ptr %b, !420, !DIExpression(), !3278)
    #dbg_value(i32 %len, !421, !DIExpression(), !3278)
    #dbg_value(i8 0, !422, !DIExpression(), !3278)
    #dbg_value(i32 0, !423, !DIExpression(), !3278)
  br label %for.cond, !dbg !3279

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3280
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !3278
    #dbg_value(i8 %r.0, !422, !DIExpression(), !3278)
    #dbg_value(i32 %i.0, !423, !DIExpression(), !3278)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3281
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !3282

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3278)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3283
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3283
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !3284
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !3284
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3278)
  %xor1 = xor i8 %0, %1, !dbg !3285
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !422, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3278)
  %or2 = or i8 %r.0, %xor1, !dbg !3286
    #dbg_value(i8 %or2, !422, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3278)
    #dbg_value(i8 %or2, !422, !DIExpression(), !3278)
  %inc = add i32 %i.0, 1, !dbg !3287
    #dbg_value(i32 %inc, !423, !DIExpression(), !3278)
  br label %for.cond, !dbg !3288, !llvm.loop !3289

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !3278
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !3291
  %conv6 = zext i1 %2 to i32, !dbg !3292
  ret i32 %conv6, !dbg !3293
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !443 {
entry:
    #dbg_value(ptr %r, !442, !DIExpression(), !3294)
    #dbg_value(ptr %x, !448, !DIExpression(), !3294)
    #dbg_value(i32 %len, !449, !DIExpression(), !3294)
    #dbg_value(i8 %b, !450, !DIExpression(), !3294)
  %0 = call i8 asm "", "=r,0"(i8 %b) #6, !dbg !3295, !srcloc !452
    #dbg_value(i8 %0, !450, !DIExpression(), !3294)
  %sub = sub i8 0, %0, !dbg !3296
    #dbg_value(i8 %sub, !450, !DIExpression(), !3294)
    #dbg_value(i32 0, !454, !DIExpression(), !3294)
  br label %for.cond, !dbg !3297

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3298
    #dbg_value(i32 %i.0, !454, !DIExpression(), !3294)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !3299
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3300

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3301
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3301
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3302
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !3302
  %xor1 = xor i8 %1, %2, !dbg !3303
  %and2 = and i8 %xor1, %sub, !dbg !3304
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3305
  %xor93 = xor i8 %1, %and2, !dbg !3306
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !3306
  %inc = add i32 %i.0, 1, !dbg !3307
    #dbg_value(i32 %inc, !454, !DIExpression(), !3294)
  br label %for.cond, !dbg !3308, !llvm.loop !3309

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3311
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1352 {
entry:
    #dbg_value(ptr %r, !1351, !DIExpression(), !3312)
    #dbg_value(i16 %v, !1357, !DIExpression(), !3312)
    #dbg_value(i16 %b, !1358, !DIExpression(), !3312)
  %sub = sub i16 0, %b, !dbg !3313
    #dbg_value(i16 %sub, !1358, !DIExpression(), !3312)
  %0 = load i16, ptr %r, align 2, !dbg !3314
  %xor1 = xor i16 %0, %v, !dbg !3315
  %and = and i16 %xor1, %sub, !dbg !3316
  %xor6 = xor i16 %and, %0, !dbg !3317
  store i16 %xor6, ptr %r, align 2, !dbg !3317
  ret void, !dbg !3318
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !3319 {
entry:
    #dbg_value(ptr %state, !3322, !DIExpression(), !3323)
    #dbg_value(ptr %state, !3324, !DIExpression(), !3328)
    #dbg_value(i32 0, !3330, !DIExpression(), !3328)
  br label %for.cond.i, !dbg !3331

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !3333
    #dbg_value(i32 %i.0.i, !3330, !DIExpression(), !3328)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !3334
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !3336

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !3337
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3338
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3339
    #dbg_value(i32 %inc.i, !3330, !DIExpression(), !3328)
  br label %for.cond.i, !dbg !3340, !llvm.loop !3341

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3343
  store i32 0, ptr %pos, align 8, !dbg !3344
  ret void, !dbg !3345
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !3346 {
entry:
    #dbg_value(ptr %state, !3347, !DIExpression(), !3348)
    #dbg_value(ptr %in, !3349, !DIExpression(), !3348)
    #dbg_value(i32 %inlen, !3350, !DIExpression(), !3348)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3351
  %0 = load i32, ptr %pos, align 8, !dbg !3351
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #4, !dbg !3352
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3353
  store i32 %call, ptr %pos1, align 8, !dbg !3354
  ret void, !dbg !3355
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !3356 {
entry:
    #dbg_value(ptr %s, !3359, !DIExpression(), !3360)
    #dbg_value(i32 %pos, !3361, !DIExpression(), !3360)
    #dbg_value(i32 %r, !3362, !DIExpression(), !3360)
    #dbg_value(ptr %in, !3363, !DIExpression(), !3360)
    #dbg_value(i32 %inlen, !3364, !DIExpression(), !3360)
  br label %while.cond, !dbg !3365

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !3361, !DIExpression(), !3360)
    #dbg_value(i32 %inlen.addr.0, !3364, !DIExpression(), !3360)
    #dbg_value(ptr %in.addr.0, !3363, !DIExpression(), !3360)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !3366
  %cmp.not = icmp ult i32 %add, %r, !dbg !3367
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !3365

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !3368
  br label %for.cond, !dbg !3368

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !3371

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !3373
    #dbg_value(i32 %i.0, !3374, !DIExpression(), !3360)
    #dbg_value(ptr %in.addr.1, !3363, !DIExpression(), !3360)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !3375
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3368

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !3363, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3360)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !3377
  %conv = zext i8 %0 to i64, !dbg !3378
  %rem = shl i32 %i.0, 3, !dbg !3379
  %mul = and i32 %rem, 56, !dbg !3379
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3380
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !3380
  %div2 = lshr i32 %i.0, 3, !dbg !3381
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !3382
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3383
  %xor = xor i64 %1, %shl, !dbg !3383
  store i64 %xor, ptr %arrayidx, align 8, !dbg !3383
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !3384
    #dbg_value(ptr %incdec.ptr, !3363, !DIExpression(), !3360)
  %inc = add i32 %i.0, 1, !dbg !3385
    #dbg_value(i32 %inc, !3374, !DIExpression(), !3360)
  br label %for.cond, !dbg !3386, !llvm.loop !3387

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !3389
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !3390
    #dbg_value(i32 %sub2, !3364, !DIExpression(), !3360)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3391
    #dbg_value(i32 0, !3361, !DIExpression(), !3360)
  br label %while.cond, !dbg !3365, !llvm.loop !3392

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !3394
    #dbg_value(i32 %i.1, !3374, !DIExpression(), !3360)
    #dbg_value(ptr %in.addr.2, !3363, !DIExpression(), !3360)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !3395
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !3397
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !3371

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !3363, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3360)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !3398
  %conv9 = zext i8 %2 to i64, !dbg !3399
  %rem10 = shl i32 %i.1, 3, !dbg !3400
  %mul11 = and i32 %rem10, 56, !dbg !3400
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !3401
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !3401
  %div141 = lshr i32 %i.1, 3, !dbg !3402
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !3403
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !3404
  %xor16 = xor i64 %3, %shl13, !dbg !3404
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !3404
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !3405
    #dbg_value(ptr %incdec.ptr8, !3363, !DIExpression(), !3360)
  %inc18 = add nuw i32 %i.1, 1, !dbg !3406
    #dbg_value(i32 %inc18, !3374, !DIExpression(), !3360)
  br label %for.cond3, !dbg !3407, !llvm.loop !3408

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !3394
  ret i32 %i.1.lcssa, !dbg !3410
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !3411 {
entry:
    #dbg_value(ptr %state, !3412, !DIExpression(), !3413)
  %0 = load i64, ptr %state, align 8, !dbg !3414
    #dbg_value(i64 %0, !3415, !DIExpression(), !3413)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3416
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !3416
    #dbg_value(i64 %1, !3417, !DIExpression(), !3413)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3418
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !3418
    #dbg_value(i64 %2, !3419, !DIExpression(), !3413)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3420
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !3420
    #dbg_value(i64 %3, !3421, !DIExpression(), !3413)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3422
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !3422
    #dbg_value(i64 %4, !3423, !DIExpression(), !3413)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3424
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !3424
    #dbg_value(i64 %5, !3425, !DIExpression(), !3413)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3426
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !3426
    #dbg_value(i64 %6, !3427, !DIExpression(), !3413)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3428
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !3428
    #dbg_value(i64 %7, !3429, !DIExpression(), !3413)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3430
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !3430
    #dbg_value(i64 %8, !3431, !DIExpression(), !3413)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3432
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !3432
    #dbg_value(i64 %9, !3433, !DIExpression(), !3413)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3434
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !3434
    #dbg_value(i64 %10, !3435, !DIExpression(), !3413)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3436
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !3436
    #dbg_value(i64 %11, !3437, !DIExpression(), !3413)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3438
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !3438
    #dbg_value(i64 %12, !3439, !DIExpression(), !3413)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3440
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !3440
    #dbg_value(i64 %13, !3441, !DIExpression(), !3413)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3442
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !3442
    #dbg_value(i64 %14, !3443, !DIExpression(), !3413)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3444
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !3444
    #dbg_value(i64 %15, !3445, !DIExpression(), !3413)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3446
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !3446
    #dbg_value(i64 %16, !3447, !DIExpression(), !3413)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3448
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !3448
    #dbg_value(i64 %17, !3449, !DIExpression(), !3413)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3450
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !3450
    #dbg_value(i64 %18, !3451, !DIExpression(), !3413)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3452
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !3452
    #dbg_value(i64 %19, !3453, !DIExpression(), !3413)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3454
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !3454
    #dbg_value(i64 %20, !3455, !DIExpression(), !3413)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3456
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !3456
    #dbg_value(i64 %21, !3457, !DIExpression(), !3413)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3458
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !3458
    #dbg_value(i64 %22, !3459, !DIExpression(), !3413)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3460
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !3460
    #dbg_value(i64 %23, !3461, !DIExpression(), !3413)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3462
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !3462
    #dbg_value(i64 %24, !3463, !DIExpression(), !3413)
    #dbg_value(i32 0, !3464, !DIExpression(), !3413)
  br label %for.cond, !dbg !3465

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !3413
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !3413
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !3413
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !3413
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !3413
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !3413
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !3413
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !3413
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !3413
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !3413
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !3413
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !3413
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !3413
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !3413
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !3413
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !3413
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !3413
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !3413
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !3413
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !3413
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !3413
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !3413
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !3413
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !3413
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !3467
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !3413
    #dbg_value(i64 %Asu.0, !3463, !DIExpression(), !3413)
    #dbg_value(i32 %round.0, !3464, !DIExpression(), !3413)
    #dbg_value(i64 %Aba.0, !3415, !DIExpression(), !3413)
    #dbg_value(i64 %Abe.0, !3417, !DIExpression(), !3413)
    #dbg_value(i64 %Abi.0, !3419, !DIExpression(), !3413)
    #dbg_value(i64 %Abo.0, !3421, !DIExpression(), !3413)
    #dbg_value(i64 %Abu.0, !3423, !DIExpression(), !3413)
    #dbg_value(i64 %Aga.0, !3425, !DIExpression(), !3413)
    #dbg_value(i64 %Age.0, !3427, !DIExpression(), !3413)
    #dbg_value(i64 %Agi.0, !3429, !DIExpression(), !3413)
    #dbg_value(i64 %Ago.0, !3431, !DIExpression(), !3413)
    #dbg_value(i64 %Agu.0, !3433, !DIExpression(), !3413)
    #dbg_value(i64 %Aka.0, !3435, !DIExpression(), !3413)
    #dbg_value(i64 %Ake.0, !3437, !DIExpression(), !3413)
    #dbg_value(i64 %Aki.0, !3439, !DIExpression(), !3413)
    #dbg_value(i64 %Ako.0, !3441, !DIExpression(), !3413)
    #dbg_value(i64 %Aku.0, !3443, !DIExpression(), !3413)
    #dbg_value(i64 %Ama.0, !3445, !DIExpression(), !3413)
    #dbg_value(i64 %Ame.0, !3447, !DIExpression(), !3413)
    #dbg_value(i64 %Ami.0, !3449, !DIExpression(), !3413)
    #dbg_value(i64 %Amo.0, !3451, !DIExpression(), !3413)
    #dbg_value(i64 %Amu.0, !3453, !DIExpression(), !3413)
    #dbg_value(i64 %Asa.0, !3455, !DIExpression(), !3413)
    #dbg_value(i64 %Ase.0, !3457, !DIExpression(), !3413)
    #dbg_value(i64 %Asi.0, !3459, !DIExpression(), !3413)
    #dbg_value(i64 %Aso.0, !3461, !DIExpression(), !3413)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !3468
  br i1 %cmp, label %for.inc, label %for.end, !dbg !3470

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3476, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3477, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3478, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3479, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3480, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3476, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3477, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3478, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3479, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !3480, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 poison, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !3506
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !3508
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !3509
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !3510
    #dbg_value(i64 %xor35, !3473, !DIExpression(), !3413)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !3511
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !3512
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !3513
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !3514
    #dbg_value(i64 %xor43, !3475, !DIExpression(), !3413)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !3515
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !3479, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor57 = xor i64 %xor35, %xor56, !dbg !3516
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 %xor57, !3479, !DIExpression(), !3413)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !3517
    #dbg_value(i64 %xor203, !3431, !DIExpression(), !3413)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !3518
    #dbg_value(i64 %xor206, !3472, !DIExpression(), !3413)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !3519
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !3520
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !3521
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !3522
    #dbg_value(i64 %xor31, !3472, !DIExpression(), !3413)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !3523
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !3476, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor45 = xor i64 %xor43, %xor44, !dbg !3524
    #dbg_value(i64 %xor45, !3476, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !3525
    #dbg_value(i64 %xor211, !3445, !DIExpression(), !3413)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !3526
    #dbg_value(i64 %xor214, !3474, !DIExpression(), !3413)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !3527
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !3528
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !3529
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !3530
    #dbg_value(i64 %xor39, !3474, !DIExpression(), !3413)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !3531
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !3532
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !3533
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !3534
    #dbg_value(i64 %xor27, !3471, !DIExpression(), !3413)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !3535
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !3480, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor61 = xor i64 %xor39, %xor60, !dbg !3536
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 %xor61, !3480, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !3537
    #dbg_value(i64 %xor207, !3443, !DIExpression(), !3413)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !3538
    #dbg_value(i64 %xor210, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not222 = xor i64 %xor210, -1, !dbg !3539
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and223 = and i64 %xor214, %not222, !dbg !3540
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor224 = xor i64 %xor206, %and223, !dbg !3541
    #dbg_value(i64 %xor224, !3502, !DIExpression(), !3413)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !3542
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !3478, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor53 = xor i64 %xor31, %xor52, !dbg !3543
    #dbg_value(i64 %xor53, !3478, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !3544
    #dbg_value(i64 %xor67, !3439, !DIExpression(), !3413)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !3545
    #dbg_value(i64 %xor70, !3473, !DIExpression(), !3413)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !3546
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !3477, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor49 = xor i64 %xor27, %xor48, !dbg !3547
    #dbg_value(i64 %xor49, !3477, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !3548
    #dbg_value(i64 %xor63, !3427, !DIExpression(), !3413)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !3549
    #dbg_value(i64 %xor66, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not = xor i64 %xor66, -1, !dbg !3550
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and = and i64 %xor70, %not, !dbg !3551
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !3552
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !3552
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %26 = xor i64 %and, %25, !dbg !3553
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !3554
    #dbg_value(i64 %xor62, !3415, !DIExpression(), !3413)
    #dbg_value(i64 %xor62, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor81 = xor i64 %26, %xor62, !dbg !3553
    #dbg_value(i64 %xor81, !3481, !DIExpression(), !3413)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !3555
    #dbg_value(i64 %xor94, !3421, !DIExpression(), !3413)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !3556
    #dbg_value(i64 %xor97, !3471, !DIExpression(), !3413)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !3557
    #dbg_value(i64 %xor102, !3435, !DIExpression(), !3413)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !3558
    #dbg_value(i64 %xor105, !3473, !DIExpression(), !3413)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !3559
    #dbg_value(i64 %xor98, !3433, !DIExpression(), !3413)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !3560
    #dbg_value(i64 %xor101, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not114 = xor i64 %xor101, -1, !dbg !3561
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and115 = and i64 %xor105, %not114, !dbg !3562
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor116 = xor i64 %xor97, %and115, !dbg !3563
    #dbg_value(i64 %xor116, !3486, !DIExpression(), !3413)
  %xor234 = xor i64 %xor81, %xor116, !dbg !3564
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !3565
    #dbg_value(i64 %xor129, !3417, !DIExpression(), !3413)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !3566
    #dbg_value(i64 %xor132, !3471, !DIExpression(), !3413)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !3567
    #dbg_value(i64 %xor137, !3441, !DIExpression(), !3413)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !3568
    #dbg_value(i64 %xor140, !3473, !DIExpression(), !3413)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !3569
    #dbg_value(i64 %xor133, !3429, !DIExpression(), !3413)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !3570
    #dbg_value(i64 %xor136, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not149 = xor i64 %xor136, -1, !dbg !3571
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and150 = and i64 %xor140, %not149, !dbg !3572
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor151 = xor i64 %xor132, %and150, !dbg !3573
    #dbg_value(i64 %xor151, !3491, !DIExpression(), !3413)
  %xor235 = xor i64 %xor234, %xor151, !dbg !3574
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !3575
    #dbg_value(i64 %xor164, !3423, !DIExpression(), !3413)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !3576
    #dbg_value(i64 %xor167, !3471, !DIExpression(), !3413)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !3577
    #dbg_value(i64 %xor172, !3437, !DIExpression(), !3413)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !3578
    #dbg_value(i64 %xor175, !3473, !DIExpression(), !3413)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !3579
    #dbg_value(i64 %xor168, !3425, !DIExpression(), !3413)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !3580
    #dbg_value(i64 %xor171, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not184 = xor i64 %xor171, -1, !dbg !3581
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and185 = and i64 %xor175, %not184, !dbg !3582
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor186 = xor i64 %xor167, %and185, !dbg !3583
    #dbg_value(i64 %xor186, !3496, !DIExpression(), !3413)
  %xor236 = xor i64 %xor235, %xor186, !dbg !3584
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !3585
    #dbg_value(i64 %xor199, !3419, !DIExpression(), !3413)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !3586
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not219 = xor i64 %xor206, -1, !dbg !3587
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and220 = and i64 %xor210, %not219, !dbg !3588
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor221 = xor i64 %xor202, %and220, !dbg !3589
    #dbg_value(i64 %xor221, !3501, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor237 = xor i64 %xor236, %xor221, !dbg !3590
    #dbg_value(i64 %xor237, !3471, !DIExpression(), !3413)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !3591
    #dbg_value(i64 %xor75, !3463, !DIExpression(), !3413)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !3592
    #dbg_value(i64 %xor78, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !3593
    #dbg_value(i64 %xor71, !3451, !DIExpression(), !3413)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !3594
    #dbg_value(i64 %xor74, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not85 = xor i64 %xor74, -1, !dbg !3595
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and86 = and i64 %xor78, %not85, !dbg !3596
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor87 = xor i64 %xor70, %and86, !dbg !3597
    #dbg_value(i64 %xor87, !3483, !DIExpression(), !3413)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !3598
    #dbg_value(i64 %xor110, !3459, !DIExpression(), !3413)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !3599
    #dbg_value(i64 %xor113, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !3600
    #dbg_value(i64 %xor106, !3447, !DIExpression(), !3413)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !3601
    #dbg_value(i64 %xor109, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not120 = xor i64 %xor109, -1, !dbg !3602
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and121 = and i64 %xor113, %not120, !dbg !3603
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor122 = xor i64 %xor105, %and121, !dbg !3604
    #dbg_value(i64 %xor122, !3488, !DIExpression(), !3413)
  %xor242 = xor i64 %xor87, %xor122, !dbg !3605
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !3606
    #dbg_value(i64 %xor145, !3455, !DIExpression(), !3413)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !3607
    #dbg_value(i64 %xor148, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !3608
    #dbg_value(i64 %xor141, !3453, !DIExpression(), !3413)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !3609
    #dbg_value(i64 %xor144, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not155 = xor i64 %xor144, -1, !dbg !3610
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and156 = and i64 %xor148, %not155, !dbg !3611
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor157 = xor i64 %xor140, %and156, !dbg !3612
    #dbg_value(i64 %xor157, !3493, !DIExpression(), !3413)
  %xor243 = xor i64 %xor242, %xor157, !dbg !3613
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !3614
    #dbg_value(i64 %xor180, !3461, !DIExpression(), !3413)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !3615
    #dbg_value(i64 %xor183, !3475, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !3616
    #dbg_value(i64 %xor176, !3449, !DIExpression(), !3413)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !3617
    #dbg_value(i64 %xor179, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %not190 = xor i64 %xor179, -1, !dbg !3618
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and191 = and i64 %xor183, %not190, !dbg !3619
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor192 = xor i64 %xor175, %and191, !dbg !3620
    #dbg_value(i64 %xor192, !3498, !DIExpression(), !3413)
  %xor244 = xor i64 %xor243, %xor192, !dbg !3621
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !3622
    #dbg_value(i64 %xor215, !3457, !DIExpression(), !3413)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !3623
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not225 = xor i64 %xor214, -1, !dbg !3624
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and226 = and i64 %xor218, %not225, !dbg !3625
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor227 = xor i64 %xor210, %and226, !dbg !3626
    #dbg_value(i64 %xor227, !3503, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !3473, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor245 = xor i64 %xor244, %xor227, !dbg !3627
    #dbg_value(i64 %xor245, !3473, !DIExpression(), !3413)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !3628
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !3477, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor261 = xor i64 %xor237, %xor260, !dbg !3629
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !3502, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 %xor261, !3477, !DIExpression(), !3413)
  %xor429 = xor i64 %xor224, %xor261, !dbg !3630
    #dbg_value(i64 %xor429, !3502, !DIExpression(), !3413)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !3631
    #dbg_value(i64 %xor432, !3475, !DIExpression(), !3413)
  %not123 = xor i64 %xor113, -1, !dbg !3632
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and124 = and i64 %xor97, %not123, !dbg !3633
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor125 = xor i64 %xor109, %and124, !dbg !3634
    #dbg_value(i64 %xor125, !3489, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not91 = xor i64 %xor62, -1, !dbg !3635
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and92 = and i64 %xor66, %not91, !dbg !3636
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor93 = xor i64 %xor78, %and92, !dbg !3637
    #dbg_value(i64 %xor93, !3485, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not126 = xor i64 %xor97, -1, !dbg !3638
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and127 = and i64 %xor101, %not126, !dbg !3639
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor128 = xor i64 %xor113, %and127, !dbg !3640
    #dbg_value(i64 %xor128, !3490, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor250 = xor i64 %xor93, %xor128, !dbg !3641
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not161 = xor i64 %xor132, -1, !dbg !3642
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and162 = and i64 %xor136, %not161, !dbg !3643
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor163 = xor i64 %xor148, %and162, !dbg !3644
    #dbg_value(i64 %xor163, !3495, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor251 = xor i64 %xor250, %xor163, !dbg !3645
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not196 = xor i64 %xor167, -1, !dbg !3646
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and197 = and i64 %xor171, %not196, !dbg !3647
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor198 = xor i64 %xor183, %and197, !dbg !3648
    #dbg_value(i64 %xor198, !3500, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor252 = xor i64 %xor251, %xor198, !dbg !3649
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not231 = xor i64 %xor202, -1, !dbg !3650
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %and232 = and i64 %xor206, %not231, !dbg !3651
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor233 = xor i64 %xor218, %and232, !dbg !3652
    #dbg_value(i64 %xor233, !3505, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor253 = xor i64 %xor252, %xor233, !dbg !3653
    #dbg_value(i64 %xor253, !3475, !DIExpression(), !3413)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !3654
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !3479, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor269 = xor i64 %xor245, %xor268, !dbg !3655
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !3489, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 %xor269, !3479, !DIExpression(), !3413)
  %xor417 = xor i64 %xor125, %xor269, !dbg !3656
    #dbg_value(i64 %xor417, !3489, !DIExpression(), !3413)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !3657
    #dbg_value(i64 %xor420, !3472, !DIExpression(), !3413)
  %not82 = xor i64 %xor70, -1, !dbg !3658
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and83 = and i64 %xor74, %not82, !dbg !3659
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor84 = xor i64 %xor66, %and83, !dbg !3660
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !3482, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %not117 = xor i64 %xor105, -1, !dbg !3661
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and118 = and i64 %xor109, %not117, !dbg !3662
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor119 = xor i64 %xor101, %and118, !dbg !3663
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !3487, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor238 = xor i64 %xor84, %xor119, !dbg !3664
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %not152 = xor i64 %xor140, -1, !dbg !3665
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and153 = and i64 %xor144, %not152, !dbg !3666
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor154 = xor i64 %xor136, %and153, !dbg !3667
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !3492, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor239 = xor i64 %xor238, %xor154, !dbg !3668
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %not187 = xor i64 %xor175, -1, !dbg !3669
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and188 = and i64 %xor179, %not187, !dbg !3670
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor189 = xor i64 %xor171, %and188, !dbg !3671
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !3497, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor240 = xor i64 %xor239, %xor189, !dbg !3672
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !3472, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor241 = xor i64 %xor240, %xor224, !dbg !3673
    #dbg_value(i64 %xor241, !3472, !DIExpression(), !3413)
  %not88 = xor i64 %xor78, -1, !dbg !3674
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and89 = and i64 %xor62, %not88, !dbg !3675
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor90 = xor i64 %xor74, %and89, !dbg !3676
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !3484, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor246 = xor i64 %xor90, %xor125, !dbg !3677
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not158 = xor i64 %xor148, -1, !dbg !3678
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and159 = and i64 %xor132, %not158, !dbg !3679
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor160 = xor i64 %xor144, %and159, !dbg !3680
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !3494, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor247 = xor i64 %xor246, %xor160, !dbg !3681
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not193 = xor i64 %xor183, -1, !dbg !3682
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and194 = and i64 %xor167, %not193, !dbg !3683
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor195 = xor i64 %xor179, %and194, !dbg !3684
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !3499, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor248 = xor i64 %xor247, %xor195, !dbg !3685
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %not228 = xor i64 %xor218, -1, !dbg !3686
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and229 = and i64 %xor202, %not228, !dbg !3687
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor230 = xor i64 %xor214, %and229, !dbg !3688
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !3474, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !3504, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor249 = xor i64 %xor248, %xor230, !dbg !3689
    #dbg_value(i64 %xor249, !3474, !DIExpression(), !3413)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !3690
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !3478, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor265 = xor i64 %xor241, %xor264, !dbg !3691
    #dbg_value(i64 %xor265, !3478, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !3483, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !3498, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !3488, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !3503, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !3493, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor413 = xor i64 %xor87, %xor265, !dbg !3692
    #dbg_value(i64 %xor413, !3483, !DIExpression(), !3413)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !3693
    #dbg_value(i64 %xor416, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not445 = xor i64 %xor416, -1, !dbg !3694
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and446 = and i64 %xor420, %not445, !dbg !3695
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !3463, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor447 = xor i64 %xor432, %and446, !dbg !3696
    #dbg_value(i64 %xor447, !3463, !DIExpression(), !3413)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !3697
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !3476, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor257 = xor i64 %xor253, %xor256, !dbg !3698
    #dbg_value(i64 %xor257, !3476, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !3486, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !3501, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !3491, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !3496, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor425 = xor i64 %xor186, %xor257, !dbg !3699
    #dbg_value(i64 %xor425, !3496, !DIExpression(), !3413)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !3700
    #dbg_value(i64 %xor428, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not442 = xor i64 %xor432, -1, !dbg !3701
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and443 = and i64 %xor416, %not442, !dbg !3702
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !3461, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor444 = xor i64 %xor428, %and443, !dbg !3703
    #dbg_value(i64 %xor444, !3461, !DIExpression(), !3413)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !3704
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !3480, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor273 = xor i64 %xor249, %xor272, !dbg !3705
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !3485, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !3500, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !3490, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !3505, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(i64 %xor273, !3480, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !3495, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor421 = xor i64 %xor163, %xor273, !dbg !3706
    #dbg_value(i64 %xor421, !3495, !DIExpression(), !3413)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !3707
    #dbg_value(i64 %xor424, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not439 = xor i64 %xor428, -1, !dbg !3708
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and440 = and i64 %xor432, %not439, !dbg !3709
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !3459, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor441 = xor i64 %xor424, %and440, !dbg !3710
    #dbg_value(i64 %xor441, !3459, !DIExpression(), !3413)
  %not436 = xor i64 %xor424, -1, !dbg !3711
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and437 = and i64 %xor428, %not436, !dbg !3712
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !3457, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor438 = xor i64 %xor420, %and437, !dbg !3713
    #dbg_value(i64 %xor438, !3457, !DIExpression(), !3413)
  %not433 = xor i64 %xor420, -1, !dbg !3714
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and434 = and i64 %xor424, %not433, !dbg !3715
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !3455, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor435 = xor i64 %xor416, %and434, !dbg !3716
    #dbg_value(i64 %xor435, !3455, !DIExpression(), !3413)
  %xor394 = xor i64 %xor230, %xor269, !dbg !3717
    #dbg_value(i64 %xor394, !3504, !DIExpression(), !3413)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !3718
    #dbg_value(i64 %xor397, !3475, !DIExpression(), !3413)
  %xor382 = xor i64 %xor116, %xor257, !dbg !3719
    #dbg_value(i64 %xor382, !3486, !DIExpression(), !3413)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !3720
    #dbg_value(i64 %xor385, !3472, !DIExpression(), !3413)
  %xor378 = xor i64 %xor93, %xor273, !dbg !3721
    #dbg_value(i64 %xor378, !3485, !DIExpression(), !3413)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !3722
    #dbg_value(i64 %xor381, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not410 = xor i64 %xor381, -1, !dbg !3723
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and411 = and i64 %xor385, %not410, !dbg !3724
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !3453, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor412 = xor i64 %xor397, %and411, !dbg !3725
    #dbg_value(i64 %xor412, !3453, !DIExpression(), !3413)
  %xor390 = xor i64 %xor192, %xor265, !dbg !3726
    #dbg_value(i64 %xor390, !3498, !DIExpression(), !3413)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !3727
    #dbg_value(i64 %xor393, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not407 = xor i64 %xor397, -1, !dbg !3728
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and408 = and i64 %xor381, %not407, !dbg !3729
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !3451, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor409 = xor i64 %xor393, %and408, !dbg !3730
    #dbg_value(i64 %xor409, !3451, !DIExpression(), !3413)
  %xor386 = xor i64 %xor154, %xor261, !dbg !3731
    #dbg_value(i64 %xor386, !3492, !DIExpression(), !3413)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !3732
    #dbg_value(i64 %xor389, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not404 = xor i64 %xor393, -1, !dbg !3733
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and405 = and i64 %xor397, %not404, !dbg !3734
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !3449, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor406 = xor i64 %xor389, %and405, !dbg !3735
    #dbg_value(i64 %xor406, !3449, !DIExpression(), !3413)
  %not401 = xor i64 %xor389, -1, !dbg !3736
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and402 = and i64 %xor393, %not401, !dbg !3737
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !3447, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor403 = xor i64 %xor385, %and402, !dbg !3738
    #dbg_value(i64 %xor403, !3447, !DIExpression(), !3413)
  %not398 = xor i64 %xor385, -1, !dbg !3739
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and399 = and i64 %xor389, %not398, !dbg !3740
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !3445, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor400 = xor i64 %xor381, %and399, !dbg !3741
    #dbg_value(i64 %xor400, !3445, !DIExpression(), !3413)
  %xor359 = xor i64 %xor221, %xor257, !dbg !3742
    #dbg_value(i64 %xor359, !3501, !DIExpression(), !3413)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !3743
    #dbg_value(i64 %xor362, !3475, !DIExpression(), !3413)
  %xor347 = xor i64 %xor122, %xor265, !dbg !3744
    #dbg_value(i64 %xor347, !3488, !DIExpression(), !3413)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !3745
    #dbg_value(i64 %xor350, !3472, !DIExpression(), !3413)
  %xor343 = xor i64 %xor84, %xor261, !dbg !3746
    #dbg_value(i64 %xor343, !3482, !DIExpression(), !3413)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !3747
    #dbg_value(i64 %xor346, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not375 = xor i64 %xor346, -1, !dbg !3748
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and376 = and i64 %xor350, %not375, !dbg !3749
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !3443, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor377 = xor i64 %xor362, %and376, !dbg !3750
    #dbg_value(i64 %xor377, !3443, !DIExpression(), !3413)
  %xor355 = xor i64 %xor198, %xor273, !dbg !3751
    #dbg_value(i64 %xor355, !3500, !DIExpression(), !3413)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !3752
    #dbg_value(i64 %xor358, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not372 = xor i64 %xor362, -1, !dbg !3753
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and373 = and i64 %xor346, %not372, !dbg !3754
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !3441, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor374 = xor i64 %xor358, %and373, !dbg !3755
    #dbg_value(i64 %xor374, !3441, !DIExpression(), !3413)
  %xor351 = xor i64 %xor160, %xor269, !dbg !3756
    #dbg_value(i64 %xor351, !3494, !DIExpression(), !3413)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !3757
    #dbg_value(i64 %xor354, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not369 = xor i64 %xor358, -1, !dbg !3758
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and370 = and i64 %xor362, %not369, !dbg !3759
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !3439, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor371 = xor i64 %xor354, %and370, !dbg !3760
    #dbg_value(i64 %xor371, !3439, !DIExpression(), !3413)
  %not366 = xor i64 %xor354, -1, !dbg !3761
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and367 = and i64 %xor358, %not366, !dbg !3762
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !3437, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor368 = xor i64 %xor350, %and367, !dbg !3763
    #dbg_value(i64 %xor368, !3437, !DIExpression(), !3413)
  %not363 = xor i64 %xor350, -1, !dbg !3764
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and364 = and i64 %xor354, %not363, !dbg !3765
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !3435, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor365 = xor i64 %xor346, %and364, !dbg !3766
    #dbg_value(i64 %xor365, !3435, !DIExpression(), !3413)
  %xor324 = xor i64 %xor227, %xor265, !dbg !3767
    #dbg_value(i64 %xor324, !3503, !DIExpression(), !3413)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !3768
    #dbg_value(i64 %xor327, !3475, !DIExpression(), !3413)
  %xor312 = xor i64 %xor128, %xor273, !dbg !3769
    #dbg_value(i64 %xor312, !3490, !DIExpression(), !3413)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !3770
    #dbg_value(i64 %xor315, !3472, !DIExpression(), !3413)
  %xor308 = xor i64 %xor90, %xor269, !dbg !3771
    #dbg_value(i64 %xor308, !3484, !DIExpression(), !3413)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !3772
    #dbg_value(i64 %xor311, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not340 = xor i64 %xor311, -1, !dbg !3773
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and341 = and i64 %xor315, %not340, !dbg !3774
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !3433, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor342 = xor i64 %xor327, %and341, !dbg !3775
    #dbg_value(i64 %xor342, !3433, !DIExpression(), !3413)
  %xor320 = xor i64 %xor189, %xor261, !dbg !3776
    #dbg_value(i64 %xor320, !3497, !DIExpression(), !3413)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !3777
    #dbg_value(i64 %xor323, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not337 = xor i64 %xor327, -1, !dbg !3778
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and338 = and i64 %xor311, %not337, !dbg !3779
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !3431, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor339 = xor i64 %xor323, %and338, !dbg !3780
    #dbg_value(i64 %xor339, !3431, !DIExpression(), !3413)
  %xor316 = xor i64 %xor151, %xor257, !dbg !3781
    #dbg_value(i64 %xor316, !3491, !DIExpression(), !3413)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !3782
    #dbg_value(i64 %xor319, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not334 = xor i64 %xor323, -1, !dbg !3783
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and335 = and i64 %xor327, %not334, !dbg !3784
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !3429, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor336 = xor i64 %xor319, %and335, !dbg !3785
    #dbg_value(i64 %xor336, !3429, !DIExpression(), !3413)
  %not331 = xor i64 %xor319, -1, !dbg !3786
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and332 = and i64 %xor323, %not331, !dbg !3787
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !3427, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor333 = xor i64 %xor315, %and332, !dbg !3788
    #dbg_value(i64 %xor333, !3427, !DIExpression(), !3413)
  %not328 = xor i64 %xor315, -1, !dbg !3789
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and329 = and i64 %xor319, %not328, !dbg !3790
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !3425, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor330 = xor i64 %xor311, %and329, !dbg !3791
    #dbg_value(i64 %xor330, !3425, !DIExpression(), !3413)
  %xor287 = xor i64 %xor233, %xor273, !dbg !3792
    #dbg_value(i64 %xor287, !3505, !DIExpression(), !3413)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !3793
    #dbg_value(i64 %xor290, !3475, !DIExpression(), !3413)
  %xor275 = xor i64 %xor119, %xor261, !dbg !3794
    #dbg_value(i64 %xor275, !3487, !DIExpression(), !3413)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !3795
    #dbg_value(i64 %xor278, !3472, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor274 = xor i64 %xor81, %xor257, !dbg !3796
    #dbg_value(i64 %xor274, !3481, !DIExpression(), !3413)
    #dbg_value(i64 %xor274, !3471, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not305 = xor i64 %xor274, -1, !dbg !3797
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and306 = and i64 %xor278, %not305, !dbg !3798
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor307 = xor i64 %xor290, %and306, !dbg !3799
    #dbg_value(i64 %xor307, !3423, !DIExpression(), !3413)
  %xor283 = xor i64 %xor195, %xor269, !dbg !3800
    #dbg_value(i64 %xor283, !3499, !DIExpression(), !3413)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !3801
    #dbg_value(i64 %xor286, !3474, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not302 = xor i64 %xor290, -1, !dbg !3802
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and303 = and i64 %xor274, %not302, !dbg !3803
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !3421, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor304 = xor i64 %xor286, %and303, !dbg !3804
    #dbg_value(i64 %xor304, !3421, !DIExpression(), !3413)
  %xor279 = xor i64 %xor157, %xor265, !dbg !3805
    #dbg_value(i64 %xor279, !3493, !DIExpression(), !3413)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !3806
    #dbg_value(i64 %xor282, !3473, !DIExpression(), !3413)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %not299 = xor i64 %xor286, -1, !dbg !3807
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and300 = and i64 %xor290, %not299, !dbg !3808
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !3419, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor301 = xor i64 %xor282, %and300, !dbg !3809
    #dbg_value(i64 %xor301, !3419, !DIExpression(), !3413)
  %not296 = xor i64 %xor282, -1, !dbg !3810
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !3413)
  %and297 = and i64 %xor286, %not296, !dbg !3811
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !3417, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %xor298 = xor i64 %xor278, %and297, !dbg !3812
    #dbg_value(i64 %xor298, !3417, !DIExpression(), !3413)
  %add = or disjoint i32 %round.0, 1, !dbg !3813
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !3814
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !3814
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %not291 = xor i64 %xor278, -1, !dbg !3815
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %and292 = and i64 %xor282, %not291, !dbg !3816
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !3415, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !3413)
  %28 = xor i64 %and292, %27, !dbg !3817
  %xor295 = xor i64 %28, %xor274, !dbg !3817
    #dbg_value(i64 %xor295, !3415, !DIExpression(), !3413)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !3818
    #dbg_value(i32 %add448, !3464, !DIExpression(), !3413)
  br label %for.cond, !dbg !3819, !llvm.loop !3820

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !3413
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !3413
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !3413
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !3413
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !3413
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !3413
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !3413
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !3413
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !3413
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !3413
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !3413
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !3413
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !3413
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !3413
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !3413
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !3413
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !3413
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !3413
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !3413
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !3413
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !3413
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !3413
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !3413
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !3413
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !3413
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !3822
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !3823
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !3824
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !3825
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !3826
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !3827
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !3828
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !3829
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !3830
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !3831
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !3832
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !3833
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !3834
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !3835
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !3836
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !3837
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !3838
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !3839
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !3840
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !3841
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !3842
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !3843
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !3844
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !3845
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !3846
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !3847
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !3848
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !3849
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !3850
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !3851
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !3852
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !3853
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !3854
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !3855
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !3856
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !3857
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !3858
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !3859
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !3860
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !3861
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !3862
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !3863
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !3864
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !3865
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !3866
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !3867
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !3868
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !3869
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !3870
  ret void, !dbg !3871
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !3872 {
entry:
    #dbg_value(ptr %state, !3873, !DIExpression(), !3874)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3875
  %0 = load i32, ptr %pos, align 8, !dbg !3875
    #dbg_value(ptr %state, !3876, !DIExpression(), !3880)
    #dbg_value(i32 %0, !3882, !DIExpression(), !3880)
    #dbg_value(i32 168, !3883, !DIExpression(), !3880)
    #dbg_value(i8 31, !3884, !DIExpression(), !3880)
  %rem.i = shl i32 %0, 3, !dbg !3885
  %mul.i = and i32 %rem.i, 56, !dbg !3885
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3886
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !3886
  %div2.i = lshr i32 %0, 3, !dbg !3887
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !3888
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3889
  %xor.i = xor i64 %1, %shl.i, !dbg !3889
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !3889
  %arrayidx2.i = getelementptr i8, ptr %state, i32 160, !dbg !3890
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !3891
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !3891
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !3891
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3892
  store i32 168, ptr %pos1, align 8, !dbg !3893
  ret void, !dbg !3894
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !3895 {
entry:
    #dbg_value(ptr %out, !3896, !DIExpression(), !3897)
    #dbg_value(i32 %outlen, !3898, !DIExpression(), !3897)
    #dbg_value(ptr %state, !3899, !DIExpression(), !3897)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3900
  %0 = load i32, ptr %pos, align 8, !dbg !3900
    #dbg_value(ptr %out, !864, !DIExpression(), !3901)
    #dbg_value(i32 %outlen, !870, !DIExpression(), !3901)
    #dbg_value(ptr %state, !871, !DIExpression(), !3901)
    #dbg_value(i32 %0, !872, !DIExpression(), !3901)
    #dbg_value(i32 168, !873, !DIExpression(), !3901)
  br label %while.cond.i, !dbg !3903

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !864, !DIExpression(), !3901)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !3901)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !3901)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !3903
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !3903

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 168, !dbg !3904
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !3904

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !3905
    #dbg_value(i32 0, !872, !DIExpression(), !3901)
  br label %if.end.i, !dbg !3906

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !3901)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !3901)
  br label %for.cond.i, !dbg !3907

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !3908
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !3901)
    #dbg_value(i32 %i.0.i, !881, !DIExpression(), !3901)
  %cmp1.i = icmp ult i32 %i.0.i, 168, !dbg !3909
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !3910
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !3910
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !3910
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !3911

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !3912
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !3913
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !3913
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3914
  %mul.i = and i32 %rem.i, 56, !dbg !3914
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3915
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !3915
  %conv.i = trunc i64 %shr.i to i8, !dbg !3913
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3901)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !3916
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !3917
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !3901)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3918
    #dbg_value(i32 %inc.i, !881, !DIExpression(), !3901)
  br label %for.cond.i, !dbg !3919, !llvm.loop !3920

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !3908
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !3922
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !3923
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !3901)
    #dbg_value(i32 %i.0.i.lcssa, !872, !DIExpression(), !3901)
  br label %while.cond.i, !dbg !3903, !llvm.loop !3924

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3926
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !3927
  ret void, !dbg !3928
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !560 {
entry:
    #dbg_value(ptr %state, !559, !DIExpression(), !3929)
    #dbg_value(ptr %in, !571, !DIExpression(), !3929)
    #dbg_value(i32 %inlen, !572, !DIExpression(), !3929)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !3930
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !3931
  store i32 168, ptr %pos, align 8, !dbg !3932
  ret void, !dbg !3933
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !3934 {
entry:
    #dbg_value(ptr %s, !3937, !DIExpression(), !3938)
    #dbg_value(i32 %r, !3939, !DIExpression(), !3938)
    #dbg_value(ptr %in, !3940, !DIExpression(), !3938)
    #dbg_value(i32 %inlen, !3941, !DIExpression(), !3938)
    #dbg_value(i8 %p, !3942, !DIExpression(), !3938)
    #dbg_value(i32 0, !3943, !DIExpression(), !3938)
  br label %for.cond, !dbg !3944

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3946
    #dbg_value(i32 %i.0, !3943, !DIExpression(), !3938)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !3947
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !3949

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !3950
  br label %while.cond, !dbg !3950

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3951
  store i64 0, ptr %arrayidx, align 8, !dbg !3952
  %inc = add nuw nsw i32 %i.0, 1, !dbg !3953
    #dbg_value(i32 %inc, !3943, !DIExpression(), !3938)
  br label %for.cond, !dbg !3954, !llvm.loop !3955

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !3941, !DIExpression(), !3938)
    #dbg_value(ptr %in.addr.0, !3940, !DIExpression(), !3938)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !3957
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !3950

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !3958

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa7 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !3961

for.cond2:                                        ; preds = %for.cond2.preheader, %load64.exit
  %i.1 = phi i32 [ %inc7, %load64.exit ], [ 0, %for.cond2.preheader ], !dbg !3963
    #dbg_value(i32 %i.1, !3943, !DIExpression(), !3938)
  %exitcond6 = icmp ne i32 %i.1, %0, !dbg !3964
  br i1 %exitcond6, label %for.body4, label %for.end8, !dbg !3958

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !3966
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3967
    #dbg_value(ptr %add.ptr, !3968, !DIExpression(), !3972)
    #dbg_value(i64 0, !3974, !DIExpression(), !3972)
    #dbg_value(i32 0, !3975, !DIExpression(), !3972)
  br label %for.cond.i, !dbg !3976

for.cond.i:                                       ; preds = %for.inc.i, %for.body4
  %i.0.i = phi i32 [ 0, %for.body4 ], [ %inc.i, %for.inc.i ], !dbg !3978
  %r.0.i = phi i64 [ 0, %for.body4 ], [ %or.i, %for.inc.i ], !dbg !3972
    #dbg_value(i64 %r.0.i, !3974, !DIExpression(), !3972)
    #dbg_value(i32 %i.0.i, !3975, !DIExpression(), !3972)
  %exitcond5 = icmp ne i32 %i.0.i, 8, !dbg !3979
  br i1 %exitcond5, label %for.inc.i, label %load64.exit, !dbg !3981

for.inc.i:                                        ; preds = %for.cond.i
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3972)
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !3982
  %1 = load i8, ptr %arrayidx.i, align 1, !dbg !3982
    #dbg_value(!DIArgList(i64 %r.0.i, i8 %1, i32 %i.0.i), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3972)
  %conv.i = zext i8 %1 to i64, !dbg !3983
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %i.0.i), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3972)
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !3984
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i32 %mul.i), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3972)
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !3985
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %conv.i, i64 %sh_prom.i), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !3972)
  %shl.i = shl nuw i64 %conv.i, %sh_prom.i, !dbg !3985
    #dbg_value(!DIArgList(i64 %r.0.i, i64 %shl.i), !3974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !3972)
  %or.i = or i64 %r.0.i, %shl.i, !dbg !3986
    #dbg_value(i64 %or.i, !3974, !DIExpression(), !3972)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3987
    #dbg_value(i32 %inc.i, !3975, !DIExpression(), !3972)
  br label %for.cond.i, !dbg !3988, !llvm.loop !3989

load64.exit:                                      ; preds = %for.cond.i
  %r.0.i.lcssa = phi i64 [ %r.0.i, %for.cond.i ], !dbg !3972
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3991
  %2 = load i64, ptr %arrayidx5, align 8, !dbg !3992
  %xor = xor i64 %2, %r.0.i.lcssa, !dbg !3992
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3992
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !3993
    #dbg_value(i32 %inc7, !3943, !DIExpression(), !3938)
  br label %for.cond2, !dbg !3994, !llvm.loop !3995

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3997
    #dbg_value(ptr %add.ptr9, !3940, !DIExpression(), !3938)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3998
    #dbg_value(i32 %sub, !3941, !DIExpression(), !3938)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #4, !dbg !3999
  br label %while.cond, !dbg !3950, !llvm.loop !4000

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !4002
    #dbg_value(i32 %i.2, !3943, !DIExpression(), !3938)
  %exitcond8 = icmp ne i32 %i.2, %inlen.addr.0.lcssa7, !dbg !4003
  br i1 %exitcond8, label %for.body12, label %for.end20, !dbg !3961

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !4005
  %3 = load i8, ptr %arrayidx13, align 1, !dbg !4005
  %conv = zext i8 %3 to i64, !dbg !4006
  %rem = shl i32 %i.2, 3, !dbg !4007
  %mul14 = and i32 %rem, 56, !dbg !4007
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !4008
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !4008
  %div153 = lshr i32 %i.2, 3, !dbg !4009
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !4010
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !4011
  %xor17 = xor i64 %4, %shl, !dbg !4011
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !4011
  %inc19 = add i32 %i.2, 1, !dbg !4012
    #dbg_value(i32 %inc19, !3943, !DIExpression(), !3938)
  br label %for.cond10, !dbg !4013, !llvm.loop !4014

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !4002
  %conv21 = zext i8 %p to i64, !dbg !4016
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !4017
  %mul23 = and i32 %rem22, 56, !dbg !4017
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !4018
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !4018
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !4019
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !4020
  %5 = load i64, ptr %arrayidx27, align 8, !dbg !4021
  %xor28 = xor i64 %5, %shl25, !dbg !4021
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !4021
  %sub29 = add i32 %r, -1, !dbg !4022
  %div302 = lshr i32 %sub29, 3, !dbg !4023
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !4024
  %6 = load i64, ptr %arrayidx31, align 8, !dbg !4025
  %xor32 = xor i64 %6, -9223372036854775808, !dbg !4025
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !4025
  ret void, !dbg !4026
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !593 {
entry:
    #dbg_value(ptr %out, !592, !DIExpression(), !4027)
    #dbg_value(i32 %nblocks, !598, !DIExpression(), !4027)
    #dbg_value(ptr %state, !599, !DIExpression(), !4027)
    #dbg_value(ptr %out, !600, !DIExpression(), !4028)
    #dbg_value(i32 %nblocks, !607, !DIExpression(), !4028)
    #dbg_value(ptr %state, !608, !DIExpression(), !4028)
    #dbg_value(i32 168, !609, !DIExpression(), !4028)
  br label %while.cond.i, !dbg !4030

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !600, !DIExpression(), !4028)
    #dbg_value(i32 %nblocks.addr.0.i, !607, !DIExpression(), !4028)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4030
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4030

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4031
    #dbg_value(i32 0, !613, !DIExpression(), !4028)
  br label %for.cond.i, !dbg !4032

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4033
    #dbg_value(i32 %i.0.i, !613, !DIExpression(), !4028)
  %exitcond1 = icmp ne i32 %i.0.i, 21, !dbg !4034
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4035

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4036
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4037
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4038
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4038
    #dbg_value(ptr %add.ptr.i, !623, !DIExpression(), !4039)
    #dbg_value(i64 %0, !629, !DIExpression(), !4039)
    #dbg_value(i32 0, !630, !DIExpression(), !4039)
  br label %for.cond.i.i, !dbg !4041

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4042
    #dbg_value(i32 %i.0.i.i, !630, !DIExpression(), !4039)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4043
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4044

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4045
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4046
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4046
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4047
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4048
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4049
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4050
    #dbg_value(i32 %inc.i.i, !630, !DIExpression(), !4039)
  br label %for.cond.i.i, !dbg !4051, !llvm.loop !4052

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4054
    #dbg_value(i32 %inc.i, !613, !DIExpression(), !4028)
  br label %for.cond.i, !dbg !4055, !llvm.loop !4056

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4058
    #dbg_value(ptr %add.ptr1.i, !600, !DIExpression(), !4028)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4059
    #dbg_value(i32 %sub.i, !607, !DIExpression(), !4028)
  br label %while.cond.i, !dbg !4030, !llvm.loop !4060

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4062
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !4063 {
entry:
    #dbg_value(ptr %state, !4064, !DIExpression(), !4065)
    #dbg_value(ptr %state, !3324, !DIExpression(), !4066)
    #dbg_value(i32 0, !3330, !DIExpression(), !4066)
  br label %for.cond.i, !dbg !4068

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4069
    #dbg_value(i32 %i.0.i, !3330, !DIExpression(), !4066)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4070
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4071

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4072
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4073
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4074
    #dbg_value(i32 %inc.i, !3330, !DIExpression(), !4066)
  br label %for.cond.i, !dbg !4075, !llvm.loop !4076

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4078
  store i32 0, ptr %pos, align 8, !dbg !4079
  ret void, !dbg !4080
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4081 {
entry:
    #dbg_value(ptr %state, !4082, !DIExpression(), !4083)
    #dbg_value(ptr %in, !4084, !DIExpression(), !4083)
    #dbg_value(i32 %inlen, !4085, !DIExpression(), !4083)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4086
  %0 = load i32, ptr %pos, align 8, !dbg !4086
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #4, !dbg !4087
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4088
  store i32 %call, ptr %pos1, align 8, !dbg !4089
  ret void, !dbg !4090
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !4091 {
entry:
    #dbg_value(ptr %state, !4092, !DIExpression(), !4093)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4094
  %0 = load i32, ptr %pos, align 8, !dbg !4094
    #dbg_value(ptr %state, !3876, !DIExpression(), !4095)
    #dbg_value(i32 %0, !3882, !DIExpression(), !4095)
    #dbg_value(i32 136, !3883, !DIExpression(), !4095)
    #dbg_value(i8 31, !3884, !DIExpression(), !4095)
  %rem.i = shl i32 %0, 3, !dbg !4097
  %mul.i = and i32 %rem.i, 56, !dbg !4097
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4098
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4098
  %div2.i = lshr i32 %0, 3, !dbg !4099
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div2.i, !dbg !4100
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !4101
  %xor.i = xor i64 %1, %shl.i, !dbg !4101
  store i64 %xor.i, ptr %arrayidx.i, align 8, !dbg !4101
  %arrayidx2.i = getelementptr i8, ptr %state, i32 128, !dbg !4102
  %2 = load i64, ptr %arrayidx2.i, align 8, !dbg !4103
  %xor3.i = xor i64 %2, -9223372036854775808, !dbg !4103
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4103
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4104
  store i32 136, ptr %pos1, align 8, !dbg !4105
  ret void, !dbg !4106
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !858 {
entry:
    #dbg_value(ptr %out, !857, !DIExpression(), !4107)
    #dbg_value(i32 %outlen, !861, !DIExpression(), !4107)
    #dbg_value(ptr %state, !862, !DIExpression(), !4107)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4108
  %0 = load i32, ptr %pos, align 8, !dbg !4108
    #dbg_value(ptr %out, !864, !DIExpression(), !4109)
    #dbg_value(i32 %outlen, !870, !DIExpression(), !4109)
    #dbg_value(ptr %state, !871, !DIExpression(), !4109)
    #dbg_value(i32 %0, !872, !DIExpression(), !4109)
    #dbg_value(i32 136, !873, !DIExpression(), !4109)
  br label %while.cond.i, !dbg !4111

while.cond.i:                                     ; preds = %for.end.i, %entry
  %pos.addr.0.i = phi i32 [ %0, %entry ], [ %i.0.i.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ %outlen, %entry ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !864, !DIExpression(), !4109)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !4109)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !4109)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4111
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4111

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i = icmp eq i32 %pos.addr.0.i, 136, !dbg !4112
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !4112

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4113
    #dbg_value(i32 0, !872, !DIExpression(), !4109)
  br label %if.end.i, !dbg !4114

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !4109)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !4109)
  br label %for.cond.i, !dbg !4115

for.cond.i:                                       ; preds = %for.body.i, %if.end.i
  %i.0.i = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i, %for.body.i ], !dbg !4116
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !4109)
    #dbg_value(i32 %i.0.i, !881, !DIExpression(), !4109)
  %cmp1.i = icmp ult i32 %i.0.i, 136, !dbg !4117
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4118
  %cmp2.i = icmp ult i32 %i.0.i, %add.i, !dbg !4118
  %1 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4118
  br i1 %1, label %for.body.i, label %for.end.i, !dbg !4119

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = lshr i32 %i.0.i, 3, !dbg !4120
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4121
  %2 = load i64, ptr %arrayidx.i, align 8, !dbg !4121
  %rem.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4122
  %mul.i = and i32 %rem.i, 56, !dbg !4122
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4123
  %shr.i = lshr i64 %2, %sh_prom.i, !dbg !4123
  %conv.i = trunc i64 %shr.i to i8, !dbg !4121
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4109)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4124
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4125
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !4109)
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4126
    #dbg_value(i32 %inc.i, !881, !DIExpression(), !4109)
  br label %for.cond.i, !dbg !4127, !llvm.loop !4128

for.end.i:                                        ; preds = %for.cond.i
  %i.0.i.lcssa = phi i32 [ %i.0.i, %for.cond.i ], !dbg !4116
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i.lcssa, !dbg !4130
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4131
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !4109)
    #dbg_value(i32 %i.0.i.lcssa, !872, !DIExpression(), !4109)
  br label %while.cond.i, !dbg !4111, !llvm.loop !4132

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4134
  store i32 %pos.addr.0.i.lcssa, ptr %pos1, align 8, !dbg !4135
  ret void, !dbg !4136
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !829 {
entry:
    #dbg_value(ptr %state, !842, !DIExpression(), !4137)
    #dbg_value(ptr %in, !844, !DIExpression(), !4137)
    #dbg_value(i32 %inlen, !845, !DIExpression(), !4137)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4138
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4139
  store i32 136, ptr %pos, align 8, !dbg !4140
  ret void, !dbg !4141
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !850 {
entry:
    #dbg_value(ptr %out, !849, !DIExpression(), !4142)
    #dbg_value(i32 %nblocks, !853, !DIExpression(), !4142)
    #dbg_value(ptr %state, !854, !DIExpression(), !4142)
    #dbg_value(ptr %out, !600, !DIExpression(), !4143)
    #dbg_value(i32 %nblocks, !607, !DIExpression(), !4143)
    #dbg_value(ptr %state, !608, !DIExpression(), !4143)
    #dbg_value(i32 136, !609, !DIExpression(), !4143)
  br label %while.cond.i, !dbg !4145

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %nblocks, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !600, !DIExpression(), !4143)
    #dbg_value(i32 %nblocks.addr.0.i, !607, !DIExpression(), !4143)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4145
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4145

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %state) #4, !dbg !4146
    #dbg_value(i32 0, !613, !DIExpression(), !4143)
  br label %for.cond.i, !dbg !4147

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4148
    #dbg_value(i32 %i.0.i, !613, !DIExpression(), !4143)
  %exitcond1 = icmp ne i32 %i.0.i, 17, !dbg !4149
  br i1 %exitcond1, label %for.body.i, label %for.end.i, !dbg !4150

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4151
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4152
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4153
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4153
    #dbg_value(ptr %add.ptr.i, !623, !DIExpression(), !4154)
    #dbg_value(i64 %0, !629, !DIExpression(), !4154)
    #dbg_value(i32 0, !630, !DIExpression(), !4154)
  br label %for.cond.i.i, !dbg !4156

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4157
    #dbg_value(i32 %i.0.i.i, !630, !DIExpression(), !4154)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4158
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4159

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4160
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4161
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4161
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4162
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4163
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4164
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4165
    #dbg_value(i32 %inc.i.i, !630, !DIExpression(), !4154)
  br label %for.cond.i.i, !dbg !4166, !llvm.loop !4167

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4169
    #dbg_value(i32 %inc.i, !613, !DIExpression(), !4143)
  br label %for.cond.i, !dbg !4170, !llvm.loop !4171

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4173
    #dbg_value(ptr %add.ptr1.i, !600, !DIExpression(), !4143)
  %sub.i = add i32 %nblocks.addr.0.i, -1, !dbg !4174
    #dbg_value(i32 %sub.i, !607, !DIExpression(), !4143)
  br label %while.cond.i, !dbg !4145, !llvm.loop !4175

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  ret void, !dbg !4177
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4178 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4179, !DIExpression(), !4180)
    #dbg_value(i32 %outlen, !4181, !DIExpression(), !4180)
    #dbg_value(ptr %in, !4182, !DIExpression(), !4180)
    #dbg_value(i32 %inlen, !4183, !DIExpression(), !4180)
    #dbg_declare(ptr %state, !4184, !DIExpression(), !4185)
    #dbg_value(ptr %state, !559, !DIExpression(), !4186)
    #dbg_value(ptr %in, !571, !DIExpression(), !4186)
    #dbg_value(i32 %inlen, !572, !DIExpression(), !4186)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4188
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4189
  store i32 168, ptr %pos.i, align 8, !dbg !4190
  %div = udiv i32 %outlen, 168, !dbg !4191
    #dbg_value(i32 %div, !4192, !DIExpression(), !4180)
    #dbg_value(ptr %out, !592, !DIExpression(), !4193)
    #dbg_value(i32 %div, !598, !DIExpression(), !4193)
    #dbg_value(ptr %state, !599, !DIExpression(), !4193)
    #dbg_value(ptr %out, !600, !DIExpression(), !4195)
    #dbg_value(i32 %div, !607, !DIExpression(), !4195)
    #dbg_value(ptr %state, !608, !DIExpression(), !4195)
    #dbg_value(i32 168, !609, !DIExpression(), !4195)
  br label %while.cond.i, !dbg !4197

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !600, !DIExpression(), !4195)
    #dbg_value(i32 %nblocks.addr.0.i, !607, !DIExpression(), !4195)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4197
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4197

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4198
    #dbg_value(i32 0, !613, !DIExpression(), !4195)
  br label %for.cond.i, !dbg !4199

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4200
    #dbg_value(i32 %i.0.i, !613, !DIExpression(), !4195)
  %exitcond14 = icmp ne i32 %i.0.i, 21, !dbg !4201
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4202

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4203
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4204
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4205
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4205
    #dbg_value(ptr %add.ptr.i, !623, !DIExpression(), !4206)
    #dbg_value(i64 %0, !629, !DIExpression(), !4206)
    #dbg_value(i32 0, !630, !DIExpression(), !4206)
  br label %for.cond.i.i, !dbg !4208

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4209
    #dbg_value(i32 %i.0.i.i, !630, !DIExpression(), !4206)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4210
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4211

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4212
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4213
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4213
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4214
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4215
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4216
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4217
    #dbg_value(i32 %inc.i.i, !630, !DIExpression(), !4206)
  br label %for.cond.i.i, !dbg !4218, !llvm.loop !4219

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4221
    #dbg_value(i32 %inc.i, !613, !DIExpression(), !4195)
  br label %for.cond.i, !dbg !4222, !llvm.loop !4223

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 168, !dbg !4225
    #dbg_value(ptr %add.ptr1.i, !600, !DIExpression(), !4195)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4226
    #dbg_value(i32 %sub.i, !607, !DIExpression(), !4195)
  br label %while.cond.i, !dbg !4197, !llvm.loop !4227

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -168, !dbg !4229
  %sub = add i32 %mul.neg, %outlen, !dbg !4230
    #dbg_value(i32 %sub, !4181, !DIExpression(), !4180)
  %mul1 = mul nuw i32 %div, 168, !dbg !4231
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4232
    #dbg_value(ptr %add.ptr, !4179, !DIExpression(), !4180)
    #dbg_value(ptr %add.ptr, !3896, !DIExpression(), !4233)
    #dbg_value(i32 %sub, !3898, !DIExpression(), !4233)
    #dbg_value(ptr %state, !3899, !DIExpression(), !4233)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4235
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4235
    #dbg_value(ptr %add.ptr, !864, !DIExpression(), !4236)
    #dbg_value(i32 %sub, !870, !DIExpression(), !4236)
    #dbg_value(ptr %state, !871, !DIExpression(), !4236)
    #dbg_value(i32 %1, !872, !DIExpression(), !4236)
    #dbg_value(i32 168, !873, !DIExpression(), !4236)
  br label %while.cond.i2, !dbg !4238

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !864, !DIExpression(), !4236)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !4236)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !4236)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4238
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4238

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 168, !dbg !4239
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4239

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4240
    #dbg_value(i32 0, !872, !DIExpression(), !4236)
  br label %if.end.i, !dbg !4241

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !4236)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !4236)
  br label %for.cond.i7, !dbg !4242

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4243
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !4236)
    #dbg_value(i32 %i.0.i8, !881, !DIExpression(), !4236)
  %cmp1.i = icmp ult i32 %i.0.i8, 168, !dbg !4244
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4245
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4245
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4245
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4246

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4247
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4248
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4248
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4249
  %mul.i12 = and i32 %rem.i, 56, !dbg !4249
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4250
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4250
  %conv.i = trunc i64 %shr.i to i8, !dbg !4248
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4236)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4251
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4252
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !4236)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4253
    #dbg_value(i32 %inc.i13, !881, !DIExpression(), !4236)
  br label %for.cond.i7, !dbg !4254, !llvm.loop !4255

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4243
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4257
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4258
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !4236)
    #dbg_value(i32 %i.0.i8.lcssa, !872, !DIExpression(), !4236)
  br label %while.cond.i2, !dbg !4238, !llvm.loop !4259

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4261
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4262
  ret void, !dbg !4263
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !831 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !835, !DIExpression(), !4264)
    #dbg_value(i32 %outlen, !837, !DIExpression(), !4264)
    #dbg_value(ptr %in, !838, !DIExpression(), !4264)
    #dbg_value(i32 %inlen, !839, !DIExpression(), !4264)
    #dbg_declare(ptr %state, !840, !DIExpression(), !4265)
    #dbg_value(ptr %state, !842, !DIExpression(), !4266)
    #dbg_value(ptr %in, !844, !DIExpression(), !4266)
    #dbg_value(i32 %inlen, !845, !DIExpression(), !4266)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #4, !dbg !4268
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4269
  store i32 136, ptr %pos.i, align 8, !dbg !4270
  %div = udiv i32 %outlen, 136, !dbg !4271
    #dbg_value(i32 %div, !848, !DIExpression(), !4264)
    #dbg_value(ptr %out, !849, !DIExpression(), !4272)
    #dbg_value(i32 %div, !853, !DIExpression(), !4272)
    #dbg_value(ptr %state, !854, !DIExpression(), !4272)
    #dbg_value(ptr %out, !600, !DIExpression(), !4274)
    #dbg_value(i32 %div, !607, !DIExpression(), !4274)
    #dbg_value(ptr %state, !608, !DIExpression(), !4274)
    #dbg_value(i32 136, !609, !DIExpression(), !4274)
  br label %while.cond.i, !dbg !4276

while.cond.i:                                     ; preds = %for.end.i, %entry
  %nblocks.addr.0.i = phi i32 [ %div, %entry ], [ %sub.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %entry ], [ %add.ptr1.i, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !600, !DIExpression(), !4274)
    #dbg_value(i32 %nblocks.addr.0.i, !607, !DIExpression(), !4274)
  %tobool.not.i = icmp eq i32 %nblocks.addr.0.i, 0, !dbg !4276
  br i1 %tobool.not.i, label %keccak_squeezeblocks.exit, label %while.body.i, !dbg !4276

while.body.i:                                     ; preds = %while.cond.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4277
    #dbg_value(i32 0, !613, !DIExpression(), !4274)
  br label %for.cond.i, !dbg !4278

for.cond.i:                                       ; preds = %store64.exit.i, %while.body.i
  %i.0.i = phi i32 [ 0, %while.body.i ], [ %inc.i, %store64.exit.i ], !dbg !4279
    #dbg_value(i32 %i.0.i, !613, !DIExpression(), !4274)
  %exitcond14 = icmp ne i32 %i.0.i, 17, !dbg !4280
  br i1 %exitcond14, label %for.body.i, label %for.end.i, !dbg !4281

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4282
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 %mul.i, !dbg !4283
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %state, i32 %i.0.i, !dbg !4284
  %0 = load i64, ptr %arrayidx.i, align 8, !dbg !4284
    #dbg_value(ptr %add.ptr.i, !623, !DIExpression(), !4285)
    #dbg_value(i64 %0, !629, !DIExpression(), !4285)
    #dbg_value(i32 0, !630, !DIExpression(), !4285)
  br label %for.cond.i.i, !dbg !4287

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i
  %i.0.i.i = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ], !dbg !4288
    #dbg_value(i32 %i.0.i.i, !630, !DIExpression(), !4285)
  %exitcond = icmp ne i32 %i.0.i.i, 8, !dbg !4289
  br i1 %exitcond, label %for.body.i.i, label %store64.exit.i, !dbg !4290

for.body.i.i:                                     ; preds = %for.cond.i.i
  %mul.i.i = shl nuw nsw i32 %i.0.i.i, 3, !dbg !4291
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !4292
  %shr.i.i = lshr i64 %0, %sh_prom.i.i, !dbg !4292
  %conv.i.i = trunc i64 %shr.i.i to i8, !dbg !4293
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i, !dbg !4294
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1, !dbg !4295
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !4296
    #dbg_value(i32 %inc.i.i, !630, !DIExpression(), !4285)
  br label %for.cond.i.i, !dbg !4297, !llvm.loop !4298

store64.exit.i:                                   ; preds = %for.cond.i.i
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4300
    #dbg_value(i32 %inc.i, !613, !DIExpression(), !4274)
  br label %for.cond.i, !dbg !4301, !llvm.loop !4302

for.end.i:                                        ; preds = %for.cond.i
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i, i32 136, !dbg !4304
    #dbg_value(ptr %add.ptr1.i, !600, !DIExpression(), !4274)
  %sub.i = add nsw i32 %nblocks.addr.0.i, -1, !dbg !4305
    #dbg_value(i32 %sub.i, !607, !DIExpression(), !4274)
  br label %while.cond.i, !dbg !4276, !llvm.loop !4306

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i
  %mul.neg = mul i32 %div, -136, !dbg !4308
  %sub = add i32 %mul.neg, %outlen, !dbg !4309
    #dbg_value(i32 %sub, !837, !DIExpression(), !4264)
  %mul1 = mul nuw i32 %div, 136, !dbg !4310
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !4311
    #dbg_value(ptr %add.ptr, !835, !DIExpression(), !4264)
    #dbg_value(ptr %add.ptr, !857, !DIExpression(), !4312)
    #dbg_value(i32 %sub, !861, !DIExpression(), !4312)
    #dbg_value(ptr %state, !862, !DIExpression(), !4312)
  %pos.i1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4314
  %1 = load i32, ptr %pos.i1, align 8, !dbg !4314
    #dbg_value(ptr %add.ptr, !864, !DIExpression(), !4315)
    #dbg_value(i32 %sub, !870, !DIExpression(), !4315)
    #dbg_value(ptr %state, !871, !DIExpression(), !4315)
    #dbg_value(i32 %1, !872, !DIExpression(), !4315)
    #dbg_value(i32 136, !873, !DIExpression(), !4315)
  br label %while.cond.i2, !dbg !4317

while.cond.i2:                                    ; preds = %for.end.i9, %keccak_squeezeblocks.exit
  %pos.addr.0.i = phi i32 [ %1, %keccak_squeezeblocks.exit ], [ %i.0.i8.lcssa, %for.end.i9 ]
  %outlen.addr.0.i = phi i32 [ %sub, %keccak_squeezeblocks.exit ], [ %sub3.i, %for.end.i9 ]
  %out.addr.0.i3 = phi ptr [ %add.ptr, %keccak_squeezeblocks.exit ], [ %out.addr.1.i.lcssa, %for.end.i9 ]
    #dbg_value(ptr %out.addr.0.i3, !864, !DIExpression(), !4315)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !4315)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !4315)
  %tobool.not.i4 = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4317
  br i1 %tobool.not.i4, label %keccak_squeeze.exit, label %while.body.i5, !dbg !4317

while.body.i5:                                    ; preds = %while.cond.i2
  %cmp.i6 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4318
  br i1 %cmp.i6, label %if.then.i, label %if.end.i, !dbg !4318

if.then.i:                                        ; preds = %while.body.i5
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %state) #4, !dbg !4319
    #dbg_value(i32 0, !872, !DIExpression(), !4315)
  br label %if.end.i, !dbg !4320

if.end.i:                                         ; preds = %if.then.i, %while.body.i5
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i5 ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !4315)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !4315)
  br label %for.cond.i7, !dbg !4321

for.cond.i7:                                      ; preds = %for.body.i10, %if.end.i
  %i.0.i8 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i13, %for.body.i10 ], !dbg !4322
  %out.addr.1.i = phi ptr [ %out.addr.0.i3, %if.end.i ], [ %incdec.ptr.i, %for.body.i10 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !4315)
    #dbg_value(i32 %i.0.i8, !881, !DIExpression(), !4315)
  %cmp1.i = icmp ult i32 %i.0.i8, 136, !dbg !4323
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4324
  %cmp2.i = icmp ult i32 %i.0.i8, %add.i, !dbg !4324
  %2 = select i1 %cmp1.i, i1 %cmp2.i, i1 false, !dbg !4324
  br i1 %2, label %for.body.i10, label %for.end.i9, !dbg !4325

for.body.i10:                                     ; preds = %for.cond.i7
  %div1.i = lshr i32 %i.0.i8, 3, !dbg !4326
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %state, i32 %div1.i, !dbg !4327
  %3 = load i64, ptr %arrayidx.i11, align 8, !dbg !4327
  %rem.i = shl nuw nsw i32 %i.0.i8, 3, !dbg !4328
  %mul.i12 = and i32 %rem.i, 56, !dbg !4328
  %sh_prom.i = zext nneg i32 %mul.i12 to i64, !dbg !4329
  %shr.i = lshr i64 %3, %sh_prom.i, !dbg !4329
  %conv.i = trunc i64 %shr.i to i8, !dbg !4327
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4315)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4330
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4331
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !4315)
  %inc.i13 = add nuw nsw i32 %i.0.i8, 1, !dbg !4332
    #dbg_value(i32 %inc.i13, !881, !DIExpression(), !4315)
  br label %for.cond.i7, !dbg !4333, !llvm.loop !4334

for.end.i9:                                       ; preds = %for.cond.i7
  %i.0.i8.lcssa = phi i32 [ %i.0.i8, %for.cond.i7 ], !dbg !4322
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i7 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i8.lcssa, !dbg !4336
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4337
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !4315)
    #dbg_value(i32 %i.0.i8.lcssa, !872, !DIExpression(), !4315)
  br label %while.cond.i2, !dbg !4317, !llvm.loop !4338

keccak_squeeze.exit:                              ; preds = %while.cond.i2
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i2 ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4340
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4341
  ret void, !dbg !4342
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4343 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4346, !DIExpression(), !4347)
    #dbg_value(ptr %in, !4348, !DIExpression(), !4347)
    #dbg_value(i32 %inlen, !4349, !DIExpression(), !4347)
    #dbg_declare(ptr %s, !4350, !DIExpression(), !4351)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4352
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4353
    #dbg_value(i32 0, !4354, !DIExpression(), !4347)
  br label %for.cond, !dbg !4355

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4357
    #dbg_value(i32 %i.0, !4354, !DIExpression(), !4347)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !4358
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4360

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4361
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4362
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4363
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4363
    #dbg_value(ptr %add.ptr, !623, !DIExpression(), !4364)
    #dbg_value(i64 %0, !629, !DIExpression(), !4364)
    #dbg_value(i32 0, !630, !DIExpression(), !4364)
  br label %for.cond.i, !dbg !4366

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4367
    #dbg_value(i32 %i.0.i, !630, !DIExpression(), !4364)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4368
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4369

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4370
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4371
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4371
  %conv.i = trunc i64 %shr.i to i8, !dbg !4372
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4373
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4374
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4375
    #dbg_value(i32 %inc.i, !630, !DIExpression(), !4364)
  br label %for.cond.i, !dbg !4376, !llvm.loop !4377

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4379
    #dbg_value(i32 %inc, !4354, !DIExpression(), !4347)
  br label %for.cond, !dbg !4380, !llvm.loop !4381

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4383
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !4384 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !4385, !DIExpression(), !4386)
    #dbg_value(ptr %in, !4387, !DIExpression(), !4386)
    #dbg_value(i32 %inlen, !4388, !DIExpression(), !4386)
    #dbg_declare(ptr %s, !4389, !DIExpression(), !4390)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #4, !dbg !4391
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4392
    #dbg_value(i32 0, !4393, !DIExpression(), !4386)
  br label %for.cond, !dbg !4394

for.cond:                                         ; preds = %store64.exit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %store64.exit ], !dbg !4396
    #dbg_value(i32 %i.0, !4393, !DIExpression(), !4386)
  %exitcond1 = icmp ne i32 %i.0, 8, !dbg !4397
  br i1 %exitcond1, label %for.body, label %for.end, !dbg !4399

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !4400
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !4401
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !4402
  %0 = load i64, ptr %arrayidx, align 8, !dbg !4402
    #dbg_value(ptr %add.ptr, !623, !DIExpression(), !4403)
    #dbg_value(i64 %0, !629, !DIExpression(), !4403)
    #dbg_value(i32 0, !630, !DIExpression(), !4403)
  br label %for.cond.i, !dbg !4405

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %i.0.i = phi i32 [ 0, %for.body ], [ %inc.i, %for.body.i ], !dbg !4406
    #dbg_value(i32 %i.0.i, !630, !DIExpression(), !4403)
  %exitcond = icmp ne i32 %i.0.i, 8, !dbg !4407
  br i1 %exitcond, label %for.body.i, label %store64.exit, !dbg !4408

for.body.i:                                       ; preds = %for.cond.i
  %mul.i = shl nuw nsw i32 %i.0.i, 3, !dbg !4409
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4410
  %shr.i = lshr i64 %0, %sh_prom.i, !dbg !4410
  %conv.i = trunc i64 %shr.i to i8, !dbg !4411
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i, !dbg !4412
  store i8 %conv.i, ptr %arrayidx.i, align 1, !dbg !4413
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4414
    #dbg_value(i32 %inc.i, !630, !DIExpression(), !4403)
  br label %for.cond.i, !dbg !4415, !llvm.loop !4416

store64.exit:                                     ; preds = %for.cond.i
  %inc = add nuw nsw i32 %i.0, 1, !dbg !4418
    #dbg_value(i32 %inc, !4393, !DIExpression(), !4386)
  br label %for.cond, !dbg !4419, !llvm.loop !4420

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4422
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !534 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !545, !DIExpression(), !4423)
    #dbg_value(ptr %seed, !547, !DIExpression(), !4423)
    #dbg_value(i8 %x, !548, !DIExpression(), !4423)
    #dbg_value(i8 %y, !549, !DIExpression(), !4423)
    #dbg_declare(ptr %extseed, !550, !DIExpression(), !4424)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #5, !dbg !4425
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !4426
  store i8 %x, ptr %arrayidx, align 1, !dbg !4427
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !4428
  store i8 %y, ptr %arrayidx1, align 1, !dbg !4429
    #dbg_value(ptr %state, !559, !DIExpression(), !4430)
    #dbg_value(ptr %extseed, !571, !DIExpression(), !4430)
    #dbg_value(i32 34, !572, !DIExpression(), !4430)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef nonnull %extseed, i32 noundef 34, i8 noundef zeroext 31) #4, !dbg !4432
  %pos.i = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !4433
  store i32 168, ptr %pos.i, align 8, !dbg !4434
  ret void, !dbg !4435
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !812 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !816, !DIExpression(), !4436)
    #dbg_value(i32 %outlen, !818, !DIExpression(), !4436)
    #dbg_value(ptr %key, !819, !DIExpression(), !4436)
    #dbg_value(i8 %nonce, !820, !DIExpression(), !4436)
    #dbg_declare(ptr %extkey, !821, !DIExpression(), !4437)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #5, !dbg !4438
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !4439
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !4440
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #4, !dbg !4441
  ret void, !dbg !4442
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !4443 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !4444, !DIExpression(), !4445)
    #dbg_value(ptr %key, !4446, !DIExpression(), !4445)
    #dbg_value(ptr %input, !4447, !DIExpression(), !4445)
    #dbg_declare(ptr %s, !4448, !DIExpression(), !4449)
    #dbg_value(ptr %s, !4064, !DIExpression(), !4450)
    #dbg_value(ptr %s, !3324, !DIExpression(), !4452)
    #dbg_value(i32 0, !3330, !DIExpression(), !4452)
  br label %for.cond.i, !dbg !4454

for.cond.i:                                       ; preds = %for.body.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ], !dbg !4455
    #dbg_value(i32 %i.0.i, !3330, !DIExpression(), !4452)
  %exitcond = icmp ne i32 %i.0.i, 25, !dbg !4456
  br i1 %exitcond, label %for.body.i, label %keccak_init.exit, !dbg !4457

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %s, i32 %i.0.i, !dbg !4458
  store i64 0, ptr %arrayidx.i, align 8, !dbg !4459
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !4460
    #dbg_value(i32 %inc.i, !3330, !DIExpression(), !4452)
  br label %for.cond.i, !dbg !4461, !llvm.loop !4462

keccak_init.exit:                                 ; preds = %for.cond.i
  %pos.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4464
  store i32 0, ptr %pos.i, align 8, !dbg !4465
    #dbg_value(ptr %s, !4082, !DIExpression(), !4466)
    #dbg_value(ptr %key, !4084, !DIExpression(), !4466)
    #dbg_value(i32 32, !4085, !DIExpression(), !4466)
  %call.i8 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef 0, i32 noundef 136, ptr noundef %key, i32 noundef 32) #4, !dbg !4468
  %pos1.i9 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4469
  store i32 %call.i8, ptr %pos1.i9, align 8, !dbg !4470
    #dbg_value(ptr %s, !4082, !DIExpression(), !4471)
    #dbg_value(ptr %input, !4084, !DIExpression(), !4471)
    #dbg_value(i32 1568, !4085, !DIExpression(), !4471)
  %call.i5 = call fastcc i32 @keccak_absorb(ptr noundef nonnull %s, i32 noundef %call.i8, i32 noundef 136, ptr noundef %input, i32 noundef 1568) #4, !dbg !4473
  %pos1.i6 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4474
  store i32 %call.i5, ptr %pos1.i6, align 8, !dbg !4475
    #dbg_value(ptr %s, !4092, !DIExpression(), !4476)
    #dbg_value(ptr %s, !3876, !DIExpression(), !4478)
    #dbg_value(i32 %call.i5, !3882, !DIExpression(), !4478)
    #dbg_value(i32 136, !3883, !DIExpression(), !4478)
    #dbg_value(i8 31, !3884, !DIExpression(), !4478)
  %rem.i = shl i32 %call.i5, 3, !dbg !4480
  %mul.i = and i32 %rem.i, 56, !dbg !4480
  %sh_prom.i = zext nneg i32 %mul.i to i64, !dbg !4481
  %shl.i = shl nuw nsw i64 31, %sh_prom.i, !dbg !4481
  %div2.i = lshr i32 %call.i5, 3, !dbg !4482
  %arrayidx.i10 = getelementptr inbounds nuw i64, ptr %s, i32 %div2.i, !dbg !4483
  %0 = load i64, ptr %arrayidx.i10, align 8, !dbg !4484
  %xor.i = xor i64 %0, %shl.i, !dbg !4484
  store i64 %xor.i, ptr %arrayidx.i10, align 8, !dbg !4484
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %s, i32 128, !dbg !4485
  %1 = load i64, ptr %arrayidx2.i, align 8, !dbg !4486
  %xor3.i = xor i64 %1, -9223372036854775808, !dbg !4486
  store i64 %xor3.i, ptr %arrayidx2.i, align 8, !dbg !4486
  %pos1.i3 = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4487
  store i32 136, ptr %pos1.i3, align 8, !dbg !4488
    #dbg_value(ptr %out, !857, !DIExpression(), !4489)
    #dbg_value(i32 32, !861, !DIExpression(), !4489)
    #dbg_value(ptr %s, !862, !DIExpression(), !4489)
    #dbg_value(ptr %out, !864, !DIExpression(), !4491)
    #dbg_value(i32 32, !870, !DIExpression(), !4491)
    #dbg_value(ptr %s, !871, !DIExpression(), !4491)
    #dbg_value(i32 136, !872, !DIExpression(), !4491)
    #dbg_value(i32 136, !873, !DIExpression(), !4491)
  br label %while.cond.i, !dbg !4493

while.cond.i:                                     ; preds = %for.end.i, %keccak_init.exit
  %pos.addr.0.i = phi i32 [ 136, %keccak_init.exit ], [ %i.0.i13.lcssa, %for.end.i ]
  %outlen.addr.0.i = phi i32 [ 32, %keccak_init.exit ], [ %sub3.i, %for.end.i ]
  %out.addr.0.i = phi ptr [ %out, %keccak_init.exit ], [ %out.addr.1.i.lcssa, %for.end.i ]
    #dbg_value(ptr %out.addr.0.i, !864, !DIExpression(), !4491)
    #dbg_value(i32 %outlen.addr.0.i, !870, !DIExpression(), !4491)
    #dbg_value(i32 %pos.addr.0.i, !872, !DIExpression(), !4491)
  %tobool.not.i = icmp eq i32 %outlen.addr.0.i, 0, !dbg !4493
  br i1 %tobool.not.i, label %keccak_squeeze.exit, label %while.body.i, !dbg !4493

while.body.i:                                     ; preds = %while.cond.i
  %cmp.i11 = icmp eq i32 %pos.addr.0.i, 136, !dbg !4494
  br i1 %cmp.i11, label %if.then.i, label %if.end.i, !dbg !4494

if.then.i:                                        ; preds = %while.body.i
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #4, !dbg !4495
    #dbg_value(i32 0, !872, !DIExpression(), !4491)
  br label %if.end.i, !dbg !4496

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %pos.addr.1.i = phi i32 [ 0, %if.then.i ], [ %pos.addr.0.i, %while.body.i ]
    #dbg_value(i32 %pos.addr.1.i, !872, !DIExpression(), !4491)
    #dbg_value(i32 %pos.addr.1.i, !881, !DIExpression(), !4491)
  br label %for.cond.i12, !dbg !4497

for.cond.i12:                                     ; preds = %for.body.i14, %if.end.i
  %i.0.i13 = phi i32 [ %pos.addr.1.i, %if.end.i ], [ %inc.i19, %for.body.i14 ], !dbg !4498
  %out.addr.1.i = phi ptr [ %out.addr.0.i, %if.end.i ], [ %incdec.ptr.i, %for.body.i14 ]
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(), !4491)
    #dbg_value(i32 %i.0.i13, !881, !DIExpression(), !4491)
  %cmp1.i = icmp ult i32 %i.0.i13, 136, !dbg !4499
  %add.i = add i32 %pos.addr.1.i, %outlen.addr.0.i, !dbg !4500
  %cmp2.i = icmp ult i32 %i.0.i13, %add.i, !dbg !4500
  %2 = and i1 %cmp1.i, %cmp2.i, !dbg !4500
  br i1 %2, label %for.body.i14, label %for.end.i, !dbg !4501

for.body.i14:                                     ; preds = %for.cond.i12
  %div1.i = lshr i32 %i.0.i13, 3, !dbg !4502
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %s, i32 %div1.i, !dbg !4503
  %3 = load i64, ptr %arrayidx.i15, align 8, !dbg !4503
  %rem.i16 = shl nuw nsw i32 %i.0.i13, 3, !dbg !4504
  %mul.i17 = and i32 %rem.i16, 56, !dbg !4504
  %sh_prom.i18 = zext nneg i32 %mul.i17 to i64, !dbg !4505
  %shr.i = lshr i64 %3, %sh_prom.i18, !dbg !4505
  %conv.i = trunc i64 %shr.i to i8, !dbg !4503
    #dbg_value(ptr %out.addr.1.i, !864, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !4491)
  store i8 %conv.i, ptr %out.addr.1.i, align 1, !dbg !4506
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %out.addr.1.i, i32 1, !dbg !4507
    #dbg_value(ptr %incdec.ptr.i, !864, !DIExpression(), !4491)
  %inc.i19 = add nuw nsw i32 %i.0.i13, 1, !dbg !4508
    #dbg_value(i32 %inc.i19, !881, !DIExpression(), !4491)
  br label %for.cond.i12, !dbg !4509, !llvm.loop !4510

for.end.i:                                        ; preds = %for.cond.i12
  %i.0.i13.lcssa = phi i32 [ %i.0.i13, %for.cond.i12 ], !dbg !4498
  %out.addr.1.i.lcssa = phi ptr [ %out.addr.1.i, %for.cond.i12 ]
  %sub.neg.i = sub i32 %pos.addr.1.i, %i.0.i13.lcssa, !dbg !4512
  %sub3.i = add i32 %sub.neg.i, %outlen.addr.0.i, !dbg !4513
    #dbg_value(i32 %sub3.i, !870, !DIExpression(), !4491)
    #dbg_value(i32 %i.0.i13.lcssa, !872, !DIExpression(), !4491)
  br label %while.cond.i, !dbg !4493, !llvm.loop !4514

keccak_squeeze.exit:                              ; preds = %while.cond.i
  %pos.addr.0.i.lcssa = phi i32 [ %pos.addr.0.i, %while.cond.i ]
  %pos1.i = getelementptr inbounds nuw i8, ptr %s, i32 200, !dbg !4516
  store i32 %pos.addr.0.i.lcssa, ptr %pos1.i, align 8, !dbg !4517
  ret void, !dbg !4518
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshl.i8(i8, i8, i8) #2

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
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
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
!94 = !{!91, !61, !86, !55}
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
!118 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !119, file: !119, line: 50, type: !120, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!119 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!120 = !DISubroutineType(types: !121)
!121 = !{!50, !32, !32}
!122 = distinct !DILocation(line: 18, column: 3, scope: !123, inlinedAt: !124)
!123 = distinct !DISubprogram(name: "test_keys", scope: !2, file: !2, line: 9, type: !107, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!124 = distinct !DILocation(line: 103, column: 10, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !2, line: 102, column: 25)
!126 = !DILocalVariable(name: "pk", scope: !123, file: !2, line: 11, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 12544, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 1568)
!130 = !DILocation(line: 11, column: 11, scope: !123, inlinedAt: !124)
!131 = !DILocalVariable(name: "sk", scope: !123, file: !2, line: 12, type: !132)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 25344, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 3168)
!135 = !DILocation(line: 12, column: 11, scope: !123, inlinedAt: !124)
!136 = !DILocalVariable(name: "ct", scope: !123, file: !2, line: 13, type: !127)
!137 = !DILocation(line: 13, column: 11, scope: !123, inlinedAt: !124)
!138 = !DILocalVariable(name: "key_a", scope: !123, file: !2, line: 14, type: !139)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 32)
!142 = !DILocation(line: 14, column: 11, scope: !123, inlinedAt: !124)
!143 = !DILocalVariable(name: "key_b", scope: !123, file: !2, line: 15, type: !139)
!144 = !DILocation(line: 15, column: 11, scope: !123, inlinedAt: !124)
!145 = !DILocalVariable(name: "pk", arg: 1, scope: !118, file: !119, line: 50, type: !32)
!146 = !DILocation(line: 0, scope: !118, inlinedAt: !122)
!147 = !DILocalVariable(name: "sk", arg: 2, scope: !118, file: !119, line: 51, type: !32)
!148 = !DILocalVariable(name: "coins", scope: !118, file: !119, line: 53, type: !149)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 64)
!152 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !122)
!153 = !DILocalVariable(name: "pk", arg: 1, scope: !154, file: !119, line: 25, type: !32)
!154 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !119, file: !119, line: 25, type: !155, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!155 = !DISubroutineType(types: !156)
!156 = !{!50, !32, !32, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 32)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!159 = !DILocation(line: 0, scope: !154, inlinedAt: !160)
!160 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !122)
!161 = !DILocalVariable(name: "sk", arg: 2, scope: !154, file: !119, line: 26, type: !32)
!162 = !DILocalVariable(name: "coins", arg: 3, scope: !154, file: !119, line: 27, type: !157)
!163 = !DILocation(line: 29, column: 3, scope: !154, inlinedAt: !160)
!164 = !DILocation(line: 30, column: 12, scope: !154, inlinedAt: !160)
!165 = !DILocation(line: 30, column: 3, scope: !154, inlinedAt: !160)
!166 = !DILocation(line: 31, column: 3, scope: !154, inlinedAt: !160)
!167 = !DILocation(line: 33, column: 33, scope: !154, inlinedAt: !160)
!168 = !DILocation(line: 33, column: 55, scope: !154, inlinedAt: !160)
!169 = !DILocation(line: 33, column: 3, scope: !154, inlinedAt: !160)
!170 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !122)
!171 = !DILocation(line: 118, column: 3, scope: !172, inlinedAt: !173)
!172 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !119, file: !119, line: 113, type: !155, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!173 = distinct !DILocation(line: 21, column: 3, scope: !123, inlinedAt: !124)
!174 = !DILocalVariable(name: "ct", arg: 1, scope: !172, file: !119, line: 113, type: !32)
!175 = !DILocation(line: 0, scope: !172, inlinedAt: !173)
!176 = !DILocalVariable(name: "ss", arg: 2, scope: !172, file: !119, line: 114, type: !32)
!177 = !DILocalVariable(name: "pk", arg: 3, scope: !172, file: !119, line: 115, type: !157)
!178 = !DILocalVariable(name: "coins", scope: !172, file: !119, line: 117, type: !139)
!179 = !DILocation(line: 117, column: 11, scope: !172, inlinedAt: !173)
!180 = !DILocation(line: 119, column: 3, scope: !172, inlinedAt: !173)
!181 = !DILocation(line: 120, column: 3, scope: !172, inlinedAt: !173)
!182 = !DILocation(line: 24, column: 3, scope: !123, inlinedAt: !124)
!183 = !DILocation(line: 26, column: 6, scope: !184, inlinedAt: !124)
!184 = distinct !DILexicalBlock(scope: !123, file: !2, line: 26, column: 6)
!185 = !DILocation(line: 27, column: 5, scope: !186, inlinedAt: !124)
!186 = distinct !DILexicalBlock(scope: !184, file: !2, line: 26, column: 42)
!187 = !DILocation(line: 28, column: 5, scope: !186, inlinedAt: !124)
!188 = !DILocation(line: 0, scope: !123, inlinedAt: !124)
!189 = !DILocation(line: 32, column: 1, scope: !123, inlinedAt: !124)
!190 = !DILocalVariable(name: "r", scope: !106, file: !2, line: 100, type: !50)
!191 = !DILocation(line: 54, column: 3, scope: !118, inlinedAt: !192)
!192 = distinct !DILocation(line: 43, column: 3, scope: !193, inlinedAt: !194)
!193 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!194 = distinct !DILocation(line: 104, column: 10, scope: !125)
!195 = !DILocalVariable(name: "pk", scope: !193, file: !2, line: 36, type: !127)
!196 = !DILocation(line: 36, column: 11, scope: !193, inlinedAt: !194)
!197 = !DILocalVariable(name: "sk", scope: !193, file: !2, line: 37, type: !132)
!198 = !DILocation(line: 37, column: 11, scope: !193, inlinedAt: !194)
!199 = !DILocalVariable(name: "ct", scope: !193, file: !2, line: 38, type: !127)
!200 = !DILocation(line: 38, column: 11, scope: !193, inlinedAt: !194)
!201 = !DILocalVariable(name: "key_a", scope: !193, file: !2, line: 39, type: !139)
!202 = !DILocation(line: 39, column: 11, scope: !193, inlinedAt: !194)
!203 = !DILocalVariable(name: "key_b", scope: !193, file: !2, line: 40, type: !139)
!204 = !DILocation(line: 40, column: 11, scope: !193, inlinedAt: !194)
!205 = !DILocation(line: 0, scope: !118, inlinedAt: !192)
!206 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !192)
!207 = !DILocation(line: 0, scope: !154, inlinedAt: !208)
!208 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !192)
!209 = !DILocation(line: 29, column: 3, scope: !154, inlinedAt: !208)
!210 = !DILocation(line: 30, column: 12, scope: !154, inlinedAt: !208)
!211 = !DILocation(line: 30, column: 3, scope: !154, inlinedAt: !208)
!212 = !DILocation(line: 31, column: 3, scope: !154, inlinedAt: !208)
!213 = !DILocation(line: 33, column: 33, scope: !154, inlinedAt: !208)
!214 = !DILocation(line: 33, column: 55, scope: !154, inlinedAt: !208)
!215 = !DILocation(line: 33, column: 3, scope: !154, inlinedAt: !208)
!216 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !192)
!217 = !DILocation(line: 118, column: 3, scope: !172, inlinedAt: !218)
!218 = distinct !DILocation(line: 46, column: 3, scope: !193, inlinedAt: !194)
!219 = !DILocation(line: 0, scope: !172, inlinedAt: !218)
!220 = !DILocation(line: 117, column: 11, scope: !172, inlinedAt: !218)
!221 = !DILocation(line: 119, column: 3, scope: !172, inlinedAt: !218)
!222 = !DILocation(line: 120, column: 3, scope: !172, inlinedAt: !218)
!223 = !DILocation(line: 49, column: 3, scope: !193, inlinedAt: !194)
!224 = !DILocation(line: 52, column: 3, scope: !193, inlinedAt: !194)
!225 = !DILocation(line: 54, column: 7, scope: !226, inlinedAt: !194)
!226 = distinct !DILexicalBlock(scope: !193, file: !2, line: 54, column: 6)
!227 = !DILocation(line: 54, column: 6, scope: !226, inlinedAt: !194)
!228 = !DILocation(line: 55, column: 5, scope: !229, inlinedAt: !194)
!229 = distinct !DILexicalBlock(scope: !226, file: !2, line: 54, column: 43)
!230 = !DILocation(line: 56, column: 5, scope: !229, inlinedAt: !194)
!231 = !DILocation(line: 0, scope: !193, inlinedAt: !194)
!232 = !DILocation(line: 60, column: 1, scope: !193, inlinedAt: !194)
!233 = !DILocation(line: 72, column: 3, scope: !234, inlinedAt: !235)
!234 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!235 = distinct !DILocation(line: 105, column: 10, scope: !125)
!236 = !DILocalVariable(name: "pk", scope: !234, file: !2, line: 64, type: !127)
!237 = !DILocation(line: 64, column: 11, scope: !234, inlinedAt: !235)
!238 = !DILocalVariable(name: "sk", scope: !234, file: !2, line: 65, type: !132)
!239 = !DILocation(line: 65, column: 11, scope: !234, inlinedAt: !235)
!240 = !DILocalVariable(name: "ct", scope: !234, file: !2, line: 66, type: !127)
!241 = !DILocation(line: 66, column: 11, scope: !234, inlinedAt: !235)
!242 = !DILocalVariable(name: "key_a", scope: !234, file: !2, line: 67, type: !139)
!243 = !DILocation(line: 67, column: 11, scope: !234, inlinedAt: !235)
!244 = !DILocalVariable(name: "key_b", scope: !234, file: !2, line: 68, type: !139)
!245 = !DILocation(line: 68, column: 11, scope: !234, inlinedAt: !235)
!246 = !DILocalVariable(name: "b", scope: !234, file: !2, line: 69, type: !33)
!247 = !DILocation(line: 0, scope: !234, inlinedAt: !235)
!248 = !DILocation(line: 73, column: 5, scope: !249, inlinedAt: !235)
!249 = distinct !DILexicalBlock(scope: !234, file: !2, line: 72, column: 6)
!250 = !DILocation(line: 74, column: 12, scope: !234, inlinedAt: !235)
!251 = !DILocation(line: 74, column: 11, scope: !234, inlinedAt: !235)
!252 = !DILocation(line: 74, column: 3, scope: !249, inlinedAt: !235)
!253 = distinct !{!253, !233, !254, !255}
!254 = !DILocation(line: 74, column: 13, scope: !234, inlinedAt: !235)
!255 = !{!"llvm.loop.mustprogress"}
!256 = !DILocation(line: 104, column: 7, scope: !125)
!257 = !DILocalVariable(name: "pos", scope: !234, file: !2, line: 70, type: !38)
!258 = !DILocation(line: 75, column: 3, scope: !234, inlinedAt: !235)
!259 = !DILocation(line: 54, column: 3, scope: !118, inlinedAt: !260)
!260 = distinct !DILocation(line: 78, column: 3, scope: !234, inlinedAt: !235)
!261 = !DILocation(line: 0, scope: !118, inlinedAt: !260)
!262 = !DILocation(line: 53, column: 11, scope: !118, inlinedAt: !260)
!263 = !DILocation(line: 0, scope: !154, inlinedAt: !264)
!264 = distinct !DILocation(line: 55, column: 3, scope: !118, inlinedAt: !260)
!265 = !DILocation(line: 29, column: 3, scope: !154, inlinedAt: !264)
!266 = !DILocation(line: 30, column: 12, scope: !154, inlinedAt: !264)
!267 = !DILocation(line: 30, column: 3, scope: !154, inlinedAt: !264)
!268 = !DILocation(line: 31, column: 3, scope: !154, inlinedAt: !264)
!269 = !DILocation(line: 33, column: 33, scope: !154, inlinedAt: !264)
!270 = !DILocation(line: 33, column: 55, scope: !154, inlinedAt: !264)
!271 = !DILocation(line: 33, column: 3, scope: !154, inlinedAt: !264)
!272 = !DILocation(line: 56, column: 3, scope: !118, inlinedAt: !260)
!273 = !DILocation(line: 118, column: 3, scope: !172, inlinedAt: !274)
!274 = distinct !DILocation(line: 81, column: 3, scope: !234, inlinedAt: !235)
!275 = !DILocation(line: 0, scope: !172, inlinedAt: !274)
!276 = !DILocation(line: 117, column: 11, scope: !172, inlinedAt: !274)
!277 = !DILocation(line: 119, column: 3, scope: !172, inlinedAt: !274)
!278 = !DILocation(line: 120, column: 3, scope: !172, inlinedAt: !274)
!279 = !DILocation(line: 84, column: 39, scope: !234, inlinedAt: !235)
!280 = !DILocation(line: 84, column: 6, scope: !234, inlinedAt: !235)
!281 = !DILocation(line: 84, column: 10, scope: !234, inlinedAt: !235)
!282 = !DILocation(line: 84, column: 3, scope: !234, inlinedAt: !235)
!283 = !DILocation(line: 84, column: 36, scope: !234, inlinedAt: !235)
!284 = !DILocation(line: 87, column: 3, scope: !234, inlinedAt: !235)
!285 = !DILocation(line: 89, column: 7, scope: !286, inlinedAt: !235)
!286 = distinct !DILexicalBlock(scope: !234, file: !2, line: 89, column: 6)
!287 = !DILocation(line: 89, column: 6, scope: !286, inlinedAt: !235)
!288 = !DILocation(line: 90, column: 5, scope: !289, inlinedAt: !235)
!289 = distinct !DILexicalBlock(scope: !286, file: !2, line: 89, column: 43)
!290 = !DILocation(line: 91, column: 5, scope: !289, inlinedAt: !235)
!291 = !DILocation(line: 95, column: 1, scope: !234, inlinedAt: !235)
!292 = !DILocation(line: 105, column: 7, scope: !125)
!293 = !DILocation(line: 106, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !125, file: !2, line: 106, column: 8)
!295 = !DILocation(line: 102, column: 21, scope: !115)
!296 = !DILocation(line: 102, column: 3, scope: !115)
!297 = distinct !{!297, !116, !298, !255}
!298 = !DILocation(line: 108, column: 3, scope: !112)
!299 = !DILocation(line: 110, column: 3, scope: !106)
!300 = !DILocation(line: 111, column: 3, scope: !106)
!301 = !DILocation(line: 112, column: 3, scope: !106)
!302 = !DILocation(line: 114, column: 3, scope: !106)
!303 = !DILocation(line: 115, column: 1, scope: !106)
!304 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!305 = !DILocation(line: 0, scope: !28)
!306 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!307 = !DILocation(line: 78, column: 3, scope: !28)
!308 = !DILocation(line: 78, column: 9, scope: !28)
!309 = !DILocation(line: 78, column: 12, scope: !28)
!310 = !DILocation(line: 86, column: 3, scope: !28)
!311 = !DILocation(line: 79, column: 10, scope: !312)
!312 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!313 = !DILocation(line: 79, column: 8, scope: !312)
!314 = !DILocation(line: 80, column: 11, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !29, line: 80, column: 8)
!316 = !DILocation(line: 80, column: 17, scope: !315)
!317 = !DILocation(line: 80, column: 20, scope: !315)
!318 = !DILocation(line: 80, column: 26, scope: !315)
!319 = !DILocation(line: 82, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !315, file: !29, line: 82, column: 13)
!321 = !DILocation(line: 82, column: 16, scope: !320)
!322 = !DILocation(line: 83, column: 7, scope: !320)
!323 = distinct !{!323, !307, !324, !255}
!324 = !DILocation(line: 84, column: 3, scope: !28)
!325 = !DILocation(line: 86, column: 16, scope: !28)
!326 = !DILocation(line: 87, column: 16, scope: !327)
!327 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!328 = !DILocation(line: 87, column: 11, scope: !327)
!329 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !330)
!330 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !331, line: 182, baseType: !332)
!331 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!332 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !333, line: 147, baseType: !50)
!333 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!334 = !DILocation(line: 88, column: 18, scope: !335)
!335 = distinct !DILexicalBlock(scope: !327, file: !29, line: 88, column: 8)
!336 = !DILocation(line: 88, column: 21, scope: !335)
!337 = !DILocation(line: 88, column: 27, scope: !335)
!338 = distinct !{!338, !310, !339, !255}
!339 = !DILocation(line: 95, column: 3, scope: !28)
!340 = !DILocation(line: 91, column: 7, scope: !341)
!341 = distinct !DILexicalBlock(scope: !335, file: !29, line: 90, column: 13)
!342 = !DILocation(line: 93, column: 9, scope: !327)
!343 = !DILocation(line: 94, column: 12, scope: !327)
!344 = !DILocation(line: 96, column: 1, scope: !28)
!345 = !DILocation(line: 0, scope: !154)
!346 = !DILocation(line: 29, column: 3, scope: !154)
!347 = !DILocation(line: 30, column: 12, scope: !154)
!348 = !DILocation(line: 30, column: 3, scope: !154)
!349 = !DILocation(line: 31, column: 3, scope: !154)
!350 = !DILocation(line: 33, column: 33, scope: !154)
!351 = !DILocation(line: 33, column: 55, scope: !154)
!352 = !DILocation(line: 33, column: 3, scope: !154)
!353 = !DILocation(line: 34, column: 3, scope: !154)
!354 = !DILocation(line: 0, scope: !118)
!355 = !DILocation(line: 53, column: 11, scope: !118)
!356 = !DILocation(line: 54, column: 3, scope: !118)
!357 = !DILocation(line: 0, scope: !154, inlinedAt: !358)
!358 = distinct !DILocation(line: 55, column: 3, scope: !118)
!359 = !DILocation(line: 29, column: 3, scope: !154, inlinedAt: !358)
!360 = !DILocation(line: 30, column: 12, scope: !154, inlinedAt: !358)
!361 = !DILocation(line: 30, column: 3, scope: !154, inlinedAt: !358)
!362 = !DILocation(line: 31, column: 3, scope: !154, inlinedAt: !358)
!363 = !DILocation(line: 33, column: 33, scope: !154, inlinedAt: !358)
!364 = !DILocation(line: 33, column: 55, scope: !154, inlinedAt: !358)
!365 = !DILocation(line: 33, column: 3, scope: !154, inlinedAt: !358)
!366 = !DILocation(line: 56, column: 3, scope: !118)
!367 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !119, file: !119, line: 76, type: !368, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!368 = !DISubroutineType(types: !369)
!369 = !{!50, !32, !32, !157, !157}
!370 = !DILocalVariable(name: "ct", arg: 1, scope: !367, file: !119, line: 76, type: !32)
!371 = !DILocation(line: 0, scope: !367)
!372 = !DILocalVariable(name: "ss", arg: 2, scope: !367, file: !119, line: 77, type: !32)
!373 = !DILocalVariable(name: "pk", arg: 3, scope: !367, file: !119, line: 78, type: !157)
!374 = !DILocalVariable(name: "coins", arg: 4, scope: !367, file: !119, line: 79, type: !157)
!375 = !DILocalVariable(name: "buf", scope: !367, file: !119, line: 81, type: !149)
!376 = !DILocation(line: 81, column: 11, scope: !367)
!377 = !DILocalVariable(name: "kr", scope: !367, file: !119, line: 83, type: !149)
!378 = !DILocation(line: 83, column: 11, scope: !367)
!379 = !DILocation(line: 85, column: 3, scope: !367)
!380 = !DILocation(line: 88, column: 3, scope: !367)
!381 = !DILocation(line: 89, column: 3, scope: !367)
!382 = !DILocation(line: 92, column: 29, scope: !367)
!383 = !DILocation(line: 92, column: 3, scope: !367)
!384 = !DILocation(line: 94, column: 3, scope: !367)
!385 = !DILocation(line: 95, column: 3, scope: !367)
!386 = !DILocation(line: 0, scope: !172)
!387 = !DILocation(line: 117, column: 11, scope: !172)
!388 = !DILocation(line: 118, column: 3, scope: !172)
!389 = !DILocation(line: 119, column: 3, scope: !172)
!390 = !DILocation(line: 120, column: 3, scope: !172)
!391 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !119, file: !119, line: 140, type: !392, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!392 = !DISubroutineType(types: !393)
!393 = !{!50, !32, !157, !157}
!394 = !DILocalVariable(name: "ss", arg: 1, scope: !391, file: !119, line: 140, type: !32)
!395 = !DILocation(line: 0, scope: !391)
!396 = !DILocalVariable(name: "ct", arg: 2, scope: !391, file: !119, line: 141, type: !157)
!397 = !DILocalVariable(name: "sk", arg: 3, scope: !391, file: !119, line: 142, type: !157)
!398 = !DILocalVariable(name: "buf", scope: !391, file: !119, line: 145, type: !149)
!399 = !DILocation(line: 145, column: 11, scope: !391)
!400 = !DILocalVariable(name: "kr", scope: !391, file: !119, line: 147, type: !149)
!401 = !DILocation(line: 147, column: 11, scope: !391)
!402 = !DILocalVariable(name: "cmp", scope: !391, file: !119, line: 149, type: !127)
!403 = !DILocation(line: 149, column: 11, scope: !391)
!404 = !DILocation(line: 150, column: 25, scope: !391)
!405 = !DILocalVariable(name: "pk", scope: !391, file: !119, line: 150, type: !157)
!406 = !DILocation(line: 152, column: 3, scope: !391)
!407 = !DILocation(line: 155, column: 13, scope: !391)
!408 = !DILocation(line: 155, column: 53, scope: !391)
!409 = !DILocation(line: 155, column: 3, scope: !391)
!410 = !DILocation(line: 156, column: 3, scope: !391)
!411 = !DILocation(line: 159, column: 30, scope: !391)
!412 = !DILocation(line: 159, column: 3, scope: !391)
!413 = !DILocalVariable(name: "a", arg: 1, scope: !414, file: !415, line: 16, type: !157)
!414 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !415, file: !415, line: 16, type: !416, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!415 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!416 = !DISubroutineType(types: !417)
!417 = !{!50, !157, !157, !38}
!418 = !DILocation(line: 0, scope: !414, inlinedAt: !419)
!419 = distinct !DILocation(line: 161, column: 10, scope: !391)
!420 = !DILocalVariable(name: "b", arg: 2, scope: !414, file: !415, line: 16, type: !157)
!421 = !DILocalVariable(name: "len", arg: 3, scope: !414, file: !415, line: 16, type: !38)
!422 = !DILocalVariable(name: "r", scope: !414, file: !415, line: 19, type: !33)
!423 = !DILocalVariable(name: "i", scope: !414, file: !415, line: 18, type: !38)
!424 = !DILocation(line: 21, column: 7, scope: !425, inlinedAt: !419)
!425 = distinct !DILexicalBlock(scope: !414, file: !415, line: 21, column: 3)
!426 = !DILocation(line: 21, scope: !425, inlinedAt: !419)
!427 = !DILocation(line: 21, column: 12, scope: !428, inlinedAt: !419)
!428 = distinct !DILexicalBlock(scope: !425, file: !415, line: 21, column: 3)
!429 = !DILocation(line: 21, column: 3, scope: !425, inlinedAt: !419)
!430 = !DILocation(line: 22, column: 10, scope: !428, inlinedAt: !419)
!431 = !DILocation(line: 22, column: 17, scope: !428, inlinedAt: !419)
!432 = !DILocation(line: 22, column: 15, scope: !428, inlinedAt: !419)
!433 = !DILocation(line: 22, column: 7, scope: !428, inlinedAt: !419)
!434 = !DILocation(line: 21, column: 18, scope: !428, inlinedAt: !419)
!435 = !DILocation(line: 21, column: 3, scope: !428, inlinedAt: !419)
!436 = distinct !{!436, !429, !437, !255}
!437 = !DILocation(line: 22, column: 20, scope: !425, inlinedAt: !419)
!438 = !DILocation(line: 24, column: 25, scope: !414, inlinedAt: !419)
!439 = !DILocalVariable(name: "fail", scope: !391, file: !119, line: 144, type: !50)
!440 = !DILocation(line: 164, column: 3, scope: !391)
!441 = !DILocation(line: 167, column: 29, scope: !391)
!442 = !DILocalVariable(name: "r", arg: 1, scope: !443, file: !415, line: 40, type: !32)
!443 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !415, file: !415, line: 40, type: !444, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!444 = !DISubroutineType(types: !445)
!445 = !{null, !32, !157, !38, !33}
!446 = !DILocation(line: 0, scope: !443, inlinedAt: !447)
!447 = distinct !DILocation(line: 167, column: 3, scope: !391)
!448 = !DILocalVariable(name: "x", arg: 2, scope: !443, file: !415, line: 40, type: !157)
!449 = !DILocalVariable(name: "len", arg: 3, scope: !443, file: !415, line: 40, type: !38)
!450 = !DILocalVariable(name: "b", arg: 4, scope: !443, file: !415, line: 40, type: !33)
!451 = !DILocation(line: 51, column: 3, scope: !443, inlinedAt: !447)
!452 = !{i64 1722}
!453 = !DILocation(line: 54, column: 7, scope: !443, inlinedAt: !447)
!454 = !DILocalVariable(name: "i", scope: !443, file: !415, line: 42, type: !38)
!455 = !DILocation(line: 55, column: 7, scope: !456, inlinedAt: !447)
!456 = distinct !DILexicalBlock(scope: !443, file: !415, line: 55, column: 3)
!457 = !DILocation(line: 55, scope: !456, inlinedAt: !447)
!458 = !DILocation(line: 55, column: 12, scope: !459, inlinedAt: !447)
!459 = distinct !DILexicalBlock(scope: !456, file: !415, line: 55, column: 3)
!460 = !DILocation(line: 55, column: 3, scope: !456, inlinedAt: !447)
!461 = !DILocation(line: 56, column: 18, scope: !459, inlinedAt: !447)
!462 = !DILocation(line: 56, column: 25, scope: !459, inlinedAt: !447)
!463 = !DILocation(line: 56, column: 23, scope: !459, inlinedAt: !447)
!464 = !DILocation(line: 56, column: 15, scope: !459, inlinedAt: !447)
!465 = !DILocation(line: 56, column: 5, scope: !459, inlinedAt: !447)
!466 = !DILocation(line: 56, column: 10, scope: !459, inlinedAt: !447)
!467 = !DILocation(line: 55, column: 18, scope: !459, inlinedAt: !447)
!468 = !DILocation(line: 55, column: 3, scope: !459, inlinedAt: !447)
!469 = distinct !{!469, !460, !470, !255}
!470 = !DILocation(line: 56, column: 29, scope: !456, inlinedAt: !447)
!471 = !DILocation(line: 169, column: 3, scope: !391)
!472 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !473, file: !473, line: 165, type: !474, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!473 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!474 = !DISubroutineType(types: !475)
!475 = !{null, !476, !157, !50}
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 32)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !478, line: 10, baseType: !479)
!478 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!479 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !478, line: 8, size: 16384, elements: !480)
!480 = !{!481}
!481 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !479, file: !478, line: 9, baseType: !482, size: 16384)
!482 = !DICompositeType(tag: DW_TAG_array_type, baseType: !483, size: 16384, elements: !491)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !484, line: 13, baseType: !485)
!484 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!485 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !484, line: 11, size: 4096, elements: !486)
!486 = !{!487}
!487 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !485, file: !484, line: 12, baseType: !488, size: 4096)
!488 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !489)
!489 = !{!490}
!490 = !DISubrange(count: 256)
!491 = !{!492}
!492 = !DISubrange(count: 4)
!493 = !DILocalVariable(name: "a", arg: 1, scope: !472, file: !473, line: 165, type: !476)
!494 = !DILocation(line: 0, scope: !472)
!495 = !DILocalVariable(name: "seed", arg: 2, scope: !472, file: !473, line: 165, type: !157)
!496 = !DILocalVariable(name: "transposed", arg: 3, scope: !472, file: !473, line: 165, type: !50)
!497 = !DILocalVariable(name: "buf", scope: !472, file: !473, line: 169, type: !498)
!498 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !499)
!499 = !{!500}
!500 = !DISubrange(count: 504)
!501 = !DILocation(line: 169, column: 11, scope: !472)
!502 = !DILocalVariable(name: "state", scope: !472, file: !473, line: 170, type: !503)
!503 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !504, line: 10, baseType: !505)
!504 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!505 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !506, line: 17, baseType: !507)
!506 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!507 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !506, line: 14, size: 1664, elements: !508)
!508 = !{!509, !513}
!509 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !507, file: !506, line: 15, baseType: !510, size: 1600)
!510 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !511)
!511 = !{!512}
!512 = !DISubrange(count: 25)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !507, file: !506, line: 16, baseType: !40, size: 32, offset: 1600)
!514 = !DILocation(line: 170, column: 13, scope: !472)
!515 = !DILocalVariable(name: "i", scope: !472, file: !473, line: 167, type: !40)
!516 = !DILocation(line: 172, column: 7, scope: !517)
!517 = distinct !DILexicalBlock(scope: !472, file: !473, line: 172, column: 3)
!518 = !DILocation(line: 172, scope: !517)
!519 = !DILocation(line: 172, column: 12, scope: !520)
!520 = distinct !DILexicalBlock(scope: !517, file: !473, line: 172, column: 3)
!521 = !DILocation(line: 172, column: 3, scope: !517)
!522 = !DILocation(line: 173, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !524, file: !473, line: 173, column: 5)
!524 = distinct !DILexicalBlock(scope: !520, file: !473, line: 172, column: 26)
!525 = !DILocation(line: 173, scope: !523)
!526 = !DILocalVariable(name: "j", scope: !472, file: !473, line: 167, type: !40)
!527 = !DILocation(line: 173, column: 14, scope: !528)
!528 = distinct !DILexicalBlock(scope: !523, file: !473, line: 173, column: 5)
!529 = !DILocation(line: 174, column: 10, scope: !530)
!530 = distinct !DILexicalBlock(scope: !531, file: !473, line: 174, column: 10)
!531 = distinct !DILexicalBlock(scope: !528, file: !473, line: 173, column: 28)
!532 = !DILocation(line: 175, column: 9, scope: !530)
!533 = !DILocation(line: 25, column: 3, scope: !534, inlinedAt: !544)
!534 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !535, file: !535, line: 18, type: !536, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!535 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!536 = !DISubroutineType(types: !537)
!537 = !{null, !538, !157, !33, !33}
!538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !539, size: 32)
!539 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !506, line: 17, baseType: !540)
!540 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !506, line: 14, size: 1664, elements: !541)
!541 = !{!542, !543}
!542 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !540, file: !506, line: 15, baseType: !510, size: 1600)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !540, file: !506, line: 16, baseType: !40, size: 32, offset: 1600)
!544 = distinct !DILocation(line: 175, column: 9, scope: !530)
!545 = !DILocalVariable(name: "state", arg: 1, scope: !534, file: !535, line: 18, type: !538)
!546 = !DILocation(line: 0, scope: !534, inlinedAt: !544)
!547 = !DILocalVariable(name: "seed", arg: 2, scope: !534, file: !535, line: 19, type: !157)
!548 = !DILocalVariable(name: "x", arg: 3, scope: !534, file: !535, line: 20, type: !33)
!549 = !DILocalVariable(name: "y", arg: 4, scope: !534, file: !535, line: 21, type: !33)
!550 = !DILocalVariable(name: "extseed", scope: !534, file: !535, line: 23, type: !551)
!551 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !552)
!552 = !{!553}
!553 = !DISubrange(count: 34)
!554 = !DILocation(line: 23, column: 11, scope: !534, inlinedAt: !544)
!555 = !DILocation(line: 26, column: 3, scope: !534, inlinedAt: !544)
!556 = !DILocation(line: 26, column: 29, scope: !534, inlinedAt: !544)
!557 = !DILocation(line: 27, column: 3, scope: !534, inlinedAt: !544)
!558 = !DILocation(line: 27, column: 29, scope: !534, inlinedAt: !544)
!559 = !DILocalVariable(name: "state", arg: 1, scope: !560, file: !74, line: 580, type: !563)
!560 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !561, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!561 = !DISubroutineType(types: !562)
!562 = !{null, !563, !157, !38}
!563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !564, size: 32)
!564 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !506, line: 17, baseType: !565)
!565 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !506, line: 14, size: 1664, elements: !566)
!566 = !{!567, !568}
!567 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !565, file: !506, line: 15, baseType: !510, size: 1600)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !565, file: !506, line: 16, baseType: !40, size: 32, offset: 1600)
!569 = !DILocation(line: 0, scope: !560, inlinedAt: !570)
!570 = distinct !DILocation(line: 29, column: 3, scope: !534, inlinedAt: !544)
!571 = !DILocalVariable(name: "in", arg: 2, scope: !560, file: !74, line: 580, type: !157)
!572 = !DILocalVariable(name: "inlen", arg: 3, scope: !560, file: !74, line: 580, type: !38)
!573 = !DILocation(line: 582, column: 3, scope: !560, inlinedAt: !570)
!574 = !DILocation(line: 583, column: 10, scope: !560, inlinedAt: !570)
!575 = !DILocation(line: 583, column: 14, scope: !560, inlinedAt: !570)
!576 = !DILocation(line: 30, column: 1, scope: !534, inlinedAt: !544)
!577 = !DILocation(line: 177, column: 9, scope: !530)
!578 = !DILocation(line: 25, column: 3, scope: !534, inlinedAt: !579)
!579 = distinct !DILocation(line: 177, column: 9, scope: !530)
!580 = !DILocation(line: 0, scope: !534, inlinedAt: !579)
!581 = !DILocation(line: 23, column: 11, scope: !534, inlinedAt: !579)
!582 = !DILocation(line: 26, column: 3, scope: !534, inlinedAt: !579)
!583 = !DILocation(line: 26, column: 29, scope: !534, inlinedAt: !579)
!584 = !DILocation(line: 27, column: 3, scope: !534, inlinedAt: !579)
!585 = !DILocation(line: 27, column: 29, scope: !534, inlinedAt: !579)
!586 = !DILocation(line: 0, scope: !560, inlinedAt: !587)
!587 = distinct !DILocation(line: 29, column: 3, scope: !534, inlinedAt: !579)
!588 = !DILocation(line: 582, column: 3, scope: !560, inlinedAt: !587)
!589 = !DILocation(line: 583, column: 10, scope: !560, inlinedAt: !587)
!590 = !DILocation(line: 583, column: 14, scope: !560, inlinedAt: !587)
!591 = !DILocation(line: 30, column: 1, scope: !534, inlinedAt: !579)
!592 = !DILocalVariable(name: "out", arg: 1, scope: !593, file: !74, line: 598, type: !32)
!593 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !594, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!594 = !DISubroutineType(types: !595)
!595 = !{null, !32, !38, !563}
!596 = !DILocation(line: 0, scope: !593, inlinedAt: !597)
!597 = distinct !DILocation(line: 179, column: 7, scope: !531)
!598 = !DILocalVariable(name: "nblocks", arg: 2, scope: !593, file: !74, line: 598, type: !38)
!599 = !DILocalVariable(name: "state", arg: 3, scope: !593, file: !74, line: 598, type: !563)
!600 = !DILocalVariable(name: "out", arg: 1, scope: !601, file: !74, line: 500, type: !32)
!601 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !602, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!602 = !DISubroutineType(types: !603)
!603 = !{null, !32, !38, !604, !40}
!604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!605 = !DILocation(line: 0, scope: !601, inlinedAt: !606)
!606 = distinct !DILocation(line: 600, column: 3, scope: !593, inlinedAt: !597)
!607 = !DILocalVariable(name: "nblocks", arg: 2, scope: !601, file: !74, line: 501, type: !38)
!608 = !DILocalVariable(name: "s", arg: 3, scope: !601, file: !74, line: 502, type: !604)
!609 = !DILocalVariable(name: "r", arg: 4, scope: !601, file: !74, line: 503, type: !40)
!610 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !606)
!611 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !606)
!612 = distinct !DILexicalBlock(scope: !601, file: !74, line: 507, column: 18)
!613 = !DILocalVariable(name: "i", scope: !601, file: !74, line: 505, type: !40)
!614 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !606)
!615 = distinct !DILexicalBlock(scope: !612, file: !74, line: 509, column: 5)
!616 = !DILocation(line: 509, scope: !615, inlinedAt: !606)
!617 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !606)
!618 = distinct !DILexicalBlock(scope: !615, file: !74, line: 509, column: 5)
!619 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !606)
!620 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !606)
!621 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !606)
!622 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !606)
!623 = !DILocalVariable(name: "x", arg: 1, scope: !624, file: !74, line: 40, type: !32)
!624 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !625, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!625 = !DISubroutineType(types: !626)
!626 = !{null, !32, !70}
!627 = !DILocation(line: 0, scope: !624, inlinedAt: !628)
!628 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !606)
!629 = !DILocalVariable(name: "u", arg: 2, scope: !624, file: !74, line: 40, type: !70)
!630 = !DILocalVariable(name: "i", scope: !624, file: !74, line: 41, type: !40)
!631 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !628)
!632 = distinct !DILexicalBlock(scope: !624, file: !74, line: 43, column: 3)
!633 = !DILocation(line: 43, scope: !632, inlinedAt: !628)
!634 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !628)
!635 = distinct !DILexicalBlock(scope: !632, file: !74, line: 43, column: 3)
!636 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !628)
!637 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !628)
!638 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !628)
!639 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !628)
!640 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !628)
!641 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !628)
!642 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !628)
!643 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !628)
!644 = distinct !{!644, !636, !645, !255}
!645 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !628)
!646 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !606)
!647 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !606)
!648 = distinct !{!648, !619, !649, !255}
!649 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !606)
!650 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !606)
!651 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !606)
!652 = distinct !{!652, !610, !653, !255}
!653 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !606)
!654 = !DILocalVariable(name: "buflen", scope: !472, file: !473, line: 168, type: !40)
!655 = !DILocation(line: 181, column: 25, scope: !531)
!656 = !DILocation(line: 181, column: 13, scope: !531)
!657 = !DILocalVariable(name: "ctr", scope: !472, file: !473, line: 167, type: !40)
!658 = !DILocation(line: 183, column: 7, scope: !531)
!659 = !DILocation(line: 0, scope: !531)
!660 = !DILocation(line: 183, column: 17, scope: !531)
!661 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !662)
!662 = distinct !DILocation(line: 600, column: 3, scope: !593, inlinedAt: !663)
!663 = distinct !DILocation(line: 184, column: 9, scope: !664)
!664 = distinct !DILexicalBlock(scope: !531, file: !473, line: 183, column: 28)
!665 = !DILocation(line: 0, scope: !601, inlinedAt: !662)
!666 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !662)
!667 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !662)
!668 = !DILocation(line: 509, scope: !615, inlinedAt: !662)
!669 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !662)
!670 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !662)
!671 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !662)
!672 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !662)
!673 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !662)
!674 = !DILocation(line: 0, scope: !624, inlinedAt: !675)
!675 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !662)
!676 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !675)
!677 = !DILocation(line: 43, scope: !632, inlinedAt: !675)
!678 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !675)
!679 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !675)
!680 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !675)
!681 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !675)
!682 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !675)
!683 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !675)
!684 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !675)
!685 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !675)
!686 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !675)
!687 = distinct !{!687, !679, !688, !255}
!688 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !675)
!689 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !662)
!690 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !662)
!691 = distinct !{!691, !670, !692, !255}
!692 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !662)
!693 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !662)
!694 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !662)
!695 = distinct !{!695, !661, !696, !255}
!696 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !662)
!697 = !DILocation(line: 186, column: 28, scope: !664)
!698 = !DILocation(line: 186, column: 47, scope: !664)
!699 = !DILocation(line: 186, column: 62, scope: !664)
!700 = !DILocation(line: 186, column: 16, scope: !664)
!701 = !DILocation(line: 186, column: 13, scope: !664)
!702 = distinct !{!702, !658, !703, !255}
!703 = !DILocation(line: 187, column: 7, scope: !531)
!704 = !DILocation(line: 173, column: 24, scope: !528)
!705 = !DILocation(line: 173, column: 5, scope: !528)
!706 = distinct !{!706, !522, !707, !255}
!707 = !DILocation(line: 188, column: 5, scope: !523)
!708 = !DILocation(line: 172, column: 22, scope: !520)
!709 = !DILocation(line: 172, column: 3, scope: !520)
!710 = distinct !{!710, !521, !711, !255}
!711 = !DILocation(line: 189, column: 3, scope: !517)
!712 = !DILocation(line: 190, column: 1, scope: !472)
!713 = distinct !DISubprogram(name: "rej_uniform", scope: !473, file: !473, line: 121, type: !714, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!714 = !DISubroutineType(types: !715)
!715 = !{!40, !716, !40, !157, !40}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!717 = !DILocalVariable(name: "r", arg: 1, scope: !713, file: !473, line: 121, type: !716)
!718 = !DILocation(line: 0, scope: !713)
!719 = !DILocalVariable(name: "len", arg: 2, scope: !713, file: !473, line: 122, type: !40)
!720 = !DILocalVariable(name: "buf", arg: 3, scope: !713, file: !473, line: 123, type: !157)
!721 = !DILocalVariable(name: "buflen", arg: 4, scope: !713, file: !473, line: 124, type: !40)
!722 = !DILocalVariable(name: "pos", scope: !713, file: !473, line: 126, type: !40)
!723 = !DILocalVariable(name: "ctr", scope: !713, file: !473, line: 126, type: !40)
!724 = !DILocation(line: 130, column: 3, scope: !713)
!725 = !DILocation(line: 130, column: 13, scope: !713)
!726 = !DILocation(line: 130, column: 19, scope: !713)
!727 = !DILocation(line: 131, column: 14, scope: !728)
!728 = distinct !DILexicalBlock(scope: !713, file: !473, line: 130, column: 41)
!729 = !DILocation(line: 131, column: 44, scope: !728)
!730 = !DILocation(line: 131, column: 34, scope: !728)
!731 = !DILocation(line: 131, column: 55, scope: !728)
!732 = !DILocation(line: 131, column: 62, scope: !728)
!733 = !DILocalVariable(name: "val0", scope: !713, file: !473, line: 127, type: !86)
!734 = !DILocation(line: 132, column: 14, scope: !728)
!735 = !DILocation(line: 132, column: 25, scope: !728)
!736 = !DILocation(line: 132, column: 44, scope: !728)
!737 = !DILocation(line: 132, column: 34, scope: !728)
!738 = !DILocation(line: 132, column: 55, scope: !728)
!739 = !DILocation(line: 132, column: 31, scope: !728)
!740 = !DILocalVariable(name: "val1", scope: !713, file: !473, line: 127, type: !86)
!741 = !DILocation(line: 133, column: 9, scope: !728)
!742 = !DILocation(line: 135, column: 13, scope: !743)
!743 = distinct !DILexicalBlock(scope: !728, file: !473, line: 135, column: 8)
!744 = !DILocation(line: 136, column: 12, scope: !743)
!745 = !DILocation(line: 136, column: 7, scope: !743)
!746 = !DILocation(line: 136, column: 16, scope: !743)
!747 = !DILocation(line: 137, column: 12, scope: !748)
!748 = distinct !DILexicalBlock(scope: !728, file: !473, line: 137, column: 8)
!749 = !DILocation(line: 137, column: 18, scope: !748)
!750 = !DILocation(line: 138, column: 12, scope: !748)
!751 = !DILocation(line: 138, column: 7, scope: !748)
!752 = !DILocation(line: 138, column: 16, scope: !748)
!753 = !DILocation(line: 0, scope: !728)
!754 = distinct !{!754, !724, !755, !255}
!755 = !DILocation(line: 139, column: 3, scope: !713)
!756 = !DILocation(line: 141, column: 3, scope: !713)
!757 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !473, file: !473, line: 205, type: !758, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!758 = !DISubroutineType(types: !759)
!759 = !{null, !32, !32, !157}
!760 = !DILocalVariable(name: "pk", arg: 1, scope: !757, file: !473, line: 205, type: !32)
!761 = !DILocation(line: 0, scope: !757)
!762 = !DILocalVariable(name: "sk", arg: 2, scope: !757, file: !473, line: 206, type: !32)
!763 = !DILocalVariable(name: "coins", arg: 3, scope: !757, file: !473, line: 207, type: !157)
!764 = !DILocalVariable(name: "buf", scope: !757, file: !473, line: 210, type: !149)
!765 = !DILocation(line: 210, column: 11, scope: !757)
!766 = !DILocalVariable(name: "publicseed", scope: !757, file: !473, line: 211, type: !157)
!767 = !DILocation(line: 212, column: 33, scope: !757)
!768 = !DILocalVariable(name: "noiseseed", scope: !757, file: !473, line: 212, type: !157)
!769 = !DILocalVariable(name: "nonce", scope: !757, file: !473, line: 213, type: !33)
!770 = !DILocalVariable(name: "a", scope: !757, file: !473, line: 214, type: !771)
!771 = !DICompositeType(tag: DW_TAG_array_type, baseType: !477, size: 65536, elements: !491)
!772 = !DILocation(line: 214, column: 11, scope: !757)
!773 = !DILocalVariable(name: "e", scope: !757, file: !473, line: 214, type: !477)
!774 = !DILocation(line: 214, column: 23, scope: !757)
!775 = !DILocalVariable(name: "pkpv", scope: !757, file: !473, line: 214, type: !477)
!776 = !DILocation(line: 214, column: 26, scope: !757)
!777 = !DILocalVariable(name: "skpv", scope: !757, file: !473, line: 214, type: !477)
!778 = !DILocation(line: 214, column: 32, scope: !757)
!779 = !DILocation(line: 216, column: 3, scope: !757)
!780 = !DILocation(line: 217, column: 3, scope: !757)
!781 = !DILocation(line: 217, column: 23, scope: !757)
!782 = !DILocation(line: 218, column: 3, scope: !757)
!783 = !DILocation(line: 220, column: 3, scope: !757)
!784 = !DILocalVariable(name: "i", scope: !757, file: !473, line: 209, type: !40)
!785 = !DILocation(line: 222, column: 7, scope: !786)
!786 = distinct !DILexicalBlock(scope: !757, file: !473, line: 222, column: 3)
!787 = !DILocation(line: 222, scope: !786)
!788 = !DILocation(line: 222, column: 12, scope: !789)
!789 = distinct !DILexicalBlock(scope: !786, file: !473, line: 222, column: 3)
!790 = !DILocation(line: 222, column: 3, scope: !786)
!791 = !DILocation(line: 224, column: 3, scope: !792)
!792 = distinct !DILexicalBlock(scope: !757, file: !473, line: 224, column: 3)
!793 = !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !803)
!794 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !795, file: !795, line: 225, type: !796, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!795 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!796 = !DISubroutineType(types: !797)
!797 = !{null, !798, !157, !33}
!798 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !799, size: 32)
!799 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !484, line: 13, baseType: !800)
!800 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !484, line: 11, size: 4096, elements: !801)
!801 = !{!802}
!802 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !800, file: !484, line: 12, baseType: !488, size: 4096)
!803 = distinct !DILocation(line: 223, column: 5, scope: !789)
!804 = !DILocalVariable(name: "r", arg: 1, scope: !794, file: !795, line: 225, type: !798)
!805 = !DILocation(line: 0, scope: !794, inlinedAt: !803)
!806 = !DILocalVariable(name: "seed", arg: 2, scope: !794, file: !795, line: 225, type: !157)
!807 = !DILocalVariable(name: "nonce", arg: 3, scope: !794, file: !795, line: 225, type: !33)
!808 = !DILocalVariable(name: "buf", scope: !794, file: !795, line: 227, type: !809)
!809 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!810 = !DILocation(line: 227, column: 11, scope: !794, inlinedAt: !803)
!811 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !815)
!812 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !535, file: !535, line: 43, type: !813, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!813 = !DISubroutineType(types: !814)
!814 = !{null, !32, !38, !157, !33}
!815 = distinct !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !803)
!816 = !DILocalVariable(name: "out", arg: 1, scope: !812, file: !535, line: 43, type: !32)
!817 = !DILocation(line: 0, scope: !812, inlinedAt: !815)
!818 = !DILocalVariable(name: "outlen", arg: 2, scope: !812, file: !535, line: 43, type: !38)
!819 = !DILocalVariable(name: "key", arg: 3, scope: !812, file: !535, line: 43, type: !157)
!820 = !DILocalVariable(name: "nonce", arg: 4, scope: !812, file: !535, line: 43, type: !33)
!821 = !DILocalVariable(name: "extkey", scope: !812, file: !535, line: 45, type: !822)
!822 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !823)
!823 = !{!824}
!824 = !DISubrange(count: 33)
!825 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !815)
!826 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !815)
!827 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !815)
!828 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !830)
!829 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !561, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!830 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !834)
!831 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !832, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!832 = !DISubroutineType(types: !833)
!833 = !{null, !32, !38, !157, !38}
!834 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !815)
!835 = !DILocalVariable(name: "out", arg: 1, scope: !831, file: !74, line: 723, type: !32)
!836 = !DILocation(line: 0, scope: !831, inlinedAt: !834)
!837 = !DILocalVariable(name: "outlen", arg: 2, scope: !831, file: !74, line: 723, type: !38)
!838 = !DILocalVariable(name: "in", arg: 3, scope: !831, file: !74, line: 723, type: !157)
!839 = !DILocalVariable(name: "inlen", arg: 4, scope: !831, file: !74, line: 723, type: !38)
!840 = !DILocalVariable(name: "state", scope: !831, file: !74, line: 726, type: !564)
!841 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !834)
!842 = !DILocalVariable(name: "state", arg: 1, scope: !829, file: !74, line: 667, type: !563)
!843 = !DILocation(line: 0, scope: !829, inlinedAt: !830)
!844 = !DILocalVariable(name: "in", arg: 2, scope: !829, file: !74, line: 667, type: !157)
!845 = !DILocalVariable(name: "inlen", arg: 3, scope: !829, file: !74, line: 667, type: !38)
!846 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !830)
!847 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !830)
!848 = !DILocalVariable(name: "nblocks", scope: !831, file: !74, line: 725, type: !38)
!849 = !DILocalVariable(name: "out", arg: 1, scope: !850, file: !74, line: 685, type: !32)
!850 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !594, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!851 = !DILocation(line: 0, scope: !850, inlinedAt: !852)
!852 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !834)
!853 = !DILocalVariable(name: "nblocks", arg: 2, scope: !850, file: !74, line: 685, type: !38)
!854 = !DILocalVariable(name: "state", arg: 3, scope: !850, file: !74, line: 685, type: !563)
!855 = !DILocation(line: 0, scope: !601, inlinedAt: !856)
!856 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !852)
!857 = !DILocalVariable(name: "out", arg: 1, scope: !858, file: !74, line: 653, type: !32)
!858 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !594, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!859 = !DILocation(line: 0, scope: !858, inlinedAt: !860)
!860 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !834)
!861 = !DILocalVariable(name: "outlen", arg: 2, scope: !858, file: !74, line: 653, type: !38)
!862 = !DILocalVariable(name: "state", arg: 3, scope: !858, file: !74, line: 653, type: !563)
!863 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !860)
!864 = !DILocalVariable(name: "out", arg: 1, scope: !865, file: !74, line: 426, type: !32)
!865 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !866, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!866 = !DISubroutineType(types: !867)
!867 = !{!40, !32, !38, !604, !40, !40}
!868 = !DILocation(line: 0, scope: !865, inlinedAt: !869)
!869 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !860)
!870 = !DILocalVariable(name: "outlen", arg: 2, scope: !865, file: !74, line: 427, type: !38)
!871 = !DILocalVariable(name: "s", arg: 3, scope: !865, file: !74, line: 428, type: !604)
!872 = !DILocalVariable(name: "pos", arg: 4, scope: !865, file: !74, line: 429, type: !40)
!873 = !DILocalVariable(name: "r", arg: 5, scope: !865, file: !74, line: 430, type: !40)
!874 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !869)
!875 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !869)
!876 = distinct !DILexicalBlock(scope: !877, file: !74, line: 435, column: 8)
!877 = distinct !DILexicalBlock(scope: !865, file: !74, line: 434, column: 17)
!878 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !869)
!879 = distinct !DILexicalBlock(scope: !876, file: !74, line: 435, column: 18)
!880 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !869)
!881 = !DILocalVariable(name: "i", scope: !865, file: !74, line: 432, type: !40)
!882 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !869)
!883 = distinct !DILexicalBlock(scope: !877, file: !74, line: 439, column: 5)
!884 = !DILocation(line: 439, scope: !883, inlinedAt: !869)
!885 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !869)
!886 = distinct !DILexicalBlock(scope: !883, file: !74, line: 439, column: 5)
!887 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !869)
!888 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !869)
!889 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !869)
!890 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !869)
!891 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !869)
!892 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !869)
!893 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !869)
!894 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !869)
!895 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !869)
!896 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !869)
!897 = distinct !{!897, !888, !898, !255}
!898 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !869)
!899 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !869)
!900 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !869)
!901 = distinct !{!901, !874, !902, !255}
!902 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !869)
!903 = !DILocation(line: 223, column: 25, scope: !789)
!904 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !860)
!905 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !860)
!906 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !834)
!907 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !815)
!908 = !DILocalVariable(name: "r", arg: 1, scope: !909, file: !910, line: 110, type: !913)
!909 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !910, file: !910, line: 110, type: !911, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!910 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!911 = !DISubroutineType(types: !912)
!912 = !{null, !913, !157}
!913 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !914, size: 32)
!914 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !484, line: 13, baseType: !915)
!915 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !484, line: 11, size: 4096, elements: !916)
!916 = !{!917}
!917 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !915, file: !484, line: 12, baseType: !488, size: 4096)
!918 = !DILocation(line: 0, scope: !909, inlinedAt: !919)
!919 = distinct !DILocation(line: 229, column: 3, scope: !794, inlinedAt: !803)
!920 = !DILocalVariable(name: "buf", arg: 2, scope: !909, file: !910, line: 110, type: !157)
!921 = !DILocation(line: 113, column: 3, scope: !909, inlinedAt: !919)
!922 = !DILocation(line: 230, column: 1, scope: !794, inlinedAt: !803)
!923 = !DILocation(line: 223, column: 54, scope: !789)
!924 = !DILocation(line: 222, column: 22, scope: !789)
!925 = !DILocation(line: 222, column: 3, scope: !789)
!926 = distinct !{!926, !790, !927, !255}
!927 = !DILocation(line: 223, column: 56, scope: !786)
!928 = !DILocation(line: 224, scope: !792)
!929 = !DILocation(line: 224, column: 12, scope: !930)
!930 = distinct !DILexicalBlock(scope: !792, file: !473, line: 224, column: 3)
!931 = !DILocation(line: 173, column: 3, scope: !932, inlinedAt: !947)
!932 = distinct !DILexicalBlock(scope: !934, file: !933, line: 173, column: 3)
!933 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!934 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !933, file: !933, line: 170, type: !935, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !937}
!937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !938, size: 32)
!938 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !478, line: 10, baseType: !939)
!939 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !478, line: 8, size: 16384, elements: !940)
!940 = !{!941}
!941 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !939, file: !478, line: 9, baseType: !942, size: 16384)
!942 = !DICompositeType(tag: DW_TAG_array_type, baseType: !943, size: 16384, elements: !491)
!943 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !484, line: 13, baseType: !944)
!944 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !484, line: 11, size: 4096, elements: !945)
!945 = !{!946}
!946 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !944, file: !484, line: 12, baseType: !488, size: 4096)
!947 = distinct !DILocation(line: 227, column: 3, scope: !757)
!948 = !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !949)
!949 = distinct !DILocation(line: 225, column: 5, scope: !930)
!950 = !DILocation(line: 0, scope: !794, inlinedAt: !949)
!951 = !DILocation(line: 227, column: 11, scope: !794, inlinedAt: !949)
!952 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !953)
!953 = distinct !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !949)
!954 = !DILocation(line: 0, scope: !812, inlinedAt: !953)
!955 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !953)
!956 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !953)
!957 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !953)
!958 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !959)
!959 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !960)
!960 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !953)
!961 = !DILocation(line: 0, scope: !831, inlinedAt: !960)
!962 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !960)
!963 = !DILocation(line: 0, scope: !829, inlinedAt: !959)
!964 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !959)
!965 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !959)
!966 = !DILocation(line: 0, scope: !850, inlinedAt: !967)
!967 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !960)
!968 = !DILocation(line: 0, scope: !601, inlinedAt: !969)
!969 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !967)
!970 = !DILocation(line: 0, scope: !858, inlinedAt: !971)
!971 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !960)
!972 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !971)
!973 = !DILocation(line: 0, scope: !865, inlinedAt: !974)
!974 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !971)
!975 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !974)
!976 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !974)
!977 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !974)
!978 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !974)
!979 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !974)
!980 = !DILocation(line: 439, scope: !883, inlinedAt: !974)
!981 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !974)
!982 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !974)
!983 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !974)
!984 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !974)
!985 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !974)
!986 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !974)
!987 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !974)
!988 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !974)
!989 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !974)
!990 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !974)
!991 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !974)
!992 = distinct !{!992, !983, !993, !255}
!993 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !974)
!994 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !974)
!995 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !974)
!996 = distinct !{!996, !975, !997, !255}
!997 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !974)
!998 = !DILocation(line: 225, column: 25, scope: !930)
!999 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !971)
!1000 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !971)
!1001 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !960)
!1002 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !953)
!1003 = !DILocation(line: 0, scope: !909, inlinedAt: !1004)
!1004 = distinct !DILocation(line: 229, column: 3, scope: !794, inlinedAt: !949)
!1005 = !DILocation(line: 113, column: 3, scope: !909, inlinedAt: !1004)
!1006 = !DILocation(line: 230, column: 1, scope: !794, inlinedAt: !949)
!1007 = !DILocation(line: 225, column: 51, scope: !930)
!1008 = !DILocation(line: 224, column: 22, scope: !930)
!1009 = !DILocation(line: 224, column: 3, scope: !930)
!1010 = distinct !{!1010, !791, !1011, !255}
!1011 = !DILocation(line: 225, column: 53, scope: !792)
!1012 = !DILocation(line: 173, scope: !932, inlinedAt: !947)
!1013 = !DILocalVariable(name: "i", scope: !934, file: !933, line: 172, type: !40)
!1014 = !DILocation(line: 0, scope: !934, inlinedAt: !947)
!1015 = !DILocation(line: 173, column: 12, scope: !1016, inlinedAt: !947)
!1016 = distinct !DILexicalBlock(scope: !932, file: !933, line: 173, column: 3)
!1017 = !DILocation(line: 173, column: 3, scope: !932, inlinedAt: !1018)
!1018 = distinct !DILocation(line: 228, column: 3, scope: !757)
!1019 = !DILocation(line: 174, column: 15, scope: !1016, inlinedAt: !947)
!1020 = !DILocalVariable(name: "r", arg: 1, scope: !1021, file: !795, line: 261, type: !798)
!1021 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !795, file: !795, line: 261, type: !1022, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{null, !798}
!1024 = !DILocation(line: 0, scope: !1021, inlinedAt: !1025)
!1025 = distinct !DILocation(line: 174, column: 5, scope: !1016, inlinedAt: !947)
!1026 = !DILocation(line: 263, column: 3, scope: !1021, inlinedAt: !1025)
!1027 = !DILocalVariable(name: "r", arg: 1, scope: !1028, file: !795, line: 323, type: !798)
!1028 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !795, file: !795, line: 323, type: !1022, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1029 = !DILocation(line: 0, scope: !1028, inlinedAt: !1030)
!1030 = distinct !DILocation(line: 264, column: 3, scope: !1021, inlinedAt: !1025)
!1031 = !DILocalVariable(name: "i", scope: !1028, file: !795, line: 325, type: !40)
!1032 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1030)
!1033 = distinct !DILexicalBlock(scope: !1028, file: !795, line: 326, column: 3)
!1034 = !DILocation(line: 326, scope: !1033, inlinedAt: !1030)
!1035 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1030)
!1036 = distinct !DILexicalBlock(scope: !1033, file: !795, line: 326, column: 3)
!1037 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1030)
!1038 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1030)
!1039 = !DILocalVariable(name: "a", arg: 1, scope: !1040, file: !1041, line: 35, type: !61)
!1040 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1041, file: !1041, line: 35, type: !1042, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1041 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!61, !61}
!1044 = !DILocation(line: 0, scope: !1040, inlinedAt: !1045)
!1045 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1030)
!1046 = !DILocalVariable(name: "v", scope: !1040, file: !1041, line: 37, type: !60)
!1047 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1045)
!1048 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1045)
!1049 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1045)
!1050 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1045)
!1051 = !DILocalVariable(name: "t", scope: !1040, file: !1041, line: 36, type: !61)
!1052 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1045)
!1053 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1030)
!1054 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1030)
!1055 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1030)
!1056 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1030)
!1057 = distinct !{!1057, !1037, !1058, !255}
!1058 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1030)
!1059 = !DILocation(line: 173, column: 22, scope: !1016, inlinedAt: !947)
!1060 = !DILocation(line: 173, column: 3, scope: !1016, inlinedAt: !947)
!1061 = distinct !{!1061, !931, !1062, !255}
!1062 = !DILocation(line: 174, column: 24, scope: !932, inlinedAt: !947)
!1063 = !DILocation(line: 173, scope: !932, inlinedAt: !1018)
!1064 = !DILocation(line: 0, scope: !934, inlinedAt: !1018)
!1065 = !DILocation(line: 173, column: 12, scope: !1016, inlinedAt: !1018)
!1066 = !DILocation(line: 231, column: 3, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !757, file: !473, line: 231, column: 3)
!1068 = !DILocation(line: 174, column: 15, scope: !1016, inlinedAt: !1018)
!1069 = !DILocation(line: 0, scope: !1021, inlinedAt: !1070)
!1070 = distinct !DILocation(line: 174, column: 5, scope: !1016, inlinedAt: !1018)
!1071 = !DILocation(line: 263, column: 3, scope: !1021, inlinedAt: !1070)
!1072 = !DILocation(line: 0, scope: !1028, inlinedAt: !1073)
!1073 = distinct !DILocation(line: 264, column: 3, scope: !1021, inlinedAt: !1070)
!1074 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1073)
!1075 = !DILocation(line: 326, scope: !1033, inlinedAt: !1073)
!1076 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1073)
!1077 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1073)
!1078 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1073)
!1079 = !DILocation(line: 0, scope: !1040, inlinedAt: !1080)
!1080 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1073)
!1081 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1080)
!1082 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1080)
!1083 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1080)
!1084 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1080)
!1085 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1080)
!1086 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1073)
!1087 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1073)
!1088 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1073)
!1089 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1073)
!1090 = distinct !{!1090, !1077, !1091, !255}
!1091 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1073)
!1092 = !DILocation(line: 173, column: 22, scope: !1016, inlinedAt: !1018)
!1093 = !DILocation(line: 173, column: 3, scope: !1016, inlinedAt: !1018)
!1094 = distinct !{!1094, !1017, !1095, !255}
!1095 = !DILocation(line: 174, column: 24, scope: !932, inlinedAt: !1018)
!1096 = !DILocation(line: 231, scope: !1067)
!1097 = !DILocation(line: 231, column: 12, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1067, file: !473, line: 231, column: 3)
!1099 = !DILocation(line: 244, column: 3, scope: !1100, inlinedAt: !1106)
!1100 = distinct !DILexicalBlock(scope: !1101, file: !933, line: 244, column: 3)
!1101 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !933, file: !933, line: 241, type: !1102, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{null, !937, !1104, !1104}
!1104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1105, size: 32)
!1105 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !938)
!1106 = distinct !DILocation(line: 236, column: 3, scope: !757)
!1107 = !DILocation(line: 232, column: 37, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1098, file: !473, line: 231, column: 26)
!1109 = !DILocation(line: 232, column: 51, scope: !1108)
!1110 = !DILocation(line: 232, column: 5, scope: !1108)
!1111 = !DILocation(line: 233, column: 18, scope: !1108)
!1112 = !DILocalVariable(name: "r", arg: 1, scope: !1113, file: !795, line: 307, type: !798)
!1113 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !795, file: !795, line: 307, type: !1022, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1114 = !DILocation(line: 0, scope: !1113, inlinedAt: !1115)
!1115 = distinct !DILocation(line: 233, column: 5, scope: !1108)
!1116 = !DILocalVariable(name: "f", scope: !1113, file: !795, line: 310, type: !60)
!1117 = !DILocalVariable(name: "i", scope: !1113, file: !795, line: 309, type: !40)
!1118 = !DILocation(line: 311, column: 7, scope: !1119, inlinedAt: !1115)
!1119 = distinct !DILexicalBlock(scope: !1113, file: !795, line: 311, column: 3)
!1120 = !DILocation(line: 311, scope: !1119, inlinedAt: !1115)
!1121 = !DILocation(line: 311, column: 12, scope: !1122, inlinedAt: !1115)
!1122 = distinct !DILexicalBlock(scope: !1119, file: !795, line: 311, column: 3)
!1123 = !DILocation(line: 311, column: 3, scope: !1119, inlinedAt: !1115)
!1124 = !DILocation(line: 312, column: 47, scope: !1122, inlinedAt: !1115)
!1125 = !DILocation(line: 312, column: 38, scope: !1122, inlinedAt: !1115)
!1126 = !DILocation(line: 312, column: 59, scope: !1122, inlinedAt: !1115)
!1127 = !DILocalVariable(name: "a", arg: 1, scope: !1128, file: !1041, line: 16, type: !55)
!1128 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1041, file: !1041, line: 16, type: !1129, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1129 = !DISubroutineType(types: !98)
!1130 = !DILocation(line: 0, scope: !1128, inlinedAt: !1131)
!1131 = distinct !DILocation(line: 312, column: 20, scope: !1122, inlinedAt: !1115)
!1132 = !DILocalVariable(name: "t", scope: !1128, file: !1041, line: 18, type: !61)
!1133 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !1131)
!1134 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !1131)
!1135 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !1131)
!1136 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !1131)
!1137 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !1131)
!1138 = !DILocation(line: 312, column: 5, scope: !1122, inlinedAt: !1115)
!1139 = !DILocation(line: 312, column: 18, scope: !1122, inlinedAt: !1115)
!1140 = !DILocation(line: 311, column: 22, scope: !1122, inlinedAt: !1115)
!1141 = !DILocation(line: 311, column: 3, scope: !1122, inlinedAt: !1115)
!1142 = distinct !{!1142, !1123, !1143, !255}
!1143 = !DILocation(line: 312, column: 61, scope: !1119, inlinedAt: !1115)
!1144 = !DILocation(line: 231, column: 22, scope: !1098)
!1145 = !DILocation(line: 231, column: 3, scope: !1098)
!1146 = distinct !{!1146, !1066, !1147, !255}
!1147 = !DILocation(line: 234, column: 3, scope: !1067)
!1148 = !DILocation(line: 244, scope: !1100, inlinedAt: !1106)
!1149 = !DILocalVariable(name: "i", scope: !1101, file: !933, line: 243, type: !40)
!1150 = !DILocation(line: 0, scope: !1101, inlinedAt: !1106)
!1151 = !DILocation(line: 244, column: 12, scope: !1152, inlinedAt: !1106)
!1152 = distinct !DILexicalBlock(scope: !1100, file: !933, line: 244, column: 3)
!1153 = !DILocation(line: 228, column: 3, scope: !1154, inlinedAt: !1156)
!1154 = distinct !DILexicalBlock(scope: !1155, file: !933, line: 228, column: 3)
!1155 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !933, file: !933, line: 225, type: !935, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1156 = distinct !DILocation(line: 237, column: 3, scope: !757)
!1157 = !DILocation(line: 245, column: 15, scope: !1152, inlinedAt: !1106)
!1158 = !DILocation(line: 245, column: 27, scope: !1152, inlinedAt: !1106)
!1159 = !DILocation(line: 245, column: 39, scope: !1152, inlinedAt: !1106)
!1160 = !DILocalVariable(name: "r", arg: 1, scope: !1161, file: !795, line: 339, type: !798)
!1161 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !795, file: !795, line: 339, type: !1162, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{null, !798, !1164, !1164}
!1164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1165, size: 32)
!1165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !799)
!1166 = !DILocation(line: 0, scope: !1161, inlinedAt: !1167)
!1167 = distinct !DILocation(line: 245, column: 5, scope: !1152, inlinedAt: !1106)
!1168 = !DILocalVariable(name: "a", arg: 2, scope: !1161, file: !795, line: 339, type: !1164)
!1169 = !DILocalVariable(name: "b", arg: 3, scope: !1161, file: !795, line: 339, type: !1164)
!1170 = !DILocalVariable(name: "i", scope: !1161, file: !795, line: 341, type: !40)
!1171 = !DILocation(line: 342, column: 7, scope: !1172, inlinedAt: !1167)
!1172 = distinct !DILexicalBlock(scope: !1161, file: !795, line: 342, column: 3)
!1173 = !DILocation(line: 342, scope: !1172, inlinedAt: !1167)
!1174 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !1167)
!1175 = distinct !DILexicalBlock(scope: !1172, file: !795, line: 342, column: 3)
!1176 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !1167)
!1177 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !1167)
!1178 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !1167)
!1179 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !1167)
!1180 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !1167)
!1181 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !1167)
!1182 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !1167)
!1183 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1167)
!1184 = distinct !{!1184, !1176, !1185, !255}
!1185 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !1167)
!1186 = !DILocation(line: 244, column: 22, scope: !1152, inlinedAt: !1106)
!1187 = !DILocation(line: 244, column: 3, scope: !1152, inlinedAt: !1106)
!1188 = distinct !{!1188, !1099, !1189, !255}
!1189 = !DILocation(line: 245, column: 48, scope: !1100, inlinedAt: !1106)
!1190 = !DILocation(line: 228, scope: !1154, inlinedAt: !1156)
!1191 = !DILocalVariable(name: "i", scope: !1155, file: !933, line: 227, type: !40)
!1192 = !DILocation(line: 0, scope: !1155, inlinedAt: !1156)
!1193 = !DILocation(line: 228, column: 12, scope: !1194, inlinedAt: !1156)
!1194 = distinct !DILexicalBlock(scope: !1154, file: !933, line: 228, column: 3)
!1195 = !DILocation(line: 142, column: 3, scope: !1196, inlinedAt: !1200)
!1196 = distinct !DILexicalBlock(scope: !1197, file: !933, line: 142, column: 3)
!1197 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !933, file: !933, line: 139, type: !1198, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{null, !32, !1104}
!1200 = distinct !DILocation(line: 59, column: 3, scope: !1201, inlinedAt: !1204)
!1201 = distinct !DISubprogram(name: "pack_sk", scope: !473, file: !473, line: 57, type: !1202, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{null, !32, !476}
!1204 = distinct !DILocation(line: 239, column: 3, scope: !757)
!1205 = !DILocation(line: 229, column: 18, scope: !1194, inlinedAt: !1156)
!1206 = !DILocation(line: 0, scope: !1028, inlinedAt: !1207)
!1207 = distinct !DILocation(line: 229, column: 5, scope: !1194, inlinedAt: !1156)
!1208 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1207)
!1209 = !DILocation(line: 326, scope: !1033, inlinedAt: !1207)
!1210 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1207)
!1211 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1207)
!1212 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1207)
!1213 = !DILocation(line: 0, scope: !1040, inlinedAt: !1214)
!1214 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1207)
!1215 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1214)
!1216 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1214)
!1217 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1214)
!1218 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1214)
!1219 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1214)
!1220 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1207)
!1221 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1207)
!1222 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1207)
!1223 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1207)
!1224 = distinct !{!1224, !1211, !1225, !255}
!1225 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1207)
!1226 = !DILocation(line: 228, column: 22, scope: !1194, inlinedAt: !1156)
!1227 = !DILocation(line: 228, column: 3, scope: !1194, inlinedAt: !1156)
!1228 = distinct !{!1228, !1153, !1229, !255}
!1229 = !DILocation(line: 229, column: 27, scope: !1154, inlinedAt: !1156)
!1230 = !DILocation(line: 142, scope: !1196, inlinedAt: !1200)
!1231 = !DILocalVariable(name: "i", scope: !1197, file: !933, line: 141, type: !40)
!1232 = !DILocation(line: 0, scope: !1197, inlinedAt: !1200)
!1233 = !DILocation(line: 142, column: 12, scope: !1234, inlinedAt: !1200)
!1234 = distinct !DILexicalBlock(scope: !1196, file: !933, line: 142, column: 3)
!1235 = !DILocation(line: 142, column: 3, scope: !1196, inlinedAt: !1236)
!1236 = distinct !DILocation(line: 27, column: 3, scope: !1237, inlinedAt: !1240)
!1237 = distinct !DISubprogram(name: "pack_pk", scope: !473, file: !473, line: 23, type: !1238, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{null, !32, !476, !157}
!1240 = distinct !DILocation(line: 240, column: 3, scope: !757)
!1241 = !DILocation(line: 143, column: 21, scope: !1234, inlinedAt: !1200)
!1242 = !DILocation(line: 143, column: 19, scope: !1234, inlinedAt: !1200)
!1243 = !DILocation(line: 143, column: 40, scope: !1234, inlinedAt: !1200)
!1244 = !DILocation(line: 143, column: 5, scope: !1234, inlinedAt: !1200)
!1245 = !DILocation(line: 142, column: 22, scope: !1234, inlinedAt: !1200)
!1246 = !DILocation(line: 142, column: 3, scope: !1234, inlinedAt: !1200)
!1247 = distinct !{!1247, !1195, !1248, !255}
!1248 = !DILocation(line: 143, column: 49, scope: !1196, inlinedAt: !1200)
!1249 = !DILocation(line: 142, scope: !1196, inlinedAt: !1236)
!1250 = !DILocation(line: 0, scope: !1197, inlinedAt: !1236)
!1251 = !DILocation(line: 142, column: 12, scope: !1234, inlinedAt: !1236)
!1252 = !DILocation(line: 143, column: 21, scope: !1234, inlinedAt: !1236)
!1253 = !DILocation(line: 143, column: 19, scope: !1234, inlinedAt: !1236)
!1254 = !DILocation(line: 143, column: 40, scope: !1234, inlinedAt: !1236)
!1255 = !DILocation(line: 143, column: 5, scope: !1234, inlinedAt: !1236)
!1256 = !DILocation(line: 142, column: 22, scope: !1234, inlinedAt: !1236)
!1257 = !DILocation(line: 142, column: 3, scope: !1234, inlinedAt: !1236)
!1258 = distinct !{!1258, !1235, !1259, !255}
!1259 = !DILocation(line: 143, column: 49, scope: !1196, inlinedAt: !1236)
!1260 = !DILocation(line: 28, column: 11, scope: !1237, inlinedAt: !1240)
!1261 = !DILocation(line: 28, column: 3, scope: !1237, inlinedAt: !1240)
!1262 = !DILocation(line: 241, column: 1, scope: !757)
!1263 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !473, file: !473, line: 260, type: !1264, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{null, !32, !157, !157, !157}
!1266 = !DILocalVariable(name: "c", arg: 1, scope: !1263, file: !473, line: 260, type: !32)
!1267 = !DILocation(line: 0, scope: !1263)
!1268 = !DILocalVariable(name: "m", arg: 2, scope: !1263, file: !473, line: 261, type: !157)
!1269 = !DILocalVariable(name: "pk", arg: 3, scope: !1263, file: !473, line: 262, type: !157)
!1270 = !DILocalVariable(name: "coins", arg: 4, scope: !1263, file: !473, line: 263, type: !157)
!1271 = !DILocalVariable(name: "seed", scope: !1263, file: !473, line: 266, type: !139)
!1272 = !DILocation(line: 266, column: 11, scope: !1263)
!1273 = !DILocalVariable(name: "nonce", scope: !1263, file: !473, line: 267, type: !33)
!1274 = !DILocalVariable(name: "sp", scope: !1263, file: !473, line: 268, type: !477)
!1275 = !DILocation(line: 268, column: 11, scope: !1263)
!1276 = !DILocalVariable(name: "pkpv", scope: !1263, file: !473, line: 268, type: !477)
!1277 = !DILocation(line: 268, column: 15, scope: !1263)
!1278 = !DILocalVariable(name: "ep", scope: !1263, file: !473, line: 268, type: !477)
!1279 = !DILocation(line: 268, column: 21, scope: !1263)
!1280 = !DILocalVariable(name: "at", scope: !1263, file: !473, line: 268, type: !771)
!1281 = !DILocation(line: 268, column: 25, scope: !1263)
!1282 = !DILocalVariable(name: "b", scope: !1263, file: !473, line: 268, type: !477)
!1283 = !DILocation(line: 268, column: 38, scope: !1263)
!1284 = !DILocalVariable(name: "v", scope: !1263, file: !473, line: 269, type: !483)
!1285 = !DILocation(line: 269, column: 8, scope: !1263)
!1286 = !DILocalVariable(name: "k", scope: !1263, file: !473, line: 269, type: !483)
!1287 = !DILocation(line: 269, column: 11, scope: !1263)
!1288 = !DILocalVariable(name: "epp", scope: !1263, file: !473, line: 269, type: !483)
!1289 = !DILocation(line: 269, column: 14, scope: !1263)
!1290 = !DILocalVariable(name: "pk", arg: 1, scope: !1291, file: !473, line: 41, type: !476)
!1291 = distinct !DISubprogram(name: "unpack_pk", scope: !473, file: !473, line: 41, type: !1292, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1292 = !DISubroutineType(types: !1293)
!1293 = !{null, !476, !32, !157}
!1294 = !DILocation(line: 0, scope: !1291, inlinedAt: !1295)
!1295 = distinct !DILocation(line: 271, column: 3, scope: !1263)
!1296 = !DILocalVariable(name: "seed", arg: 2, scope: !1291, file: !473, line: 42, type: !32)
!1297 = !DILocalVariable(name: "packedpk", arg: 3, scope: !1291, file: !473, line: 43, type: !157)
!1298 = !DILocalVariable(name: "r", arg: 1, scope: !1299, file: !933, line: 156, type: !937)
!1299 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !933, file: !933, line: 156, type: !1300, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{null, !937, !157}
!1302 = !DILocation(line: 0, scope: !1299, inlinedAt: !1303)
!1303 = distinct !DILocation(line: 45, column: 3, scope: !1291, inlinedAt: !1295)
!1304 = !DILocalVariable(name: "a", arg: 2, scope: !1299, file: !933, line: 156, type: !157)
!1305 = !DILocalVariable(name: "i", scope: !1299, file: !933, line: 158, type: !40)
!1306 = !DILocation(line: 159, column: 7, scope: !1307, inlinedAt: !1303)
!1307 = distinct !DILexicalBlock(scope: !1299, file: !933, line: 159, column: 3)
!1308 = !DILocation(line: 159, scope: !1307, inlinedAt: !1303)
!1309 = !DILocation(line: 159, column: 12, scope: !1310, inlinedAt: !1303)
!1310 = distinct !DILexicalBlock(scope: !1307, file: !933, line: 159, column: 3)
!1311 = !DILocation(line: 159, column: 3, scope: !1307, inlinedAt: !1303)
!1312 = !DILocation(line: 160, column: 21, scope: !1310, inlinedAt: !1303)
!1313 = !DILocation(line: 160, column: 35, scope: !1310, inlinedAt: !1303)
!1314 = !DILocation(line: 160, column: 33, scope: !1310, inlinedAt: !1303)
!1315 = !DILocation(line: 160, column: 5, scope: !1310, inlinedAt: !1303)
!1316 = !DILocation(line: 159, column: 22, scope: !1310, inlinedAt: !1303)
!1317 = !DILocation(line: 159, column: 3, scope: !1310, inlinedAt: !1303)
!1318 = distinct !{!1318, !1311, !1319, !255}
!1319 = !DILocation(line: 160, column: 51, scope: !1307, inlinedAt: !1303)
!1320 = !DILocation(line: 46, column: 24, scope: !1291, inlinedAt: !1295)
!1321 = !DILocation(line: 46, column: 3, scope: !1291, inlinedAt: !1295)
!1322 = !DILocalVariable(name: "r", arg: 1, scope: !1323, file: !795, line: 168, type: !798)
!1323 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !795, file: !795, line: 168, type: !1324, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{null, !798, !157}
!1326 = !DILocation(line: 0, scope: !1323, inlinedAt: !1327)
!1327 = distinct !DILocation(line: 272, column: 3, scope: !1263)
!1328 = !DILocalVariable(name: "msg", arg: 2, scope: !1323, file: !795, line: 168, type: !157)
!1329 = !DILocalVariable(name: "i", scope: !1323, file: !795, line: 170, type: !40)
!1330 = !DILocation(line: 176, column: 7, scope: !1331, inlinedAt: !1327)
!1331 = distinct !DILexicalBlock(scope: !1323, file: !795, line: 176, column: 3)
!1332 = !DILocation(line: 176, scope: !1331, inlinedAt: !1327)
!1333 = !DILocation(line: 176, column: 12, scope: !1334, inlinedAt: !1327)
!1334 = distinct !DILexicalBlock(scope: !1331, file: !795, line: 176, column: 3)
!1335 = !DILocation(line: 176, column: 3, scope: !1331, inlinedAt: !1327)
!1336 = !DILocation(line: 177, column: 5, scope: !1337, inlinedAt: !1327)
!1337 = distinct !DILexicalBlock(scope: !1338, file: !795, line: 177, column: 5)
!1338 = distinct !DILexicalBlock(scope: !1334, file: !795, line: 176, column: 28)
!1339 = !DILocation(line: 177, scope: !1337, inlinedAt: !1327)
!1340 = !DILocalVariable(name: "j", scope: !1323, file: !795, line: 170, type: !40)
!1341 = !DILocation(line: 177, column: 14, scope: !1342, inlinedAt: !1327)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !795, line: 177, column: 5)
!1343 = !DILocation(line: 178, column: 18, scope: !1344, inlinedAt: !1327)
!1344 = distinct !DILexicalBlock(scope: !1342, file: !795, line: 177, column: 22)
!1345 = !DILocation(line: 178, column: 20, scope: !1344, inlinedAt: !1327)
!1346 = !DILocation(line: 178, column: 7, scope: !1344, inlinedAt: !1327)
!1347 = !DILocation(line: 178, column: 24, scope: !1344, inlinedAt: !1327)
!1348 = !DILocation(line: 179, column: 27, scope: !1344, inlinedAt: !1327)
!1349 = !DILocation(line: 179, column: 31, scope: !1344, inlinedAt: !1327)
!1350 = !DILocation(line: 179, column: 53, scope: !1344, inlinedAt: !1327)
!1351 = !DILocalVariable(name: "r", arg: 1, scope: !1352, file: !415, line: 71, type: !716)
!1352 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !415, file: !415, line: 71, type: !1353, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{null, !716, !61, !86}
!1355 = !DILocation(line: 0, scope: !1352, inlinedAt: !1356)
!1356 = distinct !DILocation(line: 179, column: 7, scope: !1344, inlinedAt: !1327)
!1357 = !DILocalVariable(name: "v", arg: 2, scope: !1352, file: !415, line: 71, type: !61)
!1358 = !DILocalVariable(name: "b", arg: 3, scope: !1352, file: !415, line: 71, type: !86)
!1359 = !DILocation(line: 74, column: 15, scope: !1352, inlinedAt: !1356)
!1360 = !DILocation(line: 74, column: 11, scope: !1352, inlinedAt: !1356)
!1361 = !DILocation(line: 74, column: 6, scope: !1352, inlinedAt: !1356)
!1362 = !DILocation(line: 177, column: 18, scope: !1342, inlinedAt: !1327)
!1363 = !DILocation(line: 177, column: 5, scope: !1342, inlinedAt: !1327)
!1364 = distinct !{!1364, !1336, !1365, !255}
!1365 = !DILocation(line: 180, column: 5, scope: !1337, inlinedAt: !1327)
!1366 = !DILocation(line: 176, column: 24, scope: !1334, inlinedAt: !1327)
!1367 = !DILocation(line: 176, column: 3, scope: !1334, inlinedAt: !1327)
!1368 = distinct !{!1368, !1335, !1369, !255}
!1369 = !DILocation(line: 181, column: 3, scope: !1331, inlinedAt: !1327)
!1370 = !DILocation(line: 273, column: 3, scope: !1263)
!1371 = !DILocalVariable(name: "i", scope: !1263, file: !473, line: 265, type: !40)
!1372 = !DILocation(line: 275, column: 7, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1263, file: !473, line: 275, column: 3)
!1374 = !DILocation(line: 275, scope: !1373)
!1375 = !DILocation(line: 275, column: 12, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1373, file: !473, line: 275, column: 3)
!1377 = !DILocation(line: 275, column: 3, scope: !1373)
!1378 = !DILocation(line: 277, column: 3, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1263, file: !473, line: 277, column: 3)
!1380 = !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !1381)
!1381 = distinct !DILocation(line: 276, column: 5, scope: !1376)
!1382 = !DILocation(line: 0, scope: !794, inlinedAt: !1381)
!1383 = !DILocation(line: 227, column: 11, scope: !794, inlinedAt: !1381)
!1384 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !1385)
!1385 = distinct !DILocation(line: 228, column: 3, scope: !794, inlinedAt: !1381)
!1386 = !DILocation(line: 0, scope: !812, inlinedAt: !1385)
!1387 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !1385)
!1388 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !1385)
!1389 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !1385)
!1390 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !1391)
!1391 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !1392)
!1392 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !1385)
!1393 = !DILocation(line: 0, scope: !831, inlinedAt: !1392)
!1394 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !1392)
!1395 = !DILocation(line: 0, scope: !829, inlinedAt: !1391)
!1396 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !1391)
!1397 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !1391)
!1398 = !DILocation(line: 0, scope: !850, inlinedAt: !1399)
!1399 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !1392)
!1400 = !DILocation(line: 0, scope: !601, inlinedAt: !1401)
!1401 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !1399)
!1402 = !DILocation(line: 0, scope: !858, inlinedAt: !1403)
!1403 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !1392)
!1404 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !1403)
!1405 = !DILocation(line: 0, scope: !865, inlinedAt: !1406)
!1406 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !1403)
!1407 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !1406)
!1408 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !1406)
!1409 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !1406)
!1410 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !1406)
!1411 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !1406)
!1412 = !DILocation(line: 439, scope: !883, inlinedAt: !1406)
!1413 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !1406)
!1414 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !1406)
!1415 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !1406)
!1416 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !1406)
!1417 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !1406)
!1418 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !1406)
!1419 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !1406)
!1420 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !1406)
!1421 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !1406)
!1422 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !1406)
!1423 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1406)
!1424 = distinct !{!1424, !1415, !1425, !255}
!1425 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !1406)
!1426 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !1406)
!1427 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !1406)
!1428 = distinct !{!1428, !1407, !1429, !255}
!1429 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !1406)
!1430 = !DILocation(line: 276, column: 30, scope: !1376)
!1431 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !1403)
!1432 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !1403)
!1433 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !1392)
!1434 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !1385)
!1435 = !DILocation(line: 0, scope: !909, inlinedAt: !1436)
!1436 = distinct !DILocation(line: 229, column: 3, scope: !794, inlinedAt: !1381)
!1437 = !DILocation(line: 113, column: 3, scope: !909, inlinedAt: !1436)
!1438 = !DILocation(line: 230, column: 1, scope: !794, inlinedAt: !1381)
!1439 = !DILocation(line: 276, column: 46, scope: !1376)
!1440 = !DILocation(line: 275, column: 22, scope: !1376)
!1441 = !DILocation(line: 275, column: 3, scope: !1376)
!1442 = distinct !{!1442, !1377, !1443, !255}
!1443 = !DILocation(line: 276, column: 48, scope: !1373)
!1444 = !DILocation(line: 277, scope: !1379)
!1445 = !DILocation(line: 277, column: 12, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1379, file: !473, line: 277, column: 3)
!1447 = !DILocation(line: 247, column: 3, scope: !1448, inlinedAt: !1449)
!1448 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !795, file: !795, line: 244, type: !796, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1449 = distinct !DILocation(line: 278, column: 5, scope: !1446)
!1450 = !DILocalVariable(name: "r", arg: 1, scope: !1448, file: !795, line: 244, type: !798)
!1451 = !DILocation(line: 0, scope: !1448, inlinedAt: !1449)
!1452 = !DILocalVariable(name: "seed", arg: 2, scope: !1448, file: !795, line: 244, type: !157)
!1453 = !DILocalVariable(name: "nonce", arg: 3, scope: !1448, file: !795, line: 244, type: !33)
!1454 = !DILocalVariable(name: "buf", scope: !1448, file: !795, line: 246, type: !809)
!1455 = !DILocation(line: 246, column: 11, scope: !1448, inlinedAt: !1449)
!1456 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !1457)
!1457 = distinct !DILocation(line: 247, column: 3, scope: !1448, inlinedAt: !1449)
!1458 = !DILocation(line: 0, scope: !812, inlinedAt: !1457)
!1459 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !1457)
!1460 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !1457)
!1461 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !1457)
!1462 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !1463)
!1463 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !1464)
!1464 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !1457)
!1465 = !DILocation(line: 0, scope: !831, inlinedAt: !1464)
!1466 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !1464)
!1467 = !DILocation(line: 0, scope: !829, inlinedAt: !1463)
!1468 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !1463)
!1469 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !1463)
!1470 = !DILocation(line: 0, scope: !850, inlinedAt: !1471)
!1471 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !1464)
!1472 = !DILocation(line: 0, scope: !601, inlinedAt: !1473)
!1473 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !1471)
!1474 = !DILocation(line: 0, scope: !858, inlinedAt: !1475)
!1475 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !1464)
!1476 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !1475)
!1477 = !DILocation(line: 0, scope: !865, inlinedAt: !1478)
!1478 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !1475)
!1479 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !1478)
!1480 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !1478)
!1481 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !1478)
!1482 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !1478)
!1483 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !1478)
!1484 = !DILocation(line: 439, scope: !883, inlinedAt: !1478)
!1485 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !1478)
!1486 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !1478)
!1487 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !1478)
!1488 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !1478)
!1489 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !1478)
!1490 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !1478)
!1491 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !1478)
!1492 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !1478)
!1493 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !1478)
!1494 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !1478)
!1495 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1478)
!1496 = distinct !{!1496, !1487, !1497, !255}
!1497 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !1478)
!1498 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !1478)
!1499 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !1478)
!1500 = distinct !{!1500, !1479, !1501, !255}
!1501 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !1478)
!1502 = !DILocation(line: 278, column: 30, scope: !1446)
!1503 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !1475)
!1504 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !1475)
!1505 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !1464)
!1506 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !1457)
!1507 = !DILocalVariable(name: "r", arg: 1, scope: !1508, file: !910, line: 121, type: !913)
!1508 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !910, file: !910, line: 121, type: !911, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1509 = !DILocation(line: 0, scope: !1508, inlinedAt: !1510)
!1510 = distinct !DILocation(line: 248, column: 3, scope: !1448, inlinedAt: !1449)
!1511 = !DILocalVariable(name: "buf", arg: 2, scope: !1508, file: !910, line: 121, type: !157)
!1512 = !DILocation(line: 124, column: 3, scope: !1508, inlinedAt: !1510)
!1513 = !DILocation(line: 249, column: 1, scope: !1448, inlinedAt: !1449)
!1514 = !DILocation(line: 278, column: 46, scope: !1446)
!1515 = !DILocation(line: 277, column: 22, scope: !1446)
!1516 = !DILocation(line: 277, column: 3, scope: !1446)
!1517 = distinct !{!1517, !1378, !1518, !255}
!1518 = !DILocation(line: 278, column: 48, scope: !1379)
!1519 = !DILocation(line: 247, column: 3, scope: !1448, inlinedAt: !1520)
!1520 = distinct !DILocation(line: 279, column: 3, scope: !1263)
!1521 = !DILocation(line: 0, scope: !1448, inlinedAt: !1520)
!1522 = !DILocation(line: 246, column: 11, scope: !1448, inlinedAt: !1520)
!1523 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !1524)
!1524 = distinct !DILocation(line: 247, column: 3, scope: !1448, inlinedAt: !1520)
!1525 = !DILocation(line: 0, scope: !812, inlinedAt: !1524)
!1526 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !1524)
!1527 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !1524)
!1528 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !1524)
!1529 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !1530)
!1530 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !1531)
!1531 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !1524)
!1532 = !DILocation(line: 0, scope: !831, inlinedAt: !1531)
!1533 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !1531)
!1534 = !DILocation(line: 0, scope: !829, inlinedAt: !1530)
!1535 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !1530)
!1536 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !1530)
!1537 = !DILocation(line: 0, scope: !850, inlinedAt: !1538)
!1538 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !1531)
!1539 = !DILocation(line: 0, scope: !601, inlinedAt: !1540)
!1540 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !1538)
!1541 = !DILocation(line: 0, scope: !858, inlinedAt: !1542)
!1542 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !1531)
!1543 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !1542)
!1544 = !DILocation(line: 0, scope: !865, inlinedAt: !1545)
!1545 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !1542)
!1546 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !1545)
!1547 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !1545)
!1548 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !1545)
!1549 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !1545)
!1550 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !1545)
!1551 = !DILocation(line: 439, scope: !883, inlinedAt: !1545)
!1552 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !1545)
!1553 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !1545)
!1554 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !1545)
!1555 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !1545)
!1556 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !1545)
!1557 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !1545)
!1558 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !1545)
!1559 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !1545)
!1560 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !1545)
!1561 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !1545)
!1562 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !1545)
!1563 = distinct !{!1563, !1554, !1564, !255}
!1564 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !1545)
!1565 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !1545)
!1566 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !1545)
!1567 = distinct !{!1567, !1546, !1568, !255}
!1568 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !1545)
!1569 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !1542)
!1570 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !1542)
!1571 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !1531)
!1572 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !1524)
!1573 = !DILocation(line: 0, scope: !1508, inlinedAt: !1574)
!1574 = distinct !DILocation(line: 248, column: 3, scope: !1448, inlinedAt: !1520)
!1575 = !DILocation(line: 124, column: 3, scope: !1508, inlinedAt: !1574)
!1576 = !DILocation(line: 249, column: 1, scope: !1448, inlinedAt: !1520)
!1577 = !DILocalVariable(name: "r", arg: 1, scope: !934, file: !933, line: 170, type: !937)
!1578 = !DILocation(line: 0, scope: !934, inlinedAt: !1579)
!1579 = distinct !DILocation(line: 281, column: 3, scope: !1263)
!1580 = !DILocation(line: 173, column: 7, scope: !932, inlinedAt: !1579)
!1581 = !DILocation(line: 173, scope: !932, inlinedAt: !1579)
!1582 = !DILocation(line: 173, column: 12, scope: !1016, inlinedAt: !1579)
!1583 = !DILocation(line: 173, column: 3, scope: !932, inlinedAt: !1579)
!1584 = !DILocation(line: 284, column: 3, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1263, file: !473, line: 284, column: 3)
!1586 = !DILocation(line: 174, column: 15, scope: !1016, inlinedAt: !1579)
!1587 = !DILocation(line: 0, scope: !1021, inlinedAt: !1588)
!1588 = distinct !DILocation(line: 174, column: 5, scope: !1016, inlinedAt: !1579)
!1589 = !DILocation(line: 263, column: 3, scope: !1021, inlinedAt: !1588)
!1590 = !DILocation(line: 0, scope: !1028, inlinedAt: !1591)
!1591 = distinct !DILocation(line: 264, column: 3, scope: !1021, inlinedAt: !1588)
!1592 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1591)
!1593 = !DILocation(line: 326, scope: !1033, inlinedAt: !1591)
!1594 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1591)
!1595 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1591)
!1596 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1591)
!1597 = !DILocation(line: 0, scope: !1040, inlinedAt: !1598)
!1598 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1591)
!1599 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1598)
!1600 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1598)
!1601 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1598)
!1602 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1598)
!1603 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1598)
!1604 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1591)
!1605 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1591)
!1606 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1591)
!1607 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1591)
!1608 = distinct !{!1608, !1595, !1609, !255}
!1609 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1591)
!1610 = !DILocation(line: 173, column: 22, scope: !1016, inlinedAt: !1579)
!1611 = !DILocation(line: 173, column: 3, scope: !1016, inlinedAt: !1579)
!1612 = distinct !{!1612, !1583, !1613, !255}
!1613 = !DILocation(line: 174, column: 24, scope: !932, inlinedAt: !1579)
!1614 = !DILocation(line: 284, scope: !1585)
!1615 = !DILocation(line: 284, column: 12, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1585, file: !473, line: 284, column: 3)
!1617 = !DILocation(line: 285, column: 37, scope: !1616)
!1618 = !DILocation(line: 285, column: 48, scope: !1616)
!1619 = !DILocation(line: 285, column: 5, scope: !1616)
!1620 = !DILocation(line: 284, column: 22, scope: !1616)
!1621 = !DILocation(line: 284, column: 3, scope: !1616)
!1622 = distinct !{!1622, !1584, !1623, !255}
!1623 = !DILocation(line: 285, column: 58, scope: !1585)
!1624 = !DILocation(line: 287, column: 3, scope: !1263)
!1625 = !DILocalVariable(name: "r", arg: 1, scope: !1626, file: !933, line: 185, type: !937)
!1626 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !933, file: !933, line: 185, type: !935, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1627 = !DILocation(line: 0, scope: !1626, inlinedAt: !1628)
!1628 = distinct !DILocation(line: 289, column: 3, scope: !1263)
!1629 = !DILocalVariable(name: "i", scope: !1626, file: !933, line: 187, type: !40)
!1630 = !DILocation(line: 188, column: 7, scope: !1631, inlinedAt: !1628)
!1631 = distinct !DILexicalBlock(scope: !1626, file: !933, line: 188, column: 3)
!1632 = !DILocation(line: 188, scope: !1631, inlinedAt: !1628)
!1633 = !DILocation(line: 188, column: 12, scope: !1634, inlinedAt: !1628)
!1634 = distinct !DILexicalBlock(scope: !1631, file: !933, line: 188, column: 3)
!1635 = !DILocation(line: 188, column: 3, scope: !1631, inlinedAt: !1628)
!1636 = !DILocation(line: 189, column: 25, scope: !1634, inlinedAt: !1628)
!1637 = !DILocalVariable(name: "r", arg: 1, scope: !1638, file: !795, line: 276, type: !798)
!1638 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !795, file: !795, line: 276, type: !1022, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1639 = !DILocation(line: 0, scope: !1638, inlinedAt: !1640)
!1640 = distinct !DILocation(line: 189, column: 5, scope: !1634, inlinedAt: !1628)
!1641 = !DILocation(line: 278, column: 3, scope: !1638, inlinedAt: !1640)
!1642 = !DILocation(line: 188, column: 22, scope: !1634, inlinedAt: !1628)
!1643 = !DILocation(line: 188, column: 3, scope: !1634, inlinedAt: !1628)
!1644 = distinct !{!1644, !1635, !1645, !255}
!1645 = !DILocation(line: 189, column: 34, scope: !1631, inlinedAt: !1628)
!1646 = !DILocation(line: 0, scope: !1638, inlinedAt: !1647)
!1647 = distinct !DILocation(line: 290, column: 3, scope: !1263)
!1648 = !DILocation(line: 278, column: 3, scope: !1638, inlinedAt: !1647)
!1649 = !DILocalVariable(name: "r", arg: 1, scope: !1101, file: !933, line: 241, type: !937)
!1650 = !DILocation(line: 0, scope: !1101, inlinedAt: !1651)
!1651 = distinct !DILocation(line: 292, column: 3, scope: !1263)
!1652 = !DILocalVariable(name: "a", arg: 2, scope: !1101, file: !933, line: 241, type: !1104)
!1653 = !DILocalVariable(name: "b", arg: 3, scope: !1101, file: !933, line: 241, type: !1104)
!1654 = !DILocation(line: 244, column: 7, scope: !1100, inlinedAt: !1651)
!1655 = !DILocation(line: 244, scope: !1100, inlinedAt: !1651)
!1656 = !DILocation(line: 244, column: 12, scope: !1152, inlinedAt: !1651)
!1657 = !DILocation(line: 244, column: 3, scope: !1100, inlinedAt: !1651)
!1658 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !1659)
!1659 = distinct !DILocation(line: 293, column: 3, scope: !1263)
!1660 = !DILocation(line: 245, column: 15, scope: !1152, inlinedAt: !1651)
!1661 = !DILocation(line: 245, column: 27, scope: !1152, inlinedAt: !1651)
!1662 = !DILocation(line: 245, column: 39, scope: !1152, inlinedAt: !1651)
!1663 = !DILocation(line: 0, scope: !1161, inlinedAt: !1664)
!1664 = distinct !DILocation(line: 245, column: 5, scope: !1152, inlinedAt: !1651)
!1665 = !DILocation(line: 342, column: 7, scope: !1172, inlinedAt: !1664)
!1666 = !DILocation(line: 342, scope: !1172, inlinedAt: !1664)
!1667 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !1664)
!1668 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !1664)
!1669 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !1664)
!1670 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !1664)
!1671 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !1664)
!1672 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !1664)
!1673 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !1664)
!1674 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !1664)
!1675 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1664)
!1676 = distinct !{!1676, !1668, !1677, !255}
!1677 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !1664)
!1678 = !DILocation(line: 244, column: 22, scope: !1152, inlinedAt: !1651)
!1679 = !DILocation(line: 244, column: 3, scope: !1152, inlinedAt: !1651)
!1680 = distinct !{!1680, !1657, !1681, !255}
!1681 = !DILocation(line: 245, column: 48, scope: !1100, inlinedAt: !1651)
!1682 = !DILocation(line: 342, scope: !1172, inlinedAt: !1659)
!1683 = !DILocation(line: 0, scope: !1161, inlinedAt: !1659)
!1684 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !1659)
!1685 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !1686)
!1686 = distinct !DILocation(line: 294, column: 3, scope: !1263)
!1687 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !1659)
!1688 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !1659)
!1689 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !1659)
!1690 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !1659)
!1691 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !1659)
!1692 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !1659)
!1693 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1659)
!1694 = distinct !{!1694, !1658, !1695, !255}
!1695 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !1659)
!1696 = !DILocation(line: 342, scope: !1172, inlinedAt: !1686)
!1697 = !DILocation(line: 0, scope: !1161, inlinedAt: !1686)
!1698 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !1686)
!1699 = !DILocation(line: 228, column: 3, scope: !1154, inlinedAt: !1700)
!1700 = distinct !DILocation(line: 295, column: 3, scope: !1263)
!1701 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !1686)
!1702 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !1686)
!1703 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !1686)
!1704 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !1686)
!1705 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !1686)
!1706 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !1686)
!1707 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !1686)
!1708 = distinct !{!1708, !1685, !1709, !255}
!1709 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !1686)
!1710 = !DILocation(line: 228, scope: !1154, inlinedAt: !1700)
!1711 = !DILocation(line: 0, scope: !1155, inlinedAt: !1700)
!1712 = !DILocation(line: 228, column: 12, scope: !1194, inlinedAt: !1700)
!1713 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1714)
!1714 = distinct !DILocation(line: 296, column: 3, scope: !1263)
!1715 = !DILocation(line: 229, column: 18, scope: !1194, inlinedAt: !1700)
!1716 = !DILocation(line: 0, scope: !1028, inlinedAt: !1717)
!1717 = distinct !DILocation(line: 229, column: 5, scope: !1194, inlinedAt: !1700)
!1718 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1717)
!1719 = !DILocation(line: 326, scope: !1033, inlinedAt: !1717)
!1720 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1717)
!1721 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1717)
!1722 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1717)
!1723 = !DILocation(line: 0, scope: !1040, inlinedAt: !1724)
!1724 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1717)
!1725 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1724)
!1726 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1724)
!1727 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1724)
!1728 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1724)
!1729 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1724)
!1730 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1717)
!1731 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1717)
!1732 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1717)
!1733 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1717)
!1734 = distinct !{!1734, !1721, !1735, !255}
!1735 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1717)
!1736 = !DILocation(line: 228, column: 22, scope: !1194, inlinedAt: !1700)
!1737 = !DILocation(line: 228, column: 3, scope: !1194, inlinedAt: !1700)
!1738 = distinct !{!1738, !1699, !1739, !255}
!1739 = !DILocation(line: 229, column: 27, scope: !1154, inlinedAt: !1700)
!1740 = !DILocation(line: 326, scope: !1033, inlinedAt: !1714)
!1741 = !DILocation(line: 0, scope: !1028, inlinedAt: !1714)
!1742 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1714)
!1743 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1714)
!1744 = !DILocation(line: 0, scope: !1040, inlinedAt: !1745)
!1745 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1714)
!1746 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1745)
!1747 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1745)
!1748 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1745)
!1749 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1745)
!1750 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1745)
!1751 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1714)
!1752 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1714)
!1753 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1714)
!1754 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1714)
!1755 = distinct !{!1755, !1713, !1756, !255}
!1756 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1714)
!1757 = !DILocalVariable(name: "r", arg: 1, scope: !1758, file: !473, line: 86, type: !32)
!1758 = distinct !DISubprogram(name: "pack_ciphertext", scope: !473, file: !473, line: 86, type: !1759, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1759 = !DISubroutineType(types: !1760)
!1760 = !{null, !32, !476, !1761}
!1761 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 32)
!1762 = !DILocation(line: 0, scope: !1758, inlinedAt: !1763)
!1763 = distinct !DILocation(line: 298, column: 3, scope: !1263)
!1764 = !DILocalVariable(name: "b", arg: 2, scope: !1758, file: !473, line: 86, type: !476)
!1765 = !DILocalVariable(name: "v", arg: 3, scope: !1758, file: !473, line: 86, type: !1761)
!1766 = !DILocation(line: 88, column: 3, scope: !1758, inlinedAt: !1763)
!1767 = !DILocation(line: 89, column: 18, scope: !1758, inlinedAt: !1763)
!1768 = !DILocation(line: 89, column: 3, scope: !1758, inlinedAt: !1763)
!1769 = !DILocation(line: 299, column: 1, scope: !1263)
!1770 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !473, file: !473, line: 314, type: !1771, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1771 = !DISubroutineType(types: !1772)
!1772 = !{null, !32, !157, !157}
!1773 = !DILocalVariable(name: "m", arg: 1, scope: !1770, file: !473, line: 314, type: !32)
!1774 = !DILocation(line: 0, scope: !1770)
!1775 = !DILocalVariable(name: "c", arg: 2, scope: !1770, file: !473, line: 315, type: !157)
!1776 = !DILocalVariable(name: "sk", arg: 3, scope: !1770, file: !473, line: 316, type: !157)
!1777 = !DILocalVariable(name: "b", scope: !1770, file: !473, line: 318, type: !477)
!1778 = !DILocation(line: 318, column: 11, scope: !1770)
!1779 = !DILocalVariable(name: "skpv", scope: !1770, file: !473, line: 318, type: !477)
!1780 = !DILocation(line: 318, column: 14, scope: !1770)
!1781 = !DILocalVariable(name: "v", scope: !1770, file: !473, line: 319, type: !483)
!1782 = !DILocation(line: 319, column: 8, scope: !1770)
!1783 = !DILocalVariable(name: "mp", scope: !1770, file: !473, line: 319, type: !483)
!1784 = !DILocation(line: 319, column: 11, scope: !1770)
!1785 = !DILocalVariable(name: "b", arg: 1, scope: !1786, file: !473, line: 102, type: !476)
!1786 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !473, file: !473, line: 102, type: !1787, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{null, !476, !1761, !157}
!1789 = !DILocation(line: 0, scope: !1786, inlinedAt: !1790)
!1790 = distinct !DILocation(line: 321, column: 3, scope: !1770)
!1791 = !DILocalVariable(name: "v", arg: 2, scope: !1786, file: !473, line: 102, type: !1761)
!1792 = !DILocalVariable(name: "c", arg: 3, scope: !1786, file: !473, line: 102, type: !157)
!1793 = !DILocation(line: 104, column: 3, scope: !1786, inlinedAt: !1790)
!1794 = !DILocation(line: 105, column: 23, scope: !1786, inlinedAt: !1790)
!1795 = !DILocation(line: 105, column: 3, scope: !1786, inlinedAt: !1790)
!1796 = !DILocalVariable(name: "sk", arg: 1, scope: !1797, file: !473, line: 70, type: !476)
!1797 = distinct !DISubprogram(name: "unpack_sk", scope: !473, file: !473, line: 70, type: !1798, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!1798 = !DISubroutineType(types: !1799)
!1799 = !{null, !476, !157}
!1800 = !DILocation(line: 0, scope: !1797, inlinedAt: !1801)
!1801 = distinct !DILocation(line: 322, column: 3, scope: !1770)
!1802 = !DILocalVariable(name: "packedsk", arg: 2, scope: !1797, file: !473, line: 70, type: !157)
!1803 = !DILocation(line: 0, scope: !1299, inlinedAt: !1804)
!1804 = distinct !DILocation(line: 72, column: 3, scope: !1797, inlinedAt: !1801)
!1805 = !DILocation(line: 159, column: 7, scope: !1307, inlinedAt: !1804)
!1806 = !DILocation(line: 159, scope: !1307, inlinedAt: !1804)
!1807 = !DILocation(line: 159, column: 12, scope: !1310, inlinedAt: !1804)
!1808 = !DILocation(line: 159, column: 3, scope: !1307, inlinedAt: !1804)
!1809 = !DILocation(line: 173, column: 3, scope: !932, inlinedAt: !1810)
!1810 = distinct !DILocation(line: 324, column: 3, scope: !1770)
!1811 = !DILocation(line: 160, column: 21, scope: !1310, inlinedAt: !1804)
!1812 = !DILocation(line: 160, column: 35, scope: !1310, inlinedAt: !1804)
!1813 = !DILocation(line: 160, column: 33, scope: !1310, inlinedAt: !1804)
!1814 = !DILocation(line: 160, column: 5, scope: !1310, inlinedAt: !1804)
!1815 = !DILocation(line: 159, column: 22, scope: !1310, inlinedAt: !1804)
!1816 = !DILocation(line: 159, column: 3, scope: !1310, inlinedAt: !1804)
!1817 = distinct !{!1817, !1808, !1818, !255}
!1818 = !DILocation(line: 160, column: 51, scope: !1307, inlinedAt: !1804)
!1819 = !DILocation(line: 173, scope: !932, inlinedAt: !1810)
!1820 = !DILocation(line: 0, scope: !934, inlinedAt: !1810)
!1821 = !DILocation(line: 173, column: 12, scope: !1016, inlinedAt: !1810)
!1822 = !DILocation(line: 174, column: 15, scope: !1016, inlinedAt: !1810)
!1823 = !DILocation(line: 0, scope: !1021, inlinedAt: !1824)
!1824 = distinct !DILocation(line: 174, column: 5, scope: !1016, inlinedAt: !1810)
!1825 = !DILocation(line: 263, column: 3, scope: !1021, inlinedAt: !1824)
!1826 = !DILocation(line: 0, scope: !1028, inlinedAt: !1827)
!1827 = distinct !DILocation(line: 264, column: 3, scope: !1021, inlinedAt: !1824)
!1828 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !1827)
!1829 = !DILocation(line: 326, scope: !1033, inlinedAt: !1827)
!1830 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1827)
!1831 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1827)
!1832 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1827)
!1833 = !DILocation(line: 0, scope: !1040, inlinedAt: !1834)
!1834 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1827)
!1835 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1834)
!1836 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1834)
!1837 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1834)
!1838 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1834)
!1839 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1834)
!1840 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1827)
!1841 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1827)
!1842 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1827)
!1843 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1827)
!1844 = distinct !{!1844, !1831, !1845, !255}
!1845 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1827)
!1846 = !DILocation(line: 173, column: 22, scope: !1016, inlinedAt: !1810)
!1847 = !DILocation(line: 173, column: 3, scope: !1016, inlinedAt: !1810)
!1848 = distinct !{!1848, !1809, !1849, !255}
!1849 = !DILocation(line: 174, column: 24, scope: !932, inlinedAt: !1810)
!1850 = !DILocation(line: 325, column: 3, scope: !1770)
!1851 = !DILocation(line: 0, scope: !1638, inlinedAt: !1852)
!1852 = distinct !DILocation(line: 326, column: 3, scope: !1770)
!1853 = !DILocation(line: 278, column: 3, scope: !1638, inlinedAt: !1852)
!1854 = !DILocalVariable(name: "r", arg: 1, scope: !1855, file: !795, line: 355, type: !798)
!1855 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !795, file: !795, line: 355, type: !1162, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1856 = !DILocation(line: 0, scope: !1855, inlinedAt: !1857)
!1857 = distinct !DILocation(line: 328, column: 3, scope: !1770)
!1858 = !DILocalVariable(name: "a", arg: 2, scope: !1855, file: !795, line: 355, type: !1164)
!1859 = !DILocalVariable(name: "b", arg: 3, scope: !1855, file: !795, line: 355, type: !1164)
!1860 = !DILocalVariable(name: "i", scope: !1855, file: !795, line: 357, type: !40)
!1861 = !DILocation(line: 358, column: 7, scope: !1862, inlinedAt: !1857)
!1862 = distinct !DILexicalBlock(scope: !1855, file: !795, line: 358, column: 3)
!1863 = !DILocation(line: 358, scope: !1862, inlinedAt: !1857)
!1864 = !DILocation(line: 358, column: 12, scope: !1865, inlinedAt: !1857)
!1865 = distinct !DILexicalBlock(scope: !1862, file: !795, line: 358, column: 3)
!1866 = !DILocation(line: 358, column: 3, scope: !1862, inlinedAt: !1857)
!1867 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !1868)
!1868 = distinct !DILocation(line: 329, column: 3, scope: !1770)
!1869 = !DILocation(line: 359, column: 20, scope: !1865, inlinedAt: !1857)
!1870 = !DILocation(line: 359, column: 35, scope: !1865, inlinedAt: !1857)
!1871 = !DILocation(line: 359, column: 33, scope: !1865, inlinedAt: !1857)
!1872 = !DILocation(line: 359, column: 5, scope: !1865, inlinedAt: !1857)
!1873 = !DILocation(line: 359, column: 18, scope: !1865, inlinedAt: !1857)
!1874 = !DILocation(line: 358, column: 22, scope: !1865, inlinedAt: !1857)
!1875 = !DILocation(line: 358, column: 3, scope: !1865, inlinedAt: !1857)
!1876 = distinct !{!1876, !1866, !1877, !255}
!1877 = !DILocation(line: 359, column: 46, scope: !1862, inlinedAt: !1857)
!1878 = !DILocation(line: 326, scope: !1033, inlinedAt: !1868)
!1879 = !DILocation(line: 0, scope: !1028, inlinedAt: !1868)
!1880 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !1868)
!1881 = !DILocation(line: 197, column: 3, scope: !1882, inlinedAt: !1886)
!1882 = distinct !DILexicalBlock(scope: !1883, file: !795, line: 197, column: 3)
!1883 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !795, file: !795, line: 192, type: !1884, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1884 = !DISubroutineType(types: !1885)
!1885 = !{null, !32, !1164}
!1886 = distinct !DILocation(line: 331, column: 3, scope: !1770)
!1887 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !1868)
!1888 = !DILocation(line: 0, scope: !1040, inlinedAt: !1889)
!1889 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !1868)
!1890 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !1889)
!1891 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !1889)
!1892 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !1889)
!1893 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !1889)
!1894 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !1889)
!1895 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !1868)
!1896 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !1868)
!1897 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !1868)
!1898 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !1868)
!1899 = distinct !{!1899, !1867, !1900, !255}
!1900 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !1868)
!1901 = !DILocation(line: 197, scope: !1882, inlinedAt: !1886)
!1902 = !DILocalVariable(name: "i", scope: !1883, file: !795, line: 194, type: !40)
!1903 = !DILocation(line: 0, scope: !1883, inlinedAt: !1886)
!1904 = !DILocation(line: 197, column: 12, scope: !1905, inlinedAt: !1886)
!1905 = distinct !DILexicalBlock(scope: !1882, file: !795, line: 197, column: 3)
!1906 = !DILocation(line: 198, column: 5, scope: !1907, inlinedAt: !1886)
!1907 = distinct !DILexicalBlock(scope: !1905, file: !795, line: 197, column: 28)
!1908 = !DILocation(line: 198, column: 12, scope: !1907, inlinedAt: !1886)
!1909 = !DILocalVariable(name: "j", scope: !1883, file: !795, line: 194, type: !40)
!1910 = !DILocation(line: 199, column: 9, scope: !1911, inlinedAt: !1886)
!1911 = distinct !DILexicalBlock(scope: !1907, file: !795, line: 199, column: 5)
!1912 = !DILocation(line: 199, scope: !1911, inlinedAt: !1886)
!1913 = !DILocation(line: 199, column: 14, scope: !1914, inlinedAt: !1886)
!1914 = distinct !DILexicalBlock(scope: !1911, file: !795, line: 199, column: 5)
!1915 = !DILocation(line: 199, column: 5, scope: !1911, inlinedAt: !1886)
!1916 = !DILocation(line: 200, column: 23, scope: !1917, inlinedAt: !1886)
!1917 = distinct !DILexicalBlock(scope: !1914, file: !795, line: 199, column: 22)
!1918 = !DILocation(line: 200, column: 25, scope: !1917, inlinedAt: !1886)
!1919 = !DILocation(line: 200, column: 12, scope: !1917, inlinedAt: !1886)
!1920 = !DILocalVariable(name: "t", scope: !1883, file: !795, line: 195, type: !91)
!1921 = !DILocation(line: 205, column: 9, scope: !1917, inlinedAt: !1886)
!1922 = !DILocation(line: 206, column: 9, scope: !1917, inlinedAt: !1886)
!1923 = !DILocation(line: 207, column: 9, scope: !1917, inlinedAt: !1886)
!1924 = !DILocation(line: 208, column: 19, scope: !1917, inlinedAt: !1886)
!1925 = !DILocation(line: 208, column: 7, scope: !1917, inlinedAt: !1886)
!1926 = !DILocation(line: 208, column: 14, scope: !1917, inlinedAt: !1886)
!1927 = !DILocation(line: 199, column: 18, scope: !1914, inlinedAt: !1886)
!1928 = !DILocation(line: 199, column: 5, scope: !1914, inlinedAt: !1886)
!1929 = distinct !{!1929, !1915, !1930, !255}
!1930 = !DILocation(line: 209, column: 5, scope: !1911, inlinedAt: !1886)
!1931 = !DILocation(line: 197, column: 24, scope: !1905, inlinedAt: !1886)
!1932 = !DILocation(line: 197, column: 3, scope: !1905, inlinedAt: !1886)
!1933 = distinct !{!1933, !1881, !1934, !255}
!1934 = !DILocation(line: 210, column: 3, scope: !1882, inlinedAt: !1886)
!1935 = !DILocation(line: 332, column: 1, scope: !1770)
!1936 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !933, file: !933, line: 15, type: !1198, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1937 = !DILocalVariable(name: "r", arg: 1, scope: !1936, file: !933, line: 15, type: !32)
!1938 = !DILocation(line: 0, scope: !1936)
!1939 = !DILocalVariable(name: "a", arg: 2, scope: !1936, file: !933, line: 15, type: !1104)
!1940 = !DILocalVariable(name: "t", scope: !1936, file: !933, line: 21, type: !1941)
!1941 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 128, elements: !1942)
!1942 = !{!1943}
!1943 = !DISubrange(count: 8)
!1944 = !DILocation(line: 21, column: 12, scope: !1936)
!1945 = !DILocalVariable(name: "i", scope: !1936, file: !933, line: 17, type: !40)
!1946 = !DILocation(line: 22, column: 7, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1936, file: !933, line: 22, column: 3)
!1948 = !DILocation(line: 22, scope: !1947)
!1949 = !DILocation(line: 22, column: 12, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1947, file: !933, line: 22, column: 3)
!1951 = !DILocation(line: 22, column: 3, scope: !1947)
!1952 = !DILocation(line: 23, column: 5, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1954, file: !933, line: 23, column: 5)
!1954 = distinct !DILexicalBlock(scope: !1950, file: !933, line: 22, column: 26)
!1955 = !DILocation(line: 23, scope: !1953)
!1956 = !DILocalVariable(name: "j", scope: !1936, file: !933, line: 17, type: !40)
!1957 = !DILocation(line: 23, column: 14, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1953, file: !933, line: 23, column: 5)
!1959 = !DILocation(line: 24, column: 7, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1961, file: !933, line: 24, column: 7)
!1961 = distinct !DILexicalBlock(scope: !1958, file: !933, line: 23, column: 30)
!1962 = !DILocation(line: 24, scope: !1960)
!1963 = !DILocalVariable(name: "k", scope: !1936, file: !933, line: 17, type: !40)
!1964 = !DILocation(line: 24, column: 16, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1960, file: !933, line: 24, column: 7)
!1966 = !DILocation(line: 25, column: 17, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1965, file: !933, line: 24, column: 24)
!1968 = !DILocation(line: 25, column: 35, scope: !1967)
!1969 = !DILocation(line: 25, column: 37, scope: !1967)
!1970 = !DILocation(line: 26, column: 39, scope: !1967)
!1971 = !DILocation(line: 26, column: 9, scope: !1967)
!1972 = !DILocation(line: 26, column: 14, scope: !1967)
!1973 = !DILocation(line: 28, column: 14, scope: !1967)
!1974 = !DILocalVariable(name: "d0", scope: !1936, file: !933, line: 18, type: !70)
!1975 = !DILocation(line: 31, column: 12, scope: !1967)
!1976 = !DILocation(line: 32, column: 12, scope: !1967)
!1977 = !DILocation(line: 33, column: 16, scope: !1967)
!1978 = !DILocation(line: 33, column: 9, scope: !1967)
!1979 = !DILocation(line: 33, column: 14, scope: !1967)
!1980 = !DILocation(line: 24, column: 20, scope: !1965)
!1981 = !DILocation(line: 24, column: 7, scope: !1965)
!1982 = distinct !{!1982, !1959, !1983, !255}
!1983 = !DILocation(line: 34, column: 7, scope: !1960)
!1984 = !DILocation(line: 36, column: 16, scope: !1961)
!1985 = !DILocation(line: 36, column: 15, scope: !1961)
!1986 = !DILocation(line: 36, column: 13, scope: !1961)
!1987 = !DILocation(line: 37, column: 16, scope: !1961)
!1988 = !DILocation(line: 37, column: 21, scope: !1961)
!1989 = !DILocation(line: 37, column: 31, scope: !1961)
!1990 = !DILocation(line: 37, column: 36, scope: !1961)
!1991 = !DILocation(line: 37, column: 28, scope: !1961)
!1992 = !DILocation(line: 37, column: 7, scope: !1961)
!1993 = !DILocation(line: 37, column: 13, scope: !1961)
!1994 = !DILocation(line: 38, column: 16, scope: !1961)
!1995 = !DILocation(line: 38, column: 21, scope: !1961)
!1996 = !DILocation(line: 38, column: 31, scope: !1961)
!1997 = !DILocation(line: 38, column: 36, scope: !1961)
!1998 = !DILocation(line: 38, column: 28, scope: !1961)
!1999 = !DILocation(line: 38, column: 7, scope: !1961)
!2000 = !DILocation(line: 38, column: 13, scope: !1961)
!2001 = !DILocation(line: 39, column: 16, scope: !1961)
!2002 = !DILocation(line: 39, column: 21, scope: !1961)
!2003 = !DILocation(line: 39, column: 15, scope: !1961)
!2004 = !DILocation(line: 39, column: 7, scope: !1961)
!2005 = !DILocation(line: 39, column: 13, scope: !1961)
!2006 = !DILocation(line: 40, column: 16, scope: !1961)
!2007 = !DILocation(line: 40, column: 21, scope: !1961)
!2008 = !DILocation(line: 40, column: 31, scope: !1961)
!2009 = !DILocation(line: 40, column: 36, scope: !1961)
!2010 = !DILocation(line: 40, column: 28, scope: !1961)
!2011 = !DILocation(line: 40, column: 7, scope: !1961)
!2012 = !DILocation(line: 40, column: 13, scope: !1961)
!2013 = !DILocation(line: 41, column: 16, scope: !1961)
!2014 = !DILocation(line: 41, column: 21, scope: !1961)
!2015 = !DILocation(line: 41, column: 31, scope: !1961)
!2016 = !DILocation(line: 41, column: 36, scope: !1961)
!2017 = !DILocation(line: 41, column: 28, scope: !1961)
!2018 = !DILocation(line: 41, column: 7, scope: !1961)
!2019 = !DILocation(line: 41, column: 13, scope: !1961)
!2020 = !DILocation(line: 42, column: 16, scope: !1961)
!2021 = !DILocation(line: 42, column: 21, scope: !1961)
!2022 = !DILocation(line: 42, column: 31, scope: !1961)
!2023 = !DILocation(line: 42, column: 36, scope: !1961)
!2024 = !DILocation(line: 42, column: 28, scope: !1961)
!2025 = !DILocation(line: 42, column: 7, scope: !1961)
!2026 = !DILocation(line: 42, column: 13, scope: !1961)
!2027 = !DILocation(line: 43, column: 16, scope: !1961)
!2028 = !DILocation(line: 43, column: 21, scope: !1961)
!2029 = !DILocation(line: 43, column: 15, scope: !1961)
!2030 = !DILocation(line: 43, column: 7, scope: !1961)
!2031 = !DILocation(line: 43, column: 13, scope: !1961)
!2032 = !DILocation(line: 44, column: 16, scope: !1961)
!2033 = !DILocation(line: 44, column: 21, scope: !1961)
!2034 = !DILocation(line: 44, column: 31, scope: !1961)
!2035 = !DILocation(line: 44, column: 36, scope: !1961)
!2036 = !DILocation(line: 44, column: 28, scope: !1961)
!2037 = !DILocation(line: 44, column: 7, scope: !1961)
!2038 = !DILocation(line: 44, column: 13, scope: !1961)
!2039 = !DILocation(line: 45, column: 16, scope: !1961)
!2040 = !DILocation(line: 45, column: 21, scope: !1961)
!2041 = !DILocation(line: 45, column: 31, scope: !1961)
!2042 = !DILocation(line: 45, column: 36, scope: !1961)
!2043 = !DILocation(line: 45, column: 28, scope: !1961)
!2044 = !DILocation(line: 45, column: 7, scope: !1961)
!2045 = !DILocation(line: 45, column: 13, scope: !1961)
!2046 = !DILocation(line: 46, column: 16, scope: !1961)
!2047 = !DILocation(line: 46, column: 21, scope: !1961)
!2048 = !DILocation(line: 46, column: 15, scope: !1961)
!2049 = !DILocation(line: 46, column: 7, scope: !1961)
!2050 = !DILocation(line: 46, column: 13, scope: !1961)
!2051 = !DILocation(line: 47, column: 9, scope: !1961)
!2052 = !DILocation(line: 23, column: 26, scope: !1958)
!2053 = !DILocation(line: 23, column: 5, scope: !1958)
!2054 = distinct !{!2054, !1952, !2055, !255}
!2055 = !DILocation(line: 48, column: 5, scope: !1953)
!2056 = !DILocation(line: 22, column: 22, scope: !1950)
!2057 = !DILocation(line: 22, column: 3, scope: !1950)
!2058 = distinct !{!2058, !1951, !2059, !255}
!2059 = !DILocation(line: 49, column: 3, scope: !1947)
!2060 = !DILocation(line: 77, column: 1, scope: !1936)
!2061 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !933, file: !933, line: 89, type: !1300, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2062 = !DILocalVariable(name: "r", arg: 1, scope: !2061, file: !933, line: 89, type: !937)
!2063 = !DILocation(line: 0, scope: !2061)
!2064 = !DILocalVariable(name: "a", arg: 2, scope: !2061, file: !933, line: 89, type: !157)
!2065 = !DILocalVariable(name: "t", scope: !2061, file: !933, line: 94, type: !1941)
!2066 = !DILocation(line: 94, column: 12, scope: !2061)
!2067 = !DILocalVariable(name: "i", scope: !2061, file: !933, line: 91, type: !40)
!2068 = !DILocation(line: 95, column: 7, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2061, file: !933, line: 95, column: 3)
!2070 = !DILocation(line: 95, scope: !2069)
!2071 = !DILocation(line: 95, column: 12, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2069, file: !933, line: 95, column: 3)
!2073 = !DILocation(line: 95, column: 3, scope: !2069)
!2074 = !DILocation(line: 96, column: 5, scope: !2075)
!2075 = distinct !DILexicalBlock(scope: !2076, file: !933, line: 96, column: 5)
!2076 = distinct !DILexicalBlock(scope: !2072, file: !933, line: 95, column: 26)
!2077 = !DILocation(line: 96, scope: !2075)
!2078 = !DILocalVariable(name: "j", scope: !2061, file: !933, line: 91, type: !40)
!2079 = !DILocation(line: 96, column: 14, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2075, file: !933, line: 96, column: 5)
!2081 = !DILocation(line: 97, column: 15, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2080, file: !933, line: 96, column: 30)
!2083 = !DILocation(line: 97, column: 39, scope: !2082)
!2084 = !DILocation(line: 97, column: 29, scope: !2082)
!2085 = !DILocation(line: 97, column: 45, scope: !2082)
!2086 = !DILocation(line: 97, column: 26, scope: !2082)
!2087 = !DILocation(line: 97, column: 12, scope: !2082)
!2088 = !DILocation(line: 98, column: 15, scope: !2082)
!2089 = !DILocation(line: 98, column: 20, scope: !2082)
!2090 = !DILocation(line: 98, column: 39, scope: !2082)
!2091 = !DILocation(line: 98, column: 29, scope: !2082)
!2092 = !DILocation(line: 98, column: 45, scope: !2082)
!2093 = !DILocation(line: 98, column: 26, scope: !2082)
!2094 = !DILocation(line: 98, column: 7, scope: !2082)
!2095 = !DILocation(line: 98, column: 12, scope: !2082)
!2096 = !DILocation(line: 99, column: 15, scope: !2082)
!2097 = !DILocation(line: 99, column: 20, scope: !2082)
!2098 = !DILocation(line: 99, column: 39, scope: !2082)
!2099 = !DILocation(line: 99, column: 29, scope: !2082)
!2100 = !DILocation(line: 99, column: 45, scope: !2082)
!2101 = !DILocation(line: 99, column: 26, scope: !2082)
!2102 = !DILocation(line: 99, column: 64, scope: !2082)
!2103 = !DILocation(line: 99, column: 54, scope: !2082)
!2104 = !DILocation(line: 99, column: 69, scope: !2082)
!2105 = !DILocation(line: 99, column: 51, scope: !2082)
!2106 = !DILocation(line: 99, column: 7, scope: !2082)
!2107 = !DILocation(line: 99, column: 12, scope: !2082)
!2108 = !DILocation(line: 100, column: 15, scope: !2082)
!2109 = !DILocation(line: 100, column: 20, scope: !2082)
!2110 = !DILocation(line: 100, column: 39, scope: !2082)
!2111 = !DILocation(line: 100, column: 29, scope: !2082)
!2112 = !DILocation(line: 100, column: 45, scope: !2082)
!2113 = !DILocation(line: 100, column: 26, scope: !2082)
!2114 = !DILocation(line: 100, column: 7, scope: !2082)
!2115 = !DILocation(line: 100, column: 12, scope: !2082)
!2116 = !DILocation(line: 101, column: 15, scope: !2082)
!2117 = !DILocation(line: 101, column: 20, scope: !2082)
!2118 = !DILocation(line: 101, column: 39, scope: !2082)
!2119 = !DILocation(line: 101, column: 29, scope: !2082)
!2120 = !DILocation(line: 101, column: 45, scope: !2082)
!2121 = !DILocation(line: 101, column: 26, scope: !2082)
!2122 = !DILocation(line: 101, column: 7, scope: !2082)
!2123 = !DILocation(line: 101, column: 12, scope: !2082)
!2124 = !DILocation(line: 102, column: 15, scope: !2082)
!2125 = !DILocation(line: 102, column: 20, scope: !2082)
!2126 = !DILocation(line: 102, column: 39, scope: !2082)
!2127 = !DILocation(line: 102, column: 29, scope: !2082)
!2128 = !DILocation(line: 102, column: 45, scope: !2082)
!2129 = !DILocation(line: 102, column: 26, scope: !2082)
!2130 = !DILocation(line: 102, column: 64, scope: !2082)
!2131 = !DILocation(line: 102, column: 54, scope: !2082)
!2132 = !DILocation(line: 102, column: 69, scope: !2082)
!2133 = !DILocation(line: 102, column: 51, scope: !2082)
!2134 = !DILocation(line: 102, column: 7, scope: !2082)
!2135 = !DILocation(line: 102, column: 12, scope: !2082)
!2136 = !DILocation(line: 103, column: 15, scope: !2082)
!2137 = !DILocation(line: 103, column: 20, scope: !2082)
!2138 = !DILocation(line: 103, column: 39, scope: !2082)
!2139 = !DILocation(line: 103, column: 29, scope: !2082)
!2140 = !DILocation(line: 103, column: 45, scope: !2082)
!2141 = !DILocation(line: 103, column: 26, scope: !2082)
!2142 = !DILocation(line: 103, column: 7, scope: !2082)
!2143 = !DILocation(line: 103, column: 12, scope: !2082)
!2144 = !DILocation(line: 104, column: 15, scope: !2082)
!2145 = !DILocation(line: 104, column: 20, scope: !2082)
!2146 = !DILocation(line: 104, column: 39, scope: !2082)
!2147 = !DILocation(line: 104, column: 29, scope: !2082)
!2148 = !DILocation(line: 104, column: 45, scope: !2082)
!2149 = !DILocation(line: 104, column: 26, scope: !2082)
!2150 = !DILocation(line: 104, column: 7, scope: !2082)
!2151 = !DILocation(line: 104, column: 12, scope: !2082)
!2152 = !DILocalVariable(name: "k", scope: !2061, file: !933, line: 91, type: !40)
!2153 = !DILocation(line: 107, column: 11, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2082, file: !933, line: 107, column: 7)
!2155 = !DILocation(line: 107, scope: !2154)
!2156 = !DILocation(line: 107, column: 16, scope: !2157)
!2157 = distinct !DILexicalBlock(scope: !2154, file: !933, line: 107, column: 7)
!2158 = !DILocation(line: 107, column: 7, scope: !2154)
!2159 = !DILocation(line: 108, column: 47, scope: !2157)
!2160 = !DILocation(line: 108, column: 52, scope: !2157)
!2161 = !DILocation(line: 108, column: 60, scope: !2157)
!2162 = !DILocation(line: 108, column: 69, scope: !2157)
!2163 = !DILocation(line: 108, column: 77, scope: !2157)
!2164 = !DILocation(line: 108, column: 35, scope: !2157)
!2165 = !DILocation(line: 108, column: 9, scope: !2157)
!2166 = !DILocation(line: 108, column: 27, scope: !2157)
!2167 = !DILocation(line: 108, column: 29, scope: !2157)
!2168 = !DILocation(line: 108, column: 33, scope: !2157)
!2169 = !DILocation(line: 107, column: 20, scope: !2157)
!2170 = !DILocation(line: 107, column: 7, scope: !2157)
!2171 = distinct !{!2171, !2158, !2172, !255}
!2172 = !DILocation(line: 108, column: 80, scope: !2154)
!2173 = !DILocation(line: 105, column: 9, scope: !2082)
!2174 = !DILocation(line: 96, column: 26, scope: !2080)
!2175 = !DILocation(line: 96, column: 5, scope: !2080)
!2176 = distinct !{!2176, !2074, !2177, !255}
!2177 = !DILocation(line: 109, column: 5, scope: !2075)
!2178 = !DILocation(line: 95, column: 22, scope: !2072)
!2179 = !DILocation(line: 95, column: 3, scope: !2072)
!2180 = distinct !{!2180, !2073, !2181, !255}
!2181 = !DILocation(line: 110, column: 3, scope: !2069)
!2182 = !DILocation(line: 128, column: 1, scope: !2061)
!2183 = !DILocalVariable(name: "r", arg: 1, scope: !1197, file: !933, line: 139, type: !32)
!2184 = !DILocation(line: 0, scope: !1197)
!2185 = !DILocalVariable(name: "a", arg: 2, scope: !1197, file: !933, line: 139, type: !1104)
!2186 = !DILocation(line: 142, column: 7, scope: !1196)
!2187 = !DILocation(line: 142, scope: !1196)
!2188 = !DILocation(line: 142, column: 12, scope: !1234)
!2189 = !DILocation(line: 142, column: 3, scope: !1196)
!2190 = !DILocation(line: 143, column: 21, scope: !1234)
!2191 = !DILocation(line: 143, column: 19, scope: !1234)
!2192 = !DILocation(line: 143, column: 40, scope: !1234)
!2193 = !DILocation(line: 143, column: 5, scope: !1234)
!2194 = !DILocation(line: 142, column: 22, scope: !1234)
!2195 = !DILocation(line: 142, column: 3, scope: !1234)
!2196 = distinct !{!2196, !2189, !2197, !255}
!2197 = !DILocation(line: 143, column: 49, scope: !1196)
!2198 = !DILocation(line: 144, column: 1, scope: !1197)
!2199 = !DILocation(line: 0, scope: !1299)
!2200 = !DILocation(line: 159, column: 7, scope: !1307)
!2201 = !DILocation(line: 159, scope: !1307)
!2202 = !DILocation(line: 159, column: 12, scope: !1310)
!2203 = !DILocation(line: 159, column: 3, scope: !1307)
!2204 = !DILocation(line: 160, column: 21, scope: !1310)
!2205 = !DILocation(line: 160, column: 35, scope: !1310)
!2206 = !DILocation(line: 160, column: 33, scope: !1310)
!2207 = !DILocation(line: 160, column: 5, scope: !1310)
!2208 = !DILocation(line: 159, column: 22, scope: !1310)
!2209 = !DILocation(line: 159, column: 3, scope: !1310)
!2210 = distinct !{!2210, !2203, !2211, !255}
!2211 = !DILocation(line: 160, column: 51, scope: !1307)
!2212 = !DILocation(line: 161, column: 1, scope: !1299)
!2213 = !DILocation(line: 0, scope: !934)
!2214 = !DILocation(line: 173, column: 7, scope: !932)
!2215 = !DILocation(line: 173, scope: !932)
!2216 = !DILocation(line: 173, column: 12, scope: !1016)
!2217 = !DILocation(line: 173, column: 3, scope: !932)
!2218 = !DILocation(line: 174, column: 15, scope: !1016)
!2219 = !DILocation(line: 0, scope: !1021, inlinedAt: !2220)
!2220 = distinct !DILocation(line: 174, column: 5, scope: !1016)
!2221 = !DILocation(line: 263, column: 3, scope: !1021, inlinedAt: !2220)
!2222 = !DILocation(line: 0, scope: !1028, inlinedAt: !2223)
!2223 = distinct !DILocation(line: 264, column: 3, scope: !1021, inlinedAt: !2220)
!2224 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !2223)
!2225 = !DILocation(line: 326, scope: !1033, inlinedAt: !2223)
!2226 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !2223)
!2227 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !2223)
!2228 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !2223)
!2229 = !DILocation(line: 0, scope: !1040, inlinedAt: !2230)
!2230 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !2223)
!2231 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !2230)
!2232 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !2230)
!2233 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !2230)
!2234 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !2230)
!2235 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !2230)
!2236 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !2223)
!2237 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !2223)
!2238 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !2223)
!2239 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2223)
!2240 = distinct !{!2240, !2227, !2241, !255}
!2241 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !2223)
!2242 = !DILocation(line: 173, column: 22, scope: !1016)
!2243 = !DILocation(line: 173, column: 3, scope: !1016)
!2244 = distinct !{!2244, !2217, !2245, !255}
!2245 = !DILocation(line: 174, column: 24, scope: !932)
!2246 = !DILocation(line: 175, column: 1, scope: !934)
!2247 = !DILocation(line: 0, scope: !1626)
!2248 = !DILocation(line: 188, column: 7, scope: !1631)
!2249 = !DILocation(line: 188, scope: !1631)
!2250 = !DILocation(line: 188, column: 12, scope: !1634)
!2251 = !DILocation(line: 188, column: 3, scope: !1631)
!2252 = !DILocation(line: 189, column: 25, scope: !1634)
!2253 = !DILocation(line: 0, scope: !1638, inlinedAt: !2254)
!2254 = distinct !DILocation(line: 189, column: 5, scope: !1634)
!2255 = !DILocation(line: 278, column: 3, scope: !1638, inlinedAt: !2254)
!2256 = !DILocation(line: 188, column: 22, scope: !1634)
!2257 = !DILocation(line: 188, column: 3, scope: !1634)
!2258 = distinct !{!2258, !2251, !2259, !255}
!2259 = !DILocation(line: 189, column: 34, scope: !1631)
!2260 = !DILocation(line: 190, column: 1, scope: !1626)
!2261 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !933, file: !933, line: 202, type: !2262, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!2262 = !DISubroutineType(types: !2263)
!2263 = !{null, !2264, !1104, !1104}
!2264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !943, size: 32)
!2265 = !DILocalVariable(name: "r", arg: 1, scope: !2261, file: !933, line: 202, type: !2264)
!2266 = !DILocation(line: 0, scope: !2261)
!2267 = !DILocalVariable(name: "a", arg: 2, scope: !2261, file: !933, line: 202, type: !1104)
!2268 = !DILocalVariable(name: "b", arg: 3, scope: !2261, file: !933, line: 202, type: !1104)
!2269 = !DILocalVariable(name: "t", scope: !2261, file: !933, line: 205, type: !943)
!2270 = !DILocation(line: 205, column: 8, scope: !2261)
!2271 = !DILocation(line: 207, column: 3, scope: !2261)
!2272 = !DILocalVariable(name: "i", scope: !2261, file: !933, line: 204, type: !40)
!2273 = !DILocation(line: 208, column: 7, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2261, file: !933, line: 208, column: 3)
!2275 = !DILocation(line: 208, scope: !2274)
!2276 = !DILocation(line: 208, column: 12, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2274, file: !933, line: 208, column: 3)
!2278 = !DILocation(line: 208, column: 3, scope: !2274)
!2279 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !2280)
!2280 = distinct !DILocation(line: 213, column: 3, scope: !2261)
!2281 = !DILocation(line: 209, column: 34, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2277, file: !933, line: 208, column: 26)
!2283 = !DILocation(line: 209, column: 46, scope: !2282)
!2284 = !DILocation(line: 209, column: 5, scope: !2282)
!2285 = !DILocation(line: 0, scope: !1161, inlinedAt: !2286)
!2286 = distinct !DILocation(line: 210, column: 5, scope: !2282)
!2287 = !DILocation(line: 342, column: 7, scope: !1172, inlinedAt: !2286)
!2288 = !DILocation(line: 342, scope: !1172, inlinedAt: !2286)
!2289 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !2286)
!2290 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !2286)
!2291 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !2286)
!2292 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !2286)
!2293 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !2286)
!2294 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !2286)
!2295 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !2286)
!2296 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !2286)
!2297 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !2286)
!2298 = distinct !{!2298, !2290, !2299, !255}
!2299 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !2286)
!2300 = !DILocation(line: 208, column: 22, scope: !2277)
!2301 = !DILocation(line: 208, column: 3, scope: !2277)
!2302 = distinct !{!2302, !2278, !2303, !255}
!2303 = !DILocation(line: 211, column: 3, scope: !2274)
!2304 = !DILocation(line: 326, scope: !1033, inlinedAt: !2280)
!2305 = !DILocation(line: 0, scope: !1028, inlinedAt: !2280)
!2306 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !2280)
!2307 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !2280)
!2308 = !DILocation(line: 0, scope: !1040, inlinedAt: !2309)
!2309 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !2280)
!2310 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !2309)
!2311 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !2309)
!2312 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !2309)
!2313 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !2309)
!2314 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !2309)
!2315 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !2280)
!2316 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !2280)
!2317 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !2280)
!2318 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2280)
!2319 = distinct !{!2319, !2279, !2320, !255}
!2320 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !2280)
!2321 = !DILocation(line: 214, column: 1, scope: !2261)
!2322 = !DILocalVariable(name: "r", arg: 1, scope: !1155, file: !933, line: 225, type: !937)
!2323 = !DILocation(line: 0, scope: !1155)
!2324 = !DILocation(line: 228, column: 7, scope: !1154)
!2325 = !DILocation(line: 228, scope: !1154)
!2326 = !DILocation(line: 228, column: 12, scope: !1194)
!2327 = !DILocation(line: 228, column: 3, scope: !1154)
!2328 = !DILocation(line: 229, column: 18, scope: !1194)
!2329 = !DILocation(line: 0, scope: !1028, inlinedAt: !2330)
!2330 = distinct !DILocation(line: 229, column: 5, scope: !1194)
!2331 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !2330)
!2332 = !DILocation(line: 326, scope: !1033, inlinedAt: !2330)
!2333 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !2330)
!2334 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !2330)
!2335 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !2330)
!2336 = !DILocation(line: 0, scope: !1040, inlinedAt: !2337)
!2337 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !2330)
!2338 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !2337)
!2339 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !2337)
!2340 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !2337)
!2341 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !2337)
!2342 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !2337)
!2343 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !2330)
!2344 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !2330)
!2345 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !2330)
!2346 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2330)
!2347 = distinct !{!2347, !2334, !2348, !255}
!2348 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !2330)
!2349 = !DILocation(line: 228, column: 22, scope: !1194)
!2350 = !DILocation(line: 228, column: 3, scope: !1194)
!2351 = distinct !{!2351, !2327, !2352, !255}
!2352 = !DILocation(line: 229, column: 27, scope: !1154)
!2353 = !DILocation(line: 230, column: 1, scope: !1155)
!2354 = !DILocation(line: 0, scope: !1101)
!2355 = !DILocation(line: 244, column: 7, scope: !1100)
!2356 = !DILocation(line: 244, scope: !1100)
!2357 = !DILocation(line: 244, column: 12, scope: !1152)
!2358 = !DILocation(line: 244, column: 3, scope: !1100)
!2359 = !DILocation(line: 245, column: 15, scope: !1152)
!2360 = !DILocation(line: 245, column: 27, scope: !1152)
!2361 = !DILocation(line: 245, column: 39, scope: !1152)
!2362 = !DILocation(line: 0, scope: !1161, inlinedAt: !2363)
!2363 = distinct !DILocation(line: 245, column: 5, scope: !1152)
!2364 = !DILocation(line: 342, column: 7, scope: !1172, inlinedAt: !2363)
!2365 = !DILocation(line: 342, scope: !1172, inlinedAt: !2363)
!2366 = !DILocation(line: 342, column: 12, scope: !1175, inlinedAt: !2363)
!2367 = !DILocation(line: 342, column: 3, scope: !1172, inlinedAt: !2363)
!2368 = !DILocation(line: 343, column: 20, scope: !1175, inlinedAt: !2363)
!2369 = !DILocation(line: 343, column: 35, scope: !1175, inlinedAt: !2363)
!2370 = !DILocation(line: 343, column: 33, scope: !1175, inlinedAt: !2363)
!2371 = !DILocation(line: 343, column: 5, scope: !1175, inlinedAt: !2363)
!2372 = !DILocation(line: 343, column: 18, scope: !1175, inlinedAt: !2363)
!2373 = !DILocation(line: 342, column: 22, scope: !1175, inlinedAt: !2363)
!2374 = !DILocation(line: 342, column: 3, scope: !1175, inlinedAt: !2363)
!2375 = distinct !{!2375, !2367, !2376, !255}
!2376 = !DILocation(line: 343, column: 46, scope: !1172, inlinedAt: !2363)
!2377 = !DILocation(line: 244, column: 22, scope: !1152)
!2378 = !DILocation(line: 244, column: 3, scope: !1152)
!2379 = distinct !{!2379, !2358, !2380, !255}
!2380 = !DILocation(line: 245, column: 48, scope: !1100)
!2381 = !DILocation(line: 246, column: 1, scope: !1101)
!2382 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !795, file: !795, line: 19, type: !1884, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2383 = !DILocalVariable(name: "r", arg: 1, scope: !2382, file: !795, line: 19, type: !32)
!2384 = !DILocation(line: 0, scope: !2382)
!2385 = !DILocalVariable(name: "a", arg: 2, scope: !2382, file: !795, line: 19, type: !1164)
!2386 = !DILocalVariable(name: "t", scope: !2382, file: !795, line: 24, type: !2387)
!2387 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !1942)
!2388 = !DILocation(line: 24, column: 11, scope: !2382)
!2389 = !DILocalVariable(name: "i", scope: !2382, file: !795, line: 21, type: !40)
!2390 = !DILocation(line: 48, column: 7, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2382, file: !795, line: 48, column: 3)
!2392 = !DILocation(line: 48, scope: !2391)
!2393 = !DILocation(line: 48, column: 12, scope: !2394)
!2394 = distinct !DILexicalBlock(scope: !2391, file: !795, line: 48, column: 3)
!2395 = !DILocation(line: 48, column: 3, scope: !2391)
!2396 = !DILocation(line: 49, column: 5, scope: !2397)
!2397 = distinct !DILexicalBlock(scope: !2398, file: !795, line: 49, column: 5)
!2398 = distinct !DILexicalBlock(scope: !2394, file: !795, line: 48, column: 28)
!2399 = !DILocation(line: 49, scope: !2397)
!2400 = !DILocalVariable(name: "j", scope: !2382, file: !795, line: 21, type: !40)
!2401 = !DILocation(line: 49, column: 14, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2397, file: !795, line: 49, column: 5)
!2403 = !DILocation(line: 51, column: 23, scope: !2404)
!2404 = distinct !DILexicalBlock(scope: !2402, file: !795, line: 49, column: 22)
!2405 = !DILocation(line: 51, column: 25, scope: !2404)
!2406 = !DILocation(line: 51, column: 12, scope: !2404)
!2407 = !DILocalVariable(name: "u", scope: !2382, file: !795, line: 22, type: !61)
!2408 = !DILocation(line: 52, column: 22, scope: !2404)
!2409 = !DILocation(line: 52, column: 9, scope: !2404)
!2410 = !DILocation(line: 54, column: 12, scope: !2404)
!2411 = !DILocalVariable(name: "d0", scope: !2382, file: !795, line: 23, type: !91)
!2412 = !DILocation(line: 56, column: 10, scope: !2404)
!2413 = !DILocation(line: 57, column: 10, scope: !2404)
!2414 = !DILocation(line: 58, column: 14, scope: !2404)
!2415 = !DILocation(line: 58, column: 7, scope: !2404)
!2416 = !DILocation(line: 58, column: 12, scope: !2404)
!2417 = !DILocation(line: 49, column: 18, scope: !2402)
!2418 = !DILocation(line: 49, column: 5, scope: !2402)
!2419 = distinct !{!2419, !2396, !2420, !255}
!2420 = !DILocation(line: 59, column: 5, scope: !2397)
!2421 = !DILocation(line: 61, column: 13, scope: !2398)
!2422 = !DILocation(line: 61, column: 27, scope: !2398)
!2423 = !DILocation(line: 61, column: 32, scope: !2398)
!2424 = !DILocation(line: 61, column: 24, scope: !2398)
!2425 = !DILocation(line: 61, column: 10, scope: !2398)
!2426 = !DILocation(line: 62, column: 18, scope: !2398)
!2427 = !DILocation(line: 62, column: 27, scope: !2398)
!2428 = !DILocation(line: 62, column: 32, scope: !2398)
!2429 = !DILocation(line: 62, column: 24, scope: !2398)
!2430 = !DILocation(line: 62, column: 41, scope: !2398)
!2431 = !DILocation(line: 62, column: 46, scope: !2398)
!2432 = !DILocation(line: 62, column: 38, scope: !2398)
!2433 = !DILocation(line: 62, column: 5, scope: !2398)
!2434 = !DILocation(line: 62, column: 10, scope: !2398)
!2435 = !DILocation(line: 63, column: 18, scope: !2398)
!2436 = !DILocation(line: 63, column: 27, scope: !2398)
!2437 = !DILocation(line: 63, column: 32, scope: !2398)
!2438 = !DILocation(line: 63, column: 24, scope: !2398)
!2439 = !DILocation(line: 63, column: 5, scope: !2398)
!2440 = !DILocation(line: 63, column: 10, scope: !2398)
!2441 = !DILocation(line: 64, column: 18, scope: !2398)
!2442 = !DILocation(line: 64, column: 27, scope: !2398)
!2443 = !DILocation(line: 64, column: 32, scope: !2398)
!2444 = !DILocation(line: 64, column: 24, scope: !2398)
!2445 = !DILocation(line: 64, column: 41, scope: !2398)
!2446 = !DILocation(line: 64, column: 46, scope: !2398)
!2447 = !DILocation(line: 64, column: 38, scope: !2398)
!2448 = !DILocation(line: 64, column: 5, scope: !2398)
!2449 = !DILocation(line: 64, column: 10, scope: !2398)
!2450 = !DILocation(line: 65, column: 18, scope: !2398)
!2451 = !DILocation(line: 65, column: 27, scope: !2398)
!2452 = !DILocation(line: 65, column: 32, scope: !2398)
!2453 = !DILocation(line: 65, column: 24, scope: !2398)
!2454 = !DILocation(line: 65, column: 5, scope: !2398)
!2455 = !DILocation(line: 65, column: 10, scope: !2398)
!2456 = !DILocation(line: 66, column: 7, scope: !2398)
!2457 = !DILocation(line: 48, column: 24, scope: !2394)
!2458 = !DILocation(line: 48, column: 3, scope: !2394)
!2459 = distinct !{!2459, !2395, !2460, !255}
!2460 = !DILocation(line: 67, column: 3, scope: !2391)
!2461 = !DILocation(line: 71, column: 1, scope: !2382)
!2462 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !795, file: !795, line: 83, type: !1324, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2463 = !DILocalVariable(name: "r", arg: 1, scope: !2462, file: !795, line: 83, type: !798)
!2464 = !DILocation(line: 0, scope: !2462)
!2465 = !DILocalVariable(name: "a", arg: 2, scope: !2462, file: !795, line: 83, type: !157)
!2466 = !DILocalVariable(name: "t", scope: !2462, file: !795, line: 95, type: !2387)
!2467 = !DILocation(line: 95, column: 11, scope: !2462)
!2468 = !DILocalVariable(name: "i", scope: !2462, file: !795, line: 85, type: !40)
!2469 = !DILocation(line: 96, column: 7, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !2462, file: !795, line: 96, column: 3)
!2471 = !DILocation(line: 96, scope: !2470)
!2472 = !DILocation(line: 96, column: 12, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2470, file: !795, line: 96, column: 3)
!2474 = !DILocation(line: 96, column: 3, scope: !2470)
!2475 = !DILocation(line: 97, column: 13, scope: !2476)
!2476 = distinct !DILexicalBlock(scope: !2473, file: !795, line: 96, column: 28)
!2477 = !DILocation(line: 97, column: 10, scope: !2476)
!2478 = !DILocation(line: 98, column: 27, scope: !2476)
!2479 = !DILocation(line: 98, column: 24, scope: !2476)
!2480 = !DILocation(line: 98, column: 5, scope: !2476)
!2481 = !DILocation(line: 98, column: 10, scope: !2476)
!2482 = !DILocation(line: 99, column: 18, scope: !2476)
!2483 = !DILocation(line: 99, column: 5, scope: !2476)
!2484 = !DILocation(line: 99, column: 10, scope: !2476)
!2485 = !DILocation(line: 100, column: 13, scope: !2476)
!2486 = !DILocation(line: 100, column: 27, scope: !2476)
!2487 = !DILocation(line: 100, column: 24, scope: !2476)
!2488 = !DILocation(line: 100, column: 5, scope: !2476)
!2489 = !DILocation(line: 100, column: 10, scope: !2476)
!2490 = !DILocation(line: 101, column: 27, scope: !2476)
!2491 = !DILocation(line: 101, column: 24, scope: !2476)
!2492 = !DILocation(line: 101, column: 5, scope: !2476)
!2493 = !DILocation(line: 101, column: 10, scope: !2476)
!2494 = !DILocation(line: 102, column: 18, scope: !2476)
!2495 = !DILocation(line: 102, column: 5, scope: !2476)
!2496 = !DILocation(line: 102, column: 10, scope: !2476)
!2497 = !DILocation(line: 103, column: 13, scope: !2476)
!2498 = !DILocation(line: 103, column: 27, scope: !2476)
!2499 = !DILocation(line: 103, column: 24, scope: !2476)
!2500 = !DILocation(line: 103, column: 5, scope: !2476)
!2501 = !DILocation(line: 103, column: 10, scope: !2476)
!2502 = !DILocation(line: 104, column: 18, scope: !2476)
!2503 = !DILocation(line: 104, column: 5, scope: !2476)
!2504 = !DILocation(line: 104, column: 10, scope: !2476)
!2505 = !DILocalVariable(name: "j", scope: !2462, file: !795, line: 94, type: !40)
!2506 = !DILocation(line: 107, column: 9, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2476, file: !795, line: 107, column: 5)
!2508 = !DILocation(line: 107, scope: !2507)
!2509 = !DILocation(line: 107, column: 14, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2507, file: !795, line: 107, column: 5)
!2511 = !DILocation(line: 107, column: 5, scope: !2507)
!2512 = !DILocation(line: 108, column: 38, scope: !2510)
!2513 = !DILocation(line: 108, column: 43, scope: !2510)
!2514 = !DILocation(line: 108, column: 48, scope: !2510)
!2515 = !DILocation(line: 108, column: 57, scope: !2510)
!2516 = !DILocation(line: 108, column: 63, scope: !2510)
!2517 = !DILocation(line: 108, column: 26, scope: !2510)
!2518 = !DILocation(line: 108, column: 18, scope: !2510)
!2519 = !DILocation(line: 108, column: 20, scope: !2510)
!2520 = !DILocation(line: 108, column: 7, scope: !2510)
!2521 = !DILocation(line: 108, column: 24, scope: !2510)
!2522 = !DILocation(line: 107, column: 18, scope: !2510)
!2523 = !DILocation(line: 107, column: 5, scope: !2510)
!2524 = distinct !{!2524, !2511, !2525, !255}
!2525 = !DILocation(line: 108, column: 66, scope: !2507)
!2526 = !DILocation(line: 105, column: 7, scope: !2476)
!2527 = !DILocation(line: 96, column: 24, scope: !2473)
!2528 = !DILocation(line: 96, column: 3, scope: !2473)
!2529 = distinct !{!2529, !2474, !2530, !255}
!2530 = !DILocation(line: 109, column: 3, scope: !2470)
!2531 = !DILocation(line: 113, column: 1, scope: !2462)
!2532 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !795, file: !795, line: 124, type: !1884, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2533 = !DILocalVariable(name: "r", arg: 1, scope: !2532, file: !795, line: 124, type: !32)
!2534 = !DILocation(line: 0, scope: !2532)
!2535 = !DILocalVariable(name: "a", arg: 2, scope: !2532, file: !795, line: 124, type: !1164)
!2536 = !DILocalVariable(name: "i", scope: !2532, file: !795, line: 126, type: !40)
!2537 = !DILocation(line: 129, column: 7, scope: !2538)
!2538 = distinct !DILexicalBlock(scope: !2532, file: !795, line: 129, column: 3)
!2539 = !DILocation(line: 129, scope: !2538)
!2540 = !DILocation(line: 129, column: 12, scope: !2541)
!2541 = distinct !DILexicalBlock(scope: !2538, file: !795, line: 129, column: 3)
!2542 = !DILocation(line: 129, column: 3, scope: !2538)
!2543 = !DILocation(line: 131, column: 22, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2541, file: !795, line: 129, column: 28)
!2545 = !DILocation(line: 131, column: 11, scope: !2544)
!2546 = !DILocalVariable(name: "t0", scope: !2532, file: !795, line: 127, type: !86)
!2547 = !DILocation(line: 132, column: 31, scope: !2544)
!2548 = !DILocation(line: 132, column: 8, scope: !2544)
!2549 = !DILocation(line: 133, column: 21, scope: !2544)
!2550 = !DILocation(line: 133, column: 23, scope: !2544)
!2551 = !DILocation(line: 133, column: 10, scope: !2544)
!2552 = !DILocalVariable(name: "t1", scope: !2532, file: !795, line: 127, type: !86)
!2553 = !DILocation(line: 134, column: 31, scope: !2544)
!2554 = !DILocation(line: 134, column: 8, scope: !2544)
!2555 = !DILocation(line: 135, column: 16, scope: !2544)
!2556 = !DILocation(line: 135, column: 8, scope: !2544)
!2557 = !DILocation(line: 135, column: 5, scope: !2544)
!2558 = !DILocation(line: 135, column: 14, scope: !2544)
!2559 = !DILocation(line: 136, column: 20, scope: !2544)
!2560 = !DILocation(line: 136, column: 29, scope: !2544)
!2561 = !DILocation(line: 136, column: 32, scope: !2544)
!2562 = !DILocation(line: 136, column: 26, scope: !2544)
!2563 = !DILocation(line: 136, column: 8, scope: !2544)
!2564 = !DILocation(line: 136, column: 5, scope: !2544)
!2565 = !DILocation(line: 136, column: 14, scope: !2544)
!2566 = !DILocation(line: 137, column: 20, scope: !2544)
!2567 = !DILocation(line: 137, column: 16, scope: !2544)
!2568 = !DILocation(line: 137, column: 8, scope: !2544)
!2569 = !DILocation(line: 137, column: 5, scope: !2544)
!2570 = !DILocation(line: 137, column: 14, scope: !2544)
!2571 = !DILocation(line: 129, column: 24, scope: !2541)
!2572 = !DILocation(line: 129, column: 3, scope: !2541)
!2573 = distinct !{!2573, !2542, !2574, !255}
!2574 = !DILocation(line: 138, column: 3, scope: !2538)
!2575 = !DILocation(line: 139, column: 1, scope: !2532)
!2576 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !795, file: !795, line: 151, type: !1324, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2577 = !DILocalVariable(name: "r", arg: 1, scope: !2576, file: !795, line: 151, type: !798)
!2578 = !DILocation(line: 0, scope: !2576)
!2579 = !DILocalVariable(name: "a", arg: 2, scope: !2576, file: !795, line: 151, type: !157)
!2580 = !DILocalVariable(name: "i", scope: !2576, file: !795, line: 153, type: !40)
!2581 = !DILocation(line: 154, column: 7, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2576, file: !795, line: 154, column: 3)
!2583 = !DILocation(line: 154, scope: !2582)
!2584 = !DILocation(line: 154, column: 12, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2582, file: !795, line: 154, column: 3)
!2586 = !DILocation(line: 154, column: 3, scope: !2582)
!2587 = !DILocation(line: 155, column: 29, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2585, file: !795, line: 154, column: 28)
!2589 = !DILocation(line: 155, column: 26, scope: !2588)
!2590 = !DILocation(line: 155, column: 57, scope: !2588)
!2591 = !DILocation(line: 155, column: 54, scope: !2588)
!2592 = !DILocation(line: 155, column: 44, scope: !2588)
!2593 = !DILocation(line: 155, column: 63, scope: !2588)
!2594 = !DILocation(line: 155, column: 70, scope: !2588)
!2595 = !DILocation(line: 155, column: 16, scope: !2588)
!2596 = !DILocation(line: 155, column: 5, scope: !2588)
!2597 = !DILocation(line: 155, column: 22, scope: !2588)
!2598 = !DILocation(line: 156, column: 29, scope: !2588)
!2599 = !DILocation(line: 156, column: 26, scope: !2588)
!2600 = !DILocation(line: 156, column: 35, scope: !2588)
!2601 = !DILocation(line: 156, column: 57, scope: !2588)
!2602 = !DILocation(line: 156, column: 54, scope: !2588)
!2603 = !DILocation(line: 156, column: 44, scope: !2588)
!2604 = !DILocation(line: 156, column: 63, scope: !2588)
!2605 = !DILocation(line: 156, column: 41, scope: !2588)
!2606 = !DILocation(line: 156, column: 16, scope: !2588)
!2607 = !DILocation(line: 156, column: 18, scope: !2588)
!2608 = !DILocation(line: 156, column: 5, scope: !2588)
!2609 = !DILocation(line: 156, column: 22, scope: !2588)
!2610 = !DILocation(line: 154, column: 24, scope: !2585)
!2611 = !DILocation(line: 154, column: 3, scope: !2585)
!2612 = distinct !{!2612, !2586, !2613, !255}
!2613 = !DILocation(line: 157, column: 3, scope: !2582)
!2614 = !DILocation(line: 158, column: 1, scope: !2576)
!2615 = !DILocation(line: 0, scope: !1323)
!2616 = !DILocation(line: 176, column: 7, scope: !1331)
!2617 = !DILocation(line: 176, scope: !1331)
!2618 = !DILocation(line: 176, column: 12, scope: !1334)
!2619 = !DILocation(line: 176, column: 3, scope: !1331)
!2620 = !DILocation(line: 177, column: 5, scope: !1337)
!2621 = !DILocation(line: 177, scope: !1337)
!2622 = !DILocation(line: 177, column: 14, scope: !1342)
!2623 = !DILocation(line: 178, column: 18, scope: !1344)
!2624 = !DILocation(line: 178, column: 20, scope: !1344)
!2625 = !DILocation(line: 178, column: 7, scope: !1344)
!2626 = !DILocation(line: 178, column: 24, scope: !1344)
!2627 = !DILocation(line: 179, column: 27, scope: !1344)
!2628 = !DILocation(line: 179, column: 31, scope: !1344)
!2629 = !DILocation(line: 179, column: 53, scope: !1344)
!2630 = !DILocation(line: 0, scope: !1352, inlinedAt: !2631)
!2631 = distinct !DILocation(line: 179, column: 7, scope: !1344)
!2632 = !DILocation(line: 74, column: 15, scope: !1352, inlinedAt: !2631)
!2633 = !DILocation(line: 74, column: 11, scope: !1352, inlinedAt: !2631)
!2634 = !DILocation(line: 74, column: 6, scope: !1352, inlinedAt: !2631)
!2635 = !DILocation(line: 177, column: 18, scope: !1342)
!2636 = !DILocation(line: 177, column: 5, scope: !1342)
!2637 = distinct !{!2637, !2620, !2638, !255}
!2638 = !DILocation(line: 180, column: 5, scope: !1337)
!2639 = !DILocation(line: 176, column: 24, scope: !1334)
!2640 = !DILocation(line: 176, column: 3, scope: !1334)
!2641 = distinct !{!2641, !2619, !2642, !255}
!2642 = !DILocation(line: 181, column: 3, scope: !1331)
!2643 = !DILocation(line: 182, column: 1, scope: !1323)
!2644 = !DILocalVariable(name: "msg", arg: 1, scope: !1883, file: !795, line: 192, type: !32)
!2645 = !DILocation(line: 0, scope: !1883)
!2646 = !DILocalVariable(name: "a", arg: 2, scope: !1883, file: !795, line: 192, type: !1164)
!2647 = !DILocation(line: 197, column: 7, scope: !1882)
!2648 = !DILocation(line: 197, scope: !1882)
!2649 = !DILocation(line: 197, column: 12, scope: !1905)
!2650 = !DILocation(line: 197, column: 3, scope: !1882)
!2651 = !DILocation(line: 198, column: 5, scope: !1907)
!2652 = !DILocation(line: 198, column: 12, scope: !1907)
!2653 = !DILocation(line: 199, column: 9, scope: !1911)
!2654 = !DILocation(line: 199, scope: !1911)
!2655 = !DILocation(line: 199, column: 14, scope: !1914)
!2656 = !DILocation(line: 199, column: 5, scope: !1911)
!2657 = !DILocation(line: 200, column: 23, scope: !1917)
!2658 = !DILocation(line: 200, column: 25, scope: !1917)
!2659 = !DILocation(line: 200, column: 12, scope: !1917)
!2660 = !DILocation(line: 205, column: 9, scope: !1917)
!2661 = !DILocation(line: 206, column: 9, scope: !1917)
!2662 = !DILocation(line: 207, column: 9, scope: !1917)
!2663 = !DILocation(line: 208, column: 19, scope: !1917)
!2664 = !DILocation(line: 208, column: 7, scope: !1917)
!2665 = !DILocation(line: 208, column: 14, scope: !1917)
!2666 = !DILocation(line: 199, column: 18, scope: !1914)
!2667 = !DILocation(line: 199, column: 5, scope: !1914)
!2668 = distinct !{!2668, !2656, !2669, !255}
!2669 = !DILocation(line: 209, column: 5, scope: !1911)
!2670 = !DILocation(line: 197, column: 24, scope: !1905)
!2671 = !DILocation(line: 197, column: 3, scope: !1905)
!2672 = distinct !{!2672, !2650, !2673, !255}
!2673 = !DILocation(line: 210, column: 3, scope: !1882)
!2674 = !DILocation(line: 211, column: 1, scope: !1883)
!2675 = !DILocation(line: 0, scope: !794)
!2676 = !DILocation(line: 227, column: 11, scope: !794)
!2677 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !2678)
!2678 = distinct !DILocation(line: 228, column: 3, scope: !794)
!2679 = !DILocation(line: 0, scope: !812, inlinedAt: !2678)
!2680 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !2678)
!2681 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !2678)
!2682 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !2678)
!2683 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !2684)
!2684 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !2685)
!2685 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !2678)
!2686 = !DILocation(line: 0, scope: !831, inlinedAt: !2685)
!2687 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !2685)
!2688 = !DILocation(line: 0, scope: !829, inlinedAt: !2684)
!2689 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !2684)
!2690 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !2684)
!2691 = !DILocation(line: 0, scope: !850, inlinedAt: !2692)
!2692 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !2685)
!2693 = !DILocation(line: 0, scope: !601, inlinedAt: !2694)
!2694 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !2692)
!2695 = !DILocation(line: 0, scope: !858, inlinedAt: !2696)
!2696 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !2685)
!2697 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !2696)
!2698 = !DILocation(line: 0, scope: !865, inlinedAt: !2699)
!2699 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !2696)
!2700 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !2699)
!2701 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !2699)
!2702 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !2699)
!2703 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !2699)
!2704 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !2699)
!2705 = !DILocation(line: 439, scope: !883, inlinedAt: !2699)
!2706 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !2699)
!2707 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !2699)
!2708 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !2699)
!2709 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !2699)
!2710 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !2699)
!2711 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !2699)
!2712 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !2699)
!2713 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !2699)
!2714 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !2699)
!2715 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !2699)
!2716 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !2699)
!2717 = distinct !{!2717, !2708, !2718, !255}
!2718 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !2699)
!2719 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !2699)
!2720 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !2699)
!2721 = distinct !{!2721, !2700, !2722, !255}
!2722 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !2699)
!2723 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !2696)
!2724 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !2696)
!2725 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !2685)
!2726 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !2678)
!2727 = !DILocation(line: 0, scope: !909, inlinedAt: !2728)
!2728 = distinct !DILocation(line: 229, column: 3, scope: !794)
!2729 = !DILocation(line: 113, column: 3, scope: !909, inlinedAt: !2728)
!2730 = !DILocation(line: 230, column: 1, scope: !794)
!2731 = !DILocation(line: 0, scope: !1448)
!2732 = !DILocation(line: 246, column: 11, scope: !1448)
!2733 = !DILocation(line: 47, column: 3, scope: !812, inlinedAt: !2734)
!2734 = distinct !DILocation(line: 247, column: 3, scope: !1448)
!2735 = !DILocation(line: 0, scope: !812, inlinedAt: !2734)
!2736 = !DILocation(line: 45, column: 11, scope: !812, inlinedAt: !2734)
!2737 = !DILocation(line: 48, column: 3, scope: !812, inlinedAt: !2734)
!2738 = !DILocation(line: 48, column: 26, scope: !812, inlinedAt: !2734)
!2739 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !2740)
!2740 = distinct !DILocation(line: 728, column: 3, scope: !831, inlinedAt: !2741)
!2741 = distinct !DILocation(line: 50, column: 3, scope: !812, inlinedAt: !2734)
!2742 = !DILocation(line: 0, scope: !831, inlinedAt: !2741)
!2743 = !DILocation(line: 726, column: 16, scope: !831, inlinedAt: !2741)
!2744 = !DILocation(line: 0, scope: !829, inlinedAt: !2740)
!2745 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !2740)
!2746 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !2740)
!2747 = !DILocation(line: 0, scope: !850, inlinedAt: !2748)
!2748 = distinct !DILocation(line: 730, column: 3, scope: !831, inlinedAt: !2741)
!2749 = !DILocation(line: 0, scope: !601, inlinedAt: !2750)
!2750 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !2748)
!2751 = !DILocation(line: 0, scope: !858, inlinedAt: !2752)
!2752 = distinct !DILocation(line: 733, column: 3, scope: !831, inlinedAt: !2741)
!2753 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !2752)
!2754 = !DILocation(line: 0, scope: !865, inlinedAt: !2755)
!2755 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !2752)
!2756 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !2755)
!2757 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !2755)
!2758 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !2755)
!2759 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !2755)
!2760 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !2755)
!2761 = !DILocation(line: 439, scope: !883, inlinedAt: !2755)
!2762 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !2755)
!2763 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !2755)
!2764 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !2755)
!2765 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !2755)
!2766 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !2755)
!2767 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !2755)
!2768 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !2755)
!2769 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !2755)
!2770 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !2755)
!2771 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !2755)
!2772 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !2755)
!2773 = distinct !{!2773, !2764, !2774, !255}
!2774 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !2755)
!2775 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !2755)
!2776 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !2755)
!2777 = distinct !{!2777, !2756, !2778, !255}
!2778 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !2755)
!2779 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !2752)
!2780 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !2752)
!2781 = !DILocation(line: 734, column: 1, scope: !831, inlinedAt: !2741)
!2782 = !DILocation(line: 51, column: 1, scope: !812, inlinedAt: !2734)
!2783 = !DILocation(line: 0, scope: !1508, inlinedAt: !2784)
!2784 = distinct !DILocation(line: 248, column: 3, scope: !1448)
!2785 = !DILocation(line: 124, column: 3, scope: !1508, inlinedAt: !2784)
!2786 = !DILocation(line: 249, column: 1, scope: !1448)
!2787 = !DILocation(line: 0, scope: !1021)
!2788 = !DILocation(line: 263, column: 3, scope: !1021)
!2789 = !DILocation(line: 0, scope: !1028, inlinedAt: !2790)
!2790 = distinct !DILocation(line: 264, column: 3, scope: !1021)
!2791 = !DILocation(line: 326, column: 7, scope: !1033, inlinedAt: !2790)
!2792 = !DILocation(line: 326, scope: !1033, inlinedAt: !2790)
!2793 = !DILocation(line: 326, column: 12, scope: !1036, inlinedAt: !2790)
!2794 = !DILocation(line: 326, column: 3, scope: !1033, inlinedAt: !2790)
!2795 = !DILocation(line: 327, column: 35, scope: !1036, inlinedAt: !2790)
!2796 = !DILocation(line: 0, scope: !1040, inlinedAt: !2797)
!2797 = distinct !DILocation(line: 327, column: 20, scope: !1036, inlinedAt: !2790)
!2798 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !2797)
!2799 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !2797)
!2800 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !2797)
!2801 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !2797)
!2802 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !2797)
!2803 = !DILocation(line: 327, column: 5, scope: !1036, inlinedAt: !2790)
!2804 = !DILocation(line: 327, column: 18, scope: !1036, inlinedAt: !2790)
!2805 = !DILocation(line: 326, column: 22, scope: !1036, inlinedAt: !2790)
!2806 = !DILocation(line: 326, column: 3, scope: !1036, inlinedAt: !2790)
!2807 = distinct !{!2807, !2794, !2808, !255}
!2808 = !DILocation(line: 327, column: 47, scope: !1033, inlinedAt: !2790)
!2809 = !DILocation(line: 265, column: 1, scope: !1021)
!2810 = !DILocation(line: 0, scope: !1028)
!2811 = !DILocation(line: 326, column: 7, scope: !1033)
!2812 = !DILocation(line: 326, scope: !1033)
!2813 = !DILocation(line: 326, column: 12, scope: !1036)
!2814 = !DILocation(line: 326, column: 3, scope: !1033)
!2815 = !DILocation(line: 327, column: 35, scope: !1036)
!2816 = !DILocation(line: 0, scope: !1040, inlinedAt: !2817)
!2817 = distinct !DILocation(line: 327, column: 20, scope: !1036)
!2818 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !2817)
!2819 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !2817)
!2820 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !2817)
!2821 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !2817)
!2822 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !2817)
!2823 = !DILocation(line: 327, column: 5, scope: !1036)
!2824 = !DILocation(line: 327, column: 18, scope: !1036)
!2825 = !DILocation(line: 326, column: 22, scope: !1036)
!2826 = !DILocation(line: 326, column: 3, scope: !1036)
!2827 = distinct !{!2827, !2814, !2828, !255}
!2828 = !DILocation(line: 327, column: 47, scope: !1033)
!2829 = !DILocation(line: 328, column: 1, scope: !1028)
!2830 = !DILocation(line: 0, scope: !1638)
!2831 = !DILocation(line: 278, column: 3, scope: !1638)
!2832 = !DILocation(line: 279, column: 1, scope: !1638)
!2833 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !795, file: !795, line: 290, type: !1162, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!2834 = !DILocalVariable(name: "r", arg: 1, scope: !2833, file: !795, line: 290, type: !798)
!2835 = !DILocation(line: 0, scope: !2833)
!2836 = !DILocalVariable(name: "a", arg: 2, scope: !2833, file: !795, line: 290, type: !1164)
!2837 = !DILocalVariable(name: "b", arg: 3, scope: !2833, file: !795, line: 290, type: !1164)
!2838 = !DILocalVariable(name: "i", scope: !2833, file: !795, line: 292, type: !40)
!2839 = !DILocation(line: 293, column: 7, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2833, file: !795, line: 293, column: 3)
!2841 = !DILocation(line: 293, scope: !2840)
!2842 = !DILocation(line: 293, column: 12, scope: !2843)
!2843 = distinct !DILexicalBlock(scope: !2840, file: !795, line: 293, column: 3)
!2844 = !DILocation(line: 293, column: 3, scope: !2840)
!2845 = !DILocation(line: 294, column: 25, scope: !2846)
!2846 = distinct !DILexicalBlock(scope: !2843, file: !795, line: 293, column: 28)
!2847 = !DILocation(line: 294, column: 14, scope: !2846)
!2848 = !DILocation(line: 294, column: 42, scope: !2846)
!2849 = !DILocation(line: 294, column: 31, scope: !2846)
!2850 = !DILocation(line: 294, column: 59, scope: !2846)
!2851 = !DILocation(line: 294, column: 48, scope: !2846)
!2852 = !DILocation(line: 294, column: 72, scope: !2846)
!2853 = !DILocation(line: 294, column: 64, scope: !2846)
!2854 = !DILocation(line: 294, column: 5, scope: !2846)
!2855 = !DILocation(line: 295, column: 25, scope: !2846)
!2856 = !DILocation(line: 295, column: 27, scope: !2846)
!2857 = !DILocation(line: 295, column: 14, scope: !2846)
!2858 = !DILocation(line: 295, column: 44, scope: !2846)
!2859 = !DILocation(line: 295, column: 46, scope: !2846)
!2860 = !DILocation(line: 295, column: 33, scope: !2846)
!2861 = !DILocation(line: 295, column: 63, scope: !2846)
!2862 = !DILocation(line: 295, column: 65, scope: !2846)
!2863 = !DILocation(line: 295, column: 52, scope: !2846)
!2864 = !DILocation(line: 295, column: 79, scope: !2846)
!2865 = !DILocation(line: 295, column: 71, scope: !2846)
!2866 = !DILocation(line: 295, column: 70, scope: !2846)
!2867 = !DILocation(line: 295, column: 5, scope: !2846)
!2868 = !DILocation(line: 293, column: 24, scope: !2843)
!2869 = !DILocation(line: 293, column: 3, scope: !2843)
!2870 = distinct !{!2870, !2844, !2871, !255}
!2871 = !DILocation(line: 296, column: 3, scope: !2840)
!2872 = !DILocation(line: 297, column: 1, scope: !2833)
!2873 = !DILocation(line: 0, scope: !1113)
!2874 = !DILocation(line: 311, column: 7, scope: !1119)
!2875 = !DILocation(line: 311, scope: !1119)
!2876 = !DILocation(line: 311, column: 12, scope: !1122)
!2877 = !DILocation(line: 311, column: 3, scope: !1119)
!2878 = !DILocation(line: 312, column: 47, scope: !1122)
!2879 = !DILocation(line: 312, column: 38, scope: !1122)
!2880 = !DILocation(line: 312, column: 59, scope: !1122)
!2881 = !DILocation(line: 0, scope: !1128, inlinedAt: !2882)
!2882 = distinct !DILocation(line: 312, column: 20, scope: !1122)
!2883 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !2882)
!2884 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !2882)
!2885 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !2882)
!2886 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !2882)
!2887 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !2882)
!2888 = !DILocation(line: 312, column: 5, scope: !1122)
!2889 = !DILocation(line: 312, column: 18, scope: !1122)
!2890 = !DILocation(line: 311, column: 22, scope: !1122)
!2891 = !DILocation(line: 311, column: 3, scope: !1122)
!2892 = distinct !{!2892, !2877, !2893, !255}
!2893 = !DILocation(line: 312, column: 61, scope: !1119)
!2894 = !DILocation(line: 313, column: 1, scope: !1113)
!2895 = !DILocation(line: 0, scope: !1161)
!2896 = !DILocation(line: 342, column: 7, scope: !1172)
!2897 = !DILocation(line: 342, scope: !1172)
!2898 = !DILocation(line: 342, column: 12, scope: !1175)
!2899 = !DILocation(line: 342, column: 3, scope: !1172)
!2900 = !DILocation(line: 343, column: 20, scope: !1175)
!2901 = !DILocation(line: 343, column: 35, scope: !1175)
!2902 = !DILocation(line: 343, column: 33, scope: !1175)
!2903 = !DILocation(line: 343, column: 5, scope: !1175)
!2904 = !DILocation(line: 343, column: 18, scope: !1175)
!2905 = !DILocation(line: 342, column: 22, scope: !1175)
!2906 = !DILocation(line: 342, column: 3, scope: !1175)
!2907 = distinct !{!2907, !2899, !2908, !255}
!2908 = !DILocation(line: 343, column: 46, scope: !1172)
!2909 = !DILocation(line: 344, column: 1, scope: !1161)
!2910 = !DILocation(line: 0, scope: !1855)
!2911 = !DILocation(line: 358, column: 7, scope: !1862)
!2912 = !DILocation(line: 358, scope: !1862)
!2913 = !DILocation(line: 358, column: 12, scope: !1865)
!2914 = !DILocation(line: 358, column: 3, scope: !1862)
!2915 = !DILocation(line: 359, column: 20, scope: !1865)
!2916 = !DILocation(line: 359, column: 35, scope: !1865)
!2917 = !DILocation(line: 359, column: 33, scope: !1865)
!2918 = !DILocation(line: 359, column: 5, scope: !1865)
!2919 = !DILocation(line: 359, column: 18, scope: !1865)
!2920 = !DILocation(line: 358, column: 22, scope: !1865)
!2921 = !DILocation(line: 358, column: 3, scope: !1865)
!2922 = distinct !{!2922, !2914, !2923, !255}
!2923 = !DILocation(line: 359, column: 46, scope: !1862)
!2924 = !DILocation(line: 360, column: 1, scope: !1855)
!2925 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !58, file: !58, line: 80, type: !2926, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2926 = !DISubroutineType(types: !2927)
!2927 = !{null, !716}
!2928 = !DILocalVariable(name: "r", arg: 1, scope: !2925, file: !58, line: 80, type: !716)
!2929 = !DILocation(line: 0, scope: !2925)
!2930 = !DILocalVariable(name: "k", scope: !2925, file: !58, line: 81, type: !40)
!2931 = !DILocalVariable(name: "len", scope: !2925, file: !58, line: 81, type: !40)
!2932 = !DILocation(line: 85, column: 7, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2925, file: !58, line: 85, column: 3)
!2934 = !DILocation(line: 85, scope: !2933)
!2935 = !DILocation(line: 84, column: 5, scope: !2925)
!2936 = !DILocation(line: 85, column: 22, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2933, file: !58, line: 85, column: 3)
!2938 = !DILocation(line: 85, column: 3, scope: !2933)
!2939 = !DILocation(line: 86, column: 5, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2941, file: !58, line: 86, column: 5)
!2941 = distinct !DILexicalBlock(scope: !2937, file: !58, line: 85, column: 39)
!2942 = !DILocation(line: 86, scope: !2940)
!2943 = !DILocalVariable(name: "start", scope: !2925, file: !58, line: 81, type: !40)
!2944 = !DILocation(line: 86, column: 26, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2940, file: !58, line: 86, column: 5)
!2946 = !DILocation(line: 87, column: 14, scope: !2947)
!2947 = distinct !DILexicalBlock(scope: !2945, file: !58, line: 86, column: 50)
!2948 = !DILocalVariable(name: "zeta", scope: !2925, file: !58, line: 82, type: !61)
!2949 = !DILocalVariable(name: "j", scope: !2925, file: !58, line: 81, type: !40)
!2950 = !DILocation(line: 88, column: 11, scope: !2951)
!2951 = distinct !DILexicalBlock(scope: !2947, file: !58, line: 88, column: 7)
!2952 = !DILocation(line: 88, scope: !2951)
!2953 = !DILocation(line: 88, column: 32, scope: !2954)
!2954 = distinct !DILexicalBlock(scope: !2951, file: !58, line: 88, column: 7)
!2955 = !DILocation(line: 88, column: 24, scope: !2954)
!2956 = !DILocation(line: 88, column: 7, scope: !2951)
!2957 = !DILocation(line: 89, column: 25, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2954, file: !58, line: 88, column: 44)
!2959 = !DILocalVariable(name: "a", arg: 1, scope: !2960, file: !58, line: 68, type: !61)
!2960 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !2961, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2961 = !DISubroutineType(types: !2962)
!2962 = !{!61, !61, !61}
!2963 = !DILocation(line: 0, scope: !2960, inlinedAt: !2964)
!2964 = distinct !DILocation(line: 89, column: 13, scope: !2958)
!2965 = !DILocalVariable(name: "b", arg: 2, scope: !2960, file: !58, line: 68, type: !61)
!2966 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !2964)
!2967 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !2964)
!2968 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !2964)
!2969 = !DILocation(line: 0, scope: !1128, inlinedAt: !2970)
!2970 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !2964)
!2971 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !2970)
!2972 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !2970)
!2973 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !2970)
!2974 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !2970)
!2975 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !2970)
!2976 = !DILocalVariable(name: "t", scope: !2925, file: !58, line: 82, type: !61)
!2977 = !DILocation(line: 90, column: 22, scope: !2958)
!2978 = !DILocation(line: 90, column: 27, scope: !2958)
!2979 = !DILocation(line: 90, column: 9, scope: !2958)
!2980 = !DILocation(line: 90, column: 20, scope: !2958)
!2981 = !DILocation(line: 91, column: 16, scope: !2958)
!2982 = !DILocation(line: 91, column: 21, scope: !2958)
!2983 = !DILocation(line: 91, column: 9, scope: !2958)
!2984 = !DILocation(line: 91, column: 14, scope: !2958)
!2985 = !DILocation(line: 88, column: 40, scope: !2954)
!2986 = !DILocation(line: 88, column: 7, scope: !2954)
!2987 = distinct !{!2987, !2956, !2988, !255}
!2988 = !DILocation(line: 92, column: 7, scope: !2951)
!2989 = !DILocation(line: 87, column: 21, scope: !2947)
!2990 = !DILocation(line: 86, column: 43, scope: !2945)
!2991 = !DILocation(line: 86, column: 5, scope: !2945)
!2992 = distinct !{!2992, !2939, !2993, !255}
!2993 = !DILocation(line: 93, column: 5, scope: !2940)
!2994 = !DILocation(line: 85, column: 32, scope: !2937)
!2995 = !DILocation(line: 85, column: 3, scope: !2937)
!2996 = distinct !{!2996, !2938, !2997, !255}
!2997 = !DILocation(line: 94, column: 3, scope: !2933)
!2998 = !DILocation(line: 95, column: 1, scope: !2925)
!2999 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !58, file: !58, line: 106, type: !2926, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3000 = !DILocalVariable(name: "r", arg: 1, scope: !2999, file: !58, line: 106, type: !716)
!3001 = !DILocation(line: 0, scope: !2999)
!3002 = !DILocalVariable(name: "f", scope: !2999, file: !58, line: 109, type: !60)
!3003 = !DILocalVariable(name: "k", scope: !2999, file: !58, line: 107, type: !40)
!3004 = !DILocalVariable(name: "len", scope: !2999, file: !58, line: 107, type: !40)
!3005 = !DILocation(line: 112, column: 7, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2999, file: !58, line: 112, column: 3)
!3007 = !DILocation(line: 112, scope: !3006)
!3008 = !DILocation(line: 111, column: 5, scope: !2999)
!3009 = !DILocation(line: 112, column: 20, scope: !3010)
!3010 = distinct !DILexicalBlock(scope: !3006, file: !58, line: 112, column: 3)
!3011 = !DILocation(line: 112, column: 3, scope: !3006)
!3012 = !DILocation(line: 113, column: 5, scope: !3013)
!3013 = distinct !DILexicalBlock(scope: !3014, file: !58, line: 113, column: 5)
!3014 = distinct !DILexicalBlock(scope: !3010, file: !58, line: 112, column: 39)
!3015 = !DILocation(line: 124, column: 3, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !2999, file: !58, line: 124, column: 3)
!3017 = !DILocation(line: 113, scope: !3013)
!3018 = !DILocalVariable(name: "start", scope: !2999, file: !58, line: 107, type: !40)
!3019 = !DILocation(line: 113, column: 26, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3013, file: !58, line: 113, column: 5)
!3021 = !DILocation(line: 114, column: 14, scope: !3022)
!3022 = distinct !DILexicalBlock(scope: !3020, file: !58, line: 113, column: 50)
!3023 = !DILocalVariable(name: "zeta", scope: !2999, file: !58, line: 108, type: !61)
!3024 = !DILocalVariable(name: "j", scope: !2999, file: !58, line: 107, type: !40)
!3025 = !DILocation(line: 115, column: 11, scope: !3026)
!3026 = distinct !DILexicalBlock(scope: !3022, file: !58, line: 115, column: 7)
!3027 = !DILocation(line: 115, scope: !3026)
!3028 = !DILocation(line: 115, column: 32, scope: !3029)
!3029 = distinct !DILexicalBlock(scope: !3026, file: !58, line: 115, column: 7)
!3030 = !DILocation(line: 115, column: 24, scope: !3029)
!3031 = !DILocation(line: 115, column: 7, scope: !3026)
!3032 = !DILocation(line: 116, column: 13, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3029, file: !58, line: 115, column: 44)
!3034 = !DILocalVariable(name: "t", scope: !2999, file: !58, line: 108, type: !61)
!3035 = !DILocation(line: 117, column: 35, scope: !3033)
!3036 = !DILocation(line: 117, column: 33, scope: !3033)
!3037 = !DILocation(line: 0, scope: !1040, inlinedAt: !3038)
!3038 = distinct !DILocation(line: 117, column: 16, scope: !3033)
!3039 = !DILocation(line: 39, column: 20, scope: !1040, inlinedAt: !3038)
!3040 = !DILocation(line: 39, column: 19, scope: !1040, inlinedAt: !3038)
!3041 = !DILocation(line: 39, column: 22, scope: !1040, inlinedAt: !3038)
!3042 = !DILocation(line: 39, column: 33, scope: !1040, inlinedAt: !3038)
!3043 = !DILocation(line: 41, column: 10, scope: !1040, inlinedAt: !3038)
!3044 = !DILocation(line: 117, column: 9, scope: !3033)
!3045 = !DILocation(line: 117, column: 14, scope: !3033)
!3046 = !DILocation(line: 118, column: 22, scope: !3033)
!3047 = !DILocation(line: 118, column: 33, scope: !3033)
!3048 = !DILocation(line: 118, column: 9, scope: !3033)
!3049 = !DILocation(line: 118, column: 20, scope: !3033)
!3050 = !DILocation(line: 119, column: 34, scope: !3033)
!3051 = !DILocation(line: 0, scope: !2960, inlinedAt: !3052)
!3052 = distinct !DILocation(line: 119, column: 22, scope: !3033)
!3053 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3052)
!3054 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3052)
!3055 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3052)
!3056 = !DILocation(line: 0, scope: !1128, inlinedAt: !3057)
!3057 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3052)
!3058 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3057)
!3059 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3057)
!3060 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3057)
!3061 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3057)
!3062 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3057)
!3063 = !DILocation(line: 119, column: 9, scope: !3033)
!3064 = !DILocation(line: 119, column: 20, scope: !3033)
!3065 = !DILocation(line: 115, column: 40, scope: !3029)
!3066 = !DILocation(line: 115, column: 7, scope: !3029)
!3067 = distinct !{!3067, !3031, !3068, !255}
!3068 = !DILocation(line: 120, column: 7, scope: !3026)
!3069 = !DILocation(line: 114, column: 21, scope: !3022)
!3070 = !DILocation(line: 113, column: 43, scope: !3020)
!3071 = !DILocation(line: 113, column: 5, scope: !3020)
!3072 = distinct !{!3072, !3012, !3073, !255}
!3073 = !DILocation(line: 121, column: 5, scope: !3013)
!3074 = !DILocation(line: 112, column: 32, scope: !3010)
!3075 = !DILocation(line: 112, column: 3, scope: !3010)
!3076 = distinct !{!3076, !3011, !3077, !255}
!3077 = !DILocation(line: 122, column: 3, scope: !3006)
!3078 = !DILocation(line: 124, scope: !3016)
!3079 = !DILocation(line: 124, column: 16, scope: !3080)
!3080 = distinct !DILexicalBlock(scope: !3016, file: !58, line: 124, column: 3)
!3081 = !DILocation(line: 125, column: 18, scope: !3080)
!3082 = !DILocation(line: 0, scope: !2960, inlinedAt: !3083)
!3083 = distinct !DILocation(line: 125, column: 12, scope: !3080)
!3084 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3083)
!3085 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3083)
!3086 = !DILocation(line: 0, scope: !1128, inlinedAt: !3087)
!3087 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3083)
!3088 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3087)
!3089 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3087)
!3090 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3087)
!3091 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3087)
!3092 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3087)
!3093 = !DILocation(line: 125, column: 5, scope: !3080)
!3094 = !DILocation(line: 125, column: 10, scope: !3080)
!3095 = !DILocation(line: 124, column: 24, scope: !3080)
!3096 = !DILocation(line: 124, column: 3, scope: !3080)
!3097 = distinct !{!3097, !3015, !3098, !255}
!3098 = !DILocation(line: 125, column: 25, scope: !3016)
!3099 = !DILocation(line: 126, column: 1, scope: !2999)
!3100 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !58, file: !58, line: 139, type: !3101, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!3101 = !DISubroutineType(types: !3102)
!3102 = !{null, !716, !3103, !3103, !61}
!3103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!3104 = !DILocalVariable(name: "r", arg: 1, scope: !3100, file: !58, line: 139, type: !716)
!3105 = !DILocation(line: 0, scope: !3100)
!3106 = !DILocalVariable(name: "a", arg: 2, scope: !3100, file: !58, line: 139, type: !3103)
!3107 = !DILocalVariable(name: "b", arg: 3, scope: !3100, file: !58, line: 139, type: !3103)
!3108 = !DILocalVariable(name: "zeta", arg: 4, scope: !3100, file: !58, line: 139, type: !61)
!3109 = !DILocation(line: 141, column: 17, scope: !3100)
!3110 = !DILocation(line: 141, column: 23, scope: !3100)
!3111 = !DILocation(line: 0, scope: !2960, inlinedAt: !3112)
!3112 = distinct !DILocation(line: 141, column: 11, scope: !3100)
!3113 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3112)
!3114 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3112)
!3115 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3112)
!3116 = !DILocation(line: 0, scope: !1128, inlinedAt: !3117)
!3117 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3112)
!3118 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3117)
!3119 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3117)
!3120 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3117)
!3121 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3117)
!3122 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3117)
!3123 = !DILocation(line: 141, column: 9, scope: !3100)
!3124 = !DILocation(line: 0, scope: !2960, inlinedAt: !3125)
!3125 = distinct !DILocation(line: 142, column: 11, scope: !3100)
!3126 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3125)
!3127 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3125)
!3128 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3125)
!3129 = !DILocation(line: 0, scope: !1128, inlinedAt: !3130)
!3130 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3125)
!3131 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3130)
!3132 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3130)
!3133 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3130)
!3134 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3130)
!3135 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3130)
!3136 = !DILocation(line: 142, column: 9, scope: !3100)
!3137 = !DILocation(line: 143, column: 17, scope: !3100)
!3138 = !DILocation(line: 143, column: 23, scope: !3100)
!3139 = !DILocation(line: 0, scope: !2960, inlinedAt: !3140)
!3140 = distinct !DILocation(line: 143, column: 11, scope: !3100)
!3141 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3140)
!3142 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3140)
!3143 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3140)
!3144 = !DILocation(line: 0, scope: !1128, inlinedAt: !3145)
!3145 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3140)
!3146 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3145)
!3147 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3145)
!3148 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3145)
!3149 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3145)
!3150 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3145)
!3151 = !DILocation(line: 143, column: 8, scope: !3100)
!3152 = !DILocation(line: 144, column: 17, scope: !3100)
!3153 = !DILocation(line: 144, column: 23, scope: !3100)
!3154 = !DILocation(line: 0, scope: !2960, inlinedAt: !3155)
!3155 = distinct !DILocation(line: 144, column: 11, scope: !3100)
!3156 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3155)
!3157 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3155)
!3158 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3155)
!3159 = !DILocation(line: 0, scope: !1128, inlinedAt: !3160)
!3160 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3155)
!3161 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3160)
!3162 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3160)
!3163 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3160)
!3164 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3160)
!3165 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3160)
!3166 = !DILocation(line: 144, column: 3, scope: !3100)
!3167 = !DILocation(line: 144, column: 9, scope: !3100)
!3168 = !DILocation(line: 145, column: 17, scope: !3100)
!3169 = !DILocation(line: 145, column: 23, scope: !3100)
!3170 = !DILocation(line: 0, scope: !2960, inlinedAt: !3171)
!3171 = distinct !DILocation(line: 145, column: 11, scope: !3100)
!3172 = !DILocation(line: 69, column: 28, scope: !2960, inlinedAt: !3171)
!3173 = !DILocation(line: 69, column: 39, scope: !2960, inlinedAt: !3171)
!3174 = !DILocation(line: 69, column: 38, scope: !2960, inlinedAt: !3171)
!3175 = !DILocation(line: 0, scope: !1128, inlinedAt: !3176)
!3176 = distinct !DILocation(line: 69, column: 10, scope: !2960, inlinedAt: !3171)
!3177 = !DILocation(line: 21, column: 12, scope: !1128, inlinedAt: !3176)
!3178 = !DILocation(line: 21, column: 22, scope: !1128, inlinedAt: !3176)
!3179 = !DILocation(line: 21, column: 10, scope: !1128, inlinedAt: !3176)
!3180 = !DILocation(line: 21, column: 32, scope: !1128, inlinedAt: !3176)
!3181 = !DILocation(line: 21, column: 7, scope: !1128, inlinedAt: !3176)
!3182 = !DILocation(line: 145, column: 3, scope: !3100)
!3183 = !DILocation(line: 145, column: 8, scope: !3100)
!3184 = !DILocation(line: 146, column: 1, scope: !3100)
!3185 = !DILocation(line: 0, scope: !909)
!3186 = !DILocation(line: 113, column: 3, scope: !909)
!3187 = !DILocation(line: 119, column: 1, scope: !909)
!3188 = distinct !DISubprogram(name: "cbd2", scope: !910, file: !910, line: 58, type: !911, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3189 = !DILocalVariable(name: "r", arg: 1, scope: !3188, file: !910, line: 58, type: !913)
!3190 = !DILocation(line: 0, scope: !3188)
!3191 = !DILocalVariable(name: "buf", arg: 2, scope: !3188, file: !910, line: 58, type: !157)
!3192 = !DILocalVariable(name: "i", scope: !3188, file: !910, line: 60, type: !40)
!3193 = !DILocation(line: 64, column: 7, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3188, file: !910, line: 64, column: 3)
!3195 = !DILocation(line: 64, scope: !3194)
!3196 = !DILocation(line: 64, column: 12, scope: !3197)
!3197 = distinct !DILexicalBlock(scope: !3194, file: !910, line: 64, column: 3)
!3198 = !DILocation(line: 64, column: 3, scope: !3194)
!3199 = !DILocation(line: 65, column: 35, scope: !3200)
!3200 = distinct !DILexicalBlock(scope: !3197, file: !910, line: 64, column: 28)
!3201 = !DILocation(line: 65, column: 33, scope: !3200)
!3202 = !DILocalVariable(name: "x", arg: 1, scope: !3203, file: !910, line: 15, type: !157)
!3203 = distinct !DISubprogram(name: "load32_littleendian", scope: !910, file: !910, line: 15, type: !3204, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!3204 = !DISubroutineType(types: !3205)
!3205 = !{!91, !157}
!3206 = !DILocation(line: 0, scope: !3203, inlinedAt: !3207)
!3207 = distinct !DILocation(line: 65, column: 10, scope: !3200)
!3208 = !DILocation(line: 18, column: 18, scope: !3203, inlinedAt: !3207)
!3209 = !DILocation(line: 18, column: 8, scope: !3203, inlinedAt: !3207)
!3210 = !DILocalVariable(name: "r", scope: !3203, file: !910, line: 17, type: !91)
!3211 = !DILocation(line: 19, column: 18, scope: !3203, inlinedAt: !3207)
!3212 = !DILocation(line: 19, column: 8, scope: !3203, inlinedAt: !3207)
!3213 = !DILocation(line: 19, column: 23, scope: !3203, inlinedAt: !3207)
!3214 = !DILocation(line: 19, column: 5, scope: !3203, inlinedAt: !3207)
!3215 = !DILocation(line: 20, column: 18, scope: !3203, inlinedAt: !3207)
!3216 = !DILocation(line: 20, column: 8, scope: !3203, inlinedAt: !3207)
!3217 = !DILocation(line: 20, column: 23, scope: !3203, inlinedAt: !3207)
!3218 = !DILocation(line: 20, column: 5, scope: !3203, inlinedAt: !3207)
!3219 = !DILocation(line: 21, column: 18, scope: !3203, inlinedAt: !3207)
!3220 = !DILocation(line: 21, column: 8, scope: !3203, inlinedAt: !3207)
!3221 = !DILocation(line: 21, column: 23, scope: !3203, inlinedAt: !3207)
!3222 = !DILocation(line: 21, column: 5, scope: !3203, inlinedAt: !3207)
!3223 = !DILocalVariable(name: "t", scope: !3188, file: !910, line: 61, type: !91)
!3224 = !DILocation(line: 66, column: 12, scope: !3200)
!3225 = !DILocalVariable(name: "d", scope: !3188, file: !910, line: 61, type: !91)
!3226 = !DILocation(line: 67, column: 12, scope: !3200)
!3227 = !DILocation(line: 67, column: 17, scope: !3200)
!3228 = !DILocation(line: 67, column: 7, scope: !3200)
!3229 = !DILocalVariable(name: "j", scope: !3188, file: !910, line: 60, type: !40)
!3230 = !DILocation(line: 69, column: 9, scope: !3231)
!3231 = distinct !DILexicalBlock(scope: !3200, file: !910, line: 69, column: 5)
!3232 = !DILocation(line: 69, scope: !3231)
!3233 = !DILocation(line: 69, column: 14, scope: !3234)
!3234 = distinct !DILexicalBlock(scope: !3231, file: !910, line: 69, column: 5)
!3235 = !DILocation(line: 69, column: 5, scope: !3231)
!3236 = !DILocation(line: 70, column: 19, scope: !3237)
!3237 = distinct !DILexicalBlock(scope: !3234, file: !910, line: 69, column: 22)
!3238 = !DILocation(line: 70, column: 14, scope: !3237)
!3239 = !DILocation(line: 70, column: 11, scope: !3237)
!3240 = !DILocalVariable(name: "a", scope: !3188, file: !910, line: 62, type: !61)
!3241 = !DILocation(line: 71, column: 19, scope: !3237)
!3242 = !DILocation(line: 71, column: 21, scope: !3237)
!3243 = !DILocation(line: 71, column: 14, scope: !3237)
!3244 = !DILocation(line: 71, column: 11, scope: !3237)
!3245 = !DILocalVariable(name: "b", scope: !3188, file: !910, line: 62, type: !61)
!3246 = !DILocation(line: 72, column: 28, scope: !3237)
!3247 = !DILocation(line: 72, column: 26, scope: !3237)
!3248 = !DILocation(line: 72, column: 18, scope: !3237)
!3249 = !DILocation(line: 72, column: 20, scope: !3237)
!3250 = !DILocation(line: 72, column: 7, scope: !3237)
!3251 = !DILocation(line: 72, column: 24, scope: !3237)
!3252 = !DILocation(line: 69, column: 18, scope: !3234)
!3253 = !DILocation(line: 69, column: 5, scope: !3234)
!3254 = distinct !{!3254, !3235, !3255, !255}
!3255 = !DILocation(line: 73, column: 5, scope: !3231)
!3256 = !DILocation(line: 64, column: 24, scope: !3197)
!3257 = !DILocation(line: 64, column: 3, scope: !3197)
!3258 = distinct !{!3258, !3198, !3259, !255}
!3259 = !DILocation(line: 74, column: 3, scope: !3194)
!3260 = !DILocation(line: 75, column: 1, scope: !3188)
!3261 = !DILocation(line: 0, scope: !1508)
!3262 = !DILocation(line: 124, column: 3, scope: !1508)
!3263 = !DILocation(line: 128, column: 1, scope: !1508)
!3264 = !DILocation(line: 0, scope: !1128)
!3265 = !DILocation(line: 21, column: 12, scope: !1128)
!3266 = !DILocation(line: 21, column: 22, scope: !1128)
!3267 = !DILocation(line: 21, column: 10, scope: !1128)
!3268 = !DILocation(line: 21, column: 32, scope: !1128)
!3269 = !DILocation(line: 21, column: 7, scope: !1128)
!3270 = !DILocation(line: 22, column: 3, scope: !1128)
!3271 = !DILocation(line: 0, scope: !1040)
!3272 = !DILocation(line: 39, column: 20, scope: !1040)
!3273 = !DILocation(line: 39, column: 19, scope: !1040)
!3274 = !DILocation(line: 39, column: 22, scope: !1040)
!3275 = !DILocation(line: 39, column: 33, scope: !1040)
!3276 = !DILocation(line: 41, column: 10, scope: !1040)
!3277 = !DILocation(line: 41, column: 3, scope: !1040)
!3278 = !DILocation(line: 0, scope: !414)
!3279 = !DILocation(line: 21, column: 7, scope: !425)
!3280 = !DILocation(line: 21, scope: !425)
!3281 = !DILocation(line: 21, column: 12, scope: !428)
!3282 = !DILocation(line: 21, column: 3, scope: !425)
!3283 = !DILocation(line: 22, column: 10, scope: !428)
!3284 = !DILocation(line: 22, column: 17, scope: !428)
!3285 = !DILocation(line: 22, column: 15, scope: !428)
!3286 = !DILocation(line: 22, column: 7, scope: !428)
!3287 = !DILocation(line: 21, column: 18, scope: !428)
!3288 = !DILocation(line: 21, column: 3, scope: !428)
!3289 = distinct !{!3289, !3282, !3290, !255}
!3290 = !DILocation(line: 22, column: 20, scope: !425)
!3291 = !DILocation(line: 24, column: 25, scope: !414)
!3292 = !DILocation(line: 24, column: 10, scope: !414)
!3293 = !DILocation(line: 24, column: 3, scope: !414)
!3294 = !DILocation(line: 0, scope: !443)
!3295 = !DILocation(line: 51, column: 3, scope: !443)
!3296 = !DILocation(line: 54, column: 7, scope: !443)
!3297 = !DILocation(line: 55, column: 7, scope: !456)
!3298 = !DILocation(line: 55, scope: !456)
!3299 = !DILocation(line: 55, column: 12, scope: !459)
!3300 = !DILocation(line: 55, column: 3, scope: !456)
!3301 = !DILocation(line: 56, column: 18, scope: !459)
!3302 = !DILocation(line: 56, column: 25, scope: !459)
!3303 = !DILocation(line: 56, column: 23, scope: !459)
!3304 = !DILocation(line: 56, column: 15, scope: !459)
!3305 = !DILocation(line: 56, column: 5, scope: !459)
!3306 = !DILocation(line: 56, column: 10, scope: !459)
!3307 = !DILocation(line: 55, column: 18, scope: !459)
!3308 = !DILocation(line: 55, column: 3, scope: !459)
!3309 = distinct !{!3309, !3300, !3310, !255}
!3310 = !DILocation(line: 56, column: 29, scope: !456)
!3311 = !DILocation(line: 57, column: 1, scope: !443)
!3312 = !DILocation(line: 0, scope: !1352)
!3313 = !DILocation(line: 73, column: 7, scope: !1352)
!3314 = !DILocation(line: 74, column: 15, scope: !1352)
!3315 = !DILocation(line: 74, column: 19, scope: !1352)
!3316 = !DILocation(line: 74, column: 11, scope: !1352)
!3317 = !DILocation(line: 74, column: 6, scope: !1352)
!3318 = !DILocation(line: 75, column: 1, scope: !1352)
!3319 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !3320, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3320 = !DISubroutineType(types: !3321)
!3321 = !{null, !563}
!3322 = !DILocalVariable(name: "state", arg: 1, scope: !3319, file: !74, line: 523, type: !563)
!3323 = !DILocation(line: 0, scope: !3319)
!3324 = !DILocalVariable(name: "s", arg: 1, scope: !3325, file: !74, line: 353, type: !604)
!3325 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !3326, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3326 = !DISubroutineType(types: !3327)
!3327 = !{null, !604}
!3328 = !DILocation(line: 0, scope: !3325, inlinedAt: !3329)
!3329 = distinct !DILocation(line: 525, column: 3, scope: !3319)
!3330 = !DILocalVariable(name: "i", scope: !3325, file: !74, line: 355, type: !40)
!3331 = !DILocation(line: 356, column: 7, scope: !3332, inlinedAt: !3329)
!3332 = distinct !DILexicalBlock(scope: !3325, file: !74, line: 356, column: 3)
!3333 = !DILocation(line: 356, scope: !3332, inlinedAt: !3329)
!3334 = !DILocation(line: 356, column: 12, scope: !3335, inlinedAt: !3329)
!3335 = distinct !DILexicalBlock(scope: !3332, file: !74, line: 356, column: 3)
!3336 = !DILocation(line: 356, column: 3, scope: !3332, inlinedAt: !3329)
!3337 = !DILocation(line: 357, column: 5, scope: !3335, inlinedAt: !3329)
!3338 = !DILocation(line: 357, column: 10, scope: !3335, inlinedAt: !3329)
!3339 = !DILocation(line: 356, column: 17, scope: !3335, inlinedAt: !3329)
!3340 = !DILocation(line: 356, column: 3, scope: !3335, inlinedAt: !3329)
!3341 = distinct !{!3341, !3336, !3342, !255}
!3342 = !DILocation(line: 357, column: 12, scope: !3332, inlinedAt: !3329)
!3343 = !DILocation(line: 526, column: 10, scope: !3319)
!3344 = !DILocation(line: 526, column: 14, scope: !3319)
!3345 = !DILocation(line: 527, column: 1, scope: !3319)
!3346 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !561, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3347 = !DILocalVariable(name: "state", arg: 1, scope: !3346, file: !74, line: 538, type: !563)
!3348 = !DILocation(line: 0, scope: !3346)
!3349 = !DILocalVariable(name: "in", arg: 2, scope: !3346, file: !74, line: 538, type: !157)
!3350 = !DILocalVariable(name: "inlen", arg: 3, scope: !3346, file: !74, line: 538, type: !38)
!3351 = !DILocation(line: 540, column: 47, scope: !3346)
!3352 = !DILocation(line: 540, column: 16, scope: !3346)
!3353 = !DILocation(line: 540, column: 10, scope: !3346)
!3354 = !DILocation(line: 540, column: 14, scope: !3346)
!3355 = !DILocation(line: 541, column: 1, scope: !3346)
!3356 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !3357, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3357 = !DISubroutineType(types: !3358)
!3358 = !{!40, !604, !40, !40, !157, !38}
!3359 = !DILocalVariable(name: "s", arg: 1, scope: !3356, file: !74, line: 373, type: !604)
!3360 = !DILocation(line: 0, scope: !3356)
!3361 = !DILocalVariable(name: "pos", arg: 2, scope: !3356, file: !74, line: 374, type: !40)
!3362 = !DILocalVariable(name: "r", arg: 3, scope: !3356, file: !74, line: 375, type: !40)
!3363 = !DILocalVariable(name: "in", arg: 4, scope: !3356, file: !74, line: 376, type: !157)
!3364 = !DILocalVariable(name: "inlen", arg: 5, scope: !3356, file: !74, line: 377, type: !38)
!3365 = !DILocation(line: 381, column: 3, scope: !3356)
!3366 = !DILocation(line: 381, column: 12, scope: !3356)
!3367 = !DILocation(line: 381, column: 19, scope: !3356)
!3368 = !DILocation(line: 382, column: 5, scope: !3369)
!3369 = distinct !DILexicalBlock(scope: !3370, file: !74, line: 382, column: 5)
!3370 = distinct !DILexicalBlock(scope: !3356, file: !74, line: 381, column: 25)
!3371 = !DILocation(line: 389, column: 3, scope: !3372)
!3372 = distinct !DILexicalBlock(scope: !3356, file: !74, line: 389, column: 3)
!3373 = !DILocation(line: 382, scope: !3369)
!3374 = !DILocalVariable(name: "i", scope: !3356, file: !74, line: 379, type: !40)
!3375 = !DILocation(line: 382, column: 16, scope: !3376)
!3376 = distinct !DILexicalBlock(scope: !3369, file: !74, line: 382, column: 5)
!3377 = !DILocation(line: 383, column: 27, scope: !3376)
!3378 = !DILocation(line: 383, column: 17, scope: !3376)
!3379 = !DILocation(line: 383, column: 37, scope: !3376)
!3380 = !DILocation(line: 383, column: 33, scope: !3376)
!3381 = !DILocation(line: 383, column: 10, scope: !3376)
!3382 = !DILocation(line: 383, column: 7, scope: !3376)
!3383 = !DILocation(line: 383, column: 14, scope: !3376)
!3384 = !DILocation(line: 383, column: 30, scope: !3376)
!3385 = !DILocation(line: 382, column: 20, scope: !3376)
!3386 = !DILocation(line: 382, column: 5, scope: !3376)
!3387 = distinct !{!3387, !3368, !3388, !255}
!3388 = !DILocation(line: 383, column: 42, scope: !3369)
!3389 = !DILocation(line: 384, column: 15, scope: !3370)
!3390 = !DILocation(line: 384, column: 11, scope: !3370)
!3391 = !DILocation(line: 385, column: 5, scope: !3370)
!3392 = distinct !{!3392, !3365, !3393, !255}
!3393 = !DILocation(line: 387, column: 3, scope: !3356)
!3394 = !DILocation(line: 389, scope: !3372)
!3395 = !DILocation(line: 389, column: 18, scope: !3396)
!3396 = distinct !DILexicalBlock(scope: !3372, file: !74, line: 389, column: 3)
!3397 = !DILocation(line: 389, column: 14, scope: !3396)
!3398 = !DILocation(line: 390, column: 25, scope: !3396)
!3399 = !DILocation(line: 390, column: 15, scope: !3396)
!3400 = !DILocation(line: 390, column: 35, scope: !3396)
!3401 = !DILocation(line: 390, column: 31, scope: !3396)
!3402 = !DILocation(line: 390, column: 8, scope: !3396)
!3403 = !DILocation(line: 390, column: 5, scope: !3396)
!3404 = !DILocation(line: 390, column: 12, scope: !3396)
!3405 = !DILocation(line: 390, column: 28, scope: !3396)
!3406 = !DILocation(line: 389, column: 26, scope: !3396)
!3407 = !DILocation(line: 389, column: 3, scope: !3396)
!3408 = distinct !{!3408, !3371, !3409, !255}
!3409 = !DILocation(line: 390, column: 40, scope: !3372)
!3410 = !DILocation(line: 392, column: 3, scope: !3356)
!3411 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !3326, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3412 = !DILocalVariable(name: "state", arg: 1, scope: !3411, file: !74, line: 82, type: !604)
!3413 = !DILocation(line: 0, scope: !3411)
!3414 = !DILocation(line: 100, column: 15, scope: !3411)
!3415 = !DILocalVariable(name: "Aba", scope: !3411, file: !74, line: 86, type: !70)
!3416 = !DILocation(line: 101, column: 15, scope: !3411)
!3417 = !DILocalVariable(name: "Abe", scope: !3411, file: !74, line: 86, type: !70)
!3418 = !DILocation(line: 102, column: 15, scope: !3411)
!3419 = !DILocalVariable(name: "Abi", scope: !3411, file: !74, line: 86, type: !70)
!3420 = !DILocation(line: 103, column: 15, scope: !3411)
!3421 = !DILocalVariable(name: "Abo", scope: !3411, file: !74, line: 86, type: !70)
!3422 = !DILocation(line: 104, column: 15, scope: !3411)
!3423 = !DILocalVariable(name: "Abu", scope: !3411, file: !74, line: 86, type: !70)
!3424 = !DILocation(line: 105, column: 15, scope: !3411)
!3425 = !DILocalVariable(name: "Aga", scope: !3411, file: !74, line: 87, type: !70)
!3426 = !DILocation(line: 106, column: 15, scope: !3411)
!3427 = !DILocalVariable(name: "Age", scope: !3411, file: !74, line: 87, type: !70)
!3428 = !DILocation(line: 107, column: 15, scope: !3411)
!3429 = !DILocalVariable(name: "Agi", scope: !3411, file: !74, line: 87, type: !70)
!3430 = !DILocation(line: 108, column: 15, scope: !3411)
!3431 = !DILocalVariable(name: "Ago", scope: !3411, file: !74, line: 87, type: !70)
!3432 = !DILocation(line: 109, column: 15, scope: !3411)
!3433 = !DILocalVariable(name: "Agu", scope: !3411, file: !74, line: 87, type: !70)
!3434 = !DILocation(line: 110, column: 15, scope: !3411)
!3435 = !DILocalVariable(name: "Aka", scope: !3411, file: !74, line: 88, type: !70)
!3436 = !DILocation(line: 111, column: 15, scope: !3411)
!3437 = !DILocalVariable(name: "Ake", scope: !3411, file: !74, line: 88, type: !70)
!3438 = !DILocation(line: 112, column: 15, scope: !3411)
!3439 = !DILocalVariable(name: "Aki", scope: !3411, file: !74, line: 88, type: !70)
!3440 = !DILocation(line: 113, column: 15, scope: !3411)
!3441 = !DILocalVariable(name: "Ako", scope: !3411, file: !74, line: 88, type: !70)
!3442 = !DILocation(line: 114, column: 15, scope: !3411)
!3443 = !DILocalVariable(name: "Aku", scope: !3411, file: !74, line: 88, type: !70)
!3444 = !DILocation(line: 115, column: 15, scope: !3411)
!3445 = !DILocalVariable(name: "Ama", scope: !3411, file: !74, line: 89, type: !70)
!3446 = !DILocation(line: 116, column: 15, scope: !3411)
!3447 = !DILocalVariable(name: "Ame", scope: !3411, file: !74, line: 89, type: !70)
!3448 = !DILocation(line: 117, column: 15, scope: !3411)
!3449 = !DILocalVariable(name: "Ami", scope: !3411, file: !74, line: 89, type: !70)
!3450 = !DILocation(line: 118, column: 15, scope: !3411)
!3451 = !DILocalVariable(name: "Amo", scope: !3411, file: !74, line: 89, type: !70)
!3452 = !DILocation(line: 119, column: 15, scope: !3411)
!3453 = !DILocalVariable(name: "Amu", scope: !3411, file: !74, line: 89, type: !70)
!3454 = !DILocation(line: 120, column: 15, scope: !3411)
!3455 = !DILocalVariable(name: "Asa", scope: !3411, file: !74, line: 90, type: !70)
!3456 = !DILocation(line: 121, column: 15, scope: !3411)
!3457 = !DILocalVariable(name: "Ase", scope: !3411, file: !74, line: 90, type: !70)
!3458 = !DILocation(line: 122, column: 15, scope: !3411)
!3459 = !DILocalVariable(name: "Asi", scope: !3411, file: !74, line: 90, type: !70)
!3460 = !DILocation(line: 123, column: 15, scope: !3411)
!3461 = !DILocalVariable(name: "Aso", scope: !3411, file: !74, line: 90, type: !70)
!3462 = !DILocation(line: 124, column: 15, scope: !3411)
!3463 = !DILocalVariable(name: "Asu", scope: !3411, file: !74, line: 90, type: !70)
!3464 = !DILocalVariable(name: "round", scope: !3411, file: !74, line: 84, type: !50)
!3465 = !DILocation(line: 126, column: 13, scope: !3466)
!3466 = distinct !DILexicalBlock(scope: !3411, file: !74, line: 126, column: 9)
!3467 = !DILocation(line: 126, scope: !3466)
!3468 = !DILocation(line: 126, column: 30, scope: !3469)
!3469 = distinct !DILexicalBlock(scope: !3466, file: !74, line: 126, column: 9)
!3470 = !DILocation(line: 126, column: 9, scope: !3466)
!3471 = !DILocalVariable(name: "BCa", scope: !3411, file: !74, line: 91, type: !70)
!3472 = !DILocalVariable(name: "BCe", scope: !3411, file: !74, line: 91, type: !70)
!3473 = !DILocalVariable(name: "BCi", scope: !3411, file: !74, line: 91, type: !70)
!3474 = !DILocalVariable(name: "BCo", scope: !3411, file: !74, line: 91, type: !70)
!3475 = !DILocalVariable(name: "BCu", scope: !3411, file: !74, line: 91, type: !70)
!3476 = !DILocalVariable(name: "Da", scope: !3411, file: !74, line: 92, type: !70)
!3477 = !DILocalVariable(name: "De", scope: !3411, file: !74, line: 92, type: !70)
!3478 = !DILocalVariable(name: "Di", scope: !3411, file: !74, line: 92, type: !70)
!3479 = !DILocalVariable(name: "Do", scope: !3411, file: !74, line: 92, type: !70)
!3480 = !DILocalVariable(name: "Du", scope: !3411, file: !74, line: 92, type: !70)
!3481 = !DILocalVariable(name: "Eba", scope: !3411, file: !74, line: 93, type: !70)
!3482 = !DILocalVariable(name: "Ebe", scope: !3411, file: !74, line: 93, type: !70)
!3483 = !DILocalVariable(name: "Ebi", scope: !3411, file: !74, line: 93, type: !70)
!3484 = !DILocalVariable(name: "Ebo", scope: !3411, file: !74, line: 93, type: !70)
!3485 = !DILocalVariable(name: "Ebu", scope: !3411, file: !74, line: 93, type: !70)
!3486 = !DILocalVariable(name: "Ega", scope: !3411, file: !74, line: 94, type: !70)
!3487 = !DILocalVariable(name: "Ege", scope: !3411, file: !74, line: 94, type: !70)
!3488 = !DILocalVariable(name: "Egi", scope: !3411, file: !74, line: 94, type: !70)
!3489 = !DILocalVariable(name: "Ego", scope: !3411, file: !74, line: 94, type: !70)
!3490 = !DILocalVariable(name: "Egu", scope: !3411, file: !74, line: 94, type: !70)
!3491 = !DILocalVariable(name: "Eka", scope: !3411, file: !74, line: 95, type: !70)
!3492 = !DILocalVariable(name: "Eke", scope: !3411, file: !74, line: 95, type: !70)
!3493 = !DILocalVariable(name: "Eki", scope: !3411, file: !74, line: 95, type: !70)
!3494 = !DILocalVariable(name: "Eko", scope: !3411, file: !74, line: 95, type: !70)
!3495 = !DILocalVariable(name: "Eku", scope: !3411, file: !74, line: 95, type: !70)
!3496 = !DILocalVariable(name: "Ema", scope: !3411, file: !74, line: 96, type: !70)
!3497 = !DILocalVariable(name: "Eme", scope: !3411, file: !74, line: 96, type: !70)
!3498 = !DILocalVariable(name: "Emi", scope: !3411, file: !74, line: 96, type: !70)
!3499 = !DILocalVariable(name: "Emo", scope: !3411, file: !74, line: 96, type: !70)
!3500 = !DILocalVariable(name: "Emu", scope: !3411, file: !74, line: 96, type: !70)
!3501 = !DILocalVariable(name: "Esa", scope: !3411, file: !74, line: 97, type: !70)
!3502 = !DILocalVariable(name: "Ese", scope: !3411, file: !74, line: 97, type: !70)
!3503 = !DILocalVariable(name: "Esi", scope: !3411, file: !74, line: 97, type: !70)
!3504 = !DILocalVariable(name: "Eso", scope: !3411, file: !74, line: 97, type: !70)
!3505 = !DILocalVariable(name: "Esu", scope: !3411, file: !74, line: 97, type: !70)
!3506 = !DILocation(line: 130, column: 22, scope: !3507)
!3507 = distinct !DILexicalBlock(scope: !3469, file: !74, line: 126, column: 53)
!3508 = !DILocation(line: 130, column: 26, scope: !3507)
!3509 = !DILocation(line: 130, column: 30, scope: !3507)
!3510 = !DILocation(line: 130, column: 34, scope: !3507)
!3511 = !DILocation(line: 132, column: 22, scope: !3507)
!3512 = !DILocation(line: 132, column: 26, scope: !3507)
!3513 = !DILocation(line: 132, column: 30, scope: !3507)
!3514 = !DILocation(line: 132, column: 34, scope: !3507)
!3515 = !DILocation(line: 138, column: 22, scope: !3507)
!3516 = !DILocation(line: 138, column: 21, scope: !3507)
!3517 = !DILocation(line: 208, column: 17, scope: !3507)
!3518 = !DILocation(line: 209, column: 19, scope: !3507)
!3519 = !DILocation(line: 129, column: 22, scope: !3507)
!3520 = !DILocation(line: 129, column: 26, scope: !3507)
!3521 = !DILocation(line: 129, column: 30, scope: !3507)
!3522 = !DILocation(line: 129, column: 34, scope: !3507)
!3523 = !DILocation(line: 135, column: 22, scope: !3507)
!3524 = !DILocation(line: 135, column: 21, scope: !3507)
!3525 = !DILocation(line: 212, column: 17, scope: !3507)
!3526 = !DILocation(line: 213, column: 19, scope: !3507)
!3527 = !DILocation(line: 131, column: 22, scope: !3507)
!3528 = !DILocation(line: 131, column: 26, scope: !3507)
!3529 = !DILocation(line: 131, column: 30, scope: !3507)
!3530 = !DILocation(line: 131, column: 34, scope: !3507)
!3531 = !DILocation(line: 128, column: 22, scope: !3507)
!3532 = !DILocation(line: 128, column: 26, scope: !3507)
!3533 = !DILocation(line: 128, column: 30, scope: !3507)
!3534 = !DILocation(line: 128, column: 34, scope: !3507)
!3535 = !DILocation(line: 139, column: 22, scope: !3507)
!3536 = !DILocation(line: 139, column: 21, scope: !3507)
!3537 = !DILocation(line: 210, column: 17, scope: !3507)
!3538 = !DILocation(line: 211, column: 19, scope: !3507)
!3539 = !DILocation(line: 217, column: 28, scope: !3507)
!3540 = !DILocation(line: 217, column: 33, scope: !3507)
!3541 = !DILocation(line: 217, column: 25, scope: !3507)
!3542 = !DILocation(line: 137, column: 22, scope: !3507)
!3543 = !DILocation(line: 137, column: 21, scope: !3507)
!3544 = !DILocation(line: 145, column: 17, scope: !3507)
!3545 = !DILocation(line: 146, column: 19, scope: !3507)
!3546 = !DILocation(line: 136, column: 22, scope: !3507)
!3547 = !DILocation(line: 136, column: 21, scope: !3507)
!3548 = !DILocation(line: 143, column: 17, scope: !3507)
!3549 = !DILocation(line: 144, column: 19, scope: !3507)
!3550 = !DILocation(line: 151, column: 28, scope: !3507)
!3551 = !DILocation(line: 151, column: 33, scope: !3507)
!3552 = !DILocation(line: 152, column: 30, scope: !3507)
!3553 = !DILocation(line: 152, column: 17, scope: !3507)
!3554 = !DILocation(line: 141, column: 17, scope: !3507)
!3555 = !DILocation(line: 158, column: 17, scope: !3507)
!3556 = !DILocation(line: 159, column: 19, scope: !3507)
!3557 = !DILocation(line: 162, column: 17, scope: !3507)
!3558 = !DILocation(line: 163, column: 19, scope: !3507)
!3559 = !DILocation(line: 160, column: 17, scope: !3507)
!3560 = !DILocation(line: 161, column: 19, scope: !3507)
!3561 = !DILocation(line: 168, column: 28, scope: !3507)
!3562 = !DILocation(line: 168, column: 33, scope: !3507)
!3563 = !DILocation(line: 168, column: 25, scope: !3507)
!3564 = !DILocation(line: 223, column: 22, scope: !3507)
!3565 = !DILocation(line: 174, column: 17, scope: !3507)
!3566 = !DILocation(line: 175, column: 19, scope: !3507)
!3567 = !DILocation(line: 178, column: 17, scope: !3507)
!3568 = !DILocation(line: 179, column: 19, scope: !3507)
!3569 = !DILocation(line: 176, column: 17, scope: !3507)
!3570 = !DILocation(line: 177, column: 19, scope: !3507)
!3571 = !DILocation(line: 184, column: 28, scope: !3507)
!3572 = !DILocation(line: 184, column: 33, scope: !3507)
!3573 = !DILocation(line: 184, column: 25, scope: !3507)
!3574 = !DILocation(line: 223, column: 26, scope: !3507)
!3575 = !DILocation(line: 190, column: 17, scope: !3507)
!3576 = !DILocation(line: 191, column: 19, scope: !3507)
!3577 = !DILocation(line: 194, column: 17, scope: !3507)
!3578 = !DILocation(line: 195, column: 19, scope: !3507)
!3579 = !DILocation(line: 192, column: 17, scope: !3507)
!3580 = !DILocation(line: 193, column: 19, scope: !3507)
!3581 = !DILocation(line: 200, column: 28, scope: !3507)
!3582 = !DILocation(line: 200, column: 33, scope: !3507)
!3583 = !DILocation(line: 200, column: 25, scope: !3507)
!3584 = !DILocation(line: 223, column: 30, scope: !3507)
!3585 = !DILocation(line: 206, column: 17, scope: !3507)
!3586 = !DILocation(line: 207, column: 19, scope: !3507)
!3587 = !DILocation(line: 216, column: 28, scope: !3507)
!3588 = !DILocation(line: 216, column: 33, scope: !3507)
!3589 = !DILocation(line: 216, column: 25, scope: !3507)
!3590 = !DILocation(line: 223, column: 34, scope: !3507)
!3591 = !DILocation(line: 149, column: 17, scope: !3507)
!3592 = !DILocation(line: 150, column: 19, scope: !3507)
!3593 = !DILocation(line: 147, column: 17, scope: !3507)
!3594 = !DILocation(line: 148, column: 19, scope: !3507)
!3595 = !DILocation(line: 154, column: 28, scope: !3507)
!3596 = !DILocation(line: 154, column: 33, scope: !3507)
!3597 = !DILocation(line: 154, column: 25, scope: !3507)
!3598 = !DILocation(line: 166, column: 17, scope: !3507)
!3599 = !DILocation(line: 167, column: 19, scope: !3507)
!3600 = !DILocation(line: 164, column: 17, scope: !3507)
!3601 = !DILocation(line: 165, column: 19, scope: !3507)
!3602 = !DILocation(line: 170, column: 28, scope: !3507)
!3603 = !DILocation(line: 170, column: 33, scope: !3507)
!3604 = !DILocation(line: 170, column: 25, scope: !3507)
!3605 = !DILocation(line: 225, column: 22, scope: !3507)
!3606 = !DILocation(line: 182, column: 17, scope: !3507)
!3607 = !DILocation(line: 183, column: 19, scope: !3507)
!3608 = !DILocation(line: 180, column: 17, scope: !3507)
!3609 = !DILocation(line: 181, column: 19, scope: !3507)
!3610 = !DILocation(line: 186, column: 28, scope: !3507)
!3611 = !DILocation(line: 186, column: 33, scope: !3507)
!3612 = !DILocation(line: 186, column: 25, scope: !3507)
!3613 = !DILocation(line: 225, column: 26, scope: !3507)
!3614 = !DILocation(line: 198, column: 17, scope: !3507)
!3615 = !DILocation(line: 199, column: 19, scope: !3507)
!3616 = !DILocation(line: 196, column: 17, scope: !3507)
!3617 = !DILocation(line: 197, column: 19, scope: !3507)
!3618 = !DILocation(line: 202, column: 28, scope: !3507)
!3619 = !DILocation(line: 202, column: 33, scope: !3507)
!3620 = !DILocation(line: 202, column: 25, scope: !3507)
!3621 = !DILocation(line: 225, column: 30, scope: !3507)
!3622 = !DILocation(line: 214, column: 17, scope: !3507)
!3623 = !DILocation(line: 215, column: 19, scope: !3507)
!3624 = !DILocation(line: 218, column: 28, scope: !3507)
!3625 = !DILocation(line: 218, column: 33, scope: !3507)
!3626 = !DILocation(line: 218, column: 25, scope: !3507)
!3627 = !DILocation(line: 225, column: 34, scope: !3507)
!3628 = !DILocation(line: 231, column: 22, scope: !3507)
!3629 = !DILocation(line: 231, column: 21, scope: !3507)
!3630 = !DILocation(line: 309, column: 17, scope: !3507)
!3631 = !DILocation(line: 310, column: 19, scope: !3507)
!3632 = !DILocation(line: 171, column: 28, scope: !3507)
!3633 = !DILocation(line: 171, column: 33, scope: !3507)
!3634 = !DILocation(line: 171, column: 25, scope: !3507)
!3635 = !DILocation(line: 156, column: 28, scope: !3507)
!3636 = !DILocation(line: 156, column: 33, scope: !3507)
!3637 = !DILocation(line: 156, column: 25, scope: !3507)
!3638 = !DILocation(line: 172, column: 28, scope: !3507)
!3639 = !DILocation(line: 172, column: 33, scope: !3507)
!3640 = !DILocation(line: 172, column: 25, scope: !3507)
!3641 = !DILocation(line: 227, column: 22, scope: !3507)
!3642 = !DILocation(line: 188, column: 28, scope: !3507)
!3643 = !DILocation(line: 188, column: 33, scope: !3507)
!3644 = !DILocation(line: 188, column: 25, scope: !3507)
!3645 = !DILocation(line: 227, column: 26, scope: !3507)
!3646 = !DILocation(line: 204, column: 28, scope: !3507)
!3647 = !DILocation(line: 204, column: 33, scope: !3507)
!3648 = !DILocation(line: 204, column: 25, scope: !3507)
!3649 = !DILocation(line: 227, column: 30, scope: !3507)
!3650 = !DILocation(line: 220, column: 28, scope: !3507)
!3651 = !DILocation(line: 220, column: 33, scope: !3507)
!3652 = !DILocation(line: 220, column: 25, scope: !3507)
!3653 = !DILocation(line: 227, column: 34, scope: !3507)
!3654 = !DILocation(line: 233, column: 22, scope: !3507)
!3655 = !DILocation(line: 233, column: 21, scope: !3507)
!3656 = !DILocation(line: 303, column: 17, scope: !3507)
!3657 = !DILocation(line: 304, column: 19, scope: !3507)
!3658 = !DILocation(line: 153, column: 28, scope: !3507)
!3659 = !DILocation(line: 153, column: 33, scope: !3507)
!3660 = !DILocation(line: 153, column: 25, scope: !3507)
!3661 = !DILocation(line: 169, column: 28, scope: !3507)
!3662 = !DILocation(line: 169, column: 33, scope: !3507)
!3663 = !DILocation(line: 169, column: 25, scope: !3507)
!3664 = !DILocation(line: 224, column: 22, scope: !3507)
!3665 = !DILocation(line: 185, column: 28, scope: !3507)
!3666 = !DILocation(line: 185, column: 33, scope: !3507)
!3667 = !DILocation(line: 185, column: 25, scope: !3507)
!3668 = !DILocation(line: 224, column: 26, scope: !3507)
!3669 = !DILocation(line: 201, column: 28, scope: !3507)
!3670 = !DILocation(line: 201, column: 33, scope: !3507)
!3671 = !DILocation(line: 201, column: 25, scope: !3507)
!3672 = !DILocation(line: 224, column: 30, scope: !3507)
!3673 = !DILocation(line: 224, column: 34, scope: !3507)
!3674 = !DILocation(line: 155, column: 28, scope: !3507)
!3675 = !DILocation(line: 155, column: 33, scope: !3507)
!3676 = !DILocation(line: 155, column: 25, scope: !3507)
!3677 = !DILocation(line: 226, column: 22, scope: !3507)
!3678 = !DILocation(line: 187, column: 28, scope: !3507)
!3679 = !DILocation(line: 187, column: 33, scope: !3507)
!3680 = !DILocation(line: 187, column: 25, scope: !3507)
!3681 = !DILocation(line: 226, column: 26, scope: !3507)
!3682 = !DILocation(line: 203, column: 28, scope: !3507)
!3683 = !DILocation(line: 203, column: 33, scope: !3507)
!3684 = !DILocation(line: 203, column: 25, scope: !3507)
!3685 = !DILocation(line: 226, column: 30, scope: !3507)
!3686 = !DILocation(line: 219, column: 28, scope: !3507)
!3687 = !DILocation(line: 219, column: 33, scope: !3507)
!3688 = !DILocation(line: 219, column: 25, scope: !3507)
!3689 = !DILocation(line: 226, column: 34, scope: !3507)
!3690 = !DILocation(line: 232, column: 22, scope: !3507)
!3691 = !DILocation(line: 232, column: 21, scope: !3507)
!3692 = !DILocation(line: 301, column: 17, scope: !3507)
!3693 = !DILocation(line: 302, column: 19, scope: !3507)
!3694 = !DILocation(line: 315, column: 28, scope: !3507)
!3695 = !DILocation(line: 315, column: 33, scope: !3507)
!3696 = !DILocation(line: 315, column: 25, scope: !3507)
!3697 = !DILocation(line: 230, column: 22, scope: !3507)
!3698 = !DILocation(line: 230, column: 21, scope: !3507)
!3699 = !DILocation(line: 307, column: 17, scope: !3507)
!3700 = !DILocation(line: 308, column: 19, scope: !3507)
!3701 = !DILocation(line: 314, column: 28, scope: !3507)
!3702 = !DILocation(line: 314, column: 33, scope: !3507)
!3703 = !DILocation(line: 314, column: 25, scope: !3507)
!3704 = !DILocation(line: 234, column: 22, scope: !3507)
!3705 = !DILocation(line: 234, column: 21, scope: !3507)
!3706 = !DILocation(line: 305, column: 17, scope: !3507)
!3707 = !DILocation(line: 306, column: 19, scope: !3507)
!3708 = !DILocation(line: 313, column: 28, scope: !3507)
!3709 = !DILocation(line: 313, column: 33, scope: !3507)
!3710 = !DILocation(line: 313, column: 25, scope: !3507)
!3711 = !DILocation(line: 312, column: 28, scope: !3507)
!3712 = !DILocation(line: 312, column: 33, scope: !3507)
!3713 = !DILocation(line: 312, column: 25, scope: !3507)
!3714 = !DILocation(line: 311, column: 28, scope: !3507)
!3715 = !DILocation(line: 311, column: 33, scope: !3507)
!3716 = !DILocation(line: 311, column: 25, scope: !3507)
!3717 = !DILocation(line: 293, column: 17, scope: !3507)
!3718 = !DILocation(line: 294, column: 19, scope: !3507)
!3719 = !DILocation(line: 287, column: 17, scope: !3507)
!3720 = !DILocation(line: 288, column: 19, scope: !3507)
!3721 = !DILocation(line: 285, column: 17, scope: !3507)
!3722 = !DILocation(line: 286, column: 19, scope: !3507)
!3723 = !DILocation(line: 299, column: 28, scope: !3507)
!3724 = !DILocation(line: 299, column: 33, scope: !3507)
!3725 = !DILocation(line: 299, column: 25, scope: !3507)
!3726 = !DILocation(line: 291, column: 17, scope: !3507)
!3727 = !DILocation(line: 292, column: 19, scope: !3507)
!3728 = !DILocation(line: 298, column: 28, scope: !3507)
!3729 = !DILocation(line: 298, column: 33, scope: !3507)
!3730 = !DILocation(line: 298, column: 25, scope: !3507)
!3731 = !DILocation(line: 289, column: 17, scope: !3507)
!3732 = !DILocation(line: 290, column: 19, scope: !3507)
!3733 = !DILocation(line: 297, column: 28, scope: !3507)
!3734 = !DILocation(line: 297, column: 33, scope: !3507)
!3735 = !DILocation(line: 297, column: 25, scope: !3507)
!3736 = !DILocation(line: 296, column: 28, scope: !3507)
!3737 = !DILocation(line: 296, column: 33, scope: !3507)
!3738 = !DILocation(line: 296, column: 25, scope: !3507)
!3739 = !DILocation(line: 295, column: 28, scope: !3507)
!3740 = !DILocation(line: 295, column: 33, scope: !3507)
!3741 = !DILocation(line: 295, column: 25, scope: !3507)
!3742 = !DILocation(line: 277, column: 17, scope: !3507)
!3743 = !DILocation(line: 278, column: 19, scope: !3507)
!3744 = !DILocation(line: 271, column: 17, scope: !3507)
!3745 = !DILocation(line: 272, column: 19, scope: !3507)
!3746 = !DILocation(line: 269, column: 17, scope: !3507)
!3747 = !DILocation(line: 270, column: 19, scope: !3507)
!3748 = !DILocation(line: 283, column: 28, scope: !3507)
!3749 = !DILocation(line: 283, column: 33, scope: !3507)
!3750 = !DILocation(line: 283, column: 25, scope: !3507)
!3751 = !DILocation(line: 275, column: 17, scope: !3507)
!3752 = !DILocation(line: 276, column: 19, scope: !3507)
!3753 = !DILocation(line: 282, column: 28, scope: !3507)
!3754 = !DILocation(line: 282, column: 33, scope: !3507)
!3755 = !DILocation(line: 282, column: 25, scope: !3507)
!3756 = !DILocation(line: 273, column: 17, scope: !3507)
!3757 = !DILocation(line: 274, column: 19, scope: !3507)
!3758 = !DILocation(line: 281, column: 28, scope: !3507)
!3759 = !DILocation(line: 281, column: 33, scope: !3507)
!3760 = !DILocation(line: 281, column: 25, scope: !3507)
!3761 = !DILocation(line: 280, column: 28, scope: !3507)
!3762 = !DILocation(line: 280, column: 33, scope: !3507)
!3763 = !DILocation(line: 280, column: 25, scope: !3507)
!3764 = !DILocation(line: 279, column: 28, scope: !3507)
!3765 = !DILocation(line: 279, column: 33, scope: !3507)
!3766 = !DILocation(line: 279, column: 25, scope: !3507)
!3767 = !DILocation(line: 261, column: 17, scope: !3507)
!3768 = !DILocation(line: 262, column: 19, scope: !3507)
!3769 = !DILocation(line: 255, column: 17, scope: !3507)
!3770 = !DILocation(line: 256, column: 19, scope: !3507)
!3771 = !DILocation(line: 253, column: 17, scope: !3507)
!3772 = !DILocation(line: 254, column: 19, scope: !3507)
!3773 = !DILocation(line: 267, column: 28, scope: !3507)
!3774 = !DILocation(line: 267, column: 33, scope: !3507)
!3775 = !DILocation(line: 267, column: 25, scope: !3507)
!3776 = !DILocation(line: 259, column: 17, scope: !3507)
!3777 = !DILocation(line: 260, column: 19, scope: !3507)
!3778 = !DILocation(line: 266, column: 28, scope: !3507)
!3779 = !DILocation(line: 266, column: 33, scope: !3507)
!3780 = !DILocation(line: 266, column: 25, scope: !3507)
!3781 = !DILocation(line: 257, column: 17, scope: !3507)
!3782 = !DILocation(line: 258, column: 19, scope: !3507)
!3783 = !DILocation(line: 265, column: 28, scope: !3507)
!3784 = !DILocation(line: 265, column: 33, scope: !3507)
!3785 = !DILocation(line: 265, column: 25, scope: !3507)
!3786 = !DILocation(line: 264, column: 28, scope: !3507)
!3787 = !DILocation(line: 264, column: 33, scope: !3507)
!3788 = !DILocation(line: 264, column: 25, scope: !3507)
!3789 = !DILocation(line: 263, column: 28, scope: !3507)
!3790 = !DILocation(line: 263, column: 33, scope: !3507)
!3791 = !DILocation(line: 263, column: 25, scope: !3507)
!3792 = !DILocation(line: 244, column: 17, scope: !3507)
!3793 = !DILocation(line: 245, column: 19, scope: !3507)
!3794 = !DILocation(line: 238, column: 17, scope: !3507)
!3795 = !DILocation(line: 239, column: 19, scope: !3507)
!3796 = !DILocation(line: 236, column: 17, scope: !3507)
!3797 = !DILocation(line: 251, column: 28, scope: !3507)
!3798 = !DILocation(line: 251, column: 33, scope: !3507)
!3799 = !DILocation(line: 251, column: 25, scope: !3507)
!3800 = !DILocation(line: 242, column: 17, scope: !3507)
!3801 = !DILocation(line: 243, column: 19, scope: !3507)
!3802 = !DILocation(line: 250, column: 28, scope: !3507)
!3803 = !DILocation(line: 250, column: 33, scope: !3507)
!3804 = !DILocation(line: 250, column: 25, scope: !3507)
!3805 = !DILocation(line: 240, column: 17, scope: !3507)
!3806 = !DILocation(line: 241, column: 19, scope: !3507)
!3807 = !DILocation(line: 249, column: 28, scope: !3507)
!3808 = !DILocation(line: 249, column: 33, scope: !3507)
!3809 = !DILocation(line: 249, column: 25, scope: !3507)
!3810 = !DILocation(line: 248, column: 28, scope: !3507)
!3811 = !DILocation(line: 248, column: 33, scope: !3507)
!3812 = !DILocation(line: 248, column: 25, scope: !3507)
!3813 = !DILocation(line: 247, column: 58, scope: !3507)
!3814 = !DILocation(line: 247, column: 30, scope: !3507)
!3815 = !DILocation(line: 246, column: 28, scope: !3507)
!3816 = !DILocation(line: 246, column: 33, scope: !3507)
!3817 = !DILocation(line: 247, column: 17, scope: !3507)
!3818 = !DILocation(line: 126, column: 47, scope: !3469)
!3819 = !DILocation(line: 126, column: 9, scope: !3469)
!3820 = distinct !{!3820, !3470, !3821, !255}
!3821 = !DILocation(line: 316, column: 9, scope: !3466)
!3822 = !DILocation(line: 319, column: 19, scope: !3411)
!3823 = !DILocation(line: 320, column: 9, scope: !3411)
!3824 = !DILocation(line: 320, column: 19, scope: !3411)
!3825 = !DILocation(line: 321, column: 9, scope: !3411)
!3826 = !DILocation(line: 321, column: 19, scope: !3411)
!3827 = !DILocation(line: 322, column: 9, scope: !3411)
!3828 = !DILocation(line: 322, column: 19, scope: !3411)
!3829 = !DILocation(line: 323, column: 9, scope: !3411)
!3830 = !DILocation(line: 323, column: 19, scope: !3411)
!3831 = !DILocation(line: 324, column: 9, scope: !3411)
!3832 = !DILocation(line: 324, column: 19, scope: !3411)
!3833 = !DILocation(line: 325, column: 9, scope: !3411)
!3834 = !DILocation(line: 325, column: 19, scope: !3411)
!3835 = !DILocation(line: 326, column: 9, scope: !3411)
!3836 = !DILocation(line: 326, column: 19, scope: !3411)
!3837 = !DILocation(line: 327, column: 9, scope: !3411)
!3838 = !DILocation(line: 327, column: 19, scope: !3411)
!3839 = !DILocation(line: 328, column: 9, scope: !3411)
!3840 = !DILocation(line: 328, column: 19, scope: !3411)
!3841 = !DILocation(line: 329, column: 9, scope: !3411)
!3842 = !DILocation(line: 329, column: 19, scope: !3411)
!3843 = !DILocation(line: 330, column: 9, scope: !3411)
!3844 = !DILocation(line: 330, column: 19, scope: !3411)
!3845 = !DILocation(line: 331, column: 9, scope: !3411)
!3846 = !DILocation(line: 331, column: 19, scope: !3411)
!3847 = !DILocation(line: 332, column: 9, scope: !3411)
!3848 = !DILocation(line: 332, column: 19, scope: !3411)
!3849 = !DILocation(line: 333, column: 9, scope: !3411)
!3850 = !DILocation(line: 333, column: 19, scope: !3411)
!3851 = !DILocation(line: 334, column: 9, scope: !3411)
!3852 = !DILocation(line: 334, column: 19, scope: !3411)
!3853 = !DILocation(line: 335, column: 9, scope: !3411)
!3854 = !DILocation(line: 335, column: 19, scope: !3411)
!3855 = !DILocation(line: 336, column: 9, scope: !3411)
!3856 = !DILocation(line: 336, column: 19, scope: !3411)
!3857 = !DILocation(line: 337, column: 9, scope: !3411)
!3858 = !DILocation(line: 337, column: 19, scope: !3411)
!3859 = !DILocation(line: 338, column: 9, scope: !3411)
!3860 = !DILocation(line: 338, column: 19, scope: !3411)
!3861 = !DILocation(line: 339, column: 9, scope: !3411)
!3862 = !DILocation(line: 339, column: 19, scope: !3411)
!3863 = !DILocation(line: 340, column: 9, scope: !3411)
!3864 = !DILocation(line: 340, column: 19, scope: !3411)
!3865 = !DILocation(line: 341, column: 9, scope: !3411)
!3866 = !DILocation(line: 341, column: 19, scope: !3411)
!3867 = !DILocation(line: 342, column: 9, scope: !3411)
!3868 = !DILocation(line: 342, column: 19, scope: !3411)
!3869 = !DILocation(line: 343, column: 9, scope: !3411)
!3870 = !DILocation(line: 343, column: 19, scope: !3411)
!3871 = !DILocation(line: 344, column: 1, scope: !3411)
!3872 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !3320, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3873 = !DILocalVariable(name: "state", arg: 1, scope: !3872, file: !74, line: 550, type: !563)
!3874 = !DILocation(line: 0, scope: !3872)
!3875 = !DILocation(line: 552, column: 36, scope: !3872)
!3876 = !DILocalVariable(name: "s", arg: 1, scope: !3877, file: !74, line: 405, type: !604)
!3877 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !3878, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3878 = !DISubroutineType(types: !3879)
!3879 = !{null, !604, !40, !40, !33}
!3880 = !DILocation(line: 0, scope: !3877, inlinedAt: !3881)
!3881 = distinct !DILocation(line: 552, column: 3, scope: !3872)
!3882 = !DILocalVariable(name: "pos", arg: 2, scope: !3877, file: !74, line: 405, type: !40)
!3883 = !DILocalVariable(name: "r", arg: 3, scope: !3877, file: !74, line: 405, type: !40)
!3884 = !DILocalVariable(name: "p", arg: 4, scope: !3877, file: !74, line: 405, type: !33)
!3885 = !DILocation(line: 407, column: 31, scope: !3877, inlinedAt: !3881)
!3886 = !DILocation(line: 407, column: 27, scope: !3877, inlinedAt: !3881)
!3887 = !DILocation(line: 407, column: 8, scope: !3877, inlinedAt: !3881)
!3888 = !DILocation(line: 407, column: 3, scope: !3877, inlinedAt: !3881)
!3889 = !DILocation(line: 407, column: 12, scope: !3877, inlinedAt: !3881)
!3890 = !DILocation(line: 408, column: 3, scope: !3877, inlinedAt: !3881)
!3891 = !DILocation(line: 408, column: 12, scope: !3877, inlinedAt: !3881)
!3892 = !DILocation(line: 553, column: 10, scope: !3872)
!3893 = !DILocation(line: 553, column: 14, scope: !3872)
!3894 = !DILocation(line: 554, column: 1, scope: !3872)
!3895 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !594, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3896 = !DILocalVariable(name: "out", arg: 1, scope: !3895, file: !74, line: 566, type: !32)
!3897 = !DILocation(line: 0, scope: !3895)
!3898 = !DILocalVariable(name: "outlen", arg: 2, scope: !3895, file: !74, line: 566, type: !38)
!3899 = !DILocalVariable(name: "state", arg: 3, scope: !3895, file: !74, line: 566, type: !563)
!3900 = !DILocation(line: 568, column: 61, scope: !3895)
!3901 = !DILocation(line: 0, scope: !865, inlinedAt: !3902)
!3902 = distinct !DILocation(line: 568, column: 16, scope: !3895)
!3903 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !3902)
!3904 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !3902)
!3905 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !3902)
!3906 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !3902)
!3907 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !3902)
!3908 = !DILocation(line: 439, scope: !883, inlinedAt: !3902)
!3909 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !3902)
!3910 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !3902)
!3911 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !3902)
!3912 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !3902)
!3913 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !3902)
!3914 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !3902)
!3915 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !3902)
!3916 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !3902)
!3917 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !3902)
!3918 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !3902)
!3919 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !3902)
!3920 = distinct !{!3920, !3911, !3921, !255}
!3921 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !3902)
!3922 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !3902)
!3923 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !3902)
!3924 = distinct !{!3924, !3903, !3925, !255}
!3925 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !3902)
!3926 = !DILocation(line: 568, column: 10, scope: !3895)
!3927 = !DILocation(line: 568, column: 14, scope: !3895)
!3928 = !DILocation(line: 569, column: 1, scope: !3895)
!3929 = !DILocation(line: 0, scope: !560)
!3930 = !DILocation(line: 582, column: 3, scope: !560)
!3931 = !DILocation(line: 583, column: 10, scope: !560)
!3932 = !DILocation(line: 583, column: 14, scope: !560)
!3933 = !DILocation(line: 584, column: 1, scope: !560)
!3934 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !3935, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3935 = !DISubroutineType(types: !3936)
!3936 = !{null, !604, !40, !157, !38, !33}
!3937 = !DILocalVariable(name: "s", arg: 1, scope: !3934, file: !74, line: 461, type: !604)
!3938 = !DILocation(line: 0, scope: !3934)
!3939 = !DILocalVariable(name: "r", arg: 2, scope: !3934, file: !74, line: 462, type: !40)
!3940 = !DILocalVariable(name: "in", arg: 3, scope: !3934, file: !74, line: 463, type: !157)
!3941 = !DILocalVariable(name: "inlen", arg: 4, scope: !3934, file: !74, line: 464, type: !38)
!3942 = !DILocalVariable(name: "p", arg: 5, scope: !3934, file: !74, line: 465, type: !33)
!3943 = !DILocalVariable(name: "i", scope: !3934, file: !74, line: 467, type: !40)
!3944 = !DILocation(line: 469, column: 7, scope: !3945)
!3945 = distinct !DILexicalBlock(scope: !3934, file: !74, line: 469, column: 3)
!3946 = !DILocation(line: 469, scope: !3945)
!3947 = !DILocation(line: 469, column: 12, scope: !3948)
!3948 = distinct !DILexicalBlock(scope: !3945, file: !74, line: 469, column: 3)
!3949 = !DILocation(line: 469, column: 3, scope: !3945)
!3950 = !DILocation(line: 472, column: 3, scope: !3934)
!3951 = !DILocation(line: 470, column: 5, scope: !3948)
!3952 = !DILocation(line: 470, column: 10, scope: !3948)
!3953 = !DILocation(line: 469, column: 17, scope: !3948)
!3954 = !DILocation(line: 469, column: 3, scope: !3948)
!3955 = distinct !{!3955, !3949, !3956, !255}
!3956 = !DILocation(line: 470, column: 12, scope: !3945)
!3957 = !DILocation(line: 472, column: 15, scope: !3934)
!3958 = !DILocation(line: 473, column: 5, scope: !3959)
!3959 = distinct !DILexicalBlock(scope: !3960, file: !74, line: 473, column: 5)
!3960 = distinct !DILexicalBlock(scope: !3934, file: !74, line: 472, column: 21)
!3961 = !DILocation(line: 480, column: 3, scope: !3962)
!3962 = distinct !DILexicalBlock(scope: !3934, file: !74, line: 480, column: 3)
!3963 = !DILocation(line: 473, scope: !3959)
!3964 = !DILocation(line: 473, column: 14, scope: !3965)
!3965 = distinct !DILexicalBlock(scope: !3959, file: !74, line: 473, column: 5)
!3966 = !DILocation(line: 474, column: 26, scope: !3965)
!3967 = !DILocation(line: 474, column: 24, scope: !3965)
!3968 = !DILocalVariable(name: "x", arg: 1, scope: !3969, file: !74, line: 22, type: !157)
!3969 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !3970, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3970 = !DISubroutineType(types: !3971)
!3971 = !{!70, !157}
!3972 = !DILocation(line: 0, scope: !3969, inlinedAt: !3973)
!3973 = distinct !DILocation(line: 474, column: 15, scope: !3965)
!3974 = !DILocalVariable(name: "r", scope: !3969, file: !74, line: 24, type: !70)
!3975 = !DILocalVariable(name: "i", scope: !3969, file: !74, line: 23, type: !40)
!3976 = !DILocation(line: 26, column: 7, scope: !3977, inlinedAt: !3973)
!3977 = distinct !DILexicalBlock(scope: !3969, file: !74, line: 26, column: 3)
!3978 = !DILocation(line: 26, scope: !3977, inlinedAt: !3973)
!3979 = !DILocation(line: 26, column: 12, scope: !3980, inlinedAt: !3973)
!3980 = distinct !DILexicalBlock(scope: !3977, file: !74, line: 26, column: 3)
!3981 = !DILocation(line: 26, column: 3, scope: !3977, inlinedAt: !3973)
!3982 = !DILocation(line: 27, column: 20, scope: !3980, inlinedAt: !3973)
!3983 = !DILocation(line: 27, column: 10, scope: !3980, inlinedAt: !3973)
!3984 = !DILocation(line: 27, column: 29, scope: !3980, inlinedAt: !3973)
!3985 = !DILocation(line: 27, column: 25, scope: !3980, inlinedAt: !3973)
!3986 = !DILocation(line: 27, column: 7, scope: !3980, inlinedAt: !3973)
!3987 = !DILocation(line: 26, column: 16, scope: !3980, inlinedAt: !3973)
!3988 = !DILocation(line: 26, column: 3, scope: !3980, inlinedAt: !3973)
!3989 = distinct !{!3989, !3981, !3990, !255}
!3990 = !DILocation(line: 27, column: 30, scope: !3977, inlinedAt: !3973)
!3991 = !DILocation(line: 474, column: 7, scope: !3965)
!3992 = !DILocation(line: 474, column: 12, scope: !3965)
!3993 = !DILocation(line: 473, column: 20, scope: !3965)
!3994 = !DILocation(line: 473, column: 5, scope: !3965)
!3995 = distinct !{!3995, !3958, !3996, !255}
!3996 = !DILocation(line: 474, column: 28, scope: !3959)
!3997 = !DILocation(line: 475, column: 8, scope: !3960)
!3998 = !DILocation(line: 476, column: 11, scope: !3960)
!3999 = !DILocation(line: 477, column: 5, scope: !3960)
!4000 = distinct !{!4000, !3950, !4001, !255}
!4001 = !DILocation(line: 478, column: 3, scope: !3934)
!4002 = !DILocation(line: 480, scope: !3962)
!4003 = !DILocation(line: 480, column: 12, scope: !4004)
!4004 = distinct !DILexicalBlock(scope: !3962, file: !74, line: 480, column: 3)
!4005 = !DILocation(line: 481, column: 25, scope: !4004)
!4006 = !DILocation(line: 481, column: 15, scope: !4004)
!4007 = !DILocation(line: 481, column: 35, scope: !4004)
!4008 = !DILocation(line: 481, column: 31, scope: !4004)
!4009 = !DILocation(line: 481, column: 8, scope: !4004)
!4010 = !DILocation(line: 481, column: 5, scope: !4004)
!4011 = !DILocation(line: 481, column: 12, scope: !4004)
!4012 = !DILocation(line: 480, column: 20, scope: !4004)
!4013 = !DILocation(line: 480, column: 3, scope: !4004)
!4014 = distinct !{!4014, !3961, !4015, !255}
!4015 = !DILocation(line: 481, column: 40, scope: !3962)
!4016 = !DILocation(line: 483, column: 13, scope: !3934)
!4017 = !DILocation(line: 483, column: 29, scope: !3934)
!4018 = !DILocation(line: 483, column: 25, scope: !3934)
!4019 = !DILocation(line: 483, column: 6, scope: !3934)
!4020 = !DILocation(line: 483, column: 3, scope: !3934)
!4021 = !DILocation(line: 483, column: 10, scope: !3934)
!4022 = !DILocation(line: 484, column: 7, scope: !3934)
!4023 = !DILocation(line: 484, column: 10, scope: !3934)
!4024 = !DILocation(line: 484, column: 3, scope: !3934)
!4025 = !DILocation(line: 484, column: 14, scope: !3934)
!4026 = !DILocation(line: 485, column: 1, scope: !3934)
!4027 = !DILocation(line: 0, scope: !593)
!4028 = !DILocation(line: 0, scope: !601, inlinedAt: !4029)
!4029 = distinct !DILocation(line: 600, column: 3, scope: !593)
!4030 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !4029)
!4031 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !4029)
!4032 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !4029)
!4033 = !DILocation(line: 509, scope: !615, inlinedAt: !4029)
!4034 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !4029)
!4035 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !4029)
!4036 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !4029)
!4037 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !4029)
!4038 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !4029)
!4039 = !DILocation(line: 0, scope: !624, inlinedAt: !4040)
!4040 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !4029)
!4041 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4040)
!4042 = !DILocation(line: 43, scope: !632, inlinedAt: !4040)
!4043 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4040)
!4044 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4040)
!4045 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4040)
!4046 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4040)
!4047 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4040)
!4048 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4040)
!4049 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4040)
!4050 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4040)
!4051 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4040)
!4052 = distinct !{!4052, !4044, !4053, !255}
!4053 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4040)
!4054 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !4029)
!4055 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4029)
!4056 = distinct !{!4056, !4035, !4057, !255}
!4057 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !4029)
!4058 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !4029)
!4059 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !4029)
!4060 = distinct !{!4060, !4030, !4061, !255}
!4061 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !4029)
!4062 = !DILocation(line: 601, column: 1, scope: !593)
!4063 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !3320, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4064 = !DILocalVariable(name: "state", arg: 1, scope: !4063, file: !74, line: 610, type: !563)
!4065 = !DILocation(line: 0, scope: !4063)
!4066 = !DILocation(line: 0, scope: !3325, inlinedAt: !4067)
!4067 = distinct !DILocation(line: 612, column: 3, scope: !4063)
!4068 = !DILocation(line: 356, column: 7, scope: !3332, inlinedAt: !4067)
!4069 = !DILocation(line: 356, scope: !3332, inlinedAt: !4067)
!4070 = !DILocation(line: 356, column: 12, scope: !3335, inlinedAt: !4067)
!4071 = !DILocation(line: 356, column: 3, scope: !3332, inlinedAt: !4067)
!4072 = !DILocation(line: 357, column: 5, scope: !3335, inlinedAt: !4067)
!4073 = !DILocation(line: 357, column: 10, scope: !3335, inlinedAt: !4067)
!4074 = !DILocation(line: 356, column: 17, scope: !3335, inlinedAt: !4067)
!4075 = !DILocation(line: 356, column: 3, scope: !3335, inlinedAt: !4067)
!4076 = distinct !{!4076, !4071, !4077, !255}
!4077 = !DILocation(line: 357, column: 12, scope: !3332, inlinedAt: !4067)
!4078 = !DILocation(line: 613, column: 10, scope: !4063)
!4079 = !DILocation(line: 613, column: 14, scope: !4063)
!4080 = !DILocation(line: 614, column: 1, scope: !4063)
!4081 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !561, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4082 = !DILocalVariable(name: "state", arg: 1, scope: !4081, file: !74, line: 625, type: !563)
!4083 = !DILocation(line: 0, scope: !4081)
!4084 = !DILocalVariable(name: "in", arg: 2, scope: !4081, file: !74, line: 625, type: !157)
!4085 = !DILocalVariable(name: "inlen", arg: 3, scope: !4081, file: !74, line: 625, type: !38)
!4086 = !DILocation(line: 627, column: 47, scope: !4081)
!4087 = !DILocation(line: 627, column: 16, scope: !4081)
!4088 = !DILocation(line: 627, column: 10, scope: !4081)
!4089 = !DILocation(line: 627, column: 14, scope: !4081)
!4090 = !DILocation(line: 628, column: 1, scope: !4081)
!4091 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !3320, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4092 = !DILocalVariable(name: "state", arg: 1, scope: !4091, file: !74, line: 637, type: !563)
!4093 = !DILocation(line: 0, scope: !4091)
!4094 = !DILocation(line: 639, column: 36, scope: !4091)
!4095 = !DILocation(line: 0, scope: !3877, inlinedAt: !4096)
!4096 = distinct !DILocation(line: 639, column: 3, scope: !4091)
!4097 = !DILocation(line: 407, column: 31, scope: !3877, inlinedAt: !4096)
!4098 = !DILocation(line: 407, column: 27, scope: !3877, inlinedAt: !4096)
!4099 = !DILocation(line: 407, column: 8, scope: !3877, inlinedAt: !4096)
!4100 = !DILocation(line: 407, column: 3, scope: !3877, inlinedAt: !4096)
!4101 = !DILocation(line: 407, column: 12, scope: !3877, inlinedAt: !4096)
!4102 = !DILocation(line: 408, column: 3, scope: !3877, inlinedAt: !4096)
!4103 = !DILocation(line: 408, column: 12, scope: !3877, inlinedAt: !4096)
!4104 = !DILocation(line: 640, column: 10, scope: !4091)
!4105 = !DILocation(line: 640, column: 14, scope: !4091)
!4106 = !DILocation(line: 641, column: 1, scope: !4091)
!4107 = !DILocation(line: 0, scope: !858)
!4108 = !DILocation(line: 655, column: 61, scope: !858)
!4109 = !DILocation(line: 0, scope: !865, inlinedAt: !4110)
!4110 = distinct !DILocation(line: 655, column: 16, scope: !858)
!4111 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !4110)
!4112 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !4110)
!4113 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !4110)
!4114 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !4110)
!4115 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !4110)
!4116 = !DILocation(line: 439, scope: !883, inlinedAt: !4110)
!4117 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !4110)
!4118 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !4110)
!4119 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !4110)
!4120 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !4110)
!4121 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !4110)
!4122 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !4110)
!4123 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !4110)
!4124 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !4110)
!4125 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !4110)
!4126 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !4110)
!4127 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4110)
!4128 = distinct !{!4128, !4119, !4129, !255}
!4129 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !4110)
!4130 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !4110)
!4131 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !4110)
!4132 = distinct !{!4132, !4111, !4133, !255}
!4133 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !4110)
!4134 = !DILocation(line: 655, column: 10, scope: !858)
!4135 = !DILocation(line: 655, column: 14, scope: !858)
!4136 = !DILocation(line: 656, column: 1, scope: !858)
!4137 = !DILocation(line: 0, scope: !829)
!4138 = !DILocation(line: 669, column: 3, scope: !829)
!4139 = !DILocation(line: 670, column: 10, scope: !829)
!4140 = !DILocation(line: 670, column: 14, scope: !829)
!4141 = !DILocation(line: 671, column: 1, scope: !829)
!4142 = !DILocation(line: 0, scope: !850)
!4143 = !DILocation(line: 0, scope: !601, inlinedAt: !4144)
!4144 = distinct !DILocation(line: 687, column: 3, scope: !850)
!4145 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !4144)
!4146 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !4144)
!4147 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !4144)
!4148 = !DILocation(line: 509, scope: !615, inlinedAt: !4144)
!4149 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !4144)
!4150 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !4144)
!4151 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !4144)
!4152 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !4144)
!4153 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !4144)
!4154 = !DILocation(line: 0, scope: !624, inlinedAt: !4155)
!4155 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !4144)
!4156 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4155)
!4157 = !DILocation(line: 43, scope: !632, inlinedAt: !4155)
!4158 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4155)
!4159 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4155)
!4160 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4155)
!4161 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4155)
!4162 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4155)
!4163 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4155)
!4164 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4155)
!4165 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4155)
!4166 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4155)
!4167 = distinct !{!4167, !4159, !4168, !255}
!4168 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4155)
!4169 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !4144)
!4170 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4144)
!4171 = distinct !{!4171, !4150, !4172, !255}
!4172 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !4144)
!4173 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !4144)
!4174 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !4144)
!4175 = distinct !{!4175, !4145, !4176, !255}
!4176 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !4144)
!4177 = !DILocation(line: 688, column: 1, scope: !850)
!4178 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !832, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4179 = !DILocalVariable(name: "out", arg: 1, scope: !4178, file: !74, line: 700, type: !32)
!4180 = !DILocation(line: 0, scope: !4178)
!4181 = !DILocalVariable(name: "outlen", arg: 2, scope: !4178, file: !74, line: 700, type: !38)
!4182 = !DILocalVariable(name: "in", arg: 3, scope: !4178, file: !74, line: 700, type: !157)
!4183 = !DILocalVariable(name: "inlen", arg: 4, scope: !4178, file: !74, line: 700, type: !38)
!4184 = !DILocalVariable(name: "state", scope: !4178, file: !74, line: 703, type: !564)
!4185 = !DILocation(line: 703, column: 16, scope: !4178)
!4186 = !DILocation(line: 0, scope: !560, inlinedAt: !4187)
!4187 = distinct !DILocation(line: 705, column: 3, scope: !4178)
!4188 = !DILocation(line: 582, column: 3, scope: !560, inlinedAt: !4187)
!4189 = !DILocation(line: 583, column: 10, scope: !560, inlinedAt: !4187)
!4190 = !DILocation(line: 583, column: 14, scope: !560, inlinedAt: !4187)
!4191 = !DILocation(line: 706, column: 19, scope: !4178)
!4192 = !DILocalVariable(name: "nblocks", scope: !4178, file: !74, line: 702, type: !38)
!4193 = !DILocation(line: 0, scope: !593, inlinedAt: !4194)
!4194 = distinct !DILocation(line: 707, column: 3, scope: !4178)
!4195 = !DILocation(line: 0, scope: !601, inlinedAt: !4196)
!4196 = distinct !DILocation(line: 600, column: 3, scope: !593, inlinedAt: !4194)
!4197 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !4196)
!4198 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !4196)
!4199 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !4196)
!4200 = !DILocation(line: 509, scope: !615, inlinedAt: !4196)
!4201 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !4196)
!4202 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !4196)
!4203 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !4196)
!4204 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !4196)
!4205 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !4196)
!4206 = !DILocation(line: 0, scope: !624, inlinedAt: !4207)
!4207 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !4196)
!4208 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4207)
!4209 = !DILocation(line: 43, scope: !632, inlinedAt: !4207)
!4210 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4207)
!4211 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4207)
!4212 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4207)
!4213 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4207)
!4214 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4207)
!4215 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4207)
!4216 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4207)
!4217 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4207)
!4218 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4207)
!4219 = distinct !{!4219, !4211, !4220, !255}
!4220 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4207)
!4221 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !4196)
!4222 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4196)
!4223 = distinct !{!4223, !4202, !4224, !255}
!4224 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !4196)
!4225 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !4196)
!4226 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !4196)
!4227 = distinct !{!4227, !4197, !4228, !255}
!4228 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !4196)
!4229 = !DILocation(line: 708, column: 20, scope: !4178)
!4230 = !DILocation(line: 708, column: 10, scope: !4178)
!4231 = !DILocation(line: 709, column: 17, scope: !4178)
!4232 = !DILocation(line: 709, column: 7, scope: !4178)
!4233 = !DILocation(line: 0, scope: !3895, inlinedAt: !4234)
!4234 = distinct !DILocation(line: 710, column: 3, scope: !4178)
!4235 = !DILocation(line: 568, column: 61, scope: !3895, inlinedAt: !4234)
!4236 = !DILocation(line: 0, scope: !865, inlinedAt: !4237)
!4237 = distinct !DILocation(line: 568, column: 16, scope: !3895, inlinedAt: !4234)
!4238 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !4237)
!4239 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !4237)
!4240 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !4237)
!4241 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !4237)
!4242 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !4237)
!4243 = !DILocation(line: 439, scope: !883, inlinedAt: !4237)
!4244 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !4237)
!4245 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !4237)
!4246 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !4237)
!4247 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !4237)
!4248 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !4237)
!4249 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !4237)
!4250 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !4237)
!4251 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !4237)
!4252 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !4237)
!4253 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !4237)
!4254 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4237)
!4255 = distinct !{!4255, !4246, !4256, !255}
!4256 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !4237)
!4257 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !4237)
!4258 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !4237)
!4259 = distinct !{!4259, !4238, !4260, !255}
!4260 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !4237)
!4261 = !DILocation(line: 568, column: 10, scope: !3895, inlinedAt: !4234)
!4262 = !DILocation(line: 568, column: 14, scope: !3895, inlinedAt: !4234)
!4263 = !DILocation(line: 711, column: 1, scope: !4178)
!4264 = !DILocation(line: 0, scope: !831)
!4265 = !DILocation(line: 726, column: 16, scope: !831)
!4266 = !DILocation(line: 0, scope: !829, inlinedAt: !4267)
!4267 = distinct !DILocation(line: 728, column: 3, scope: !831)
!4268 = !DILocation(line: 669, column: 3, scope: !829, inlinedAt: !4267)
!4269 = !DILocation(line: 670, column: 10, scope: !829, inlinedAt: !4267)
!4270 = !DILocation(line: 670, column: 14, scope: !829, inlinedAt: !4267)
!4271 = !DILocation(line: 729, column: 19, scope: !831)
!4272 = !DILocation(line: 0, scope: !850, inlinedAt: !4273)
!4273 = distinct !DILocation(line: 730, column: 3, scope: !831)
!4274 = !DILocation(line: 0, scope: !601, inlinedAt: !4275)
!4275 = distinct !DILocation(line: 687, column: 3, scope: !850, inlinedAt: !4273)
!4276 = !DILocation(line: 507, column: 3, scope: !601, inlinedAt: !4275)
!4277 = !DILocation(line: 508, column: 5, scope: !612, inlinedAt: !4275)
!4278 = !DILocation(line: 509, column: 9, scope: !615, inlinedAt: !4275)
!4279 = !DILocation(line: 509, scope: !615, inlinedAt: !4275)
!4280 = !DILocation(line: 509, column: 14, scope: !618, inlinedAt: !4275)
!4281 = !DILocation(line: 509, column: 5, scope: !615, inlinedAt: !4275)
!4282 = !DILocation(line: 510, column: 20, scope: !618, inlinedAt: !4275)
!4283 = !DILocation(line: 510, column: 18, scope: !618, inlinedAt: !4275)
!4284 = !DILocation(line: 510, column: 24, scope: !618, inlinedAt: !4275)
!4285 = !DILocation(line: 0, scope: !624, inlinedAt: !4286)
!4286 = distinct !DILocation(line: 510, column: 7, scope: !618, inlinedAt: !4275)
!4287 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4286)
!4288 = !DILocation(line: 43, scope: !632, inlinedAt: !4286)
!4289 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4286)
!4290 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4286)
!4291 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4286)
!4292 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4286)
!4293 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4286)
!4294 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4286)
!4295 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4286)
!4296 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4286)
!4297 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4286)
!4298 = distinct !{!4298, !4290, !4299, !255}
!4299 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4286)
!4300 = !DILocation(line: 509, column: 20, scope: !618, inlinedAt: !4275)
!4301 = !DILocation(line: 509, column: 5, scope: !618, inlinedAt: !4275)
!4302 = distinct !{!4302, !4281, !4303, !255}
!4303 = !DILocation(line: 510, column: 28, scope: !615, inlinedAt: !4275)
!4304 = !DILocation(line: 511, column: 9, scope: !612, inlinedAt: !4275)
!4305 = !DILocation(line: 512, column: 13, scope: !612, inlinedAt: !4275)
!4306 = distinct !{!4306, !4276, !4307, !255}
!4307 = !DILocation(line: 513, column: 3, scope: !601, inlinedAt: !4275)
!4308 = !DILocation(line: 731, column: 20, scope: !831)
!4309 = !DILocation(line: 731, column: 10, scope: !831)
!4310 = !DILocation(line: 732, column: 17, scope: !831)
!4311 = !DILocation(line: 732, column: 7, scope: !831)
!4312 = !DILocation(line: 0, scope: !858, inlinedAt: !4313)
!4313 = distinct !DILocation(line: 733, column: 3, scope: !831)
!4314 = !DILocation(line: 655, column: 61, scope: !858, inlinedAt: !4313)
!4315 = !DILocation(line: 0, scope: !865, inlinedAt: !4316)
!4316 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !4313)
!4317 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !4316)
!4318 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !4316)
!4319 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !4316)
!4320 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !4316)
!4321 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !4316)
!4322 = !DILocation(line: 439, scope: !883, inlinedAt: !4316)
!4323 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !4316)
!4324 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !4316)
!4325 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !4316)
!4326 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !4316)
!4327 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !4316)
!4328 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !4316)
!4329 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !4316)
!4330 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !4316)
!4331 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !4316)
!4332 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !4316)
!4333 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4316)
!4334 = distinct !{!4334, !4325, !4335, !255}
!4335 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !4316)
!4336 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !4316)
!4337 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !4316)
!4338 = distinct !{!4338, !4317, !4339, !255}
!4339 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !4316)
!4340 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !4313)
!4341 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !4313)
!4342 = !DILocation(line: 734, column: 1, scope: !831)
!4343 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !4344, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4344 = !DISubroutineType(types: !4345)
!4345 = !{null, !32, !157, !38}
!4346 = !DILocalVariable(name: "h", arg: 1, scope: !4343, file: !74, line: 745, type: !32)
!4347 = !DILocation(line: 0, scope: !4343)
!4348 = !DILocalVariable(name: "in", arg: 2, scope: !4343, file: !74, line: 745, type: !157)
!4349 = !DILocalVariable(name: "inlen", arg: 3, scope: !4343, file: !74, line: 745, type: !38)
!4350 = !DILocalVariable(name: "s", scope: !4343, file: !74, line: 748, type: !510)
!4351 = !DILocation(line: 748, column: 12, scope: !4343)
!4352 = !DILocation(line: 750, column: 3, scope: !4343)
!4353 = !DILocation(line: 751, column: 3, scope: !4343)
!4354 = !DILocalVariable(name: "i", scope: !4343, file: !74, line: 747, type: !40)
!4355 = !DILocation(line: 752, column: 7, scope: !4356)
!4356 = distinct !DILexicalBlock(scope: !4343, file: !74, line: 752, column: 3)
!4357 = !DILocation(line: 752, scope: !4356)
!4358 = !DILocation(line: 752, column: 12, scope: !4359)
!4359 = distinct !DILexicalBlock(scope: !4356, file: !74, line: 752, column: 3)
!4360 = !DILocation(line: 752, column: 3, scope: !4356)
!4361 = !DILocation(line: 753, column: 16, scope: !4359)
!4362 = !DILocation(line: 753, column: 14, scope: !4359)
!4363 = !DILocation(line: 753, column: 19, scope: !4359)
!4364 = !DILocation(line: 0, scope: !624, inlinedAt: !4365)
!4365 = distinct !DILocation(line: 753, column: 5, scope: !4359)
!4366 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4365)
!4367 = !DILocation(line: 43, scope: !632, inlinedAt: !4365)
!4368 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4365)
!4369 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4365)
!4370 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4365)
!4371 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4365)
!4372 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4365)
!4373 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4365)
!4374 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4365)
!4375 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4365)
!4376 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4365)
!4377 = distinct !{!4377, !4369, !4378, !255}
!4378 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4365)
!4379 = !DILocation(line: 752, column: 16, scope: !4359)
!4380 = !DILocation(line: 752, column: 3, scope: !4359)
!4381 = distinct !{!4381, !4360, !4382, !255}
!4382 = !DILocation(line: 753, column: 23, scope: !4356)
!4383 = !DILocation(line: 754, column: 1, scope: !4343)
!4384 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !4344, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!4385 = !DILocalVariable(name: "h", arg: 1, scope: !4384, file: !74, line: 765, type: !32)
!4386 = !DILocation(line: 0, scope: !4384)
!4387 = !DILocalVariable(name: "in", arg: 2, scope: !4384, file: !74, line: 765, type: !157)
!4388 = !DILocalVariable(name: "inlen", arg: 3, scope: !4384, file: !74, line: 765, type: !38)
!4389 = !DILocalVariable(name: "s", scope: !4384, file: !74, line: 768, type: !510)
!4390 = !DILocation(line: 768, column: 12, scope: !4384)
!4391 = !DILocation(line: 770, column: 3, scope: !4384)
!4392 = !DILocation(line: 771, column: 3, scope: !4384)
!4393 = !DILocalVariable(name: "i", scope: !4384, file: !74, line: 767, type: !40)
!4394 = !DILocation(line: 772, column: 7, scope: !4395)
!4395 = distinct !DILexicalBlock(scope: !4384, file: !74, line: 772, column: 3)
!4396 = !DILocation(line: 772, scope: !4395)
!4397 = !DILocation(line: 772, column: 12, scope: !4398)
!4398 = distinct !DILexicalBlock(scope: !4395, file: !74, line: 772, column: 3)
!4399 = !DILocation(line: 772, column: 3, scope: !4395)
!4400 = !DILocation(line: 773, column: 16, scope: !4398)
!4401 = !DILocation(line: 773, column: 14, scope: !4398)
!4402 = !DILocation(line: 773, column: 19, scope: !4398)
!4403 = !DILocation(line: 0, scope: !624, inlinedAt: !4404)
!4404 = distinct !DILocation(line: 773, column: 5, scope: !4398)
!4405 = !DILocation(line: 43, column: 7, scope: !632, inlinedAt: !4404)
!4406 = !DILocation(line: 43, scope: !632, inlinedAt: !4404)
!4407 = !DILocation(line: 43, column: 12, scope: !635, inlinedAt: !4404)
!4408 = !DILocation(line: 43, column: 3, scope: !632, inlinedAt: !4404)
!4409 = !DILocation(line: 44, column: 18, scope: !635, inlinedAt: !4404)
!4410 = !DILocation(line: 44, column: 14, scope: !635, inlinedAt: !4404)
!4411 = !DILocation(line: 44, column: 12, scope: !635, inlinedAt: !4404)
!4412 = !DILocation(line: 44, column: 5, scope: !635, inlinedAt: !4404)
!4413 = !DILocation(line: 44, column: 10, scope: !635, inlinedAt: !4404)
!4414 = !DILocation(line: 43, column: 16, scope: !635, inlinedAt: !4404)
!4415 = !DILocation(line: 43, column: 3, scope: !635, inlinedAt: !4404)
!4416 = distinct !{!4416, !4408, !4417, !255}
!4417 = !DILocation(line: 44, column: 19, scope: !632, inlinedAt: !4404)
!4418 = !DILocation(line: 772, column: 16, scope: !4398)
!4419 = !DILocation(line: 772, column: 3, scope: !4398)
!4420 = distinct !{!4420, !4399, !4421, !255}
!4421 = !DILocation(line: 773, column: 23, scope: !4395)
!4422 = !DILocation(line: 774, column: 1, scope: !4384)
!4423 = !DILocation(line: 0, scope: !534)
!4424 = !DILocation(line: 23, column: 11, scope: !534)
!4425 = !DILocation(line: 25, column: 3, scope: !534)
!4426 = !DILocation(line: 26, column: 3, scope: !534)
!4427 = !DILocation(line: 26, column: 29, scope: !534)
!4428 = !DILocation(line: 27, column: 3, scope: !534)
!4429 = !DILocation(line: 27, column: 29, scope: !534)
!4430 = !DILocation(line: 0, scope: !560, inlinedAt: !4431)
!4431 = distinct !DILocation(line: 29, column: 3, scope: !534)
!4432 = !DILocation(line: 582, column: 3, scope: !560, inlinedAt: !4431)
!4433 = !DILocation(line: 583, column: 10, scope: !560, inlinedAt: !4431)
!4434 = !DILocation(line: 583, column: 14, scope: !560, inlinedAt: !4431)
!4435 = !DILocation(line: 30, column: 1, scope: !534)
!4436 = !DILocation(line: 0, scope: !812)
!4437 = !DILocation(line: 45, column: 11, scope: !812)
!4438 = !DILocation(line: 47, column: 3, scope: !812)
!4439 = !DILocation(line: 48, column: 3, scope: !812)
!4440 = !DILocation(line: 48, column: 26, scope: !812)
!4441 = !DILocation(line: 50, column: 3, scope: !812)
!4442 = !DILocation(line: 51, column: 1, scope: !812)
!4443 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !535, file: !535, line: 64, type: !1771, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!4444 = !DILocalVariable(name: "out", arg: 1, scope: !4443, file: !535, line: 64, type: !32)
!4445 = !DILocation(line: 0, scope: !4443)
!4446 = !DILocalVariable(name: "key", arg: 2, scope: !4443, file: !535, line: 64, type: !157)
!4447 = !DILocalVariable(name: "input", arg: 3, scope: !4443, file: !535, line: 64, type: !157)
!4448 = !DILocalVariable(name: "s", scope: !4443, file: !535, line: 66, type: !539)
!4449 = !DILocation(line: 66, column: 16, scope: !4443)
!4450 = !DILocation(line: 0, scope: !4063, inlinedAt: !4451)
!4451 = distinct !DILocation(line: 68, column: 3, scope: !4443)
!4452 = !DILocation(line: 0, scope: !3325, inlinedAt: !4453)
!4453 = distinct !DILocation(line: 612, column: 3, scope: !4063, inlinedAt: !4451)
!4454 = !DILocation(line: 356, column: 7, scope: !3332, inlinedAt: !4453)
!4455 = !DILocation(line: 356, scope: !3332, inlinedAt: !4453)
!4456 = !DILocation(line: 356, column: 12, scope: !3335, inlinedAt: !4453)
!4457 = !DILocation(line: 356, column: 3, scope: !3332, inlinedAt: !4453)
!4458 = !DILocation(line: 357, column: 5, scope: !3335, inlinedAt: !4453)
!4459 = !DILocation(line: 357, column: 10, scope: !3335, inlinedAt: !4453)
!4460 = !DILocation(line: 356, column: 17, scope: !3335, inlinedAt: !4453)
!4461 = !DILocation(line: 356, column: 3, scope: !3335, inlinedAt: !4453)
!4462 = distinct !{!4462, !4457, !4463, !255}
!4463 = !DILocation(line: 357, column: 12, scope: !3332, inlinedAt: !4453)
!4464 = !DILocation(line: 613, column: 10, scope: !4063, inlinedAt: !4451)
!4465 = !DILocation(line: 613, column: 14, scope: !4063, inlinedAt: !4451)
!4466 = !DILocation(line: 0, scope: !4081, inlinedAt: !4467)
!4467 = distinct !DILocation(line: 69, column: 3, scope: !4443)
!4468 = !DILocation(line: 627, column: 16, scope: !4081, inlinedAt: !4467)
!4469 = !DILocation(line: 627, column: 10, scope: !4081, inlinedAt: !4467)
!4470 = !DILocation(line: 627, column: 14, scope: !4081, inlinedAt: !4467)
!4471 = !DILocation(line: 0, scope: !4081, inlinedAt: !4472)
!4472 = distinct !DILocation(line: 70, column: 3, scope: !4443)
!4473 = !DILocation(line: 627, column: 16, scope: !4081, inlinedAt: !4472)
!4474 = !DILocation(line: 627, column: 10, scope: !4081, inlinedAt: !4472)
!4475 = !DILocation(line: 627, column: 14, scope: !4081, inlinedAt: !4472)
!4476 = !DILocation(line: 0, scope: !4091, inlinedAt: !4477)
!4477 = distinct !DILocation(line: 71, column: 3, scope: !4443)
!4478 = !DILocation(line: 0, scope: !3877, inlinedAt: !4479)
!4479 = distinct !DILocation(line: 639, column: 3, scope: !4091, inlinedAt: !4477)
!4480 = !DILocation(line: 407, column: 31, scope: !3877, inlinedAt: !4479)
!4481 = !DILocation(line: 407, column: 27, scope: !3877, inlinedAt: !4479)
!4482 = !DILocation(line: 407, column: 8, scope: !3877, inlinedAt: !4479)
!4483 = !DILocation(line: 407, column: 3, scope: !3877, inlinedAt: !4479)
!4484 = !DILocation(line: 407, column: 12, scope: !3877, inlinedAt: !4479)
!4485 = !DILocation(line: 408, column: 3, scope: !3877, inlinedAt: !4479)
!4486 = !DILocation(line: 408, column: 12, scope: !3877, inlinedAt: !4479)
!4487 = !DILocation(line: 640, column: 10, scope: !4091, inlinedAt: !4477)
!4488 = !DILocation(line: 640, column: 14, scope: !4091, inlinedAt: !4477)
!4489 = !DILocation(line: 0, scope: !858, inlinedAt: !4490)
!4490 = distinct !DILocation(line: 72, column: 3, scope: !4443)
!4491 = !DILocation(line: 0, scope: !865, inlinedAt: !4492)
!4492 = distinct !DILocation(line: 655, column: 16, scope: !858, inlinedAt: !4490)
!4493 = !DILocation(line: 434, column: 3, scope: !865, inlinedAt: !4492)
!4494 = !DILocation(line: 435, column: 12, scope: !876, inlinedAt: !4492)
!4495 = !DILocation(line: 436, column: 7, scope: !879, inlinedAt: !4492)
!4496 = !DILocation(line: 438, column: 5, scope: !879, inlinedAt: !4492)
!4497 = !DILocation(line: 439, column: 9, scope: !883, inlinedAt: !4492)
!4498 = !DILocation(line: 439, scope: !883, inlinedAt: !4492)
!4499 = !DILocation(line: 439, column: 17, scope: !886, inlinedAt: !4492)
!4500 = !DILocation(line: 439, column: 21, scope: !886, inlinedAt: !4492)
!4501 = !DILocation(line: 439, column: 5, scope: !883, inlinedAt: !4492)
!4502 = !DILocation(line: 440, column: 19, scope: !886, inlinedAt: !4492)
!4503 = !DILocation(line: 440, column: 16, scope: !886, inlinedAt: !4492)
!4504 = !DILocation(line: 440, column: 27, scope: !886, inlinedAt: !4492)
!4505 = !DILocation(line: 440, column: 23, scope: !886, inlinedAt: !4492)
!4506 = !DILocation(line: 440, column: 14, scope: !886, inlinedAt: !4492)
!4507 = !DILocation(line: 440, column: 11, scope: !886, inlinedAt: !4492)
!4508 = !DILocation(line: 439, column: 41, scope: !886, inlinedAt: !4492)
!4509 = !DILocation(line: 439, column: 5, scope: !886, inlinedAt: !4492)
!4510 = distinct !{!4510, !4501, !4511, !255}
!4511 = !DILocation(line: 440, column: 32, scope: !883, inlinedAt: !4492)
!4512 = !DILocation(line: 441, column: 16, scope: !877, inlinedAt: !4492)
!4513 = !DILocation(line: 441, column: 12, scope: !877, inlinedAt: !4492)
!4514 = distinct !{!4514, !4493, !4515, !255}
!4515 = !DILocation(line: 443, column: 3, scope: !865, inlinedAt: !4492)
!4516 = !DILocation(line: 655, column: 10, scope: !858, inlinedAt: !4490)
!4517 = !DILocation(line: 655, column: 14, scope: !858, inlinedAt: !4490)
!4518 = !DILocation(line: 73, column: 1, scope: !4443)
