; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

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
    #dbg_value(i32 0, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !113
    #dbg_value(i32 %i.0, !109, !DIExpression(), !110)
  %exitcond = icmp ne i32 %i.0, 1000, !dbg !114
  br i1 %exitcond, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %call = call fastcc i32 @test_keys() #3, !dbg !117
    #dbg_value(i32 %call, !119, !DIExpression(), !110)
  %call1 = call fastcc i32 @test_invalid_sk_a() #3, !dbg !120
  %or = or i32 %call, %call1, !dbg !121
    #dbg_value(i32 %or, !119, !DIExpression(), !110)
  %call2 = call fastcc i32 @test_invalid_ciphertext() #3, !dbg !122
  %or3 = or i32 %or, %call2, !dbg !123
    #dbg_value(i32 %or3, !119, !DIExpression(), !110)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !124
  br i1 %tobool.not, label %for.inc, label %return.loopexit, !dbg !124

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !dbg !126
    #dbg_value(i32 %inc, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 2400) #4, !dbg !131
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 1184) #4, !dbg !132
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 1088) #4, !dbg !133
  br label %return, !dbg !134

return.loopexit:                                  ; preds = %for.body
  br label %return, !dbg !135

return:                                           ; preds = %return.loopexit, %for.end
  %retval.0 = phi i32 [ 0, %for.end ], [ 1, %return.loopexit ], !dbg !110
  ret i32 %retval.0, !dbg !135
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_keys() unnamed_addr #0 !dbg !136 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !137, !DIExpression(), !141)
    #dbg_declare(ptr %sk, !142, !DIExpression(), !146)
    #dbg_declare(ptr %ct, !147, !DIExpression(), !151)
    #dbg_declare(ptr %key_a, !152, !DIExpression(), !156)
    #dbg_declare(ptr %key_b, !157, !DIExpression(), !158)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !159
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !160
  %call9 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !161
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !162
  %tobool.not = icmp eq i32 %call12, 0, !dbg !162
  br i1 %tobool.not, label %return, label %if.then, !dbg !162

if.then:                                          ; preds = %entry
  %call13 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #4, !dbg !164
  br label %return, !dbg !166

return:                                           ; preds = %entry, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %entry ], !dbg !167
  ret i32 %retval.0, !dbg !168
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !169 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !170, !DIExpression(), !171)
    #dbg_declare(ptr %sk, !172, !DIExpression(), !173)
    #dbg_declare(ptr %ct, !174, !DIExpression(), !175)
    #dbg_declare(ptr %key_a, !176, !DIExpression(), !177)
    #dbg_declare(ptr %key_b, !178, !DIExpression(), !179)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !180
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !181
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 2400) #3, !dbg !182
  %call10 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !183
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !184
  %tobool.not = icmp eq i32 %call13, 0, !dbg !184
  br i1 %tobool.not, label %if.then, label %return, !dbg !186

if.then:                                          ; preds = %entry
  %call14 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #4, !dbg !187
  br label %return, !dbg !189

return:                                           ; preds = %entry, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %entry ], !dbg !190
  ret i32 %retval.0, !dbg !191
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !192 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !193, !DIExpression(), !194)
    #dbg_declare(ptr %sk, !195, !DIExpression(), !196)
    #dbg_declare(ptr %ct, !197, !DIExpression(), !198)
    #dbg_declare(ptr %key_a, !199, !DIExpression(), !200)
    #dbg_declare(ptr %key_b, !201, !DIExpression(), !202)
  br label %do.body, !dbg !203

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !204, !DIExpression(DW_OP_deref), !205)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !206
  %0 = load i8, ptr %b, align 1, !dbg !208
    #dbg_value(i8 %0, !204, !DIExpression(), !205)
  %tobool.not = icmp eq i8 %0, 0, !dbg !209
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !210, !llvm.loop !211

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !213, !DIExpression(DW_OP_deref), !205)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !214
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !215
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !216
  %1 = load i8, ptr %b, align 1, !dbg !217
    #dbg_value(i8 %1, !204, !DIExpression(), !205)
  %2 = load i32, ptr %pos, align 4, !dbg !218
    #dbg_value(i32 %2, !213, !DIExpression(), !205)
  %rem = urem i32 %2, 1088, !dbg !219
  %arrayidx = getelementptr inbounds nuw [1088 x i8], ptr %ct, i32 0, i32 %rem, !dbg !220
  %3 = load i8, ptr %arrayidx, align 1, !dbg !221
  %xor1 = xor i8 %3, %1, !dbg !221
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !221
  %call11 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !222
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !223
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !223
  br i1 %tobool15.not, label %if.then, label %return, !dbg !225

if.then:                                          ; preds = %do.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #4, !dbg !226
  br label %return, !dbg !228

