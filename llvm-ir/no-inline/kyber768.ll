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
  %tobool.not = icmp eq i32 %call12, 0, !dbg !357
  %conv = zext i1 %tobool.not to i8, !dbg !357
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !358
  ret i32 0, !dbg !359
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !360 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !381, !DIExpression(), !382)
    #dbg_value(ptr %seed, !383, !DIExpression(), !382)
    #dbg_value(i32 %transposed, !384, !DIExpression(), !382)
    #dbg_declare(ptr %buf, !385, !DIExpression(), !389)
    #dbg_declare(ptr %state, !390, !DIExpression(), !402)
    #dbg_value(i32 0, !403, !DIExpression(), !382)
  br label %for.cond, !dbg !404

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !406
    #dbg_value(i32 %i.0, !403, !DIExpression(), !382)
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !407
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end22, !dbg !409

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !410

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !413
    #dbg_value(i32 %j.0, !414, !DIExpression(), !382)
  %exitcond = icmp ne i32 %j.0, 3, !dbg !415
  br i1 %exitcond, label %for.body3, label %for.inc20, !dbg !410

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !417
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !417

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !420
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !420
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !420
  br label %if.end, !dbg !420

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !421
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !421
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !421
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !422
    #dbg_value(i32 504, !423, !DIExpression(), !382)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !424
  %arrayidx7 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !424
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !425
    #dbg_value(i32 %call, !426, !DIExpression(), !382)
  br label %while.cond, !dbg !427

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !428
    #dbg_value(i32 %ctr.0, !426, !DIExpression(), !382)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !429
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !427

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !430
    #dbg_value(i32 168, !423, !DIExpression(), !382)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !432
  %arrayidx15 = getelementptr inbounds nuw [3 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !432
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !433
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !434
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !435
  %add = add i32 %ctr.0, %call19, !dbg !436
    #dbg_value(i32 %add, !426, !DIExpression(), !382)
  br label %while.cond, !dbg !427, !llvm.loop !437

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !439
    #dbg_value(i32 %inc, !414, !DIExpression(), !382)
  br label %for.cond1, !dbg !440, !llvm.loop !441

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !443
    #dbg_value(i32 %inc21, !403, !DIExpression(), !382)
  br label %for.cond, !dbg !444, !llvm.loop !445

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !447
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !448 {
entry:
    #dbg_value(ptr %r, !452, !DIExpression(), !453)
    #dbg_value(i32 %len, !454, !DIExpression(), !453)
    #dbg_value(ptr %buf, !455, !DIExpression(), !453)
    #dbg_value(i32 %buflen, !456, !DIExpression(), !453)
    #dbg_value(i32 0, !457, !DIExpression(), !453)
    #dbg_value(i32 0, !458, !DIExpression(), !453)
  br label %while.cond, !dbg !459

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !453
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !453
    #dbg_value(i32 %pos.0, !457, !DIExpression(), !453)
    #dbg_value(i32 %ctr.0, !458, !DIExpression(), !453)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !460
  %add = add i32 %pos.0, 3, !dbg !461
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !461
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !461
  br i1 %0, label %while.body, label %while.end, !dbg !459

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !462
  %1 = load i8, ptr %arrayidx, align 1, !dbg !462
  %conv = zext i8 %1 to i16, !dbg !462
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !464
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !464
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !464
  %conv6 = zext i8 %3 to i16, !dbg !465
  %shl = shl nuw i16 %conv6, 8, !dbg !466
  %shl.masked = and i16 %shl, 3840, !dbg !467
  %and = or disjoint i16 %shl.masked, %conv, !dbg !467
    #dbg_value(i16 %and, !468, !DIExpression(), !453)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !469
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !469
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !469
  %6 = lshr i8 %5, 4, !dbg !470
  %shr11 = zext nneg i8 %6 to i16, !dbg !470
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !471
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !471
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !471
  %conv15 = zext i8 %8 to i16, !dbg !472
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !473
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !474
    #dbg_value(i16 %or17, !475, !DIExpression(), !453)
  %add20 = add i32 %pos.0, 3, !dbg !476
    #dbg_value(i32 %add20, !457, !DIExpression(), !453)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !477
  br i1 %cmp22, label %if.then, label %if.end, !dbg !477

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !479
    #dbg_value(i32 %inc, !458, !DIExpression(), !453)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !480
  store i16 %and, ptr %arrayidx24, align 2, !dbg !481
  br label %if.end, !dbg !480

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !453
    #dbg_value(i32 %ctr.1, !458, !DIExpression(), !453)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !482
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !484
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !484

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !485
    #dbg_value(i32 %inc31, !458, !DIExpression(), !453)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !486
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !487
  br label %if.end33, !dbg !486

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !488
    #dbg_value(i32 %ctr.2, !458, !DIExpression(), !453)
  br label %while.cond, !dbg !459, !llvm.loop !489

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !453
  ret i32 %ctr.0.lcssa, !dbg !491
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !492 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !495, !DIExpression(), !496)
    #dbg_value(ptr %sk, !497, !DIExpression(), !496)
    #dbg_value(ptr %coins, !498, !DIExpression(), !496)
    #dbg_declare(ptr %buf, !499, !DIExpression(), !500)
    #dbg_value(ptr %buf, !501, !DIExpression(), !496)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !502
    #dbg_value(ptr %add.ptr, !503, !DIExpression(), !496)
    #dbg_value(i8 0, !504, !DIExpression(), !496)
    #dbg_declare(ptr %a, !505, !DIExpression(), !507)
    #dbg_declare(ptr %e, !508, !DIExpression(), !509)
    #dbg_declare(ptr %pkpv, !510, !DIExpression(), !511)
    #dbg_declare(ptr %skpv, !512, !DIExpression(), !513)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !514
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !515
  store i8 3, ptr %arrayidx, align 1, !dbg !516
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !517
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !518
    #dbg_value(i32 0, !519, !DIExpression(), !496)
  br label %for.cond, !dbg !520

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !522
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !496
    #dbg_value(i8 %nonce.0, !504, !DIExpression(), !496)
    #dbg_value(i32 %i.0, !519, !DIExpression(), !496)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !523
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !525

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !526

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !528
    #dbg_value(i8 %nonce.0, !504, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !496)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !529
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !530
    #dbg_value(i8 %inc, !504, !DIExpression(), !496)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !531
    #dbg_value(i32 %inc7, !519, !DIExpression(), !496)
  br label %for.cond, !dbg !532, !llvm.loop !533

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc15, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !535
  %nonce.1 = phi i8 [ %inc13, %for.body10 ], [ 3, %for.cond8.preheader ], !dbg !496
    #dbg_value(i8 %nonce.1, !504, !DIExpression(), !496)
    #dbg_value(i32 %i.1, !519, !DIExpression(), !496)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !536
  br i1 %exitcond1, label %for.body10, label %for.end16, !dbg !526

for.body10:                                       ; preds = %for.cond8
  %arrayidx12 = getelementptr inbounds nuw [3 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !538
    #dbg_value(i8 %nonce.1, !504, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !496)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !539
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !540
    #dbg_value(i8 %inc13, !504, !DIExpression(), !496)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !541
    #dbg_value(i32 %inc15, !519, !DIExpression(), !496)
  br label %for.cond8, !dbg !542, !llvm.loop !543

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !545
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !546
    #dbg_value(i32 0, !519, !DIExpression(), !496)
  br label %for.cond17, !dbg !547

for.cond17:                                       ; preds = %for.body19, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.body19 ], !dbg !549
    #dbg_value(i32 %i.2, !519, !DIExpression(), !496)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !550
  br i1 %exitcond2, label %for.body19, label %for.end27, !dbg !552

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !553
  %arrayidx22 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !555
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #3, !dbg !556
  %arrayidx24 = getelementptr inbounds nuw [3 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !557
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef nonnull %arrayidx24) #3, !dbg !558
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !559
    #dbg_value(i32 %inc26, !519, !DIExpression(), !496)
  br label %for.cond17, !dbg !560, !llvm.loop !561

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !563
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !564
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !565
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !566
  ret void, !dbg !567
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef %sk) unnamed_addr #0 !dbg !568 {
entry:
    #dbg_value(ptr %r, !571, !DIExpression(), !572)
    #dbg_value(ptr %sk, !573, !DIExpression(), !572)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #3, !dbg !574
  ret void, !dbg !575
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) unnamed_addr #0 !dbg !576 {
entry:
    #dbg_value(ptr %r, !579, !DIExpression(), !580)
    #dbg_value(ptr %pk, !581, !DIExpression(), !580)
    #dbg_value(ptr %seed, !582, !DIExpression(), !580)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #3, !dbg !583
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1152, !dbg !584
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %seed, i32 noundef 32) #4, !dbg !585
  ret void, !dbg !586
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !587 {
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
    #dbg_value(ptr %c, !590, !DIExpression(), !591)
    #dbg_value(ptr %m, !592, !DIExpression(), !591)
    #dbg_value(ptr %pk, !593, !DIExpression(), !591)
    #dbg_value(ptr %coins, !594, !DIExpression(), !591)
    #dbg_declare(ptr %seed, !595, !DIExpression(), !596)
    #dbg_value(i8 0, !597, !DIExpression(), !591)
    #dbg_declare(ptr %sp, !598, !DIExpression(), !599)
    #dbg_declare(ptr %pkpv, !600, !DIExpression(), !601)
    #dbg_declare(ptr %ep, !602, !DIExpression(), !603)
    #dbg_declare(ptr %at, !604, !DIExpression(), !605)
    #dbg_declare(ptr %b, !606, !DIExpression(), !607)
    #dbg_declare(ptr %v, !608, !DIExpression(), !609)
    #dbg_declare(ptr %k, !610, !DIExpression(), !611)
    #dbg_declare(ptr %epp, !612, !DIExpression(), !613)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !614
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !615
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !616
    #dbg_value(i32 0, !617, !DIExpression(), !591)
  br label %for.cond, !dbg !618

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !620
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !591
    #dbg_value(i8 %nonce.0, !597, !DIExpression(), !591)
    #dbg_value(i32 %i.0, !617, !DIExpression(), !591)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !621
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !623

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !624

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !626
    #dbg_value(i8 %nonce.0, !597, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !591)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !627
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !628
    #dbg_value(i8 %inc, !597, !DIExpression(), !591)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !629
    #dbg_value(i32 %inc4, !617, !DIExpression(), !591)
  br label %for.cond, !dbg !630, !llvm.loop !631

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc13, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !633
  %nonce.1 = phi i8 [ %inc11, %for.body7 ], [ 3, %for.cond5.preheader ], !dbg !591
    #dbg_value(i8 %nonce.1, !597, !DIExpression(), !591)
    #dbg_value(i32 %i.1, !617, !DIExpression(), !591)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !634
  br i1 %exitcond1, label %for.body7, label %for.end14, !dbg !624

for.body7:                                        ; preds = %for.cond5
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !636
    #dbg_value(i8 %nonce.1, !597, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !591)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !637
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !638
    #dbg_value(i8 %inc11, !597, !DIExpression(), !591)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !639
    #dbg_value(i32 %inc13, !617, !DIExpression(), !591)
  br label %for.cond5, !dbg !640, !llvm.loop !641

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !597, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !591)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 6) #3, !dbg !643
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !644
    #dbg_value(i32 0, !617, !DIExpression(), !591)
  br label %for.cond16, !dbg !645

