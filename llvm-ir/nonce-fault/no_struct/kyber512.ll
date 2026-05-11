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
@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
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
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 1632) #4, !dbg !131
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 800) #4, !dbg !132
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 768) #4, !dbg !133
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
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !137, !DIExpression(), !141)
    #dbg_declare(ptr %sk, !142, !DIExpression(), !146)
    #dbg_declare(ptr %ct, !147, !DIExpression(), !151)
    #dbg_declare(ptr %key_a, !152, !DIExpression(), !156)
    #dbg_declare(ptr %key_b, !157, !DIExpression(), !158)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !159
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !160
  %call9 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !161
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
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !170, !DIExpression(), !171)
    #dbg_declare(ptr %sk, !172, !DIExpression(), !173)
    #dbg_declare(ptr %ct, !174, !DIExpression(), !175)
    #dbg_declare(ptr %key_a, !176, !DIExpression(), !177)
    #dbg_declare(ptr %key_b, !178, !DIExpression(), !179)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !180
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !181
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 1632) #3, !dbg !182
  %call10 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !183
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
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
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
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !215
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !216
  %1 = load i8, ptr %b, align 1, !dbg !217
    #dbg_value(i8 %1, !204, !DIExpression(), !205)
  %2 = load i32, ptr %pos, align 4, !dbg !218
    #dbg_value(i32 %2, !213, !DIExpression(), !205)
  %rem = urem i32 %2, 768, !dbg !219
  %arrayidx = getelementptr inbounds nuw [768 x i8], ptr %ct, i32 0, i32 %rem, !dbg !220
  %3 = load i8, ptr %arrayidx, align 1, !dbg !221
  %xor1 = xor i8 %3, %1, !dbg !221
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !221
  %call11 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !222
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
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !271 {
entry:
    #dbg_value(ptr %pk, !277, !DIExpression(), !278)
    #dbg_value(ptr %sk, !279, !DIExpression(), !278)
    #dbg_value(ptr %coins, !280, !DIExpression(), !278)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !281
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !282
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #4, !dbg !283
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !284
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #3, !dbg !284
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !285
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !286
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !287
  ret i32 0, !dbg !288
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !289 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !292, !DIExpression(), !293)
    #dbg_value(ptr %sk, !294, !DIExpression(), !293)
    #dbg_declare(ptr %coins, !295, !DIExpression(), !299)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !300
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !301
  ret i32 0, !dbg !302
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !303 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #3, !dbg !316
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !317
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !318
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !319
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !320
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !322 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !323, !DIExpression(), !324)
    #dbg_value(ptr %ss, !325, !DIExpression(), !324)
    #dbg_value(ptr %pk, !326, !DIExpression(), !324)
    #dbg_declare(ptr %coins, !327, !DIExpression(), !328)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !329
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !330
  ret i32 0, !dbg !331
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !332 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !335, !DIExpression(), !336)
    #dbg_value(ptr %ct, !337, !DIExpression(), !336)
    #dbg_value(ptr %sk, !338, !DIExpression(), !336)
    #dbg_declare(ptr %buf, !339, !DIExpression(), !340)
    #dbg_declare(ptr %kr, !341, !DIExpression(), !342)
    #dbg_declare(ptr %cmp, !343, !DIExpression(), !344)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !345
    #dbg_value(ptr %add.ptr, !346, !DIExpression(), !336)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !347
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !348
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !349
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !350
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !351
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !352
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !353
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 768) #3, !dbg !354
    #dbg_value(i32 %call12, !355, !DIExpression(), !336)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !356
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !356
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !357
  %conv = xor i8 %0, 1, !dbg !357
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !358
  ret i32 0, !dbg !359
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !360 {
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
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !395
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !397

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !398

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !401
    #dbg_value(i32 %j.0, !402, !DIExpression(), !376)
  %exitcond = icmp ne i32 %j.0, 2, !dbg !403
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !398

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !405
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !405

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !408
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !408
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !408
  br label %if.end, !dbg !408

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !409
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !409
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !409
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !410
    #dbg_value(i32 504, !411, !DIExpression(), !376)
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !412
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
  %arrayidx14 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !420
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
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !480 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x [2 x [256 x i16]]], align 2
  %e = alloca [2 x [256 x i16]], align 2
  %pkpv = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
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
  store i8 2, ptr %arrayidx, align 1, !dbg !504
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !505
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !506
    #dbg_value(i32 0, !507, !DIExpression(), !484)
  br label %for.cond, !dbg !508

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !510
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !484
    #dbg_value(i8 %nonce.0, !492, !DIExpression(), !484)
    #dbg_value(i32 %i.0, !507, !DIExpression(), !484)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !511
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !513

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !514

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !516
    #dbg_value(i8 %nonce.0, !492, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !484)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !517
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !518
    #dbg_value(i8 %inc, !492, !DIExpression(), !484)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !519
    #dbg_value(i32 %inc7, !507, !DIExpression(), !484)
  br label %for.cond, !dbg !520, !llvm.loop !521

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !523
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 2, %for.cond8.preheader ], !dbg !484
    #dbg_value(i8 %nonce.1, !492, !DIExpression(), !484)
    #dbg_value(i32 %i.1, !507, !DIExpression(), !484)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !524
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !514

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !526
    #dbg_value(i8 %nonce.1, !492, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !484)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !527
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !528
    #dbg_value(i8 %inc12, !492, !DIExpression(), !484)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !529
    #dbg_value(i32 %inc14, !507, !DIExpression(), !484)
  br label %for.cond8, !dbg !530, !llvm.loop !531

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !533
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !534
    #dbg_value(i32 0, !507, !DIExpression(), !484)
  br label %for.cond16, !dbg !535

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !537
    #dbg_value(i32 %i.2, !507, !DIExpression(), !484)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !538
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !540

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !541
  %arrayidx20 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !543
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !544
  %arrayidx21 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !545
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !546
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !547
    #dbg_value(i32 %inc23, !507, !DIExpression(), !484)
  br label %for.cond16, !dbg !548, !llvm.loop !549

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !551
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !552
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !553
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !554
  ret void, !dbg !555
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !556 {
entry:
    #dbg_value(ptr %r, !559, !DIExpression(), !560)
    #dbg_value(ptr %sk, !561, !DIExpression(), !560)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !562
  ret void, !dbg !563
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !564 {
entry:
    #dbg_value(ptr %r, !567, !DIExpression(), !568)
    #dbg_value(ptr %pk, !569, !DIExpression(), !568)
    #dbg_value(ptr %seed, !570, !DIExpression(), !568)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !571
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 768, !dbg !572
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !573
  ret void, !dbg !574
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !575 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca [2 x [256 x i16]], align 2
  %pkpv = alloca [2 x [256 x i16]], align 2
  %ep = alloca [2 x [256 x i16]], align 2
  %at = alloca [2 x [2 x [256 x i16]]], align 2
  %b = alloca [2 x [256 x i16]], align 2
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
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !603
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !604
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !606

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !608
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !579
    #dbg_value(i8 %nonce.0, !585, !DIExpression(), !579)
    #dbg_value(i32 %i.0, !605, !DIExpression(), !579)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !609
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !611

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !612

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !614
    #dbg_value(i8 %nonce.0, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !615
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !616
    #dbg_value(i8 %inc, !585, !DIExpression(), !579)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !617
    #dbg_value(i32 %inc4, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !618, !llvm.loop !619

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !621
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 2, %for.cond5.preheader ], !dbg !579
    #dbg_value(i8 %nonce.1, !585, !DIExpression(), !579)
    #dbg_value(i32 %i.1, !605, !DIExpression(), !579)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !622
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !612

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !624
    #dbg_value(i8 %nonce.1, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !625
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !626
    #dbg_value(i8 %inc10, !585, !DIExpression(), !579)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !627
    #dbg_value(i32 %inc12, !605, !DIExpression(), !579)
  br label %for.cond5, !dbg !628, !llvm.loop !629

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !585, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !579)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 4) #3, !dbg !631
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !632
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond15, !dbg !633

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !635
    #dbg_value(i32 %i.2, !605, !DIExpression(), !579)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !636
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !638

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !639
  %arrayidx18 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !640
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !641
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !642
    #dbg_value(i32 %inc20, !605, !DIExpression(), !579)
  br label %for.cond15, !dbg !643, !llvm.loop !644

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !646
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !647
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !648
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !649
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !650
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !651
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !652
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !653
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !654
  ret void, !dbg !655
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !656 {
entry:
    #dbg_value(ptr %pk, !659, !DIExpression(), !660)
    #dbg_value(ptr %seed, !661, !DIExpression(), !660)
    #dbg_value(ptr %packedpk, !662, !DIExpression(), !660)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !663
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 768, !dbg !664
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !665
  ret void, !dbg !666
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !667 {
entry:
    #dbg_value(ptr %r, !671, !DIExpression(), !672)
    #dbg_value(ptr %b, !673, !DIExpression(), !672)
    #dbg_value(ptr %v, !674, !DIExpression(), !672)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !675
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 640, !dbg !676
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !677
  ret void, !dbg !678
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !679 {
entry:
  %b = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
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
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !696
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !697
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !698
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !699
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !700
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !701
  ret void, !dbg !702
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !703 {
entry:
    #dbg_value(ptr %b, !706, !DIExpression(), !707)
    #dbg_value(ptr %v, !708, !DIExpression(), !707)
    #dbg_value(ptr %c, !709, !DIExpression(), !707)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !710
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !711
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !712
  ret void, !dbg !713
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !714 {
entry:
    #dbg_value(ptr %sk, !717, !DIExpression(), !718)
    #dbg_value(ptr %packedsk, !719, !DIExpression(), !718)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !720
  ret void, !dbg !721
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !722 {
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
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !740
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
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !760
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
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !814 {
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
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !824
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
  %arrayidx50 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !880
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
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !896 {
entry:
    #dbg_value(ptr %r, !897, !DIExpression(), !898)
    #dbg_value(ptr %a, !899, !DIExpression(), !898)
    #dbg_value(i32 0, !900, !DIExpression(), !898)
  br label %for.cond, !dbg !901

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !903
    #dbg_value(i32 %i.0, !900, !DIExpression(), !898)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !904
  br i1 %exitcond, label %for.body, label %for.end, !dbg !906

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !907
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !908
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !909
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !910
  %inc = add nuw nsw i32 %i.0, 1, !dbg !911
    #dbg_value(i32 %inc, !900, !DIExpression(), !898)
  br label %for.cond, !dbg !912, !llvm.loop !913

for.end:                                          ; preds = %for.cond
  ret void, !dbg !915
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !916 {
entry:
    #dbg_value(ptr %r, !917, !DIExpression(), !918)
    #dbg_value(ptr %a, !919, !DIExpression(), !918)
    #dbg_value(i32 0, !920, !DIExpression(), !918)
  br label %for.cond, !dbg !921

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !923
    #dbg_value(i32 %i.0, !920, !DIExpression(), !918)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !927
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !928
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !929
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !930
  %inc = add nuw nsw i32 %i.0, 1, !dbg !931
    #dbg_value(i32 %inc, !920, !DIExpression(), !918)
  br label %for.cond, !dbg !932, !llvm.loop !933

for.end:                                          ; preds = %for.cond
  ret void, !dbg !935
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !936 {
entry:
    #dbg_value(ptr %r, !939, !DIExpression(), !940)
    #dbg_value(i32 0, !941, !DIExpression(), !940)
  br label %for.cond, !dbg !942

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !944
    #dbg_value(i32 %i.0, !941, !DIExpression(), !940)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !945
  br i1 %exitcond, label %for.body, label %for.end, !dbg !947

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !948
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !949
  %inc = add nuw nsw i32 %i.0, 1, !dbg !950
    #dbg_value(i32 %inc, !941, !DIExpression(), !940)
  br label %for.cond, !dbg !951, !llvm.loop !952

for.end:                                          ; preds = %for.cond
  ret void, !dbg !954
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !955 {
entry:
    #dbg_value(ptr %r, !956, !DIExpression(), !957)
    #dbg_value(i32 0, !958, !DIExpression(), !957)
  br label %for.cond, !dbg !959

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !961
    #dbg_value(i32 %i.0, !958, !DIExpression(), !957)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !962
  br i1 %exitcond, label %for.body, label %for.end, !dbg !964

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !965
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !966
  %inc = add nuw nsw i32 %i.0, 1, !dbg !967
    #dbg_value(i32 %inc, !958, !DIExpression(), !957)
  br label %for.cond, !dbg !968, !llvm.loop !969

for.end:                                          ; preds = %for.cond
  ret void, !dbg !971
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !972 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !975, !DIExpression(), !976)
    #dbg_value(ptr %a, !977, !DIExpression(), !976)
    #dbg_value(ptr %b, !978, !DIExpression(), !976)
    #dbg_declare(ptr %t, !979, !DIExpression(), !980)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !981
    #dbg_value(i32 1, !982, !DIExpression(), !976)
    #dbg_value(i32 poison, !982, !DIExpression(), !976)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %a, i32 512, !dbg !983
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %b, i32 512, !dbg !987
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !988
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !989
    #dbg_value(i32 2, !982, !DIExpression(), !976)
    #dbg_value(i32 poison, !982, !DIExpression(), !976)
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !990
  ret void, !dbg !991
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !992 {
entry:
    #dbg_value(ptr %r, !993, !DIExpression(), !994)
    #dbg_value(i32 0, !995, !DIExpression(), !994)
  br label %for.cond, !dbg !996

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !998
    #dbg_value(i32 %i.0, !995, !DIExpression(), !994)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !999
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1001

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1002
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1003
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1004
    #dbg_value(i32 %inc, !995, !DIExpression(), !994)
  br label %for.cond, !dbg !1005, !llvm.loop !1006

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1008
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1009 {
entry:
    #dbg_value(ptr %r, !1012, !DIExpression(), !1013)
    #dbg_value(ptr %a, !1014, !DIExpression(), !1013)
    #dbg_value(ptr %b, !1015, !DIExpression(), !1013)
    #dbg_value(i32 0, !1016, !DIExpression(), !1013)
  br label %for.cond, !dbg !1017

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1019
    #dbg_value(i32 %i.0, !1016, !DIExpression(), !1013)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !1020
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1022

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1023
  %arrayidx1 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1024
  %arrayidx2 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1025
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !1026
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1027
    #dbg_value(i32 %inc, !1016, !DIExpression(), !1013)
  br label %for.cond, !dbg !1028, !llvm.loop !1029

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1031
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1032 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1038, !DIExpression(), !1039)
    #dbg_value(ptr %a, !1040, !DIExpression(), !1039)
    #dbg_declare(ptr %t, !1041, !DIExpression(), !1045)
    #dbg_value(i32 0, !1046, !DIExpression(), !1039)
  br label %for.cond, !dbg !1047

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1049
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1038, !DIExpression(), !1039)
    #dbg_value(i32 %i.0, !1046, !DIExpression(), !1039)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1050
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1052

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1053

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1056
    #dbg_value(i32 %j.0, !1057, !DIExpression(), !1039)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1058
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1053

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1060
  %add = or disjoint i32 %mul, %j.0, !dbg !1062
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1063
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1063
    #dbg_value(i16 %0, !1064, !DIExpression(), !1039)
  %isneg = icmp slt i16 %0, 0, !dbg !1065
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1065
  %add5 = add i16 %and, %0, !dbg !1066
    #dbg_value(i16 %add5, !1064, !DIExpression(), !1039)
  %conv7 = sext i16 %add5 to i32, !dbg !1067
    #dbg_value(i32 %conv7, !1068, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1039)
    #dbg_value(i32 %conv7, !1068, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1039)
  %1 = mul i32 %conv7, 1290160, !dbg !1069
  %mul9 = add i32 %1, 134257275, !dbg !1069
    #dbg_value(i32 %mul9, !1068, !DIExpression(), !1039)
  %shr10 = lshr i32 %mul9, 28, !dbg !1070
    #dbg_value(i32 %shr10, !1068, !DIExpression(), !1039)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1071
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1072
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1073
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1074
    #dbg_value(i32 %inc, !1057, !DIExpression(), !1039)
  br label %for.cond1, !dbg !1075, !llvm.loop !1076

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1078
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1079
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1079
  %shl18 = shl i8 %3, 4, !dbg !1080
  %or = or i8 %shl18, %2, !dbg !1081
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1082
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1083
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1083
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1084
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1084
  %shl25 = shl i8 %5, 4, !dbg !1085
  %or26 = or i8 %shl25, %4, !dbg !1086
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1087
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1088
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1089
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1089
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1090
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1090
  %shl33 = shl i8 %7, 4, !dbg !1091
  %or34 = or i8 %shl33, %6, !dbg !1092
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1093
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1094
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1095
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1095
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1096
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1096
  %shl41 = shl i8 %9, 4, !dbg !1097
  %or42 = or i8 %shl41, %8, !dbg !1098
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1099
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1100
    #dbg_value(ptr %r.addr.0, !1038, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1039)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1101
    #dbg_value(ptr %add.ptr, !1038, !DIExpression(), !1039)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1102
    #dbg_value(i32 %inc46, !1046, !DIExpression(), !1039)
  br label %for.cond, !dbg !1103, !llvm.loop !1104

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1106
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1107 {
entry:
    #dbg_value(ptr %r, !1110, !DIExpression(), !1111)
    #dbg_value(ptr %a, !1112, !DIExpression(), !1111)
    #dbg_value(i32 0, !1113, !DIExpression(), !1111)
  br label %for.cond, !dbg !1114

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1116
    #dbg_value(i32 %i.0, !1113, !DIExpression(), !1111)
    #dbg_value(ptr %a.addr.0, !1112, !DIExpression(), !1111)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1117
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1119

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1120
  %1 = and i8 %0, 15, !dbg !1122
  %conv2 = zext nneg i8 %1 to i32, !dbg !1123
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1124
  %add = add nuw nsw i32 %mul, 8, !dbg !1125
  %shr = lshr i32 %add, 4, !dbg !1126
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1127
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1128
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1129
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1130
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1131
  %3 = lshr i8 %2, 4, !dbg !1132
  %conv11 = zext nneg i8 %3 to i32, !dbg !1133
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1134
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1135
  %shr14 = lshr i32 %add13, 4, !dbg !1136
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1137
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1138
  %add17 = or disjoint i32 %mul16, 1, !dbg !1139
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1140
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1141
    #dbg_value(ptr %a.addr.0, !1112, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1111)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1142
    #dbg_value(ptr %add.ptr, !1112, !DIExpression(), !1111)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1143
    #dbg_value(i32 %inc, !1113, !DIExpression(), !1111)
  br label %for.cond, !dbg !1144, !llvm.loop !1145

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1147
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1148 {
entry:
    #dbg_value(ptr %r, !1149, !DIExpression(), !1150)
    #dbg_value(ptr %a, !1151, !DIExpression(), !1150)
    #dbg_value(i32 0, !1152, !DIExpression(), !1150)
  br label %for.cond, !dbg !1153

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1155
    #dbg_value(i32 %i.0, !1152, !DIExpression(), !1150)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1156
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1158

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1159
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1161
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1161
    #dbg_value(i16 %0, !1162, !DIExpression(), !1150)
  %isneg = icmp slt i16 %0, 0, !dbg !1163
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1163
  %add = add i16 %and, %0, !dbg !1164
    #dbg_value(i16 %add, !1162, !DIExpression(), !1150)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1165
  %add4 = or disjoint i32 %mul3, 1, !dbg !1166
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1167
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1167
    #dbg_value(i16 %1, !1168, !DIExpression(), !1150)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1169
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1169
  %add10 = add i16 %and8, %1, !dbg !1170
    #dbg_value(i16 %add10, !1168, !DIExpression(), !1150)
  %conv14 = trunc i16 %add to i8, !dbg !1171
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1172
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1173
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1174
  %2 = lshr i16 %add, 8, !dbg !1175
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1175
  %conv20 = trunc i16 %add10 to i8, !dbg !1176
  %shl = shl i8 %conv20, 4, !dbg !1177
  %or = or i8 %shl, %shr19, !dbg !1178
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1179
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1180
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1180
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1181
  %4 = lshr i16 %add10, 4, !dbg !1182
  %conv27 = trunc i16 %4 to i8, !dbg !1183
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1184
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1185
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1185
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1186
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1187
    #dbg_value(i32 %inc, !1152, !DIExpression(), !1150)
  br label %for.cond, !dbg !1188, !llvm.loop !1189

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1191
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1192 {
entry:
    #dbg_value(ptr %r, !1193, !DIExpression(), !1194)
    #dbg_value(ptr %a, !1195, !DIExpression(), !1194)
    #dbg_value(i32 0, !1196, !DIExpression(), !1194)
  br label %for.cond, !dbg !1197

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1199
    #dbg_value(i32 %i.0, !1196, !DIExpression(), !1194)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1200
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1202

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1203
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1205
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1205
  %conv = zext i8 %0 to i16, !dbg !1205
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1206
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1207
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1207
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1207
  %conv5 = zext i8 %2 to i16, !dbg !1208
  %shl = shl nuw i16 %conv5, 8, !dbg !1209
  %shl.masked = and i16 %shl, 3840, !dbg !1210
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1210
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1211
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1212
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1213
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1214
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1215
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1215
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1215
  %5 = lshr i8 %4, 4, !dbg !1216
  %shr13 = zext nneg i8 %5 to i16, !dbg !1216
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1217
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1218
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1218
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1218
  %conv18 = zext i8 %7 to i16, !dbg !1219
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1220
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1221
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1222
  %add24 = or disjoint i32 %mul23, 1, !dbg !1223
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1224
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1225
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1226
    #dbg_value(i32 %inc, !1196, !DIExpression(), !1194)
  br label %for.cond, !dbg !1227, !llvm.loop !1228

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1230
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1231 {
entry:
    #dbg_value(ptr %r, !1232, !DIExpression(), !1233)
    #dbg_value(ptr %msg, !1234, !DIExpression(), !1233)
    #dbg_value(i32 0, !1235, !DIExpression(), !1233)
  br label %for.cond, !dbg !1236

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1238
    #dbg_value(i32 %i.0, !1235, !DIExpression(), !1233)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1239
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1241

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1242

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1245
    #dbg_value(i32 %j.0, !1246, !DIExpression(), !1233)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1247
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1242

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1249
  %add = or disjoint i32 %mul, %j.0, !dbg !1251
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1252
  store i16 0, ptr %arrayidx, align 2, !dbg !1253
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1254
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1254
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1255
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1256
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1256
  %conv = zext i8 %0 to i32, !dbg !1256
  %shr = lshr i32 %conv, %j.0, !dbg !1257
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1258
  %conv7 = and i16 %1, 1, !dbg !1258
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1259
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1260
    #dbg_value(i32 %inc, !1246, !DIExpression(), !1233)
  br label %for.cond1, !dbg !1261, !llvm.loop !1262

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1264
    #dbg_value(i32 %inc9, !1235, !DIExpression(), !1233)
  br label %for.cond, !dbg !1265, !llvm.loop !1266

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1268
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1269 {
entry:
    #dbg_value(ptr %msg, !1270, !DIExpression(), !1271)
    #dbg_value(ptr %a, !1272, !DIExpression(), !1271)
    #dbg_value(i32 0, !1273, !DIExpression(), !1271)
  br label %for.cond, !dbg !1274

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1276
    #dbg_value(i32 %i.0, !1273, !DIExpression(), !1271)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1277
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1279

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1280
  store i8 0, ptr %arrayidx, align 1, !dbg !1282
    #dbg_value(i32 0, !1283, !DIExpression(), !1271)
  br label %for.cond1, !dbg !1284

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1286
    #dbg_value(i32 %j.0, !1283, !DIExpression(), !1271)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1287
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1289

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1290
  %add = or disjoint i32 %mul, %j.0, !dbg !1292
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1293
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1293
  %conv = sext i16 %0 to i32, !dbg !1293
    #dbg_value(i32 %conv, !1294, !DIExpression(), !1271)
    #dbg_value(i32 %conv, !1294, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1271)
    #dbg_value(i32 %conv, !1294, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1271)
  %1 = mul i32 %conv, 161270, !dbg !1295
  %mul6 = add i32 %1, 134257275, !dbg !1295
    #dbg_value(i32 %mul6, !1294, !DIExpression(), !1271)
  %shr = lshr i32 %mul6, 28, !dbg !1296
    #dbg_value(i32 %shr, !1294, !DIExpression(), !1271)
  %and = and i32 %shr, 1, !dbg !1297
    #dbg_value(i32 %and, !1294, !DIExpression(), !1271)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1298
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1299
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1300
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1300
  %conv10 = or i8 %2, %3, !dbg !1300
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1300
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1301
    #dbg_value(i32 %inc, !1283, !DIExpression(), !1271)
  br label %for.cond1, !dbg !1302, !llvm.loop !1303

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1305
    #dbg_value(i32 %inc12, !1273, !DIExpression(), !1271)
  br label %for.cond, !dbg !1306, !llvm.loop !1307

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1309
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1310 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1313, !DIExpression(), !1314)
    #dbg_value(ptr %seed, !1315, !DIExpression(), !1314)
    #dbg_value(i8 %nonce, !1316, !DIExpression(), !1314)
    #dbg_declare(ptr %buf, !1317, !DIExpression(), !1321)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1322
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1323
  ret void, !dbg !1324
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1325 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1326, !DIExpression(), !1327)
    #dbg_value(ptr %seed, !1328, !DIExpression(), !1327)
    #dbg_value(i8 %nonce, !1329, !DIExpression(), !1327)
    #dbg_declare(ptr %buf, !1330, !DIExpression(), !1332)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1333
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1334
  ret void, !dbg !1335
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1336 {
entry:
    #dbg_value(ptr %r, !1339, !DIExpression(), !1340)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #3, !dbg !1341
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !1342
  ret void, !dbg !1343
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1344 {
entry:
    #dbg_value(ptr %r, !1345, !DIExpression(), !1346)
    #dbg_value(i32 0, !1347, !DIExpression(), !1346)
  br label %for.cond, !dbg !1348

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1350
    #dbg_value(i32 %i.0, !1347, !DIExpression(), !1346)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1351
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1353

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1354
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1354
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1355
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1356
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1357
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1358
    #dbg_value(i32 %inc, !1347, !DIExpression(), !1346)
  br label %for.cond, !dbg !1359, !llvm.loop !1360

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1362
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1363 {
entry:
    #dbg_value(ptr %r, !1364, !DIExpression(), !1365)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #3, !dbg !1366
  ret void, !dbg !1367
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1368 {
entry:
    #dbg_value(ptr %r, !1371, !DIExpression(), !1372)
    #dbg_value(ptr %a, !1373, !DIExpression(), !1372)
    #dbg_value(ptr %b, !1374, !DIExpression(), !1372)
    #dbg_value(i32 0, !1375, !DIExpression(), !1372)
  br label %for.cond, !dbg !1376

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1378
    #dbg_value(i32 %i.0, !1375, !DIExpression(), !1372)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1379
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1381

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1382
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1384
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1385
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1386
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1387
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1388
  %add = or disjoint i32 %i.0, 64, !dbg !1389
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1390
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1390
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1391
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1392
  %add7 = or disjoint i32 %mul6, 2, !dbg !1393
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1394
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1395
  %add10 = or disjoint i32 %mul9, 2, !dbg !1396
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1397
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1398
  %add13 = or disjoint i32 %mul12, 2, !dbg !1399
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1400
  %add15 = or disjoint i32 %i.0, 64, !dbg !1401
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add15, !dbg !1402
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1402
  %sub = sub i16 0, %1, !dbg !1403
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1404
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1405
    #dbg_value(i32 %inc, !1375, !DIExpression(), !1372)
  br label %for.cond, !dbg !1406, !llvm.loop !1407

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1409
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1410 {
entry:
    #dbg_value(ptr %r, !1411, !DIExpression(), !1412)
    #dbg_value(i16 1353, !1413, !DIExpression(), !1412)
    #dbg_value(i32 0, !1414, !DIExpression(), !1412)
  br label %for.cond, !dbg !1415

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1417
    #dbg_value(i32 %i.0, !1414, !DIExpression(), !1412)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1418
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1420

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1421
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1421
  %conv = sext i16 %0 to i32, !dbg !1422
  %mul = mul nsw i32 %conv, 1353, !dbg !1423
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1424
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1425
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1426
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1427
    #dbg_value(i32 %inc, !1414, !DIExpression(), !1412)
  br label %for.cond, !dbg !1428, !llvm.loop !1429

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1431
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1432 {
entry:
    #dbg_value(ptr %r, !1433, !DIExpression(), !1434)
    #dbg_value(ptr %a, !1435, !DIExpression(), !1434)
    #dbg_value(ptr %b, !1436, !DIExpression(), !1434)
    #dbg_value(i32 0, !1437, !DIExpression(), !1434)
  br label %for.cond, !dbg !1438

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1440
    #dbg_value(i32 %i.0, !1437, !DIExpression(), !1434)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1441
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1443

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1444
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1444
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1445
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1445
  %add = add i16 %0, %1, !dbg !1446
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1447
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1448
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1449
    #dbg_value(i32 %inc, !1437, !DIExpression(), !1434)
  br label %for.cond, !dbg !1450, !llvm.loop !1451

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1453
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1454 {
entry:
    #dbg_value(ptr %r, !1455, !DIExpression(), !1456)
    #dbg_value(ptr %a, !1457, !DIExpression(), !1456)
    #dbg_value(ptr %b, !1458, !DIExpression(), !1456)
    #dbg_value(i32 0, !1459, !DIExpression(), !1456)
  br label %for.cond, !dbg !1460

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1462
    #dbg_value(i32 %i.0, !1459, !DIExpression(), !1456)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1463
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1465

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1466
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1466
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1467
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1467
  %sub = sub i16 %0, %1, !dbg !1468
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1469
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1470
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1471
    #dbg_value(i32 %inc, !1459, !DIExpression(), !1456)
  br label %for.cond, !dbg !1472, !llvm.loop !1473

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1475
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1476 {
entry:
    #dbg_value(ptr %r, !1479, !DIExpression(), !1480)
    #dbg_value(i32 1, !1481, !DIExpression(), !1480)
    #dbg_value(i32 128, !1482, !DIExpression(), !1480)
  br label %for.cond, !dbg !1483

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1485
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1486
    #dbg_value(i32 %k.0, !1481, !DIExpression(), !1480)
    #dbg_value(i32 %len.0, !1482, !DIExpression(), !1480)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1487
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1489

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1490

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1493
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1480
    #dbg_value(i32 %k.1, !1481, !DIExpression(), !1480)
    #dbg_value(i32 %start.0, !1494, !DIExpression(), !1480)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1495
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1490

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1481, !DIExpression(), !1480)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1497
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1497
    #dbg_value(i16 %0, !1499, !DIExpression(), !1480)
    #dbg_value(i32 %start.0, !1500, !DIExpression(), !1480)
  br label %for.cond4, !dbg !1501

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1503
    #dbg_value(i32 %j.0, !1500, !DIExpression(), !1480)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1504
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1506
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1507

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1508
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1508
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1508
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1510
    #dbg_value(i16 %call, !1511, !DIExpression(), !1480)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1512
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1512
  %sub = sub i16 %3, %call, !dbg !1513
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1514
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1514
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1515
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1516
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1516
  %add17 = add i16 %5, %call, !dbg !1517
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1518
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1519
  %inc20 = add nuw i32 %j.0, 1, !dbg !1520
    #dbg_value(i32 %inc20, !1500, !DIExpression(), !1480)
  br label %for.cond4, !dbg !1521, !llvm.loop !1522

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1503
  %inc = add i32 %k.1, 1, !dbg !1524
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1525
    #dbg_value(i32 %add22, !1494, !DIExpression(), !1480)
  br label %for.cond1, !dbg !1526, !llvm.loop !1527

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1480
  %shr = lshr i32 %len.0, 1, !dbg !1529
    #dbg_value(i32 %shr, !1482, !DIExpression(), !1480)
  br label %for.cond, !dbg !1530, !llvm.loop !1531

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1533
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1534 {
entry:
    #dbg_value(i16 %a, !1537, !DIExpression(), !1538)
    #dbg_value(i16 %b, !1539, !DIExpression(), !1538)
  %conv = sext i16 %a to i32, !dbg !1540
  %conv1 = sext i16 %b to i32, !dbg !1541
  %mul = mul nsw i32 %conv, %conv1, !dbg !1542
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1543
  ret i16 %call, !dbg !1544
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1545 {
entry:
    #dbg_value(ptr %r, !1546, !DIExpression(), !1547)
    #dbg_value(i16 1441, !1548, !DIExpression(), !1547)
    #dbg_value(i32 127, !1549, !DIExpression(), !1547)
    #dbg_value(i32 2, !1550, !DIExpression(), !1547)
  br label %for.cond, !dbg !1551

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1553
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1554
    #dbg_value(i32 %k.0, !1549, !DIExpression(), !1547)
    #dbg_value(i32 %len.0, !1550, !DIExpression(), !1547)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1555
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1557

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1558

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1561

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1563
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1547
    #dbg_value(i32 %k.1, !1549, !DIExpression(), !1547)
    #dbg_value(i32 %start.0, !1564, !DIExpression(), !1547)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1565
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1558

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1549, !DIExpression(), !1547)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1567
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1567
    #dbg_value(i16 %0, !1569, !DIExpression(), !1547)
    #dbg_value(i32 %start.0, !1570, !DIExpression(), !1547)
  br label %for.cond4, !dbg !1571

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1573
    #dbg_value(i32 %j.0, !1570, !DIExpression(), !1547)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1574
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1576
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1577

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1578
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1578
    #dbg_value(i16 %1, !1580, !DIExpression(), !1547)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1581
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1581
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1581
  %add11 = add i16 %1, %3, !dbg !1582
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1583
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1584
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1585
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1586
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1586
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1586
  %sub = sub i16 %5, %1, !dbg !1587
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1588
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1588
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1589
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1590
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1590
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1590
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1591
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1592
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1592
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1593
  %inc = add nuw i32 %j.0, 1, !dbg !1594
    #dbg_value(i32 %inc, !1570, !DIExpression(), !1547)
  br label %for.cond4, !dbg !1595, !llvm.loop !1596

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1573
  %dec = add i32 %k.1, -1, !dbg !1598
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1599
    #dbg_value(i32 %add27, !1564, !DIExpression(), !1547)
  br label %for.cond1, !dbg !1600, !llvm.loop !1601

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1547
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1603
    #dbg_value(i32 %shl, !1550, !DIExpression(), !1547)
  br label %for.cond, !dbg !1604, !llvm.loop !1605

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1607
    #dbg_value(i32 %j.1, !1570, !DIExpression(), !1547)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1608
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1561

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1610
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1610
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1611
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1612
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1613
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1614
    #dbg_value(i32 %inc39, !1570, !DIExpression(), !1547)
  br label %for.cond31, !dbg !1615, !llvm.loop !1616

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1618
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1619 {
entry:
    #dbg_value(ptr %r, !1623, !DIExpression(), !1624)
    #dbg_value(ptr %a, !1625, !DIExpression(), !1624)
    #dbg_value(ptr %b, !1626, !DIExpression(), !1624)
    #dbg_value(i16 %zeta, !1627, !DIExpression(), !1624)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1628
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1628
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1629
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1629
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1630
  store i16 %call, ptr %r, align 2, !dbg !1631
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1632
  store i16 %call4, ptr %r, align 2, !dbg !1633
  %2 = load i16, ptr %a, align 2, !dbg !1634
  %3 = load i16, ptr %b, align 2, !dbg !1635
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1636
  %4 = load i16, ptr %r, align 2, !dbg !1637
  %add = add i16 %4, %call8, !dbg !1637
  store i16 %add, ptr %r, align 2, !dbg !1637
  %5 = load i16, ptr %a, align 2, !dbg !1638
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1639
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1639
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1640
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1641
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1642
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1643
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1643
  %8 = load i16, ptr %b, align 2, !dbg !1644
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1645
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1646
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1647
  %add22 = add i16 %9, %call18, !dbg !1647
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1647
  ret void, !dbg !1648
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1649 {
entry:
    #dbg_value(ptr %r, !1651, !DIExpression(), !1652)
    #dbg_value(ptr %buf, !1653, !DIExpression(), !1652)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #3, !dbg !1654
  ret void, !dbg !1655
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1656 {
entry:
    #dbg_value(ptr %r, !1657, !DIExpression(), !1658)
    #dbg_value(ptr %buf, !1659, !DIExpression(), !1658)
    #dbg_value(i32 0, !1660, !DIExpression(), !1658)
  br label %for.cond, !dbg !1661

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1663
    #dbg_value(i32 %i.0, !1660, !DIExpression(), !1658)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !1664
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !1666

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1667
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1669
  %call = call fastcc i32 @load24_littleendian(ptr noundef %add.ptr) #3, !dbg !1670
    #dbg_value(i32 %call, !1671, !DIExpression(), !1658)
  %and = and i32 %call, 2396745, !dbg !1672
    #dbg_value(i32 %and, !1673, !DIExpression(), !1658)
  %shr = lshr i32 %call, 1, !dbg !1674
  %and1 = and i32 %shr, 2396745, !dbg !1675
  %add = add nuw nsw i32 %and, %and1, !dbg !1676
    #dbg_value(i32 %add, !1673, !DIExpression(), !1658)
  %shr2 = lshr i32 %call, 2, !dbg !1677
  %and3 = and i32 %shr2, 2396745, !dbg !1678
  %add4 = add nuw nsw i32 %add, %and3, !dbg !1679
    #dbg_value(i32 %add4, !1673, !DIExpression(), !1658)
    #dbg_value(i32 0, !1680, !DIExpression(), !1658)
  br label %for.cond5, !dbg !1681

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !1683
    #dbg_value(i32 %j.0, !1680, !DIExpression(), !1658)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !1684
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !1686

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !1687
  %shr10 = lshr i32 %add4, %mul8, !dbg !1689
  %conv = and i32 %shr10, 7, !dbg !1690
    #dbg_value(i32 %shr10, !1691, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1658)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !1692
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !1693
  %shr14 = lshr i32 %add4, %add13, !dbg !1694
  %conv16 = and i32 %shr14, 7, !dbg !1695
    #dbg_value(i32 %conv16, !1696, !DIExpression(), !1658)
  %sub = sub nsw i32 %conv, %conv16, !dbg !1697
  %conv19 = trunc nsw i32 %sub to i16, !dbg !1698
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !1699
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !1700
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !1701
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1702
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1703
    #dbg_value(i32 %inc, !1680, !DIExpression(), !1658)
  br label %for.cond5, !dbg !1704, !llvm.loop !1705

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !1707
    #dbg_value(i32 %inc23, !1660, !DIExpression(), !1658)
  br label %for.cond, !dbg !1708, !llvm.loop !1709

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !1711
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 16777216) i32 @load24_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1712 {
entry:
    #dbg_value(ptr %x, !1715, !DIExpression(), !1716)
  %0 = load i8, ptr %x, align 1, !dbg !1717
  %conv = zext i8 %0 to i32, !dbg !1718
    #dbg_value(i32 %conv, !1719, !DIExpression(), !1716)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1720
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1720
  %conv2 = zext i8 %1 to i32, !dbg !1721
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1722
  %or = or disjoint i32 %shl, %conv, !dbg !1723
    #dbg_value(i32 %or, !1719, !DIExpression(), !1716)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1724
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1724
  %conv4 = zext i8 %2 to i32, !dbg !1725
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1726
  %or6 = or disjoint i32 %or, %shl5, !dbg !1727
    #dbg_value(i32 %or6, !1719, !DIExpression(), !1716)
  ret i32 %or6, !dbg !1728
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1729 {
entry:
    #dbg_value(ptr %r, !1730, !DIExpression(), !1731)
    #dbg_value(ptr %buf, !1732, !DIExpression(), !1731)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1733
  ret void, !dbg !1734
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1735 {
entry:
    #dbg_value(ptr %r, !1736, !DIExpression(), !1737)
    #dbg_value(ptr %buf, !1738, !DIExpression(), !1737)
    #dbg_value(i32 0, !1739, !DIExpression(), !1737)
  br label %for.cond, !dbg !1740

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1742
    #dbg_value(i32 %i.0, !1739, !DIExpression(), !1737)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1743
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1745

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1746
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1748
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1749
    #dbg_value(i32 %call, !1750, !DIExpression(), !1737)
  %and = and i32 %call, 1431655765, !dbg !1751
    #dbg_value(i32 %and, !1752, !DIExpression(), !1737)
  %shr = lshr i32 %call, 1, !dbg !1753
  %and1 = and i32 %shr, 1431655765, !dbg !1754
  %add = add nuw i32 %and, %and1, !dbg !1755
    #dbg_value(i32 %add, !1752, !DIExpression(), !1737)
    #dbg_value(i32 0, !1756, !DIExpression(), !1737)
  br label %for.cond2, !dbg !1757

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1759
    #dbg_value(i32 %j.0, !1756, !DIExpression(), !1737)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1760
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1762

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1763
  %shr7 = lshr i32 %add, %mul5, !dbg !1765
  %conv = and i32 %shr7, 3, !dbg !1766
    #dbg_value(i32 %shr7, !1767, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1737)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1768
  %add10 = or disjoint i32 %mul9, 2, !dbg !1769
  %shr11 = lshr i32 %add, %add10, !dbg !1770
  %conv13 = and i32 %shr11, 3, !dbg !1771
    #dbg_value(i32 %conv13, !1772, !DIExpression(), !1737)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1773
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1774
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1775
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1776
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1777
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1778
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1779
    #dbg_value(i32 %inc, !1756, !DIExpression(), !1737)
  br label %for.cond2, !dbg !1780, !llvm.loop !1781

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1783
    #dbg_value(i32 %inc20, !1739, !DIExpression(), !1737)
  br label %for.cond, !dbg !1784, !llvm.loop !1785

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1787
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1788 {
entry:
    #dbg_value(ptr %x, !1789, !DIExpression(), !1790)
  %0 = load i8, ptr %x, align 1, !dbg !1791
  %conv = zext i8 %0 to i32, !dbg !1792
    #dbg_value(i32 %conv, !1793, !DIExpression(), !1790)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1794
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1794
  %conv2 = zext i8 %1 to i32, !dbg !1795
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1796
  %or = or disjoint i32 %shl, %conv, !dbg !1797
    #dbg_value(i32 %or, !1793, !DIExpression(), !1790)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1798
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1798
  %conv4 = zext i8 %2 to i32, !dbg !1799
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1800
  %or6 = or disjoint i32 %or, %shl5, !dbg !1801
    #dbg_value(i32 %or6, !1793, !DIExpression(), !1790)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1802
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1802
  %conv8 = zext i8 %3 to i32, !dbg !1803
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1804
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1805
    #dbg_value(i32 %or10, !1793, !DIExpression(), !1790)
  ret i32 %or10, !dbg !1806
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1807 {
entry:
    #dbg_value(i32 %a, !1810, !DIExpression(), !1811)
    #dbg_value(i32 %a, !1812, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1811)
  %sext = mul i32 %a, -218038272, !dbg !1813
  %conv3 = ashr exact i32 %sext, 16, !dbg !1813
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1814
  %sub = add i32 %mul4.neg, %a, !dbg !1815
  %shr = lshr i32 %sub, 16, !dbg !1816
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1817
    #dbg_value(i16 %conv5, !1812, !DIExpression(), !1811)
  ret i16 %conv5, !dbg !1818
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1819 {
entry:
    #dbg_value(i16 %a, !1822, !DIExpression(), !1823)
    #dbg_value(i16 20159, !1824, !DIExpression(), !1823)
  %conv = sext i16 %a to i32, !dbg !1825
  %mul = mul nsw i32 %conv, 20159, !dbg !1826
  %add = add nsw i32 %mul, 33554432, !dbg !1827
  %shr = ashr i32 %add, 26, !dbg !1828
    #dbg_value(i32 %shr, !1829, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1823)
    #dbg_value(i32 %shr, !1829, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1823)
  %0 = trunc nsw i32 %shr to i16, !dbg !1830
  %1 = mul i16 %0, -3329, !dbg !1830
  %conv7 = add i16 %1, %a, !dbg !1830
  ret i16 %conv7, !dbg !1831
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1832 {
entry:
    #dbg_value(ptr %a, !1836, !DIExpression(), !1837)
    #dbg_value(ptr %b, !1838, !DIExpression(), !1837)
    #dbg_value(i32 %len, !1839, !DIExpression(), !1837)
    #dbg_value(i8 0, !1840, !DIExpression(), !1837)
    #dbg_value(i32 0, !1841, !DIExpression(), !1837)
  br label %for.cond, !dbg !1842

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1844
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1837
    #dbg_value(i8 %r.0, !1840, !DIExpression(), !1837)
    #dbg_value(i32 %i.0, !1841, !DIExpression(), !1837)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1845
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1847

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1837)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1848
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1848
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1849
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1849
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1837)
  %xor1 = xor i8 %0, %1, !dbg !1850
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1840, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1837)
  %or2 = or i8 %r.0, %xor1, !dbg !1851
    #dbg_value(i8 %or2, !1840, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1837)
    #dbg_value(i8 %or2, !1840, !DIExpression(), !1837)
  %inc = add i32 %i.0, 1, !dbg !1852
    #dbg_value(i32 %inc, !1841, !DIExpression(), !1837)
  br label %for.cond, !dbg !1853, !llvm.loop !1854

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1837
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1856
  %conv6 = zext i1 %2 to i32, !dbg !1857
  ret i32 %conv6, !dbg !1858
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1859 {
entry:
    #dbg_value(ptr %r, !1862, !DIExpression(), !1863)
    #dbg_value(ptr %x, !1864, !DIExpression(), !1863)
    #dbg_value(i32 %len, !1865, !DIExpression(), !1863)
    #dbg_value(i8 %b, !1866, !DIExpression(), !1863)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1867, !srcloc !1868
    #dbg_value(i8 %0, !1866, !DIExpression(), !1863)
  %sub = sub i8 0, %0, !dbg !1869
    #dbg_value(i8 %sub, !1866, !DIExpression(), !1863)
    #dbg_value(i32 0, !1870, !DIExpression(), !1863)
  br label %for.cond, !dbg !1871

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1873
    #dbg_value(i32 %i.0, !1870, !DIExpression(), !1863)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1874
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1876

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1877
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1877
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1878
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1878
  %xor1 = xor i8 %1, %2, !dbg !1879
  %and2 = and i8 %xor1, %sub, !dbg !1880
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1881
  %xor93 = xor i8 %1, %and2, !dbg !1882
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1882
  %inc = add i32 %i.0, 1, !dbg !1883
    #dbg_value(i32 %inc, !1870, !DIExpression(), !1863)
  br label %for.cond, !dbg !1884, !llvm.loop !1885

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1887
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1888 {
entry:
    #dbg_value(ptr %r, !1891, !DIExpression(), !1892)
    #dbg_value(i16 %v, !1893, !DIExpression(), !1892)
    #dbg_value(i16 %b, !1894, !DIExpression(), !1892)
  %sub = sub i16 0, %b, !dbg !1895
    #dbg_value(i16 %sub, !1894, !DIExpression(), !1892)
  %0 = load i16, ptr %r, align 2, !dbg !1896
  %xor1 = xor i16 %0, %v, !dbg !1897
  %and = and i16 %xor1, %sub, !dbg !1898
  %xor6 = xor i16 %and, %0, !dbg !1899
  store i16 %xor6, ptr %r, align 2, !dbg !1899
  ret void, !dbg !1900
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1901 {
entry:
    #dbg_value(ptr %state, !1905, !DIExpression(), !1906)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1907
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1908
  store i64 0, ptr %arrayidx, align 8, !dbg !1909
  ret void, !dbg !1910
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1911 {
entry:
    #dbg_value(ptr %s, !1915, !DIExpression(), !1916)
    #dbg_value(i32 0, !1917, !DIExpression(), !1916)
  br label %for.cond, !dbg !1918

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1920
    #dbg_value(i32 %i.0, !1917, !DIExpression(), !1916)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1921
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1923

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1924
  store i64 0, ptr %arrayidx, align 8, !dbg !1925
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1926
    #dbg_value(i32 %inc, !1917, !DIExpression(), !1916)
  br label %for.cond, !dbg !1927, !llvm.loop !1928

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1930
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1931 {
entry:
    #dbg_value(ptr %state, !1934, !DIExpression(), !1935)
    #dbg_value(ptr %in, !1936, !DIExpression(), !1935)
    #dbg_value(i32 %inlen, !1937, !DIExpression(), !1935)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1938
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1938
  %conv = trunc i64 %0 to i32, !dbg !1938
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1939
  %conv1 = zext i32 %call to i64, !dbg !1939
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1940
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1941
  ret void, !dbg !1942
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1943 {
entry:
    #dbg_value(ptr %s, !1946, !DIExpression(), !1947)
    #dbg_value(i32 %pos, !1948, !DIExpression(), !1947)
    #dbg_value(i32 %r, !1949, !DIExpression(), !1947)
    #dbg_value(ptr %in, !1950, !DIExpression(), !1947)
    #dbg_value(i32 %inlen, !1951, !DIExpression(), !1947)
  br label %while.cond, !dbg !1952

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1948, !DIExpression(), !1947)
    #dbg_value(i32 %inlen.addr.0, !1951, !DIExpression(), !1947)
    #dbg_value(ptr %in.addr.0, !1950, !DIExpression(), !1947)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1953
  %cmp.not = icmp ult i32 %add, %r, !dbg !1954
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1952

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1955
  br label %for.cond, !dbg !1955

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1958

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1960
    #dbg_value(i32 %i.0, !1961, !DIExpression(), !1947)
    #dbg_value(ptr %in.addr.1, !1950, !DIExpression(), !1947)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1962
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1955

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1950, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1947)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1964
  %conv = zext i8 %0 to i64, !dbg !1965
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1966
  %mul = and i32 %rem, 56, !dbg !1966
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1967
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1967
  %div2 = lshr i32 %i.0, 3, !dbg !1968
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1969
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1970
  %xor = xor i64 %1, %shl, !dbg !1970
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1970
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1971
    #dbg_value(ptr %incdec.ptr, !1950, !DIExpression(), !1947)
  %inc = add i32 %i.0, 1, !dbg !1972
    #dbg_value(i32 %inc, !1961, !DIExpression(), !1947)
  br label %for.cond, !dbg !1973, !llvm.loop !1974

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1976
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1977
    #dbg_value(i32 %sub2, !1951, !DIExpression(), !1947)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1978
    #dbg_value(i32 0, !1948, !DIExpression(), !1947)
  br label %while.cond, !dbg !1952, !llvm.loop !1979

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1981
    #dbg_value(i32 %i.1, !1961, !DIExpression(), !1947)
    #dbg_value(ptr %in.addr.2, !1950, !DIExpression(), !1947)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1982
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1984
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1958

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1950, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1947)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1985
  %conv9 = zext i8 %2 to i64, !dbg !1986
  %rem10 = shl i32 %i.1, 3, !dbg !1987
  %mul11 = and i32 %rem10, 56, !dbg !1987
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1988
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1988
  %div141 = lshr i32 %i.1, 3, !dbg !1989
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1990
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1991
  %xor16 = xor i64 %3, %shl13, !dbg !1991
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1991
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1992
    #dbg_value(ptr %incdec.ptr8, !1950, !DIExpression(), !1947)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1993
    #dbg_value(i32 %inc18, !1961, !DIExpression(), !1947)
  br label %for.cond3, !dbg !1994, !llvm.loop !1995

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1981
  ret i32 %i.1.lcssa, !dbg !1997
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1998 {
entry:
    #dbg_value(ptr %state, !1999, !DIExpression(), !2000)
  %0 = load i64, ptr %state, align 8, !dbg !2001
    #dbg_value(i64 %0, !2002, !DIExpression(), !2000)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2003
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2003
    #dbg_value(i64 %1, !2004, !DIExpression(), !2000)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2005
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2005
    #dbg_value(i64 %2, !2006, !DIExpression(), !2000)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2007
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2007
    #dbg_value(i64 %3, !2008, !DIExpression(), !2000)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2009
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2009
    #dbg_value(i64 %4, !2010, !DIExpression(), !2000)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2011
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2011
    #dbg_value(i64 %5, !2012, !DIExpression(), !2000)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2013
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2013
    #dbg_value(i64 %6, !2014, !DIExpression(), !2000)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2015
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2015
    #dbg_value(i64 %7, !2016, !DIExpression(), !2000)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2017
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2017
    #dbg_value(i64 %8, !2018, !DIExpression(), !2000)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2019
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2019
    #dbg_value(i64 %9, !2020, !DIExpression(), !2000)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2021
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2021
    #dbg_value(i64 %10, !2022, !DIExpression(), !2000)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2023
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2023
    #dbg_value(i64 %11, !2024, !DIExpression(), !2000)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2025
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2025
    #dbg_value(i64 %12, !2026, !DIExpression(), !2000)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2027
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2027
    #dbg_value(i64 %13, !2028, !DIExpression(), !2000)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2029
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2029
    #dbg_value(i64 %14, !2030, !DIExpression(), !2000)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2031
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2031
    #dbg_value(i64 %15, !2032, !DIExpression(), !2000)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2033
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2033
    #dbg_value(i64 %16, !2034, !DIExpression(), !2000)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2035
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2035
    #dbg_value(i64 %17, !2036, !DIExpression(), !2000)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2037
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2037
    #dbg_value(i64 %18, !2038, !DIExpression(), !2000)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2039
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2039
    #dbg_value(i64 %19, !2040, !DIExpression(), !2000)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2041
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2041
    #dbg_value(i64 %20, !2042, !DIExpression(), !2000)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2043
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2043
    #dbg_value(i64 %21, !2044, !DIExpression(), !2000)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2045
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2045
    #dbg_value(i64 %22, !2046, !DIExpression(), !2000)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2047
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2047
    #dbg_value(i64 %23, !2048, !DIExpression(), !2000)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2049
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2049
    #dbg_value(i64 %24, !2050, !DIExpression(), !2000)
    #dbg_value(i32 0, !2051, !DIExpression(), !2000)
  br label %for.cond, !dbg !2052

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2000
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2000
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2000
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2000
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2000
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2000
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2000
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2000
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2000
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2000
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2000
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2000
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2000
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2000
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2000
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2000
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2000
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2000
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2000
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2000
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2000
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2000
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2000
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2000
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2054
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2000
    #dbg_value(i64 %Asu.0, !2050, !DIExpression(), !2000)
    #dbg_value(i32 %round.0, !2051, !DIExpression(), !2000)
    #dbg_value(i64 %Aba.0, !2002, !DIExpression(), !2000)
    #dbg_value(i64 %Abe.0, !2004, !DIExpression(), !2000)
    #dbg_value(i64 %Abi.0, !2006, !DIExpression(), !2000)
    #dbg_value(i64 %Abo.0, !2008, !DIExpression(), !2000)
    #dbg_value(i64 %Abu.0, !2010, !DIExpression(), !2000)
    #dbg_value(i64 %Aga.0, !2012, !DIExpression(), !2000)
    #dbg_value(i64 %Age.0, !2014, !DIExpression(), !2000)
    #dbg_value(i64 %Agi.0, !2016, !DIExpression(), !2000)
    #dbg_value(i64 %Ago.0, !2018, !DIExpression(), !2000)
    #dbg_value(i64 %Agu.0, !2020, !DIExpression(), !2000)
    #dbg_value(i64 %Aka.0, !2022, !DIExpression(), !2000)
    #dbg_value(i64 %Ake.0, !2024, !DIExpression(), !2000)
    #dbg_value(i64 %Aki.0, !2026, !DIExpression(), !2000)
    #dbg_value(i64 %Ako.0, !2028, !DIExpression(), !2000)
    #dbg_value(i64 %Aku.0, !2030, !DIExpression(), !2000)
    #dbg_value(i64 %Ama.0, !2032, !DIExpression(), !2000)
    #dbg_value(i64 %Ame.0, !2034, !DIExpression(), !2000)
    #dbg_value(i64 %Ami.0, !2036, !DIExpression(), !2000)
    #dbg_value(i64 %Amo.0, !2038, !DIExpression(), !2000)
    #dbg_value(i64 %Amu.0, !2040, !DIExpression(), !2000)
    #dbg_value(i64 %Asa.0, !2042, !DIExpression(), !2000)
    #dbg_value(i64 %Ase.0, !2044, !DIExpression(), !2000)
    #dbg_value(i64 %Asi.0, !2046, !DIExpression(), !2000)
    #dbg_value(i64 %Aso.0, !2048, !DIExpression(), !2000)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2055
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2057

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 poison, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2093
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2095
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2096
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2097
    #dbg_value(i64 %xor35, !2060, !DIExpression(), !2000)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2098
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2099
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2100
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2101
    #dbg_value(i64 %xor43, !2062, !DIExpression(), !2000)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2102
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2103
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 %xor57, !2066, !DIExpression(), !2000)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2104
    #dbg_value(i64 %xor203, !2018, !DIExpression(), !2000)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2105
    #dbg_value(i64 %xor206, !2059, !DIExpression(), !2000)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2106
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2107
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2108
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2109
    #dbg_value(i64 %xor31, !2059, !DIExpression(), !2000)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2110
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2111
    #dbg_value(i64 %xor45, !2063, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2112
    #dbg_value(i64 %xor211, !2032, !DIExpression(), !2000)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2113
    #dbg_value(i64 %xor214, !2061, !DIExpression(), !2000)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2115
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2116
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2117
    #dbg_value(i64 %xor39, !2061, !DIExpression(), !2000)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2118
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2119
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2121
    #dbg_value(i64 %xor27, !2058, !DIExpression(), !2000)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2122
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2123
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 %xor61, !2067, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2124
    #dbg_value(i64 %xor207, !2030, !DIExpression(), !2000)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2125
    #dbg_value(i64 %xor210, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not222 = xor i64 %xor210, -1, !dbg !2126
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and223 = and i64 %xor214, %not222, !dbg !2127
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor224 = xor i64 %xor206, %and223, !dbg !2128
    #dbg_value(i64 %xor224, !2089, !DIExpression(), !2000)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2129
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2130
    #dbg_value(i64 %xor53, !2065, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2131
    #dbg_value(i64 %xor67, !2026, !DIExpression(), !2000)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2132
    #dbg_value(i64 %xor70, !2060, !DIExpression(), !2000)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2133
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2134
    #dbg_value(i64 %xor49, !2064, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2135
    #dbg_value(i64 %xor63, !2014, !DIExpression(), !2000)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2136
    #dbg_value(i64 %xor66, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not = xor i64 %xor66, -1, !dbg !2137
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and = and i64 %xor70, %not, !dbg !2138
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2139
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2139
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %26 = xor i64 %and, %25, !dbg !2140
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2141
    #dbg_value(i64 %xor62, !2002, !DIExpression(), !2000)
    #dbg_value(i64 %xor62, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor81 = xor i64 %26, %xor62, !dbg !2140
    #dbg_value(i64 %xor81, !2068, !DIExpression(), !2000)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2142
    #dbg_value(i64 %xor94, !2008, !DIExpression(), !2000)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2143
    #dbg_value(i64 %xor97, !2058, !DIExpression(), !2000)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2144
    #dbg_value(i64 %xor102, !2022, !DIExpression(), !2000)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2145
    #dbg_value(i64 %xor105, !2060, !DIExpression(), !2000)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2146
    #dbg_value(i64 %xor98, !2020, !DIExpression(), !2000)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2147
    #dbg_value(i64 %xor101, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not114 = xor i64 %xor101, -1, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and115 = and i64 %xor105, %not114, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor116 = xor i64 %xor97, %and115, !dbg !2150
    #dbg_value(i64 %xor116, !2073, !DIExpression(), !2000)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2151
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2152
    #dbg_value(i64 %xor129, !2004, !DIExpression(), !2000)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2153
    #dbg_value(i64 %xor132, !2058, !DIExpression(), !2000)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2154
    #dbg_value(i64 %xor137, !2028, !DIExpression(), !2000)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2155
    #dbg_value(i64 %xor140, !2060, !DIExpression(), !2000)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2156
    #dbg_value(i64 %xor133, !2016, !DIExpression(), !2000)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2157
    #dbg_value(i64 %xor136, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not149 = xor i64 %xor136, -1, !dbg !2158
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and150 = and i64 %xor140, %not149, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor151 = xor i64 %xor132, %and150, !dbg !2160
    #dbg_value(i64 %xor151, !2078, !DIExpression(), !2000)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2161
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2162
    #dbg_value(i64 %xor164, !2010, !DIExpression(), !2000)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2163
    #dbg_value(i64 %xor167, !2058, !DIExpression(), !2000)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2164
    #dbg_value(i64 %xor172, !2024, !DIExpression(), !2000)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2165
    #dbg_value(i64 %xor175, !2060, !DIExpression(), !2000)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2166
    #dbg_value(i64 %xor168, !2012, !DIExpression(), !2000)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2167
    #dbg_value(i64 %xor171, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not184 = xor i64 %xor171, -1, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and185 = and i64 %xor175, %not184, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor186 = xor i64 %xor167, %and185, !dbg !2170
    #dbg_value(i64 %xor186, !2083, !DIExpression(), !2000)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2171
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2172
    #dbg_value(i64 %xor199, !2006, !DIExpression(), !2000)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2173
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not219 = xor i64 %xor206, -1, !dbg !2174
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and220 = and i64 %xor210, %not219, !dbg !2175
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor221 = xor i64 %xor202, %and220, !dbg !2176
    #dbg_value(i64 %xor221, !2088, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2177
    #dbg_value(i64 %xor237, !2058, !DIExpression(), !2000)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2178
    #dbg_value(i64 %xor75, !2050, !DIExpression(), !2000)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2179
    #dbg_value(i64 %xor78, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2180
    #dbg_value(i64 %xor71, !2038, !DIExpression(), !2000)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2181
    #dbg_value(i64 %xor74, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not85 = xor i64 %xor74, -1, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and86 = and i64 %xor78, %not85, !dbg !2183
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor87 = xor i64 %xor70, %and86, !dbg !2184
    #dbg_value(i64 %xor87, !2070, !DIExpression(), !2000)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2185
    #dbg_value(i64 %xor110, !2046, !DIExpression(), !2000)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2186
    #dbg_value(i64 %xor113, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2187
    #dbg_value(i64 %xor106, !2034, !DIExpression(), !2000)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2188
    #dbg_value(i64 %xor109, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not120 = xor i64 %xor109, -1, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and121 = and i64 %xor113, %not120, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor122 = xor i64 %xor105, %and121, !dbg !2191
    #dbg_value(i64 %xor122, !2075, !DIExpression(), !2000)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2192
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2193
    #dbg_value(i64 %xor145, !2042, !DIExpression(), !2000)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2194
    #dbg_value(i64 %xor148, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2195
    #dbg_value(i64 %xor141, !2040, !DIExpression(), !2000)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2196
    #dbg_value(i64 %xor144, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not155 = xor i64 %xor144, -1, !dbg !2197
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and156 = and i64 %xor148, %not155, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor157 = xor i64 %xor140, %and156, !dbg !2199
    #dbg_value(i64 %xor157, !2080, !DIExpression(), !2000)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2200
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2201
    #dbg_value(i64 %xor180, !2048, !DIExpression(), !2000)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2202
    #dbg_value(i64 %xor183, !2062, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2203
    #dbg_value(i64 %xor176, !2036, !DIExpression(), !2000)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2204
    #dbg_value(i64 %xor179, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %not190 = xor i64 %xor179, -1, !dbg !2205
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and191 = and i64 %xor183, %not190, !dbg !2206
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor192 = xor i64 %xor175, %and191, !dbg !2207
    #dbg_value(i64 %xor192, !2085, !DIExpression(), !2000)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2208
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2209
    #dbg_value(i64 %xor215, !2044, !DIExpression(), !2000)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2210
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not225 = xor i64 %xor214, -1, !dbg !2211
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and226 = and i64 %xor218, %not225, !dbg !2212
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor227 = xor i64 %xor210, %and226, !dbg !2213
    #dbg_value(i64 %xor227, !2090, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2214
    #dbg_value(i64 %xor245, !2060, !DIExpression(), !2000)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2215
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2216
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 %xor261, !2064, !DIExpression(), !2000)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2217
    #dbg_value(i64 %xor429, !2089, !DIExpression(), !2000)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2218
    #dbg_value(i64 %xor432, !2062, !DIExpression(), !2000)
  %not123 = xor i64 %xor113, -1, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and124 = and i64 %xor97, %not123, !dbg !2220
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor125 = xor i64 %xor109, %and124, !dbg !2221
    #dbg_value(i64 %xor125, !2076, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not91 = xor i64 %xor62, -1, !dbg !2222
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and92 = and i64 %xor66, %not91, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor93 = xor i64 %xor78, %and92, !dbg !2224
    #dbg_value(i64 %xor93, !2072, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not126 = xor i64 %xor97, -1, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and127 = and i64 %xor101, %not126, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor128 = xor i64 %xor113, %and127, !dbg !2227
    #dbg_value(i64 %xor128, !2077, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2228
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not161 = xor i64 %xor132, -1, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and162 = and i64 %xor136, %not161, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor163 = xor i64 %xor148, %and162, !dbg !2231
    #dbg_value(i64 %xor163, !2082, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not196 = xor i64 %xor167, -1, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and197 = and i64 %xor171, %not196, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor198 = xor i64 %xor183, %and197, !dbg !2235
    #dbg_value(i64 %xor198, !2087, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2236
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not231 = xor i64 %xor202, -1, !dbg !2237
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %and232 = and i64 %xor206, %not231, !dbg !2238
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor233 = xor i64 %xor218, %and232, !dbg !2239
    #dbg_value(i64 %xor233, !2092, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2240
    #dbg_value(i64 %xor253, !2062, !DIExpression(), !2000)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2241
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2242
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 %xor269, !2066, !DIExpression(), !2000)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2243
    #dbg_value(i64 %xor417, !2076, !DIExpression(), !2000)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2244
    #dbg_value(i64 %xor420, !2059, !DIExpression(), !2000)
  %not82 = xor i64 %xor70, -1, !dbg !2245
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and83 = and i64 %xor74, %not82, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor84 = xor i64 %xor66, %and83, !dbg !2247
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2069, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %not117 = xor i64 %xor105, -1, !dbg !2248
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and118 = and i64 %xor109, %not117, !dbg !2249
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor119 = xor i64 %xor101, %and118, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %not152 = xor i64 %xor140, -1, !dbg !2252
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and153 = and i64 %xor144, %not152, !dbg !2253
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor154 = xor i64 %xor136, %and153, !dbg !2254
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2255
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %not187 = xor i64 %xor175, -1, !dbg !2256
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and188 = and i64 %xor179, %not187, !dbg !2257
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor189 = xor i64 %xor171, %and188, !dbg !2258
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2259
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2260
    #dbg_value(i64 %xor241, !2059, !DIExpression(), !2000)
  %not88 = xor i64 %xor78, -1, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and89 = and i64 %xor62, %not88, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor90 = xor i64 %xor74, %and89, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not158 = xor i64 %xor148, -1, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and159 = and i64 %xor132, %not158, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor160 = xor i64 %xor144, %and159, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not193 = xor i64 %xor183, -1, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and194 = and i64 %xor167, %not193, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor195 = xor i64 %xor179, %and194, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %not228 = xor i64 %xor218, -1, !dbg !2273
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and229 = and i64 %xor202, %not228, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor230 = xor i64 %xor214, %and229, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2276
    #dbg_value(i64 %xor249, !2061, !DIExpression(), !2000)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2277
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2278
    #dbg_value(i64 %xor265, !2065, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2279
    #dbg_value(i64 %xor413, !2070, !DIExpression(), !2000)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2280
    #dbg_value(i64 %xor416, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not445 = xor i64 %xor416, -1, !dbg !2281
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and446 = and i64 %xor420, %not445, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor447 = xor i64 %xor432, %and446, !dbg !2283
    #dbg_value(i64 %xor447, !2050, !DIExpression(), !2000)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2284
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2285
    #dbg_value(i64 %xor257, !2063, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2286
    #dbg_value(i64 %xor425, !2083, !DIExpression(), !2000)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2287
    #dbg_value(i64 %xor428, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not442 = xor i64 %xor432, -1, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and443 = and i64 %xor416, %not442, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor444 = xor i64 %xor428, %and443, !dbg !2290
    #dbg_value(i64 %xor444, !2048, !DIExpression(), !2000)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2291
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2292
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(i64 %xor273, !2067, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2293
    #dbg_value(i64 %xor421, !2082, !DIExpression(), !2000)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2294
    #dbg_value(i64 %xor424, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not439 = xor i64 %xor428, -1, !dbg !2295
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and440 = and i64 %xor432, %not439, !dbg !2296
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor441 = xor i64 %xor424, %and440, !dbg !2297
    #dbg_value(i64 %xor441, !2046, !DIExpression(), !2000)
  %not436 = xor i64 %xor424, -1, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and437 = and i64 %xor428, %not436, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor438 = xor i64 %xor420, %and437, !dbg !2300
    #dbg_value(i64 %xor438, !2044, !DIExpression(), !2000)
  %not433 = xor i64 %xor420, -1, !dbg !2301
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and434 = and i64 %xor424, %not433, !dbg !2302
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor435 = xor i64 %xor416, %and434, !dbg !2303
    #dbg_value(i64 %xor435, !2042, !DIExpression(), !2000)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2304
    #dbg_value(i64 %xor394, !2091, !DIExpression(), !2000)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2305
    #dbg_value(i64 %xor397, !2062, !DIExpression(), !2000)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2306
    #dbg_value(i64 %xor382, !2073, !DIExpression(), !2000)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2307
    #dbg_value(i64 %xor385, !2059, !DIExpression(), !2000)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2308
    #dbg_value(i64 %xor378, !2072, !DIExpression(), !2000)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2309
    #dbg_value(i64 %xor381, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not410 = xor i64 %xor381, -1, !dbg !2310
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and411 = and i64 %xor385, %not410, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor412 = xor i64 %xor397, %and411, !dbg !2312
    #dbg_value(i64 %xor412, !2040, !DIExpression(), !2000)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2313
    #dbg_value(i64 %xor390, !2085, !DIExpression(), !2000)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2314
    #dbg_value(i64 %xor393, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not407 = xor i64 %xor397, -1, !dbg !2315
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and408 = and i64 %xor381, %not407, !dbg !2316
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor409 = xor i64 %xor393, %and408, !dbg !2317
    #dbg_value(i64 %xor409, !2038, !DIExpression(), !2000)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2318
    #dbg_value(i64 %xor386, !2079, !DIExpression(), !2000)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2319
    #dbg_value(i64 %xor389, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not404 = xor i64 %xor393, -1, !dbg !2320
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and405 = and i64 %xor397, %not404, !dbg !2321
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor406 = xor i64 %xor389, %and405, !dbg !2322
    #dbg_value(i64 %xor406, !2036, !DIExpression(), !2000)
  %not401 = xor i64 %xor389, -1, !dbg !2323
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and402 = and i64 %xor393, %not401, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor403 = xor i64 %xor385, %and402, !dbg !2325
    #dbg_value(i64 %xor403, !2034, !DIExpression(), !2000)
  %not398 = xor i64 %xor385, -1, !dbg !2326
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and399 = and i64 %xor389, %not398, !dbg !2327
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor400 = xor i64 %xor381, %and399, !dbg !2328
    #dbg_value(i64 %xor400, !2032, !DIExpression(), !2000)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2329
    #dbg_value(i64 %xor359, !2088, !DIExpression(), !2000)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2330
    #dbg_value(i64 %xor362, !2062, !DIExpression(), !2000)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2331
    #dbg_value(i64 %xor347, !2075, !DIExpression(), !2000)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2332
    #dbg_value(i64 %xor350, !2059, !DIExpression(), !2000)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2333
    #dbg_value(i64 %xor343, !2069, !DIExpression(), !2000)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2334
    #dbg_value(i64 %xor346, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not375 = xor i64 %xor346, -1, !dbg !2335
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and376 = and i64 %xor350, %not375, !dbg !2336
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor377 = xor i64 %xor362, %and376, !dbg !2337
    #dbg_value(i64 %xor377, !2030, !DIExpression(), !2000)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2338
    #dbg_value(i64 %xor355, !2087, !DIExpression(), !2000)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2339
    #dbg_value(i64 %xor358, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not372 = xor i64 %xor362, -1, !dbg !2340
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and373 = and i64 %xor346, %not372, !dbg !2341
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor374 = xor i64 %xor358, %and373, !dbg !2342
    #dbg_value(i64 %xor374, !2028, !DIExpression(), !2000)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2343
    #dbg_value(i64 %xor351, !2081, !DIExpression(), !2000)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2344
    #dbg_value(i64 %xor354, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not369 = xor i64 %xor358, -1, !dbg !2345
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and370 = and i64 %xor362, %not369, !dbg !2346
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor371 = xor i64 %xor354, %and370, !dbg !2347
    #dbg_value(i64 %xor371, !2026, !DIExpression(), !2000)
  %not366 = xor i64 %xor354, -1, !dbg !2348
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and367 = and i64 %xor358, %not366, !dbg !2349
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor368 = xor i64 %xor350, %and367, !dbg !2350
    #dbg_value(i64 %xor368, !2024, !DIExpression(), !2000)
  %not363 = xor i64 %xor350, -1, !dbg !2351
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and364 = and i64 %xor354, %not363, !dbg !2352
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor365 = xor i64 %xor346, %and364, !dbg !2353
    #dbg_value(i64 %xor365, !2022, !DIExpression(), !2000)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2354
    #dbg_value(i64 %xor324, !2090, !DIExpression(), !2000)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2355
    #dbg_value(i64 %xor327, !2062, !DIExpression(), !2000)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2356
    #dbg_value(i64 %xor312, !2077, !DIExpression(), !2000)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2357
    #dbg_value(i64 %xor315, !2059, !DIExpression(), !2000)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2358
    #dbg_value(i64 %xor308, !2071, !DIExpression(), !2000)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2359
    #dbg_value(i64 %xor311, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not340 = xor i64 %xor311, -1, !dbg !2360
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and341 = and i64 %xor315, %not340, !dbg !2361
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor342 = xor i64 %xor327, %and341, !dbg !2362
    #dbg_value(i64 %xor342, !2020, !DIExpression(), !2000)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2363
    #dbg_value(i64 %xor320, !2084, !DIExpression(), !2000)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2364
    #dbg_value(i64 %xor323, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not337 = xor i64 %xor327, -1, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and338 = and i64 %xor311, %not337, !dbg !2366
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor339 = xor i64 %xor323, %and338, !dbg !2367
    #dbg_value(i64 %xor339, !2018, !DIExpression(), !2000)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2368
    #dbg_value(i64 %xor316, !2078, !DIExpression(), !2000)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2369
    #dbg_value(i64 %xor319, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not334 = xor i64 %xor323, -1, !dbg !2370
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and335 = and i64 %xor327, %not334, !dbg !2371
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor336 = xor i64 %xor319, %and335, !dbg !2372
    #dbg_value(i64 %xor336, !2016, !DIExpression(), !2000)
  %not331 = xor i64 %xor319, -1, !dbg !2373
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and332 = and i64 %xor323, %not331, !dbg !2374
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor333 = xor i64 %xor315, %and332, !dbg !2375
    #dbg_value(i64 %xor333, !2014, !DIExpression(), !2000)
  %not328 = xor i64 %xor315, -1, !dbg !2376
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and329 = and i64 %xor319, %not328, !dbg !2377
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor330 = xor i64 %xor311, %and329, !dbg !2378
    #dbg_value(i64 %xor330, !2012, !DIExpression(), !2000)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2379
    #dbg_value(i64 %xor287, !2092, !DIExpression(), !2000)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2380
    #dbg_value(i64 %xor290, !2062, !DIExpression(), !2000)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2381
    #dbg_value(i64 %xor275, !2074, !DIExpression(), !2000)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2382
    #dbg_value(i64 %xor278, !2059, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2383
    #dbg_value(i64 %xor274, !2068, !DIExpression(), !2000)
    #dbg_value(i64 %xor274, !2058, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not305 = xor i64 %xor274, -1, !dbg !2384
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and306 = and i64 %xor278, %not305, !dbg !2385
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor307 = xor i64 %xor290, %and306, !dbg !2386
    #dbg_value(i64 %xor307, !2010, !DIExpression(), !2000)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2387
    #dbg_value(i64 %xor283, !2086, !DIExpression(), !2000)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2388
    #dbg_value(i64 %xor286, !2061, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not302 = xor i64 %xor290, -1, !dbg !2389
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and303 = and i64 %xor274, %not302, !dbg !2390
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor304 = xor i64 %xor286, %and303, !dbg !2391
    #dbg_value(i64 %xor304, !2008, !DIExpression(), !2000)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2392
    #dbg_value(i64 %xor279, !2080, !DIExpression(), !2000)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2393
    #dbg_value(i64 %xor282, !2060, !DIExpression(), !2000)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %not299 = xor i64 %xor286, -1, !dbg !2394
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and300 = and i64 %xor290, %not299, !dbg !2395
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor301 = xor i64 %xor282, %and300, !dbg !2396
    #dbg_value(i64 %xor301, !2006, !DIExpression(), !2000)
  %not296 = xor i64 %xor282, -1, !dbg !2397
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2000)
  %and297 = and i64 %xor286, %not296, !dbg !2398
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %xor298 = xor i64 %xor278, %and297, !dbg !2399
    #dbg_value(i64 %xor298, !2004, !DIExpression(), !2000)
  %add = or disjoint i32 %round.0, 1, !dbg !2400
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2401
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2401
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %not291 = xor i64 %xor278, -1, !dbg !2402
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %and292 = and i64 %xor282, %not291, !dbg !2403
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2000)
  %28 = xor i64 %and292, %27, !dbg !2404
  %xor295 = xor i64 %28, %xor274, !dbg !2404
    #dbg_value(i64 %xor295, !2002, !DIExpression(), !2000)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2405
    #dbg_value(i32 %add448, !2051, !DIExpression(), !2000)
  br label %for.cond, !dbg !2406, !llvm.loop !2407

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2000
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2000
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2000
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2000
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2000
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2000
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2000
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2000
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2000
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2000
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2000
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2000
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2000
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2000
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2000
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2000
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2000
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2000
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2000
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2000
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2000
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2000
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2000
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2000
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2000
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2409
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2410
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2411
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2412
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2413
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2414
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2415
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2416
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2417
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2418
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2419
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2420
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2421
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2422
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2423
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2424
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2425
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2426
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2427
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2428
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2429
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2430
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2431
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2432
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2433
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2434
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2435
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2436
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2437
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2438
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2439
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2440
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2441
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2442
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2443
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2444
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2445
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2446
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2447
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2448
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2449
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2450
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2451
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2452
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2453
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2454
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2455
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2456
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2457
  ret void, !dbg !2458
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2459 {
entry:
    #dbg_value(ptr %state, !2460, !DIExpression(), !2461)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2462
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2462
  %conv = trunc i64 %0 to i32, !dbg !2462
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2463
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2464
  store i64 168, ptr %arrayidx1, align 8, !dbg !2465
  ret void, !dbg !2466
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2467 {
entry:
    #dbg_value(ptr %s, !2470, !DIExpression(), !2471)
    #dbg_value(i32 %pos, !2472, !DIExpression(), !2471)
    #dbg_value(i32 %r, !2473, !DIExpression(), !2471)
    #dbg_value(i8 31, !2474, !DIExpression(), !2471)
  %rem = shl i32 %pos, 3, !dbg !2475
  %mul = and i32 %rem, 56, !dbg !2475
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2476
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2476
  %div2 = lshr i32 %pos, 3, !dbg !2477
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2478
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2479
  %xor = xor i64 %0, %shl, !dbg !2479
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2479
  %div13 = lshr i32 %r, 3, !dbg !2480
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2481
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2481
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2482
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2482
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2482
  ret void, !dbg !2483
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2484 {
entry:
    #dbg_value(ptr %out, !2487, !DIExpression(), !2488)
    #dbg_value(i32 %outlen, !2489, !DIExpression(), !2488)
    #dbg_value(ptr %state, !2490, !DIExpression(), !2488)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2491
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2491
  %conv = trunc i64 %0 to i32, !dbg !2491
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2492
  %conv1 = zext i32 %call to i64, !dbg !2492
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2493
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2494
  ret void, !dbg !2495
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2496 {
entry:
    #dbg_value(ptr %out, !2499, !DIExpression(), !2500)
    #dbg_value(i32 %outlen, !2501, !DIExpression(), !2500)
    #dbg_value(ptr %s, !2502, !DIExpression(), !2500)
    #dbg_value(i32 %pos, !2503, !DIExpression(), !2500)
    #dbg_value(i32 %r, !2504, !DIExpression(), !2500)
  br label %while.cond, !dbg !2505

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2499, !DIExpression(), !2500)
    #dbg_value(i32 %outlen.addr.0, !2501, !DIExpression(), !2500)
    #dbg_value(i32 %pos.addr.0, !2503, !DIExpression(), !2500)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2505
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2505

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2506
  br i1 %cmp, label %if.then, label %if.end, !dbg !2506

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2509
    #dbg_value(i32 0, !2503, !DIExpression(), !2500)
  br label %if.end, !dbg !2511

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2503, !DIExpression(), !2500)
    #dbg_value(i32 %pos.addr.1, !2512, !DIExpression(), !2500)
  br label %for.cond, !dbg !2513

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2515
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2499, !DIExpression(), !2500)
    #dbg_value(i32 %i.0, !2512, !DIExpression(), !2500)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2516
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2518
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2518
  %0 = and i1 %cmp1, %cmp2, !dbg !2518
  br i1 %0, label %for.body, label %for.end, !dbg !2519

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2520
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2521
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2521
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2522
  %mul = and i32 %rem, 56, !dbg !2522
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2523
  %shr = lshr i64 %1, %sh_prom, !dbg !2523
  %conv = trunc i64 %shr to i8, !dbg !2521
    #dbg_value(ptr %out.addr.1, !2499, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2500)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2524
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2525
    #dbg_value(ptr %incdec.ptr, !2499, !DIExpression(), !2500)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2526
    #dbg_value(i32 %inc, !2512, !DIExpression(), !2500)
  br label %for.cond, !dbg !2527, !llvm.loop !2528

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2515
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2530
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2531
    #dbg_value(i32 %sub3, !2501, !DIExpression(), !2500)
    #dbg_value(i32 %i.0.lcssa, !2503, !DIExpression(), !2500)
  br label %while.cond, !dbg !2505, !llvm.loop !2532

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2534
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2535 {
entry:
    #dbg_value(ptr %state, !2536, !DIExpression(), !2537)
    #dbg_value(ptr %in, !2538, !DIExpression(), !2537)
    #dbg_value(i32 %inlen, !2539, !DIExpression(), !2537)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2540
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2541
  store i64 168, ptr %arrayidx, align 8, !dbg !2542
  ret void, !dbg !2543
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2544 {
entry:
    #dbg_value(ptr %s, !2547, !DIExpression(), !2548)
    #dbg_value(i32 %r, !2549, !DIExpression(), !2548)
    #dbg_value(ptr %in, !2550, !DIExpression(), !2548)
    #dbg_value(i32 %inlen, !2551, !DIExpression(), !2548)
    #dbg_value(i8 %p, !2552, !DIExpression(), !2548)
    #dbg_value(i32 0, !2553, !DIExpression(), !2548)
  br label %for.cond, !dbg !2554

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2556
    #dbg_value(i32 %i.0, !2553, !DIExpression(), !2548)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2557
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2559

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2560
  br label %while.cond, !dbg !2560

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2561
  store i64 0, ptr %arrayidx, align 8, !dbg !2562
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2563
    #dbg_value(i32 %inc, !2553, !DIExpression(), !2548)
  br label %for.cond, !dbg !2564, !llvm.loop !2565

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2551, !DIExpression(), !2548)
    #dbg_value(ptr %in.addr.0, !2550, !DIExpression(), !2548)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2567
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2560

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2568

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2571

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2573
    #dbg_value(i32 %i.1, !2553, !DIExpression(), !2548)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2574
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2568

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2576
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2577
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2578
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2579
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2580
  %xor = xor i64 %1, %call, !dbg !2580
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2580
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2581
    #dbg_value(i32 %inc7, !2553, !DIExpression(), !2548)
  br label %for.cond2, !dbg !2582, !llvm.loop !2583

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2585
    #dbg_value(ptr %add.ptr9, !2550, !DIExpression(), !2548)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2586
    #dbg_value(i32 %sub, !2551, !DIExpression(), !2548)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2587
  br label %while.cond, !dbg !2560, !llvm.loop !2588

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2590
    #dbg_value(i32 %i.2, !2553, !DIExpression(), !2548)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2591
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2571

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2593
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2593
  %conv = zext i8 %2 to i64, !dbg !2594
  %rem = shl i32 %i.2, 3, !dbg !2595
  %mul14 = and i32 %rem, 56, !dbg !2595
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2596
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2596
  %div153 = lshr i32 %i.2, 3, !dbg !2597
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2598
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2599
  %xor17 = xor i64 %3, %shl, !dbg !2599
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2599
  %inc19 = add i32 %i.2, 1, !dbg !2600
    #dbg_value(i32 %inc19, !2553, !DIExpression(), !2548)
  br label %for.cond10, !dbg !2601, !llvm.loop !2602

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2590
  %conv21 = zext nneg i8 %p to i64, !dbg !2604
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2605
  %mul23 = and i32 %rem22, 56, !dbg !2605
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2606
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2606
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2607
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2608
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2609
  %xor28 = xor i64 %4, %shl25, !dbg !2609
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2609
  %sub29 = add nsw i32 %r, -1, !dbg !2610
  %div302 = lshr i32 %sub29, 3, !dbg !2611
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2612
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2613
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2613
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2613
  ret void, !dbg !2614
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2615 {
entry:
    #dbg_value(ptr %x, !2618, !DIExpression(), !2619)
    #dbg_value(i64 0, !2620, !DIExpression(), !2619)
    #dbg_value(i32 0, !2621, !DIExpression(), !2619)
  br label %for.cond, !dbg !2622

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2624
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2619
    #dbg_value(i64 %r.0, !2620, !DIExpression(), !2619)
    #dbg_value(i32 %i.0, !2621, !DIExpression(), !2619)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2625
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2627

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2619)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2628
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2628
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2619)
  %conv = zext i8 %0 to i64, !dbg !2629
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2619)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2630
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2619)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2631
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2619)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2631
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2620, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2619)
  %or = or i64 %r.0, %shl, !dbg !2632
    #dbg_value(i64 %or, !2620, !DIExpression(), !2619)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2633
    #dbg_value(i32 %inc, !2621, !DIExpression(), !2619)
  br label %for.cond, !dbg !2634, !llvm.loop !2635

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2619
  ret i64 %r.0.lcssa, !dbg !2637
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2638 {
entry:
    #dbg_value(ptr %out, !2639, !DIExpression(), !2640)
    #dbg_value(i32 %nblocks, !2641, !DIExpression(), !2640)
    #dbg_value(ptr %state, !2642, !DIExpression(), !2640)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2643
  ret void, !dbg !2644
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2645 {
entry:
    #dbg_value(ptr %out, !2648, !DIExpression(), !2649)
    #dbg_value(i32 %nblocks, !2650, !DIExpression(), !2649)
    #dbg_value(ptr %s, !2651, !DIExpression(), !2649)
    #dbg_value(i32 %r, !2652, !DIExpression(), !2649)
  %0 = lshr i32 %r, 3, !dbg !2653
  br label %while.cond, !dbg !2653

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2648, !DIExpression(), !2649)
    #dbg_value(i32 %nblocks.addr.0, !2650, !DIExpression(), !2649)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2653
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2653

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2654
    #dbg_value(i32 0, !2656, !DIExpression(), !2649)
  br label %for.cond, !dbg !2657

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2659
    #dbg_value(i32 %i.0, !2656, !DIExpression(), !2649)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2660
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2662

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2663
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2664
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2665
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2665
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2666
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2667
    #dbg_value(i32 %inc, !2656, !DIExpression(), !2649)
  br label %for.cond, !dbg !2668, !llvm.loop !2669

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2671
    #dbg_value(ptr %add.ptr1, !2648, !DIExpression(), !2649)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2672
    #dbg_value(i32 %sub, !2650, !DIExpression(), !2649)
  br label %while.cond, !dbg !2653, !llvm.loop !2673

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2675
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2676 {
entry:
    #dbg_value(ptr %x, !2679, !DIExpression(), !2680)
    #dbg_value(i64 %u, !2681, !DIExpression(), !2680)
    #dbg_value(i32 0, !2682, !DIExpression(), !2680)
  br label %for.cond, !dbg !2683

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2685
    #dbg_value(i32 %i.0, !2682, !DIExpression(), !2680)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2686
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2688

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2689
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2690
  %shr = lshr i64 %u, %sh_prom, !dbg !2690
  %conv = trunc i64 %shr to i8, !dbg !2691
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2692
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2693
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2694
    #dbg_value(i32 %inc, !2682, !DIExpression(), !2680)
  br label %for.cond, !dbg !2695, !llvm.loop !2696

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2698
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2699 {
entry:
    #dbg_value(ptr %state, !2700, !DIExpression(), !2701)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2702
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2703
  store i64 0, ptr %arrayidx, align 8, !dbg !2704
  ret void, !dbg !2705
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2706 {
entry:
    #dbg_value(ptr %state, !2707, !DIExpression(), !2708)
    #dbg_value(ptr %in, !2709, !DIExpression(), !2708)
    #dbg_value(i32 %inlen, !2710, !DIExpression(), !2708)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2711
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2711
  %conv = trunc i64 %0 to i32, !dbg !2711
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2712
  %conv1 = zext i32 %call to i64, !dbg !2712
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2713
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2714
  ret void, !dbg !2715
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2716 {
entry:
    #dbg_value(ptr %state, !2717, !DIExpression(), !2718)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2719
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2719
  %conv = trunc i64 %0 to i32, !dbg !2719
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2720
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2721
  store i64 136, ptr %arrayidx1, align 8, !dbg !2722
  ret void, !dbg !2723
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2724 {
entry:
    #dbg_value(ptr %out, !2725, !DIExpression(), !2726)
    #dbg_value(i32 %outlen, !2727, !DIExpression(), !2726)
    #dbg_value(ptr %state, !2728, !DIExpression(), !2726)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2729
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2729
  %conv = trunc i64 %0 to i32, !dbg !2729
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2730
  %conv1 = zext i32 %call to i64, !dbg !2730
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2731
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2732
  ret void, !dbg !2733
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2734 {
entry:
    #dbg_value(ptr %state, !2735, !DIExpression(), !2736)
    #dbg_value(ptr %in, !2737, !DIExpression(), !2736)
    #dbg_value(i32 %inlen, !2738, !DIExpression(), !2736)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2739
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2740
  store i64 136, ptr %arrayidx, align 8, !dbg !2741
  ret void, !dbg !2742
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2743 {
entry:
    #dbg_value(ptr %out, !2744, !DIExpression(), !2745)
    #dbg_value(i32 %nblocks, !2746, !DIExpression(), !2745)
    #dbg_value(ptr %state, !2747, !DIExpression(), !2745)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2748
  ret void, !dbg !2749
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2750 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2753, !DIExpression(), !2754)
    #dbg_value(i32 %outlen, !2755, !DIExpression(), !2754)
    #dbg_value(ptr %in, !2756, !DIExpression(), !2754)
    #dbg_value(i32 %inlen, !2757, !DIExpression(), !2754)
    #dbg_declare(ptr %state, !2758, !DIExpression(), !2759)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2760
  %div = udiv i32 %outlen, 168, !dbg !2761
    #dbg_value(i32 %div, !2762, !DIExpression(), !2754)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2763
  %mul.neg = mul i32 %div, -168, !dbg !2764
  %sub = add i32 %mul.neg, %outlen, !dbg !2765
    #dbg_value(i32 %sub, !2755, !DIExpression(), !2754)
  %mul1 = mul nuw i32 %div, 168, !dbg !2766
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2767
    #dbg_value(ptr %add.ptr, !2753, !DIExpression(), !2754)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2768
  ret void, !dbg !2769
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2770 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2771, !DIExpression(), !2772)
    #dbg_value(i32 %outlen, !2773, !DIExpression(), !2772)
    #dbg_value(ptr %in, !2774, !DIExpression(), !2772)
    #dbg_value(i32 %inlen, !2775, !DIExpression(), !2772)
    #dbg_declare(ptr %state, !2776, !DIExpression(), !2777)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2778
  %div = udiv i32 %outlen, 136, !dbg !2779
    #dbg_value(i32 %div, !2780, !DIExpression(), !2772)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2781
  %mul.neg = mul i32 %div, -136, !dbg !2782
  %sub = add i32 %mul.neg, %outlen, !dbg !2783
    #dbg_value(i32 %sub, !2773, !DIExpression(), !2772)
  %mul1 = mul nuw i32 %div, 136, !dbg !2784
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2785
    #dbg_value(ptr %add.ptr, !2771, !DIExpression(), !2772)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2786
  ret void, !dbg !2787
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2788 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2791, !DIExpression(), !2792)
    #dbg_value(ptr %in, !2793, !DIExpression(), !2792)
    #dbg_value(i32 %inlen, !2794, !DIExpression(), !2792)
    #dbg_declare(ptr %s, !2795, !DIExpression(), !2799)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2800
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2801
    #dbg_value(i32 0, !2802, !DIExpression(), !2792)
  br label %for.cond, !dbg !2803

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2805
    #dbg_value(i32 %i.0, !2802, !DIExpression(), !2792)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2806
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2808

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2809
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2810
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2811
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2811
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2812
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2813
    #dbg_value(i32 %inc, !2802, !DIExpression(), !2792)
  br label %for.cond, !dbg !2814, !llvm.loop !2815

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2817
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2818 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2819, !DIExpression(), !2820)
    #dbg_value(ptr %in, !2821, !DIExpression(), !2820)
    #dbg_value(i32 %inlen, !2822, !DIExpression(), !2820)
    #dbg_declare(ptr %s, !2823, !DIExpression(), !2824)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2825
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2826
    #dbg_value(i32 0, !2827, !DIExpression(), !2820)
  br label %for.cond, !dbg !2828

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2830
    #dbg_value(i32 %i.0, !2827, !DIExpression(), !2820)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2831
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2833

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2834
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2835
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2836
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2836
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2837
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2838
    #dbg_value(i32 %inc, !2827, !DIExpression(), !2820)
  br label %for.cond, !dbg !2839, !llvm.loop !2840

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2842
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2843 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2847, !DIExpression(), !2848)
    #dbg_value(ptr %seed, !2849, !DIExpression(), !2848)
    #dbg_value(i8 %x, !2850, !DIExpression(), !2848)
    #dbg_value(i8 %y, !2851, !DIExpression(), !2848)
    #dbg_declare(ptr %extseed, !2852, !DIExpression(), !2856)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2857
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2858
  store i8 %x, ptr %arrayidx, align 1, !dbg !2859
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2860
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2861
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2862
  ret void, !dbg !2863
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2864 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2867, !DIExpression(), !2868)
    #dbg_value(i32 %outlen, !2869, !DIExpression(), !2868)
    #dbg_value(ptr %key, !2870, !DIExpression(), !2868)
    #dbg_value(i8 %nonce, !2871, !DIExpression(), !2868)
    #dbg_declare(ptr %extkey, !2872, !DIExpression(), !2876)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2877
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2878
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2879
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2880
  ret void, !dbg !2881
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2882 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2883, !DIExpression(), !2884)
    #dbg_value(ptr %key, !2885, !DIExpression(), !2884)
    #dbg_value(ptr %input, !2886, !DIExpression(), !2884)
    #dbg_declare(ptr %s, !2887, !DIExpression(), !2888)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2889
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2890
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 768) #3, !dbg !2891
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2892
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2893
  ret void, !dbg !2894
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
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
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
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6400, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 800)
!141 = !DILocation(line: 11, column: 11, scope: !136)
!142 = !DILocalVariable(name: "sk", scope: !136, file: !2, line: 12, type: !143)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 13056, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 1632)
!146 = !DILocation(line: 12, column: 11, scope: !136)
!147 = !DILocalVariable(name: "ct", scope: !136, file: !2, line: 13, type: !148)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6144, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 768)
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
!271 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !272, file: !272, line: 25, type: !273, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!289 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !272, file: !272, line: 50, type: !290, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!303 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !272, file: !272, line: 76, type: !304, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!322 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !272, file: !272, line: 113, type: !273, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!323 = !DILocalVariable(name: "ct", arg: 1, scope: !322, file: !272, line: 113, type: !32)
!324 = !DILocation(line: 0, scope: !322)
!325 = !DILocalVariable(name: "ss", arg: 2, scope: !322, file: !272, line: 114, type: !32)
!326 = !DILocalVariable(name: "pk", arg: 3, scope: !322, file: !272, line: 115, type: !275)
!327 = !DILocalVariable(name: "coins", scope: !322, file: !272, line: 117, type: !153)
!328 = !DILocation(line: 117, column: 11, scope: !322)
!329 = !DILocation(line: 118, column: 3, scope: !322)
!330 = !DILocation(line: 119, column: 3, scope: !322)
!331 = !DILocation(line: 120, column: 3, scope: !322)
!332 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !272, file: !272, line: 140, type: !333, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
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
!360 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !361, file: !361, line: 165, type: !362, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!361 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!362 = !DISubroutineType(types: !363)
!363 = !{null, !364, !275, !50}
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !366, line: 8, baseType: !367)
!366 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 8192, elements: !373)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 11, baseType: !370)
!369 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!370 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !371)
!371 = !{!372}
!372 = !DISubrange(count: 256)
!373 = !{!374}
!374 = !DISubrange(count: 2)
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
!480 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !361, file: !361, line: 205, type: !481, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
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
!494 = !DICompositeType(tag: DW_TAG_array_type, baseType: !365, size: 16384, elements: !373)
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
!575 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !361, file: !361, line: 257, type: !576, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
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
!679 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !361, file: !361, line: 310, type: !680, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
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
!722 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !723, file: !723, line: 15, type: !724, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!814 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !723, file: !723, line: 91, type: !715, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!896 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !723, file: !723, line: 141, type: !724, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!916 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !723, file: !723, line: 157, type: !715, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!936 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !723, file: !723, line: 170, type: !937, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!955 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !723, file: !723, line: 184, type: !937, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!972 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !723, file: !723, line: 200, type: !973, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
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
!983 = !DILocation(line: 207, column: 34, scope: !984)
!984 = distinct !DILexicalBlock(scope: !985, file: !723, line: 206, column: 33)
!985 = distinct !DILexicalBlock(scope: !986, file: !723, line: 206, column: 3)
!986 = distinct !DILexicalBlock(scope: !972, file: !723, line: 206, column: 3)
!987 = !DILocation(line: 207, column: 44, scope: !984)
!988 = !DILocation(line: 207, column: 5, scope: !984)
!989 = !DILocation(line: 208, column: 5, scope: !984)
!990 = !DILocation(line: 211, column: 3, scope: !972)
!991 = !DILocation(line: 212, column: 1, scope: !972)
!992 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !723, file: !723, line: 223, type: !937, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!993 = !DILocalVariable(name: "r", arg: 1, scope: !992, file: !723, line: 223, type: !364)
!994 = !DILocation(line: 0, scope: !992)
!995 = !DILocalVariable(name: "i", scope: !992, file: !723, line: 224, type: !40)
!996 = !DILocation(line: 225, column: 8, scope: !997)
!997 = distinct !DILexicalBlock(scope: !992, file: !723, line: 225, column: 3)
!998 = !DILocation(line: 225, scope: !997)
!999 = !DILocation(line: 225, column: 17, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !997, file: !723, line: 225, column: 3)
!1001 = !DILocation(line: 225, column: 3, scope: !997)
!1002 = !DILocation(line: 226, column: 18, scope: !1000)
!1003 = !DILocation(line: 226, column: 5, scope: !1000)
!1004 = !DILocation(line: 225, column: 29, scope: !1000)
!1005 = !DILocation(line: 225, column: 3, scope: !1000)
!1006 = distinct !{!1006, !1001, !1007, !130}
!1007 = !DILocation(line: 226, column: 25, scope: !997)
!1008 = !DILocation(line: 227, column: 1, scope: !992)
!1009 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !723, file: !723, line: 238, type: !1010, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{null, !364, !726, !726}
!1012 = !DILocalVariable(name: "r", arg: 1, scope: !1009, file: !723, line: 238, type: !364)
!1013 = !DILocation(line: 0, scope: !1009)
!1014 = !DILocalVariable(name: "a", arg: 2, scope: !1009, file: !723, line: 238, type: !726)
!1015 = !DILocalVariable(name: "b", arg: 3, scope: !1009, file: !723, line: 238, type: !726)
!1016 = !DILocalVariable(name: "i", scope: !1009, file: !723, line: 239, type: !40)
!1017 = !DILocation(line: 240, column: 8, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1009, file: !723, line: 240, column: 3)
!1019 = !DILocation(line: 240, scope: !1018)
!1020 = !DILocation(line: 240, column: 17, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1018, file: !723, line: 240, column: 3)
!1022 = !DILocation(line: 240, column: 3, scope: !1018)
!1023 = !DILocation(line: 241, column: 15, scope: !1021)
!1024 = !DILocation(line: 241, column: 25, scope: !1021)
!1025 = !DILocation(line: 241, column: 35, scope: !1021)
!1026 = !DILocation(line: 241, column: 5, scope: !1021)
!1027 = !DILocation(line: 240, column: 29, scope: !1021)
!1028 = !DILocation(line: 240, column: 3, scope: !1021)
!1029 = distinct !{!1029, !1022, !1030, !130}
!1030 = !DILocation(line: 241, column: 42, scope: !1018)
!1031 = !DILocation(line: 242, column: 1, scope: !1009)
!1032 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !1033, file: !1033, line: 19, type: !1034, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1033 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1034 = !DISubroutineType(types: !1035)
!1035 = !{null, !32, !1036}
!1036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1037, size: 32)
!1037 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!1038 = !DILocalVariable(name: "r", arg: 1, scope: !1032, file: !1033, line: 19, type: !32)
!1039 = !DILocation(line: 0, scope: !1032)
!1040 = !DILocalVariable(name: "a", arg: 2, scope: !1032, file: !1033, line: 19, type: !1036)
!1041 = !DILocalVariable(name: "t", scope: !1032, file: !1033, line: 23, type: !1042)
!1042 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !1043)
!1043 = !{!1044}
!1044 = !DISubrange(count: 8)
!1045 = !DILocation(line: 23, column: 11, scope: !1032)
!1046 = !DILocalVariable(name: "i", scope: !1032, file: !1033, line: 20, type: !40)
!1047 = !DILocation(line: 27, column: 8, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1032, file: !1033, line: 27, column: 3)
!1049 = !DILocation(line: 27, scope: !1048)
!1050 = !DILocation(line: 27, column: 17, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1048, file: !1033, line: 27, column: 3)
!1052 = !DILocation(line: 27, column: 3, scope: !1048)
!1053 = !DILocation(line: 28, column: 5, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !1055, file: !1033, line: 28, column: 5)
!1055 = distinct !DILexicalBlock(scope: !1051, file: !1033, line: 27, column: 37)
!1056 = !DILocation(line: 28, scope: !1054)
!1057 = !DILocalVariable(name: "j", scope: !1032, file: !1033, line: 20, type: !40)
!1058 = !DILocation(line: 28, column: 19, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1054, file: !1033, line: 28, column: 5)
!1060 = !DILocation(line: 30, column: 18, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1059, file: !1033, line: 28, column: 29)
!1062 = !DILocation(line: 30, column: 22, scope: !1061)
!1063 = !DILocation(line: 30, column: 11, scope: !1061)
!1064 = !DILocalVariable(name: "u", scope: !1032, file: !1033, line: 21, type: !61)
!1065 = !DILocation(line: 31, column: 22, scope: !1061)
!1066 = !DILocation(line: 31, column: 9, scope: !1061)
!1067 = !DILocation(line: 33, column: 12, scope: !1061)
!1068 = !DILocalVariable(name: "d0", scope: !1032, file: !1033, line: 22, type: !91)
!1069 = !DILocation(line: 35, column: 10, scope: !1061)
!1070 = !DILocation(line: 36, column: 10, scope: !1061)
!1071 = !DILocation(line: 37, column: 14, scope: !1061)
!1072 = !DILocation(line: 37, column: 7, scope: !1061)
!1073 = !DILocation(line: 37, column: 12, scope: !1061)
!1074 = !DILocation(line: 28, column: 25, scope: !1059)
!1075 = !DILocation(line: 28, column: 5, scope: !1059)
!1076 = distinct !{!1076, !1053, !1077, !130}
!1077 = !DILocation(line: 38, column: 5, scope: !1054)
!1078 = !DILocation(line: 40, column: 12, scope: !1055)
!1079 = !DILocation(line: 40, column: 20, scope: !1055)
!1080 = !DILocation(line: 40, column: 25, scope: !1055)
!1081 = !DILocation(line: 40, column: 17, scope: !1055)
!1082 = !DILocation(line: 40, column: 10, scope: !1055)
!1083 = !DILocation(line: 41, column: 12, scope: !1055)
!1084 = !DILocation(line: 41, column: 20, scope: !1055)
!1085 = !DILocation(line: 41, column: 25, scope: !1055)
!1086 = !DILocation(line: 41, column: 17, scope: !1055)
!1087 = !DILocation(line: 41, column: 5, scope: !1055)
!1088 = !DILocation(line: 41, column: 10, scope: !1055)
!1089 = !DILocation(line: 42, column: 12, scope: !1055)
!1090 = !DILocation(line: 42, column: 20, scope: !1055)
!1091 = !DILocation(line: 42, column: 25, scope: !1055)
!1092 = !DILocation(line: 42, column: 17, scope: !1055)
!1093 = !DILocation(line: 42, column: 5, scope: !1055)
!1094 = !DILocation(line: 42, column: 10, scope: !1055)
!1095 = !DILocation(line: 43, column: 12, scope: !1055)
!1096 = !DILocation(line: 43, column: 20, scope: !1055)
!1097 = !DILocation(line: 43, column: 25, scope: !1055)
!1098 = !DILocation(line: 43, column: 17, scope: !1055)
!1099 = !DILocation(line: 43, column: 5, scope: !1055)
!1100 = !DILocation(line: 43, column: 10, scope: !1055)
!1101 = !DILocation(line: 44, column: 7, scope: !1055)
!1102 = !DILocation(line: 27, column: 33, scope: !1051)
!1103 = !DILocation(line: 27, column: 3, scope: !1051)
!1104 = distinct !{!1104, !1052, !1105, !130}
!1105 = !DILocation(line: 45, column: 3, scope: !1048)
!1106 = !DILocation(line: 70, column: 1, scope: !1032)
!1107 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !1033, file: !1033, line: 82, type: !1108, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{null, !670, !275}
!1110 = !DILocalVariable(name: "r", arg: 1, scope: !1107, file: !1033, line: 82, type: !670)
!1111 = !DILocation(line: 0, scope: !1107)
!1112 = !DILocalVariable(name: "a", arg: 2, scope: !1107, file: !1033, line: 82, type: !275)
!1113 = !DILocalVariable(name: "i", scope: !1107, file: !1033, line: 83, type: !40)
!1114 = !DILocation(line: 86, column: 8, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1107, file: !1033, line: 86, column: 3)
!1116 = !DILocation(line: 86, scope: !1115)
!1117 = !DILocation(line: 86, column: 17, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1115, file: !1033, line: 86, column: 3)
!1119 = !DILocation(line: 86, column: 3, scope: !1115)
!1120 = !DILocation(line: 87, column: 36, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1118, file: !1033, line: 86, column: 37)
!1122 = !DILocation(line: 87, column: 41, scope: !1121)
!1123 = !DILocation(line: 87, column: 25, scope: !1121)
!1124 = !DILocation(line: 87, column: 47, scope: !1121)
!1125 = !DILocation(line: 87, column: 58, scope: !1121)
!1126 = !DILocation(line: 87, column: 63, scope: !1121)
!1127 = !DILocation(line: 87, column: 23, scope: !1121)
!1128 = !DILocation(line: 87, column: 12, scope: !1121)
!1129 = !DILocation(line: 87, column: 5, scope: !1121)
!1130 = !DILocation(line: 87, column: 21, scope: !1121)
!1131 = !DILocation(line: 88, column: 36, scope: !1121)
!1132 = !DILocation(line: 88, column: 41, scope: !1121)
!1133 = !DILocation(line: 88, column: 25, scope: !1121)
!1134 = !DILocation(line: 88, column: 47, scope: !1121)
!1135 = !DILocation(line: 88, column: 58, scope: !1121)
!1136 = !DILocation(line: 88, column: 63, scope: !1121)
!1137 = !DILocation(line: 88, column: 23, scope: !1121)
!1138 = !DILocation(line: 88, column: 12, scope: !1121)
!1139 = !DILocation(line: 88, column: 16, scope: !1121)
!1140 = !DILocation(line: 88, column: 5, scope: !1121)
!1141 = !DILocation(line: 88, column: 21, scope: !1121)
!1142 = !DILocation(line: 89, column: 7, scope: !1121)
!1143 = !DILocation(line: 86, column: 33, scope: !1118)
!1144 = !DILocation(line: 86, column: 3, scope: !1118)
!1145 = distinct !{!1145, !1119, !1146, !130}
!1146 = !DILocation(line: 90, column: 3, scope: !1115)
!1147 = !DILocation(line: 111, column: 1, scope: !1107)
!1148 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !1033, file: !1033, line: 122, type: !1034, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1149 = !DILocalVariable(name: "r", arg: 1, scope: !1148, file: !1033, line: 122, type: !32)
!1150 = !DILocation(line: 0, scope: !1148)
!1151 = !DILocalVariable(name: "a", arg: 2, scope: !1148, file: !1033, line: 122, type: !1036)
!1152 = !DILocalVariable(name: "i", scope: !1148, file: !1033, line: 123, type: !40)
!1153 = !DILocation(line: 126, column: 8, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1148, file: !1033, line: 126, column: 3)
!1155 = !DILocation(line: 126, scope: !1154)
!1156 = !DILocation(line: 126, column: 17, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1154, file: !1033, line: 126, column: 3)
!1158 = !DILocation(line: 126, column: 3, scope: !1154)
!1159 = !DILocation(line: 128, column: 17, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1157, file: !1033, line: 126, column: 37)
!1161 = !DILocation(line: 128, column: 10, scope: !1160)
!1162 = !DILocalVariable(name: "t0", scope: !1148, file: !1033, line: 124, type: !86)
!1163 = !DILocation(line: 129, column: 31, scope: !1160)
!1164 = !DILocation(line: 129, column: 8, scope: !1160)
!1165 = !DILocation(line: 130, column: 17, scope: !1160)
!1166 = !DILocation(line: 130, column: 21, scope: !1160)
!1167 = !DILocation(line: 130, column: 10, scope: !1160)
!1168 = !DILocalVariable(name: "t1", scope: !1148, file: !1033, line: 124, type: !86)
!1169 = !DILocation(line: 131, column: 31, scope: !1160)
!1170 = !DILocation(line: 131, column: 8, scope: !1160)
!1171 = !DILocation(line: 132, column: 20, scope: !1160)
!1172 = !DILocation(line: 132, column: 9, scope: !1160)
!1173 = !DILocation(line: 132, column: 5, scope: !1160)
!1174 = !DILocation(line: 132, column: 18, scope: !1160)
!1175 = !DILocation(line: 133, column: 24, scope: !1160)
!1176 = !DILocation(line: 133, column: 33, scope: !1160)
!1177 = !DILocation(line: 133, column: 36, scope: !1160)
!1178 = !DILocation(line: 133, column: 30, scope: !1160)
!1179 = !DILocation(line: 133, column: 9, scope: !1160)
!1180 = !DILocation(line: 133, column: 5, scope: !1160)
!1181 = !DILocation(line: 133, column: 18, scope: !1160)
!1182 = !DILocation(line: 134, column: 24, scope: !1160)
!1183 = !DILocation(line: 134, column: 20, scope: !1160)
!1184 = !DILocation(line: 134, column: 9, scope: !1160)
!1185 = !DILocation(line: 134, column: 5, scope: !1160)
!1186 = !DILocation(line: 134, column: 18, scope: !1160)
!1187 = !DILocation(line: 126, column: 33, scope: !1157)
!1188 = !DILocation(line: 126, column: 3, scope: !1157)
!1189 = distinct !{!1189, !1158, !1190, !130}
!1190 = !DILocation(line: 135, column: 3, scope: !1154)
!1191 = !DILocation(line: 136, column: 1, scope: !1148)
!1192 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !1033, file: !1033, line: 148, type: !1108, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1193 = !DILocalVariable(name: "r", arg: 1, scope: !1192, file: !1033, line: 148, type: !670)
!1194 = !DILocation(line: 0, scope: !1192)
!1195 = !DILocalVariable(name: "a", arg: 2, scope: !1192, file: !1033, line: 148, type: !275)
!1196 = !DILocalVariable(name: "i", scope: !1192, file: !1033, line: 149, type: !40)
!1197 = !DILocation(line: 150, column: 8, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1192, file: !1033, line: 150, column: 3)
!1199 = !DILocation(line: 150, scope: !1198)
!1200 = !DILocation(line: 150, column: 17, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1198, file: !1033, line: 150, column: 3)
!1202 = !DILocation(line: 150, column: 3, scope: !1198)
!1203 = !DILocation(line: 151, column: 25, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1201, file: !1033, line: 150, column: 37)
!1205 = !DILocation(line: 151, column: 21, scope: !1204)
!1206 = !DILocation(line: 151, column: 57, scope: !1204)
!1207 = !DILocation(line: 151, column: 53, scope: !1204)
!1208 = !DILocation(line: 151, column: 43, scope: !1204)
!1209 = !DILocation(line: 151, column: 66, scope: !1204)
!1210 = !DILocation(line: 151, column: 73, scope: !1204)
!1211 = !DILocation(line: 151, column: 12, scope: !1204)
!1212 = !DILocation(line: 151, column: 5, scope: !1204)
!1213 = !DILocation(line: 151, column: 17, scope: !1204)
!1214 = !DILocation(line: 153, column: 15, scope: !1204)
!1215 = !DILocation(line: 153, column: 11, scope: !1204)
!1216 = !DILocation(line: 153, column: 24, scope: !1204)
!1217 = !DILocation(line: 153, column: 47, scope: !1204)
!1218 = !DILocation(line: 153, column: 43, scope: !1204)
!1219 = !DILocation(line: 153, column: 33, scope: !1204)
!1220 = !DILocation(line: 153, column: 56, scope: !1204)
!1221 = !DILocation(line: 153, column: 30, scope: !1204)
!1222 = !DILocation(line: 152, column: 12, scope: !1204)
!1223 = !DILocation(line: 152, column: 16, scope: !1204)
!1224 = !DILocation(line: 152, column: 5, scope: !1204)
!1225 = !DILocation(line: 152, column: 21, scope: !1204)
!1226 = !DILocation(line: 150, column: 33, scope: !1201)
!1227 = !DILocation(line: 150, column: 3, scope: !1201)
!1228 = distinct !{!1228, !1202, !1229, !130}
!1229 = !DILocation(line: 154, column: 3, scope: !1198)
!1230 = !DILocation(line: 155, column: 1, scope: !1192)
!1231 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !1033, file: !1033, line: 165, type: !1108, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1232 = !DILocalVariable(name: "r", arg: 1, scope: !1231, file: !1033, line: 165, type: !670)
!1233 = !DILocation(line: 0, scope: !1231)
!1234 = !DILocalVariable(name: "msg", arg: 2, scope: !1231, file: !1033, line: 165, type: !275)
!1235 = !DILocalVariable(name: "i", scope: !1231, file: !1033, line: 166, type: !40)
!1236 = !DILocation(line: 172, column: 8, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1231, file: !1033, line: 172, column: 3)
!1238 = !DILocation(line: 172, scope: !1237)
!1239 = !DILocation(line: 172, column: 17, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1237, file: !1033, line: 172, column: 3)
!1241 = !DILocation(line: 172, column: 3, scope: !1237)
!1242 = !DILocation(line: 173, column: 5, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1244, file: !1033, line: 173, column: 5)
!1244 = distinct !DILexicalBlock(scope: !1240, file: !1033, line: 172, column: 37)
!1245 = !DILocation(line: 173, scope: !1243)
!1246 = !DILocalVariable(name: "j", scope: !1231, file: !1033, line: 166, type: !40)
!1247 = !DILocation(line: 173, column: 19, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1243, file: !1033, line: 173, column: 5)
!1249 = !DILocation(line: 174, column: 14, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1248, file: !1033, line: 173, column: 29)
!1251 = !DILocation(line: 174, column: 18, scope: !1250)
!1252 = !DILocation(line: 174, column: 7, scope: !1250)
!1253 = !DILocation(line: 174, column: 23, scope: !1250)
!1254 = !DILocation(line: 175, column: 23, scope: !1250)
!1255 = !DILocation(line: 175, column: 31, scope: !1250)
!1256 = !DILocation(line: 175, column: 58, scope: !1250)
!1257 = !DILocation(line: 175, column: 65, scope: !1250)
!1258 = !DILocation(line: 175, column: 57, scope: !1250)
!1259 = !DILocation(line: 175, column: 7, scope: !1250)
!1260 = !DILocation(line: 173, column: 25, scope: !1248)
!1261 = !DILocation(line: 173, column: 5, scope: !1248)
!1262 = distinct !{!1262, !1242, !1263, !130}
!1263 = !DILocation(line: 176, column: 5, scope: !1243)
!1264 = !DILocation(line: 172, column: 33, scope: !1240)
!1265 = !DILocation(line: 172, column: 3, scope: !1240)
!1266 = distinct !{!1266, !1241, !1267, !130}
!1267 = !DILocation(line: 177, column: 3, scope: !1237)
!1268 = !DILocation(line: 178, column: 1, scope: !1231)
!1269 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !1033, file: !1033, line: 188, type: !1034, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1270 = !DILocalVariable(name: "msg", arg: 1, scope: !1269, file: !1033, line: 188, type: !32)
!1271 = !DILocation(line: 0, scope: !1269)
!1272 = !DILocalVariable(name: "a", arg: 2, scope: !1269, file: !1033, line: 188, type: !1036)
!1273 = !DILocalVariable(name: "i", scope: !1269, file: !1033, line: 189, type: !40)
!1274 = !DILocation(line: 192, column: 8, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1269, file: !1033, line: 192, column: 3)
!1276 = !DILocation(line: 192, scope: !1275)
!1277 = !DILocation(line: 192, column: 17, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1275, file: !1033, line: 192, column: 3)
!1279 = !DILocation(line: 192, column: 3, scope: !1275)
!1280 = !DILocation(line: 193, column: 5, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1278, file: !1033, line: 192, column: 37)
!1282 = !DILocation(line: 193, column: 12, scope: !1281)
!1283 = !DILocalVariable(name: "j", scope: !1269, file: !1033, line: 189, type: !40)
!1284 = !DILocation(line: 194, column: 10, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1281, file: !1033, line: 194, column: 5)
!1286 = !DILocation(line: 194, scope: !1285)
!1287 = !DILocation(line: 194, column: 19, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1285, file: !1033, line: 194, column: 5)
!1289 = !DILocation(line: 194, column: 5, scope: !1285)
!1290 = !DILocation(line: 195, column: 18, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1288, file: !1033, line: 194, column: 29)
!1292 = !DILocation(line: 195, column: 22, scope: !1291)
!1293 = !DILocation(line: 195, column: 11, scope: !1291)
!1294 = !DILocalVariable(name: "t", scope: !1269, file: !1033, line: 190, type: !91)
!1295 = !DILocation(line: 200, column: 9, scope: !1291)
!1296 = !DILocation(line: 201, column: 9, scope: !1291)
!1297 = !DILocation(line: 202, column: 9, scope: !1291)
!1298 = !DILocation(line: 203, column: 19, scope: !1291)
!1299 = !DILocation(line: 203, column: 7, scope: !1291)
!1300 = !DILocation(line: 203, column: 14, scope: !1291)
!1301 = !DILocation(line: 194, column: 25, scope: !1288)
!1302 = !DILocation(line: 194, column: 5, scope: !1288)
!1303 = distinct !{!1303, !1289, !1304, !130}
!1304 = !DILocation(line: 204, column: 5, scope: !1285)
!1305 = !DILocation(line: 192, column: 33, scope: !1278)
!1306 = !DILocation(line: 192, column: 3, scope: !1278)
!1307 = distinct !{!1307, !1279, !1308, !130}
!1308 = !DILocation(line: 205, column: 3, scope: !1275)
!1309 = !DILocation(line: 206, column: 1, scope: !1269)
!1310 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !1033, file: !1033, line: 220, type: !1311, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{null, !670, !275, !33}
!1313 = !DILocalVariable(name: "r", arg: 1, scope: !1310, file: !1033, line: 220, type: !670)
!1314 = !DILocation(line: 0, scope: !1310)
!1315 = !DILocalVariable(name: "seed", arg: 2, scope: !1310, file: !1033, line: 220, type: !275)
!1316 = !DILocalVariable(name: "nonce", arg: 3, scope: !1310, file: !1033, line: 221, type: !33)
!1317 = !DILocalVariable(name: "buf", scope: !1310, file: !1033, line: 222, type: !1318)
!1318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1536, elements: !1319)
!1319 = !{!1320}
!1320 = !DISubrange(count: 192)
!1321 = !DILocation(line: 222, column: 11, scope: !1310)
!1322 = !DILocation(line: 223, column: 3, scope: !1310)
!1323 = !DILocation(line: 224, column: 3, scope: !1310)
!1324 = !DILocation(line: 225, column: 1, scope: !1310)
!1325 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !1033, file: !1033, line: 239, type: !1311, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1326 = !DILocalVariable(name: "r", arg: 1, scope: !1325, file: !1033, line: 239, type: !670)
!1327 = !DILocation(line: 0, scope: !1325)
!1328 = !DILocalVariable(name: "seed", arg: 2, scope: !1325, file: !1033, line: 239, type: !275)
!1329 = !DILocalVariable(name: "nonce", arg: 3, scope: !1325, file: !1033, line: 240, type: !33)
!1330 = !DILocalVariable(name: "buf", scope: !1325, file: !1033, line: 241, type: !1331)
!1331 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1332 = !DILocation(line: 241, column: 11, scope: !1325)
!1333 = !DILocation(line: 242, column: 3, scope: !1325)
!1334 = !DILocation(line: 243, column: 3, scope: !1325)
!1335 = !DILocation(line: 244, column: 1, scope: !1325)
!1336 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !1033, file: !1033, line: 256, type: !1337, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{null, !670}
!1339 = !DILocalVariable(name: "r", arg: 1, scope: !1336, file: !1033, line: 256, type: !670)
!1340 = !DILocation(line: 0, scope: !1336)
!1341 = !DILocation(line: 257, column: 3, scope: !1336)
!1342 = !DILocation(line: 258, column: 3, scope: !1336)
!1343 = !DILocation(line: 259, column: 1, scope: !1336)
!1344 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !1033, file: !1033, line: 314, type: !1337, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1345 = !DILocalVariable(name: "r", arg: 1, scope: !1344, file: !1033, line: 314, type: !670)
!1346 = !DILocation(line: 0, scope: !1344)
!1347 = !DILocalVariable(name: "i", scope: !1344, file: !1033, line: 315, type: !40)
!1348 = !DILocation(line: 316, column: 8, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1344, file: !1033, line: 316, column: 3)
!1350 = !DILocation(line: 316, scope: !1349)
!1351 = !DILocation(line: 316, column: 17, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1349, file: !1033, line: 316, column: 3)
!1353 = !DILocation(line: 316, column: 3, scope: !1349)
!1354 = !DILocation(line: 317, column: 30, scope: !1352)
!1355 = !DILocation(line: 317, column: 15, scope: !1352)
!1356 = !DILocation(line: 317, column: 5, scope: !1352)
!1357 = !DILocation(line: 317, column: 13, scope: !1352)
!1358 = !DILocation(line: 316, column: 29, scope: !1352)
!1359 = !DILocation(line: 316, column: 3, scope: !1352)
!1360 = distinct !{!1360, !1353, !1361, !130}
!1361 = !DILocation(line: 317, column: 37, scope: !1349)
!1362 = !DILocation(line: 318, column: 1, scope: !1344)
!1363 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !1033, file: !1033, line: 271, type: !1337, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1364 = !DILocalVariable(name: "r", arg: 1, scope: !1363, file: !1033, line: 271, type: !670)
!1365 = !DILocation(line: 0, scope: !1363)
!1366 = !DILocation(line: 271, column: 36, scope: !1363)
!1367 = !DILocation(line: 271, column: 48, scope: !1363)
!1368 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !1033, file: !1033, line: 282, type: !1369, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{null, !670, !1036, !1036}
!1371 = !DILocalVariable(name: "r", arg: 1, scope: !1368, file: !1033, line: 282, type: !670)
!1372 = !DILocation(line: 0, scope: !1368)
!1373 = !DILocalVariable(name: "a", arg: 2, scope: !1368, file: !1033, line: 282, type: !1036)
!1374 = !DILocalVariable(name: "b", arg: 3, scope: !1368, file: !1033, line: 282, type: !1036)
!1375 = !DILocalVariable(name: "i", scope: !1368, file: !1033, line: 283, type: !40)
!1376 = !DILocation(line: 284, column: 8, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1368, file: !1033, line: 284, column: 3)
!1378 = !DILocation(line: 284, scope: !1377)
!1379 = !DILocation(line: 284, column: 17, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1377, file: !1033, line: 284, column: 3)
!1381 = !DILocation(line: 284, column: 3, scope: !1377)
!1382 = !DILocation(line: 285, column: 21, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1380, file: !1033, line: 284, column: 37)
!1384 = !DILocation(line: 285, column: 14, scope: !1383)
!1385 = !DILocation(line: 285, column: 35, scope: !1383)
!1386 = !DILocation(line: 285, column: 28, scope: !1383)
!1387 = !DILocation(line: 285, column: 49, scope: !1383)
!1388 = !DILocation(line: 285, column: 42, scope: !1383)
!1389 = !DILocation(line: 285, column: 64, scope: !1383)
!1390 = !DILocation(line: 285, column: 55, scope: !1383)
!1391 = !DILocation(line: 285, column: 5, scope: !1383)
!1392 = !DILocation(line: 286, column: 21, scope: !1383)
!1393 = !DILocation(line: 286, column: 25, scope: !1383)
!1394 = !DILocation(line: 286, column: 14, scope: !1383)
!1395 = !DILocation(line: 286, column: 39, scope: !1383)
!1396 = !DILocation(line: 286, column: 43, scope: !1383)
!1397 = !DILocation(line: 286, column: 32, scope: !1383)
!1398 = !DILocation(line: 286, column: 57, scope: !1383)
!1399 = !DILocation(line: 286, column: 61, scope: !1383)
!1400 = !DILocation(line: 286, column: 50, scope: !1383)
!1401 = !DILocation(line: 287, column: 23, scope: !1383)
!1402 = !DILocation(line: 287, column: 14, scope: !1383)
!1403 = !DILocation(line: 287, column: 13, scope: !1383)
!1404 = !DILocation(line: 286, column: 5, scope: !1383)
!1405 = !DILocation(line: 284, column: 33, scope: !1380)
!1406 = !DILocation(line: 284, column: 3, scope: !1380)
!1407 = distinct !{!1407, !1381, !1408, !130}
!1408 = !DILocation(line: 288, column: 3, scope: !1377)
!1409 = !DILocation(line: 289, column: 1, scope: !1368)
!1410 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !1033, file: !1033, line: 299, type: !1337, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1411 = !DILocalVariable(name: "r", arg: 1, scope: !1410, file: !1033, line: 299, type: !670)
!1412 = !DILocation(line: 0, scope: !1410)
!1413 = !DILocalVariable(name: "f", scope: !1410, file: !1033, line: 301, type: !60)
!1414 = !DILocalVariable(name: "i", scope: !1410, file: !1033, line: 300, type: !40)
!1415 = !DILocation(line: 302, column: 8, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1410, file: !1033, line: 302, column: 3)
!1417 = !DILocation(line: 302, scope: !1416)
!1418 = !DILocation(line: 302, column: 17, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1416, file: !1033, line: 302, column: 3)
!1420 = !DILocation(line: 302, column: 3, scope: !1416)
!1421 = !DILocation(line: 303, column: 42, scope: !1419)
!1422 = !DILocation(line: 303, column: 33, scope: !1419)
!1423 = !DILocation(line: 303, column: 50, scope: !1419)
!1424 = !DILocation(line: 303, column: 15, scope: !1419)
!1425 = !DILocation(line: 303, column: 5, scope: !1419)
!1426 = !DILocation(line: 303, column: 13, scope: !1419)
!1427 = !DILocation(line: 302, column: 29, scope: !1419)
!1428 = !DILocation(line: 302, column: 3, scope: !1419)
!1429 = distinct !{!1429, !1420, !1430, !130}
!1430 = !DILocation(line: 303, column: 53, scope: !1416)
!1431 = !DILocation(line: 304, column: 1, scope: !1410)
!1432 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !1033, file: !1033, line: 329, type: !1369, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1433 = !DILocalVariable(name: "r", arg: 1, scope: !1432, file: !1033, line: 329, type: !670)
!1434 = !DILocation(line: 0, scope: !1432)
!1435 = !DILocalVariable(name: "a", arg: 2, scope: !1432, file: !1033, line: 329, type: !1036)
!1436 = !DILocalVariable(name: "b", arg: 3, scope: !1432, file: !1033, line: 329, type: !1036)
!1437 = !DILocalVariable(name: "i", scope: !1432, file: !1033, line: 330, type: !40)
!1438 = !DILocation(line: 331, column: 8, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1432, file: !1033, line: 331, column: 3)
!1440 = !DILocation(line: 331, scope: !1439)
!1441 = !DILocation(line: 331, column: 17, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1439, file: !1033, line: 331, column: 3)
!1443 = !DILocation(line: 331, column: 3, scope: !1439)
!1444 = !DILocation(line: 332, column: 15, scope: !1442)
!1445 = !DILocation(line: 332, column: 25, scope: !1442)
!1446 = !DILocation(line: 332, column: 23, scope: !1442)
!1447 = !DILocation(line: 332, column: 5, scope: !1442)
!1448 = !DILocation(line: 332, column: 13, scope: !1442)
!1449 = !DILocation(line: 331, column: 29, scope: !1442)
!1450 = !DILocation(line: 331, column: 3, scope: !1442)
!1451 = distinct !{!1451, !1443, !1452, !130}
!1452 = !DILocation(line: 332, column: 31, scope: !1439)
!1453 = !DILocation(line: 333, column: 1, scope: !1432)
!1454 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !1033, file: !1033, line: 344, type: !1369, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1455 = !DILocalVariable(name: "r", arg: 1, scope: !1454, file: !1033, line: 344, type: !670)
!1456 = !DILocation(line: 0, scope: !1454)
!1457 = !DILocalVariable(name: "a", arg: 2, scope: !1454, file: !1033, line: 344, type: !1036)
!1458 = !DILocalVariable(name: "b", arg: 3, scope: !1454, file: !1033, line: 344, type: !1036)
!1459 = !DILocalVariable(name: "i", scope: !1454, file: !1033, line: 345, type: !40)
!1460 = !DILocation(line: 346, column: 8, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1454, file: !1033, line: 346, column: 3)
!1462 = !DILocation(line: 346, scope: !1461)
!1463 = !DILocation(line: 346, column: 17, scope: !1464)
!1464 = distinct !DILexicalBlock(scope: !1461, file: !1033, line: 346, column: 3)
!1465 = !DILocation(line: 346, column: 3, scope: !1461)
!1466 = !DILocation(line: 347, column: 15, scope: !1464)
!1467 = !DILocation(line: 347, column: 25, scope: !1464)
!1468 = !DILocation(line: 347, column: 23, scope: !1464)
!1469 = !DILocation(line: 347, column: 5, scope: !1464)
!1470 = !DILocation(line: 347, column: 13, scope: !1464)
!1471 = !DILocation(line: 346, column: 29, scope: !1464)
!1472 = !DILocation(line: 346, column: 3, scope: !1464)
!1473 = distinct !{!1473, !1465, !1474, !130}
!1474 = !DILocation(line: 347, column: 31, scope: !1461)
!1475 = !DILocation(line: 348, column: 1, scope: !1454)
!1476 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !58, file: !58, line: 80, type: !1477, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1477 = !DISubroutineType(types: !1478)
!1478 = !{null, !439}
!1479 = !DILocalVariable(name: "r", arg: 1, scope: !1476, file: !58, line: 80, type: !439)
!1480 = !DILocation(line: 0, scope: !1476)
!1481 = !DILocalVariable(name: "k", scope: !1476, file: !58, line: 81, type: !40)
!1482 = !DILocalVariable(name: "len", scope: !1476, file: !58, line: 81, type: !40)
!1483 = !DILocation(line: 85, column: 7, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1476, file: !58, line: 85, column: 3)
!1485 = !DILocation(line: 85, scope: !1484)
!1486 = !DILocation(line: 84, column: 5, scope: !1476)
!1487 = !DILocation(line: 85, column: 22, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1484, file: !58, line: 85, column: 3)
!1489 = !DILocation(line: 85, column: 3, scope: !1484)
!1490 = !DILocation(line: 86, column: 5, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1492, file: !58, line: 86, column: 5)
!1492 = distinct !DILexicalBlock(scope: !1488, file: !58, line: 85, column: 39)
!1493 = !DILocation(line: 86, scope: !1491)
!1494 = !DILocalVariable(name: "start", scope: !1476, file: !58, line: 81, type: !40)
!1495 = !DILocation(line: 86, column: 26, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1491, file: !58, line: 86, column: 5)
!1497 = !DILocation(line: 87, column: 14, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1496, file: !58, line: 86, column: 50)
!1499 = !DILocalVariable(name: "zeta", scope: !1476, file: !58, line: 82, type: !61)
!1500 = !DILocalVariable(name: "j", scope: !1476, file: !58, line: 81, type: !40)
!1501 = !DILocation(line: 88, column: 11, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1498, file: !58, line: 88, column: 7)
!1503 = !DILocation(line: 88, scope: !1502)
!1504 = !DILocation(line: 88, column: 32, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1502, file: !58, line: 88, column: 7)
!1506 = !DILocation(line: 88, column: 24, scope: !1505)
!1507 = !DILocation(line: 88, column: 7, scope: !1502)
!1508 = !DILocation(line: 89, column: 25, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1505, file: !58, line: 88, column: 44)
!1510 = !DILocation(line: 89, column: 13, scope: !1509)
!1511 = !DILocalVariable(name: "t", scope: !1476, file: !58, line: 82, type: !61)
!1512 = !DILocation(line: 90, column: 22, scope: !1509)
!1513 = !DILocation(line: 90, column: 27, scope: !1509)
!1514 = !DILocation(line: 90, column: 9, scope: !1509)
!1515 = !DILocation(line: 90, column: 20, scope: !1509)
!1516 = !DILocation(line: 91, column: 16, scope: !1509)
!1517 = !DILocation(line: 91, column: 21, scope: !1509)
!1518 = !DILocation(line: 91, column: 9, scope: !1509)
!1519 = !DILocation(line: 91, column: 14, scope: !1509)
!1520 = !DILocation(line: 88, column: 40, scope: !1505)
!1521 = !DILocation(line: 88, column: 7, scope: !1505)
!1522 = distinct !{!1522, !1507, !1523, !130}
!1523 = !DILocation(line: 92, column: 7, scope: !1502)
!1524 = !DILocation(line: 87, column: 21, scope: !1498)
!1525 = !DILocation(line: 86, column: 43, scope: !1496)
!1526 = !DILocation(line: 86, column: 5, scope: !1496)
!1527 = distinct !{!1527, !1490, !1528, !130}
!1528 = !DILocation(line: 93, column: 5, scope: !1491)
!1529 = !DILocation(line: 85, column: 32, scope: !1488)
!1530 = !DILocation(line: 85, column: 3, scope: !1488)
!1531 = distinct !{!1531, !1489, !1532, !130}
!1532 = !DILocation(line: 94, column: 3, scope: !1484)
!1533 = !DILocation(line: 95, column: 1, scope: !1476)
!1534 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1535, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!61, !61, !61}
!1537 = !DILocalVariable(name: "a", arg: 1, scope: !1534, file: !58, line: 68, type: !61)
!1538 = !DILocation(line: 0, scope: !1534)
!1539 = !DILocalVariable(name: "b", arg: 2, scope: !1534, file: !58, line: 68, type: !61)
!1540 = !DILocation(line: 69, column: 28, scope: !1534)
!1541 = !DILocation(line: 69, column: 39, scope: !1534)
!1542 = !DILocation(line: 69, column: 38, scope: !1534)
!1543 = !DILocation(line: 69, column: 10, scope: !1534)
!1544 = !DILocation(line: 69, column: 3, scope: !1534)
!1545 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !58, file: !58, line: 106, type: !1477, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1546 = !DILocalVariable(name: "r", arg: 1, scope: !1545, file: !58, line: 106, type: !439)
!1547 = !DILocation(line: 0, scope: !1545)
!1548 = !DILocalVariable(name: "f", scope: !1545, file: !58, line: 109, type: !60)
!1549 = !DILocalVariable(name: "k", scope: !1545, file: !58, line: 107, type: !40)
!1550 = !DILocalVariable(name: "len", scope: !1545, file: !58, line: 107, type: !40)
!1551 = !DILocation(line: 112, column: 7, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1545, file: !58, line: 112, column: 3)
!1553 = !DILocation(line: 112, scope: !1552)
!1554 = !DILocation(line: 111, column: 5, scope: !1545)
!1555 = !DILocation(line: 112, column: 20, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1552, file: !58, line: 112, column: 3)
!1557 = !DILocation(line: 112, column: 3, scope: !1552)
!1558 = !DILocation(line: 113, column: 5, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1560, file: !58, line: 113, column: 5)
!1560 = distinct !DILexicalBlock(scope: !1556, file: !58, line: 112, column: 39)
!1561 = !DILocation(line: 124, column: 3, scope: !1562)
!1562 = distinct !DILexicalBlock(scope: !1545, file: !58, line: 124, column: 3)
!1563 = !DILocation(line: 113, scope: !1559)
!1564 = !DILocalVariable(name: "start", scope: !1545, file: !58, line: 107, type: !40)
!1565 = !DILocation(line: 113, column: 26, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1559, file: !58, line: 113, column: 5)
!1567 = !DILocation(line: 114, column: 14, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1566, file: !58, line: 113, column: 50)
!1569 = !DILocalVariable(name: "zeta", scope: !1545, file: !58, line: 108, type: !61)
!1570 = !DILocalVariable(name: "j", scope: !1545, file: !58, line: 107, type: !40)
!1571 = !DILocation(line: 115, column: 11, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1568, file: !58, line: 115, column: 7)
!1573 = !DILocation(line: 115, scope: !1572)
!1574 = !DILocation(line: 115, column: 32, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1572, file: !58, line: 115, column: 7)
!1576 = !DILocation(line: 115, column: 24, scope: !1575)
!1577 = !DILocation(line: 115, column: 7, scope: !1572)
!1578 = !DILocation(line: 116, column: 13, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1575, file: !58, line: 115, column: 44)
!1580 = !DILocalVariable(name: "t", scope: !1545, file: !58, line: 108, type: !61)
!1581 = !DILocation(line: 117, column: 35, scope: !1579)
!1582 = !DILocation(line: 117, column: 33, scope: !1579)
!1583 = !DILocation(line: 117, column: 16, scope: !1579)
!1584 = !DILocation(line: 117, column: 9, scope: !1579)
!1585 = !DILocation(line: 117, column: 14, scope: !1579)
!1586 = !DILocation(line: 118, column: 22, scope: !1579)
!1587 = !DILocation(line: 118, column: 33, scope: !1579)
!1588 = !DILocation(line: 118, column: 9, scope: !1579)
!1589 = !DILocation(line: 118, column: 20, scope: !1579)
!1590 = !DILocation(line: 119, column: 34, scope: !1579)
!1591 = !DILocation(line: 119, column: 22, scope: !1579)
!1592 = !DILocation(line: 119, column: 9, scope: !1579)
!1593 = !DILocation(line: 119, column: 20, scope: !1579)
!1594 = !DILocation(line: 115, column: 40, scope: !1575)
!1595 = !DILocation(line: 115, column: 7, scope: !1575)
!1596 = distinct !{!1596, !1577, !1597, !130}
!1597 = !DILocation(line: 120, column: 7, scope: !1572)
!1598 = !DILocation(line: 114, column: 21, scope: !1568)
!1599 = !DILocation(line: 113, column: 43, scope: !1566)
!1600 = !DILocation(line: 113, column: 5, scope: !1566)
!1601 = distinct !{!1601, !1558, !1602, !130}
!1602 = !DILocation(line: 121, column: 5, scope: !1559)
!1603 = !DILocation(line: 112, column: 32, scope: !1556)
!1604 = !DILocation(line: 112, column: 3, scope: !1556)
!1605 = distinct !{!1605, !1557, !1606, !130}
!1606 = !DILocation(line: 122, column: 3, scope: !1552)
!1607 = !DILocation(line: 124, scope: !1562)
!1608 = !DILocation(line: 124, column: 16, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1562, file: !58, line: 124, column: 3)
!1610 = !DILocation(line: 125, column: 18, scope: !1609)
!1611 = !DILocation(line: 125, column: 12, scope: !1609)
!1612 = !DILocation(line: 125, column: 5, scope: !1609)
!1613 = !DILocation(line: 125, column: 10, scope: !1609)
!1614 = !DILocation(line: 124, column: 24, scope: !1609)
!1615 = !DILocation(line: 124, column: 3, scope: !1609)
!1616 = distinct !{!1616, !1561, !1617, !130}
!1617 = !DILocation(line: 125, column: 25, scope: !1562)
!1618 = !DILocation(line: 126, column: 1, scope: !1545)
!1619 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !58, file: !58, line: 139, type: !1620, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1620 = !DISubroutineType(types: !1621)
!1621 = !{null, !439, !1622, !1622, !61}
!1622 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1623 = !DILocalVariable(name: "r", arg: 1, scope: !1619, file: !58, line: 139, type: !439)
!1624 = !DILocation(line: 0, scope: !1619)
!1625 = !DILocalVariable(name: "a", arg: 2, scope: !1619, file: !58, line: 139, type: !1622)
!1626 = !DILocalVariable(name: "b", arg: 3, scope: !1619, file: !58, line: 139, type: !1622)
!1627 = !DILocalVariable(name: "zeta", arg: 4, scope: !1619, file: !58, line: 139, type: !61)
!1628 = !DILocation(line: 141, column: 17, scope: !1619)
!1629 = !DILocation(line: 141, column: 23, scope: !1619)
!1630 = !DILocation(line: 141, column: 11, scope: !1619)
!1631 = !DILocation(line: 141, column: 9, scope: !1619)
!1632 = !DILocation(line: 142, column: 11, scope: !1619)
!1633 = !DILocation(line: 142, column: 9, scope: !1619)
!1634 = !DILocation(line: 143, column: 17, scope: !1619)
!1635 = !DILocation(line: 143, column: 23, scope: !1619)
!1636 = !DILocation(line: 143, column: 11, scope: !1619)
!1637 = !DILocation(line: 143, column: 8, scope: !1619)
!1638 = !DILocation(line: 144, column: 17, scope: !1619)
!1639 = !DILocation(line: 144, column: 23, scope: !1619)
!1640 = !DILocation(line: 144, column: 11, scope: !1619)
!1641 = !DILocation(line: 144, column: 3, scope: !1619)
!1642 = !DILocation(line: 144, column: 9, scope: !1619)
!1643 = !DILocation(line: 145, column: 17, scope: !1619)
!1644 = !DILocation(line: 145, column: 23, scope: !1619)
!1645 = !DILocation(line: 145, column: 11, scope: !1619)
!1646 = !DILocation(line: 145, column: 3, scope: !1619)
!1647 = !DILocation(line: 145, column: 8, scope: !1619)
!1648 = !DILocation(line: 146, column: 1, scope: !1619)
!1649 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1650, file: !1650, line: 105, type: !1108, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1650 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1651 = !DILocalVariable(name: "r", arg: 1, scope: !1649, file: !1650, line: 105, type: !670)
!1652 = !DILocation(line: 0, scope: !1649)
!1653 = !DILocalVariable(name: "buf", arg: 2, scope: !1649, file: !1650, line: 105, type: !275)
!1654 = !DILocation(line: 109, column: 3, scope: !1649)
!1655 = !DILocation(line: 113, column: 1, scope: !1649)
!1656 = distinct !DISubprogram(name: "cbd3", scope: !1650, file: !1650, line: 85, type: !1108, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1657 = !DILocalVariable(name: "r", arg: 1, scope: !1656, file: !1650, line: 85, type: !670)
!1658 = !DILocation(line: 0, scope: !1656)
!1659 = !DILocalVariable(name: "buf", arg: 2, scope: !1656, file: !1650, line: 85, type: !275)
!1660 = !DILocalVariable(name: "i", scope: !1656, file: !1650, line: 86, type: !40)
!1661 = !DILocation(line: 90, column: 8, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1656, file: !1650, line: 90, column: 3)
!1663 = !DILocation(line: 90, scope: !1662)
!1664 = !DILocation(line: 90, column: 17, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1662, file: !1650, line: 90, column: 3)
!1666 = !DILocation(line: 90, column: 3, scope: !1662)
!1667 = !DILocation(line: 91, column: 37, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1665, file: !1650, line: 90, column: 37)
!1669 = !DILocation(line: 91, column: 33, scope: !1668)
!1670 = !DILocation(line: 91, column: 9, scope: !1668)
!1671 = !DILocalVariable(name: "t", scope: !1656, file: !1650, line: 87, type: !91)
!1672 = !DILocation(line: 92, column: 11, scope: !1668)
!1673 = !DILocalVariable(name: "d", scope: !1656, file: !1650, line: 87, type: !91)
!1674 = !DILocation(line: 93, column: 13, scope: !1668)
!1675 = !DILocation(line: 93, column: 19, scope: !1668)
!1676 = !DILocation(line: 93, column: 7, scope: !1668)
!1677 = !DILocation(line: 94, column: 13, scope: !1668)
!1678 = !DILocation(line: 94, column: 19, scope: !1668)
!1679 = !DILocation(line: 94, column: 7, scope: !1668)
!1680 = !DILocalVariable(name: "j", scope: !1656, file: !1650, line: 86, type: !40)
!1681 = !DILocation(line: 96, column: 10, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1668, file: !1650, line: 96, column: 5)
!1683 = !DILocation(line: 96, scope: !1682)
!1684 = !DILocation(line: 96, column: 19, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1682, file: !1650, line: 96, column: 5)
!1686 = !DILocation(line: 96, column: 5, scope: !1682)
!1687 = !DILocation(line: 97, column: 20, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1685, file: !1650, line: 96, column: 29)
!1689 = !DILocation(line: 97, column: 14, scope: !1688)
!1690 = !DILocation(line: 97, column: 11, scope: !1688)
!1691 = !DILocalVariable(name: "a", scope: !1656, file: !1650, line: 88, type: !61)
!1692 = !DILocation(line: 98, column: 20, scope: !1688)
!1693 = !DILocation(line: 98, column: 24, scope: !1688)
!1694 = !DILocation(line: 98, column: 14, scope: !1688)
!1695 = !DILocation(line: 98, column: 11, scope: !1688)
!1696 = !DILocalVariable(name: "b", scope: !1656, file: !1650, line: 88, type: !61)
!1697 = !DILocation(line: 99, column: 27, scope: !1688)
!1698 = !DILocation(line: 99, column: 25, scope: !1688)
!1699 = !DILocation(line: 99, column: 14, scope: !1688)
!1700 = !DILocation(line: 99, column: 18, scope: !1688)
!1701 = !DILocation(line: 99, column: 7, scope: !1688)
!1702 = !DILocation(line: 99, column: 23, scope: !1688)
!1703 = !DILocation(line: 96, column: 25, scope: !1685)
!1704 = !DILocation(line: 96, column: 5, scope: !1685)
!1705 = distinct !{!1705, !1686, !1706, !130}
!1706 = !DILocation(line: 100, column: 5, scope: !1682)
!1707 = !DILocation(line: 90, column: 33, scope: !1665)
!1708 = !DILocation(line: 90, column: 3, scope: !1665)
!1709 = distinct !{!1709, !1666, !1710, !130}
!1710 = !DILocation(line: 101, column: 3, scope: !1662)
!1711 = !DILocation(line: 102, column: 1, scope: !1656)
!1712 = distinct !DISubprogram(name: "load24_littleendian", scope: !1650, file: !1650, line: 36, type: !1713, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{!91, !275}
!1715 = !DILocalVariable(name: "x", arg: 1, scope: !1712, file: !1650, line: 36, type: !275)
!1716 = !DILocation(line: 0, scope: !1712)
!1717 = !DILocation(line: 38, column: 17, scope: !1712)
!1718 = !DILocation(line: 38, column: 7, scope: !1712)
!1719 = !DILocalVariable(name: "r", scope: !1712, file: !1650, line: 37, type: !91)
!1720 = !DILocation(line: 39, column: 18, scope: !1712)
!1721 = !DILocation(line: 39, column: 8, scope: !1712)
!1722 = !DILocation(line: 39, column: 23, scope: !1712)
!1723 = !DILocation(line: 39, column: 5, scope: !1712)
!1724 = !DILocation(line: 40, column: 18, scope: !1712)
!1725 = !DILocation(line: 40, column: 8, scope: !1712)
!1726 = !DILocation(line: 40, column: 23, scope: !1712)
!1727 = !DILocation(line: 40, column: 5, scope: !1712)
!1728 = !DILocation(line: 41, column: 3, scope: !1712)
!1729 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1650, file: !1650, line: 115, type: !1108, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1730 = !DILocalVariable(name: "r", arg: 1, scope: !1729, file: !1650, line: 115, type: !670)
!1731 = !DILocation(line: 0, scope: !1729)
!1732 = !DILocalVariable(name: "buf", arg: 2, scope: !1729, file: !1650, line: 115, type: !275)
!1733 = !DILocation(line: 117, column: 3, scope: !1729)
!1734 = !DILocation(line: 121, column: 1, scope: !1729)
!1735 = distinct !DISubprogram(name: "cbd2", scope: !1650, file: !1650, line: 55, type: !1108, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1736 = !DILocalVariable(name: "r", arg: 1, scope: !1735, file: !1650, line: 55, type: !670)
!1737 = !DILocation(line: 0, scope: !1735)
!1738 = !DILocalVariable(name: "buf", arg: 2, scope: !1735, file: !1650, line: 55, type: !275)
!1739 = !DILocalVariable(name: "i", scope: !1735, file: !1650, line: 56, type: !40)
!1740 = !DILocation(line: 60, column: 8, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1735, file: !1650, line: 60, column: 3)
!1742 = !DILocation(line: 60, scope: !1741)
!1743 = !DILocation(line: 60, column: 17, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1741, file: !1650, line: 60, column: 3)
!1745 = !DILocation(line: 60, column: 3, scope: !1741)
!1746 = !DILocation(line: 61, column: 37, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1744, file: !1650, line: 60, column: 37)
!1748 = !DILocation(line: 61, column: 33, scope: !1747)
!1749 = !DILocation(line: 61, column: 9, scope: !1747)
!1750 = !DILocalVariable(name: "t", scope: !1735, file: !1650, line: 57, type: !91)
!1751 = !DILocation(line: 62, column: 11, scope: !1747)
!1752 = !DILocalVariable(name: "d", scope: !1735, file: !1650, line: 57, type: !91)
!1753 = !DILocation(line: 63, column: 13, scope: !1747)
!1754 = !DILocation(line: 63, column: 19, scope: !1747)
!1755 = !DILocation(line: 63, column: 7, scope: !1747)
!1756 = !DILocalVariable(name: "j", scope: !1735, file: !1650, line: 56, type: !40)
!1757 = !DILocation(line: 65, column: 10, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1747, file: !1650, line: 65, column: 5)
!1759 = !DILocation(line: 65, scope: !1758)
!1760 = !DILocation(line: 65, column: 19, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1758, file: !1650, line: 65, column: 5)
!1762 = !DILocation(line: 65, column: 5, scope: !1758)
!1763 = !DILocation(line: 66, column: 20, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1761, file: !1650, line: 65, column: 29)
!1765 = !DILocation(line: 66, column: 14, scope: !1764)
!1766 = !DILocation(line: 66, column: 11, scope: !1764)
!1767 = !DILocalVariable(name: "a", scope: !1735, file: !1650, line: 58, type: !61)
!1768 = !DILocation(line: 67, column: 20, scope: !1764)
!1769 = !DILocation(line: 67, column: 24, scope: !1764)
!1770 = !DILocation(line: 67, column: 14, scope: !1764)
!1771 = !DILocation(line: 67, column: 11, scope: !1764)
!1772 = !DILocalVariable(name: "b", scope: !1735, file: !1650, line: 58, type: !61)
!1773 = !DILocation(line: 68, column: 27, scope: !1764)
!1774 = !DILocation(line: 68, column: 25, scope: !1764)
!1775 = !DILocation(line: 68, column: 14, scope: !1764)
!1776 = !DILocation(line: 68, column: 18, scope: !1764)
!1777 = !DILocation(line: 68, column: 7, scope: !1764)
!1778 = !DILocation(line: 68, column: 23, scope: !1764)
!1779 = !DILocation(line: 65, column: 25, scope: !1761)
!1780 = !DILocation(line: 65, column: 5, scope: !1761)
!1781 = distinct !{!1781, !1762, !1782, !130}
!1782 = !DILocation(line: 69, column: 5, scope: !1758)
!1783 = !DILocation(line: 60, column: 33, scope: !1744)
!1784 = !DILocation(line: 60, column: 3, scope: !1744)
!1785 = distinct !{!1785, !1745, !1786, !130}
!1786 = !DILocation(line: 70, column: 3, scope: !1741)
!1787 = !DILocation(line: 71, column: 1, scope: !1735)
!1788 = distinct !DISubprogram(name: "load32_littleendian", scope: !1650, file: !1650, line: 15, type: !1713, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1789 = !DILocalVariable(name: "x", arg: 1, scope: !1788, file: !1650, line: 15, type: !275)
!1790 = !DILocation(line: 0, scope: !1788)
!1791 = !DILocation(line: 17, column: 17, scope: !1788)
!1792 = !DILocation(line: 17, column: 7, scope: !1788)
!1793 = !DILocalVariable(name: "r", scope: !1788, file: !1650, line: 16, type: !91)
!1794 = !DILocation(line: 18, column: 18, scope: !1788)
!1795 = !DILocation(line: 18, column: 8, scope: !1788)
!1796 = !DILocation(line: 18, column: 23, scope: !1788)
!1797 = !DILocation(line: 18, column: 5, scope: !1788)
!1798 = !DILocation(line: 19, column: 18, scope: !1788)
!1799 = !DILocation(line: 19, column: 8, scope: !1788)
!1800 = !DILocation(line: 19, column: 23, scope: !1788)
!1801 = !DILocation(line: 19, column: 5, scope: !1788)
!1802 = !DILocation(line: 20, column: 18, scope: !1788)
!1803 = !DILocation(line: 20, column: 8, scope: !1788)
!1804 = !DILocation(line: 20, column: 23, scope: !1788)
!1805 = !DILocation(line: 20, column: 5, scope: !1788)
!1806 = !DILocation(line: 21, column: 3, scope: !1788)
!1807 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1808, file: !1808, line: 16, type: !1809, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1808 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1809 = !DISubroutineType(types: !98)
!1810 = !DILocalVariable(name: "a", arg: 1, scope: !1807, file: !1808, line: 16, type: !55)
!1811 = !DILocation(line: 0, scope: !1807)
!1812 = !DILocalVariable(name: "t", scope: !1807, file: !1808, line: 18, type: !61)
!1813 = !DILocation(line: 21, column: 12, scope: !1807)
!1814 = !DILocation(line: 21, column: 22, scope: !1807)
!1815 = !DILocation(line: 21, column: 10, scope: !1807)
!1816 = !DILocation(line: 21, column: 32, scope: !1807)
!1817 = !DILocation(line: 21, column: 7, scope: !1807)
!1818 = !DILocation(line: 22, column: 3, scope: !1807)
!1819 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1808, file: !1808, line: 35, type: !1820, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1820 = !DISubroutineType(types: !1821)
!1821 = !{!61, !61}
!1822 = !DILocalVariable(name: "a", arg: 1, scope: !1819, file: !1808, line: 35, type: !61)
!1823 = !DILocation(line: 0, scope: !1819)
!1824 = !DILocalVariable(name: "v", scope: !1819, file: !1808, line: 37, type: !60)
!1825 = !DILocation(line: 39, column: 20, scope: !1819)
!1826 = !DILocation(line: 39, column: 19, scope: !1819)
!1827 = !DILocation(line: 39, column: 22, scope: !1819)
!1828 = !DILocation(line: 39, column: 33, scope: !1819)
!1829 = !DILocalVariable(name: "t", scope: !1819, file: !1808, line: 36, type: !61)
!1830 = !DILocation(line: 41, column: 10, scope: !1819)
!1831 = !DILocation(line: 41, column: 3, scope: !1819)
!1832 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !1833, file: !1833, line: 16, type: !1834, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1833 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1834 = !DISubroutineType(types: !1835)
!1835 = !{!50, !275, !275, !38}
!1836 = !DILocalVariable(name: "a", arg: 1, scope: !1832, file: !1833, line: 16, type: !275)
!1837 = !DILocation(line: 0, scope: !1832)
!1838 = !DILocalVariable(name: "b", arg: 2, scope: !1832, file: !1833, line: 16, type: !275)
!1839 = !DILocalVariable(name: "len", arg: 3, scope: !1832, file: !1833, line: 16, type: !38)
!1840 = !DILocalVariable(name: "r", scope: !1832, file: !1833, line: 19, type: !33)
!1841 = !DILocalVariable(name: "i", scope: !1832, file: !1833, line: 18, type: !38)
!1842 = !DILocation(line: 21, column: 7, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1832, file: !1833, line: 21, column: 3)
!1844 = !DILocation(line: 21, scope: !1843)
!1845 = !DILocation(line: 21, column: 12, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1843, file: !1833, line: 21, column: 3)
!1847 = !DILocation(line: 21, column: 3, scope: !1843)
!1848 = !DILocation(line: 22, column: 10, scope: !1846)
!1849 = !DILocation(line: 22, column: 17, scope: !1846)
!1850 = !DILocation(line: 22, column: 15, scope: !1846)
!1851 = !DILocation(line: 22, column: 7, scope: !1846)
!1852 = !DILocation(line: 21, column: 18, scope: !1846)
!1853 = !DILocation(line: 21, column: 3, scope: !1846)
!1854 = distinct !{!1854, !1847, !1855, !130}
!1855 = !DILocation(line: 22, column: 20, scope: !1843)
!1856 = !DILocation(line: 24, column: 25, scope: !1832)
!1857 = !DILocation(line: 24, column: 10, scope: !1832)
!1858 = !DILocation(line: 24, column: 3, scope: !1832)
!1859 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !1833, file: !1833, line: 40, type: !1860, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1860 = !DISubroutineType(types: !1861)
!1861 = !{null, !32, !275, !38, !33}
!1862 = !DILocalVariable(name: "r", arg: 1, scope: !1859, file: !1833, line: 40, type: !32)
!1863 = !DILocation(line: 0, scope: !1859)
!1864 = !DILocalVariable(name: "x", arg: 2, scope: !1859, file: !1833, line: 40, type: !275)
!1865 = !DILocalVariable(name: "len", arg: 3, scope: !1859, file: !1833, line: 40, type: !38)
!1866 = !DILocalVariable(name: "b", arg: 4, scope: !1859, file: !1833, line: 40, type: !33)
!1867 = !DILocation(line: 51, column: 3, scope: !1859)
!1868 = !{i64 1722}
!1869 = !DILocation(line: 54, column: 7, scope: !1859)
!1870 = !DILocalVariable(name: "i", scope: !1859, file: !1833, line: 42, type: !38)
!1871 = !DILocation(line: 55, column: 7, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1859, file: !1833, line: 55, column: 3)
!1873 = !DILocation(line: 55, scope: !1872)
!1874 = !DILocation(line: 55, column: 12, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1872, file: !1833, line: 55, column: 3)
!1876 = !DILocation(line: 55, column: 3, scope: !1872)
!1877 = !DILocation(line: 56, column: 18, scope: !1875)
!1878 = !DILocation(line: 56, column: 25, scope: !1875)
!1879 = !DILocation(line: 56, column: 23, scope: !1875)
!1880 = !DILocation(line: 56, column: 15, scope: !1875)
!1881 = !DILocation(line: 56, column: 5, scope: !1875)
!1882 = !DILocation(line: 56, column: 10, scope: !1875)
!1883 = !DILocation(line: 55, column: 18, scope: !1875)
!1884 = !DILocation(line: 55, column: 3, scope: !1875)
!1885 = distinct !{!1885, !1876, !1886, !130}
!1886 = !DILocation(line: 56, column: 29, scope: !1872)
!1887 = !DILocation(line: 57, column: 1, scope: !1859)
!1888 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !1833, file: !1833, line: 71, type: !1889, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1889 = !DISubroutineType(types: !1890)
!1890 = !{null, !439, !61, !86}
!1891 = !DILocalVariable(name: "r", arg: 1, scope: !1888, file: !1833, line: 71, type: !439)
!1892 = !DILocation(line: 0, scope: !1888)
!1893 = !DILocalVariable(name: "v", arg: 2, scope: !1888, file: !1833, line: 71, type: !61)
!1894 = !DILocalVariable(name: "b", arg: 3, scope: !1888, file: !1833, line: 71, type: !86)
!1895 = !DILocation(line: 73, column: 7, scope: !1888)
!1896 = !DILocation(line: 74, column: 15, scope: !1888)
!1897 = !DILocation(line: 74, column: 19, scope: !1888)
!1898 = !DILocation(line: 74, column: 11, scope: !1888)
!1899 = !DILocation(line: 74, column: 6, scope: !1888)
!1900 = !DILocation(line: 75, column: 1, scope: !1888)
!1901 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 497, type: !1902, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1902 = !DISubroutineType(types: !1903)
!1903 = !{null, !1904}
!1904 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 32)
!1905 = !DILocalVariable(name: "state", arg: 1, scope: !1901, file: !74, line: 497, type: !1904)
!1906 = !DILocation(line: 0, scope: !1901)
!1907 = !DILocation(line: 498, column: 3, scope: !1901)
!1908 = !DILocation(line: 499, column: 3, scope: !1901)
!1909 = !DILocation(line: 499, column: 29, scope: !1901)
!1910 = !DILocation(line: 500, column: 1, scope: !1901)
!1911 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 340, type: !1912, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1912 = !DISubroutineType(types: !1913)
!1913 = !{null, !1914}
!1914 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!1915 = !DILocalVariable(name: "s", arg: 1, scope: !1911, file: !74, line: 340, type: !1914)
!1916 = !DILocation(line: 0, scope: !1911)
!1917 = !DILocalVariable(name: "i", scope: !1911, file: !74, line: 341, type: !40)
!1918 = !DILocation(line: 342, column: 8, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1911, file: !74, line: 342, column: 3)
!1920 = !DILocation(line: 342, scope: !1919)
!1921 = !DILocation(line: 342, column: 17, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1919, file: !74, line: 342, column: 3)
!1923 = !DILocation(line: 342, column: 3, scope: !1919)
!1924 = !DILocation(line: 343, column: 5, scope: !1922)
!1925 = !DILocation(line: 343, column: 10, scope: !1922)
!1926 = !DILocation(line: 342, column: 24, scope: !1922)
!1927 = !DILocation(line: 342, column: 3, scope: !1922)
!1928 = distinct !{!1928, !1923, !1929, !130}
!1929 = !DILocation(line: 343, column: 12, scope: !1919)
!1930 = !DILocation(line: 344, column: 1, scope: !1911)
!1931 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 512, type: !1932, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1932 = !DISubroutineType(types: !1933)
!1933 = !{null, !1904, !275, !38}
!1934 = !DILocalVariable(name: "state", arg: 1, scope: !1931, file: !74, line: 512, type: !1904)
!1935 = !DILocation(line: 0, scope: !1931)
!1936 = !DILocalVariable(name: "in", arg: 2, scope: !1931, file: !74, line: 512, type: !275)
!1937 = !DILocalVariable(name: "inlen", arg: 3, scope: !1931, file: !74, line: 512, type: !38)
!1938 = !DILocation(line: 513, column: 53, scope: !1931)
!1939 = !DILocation(line: 513, column: 31, scope: !1931)
!1940 = !DILocation(line: 513, column: 3, scope: !1931)
!1941 = !DILocation(line: 513, column: 29, scope: !1931)
!1942 = !DILocation(line: 515, column: 1, scope: !1931)
!1943 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 359, type: !1944, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1944 = !DISubroutineType(types: !1945)
!1945 = !{!40, !1914, !40, !40, !275, !38}
!1946 = !DILocalVariable(name: "s", arg: 1, scope: !1943, file: !74, line: 359, type: !1914)
!1947 = !DILocation(line: 0, scope: !1943)
!1948 = !DILocalVariable(name: "pos", arg: 2, scope: !1943, file: !74, line: 359, type: !40)
!1949 = !DILocalVariable(name: "r", arg: 3, scope: !1943, file: !74, line: 360, type: !40)
!1950 = !DILocalVariable(name: "in", arg: 4, scope: !1943, file: !74, line: 360, type: !275)
!1951 = !DILocalVariable(name: "inlen", arg: 5, scope: !1943, file: !74, line: 361, type: !38)
!1952 = !DILocation(line: 364, column: 3, scope: !1943)
!1953 = !DILocation(line: 364, column: 14, scope: !1943)
!1954 = !DILocation(line: 364, column: 22, scope: !1943)
!1955 = !DILocation(line: 365, column: 5, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1957, file: !74, line: 365, column: 5)
!1957 = distinct !DILexicalBlock(scope: !1943, file: !74, line: 364, column: 28)
!1958 = !DILocation(line: 372, column: 3, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1943, file: !74, line: 372, column: 3)
!1960 = !DILocation(line: 365, scope: !1956)
!1961 = !DILocalVariable(name: "i", scope: !1943, file: !74, line: 362, type: !40)
!1962 = !DILocation(line: 365, column: 21, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1956, file: !74, line: 365, column: 5)
!1964 = !DILocation(line: 366, column: 29, scope: !1963)
!1965 = !DILocation(line: 366, column: 19, scope: !1963)
!1966 = !DILocation(line: 366, column: 40, scope: !1963)
!1967 = !DILocation(line: 366, column: 35, scope: !1963)
!1968 = !DILocation(line: 366, column: 11, scope: !1963)
!1969 = !DILocation(line: 366, column: 7, scope: !1963)
!1970 = !DILocation(line: 366, column: 16, scope: !1963)
!1971 = !DILocation(line: 366, column: 32, scope: !1963)
!1972 = !DILocation(line: 365, column: 27, scope: !1963)
!1973 = !DILocation(line: 365, column: 5, scope: !1963)
!1974 = distinct !{!1974, !1955, !1975, !130}
!1975 = !DILocation(line: 366, column: 48, scope: !1956)
!1976 = !DILocation(line: 367, column: 16, scope: !1957)
!1977 = !DILocation(line: 367, column: 11, scope: !1957)
!1978 = !DILocation(line: 368, column: 5, scope: !1957)
!1979 = distinct !{!1979, !1952, !1980, !130}
!1980 = !DILocation(line: 370, column: 3, scope: !1943)
!1981 = !DILocation(line: 372, scope: !1959)
!1982 = !DILocation(line: 372, column: 25, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1959, file: !74, line: 372, column: 3)
!1984 = !DILocation(line: 372, column: 19, scope: !1983)
!1985 = !DILocation(line: 373, column: 27, scope: !1983)
!1986 = !DILocation(line: 373, column: 17, scope: !1983)
!1987 = !DILocation(line: 373, column: 38, scope: !1983)
!1988 = !DILocation(line: 373, column: 33, scope: !1983)
!1989 = !DILocation(line: 373, column: 9, scope: !1983)
!1990 = !DILocation(line: 373, column: 5, scope: !1983)
!1991 = !DILocation(line: 373, column: 14, scope: !1983)
!1992 = !DILocation(line: 373, column: 30, scope: !1983)
!1993 = !DILocation(line: 372, column: 35, scope: !1983)
!1994 = !DILocation(line: 372, column: 3, scope: !1983)
!1995 = distinct !{!1995, !1958, !1996, !130}
!1996 = !DILocation(line: 373, column: 46, scope: !1959)
!1997 = !DILocation(line: 375, column: 3, scope: !1943)
!1998 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 70, type: !1912, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1999 = !DILocalVariable(name: "state", arg: 1, scope: !1998, file: !74, line: 70, type: !1914)
!2000 = !DILocation(line: 0, scope: !1998)
!2001 = !DILocation(line: 87, column: 9, scope: !1998)
!2002 = !DILocalVariable(name: "Aba", scope: !1998, file: !74, line: 73, type: !70)
!2003 = !DILocation(line: 88, column: 9, scope: !1998)
!2004 = !DILocalVariable(name: "Abe", scope: !1998, file: !74, line: 73, type: !70)
!2005 = !DILocation(line: 89, column: 9, scope: !1998)
!2006 = !DILocalVariable(name: "Abi", scope: !1998, file: !74, line: 73, type: !70)
!2007 = !DILocation(line: 90, column: 9, scope: !1998)
!2008 = !DILocalVariable(name: "Abo", scope: !1998, file: !74, line: 73, type: !70)
!2009 = !DILocation(line: 91, column: 9, scope: !1998)
!2010 = !DILocalVariable(name: "Abu", scope: !1998, file: !74, line: 73, type: !70)
!2011 = !DILocation(line: 92, column: 9, scope: !1998)
!2012 = !DILocalVariable(name: "Aga", scope: !1998, file: !74, line: 74, type: !70)
!2013 = !DILocation(line: 93, column: 9, scope: !1998)
!2014 = !DILocalVariable(name: "Age", scope: !1998, file: !74, line: 74, type: !70)
!2015 = !DILocation(line: 94, column: 9, scope: !1998)
!2016 = !DILocalVariable(name: "Agi", scope: !1998, file: !74, line: 74, type: !70)
!2017 = !DILocation(line: 95, column: 9, scope: !1998)
!2018 = !DILocalVariable(name: "Ago", scope: !1998, file: !74, line: 74, type: !70)
!2019 = !DILocation(line: 96, column: 9, scope: !1998)
!2020 = !DILocalVariable(name: "Agu", scope: !1998, file: !74, line: 74, type: !70)
!2021 = !DILocation(line: 97, column: 9, scope: !1998)
!2022 = !DILocalVariable(name: "Aka", scope: !1998, file: !74, line: 75, type: !70)
!2023 = !DILocation(line: 98, column: 9, scope: !1998)
!2024 = !DILocalVariable(name: "Ake", scope: !1998, file: !74, line: 75, type: !70)
!2025 = !DILocation(line: 99, column: 9, scope: !1998)
!2026 = !DILocalVariable(name: "Aki", scope: !1998, file: !74, line: 75, type: !70)
!2027 = !DILocation(line: 100, column: 9, scope: !1998)
!2028 = !DILocalVariable(name: "Ako", scope: !1998, file: !74, line: 75, type: !70)
!2029 = !DILocation(line: 101, column: 9, scope: !1998)
!2030 = !DILocalVariable(name: "Aku", scope: !1998, file: !74, line: 75, type: !70)
!2031 = !DILocation(line: 102, column: 9, scope: !1998)
!2032 = !DILocalVariable(name: "Ama", scope: !1998, file: !74, line: 76, type: !70)
!2033 = !DILocation(line: 103, column: 9, scope: !1998)
!2034 = !DILocalVariable(name: "Ame", scope: !1998, file: !74, line: 76, type: !70)
!2035 = !DILocation(line: 104, column: 9, scope: !1998)
!2036 = !DILocalVariable(name: "Ami", scope: !1998, file: !74, line: 76, type: !70)
!2037 = !DILocation(line: 105, column: 9, scope: !1998)
!2038 = !DILocalVariable(name: "Amo", scope: !1998, file: !74, line: 76, type: !70)
!2039 = !DILocation(line: 106, column: 9, scope: !1998)
!2040 = !DILocalVariable(name: "Amu", scope: !1998, file: !74, line: 76, type: !70)
!2041 = !DILocation(line: 107, column: 9, scope: !1998)
!2042 = !DILocalVariable(name: "Asa", scope: !1998, file: !74, line: 77, type: !70)
!2043 = !DILocation(line: 108, column: 9, scope: !1998)
!2044 = !DILocalVariable(name: "Ase", scope: !1998, file: !74, line: 77, type: !70)
!2045 = !DILocation(line: 109, column: 9, scope: !1998)
!2046 = !DILocalVariable(name: "Asi", scope: !1998, file: !74, line: 77, type: !70)
!2047 = !DILocation(line: 110, column: 9, scope: !1998)
!2048 = !DILocalVariable(name: "Aso", scope: !1998, file: !74, line: 77, type: !70)
!2049 = !DILocation(line: 111, column: 9, scope: !1998)
!2050 = !DILocalVariable(name: "Asu", scope: !1998, file: !74, line: 77, type: !70)
!2051 = !DILocalVariable(name: "round", scope: !1998, file: !74, line: 71, type: !50)
!2052 = !DILocation(line: 113, column: 8, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !1998, file: !74, line: 113, column: 3)
!2054 = !DILocation(line: 113, scope: !2053)
!2055 = !DILocation(line: 113, column: 25, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2053, file: !74, line: 113, column: 3)
!2057 = !DILocation(line: 113, column: 3, scope: !2053)
!2058 = !DILocalVariable(name: "BCa", scope: !1998, file: !74, line: 78, type: !70)
!2059 = !DILocalVariable(name: "BCe", scope: !1998, file: !74, line: 78, type: !70)
!2060 = !DILocalVariable(name: "BCi", scope: !1998, file: !74, line: 78, type: !70)
!2061 = !DILocalVariable(name: "BCo", scope: !1998, file: !74, line: 78, type: !70)
!2062 = !DILocalVariable(name: "BCu", scope: !1998, file: !74, line: 78, type: !70)
!2063 = !DILocalVariable(name: "Da", scope: !1998, file: !74, line: 79, type: !70)
!2064 = !DILocalVariable(name: "De", scope: !1998, file: !74, line: 79, type: !70)
!2065 = !DILocalVariable(name: "Di", scope: !1998, file: !74, line: 79, type: !70)
!2066 = !DILocalVariable(name: "Do", scope: !1998, file: !74, line: 79, type: !70)
!2067 = !DILocalVariable(name: "Du", scope: !1998, file: !74, line: 79, type: !70)
!2068 = !DILocalVariable(name: "Eba", scope: !1998, file: !74, line: 80, type: !70)
!2069 = !DILocalVariable(name: "Ebe", scope: !1998, file: !74, line: 80, type: !70)
!2070 = !DILocalVariable(name: "Ebi", scope: !1998, file: !74, line: 80, type: !70)
!2071 = !DILocalVariable(name: "Ebo", scope: !1998, file: !74, line: 80, type: !70)
!2072 = !DILocalVariable(name: "Ebu", scope: !1998, file: !74, line: 80, type: !70)
!2073 = !DILocalVariable(name: "Ega", scope: !1998, file: !74, line: 81, type: !70)
!2074 = !DILocalVariable(name: "Ege", scope: !1998, file: !74, line: 81, type: !70)
!2075 = !DILocalVariable(name: "Egi", scope: !1998, file: !74, line: 81, type: !70)
!2076 = !DILocalVariable(name: "Ego", scope: !1998, file: !74, line: 81, type: !70)
!2077 = !DILocalVariable(name: "Egu", scope: !1998, file: !74, line: 81, type: !70)
!2078 = !DILocalVariable(name: "Eka", scope: !1998, file: !74, line: 82, type: !70)
!2079 = !DILocalVariable(name: "Eke", scope: !1998, file: !74, line: 82, type: !70)
!2080 = !DILocalVariable(name: "Eki", scope: !1998, file: !74, line: 82, type: !70)
!2081 = !DILocalVariable(name: "Eko", scope: !1998, file: !74, line: 82, type: !70)
!2082 = !DILocalVariable(name: "Eku", scope: !1998, file: !74, line: 82, type: !70)
!2083 = !DILocalVariable(name: "Ema", scope: !1998, file: !74, line: 83, type: !70)
!2084 = !DILocalVariable(name: "Eme", scope: !1998, file: !74, line: 83, type: !70)
!2085 = !DILocalVariable(name: "Emi", scope: !1998, file: !74, line: 83, type: !70)
!2086 = !DILocalVariable(name: "Emo", scope: !1998, file: !74, line: 83, type: !70)
!2087 = !DILocalVariable(name: "Emu", scope: !1998, file: !74, line: 83, type: !70)
!2088 = !DILocalVariable(name: "Esa", scope: !1998, file: !74, line: 84, type: !70)
!2089 = !DILocalVariable(name: "Ese", scope: !1998, file: !74, line: 84, type: !70)
!2090 = !DILocalVariable(name: "Esi", scope: !1998, file: !74, line: 84, type: !70)
!2091 = !DILocalVariable(name: "Eso", scope: !1998, file: !74, line: 84, type: !70)
!2092 = !DILocalVariable(name: "Esu", scope: !1998, file: !74, line: 84, type: !70)
!2093 = !DILocation(line: 117, column: 15, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2056, file: !74, line: 113, column: 48)
!2095 = !DILocation(line: 117, column: 21, scope: !2094)
!2096 = !DILocation(line: 117, column: 27, scope: !2094)
!2097 = !DILocation(line: 117, column: 33, scope: !2094)
!2098 = !DILocation(line: 119, column: 15, scope: !2094)
!2099 = !DILocation(line: 119, column: 21, scope: !2094)
!2100 = !DILocation(line: 119, column: 27, scope: !2094)
!2101 = !DILocation(line: 119, column: 33, scope: !2094)
!2102 = !DILocation(line: 125, column: 16, scope: !2094)
!2103 = !DILocation(line: 125, column: 14, scope: !2094)
!2104 = !DILocation(line: 195, column: 9, scope: !2094)
!2105 = !DILocation(line: 196, column: 11, scope: !2094)
!2106 = !DILocation(line: 116, column: 15, scope: !2094)
!2107 = !DILocation(line: 116, column: 21, scope: !2094)
!2108 = !DILocation(line: 116, column: 27, scope: !2094)
!2109 = !DILocation(line: 116, column: 33, scope: !2094)
!2110 = !DILocation(line: 122, column: 16, scope: !2094)
!2111 = !DILocation(line: 122, column: 14, scope: !2094)
!2112 = !DILocation(line: 199, column: 9, scope: !2094)
!2113 = !DILocation(line: 200, column: 11, scope: !2094)
!2114 = !DILocation(line: 118, column: 15, scope: !2094)
!2115 = !DILocation(line: 118, column: 21, scope: !2094)
!2116 = !DILocation(line: 118, column: 27, scope: !2094)
!2117 = !DILocation(line: 118, column: 33, scope: !2094)
!2118 = !DILocation(line: 115, column: 15, scope: !2094)
!2119 = !DILocation(line: 115, column: 21, scope: !2094)
!2120 = !DILocation(line: 115, column: 27, scope: !2094)
!2121 = !DILocation(line: 115, column: 33, scope: !2094)
!2122 = !DILocation(line: 126, column: 16, scope: !2094)
!2123 = !DILocation(line: 126, column: 14, scope: !2094)
!2124 = !DILocation(line: 197, column: 9, scope: !2094)
!2125 = !DILocation(line: 198, column: 11, scope: !2094)
!2126 = !DILocation(line: 204, column: 19, scope: !2094)
!2127 = !DILocation(line: 204, column: 25, scope: !2094)
!2128 = !DILocation(line: 204, column: 15, scope: !2094)
!2129 = !DILocation(line: 124, column: 16, scope: !2094)
!2130 = !DILocation(line: 124, column: 14, scope: !2094)
!2131 = !DILocation(line: 132, column: 9, scope: !2094)
!2132 = !DILocation(line: 133, column: 11, scope: !2094)
!2133 = !DILocation(line: 123, column: 16, scope: !2094)
!2134 = !DILocation(line: 123, column: 14, scope: !2094)
!2135 = !DILocation(line: 130, column: 9, scope: !2094)
!2136 = !DILocation(line: 131, column: 11, scope: !2094)
!2137 = !DILocation(line: 138, column: 19, scope: !2094)
!2138 = !DILocation(line: 138, column: 25, scope: !2094)
!2139 = !DILocation(line: 139, column: 22, scope: !2094)
!2140 = !DILocation(line: 139, column: 9, scope: !2094)
!2141 = !DILocation(line: 128, column: 9, scope: !2094)
!2142 = !DILocation(line: 145, column: 9, scope: !2094)
!2143 = !DILocation(line: 146, column: 11, scope: !2094)
!2144 = !DILocation(line: 149, column: 9, scope: !2094)
!2145 = !DILocation(line: 150, column: 11, scope: !2094)
!2146 = !DILocation(line: 147, column: 9, scope: !2094)
!2147 = !DILocation(line: 148, column: 11, scope: !2094)
!2148 = !DILocation(line: 155, column: 19, scope: !2094)
!2149 = !DILocation(line: 155, column: 25, scope: !2094)
!2150 = !DILocation(line: 155, column: 15, scope: !2094)
!2151 = !DILocation(line: 210, column: 15, scope: !2094)
!2152 = !DILocation(line: 161, column: 9, scope: !2094)
!2153 = !DILocation(line: 162, column: 11, scope: !2094)
!2154 = !DILocation(line: 165, column: 9, scope: !2094)
!2155 = !DILocation(line: 166, column: 11, scope: !2094)
!2156 = !DILocation(line: 163, column: 9, scope: !2094)
!2157 = !DILocation(line: 164, column: 11, scope: !2094)
!2158 = !DILocation(line: 171, column: 19, scope: !2094)
!2159 = !DILocation(line: 171, column: 25, scope: !2094)
!2160 = !DILocation(line: 171, column: 15, scope: !2094)
!2161 = !DILocation(line: 210, column: 21, scope: !2094)
!2162 = !DILocation(line: 177, column: 9, scope: !2094)
!2163 = !DILocation(line: 178, column: 11, scope: !2094)
!2164 = !DILocation(line: 181, column: 9, scope: !2094)
!2165 = !DILocation(line: 182, column: 11, scope: !2094)
!2166 = !DILocation(line: 179, column: 9, scope: !2094)
!2167 = !DILocation(line: 180, column: 11, scope: !2094)
!2168 = !DILocation(line: 187, column: 19, scope: !2094)
!2169 = !DILocation(line: 187, column: 25, scope: !2094)
!2170 = !DILocation(line: 187, column: 15, scope: !2094)
!2171 = !DILocation(line: 210, column: 27, scope: !2094)
!2172 = !DILocation(line: 193, column: 9, scope: !2094)
!2173 = !DILocation(line: 194, column: 11, scope: !2094)
!2174 = !DILocation(line: 203, column: 19, scope: !2094)
!2175 = !DILocation(line: 203, column: 25, scope: !2094)
!2176 = !DILocation(line: 203, column: 15, scope: !2094)
!2177 = !DILocation(line: 210, column: 33, scope: !2094)
!2178 = !DILocation(line: 136, column: 9, scope: !2094)
!2179 = !DILocation(line: 137, column: 11, scope: !2094)
!2180 = !DILocation(line: 134, column: 9, scope: !2094)
!2181 = !DILocation(line: 135, column: 11, scope: !2094)
!2182 = !DILocation(line: 141, column: 19, scope: !2094)
!2183 = !DILocation(line: 141, column: 25, scope: !2094)
!2184 = !DILocation(line: 141, column: 15, scope: !2094)
!2185 = !DILocation(line: 153, column: 9, scope: !2094)
!2186 = !DILocation(line: 154, column: 11, scope: !2094)
!2187 = !DILocation(line: 151, column: 9, scope: !2094)
!2188 = !DILocation(line: 152, column: 11, scope: !2094)
!2189 = !DILocation(line: 157, column: 19, scope: !2094)
!2190 = !DILocation(line: 157, column: 25, scope: !2094)
!2191 = !DILocation(line: 157, column: 15, scope: !2094)
!2192 = !DILocation(line: 212, column: 15, scope: !2094)
!2193 = !DILocation(line: 169, column: 9, scope: !2094)
!2194 = !DILocation(line: 170, column: 11, scope: !2094)
!2195 = !DILocation(line: 167, column: 9, scope: !2094)
!2196 = !DILocation(line: 168, column: 11, scope: !2094)
!2197 = !DILocation(line: 173, column: 19, scope: !2094)
!2198 = !DILocation(line: 173, column: 25, scope: !2094)
!2199 = !DILocation(line: 173, column: 15, scope: !2094)
!2200 = !DILocation(line: 212, column: 21, scope: !2094)
!2201 = !DILocation(line: 185, column: 9, scope: !2094)
!2202 = !DILocation(line: 186, column: 11, scope: !2094)
!2203 = !DILocation(line: 183, column: 9, scope: !2094)
!2204 = !DILocation(line: 184, column: 11, scope: !2094)
!2205 = !DILocation(line: 189, column: 19, scope: !2094)
!2206 = !DILocation(line: 189, column: 25, scope: !2094)
!2207 = !DILocation(line: 189, column: 15, scope: !2094)
!2208 = !DILocation(line: 212, column: 27, scope: !2094)
!2209 = !DILocation(line: 201, column: 9, scope: !2094)
!2210 = !DILocation(line: 202, column: 11, scope: !2094)
!2211 = !DILocation(line: 205, column: 19, scope: !2094)
!2212 = !DILocation(line: 205, column: 25, scope: !2094)
!2213 = !DILocation(line: 205, column: 15, scope: !2094)
!2214 = !DILocation(line: 212, column: 33, scope: !2094)
!2215 = !DILocation(line: 218, column: 16, scope: !2094)
!2216 = !DILocation(line: 218, column: 14, scope: !2094)
!2217 = !DILocation(line: 296, column: 9, scope: !2094)
!2218 = !DILocation(line: 297, column: 11, scope: !2094)
!2219 = !DILocation(line: 158, column: 19, scope: !2094)
!2220 = !DILocation(line: 158, column: 25, scope: !2094)
!2221 = !DILocation(line: 158, column: 15, scope: !2094)
!2222 = !DILocation(line: 143, column: 19, scope: !2094)
!2223 = !DILocation(line: 143, column: 25, scope: !2094)
!2224 = !DILocation(line: 143, column: 15, scope: !2094)
!2225 = !DILocation(line: 159, column: 19, scope: !2094)
!2226 = !DILocation(line: 159, column: 25, scope: !2094)
!2227 = !DILocation(line: 159, column: 15, scope: !2094)
!2228 = !DILocation(line: 214, column: 15, scope: !2094)
!2229 = !DILocation(line: 175, column: 19, scope: !2094)
!2230 = !DILocation(line: 175, column: 25, scope: !2094)
!2231 = !DILocation(line: 175, column: 15, scope: !2094)
!2232 = !DILocation(line: 214, column: 21, scope: !2094)
!2233 = !DILocation(line: 191, column: 19, scope: !2094)
!2234 = !DILocation(line: 191, column: 25, scope: !2094)
!2235 = !DILocation(line: 191, column: 15, scope: !2094)
!2236 = !DILocation(line: 214, column: 27, scope: !2094)
!2237 = !DILocation(line: 207, column: 19, scope: !2094)
!2238 = !DILocation(line: 207, column: 25, scope: !2094)
!2239 = !DILocation(line: 207, column: 15, scope: !2094)
!2240 = !DILocation(line: 214, column: 33, scope: !2094)
!2241 = !DILocation(line: 220, column: 16, scope: !2094)
!2242 = !DILocation(line: 220, column: 14, scope: !2094)
!2243 = !DILocation(line: 290, column: 9, scope: !2094)
!2244 = !DILocation(line: 291, column: 11, scope: !2094)
!2245 = !DILocation(line: 140, column: 19, scope: !2094)
!2246 = !DILocation(line: 140, column: 25, scope: !2094)
!2247 = !DILocation(line: 140, column: 15, scope: !2094)
!2248 = !DILocation(line: 156, column: 19, scope: !2094)
!2249 = !DILocation(line: 156, column: 25, scope: !2094)
!2250 = !DILocation(line: 156, column: 15, scope: !2094)
!2251 = !DILocation(line: 211, column: 15, scope: !2094)
!2252 = !DILocation(line: 172, column: 19, scope: !2094)
!2253 = !DILocation(line: 172, column: 25, scope: !2094)
!2254 = !DILocation(line: 172, column: 15, scope: !2094)
!2255 = !DILocation(line: 211, column: 21, scope: !2094)
!2256 = !DILocation(line: 188, column: 19, scope: !2094)
!2257 = !DILocation(line: 188, column: 25, scope: !2094)
!2258 = !DILocation(line: 188, column: 15, scope: !2094)
!2259 = !DILocation(line: 211, column: 27, scope: !2094)
!2260 = !DILocation(line: 211, column: 33, scope: !2094)
!2261 = !DILocation(line: 142, column: 19, scope: !2094)
!2262 = !DILocation(line: 142, column: 25, scope: !2094)
!2263 = !DILocation(line: 142, column: 15, scope: !2094)
!2264 = !DILocation(line: 213, column: 15, scope: !2094)
!2265 = !DILocation(line: 174, column: 19, scope: !2094)
!2266 = !DILocation(line: 174, column: 25, scope: !2094)
!2267 = !DILocation(line: 174, column: 15, scope: !2094)
!2268 = !DILocation(line: 213, column: 21, scope: !2094)
!2269 = !DILocation(line: 190, column: 19, scope: !2094)
!2270 = !DILocation(line: 190, column: 25, scope: !2094)
!2271 = !DILocation(line: 190, column: 15, scope: !2094)
!2272 = !DILocation(line: 213, column: 27, scope: !2094)
!2273 = !DILocation(line: 206, column: 19, scope: !2094)
!2274 = !DILocation(line: 206, column: 25, scope: !2094)
!2275 = !DILocation(line: 206, column: 15, scope: !2094)
!2276 = !DILocation(line: 213, column: 33, scope: !2094)
!2277 = !DILocation(line: 219, column: 16, scope: !2094)
!2278 = !DILocation(line: 219, column: 14, scope: !2094)
!2279 = !DILocation(line: 288, column: 9, scope: !2094)
!2280 = !DILocation(line: 289, column: 11, scope: !2094)
!2281 = !DILocation(line: 302, column: 19, scope: !2094)
!2282 = !DILocation(line: 302, column: 25, scope: !2094)
!2283 = !DILocation(line: 302, column: 15, scope: !2094)
!2284 = !DILocation(line: 217, column: 16, scope: !2094)
!2285 = !DILocation(line: 217, column: 14, scope: !2094)
!2286 = !DILocation(line: 294, column: 9, scope: !2094)
!2287 = !DILocation(line: 295, column: 11, scope: !2094)
!2288 = !DILocation(line: 301, column: 19, scope: !2094)
!2289 = !DILocation(line: 301, column: 25, scope: !2094)
!2290 = !DILocation(line: 301, column: 15, scope: !2094)
!2291 = !DILocation(line: 221, column: 16, scope: !2094)
!2292 = !DILocation(line: 221, column: 14, scope: !2094)
!2293 = !DILocation(line: 292, column: 9, scope: !2094)
!2294 = !DILocation(line: 293, column: 11, scope: !2094)
!2295 = !DILocation(line: 300, column: 19, scope: !2094)
!2296 = !DILocation(line: 300, column: 25, scope: !2094)
!2297 = !DILocation(line: 300, column: 15, scope: !2094)
!2298 = !DILocation(line: 299, column: 19, scope: !2094)
!2299 = !DILocation(line: 299, column: 25, scope: !2094)
!2300 = !DILocation(line: 299, column: 15, scope: !2094)
!2301 = !DILocation(line: 298, column: 19, scope: !2094)
!2302 = !DILocation(line: 298, column: 25, scope: !2094)
!2303 = !DILocation(line: 298, column: 15, scope: !2094)
!2304 = !DILocation(line: 280, column: 9, scope: !2094)
!2305 = !DILocation(line: 281, column: 11, scope: !2094)
!2306 = !DILocation(line: 274, column: 9, scope: !2094)
!2307 = !DILocation(line: 275, column: 11, scope: !2094)
!2308 = !DILocation(line: 272, column: 9, scope: !2094)
!2309 = !DILocation(line: 273, column: 11, scope: !2094)
!2310 = !DILocation(line: 286, column: 19, scope: !2094)
!2311 = !DILocation(line: 286, column: 25, scope: !2094)
!2312 = !DILocation(line: 286, column: 15, scope: !2094)
!2313 = !DILocation(line: 278, column: 9, scope: !2094)
!2314 = !DILocation(line: 279, column: 11, scope: !2094)
!2315 = !DILocation(line: 285, column: 19, scope: !2094)
!2316 = !DILocation(line: 285, column: 25, scope: !2094)
!2317 = !DILocation(line: 285, column: 15, scope: !2094)
!2318 = !DILocation(line: 276, column: 9, scope: !2094)
!2319 = !DILocation(line: 277, column: 11, scope: !2094)
!2320 = !DILocation(line: 284, column: 19, scope: !2094)
!2321 = !DILocation(line: 284, column: 25, scope: !2094)
!2322 = !DILocation(line: 284, column: 15, scope: !2094)
!2323 = !DILocation(line: 283, column: 19, scope: !2094)
!2324 = !DILocation(line: 283, column: 25, scope: !2094)
!2325 = !DILocation(line: 283, column: 15, scope: !2094)
!2326 = !DILocation(line: 282, column: 19, scope: !2094)
!2327 = !DILocation(line: 282, column: 25, scope: !2094)
!2328 = !DILocation(line: 282, column: 15, scope: !2094)
!2329 = !DILocation(line: 264, column: 9, scope: !2094)
!2330 = !DILocation(line: 265, column: 11, scope: !2094)
!2331 = !DILocation(line: 258, column: 9, scope: !2094)
!2332 = !DILocation(line: 259, column: 11, scope: !2094)
!2333 = !DILocation(line: 256, column: 9, scope: !2094)
!2334 = !DILocation(line: 257, column: 11, scope: !2094)
!2335 = !DILocation(line: 270, column: 19, scope: !2094)
!2336 = !DILocation(line: 270, column: 25, scope: !2094)
!2337 = !DILocation(line: 270, column: 15, scope: !2094)
!2338 = !DILocation(line: 262, column: 9, scope: !2094)
!2339 = !DILocation(line: 263, column: 11, scope: !2094)
!2340 = !DILocation(line: 269, column: 19, scope: !2094)
!2341 = !DILocation(line: 269, column: 25, scope: !2094)
!2342 = !DILocation(line: 269, column: 15, scope: !2094)
!2343 = !DILocation(line: 260, column: 9, scope: !2094)
!2344 = !DILocation(line: 261, column: 11, scope: !2094)
!2345 = !DILocation(line: 268, column: 19, scope: !2094)
!2346 = !DILocation(line: 268, column: 25, scope: !2094)
!2347 = !DILocation(line: 268, column: 15, scope: !2094)
!2348 = !DILocation(line: 267, column: 19, scope: !2094)
!2349 = !DILocation(line: 267, column: 25, scope: !2094)
!2350 = !DILocation(line: 267, column: 15, scope: !2094)
!2351 = !DILocation(line: 266, column: 19, scope: !2094)
!2352 = !DILocation(line: 266, column: 25, scope: !2094)
!2353 = !DILocation(line: 266, column: 15, scope: !2094)
!2354 = !DILocation(line: 248, column: 9, scope: !2094)
!2355 = !DILocation(line: 249, column: 11, scope: !2094)
!2356 = !DILocation(line: 242, column: 9, scope: !2094)
!2357 = !DILocation(line: 243, column: 11, scope: !2094)
!2358 = !DILocation(line: 240, column: 9, scope: !2094)
!2359 = !DILocation(line: 241, column: 11, scope: !2094)
!2360 = !DILocation(line: 254, column: 19, scope: !2094)
!2361 = !DILocation(line: 254, column: 25, scope: !2094)
!2362 = !DILocation(line: 254, column: 15, scope: !2094)
!2363 = !DILocation(line: 246, column: 9, scope: !2094)
!2364 = !DILocation(line: 247, column: 11, scope: !2094)
!2365 = !DILocation(line: 253, column: 19, scope: !2094)
!2366 = !DILocation(line: 253, column: 25, scope: !2094)
!2367 = !DILocation(line: 253, column: 15, scope: !2094)
!2368 = !DILocation(line: 244, column: 9, scope: !2094)
!2369 = !DILocation(line: 245, column: 11, scope: !2094)
!2370 = !DILocation(line: 252, column: 19, scope: !2094)
!2371 = !DILocation(line: 252, column: 25, scope: !2094)
!2372 = !DILocation(line: 252, column: 15, scope: !2094)
!2373 = !DILocation(line: 251, column: 19, scope: !2094)
!2374 = !DILocation(line: 251, column: 25, scope: !2094)
!2375 = !DILocation(line: 251, column: 15, scope: !2094)
!2376 = !DILocation(line: 250, column: 19, scope: !2094)
!2377 = !DILocation(line: 250, column: 25, scope: !2094)
!2378 = !DILocation(line: 250, column: 15, scope: !2094)
!2379 = !DILocation(line: 231, column: 9, scope: !2094)
!2380 = !DILocation(line: 232, column: 11, scope: !2094)
!2381 = !DILocation(line: 225, column: 9, scope: !2094)
!2382 = !DILocation(line: 226, column: 11, scope: !2094)
!2383 = !DILocation(line: 223, column: 9, scope: !2094)
!2384 = !DILocation(line: 238, column: 19, scope: !2094)
!2385 = !DILocation(line: 238, column: 25, scope: !2094)
!2386 = !DILocation(line: 238, column: 15, scope: !2094)
!2387 = !DILocation(line: 229, column: 9, scope: !2094)
!2388 = !DILocation(line: 230, column: 11, scope: !2094)
!2389 = !DILocation(line: 237, column: 19, scope: !2094)
!2390 = !DILocation(line: 237, column: 25, scope: !2094)
!2391 = !DILocation(line: 237, column: 15, scope: !2094)
!2392 = !DILocation(line: 227, column: 9, scope: !2094)
!2393 = !DILocation(line: 228, column: 11, scope: !2094)
!2394 = !DILocation(line: 236, column: 19, scope: !2094)
!2395 = !DILocation(line: 236, column: 25, scope: !2094)
!2396 = !DILocation(line: 236, column: 15, scope: !2094)
!2397 = !DILocation(line: 235, column: 19, scope: !2094)
!2398 = !DILocation(line: 235, column: 25, scope: !2094)
!2399 = !DILocation(line: 235, column: 15, scope: !2094)
!2400 = !DILocation(line: 234, column: 51, scope: !2094)
!2401 = !DILocation(line: 234, column: 22, scope: !2094)
!2402 = !DILocation(line: 233, column: 19, scope: !2094)
!2403 = !DILocation(line: 233, column: 25, scope: !2094)
!2404 = !DILocation(line: 234, column: 9, scope: !2094)
!2405 = !DILocation(line: 113, column: 42, scope: !2056)
!2406 = !DILocation(line: 113, column: 3, scope: !2056)
!2407 = distinct !{!2407, !2057, !2408, !130}
!2408 = !DILocation(line: 303, column: 3, scope: !2053)
!2409 = !DILocation(line: 306, column: 12, scope: !1998)
!2410 = !DILocation(line: 307, column: 3, scope: !1998)
!2411 = !DILocation(line: 307, column: 12, scope: !1998)
!2412 = !DILocation(line: 308, column: 3, scope: !1998)
!2413 = !DILocation(line: 308, column: 12, scope: !1998)
!2414 = !DILocation(line: 309, column: 3, scope: !1998)
!2415 = !DILocation(line: 309, column: 12, scope: !1998)
!2416 = !DILocation(line: 310, column: 3, scope: !1998)
!2417 = !DILocation(line: 310, column: 12, scope: !1998)
!2418 = !DILocation(line: 311, column: 3, scope: !1998)
!2419 = !DILocation(line: 311, column: 12, scope: !1998)
!2420 = !DILocation(line: 312, column: 3, scope: !1998)
!2421 = !DILocation(line: 312, column: 12, scope: !1998)
!2422 = !DILocation(line: 313, column: 3, scope: !1998)
!2423 = !DILocation(line: 313, column: 12, scope: !1998)
!2424 = !DILocation(line: 314, column: 3, scope: !1998)
!2425 = !DILocation(line: 314, column: 12, scope: !1998)
!2426 = !DILocation(line: 315, column: 3, scope: !1998)
!2427 = !DILocation(line: 315, column: 12, scope: !1998)
!2428 = !DILocation(line: 316, column: 3, scope: !1998)
!2429 = !DILocation(line: 316, column: 13, scope: !1998)
!2430 = !DILocation(line: 317, column: 3, scope: !1998)
!2431 = !DILocation(line: 317, column: 13, scope: !1998)
!2432 = !DILocation(line: 318, column: 3, scope: !1998)
!2433 = !DILocation(line: 318, column: 13, scope: !1998)
!2434 = !DILocation(line: 319, column: 3, scope: !1998)
!2435 = !DILocation(line: 319, column: 13, scope: !1998)
!2436 = !DILocation(line: 320, column: 3, scope: !1998)
!2437 = !DILocation(line: 320, column: 13, scope: !1998)
!2438 = !DILocation(line: 321, column: 3, scope: !1998)
!2439 = !DILocation(line: 321, column: 13, scope: !1998)
!2440 = !DILocation(line: 322, column: 3, scope: !1998)
!2441 = !DILocation(line: 322, column: 13, scope: !1998)
!2442 = !DILocation(line: 323, column: 3, scope: !1998)
!2443 = !DILocation(line: 323, column: 13, scope: !1998)
!2444 = !DILocation(line: 324, column: 3, scope: !1998)
!2445 = !DILocation(line: 324, column: 13, scope: !1998)
!2446 = !DILocation(line: 325, column: 3, scope: !1998)
!2447 = !DILocation(line: 325, column: 13, scope: !1998)
!2448 = !DILocation(line: 326, column: 3, scope: !1998)
!2449 = !DILocation(line: 326, column: 13, scope: !1998)
!2450 = !DILocation(line: 327, column: 3, scope: !1998)
!2451 = !DILocation(line: 327, column: 13, scope: !1998)
!2452 = !DILocation(line: 328, column: 3, scope: !1998)
!2453 = !DILocation(line: 328, column: 13, scope: !1998)
!2454 = !DILocation(line: 329, column: 3, scope: !1998)
!2455 = !DILocation(line: 329, column: 13, scope: !1998)
!2456 = !DILocation(line: 330, column: 3, scope: !1998)
!2457 = !DILocation(line: 330, column: 13, scope: !1998)
!2458 = !DILocation(line: 331, column: 1, scope: !1998)
!2459 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 524, type: !1902, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2460 = !DILocalVariable(name: "state", arg: 1, scope: !2459, file: !74, line: 524, type: !1904)
!2461 = !DILocation(line: 0, scope: !2459)
!2462 = !DILocation(line: 525, column: 27, scope: !2459)
!2463 = !DILocation(line: 525, column: 3, scope: !2459)
!2464 = !DILocation(line: 526, column: 3, scope: !2459)
!2465 = !DILocation(line: 526, column: 29, scope: !2459)
!2466 = !DILocation(line: 527, column: 1, scope: !2459)
!2467 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 388, type: !2468, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2468 = !DISubroutineType(types: !2469)
!2469 = !{null, !1914, !40, !40, !33}
!2470 = !DILocalVariable(name: "s", arg: 1, scope: !2467, file: !74, line: 388, type: !1914)
!2471 = !DILocation(line: 0, scope: !2467)
!2472 = !DILocalVariable(name: "pos", arg: 2, scope: !2467, file: !74, line: 388, type: !40)
!2473 = !DILocalVariable(name: "r", arg: 3, scope: !2467, file: !74, line: 388, type: !40)
!2474 = !DILocalVariable(name: "p", arg: 4, scope: !2467, file: !74, line: 389, type: !33)
!2475 = !DILocation(line: 390, column: 34, scope: !2467)
!2476 = !DILocation(line: 390, column: 29, scope: !2467)
!2477 = !DILocation(line: 390, column: 9, scope: !2467)
!2478 = !DILocation(line: 390, column: 3, scope: !2467)
!2479 = !DILocation(line: 390, column: 14, scope: !2467)
!2480 = !DILocation(line: 391, column: 7, scope: !2467)
!2481 = !DILocation(line: 391, column: 3, scope: !2467)
!2482 = !DILocation(line: 391, column: 16, scope: !2467)
!2483 = !DILocation(line: 392, column: 1, scope: !2467)
!2484 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 540, type: !2485, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2485 = !DISubroutineType(types: !2486)
!2486 = !{null, !32, !38, !1904}
!2487 = !DILocalVariable(name: "out", arg: 1, scope: !2484, file: !74, line: 540, type: !32)
!2488 = !DILocation(line: 0, scope: !2484)
!2489 = !DILocalVariable(name: "outlen", arg: 2, scope: !2484, file: !74, line: 540, type: !38)
!2490 = !DILocalVariable(name: "state", arg: 3, scope: !2484, file: !74, line: 540, type: !1904)
!2491 = !DILocation(line: 542, column: 28, scope: !2484)
!2492 = !DILocation(line: 541, column: 31, scope: !2484)
!2493 = !DILocation(line: 541, column: 3, scope: !2484)
!2494 = !DILocation(line: 541, column: 29, scope: !2484)
!2495 = !DILocation(line: 543, column: 1, scope: !2484)
!2496 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 410, type: !2497, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2497 = !DISubroutineType(types: !2498)
!2498 = !{!40, !32, !38, !1914, !40, !40}
!2499 = !DILocalVariable(name: "out", arg: 1, scope: !2496, file: !74, line: 410, type: !32)
!2500 = !DILocation(line: 0, scope: !2496)
!2501 = !DILocalVariable(name: "outlen", arg: 2, scope: !2496, file: !74, line: 410, type: !38)
!2502 = !DILocalVariable(name: "s", arg: 3, scope: !2496, file: !74, line: 410, type: !1914)
!2503 = !DILocalVariable(name: "pos", arg: 4, scope: !2496, file: !74, line: 411, type: !40)
!2504 = !DILocalVariable(name: "r", arg: 5, scope: !2496, file: !74, line: 411, type: !40)
!2505 = !DILocation(line: 414, column: 3, scope: !2496)
!2506 = !DILocation(line: 415, column: 13, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2508, file: !74, line: 415, column: 9)
!2508 = distinct !DILexicalBlock(scope: !2496, file: !74, line: 414, column: 18)
!2509 = !DILocation(line: 416, column: 7, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2507, file: !74, line: 415, column: 19)
!2511 = !DILocation(line: 418, column: 5, scope: !2510)
!2512 = !DILocalVariable(name: "i", scope: !2496, file: !74, line: 412, type: !40)
!2513 = !DILocation(line: 419, column: 10, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2508, file: !74, line: 419, column: 5)
!2515 = !DILocation(line: 419, scope: !2514)
!2516 = !DILocation(line: 419, column: 21, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2514, file: !74, line: 419, column: 5)
!2518 = !DILocation(line: 419, column: 25, scope: !2517)
!2519 = !DILocation(line: 419, column: 5, scope: !2514)
!2520 = !DILocation(line: 420, column: 20, scope: !2517)
!2521 = !DILocation(line: 420, column: 16, scope: !2517)
!2522 = !DILocation(line: 420, column: 30, scope: !2517)
!2523 = !DILocation(line: 420, column: 25, scope: !2517)
!2524 = !DILocation(line: 420, column: 14, scope: !2517)
!2525 = !DILocation(line: 420, column: 11, scope: !2517)
!2526 = !DILocation(line: 419, column: 47, scope: !2517)
!2527 = !DILocation(line: 419, column: 5, scope: !2517)
!2528 = distinct !{!2528, !2519, !2529, !130}
!2529 = !DILocation(line: 420, column: 38, scope: !2514)
!2530 = !DILocation(line: 421, column: 17, scope: !2508)
!2531 = !DILocation(line: 421, column: 12, scope: !2508)
!2532 = distinct !{!2532, !2505, !2533, !130}
!2533 = !DILocation(line: 423, column: 3, scope: !2496)
!2534 = !DILocation(line: 425, column: 3, scope: !2496)
!2535 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 556, type: !1932, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2536 = !DILocalVariable(name: "state", arg: 1, scope: !2535, file: !74, line: 556, type: !1904)
!2537 = !DILocation(line: 0, scope: !2535)
!2538 = !DILocalVariable(name: "in", arg: 2, scope: !2535, file: !74, line: 556, type: !275)
!2539 = !DILocalVariable(name: "inlen", arg: 3, scope: !2535, file: !74, line: 557, type: !38)
!2540 = !DILocation(line: 558, column: 3, scope: !2535)
!2541 = !DILocation(line: 559, column: 3, scope: !2535)
!2542 = !DILocation(line: 559, column: 29, scope: !2535)
!2543 = !DILocation(line: 560, column: 1, scope: !2535)
!2544 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 441, type: !2545, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2545 = !DISubroutineType(types: !2546)
!2546 = !{null, !1914, !40, !275, !38, !33}
!2547 = !DILocalVariable(name: "s", arg: 1, scope: !2544, file: !74, line: 441, type: !1914)
!2548 = !DILocation(line: 0, scope: !2544)
!2549 = !DILocalVariable(name: "r", arg: 2, scope: !2544, file: !74, line: 441, type: !40)
!2550 = !DILocalVariable(name: "in", arg: 3, scope: !2544, file: !74, line: 442, type: !275)
!2551 = !DILocalVariable(name: "inlen", arg: 4, scope: !2544, file: !74, line: 442, type: !38)
!2552 = !DILocalVariable(name: "p", arg: 5, scope: !2544, file: !74, line: 442, type: !33)
!2553 = !DILocalVariable(name: "i", scope: !2544, file: !74, line: 443, type: !40)
!2554 = !DILocation(line: 445, column: 8, scope: !2555)
!2555 = distinct !DILexicalBlock(scope: !2544, file: !74, line: 445, column: 3)
!2556 = !DILocation(line: 445, scope: !2555)
!2557 = !DILocation(line: 445, column: 17, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2555, file: !74, line: 445, column: 3)
!2559 = !DILocation(line: 445, column: 3, scope: !2555)
!2560 = !DILocation(line: 448, column: 3, scope: !2544)
!2561 = !DILocation(line: 446, column: 5, scope: !2558)
!2562 = !DILocation(line: 446, column: 10, scope: !2558)
!2563 = !DILocation(line: 445, column: 24, scope: !2558)
!2564 = !DILocation(line: 445, column: 3, scope: !2558)
!2565 = distinct !{!2565, !2559, !2566, !130}
!2566 = !DILocation(line: 446, column: 12, scope: !2555)
!2567 = !DILocation(line: 448, column: 16, scope: !2544)
!2568 = !DILocation(line: 449, column: 5, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2570, file: !74, line: 449, column: 5)
!2570 = distinct !DILexicalBlock(scope: !2544, file: !74, line: 448, column: 22)
!2571 = !DILocation(line: 456, column: 3, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2544, file: !74, line: 456, column: 3)
!2573 = !DILocation(line: 449, scope: !2569)
!2574 = !DILocation(line: 449, column: 19, scope: !2575)
!2575 = distinct !DILexicalBlock(scope: !2569, file: !74, line: 449, column: 5)
!2576 = !DILocation(line: 450, column: 29, scope: !2575)
!2577 = !DILocation(line: 450, column: 25, scope: !2575)
!2578 = !DILocation(line: 450, column: 15, scope: !2575)
!2579 = !DILocation(line: 450, column: 7, scope: !2575)
!2580 = !DILocation(line: 450, column: 12, scope: !2575)
!2581 = !DILocation(line: 449, column: 29, scope: !2575)
!2582 = !DILocation(line: 449, column: 5, scope: !2575)
!2583 = distinct !{!2583, !2568, !2584, !130}
!2584 = !DILocation(line: 450, column: 32, scope: !2569)
!2585 = !DILocation(line: 451, column: 8, scope: !2570)
!2586 = !DILocation(line: 452, column: 11, scope: !2570)
!2587 = !DILocation(line: 453, column: 5, scope: !2570)
!2588 = distinct !{!2588, !2560, !2589, !130}
!2589 = !DILocation(line: 454, column: 3, scope: !2544)
!2590 = !DILocation(line: 456, scope: !2572)
!2591 = !DILocation(line: 456, column: 17, scope: !2592)
!2592 = distinct !DILexicalBlock(scope: !2572, file: !74, line: 456, column: 3)
!2593 = !DILocation(line: 457, column: 27, scope: !2592)
!2594 = !DILocation(line: 457, column: 17, scope: !2592)
!2595 = !DILocation(line: 457, column: 38, scope: !2592)
!2596 = !DILocation(line: 457, column: 33, scope: !2592)
!2597 = !DILocation(line: 457, column: 9, scope: !2592)
!2598 = !DILocation(line: 457, column: 5, scope: !2592)
!2599 = !DILocation(line: 457, column: 14, scope: !2592)
!2600 = !DILocation(line: 456, column: 27, scope: !2592)
!2601 = !DILocation(line: 456, column: 3, scope: !2592)
!2602 = distinct !{!2602, !2571, !2603, !130}
!2603 = !DILocation(line: 457, column: 46, scope: !2572)
!2604 = !DILocation(line: 459, column: 15, scope: !2544)
!2605 = !DILocation(line: 459, column: 32, scope: !2544)
!2606 = !DILocation(line: 459, column: 27, scope: !2544)
!2607 = !DILocation(line: 459, column: 7, scope: !2544)
!2608 = !DILocation(line: 459, column: 3, scope: !2544)
!2609 = !DILocation(line: 459, column: 12, scope: !2544)
!2610 = !DILocation(line: 460, column: 8, scope: !2544)
!2611 = !DILocation(line: 460, column: 13, scope: !2544)
!2612 = !DILocation(line: 460, column: 3, scope: !2544)
!2613 = !DILocation(line: 460, column: 18, scope: !2544)
!2614 = !DILocation(line: 461, column: 1, scope: !2544)
!2615 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2616, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2616 = !DISubroutineType(types: !2617)
!2617 = !{!70, !275}
!2618 = !DILocalVariable(name: "x", arg: 1, scope: !2615, file: !74, line: 22, type: !275)
!2619 = !DILocation(line: 0, scope: !2615)
!2620 = !DILocalVariable(name: "r", scope: !2615, file: !74, line: 24, type: !70)
!2621 = !DILocalVariable(name: "i", scope: !2615, file: !74, line: 23, type: !40)
!2622 = !DILocation(line: 26, column: 8, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2615, file: !74, line: 26, column: 3)
!2624 = !DILocation(line: 26, scope: !2623)
!2625 = !DILocation(line: 26, column: 17, scope: !2626)
!2626 = distinct !DILexicalBlock(scope: !2623, file: !74, line: 26, column: 3)
!2627 = !DILocation(line: 26, column: 3, scope: !2623)
!2628 = !DILocation(line: 27, column: 20, scope: !2626)
!2629 = !DILocation(line: 27, column: 10, scope: !2626)
!2630 = !DILocation(line: 27, column: 30, scope: !2626)
!2631 = !DILocation(line: 27, column: 25, scope: !2626)
!2632 = !DILocation(line: 27, column: 7, scope: !2626)
!2633 = !DILocation(line: 26, column: 23, scope: !2626)
!2634 = !DILocation(line: 26, column: 3, scope: !2626)
!2635 = distinct !{!2635, !2627, !2636, !130}
!2636 = !DILocation(line: 27, column: 32, scope: !2623)
!2637 = !DILocation(line: 29, column: 3, scope: !2615)
!2638 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 575, type: !2485, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2639 = !DILocalVariable(name: "out", arg: 1, scope: !2638, file: !74, line: 575, type: !32)
!2640 = !DILocation(line: 0, scope: !2638)
!2641 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2638, file: !74, line: 575, type: !38)
!2642 = !DILocalVariable(name: "state", arg: 3, scope: !2638, file: !74, line: 575, type: !1904)
!2643 = !DILocation(line: 576, column: 3, scope: !2638)
!2644 = !DILocation(line: 577, column: 1, scope: !2638)
!2645 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 477, type: !2646, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2646 = !DISubroutineType(types: !2647)
!2647 = !{null, !32, !38, !1914, !40}
!2648 = !DILocalVariable(name: "out", arg: 1, scope: !2645, file: !74, line: 477, type: !32)
!2649 = !DILocation(line: 0, scope: !2645)
!2650 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2645, file: !74, line: 477, type: !38)
!2651 = !DILocalVariable(name: "s", arg: 3, scope: !2645, file: !74, line: 477, type: !1914)
!2652 = !DILocalVariable(name: "r", arg: 4, scope: !2645, file: !74, line: 478, type: !40)
!2653 = !DILocation(line: 481, column: 3, scope: !2645)
!2654 = !DILocation(line: 482, column: 5, scope: !2655)
!2655 = distinct !DILexicalBlock(scope: !2645, file: !74, line: 481, column: 19)
!2656 = !DILocalVariable(name: "i", scope: !2645, file: !74, line: 479, type: !40)
!2657 = !DILocation(line: 483, column: 10, scope: !2658)
!2658 = distinct !DILexicalBlock(scope: !2655, file: !74, line: 483, column: 5)
!2659 = !DILocation(line: 483, scope: !2658)
!2660 = !DILocation(line: 483, column: 19, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2658, file: !74, line: 483, column: 5)
!2662 = !DILocation(line: 483, column: 5, scope: !2658)
!2663 = !DILocation(line: 484, column: 23, scope: !2661)
!2664 = !DILocation(line: 484, column: 19, scope: !2661)
!2665 = !DILocation(line: 484, column: 28, scope: !2661)
!2666 = !DILocation(line: 484, column: 7, scope: !2661)
!2667 = !DILocation(line: 483, column: 29, scope: !2661)
!2668 = !DILocation(line: 483, column: 5, scope: !2661)
!2669 = distinct !{!2669, !2662, !2670, !130}
!2670 = !DILocation(line: 484, column: 32, scope: !2658)
!2671 = !DILocation(line: 485, column: 9, scope: !2655)
!2672 = !DILocation(line: 486, column: 13, scope: !2655)
!2673 = distinct !{!2673, !2653, !2674, !130}
!2674 = !DILocation(line: 487, column: 3, scope: !2645)
!2675 = !DILocation(line: 488, column: 1, scope: !2645)
!2676 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 41, type: !2677, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2677 = !DISubroutineType(types: !2678)
!2678 = !{null, !32, !70}
!2679 = !DILocalVariable(name: "x", arg: 1, scope: !2676, file: !74, line: 41, type: !32)
!2680 = !DILocation(line: 0, scope: !2676)
!2681 = !DILocalVariable(name: "u", arg: 2, scope: !2676, file: !74, line: 41, type: !70)
!2682 = !DILocalVariable(name: "i", scope: !2676, file: !74, line: 42, type: !40)
!2683 = !DILocation(line: 44, column: 8, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2676, file: !74, line: 44, column: 3)
!2685 = !DILocation(line: 44, scope: !2684)
!2686 = !DILocation(line: 44, column: 17, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2684, file: !74, line: 44, column: 3)
!2688 = !DILocation(line: 44, column: 3, scope: !2684)
!2689 = !DILocation(line: 45, column: 19, scope: !2687)
!2690 = !DILocation(line: 45, column: 14, scope: !2687)
!2691 = !DILocation(line: 45, column: 12, scope: !2687)
!2692 = !DILocation(line: 45, column: 5, scope: !2687)
!2693 = !DILocation(line: 45, column: 10, scope: !2687)
!2694 = !DILocation(line: 44, column: 23, scope: !2687)
!2695 = !DILocation(line: 44, column: 3, scope: !2687)
!2696 = distinct !{!2696, !2688, !2697, !130}
!2697 = !DILocation(line: 45, column: 21, scope: !2684)
!2698 = !DILocation(line: 46, column: 1, scope: !2676)
!2699 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 586, type: !1902, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2700 = !DILocalVariable(name: "state", arg: 1, scope: !2699, file: !74, line: 586, type: !1904)
!2701 = !DILocation(line: 0, scope: !2699)
!2702 = !DILocation(line: 587, column: 3, scope: !2699)
!2703 = !DILocation(line: 588, column: 3, scope: !2699)
!2704 = !DILocation(line: 588, column: 29, scope: !2699)
!2705 = !DILocation(line: 589, column: 1, scope: !2699)
!2706 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 601, type: !1932, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2707 = !DILocalVariable(name: "state", arg: 1, scope: !2706, file: !74, line: 601, type: !1904)
!2708 = !DILocation(line: 0, scope: !2706)
!2709 = !DILocalVariable(name: "in", arg: 2, scope: !2706, file: !74, line: 601, type: !275)
!2710 = !DILocalVariable(name: "inlen", arg: 3, scope: !2706, file: !74, line: 601, type: !38)
!2711 = !DILocation(line: 602, column: 53, scope: !2706)
!2712 = !DILocation(line: 602, column: 31, scope: !2706)
!2713 = !DILocation(line: 602, column: 3, scope: !2706)
!2714 = !DILocation(line: 602, column: 29, scope: !2706)
!2715 = !DILocation(line: 604, column: 1, scope: !2706)
!2716 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 613, type: !1902, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2717 = !DILocalVariable(name: "state", arg: 1, scope: !2716, file: !74, line: 613, type: !1904)
!2718 = !DILocation(line: 0, scope: !2716)
!2719 = !DILocation(line: 614, column: 27, scope: !2716)
!2720 = !DILocation(line: 614, column: 3, scope: !2716)
!2721 = !DILocation(line: 615, column: 3, scope: !2716)
!2722 = !DILocation(line: 615, column: 29, scope: !2716)
!2723 = !DILocation(line: 616, column: 1, scope: !2716)
!2724 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 629, type: !2485, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2725 = !DILocalVariable(name: "out", arg: 1, scope: !2724, file: !74, line: 629, type: !32)
!2726 = !DILocation(line: 0, scope: !2724)
!2727 = !DILocalVariable(name: "outlen", arg: 2, scope: !2724, file: !74, line: 629, type: !38)
!2728 = !DILocalVariable(name: "state", arg: 3, scope: !2724, file: !74, line: 629, type: !1904)
!2729 = !DILocation(line: 631, column: 28, scope: !2724)
!2730 = !DILocation(line: 630, column: 31, scope: !2724)
!2731 = !DILocation(line: 630, column: 3, scope: !2724)
!2732 = !DILocation(line: 630, column: 29, scope: !2724)
!2733 = !DILocation(line: 632, column: 1, scope: !2724)
!2734 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 645, type: !1932, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2735 = !DILocalVariable(name: "state", arg: 1, scope: !2734, file: !74, line: 645, type: !1904)
!2736 = !DILocation(line: 0, scope: !2734)
!2737 = !DILocalVariable(name: "in", arg: 2, scope: !2734, file: !74, line: 645, type: !275)
!2738 = !DILocalVariable(name: "inlen", arg: 3, scope: !2734, file: !74, line: 646, type: !38)
!2739 = !DILocation(line: 647, column: 3, scope: !2734)
!2740 = !DILocation(line: 648, column: 3, scope: !2734)
!2741 = !DILocation(line: 648, column: 29, scope: !2734)
!2742 = !DILocation(line: 649, column: 1, scope: !2734)
!2743 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 664, type: !2485, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2744 = !DILocalVariable(name: "out", arg: 1, scope: !2743, file: !74, line: 664, type: !32)
!2745 = !DILocation(line: 0, scope: !2743)
!2746 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2743, file: !74, line: 664, type: !38)
!2747 = !DILocalVariable(name: "state", arg: 3, scope: !2743, file: !74, line: 664, type: !1904)
!2748 = !DILocation(line: 665, column: 3, scope: !2743)
!2749 = !DILocation(line: 666, column: 1, scope: !2743)
!2750 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 678, type: !2751, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2751 = !DISubroutineType(types: !2752)
!2752 = !{null, !32, !38, !275, !38}
!2753 = !DILocalVariable(name: "out", arg: 1, scope: !2750, file: !74, line: 678, type: !32)
!2754 = !DILocation(line: 0, scope: !2750)
!2755 = !DILocalVariable(name: "outlen", arg: 2, scope: !2750, file: !74, line: 678, type: !38)
!2756 = !DILocalVariable(name: "in", arg: 3, scope: !2750, file: !74, line: 678, type: !275)
!2757 = !DILocalVariable(name: "inlen", arg: 4, scope: !2750, file: !74, line: 678, type: !38)
!2758 = !DILocalVariable(name: "state", scope: !2750, file: !74, line: 680, type: !387)
!2759 = !DILocation(line: 680, column: 16, scope: !2750)
!2760 = !DILocation(line: 682, column: 3, scope: !2750)
!2761 = !DILocation(line: 683, column: 20, scope: !2750)
!2762 = !DILocalVariable(name: "nblocks", scope: !2750, file: !74, line: 679, type: !38)
!2763 = !DILocation(line: 684, column: 3, scope: !2750)
!2764 = !DILocation(line: 685, column: 21, scope: !2750)
!2765 = !DILocation(line: 685, column: 10, scope: !2750)
!2766 = !DILocation(line: 686, column: 18, scope: !2750)
!2767 = !DILocation(line: 686, column: 7, scope: !2750)
!2768 = !DILocation(line: 687, column: 3, scope: !2750)
!2769 = !DILocation(line: 688, column: 1, scope: !2750)
!2770 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 700, type: !2751, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2771 = !DILocalVariable(name: "out", arg: 1, scope: !2770, file: !74, line: 700, type: !32)
!2772 = !DILocation(line: 0, scope: !2770)
!2773 = !DILocalVariable(name: "outlen", arg: 2, scope: !2770, file: !74, line: 700, type: !38)
!2774 = !DILocalVariable(name: "in", arg: 3, scope: !2770, file: !74, line: 700, type: !275)
!2775 = !DILocalVariable(name: "inlen", arg: 4, scope: !2770, file: !74, line: 700, type: !38)
!2776 = !DILocalVariable(name: "state", scope: !2770, file: !74, line: 702, type: !387)
!2777 = !DILocation(line: 702, column: 16, scope: !2770)
!2778 = !DILocation(line: 704, column: 3, scope: !2770)
!2779 = !DILocation(line: 705, column: 20, scope: !2770)
!2780 = !DILocalVariable(name: "nblocks", scope: !2770, file: !74, line: 701, type: !38)
!2781 = !DILocation(line: 706, column: 3, scope: !2770)
!2782 = !DILocation(line: 707, column: 21, scope: !2770)
!2783 = !DILocation(line: 707, column: 10, scope: !2770)
!2784 = !DILocation(line: 708, column: 18, scope: !2770)
!2785 = !DILocation(line: 708, column: 7, scope: !2770)
!2786 = !DILocation(line: 709, column: 3, scope: !2770)
!2787 = !DILocation(line: 710, column: 1, scope: !2770)
!2788 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 721, type: !2789, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2789 = !DISubroutineType(types: !2790)
!2790 = !{null, !32, !275, !38}
!2791 = !DILocalVariable(name: "h", arg: 1, scope: !2788, file: !74, line: 721, type: !32)
!2792 = !DILocation(line: 0, scope: !2788)
!2793 = !DILocalVariable(name: "in", arg: 2, scope: !2788, file: !74, line: 721, type: !275)
!2794 = !DILocalVariable(name: "inlen", arg: 3, scope: !2788, file: !74, line: 721, type: !38)
!2795 = !DILocalVariable(name: "s", scope: !2788, file: !74, line: 723, type: !2796)
!2796 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !2797)
!2797 = !{!2798}
!2798 = !DISubrange(count: 25)
!2799 = !DILocation(line: 723, column: 12, scope: !2788)
!2800 = !DILocation(line: 725, column: 3, scope: !2788)
!2801 = !DILocation(line: 726, column: 3, scope: !2788)
!2802 = !DILocalVariable(name: "i", scope: !2788, file: !74, line: 722, type: !40)
!2803 = !DILocation(line: 727, column: 8, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2788, file: !74, line: 727, column: 3)
!2805 = !DILocation(line: 727, scope: !2804)
!2806 = !DILocation(line: 727, column: 17, scope: !2807)
!2807 = distinct !DILexicalBlock(scope: !2804, file: !74, line: 727, column: 3)
!2808 = !DILocation(line: 727, column: 3, scope: !2804)
!2809 = !DILocation(line: 728, column: 19, scope: !2807)
!2810 = !DILocation(line: 728, column: 15, scope: !2807)
!2811 = !DILocation(line: 728, column: 24, scope: !2807)
!2812 = !DILocation(line: 728, column: 5, scope: !2807)
!2813 = !DILocation(line: 727, column: 23, scope: !2807)
!2814 = !DILocation(line: 727, column: 3, scope: !2807)
!2815 = distinct !{!2815, !2808, !2816, !130}
!2816 = !DILocation(line: 728, column: 28, scope: !2804)
!2817 = !DILocation(line: 729, column: 1, scope: !2788)
!2818 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 740, type: !2789, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2819 = !DILocalVariable(name: "h", arg: 1, scope: !2818, file: !74, line: 740, type: !32)
!2820 = !DILocation(line: 0, scope: !2818)
!2821 = !DILocalVariable(name: "in", arg: 2, scope: !2818, file: !74, line: 740, type: !275)
!2822 = !DILocalVariable(name: "inlen", arg: 3, scope: !2818, file: !74, line: 740, type: !38)
!2823 = !DILocalVariable(name: "s", scope: !2818, file: !74, line: 742, type: !2796)
!2824 = !DILocation(line: 742, column: 12, scope: !2818)
!2825 = !DILocation(line: 744, column: 3, scope: !2818)
!2826 = !DILocation(line: 745, column: 3, scope: !2818)
!2827 = !DILocalVariable(name: "i", scope: !2818, file: !74, line: 741, type: !40)
!2828 = !DILocation(line: 746, column: 8, scope: !2829)
!2829 = distinct !DILexicalBlock(scope: !2818, file: !74, line: 746, column: 3)
!2830 = !DILocation(line: 746, scope: !2829)
!2831 = !DILocation(line: 746, column: 17, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2829, file: !74, line: 746, column: 3)
!2833 = !DILocation(line: 746, column: 3, scope: !2829)
!2834 = !DILocation(line: 747, column: 19, scope: !2832)
!2835 = !DILocation(line: 747, column: 15, scope: !2832)
!2836 = !DILocation(line: 747, column: 24, scope: !2832)
!2837 = !DILocation(line: 747, column: 5, scope: !2832)
!2838 = !DILocation(line: 746, column: 23, scope: !2832)
!2839 = !DILocation(line: 746, column: 3, scope: !2832)
!2840 = distinct !{!2840, !2833, !2841, !130}
!2841 = !DILocation(line: 747, column: 28, scope: !2829)
!2842 = !DILocation(line: 748, column: 1, scope: !2818)
!2843 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !2844, file: !2844, line: 18, type: !2845, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2844 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2845 = !DISubroutineType(types: !2846)
!2846 = !{null, !1904, !275, !33, !33}
!2847 = !DILocalVariable(name: "state", arg: 1, scope: !2843, file: !2844, line: 18, type: !1904)
!2848 = !DILocation(line: 0, scope: !2843)
!2849 = !DILocalVariable(name: "seed", arg: 2, scope: !2843, file: !2844, line: 19, type: !275)
!2850 = !DILocalVariable(name: "x", arg: 3, scope: !2843, file: !2844, line: 20, type: !33)
!2851 = !DILocalVariable(name: "y", arg: 4, scope: !2843, file: !2844, line: 21, type: !33)
!2852 = !DILocalVariable(name: "extseed", scope: !2843, file: !2844, line: 23, type: !2853)
!2853 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !2854)
!2854 = !{!2855}
!2855 = !DISubrange(count: 34)
!2856 = !DILocation(line: 23, column: 11, scope: !2843)
!2857 = !DILocation(line: 25, column: 3, scope: !2843)
!2858 = !DILocation(line: 26, column: 3, scope: !2843)
!2859 = !DILocation(line: 26, column: 29, scope: !2843)
!2860 = !DILocation(line: 27, column: 3, scope: !2843)
!2861 = !DILocation(line: 27, column: 29, scope: !2843)
!2862 = !DILocation(line: 29, column: 3, scope: !2843)
!2863 = !DILocation(line: 30, column: 1, scope: !2843)
!2864 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !2844, file: !2844, line: 43, type: !2865, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2865 = !DISubroutineType(types: !2866)
!2866 = !{null, !32, !38, !275, !33}
!2867 = !DILocalVariable(name: "out", arg: 1, scope: !2864, file: !2844, line: 43, type: !32)
!2868 = !DILocation(line: 0, scope: !2864)
!2869 = !DILocalVariable(name: "outlen", arg: 2, scope: !2864, file: !2844, line: 43, type: !38)
!2870 = !DILocalVariable(name: "key", arg: 3, scope: !2864, file: !2844, line: 43, type: !275)
!2871 = !DILocalVariable(name: "nonce", arg: 4, scope: !2864, file: !2844, line: 43, type: !33)
!2872 = !DILocalVariable(name: "extkey", scope: !2864, file: !2844, line: 45, type: !2873)
!2873 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !2874)
!2874 = !{!2875}
!2875 = !DISubrange(count: 33)
!2876 = !DILocation(line: 45, column: 11, scope: !2864)
!2877 = !DILocation(line: 47, column: 3, scope: !2864)
!2878 = !DILocation(line: 48, column: 3, scope: !2864)
!2879 = !DILocation(line: 48, column: 26, scope: !2864)
!2880 = !DILocation(line: 50, column: 3, scope: !2864)
!2881 = !DILocation(line: 51, column: 1, scope: !2864)
!2882 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !2844, file: !2844, line: 64, type: !680, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2883 = !DILocalVariable(name: "out", arg: 1, scope: !2882, file: !2844, line: 64, type: !32)
!2884 = !DILocation(line: 0, scope: !2882)
!2885 = !DILocalVariable(name: "key", arg: 2, scope: !2882, file: !2844, line: 64, type: !275)
!2886 = !DILocalVariable(name: "input", arg: 3, scope: !2882, file: !2844, line: 64, type: !275)
!2887 = !DILocalVariable(name: "s", scope: !2882, file: !2844, line: 66, type: !387)
!2888 = !DILocation(line: 66, column: 16, scope: !2882)
!2889 = !DILocation(line: 68, column: 3, scope: !2882)
!2890 = !DILocation(line: 69, column: 3, scope: !2882)
!2891 = !DILocation(line: 70, column: 3, scope: !2882)
!2892 = !DILocation(line: 71, column: 3, scope: !2882)
!2893 = !DILocation(line: 72, column: 3, scope: !2882)
!2894 = !DILocation(line: 73, column: 1, scope: !2882)