return:                                           ; preds = %do.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %do.end ], !dbg !205
  ret i32 %retval.0, !dbg !229
}

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !230, !DIExpression(), !231)
    #dbg_value(i32 %outlen, !232, !DIExpression(), !231)
  br label %while.cond, !dbg !233

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !234
  %cmp = icmp eq i32 %0, -1, !dbg !235
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !233

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !236

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.6, i32 noundef 0) #4, !dbg !237
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !239
  %cmp1 = icmp eq i32 %call, -1, !dbg !240
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !242

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !243
  %1 = load i32, ptr %call2, align 4, !dbg !243
  %cmp3 = icmp eq i32 %1, 4, !dbg !244
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !242

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !245
  %cmp4 = icmp eq i32 %2, -1, !dbg !247
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !247

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !248
  br label %if.end6, !dbg !248

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !233

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !234, !llvm.loop !249

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !230, !DIExpression(), !231)
    #dbg_value(i32 %outlen.addr.0.ph, !232, !DIExpression(), !231)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !251
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !236

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !252
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !254
    #dbg_value(i32 %call10, !255, !DIExpression(), !231)
  %cond = icmp eq i32 %call10, -1, !dbg !260
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !260

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !262
  %4 = load i32, ptr %call13, align 4, !dbg !262
  %cmp14 = icmp eq i32 %4, 4, !dbg !263
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !260, !llvm.loop !264

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !254
  call void @abort() #4, !dbg !266
  br label %if.end20, !dbg !266

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !254
  br label %if.end20, !dbg !268

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !268
    #dbg_value(ptr %add.ptr, !230, !DIExpression(), !231)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !269
    #dbg_value(i32 %sub, !232, !DIExpression(), !231)
  br label %while.cond7.outer, !dbg !236, !llvm.loop !264

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !236

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !270
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !271 {
entry:
    #dbg_value(ptr %pk, !277, !DIExpression(), !278)
    #dbg_value(ptr %sk, !279, !DIExpression(), !278)
    #dbg_value(ptr %coins, !280, !DIExpression(), !278)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !281
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !282
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !283
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !284
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #3, !dbg !284
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !285
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !286
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !287
  ret i32 0, !dbg !288
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !289 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !292, !DIExpression(), !293)
    #dbg_value(ptr %sk, !294, !DIExpression(), !293)
    #dbg_declare(ptr %coins, !295, !DIExpression(), !299)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !300
  %call = call i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !301
  ret i32 0, !dbg !302
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !303 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !306, !DIExpression(), !307)
    #dbg_value(ptr %ss, !308, !DIExpression(), !307)
    #dbg_value(ptr %pk, !309, !DIExpression(), !307)
    #dbg_value(ptr %coins, !310, !DIExpression(), !307)
    #dbg_declare(ptr %buf, !311, !DIExpression(), !312)
    #dbg_declare(ptr %kr, !313, !DIExpression(), !314)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !315
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !316
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #3, !dbg !316
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !317
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !318
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !319
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !320
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !322 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !323, !DIExpression(), !324)
    #dbg_value(ptr %ss, !325, !DIExpression(), !324)
    #dbg_value(ptr %pk, !326, !DIExpression(), !324)
    #dbg_declare(ptr %coins, !327, !DIExpression(), !328)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !329
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !330
  ret i32 0, !dbg !331
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !332 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !335, !DIExpression(), !336)
    #dbg_value(ptr %ct, !337, !DIExpression(), !336)
    #dbg_value(ptr %sk, !338, !DIExpression(), !336)
    #dbg_declare(ptr %buf, !339, !DIExpression(), !340)
    #dbg_declare(ptr %kr, !341, !DIExpression(), !342)
    #dbg_declare(ptr %cmp, !343, !DIExpression(), !344)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !345
    #dbg_value(ptr %add.ptr, !346, !DIExpression(), !336)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !347
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !348
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !349
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !350
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !351
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !352
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !353
  %call12 = call i32 @pqcrystals_kyber768_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1088) #3, !dbg !354
    #dbg_value(i32 %call12, !355, !DIExpression(), !336)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !356
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !356
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !357
  %conv = xor i8 %0, 1, !dbg !357
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !358
  ret i32 0, !dbg !359
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !360 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !375, !DIExpression(), !376)
    #dbg_value(ptr %seed, !377, !DIExpression(), !376)
    #dbg_value(i32 %transposed, !378, !DIExpression(), !376)
    #dbg_declare(ptr %buf, !379, !DIExpression(), !383)
    #dbg_declare(ptr %state, !384, !DIExpression(), !390)
    #dbg_value(i32 0, !391, !DIExpression(), !376)
  br label %for.cond, !dbg !392

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !394
    #dbg_value(i32 %i.0, !391, !DIExpression(), !376)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !395
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !397

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !398

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !401
    #dbg_value(i32 %j.0, !402, !DIExpression(), !376)
  %exitcond = icmp ne i32 %j.0, 3, !dbg !403
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !398

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !405
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !405

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !408
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !408
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !408
  br label %if.end, !dbg !408

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !409
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !409
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !409
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !410
    #dbg_value(i32 504, !411, !DIExpression(), !376)
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !412
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !413
    #dbg_value(i32 %call, !414, !DIExpression(), !376)
  br label %while.cond, !dbg !415

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !416
    #dbg_value(i32 %ctr.0, !414, !DIExpression(), !376)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !417
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !415

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !418
    #dbg_value(i32 168, !411, !DIExpression(), !376)
  %arrayidx14 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !420
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !421
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !422
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !423
  %add = add i32 %ctr.0, %call17, !dbg !424
    #dbg_value(i32 %add, !414, !DIExpression(), !376)
  br label %while.cond, !dbg !415, !llvm.loop !425

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !427
    #dbg_value(i32 %inc, !402, !DIExpression(), !376)
  br label %for.cond1, !dbg !428, !llvm.loop !429

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !431
    #dbg_value(i32 %inc19, !391, !DIExpression(), !376)
  br label %for.cond, !dbg !432, !llvm.loop !433

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !435
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !436 {
entry:
    #dbg_value(ptr %r, !440, !DIExpression(), !441)
    #dbg_value(i32 %len, !442, !DIExpression(), !441)
    #dbg_value(ptr %buf, !443, !DIExpression(), !441)
    #dbg_value(i32 %buflen, !444, !DIExpression(), !441)
    #dbg_value(i32 0, !445, !DIExpression(), !441)
    #dbg_value(i32 0, !446, !DIExpression(), !441)
  br label %while.cond, !dbg !447

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !441
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !441
    #dbg_value(i32 %pos.0, !445, !DIExpression(), !441)
    #dbg_value(i32 %ctr.0, !446, !DIExpression(), !441)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !448
  %add = add nuw nsw i32 %pos.0, 3, !dbg !449
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !449
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !449
  br i1 %0, label %while.body, label %while.end, !dbg !447

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !450
  %1 = load i8, ptr %arrayidx, align 1, !dbg !450
  %conv = zext i8 %1 to i16, !dbg !450
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !452
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !452
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !452
  %conv6 = zext i8 %3 to i16, !dbg !453
  %shl = shl nuw i16 %conv6, 8, !dbg !454
  %shl.masked = and i16 %shl, 3840, !dbg !455
  %and = or disjoint i16 %shl.masked, %conv, !dbg !455
    #dbg_value(i16 %and, !456, !DIExpression(), !441)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !457
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !457
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !457
  %6 = lshr i8 %5, 4, !dbg !458
  %shr11 = zext nneg i8 %6 to i16, !dbg !458
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !459
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !459
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !459
  %conv15 = zext i8 %8 to i16, !dbg !460
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !461
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !462
    #dbg_value(i16 %or17, !463, !DIExpression(), !441)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !464
    #dbg_value(i32 %add20, !445, !DIExpression(), !441)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !465
  br i1 %cmp22, label %if.then, label %if.end, !dbg !465

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !467
    #dbg_value(i32 %inc, !446, !DIExpression(), !441)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !468
  store i16 %and, ptr %arrayidx24, align 2, !dbg !469
  br label %if.end, !dbg !468

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !441
    #dbg_value(i32 %ctr.1, !446, !DIExpression(), !441)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !470
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !472
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !472

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !473
    #dbg_value(i32 %inc31, !446, !DIExpression(), !441)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !474
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !475
  br label %if.end33, !dbg !474

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !476
    #dbg_value(i32 %ctr.2, !446, !DIExpression(), !441)
  br label %while.cond, !dbg !447, !llvm.loop !477

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !441
  ret i32 %ctr.0.lcssa, !dbg !479
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !480 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x [3 x [256 x i16]]], align 2
  %e = alloca [3 x [256 x i16]], align 2
  %pkpv = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !483, !DIExpression(), !484)
    #dbg_value(ptr %sk, !485, !DIExpression(), !484)
    #dbg_value(ptr %coins, !486, !DIExpression(), !484)
    #dbg_declare(ptr %buf, !487, !DIExpression(), !488)
    #dbg_value(ptr %buf, !489, !DIExpression(), !484)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !490
    #dbg_value(ptr %add.ptr, !491, !DIExpression(), !484)
    #dbg_value(i8 0, !492, !DIExpression(), !484)
    #dbg_declare(ptr %a, !493, !DIExpression(), !495)
    #dbg_declare(ptr %e, !496, !DIExpression(), !497)
    #dbg_declare(ptr %pkpv, !498, !DIExpression(), !499)
    #dbg_declare(ptr %skpv, !500, !DIExpression(), !501)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !502
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !503
  store i8 3, ptr %arrayidx, align 1, !dbg !504
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !505
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !506
    #dbg_value(i32 0, !507, !DIExpression(), !484)
  br label %for.cond, !dbg !508

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !510
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !484
    #dbg_value(i8 %nonce.0, !492, !DIExpression(), !484)
    #dbg_value(i32 %i.0, !507, !DIExpression(), !484)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !511
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !513

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !514

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !516
    #dbg_value(i8 %nonce.0, !492, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !484)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !517
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !518
    #dbg_value(i8 %inc, !492, !DIExpression(), !484)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !519
    #dbg_value(i32 %inc7, !507, !DIExpression(), !484)
  br label %for.cond, !dbg !520, !llvm.loop !521

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !523
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 3, %for.cond8.preheader ], !dbg !484
    #dbg_value(i8 %nonce.1, !492, !DIExpression(), !484)
    #dbg_value(i32 %i.1, !507, !DIExpression(), !484)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !524
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !514

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !526
    #dbg_value(i8 %nonce.1, !492, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !484)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !527
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !528
    #dbg_value(i8 %inc12, !492, !DIExpression(), !484)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !529
    #dbg_value(i32 %inc14, !507, !DIExpression(), !484)
  br label %for.cond8, !dbg !530, !llvm.loop !531

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !533
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !534
    #dbg_value(i32 0, !507, !DIExpression(), !484)
  br label %for.cond16, !dbg !535

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !537
    #dbg_value(i32 %i.2, !507, !DIExpression(), !484)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !538
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !540

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !541
  %arrayidx20 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !543
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !544
  %arrayidx21 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !545
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !546
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !547
    #dbg_value(i32 %inc23, !507, !DIExpression(), !484)
  br label %for.cond16, !dbg !548, !llvm.loop !549

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !551
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !552
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !553
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !554
  ret void, !dbg !555
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !556 {
entry:
    #dbg_value(ptr %r, !559, !DIExpression(), !560)
    #dbg_value(ptr %sk, !561, !DIExpression(), !560)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !562
  ret void, !dbg !563
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !564 {
entry:
    #dbg_value(ptr %r, !567, !DIExpression(), !568)
    #dbg_value(ptr %pk, !569, !DIExpression(), !568)
    #dbg_value(ptr %seed, !570, !DIExpression(), !568)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !571
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1152, !dbg !572
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !573
  ret void, !dbg !574
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !575 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca [3 x [256 x i16]], align 2
  %pkpv = alloca [3 x [256 x i16]], align 2
  %ep = alloca [3 x [256 x i16]], align 2
  %at = alloca [3 x [3 x [256 x i16]]], align 2
  %b = alloca [3 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %k = alloca [256 x i16], align 2
  %epp = alloca [256 x i16], align 2
    #dbg_value(ptr %c, !578, !DIExpression(), !579)
    #dbg_value(ptr %m, !580, !DIExpression(), !579)
    #dbg_value(ptr %pk, !581, !DIExpression(), !579)
    #dbg_value(ptr %coins, !582, !DIExpression(), !579)
    #dbg_declare(ptr %seed, !583, !DIExpression(), !584)
    #dbg_value(i8 0, !585, !DIExpression(), !579)
    #dbg_declare(ptr %sp, !586, !DIExpression(), !587)
    #dbg_declare(ptr %pkpv, !588, !DIExpression(), !589)
    #dbg_declare(ptr %ep, !590, !DIExpression(), !591)
    #dbg_declare(ptr %at, !592, !DIExpression(), !593)
    #dbg_declare(ptr %b, !594, !DIExpression(), !595)
    #dbg_declare(ptr %v, !596, !DIExpression(), !597)
    #dbg_declare(ptr %k, !598, !DIExpression(), !599)
    #dbg_declare(ptr %epp, !600, !DIExpression(), !601)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !602
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !603
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !604
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !606

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !608
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !579
    #dbg_value(i8 %nonce.0, !585, !DIExpression(), !579)
    #dbg_value(i32 %i.0, !605, !DIExpression(), !579)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !609
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !611

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !612

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !614
    #dbg_value(i8 %nonce.0, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !615
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !616
    #dbg_value(i8 %inc, !585, !DIExpression(), !579)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !617
    #dbg_value(i32 %inc4, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !618, !llvm.loop !619

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !621
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 3, %for.cond5.preheader ], !dbg !579
    #dbg_value(i8 %nonce.1, !585, !DIExpression(), !579)
    #dbg_value(i32 %i.1, !605, !DIExpression(), !579)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !622
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !612

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !624
    #dbg_value(i8 %nonce.1, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !625
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !626
    #dbg_value(i8 %inc10, !585, !DIExpression(), !579)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !627
    #dbg_value(i32 %inc12, !605, !DIExpression(), !579)
  br label %for.cond5, !dbg !628, !llvm.loop !629

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 6) #3, !dbg !631
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !632
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond15, !dbg !633

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !635
    #dbg_value(i32 %i.2, !605, !DIExpression(), !579)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !636
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !638

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !639
  %arrayidx18 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !640
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !641
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !642
    #dbg_value(i32 %inc20, !605, !DIExpression(), !579)
  br label %for.cond15, !dbg !643, !llvm.loop !644

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !646
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !647
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !648
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !649
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !650
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !651
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !652
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !653
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !654
  ret void, !dbg !655
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !656 {
entry:
    #dbg_value(ptr %pk, !659, !DIExpression(), !660)
    #dbg_value(ptr %seed, !661, !DIExpression(), !660)
    #dbg_value(ptr %packedpk, !662, !DIExpression(), !660)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !663
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1152, !dbg !664
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !665
  ret void, !dbg !666
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !667 {
entry:
    #dbg_value(ptr %r, !671, !DIExpression(), !672)
    #dbg_value(ptr %b, !673, !DIExpression(), !672)
    #dbg_value(ptr %v, !674, !DIExpression(), !672)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !675
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 960, !dbg !676
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !677
  ret void, !dbg !678
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !679 {
entry:
  %b = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !682, !DIExpression(), !683)
    #dbg_value(ptr %c, !684, !DIExpression(), !683)
    #dbg_value(ptr %sk, !685, !DIExpression(), !683)
    #dbg_declare(ptr %b, !686, !DIExpression(), !687)
    #dbg_declare(ptr %skpv, !688, !DIExpression(), !689)
    #dbg_declare(ptr %v, !690, !DIExpression(), !691)
    #dbg_declare(ptr %mp, !692, !DIExpression(), !693)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !694
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !695
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !696
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !697
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !698
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !699
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !700
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !701
  ret void, !dbg !702
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !703 {
entry:
    #dbg_value(ptr %b, !706, !DIExpression(), !707)
    #dbg_value(ptr %v, !708, !DIExpression(), !707)
    #dbg_value(ptr %c, !709, !DIExpression(), !707)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !710
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !711
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !712
  ret void, !dbg !713
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !714 {
entry:
    #dbg_value(ptr %sk, !717, !DIExpression(), !718)
    #dbg_value(ptr %packedsk, !719, !DIExpression(), !718)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !720
  ret void, !dbg !721
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !722 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !728, !DIExpression(), !729)
    #dbg_value(ptr %a, !730, !DIExpression(), !729)
    #dbg_declare(ptr %t, !731, !DIExpression(), !735)
    #dbg_value(i32 0, !736, !DIExpression(), !729)
  br label %for.cond, !dbg !737

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !739
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !728, !DIExpression(), !729)
    #dbg_value(i32 %i.0, !736, !DIExpression(), !729)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !740
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !742

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !743

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !746
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !728, !DIExpression(), !729)
    #dbg_value(i32 %j.0, !747, !DIExpression(), !729)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !748
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !743

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !750

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !753
    #dbg_value(i32 %k.0, !754, !DIExpression(), !729)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !755
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !750

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !757
  %add = or disjoint i32 %mul, %k.0, !dbg !759
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !760
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !760
  %isneg = icmp slt i16 %0, 0, !dbg !761
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !761
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !762
  %add12 = add i16 %and, %0, !dbg !763
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !763
  %conv15 = zext i16 %add12 to i64, !dbg !764
    #dbg_value(i64 %conv15, !765, !DIExpression(), !729)
    #dbg_value(i64 %conv15, !765, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !729)
    #dbg_value(i64 %conv15, !765, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !729)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !766
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !766
    #dbg_value(i64 %mul17, !765, !DIExpression(), !729)
  %shr18 = lshr i64 %mul17, 32, !dbg !767
    #dbg_value(i64 %shr18, !765, !DIExpression(), !729)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !768
  %conv20 = and i16 %2, 1023, !dbg !768
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !769
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !770
  %inc = add nuw nsw i32 %k.0, 1, !dbg !771
    #dbg_value(i32 %inc, !754, !DIExpression(), !729)
  br label %for.cond4, !dbg !772, !llvm.loop !773

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !775
  %conv25 = trunc i16 %3 to i8, !dbg !776
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !777
  %4 = load i16, ptr %t, align 2, !dbg !778
  %5 = lshr i16 %4, 8, !dbg !779
  %shr29 = trunc nuw i16 %5 to i8, !dbg !779
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !780
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !780
  %conv31 = trunc i16 %6 to i8, !dbg !780
  %shl32 = shl i8 %conv31, 2, !dbg !781
  %or = or i8 %shl32, %shr29, !dbg !782
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !783
  store i8 %or, ptr %arrayidx34, align 1, !dbg !784
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !785
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !785
  %8 = lshr i16 %7, 6, !dbg !786
  %shr37 = trunc i16 %8 to i8, !dbg !786
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !787
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !787
  %conv39 = trunc i16 %9 to i8, !dbg !787
  %shl40 = shl i8 %conv39, 4, !dbg !788
  %or41 = or i8 %shl40, %shr37, !dbg !789
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !790
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !791
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !792
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !792
  %11 = lshr i16 %10, 4, !dbg !793
  %shr46 = trunc i16 %11 to i8, !dbg !793
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !794
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !794
  %conv48 = trunc i16 %12 to i8, !dbg !794
  %shl49 = shl i8 %conv48, 6, !dbg !795
  %or50 = or i8 %shl49, %shr46, !dbg !796
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !797
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !798
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !799
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !799
  %14 = lshr i16 %13, 2, !dbg !800
  %conv56 = trunc i16 %14 to i8, !dbg !801
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !802
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !803
    #dbg_value(ptr %r.addr.1, !728, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !729)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !804
    #dbg_value(ptr %add.ptr, !728, !DIExpression(), !729)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !805
    #dbg_value(i32 %inc59, !747, !DIExpression(), !729)
  br label %for.cond1, !dbg !806, !llvm.loop !807

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !809
    #dbg_value(i32 %inc62, !736, !DIExpression(), !729)
  br label %for.cond, !dbg !810, !llvm.loop !811

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !813
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !814 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !815, !DIExpression(), !816)
    #dbg_value(ptr %a, !817, !DIExpression(), !816)
    #dbg_declare(ptr %t, !818, !DIExpression(), !819)
    #dbg_value(i32 0, !820, !DIExpression(), !816)
  br label %for.cond, !dbg !821

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !823
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !817, !DIExpression(), !816)
    #dbg_value(i32 %i.0, !820, !DIExpression(), !816)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !824
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !826

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !827

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !830
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !817, !DIExpression(), !816)
    #dbg_value(i32 %j.0, !831, !DIExpression(), !816)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !832
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !827

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !834
  %conv = zext i8 %0 to i16, !dbg !834
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !836
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !836
  %conv6 = zext i8 %1 to i16, !dbg !837
  %shl = shl nuw i16 %conv6, 8, !dbg !838
  %or = or disjoint i16 %shl, %conv, !dbg !839
  store i16 %or, ptr %t, align 2, !dbg !840
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !841
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !841
  %3 = lshr i8 %2, 2, !dbg !842
  %shr11 = zext nneg i8 %3 to i16, !dbg !842
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !843
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !843
  %conv14 = zext i8 %4 to i16, !dbg !844
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !845
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !846
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !847
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !848
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !849
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !849
  %6 = lshr i8 %5, 4, !dbg !850
  %shr21 = zext nneg i8 %6 to i16, !dbg !850
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !851
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !851
  %conv24 = zext i8 %7 to i16, !dbg !852
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !853
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !854
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !855
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !856
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !857
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !857
  %9 = lshr i8 %8, 6, !dbg !858
  %shr31 = zext nneg i8 %9 to i16, !dbg !858
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !859
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !859
  %conv34 = zext i8 %10 to i16, !dbg !860
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !861
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !862
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !863
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !864
    #dbg_value(ptr %add.ptr, !817, !DIExpression(), !816)
    #dbg_value(i32 0, !865, !DIExpression(), !816)
  br label %for.cond39, !dbg !866

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !868
    #dbg_value(i32 %k.0, !865, !DIExpression(), !816)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !869
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !871

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !872
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !872
  %12 = and i16 %11, 1023, !dbg !873
  %and = zext nneg i16 %12 to i32, !dbg !873
  %mul = mul nuw nsw i32 %and, 3329, !dbg !874
  %add = add nuw nsw i32 %mul, 512, !dbg !875
  %shr45 = lshr i32 %add, 10, !dbg !876
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !877
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !878
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !879
  %arrayidx50 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !880
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !881
  %inc = add nuw nsw i32 %k.0, 1, !dbg !882
    #dbg_value(i32 %inc, !865, !DIExpression(), !816)
  br label %for.cond39, !dbg !883, !llvm.loop !884

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !886
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !887
    #dbg_value(i32 %inc52, !831, !DIExpression(), !816)
  br label %for.cond1, !dbg !888, !llvm.loop !889

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !891
    #dbg_value(i32 %inc55, !820, !DIExpression(), !816)
  br label %for.cond, !dbg !892, !llvm.loop !893

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !895
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !896 {
entry:
    #dbg_value(ptr %r, !897, !DIExpression(), !898)
    #dbg_value(ptr %a, !899, !DIExpression(), !898)
    #dbg_value(i32 0, !900, !DIExpression(), !898)
  br label %for.cond, !dbg !901

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !903
    #dbg_value(i32 %i.0, !900, !DIExpression(), !898)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !904
  br i1 %exitcond, label %for.body, label %for.end, !dbg !906

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !907
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !908
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !909
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !910
  %inc = add nuw nsw i32 %i.0, 1, !dbg !911
    #dbg_value(i32 %inc, !900, !DIExpression(), !898)
  br label %for.cond, !dbg !912, !llvm.loop !913

for.end:                                          ; preds = %for.cond
  ret void, !dbg !915
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !916 {
entry:
    #dbg_value(ptr %r, !917, !DIExpression(), !918)
    #dbg_value(ptr %a, !919, !DIExpression(), !918)
    #dbg_value(i32 0, !920, !DIExpression(), !918)
  br label %for.cond, !dbg !921

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !923
    #dbg_value(i32 %i.0, !920, !DIExpression(), !918)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !927
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !928
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !929
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !930
  %inc = add nuw nsw i32 %i.0, 1, !dbg !931
    #dbg_value(i32 %inc, !920, !DIExpression(), !918)
  br label %for.cond, !dbg !932, !llvm.loop !933

for.end:                                          ; preds = %for.cond
  ret void, !dbg !935
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !936 {
entry:
    #dbg_value(ptr %r, !939, !DIExpression(), !940)
    #dbg_value(i32 0, !941, !DIExpression(), !940)
  br label %for.cond, !dbg !942

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !944
    #dbg_value(i32 %i.0, !941, !DIExpression(), !940)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !945
  br i1 %exitcond, label %for.body, label %for.end, !dbg !947

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !948
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !949
  %inc = add nuw nsw i32 %i.0, 1, !dbg !950
    #dbg_value(i32 %inc, !941, !DIExpression(), !940)
  br label %for.cond, !dbg !951, !llvm.loop !952

for.end:                                          ; preds = %for.cond
  ret void, !dbg !954
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !955 {
entry:
    #dbg_value(ptr %r, !956, !DIExpression(), !957)
    #dbg_value(i32 0, !958, !DIExpression(), !957)
  br label %for.cond, !dbg !959

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !961
    #dbg_value(i32 %i.0, !958, !DIExpression(), !957)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !962
  br i1 %exitcond, label %for.body, label %for.end, !dbg !964

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !965
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !966
  %inc = add nuw nsw i32 %i.0, 1, !dbg !967
    #dbg_value(i32 %inc, !958, !DIExpression(), !957)
  br label %for.cond, !dbg !968, !llvm.loop !969

for.end:                                          ; preds = %for.cond
  ret void, !dbg !971
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !972 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !975, !DIExpression(), !976)
    #dbg_value(ptr %a, !977, !DIExpression(), !976)
    #dbg_value(ptr %b, !978, !DIExpression(), !976)
    #dbg_declare(ptr %t, !979, !DIExpression(), !980)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !981
    #dbg_value(i32 1, !982, !DIExpression(), !976)
  br label %for.cond, !dbg !983

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !985
    #dbg_value(i32 %i.0, !982, !DIExpression(), !976)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !986
  br i1 %exitcond, label %for.body, label %for.end, !dbg !988

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !989
  %arrayidx3 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !991
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !992
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !993
  %inc = add nuw nsw i32 %i.0, 1, !dbg !994
    #dbg_value(i32 %inc, !982, !DIExpression(), !976)
  br label %for.cond, !dbg !995, !llvm.loop !996

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !998
  ret void, !dbg !999
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1000 {
entry:
    #dbg_value(ptr %r, !1001, !DIExpression(), !1002)
    #dbg_value(i32 0, !1003, !DIExpression(), !1002)
  br label %for.cond, !dbg !1004

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1006
    #dbg_value(i32 %i.0, !1003, !DIExpression(), !1002)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1007
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1009

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1010
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1011
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1012
    #dbg_value(i32 %inc, !1003, !DIExpression(), !1002)
  br label %for.cond, !dbg !1013, !llvm.loop !1014

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1016
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1017 {
entry:
    #dbg_value(ptr %r, !1020, !DIExpression(), !1021)
    #dbg_value(ptr %a, !1022, !DIExpression(), !1021)
    #dbg_value(ptr %b, !1023, !DIExpression(), !1021)
    #dbg_value(i32 0, !1024, !DIExpression(), !1021)
  br label %for.cond, !dbg !1025

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1027
    #dbg_value(i32 %i.0, !1024, !DIExpression(), !1021)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1028
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1030

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1031
  %arrayidx1 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1032
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1033
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !1034
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1035
    #dbg_value(i32 %inc, !1024, !DIExpression(), !1021)
  br label %for.cond, !dbg !1036, !llvm.loop !1037

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1039
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1040 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1046, !DIExpression(), !1047)
    #dbg_value(ptr %a, !1048, !DIExpression(), !1047)
    #dbg_declare(ptr %t, !1049, !DIExpression(), !1053)
    #dbg_value(i32 0, !1054, !DIExpression(), !1047)
  br label %for.cond, !dbg !1055

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1057
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1046, !DIExpression(), !1047)
    #dbg_value(i32 %i.0, !1054, !DIExpression(), !1047)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1058
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1060

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1061

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1064
    #dbg_value(i32 %j.0, !1065, !DIExpression(), !1047)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1066
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1061

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1068
  %add = or disjoint i32 %mul, %j.0, !dbg !1070
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1071
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1071
    #dbg_value(i16 %0, !1072, !DIExpression(), !1047)
  %isneg = icmp slt i16 %0, 0, !dbg !1073
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1073
  %add5 = add i16 %and, %0, !dbg !1074
    #dbg_value(i16 %add5, !1072, !DIExpression(), !1047)
  %conv7 = sext i16 %add5 to i32, !dbg !1075
    #dbg_value(i32 %conv7, !1076, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1047)
    #dbg_value(i32 %conv7, !1076, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1047)
  %1 = mul i32 %conv7, 1290160, !dbg !1077
  %mul9 = add i32 %1, 134257275, !dbg !1077
    #dbg_value(i32 %mul9, !1076, !DIExpression(), !1047)
  %shr10 = lshr i32 %mul9, 28, !dbg !1078
    #dbg_value(i32 %shr10, !1076, !DIExpression(), !1047)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1079
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1080
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1081
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1082
    #dbg_value(i32 %inc, !1065, !DIExpression(), !1047)
  br label %for.cond1, !dbg !1083, !llvm.loop !1084

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1086
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1087
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1087
  %shl18 = shl i8 %3, 4, !dbg !1088
  %or = or i8 %shl18, %2, !dbg !1089
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1090
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1091
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1091
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1092
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1092
  %shl25 = shl i8 %5, 4, !dbg !1093
  %or26 = or i8 %shl25, %4, !dbg !1094
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1095
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1096
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1097
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1097
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1098
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1098
  %shl33 = shl i8 %7, 4, !dbg !1099
  %or34 = or i8 %shl33, %6, !dbg !1100
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1101
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1102
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1103
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1103
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1104
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1104
  %shl41 = shl i8 %9, 4, !dbg !1105
  %or42 = or i8 %shl41, %8, !dbg !1106
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1107
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1108
    #dbg_value(ptr %r.addr.0, !1046, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1047)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1109
    #dbg_value(ptr %add.ptr, !1046, !DIExpression(), !1047)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1110
    #dbg_value(i32 %inc46, !1054, !DIExpression(), !1047)
  br label %for.cond, !dbg !1111, !llvm.loop !1112

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1114
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1115 {
entry:
    #dbg_value(ptr %r, !1118, !DIExpression(), !1119)
    #dbg_value(ptr %a, !1120, !DIExpression(), !1119)
    #dbg_value(i32 0, !1121, !DIExpression(), !1119)
  br label %for.cond, !dbg !1122

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1124
    #dbg_value(i32 %i.0, !1121, !DIExpression(), !1119)
    #dbg_value(ptr %a.addr.0, !1120, !DIExpression(), !1119)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1125
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1127

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1128
  %1 = and i8 %0, 15, !dbg !1130
  %conv2 = zext nneg i8 %1 to i32, !dbg !1131
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1132
  %add = add nuw nsw i32 %mul, 8, !dbg !1133
  %shr = lshr i32 %add, 4, !dbg !1134
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1135
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1136
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1137
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1138
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1139
  %3 = lshr i8 %2, 4, !dbg !1140
  %conv11 = zext nneg i8 %3 to i32, !dbg !1141
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1142
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1143
  %shr14 = lshr i32 %add13, 4, !dbg !1144
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1145
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1146
  %add17 = or disjoint i32 %mul16, 1, !dbg !1147
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1148
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1149
    #dbg_value(ptr %a.addr.0, !1120, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1119)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1150
    #dbg_value(ptr %add.ptr, !1120, !DIExpression(), !1119)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1151
    #dbg_value(i32 %inc, !1121, !DIExpression(), !1119)
  br label %for.cond, !dbg !1152, !llvm.loop !1153

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1156 {
entry:
    #dbg_value(ptr %r, !1157, !DIExpression(), !1158)
    #dbg_value(ptr %a, !1159, !DIExpression(), !1158)
    #dbg_value(i32 0, !1160, !DIExpression(), !1158)
  br label %for.cond, !dbg !1161

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1163
    #dbg_value(i32 %i.0, !1160, !DIExpression(), !1158)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1164
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1166

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1167
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1169
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1169
    #dbg_value(i16 %0, !1170, !DIExpression(), !1158)
  %isneg = icmp slt i16 %0, 0, !dbg !1171
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1171
  %add = add i16 %and, %0, !dbg !1172
    #dbg_value(i16 %add, !1170, !DIExpression(), !1158)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1173
  %add4 = or disjoint i32 %mul3, 1, !dbg !1174
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1175
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1175
    #dbg_value(i16 %1, !1176, !DIExpression(), !1158)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1177
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1177
  %add10 = add i16 %and8, %1, !dbg !1178
    #dbg_value(i16 %add10, !1176, !DIExpression(), !1158)
  %conv14 = trunc i16 %add to i8, !dbg !1179
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1180
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1181
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1182
  %2 = lshr i16 %add, 8, !dbg !1183
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1183
  %conv20 = trunc i16 %add10 to i8, !dbg !1184
  %shl = shl i8 %conv20, 4, !dbg !1185
  %or = or i8 %shl, %shr19, !dbg !1186
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1187
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1188
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1188
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1189
  %4 = lshr i16 %add10, 4, !dbg !1190
  %conv27 = trunc i16 %4 to i8, !dbg !1191
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1192
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1193
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1193
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1194
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1195
    #dbg_value(i32 %inc, !1160, !DIExpression(), !1158)
  br label %for.cond, !dbg !1196, !llvm.loop !1197

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1199
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1200 {
entry:
    #dbg_value(ptr %r, !1201, !DIExpression(), !1202)
    #dbg_value(ptr %a, !1203, !DIExpression(), !1202)
    #dbg_value(i32 0, !1204, !DIExpression(), !1202)
  br label %for.cond, !dbg !1205

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1207
    #dbg_value(i32 %i.0, !1204, !DIExpression(), !1202)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1208
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1210

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1211
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1213
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1213
  %conv = zext i8 %0 to i16, !dbg !1213
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1214
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1215
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1215
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1215
  %conv5 = zext i8 %2 to i16, !dbg !1216
  %shl = shl nuw i16 %conv5, 8, !dbg !1217
  %shl.masked = and i16 %shl, 3840, !dbg !1218
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1218
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1219
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1220
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1221
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1222
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1223
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1223
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1223
  %5 = lshr i8 %4, 4, !dbg !1224
  %shr13 = zext nneg i8 %5 to i16, !dbg !1224
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1225
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1226
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1226
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1226
  %conv18 = zext i8 %7 to i16, !dbg !1227
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1228
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1229
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1230
  %add24 = or disjoint i32 %mul23, 1, !dbg !1231
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1232
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1233
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1234
    #dbg_value(i32 %inc, !1204, !DIExpression(), !1202)
  br label %for.cond, !dbg !1235, !llvm.loop !1236

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1238
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1239 {
entry:
    #dbg_value(ptr %r, !1240, !DIExpression(), !1241)
    #dbg_value(ptr %msg, !1242, !DIExpression(), !1241)
    #dbg_value(i32 0, !1243, !DIExpression(), !1241)
  br label %for.cond, !dbg !1244

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1246
    #dbg_value(i32 %i.0, !1243, !DIExpression(), !1241)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1247
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1249

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1250

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1253
    #dbg_value(i32 %j.0, !1254, !DIExpression(), !1241)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1255
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1250

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1257
  %add = or disjoint i32 %mul, %j.0, !dbg !1259
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1260
  store i16 0, ptr %arrayidx, align 2, !dbg !1261
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1262
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1262
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1263
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1264
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1264
  %conv = zext i8 %0 to i32, !dbg !1264
  %shr = lshr i32 %conv, %j.0, !dbg !1265
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1266
  %conv7 = and i16 %1, 1, !dbg !1266
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1267
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1268
    #dbg_value(i32 %inc, !1254, !DIExpression(), !1241)
  br label %for.cond1, !dbg !1269, !llvm.loop !1270

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1272
    #dbg_value(i32 %inc9, !1243, !DIExpression(), !1241)
  br label %for.cond, !dbg !1273, !llvm.loop !1274

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1276
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1277 {
entry:
    #dbg_value(ptr %msg, !1278, !DIExpression(), !1279)
    #dbg_value(ptr %a, !1280, !DIExpression(), !1279)
    #dbg_value(i32 0, !1281, !DIExpression(), !1279)
  br label %for.cond, !dbg !1282

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1284
    #dbg_value(i32 %i.0, !1281, !DIExpression(), !1279)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1285
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1287

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1288
  store i8 0, ptr %arrayidx, align 1, !dbg !1290
    #dbg_value(i32 0, !1291, !DIExpression(), !1279)
  br label %for.cond1, !dbg !1292

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1294
    #dbg_value(i32 %j.0, !1291, !DIExpression(), !1279)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1295
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1297

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1298
  %add = or disjoint i32 %mul, %j.0, !dbg !1300
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1301
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1301
  %conv = sext i16 %0 to i32, !dbg !1301
    #dbg_value(i32 %conv, !1302, !DIExpression(), !1279)
    #dbg_value(i32 %conv, !1302, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1279)
    #dbg_value(i32 %conv, !1302, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1279)
  %1 = mul i32 %conv, 161270, !dbg !1303
  %mul6 = add i32 %1, 134257275, !dbg !1303
    #dbg_value(i32 %mul6, !1302, !DIExpression(), !1279)
  %shr = lshr i32 %mul6, 28, !dbg !1304
    #dbg_value(i32 %shr, !1302, !DIExpression(), !1279)
  %and = and i32 %shr, 1, !dbg !1305
    #dbg_value(i32 %and, !1302, !DIExpression(), !1279)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1306
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1307
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1308
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1308
  %conv10 = or i8 %2, %3, !dbg !1308
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1308
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1309
    #dbg_value(i32 %inc, !1291, !DIExpression(), !1279)
  br label %for.cond1, !dbg !1310, !llvm.loop !1311

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1313
    #dbg_value(i32 %inc12, !1281, !DIExpression(), !1279)
  br label %for.cond, !dbg !1314, !llvm.loop !1315

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1317
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1318 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1321, !DIExpression(), !1322)
    #dbg_value(ptr %seed, !1323, !DIExpression(), !1322)
    #dbg_value(i8 %nonce, !1324, !DIExpression(), !1322)
    #dbg_declare(ptr %buf, !1325, !DIExpression(), !1327)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1328
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1329
  ret void, !dbg !1330
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1331 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1332, !DIExpression(), !1333)
    #dbg_value(ptr %seed, !1334, !DIExpression(), !1333)
    #dbg_value(i8 %nonce, !1335, !DIExpression(), !1333)
    #dbg_declare(ptr %buf, !1336, !DIExpression(), !1337)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1338
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1339
  ret void, !dbg !1340
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1341 {
entry:
    #dbg_value(ptr %r, !1344, !DIExpression(), !1345)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #3, !dbg !1346
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1347
  ret void, !dbg !1348
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1349 {
entry:
    #dbg_value(ptr %r, !1350, !DIExpression(), !1351)
    #dbg_value(i32 0, !1352, !DIExpression(), !1351)
  br label %for.cond, !dbg !1353

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1355
    #dbg_value(i32 %i.0, !1352, !DIExpression(), !1351)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1356
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1358

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1359
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1359
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1360
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1361
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1362
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1363
    #dbg_value(i32 %inc, !1352, !DIExpression(), !1351)
  br label %for.cond, !dbg !1364, !llvm.loop !1365

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1367
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1368 {
entry:
    #dbg_value(ptr %r, !1369, !DIExpression(), !1370)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #3, !dbg !1371
  ret void, !dbg !1372
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1373 {
entry:
    #dbg_value(ptr %r, !1376, !DIExpression(), !1377)
    #dbg_value(ptr %a, !1378, !DIExpression(), !1377)
    #dbg_value(ptr %b, !1379, !DIExpression(), !1377)
    #dbg_value(i32 0, !1380, !DIExpression(), !1377)
  br label %for.cond, !dbg !1381

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1383
    #dbg_value(i32 %i.0, !1380, !DIExpression(), !1377)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1384
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1386

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1387
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1389
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1390
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1391
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1392
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1393
  %add = or disjoint i32 %i.0, 64, !dbg !1394
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1395
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1395
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1396
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1397
  %add7 = or disjoint i32 %mul6, 2, !dbg !1398
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1399
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1400
  %add10 = or disjoint i32 %mul9, 2, !dbg !1401
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1402
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1403
  %add13 = or disjoint i32 %mul12, 2, !dbg !1404
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1405
  %add15 = or disjoint i32 %i.0, 64, !dbg !1406
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add15, !dbg !1407
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1407
  %sub = sub i16 0, %1, !dbg !1408
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1409
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1410
    #dbg_value(i32 %inc, !1380, !DIExpression(), !1377)
  br label %for.cond, !dbg !1411, !llvm.loop !1412

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1414
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1415 {
entry:
    #dbg_value(ptr %r, !1416, !DIExpression(), !1417)
    #dbg_value(i16 1353, !1418, !DIExpression(), !1417)
    #dbg_value(i32 0, !1419, !DIExpression(), !1417)
  br label %for.cond, !dbg !1420

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1422
    #dbg_value(i32 %i.0, !1419, !DIExpression(), !1417)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1423
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1425

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1426
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1426
  %conv = sext i16 %0 to i32, !dbg !1427
  %mul = mul nsw i32 %conv, 1353, !dbg !1428
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1429
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1430
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1431
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1432
    #dbg_value(i32 %inc, !1419, !DIExpression(), !1417)
  br label %for.cond, !dbg !1433, !llvm.loop !1434

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1436
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1437 {
entry:
    #dbg_value(ptr %r, !1438, !DIExpression(), !1439)
    #dbg_value(ptr %a, !1440, !DIExpression(), !1439)
    #dbg_value(ptr %b, !1441, !DIExpression(), !1439)
    #dbg_value(i32 0, !1442, !DIExpression(), !1439)
  br label %for.cond, !dbg !1443

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1445
    #dbg_value(i32 %i.0, !1442, !DIExpression(), !1439)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1446
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1448

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1449
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1449
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1450
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1450
  %add = add i16 %0, %1, !dbg !1451
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1452
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1453
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1454
    #dbg_value(i32 %inc, !1442, !DIExpression(), !1439)
  br label %for.cond, !dbg !1455, !llvm.loop !1456

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1458
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1459 {
entry:
    #dbg_value(ptr %r, !1460, !DIExpression(), !1461)
    #dbg_value(ptr %a, !1462, !DIExpression(), !1461)
    #dbg_value(ptr %b, !1463, !DIExpression(), !1461)
    #dbg_value(i32 0, !1464, !DIExpression(), !1461)
  br label %for.cond, !dbg !1465

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1467
    #dbg_value(i32 %i.0, !1464, !DIExpression(), !1461)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1468
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1470

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1471
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1471
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1472
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1472
  %sub = sub i16 %0, %1, !dbg !1473
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1474
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1475
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1476
    #dbg_value(i32 %inc, !1464, !DIExpression(), !1461)
  br label %for.cond, !dbg !1477, !llvm.loop !1478

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1480
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1481 {
entry:
    #dbg_value(ptr %r, !1484, !DIExpression(), !1485)
    #dbg_value(i32 1, !1486, !DIExpression(), !1485)
    #dbg_value(i32 128, !1487, !DIExpression(), !1485)
  br label %for.cond, !dbg !1488

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1490
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1491
    #dbg_value(i32 %k.0, !1486, !DIExpression(), !1485)
    #dbg_value(i32 %len.0, !1487, !DIExpression(), !1485)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1492
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1494

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1495

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1498
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1485
    #dbg_value(i32 %k.1, !1486, !DIExpression(), !1485)
    #dbg_value(i32 %start.0, !1499, !DIExpression(), !1485)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1500
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1495

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1486, !DIExpression(), !1485)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1502
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1502
    #dbg_value(i16 %0, !1504, !DIExpression(), !1485)
    #dbg_value(i32 %start.0, !1505, !DIExpression(), !1485)
  br label %for.cond4, !dbg !1506

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1508
    #dbg_value(i32 %j.0, !1505, !DIExpression(), !1485)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1509
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1511
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1512

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1513
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1513
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1513
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1515
    #dbg_value(i16 %call, !1516, !DIExpression(), !1485)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1517
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1517
  %sub = sub i16 %3, %call, !dbg !1518
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1519
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1519
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1520
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1521
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1521
  %add17 = add i16 %5, %call, !dbg !1522
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1523
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1524
  %inc20 = add nuw i32 %j.0, 1, !dbg !1525
    #dbg_value(i32 %inc20, !1505, !DIExpression(), !1485)
  br label %for.cond4, !dbg !1526, !llvm.loop !1527

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1508
  %inc = add i32 %k.1, 1, !dbg !1529
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1530
    #dbg_value(i32 %add22, !1499, !DIExpression(), !1485)
  br label %for.cond1, !dbg !1531, !llvm.loop !1532

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1485
  %shr = lshr i32 %len.0, 1, !dbg !1534
    #dbg_value(i32 %shr, !1487, !DIExpression(), !1485)
  br label %for.cond, !dbg !1535, !llvm.loop !1536

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1538
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1539 {
entry:
    #dbg_value(i16 %a, !1542, !DIExpression(), !1543)
    #dbg_value(i16 %b, !1544, !DIExpression(), !1543)
  %conv = sext i16 %a to i32, !dbg !1545
  %conv1 = sext i16 %b to i32, !dbg !1546
  %mul = mul nsw i32 %conv, %conv1, !dbg !1547
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1548
  ret i16 %call, !dbg !1549
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1550 {
entry:
    #dbg_value(ptr %r, !1551, !DIExpression(), !1552)
    #dbg_value(i16 1441, !1553, !DIExpression(), !1552)
    #dbg_value(i32 127, !1554, !DIExpression(), !1552)
    #dbg_value(i32 2, !1555, !DIExpression(), !1552)
  br label %for.cond, !dbg !1556

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1558
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1559
    #dbg_value(i32 %k.0, !1554, !DIExpression(), !1552)
    #dbg_value(i32 %len.0, !1555, !DIExpression(), !1552)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1560
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1562

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1563

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1566

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1568
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1552
    #dbg_value(i32 %k.1, !1554, !DIExpression(), !1552)
    #dbg_value(i32 %start.0, !1569, !DIExpression(), !1552)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1570
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1563

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1554, !DIExpression(), !1552)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1572
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1572
    #dbg_value(i16 %0, !1574, !DIExpression(), !1552)
    #dbg_value(i32 %start.0, !1575, !DIExpression(), !1552)
  br label %for.cond4, !dbg !1576

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1578
    #dbg_value(i32 %j.0, !1575, !DIExpression(), !1552)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1579
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1581
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1582

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1583
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1583
    #dbg_value(i16 %1, !1585, !DIExpression(), !1552)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1586
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1586
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1586
  %add11 = add i16 %1, %3, !dbg !1587
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1588
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1589
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1590
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1591
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1591
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1591
  %sub = sub i16 %5, %1, !dbg !1592
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1593
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1593
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1594
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1595
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1595
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1595
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1596
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1597
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1597
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1598
  %inc = add nuw i32 %j.0, 1, !dbg !1599
    #dbg_value(i32 %inc, !1575, !DIExpression(), !1552)
  br label %for.cond4, !dbg !1600, !llvm.loop !1601

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1578
  %dec = add i32 %k.1, -1, !dbg !1603
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1604
    #dbg_value(i32 %add27, !1569, !DIExpression(), !1552)
  br label %for.cond1, !dbg !1605, !llvm.loop !1606

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1552
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1608
    #dbg_value(i32 %shl, !1555, !DIExpression(), !1552)
  br label %for.cond, !dbg !1609, !llvm.loop !1610

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1612
    #dbg_value(i32 %j.1, !1575, !DIExpression(), !1552)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1613
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1566

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1615
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1615
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1616
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1617
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1618
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1619
    #dbg_value(i32 %inc39, !1575, !DIExpression(), !1552)
  br label %for.cond31, !dbg !1620, !llvm.loop !1621

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1623
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1624 {
entry:
    #dbg_value(ptr %r, !1628, !DIExpression(), !1629)
    #dbg_value(ptr %a, !1630, !DIExpression(), !1629)
    #dbg_value(ptr %b, !1631, !DIExpression(), !1629)
    #dbg_value(i16 %zeta, !1632, !DIExpression(), !1629)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1633
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1633
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1634
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1634
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1635
  store i16 %call, ptr %r, align 2, !dbg !1636
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1637
  store i16 %call4, ptr %r, align 2, !dbg !1638
  %2 = load i16, ptr %a, align 2, !dbg !1639
  %3 = load i16, ptr %b, align 2, !dbg !1640
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1641
  %4 = load i16, ptr %r, align 2, !dbg !1642
  %add = add i16 %4, %call8, !dbg !1642
  store i16 %add, ptr %r, align 2, !dbg !1642
  %5 = load i16, ptr %a, align 2, !dbg !1643
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1644
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1644
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1645
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1646
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1647
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1648
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1648
  %8 = load i16, ptr %b, align 2, !dbg !1649
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1650
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1651
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1652
  %add22 = add i16 %9, %call18, !dbg !1652
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1652
  ret void, !dbg !1653
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1654 {
entry:
    #dbg_value(ptr %r, !1656, !DIExpression(), !1657)
    #dbg_value(ptr %buf, !1658, !DIExpression(), !1657)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1659
  ret void, !dbg !1660
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1661 {
entry:
    #dbg_value(ptr %r, !1662, !DIExpression(), !1663)
    #dbg_value(ptr %buf, !1664, !DIExpression(), !1663)
    #dbg_value(i32 0, !1665, !DIExpression(), !1663)
  br label %for.cond, !dbg !1666

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1668
    #dbg_value(i32 %i.0, !1665, !DIExpression(), !1663)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1669
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1671

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1672
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1674
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1675
    #dbg_value(i32 %call, !1676, !DIExpression(), !1663)
  %and = and i32 %call, 1431655765, !dbg !1677
    #dbg_value(i32 %and, !1678, !DIExpression(), !1663)
  %shr = lshr i32 %call, 1, !dbg !1679
  %and1 = and i32 %shr, 1431655765, !dbg !1680
  %add = add nuw i32 %and, %and1, !dbg !1681
    #dbg_value(i32 %add, !1678, !DIExpression(), !1663)
    #dbg_value(i32 0, !1682, !DIExpression(), !1663)
  br label %for.cond2, !dbg !1683

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1685
    #dbg_value(i32 %j.0, !1682, !DIExpression(), !1663)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1686
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1688

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1689
  %shr7 = lshr i32 %add, %mul5, !dbg !1691
  %conv = and i32 %shr7, 3, !dbg !1692
    #dbg_value(i32 %shr7, !1693, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1663)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1694
  %add10 = or disjoint i32 %mul9, 2, !dbg !1695
  %shr11 = lshr i32 %add, %add10, !dbg !1696
  %conv13 = and i32 %shr11, 3, !dbg !1697
    #dbg_value(i32 %conv13, !1698, !DIExpression(), !1663)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1699
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1700
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1701
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1702
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1703
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1704
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1705
    #dbg_value(i32 %inc, !1682, !DIExpression(), !1663)
  br label %for.cond2, !dbg !1706, !llvm.loop !1707

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1709
    #dbg_value(i32 %inc20, !1665, !DIExpression(), !1663)
  br label %for.cond, !dbg !1710, !llvm.loop !1711

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1713
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1714 {
entry:
    #dbg_value(ptr %x, !1717, !DIExpression(), !1718)
  %0 = load i8, ptr %x, align 1, !dbg !1719
  %conv = zext i8 %0 to i32, !dbg !1720
    #dbg_value(i32 %conv, !1721, !DIExpression(), !1718)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1722
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1722
  %conv2 = zext i8 %1 to i32, !dbg !1723
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1724
  %or = or disjoint i32 %shl, %conv, !dbg !1725
    #dbg_value(i32 %or, !1721, !DIExpression(), !1718)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1726
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1726
  %conv4 = zext i8 %2 to i32, !dbg !1727
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1728
  %or6 = or disjoint i32 %or, %shl5, !dbg !1729
    #dbg_value(i32 %or6, !1721, !DIExpression(), !1718)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1730
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1730
  %conv8 = zext i8 %3 to i32, !dbg !1731
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1732
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1733
    #dbg_value(i32 %or10, !1721, !DIExpression(), !1718)
  ret i32 %or10, !dbg !1734
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1735 {
entry:
    #dbg_value(ptr %r, !1736, !DIExpression(), !1737)
    #dbg_value(ptr %buf, !1738, !DIExpression(), !1737)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1739
  ret void, !dbg !1740
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1741 {
entry:
    #dbg_value(i32 %a, !1744, !DIExpression(), !1745)
    #dbg_value(i32 %a, !1746, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1745)
  %sext = mul i32 %a, -218038272, !dbg !1747
  %conv3 = ashr exact i32 %sext, 16, !dbg !1747
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1748
  %sub = add i32 %mul4.neg, %a, !dbg !1749
  %shr = lshr i32 %sub, 16, !dbg !1750
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1751
    #dbg_value(i16 %conv5, !1746, !DIExpression(), !1745)
  ret i16 %conv5, !dbg !1752
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1753 {
entry:
    #dbg_value(i16 %a, !1756, !DIExpression(), !1757)
    #dbg_value(i16 20159, !1758, !DIExpression(), !1757)
  %conv = sext i16 %a to i32, !dbg !1759
  %mul = mul nsw i32 %conv, 20159, !dbg !1760
  %add = add nsw i32 %mul, 33554432, !dbg !1761
  %shr = ashr i32 %add, 26, !dbg !1762
    #dbg_value(i32 %shr, !1763, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1757)
    #dbg_value(i32 %shr, !1763, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1757)
  %0 = trunc nsw i32 %shr to i16, !dbg !1764
  %1 = mul i16 %0, -3329, !dbg !1764
  %conv7 = add i16 %1, %a, !dbg !1764
  ret i16 %conv7, !dbg !1765
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1766 {
entry:
    #dbg_value(ptr %a, !1770, !DIExpression(), !1771)
    #dbg_value(ptr %b, !1772, !DIExpression(), !1771)
    #dbg_value(i32 %len, !1773, !DIExpression(), !1771)
    #dbg_value(i8 0, !1774, !DIExpression(), !1771)
    #dbg_value(i32 0, !1775, !DIExpression(), !1771)
  br label %for.cond, !dbg !1776

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1778
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1771
    #dbg_value(i8 %r.0, !1774, !DIExpression(), !1771)
    #dbg_value(i32 %i.0, !1775, !DIExpression(), !1771)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1779
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1781

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1774, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1771)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1782
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1782
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1783
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1783
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1774, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1771)
  %xor1 = xor i8 %0, %1, !dbg !1784
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1774, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1771)
  %or2 = or i8 %r.0, %xor1, !dbg !1785
    #dbg_value(i8 %or2, !1774, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1771)
    #dbg_value(i8 %or2, !1774, !DIExpression(), !1771)
  %inc = add i32 %i.0, 1, !dbg !1786
    #dbg_value(i32 %inc, !1775, !DIExpression(), !1771)
  br label %for.cond, !dbg !1787, !llvm.loop !1788

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1771
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1790
  %conv6 = zext i1 %2 to i32, !dbg !1791
  ret i32 %conv6, !dbg !1792
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1793 {
entry:
    #dbg_value(ptr %r, !1796, !DIExpression(), !1797)
    #dbg_value(ptr %x, !1798, !DIExpression(), !1797)
    #dbg_value(i32 %len, !1799, !DIExpression(), !1797)
    #dbg_value(i8 %b, !1800, !DIExpression(), !1797)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1801, !srcloc !1802
    #dbg_value(i8 %0, !1800, !DIExpression(), !1797)
  %sub = sub i8 0, %0, !dbg !1803
    #dbg_value(i8 %sub, !1800, !DIExpression(), !1797)
    #dbg_value(i32 0, !1804, !DIExpression(), !1797)
  br label %for.cond, !dbg !1805

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1807
    #dbg_value(i32 %i.0, !1804, !DIExpression(), !1797)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1808
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1810

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1811
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1811
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1812
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1812
  %xor1 = xor i8 %1, %2, !dbg !1813
  %and2 = and i8 %xor1, %sub, !dbg !1814
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1815
  %xor93 = xor i8 %1, %and2, !dbg !1816
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1816
  %inc = add i32 %i.0, 1, !dbg !1817
    #dbg_value(i32 %inc, !1804, !DIExpression(), !1797)
  br label %for.cond, !dbg !1818, !llvm.loop !1819

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1821
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1822 {
entry:
    #dbg_value(ptr %r, !1825, !DIExpression(), !1826)
    #dbg_value(i16 %v, !1827, !DIExpression(), !1826)
    #dbg_value(i16 %b, !1828, !DIExpression(), !1826)
  %sub = sub i16 0, %b, !dbg !1829
    #dbg_value(i16 %sub, !1828, !DIExpression(), !1826)
  %0 = load i16, ptr %r, align 2, !dbg !1830
  %xor1 = xor i16 %0, %v, !dbg !1831
  %and = and i16 %xor1, %sub, !dbg !1832
  %xor6 = xor i16 %and, %0, !dbg !1833
  store i16 %xor6, ptr %r, align 2, !dbg !1833
  ret void, !dbg !1834
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1835 {
entry:
    #dbg_value(ptr %state, !1839, !DIExpression(), !1840)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1841
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1842
  store i64 0, ptr %arrayidx, align 8, !dbg !1843
  ret void, !dbg !1844
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1845 {
entry:
    #dbg_value(ptr %s, !1849, !DIExpression(), !1850)
    #dbg_value(i32 0, !1851, !DIExpression(), !1850)
  br label %for.cond, !dbg !1852

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1854
    #dbg_value(i32 %i.0, !1851, !DIExpression(), !1850)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1855
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1857

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1858
  store i64 0, ptr %arrayidx, align 8, !dbg !1859
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1860
    #dbg_value(i32 %inc, !1851, !DIExpression(), !1850)
  br label %for.cond, !dbg !1861, !llvm.loop !1862

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1864
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1865 {
entry:
    #dbg_value(ptr %state, !1868, !DIExpression(), !1869)
    #dbg_value(ptr %in, !1870, !DIExpression(), !1869)
    #dbg_value(i32 %inlen, !1871, !DIExpression(), !1869)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1872
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1872
  %conv = trunc i64 %0 to i32, !dbg !1872
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1873
  %conv1 = zext i32 %call to i64, !dbg !1873
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1874
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1875
  ret void, !dbg !1876
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1877 {
entry:
    #dbg_value(ptr %s, !1880, !DIExpression(), !1881)
    #dbg_value(i32 %pos, !1882, !DIExpression(), !1881)
    #dbg_value(i32 %r, !1883, !DIExpression(), !1881)
    #dbg_value(ptr %in, !1884, !DIExpression(), !1881)
    #dbg_value(i32 %inlen, !1885, !DIExpression(), !1881)
  br label %while.cond, !dbg !1886

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1882, !DIExpression(), !1881)
    #dbg_value(i32 %inlen.addr.0, !1885, !DIExpression(), !1881)
    #dbg_value(ptr %in.addr.0, !1884, !DIExpression(), !1881)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1887
  %cmp.not = icmp ult i32 %add, %r, !dbg !1888
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1886

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1889
  br label %for.cond, !dbg !1889

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1892

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1894
    #dbg_value(i32 %i.0, !1895, !DIExpression(), !1881)
    #dbg_value(ptr %in.addr.1, !1884, !DIExpression(), !1881)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1896
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1889

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1884, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1881)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1898
  %conv = zext i8 %0 to i64, !dbg !1899
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1900
  %mul = and i32 %rem, 56, !dbg !1900
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1901
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1901
  %div2 = lshr i32 %i.0, 3, !dbg !1902
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1903
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1904
  %xor = xor i64 %1, %shl, !dbg !1904
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1904
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1905
    #dbg_value(ptr %incdec.ptr, !1884, !DIExpression(), !1881)
  %inc = add i32 %i.0, 1, !dbg !1906
    #dbg_value(i32 %inc, !1895, !DIExpression(), !1881)
  br label %for.cond, !dbg !1907, !llvm.loop !1908

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1910
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1911
    #dbg_value(i32 %sub2, !1885, !DIExpression(), !1881)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1912
    #dbg_value(i32 0, !1882, !DIExpression(), !1881)
  br label %while.cond, !dbg !1886, !llvm.loop !1913

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1915
    #dbg_value(i32 %i.1, !1895, !DIExpression(), !1881)
    #dbg_value(ptr %in.addr.2, !1884, !DIExpression(), !1881)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1916
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1918
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1892

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1884, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1881)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1919
  %conv9 = zext i8 %2 to i64, !dbg !1920
  %rem10 = shl i32 %i.1, 3, !dbg !1921
  %mul11 = and i32 %rem10, 56, !dbg !1921
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1922
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1922
  %div141 = lshr i32 %i.1, 3, !dbg !1923
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1924
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1925
  %xor16 = xor i64 %3, %shl13, !dbg !1925
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1925
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1926
    #dbg_value(ptr %incdec.ptr8, !1884, !DIExpression(), !1881)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1927
    #dbg_value(i32 %inc18, !1895, !DIExpression(), !1881)
  br label %for.cond3, !dbg !1928, !llvm.loop !1929

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1915
  ret i32 %i.1.lcssa, !dbg !1931
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1932 {
entry:
    #dbg_value(ptr %state, !1933, !DIExpression(), !1934)
  %0 = load i64, ptr %state, align 8, !dbg !1935
    #dbg_value(i64 %0, !1936, !DIExpression(), !1934)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1937
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1937
    #dbg_value(i64 %1, !1938, !DIExpression(), !1934)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1939
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1939
    #dbg_value(i64 %2, !1940, !DIExpression(), !1934)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1941
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1941
    #dbg_value(i64 %3, !1942, !DIExpression(), !1934)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1943
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1943
    #dbg_value(i64 %4, !1944, !DIExpression(), !1934)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1945
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1945
    #dbg_value(i64 %5, !1946, !DIExpression(), !1934)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1947
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1947
    #dbg_value(i64 %6, !1948, !DIExpression(), !1934)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1949
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1949
    #dbg_value(i64 %7, !1950, !DIExpression(), !1934)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1951
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1951
    #dbg_value(i64 %8, !1952, !DIExpression(), !1934)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1953
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1953
    #dbg_value(i64 %9, !1954, !DIExpression(), !1934)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1955
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1955
    #dbg_value(i64 %10, !1956, !DIExpression(), !1934)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1957
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1957
    #dbg_value(i64 %11, !1958, !DIExpression(), !1934)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1959
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1959
    #dbg_value(i64 %12, !1960, !DIExpression(), !1934)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1961
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1961
    #dbg_value(i64 %13, !1962, !DIExpression(), !1934)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1963
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1963
    #dbg_value(i64 %14, !1964, !DIExpression(), !1934)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1965
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1965
    #dbg_value(i64 %15, !1966, !DIExpression(), !1934)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1967
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1967
    #dbg_value(i64 %16, !1968, !DIExpression(), !1934)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1969
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1969
    #dbg_value(i64 %17, !1970, !DIExpression(), !1934)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1971
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1971
    #dbg_value(i64 %18, !1972, !DIExpression(), !1934)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1973
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1973
    #dbg_value(i64 %19, !1974, !DIExpression(), !1934)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1975
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1975
    #dbg_value(i64 %20, !1976, !DIExpression(), !1934)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1977
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1977
    #dbg_value(i64 %21, !1978, !DIExpression(), !1934)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1979
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1979
    #dbg_value(i64 %22, !1980, !DIExpression(), !1934)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1981
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1981
    #dbg_value(i64 %23, !1982, !DIExpression(), !1934)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1983
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1983
    #dbg_value(i64 %24, !1984, !DIExpression(), !1934)
    #dbg_value(i32 0, !1985, !DIExpression(), !1934)
  br label %for.cond, !dbg !1986

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1934
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1934
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1934
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1934
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1934
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1934
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1934
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1934
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1934
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1934
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1934
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1934
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1934
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1934
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1934
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1934
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1934
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1934
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1934
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1934
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1934
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1934
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1934
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1934
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1988
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1934
    #dbg_value(i64 %Asu.0, !1984, !DIExpression(), !1934)
    #dbg_value(i32 %round.0, !1985, !DIExpression(), !1934)
    #dbg_value(i64 %Aba.0, !1936, !DIExpression(), !1934)
    #dbg_value(i64 %Abe.0, !1938, !DIExpression(), !1934)
    #dbg_value(i64 %Abi.0, !1940, !DIExpression(), !1934)
    #dbg_value(i64 %Abo.0, !1942, !DIExpression(), !1934)
    #dbg_value(i64 %Abu.0, !1944, !DIExpression(), !1934)
    #dbg_value(i64 %Aga.0, !1946, !DIExpression(), !1934)
    #dbg_value(i64 %Age.0, !1948, !DIExpression(), !1934)
    #dbg_value(i64 %Agi.0, !1950, !DIExpression(), !1934)
    #dbg_value(i64 %Ago.0, !1952, !DIExpression(), !1934)
    #dbg_value(i64 %Agu.0, !1954, !DIExpression(), !1934)
    #dbg_value(i64 %Aka.0, !1956, !DIExpression(), !1934)
    #dbg_value(i64 %Ake.0, !1958, !DIExpression(), !1934)
    #dbg_value(i64 %Aki.0, !1960, !DIExpression(), !1934)
    #dbg_value(i64 %Ako.0, !1962, !DIExpression(), !1934)
    #dbg_value(i64 %Aku.0, !1964, !DIExpression(), !1934)
    #dbg_value(i64 %Ama.0, !1966, !DIExpression(), !1934)
    #dbg_value(i64 %Ame.0, !1968, !DIExpression(), !1934)
    #dbg_value(i64 %Ami.0, !1970, !DIExpression(), !1934)
    #dbg_value(i64 %Amo.0, !1972, !DIExpression(), !1934)
    #dbg_value(i64 %Amu.0, !1974, !DIExpression(), !1934)
    #dbg_value(i64 %Asa.0, !1976, !DIExpression(), !1934)
    #dbg_value(i64 %Ase.0, !1978, !DIExpression(), !1934)
    #dbg_value(i64 %Asi.0, !1980, !DIExpression(), !1934)
    #dbg_value(i64 %Aso.0, !1982, !DIExpression(), !1934)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1989
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1991

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1997, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1999, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2001, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1997, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1999, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2001, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 poison, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2027
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2029
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2030
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2031
    #dbg_value(i64 %xor35, !1994, !DIExpression(), !1934)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2032
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2033
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2034
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2035
    #dbg_value(i64 %xor43, !1996, !DIExpression(), !1934)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2036
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2037
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 %xor57, !2000, !DIExpression(), !1934)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2038
    #dbg_value(i64 %xor203, !1952, !DIExpression(), !1934)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2039
    #dbg_value(i64 %xor206, !1993, !DIExpression(), !1934)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2040
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2041
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2042
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2043
    #dbg_value(i64 %xor31, !1993, !DIExpression(), !1934)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2044
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !1997, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2045
    #dbg_value(i64 %xor45, !1997, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2046
    #dbg_value(i64 %xor211, !1966, !DIExpression(), !1934)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2047
    #dbg_value(i64 %xor214, !1995, !DIExpression(), !1934)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2048
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2049
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2050
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2051
    #dbg_value(i64 %xor39, !1995, !DIExpression(), !1934)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2052
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2053
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2054
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2055
    #dbg_value(i64 %xor27, !1992, !DIExpression(), !1934)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2056
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2001, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2057
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 %xor61, !2001, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2058
    #dbg_value(i64 %xor207, !1964, !DIExpression(), !1934)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2059
    #dbg_value(i64 %xor210, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not222 = xor i64 %xor210, -1, !dbg !2060
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and223 = and i64 %xor214, %not222, !dbg !2061
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor224 = xor i64 %xor206, %and223, !dbg !2062
    #dbg_value(i64 %xor224, !2023, !DIExpression(), !1934)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2063
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !1999, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2064
    #dbg_value(i64 %xor53, !1999, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2065
    #dbg_value(i64 %xor67, !1960, !DIExpression(), !1934)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2066
    #dbg_value(i64 %xor70, !1994, !DIExpression(), !1934)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2067
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2068
    #dbg_value(i64 %xor49, !1998, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2069
    #dbg_value(i64 %xor63, !1948, !DIExpression(), !1934)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2070
    #dbg_value(i64 %xor66, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not = xor i64 %xor66, -1, !dbg !2071
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and = and i64 %xor70, %not, !dbg !2072
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2073
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2073
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %26 = xor i64 %and, %25, !dbg !2074
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2075
    #dbg_value(i64 %xor62, !1936, !DIExpression(), !1934)
    #dbg_value(i64 %xor62, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor81 = xor i64 %26, %xor62, !dbg !2074
    #dbg_value(i64 %xor81, !2002, !DIExpression(), !1934)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2076
    #dbg_value(i64 %xor94, !1942, !DIExpression(), !1934)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2077
    #dbg_value(i64 %xor97, !1992, !DIExpression(), !1934)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2078
    #dbg_value(i64 %xor102, !1956, !DIExpression(), !1934)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2079
    #dbg_value(i64 %xor105, !1994, !DIExpression(), !1934)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2080
    #dbg_value(i64 %xor98, !1954, !DIExpression(), !1934)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2081
    #dbg_value(i64 %xor101, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not114 = xor i64 %xor101, -1, !dbg !2082
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and115 = and i64 %xor105, %not114, !dbg !2083
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor116 = xor i64 %xor97, %and115, !dbg !2084
    #dbg_value(i64 %xor116, !2007, !DIExpression(), !1934)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2085
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2086
    #dbg_value(i64 %xor129, !1938, !DIExpression(), !1934)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2087
    #dbg_value(i64 %xor132, !1992, !DIExpression(), !1934)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2088
    #dbg_value(i64 %xor137, !1962, !DIExpression(), !1934)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2089
    #dbg_value(i64 %xor140, !1994, !DIExpression(), !1934)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2090
    #dbg_value(i64 %xor133, !1950, !DIExpression(), !1934)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2091
    #dbg_value(i64 %xor136, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not149 = xor i64 %xor136, -1, !dbg !2092
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and150 = and i64 %xor140, %not149, !dbg !2093
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor151 = xor i64 %xor132, %and150, !dbg !2094
    #dbg_value(i64 %xor151, !2012, !DIExpression(), !1934)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2095
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2096
    #dbg_value(i64 %xor164, !1944, !DIExpression(), !1934)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2097
    #dbg_value(i64 %xor167, !1992, !DIExpression(), !1934)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2098
    #dbg_value(i64 %xor172, !1958, !DIExpression(), !1934)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2099
    #dbg_value(i64 %xor175, !1994, !DIExpression(), !1934)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2100
    #dbg_value(i64 %xor168, !1946, !DIExpression(), !1934)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2101
    #dbg_value(i64 %xor171, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not184 = xor i64 %xor171, -1, !dbg !2102
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and185 = and i64 %xor175, %not184, !dbg !2103
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor186 = xor i64 %xor167, %and185, !dbg !2104
    #dbg_value(i64 %xor186, !2017, !DIExpression(), !1934)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2105
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2106
    #dbg_value(i64 %xor199, !1940, !DIExpression(), !1934)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2107
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not219 = xor i64 %xor206, -1, !dbg !2108
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and220 = and i64 %xor210, %not219, !dbg !2109
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor221 = xor i64 %xor202, %and220, !dbg !2110
    #dbg_value(i64 %xor221, !2022, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2111
    #dbg_value(i64 %xor237, !1992, !DIExpression(), !1934)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2112
    #dbg_value(i64 %xor75, !1984, !DIExpression(), !1934)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2113
    #dbg_value(i64 %xor78, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2114
    #dbg_value(i64 %xor71, !1972, !DIExpression(), !1934)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2115
    #dbg_value(i64 %xor74, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not85 = xor i64 %xor74, -1, !dbg !2116
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and86 = and i64 %xor78, %not85, !dbg !2117
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor87 = xor i64 %xor70, %and86, !dbg !2118
    #dbg_value(i64 %xor87, !2004, !DIExpression(), !1934)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2119
    #dbg_value(i64 %xor110, !1980, !DIExpression(), !1934)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2120
    #dbg_value(i64 %xor113, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2121
    #dbg_value(i64 %xor106, !1968, !DIExpression(), !1934)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2122
    #dbg_value(i64 %xor109, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not120 = xor i64 %xor109, -1, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and121 = and i64 %xor113, %not120, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor122 = xor i64 %xor105, %and121, !dbg !2125
    #dbg_value(i64 %xor122, !2009, !DIExpression(), !1934)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2126
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2127
    #dbg_value(i64 %xor145, !1976, !DIExpression(), !1934)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2128
    #dbg_value(i64 %xor148, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2129
    #dbg_value(i64 %xor141, !1974, !DIExpression(), !1934)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2130
    #dbg_value(i64 %xor144, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not155 = xor i64 %xor144, -1, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and156 = and i64 %xor148, %not155, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor157 = xor i64 %xor140, %and156, !dbg !2133
    #dbg_value(i64 %xor157, !2014, !DIExpression(), !1934)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2134
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2135
    #dbg_value(i64 %xor180, !1982, !DIExpression(), !1934)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2136
    #dbg_value(i64 %xor183, !1996, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2137
    #dbg_value(i64 %xor176, !1970, !DIExpression(), !1934)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2138
    #dbg_value(i64 %xor179, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %not190 = xor i64 %xor179, -1, !dbg !2139
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and191 = and i64 %xor183, %not190, !dbg !2140
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor192 = xor i64 %xor175, %and191, !dbg !2141
    #dbg_value(i64 %xor192, !2019, !DIExpression(), !1934)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2142
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2143
    #dbg_value(i64 %xor215, !1978, !DIExpression(), !1934)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2144
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not225 = xor i64 %xor214, -1, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and226 = and i64 %xor218, %not225, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor227 = xor i64 %xor210, %and226, !dbg !2147
    #dbg_value(i64 %xor227, !2024, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2148
    #dbg_value(i64 %xor245, !1994, !DIExpression(), !1934)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2149
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 %xor261, !1998, !DIExpression(), !1934)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2151
    #dbg_value(i64 %xor429, !2023, !DIExpression(), !1934)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2152
    #dbg_value(i64 %xor432, !1996, !DIExpression(), !1934)
  %not123 = xor i64 %xor113, -1, !dbg !2153
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and124 = and i64 %xor97, %not123, !dbg !2154
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor125 = xor i64 %xor109, %and124, !dbg !2155
    #dbg_value(i64 %xor125, !2010, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not91 = xor i64 %xor62, -1, !dbg !2156
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and92 = and i64 %xor66, %not91, !dbg !2157
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor93 = xor i64 %xor78, %and92, !dbg !2158
    #dbg_value(i64 %xor93, !2006, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not126 = xor i64 %xor97, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and127 = and i64 %xor101, %not126, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor128 = xor i64 %xor113, %and127, !dbg !2161
    #dbg_value(i64 %xor128, !2011, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2162
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not161 = xor i64 %xor132, -1, !dbg !2163
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and162 = and i64 %xor136, %not161, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor163 = xor i64 %xor148, %and162, !dbg !2165
    #dbg_value(i64 %xor163, !2016, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not196 = xor i64 %xor167, -1, !dbg !2167
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and197 = and i64 %xor171, %not196, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor198 = xor i64 %xor183, %and197, !dbg !2169
    #dbg_value(i64 %xor198, !2021, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not231 = xor i64 %xor202, -1, !dbg !2171
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %and232 = and i64 %xor206, %not231, !dbg !2172
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor233 = xor i64 %xor218, %and232, !dbg !2173
    #dbg_value(i64 %xor233, !2026, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2174
    #dbg_value(i64 %xor253, !1996, !DIExpression(), !1934)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2175
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 %xor269, !2000, !DIExpression(), !1934)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2177
    #dbg_value(i64 %xor417, !2010, !DIExpression(), !1934)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2178
    #dbg_value(i64 %xor420, !1993, !DIExpression(), !1934)
  %not82 = xor i64 %xor70, -1, !dbg !2179
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and83 = and i64 %xor74, %not82, !dbg !2180
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor84 = xor i64 %xor66, %and83, !dbg !2181
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2003, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %not117 = xor i64 %xor105, -1, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and118 = and i64 %xor109, %not117, !dbg !2183
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor119 = xor i64 %xor101, %and118, !dbg !2184
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2185
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %not152 = xor i64 %xor140, -1, !dbg !2186
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and153 = and i64 %xor144, %not152, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor154 = xor i64 %xor136, %and153, !dbg !2188
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2013, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %not187 = xor i64 %xor175, -1, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and188 = and i64 %xor179, %not187, !dbg !2191
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor189 = xor i64 %xor171, %and188, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2193
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1993, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2194
    #dbg_value(i64 %xor241, !1993, !DIExpression(), !1934)
  %not88 = xor i64 %xor78, -1, !dbg !2195
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and89 = and i64 %xor62, %not88, !dbg !2196
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor90 = xor i64 %xor74, %and89, !dbg !2197
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2005, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not158 = xor i64 %xor148, -1, !dbg !2199
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and159 = and i64 %xor132, %not158, !dbg !2200
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor160 = xor i64 %xor144, %and159, !dbg !2201
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2015, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2202
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not193 = xor i64 %xor183, -1, !dbg !2203
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and194 = and i64 %xor167, %not193, !dbg !2204
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor195 = xor i64 %xor179, %and194, !dbg !2205
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2206
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %not228 = xor i64 %xor218, -1, !dbg !2207
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and229 = and i64 %xor202, %not228, !dbg !2208
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor230 = xor i64 %xor214, %and229, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1995, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2210
    #dbg_value(i64 %xor249, !1995, !DIExpression(), !1934)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2211
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !1999, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2212
    #dbg_value(i64 %xor265, !1999, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2009, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2213
    #dbg_value(i64 %xor413, !2004, !DIExpression(), !1934)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2214
    #dbg_value(i64 %xor416, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not445 = xor i64 %xor416, -1, !dbg !2215
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and446 = and i64 %xor420, %not445, !dbg !2216
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor447 = xor i64 %xor432, %and446, !dbg !2217
    #dbg_value(i64 %xor447, !1984, !DIExpression(), !1934)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2218
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !1997, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2219
    #dbg_value(i64 %xor257, !1997, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2007, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2220
    #dbg_value(i64 %xor425, !2017, !DIExpression(), !1934)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2221
    #dbg_value(i64 %xor428, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not442 = xor i64 %xor432, -1, !dbg !2222
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and443 = and i64 %xor416, %not442, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor444 = xor i64 %xor428, %and443, !dbg !2224
    #dbg_value(i64 %xor444, !1982, !DIExpression(), !1934)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2225
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2001, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2011, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(i64 %xor273, !2001, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2227
    #dbg_value(i64 %xor421, !2016, !DIExpression(), !1934)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2228
    #dbg_value(i64 %xor424, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not439 = xor i64 %xor428, -1, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and440 = and i64 %xor432, %not439, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor441 = xor i64 %xor424, %and440, !dbg !2231
    #dbg_value(i64 %xor441, !1980, !DIExpression(), !1934)
  %not436 = xor i64 %xor424, -1, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and437 = and i64 %xor428, %not436, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor438 = xor i64 %xor420, %and437, !dbg !2234
    #dbg_value(i64 %xor438, !1978, !DIExpression(), !1934)
  %not433 = xor i64 %xor420, -1, !dbg !2235
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and434 = and i64 %xor424, %not433, !dbg !2236
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor435 = xor i64 %xor416, %and434, !dbg !2237
    #dbg_value(i64 %xor435, !1976, !DIExpression(), !1934)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2238
    #dbg_value(i64 %xor394, !2025, !DIExpression(), !1934)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2239
    #dbg_value(i64 %xor397, !1996, !DIExpression(), !1934)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2240
    #dbg_value(i64 %xor382, !2007, !DIExpression(), !1934)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2241
    #dbg_value(i64 %xor385, !1993, !DIExpression(), !1934)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2242
    #dbg_value(i64 %xor378, !2006, !DIExpression(), !1934)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2243
    #dbg_value(i64 %xor381, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not410 = xor i64 %xor381, -1, !dbg !2244
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and411 = and i64 %xor385, %not410, !dbg !2245
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor412 = xor i64 %xor397, %and411, !dbg !2246
    #dbg_value(i64 %xor412, !1974, !DIExpression(), !1934)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2247
    #dbg_value(i64 %xor390, !2019, !DIExpression(), !1934)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2248
    #dbg_value(i64 %xor393, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not407 = xor i64 %xor397, -1, !dbg !2249
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and408 = and i64 %xor381, %not407, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor409 = xor i64 %xor393, %and408, !dbg !2251
    #dbg_value(i64 %xor409, !1972, !DIExpression(), !1934)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2252
    #dbg_value(i64 %xor386, !2013, !DIExpression(), !1934)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2253
    #dbg_value(i64 %xor389, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not404 = xor i64 %xor393, -1, !dbg !2254
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and405 = and i64 %xor397, %not404, !dbg !2255
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor406 = xor i64 %xor389, %and405, !dbg !2256
    #dbg_value(i64 %xor406, !1970, !DIExpression(), !1934)
  %not401 = xor i64 %xor389, -1, !dbg !2257
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and402 = and i64 %xor393, %not401, !dbg !2258
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor403 = xor i64 %xor385, %and402, !dbg !2259
    #dbg_value(i64 %xor403, !1968, !DIExpression(), !1934)
  %not398 = xor i64 %xor385, -1, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and399 = and i64 %xor389, %not398, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor400 = xor i64 %xor381, %and399, !dbg !2262
    #dbg_value(i64 %xor400, !1966, !DIExpression(), !1934)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2263
    #dbg_value(i64 %xor359, !2022, !DIExpression(), !1934)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2264
    #dbg_value(i64 %xor362, !1996, !DIExpression(), !1934)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2265
    #dbg_value(i64 %xor347, !2009, !DIExpression(), !1934)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2266
    #dbg_value(i64 %xor350, !1993, !DIExpression(), !1934)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2267
    #dbg_value(i64 %xor343, !2003, !DIExpression(), !1934)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2268
    #dbg_value(i64 %xor346, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not375 = xor i64 %xor346, -1, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and376 = and i64 %xor350, %not375, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor377 = xor i64 %xor362, %and376, !dbg !2271
    #dbg_value(i64 %xor377, !1964, !DIExpression(), !1934)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2272
    #dbg_value(i64 %xor355, !2021, !DIExpression(), !1934)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2273
    #dbg_value(i64 %xor358, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not372 = xor i64 %xor362, -1, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and373 = and i64 %xor346, %not372, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor374 = xor i64 %xor358, %and373, !dbg !2276
    #dbg_value(i64 %xor374, !1962, !DIExpression(), !1934)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2277
    #dbg_value(i64 %xor351, !2015, !DIExpression(), !1934)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2278
    #dbg_value(i64 %xor354, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not369 = xor i64 %xor358, -1, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and370 = and i64 %xor362, %not369, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor371 = xor i64 %xor354, %and370, !dbg !2281
    #dbg_value(i64 %xor371, !1960, !DIExpression(), !1934)
  %not366 = xor i64 %xor354, -1, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and367 = and i64 %xor358, %not366, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor368 = xor i64 %xor350, %and367, !dbg !2284
    #dbg_value(i64 %xor368, !1958, !DIExpression(), !1934)
  %not363 = xor i64 %xor350, -1, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and364 = and i64 %xor354, %not363, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor365 = xor i64 %xor346, %and364, !dbg !2287
    #dbg_value(i64 %xor365, !1956, !DIExpression(), !1934)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2288
    #dbg_value(i64 %xor324, !2024, !DIExpression(), !1934)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2289
    #dbg_value(i64 %xor327, !1996, !DIExpression(), !1934)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2290
    #dbg_value(i64 %xor312, !2011, !DIExpression(), !1934)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2291
    #dbg_value(i64 %xor315, !1993, !DIExpression(), !1934)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2292
    #dbg_value(i64 %xor308, !2005, !DIExpression(), !1934)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2293
    #dbg_value(i64 %xor311, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not340 = xor i64 %xor311, -1, !dbg !2294
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and341 = and i64 %xor315, %not340, !dbg !2295
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor342 = xor i64 %xor327, %and341, !dbg !2296
    #dbg_value(i64 %xor342, !1954, !DIExpression(), !1934)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2297
    #dbg_value(i64 %xor320, !2018, !DIExpression(), !1934)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2298
    #dbg_value(i64 %xor323, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not337 = xor i64 %xor327, -1, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and338 = and i64 %xor311, %not337, !dbg !2300
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1952, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor339 = xor i64 %xor323, %and338, !dbg !2301
    #dbg_value(i64 %xor339, !1952, !DIExpression(), !1934)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2302
    #dbg_value(i64 %xor316, !2012, !DIExpression(), !1934)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2303
    #dbg_value(i64 %xor319, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not334 = xor i64 %xor323, -1, !dbg !2304
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and335 = and i64 %xor327, %not334, !dbg !2305
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1950, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor336 = xor i64 %xor319, %and335, !dbg !2306
    #dbg_value(i64 %xor336, !1950, !DIExpression(), !1934)
  %not331 = xor i64 %xor319, -1, !dbg !2307
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and332 = and i64 %xor323, %not331, !dbg !2308
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor333 = xor i64 %xor315, %and332, !dbg !2309
    #dbg_value(i64 %xor333, !1948, !DIExpression(), !1934)
  %not328 = xor i64 %xor315, -1, !dbg !2310
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and329 = and i64 %xor319, %not328, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor330 = xor i64 %xor311, %and329, !dbg !2312
    #dbg_value(i64 %xor330, !1946, !DIExpression(), !1934)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2313
    #dbg_value(i64 %xor287, !2026, !DIExpression(), !1934)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2314
    #dbg_value(i64 %xor290, !1996, !DIExpression(), !1934)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2315
    #dbg_value(i64 %xor275, !2008, !DIExpression(), !1934)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2316
    #dbg_value(i64 %xor278, !1993, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2317
    #dbg_value(i64 %xor274, !2002, !DIExpression(), !1934)
    #dbg_value(i64 %xor274, !1992, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not305 = xor i64 %xor274, -1, !dbg !2318
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and306 = and i64 %xor278, %not305, !dbg !2319
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor307 = xor i64 %xor290, %and306, !dbg !2320
    #dbg_value(i64 %xor307, !1944, !DIExpression(), !1934)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2321
    #dbg_value(i64 %xor283, !2020, !DIExpression(), !1934)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2322
    #dbg_value(i64 %xor286, !1995, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not302 = xor i64 %xor290, -1, !dbg !2323
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and303 = and i64 %xor274, %not302, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor304 = xor i64 %xor286, %and303, !dbg !2325
    #dbg_value(i64 %xor304, !1942, !DIExpression(), !1934)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2326
    #dbg_value(i64 %xor279, !2014, !DIExpression(), !1934)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2327
    #dbg_value(i64 %xor282, !1994, !DIExpression(), !1934)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %not299 = xor i64 %xor286, -1, !dbg !2328
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and300 = and i64 %xor290, %not299, !dbg !2329
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor301 = xor i64 %xor282, %and300, !dbg !2330
    #dbg_value(i64 %xor301, !1940, !DIExpression(), !1934)
  %not296 = xor i64 %xor282, -1, !dbg !2331
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1934)
  %and297 = and i64 %xor286, %not296, !dbg !2332
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %xor298 = xor i64 %xor278, %and297, !dbg !2333
    #dbg_value(i64 %xor298, !1938, !DIExpression(), !1934)
  %add = or disjoint i32 %round.0, 1, !dbg !2334
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2335
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2335
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %not291 = xor i64 %xor278, -1, !dbg !2336
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %and292 = and i64 %xor282, %not291, !dbg !2337
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1934)
  %28 = xor i64 %and292, %27, !dbg !2338
  %xor295 = xor i64 %28, %xor274, !dbg !2338
    #dbg_value(i64 %xor295, !1936, !DIExpression(), !1934)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2339
    #dbg_value(i32 %add448, !1985, !DIExpression(), !1934)
  br label %for.cond, !dbg !2340, !llvm.loop !2341

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1934
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1934
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1934
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1934
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1934
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1934
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1934
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1934
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1934
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1934
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1934
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1934
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1934
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1934
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1934
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1934
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1934
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1934
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1934
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1934
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1934
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1934
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1934
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1934
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1934
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2343
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2344
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2345
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2346
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2347
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2348
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2349
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2350
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2351
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2352
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2353
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2354
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2355
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2356
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2357
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2358
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2359
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2360
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2361
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2362
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2363
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2364
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2365
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2366
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2367
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2368
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2369
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2370
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2371
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2372
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2373
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2374
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2375
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2376
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2377
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2378
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2379
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2380
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2381
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2382
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2383
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2384
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2385
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2386
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2387
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2388
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2389
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2390
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2391
  ret void, !dbg !2392
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2393 {
entry:
    #dbg_value(ptr %state, !2394, !DIExpression(), !2395)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2396
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2396
  %conv = trunc i64 %0 to i32, !dbg !2396
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2397
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2398
  store i64 168, ptr %arrayidx1, align 8, !dbg !2399
  ret void, !dbg !2400
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2401 {
entry:
    #dbg_value(ptr %s, !2404, !DIExpression(), !2405)
    #dbg_value(i32 %pos, !2406, !DIExpression(), !2405)
    #dbg_value(i32 %r, !2407, !DIExpression(), !2405)
    #dbg_value(i8 31, !2408, !DIExpression(), !2405)
  %rem = shl i32 %pos, 3, !dbg !2409
  %mul = and i32 %rem, 56, !dbg !2409
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2410
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2410
  %div2 = lshr i32 %pos, 3, !dbg !2411
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2412
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2413
  %xor = xor i64 %0, %shl, !dbg !2413
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2413
  %div13 = lshr i32 %r, 3, !dbg !2414
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2415
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2415
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2416
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2416
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2416
  ret void, !dbg !2417
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2418 {
entry:
    #dbg_value(ptr %out, !2421, !DIExpression(), !2422)
    #dbg_value(i32 %outlen, !2423, !DIExpression(), !2422)
    #dbg_value(ptr %state, !2424, !DIExpression(), !2422)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2425
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2425
  %conv = trunc i64 %0 to i32, !dbg !2425
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2426
  %conv1 = zext i32 %call to i64, !dbg !2426
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2427
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2428
  ret void, !dbg !2429
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2430 {
entry:
    #dbg_value(ptr %out, !2433, !DIExpression(), !2434)
    #dbg_value(i32 %outlen, !2435, !DIExpression(), !2434)
    #dbg_value(ptr %s, !2436, !DIExpression(), !2434)
    #dbg_value(i32 %pos, !2437, !DIExpression(), !2434)
    #dbg_value(i32 %r, !2438, !DIExpression(), !2434)
  br label %while.cond, !dbg !2439

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2433, !DIExpression(), !2434)
    #dbg_value(i32 %outlen.addr.0, !2435, !DIExpression(), !2434)
    #dbg_value(i32 %pos.addr.0, !2437, !DIExpression(), !2434)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2439
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2439

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2440
  br i1 %cmp, label %if.then, label %if.end, !dbg !2440

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2443
    #dbg_value(i32 0, !2437, !DIExpression(), !2434)
  br label %if.end, !dbg !2445

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2437, !DIExpression(), !2434)
    #dbg_value(i32 %pos.addr.1, !2446, !DIExpression(), !2434)
  br label %for.cond, !dbg !2447

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2449
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2433, !DIExpression(), !2434)
    #dbg_value(i32 %i.0, !2446, !DIExpression(), !2434)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2450
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2452
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2452
  %0 = and i1 %cmp1, %cmp2, !dbg !2452
  br i1 %0, label %for.body, label %for.end, !dbg !2453

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2454
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2455
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2455
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2456
  %mul = and i32 %rem, 56, !dbg !2456
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2457
  %shr = lshr i64 %1, %sh_prom, !dbg !2457
  %conv = trunc i64 %shr to i8, !dbg !2455
    #dbg_value(ptr %out.addr.1, !2433, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2434)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2458
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2459
    #dbg_value(ptr %incdec.ptr, !2433, !DIExpression(), !2434)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2460
    #dbg_value(i32 %inc, !2446, !DIExpression(), !2434)
  br label %for.cond, !dbg !2461, !llvm.loop !2462

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2449
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2464
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2465
    #dbg_value(i32 %sub3, !2435, !DIExpression(), !2434)
    #dbg_value(i32 %i.0.lcssa, !2437, !DIExpression(), !2434)
  br label %while.cond, !dbg !2439, !llvm.loop !2466

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2468
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2469 {
entry:
    #dbg_value(ptr %state, !2470, !DIExpression(), !2471)
    #dbg_value(ptr %in, !2472, !DIExpression(), !2471)
    #dbg_value(i32 %inlen, !2473, !DIExpression(), !2471)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2474
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2475
  store i64 168, ptr %arrayidx, align 8, !dbg !2476
  ret void, !dbg !2477
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2478 {
entry:
    #dbg_value(ptr %s, !2481, !DIExpression(), !2482)
    #dbg_value(i32 %r, !2483, !DIExpression(), !2482)
    #dbg_value(ptr %in, !2484, !DIExpression(), !2482)
    #dbg_value(i32 %inlen, !2485, !DIExpression(), !2482)
    #dbg_value(i8 %p, !2486, !DIExpression(), !2482)
    #dbg_value(i32 0, !2487, !DIExpression(), !2482)
  br label %for.cond, !dbg !2488

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2490
    #dbg_value(i32 %i.0, !2487, !DIExpression(), !2482)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2491
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2493

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2494
  br label %while.cond, !dbg !2494

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2495
  store i64 0, ptr %arrayidx, align 8, !dbg !2496
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2497
    #dbg_value(i32 %inc, !2487, !DIExpression(), !2482)
  br label %for.cond, !dbg !2498, !llvm.loop !2499

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2485, !DIExpression(), !2482)
    #dbg_value(ptr %in.addr.0, !2484, !DIExpression(), !2482)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2501
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2494

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2502

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2505

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2507
    #dbg_value(i32 %i.1, !2487, !DIExpression(), !2482)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2508
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2502

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2510
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2511
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2512
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2513
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2514
  %xor = xor i64 %1, %call, !dbg !2514
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2514
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2515
    #dbg_value(i32 %inc7, !2487, !DIExpression(), !2482)
  br label %for.cond2, !dbg !2516, !llvm.loop !2517

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2519
    #dbg_value(ptr %add.ptr9, !2484, !DIExpression(), !2482)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2520
    #dbg_value(i32 %sub, !2485, !DIExpression(), !2482)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2521
  br label %while.cond, !dbg !2494, !llvm.loop !2522

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2524
    #dbg_value(i32 %i.2, !2487, !DIExpression(), !2482)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2525
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2505

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2527
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2527
  %conv = zext i8 %2 to i64, !dbg !2528
  %rem = shl i32 %i.2, 3, !dbg !2529
  %mul14 = and i32 %rem, 56, !dbg !2529
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2530
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2530
  %div153 = lshr i32 %i.2, 3, !dbg !2531
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2532
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2533
  %xor17 = xor i64 %3, %shl, !dbg !2533
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2533
  %inc19 = add i32 %i.2, 1, !dbg !2534
    #dbg_value(i32 %inc19, !2487, !DIExpression(), !2482)
  br label %for.cond10, !dbg !2535, !llvm.loop !2536

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2524
  %conv21 = zext nneg i8 %p to i64, !dbg !2538
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2539
  %mul23 = and i32 %rem22, 56, !dbg !2539
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2540
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2540
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2541
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2542
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2543
  %xor28 = xor i64 %4, %shl25, !dbg !2543
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2543
  %sub29 = add nsw i32 %r, -1, !dbg !2544
  %div302 = lshr i32 %sub29, 3, !dbg !2545
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2546
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2547
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2547
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2547
  ret void, !dbg !2548
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2549 {
entry:
    #dbg_value(ptr %x, !2552, !DIExpression(), !2553)
    #dbg_value(i64 0, !2554, !DIExpression(), !2553)
    #dbg_value(i32 0, !2555, !DIExpression(), !2553)
  br label %for.cond, !dbg !2556

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2558
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2553
    #dbg_value(i64 %r.0, !2554, !DIExpression(), !2553)
    #dbg_value(i32 %i.0, !2555, !DIExpression(), !2553)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2559
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2561

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2553)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2562
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2562
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2553)
  %conv = zext i8 %0 to i64, !dbg !2563
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2553)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2564
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2553)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2565
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2553)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2565
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2554, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2553)
  %or = or i64 %r.0, %shl, !dbg !2566
    #dbg_value(i64 %or, !2554, !DIExpression(), !2553)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2567
    #dbg_value(i32 %inc, !2555, !DIExpression(), !2553)
  br label %for.cond, !dbg !2568, !llvm.loop !2569

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2553
  ret i64 %r.0.lcssa, !dbg !2571
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2572 {
entry:
    #dbg_value(ptr %out, !2573, !DIExpression(), !2574)
    #dbg_value(i32 %nblocks, !2575, !DIExpression(), !2574)
    #dbg_value(ptr %state, !2576, !DIExpression(), !2574)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2577
  ret void, !dbg !2578
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2579 {
entry:
    #dbg_value(ptr %out, !2582, !DIExpression(), !2583)
    #dbg_value(i32 %nblocks, !2584, !DIExpression(), !2583)
    #dbg_value(ptr %s, !2585, !DIExpression(), !2583)
    #dbg_value(i32 %r, !2586, !DIExpression(), !2583)
  %0 = lshr i32 %r, 3, !dbg !2587
  br label %while.cond, !dbg !2587

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2582, !DIExpression(), !2583)
    #dbg_value(i32 %nblocks.addr.0, !2584, !DIExpression(), !2583)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2587
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2587

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2588
    #dbg_value(i32 0, !2590, !DIExpression(), !2583)
  br label %for.cond, !dbg !2591

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2593
    #dbg_value(i32 %i.0, !2590, !DIExpression(), !2583)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2594
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2596

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2597
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2598
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2599
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2599
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2600
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2601
    #dbg_value(i32 %inc, !2590, !DIExpression(), !2583)
  br label %for.cond, !dbg !2602, !llvm.loop !2603

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2605
    #dbg_value(ptr %add.ptr1, !2582, !DIExpression(), !2583)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2606
    #dbg_value(i32 %sub, !2584, !DIExpression(), !2583)
  br label %while.cond, !dbg !2587, !llvm.loop !2607

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2609
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2610 {
entry:
    #dbg_value(ptr %x, !2613, !DIExpression(), !2614)
    #dbg_value(i64 %u, !2615, !DIExpression(), !2614)
    #dbg_value(i32 0, !2616, !DIExpression(), !2614)
  br label %for.cond, !dbg !2617

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2619
    #dbg_value(i32 %i.0, !2616, !DIExpression(), !2614)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2620
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2622

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2623
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2624
  %shr = lshr i64 %u, %sh_prom, !dbg !2624
  %conv = trunc i64 %shr to i8, !dbg !2625
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2626
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2627
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2628
    #dbg_value(i32 %inc, !2616, !DIExpression(), !2614)
  br label %for.cond, !dbg !2629, !llvm.loop !2630

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2632
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2633 {
entry:
    #dbg_value(ptr %state, !2634, !DIExpression(), !2635)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2636
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2637
  store i64 0, ptr %arrayidx, align 8, !dbg !2638
  ret void, !dbg !2639
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2640 {
entry:
    #dbg_value(ptr %state, !2641, !DIExpression(), !2642)
    #dbg_value(ptr %in, !2643, !DIExpression(), !2642)
    #dbg_value(i32 %inlen, !2644, !DIExpression(), !2642)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2645
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2645
  %conv = trunc i64 %0 to i32, !dbg !2645
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2646
  %conv1 = zext i32 %call to i64, !dbg !2646
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2647
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2648
  ret void, !dbg !2649
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2650 {
entry:
    #dbg_value(ptr %state, !2651, !DIExpression(), !2652)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2653
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2653
  %conv = trunc i64 %0 to i32, !dbg !2653
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2654
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2655
  store i64 136, ptr %arrayidx1, align 8, !dbg !2656
  ret void, !dbg !2657
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2658 {
entry:
    #dbg_value(ptr %out, !2659, !DIExpression(), !2660)
    #dbg_value(i32 %outlen, !2661, !DIExpression(), !2660)
    #dbg_value(ptr %state, !2662, !DIExpression(), !2660)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2663
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2663
  %conv = trunc i64 %0 to i32, !dbg !2663
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2664
  %conv1 = zext i32 %call to i64, !dbg !2664
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2665
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2666
  ret void, !dbg !2667
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2668 {
entry:
    #dbg_value(ptr %state, !2669, !DIExpression(), !2670)
    #dbg_value(ptr %in, !2671, !DIExpression(), !2670)
    #dbg_value(i32 %inlen, !2672, !DIExpression(), !2670)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2673
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2674
  store i64 136, ptr %arrayidx, align 8, !dbg !2675
  ret void, !dbg !2676
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2677 {
entry:
    #dbg_value(ptr %out, !2678, !DIExpression(), !2679)
    #dbg_value(i32 %nblocks, !2680, !DIExpression(), !2679)
    #dbg_value(ptr %state, !2681, !DIExpression(), !2679)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2682
  ret void, !dbg !2683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2684 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2687, !DIExpression(), !2688)
    #dbg_value(i32 %outlen, !2689, !DIExpression(), !2688)
    #dbg_value(ptr %in, !2690, !DIExpression(), !2688)
    #dbg_value(i32 %inlen, !2691, !DIExpression(), !2688)
    #dbg_declare(ptr %state, !2692, !DIExpression(), !2693)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2694
  %div = udiv i32 %outlen, 168, !dbg !2695
    #dbg_value(i32 %div, !2696, !DIExpression(), !2688)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2697
  %mul.neg = mul i32 %div, -168, !dbg !2698
  %sub = add i32 %mul.neg, %outlen, !dbg !2699
    #dbg_value(i32 %sub, !2689, !DIExpression(), !2688)
  %mul1 = mul nuw i32 %div, 168, !dbg !2700
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2701
    #dbg_value(ptr %add.ptr, !2687, !DIExpression(), !2688)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2702
  ret void, !dbg !2703
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2704 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2705, !DIExpression(), !2706)
    #dbg_value(i32 %outlen, !2707, !DIExpression(), !2706)
    #dbg_value(ptr %in, !2708, !DIExpression(), !2706)
    #dbg_value(i32 %inlen, !2709, !DIExpression(), !2706)
    #dbg_declare(ptr %state, !2710, !DIExpression(), !2711)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2712
  %div = udiv i32 %outlen, 136, !dbg !2713
    #dbg_value(i32 %div, !2714, !DIExpression(), !2706)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2715
  %mul.neg = mul i32 %div, -136, !dbg !2716
  %sub = add i32 %mul.neg, %outlen, !dbg !2717
    #dbg_value(i32 %sub, !2707, !DIExpression(), !2706)
  %mul1 = mul nuw i32 %div, 136, !dbg !2718
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2719
    #dbg_value(ptr %add.ptr, !2705, !DIExpression(), !2706)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2720
  ret void, !dbg !2721
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2722 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2725, !DIExpression(), !2726)
    #dbg_value(ptr %in, !2727, !DIExpression(), !2726)
    #dbg_value(i32 %inlen, !2728, !DIExpression(), !2726)
    #dbg_declare(ptr %s, !2729, !DIExpression(), !2733)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2734
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2735
    #dbg_value(i32 0, !2736, !DIExpression(), !2726)
  br label %for.cond, !dbg !2737

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2739
    #dbg_value(i32 %i.0, !2736, !DIExpression(), !2726)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2740
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2742

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2743
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2744
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2745
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2745
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2746
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2747
    #dbg_value(i32 %inc, !2736, !DIExpression(), !2726)
  br label %for.cond, !dbg !2748, !llvm.loop !2749

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2751
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2752 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2753, !DIExpression(), !2754)
    #dbg_value(ptr %in, !2755, !DIExpression(), !2754)
    #dbg_value(i32 %inlen, !2756, !DIExpression(), !2754)
    #dbg_declare(ptr %s, !2757, !DIExpression(), !2758)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2759
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2760
    #dbg_value(i32 0, !2761, !DIExpression(), !2754)
  br label %for.cond, !dbg !2762

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2764
    #dbg_value(i32 %i.0, !2761, !DIExpression(), !2754)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2765
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2767

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2768
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2769
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2770
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2770
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2771
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2772
    #dbg_value(i32 %inc, !2761, !DIExpression(), !2754)
  br label %for.cond, !dbg !2773, !llvm.loop !2774

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2776
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2777 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2781, !DIExpression(), !2782)
    #dbg_value(ptr %seed, !2783, !DIExpression(), !2782)
    #dbg_value(i8 %x, !2784, !DIExpression(), !2782)
    #dbg_value(i8 %y, !2785, !DIExpression(), !2782)
    #dbg_declare(ptr %extseed, !2786, !DIExpression(), !2790)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2791
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2792
  store i8 %x, ptr %arrayidx, align 1, !dbg !2793
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2794
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2795
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2796
  ret void, !dbg !2797
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2798 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2801, !DIExpression(), !2802)
    #dbg_value(i32 %outlen, !2803, !DIExpression(), !2802)
    #dbg_value(ptr %key, !2804, !DIExpression(), !2802)
    #dbg_value(i8 %nonce, !2805, !DIExpression(), !2802)
    #dbg_declare(ptr %extkey, !2806, !DIExpression(), !2810)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2811
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2812
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2813
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2814
  ret void, !dbg !2815
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2816 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2817, !DIExpression(), !2818)
    #dbg_value(ptr %key, !2819, !DIExpression(), !2818)
    #dbg_value(ptr %input, !2820, !DIExpression(), !2818)
    #dbg_declare(ptr %s, !2821, !DIExpression(), !2822)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2823
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2824
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1088) #3, !dbg !2825
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2826
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2827
  ret void, !dbg !2828
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

!llvm.dbg.cu = !{!79, !41, !83, !84, !89, !93, !53, !95, !97, !99, !68, !100}
!llvm.ident = !{!101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101, !101}
!llvm.module.flags = !{!102, !103, !104, !105}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 110, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
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
!29 = !DIFile(filename: "../../../ref/randombytes.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
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
!42 = !DIFile(filename: "../../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
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
!58 = !DIFile(filename: "../../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2048, elements: !64)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !34, line: 32, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !36, line: 55, baseType: !63)
!63 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!64 = !{!65}
!65 = !DISubrange(count: 128)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !68, file: !74, line: 49, type: !75, isLocal: true, isDefinition: true)
!68 = distinct !DICompileUnit(language: DW_LANG_C11, file: !42, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !73, splitDebugInlining: false, nameTableKind: None)
!69 = !{!70}
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !34, line: 60, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !36, line: 105, baseType: !72)
!72 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!73 = !{!66}
!74 = !DIFile(filename: "../../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 1536, elements: !77)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!77 = !{!78}
!78 = !DISubrange(count: 24)
!79 = distinct !DICompileUnit(language: DW_LANG_C11, file: !80, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !81, globals: !82, splitDebugInlining: false, nameTableKind: None)
!80 = !DIFile(filename: "../../../ref/test/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
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
!117 = !DILocation(line: 103, column: 10, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !2, line: 102, column: 25)
!119 = !DILocalVariable(name: "r", scope: !106, file: !2, line: 100, type: !50)
!120 = !DILocation(line: 104, column: 10, scope: !118)
!121 = !DILocation(line: 104, column: 7, scope: !118)
!122 = !DILocation(line: 105, column: 10, scope: !118)
!123 = !DILocation(line: 105, column: 7, scope: !118)
!124 = !DILocation(line: 106, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !2, line: 106, column: 8)
!126 = !DILocation(line: 102, column: 21, scope: !115)
!127 = !DILocation(line: 102, column: 3, scope: !115)
!128 = distinct !{!128, !116, !129, !130}
!129 = !DILocation(line: 108, column: 3, scope: !112)
!130 = !{!"llvm.loop.mustprogress"}
!131 = !DILocation(line: 110, column: 3, scope: !106)
!132 = !DILocation(line: 111, column: 3, scope: !106)
!133 = !DILocation(line: 112, column: 3, scope: !106)
!134 = !DILocation(line: 114, column: 3, scope: !106)
!135 = !DILocation(line: 115, column: 1, scope: !106)
!136 = distinct !DISubprogram(name: "test_keys", scope: !2, file: !2, line: 9, type: !107, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!137 = !DILocalVariable(name: "pk", scope: !136, file: !2, line: 11, type: !138)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 9472, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 1184)
!141 = !DILocation(line: 11, column: 11, scope: !136)
!142 = !DILocalVariable(name: "sk", scope: !136, file: !2, line: 12, type: !143)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 19200, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 2400)
!146 = !DILocation(line: 12, column: 11, scope: !136)
!147 = !DILocalVariable(name: "ct", scope: !136, file: !2, line: 13, type: !148)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 8704, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 1088)
!151 = !DILocation(line: 13, column: 11, scope: !136)
!152 = !DILocalVariable(name: "key_a", scope: !136, file: !2, line: 14, type: !153)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 32)
!156 = !DILocation(line: 14, column: 11, scope: !136)
!157 = !DILocalVariable(name: "key_b", scope: !136, file: !2, line: 15, type: !153)
!158 = !DILocation(line: 15, column: 11, scope: !136)
!159 = !DILocation(line: 18, column: 3, scope: !136)
!160 = !DILocation(line: 21, column: 3, scope: !136)
!161 = !DILocation(line: 24, column: 3, scope: !136)
!162 = !DILocation(line: 26, column: 6, scope: !163)
!163 = distinct !DILexicalBlock(scope: !136, file: !2, line: 26, column: 6)
!164 = !DILocation(line: 27, column: 5, scope: !165)
!165 = distinct !DILexicalBlock(scope: !163, file: !2, line: 26, column: 42)
!166 = !DILocation(line: 28, column: 5, scope: !165)
!167 = !DILocation(line: 0, scope: !136)
!168 = !DILocation(line: 32, column: 1, scope: !136)
!169 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!170 = !DILocalVariable(name: "pk", scope: !169, file: !2, line: 36, type: !138)
!171 = !DILocation(line: 36, column: 11, scope: !169)
!172 = !DILocalVariable(name: "sk", scope: !169, file: !2, line: 37, type: !143)
!173 = !DILocation(line: 37, column: 11, scope: !169)
!174 = !DILocalVariable(name: "ct", scope: !169, file: !2, line: 38, type: !148)
!175 = !DILocation(line: 38, column: 11, scope: !169)
!176 = !DILocalVariable(name: "key_a", scope: !169, file: !2, line: 39, type: !153)
!177 = !DILocation(line: 39, column: 11, scope: !169)
!178 = !DILocalVariable(name: "key_b", scope: !169, file: !2, line: 40, type: !153)
!179 = !DILocation(line: 40, column: 11, scope: !169)
!180 = !DILocation(line: 43, column: 3, scope: !169)
!181 = !DILocation(line: 46, column: 3, scope: !169)
!182 = !DILocation(line: 49, column: 3, scope: !169)
!183 = !DILocation(line: 52, column: 3, scope: !169)
!184 = !DILocation(line: 54, column: 7, scope: !185)
!185 = distinct !DILexicalBlock(scope: !169, file: !2, line: 54, column: 6)
!186 = !DILocation(line: 54, column: 6, scope: !185)
!187 = !DILocation(line: 55, column: 5, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !2, line: 54, column: 43)
!189 = !DILocation(line: 56, column: 5, scope: !188)
!190 = !DILocation(line: 0, scope: !169)
!191 = !DILocation(line: 60, column: 1, scope: !169)
!192 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!193 = !DILocalVariable(name: "pk", scope: !192, file: !2, line: 64, type: !138)
!194 = !DILocation(line: 64, column: 11, scope: !192)
!195 = !DILocalVariable(name: "sk", scope: !192, file: !2, line: 65, type: !143)
!196 = !DILocation(line: 65, column: 11, scope: !192)
!197 = !DILocalVariable(name: "ct", scope: !192, file: !2, line: 66, type: !148)
!198 = !DILocation(line: 66, column: 11, scope: !192)
!199 = !DILocalVariable(name: "key_a", scope: !192, file: !2, line: 67, type: !153)
!200 = !DILocation(line: 67, column: 11, scope: !192)
!201 = !DILocalVariable(name: "key_b", scope: !192, file: !2, line: 68, type: !153)
!202 = !DILocation(line: 68, column: 11, scope: !192)
!203 = !DILocation(line: 72, column: 3, scope: !192)
!204 = !DILocalVariable(name: "b", scope: !192, file: !2, line: 69, type: !33)
!205 = !DILocation(line: 0, scope: !192)
!206 = !DILocation(line: 73, column: 5, scope: !207)
!207 = distinct !DILexicalBlock(scope: !192, file: !2, line: 72, column: 6)
!208 = !DILocation(line: 74, column: 12, scope: !192)
!209 = !DILocation(line: 74, column: 11, scope: !192)
!210 = !DILocation(line: 74, column: 3, scope: !207)
!211 = distinct !{!211, !203, !212, !130}
!212 = !DILocation(line: 74, column: 13, scope: !192)
!213 = !DILocalVariable(name: "pos", scope: !192, file: !2, line: 70, type: !38)
!214 = !DILocation(line: 75, column: 3, scope: !192)
!215 = !DILocation(line: 78, column: 3, scope: !192)
!216 = !DILocation(line: 81, column: 3, scope: !192)
!217 = !DILocation(line: 84, column: 39, scope: !192)
!218 = !DILocation(line: 84, column: 6, scope: !192)
!219 = !DILocation(line: 84, column: 10, scope: !192)
!220 = !DILocation(line: 84, column: 3, scope: !192)
!221 = !DILocation(line: 84, column: 36, scope: !192)
!222 = !DILocation(line: 87, column: 3, scope: !192)
!223 = !DILocation(line: 89, column: 7, scope: !224)
!224 = distinct !DILexicalBlock(scope: !192, file: !2, line: 89, column: 6)
!225 = !DILocation(line: 89, column: 6, scope: !224)
!226 = !DILocation(line: 90, column: 5, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !2, line: 89, column: 43)
!228 = !DILocation(line: 91, column: 5, scope: !227)
!229 = !DILocation(line: 95, column: 1, scope: !192)
!230 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!231 = !DILocation(line: 0, scope: !28)
!232 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!233 = !DILocation(line: 78, column: 3, scope: !28)
!234 = !DILocation(line: 78, column: 9, scope: !28)
!235 = !DILocation(line: 78, column: 12, scope: !28)
!236 = !DILocation(line: 86, column: 3, scope: !28)
!237 = !DILocation(line: 79, column: 10, scope: !238)
!238 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!239 = !DILocation(line: 79, column: 8, scope: !238)
!240 = !DILocation(line: 80, column: 11, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !29, line: 80, column: 8)
!242 = !DILocation(line: 80, column: 17, scope: !241)
!243 = !DILocation(line: 80, column: 20, scope: !241)
!244 = !DILocation(line: 80, column: 26, scope: !241)
!245 = !DILocation(line: 82, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !241, file: !29, line: 82, column: 13)
!247 = !DILocation(line: 82, column: 16, scope: !246)
!248 = !DILocation(line: 83, column: 7, scope: !246)
!249 = distinct !{!249, !233, !250, !130}
!250 = !DILocation(line: 84, column: 3, scope: !28)
!251 = !DILocation(line: 86, column: 16, scope: !28)
!252 = !DILocation(line: 87, column: 16, scope: !253)
!253 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!254 = !DILocation(line: 87, column: 11, scope: !253)
!255 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !256)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !257, line: 182, baseType: !258)
!257 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!258 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !259, line: 147, baseType: !50)
!259 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!260 = !DILocation(line: 88, column: 18, scope: !261)
!261 = distinct !DILexicalBlock(scope: !253, file: !29, line: 88, column: 8)
!262 = !DILocation(line: 88, column: 21, scope: !261)
!263 = !DILocation(line: 88, column: 27, scope: !261)
!264 = distinct !{!264, !236, !265, !130}
!265 = !DILocation(line: 95, column: 3, scope: !28)
!266 = !DILocation(line: 91, column: 7, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !29, line: 90, column: 13)
!268 = !DILocation(line: 93, column: 9, scope: !253)
!269 = !DILocation(line: 94, column: 12, scope: !253)
!270 = !DILocation(line: 96, column: 1, scope: !28)
!271 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair_derand", scope: !272, file: !272, line: 25, type: !273, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!272 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!273 = !DISubroutineType(types: !274)
!274 = !{!50, !32, !32, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 32)
!276 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!277 = !DILocalVariable(name: "pk", arg: 1, scope: !271, file: !272, line: 25, type: !32)
!278 = !DILocation(line: 0, scope: !271)
!279 = !DILocalVariable(name: "sk", arg: 2, scope: !271, file: !272, line: 26, type: !32)
!280 = !DILocalVariable(name: "coins", arg: 3, scope: !271, file: !272, line: 27, type: !275)
!281 = !DILocation(line: 29, column: 3, scope: !271)
!282 = !DILocation(line: 30, column: 12, scope: !271)
!283 = !DILocation(line: 30, column: 3, scope: !271)
!284 = !DILocation(line: 31, column: 3, scope: !271)
!285 = !DILocation(line: 33, column: 33, scope: !271)
!286 = !DILocation(line: 33, column: 55, scope: !271)
!287 = !DILocation(line: 33, column: 3, scope: !271)
!288 = !DILocation(line: 34, column: 3, scope: !271)
!289 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !272, file: !272, line: 50, type: !290, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!290 = !DISubroutineType(types: !291)
!291 = !{!50, !32, !32}
!292 = !DILocalVariable(name: "pk", arg: 1, scope: !289, file: !272, line: 50, type: !32)
!293 = !DILocation(line: 0, scope: !289)
!294 = !DILocalVariable(name: "sk", arg: 2, scope: !289, file: !272, line: 51, type: !32)
!295 = !DILocalVariable(name: "coins", scope: !289, file: !272, line: 53, type: !296)
!296 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !297)
!297 = !{!298}
!298 = !DISubrange(count: 64)
!299 = !DILocation(line: 53, column: 11, scope: !289)
!300 = !DILocation(line: 54, column: 3, scope: !289)
!301 = !DILocation(line: 55, column: 3, scope: !289)
!302 = !DILocation(line: 56, column: 3, scope: !289)
!303 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !272, file: !272, line: 76, type: !304, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!304 = !DISubroutineType(types: !305)
!305 = !{!50, !32, !32, !275, !275}
!306 = !DILocalVariable(name: "ct", arg: 1, scope: !303, file: !272, line: 76, type: !32)
!307 = !DILocation(line: 0, scope: !303)
!308 = !DILocalVariable(name: "ss", arg: 2, scope: !303, file: !272, line: 77, type: !32)
!309 = !DILocalVariable(name: "pk", arg: 3, scope: !303, file: !272, line: 78, type: !275)
!310 = !DILocalVariable(name: "coins", arg: 4, scope: !303, file: !272, line: 79, type: !275)
!311 = !DILocalVariable(name: "buf", scope: !303, file: !272, line: 81, type: !296)
!312 = !DILocation(line: 81, column: 11, scope: !303)
!313 = !DILocalVariable(name: "kr", scope: !303, file: !272, line: 83, type: !296)
!314 = !DILocation(line: 83, column: 11, scope: !303)
!315 = !DILocation(line: 85, column: 3, scope: !303)
!316 = !DILocation(line: 88, column: 3, scope: !303)
!317 = !DILocation(line: 89, column: 3, scope: !303)
!318 = !DILocation(line: 92, column: 29, scope: !303)
!319 = !DILocation(line: 92, column: 3, scope: !303)
!320 = !DILocation(line: 94, column: 3, scope: !303)
!321 = !DILocation(line: 95, column: 3, scope: !303)
!322 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !272, file: !272, line: 113, type: !273, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!323 = !DILocalVariable(name: "ct", arg: 1, scope: !322, file: !272, line: 113, type: !32)
!324 = !DILocation(line: 0, scope: !322)
!325 = !DILocalVariable(name: "ss", arg: 2, scope: !322, file: !272, line: 114, type: !32)
!326 = !DILocalVariable(name: "pk", arg: 3, scope: !322, file: !272, line: 115, type: !275)
!327 = !DILocalVariable(name: "coins", scope: !322, file: !272, line: 117, type: !153)
!328 = !DILocation(line: 117, column: 11, scope: !322)
!329 = !DILocation(line: 118, column: 3, scope: !322)
!330 = !DILocation(line: 119, column: 3, scope: !322)
!331 = !DILocation(line: 120, column: 3, scope: !322)
!332 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !272, file: !272, line: 140, type: !333, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!333 = !DISubroutineType(types: !334)
!334 = !{!50, !32, !275, !275}
!335 = !DILocalVariable(name: "ss", arg: 1, scope: !332, file: !272, line: 140, type: !32)
!336 = !DILocation(line: 0, scope: !332)
!337 = !DILocalVariable(name: "ct", arg: 2, scope: !332, file: !272, line: 141, type: !275)
!338 = !DILocalVariable(name: "sk", arg: 3, scope: !332, file: !272, line: 142, type: !275)
!339 = !DILocalVariable(name: "buf", scope: !332, file: !272, line: 145, type: !296)
!340 = !DILocation(line: 145, column: 11, scope: !332)
!341 = !DILocalVariable(name: "kr", scope: !332, file: !272, line: 147, type: !296)
!342 = !DILocation(line: 147, column: 11, scope: !332)
!343 = !DILocalVariable(name: "cmp", scope: !332, file: !272, line: 149, type: !148)
!344 = !DILocation(line: 149, column: 11, scope: !332)
!345 = !DILocation(line: 150, column: 25, scope: !332)
!346 = !DILocalVariable(name: "pk", scope: !332, file: !272, line: 150, type: !275)
!347 = !DILocation(line: 152, column: 3, scope: !332)
!348 = !DILocation(line: 155, column: 13, scope: !332)
!349 = !DILocation(line: 155, column: 53, scope: !332)
!350 = !DILocation(line: 155, column: 3, scope: !332)
!351 = !DILocation(line: 156, column: 3, scope: !332)
!352 = !DILocation(line: 159, column: 30, scope: !332)
!353 = !DILocation(line: 159, column: 3, scope: !332)
!354 = !DILocation(line: 161, column: 10, scope: !332)
!355 = !DILocalVariable(name: "fail", scope: !332, file: !272, line: 144, type: !50)
!356 = !DILocation(line: 164, column: 3, scope: !332)
!357 = !DILocation(line: 167, column: 29, scope: !332)
!358 = !DILocation(line: 167, column: 3, scope: !332)
!359 = !DILocation(line: 169, column: 3, scope: !332)
!360 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !361, file: !361, line: 165, type: !362, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!361 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!362 = !DISubroutineType(types: !363)
!363 = !{null, !364, !275, !50}
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !366, line: 8, baseType: !367)
!366 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 12288, elements: !373)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 11, baseType: !370)
!369 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!370 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !371)
!371 = !{!372}
!372 = !DISubrange(count: 256)
!373 = !{!374}
!374 = !DISubrange(count: 3)
!375 = !DILocalVariable(name: "a", arg: 1, scope: !360, file: !361, line: 165, type: !364)
!376 = !DILocation(line: 0, scope: !360)
!377 = !DILocalVariable(name: "seed", arg: 2, scope: !360, file: !361, line: 165, type: !275)
!378 = !DILocalVariable(name: "transposed", arg: 3, scope: !360, file: !361, line: 166, type: !50)
!379 = !DILocalVariable(name: "buf", scope: !360, file: !361, line: 169, type: !380)
!380 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !381)
!381 = !{!382}
!382 = !DISubrange(count: 504)
!383 = !DILocation(line: 169, column: 11, scope: !360)
!384 = !DILocalVariable(name: "state", scope: !360, file: !361, line: 170, type: !385)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !386, line: 10, baseType: !387)
!386 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !388, line: 14, baseType: !389)
!388 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!389 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1664, elements: !24)
!390 = !DILocation(line: 170, column: 13, scope: !360)
!391 = !DILocalVariable(name: "i", scope: !360, file: !361, line: 167, type: !40)
!392 = !DILocation(line: 172, column: 8, scope: !393)
!393 = distinct !DILexicalBlock(scope: !360, file: !361, line: 172, column: 3)
!394 = !DILocation(line: 172, scope: !393)
!395 = !DILocation(line: 172, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !361, line: 172, column: 3)
!397 = !DILocation(line: 172, column: 3, scope: !393)
!398 = !DILocation(line: 173, column: 5, scope: !399)
!399 = distinct !DILexicalBlock(scope: !400, file: !361, line: 173, column: 5)
!400 = distinct !DILexicalBlock(scope: !396, file: !361, line: 172, column: 33)
!401 = !DILocation(line: 173, scope: !399)
!402 = !DILocalVariable(name: "j", scope: !360, file: !361, line: 167, type: !40)
!403 = !DILocation(line: 173, column: 19, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !361, line: 173, column: 5)
!405 = !DILocation(line: 174, column: 11, scope: !406)
!406 = distinct !DILexicalBlock(scope: !407, file: !361, line: 174, column: 11)
!407 = distinct !DILexicalBlock(scope: !404, file: !361, line: 173, column: 35)
!408 = !DILocation(line: 175, column: 9, scope: !406)
!409 = !DILocation(line: 177, column: 9, scope: !406)
!410 = !DILocation(line: 179, column: 7, scope: !407)
!411 = !DILocalVariable(name: "buflen", scope: !360, file: !361, line: 168, type: !40)
!412 = !DILocation(line: 181, column: 25, scope: !407)
!413 = !DILocation(line: 181, column: 13, scope: !407)
!414 = !DILocalVariable(name: "ctr", scope: !360, file: !361, line: 167, type: !40)
!415 = !DILocation(line: 183, column: 7, scope: !407)
!416 = !DILocation(line: 0, scope: !407)
!417 = !DILocation(line: 183, column: 18, scope: !407)
!418 = !DILocation(line: 184, column: 9, scope: !419)
!419 = distinct !DILexicalBlock(scope: !407, file: !361, line: 183, column: 29)
!420 = !DILocation(line: 186, column: 28, scope: !419)
!421 = !DILocation(line: 186, column: 36, scope: !419)
!422 = !DILocation(line: 186, column: 51, scope: !419)
!423 = !DILocation(line: 186, column: 16, scope: !419)
!424 = !DILocation(line: 186, column: 13, scope: !419)
!425 = distinct !{!425, !415, !426, !130}
!426 = !DILocation(line: 187, column: 7, scope: !407)
!427 = !DILocation(line: 173, column: 31, scope: !404)
!428 = !DILocation(line: 173, column: 5, scope: !404)
!429 = distinct !{!429, !398, !430, !130}
!430 = !DILocation(line: 188, column: 5, scope: !399)
!431 = !DILocation(line: 172, column: 29, scope: !396)
!432 = !DILocation(line: 172, column: 3, scope: !396)
!433 = distinct !{!433, !397, !434, !130}
!434 = !DILocation(line: 189, column: 3, scope: !393)
!435 = !DILocation(line: 190, column: 1, scope: !360)
!436 = distinct !DISubprogram(name: "rej_uniform", scope: !361, file: !361, line: 122, type: !437, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!437 = !DISubroutineType(types: !438)
!438 = !{!40, !439, !40, !275, !40}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!440 = !DILocalVariable(name: "r", arg: 1, scope: !436, file: !361, line: 122, type: !439)
!441 = !DILocation(line: 0, scope: !436)
!442 = !DILocalVariable(name: "len", arg: 2, scope: !436, file: !361, line: 122, type: !40)
!443 = !DILocalVariable(name: "buf", arg: 3, scope: !436, file: !361, line: 123, type: !275)
!444 = !DILocalVariable(name: "buflen", arg: 4, scope: !436, file: !361, line: 123, type: !40)
!445 = !DILocalVariable(name: "pos", scope: !436, file: !361, line: 124, type: !40)
!446 = !DILocalVariable(name: "ctr", scope: !436, file: !361, line: 124, type: !40)
!447 = !DILocation(line: 128, column: 3, scope: !436)
!448 = !DILocation(line: 128, column: 14, scope: !436)
!449 = !DILocation(line: 128, column: 20, scope: !436)
!450 = !DILocation(line: 129, column: 14, scope: !451)
!451 = distinct !DILexicalBlock(scope: !436, file: !361, line: 128, column: 42)
!452 = !DILocation(line: 129, column: 46, scope: !451)
!453 = !DILocation(line: 129, column: 36, scope: !451)
!454 = !DILocation(line: 129, column: 59, scope: !451)
!455 = !DILocation(line: 129, column: 66, scope: !451)
!456 = !DILocalVariable(name: "val0", scope: !436, file: !361, line: 125, type: !86)
!457 = !DILocation(line: 130, column: 14, scope: !451)
!458 = !DILocation(line: 130, column: 27, scope: !451)
!459 = !DILocation(line: 130, column: 46, scope: !451)
!460 = !DILocation(line: 130, column: 36, scope: !451)
!461 = !DILocation(line: 130, column: 59, scope: !451)
!462 = !DILocation(line: 130, column: 33, scope: !451)
!463 = !DILocalVariable(name: "val1", scope: !436, file: !361, line: 125, type: !86)
!464 = !DILocation(line: 131, column: 9, scope: !451)
!465 = !DILocation(line: 133, column: 14, scope: !466)
!466 = distinct !DILexicalBlock(scope: !451, file: !361, line: 133, column: 9)
!467 = !DILocation(line: 134, column: 12, scope: !466)
!468 = !DILocation(line: 134, column: 7, scope: !466)
!469 = !DILocation(line: 134, column: 16, scope: !466)
!470 = !DILocation(line: 135, column: 13, scope: !471)
!471 = distinct !DILexicalBlock(scope: !451, file: !361, line: 135, column: 9)
!472 = !DILocation(line: 135, column: 19, scope: !471)
!473 = !DILocation(line: 136, column: 12, scope: !471)
!474 = !DILocation(line: 136, column: 7, scope: !471)
!475 = !DILocation(line: 136, column: 16, scope: !471)
!476 = !DILocation(line: 0, scope: !451)
!477 = distinct !{!477, !447, !478, !130}
!478 = !DILocation(line: 137, column: 3, scope: !436)
!479 = !DILocation(line: 139, column: 3, scope: !436)
!480 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !361, file: !361, line: 205, type: !481, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!481 = !DISubroutineType(types: !482)
!482 = !{null, !32, !32, !275}
!483 = !DILocalVariable(name: "pk", arg: 1, scope: !480, file: !361, line: 205, type: !32)
!484 = !DILocation(line: 0, scope: !480)
!485 = !DILocalVariable(name: "sk", arg: 2, scope: !480, file: !361, line: 206, type: !32)
!486 = !DILocalVariable(name: "coins", arg: 3, scope: !480, file: !361, line: 207, type: !275)
!487 = !DILocalVariable(name: "buf", scope: !480, file: !361, line: 209, type: !296)
!488 = !DILocation(line: 209, column: 11, scope: !480)
!489 = !DILocalVariable(name: "publicseed", scope: !480, file: !361, line: 210, type: !275)
!490 = !DILocation(line: 211, column: 34, scope: !480)
!491 = !DILocalVariable(name: "noiseseed", scope: !480, file: !361, line: 211, type: !275)
!492 = !DILocalVariable(name: "nonce", scope: !480, file: !361, line: 212, type: !33)
!493 = !DILocalVariable(name: "a", scope: !480, file: !361, line: 213, type: !494)
!494 = !DICompositeType(tag: DW_TAG_array_type, baseType: !365, size: 36864, elements: !373)
!495 = !DILocation(line: 213, column: 11, scope: !480)
!496 = !DILocalVariable(name: "e", scope: !480, file: !361, line: 213, type: !365)
!497 = !DILocation(line: 213, column: 23, scope: !480)
!498 = !DILocalVariable(name: "pkpv", scope: !480, file: !361, line: 213, type: !365)
!499 = !DILocation(line: 213, column: 26, scope: !480)
!500 = !DILocalVariable(name: "skpv", scope: !480, file: !361, line: 213, type: !365)
!501 = !DILocation(line: 213, column: 32, scope: !480)
!502 = !DILocation(line: 215, column: 3, scope: !480)
!503 = !DILocation(line: 216, column: 3, scope: !480)
!504 = !DILocation(line: 216, column: 23, scope: !480)
!505 = !DILocation(line: 217, column: 3, scope: !480)
!506 = !DILocation(line: 219, column: 3, scope: !480)
!507 = !DILocalVariable(name: "i", scope: !480, file: !361, line: 208, type: !40)
!508 = !DILocation(line: 221, column: 8, scope: !509)
!509 = distinct !DILexicalBlock(scope: !480, file: !361, line: 221, column: 3)
!510 = !DILocation(line: 221, scope: !509)
!511 = !DILocation(line: 221, column: 17, scope: !512)
!512 = distinct !DILexicalBlock(scope: !509, file: !361, line: 221, column: 3)
!513 = !DILocation(line: 221, column: 3, scope: !509)
!514 = !DILocation(line: 223, column: 3, scope: !515)
!515 = distinct !DILexicalBlock(scope: !480, file: !361, line: 223, column: 3)
!516 = !DILocation(line: 222, column: 25, scope: !512)
!517 = !DILocation(line: 222, column: 5, scope: !512)
!518 = !DILocation(line: 222, column: 50, scope: !512)
!519 = !DILocation(line: 221, column: 29, scope: !512)
!520 = !DILocation(line: 221, column: 3, scope: !512)
!521 = distinct !{!521, !513, !522, !130}
!522 = !DILocation(line: 222, column: 52, scope: !509)
!523 = !DILocation(line: 223, scope: !515)
!524 = !DILocation(line: 223, column: 17, scope: !525)
!525 = distinct !DILexicalBlock(scope: !515, file: !361, line: 223, column: 3)
!526 = !DILocation(line: 224, column: 25, scope: !525)
!527 = !DILocation(line: 224, column: 5, scope: !525)
!528 = !DILocation(line: 224, column: 47, scope: !525)
!529 = !DILocation(line: 223, column: 29, scope: !525)
!530 = !DILocation(line: 223, column: 3, scope: !525)
!531 = distinct !{!531, !514, !532, !130}
!532 = !DILocation(line: 224, column: 49, scope: !515)
!533 = !DILocation(line: 226, column: 3, scope: !480)
!534 = !DILocation(line: 227, column: 3, scope: !480)
!535 = !DILocation(line: 230, column: 8, scope: !536)
!536 = distinct !DILexicalBlock(scope: !480, file: !361, line: 230, column: 3)
!537 = !DILocation(line: 230, scope: !536)
!538 = !DILocation(line: 230, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !361, line: 230, column: 3)
!540 = !DILocation(line: 230, column: 3, scope: !536)
!541 = !DILocation(line: 231, column: 37, scope: !542)
!542 = distinct !DILexicalBlock(scope: !539, file: !361, line: 230, column: 33)
!543 = !DILocation(line: 231, column: 47, scope: !542)
!544 = !DILocation(line: 231, column: 5, scope: !542)
!545 = !DILocation(line: 232, column: 18, scope: !542)
!546 = !DILocation(line: 232, column: 5, scope: !542)
!547 = !DILocation(line: 230, column: 29, scope: !539)
!548 = !DILocation(line: 230, column: 3, scope: !539)
!549 = distinct !{!549, !540, !550, !130}
!550 = !DILocation(line: 233, column: 3, scope: !536)
!551 = !DILocation(line: 235, column: 3, scope: !480)
!552 = !DILocation(line: 236, column: 3, scope: !480)
!553 = !DILocation(line: 238, column: 3, scope: !480)
!554 = !DILocation(line: 239, column: 3, scope: !480)
!555 = !DILocation(line: 240, column: 1, scope: !480)
!556 = distinct !DISubprogram(name: "pack_sk", scope: !361, file: !361, line: 55, type: !557, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!557 = !DISubroutineType(types: !558)
!558 = !{null, !32, !364}
!559 = !DILocalVariable(name: "r", arg: 1, scope: !556, file: !361, line: 55, type: !32)
!560 = !DILocation(line: 0, scope: !556)
!561 = !DILocalVariable(name: "sk", arg: 2, scope: !556, file: !361, line: 55, type: !364)
!562 = !DILocation(line: 56, column: 3, scope: !556)
!563 = !DILocation(line: 57, column: 1, scope: !556)
!564 = distinct !DISubprogram(name: "pack_pk", scope: !361, file: !361, line: 23, type: !565, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!565 = !DISubroutineType(types: !566)
!566 = !{null, !32, !364, !275}
!567 = !DILocalVariable(name: "r", arg: 1, scope: !564, file: !361, line: 23, type: !32)
!568 = !DILocation(line: 0, scope: !564)
!569 = !DILocalVariable(name: "pk", arg: 2, scope: !564, file: !361, line: 23, type: !364)
!570 = !DILocalVariable(name: "seed", arg: 3, scope: !564, file: !361, line: 24, type: !275)
!571 = !DILocation(line: 25, column: 3, scope: !564)
!572 = !DILocation(line: 26, column: 12, scope: !564)
!573 = !DILocation(line: 26, column: 3, scope: !564)
!574 = !DILocation(line: 27, column: 1, scope: !564)
!575 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !361, file: !361, line: 257, type: !576, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !32, !275, !275, !275}
!578 = !DILocalVariable(name: "c", arg: 1, scope: !575, file: !361, line: 257, type: !32)
!579 = !DILocation(line: 0, scope: !575)
!580 = !DILocalVariable(name: "m", arg: 2, scope: !575, file: !361, line: 258, type: !275)
!581 = !DILocalVariable(name: "pk", arg: 3, scope: !575, file: !361, line: 259, type: !275)
!582 = !DILocalVariable(name: "coins", arg: 4, scope: !575, file: !361, line: 260, type: !275)
!583 = !DILocalVariable(name: "seed", scope: !575, file: !361, line: 262, type: !153)
!584 = !DILocation(line: 262, column: 11, scope: !575)
!585 = !DILocalVariable(name: "nonce", scope: !575, file: !361, line: 263, type: !33)
!586 = !DILocalVariable(name: "sp", scope: !575, file: !361, line: 264, type: !365)
!587 = !DILocation(line: 264, column: 11, scope: !575)
!588 = !DILocalVariable(name: "pkpv", scope: !575, file: !361, line: 264, type: !365)
!589 = !DILocation(line: 264, column: 15, scope: !575)
!590 = !DILocalVariable(name: "ep", scope: !575, file: !361, line: 264, type: !365)
!591 = !DILocation(line: 264, column: 21, scope: !575)
!592 = !DILocalVariable(name: "at", scope: !575, file: !361, line: 264, type: !494)
!593 = !DILocation(line: 264, column: 25, scope: !575)
!594 = !DILocalVariable(name: "b", scope: !575, file: !361, line: 264, type: !365)
!595 = !DILocation(line: 264, column: 38, scope: !575)
!596 = !DILocalVariable(name: "v", scope: !575, file: !361, line: 265, type: !368)
!597 = !DILocation(line: 265, column: 8, scope: !575)
!598 = !DILocalVariable(name: "k", scope: !575, file: !361, line: 265, type: !368)
!599 = !DILocation(line: 265, column: 11, scope: !575)
!600 = !DILocalVariable(name: "epp", scope: !575, file: !361, line: 265, type: !368)
!601 = !DILocation(line: 265, column: 14, scope: !575)
!602 = !DILocation(line: 267, column: 3, scope: !575)
!603 = !DILocation(line: 268, column: 3, scope: !575)
!604 = !DILocation(line: 269, column: 3, scope: !575)
!605 = !DILocalVariable(name: "i", scope: !575, file: !361, line: 261, type: !40)
!606 = !DILocation(line: 271, column: 8, scope: !607)
!607 = distinct !DILexicalBlock(scope: !575, file: !361, line: 271, column: 3)
!608 = !DILocation(line: 271, scope: !607)
!609 = !DILocation(line: 271, column: 17, scope: !610)
!610 = distinct !DILexicalBlock(scope: !607, file: !361, line: 271, column: 3)
!611 = !DILocation(line: 271, column: 3, scope: !607)
!612 = !DILocation(line: 273, column: 3, scope: !613)
!613 = distinct !DILexicalBlock(scope: !575, file: !361, line: 273, column: 3)
!614 = !DILocation(line: 272, column: 27, scope: !610)
!615 = !DILocation(line: 272, column: 5, scope: !610)
!616 = !DILocation(line: 272, column: 44, scope: !610)
!617 = !DILocation(line: 271, column: 29, scope: !610)
!618 = !DILocation(line: 271, column: 3, scope: !610)
!619 = distinct !{!619, !611, !620, !130}
!620 = !DILocation(line: 272, column: 46, scope: !607)
!621 = !DILocation(line: 273, scope: !613)
!622 = !DILocation(line: 273, column: 17, scope: !623)
!623 = distinct !DILexicalBlock(scope: !613, file: !361, line: 273, column: 3)
!624 = !DILocation(line: 274, column: 27, scope: !623)
!625 = !DILocation(line: 274, column: 5, scope: !623)
!626 = !DILocation(line: 274, column: 44, scope: !623)
!627 = !DILocation(line: 273, column: 29, scope: !623)
!628 = !DILocation(line: 273, column: 3, scope: !623)
!629 = distinct !{!629, !612, !630, !130}
!630 = !DILocation(line: 274, column: 46, scope: !613)
!631 = !DILocation(line: 275, column: 3, scope: !575)
!632 = !DILocation(line: 277, column: 3, scope: !575)
!633 = !DILocation(line: 280, column: 8, scope: !634)
!634 = distinct !DILexicalBlock(scope: !575, file: !361, line: 280, column: 3)
!635 = !DILocation(line: 280, scope: !634)
!636 = !DILocation(line: 280, column: 17, scope: !637)
!637 = distinct !DILexicalBlock(scope: !634, file: !361, line: 280, column: 3)
!638 = !DILocation(line: 280, column: 3, scope: !634)
!639 = !DILocation(line: 281, column: 37, scope: !637)
!640 = !DILocation(line: 281, column: 44, scope: !637)
!641 = !DILocation(line: 281, column: 5, scope: !637)
!642 = !DILocation(line: 280, column: 29, scope: !637)
!643 = !DILocation(line: 280, column: 3, scope: !637)
!644 = distinct !{!644, !638, !645, !130}
!645 = !DILocation(line: 281, column: 54, scope: !634)
!646 = !DILocation(line: 283, column: 3, scope: !575)
!647 = !DILocation(line: 285, column: 3, scope: !575)
!648 = !DILocation(line: 286, column: 3, scope: !575)
!649 = !DILocation(line: 288, column: 3, scope: !575)
!650 = !DILocation(line: 289, column: 3, scope: !575)
!651 = !DILocation(line: 290, column: 3, scope: !575)
!652 = !DILocation(line: 291, column: 3, scope: !575)
!653 = !DILocation(line: 292, column: 3, scope: !575)
!654 = !DILocation(line: 294, column: 3, scope: !575)
!655 = !DILocation(line: 295, column: 1, scope: !575)
!656 = distinct !DISubprogram(name: "unpack_pk", scope: !361, file: !361, line: 40, type: !657, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!657 = !DISubroutineType(types: !658)
!658 = !{null, !364, !32, !275}
!659 = !DILocalVariable(name: "pk", arg: 1, scope: !656, file: !361, line: 40, type: !364)
!660 = !DILocation(line: 0, scope: !656)
!661 = !DILocalVariable(name: "seed", arg: 2, scope: !656, file: !361, line: 40, type: !32)
!662 = !DILocalVariable(name: "packedpk", arg: 3, scope: !656, file: !361, line: 41, type: !275)
!663 = !DILocation(line: 42, column: 3, scope: !656)
!664 = !DILocation(line: 43, column: 25, scope: !656)
!665 = !DILocation(line: 43, column: 3, scope: !656)
!666 = !DILocation(line: 44, column: 1, scope: !656)
!667 = distinct !DISubprogram(name: "pack_ciphertext", scope: !361, file: !361, line: 85, type: !668, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !32, !364, !670}
!670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 32)
!671 = !DILocalVariable(name: "r", arg: 1, scope: !667, file: !361, line: 85, type: !32)
!672 = !DILocation(line: 0, scope: !667)
!673 = !DILocalVariable(name: "b", arg: 2, scope: !667, file: !361, line: 85, type: !364)
!674 = !DILocalVariable(name: "v", arg: 3, scope: !667, file: !361, line: 86, type: !670)
!675 = !DILocation(line: 87, column: 3, scope: !667)
!676 = !DILocation(line: 88, column: 19, scope: !667)
!677 = !DILocation(line: 88, column: 3, scope: !667)
!678 = !DILocation(line: 89, column: 1, scope: !667)
!679 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !361, file: !361, line: 310, type: !680, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !32, !275, !275}
!682 = !DILocalVariable(name: "m", arg: 1, scope: !679, file: !361, line: 310, type: !32)
!683 = !DILocation(line: 0, scope: !679)
!684 = !DILocalVariable(name: "c", arg: 2, scope: !679, file: !361, line: 311, type: !275)
!685 = !DILocalVariable(name: "sk", arg: 3, scope: !679, file: !361, line: 312, type: !275)
!686 = !DILocalVariable(name: "b", scope: !679, file: !361, line: 313, type: !365)
!687 = !DILocation(line: 313, column: 11, scope: !679)
!688 = !DILocalVariable(name: "skpv", scope: !679, file: !361, line: 313, type: !365)
!689 = !DILocation(line: 313, column: 14, scope: !679)
!690 = !DILocalVariable(name: "v", scope: !679, file: !361, line: 314, type: !368)
!691 = !DILocation(line: 314, column: 8, scope: !679)
!692 = !DILocalVariable(name: "mp", scope: !679, file: !361, line: 314, type: !368)
!693 = !DILocation(line: 314, column: 11, scope: !679)
!694 = !DILocation(line: 316, column: 3, scope: !679)
!695 = !DILocation(line: 317, column: 3, scope: !679)
!696 = !DILocation(line: 319, column: 3, scope: !679)
!697 = !DILocation(line: 320, column: 3, scope: !679)
!698 = !DILocation(line: 321, column: 3, scope: !679)
!699 = !DILocation(line: 323, column: 3, scope: !679)
!700 = !DILocation(line: 324, column: 3, scope: !679)
!701 = !DILocation(line: 326, column: 3, scope: !679)
!702 = !DILocation(line: 327, column: 1, scope: !679)
!703 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !361, file: !361, line: 101, type: !704, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!704 = !DISubroutineType(types: !705)
!705 = !{null, !364, !670, !275}
!706 = !DILocalVariable(name: "b", arg: 1, scope: !703, file: !361, line: 101, type: !364)
!707 = !DILocation(line: 0, scope: !703)
!708 = !DILocalVariable(name: "v", arg: 2, scope: !703, file: !361, line: 101, type: !670)
!709 = !DILocalVariable(name: "c", arg: 3, scope: !703, file: !361, line: 102, type: !275)
!710 = !DILocation(line: 103, column: 3, scope: !703)
!711 = !DILocation(line: 104, column: 24, scope: !703)
!712 = !DILocation(line: 104, column: 3, scope: !703)
!713 = !DILocation(line: 105, column: 1, scope: !703)
!714 = distinct !DISubprogram(name: "unpack_sk", scope: !361, file: !361, line: 69, type: !715, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!715 = !DISubroutineType(types: !716)
!716 = !{null, !364, !275}
!717 = !DILocalVariable(name: "sk", arg: 1, scope: !714, file: !361, line: 69, type: !364)
!718 = !DILocation(line: 0, scope: !714)
!719 = !DILocalVariable(name: "packedsk", arg: 2, scope: !714, file: !361, line: 70, type: !275)
!720 = !DILocation(line: 71, column: 3, scope: !714)
!721 = !DILocation(line: 72, column: 1, scope: !714)
!722 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !723, file: !723, line: 15, type: !724, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!723 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!724 = !DISubroutineType(types: !725)
!725 = !{null, !32, !726}
!726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !727, size: 32)
!727 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !365)
!728 = !DILocalVariable(name: "r", arg: 1, scope: !722, file: !723, line: 15, type: !32)
!729 = !DILocation(line: 0, scope: !722)
!730 = !DILocalVariable(name: "a", arg: 2, scope: !722, file: !723, line: 16, type: !726)
!731 = !DILocalVariable(name: "t", scope: !722, file: !723, line: 52, type: !732)
!732 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !733)
!733 = !{!734}
!734 = !DISubrange(count: 4)
!735 = !DILocation(line: 52, column: 12, scope: !722)
!736 = !DILocalVariable(name: "i", scope: !722, file: !723, line: 17, type: !40)
!737 = !DILocation(line: 53, column: 8, scope: !738)
!738 = distinct !DILexicalBlock(scope: !722, file: !723, line: 53, column: 3)
!739 = !DILocation(line: 53, scope: !738)
!740 = !DILocation(line: 53, column: 17, scope: !741)
!741 = distinct !DILexicalBlock(scope: !738, file: !723, line: 53, column: 3)
!742 = !DILocation(line: 53, column: 3, scope: !738)
!743 = !DILocation(line: 54, column: 5, scope: !744)
!744 = distinct !DILexicalBlock(scope: !745, file: !723, line: 54, column: 5)
!745 = distinct !DILexicalBlock(scope: !741, file: !723, line: 53, column: 33)
!746 = !DILocation(line: 54, scope: !744)
!747 = !DILocalVariable(name: "j", scope: !722, file: !723, line: 17, type: !40)
!748 = !DILocation(line: 54, column: 19, scope: !749)
!749 = distinct !DILexicalBlock(scope: !744, file: !723, line: 54, column: 5)
!750 = !DILocation(line: 55, column: 7, scope: !751)
!751 = distinct !DILexicalBlock(scope: !752, file: !723, line: 55, column: 7)
!752 = distinct !DILexicalBlock(scope: !749, file: !723, line: 54, column: 39)
!753 = !DILocation(line: 55, scope: !751)
!754 = !DILocalVariable(name: "k", scope: !722, file: !723, line: 17, type: !40)
!755 = !DILocation(line: 55, column: 21, scope: !756)
!756 = distinct !DILexicalBlock(scope: !751, file: !723, line: 55, column: 7)
!757 = !DILocation(line: 56, column: 26, scope: !758)
!758 = distinct !DILexicalBlock(scope: !756, file: !723, line: 55, column: 31)
!759 = !DILocation(line: 56, column: 30, scope: !758)
!760 = !DILocation(line: 56, column: 16, scope: !758)
!761 = !DILocation(line: 57, column: 39, scope: !758)
!762 = !DILocation(line: 57, column: 9, scope: !758)
!763 = !DILocation(line: 57, column: 14, scope: !758)
!764 = !DILocation(line: 60, column: 14, scope: !758)
!765 = !DILocalVariable(name: "d0", scope: !722, file: !723, line: 18, type: !70)
!766 = !DILocation(line: 63, column: 12, scope: !758)
!767 = !DILocation(line: 64, column: 12, scope: !758)
!768 = !DILocation(line: 65, column: 16, scope: !758)
!769 = !DILocation(line: 65, column: 9, scope: !758)
!770 = !DILocation(line: 65, column: 14, scope: !758)
!771 = !DILocation(line: 55, column: 27, scope: !756)
!772 = !DILocation(line: 55, column: 7, scope: !756)
!773 = distinct !{!773, !750, !774, !130}
!774 = !DILocation(line: 66, column: 7, scope: !751)
!775 = !DILocation(line: 68, column: 15, scope: !752)
!776 = !DILocation(line: 68, column: 14, scope: !752)
!777 = !DILocation(line: 68, column: 12, scope: !752)
!778 = !DILocation(line: 69, column: 15, scope: !752)
!779 = !DILocation(line: 69, column: 20, scope: !752)
!780 = !DILocation(line: 69, column: 29, scope: !752)
!781 = !DILocation(line: 69, column: 34, scope: !752)
!782 = !DILocation(line: 69, column: 26, scope: !752)
!783 = !DILocation(line: 69, column: 7, scope: !752)
!784 = !DILocation(line: 69, column: 12, scope: !752)
!785 = !DILocation(line: 70, column: 15, scope: !752)
!786 = !DILocation(line: 70, column: 20, scope: !752)
!787 = !DILocation(line: 70, column: 29, scope: !752)
!788 = !DILocation(line: 70, column: 34, scope: !752)
!789 = !DILocation(line: 70, column: 26, scope: !752)
!790 = !DILocation(line: 70, column: 7, scope: !752)
!791 = !DILocation(line: 70, column: 12, scope: !752)
!792 = !DILocation(line: 71, column: 15, scope: !752)
!793 = !DILocation(line: 71, column: 20, scope: !752)
!794 = !DILocation(line: 71, column: 29, scope: !752)
!795 = !DILocation(line: 71, column: 34, scope: !752)
!796 = !DILocation(line: 71, column: 26, scope: !752)
!797 = !DILocation(line: 71, column: 7, scope: !752)
!798 = !DILocation(line: 71, column: 12, scope: !752)
!799 = !DILocation(line: 72, column: 15, scope: !752)
!800 = !DILocation(line: 72, column: 20, scope: !752)
!801 = !DILocation(line: 72, column: 14, scope: !752)
!802 = !DILocation(line: 72, column: 7, scope: !752)
!803 = !DILocation(line: 72, column: 12, scope: !752)
!804 = !DILocation(line: 73, column: 9, scope: !752)
!805 = !DILocation(line: 54, column: 35, scope: !749)
!806 = !DILocation(line: 54, column: 5, scope: !749)
!807 = distinct !{!807, !743, !808, !130}
!808 = !DILocation(line: 74, column: 5, scope: !744)
!809 = !DILocation(line: 53, column: 29, scope: !741)
!810 = !DILocation(line: 53, column: 3, scope: !741)
!811 = distinct !{!811, !742, !812, !130}
!812 = !DILocation(line: 75, column: 3, scope: !738)
!813 = !DILocation(line: 79, column: 1, scope: !722)
!814 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !723, file: !723, line: 91, type: !715, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!815 = !DILocalVariable(name: "r", arg: 1, scope: !814, file: !723, line: 91, type: !364)
!816 = !DILocation(line: 0, scope: !814)
!817 = !DILocalVariable(name: "a", arg: 2, scope: !814, file: !723, line: 92, type: !275)
!818 = !DILocalVariable(name: "t", scope: !814, file: !723, line: 114, type: !732)
!819 = !DILocation(line: 114, column: 12, scope: !814)
!820 = !DILocalVariable(name: "i", scope: !814, file: !723, line: 93, type: !40)
!821 = !DILocation(line: 115, column: 8, scope: !822)
!822 = distinct !DILexicalBlock(scope: !814, file: !723, line: 115, column: 3)
!823 = !DILocation(line: 115, scope: !822)
!824 = !DILocation(line: 115, column: 17, scope: !825)
!825 = distinct !DILexicalBlock(scope: !822, file: !723, line: 115, column: 3)
!826 = !DILocation(line: 115, column: 3, scope: !822)
!827 = !DILocation(line: 116, column: 5, scope: !828)
!828 = distinct !DILexicalBlock(scope: !829, file: !723, line: 116, column: 5)
!829 = distinct !DILexicalBlock(scope: !825, file: !723, line: 115, column: 33)
!830 = !DILocation(line: 116, scope: !828)
!831 = !DILocalVariable(name: "j", scope: !814, file: !723, line: 93, type: !40)
!832 = !DILocation(line: 116, column: 19, scope: !833)
!833 = distinct !DILexicalBlock(scope: !828, file: !723, line: 116, column: 5)
!834 = !DILocation(line: 117, column: 15, scope: !835)
!835 = distinct !DILexicalBlock(scope: !833, file: !723, line: 116, column: 39)
!836 = !DILocation(line: 117, column: 39, scope: !835)
!837 = !DILocation(line: 117, column: 29, scope: !835)
!838 = !DILocation(line: 117, column: 44, scope: !835)
!839 = !DILocation(line: 117, column: 26, scope: !835)
!840 = !DILocation(line: 117, column: 12, scope: !835)
!841 = !DILocation(line: 118, column: 15, scope: !835)
!842 = !DILocation(line: 118, column: 20, scope: !835)
!843 = !DILocation(line: 118, column: 39, scope: !835)
!844 = !DILocation(line: 118, column: 29, scope: !835)
!845 = !DILocation(line: 118, column: 44, scope: !835)
!846 = !DILocation(line: 118, column: 26, scope: !835)
!847 = !DILocation(line: 118, column: 7, scope: !835)
!848 = !DILocation(line: 118, column: 12, scope: !835)
!849 = !DILocation(line: 119, column: 15, scope: !835)
!850 = !DILocation(line: 119, column: 20, scope: !835)
!851 = !DILocation(line: 119, column: 39, scope: !835)
!852 = !DILocation(line: 119, column: 29, scope: !835)
!853 = !DILocation(line: 119, column: 44, scope: !835)
!854 = !DILocation(line: 119, column: 26, scope: !835)
!855 = !DILocation(line: 119, column: 7, scope: !835)
!856 = !DILocation(line: 119, column: 12, scope: !835)
!857 = !DILocation(line: 120, column: 15, scope: !835)
!858 = !DILocation(line: 120, column: 20, scope: !835)
!859 = !DILocation(line: 120, column: 39, scope: !835)
!860 = !DILocation(line: 120, column: 29, scope: !835)
!861 = !DILocation(line: 120, column: 44, scope: !835)
!862 = !DILocation(line: 120, column: 26, scope: !835)
!863 = !DILocation(line: 120, column: 7, scope: !835)
!864 = !DILocation(line: 120, column: 12, scope: !835)
!865 = !DILocalVariable(name: "k", scope: !814, file: !723, line: 93, type: !40)
!866 = !DILocation(line: 123, column: 12, scope: !867)
!867 = distinct !DILexicalBlock(scope: !835, file: !723, line: 123, column: 7)
!868 = !DILocation(line: 123, scope: !867)
!869 = !DILocation(line: 123, column: 21, scope: !870)
!870 = distinct !DILexicalBlock(scope: !867, file: !723, line: 123, column: 7)
!871 = !DILocation(line: 123, column: 7, scope: !867)
!872 = !DILocation(line: 124, column: 42, scope: !870)
!873 = !DILocation(line: 124, column: 47, scope: !870)
!874 = !DILocation(line: 124, column: 56, scope: !870)
!875 = !DILocation(line: 124, column: 66, scope: !870)
!876 = !DILocation(line: 124, column: 73, scope: !870)
!877 = !DILocation(line: 124, column: 30, scope: !870)
!878 = !DILocation(line: 124, column: 19, scope: !870)
!879 = !DILocation(line: 124, column: 23, scope: !870)
!880 = !DILocation(line: 124, column: 9, scope: !870)
!881 = !DILocation(line: 124, column: 28, scope: !870)
!882 = !DILocation(line: 123, column: 27, scope: !870)
!883 = !DILocation(line: 123, column: 7, scope: !870)
!884 = distinct !{!884, !871, !885, !130}
!885 = !DILocation(line: 124, column: 76, scope: !867)
!886 = !DILocation(line: 121, column: 9, scope: !835)
!887 = !DILocation(line: 116, column: 35, scope: !833)
!888 = !DILocation(line: 116, column: 5, scope: !833)
!889 = distinct !{!889, !827, !890, !130}
!890 = !DILocation(line: 125, column: 5, scope: !828)
!891 = !DILocation(line: 115, column: 29, scope: !825)
!892 = !DILocation(line: 115, column: 3, scope: !825)
!893 = distinct !{!893, !826, !894, !130}
!894 = !DILocation(line: 126, column: 3, scope: !822)
!895 = !DILocation(line: 130, column: 1, scope: !814)
!896 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !723, file: !723, line: 141, type: !724, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!897 = !DILocalVariable(name: "r", arg: 1, scope: !896, file: !723, line: 141, type: !32)
!898 = !DILocation(line: 0, scope: !896)
!899 = !DILocalVariable(name: "a", arg: 2, scope: !896, file: !723, line: 141, type: !726)
!900 = !DILocalVariable(name: "i", scope: !896, file: !723, line: 142, type: !40)
!901 = !DILocation(line: 143, column: 8, scope: !902)
!902 = distinct !DILexicalBlock(scope: !896, file: !723, line: 143, column: 3)
!903 = !DILocation(line: 143, scope: !902)
!904 = !DILocation(line: 143, column: 17, scope: !905)
!905 = distinct !DILexicalBlock(scope: !902, file: !723, line: 143, column: 3)
!906 = !DILocation(line: 143, column: 3, scope: !902)
!907 = !DILocation(line: 144, column: 24, scope: !905)
!908 = !DILocation(line: 144, column: 20, scope: !905)
!909 = !DILocation(line: 144, column: 44, scope: !905)
!910 = !DILocation(line: 144, column: 5, scope: !905)
!911 = !DILocation(line: 143, column: 29, scope: !905)
!912 = !DILocation(line: 143, column: 3, scope: !905)
!913 = distinct !{!913, !906, !914, !130}
!914 = !DILocation(line: 144, column: 51, scope: !902)
!915 = !DILocation(line: 145, column: 1, scope: !896)
!916 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !723, file: !723, line: 157, type: !715, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!917 = !DILocalVariable(name: "r", arg: 1, scope: !916, file: !723, line: 157, type: !364)
!918 = !DILocation(line: 0, scope: !916)
!919 = !DILocalVariable(name: "a", arg: 2, scope: !916, file: !723, line: 157, type: !275)
!920 = !DILocalVariable(name: "i", scope: !916, file: !723, line: 158, type: !40)
!921 = !DILocation(line: 159, column: 8, scope: !922)
!922 = distinct !DILexicalBlock(scope: !916, file: !723, line: 159, column: 3)
!923 = !DILocation(line: 159, scope: !922)
!924 = !DILocation(line: 159, column: 17, scope: !925)
!925 = distinct !DILexicalBlock(scope: !922, file: !723, line: 159, column: 3)
!926 = !DILocation(line: 159, column: 3, scope: !922)
!927 = !DILocation(line: 160, column: 21, scope: !925)
!928 = !DILocation(line: 160, column: 36, scope: !925)
!929 = !DILocation(line: 160, column: 32, scope: !925)
!930 = !DILocation(line: 160, column: 5, scope: !925)
!931 = !DILocation(line: 159, column: 29, scope: !925)
!932 = !DILocation(line: 159, column: 3, scope: !925)
!933 = distinct !{!933, !926, !934, !130}
!934 = !DILocation(line: 160, column: 53, scope: !922)
!935 = !DILocation(line: 161, column: 1, scope: !916)
!936 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !723, file: !723, line: 170, type: !937, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!937 = !DISubroutineType(types: !938)
!938 = !{null, !364}
!939 = !DILocalVariable(name: "r", arg: 1, scope: !936, file: !723, line: 170, type: !364)
!940 = !DILocation(line: 0, scope: !936)
!941 = !DILocalVariable(name: "i", scope: !936, file: !723, line: 171, type: !40)
!942 = !DILocation(line: 172, column: 8, scope: !943)
!943 = distinct !DILexicalBlock(scope: !936, file: !723, line: 172, column: 3)
!944 = !DILocation(line: 172, scope: !943)
!945 = !DILocation(line: 172, column: 17, scope: !946)
!946 = distinct !DILexicalBlock(scope: !943, file: !723, line: 172, column: 3)
!947 = !DILocation(line: 172, column: 3, scope: !943)
!948 = !DILocation(line: 173, column: 15, scope: !946)
!949 = !DILocation(line: 173, column: 5, scope: !946)
!950 = !DILocation(line: 172, column: 29, scope: !946)
!951 = !DILocation(line: 172, column: 3, scope: !946)
!952 = distinct !{!952, !947, !953, !130}
!953 = !DILocation(line: 173, column: 22, scope: !943)
!954 = !DILocation(line: 174, column: 1, scope: !936)
!955 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !723, file: !723, line: 184, type: !937, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!956 = !DILocalVariable(name: "r", arg: 1, scope: !955, file: !723, line: 184, type: !364)
!957 = !DILocation(line: 0, scope: !955)
!958 = !DILocalVariable(name: "i", scope: !955, file: !723, line: 185, type: !40)
!959 = !DILocation(line: 186, column: 8, scope: !960)
!960 = distinct !DILexicalBlock(scope: !955, file: !723, line: 186, column: 3)
!961 = !DILocation(line: 186, scope: !960)
!962 = !DILocation(line: 186, column: 17, scope: !963)
!963 = distinct !DILexicalBlock(scope: !960, file: !723, line: 186, column: 3)
!964 = !DILocation(line: 186, column: 3, scope: !960)
!965 = !DILocation(line: 187, column: 25, scope: !963)
!966 = !DILocation(line: 187, column: 5, scope: !963)
!967 = !DILocation(line: 186, column: 29, scope: !963)
!968 = !DILocation(line: 186, column: 3, scope: !963)
!969 = distinct !{!969, !964, !970, !130}
!970 = !DILocation(line: 187, column: 32, scope: !960)
!971 = !DILocation(line: 188, column: 1, scope: !955)
!972 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !723, file: !723, line: 200, type: !973, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!973 = !DISubroutineType(types: !974)
!974 = !{null, !670, !726, !726}
!975 = !DILocalVariable(name: "r", arg: 1, scope: !972, file: !723, line: 200, type: !670)
!976 = !DILocation(line: 0, scope: !972)
!977 = !DILocalVariable(name: "a", arg: 2, scope: !972, file: !723, line: 200, type: !726)
!978 = !DILocalVariable(name: "b", arg: 3, scope: !972, file: !723, line: 201, type: !726)
!979 = !DILocalVariable(name: "t", scope: !972, file: !723, line: 203, type: !368)
!980 = !DILocation(line: 203, column: 8, scope: !972)
!981 = !DILocation(line: 205, column: 3, scope: !972)
!982 = !DILocalVariable(name: "i", scope: !972, file: !723, line: 202, type: !40)
!983 = !DILocation(line: 206, column: 8, scope: !984)
!984 = distinct !DILexicalBlock(scope: !972, file: !723, line: 206, column: 3)
!985 = !DILocation(line: 206, scope: !984)
!986 = !DILocation(line: 206, column: 17, scope: !987)
!987 = distinct !DILexicalBlock(scope: !984, file: !723, line: 206, column: 3)
!988 = !DILocation(line: 206, column: 3, scope: !984)
!989 = !DILocation(line: 207, column: 34, scope: !990)
!990 = distinct !DILexicalBlock(scope: !987, file: !723, line: 206, column: 33)
!991 = !DILocation(line: 207, column: 44, scope: !990)
!992 = !DILocation(line: 207, column: 5, scope: !990)
!993 = !DILocation(line: 208, column: 5, scope: !990)
!994 = !DILocation(line: 206, column: 29, scope: !987)
!995 = !DILocation(line: 206, column: 3, scope: !987)
!996 = distinct !{!996, !988, !997, !130}
!997 = !DILocation(line: 209, column: 3, scope: !984)
!998 = !DILocation(line: 211, column: 3, scope: !972)
!999 = !DILocation(line: 212, column: 1, scope: !972)
!1000 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !723, file: !723, line: 223, type: !937, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1001 = !DILocalVariable(name: "r", arg: 1, scope: !1000, file: !723, line: 223, type: !364)
!1002 = !DILocation(line: 0, scope: !1000)
!1003 = !DILocalVariable(name: "i", scope: !1000, file: !723, line: 224, type: !40)
!1004 = !DILocation(line: 225, column: 8, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !1000, file: !723, line: 225, column: 3)
!1006 = !DILocation(line: 225, scope: !1005)
!1007 = !DILocation(line: 225, column: 17, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1005, file: !723, line: 225, column: 3)
!1009 = !DILocation(line: 225, column: 3, scope: !1005)
!1010 = !DILocation(line: 226, column: 18, scope: !1008)
!1011 = !DILocation(line: 226, column: 5, scope: !1008)
!1012 = !DILocation(line: 225, column: 29, scope: !1008)
!1013 = !DILocation(line: 225, column: 3, scope: !1008)
!1014 = distinct !{!1014, !1009, !1015, !130}
!1015 = !DILocation(line: 226, column: 25, scope: !1005)
!1016 = !DILocation(line: 227, column: 1, scope: !1000)
!1017 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !723, file: !723, line: 238, type: !1018, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{null, !364, !726, !726}
!1020 = !DILocalVariable(name: "r", arg: 1, scope: !1017, file: !723, line: 238, type: !364)
!1021 = !DILocation(line: 0, scope: !1017)
!1022 = !DILocalVariable(name: "a", arg: 2, scope: !1017, file: !723, line: 238, type: !726)
!1023 = !DILocalVariable(name: "b", arg: 3, scope: !1017, file: !723, line: 238, type: !726)
!1024 = !DILocalVariable(name: "i", scope: !1017, file: !723, line: 239, type: !40)
!1025 = !DILocation(line: 240, column: 8, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1017, file: !723, line: 240, column: 3)
!1027 = !DILocation(line: 240, scope: !1026)
!1028 = !DILocation(line: 240, column: 17, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1026, file: !723, line: 240, column: 3)
!1030 = !DILocation(line: 240, column: 3, scope: !1026)
!1031 = !DILocation(line: 241, column: 15, scope: !1029)
!1032 = !DILocation(line: 241, column: 25, scope: !1029)
!1033 = !DILocation(line: 241, column: 35, scope: !1029)
!1034 = !DILocation(line: 241, column: 5, scope: !1029)
!1035 = !DILocation(line: 240, column: 29, scope: !1029)
!1036 = !DILocation(line: 240, column: 3, scope: !1029)
!1037 = distinct !{!1037, !1030, !1038, !130}
!1038 = !DILocation(line: 241, column: 42, scope: !1026)
!1039 = !DILocation(line: 242, column: 1, scope: !1017)
!1040 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !1041, file: !1041, line: 19, type: !1042, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1041 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1042 = !DISubroutineType(types: !1043)
!1043 = !{null, !32, !1044}
!1044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1045, size: 32)
!1045 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!1046 = !DILocalVariable(name: "r", arg: 1, scope: !1040, file: !1041, line: 19, type: !32)
!1047 = !DILocation(line: 0, scope: !1040)
!1048 = !DILocalVariable(name: "a", arg: 2, scope: !1040, file: !1041, line: 19, type: !1044)
!1049 = !DILocalVariable(name: "t", scope: !1040, file: !1041, line: 23, type: !1050)
!1050 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !1051)
!1051 = !{!1052}
!1052 = !DISubrange(count: 8)
!1053 = !DILocation(line: 23, column: 11, scope: !1040)
!1054 = !DILocalVariable(name: "i", scope: !1040, file: !1041, line: 20, type: !40)
!1055 = !DILocation(line: 27, column: 8, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1040, file: !1041, line: 27, column: 3)
!1057 = !DILocation(line: 27, scope: !1056)
!1058 = !DILocation(line: 27, column: 17, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1056, file: !1041, line: 27, column: 3)
!1060 = !DILocation(line: 27, column: 3, scope: !1056)
!1061 = !DILocation(line: 28, column: 5, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1063, file: !1041, line: 28, column: 5)
!1063 = distinct !DILexicalBlock(scope: !1059, file: !1041, line: 27, column: 37)
!1064 = !DILocation(line: 28, scope: !1062)
!1065 = !DILocalVariable(name: "j", scope: !1040, file: !1041, line: 20, type: !40)
!1066 = !DILocation(line: 28, column: 19, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1062, file: !1041, line: 28, column: 5)
!1068 = !DILocation(line: 30, column: 18, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1067, file: !1041, line: 28, column: 29)
!1070 = !DILocation(line: 30, column: 22, scope: !1069)
!1071 = !DILocation(line: 30, column: 11, scope: !1069)
!1072 = !DILocalVariable(name: "u", scope: !1040, file: !1041, line: 21, type: !61)
!1073 = !DILocation(line: 31, column: 22, scope: !1069)
!1074 = !DILocation(line: 31, column: 9, scope: !1069)
!1075 = !DILocation(line: 33, column: 12, scope: !1069)
!1076 = !DILocalVariable(name: "d0", scope: !1040, file: !1041, line: 22, type: !91)
!1077 = !DILocation(line: 35, column: 10, scope: !1069)
!1078 = !DILocation(line: 36, column: 10, scope: !1069)
!1079 = !DILocation(line: 37, column: 14, scope: !1069)
!1080 = !DILocation(line: 37, column: 7, scope: !1069)
!1081 = !DILocation(line: 37, column: 12, scope: !1069)
!1082 = !DILocation(line: 28, column: 25, scope: !1067)
!1083 = !DILocation(line: 28, column: 5, scope: !1067)
!1084 = distinct !{!1084, !1061, !1085, !130}
!1085 = !DILocation(line: 38, column: 5, scope: !1062)
!1086 = !DILocation(line: 40, column: 12, scope: !1063)
!1087 = !DILocation(line: 40, column: 20, scope: !1063)
!1088 = !DILocation(line: 40, column: 25, scope: !1063)
!1089 = !DILocation(line: 40, column: 17, scope: !1063)
!1090 = !DILocation(line: 40, column: 10, scope: !1063)
!1091 = !DILocation(line: 41, column: 12, scope: !1063)
!1092 = !DILocation(line: 41, column: 20, scope: !1063)
!1093 = !DILocation(line: 41, column: 25, scope: !1063)
!1094 = !DILocation(line: 41, column: 17, scope: !1063)
!1095 = !DILocation(line: 41, column: 5, scope: !1063)
!1096 = !DILocation(line: 41, column: 10, scope: !1063)
!1097 = !DILocation(line: 42, column: 12, scope: !1063)
!1098 = !DILocation(line: 42, column: 20, scope: !1063)
!1099 = !DILocation(line: 42, column: 25, scope: !1063)
!1100 = !DILocation(line: 42, column: 17, scope: !1063)
!1101 = !DILocation(line: 42, column: 5, scope: !1063)
!1102 = !DILocation(line: 42, column: 10, scope: !1063)
!1103 = !DILocation(line: 43, column: 12, scope: !1063)
!1104 = !DILocation(line: 43, column: 20, scope: !1063)
!1105 = !DILocation(line: 43, column: 25, scope: !1063)
!1106 = !DILocation(line: 43, column: 17, scope: !1063)
!1107 = !DILocation(line: 43, column: 5, scope: !1063)
!1108 = !DILocation(line: 43, column: 10, scope: !1063)
!1109 = !DILocation(line: 44, column: 7, scope: !1063)
!1110 = !DILocation(line: 27, column: 33, scope: !1059)
!1111 = !DILocation(line: 27, column: 3, scope: !1059)
!1112 = distinct !{!1112, !1060, !1113, !130}
!1113 = !DILocation(line: 45, column: 3, scope: !1056)
!1114 = !DILocation(line: 70, column: 1, scope: !1040)
!1115 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !1041, file: !1041, line: 82, type: !1116, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{null, !670, !275}
!1118 = !DILocalVariable(name: "r", arg: 1, scope: !1115, file: !1041, line: 82, type: !670)
!1119 = !DILocation(line: 0, scope: !1115)
!1120 = !DILocalVariable(name: "a", arg: 2, scope: !1115, file: !1041, line: 82, type: !275)
!1121 = !DILocalVariable(name: "i", scope: !1115, file: !1041, line: 83, type: !40)
!1122 = !DILocation(line: 86, column: 8, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1115, file: !1041, line: 86, column: 3)
!1124 = !DILocation(line: 86, scope: !1123)
!1125 = !DILocation(line: 86, column: 17, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1123, file: !1041, line: 86, column: 3)
!1127 = !DILocation(line: 86, column: 3, scope: !1123)
!1128 = !DILocation(line: 87, column: 36, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1126, file: !1041, line: 86, column: 37)
!1130 = !DILocation(line: 87, column: 41, scope: !1129)
!1131 = !DILocation(line: 87, column: 25, scope: !1129)
!1132 = !DILocation(line: 87, column: 47, scope: !1129)
!1133 = !DILocation(line: 87, column: 58, scope: !1129)
!1134 = !DILocation(line: 87, column: 63, scope: !1129)
!1135 = !DILocation(line: 87, column: 23, scope: !1129)
!1136 = !DILocation(line: 87, column: 12, scope: !1129)
!1137 = !DILocation(line: 87, column: 5, scope: !1129)
!1138 = !DILocation(line: 87, column: 21, scope: !1129)
!1139 = !DILocation(line: 88, column: 36, scope: !1129)
!1140 = !DILocation(line: 88, column: 41, scope: !1129)
!1141 = !DILocation(line: 88, column: 25, scope: !1129)
!1142 = !DILocation(line: 88, column: 47, scope: !1129)
!1143 = !DILocation(line: 88, column: 58, scope: !1129)
!1144 = !DILocation(line: 88, column: 63, scope: !1129)
!1145 = !DILocation(line: 88, column: 23, scope: !1129)
!1146 = !DILocation(line: 88, column: 12, scope: !1129)
!1147 = !DILocation(line: 88, column: 16, scope: !1129)
!1148 = !DILocation(line: 88, column: 5, scope: !1129)
!1149 = !DILocation(line: 88, column: 21, scope: !1129)
!1150 = !DILocation(line: 89, column: 7, scope: !1129)
!1151 = !DILocation(line: 86, column: 33, scope: !1126)
!1152 = !DILocation(line: 86, column: 3, scope: !1126)
!1153 = distinct !{!1153, !1127, !1154, !130}
!1154 = !DILocation(line: 90, column: 3, scope: !1123)
!1155 = !DILocation(line: 111, column: 1, scope: !1115)
!1156 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !1041, file: !1041, line: 122, type: !1042, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1157 = !DILocalVariable(name: "r", arg: 1, scope: !1156, file: !1041, line: 122, type: !32)
!1158 = !DILocation(line: 0, scope: !1156)
!1159 = !DILocalVariable(name: "a", arg: 2, scope: !1156, file: !1041, line: 122, type: !1044)
!1160 = !DILocalVariable(name: "i", scope: !1156, file: !1041, line: 123, type: !40)
!1161 = !DILocation(line: 126, column: 8, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1156, file: !1041, line: 126, column: 3)
!1163 = !DILocation(line: 126, scope: !1162)
!1164 = !DILocation(line: 126, column: 17, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1162, file: !1041, line: 126, column: 3)
!1166 = !DILocation(line: 126, column: 3, scope: !1162)
!1167 = !DILocation(line: 128, column: 17, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1165, file: !1041, line: 126, column: 37)
!1169 = !DILocation(line: 128, column: 10, scope: !1168)
!1170 = !DILocalVariable(name: "t0", scope: !1156, file: !1041, line: 124, type: !86)
!1171 = !DILocation(line: 129, column: 31, scope: !1168)
!1172 = !DILocation(line: 129, column: 8, scope: !1168)
!1173 = !DILocation(line: 130, column: 17, scope: !1168)
!1174 = !DILocation(line: 130, column: 21, scope: !1168)
!1175 = !DILocation(line: 130, column: 10, scope: !1168)
!1176 = !DILocalVariable(name: "t1", scope: !1156, file: !1041, line: 124, type: !86)
!1177 = !DILocation(line: 131, column: 31, scope: !1168)
!1178 = !DILocation(line: 131, column: 8, scope: !1168)
!1179 = !DILocation(line: 132, column: 20, scope: !1168)
!1180 = !DILocation(line: 132, column: 9, scope: !1168)
!1181 = !DILocation(line: 132, column: 5, scope: !1168)
!1182 = !DILocation(line: 132, column: 18, scope: !1168)
!1183 = !DILocation(line: 133, column: 24, scope: !1168)
!1184 = !DILocation(line: 133, column: 33, scope: !1168)
!1185 = !DILocation(line: 133, column: 36, scope: !1168)
!1186 = !DILocation(line: 133, column: 30, scope: !1168)
!1187 = !DILocation(line: 133, column: 9, scope: !1168)
!1188 = !DILocation(line: 133, column: 5, scope: !1168)
!1189 = !DILocation(line: 133, column: 18, scope: !1168)
!1190 = !DILocation(line: 134, column: 24, scope: !1168)
!1191 = !DILocation(line: 134, column: 20, scope: !1168)
!1192 = !DILocation(line: 134, column: 9, scope: !1168)
!1193 = !DILocation(line: 134, column: 5, scope: !1168)
!1194 = !DILocation(line: 134, column: 18, scope: !1168)
!1195 = !DILocation(line: 126, column: 33, scope: !1165)
!1196 = !DILocation(line: 126, column: 3, scope: !1165)
!1197 = distinct !{!1197, !1166, !1198, !130}
!1198 = !DILocation(line: 135, column: 3, scope: !1162)
!1199 = !DILocation(line: 136, column: 1, scope: !1156)
!1200 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !1041, file: !1041, line: 148, type: !1116, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1201 = !DILocalVariable(name: "r", arg: 1, scope: !1200, file: !1041, line: 148, type: !670)
!1202 = !DILocation(line: 0, scope: !1200)
!1203 = !DILocalVariable(name: "a", arg: 2, scope: !1200, file: !1041, line: 148, type: !275)
!1204 = !DILocalVariable(name: "i", scope: !1200, file: !1041, line: 149, type: !40)
!1205 = !DILocation(line: 150, column: 8, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1200, file: !1041, line: 150, column: 3)
!1207 = !DILocation(line: 150, scope: !1206)
!1208 = !DILocation(line: 150, column: 17, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1206, file: !1041, line: 150, column: 3)
!1210 = !DILocation(line: 150, column: 3, scope: !1206)
!1211 = !DILocation(line: 151, column: 25, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1209, file: !1041, line: 150, column: 37)
!1213 = !DILocation(line: 151, column: 21, scope: !1212)
!1214 = !DILocation(line: 151, column: 57, scope: !1212)
!1215 = !DILocation(line: 151, column: 53, scope: !1212)
!1216 = !DILocation(line: 151, column: 43, scope: !1212)
!1217 = !DILocation(line: 151, column: 66, scope: !1212)
!1218 = !DILocation(line: 151, column: 73, scope: !1212)
!1219 = !DILocation(line: 151, column: 12, scope: !1212)
!1220 = !DILocation(line: 151, column: 5, scope: !1212)
!1221 = !DILocation(line: 151, column: 17, scope: !1212)
!1222 = !DILocation(line: 153, column: 15, scope: !1212)
!1223 = !DILocation(line: 153, column: 11, scope: !1212)
!1224 = !DILocation(line: 153, column: 24, scope: !1212)
!1225 = !DILocation(line: 153, column: 47, scope: !1212)
!1226 = !DILocation(line: 153, column: 43, scope: !1212)
!1227 = !DILocation(line: 153, column: 33, scope: !1212)
!1228 = !DILocation(line: 153, column: 56, scope: !1212)
!1229 = !DILocation(line: 153, column: 30, scope: !1212)
!1230 = !DILocation(line: 152, column: 12, scope: !1212)
!1231 = !DILocation(line: 152, column: 16, scope: !1212)
!1232 = !DILocation(line: 152, column: 5, scope: !1212)
!1233 = !DILocation(line: 152, column: 21, scope: !1212)
!1234 = !DILocation(line: 150, column: 33, scope: !1209)
!1235 = !DILocation(line: 150, column: 3, scope: !1209)
!1236 = distinct !{!1236, !1210, !1237, !130}
!1237 = !DILocation(line: 154, column: 3, scope: !1206)
!1238 = !DILocation(line: 155, column: 1, scope: !1200)
!1239 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !1041, file: !1041, line: 165, type: !1116, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1240 = !DILocalVariable(name: "r", arg: 1, scope: !1239, file: !1041, line: 165, type: !670)
!1241 = !DILocation(line: 0, scope: !1239)
!1242 = !DILocalVariable(name: "msg", arg: 2, scope: !1239, file: !1041, line: 165, type: !275)
!1243 = !DILocalVariable(name: "i", scope: !1239, file: !1041, line: 166, type: !40)
!1244 = !DILocation(line: 172, column: 8, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1239, file: !1041, line: 172, column: 3)
!1246 = !DILocation(line: 172, scope: !1245)
!1247 = !DILocation(line: 172, column: 17, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1245, file: !1041, line: 172, column: 3)
!1249 = !DILocation(line: 172, column: 3, scope: !1245)
!1250 = !DILocation(line: 173, column: 5, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !1041, line: 173, column: 5)
!1252 = distinct !DILexicalBlock(scope: !1248, file: !1041, line: 172, column: 37)
!1253 = !DILocation(line: 173, scope: !1251)
!1254 = !DILocalVariable(name: "j", scope: !1239, file: !1041, line: 166, type: !40)
!1255 = !DILocation(line: 173, column: 19, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1251, file: !1041, line: 173, column: 5)
!1257 = !DILocation(line: 174, column: 14, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1256, file: !1041, line: 173, column: 29)
!1259 = !DILocation(line: 174, column: 18, scope: !1258)
!1260 = !DILocation(line: 174, column: 7, scope: !1258)
!1261 = !DILocation(line: 174, column: 23, scope: !1258)
!1262 = !DILocation(line: 175, column: 23, scope: !1258)
!1263 = !DILocation(line: 175, column: 31, scope: !1258)
!1264 = !DILocation(line: 175, column: 58, scope: !1258)
!1265 = !DILocation(line: 175, column: 65, scope: !1258)
!1266 = !DILocation(line: 175, column: 57, scope: !1258)
!1267 = !DILocation(line: 175, column: 7, scope: !1258)
!1268 = !DILocation(line: 173, column: 25, scope: !1256)
!1269 = !DILocation(line: 173, column: 5, scope: !1256)
!1270 = distinct !{!1270, !1250, !1271, !130}
!1271 = !DILocation(line: 176, column: 5, scope: !1251)
!1272 = !DILocation(line: 172, column: 33, scope: !1248)
!1273 = !DILocation(line: 172, column: 3, scope: !1248)
!1274 = distinct !{!1274, !1249, !1275, !130}
!1275 = !DILocation(line: 177, column: 3, scope: !1245)
!1276 = !DILocation(line: 178, column: 1, scope: !1239)
!1277 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !1041, file: !1041, line: 188, type: !1042, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1278 = !DILocalVariable(name: "msg", arg: 1, scope: !1277, file: !1041, line: 188, type: !32)
!1279 = !DILocation(line: 0, scope: !1277)
!1280 = !DILocalVariable(name: "a", arg: 2, scope: !1277, file: !1041, line: 188, type: !1044)
!1281 = !DILocalVariable(name: "i", scope: !1277, file: !1041, line: 189, type: !40)
!1282 = !DILocation(line: 192, column: 8, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1277, file: !1041, line: 192, column: 3)
!1284 = !DILocation(line: 192, scope: !1283)
!1285 = !DILocation(line: 192, column: 17, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1283, file: !1041, line: 192, column: 3)
!1287 = !DILocation(line: 192, column: 3, scope: !1283)
!1288 = !DILocation(line: 193, column: 5, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1286, file: !1041, line: 192, column: 37)
!1290 = !DILocation(line: 193, column: 12, scope: !1289)
!1291 = !DILocalVariable(name: "j", scope: !1277, file: !1041, line: 189, type: !40)
!1292 = !DILocation(line: 194, column: 10, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1289, file: !1041, line: 194, column: 5)
!1294 = !DILocation(line: 194, scope: !1293)
!1295 = !DILocation(line: 194, column: 19, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1293, file: !1041, line: 194, column: 5)
!1297 = !DILocation(line: 194, column: 5, scope: !1293)
!1298 = !DILocation(line: 195, column: 18, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1296, file: !1041, line: 194, column: 29)
!1300 = !DILocation(line: 195, column: 22, scope: !1299)
!1301 = !DILocation(line: 195, column: 11, scope: !1299)
!1302 = !DILocalVariable(name: "t", scope: !1277, file: !1041, line: 190, type: !91)
!1303 = !DILocation(line: 200, column: 9, scope: !1299)
!1304 = !DILocation(line: 201, column: 9, scope: !1299)
!1305 = !DILocation(line: 202, column: 9, scope: !1299)
!1306 = !DILocation(line: 203, column: 19, scope: !1299)
!1307 = !DILocation(line: 203, column: 7, scope: !1299)
!1308 = !DILocation(line: 203, column: 14, scope: !1299)
!1309 = !DILocation(line: 194, column: 25, scope: !1296)
!1310 = !DILocation(line: 194, column: 5, scope: !1296)
!1311 = distinct !{!1311, !1297, !1312, !130}
!1312 = !DILocation(line: 204, column: 5, scope: !1293)
!1313 = !DILocation(line: 192, column: 33, scope: !1286)
!1314 = !DILocation(line: 192, column: 3, scope: !1286)
!1315 = distinct !{!1315, !1287, !1316, !130}
!1316 = !DILocation(line: 205, column: 3, scope: !1283)
!1317 = !DILocation(line: 206, column: 1, scope: !1277)
!1318 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !1041, file: !1041, line: 220, type: !1319, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{null, !670, !275, !33}
!1321 = !DILocalVariable(name: "r", arg: 1, scope: !1318, file: !1041, line: 220, type: !670)
!1322 = !DILocation(line: 0, scope: !1318)
!1323 = !DILocalVariable(name: "seed", arg: 2, scope: !1318, file: !1041, line: 220, type: !275)
!1324 = !DILocalVariable(name: "nonce", arg: 3, scope: !1318, file: !1041, line: 221, type: !33)
!1325 = !DILocalVariable(name: "buf", scope: !1318, file: !1041, line: 222, type: !1326)
!1326 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1327 = !DILocation(line: 222, column: 11, scope: !1318)
!1328 = !DILocation(line: 223, column: 3, scope: !1318)
!1329 = !DILocation(line: 224, column: 3, scope: !1318)
!1330 = !DILocation(line: 225, column: 1, scope: !1318)
!1331 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !1041, file: !1041, line: 239, type: !1319, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1332 = !DILocalVariable(name: "r", arg: 1, scope: !1331, file: !1041, line: 239, type: !670)
!1333 = !DILocation(line: 0, scope: !1331)
!1334 = !DILocalVariable(name: "seed", arg: 2, scope: !1331, file: !1041, line: 239, type: !275)
!1335 = !DILocalVariable(name: "nonce", arg: 3, scope: !1331, file: !1041, line: 240, type: !33)
!1336 = !DILocalVariable(name: "buf", scope: !1331, file: !1041, line: 241, type: !1326)
!1337 = !DILocation(line: 241, column: 11, scope: !1331)
!1338 = !DILocation(line: 242, column: 3, scope: !1331)
!1339 = !DILocation(line: 243, column: 3, scope: !1331)
!1340 = !DILocation(line: 244, column: 1, scope: !1331)
!1341 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !1041, file: !1041, line: 256, type: !1342, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1342 = !DISubroutineType(types: !1343)
!1343 = !{null, !670}
!1344 = !DILocalVariable(name: "r", arg: 1, scope: !1341, file: !1041, line: 256, type: !670)
!1345 = !DILocation(line: 0, scope: !1341)
!1346 = !DILocation(line: 257, column: 3, scope: !1341)
!1347 = !DILocation(line: 258, column: 3, scope: !1341)
!1348 = !DILocation(line: 259, column: 1, scope: !1341)
!1349 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !1041, file: !1041, line: 314, type: !1342, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1350 = !DILocalVariable(name: "r", arg: 1, scope: !1349, file: !1041, line: 314, type: !670)
!1351 = !DILocation(line: 0, scope: !1349)
!1352 = !DILocalVariable(name: "i", scope: !1349, file: !1041, line: 315, type: !40)
!1353 = !DILocation(line: 316, column: 8, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1349, file: !1041, line: 316, column: 3)
!1355 = !DILocation(line: 316, scope: !1354)
!1356 = !DILocation(line: 316, column: 17, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1354, file: !1041, line: 316, column: 3)
!1358 = !DILocation(line: 316, column: 3, scope: !1354)
!1359 = !DILocation(line: 317, column: 30, scope: !1357)
!1360 = !DILocation(line: 317, column: 15, scope: !1357)
!1361 = !DILocation(line: 317, column: 5, scope: !1357)
!1362 = !DILocation(line: 317, column: 13, scope: !1357)
!1363 = !DILocation(line: 316, column: 29, scope: !1357)
!1364 = !DILocation(line: 316, column: 3, scope: !1357)
!1365 = distinct !{!1365, !1358, !1366, !130}
!1366 = !DILocation(line: 317, column: 37, scope: !1354)
!1367 = !DILocation(line: 318, column: 1, scope: !1349)
!1368 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !1041, file: !1041, line: 271, type: !1342, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1369 = !DILocalVariable(name: "r", arg: 1, scope: !1368, file: !1041, line: 271, type: !670)
!1370 = !DILocation(line: 0, scope: !1368)
!1371 = !DILocation(line: 271, column: 36, scope: !1368)
!1372 = !DILocation(line: 271, column: 48, scope: !1368)
!1373 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !1041, file: !1041, line: 282, type: !1374, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1374 = !DISubroutineType(types: !1375)
!1375 = !{null, !670, !1044, !1044}
!1376 = !DILocalVariable(name: "r", arg: 1, scope: !1373, file: !1041, line: 282, type: !670)
!1377 = !DILocation(line: 0, scope: !1373)
!1378 = !DILocalVariable(name: "a", arg: 2, scope: !1373, file: !1041, line: 282, type: !1044)
!1379 = !DILocalVariable(name: "b", arg: 3, scope: !1373, file: !1041, line: 282, type: !1044)
!1380 = !DILocalVariable(name: "i", scope: !1373, file: !1041, line: 283, type: !40)
!1381 = !DILocation(line: 284, column: 8, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1373, file: !1041, line: 284, column: 3)
!1383 = !DILocation(line: 284, scope: !1382)
!1384 = !DILocation(line: 284, column: 17, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1382, file: !1041, line: 284, column: 3)
!1386 = !DILocation(line: 284, column: 3, scope: !1382)
!1387 = !DILocation(line: 285, column: 21, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1385, file: !1041, line: 284, column: 37)
!1389 = !DILocation(line: 285, column: 14, scope: !1388)
!1390 = !DILocation(line: 285, column: 35, scope: !1388)
!1391 = !DILocation(line: 285, column: 28, scope: !1388)
!1392 = !DILocation(line: 285, column: 49, scope: !1388)
!1393 = !DILocation(line: 285, column: 42, scope: !1388)
!1394 = !DILocation(line: 285, column: 64, scope: !1388)
!1395 = !DILocation(line: 285, column: 55, scope: !1388)
!1396 = !DILocation(line: 285, column: 5, scope: !1388)
!1397 = !DILocation(line: 286, column: 21, scope: !1388)
!1398 = !DILocation(line: 286, column: 25, scope: !1388)
!1399 = !DILocation(line: 286, column: 14, scope: !1388)
!1400 = !DILocation(line: 286, column: 39, scope: !1388)
!1401 = !DILocation(line: 286, column: 43, scope: !1388)
!1402 = !DILocation(line: 286, column: 32, scope: !1388)
!1403 = !DILocation(line: 286, column: 57, scope: !1388)
!1404 = !DILocation(line: 286, column: 61, scope: !1388)
!1405 = !DILocation(line: 286, column: 50, scope: !1388)
!1406 = !DILocation(line: 287, column: 23, scope: !1388)
!1407 = !DILocation(line: 287, column: 14, scope: !1388)
!1408 = !DILocation(line: 287, column: 13, scope: !1388)
!1409 = !DILocation(line: 286, column: 5, scope: !1388)
!1410 = !DILocation(line: 284, column: 33, scope: !1385)
!1411 = !DILocation(line: 284, column: 3, scope: !1385)
!1412 = distinct !{!1412, !1386, !1413, !130}
!1413 = !DILocation(line: 288, column: 3, scope: !1382)
!1414 = !DILocation(line: 289, column: 1, scope: !1373)
!1415 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !1041, file: !1041, line: 299, type: !1342, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1416 = !DILocalVariable(name: "r", arg: 1, scope: !1415, file: !1041, line: 299, type: !670)
!1417 = !DILocation(line: 0, scope: !1415)
!1418 = !DILocalVariable(name: "f", scope: !1415, file: !1041, line: 301, type: !60)
!1419 = !DILocalVariable(name: "i", scope: !1415, file: !1041, line: 300, type: !40)
!1420 = !DILocation(line: 302, column: 8, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1415, file: !1041, line: 302, column: 3)
!1422 = !DILocation(line: 302, scope: !1421)
!1423 = !DILocation(line: 302, column: 17, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1421, file: !1041, line: 302, column: 3)
!1425 = !DILocation(line: 302, column: 3, scope: !1421)
!1426 = !DILocation(line: 303, column: 42, scope: !1424)
!1427 = !DILocation(line: 303, column: 33, scope: !1424)
!1428 = !DILocation(line: 303, column: 50, scope: !1424)
!1429 = !DILocation(line: 303, column: 15, scope: !1424)
!1430 = !DILocation(line: 303, column: 5, scope: !1424)
!1431 = !DILocation(line: 303, column: 13, scope: !1424)
!1432 = !DILocation(line: 302, column: 29, scope: !1424)
!1433 = !DILocation(line: 302, column: 3, scope: !1424)
!1434 = distinct !{!1434, !1425, !1435, !130}
!1435 = !DILocation(line: 303, column: 53, scope: !1421)
!1436 = !DILocation(line: 304, column: 1, scope: !1415)
!1437 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !1041, file: !1041, line: 329, type: !1374, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1438 = !DILocalVariable(name: "r", arg: 1, scope: !1437, file: !1041, line: 329, type: !670)
!1439 = !DILocation(line: 0, scope: !1437)
!1440 = !DILocalVariable(name: "a", arg: 2, scope: !1437, file: !1041, line: 329, type: !1044)
!1441 = !DILocalVariable(name: "b", arg: 3, scope: !1437, file: !1041, line: 329, type: !1044)
!1442 = !DILocalVariable(name: "i", scope: !1437, file: !1041, line: 330, type: !40)
!1443 = !DILocation(line: 331, column: 8, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1437, file: !1041, line: 331, column: 3)
!1445 = !DILocation(line: 331, scope: !1444)
!1446 = !DILocation(line: 331, column: 17, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1444, file: !1041, line: 331, column: 3)
!1448 = !DILocation(line: 331, column: 3, scope: !1444)
!1449 = !DILocation(line: 332, column: 15, scope: !1447)
!1450 = !DILocation(line: 332, column: 25, scope: !1447)
!1451 = !DILocation(line: 332, column: 23, scope: !1447)
!1452 = !DILocation(line: 332, column: 5, scope: !1447)
!1453 = !DILocation(line: 332, column: 13, scope: !1447)
!1454 = !DILocation(line: 331, column: 29, scope: !1447)
!1455 = !DILocation(line: 331, column: 3, scope: !1447)
!1456 = distinct !{!1456, !1448, !1457, !130}
!1457 = !DILocation(line: 332, column: 31, scope: !1444)
!1458 = !DILocation(line: 333, column: 1, scope: !1437)
!1459 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !1041, file: !1041, line: 344, type: !1374, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1460 = !DILocalVariable(name: "r", arg: 1, scope: !1459, file: !1041, line: 344, type: !670)
!1461 = !DILocation(line: 0, scope: !1459)
!1462 = !DILocalVariable(name: "a", arg: 2, scope: !1459, file: !1041, line: 344, type: !1044)
!1463 = !DILocalVariable(name: "b", arg: 3, scope: !1459, file: !1041, line: 344, type: !1044)
!1464 = !DILocalVariable(name: "i", scope: !1459, file: !1041, line: 345, type: !40)
!1465 = !DILocation(line: 346, column: 8, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1459, file: !1041, line: 346, column: 3)
!1467 = !DILocation(line: 346, scope: !1466)
!1468 = !DILocation(line: 346, column: 17, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1466, file: !1041, line: 346, column: 3)
!1470 = !DILocation(line: 346, column: 3, scope: !1466)
!1471 = !DILocation(line: 347, column: 15, scope: !1469)
!1472 = !DILocation(line: 347, column: 25, scope: !1469)
!1473 = !DILocation(line: 347, column: 23, scope: !1469)
!1474 = !DILocation(line: 347, column: 5, scope: !1469)
!1475 = !DILocation(line: 347, column: 13, scope: !1469)
!1476 = !DILocation(line: 346, column: 29, scope: !1469)
!1477 = !DILocation(line: 346, column: 3, scope: !1469)
!1478 = distinct !{!1478, !1470, !1479, !130}
!1479 = !DILocation(line: 347, column: 31, scope: !1466)
!1480 = !DILocation(line: 348, column: 1, scope: !1459)
!1481 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !58, file: !58, line: 80, type: !1482, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{null, !439}
!1484 = !DILocalVariable(name: "r", arg: 1, scope: !1481, file: !58, line: 80, type: !439)
!1485 = !DILocation(line: 0, scope: !1481)
!1486 = !DILocalVariable(name: "k", scope: !1481, file: !58, line: 81, type: !40)
!1487 = !DILocalVariable(name: "len", scope: !1481, file: !58, line: 81, type: !40)
!1488 = !DILocation(line: 85, column: 7, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1481, file: !58, line: 85, column: 3)
!1490 = !DILocation(line: 85, scope: !1489)
!1491 = !DILocation(line: 84, column: 5, scope: !1481)
!1492 = !DILocation(line: 85, column: 22, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1489, file: !58, line: 85, column: 3)
!1494 = !DILocation(line: 85, column: 3, scope: !1489)
!1495 = !DILocation(line: 86, column: 5, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1497, file: !58, line: 86, column: 5)
!1497 = distinct !DILexicalBlock(scope: !1493, file: !58, line: 85, column: 39)
!1498 = !DILocation(line: 86, scope: !1496)
!1499 = !DILocalVariable(name: "start", scope: !1481, file: !58, line: 81, type: !40)
!1500 = !DILocation(line: 86, column: 26, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1496, file: !58, line: 86, column: 5)
!1502 = !DILocation(line: 87, column: 14, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1501, file: !58, line: 86, column: 50)
!1504 = !DILocalVariable(name: "zeta", scope: !1481, file: !58, line: 82, type: !61)
!1505 = !DILocalVariable(name: "j", scope: !1481, file: !58, line: 81, type: !40)
!1506 = !DILocation(line: 88, column: 11, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1503, file: !58, line: 88, column: 7)
!1508 = !DILocation(line: 88, scope: !1507)
!1509 = !DILocation(line: 88, column: 32, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1507, file: !58, line: 88, column: 7)
!1511 = !DILocation(line: 88, column: 24, scope: !1510)
!1512 = !DILocation(line: 88, column: 7, scope: !1507)
!1513 = !DILocation(line: 89, column: 25, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1510, file: !58, line: 88, column: 44)
!1515 = !DILocation(line: 89, column: 13, scope: !1514)
!1516 = !DILocalVariable(name: "t", scope: !1481, file: !58, line: 82, type: !61)
!1517 = !DILocation(line: 90, column: 22, scope: !1514)
!1518 = !DILocation(line: 90, column: 27, scope: !1514)
!1519 = !DILocation(line: 90, column: 9, scope: !1514)
!1520 = !DILocation(line: 90, column: 20, scope: !1514)
!1521 = !DILocation(line: 91, column: 16, scope: !1514)
!1522 = !DILocation(line: 91, column: 21, scope: !1514)
!1523 = !DILocation(line: 91, column: 9, scope: !1514)
!1524 = !DILocation(line: 91, column: 14, scope: !1514)
!1525 = !DILocation(line: 88, column: 40, scope: !1510)
!1526 = !DILocation(line: 88, column: 7, scope: !1510)
!1527 = distinct !{!1527, !1512, !1528, !130}
!1528 = !DILocation(line: 92, column: 7, scope: !1507)
!1529 = !DILocation(line: 87, column: 21, scope: !1503)
!1530 = !DILocation(line: 86, column: 43, scope: !1501)
!1531 = !DILocation(line: 86, column: 5, scope: !1501)
!1532 = distinct !{!1532, !1495, !1533, !130}
!1533 = !DILocation(line: 93, column: 5, scope: !1496)
!1534 = !DILocation(line: 85, column: 32, scope: !1493)
!1535 = !DILocation(line: 85, column: 3, scope: !1493)
!1536 = distinct !{!1536, !1494, !1537, !130}
!1537 = !DILocation(line: 94, column: 3, scope: !1489)
!1538 = !DILocation(line: 95, column: 1, scope: !1481)
!1539 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1540, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!61, !61, !61}
!1542 = !DILocalVariable(name: "a", arg: 1, scope: !1539, file: !58, line: 68, type: !61)
!1543 = !DILocation(line: 0, scope: !1539)
!1544 = !DILocalVariable(name: "b", arg: 2, scope: !1539, file: !58, line: 68, type: !61)
!1545 = !DILocation(line: 69, column: 28, scope: !1539)
!1546 = !DILocation(line: 69, column: 39, scope: !1539)
!1547 = !DILocation(line: 69, column: 38, scope: !1539)
!1548 = !DILocation(line: 69, column: 10, scope: !1539)
!1549 = !DILocation(line: 69, column: 3, scope: !1539)
!1550 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !58, file: !58, line: 106, type: !1482, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1551 = !DILocalVariable(name: "r", arg: 1, scope: !1550, file: !58, line: 106, type: !439)
!1552 = !DILocation(line: 0, scope: !1550)
!1553 = !DILocalVariable(name: "f", scope: !1550, file: !58, line: 109, type: !60)
!1554 = !DILocalVariable(name: "k", scope: !1550, file: !58, line: 107, type: !40)
!1555 = !DILocalVariable(name: "len", scope: !1550, file: !58, line: 107, type: !40)
!1556 = !DILocation(line: 112, column: 7, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1550, file: !58, line: 112, column: 3)
!1558 = !DILocation(line: 112, scope: !1557)
!1559 = !DILocation(line: 111, column: 5, scope: !1550)
!1560 = !DILocation(line: 112, column: 20, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1557, file: !58, line: 112, column: 3)
!1562 = !DILocation(line: 112, column: 3, scope: !1557)
!1563 = !DILocation(line: 113, column: 5, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1565, file: !58, line: 113, column: 5)
!1565 = distinct !DILexicalBlock(scope: !1561, file: !58, line: 112, column: 39)
!1566 = !DILocation(line: 124, column: 3, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1550, file: !58, line: 124, column: 3)
!1568 = !DILocation(line: 113, scope: !1564)
!1569 = !DILocalVariable(name: "start", scope: !1550, file: !58, line: 107, type: !40)
!1570 = !DILocation(line: 113, column: 26, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1564, file: !58, line: 113, column: 5)
!1572 = !DILocation(line: 114, column: 14, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1571, file: !58, line: 113, column: 50)
!1574 = !DILocalVariable(name: "zeta", scope: !1550, file: !58, line: 108, type: !61)
!1575 = !DILocalVariable(name: "j", scope: !1550, file: !58, line: 107, type: !40)
!1576 = !DILocation(line: 115, column: 11, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1573, file: !58, line: 115, column: 7)
!1578 = !DILocation(line: 115, scope: !1577)
!1579 = !DILocation(line: 115, column: 32, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1577, file: !58, line: 115, column: 7)
!1581 = !DILocation(line: 115, column: 24, scope: !1580)
!1582 = !DILocation(line: 115, column: 7, scope: !1577)
!1583 = !DILocation(line: 116, column: 13, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1580, file: !58, line: 115, column: 44)
!1585 = !DILocalVariable(name: "t", scope: !1550, file: !58, line: 108, type: !61)
!1586 = !DILocation(line: 117, column: 35, scope: !1584)
!1587 = !DILocation(line: 117, column: 33, scope: !1584)
!1588 = !DILocation(line: 117, column: 16, scope: !1584)
!1589 = !DILocation(line: 117, column: 9, scope: !1584)
!1590 = !DILocation(line: 117, column: 14, scope: !1584)
!1591 = !DILocation(line: 118, column: 22, scope: !1584)
!1592 = !DILocation(line: 118, column: 33, scope: !1584)
!1593 = !DILocation(line: 118, column: 9, scope: !1584)
!1594 = !DILocation(line: 118, column: 20, scope: !1584)
!1595 = !DILocation(line: 119, column: 34, scope: !1584)
!1596 = !DILocation(line: 119, column: 22, scope: !1584)
!1597 = !DILocation(line: 119, column: 9, scope: !1584)
!1598 = !DILocation(line: 119, column: 20, scope: !1584)
!1599 = !DILocation(line: 115, column: 40, scope: !1580)
!1600 = !DILocation(line: 115, column: 7, scope: !1580)
!1601 = distinct !{!1601, !1582, !1602, !130}
!1602 = !DILocation(line: 120, column: 7, scope: !1577)
!1603 = !DILocation(line: 114, column: 21, scope: !1573)
!1604 = !DILocation(line: 113, column: 43, scope: !1571)
!1605 = !DILocation(line: 113, column: 5, scope: !1571)
!1606 = distinct !{!1606, !1563, !1607, !130}
!1607 = !DILocation(line: 121, column: 5, scope: !1564)
!1608 = !DILocation(line: 112, column: 32, scope: !1561)
!1609 = !DILocation(line: 112, column: 3, scope: !1561)
!1610 = distinct !{!1610, !1562, !1611, !130}
!1611 = !DILocation(line: 122, column: 3, scope: !1557)
!1612 = !DILocation(line: 124, scope: !1567)
!1613 = !DILocation(line: 124, column: 16, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1567, file: !58, line: 124, column: 3)
!1615 = !DILocation(line: 125, column: 18, scope: !1614)
!1616 = !DILocation(line: 125, column: 12, scope: !1614)
!1617 = !DILocation(line: 125, column: 5, scope: !1614)
!1618 = !DILocation(line: 125, column: 10, scope: !1614)
!1619 = !DILocation(line: 124, column: 24, scope: !1614)
!1620 = !DILocation(line: 124, column: 3, scope: !1614)
!1621 = distinct !{!1621, !1566, !1622, !130}
!1622 = !DILocation(line: 125, column: 25, scope: !1567)
!1623 = !DILocation(line: 126, column: 1, scope: !1550)
!1624 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !58, file: !58, line: 139, type: !1625, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1625 = !DISubroutineType(types: !1626)
!1626 = !{null, !439, !1627, !1627, !61}
!1627 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1628 = !DILocalVariable(name: "r", arg: 1, scope: !1624, file: !58, line: 139, type: !439)
!1629 = !DILocation(line: 0, scope: !1624)
!1630 = !DILocalVariable(name: "a", arg: 2, scope: !1624, file: !58, line: 139, type: !1627)
!1631 = !DILocalVariable(name: "b", arg: 3, scope: !1624, file: !58, line: 139, type: !1627)
!1632 = !DILocalVariable(name: "zeta", arg: 4, scope: !1624, file: !58, line: 139, type: !61)
!1633 = !DILocation(line: 141, column: 17, scope: !1624)
!1634 = !DILocation(line: 141, column: 23, scope: !1624)
!1635 = !DILocation(line: 141, column: 11, scope: !1624)
!1636 = !DILocation(line: 141, column: 9, scope: !1624)
!1637 = !DILocation(line: 142, column: 11, scope: !1624)
!1638 = !DILocation(line: 142, column: 9, scope: !1624)
!1639 = !DILocation(line: 143, column: 17, scope: !1624)
!1640 = !DILocation(line: 143, column: 23, scope: !1624)
!1641 = !DILocation(line: 143, column: 11, scope: !1624)
!1642 = !DILocation(line: 143, column: 8, scope: !1624)
!1643 = !DILocation(line: 144, column: 17, scope: !1624)
!1644 = !DILocation(line: 144, column: 23, scope: !1624)
!1645 = !DILocation(line: 144, column: 11, scope: !1624)
!1646 = !DILocation(line: 144, column: 3, scope: !1624)
!1647 = !DILocation(line: 144, column: 9, scope: !1624)
!1648 = !DILocation(line: 145, column: 17, scope: !1624)
!1649 = !DILocation(line: 145, column: 23, scope: !1624)
!1650 = !DILocation(line: 145, column: 11, scope: !1624)
!1651 = !DILocation(line: 145, column: 3, scope: !1624)
!1652 = !DILocation(line: 145, column: 8, scope: !1624)
!1653 = !DILocation(line: 146, column: 1, scope: !1624)
!1654 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1655, file: !1655, line: 105, type: !1116, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1655 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1656 = !DILocalVariable(name: "r", arg: 1, scope: !1654, file: !1655, line: 105, type: !670)
!1657 = !DILocation(line: 0, scope: !1654)
!1658 = !DILocalVariable(name: "buf", arg: 2, scope: !1654, file: !1655, line: 105, type: !275)
!1659 = !DILocation(line: 107, column: 3, scope: !1654)
!1660 = !DILocation(line: 113, column: 1, scope: !1654)
!1661 = distinct !DISubprogram(name: "cbd2", scope: !1655, file: !1655, line: 55, type: !1116, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1662 = !DILocalVariable(name: "r", arg: 1, scope: !1661, file: !1655, line: 55, type: !670)
!1663 = !DILocation(line: 0, scope: !1661)
!1664 = !DILocalVariable(name: "buf", arg: 2, scope: !1661, file: !1655, line: 55, type: !275)
!1665 = !DILocalVariable(name: "i", scope: !1661, file: !1655, line: 56, type: !40)
!1666 = !DILocation(line: 60, column: 8, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1661, file: !1655, line: 60, column: 3)
!1668 = !DILocation(line: 60, scope: !1667)
!1669 = !DILocation(line: 60, column: 17, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1667, file: !1655, line: 60, column: 3)
!1671 = !DILocation(line: 60, column: 3, scope: !1667)
!1672 = !DILocation(line: 61, column: 37, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1670, file: !1655, line: 60, column: 37)
!1674 = !DILocation(line: 61, column: 33, scope: !1673)
!1675 = !DILocation(line: 61, column: 9, scope: !1673)
!1676 = !DILocalVariable(name: "t", scope: !1661, file: !1655, line: 57, type: !91)
!1677 = !DILocation(line: 62, column: 11, scope: !1673)
!1678 = !DILocalVariable(name: "d", scope: !1661, file: !1655, line: 57, type: !91)
!1679 = !DILocation(line: 63, column: 13, scope: !1673)
!1680 = !DILocation(line: 63, column: 19, scope: !1673)
!1681 = !DILocation(line: 63, column: 7, scope: !1673)
!1682 = !DILocalVariable(name: "j", scope: !1661, file: !1655, line: 56, type: !40)
!1683 = !DILocation(line: 65, column: 10, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1673, file: !1655, line: 65, column: 5)
!1685 = !DILocation(line: 65, scope: !1684)
!1686 = !DILocation(line: 65, column: 19, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1684, file: !1655, line: 65, column: 5)
!1688 = !DILocation(line: 65, column: 5, scope: !1684)
!1689 = !DILocation(line: 66, column: 20, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1687, file: !1655, line: 65, column: 29)
!1691 = !DILocation(line: 66, column: 14, scope: !1690)
!1692 = !DILocation(line: 66, column: 11, scope: !1690)
!1693 = !DILocalVariable(name: "a", scope: !1661, file: !1655, line: 58, type: !61)
!1694 = !DILocation(line: 67, column: 20, scope: !1690)
!1695 = !DILocation(line: 67, column: 24, scope: !1690)
!1696 = !DILocation(line: 67, column: 14, scope: !1690)
!1697 = !DILocation(line: 67, column: 11, scope: !1690)
!1698 = !DILocalVariable(name: "b", scope: !1661, file: !1655, line: 58, type: !61)
!1699 = !DILocation(line: 68, column: 27, scope: !1690)
!1700 = !DILocation(line: 68, column: 25, scope: !1690)
!1701 = !DILocation(line: 68, column: 14, scope: !1690)
!1702 = !DILocation(line: 68, column: 18, scope: !1690)
!1703 = !DILocation(line: 68, column: 7, scope: !1690)
!1704 = !DILocation(line: 68, column: 23, scope: !1690)
!1705 = !DILocation(line: 65, column: 25, scope: !1687)
!1706 = !DILocation(line: 65, column: 5, scope: !1687)
!1707 = distinct !{!1707, !1688, !1708, !130}
!1708 = !DILocation(line: 69, column: 5, scope: !1684)
!1709 = !DILocation(line: 60, column: 33, scope: !1670)
!1710 = !DILocation(line: 60, column: 3, scope: !1670)
!1711 = distinct !{!1711, !1671, !1712, !130}
!1712 = !DILocation(line: 70, column: 3, scope: !1667)
!1713 = !DILocation(line: 71, column: 1, scope: !1661)
!1714 = distinct !DISubprogram(name: "load32_littleendian", scope: !1655, file: !1655, line: 15, type: !1715, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!91, !275}
!1717 = !DILocalVariable(name: "x", arg: 1, scope: !1714, file: !1655, line: 15, type: !275)
!1718 = !DILocation(line: 0, scope: !1714)
!1719 = !DILocation(line: 17, column: 17, scope: !1714)
!1720 = !DILocation(line: 17, column: 7, scope: !1714)
!1721 = !DILocalVariable(name: "r", scope: !1714, file: !1655, line: 16, type: !91)
!1722 = !DILocation(line: 18, column: 18, scope: !1714)
!1723 = !DILocation(line: 18, column: 8, scope: !1714)
!1724 = !DILocation(line: 18, column: 23, scope: !1714)
!1725 = !DILocation(line: 18, column: 5, scope: !1714)
!1726 = !DILocation(line: 19, column: 18, scope: !1714)
!1727 = !DILocation(line: 19, column: 8, scope: !1714)
!1728 = !DILocation(line: 19, column: 23, scope: !1714)
!1729 = !DILocation(line: 19, column: 5, scope: !1714)
!1730 = !DILocation(line: 20, column: 18, scope: !1714)
!1731 = !DILocation(line: 20, column: 8, scope: !1714)
!1732 = !DILocation(line: 20, column: 23, scope: !1714)
!1733 = !DILocation(line: 20, column: 5, scope: !1714)
!1734 = !DILocation(line: 21, column: 3, scope: !1714)
!1735 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1655, file: !1655, line: 115, type: !1116, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1736 = !DILocalVariable(name: "r", arg: 1, scope: !1735, file: !1655, line: 115, type: !670)
!1737 = !DILocation(line: 0, scope: !1735)
!1738 = !DILocalVariable(name: "buf", arg: 2, scope: !1735, file: !1655, line: 115, type: !275)
!1739 = !DILocation(line: 117, column: 3, scope: !1735)
!1740 = !DILocation(line: 121, column: 1, scope: !1735)
!1741 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1742, file: !1742, line: 16, type: !1743, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1742 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1743 = !DISubroutineType(types: !98)
!1744 = !DILocalVariable(name: "a", arg: 1, scope: !1741, file: !1742, line: 16, type: !55)
!1745 = !DILocation(line: 0, scope: !1741)
!1746 = !DILocalVariable(name: "t", scope: !1741, file: !1742, line: 18, type: !61)
!1747 = !DILocation(line: 21, column: 12, scope: !1741)
!1748 = !DILocation(line: 21, column: 22, scope: !1741)
!1749 = !DILocation(line: 21, column: 10, scope: !1741)
!1750 = !DILocation(line: 21, column: 32, scope: !1741)
!1751 = !DILocation(line: 21, column: 7, scope: !1741)
!1752 = !DILocation(line: 22, column: 3, scope: !1741)
!1753 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1742, file: !1742, line: 35, type: !1754, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1754 = !DISubroutineType(types: !1755)
!1755 = !{!61, !61}
!1756 = !DILocalVariable(name: "a", arg: 1, scope: !1753, file: !1742, line: 35, type: !61)
!1757 = !DILocation(line: 0, scope: !1753)
!1758 = !DILocalVariable(name: "v", scope: !1753, file: !1742, line: 37, type: !60)
!1759 = !DILocation(line: 39, column: 20, scope: !1753)
!1760 = !DILocation(line: 39, column: 19, scope: !1753)
!1761 = !DILocation(line: 39, column: 22, scope: !1753)
!1762 = !DILocation(line: 39, column: 33, scope: !1753)
!1763 = !DILocalVariable(name: "t", scope: !1753, file: !1742, line: 36, type: !61)
!1764 = !DILocation(line: 41, column: 10, scope: !1753)
!1765 = !DILocation(line: 41, column: 3, scope: !1753)
!1766 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1767, file: !1767, line: 16, type: !1768, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1767 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1768 = !DISubroutineType(types: !1769)
!1769 = !{!50, !275, !275, !38}
!1770 = !DILocalVariable(name: "a", arg: 1, scope: !1766, file: !1767, line: 16, type: !275)
!1771 = !DILocation(line: 0, scope: !1766)
!1772 = !DILocalVariable(name: "b", arg: 2, scope: !1766, file: !1767, line: 16, type: !275)
!1773 = !DILocalVariable(name: "len", arg: 3, scope: !1766, file: !1767, line: 16, type: !38)
!1774 = !DILocalVariable(name: "r", scope: !1766, file: !1767, line: 19, type: !33)
!1775 = !DILocalVariable(name: "i", scope: !1766, file: !1767, line: 18, type: !38)
!1776 = !DILocation(line: 21, column: 7, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1766, file: !1767, line: 21, column: 3)
!1778 = !DILocation(line: 21, scope: !1777)
!1779 = !DILocation(line: 21, column: 12, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1777, file: !1767, line: 21, column: 3)
!1781 = !DILocation(line: 21, column: 3, scope: !1777)
!1782 = !DILocation(line: 22, column: 10, scope: !1780)
!1783 = !DILocation(line: 22, column: 17, scope: !1780)
!1784 = !DILocation(line: 22, column: 15, scope: !1780)
!1785 = !DILocation(line: 22, column: 7, scope: !1780)
!1786 = !DILocation(line: 21, column: 18, scope: !1780)
!1787 = !DILocation(line: 21, column: 3, scope: !1780)
!1788 = distinct !{!1788, !1781, !1789, !130}
!1789 = !DILocation(line: 22, column: 20, scope: !1777)
!1790 = !DILocation(line: 24, column: 25, scope: !1766)
!1791 = !DILocation(line: 24, column: 10, scope: !1766)
!1792 = !DILocation(line: 24, column: 3, scope: !1766)
!1793 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1767, file: !1767, line: 40, type: !1794, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1794 = !DISubroutineType(types: !1795)
!1795 = !{null, !32, !275, !38, !33}
!1796 = !DILocalVariable(name: "r", arg: 1, scope: !1793, file: !1767, line: 40, type: !32)
!1797 = !DILocation(line: 0, scope: !1793)
!1798 = !DILocalVariable(name: "x", arg: 2, scope: !1793, file: !1767, line: 40, type: !275)
!1799 = !DILocalVariable(name: "len", arg: 3, scope: !1793, file: !1767, line: 40, type: !38)
!1800 = !DILocalVariable(name: "b", arg: 4, scope: !1793, file: !1767, line: 40, type: !33)
!1801 = !DILocation(line: 51, column: 3, scope: !1793)
!1802 = !{i64 1722}
!1803 = !DILocation(line: 54, column: 7, scope: !1793)
!1804 = !DILocalVariable(name: "i", scope: !1793, file: !1767, line: 42, type: !38)
!1805 = !DILocation(line: 55, column: 7, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1793, file: !1767, line: 55, column: 3)
!1807 = !DILocation(line: 55, scope: !1806)
!1808 = !DILocation(line: 55, column: 12, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1806, file: !1767, line: 55, column: 3)
!1810 = !DILocation(line: 55, column: 3, scope: !1806)
!1811 = !DILocation(line: 56, column: 18, scope: !1809)
!1812 = !DILocation(line: 56, column: 25, scope: !1809)
!1813 = !DILocation(line: 56, column: 23, scope: !1809)
!1814 = !DILocation(line: 56, column: 15, scope: !1809)
!1815 = !DILocation(line: 56, column: 5, scope: !1809)
!1816 = !DILocation(line: 56, column: 10, scope: !1809)
!1817 = !DILocation(line: 55, column: 18, scope: !1809)
!1818 = !DILocation(line: 55, column: 3, scope: !1809)
!1819 = distinct !{!1819, !1810, !1820, !130}
!1820 = !DILocation(line: 56, column: 29, scope: !1806)
!1821 = !DILocation(line: 57, column: 1, scope: !1793)
!1822 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1767, file: !1767, line: 71, type: !1823, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1823 = !DISubroutineType(types: !1824)
!1824 = !{null, !439, !61, !86}
!1825 = !DILocalVariable(name: "r", arg: 1, scope: !1822, file: !1767, line: 71, type: !439)
!1826 = !DILocation(line: 0, scope: !1822)
!1827 = !DILocalVariable(name: "v", arg: 2, scope: !1822, file: !1767, line: 71, type: !61)
!1828 = !DILocalVariable(name: "b", arg: 3, scope: !1822, file: !1767, line: 71, type: !86)
!1829 = !DILocation(line: 73, column: 7, scope: !1822)
!1830 = !DILocation(line: 74, column: 15, scope: !1822)
!1831 = !DILocation(line: 74, column: 19, scope: !1822)
!1832 = !DILocation(line: 74, column: 11, scope: !1822)
!1833 = !DILocation(line: 74, column: 6, scope: !1822)
!1834 = !DILocation(line: 75, column: 1, scope: !1822)
!1835 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 497, type: !1836, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1836 = !DISubroutineType(types: !1837)
!1837 = !{null, !1838}
!1838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 32)
!1839 = !DILocalVariable(name: "state", arg: 1, scope: !1835, file: !74, line: 497, type: !1838)
!1840 = !DILocation(line: 0, scope: !1835)
!1841 = !DILocation(line: 498, column: 3, scope: !1835)
!1842 = !DILocation(line: 499, column: 3, scope: !1835)
!1843 = !DILocation(line: 499, column: 29, scope: !1835)
!1844 = !DILocation(line: 500, column: 1, scope: !1835)
!1845 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 340, type: !1846, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1846 = !DISubroutineType(types: !1847)
!1847 = !{null, !1848}
!1848 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!1849 = !DILocalVariable(name: "s", arg: 1, scope: !1845, file: !74, line: 340, type: !1848)
!1850 = !DILocation(line: 0, scope: !1845)
!1851 = !DILocalVariable(name: "i", scope: !1845, file: !74, line: 341, type: !40)
!1852 = !DILocation(line: 342, column: 8, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1845, file: !74, line: 342, column: 3)
!1854 = !DILocation(line: 342, scope: !1853)
!1855 = !DILocation(line: 342, column: 17, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1853, file: !74, line: 342, column: 3)
!1857 = !DILocation(line: 342, column: 3, scope: !1853)
!1858 = !DILocation(line: 343, column: 5, scope: !1856)
!1859 = !DILocation(line: 343, column: 10, scope: !1856)
!1860 = !DILocation(line: 342, column: 24, scope: !1856)
!1861 = !DILocation(line: 342, column: 3, scope: !1856)
!1862 = distinct !{!1862, !1857, !1863, !130}
!1863 = !DILocation(line: 343, column: 12, scope: !1853)
!1864 = !DILocation(line: 344, column: 1, scope: !1845)
!1865 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 512, type: !1866, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1866 = !DISubroutineType(types: !1867)
!1867 = !{null, !1838, !275, !38}
!1868 = !DILocalVariable(name: "state", arg: 1, scope: !1865, file: !74, line: 512, type: !1838)
!1869 = !DILocation(line: 0, scope: !1865)
!1870 = !DILocalVariable(name: "in", arg: 2, scope: !1865, file: !74, line: 512, type: !275)
!1871 = !DILocalVariable(name: "inlen", arg: 3, scope: !1865, file: !74, line: 512, type: !38)
!1872 = !DILocation(line: 513, column: 53, scope: !1865)
!1873 = !DILocation(line: 513, column: 31, scope: !1865)
!1874 = !DILocation(line: 513, column: 3, scope: !1865)
!1875 = !DILocation(line: 513, column: 29, scope: !1865)
!1876 = !DILocation(line: 515, column: 1, scope: !1865)
!1877 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 359, type: !1878, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1878 = !DISubroutineType(types: !1879)
!1879 = !{!40, !1848, !40, !40, !275, !38}
!1880 = !DILocalVariable(name: "s", arg: 1, scope: !1877, file: !74, line: 359, type: !1848)
!1881 = !DILocation(line: 0, scope: !1877)
!1882 = !DILocalVariable(name: "pos", arg: 2, scope: !1877, file: !74, line: 359, type: !40)
!1883 = !DILocalVariable(name: "r", arg: 3, scope: !1877, file: !74, line: 360, type: !40)
!1884 = !DILocalVariable(name: "in", arg: 4, scope: !1877, file: !74, line: 360, type: !275)
!1885 = !DILocalVariable(name: "inlen", arg: 5, scope: !1877, file: !74, line: 361, type: !38)
!1886 = !DILocation(line: 364, column: 3, scope: !1877)
!1887 = !DILocation(line: 364, column: 14, scope: !1877)
!1888 = !DILocation(line: 364, column: 22, scope: !1877)
!1889 = !DILocation(line: 365, column: 5, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1891, file: !74, line: 365, column: 5)
!1891 = distinct !DILexicalBlock(scope: !1877, file: !74, line: 364, column: 28)
!1892 = !DILocation(line: 372, column: 3, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1877, file: !74, line: 372, column: 3)
!1894 = !DILocation(line: 365, scope: !1890)
!1895 = !DILocalVariable(name: "i", scope: !1877, file: !74, line: 362, type: !40)
!1896 = !DILocation(line: 365, column: 21, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1890, file: !74, line: 365, column: 5)
!1898 = !DILocation(line: 366, column: 29, scope: !1897)
!1899 = !DILocation(line: 366, column: 19, scope: !1897)
!1900 = !DILocation(line: 366, column: 40, scope: !1897)
!1901 = !DILocation(line: 366, column: 35, scope: !1897)
!1902 = !DILocation(line: 366, column: 11, scope: !1897)
!1903 = !DILocation(line: 366, column: 7, scope: !1897)
!1904 = !DILocation(line: 366, column: 16, scope: !1897)
!1905 = !DILocation(line: 366, column: 32, scope: !1897)
!1906 = !DILocation(line: 365, column: 27, scope: !1897)
!1907 = !DILocation(line: 365, column: 5, scope: !1897)
!1908 = distinct !{!1908, !1889, !1909, !130}
!1909 = !DILocation(line: 366, column: 48, scope: !1890)
!1910 = !DILocation(line: 367, column: 16, scope: !1891)
!1911 = !DILocation(line: 367, column: 11, scope: !1891)
!1912 = !DILocation(line: 368, column: 5, scope: !1891)
!1913 = distinct !{!1913, !1886, !1914, !130}
!1914 = !DILocation(line: 370, column: 3, scope: !1877)
!1915 = !DILocation(line: 372, scope: !1893)
!1916 = !DILocation(line: 372, column: 25, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1893, file: !74, line: 372, column: 3)
!1918 = !DILocation(line: 372, column: 19, scope: !1917)
!1919 = !DILocation(line: 373, column: 27, scope: !1917)
!1920 = !DILocation(line: 373, column: 17, scope: !1917)
!1921 = !DILocation(line: 373, column: 38, scope: !1917)
!1922 = !DILocation(line: 373, column: 33, scope: !1917)
!1923 = !DILocation(line: 373, column: 9, scope: !1917)
!1924 = !DILocation(line: 373, column: 5, scope: !1917)
!1925 = !DILocation(line: 373, column: 14, scope: !1917)
!1926 = !DILocation(line: 373, column: 30, scope: !1917)
!1927 = !DILocation(line: 372, column: 35, scope: !1917)
!1928 = !DILocation(line: 372, column: 3, scope: !1917)
!1929 = distinct !{!1929, !1892, !1930, !130}
!1930 = !DILocation(line: 373, column: 46, scope: !1893)
!1931 = !DILocation(line: 375, column: 3, scope: !1877)
!1932 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 70, type: !1846, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1933 = !DILocalVariable(name: "state", arg: 1, scope: !1932, file: !74, line: 70, type: !1848)
!1934 = !DILocation(line: 0, scope: !1932)
!1935 = !DILocation(line: 87, column: 9, scope: !1932)
!1936 = !DILocalVariable(name: "Aba", scope: !1932, file: !74, line: 73, type: !70)
!1937 = !DILocation(line: 88, column: 9, scope: !1932)
!1938 = !DILocalVariable(name: "Abe", scope: !1932, file: !74, line: 73, type: !70)
!1939 = !DILocation(line: 89, column: 9, scope: !1932)
!1940 = !DILocalVariable(name: "Abi", scope: !1932, file: !74, line: 73, type: !70)
!1941 = !DILocation(line: 90, column: 9, scope: !1932)
!1942 = !DILocalVariable(name: "Abo", scope: !1932, file: !74, line: 73, type: !70)
!1943 = !DILocation(line: 91, column: 9, scope: !1932)
!1944 = !DILocalVariable(name: "Abu", scope: !1932, file: !74, line: 73, type: !70)
!1945 = !DILocation(line: 92, column: 9, scope: !1932)
!1946 = !DILocalVariable(name: "Aga", scope: !1932, file: !74, line: 74, type: !70)
!1947 = !DILocation(line: 93, column: 9, scope: !1932)
!1948 = !DILocalVariable(name: "Age", scope: !1932, file: !74, line: 74, type: !70)
!1949 = !DILocation(line: 94, column: 9, scope: !1932)
!1950 = !DILocalVariable(name: "Agi", scope: !1932, file: !74, line: 74, type: !70)
!1951 = !DILocation(line: 95, column: 9, scope: !1932)
!1952 = !DILocalVariable(name: "Ago", scope: !1932, file: !74, line: 74, type: !70)
!1953 = !DILocation(line: 96, column: 9, scope: !1932)
!1954 = !DILocalVariable(name: "Agu", scope: !1932, file: !74, line: 74, type: !70)
!1955 = !DILocation(line: 97, column: 9, scope: !1932)
!1956 = !DILocalVariable(name: "Aka", scope: !1932, file: !74, line: 75, type: !70)
!1957 = !DILocation(line: 98, column: 9, scope: !1932)
!1958 = !DILocalVariable(name: "Ake", scope: !1932, file: !74, line: 75, type: !70)
!1959 = !DILocation(line: 99, column: 9, scope: !1932)
!1960 = !DILocalVariable(name: "Aki", scope: !1932, file: !74, line: 75, type: !70)
!1961 = !DILocation(line: 100, column: 9, scope: !1932)
!1962 = !DILocalVariable(name: "Ako", scope: !1932, file: !74, line: 75, type: !70)
!1963 = !DILocation(line: 101, column: 9, scope: !1932)
!1964 = !DILocalVariable(name: "Aku", scope: !1932, file: !74, line: 75, type: !70)
!1965 = !DILocation(line: 102, column: 9, scope: !1932)
!1966 = !DILocalVariable(name: "Ama", scope: !1932, file: !74, line: 76, type: !70)
!1967 = !DILocation(line: 103, column: 9, scope: !1932)
!1968 = !DILocalVariable(name: "Ame", scope: !1932, file: !74, line: 76, type: !70)
!1969 = !DILocation(line: 104, column: 9, scope: !1932)
!1970 = !DILocalVariable(name: "Ami", scope: !1932, file: !74, line: 76, type: !70)
!1971 = !DILocation(line: 105, column: 9, scope: !1932)
!1972 = !DILocalVariable(name: "Amo", scope: !1932, file: !74, line: 76, type: !70)
!1973 = !DILocation(line: 106, column: 9, scope: !1932)
!1974 = !DILocalVariable(name: "Amu", scope: !1932, file: !74, line: 76, type: !70)
!1975 = !DILocation(line: 107, column: 9, scope: !1932)
!1976 = !DILocalVariable(name: "Asa", scope: !1932, file: !74, line: 77, type: !70)
!1977 = !DILocation(line: 108, column: 9, scope: !1932)
!1978 = !DILocalVariable(name: "Ase", scope: !1932, file: !74, line: 77, type: !70)
!1979 = !DILocation(line: 109, column: 9, scope: !1932)
!1980 = !DILocalVariable(name: "Asi", scope: !1932, file: !74, line: 77, type: !70)
!1981 = !DILocation(line: 110, column: 9, scope: !1932)
!1982 = !DILocalVariable(name: "Aso", scope: !1932, file: !74, line: 77, type: !70)
!1983 = !DILocation(line: 111, column: 9, scope: !1932)
!1984 = !DILocalVariable(name: "Asu", scope: !1932, file: !74, line: 77, type: !70)
!1985 = !DILocalVariable(name: "round", scope: !1932, file: !74, line: 71, type: !50)
!1986 = !DILocation(line: 113, column: 8, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1932, file: !74, line: 113, column: 3)
!1988 = !DILocation(line: 113, scope: !1987)
!1989 = !DILocation(line: 113, column: 25, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1987, file: !74, line: 113, column: 3)
!1991 = !DILocation(line: 113, column: 3, scope: !1987)
!1992 = !DILocalVariable(name: "BCa", scope: !1932, file: !74, line: 78, type: !70)
!1993 = !DILocalVariable(name: "BCe", scope: !1932, file: !74, line: 78, type: !70)
!1994 = !DILocalVariable(name: "BCi", scope: !1932, file: !74, line: 78, type: !70)
!1995 = !DILocalVariable(name: "BCo", scope: !1932, file: !74, line: 78, type: !70)
!1996 = !DILocalVariable(name: "BCu", scope: !1932, file: !74, line: 78, type: !70)
!1997 = !DILocalVariable(name: "Da", scope: !1932, file: !74, line: 79, type: !70)
!1998 = !DILocalVariable(name: "De", scope: !1932, file: !74, line: 79, type: !70)
!1999 = !DILocalVariable(name: "Di", scope: !1932, file: !74, line: 79, type: !70)
!2000 = !DILocalVariable(name: "Do", scope: !1932, file: !74, line: 79, type: !70)
!2001 = !DILocalVariable(name: "Du", scope: !1932, file: !74, line: 79, type: !70)
!2002 = !DILocalVariable(name: "Eba", scope: !1932, file: !74, line: 80, type: !70)
!2003 = !DILocalVariable(name: "Ebe", scope: !1932, file: !74, line: 80, type: !70)
!2004 = !DILocalVariable(name: "Ebi", scope: !1932, file: !74, line: 80, type: !70)
!2005 = !DILocalVariable(name: "Ebo", scope: !1932, file: !74, line: 80, type: !70)
!2006 = !DILocalVariable(name: "Ebu", scope: !1932, file: !74, line: 80, type: !70)
!2007 = !DILocalVariable(name: "Ega", scope: !1932, file: !74, line: 81, type: !70)
!2008 = !DILocalVariable(name: "Ege", scope: !1932, file: !74, line: 81, type: !70)
!2009 = !DILocalVariable(name: "Egi", scope: !1932, file: !74, line: 81, type: !70)
!2010 = !DILocalVariable(name: "Ego", scope: !1932, file: !74, line: 81, type: !70)
!2011 = !DILocalVariable(name: "Egu", scope: !1932, file: !74, line: 81, type: !70)
!2012 = !DILocalVariable(name: "Eka", scope: !1932, file: !74, line: 82, type: !70)
!2013 = !DILocalVariable(name: "Eke", scope: !1932, file: !74, line: 82, type: !70)
!2014 = !DILocalVariable(name: "Eki", scope: !1932, file: !74, line: 82, type: !70)
!2015 = !DILocalVariable(name: "Eko", scope: !1932, file: !74, line: 82, type: !70)
!2016 = !DILocalVariable(name: "Eku", scope: !1932, file: !74, line: 82, type: !70)
!2017 = !DILocalVariable(name: "Ema", scope: !1932, file: !74, line: 83, type: !70)
!2018 = !DILocalVariable(name: "Eme", scope: !1932, file: !74, line: 83, type: !70)
!2019 = !DILocalVariable(name: "Emi", scope: !1932, file: !74, line: 83, type: !70)
!2020 = !DILocalVariable(name: "Emo", scope: !1932, file: !74, line: 83, type: !70)
!2021 = !DILocalVariable(name: "Emu", scope: !1932, file: !74, line: 83, type: !70)
!2022 = !DILocalVariable(name: "Esa", scope: !1932, file: !74, line: 84, type: !70)
!2023 = !DILocalVariable(name: "Ese", scope: !1932, file: !74, line: 84, type: !70)
!2024 = !DILocalVariable(name: "Esi", scope: !1932, file: !74, line: 84, type: !70)
!2025 = !DILocalVariable(name: "Eso", scope: !1932, file: !74, line: 84, type: !70)
!2026 = !DILocalVariable(name: "Esu", scope: !1932, file: !74, line: 84, type: !70)
!2027 = !DILocation(line: 117, column: 15, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !1990, file: !74, line: 113, column: 48)
!2029 = !DILocation(line: 117, column: 21, scope: !2028)
!2030 = !DILocation(line: 117, column: 27, scope: !2028)
!2031 = !DILocation(line: 117, column: 33, scope: !2028)
!2032 = !DILocation(line: 119, column: 15, scope: !2028)
!2033 = !DILocation(line: 119, column: 21, scope: !2028)
!2034 = !DILocation(line: 119, column: 27, scope: !2028)
!2035 = !DILocation(line: 119, column: 33, scope: !2028)
!2036 = !DILocation(line: 125, column: 16, scope: !2028)
!2037 = !DILocation(line: 125, column: 14, scope: !2028)
!2038 = !DILocation(line: 195, column: 9, scope: !2028)
!2039 = !DILocation(line: 196, column: 11, scope: !2028)
!2040 = !DILocation(line: 116, column: 15, scope: !2028)
!2041 = !DILocation(line: 116, column: 21, scope: !2028)
!2042 = !DILocation(line: 116, column: 27, scope: !2028)
!2043 = !DILocation(line: 116, column: 33, scope: !2028)
!2044 = !DILocation(line: 122, column: 16, scope: !2028)
!2045 = !DILocation(line: 122, column: 14, scope: !2028)
!2046 = !DILocation(line: 199, column: 9, scope: !2028)
!2047 = !DILocation(line: 200, column: 11, scope: !2028)
!2048 = !DILocation(line: 118, column: 15, scope: !2028)
!2049 = !DILocation(line: 118, column: 21, scope: !2028)
!2050 = !DILocation(line: 118, column: 27, scope: !2028)
!2051 = !DILocation(line: 118, column: 33, scope: !2028)
!2052 = !DILocation(line: 115, column: 15, scope: !2028)
!2053 = !DILocation(line: 115, column: 21, scope: !2028)
!2054 = !DILocation(line: 115, column: 27, scope: !2028)
!2055 = !DILocation(line: 115, column: 33, scope: !2028)
!2056 = !DILocation(line: 126, column: 16, scope: !2028)
!2057 = !DILocation(line: 126, column: 14, scope: !2028)
!2058 = !DILocation(line: 197, column: 9, scope: !2028)
!2059 = !DILocation(line: 198, column: 11, scope: !2028)
!2060 = !DILocation(line: 204, column: 19, scope: !2028)
!2061 = !DILocation(line: 204, column: 25, scope: !2028)
!2062 = !DILocation(line: 204, column: 15, scope: !2028)
!2063 = !DILocation(line: 124, column: 16, scope: !2028)
!2064 = !DILocation(line: 124, column: 14, scope: !2028)
!2065 = !DILocation(line: 132, column: 9, scope: !2028)
!2066 = !DILocation(line: 133, column: 11, scope: !2028)
!2067 = !DILocation(line: 123, column: 16, scope: !2028)
!2068 = !DILocation(line: 123, column: 14, scope: !2028)
!2069 = !DILocation(line: 130, column: 9, scope: !2028)
!2070 = !DILocation(line: 131, column: 11, scope: !2028)
!2071 = !DILocation(line: 138, column: 19, scope: !2028)
!2072 = !DILocation(line: 138, column: 25, scope: !2028)
!2073 = !DILocation(line: 139, column: 22, scope: !2028)
!2074 = !DILocation(line: 139, column: 9, scope: !2028)
!2075 = !DILocation(line: 128, column: 9, scope: !2028)
!2076 = !DILocation(line: 145, column: 9, scope: !2028)
!2077 = !DILocation(line: 146, column: 11, scope: !2028)
!2078 = !DILocation(line: 149, column: 9, scope: !2028)
!2079 = !DILocation(line: 150, column: 11, scope: !2028)
!2080 = !DILocation(line: 147, column: 9, scope: !2028)
!2081 = !DILocation(line: 148, column: 11, scope: !2028)
!2082 = !DILocation(line: 155, column: 19, scope: !2028)
!2083 = !DILocation(line: 155, column: 25, scope: !2028)
!2084 = !DILocation(line: 155, column: 15, scope: !2028)
!2085 = !DILocation(line: 210, column: 15, scope: !2028)
!2086 = !DILocation(line: 161, column: 9, scope: !2028)
!2087 = !DILocation(line: 162, column: 11, scope: !2028)
!2088 = !DILocation(line: 165, column: 9, scope: !2028)
!2089 = !DILocation(line: 166, column: 11, scope: !2028)
!2090 = !DILocation(line: 163, column: 9, scope: !2028)
!2091 = !DILocation(line: 164, column: 11, scope: !2028)
!2092 = !DILocation(line: 171, column: 19, scope: !2028)
!2093 = !DILocation(line: 171, column: 25, scope: !2028)
!2094 = !DILocation(line: 171, column: 15, scope: !2028)
!2095 = !DILocation(line: 210, column: 21, scope: !2028)
!2096 = !DILocation(line: 177, column: 9, scope: !2028)
!2097 = !DILocation(line: 178, column: 11, scope: !2028)
!2098 = !DILocation(line: 181, column: 9, scope: !2028)
!2099 = !DILocation(line: 182, column: 11, scope: !2028)
!2100 = !DILocation(line: 179, column: 9, scope: !2028)
!2101 = !DILocation(line: 180, column: 11, scope: !2028)
!2102 = !DILocation(line: 187, column: 19, scope: !2028)
!2103 = !DILocation(line: 187, column: 25, scope: !2028)
!2104 = !DILocation(line: 187, column: 15, scope: !2028)
!2105 = !DILocation(line: 210, column: 27, scope: !2028)
!2106 = !DILocation(line: 193, column: 9, scope: !2028)
!2107 = !DILocation(line: 194, column: 11, scope: !2028)
!2108 = !DILocation(line: 203, column: 19, scope: !2028)
!2109 = !DILocation(line: 203, column: 25, scope: !2028)
!2110 = !DILocation(line: 203, column: 15, scope: !2028)
!2111 = !DILocation(line: 210, column: 33, scope: !2028)
!2112 = !DILocation(line: 136, column: 9, scope: !2028)
!2113 = !DILocation(line: 137, column: 11, scope: !2028)
!2114 = !DILocation(line: 134, column: 9, scope: !2028)
!2115 = !DILocation(line: 135, column: 11, scope: !2028)
!2116 = !DILocation(line: 141, column: 19, scope: !2028)
!2117 = !DILocation(line: 141, column: 25, scope: !2028)
!2118 = !DILocation(line: 141, column: 15, scope: !2028)
!2119 = !DILocation(line: 153, column: 9, scope: !2028)
!2120 = !DILocation(line: 154, column: 11, scope: !2028)
!2121 = !DILocation(line: 151, column: 9, scope: !2028)
!2122 = !DILocation(line: 152, column: 11, scope: !2028)
!2123 = !DILocation(line: 157, column: 19, scope: !2028)
!2124 = !DILocation(line: 157, column: 25, scope: !2028)
!2125 = !DILocation(line: 157, column: 15, scope: !2028)
!2126 = !DILocation(line: 212, column: 15, scope: !2028)
!2127 = !DILocation(line: 169, column: 9, scope: !2028)
!2128 = !DILocation(line: 170, column: 11, scope: !2028)
!2129 = !DILocation(line: 167, column: 9, scope: !2028)
!2130 = !DILocation(line: 168, column: 11, scope: !2028)
!2131 = !DILocation(line: 173, column: 19, scope: !2028)
!2132 = !DILocation(line: 173, column: 25, scope: !2028)
!2133 = !DILocation(line: 173, column: 15, scope: !2028)
!2134 = !DILocation(line: 212, column: 21, scope: !2028)
!2135 = !DILocation(line: 185, column: 9, scope: !2028)
!2136 = !DILocation(line: 186, column: 11, scope: !2028)
!2137 = !DILocation(line: 183, column: 9, scope: !2028)
!2138 = !DILocation(line: 184, column: 11, scope: !2028)
!2139 = !DILocation(line: 189, column: 19, scope: !2028)
!2140 = !DILocation(line: 189, column: 25, scope: !2028)
!2141 = !DILocation(line: 189, column: 15, scope: !2028)
!2142 = !DILocation(line: 212, column: 27, scope: !2028)
!2143 = !DILocation(line: 201, column: 9, scope: !2028)
!2144 = !DILocation(line: 202, column: 11, scope: !2028)
!2145 = !DILocation(line: 205, column: 19, scope: !2028)
!2146 = !DILocation(line: 205, column: 25, scope: !2028)
!2147 = !DILocation(line: 205, column: 15, scope: !2028)
!2148 = !DILocation(line: 212, column: 33, scope: !2028)
!2149 = !DILocation(line: 218, column: 16, scope: !2028)
!2150 = !DILocation(line: 218, column: 14, scope: !2028)
!2151 = !DILocation(line: 296, column: 9, scope: !2028)
!2152 = !DILocation(line: 297, column: 11, scope: !2028)
!2153 = !DILocation(line: 158, column: 19, scope: !2028)
!2154 = !DILocation(line: 158, column: 25, scope: !2028)
!2155 = !DILocation(line: 158, column: 15, scope: !2028)
!2156 = !DILocation(line: 143, column: 19, scope: !2028)
!2157 = !DILocation(line: 143, column: 25, scope: !2028)
!2158 = !DILocation(line: 143, column: 15, scope: !2028)
!2159 = !DILocation(line: 159, column: 19, scope: !2028)
!2160 = !DILocation(line: 159, column: 25, scope: !2028)
!2161 = !DILocation(line: 159, column: 15, scope: !2028)
!2162 = !DILocation(line: 214, column: 15, scope: !2028)
!2163 = !DILocation(line: 175, column: 19, scope: !2028)
!2164 = !DILocation(line: 175, column: 25, scope: !2028)
!2165 = !DILocation(line: 175, column: 15, scope: !2028)
!2166 = !DILocation(line: 214, column: 21, scope: !2028)
!2167 = !DILocation(line: 191, column: 19, scope: !2028)
!2168 = !DILocation(line: 191, column: 25, scope: !2028)
!2169 = !DILocation(line: 191, column: 15, scope: !2028)
!2170 = !DILocation(line: 214, column: 27, scope: !2028)
!2171 = !DILocation(line: 207, column: 19, scope: !2028)
!2172 = !DILocation(line: 207, column: 25, scope: !2028)
!2173 = !DILocation(line: 207, column: 15, scope: !2028)
!2174 = !DILocation(line: 214, column: 33, scope: !2028)
!2175 = !DILocation(line: 220, column: 16, scope: !2028)
!2176 = !DILocation(line: 220, column: 14, scope: !2028)
!2177 = !DILocation(line: 290, column: 9, scope: !2028)
!2178 = !DILocation(line: 291, column: 11, scope: !2028)
!2179 = !DILocation(line: 140, column: 19, scope: !2028)
!2180 = !DILocation(line: 140, column: 25, scope: !2028)
!2181 = !DILocation(line: 140, column: 15, scope: !2028)
!2182 = !DILocation(line: 156, column: 19, scope: !2028)
!2183 = !DILocation(line: 156, column: 25, scope: !2028)
!2184 = !DILocation(line: 156, column: 15, scope: !2028)
!2185 = !DILocation(line: 211, column: 15, scope: !2028)
!2186 = !DILocation(line: 172, column: 19, scope: !2028)
!2187 = !DILocation(line: 172, column: 25, scope: !2028)
!2188 = !DILocation(line: 172, column: 15, scope: !2028)
!2189 = !DILocation(line: 211, column: 21, scope: !2028)
!2190 = !DILocation(line: 188, column: 19, scope: !2028)
!2191 = !DILocation(line: 188, column: 25, scope: !2028)
!2192 = !DILocation(line: 188, column: 15, scope: !2028)
!2193 = !DILocation(line: 211, column: 27, scope: !2028)
!2194 = !DILocation(line: 211, column: 33, scope: !2028)
!2195 = !DILocation(line: 142, column: 19, scope: !2028)
!2196 = !DILocation(line: 142, column: 25, scope: !2028)
!2197 = !DILocation(line: 142, column: 15, scope: !2028)
!2198 = !DILocation(line: 213, column: 15, scope: !2028)
!2199 = !DILocation(line: 174, column: 19, scope: !2028)
!2200 = !DILocation(line: 174, column: 25, scope: !2028)
!2201 = !DILocation(line: 174, column: 15, scope: !2028)
!2202 = !DILocation(line: 213, column: 21, scope: !2028)
!2203 = !DILocation(line: 190, column: 19, scope: !2028)
!2204 = !DILocation(line: 190, column: 25, scope: !2028)
!2205 = !DILocation(line: 190, column: 15, scope: !2028)
!2206 = !DILocation(line: 213, column: 27, scope: !2028)
!2207 = !DILocation(line: 206, column: 19, scope: !2028)
!2208 = !DILocation(line: 206, column: 25, scope: !2028)
!2209 = !DILocation(line: 206, column: 15, scope: !2028)
!2210 = !DILocation(line: 213, column: 33, scope: !2028)
!2211 = !DILocation(line: 219, column: 16, scope: !2028)
!2212 = !DILocation(line: 219, column: 14, scope: !2028)
!2213 = !DILocation(line: 288, column: 9, scope: !2028)
!2214 = !DILocation(line: 289, column: 11, scope: !2028)
!2215 = !DILocation(line: 302, column: 19, scope: !2028)
!2216 = !DILocation(line: 302, column: 25, scope: !2028)
!2217 = !DILocation(line: 302, column: 15, scope: !2028)
!2218 = !DILocation(line: 217, column: 16, scope: !2028)
!2219 = !DILocation(line: 217, column: 14, scope: !2028)
!2220 = !DILocation(line: 294, column: 9, scope: !2028)
!2221 = !DILocation(line: 295, column: 11, scope: !2028)
!2222 = !DILocation(line: 301, column: 19, scope: !2028)
!2223 = !DILocation(line: 301, column: 25, scope: !2028)
!2224 = !DILocation(line: 301, column: 15, scope: !2028)
!2225 = !DILocation(line: 221, column: 16, scope: !2028)
!2226 = !DILocation(line: 221, column: 14, scope: !2028)
!2227 = !DILocation(line: 292, column: 9, scope: !2028)
!2228 = !DILocation(line: 293, column: 11, scope: !2028)
!2229 = !DILocation(line: 300, column: 19, scope: !2028)
!2230 = !DILocation(line: 300, column: 25, scope: !2028)
!2231 = !DILocation(line: 300, column: 15, scope: !2028)
!2232 = !DILocation(line: 299, column: 19, scope: !2028)
!2233 = !DILocation(line: 299, column: 25, scope: !2028)
!2234 = !DILocation(line: 299, column: 15, scope: !2028)
!2235 = !DILocation(line: 298, column: 19, scope: !2028)
!2236 = !DILocation(line: 298, column: 25, scope: !2028)
!2237 = !DILocation(line: 298, column: 15, scope: !2028)
!2238 = !DILocation(line: 280, column: 9, scope: !2028)
!2239 = !DILocation(line: 281, column: 11, scope: !2028)
!2240 = !DILocation(line: 274, column: 9, scope: !2028)
!2241 = !DILocation(line: 275, column: 11, scope: !2028)
!2242 = !DILocation(line: 272, column: 9, scope: !2028)
!2243 = !DILocation(line: 273, column: 11, scope: !2028)
!2244 = !DILocation(line: 286, column: 19, scope: !2028)
!2245 = !DILocation(line: 286, column: 25, scope: !2028)
!2246 = !DILocation(line: 286, column: 15, scope: !2028)
!2247 = !DILocation(line: 278, column: 9, scope: !2028)
!2248 = !DILocation(line: 279, column: 11, scope: !2028)
!2249 = !DILocation(line: 285, column: 19, scope: !2028)
!2250 = !DILocation(line: 285, column: 25, scope: !2028)
!2251 = !DILocation(line: 285, column: 15, scope: !2028)
!2252 = !DILocation(line: 276, column: 9, scope: !2028)
!2253 = !DILocation(line: 277, column: 11, scope: !2028)
!2254 = !DILocation(line: 284, column: 19, scope: !2028)
!2255 = !DILocation(line: 284, column: 25, scope: !2028)
!2256 = !DILocation(line: 284, column: 15, scope: !2028)
!2257 = !DILocation(line: 283, column: 19, scope: !2028)
!2258 = !DILocation(line: 283, column: 25, scope: !2028)
!2259 = !DILocation(line: 283, column: 15, scope: !2028)
!2260 = !DILocation(line: 282, column: 19, scope: !2028)
!2261 = !DILocation(line: 282, column: 25, scope: !2028)
!2262 = !DILocation(line: 282, column: 15, scope: !2028)
!2263 = !DILocation(line: 264, column: 9, scope: !2028)
!2264 = !DILocation(line: 265, column: 11, scope: !2028)
!2265 = !DILocation(line: 258, column: 9, scope: !2028)
!2266 = !DILocation(line: 259, column: 11, scope: !2028)
!2267 = !DILocation(line: 256, column: 9, scope: !2028)
!2268 = !DILocation(line: 257, column: 11, scope: !2028)
!2269 = !DILocation(line: 270, column: 19, scope: !2028)
!2270 = !DILocation(line: 270, column: 25, scope: !2028)
!2271 = !DILocation(line: 270, column: 15, scope: !2028)
!2272 = !DILocation(line: 262, column: 9, scope: !2028)
!2273 = !DILocation(line: 263, column: 11, scope: !2028)
!2274 = !DILocation(line: 269, column: 19, scope: !2028)
!2275 = !DILocation(line: 269, column: 25, scope: !2028)
!2276 = !DILocation(line: 269, column: 15, scope: !2028)
!2277 = !DILocation(line: 260, column: 9, scope: !2028)
!2278 = !DILocation(line: 261, column: 11, scope: !2028)
!2279 = !DILocation(line: 268, column: 19, scope: !2028)
!2280 = !DILocation(line: 268, column: 25, scope: !2028)
!2281 = !DILocation(line: 268, column: 15, scope: !2028)
!2282 = !DILocation(line: 267, column: 19, scope: !2028)
!2283 = !DILocation(line: 267, column: 25, scope: !2028)
!2284 = !DILocation(line: 267, column: 15, scope: !2028)
!2285 = !DILocation(line: 266, column: 19, scope: !2028)
!2286 = !DILocation(line: 266, column: 25, scope: !2028)
!2287 = !DILocation(line: 266, column: 15, scope: !2028)
!2288 = !DILocation(line: 248, column: 9, scope: !2028)
!2289 = !DILocation(line: 249, column: 11, scope: !2028)
!2290 = !DILocation(line: 242, column: 9, scope: !2028)
!2291 = !DILocation(line: 243, column: 11, scope: !2028)
!2292 = !DILocation(line: 240, column: 9, scope: !2028)
!2293 = !DILocation(line: 241, column: 11, scope: !2028)
!2294 = !DILocation(line: 254, column: 19, scope: !2028)
!2295 = !DILocation(line: 254, column: 25, scope: !2028)
!2296 = !DILocation(line: 254, column: 15, scope: !2028)
!2297 = !DILocation(line: 246, column: 9, scope: !2028)
!2298 = !DILocation(line: 247, column: 11, scope: !2028)
!2299 = !DILocation(line: 253, column: 19, scope: !2028)
!2300 = !DILocation(line: 253, column: 25, scope: !2028)
!2301 = !DILocation(line: 253, column: 15, scope: !2028)
!2302 = !DILocation(line: 244, column: 9, scope: !2028)
!2303 = !DILocation(line: 245, column: 11, scope: !2028)
!2304 = !DILocation(line: 252, column: 19, scope: !2028)
!2305 = !DILocation(line: 252, column: 25, scope: !2028)
!2306 = !DILocation(line: 252, column: 15, scope: !2028)
!2307 = !DILocation(line: 251, column: 19, scope: !2028)
!2308 = !DILocation(line: 251, column: 25, scope: !2028)
!2309 = !DILocation(line: 251, column: 15, scope: !2028)
!2310 = !DILocation(line: 250, column: 19, scope: !2028)
!2311 = !DILocation(line: 250, column: 25, scope: !2028)
!2312 = !DILocation(line: 250, column: 15, scope: !2028)
!2313 = !DILocation(line: 231, column: 9, scope: !2028)
!2314 = !DILocation(line: 232, column: 11, scope: !2028)
!2315 = !DILocation(line: 225, column: 9, scope: !2028)
!2316 = !DILocation(line: 226, column: 11, scope: !2028)
!2317 = !DILocation(line: 223, column: 9, scope: !2028)
!2318 = !DILocation(line: 238, column: 19, scope: !2028)
!2319 = !DILocation(line: 238, column: 25, scope: !2028)
!2320 = !DILocation(line: 238, column: 15, scope: !2028)
!2321 = !DILocation(line: 229, column: 9, scope: !2028)
!2322 = !DILocation(line: 230, column: 11, scope: !2028)
!2323 = !DILocation(line: 237, column: 19, scope: !2028)
!2324 = !DILocation(line: 237, column: 25, scope: !2028)
!2325 = !DILocation(line: 237, column: 15, scope: !2028)
!2326 = !DILocation(line: 227, column: 9, scope: !2028)
!2327 = !DILocation(line: 228, column: 11, scope: !2028)
!2328 = !DILocation(line: 236, column: 19, scope: !2028)
!2329 = !DILocation(line: 236, column: 25, scope: !2028)
!2330 = !DILocation(line: 236, column: 15, scope: !2028)
!2331 = !DILocation(line: 235, column: 19, scope: !2028)
!2332 = !DILocation(line: 235, column: 25, scope: !2028)
!2333 = !DILocation(line: 235, column: 15, scope: !2028)
!2334 = !DILocation(line: 234, column: 51, scope: !2028)
!2335 = !DILocation(line: 234, column: 22, scope: !2028)
!2336 = !DILocation(line: 233, column: 19, scope: !2028)
!2337 = !DILocation(line: 233, column: 25, scope: !2028)
!2338 = !DILocation(line: 234, column: 9, scope: !2028)
!2339 = !DILocation(line: 113, column: 42, scope: !1990)
!2340 = !DILocation(line: 113, column: 3, scope: !1990)
!2341 = distinct !{!2341, !1991, !2342, !130}
!2342 = !DILocation(line: 303, column: 3, scope: !1987)
!2343 = !DILocation(line: 306, column: 12, scope: !1932)
!2344 = !DILocation(line: 307, column: 3, scope: !1932)
!2345 = !DILocation(line: 307, column: 12, scope: !1932)
!2346 = !DILocation(line: 308, column: 3, scope: !1932)
!2347 = !DILocation(line: 308, column: 12, scope: !1932)
!2348 = !DILocation(line: 309, column: 3, scope: !1932)
!2349 = !DILocation(line: 309, column: 12, scope: !1932)
!2350 = !DILocation(line: 310, column: 3, scope: !1932)
!2351 = !DILocation(line: 310, column: 12, scope: !1932)
!2352 = !DILocation(line: 311, column: 3, scope: !1932)
!2353 = !DILocation(line: 311, column: 12, scope: !1932)
!2354 = !DILocation(line: 312, column: 3, scope: !1932)
!2355 = !DILocation(line: 312, column: 12, scope: !1932)
!2356 = !DILocation(line: 313, column: 3, scope: !1932)
!2357 = !DILocation(line: 313, column: 12, scope: !1932)
!2358 = !DILocation(line: 314, column: 3, scope: !1932)
!2359 = !DILocation(line: 314, column: 12, scope: !1932)
!2360 = !DILocation(line: 315, column: 3, scope: !1932)
!2361 = !DILocation(line: 315, column: 12, scope: !1932)
!2362 = !DILocation(line: 316, column: 3, scope: !1932)
!2363 = !DILocation(line: 316, column: 13, scope: !1932)
!2364 = !DILocation(line: 317, column: 3, scope: !1932)
!2365 = !DILocation(line: 317, column: 13, scope: !1932)
!2366 = !DILocation(line: 318, column: 3, scope: !1932)
!2367 = !DILocation(line: 318, column: 13, scope: !1932)
!2368 = !DILocation(line: 319, column: 3, scope: !1932)
!2369 = !DILocation(line: 319, column: 13, scope: !1932)
!2370 = !DILocation(line: 320, column: 3, scope: !1932)
!2371 = !DILocation(line: 320, column: 13, scope: !1932)
!2372 = !DILocation(line: 321, column: 3, scope: !1932)
!2373 = !DILocation(line: 321, column: 13, scope: !1932)
!2374 = !DILocation(line: 322, column: 3, scope: !1932)
!2375 = !DILocation(line: 322, column: 13, scope: !1932)
!2376 = !DILocation(line: 323, column: 3, scope: !1932)
!2377 = !DILocation(line: 323, column: 13, scope: !1932)
!2378 = !DILocation(line: 324, column: 3, scope: !1932)
!2379 = !DILocation(line: 324, column: 13, scope: !1932)
!2380 = !DILocation(line: 325, column: 3, scope: !1932)
!2381 = !DILocation(line: 325, column: 13, scope: !1932)
!2382 = !DILocation(line: 326, column: 3, scope: !1932)
!2383 = !DILocation(line: 326, column: 13, scope: !1932)
!2384 = !DILocation(line: 327, column: 3, scope: !1932)
!2385 = !DILocation(line: 327, column: 13, scope: !1932)
!2386 = !DILocation(line: 328, column: 3, scope: !1932)
!2387 = !DILocation(line: 328, column: 13, scope: !1932)
!2388 = !DILocation(line: 329, column: 3, scope: !1932)
!2389 = !DILocation(line: 329, column: 13, scope: !1932)
!2390 = !DILocation(line: 330, column: 3, scope: !1932)
!2391 = !DILocation(line: 330, column: 13, scope: !1932)
!2392 = !DILocation(line: 331, column: 1, scope: !1932)
!2393 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 524, type: !1836, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2394 = !DILocalVariable(name: "state", arg: 1, scope: !2393, file: !74, line: 524, type: !1838)
!2395 = !DILocation(line: 0, scope: !2393)
!2396 = !DILocation(line: 525, column: 27, scope: !2393)
!2397 = !DILocation(line: 525, column: 3, scope: !2393)
!2398 = !DILocation(line: 526, column: 3, scope: !2393)
!2399 = !DILocation(line: 526, column: 29, scope: !2393)
!2400 = !DILocation(line: 527, column: 1, scope: !2393)
!2401 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 388, type: !2402, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2402 = !DISubroutineType(types: !2403)
!2403 = !{null, !1848, !40, !40, !33}
!2404 = !DILocalVariable(name: "s", arg: 1, scope: !2401, file: !74, line: 388, type: !1848)
!2405 = !DILocation(line: 0, scope: !2401)
!2406 = !DILocalVariable(name: "pos", arg: 2, scope: !2401, file: !74, line: 388, type: !40)
!2407 = !DILocalVariable(name: "r", arg: 3, scope: !2401, file: !74, line: 388, type: !40)
!2408 = !DILocalVariable(name: "p", arg: 4, scope: !2401, file: !74, line: 389, type: !33)
!2409 = !DILocation(line: 390, column: 34, scope: !2401)
!2410 = !DILocation(line: 390, column: 29, scope: !2401)
!2411 = !DILocation(line: 390, column: 9, scope: !2401)
!2412 = !DILocation(line: 390, column: 3, scope: !2401)
!2413 = !DILocation(line: 390, column: 14, scope: !2401)
!2414 = !DILocation(line: 391, column: 7, scope: !2401)
!2415 = !DILocation(line: 391, column: 3, scope: !2401)
!2416 = !DILocation(line: 391, column: 16, scope: !2401)
!2417 = !DILocation(line: 392, column: 1, scope: !2401)
!2418 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 540, type: !2419, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2419 = !DISubroutineType(types: !2420)
!2420 = !{null, !32, !38, !1838}
!2421 = !DILocalVariable(name: "out", arg: 1, scope: !2418, file: !74, line: 540, type: !32)
!2422 = !DILocation(line: 0, scope: !2418)
!2423 = !DILocalVariable(name: "outlen", arg: 2, scope: !2418, file: !74, line: 540, type: !38)
!2424 = !DILocalVariable(name: "state", arg: 3, scope: !2418, file: !74, line: 540, type: !1838)
!2425 = !DILocation(line: 542, column: 28, scope: !2418)
!2426 = !DILocation(line: 541, column: 31, scope: !2418)
!2427 = !DILocation(line: 541, column: 3, scope: !2418)
!2428 = !DILocation(line: 541, column: 29, scope: !2418)
!2429 = !DILocation(line: 543, column: 1, scope: !2418)
!2430 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 410, type: !2431, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2431 = !DISubroutineType(types: !2432)
!2432 = !{!40, !32, !38, !1848, !40, !40}
!2433 = !DILocalVariable(name: "out", arg: 1, scope: !2430, file: !74, line: 410, type: !32)
!2434 = !DILocation(line: 0, scope: !2430)
!2435 = !DILocalVariable(name: "outlen", arg: 2, scope: !2430, file: !74, line: 410, type: !38)
!2436 = !DILocalVariable(name: "s", arg: 3, scope: !2430, file: !74, line: 410, type: !1848)
!2437 = !DILocalVariable(name: "pos", arg: 4, scope: !2430, file: !74, line: 411, type: !40)
!2438 = !DILocalVariable(name: "r", arg: 5, scope: !2430, file: !74, line: 411, type: !40)
!2439 = !DILocation(line: 414, column: 3, scope: !2430)
!2440 = !DILocation(line: 415, column: 13, scope: !2441)
!2441 = distinct !DILexicalBlock(scope: !2442, file: !74, line: 415, column: 9)
!2442 = distinct !DILexicalBlock(scope: !2430, file: !74, line: 414, column: 18)
!2443 = !DILocation(line: 416, column: 7, scope: !2444)
!2444 = distinct !DILexicalBlock(scope: !2441, file: !74, line: 415, column: 19)
!2445 = !DILocation(line: 418, column: 5, scope: !2444)
!2446 = !DILocalVariable(name: "i", scope: !2430, file: !74, line: 412, type: !40)
!2447 = !DILocation(line: 419, column: 10, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2442, file: !74, line: 419, column: 5)
!2449 = !DILocation(line: 419, scope: !2448)
!2450 = !DILocation(line: 419, column: 21, scope: !2451)
!2451 = distinct !DILexicalBlock(scope: !2448, file: !74, line: 419, column: 5)
!2452 = !DILocation(line: 419, column: 25, scope: !2451)
!2453 = !DILocation(line: 419, column: 5, scope: !2448)
!2454 = !DILocation(line: 420, column: 20, scope: !2451)
!2455 = !DILocation(line: 420, column: 16, scope: !2451)
!2456 = !DILocation(line: 420, column: 30, scope: !2451)
!2457 = !DILocation(line: 420, column: 25, scope: !2451)
!2458 = !DILocation(line: 420, column: 14, scope: !2451)
!2459 = !DILocation(line: 420, column: 11, scope: !2451)
!2460 = !DILocation(line: 419, column: 47, scope: !2451)
!2461 = !DILocation(line: 419, column: 5, scope: !2451)
!2462 = distinct !{!2462, !2453, !2463, !130}
!2463 = !DILocation(line: 420, column: 38, scope: !2448)
!2464 = !DILocation(line: 421, column: 17, scope: !2442)
!2465 = !DILocation(line: 421, column: 12, scope: !2442)
!2466 = distinct !{!2466, !2439, !2467, !130}
!2467 = !DILocation(line: 423, column: 3, scope: !2430)
!2468 = !DILocation(line: 425, column: 3, scope: !2430)
!2469 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 556, type: !1866, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2470 = !DILocalVariable(name: "state", arg: 1, scope: !2469, file: !74, line: 556, type: !1838)
!2471 = !DILocation(line: 0, scope: !2469)
!2472 = !DILocalVariable(name: "in", arg: 2, scope: !2469, file: !74, line: 556, type: !275)
!2473 = !DILocalVariable(name: "inlen", arg: 3, scope: !2469, file: !74, line: 557, type: !38)
!2474 = !DILocation(line: 558, column: 3, scope: !2469)
!2475 = !DILocation(line: 559, column: 3, scope: !2469)
!2476 = !DILocation(line: 559, column: 29, scope: !2469)
!2477 = !DILocation(line: 560, column: 1, scope: !2469)
!2478 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 441, type: !2479, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2479 = !DISubroutineType(types: !2480)
!2480 = !{null, !1848, !40, !275, !38, !33}
!2481 = !DILocalVariable(name: "s", arg: 1, scope: !2478, file: !74, line: 441, type: !1848)
!2482 = !DILocation(line: 0, scope: !2478)
!2483 = !DILocalVariable(name: "r", arg: 2, scope: !2478, file: !74, line: 441, type: !40)
!2484 = !DILocalVariable(name: "in", arg: 3, scope: !2478, file: !74, line: 442, type: !275)
!2485 = !DILocalVariable(name: "inlen", arg: 4, scope: !2478, file: !74, line: 442, type: !38)
!2486 = !DILocalVariable(name: "p", arg: 5, scope: !2478, file: !74, line: 442, type: !33)
!2487 = !DILocalVariable(name: "i", scope: !2478, file: !74, line: 443, type: !40)
!2488 = !DILocation(line: 445, column: 8, scope: !2489)
!2489 = distinct !DILexicalBlock(scope: !2478, file: !74, line: 445, column: 3)
!2490 = !DILocation(line: 445, scope: !2489)
!2491 = !DILocation(line: 445, column: 17, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2489, file: !74, line: 445, column: 3)
!2493 = !DILocation(line: 445, column: 3, scope: !2489)
!2494 = !DILocation(line: 448, column: 3, scope: !2478)
!2495 = !DILocation(line: 446, column: 5, scope: !2492)
!2496 = !DILocation(line: 446, column: 10, scope: !2492)
!2497 = !DILocation(line: 445, column: 24, scope: !2492)
!2498 = !DILocation(line: 445, column: 3, scope: !2492)
!2499 = distinct !{!2499, !2493, !2500, !130}
!2500 = !DILocation(line: 446, column: 12, scope: !2489)
!2501 = !DILocation(line: 448, column: 16, scope: !2478)
!2502 = !DILocation(line: 449, column: 5, scope: !2503)
!2503 = distinct !DILexicalBlock(scope: !2504, file: !74, line: 449, column: 5)
!2504 = distinct !DILexicalBlock(scope: !2478, file: !74, line: 448, column: 22)
!2505 = !DILocation(line: 456, column: 3, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2478, file: !74, line: 456, column: 3)
!2507 = !DILocation(line: 449, scope: !2503)
!2508 = !DILocation(line: 449, column: 19, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2503, file: !74, line: 449, column: 5)
!2510 = !DILocation(line: 450, column: 29, scope: !2509)
!2511 = !DILocation(line: 450, column: 25, scope: !2509)
!2512 = !DILocation(line: 450, column: 15, scope: !2509)
!2513 = !DILocation(line: 450, column: 7, scope: !2509)
!2514 = !DILocation(line: 450, column: 12, scope: !2509)
!2515 = !DILocation(line: 449, column: 29, scope: !2509)
!2516 = !DILocation(line: 449, column: 5, scope: !2509)
!2517 = distinct !{!2517, !2502, !2518, !130}
!2518 = !DILocation(line: 450, column: 32, scope: !2503)
!2519 = !DILocation(line: 451, column: 8, scope: !2504)
!2520 = !DILocation(line: 452, column: 11, scope: !2504)
!2521 = !DILocation(line: 453, column: 5, scope: !2504)
!2522 = distinct !{!2522, !2494, !2523, !130}
!2523 = !DILocation(line: 454, column: 3, scope: !2478)
!2524 = !DILocation(line: 456, scope: !2506)
!2525 = !DILocation(line: 456, column: 17, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2506, file: !74, line: 456, column: 3)
!2527 = !DILocation(line: 457, column: 27, scope: !2526)
!2528 = !DILocation(line: 457, column: 17, scope: !2526)
!2529 = !DILocation(line: 457, column: 38, scope: !2526)
!2530 = !DILocation(line: 457, column: 33, scope: !2526)
!2531 = !DILocation(line: 457, column: 9, scope: !2526)
!2532 = !DILocation(line: 457, column: 5, scope: !2526)
!2533 = !DILocation(line: 457, column: 14, scope: !2526)
!2534 = !DILocation(line: 456, column: 27, scope: !2526)
!2535 = !DILocation(line: 456, column: 3, scope: !2526)
!2536 = distinct !{!2536, !2505, !2537, !130}
!2537 = !DILocation(line: 457, column: 46, scope: !2506)
!2538 = !DILocation(line: 459, column: 15, scope: !2478)
!2539 = !DILocation(line: 459, column: 32, scope: !2478)
!2540 = !DILocation(line: 459, column: 27, scope: !2478)
!2541 = !DILocation(line: 459, column: 7, scope: !2478)
!2542 = !DILocation(line: 459, column: 3, scope: !2478)
!2543 = !DILocation(line: 459, column: 12, scope: !2478)
!2544 = !DILocation(line: 460, column: 8, scope: !2478)
!2545 = !DILocation(line: 460, column: 13, scope: !2478)
!2546 = !DILocation(line: 460, column: 3, scope: !2478)
!2547 = !DILocation(line: 460, column: 18, scope: !2478)
!2548 = !DILocation(line: 461, column: 1, scope: !2478)
!2549 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2550, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2550 = !DISubroutineType(types: !2551)
!2551 = !{!70, !275}
!2552 = !DILocalVariable(name: "x", arg: 1, scope: !2549, file: !74, line: 22, type: !275)
!2553 = !DILocation(line: 0, scope: !2549)
!2554 = !DILocalVariable(name: "r", scope: !2549, file: !74, line: 24, type: !70)
!2555 = !DILocalVariable(name: "i", scope: !2549, file: !74, line: 23, type: !40)
!2556 = !DILocation(line: 26, column: 8, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2549, file: !74, line: 26, column: 3)
!2558 = !DILocation(line: 26, scope: !2557)
!2559 = !DILocation(line: 26, column: 17, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2557, file: !74, line: 26, column: 3)
!2561 = !DILocation(line: 26, column: 3, scope: !2557)
!2562 = !DILocation(line: 27, column: 20, scope: !2560)
!2563 = !DILocation(line: 27, column: 10, scope: !2560)
!2564 = !DILocation(line: 27, column: 30, scope: !2560)
!2565 = !DILocation(line: 27, column: 25, scope: !2560)
!2566 = !DILocation(line: 27, column: 7, scope: !2560)
!2567 = !DILocation(line: 26, column: 23, scope: !2560)
!2568 = !DILocation(line: 26, column: 3, scope: !2560)
!2569 = distinct !{!2569, !2561, !2570, !130}
!2570 = !DILocation(line: 27, column: 32, scope: !2557)
!2571 = !DILocation(line: 29, column: 3, scope: !2549)
!2572 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 575, type: !2419, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2573 = !DILocalVariable(name: "out", arg: 1, scope: !2572, file: !74, line: 575, type: !32)
!2574 = !DILocation(line: 0, scope: !2572)
!2575 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2572, file: !74, line: 575, type: !38)
!2576 = !DILocalVariable(name: "state", arg: 3, scope: !2572, file: !74, line: 575, type: !1838)
!2577 = !DILocation(line: 576, column: 3, scope: !2572)
!2578 = !DILocation(line: 577, column: 1, scope: !2572)
!2579 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 477, type: !2580, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2580 = !DISubroutineType(types: !2581)
!2581 = !{null, !32, !38, !1848, !40}
!2582 = !DILocalVariable(name: "out", arg: 1, scope: !2579, file: !74, line: 477, type: !32)
!2583 = !DILocation(line: 0, scope: !2579)
!2584 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2579, file: !74, line: 477, type: !38)
!2585 = !DILocalVariable(name: "s", arg: 3, scope: !2579, file: !74, line: 477, type: !1848)
!2586 = !DILocalVariable(name: "r", arg: 4, scope: !2579, file: !74, line: 478, type: !40)
!2587 = !DILocation(line: 481, column: 3, scope: !2579)
!2588 = !DILocation(line: 482, column: 5, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2579, file: !74, line: 481, column: 19)
!2590 = !DILocalVariable(name: "i", scope: !2579, file: !74, line: 479, type: !40)
!2591 = !DILocation(line: 483, column: 10, scope: !2592)
!2592 = distinct !DILexicalBlock(scope: !2589, file: !74, line: 483, column: 5)
!2593 = !DILocation(line: 483, scope: !2592)
!2594 = !DILocation(line: 483, column: 19, scope: !2595)
!2595 = distinct !DILexicalBlock(scope: !2592, file: !74, line: 483, column: 5)
!2596 = !DILocation(line: 483, column: 5, scope: !2592)
!2597 = !DILocation(line: 484, column: 23, scope: !2595)
!2598 = !DILocation(line: 484, column: 19, scope: !2595)
!2599 = !DILocation(line: 484, column: 28, scope: !2595)
!2600 = !DILocation(line: 484, column: 7, scope: !2595)
!2601 = !DILocation(line: 483, column: 29, scope: !2595)
!2602 = !DILocation(line: 483, column: 5, scope: !2595)
!2603 = distinct !{!2603, !2596, !2604, !130}
!2604 = !DILocation(line: 484, column: 32, scope: !2592)
!2605 = !DILocation(line: 485, column: 9, scope: !2589)
!2606 = !DILocation(line: 486, column: 13, scope: !2589)
!2607 = distinct !{!2607, !2587, !2608, !130}
!2608 = !DILocation(line: 487, column: 3, scope: !2579)
!2609 = !DILocation(line: 488, column: 1, scope: !2579)
!2610 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 41, type: !2611, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2611 = !DISubroutineType(types: !2612)
!2612 = !{null, !32, !70}
!2613 = !DILocalVariable(name: "x", arg: 1, scope: !2610, file: !74, line: 41, type: !32)
!2614 = !DILocation(line: 0, scope: !2610)
!2615 = !DILocalVariable(name: "u", arg: 2, scope: !2610, file: !74, line: 41, type: !70)
!2616 = !DILocalVariable(name: "i", scope: !2610, file: !74, line: 42, type: !40)
!2617 = !DILocation(line: 44, column: 8, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2610, file: !74, line: 44, column: 3)
!2619 = !DILocation(line: 44, scope: !2618)
!2620 = !DILocation(line: 44, column: 17, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2618, file: !74, line: 44, column: 3)
!2622 = !DILocation(line: 44, column: 3, scope: !2618)
!2623 = !DILocation(line: 45, column: 19, scope: !2621)
!2624 = !DILocation(line: 45, column: 14, scope: !2621)
!2625 = !DILocation(line: 45, column: 12, scope: !2621)
!2626 = !DILocation(line: 45, column: 5, scope: !2621)
!2627 = !DILocation(line: 45, column: 10, scope: !2621)
!2628 = !DILocation(line: 44, column: 23, scope: !2621)
!2629 = !DILocation(line: 44, column: 3, scope: !2621)
!2630 = distinct !{!2630, !2622, !2631, !130}
!2631 = !DILocation(line: 45, column: 21, scope: !2618)
!2632 = !DILocation(line: 46, column: 1, scope: !2610)
!2633 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 586, type: !1836, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2634 = !DILocalVariable(name: "state", arg: 1, scope: !2633, file: !74, line: 586, type: !1838)
!2635 = !DILocation(line: 0, scope: !2633)
!2636 = !DILocation(line: 587, column: 3, scope: !2633)
!2637 = !DILocation(line: 588, column: 3, scope: !2633)
!2638 = !DILocation(line: 588, column: 29, scope: !2633)
!2639 = !DILocation(line: 589, column: 1, scope: !2633)
!2640 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 601, type: !1866, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2641 = !DILocalVariable(name: "state", arg: 1, scope: !2640, file: !74, line: 601, type: !1838)
!2642 = !DILocation(line: 0, scope: !2640)
!2643 = !DILocalVariable(name: "in", arg: 2, scope: !2640, file: !74, line: 601, type: !275)
!2644 = !DILocalVariable(name: "inlen", arg: 3, scope: !2640, file: !74, line: 601, type: !38)
!2645 = !DILocation(line: 602, column: 53, scope: !2640)
!2646 = !DILocation(line: 602, column: 31, scope: !2640)
!2647 = !DILocation(line: 602, column: 3, scope: !2640)
!2648 = !DILocation(line: 602, column: 29, scope: !2640)
!2649 = !DILocation(line: 604, column: 1, scope: !2640)
!2650 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 613, type: !1836, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2651 = !DILocalVariable(name: "state", arg: 1, scope: !2650, file: !74, line: 613, type: !1838)
!2652 = !DILocation(line: 0, scope: !2650)
!2653 = !DILocation(line: 614, column: 27, scope: !2650)
!2654 = !DILocation(line: 614, column: 3, scope: !2650)
!2655 = !DILocation(line: 615, column: 3, scope: !2650)
!2656 = !DILocation(line: 615, column: 29, scope: !2650)
!2657 = !DILocation(line: 616, column: 1, scope: !2650)
!2658 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 629, type: !2419, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2659 = !DILocalVariable(name: "out", arg: 1, scope: !2658, file: !74, line: 629, type: !32)
!2660 = !DILocation(line: 0, scope: !2658)
!2661 = !DILocalVariable(name: "outlen", arg: 2, scope: !2658, file: !74, line: 629, type: !38)
!2662 = !DILocalVariable(name: "state", arg: 3, scope: !2658, file: !74, line: 629, type: !1838)
!2663 = !DILocation(line: 631, column: 28, scope: !2658)
!2664 = !DILocation(line: 630, column: 31, scope: !2658)
!2665 = !DILocation(line: 630, column: 3, scope: !2658)
!2666 = !DILocation(line: 630, column: 29, scope: !2658)
!2667 = !DILocation(line: 632, column: 1, scope: !2658)
!2668 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 645, type: !1866, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2669 = !DILocalVariable(name: "state", arg: 1, scope: !2668, file: !74, line: 645, type: !1838)
!2670 = !DILocation(line: 0, scope: !2668)
!2671 = !DILocalVariable(name: "in", arg: 2, scope: !2668, file: !74, line: 645, type: !275)
!2672 = !DILocalVariable(name: "inlen", arg: 3, scope: !2668, file: !74, line: 646, type: !38)
!2673 = !DILocation(line: 647, column: 3, scope: !2668)
!2674 = !DILocation(line: 648, column: 3, scope: !2668)
!2675 = !DILocation(line: 648, column: 29, scope: !2668)
!2676 = !DILocation(line: 649, column: 1, scope: !2668)
!2677 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 664, type: !2419, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2678 = !DILocalVariable(name: "out", arg: 1, scope: !2677, file: !74, line: 664, type: !32)
!2679 = !DILocation(line: 0, scope: !2677)
!2680 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2677, file: !74, line: 664, type: !38)
!2681 = !DILocalVariable(name: "state", arg: 3, scope: !2677, file: !74, line: 664, type: !1838)
!2682 = !DILocation(line: 665, column: 3, scope: !2677)
!2683 = !DILocation(line: 666, column: 1, scope: !2677)
!2684 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 678, type: !2685, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2685 = !DISubroutineType(types: !2686)
!2686 = !{null, !32, !38, !275, !38}
!2687 = !DILocalVariable(name: "out", arg: 1, scope: !2684, file: !74, line: 678, type: !32)
!2688 = !DILocation(line: 0, scope: !2684)
!2689 = !DILocalVariable(name: "outlen", arg: 2, scope: !2684, file: !74, line: 678, type: !38)
!2690 = !DILocalVariable(name: "in", arg: 3, scope: !2684, file: !74, line: 678, type: !275)
!2691 = !DILocalVariable(name: "inlen", arg: 4, scope: !2684, file: !74, line: 678, type: !38)
!2692 = !DILocalVariable(name: "state", scope: !2684, file: !74, line: 680, type: !387)
!2693 = !DILocation(line: 680, column: 16, scope: !2684)
!2694 = !DILocation(line: 682, column: 3, scope: !2684)
!2695 = !DILocation(line: 683, column: 20, scope: !2684)
!2696 = !DILocalVariable(name: "nblocks", scope: !2684, file: !74, line: 679, type: !38)
!2697 = !DILocation(line: 684, column: 3, scope: !2684)
!2698 = !DILocation(line: 685, column: 21, scope: !2684)
!2699 = !DILocation(line: 685, column: 10, scope: !2684)
!2700 = !DILocation(line: 686, column: 18, scope: !2684)
!2701 = !DILocation(line: 686, column: 7, scope: !2684)
!2702 = !DILocation(line: 687, column: 3, scope: !2684)
!2703 = !DILocation(line: 688, column: 1, scope: !2684)
!2704 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 700, type: !2685, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2705 = !DILocalVariable(name: "out", arg: 1, scope: !2704, file: !74, line: 700, type: !32)
!2706 = !DILocation(line: 0, scope: !2704)
!2707 = !DILocalVariable(name: "outlen", arg: 2, scope: !2704, file: !74, line: 700, type: !38)
!2708 = !DILocalVariable(name: "in", arg: 3, scope: !2704, file: !74, line: 700, type: !275)
!2709 = !DILocalVariable(name: "inlen", arg: 4, scope: !2704, file: !74, line: 700, type: !38)
!2710 = !DILocalVariable(name: "state", scope: !2704, file: !74, line: 702, type: !387)
!2711 = !DILocation(line: 702, column: 16, scope: !2704)
!2712 = !DILocation(line: 704, column: 3, scope: !2704)
!2713 = !DILocation(line: 705, column: 20, scope: !2704)
!2714 = !DILocalVariable(name: "nblocks", scope: !2704, file: !74, line: 701, type: !38)
!2715 = !DILocation(line: 706, column: 3, scope: !2704)
!2716 = !DILocation(line: 707, column: 21, scope: !2704)
!2717 = !DILocation(line: 707, column: 10, scope: !2704)
!2718 = !DILocation(line: 708, column: 18, scope: !2704)
!2719 = !DILocation(line: 708, column: 7, scope: !2704)
!2720 = !DILocation(line: 709, column: 3, scope: !2704)
!2721 = !DILocation(line: 710, column: 1, scope: !2704)
!2722 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 721, type: !2723, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2723 = !DISubroutineType(types: !2724)
!2724 = !{null, !32, !275, !38}
!2725 = !DILocalVariable(name: "h", arg: 1, scope: !2722, file: !74, line: 721, type: !32)
!2726 = !DILocation(line: 0, scope: !2722)
!2727 = !DILocalVariable(name: "in", arg: 2, scope: !2722, file: !74, line: 721, type: !275)
!2728 = !DILocalVariable(name: "inlen", arg: 3, scope: !2722, file: !74, line: 721, type: !38)
!2729 = !DILocalVariable(name: "s", scope: !2722, file: !74, line: 723, type: !2730)
!2730 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !2731)
!2731 = !{!2732}
!2732 = !DISubrange(count: 25)
!2733 = !DILocation(line: 723, column: 12, scope: !2722)
!2734 = !DILocation(line: 725, column: 3, scope: !2722)
!2735 = !DILocation(line: 726, column: 3, scope: !2722)
!2736 = !DILocalVariable(name: "i", scope: !2722, file: !74, line: 722, type: !40)
!2737 = !DILocation(line: 727, column: 8, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2722, file: !74, line: 727, column: 3)
!2739 = !DILocation(line: 727, scope: !2738)
!2740 = !DILocation(line: 727, column: 17, scope: !2741)
!2741 = distinct !DILexicalBlock(scope: !2738, file: !74, line: 727, column: 3)
!2742 = !DILocation(line: 727, column: 3, scope: !2738)
!2743 = !DILocation(line: 728, column: 19, scope: !2741)
!2744 = !DILocation(line: 728, column: 15, scope: !2741)
!2745 = !DILocation(line: 728, column: 24, scope: !2741)
!2746 = !DILocation(line: 728, column: 5, scope: !2741)
!2747 = !DILocation(line: 727, column: 23, scope: !2741)
!2748 = !DILocation(line: 727, column: 3, scope: !2741)
!2749 = distinct !{!2749, !2742, !2750, !130}
!2750 = !DILocation(line: 728, column: 28, scope: !2738)
!2751 = !DILocation(line: 729, column: 1, scope: !2722)
!2752 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 740, type: !2723, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2753 = !DILocalVariable(name: "h", arg: 1, scope: !2752, file: !74, line: 740, type: !32)
!2754 = !DILocation(line: 0, scope: !2752)
!2755 = !DILocalVariable(name: "in", arg: 2, scope: !2752, file: !74, line: 740, type: !275)
!2756 = !DILocalVariable(name: "inlen", arg: 3, scope: !2752, file: !74, line: 740, type: !38)
!2757 = !DILocalVariable(name: "s", scope: !2752, file: !74, line: 742, type: !2730)
!2758 = !DILocation(line: 742, column: 12, scope: !2752)
!2759 = !DILocation(line: 744, column: 3, scope: !2752)
!2760 = !DILocation(line: 745, column: 3, scope: !2752)
!2761 = !DILocalVariable(name: "i", scope: !2752, file: !74, line: 741, type: !40)
!2762 = !DILocation(line: 746, column: 8, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2752, file: !74, line: 746, column: 3)
!2764 = !DILocation(line: 746, scope: !2763)
!2765 = !DILocation(line: 746, column: 17, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2763, file: !74, line: 746, column: 3)
!2767 = !DILocation(line: 746, column: 3, scope: !2763)
!2768 = !DILocation(line: 747, column: 19, scope: !2766)
!2769 = !DILocation(line: 747, column: 15, scope: !2766)
!2770 = !DILocation(line: 747, column: 24, scope: !2766)
!2771 = !DILocation(line: 747, column: 5, scope: !2766)
!2772 = !DILocation(line: 746, column: 23, scope: !2766)
!2773 = !DILocation(line: 746, column: 3, scope: !2766)
!2774 = distinct !{!2774, !2767, !2775, !130}
!2775 = !DILocation(line: 747, column: 28, scope: !2763)
!2776 = !DILocation(line: 748, column: 1, scope: !2752)
!2777 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2778, file: !2778, line: 18, type: !2779, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2778 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2779 = !DISubroutineType(types: !2780)
!2780 = !{null, !1838, !275, !33, !33}
!2781 = !DILocalVariable(name: "state", arg: 1, scope: !2777, file: !2778, line: 18, type: !1838)
!2782 = !DILocation(line: 0, scope: !2777)
!2783 = !DILocalVariable(name: "seed", arg: 2, scope: !2777, file: !2778, line: 19, type: !275)
!2784 = !DILocalVariable(name: "x", arg: 3, scope: !2777, file: !2778, line: 20, type: !33)
!2785 = !DILocalVariable(name: "y", arg: 4, scope: !2777, file: !2778, line: 21, type: !33)
!2786 = !DILocalVariable(name: "extseed", scope: !2777, file: !2778, line: 23, type: !2787)
!2787 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !2788)
!2788 = !{!2789}
!2789 = !DISubrange(count: 34)
!2790 = !DILocation(line: 23, column: 11, scope: !2777)
!2791 = !DILocation(line: 25, column: 3, scope: !2777)
!2792 = !DILocation(line: 26, column: 3, scope: !2777)
!2793 = !DILocation(line: 26, column: 29, scope: !2777)
!2794 = !DILocation(line: 27, column: 3, scope: !2777)
!2795 = !DILocation(line: 27, column: 29, scope: !2777)
!2796 = !DILocation(line: 29, column: 3, scope: !2777)
!2797 = !DILocation(line: 30, column: 1, scope: !2777)
!2798 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2778, file: !2778, line: 43, type: !2799, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2799 = !DISubroutineType(types: !2800)
!2800 = !{null, !32, !38, !275, !33}
!2801 = !DILocalVariable(name: "out", arg: 1, scope: !2798, file: !2778, line: 43, type: !32)
!2802 = !DILocation(line: 0, scope: !2798)
!2803 = !DILocalVariable(name: "outlen", arg: 2, scope: !2798, file: !2778, line: 43, type: !38)
!2804 = !DILocalVariable(name: "key", arg: 3, scope: !2798, file: !2778, line: 43, type: !275)
!2805 = !DILocalVariable(name: "nonce", arg: 4, scope: !2798, file: !2778, line: 43, type: !33)
!2806 = !DILocalVariable(name: "extkey", scope: !2798, file: !2778, line: 45, type: !2807)
!2807 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !2808)
!2808 = !{!2809}
!2809 = !DISubrange(count: 33)
!2810 = !DILocation(line: 45, column: 11, scope: !2798)
!2811 = !DILocation(line: 47, column: 3, scope: !2798)
!2812 = !DILocation(line: 48, column: 3, scope: !2798)
!2813 = !DILocation(line: 48, column: 26, scope: !2798)
!2814 = !DILocation(line: 50, column: 3, scope: !2798)
!2815 = !DILocation(line: 51, column: 1, scope: !2798)
!2816 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2778, file: !2778, line: 64, type: !680, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2817 = !DILocalVariable(name: "out", arg: 1, scope: !2816, file: !2778, line: 64, type: !32)
!2818 = !DILocation(line: 0, scope: !2816)
!2819 = !DILocalVariable(name: "key", arg: 2, scope: !2816, file: !2778, line: 64, type: !275)
!2820 = !DILocalVariable(name: "input", arg: 3, scope: !2816, file: !2778, line: 64, type: !275)
!2821 = !DILocalVariable(name: "s", scope: !2816, file: !2778, line: 66, type: !387)
!2822 = !DILocation(line: 66, column: 16, scope: !2816)
!2823 = !DILocation(line: 68, column: 3, scope: !2816)
!2824 = !DILocation(line: 69, column: 3, scope: !2816)
!2825 = !DILocation(line: 70, column: 3, scope: !2816)
!2826 = !DILocation(line: 71, column: 3, scope: !2816)
!2827 = !DILocation(line: 72, column: 3, scope: !2816)
!2828 = !DILocation(line: 73, column: 1, scope: !2816)