for.cond16:                                       ; preds = %for.body18, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.body18 ], !dbg !647
    #dbg_value(i32 %i.2, !617, !DIExpression(), !591)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !648
  br i1 %exitcond2, label %for.body18, label %for.end23, !dbg !650

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !651
  %arrayidx20 = getelementptr inbounds nuw [3 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !652
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #3, !dbg !653
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !654
    #dbg_value(i32 %inc22, !617, !DIExpression(), !591)
  br label %for.cond16, !dbg !655, !llvm.loop !656

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !658
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !659
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !660
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !661
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !662
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !663
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !664
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !665
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !666
  ret void, !dbg !667
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !668 {
entry:
    #dbg_value(ptr %pk, !671, !DIExpression(), !672)
    #dbg_value(ptr %seed, !673, !DIExpression(), !672)
    #dbg_value(ptr %packedpk, !674, !DIExpression(), !672)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #3, !dbg !675
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1152, !dbg !676
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !677
  ret void, !dbg !678
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) unnamed_addr #0 !dbg !679 {
entry:
    #dbg_value(ptr %r, !683, !DIExpression(), !684)
    #dbg_value(ptr %b, !685, !DIExpression(), !684)
    #dbg_value(ptr %v, !686, !DIExpression(), !684)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #3, !dbg !687
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 960, !dbg !688
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef %v) #3, !dbg !689
  ret void, !dbg !690
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !691 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !694, !DIExpression(), !695)
    #dbg_value(ptr %c, !696, !DIExpression(), !695)
    #dbg_value(ptr %sk, !697, !DIExpression(), !695)
    #dbg_declare(ptr %b, !698, !DIExpression(), !699)
    #dbg_declare(ptr %skpv, !700, !DIExpression(), !701)
    #dbg_declare(ptr %v, !702, !DIExpression(), !703)
    #dbg_declare(ptr %mp, !704, !DIExpression(), !705)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !706
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !707
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !708
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !709
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !710
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !711
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !712
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !713
  ret void, !dbg !714
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) unnamed_addr #0 !dbg !715 {
entry:
    #dbg_value(ptr %b, !718, !DIExpression(), !719)
    #dbg_value(ptr %v, !720, !DIExpression(), !719)
    #dbg_value(ptr %c, !721, !DIExpression(), !719)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #3, !dbg !722
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !723
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %v, ptr noundef nonnull %add.ptr) #3, !dbg !724
  ret void, !dbg !725
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !726 {
entry:
    #dbg_value(ptr %sk, !729, !DIExpression(), !730)
    #dbg_value(ptr %packedsk, !731, !DIExpression(), !730)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #3, !dbg !732
  ret void, !dbg !733
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !734 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !749, !DIExpression(), !750)
    #dbg_value(ptr %a, !751, !DIExpression(), !750)
    #dbg_declare(ptr %t, !752, !DIExpression(), !756)
    #dbg_value(i32 0, !757, !DIExpression(), !750)
  br label %for.cond, !dbg !758

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !760
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !749, !DIExpression(), !750)
    #dbg_value(i32 %i.0, !757, !DIExpression(), !750)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !761
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !763

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !764

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !767
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !749, !DIExpression(), !750)
    #dbg_value(i32 %j.0, !768, !DIExpression(), !750)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !769
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !764

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !771

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !774
    #dbg_value(i32 %k.0, !775, !DIExpression(), !750)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !776
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !771

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !778
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !780
  %add = or disjoint i32 %mul, %k.0, !dbg !781
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !778
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !778
  %isneg = icmp slt i16 %0, 0, !dbg !782
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !782
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !783
  %add12 = add i16 %and, %0, !dbg !784
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !784
  %conv15 = zext i16 %add12 to i64, !dbg !785
    #dbg_value(i64 %conv15, !786, !DIExpression(), !750)
    #dbg_value(i64 %conv15, !786, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !750)
    #dbg_value(i64 %conv15, !786, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !750)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !787
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !787
    #dbg_value(i64 %mul17, !786, !DIExpression(), !750)
  %shr18 = lshr i64 %mul17, 32, !dbg !788
    #dbg_value(i64 %shr18, !786, !DIExpression(), !750)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !789
  %conv20 = and i16 %2, 1023, !dbg !789
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !790
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !791
  %inc = add nuw nsw i32 %k.0, 1, !dbg !792
    #dbg_value(i32 %inc, !775, !DIExpression(), !750)
  br label %for.cond4, !dbg !793, !llvm.loop !794

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !796
  %conv25 = trunc i16 %3 to i8, !dbg !797
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !798
  %4 = load i16, ptr %t, align 2, !dbg !799
  %5 = lshr i16 %4, 8, !dbg !800
  %shr29 = trunc nuw i16 %5 to i8, !dbg !800
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !801
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !801
  %conv31 = trunc i16 %6 to i8, !dbg !801
  %shl32 = shl i8 %conv31, 2, !dbg !802
  %or = or i8 %shl32, %shr29, !dbg !803
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !804
  store i8 %or, ptr %arrayidx34, align 1, !dbg !805
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !806
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !806
  %8 = lshr i16 %7, 6, !dbg !807
  %shr37 = trunc i16 %8 to i8, !dbg !807
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !808
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !808
  %conv39 = trunc i16 %9 to i8, !dbg !808
  %shl40 = shl i8 %conv39, 4, !dbg !809
  %or41 = or i8 %shl40, %shr37, !dbg !810
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !811
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !812
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !813
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !813
  %11 = lshr i16 %10, 4, !dbg !814
  %shr46 = trunc i16 %11 to i8, !dbg !814
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !815
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !815
  %conv48 = trunc i16 %12 to i8, !dbg !815
  %shl49 = shl i8 %conv48, 6, !dbg !816
  %or50 = or i8 %shl49, %shr46, !dbg !817
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !818
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !819
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !820
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !820
  %14 = lshr i16 %13, 2, !dbg !821
  %conv56 = trunc i16 %14 to i8, !dbg !822
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !823
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !824
    #dbg_value(ptr %r.addr.1, !749, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !750)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !825
    #dbg_value(ptr %add.ptr, !749, !DIExpression(), !750)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !826
    #dbg_value(i32 %inc59, !768, !DIExpression(), !750)
  br label %for.cond1, !dbg !827, !llvm.loop !828

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !830
    #dbg_value(i32 %inc62, !757, !DIExpression(), !750)
  br label %for.cond, !dbg !831, !llvm.loop !832

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !834
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !835 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !839, !DIExpression(), !840)
    #dbg_value(ptr %a, !841, !DIExpression(), !840)
    #dbg_declare(ptr %t, !842, !DIExpression(), !843)
    #dbg_value(i32 0, !844, !DIExpression(), !840)
  br label %for.cond, !dbg !845

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !847
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !841, !DIExpression(), !840)
    #dbg_value(i32 %i.0, !844, !DIExpression(), !840)
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !848
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !850

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !851

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !854
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !841, !DIExpression(), !840)
    #dbg_value(i32 %j.0, !855, !DIExpression(), !840)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !856
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !851

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !858
  %conv = zext i8 %0 to i16, !dbg !858
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !860
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !860
  %conv6 = zext i8 %1 to i16, !dbg !861
  %shl = shl nuw i16 %conv6, 8, !dbg !862
  %or = or disjoint i16 %shl, %conv, !dbg !863
  store i16 %or, ptr %t, align 2, !dbg !864
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !865
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !865
  %3 = lshr i8 %2, 2, !dbg !866
  %shr11 = zext nneg i8 %3 to i16, !dbg !866
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !867
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !867
  %conv14 = zext i8 %4 to i16, !dbg !868
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !869
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !870
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !871
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !872
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !873
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !873
  %6 = lshr i8 %5, 4, !dbg !874
  %shr21 = zext nneg i8 %6 to i16, !dbg !874
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !875
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !875
  %conv24 = zext i8 %7 to i16, !dbg !876
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !877
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !878
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !879
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !880
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !881
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !881
  %9 = lshr i8 %8, 6, !dbg !882
  %shr31 = zext nneg i8 %9 to i16, !dbg !882
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !883
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !883
  %conv34 = zext i8 %10 to i16, !dbg !884
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !885
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !886
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !887
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !888
    #dbg_value(ptr %add.ptr, !841, !DIExpression(), !840)
    #dbg_value(i32 0, !889, !DIExpression(), !840)
  br label %for.cond39, !dbg !890

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !892
    #dbg_value(i32 %k.0, !889, !DIExpression(), !840)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !893
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !895

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !896
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !896
  %12 = and i16 %11, 1023, !dbg !897
  %and = zext nneg i16 %12 to i32, !dbg !897
  %mul = mul nuw nsw i32 %and, 3329, !dbg !898
  %add = add nuw nsw i32 %mul, 512, !dbg !899
  %shr45 = lshr i32 %add, 10, !dbg !900
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !901
  %arrayidx47 = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !902
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !903
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !904
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx47, i32 0, i32 %add49, !dbg !902
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !905
  %inc = add nuw nsw i32 %k.0, 1, !dbg !906
    #dbg_value(i32 %inc, !889, !DIExpression(), !840)
  br label %for.cond39, !dbg !907, !llvm.loop !908

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !910
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !911
    #dbg_value(i32 %inc52, !855, !DIExpression(), !840)
  br label %for.cond1, !dbg !912, !llvm.loop !913

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !915
    #dbg_value(i32 %inc55, !844, !DIExpression(), !840)
  br label %for.cond, !dbg !916, !llvm.loop !917

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !919
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !920 {
entry:
    #dbg_value(ptr %r, !921, !DIExpression(), !922)
    #dbg_value(ptr %a, !923, !DIExpression(), !922)
    #dbg_value(i32 0, !924, !DIExpression(), !922)
  br label %for.cond, !dbg !925

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !927
    #dbg_value(i32 %i.0, !924, !DIExpression(), !922)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !928
  br i1 %exitcond, label %for.body, label %for.end, !dbg !930

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !931
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !932
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !933
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !934
  %inc = add nuw nsw i32 %i.0, 1, !dbg !935
    #dbg_value(i32 %inc, !924, !DIExpression(), !922)
  br label %for.cond, !dbg !936, !llvm.loop !937

for.end:                                          ; preds = %for.cond
  ret void, !dbg !939
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !940 {
entry:
    #dbg_value(ptr %r, !941, !DIExpression(), !942)
    #dbg_value(ptr %a, !943, !DIExpression(), !942)
    #dbg_value(i32 0, !944, !DIExpression(), !942)
  br label %for.cond, !dbg !945

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !947
    #dbg_value(i32 %i.0, !944, !DIExpression(), !942)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !948
  br i1 %exitcond, label %for.body, label %for.end, !dbg !950

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !951
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !952
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !953
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !954
  %inc = add nuw nsw i32 %i.0, 1, !dbg !955
    #dbg_value(i32 %inc, !944, !DIExpression(), !942)
  br label %for.cond, !dbg !956, !llvm.loop !957

for.end:                                          ; preds = %for.cond
  ret void, !dbg !959
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !960 {
entry:
    #dbg_value(ptr %r, !963, !DIExpression(), !964)
    #dbg_value(i32 0, !965, !DIExpression(), !964)
  br label %for.cond, !dbg !966

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !968
    #dbg_value(i32 %i.0, !965, !DIExpression(), !964)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !969
  br i1 %exitcond, label %for.body, label %for.end, !dbg !971

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !972
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !973
  %inc = add nuw nsw i32 %i.0, 1, !dbg !974
    #dbg_value(i32 %inc, !965, !DIExpression(), !964)
  br label %for.cond, !dbg !975, !llvm.loop !976

for.end:                                          ; preds = %for.cond
  ret void, !dbg !978
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !979 {
entry:
    #dbg_value(ptr %r, !980, !DIExpression(), !981)
    #dbg_value(i32 0, !982, !DIExpression(), !981)
  br label %for.cond, !dbg !983

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !985
    #dbg_value(i32 %i.0, !982, !DIExpression(), !981)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !986
  br i1 %exitcond, label %for.body, label %for.end, !dbg !988

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !989
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !990
  %inc = add nuw nsw i32 %i.0, 1, !dbg !991
    #dbg_value(i32 %inc, !982, !DIExpression(), !981)
  br label %for.cond, !dbg !992, !llvm.loop !993

for.end:                                          ; preds = %for.cond
  ret void, !dbg !995
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !996 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !1000, !DIExpression(), !1001)
    #dbg_value(ptr %a, !1002, !DIExpression(), !1001)
    #dbg_value(ptr %b, !1003, !DIExpression(), !1001)
    #dbg_declare(ptr %t, !1004, !DIExpression(), !1005)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !1006
    #dbg_value(i32 1, !1007, !DIExpression(), !1001)
  br label %for.cond, !dbg !1008

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !1010
    #dbg_value(i32 %i.0, !1007, !DIExpression(), !1001)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1011
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1013

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1014
  %arrayidx6 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !1016
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #3, !dbg !1017
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !1018
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1019
    #dbg_value(i32 %inc, !1007, !DIExpression(), !1001)
  br label %for.cond, !dbg !1020, !llvm.loop !1021

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1023
  ret void, !dbg !1024
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1025 {
entry:
    #dbg_value(ptr %r, !1026, !DIExpression(), !1027)
    #dbg_value(i32 0, !1028, !DIExpression(), !1027)
  br label %for.cond, !dbg !1029

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1031
    #dbg_value(i32 %i.0, !1028, !DIExpression(), !1027)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1032
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1034

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1035
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1036
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1037
    #dbg_value(i32 %inc, !1028, !DIExpression(), !1027)
  br label %for.cond, !dbg !1038, !llvm.loop !1039

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1041
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1042 {
entry:
    #dbg_value(ptr %r, !1045, !DIExpression(), !1046)
    #dbg_value(ptr %a, !1047, !DIExpression(), !1046)
    #dbg_value(ptr %b, !1048, !DIExpression(), !1046)
    #dbg_value(i32 0, !1049, !DIExpression(), !1046)
  br label %for.cond, !dbg !1050

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1052
    #dbg_value(i32 %i.0, !1049, !DIExpression(), !1046)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !1053
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1055

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1056
  %arrayidx2 = getelementptr inbounds nuw [3 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1057
  %arrayidx4 = getelementptr inbounds nuw [3 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !1058
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #3, !dbg !1059
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1060
    #dbg_value(i32 %inc, !1049, !DIExpression(), !1046)
  br label %for.cond, !dbg !1061, !llvm.loop !1062

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1064
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1065 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1075, !DIExpression(), !1076)
    #dbg_value(ptr %a, !1077, !DIExpression(), !1076)
    #dbg_declare(ptr %t, !1078, !DIExpression(), !1082)
    #dbg_value(i32 0, !1083, !DIExpression(), !1076)
  br label %for.cond, !dbg !1084

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1086
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1075, !DIExpression(), !1076)
    #dbg_value(i32 %i.0, !1083, !DIExpression(), !1076)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1087
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1089

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1090

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1093
    #dbg_value(i32 %j.0, !1094, !DIExpression(), !1076)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1095
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1090

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1097
  %add = or disjoint i32 %mul, %j.0, !dbg !1099
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1100
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1100
    #dbg_value(i16 %0, !1101, !DIExpression(), !1076)
  %isneg = icmp slt i16 %0, 0, !dbg !1102
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1102
  %add5 = add i16 %and, %0, !dbg !1103
    #dbg_value(i16 %add5, !1101, !DIExpression(), !1076)
  %conv7 = sext i16 %add5 to i32, !dbg !1104
    #dbg_value(i32 %conv7, !1105, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1076)
    #dbg_value(i32 %conv7, !1105, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1076)
  %1 = mul i32 %conv7, 1290160, !dbg !1106
  %mul9 = add i32 %1, 134257275, !dbg !1106
    #dbg_value(i32 %mul9, !1105, !DIExpression(), !1076)
  %shr10 = lshr i32 %mul9, 28, !dbg !1107
    #dbg_value(i32 %shr10, !1105, !DIExpression(), !1076)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1108
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1109
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1110
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1111
    #dbg_value(i32 %inc, !1094, !DIExpression(), !1076)
  br label %for.cond1, !dbg !1112, !llvm.loop !1113

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1115
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1116
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1116
  %shl18 = shl i8 %3, 4, !dbg !1117
  %or = or i8 %shl18, %2, !dbg !1118
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1119
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1120
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1120
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1121
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1121
  %shl25 = shl i8 %5, 4, !dbg !1122
  %or26 = or i8 %shl25, %4, !dbg !1123
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1124
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1125
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1126
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1126
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1127
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1127
  %shl33 = shl i8 %7, 4, !dbg !1128
  %or34 = or i8 %shl33, %6, !dbg !1129
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1130
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1131
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1132
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1132
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1133
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1133
  %shl41 = shl i8 %9, 4, !dbg !1134
  %or42 = or i8 %shl41, %8, !dbg !1135
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1136
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1137
    #dbg_value(ptr %r.addr.0, !1075, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1076)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1138
    #dbg_value(ptr %add.ptr, !1075, !DIExpression(), !1076)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1139
    #dbg_value(i32 %inc46, !1083, !DIExpression(), !1076)
  br label %for.cond, !dbg !1140, !llvm.loop !1141

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1143
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1144 {
entry:
    #dbg_value(ptr %r, !1148, !DIExpression(), !1149)
    #dbg_value(ptr %a, !1150, !DIExpression(), !1149)
    #dbg_value(i32 0, !1151, !DIExpression(), !1149)
  br label %for.cond, !dbg !1152

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1154
    #dbg_value(i32 %i.0, !1151, !DIExpression(), !1149)
    #dbg_value(ptr %a.addr.0, !1150, !DIExpression(), !1149)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1155
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1157

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1158
  %1 = and i8 %0, 15, !dbg !1160
  %conv2 = zext nneg i8 %1 to i32, !dbg !1161
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1162
  %add = add nuw nsw i32 %mul, 8, !dbg !1163
  %shr = lshr i32 %add, 4, !dbg !1164
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1165
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1166
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1167
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1168
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1169
  %3 = lshr i8 %2, 4, !dbg !1170
  %conv11 = zext nneg i8 %3 to i32, !dbg !1171
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1172
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1173
  %shr14 = lshr i32 %add13, 4, !dbg !1174
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1175
  %mul17 = shl nuw nsw i32 %i.0, 1, !dbg !1176
  %add18 = or disjoint i32 %mul17, 1, !dbg !1177
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1178
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !1179
    #dbg_value(ptr %a.addr.0, !1150, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1149)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1180
    #dbg_value(ptr %add.ptr, !1150, !DIExpression(), !1149)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1181
    #dbg_value(i32 %inc, !1151, !DIExpression(), !1149)
  br label %for.cond, !dbg !1182, !llvm.loop !1183

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1185
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1186 {
entry:
    #dbg_value(ptr %r, !1187, !DIExpression(), !1188)
    #dbg_value(ptr %a, !1189, !DIExpression(), !1188)
    #dbg_value(i32 0, !1190, !DIExpression(), !1188)
  br label %for.cond, !dbg !1191

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1193
    #dbg_value(i32 %i.0, !1190, !DIExpression(), !1188)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1194
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1196

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1197
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1199
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1199
    #dbg_value(i16 %0, !1200, !DIExpression(), !1188)
  %isneg = icmp slt i16 %0, 0, !dbg !1201
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1201
  %add = add i16 %and, %0, !dbg !1202
    #dbg_value(i16 %add, !1200, !DIExpression(), !1188)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1203
  %add5 = or disjoint i32 %mul4, 1, !dbg !1204
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !1205
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1205
    #dbg_value(i16 %1, !1206, !DIExpression(), !1188)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1207
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !1207
  %add11 = add i16 %and9, %1, !dbg !1208
    #dbg_value(i16 %add11, !1206, !DIExpression(), !1188)
  %conv15 = trunc i16 %add to i8, !dbg !1209
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !1210
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !1211
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1212
  %2 = lshr i16 %add, 8, !dbg !1213
  %shr20 = trunc nuw i16 %2 to i8, !dbg !1213
  %conv21 = trunc i16 %add11 to i8, !dbg !1214
  %shl = shl i8 %conv21, 4, !dbg !1215
  %or = or i8 %shl, %shr20, !dbg !1216
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !1217
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !1218
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1218
  store i8 %or, ptr %arrayidx25, align 1, !dbg !1219
  %4 = lshr i16 %add11, 4, !dbg !1220
  %conv28 = trunc i16 %4 to i8, !dbg !1221
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !1222
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !1223
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1223
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1224
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1225
    #dbg_value(i32 %inc, !1190, !DIExpression(), !1188)
  br label %for.cond, !dbg !1226, !llvm.loop !1227

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1229
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1230 {
entry:
    #dbg_value(ptr %r, !1231, !DIExpression(), !1232)
    #dbg_value(ptr %a, !1233, !DIExpression(), !1232)
    #dbg_value(i32 0, !1234, !DIExpression(), !1232)
  br label %for.cond, !dbg !1235

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1237
    #dbg_value(i32 %i.0, !1234, !DIExpression(), !1232)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1238
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1240

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1241
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1243
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1243
  %conv = zext i8 %0 to i16, !dbg !1243
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1244
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1245
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1245
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1245
  %conv5 = zext i8 %2 to i16, !dbg !1246
  %shl = shl nuw i16 %conv5, 8, !dbg !1247
  %shl.masked = and i16 %shl, 3840, !dbg !1248
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1248
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1249
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1250
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1251
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1252
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1253
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1253
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1253
  %5 = lshr i8 %4, 4, !dbg !1254
  %shr13 = zext nneg i8 %5 to i16, !dbg !1254
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1255
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1256
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1256
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1256
  %conv18 = zext i8 %7 to i16, !dbg !1257
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1258
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1259
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !1260
  %add25 = or disjoint i32 %mul24, 1, !dbg !1261
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !1262
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !1263
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1264
    #dbg_value(i32 %inc, !1234, !DIExpression(), !1232)
  br label %for.cond, !dbg !1265, !llvm.loop !1266

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1268
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1269 {
entry:
    #dbg_value(ptr %r, !1270, !DIExpression(), !1271)
    #dbg_value(ptr %msg, !1272, !DIExpression(), !1271)
    #dbg_value(i32 0, !1273, !DIExpression(), !1271)
  br label %for.cond, !dbg !1274

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1276
    #dbg_value(i32 %i.0, !1273, !DIExpression(), !1271)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1277
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end11, !dbg !1279

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1280

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1283
    #dbg_value(i32 %j.0, !1284, !DIExpression(), !1271)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1285
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !1280

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1287
  %add = or disjoint i32 %mul, %j.0, !dbg !1289
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1290
  store i16 0, ptr %arrayidx, align 2, !dbg !1291
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1292
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1292
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1293
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1294
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1294
  %conv = zext i8 %0 to i32, !dbg !1294
  %shr = lshr i32 %conv, %j.0, !dbg !1295
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1296
  %conv8 = and i16 %1, 1, !dbg !1296
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #3, !dbg !1297
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1298
    #dbg_value(i32 %inc, !1284, !DIExpression(), !1271)
  br label %for.cond1, !dbg !1299, !llvm.loop !1300

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !1302
    #dbg_value(i32 %inc10, !1273, !DIExpression(), !1271)
  br label %for.cond, !dbg !1303, !llvm.loop !1304

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1306
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1307 {
entry:
    #dbg_value(ptr %msg, !1308, !DIExpression(), !1309)
    #dbg_value(ptr %a, !1310, !DIExpression(), !1309)
    #dbg_value(i32 0, !1311, !DIExpression(), !1309)
  br label %for.cond, !dbg !1312

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1314
    #dbg_value(i32 %i.0, !1311, !DIExpression(), !1309)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1315
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1317

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1318
  store i8 0, ptr %arrayidx, align 1, !dbg !1320
    #dbg_value(i32 0, !1321, !DIExpression(), !1309)
  br label %for.cond1, !dbg !1322

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1324
    #dbg_value(i32 %j.0, !1321, !DIExpression(), !1309)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1325
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1327

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1328
  %add = or disjoint i32 %mul, %j.0, !dbg !1330
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1331
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1331
  %conv = sext i16 %0 to i32, !dbg !1331
    #dbg_value(i32 %conv, !1332, !DIExpression(), !1309)
    #dbg_value(i32 %conv, !1332, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1309)
    #dbg_value(i32 %conv, !1332, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1309)
  %1 = mul i32 %conv, 161270, !dbg !1333
  %mul6 = add i32 %1, 134257275, !dbg !1333
    #dbg_value(i32 %mul6, !1332, !DIExpression(), !1309)
  %shr = lshr i32 %mul6, 28, !dbg !1334
    #dbg_value(i32 %shr, !1332, !DIExpression(), !1309)
  %and = and i32 %shr, 1, !dbg !1335
    #dbg_value(i32 %and, !1332, !DIExpression(), !1309)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1336
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1337
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1338
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1338
  %conv10 = or i8 %2, %3, !dbg !1338
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1338
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1339
    #dbg_value(i32 %inc, !1321, !DIExpression(), !1309)
  br label %for.cond1, !dbg !1340, !llvm.loop !1341

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1343
    #dbg_value(i32 %inc12, !1311, !DIExpression(), !1309)
  br label %for.cond, !dbg !1344, !llvm.loop !1345

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1347
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1348 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1351, !DIExpression(), !1352)
    #dbg_value(ptr %seed, !1353, !DIExpression(), !1352)
    #dbg_value(i8 %nonce, !1354, !DIExpression(), !1352)
    #dbg_declare(ptr %buf, !1355, !DIExpression(), !1357)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1358
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1359
  ret void, !dbg !1360
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1361 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1362, !DIExpression(), !1363)
    #dbg_value(ptr %seed, !1364, !DIExpression(), !1363)
    #dbg_value(i8 %nonce, !1365, !DIExpression(), !1363)
    #dbg_declare(ptr %buf, !1366, !DIExpression(), !1367)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1368
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1369
  ret void, !dbg !1370
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1371 {
entry:
    #dbg_value(ptr %r, !1374, !DIExpression(), !1375)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #3, !dbg !1376
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1377
  ret void, !dbg !1378
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1379 {
entry:
    #dbg_value(ptr %r, !1380, !DIExpression(), !1381)
    #dbg_value(i32 0, !1382, !DIExpression(), !1381)
  br label %for.cond, !dbg !1383

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1385
    #dbg_value(i32 %i.0, !1382, !DIExpression(), !1381)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1386
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1388

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1389
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1389
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1390
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1391
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1392
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1393
    #dbg_value(i32 %inc, !1382, !DIExpression(), !1381)
  br label %for.cond, !dbg !1394, !llvm.loop !1395

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1397
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1398 {
entry:
    #dbg_value(ptr %r, !1399, !DIExpression(), !1400)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #3, !dbg !1401
  ret void, !dbg !1402
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1403 {
entry:
    #dbg_value(ptr %r, !1406, !DIExpression(), !1407)
    #dbg_value(ptr %a, !1408, !DIExpression(), !1407)
    #dbg_value(ptr %b, !1409, !DIExpression(), !1407)
    #dbg_value(i32 0, !1410, !DIExpression(), !1407)
  br label %for.cond, !dbg !1411

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1413
    #dbg_value(i32 %i.0, !1410, !DIExpression(), !1407)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1414
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1416

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1417
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1419
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !1420
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !1421
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !1422
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !1423
  %add = or disjoint i32 %i.0, 64, !dbg !1424
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1425
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1425
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #3, !dbg !1426
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1427
  %add10 = or disjoint i32 %mul9, 2, !dbg !1428
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !1429
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !1430
  %add14 = or disjoint i32 %mul13, 2, !dbg !1431
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !1432
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !1433
  %add18 = or disjoint i32 %mul17, 2, !dbg !1434
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !1435
  %add20 = or disjoint i32 %i.0, 64, !dbg !1436
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add20, !dbg !1437
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1437
  %sub = sub i16 0, %1, !dbg !1438
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #3, !dbg !1439
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1440
    #dbg_value(i32 %inc, !1410, !DIExpression(), !1407)
  br label %for.cond, !dbg !1441, !llvm.loop !1442

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1444
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1445 {
entry:
    #dbg_value(ptr %r, !1446, !DIExpression(), !1447)
    #dbg_value(i16 1353, !1448, !DIExpression(), !1447)
    #dbg_value(i32 0, !1449, !DIExpression(), !1447)
  br label %for.cond, !dbg !1450

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1452
    #dbg_value(i32 %i.0, !1449, !DIExpression(), !1447)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1453
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1455

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1456
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1456
  %conv = sext i16 %0 to i32, !dbg !1457
  %mul = mul nsw i32 %conv, 1353, !dbg !1458
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1459
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1460
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1461
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1462
    #dbg_value(i32 %inc, !1449, !DIExpression(), !1447)
  br label %for.cond, !dbg !1463, !llvm.loop !1464

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1466
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1467 {
entry:
    #dbg_value(ptr %r, !1468, !DIExpression(), !1469)
    #dbg_value(ptr %a, !1470, !DIExpression(), !1469)
    #dbg_value(ptr %b, !1471, !DIExpression(), !1469)
    #dbg_value(i32 0, !1472, !DIExpression(), !1469)
  br label %for.cond, !dbg !1473

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1475
    #dbg_value(i32 %i.0, !1472, !DIExpression(), !1469)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1476
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1478

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1479
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1479
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1480
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1480
  %add = add i16 %0, %1, !dbg !1481
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1482
  store i16 %add, ptr %arrayidx6, align 2, !dbg !1483
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1484
    #dbg_value(i32 %inc, !1472, !DIExpression(), !1469)
  br label %for.cond, !dbg !1485, !llvm.loop !1486

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1488
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1489 {
entry:
    #dbg_value(ptr %r, !1490, !DIExpression(), !1491)
    #dbg_value(ptr %a, !1492, !DIExpression(), !1491)
    #dbg_value(ptr %b, !1493, !DIExpression(), !1491)
    #dbg_value(i32 0, !1494, !DIExpression(), !1491)
  br label %for.cond, !dbg !1495

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1497
    #dbg_value(i32 %i.0, !1494, !DIExpression(), !1491)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1498
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1500

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1501
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1501
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1502
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1502
  %sub = sub i16 %0, %1, !dbg !1503
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1504
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !1505
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1506
    #dbg_value(i32 %inc, !1494, !DIExpression(), !1491)
  br label %for.cond, !dbg !1507, !llvm.loop !1508

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1510
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1511 {
entry:
    #dbg_value(ptr %r, !1514, !DIExpression(), !1515)
    #dbg_value(i32 1, !1516, !DIExpression(), !1515)
    #dbg_value(i32 128, !1517, !DIExpression(), !1515)
  br label %for.cond, !dbg !1518

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1520
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1521
    #dbg_value(i32 %k.0, !1516, !DIExpression(), !1515)
    #dbg_value(i32 %len.0, !1517, !DIExpression(), !1515)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1522
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1524

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1525

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1528
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1515
    #dbg_value(i32 %k.1, !1516, !DIExpression(), !1515)
    #dbg_value(i32 %start.0, !1529, !DIExpression(), !1515)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1530
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1525

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1516, !DIExpression(), !1515)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1532
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1532
    #dbg_value(i16 %0, !1534, !DIExpression(), !1515)
    #dbg_value(i32 %start.0, !1535, !DIExpression(), !1515)
  br label %for.cond4, !dbg !1536

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1538
    #dbg_value(i32 %j.0, !1535, !DIExpression(), !1515)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1539
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1541
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1542

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1543
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1543
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1543
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1545
    #dbg_value(i16 %call, !1546, !DIExpression(), !1515)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1547
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1547
  %sub = sub i16 %3, %call, !dbg !1548
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1549
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1549
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1550
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1551
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1551
  %add17 = add i16 %5, %call, !dbg !1552
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1553
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1554
  %inc20 = add nuw i32 %j.0, 1, !dbg !1555
    #dbg_value(i32 %inc20, !1535, !DIExpression(), !1515)
  br label %for.cond4, !dbg !1556, !llvm.loop !1557

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1538
  %inc = add i32 %k.1, 1, !dbg !1559
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1560
    #dbg_value(i32 %add22, !1529, !DIExpression(), !1515)
  br label %for.cond1, !dbg !1561, !llvm.loop !1562

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1515
  %shr = lshr i32 %len.0, 1, !dbg !1564
    #dbg_value(i32 %shr, !1517, !DIExpression(), !1515)
  br label %for.cond, !dbg !1565, !llvm.loop !1566

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1568
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1569 {
entry:
    #dbg_value(i16 %a, !1572, !DIExpression(), !1573)
    #dbg_value(i16 %b, !1574, !DIExpression(), !1573)
  %conv = sext i16 %a to i32, !dbg !1575
  %conv1 = sext i16 %b to i32, !dbg !1576
  %mul = mul nsw i32 %conv, %conv1, !dbg !1577
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1578
  ret i16 %call, !dbg !1579
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1580 {
entry:
    #dbg_value(ptr %r, !1581, !DIExpression(), !1582)
    #dbg_value(i16 1441, !1583, !DIExpression(), !1582)
    #dbg_value(i32 127, !1584, !DIExpression(), !1582)
    #dbg_value(i32 2, !1585, !DIExpression(), !1582)
  br label %for.cond, !dbg !1586

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1588
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1589
    #dbg_value(i32 %k.0, !1584, !DIExpression(), !1582)
    #dbg_value(i32 %len.0, !1585, !DIExpression(), !1582)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1590
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1592

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1593

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1596

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1598
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1582
    #dbg_value(i32 %k.1, !1584, !DIExpression(), !1582)
    #dbg_value(i32 %start.0, !1599, !DIExpression(), !1582)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1600
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1593

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1584, !DIExpression(), !1582)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1602
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1602
    #dbg_value(i16 %0, !1604, !DIExpression(), !1582)
    #dbg_value(i32 %start.0, !1605, !DIExpression(), !1582)
  br label %for.cond4, !dbg !1606

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1608
    #dbg_value(i32 %j.0, !1605, !DIExpression(), !1582)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1609
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1611
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1612

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1613
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1613
    #dbg_value(i16 %1, !1615, !DIExpression(), !1582)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1616
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1616
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1616
  %add11 = add i16 %1, %3, !dbg !1617
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1618
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1619
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1620
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1621
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1621
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1621
  %sub = sub i16 %5, %1, !dbg !1622
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1623
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1623
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1624
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1625
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1625
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1625
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1626
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1627
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1627
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1628
  %inc = add nuw i32 %j.0, 1, !dbg !1629
    #dbg_value(i32 %inc, !1605, !DIExpression(), !1582)
  br label %for.cond4, !dbg !1630, !llvm.loop !1631

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1608
  %dec = add i32 %k.1, -1, !dbg !1633
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1634
    #dbg_value(i32 %add27, !1599, !DIExpression(), !1582)
  br label %for.cond1, !dbg !1635, !llvm.loop !1636

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1582
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1638
    #dbg_value(i32 %shl, !1585, !DIExpression(), !1582)
  br label %for.cond, !dbg !1639, !llvm.loop !1640

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1642
    #dbg_value(i32 %j.1, !1605, !DIExpression(), !1582)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1643
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1596

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1645
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1645
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1646
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1647
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1648
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1649
    #dbg_value(i32 %inc39, !1605, !DIExpression(), !1582)
  br label %for.cond31, !dbg !1650, !llvm.loop !1651

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1653
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1654 {
entry:
    #dbg_value(ptr %r, !1658, !DIExpression(), !1659)
    #dbg_value(ptr %a, !1660, !DIExpression(), !1659)
    #dbg_value(ptr %b, !1661, !DIExpression(), !1659)
    #dbg_value(i16 %zeta, !1662, !DIExpression(), !1659)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1663
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1663
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1664
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1664
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1665
  store i16 %call, ptr %r, align 2, !dbg !1666
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1667
  store i16 %call4, ptr %r, align 2, !dbg !1668
  %2 = load i16, ptr %a, align 2, !dbg !1669
  %3 = load i16, ptr %b, align 2, !dbg !1670
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1671
  %4 = load i16, ptr %r, align 2, !dbg !1672
  %add = add i16 %4, %call8, !dbg !1672
  store i16 %add, ptr %r, align 2, !dbg !1672
  %5 = load i16, ptr %a, align 2, !dbg !1673
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1674
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1674
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1675
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1676
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1677
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1678
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1678
  %8 = load i16, ptr %b, align 2, !dbg !1679
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1680
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1681
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1682
  %add22 = add i16 %9, %call18, !dbg !1682
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1682
  ret void, !dbg !1683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1684 {
entry:
    #dbg_value(ptr %r, !1693, !DIExpression(), !1694)
    #dbg_value(ptr %buf, !1695, !DIExpression(), !1694)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1696
  ret void, !dbg !1697
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1698 {
entry:
    #dbg_value(ptr %r, !1699, !DIExpression(), !1700)
    #dbg_value(ptr %buf, !1701, !DIExpression(), !1700)
    #dbg_value(i32 0, !1702, !DIExpression(), !1700)
  br label %for.cond, !dbg !1703

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1705
    #dbg_value(i32 %i.0, !1702, !DIExpression(), !1700)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1706
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1708

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1709
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1711
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1712
    #dbg_value(i32 %call, !1713, !DIExpression(), !1700)
  %and = and i32 %call, 1431655765, !dbg !1714
    #dbg_value(i32 %and, !1715, !DIExpression(), !1700)
  %shr = lshr i32 %call, 1, !dbg !1716
  %and1 = and i32 %shr, 1431655765, !dbg !1717
  %add = add nuw i32 %and, %and1, !dbg !1718
    #dbg_value(i32 %add, !1715, !DIExpression(), !1700)
    #dbg_value(i32 0, !1719, !DIExpression(), !1700)
  br label %for.cond2, !dbg !1720

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1722
    #dbg_value(i32 %j.0, !1719, !DIExpression(), !1700)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1723
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1725

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1726
  %shr7 = lshr i32 %add, %mul5, !dbg !1728
  %conv = and i32 %shr7, 3, !dbg !1729
    #dbg_value(i32 %shr7, !1730, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1700)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1731
  %add10 = or disjoint i32 %mul9, 2, !dbg !1732
  %shr11 = lshr i32 %add, %add10, !dbg !1733
  %conv13 = and i32 %shr11, 3, !dbg !1734
    #dbg_value(i32 %conv13, !1735, !DIExpression(), !1700)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1736
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1737
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1738
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1739
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1740
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1741
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1742
    #dbg_value(i32 %inc, !1719, !DIExpression(), !1700)
  br label %for.cond2, !dbg !1743, !llvm.loop !1744

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1746
    #dbg_value(i32 %inc20, !1702, !DIExpression(), !1700)
  br label %for.cond, !dbg !1747, !llvm.loop !1748

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1750
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1751 {
entry:
    #dbg_value(ptr %x, !1754, !DIExpression(), !1755)
  %0 = load i8, ptr %x, align 1, !dbg !1756
  %conv = zext i8 %0 to i32, !dbg !1757
    #dbg_value(i32 %conv, !1758, !DIExpression(), !1755)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1759
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1759
  %conv2 = zext i8 %1 to i32, !dbg !1760
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1761
  %or = or disjoint i32 %shl, %conv, !dbg !1762
    #dbg_value(i32 %or, !1758, !DIExpression(), !1755)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1763
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1763
  %conv4 = zext i8 %2 to i32, !dbg !1764
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1765
  %or6 = or disjoint i32 %or, %shl5, !dbg !1766
    #dbg_value(i32 %or6, !1758, !DIExpression(), !1755)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1767
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1767
  %conv8 = zext i8 %3 to i32, !dbg !1768
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1769
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1770
    #dbg_value(i32 %or10, !1758, !DIExpression(), !1755)
  ret i32 %or10, !dbg !1771
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1772 {
entry:
    #dbg_value(ptr %r, !1773, !DIExpression(), !1774)
    #dbg_value(ptr %buf, !1775, !DIExpression(), !1774)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1776
  ret void, !dbg !1777
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1778 {
entry:
    #dbg_value(i32 %a, !1781, !DIExpression(), !1782)
    #dbg_value(i32 %a, !1783, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1782)
  %sext = mul i32 %a, -218038272, !dbg !1784
  %conv3 = ashr exact i32 %sext, 16, !dbg !1784
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1785
  %sub = add i32 %mul4.neg, %a, !dbg !1786
  %shr = lshr i32 %sub, 16, !dbg !1787
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1788
    #dbg_value(i16 %conv5, !1783, !DIExpression(), !1782)
  ret i16 %conv5, !dbg !1789
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1790 {
entry:
    #dbg_value(i16 %a, !1793, !DIExpression(), !1794)
    #dbg_value(i16 20159, !1795, !DIExpression(), !1794)
  %conv = sext i16 %a to i32, !dbg !1796
  %mul = mul nsw i32 %conv, 20159, !dbg !1797
  %add = add nsw i32 %mul, 33554432, !dbg !1798
  %shr = ashr i32 %add, 26, !dbg !1799
    #dbg_value(i32 %shr, !1800, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1794)
    #dbg_value(i32 %shr, !1800, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1794)
  %0 = trunc nsw i32 %shr to i16, !dbg !1801
  %1 = mul i16 %0, -3329, !dbg !1801
  %conv7 = add i16 %1, %a, !dbg !1801
  ret i16 %conv7, !dbg !1802
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1803 {
entry:
    #dbg_value(ptr %a, !1807, !DIExpression(), !1808)
    #dbg_value(ptr %b, !1809, !DIExpression(), !1808)
    #dbg_value(i32 %len, !1810, !DIExpression(), !1808)
    #dbg_value(i8 0, !1811, !DIExpression(), !1808)
    #dbg_value(i32 0, !1812, !DIExpression(), !1808)
  br label %for.cond, !dbg !1813

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1815
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1808
    #dbg_value(i8 %r.0, !1811, !DIExpression(), !1808)
    #dbg_value(i32 %i.0, !1812, !DIExpression(), !1808)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1816
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1818

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1808)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1819
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1819
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1820
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1820
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1808)
  %xor1 = xor i8 %0, %1, !dbg !1821
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1811, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1808)
  %or2 = or i8 %r.0, %xor1, !dbg !1822
    #dbg_value(i8 %or2, !1811, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1808)
    #dbg_value(i8 %or2, !1811, !DIExpression(), !1808)
  %inc = add i32 %i.0, 1, !dbg !1823
    #dbg_value(i32 %inc, !1812, !DIExpression(), !1808)
  br label %for.cond, !dbg !1824, !llvm.loop !1825

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1808
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1827
  %conv6 = zext i1 %2 to i32, !dbg !1828
  ret i32 %conv6, !dbg !1829
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1830 {
entry:
    #dbg_value(ptr %r, !1833, !DIExpression(), !1834)
    #dbg_value(ptr %x, !1835, !DIExpression(), !1834)
    #dbg_value(i32 %len, !1836, !DIExpression(), !1834)
    #dbg_value(i8 %b, !1837, !DIExpression(), !1834)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1838, !srcloc !1839
    #dbg_value(i8 %0, !1837, !DIExpression(), !1834)
  %sub = sub i8 0, %0, !dbg !1840
    #dbg_value(i8 %sub, !1837, !DIExpression(), !1834)
    #dbg_value(i32 0, !1841, !DIExpression(), !1834)
  br label %for.cond, !dbg !1842

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1844
    #dbg_value(i32 %i.0, !1841, !DIExpression(), !1834)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1845
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1847

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1848
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1848
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1849
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1849
  %xor1 = xor i8 %1, %2, !dbg !1850
  %and2 = and i8 %xor1, %sub, !dbg !1851
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1852
  %xor93 = xor i8 %1, %and2, !dbg !1853
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1853
  %inc = add i32 %i.0, 1, !dbg !1854
    #dbg_value(i32 %inc, !1841, !DIExpression(), !1834)
  br label %for.cond, !dbg !1855, !llvm.loop !1856

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1858
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1859 {
entry:
    #dbg_value(ptr %r, !1862, !DIExpression(), !1863)
    #dbg_value(i16 %v, !1864, !DIExpression(), !1863)
    #dbg_value(i16 %b, !1865, !DIExpression(), !1863)
  %sub = sub i16 0, %b, !dbg !1866
    #dbg_value(i16 %sub, !1865, !DIExpression(), !1863)
  %0 = load i16, ptr %r, align 2, !dbg !1867
  %xor1 = xor i16 %0, %v, !dbg !1868
  %and = and i16 %xor1, %sub, !dbg !1869
  %xor6 = xor i16 %and, %0, !dbg !1870
  store i16 %xor6, ptr %r, align 2, !dbg !1870
  ret void, !dbg !1871
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1872 {
entry:
    #dbg_value(ptr %state, !1881, !DIExpression(), !1882)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1883
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1884
  store i32 0, ptr %pos, align 8, !dbg !1885
  ret void, !dbg !1886
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1887 {
entry:
    #dbg_value(ptr %s, !1891, !DIExpression(), !1892)
    #dbg_value(i32 0, !1893, !DIExpression(), !1892)
  br label %for.cond, !dbg !1894

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1896
    #dbg_value(i32 %i.0, !1893, !DIExpression(), !1892)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1897
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1899

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1900
  store i64 0, ptr %arrayidx, align 8, !dbg !1901
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1902
    #dbg_value(i32 %inc, !1893, !DIExpression(), !1892)
  br label %for.cond, !dbg !1903, !llvm.loop !1904

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1906
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1907 {
entry:
    #dbg_value(ptr %state, !1910, !DIExpression(), !1911)
    #dbg_value(ptr %in, !1912, !DIExpression(), !1911)
    #dbg_value(i32 %inlen, !1913, !DIExpression(), !1911)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1914
  %0 = load i32, ptr %pos, align 8, !dbg !1914
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1915
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1916
  store i32 %call, ptr %pos1, align 8, !dbg !1917
  ret void, !dbg !1918
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1919 {
entry:
    #dbg_value(ptr %s, !1922, !DIExpression(), !1923)
    #dbg_value(i32 %pos, !1924, !DIExpression(), !1923)
    #dbg_value(i32 %r, !1925, !DIExpression(), !1923)
    #dbg_value(ptr %in, !1926, !DIExpression(), !1923)
    #dbg_value(i32 %inlen, !1927, !DIExpression(), !1923)
  br label %while.cond, !dbg !1928

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1924, !DIExpression(), !1923)
    #dbg_value(i32 %inlen.addr.0, !1927, !DIExpression(), !1923)
    #dbg_value(ptr %in.addr.0, !1926, !DIExpression(), !1923)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1929
  %cmp.not = icmp ult i32 %add, %r, !dbg !1930
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1928

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1931
  br label %for.cond, !dbg !1931

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1934

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1936
    #dbg_value(i32 %i.0, !1937, !DIExpression(), !1923)
    #dbg_value(ptr %in.addr.1, !1926, !DIExpression(), !1923)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1938
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1931

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1926, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1923)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1940
  %conv = zext i8 %0 to i64, !dbg !1941
  %rem = shl i32 %i.0, 3, !dbg !1942
  %mul = and i32 %rem, 56, !dbg !1942
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1943
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1943
  %div2 = lshr i32 %i.0, 3, !dbg !1944
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1945
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1946
  %xor = xor i64 %1, %shl, !dbg !1946
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1946
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1947
    #dbg_value(ptr %incdec.ptr, !1926, !DIExpression(), !1923)
  %inc = add i32 %i.0, 1, !dbg !1948
    #dbg_value(i32 %inc, !1937, !DIExpression(), !1923)
  br label %for.cond, !dbg !1949, !llvm.loop !1950

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1952
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1953
    #dbg_value(i32 %sub2, !1927, !DIExpression(), !1923)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1954
    #dbg_value(i32 0, !1924, !DIExpression(), !1923)
  br label %while.cond, !dbg !1928, !llvm.loop !1955

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1957
    #dbg_value(i32 %i.1, !1937, !DIExpression(), !1923)
    #dbg_value(ptr %in.addr.2, !1926, !DIExpression(), !1923)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1958
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1960
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1934

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1926, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1923)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1961
  %conv9 = zext i8 %2 to i64, !dbg !1962
  %rem10 = shl i32 %i.1, 3, !dbg !1963
  %mul11 = and i32 %rem10, 56, !dbg !1963
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1964
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1964
  %div141 = lshr i32 %i.1, 3, !dbg !1965
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1966
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1967
  %xor16 = xor i64 %3, %shl13, !dbg !1967
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1967
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1968
    #dbg_value(ptr %incdec.ptr8, !1926, !DIExpression(), !1923)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1969
    #dbg_value(i32 %inc18, !1937, !DIExpression(), !1923)
  br label %for.cond3, !dbg !1970, !llvm.loop !1971

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1957
  ret i32 %i.1.lcssa, !dbg !1973
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1974 {
entry:
    #dbg_value(ptr %state, !1975, !DIExpression(), !1976)
  %0 = load i64, ptr %state, align 8, !dbg !1977
    #dbg_value(i64 %0, !1978, !DIExpression(), !1976)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1979
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1979
    #dbg_value(i64 %1, !1980, !DIExpression(), !1976)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1981
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1981
    #dbg_value(i64 %2, !1982, !DIExpression(), !1976)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1983
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1983
    #dbg_value(i64 %3, !1984, !DIExpression(), !1976)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1985
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1985
    #dbg_value(i64 %4, !1986, !DIExpression(), !1976)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1987
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1987
    #dbg_value(i64 %5, !1988, !DIExpression(), !1976)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1989
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1989
    #dbg_value(i64 %6, !1990, !DIExpression(), !1976)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1991
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1991
    #dbg_value(i64 %7, !1992, !DIExpression(), !1976)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1993
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1993
    #dbg_value(i64 %8, !1994, !DIExpression(), !1976)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1995
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1995
    #dbg_value(i64 %9, !1996, !DIExpression(), !1976)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1997
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1997
    #dbg_value(i64 %10, !1998, !DIExpression(), !1976)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1999
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1999
    #dbg_value(i64 %11, !2000, !DIExpression(), !1976)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2001
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2001
    #dbg_value(i64 %12, !2002, !DIExpression(), !1976)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2003
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2003
    #dbg_value(i64 %13, !2004, !DIExpression(), !1976)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2005
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2005
    #dbg_value(i64 %14, !2006, !DIExpression(), !1976)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2007
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2007
    #dbg_value(i64 %15, !2008, !DIExpression(), !1976)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2009
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2009
    #dbg_value(i64 %16, !2010, !DIExpression(), !1976)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2011
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2011
    #dbg_value(i64 %17, !2012, !DIExpression(), !1976)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2013
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2013
    #dbg_value(i64 %18, !2014, !DIExpression(), !1976)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2015
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2015
    #dbg_value(i64 %19, !2016, !DIExpression(), !1976)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2017
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2017
    #dbg_value(i64 %20, !2018, !DIExpression(), !1976)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2019
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2019
    #dbg_value(i64 %21, !2020, !DIExpression(), !1976)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2021
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2021
    #dbg_value(i64 %22, !2022, !DIExpression(), !1976)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2023
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2023
    #dbg_value(i64 %23, !2024, !DIExpression(), !1976)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2025
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2025
    #dbg_value(i64 %24, !2026, !DIExpression(), !1976)
    #dbg_value(i32 0, !2027, !DIExpression(), !1976)
  br label %for.cond, !dbg !2028

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1976
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1976
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1976
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1976
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1976
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1976
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1976
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1976
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1976
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1976
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1976
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1976
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1976
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1976
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1976
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1976
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1976
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1976
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1976
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1976
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1976
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1976
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1976
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1976
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2030
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1976
    #dbg_value(i64 %Asu.0, !2026, !DIExpression(), !1976)
    #dbg_value(i32 %round.0, !2027, !DIExpression(), !1976)
    #dbg_value(i64 %Aba.0, !1978, !DIExpression(), !1976)
    #dbg_value(i64 %Abe.0, !1980, !DIExpression(), !1976)
    #dbg_value(i64 %Abi.0, !1982, !DIExpression(), !1976)
    #dbg_value(i64 %Abo.0, !1984, !DIExpression(), !1976)
    #dbg_value(i64 %Abu.0, !1986, !DIExpression(), !1976)
    #dbg_value(i64 %Aga.0, !1988, !DIExpression(), !1976)
    #dbg_value(i64 %Age.0, !1990, !DIExpression(), !1976)
    #dbg_value(i64 %Agi.0, !1992, !DIExpression(), !1976)
    #dbg_value(i64 %Ago.0, !1994, !DIExpression(), !1976)
    #dbg_value(i64 %Agu.0, !1996, !DIExpression(), !1976)
    #dbg_value(i64 %Aka.0, !1998, !DIExpression(), !1976)
    #dbg_value(i64 %Ake.0, !2000, !DIExpression(), !1976)
    #dbg_value(i64 %Aki.0, !2002, !DIExpression(), !1976)
    #dbg_value(i64 %Ako.0, !2004, !DIExpression(), !1976)
    #dbg_value(i64 %Aku.0, !2006, !DIExpression(), !1976)
    #dbg_value(i64 %Ama.0, !2008, !DIExpression(), !1976)
    #dbg_value(i64 %Ame.0, !2010, !DIExpression(), !1976)
    #dbg_value(i64 %Ami.0, !2012, !DIExpression(), !1976)
    #dbg_value(i64 %Amo.0, !2014, !DIExpression(), !1976)
    #dbg_value(i64 %Amu.0, !2016, !DIExpression(), !1976)
    #dbg_value(i64 %Asa.0, !2018, !DIExpression(), !1976)
    #dbg_value(i64 %Ase.0, !2020, !DIExpression(), !1976)
    #dbg_value(i64 %Asi.0, !2022, !DIExpression(), !1976)
    #dbg_value(i64 %Aso.0, !2024, !DIExpression(), !1976)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2031
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2033

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 poison, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2069
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2071
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2072
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2073
    #dbg_value(i64 %xor35, !2036, !DIExpression(), !1976)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2074
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2075
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2076
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2077
    #dbg_value(i64 %xor43, !2038, !DIExpression(), !1976)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2078
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2079
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 %xor57, !2042, !DIExpression(), !1976)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2080
    #dbg_value(i64 %xor203, !1994, !DIExpression(), !1976)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2081
    #dbg_value(i64 %xor206, !2035, !DIExpression(), !1976)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2082
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2083
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2084
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2085
    #dbg_value(i64 %xor31, !2035, !DIExpression(), !1976)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2086
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2087
    #dbg_value(i64 %xor45, !2039, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2088
    #dbg_value(i64 %xor211, !2008, !DIExpression(), !1976)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2089
    #dbg_value(i64 %xor214, !2037, !DIExpression(), !1976)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2090
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2091
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2092
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2093
    #dbg_value(i64 %xor39, !2037, !DIExpression(), !1976)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2094
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2095
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2096
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2097
    #dbg_value(i64 %xor27, !2034, !DIExpression(), !1976)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2098
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2099
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 %xor61, !2043, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2100
    #dbg_value(i64 %xor207, !2006, !DIExpression(), !1976)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2101
    #dbg_value(i64 %xor210, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not222 = xor i64 %xor210, -1, !dbg !2102
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and223 = and i64 %xor214, %not222, !dbg !2103
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor224 = xor i64 %xor206, %and223, !dbg !2104
    #dbg_value(i64 %xor224, !2065, !DIExpression(), !1976)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2105
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2106
    #dbg_value(i64 %xor53, !2041, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2107
    #dbg_value(i64 %xor67, !2002, !DIExpression(), !1976)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2108
    #dbg_value(i64 %xor70, !2036, !DIExpression(), !1976)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2109
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2110
    #dbg_value(i64 %xor49, !2040, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2111
    #dbg_value(i64 %xor63, !1990, !DIExpression(), !1976)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2112
    #dbg_value(i64 %xor66, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not = xor i64 %xor66, -1, !dbg !2113
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and = and i64 %xor70, %not, !dbg !2114
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2115
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2115
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %26 = xor i64 %and, %25, !dbg !2116
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2117
    #dbg_value(i64 %xor62, !1978, !DIExpression(), !1976)
    #dbg_value(i64 %xor62, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor81 = xor i64 %26, %xor62, !dbg !2116
    #dbg_value(i64 %xor81, !2044, !DIExpression(), !1976)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2118
    #dbg_value(i64 %xor94, !1984, !DIExpression(), !1976)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2119
    #dbg_value(i64 %xor97, !2034, !DIExpression(), !1976)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2120
    #dbg_value(i64 %xor102, !1998, !DIExpression(), !1976)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2121
    #dbg_value(i64 %xor105, !2036, !DIExpression(), !1976)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2122
    #dbg_value(i64 %xor98, !1996, !DIExpression(), !1976)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2123
    #dbg_value(i64 %xor101, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not114 = xor i64 %xor101, -1, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and115 = and i64 %xor105, %not114, !dbg !2125
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor116 = xor i64 %xor97, %and115, !dbg !2126
    #dbg_value(i64 %xor116, !2049, !DIExpression(), !1976)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2127
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2128
    #dbg_value(i64 %xor129, !1980, !DIExpression(), !1976)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2129
    #dbg_value(i64 %xor132, !2034, !DIExpression(), !1976)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2130
    #dbg_value(i64 %xor137, !2004, !DIExpression(), !1976)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2131
    #dbg_value(i64 %xor140, !2036, !DIExpression(), !1976)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2132
    #dbg_value(i64 %xor133, !1992, !DIExpression(), !1976)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2133
    #dbg_value(i64 %xor136, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not149 = xor i64 %xor136, -1, !dbg !2134
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and150 = and i64 %xor140, %not149, !dbg !2135
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor151 = xor i64 %xor132, %and150, !dbg !2136
    #dbg_value(i64 %xor151, !2054, !DIExpression(), !1976)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2137
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2138
    #dbg_value(i64 %xor164, !1986, !DIExpression(), !1976)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2139
    #dbg_value(i64 %xor167, !2034, !DIExpression(), !1976)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2140
    #dbg_value(i64 %xor172, !2000, !DIExpression(), !1976)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2141
    #dbg_value(i64 %xor175, !2036, !DIExpression(), !1976)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2142
    #dbg_value(i64 %xor168, !1988, !DIExpression(), !1976)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2143
    #dbg_value(i64 %xor171, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not184 = xor i64 %xor171, -1, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and185 = and i64 %xor175, %not184, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor186 = xor i64 %xor167, %and185, !dbg !2146
    #dbg_value(i64 %xor186, !2059, !DIExpression(), !1976)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2147
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2148
    #dbg_value(i64 %xor199, !1982, !DIExpression(), !1976)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2149
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not219 = xor i64 %xor206, -1, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and220 = and i64 %xor210, %not219, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor221 = xor i64 %xor202, %and220, !dbg !2152
    #dbg_value(i64 %xor221, !2064, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2153
    #dbg_value(i64 %xor237, !2034, !DIExpression(), !1976)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2154
    #dbg_value(i64 %xor75, !2026, !DIExpression(), !1976)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2155
    #dbg_value(i64 %xor78, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2156
    #dbg_value(i64 %xor71, !2014, !DIExpression(), !1976)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2157
    #dbg_value(i64 %xor74, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not85 = xor i64 %xor74, -1, !dbg !2158
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and86 = and i64 %xor78, %not85, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor87 = xor i64 %xor70, %and86, !dbg !2160
    #dbg_value(i64 %xor87, !2046, !DIExpression(), !1976)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2161
    #dbg_value(i64 %xor110, !2022, !DIExpression(), !1976)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2162
    #dbg_value(i64 %xor113, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2163
    #dbg_value(i64 %xor106, !2010, !DIExpression(), !1976)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2164
    #dbg_value(i64 %xor109, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not120 = xor i64 %xor109, -1, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and121 = and i64 %xor113, %not120, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor122 = xor i64 %xor105, %and121, !dbg !2167
    #dbg_value(i64 %xor122, !2051, !DIExpression(), !1976)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2168
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2169
    #dbg_value(i64 %xor145, !2018, !DIExpression(), !1976)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2170
    #dbg_value(i64 %xor148, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2171
    #dbg_value(i64 %xor141, !2016, !DIExpression(), !1976)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2172
    #dbg_value(i64 %xor144, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not155 = xor i64 %xor144, -1, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and156 = and i64 %xor148, %not155, !dbg !2174
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor157 = xor i64 %xor140, %and156, !dbg !2175
    #dbg_value(i64 %xor157, !2056, !DIExpression(), !1976)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2176
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2177
    #dbg_value(i64 %xor180, !2024, !DIExpression(), !1976)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2178
    #dbg_value(i64 %xor183, !2038, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2179
    #dbg_value(i64 %xor176, !2012, !DIExpression(), !1976)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2180
    #dbg_value(i64 %xor179, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %not190 = xor i64 %xor179, -1, !dbg !2181
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and191 = and i64 %xor183, %not190, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor192 = xor i64 %xor175, %and191, !dbg !2183
    #dbg_value(i64 %xor192, !2061, !DIExpression(), !1976)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2184
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2185
    #dbg_value(i64 %xor215, !2020, !DIExpression(), !1976)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2186
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not225 = xor i64 %xor214, -1, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and226 = and i64 %xor218, %not225, !dbg !2188
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor227 = xor i64 %xor210, %and226, !dbg !2189
    #dbg_value(i64 %xor227, !2066, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2190
    #dbg_value(i64 %xor245, !2036, !DIExpression(), !1976)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2191
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 %xor261, !2040, !DIExpression(), !1976)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2193
    #dbg_value(i64 %xor429, !2065, !DIExpression(), !1976)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2194
    #dbg_value(i64 %xor432, !2038, !DIExpression(), !1976)
  %not123 = xor i64 %xor113, -1, !dbg !2195
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and124 = and i64 %xor97, %not123, !dbg !2196
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor125 = xor i64 %xor109, %and124, !dbg !2197
    #dbg_value(i64 %xor125, !2052, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not91 = xor i64 %xor62, -1, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and92 = and i64 %xor66, %not91, !dbg !2199
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor93 = xor i64 %xor78, %and92, !dbg !2200
    #dbg_value(i64 %xor93, !2048, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not126 = xor i64 %xor97, -1, !dbg !2201
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and127 = and i64 %xor101, %not126, !dbg !2202
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor128 = xor i64 %xor113, %and127, !dbg !2203
    #dbg_value(i64 %xor128, !2053, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2204
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not161 = xor i64 %xor132, -1, !dbg !2205
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and162 = and i64 %xor136, %not161, !dbg !2206
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor163 = xor i64 %xor148, %and162, !dbg !2207
    #dbg_value(i64 %xor163, !2058, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2208
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not196 = xor i64 %xor167, -1, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and197 = and i64 %xor171, %not196, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor198 = xor i64 %xor183, %and197, !dbg !2211
    #dbg_value(i64 %xor198, !2063, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2212
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not231 = xor i64 %xor202, -1, !dbg !2213
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %and232 = and i64 %xor206, %not231, !dbg !2214
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor233 = xor i64 %xor218, %and232, !dbg !2215
    #dbg_value(i64 %xor233, !2068, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2216
    #dbg_value(i64 %xor253, !2038, !DIExpression(), !1976)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2217
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 %xor269, !2042, !DIExpression(), !1976)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2219
    #dbg_value(i64 %xor417, !2052, !DIExpression(), !1976)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2220
    #dbg_value(i64 %xor420, !2035, !DIExpression(), !1976)
  %not82 = xor i64 %xor70, -1, !dbg !2221
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and83 = and i64 %xor74, %not82, !dbg !2222
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor84 = xor i64 %xor66, %and83, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %not117 = xor i64 %xor105, -1, !dbg !2224
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and118 = and i64 %xor109, %not117, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor119 = xor i64 %xor101, %and118, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2227
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %not152 = xor i64 %xor140, -1, !dbg !2228
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and153 = and i64 %xor144, %not152, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor154 = xor i64 %xor136, %and153, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2231
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %not187 = xor i64 %xor175, -1, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and188 = and i64 %xor179, %not187, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor189 = xor i64 %xor171, %and188, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2235
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2236
    #dbg_value(i64 %xor241, !2035, !DIExpression(), !1976)
  %not88 = xor i64 %xor78, -1, !dbg !2237
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and89 = and i64 %xor62, %not88, !dbg !2238
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor90 = xor i64 %xor74, %and89, !dbg !2239
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2240
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not158 = xor i64 %xor148, -1, !dbg !2241
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and159 = and i64 %xor132, %not158, !dbg !2242
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor160 = xor i64 %xor144, %and159, !dbg !2243
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2244
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not193 = xor i64 %xor183, -1, !dbg !2245
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and194 = and i64 %xor167, %not193, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor195 = xor i64 %xor179, %and194, !dbg !2247
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2248
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %not228 = xor i64 %xor218, -1, !dbg !2249
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and229 = and i64 %xor202, %not228, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor230 = xor i64 %xor214, %and229, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2252
    #dbg_value(i64 %xor249, !2037, !DIExpression(), !1976)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2253
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2254
    #dbg_value(i64 %xor265, !2041, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2255
    #dbg_value(i64 %xor413, !2046, !DIExpression(), !1976)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2256
    #dbg_value(i64 %xor416, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not445 = xor i64 %xor416, -1, !dbg !2257
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and446 = and i64 %xor420, %not445, !dbg !2258
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor447 = xor i64 %xor432, %and446, !dbg !2259
    #dbg_value(i64 %xor447, !2026, !DIExpression(), !1976)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2260
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2261
    #dbg_value(i64 %xor257, !2039, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2262
    #dbg_value(i64 %xor425, !2059, !DIExpression(), !1976)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2263
    #dbg_value(i64 %xor428, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not442 = xor i64 %xor432, -1, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and443 = and i64 %xor416, %not442, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor444 = xor i64 %xor428, %and443, !dbg !2266
    #dbg_value(i64 %xor444, !2024, !DIExpression(), !1976)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2267
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(i64 %xor273, !2043, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2269
    #dbg_value(i64 %xor421, !2058, !DIExpression(), !1976)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2270
    #dbg_value(i64 %xor424, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not439 = xor i64 %xor428, -1, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and440 = and i64 %xor432, %not439, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor441 = xor i64 %xor424, %and440, !dbg !2273
    #dbg_value(i64 %xor441, !2022, !DIExpression(), !1976)
  %not436 = xor i64 %xor424, -1, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and437 = and i64 %xor428, %not436, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor438 = xor i64 %xor420, %and437, !dbg !2276
    #dbg_value(i64 %xor438, !2020, !DIExpression(), !1976)
  %not433 = xor i64 %xor420, -1, !dbg !2277
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and434 = and i64 %xor424, %not433, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor435 = xor i64 %xor416, %and434, !dbg !2279
    #dbg_value(i64 %xor435, !2018, !DIExpression(), !1976)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2280
    #dbg_value(i64 %xor394, !2067, !DIExpression(), !1976)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2281
    #dbg_value(i64 %xor397, !2038, !DIExpression(), !1976)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2282
    #dbg_value(i64 %xor382, !2049, !DIExpression(), !1976)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2283
    #dbg_value(i64 %xor385, !2035, !DIExpression(), !1976)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2284
    #dbg_value(i64 %xor378, !2048, !DIExpression(), !1976)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2285
    #dbg_value(i64 %xor381, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not410 = xor i64 %xor381, -1, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and411 = and i64 %xor385, %not410, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor412 = xor i64 %xor397, %and411, !dbg !2288
    #dbg_value(i64 %xor412, !2016, !DIExpression(), !1976)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2289
    #dbg_value(i64 %xor390, !2061, !DIExpression(), !1976)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2290
    #dbg_value(i64 %xor393, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not407 = xor i64 %xor397, -1, !dbg !2291
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and408 = and i64 %xor381, %not407, !dbg !2292
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor409 = xor i64 %xor393, %and408, !dbg !2293
    #dbg_value(i64 %xor409, !2014, !DIExpression(), !1976)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2294
    #dbg_value(i64 %xor386, !2055, !DIExpression(), !1976)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2295
    #dbg_value(i64 %xor389, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not404 = xor i64 %xor393, -1, !dbg !2296
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and405 = and i64 %xor397, %not404, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor406 = xor i64 %xor389, %and405, !dbg !2298
    #dbg_value(i64 %xor406, !2012, !DIExpression(), !1976)
  %not401 = xor i64 %xor389, -1, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and402 = and i64 %xor393, %not401, !dbg !2300
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor403 = xor i64 %xor385, %and402, !dbg !2301
    #dbg_value(i64 %xor403, !2010, !DIExpression(), !1976)
  %not398 = xor i64 %xor385, -1, !dbg !2302
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and399 = and i64 %xor389, %not398, !dbg !2303
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor400 = xor i64 %xor381, %and399, !dbg !2304
    #dbg_value(i64 %xor400, !2008, !DIExpression(), !1976)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2305
    #dbg_value(i64 %xor359, !2064, !DIExpression(), !1976)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2306
    #dbg_value(i64 %xor362, !2038, !DIExpression(), !1976)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2307
    #dbg_value(i64 %xor347, !2051, !DIExpression(), !1976)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2308
    #dbg_value(i64 %xor350, !2035, !DIExpression(), !1976)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2309
    #dbg_value(i64 %xor343, !2045, !DIExpression(), !1976)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2310
    #dbg_value(i64 %xor346, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not375 = xor i64 %xor346, -1, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and376 = and i64 %xor350, %not375, !dbg !2312
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor377 = xor i64 %xor362, %and376, !dbg !2313
    #dbg_value(i64 %xor377, !2006, !DIExpression(), !1976)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2314
    #dbg_value(i64 %xor355, !2063, !DIExpression(), !1976)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2315
    #dbg_value(i64 %xor358, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not372 = xor i64 %xor362, -1, !dbg !2316
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and373 = and i64 %xor346, %not372, !dbg !2317
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor374 = xor i64 %xor358, %and373, !dbg !2318
    #dbg_value(i64 %xor374, !2004, !DIExpression(), !1976)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2319
    #dbg_value(i64 %xor351, !2057, !DIExpression(), !1976)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2320
    #dbg_value(i64 %xor354, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not369 = xor i64 %xor358, -1, !dbg !2321
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and370 = and i64 %xor362, %not369, !dbg !2322
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor371 = xor i64 %xor354, %and370, !dbg !2323
    #dbg_value(i64 %xor371, !2002, !DIExpression(), !1976)
  %not366 = xor i64 %xor354, -1, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and367 = and i64 %xor358, %not366, !dbg !2325
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor368 = xor i64 %xor350, %and367, !dbg !2326
    #dbg_value(i64 %xor368, !2000, !DIExpression(), !1976)
  %not363 = xor i64 %xor350, -1, !dbg !2327
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and364 = and i64 %xor354, %not363, !dbg !2328
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor365 = xor i64 %xor346, %and364, !dbg !2329
    #dbg_value(i64 %xor365, !1998, !DIExpression(), !1976)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2330
    #dbg_value(i64 %xor324, !2066, !DIExpression(), !1976)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2331
    #dbg_value(i64 %xor327, !2038, !DIExpression(), !1976)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2332
    #dbg_value(i64 %xor312, !2053, !DIExpression(), !1976)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2333
    #dbg_value(i64 %xor315, !2035, !DIExpression(), !1976)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2334
    #dbg_value(i64 %xor308, !2047, !DIExpression(), !1976)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2335
    #dbg_value(i64 %xor311, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not340 = xor i64 %xor311, -1, !dbg !2336
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and341 = and i64 %xor315, %not340, !dbg !2337
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor342 = xor i64 %xor327, %and341, !dbg !2338
    #dbg_value(i64 %xor342, !1996, !DIExpression(), !1976)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2339
    #dbg_value(i64 %xor320, !2060, !DIExpression(), !1976)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2340
    #dbg_value(i64 %xor323, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not337 = xor i64 %xor327, -1, !dbg !2341
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and338 = and i64 %xor311, %not337, !dbg !2342
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor339 = xor i64 %xor323, %and338, !dbg !2343
    #dbg_value(i64 %xor339, !1994, !DIExpression(), !1976)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2344
    #dbg_value(i64 %xor316, !2054, !DIExpression(), !1976)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2345
    #dbg_value(i64 %xor319, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not334 = xor i64 %xor323, -1, !dbg !2346
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and335 = and i64 %xor327, %not334, !dbg !2347
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor336 = xor i64 %xor319, %and335, !dbg !2348
    #dbg_value(i64 %xor336, !1992, !DIExpression(), !1976)
  %not331 = xor i64 %xor319, -1, !dbg !2349
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and332 = and i64 %xor323, %not331, !dbg !2350
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor333 = xor i64 %xor315, %and332, !dbg !2351
    #dbg_value(i64 %xor333, !1990, !DIExpression(), !1976)
  %not328 = xor i64 %xor315, -1, !dbg !2352
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and329 = and i64 %xor319, %not328, !dbg !2353
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor330 = xor i64 %xor311, %and329, !dbg !2354
    #dbg_value(i64 %xor330, !1988, !DIExpression(), !1976)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2355
    #dbg_value(i64 %xor287, !2068, !DIExpression(), !1976)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2356
    #dbg_value(i64 %xor290, !2038, !DIExpression(), !1976)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2357
    #dbg_value(i64 %xor275, !2050, !DIExpression(), !1976)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2358
    #dbg_value(i64 %xor278, !2035, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2359
    #dbg_value(i64 %xor274, !2044, !DIExpression(), !1976)
    #dbg_value(i64 %xor274, !2034, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not305 = xor i64 %xor274, -1, !dbg !2360
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and306 = and i64 %xor278, %not305, !dbg !2361
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor307 = xor i64 %xor290, %and306, !dbg !2362
    #dbg_value(i64 %xor307, !1986, !DIExpression(), !1976)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2363
    #dbg_value(i64 %xor283, !2062, !DIExpression(), !1976)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2364
    #dbg_value(i64 %xor286, !2037, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not302 = xor i64 %xor290, -1, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and303 = and i64 %xor274, %not302, !dbg !2366
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor304 = xor i64 %xor286, %and303, !dbg !2367
    #dbg_value(i64 %xor304, !1984, !DIExpression(), !1976)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2368
    #dbg_value(i64 %xor279, !2056, !DIExpression(), !1976)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2369
    #dbg_value(i64 %xor282, !2036, !DIExpression(), !1976)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %not299 = xor i64 %xor286, -1, !dbg !2370
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and300 = and i64 %xor290, %not299, !dbg !2371
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor301 = xor i64 %xor282, %and300, !dbg !2372
    #dbg_value(i64 %xor301, !1982, !DIExpression(), !1976)
  %not296 = xor i64 %xor282, -1, !dbg !2373
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1976)
  %and297 = and i64 %xor286, %not296, !dbg !2374
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %xor298 = xor i64 %xor278, %and297, !dbg !2375
    #dbg_value(i64 %xor298, !1980, !DIExpression(), !1976)
  %add = or disjoint i32 %round.0, 1, !dbg !2376
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2377
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2377
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %not291 = xor i64 %xor278, -1, !dbg !2378
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %and292 = and i64 %xor282, %not291, !dbg !2379
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1976)
  %28 = xor i64 %and292, %27, !dbg !2380
  %xor295 = xor i64 %28, %xor274, !dbg !2380
    #dbg_value(i64 %xor295, !1978, !DIExpression(), !1976)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2381
    #dbg_value(i32 %add448, !2027, !DIExpression(), !1976)
  br label %for.cond, !dbg !2382, !llvm.loop !2383

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1976
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1976
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1976
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1976
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1976
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1976
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1976
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1976
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1976
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1976
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1976
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1976
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1976
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1976
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1976
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1976
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1976
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1976
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1976
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1976
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1976
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1976
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1976
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1976
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1976
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2385
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2386
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2387
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2388
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2389
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2390
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2391
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2392
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2393
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2394
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2395
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2396
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2397
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2398
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2399
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2400
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2401
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2402
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2403
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2404
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2405
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2406
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2407
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2408
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2409
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2410
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2411
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2412
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2413
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2414
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2415
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2416
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2417
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2418
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2419
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2420
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2421
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2422
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2423
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2424
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2425
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2426
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2427
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2428
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2429
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2430
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2431
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2432
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2433
  ret void, !dbg !2434
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2435 {
entry:
    #dbg_value(ptr %state, !2436, !DIExpression(), !2437)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2438
  %0 = load i32, ptr %pos, align 8, !dbg !2438
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2439
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2440
  store i32 168, ptr %pos1, align 8, !dbg !2441
  ret void, !dbg !2442
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2443 {
entry:
    #dbg_value(ptr %s, !2446, !DIExpression(), !2447)
    #dbg_value(i32 %pos, !2448, !DIExpression(), !2447)
    #dbg_value(i32 %r, !2449, !DIExpression(), !2447)
    #dbg_value(i8 %p, !2450, !DIExpression(), !2447)
  %conv = zext i8 %p to i64, !dbg !2451
  %rem = shl i32 %pos, 3, !dbg !2452
  %mul = and i32 %rem, 56, !dbg !2452
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2453
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2453
  %div2 = lshr i32 %pos, 3, !dbg !2454
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2455
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2456
  %xor = xor i64 %0, %shl, !dbg !2456
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2456
  %div13 = lshr i32 %r, 3, !dbg !2457
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2458
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2458
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2459
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2459
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2459
  ret void, !dbg !2460
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2461 {
entry:
    #dbg_value(ptr %out, !2464, !DIExpression(), !2465)
    #dbg_value(i32 %outlen, !2466, !DIExpression(), !2465)
    #dbg_value(ptr %state, !2467, !DIExpression(), !2465)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2468
  %0 = load i32, ptr %pos, align 8, !dbg !2468
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 168) #3, !dbg !2469
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2470
  store i32 %call, ptr %pos1, align 8, !dbg !2471
  ret void, !dbg !2472
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) unnamed_addr #0 !dbg !2473 {
entry:
    #dbg_value(ptr %out, !2476, !DIExpression(), !2477)
    #dbg_value(i32 %outlen, !2478, !DIExpression(), !2477)
    #dbg_value(ptr %s, !2479, !DIExpression(), !2477)
    #dbg_value(i32 %pos, !2480, !DIExpression(), !2477)
    #dbg_value(i32 %r, !2481, !DIExpression(), !2477)
  br label %while.cond, !dbg !2482

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2476, !DIExpression(), !2477)
    #dbg_value(i32 %outlen.addr.0, !2478, !DIExpression(), !2477)
    #dbg_value(i32 %pos.addr.0, !2480, !DIExpression(), !2477)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2482
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2482

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2483
  br i1 %cmp, label %if.then, label %if.end, !dbg !2483

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2486
    #dbg_value(i32 0, !2480, !DIExpression(), !2477)
  br label %if.end, !dbg !2488

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2480, !DIExpression(), !2477)
    #dbg_value(i32 %pos.addr.1, !2489, !DIExpression(), !2477)
  br label %for.cond, !dbg !2490

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2492
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2476, !DIExpression(), !2477)
    #dbg_value(i32 %i.0, !2489, !DIExpression(), !2477)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2493
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2495
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2495
  %0 = and i1 %cmp1, %cmp2, !dbg !2495
  br i1 %0, label %for.body, label %for.end, !dbg !2496

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2497
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2498
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2498
  %rem = shl i32 %i.0, 3, !dbg !2499
  %mul = and i32 %rem, 56, !dbg !2499
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2500
  %shr = lshr i64 %1, %sh_prom, !dbg !2500
  %conv = trunc i64 %shr to i8, !dbg !2498
    #dbg_value(ptr %out.addr.1, !2476, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2477)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2501
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2502
    #dbg_value(ptr %incdec.ptr, !2476, !DIExpression(), !2477)
  %inc = add nuw i32 %i.0, 1, !dbg !2503
    #dbg_value(i32 %inc, !2489, !DIExpression(), !2477)
  br label %for.cond, !dbg !2504, !llvm.loop !2505

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2492
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2507
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2508
    #dbg_value(i32 %sub3, !2478, !DIExpression(), !2477)
    #dbg_value(i32 %i.0.lcssa, !2480, !DIExpression(), !2477)
  br label %while.cond, !dbg !2482, !llvm.loop !2509

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2511
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2512 {
entry:
    #dbg_value(ptr %state, !2513, !DIExpression(), !2514)
    #dbg_value(ptr %in, !2515, !DIExpression(), !2514)
    #dbg_value(i32 %inlen, !2516, !DIExpression(), !2514)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2517
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2518
  store i32 168, ptr %pos, align 8, !dbg !2519
  ret void, !dbg !2520
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2521 {
entry:
    #dbg_value(ptr %s, !2524, !DIExpression(), !2525)
    #dbg_value(i32 %r, !2526, !DIExpression(), !2525)
    #dbg_value(ptr %in, !2527, !DIExpression(), !2525)
    #dbg_value(i32 %inlen, !2528, !DIExpression(), !2525)
    #dbg_value(i8 %p, !2529, !DIExpression(), !2525)
    #dbg_value(i32 0, !2530, !DIExpression(), !2525)
  br label %for.cond, !dbg !2531

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2533
    #dbg_value(i32 %i.0, !2530, !DIExpression(), !2525)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2534
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2536

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2537
  br label %while.cond, !dbg !2537

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2538
  store i64 0, ptr %arrayidx, align 8, !dbg !2539
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2540
    #dbg_value(i32 %inc, !2530, !DIExpression(), !2525)
  br label %for.cond, !dbg !2541, !llvm.loop !2542

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2528, !DIExpression(), !2525)
    #dbg_value(ptr %in.addr.0, !2527, !DIExpression(), !2525)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2544
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2537

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2545

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2548

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2550
    #dbg_value(i32 %i.1, !2530, !DIExpression(), !2525)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2551
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2545

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !2553
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2554
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2555
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2556
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2557
  %xor = xor i64 %1, %call, !dbg !2557
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2557
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2558
    #dbg_value(i32 %inc7, !2530, !DIExpression(), !2525)
  br label %for.cond2, !dbg !2559, !llvm.loop !2560

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2562
    #dbg_value(ptr %add.ptr9, !2527, !DIExpression(), !2525)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2563
    #dbg_value(i32 %sub, !2528, !DIExpression(), !2525)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2564
  br label %while.cond, !dbg !2537, !llvm.loop !2565

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2567
    #dbg_value(i32 %i.2, !2530, !DIExpression(), !2525)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2568
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2548

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2570
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2570
  %conv = zext i8 %2 to i64, !dbg !2571
  %rem = shl i32 %i.2, 3, !dbg !2572
  %mul14 = and i32 %rem, 56, !dbg !2572
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2573
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2573
  %div153 = lshr i32 %i.2, 3, !dbg !2574
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2575
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2576
  %xor17 = xor i64 %3, %shl, !dbg !2576
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2576
  %inc19 = add i32 %i.2, 1, !dbg !2577
    #dbg_value(i32 %inc19, !2530, !DIExpression(), !2525)
  br label %for.cond10, !dbg !2578, !llvm.loop !2579

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2567
  %conv21 = zext i8 %p to i64, !dbg !2581
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2582
  %mul23 = and i32 %rem22, 56, !dbg !2582
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2583
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !2583
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2584
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2585
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2586
  %xor28 = xor i64 %4, %shl25, !dbg !2586
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2586
  %sub29 = add i32 %r, -1, !dbg !2587
  %div302 = lshr i32 %sub29, 3, !dbg !2588
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2589
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2590
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2590
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2590
  ret void, !dbg !2591
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2592 {
entry:
    #dbg_value(ptr %x, !2595, !DIExpression(), !2596)
    #dbg_value(i64 0, !2597, !DIExpression(), !2596)
    #dbg_value(i32 0, !2598, !DIExpression(), !2596)
  br label %for.cond, !dbg !2599

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2601
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2596
    #dbg_value(i64 %r.0, !2597, !DIExpression(), !2596)
    #dbg_value(i32 %i.0, !2598, !DIExpression(), !2596)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2602
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2604

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2596)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2605
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2605
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2596)
  %conv = zext i8 %0 to i64, !dbg !2606
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2596)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2607
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2596)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2608
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2596)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2608
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2597, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2596)
  %or = or i64 %r.0, %shl, !dbg !2609
    #dbg_value(i64 %or, !2597, !DIExpression(), !2596)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2610
    #dbg_value(i32 %inc, !2598, !DIExpression(), !2596)
  br label %for.cond, !dbg !2611, !llvm.loop !2612

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2596
  ret i64 %r.0.lcssa, !dbg !2614
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2615 {
entry:
    #dbg_value(ptr %out, !2616, !DIExpression(), !2617)
    #dbg_value(i32 %nblocks, !2618, !DIExpression(), !2617)
    #dbg_value(ptr %state, !2619, !DIExpression(), !2617)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2620
  ret void, !dbg !2621
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) unnamed_addr #0 !dbg !2622 {
entry:
    #dbg_value(ptr %out, !2625, !DIExpression(), !2626)
    #dbg_value(i32 %nblocks, !2627, !DIExpression(), !2626)
    #dbg_value(ptr %s, !2628, !DIExpression(), !2626)
    #dbg_value(i32 %r, !2629, !DIExpression(), !2626)
  %0 = lshr i32 %r, 3, !dbg !2630
  br label %while.cond, !dbg !2630

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2625, !DIExpression(), !2626)
    #dbg_value(i32 %nblocks.addr.0, !2627, !DIExpression(), !2626)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2630
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2630

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2631
    #dbg_value(i32 0, !2633, !DIExpression(), !2626)
  br label %for.cond, !dbg !2634

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2636
    #dbg_value(i32 %i.0, !2633, !DIExpression(), !2626)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2637
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2639

for.body:                                         ; preds = %for.cond
  %mul = shl nuw i32 %i.0, 3, !dbg !2640
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2641
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2642
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2642
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2643
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2644
    #dbg_value(i32 %inc, !2633, !DIExpression(), !2626)
  br label %for.cond, !dbg !2645, !llvm.loop !2646

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2648
    #dbg_value(ptr %add.ptr1, !2625, !DIExpression(), !2626)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2649
    #dbg_value(i32 %sub, !2627, !DIExpression(), !2626)
  br label %while.cond, !dbg !2630, !llvm.loop !2650

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2652
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2653 {
entry:
    #dbg_value(ptr %x, !2656, !DIExpression(), !2657)
    #dbg_value(i64 %u, !2658, !DIExpression(), !2657)
    #dbg_value(i32 0, !2659, !DIExpression(), !2657)
  br label %for.cond, !dbg !2660

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2662
    #dbg_value(i32 %i.0, !2659, !DIExpression(), !2657)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2663
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2665

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2666
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2667
  %shr = lshr i64 %u, %sh_prom, !dbg !2667
  %conv = trunc i64 %shr to i8, !dbg !2668
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2669
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2670
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2671
    #dbg_value(i32 %inc, !2659, !DIExpression(), !2657)
  br label %for.cond, !dbg !2672, !llvm.loop !2673

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2675
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2676 {
entry:
    #dbg_value(ptr %state, !2677, !DIExpression(), !2678)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2679
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2680
  store i32 0, ptr %pos, align 8, !dbg !2681
  ret void, !dbg !2682
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2683 {
entry:
    #dbg_value(ptr %state, !2684, !DIExpression(), !2685)
    #dbg_value(ptr %in, !2686, !DIExpression(), !2685)
    #dbg_value(i32 %inlen, !2687, !DIExpression(), !2685)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2688
  %0 = load i32, ptr %pos, align 8, !dbg !2688
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2689
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2690
  store i32 %call, ptr %pos1, align 8, !dbg !2691
  ret void, !dbg !2692
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2693 {
entry:
    #dbg_value(ptr %state, !2694, !DIExpression(), !2695)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2696
  %0 = load i32, ptr %pos, align 8, !dbg !2696
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2697
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2698
  store i32 136, ptr %pos1, align 8, !dbg !2699
  ret void, !dbg !2700
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2701 {
entry:
    #dbg_value(ptr %out, !2702, !DIExpression(), !2703)
    #dbg_value(i32 %outlen, !2704, !DIExpression(), !2703)
    #dbg_value(ptr %state, !2705, !DIExpression(), !2703)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2706
  %0 = load i32, ptr %pos, align 8, !dbg !2706
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 136) #3, !dbg !2707
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2708
  store i32 %call, ptr %pos1, align 8, !dbg !2709
  ret void, !dbg !2710
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2711 {
entry:
    #dbg_value(ptr %state, !2712, !DIExpression(), !2713)
    #dbg_value(ptr %in, !2714, !DIExpression(), !2713)
    #dbg_value(i32 %inlen, !2715, !DIExpression(), !2713)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2716
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2717
  store i32 136, ptr %pos, align 8, !dbg !2718
  ret void, !dbg !2719
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2720 {
entry:
    #dbg_value(ptr %out, !2721, !DIExpression(), !2722)
    #dbg_value(i32 %nblocks, !2723, !DIExpression(), !2722)
    #dbg_value(ptr %state, !2724, !DIExpression(), !2722)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2725
  ret void, !dbg !2726
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2727 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2730, !DIExpression(), !2731)
    #dbg_value(i32 %outlen, !2732, !DIExpression(), !2731)
    #dbg_value(ptr %in, !2733, !DIExpression(), !2731)
    #dbg_value(i32 %inlen, !2734, !DIExpression(), !2731)
    #dbg_declare(ptr %state, !2735, !DIExpression(), !2736)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2737
  %div = udiv i32 %outlen, 168, !dbg !2738
    #dbg_value(i32 %div, !2739, !DIExpression(), !2731)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2740
  %mul.neg = mul i32 %div, -168, !dbg !2741
  %sub = add i32 %mul.neg, %outlen, !dbg !2742
    #dbg_value(i32 %sub, !2732, !DIExpression(), !2731)
  %mul1 = mul nuw i32 %div, 168, !dbg !2743
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2744
    #dbg_value(ptr %add.ptr, !2730, !DIExpression(), !2731)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2745
  ret void, !dbg !2746
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2747 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2748, !DIExpression(), !2749)
    #dbg_value(i32 %outlen, !2750, !DIExpression(), !2749)
    #dbg_value(ptr %in, !2751, !DIExpression(), !2749)
    #dbg_value(i32 %inlen, !2752, !DIExpression(), !2749)
    #dbg_declare(ptr %state, !2753, !DIExpression(), !2754)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2755
  %div = udiv i32 %outlen, 136, !dbg !2756
    #dbg_value(i32 %div, !2757, !DIExpression(), !2749)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2758
  %mul.neg = mul i32 %div, -136, !dbg !2759
  %sub = add i32 %mul.neg, %outlen, !dbg !2760
    #dbg_value(i32 %sub, !2750, !DIExpression(), !2749)
  %mul1 = mul nuw i32 %div, 136, !dbg !2761
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2762
    #dbg_value(ptr %add.ptr, !2748, !DIExpression(), !2749)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2763
  ret void, !dbg !2764
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2765 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2768, !DIExpression(), !2769)
    #dbg_value(ptr %in, !2770, !DIExpression(), !2769)
    #dbg_value(i32 %inlen, !2771, !DIExpression(), !2769)
    #dbg_declare(ptr %s, !2772, !DIExpression(), !2773)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2774
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2775
    #dbg_value(i32 0, !2776, !DIExpression(), !2769)
  br label %for.cond, !dbg !2777

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2779
    #dbg_value(i32 %i.0, !2776, !DIExpression(), !2769)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2780
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2782

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2783
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2784
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2785
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2785
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2786
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2787
    #dbg_value(i32 %inc, !2776, !DIExpression(), !2769)
  br label %for.cond, !dbg !2788, !llvm.loop !2789

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2791
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2792 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2793, !DIExpression(), !2794)
    #dbg_value(ptr %in, !2795, !DIExpression(), !2794)
    #dbg_value(i32 %inlen, !2796, !DIExpression(), !2794)
    #dbg_declare(ptr %s, !2797, !DIExpression(), !2798)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2799
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2800
    #dbg_value(i32 0, !2801, !DIExpression(), !2794)
  br label %for.cond, !dbg !2802

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2804
    #dbg_value(i32 %i.0, !2801, !DIExpression(), !2794)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2805
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2807

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2808
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2809
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2810
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2810
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2811
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2812
    #dbg_value(i32 %inc, !2801, !DIExpression(), !2794)
  br label %for.cond, !dbg !2813, !llvm.loop !2814

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2816
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2817 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2827, !DIExpression(), !2828)
    #dbg_value(ptr %seed, !2829, !DIExpression(), !2828)
    #dbg_value(i8 %x, !2830, !DIExpression(), !2828)
    #dbg_value(i8 %y, !2831, !DIExpression(), !2828)
    #dbg_declare(ptr %extseed, !2832, !DIExpression(), !2836)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2837
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2838
  store i8 %x, ptr %arrayidx, align 1, !dbg !2839
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2840
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2841
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2842
  ret void, !dbg !2843
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2844 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2847, !DIExpression(), !2848)
    #dbg_value(i32 %outlen, !2849, !DIExpression(), !2848)
    #dbg_value(ptr %key, !2850, !DIExpression(), !2848)
    #dbg_value(i8 %nonce, !2851, !DIExpression(), !2848)
    #dbg_declare(ptr %extkey, !2852, !DIExpression(), !2856)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2857
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2858
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2859
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2860
  ret void, !dbg !2861
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2862 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2863, !DIExpression(), !2864)
    #dbg_value(ptr %key, !2865, !DIExpression(), !2864)
    #dbg_value(ptr %input, !2866, !DIExpression(), !2864)
    #dbg_declare(ptr %s, !2867, !DIExpression(), !2868)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2869
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2870
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1088) #3, !dbg !2871
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2872
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2873
  ret void, !dbg !2874
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
!272 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
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
!361 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!362 = !DISubroutineType(types: !363)
!363 = !{null, !364, !275, !50}
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !366, line: 10, baseType: !367)
!366 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !366, line: 8, size: 12288, elements: !368)
!368 = !{!369}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !367, file: !366, line: 9, baseType: !370, size: 12288)
!370 = !DICompositeType(tag: DW_TAG_array_type, baseType: !371, size: 12288, elements: !379)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !372, line: 13, baseType: !373)
!372 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!373 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !372, line: 11, size: 4096, elements: !374)
!374 = !{!375}
!375 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !373, file: !372, line: 12, baseType: !376, size: 4096)
!376 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !377)
!377 = !{!378}
!378 = !DISubrange(count: 256)
!379 = !{!380}
!380 = !DISubrange(count: 3)
!381 = !DILocalVariable(name: "a", arg: 1, scope: !360, file: !361, line: 165, type: !364)
!382 = !DILocation(line: 0, scope: !360)
!383 = !DILocalVariable(name: "seed", arg: 2, scope: !360, file: !361, line: 165, type: !275)
!384 = !DILocalVariable(name: "transposed", arg: 3, scope: !360, file: !361, line: 165, type: !50)
!385 = !DILocalVariable(name: "buf", scope: !360, file: !361, line: 169, type: !386)
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !387)
!387 = !{!388}
!388 = !DISubrange(count: 504)
!389 = !DILocation(line: 169, column: 11, scope: !360)
!390 = !DILocalVariable(name: "state", scope: !360, file: !361, line: 170, type: !391)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !392, line: 10, baseType: !393)
!392 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !394, line: 17, baseType: !395)
!394 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!395 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !394, line: 14, size: 1664, elements: !396)
!396 = !{!397, !401}
!397 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !395, file: !394, line: 15, baseType: !398, size: 1600)
!398 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !399)
!399 = !{!400}
!400 = !DISubrange(count: 25)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !395, file: !394, line: 16, baseType: !40, size: 32, offset: 1600)
!402 = !DILocation(line: 170, column: 13, scope: !360)
!403 = !DILocalVariable(name: "i", scope: !360, file: !361, line: 167, type: !40)
!404 = !DILocation(line: 172, column: 7, scope: !405)
!405 = distinct !DILexicalBlock(scope: !360, file: !361, line: 172, column: 3)
!406 = !DILocation(line: 172, scope: !405)
!407 = !DILocation(line: 172, column: 12, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !361, line: 172, column: 3)
!409 = !DILocation(line: 172, column: 3, scope: !405)
!410 = !DILocation(line: 173, column: 5, scope: !411)
!411 = distinct !DILexicalBlock(scope: !412, file: !361, line: 173, column: 5)
!412 = distinct !DILexicalBlock(scope: !408, file: !361, line: 172, column: 26)
!413 = !DILocation(line: 173, scope: !411)
!414 = !DILocalVariable(name: "j", scope: !360, file: !361, line: 167, type: !40)
!415 = !DILocation(line: 173, column: 14, scope: !416)
!416 = distinct !DILexicalBlock(scope: !411, file: !361, line: 173, column: 5)
!417 = !DILocation(line: 174, column: 10, scope: !418)
!418 = distinct !DILexicalBlock(scope: !419, file: !361, line: 174, column: 10)
!419 = distinct !DILexicalBlock(scope: !416, file: !361, line: 173, column: 28)
!420 = !DILocation(line: 175, column: 9, scope: !418)
!421 = !DILocation(line: 177, column: 9, scope: !418)
!422 = !DILocation(line: 179, column: 7, scope: !419)
!423 = !DILocalVariable(name: "buflen", scope: !360, file: !361, line: 168, type: !40)
!424 = !DILocation(line: 181, column: 25, scope: !419)
!425 = !DILocation(line: 181, column: 13, scope: !419)
!426 = !DILocalVariable(name: "ctr", scope: !360, file: !361, line: 167, type: !40)
!427 = !DILocation(line: 183, column: 7, scope: !419)
!428 = !DILocation(line: 0, scope: !419)
!429 = !DILocation(line: 183, column: 17, scope: !419)
!430 = !DILocation(line: 184, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !419, file: !361, line: 183, column: 28)
!432 = !DILocation(line: 186, column: 28, scope: !431)
!433 = !DILocation(line: 186, column: 47, scope: !431)
!434 = !DILocation(line: 186, column: 62, scope: !431)
!435 = !DILocation(line: 186, column: 16, scope: !431)
!436 = !DILocation(line: 186, column: 13, scope: !431)
!437 = distinct !{!437, !427, !438, !130}
!438 = !DILocation(line: 187, column: 7, scope: !419)
!439 = !DILocation(line: 173, column: 24, scope: !416)
!440 = !DILocation(line: 173, column: 5, scope: !416)
!441 = distinct !{!441, !410, !442, !130}
!442 = !DILocation(line: 188, column: 5, scope: !411)
!443 = !DILocation(line: 172, column: 22, scope: !408)
!444 = !DILocation(line: 172, column: 3, scope: !408)
!445 = distinct !{!445, !409, !446, !130}
!446 = !DILocation(line: 189, column: 3, scope: !405)
!447 = !DILocation(line: 190, column: 1, scope: !360)
!448 = distinct !DISubprogram(name: "rej_uniform", scope: !361, file: !361, line: 121, type: !449, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!449 = !DISubroutineType(types: !450)
!450 = !{!40, !451, !40, !275, !40}
!451 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!452 = !DILocalVariable(name: "r", arg: 1, scope: !448, file: !361, line: 121, type: !451)
!453 = !DILocation(line: 0, scope: !448)
!454 = !DILocalVariable(name: "len", arg: 2, scope: !448, file: !361, line: 122, type: !40)
!455 = !DILocalVariable(name: "buf", arg: 3, scope: !448, file: !361, line: 123, type: !275)
!456 = !DILocalVariable(name: "buflen", arg: 4, scope: !448, file: !361, line: 124, type: !40)
!457 = !DILocalVariable(name: "pos", scope: !448, file: !361, line: 126, type: !40)
!458 = !DILocalVariable(name: "ctr", scope: !448, file: !361, line: 126, type: !40)
!459 = !DILocation(line: 130, column: 3, scope: !448)
!460 = !DILocation(line: 130, column: 13, scope: !448)
!461 = !DILocation(line: 130, column: 19, scope: !448)
!462 = !DILocation(line: 131, column: 14, scope: !463)
!463 = distinct !DILexicalBlock(scope: !448, file: !361, line: 130, column: 41)
!464 = !DILocation(line: 131, column: 44, scope: !463)
!465 = !DILocation(line: 131, column: 34, scope: !463)
!466 = !DILocation(line: 131, column: 55, scope: !463)
!467 = !DILocation(line: 131, column: 62, scope: !463)
!468 = !DILocalVariable(name: "val0", scope: !448, file: !361, line: 127, type: !86)
!469 = !DILocation(line: 132, column: 14, scope: !463)
!470 = !DILocation(line: 132, column: 25, scope: !463)
!471 = !DILocation(line: 132, column: 44, scope: !463)
!472 = !DILocation(line: 132, column: 34, scope: !463)
!473 = !DILocation(line: 132, column: 55, scope: !463)
!474 = !DILocation(line: 132, column: 31, scope: !463)
!475 = !DILocalVariable(name: "val1", scope: !448, file: !361, line: 127, type: !86)
!476 = !DILocation(line: 133, column: 9, scope: !463)
!477 = !DILocation(line: 135, column: 13, scope: !478)
!478 = distinct !DILexicalBlock(scope: !463, file: !361, line: 135, column: 8)
!479 = !DILocation(line: 136, column: 12, scope: !478)
!480 = !DILocation(line: 136, column: 7, scope: !478)
!481 = !DILocation(line: 136, column: 16, scope: !478)
!482 = !DILocation(line: 137, column: 12, scope: !483)
!483 = distinct !DILexicalBlock(scope: !463, file: !361, line: 137, column: 8)
!484 = !DILocation(line: 137, column: 18, scope: !483)
!485 = !DILocation(line: 138, column: 12, scope: !483)
!486 = !DILocation(line: 138, column: 7, scope: !483)
!487 = !DILocation(line: 138, column: 16, scope: !483)
!488 = !DILocation(line: 0, scope: !463)
!489 = distinct !{!489, !459, !490, !130}
!490 = !DILocation(line: 139, column: 3, scope: !448)
!491 = !DILocation(line: 141, column: 3, scope: !448)
!492 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !361, file: !361, line: 205, type: !493, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!493 = !DISubroutineType(types: !494)
!494 = !{null, !32, !32, !275}
!495 = !DILocalVariable(name: "pk", arg: 1, scope: !492, file: !361, line: 205, type: !32)
!496 = !DILocation(line: 0, scope: !492)
!497 = !DILocalVariable(name: "sk", arg: 2, scope: !492, file: !361, line: 206, type: !32)
!498 = !DILocalVariable(name: "coins", arg: 3, scope: !492, file: !361, line: 207, type: !275)
!499 = !DILocalVariable(name: "buf", scope: !492, file: !361, line: 210, type: !296)
!500 = !DILocation(line: 210, column: 11, scope: !492)
!501 = !DILocalVariable(name: "publicseed", scope: !492, file: !361, line: 211, type: !275)
!502 = !DILocation(line: 212, column: 33, scope: !492)
!503 = !DILocalVariable(name: "noiseseed", scope: !492, file: !361, line: 212, type: !275)
!504 = !DILocalVariable(name: "nonce", scope: !492, file: !361, line: 213, type: !33)
!505 = !DILocalVariable(name: "a", scope: !492, file: !361, line: 214, type: !506)
!506 = !DICompositeType(tag: DW_TAG_array_type, baseType: !365, size: 36864, elements: !379)
!507 = !DILocation(line: 214, column: 11, scope: !492)
!508 = !DILocalVariable(name: "e", scope: !492, file: !361, line: 214, type: !365)
!509 = !DILocation(line: 214, column: 23, scope: !492)
!510 = !DILocalVariable(name: "pkpv", scope: !492, file: !361, line: 214, type: !365)
!511 = !DILocation(line: 214, column: 26, scope: !492)
!512 = !DILocalVariable(name: "skpv", scope: !492, file: !361, line: 214, type: !365)
!513 = !DILocation(line: 214, column: 32, scope: !492)
!514 = !DILocation(line: 216, column: 3, scope: !492)
!515 = !DILocation(line: 217, column: 3, scope: !492)
!516 = !DILocation(line: 217, column: 23, scope: !492)
!517 = !DILocation(line: 218, column: 3, scope: !492)
!518 = !DILocation(line: 220, column: 3, scope: !492)
!519 = !DILocalVariable(name: "i", scope: !492, file: !361, line: 209, type: !40)
!520 = !DILocation(line: 222, column: 7, scope: !521)
!521 = distinct !DILexicalBlock(scope: !492, file: !361, line: 222, column: 3)
!522 = !DILocation(line: 222, scope: !521)
!523 = !DILocation(line: 222, column: 12, scope: !524)
!524 = distinct !DILexicalBlock(scope: !521, file: !361, line: 222, column: 3)
!525 = !DILocation(line: 222, column: 3, scope: !521)
!526 = !DILocation(line: 224, column: 3, scope: !527)
!527 = distinct !DILexicalBlock(scope: !492, file: !361, line: 224, column: 3)
!528 = !DILocation(line: 223, column: 25, scope: !524)
!529 = !DILocation(line: 223, column: 5, scope: !524)
!530 = !DILocation(line: 223, column: 54, scope: !524)
!531 = !DILocation(line: 222, column: 22, scope: !524)
!532 = !DILocation(line: 222, column: 3, scope: !524)
!533 = distinct !{!533, !525, !534, !130}
!534 = !DILocation(line: 223, column: 56, scope: !521)
!535 = !DILocation(line: 224, scope: !527)
!536 = !DILocation(line: 224, column: 12, scope: !537)
!537 = distinct !DILexicalBlock(scope: !527, file: !361, line: 224, column: 3)
!538 = !DILocation(line: 225, column: 25, scope: !537)
!539 = !DILocation(line: 225, column: 5, scope: !537)
!540 = !DILocation(line: 225, column: 51, scope: !537)
!541 = !DILocation(line: 224, column: 22, scope: !537)
!542 = !DILocation(line: 224, column: 3, scope: !537)
!543 = distinct !{!543, !526, !544, !130}
!544 = !DILocation(line: 225, column: 53, scope: !527)
!545 = !DILocation(line: 227, column: 3, scope: !492)
!546 = !DILocation(line: 228, column: 3, scope: !492)
!547 = !DILocation(line: 231, column: 7, scope: !548)
!548 = distinct !DILexicalBlock(scope: !492, file: !361, line: 231, column: 3)
!549 = !DILocation(line: 231, scope: !548)
!550 = !DILocation(line: 231, column: 12, scope: !551)
!551 = distinct !DILexicalBlock(scope: !548, file: !361, line: 231, column: 3)
!552 = !DILocation(line: 231, column: 3, scope: !548)
!553 = !DILocation(line: 232, column: 37, scope: !554)
!554 = distinct !DILexicalBlock(scope: !551, file: !361, line: 231, column: 26)
!555 = !DILocation(line: 232, column: 51, scope: !554)
!556 = !DILocation(line: 232, column: 5, scope: !554)
!557 = !DILocation(line: 233, column: 18, scope: !554)
!558 = !DILocation(line: 233, column: 5, scope: !554)
!559 = !DILocation(line: 231, column: 22, scope: !551)
!560 = !DILocation(line: 231, column: 3, scope: !551)
!561 = distinct !{!561, !552, !562, !130}
!562 = !DILocation(line: 234, column: 3, scope: !548)
!563 = !DILocation(line: 236, column: 3, scope: !492)
!564 = !DILocation(line: 237, column: 3, scope: !492)
!565 = !DILocation(line: 239, column: 3, scope: !492)
!566 = !DILocation(line: 240, column: 3, scope: !492)
!567 = !DILocation(line: 241, column: 1, scope: !492)
!568 = distinct !DISubprogram(name: "pack_sk", scope: !361, file: !361, line: 57, type: !569, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !32, !364}
!571 = !DILocalVariable(name: "r", arg: 1, scope: !568, file: !361, line: 57, type: !32)
!572 = !DILocation(line: 0, scope: !568)
!573 = !DILocalVariable(name: "sk", arg: 2, scope: !568, file: !361, line: 57, type: !364)
!574 = !DILocation(line: 59, column: 3, scope: !568)
!575 = !DILocation(line: 60, column: 1, scope: !568)
!576 = distinct !DISubprogram(name: "pack_pk", scope: !361, file: !361, line: 23, type: !577, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!577 = !DISubroutineType(types: !578)
!578 = !{null, !32, !364, !275}
!579 = !DILocalVariable(name: "r", arg: 1, scope: !576, file: !361, line: 23, type: !32)
!580 = !DILocation(line: 0, scope: !576)
!581 = !DILocalVariable(name: "pk", arg: 2, scope: !576, file: !361, line: 24, type: !364)
!582 = !DILocalVariable(name: "seed", arg: 3, scope: !576, file: !361, line: 25, type: !275)
!583 = !DILocation(line: 27, column: 3, scope: !576)
!584 = !DILocation(line: 28, column: 11, scope: !576)
!585 = !DILocation(line: 28, column: 3, scope: !576)
!586 = !DILocation(line: 29, column: 1, scope: !576)
!587 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !361, file: !361, line: 260, type: !588, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!588 = !DISubroutineType(types: !589)
!589 = !{null, !32, !275, !275, !275}
!590 = !DILocalVariable(name: "c", arg: 1, scope: !587, file: !361, line: 260, type: !32)
!591 = !DILocation(line: 0, scope: !587)
!592 = !DILocalVariable(name: "m", arg: 2, scope: !587, file: !361, line: 261, type: !275)
!593 = !DILocalVariable(name: "pk", arg: 3, scope: !587, file: !361, line: 262, type: !275)
!594 = !DILocalVariable(name: "coins", arg: 4, scope: !587, file: !361, line: 263, type: !275)
!595 = !DILocalVariable(name: "seed", scope: !587, file: !361, line: 266, type: !153)
!596 = !DILocation(line: 266, column: 11, scope: !587)
!597 = !DILocalVariable(name: "nonce", scope: !587, file: !361, line: 267, type: !33)
!598 = !DILocalVariable(name: "sp", scope: !587, file: !361, line: 268, type: !365)
!599 = !DILocation(line: 268, column: 11, scope: !587)
!600 = !DILocalVariable(name: "pkpv", scope: !587, file: !361, line: 268, type: !365)
!601 = !DILocation(line: 268, column: 15, scope: !587)
!602 = !DILocalVariable(name: "ep", scope: !587, file: !361, line: 268, type: !365)
!603 = !DILocation(line: 268, column: 21, scope: !587)
!604 = !DILocalVariable(name: "at", scope: !587, file: !361, line: 268, type: !506)
!605 = !DILocation(line: 268, column: 25, scope: !587)
!606 = !DILocalVariable(name: "b", scope: !587, file: !361, line: 268, type: !365)
!607 = !DILocation(line: 268, column: 38, scope: !587)
!608 = !DILocalVariable(name: "v", scope: !587, file: !361, line: 269, type: !371)
!609 = !DILocation(line: 269, column: 8, scope: !587)
!610 = !DILocalVariable(name: "k", scope: !587, file: !361, line: 269, type: !371)
!611 = !DILocation(line: 269, column: 11, scope: !587)
!612 = !DILocalVariable(name: "epp", scope: !587, file: !361, line: 269, type: !371)
!613 = !DILocation(line: 269, column: 14, scope: !587)
!614 = !DILocation(line: 271, column: 3, scope: !587)
!615 = !DILocation(line: 272, column: 3, scope: !587)
!616 = !DILocation(line: 273, column: 3, scope: !587)
!617 = !DILocalVariable(name: "i", scope: !587, file: !361, line: 265, type: !40)
!618 = !DILocation(line: 275, column: 7, scope: !619)
!619 = distinct !DILexicalBlock(scope: !587, file: !361, line: 275, column: 3)
!620 = !DILocation(line: 275, scope: !619)
!621 = !DILocation(line: 275, column: 12, scope: !622)
!622 = distinct !DILexicalBlock(scope: !619, file: !361, line: 275, column: 3)
!623 = !DILocation(line: 275, column: 3, scope: !619)
!624 = !DILocation(line: 277, column: 3, scope: !625)
!625 = distinct !DILexicalBlock(scope: !587, file: !361, line: 277, column: 3)
!626 = !DILocation(line: 276, column: 30, scope: !622)
!627 = !DILocation(line: 276, column: 5, scope: !622)
!628 = !DILocation(line: 276, column: 46, scope: !622)
!629 = !DILocation(line: 275, column: 22, scope: !622)
!630 = !DILocation(line: 275, column: 3, scope: !622)
!631 = distinct !{!631, !623, !632, !130}
!632 = !DILocation(line: 276, column: 48, scope: !619)
!633 = !DILocation(line: 277, scope: !625)
!634 = !DILocation(line: 277, column: 12, scope: !635)
!635 = distinct !DILexicalBlock(scope: !625, file: !361, line: 277, column: 3)
!636 = !DILocation(line: 278, column: 30, scope: !635)
!637 = !DILocation(line: 278, column: 5, scope: !635)
!638 = !DILocation(line: 278, column: 46, scope: !635)
!639 = !DILocation(line: 277, column: 22, scope: !635)
!640 = !DILocation(line: 277, column: 3, scope: !635)
!641 = distinct !{!641, !624, !642, !130}
!642 = !DILocation(line: 278, column: 48, scope: !625)
!643 = !DILocation(line: 279, column: 3, scope: !587)
!644 = !DILocation(line: 281, column: 3, scope: !587)
!645 = !DILocation(line: 284, column: 7, scope: !646)
!646 = distinct !DILexicalBlock(scope: !587, file: !361, line: 284, column: 3)
!647 = !DILocation(line: 284, scope: !646)
!648 = !DILocation(line: 284, column: 12, scope: !649)
!649 = distinct !DILexicalBlock(scope: !646, file: !361, line: 284, column: 3)
!650 = !DILocation(line: 284, column: 3, scope: !646)
!651 = !DILocation(line: 285, column: 37, scope: !649)
!652 = !DILocation(line: 285, column: 48, scope: !649)
!653 = !DILocation(line: 285, column: 5, scope: !649)
!654 = !DILocation(line: 284, column: 22, scope: !649)
!655 = !DILocation(line: 284, column: 3, scope: !649)
!656 = distinct !{!656, !650, !657, !130}
!657 = !DILocation(line: 285, column: 58, scope: !646)
!658 = !DILocation(line: 287, column: 3, scope: !587)
!659 = !DILocation(line: 289, column: 3, scope: !587)
!660 = !DILocation(line: 290, column: 3, scope: !587)
!661 = !DILocation(line: 292, column: 3, scope: !587)
!662 = !DILocation(line: 293, column: 3, scope: !587)
!663 = !DILocation(line: 294, column: 3, scope: !587)
!664 = !DILocation(line: 295, column: 3, scope: !587)
!665 = !DILocation(line: 296, column: 3, scope: !587)
!666 = !DILocation(line: 298, column: 3, scope: !587)
!667 = !DILocation(line: 299, column: 1, scope: !587)
!668 = distinct !DISubprogram(name: "unpack_pk", scope: !361, file: !361, line: 41, type: !669, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !364, !32, !275}
!671 = !DILocalVariable(name: "pk", arg: 1, scope: !668, file: !361, line: 41, type: !364)
!672 = !DILocation(line: 0, scope: !668)
!673 = !DILocalVariable(name: "seed", arg: 2, scope: !668, file: !361, line: 42, type: !32)
!674 = !DILocalVariable(name: "packedpk", arg: 3, scope: !668, file: !361, line: 43, type: !275)
!675 = !DILocation(line: 45, column: 3, scope: !668)
!676 = !DILocation(line: 46, column: 24, scope: !668)
!677 = !DILocation(line: 46, column: 3, scope: !668)
!678 = !DILocation(line: 47, column: 1, scope: !668)
!679 = distinct !DISubprogram(name: "pack_ciphertext", scope: !361, file: !361, line: 86, type: !680, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !32, !364, !682}
!682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 32)
!683 = !DILocalVariable(name: "r", arg: 1, scope: !679, file: !361, line: 86, type: !32)
!684 = !DILocation(line: 0, scope: !679)
!685 = !DILocalVariable(name: "b", arg: 2, scope: !679, file: !361, line: 86, type: !364)
!686 = !DILocalVariable(name: "v", arg: 3, scope: !679, file: !361, line: 86, type: !682)
!687 = !DILocation(line: 88, column: 3, scope: !679)
!688 = !DILocation(line: 89, column: 18, scope: !679)
!689 = !DILocation(line: 89, column: 3, scope: !679)
!690 = !DILocation(line: 90, column: 1, scope: !679)
!691 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !361, file: !361, line: 314, type: !692, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!692 = !DISubroutineType(types: !693)
!693 = !{null, !32, !275, !275}
!694 = !DILocalVariable(name: "m", arg: 1, scope: !691, file: !361, line: 314, type: !32)
!695 = !DILocation(line: 0, scope: !691)
!696 = !DILocalVariable(name: "c", arg: 2, scope: !691, file: !361, line: 315, type: !275)
!697 = !DILocalVariable(name: "sk", arg: 3, scope: !691, file: !361, line: 316, type: !275)
!698 = !DILocalVariable(name: "b", scope: !691, file: !361, line: 318, type: !365)
!699 = !DILocation(line: 318, column: 11, scope: !691)
!700 = !DILocalVariable(name: "skpv", scope: !691, file: !361, line: 318, type: !365)
!701 = !DILocation(line: 318, column: 14, scope: !691)
!702 = !DILocalVariable(name: "v", scope: !691, file: !361, line: 319, type: !371)
!703 = !DILocation(line: 319, column: 8, scope: !691)
!704 = !DILocalVariable(name: "mp", scope: !691, file: !361, line: 319, type: !371)
!705 = !DILocation(line: 319, column: 11, scope: !691)
!706 = !DILocation(line: 321, column: 3, scope: !691)
!707 = !DILocation(line: 322, column: 3, scope: !691)
!708 = !DILocation(line: 324, column: 3, scope: !691)
!709 = !DILocation(line: 325, column: 3, scope: !691)
!710 = !DILocation(line: 326, column: 3, scope: !691)
!711 = !DILocation(line: 328, column: 3, scope: !691)
!712 = !DILocation(line: 329, column: 3, scope: !691)
!713 = !DILocation(line: 331, column: 3, scope: !691)
!714 = !DILocation(line: 332, column: 1, scope: !691)
!715 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !361, file: !361, line: 102, type: !716, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!716 = !DISubroutineType(types: !717)
!717 = !{null, !364, !682, !275}
!718 = !DILocalVariable(name: "b", arg: 1, scope: !715, file: !361, line: 102, type: !364)
!719 = !DILocation(line: 0, scope: !715)
!720 = !DILocalVariable(name: "v", arg: 2, scope: !715, file: !361, line: 102, type: !682)
!721 = !DILocalVariable(name: "c", arg: 3, scope: !715, file: !361, line: 102, type: !275)
!722 = !DILocation(line: 104, column: 3, scope: !715)
!723 = !DILocation(line: 105, column: 23, scope: !715)
!724 = !DILocation(line: 105, column: 3, scope: !715)
!725 = !DILocation(line: 106, column: 1, scope: !715)
!726 = distinct !DISubprogram(name: "unpack_sk", scope: !361, file: !361, line: 70, type: !727, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!727 = !DISubroutineType(types: !728)
!728 = !{null, !364, !275}
!729 = !DILocalVariable(name: "sk", arg: 1, scope: !726, file: !361, line: 70, type: !364)
!730 = !DILocation(line: 0, scope: !726)
!731 = !DILocalVariable(name: "packedsk", arg: 2, scope: !726, file: !361, line: 70, type: !275)
!732 = !DILocation(line: 72, column: 3, scope: !726)
!733 = !DILocation(line: 73, column: 1, scope: !726)
!734 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !735, file: !735, line: 15, type: !736, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!735 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!736 = !DISubroutineType(types: !737)
!737 = !{null, !32, !738}
!738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !739, size: 32)
!739 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !740)
!740 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !366, line: 10, baseType: !741)
!741 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !366, line: 8, size: 12288, elements: !742)
!742 = !{!743}
!743 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !741, file: !366, line: 9, baseType: !744, size: 12288)
!744 = !DICompositeType(tag: DW_TAG_array_type, baseType: !745, size: 12288, elements: !379)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !372, line: 13, baseType: !746)
!746 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !372, line: 11, size: 4096, elements: !747)
!747 = !{!748}
!748 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !746, file: !372, line: 12, baseType: !376, size: 4096)
!749 = !DILocalVariable(name: "r", arg: 1, scope: !734, file: !735, line: 15, type: !32)
!750 = !DILocation(line: 0, scope: !734)
!751 = !DILocalVariable(name: "a", arg: 2, scope: !734, file: !735, line: 15, type: !738)
!752 = !DILocalVariable(name: "t", scope: !734, file: !735, line: 51, type: !753)
!753 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !754)
!754 = !{!755}
!755 = !DISubrange(count: 4)
!756 = !DILocation(line: 51, column: 12, scope: !734)
!757 = !DILocalVariable(name: "i", scope: !734, file: !735, line: 17, type: !40)
!758 = !DILocation(line: 52, column: 7, scope: !759)
!759 = distinct !DILexicalBlock(scope: !734, file: !735, line: 52, column: 3)
!760 = !DILocation(line: 52, scope: !759)
!761 = !DILocation(line: 52, column: 12, scope: !762)
!762 = distinct !DILexicalBlock(scope: !759, file: !735, line: 52, column: 3)
!763 = !DILocation(line: 52, column: 3, scope: !759)
!764 = !DILocation(line: 53, column: 5, scope: !765)
!765 = distinct !DILexicalBlock(scope: !766, file: !735, line: 53, column: 5)
!766 = distinct !DILexicalBlock(scope: !762, file: !735, line: 52, column: 26)
!767 = !DILocation(line: 53, scope: !765)
!768 = !DILocalVariable(name: "j", scope: !734, file: !735, line: 17, type: !40)
!769 = !DILocation(line: 53, column: 14, scope: !770)
!770 = distinct !DILexicalBlock(scope: !765, file: !735, line: 53, column: 5)
!771 = !DILocation(line: 54, column: 7, scope: !772)
!772 = distinct !DILexicalBlock(scope: !773, file: !735, line: 54, column: 7)
!773 = distinct !DILexicalBlock(scope: !770, file: !735, line: 53, column: 30)
!774 = !DILocation(line: 54, scope: !772)
!775 = !DILocalVariable(name: "k", scope: !734, file: !735, line: 17, type: !40)
!776 = !DILocation(line: 54, column: 16, scope: !777)
!777 = distinct !DILexicalBlock(scope: !772, file: !735, line: 54, column: 7)
!778 = !DILocation(line: 55, column: 17, scope: !779)
!779 = distinct !DILexicalBlock(scope: !777, file: !735, line: 54, column: 24)
!780 = !DILocation(line: 55, column: 35, scope: !779)
!781 = !DILocation(line: 55, column: 37, scope: !779)
!782 = !DILocation(line: 56, column: 39, scope: !779)
!783 = !DILocation(line: 56, column: 9, scope: !779)
!784 = !DILocation(line: 56, column: 14, scope: !779)
!785 = !DILocation(line: 58, column: 14, scope: !779)
!786 = !DILocalVariable(name: "d0", scope: !734, file: !735, line: 18, type: !70)
!787 = !DILocation(line: 61, column: 12, scope: !779)
!788 = !DILocation(line: 62, column: 12, scope: !779)
!789 = !DILocation(line: 63, column: 16, scope: !779)
!790 = !DILocation(line: 63, column: 9, scope: !779)
!791 = !DILocation(line: 63, column: 14, scope: !779)
!792 = !DILocation(line: 54, column: 20, scope: !777)
!793 = !DILocation(line: 54, column: 7, scope: !777)
!794 = distinct !{!794, !771, !795, !130}
!795 = !DILocation(line: 64, column: 7, scope: !772)
!796 = !DILocation(line: 66, column: 15, scope: !773)
!797 = !DILocation(line: 66, column: 14, scope: !773)
!798 = !DILocation(line: 66, column: 12, scope: !773)
!799 = !DILocation(line: 67, column: 15, scope: !773)
!800 = !DILocation(line: 67, column: 20, scope: !773)
!801 = !DILocation(line: 67, column: 29, scope: !773)
!802 = !DILocation(line: 67, column: 34, scope: !773)
!803 = !DILocation(line: 67, column: 26, scope: !773)
!804 = !DILocation(line: 67, column: 7, scope: !773)
!805 = !DILocation(line: 67, column: 12, scope: !773)
!806 = !DILocation(line: 68, column: 15, scope: !773)
!807 = !DILocation(line: 68, column: 20, scope: !773)
!808 = !DILocation(line: 68, column: 29, scope: !773)
!809 = !DILocation(line: 68, column: 34, scope: !773)
!810 = !DILocation(line: 68, column: 26, scope: !773)
!811 = !DILocation(line: 68, column: 7, scope: !773)
!812 = !DILocation(line: 68, column: 12, scope: !773)
!813 = !DILocation(line: 69, column: 15, scope: !773)
!814 = !DILocation(line: 69, column: 20, scope: !773)
!815 = !DILocation(line: 69, column: 29, scope: !773)
!816 = !DILocation(line: 69, column: 34, scope: !773)
!817 = !DILocation(line: 69, column: 26, scope: !773)
!818 = !DILocation(line: 69, column: 7, scope: !773)
!819 = !DILocation(line: 69, column: 12, scope: !773)
!820 = !DILocation(line: 70, column: 15, scope: !773)
!821 = !DILocation(line: 70, column: 20, scope: !773)
!822 = !DILocation(line: 70, column: 14, scope: !773)
!823 = !DILocation(line: 70, column: 7, scope: !773)
!824 = !DILocation(line: 70, column: 12, scope: !773)
!825 = !DILocation(line: 71, column: 9, scope: !773)
!826 = !DILocation(line: 53, column: 26, scope: !770)
!827 = !DILocation(line: 53, column: 5, scope: !770)
!828 = distinct !{!828, !764, !829, !130}
!829 = !DILocation(line: 72, column: 5, scope: !765)
!830 = !DILocation(line: 52, column: 22, scope: !762)
!831 = !DILocation(line: 52, column: 3, scope: !762)
!832 = distinct !{!832, !763, !833, !130}
!833 = !DILocation(line: 73, column: 3, scope: !759)
!834 = !DILocation(line: 77, column: 1, scope: !734)
!835 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !735, file: !735, line: 89, type: !836, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!836 = !DISubroutineType(types: !837)
!837 = !{null, !838, !275}
!838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 32)
!839 = !DILocalVariable(name: "r", arg: 1, scope: !835, file: !735, line: 89, type: !838)
!840 = !DILocation(line: 0, scope: !835)
!841 = !DILocalVariable(name: "a", arg: 2, scope: !835, file: !735, line: 89, type: !275)
!842 = !DILocalVariable(name: "t", scope: !835, file: !735, line: 112, type: !753)
!843 = !DILocation(line: 112, column: 12, scope: !835)
!844 = !DILocalVariable(name: "i", scope: !835, file: !735, line: 91, type: !40)
!845 = !DILocation(line: 113, column: 7, scope: !846)
!846 = distinct !DILexicalBlock(scope: !835, file: !735, line: 113, column: 3)
!847 = !DILocation(line: 113, scope: !846)
!848 = !DILocation(line: 113, column: 12, scope: !849)
!849 = distinct !DILexicalBlock(scope: !846, file: !735, line: 113, column: 3)
!850 = !DILocation(line: 113, column: 3, scope: !846)
!851 = !DILocation(line: 114, column: 5, scope: !852)
!852 = distinct !DILexicalBlock(scope: !853, file: !735, line: 114, column: 5)
!853 = distinct !DILexicalBlock(scope: !849, file: !735, line: 113, column: 26)
!854 = !DILocation(line: 114, scope: !852)
!855 = !DILocalVariable(name: "j", scope: !835, file: !735, line: 91, type: !40)
!856 = !DILocation(line: 114, column: 14, scope: !857)
!857 = distinct !DILexicalBlock(scope: !852, file: !735, line: 114, column: 5)
!858 = !DILocation(line: 115, column: 15, scope: !859)
!859 = distinct !DILexicalBlock(scope: !857, file: !735, line: 114, column: 30)
!860 = !DILocation(line: 115, column: 39, scope: !859)
!861 = !DILocation(line: 115, column: 29, scope: !859)
!862 = !DILocation(line: 115, column: 44, scope: !859)
!863 = !DILocation(line: 115, column: 26, scope: !859)
!864 = !DILocation(line: 115, column: 12, scope: !859)
!865 = !DILocation(line: 116, column: 15, scope: !859)
!866 = !DILocation(line: 116, column: 20, scope: !859)
!867 = !DILocation(line: 116, column: 39, scope: !859)
!868 = !DILocation(line: 116, column: 29, scope: !859)
!869 = !DILocation(line: 116, column: 44, scope: !859)
!870 = !DILocation(line: 116, column: 26, scope: !859)
!871 = !DILocation(line: 116, column: 7, scope: !859)
!872 = !DILocation(line: 116, column: 12, scope: !859)
!873 = !DILocation(line: 117, column: 15, scope: !859)
!874 = !DILocation(line: 117, column: 20, scope: !859)
!875 = !DILocation(line: 117, column: 39, scope: !859)
!876 = !DILocation(line: 117, column: 29, scope: !859)
!877 = !DILocation(line: 117, column: 44, scope: !859)
!878 = !DILocation(line: 117, column: 26, scope: !859)
!879 = !DILocation(line: 117, column: 7, scope: !859)
!880 = !DILocation(line: 117, column: 12, scope: !859)
!881 = !DILocation(line: 118, column: 15, scope: !859)
!882 = !DILocation(line: 118, column: 20, scope: !859)
!883 = !DILocation(line: 118, column: 39, scope: !859)
!884 = !DILocation(line: 118, column: 29, scope: !859)
!885 = !DILocation(line: 118, column: 44, scope: !859)
!886 = !DILocation(line: 118, column: 26, scope: !859)
!887 = !DILocation(line: 118, column: 7, scope: !859)
!888 = !DILocation(line: 118, column: 12, scope: !859)
!889 = !DILocalVariable(name: "k", scope: !835, file: !735, line: 91, type: !40)
!890 = !DILocation(line: 121, column: 11, scope: !891)
!891 = distinct !DILexicalBlock(scope: !859, file: !735, line: 121, column: 7)
!892 = !DILocation(line: 121, scope: !891)
!893 = !DILocation(line: 121, column: 16, scope: !894)
!894 = distinct !DILexicalBlock(scope: !891, file: !735, line: 121, column: 7)
!895 = !DILocation(line: 121, column: 7, scope: !891)
!896 = !DILocation(line: 122, column: 47, scope: !894)
!897 = !DILocation(line: 122, column: 52, scope: !894)
!898 = !DILocation(line: 122, column: 60, scope: !894)
!899 = !DILocation(line: 122, column: 69, scope: !894)
!900 = !DILocation(line: 122, column: 76, scope: !894)
!901 = !DILocation(line: 122, column: 35, scope: !894)
!902 = !DILocation(line: 122, column: 9, scope: !894)
!903 = !DILocation(line: 122, column: 27, scope: !894)
!904 = !DILocation(line: 122, column: 29, scope: !894)
!905 = !DILocation(line: 122, column: 33, scope: !894)
!906 = !DILocation(line: 121, column: 20, scope: !894)
!907 = !DILocation(line: 121, column: 7, scope: !894)
!908 = distinct !{!908, !895, !909, !130}
!909 = !DILocation(line: 122, column: 79, scope: !891)
!910 = !DILocation(line: 119, column: 9, scope: !859)
!911 = !DILocation(line: 114, column: 26, scope: !857)
!912 = !DILocation(line: 114, column: 5, scope: !857)
!913 = distinct !{!913, !851, !914, !130}
!914 = !DILocation(line: 123, column: 5, scope: !852)
!915 = !DILocation(line: 113, column: 22, scope: !849)
!916 = !DILocation(line: 113, column: 3, scope: !849)
!917 = distinct !{!917, !850, !918, !130}
!918 = !DILocation(line: 124, column: 3, scope: !846)
!919 = !DILocation(line: 128, column: 1, scope: !835)
!920 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !735, file: !735, line: 139, type: !736, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!921 = !DILocalVariable(name: "r", arg: 1, scope: !920, file: !735, line: 139, type: !32)
!922 = !DILocation(line: 0, scope: !920)
!923 = !DILocalVariable(name: "a", arg: 2, scope: !920, file: !735, line: 139, type: !738)
!924 = !DILocalVariable(name: "i", scope: !920, file: !735, line: 141, type: !40)
!925 = !DILocation(line: 142, column: 7, scope: !926)
!926 = distinct !DILexicalBlock(scope: !920, file: !735, line: 142, column: 3)
!927 = !DILocation(line: 142, scope: !926)
!928 = !DILocation(line: 142, column: 12, scope: !929)
!929 = distinct !DILexicalBlock(scope: !926, file: !735, line: 142, column: 3)
!930 = !DILocation(line: 142, column: 3, scope: !926)
!931 = !DILocation(line: 143, column: 21, scope: !929)
!932 = !DILocation(line: 143, column: 19, scope: !929)
!933 = !DILocation(line: 143, column: 40, scope: !929)
!934 = !DILocation(line: 143, column: 5, scope: !929)
!935 = !DILocation(line: 142, column: 22, scope: !929)
!936 = !DILocation(line: 142, column: 3, scope: !929)
!937 = distinct !{!937, !930, !938, !130}
!938 = !DILocation(line: 143, column: 49, scope: !926)
!939 = !DILocation(line: 144, column: 1, scope: !920)
!940 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !735, file: !735, line: 156, type: !836, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!941 = !DILocalVariable(name: "r", arg: 1, scope: !940, file: !735, line: 156, type: !838)
!942 = !DILocation(line: 0, scope: !940)
!943 = !DILocalVariable(name: "a", arg: 2, scope: !940, file: !735, line: 156, type: !275)
!944 = !DILocalVariable(name: "i", scope: !940, file: !735, line: 158, type: !40)
!945 = !DILocation(line: 159, column: 7, scope: !946)
!946 = distinct !DILexicalBlock(scope: !940, file: !735, line: 159, column: 3)
!947 = !DILocation(line: 159, scope: !946)
!948 = !DILocation(line: 159, column: 12, scope: !949)
!949 = distinct !DILexicalBlock(scope: !946, file: !735, line: 159, column: 3)
!950 = !DILocation(line: 159, column: 3, scope: !946)
!951 = !DILocation(line: 160, column: 21, scope: !949)
!952 = !DILocation(line: 160, column: 35, scope: !949)
!953 = !DILocation(line: 160, column: 33, scope: !949)
!954 = !DILocation(line: 160, column: 5, scope: !949)
!955 = !DILocation(line: 159, column: 22, scope: !949)
!956 = !DILocation(line: 159, column: 3, scope: !949)
!957 = distinct !{!957, !950, !958, !130}
!958 = !DILocation(line: 160, column: 51, scope: !946)
!959 = !DILocation(line: 161, column: 1, scope: !940)
!960 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !735, file: !735, line: 170, type: !961, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!961 = !DISubroutineType(types: !962)
!962 = !{null, !838}
!963 = !DILocalVariable(name: "r", arg: 1, scope: !960, file: !735, line: 170, type: !838)
!964 = !DILocation(line: 0, scope: !960)
!965 = !DILocalVariable(name: "i", scope: !960, file: !735, line: 172, type: !40)
!966 = !DILocation(line: 173, column: 7, scope: !967)
!967 = distinct !DILexicalBlock(scope: !960, file: !735, line: 173, column: 3)
!968 = !DILocation(line: 173, scope: !967)
!969 = !DILocation(line: 173, column: 12, scope: !970)
!970 = distinct !DILexicalBlock(scope: !967, file: !735, line: 173, column: 3)
!971 = !DILocation(line: 173, column: 3, scope: !967)
!972 = !DILocation(line: 174, column: 15, scope: !970)
!973 = !DILocation(line: 174, column: 5, scope: !970)
!974 = !DILocation(line: 173, column: 22, scope: !970)
!975 = !DILocation(line: 173, column: 3, scope: !970)
!976 = distinct !{!976, !971, !977, !130}
!977 = !DILocation(line: 174, column: 24, scope: !967)
!978 = !DILocation(line: 175, column: 1, scope: !960)
!979 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !735, file: !735, line: 185, type: !961, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!980 = !DILocalVariable(name: "r", arg: 1, scope: !979, file: !735, line: 185, type: !838)
!981 = !DILocation(line: 0, scope: !979)
!982 = !DILocalVariable(name: "i", scope: !979, file: !735, line: 187, type: !40)
!983 = !DILocation(line: 188, column: 7, scope: !984)
!984 = distinct !DILexicalBlock(scope: !979, file: !735, line: 188, column: 3)
!985 = !DILocation(line: 188, scope: !984)
!986 = !DILocation(line: 188, column: 12, scope: !987)
!987 = distinct !DILexicalBlock(scope: !984, file: !735, line: 188, column: 3)
!988 = !DILocation(line: 188, column: 3, scope: !984)
!989 = !DILocation(line: 189, column: 25, scope: !987)
!990 = !DILocation(line: 189, column: 5, scope: !987)
!991 = !DILocation(line: 188, column: 22, scope: !987)
!992 = !DILocation(line: 188, column: 3, scope: !987)
!993 = distinct !{!993, !988, !994, !130}
!994 = !DILocation(line: 189, column: 34, scope: !984)
!995 = !DILocation(line: 190, column: 1, scope: !979)
!996 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !735, file: !735, line: 202, type: !997, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!997 = !DISubroutineType(types: !998)
!998 = !{null, !999, !738, !738}
!999 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !745, size: 32)
!1000 = !DILocalVariable(name: "r", arg: 1, scope: !996, file: !735, line: 202, type: !999)
!1001 = !DILocation(line: 0, scope: !996)
!1002 = !DILocalVariable(name: "a", arg: 2, scope: !996, file: !735, line: 202, type: !738)
!1003 = !DILocalVariable(name: "b", arg: 3, scope: !996, file: !735, line: 202, type: !738)
!1004 = !DILocalVariable(name: "t", scope: !996, file: !735, line: 205, type: !745)
!1005 = !DILocation(line: 205, column: 8, scope: !996)
!1006 = !DILocation(line: 207, column: 3, scope: !996)
!1007 = !DILocalVariable(name: "i", scope: !996, file: !735, line: 204, type: !40)
!1008 = !DILocation(line: 208, column: 7, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !996, file: !735, line: 208, column: 3)
!1010 = !DILocation(line: 208, scope: !1009)
!1011 = !DILocation(line: 208, column: 12, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1009, file: !735, line: 208, column: 3)
!1013 = !DILocation(line: 208, column: 3, scope: !1009)
!1014 = !DILocation(line: 209, column: 34, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1012, file: !735, line: 208, column: 26)
!1016 = !DILocation(line: 209, column: 46, scope: !1015)
!1017 = !DILocation(line: 209, column: 5, scope: !1015)
!1018 = !DILocation(line: 210, column: 5, scope: !1015)
!1019 = !DILocation(line: 208, column: 22, scope: !1012)
!1020 = !DILocation(line: 208, column: 3, scope: !1012)
!1021 = distinct !{!1021, !1013, !1022, !130}
!1022 = !DILocation(line: 211, column: 3, scope: !1009)
!1023 = !DILocation(line: 213, column: 3, scope: !996)
!1024 = !DILocation(line: 214, column: 1, scope: !996)
!1025 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !735, file: !735, line: 225, type: !961, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1026 = !DILocalVariable(name: "r", arg: 1, scope: !1025, file: !735, line: 225, type: !838)
!1027 = !DILocation(line: 0, scope: !1025)
!1028 = !DILocalVariable(name: "i", scope: !1025, file: !735, line: 227, type: !40)
!1029 = !DILocation(line: 228, column: 7, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1025, file: !735, line: 228, column: 3)
!1031 = !DILocation(line: 228, scope: !1030)
!1032 = !DILocation(line: 228, column: 12, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1030, file: !735, line: 228, column: 3)
!1034 = !DILocation(line: 228, column: 3, scope: !1030)
!1035 = !DILocation(line: 229, column: 18, scope: !1033)
!1036 = !DILocation(line: 229, column: 5, scope: !1033)
!1037 = !DILocation(line: 228, column: 22, scope: !1033)
!1038 = !DILocation(line: 228, column: 3, scope: !1033)
!1039 = distinct !{!1039, !1034, !1040, !130}
!1040 = !DILocation(line: 229, column: 27, scope: !1030)
!1041 = !DILocation(line: 230, column: 1, scope: !1025)
!1042 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !735, file: !735, line: 241, type: !1043, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{null, !838, !738, !738}
!1045 = !DILocalVariable(name: "r", arg: 1, scope: !1042, file: !735, line: 241, type: !838)
!1046 = !DILocation(line: 0, scope: !1042)
!1047 = !DILocalVariable(name: "a", arg: 2, scope: !1042, file: !735, line: 241, type: !738)
!1048 = !DILocalVariable(name: "b", arg: 3, scope: !1042, file: !735, line: 241, type: !738)
!1049 = !DILocalVariable(name: "i", scope: !1042, file: !735, line: 243, type: !40)
!1050 = !DILocation(line: 244, column: 7, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1042, file: !735, line: 244, column: 3)
!1052 = !DILocation(line: 244, scope: !1051)
!1053 = !DILocation(line: 244, column: 12, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !1051, file: !735, line: 244, column: 3)
!1055 = !DILocation(line: 244, column: 3, scope: !1051)
!1056 = !DILocation(line: 245, column: 15, scope: !1054)
!1057 = !DILocation(line: 245, column: 27, scope: !1054)
!1058 = !DILocation(line: 245, column: 39, scope: !1054)
!1059 = !DILocation(line: 245, column: 5, scope: !1054)
!1060 = !DILocation(line: 244, column: 22, scope: !1054)
!1061 = !DILocation(line: 244, column: 3, scope: !1054)
!1062 = distinct !{!1062, !1055, !1063, !130}
!1063 = !DILocation(line: 245, column: 48, scope: !1051)
!1064 = !DILocation(line: 246, column: 1, scope: !1042)
!1065 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !1066, file: !1066, line: 19, type: !1067, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1066 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1067 = !DISubroutineType(types: !1068)
!1068 = !{null, !32, !1069}
!1069 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1070, size: 32)
!1070 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1071)
!1071 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !372, line: 13, baseType: !1072)
!1072 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !372, line: 11, size: 4096, elements: !1073)
!1073 = !{!1074}
!1074 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1072, file: !372, line: 12, baseType: !376, size: 4096)
!1075 = !DILocalVariable(name: "r", arg: 1, scope: !1065, file: !1066, line: 19, type: !32)
!1076 = !DILocation(line: 0, scope: !1065)
!1077 = !DILocalVariable(name: "a", arg: 2, scope: !1065, file: !1066, line: 19, type: !1069)
!1078 = !DILocalVariable(name: "t", scope: !1065, file: !1066, line: 24, type: !1079)
!1079 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !1080)
!1080 = !{!1081}
!1081 = !DISubrange(count: 8)
!1082 = !DILocation(line: 24, column: 11, scope: !1065)
!1083 = !DILocalVariable(name: "i", scope: !1065, file: !1066, line: 21, type: !40)
!1084 = !DILocation(line: 28, column: 7, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1065, file: !1066, line: 28, column: 3)
!1086 = !DILocation(line: 28, scope: !1085)
!1087 = !DILocation(line: 28, column: 12, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1085, file: !1066, line: 28, column: 3)
!1089 = !DILocation(line: 28, column: 3, scope: !1085)
!1090 = !DILocation(line: 29, column: 5, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1092, file: !1066, line: 29, column: 5)
!1092 = distinct !DILexicalBlock(scope: !1088, file: !1066, line: 28, column: 28)
!1093 = !DILocation(line: 29, scope: !1091)
!1094 = !DILocalVariable(name: "j", scope: !1065, file: !1066, line: 21, type: !40)
!1095 = !DILocation(line: 29, column: 14, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1091, file: !1066, line: 29, column: 5)
!1097 = !DILocation(line: 31, column: 23, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1096, file: !1066, line: 29, column: 22)
!1099 = !DILocation(line: 31, column: 25, scope: !1098)
!1100 = !DILocation(line: 31, column: 12, scope: !1098)
!1101 = !DILocalVariable(name: "u", scope: !1065, file: !1066, line: 22, type: !61)
!1102 = !DILocation(line: 32, column: 22, scope: !1098)
!1103 = !DILocation(line: 32, column: 9, scope: !1098)
!1104 = !DILocation(line: 34, column: 12, scope: !1098)
!1105 = !DILocalVariable(name: "d0", scope: !1065, file: !1066, line: 23, type: !91)
!1106 = !DILocation(line: 36, column: 10, scope: !1098)
!1107 = !DILocation(line: 37, column: 10, scope: !1098)
!1108 = !DILocation(line: 38, column: 14, scope: !1098)
!1109 = !DILocation(line: 38, column: 7, scope: !1098)
!1110 = !DILocation(line: 38, column: 12, scope: !1098)
!1111 = !DILocation(line: 29, column: 18, scope: !1096)
!1112 = !DILocation(line: 29, column: 5, scope: !1096)
!1113 = distinct !{!1113, !1090, !1114, !130}
!1114 = !DILocation(line: 39, column: 5, scope: !1091)
!1115 = !DILocation(line: 41, column: 12, scope: !1092)
!1116 = !DILocation(line: 41, column: 20, scope: !1092)
!1117 = !DILocation(line: 41, column: 25, scope: !1092)
!1118 = !DILocation(line: 41, column: 17, scope: !1092)
!1119 = !DILocation(line: 41, column: 10, scope: !1092)
!1120 = !DILocation(line: 42, column: 12, scope: !1092)
!1121 = !DILocation(line: 42, column: 20, scope: !1092)
!1122 = !DILocation(line: 42, column: 25, scope: !1092)
!1123 = !DILocation(line: 42, column: 17, scope: !1092)
!1124 = !DILocation(line: 42, column: 5, scope: !1092)
!1125 = !DILocation(line: 42, column: 10, scope: !1092)
!1126 = !DILocation(line: 43, column: 12, scope: !1092)
!1127 = !DILocation(line: 43, column: 20, scope: !1092)
!1128 = !DILocation(line: 43, column: 25, scope: !1092)
!1129 = !DILocation(line: 43, column: 17, scope: !1092)
!1130 = !DILocation(line: 43, column: 5, scope: !1092)
!1131 = !DILocation(line: 43, column: 10, scope: !1092)
!1132 = !DILocation(line: 44, column: 12, scope: !1092)
!1133 = !DILocation(line: 44, column: 20, scope: !1092)
!1134 = !DILocation(line: 44, column: 25, scope: !1092)
!1135 = !DILocation(line: 44, column: 17, scope: !1092)
!1136 = !DILocation(line: 44, column: 5, scope: !1092)
!1137 = !DILocation(line: 44, column: 10, scope: !1092)
!1138 = !DILocation(line: 45, column: 7, scope: !1092)
!1139 = !DILocation(line: 28, column: 24, scope: !1088)
!1140 = !DILocation(line: 28, column: 3, scope: !1088)
!1141 = distinct !{!1141, !1089, !1142, !130}
!1142 = !DILocation(line: 46, column: 3, scope: !1085)
!1143 = !DILocation(line: 71, column: 1, scope: !1065)
!1144 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !1066, file: !1066, line: 83, type: !1145, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{null, !1147, !275}
!1147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1071, size: 32)
!1148 = !DILocalVariable(name: "r", arg: 1, scope: !1144, file: !1066, line: 83, type: !1147)
!1149 = !DILocation(line: 0, scope: !1144)
!1150 = !DILocalVariable(name: "a", arg: 2, scope: !1144, file: !1066, line: 83, type: !275)
!1151 = !DILocalVariable(name: "i", scope: !1144, file: !1066, line: 85, type: !40)
!1152 = !DILocation(line: 88, column: 7, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1144, file: !1066, line: 88, column: 3)
!1154 = !DILocation(line: 88, scope: !1153)
!1155 = !DILocation(line: 88, column: 12, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1153, file: !1066, line: 88, column: 3)
!1157 = !DILocation(line: 88, column: 3, scope: !1153)
!1158 = !DILocation(line: 89, column: 37, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1156, file: !1066, line: 88, column: 28)
!1160 = !DILocation(line: 89, column: 42, scope: !1159)
!1161 = !DILocation(line: 89, column: 26, scope: !1159)
!1162 = !DILocation(line: 89, column: 47, scope: !1159)
!1163 = !DILocation(line: 89, column: 57, scope: !1159)
!1164 = !DILocation(line: 89, column: 62, scope: !1159)
!1165 = !DILocation(line: 89, column: 24, scope: !1159)
!1166 = !DILocation(line: 89, column: 16, scope: !1159)
!1167 = !DILocation(line: 89, column: 5, scope: !1159)
!1168 = !DILocation(line: 89, column: 22, scope: !1159)
!1169 = !DILocation(line: 90, column: 37, scope: !1159)
!1170 = !DILocation(line: 90, column: 42, scope: !1159)
!1171 = !DILocation(line: 90, column: 26, scope: !1159)
!1172 = !DILocation(line: 90, column: 47, scope: !1159)
!1173 = !DILocation(line: 90, column: 57, scope: !1159)
!1174 = !DILocation(line: 90, column: 62, scope: !1159)
!1175 = !DILocation(line: 90, column: 24, scope: !1159)
!1176 = !DILocation(line: 90, column: 16, scope: !1159)
!1177 = !DILocation(line: 90, column: 18, scope: !1159)
!1178 = !DILocation(line: 90, column: 5, scope: !1159)
!1179 = !DILocation(line: 90, column: 22, scope: !1159)
!1180 = !DILocation(line: 91, column: 7, scope: !1159)
!1181 = !DILocation(line: 88, column: 24, scope: !1156)
!1182 = !DILocation(line: 88, column: 3, scope: !1156)
!1183 = distinct !{!1183, !1157, !1184, !130}
!1184 = !DILocation(line: 92, column: 3, scope: !1153)
!1185 = !DILocation(line: 113, column: 1, scope: !1144)
!1186 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !1066, file: !1066, line: 124, type: !1067, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1187 = !DILocalVariable(name: "r", arg: 1, scope: !1186, file: !1066, line: 124, type: !32)
!1188 = !DILocation(line: 0, scope: !1186)
!1189 = !DILocalVariable(name: "a", arg: 2, scope: !1186, file: !1066, line: 124, type: !1069)
!1190 = !DILocalVariable(name: "i", scope: !1186, file: !1066, line: 126, type: !40)
!1191 = !DILocation(line: 129, column: 7, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1186, file: !1066, line: 129, column: 3)
!1193 = !DILocation(line: 129, scope: !1192)
!1194 = !DILocation(line: 129, column: 12, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1192, file: !1066, line: 129, column: 3)
!1196 = !DILocation(line: 129, column: 3, scope: !1192)
!1197 = !DILocation(line: 131, column: 22, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1195, file: !1066, line: 129, column: 28)
!1199 = !DILocation(line: 131, column: 11, scope: !1198)
!1200 = !DILocalVariable(name: "t0", scope: !1186, file: !1066, line: 127, type: !86)
!1201 = !DILocation(line: 132, column: 31, scope: !1198)
!1202 = !DILocation(line: 132, column: 8, scope: !1198)
!1203 = !DILocation(line: 133, column: 21, scope: !1198)
!1204 = !DILocation(line: 133, column: 23, scope: !1198)
!1205 = !DILocation(line: 133, column: 10, scope: !1198)
!1206 = !DILocalVariable(name: "t1", scope: !1186, file: !1066, line: 127, type: !86)
!1207 = !DILocation(line: 134, column: 31, scope: !1198)
!1208 = !DILocation(line: 134, column: 8, scope: !1198)
!1209 = !DILocation(line: 135, column: 16, scope: !1198)
!1210 = !DILocation(line: 135, column: 8, scope: !1198)
!1211 = !DILocation(line: 135, column: 5, scope: !1198)
!1212 = !DILocation(line: 135, column: 14, scope: !1198)
!1213 = !DILocation(line: 136, column: 20, scope: !1198)
!1214 = !DILocation(line: 136, column: 29, scope: !1198)
!1215 = !DILocation(line: 136, column: 32, scope: !1198)
!1216 = !DILocation(line: 136, column: 26, scope: !1198)
!1217 = !DILocation(line: 136, column: 8, scope: !1198)
!1218 = !DILocation(line: 136, column: 5, scope: !1198)
!1219 = !DILocation(line: 136, column: 14, scope: !1198)
!1220 = !DILocation(line: 137, column: 20, scope: !1198)
!1221 = !DILocation(line: 137, column: 16, scope: !1198)
!1222 = !DILocation(line: 137, column: 8, scope: !1198)
!1223 = !DILocation(line: 137, column: 5, scope: !1198)
!1224 = !DILocation(line: 137, column: 14, scope: !1198)
!1225 = !DILocation(line: 129, column: 24, scope: !1195)
!1226 = !DILocation(line: 129, column: 3, scope: !1195)
!1227 = distinct !{!1227, !1196, !1228, !130}
!1228 = !DILocation(line: 138, column: 3, scope: !1192)
!1229 = !DILocation(line: 139, column: 1, scope: !1186)
!1230 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !1066, file: !1066, line: 151, type: !1145, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1231 = !DILocalVariable(name: "r", arg: 1, scope: !1230, file: !1066, line: 151, type: !1147)
!1232 = !DILocation(line: 0, scope: !1230)
!1233 = !DILocalVariable(name: "a", arg: 2, scope: !1230, file: !1066, line: 151, type: !275)
!1234 = !DILocalVariable(name: "i", scope: !1230, file: !1066, line: 153, type: !40)
!1235 = !DILocation(line: 154, column: 7, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1230, file: !1066, line: 154, column: 3)
!1237 = !DILocation(line: 154, scope: !1236)
!1238 = !DILocation(line: 154, column: 12, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1236, file: !1066, line: 154, column: 3)
!1240 = !DILocation(line: 154, column: 3, scope: !1236)
!1241 = !DILocation(line: 155, column: 29, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1239, file: !1066, line: 154, column: 28)
!1243 = !DILocation(line: 155, column: 26, scope: !1242)
!1244 = !DILocation(line: 155, column: 57, scope: !1242)
!1245 = !DILocation(line: 155, column: 54, scope: !1242)
!1246 = !DILocation(line: 155, column: 44, scope: !1242)
!1247 = !DILocation(line: 155, column: 63, scope: !1242)
!1248 = !DILocation(line: 155, column: 70, scope: !1242)
!1249 = !DILocation(line: 155, column: 16, scope: !1242)
!1250 = !DILocation(line: 155, column: 5, scope: !1242)
!1251 = !DILocation(line: 155, column: 22, scope: !1242)
!1252 = !DILocation(line: 156, column: 29, scope: !1242)
!1253 = !DILocation(line: 156, column: 26, scope: !1242)
!1254 = !DILocation(line: 156, column: 35, scope: !1242)
!1255 = !DILocation(line: 156, column: 57, scope: !1242)
!1256 = !DILocation(line: 156, column: 54, scope: !1242)
!1257 = !DILocation(line: 156, column: 44, scope: !1242)
!1258 = !DILocation(line: 156, column: 63, scope: !1242)
!1259 = !DILocation(line: 156, column: 41, scope: !1242)
!1260 = !DILocation(line: 156, column: 16, scope: !1242)
!1261 = !DILocation(line: 156, column: 18, scope: !1242)
!1262 = !DILocation(line: 156, column: 5, scope: !1242)
!1263 = !DILocation(line: 156, column: 22, scope: !1242)
!1264 = !DILocation(line: 154, column: 24, scope: !1239)
!1265 = !DILocation(line: 154, column: 3, scope: !1239)
!1266 = distinct !{!1266, !1240, !1267, !130}
!1267 = !DILocation(line: 157, column: 3, scope: !1236)
!1268 = !DILocation(line: 158, column: 1, scope: !1230)
!1269 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !1066, file: !1066, line: 168, type: !1145, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1270 = !DILocalVariable(name: "r", arg: 1, scope: !1269, file: !1066, line: 168, type: !1147)
!1271 = !DILocation(line: 0, scope: !1269)
!1272 = !DILocalVariable(name: "msg", arg: 2, scope: !1269, file: !1066, line: 168, type: !275)
!1273 = !DILocalVariable(name: "i", scope: !1269, file: !1066, line: 170, type: !40)
!1274 = !DILocation(line: 176, column: 7, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1269, file: !1066, line: 176, column: 3)
!1276 = !DILocation(line: 176, scope: !1275)
!1277 = !DILocation(line: 176, column: 12, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1275, file: !1066, line: 176, column: 3)
!1279 = !DILocation(line: 176, column: 3, scope: !1275)
!1280 = !DILocation(line: 177, column: 5, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1282, file: !1066, line: 177, column: 5)
!1282 = distinct !DILexicalBlock(scope: !1278, file: !1066, line: 176, column: 28)
!1283 = !DILocation(line: 177, scope: !1281)
!1284 = !DILocalVariable(name: "j", scope: !1269, file: !1066, line: 170, type: !40)
!1285 = !DILocation(line: 177, column: 14, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1281, file: !1066, line: 177, column: 5)
!1287 = !DILocation(line: 178, column: 18, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1286, file: !1066, line: 177, column: 22)
!1289 = !DILocation(line: 178, column: 20, scope: !1288)
!1290 = !DILocation(line: 178, column: 7, scope: !1288)
!1291 = !DILocation(line: 178, column: 24, scope: !1288)
!1292 = !DILocation(line: 179, column: 27, scope: !1288)
!1293 = !DILocation(line: 179, column: 31, scope: !1288)
!1294 = !DILocation(line: 179, column: 53, scope: !1288)
!1295 = !DILocation(line: 179, column: 60, scope: !1288)
!1296 = !DILocation(line: 179, column: 52, scope: !1288)
!1297 = !DILocation(line: 179, column: 7, scope: !1288)
!1298 = !DILocation(line: 177, column: 18, scope: !1286)
!1299 = !DILocation(line: 177, column: 5, scope: !1286)
!1300 = distinct !{!1300, !1280, !1301, !130}
!1301 = !DILocation(line: 180, column: 5, scope: !1281)
!1302 = !DILocation(line: 176, column: 24, scope: !1278)
!1303 = !DILocation(line: 176, column: 3, scope: !1278)
!1304 = distinct !{!1304, !1279, !1305, !130}
!1305 = !DILocation(line: 181, column: 3, scope: !1275)
!1306 = !DILocation(line: 182, column: 1, scope: !1269)
!1307 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !1066, file: !1066, line: 192, type: !1067, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1308 = !DILocalVariable(name: "msg", arg: 1, scope: !1307, file: !1066, line: 192, type: !32)
!1309 = !DILocation(line: 0, scope: !1307)
!1310 = !DILocalVariable(name: "a", arg: 2, scope: !1307, file: !1066, line: 192, type: !1069)
!1311 = !DILocalVariable(name: "i", scope: !1307, file: !1066, line: 194, type: !40)
!1312 = !DILocation(line: 197, column: 7, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1307, file: !1066, line: 197, column: 3)
!1314 = !DILocation(line: 197, scope: !1313)
!1315 = !DILocation(line: 197, column: 12, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1313, file: !1066, line: 197, column: 3)
!1317 = !DILocation(line: 197, column: 3, scope: !1313)
!1318 = !DILocation(line: 198, column: 5, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1316, file: !1066, line: 197, column: 28)
!1320 = !DILocation(line: 198, column: 12, scope: !1319)
!1321 = !DILocalVariable(name: "j", scope: !1307, file: !1066, line: 194, type: !40)
!1322 = !DILocation(line: 199, column: 9, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1319, file: !1066, line: 199, column: 5)
!1324 = !DILocation(line: 199, scope: !1323)
!1325 = !DILocation(line: 199, column: 14, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1323, file: !1066, line: 199, column: 5)
!1327 = !DILocation(line: 199, column: 5, scope: !1323)
!1328 = !DILocation(line: 200, column: 23, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1326, file: !1066, line: 199, column: 22)
!1330 = !DILocation(line: 200, column: 25, scope: !1329)
!1331 = !DILocation(line: 200, column: 12, scope: !1329)
!1332 = !DILocalVariable(name: "t", scope: !1307, file: !1066, line: 195, type: !91)
!1333 = !DILocation(line: 205, column: 9, scope: !1329)
!1334 = !DILocation(line: 206, column: 9, scope: !1329)
!1335 = !DILocation(line: 207, column: 9, scope: !1329)
!1336 = !DILocation(line: 208, column: 19, scope: !1329)
!1337 = !DILocation(line: 208, column: 7, scope: !1329)
!1338 = !DILocation(line: 208, column: 14, scope: !1329)
!1339 = !DILocation(line: 199, column: 18, scope: !1326)
!1340 = !DILocation(line: 199, column: 5, scope: !1326)
!1341 = distinct !{!1341, !1327, !1342, !130}
!1342 = !DILocation(line: 209, column: 5, scope: !1323)
!1343 = !DILocation(line: 197, column: 24, scope: !1316)
!1344 = !DILocation(line: 197, column: 3, scope: !1316)
!1345 = distinct !{!1345, !1317, !1346, !130}
!1346 = !DILocation(line: 210, column: 3, scope: !1313)
!1347 = !DILocation(line: 211, column: 1, scope: !1307)
!1348 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !1066, file: !1066, line: 225, type: !1349, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{null, !1147, !275, !33}
!1351 = !DILocalVariable(name: "r", arg: 1, scope: !1348, file: !1066, line: 225, type: !1147)
!1352 = !DILocation(line: 0, scope: !1348)
!1353 = !DILocalVariable(name: "seed", arg: 2, scope: !1348, file: !1066, line: 225, type: !275)
!1354 = !DILocalVariable(name: "nonce", arg: 3, scope: !1348, file: !1066, line: 225, type: !33)
!1355 = !DILocalVariable(name: "buf", scope: !1348, file: !1066, line: 227, type: !1356)
!1356 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1357 = !DILocation(line: 227, column: 11, scope: !1348)
!1358 = !DILocation(line: 228, column: 3, scope: !1348)
!1359 = !DILocation(line: 229, column: 3, scope: !1348)
!1360 = !DILocation(line: 230, column: 1, scope: !1348)
!1361 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !1066, file: !1066, line: 244, type: !1349, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1362 = !DILocalVariable(name: "r", arg: 1, scope: !1361, file: !1066, line: 244, type: !1147)
!1363 = !DILocation(line: 0, scope: !1361)
!1364 = !DILocalVariable(name: "seed", arg: 2, scope: !1361, file: !1066, line: 244, type: !275)
!1365 = !DILocalVariable(name: "nonce", arg: 3, scope: !1361, file: !1066, line: 244, type: !33)
!1366 = !DILocalVariable(name: "buf", scope: !1361, file: !1066, line: 246, type: !1356)
!1367 = !DILocation(line: 246, column: 11, scope: !1361)
!1368 = !DILocation(line: 247, column: 3, scope: !1361)
!1369 = !DILocation(line: 248, column: 3, scope: !1361)
!1370 = !DILocation(line: 249, column: 1, scope: !1361)
!1371 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !1066, file: !1066, line: 261, type: !1372, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{null, !1147}
!1374 = !DILocalVariable(name: "r", arg: 1, scope: !1371, file: !1066, line: 261, type: !1147)
!1375 = !DILocation(line: 0, scope: !1371)
!1376 = !DILocation(line: 263, column: 3, scope: !1371)
!1377 = !DILocation(line: 264, column: 3, scope: !1371)
!1378 = !DILocation(line: 265, column: 1, scope: !1371)
!1379 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !1066, file: !1066, line: 323, type: !1372, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1380 = !DILocalVariable(name: "r", arg: 1, scope: !1379, file: !1066, line: 323, type: !1147)
!1381 = !DILocation(line: 0, scope: !1379)
!1382 = !DILocalVariable(name: "i", scope: !1379, file: !1066, line: 325, type: !40)
!1383 = !DILocation(line: 326, column: 7, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1379, file: !1066, line: 326, column: 3)
!1385 = !DILocation(line: 326, scope: !1384)
!1386 = !DILocation(line: 326, column: 12, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1384, file: !1066, line: 326, column: 3)
!1388 = !DILocation(line: 326, column: 3, scope: !1384)
!1389 = !DILocation(line: 327, column: 35, scope: !1387)
!1390 = !DILocation(line: 327, column: 20, scope: !1387)
!1391 = !DILocation(line: 327, column: 5, scope: !1387)
!1392 = !DILocation(line: 327, column: 18, scope: !1387)
!1393 = !DILocation(line: 326, column: 22, scope: !1387)
!1394 = !DILocation(line: 326, column: 3, scope: !1387)
!1395 = distinct !{!1395, !1388, !1396, !130}
!1396 = !DILocation(line: 327, column: 47, scope: !1384)
!1397 = !DILocation(line: 328, column: 1, scope: !1379)
!1398 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !1066, file: !1066, line: 276, type: !1372, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1399 = !DILocalVariable(name: "r", arg: 1, scope: !1398, file: !1066, line: 276, type: !1147)
!1400 = !DILocation(line: 0, scope: !1398)
!1401 = !DILocation(line: 278, column: 3, scope: !1398)
!1402 = !DILocation(line: 279, column: 1, scope: !1398)
!1403 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !1066, file: !1066, line: 290, type: !1404, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{null, !1147, !1069, !1069}
!1406 = !DILocalVariable(name: "r", arg: 1, scope: !1403, file: !1066, line: 290, type: !1147)
!1407 = !DILocation(line: 0, scope: !1403)
!1408 = !DILocalVariable(name: "a", arg: 2, scope: !1403, file: !1066, line: 290, type: !1069)
!1409 = !DILocalVariable(name: "b", arg: 3, scope: !1403, file: !1066, line: 290, type: !1069)
!1410 = !DILocalVariable(name: "i", scope: !1403, file: !1066, line: 292, type: !40)
!1411 = !DILocation(line: 293, column: 7, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1403, file: !1066, line: 293, column: 3)
!1413 = !DILocation(line: 293, scope: !1412)
!1414 = !DILocation(line: 293, column: 12, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1412, file: !1066, line: 293, column: 3)
!1416 = !DILocation(line: 293, column: 3, scope: !1412)
!1417 = !DILocation(line: 294, column: 25, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1415, file: !1066, line: 293, column: 28)
!1419 = !DILocation(line: 294, column: 14, scope: !1418)
!1420 = !DILocation(line: 294, column: 42, scope: !1418)
!1421 = !DILocation(line: 294, column: 31, scope: !1418)
!1422 = !DILocation(line: 294, column: 59, scope: !1418)
!1423 = !DILocation(line: 294, column: 48, scope: !1418)
!1424 = !DILocation(line: 294, column: 72, scope: !1418)
!1425 = !DILocation(line: 294, column: 64, scope: !1418)
!1426 = !DILocation(line: 294, column: 5, scope: !1418)
!1427 = !DILocation(line: 295, column: 25, scope: !1418)
!1428 = !DILocation(line: 295, column: 27, scope: !1418)
!1429 = !DILocation(line: 295, column: 14, scope: !1418)
!1430 = !DILocation(line: 295, column: 44, scope: !1418)
!1431 = !DILocation(line: 295, column: 46, scope: !1418)
!1432 = !DILocation(line: 295, column: 33, scope: !1418)
!1433 = !DILocation(line: 295, column: 63, scope: !1418)
!1434 = !DILocation(line: 295, column: 65, scope: !1418)
!1435 = !DILocation(line: 295, column: 52, scope: !1418)
!1436 = !DILocation(line: 295, column: 79, scope: !1418)
!1437 = !DILocation(line: 295, column: 71, scope: !1418)
!1438 = !DILocation(line: 295, column: 70, scope: !1418)
!1439 = !DILocation(line: 295, column: 5, scope: !1418)
!1440 = !DILocation(line: 293, column: 24, scope: !1415)
!1441 = !DILocation(line: 293, column: 3, scope: !1415)
!1442 = distinct !{!1442, !1416, !1443, !130}
!1443 = !DILocation(line: 296, column: 3, scope: !1412)
!1444 = !DILocation(line: 297, column: 1, scope: !1403)
!1445 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !1066, file: !1066, line: 307, type: !1372, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1446 = !DILocalVariable(name: "r", arg: 1, scope: !1445, file: !1066, line: 307, type: !1147)
!1447 = !DILocation(line: 0, scope: !1445)
!1448 = !DILocalVariable(name: "f", scope: !1445, file: !1066, line: 310, type: !60)
!1449 = !DILocalVariable(name: "i", scope: !1445, file: !1066, line: 309, type: !40)
!1450 = !DILocation(line: 311, column: 7, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1445, file: !1066, line: 311, column: 3)
!1452 = !DILocation(line: 311, scope: !1451)
!1453 = !DILocation(line: 311, column: 12, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1451, file: !1066, line: 311, column: 3)
!1455 = !DILocation(line: 311, column: 3, scope: !1451)
!1456 = !DILocation(line: 312, column: 47, scope: !1454)
!1457 = !DILocation(line: 312, column: 38, scope: !1454)
!1458 = !DILocation(line: 312, column: 59, scope: !1454)
!1459 = !DILocation(line: 312, column: 20, scope: !1454)
!1460 = !DILocation(line: 312, column: 5, scope: !1454)
!1461 = !DILocation(line: 312, column: 18, scope: !1454)
!1462 = !DILocation(line: 311, column: 22, scope: !1454)
!1463 = !DILocation(line: 311, column: 3, scope: !1454)
!1464 = distinct !{!1464, !1455, !1465, !130}
!1465 = !DILocation(line: 312, column: 61, scope: !1451)
!1466 = !DILocation(line: 313, column: 1, scope: !1445)
!1467 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !1066, file: !1066, line: 339, type: !1404, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1468 = !DILocalVariable(name: "r", arg: 1, scope: !1467, file: !1066, line: 339, type: !1147)
!1469 = !DILocation(line: 0, scope: !1467)
!1470 = !DILocalVariable(name: "a", arg: 2, scope: !1467, file: !1066, line: 339, type: !1069)
!1471 = !DILocalVariable(name: "b", arg: 3, scope: !1467, file: !1066, line: 339, type: !1069)
!1472 = !DILocalVariable(name: "i", scope: !1467, file: !1066, line: 341, type: !40)
!1473 = !DILocation(line: 342, column: 7, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1467, file: !1066, line: 342, column: 3)
!1475 = !DILocation(line: 342, scope: !1474)
!1476 = !DILocation(line: 342, column: 12, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1474, file: !1066, line: 342, column: 3)
!1478 = !DILocation(line: 342, column: 3, scope: !1474)
!1479 = !DILocation(line: 343, column: 20, scope: !1477)
!1480 = !DILocation(line: 343, column: 35, scope: !1477)
!1481 = !DILocation(line: 343, column: 33, scope: !1477)
!1482 = !DILocation(line: 343, column: 5, scope: !1477)
!1483 = !DILocation(line: 343, column: 18, scope: !1477)
!1484 = !DILocation(line: 342, column: 22, scope: !1477)
!1485 = !DILocation(line: 342, column: 3, scope: !1477)
!1486 = distinct !{!1486, !1478, !1487, !130}
!1487 = !DILocation(line: 343, column: 46, scope: !1474)
!1488 = !DILocation(line: 344, column: 1, scope: !1467)
!1489 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !1066, file: !1066, line: 355, type: !1404, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1490 = !DILocalVariable(name: "r", arg: 1, scope: !1489, file: !1066, line: 355, type: !1147)
!1491 = !DILocation(line: 0, scope: !1489)
!1492 = !DILocalVariable(name: "a", arg: 2, scope: !1489, file: !1066, line: 355, type: !1069)
!1493 = !DILocalVariable(name: "b", arg: 3, scope: !1489, file: !1066, line: 355, type: !1069)
!1494 = !DILocalVariable(name: "i", scope: !1489, file: !1066, line: 357, type: !40)
!1495 = !DILocation(line: 358, column: 7, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1489, file: !1066, line: 358, column: 3)
!1497 = !DILocation(line: 358, scope: !1496)
!1498 = !DILocation(line: 358, column: 12, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1496, file: !1066, line: 358, column: 3)
!1500 = !DILocation(line: 358, column: 3, scope: !1496)
!1501 = !DILocation(line: 359, column: 20, scope: !1499)
!1502 = !DILocation(line: 359, column: 35, scope: !1499)
!1503 = !DILocation(line: 359, column: 33, scope: !1499)
!1504 = !DILocation(line: 359, column: 5, scope: !1499)
!1505 = !DILocation(line: 359, column: 18, scope: !1499)
!1506 = !DILocation(line: 358, column: 22, scope: !1499)
!1507 = !DILocation(line: 358, column: 3, scope: !1499)
!1508 = distinct !{!1508, !1500, !1509, !130}
!1509 = !DILocation(line: 359, column: 46, scope: !1496)
!1510 = !DILocation(line: 360, column: 1, scope: !1489)
!1511 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !58, file: !58, line: 80, type: !1512, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{null, !451}
!1514 = !DILocalVariable(name: "r", arg: 1, scope: !1511, file: !58, line: 80, type: !451)
!1515 = !DILocation(line: 0, scope: !1511)
!1516 = !DILocalVariable(name: "k", scope: !1511, file: !58, line: 81, type: !40)
!1517 = !DILocalVariable(name: "len", scope: !1511, file: !58, line: 81, type: !40)
!1518 = !DILocation(line: 85, column: 7, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1511, file: !58, line: 85, column: 3)
!1520 = !DILocation(line: 85, scope: !1519)
!1521 = !DILocation(line: 84, column: 5, scope: !1511)
!1522 = !DILocation(line: 85, column: 22, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !58, line: 85, column: 3)
!1524 = !DILocation(line: 85, column: 3, scope: !1519)
!1525 = !DILocation(line: 86, column: 5, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1527, file: !58, line: 86, column: 5)
!1527 = distinct !DILexicalBlock(scope: !1523, file: !58, line: 85, column: 39)
!1528 = !DILocation(line: 86, scope: !1526)
!1529 = !DILocalVariable(name: "start", scope: !1511, file: !58, line: 81, type: !40)
!1530 = !DILocation(line: 86, column: 26, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1526, file: !58, line: 86, column: 5)
!1532 = !DILocation(line: 87, column: 14, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1531, file: !58, line: 86, column: 50)
!1534 = !DILocalVariable(name: "zeta", scope: !1511, file: !58, line: 82, type: !61)
!1535 = !DILocalVariable(name: "j", scope: !1511, file: !58, line: 81, type: !40)
!1536 = !DILocation(line: 88, column: 11, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1533, file: !58, line: 88, column: 7)
!1538 = !DILocation(line: 88, scope: !1537)
!1539 = !DILocation(line: 88, column: 32, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1537, file: !58, line: 88, column: 7)
!1541 = !DILocation(line: 88, column: 24, scope: !1540)
!1542 = !DILocation(line: 88, column: 7, scope: !1537)
!1543 = !DILocation(line: 89, column: 25, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1540, file: !58, line: 88, column: 44)
!1545 = !DILocation(line: 89, column: 13, scope: !1544)
!1546 = !DILocalVariable(name: "t", scope: !1511, file: !58, line: 82, type: !61)
!1547 = !DILocation(line: 90, column: 22, scope: !1544)
!1548 = !DILocation(line: 90, column: 27, scope: !1544)
!1549 = !DILocation(line: 90, column: 9, scope: !1544)
!1550 = !DILocation(line: 90, column: 20, scope: !1544)
!1551 = !DILocation(line: 91, column: 16, scope: !1544)
!1552 = !DILocation(line: 91, column: 21, scope: !1544)
!1553 = !DILocation(line: 91, column: 9, scope: !1544)
!1554 = !DILocation(line: 91, column: 14, scope: !1544)
!1555 = !DILocation(line: 88, column: 40, scope: !1540)
!1556 = !DILocation(line: 88, column: 7, scope: !1540)
!1557 = distinct !{!1557, !1542, !1558, !130}
!1558 = !DILocation(line: 92, column: 7, scope: !1537)
!1559 = !DILocation(line: 87, column: 21, scope: !1533)
!1560 = !DILocation(line: 86, column: 43, scope: !1531)
!1561 = !DILocation(line: 86, column: 5, scope: !1531)
!1562 = distinct !{!1562, !1525, !1563, !130}
!1563 = !DILocation(line: 93, column: 5, scope: !1526)
!1564 = !DILocation(line: 85, column: 32, scope: !1523)
!1565 = !DILocation(line: 85, column: 3, scope: !1523)
!1566 = distinct !{!1566, !1524, !1567, !130}
!1567 = !DILocation(line: 94, column: 3, scope: !1519)
!1568 = !DILocation(line: 95, column: 1, scope: !1511)
!1569 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1570, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1570 = !DISubroutineType(types: !1571)
!1571 = !{!61, !61, !61}
!1572 = !DILocalVariable(name: "a", arg: 1, scope: !1569, file: !58, line: 68, type: !61)
!1573 = !DILocation(line: 0, scope: !1569)
!1574 = !DILocalVariable(name: "b", arg: 2, scope: !1569, file: !58, line: 68, type: !61)
!1575 = !DILocation(line: 69, column: 28, scope: !1569)
!1576 = !DILocation(line: 69, column: 39, scope: !1569)
!1577 = !DILocation(line: 69, column: 38, scope: !1569)
!1578 = !DILocation(line: 69, column: 10, scope: !1569)
!1579 = !DILocation(line: 69, column: 3, scope: !1569)
!1580 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !58, file: !58, line: 106, type: !1512, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1581 = !DILocalVariable(name: "r", arg: 1, scope: !1580, file: !58, line: 106, type: !451)
!1582 = !DILocation(line: 0, scope: !1580)
!1583 = !DILocalVariable(name: "f", scope: !1580, file: !58, line: 109, type: !60)
!1584 = !DILocalVariable(name: "k", scope: !1580, file: !58, line: 107, type: !40)
!1585 = !DILocalVariable(name: "len", scope: !1580, file: !58, line: 107, type: !40)
!1586 = !DILocation(line: 112, column: 7, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1580, file: !58, line: 112, column: 3)
!1588 = !DILocation(line: 112, scope: !1587)
!1589 = !DILocation(line: 111, column: 5, scope: !1580)
!1590 = !DILocation(line: 112, column: 20, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1587, file: !58, line: 112, column: 3)
!1592 = !DILocation(line: 112, column: 3, scope: !1587)
!1593 = !DILocation(line: 113, column: 5, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1595, file: !58, line: 113, column: 5)
!1595 = distinct !DILexicalBlock(scope: !1591, file: !58, line: 112, column: 39)
!1596 = !DILocation(line: 124, column: 3, scope: !1597)
!1597 = distinct !DILexicalBlock(scope: !1580, file: !58, line: 124, column: 3)
!1598 = !DILocation(line: 113, scope: !1594)
!1599 = !DILocalVariable(name: "start", scope: !1580, file: !58, line: 107, type: !40)
!1600 = !DILocation(line: 113, column: 26, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1594, file: !58, line: 113, column: 5)
!1602 = !DILocation(line: 114, column: 14, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1601, file: !58, line: 113, column: 50)
!1604 = !DILocalVariable(name: "zeta", scope: !1580, file: !58, line: 108, type: !61)
!1605 = !DILocalVariable(name: "j", scope: !1580, file: !58, line: 107, type: !40)
!1606 = !DILocation(line: 115, column: 11, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1603, file: !58, line: 115, column: 7)
!1608 = !DILocation(line: 115, scope: !1607)
!1609 = !DILocation(line: 115, column: 32, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1607, file: !58, line: 115, column: 7)
!1611 = !DILocation(line: 115, column: 24, scope: !1610)
!1612 = !DILocation(line: 115, column: 7, scope: !1607)
!1613 = !DILocation(line: 116, column: 13, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1610, file: !58, line: 115, column: 44)
!1615 = !DILocalVariable(name: "t", scope: !1580, file: !58, line: 108, type: !61)
!1616 = !DILocation(line: 117, column: 35, scope: !1614)
!1617 = !DILocation(line: 117, column: 33, scope: !1614)
!1618 = !DILocation(line: 117, column: 16, scope: !1614)
!1619 = !DILocation(line: 117, column: 9, scope: !1614)
!1620 = !DILocation(line: 117, column: 14, scope: !1614)
!1621 = !DILocation(line: 118, column: 22, scope: !1614)
!1622 = !DILocation(line: 118, column: 33, scope: !1614)
!1623 = !DILocation(line: 118, column: 9, scope: !1614)
!1624 = !DILocation(line: 118, column: 20, scope: !1614)
!1625 = !DILocation(line: 119, column: 34, scope: !1614)
!1626 = !DILocation(line: 119, column: 22, scope: !1614)
!1627 = !DILocation(line: 119, column: 9, scope: !1614)
!1628 = !DILocation(line: 119, column: 20, scope: !1614)
!1629 = !DILocation(line: 115, column: 40, scope: !1610)
!1630 = !DILocation(line: 115, column: 7, scope: !1610)
!1631 = distinct !{!1631, !1612, !1632, !130}
!1632 = !DILocation(line: 120, column: 7, scope: !1607)
!1633 = !DILocation(line: 114, column: 21, scope: !1603)
!1634 = !DILocation(line: 113, column: 43, scope: !1601)
!1635 = !DILocation(line: 113, column: 5, scope: !1601)
!1636 = distinct !{!1636, !1593, !1637, !130}
!1637 = !DILocation(line: 121, column: 5, scope: !1594)
!1638 = !DILocation(line: 112, column: 32, scope: !1591)
!1639 = !DILocation(line: 112, column: 3, scope: !1591)
!1640 = distinct !{!1640, !1592, !1641, !130}
!1641 = !DILocation(line: 122, column: 3, scope: !1587)
!1642 = !DILocation(line: 124, scope: !1597)
!1643 = !DILocation(line: 124, column: 16, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1597, file: !58, line: 124, column: 3)
!1645 = !DILocation(line: 125, column: 18, scope: !1644)
!1646 = !DILocation(line: 125, column: 12, scope: !1644)
!1647 = !DILocation(line: 125, column: 5, scope: !1644)
!1648 = !DILocation(line: 125, column: 10, scope: !1644)
!1649 = !DILocation(line: 124, column: 24, scope: !1644)
!1650 = !DILocation(line: 124, column: 3, scope: !1644)
!1651 = distinct !{!1651, !1596, !1652, !130}
!1652 = !DILocation(line: 125, column: 25, scope: !1597)
!1653 = !DILocation(line: 126, column: 1, scope: !1580)
!1654 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !58, file: !58, line: 139, type: !1655, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1655 = !DISubroutineType(types: !1656)
!1656 = !{null, !451, !1657, !1657, !61}
!1657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1658 = !DILocalVariable(name: "r", arg: 1, scope: !1654, file: !58, line: 139, type: !451)
!1659 = !DILocation(line: 0, scope: !1654)
!1660 = !DILocalVariable(name: "a", arg: 2, scope: !1654, file: !58, line: 139, type: !1657)
!1661 = !DILocalVariable(name: "b", arg: 3, scope: !1654, file: !58, line: 139, type: !1657)
!1662 = !DILocalVariable(name: "zeta", arg: 4, scope: !1654, file: !58, line: 139, type: !61)
!1663 = !DILocation(line: 141, column: 17, scope: !1654)
!1664 = !DILocation(line: 141, column: 23, scope: !1654)
!1665 = !DILocation(line: 141, column: 11, scope: !1654)
!1666 = !DILocation(line: 141, column: 9, scope: !1654)
!1667 = !DILocation(line: 142, column: 11, scope: !1654)
!1668 = !DILocation(line: 142, column: 9, scope: !1654)
!1669 = !DILocation(line: 143, column: 17, scope: !1654)
!1670 = !DILocation(line: 143, column: 23, scope: !1654)
!1671 = !DILocation(line: 143, column: 11, scope: !1654)
!1672 = !DILocation(line: 143, column: 8, scope: !1654)
!1673 = !DILocation(line: 144, column: 17, scope: !1654)
!1674 = !DILocation(line: 144, column: 23, scope: !1654)
!1675 = !DILocation(line: 144, column: 11, scope: !1654)
!1676 = !DILocation(line: 144, column: 3, scope: !1654)
!1677 = !DILocation(line: 144, column: 9, scope: !1654)
!1678 = !DILocation(line: 145, column: 17, scope: !1654)
!1679 = !DILocation(line: 145, column: 23, scope: !1654)
!1680 = !DILocation(line: 145, column: 11, scope: !1654)
!1681 = !DILocation(line: 145, column: 3, scope: !1654)
!1682 = !DILocation(line: 145, column: 8, scope: !1654)
!1683 = !DILocation(line: 146, column: 1, scope: !1654)
!1684 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1685, file: !1685, line: 110, type: !1686, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1685 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1686 = !DISubroutineType(types: !1687)
!1687 = !{null, !1688, !275}
!1688 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1689, size: 32)
!1689 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !372, line: 13, baseType: !1690)
!1690 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !372, line: 11, size: 4096, elements: !1691)
!1691 = !{!1692}
!1692 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1690, file: !372, line: 12, baseType: !376, size: 4096)
!1693 = !DILocalVariable(name: "r", arg: 1, scope: !1684, file: !1685, line: 110, type: !1688)
!1694 = !DILocation(line: 0, scope: !1684)
!1695 = !DILocalVariable(name: "buf", arg: 2, scope: !1684, file: !1685, line: 110, type: !275)
!1696 = !DILocation(line: 113, column: 3, scope: !1684)
!1697 = !DILocation(line: 119, column: 1, scope: !1684)
!1698 = distinct !DISubprogram(name: "cbd2", scope: !1685, file: !1685, line: 58, type: !1686, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1699 = !DILocalVariable(name: "r", arg: 1, scope: !1698, file: !1685, line: 58, type: !1688)
!1700 = !DILocation(line: 0, scope: !1698)
!1701 = !DILocalVariable(name: "buf", arg: 2, scope: !1698, file: !1685, line: 58, type: !275)
!1702 = !DILocalVariable(name: "i", scope: !1698, file: !1685, line: 60, type: !40)
!1703 = !DILocation(line: 64, column: 7, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1698, file: !1685, line: 64, column: 3)
!1705 = !DILocation(line: 64, scope: !1704)
!1706 = !DILocation(line: 64, column: 12, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1704, file: !1685, line: 64, column: 3)
!1708 = !DILocation(line: 64, column: 3, scope: !1704)
!1709 = !DILocation(line: 65, column: 35, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1707, file: !1685, line: 64, column: 28)
!1711 = !DILocation(line: 65, column: 33, scope: !1710)
!1712 = !DILocation(line: 65, column: 10, scope: !1710)
!1713 = !DILocalVariable(name: "t", scope: !1698, file: !1685, line: 61, type: !91)
!1714 = !DILocation(line: 66, column: 12, scope: !1710)
!1715 = !DILocalVariable(name: "d", scope: !1698, file: !1685, line: 61, type: !91)
!1716 = !DILocation(line: 67, column: 12, scope: !1710)
!1717 = !DILocation(line: 67, column: 17, scope: !1710)
!1718 = !DILocation(line: 67, column: 7, scope: !1710)
!1719 = !DILocalVariable(name: "j", scope: !1698, file: !1685, line: 60, type: !40)
!1720 = !DILocation(line: 69, column: 9, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1710, file: !1685, line: 69, column: 5)
!1722 = !DILocation(line: 69, scope: !1721)
!1723 = !DILocation(line: 69, column: 14, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1721, file: !1685, line: 69, column: 5)
!1725 = !DILocation(line: 69, column: 5, scope: !1721)
!1726 = !DILocation(line: 70, column: 19, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1724, file: !1685, line: 69, column: 22)
!1728 = !DILocation(line: 70, column: 14, scope: !1727)
!1729 = !DILocation(line: 70, column: 11, scope: !1727)
!1730 = !DILocalVariable(name: "a", scope: !1698, file: !1685, line: 62, type: !61)
!1731 = !DILocation(line: 71, column: 19, scope: !1727)
!1732 = !DILocation(line: 71, column: 21, scope: !1727)
!1733 = !DILocation(line: 71, column: 14, scope: !1727)
!1734 = !DILocation(line: 71, column: 11, scope: !1727)
!1735 = !DILocalVariable(name: "b", scope: !1698, file: !1685, line: 62, type: !61)
!1736 = !DILocation(line: 72, column: 28, scope: !1727)
!1737 = !DILocation(line: 72, column: 26, scope: !1727)
!1738 = !DILocation(line: 72, column: 18, scope: !1727)
!1739 = !DILocation(line: 72, column: 20, scope: !1727)
!1740 = !DILocation(line: 72, column: 7, scope: !1727)
!1741 = !DILocation(line: 72, column: 24, scope: !1727)
!1742 = !DILocation(line: 69, column: 18, scope: !1724)
!1743 = !DILocation(line: 69, column: 5, scope: !1724)
!1744 = distinct !{!1744, !1725, !1745, !130}
!1745 = !DILocation(line: 73, column: 5, scope: !1721)
!1746 = !DILocation(line: 64, column: 24, scope: !1707)
!1747 = !DILocation(line: 64, column: 3, scope: !1707)
!1748 = distinct !{!1748, !1708, !1749, !130}
!1749 = !DILocation(line: 74, column: 3, scope: !1704)
!1750 = !DILocation(line: 75, column: 1, scope: !1698)
!1751 = distinct !DISubprogram(name: "load32_littleendian", scope: !1685, file: !1685, line: 15, type: !1752, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1752 = !DISubroutineType(types: !1753)
!1753 = !{!91, !275}
!1754 = !DILocalVariable(name: "x", arg: 1, scope: !1751, file: !1685, line: 15, type: !275)
!1755 = !DILocation(line: 0, scope: !1751)
!1756 = !DILocation(line: 18, column: 18, scope: !1751)
!1757 = !DILocation(line: 18, column: 8, scope: !1751)
!1758 = !DILocalVariable(name: "r", scope: !1751, file: !1685, line: 17, type: !91)
!1759 = !DILocation(line: 19, column: 18, scope: !1751)
!1760 = !DILocation(line: 19, column: 8, scope: !1751)
!1761 = !DILocation(line: 19, column: 23, scope: !1751)
!1762 = !DILocation(line: 19, column: 5, scope: !1751)
!1763 = !DILocation(line: 20, column: 18, scope: !1751)
!1764 = !DILocation(line: 20, column: 8, scope: !1751)
!1765 = !DILocation(line: 20, column: 23, scope: !1751)
!1766 = !DILocation(line: 20, column: 5, scope: !1751)
!1767 = !DILocation(line: 21, column: 18, scope: !1751)
!1768 = !DILocation(line: 21, column: 8, scope: !1751)
!1769 = !DILocation(line: 21, column: 23, scope: !1751)
!1770 = !DILocation(line: 21, column: 5, scope: !1751)
!1771 = !DILocation(line: 22, column: 3, scope: !1751)
!1772 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1685, file: !1685, line: 121, type: !1686, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1773 = !DILocalVariable(name: "r", arg: 1, scope: !1772, file: !1685, line: 121, type: !1688)
!1774 = !DILocation(line: 0, scope: !1772)
!1775 = !DILocalVariable(name: "buf", arg: 2, scope: !1772, file: !1685, line: 121, type: !275)
!1776 = !DILocation(line: 124, column: 3, scope: !1772)
!1777 = !DILocation(line: 128, column: 1, scope: !1772)
!1778 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1779, file: !1779, line: 16, type: !1780, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1779 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1780 = !DISubroutineType(types: !98)
!1781 = !DILocalVariable(name: "a", arg: 1, scope: !1778, file: !1779, line: 16, type: !55)
!1782 = !DILocation(line: 0, scope: !1778)
!1783 = !DILocalVariable(name: "t", scope: !1778, file: !1779, line: 18, type: !61)
!1784 = !DILocation(line: 21, column: 12, scope: !1778)
!1785 = !DILocation(line: 21, column: 22, scope: !1778)
!1786 = !DILocation(line: 21, column: 10, scope: !1778)
!1787 = !DILocation(line: 21, column: 32, scope: !1778)
!1788 = !DILocation(line: 21, column: 7, scope: !1778)
!1789 = !DILocation(line: 22, column: 3, scope: !1778)
!1790 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1779, file: !1779, line: 35, type: !1791, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1791 = !DISubroutineType(types: !1792)
!1792 = !{!61, !61}
!1793 = !DILocalVariable(name: "a", arg: 1, scope: !1790, file: !1779, line: 35, type: !61)
!1794 = !DILocation(line: 0, scope: !1790)
!1795 = !DILocalVariable(name: "v", scope: !1790, file: !1779, line: 37, type: !60)
!1796 = !DILocation(line: 39, column: 20, scope: !1790)
!1797 = !DILocation(line: 39, column: 19, scope: !1790)
!1798 = !DILocation(line: 39, column: 22, scope: !1790)
!1799 = !DILocation(line: 39, column: 33, scope: !1790)
!1800 = !DILocalVariable(name: "t", scope: !1790, file: !1779, line: 36, type: !61)
!1801 = !DILocation(line: 41, column: 10, scope: !1790)
!1802 = !DILocation(line: 41, column: 3, scope: !1790)
!1803 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1804, file: !1804, line: 16, type: !1805, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1804 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1805 = !DISubroutineType(types: !1806)
!1806 = !{!50, !275, !275, !38}
!1807 = !DILocalVariable(name: "a", arg: 1, scope: !1803, file: !1804, line: 16, type: !275)
!1808 = !DILocation(line: 0, scope: !1803)
!1809 = !DILocalVariable(name: "b", arg: 2, scope: !1803, file: !1804, line: 16, type: !275)
!1810 = !DILocalVariable(name: "len", arg: 3, scope: !1803, file: !1804, line: 16, type: !38)
!1811 = !DILocalVariable(name: "r", scope: !1803, file: !1804, line: 19, type: !33)
!1812 = !DILocalVariable(name: "i", scope: !1803, file: !1804, line: 18, type: !38)
!1813 = !DILocation(line: 21, column: 7, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1803, file: !1804, line: 21, column: 3)
!1815 = !DILocation(line: 21, scope: !1814)
!1816 = !DILocation(line: 21, column: 12, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1814, file: !1804, line: 21, column: 3)
!1818 = !DILocation(line: 21, column: 3, scope: !1814)
!1819 = !DILocation(line: 22, column: 10, scope: !1817)
!1820 = !DILocation(line: 22, column: 17, scope: !1817)
!1821 = !DILocation(line: 22, column: 15, scope: !1817)
!1822 = !DILocation(line: 22, column: 7, scope: !1817)
!1823 = !DILocation(line: 21, column: 18, scope: !1817)
!1824 = !DILocation(line: 21, column: 3, scope: !1817)
!1825 = distinct !{!1825, !1818, !1826, !130}
!1826 = !DILocation(line: 22, column: 20, scope: !1814)
!1827 = !DILocation(line: 24, column: 25, scope: !1803)
!1828 = !DILocation(line: 24, column: 10, scope: !1803)
!1829 = !DILocation(line: 24, column: 3, scope: !1803)
!1830 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1804, file: !1804, line: 40, type: !1831, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1831 = !DISubroutineType(types: !1832)
!1832 = !{null, !32, !275, !38, !33}
!1833 = !DILocalVariable(name: "r", arg: 1, scope: !1830, file: !1804, line: 40, type: !32)
!1834 = !DILocation(line: 0, scope: !1830)
!1835 = !DILocalVariable(name: "x", arg: 2, scope: !1830, file: !1804, line: 40, type: !275)
!1836 = !DILocalVariable(name: "len", arg: 3, scope: !1830, file: !1804, line: 40, type: !38)
!1837 = !DILocalVariable(name: "b", arg: 4, scope: !1830, file: !1804, line: 40, type: !33)
!1838 = !DILocation(line: 51, column: 3, scope: !1830)
!1839 = !{i64 1722}
!1840 = !DILocation(line: 54, column: 7, scope: !1830)
!1841 = !DILocalVariable(name: "i", scope: !1830, file: !1804, line: 42, type: !38)
!1842 = !DILocation(line: 55, column: 7, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1830, file: !1804, line: 55, column: 3)
!1844 = !DILocation(line: 55, scope: !1843)
!1845 = !DILocation(line: 55, column: 12, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1843, file: !1804, line: 55, column: 3)
!1847 = !DILocation(line: 55, column: 3, scope: !1843)
!1848 = !DILocation(line: 56, column: 18, scope: !1846)
!1849 = !DILocation(line: 56, column: 25, scope: !1846)
!1850 = !DILocation(line: 56, column: 23, scope: !1846)
!1851 = !DILocation(line: 56, column: 15, scope: !1846)
!1852 = !DILocation(line: 56, column: 5, scope: !1846)
!1853 = !DILocation(line: 56, column: 10, scope: !1846)
!1854 = !DILocation(line: 55, column: 18, scope: !1846)
!1855 = !DILocation(line: 55, column: 3, scope: !1846)
!1856 = distinct !{!1856, !1847, !1857, !130}
!1857 = !DILocation(line: 56, column: 29, scope: !1843)
!1858 = !DILocation(line: 57, column: 1, scope: !1830)
!1859 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1804, file: !1804, line: 71, type: !1860, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1860 = !DISubroutineType(types: !1861)
!1861 = !{null, !451, !61, !86}
!1862 = !DILocalVariable(name: "r", arg: 1, scope: !1859, file: !1804, line: 71, type: !451)
!1863 = !DILocation(line: 0, scope: !1859)
!1864 = !DILocalVariable(name: "v", arg: 2, scope: !1859, file: !1804, line: 71, type: !61)
!1865 = !DILocalVariable(name: "b", arg: 3, scope: !1859, file: !1804, line: 71, type: !86)
!1866 = !DILocation(line: 73, column: 7, scope: !1859)
!1867 = !DILocation(line: 74, column: 15, scope: !1859)
!1868 = !DILocation(line: 74, column: 19, scope: !1859)
!1869 = !DILocation(line: 74, column: 11, scope: !1859)
!1870 = !DILocation(line: 74, column: 6, scope: !1859)
!1871 = !DILocation(line: 75, column: 1, scope: !1859)
!1872 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !1873, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1873 = !DISubroutineType(types: !1874)
!1874 = !{null, !1875}
!1875 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1876, size: 32)
!1876 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !394, line: 17, baseType: !1877)
!1877 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !394, line: 14, size: 1664, elements: !1878)
!1878 = !{!1879, !1880}
!1879 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1877, file: !394, line: 15, baseType: !398, size: 1600)
!1880 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1877, file: !394, line: 16, baseType: !40, size: 32, offset: 1600)
!1881 = !DILocalVariable(name: "state", arg: 1, scope: !1872, file: !74, line: 523, type: !1875)
!1882 = !DILocation(line: 0, scope: !1872)
!1883 = !DILocation(line: 525, column: 3, scope: !1872)
!1884 = !DILocation(line: 526, column: 10, scope: !1872)
!1885 = !DILocation(line: 526, column: 14, scope: !1872)
!1886 = !DILocation(line: 527, column: 1, scope: !1872)
!1887 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !1888, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1888 = !DISubroutineType(types: !1889)
!1889 = !{null, !1890}
!1890 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!1891 = !DILocalVariable(name: "s", arg: 1, scope: !1887, file: !74, line: 353, type: !1890)
!1892 = !DILocation(line: 0, scope: !1887)
!1893 = !DILocalVariable(name: "i", scope: !1887, file: !74, line: 355, type: !40)
!1894 = !DILocation(line: 356, column: 7, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1887, file: !74, line: 356, column: 3)
!1896 = !DILocation(line: 356, scope: !1895)
!1897 = !DILocation(line: 356, column: 12, scope: !1898)
!1898 = distinct !DILexicalBlock(scope: !1895, file: !74, line: 356, column: 3)
!1899 = !DILocation(line: 356, column: 3, scope: !1895)
!1900 = !DILocation(line: 357, column: 5, scope: !1898)
!1901 = !DILocation(line: 357, column: 10, scope: !1898)
!1902 = !DILocation(line: 356, column: 17, scope: !1898)
!1903 = !DILocation(line: 356, column: 3, scope: !1898)
!1904 = distinct !{!1904, !1899, !1905, !130}
!1905 = !DILocation(line: 357, column: 12, scope: !1895)
!1906 = !DILocation(line: 358, column: 1, scope: !1887)
!1907 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !1908, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1908 = !DISubroutineType(types: !1909)
!1909 = !{null, !1875, !275, !38}
!1910 = !DILocalVariable(name: "state", arg: 1, scope: !1907, file: !74, line: 538, type: !1875)
!1911 = !DILocation(line: 0, scope: !1907)
!1912 = !DILocalVariable(name: "in", arg: 2, scope: !1907, file: !74, line: 538, type: !275)
!1913 = !DILocalVariable(name: "inlen", arg: 3, scope: !1907, file: !74, line: 538, type: !38)
!1914 = !DILocation(line: 540, column: 47, scope: !1907)
!1915 = !DILocation(line: 540, column: 16, scope: !1907)
!1916 = !DILocation(line: 540, column: 10, scope: !1907)
!1917 = !DILocation(line: 540, column: 14, scope: !1907)
!1918 = !DILocation(line: 541, column: 1, scope: !1907)
!1919 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !1920, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1920 = !DISubroutineType(types: !1921)
!1921 = !{!40, !1890, !40, !40, !275, !38}
!1922 = !DILocalVariable(name: "s", arg: 1, scope: !1919, file: !74, line: 373, type: !1890)
!1923 = !DILocation(line: 0, scope: !1919)
!1924 = !DILocalVariable(name: "pos", arg: 2, scope: !1919, file: !74, line: 374, type: !40)
!1925 = !DILocalVariable(name: "r", arg: 3, scope: !1919, file: !74, line: 375, type: !40)
!1926 = !DILocalVariable(name: "in", arg: 4, scope: !1919, file: !74, line: 376, type: !275)
!1927 = !DILocalVariable(name: "inlen", arg: 5, scope: !1919, file: !74, line: 377, type: !38)
!1928 = !DILocation(line: 381, column: 3, scope: !1919)
!1929 = !DILocation(line: 381, column: 12, scope: !1919)
!1930 = !DILocation(line: 381, column: 19, scope: !1919)
!1931 = !DILocation(line: 382, column: 5, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1933, file: !74, line: 382, column: 5)
!1933 = distinct !DILexicalBlock(scope: !1919, file: !74, line: 381, column: 25)
!1934 = !DILocation(line: 389, column: 3, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1919, file: !74, line: 389, column: 3)
!1936 = !DILocation(line: 382, scope: !1932)
!1937 = !DILocalVariable(name: "i", scope: !1919, file: !74, line: 379, type: !40)
!1938 = !DILocation(line: 382, column: 16, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1932, file: !74, line: 382, column: 5)
!1940 = !DILocation(line: 383, column: 27, scope: !1939)
!1941 = !DILocation(line: 383, column: 17, scope: !1939)
!1942 = !DILocation(line: 383, column: 37, scope: !1939)
!1943 = !DILocation(line: 383, column: 33, scope: !1939)
!1944 = !DILocation(line: 383, column: 10, scope: !1939)
!1945 = !DILocation(line: 383, column: 7, scope: !1939)
!1946 = !DILocation(line: 383, column: 14, scope: !1939)
!1947 = !DILocation(line: 383, column: 30, scope: !1939)
!1948 = !DILocation(line: 382, column: 20, scope: !1939)
!1949 = !DILocation(line: 382, column: 5, scope: !1939)
!1950 = distinct !{!1950, !1931, !1951, !130}
!1951 = !DILocation(line: 383, column: 42, scope: !1932)
!1952 = !DILocation(line: 384, column: 15, scope: !1933)
!1953 = !DILocation(line: 384, column: 11, scope: !1933)
!1954 = !DILocation(line: 385, column: 5, scope: !1933)
!1955 = distinct !{!1955, !1928, !1956, !130}
!1956 = !DILocation(line: 387, column: 3, scope: !1919)
!1957 = !DILocation(line: 389, scope: !1935)
!1958 = !DILocation(line: 389, column: 18, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1935, file: !74, line: 389, column: 3)
!1960 = !DILocation(line: 389, column: 14, scope: !1959)
!1961 = !DILocation(line: 390, column: 25, scope: !1959)
!1962 = !DILocation(line: 390, column: 15, scope: !1959)
!1963 = !DILocation(line: 390, column: 35, scope: !1959)
!1964 = !DILocation(line: 390, column: 31, scope: !1959)
!1965 = !DILocation(line: 390, column: 8, scope: !1959)
!1966 = !DILocation(line: 390, column: 5, scope: !1959)
!1967 = !DILocation(line: 390, column: 12, scope: !1959)
!1968 = !DILocation(line: 390, column: 28, scope: !1959)
!1969 = !DILocation(line: 389, column: 26, scope: !1959)
!1970 = !DILocation(line: 389, column: 3, scope: !1959)
!1971 = distinct !{!1971, !1934, !1972, !130}
!1972 = !DILocation(line: 390, column: 40, scope: !1935)
!1973 = !DILocation(line: 392, column: 3, scope: !1919)
!1974 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !1888, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1975 = !DILocalVariable(name: "state", arg: 1, scope: !1974, file: !74, line: 82, type: !1890)
!1976 = !DILocation(line: 0, scope: !1974)
!1977 = !DILocation(line: 100, column: 15, scope: !1974)
!1978 = !DILocalVariable(name: "Aba", scope: !1974, file: !74, line: 86, type: !70)
!1979 = !DILocation(line: 101, column: 15, scope: !1974)
!1980 = !DILocalVariable(name: "Abe", scope: !1974, file: !74, line: 86, type: !70)
!1981 = !DILocation(line: 102, column: 15, scope: !1974)
!1982 = !DILocalVariable(name: "Abi", scope: !1974, file: !74, line: 86, type: !70)
!1983 = !DILocation(line: 103, column: 15, scope: !1974)
!1984 = !DILocalVariable(name: "Abo", scope: !1974, file: !74, line: 86, type: !70)
!1985 = !DILocation(line: 104, column: 15, scope: !1974)
!1986 = !DILocalVariable(name: "Abu", scope: !1974, file: !74, line: 86, type: !70)
!1987 = !DILocation(line: 105, column: 15, scope: !1974)
!1988 = !DILocalVariable(name: "Aga", scope: !1974, file: !74, line: 87, type: !70)
!1989 = !DILocation(line: 106, column: 15, scope: !1974)
!1990 = !DILocalVariable(name: "Age", scope: !1974, file: !74, line: 87, type: !70)
!1991 = !DILocation(line: 107, column: 15, scope: !1974)
!1992 = !DILocalVariable(name: "Agi", scope: !1974, file: !74, line: 87, type: !70)
!1993 = !DILocation(line: 108, column: 15, scope: !1974)
!1994 = !DILocalVariable(name: "Ago", scope: !1974, file: !74, line: 87, type: !70)
!1995 = !DILocation(line: 109, column: 15, scope: !1974)
!1996 = !DILocalVariable(name: "Agu", scope: !1974, file: !74, line: 87, type: !70)
!1997 = !DILocation(line: 110, column: 15, scope: !1974)
!1998 = !DILocalVariable(name: "Aka", scope: !1974, file: !74, line: 88, type: !70)
!1999 = !DILocation(line: 111, column: 15, scope: !1974)
!2000 = !DILocalVariable(name: "Ake", scope: !1974, file: !74, line: 88, type: !70)
!2001 = !DILocation(line: 112, column: 15, scope: !1974)
!2002 = !DILocalVariable(name: "Aki", scope: !1974, file: !74, line: 88, type: !70)
!2003 = !DILocation(line: 113, column: 15, scope: !1974)
!2004 = !DILocalVariable(name: "Ako", scope: !1974, file: !74, line: 88, type: !70)
!2005 = !DILocation(line: 114, column: 15, scope: !1974)
!2006 = !DILocalVariable(name: "Aku", scope: !1974, file: !74, line: 88, type: !70)
!2007 = !DILocation(line: 115, column: 15, scope: !1974)
!2008 = !DILocalVariable(name: "Ama", scope: !1974, file: !74, line: 89, type: !70)
!2009 = !DILocation(line: 116, column: 15, scope: !1974)
!2010 = !DILocalVariable(name: "Ame", scope: !1974, file: !74, line: 89, type: !70)
!2011 = !DILocation(line: 117, column: 15, scope: !1974)
!2012 = !DILocalVariable(name: "Ami", scope: !1974, file: !74, line: 89, type: !70)
!2013 = !DILocation(line: 118, column: 15, scope: !1974)
!2014 = !DILocalVariable(name: "Amo", scope: !1974, file: !74, line: 89, type: !70)
!2015 = !DILocation(line: 119, column: 15, scope: !1974)
!2016 = !DILocalVariable(name: "Amu", scope: !1974, file: !74, line: 89, type: !70)
!2017 = !DILocation(line: 120, column: 15, scope: !1974)
!2018 = !DILocalVariable(name: "Asa", scope: !1974, file: !74, line: 90, type: !70)
!2019 = !DILocation(line: 121, column: 15, scope: !1974)
!2020 = !DILocalVariable(name: "Ase", scope: !1974, file: !74, line: 90, type: !70)
!2021 = !DILocation(line: 122, column: 15, scope: !1974)
!2022 = !DILocalVariable(name: "Asi", scope: !1974, file: !74, line: 90, type: !70)
!2023 = !DILocation(line: 123, column: 15, scope: !1974)
!2024 = !DILocalVariable(name: "Aso", scope: !1974, file: !74, line: 90, type: !70)
!2025 = !DILocation(line: 124, column: 15, scope: !1974)
!2026 = !DILocalVariable(name: "Asu", scope: !1974, file: !74, line: 90, type: !70)
!2027 = !DILocalVariable(name: "round", scope: !1974, file: !74, line: 84, type: !50)
!2028 = !DILocation(line: 126, column: 13, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !1974, file: !74, line: 126, column: 9)
!2030 = !DILocation(line: 126, scope: !2029)
!2031 = !DILocation(line: 126, column: 30, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2029, file: !74, line: 126, column: 9)
!2033 = !DILocation(line: 126, column: 9, scope: !2029)
!2034 = !DILocalVariable(name: "BCa", scope: !1974, file: !74, line: 91, type: !70)
!2035 = !DILocalVariable(name: "BCe", scope: !1974, file: !74, line: 91, type: !70)
!2036 = !DILocalVariable(name: "BCi", scope: !1974, file: !74, line: 91, type: !70)
!2037 = !DILocalVariable(name: "BCo", scope: !1974, file: !74, line: 91, type: !70)
!2038 = !DILocalVariable(name: "BCu", scope: !1974, file: !74, line: 91, type: !70)
!2039 = !DILocalVariable(name: "Da", scope: !1974, file: !74, line: 92, type: !70)
!2040 = !DILocalVariable(name: "De", scope: !1974, file: !74, line: 92, type: !70)
!2041 = !DILocalVariable(name: "Di", scope: !1974, file: !74, line: 92, type: !70)
!2042 = !DILocalVariable(name: "Do", scope: !1974, file: !74, line: 92, type: !70)
!2043 = !DILocalVariable(name: "Du", scope: !1974, file: !74, line: 92, type: !70)
!2044 = !DILocalVariable(name: "Eba", scope: !1974, file: !74, line: 93, type: !70)
!2045 = !DILocalVariable(name: "Ebe", scope: !1974, file: !74, line: 93, type: !70)
!2046 = !DILocalVariable(name: "Ebi", scope: !1974, file: !74, line: 93, type: !70)
!2047 = !DILocalVariable(name: "Ebo", scope: !1974, file: !74, line: 93, type: !70)
!2048 = !DILocalVariable(name: "Ebu", scope: !1974, file: !74, line: 93, type: !70)
!2049 = !DILocalVariable(name: "Ega", scope: !1974, file: !74, line: 94, type: !70)
!2050 = !DILocalVariable(name: "Ege", scope: !1974, file: !74, line: 94, type: !70)
!2051 = !DILocalVariable(name: "Egi", scope: !1974, file: !74, line: 94, type: !70)
!2052 = !DILocalVariable(name: "Ego", scope: !1974, file: !74, line: 94, type: !70)
!2053 = !DILocalVariable(name: "Egu", scope: !1974, file: !74, line: 94, type: !70)
!2054 = !DILocalVariable(name: "Eka", scope: !1974, file: !74, line: 95, type: !70)
!2055 = !DILocalVariable(name: "Eke", scope: !1974, file: !74, line: 95, type: !70)
!2056 = !DILocalVariable(name: "Eki", scope: !1974, file: !74, line: 95, type: !70)
!2057 = !DILocalVariable(name: "Eko", scope: !1974, file: !74, line: 95, type: !70)
!2058 = !DILocalVariable(name: "Eku", scope: !1974, file: !74, line: 95, type: !70)
!2059 = !DILocalVariable(name: "Ema", scope: !1974, file: !74, line: 96, type: !70)
!2060 = !DILocalVariable(name: "Eme", scope: !1974, file: !74, line: 96, type: !70)
!2061 = !DILocalVariable(name: "Emi", scope: !1974, file: !74, line: 96, type: !70)
!2062 = !DILocalVariable(name: "Emo", scope: !1974, file: !74, line: 96, type: !70)
!2063 = !DILocalVariable(name: "Emu", scope: !1974, file: !74, line: 96, type: !70)
!2064 = !DILocalVariable(name: "Esa", scope: !1974, file: !74, line: 97, type: !70)
!2065 = !DILocalVariable(name: "Ese", scope: !1974, file: !74, line: 97, type: !70)
!2066 = !DILocalVariable(name: "Esi", scope: !1974, file: !74, line: 97, type: !70)
!2067 = !DILocalVariable(name: "Eso", scope: !1974, file: !74, line: 97, type: !70)
!2068 = !DILocalVariable(name: "Esu", scope: !1974, file: !74, line: 97, type: !70)
!2069 = !DILocation(line: 130, column: 22, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2032, file: !74, line: 126, column: 53)
!2071 = !DILocation(line: 130, column: 26, scope: !2070)
!2072 = !DILocation(line: 130, column: 30, scope: !2070)
!2073 = !DILocation(line: 130, column: 34, scope: !2070)
!2074 = !DILocation(line: 132, column: 22, scope: !2070)
!2075 = !DILocation(line: 132, column: 26, scope: !2070)
!2076 = !DILocation(line: 132, column: 30, scope: !2070)
!2077 = !DILocation(line: 132, column: 34, scope: !2070)
!2078 = !DILocation(line: 138, column: 22, scope: !2070)
!2079 = !DILocation(line: 138, column: 21, scope: !2070)
!2080 = !DILocation(line: 208, column: 17, scope: !2070)
!2081 = !DILocation(line: 209, column: 19, scope: !2070)
!2082 = !DILocation(line: 129, column: 22, scope: !2070)
!2083 = !DILocation(line: 129, column: 26, scope: !2070)
!2084 = !DILocation(line: 129, column: 30, scope: !2070)
!2085 = !DILocation(line: 129, column: 34, scope: !2070)
!2086 = !DILocation(line: 135, column: 22, scope: !2070)
!2087 = !DILocation(line: 135, column: 21, scope: !2070)
!2088 = !DILocation(line: 212, column: 17, scope: !2070)
!2089 = !DILocation(line: 213, column: 19, scope: !2070)
!2090 = !DILocation(line: 131, column: 22, scope: !2070)
!2091 = !DILocation(line: 131, column: 26, scope: !2070)
!2092 = !DILocation(line: 131, column: 30, scope: !2070)
!2093 = !DILocation(line: 131, column: 34, scope: !2070)
!2094 = !DILocation(line: 128, column: 22, scope: !2070)
!2095 = !DILocation(line: 128, column: 26, scope: !2070)
!2096 = !DILocation(line: 128, column: 30, scope: !2070)
!2097 = !DILocation(line: 128, column: 34, scope: !2070)
!2098 = !DILocation(line: 139, column: 22, scope: !2070)
!2099 = !DILocation(line: 139, column: 21, scope: !2070)
!2100 = !DILocation(line: 210, column: 17, scope: !2070)
!2101 = !DILocation(line: 211, column: 19, scope: !2070)
!2102 = !DILocation(line: 217, column: 28, scope: !2070)
!2103 = !DILocation(line: 217, column: 33, scope: !2070)
!2104 = !DILocation(line: 217, column: 25, scope: !2070)
!2105 = !DILocation(line: 137, column: 22, scope: !2070)
!2106 = !DILocation(line: 137, column: 21, scope: !2070)
!2107 = !DILocation(line: 145, column: 17, scope: !2070)
!2108 = !DILocation(line: 146, column: 19, scope: !2070)
!2109 = !DILocation(line: 136, column: 22, scope: !2070)
!2110 = !DILocation(line: 136, column: 21, scope: !2070)
!2111 = !DILocation(line: 143, column: 17, scope: !2070)
!2112 = !DILocation(line: 144, column: 19, scope: !2070)
!2113 = !DILocation(line: 151, column: 28, scope: !2070)
!2114 = !DILocation(line: 151, column: 33, scope: !2070)
!2115 = !DILocation(line: 152, column: 30, scope: !2070)
!2116 = !DILocation(line: 152, column: 17, scope: !2070)
!2117 = !DILocation(line: 141, column: 17, scope: !2070)
!2118 = !DILocation(line: 158, column: 17, scope: !2070)
!2119 = !DILocation(line: 159, column: 19, scope: !2070)
!2120 = !DILocation(line: 162, column: 17, scope: !2070)
!2121 = !DILocation(line: 163, column: 19, scope: !2070)
!2122 = !DILocation(line: 160, column: 17, scope: !2070)
!2123 = !DILocation(line: 161, column: 19, scope: !2070)
!2124 = !DILocation(line: 168, column: 28, scope: !2070)
!2125 = !DILocation(line: 168, column: 33, scope: !2070)
!2126 = !DILocation(line: 168, column: 25, scope: !2070)
!2127 = !DILocation(line: 223, column: 22, scope: !2070)
!2128 = !DILocation(line: 174, column: 17, scope: !2070)
!2129 = !DILocation(line: 175, column: 19, scope: !2070)
!2130 = !DILocation(line: 178, column: 17, scope: !2070)
!2131 = !DILocation(line: 179, column: 19, scope: !2070)
!2132 = !DILocation(line: 176, column: 17, scope: !2070)
!2133 = !DILocation(line: 177, column: 19, scope: !2070)
!2134 = !DILocation(line: 184, column: 28, scope: !2070)
!2135 = !DILocation(line: 184, column: 33, scope: !2070)
!2136 = !DILocation(line: 184, column: 25, scope: !2070)
!2137 = !DILocation(line: 223, column: 26, scope: !2070)
!2138 = !DILocation(line: 190, column: 17, scope: !2070)
!2139 = !DILocation(line: 191, column: 19, scope: !2070)
!2140 = !DILocation(line: 194, column: 17, scope: !2070)
!2141 = !DILocation(line: 195, column: 19, scope: !2070)
!2142 = !DILocation(line: 192, column: 17, scope: !2070)
!2143 = !DILocation(line: 193, column: 19, scope: !2070)
!2144 = !DILocation(line: 200, column: 28, scope: !2070)
!2145 = !DILocation(line: 200, column: 33, scope: !2070)
!2146 = !DILocation(line: 200, column: 25, scope: !2070)
!2147 = !DILocation(line: 223, column: 30, scope: !2070)
!2148 = !DILocation(line: 206, column: 17, scope: !2070)
!2149 = !DILocation(line: 207, column: 19, scope: !2070)
!2150 = !DILocation(line: 216, column: 28, scope: !2070)
!2151 = !DILocation(line: 216, column: 33, scope: !2070)
!2152 = !DILocation(line: 216, column: 25, scope: !2070)
!2153 = !DILocation(line: 223, column: 34, scope: !2070)
!2154 = !DILocation(line: 149, column: 17, scope: !2070)
!2155 = !DILocation(line: 150, column: 19, scope: !2070)
!2156 = !DILocation(line: 147, column: 17, scope: !2070)
!2157 = !DILocation(line: 148, column: 19, scope: !2070)
!2158 = !DILocation(line: 154, column: 28, scope: !2070)
!2159 = !DILocation(line: 154, column: 33, scope: !2070)
!2160 = !DILocation(line: 154, column: 25, scope: !2070)
!2161 = !DILocation(line: 166, column: 17, scope: !2070)
!2162 = !DILocation(line: 167, column: 19, scope: !2070)
!2163 = !DILocation(line: 164, column: 17, scope: !2070)
!2164 = !DILocation(line: 165, column: 19, scope: !2070)
!2165 = !DILocation(line: 170, column: 28, scope: !2070)
!2166 = !DILocation(line: 170, column: 33, scope: !2070)
!2167 = !DILocation(line: 170, column: 25, scope: !2070)
!2168 = !DILocation(line: 225, column: 22, scope: !2070)
!2169 = !DILocation(line: 182, column: 17, scope: !2070)
!2170 = !DILocation(line: 183, column: 19, scope: !2070)
!2171 = !DILocation(line: 180, column: 17, scope: !2070)
!2172 = !DILocation(line: 181, column: 19, scope: !2070)
!2173 = !DILocation(line: 186, column: 28, scope: !2070)
!2174 = !DILocation(line: 186, column: 33, scope: !2070)
!2175 = !DILocation(line: 186, column: 25, scope: !2070)
!2176 = !DILocation(line: 225, column: 26, scope: !2070)
!2177 = !DILocation(line: 198, column: 17, scope: !2070)
!2178 = !DILocation(line: 199, column: 19, scope: !2070)
!2179 = !DILocation(line: 196, column: 17, scope: !2070)
!2180 = !DILocation(line: 197, column: 19, scope: !2070)
!2181 = !DILocation(line: 202, column: 28, scope: !2070)
!2182 = !DILocation(line: 202, column: 33, scope: !2070)
!2183 = !DILocation(line: 202, column: 25, scope: !2070)
!2184 = !DILocation(line: 225, column: 30, scope: !2070)
!2185 = !DILocation(line: 214, column: 17, scope: !2070)
!2186 = !DILocation(line: 215, column: 19, scope: !2070)
!2187 = !DILocation(line: 218, column: 28, scope: !2070)
!2188 = !DILocation(line: 218, column: 33, scope: !2070)
!2189 = !DILocation(line: 218, column: 25, scope: !2070)
!2190 = !DILocation(line: 225, column: 34, scope: !2070)
!2191 = !DILocation(line: 231, column: 22, scope: !2070)
!2192 = !DILocation(line: 231, column: 21, scope: !2070)
!2193 = !DILocation(line: 309, column: 17, scope: !2070)
!2194 = !DILocation(line: 310, column: 19, scope: !2070)
!2195 = !DILocation(line: 171, column: 28, scope: !2070)
!2196 = !DILocation(line: 171, column: 33, scope: !2070)
!2197 = !DILocation(line: 171, column: 25, scope: !2070)
!2198 = !DILocation(line: 156, column: 28, scope: !2070)
!2199 = !DILocation(line: 156, column: 33, scope: !2070)
!2200 = !DILocation(line: 156, column: 25, scope: !2070)
!2201 = !DILocation(line: 172, column: 28, scope: !2070)
!2202 = !DILocation(line: 172, column: 33, scope: !2070)
!2203 = !DILocation(line: 172, column: 25, scope: !2070)
!2204 = !DILocation(line: 227, column: 22, scope: !2070)
!2205 = !DILocation(line: 188, column: 28, scope: !2070)
!2206 = !DILocation(line: 188, column: 33, scope: !2070)
!2207 = !DILocation(line: 188, column: 25, scope: !2070)
!2208 = !DILocation(line: 227, column: 26, scope: !2070)
!2209 = !DILocation(line: 204, column: 28, scope: !2070)
!2210 = !DILocation(line: 204, column: 33, scope: !2070)
!2211 = !DILocation(line: 204, column: 25, scope: !2070)
!2212 = !DILocation(line: 227, column: 30, scope: !2070)
!2213 = !DILocation(line: 220, column: 28, scope: !2070)
!2214 = !DILocation(line: 220, column: 33, scope: !2070)
!2215 = !DILocation(line: 220, column: 25, scope: !2070)
!2216 = !DILocation(line: 227, column: 34, scope: !2070)
!2217 = !DILocation(line: 233, column: 22, scope: !2070)
!2218 = !DILocation(line: 233, column: 21, scope: !2070)
!2219 = !DILocation(line: 303, column: 17, scope: !2070)
!2220 = !DILocation(line: 304, column: 19, scope: !2070)
!2221 = !DILocation(line: 153, column: 28, scope: !2070)
!2222 = !DILocation(line: 153, column: 33, scope: !2070)
!2223 = !DILocation(line: 153, column: 25, scope: !2070)
!2224 = !DILocation(line: 169, column: 28, scope: !2070)
!2225 = !DILocation(line: 169, column: 33, scope: !2070)
!2226 = !DILocation(line: 169, column: 25, scope: !2070)
!2227 = !DILocation(line: 224, column: 22, scope: !2070)
!2228 = !DILocation(line: 185, column: 28, scope: !2070)
!2229 = !DILocation(line: 185, column: 33, scope: !2070)
!2230 = !DILocation(line: 185, column: 25, scope: !2070)
!2231 = !DILocation(line: 224, column: 26, scope: !2070)
!2232 = !DILocation(line: 201, column: 28, scope: !2070)
!2233 = !DILocation(line: 201, column: 33, scope: !2070)
!2234 = !DILocation(line: 201, column: 25, scope: !2070)
!2235 = !DILocation(line: 224, column: 30, scope: !2070)
!2236 = !DILocation(line: 224, column: 34, scope: !2070)
!2237 = !DILocation(line: 155, column: 28, scope: !2070)
!2238 = !DILocation(line: 155, column: 33, scope: !2070)
!2239 = !DILocation(line: 155, column: 25, scope: !2070)
!2240 = !DILocation(line: 226, column: 22, scope: !2070)
!2241 = !DILocation(line: 187, column: 28, scope: !2070)
!2242 = !DILocation(line: 187, column: 33, scope: !2070)
!2243 = !DILocation(line: 187, column: 25, scope: !2070)
!2244 = !DILocation(line: 226, column: 26, scope: !2070)
!2245 = !DILocation(line: 203, column: 28, scope: !2070)
!2246 = !DILocation(line: 203, column: 33, scope: !2070)
!2247 = !DILocation(line: 203, column: 25, scope: !2070)
!2248 = !DILocation(line: 226, column: 30, scope: !2070)
!2249 = !DILocation(line: 219, column: 28, scope: !2070)
!2250 = !DILocation(line: 219, column: 33, scope: !2070)
!2251 = !DILocation(line: 219, column: 25, scope: !2070)
!2252 = !DILocation(line: 226, column: 34, scope: !2070)
!2253 = !DILocation(line: 232, column: 22, scope: !2070)
!2254 = !DILocation(line: 232, column: 21, scope: !2070)
!2255 = !DILocation(line: 301, column: 17, scope: !2070)
!2256 = !DILocation(line: 302, column: 19, scope: !2070)
!2257 = !DILocation(line: 315, column: 28, scope: !2070)
!2258 = !DILocation(line: 315, column: 33, scope: !2070)
!2259 = !DILocation(line: 315, column: 25, scope: !2070)
!2260 = !DILocation(line: 230, column: 22, scope: !2070)
!2261 = !DILocation(line: 230, column: 21, scope: !2070)
!2262 = !DILocation(line: 307, column: 17, scope: !2070)
!2263 = !DILocation(line: 308, column: 19, scope: !2070)
!2264 = !DILocation(line: 314, column: 28, scope: !2070)
!2265 = !DILocation(line: 314, column: 33, scope: !2070)
!2266 = !DILocation(line: 314, column: 25, scope: !2070)
!2267 = !DILocation(line: 234, column: 22, scope: !2070)
!2268 = !DILocation(line: 234, column: 21, scope: !2070)
!2269 = !DILocation(line: 305, column: 17, scope: !2070)
!2270 = !DILocation(line: 306, column: 19, scope: !2070)
!2271 = !DILocation(line: 313, column: 28, scope: !2070)
!2272 = !DILocation(line: 313, column: 33, scope: !2070)
!2273 = !DILocation(line: 313, column: 25, scope: !2070)
!2274 = !DILocation(line: 312, column: 28, scope: !2070)
!2275 = !DILocation(line: 312, column: 33, scope: !2070)
!2276 = !DILocation(line: 312, column: 25, scope: !2070)
!2277 = !DILocation(line: 311, column: 28, scope: !2070)
!2278 = !DILocation(line: 311, column: 33, scope: !2070)
!2279 = !DILocation(line: 311, column: 25, scope: !2070)
!2280 = !DILocation(line: 293, column: 17, scope: !2070)
!2281 = !DILocation(line: 294, column: 19, scope: !2070)
!2282 = !DILocation(line: 287, column: 17, scope: !2070)
!2283 = !DILocation(line: 288, column: 19, scope: !2070)
!2284 = !DILocation(line: 285, column: 17, scope: !2070)
!2285 = !DILocation(line: 286, column: 19, scope: !2070)
!2286 = !DILocation(line: 299, column: 28, scope: !2070)
!2287 = !DILocation(line: 299, column: 33, scope: !2070)
!2288 = !DILocation(line: 299, column: 25, scope: !2070)
!2289 = !DILocation(line: 291, column: 17, scope: !2070)
!2290 = !DILocation(line: 292, column: 19, scope: !2070)
!2291 = !DILocation(line: 298, column: 28, scope: !2070)
!2292 = !DILocation(line: 298, column: 33, scope: !2070)
!2293 = !DILocation(line: 298, column: 25, scope: !2070)
!2294 = !DILocation(line: 289, column: 17, scope: !2070)
!2295 = !DILocation(line: 290, column: 19, scope: !2070)
!2296 = !DILocation(line: 297, column: 28, scope: !2070)
!2297 = !DILocation(line: 297, column: 33, scope: !2070)
!2298 = !DILocation(line: 297, column: 25, scope: !2070)
!2299 = !DILocation(line: 296, column: 28, scope: !2070)
!2300 = !DILocation(line: 296, column: 33, scope: !2070)
!2301 = !DILocation(line: 296, column: 25, scope: !2070)
!2302 = !DILocation(line: 295, column: 28, scope: !2070)
!2303 = !DILocation(line: 295, column: 33, scope: !2070)
!2304 = !DILocation(line: 295, column: 25, scope: !2070)
!2305 = !DILocation(line: 277, column: 17, scope: !2070)
!2306 = !DILocation(line: 278, column: 19, scope: !2070)
!2307 = !DILocation(line: 271, column: 17, scope: !2070)
!2308 = !DILocation(line: 272, column: 19, scope: !2070)
!2309 = !DILocation(line: 269, column: 17, scope: !2070)
!2310 = !DILocation(line: 270, column: 19, scope: !2070)
!2311 = !DILocation(line: 283, column: 28, scope: !2070)
!2312 = !DILocation(line: 283, column: 33, scope: !2070)
!2313 = !DILocation(line: 283, column: 25, scope: !2070)
!2314 = !DILocation(line: 275, column: 17, scope: !2070)
!2315 = !DILocation(line: 276, column: 19, scope: !2070)
!2316 = !DILocation(line: 282, column: 28, scope: !2070)
!2317 = !DILocation(line: 282, column: 33, scope: !2070)
!2318 = !DILocation(line: 282, column: 25, scope: !2070)
!2319 = !DILocation(line: 273, column: 17, scope: !2070)
!2320 = !DILocation(line: 274, column: 19, scope: !2070)
!2321 = !DILocation(line: 281, column: 28, scope: !2070)
!2322 = !DILocation(line: 281, column: 33, scope: !2070)
!2323 = !DILocation(line: 281, column: 25, scope: !2070)
!2324 = !DILocation(line: 280, column: 28, scope: !2070)
!2325 = !DILocation(line: 280, column: 33, scope: !2070)
!2326 = !DILocation(line: 280, column: 25, scope: !2070)
!2327 = !DILocation(line: 279, column: 28, scope: !2070)
!2328 = !DILocation(line: 279, column: 33, scope: !2070)
!2329 = !DILocation(line: 279, column: 25, scope: !2070)
!2330 = !DILocation(line: 261, column: 17, scope: !2070)
!2331 = !DILocation(line: 262, column: 19, scope: !2070)
!2332 = !DILocation(line: 255, column: 17, scope: !2070)
!2333 = !DILocation(line: 256, column: 19, scope: !2070)
!2334 = !DILocation(line: 253, column: 17, scope: !2070)
!2335 = !DILocation(line: 254, column: 19, scope: !2070)
!2336 = !DILocation(line: 267, column: 28, scope: !2070)
!2337 = !DILocation(line: 267, column: 33, scope: !2070)
!2338 = !DILocation(line: 267, column: 25, scope: !2070)
!2339 = !DILocation(line: 259, column: 17, scope: !2070)
!2340 = !DILocation(line: 260, column: 19, scope: !2070)
!2341 = !DILocation(line: 266, column: 28, scope: !2070)
!2342 = !DILocation(line: 266, column: 33, scope: !2070)
!2343 = !DILocation(line: 266, column: 25, scope: !2070)
!2344 = !DILocation(line: 257, column: 17, scope: !2070)
!2345 = !DILocation(line: 258, column: 19, scope: !2070)
!2346 = !DILocation(line: 265, column: 28, scope: !2070)
!2347 = !DILocation(line: 265, column: 33, scope: !2070)
!2348 = !DILocation(line: 265, column: 25, scope: !2070)
!2349 = !DILocation(line: 264, column: 28, scope: !2070)
!2350 = !DILocation(line: 264, column: 33, scope: !2070)
!2351 = !DILocation(line: 264, column: 25, scope: !2070)
!2352 = !DILocation(line: 263, column: 28, scope: !2070)
!2353 = !DILocation(line: 263, column: 33, scope: !2070)
!2354 = !DILocation(line: 263, column: 25, scope: !2070)
!2355 = !DILocation(line: 244, column: 17, scope: !2070)
!2356 = !DILocation(line: 245, column: 19, scope: !2070)
!2357 = !DILocation(line: 238, column: 17, scope: !2070)
!2358 = !DILocation(line: 239, column: 19, scope: !2070)
!2359 = !DILocation(line: 236, column: 17, scope: !2070)
!2360 = !DILocation(line: 251, column: 28, scope: !2070)
!2361 = !DILocation(line: 251, column: 33, scope: !2070)
!2362 = !DILocation(line: 251, column: 25, scope: !2070)
!2363 = !DILocation(line: 242, column: 17, scope: !2070)
!2364 = !DILocation(line: 243, column: 19, scope: !2070)
!2365 = !DILocation(line: 250, column: 28, scope: !2070)
!2366 = !DILocation(line: 250, column: 33, scope: !2070)
!2367 = !DILocation(line: 250, column: 25, scope: !2070)
!2368 = !DILocation(line: 240, column: 17, scope: !2070)
!2369 = !DILocation(line: 241, column: 19, scope: !2070)
!2370 = !DILocation(line: 249, column: 28, scope: !2070)
!2371 = !DILocation(line: 249, column: 33, scope: !2070)
!2372 = !DILocation(line: 249, column: 25, scope: !2070)
!2373 = !DILocation(line: 248, column: 28, scope: !2070)
!2374 = !DILocation(line: 248, column: 33, scope: !2070)
!2375 = !DILocation(line: 248, column: 25, scope: !2070)
!2376 = !DILocation(line: 247, column: 58, scope: !2070)
!2377 = !DILocation(line: 247, column: 30, scope: !2070)
!2378 = !DILocation(line: 246, column: 28, scope: !2070)
!2379 = !DILocation(line: 246, column: 33, scope: !2070)
!2380 = !DILocation(line: 247, column: 17, scope: !2070)
!2381 = !DILocation(line: 126, column: 47, scope: !2032)
!2382 = !DILocation(line: 126, column: 9, scope: !2032)
!2383 = distinct !{!2383, !2033, !2384, !130}
!2384 = !DILocation(line: 316, column: 9, scope: !2029)
!2385 = !DILocation(line: 319, column: 19, scope: !1974)
!2386 = !DILocation(line: 320, column: 9, scope: !1974)
!2387 = !DILocation(line: 320, column: 19, scope: !1974)
!2388 = !DILocation(line: 321, column: 9, scope: !1974)
!2389 = !DILocation(line: 321, column: 19, scope: !1974)
!2390 = !DILocation(line: 322, column: 9, scope: !1974)
!2391 = !DILocation(line: 322, column: 19, scope: !1974)
!2392 = !DILocation(line: 323, column: 9, scope: !1974)
!2393 = !DILocation(line: 323, column: 19, scope: !1974)
!2394 = !DILocation(line: 324, column: 9, scope: !1974)
!2395 = !DILocation(line: 324, column: 19, scope: !1974)
!2396 = !DILocation(line: 325, column: 9, scope: !1974)
!2397 = !DILocation(line: 325, column: 19, scope: !1974)
!2398 = !DILocation(line: 326, column: 9, scope: !1974)
!2399 = !DILocation(line: 326, column: 19, scope: !1974)
!2400 = !DILocation(line: 327, column: 9, scope: !1974)
!2401 = !DILocation(line: 327, column: 19, scope: !1974)
!2402 = !DILocation(line: 328, column: 9, scope: !1974)
!2403 = !DILocation(line: 328, column: 19, scope: !1974)
!2404 = !DILocation(line: 329, column: 9, scope: !1974)
!2405 = !DILocation(line: 329, column: 19, scope: !1974)
!2406 = !DILocation(line: 330, column: 9, scope: !1974)
!2407 = !DILocation(line: 330, column: 19, scope: !1974)
!2408 = !DILocation(line: 331, column: 9, scope: !1974)
!2409 = !DILocation(line: 331, column: 19, scope: !1974)
!2410 = !DILocation(line: 332, column: 9, scope: !1974)
!2411 = !DILocation(line: 332, column: 19, scope: !1974)
!2412 = !DILocation(line: 333, column: 9, scope: !1974)
!2413 = !DILocation(line: 333, column: 19, scope: !1974)
!2414 = !DILocation(line: 334, column: 9, scope: !1974)
!2415 = !DILocation(line: 334, column: 19, scope: !1974)
!2416 = !DILocation(line: 335, column: 9, scope: !1974)
!2417 = !DILocation(line: 335, column: 19, scope: !1974)
!2418 = !DILocation(line: 336, column: 9, scope: !1974)
!2419 = !DILocation(line: 336, column: 19, scope: !1974)
!2420 = !DILocation(line: 337, column: 9, scope: !1974)
!2421 = !DILocation(line: 337, column: 19, scope: !1974)
!2422 = !DILocation(line: 338, column: 9, scope: !1974)
!2423 = !DILocation(line: 338, column: 19, scope: !1974)
!2424 = !DILocation(line: 339, column: 9, scope: !1974)
!2425 = !DILocation(line: 339, column: 19, scope: !1974)
!2426 = !DILocation(line: 340, column: 9, scope: !1974)
!2427 = !DILocation(line: 340, column: 19, scope: !1974)
!2428 = !DILocation(line: 341, column: 9, scope: !1974)
!2429 = !DILocation(line: 341, column: 19, scope: !1974)
!2430 = !DILocation(line: 342, column: 9, scope: !1974)
!2431 = !DILocation(line: 342, column: 19, scope: !1974)
!2432 = !DILocation(line: 343, column: 9, scope: !1974)
!2433 = !DILocation(line: 343, column: 19, scope: !1974)
!2434 = !DILocation(line: 344, column: 1, scope: !1974)
!2435 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !1873, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2436 = !DILocalVariable(name: "state", arg: 1, scope: !2435, file: !74, line: 550, type: !1875)
!2437 = !DILocation(line: 0, scope: !2435)
!2438 = !DILocation(line: 552, column: 36, scope: !2435)
!2439 = !DILocation(line: 552, column: 3, scope: !2435)
!2440 = !DILocation(line: 553, column: 10, scope: !2435)
!2441 = !DILocation(line: 553, column: 14, scope: !2435)
!2442 = !DILocation(line: 554, column: 1, scope: !2435)
!2443 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !2444, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2444 = !DISubroutineType(types: !2445)
!2445 = !{null, !1890, !40, !40, !33}
!2446 = !DILocalVariable(name: "s", arg: 1, scope: !2443, file: !74, line: 405, type: !1890)
!2447 = !DILocation(line: 0, scope: !2443)
!2448 = !DILocalVariable(name: "pos", arg: 2, scope: !2443, file: !74, line: 405, type: !40)
!2449 = !DILocalVariable(name: "r", arg: 3, scope: !2443, file: !74, line: 405, type: !40)
!2450 = !DILocalVariable(name: "p", arg: 4, scope: !2443, file: !74, line: 405, type: !33)
!2451 = !DILocation(line: 407, column: 15, scope: !2443)
!2452 = !DILocation(line: 407, column: 31, scope: !2443)
!2453 = !DILocation(line: 407, column: 27, scope: !2443)
!2454 = !DILocation(line: 407, column: 8, scope: !2443)
!2455 = !DILocation(line: 407, column: 3, scope: !2443)
!2456 = !DILocation(line: 407, column: 12, scope: !2443)
!2457 = !DILocation(line: 408, column: 6, scope: !2443)
!2458 = !DILocation(line: 408, column: 3, scope: !2443)
!2459 = !DILocation(line: 408, column: 12, scope: !2443)
!2460 = !DILocation(line: 409, column: 1, scope: !2443)
!2461 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !2462, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2462 = !DISubroutineType(types: !2463)
!2463 = !{null, !32, !38, !1875}
!2464 = !DILocalVariable(name: "out", arg: 1, scope: !2461, file: !74, line: 566, type: !32)
!2465 = !DILocation(line: 0, scope: !2461)
!2466 = !DILocalVariable(name: "outlen", arg: 2, scope: !2461, file: !74, line: 566, type: !38)
!2467 = !DILocalVariable(name: "state", arg: 3, scope: !2461, file: !74, line: 566, type: !1875)
!2468 = !DILocation(line: 568, column: 61, scope: !2461)
!2469 = !DILocation(line: 568, column: 16, scope: !2461)
!2470 = !DILocation(line: 568, column: 10, scope: !2461)
!2471 = !DILocation(line: 568, column: 14, scope: !2461)
!2472 = !DILocation(line: 569, column: 1, scope: !2461)
!2473 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !2474, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2474 = !DISubroutineType(types: !2475)
!2475 = !{!40, !32, !38, !1890, !40, !40}
!2476 = !DILocalVariable(name: "out", arg: 1, scope: !2473, file: !74, line: 426, type: !32)
!2477 = !DILocation(line: 0, scope: !2473)
!2478 = !DILocalVariable(name: "outlen", arg: 2, scope: !2473, file: !74, line: 427, type: !38)
!2479 = !DILocalVariable(name: "s", arg: 3, scope: !2473, file: !74, line: 428, type: !1890)
!2480 = !DILocalVariable(name: "pos", arg: 4, scope: !2473, file: !74, line: 429, type: !40)
!2481 = !DILocalVariable(name: "r", arg: 5, scope: !2473, file: !74, line: 430, type: !40)
!2482 = !DILocation(line: 434, column: 3, scope: !2473)
!2483 = !DILocation(line: 435, column: 12, scope: !2484)
!2484 = distinct !DILexicalBlock(scope: !2485, file: !74, line: 435, column: 8)
!2485 = distinct !DILexicalBlock(scope: !2473, file: !74, line: 434, column: 17)
!2486 = !DILocation(line: 436, column: 7, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2484, file: !74, line: 435, column: 18)
!2488 = !DILocation(line: 438, column: 5, scope: !2487)
!2489 = !DILocalVariable(name: "i", scope: !2473, file: !74, line: 432, type: !40)
!2490 = !DILocation(line: 439, column: 9, scope: !2491)
!2491 = distinct !DILexicalBlock(scope: !2485, file: !74, line: 439, column: 5)
!2492 = !DILocation(line: 439, scope: !2491)
!2493 = !DILocation(line: 439, column: 17, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2491, file: !74, line: 439, column: 5)
!2495 = !DILocation(line: 439, column: 21, scope: !2494)
!2496 = !DILocation(line: 439, column: 5, scope: !2491)
!2497 = !DILocation(line: 440, column: 19, scope: !2494)
!2498 = !DILocation(line: 440, column: 16, scope: !2494)
!2499 = !DILocation(line: 440, column: 27, scope: !2494)
!2500 = !DILocation(line: 440, column: 23, scope: !2494)
!2501 = !DILocation(line: 440, column: 14, scope: !2494)
!2502 = !DILocation(line: 440, column: 11, scope: !2494)
!2503 = !DILocation(line: 439, column: 41, scope: !2494)
!2504 = !DILocation(line: 439, column: 5, scope: !2494)
!2505 = distinct !{!2505, !2496, !2506, !130}
!2506 = !DILocation(line: 440, column: 32, scope: !2491)
!2507 = !DILocation(line: 441, column: 16, scope: !2485)
!2508 = !DILocation(line: 441, column: 12, scope: !2485)
!2509 = distinct !{!2509, !2482, !2510, !130}
!2510 = !DILocation(line: 443, column: 3, scope: !2473)
!2511 = !DILocation(line: 445, column: 3, scope: !2473)
!2512 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !1908, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2513 = !DILocalVariable(name: "state", arg: 1, scope: !2512, file: !74, line: 580, type: !1875)
!2514 = !DILocation(line: 0, scope: !2512)
!2515 = !DILocalVariable(name: "in", arg: 2, scope: !2512, file: !74, line: 580, type: !275)
!2516 = !DILocalVariable(name: "inlen", arg: 3, scope: !2512, file: !74, line: 580, type: !38)
!2517 = !DILocation(line: 582, column: 3, scope: !2512)
!2518 = !DILocation(line: 583, column: 10, scope: !2512)
!2519 = !DILocation(line: 583, column: 14, scope: !2512)
!2520 = !DILocation(line: 584, column: 1, scope: !2512)
!2521 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !2522, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2522 = !DISubroutineType(types: !2523)
!2523 = !{null, !1890, !40, !275, !38, !33}
!2524 = !DILocalVariable(name: "s", arg: 1, scope: !2521, file: !74, line: 461, type: !1890)
!2525 = !DILocation(line: 0, scope: !2521)
!2526 = !DILocalVariable(name: "r", arg: 2, scope: !2521, file: !74, line: 462, type: !40)
!2527 = !DILocalVariable(name: "in", arg: 3, scope: !2521, file: !74, line: 463, type: !275)
!2528 = !DILocalVariable(name: "inlen", arg: 4, scope: !2521, file: !74, line: 464, type: !38)
!2529 = !DILocalVariable(name: "p", arg: 5, scope: !2521, file: !74, line: 465, type: !33)
!2530 = !DILocalVariable(name: "i", scope: !2521, file: !74, line: 467, type: !40)
!2531 = !DILocation(line: 469, column: 7, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2521, file: !74, line: 469, column: 3)
!2533 = !DILocation(line: 469, scope: !2532)
!2534 = !DILocation(line: 469, column: 12, scope: !2535)
!2535 = distinct !DILexicalBlock(scope: !2532, file: !74, line: 469, column: 3)
!2536 = !DILocation(line: 469, column: 3, scope: !2532)
!2537 = !DILocation(line: 472, column: 3, scope: !2521)
!2538 = !DILocation(line: 470, column: 5, scope: !2535)
!2539 = !DILocation(line: 470, column: 10, scope: !2535)
!2540 = !DILocation(line: 469, column: 17, scope: !2535)
!2541 = !DILocation(line: 469, column: 3, scope: !2535)
!2542 = distinct !{!2542, !2536, !2543, !130}
!2543 = !DILocation(line: 470, column: 12, scope: !2532)
!2544 = !DILocation(line: 472, column: 15, scope: !2521)
!2545 = !DILocation(line: 473, column: 5, scope: !2546)
!2546 = distinct !DILexicalBlock(scope: !2547, file: !74, line: 473, column: 5)
!2547 = distinct !DILexicalBlock(scope: !2521, file: !74, line: 472, column: 21)
!2548 = !DILocation(line: 480, column: 3, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2521, file: !74, line: 480, column: 3)
!2550 = !DILocation(line: 473, scope: !2546)
!2551 = !DILocation(line: 473, column: 14, scope: !2552)
!2552 = distinct !DILexicalBlock(scope: !2546, file: !74, line: 473, column: 5)
!2553 = !DILocation(line: 474, column: 26, scope: !2552)
!2554 = !DILocation(line: 474, column: 24, scope: !2552)
!2555 = !DILocation(line: 474, column: 15, scope: !2552)
!2556 = !DILocation(line: 474, column: 7, scope: !2552)
!2557 = !DILocation(line: 474, column: 12, scope: !2552)
!2558 = !DILocation(line: 473, column: 20, scope: !2552)
!2559 = !DILocation(line: 473, column: 5, scope: !2552)
!2560 = distinct !{!2560, !2545, !2561, !130}
!2561 = !DILocation(line: 474, column: 28, scope: !2546)
!2562 = !DILocation(line: 475, column: 8, scope: !2547)
!2563 = !DILocation(line: 476, column: 11, scope: !2547)
!2564 = !DILocation(line: 477, column: 5, scope: !2547)
!2565 = distinct !{!2565, !2537, !2566, !130}
!2566 = !DILocation(line: 478, column: 3, scope: !2521)
!2567 = !DILocation(line: 480, scope: !2549)
!2568 = !DILocation(line: 480, column: 12, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2549, file: !74, line: 480, column: 3)
!2570 = !DILocation(line: 481, column: 25, scope: !2569)
!2571 = !DILocation(line: 481, column: 15, scope: !2569)
!2572 = !DILocation(line: 481, column: 35, scope: !2569)
!2573 = !DILocation(line: 481, column: 31, scope: !2569)
!2574 = !DILocation(line: 481, column: 8, scope: !2569)
!2575 = !DILocation(line: 481, column: 5, scope: !2569)
!2576 = !DILocation(line: 481, column: 12, scope: !2569)
!2577 = !DILocation(line: 480, column: 20, scope: !2569)
!2578 = !DILocation(line: 480, column: 3, scope: !2569)
!2579 = distinct !{!2579, !2548, !2580, !130}
!2580 = !DILocation(line: 481, column: 40, scope: !2549)
!2581 = !DILocation(line: 483, column: 13, scope: !2521)
!2582 = !DILocation(line: 483, column: 29, scope: !2521)
!2583 = !DILocation(line: 483, column: 25, scope: !2521)
!2584 = !DILocation(line: 483, column: 6, scope: !2521)
!2585 = !DILocation(line: 483, column: 3, scope: !2521)
!2586 = !DILocation(line: 483, column: 10, scope: !2521)
!2587 = !DILocation(line: 484, column: 7, scope: !2521)
!2588 = !DILocation(line: 484, column: 10, scope: !2521)
!2589 = !DILocation(line: 484, column: 3, scope: !2521)
!2590 = !DILocation(line: 484, column: 14, scope: !2521)
!2591 = !DILocation(line: 485, column: 1, scope: !2521)
!2592 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2593, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2593 = !DISubroutineType(types: !2594)
!2594 = !{!70, !275}
!2595 = !DILocalVariable(name: "x", arg: 1, scope: !2592, file: !74, line: 22, type: !275)
!2596 = !DILocation(line: 0, scope: !2592)
!2597 = !DILocalVariable(name: "r", scope: !2592, file: !74, line: 24, type: !70)
!2598 = !DILocalVariable(name: "i", scope: !2592, file: !74, line: 23, type: !40)
!2599 = !DILocation(line: 26, column: 7, scope: !2600)
!2600 = distinct !DILexicalBlock(scope: !2592, file: !74, line: 26, column: 3)
!2601 = !DILocation(line: 26, scope: !2600)
!2602 = !DILocation(line: 26, column: 12, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2600, file: !74, line: 26, column: 3)
!2604 = !DILocation(line: 26, column: 3, scope: !2600)
!2605 = !DILocation(line: 27, column: 20, scope: !2603)
!2606 = !DILocation(line: 27, column: 10, scope: !2603)
!2607 = !DILocation(line: 27, column: 29, scope: !2603)
!2608 = !DILocation(line: 27, column: 25, scope: !2603)
!2609 = !DILocation(line: 27, column: 7, scope: !2603)
!2610 = !DILocation(line: 26, column: 16, scope: !2603)
!2611 = !DILocation(line: 26, column: 3, scope: !2603)
!2612 = distinct !{!2612, !2604, !2613, !130}
!2613 = !DILocation(line: 27, column: 30, scope: !2600)
!2614 = !DILocation(line: 29, column: 3, scope: !2592)
!2615 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !2462, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2616 = !DILocalVariable(name: "out", arg: 1, scope: !2615, file: !74, line: 598, type: !32)
!2617 = !DILocation(line: 0, scope: !2615)
!2618 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2615, file: !74, line: 598, type: !38)
!2619 = !DILocalVariable(name: "state", arg: 3, scope: !2615, file: !74, line: 598, type: !1875)
!2620 = !DILocation(line: 600, column: 3, scope: !2615)
!2621 = !DILocation(line: 601, column: 1, scope: !2615)
!2622 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !2623, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2623 = !DISubroutineType(types: !2624)
!2624 = !{null, !32, !38, !1890, !40}
!2625 = !DILocalVariable(name: "out", arg: 1, scope: !2622, file: !74, line: 500, type: !32)
!2626 = !DILocation(line: 0, scope: !2622)
!2627 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2622, file: !74, line: 501, type: !38)
!2628 = !DILocalVariable(name: "s", arg: 3, scope: !2622, file: !74, line: 502, type: !1890)
!2629 = !DILocalVariable(name: "r", arg: 4, scope: !2622, file: !74, line: 503, type: !40)
!2630 = !DILocation(line: 507, column: 3, scope: !2622)
!2631 = !DILocation(line: 508, column: 5, scope: !2632)
!2632 = distinct !DILexicalBlock(scope: !2622, file: !74, line: 507, column: 18)
!2633 = !DILocalVariable(name: "i", scope: !2622, file: !74, line: 505, type: !40)
!2634 = !DILocation(line: 509, column: 9, scope: !2635)
!2635 = distinct !DILexicalBlock(scope: !2632, file: !74, line: 509, column: 5)
!2636 = !DILocation(line: 509, scope: !2635)
!2637 = !DILocation(line: 509, column: 14, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2635, file: !74, line: 509, column: 5)
!2639 = !DILocation(line: 509, column: 5, scope: !2635)
!2640 = !DILocation(line: 510, column: 20, scope: !2638)
!2641 = !DILocation(line: 510, column: 18, scope: !2638)
!2642 = !DILocation(line: 510, column: 24, scope: !2638)
!2643 = !DILocation(line: 510, column: 7, scope: !2638)
!2644 = !DILocation(line: 509, column: 20, scope: !2638)
!2645 = !DILocation(line: 509, column: 5, scope: !2638)
!2646 = distinct !{!2646, !2639, !2647, !130}
!2647 = !DILocation(line: 510, column: 28, scope: !2635)
!2648 = !DILocation(line: 511, column: 9, scope: !2632)
!2649 = !DILocation(line: 512, column: 13, scope: !2632)
!2650 = distinct !{!2650, !2630, !2651, !130}
!2651 = !DILocation(line: 513, column: 3, scope: !2622)
!2652 = !DILocation(line: 514, column: 1, scope: !2622)
!2653 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !2654, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2654 = !DISubroutineType(types: !2655)
!2655 = !{null, !32, !70}
!2656 = !DILocalVariable(name: "x", arg: 1, scope: !2653, file: !74, line: 40, type: !32)
!2657 = !DILocation(line: 0, scope: !2653)
!2658 = !DILocalVariable(name: "u", arg: 2, scope: !2653, file: !74, line: 40, type: !70)
!2659 = !DILocalVariable(name: "i", scope: !2653, file: !74, line: 41, type: !40)
!2660 = !DILocation(line: 43, column: 7, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2653, file: !74, line: 43, column: 3)
!2662 = !DILocation(line: 43, scope: !2661)
!2663 = !DILocation(line: 43, column: 12, scope: !2664)
!2664 = distinct !DILexicalBlock(scope: !2661, file: !74, line: 43, column: 3)
!2665 = !DILocation(line: 43, column: 3, scope: !2661)
!2666 = !DILocation(line: 44, column: 18, scope: !2664)
!2667 = !DILocation(line: 44, column: 14, scope: !2664)
!2668 = !DILocation(line: 44, column: 12, scope: !2664)
!2669 = !DILocation(line: 44, column: 5, scope: !2664)
!2670 = !DILocation(line: 44, column: 10, scope: !2664)
!2671 = !DILocation(line: 43, column: 16, scope: !2664)
!2672 = !DILocation(line: 43, column: 3, scope: !2664)
!2673 = distinct !{!2673, !2665, !2674, !130}
!2674 = !DILocation(line: 44, column: 19, scope: !2661)
!2675 = !DILocation(line: 45, column: 1, scope: !2653)
!2676 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !1873, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2677 = !DILocalVariable(name: "state", arg: 1, scope: !2676, file: !74, line: 610, type: !1875)
!2678 = !DILocation(line: 0, scope: !2676)
!2679 = !DILocation(line: 612, column: 3, scope: !2676)
!2680 = !DILocation(line: 613, column: 10, scope: !2676)
!2681 = !DILocation(line: 613, column: 14, scope: !2676)
!2682 = !DILocation(line: 614, column: 1, scope: !2676)
!2683 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !1908, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2684 = !DILocalVariable(name: "state", arg: 1, scope: !2683, file: !74, line: 625, type: !1875)
!2685 = !DILocation(line: 0, scope: !2683)
!2686 = !DILocalVariable(name: "in", arg: 2, scope: !2683, file: !74, line: 625, type: !275)
!2687 = !DILocalVariable(name: "inlen", arg: 3, scope: !2683, file: !74, line: 625, type: !38)
!2688 = !DILocation(line: 627, column: 47, scope: !2683)
!2689 = !DILocation(line: 627, column: 16, scope: !2683)
!2690 = !DILocation(line: 627, column: 10, scope: !2683)
!2691 = !DILocation(line: 627, column: 14, scope: !2683)
!2692 = !DILocation(line: 628, column: 1, scope: !2683)
!2693 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !1873, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2694 = !DILocalVariable(name: "state", arg: 1, scope: !2693, file: !74, line: 637, type: !1875)
!2695 = !DILocation(line: 0, scope: !2693)
!2696 = !DILocation(line: 639, column: 36, scope: !2693)
!2697 = !DILocation(line: 639, column: 3, scope: !2693)
!2698 = !DILocation(line: 640, column: 10, scope: !2693)
!2699 = !DILocation(line: 640, column: 14, scope: !2693)
!2700 = !DILocation(line: 641, column: 1, scope: !2693)
!2701 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !2462, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2702 = !DILocalVariable(name: "out", arg: 1, scope: !2701, file: !74, line: 653, type: !32)
!2703 = !DILocation(line: 0, scope: !2701)
!2704 = !DILocalVariable(name: "outlen", arg: 2, scope: !2701, file: !74, line: 653, type: !38)
!2705 = !DILocalVariable(name: "state", arg: 3, scope: !2701, file: !74, line: 653, type: !1875)
!2706 = !DILocation(line: 655, column: 61, scope: !2701)
!2707 = !DILocation(line: 655, column: 16, scope: !2701)
!2708 = !DILocation(line: 655, column: 10, scope: !2701)
!2709 = !DILocation(line: 655, column: 14, scope: !2701)
!2710 = !DILocation(line: 656, column: 1, scope: !2701)
!2711 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !1908, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2712 = !DILocalVariable(name: "state", arg: 1, scope: !2711, file: !74, line: 667, type: !1875)
!2713 = !DILocation(line: 0, scope: !2711)
!2714 = !DILocalVariable(name: "in", arg: 2, scope: !2711, file: !74, line: 667, type: !275)
!2715 = !DILocalVariable(name: "inlen", arg: 3, scope: !2711, file: !74, line: 667, type: !38)
!2716 = !DILocation(line: 669, column: 3, scope: !2711)
!2717 = !DILocation(line: 670, column: 10, scope: !2711)
!2718 = !DILocation(line: 670, column: 14, scope: !2711)
!2719 = !DILocation(line: 671, column: 1, scope: !2711)
!2720 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !2462, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2721 = !DILocalVariable(name: "out", arg: 1, scope: !2720, file: !74, line: 685, type: !32)
!2722 = !DILocation(line: 0, scope: !2720)
!2723 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2720, file: !74, line: 685, type: !38)
!2724 = !DILocalVariable(name: "state", arg: 3, scope: !2720, file: !74, line: 685, type: !1875)
!2725 = !DILocation(line: 687, column: 3, scope: !2720)
!2726 = !DILocation(line: 688, column: 1, scope: !2720)
!2727 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !2728, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2728 = !DISubroutineType(types: !2729)
!2729 = !{null, !32, !38, !275, !38}
!2730 = !DILocalVariable(name: "out", arg: 1, scope: !2727, file: !74, line: 700, type: !32)
!2731 = !DILocation(line: 0, scope: !2727)
!2732 = !DILocalVariable(name: "outlen", arg: 2, scope: !2727, file: !74, line: 700, type: !38)
!2733 = !DILocalVariable(name: "in", arg: 3, scope: !2727, file: !74, line: 700, type: !275)
!2734 = !DILocalVariable(name: "inlen", arg: 4, scope: !2727, file: !74, line: 700, type: !38)
!2735 = !DILocalVariable(name: "state", scope: !2727, file: !74, line: 703, type: !1876)
!2736 = !DILocation(line: 703, column: 16, scope: !2727)
!2737 = !DILocation(line: 705, column: 3, scope: !2727)
!2738 = !DILocation(line: 706, column: 19, scope: !2727)
!2739 = !DILocalVariable(name: "nblocks", scope: !2727, file: !74, line: 702, type: !38)
!2740 = !DILocation(line: 707, column: 3, scope: !2727)
!2741 = !DILocation(line: 708, column: 20, scope: !2727)
!2742 = !DILocation(line: 708, column: 10, scope: !2727)
!2743 = !DILocation(line: 709, column: 17, scope: !2727)
!2744 = !DILocation(line: 709, column: 7, scope: !2727)
!2745 = !DILocation(line: 710, column: 3, scope: !2727)
!2746 = !DILocation(line: 711, column: 1, scope: !2727)
!2747 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !2728, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2748 = !DILocalVariable(name: "out", arg: 1, scope: !2747, file: !74, line: 723, type: !32)
!2749 = !DILocation(line: 0, scope: !2747)
!2750 = !DILocalVariable(name: "outlen", arg: 2, scope: !2747, file: !74, line: 723, type: !38)
!2751 = !DILocalVariable(name: "in", arg: 3, scope: !2747, file: !74, line: 723, type: !275)
!2752 = !DILocalVariable(name: "inlen", arg: 4, scope: !2747, file: !74, line: 723, type: !38)
!2753 = !DILocalVariable(name: "state", scope: !2747, file: !74, line: 726, type: !1876)
!2754 = !DILocation(line: 726, column: 16, scope: !2747)
!2755 = !DILocation(line: 728, column: 3, scope: !2747)
!2756 = !DILocation(line: 729, column: 19, scope: !2747)
!2757 = !DILocalVariable(name: "nblocks", scope: !2747, file: !74, line: 725, type: !38)
!2758 = !DILocation(line: 730, column: 3, scope: !2747)
!2759 = !DILocation(line: 731, column: 20, scope: !2747)
!2760 = !DILocation(line: 731, column: 10, scope: !2747)
!2761 = !DILocation(line: 732, column: 17, scope: !2747)
!2762 = !DILocation(line: 732, column: 7, scope: !2747)
!2763 = !DILocation(line: 733, column: 3, scope: !2747)
!2764 = !DILocation(line: 734, column: 1, scope: !2747)
!2765 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !2766, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2766 = !DISubroutineType(types: !2767)
!2767 = !{null, !32, !275, !38}
!2768 = !DILocalVariable(name: "h", arg: 1, scope: !2765, file: !74, line: 745, type: !32)
!2769 = !DILocation(line: 0, scope: !2765)
!2770 = !DILocalVariable(name: "in", arg: 2, scope: !2765, file: !74, line: 745, type: !275)
!2771 = !DILocalVariable(name: "inlen", arg: 3, scope: !2765, file: !74, line: 745, type: !38)
!2772 = !DILocalVariable(name: "s", scope: !2765, file: !74, line: 748, type: !398)
!2773 = !DILocation(line: 748, column: 12, scope: !2765)
!2774 = !DILocation(line: 750, column: 3, scope: !2765)
!2775 = !DILocation(line: 751, column: 3, scope: !2765)
!2776 = !DILocalVariable(name: "i", scope: !2765, file: !74, line: 747, type: !40)
!2777 = !DILocation(line: 752, column: 7, scope: !2778)
!2778 = distinct !DILexicalBlock(scope: !2765, file: !74, line: 752, column: 3)
!2779 = !DILocation(line: 752, scope: !2778)
!2780 = !DILocation(line: 752, column: 12, scope: !2781)
!2781 = distinct !DILexicalBlock(scope: !2778, file: !74, line: 752, column: 3)
!2782 = !DILocation(line: 752, column: 3, scope: !2778)
!2783 = !DILocation(line: 753, column: 16, scope: !2781)
!2784 = !DILocation(line: 753, column: 14, scope: !2781)
!2785 = !DILocation(line: 753, column: 19, scope: !2781)
!2786 = !DILocation(line: 753, column: 5, scope: !2781)
!2787 = !DILocation(line: 752, column: 16, scope: !2781)
!2788 = !DILocation(line: 752, column: 3, scope: !2781)
!2789 = distinct !{!2789, !2782, !2790, !130}
!2790 = !DILocation(line: 753, column: 23, scope: !2778)
!2791 = !DILocation(line: 754, column: 1, scope: !2765)
!2792 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !2766, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2793 = !DILocalVariable(name: "h", arg: 1, scope: !2792, file: !74, line: 765, type: !32)
!2794 = !DILocation(line: 0, scope: !2792)
!2795 = !DILocalVariable(name: "in", arg: 2, scope: !2792, file: !74, line: 765, type: !275)
!2796 = !DILocalVariable(name: "inlen", arg: 3, scope: !2792, file: !74, line: 765, type: !38)
!2797 = !DILocalVariable(name: "s", scope: !2792, file: !74, line: 768, type: !398)
!2798 = !DILocation(line: 768, column: 12, scope: !2792)
!2799 = !DILocation(line: 770, column: 3, scope: !2792)
!2800 = !DILocation(line: 771, column: 3, scope: !2792)
!2801 = !DILocalVariable(name: "i", scope: !2792, file: !74, line: 767, type: !40)
!2802 = !DILocation(line: 772, column: 7, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2792, file: !74, line: 772, column: 3)
!2804 = !DILocation(line: 772, scope: !2803)
!2805 = !DILocation(line: 772, column: 12, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2803, file: !74, line: 772, column: 3)
!2807 = !DILocation(line: 772, column: 3, scope: !2803)
!2808 = !DILocation(line: 773, column: 16, scope: !2806)
!2809 = !DILocation(line: 773, column: 14, scope: !2806)
!2810 = !DILocation(line: 773, column: 19, scope: !2806)
!2811 = !DILocation(line: 773, column: 5, scope: !2806)
!2812 = !DILocation(line: 772, column: 16, scope: !2806)
!2813 = !DILocation(line: 772, column: 3, scope: !2806)
!2814 = distinct !{!2814, !2807, !2815, !130}
!2815 = !DILocation(line: 773, column: 23, scope: !2803)
!2816 = !DILocation(line: 774, column: 1, scope: !2792)
!2817 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2818, file: !2818, line: 18, type: !2819, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2818 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2819 = !DISubroutineType(types: !2820)
!2820 = !{null, !2821, !275, !33, !33}
!2821 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2822, size: 32)
!2822 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !394, line: 17, baseType: !2823)
!2823 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !394, line: 14, size: 1664, elements: !2824)
!2824 = !{!2825, !2826}
!2825 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2823, file: !394, line: 15, baseType: !398, size: 1600)
!2826 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2823, file: !394, line: 16, baseType: !40, size: 32, offset: 1600)
!2827 = !DILocalVariable(name: "state", arg: 1, scope: !2817, file: !2818, line: 18, type: !2821)
!2828 = !DILocation(line: 0, scope: !2817)
!2829 = !DILocalVariable(name: "seed", arg: 2, scope: !2817, file: !2818, line: 19, type: !275)
!2830 = !DILocalVariable(name: "x", arg: 3, scope: !2817, file: !2818, line: 20, type: !33)
!2831 = !DILocalVariable(name: "y", arg: 4, scope: !2817, file: !2818, line: 21, type: !33)
!2832 = !DILocalVariable(name: "extseed", scope: !2817, file: !2818, line: 23, type: !2833)
!2833 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !2834)
!2834 = !{!2835}
!2835 = !DISubrange(count: 34)
!2836 = !DILocation(line: 23, column: 11, scope: !2817)
!2837 = !DILocation(line: 25, column: 3, scope: !2817)
!2838 = !DILocation(line: 26, column: 3, scope: !2817)
!2839 = !DILocation(line: 26, column: 29, scope: !2817)
!2840 = !DILocation(line: 27, column: 3, scope: !2817)
!2841 = !DILocation(line: 27, column: 29, scope: !2817)
!2842 = !DILocation(line: 29, column: 3, scope: !2817)
!2843 = !DILocation(line: 30, column: 1, scope: !2817)
!2844 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2818, file: !2818, line: 43, type: !2845, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2845 = !DISubroutineType(types: !2846)
!2846 = !{null, !32, !38, !275, !33}
!2847 = !DILocalVariable(name: "out", arg: 1, scope: !2844, file: !2818, line: 43, type: !32)
!2848 = !DILocation(line: 0, scope: !2844)
!2849 = !DILocalVariable(name: "outlen", arg: 2, scope: !2844, file: !2818, line: 43, type: !38)
!2850 = !DILocalVariable(name: "key", arg: 3, scope: !2844, file: !2818, line: 43, type: !275)
!2851 = !DILocalVariable(name: "nonce", arg: 4, scope: !2844, file: !2818, line: 43, type: !33)
!2852 = !DILocalVariable(name: "extkey", scope: !2844, file: !2818, line: 45, type: !2853)
!2853 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !2854)
!2854 = !{!2855}
!2855 = !DISubrange(count: 33)
!2856 = !DILocation(line: 45, column: 11, scope: !2844)
!2857 = !DILocation(line: 47, column: 3, scope: !2844)
!2858 = !DILocation(line: 48, column: 3, scope: !2844)
!2859 = !DILocation(line: 48, column: 26, scope: !2844)
!2860 = !DILocation(line: 50, column: 3, scope: !2844)
!2861 = !DILocation(line: 51, column: 1, scope: !2844)
!2862 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2818, file: !2818, line: 64, type: !692, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2863 = !DILocalVariable(name: "out", arg: 1, scope: !2862, file: !2818, line: 64, type: !32)
!2864 = !DILocation(line: 0, scope: !2862)
!2865 = !DILocalVariable(name: "key", arg: 2, scope: !2862, file: !2818, line: 64, type: !275)
!2866 = !DILocalVariable(name: "input", arg: 3, scope: !2862, file: !2818, line: 64, type: !275)
!2867 = !DILocalVariable(name: "s", scope: !2862, file: !2818, line: 66, type: !2822)
!2868 = !DILocation(line: 66, column: 16, scope: !2862)
!2869 = !DILocation(line: 68, column: 3, scope: !2862)
!2870 = !DILocation(line: 69, column: 3, scope: !2862)
!2871 = !DILocation(line: 70, column: 3, scope: !2862)
!2872 = !DILocation(line: 71, column: 3, scope: !2862)
!2873 = !DILocation(line: 72, column: 3, scope: !2862)
!2874 = !DILocation(line: 73, column: 1, scope: !2862)
